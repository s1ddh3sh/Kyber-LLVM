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
@pqcrystals_kyber1024_ref_zetas = dso_local local_unnamed_addr constant [128 x i16] [i16 -1044, i16 -758, i16 -359, i16 -1517, i16 1493, i16 1422, i16 287, i16 202, i16 -171, i16 622, i16 1577, i16 182, i16 962, i16 -1202, i16 -1474, i16 1468, i16 573, i16 -1325, i16 264, i16 383, i16 -829, i16 1458, i16 -1602, i16 -130, i16 -681, i16 1017, i16 732, i16 608, i16 -1542, i16 411, i16 -205, i16 -1571, i16 1223, i16 652, i16 -552, i16 1015, i16 -1293, i16 1491, i16 -282, i16 -1544, i16 516, i16 -8, i16 -320, i16 -666, i16 -1618, i16 -1162, i16 126, i16 1469, i16 -853, i16 -90, i16 -271, i16 830, i16 107, i16 -1421, i16 -247, i16 -951, i16 -398, i16 961, i16 -1508, i16 -725, i16 448, i16 -1065, i16 677, i16 -1275, i16 -1103, i16 430, i16 555, i16 843, i16 -1251, i16 871, i16 1550, i16 105, i16 422, i16 587, i16 177, i16 -235, i16 -291, i16 -460, i16 1574, i16 1653, i16 -246, i16 778, i16 1159, i16 -147, i16 -777, i16 1483, i16 -602, i16 1119, i16 -1590, i16 644, i16 -872, i16 349, i16 418, i16 329, i16 -156, i16 -75, i16 817, i16 1097, i16 603, i16 610, i16 1322, i16 -1285, i16 -1465, i16 384, i16 -1215, i16 -136, i16 1218, i16 -1335, i16 -874, i16 220, i16 -1187, i16 -1659, i16 -1185, i16 -1530, i16 -1278, i16 794, i16 -1510, i16 -854, i16 -870, i16 478, i16 -108, i16 -308, i16 996, i16 991, i16 958, i16 -1460, i16 1522, i16 1628], align 2, !dbg !51
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
  %call4 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str, i32 noundef 3168) #4, !dbg !131
  %call5 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.1, i32 noundef 1568) #4, !dbg !132
  %call6 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.2, i32 noundef 1568) #4, !dbg !133
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
  %pk = alloca [1568 x i8], align 1
  %sk = alloca [3168 x i8], align 1
  %ct = alloca [1568 x i8], align 1
  %key_a = alloca [32 x i8], align 1
  %key_b = alloca [32 x i8], align 1
    #dbg_declare(ptr %pk, !137, !DIExpression(), !141)
    #dbg_declare(ptr %sk, !142, !DIExpression(), !146)
    #dbg_declare(ptr %ct, !147, !DIExpression(), !148)
    #dbg_declare(ptr %key_a, !149, !DIExpression(), !153)
    #dbg_declare(ptr %key_b, !154, !DIExpression(), !155)
  %call = call i32 @pqcrystals_kyber1024_ref_keypair(ptr noundef nonnull %pk, ptr noundef nonnull %sk) #3, !dbg !156
  %call5 = call i32 @pqcrystals_kyber1024_ref_enc(ptr noundef nonnull %ct, ptr noundef nonnull %key_b, ptr noundef nonnull %pk) #3, !dbg !157
  %call9 = call i32 @pqcrystals_kyber1024_ref_dec(ptr noundef nonnull %key_a, ptr noundef nonnull %ct, ptr noundef nonnull %sk) #3, !dbg !158
  %call12 = call i32 @memcmp(ptr noundef nonnull %key_a, ptr noundef nonnull %key_b, i32 noundef 32) #4, !dbg !159
  %tobool.not = icmp eq i32 %call12, 0, !dbg !159
  br i1 %tobool.not, label %return, label %if.then, !dbg !159

if.then:                                          ; preds = %entry
  %call13 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.3) #4, !dbg !161
  br label %return, !dbg !163

return:                                           ; preds = %entry, %if.then
  %retval.0 = phi i32 [ 1, %if.then ], [ 0, %entry ], !dbg !164
  ret i32 %retval.0, !dbg !165
}

; Function Attrs: nounwind
define internal fastcc range(i32 0, 2) i32 @test_invalid_sk_a() unnamed_addr #0 !dbg !166 {
entry:
  %pk = alloca [1568 x i8], align 1
  %sk = alloca [3168 x i8], align 1
  %ct = alloca [1568 x i8], align 1
  %key_a = alloca [32 x i8], align 1
  %key_b = alloca [32 x i8], align 1
    #dbg_declare(ptr %pk, !167, !DIExpression(), !168)
    #dbg_declare(ptr %sk, !169, !DIExpression(), !170)
    #dbg_declare(ptr %ct, !171, !DIExpression(), !172)
    #dbg_declare(ptr %key_a, !173, !DIExpression(), !174)
    #dbg_declare(ptr %key_b, !175, !DIExpression(), !176)
  %call = call i32 @pqcrystals_kyber1024_ref_keypair(ptr noundef nonnull %pk, ptr noundef nonnull %sk) #3, !dbg !177
  %call5 = call i32 @pqcrystals_kyber1024_ref_enc(ptr noundef nonnull %ct, ptr noundef nonnull %key_b, ptr noundef nonnull %pk) #3, !dbg !178
  call void @randombytes(ptr noundef nonnull %sk, i32 noundef 3168) #3, !dbg !179
  %call10 = call i32 @pqcrystals_kyber1024_ref_dec(ptr noundef nonnull %key_a, ptr noundef nonnull %ct, ptr noundef nonnull %sk) #3, !dbg !180
  %call13 = call i32 @memcmp(ptr noundef nonnull %key_a, ptr noundef nonnull %key_b, i32 noundef 32) #4, !dbg !181
  %tobool.not = icmp eq i32 %call13, 0, !dbg !181
  br i1 %tobool.not, label %if.then, label %return, !dbg !183

if.then:                                          ; preds = %entry
  %call14 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.4) #4, !dbg !184
  br label %return, !dbg !186

return:                                           ; preds = %entry, %if.then
  %retval.0 = phi i32 [ 1, %if.then ], [ 0, %entry ], !dbg !187
  ret i32 %retval.0, !dbg !188
}

; Function Attrs: nounwind
define internal fastcc range(i32 0, 2) i32 @test_invalid_ciphertext() unnamed_addr #0 !dbg !189 {
entry:
  %pk = alloca [1568 x i8], align 1
  %sk = alloca [3168 x i8], align 1
  %ct = alloca [1568 x i8], align 1
  %key_a = alloca [32 x i8], align 1
  %key_b = alloca [32 x i8], align 1
  %b = alloca i8, align 1
  %pos = alloca i32, align 4
    #dbg_declare(ptr %pk, !190, !DIExpression(), !191)
    #dbg_declare(ptr %sk, !192, !DIExpression(), !193)
    #dbg_declare(ptr %ct, !194, !DIExpression(), !195)
    #dbg_declare(ptr %key_a, !196, !DIExpression(), !197)
    #dbg_declare(ptr %key_b, !198, !DIExpression(), !199)
  br label %do.body, !dbg !200

do.body:                                          ; preds = %do.body, %entry
    #dbg_value(ptr %b, !201, !DIExpression(DW_OP_deref), !202)
  call void @randombytes(ptr noundef nonnull %b, i32 noundef 1) #3, !dbg !203
  %0 = load i8, ptr %b, align 1, !dbg !205
    #dbg_value(i8 %0, !201, !DIExpression(), !202)
  %tobool.not = icmp eq i8 %0, 0, !dbg !206
  br i1 %tobool.not, label %do.body, label %do.end, !dbg !207, !llvm.loop !208

do.end:                                           ; preds = %do.body
    #dbg_value(ptr %pos, !210, !DIExpression(DW_OP_deref), !202)
  call void @randombytes(ptr noundef nonnull %pos, i32 noundef 4) #3, !dbg !211
  %call = call i32 @pqcrystals_kyber1024_ref_keypair(ptr noundef nonnull %pk, ptr noundef nonnull %sk) #3, !dbg !212
  %call5 = call i32 @pqcrystals_kyber1024_ref_enc(ptr noundef nonnull %ct, ptr noundef nonnull %key_b, ptr noundef nonnull %pk) #3, !dbg !213
  %1 = load i8, ptr %b, align 1, !dbg !214
    #dbg_value(i8 %1, !201, !DIExpression(), !202)
  %2 = load i32, ptr %pos, align 4, !dbg !215
    #dbg_value(i32 %2, !210, !DIExpression(), !202)
  %rem = urem i32 %2, 1568, !dbg !216
  %arrayidx = getelementptr inbounds nuw [1568 x i8], ptr %ct, i32 0, i32 %rem, !dbg !217
  %3 = load i8, ptr %arrayidx, align 1, !dbg !218
  %xor1 = xor i8 %3, %1, !dbg !218
  store i8 %xor1, ptr %arrayidx, align 1, !dbg !218
  %call11 = call i32 @pqcrystals_kyber1024_ref_dec(ptr noundef nonnull %key_a, ptr noundef nonnull %ct, ptr noundef nonnull %sk) #3, !dbg !219
  %call14 = call i32 @memcmp(ptr noundef nonnull %key_a, ptr noundef nonnull %key_b, i32 noundef 32) #4, !dbg !220
  %tobool15.not = icmp eq i32 %call14, 0, !dbg !220
  br i1 %tobool15.not, label %if.then, label %return, !dbg !222

if.then:                                          ; preds = %do.end
  %call16 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.5) #4, !dbg !223
  br label %return, !dbg !225

return:                                           ; preds = %do.end, %if.then
  %retval.0 = phi i32 [ 1, %if.then ], [ 0, %do.end ], !dbg !202
  ret i32 %retval.0, !dbg !226
}

declare dso_local i32 @printf(ptr noundef, ...) local_unnamed_addr #1

declare dso_local i32 @memcmp(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local void @randombytes(ptr noundef %out, i32 noundef %outlen) local_unnamed_addr #0 !dbg !28 {
entry:
    #dbg_value(ptr %out, !227, !DIExpression(), !228)
    #dbg_value(i32 %outlen, !229, !DIExpression(), !228)
  br label %while.cond, !dbg !230

while.cond:                                       ; preds = %while.cond.backedge, %entry
  %0 = load i32, ptr @randombytes.fd, align 4, !dbg !231
  %cmp = icmp eq i32 %0, -1, !dbg !232
  br i1 %cmp, label %while.body, label %while.cond7.preheader, !dbg !230

while.cond7.preheader:                            ; preds = %while.cond
  br label %while.cond7.outer, !dbg !233

while.body:                                       ; preds = %while.cond
  %call = call i32 (ptr, i32, ...) @open(ptr noundef nonnull @.str.6, i32 noundef 0) #4, !dbg !234
  store i32 %call, ptr @randombytes.fd, align 4, !dbg !236
  %cmp1 = icmp eq i32 %call, -1, !dbg !237
  br i1 %cmp1, label %land.lhs.true, label %if.else, !dbg !239

land.lhs.true:                                    ; preds = %while.body
  %call2 = call ptr @__errno() #4, !dbg !240
  %1 = load i32, ptr %call2, align 4, !dbg !240
  %cmp3 = icmp eq i32 %1, 4, !dbg !241
  br i1 %cmp3, label %while.cond.backedge, label %if.else, !dbg !239

if.else:                                          ; preds = %land.lhs.true, %while.body
  %2 = load i32, ptr @randombytes.fd, align 4, !dbg !242
  %cmp4 = icmp eq i32 %2, -1, !dbg !244
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !244

if.then5:                                         ; preds = %if.else
  call void @abort() #4, !dbg !245
  br label %if.end6, !dbg !245

if.end6:                                          ; preds = %if.else, %if.then5
  br label %while.cond.backedge, !dbg !230

while.cond.backedge:                              ; preds = %if.end6, %land.lhs.true
  br label %while.cond, !dbg !231, !llvm.loop !246

while.cond7:                                      ; preds = %while.cond7.outer, %land.lhs.true12
    #dbg_value(ptr %out.addr.0.ph, !227, !DIExpression(), !228)
    #dbg_value(i32 %outlen.addr.0.ph, !229, !DIExpression(), !228)
  %cmp8.not = icmp eq i32 %outlen.addr.0.ph, 0, !dbg !248
  br i1 %cmp8.not, label %while.end21, label %while.body9, !dbg !233

while.body9:                                      ; preds = %while.cond7
  %3 = load i32, ptr @randombytes.fd, align 4, !dbg !249
  %call10 = call i32 @read(i32 noundef %3, ptr noundef %out.addr.0.ph, i32 noundef %outlen.addr.0.ph) #4, !dbg !251
    #dbg_value(i32 %call10, !252, !DIExpression(), !228)
  %cond = icmp eq i32 %call10, -1, !dbg !257
  br i1 %cond, label %land.lhs.true12, label %if.end20.loopexit, !dbg !257

land.lhs.true12:                                  ; preds = %while.body9
  %call13 = call ptr @__errno() #4, !dbg !259
  %4 = load i32, ptr %call13, align 4, !dbg !259
  %cmp14 = icmp eq i32 %4, 4, !dbg !260
  br i1 %cmp14, label %while.cond7, label %if.then18, !dbg !257, !llvm.loop !261

if.then18:                                        ; preds = %land.lhs.true12
  %call10.lcssa1 = phi i32 [ %call10, %land.lhs.true12 ], !dbg !251
  call void @abort() #4, !dbg !263
  br label %if.end20, !dbg !263

if.end20.loopexit:                                ; preds = %while.body9
  %call10.lcssa = phi i32 [ %call10, %while.body9 ], !dbg !251
  br label %if.end20, !dbg !265

if.end20:                                         ; preds = %if.end20.loopexit, %if.then18
  %call102 = phi i32 [ %call10.lcssa, %if.end20.loopexit ], [ %call10.lcssa1, %if.then18 ]
  %add.ptr = getelementptr inbounds i8, ptr %out.addr.0.ph, i32 %call102, !dbg !265
    #dbg_value(ptr %add.ptr, !227, !DIExpression(), !228)
  %sub = sub i32 %outlen.addr.0.ph, %call102, !dbg !266
    #dbg_value(i32 %sub, !229, !DIExpression(), !228)
  br label %while.cond7.outer, !dbg !233, !llvm.loop !261

while.cond7.outer:                                ; preds = %while.cond7.preheader, %if.end20
  %outlen.addr.0.ph = phi i32 [ %outlen, %while.cond7.preheader ], [ %sub, %if.end20 ]
  %out.addr.0.ph = phi ptr [ %out, %while.cond7.preheader ], [ %add.ptr, %if.end20 ]
  br label %while.cond7, !dbg !233

while.end21:                                      ; preds = %while.cond7
  ret void, !dbg !267
}

declare dso_local i32 @open(ptr noundef, i32 noundef, ...) local_unnamed_addr #1

declare dso_local ptr @__errno() local_unnamed_addr #1

declare dso_local void @abort() local_unnamed_addr #1

declare dso_local i32 @read(i32 noundef, ptr noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber1024_ref_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) local_unnamed_addr #0 !dbg !268 {
entry:
    #dbg_value(ptr %pk, !274, !DIExpression(), !275)
    #dbg_value(ptr %sk, !276, !DIExpression(), !275)
    #dbg_value(ptr %coins, !277, !DIExpression(), !275)
  call void @pqcrystals_kyber1024_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) #3, !dbg !278
  %add.ptr = getelementptr inbounds nuw i8, ptr %sk, i32 1536, !dbg !279
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr, ptr noundef %pk, i32 noundef 1568) #4, !dbg !280
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %sk, i32 3104, !dbg !281
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr2, ptr noundef %pk, i32 noundef 1568) #3, !dbg !281
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %sk, i32 3136, !dbg !282
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %coins, i32 32, !dbg !283
  %call6 = call ptr @memcpy(ptr noundef nonnull %add.ptr4, ptr noundef nonnull %add.ptr5, i32 noundef 32) #4, !dbg !284
  ret i32 0, !dbg !285
}

declare dso_local ptr @memcpy(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber1024_ref_keypair(ptr noundef %pk, ptr noundef %sk) local_unnamed_addr #0 !dbg !286 {
entry:
  %coins = alloca [64 x i8], align 1
    #dbg_value(ptr %pk, !289, !DIExpression(), !290)
    #dbg_value(ptr %sk, !291, !DIExpression(), !290)
    #dbg_declare(ptr %coins, !292, !DIExpression(), !296)
  call void @randombytes(ptr noundef nonnull %coins, i32 noundef 64) #3, !dbg !297
  %call = call i32 @pqcrystals_kyber1024_ref_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef nonnull %coins) #3, !dbg !298
  ret i32 0, !dbg !299
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber1024_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef %coins) local_unnamed_addr #0 !dbg !300 {
entry:
  %buf = alloca [64 x i8], align 1
  %kr = alloca [64 x i8], align 1
    #dbg_value(ptr %ct, !303, !DIExpression(), !304)
    #dbg_value(ptr %ss, !305, !DIExpression(), !304)
    #dbg_value(ptr %pk, !306, !DIExpression(), !304)
    #dbg_value(ptr %coins, !307, !DIExpression(), !304)
    #dbg_declare(ptr %buf, !308, !DIExpression(), !309)
    #dbg_declare(ptr %kr, !310, !DIExpression(), !311)
  %call = call ptr @memcpy(ptr noundef nonnull %buf, ptr noundef %coins, i32 noundef 32) #4, !dbg !312
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !313
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr, ptr noundef %pk, i32 noundef 1568) #3, !dbg !313
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %kr, ptr noundef nonnull %buf, i32 noundef 64) #3, !dbg !314
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %kr, i32 32, !dbg !315
  call void @pqcrystals_kyber1024_ref_indcpa_enc(ptr noundef %ct, ptr noundef nonnull %buf, ptr noundef %pk, ptr noundef nonnull %add.ptr6) #3, !dbg !316
  %call8 = call ptr @memcpy(ptr noundef %ss, ptr noundef nonnull %kr, i32 noundef 32) #4, !dbg !317
  ret i32 0, !dbg !318
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber1024_ref_enc(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk) local_unnamed_addr #0 !dbg !319 {
entry:
  %coins = alloca [32 x i8], align 1
    #dbg_value(ptr %ct, !320, !DIExpression(), !321)
    #dbg_value(ptr %ss, !322, !DIExpression(), !321)
    #dbg_value(ptr %pk, !323, !DIExpression(), !321)
    #dbg_declare(ptr %coins, !324, !DIExpression(), !325)
  call void @randombytes(ptr noundef nonnull %coins, i32 noundef 32) #3, !dbg !326
  %call = call i32 @pqcrystals_kyber1024_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef nonnull %coins) #3, !dbg !327
  ret i32 0, !dbg !328
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber1024_ref_dec(ptr noundef %ss, ptr noundef %ct, ptr noundef %sk) local_unnamed_addr #0 !dbg !329 {
entry:
  %buf = alloca [64 x i8], align 1
  %kr = alloca [64 x i8], align 1
  %cmp = alloca [1568 x i8], align 1
    #dbg_value(ptr %ss, !332, !DIExpression(), !333)
    #dbg_value(ptr %ct, !334, !DIExpression(), !333)
    #dbg_value(ptr %sk, !335, !DIExpression(), !333)
    #dbg_declare(ptr %buf, !336, !DIExpression(), !337)
    #dbg_declare(ptr %kr, !338, !DIExpression(), !339)
    #dbg_declare(ptr %cmp, !340, !DIExpression(), !341)
  %add.ptr = getelementptr inbounds nuw i8, ptr %sk, i32 1536, !dbg !342
    #dbg_value(ptr %add.ptr, !343, !DIExpression(), !333)
  call void @pqcrystals_kyber1024_ref_indcpa_dec(ptr noundef nonnull %buf, ptr noundef %ct, ptr noundef %sk) #3, !dbg !344
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !345
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %sk, i32 3104, !dbg !346
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr2, ptr noundef nonnull %add.ptr4, i32 noundef 32) #4, !dbg !347
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %kr, ptr noundef nonnull %buf, i32 noundef 64) #3, !dbg !348
  %add.ptr10 = getelementptr inbounds nuw i8, ptr %kr, i32 32, !dbg !349
  call void @pqcrystals_kyber1024_ref_indcpa_enc(ptr noundef nonnull %cmp, ptr noundef nonnull %buf, ptr noundef nonnull %add.ptr, ptr noundef nonnull %add.ptr10) #3, !dbg !350
  %call12 = call i32 @pqcrystals_kyber1024_ref_verify(ptr noundef %ct, ptr noundef nonnull %cmp, i32 noundef 1568) #3, !dbg !351
    #dbg_value(i32 %call12, !352, !DIExpression(), !333)
  %add.ptr14 = getelementptr inbounds nuw i8, ptr %sk, i32 3136, !dbg !353
  call void @pqcrystals_kyber1024_ref_kyber_shake256_rkprf(ptr noundef %ss, ptr noundef nonnull %add.ptr14, ptr noundef %ct) #3, !dbg !353
  %0 = trunc nuw nsw i32 %call12 to i8, !dbg !354
  %conv = xor i8 %0, 1, !dbg !354
  call void @pqcrystals_kyber1024_ref_cmov(ptr noundef %ss, ptr noundef nonnull %kr, i32 noundef 32, i8 noundef zeroext %conv) #3, !dbg !355
  ret i32 0, !dbg !356
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_gen_matrix(ptr noundef %a, ptr noundef %seed, i32 noundef %transposed) local_unnamed_addr #0 !dbg !357 {
entry:
  %buf = alloca [504 x i8], align 1
  %state = alloca [26 x i64], align 8
    #dbg_value(ptr %a, !372, !DIExpression(), !373)
    #dbg_value(ptr %seed, !374, !DIExpression(), !373)
    #dbg_value(i32 %transposed, !375, !DIExpression(), !373)
    #dbg_declare(ptr %buf, !376, !DIExpression(), !380)
    #dbg_declare(ptr %state, !381, !DIExpression(), !387)
    #dbg_value(i32 0, !388, !DIExpression(), !373)
  br label %for.cond, !dbg !389

for.cond:                                         ; preds = %for.inc18, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc19, %for.inc18 ], !dbg !391
    #dbg_value(i32 %i.0, !388, !DIExpression(), !373)
  %exitcond1 = icmp ne i32 %i.0, 4, !dbg !392
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end20, !dbg !394

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !395

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc
  %j.0 = phi i32 [ %inc, %for.inc ], [ 0, %for.cond1.preheader ], !dbg !398
    #dbg_value(i32 %j.0, !399, !DIExpression(), !373)
  %exitcond = icmp ne i32 %j.0, 4, !dbg !400
  br i1 %exitcond, label %for.body3, label %for.inc18, !dbg !395

for.body3:                                        ; preds = %for.cond1
  %tobool.not = icmp eq i32 %transposed, 0, !dbg !402
  br i1 %tobool.not, label %if.else, label %if.then, !dbg !402

if.then:                                          ; preds = %for.body3
  %conv = trunc nuw i32 %i.0 to i8, !dbg !405
  %conv4 = trunc nuw nsw i32 %j.0 to i8, !dbg !405
  call void @pqcrystals_kyber1024_ref_kyber_shake128_absorb(ptr noundef nonnull %state, ptr noundef %seed, i8 noundef zeroext %conv, i8 noundef zeroext %conv4) #3, !dbg !405
  br label %if.end, !dbg !405

if.else:                                          ; preds = %for.body3
  %conv5 = trunc nuw nsw i32 %j.0 to i8, !dbg !406
  %conv6 = trunc nuw i32 %i.0 to i8, !dbg !406
  call void @pqcrystals_kyber1024_ref_kyber_shake128_absorb(ptr noundef nonnull %state, ptr noundef %seed, i8 noundef zeroext %conv5, i8 noundef zeroext %conv6) #3, !dbg !406
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef nonnull %buf, i32 noundef 3, ptr noundef nonnull %state) #3, !dbg !407
    #dbg_value(i32 504, !408, !DIExpression(), !373)
  %arrayidx7 = getelementptr inbounds nuw [4 x [256 x i16]], ptr %a, i32 %i.0, i32 %j.0, !dbg !409
  %call = call fastcc i32 @rej_uniform(ptr noundef %arrayidx7, i32 noundef 256, ptr noundef nonnull %buf, i32 noundef 504) #3, !dbg !410
    #dbg_value(i32 %call, !411, !DIExpression(), !373)
  br label %while.cond, !dbg !412

while.cond:                                       ; preds = %while.body, %if.end
  %ctr.0 = phi i32 [ %call, %if.end ], [ %add, %while.body ], !dbg !413
    #dbg_value(i32 %ctr.0, !411, !DIExpression(), !373)
  %cmp10 = icmp ult i32 %ctr.0, 256, !dbg !414
  br i1 %cmp10, label %while.body, label %for.inc, !dbg !412

while.body:                                       ; preds = %while.cond
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef nonnull %buf, i32 noundef 1, ptr noundef nonnull %state) #3, !dbg !415
    #dbg_value(i32 168, !408, !DIExpression(), !373)
  %arrayidx14 = getelementptr inbounds nuw [4 x [256 x i16]], ptr %a, i32 %i.0, i32 %j.0, !dbg !417
  %add.ptr = getelementptr inbounds nuw i16, ptr %arrayidx14, i32 %ctr.0, !dbg !418
  %sub = sub nuw nsw i32 256, %ctr.0, !dbg !419
  %call17 = call fastcc i32 @rej_uniform(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef nonnull %buf, i32 noundef 168) #3, !dbg !420
  %add = add i32 %ctr.0, %call17, !dbg !421
    #dbg_value(i32 %add, !411, !DIExpression(), !373)
  br label %while.cond, !dbg !412, !llvm.loop !422

for.inc:                                          ; preds = %while.cond
  %inc = add nuw nsw i32 %j.0, 1, !dbg !424
    #dbg_value(i32 %inc, !399, !DIExpression(), !373)
  br label %for.cond1, !dbg !425, !llvm.loop !426

for.inc18:                                        ; preds = %for.cond1
  %inc19 = add nuw nsw i32 %i.0, 1, !dbg !428
    #dbg_value(i32 %inc19, !388, !DIExpression(), !373)
  br label %for.cond, !dbg !429, !llvm.loop !430

for.end20:                                        ; preds = %for.cond
  ret void, !dbg !432
}

; Function Attrs: nounwind
define internal fastcc i32 @rej_uniform(ptr noundef %r, i32 noundef range(i32 1, 257) %len, ptr noundef nonnull %buf, i32 noundef range(i32 168, 505) %buflen) unnamed_addr #0 !dbg !433 {
entry:
    #dbg_value(ptr %r, !437, !DIExpression(), !438)
    #dbg_value(i32 %len, !439, !DIExpression(), !438)
    #dbg_value(ptr %buf, !440, !DIExpression(), !438)
    #dbg_value(i32 %buflen, !441, !DIExpression(), !438)
    #dbg_value(i32 0, !442, !DIExpression(), !438)
    #dbg_value(i32 0, !443, !DIExpression(), !438)
  br label %while.cond, !dbg !444

while.cond:                                       ; preds = %if.end33, %entry
  %ctr.0 = phi i32 [ 0, %entry ], [ %ctr.2, %if.end33 ], !dbg !438
  %pos.0 = phi i32 [ 0, %entry ], [ %add20, %if.end33 ], !dbg !438
    #dbg_value(i32 %pos.0, !442, !DIExpression(), !438)
    #dbg_value(i32 %ctr.0, !443, !DIExpression(), !438)
  %cmp = icmp ult i32 %ctr.0, %len, !dbg !445
  %add = add nuw nsw i32 %pos.0, 3, !dbg !446
  %cmp1 = icmp ule i32 %add, %buflen, !dbg !446
  %0 = select i1 %cmp, i1 %cmp1, i1 false, !dbg !446
  br i1 %0, label %while.body, label %while.end, !dbg !444

while.body:                                       ; preds = %while.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %buf, i32 %pos.0, !dbg !447
  %1 = load i8, ptr %arrayidx, align 1, !dbg !447
  %conv = zext i8 %1 to i16, !dbg !447
  %2 = getelementptr i8, ptr %buf, i32 %pos.0, !dbg !449
  %arrayidx4 = getelementptr i8, ptr %2, i32 1, !dbg !449
  %3 = load i8, ptr %arrayidx4, align 1, !dbg !449
  %conv6 = zext i8 %3 to i16, !dbg !450
  %shl = shl nuw i16 %conv6, 8, !dbg !451
  %shl.masked = and i16 %shl, 3840, !dbg !452
  %and = or disjoint i16 %shl.masked, %conv, !dbg !452
    #dbg_value(i16 %and, !453, !DIExpression(), !438)
  %4 = getelementptr i8, ptr %buf, i32 %pos.0, !dbg !454
  %arrayidx9 = getelementptr i8, ptr %4, i32 1, !dbg !454
  %5 = load i8, ptr %arrayidx9, align 1, !dbg !454
  %6 = lshr i8 %5, 4, !dbg !455
  %shr11 = zext nneg i8 %6 to i16, !dbg !455
  %7 = getelementptr i8, ptr %buf, i32 %pos.0, !dbg !456
  %arrayidx13 = getelementptr i8, ptr %7, i32 2, !dbg !456
  %8 = load i8, ptr %arrayidx13, align 1, !dbg !456
  %conv15 = zext i8 %8 to i16, !dbg !457
  %shl16 = shl nuw nsw i16 %conv15, 4, !dbg !458
  %or17 = or disjoint i16 %shl16, %shr11, !dbg !459
    #dbg_value(i16 %or17, !460, !DIExpression(), !438)
  %add20 = add nuw nsw i32 %pos.0, 3, !dbg !461
    #dbg_value(i32 %add20, !442, !DIExpression(), !438)
  %cmp22 = icmp samesign ult i16 %and, 3329, !dbg !462
  br i1 %cmp22, label %if.then, label %if.end, !dbg !462

if.then:                                          ; preds = %while.body
  %inc = add nuw nsw i32 %ctr.0, 1, !dbg !464
    #dbg_value(i32 %inc, !443, !DIExpression(), !438)
  %arrayidx24 = getelementptr inbounds nuw i16, ptr %r, i32 %ctr.0, !dbg !465
  store i16 %and, ptr %arrayidx24, align 2, !dbg !466
  br label %if.end, !dbg !465

if.end:                                           ; preds = %if.then, %while.body
  %ctr.1 = phi i32 [ %inc, %if.then ], [ %ctr.0, %while.body ], !dbg !438
    #dbg_value(i32 %ctr.1, !443, !DIExpression(), !438)
  %cmp25 = icmp ult i32 %ctr.1, %len, !dbg !467
  %cmp28 = icmp samesign ult i16 %or17, 3329
  %or.cond = select i1 %cmp25, i1 %cmp28, i1 false, !dbg !469
  br i1 %or.cond, label %if.then30, label %if.end33, !dbg !469

if.then30:                                        ; preds = %if.end
  %inc31 = add nuw nsw i32 %ctr.1, 1, !dbg !470
    #dbg_value(i32 %inc31, !443, !DIExpression(), !438)
  %arrayidx32 = getelementptr inbounds nuw i16, ptr %r, i32 %ctr.1, !dbg !471
  store i16 %or17, ptr %arrayidx32, align 2, !dbg !472
  br label %if.end33, !dbg !471

if.end33:                                         ; preds = %if.then30, %if.end
  %ctr.2 = phi i32 [ %inc31, %if.then30 ], [ %ctr.1, %if.end ], !dbg !473
    #dbg_value(i32 %ctr.2, !443, !DIExpression(), !438)
  br label %while.cond, !dbg !444, !llvm.loop !474

while.end:                                        ; preds = %while.cond
  %ctr.0.lcssa = phi i32 [ %ctr.0, %while.cond ], !dbg !438
  ret i32 %ctr.0.lcssa, !dbg !476
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) local_unnamed_addr #0 !dbg !477 {
entry:
  %buf = alloca [64 x i8], align 1
  %a = alloca [4 x [4 x [256 x i16]]], align 2
  %e = alloca [4 x [256 x i16]], align 2
  %pkpv = alloca [4 x [256 x i16]], align 2
  %skpv = alloca [4 x [256 x i16]], align 2
    #dbg_value(ptr %pk, !480, !DIExpression(), !481)
    #dbg_value(ptr %sk, !482, !DIExpression(), !481)
    #dbg_value(ptr %coins, !483, !DIExpression(), !481)
    #dbg_declare(ptr %buf, !484, !DIExpression(), !485)
    #dbg_value(ptr %buf, !486, !DIExpression(), !481)
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !487
    #dbg_value(ptr %add.ptr, !488, !DIExpression(), !481)
    #dbg_value(i8 0, !489, !DIExpression(), !481)
    #dbg_declare(ptr %a, !490, !DIExpression(), !492)
    #dbg_declare(ptr %e, !493, !DIExpression(), !494)
    #dbg_declare(ptr %pkpv, !495, !DIExpression(), !496)
    #dbg_declare(ptr %skpv, !497, !DIExpression(), !498)
  %call = call ptr @memcpy(ptr noundef nonnull %buf, ptr noundef %coins, i32 noundef 32) #4, !dbg !499
  %arrayidx = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !500
  store i8 4, ptr %arrayidx, align 1, !dbg !501
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %buf, ptr noundef nonnull %buf, i32 noundef 33) #3, !dbg !502
  call void @pqcrystals_kyber1024_ref_gen_matrix(ptr noundef nonnull %a, ptr noundef nonnull %buf, i32 noundef 0) #3, !dbg !503
    #dbg_value(i32 0, !504, !DIExpression(), !481)
  br label %for.cond, !dbg !505

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc7, %for.body ], !dbg !507
  %nonce.0 = phi i8 [ 0, %entry ], [ %inc, %for.body ], !dbg !481
    #dbg_value(i8 %nonce.0, !489, !DIExpression(), !481)
    #dbg_value(i32 %i.0, !504, !DIExpression(), !481)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !508
  br i1 %exitcond, label %for.body, label %for.cond8.preheader, !dbg !510

for.cond8.preheader:                              ; preds = %for.cond
  br label %for.cond8, !dbg !511

for.body:                                         ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds nuw [4 x [256 x i16]], ptr %skpv, i32 0, i32 %i.0, !dbg !513
    #dbg_value(i8 %nonce.0, !489, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !481)
  call void @pqcrystals_kyber1024_ref_poly_getnoise_eta1(ptr noundef nonnull %arrayidx6, ptr noundef nonnull %add.ptr, i8 noundef zeroext %nonce.0) #3, !dbg !514
  %inc = add nuw nsw i8 %nonce.0, 1, !dbg !515
    #dbg_value(i8 %inc, !489, !DIExpression(), !481)
  %inc7 = add nuw nsw i32 %i.0, 1, !dbg !516
    #dbg_value(i32 %inc7, !504, !DIExpression(), !481)
  br label %for.cond, !dbg !517, !llvm.loop !518

for.cond8:                                        ; preds = %for.cond8.preheader, %for.body10
  %i.1 = phi i32 [ %inc14, %for.body10 ], [ 0, %for.cond8.preheader ], !dbg !520
  %nonce.1 = phi i8 [ %inc12, %for.body10 ], [ 4, %for.cond8.preheader ], !dbg !481
    #dbg_value(i8 %nonce.1, !489, !DIExpression(), !481)
    #dbg_value(i32 %i.1, !504, !DIExpression(), !481)
  %exitcond1 = icmp ne i32 %i.1, 4, !dbg !521
  br i1 %exitcond1, label %for.body10, label %for.end15, !dbg !511

for.body10:                                       ; preds = %for.cond8
  %arrayidx11 = getelementptr inbounds nuw [4 x [256 x i16]], ptr %e, i32 0, i32 %i.1, !dbg !523
    #dbg_value(i8 %nonce.1, !489, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !481)
  call void @pqcrystals_kyber1024_ref_poly_getnoise_eta1(ptr noundef nonnull %arrayidx11, ptr noundef nonnull %add.ptr, i8 noundef zeroext %nonce.1) #3, !dbg !524
  %inc12 = add nuw nsw i8 %nonce.1, 1, !dbg !525
    #dbg_value(i8 %inc12, !489, !DIExpression(), !481)
  %inc14 = add nuw nsw i32 %i.1, 1, !dbg !526
    #dbg_value(i32 %inc14, !504, !DIExpression(), !481)
  br label %for.cond8, !dbg !527, !llvm.loop !528

for.end15:                                        ; preds = %for.cond8
  call void @pqcrystals_kyber1024_ref_polyvec_ntt(ptr noundef nonnull %skpv) #3, !dbg !530
  call void @pqcrystals_kyber1024_ref_polyvec_ntt(ptr noundef nonnull %e) #3, !dbg !531
    #dbg_value(i32 0, !504, !DIExpression(), !481)
  br label %for.cond16, !dbg !532

for.cond16:                                       ; preds = %for.body18, %for.end15
  %i.2 = phi i32 [ 0, %for.end15 ], [ %inc23, %for.body18 ], !dbg !534
    #dbg_value(i32 %i.2, !504, !DIExpression(), !481)
  %exitcond2 = icmp ne i32 %i.2, 4, !dbg !535
  br i1 %exitcond2, label %for.body18, label %for.end24, !dbg !537

for.body18:                                       ; preds = %for.cond16
  %arrayidx19 = getelementptr inbounds nuw [4 x [256 x i16]], ptr %pkpv, i32 0, i32 %i.2, !dbg !538
  %arrayidx20 = getelementptr inbounds nuw [4 x [4 x [256 x i16]]], ptr %a, i32 0, i32 %i.2, !dbg !540
  call void @pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %arrayidx19, ptr noundef nonnull %arrayidx20, ptr noundef nonnull %skpv) #3, !dbg !541
  %arrayidx21 = getelementptr inbounds nuw [4 x [256 x i16]], ptr %pkpv, i32 0, i32 %i.2, !dbg !542
  call void @pqcrystals_kyber1024_ref_poly_tomont(ptr noundef nonnull %arrayidx21) #3, !dbg !543
  %inc23 = add nuw nsw i32 %i.2, 1, !dbg !544
    #dbg_value(i32 %inc23, !504, !DIExpression(), !481)
  br label %for.cond16, !dbg !545, !llvm.loop !546

for.end24:                                        ; preds = %for.cond16
  call void @pqcrystals_kyber1024_ref_polyvec_add(ptr noundef nonnull %pkpv, ptr noundef nonnull %pkpv, ptr noundef nonnull %e) #3, !dbg !548
  call void @pqcrystals_kyber1024_ref_polyvec_reduce(ptr noundef nonnull %pkpv) #3, !dbg !549
  call fastcc void @pack_sk(ptr noundef %sk, ptr noundef nonnull %skpv) #3, !dbg !550
  call fastcc void @pack_pk(ptr noundef %pk, ptr noundef nonnull %pkpv, ptr noundef nonnull %buf) #3, !dbg !551
  ret void, !dbg !552
}

; Function Attrs: nounwind
define internal fastcc void @pack_sk(ptr noundef %r, ptr noundef nonnull %sk) unnamed_addr #0 !dbg !553 {
entry:
    #dbg_value(ptr %r, !556, !DIExpression(), !557)
    #dbg_value(ptr %sk, !558, !DIExpression(), !557)
  call void @pqcrystals_kyber1024_ref_polyvec_tobytes(ptr noundef %r, ptr noundef nonnull %sk) #3, !dbg !559
  ret void, !dbg !560
}

; Function Attrs: nounwind
define internal fastcc void @pack_pk(ptr noundef %r, ptr noundef nonnull %pk, ptr noundef nonnull %seed) unnamed_addr #0 !dbg !561 {
entry:
    #dbg_value(ptr %r, !564, !DIExpression(), !565)
    #dbg_value(ptr %pk, !566, !DIExpression(), !565)
    #dbg_value(ptr %seed, !567, !DIExpression(), !565)
  call void @pqcrystals_kyber1024_ref_polyvec_tobytes(ptr noundef %r, ptr noundef nonnull %pk) #3, !dbg !568
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 1536, !dbg !569
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr, ptr noundef nonnull %seed, i32 noundef 32) #4, !dbg !570
  ret void, !dbg !571
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_indcpa_enc(ptr noundef %c, ptr noundef %m, ptr noundef %pk, ptr noundef %coins) local_unnamed_addr #0 !dbg !572 {
entry:
  %seed = alloca [32 x i8], align 1
  %sp = alloca [4 x [256 x i16]], align 2
  %pkpv = alloca [4 x [256 x i16]], align 2
  %ep = alloca [4 x [256 x i16]], align 2
  %at = alloca [4 x [4 x [256 x i16]]], align 2
  %b = alloca [4 x [256 x i16]], align 2
  %v = alloca [256 x i16], align 2
  %k = alloca [256 x i16], align 2
  %epp = alloca [256 x i16], align 2
    #dbg_value(ptr %c, !575, !DIExpression(), !576)
    #dbg_value(ptr %m, !577, !DIExpression(), !576)
    #dbg_value(ptr %pk, !578, !DIExpression(), !576)
    #dbg_value(ptr %coins, !579, !DIExpression(), !576)
    #dbg_declare(ptr %seed, !580, !DIExpression(), !581)
    #dbg_value(i8 0, !582, !DIExpression(), !576)
    #dbg_declare(ptr %sp, !583, !DIExpression(), !584)
    #dbg_declare(ptr %pkpv, !585, !DIExpression(), !586)
    #dbg_declare(ptr %ep, !587, !DIExpression(), !588)
    #dbg_declare(ptr %at, !589, !DIExpression(), !590)
    #dbg_declare(ptr %b, !591, !DIExpression(), !592)
    #dbg_declare(ptr %v, !593, !DIExpression(), !594)
    #dbg_declare(ptr %k, !595, !DIExpression(), !596)
    #dbg_declare(ptr %epp, !597, !DIExpression(), !598)
  call fastcc void @unpack_pk(ptr noundef nonnull %pkpv, ptr noundef nonnull %seed, ptr noundef %pk) #3, !dbg !599
  call void @pqcrystals_kyber1024_ref_poly_frommsg(ptr noundef nonnull %k, ptr noundef %m) #3, !dbg !600
  call void @pqcrystals_kyber1024_ref_gen_matrix(ptr noundef nonnull %at, ptr noundef nonnull %seed, i32 noundef 1) #3, !dbg !601
    #dbg_value(i32 0, !602, !DIExpression(), !576)
  br label %for.cond, !dbg !603

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc4, %for.body ], !dbg !605
  %nonce.0 = phi i8 [ 0, %entry ], [ %inc, %for.body ], !dbg !576
    #dbg_value(i8 %nonce.0, !582, !DIExpression(), !576)
    #dbg_value(i32 %i.0, !602, !DIExpression(), !576)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !606
  br i1 %exitcond, label %for.body, label %for.cond5.preheader, !dbg !608

for.cond5.preheader:                              ; preds = %for.cond
  br label %for.cond5, !dbg !609

for.body:                                         ; preds = %for.cond
  %add.ptr = getelementptr inbounds nuw [256 x i16], ptr %sp, i32 %i.0, !dbg !611
    #dbg_value(i8 %nonce.0, !582, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !576)
  call void @pqcrystals_kyber1024_ref_poly_getnoise_eta1(ptr noundef nonnull %add.ptr, ptr noundef %coins, i8 noundef zeroext %nonce.0) #3, !dbg !612
  %inc = add nuw nsw i8 %nonce.0, 1, !dbg !613
    #dbg_value(i8 %inc, !582, !DIExpression(), !576)
  %inc4 = add nuw nsw i32 %i.0, 1, !dbg !614
    #dbg_value(i32 %inc4, !602, !DIExpression(), !576)
  br label %for.cond, !dbg !615, !llvm.loop !616

for.cond5:                                        ; preds = %for.cond5.preheader, %for.body7
  %i.1 = phi i32 [ %inc12, %for.body7 ], [ 0, %for.cond5.preheader ], !dbg !618
  %nonce.1 = phi i8 [ %inc10, %for.body7 ], [ 4, %for.cond5.preheader ], !dbg !576
    #dbg_value(i8 %nonce.1, !582, !DIExpression(), !576)
    #dbg_value(i32 %i.1, !602, !DIExpression(), !576)
  %exitcond1 = icmp ne i32 %i.1, 4, !dbg !619
  br i1 %exitcond1, label %for.body7, label %for.end13, !dbg !609

for.body7:                                        ; preds = %for.cond5
  %add.ptr9 = getelementptr inbounds nuw [256 x i16], ptr %ep, i32 %i.1, !dbg !621
    #dbg_value(i8 %nonce.1, !582, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !576)
  call void @pqcrystals_kyber1024_ref_poly_getnoise_eta2(ptr noundef nonnull %add.ptr9, ptr noundef %coins, i8 noundef zeroext %nonce.1) #3, !dbg !622
  %inc10 = add nuw nsw i8 %nonce.1, 1, !dbg !623
    #dbg_value(i8 %inc10, !582, !DIExpression(), !576)
  %inc12 = add nuw nsw i32 %i.1, 1, !dbg !624
    #dbg_value(i32 %inc12, !602, !DIExpression(), !576)
  br label %for.cond5, !dbg !625, !llvm.loop !626

for.end13:                                        ; preds = %for.cond5
    #dbg_value(i8 8, !582, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !576)
  call void @pqcrystals_kyber1024_ref_poly_getnoise_eta2(ptr noundef nonnull %epp, ptr noundef %coins, i8 noundef zeroext 8) #3, !dbg !628
  call void @pqcrystals_kyber1024_ref_polyvec_ntt(ptr noundef nonnull %sp) #3, !dbg !629
    #dbg_value(i32 0, !602, !DIExpression(), !576)
  br label %for.cond15, !dbg !630

for.cond15:                                       ; preds = %for.body17, %for.end13
  %i.2 = phi i32 [ 0, %for.end13 ], [ %inc20, %for.body17 ], !dbg !632
    #dbg_value(i32 %i.2, !602, !DIExpression(), !576)
  %exitcond2 = icmp ne i32 %i.2, 4, !dbg !633
  br i1 %exitcond2, label %for.body17, label %for.end21, !dbg !635

for.body17:                                       ; preds = %for.cond15
  %arrayidx = getelementptr inbounds nuw [4 x [256 x i16]], ptr %b, i32 0, i32 %i.2, !dbg !636
  %arrayidx18 = getelementptr inbounds nuw [4 x [4 x [256 x i16]]], ptr %at, i32 0, i32 %i.2, !dbg !637
  call void @pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %arrayidx, ptr noundef nonnull %arrayidx18, ptr noundef nonnull %sp) #3, !dbg !638
  %inc20 = add nuw nsw i32 %i.2, 1, !dbg !639
    #dbg_value(i32 %inc20, !602, !DIExpression(), !576)
  br label %for.cond15, !dbg !640, !llvm.loop !641

for.end21:                                        ; preds = %for.cond15
  call void @pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %v, ptr noundef nonnull %pkpv, ptr noundef nonnull %sp) #3, !dbg !643
  call void @pqcrystals_kyber1024_ref_polyvec_invntt_tomont(ptr noundef nonnull %b) #3, !dbg !644
  call void @pqcrystals_kyber1024_ref_poly_invntt_tomont(ptr noundef nonnull %v) #3, !dbg !645
  call void @pqcrystals_kyber1024_ref_polyvec_add(ptr noundef nonnull %b, ptr noundef nonnull %b, ptr noundef nonnull %ep) #3, !dbg !646
  call void @pqcrystals_kyber1024_ref_poly_add(ptr noundef nonnull %v, ptr noundef nonnull %v, ptr noundef nonnull %epp) #3, !dbg !647
  call void @pqcrystals_kyber1024_ref_poly_add(ptr noundef nonnull %v, ptr noundef nonnull %v, ptr noundef nonnull %k) #3, !dbg !648
  call void @pqcrystals_kyber1024_ref_polyvec_reduce(ptr noundef nonnull %b) #3, !dbg !649
  call void @pqcrystals_kyber1024_ref_poly_reduce(ptr noundef nonnull %v) #3, !dbg !650
  call fastcc void @pack_ciphertext(ptr noundef %c, ptr noundef nonnull %b, ptr noundef nonnull %v) #3, !dbg !651
  ret void, !dbg !652
}

; Function Attrs: nounwind
define internal fastcc void @unpack_pk(ptr noundef nonnull %pk, ptr noundef nonnull %seed, ptr noundef %packedpk) unnamed_addr #0 !dbg !653 {
entry:
    #dbg_value(ptr %pk, !656, !DIExpression(), !657)
    #dbg_value(ptr %seed, !658, !DIExpression(), !657)
    #dbg_value(ptr %packedpk, !659, !DIExpression(), !657)
  call void @pqcrystals_kyber1024_ref_polyvec_frombytes(ptr noundef nonnull %pk, ptr noundef %packedpk) #3, !dbg !660
  %add.ptr = getelementptr inbounds nuw i8, ptr %packedpk, i32 1536, !dbg !661
  %call = call ptr @memcpy(ptr noundef nonnull %seed, ptr noundef nonnull %add.ptr, i32 noundef 32) #4, !dbg !662
  ret void, !dbg !663
}

; Function Attrs: nounwind
define internal fastcc void @pack_ciphertext(ptr noundef %r, ptr noundef nonnull %b, ptr noundef nonnull %v) unnamed_addr #0 !dbg !664 {
entry:
    #dbg_value(ptr %r, !668, !DIExpression(), !669)
    #dbg_value(ptr %b, !670, !DIExpression(), !669)
    #dbg_value(ptr %v, !671, !DIExpression(), !669)
  call void @pqcrystals_kyber1024_ref_polyvec_compress(ptr noundef %r, ptr noundef nonnull %b) #3, !dbg !672
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 1408, !dbg !673
  call void @pqcrystals_kyber1024_ref_poly_compress(ptr noundef nonnull %add.ptr, ptr noundef nonnull %v) #3, !dbg !674
  ret void, !dbg !675
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_indcpa_dec(ptr noundef %m, ptr noundef %c, ptr noundef %sk) local_unnamed_addr #0 !dbg !676 {
entry:
  %b = alloca [4 x [256 x i16]], align 2
  %skpv = alloca [4 x [256 x i16]], align 2
  %v = alloca [256 x i16], align 2
  %mp = alloca [256 x i16], align 2
    #dbg_value(ptr %m, !679, !DIExpression(), !680)
    #dbg_value(ptr %c, !681, !DIExpression(), !680)
    #dbg_value(ptr %sk, !682, !DIExpression(), !680)
    #dbg_declare(ptr %b, !683, !DIExpression(), !684)
    #dbg_declare(ptr %skpv, !685, !DIExpression(), !686)
    #dbg_declare(ptr %v, !687, !DIExpression(), !688)
    #dbg_declare(ptr %mp, !689, !DIExpression(), !690)
  call fastcc void @unpack_ciphertext(ptr noundef nonnull %b, ptr noundef nonnull %v, ptr noundef %c) #3, !dbg !691
  call fastcc void @unpack_sk(ptr noundef nonnull %skpv, ptr noundef %sk) #3, !dbg !692
  call void @pqcrystals_kyber1024_ref_polyvec_ntt(ptr noundef nonnull %b) #3, !dbg !693
  call void @pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %mp, ptr noundef nonnull %skpv, ptr noundef nonnull %b) #3, !dbg !694
  call void @pqcrystals_kyber1024_ref_poly_invntt_tomont(ptr noundef nonnull %mp) #3, !dbg !695
  call void @pqcrystals_kyber1024_ref_poly_sub(ptr noundef nonnull %mp, ptr noundef nonnull %v, ptr noundef nonnull %mp) #3, !dbg !696
  call void @pqcrystals_kyber1024_ref_poly_reduce(ptr noundef nonnull %mp) #3, !dbg !697
  call void @pqcrystals_kyber1024_ref_poly_tomsg(ptr noundef %m, ptr noundef nonnull %mp) #3, !dbg !698
  ret void, !dbg !699
}

; Function Attrs: nounwind
define internal fastcc void @unpack_ciphertext(ptr noundef nonnull %b, ptr noundef nonnull %v, ptr noundef %c) unnamed_addr #0 !dbg !700 {
entry:
    #dbg_value(ptr %b, !703, !DIExpression(), !704)
    #dbg_value(ptr %v, !705, !DIExpression(), !704)
    #dbg_value(ptr %c, !706, !DIExpression(), !704)
  call void @pqcrystals_kyber1024_ref_polyvec_decompress(ptr noundef nonnull %b, ptr noundef %c) #3, !dbg !707
  %add.ptr = getelementptr inbounds nuw i8, ptr %c, i32 1408, !dbg !708
  call void @pqcrystals_kyber1024_ref_poly_decompress(ptr noundef nonnull %v, ptr noundef nonnull %add.ptr) #3, !dbg !709
  ret void, !dbg !710
}

; Function Attrs: nounwind
define internal fastcc void @unpack_sk(ptr noundef nonnull %sk, ptr noundef %packedsk) unnamed_addr #0 !dbg !711 {
entry:
    #dbg_value(ptr %sk, !714, !DIExpression(), !715)
    #dbg_value(ptr %packedsk, !716, !DIExpression(), !715)
  call void @pqcrystals_kyber1024_ref_polyvec_frombytes(ptr noundef nonnull %sk, ptr noundef %packedsk) #3, !dbg !717
  ret void, !dbg !718
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_compress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !719 {
entry:
  %t = alloca [8 x i16], align 2
    #dbg_value(ptr %r, !725, !DIExpression(), !726)
    #dbg_value(ptr %a, !727, !DIExpression(), !726)
    #dbg_declare(ptr %t, !728, !DIExpression(), !732)
    #dbg_value(i32 0, !733, !DIExpression(), !726)
  br label %for.cond, !dbg !734

for.cond:                                         ; preds = %for.inc107, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc108, %for.inc107 ], !dbg !736
  %r.addr.0 = phi ptr [ %r, %entry ], [ %r.addr.1.lcssa, %for.inc107 ]
    #dbg_value(ptr %r.addr.0, !725, !DIExpression(), !726)
    #dbg_value(i32 %i.0, !733, !DIExpression(), !726)
  %exitcond2 = icmp ne i32 %i.0, 4, !dbg !737
  br i1 %exitcond2, label %for.cond1.preheader, label %for.end109, !dbg !739

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !740

for.cond1:                                        ; preds = %for.cond1.preheader, %for.end
  %j.0 = phi i32 [ %inc105, %for.end ], [ 0, %for.cond1.preheader ], !dbg !743
  %r.addr.1 = phi ptr [ %add.ptr, %for.end ], [ %r.addr.0, %for.cond1.preheader ]
    #dbg_value(ptr %r.addr.1, !725, !DIExpression(), !726)
    #dbg_value(i32 %j.0, !744, !DIExpression(), !726)
  %exitcond1 = icmp ne i32 %j.0, 32, !dbg !745
  br i1 %exitcond1, label %for.cond4.preheader, label %for.inc107, !dbg !740

for.cond4.preheader:                              ; preds = %for.cond1
  br label %for.cond4, !dbg !747

for.cond4:                                        ; preds = %for.cond4.preheader, %for.body6
  %k.0 = phi i32 [ %inc, %for.body6 ], [ 0, %for.cond4.preheader ], !dbg !750
    #dbg_value(i32 %k.0, !751, !DIExpression(), !726)
  %exitcond = icmp ne i32 %k.0, 8, !dbg !752
  br i1 %exitcond, label %for.body6, label %for.end, !dbg !747

for.body6:                                        ; preds = %for.cond4
  %mul = shl nuw nsw i32 %j.0, 3, !dbg !754
  %add = or disjoint i32 %mul, %k.0, !dbg !756
  %arrayidx7 = getelementptr inbounds nuw [4 x [256 x i16]], ptr %a, i32 0, i32 %i.0, i32 %add, !dbg !757
  %0 = load i16, ptr %arrayidx7, align 2, !dbg !757
  %isneg = icmp slt i16 %0, 0, !dbg !758
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !758
  %arrayidx10 = getelementptr inbounds nuw [8 x i16], ptr %t, i32 0, i32 %k.0, !dbg !759
  %add12 = add i16 %and, %0, !dbg !760
  store i16 %add12, ptr %arrayidx10, align 2, !dbg !760
  %conv15 = zext i16 %add12 to i64, !dbg !761
    #dbg_value(i64 %conv15, !762, !DIExpression(), !726)
    #dbg_value(i64 %conv15, !762, !DIExpression(DW_OP_constu, 11, DW_OP_shl, DW_OP_stack_value), !726)
    #dbg_value(i64 %conv15, !762, !DIExpression(DW_OP_constu, 11, DW_OP_shl, DW_OP_constu, 1664, DW_OP_or, DW_OP_stack_value), !726)
  %1 = mul nuw nsw i64 %conv15, 1321132032, !dbg !763
  %mul17 = add nuw nsw i64 %1, 1073419776, !dbg !763
    #dbg_value(i64 %mul17, !762, !DIExpression(), !726)
  %shr18 = lshr i64 %mul17, 31, !dbg !764
    #dbg_value(i64 %shr18, !762, !DIExpression(), !726)
  %2 = trunc nuw i64 %shr18 to i16, !dbg !765
  %conv20 = and i16 %2, 2047, !dbg !765
  %arrayidx21 = getelementptr inbounds nuw [8 x i16], ptr %t, i32 0, i32 %k.0, !dbg !766
  store i16 %conv20, ptr %arrayidx21, align 2, !dbg !767
  %inc = add nuw nsw i32 %k.0, 1, !dbg !768
    #dbg_value(i32 %inc, !751, !DIExpression(), !726)
  br label %for.cond4, !dbg !769, !llvm.loop !770

for.end:                                          ; preds = %for.cond4
  %3 = load i16, ptr %t, align 2, !dbg !772
  %conv25 = trunc i16 %3 to i8, !dbg !773
  store i8 %conv25, ptr %r.addr.1, align 1, !dbg !774
  %4 = load i16, ptr %t, align 2, !dbg !775
  %5 = lshr i16 %4, 8, !dbg !776
  %shr29 = trunc nuw i16 %5 to i8, !dbg !776
  %arrayidx30 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !777
  %6 = load i16, ptr %arrayidx30, align 2, !dbg !777
  %conv31 = trunc i16 %6 to i8, !dbg !777
  %shl32 = shl i8 %conv31, 3, !dbg !778
  %or = or i8 %shl32, %shr29, !dbg !779
  %arrayidx34 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 1, !dbg !780
  store i8 %or, ptr %arrayidx34, align 1, !dbg !781
  %arrayidx35 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !782
  %7 = load i16, ptr %arrayidx35, align 2, !dbg !782
  %8 = lshr i16 %7, 5, !dbg !783
  %shr37 = trunc i16 %8 to i8, !dbg !783
  %arrayidx38 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !784
  %9 = load i16, ptr %arrayidx38, align 2, !dbg !784
  %conv39 = trunc i16 %9 to i8, !dbg !784
  %shl40 = shl i8 %conv39, 6, !dbg !785
  %or41 = or i8 %shl40, %shr37, !dbg !786
  %arrayidx43 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 2, !dbg !787
  store i8 %or41, ptr %arrayidx43, align 1, !dbg !788
  %arrayidx44 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !789
  %10 = load i16, ptr %arrayidx44, align 2, !dbg !789
  %11 = lshr i16 %10, 2, !dbg !790
  %conv47 = trunc i16 %11 to i8, !dbg !791
  %arrayidx48 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 3, !dbg !792
  store i8 %conv47, ptr %arrayidx48, align 1, !dbg !793
  %arrayidx49 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !794
  %12 = load i16, ptr %arrayidx49, align 2, !dbg !794
  %13 = lshr i16 %12, 10, !dbg !795
  %shr51 = trunc nuw nsw i16 %13 to i8, !dbg !795
  %arrayidx52 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !796
  %14 = load i16, ptr %arrayidx52, align 2, !dbg !796
  %conv53 = trunc i16 %14 to i8, !dbg !796
  %shl54 = shl i8 %conv53, 1, !dbg !797
  %or55 = or i8 %shl54, %shr51, !dbg !798
  %arrayidx57 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 4, !dbg !799
  store i8 %or55, ptr %arrayidx57, align 1, !dbg !800
  %arrayidx58 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !801
  %15 = load i16, ptr %arrayidx58, align 2, !dbg !801
  %16 = lshr i16 %15, 7, !dbg !802
  %shr60 = trunc i16 %16 to i8, !dbg !802
  %arrayidx61 = getelementptr inbounds nuw i8, ptr %t, i32 8, !dbg !803
  %17 = load i16, ptr %arrayidx61, align 2, !dbg !803
  %conv62 = trunc i16 %17 to i8, !dbg !803
  %shl63 = shl i8 %conv62, 4, !dbg !804
  %or64 = or i8 %shl63, %shr60, !dbg !805
  %arrayidx66 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 5, !dbg !806
  store i8 %or64, ptr %arrayidx66, align 1, !dbg !807
  %arrayidx67 = getelementptr inbounds nuw i8, ptr %t, i32 8, !dbg !808
  %18 = load i16, ptr %arrayidx67, align 2, !dbg !808
  %19 = lshr i16 %18, 4, !dbg !809
  %shr69 = trunc i16 %19 to i8, !dbg !809
  %arrayidx70 = getelementptr inbounds nuw i8, ptr %t, i32 10, !dbg !810
  %20 = load i16, ptr %arrayidx70, align 2, !dbg !810
  %conv71 = trunc i16 %20 to i8, !dbg !810
  %shl72 = shl i8 %conv71, 7, !dbg !811
  %or73 = or i8 %shl72, %shr69, !dbg !812
  %arrayidx75 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 6, !dbg !813
  store i8 %or73, ptr %arrayidx75, align 1, !dbg !814
  %arrayidx76 = getelementptr inbounds nuw i8, ptr %t, i32 10, !dbg !815
  %21 = load i16, ptr %arrayidx76, align 2, !dbg !815
  %22 = lshr i16 %21, 1, !dbg !816
  %conv79 = trunc i16 %22 to i8, !dbg !817
  %arrayidx80 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 7, !dbg !818
  store i8 %conv79, ptr %arrayidx80, align 1, !dbg !819
  %arrayidx81 = getelementptr inbounds nuw i8, ptr %t, i32 10, !dbg !820
  %23 = load i16, ptr %arrayidx81, align 2, !dbg !820
  %24 = lshr i16 %23, 9, !dbg !821
  %shr83 = trunc nuw nsw i16 %24 to i8, !dbg !821
  %arrayidx84 = getelementptr inbounds nuw i8, ptr %t, i32 12, !dbg !822
  %25 = load i16, ptr %arrayidx84, align 2, !dbg !822
  %conv85 = trunc i16 %25 to i8, !dbg !822
  %shl86 = shl i8 %conv85, 2, !dbg !823
  %or87 = or i8 %shl86, %shr83, !dbg !824
  %arrayidx89 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 8, !dbg !825
  store i8 %or87, ptr %arrayidx89, align 1, !dbg !826
  %arrayidx90 = getelementptr inbounds nuw i8, ptr %t, i32 12, !dbg !827
  %26 = load i16, ptr %arrayidx90, align 2, !dbg !827
  %27 = lshr i16 %26, 6, !dbg !828
  %shr92 = trunc i16 %27 to i8, !dbg !828
  %arrayidx93 = getelementptr inbounds nuw i8, ptr %t, i32 14, !dbg !829
  %28 = load i16, ptr %arrayidx93, align 2, !dbg !829
  %conv94 = trunc i16 %28 to i8, !dbg !829
  %shl95 = shl i8 %conv94, 5, !dbg !830
  %or96 = or i8 %shl95, %shr92, !dbg !831
  %arrayidx98 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 9, !dbg !832
  store i8 %or96, ptr %arrayidx98, align 1, !dbg !833
  %arrayidx99 = getelementptr inbounds nuw i8, ptr %t, i32 14, !dbg !834
  %29 = load i16, ptr %arrayidx99, align 2, !dbg !834
  %30 = lshr i16 %29, 3, !dbg !835
  %conv102 = trunc i16 %30 to i8, !dbg !836
  %arrayidx103 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 10, !dbg !837
  store i8 %conv102, ptr %arrayidx103, align 1, !dbg !838
    #dbg_value(ptr %r.addr.1, !725, !DIExpression(DW_OP_plus_uconst, 11, DW_OP_stack_value), !726)
  %add.ptr = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 11, !dbg !839
    #dbg_value(ptr %add.ptr, !725, !DIExpression(), !726)
  %inc105 = add nuw nsw i32 %j.0, 1, !dbg !840
    #dbg_value(i32 %inc105, !744, !DIExpression(), !726)
  br label %for.cond1, !dbg !841, !llvm.loop !842

for.inc107:                                       ; preds = %for.cond1
  %r.addr.1.lcssa = phi ptr [ %r.addr.1, %for.cond1 ]
  %inc108 = add nuw nsw i32 %i.0, 1, !dbg !844
    #dbg_value(i32 %inc108, !733, !DIExpression(), !726)
  br label %for.cond, !dbg !845, !llvm.loop !846

for.end109:                                       ; preds = %for.cond
  ret void, !dbg !848
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_decompress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !849 {
entry:
  %t = alloca [8 x i16], align 2
    #dbg_value(ptr %r, !850, !DIExpression(), !851)
    #dbg_value(ptr %a, !852, !DIExpression(), !851)
    #dbg_declare(ptr %t, !853, !DIExpression(), !854)
    #dbg_value(i32 0, !855, !DIExpression(), !851)
  br label %for.cond, !dbg !856

for.cond:                                         ; preds = %for.inc104, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc105, %for.inc104 ], !dbg !858
  %a.addr.0 = phi ptr [ %a, %entry ], [ %a.addr.1.lcssa, %for.inc104 ]
    #dbg_value(ptr %a.addr.0, !852, !DIExpression(), !851)
    #dbg_value(i32 %i.0, !855, !DIExpression(), !851)
  %exitcond2 = icmp ne i32 %i.0, 4, !dbg !859
  br i1 %exitcond2, label %for.cond1.preheader, label %for.end106, !dbg !861

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !862

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc101
  %j.0 = phi i32 [ %inc102, %for.inc101 ], [ 0, %for.cond1.preheader ], !dbg !865
  %a.addr.1 = phi ptr [ %add.ptr, %for.inc101 ], [ %a.addr.0, %for.cond1.preheader ]
    #dbg_value(ptr %a.addr.1, !852, !DIExpression(), !851)
    #dbg_value(i32 %j.0, !866, !DIExpression(), !851)
  %exitcond1 = icmp ne i32 %j.0, 32, !dbg !867
  br i1 %exitcond1, label %for.body3, label %for.inc104, !dbg !862

for.body3:                                        ; preds = %for.cond1
  %0 = load i8, ptr %a.addr.1, align 1, !dbg !869
  %conv = zext i8 %0 to i16, !dbg !869
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 1, !dbg !871
  %1 = load i8, ptr %arrayidx4, align 1, !dbg !871
  %conv6 = zext i8 %1 to i16, !dbg !872
  %shl = shl nuw i16 %conv6, 8, !dbg !873
  %or = or disjoint i16 %shl, %conv, !dbg !874
  store i16 %or, ptr %t, align 2, !dbg !875
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 1, !dbg !876
  %2 = load i8, ptr %arrayidx9, align 1, !dbg !876
  %3 = lshr i8 %2, 3, !dbg !877
  %shr11 = zext nneg i8 %3 to i16, !dbg !877
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 2, !dbg !878
  %4 = load i8, ptr %arrayidx12, align 1, !dbg !878
  %conv14 = zext i8 %4 to i16, !dbg !879
  %shl15 = shl nuw nsw i16 %conv14, 5, !dbg !880
  %or16 = or disjoint i16 %shl15, %shr11, !dbg !881
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !882
  store i16 %or16, ptr %arrayidx18, align 2, !dbg !883
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 2, !dbg !884
  %5 = load i8, ptr %arrayidx19, align 1, !dbg !884
  %6 = lshr i8 %5, 6, !dbg !885
  %shr21 = zext nneg i8 %6 to i16, !dbg !885
  %arrayidx22 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 3, !dbg !886
  %7 = load i8, ptr %arrayidx22, align 1, !dbg !886
  %conv24 = zext i8 %7 to i16, !dbg !887
  %shl25 = shl nuw nsw i16 %conv24, 2, !dbg !888
  %or26 = or disjoint i16 %shl25, %shr21, !dbg !889
  %arrayidx27 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 4, !dbg !890
  %8 = load i8, ptr %arrayidx27, align 1, !dbg !890
  %conv29 = zext i8 %8 to i16, !dbg !891
  %shl30 = shl i16 %conv29, 10, !dbg !892
  %or31 = or disjoint i16 %or26, %shl30, !dbg !893
  %arrayidx33 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !894
  store i16 %or31, ptr %arrayidx33, align 2, !dbg !895
  %arrayidx34 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 4, !dbg !896
  %9 = load i8, ptr %arrayidx34, align 1, !dbg !896
  %10 = lshr i8 %9, 1, !dbg !897
  %shr36 = zext nneg i8 %10 to i16, !dbg !897
  %arrayidx37 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 5, !dbg !898
  %11 = load i8, ptr %arrayidx37, align 1, !dbg !898
  %conv39 = zext i8 %11 to i16, !dbg !899
  %shl40 = shl nuw nsw i16 %conv39, 7, !dbg !900
  %or41 = or disjoint i16 %shl40, %shr36, !dbg !901
  %arrayidx43 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !902
  store i16 %or41, ptr %arrayidx43, align 2, !dbg !903
  %arrayidx44 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 5, !dbg !904
  %12 = load i8, ptr %arrayidx44, align 1, !dbg !904
  %13 = lshr i8 %12, 4, !dbg !905
  %shr46 = zext nneg i8 %13 to i16, !dbg !905
  %arrayidx47 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 6, !dbg !906
  %14 = load i8, ptr %arrayidx47, align 1, !dbg !906
  %conv49 = zext i8 %14 to i16, !dbg !907
  %shl50 = shl nuw nsw i16 %conv49, 4, !dbg !908
  %or51 = or disjoint i16 %shl50, %shr46, !dbg !909
  %arrayidx53 = getelementptr inbounds nuw i8, ptr %t, i32 8, !dbg !910
  store i16 %or51, ptr %arrayidx53, align 2, !dbg !911
  %arrayidx54 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 6, !dbg !912
  %15 = load i8, ptr %arrayidx54, align 1, !dbg !912
  %16 = lshr i8 %15, 7, !dbg !913
  %shr56 = zext nneg i8 %16 to i16, !dbg !913
  %arrayidx57 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 7, !dbg !914
  %17 = load i8, ptr %arrayidx57, align 1, !dbg !914
  %conv59 = zext i8 %17 to i16, !dbg !915
  %shl60 = shl nuw nsw i16 %conv59, 1, !dbg !916
  %or61 = or disjoint i16 %shl60, %shr56, !dbg !917
  %arrayidx62 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 8, !dbg !918
  %18 = load i8, ptr %arrayidx62, align 1, !dbg !918
  %conv64 = zext i8 %18 to i16, !dbg !919
  %shl65 = shl i16 %conv64, 9, !dbg !920
  %or66 = or disjoint i16 %or61, %shl65, !dbg !921
  %arrayidx68 = getelementptr inbounds nuw i8, ptr %t, i32 10, !dbg !922
  store i16 %or66, ptr %arrayidx68, align 2, !dbg !923
  %arrayidx69 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 8, !dbg !924
  %19 = load i8, ptr %arrayidx69, align 1, !dbg !924
  %20 = lshr i8 %19, 2, !dbg !925
  %shr71 = zext nneg i8 %20 to i16, !dbg !925
  %arrayidx72 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 9, !dbg !926
  %21 = load i8, ptr %arrayidx72, align 1, !dbg !926
  %conv74 = zext i8 %21 to i16, !dbg !927
  %shl75 = shl nuw nsw i16 %conv74, 6, !dbg !928
  %or76 = or disjoint i16 %shl75, %shr71, !dbg !929
  %arrayidx78 = getelementptr inbounds nuw i8, ptr %t, i32 12, !dbg !930
  store i16 %or76, ptr %arrayidx78, align 2, !dbg !931
  %arrayidx79 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 9, !dbg !932
  %22 = load i8, ptr %arrayidx79, align 1, !dbg !932
  %23 = lshr i8 %22, 5, !dbg !933
  %shr81 = zext nneg i8 %23 to i16, !dbg !933
  %arrayidx82 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 10, !dbg !934
  %24 = load i8, ptr %arrayidx82, align 1, !dbg !934
  %conv84 = zext i8 %24 to i16, !dbg !935
  %shl85 = shl nuw nsw i16 %conv84, 3, !dbg !936
  %or86 = or disjoint i16 %shl85, %shr81, !dbg !937
  %arrayidx88 = getelementptr inbounds nuw i8, ptr %t, i32 14, !dbg !938
  store i16 %or86, ptr %arrayidx88, align 2, !dbg !939
    #dbg_value(ptr %add.ptr, !852, !DIExpression(), !851)
    #dbg_value(i32 0, !940, !DIExpression(), !851)
  br label %for.cond89, !dbg !941

for.cond89:                                       ; preds = %for.body92, %for.body3
  %k.0 = phi i32 [ 0, %for.body3 ], [ %inc, %for.body92 ], !dbg !943
    #dbg_value(i32 %k.0, !940, !DIExpression(), !851)
  %exitcond = icmp ne i32 %k.0, 8, !dbg !944
  br i1 %exitcond, label %for.body92, label %for.inc101, !dbg !946

for.body92:                                       ; preds = %for.cond89
  %arrayidx93 = getelementptr inbounds nuw [8 x i16], ptr %t, i32 0, i32 %k.0, !dbg !947
  %25 = load i16, ptr %arrayidx93, align 2, !dbg !947
  %26 = and i16 %25, 2047, !dbg !948
  %and = zext nneg i16 %26 to i32, !dbg !948
  %mul = mul nuw nsw i32 %and, 3329, !dbg !949
  %add = add nuw nsw i32 %mul, 1024, !dbg !950
  %shr95 = lshr i32 %add, 11, !dbg !951
  %conv96 = trunc nuw nsw i32 %shr95 to i16, !dbg !952
  %mul98 = shl nuw nsw i32 %j.0, 3, !dbg !953
  %add99 = or disjoint i32 %mul98, %k.0, !dbg !954
  %arrayidx100 = getelementptr inbounds nuw [4 x [256 x i16]], ptr %r, i32 0, i32 %i.0, i32 %add99, !dbg !955
  store i16 %conv96, ptr %arrayidx100, align 2, !dbg !956
  %inc = add nuw nsw i32 %k.0, 1, !dbg !957
    #dbg_value(i32 %inc, !940, !DIExpression(), !851)
  br label %for.cond89, !dbg !958, !llvm.loop !959

for.inc101:                                       ; preds = %for.cond89
  %add.ptr = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 11, !dbg !961
  %inc102 = add nuw nsw i32 %j.0, 1, !dbg !962
    #dbg_value(i32 %inc102, !866, !DIExpression(), !851)
  br label %for.cond1, !dbg !963, !llvm.loop !964

for.inc104:                                       ; preds = %for.cond1
  %a.addr.1.lcssa = phi ptr [ %a.addr.1, %for.cond1 ]
  %inc105 = add nuw nsw i32 %i.0, 1, !dbg !966
    #dbg_value(i32 %inc105, !855, !DIExpression(), !851)
  br label %for.cond, !dbg !967, !llvm.loop !968

for.end106:                                       ; preds = %for.cond
  ret void, !dbg !970
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !971 {
entry:
    #dbg_value(ptr %r, !972, !DIExpression(), !973)
    #dbg_value(ptr %a, !974, !DIExpression(), !973)
    #dbg_value(i32 0, !975, !DIExpression(), !973)
  br label %for.cond, !dbg !976

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !978
    #dbg_value(i32 %i.0, !975, !DIExpression(), !973)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !979
  br i1 %exitcond, label %for.body, label %for.end, !dbg !981

for.body:                                         ; preds = %for.cond
  %mul = mul nuw nsw i32 %i.0, 384, !dbg !982
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 %mul, !dbg !983
  %arrayidx = getelementptr inbounds nuw [4 x [256 x i16]], ptr %a, i32 0, i32 %i.0, !dbg !984
  call void @pqcrystals_kyber1024_ref_poly_tobytes(ptr noundef %add.ptr, ptr noundef %arrayidx) #3, !dbg !985
  %inc = add nuw nsw i32 %i.0, 1, !dbg !986
    #dbg_value(i32 %inc, !975, !DIExpression(), !973)
  br label %for.cond, !dbg !987, !llvm.loop !988

for.end:                                          ; preds = %for.cond
  ret void, !dbg !990
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_frombytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !991 {
entry:
    #dbg_value(ptr %r, !992, !DIExpression(), !993)
    #dbg_value(ptr %a, !994, !DIExpression(), !993)
    #dbg_value(i32 0, !995, !DIExpression(), !993)
  br label %for.cond, !dbg !996

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !998
    #dbg_value(i32 %i.0, !995, !DIExpression(), !993)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !999
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1001

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [4 x [256 x i16]], ptr %r, i32 0, i32 %i.0, !dbg !1002
  %mul = mul nuw nsw i32 %i.0, 384, !dbg !1003
  %add.ptr = getelementptr inbounds nuw i8, ptr %a, i32 %mul, !dbg !1004
  call void @pqcrystals_kyber1024_ref_poly_frombytes(ptr noundef %arrayidx, ptr noundef %add.ptr) #3, !dbg !1005
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1006
    #dbg_value(i32 %inc, !995, !DIExpression(), !993)
  br label %for.cond, !dbg !1007, !llvm.loop !1008

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1010
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1011 {
entry:
    #dbg_value(ptr %r, !1014, !DIExpression(), !1015)
    #dbg_value(i32 0, !1016, !DIExpression(), !1015)
  br label %for.cond, !dbg !1017

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1019
    #dbg_value(i32 %i.0, !1016, !DIExpression(), !1015)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !1020
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1022

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [4 x [256 x i16]], ptr %r, i32 0, i32 %i.0, !dbg !1023
  call void @pqcrystals_kyber1024_ref_poly_ntt(ptr noundef %arrayidx) #3, !dbg !1024
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1025
    #dbg_value(i32 %inc, !1016, !DIExpression(), !1015)
  br label %for.cond, !dbg !1026, !llvm.loop !1027

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1029
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_invntt_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !1030 {
entry:
    #dbg_value(ptr %r, !1031, !DIExpression(), !1032)
    #dbg_value(i32 0, !1033, !DIExpression(), !1032)
  br label %for.cond, !dbg !1034

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1036
    #dbg_value(i32 %i.0, !1033, !DIExpression(), !1032)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !1037
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1039

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [4 x [256 x i16]], ptr %r, i32 0, i32 %i.0, !dbg !1040
  call void @pqcrystals_kyber1024_ref_poly_invntt_tomont(ptr noundef %arrayidx) #3, !dbg !1041
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1042
    #dbg_value(i32 %inc, !1033, !DIExpression(), !1032)
  br label %for.cond, !dbg !1043, !llvm.loop !1044

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1046
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1047 {
entry:
  %t = alloca [256 x i16], align 2
    #dbg_value(ptr %r, !1050, !DIExpression(), !1051)
    #dbg_value(ptr %a, !1052, !DIExpression(), !1051)
    #dbg_value(ptr %b, !1053, !DIExpression(), !1051)
    #dbg_declare(ptr %t, !1054, !DIExpression(), !1055)
  call void @pqcrystals_kyber1024_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) #3, !dbg !1056
    #dbg_value(i32 1, !1057, !DIExpression(), !1051)
  br label %for.cond, !dbg !1058

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 1, %entry ], [ %inc, %for.body ], !dbg !1060
    #dbg_value(i32 %i.0, !1057, !DIExpression(), !1051)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !1061
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1063

for.body:                                         ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds nuw [4 x [256 x i16]], ptr %a, i32 0, i32 %i.0, !dbg !1064
  %arrayidx3 = getelementptr inbounds nuw [4 x [256 x i16]], ptr %b, i32 0, i32 %i.0, !dbg !1066
  call void @pqcrystals_kyber1024_ref_poly_basemul_montgomery(ptr noundef nonnull %t, ptr noundef nonnull %arrayidx2, ptr noundef nonnull %arrayidx3) #3, !dbg !1067
  call void @pqcrystals_kyber1024_ref_poly_add(ptr noundef %r, ptr noundef %r, ptr noundef nonnull %t) #3, !dbg !1068
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1069
    #dbg_value(i32 %inc, !1057, !DIExpression(), !1051)
  br label %for.cond, !dbg !1070, !llvm.loop !1071

for.end:                                          ; preds = %for.cond
  call void @pqcrystals_kyber1024_ref_poly_reduce(ptr noundef %r) #3, !dbg !1073
  ret void, !dbg !1074
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_reduce(ptr noundef %r) local_unnamed_addr #0 !dbg !1075 {
entry:
    #dbg_value(ptr %r, !1076, !DIExpression(), !1077)
    #dbg_value(i32 0, !1078, !DIExpression(), !1077)
  br label %for.cond, !dbg !1079

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1081
    #dbg_value(i32 %i.0, !1078, !DIExpression(), !1077)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !1082
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1084

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [4 x [256 x i16]], ptr %r, i32 0, i32 %i.0, !dbg !1085
  call void @pqcrystals_kyber1024_ref_poly_reduce(ptr noundef %arrayidx) #3, !dbg !1086
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1087
    #dbg_value(i32 %inc, !1078, !DIExpression(), !1077)
  br label %for.cond, !dbg !1088, !llvm.loop !1089

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1091
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1092 {
entry:
    #dbg_value(ptr %r, !1095, !DIExpression(), !1096)
    #dbg_value(ptr %a, !1097, !DIExpression(), !1096)
    #dbg_value(ptr %b, !1098, !DIExpression(), !1096)
    #dbg_value(i32 0, !1099, !DIExpression(), !1096)
  br label %for.cond, !dbg !1100

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1102
    #dbg_value(i32 %i.0, !1099, !DIExpression(), !1096)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !1103
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1105

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [4 x [256 x i16]], ptr %r, i32 0, i32 %i.0, !dbg !1106
  %arrayidx1 = getelementptr inbounds nuw [4 x [256 x i16]], ptr %a, i32 0, i32 %i.0, !dbg !1107
  %arrayidx2 = getelementptr inbounds nuw [4 x [256 x i16]], ptr %b, i32 0, i32 %i.0, !dbg !1108
  call void @pqcrystals_kyber1024_ref_poly_add(ptr noundef %arrayidx, ptr noundef %arrayidx1, ptr noundef %arrayidx2) #3, !dbg !1109
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1110
    #dbg_value(i32 %inc, !1099, !DIExpression(), !1096)
  br label %for.cond, !dbg !1111, !llvm.loop !1112

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1114
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_compress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1115 {
entry:
  %t = alloca [8 x i8], align 1
    #dbg_value(ptr %r, !1121, !DIExpression(), !1122)
    #dbg_value(ptr %a, !1123, !DIExpression(), !1122)
    #dbg_declare(ptr %t, !1124, !DIExpression(), !1126)
    #dbg_value(i32 0, !1127, !DIExpression(), !1122)
  br label %for.cond, !dbg !1128

for.cond:                                         ; preds = %for.end, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc67, %for.end ], !dbg !1130
  %r.addr.0 = phi ptr [ %r, %entry ], [ %add.ptr, %for.end ]
    #dbg_value(ptr %r.addr.0, !1121, !DIExpression(), !1122)
    #dbg_value(i32 %i.0, !1127, !DIExpression(), !1122)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1131
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end68, !dbg !1133

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1134

for.cond1:                                        ; preds = %for.cond1.preheader, %for.body3
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond1.preheader ], !dbg !1137
    #dbg_value(i32 %j.0, !1138, !DIExpression(), !1122)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1139
  br i1 %exitcond, label %for.body3, label %for.end, !dbg !1134

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !1141
  %add = or disjoint i32 %mul, %j.0, !dbg !1143
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add, !dbg !1144
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1144
    #dbg_value(i16 %0, !1145, !DIExpression(), !1122)
  %isneg = icmp slt i16 %0, 0, !dbg !1146
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !1146
  %add5 = add i16 %and, %0, !dbg !1147
    #dbg_value(i16 %add5, !1145, !DIExpression(), !1122)
  %conv7 = sext i16 %add5 to i32, !dbg !1148
    #dbg_value(i32 %conv7, !1149, !DIExpression(DW_OP_constu, 5, DW_OP_shl, DW_OP_stack_value), !1122)
    #dbg_value(i32 %conv7, !1149, !DIExpression(DW_OP_constu, 5, DW_OP_shl, DW_OP_plus_uconst, 1664, DW_OP_stack_value), !1122)
  %1 = mul i32 %conv7, 1290176, !dbg !1150
  %mul9 = add i32 %1, 67089152, !dbg !1150
    #dbg_value(i32 %mul9, !1149, !DIExpression(), !1122)
  %shr10 = lshr i32 %mul9, 27, !dbg !1151
    #dbg_value(i32 %shr10, !1149, !DIExpression(), !1122)
  %conv12 = trunc nuw nsw i32 %shr10 to i8, !dbg !1152
  %arrayidx13 = getelementptr inbounds nuw [8 x i8], ptr %t, i32 0, i32 %j.0, !dbg !1153
  store i8 %conv12, ptr %arrayidx13, align 1, !dbg !1154
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1155
    #dbg_value(i32 %inc, !1138, !DIExpression(), !1122)
  br label %for.cond1, !dbg !1156, !llvm.loop !1157

for.end:                                          ; preds = %for.cond1
  %2 = load i8, ptr %t, align 1, !dbg !1159
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %t, i32 1, !dbg !1160
  %3 = load i8, ptr %arrayidx17, align 1, !dbg !1160
  %shl19 = shl i8 %3, 5, !dbg !1161
  %or = or i8 %shl19, %2, !dbg !1162
  store i8 %or, ptr %r.addr.0, align 1, !dbg !1163
  %4 = lshr i8 %3, 3, !dbg !1164
  %arrayidx25 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !1165
  %5 = load i8, ptr %arrayidx25, align 1, !dbg !1165
  %shl27 = shl i8 %5, 2, !dbg !1166
  %or28 = or i8 %shl27, %4, !dbg !1167
  %arrayidx29 = getelementptr inbounds nuw i8, ptr %t, i32 3, !dbg !1168
  %6 = load i8, ptr %arrayidx29, align 1, !dbg !1168
  %shl31 = shl i8 %6, 7, !dbg !1169
  %or32 = or i8 %or28, %shl31, !dbg !1170
  %arrayidx34 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 1, !dbg !1171
  store i8 %or32, ptr %arrayidx34, align 1, !dbg !1172
  %7 = lshr i8 %6, 1, !dbg !1173
  %arrayidx38 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !1174
  %8 = load i8, ptr %arrayidx38, align 1, !dbg !1174
  %shl40 = shl i8 %8, 4, !dbg !1175
  %or41 = or i8 %shl40, %7, !dbg !1176
  %arrayidx43 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 2, !dbg !1177
  store i8 %or41, ptr %arrayidx43, align 1, !dbg !1178
  %9 = lshr i8 %8, 4, !dbg !1179
  %arrayidx47 = getelementptr inbounds nuw i8, ptr %t, i32 5, !dbg !1180
  %10 = load i8, ptr %arrayidx47, align 1, !dbg !1180
  %shl49 = shl i8 %10, 1, !dbg !1181
  %or50 = or i8 %shl49, %9, !dbg !1182
  %arrayidx51 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !1183
  %11 = load i8, ptr %arrayidx51, align 1, !dbg !1183
  %shl53 = shl i8 %11, 6, !dbg !1184
  %or54 = or i8 %or50, %shl53, !dbg !1185
  %arrayidx56 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 3, !dbg !1186
  store i8 %or54, ptr %arrayidx56, align 1, !dbg !1187
  %12 = lshr i8 %11, 2, !dbg !1188
  %arrayidx60 = getelementptr inbounds nuw i8, ptr %t, i32 7, !dbg !1189
  %13 = load i8, ptr %arrayidx60, align 1, !dbg !1189
  %shl62 = shl i8 %13, 3, !dbg !1190
  %or63 = or i8 %shl62, %12, !dbg !1191
  %arrayidx65 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 4, !dbg !1192
  store i8 %or63, ptr %arrayidx65, align 1, !dbg !1193
    #dbg_value(ptr %r.addr.0, !1121, !DIExpression(DW_OP_plus_uconst, 5, DW_OP_stack_value), !1122)
  %add.ptr = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 5, !dbg !1194
    #dbg_value(ptr %add.ptr, !1121, !DIExpression(), !1122)
  %inc67 = add nuw nsw i32 %i.0, 1, !dbg !1195
    #dbg_value(i32 %inc67, !1127, !DIExpression(), !1122)
  br label %for.cond, !dbg !1196, !llvm.loop !1197

for.end68:                                        ; preds = %for.cond
  ret void, !dbg !1199
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_decompress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1200 {
entry:
  %t = alloca [8 x i8], align 1
    #dbg_value(ptr %r, !1203, !DIExpression(), !1204)
    #dbg_value(ptr %a, !1205, !DIExpression(), !1204)
    #dbg_declare(ptr %t, !1206, !DIExpression(), !1207)
    #dbg_value(i32 0, !1208, !DIExpression(), !1204)
  br label %for.cond, !dbg !1209

for.cond:                                         ; preds = %for.inc63, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc64, %for.inc63 ], !dbg !1211
  %a.addr.0 = phi ptr [ %a, %entry ], [ %add.ptr, %for.inc63 ]
    #dbg_value(ptr %a.addr.0, !1205, !DIExpression(), !1204)
    #dbg_value(i32 %i.0, !1208, !DIExpression(), !1204)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1212
  br i1 %exitcond1, label %for.body, label %for.end65, !dbg !1214

for.body:                                         ; preds = %for.cond
  %0 = load i8, ptr %a.addr.0, align 1, !dbg !1215
  store i8 %0, ptr %t, align 1, !dbg !1217
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 1, !dbg !1218
  %1 = load i8, ptr %arrayidx6, align 1, !dbg !1218
  %or = call i8 @llvm.fshl.i8(i8 %1, i8 %0, i8 3), !dbg !1219
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %t, i32 1, !dbg !1220
  store i8 %or, ptr %arrayidx9, align 1, !dbg !1221
  %2 = lshr i8 %1, 2, !dbg !1222
  %arrayidx14 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !1223
  store i8 %2, ptr %arrayidx14, align 1, !dbg !1224
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 1, !dbg !1225
  %3 = load i8, ptr %arrayidx15, align 1, !dbg !1225
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 2, !dbg !1226
  %4 = load i8, ptr %arrayidx18, align 1, !dbg !1226
  %or21 = call i8 @llvm.fshl.i8(i8 %4, i8 %3, i8 1), !dbg !1227
  %arrayidx23 = getelementptr inbounds nuw i8, ptr %t, i32 3, !dbg !1228
  store i8 %or21, ptr %arrayidx23, align 1, !dbg !1229
  %arrayidx27 = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 3, !dbg !1230
  %5 = load i8, ptr %arrayidx27, align 1, !dbg !1230
  %or30 = call i8 @llvm.fshl.i8(i8 %5, i8 %4, i8 4), !dbg !1231
  %arrayidx32 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !1232
  store i8 %or30, ptr %arrayidx32, align 1, !dbg !1233
  %6 = lshr i8 %5, 1, !dbg !1234
  %arrayidx37 = getelementptr inbounds nuw i8, ptr %t, i32 5, !dbg !1235
  store i8 %6, ptr %arrayidx37, align 1, !dbg !1236
  %arrayidx38 = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 3, !dbg !1237
  %7 = load i8, ptr %arrayidx38, align 1, !dbg !1237
  %arrayidx41 = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 4, !dbg !1238
  %8 = load i8, ptr %arrayidx41, align 1, !dbg !1238
  %or44 = call i8 @llvm.fshl.i8(i8 %8, i8 %7, i8 2), !dbg !1239
  %arrayidx46 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !1240
  store i8 %or44, ptr %arrayidx46, align 1, !dbg !1241
  %9 = lshr i8 %8, 3, !dbg !1242
  %arrayidx51 = getelementptr inbounds nuw i8, ptr %t, i32 7, !dbg !1243
  store i8 %9, ptr %arrayidx51, align 1, !dbg !1244
    #dbg_value(ptr %add.ptr, !1205, !DIExpression(), !1204)
    #dbg_value(i32 0, !1245, !DIExpression(), !1204)
  br label %for.cond52, !dbg !1246

for.cond52:                                       ; preds = %for.body55, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body55 ], !dbg !1248
    #dbg_value(i32 %j.0, !1245, !DIExpression(), !1204)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1249
  br i1 %exitcond, label %for.body55, label %for.inc63, !dbg !1251

for.body55:                                       ; preds = %for.cond52
  %arrayidx56 = getelementptr inbounds nuw [8 x i8], ptr %t, i32 0, i32 %j.0, !dbg !1252
  %10 = load i8, ptr %arrayidx56, align 1, !dbg !1252
  %11 = and i8 %10, 31, !dbg !1253
  %and = zext nneg i8 %11 to i32, !dbg !1253
  %mul = mul nuw nsw i32 %and, 3329, !dbg !1254
  %add = add nuw nsw i32 %mul, 16, !dbg !1255
  %shr58 = lshr i32 %add, 5, !dbg !1256
  %conv59 = trunc nuw nsw i32 %shr58 to i16, !dbg !1257
  %mul60 = shl nuw nsw i32 %i.0, 3, !dbg !1258
  %add61 = or disjoint i32 %mul60, %j.0, !dbg !1259
  %arrayidx62 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add61, !dbg !1260
  store i16 %conv59, ptr %arrayidx62, align 2, !dbg !1261
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1262
    #dbg_value(i32 %inc, !1245, !DIExpression(), !1204)
  br label %for.cond52, !dbg !1263, !llvm.loop !1264

for.inc63:                                        ; preds = %for.cond52
  %add.ptr = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 5, !dbg !1266
  %inc64 = add nuw nsw i32 %i.0, 1, !dbg !1267
    #dbg_value(i32 %inc64, !1208, !DIExpression(), !1204)
  br label %for.cond, !dbg !1268, !llvm.loop !1269

for.end65:                                        ; preds = %for.cond
  ret void, !dbg !1271
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_tobytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1272 {
entry:
    #dbg_value(ptr %r, !1273, !DIExpression(), !1274)
    #dbg_value(ptr %a, !1275, !DIExpression(), !1274)
    #dbg_value(i32 0, !1276, !DIExpression(), !1274)
  br label %for.cond, !dbg !1277

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1279
    #dbg_value(i32 %i.0, !1276, !DIExpression(), !1274)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !1280
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1282

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 1, !dbg !1283
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %mul, !dbg !1285
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1285
    #dbg_value(i16 %0, !1286, !DIExpression(), !1274)
  %isneg = icmp slt i16 %0, 0, !dbg !1287
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !1287
  %add = add i16 %and, %0, !dbg !1288
    #dbg_value(i16 %add, !1286, !DIExpression(), !1274)
  %mul3 = shl nuw nsw i32 %i.0, 1, !dbg !1289
  %add4 = or disjoint i32 %mul3, 1, !dbg !1290
  %arrayidx5 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add4, !dbg !1291
  %1 = load i16, ptr %arrayidx5, align 2, !dbg !1291
    #dbg_value(i16 %1, !1292, !DIExpression(), !1274)
  %isneg1 = icmp slt i16 %1, 0, !dbg !1293
  %and8 = select i1 %isneg1, i16 3329, i16 0, !dbg !1293
  %add10 = add i16 %and8, %1, !dbg !1294
    #dbg_value(i16 %add10, !1292, !DIExpression(), !1274)
  %conv14 = trunc i16 %add to i8, !dbg !1295
  %mul15 = mul nuw nsw i32 %i.0, 3, !dbg !1296
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %r, i32 %mul15, !dbg !1297
  store i8 %conv14, ptr %arrayidx17, align 1, !dbg !1298
  %2 = lshr i16 %add, 8, !dbg !1299
  %shr19 = trunc nuw i16 %2 to i8, !dbg !1299
  %conv20 = trunc i16 %add10 to i8, !dbg !1300
  %shl = shl i8 %conv20, 4, !dbg !1301
  %or = or i8 %shl, %shr19, !dbg !1302
  %mul22 = mul nuw nsw i32 %i.0, 3, !dbg !1303
  %3 = getelementptr inbounds nuw i8, ptr %r, i32 %mul22, !dbg !1304
  %arrayidx24 = getelementptr inbounds nuw i8, ptr %3, i32 1, !dbg !1304
  store i8 %or, ptr %arrayidx24, align 1, !dbg !1305
  %4 = lshr i16 %add10, 4, !dbg !1306
  %conv27 = trunc i16 %4 to i8, !dbg !1307
  %mul28 = mul nuw nsw i32 %i.0, 3, !dbg !1308
  %5 = getelementptr inbounds nuw i8, ptr %r, i32 %mul28, !dbg !1309
  %arrayidx30 = getelementptr inbounds nuw i8, ptr %5, i32 2, !dbg !1309
  store i8 %conv27, ptr %arrayidx30, align 1, !dbg !1310
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1311
    #dbg_value(i32 %inc, !1276, !DIExpression(), !1274)
  br label %for.cond, !dbg !1312, !llvm.loop !1313

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1315
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_frombytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1316 {
entry:
    #dbg_value(ptr %r, !1317, !DIExpression(), !1318)
    #dbg_value(ptr %a, !1319, !DIExpression(), !1318)
    #dbg_value(i32 0, !1320, !DIExpression(), !1318)
  br label %for.cond, !dbg !1321

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1323
    #dbg_value(i32 %i.0, !1320, !DIExpression(), !1318)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !1324
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1326

for.body:                                         ; preds = %for.cond
  %mul = mul nuw nsw i32 %i.0, 3, !dbg !1327
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %mul, !dbg !1329
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1329
  %conv = zext i8 %0 to i16, !dbg !1329
  %mul1 = mul nuw nsw i32 %i.0, 3, !dbg !1330
  %1 = getelementptr inbounds nuw i8, ptr %a, i32 %mul1, !dbg !1331
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %1, i32 1, !dbg !1331
  %2 = load i8, ptr %arrayidx3, align 1, !dbg !1331
  %conv5 = zext i8 %2 to i16, !dbg !1332
  %shl = shl nuw i16 %conv5, 8, !dbg !1333
  %shl.masked = and i16 %shl, 3840, !dbg !1334
  %and = or disjoint i16 %shl.masked, %conv, !dbg !1334
  %mul7 = shl nuw nsw i32 %i.0, 1, !dbg !1335
  %arrayidx8 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul7, !dbg !1336
  store i16 %and, ptr %arrayidx8, align 2, !dbg !1337
  %mul9 = mul nuw nsw i32 %i.0, 3, !dbg !1338
  %3 = getelementptr inbounds nuw i8, ptr %a, i32 %mul9, !dbg !1339
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %3, i32 1, !dbg !1339
  %4 = load i8, ptr %arrayidx11, align 1, !dbg !1339
  %5 = lshr i8 %4, 4, !dbg !1340
  %shr13 = zext nneg i8 %5 to i16, !dbg !1340
  %mul14 = mul nuw nsw i32 %i.0, 3, !dbg !1341
  %6 = getelementptr inbounds nuw i8, ptr %a, i32 %mul14, !dbg !1342
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %6, i32 2, !dbg !1342
  %7 = load i8, ptr %arrayidx16, align 1, !dbg !1342
  %conv18 = zext i8 %7 to i16, !dbg !1343
  %shl19 = shl nuw nsw i16 %conv18, 4, !dbg !1344
  %or20 = or disjoint i16 %shl19, %shr13, !dbg !1345
  %mul23 = shl nuw nsw i32 %i.0, 1, !dbg !1346
  %add24 = or disjoint i32 %mul23, 1, !dbg !1347
  %arrayidx25 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add24, !dbg !1348
  store i16 %or20, ptr %arrayidx25, align 2, !dbg !1349
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1350
    #dbg_value(i32 %inc, !1320, !DIExpression(), !1318)
  br label %for.cond, !dbg !1351, !llvm.loop !1352

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1354
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_frommsg(ptr noundef %r, ptr noundef %msg) local_unnamed_addr #0 !dbg !1355 {
entry:
    #dbg_value(ptr %r, !1356, !DIExpression(), !1357)
    #dbg_value(ptr %msg, !1358, !DIExpression(), !1357)
    #dbg_value(i32 0, !1359, !DIExpression(), !1357)
  br label %for.cond, !dbg !1360

for.cond:                                         ; preds = %for.inc8, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc9, %for.inc8 ], !dbg !1362
    #dbg_value(i32 %i.0, !1359, !DIExpression(), !1357)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1363
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end10, !dbg !1365

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1366

for.cond1:                                        ; preds = %for.cond1.preheader, %for.body3
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond1.preheader ], !dbg !1369
    #dbg_value(i32 %j.0, !1370, !DIExpression(), !1357)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1371
  br i1 %exitcond, label %for.body3, label %for.inc8, !dbg !1366

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !1373
  %add = or disjoint i32 %mul, %j.0, !dbg !1375
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add, !dbg !1376
  store i16 0, ptr %arrayidx, align 2, !dbg !1377
  %add.ptr.idx = shl nuw nsw i32 %i.0, 4, !dbg !1378
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 %add.ptr.idx, !dbg !1378
  %add.ptr5 = getelementptr inbounds nuw i16, ptr %add.ptr, i32 %j.0, !dbg !1379
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1380
  %0 = load i8, ptr %arrayidx6, align 1, !dbg !1380
  %conv = zext i8 %0 to i32, !dbg !1380
  %shr = lshr i32 %conv, %j.0, !dbg !1381
  %1 = trunc nuw nsw i32 %shr to i16, !dbg !1382
  %conv7 = and i16 %1, 1, !dbg !1382
  call void @pqcrystals_kyber1024_ref_cmov_int16(ptr noundef %add.ptr5, i16 noundef signext 1665, i16 noundef zeroext %conv7) #3, !dbg !1383
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1384
    #dbg_value(i32 %inc, !1370, !DIExpression(), !1357)
  br label %for.cond1, !dbg !1385, !llvm.loop !1386

for.inc8:                                         ; preds = %for.cond1
  %inc9 = add nuw nsw i32 %i.0, 1, !dbg !1388
    #dbg_value(i32 %inc9, !1359, !DIExpression(), !1357)
  br label %for.cond, !dbg !1389, !llvm.loop !1390

for.end10:                                        ; preds = %for.cond
  ret void, !dbg !1392
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_tomsg(ptr noundef %msg, ptr noundef %a) local_unnamed_addr #0 !dbg !1393 {
entry:
    #dbg_value(ptr %msg, !1394, !DIExpression(), !1395)
    #dbg_value(ptr %a, !1396, !DIExpression(), !1395)
    #dbg_value(i32 0, !1397, !DIExpression(), !1395)
  br label %for.cond, !dbg !1398

for.cond:                                         ; preds = %for.inc11, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc12, %for.inc11 ], !dbg !1400
    #dbg_value(i32 %i.0, !1397, !DIExpression(), !1395)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1401
  br i1 %exitcond1, label %for.body, label %for.end13, !dbg !1403

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1404
  store i8 0, ptr %arrayidx, align 1, !dbg !1406
    #dbg_value(i32 0, !1407, !DIExpression(), !1395)
  br label %for.cond1, !dbg !1408

for.cond1:                                        ; preds = %for.body3, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body3 ], !dbg !1410
    #dbg_value(i32 %j.0, !1407, !DIExpression(), !1395)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1411
  br i1 %exitcond, label %for.body3, label %for.inc11, !dbg !1413

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !1414
  %add = or disjoint i32 %mul, %j.0, !dbg !1416
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add, !dbg !1417
  %0 = load i16, ptr %arrayidx4, align 2, !dbg !1417
  %conv = sext i16 %0 to i32, !dbg !1417
    #dbg_value(i32 %conv, !1418, !DIExpression(), !1395)
    #dbg_value(i32 %conv, !1418, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_stack_value), !1395)
    #dbg_value(i32 %conv, !1418, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !1395)
  %1 = mul i32 %conv, 161270, !dbg !1419
  %mul6 = add i32 %1, 134257275, !dbg !1419
    #dbg_value(i32 %mul6, !1418, !DIExpression(), !1395)
  %shr = lshr i32 %mul6, 28, !dbg !1420
    #dbg_value(i32 %shr, !1418, !DIExpression(), !1395)
  %and = and i32 %shr, 1, !dbg !1421
    #dbg_value(i32 %and, !1418, !DIExpression(), !1395)
  %shl7 = shl nuw nsw i32 %and, %j.0, !dbg !1422
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1423
  %2 = load i8, ptr %arrayidx8, align 1, !dbg !1424
  %3 = trunc nuw i32 %shl7 to i8, !dbg !1424
  %conv10 = or i8 %2, %3, !dbg !1424
  store i8 %conv10, ptr %arrayidx8, align 1, !dbg !1424
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1425
    #dbg_value(i32 %inc, !1407, !DIExpression(), !1395)
  br label %for.cond1, !dbg !1426, !llvm.loop !1427

for.inc11:                                        ; preds = %for.cond1
  %inc12 = add nuw nsw i32 %i.0, 1, !dbg !1429
    #dbg_value(i32 %inc12, !1397, !DIExpression(), !1395)
  br label %for.cond, !dbg !1430, !llvm.loop !1431

for.end13:                                        ; preds = %for.cond
  ret void, !dbg !1433
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_getnoise_eta1(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !1434 {
entry:
  %buf = alloca [128 x i8], align 1
    #dbg_value(ptr %r, !1437, !DIExpression(), !1438)
    #dbg_value(ptr %seed, !1439, !DIExpression(), !1438)
    #dbg_value(i8 %nonce, !1440, !DIExpression(), !1438)
    #dbg_declare(ptr %buf, !1441, !DIExpression(), !1443)
  call void @pqcrystals_kyber1024_ref_kyber_shake256_prf(ptr noundef nonnull %buf, i32 noundef 128, ptr noundef %seed, i8 noundef zeroext %nonce) #3, !dbg !1444
  call void @pqcrystals_kyber1024_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef nonnull %buf) #3, !dbg !1445
  ret void, !dbg !1446
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_getnoise_eta2(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !1447 {
entry:
  %buf = alloca [128 x i8], align 1
    #dbg_value(ptr %r, !1448, !DIExpression(), !1449)
    #dbg_value(ptr %seed, !1450, !DIExpression(), !1449)
    #dbg_value(i8 %nonce, !1451, !DIExpression(), !1449)
    #dbg_declare(ptr %buf, !1452, !DIExpression(), !1453)
  call void @pqcrystals_kyber1024_ref_kyber_shake256_prf(ptr noundef nonnull %buf, i32 noundef 128, ptr noundef %seed, i8 noundef zeroext %nonce) #3, !dbg !1454
  call void @pqcrystals_kyber1024_ref_poly_cbd_eta2(ptr noundef %r, ptr noundef nonnull %buf) #3, !dbg !1455
  ret void, !dbg !1456
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1457 {
entry:
    #dbg_value(ptr %r, !1460, !DIExpression(), !1461)
  call void @pqcrystals_kyber1024_ref_ntt(ptr noundef %r) #3, !dbg !1462
  call void @pqcrystals_kyber1024_ref_poly_reduce(ptr noundef %r) #3, !dbg !1463
  ret void, !dbg !1464
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_reduce(ptr noundef %r) local_unnamed_addr #0 !dbg !1465 {
entry:
    #dbg_value(ptr %r, !1466, !DIExpression(), !1467)
    #dbg_value(i32 0, !1468, !DIExpression(), !1467)
  br label %for.cond, !dbg !1469

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1471
    #dbg_value(i32 %i.0, !1468, !DIExpression(), !1467)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1472
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1474

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1475
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1475
  %call = call signext i16 @pqcrystals_kyber1024_ref_barrett_reduce(i16 noundef signext %0) #3, !dbg !1476
  %arrayidx1 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1477
  store i16 %call, ptr %arrayidx1, align 2, !dbg !1478
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1479
    #dbg_value(i32 %inc, !1468, !DIExpression(), !1467)
  br label %for.cond, !dbg !1480, !llvm.loop !1481

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1483
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_invntt_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !1484 {
entry:
    #dbg_value(ptr %r, !1485, !DIExpression(), !1486)
  call void @pqcrystals_kyber1024_ref_invntt(ptr noundef %r) #3, !dbg !1487
  ret void, !dbg !1488
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1489 {
entry:
    #dbg_value(ptr %r, !1492, !DIExpression(), !1493)
    #dbg_value(ptr %a, !1494, !DIExpression(), !1493)
    #dbg_value(ptr %b, !1495, !DIExpression(), !1493)
    #dbg_value(i32 0, !1496, !DIExpression(), !1493)
  br label %for.cond, !dbg !1497

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1499
    #dbg_value(i32 %i.0, !1496, !DIExpression(), !1493)
  %exitcond = icmp ne i32 %i.0, 64, !dbg !1500
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1502

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 2, !dbg !1503
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul, !dbg !1505
  %mul1 = shl nuw nsw i32 %i.0, 2, !dbg !1506
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %mul1, !dbg !1507
  %mul3 = shl nuw nsw i32 %i.0, 2, !dbg !1508
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %mul3, !dbg !1509
  %add = or disjoint i32 %i.0, 64, !dbg !1510
  %arrayidx5 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber1024_ref_zetas, i32 0, i32 %add, !dbg !1511
  %0 = load i16, ptr %arrayidx5, align 2, !dbg !1511
  call void @pqcrystals_kyber1024_ref_basemul(ptr noundef %arrayidx, ptr noundef %arrayidx2, ptr noundef %arrayidx4, i16 noundef signext %0) #3, !dbg !1512
  %mul6 = shl nuw nsw i32 %i.0, 2, !dbg !1513
  %add7 = or disjoint i32 %mul6, 2, !dbg !1514
  %arrayidx8 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add7, !dbg !1515
  %mul9 = shl nuw nsw i32 %i.0, 2, !dbg !1516
  %add10 = or disjoint i32 %mul9, 2, !dbg !1517
  %arrayidx11 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add10, !dbg !1518
  %mul12 = shl nuw nsw i32 %i.0, 2, !dbg !1519
  %add13 = or disjoint i32 %mul12, 2, !dbg !1520
  %arrayidx14 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %add13, !dbg !1521
  %add15 = or disjoint i32 %i.0, 64, !dbg !1522
  %arrayidx16 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber1024_ref_zetas, i32 0, i32 %add15, !dbg !1523
  %1 = load i16, ptr %arrayidx16, align 2, !dbg !1523
  %sub = sub i16 0, %1, !dbg !1524
  call void @pqcrystals_kyber1024_ref_basemul(ptr noundef nonnull %arrayidx8, ptr noundef nonnull %arrayidx11, ptr noundef nonnull %arrayidx14, i16 noundef signext %sub) #3, !dbg !1525
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1526
    #dbg_value(i32 %inc, !1496, !DIExpression(), !1493)
  br label %for.cond, !dbg !1527, !llvm.loop !1528

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1530
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !1531 {
entry:
    #dbg_value(ptr %r, !1532, !DIExpression(), !1533)
    #dbg_value(i16 1353, !1534, !DIExpression(), !1533)
    #dbg_value(i32 0, !1535, !DIExpression(), !1533)
  br label %for.cond, !dbg !1536

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1538
    #dbg_value(i32 %i.0, !1535, !DIExpression(), !1533)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1539
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1541

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1542
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1542
  %conv = sext i16 %0 to i32, !dbg !1543
  %mul = mul nsw i32 %conv, 1353, !dbg !1544
  %call = call signext i16 @pqcrystals_kyber1024_ref_montgomery_reduce(i32 noundef %mul) #3, !dbg !1545
  %arrayidx1 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1546
  store i16 %call, ptr %arrayidx1, align 2, !dbg !1547
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1548
    #dbg_value(i32 %inc, !1535, !DIExpression(), !1533)
  br label %for.cond, !dbg !1549, !llvm.loop !1550

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1552
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1553 {
entry:
    #dbg_value(ptr %r, !1554, !DIExpression(), !1555)
    #dbg_value(ptr %a, !1556, !DIExpression(), !1555)
    #dbg_value(ptr %b, !1557, !DIExpression(), !1555)
    #dbg_value(i32 0, !1558, !DIExpression(), !1555)
  br label %for.cond, !dbg !1559

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1561
    #dbg_value(i32 %i.0, !1558, !DIExpression(), !1555)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1562
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1564

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %i.0, !dbg !1565
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1565
  %arrayidx1 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %i.0, !dbg !1566
  %1 = load i16, ptr %arrayidx1, align 2, !dbg !1566
  %add = add i16 %0, %1, !dbg !1567
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1568
  store i16 %add, ptr %arrayidx4, align 2, !dbg !1569
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1570
    #dbg_value(i32 %inc, !1558, !DIExpression(), !1555)
  br label %for.cond, !dbg !1571, !llvm.loop !1572

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1574
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_sub(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1575 {
entry:
    #dbg_value(ptr %r, !1576, !DIExpression(), !1577)
    #dbg_value(ptr %a, !1578, !DIExpression(), !1577)
    #dbg_value(ptr %b, !1579, !DIExpression(), !1577)
    #dbg_value(i32 0, !1580, !DIExpression(), !1577)
  br label %for.cond, !dbg !1581

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1583
    #dbg_value(i32 %i.0, !1580, !DIExpression(), !1577)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1584
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1586

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %i.0, !dbg !1587
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1587
  %arrayidx1 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %i.0, !dbg !1588
  %1 = load i16, ptr %arrayidx1, align 2, !dbg !1588
  %sub = sub i16 %0, %1, !dbg !1589
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1590
  store i16 %sub, ptr %arrayidx4, align 2, !dbg !1591
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1592
    #dbg_value(i32 %inc, !1580, !DIExpression(), !1577)
  br label %for.cond, !dbg !1593, !llvm.loop !1594

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1596
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1597 {
entry:
    #dbg_value(ptr %r, !1600, !DIExpression(), !1601)
    #dbg_value(i32 1, !1602, !DIExpression(), !1601)
    #dbg_value(i32 128, !1603, !DIExpression(), !1601)
  br label %for.cond, !dbg !1604

for.cond:                                         ; preds = %for.inc24, %entry
  %len.0 = phi i32 [ 128, %entry ], [ %shr, %for.inc24 ], !dbg !1606
  %k.0 = phi i32 [ 1, %entry ], [ %k.1.lcssa, %for.inc24 ], !dbg !1607
    #dbg_value(i32 %k.0, !1602, !DIExpression(), !1601)
    #dbg_value(i32 %len.0, !1603, !DIExpression(), !1601)
  %cmp = icmp samesign ugt i32 %len.0, 1, !dbg !1608
  br i1 %cmp, label %for.cond1.preheader, label %for.end25, !dbg !1610

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1611

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc21
  %start.0 = phi i32 [ %add22, %for.inc21 ], [ 0, %for.cond1.preheader ], !dbg !1614
  %k.1 = phi i32 [ %inc, %for.inc21 ], [ %k.0, %for.cond1.preheader ], !dbg !1601
    #dbg_value(i32 %k.1, !1602, !DIExpression(), !1601)
    #dbg_value(i32 %start.0, !1615, !DIExpression(), !1601)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !1616
  br i1 %cmp2, label %for.body3, label %for.inc24, !dbg !1611

for.body3:                                        ; preds = %for.cond1
    #dbg_value(i32 %inc, !1602, !DIExpression(), !1601)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber1024_ref_zetas, i32 0, i32 %k.1, !dbg !1618
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1618
    #dbg_value(i16 %0, !1620, !DIExpression(), !1601)
    #dbg_value(i32 %start.0, !1621, !DIExpression(), !1601)
  br label %for.cond4, !dbg !1622

for.cond4:                                        ; preds = %for.body6, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc20, %for.body6 ], !dbg !1624
    #dbg_value(i32 %j.0, !1621, !DIExpression(), !1601)
  %add = add nuw nsw i32 %start.0, %len.0, !dbg !1625
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !1627
  br i1 %cmp5, label %for.body6, label %for.inc21, !dbg !1628

for.body6:                                        ; preds = %for.cond4
  %1 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1629
  %arrayidx8 = getelementptr i16, ptr %1, i32 %len.0, !dbg !1629
  %2 = load i16, ptr %arrayidx8, align 2, !dbg !1629
  %call = call fastcc signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %2) #3, !dbg !1631
    #dbg_value(i16 %call, !1632, !DIExpression(), !1601)
  %arrayidx9 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1633
  %3 = load i16, ptr %arrayidx9, align 2, !dbg !1633
  %sub = sub i16 %3, %call, !dbg !1634
  %4 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1635
  %arrayidx13 = getelementptr i16, ptr %4, i32 %len.0, !dbg !1635
  store i16 %sub, ptr %arrayidx13, align 2, !dbg !1636
  %arrayidx14 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1637
  %5 = load i16, ptr %arrayidx14, align 2, !dbg !1637
  %add17 = add i16 %5, %call, !dbg !1638
  %arrayidx19 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1639
  store i16 %add17, ptr %arrayidx19, align 2, !dbg !1640
  %inc20 = add nuw i32 %j.0, 1, !dbg !1641
    #dbg_value(i32 %inc20, !1621, !DIExpression(), !1601)
  br label %for.cond4, !dbg !1642, !llvm.loop !1643

for.inc21:                                        ; preds = %for.cond4
  %j.0.lcssa = phi i32 [ %j.0, %for.cond4 ], !dbg !1624
  %inc = add i32 %k.1, 1, !dbg !1645
  %add22 = add i32 %j.0.lcssa, %len.0, !dbg !1646
    #dbg_value(i32 %add22, !1615, !DIExpression(), !1601)
  br label %for.cond1, !dbg !1647, !llvm.loop !1648

for.inc24:                                        ; preds = %for.cond1
  %k.1.lcssa = phi i32 [ %k.1, %for.cond1 ], !dbg !1601
  %shr = lshr i32 %len.0, 1, !dbg !1650
    #dbg_value(i32 %shr, !1603, !DIExpression(), !1601)
  br label %for.cond, !dbg !1651, !llvm.loop !1652

for.end25:                                        ; preds = %for.cond
  ret void, !dbg !1654
}

; Function Attrs: nounwind
define internal fastcc signext i16 @fqmul(i16 noundef signext %a, i16 noundef signext %b) unnamed_addr #0 !dbg !1655 {
entry:
    #dbg_value(i16 %a, !1658, !DIExpression(), !1659)
    #dbg_value(i16 %b, !1660, !DIExpression(), !1659)
  %conv = sext i16 %a to i32, !dbg !1661
  %conv1 = sext i16 %b to i32, !dbg !1662
  %mul = mul nsw i32 %conv, %conv1, !dbg !1663
  %call = call signext i16 @pqcrystals_kyber1024_ref_montgomery_reduce(i32 noundef %mul) #3, !dbg !1664
  ret i16 %call, !dbg !1665
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_invntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1666 {
entry:
    #dbg_value(ptr %r, !1667, !DIExpression(), !1668)
    #dbg_value(i16 1441, !1669, !DIExpression(), !1668)
    #dbg_value(i32 127, !1670, !DIExpression(), !1668)
    #dbg_value(i32 2, !1671, !DIExpression(), !1668)
  br label %for.cond, !dbg !1672

for.cond:                                         ; preds = %for.inc29, %entry
  %len.0 = phi i32 [ 2, %entry ], [ %shl, %for.inc29 ], !dbg !1674
  %k.0 = phi i32 [ 127, %entry ], [ %k.1.lcssa, %for.inc29 ], !dbg !1675
    #dbg_value(i32 %k.0, !1670, !DIExpression(), !1668)
    #dbg_value(i32 %len.0, !1671, !DIExpression(), !1668)
  %cmp = icmp ult i32 %len.0, 129, !dbg !1676
  br i1 %cmp, label %for.cond1.preheader, label %for.cond31.preheader, !dbg !1678

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1679

for.cond31.preheader:                             ; preds = %for.cond
  br label %for.cond31, !dbg !1682

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc26
  %start.0 = phi i32 [ %add27, %for.inc26 ], [ 0, %for.cond1.preheader ], !dbg !1684
  %k.1 = phi i32 [ %dec, %for.inc26 ], [ %k.0, %for.cond1.preheader ], !dbg !1668
    #dbg_value(i32 %k.1, !1670, !DIExpression(), !1668)
    #dbg_value(i32 %start.0, !1685, !DIExpression(), !1668)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !1686
  br i1 %cmp2, label %for.body3, label %for.inc29, !dbg !1679

for.body3:                                        ; preds = %for.cond1
    #dbg_value(i32 %dec, !1670, !DIExpression(), !1668)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber1024_ref_zetas, i32 0, i32 %k.1, !dbg !1688
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1688
    #dbg_value(i16 %0, !1690, !DIExpression(), !1668)
    #dbg_value(i32 %start.0, !1691, !DIExpression(), !1668)
  br label %for.cond4, !dbg !1692

for.cond4:                                        ; preds = %for.body6, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc, %for.body6 ], !dbg !1694
    #dbg_value(i32 %j.0, !1691, !DIExpression(), !1668)
  %add = add nuw nsw i32 %start.0, %len.0, !dbg !1695
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !1697
  br i1 %cmp5, label %for.body6, label %for.inc26, !dbg !1698

for.body6:                                        ; preds = %for.cond4
  %arrayidx7 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1699
  %1 = load i16, ptr %arrayidx7, align 2, !dbg !1699
    #dbg_value(i16 %1, !1701, !DIExpression(), !1668)
  %2 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1702
  %arrayidx9 = getelementptr i16, ptr %2, i32 %len.0, !dbg !1702
  %3 = load i16, ptr %arrayidx9, align 2, !dbg !1702
  %add11 = add i16 %1, %3, !dbg !1703
  %call = call signext i16 @pqcrystals_kyber1024_ref_barrett_reduce(i16 noundef signext %add11) #3, !dbg !1704
  %arrayidx13 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1705
  store i16 %call, ptr %arrayidx13, align 2, !dbg !1706
  %4 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1707
  %arrayidx15 = getelementptr i16, ptr %4, i32 %len.0, !dbg !1707
  %5 = load i16, ptr %arrayidx15, align 2, !dbg !1707
  %sub = sub i16 %5, %1, !dbg !1708
  %6 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1709
  %arrayidx20 = getelementptr i16, ptr %6, i32 %len.0, !dbg !1709
  store i16 %sub, ptr %arrayidx20, align 2, !dbg !1710
  %7 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1711
  %arrayidx22 = getelementptr i16, ptr %7, i32 %len.0, !dbg !1711
  %8 = load i16, ptr %arrayidx22, align 2, !dbg !1711
  %call23 = call fastcc signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %8) #3, !dbg !1712
  %9 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1713
  %arrayidx25 = getelementptr i16, ptr %9, i32 %len.0, !dbg !1713
  store i16 %call23, ptr %arrayidx25, align 2, !dbg !1714
  %inc = add nuw i32 %j.0, 1, !dbg !1715
    #dbg_value(i32 %inc, !1691, !DIExpression(), !1668)
  br label %for.cond4, !dbg !1716, !llvm.loop !1717

for.inc26:                                        ; preds = %for.cond4
  %j.0.lcssa = phi i32 [ %j.0, %for.cond4 ], !dbg !1694
  %dec = add i32 %k.1, -1, !dbg !1719
  %add27 = add i32 %j.0.lcssa, %len.0, !dbg !1720
    #dbg_value(i32 %add27, !1685, !DIExpression(), !1668)
  br label %for.cond1, !dbg !1721, !llvm.loop !1722

for.inc29:                                        ; preds = %for.cond1
  %k.1.lcssa = phi i32 [ %k.1, %for.cond1 ], !dbg !1668
  %shl = shl nuw nsw i32 %len.0, 1, !dbg !1724
    #dbg_value(i32 %shl, !1671, !DIExpression(), !1668)
  br label %for.cond, !dbg !1725, !llvm.loop !1726

for.cond31:                                       ; preds = %for.cond31.preheader, %for.body34
  %j.1 = phi i32 [ %inc39, %for.body34 ], [ 0, %for.cond31.preheader ], !dbg !1728
    #dbg_value(i32 %j.1, !1691, !DIExpression(), !1668)
  %exitcond = icmp ne i32 %j.1, 256, !dbg !1729
  br i1 %exitcond, label %for.body34, label %for.end40, !dbg !1682

for.body34:                                       ; preds = %for.cond31
  %arrayidx35 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !1731
  %10 = load i16, ptr %arrayidx35, align 2, !dbg !1731
  %call36 = call fastcc signext i16 @fqmul(i16 noundef signext %10, i16 noundef signext 1441) #3, !dbg !1732
  %arrayidx37 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !1733
  store i16 %call36, ptr %arrayidx37, align 2, !dbg !1734
  %inc39 = add nuw nsw i32 %j.1, 1, !dbg !1735
    #dbg_value(i32 %inc39, !1691, !DIExpression(), !1668)
  br label %for.cond31, !dbg !1736, !llvm.loop !1737

for.end40:                                        ; preds = %for.cond31
  ret void, !dbg !1739
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_basemul(ptr noundef %r, ptr noundef %a, ptr noundef %b, i16 noundef signext %zeta) local_unnamed_addr #0 !dbg !1740 {
entry:
    #dbg_value(ptr %r, !1744, !DIExpression(), !1745)
    #dbg_value(ptr %a, !1746, !DIExpression(), !1745)
    #dbg_value(ptr %b, !1747, !DIExpression(), !1745)
    #dbg_value(i16 %zeta, !1748, !DIExpression(), !1745)
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 2, !dbg !1749
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1749
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 2, !dbg !1750
  %1 = load i16, ptr %arrayidx1, align 2, !dbg !1750
  %call = call fastcc signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %1) #3, !dbg !1751
  store i16 %call, ptr %r, align 2, !dbg !1752
  %call4 = call fastcc signext i16 @fqmul(i16 noundef signext %call, i16 noundef signext %zeta) #3, !dbg !1753
  store i16 %call4, ptr %r, align 2, !dbg !1754
  %2 = load i16, ptr %a, align 2, !dbg !1755
  %3 = load i16, ptr %b, align 2, !dbg !1756
  %call8 = call fastcc signext i16 @fqmul(i16 noundef signext %2, i16 noundef signext %3) #3, !dbg !1757
  %4 = load i16, ptr %r, align 2, !dbg !1758
  %add = add i16 %4, %call8, !dbg !1758
  store i16 %add, ptr %r, align 2, !dbg !1758
  %5 = load i16, ptr %a, align 2, !dbg !1759
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %b, i32 2, !dbg !1760
  %6 = load i16, ptr %arrayidx13, align 2, !dbg !1760
  %call14 = call fastcc signext i16 @fqmul(i16 noundef signext %5, i16 noundef signext %6) #3, !dbg !1761
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %r, i32 2, !dbg !1762
  store i16 %call14, ptr %arrayidx15, align 2, !dbg !1763
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %a, i32 2, !dbg !1764
  %7 = load i16, ptr %arrayidx16, align 2, !dbg !1764
  %8 = load i16, ptr %b, align 2, !dbg !1765
  %call18 = call fastcc signext i16 @fqmul(i16 noundef signext %7, i16 noundef signext %8) #3, !dbg !1766
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %r, i32 2, !dbg !1767
  %9 = load i16, ptr %arrayidx20, align 2, !dbg !1768
  %add22 = add i16 %9, %call18, !dbg !1768
  store i16 %add22, ptr %arrayidx20, align 2, !dbg !1768
  ret void, !dbg !1769
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef %buf) local_unnamed_addr #0 !dbg !1770 {
entry:
    #dbg_value(ptr %r, !1772, !DIExpression(), !1773)
    #dbg_value(ptr %buf, !1774, !DIExpression(), !1773)
  call fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) #3, !dbg !1775
  ret void, !dbg !1776
}

; Function Attrs: nounwind
define internal fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) unnamed_addr #0 !dbg !1777 {
entry:
    #dbg_value(ptr %r, !1778, !DIExpression(), !1779)
    #dbg_value(ptr %buf, !1780, !DIExpression(), !1779)
    #dbg_value(i32 0, !1781, !DIExpression(), !1779)
  br label %for.cond, !dbg !1782

for.cond:                                         ; preds = %for.inc19, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc20, %for.inc19 ], !dbg !1784
    #dbg_value(i32 %i.0, !1781, !DIExpression(), !1779)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1785
  br i1 %exitcond1, label %for.body, label %for.end21, !dbg !1787

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 2, !dbg !1788
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 %mul, !dbg !1790
  %call = call fastcc i32 @load32_littleendian(ptr noundef %add.ptr) #3, !dbg !1791
    #dbg_value(i32 %call, !1792, !DIExpression(), !1779)
  %and = and i32 %call, 1431655765, !dbg !1793
    #dbg_value(i32 %and, !1794, !DIExpression(), !1779)
  %shr = lshr i32 %call, 1, !dbg !1795
  %and1 = and i32 %shr, 1431655765, !dbg !1796
  %add = add nuw i32 %and, %and1, !dbg !1797
    #dbg_value(i32 %add, !1794, !DIExpression(), !1779)
    #dbg_value(i32 0, !1798, !DIExpression(), !1779)
  br label %for.cond2, !dbg !1799

for.cond2:                                        ; preds = %for.body4, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body4 ], !dbg !1801
    #dbg_value(i32 %j.0, !1798, !DIExpression(), !1779)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1802
  br i1 %exitcond, label %for.body4, label %for.inc19, !dbg !1804

for.body4:                                        ; preds = %for.cond2
  %mul5 = shl nuw nsw i32 %j.0, 2, !dbg !1805
  %shr7 = lshr i32 %add, %mul5, !dbg !1807
  %conv = and i32 %shr7, 3, !dbg !1808
    #dbg_value(i32 %shr7, !1809, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3, DW_OP_and, DW_OP_stack_value), !1779)
  %mul9 = shl nuw nsw i32 %j.0, 2, !dbg !1810
  %add10 = or disjoint i32 %mul9, 2, !dbg !1811
  %shr11 = lshr i32 %add, %add10, !dbg !1812
  %conv13 = and i32 %shr11, 3, !dbg !1813
    #dbg_value(i32 %conv13, !1814, !DIExpression(), !1779)
  %sub = sub nsw i32 %conv, %conv13, !dbg !1815
  %conv16 = trunc nsw i32 %sub to i16, !dbg !1816
  %mul17 = shl nuw nsw i32 %i.0, 3, !dbg !1817
  %add18 = or disjoint i32 %mul17, %j.0, !dbg !1818
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add18, !dbg !1819
  store i16 %conv16, ptr %arrayidx, align 2, !dbg !1820
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1821
    #dbg_value(i32 %inc, !1798, !DIExpression(), !1779)
  br label %for.cond2, !dbg !1822, !llvm.loop !1823

for.inc19:                                        ; preds = %for.cond2
  %inc20 = add nuw nsw i32 %i.0, 1, !dbg !1825
    #dbg_value(i32 %inc20, !1781, !DIExpression(), !1779)
  br label %for.cond, !dbg !1826, !llvm.loop !1827

for.end21:                                        ; preds = %for.cond
  ret void, !dbg !1829
}

; Function Attrs: nounwind
define internal fastcc i32 @load32_littleendian(ptr noundef %x) unnamed_addr #0 !dbg !1830 {
entry:
    #dbg_value(ptr %x, !1833, !DIExpression(), !1834)
  %0 = load i8, ptr %x, align 1, !dbg !1835
  %conv = zext i8 %0 to i32, !dbg !1836
    #dbg_value(i32 %conv, !1837, !DIExpression(), !1834)
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %x, i32 1, !dbg !1838
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !1838
  %conv2 = zext i8 %1 to i32, !dbg !1839
  %shl = shl nuw nsw i32 %conv2, 8, !dbg !1840
  %or = or disjoint i32 %shl, %conv, !dbg !1841
    #dbg_value(i32 %or, !1837, !DIExpression(), !1834)
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %x, i32 2, !dbg !1842
  %2 = load i8, ptr %arrayidx3, align 1, !dbg !1842
  %conv4 = zext i8 %2 to i32, !dbg !1843
  %shl5 = shl nuw nsw i32 %conv4, 16, !dbg !1844
  %or6 = or disjoint i32 %or, %shl5, !dbg !1845
    #dbg_value(i32 %or6, !1837, !DIExpression(), !1834)
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %x, i32 3, !dbg !1846
  %3 = load i8, ptr %arrayidx7, align 1, !dbg !1846
  %conv8 = zext i8 %3 to i32, !dbg !1847
  %shl9 = shl nuw i32 %conv8, 24, !dbg !1848
  %or10 = or disjoint i32 %or6, %shl9, !dbg !1849
    #dbg_value(i32 %or10, !1837, !DIExpression(), !1834)
  ret i32 %or10, !dbg !1850
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_cbd_eta2(ptr noundef %r, ptr noundef %buf) local_unnamed_addr #0 !dbg !1851 {
entry:
    #dbg_value(ptr %r, !1852, !DIExpression(), !1853)
    #dbg_value(ptr %buf, !1854, !DIExpression(), !1853)
  call fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) #3, !dbg !1855
  ret void, !dbg !1856
}

; Function Attrs: nounwind
define dso_local signext i16 @pqcrystals_kyber1024_ref_montgomery_reduce(i32 noundef %a) local_unnamed_addr #0 !dbg !1857 {
entry:
    #dbg_value(i32 %a, !1860, !DIExpression(), !1861)
    #dbg_value(i32 %a, !1862, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !1861)
  %sext = mul i32 %a, -218038272, !dbg !1863
  %conv3 = ashr exact i32 %sext, 16, !dbg !1863
  %mul4.neg = mul nsw i32 %conv3, -3329, !dbg !1864
  %sub = add i32 %mul4.neg, %a, !dbg !1865
  %shr = lshr i32 %sub, 16, !dbg !1866
  %conv5 = trunc nuw i32 %shr to i16, !dbg !1867
    #dbg_value(i16 %conv5, !1862, !DIExpression(), !1861)
  ret i16 %conv5, !dbg !1868
}

; Function Attrs: nounwind
define dso_local signext i16 @pqcrystals_kyber1024_ref_barrett_reduce(i16 noundef signext %a) local_unnamed_addr #0 !dbg !1869 {
entry:
    #dbg_value(i16 %a, !1872, !DIExpression(), !1873)
    #dbg_value(i16 20159, !1874, !DIExpression(), !1873)
  %conv = sext i16 %a to i32, !dbg !1875
  %mul = mul nsw i32 %conv, 20159, !dbg !1876
  %add = add nsw i32 %mul, 33554432, !dbg !1877
  %shr = ashr i32 %add, 26, !dbg !1878
    #dbg_value(i32 %shr, !1879, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1873)
    #dbg_value(i32 %shr, !1879, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1873)
  %0 = trunc nsw i32 %shr to i16, !dbg !1880
  %1 = mul i16 %0, -3329, !dbg !1880
  %conv7 = add i16 %1, %a, !dbg !1880
  ret i16 %conv7, !dbg !1881
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqcrystals_kyber1024_ref_verify(ptr noundef %a, ptr noundef %b, i32 noundef %len) local_unnamed_addr #0 !dbg !1882 {
entry:
    #dbg_value(ptr %a, !1886, !DIExpression(), !1887)
    #dbg_value(ptr %b, !1888, !DIExpression(), !1887)
    #dbg_value(i32 %len, !1889, !DIExpression(), !1887)
    #dbg_value(i8 0, !1890, !DIExpression(), !1887)
    #dbg_value(i32 0, !1891, !DIExpression(), !1887)
  br label %for.cond, !dbg !1892

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1894
  %r.0 = phi i8 [ 0, %entry ], [ %or2, %for.inc ], !dbg !1887
    #dbg_value(i8 %r.0, !1890, !DIExpression(), !1887)
    #dbg_value(i32 %i.0, !1891, !DIExpression(), !1887)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !1895
  br i1 %exitcond, label %for.inc, label %for.end, !dbg !1897

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i8 poison, i8 poison, i8 poison), !1890, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1887)
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %i.0, !dbg !1898
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1898
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 %i.0, !dbg !1899
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !1899
    #dbg_value(!DIArgList(i8 %r.0, i8 %0, i8 %1), !1890, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1887)
  %xor1 = xor i8 %0, %1, !dbg !1900
    #dbg_value(!DIArgList(i8 %r.0, i8 %xor1), !1890, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1887)
  %or2 = or i8 %r.0, %xor1, !dbg !1901
    #dbg_value(i8 %or2, !1890, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1887)
    #dbg_value(i8 %or2, !1890, !DIExpression(), !1887)
  %inc = add i32 %i.0, 1, !dbg !1902
    #dbg_value(i32 %inc, !1891, !DIExpression(), !1887)
  br label %for.cond, !dbg !1903, !llvm.loop !1904

for.end:                                          ; preds = %for.cond
  %r.0.lcssa = phi i8 [ %r.0, %for.cond ], !dbg !1887
  %2 = icmp ne i8 %r.0.lcssa, 0, !dbg !1906
  %conv6 = zext i1 %2 to i32, !dbg !1907
  ret i32 %conv6, !dbg !1908
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_cmov(ptr noundef %r, ptr noundef %x, i32 noundef %len, i8 noundef zeroext %b) local_unnamed_addr #0 !dbg !1909 {
entry:
    #dbg_value(ptr %r, !1912, !DIExpression(), !1913)
    #dbg_value(ptr %x, !1914, !DIExpression(), !1913)
    #dbg_value(i32 %len, !1915, !DIExpression(), !1913)
    #dbg_value(i8 %b, !1916, !DIExpression(), !1913)
  %0 = call i8 asm "", "=r,0"(i8 %b) #5, !dbg !1917, !srcloc !1918
    #dbg_value(i8 %0, !1916, !DIExpression(), !1913)
  %sub = sub i8 0, %0, !dbg !1919
    #dbg_value(i8 %sub, !1916, !DIExpression(), !1913)
    #dbg_value(i32 0, !1920, !DIExpression(), !1913)
  br label %for.cond, !dbg !1921

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1923
    #dbg_value(i32 %i.0, !1920, !DIExpression(), !1913)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !1924
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1926

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !1927
  %1 = load i8, ptr %arrayidx, align 1, !dbg !1927
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !1928
  %2 = load i8, ptr %arrayidx5, align 1, !dbg !1928
  %xor1 = xor i8 %1, %2, !dbg !1929
  %and2 = and i8 %xor1, %sub, !dbg !1930
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !1931
  %xor93 = xor i8 %1, %and2, !dbg !1932
  store i8 %xor93, ptr %arrayidx7, align 1, !dbg !1932
  %inc = add i32 %i.0, 1, !dbg !1933
    #dbg_value(i32 %inc, !1920, !DIExpression(), !1913)
  br label %for.cond, !dbg !1934, !llvm.loop !1935

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1937
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_cmov_int16(ptr noundef %r, i16 noundef signext %v, i16 noundef zeroext %b) local_unnamed_addr #0 !dbg !1938 {
entry:
    #dbg_value(ptr %r, !1941, !DIExpression(), !1942)
    #dbg_value(i16 %v, !1943, !DIExpression(), !1942)
    #dbg_value(i16 %b, !1944, !DIExpression(), !1942)
  %sub = sub i16 0, %b, !dbg !1945
    #dbg_value(i16 %sub, !1944, !DIExpression(), !1942)
  %0 = load i16, ptr %r, align 2, !dbg !1946
  %xor1 = xor i16 %0, %v, !dbg !1947
  %and = and i16 %xor1, %sub, !dbg !1948
  %xor6 = xor i16 %and, %0, !dbg !1949
  store i16 %xor6, ptr %r, align 2, !dbg !1949
  ret void, !dbg !1950
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_init(ptr noundef %state) local_unnamed_addr #0 !dbg !1951 {
entry:
    #dbg_value(ptr %state, !1955, !DIExpression(), !1956)
  call fastcc void @keccak_init(ptr noundef %state) #3, !dbg !1957
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1958
  store i64 0, ptr %arrayidx, align 8, !dbg !1959
  ret void, !dbg !1960
}

; Function Attrs: nounwind
define internal fastcc void @keccak_init(ptr noundef %s) unnamed_addr #0 !dbg !1961 {
entry:
    #dbg_value(ptr %s, !1965, !DIExpression(), !1966)
    #dbg_value(i32 0, !1967, !DIExpression(), !1966)
  br label %for.cond, !dbg !1968

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1970
    #dbg_value(i32 %i.0, !1967, !DIExpression(), !1966)
  %exitcond = icmp ne i32 %i.0, 25, !dbg !1971
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1973

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !1974
  store i64 0, ptr %arrayidx, align 8, !dbg !1975
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1976
    #dbg_value(i32 %inc, !1967, !DIExpression(), !1966)
  br label %for.cond, !dbg !1977, !llvm.loop !1978

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1980
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !1981 {
entry:
    #dbg_value(ptr %state, !1984, !DIExpression(), !1985)
    #dbg_value(ptr %in, !1986, !DIExpression(), !1985)
    #dbg_value(i32 %inlen, !1987, !DIExpression(), !1985)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1988
  %0 = load i64, ptr %arrayidx, align 8, !dbg !1988
  %conv = trunc i64 %0 to i32, !dbg !1988
  %call = call fastcc i32 @keccak_absorb(ptr noundef %state, i32 noundef %conv, i32 noundef 168, ptr noundef %in, i32 noundef %inlen) #3, !dbg !1989
  %conv1 = zext i32 %call to i64, !dbg !1989
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1990
  store i64 %conv1, ptr %arrayidx2, align 8, !dbg !1991
  ret void, !dbg !1992
}

; Function Attrs: nounwind
define internal fastcc i32 @keccak_absorb(ptr noundef %s, i32 noundef %pos, i32 noundef range(i32 136, 169) %r, ptr noundef %in, i32 noundef %inlen) unnamed_addr #0 !dbg !1993 {
entry:
    #dbg_value(ptr %s, !1996, !DIExpression(), !1997)
    #dbg_value(i32 %pos, !1998, !DIExpression(), !1997)
    #dbg_value(i32 %r, !1999, !DIExpression(), !1997)
    #dbg_value(ptr %in, !2000, !DIExpression(), !1997)
    #dbg_value(i32 %inlen, !2001, !DIExpression(), !1997)
  br label %while.cond, !dbg !2002

while.cond:                                       ; preds = %for.end, %entry
  %in.addr.0 = phi ptr [ %in, %entry ], [ %in.addr.1.lcssa, %for.end ]
  %inlen.addr.0 = phi i32 [ %inlen, %entry ], [ %sub2, %for.end ]
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ 0, %for.end ]
    #dbg_value(i32 %pos.addr.0, !1998, !DIExpression(), !1997)
    #dbg_value(i32 %inlen.addr.0, !2001, !DIExpression(), !1997)
    #dbg_value(ptr %in.addr.0, !2000, !DIExpression(), !1997)
  %add = add i32 %pos.addr.0, %inlen.addr.0, !dbg !2003
  %cmp.not = icmp ult i32 %add, %r, !dbg !2004
  br i1 %cmp.not, label %for.cond3.preheader, label %for.cond.preheader, !dbg !2002

for.cond.preheader:                               ; preds = %while.cond
  %umax = call i32 @llvm.umax.i32(i32 %pos.addr.0, i32 %r), !dbg !2005
  br label %for.cond, !dbg !2005

for.cond3.preheader:                              ; preds = %while.cond
  %in.addr.0.lcssa = phi ptr [ %in.addr.0, %while.cond ]
  %inlen.addr.0.lcssa = phi i32 [ %inlen.addr.0, %while.cond ]
  %pos.addr.0.lcssa = phi i32 [ %pos.addr.0, %while.cond ]
  br label %for.cond3, !dbg !2008

for.cond:                                         ; preds = %for.cond.preheader, %for.body
  %in.addr.1 = phi ptr [ %incdec.ptr, %for.body ], [ %in.addr.0, %for.cond.preheader ]
  %i.0 = phi i32 [ %inc, %for.body ], [ %pos.addr.0, %for.cond.preheader ], !dbg !2010
    #dbg_value(i32 %i.0, !2011, !DIExpression(), !1997)
    #dbg_value(ptr %in.addr.1, !2000, !DIExpression(), !1997)
  %exitcond = icmp ne i32 %i.0, %umax, !dbg !2012
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2005

for.body:                                         ; preds = %for.cond
    #dbg_value(ptr %in.addr.1, !2000, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1997)
  %0 = load i8, ptr %in.addr.1, align 1, !dbg !2014
  %conv = zext i8 %0 to i64, !dbg !2015
  %rem = shl nuw nsw i32 %i.0, 3, !dbg !2016
  %mul = and i32 %rem, 56, !dbg !2016
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2017
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !2017
  %div2 = lshr i32 %i.0, 3, !dbg !2018
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div2, !dbg !2019
  %1 = load i64, ptr %arrayidx, align 8, !dbg !2020
  %xor = xor i64 %1, %shl, !dbg !2020
  store i64 %xor, ptr %arrayidx, align 8, !dbg !2020
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %in.addr.1, i32 1, !dbg !2021
    #dbg_value(ptr %incdec.ptr, !2000, !DIExpression(), !1997)
  %inc = add i32 %i.0, 1, !dbg !2022
    #dbg_value(i32 %inc, !2011, !DIExpression(), !1997)
  br label %for.cond, !dbg !2023, !llvm.loop !2024

for.end:                                          ; preds = %for.cond
  %in.addr.1.lcssa = phi ptr [ %in.addr.1, %for.cond ]
  %sub.neg = sub i32 %pos.addr.0, %r, !dbg !2026
  %sub2 = add i32 %sub.neg, %inlen.addr.0, !dbg !2027
    #dbg_value(i32 %sub2, !2001, !DIExpression(), !1997)
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2028
    #dbg_value(i32 0, !1998, !DIExpression(), !1997)
  br label %while.cond, !dbg !2002, !llvm.loop !2029

for.cond3:                                        ; preds = %for.cond3.preheader, %for.body7
  %in.addr.2 = phi ptr [ %incdec.ptr8, %for.body7 ], [ %in.addr.0.lcssa, %for.cond3.preheader ]
  %i.1 = phi i32 [ %inc18, %for.body7 ], [ %pos.addr.0.lcssa, %for.cond3.preheader ], !dbg !2031
    #dbg_value(i32 %i.1, !2011, !DIExpression(), !1997)
    #dbg_value(ptr %in.addr.2, !2000, !DIExpression(), !1997)
  %add4 = add i32 %pos.addr.0.lcssa, %inlen.addr.0.lcssa, !dbg !2032
  %cmp5 = icmp ult i32 %i.1, %add4, !dbg !2034
  br i1 %cmp5, label %for.body7, label %for.end19, !dbg !2008

for.body7:                                        ; preds = %for.cond3
    #dbg_value(ptr %in.addr.2, !2000, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1997)
  %2 = load i8, ptr %in.addr.2, align 1, !dbg !2035
  %conv9 = zext i8 %2 to i64, !dbg !2036
  %rem10 = shl i32 %i.1, 3, !dbg !2037
  %mul11 = and i32 %rem10, 56, !dbg !2037
  %sh_prom12 = zext nneg i32 %mul11 to i64, !dbg !2038
  %shl13 = shl nuw i64 %conv9, %sh_prom12, !dbg !2038
  %div141 = lshr i32 %i.1, 3, !dbg !2039
  %arrayidx15 = getelementptr inbounds nuw i64, ptr %s, i32 %div141, !dbg !2040
  %3 = load i64, ptr %arrayidx15, align 8, !dbg !2041
  %xor16 = xor i64 %3, %shl13, !dbg !2041
  store i64 %xor16, ptr %arrayidx15, align 8, !dbg !2041
  %incdec.ptr8 = getelementptr inbounds nuw i8, ptr %in.addr.2, i32 1, !dbg !2042
    #dbg_value(ptr %incdec.ptr8, !2000, !DIExpression(), !1997)
  %inc18 = add nuw i32 %i.1, 1, !dbg !2043
    #dbg_value(i32 %inc18, !2011, !DIExpression(), !1997)
  br label %for.cond3, !dbg !2044, !llvm.loop !2045

for.end19:                                        ; preds = %for.cond3
  %i.1.lcssa = phi i32 [ %i.1, %for.cond3 ], !dbg !2031
  ret i32 %i.1.lcssa, !dbg !2047
}

; Function Attrs: nounwind
define internal fastcc void @KeccakF1600_StatePermute(ptr noundef %state) unnamed_addr #0 !dbg !2048 {
entry:
    #dbg_value(ptr %state, !2049, !DIExpression(), !2050)
  %0 = load i64, ptr %state, align 8, !dbg !2051
    #dbg_value(i64 %0, !2052, !DIExpression(), !2050)
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !2053
  %1 = load i64, ptr %arrayidx1, align 8, !dbg !2053
    #dbg_value(i64 %1, !2054, !DIExpression(), !2050)
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !2055
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !2055
    #dbg_value(i64 %2, !2056, !DIExpression(), !2050)
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !2057
  %3 = load i64, ptr %arrayidx3, align 8, !dbg !2057
    #dbg_value(i64 %3, !2058, !DIExpression(), !2050)
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !2059
  %4 = load i64, ptr %arrayidx4, align 8, !dbg !2059
    #dbg_value(i64 %4, !2060, !DIExpression(), !2050)
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !2061
  %5 = load i64, ptr %arrayidx5, align 8, !dbg !2061
    #dbg_value(i64 %5, !2062, !DIExpression(), !2050)
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !2063
  %6 = load i64, ptr %arrayidx6, align 8, !dbg !2063
    #dbg_value(i64 %6, !2064, !DIExpression(), !2050)
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !2065
  %7 = load i64, ptr %arrayidx7, align 8, !dbg !2065
    #dbg_value(i64 %7, !2066, !DIExpression(), !2050)
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !2067
  %8 = load i64, ptr %arrayidx8, align 8, !dbg !2067
    #dbg_value(i64 %8, !2068, !DIExpression(), !2050)
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !2069
  %9 = load i64, ptr %arrayidx9, align 8, !dbg !2069
    #dbg_value(i64 %9, !2070, !DIExpression(), !2050)
  %arrayidx10 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !2071
  %10 = load i64, ptr %arrayidx10, align 8, !dbg !2071
    #dbg_value(i64 %10, !2072, !DIExpression(), !2050)
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !2073
  %11 = load i64, ptr %arrayidx11, align 8, !dbg !2073
    #dbg_value(i64 %11, !2074, !DIExpression(), !2050)
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !2075
  %12 = load i64, ptr %arrayidx12, align 8, !dbg !2075
    #dbg_value(i64 %12, !2076, !DIExpression(), !2050)
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !2077
  %13 = load i64, ptr %arrayidx13, align 8, !dbg !2077
    #dbg_value(i64 %13, !2078, !DIExpression(), !2050)
  %arrayidx14 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !2079
  %14 = load i64, ptr %arrayidx14, align 8, !dbg !2079
    #dbg_value(i64 %14, !2080, !DIExpression(), !2050)
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !2081
  %15 = load i64, ptr %arrayidx15, align 8, !dbg !2081
    #dbg_value(i64 %15, !2082, !DIExpression(), !2050)
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !2083
  %16 = load i64, ptr %arrayidx16, align 8, !dbg !2083
    #dbg_value(i64 %16, !2084, !DIExpression(), !2050)
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !2085
  %17 = load i64, ptr %arrayidx17, align 8, !dbg !2085
    #dbg_value(i64 %17, !2086, !DIExpression(), !2050)
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !2087
  %18 = load i64, ptr %arrayidx18, align 8, !dbg !2087
    #dbg_value(i64 %18, !2088, !DIExpression(), !2050)
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !2089
  %19 = load i64, ptr %arrayidx19, align 8, !dbg !2089
    #dbg_value(i64 %19, !2090, !DIExpression(), !2050)
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !2091
  %20 = load i64, ptr %arrayidx20, align 8, !dbg !2091
    #dbg_value(i64 %20, !2092, !DIExpression(), !2050)
  %arrayidx21 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !2093
  %21 = load i64, ptr %arrayidx21, align 8, !dbg !2093
    #dbg_value(i64 %21, !2094, !DIExpression(), !2050)
  %arrayidx22 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !2095
  %22 = load i64, ptr %arrayidx22, align 8, !dbg !2095
    #dbg_value(i64 %22, !2096, !DIExpression(), !2050)
  %arrayidx23 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !2097
  %23 = load i64, ptr %arrayidx23, align 8, !dbg !2097
    #dbg_value(i64 %23, !2098, !DIExpression(), !2050)
  %arrayidx24 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !2099
  %24 = load i64, ptr %arrayidx24, align 8, !dbg !2099
    #dbg_value(i64 %24, !2100, !DIExpression(), !2050)
    #dbg_value(i32 0, !2101, !DIExpression(), !2050)
  br label %for.cond, !dbg !2102

for.cond:                                         ; preds = %for.inc, %entry
  %Aso.0 = phi i64 [ %23, %entry ], [ %xor444, %for.inc ], !dbg !2050
  %Asi.0 = phi i64 [ %22, %entry ], [ %xor441, %for.inc ], !dbg !2050
  %Ase.0 = phi i64 [ %21, %entry ], [ %xor438, %for.inc ], !dbg !2050
  %Asa.0 = phi i64 [ %20, %entry ], [ %xor435, %for.inc ], !dbg !2050
  %Amu.0 = phi i64 [ %19, %entry ], [ %xor412, %for.inc ], !dbg !2050
  %Amo.0 = phi i64 [ %18, %entry ], [ %xor409, %for.inc ], !dbg !2050
  %Ami.0 = phi i64 [ %17, %entry ], [ %xor406, %for.inc ], !dbg !2050
  %Ame.0 = phi i64 [ %16, %entry ], [ %xor403, %for.inc ], !dbg !2050
  %Ama.0 = phi i64 [ %15, %entry ], [ %xor400, %for.inc ], !dbg !2050
  %Aku.0 = phi i64 [ %14, %entry ], [ %xor377, %for.inc ], !dbg !2050
  %Ako.0 = phi i64 [ %13, %entry ], [ %xor374, %for.inc ], !dbg !2050
  %Aki.0 = phi i64 [ %12, %entry ], [ %xor371, %for.inc ], !dbg !2050
  %Ake.0 = phi i64 [ %11, %entry ], [ %xor368, %for.inc ], !dbg !2050
  %Aka.0 = phi i64 [ %10, %entry ], [ %xor365, %for.inc ], !dbg !2050
  %Agu.0 = phi i64 [ %9, %entry ], [ %xor342, %for.inc ], !dbg !2050
  %Ago.0 = phi i64 [ %8, %entry ], [ %xor339, %for.inc ], !dbg !2050
  %Agi.0 = phi i64 [ %7, %entry ], [ %xor336, %for.inc ], !dbg !2050
  %Age.0 = phi i64 [ %6, %entry ], [ %xor333, %for.inc ], !dbg !2050
  %Aga.0 = phi i64 [ %5, %entry ], [ %xor330, %for.inc ], !dbg !2050
  %Abu.0 = phi i64 [ %4, %entry ], [ %xor307, %for.inc ], !dbg !2050
  %Abo.0 = phi i64 [ %3, %entry ], [ %xor304, %for.inc ], !dbg !2050
  %Abi.0 = phi i64 [ %2, %entry ], [ %xor301, %for.inc ], !dbg !2050
  %Abe.0 = phi i64 [ %1, %entry ], [ %xor298, %for.inc ], !dbg !2050
  %Aba.0 = phi i64 [ %0, %entry ], [ %xor295, %for.inc ], !dbg !2050
  %round.0 = phi i32 [ 0, %entry ], [ %add448, %for.inc ], !dbg !2104
  %Asu.0 = phi i64 [ %24, %entry ], [ %xor447, %for.inc ], !dbg !2050
    #dbg_value(i64 %Asu.0, !2100, !DIExpression(), !2050)
    #dbg_value(i32 %round.0, !2101, !DIExpression(), !2050)
    #dbg_value(i64 %Aba.0, !2052, !DIExpression(), !2050)
    #dbg_value(i64 %Abe.0, !2054, !DIExpression(), !2050)
    #dbg_value(i64 %Abi.0, !2056, !DIExpression(), !2050)
    #dbg_value(i64 %Abo.0, !2058, !DIExpression(), !2050)
    #dbg_value(i64 %Abu.0, !2060, !DIExpression(), !2050)
    #dbg_value(i64 %Aga.0, !2062, !DIExpression(), !2050)
    #dbg_value(i64 %Age.0, !2064, !DIExpression(), !2050)
    #dbg_value(i64 %Agi.0, !2066, !DIExpression(), !2050)
    #dbg_value(i64 %Ago.0, !2068, !DIExpression(), !2050)
    #dbg_value(i64 %Agu.0, !2070, !DIExpression(), !2050)
    #dbg_value(i64 %Aka.0, !2072, !DIExpression(), !2050)
    #dbg_value(i64 %Ake.0, !2074, !DIExpression(), !2050)
    #dbg_value(i64 %Aki.0, !2076, !DIExpression(), !2050)
    #dbg_value(i64 %Ako.0, !2078, !DIExpression(), !2050)
    #dbg_value(i64 %Aku.0, !2080, !DIExpression(), !2050)
    #dbg_value(i64 %Ama.0, !2082, !DIExpression(), !2050)
    #dbg_value(i64 %Ame.0, !2084, !DIExpression(), !2050)
    #dbg_value(i64 %Ami.0, !2086, !DIExpression(), !2050)
    #dbg_value(i64 %Amo.0, !2088, !DIExpression(), !2050)
    #dbg_value(i64 %Amu.0, !2090, !DIExpression(), !2050)
    #dbg_value(i64 %Asa.0, !2092, !DIExpression(), !2050)
    #dbg_value(i64 %Ase.0, !2094, !DIExpression(), !2050)
    #dbg_value(i64 %Asi.0, !2096, !DIExpression(), !2050)
    #dbg_value(i64 %Aso.0, !2098, !DIExpression(), !2050)
  %cmp = icmp samesign ult i32 %round.0, 24, !dbg !2105
  br i1 %cmp, label %for.inc, label %for.end, !dbg !2107

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %Asa.0, i64 %Ama.0, i64 %Aka.0, i64 %Aga.0), !2108, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %Ase.0, i64 %Ame.0, i64 %Ake.0, i64 %Age.0), !2109, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %Asi.0, i64 %Ami.0, i64 %Aki.0, i64 %Agi.0), !2110, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %Aso.0, i64 %Amo.0, i64 %Ako.0, i64 %Ago.0), !2111, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %Asu.0, i64 %Amu.0, i64 %Aku.0, i64 %Agu.0), !2112, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2113, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2114, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2115, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2116, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2117, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2052, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2108, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2064, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2109, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2110, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2088, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2111, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2100, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2112, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2118, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2118, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2119, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2120, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2121, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2122, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2058, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2108, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2070, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2109, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2072, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2110, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2084, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2111, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2096, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2112, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2123, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2124, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2125, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2126, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2127, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2054, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2108, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2066, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2109, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2078, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2110, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2090, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2111, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2092, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2112, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2128, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2129, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2130, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2131, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2132, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2060, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2108, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2109, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2110, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2086, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2111, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2098, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2112, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2133, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2134, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2135, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2136, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2137, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2056, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2108, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2068, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2109, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2080, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2110, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2082, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2111, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2094, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2112, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2138, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2139, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2140, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2141, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2142, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2108, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2109, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2110, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2111, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2112, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2113, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2114, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2115, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2116, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2117, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2118, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2108, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2124, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2109, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2130, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2110, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2136, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2111, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2142, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2112, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2052, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2052, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2054, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2056, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2058, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2060, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2121, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2108, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2127, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2109, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2128, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2110, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2134, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2111, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2140, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2112, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2064, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2066, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2068, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2070, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2119, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2108, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2125, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2109, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2131, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2110, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2137, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2111, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2138, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2112, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2072, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2078, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2080, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2122, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2108, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2123, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2109, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2129, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2110, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2135, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2111, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2141, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2112, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2082, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2084, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2086, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2088, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2090, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2120, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2108, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2126, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2109, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2132, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2110, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2133, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2111, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2139, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 poison, !2112, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2092, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2094, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2096, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2098, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2100, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor32 = xor i64 %Abi.0, %Agi.0, !dbg !2143
    #dbg_value(!DIArgList(i64 %xor32, i64 %Asi.0, i64 %Ami.0, i64 %Aki.0), !2110, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor33 = xor i64 %xor32, %Aki.0, !dbg !2145
    #dbg_value(!DIArgList(i64 %xor33, i64 %Asi.0, i64 %Ami.0), !2110, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor34 = xor i64 %xor33, %Ami.0, !dbg !2146
    #dbg_value(!DIArgList(i64 %xor34, i64 %Asi.0), !2110, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor35 = xor i64 %xor34, %Asi.0, !dbg !2147
    #dbg_value(i64 %xor35, !2110, !DIExpression(), !2050)
  %xor40 = xor i64 %Abu.0, %Agu.0, !dbg !2148
    #dbg_value(!DIArgList(i64 %xor40, i64 %Asu.0, i64 %Amu.0, i64 %Aku.0), !2112, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor41 = xor i64 %xor40, %Aku.0, !dbg !2149
    #dbg_value(!DIArgList(i64 %xor41, i64 %Asu.0, i64 %Amu.0), !2112, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor42 = xor i64 %xor41, %Amu.0, !dbg !2150
    #dbg_value(!DIArgList(i64 %xor42, i64 %Asu.0), !2112, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor43 = xor i64 %xor42, %Asu.0, !dbg !2151
    #dbg_value(i64 %xor43, !2112, !DIExpression(), !2050)
  %xor56 = call i64 @llvm.fshl.i64(i64 %xor43, i64 %xor43, i64 1), !dbg !2152
    #dbg_value(!DIArgList(i64 %Ago.0, i64 %xor35, i64 %xor56), !2068, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %xor35, i64 %xor56), !2058, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Ako.0, i64 %xor35, i64 %xor56), !2078, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Amo.0, i64 %xor35, i64 %xor56), !2088, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Aso.0, i64 %xor35, i64 %xor56), !2098, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor35, i64 %xor56), !2116, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor57 = xor i64 %xor35, %xor56, !dbg !2153
    #dbg_value(!DIArgList(i64 %Ago.0, i64 %xor57), !2068, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %xor57), !2058, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Ako.0, i64 %xor57), !2078, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Amo.0, i64 %xor57), !2088, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Aso.0, i64 %xor57), !2098, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 %xor57, !2116, !DIExpression(), !2050)
  %xor203 = xor i64 %Ago.0, %xor57, !dbg !2154
    #dbg_value(i64 %xor203, !2068, !DIExpression(), !2050)
  %xor206 = call i64 @llvm.fshl.i64(i64 %xor203, i64 %xor203, i64 55), !dbg !2155
    #dbg_value(i64 %xor206, !2109, !DIExpression(), !2050)
  %xor28 = xor i64 %Abe.0, %Age.0, !dbg !2156
    #dbg_value(!DIArgList(i64 %xor28, i64 %Ase.0, i64 %Ame.0, i64 %Ake.0), !2109, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor29 = xor i64 %xor28, %Ake.0, !dbg !2157
    #dbg_value(!DIArgList(i64 %xor29, i64 %Ase.0, i64 %Ame.0), !2109, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor30 = xor i64 %xor29, %Ame.0, !dbg !2158
    #dbg_value(!DIArgList(i64 %xor30, i64 %Ase.0), !2109, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor31 = xor i64 %xor30, %Ase.0, !dbg !2159
    #dbg_value(i64 %xor31, !2109, !DIExpression(), !2050)
  %xor44 = call i64 @llvm.fshl.i64(i64 %xor31, i64 %xor31, i64 1), !dbg !2160
    #dbg_value(!DIArgList(i64 %xor43, i64 %xor44), !2113, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor43, i64 %xor44), !2052, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor43, i64 %xor44), !2108, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Aka.0, i64 %xor43, i64 %xor44), !2072, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Aga.0, i64 %xor43, i64 %xor44), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Asa.0, i64 %xor43, i64 %xor44), !2092, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Ama.0, i64 %xor43, i64 %xor44), !2082, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor45 = xor i64 %xor43, %xor44, !dbg !2161
    #dbg_value(i64 %xor45, !2113, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor45), !2108, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor45), !2052, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Aka.0, i64 %xor45), !2072, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Aga.0, i64 %xor45), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Asa.0, i64 %xor45), !2092, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Ama.0, i64 %xor45), !2082, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor211 = xor i64 %Ama.0, %xor45, !dbg !2162
    #dbg_value(i64 %xor211, !2082, !DIExpression(), !2050)
  %xor214 = call i64 @llvm.fshl.i64(i64 %xor211, i64 %xor211, i64 41), !dbg !2163
    #dbg_value(i64 %xor214, !2111, !DIExpression(), !2050)
  %xor36 = xor i64 %Abo.0, %Ago.0, !dbg !2164
    #dbg_value(!DIArgList(i64 %xor36, i64 %Aso.0, i64 %Amo.0, i64 %Ako.0), !2111, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor37 = xor i64 %xor36, %Ako.0, !dbg !2165
    #dbg_value(!DIArgList(i64 %xor37, i64 %Aso.0, i64 %Amo.0), !2111, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor38 = xor i64 %xor37, %Amo.0, !dbg !2166
    #dbg_value(!DIArgList(i64 %xor38, i64 %Aso.0), !2111, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor39 = xor i64 %xor38, %Aso.0, !dbg !2167
    #dbg_value(i64 %xor39, !2111, !DIExpression(), !2050)
  %xor = xor i64 %Aba.0, %Aga.0, !dbg !2168
    #dbg_value(!DIArgList(i64 %xor, i64 %Asa.0, i64 %Ama.0, i64 %Aka.0), !2108, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor25 = xor i64 %xor, %Aka.0, !dbg !2169
    #dbg_value(!DIArgList(i64 %xor25, i64 %Asa.0, i64 %Ama.0), !2108, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor26 = xor i64 %xor25, %Ama.0, !dbg !2170
    #dbg_value(!DIArgList(i64 %xor26, i64 %Asa.0), !2108, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor27 = xor i64 %xor26, %Asa.0, !dbg !2171
    #dbg_value(i64 %xor27, !2108, !DIExpression(), !2050)
  %xor60 = call i64 @llvm.fshl.i64(i64 %xor27, i64 %xor27, i64 1), !dbg !2172
    #dbg_value(!DIArgList(i64 %Agu.0, i64 %xor39, i64 %xor60), !2070, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %xor39, i64 %xor60), !2060, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Asu.0, i64 %xor39, i64 %xor60), !2100, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Amu.0, i64 %xor39, i64 %xor60), !2090, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor39, i64 %xor60), !2117, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Aku.0, i64 %xor39, i64 %xor60), !2080, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor61 = xor i64 %xor39, %xor60, !dbg !2173
    #dbg_value(!DIArgList(i64 %Agu.0, i64 %xor61), !2070, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %xor61), !2060, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Asu.0, i64 %xor61), !2100, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Amu.0, i64 %xor61), !2090, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 %xor61, !2117, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 %Aku.0, i64 %xor61), !2080, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor207 = xor i64 %Aku.0, %xor61, !dbg !2174
    #dbg_value(i64 %xor207, !2080, !DIExpression(), !2050)
  %xor210 = call i64 @llvm.fshl.i64(i64 %xor207, i64 %xor207, i64 39), !dbg !2175
    #dbg_value(i64 %xor210, !2110, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 %xor206, i64 %xor214, i64 %xor210), !2139, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %not222 = xor i64 %xor210, -1, !dbg !2176
    #dbg_value(!DIArgList(i64 %xor206, i64 %xor214, i64 %not222), !2139, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %and223 = and i64 %xor214, %not222, !dbg !2177
    #dbg_value(!DIArgList(i64 %xor206, i64 %and223), !2139, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor224 = xor i64 %xor206, %and223, !dbg !2178
    #dbg_value(i64 %xor224, !2139, !DIExpression(), !2050)
  %xor52 = call i64 @llvm.fshl.i64(i64 %xor39, i64 %xor39, i64 1), !dbg !2179
    #dbg_value(!DIArgList(i64 %xor31, i64 %xor52), !2115, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Aki.0, i64 %xor31, i64 %xor52), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Agi.0, i64 %xor31, i64 %xor52), !2066, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %xor31, i64 %xor52), !2056, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Asi.0, i64 %xor31, i64 %xor52), !2096, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Ami.0, i64 %xor31, i64 %xor52), !2086, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor53 = xor i64 %xor31, %xor52, !dbg !2180
    #dbg_value(i64 %xor53, !2115, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 %Aki.0, i64 %xor53), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Agi.0, i64 %xor53), !2066, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %xor53), !2056, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Asi.0, i64 %xor53), !2096, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Ami.0, i64 %xor53), !2086, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor67 = xor i64 %Aki.0, %xor53, !dbg !2181
    #dbg_value(i64 %xor67, !2076, !DIExpression(), !2050)
  %xor70 = call i64 @llvm.fshl.i64(i64 %xor67, i64 %xor67, i64 43), !dbg !2182
    #dbg_value(i64 %xor70, !2110, !DIExpression(), !2050)
  %xor48 = call i64 @llvm.fshl.i64(i64 %xor35, i64 %xor35, i64 1), !dbg !2183
    #dbg_value(!DIArgList(i64 %xor27, i64 %xor48), !2114, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Age.0, i64 %xor27, i64 %xor48), !2064, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %xor27, i64 %xor48), !2054, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Ake.0, i64 %xor27, i64 %xor48), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Ame.0, i64 %xor27, i64 %xor48), !2084, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Ase.0, i64 %xor27, i64 %xor48), !2094, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor49 = xor i64 %xor27, %xor48, !dbg !2184
    #dbg_value(i64 %xor49, !2114, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 %Age.0, i64 %xor49), !2064, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %xor49), !2054, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Ake.0, i64 %xor49), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Ame.0, i64 %xor49), !2084, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %Ase.0, i64 %xor49), !2094, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor63 = xor i64 %Age.0, %xor49, !dbg !2185
    #dbg_value(i64 %xor63, !2064, !DIExpression(), !2050)
  %xor66 = call i64 @llvm.fshl.i64(i64 %xor63, i64 %xor63, i64 44), !dbg !2186
    #dbg_value(i64 %xor66, !2109, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor70, i64 %xor45, i64 %xor66), !2118, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %not = xor i64 %xor66, -1, !dbg !2187
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor70, i64 %xor45, i64 %not), !2118, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %and = and i64 %xor70, %not, !dbg !2188
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %and, i64 %xor45), !2118, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %arrayidx80 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %round.0, !dbg !2189
  %25 = load i64, ptr %arrayidx80, align 8, !dbg !2189
    #dbg_value(!DIArgList(i64 %and, i64 %Aba.0, i64 %xor45, i64 %25), !2118, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
  %26 = xor i64 %and, %25, !dbg !2190
    #dbg_value(!DIArgList(i64 %26, i64 %Aba.0, i64 %xor45), !2118, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor62 = xor i64 %Aba.0, %xor45, !dbg !2191
    #dbg_value(i64 %xor62, !2052, !DIExpression(), !2050)
    #dbg_value(i64 %xor62, !2108, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 %26, i64 %xor62), !2118, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor81 = xor i64 %26, %xor62, !dbg !2190
    #dbg_value(i64 %xor81, !2118, !DIExpression(), !2050)
  %xor94 = xor i64 %Abo.0, %xor57, !dbg !2192
    #dbg_value(i64 %xor94, !2058, !DIExpression(), !2050)
  %xor97 = call i64 @llvm.fshl.i64(i64 %xor94, i64 %xor94, i64 28), !dbg !2193
    #dbg_value(i64 %xor97, !2108, !DIExpression(), !2050)
  %xor102 = xor i64 %Aka.0, %xor45, !dbg !2194
    #dbg_value(i64 %xor102, !2072, !DIExpression(), !2050)
  %xor105 = call i64 @llvm.fshl.i64(i64 %xor102, i64 %xor102, i64 3), !dbg !2195
    #dbg_value(i64 %xor105, !2110, !DIExpression(), !2050)
  %xor98 = xor i64 %Agu.0, %xor61, !dbg !2196
    #dbg_value(i64 %xor98, !2070, !DIExpression(), !2050)
  %xor101 = call i64 @llvm.fshl.i64(i64 %xor98, i64 %xor98, i64 20), !dbg !2197
    #dbg_value(i64 %xor101, !2109, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 %xor97, i64 %xor105, i64 %xor101), !2123, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %not114 = xor i64 %xor101, -1, !dbg !2198
    #dbg_value(!DIArgList(i64 %xor97, i64 %xor105, i64 %not114), !2123, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %and115 = and i64 %xor105, %not114, !dbg !2199
    #dbg_value(!DIArgList(i64 %xor97, i64 %and115), !2123, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor116 = xor i64 %xor97, %and115, !dbg !2200
    #dbg_value(i64 %xor116, !2123, !DIExpression(), !2050)
  %xor234 = xor i64 %xor81, %xor116, !dbg !2201
  %xor129 = xor i64 %Abe.0, %xor49, !dbg !2202
    #dbg_value(i64 %xor129, !2054, !DIExpression(), !2050)
  %xor132 = call i64 @llvm.fshl.i64(i64 %xor129, i64 %xor129, i64 1), !dbg !2203
    #dbg_value(i64 %xor132, !2108, !DIExpression(), !2050)
  %xor137 = xor i64 %Ako.0, %xor57, !dbg !2204
    #dbg_value(i64 %xor137, !2078, !DIExpression(), !2050)
  %xor140 = call i64 @llvm.fshl.i64(i64 %xor137, i64 %xor137, i64 25), !dbg !2205
    #dbg_value(i64 %xor140, !2110, !DIExpression(), !2050)
  %xor133 = xor i64 %Agi.0, %xor53, !dbg !2206
    #dbg_value(i64 %xor133, !2066, !DIExpression(), !2050)
  %xor136 = call i64 @llvm.fshl.i64(i64 %xor133, i64 %xor133, i64 6), !dbg !2207
    #dbg_value(i64 %xor136, !2109, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 %xor132, i64 %xor140, i64 %xor136), !2128, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %not149 = xor i64 %xor136, -1, !dbg !2208
    #dbg_value(!DIArgList(i64 %xor132, i64 %xor140, i64 %not149), !2128, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %and150 = and i64 %xor140, %not149, !dbg !2209
    #dbg_value(!DIArgList(i64 %xor132, i64 %and150), !2128, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor151 = xor i64 %xor132, %and150, !dbg !2210
    #dbg_value(i64 %xor151, !2128, !DIExpression(), !2050)
  %xor235 = xor i64 %xor234, %xor151, !dbg !2211
  %xor164 = xor i64 %Abu.0, %xor61, !dbg !2212
    #dbg_value(i64 %xor164, !2060, !DIExpression(), !2050)
  %xor167 = call i64 @llvm.fshl.i64(i64 %xor164, i64 %xor164, i64 27), !dbg !2213
    #dbg_value(i64 %xor167, !2108, !DIExpression(), !2050)
  %xor172 = xor i64 %Ake.0, %xor49, !dbg !2214
    #dbg_value(i64 %xor172, !2074, !DIExpression(), !2050)
  %xor175 = call i64 @llvm.fshl.i64(i64 %xor172, i64 %xor172, i64 10), !dbg !2215
    #dbg_value(i64 %xor175, !2110, !DIExpression(), !2050)
  %xor168 = xor i64 %Aga.0, %xor45, !dbg !2216
    #dbg_value(i64 %xor168, !2062, !DIExpression(), !2050)
  %xor171 = call i64 @llvm.fshl.i64(i64 %xor168, i64 %xor168, i64 36), !dbg !2217
    #dbg_value(i64 %xor171, !2109, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 %xor167, i64 %xor175, i64 %xor171), !2133, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %not184 = xor i64 %xor171, -1, !dbg !2218
    #dbg_value(!DIArgList(i64 %xor167, i64 %xor175, i64 %not184), !2133, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %and185 = and i64 %xor175, %not184, !dbg !2219
    #dbg_value(!DIArgList(i64 %xor167, i64 %and185), !2133, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor186 = xor i64 %xor167, %and185, !dbg !2220
    #dbg_value(i64 %xor186, !2133, !DIExpression(), !2050)
  %xor236 = xor i64 %xor235, %xor186, !dbg !2221
  %xor199 = xor i64 %Abi.0, %xor53, !dbg !2222
    #dbg_value(i64 %xor199, !2056, !DIExpression(), !2050)
  %xor202 = call i64 @llvm.fshl.i64(i64 %xor199, i64 %xor199, i64 62), !dbg !2223
    #dbg_value(!DIArgList(i64 %xor202, i64 %xor210, i64 %xor206), !2138, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %xor210, i64 %xor206), !2108, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
  %not219 = xor i64 %xor206, -1, !dbg !2224
    #dbg_value(!DIArgList(i64 %xor202, i64 %xor210, i64 %not219), !2138, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %xor210, i64 %not219), !2108, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
  %and220 = and i64 %xor210, %not219, !dbg !2225
    #dbg_value(!DIArgList(i64 %xor202, i64 %and220), !2138, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %and220), !2108, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor221 = xor i64 %xor202, %and220, !dbg !2226
    #dbg_value(i64 %xor221, !2138, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor221), !2108, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor237 = xor i64 %xor236, %xor221, !dbg !2227
    #dbg_value(i64 %xor237, !2108, !DIExpression(), !2050)
  %xor75 = xor i64 %Asu.0, %xor61, !dbg !2228
    #dbg_value(i64 %xor75, !2100, !DIExpression(), !2050)
  %xor78 = call i64 @llvm.fshl.i64(i64 %xor75, i64 %xor75, i64 14), !dbg !2229
    #dbg_value(i64 %xor78, !2112, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor66, i64 %xor62), !2122, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor71 = xor i64 %Amo.0, %xor57, !dbg !2230
    #dbg_value(i64 %xor71, !2088, !DIExpression(), !2050)
  %xor74 = call i64 @llvm.fshl.i64(i64 %xor71, i64 %xor71, i64 21), !dbg !2231
    #dbg_value(i64 %xor74, !2111, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 %xor70, i64 %xor78, i64 %xor74), !2120, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor74, i64 %xor70), !2119, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor62, i64 %xor78), !2121, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %not85 = xor i64 %xor74, -1, !dbg !2232
    #dbg_value(!DIArgList(i64 %xor70, i64 %xor78, i64 %not85), !2120, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %and86 = and i64 %xor78, %not85, !dbg !2233
    #dbg_value(!DIArgList(i64 %xor70, i64 %and86), !2120, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor87 = xor i64 %xor70, %and86, !dbg !2234
    #dbg_value(i64 %xor87, !2120, !DIExpression(), !2050)
  %xor110 = xor i64 %Asi.0, %xor53, !dbg !2235
    #dbg_value(i64 %xor110, !2096, !DIExpression(), !2050)
  %xor113 = call i64 @llvm.fshl.i64(i64 %xor110, i64 %xor110, i64 61), !dbg !2236
    #dbg_value(i64 %xor113, !2112, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 %xor113, i64 %xor101, i64 %xor97), !2127, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor106 = xor i64 %Ame.0, %xor49, !dbg !2237
    #dbg_value(i64 %xor106, !2084, !DIExpression(), !2050)
  %xor109 = call i64 @llvm.fshl.i64(i64 %xor106, i64 %xor106, i64 45), !dbg !2238
    #dbg_value(i64 %xor109, !2111, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 %xor105, i64 %xor113, i64 %xor109), !2125, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor109, i64 %xor97, i64 %xor113), !2126, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor109, i64 %xor105), !2124, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %not120 = xor i64 %xor109, -1, !dbg !2239
    #dbg_value(!DIArgList(i64 %xor105, i64 %xor113, i64 %not120), !2125, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %and121 = and i64 %xor113, %not120, !dbg !2240
    #dbg_value(!DIArgList(i64 %xor105, i64 %and121), !2125, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor122 = xor i64 %xor105, %and121, !dbg !2241
    #dbg_value(i64 %xor122, !2125, !DIExpression(), !2050)
  %xor242 = xor i64 %xor87, %xor122, !dbg !2242
  %xor145 = xor i64 %Asa.0, %xor45, !dbg !2243
    #dbg_value(i64 %xor145, !2092, !DIExpression(), !2050)
  %xor148 = call i64 @llvm.fshl.i64(i64 %xor145, i64 %xor145, i64 18), !dbg !2244
    #dbg_value(i64 %xor148, !2112, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 %xor148, i64 %xor136, i64 %xor132), !2132, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor141 = xor i64 %Amu.0, %xor61, !dbg !2245
    #dbg_value(i64 %xor141, !2090, !DIExpression(), !2050)
  %xor144 = call i64 @llvm.fshl.i64(i64 %xor141, i64 %xor141, i64 8), !dbg !2246
    #dbg_value(i64 %xor144, !2111, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 %xor140, i64 %xor148, i64 %xor144), !2130, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor144, i64 %xor140), !2129, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor132, i64 %xor148), !2131, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %not155 = xor i64 %xor144, -1, !dbg !2247
    #dbg_value(!DIArgList(i64 %xor140, i64 %xor148, i64 %not155), !2130, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %and156 = and i64 %xor148, %not155, !dbg !2248
    #dbg_value(!DIArgList(i64 %xor140, i64 %and156), !2130, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor157 = xor i64 %xor140, %and156, !dbg !2249
    #dbg_value(i64 %xor157, !2130, !DIExpression(), !2050)
  %xor243 = xor i64 %xor242, %xor157, !dbg !2250
  %xor180 = xor i64 %Aso.0, %xor57, !dbg !2251
    #dbg_value(i64 %xor180, !2098, !DIExpression(), !2050)
  %xor183 = call i64 @llvm.fshl.i64(i64 %xor180, i64 %xor180, i64 56), !dbg !2252
    #dbg_value(i64 %xor183, !2112, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 %xor183, i64 %xor171, i64 %xor167), !2137, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor176 = xor i64 %Ami.0, %xor53, !dbg !2253
    #dbg_value(i64 %xor176, !2086, !DIExpression(), !2050)
  %xor179 = call i64 @llvm.fshl.i64(i64 %xor176, i64 %xor176, i64 15), !dbg !2254
    #dbg_value(i64 %xor179, !2111, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 %xor175, i64 %xor183, i64 %xor179), !2135, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor179, i64 %xor175), !2134, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor167, i64 %xor183), !2136, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %xor74, i64 %xor70), !2109, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %not190 = xor i64 %xor179, -1, !dbg !2255
    #dbg_value(!DIArgList(i64 %xor175, i64 %xor183, i64 %not190), !2135, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %and191 = and i64 %xor183, %not190, !dbg !2256
    #dbg_value(!DIArgList(i64 %xor175, i64 %and191), !2135, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor192 = xor i64 %xor175, %and191, !dbg !2257
    #dbg_value(i64 %xor192, !2135, !DIExpression(), !2050)
  %xor244 = xor i64 %xor243, %xor192, !dbg !2258
  %xor215 = xor i64 %Ase.0, %xor49, !dbg !2259
    #dbg_value(i64 %xor215, !2094, !DIExpression(), !2050)
  %xor218 = call i64 @llvm.fshl.i64(i64 %xor215, i64 %xor215, i64 2), !dbg !2260
    #dbg_value(!DIArgList(i64 %xor210, i64 %xor218, i64 %xor214), !2140, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor218, i64 %xor206, i64 %xor202), !2142, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor202, i64 %xor218), !2141, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %xor218, i64 %xor214), !2110, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %xor97, i64 %xor113), !2111, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %xor66, i64 %xor62), !2112, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
  %not225 = xor i64 %xor214, -1, !dbg !2261
    #dbg_value(!DIArgList(i64 %xor210, i64 %xor218, i64 %not225), !2140, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %xor218, i64 %not225), !2110, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
  %and226 = and i64 %xor218, %not225, !dbg !2262
    #dbg_value(!DIArgList(i64 %xor210, i64 %and226), !2140, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %and226), !2110, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor227 = xor i64 %xor210, %and226, !dbg !2263
    #dbg_value(i64 %xor227, !2140, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor227), !2110, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor245 = xor i64 %xor244, %xor227, !dbg !2264
    #dbg_value(i64 %xor245, !2110, !DIExpression(), !2050)
  %xor260 = call i64 @llvm.fshl.i64(i64 %xor245, i64 %xor245, i64 1), !dbg !2265
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor237, i64 %xor260), !2139, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor237, i64 %xor74, i64 %xor70, i64 %xor260), !2119, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor237, i64 %xor109, i64 %xor105, i64 %xor260), !2124, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor237, i64 %xor144, i64 %xor140, i64 %xor260), !2129, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor237, i64 %xor179, i64 %xor175, i64 %xor260), !2134, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor237, i64 %xor260), !2114, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor261 = xor i64 %xor237, %xor260, !dbg !2266
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor261), !2139, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %xor74, i64 %xor70), !2119, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %xor109, i64 %xor105), !2124, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %xor144, i64 %xor140), !2129, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %xor179, i64 %xor175), !2134, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 %xor261, !2114, !DIExpression(), !2050)
  %xor429 = xor i64 %xor224, %xor261, !dbg !2267
    #dbg_value(i64 %xor429, !2139, !DIExpression(), !2050)
  %xor432 = call i64 @llvm.fshl.i64(i64 %xor429, i64 %xor429, i64 2), !dbg !2268
    #dbg_value(i64 %xor432, !2112, !DIExpression(), !2050)
  %not123 = xor i64 %xor113, -1, !dbg !2269
    #dbg_value(!DIArgList(i64 %xor109, i64 %xor97, i64 %not123), !2126, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %xor97, i64 %not123), !2111, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
  %and124 = and i64 %xor97, %not123, !dbg !2270
    #dbg_value(!DIArgList(i64 %xor109, i64 %and124), !2126, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %and124), !2111, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor125 = xor i64 %xor109, %and124, !dbg !2271
    #dbg_value(i64 %xor125, !2126, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %xor62, i64 %xor78), !2111, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
  %not91 = xor i64 %xor62, -1, !dbg !2272
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor66, i64 %not91), !2122, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %xor66, i64 %not91), !2112, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
  %and92 = and i64 %xor66, %not91, !dbg !2273
    #dbg_value(!DIArgList(i64 %xor78, i64 %and92), !2122, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %and92), !2112, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor93 = xor i64 %xor78, %and92, !dbg !2274
    #dbg_value(i64 %xor93, !2122, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97), !2112, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
  %not126 = xor i64 %xor97, -1, !dbg !2275
    #dbg_value(!DIArgList(i64 %xor113, i64 %xor101, i64 %not126), !2127, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %not126), !2112, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
  %and127 = and i64 %xor101, %not126, !dbg !2276
    #dbg_value(!DIArgList(i64 %xor113, i64 %and127), !2127, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %and127), !2112, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor128 = xor i64 %xor113, %and127, !dbg !2277
    #dbg_value(i64 %xor128, !2127, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor128), !2112, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor250 = xor i64 %xor93, %xor128, !dbg !2278
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132), !2112, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
  %not161 = xor i64 %xor132, -1, !dbg !2279
    #dbg_value(!DIArgList(i64 %xor148, i64 %xor136, i64 %not161), !2132, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %not161), !2112, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
  %and162 = and i64 %xor136, %not161, !dbg !2280
    #dbg_value(!DIArgList(i64 %xor148, i64 %and162), !2132, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %and162), !2112, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor163 = xor i64 %xor148, %and162, !dbg !2281
    #dbg_value(i64 %xor163, !2132, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor163), !2112, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor251 = xor i64 %xor250, %xor163, !dbg !2282
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167), !2112, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
  %not196 = xor i64 %xor167, -1, !dbg !2283
    #dbg_value(!DIArgList(i64 %xor183, i64 %xor171, i64 %not196), !2137, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %not196), !2112, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
  %and197 = and i64 %xor171, %not196, !dbg !2284
    #dbg_value(!DIArgList(i64 %xor183, i64 %and197), !2137, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %and197), !2112, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor198 = xor i64 %xor183, %and197, !dbg !2285
    #dbg_value(i64 %xor198, !2137, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor198), !2112, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor252 = xor i64 %xor251, %xor198, !dbg !2286
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %xor206, i64 %xor202), !2112, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
  %not231 = xor i64 %xor202, -1, !dbg !2287
    #dbg_value(!DIArgList(i64 %xor218, i64 %xor206, i64 %not231), !2142, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %xor206, i64 %not231), !2112, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
  %and232 = and i64 %xor206, %not231, !dbg !2288
    #dbg_value(!DIArgList(i64 %xor218, i64 %and232), !2142, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %and232), !2112, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor233 = xor i64 %xor218, %and232, !dbg !2289
    #dbg_value(i64 %xor233, !2142, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor233), !2112, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor253 = xor i64 %xor252, %xor233, !dbg !2290
    #dbg_value(i64 %xor253, !2112, !DIExpression(), !2050)
  %xor268 = call i64 @llvm.fshl.i64(i64 %xor253, i64 %xor253, i64 1), !dbg !2291
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor245, i64 %xor268), !2126, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor245, i64 %xor62, i64 %xor78, i64 %xor268), !2121, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor245, i64 %xor132, i64 %xor148, i64 %xor268), !2131, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor245, i64 %xor167, i64 %xor183, i64 %xor268), !2136, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor245, i64 %xor202, i64 %xor218, i64 %xor268), !2141, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor245, i64 %xor268), !2116, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor269 = xor i64 %xor245, %xor268, !dbg !2292
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor269), !2126, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %xor62, i64 %xor78), !2121, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %xor132, i64 %xor148), !2131, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %xor167, i64 %xor183), !2136, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %xor202, i64 %xor218), !2141, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 %xor269, !2116, !DIExpression(), !2050)
  %xor417 = xor i64 %xor125, %xor269, !dbg !2293
    #dbg_value(i64 %xor417, !2126, !DIExpression(), !2050)
  %xor420 = call i64 @llvm.fshl.i64(i64 %xor417, i64 %xor417, i64 55), !dbg !2294
    #dbg_value(i64 %xor420, !2109, !DIExpression(), !2050)
  %not82 = xor i64 %xor70, -1, !dbg !2295
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %xor74, i64 %not82), !2109, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %xor74, i64 %not82), !2119, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %and83 = and i64 %xor74, %not82, !dbg !2296
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %and83), !2109, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %and83), !2119, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor84 = xor i64 %xor66, %and83, !dbg !2297
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105), !2109, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor261), !2119, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %not117 = xor i64 %xor105, -1, !dbg !2298
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %not117), !2109, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %xor109, i64 %not117), !2124, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %and118 = and i64 %xor109, %not117, !dbg !2299
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %and118), !2109, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %and118), !2124, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor119 = xor i64 %xor101, %and118, !dbg !2300
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor119), !2109, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor119, i64 %xor261), !2124, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor238 = xor i64 %xor84, %xor119, !dbg !2301
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140), !2109, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %not152 = xor i64 %xor140, -1, !dbg !2302
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %not152), !2109, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %xor144, i64 %not152), !2129, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %and153 = and i64 %xor144, %not152, !dbg !2303
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %and153), !2109, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %and153), !2129, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor154 = xor i64 %xor136, %and153, !dbg !2304
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor154), !2109, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor154, i64 %xor261), !2129, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor239 = xor i64 %xor238, %xor154, !dbg !2305
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175), !2109, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %not187 = xor i64 %xor175, -1, !dbg !2306
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %xor179, i64 %not187), !2109, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %xor179, i64 %not187), !2134, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %and188 = and i64 %xor179, %not187, !dbg !2307
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %and188), !2109, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %and188), !2134, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor189 = xor i64 %xor171, %and188, !dbg !2308
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor189), !2109, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor189, i64 %xor261), !2134, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor240 = xor i64 %xor239, %xor189, !dbg !2309
    #dbg_value(!DIArgList(i64 %xor240, i64 %xor224), !2109, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor241 = xor i64 %xor240, %xor224, !dbg !2310
    #dbg_value(i64 %xor241, !2109, !DIExpression(), !2050)
  %not88 = xor i64 %xor78, -1, !dbg !2311
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %xor62, i64 %not88), !2111, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %xor62, i64 %not88), !2121, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %and89 = and i64 %xor62, %not88, !dbg !2312
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %and89), !2111, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %and89), !2121, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor90 = xor i64 %xor74, %and89, !dbg !2313
    #dbg_value(!DIArgList(i64 %xor90, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125), !2111, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor90, i64 %xor269), !2121, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor246 = xor i64 %xor90, %xor125, !dbg !2314
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148), !2111, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
  %not158 = xor i64 %xor148, -1, !dbg !2315
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %not158), !2111, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %xor132, i64 %not158), !2131, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %and159 = and i64 %xor132, %not158, !dbg !2316
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %and159), !2111, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %and159), !2131, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor160 = xor i64 %xor144, %and159, !dbg !2317
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor160), !2111, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor160, i64 %xor269), !2131, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor247 = xor i64 %xor246, %xor160, !dbg !2318
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183), !2111, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
  %not193 = xor i64 %xor183, -1, !dbg !2319
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %not193), !2111, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %xor167, i64 %not193), !2136, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %and194 = and i64 %xor167, %not193, !dbg !2320
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %and194), !2111, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %and194), !2136, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor195 = xor i64 %xor179, %and194, !dbg !2321
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor195), !2111, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor195, i64 %xor269), !2136, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor248 = xor i64 %xor247, %xor195, !dbg !2322
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %xor202, i64 %xor218), !2111, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
  %not228 = xor i64 %xor218, -1, !dbg !2323
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %xor202, i64 %not228), !2111, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %xor202, i64 %not228), !2141, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %and229 = and i64 %xor202, %not228, !dbg !2324
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %and229), !2111, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %and229), !2141, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor230 = xor i64 %xor214, %and229, !dbg !2325
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor230), !2111, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor230, i64 %xor269), !2141, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor249 = xor i64 %xor248, %xor230, !dbg !2326
    #dbg_value(i64 %xor249, !2111, !DIExpression(), !2050)
  %xor264 = call i64 @llvm.fshl.i64(i64 %xor249, i64 %xor249, i64 1), !dbg !2327
    #dbg_value(!DIArgList(i64 %xor241, i64 %xor264), !2115, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor241, i64 %xor264), !2120, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor241, i64 %xor264), !2135, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor241, i64 %xor264), !2125, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor241, i64 %xor264), !2140, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor241, i64 %xor264), !2130, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor265 = xor i64 %xor241, %xor264, !dbg !2328
    #dbg_value(i64 %xor265, !2115, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor265), !2120, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor265), !2135, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor265), !2125, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor265), !2140, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor265), !2130, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor413 = xor i64 %xor87, %xor265, !dbg !2329
    #dbg_value(i64 %xor413, !2120, !DIExpression(), !2050)
  %xor416 = call i64 @llvm.fshl.i64(i64 %xor413, i64 %xor413, i64 62), !dbg !2330
    #dbg_value(i64 %xor416, !2108, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 %xor432, i64 %xor420, i64 %xor416), !2100, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %not445 = xor i64 %xor416, -1, !dbg !2331
    #dbg_value(!DIArgList(i64 %xor432, i64 %xor420, i64 %not445), !2100, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %and446 = and i64 %xor420, %not445, !dbg !2332
    #dbg_value(!DIArgList(i64 %xor432, i64 %and446), !2100, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor447 = xor i64 %xor432, %and446, !dbg !2333
    #dbg_value(i64 %xor447, !2100, !DIExpression(), !2050)
  %xor256 = call i64 @llvm.fshl.i64(i64 %xor241, i64 %xor241, i64 1), !dbg !2334
    #dbg_value(!DIArgList(i64 %xor253, i64 %xor256), !2113, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor253, i64 %xor256), !2123, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor253, i64 %xor256), !2138, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor253, i64 %xor256), !2128, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %xor256), !2118, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %xor256), !2108, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor253, i64 %xor256), !2133, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor257 = xor i64 %xor253, %xor256, !dbg !2335
    #dbg_value(i64 %xor257, !2113, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor257), !2123, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor257), !2138, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor257), !2128, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !2108, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !2118, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor257), !2133, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor425 = xor i64 %xor186, %xor257, !dbg !2336
    #dbg_value(i64 %xor425, !2133, !DIExpression(), !2050)
  %xor428 = call i64 @llvm.fshl.i64(i64 %xor425, i64 %xor425, i64 41), !dbg !2337
    #dbg_value(i64 %xor428, !2111, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 %xor428, i64 %xor416, i64 %xor432), !2098, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %not442 = xor i64 %xor432, -1, !dbg !2338
    #dbg_value(!DIArgList(i64 %xor428, i64 %xor416, i64 %not442), !2098, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %and443 = and i64 %xor416, %not442, !dbg !2339
    #dbg_value(!DIArgList(i64 %xor428, i64 %and443), !2098, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor444 = xor i64 %xor428, %and443, !dbg !2340
    #dbg_value(i64 %xor444, !2098, !DIExpression(), !2050)
  %xor272 = call i64 @llvm.fshl.i64(i64 %xor237, i64 %xor237, i64 1), !dbg !2341
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor249, i64 %xor272), !2122, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor249, i64 %xor272), !2137, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor249, i64 %xor272), !2127, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor249, i64 %xor272), !2142, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor249, i64 %xor272), !2117, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor249, i64 %xor272), !2132, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor273 = xor i64 %xor249, %xor272, !dbg !2342
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor273), !2122, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor273), !2137, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor273), !2127, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor273), !2142, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(i64 %xor273, !2117, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor273), !2132, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor421 = xor i64 %xor163, %xor273, !dbg !2343
    #dbg_value(i64 %xor421, !2132, !DIExpression(), !2050)
  %xor424 = call i64 @llvm.fshl.i64(i64 %xor421, i64 %xor421, i64 39), !dbg !2344
    #dbg_value(i64 %xor424, !2110, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 %xor424, i64 %xor432, i64 %xor428), !2096, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor420, i64 %xor428, i64 %xor424), !2094, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor416, i64 %xor424, i64 %xor420), !2092, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %not439 = xor i64 %xor428, -1, !dbg !2345
    #dbg_value(!DIArgList(i64 %xor424, i64 %xor432, i64 %not439), !2096, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %and440 = and i64 %xor432, %not439, !dbg !2346
    #dbg_value(!DIArgList(i64 %xor424, i64 %and440), !2096, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor441 = xor i64 %xor424, %and440, !dbg !2347
    #dbg_value(i64 %xor441, !2096, !DIExpression(), !2050)
  %not436 = xor i64 %xor424, -1, !dbg !2348
    #dbg_value(!DIArgList(i64 %xor420, i64 %xor428, i64 %not436), !2094, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %and437 = and i64 %xor428, %not436, !dbg !2349
    #dbg_value(!DIArgList(i64 %xor420, i64 %and437), !2094, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor438 = xor i64 %xor420, %and437, !dbg !2350
    #dbg_value(i64 %xor438, !2094, !DIExpression(), !2050)
  %not433 = xor i64 %xor420, -1, !dbg !2351
    #dbg_value(!DIArgList(i64 %xor416, i64 %xor424, i64 %not433), !2092, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %and434 = and i64 %xor424, %not433, !dbg !2352
    #dbg_value(!DIArgList(i64 %xor416, i64 %and434), !2092, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor435 = xor i64 %xor416, %and434, !dbg !2353
    #dbg_value(i64 %xor435, !2092, !DIExpression(), !2050)
  %xor394 = xor i64 %xor230, %xor269, !dbg !2354
    #dbg_value(i64 %xor394, !2141, !DIExpression(), !2050)
  %xor397 = call i64 @llvm.fshl.i64(i64 %xor394, i64 %xor394, i64 56), !dbg !2355
    #dbg_value(i64 %xor397, !2112, !DIExpression(), !2050)
  %xor382 = xor i64 %xor116, %xor257, !dbg !2356
    #dbg_value(i64 %xor382, !2123, !DIExpression(), !2050)
  %xor385 = call i64 @llvm.fshl.i64(i64 %xor382, i64 %xor382, i64 36), !dbg !2357
    #dbg_value(i64 %xor385, !2109, !DIExpression(), !2050)
  %xor378 = xor i64 %xor93, %xor273, !dbg !2358
    #dbg_value(i64 %xor378, !2122, !DIExpression(), !2050)
  %xor381 = call i64 @llvm.fshl.i64(i64 %xor378, i64 %xor378, i64 27), !dbg !2359
    #dbg_value(i64 %xor381, !2108, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 %xor397, i64 %xor385, i64 %xor381), !2090, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %not410 = xor i64 %xor381, -1, !dbg !2360
    #dbg_value(!DIArgList(i64 %xor397, i64 %xor385, i64 %not410), !2090, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %and411 = and i64 %xor385, %not410, !dbg !2361
    #dbg_value(!DIArgList(i64 %xor397, i64 %and411), !2090, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor412 = xor i64 %xor397, %and411, !dbg !2362
    #dbg_value(i64 %xor412, !2090, !DIExpression(), !2050)
  %xor390 = xor i64 %xor192, %xor265, !dbg !2363
    #dbg_value(i64 %xor390, !2135, !DIExpression(), !2050)
  %xor393 = call i64 @llvm.fshl.i64(i64 %xor390, i64 %xor390, i64 15), !dbg !2364
    #dbg_value(i64 %xor393, !2111, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 %xor393, i64 %xor381, i64 %xor397), !2088, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %not407 = xor i64 %xor397, -1, !dbg !2365
    #dbg_value(!DIArgList(i64 %xor393, i64 %xor381, i64 %not407), !2088, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %and408 = and i64 %xor381, %not407, !dbg !2366
    #dbg_value(!DIArgList(i64 %xor393, i64 %and408), !2088, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor409 = xor i64 %xor393, %and408, !dbg !2367
    #dbg_value(i64 %xor409, !2088, !DIExpression(), !2050)
  %xor386 = xor i64 %xor154, %xor261, !dbg !2368
    #dbg_value(i64 %xor386, !2129, !DIExpression(), !2050)
  %xor389 = call i64 @llvm.fshl.i64(i64 %xor386, i64 %xor386, i64 10), !dbg !2369
    #dbg_value(i64 %xor389, !2110, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 %xor389, i64 %xor397, i64 %xor393), !2086, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor385, i64 %xor393, i64 %xor389), !2084, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor381, i64 %xor389, i64 %xor385), !2082, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %not404 = xor i64 %xor393, -1, !dbg !2370
    #dbg_value(!DIArgList(i64 %xor389, i64 %xor397, i64 %not404), !2086, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %and405 = and i64 %xor397, %not404, !dbg !2371
    #dbg_value(!DIArgList(i64 %xor389, i64 %and405), !2086, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor406 = xor i64 %xor389, %and405, !dbg !2372
    #dbg_value(i64 %xor406, !2086, !DIExpression(), !2050)
  %not401 = xor i64 %xor389, -1, !dbg !2373
    #dbg_value(!DIArgList(i64 %xor385, i64 %xor393, i64 %not401), !2084, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %and402 = and i64 %xor393, %not401, !dbg !2374
    #dbg_value(!DIArgList(i64 %xor385, i64 %and402), !2084, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor403 = xor i64 %xor385, %and402, !dbg !2375
    #dbg_value(i64 %xor403, !2084, !DIExpression(), !2050)
  %not398 = xor i64 %xor385, -1, !dbg !2376
    #dbg_value(!DIArgList(i64 %xor381, i64 %xor389, i64 %not398), !2082, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %and399 = and i64 %xor389, %not398, !dbg !2377
    #dbg_value(!DIArgList(i64 %xor381, i64 %and399), !2082, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor400 = xor i64 %xor381, %and399, !dbg !2378
    #dbg_value(i64 %xor400, !2082, !DIExpression(), !2050)
  %xor359 = xor i64 %xor221, %xor257, !dbg !2379
    #dbg_value(i64 %xor359, !2138, !DIExpression(), !2050)
  %xor362 = call i64 @llvm.fshl.i64(i64 %xor359, i64 %xor359, i64 18), !dbg !2380
    #dbg_value(i64 %xor362, !2112, !DIExpression(), !2050)
  %xor347 = xor i64 %xor122, %xor265, !dbg !2381
    #dbg_value(i64 %xor347, !2125, !DIExpression(), !2050)
  %xor350 = call i64 @llvm.fshl.i64(i64 %xor347, i64 %xor347, i64 6), !dbg !2382
    #dbg_value(i64 %xor350, !2109, !DIExpression(), !2050)
  %xor343 = xor i64 %xor84, %xor261, !dbg !2383
    #dbg_value(i64 %xor343, !2119, !DIExpression(), !2050)
  %xor346 = call i64 @llvm.fshl.i64(i64 %xor343, i64 %xor343, i64 1), !dbg !2384
    #dbg_value(i64 %xor346, !2108, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 %xor362, i64 %xor350, i64 %xor346), !2080, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %not375 = xor i64 %xor346, -1, !dbg !2385
    #dbg_value(!DIArgList(i64 %xor362, i64 %xor350, i64 %not375), !2080, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %and376 = and i64 %xor350, %not375, !dbg !2386
    #dbg_value(!DIArgList(i64 %xor362, i64 %and376), !2080, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor377 = xor i64 %xor362, %and376, !dbg !2387
    #dbg_value(i64 %xor377, !2080, !DIExpression(), !2050)
  %xor355 = xor i64 %xor198, %xor273, !dbg !2388
    #dbg_value(i64 %xor355, !2137, !DIExpression(), !2050)
  %xor358 = call i64 @llvm.fshl.i64(i64 %xor355, i64 %xor355, i64 8), !dbg !2389
    #dbg_value(i64 %xor358, !2111, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 %xor358, i64 %xor346, i64 %xor362), !2078, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %not372 = xor i64 %xor362, -1, !dbg !2390
    #dbg_value(!DIArgList(i64 %xor358, i64 %xor346, i64 %not372), !2078, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %and373 = and i64 %xor346, %not372, !dbg !2391
    #dbg_value(!DIArgList(i64 %xor358, i64 %and373), !2078, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor374 = xor i64 %xor358, %and373, !dbg !2392
    #dbg_value(i64 %xor374, !2078, !DIExpression(), !2050)
  %xor351 = xor i64 %xor160, %xor269, !dbg !2393
    #dbg_value(i64 %xor351, !2131, !DIExpression(), !2050)
  %xor354 = call i64 @llvm.fshl.i64(i64 %xor351, i64 %xor351, i64 25), !dbg !2394
    #dbg_value(i64 %xor354, !2110, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 %xor354, i64 %xor362, i64 %xor358), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor350, i64 %xor358, i64 %xor354), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor346, i64 %xor354, i64 %xor350), !2072, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %not369 = xor i64 %xor358, -1, !dbg !2395
    #dbg_value(!DIArgList(i64 %xor354, i64 %xor362, i64 %not369), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %and370 = and i64 %xor362, %not369, !dbg !2396
    #dbg_value(!DIArgList(i64 %xor354, i64 %and370), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor371 = xor i64 %xor354, %and370, !dbg !2397
    #dbg_value(i64 %xor371, !2076, !DIExpression(), !2050)
  %not366 = xor i64 %xor354, -1, !dbg !2398
    #dbg_value(!DIArgList(i64 %xor350, i64 %xor358, i64 %not366), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %and367 = and i64 %xor358, %not366, !dbg !2399
    #dbg_value(!DIArgList(i64 %xor350, i64 %and367), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor368 = xor i64 %xor350, %and367, !dbg !2400
    #dbg_value(i64 %xor368, !2074, !DIExpression(), !2050)
  %not363 = xor i64 %xor350, -1, !dbg !2401
    #dbg_value(!DIArgList(i64 %xor346, i64 %xor354, i64 %not363), !2072, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %and364 = and i64 %xor354, %not363, !dbg !2402
    #dbg_value(!DIArgList(i64 %xor346, i64 %and364), !2072, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor365 = xor i64 %xor346, %and364, !dbg !2403
    #dbg_value(i64 %xor365, !2072, !DIExpression(), !2050)
  %xor324 = xor i64 %xor227, %xor265, !dbg !2404
    #dbg_value(i64 %xor324, !2140, !DIExpression(), !2050)
  %xor327 = call i64 @llvm.fshl.i64(i64 %xor324, i64 %xor324, i64 61), !dbg !2405
    #dbg_value(i64 %xor327, !2112, !DIExpression(), !2050)
  %xor312 = xor i64 %xor128, %xor273, !dbg !2406
    #dbg_value(i64 %xor312, !2127, !DIExpression(), !2050)
  %xor315 = call i64 @llvm.fshl.i64(i64 %xor312, i64 %xor312, i64 20), !dbg !2407
    #dbg_value(i64 %xor315, !2109, !DIExpression(), !2050)
  %xor308 = xor i64 %xor90, %xor269, !dbg !2408
    #dbg_value(i64 %xor308, !2121, !DIExpression(), !2050)
  %xor311 = call i64 @llvm.fshl.i64(i64 %xor308, i64 %xor308, i64 28), !dbg !2409
    #dbg_value(i64 %xor311, !2108, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 %xor327, i64 %xor315, i64 %xor311), !2070, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %not340 = xor i64 %xor311, -1, !dbg !2410
    #dbg_value(!DIArgList(i64 %xor327, i64 %xor315, i64 %not340), !2070, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %and341 = and i64 %xor315, %not340, !dbg !2411
    #dbg_value(!DIArgList(i64 %xor327, i64 %and341), !2070, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor342 = xor i64 %xor327, %and341, !dbg !2412
    #dbg_value(i64 %xor342, !2070, !DIExpression(), !2050)
  %xor320 = xor i64 %xor189, %xor261, !dbg !2413
    #dbg_value(i64 %xor320, !2134, !DIExpression(), !2050)
  %xor323 = call i64 @llvm.fshl.i64(i64 %xor320, i64 %xor320, i64 45), !dbg !2414
    #dbg_value(i64 %xor323, !2111, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 %xor323, i64 %xor311, i64 %xor327), !2068, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %not337 = xor i64 %xor327, -1, !dbg !2415
    #dbg_value(!DIArgList(i64 %xor323, i64 %xor311, i64 %not337), !2068, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %and338 = and i64 %xor311, %not337, !dbg !2416
    #dbg_value(!DIArgList(i64 %xor323, i64 %and338), !2068, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor339 = xor i64 %xor323, %and338, !dbg !2417
    #dbg_value(i64 %xor339, !2068, !DIExpression(), !2050)
  %xor316 = xor i64 %xor151, %xor257, !dbg !2418
    #dbg_value(i64 %xor316, !2128, !DIExpression(), !2050)
  %xor319 = call i64 @llvm.fshl.i64(i64 %xor316, i64 %xor316, i64 3), !dbg !2419
    #dbg_value(i64 %xor319, !2110, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 %xor319, i64 %xor327, i64 %xor323), !2066, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor315, i64 %xor323, i64 %xor319), !2064, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor311, i64 %xor319, i64 %xor315), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %not334 = xor i64 %xor323, -1, !dbg !2420
    #dbg_value(!DIArgList(i64 %xor319, i64 %xor327, i64 %not334), !2066, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %and335 = and i64 %xor327, %not334, !dbg !2421
    #dbg_value(!DIArgList(i64 %xor319, i64 %and335), !2066, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor336 = xor i64 %xor319, %and335, !dbg !2422
    #dbg_value(i64 %xor336, !2066, !DIExpression(), !2050)
  %not331 = xor i64 %xor319, -1, !dbg !2423
    #dbg_value(!DIArgList(i64 %xor315, i64 %xor323, i64 %not331), !2064, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %and332 = and i64 %xor323, %not331, !dbg !2424
    #dbg_value(!DIArgList(i64 %xor315, i64 %and332), !2064, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor333 = xor i64 %xor315, %and332, !dbg !2425
    #dbg_value(i64 %xor333, !2064, !DIExpression(), !2050)
  %not328 = xor i64 %xor315, -1, !dbg !2426
    #dbg_value(!DIArgList(i64 %xor311, i64 %xor319, i64 %not328), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %and329 = and i64 %xor319, %not328, !dbg !2427
    #dbg_value(!DIArgList(i64 %xor311, i64 %and329), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor330 = xor i64 %xor311, %and329, !dbg !2428
    #dbg_value(i64 %xor330, !2062, !DIExpression(), !2050)
  %xor287 = xor i64 %xor233, %xor273, !dbg !2429
    #dbg_value(i64 %xor287, !2142, !DIExpression(), !2050)
  %xor290 = call i64 @llvm.fshl.i64(i64 %xor287, i64 %xor287, i64 14), !dbg !2430
    #dbg_value(i64 %xor290, !2112, !DIExpression(), !2050)
  %xor275 = xor i64 %xor119, %xor261, !dbg !2431
    #dbg_value(i64 %xor275, !2124, !DIExpression(), !2050)
  %xor278 = call i64 @llvm.fshl.i64(i64 %xor275, i64 %xor275, i64 44), !dbg !2432
    #dbg_value(i64 %xor278, !2109, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %xor81, i64 %xor257), !2060, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor274 = xor i64 %xor81, %xor257, !dbg !2433
    #dbg_value(i64 %xor274, !2118, !DIExpression(), !2050)
    #dbg_value(i64 %xor274, !2108, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %xor274), !2060, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %not305 = xor i64 %xor274, -1, !dbg !2434
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %not305), !2060, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %and306 = and i64 %xor278, %not305, !dbg !2435
    #dbg_value(!DIArgList(i64 %xor290, i64 %and306), !2060, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor307 = xor i64 %xor290, %and306, !dbg !2436
    #dbg_value(i64 %xor307, !2060, !DIExpression(), !2050)
  %xor283 = xor i64 %xor195, %xor269, !dbg !2437
    #dbg_value(i64 %xor283, !2136, !DIExpression(), !2050)
  %xor286 = call i64 @llvm.fshl.i64(i64 %xor283, i64 %xor283, i64 21), !dbg !2438
    #dbg_value(i64 %xor286, !2111, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 %xor286, i64 %xor274, i64 %xor290), !2058, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %not302 = xor i64 %xor290, -1, !dbg !2439
    #dbg_value(!DIArgList(i64 %xor286, i64 %xor274, i64 %not302), !2058, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %and303 = and i64 %xor274, %not302, !dbg !2440
    #dbg_value(!DIArgList(i64 %xor286, i64 %and303), !2058, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor304 = xor i64 %xor286, %and303, !dbg !2441
    #dbg_value(i64 %xor304, !2058, !DIExpression(), !2050)
  %xor279 = xor i64 %xor157, %xor265, !dbg !2442
    #dbg_value(i64 %xor279, !2130, !DIExpression(), !2050)
  %xor282 = call i64 @llvm.fshl.i64(i64 %xor279, i64 %xor279, i64 43), !dbg !2443
    #dbg_value(i64 %xor282, !2110, !DIExpression(), !2050)
    #dbg_value(!DIArgList(i64 %xor282, i64 %xor290, i64 %xor286), !2056, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor278, i64 %xor286, i64 %xor282), !2054, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
    #dbg_value(!DIArgList(i64 %xor274, i64 %xor282, i64 %xor278), !2052, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %not299 = xor i64 %xor286, -1, !dbg !2444
    #dbg_value(!DIArgList(i64 %xor282, i64 %xor290, i64 %not299), !2056, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %and300 = and i64 %xor290, %not299, !dbg !2445
    #dbg_value(!DIArgList(i64 %xor282, i64 %and300), !2056, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor301 = xor i64 %xor282, %and300, !dbg !2446
    #dbg_value(i64 %xor301, !2056, !DIExpression(), !2050)
  %not296 = xor i64 %xor282, -1, !dbg !2447
    #dbg_value(!DIArgList(i64 %xor278, i64 %xor286, i64 %not296), !2054, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2050)
  %and297 = and i64 %xor286, %not296, !dbg !2448
    #dbg_value(!DIArgList(i64 %xor278, i64 %and297), !2054, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %xor298 = xor i64 %xor278, %and297, !dbg !2449
    #dbg_value(i64 %xor298, !2054, !DIExpression(), !2050)
  %add = or disjoint i32 %round.0, 1, !dbg !2450
  %arrayidx294 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %add, !dbg !2451
  %27 = load i64, ptr %arrayidx294, align 8, !dbg !2451
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %xor282, i64 %xor278), !2052, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %not291 = xor i64 %xor278, -1, !dbg !2452
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %xor282, i64 %not291), !2052, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %and292 = and i64 %xor282, %not291, !dbg !2453
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %and292), !2052, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2050)
  %28 = xor i64 %and292, %27, !dbg !2454
  %xor295 = xor i64 %28, %xor274, !dbg !2454
    #dbg_value(i64 %xor295, !2052, !DIExpression(), !2050)
  %add448 = add nuw nsw i32 %round.0, 2, !dbg !2455
    #dbg_value(i32 %add448, !2101, !DIExpression(), !2050)
  br label %for.cond, !dbg !2456, !llvm.loop !2457

for.end:                                          ; preds = %for.cond
  %Aso.0.lcssa = phi i64 [ %Aso.0, %for.cond ], !dbg !2050
  %Asi.0.lcssa = phi i64 [ %Asi.0, %for.cond ], !dbg !2050
  %Ase.0.lcssa = phi i64 [ %Ase.0, %for.cond ], !dbg !2050
  %Asa.0.lcssa = phi i64 [ %Asa.0, %for.cond ], !dbg !2050
  %Amu.0.lcssa = phi i64 [ %Amu.0, %for.cond ], !dbg !2050
  %Amo.0.lcssa = phi i64 [ %Amo.0, %for.cond ], !dbg !2050
  %Ami.0.lcssa = phi i64 [ %Ami.0, %for.cond ], !dbg !2050
  %Ame.0.lcssa = phi i64 [ %Ame.0, %for.cond ], !dbg !2050
  %Ama.0.lcssa = phi i64 [ %Ama.0, %for.cond ], !dbg !2050
  %Aku.0.lcssa = phi i64 [ %Aku.0, %for.cond ], !dbg !2050
  %Ako.0.lcssa = phi i64 [ %Ako.0, %for.cond ], !dbg !2050
  %Aki.0.lcssa = phi i64 [ %Aki.0, %for.cond ], !dbg !2050
  %Ake.0.lcssa = phi i64 [ %Ake.0, %for.cond ], !dbg !2050
  %Aka.0.lcssa = phi i64 [ %Aka.0, %for.cond ], !dbg !2050
  %Agu.0.lcssa = phi i64 [ %Agu.0, %for.cond ], !dbg !2050
  %Ago.0.lcssa = phi i64 [ %Ago.0, %for.cond ], !dbg !2050
  %Agi.0.lcssa = phi i64 [ %Agi.0, %for.cond ], !dbg !2050
  %Age.0.lcssa = phi i64 [ %Age.0, %for.cond ], !dbg !2050
  %Aga.0.lcssa = phi i64 [ %Aga.0, %for.cond ], !dbg !2050
  %Abu.0.lcssa = phi i64 [ %Abu.0, %for.cond ], !dbg !2050
  %Abo.0.lcssa = phi i64 [ %Abo.0, %for.cond ], !dbg !2050
  %Abi.0.lcssa = phi i64 [ %Abi.0, %for.cond ], !dbg !2050
  %Abe.0.lcssa = phi i64 [ %Abe.0, %for.cond ], !dbg !2050
  %Aba.0.lcssa = phi i64 [ %Aba.0, %for.cond ], !dbg !2050
  %Asu.0.lcssa = phi i64 [ %Asu.0, %for.cond ], !dbg !2050
  store i64 %Aba.0.lcssa, ptr %state, align 8, !dbg !2459
  %arrayidx450 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !2460
  store i64 %Abe.0.lcssa, ptr %arrayidx450, align 8, !dbg !2461
  %arrayidx451 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !2462
  store i64 %Abi.0.lcssa, ptr %arrayidx451, align 8, !dbg !2463
  %arrayidx452 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !2464
  store i64 %Abo.0.lcssa, ptr %arrayidx452, align 8, !dbg !2465
  %arrayidx453 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !2466
  store i64 %Abu.0.lcssa, ptr %arrayidx453, align 8, !dbg !2467
  %arrayidx454 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !2468
  store i64 %Aga.0.lcssa, ptr %arrayidx454, align 8, !dbg !2469
  %arrayidx455 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !2470
  store i64 %Age.0.lcssa, ptr %arrayidx455, align 8, !dbg !2471
  %arrayidx456 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !2472
  store i64 %Agi.0.lcssa, ptr %arrayidx456, align 8, !dbg !2473
  %arrayidx457 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !2474
  store i64 %Ago.0.lcssa, ptr %arrayidx457, align 8, !dbg !2475
  %arrayidx458 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !2476
  store i64 %Agu.0.lcssa, ptr %arrayidx458, align 8, !dbg !2477
  %arrayidx459 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !2478
  store i64 %Aka.0.lcssa, ptr %arrayidx459, align 8, !dbg !2479
  %arrayidx460 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !2480
  store i64 %Ake.0.lcssa, ptr %arrayidx460, align 8, !dbg !2481
  %arrayidx461 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !2482
  store i64 %Aki.0.lcssa, ptr %arrayidx461, align 8, !dbg !2483
  %arrayidx462 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !2484
  store i64 %Ako.0.lcssa, ptr %arrayidx462, align 8, !dbg !2485
  %arrayidx463 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !2486
  store i64 %Aku.0.lcssa, ptr %arrayidx463, align 8, !dbg !2487
  %arrayidx464 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !2488
  store i64 %Ama.0.lcssa, ptr %arrayidx464, align 8, !dbg !2489
  %arrayidx465 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !2490
  store i64 %Ame.0.lcssa, ptr %arrayidx465, align 8, !dbg !2491
  %arrayidx466 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !2492
  store i64 %Ami.0.lcssa, ptr %arrayidx466, align 8, !dbg !2493
  %arrayidx467 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !2494
  store i64 %Amo.0.lcssa, ptr %arrayidx467, align 8, !dbg !2495
  %arrayidx468 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !2496
  store i64 %Amu.0.lcssa, ptr %arrayidx468, align 8, !dbg !2497
  %arrayidx469 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !2498
  store i64 %Asa.0.lcssa, ptr %arrayidx469, align 8, !dbg !2499
  %arrayidx470 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !2500
  store i64 %Ase.0.lcssa, ptr %arrayidx470, align 8, !dbg !2501
  %arrayidx471 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !2502
  store i64 %Asi.0.lcssa, ptr %arrayidx471, align 8, !dbg !2503
  %arrayidx472 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !2504
  store i64 %Aso.0.lcssa, ptr %arrayidx472, align 8, !dbg !2505
  %arrayidx473 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !2506
  store i64 %Asu.0.lcssa, ptr %arrayidx473, align 8, !dbg !2507
  ret void, !dbg !2508
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_finalize(ptr noundef %state) local_unnamed_addr #0 !dbg !2509 {
entry:
    #dbg_value(ptr %state, !2510, !DIExpression(), !2511)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2512
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2512
  %conv = trunc i64 %0 to i32, !dbg !2512
  call fastcc void @keccak_finalize(ptr noundef %state, i32 noundef %conv, i32 noundef 168, i8 noundef zeroext 31) #3, !dbg !2513
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2514
  store i64 168, ptr %arrayidx1, align 8, !dbg !2515
  ret void, !dbg !2516
}

; Function Attrs: nounwind
define internal fastcc void @keccak_finalize(ptr noundef %s, i32 noundef %pos, i32 noundef range(i32 136, 169) %r, i8 noundef zeroext %p) unnamed_addr #0 !dbg !2517 {
entry:
    #dbg_value(ptr %s, !2520, !DIExpression(), !2521)
    #dbg_value(i32 %pos, !2522, !DIExpression(), !2521)
    #dbg_value(i32 %r, !2523, !DIExpression(), !2521)
    #dbg_value(i8 31, !2524, !DIExpression(), !2521)
  %rem = shl i32 %pos, 3, !dbg !2525
  %mul = and i32 %rem, 56, !dbg !2525
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2526
  %shl = shl nuw nsw i64 31, %sh_prom, !dbg !2526
  %div2 = lshr i32 %pos, 3, !dbg !2527
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div2, !dbg !2528
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2529
  %xor = xor i64 %0, %shl, !dbg !2529
  store i64 %xor, ptr %arrayidx, align 8, !dbg !2529
  %div13 = lshr i32 %r, 3, !dbg !2530
  %1 = getelementptr i64, ptr %s, i32 %div13, !dbg !2531
  %arrayidx2 = getelementptr i8, ptr %1, i32 -8, !dbg !2531
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !2532
  %xor3 = xor i64 %2, -9223372036854775808, !dbg !2532
  store i64 %xor3, ptr %arrayidx2, align 8, !dbg !2532
  ret void, !dbg !2533
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) local_unnamed_addr #0 !dbg !2534 {
entry:
    #dbg_value(ptr %out, !2537, !DIExpression(), !2538)
    #dbg_value(i32 %outlen, !2539, !DIExpression(), !2538)
    #dbg_value(ptr %state, !2540, !DIExpression(), !2538)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2541
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2541
  %conv = trunc i64 %0 to i32, !dbg !2541
  %call = call fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state, i32 noundef %conv, i32 noundef 168) #3, !dbg !2542
  %conv1 = zext i32 %call to i64, !dbg !2542
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2543
  store i64 %conv1, ptr %arrayidx2, align 8, !dbg !2544
  ret void, !dbg !2545
}

; Function Attrs: nounwind
define internal fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %s, i32 noundef %pos, i32 noundef range(i32 136, 169) %r) unnamed_addr #0 !dbg !2546 {
entry:
    #dbg_value(ptr %out, !2549, !DIExpression(), !2550)
    #dbg_value(i32 %outlen, !2551, !DIExpression(), !2550)
    #dbg_value(ptr %s, !2552, !DIExpression(), !2550)
    #dbg_value(i32 %pos, !2553, !DIExpression(), !2550)
    #dbg_value(i32 %r, !2554, !DIExpression(), !2550)
  br label %while.cond, !dbg !2555

while.cond:                                       ; preds = %for.end, %entry
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ %i.0.lcssa, %for.end ]
  %outlen.addr.0 = phi i32 [ %outlen, %entry ], [ %sub3, %for.end ]
  %out.addr.0 = phi ptr [ %out, %entry ], [ %out.addr.1.lcssa, %for.end ]
    #dbg_value(ptr %out.addr.0, !2549, !DIExpression(), !2550)
    #dbg_value(i32 %outlen.addr.0, !2551, !DIExpression(), !2550)
    #dbg_value(i32 %pos.addr.0, !2553, !DIExpression(), !2550)
  %tobool.not = icmp eq i32 %outlen.addr.0, 0, !dbg !2555
  br i1 %tobool.not, label %while.end, label %while.body, !dbg !2555

while.body:                                       ; preds = %while.cond
  %cmp = icmp eq i32 %pos.addr.0, %r, !dbg !2556
  br i1 %cmp, label %if.then, label %if.end, !dbg !2556

if.then:                                          ; preds = %while.body
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2559
    #dbg_value(i32 0, !2553, !DIExpression(), !2550)
  br label %if.end, !dbg !2561

if.end:                                           ; preds = %if.then, %while.body
  %pos.addr.1 = phi i32 [ 0, %if.then ], [ %pos.addr.0, %while.body ]
    #dbg_value(i32 %pos.addr.1, !2553, !DIExpression(), !2550)
    #dbg_value(i32 %pos.addr.1, !2562, !DIExpression(), !2550)
  br label %for.cond, !dbg !2563

for.cond:                                         ; preds = %for.body, %if.end
  %i.0 = phi i32 [ %pos.addr.1, %if.end ], [ %inc, %for.body ], !dbg !2565
  %out.addr.1 = phi ptr [ %out.addr.0, %if.end ], [ %incdec.ptr, %for.body ]
    #dbg_value(ptr %out.addr.1, !2549, !DIExpression(), !2550)
    #dbg_value(i32 %i.0, !2562, !DIExpression(), !2550)
  %cmp1 = icmp ult i32 %i.0, %r, !dbg !2566
  %add = add i32 %pos.addr.1, %outlen.addr.0, !dbg !2568
  %cmp2 = icmp ult i32 %i.0, %add, !dbg !2568
  %0 = and i1 %cmp1, %cmp2, !dbg !2568
  br i1 %0, label %for.body, label %for.end, !dbg !2569

for.body:                                         ; preds = %for.cond
  %div1 = lshr i32 %i.0, 3, !dbg !2570
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div1, !dbg !2571
  %1 = load i64, ptr %arrayidx, align 8, !dbg !2571
  %rem = shl nuw nsw i32 %i.0, 3, !dbg !2572
  %mul = and i32 %rem, 56, !dbg !2572
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2573
  %shr = lshr i64 %1, %sh_prom, !dbg !2573
  %conv = trunc i64 %shr to i8, !dbg !2571
    #dbg_value(ptr %out.addr.1, !2549, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2550)
  store i8 %conv, ptr %out.addr.1, align 1, !dbg !2574
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %out.addr.1, i32 1, !dbg !2575
    #dbg_value(ptr %incdec.ptr, !2549, !DIExpression(), !2550)
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2576
    #dbg_value(i32 %inc, !2562, !DIExpression(), !2550)
  br label %for.cond, !dbg !2577, !llvm.loop !2578

for.end:                                          ; preds = %for.cond
  %i.0.lcssa = phi i32 [ %i.0, %for.cond ], !dbg !2565
  %out.addr.1.lcssa = phi ptr [ %out.addr.1, %for.cond ]
  %sub.neg = sub i32 %pos.addr.1, %i.0.lcssa, !dbg !2580
  %sub3 = add i32 %sub.neg, %outlen.addr.0, !dbg !2581
    #dbg_value(i32 %sub3, !2551, !DIExpression(), !2550)
    #dbg_value(i32 %i.0.lcssa, !2553, !DIExpression(), !2550)
  br label %while.cond, !dbg !2555, !llvm.loop !2582

while.end:                                        ; preds = %while.cond
  %pos.addr.0.lcssa = phi i32 [ %pos.addr.0, %while.cond ]
  ret i32 %pos.addr.0.lcssa, !dbg !2584
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2585 {
entry:
    #dbg_value(ptr %state, !2586, !DIExpression(), !2587)
    #dbg_value(ptr %in, !2588, !DIExpression(), !2587)
    #dbg_value(i32 %inlen, !2589, !DIExpression(), !2587)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 168, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #3, !dbg !2590
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2591
  store i64 168, ptr %arrayidx, align 8, !dbg !2592
  ret void, !dbg !2593
}

; Function Attrs: nounwind
define internal fastcc void @keccak_absorb_once(ptr noundef %s, i32 noundef range(i32 72, 169) %r, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext range(i8 6, 32) %p) unnamed_addr #0 !dbg !2594 {
entry:
    #dbg_value(ptr %s, !2597, !DIExpression(), !2598)
    #dbg_value(i32 %r, !2599, !DIExpression(), !2598)
    #dbg_value(ptr %in, !2600, !DIExpression(), !2598)
    #dbg_value(i32 %inlen, !2601, !DIExpression(), !2598)
    #dbg_value(i8 %p, !2602, !DIExpression(), !2598)
    #dbg_value(i32 0, !2603, !DIExpression(), !2598)
  br label %for.cond, !dbg !2604

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2606
    #dbg_value(i32 %i.0, !2603, !DIExpression(), !2598)
  %exitcond = icmp ne i32 %i.0, 25, !dbg !2607
  br i1 %exitcond, label %for.body, label %while.cond.preheader, !dbg !2609

while.cond.preheader:                             ; preds = %for.cond
  %0 = lshr i32 %r, 3, !dbg !2610
  br label %while.cond, !dbg !2610

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !2611
  store i64 0, ptr %arrayidx, align 8, !dbg !2612
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2613
    #dbg_value(i32 %inc, !2603, !DIExpression(), !2598)
  br label %for.cond, !dbg !2614, !llvm.loop !2615

while.cond:                                       ; preds = %while.cond.preheader, %for.end8
  %in.addr.0 = phi ptr [ %add.ptr9, %for.end8 ], [ %in, %while.cond.preheader ]
  %inlen.addr.0 = phi i32 [ %sub, %for.end8 ], [ %inlen, %while.cond.preheader ]
    #dbg_value(i32 %inlen.addr.0, !2601, !DIExpression(), !2598)
    #dbg_value(ptr %in.addr.0, !2600, !DIExpression(), !2598)
  %cmp1.not = icmp ult i32 %inlen.addr.0, %r, !dbg !2617
  br i1 %cmp1.not, label %for.cond10.preheader, label %for.cond2.preheader, !dbg !2610

for.cond2.preheader:                              ; preds = %while.cond
  br label %for.cond2, !dbg !2618

for.cond10.preheader:                             ; preds = %while.cond
  %inlen.addr.0.lcssa6 = phi i32 [ %inlen.addr.0, %while.cond ]
  %in.addr.0.lcssa = phi ptr [ %in.addr.0, %while.cond ]
  br label %for.cond10, !dbg !2621

for.cond2:                                        ; preds = %for.cond2.preheader, %for.body4
  %i.1 = phi i32 [ %inc7, %for.body4 ], [ 0, %for.cond2.preheader ], !dbg !2623
    #dbg_value(i32 %i.1, !2603, !DIExpression(), !2598)
  %exitcond5 = icmp ne i32 %i.1, %0, !dbg !2624
  br i1 %exitcond5, label %for.body4, label %for.end8, !dbg !2618

for.body4:                                        ; preds = %for.cond2
  %mul = shl nuw nsw i32 %i.1, 3, !dbg !2626
  %add.ptr = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %mul, !dbg !2627
  %call = call fastcc i64 @load64(ptr noundef %add.ptr) #3, !dbg !2628
  %arrayidx5 = getelementptr inbounds nuw i64, ptr %s, i32 %i.1, !dbg !2629
  %1 = load i64, ptr %arrayidx5, align 8, !dbg !2630
  %xor = xor i64 %1, %call, !dbg !2630
  store i64 %xor, ptr %arrayidx5, align 8, !dbg !2630
  %inc7 = add nuw nsw i32 %i.1, 1, !dbg !2631
    #dbg_value(i32 %inc7, !2603, !DIExpression(), !2598)
  br label %for.cond2, !dbg !2632, !llvm.loop !2633

for.end8:                                         ; preds = %for.cond2
  %add.ptr9 = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %r, !dbg !2635
    #dbg_value(ptr %add.ptr9, !2600, !DIExpression(), !2598)
  %sub = sub i32 %inlen.addr.0, %r, !dbg !2636
    #dbg_value(i32 %sub, !2601, !DIExpression(), !2598)
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2637
  br label %while.cond, !dbg !2610, !llvm.loop !2638

for.cond10:                                       ; preds = %for.cond10.preheader, %for.body12
  %i.2 = phi i32 [ %inc19, %for.body12 ], [ 0, %for.cond10.preheader ], !dbg !2640
    #dbg_value(i32 %i.2, !2603, !DIExpression(), !2598)
  %exitcond7 = icmp ne i32 %i.2, %inlen.addr.0.lcssa6, !dbg !2641
  br i1 %exitcond7, label %for.body12, label %for.end20, !dbg !2621

for.body12:                                       ; preds = %for.cond10
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %in.addr.0.lcssa, i32 %i.2, !dbg !2643
  %2 = load i8, ptr %arrayidx13, align 1, !dbg !2643
  %conv = zext i8 %2 to i64, !dbg !2644
  %rem = shl i32 %i.2, 3, !dbg !2645
  %mul14 = and i32 %rem, 56, !dbg !2645
  %sh_prom = zext nneg i32 %mul14 to i64, !dbg !2646
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !2646
  %div153 = lshr i32 %i.2, 3, !dbg !2647
  %arrayidx16 = getelementptr inbounds nuw i64, ptr %s, i32 %div153, !dbg !2648
  %3 = load i64, ptr %arrayidx16, align 8, !dbg !2649
  %xor17 = xor i64 %3, %shl, !dbg !2649
  store i64 %xor17, ptr %arrayidx16, align 8, !dbg !2649
  %inc19 = add i32 %i.2, 1, !dbg !2650
    #dbg_value(i32 %inc19, !2603, !DIExpression(), !2598)
  br label %for.cond10, !dbg !2651, !llvm.loop !2652

for.end20:                                        ; preds = %for.cond10
  %i.2.lcssa = phi i32 [ %i.2, %for.cond10 ], !dbg !2640
  %conv21 = zext nneg i8 %p to i64, !dbg !2654
  %rem22 = shl i32 %i.2.lcssa, 3, !dbg !2655
  %mul23 = and i32 %rem22, 56, !dbg !2655
  %sh_prom24 = zext nneg i32 %mul23 to i64, !dbg !2656
  %shl25 = shl nuw nsw i64 %conv21, %sh_prom24, !dbg !2656
  %div261 = lshr i32 %i.2.lcssa, 3, !dbg !2657
  %arrayidx27 = getelementptr inbounds nuw i64, ptr %s, i32 %div261, !dbg !2658
  %4 = load i64, ptr %arrayidx27, align 8, !dbg !2659
  %xor28 = xor i64 %4, %shl25, !dbg !2659
  store i64 %xor28, ptr %arrayidx27, align 8, !dbg !2659
  %sub29 = add nsw i32 %r, -1, !dbg !2660
  %div302 = lshr i32 %sub29, 3, !dbg !2661
  %arrayidx31 = getelementptr inbounds nuw i64, ptr %s, i32 %div302, !dbg !2662
  %5 = load i64, ptr %arrayidx31, align 8, !dbg !2663
  %xor32 = xor i64 %5, -9223372036854775808, !dbg !2663
  store i64 %xor32, ptr %arrayidx31, align 8, !dbg !2663
  ret void, !dbg !2664
}

; Function Attrs: nounwind
define internal fastcc i64 @load64(ptr noundef %x) unnamed_addr #0 !dbg !2665 {
entry:
    #dbg_value(ptr %x, !2668, !DIExpression(), !2669)
    #dbg_value(i64 0, !2670, !DIExpression(), !2669)
    #dbg_value(i32 0, !2671, !DIExpression(), !2669)
  br label %for.cond, !dbg !2672

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !2674
  %r.0 = phi i64 [ 0, %entry ], [ %or, %for.inc ], !dbg !2669
    #dbg_value(i64 %r.0, !2670, !DIExpression(), !2669)
    #dbg_value(i32 %i.0, !2671, !DIExpression(), !2669)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !2675
  br i1 %exitcond, label %for.inc, label %for.end, !dbg !2677

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i64 poison, i8 poison, i32 poison), !2670, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2669)
  %arrayidx = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2678
  %0 = load i8, ptr %arrayidx, align 1, !dbg !2678
    #dbg_value(!DIArgList(i64 %r.0, i8 %0, i32 %i.0), !2670, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2669)
  %conv = zext i8 %0 to i64, !dbg !2679
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i32 %i.0), !2670, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2669)
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2680
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i32 %mul), !2670, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2669)
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2681
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i64 %sh_prom), !2670, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2669)
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !2681
    #dbg_value(!DIArgList(i64 %r.0, i64 %shl), !2670, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value), !2669)
  %or = or i64 %r.0, %shl, !dbg !2682
    #dbg_value(i64 %or, !2670, !DIExpression(), !2669)
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2683
    #dbg_value(i32 %inc, !2671, !DIExpression(), !2669)
  br label %for.cond, !dbg !2684, !llvm.loop !2685

for.end:                                          ; preds = %for.cond
  %r.0.lcssa = phi i64 [ %r.0, %for.cond ], !dbg !2669
  ret i64 %r.0.lcssa, !dbg !2687
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #0 !dbg !2688 {
entry:
    #dbg_value(ptr %out, !2689, !DIExpression(), !2690)
    #dbg_value(i32 %nblocks, !2691, !DIExpression(), !2690)
    #dbg_value(ptr %state, !2692, !DIExpression(), !2690)
  call fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state, i32 noundef 168) #3, !dbg !2693
  ret void, !dbg !2694
}

; Function Attrs: nounwind
define internal fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %s, i32 noundef range(i32 136, 169) %r) unnamed_addr #0 !dbg !2695 {
entry:
    #dbg_value(ptr %out, !2698, !DIExpression(), !2699)
    #dbg_value(i32 %nblocks, !2700, !DIExpression(), !2699)
    #dbg_value(ptr %s, !2701, !DIExpression(), !2699)
    #dbg_value(i32 %r, !2702, !DIExpression(), !2699)
  %0 = lshr i32 %r, 3, !dbg !2703
  br label %while.cond, !dbg !2703

while.cond:                                       ; preds = %for.end, %entry
  %nblocks.addr.0 = phi i32 [ %nblocks, %entry ], [ %sub, %for.end ]
  %out.addr.0 = phi ptr [ %out, %entry ], [ %add.ptr1, %for.end ]
    #dbg_value(ptr %out.addr.0, !2698, !DIExpression(), !2699)
    #dbg_value(i32 %nblocks.addr.0, !2700, !DIExpression(), !2699)
  %tobool.not = icmp eq i32 %nblocks.addr.0, 0, !dbg !2703
  br i1 %tobool.not, label %while.end, label %while.body, !dbg !2703

while.body:                                       ; preds = %while.cond
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2704
    #dbg_value(i32 0, !2706, !DIExpression(), !2699)
  br label %for.cond, !dbg !2707

for.cond:                                         ; preds = %for.body, %while.body
  %i.0 = phi i32 [ 0, %while.body ], [ %inc, %for.body ], !dbg !2709
    #dbg_value(i32 %i.0, !2706, !DIExpression(), !2699)
  %exitcond = icmp ne i32 %i.0, %0, !dbg !2710
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2712

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2713
  %add.ptr = getelementptr inbounds nuw i8, ptr %out.addr.0, i32 %mul, !dbg !2714
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !2715
  %1 = load i64, ptr %arrayidx, align 8, !dbg !2715
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %1) #3, !dbg !2716
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2717
    #dbg_value(i32 %inc, !2706, !DIExpression(), !2699)
  br label %for.cond, !dbg !2718, !llvm.loop !2719

for.end:                                          ; preds = %for.cond
  %add.ptr1 = getelementptr inbounds nuw i8, ptr %out.addr.0, i32 %r, !dbg !2721
    #dbg_value(ptr %add.ptr1, !2698, !DIExpression(), !2699)
  %sub = add i32 %nblocks.addr.0, -1, !dbg !2722
    #dbg_value(i32 %sub, !2700, !DIExpression(), !2699)
  br label %while.cond, !dbg !2703, !llvm.loop !2723

while.end:                                        ; preds = %while.cond
  ret void, !dbg !2725
}

; Function Attrs: nounwind
define internal fastcc void @store64(ptr noundef %x, i64 noundef %u) unnamed_addr #0 !dbg !2726 {
entry:
    #dbg_value(ptr %x, !2729, !DIExpression(), !2730)
    #dbg_value(i64 %u, !2731, !DIExpression(), !2730)
    #dbg_value(i32 0, !2732, !DIExpression(), !2730)
  br label %for.cond, !dbg !2733

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2735
    #dbg_value(i32 %i.0, !2732, !DIExpression(), !2730)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !2736
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2738

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2739
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2740
  %shr = lshr i64 %u, %sh_prom, !dbg !2740
  %conv = trunc i64 %shr to i8, !dbg !2741
  %arrayidx = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2742
  store i8 %conv, ptr %arrayidx, align 1, !dbg !2743
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2744
    #dbg_value(i32 %inc, !2732, !DIExpression(), !2730)
  br label %for.cond, !dbg !2745, !llvm.loop !2746

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2748
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef %state) local_unnamed_addr #0 !dbg !2749 {
entry:
    #dbg_value(ptr %state, !2750, !DIExpression(), !2751)
  call fastcc void @keccak_init(ptr noundef %state) #3, !dbg !2752
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2753
  store i64 0, ptr %arrayidx, align 8, !dbg !2754
  ret void, !dbg !2755
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2756 {
entry:
    #dbg_value(ptr %state, !2757, !DIExpression(), !2758)
    #dbg_value(ptr %in, !2759, !DIExpression(), !2758)
    #dbg_value(i32 %inlen, !2760, !DIExpression(), !2758)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2761
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2761
  %conv = trunc i64 %0 to i32, !dbg !2761
  %call = call fastcc i32 @keccak_absorb(ptr noundef %state, i32 noundef %conv, i32 noundef 136, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2762
  %conv1 = zext i32 %call to i64, !dbg !2762
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2763
  store i64 %conv1, ptr %arrayidx2, align 8, !dbg !2764
  ret void, !dbg !2765
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef %state) local_unnamed_addr #0 !dbg !2766 {
entry:
    #dbg_value(ptr %state, !2767, !DIExpression(), !2768)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2769
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2769
  %conv = trunc i64 %0 to i32, !dbg !2769
  call fastcc void @keccak_finalize(ptr noundef %state, i32 noundef %conv, i32 noundef 136, i8 noundef zeroext 31) #3, !dbg !2770
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2771
  store i64 136, ptr %arrayidx1, align 8, !dbg !2772
  ret void, !dbg !2773
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) local_unnamed_addr #0 !dbg !2774 {
entry:
    #dbg_value(ptr %out, !2775, !DIExpression(), !2776)
    #dbg_value(i32 %outlen, !2777, !DIExpression(), !2776)
    #dbg_value(ptr %state, !2778, !DIExpression(), !2776)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2779
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2779
  %conv = trunc i64 %0 to i32, !dbg !2779
  %call = call fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state, i32 noundef %conv, i32 noundef 136) #3, !dbg !2780
  %conv1 = zext i32 %call to i64, !dbg !2780
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2781
  store i64 %conv1, ptr %arrayidx2, align 8, !dbg !2782
  ret void, !dbg !2783
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2784 {
entry:
    #dbg_value(ptr %state, !2785, !DIExpression(), !2786)
    #dbg_value(ptr %in, !2787, !DIExpression(), !2786)
    #dbg_value(i32 %inlen, !2788, !DIExpression(), !2786)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #3, !dbg !2789
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2790
  store i64 136, ptr %arrayidx, align 8, !dbg !2791
  ret void, !dbg !2792
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #0 !dbg !2793 {
entry:
    #dbg_value(ptr %out, !2794, !DIExpression(), !2795)
    #dbg_value(i32 %nblocks, !2796, !DIExpression(), !2795)
    #dbg_value(ptr %state, !2797, !DIExpression(), !2795)
  call fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state, i32 noundef 136) #3, !dbg !2798
  ret void, !dbg !2799
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2800 {
entry:
  %state = alloca [26 x i64], align 8
    #dbg_value(ptr %out, !2803, !DIExpression(), !2804)
    #dbg_value(i32 %outlen, !2805, !DIExpression(), !2804)
    #dbg_value(ptr %in, !2806, !DIExpression(), !2804)
    #dbg_value(i32 %inlen, !2807, !DIExpression(), !2804)
    #dbg_declare(ptr %state, !2808, !DIExpression(), !2809)
  call void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef nonnull %state, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2810
  %div = udiv i32 %outlen, 168, !dbg !2811
    #dbg_value(i32 %div, !2812, !DIExpression(), !2804)
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %div, ptr noundef nonnull %state) #3, !dbg !2813
  %mul.neg = mul i32 %div, -168, !dbg !2814
  %sub = add i32 %mul.neg, %outlen, !dbg !2815
    #dbg_value(i32 %sub, !2805, !DIExpression(), !2804)
  %mul1 = mul nuw i32 %div, 168, !dbg !2816
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !2817
    #dbg_value(ptr %add.ptr, !2803, !DIExpression(), !2804)
  call void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef nonnull %state) #3, !dbg !2818
  ret void, !dbg !2819
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2820 {
entry:
  %state = alloca [26 x i64], align 8
    #dbg_value(ptr %out, !2821, !DIExpression(), !2822)
    #dbg_value(i32 %outlen, !2823, !DIExpression(), !2822)
    #dbg_value(ptr %in, !2824, !DIExpression(), !2822)
    #dbg_value(i32 %inlen, !2825, !DIExpression(), !2822)
    #dbg_declare(ptr %state, !2826, !DIExpression(), !2827)
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef nonnull %state, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2828
  %div = udiv i32 %outlen, 136, !dbg !2829
    #dbg_value(i32 %div, !2830, !DIExpression(), !2822)
  call void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %div, ptr noundef nonnull %state) #3, !dbg !2831
  %mul.neg = mul i32 %div, -136, !dbg !2832
  %sub = add i32 %mul.neg, %outlen, !dbg !2833
    #dbg_value(i32 %sub, !2823, !DIExpression(), !2822)
  %mul1 = mul nuw i32 %div, 136, !dbg !2834
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !2835
    #dbg_value(ptr %add.ptr, !2821, !DIExpression(), !2822)
  call void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef nonnull %state) #3, !dbg !2836
  ret void, !dbg !2837
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2838 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !2841, !DIExpression(), !2842)
    #dbg_value(ptr %in, !2843, !DIExpression(), !2842)
    #dbg_value(i32 %inlen, !2844, !DIExpression(), !2842)
    #dbg_declare(ptr %s, !2845, !DIExpression(), !2849)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %s, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #3, !dbg !2850
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #3, !dbg !2851
    #dbg_value(i32 0, !2852, !DIExpression(), !2842)
  br label %for.cond, !dbg !2853

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2855
    #dbg_value(i32 %i.0, !2852, !DIExpression(), !2842)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !2856
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2858

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2859
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !2860
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !2861
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2861
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %0) #3, !dbg !2862
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2863
    #dbg_value(i32 %inc, !2852, !DIExpression(), !2842)
  br label %for.cond, !dbg !2864, !llvm.loop !2865

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2867
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2868 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !2869, !DIExpression(), !2870)
    #dbg_value(ptr %in, !2871, !DIExpression(), !2870)
    #dbg_value(i32 %inlen, !2872, !DIExpression(), !2870)
    #dbg_declare(ptr %s, !2873, !DIExpression(), !2874)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %s, i32 noundef 72, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #3, !dbg !2875
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #3, !dbg !2876
    #dbg_value(i32 0, !2877, !DIExpression(), !2870)
  br label %for.cond, !dbg !2878

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2880
    #dbg_value(i32 %i.0, !2877, !DIExpression(), !2870)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !2881
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2883

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2884
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !2885
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !2886
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2886
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %0) #3, !dbg !2887
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2888
    #dbg_value(i32 %inc, !2877, !DIExpression(), !2870)
  br label %for.cond, !dbg !2889, !llvm.loop !2890

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2892
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_kyber_shake128_absorb(ptr noundef %state, ptr noundef %seed, i8 noundef zeroext %x, i8 noundef zeroext %y) local_unnamed_addr #0 !dbg !2893 {
entry:
  %extseed = alloca [34 x i8], align 1
    #dbg_value(ptr %state, !2897, !DIExpression(), !2898)
    #dbg_value(ptr %seed, !2899, !DIExpression(), !2898)
    #dbg_value(i8 %x, !2900, !DIExpression(), !2898)
    #dbg_value(i8 %y, !2901, !DIExpression(), !2898)
    #dbg_declare(ptr %extseed, !2902, !DIExpression(), !2906)
  %call = call ptr @memcpy(ptr noundef nonnull %extseed, ptr noundef %seed, i32 noundef 32) #4, !dbg !2907
  %arrayidx = getelementptr inbounds nuw i8, ptr %extseed, i32 32, !dbg !2908
  store i8 %x, ptr %arrayidx, align 1, !dbg !2909
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %extseed, i32 33, !dbg !2910
  store i8 %y, ptr %arrayidx1, align 1, !dbg !2911
  call void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef nonnull %extseed, i32 noundef 34) #3, !dbg !2912
  ret void, !dbg !2913
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_kyber_shake256_prf(ptr noundef %out, i32 noundef %outlen, ptr noundef %key, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !2914 {
entry:
  %extkey = alloca [33 x i8], align 1
    #dbg_value(ptr %out, !2917, !DIExpression(), !2918)
    #dbg_value(i32 %outlen, !2919, !DIExpression(), !2918)
    #dbg_value(ptr %key, !2920, !DIExpression(), !2918)
    #dbg_value(i8 %nonce, !2921, !DIExpression(), !2918)
    #dbg_declare(ptr %extkey, !2922, !DIExpression(), !2926)
  %call = call ptr @memcpy(ptr noundef nonnull %extkey, ptr noundef %key, i32 noundef 32) #4, !dbg !2927
  %arrayidx = getelementptr inbounds nuw i8, ptr %extkey, i32 32, !dbg !2928
  store i8 %nonce, ptr %arrayidx, align 1, !dbg !2929
  call void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef nonnull %extkey, i32 noundef 33) #3, !dbg !2930
  ret void, !dbg !2931
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_kyber_shake256_rkprf(ptr noundef %out, ptr noundef %key, ptr noundef %input) local_unnamed_addr #0 !dbg !2932 {
entry:
  %s = alloca [26 x i64], align 8
    #dbg_value(ptr %out, !2933, !DIExpression(), !2934)
    #dbg_value(ptr %key, !2935, !DIExpression(), !2934)
    #dbg_value(ptr %input, !2936, !DIExpression(), !2934)
    #dbg_declare(ptr %s, !2937, !DIExpression(), !2938)
  call void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef nonnull %s) #3, !dbg !2939
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef nonnull %s, ptr noundef %key, i32 noundef 32) #3, !dbg !2940
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef nonnull %s, ptr noundef %input, i32 noundef 1568) #3, !dbg !2941
  call void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef nonnull %s) #3, !dbg !2942
  call void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef 32, ptr noundef nonnull %s) #3, !dbg !2943
  ret void, !dbg !2944
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
!52 = distinct !DIGlobalVariable(name: "pqcrystals_kyber1024_ref_zetas", scope: !53, file: !58, line: 39, type: !59, isLocal: false, isDefinition: true)
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
!138 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 12544, elements: !139)
!139 = !{!140}
!140 = !DISubrange(count: 1568)
!141 = !DILocation(line: 11, column: 11, scope: !136)
!142 = !DILocalVariable(name: "sk", scope: !136, file: !2, line: 12, type: !143)
!143 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 25344, elements: !144)
!144 = !{!145}
!145 = !DISubrange(count: 3168)
!146 = !DILocation(line: 12, column: 11, scope: !136)
!147 = !DILocalVariable(name: "ct", scope: !136, file: !2, line: 13, type: !138)
!148 = !DILocation(line: 13, column: 11, scope: !136)
!149 = !DILocalVariable(name: "key_a", scope: !136, file: !2, line: 14, type: !150)
!150 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 256, elements: !151)
!151 = !{!152}
!152 = !DISubrange(count: 32)
!153 = !DILocation(line: 14, column: 11, scope: !136)
!154 = !DILocalVariable(name: "key_b", scope: !136, file: !2, line: 15, type: !150)
!155 = !DILocation(line: 15, column: 11, scope: !136)
!156 = !DILocation(line: 18, column: 3, scope: !136)
!157 = !DILocation(line: 21, column: 3, scope: !136)
!158 = !DILocation(line: 24, column: 3, scope: !136)
!159 = !DILocation(line: 26, column: 6, scope: !160)
!160 = distinct !DILexicalBlock(scope: !136, file: !2, line: 26, column: 6)
!161 = !DILocation(line: 27, column: 5, scope: !162)
!162 = distinct !DILexicalBlock(scope: !160, file: !2, line: 26, column: 42)
!163 = !DILocation(line: 28, column: 5, scope: !162)
!164 = !DILocation(line: 0, scope: !136)
!165 = !DILocation(line: 32, column: 1, scope: !136)
!166 = distinct !DISubprogram(name: "test_invalid_sk_a", scope: !2, file: !2, line: 34, type: !107, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !49)
!167 = !DILocalVariable(name: "pk", scope: !166, file: !2, line: 36, type: !138)
!168 = !DILocation(line: 36, column: 11, scope: !166)
!169 = !DILocalVariable(name: "sk", scope: !166, file: !2, line: 37, type: !143)
!170 = !DILocation(line: 37, column: 11, scope: !166)
!171 = !DILocalVariable(name: "ct", scope: !166, file: !2, line: 38, type: !138)
!172 = !DILocation(line: 38, column: 11, scope: !166)
!173 = !DILocalVariable(name: "key_a", scope: !166, file: !2, line: 39, type: !150)
!174 = !DILocation(line: 39, column: 11, scope: !166)
!175 = !DILocalVariable(name: "key_b", scope: !166, file: !2, line: 40, type: !150)
!176 = !DILocation(line: 40, column: 11, scope: !166)
!177 = !DILocation(line: 43, column: 3, scope: !166)
!178 = !DILocation(line: 46, column: 3, scope: !166)
!179 = !DILocation(line: 49, column: 3, scope: !166)
!180 = !DILocation(line: 52, column: 3, scope: !166)
!181 = !DILocation(line: 54, column: 7, scope: !182)
!182 = distinct !DILexicalBlock(scope: !166, file: !2, line: 54, column: 6)
!183 = !DILocation(line: 54, column: 6, scope: !182)
!184 = !DILocation(line: 55, column: 5, scope: !185)
!185 = distinct !DILexicalBlock(scope: !182, file: !2, line: 54, column: 43)
!186 = !DILocation(line: 56, column: 5, scope: !185)
!187 = !DILocation(line: 0, scope: !166)
!188 = !DILocation(line: 60, column: 1, scope: !166)
!189 = distinct !DISubprogram(name: "test_invalid_ciphertext", scope: !2, file: !2, line: 62, type: !107, scopeLine: 63, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !49)
!190 = !DILocalVariable(name: "pk", scope: !189, file: !2, line: 64, type: !138)
!191 = !DILocation(line: 64, column: 11, scope: !189)
!192 = !DILocalVariable(name: "sk", scope: !189, file: !2, line: 65, type: !143)
!193 = !DILocation(line: 65, column: 11, scope: !189)
!194 = !DILocalVariable(name: "ct", scope: !189, file: !2, line: 66, type: !138)
!195 = !DILocation(line: 66, column: 11, scope: !189)
!196 = !DILocalVariable(name: "key_a", scope: !189, file: !2, line: 67, type: !150)
!197 = !DILocation(line: 67, column: 11, scope: !189)
!198 = !DILocalVariable(name: "key_b", scope: !189, file: !2, line: 68, type: !150)
!199 = !DILocation(line: 68, column: 11, scope: !189)
!200 = !DILocation(line: 72, column: 3, scope: !189)
!201 = !DILocalVariable(name: "b", scope: !189, file: !2, line: 69, type: !33)
!202 = !DILocation(line: 0, scope: !189)
!203 = !DILocation(line: 73, column: 5, scope: !204)
!204 = distinct !DILexicalBlock(scope: !189, file: !2, line: 72, column: 6)
!205 = !DILocation(line: 74, column: 12, scope: !189)
!206 = !DILocation(line: 74, column: 11, scope: !189)
!207 = !DILocation(line: 74, column: 3, scope: !204)
!208 = distinct !{!208, !200, !209, !130}
!209 = !DILocation(line: 74, column: 13, scope: !189)
!210 = !DILocalVariable(name: "pos", scope: !189, file: !2, line: 70, type: !38)
!211 = !DILocation(line: 75, column: 3, scope: !189)
!212 = !DILocation(line: 78, column: 3, scope: !189)
!213 = !DILocation(line: 81, column: 3, scope: !189)
!214 = !DILocation(line: 84, column: 39, scope: !189)
!215 = !DILocation(line: 84, column: 6, scope: !189)
!216 = !DILocation(line: 84, column: 10, scope: !189)
!217 = !DILocation(line: 84, column: 3, scope: !189)
!218 = !DILocation(line: 84, column: 36, scope: !189)
!219 = !DILocation(line: 87, column: 3, scope: !189)
!220 = !DILocation(line: 89, column: 7, scope: !221)
!221 = distinct !DILexicalBlock(scope: !189, file: !2, line: 89, column: 6)
!222 = !DILocation(line: 89, column: 6, scope: !221)
!223 = !DILocation(line: 90, column: 5, scope: !224)
!224 = distinct !DILexicalBlock(scope: !221, file: !2, line: 89, column: 43)
!225 = !DILocation(line: 91, column: 5, scope: !224)
!226 = !DILocation(line: 95, column: 1, scope: !189)
!227 = !DILocalVariable(name: "out", arg: 1, scope: !28, file: !29, line: 74, type: !32)
!228 = !DILocation(line: 0, scope: !28)
!229 = !DILocalVariable(name: "outlen", arg: 2, scope: !28, file: !29, line: 74, type: !38)
!230 = !DILocation(line: 78, column: 3, scope: !28)
!231 = !DILocation(line: 78, column: 9, scope: !28)
!232 = !DILocation(line: 78, column: 12, scope: !28)
!233 = !DILocation(line: 86, column: 3, scope: !28)
!234 = !DILocation(line: 79, column: 10, scope: !235)
!235 = distinct !DILexicalBlock(scope: !28, file: !29, line: 78, column: 19)
!236 = !DILocation(line: 79, column: 8, scope: !235)
!237 = !DILocation(line: 80, column: 11, scope: !238)
!238 = distinct !DILexicalBlock(scope: !235, file: !29, line: 80, column: 8)
!239 = !DILocation(line: 80, column: 17, scope: !238)
!240 = !DILocation(line: 80, column: 20, scope: !238)
!241 = !DILocation(line: 80, column: 26, scope: !238)
!242 = !DILocation(line: 82, column: 13, scope: !243)
!243 = distinct !DILexicalBlock(scope: !238, file: !29, line: 82, column: 13)
!244 = !DILocation(line: 82, column: 16, scope: !243)
!245 = !DILocation(line: 83, column: 7, scope: !243)
!246 = distinct !{!246, !230, !247, !130}
!247 = !DILocation(line: 84, column: 3, scope: !28)
!248 = !DILocation(line: 86, column: 16, scope: !28)
!249 = !DILocation(line: 87, column: 16, scope: !250)
!250 = distinct !DILexicalBlock(scope: !28, file: !29, line: 86, column: 21)
!251 = !DILocation(line: 87, column: 11, scope: !250)
!252 = !DILocalVariable(name: "ret", scope: !28, file: !29, line: 76, type: !253)
!253 = !DIDerivedType(tag: DW_TAG_typedef, name: "ssize_t", file: !254, line: 182, baseType: !255)
!254 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/sys/types.h", directory: "")
!255 = !DIDerivedType(tag: DW_TAG_typedef, name: "_ssize_t", file: !256, line: 147, baseType: !50)
!256 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/sys/_types.h", directory: "")
!257 = !DILocation(line: 88, column: 18, scope: !258)
!258 = distinct !DILexicalBlock(scope: !250, file: !29, line: 88, column: 8)
!259 = !DILocation(line: 88, column: 21, scope: !258)
!260 = !DILocation(line: 88, column: 27, scope: !258)
!261 = distinct !{!261, !233, !262, !130}
!262 = !DILocation(line: 95, column: 3, scope: !28)
!263 = !DILocation(line: 91, column: 7, scope: !264)
!264 = distinct !DILexicalBlock(scope: !258, file: !29, line: 90, column: 13)
!265 = !DILocation(line: 93, column: 9, scope: !250)
!266 = !DILocation(line: 94, column: 12, scope: !250)
!267 = !DILocation(line: 96, column: 1, scope: !28)
!268 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_keypair_derand", scope: !269, file: !269, line: 25, type: !270, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !83, retainedNodes: !49)
!269 = !DIFile(filename: "../../../ref/kem.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!270 = !DISubroutineType(types: !271)
!271 = !{!50, !32, !32, !272}
!272 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !273, size: 32)
!273 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !33)
!274 = !DILocalVariable(name: "pk", arg: 1, scope: !268, file: !269, line: 25, type: !32)
!275 = !DILocation(line: 0, scope: !268)
!276 = !DILocalVariable(name: "sk", arg: 2, scope: !268, file: !269, line: 26, type: !32)
!277 = !DILocalVariable(name: "coins", arg: 3, scope: !268, file: !269, line: 27, type: !272)
!278 = !DILocation(line: 29, column: 3, scope: !268)
!279 = !DILocation(line: 30, column: 12, scope: !268)
!280 = !DILocation(line: 30, column: 3, scope: !268)
!281 = !DILocation(line: 31, column: 3, scope: !268)
!282 = !DILocation(line: 33, column: 33, scope: !268)
!283 = !DILocation(line: 33, column: 55, scope: !268)
!284 = !DILocation(line: 33, column: 3, scope: !268)
!285 = !DILocation(line: 34, column: 3, scope: !268)
!286 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_keypair", scope: !269, file: !269, line: 50, type: !287, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !83, retainedNodes: !49)
!287 = !DISubroutineType(types: !288)
!288 = !{!50, !32, !32}
!289 = !DILocalVariable(name: "pk", arg: 1, scope: !286, file: !269, line: 50, type: !32)
!290 = !DILocation(line: 0, scope: !286)
!291 = !DILocalVariable(name: "sk", arg: 2, scope: !286, file: !269, line: 51, type: !32)
!292 = !DILocalVariable(name: "coins", scope: !286, file: !269, line: 53, type: !293)
!293 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 512, elements: !294)
!294 = !{!295}
!295 = !DISubrange(count: 64)
!296 = !DILocation(line: 53, column: 11, scope: !286)
!297 = !DILocation(line: 54, column: 3, scope: !286)
!298 = !DILocation(line: 55, column: 3, scope: !286)
!299 = !DILocation(line: 56, column: 3, scope: !286)
!300 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_enc_derand", scope: !269, file: !269, line: 76, type: !301, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !83, retainedNodes: !49)
!301 = !DISubroutineType(types: !302)
!302 = !{!50, !32, !32, !272, !272}
!303 = !DILocalVariable(name: "ct", arg: 1, scope: !300, file: !269, line: 76, type: !32)
!304 = !DILocation(line: 0, scope: !300)
!305 = !DILocalVariable(name: "ss", arg: 2, scope: !300, file: !269, line: 77, type: !32)
!306 = !DILocalVariable(name: "pk", arg: 3, scope: !300, file: !269, line: 78, type: !272)
!307 = !DILocalVariable(name: "coins", arg: 4, scope: !300, file: !269, line: 79, type: !272)
!308 = !DILocalVariable(name: "buf", scope: !300, file: !269, line: 81, type: !293)
!309 = !DILocation(line: 81, column: 11, scope: !300)
!310 = !DILocalVariable(name: "kr", scope: !300, file: !269, line: 83, type: !293)
!311 = !DILocation(line: 83, column: 11, scope: !300)
!312 = !DILocation(line: 85, column: 3, scope: !300)
!313 = !DILocation(line: 88, column: 3, scope: !300)
!314 = !DILocation(line: 89, column: 3, scope: !300)
!315 = !DILocation(line: 92, column: 29, scope: !300)
!316 = !DILocation(line: 92, column: 3, scope: !300)
!317 = !DILocation(line: 94, column: 3, scope: !300)
!318 = !DILocation(line: 95, column: 3, scope: !300)
!319 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_enc", scope: !269, file: !269, line: 113, type: !270, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !83, retainedNodes: !49)
!320 = !DILocalVariable(name: "ct", arg: 1, scope: !319, file: !269, line: 113, type: !32)
!321 = !DILocation(line: 0, scope: !319)
!322 = !DILocalVariable(name: "ss", arg: 2, scope: !319, file: !269, line: 114, type: !32)
!323 = !DILocalVariable(name: "pk", arg: 3, scope: !319, file: !269, line: 115, type: !272)
!324 = !DILocalVariable(name: "coins", scope: !319, file: !269, line: 117, type: !150)
!325 = !DILocation(line: 117, column: 11, scope: !319)
!326 = !DILocation(line: 118, column: 3, scope: !319)
!327 = !DILocation(line: 119, column: 3, scope: !319)
!328 = !DILocation(line: 120, column: 3, scope: !319)
!329 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_dec", scope: !269, file: !269, line: 140, type: !330, scopeLine: 143, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !83, retainedNodes: !49)
!330 = !DISubroutineType(types: !331)
!331 = !{!50, !32, !272, !272}
!332 = !DILocalVariable(name: "ss", arg: 1, scope: !329, file: !269, line: 140, type: !32)
!333 = !DILocation(line: 0, scope: !329)
!334 = !DILocalVariable(name: "ct", arg: 2, scope: !329, file: !269, line: 141, type: !272)
!335 = !DILocalVariable(name: "sk", arg: 3, scope: !329, file: !269, line: 142, type: !272)
!336 = !DILocalVariable(name: "buf", scope: !329, file: !269, line: 145, type: !293)
!337 = !DILocation(line: 145, column: 11, scope: !329)
!338 = !DILocalVariable(name: "kr", scope: !329, file: !269, line: 147, type: !293)
!339 = !DILocation(line: 147, column: 11, scope: !329)
!340 = !DILocalVariable(name: "cmp", scope: !329, file: !269, line: 149, type: !138)
!341 = !DILocation(line: 149, column: 11, scope: !329)
!342 = !DILocation(line: 150, column: 25, scope: !329)
!343 = !DILocalVariable(name: "pk", scope: !329, file: !269, line: 150, type: !272)
!344 = !DILocation(line: 152, column: 3, scope: !329)
!345 = !DILocation(line: 155, column: 13, scope: !329)
!346 = !DILocation(line: 155, column: 53, scope: !329)
!347 = !DILocation(line: 155, column: 3, scope: !329)
!348 = !DILocation(line: 156, column: 3, scope: !329)
!349 = !DILocation(line: 159, column: 30, scope: !329)
!350 = !DILocation(line: 159, column: 3, scope: !329)
!351 = !DILocation(line: 161, column: 10, scope: !329)
!352 = !DILocalVariable(name: "fail", scope: !329, file: !269, line: 144, type: !50)
!353 = !DILocation(line: 164, column: 3, scope: !329)
!354 = !DILocation(line: 167, column: 29, scope: !329)
!355 = !DILocation(line: 167, column: 3, scope: !329)
!356 = !DILocation(line: 169, column: 3, scope: !329)
!357 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_gen_matrix", scope: !358, file: !358, line: 165, type: !359, scopeLine: 166, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !49)
!358 = !DIFile(filename: "../../../ref/indcpa.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!359 = !DISubroutineType(types: !360)
!360 = !{null, !361, !272, !50}
!361 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !362, size: 32)
!362 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyvec", file: !363, line: 8, baseType: !364)
!363 = !DIFile(filename: "../../../ref/polyvec.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!364 = !DICompositeType(tag: DW_TAG_array_type, baseType: !365, size: 16384, elements: !370)
!365 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !366, line: 11, baseType: !367)
!366 = !DIFile(filename: "../../../ref/poly.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!367 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 4096, elements: !368)
!368 = !{!369}
!369 = !DISubrange(count: 256)
!370 = !{!371}
!371 = !DISubrange(count: 4)
!372 = !DILocalVariable(name: "a", arg: 1, scope: !357, file: !358, line: 165, type: !361)
!373 = !DILocation(line: 0, scope: !357)
!374 = !DILocalVariable(name: "seed", arg: 2, scope: !357, file: !358, line: 165, type: !272)
!375 = !DILocalVariable(name: "transposed", arg: 3, scope: !357, file: !358, line: 166, type: !50)
!376 = !DILocalVariable(name: "buf", scope: !357, file: !358, line: 169, type: !377)
!377 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 4032, elements: !378)
!378 = !{!379}
!379 = !DISubrange(count: 504)
!380 = !DILocation(line: 169, column: 11, scope: !357)
!381 = !DILocalVariable(name: "state", scope: !357, file: !358, line: 170, type: !382)
!382 = !DIDerivedType(tag: DW_TAG_typedef, name: "xof_state", file: !383, line: 10, baseType: !384)
!383 = !DIFile(filename: "../../../ref/symmetric.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!384 = !DIDerivedType(tag: DW_TAG_typedef, name: "keccak_state", file: !385, line: 14, baseType: !386)
!385 = !DIFile(filename: "../../../ref/fips202.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!386 = !DICompositeType(tag: DW_TAG_array_type, baseType: !70, size: 1664, elements: !24)
!387 = !DILocation(line: 170, column: 13, scope: !357)
!388 = !DILocalVariable(name: "i", scope: !357, file: !358, line: 167, type: !40)
!389 = !DILocation(line: 172, column: 8, scope: !390)
!390 = distinct !DILexicalBlock(scope: !357, file: !358, line: 172, column: 3)
!391 = !DILocation(line: 172, scope: !390)
!392 = !DILocation(line: 172, column: 17, scope: !393)
!393 = distinct !DILexicalBlock(scope: !390, file: !358, line: 172, column: 3)
!394 = !DILocation(line: 172, column: 3, scope: !390)
!395 = !DILocation(line: 173, column: 5, scope: !396)
!396 = distinct !DILexicalBlock(scope: !397, file: !358, line: 173, column: 5)
!397 = distinct !DILexicalBlock(scope: !393, file: !358, line: 172, column: 33)
!398 = !DILocation(line: 173, scope: !396)
!399 = !DILocalVariable(name: "j", scope: !357, file: !358, line: 167, type: !40)
!400 = !DILocation(line: 173, column: 19, scope: !401)
!401 = distinct !DILexicalBlock(scope: !396, file: !358, line: 173, column: 5)
!402 = !DILocation(line: 174, column: 11, scope: !403)
!403 = distinct !DILexicalBlock(scope: !404, file: !358, line: 174, column: 11)
!404 = distinct !DILexicalBlock(scope: !401, file: !358, line: 173, column: 35)
!405 = !DILocation(line: 175, column: 9, scope: !403)
!406 = !DILocation(line: 177, column: 9, scope: !403)
!407 = !DILocation(line: 179, column: 7, scope: !404)
!408 = !DILocalVariable(name: "buflen", scope: !357, file: !358, line: 168, type: !40)
!409 = !DILocation(line: 181, column: 25, scope: !404)
!410 = !DILocation(line: 181, column: 13, scope: !404)
!411 = !DILocalVariable(name: "ctr", scope: !357, file: !358, line: 167, type: !40)
!412 = !DILocation(line: 183, column: 7, scope: !404)
!413 = !DILocation(line: 0, scope: !404)
!414 = !DILocation(line: 183, column: 18, scope: !404)
!415 = !DILocation(line: 184, column: 9, scope: !416)
!416 = distinct !DILexicalBlock(scope: !404, file: !358, line: 183, column: 29)
!417 = !DILocation(line: 186, column: 28, scope: !416)
!418 = !DILocation(line: 186, column: 36, scope: !416)
!419 = !DILocation(line: 186, column: 51, scope: !416)
!420 = !DILocation(line: 186, column: 16, scope: !416)
!421 = !DILocation(line: 186, column: 13, scope: !416)
!422 = distinct !{!422, !412, !423, !130}
!423 = !DILocation(line: 187, column: 7, scope: !404)
!424 = !DILocation(line: 173, column: 31, scope: !401)
!425 = !DILocation(line: 173, column: 5, scope: !401)
!426 = distinct !{!426, !395, !427, !130}
!427 = !DILocation(line: 188, column: 5, scope: !396)
!428 = !DILocation(line: 172, column: 29, scope: !393)
!429 = !DILocation(line: 172, column: 3, scope: !393)
!430 = distinct !{!430, !394, !431, !130}
!431 = !DILocation(line: 189, column: 3, scope: !390)
!432 = !DILocation(line: 190, column: 1, scope: !357)
!433 = distinct !DISubprogram(name: "rej_uniform", scope: !358, file: !358, line: 122, type: !434, scopeLine: 123, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!434 = !DISubroutineType(types: !435)
!435 = !{!40, !436, !40, !272, !40}
!436 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 32)
!437 = !DILocalVariable(name: "r", arg: 1, scope: !433, file: !358, line: 122, type: !436)
!438 = !DILocation(line: 0, scope: !433)
!439 = !DILocalVariable(name: "len", arg: 2, scope: !433, file: !358, line: 122, type: !40)
!440 = !DILocalVariable(name: "buf", arg: 3, scope: !433, file: !358, line: 123, type: !272)
!441 = !DILocalVariable(name: "buflen", arg: 4, scope: !433, file: !358, line: 123, type: !40)
!442 = !DILocalVariable(name: "pos", scope: !433, file: !358, line: 124, type: !40)
!443 = !DILocalVariable(name: "ctr", scope: !433, file: !358, line: 124, type: !40)
!444 = !DILocation(line: 128, column: 3, scope: !433)
!445 = !DILocation(line: 128, column: 14, scope: !433)
!446 = !DILocation(line: 128, column: 20, scope: !433)
!447 = !DILocation(line: 129, column: 14, scope: !448)
!448 = distinct !DILexicalBlock(scope: !433, file: !358, line: 128, column: 42)
!449 = !DILocation(line: 129, column: 46, scope: !448)
!450 = !DILocation(line: 129, column: 36, scope: !448)
!451 = !DILocation(line: 129, column: 59, scope: !448)
!452 = !DILocation(line: 129, column: 66, scope: !448)
!453 = !DILocalVariable(name: "val0", scope: !433, file: !358, line: 125, type: !86)
!454 = !DILocation(line: 130, column: 14, scope: !448)
!455 = !DILocation(line: 130, column: 27, scope: !448)
!456 = !DILocation(line: 130, column: 46, scope: !448)
!457 = !DILocation(line: 130, column: 36, scope: !448)
!458 = !DILocation(line: 130, column: 59, scope: !448)
!459 = !DILocation(line: 130, column: 33, scope: !448)
!460 = !DILocalVariable(name: "val1", scope: !433, file: !358, line: 125, type: !86)
!461 = !DILocation(line: 131, column: 9, scope: !448)
!462 = !DILocation(line: 133, column: 14, scope: !463)
!463 = distinct !DILexicalBlock(scope: !448, file: !358, line: 133, column: 9)
!464 = !DILocation(line: 134, column: 12, scope: !463)
!465 = !DILocation(line: 134, column: 7, scope: !463)
!466 = !DILocation(line: 134, column: 16, scope: !463)
!467 = !DILocation(line: 135, column: 13, scope: !468)
!468 = distinct !DILexicalBlock(scope: !448, file: !358, line: 135, column: 9)
!469 = !DILocation(line: 135, column: 19, scope: !468)
!470 = !DILocation(line: 136, column: 12, scope: !468)
!471 = !DILocation(line: 136, column: 7, scope: !468)
!472 = !DILocation(line: 136, column: 16, scope: !468)
!473 = !DILocation(line: 0, scope: !448)
!474 = distinct !{!474, !444, !475, !130}
!475 = !DILocation(line: 137, column: 3, scope: !433)
!476 = !DILocation(line: 139, column: 3, scope: !433)
!477 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_indcpa_keypair_derand", scope: !358, file: !358, line: 205, type: !478, scopeLine: 207, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !49)
!478 = !DISubroutineType(types: !479)
!479 = !{null, !32, !32, !272}
!480 = !DILocalVariable(name: "pk", arg: 1, scope: !477, file: !358, line: 205, type: !32)
!481 = !DILocation(line: 0, scope: !477)
!482 = !DILocalVariable(name: "sk", arg: 2, scope: !477, file: !358, line: 206, type: !32)
!483 = !DILocalVariable(name: "coins", arg: 3, scope: !477, file: !358, line: 207, type: !272)
!484 = !DILocalVariable(name: "buf", scope: !477, file: !358, line: 209, type: !293)
!485 = !DILocation(line: 209, column: 11, scope: !477)
!486 = !DILocalVariable(name: "publicseed", scope: !477, file: !358, line: 210, type: !272)
!487 = !DILocation(line: 211, column: 34, scope: !477)
!488 = !DILocalVariable(name: "noiseseed", scope: !477, file: !358, line: 211, type: !272)
!489 = !DILocalVariable(name: "nonce", scope: !477, file: !358, line: 212, type: !33)
!490 = !DILocalVariable(name: "a", scope: !477, file: !358, line: 213, type: !491)
!491 = !DICompositeType(tag: DW_TAG_array_type, baseType: !362, size: 65536, elements: !370)
!492 = !DILocation(line: 213, column: 11, scope: !477)
!493 = !DILocalVariable(name: "e", scope: !477, file: !358, line: 213, type: !362)
!494 = !DILocation(line: 213, column: 23, scope: !477)
!495 = !DILocalVariable(name: "pkpv", scope: !477, file: !358, line: 213, type: !362)
!496 = !DILocation(line: 213, column: 26, scope: !477)
!497 = !DILocalVariable(name: "skpv", scope: !477, file: !358, line: 213, type: !362)
!498 = !DILocation(line: 213, column: 32, scope: !477)
!499 = !DILocation(line: 215, column: 3, scope: !477)
!500 = !DILocation(line: 216, column: 3, scope: !477)
!501 = !DILocation(line: 216, column: 23, scope: !477)
!502 = !DILocation(line: 217, column: 3, scope: !477)
!503 = !DILocation(line: 219, column: 3, scope: !477)
!504 = !DILocalVariable(name: "i", scope: !477, file: !358, line: 208, type: !40)
!505 = !DILocation(line: 221, column: 8, scope: !506)
!506 = distinct !DILexicalBlock(scope: !477, file: !358, line: 221, column: 3)
!507 = !DILocation(line: 221, scope: !506)
!508 = !DILocation(line: 221, column: 17, scope: !509)
!509 = distinct !DILexicalBlock(scope: !506, file: !358, line: 221, column: 3)
!510 = !DILocation(line: 221, column: 3, scope: !506)
!511 = !DILocation(line: 223, column: 3, scope: !512)
!512 = distinct !DILexicalBlock(scope: !477, file: !358, line: 223, column: 3)
!513 = !DILocation(line: 222, column: 25, scope: !509)
!514 = !DILocation(line: 222, column: 5, scope: !509)
!515 = !DILocation(line: 222, column: 50, scope: !509)
!516 = !DILocation(line: 221, column: 29, scope: !509)
!517 = !DILocation(line: 221, column: 3, scope: !509)
!518 = distinct !{!518, !510, !519, !130}
!519 = !DILocation(line: 222, column: 52, scope: !506)
!520 = !DILocation(line: 223, scope: !512)
!521 = !DILocation(line: 223, column: 17, scope: !522)
!522 = distinct !DILexicalBlock(scope: !512, file: !358, line: 223, column: 3)
!523 = !DILocation(line: 224, column: 25, scope: !522)
!524 = !DILocation(line: 224, column: 5, scope: !522)
!525 = !DILocation(line: 224, column: 47, scope: !522)
!526 = !DILocation(line: 223, column: 29, scope: !522)
!527 = !DILocation(line: 223, column: 3, scope: !522)
!528 = distinct !{!528, !511, !529, !130}
!529 = !DILocation(line: 224, column: 49, scope: !512)
!530 = !DILocation(line: 226, column: 3, scope: !477)
!531 = !DILocation(line: 227, column: 3, scope: !477)
!532 = !DILocation(line: 230, column: 8, scope: !533)
!533 = distinct !DILexicalBlock(scope: !477, file: !358, line: 230, column: 3)
!534 = !DILocation(line: 230, scope: !533)
!535 = !DILocation(line: 230, column: 17, scope: !536)
!536 = distinct !DILexicalBlock(scope: !533, file: !358, line: 230, column: 3)
!537 = !DILocation(line: 230, column: 3, scope: !533)
!538 = !DILocation(line: 231, column: 37, scope: !539)
!539 = distinct !DILexicalBlock(scope: !536, file: !358, line: 230, column: 33)
!540 = !DILocation(line: 231, column: 47, scope: !539)
!541 = !DILocation(line: 231, column: 5, scope: !539)
!542 = !DILocation(line: 232, column: 18, scope: !539)
!543 = !DILocation(line: 232, column: 5, scope: !539)
!544 = !DILocation(line: 230, column: 29, scope: !536)
!545 = !DILocation(line: 230, column: 3, scope: !536)
!546 = distinct !{!546, !537, !547, !130}
!547 = !DILocation(line: 233, column: 3, scope: !533)
!548 = !DILocation(line: 235, column: 3, scope: !477)
!549 = !DILocation(line: 236, column: 3, scope: !477)
!550 = !DILocation(line: 238, column: 3, scope: !477)
!551 = !DILocation(line: 239, column: 3, scope: !477)
!552 = !DILocation(line: 240, column: 1, scope: !477)
!553 = distinct !DISubprogram(name: "pack_sk", scope: !358, file: !358, line: 55, type: !554, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!554 = !DISubroutineType(types: !555)
!555 = !{null, !32, !361}
!556 = !DILocalVariable(name: "r", arg: 1, scope: !553, file: !358, line: 55, type: !32)
!557 = !DILocation(line: 0, scope: !553)
!558 = !DILocalVariable(name: "sk", arg: 2, scope: !553, file: !358, line: 55, type: !361)
!559 = !DILocation(line: 56, column: 3, scope: !553)
!560 = !DILocation(line: 57, column: 1, scope: !553)
!561 = distinct !DISubprogram(name: "pack_pk", scope: !358, file: !358, line: 23, type: !562, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!562 = !DISubroutineType(types: !563)
!563 = !{null, !32, !361, !272}
!564 = !DILocalVariable(name: "r", arg: 1, scope: !561, file: !358, line: 23, type: !32)
!565 = !DILocation(line: 0, scope: !561)
!566 = !DILocalVariable(name: "pk", arg: 2, scope: !561, file: !358, line: 23, type: !361)
!567 = !DILocalVariable(name: "seed", arg: 3, scope: !561, file: !358, line: 24, type: !272)
!568 = !DILocation(line: 25, column: 3, scope: !561)
!569 = !DILocation(line: 26, column: 12, scope: !561)
!570 = !DILocation(line: 26, column: 3, scope: !561)
!571 = !DILocation(line: 27, column: 1, scope: !561)
!572 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_indcpa_enc", scope: !358, file: !358, line: 257, type: !573, scopeLine: 260, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !49)
!573 = !DISubroutineType(types: !574)
!574 = !{null, !32, !272, !272, !272}
!575 = !DILocalVariable(name: "c", arg: 1, scope: !572, file: !358, line: 257, type: !32)
!576 = !DILocation(line: 0, scope: !572)
!577 = !DILocalVariable(name: "m", arg: 2, scope: !572, file: !358, line: 258, type: !272)
!578 = !DILocalVariable(name: "pk", arg: 3, scope: !572, file: !358, line: 259, type: !272)
!579 = !DILocalVariable(name: "coins", arg: 4, scope: !572, file: !358, line: 260, type: !272)
!580 = !DILocalVariable(name: "seed", scope: !572, file: !358, line: 262, type: !150)
!581 = !DILocation(line: 262, column: 11, scope: !572)
!582 = !DILocalVariable(name: "nonce", scope: !572, file: !358, line: 263, type: !33)
!583 = !DILocalVariable(name: "sp", scope: !572, file: !358, line: 264, type: !362)
!584 = !DILocation(line: 264, column: 11, scope: !572)
!585 = !DILocalVariable(name: "pkpv", scope: !572, file: !358, line: 264, type: !362)
!586 = !DILocation(line: 264, column: 15, scope: !572)
!587 = !DILocalVariable(name: "ep", scope: !572, file: !358, line: 264, type: !362)
!588 = !DILocation(line: 264, column: 21, scope: !572)
!589 = !DILocalVariable(name: "at", scope: !572, file: !358, line: 264, type: !491)
!590 = !DILocation(line: 264, column: 25, scope: !572)
!591 = !DILocalVariable(name: "b", scope: !572, file: !358, line: 264, type: !362)
!592 = !DILocation(line: 264, column: 38, scope: !572)
!593 = !DILocalVariable(name: "v", scope: !572, file: !358, line: 265, type: !365)
!594 = !DILocation(line: 265, column: 8, scope: !572)
!595 = !DILocalVariable(name: "k", scope: !572, file: !358, line: 265, type: !365)
!596 = !DILocation(line: 265, column: 11, scope: !572)
!597 = !DILocalVariable(name: "epp", scope: !572, file: !358, line: 265, type: !365)
!598 = !DILocation(line: 265, column: 14, scope: !572)
!599 = !DILocation(line: 267, column: 3, scope: !572)
!600 = !DILocation(line: 268, column: 3, scope: !572)
!601 = !DILocation(line: 269, column: 3, scope: !572)
!602 = !DILocalVariable(name: "i", scope: !572, file: !358, line: 261, type: !40)
!603 = !DILocation(line: 271, column: 8, scope: !604)
!604 = distinct !DILexicalBlock(scope: !572, file: !358, line: 271, column: 3)
!605 = !DILocation(line: 271, scope: !604)
!606 = !DILocation(line: 271, column: 17, scope: !607)
!607 = distinct !DILexicalBlock(scope: !604, file: !358, line: 271, column: 3)
!608 = !DILocation(line: 271, column: 3, scope: !604)
!609 = !DILocation(line: 273, column: 3, scope: !610)
!610 = distinct !DILexicalBlock(scope: !572, file: !358, line: 273, column: 3)
!611 = !DILocation(line: 272, column: 27, scope: !607)
!612 = !DILocation(line: 272, column: 5, scope: !607)
!613 = !DILocation(line: 272, column: 44, scope: !607)
!614 = !DILocation(line: 271, column: 29, scope: !607)
!615 = !DILocation(line: 271, column: 3, scope: !607)
!616 = distinct !{!616, !608, !617, !130}
!617 = !DILocation(line: 272, column: 46, scope: !604)
!618 = !DILocation(line: 273, scope: !610)
!619 = !DILocation(line: 273, column: 17, scope: !620)
!620 = distinct !DILexicalBlock(scope: !610, file: !358, line: 273, column: 3)
!621 = !DILocation(line: 274, column: 27, scope: !620)
!622 = !DILocation(line: 274, column: 5, scope: !620)
!623 = !DILocation(line: 274, column: 44, scope: !620)
!624 = !DILocation(line: 273, column: 29, scope: !620)
!625 = !DILocation(line: 273, column: 3, scope: !620)
!626 = distinct !{!626, !609, !627, !130}
!627 = !DILocation(line: 274, column: 46, scope: !610)
!628 = !DILocation(line: 275, column: 3, scope: !572)
!629 = !DILocation(line: 277, column: 3, scope: !572)
!630 = !DILocation(line: 280, column: 8, scope: !631)
!631 = distinct !DILexicalBlock(scope: !572, file: !358, line: 280, column: 3)
!632 = !DILocation(line: 280, scope: !631)
!633 = !DILocation(line: 280, column: 17, scope: !634)
!634 = distinct !DILexicalBlock(scope: !631, file: !358, line: 280, column: 3)
!635 = !DILocation(line: 280, column: 3, scope: !631)
!636 = !DILocation(line: 281, column: 37, scope: !634)
!637 = !DILocation(line: 281, column: 44, scope: !634)
!638 = !DILocation(line: 281, column: 5, scope: !634)
!639 = !DILocation(line: 280, column: 29, scope: !634)
!640 = !DILocation(line: 280, column: 3, scope: !634)
!641 = distinct !{!641, !635, !642, !130}
!642 = !DILocation(line: 281, column: 54, scope: !631)
!643 = !DILocation(line: 283, column: 3, scope: !572)
!644 = !DILocation(line: 285, column: 3, scope: !572)
!645 = !DILocation(line: 286, column: 3, scope: !572)
!646 = !DILocation(line: 288, column: 3, scope: !572)
!647 = !DILocation(line: 289, column: 3, scope: !572)
!648 = !DILocation(line: 290, column: 3, scope: !572)
!649 = !DILocation(line: 291, column: 3, scope: !572)
!650 = !DILocation(line: 292, column: 3, scope: !572)
!651 = !DILocation(line: 294, column: 3, scope: !572)
!652 = !DILocation(line: 295, column: 1, scope: !572)
!653 = distinct !DISubprogram(name: "unpack_pk", scope: !358, file: !358, line: 40, type: !654, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!654 = !DISubroutineType(types: !655)
!655 = !{null, !361, !32, !272}
!656 = !DILocalVariable(name: "pk", arg: 1, scope: !653, file: !358, line: 40, type: !361)
!657 = !DILocation(line: 0, scope: !653)
!658 = !DILocalVariable(name: "seed", arg: 2, scope: !653, file: !358, line: 40, type: !32)
!659 = !DILocalVariable(name: "packedpk", arg: 3, scope: !653, file: !358, line: 41, type: !272)
!660 = !DILocation(line: 42, column: 3, scope: !653)
!661 = !DILocation(line: 43, column: 25, scope: !653)
!662 = !DILocation(line: 43, column: 3, scope: !653)
!663 = !DILocation(line: 44, column: 1, scope: !653)
!664 = distinct !DISubprogram(name: "pack_ciphertext", scope: !358, file: !358, line: 85, type: !665, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!665 = !DISubroutineType(types: !666)
!666 = !{null, !32, !361, !667}
!667 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !365, size: 32)
!668 = !DILocalVariable(name: "r", arg: 1, scope: !664, file: !358, line: 85, type: !32)
!669 = !DILocation(line: 0, scope: !664)
!670 = !DILocalVariable(name: "b", arg: 2, scope: !664, file: !358, line: 85, type: !361)
!671 = !DILocalVariable(name: "v", arg: 3, scope: !664, file: !358, line: 86, type: !667)
!672 = !DILocation(line: 87, column: 3, scope: !664)
!673 = !DILocation(line: 88, column: 19, scope: !664)
!674 = !DILocation(line: 88, column: 3, scope: !664)
!675 = !DILocation(line: 89, column: 1, scope: !664)
!676 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_indcpa_dec", scope: !358, file: !358, line: 310, type: !677, scopeLine: 312, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !49)
!677 = !DISubroutineType(types: !678)
!678 = !{null, !32, !272, !272}
!679 = !DILocalVariable(name: "m", arg: 1, scope: !676, file: !358, line: 310, type: !32)
!680 = !DILocation(line: 0, scope: !676)
!681 = !DILocalVariable(name: "c", arg: 2, scope: !676, file: !358, line: 311, type: !272)
!682 = !DILocalVariable(name: "sk", arg: 3, scope: !676, file: !358, line: 312, type: !272)
!683 = !DILocalVariable(name: "b", scope: !676, file: !358, line: 313, type: !362)
!684 = !DILocation(line: 313, column: 11, scope: !676)
!685 = !DILocalVariable(name: "skpv", scope: !676, file: !358, line: 313, type: !362)
!686 = !DILocation(line: 313, column: 14, scope: !676)
!687 = !DILocalVariable(name: "v", scope: !676, file: !358, line: 314, type: !365)
!688 = !DILocation(line: 314, column: 8, scope: !676)
!689 = !DILocalVariable(name: "mp", scope: !676, file: !358, line: 314, type: !365)
!690 = !DILocation(line: 314, column: 11, scope: !676)
!691 = !DILocation(line: 316, column: 3, scope: !676)
!692 = !DILocation(line: 317, column: 3, scope: !676)
!693 = !DILocation(line: 319, column: 3, scope: !676)
!694 = !DILocation(line: 320, column: 3, scope: !676)
!695 = !DILocation(line: 321, column: 3, scope: !676)
!696 = !DILocation(line: 323, column: 3, scope: !676)
!697 = !DILocation(line: 324, column: 3, scope: !676)
!698 = !DILocation(line: 326, column: 3, scope: !676)
!699 = !DILocation(line: 327, column: 1, scope: !676)
!700 = distinct !DISubprogram(name: "unpack_ciphertext", scope: !358, file: !358, line: 101, type: !701, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!701 = !DISubroutineType(types: !702)
!702 = !{null, !361, !667, !272}
!703 = !DILocalVariable(name: "b", arg: 1, scope: !700, file: !358, line: 101, type: !361)
!704 = !DILocation(line: 0, scope: !700)
!705 = !DILocalVariable(name: "v", arg: 2, scope: !700, file: !358, line: 101, type: !667)
!706 = !DILocalVariable(name: "c", arg: 3, scope: !700, file: !358, line: 102, type: !272)
!707 = !DILocation(line: 103, column: 3, scope: !700)
!708 = !DILocation(line: 104, column: 24, scope: !700)
!709 = !DILocation(line: 104, column: 3, scope: !700)
!710 = !DILocation(line: 105, column: 1, scope: !700)
!711 = distinct !DISubprogram(name: "unpack_sk", scope: !358, file: !358, line: 69, type: !712, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!712 = !DISubroutineType(types: !713)
!713 = !{null, !361, !272}
!714 = !DILocalVariable(name: "sk", arg: 1, scope: !711, file: !358, line: 69, type: !361)
!715 = !DILocation(line: 0, scope: !711)
!716 = !DILocalVariable(name: "packedsk", arg: 2, scope: !711, file: !358, line: 70, type: !272)
!717 = !DILocation(line: 71, column: 3, scope: !711)
!718 = !DILocation(line: 72, column: 1, scope: !711)
!719 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_compress", scope: !720, file: !720, line: 15, type: !721, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!720 = !DIFile(filename: "../../../ref/polyvec.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!721 = !DISubroutineType(types: !722)
!722 = !{null, !32, !723}
!723 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !724, size: 32)
!724 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !362)
!725 = !DILocalVariable(name: "r", arg: 1, scope: !719, file: !720, line: 15, type: !32)
!726 = !DILocation(line: 0, scope: !719)
!727 = !DILocalVariable(name: "a", arg: 2, scope: !719, file: !720, line: 16, type: !723)
!728 = !DILocalVariable(name: "t", scope: !719, file: !720, line: 21, type: !729)
!729 = !DICompositeType(tag: DW_TAG_array_type, baseType: !86, size: 128, elements: !730)
!730 = !{!731}
!731 = !DISubrange(count: 8)
!732 = !DILocation(line: 21, column: 12, scope: !719)
!733 = !DILocalVariable(name: "i", scope: !719, file: !720, line: 17, type: !40)
!734 = !DILocation(line: 22, column: 8, scope: !735)
!735 = distinct !DILexicalBlock(scope: !719, file: !720, line: 22, column: 3)
!736 = !DILocation(line: 22, scope: !735)
!737 = !DILocation(line: 22, column: 17, scope: !738)
!738 = distinct !DILexicalBlock(scope: !735, file: !720, line: 22, column: 3)
!739 = !DILocation(line: 22, column: 3, scope: !735)
!740 = !DILocation(line: 23, column: 5, scope: !741)
!741 = distinct !DILexicalBlock(scope: !742, file: !720, line: 23, column: 5)
!742 = distinct !DILexicalBlock(scope: !738, file: !720, line: 22, column: 33)
!743 = !DILocation(line: 23, scope: !741)
!744 = !DILocalVariable(name: "j", scope: !719, file: !720, line: 17, type: !40)
!745 = !DILocation(line: 23, column: 19, scope: !746)
!746 = distinct !DILexicalBlock(scope: !741, file: !720, line: 23, column: 5)
!747 = !DILocation(line: 24, column: 7, scope: !748)
!748 = distinct !DILexicalBlock(scope: !749, file: !720, line: 24, column: 7)
!749 = distinct !DILexicalBlock(scope: !746, file: !720, line: 23, column: 39)
!750 = !DILocation(line: 24, scope: !748)
!751 = !DILocalVariable(name: "k", scope: !719, file: !720, line: 17, type: !40)
!752 = !DILocation(line: 24, column: 21, scope: !753)
!753 = distinct !DILexicalBlock(scope: !748, file: !720, line: 24, column: 7)
!754 = !DILocation(line: 25, column: 26, scope: !755)
!755 = distinct !DILexicalBlock(scope: !753, file: !720, line: 24, column: 31)
!756 = !DILocation(line: 25, column: 30, scope: !755)
!757 = !DILocation(line: 25, column: 16, scope: !755)
!758 = !DILocation(line: 26, column: 39, scope: !755)
!759 = !DILocation(line: 26, column: 9, scope: !755)
!760 = !DILocation(line: 26, column: 14, scope: !755)
!761 = !DILocation(line: 29, column: 14, scope: !755)
!762 = !DILocalVariable(name: "d0", scope: !719, file: !720, line: 18, type: !70)
!763 = !DILocation(line: 32, column: 12, scope: !755)
!764 = !DILocation(line: 33, column: 12, scope: !755)
!765 = !DILocation(line: 34, column: 16, scope: !755)
!766 = !DILocation(line: 34, column: 9, scope: !755)
!767 = !DILocation(line: 34, column: 14, scope: !755)
!768 = !DILocation(line: 24, column: 27, scope: !753)
!769 = !DILocation(line: 24, column: 7, scope: !753)
!770 = distinct !{!770, !747, !771, !130}
!771 = !DILocation(line: 35, column: 7, scope: !748)
!772 = !DILocation(line: 37, column: 15, scope: !749)
!773 = !DILocation(line: 37, column: 14, scope: !749)
!774 = !DILocation(line: 37, column: 12, scope: !749)
!775 = !DILocation(line: 38, column: 15, scope: !749)
!776 = !DILocation(line: 38, column: 20, scope: !749)
!777 = !DILocation(line: 38, column: 29, scope: !749)
!778 = !DILocation(line: 38, column: 34, scope: !749)
!779 = !DILocation(line: 38, column: 26, scope: !749)
!780 = !DILocation(line: 38, column: 7, scope: !749)
!781 = !DILocation(line: 38, column: 12, scope: !749)
!782 = !DILocation(line: 39, column: 15, scope: !749)
!783 = !DILocation(line: 39, column: 20, scope: !749)
!784 = !DILocation(line: 39, column: 29, scope: !749)
!785 = !DILocation(line: 39, column: 34, scope: !749)
!786 = !DILocation(line: 39, column: 26, scope: !749)
!787 = !DILocation(line: 39, column: 7, scope: !749)
!788 = !DILocation(line: 39, column: 12, scope: !749)
!789 = !DILocation(line: 40, column: 15, scope: !749)
!790 = !DILocation(line: 40, column: 20, scope: !749)
!791 = !DILocation(line: 40, column: 14, scope: !749)
!792 = !DILocation(line: 40, column: 7, scope: !749)
!793 = !DILocation(line: 40, column: 12, scope: !749)
!794 = !DILocation(line: 41, column: 15, scope: !749)
!795 = !DILocation(line: 41, column: 20, scope: !749)
!796 = !DILocation(line: 41, column: 30, scope: !749)
!797 = !DILocation(line: 41, column: 35, scope: !749)
!798 = !DILocation(line: 41, column: 27, scope: !749)
!799 = !DILocation(line: 41, column: 7, scope: !749)
!800 = !DILocation(line: 41, column: 12, scope: !749)
!801 = !DILocation(line: 42, column: 15, scope: !749)
!802 = !DILocation(line: 42, column: 20, scope: !749)
!803 = !DILocation(line: 42, column: 29, scope: !749)
!804 = !DILocation(line: 42, column: 34, scope: !749)
!805 = !DILocation(line: 42, column: 26, scope: !749)
!806 = !DILocation(line: 42, column: 7, scope: !749)
!807 = !DILocation(line: 42, column: 12, scope: !749)
!808 = !DILocation(line: 43, column: 15, scope: !749)
!809 = !DILocation(line: 43, column: 20, scope: !749)
!810 = !DILocation(line: 43, column: 29, scope: !749)
!811 = !DILocation(line: 43, column: 34, scope: !749)
!812 = !DILocation(line: 43, column: 26, scope: !749)
!813 = !DILocation(line: 43, column: 7, scope: !749)
!814 = !DILocation(line: 43, column: 12, scope: !749)
!815 = !DILocation(line: 44, column: 15, scope: !749)
!816 = !DILocation(line: 44, column: 20, scope: !749)
!817 = !DILocation(line: 44, column: 14, scope: !749)
!818 = !DILocation(line: 44, column: 7, scope: !749)
!819 = !DILocation(line: 44, column: 12, scope: !749)
!820 = !DILocation(line: 45, column: 15, scope: !749)
!821 = !DILocation(line: 45, column: 20, scope: !749)
!822 = !DILocation(line: 45, column: 29, scope: !749)
!823 = !DILocation(line: 45, column: 34, scope: !749)
!824 = !DILocation(line: 45, column: 26, scope: !749)
!825 = !DILocation(line: 45, column: 7, scope: !749)
!826 = !DILocation(line: 45, column: 12, scope: !749)
!827 = !DILocation(line: 46, column: 15, scope: !749)
!828 = !DILocation(line: 46, column: 20, scope: !749)
!829 = !DILocation(line: 46, column: 29, scope: !749)
!830 = !DILocation(line: 46, column: 34, scope: !749)
!831 = !DILocation(line: 46, column: 26, scope: !749)
!832 = !DILocation(line: 46, column: 7, scope: !749)
!833 = !DILocation(line: 46, column: 12, scope: !749)
!834 = !DILocation(line: 47, column: 16, scope: !749)
!835 = !DILocation(line: 47, column: 21, scope: !749)
!836 = !DILocation(line: 47, column: 15, scope: !749)
!837 = !DILocation(line: 47, column: 7, scope: !749)
!838 = !DILocation(line: 47, column: 13, scope: !749)
!839 = !DILocation(line: 48, column: 9, scope: !749)
!840 = !DILocation(line: 23, column: 35, scope: !746)
!841 = !DILocation(line: 23, column: 5, scope: !746)
!842 = distinct !{!842, !740, !843, !130}
!843 = !DILocation(line: 49, column: 5, scope: !741)
!844 = !DILocation(line: 22, column: 29, scope: !738)
!845 = !DILocation(line: 22, column: 3, scope: !738)
!846 = distinct !{!846, !739, !847, !130}
!847 = !DILocation(line: 50, column: 3, scope: !735)
!848 = !DILocation(line: 79, column: 1, scope: !719)
!849 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_decompress", scope: !720, file: !720, line: 91, type: !712, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!850 = !DILocalVariable(name: "r", arg: 1, scope: !849, file: !720, line: 91, type: !361)
!851 = !DILocation(line: 0, scope: !849)
!852 = !DILocalVariable(name: "a", arg: 2, scope: !849, file: !720, line: 92, type: !272)
!853 = !DILocalVariable(name: "t", scope: !849, file: !720, line: 96, type: !729)
!854 = !DILocation(line: 96, column: 12, scope: !849)
!855 = !DILocalVariable(name: "i", scope: !849, file: !720, line: 93, type: !40)
!856 = !DILocation(line: 97, column: 8, scope: !857)
!857 = distinct !DILexicalBlock(scope: !849, file: !720, line: 97, column: 3)
!858 = !DILocation(line: 97, scope: !857)
!859 = !DILocation(line: 97, column: 17, scope: !860)
!860 = distinct !DILexicalBlock(scope: !857, file: !720, line: 97, column: 3)
!861 = !DILocation(line: 97, column: 3, scope: !857)
!862 = !DILocation(line: 98, column: 5, scope: !863)
!863 = distinct !DILexicalBlock(scope: !864, file: !720, line: 98, column: 5)
!864 = distinct !DILexicalBlock(scope: !860, file: !720, line: 97, column: 33)
!865 = !DILocation(line: 98, scope: !863)
!866 = !DILocalVariable(name: "j", scope: !849, file: !720, line: 93, type: !40)
!867 = !DILocation(line: 98, column: 19, scope: !868)
!868 = distinct !DILexicalBlock(scope: !863, file: !720, line: 98, column: 5)
!869 = !DILocation(line: 99, column: 15, scope: !870)
!870 = distinct !DILexicalBlock(scope: !868, file: !720, line: 98, column: 39)
!871 = !DILocation(line: 99, column: 39, scope: !870)
!872 = !DILocation(line: 99, column: 29, scope: !870)
!873 = !DILocation(line: 99, column: 44, scope: !870)
!874 = !DILocation(line: 99, column: 26, scope: !870)
!875 = !DILocation(line: 99, column: 12, scope: !870)
!876 = !DILocation(line: 100, column: 15, scope: !870)
!877 = !DILocation(line: 100, column: 20, scope: !870)
!878 = !DILocation(line: 100, column: 39, scope: !870)
!879 = !DILocation(line: 100, column: 29, scope: !870)
!880 = !DILocation(line: 100, column: 44, scope: !870)
!881 = !DILocation(line: 100, column: 26, scope: !870)
!882 = !DILocation(line: 100, column: 7, scope: !870)
!883 = !DILocation(line: 100, column: 12, scope: !870)
!884 = !DILocation(line: 101, column: 15, scope: !870)
!885 = !DILocation(line: 101, column: 20, scope: !870)
!886 = !DILocation(line: 101, column: 39, scope: !870)
!887 = !DILocation(line: 101, column: 29, scope: !870)
!888 = !DILocation(line: 101, column: 44, scope: !870)
!889 = !DILocation(line: 101, column: 26, scope: !870)
!890 = !DILocation(line: 101, column: 63, scope: !870)
!891 = !DILocation(line: 101, column: 53, scope: !870)
!892 = !DILocation(line: 101, column: 68, scope: !870)
!893 = !DILocation(line: 101, column: 50, scope: !870)
!894 = !DILocation(line: 101, column: 7, scope: !870)
!895 = !DILocation(line: 101, column: 12, scope: !870)
!896 = !DILocation(line: 102, column: 15, scope: !870)
!897 = !DILocation(line: 102, column: 20, scope: !870)
!898 = !DILocation(line: 102, column: 39, scope: !870)
!899 = !DILocation(line: 102, column: 29, scope: !870)
!900 = !DILocation(line: 102, column: 44, scope: !870)
!901 = !DILocation(line: 102, column: 26, scope: !870)
!902 = !DILocation(line: 102, column: 7, scope: !870)
!903 = !DILocation(line: 102, column: 12, scope: !870)
!904 = !DILocation(line: 103, column: 15, scope: !870)
!905 = !DILocation(line: 103, column: 20, scope: !870)
!906 = !DILocation(line: 103, column: 39, scope: !870)
!907 = !DILocation(line: 103, column: 29, scope: !870)
!908 = !DILocation(line: 103, column: 44, scope: !870)
!909 = !DILocation(line: 103, column: 26, scope: !870)
!910 = !DILocation(line: 103, column: 7, scope: !870)
!911 = !DILocation(line: 103, column: 12, scope: !870)
!912 = !DILocation(line: 104, column: 15, scope: !870)
!913 = !DILocation(line: 104, column: 20, scope: !870)
!914 = !DILocation(line: 104, column: 39, scope: !870)
!915 = !DILocation(line: 104, column: 29, scope: !870)
!916 = !DILocation(line: 104, column: 44, scope: !870)
!917 = !DILocation(line: 104, column: 26, scope: !870)
!918 = !DILocation(line: 104, column: 63, scope: !870)
!919 = !DILocation(line: 104, column: 53, scope: !870)
!920 = !DILocation(line: 104, column: 68, scope: !870)
!921 = !DILocation(line: 104, column: 50, scope: !870)
!922 = !DILocation(line: 104, column: 7, scope: !870)
!923 = !DILocation(line: 104, column: 12, scope: !870)
!924 = !DILocation(line: 105, column: 15, scope: !870)
!925 = !DILocation(line: 105, column: 20, scope: !870)
!926 = !DILocation(line: 105, column: 39, scope: !870)
!927 = !DILocation(line: 105, column: 29, scope: !870)
!928 = !DILocation(line: 105, column: 44, scope: !870)
!929 = !DILocation(line: 105, column: 26, scope: !870)
!930 = !DILocation(line: 105, column: 7, scope: !870)
!931 = !DILocation(line: 105, column: 12, scope: !870)
!932 = !DILocation(line: 106, column: 15, scope: !870)
!933 = !DILocation(line: 106, column: 20, scope: !870)
!934 = !DILocation(line: 106, column: 39, scope: !870)
!935 = !DILocation(line: 106, column: 29, scope: !870)
!936 = !DILocation(line: 106, column: 45, scope: !870)
!937 = !DILocation(line: 106, column: 26, scope: !870)
!938 = !DILocation(line: 106, column: 7, scope: !870)
!939 = !DILocation(line: 106, column: 12, scope: !870)
!940 = !DILocalVariable(name: "k", scope: !849, file: !720, line: 93, type: !40)
!941 = !DILocation(line: 109, column: 12, scope: !942)
!942 = distinct !DILexicalBlock(scope: !870, file: !720, line: 109, column: 7)
!943 = !DILocation(line: 109, scope: !942)
!944 = !DILocation(line: 109, column: 21, scope: !945)
!945 = distinct !DILexicalBlock(scope: !942, file: !720, line: 109, column: 7)
!946 = !DILocation(line: 109, column: 7, scope: !942)
!947 = !DILocation(line: 110, column: 42, scope: !945)
!948 = !DILocation(line: 110, column: 47, scope: !945)
!949 = !DILocation(line: 110, column: 56, scope: !945)
!950 = !DILocation(line: 110, column: 66, scope: !945)
!951 = !DILocation(line: 110, column: 74, scope: !945)
!952 = !DILocation(line: 110, column: 30, scope: !945)
!953 = !DILocation(line: 110, column: 19, scope: !945)
!954 = !DILocation(line: 110, column: 23, scope: !945)
!955 = !DILocation(line: 110, column: 9, scope: !945)
!956 = !DILocation(line: 110, column: 28, scope: !945)
!957 = !DILocation(line: 109, column: 27, scope: !945)
!958 = !DILocation(line: 109, column: 7, scope: !945)
!959 = distinct !{!959, !946, !960, !130}
!960 = !DILocation(line: 110, column: 77, scope: !942)
!961 = !DILocation(line: 107, column: 9, scope: !870)
!962 = !DILocation(line: 98, column: 35, scope: !868)
!963 = !DILocation(line: 98, column: 5, scope: !868)
!964 = distinct !{!964, !862, !965, !130}
!965 = !DILocation(line: 111, column: 5, scope: !863)
!966 = !DILocation(line: 97, column: 29, scope: !860)
!967 = !DILocation(line: 97, column: 3, scope: !860)
!968 = distinct !{!968, !861, !969, !130}
!969 = !DILocation(line: 112, column: 3, scope: !857)
!970 = !DILocation(line: 130, column: 1, scope: !849)
!971 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_tobytes", scope: !720, file: !720, line: 141, type: !721, scopeLine: 141, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!972 = !DILocalVariable(name: "r", arg: 1, scope: !971, file: !720, line: 141, type: !32)
!973 = !DILocation(line: 0, scope: !971)
!974 = !DILocalVariable(name: "a", arg: 2, scope: !971, file: !720, line: 141, type: !723)
!975 = !DILocalVariable(name: "i", scope: !971, file: !720, line: 142, type: !40)
!976 = !DILocation(line: 143, column: 8, scope: !977)
!977 = distinct !DILexicalBlock(scope: !971, file: !720, line: 143, column: 3)
!978 = !DILocation(line: 143, scope: !977)
!979 = !DILocation(line: 143, column: 17, scope: !980)
!980 = distinct !DILexicalBlock(scope: !977, file: !720, line: 143, column: 3)
!981 = !DILocation(line: 143, column: 3, scope: !977)
!982 = !DILocation(line: 144, column: 24, scope: !980)
!983 = !DILocation(line: 144, column: 20, scope: !980)
!984 = !DILocation(line: 144, column: 44, scope: !980)
!985 = !DILocation(line: 144, column: 5, scope: !980)
!986 = !DILocation(line: 143, column: 29, scope: !980)
!987 = !DILocation(line: 143, column: 3, scope: !980)
!988 = distinct !{!988, !981, !989, !130}
!989 = !DILocation(line: 144, column: 51, scope: !977)
!990 = !DILocation(line: 145, column: 1, scope: !971)
!991 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_frombytes", scope: !720, file: !720, line: 157, type: !712, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!992 = !DILocalVariable(name: "r", arg: 1, scope: !991, file: !720, line: 157, type: !361)
!993 = !DILocation(line: 0, scope: !991)
!994 = !DILocalVariable(name: "a", arg: 2, scope: !991, file: !720, line: 157, type: !272)
!995 = !DILocalVariable(name: "i", scope: !991, file: !720, line: 158, type: !40)
!996 = !DILocation(line: 159, column: 8, scope: !997)
!997 = distinct !DILexicalBlock(scope: !991, file: !720, line: 159, column: 3)
!998 = !DILocation(line: 159, scope: !997)
!999 = !DILocation(line: 159, column: 17, scope: !1000)
!1000 = distinct !DILexicalBlock(scope: !997, file: !720, line: 159, column: 3)
!1001 = !DILocation(line: 159, column: 3, scope: !997)
!1002 = !DILocation(line: 160, column: 21, scope: !1000)
!1003 = !DILocation(line: 160, column: 36, scope: !1000)
!1004 = !DILocation(line: 160, column: 32, scope: !1000)
!1005 = !DILocation(line: 160, column: 5, scope: !1000)
!1006 = !DILocation(line: 159, column: 29, scope: !1000)
!1007 = !DILocation(line: 159, column: 3, scope: !1000)
!1008 = distinct !{!1008, !1001, !1009, !130}
!1009 = !DILocation(line: 160, column: 53, scope: !997)
!1010 = !DILocation(line: 161, column: 1, scope: !991)
!1011 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_ntt", scope: !720, file: !720, line: 170, type: !1012, scopeLine: 170, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1012 = !DISubroutineType(types: !1013)
!1013 = !{null, !361}
!1014 = !DILocalVariable(name: "r", arg: 1, scope: !1011, file: !720, line: 170, type: !361)
!1015 = !DILocation(line: 0, scope: !1011)
!1016 = !DILocalVariable(name: "i", scope: !1011, file: !720, line: 171, type: !40)
!1017 = !DILocation(line: 172, column: 8, scope: !1018)
!1018 = distinct !DILexicalBlock(scope: !1011, file: !720, line: 172, column: 3)
!1019 = !DILocation(line: 172, scope: !1018)
!1020 = !DILocation(line: 172, column: 17, scope: !1021)
!1021 = distinct !DILexicalBlock(scope: !1018, file: !720, line: 172, column: 3)
!1022 = !DILocation(line: 172, column: 3, scope: !1018)
!1023 = !DILocation(line: 173, column: 15, scope: !1021)
!1024 = !DILocation(line: 173, column: 5, scope: !1021)
!1025 = !DILocation(line: 172, column: 29, scope: !1021)
!1026 = !DILocation(line: 172, column: 3, scope: !1021)
!1027 = distinct !{!1027, !1022, !1028, !130}
!1028 = !DILocation(line: 173, column: 22, scope: !1018)
!1029 = !DILocation(line: 174, column: 1, scope: !1011)
!1030 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_invntt_tomont", scope: !720, file: !720, line: 184, type: !1012, scopeLine: 184, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1031 = !DILocalVariable(name: "r", arg: 1, scope: !1030, file: !720, line: 184, type: !361)
!1032 = !DILocation(line: 0, scope: !1030)
!1033 = !DILocalVariable(name: "i", scope: !1030, file: !720, line: 185, type: !40)
!1034 = !DILocation(line: 186, column: 8, scope: !1035)
!1035 = distinct !DILexicalBlock(scope: !1030, file: !720, line: 186, column: 3)
!1036 = !DILocation(line: 186, scope: !1035)
!1037 = !DILocation(line: 186, column: 17, scope: !1038)
!1038 = distinct !DILexicalBlock(scope: !1035, file: !720, line: 186, column: 3)
!1039 = !DILocation(line: 186, column: 3, scope: !1035)
!1040 = !DILocation(line: 187, column: 25, scope: !1038)
!1041 = !DILocation(line: 187, column: 5, scope: !1038)
!1042 = !DILocation(line: 186, column: 29, scope: !1038)
!1043 = !DILocation(line: 186, column: 3, scope: !1038)
!1044 = distinct !{!1044, !1039, !1045, !130}
!1045 = !DILocation(line: 187, column: 32, scope: !1035)
!1046 = !DILocation(line: 188, column: 1, scope: !1030)
!1047 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery", scope: !720, file: !720, line: 200, type: !1048, scopeLine: 201, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1048 = !DISubroutineType(types: !1049)
!1049 = !{null, !667, !723, !723}
!1050 = !DILocalVariable(name: "r", arg: 1, scope: !1047, file: !720, line: 200, type: !667)
!1051 = !DILocation(line: 0, scope: !1047)
!1052 = !DILocalVariable(name: "a", arg: 2, scope: !1047, file: !720, line: 200, type: !723)
!1053 = !DILocalVariable(name: "b", arg: 3, scope: !1047, file: !720, line: 201, type: !723)
!1054 = !DILocalVariable(name: "t", scope: !1047, file: !720, line: 203, type: !365)
!1055 = !DILocation(line: 203, column: 8, scope: !1047)
!1056 = !DILocation(line: 205, column: 3, scope: !1047)
!1057 = !DILocalVariable(name: "i", scope: !1047, file: !720, line: 202, type: !40)
!1058 = !DILocation(line: 206, column: 8, scope: !1059)
!1059 = distinct !DILexicalBlock(scope: !1047, file: !720, line: 206, column: 3)
!1060 = !DILocation(line: 206, scope: !1059)
!1061 = !DILocation(line: 206, column: 17, scope: !1062)
!1062 = distinct !DILexicalBlock(scope: !1059, file: !720, line: 206, column: 3)
!1063 = !DILocation(line: 206, column: 3, scope: !1059)
!1064 = !DILocation(line: 207, column: 34, scope: !1065)
!1065 = distinct !DILexicalBlock(scope: !1062, file: !720, line: 206, column: 33)
!1066 = !DILocation(line: 207, column: 44, scope: !1065)
!1067 = !DILocation(line: 207, column: 5, scope: !1065)
!1068 = !DILocation(line: 208, column: 5, scope: !1065)
!1069 = !DILocation(line: 206, column: 29, scope: !1062)
!1070 = !DILocation(line: 206, column: 3, scope: !1062)
!1071 = distinct !{!1071, !1063, !1072, !130}
!1072 = !DILocation(line: 209, column: 3, scope: !1059)
!1073 = !DILocation(line: 211, column: 3, scope: !1047)
!1074 = !DILocation(line: 212, column: 1, scope: !1047)
!1075 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_reduce", scope: !720, file: !720, line: 223, type: !1012, scopeLine: 223, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1076 = !DILocalVariable(name: "r", arg: 1, scope: !1075, file: !720, line: 223, type: !361)
!1077 = !DILocation(line: 0, scope: !1075)
!1078 = !DILocalVariable(name: "i", scope: !1075, file: !720, line: 224, type: !40)
!1079 = !DILocation(line: 225, column: 8, scope: !1080)
!1080 = distinct !DILexicalBlock(scope: !1075, file: !720, line: 225, column: 3)
!1081 = !DILocation(line: 225, scope: !1080)
!1082 = !DILocation(line: 225, column: 17, scope: !1083)
!1083 = distinct !DILexicalBlock(scope: !1080, file: !720, line: 225, column: 3)
!1084 = !DILocation(line: 225, column: 3, scope: !1080)
!1085 = !DILocation(line: 226, column: 18, scope: !1083)
!1086 = !DILocation(line: 226, column: 5, scope: !1083)
!1087 = !DILocation(line: 225, column: 29, scope: !1083)
!1088 = !DILocation(line: 225, column: 3, scope: !1083)
!1089 = distinct !{!1089, !1084, !1090, !130}
!1090 = !DILocation(line: 226, column: 25, scope: !1080)
!1091 = !DILocation(line: 227, column: 1, scope: !1075)
!1092 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_add", scope: !720, file: !720, line: 238, type: !1093, scopeLine: 238, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1093 = !DISubroutineType(types: !1094)
!1094 = !{null, !361, !723, !723}
!1095 = !DILocalVariable(name: "r", arg: 1, scope: !1092, file: !720, line: 238, type: !361)
!1096 = !DILocation(line: 0, scope: !1092)
!1097 = !DILocalVariable(name: "a", arg: 2, scope: !1092, file: !720, line: 238, type: !723)
!1098 = !DILocalVariable(name: "b", arg: 3, scope: !1092, file: !720, line: 238, type: !723)
!1099 = !DILocalVariable(name: "i", scope: !1092, file: !720, line: 239, type: !40)
!1100 = !DILocation(line: 240, column: 8, scope: !1101)
!1101 = distinct !DILexicalBlock(scope: !1092, file: !720, line: 240, column: 3)
!1102 = !DILocation(line: 240, scope: !1101)
!1103 = !DILocation(line: 240, column: 17, scope: !1104)
!1104 = distinct !DILexicalBlock(scope: !1101, file: !720, line: 240, column: 3)
!1105 = !DILocation(line: 240, column: 3, scope: !1101)
!1106 = !DILocation(line: 241, column: 15, scope: !1104)
!1107 = !DILocation(line: 241, column: 25, scope: !1104)
!1108 = !DILocation(line: 241, column: 35, scope: !1104)
!1109 = !DILocation(line: 241, column: 5, scope: !1104)
!1110 = !DILocation(line: 240, column: 29, scope: !1104)
!1111 = !DILocation(line: 240, column: 3, scope: !1104)
!1112 = distinct !{!1112, !1105, !1113, !130}
!1113 = !DILocation(line: 241, column: 42, scope: !1101)
!1114 = !DILocation(line: 242, column: 1, scope: !1092)
!1115 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_compress", scope: !1116, file: !1116, line: 19, type: !1117, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1116 = !DIFile(filename: "../../../ref/poly.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!1117 = !DISubroutineType(types: !1118)
!1118 = !{null, !32, !1119}
!1119 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1120, size: 32)
!1120 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !365)
!1121 = !DILocalVariable(name: "r", arg: 1, scope: !1115, file: !1116, line: 19, type: !32)
!1122 = !DILocation(line: 0, scope: !1115)
!1123 = !DILocalVariable(name: "a", arg: 2, scope: !1115, file: !1116, line: 19, type: !1119)
!1124 = !DILocalVariable(name: "t", scope: !1115, file: !1116, line: 23, type: !1125)
!1125 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 64, elements: !730)
!1126 = !DILocation(line: 23, column: 11, scope: !1115)
!1127 = !DILocalVariable(name: "i", scope: !1115, file: !1116, line: 20, type: !40)
!1128 = !DILocation(line: 47, column: 8, scope: !1129)
!1129 = distinct !DILexicalBlock(scope: !1115, file: !1116, line: 47, column: 3)
!1130 = !DILocation(line: 47, scope: !1129)
!1131 = !DILocation(line: 47, column: 17, scope: !1132)
!1132 = distinct !DILexicalBlock(scope: !1129, file: !1116, line: 47, column: 3)
!1133 = !DILocation(line: 47, column: 3, scope: !1129)
!1134 = !DILocation(line: 48, column: 5, scope: !1135)
!1135 = distinct !DILexicalBlock(scope: !1136, file: !1116, line: 48, column: 5)
!1136 = distinct !DILexicalBlock(scope: !1132, file: !1116, line: 47, column: 37)
!1137 = !DILocation(line: 48, scope: !1135)
!1138 = !DILocalVariable(name: "j", scope: !1115, file: !1116, line: 20, type: !40)
!1139 = !DILocation(line: 48, column: 19, scope: !1140)
!1140 = distinct !DILexicalBlock(scope: !1135, file: !1116, line: 48, column: 5)
!1141 = !DILocation(line: 50, column: 18, scope: !1142)
!1142 = distinct !DILexicalBlock(scope: !1140, file: !1116, line: 48, column: 29)
!1143 = !DILocation(line: 50, column: 22, scope: !1142)
!1144 = !DILocation(line: 50, column: 11, scope: !1142)
!1145 = !DILocalVariable(name: "u", scope: !1115, file: !1116, line: 21, type: !61)
!1146 = !DILocation(line: 51, column: 22, scope: !1142)
!1147 = !DILocation(line: 51, column: 9, scope: !1142)
!1148 = !DILocation(line: 53, column: 12, scope: !1142)
!1149 = !DILocalVariable(name: "d0", scope: !1115, file: !1116, line: 22, type: !91)
!1150 = !DILocation(line: 55, column: 10, scope: !1142)
!1151 = !DILocation(line: 56, column: 10, scope: !1142)
!1152 = !DILocation(line: 57, column: 14, scope: !1142)
!1153 = !DILocation(line: 57, column: 7, scope: !1142)
!1154 = !DILocation(line: 57, column: 12, scope: !1142)
!1155 = !DILocation(line: 48, column: 25, scope: !1140)
!1156 = !DILocation(line: 48, column: 5, scope: !1140)
!1157 = distinct !{!1157, !1134, !1158, !130}
!1158 = !DILocation(line: 58, column: 5, scope: !1135)
!1159 = !DILocation(line: 60, column: 13, scope: !1136)
!1160 = !DILocation(line: 60, column: 27, scope: !1136)
!1161 = !DILocation(line: 60, column: 32, scope: !1136)
!1162 = !DILocation(line: 60, column: 24, scope: !1136)
!1163 = !DILocation(line: 60, column: 10, scope: !1136)
!1164 = !DILocation(line: 61, column: 18, scope: !1136)
!1165 = !DILocation(line: 61, column: 27, scope: !1136)
!1166 = !DILocation(line: 61, column: 32, scope: !1136)
!1167 = !DILocation(line: 61, column: 24, scope: !1136)
!1168 = !DILocation(line: 61, column: 41, scope: !1136)
!1169 = !DILocation(line: 61, column: 46, scope: !1136)
!1170 = !DILocation(line: 61, column: 38, scope: !1136)
!1171 = !DILocation(line: 61, column: 5, scope: !1136)
!1172 = !DILocation(line: 61, column: 10, scope: !1136)
!1173 = !DILocation(line: 62, column: 18, scope: !1136)
!1174 = !DILocation(line: 62, column: 27, scope: !1136)
!1175 = !DILocation(line: 62, column: 32, scope: !1136)
!1176 = !DILocation(line: 62, column: 24, scope: !1136)
!1177 = !DILocation(line: 62, column: 5, scope: !1136)
!1178 = !DILocation(line: 62, column: 10, scope: !1136)
!1179 = !DILocation(line: 63, column: 18, scope: !1136)
!1180 = !DILocation(line: 63, column: 27, scope: !1136)
!1181 = !DILocation(line: 63, column: 32, scope: !1136)
!1182 = !DILocation(line: 63, column: 24, scope: !1136)
!1183 = !DILocation(line: 63, column: 41, scope: !1136)
!1184 = !DILocation(line: 63, column: 46, scope: !1136)
!1185 = !DILocation(line: 63, column: 38, scope: !1136)
!1186 = !DILocation(line: 63, column: 5, scope: !1136)
!1187 = !DILocation(line: 63, column: 10, scope: !1136)
!1188 = !DILocation(line: 64, column: 18, scope: !1136)
!1189 = !DILocation(line: 64, column: 27, scope: !1136)
!1190 = !DILocation(line: 64, column: 32, scope: !1136)
!1191 = !DILocation(line: 64, column: 24, scope: !1136)
!1192 = !DILocation(line: 64, column: 5, scope: !1136)
!1193 = !DILocation(line: 64, column: 10, scope: !1136)
!1194 = !DILocation(line: 65, column: 7, scope: !1136)
!1195 = !DILocation(line: 47, column: 33, scope: !1132)
!1196 = !DILocation(line: 47, column: 3, scope: !1132)
!1197 = distinct !{!1197, !1133, !1198, !130}
!1198 = !DILocation(line: 66, column: 3, scope: !1129)
!1199 = !DILocation(line: 70, column: 1, scope: !1115)
!1200 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_decompress", scope: !1116, file: !1116, line: 82, type: !1201, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1201 = !DISubroutineType(types: !1202)
!1202 = !{null, !667, !272}
!1203 = !DILocalVariable(name: "r", arg: 1, scope: !1200, file: !1116, line: 82, type: !667)
!1204 = !DILocation(line: 0, scope: !1200)
!1205 = !DILocalVariable(name: "a", arg: 2, scope: !1200, file: !1116, line: 82, type: !272)
!1206 = !DILocalVariable(name: "t", scope: !1200, file: !1116, line: 93, type: !1125)
!1207 = !DILocation(line: 93, column: 11, scope: !1200)
!1208 = !DILocalVariable(name: "i", scope: !1200, file: !1116, line: 83, type: !40)
!1209 = !DILocation(line: 94, column: 8, scope: !1210)
!1210 = distinct !DILexicalBlock(scope: !1200, file: !1116, line: 94, column: 3)
!1211 = !DILocation(line: 94, scope: !1210)
!1212 = !DILocation(line: 94, column: 17, scope: !1213)
!1213 = distinct !DILexicalBlock(scope: !1210, file: !1116, line: 94, column: 3)
!1214 = !DILocation(line: 94, column: 3, scope: !1210)
!1215 = !DILocation(line: 95, column: 13, scope: !1216)
!1216 = distinct !DILexicalBlock(scope: !1213, file: !1116, line: 94, column: 37)
!1217 = !DILocation(line: 95, column: 10, scope: !1216)
!1218 = !DILocation(line: 96, column: 27, scope: !1216)
!1219 = !DILocation(line: 96, column: 24, scope: !1216)
!1220 = !DILocation(line: 96, column: 5, scope: !1216)
!1221 = !DILocation(line: 96, column: 10, scope: !1216)
!1222 = !DILocation(line: 97, column: 18, scope: !1216)
!1223 = !DILocation(line: 97, column: 5, scope: !1216)
!1224 = !DILocation(line: 97, column: 10, scope: !1216)
!1225 = !DILocation(line: 98, column: 13, scope: !1216)
!1226 = !DILocation(line: 98, column: 27, scope: !1216)
!1227 = !DILocation(line: 98, column: 24, scope: !1216)
!1228 = !DILocation(line: 98, column: 5, scope: !1216)
!1229 = !DILocation(line: 98, column: 10, scope: !1216)
!1230 = !DILocation(line: 99, column: 27, scope: !1216)
!1231 = !DILocation(line: 99, column: 24, scope: !1216)
!1232 = !DILocation(line: 99, column: 5, scope: !1216)
!1233 = !DILocation(line: 99, column: 10, scope: !1216)
!1234 = !DILocation(line: 100, column: 18, scope: !1216)
!1235 = !DILocation(line: 100, column: 5, scope: !1216)
!1236 = !DILocation(line: 100, column: 10, scope: !1216)
!1237 = !DILocation(line: 101, column: 13, scope: !1216)
!1238 = !DILocation(line: 101, column: 27, scope: !1216)
!1239 = !DILocation(line: 101, column: 24, scope: !1216)
!1240 = !DILocation(line: 101, column: 5, scope: !1216)
!1241 = !DILocation(line: 101, column: 10, scope: !1216)
!1242 = !DILocation(line: 102, column: 18, scope: !1216)
!1243 = !DILocation(line: 102, column: 5, scope: !1216)
!1244 = !DILocation(line: 102, column: 10, scope: !1216)
!1245 = !DILocalVariable(name: "j", scope: !1200, file: !1116, line: 92, type: !40)
!1246 = !DILocation(line: 105, column: 10, scope: !1247)
!1247 = distinct !DILexicalBlock(scope: !1216, file: !1116, line: 105, column: 5)
!1248 = !DILocation(line: 105, scope: !1247)
!1249 = !DILocation(line: 105, column: 19, scope: !1250)
!1250 = distinct !DILexicalBlock(scope: !1247, file: !1116, line: 105, column: 5)
!1251 = !DILocation(line: 105, column: 5, scope: !1247)
!1252 = !DILocation(line: 106, column: 37, scope: !1250)
!1253 = !DILocation(line: 106, column: 42, scope: !1250)
!1254 = !DILocation(line: 106, column: 48, scope: !1250)
!1255 = !DILocation(line: 106, column: 58, scope: !1250)
!1256 = !DILocation(line: 106, column: 64, scope: !1250)
!1257 = !DILocation(line: 106, column: 25, scope: !1250)
!1258 = !DILocation(line: 106, column: 14, scope: !1250)
!1259 = !DILocation(line: 106, column: 18, scope: !1250)
!1260 = !DILocation(line: 106, column: 7, scope: !1250)
!1261 = !DILocation(line: 106, column: 23, scope: !1250)
!1262 = !DILocation(line: 105, column: 25, scope: !1250)
!1263 = !DILocation(line: 105, column: 5, scope: !1250)
!1264 = distinct !{!1264, !1251, !1265, !130}
!1265 = !DILocation(line: 106, column: 67, scope: !1247)
!1266 = !DILocation(line: 103, column: 7, scope: !1216)
!1267 = !DILocation(line: 94, column: 33, scope: !1213)
!1268 = !DILocation(line: 94, column: 3, scope: !1213)
!1269 = distinct !{!1269, !1214, !1270, !130}
!1270 = !DILocation(line: 107, column: 3, scope: !1210)
!1271 = !DILocation(line: 111, column: 1, scope: !1200)
!1272 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_tobytes", scope: !1116, file: !1116, line: 122, type: !1117, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1273 = !DILocalVariable(name: "r", arg: 1, scope: !1272, file: !1116, line: 122, type: !32)
!1274 = !DILocation(line: 0, scope: !1272)
!1275 = !DILocalVariable(name: "a", arg: 2, scope: !1272, file: !1116, line: 122, type: !1119)
!1276 = !DILocalVariable(name: "i", scope: !1272, file: !1116, line: 123, type: !40)
!1277 = !DILocation(line: 126, column: 8, scope: !1278)
!1278 = distinct !DILexicalBlock(scope: !1272, file: !1116, line: 126, column: 3)
!1279 = !DILocation(line: 126, scope: !1278)
!1280 = !DILocation(line: 126, column: 17, scope: !1281)
!1281 = distinct !DILexicalBlock(scope: !1278, file: !1116, line: 126, column: 3)
!1282 = !DILocation(line: 126, column: 3, scope: !1278)
!1283 = !DILocation(line: 128, column: 17, scope: !1284)
!1284 = distinct !DILexicalBlock(scope: !1281, file: !1116, line: 126, column: 37)
!1285 = !DILocation(line: 128, column: 10, scope: !1284)
!1286 = !DILocalVariable(name: "t0", scope: !1272, file: !1116, line: 124, type: !86)
!1287 = !DILocation(line: 129, column: 31, scope: !1284)
!1288 = !DILocation(line: 129, column: 8, scope: !1284)
!1289 = !DILocation(line: 130, column: 17, scope: !1284)
!1290 = !DILocation(line: 130, column: 21, scope: !1284)
!1291 = !DILocation(line: 130, column: 10, scope: !1284)
!1292 = !DILocalVariable(name: "t1", scope: !1272, file: !1116, line: 124, type: !86)
!1293 = !DILocation(line: 131, column: 31, scope: !1284)
!1294 = !DILocation(line: 131, column: 8, scope: !1284)
!1295 = !DILocation(line: 132, column: 20, scope: !1284)
!1296 = !DILocation(line: 132, column: 9, scope: !1284)
!1297 = !DILocation(line: 132, column: 5, scope: !1284)
!1298 = !DILocation(line: 132, column: 18, scope: !1284)
!1299 = !DILocation(line: 133, column: 24, scope: !1284)
!1300 = !DILocation(line: 133, column: 33, scope: !1284)
!1301 = !DILocation(line: 133, column: 36, scope: !1284)
!1302 = !DILocation(line: 133, column: 30, scope: !1284)
!1303 = !DILocation(line: 133, column: 9, scope: !1284)
!1304 = !DILocation(line: 133, column: 5, scope: !1284)
!1305 = !DILocation(line: 133, column: 18, scope: !1284)
!1306 = !DILocation(line: 134, column: 24, scope: !1284)
!1307 = !DILocation(line: 134, column: 20, scope: !1284)
!1308 = !DILocation(line: 134, column: 9, scope: !1284)
!1309 = !DILocation(line: 134, column: 5, scope: !1284)
!1310 = !DILocation(line: 134, column: 18, scope: !1284)
!1311 = !DILocation(line: 126, column: 33, scope: !1281)
!1312 = !DILocation(line: 126, column: 3, scope: !1281)
!1313 = distinct !{!1313, !1282, !1314, !130}
!1314 = !DILocation(line: 135, column: 3, scope: !1278)
!1315 = !DILocation(line: 136, column: 1, scope: !1272)
!1316 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_frombytes", scope: !1116, file: !1116, line: 148, type: !1201, scopeLine: 148, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1317 = !DILocalVariable(name: "r", arg: 1, scope: !1316, file: !1116, line: 148, type: !667)
!1318 = !DILocation(line: 0, scope: !1316)
!1319 = !DILocalVariable(name: "a", arg: 2, scope: !1316, file: !1116, line: 148, type: !272)
!1320 = !DILocalVariable(name: "i", scope: !1316, file: !1116, line: 149, type: !40)
!1321 = !DILocation(line: 150, column: 8, scope: !1322)
!1322 = distinct !DILexicalBlock(scope: !1316, file: !1116, line: 150, column: 3)
!1323 = !DILocation(line: 150, scope: !1322)
!1324 = !DILocation(line: 150, column: 17, scope: !1325)
!1325 = distinct !DILexicalBlock(scope: !1322, file: !1116, line: 150, column: 3)
!1326 = !DILocation(line: 150, column: 3, scope: !1322)
!1327 = !DILocation(line: 151, column: 25, scope: !1328)
!1328 = distinct !DILexicalBlock(scope: !1325, file: !1116, line: 150, column: 37)
!1329 = !DILocation(line: 151, column: 21, scope: !1328)
!1330 = !DILocation(line: 151, column: 57, scope: !1328)
!1331 = !DILocation(line: 151, column: 53, scope: !1328)
!1332 = !DILocation(line: 151, column: 43, scope: !1328)
!1333 = !DILocation(line: 151, column: 66, scope: !1328)
!1334 = !DILocation(line: 151, column: 73, scope: !1328)
!1335 = !DILocation(line: 151, column: 12, scope: !1328)
!1336 = !DILocation(line: 151, column: 5, scope: !1328)
!1337 = !DILocation(line: 151, column: 17, scope: !1328)
!1338 = !DILocation(line: 153, column: 15, scope: !1328)
!1339 = !DILocation(line: 153, column: 11, scope: !1328)
!1340 = !DILocation(line: 153, column: 24, scope: !1328)
!1341 = !DILocation(line: 153, column: 47, scope: !1328)
!1342 = !DILocation(line: 153, column: 43, scope: !1328)
!1343 = !DILocation(line: 153, column: 33, scope: !1328)
!1344 = !DILocation(line: 153, column: 56, scope: !1328)
!1345 = !DILocation(line: 153, column: 30, scope: !1328)
!1346 = !DILocation(line: 152, column: 12, scope: !1328)
!1347 = !DILocation(line: 152, column: 16, scope: !1328)
!1348 = !DILocation(line: 152, column: 5, scope: !1328)
!1349 = !DILocation(line: 152, column: 21, scope: !1328)
!1350 = !DILocation(line: 150, column: 33, scope: !1325)
!1351 = !DILocation(line: 150, column: 3, scope: !1325)
!1352 = distinct !{!1352, !1326, !1353, !130}
!1353 = !DILocation(line: 154, column: 3, scope: !1322)
!1354 = !DILocation(line: 155, column: 1, scope: !1316)
!1355 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_frommsg", scope: !1116, file: !1116, line: 165, type: !1201, scopeLine: 165, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1356 = !DILocalVariable(name: "r", arg: 1, scope: !1355, file: !1116, line: 165, type: !667)
!1357 = !DILocation(line: 0, scope: !1355)
!1358 = !DILocalVariable(name: "msg", arg: 2, scope: !1355, file: !1116, line: 165, type: !272)
!1359 = !DILocalVariable(name: "i", scope: !1355, file: !1116, line: 166, type: !40)
!1360 = !DILocation(line: 172, column: 8, scope: !1361)
!1361 = distinct !DILexicalBlock(scope: !1355, file: !1116, line: 172, column: 3)
!1362 = !DILocation(line: 172, scope: !1361)
!1363 = !DILocation(line: 172, column: 17, scope: !1364)
!1364 = distinct !DILexicalBlock(scope: !1361, file: !1116, line: 172, column: 3)
!1365 = !DILocation(line: 172, column: 3, scope: !1361)
!1366 = !DILocation(line: 173, column: 5, scope: !1367)
!1367 = distinct !DILexicalBlock(scope: !1368, file: !1116, line: 173, column: 5)
!1368 = distinct !DILexicalBlock(scope: !1364, file: !1116, line: 172, column: 37)
!1369 = !DILocation(line: 173, scope: !1367)
!1370 = !DILocalVariable(name: "j", scope: !1355, file: !1116, line: 166, type: !40)
!1371 = !DILocation(line: 173, column: 19, scope: !1372)
!1372 = distinct !DILexicalBlock(scope: !1367, file: !1116, line: 173, column: 5)
!1373 = !DILocation(line: 174, column: 14, scope: !1374)
!1374 = distinct !DILexicalBlock(scope: !1372, file: !1116, line: 173, column: 29)
!1375 = !DILocation(line: 174, column: 18, scope: !1374)
!1376 = !DILocation(line: 174, column: 7, scope: !1374)
!1377 = !DILocation(line: 174, column: 23, scope: !1374)
!1378 = !DILocation(line: 175, column: 23, scope: !1374)
!1379 = !DILocation(line: 175, column: 31, scope: !1374)
!1380 = !DILocation(line: 175, column: 58, scope: !1374)
!1381 = !DILocation(line: 175, column: 65, scope: !1374)
!1382 = !DILocation(line: 175, column: 57, scope: !1374)
!1383 = !DILocation(line: 175, column: 7, scope: !1374)
!1384 = !DILocation(line: 173, column: 25, scope: !1372)
!1385 = !DILocation(line: 173, column: 5, scope: !1372)
!1386 = distinct !{!1386, !1366, !1387, !130}
!1387 = !DILocation(line: 176, column: 5, scope: !1367)
!1388 = !DILocation(line: 172, column: 33, scope: !1364)
!1389 = !DILocation(line: 172, column: 3, scope: !1364)
!1390 = distinct !{!1390, !1365, !1391, !130}
!1391 = !DILocation(line: 177, column: 3, scope: !1361)
!1392 = !DILocation(line: 178, column: 1, scope: !1355)
!1393 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_tomsg", scope: !1116, file: !1116, line: 188, type: !1117, scopeLine: 188, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1394 = !DILocalVariable(name: "msg", arg: 1, scope: !1393, file: !1116, line: 188, type: !32)
!1395 = !DILocation(line: 0, scope: !1393)
!1396 = !DILocalVariable(name: "a", arg: 2, scope: !1393, file: !1116, line: 188, type: !1119)
!1397 = !DILocalVariable(name: "i", scope: !1393, file: !1116, line: 189, type: !40)
!1398 = !DILocation(line: 192, column: 8, scope: !1399)
!1399 = distinct !DILexicalBlock(scope: !1393, file: !1116, line: 192, column: 3)
!1400 = !DILocation(line: 192, scope: !1399)
!1401 = !DILocation(line: 192, column: 17, scope: !1402)
!1402 = distinct !DILexicalBlock(scope: !1399, file: !1116, line: 192, column: 3)
!1403 = !DILocation(line: 192, column: 3, scope: !1399)
!1404 = !DILocation(line: 193, column: 5, scope: !1405)
!1405 = distinct !DILexicalBlock(scope: !1402, file: !1116, line: 192, column: 37)
!1406 = !DILocation(line: 193, column: 12, scope: !1405)
!1407 = !DILocalVariable(name: "j", scope: !1393, file: !1116, line: 189, type: !40)
!1408 = !DILocation(line: 194, column: 10, scope: !1409)
!1409 = distinct !DILexicalBlock(scope: !1405, file: !1116, line: 194, column: 5)
!1410 = !DILocation(line: 194, scope: !1409)
!1411 = !DILocation(line: 194, column: 19, scope: !1412)
!1412 = distinct !DILexicalBlock(scope: !1409, file: !1116, line: 194, column: 5)
!1413 = !DILocation(line: 194, column: 5, scope: !1409)
!1414 = !DILocation(line: 195, column: 18, scope: !1415)
!1415 = distinct !DILexicalBlock(scope: !1412, file: !1116, line: 194, column: 29)
!1416 = !DILocation(line: 195, column: 22, scope: !1415)
!1417 = !DILocation(line: 195, column: 11, scope: !1415)
!1418 = !DILocalVariable(name: "t", scope: !1393, file: !1116, line: 190, type: !91)
!1419 = !DILocation(line: 200, column: 9, scope: !1415)
!1420 = !DILocation(line: 201, column: 9, scope: !1415)
!1421 = !DILocation(line: 202, column: 9, scope: !1415)
!1422 = !DILocation(line: 203, column: 19, scope: !1415)
!1423 = !DILocation(line: 203, column: 7, scope: !1415)
!1424 = !DILocation(line: 203, column: 14, scope: !1415)
!1425 = !DILocation(line: 194, column: 25, scope: !1412)
!1426 = !DILocation(line: 194, column: 5, scope: !1412)
!1427 = distinct !{!1427, !1413, !1428, !130}
!1428 = !DILocation(line: 204, column: 5, scope: !1409)
!1429 = !DILocation(line: 192, column: 33, scope: !1402)
!1430 = !DILocation(line: 192, column: 3, scope: !1402)
!1431 = distinct !{!1431, !1403, !1432, !130}
!1432 = !DILocation(line: 205, column: 3, scope: !1399)
!1433 = !DILocation(line: 206, column: 1, scope: !1393)
!1434 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_getnoise_eta1", scope: !1116, file: !1116, line: 220, type: !1435, scopeLine: 221, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1435 = !DISubroutineType(types: !1436)
!1436 = !{null, !667, !272, !33}
!1437 = !DILocalVariable(name: "r", arg: 1, scope: !1434, file: !1116, line: 220, type: !667)
!1438 = !DILocation(line: 0, scope: !1434)
!1439 = !DILocalVariable(name: "seed", arg: 2, scope: !1434, file: !1116, line: 220, type: !272)
!1440 = !DILocalVariable(name: "nonce", arg: 3, scope: !1434, file: !1116, line: 221, type: !33)
!1441 = !DILocalVariable(name: "buf", scope: !1434, file: !1116, line: 222, type: !1442)
!1442 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 1024, elements: !64)
!1443 = !DILocation(line: 222, column: 11, scope: !1434)
!1444 = !DILocation(line: 223, column: 3, scope: !1434)
!1445 = !DILocation(line: 224, column: 3, scope: !1434)
!1446 = !DILocation(line: 225, column: 1, scope: !1434)
!1447 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_getnoise_eta2", scope: !1116, file: !1116, line: 239, type: !1435, scopeLine: 240, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1448 = !DILocalVariable(name: "r", arg: 1, scope: !1447, file: !1116, line: 239, type: !667)
!1449 = !DILocation(line: 0, scope: !1447)
!1450 = !DILocalVariable(name: "seed", arg: 2, scope: !1447, file: !1116, line: 239, type: !272)
!1451 = !DILocalVariable(name: "nonce", arg: 3, scope: !1447, file: !1116, line: 240, type: !33)
!1452 = !DILocalVariable(name: "buf", scope: !1447, file: !1116, line: 241, type: !1442)
!1453 = !DILocation(line: 241, column: 11, scope: !1447)
!1454 = !DILocation(line: 242, column: 3, scope: !1447)
!1455 = !DILocation(line: 243, column: 3, scope: !1447)
!1456 = !DILocation(line: 244, column: 1, scope: !1447)
!1457 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_ntt", scope: !1116, file: !1116, line: 256, type: !1458, scopeLine: 256, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1458 = !DISubroutineType(types: !1459)
!1459 = !{null, !667}
!1460 = !DILocalVariable(name: "r", arg: 1, scope: !1457, file: !1116, line: 256, type: !667)
!1461 = !DILocation(line: 0, scope: !1457)
!1462 = !DILocation(line: 257, column: 3, scope: !1457)
!1463 = !DILocation(line: 258, column: 3, scope: !1457)
!1464 = !DILocation(line: 259, column: 1, scope: !1457)
!1465 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_reduce", scope: !1116, file: !1116, line: 314, type: !1458, scopeLine: 314, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1466 = !DILocalVariable(name: "r", arg: 1, scope: !1465, file: !1116, line: 314, type: !667)
!1467 = !DILocation(line: 0, scope: !1465)
!1468 = !DILocalVariable(name: "i", scope: !1465, file: !1116, line: 315, type: !40)
!1469 = !DILocation(line: 316, column: 8, scope: !1470)
!1470 = distinct !DILexicalBlock(scope: !1465, file: !1116, line: 316, column: 3)
!1471 = !DILocation(line: 316, scope: !1470)
!1472 = !DILocation(line: 316, column: 17, scope: !1473)
!1473 = distinct !DILexicalBlock(scope: !1470, file: !1116, line: 316, column: 3)
!1474 = !DILocation(line: 316, column: 3, scope: !1470)
!1475 = !DILocation(line: 317, column: 30, scope: !1473)
!1476 = !DILocation(line: 317, column: 15, scope: !1473)
!1477 = !DILocation(line: 317, column: 5, scope: !1473)
!1478 = !DILocation(line: 317, column: 13, scope: !1473)
!1479 = !DILocation(line: 316, column: 29, scope: !1473)
!1480 = !DILocation(line: 316, column: 3, scope: !1473)
!1481 = distinct !{!1481, !1474, !1482, !130}
!1482 = !DILocation(line: 317, column: 37, scope: !1470)
!1483 = !DILocation(line: 318, column: 1, scope: !1465)
!1484 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_invntt_tomont", scope: !1116, file: !1116, line: 271, type: !1458, scopeLine: 271, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1485 = !DILocalVariable(name: "r", arg: 1, scope: !1484, file: !1116, line: 271, type: !667)
!1486 = !DILocation(line: 0, scope: !1484)
!1487 = !DILocation(line: 271, column: 36, scope: !1484)
!1488 = !DILocation(line: 271, column: 48, scope: !1484)
!1489 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_basemul_montgomery", scope: !1116, file: !1116, line: 282, type: !1490, scopeLine: 282, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1490 = !DISubroutineType(types: !1491)
!1491 = !{null, !667, !1119, !1119}
!1492 = !DILocalVariable(name: "r", arg: 1, scope: !1489, file: !1116, line: 282, type: !667)
!1493 = !DILocation(line: 0, scope: !1489)
!1494 = !DILocalVariable(name: "a", arg: 2, scope: !1489, file: !1116, line: 282, type: !1119)
!1495 = !DILocalVariable(name: "b", arg: 3, scope: !1489, file: !1116, line: 282, type: !1119)
!1496 = !DILocalVariable(name: "i", scope: !1489, file: !1116, line: 283, type: !40)
!1497 = !DILocation(line: 284, column: 8, scope: !1498)
!1498 = distinct !DILexicalBlock(scope: !1489, file: !1116, line: 284, column: 3)
!1499 = !DILocation(line: 284, scope: !1498)
!1500 = !DILocation(line: 284, column: 17, scope: !1501)
!1501 = distinct !DILexicalBlock(scope: !1498, file: !1116, line: 284, column: 3)
!1502 = !DILocation(line: 284, column: 3, scope: !1498)
!1503 = !DILocation(line: 285, column: 21, scope: !1504)
!1504 = distinct !DILexicalBlock(scope: !1501, file: !1116, line: 284, column: 37)
!1505 = !DILocation(line: 285, column: 14, scope: !1504)
!1506 = !DILocation(line: 285, column: 35, scope: !1504)
!1507 = !DILocation(line: 285, column: 28, scope: !1504)
!1508 = !DILocation(line: 285, column: 49, scope: !1504)
!1509 = !DILocation(line: 285, column: 42, scope: !1504)
!1510 = !DILocation(line: 285, column: 64, scope: !1504)
!1511 = !DILocation(line: 285, column: 55, scope: !1504)
!1512 = !DILocation(line: 285, column: 5, scope: !1504)
!1513 = !DILocation(line: 286, column: 21, scope: !1504)
!1514 = !DILocation(line: 286, column: 25, scope: !1504)
!1515 = !DILocation(line: 286, column: 14, scope: !1504)
!1516 = !DILocation(line: 286, column: 39, scope: !1504)
!1517 = !DILocation(line: 286, column: 43, scope: !1504)
!1518 = !DILocation(line: 286, column: 32, scope: !1504)
!1519 = !DILocation(line: 286, column: 57, scope: !1504)
!1520 = !DILocation(line: 286, column: 61, scope: !1504)
!1521 = !DILocation(line: 286, column: 50, scope: !1504)
!1522 = !DILocation(line: 287, column: 23, scope: !1504)
!1523 = !DILocation(line: 287, column: 14, scope: !1504)
!1524 = !DILocation(line: 287, column: 13, scope: !1504)
!1525 = !DILocation(line: 286, column: 5, scope: !1504)
!1526 = !DILocation(line: 284, column: 33, scope: !1501)
!1527 = !DILocation(line: 284, column: 3, scope: !1501)
!1528 = distinct !{!1528, !1502, !1529, !130}
!1529 = !DILocation(line: 288, column: 3, scope: !1498)
!1530 = !DILocation(line: 289, column: 1, scope: !1489)
!1531 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_tomont", scope: !1116, file: !1116, line: 299, type: !1458, scopeLine: 299, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1532 = !DILocalVariable(name: "r", arg: 1, scope: !1531, file: !1116, line: 299, type: !667)
!1533 = !DILocation(line: 0, scope: !1531)
!1534 = !DILocalVariable(name: "f", scope: !1531, file: !1116, line: 301, type: !60)
!1535 = !DILocalVariable(name: "i", scope: !1531, file: !1116, line: 300, type: !40)
!1536 = !DILocation(line: 302, column: 8, scope: !1537)
!1537 = distinct !DILexicalBlock(scope: !1531, file: !1116, line: 302, column: 3)
!1538 = !DILocation(line: 302, scope: !1537)
!1539 = !DILocation(line: 302, column: 17, scope: !1540)
!1540 = distinct !DILexicalBlock(scope: !1537, file: !1116, line: 302, column: 3)
!1541 = !DILocation(line: 302, column: 3, scope: !1537)
!1542 = !DILocation(line: 303, column: 42, scope: !1540)
!1543 = !DILocation(line: 303, column: 33, scope: !1540)
!1544 = !DILocation(line: 303, column: 50, scope: !1540)
!1545 = !DILocation(line: 303, column: 15, scope: !1540)
!1546 = !DILocation(line: 303, column: 5, scope: !1540)
!1547 = !DILocation(line: 303, column: 13, scope: !1540)
!1548 = !DILocation(line: 302, column: 29, scope: !1540)
!1549 = !DILocation(line: 302, column: 3, scope: !1540)
!1550 = distinct !{!1550, !1541, !1551, !130}
!1551 = !DILocation(line: 303, column: 53, scope: !1537)
!1552 = !DILocation(line: 304, column: 1, scope: !1531)
!1553 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_add", scope: !1116, file: !1116, line: 329, type: !1490, scopeLine: 329, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1554 = !DILocalVariable(name: "r", arg: 1, scope: !1553, file: !1116, line: 329, type: !667)
!1555 = !DILocation(line: 0, scope: !1553)
!1556 = !DILocalVariable(name: "a", arg: 2, scope: !1553, file: !1116, line: 329, type: !1119)
!1557 = !DILocalVariable(name: "b", arg: 3, scope: !1553, file: !1116, line: 329, type: !1119)
!1558 = !DILocalVariable(name: "i", scope: !1553, file: !1116, line: 330, type: !40)
!1559 = !DILocation(line: 331, column: 8, scope: !1560)
!1560 = distinct !DILexicalBlock(scope: !1553, file: !1116, line: 331, column: 3)
!1561 = !DILocation(line: 331, scope: !1560)
!1562 = !DILocation(line: 331, column: 17, scope: !1563)
!1563 = distinct !DILexicalBlock(scope: !1560, file: !1116, line: 331, column: 3)
!1564 = !DILocation(line: 331, column: 3, scope: !1560)
!1565 = !DILocation(line: 332, column: 15, scope: !1563)
!1566 = !DILocation(line: 332, column: 25, scope: !1563)
!1567 = !DILocation(line: 332, column: 23, scope: !1563)
!1568 = !DILocation(line: 332, column: 5, scope: !1563)
!1569 = !DILocation(line: 332, column: 13, scope: !1563)
!1570 = !DILocation(line: 331, column: 29, scope: !1563)
!1571 = !DILocation(line: 331, column: 3, scope: !1563)
!1572 = distinct !{!1572, !1564, !1573, !130}
!1573 = !DILocation(line: 332, column: 31, scope: !1560)
!1574 = !DILocation(line: 333, column: 1, scope: !1553)
!1575 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_sub", scope: !1116, file: !1116, line: 344, type: !1490, scopeLine: 344, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1576 = !DILocalVariable(name: "r", arg: 1, scope: !1575, file: !1116, line: 344, type: !667)
!1577 = !DILocation(line: 0, scope: !1575)
!1578 = !DILocalVariable(name: "a", arg: 2, scope: !1575, file: !1116, line: 344, type: !1119)
!1579 = !DILocalVariable(name: "b", arg: 3, scope: !1575, file: !1116, line: 344, type: !1119)
!1580 = !DILocalVariable(name: "i", scope: !1575, file: !1116, line: 345, type: !40)
!1581 = !DILocation(line: 346, column: 8, scope: !1582)
!1582 = distinct !DILexicalBlock(scope: !1575, file: !1116, line: 346, column: 3)
!1583 = !DILocation(line: 346, scope: !1582)
!1584 = !DILocation(line: 346, column: 17, scope: !1585)
!1585 = distinct !DILexicalBlock(scope: !1582, file: !1116, line: 346, column: 3)
!1586 = !DILocation(line: 346, column: 3, scope: !1582)
!1587 = !DILocation(line: 347, column: 15, scope: !1585)
!1588 = !DILocation(line: 347, column: 25, scope: !1585)
!1589 = !DILocation(line: 347, column: 23, scope: !1585)
!1590 = !DILocation(line: 347, column: 5, scope: !1585)
!1591 = !DILocation(line: 347, column: 13, scope: !1585)
!1592 = !DILocation(line: 346, column: 29, scope: !1585)
!1593 = !DILocation(line: 346, column: 3, scope: !1585)
!1594 = distinct !{!1594, !1586, !1595, !130}
!1595 = !DILocation(line: 347, column: 31, scope: !1582)
!1596 = !DILocation(line: 348, column: 1, scope: !1575)
!1597 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_ntt", scope: !58, file: !58, line: 80, type: !1598, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !53, retainedNodes: !49)
!1598 = !DISubroutineType(types: !1599)
!1599 = !{null, !436}
!1600 = !DILocalVariable(name: "r", arg: 1, scope: !1597, file: !58, line: 80, type: !436)
!1601 = !DILocation(line: 0, scope: !1597)
!1602 = !DILocalVariable(name: "k", scope: !1597, file: !58, line: 81, type: !40)
!1603 = !DILocalVariable(name: "len", scope: !1597, file: !58, line: 81, type: !40)
!1604 = !DILocation(line: 85, column: 7, scope: !1605)
!1605 = distinct !DILexicalBlock(scope: !1597, file: !58, line: 85, column: 3)
!1606 = !DILocation(line: 85, scope: !1605)
!1607 = !DILocation(line: 84, column: 5, scope: !1597)
!1608 = !DILocation(line: 85, column: 22, scope: !1609)
!1609 = distinct !DILexicalBlock(scope: !1605, file: !58, line: 85, column: 3)
!1610 = !DILocation(line: 85, column: 3, scope: !1605)
!1611 = !DILocation(line: 86, column: 5, scope: !1612)
!1612 = distinct !DILexicalBlock(scope: !1613, file: !58, line: 86, column: 5)
!1613 = distinct !DILexicalBlock(scope: !1609, file: !58, line: 85, column: 39)
!1614 = !DILocation(line: 86, scope: !1612)
!1615 = !DILocalVariable(name: "start", scope: !1597, file: !58, line: 81, type: !40)
!1616 = !DILocation(line: 86, column: 26, scope: !1617)
!1617 = distinct !DILexicalBlock(scope: !1612, file: !58, line: 86, column: 5)
!1618 = !DILocation(line: 87, column: 14, scope: !1619)
!1619 = distinct !DILexicalBlock(scope: !1617, file: !58, line: 86, column: 50)
!1620 = !DILocalVariable(name: "zeta", scope: !1597, file: !58, line: 82, type: !61)
!1621 = !DILocalVariable(name: "j", scope: !1597, file: !58, line: 81, type: !40)
!1622 = !DILocation(line: 88, column: 11, scope: !1623)
!1623 = distinct !DILexicalBlock(scope: !1619, file: !58, line: 88, column: 7)
!1624 = !DILocation(line: 88, scope: !1623)
!1625 = !DILocation(line: 88, column: 32, scope: !1626)
!1626 = distinct !DILexicalBlock(scope: !1623, file: !58, line: 88, column: 7)
!1627 = !DILocation(line: 88, column: 24, scope: !1626)
!1628 = !DILocation(line: 88, column: 7, scope: !1623)
!1629 = !DILocation(line: 89, column: 25, scope: !1630)
!1630 = distinct !DILexicalBlock(scope: !1626, file: !58, line: 88, column: 44)
!1631 = !DILocation(line: 89, column: 13, scope: !1630)
!1632 = !DILocalVariable(name: "t", scope: !1597, file: !58, line: 82, type: !61)
!1633 = !DILocation(line: 90, column: 22, scope: !1630)
!1634 = !DILocation(line: 90, column: 27, scope: !1630)
!1635 = !DILocation(line: 90, column: 9, scope: !1630)
!1636 = !DILocation(line: 90, column: 20, scope: !1630)
!1637 = !DILocation(line: 91, column: 16, scope: !1630)
!1638 = !DILocation(line: 91, column: 21, scope: !1630)
!1639 = !DILocation(line: 91, column: 9, scope: !1630)
!1640 = !DILocation(line: 91, column: 14, scope: !1630)
!1641 = !DILocation(line: 88, column: 40, scope: !1626)
!1642 = !DILocation(line: 88, column: 7, scope: !1626)
!1643 = distinct !{!1643, !1628, !1644, !130}
!1644 = !DILocation(line: 92, column: 7, scope: !1623)
!1645 = !DILocation(line: 87, column: 21, scope: !1619)
!1646 = !DILocation(line: 86, column: 43, scope: !1617)
!1647 = !DILocation(line: 86, column: 5, scope: !1617)
!1648 = distinct !{!1648, !1611, !1649, !130}
!1649 = !DILocation(line: 93, column: 5, scope: !1612)
!1650 = !DILocation(line: 85, column: 32, scope: !1609)
!1651 = !DILocation(line: 85, column: 3, scope: !1609)
!1652 = distinct !{!1652, !1610, !1653, !130}
!1653 = !DILocation(line: 94, column: 3, scope: !1605)
!1654 = !DILocation(line: 95, column: 1, scope: !1597)
!1655 = distinct !DISubprogram(name: "fqmul", scope: !58, file: !58, line: 68, type: !1656, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !53, retainedNodes: !49)
!1656 = !DISubroutineType(types: !1657)
!1657 = !{!61, !61, !61}
!1658 = !DILocalVariable(name: "a", arg: 1, scope: !1655, file: !58, line: 68, type: !61)
!1659 = !DILocation(line: 0, scope: !1655)
!1660 = !DILocalVariable(name: "b", arg: 2, scope: !1655, file: !58, line: 68, type: !61)
!1661 = !DILocation(line: 69, column: 28, scope: !1655)
!1662 = !DILocation(line: 69, column: 39, scope: !1655)
!1663 = !DILocation(line: 69, column: 38, scope: !1655)
!1664 = !DILocation(line: 69, column: 10, scope: !1655)
!1665 = !DILocation(line: 69, column: 3, scope: !1655)
!1666 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_invntt", scope: !58, file: !58, line: 106, type: !1598, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !53, retainedNodes: !49)
!1667 = !DILocalVariable(name: "r", arg: 1, scope: !1666, file: !58, line: 106, type: !436)
!1668 = !DILocation(line: 0, scope: !1666)
!1669 = !DILocalVariable(name: "f", scope: !1666, file: !58, line: 109, type: !60)
!1670 = !DILocalVariable(name: "k", scope: !1666, file: !58, line: 107, type: !40)
!1671 = !DILocalVariable(name: "len", scope: !1666, file: !58, line: 107, type: !40)
!1672 = !DILocation(line: 112, column: 7, scope: !1673)
!1673 = distinct !DILexicalBlock(scope: !1666, file: !58, line: 112, column: 3)
!1674 = !DILocation(line: 112, scope: !1673)
!1675 = !DILocation(line: 111, column: 5, scope: !1666)
!1676 = !DILocation(line: 112, column: 20, scope: !1677)
!1677 = distinct !DILexicalBlock(scope: !1673, file: !58, line: 112, column: 3)
!1678 = !DILocation(line: 112, column: 3, scope: !1673)
!1679 = !DILocation(line: 113, column: 5, scope: !1680)
!1680 = distinct !DILexicalBlock(scope: !1681, file: !58, line: 113, column: 5)
!1681 = distinct !DILexicalBlock(scope: !1677, file: !58, line: 112, column: 39)
!1682 = !DILocation(line: 124, column: 3, scope: !1683)
!1683 = distinct !DILexicalBlock(scope: !1666, file: !58, line: 124, column: 3)
!1684 = !DILocation(line: 113, scope: !1680)
!1685 = !DILocalVariable(name: "start", scope: !1666, file: !58, line: 107, type: !40)
!1686 = !DILocation(line: 113, column: 26, scope: !1687)
!1687 = distinct !DILexicalBlock(scope: !1680, file: !58, line: 113, column: 5)
!1688 = !DILocation(line: 114, column: 14, scope: !1689)
!1689 = distinct !DILexicalBlock(scope: !1687, file: !58, line: 113, column: 50)
!1690 = !DILocalVariable(name: "zeta", scope: !1666, file: !58, line: 108, type: !61)
!1691 = !DILocalVariable(name: "j", scope: !1666, file: !58, line: 107, type: !40)
!1692 = !DILocation(line: 115, column: 11, scope: !1693)
!1693 = distinct !DILexicalBlock(scope: !1689, file: !58, line: 115, column: 7)
!1694 = !DILocation(line: 115, scope: !1693)
!1695 = !DILocation(line: 115, column: 32, scope: !1696)
!1696 = distinct !DILexicalBlock(scope: !1693, file: !58, line: 115, column: 7)
!1697 = !DILocation(line: 115, column: 24, scope: !1696)
!1698 = !DILocation(line: 115, column: 7, scope: !1693)
!1699 = !DILocation(line: 116, column: 13, scope: !1700)
!1700 = distinct !DILexicalBlock(scope: !1696, file: !58, line: 115, column: 44)
!1701 = !DILocalVariable(name: "t", scope: !1666, file: !58, line: 108, type: !61)
!1702 = !DILocation(line: 117, column: 35, scope: !1700)
!1703 = !DILocation(line: 117, column: 33, scope: !1700)
!1704 = !DILocation(line: 117, column: 16, scope: !1700)
!1705 = !DILocation(line: 117, column: 9, scope: !1700)
!1706 = !DILocation(line: 117, column: 14, scope: !1700)
!1707 = !DILocation(line: 118, column: 22, scope: !1700)
!1708 = !DILocation(line: 118, column: 33, scope: !1700)
!1709 = !DILocation(line: 118, column: 9, scope: !1700)
!1710 = !DILocation(line: 118, column: 20, scope: !1700)
!1711 = !DILocation(line: 119, column: 34, scope: !1700)
!1712 = !DILocation(line: 119, column: 22, scope: !1700)
!1713 = !DILocation(line: 119, column: 9, scope: !1700)
!1714 = !DILocation(line: 119, column: 20, scope: !1700)
!1715 = !DILocation(line: 115, column: 40, scope: !1696)
!1716 = !DILocation(line: 115, column: 7, scope: !1696)
!1717 = distinct !{!1717, !1698, !1718, !130}
!1718 = !DILocation(line: 120, column: 7, scope: !1693)
!1719 = !DILocation(line: 114, column: 21, scope: !1689)
!1720 = !DILocation(line: 113, column: 43, scope: !1687)
!1721 = !DILocation(line: 113, column: 5, scope: !1687)
!1722 = distinct !{!1722, !1679, !1723, !130}
!1723 = !DILocation(line: 121, column: 5, scope: !1680)
!1724 = !DILocation(line: 112, column: 32, scope: !1677)
!1725 = !DILocation(line: 112, column: 3, scope: !1677)
!1726 = distinct !{!1726, !1678, !1727, !130}
!1727 = !DILocation(line: 122, column: 3, scope: !1673)
!1728 = !DILocation(line: 124, scope: !1683)
!1729 = !DILocation(line: 124, column: 16, scope: !1730)
!1730 = distinct !DILexicalBlock(scope: !1683, file: !58, line: 124, column: 3)
!1731 = !DILocation(line: 125, column: 18, scope: !1730)
!1732 = !DILocation(line: 125, column: 12, scope: !1730)
!1733 = !DILocation(line: 125, column: 5, scope: !1730)
!1734 = !DILocation(line: 125, column: 10, scope: !1730)
!1735 = !DILocation(line: 124, column: 24, scope: !1730)
!1736 = !DILocation(line: 124, column: 3, scope: !1730)
!1737 = distinct !{!1737, !1682, !1738, !130}
!1738 = !DILocation(line: 125, column: 25, scope: !1683)
!1739 = !DILocation(line: 126, column: 1, scope: !1666)
!1740 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_basemul", scope: !58, file: !58, line: 139, type: !1741, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !53, retainedNodes: !49)
!1741 = !DISubroutineType(types: !1742)
!1742 = !{null, !436, !1743, !1743, !61}
!1743 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 32)
!1744 = !DILocalVariable(name: "r", arg: 1, scope: !1740, file: !58, line: 139, type: !436)
!1745 = !DILocation(line: 0, scope: !1740)
!1746 = !DILocalVariable(name: "a", arg: 2, scope: !1740, file: !58, line: 139, type: !1743)
!1747 = !DILocalVariable(name: "b", arg: 3, scope: !1740, file: !58, line: 139, type: !1743)
!1748 = !DILocalVariable(name: "zeta", arg: 4, scope: !1740, file: !58, line: 139, type: !61)
!1749 = !DILocation(line: 141, column: 17, scope: !1740)
!1750 = !DILocation(line: 141, column: 23, scope: !1740)
!1751 = !DILocation(line: 141, column: 11, scope: !1740)
!1752 = !DILocation(line: 141, column: 9, scope: !1740)
!1753 = !DILocation(line: 142, column: 11, scope: !1740)
!1754 = !DILocation(line: 142, column: 9, scope: !1740)
!1755 = !DILocation(line: 143, column: 17, scope: !1740)
!1756 = !DILocation(line: 143, column: 23, scope: !1740)
!1757 = !DILocation(line: 143, column: 11, scope: !1740)
!1758 = !DILocation(line: 143, column: 8, scope: !1740)
!1759 = !DILocation(line: 144, column: 17, scope: !1740)
!1760 = !DILocation(line: 144, column: 23, scope: !1740)
!1761 = !DILocation(line: 144, column: 11, scope: !1740)
!1762 = !DILocation(line: 144, column: 3, scope: !1740)
!1763 = !DILocation(line: 144, column: 9, scope: !1740)
!1764 = !DILocation(line: 145, column: 17, scope: !1740)
!1765 = !DILocation(line: 145, column: 23, scope: !1740)
!1766 = !DILocation(line: 145, column: 11, scope: !1740)
!1767 = !DILocation(line: 145, column: 3, scope: !1740)
!1768 = !DILocation(line: 145, column: 8, scope: !1740)
!1769 = !DILocation(line: 146, column: 1, scope: !1740)
!1770 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_cbd_eta1", scope: !1771, file: !1771, line: 105, type: !1201, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !95, retainedNodes: !49)
!1771 = !DIFile(filename: "../../../ref/cbd.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!1772 = !DILocalVariable(name: "r", arg: 1, scope: !1770, file: !1771, line: 105, type: !667)
!1773 = !DILocation(line: 0, scope: !1770)
!1774 = !DILocalVariable(name: "buf", arg: 2, scope: !1770, file: !1771, line: 105, type: !272)
!1775 = !DILocation(line: 107, column: 3, scope: !1770)
!1776 = !DILocation(line: 113, column: 1, scope: !1770)
!1777 = distinct !DISubprogram(name: "cbd2", scope: !1771, file: !1771, line: 55, type: !1201, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !95, retainedNodes: !49)
!1778 = !DILocalVariable(name: "r", arg: 1, scope: !1777, file: !1771, line: 55, type: !667)
!1779 = !DILocation(line: 0, scope: !1777)
!1780 = !DILocalVariable(name: "buf", arg: 2, scope: !1777, file: !1771, line: 55, type: !272)
!1781 = !DILocalVariable(name: "i", scope: !1777, file: !1771, line: 56, type: !40)
!1782 = !DILocation(line: 60, column: 8, scope: !1783)
!1783 = distinct !DILexicalBlock(scope: !1777, file: !1771, line: 60, column: 3)
!1784 = !DILocation(line: 60, scope: !1783)
!1785 = !DILocation(line: 60, column: 17, scope: !1786)
!1786 = distinct !DILexicalBlock(scope: !1783, file: !1771, line: 60, column: 3)
!1787 = !DILocation(line: 60, column: 3, scope: !1783)
!1788 = !DILocation(line: 61, column: 37, scope: !1789)
!1789 = distinct !DILexicalBlock(scope: !1786, file: !1771, line: 60, column: 37)
!1790 = !DILocation(line: 61, column: 33, scope: !1789)
!1791 = !DILocation(line: 61, column: 9, scope: !1789)
!1792 = !DILocalVariable(name: "t", scope: !1777, file: !1771, line: 57, type: !91)
!1793 = !DILocation(line: 62, column: 11, scope: !1789)
!1794 = !DILocalVariable(name: "d", scope: !1777, file: !1771, line: 57, type: !91)
!1795 = !DILocation(line: 63, column: 13, scope: !1789)
!1796 = !DILocation(line: 63, column: 19, scope: !1789)
!1797 = !DILocation(line: 63, column: 7, scope: !1789)
!1798 = !DILocalVariable(name: "j", scope: !1777, file: !1771, line: 56, type: !40)
!1799 = !DILocation(line: 65, column: 10, scope: !1800)
!1800 = distinct !DILexicalBlock(scope: !1789, file: !1771, line: 65, column: 5)
!1801 = !DILocation(line: 65, scope: !1800)
!1802 = !DILocation(line: 65, column: 19, scope: !1803)
!1803 = distinct !DILexicalBlock(scope: !1800, file: !1771, line: 65, column: 5)
!1804 = !DILocation(line: 65, column: 5, scope: !1800)
!1805 = !DILocation(line: 66, column: 20, scope: !1806)
!1806 = distinct !DILexicalBlock(scope: !1803, file: !1771, line: 65, column: 29)
!1807 = !DILocation(line: 66, column: 14, scope: !1806)
!1808 = !DILocation(line: 66, column: 11, scope: !1806)
!1809 = !DILocalVariable(name: "a", scope: !1777, file: !1771, line: 58, type: !61)
!1810 = !DILocation(line: 67, column: 20, scope: !1806)
!1811 = !DILocation(line: 67, column: 24, scope: !1806)
!1812 = !DILocation(line: 67, column: 14, scope: !1806)
!1813 = !DILocation(line: 67, column: 11, scope: !1806)
!1814 = !DILocalVariable(name: "b", scope: !1777, file: !1771, line: 58, type: !61)
!1815 = !DILocation(line: 68, column: 27, scope: !1806)
!1816 = !DILocation(line: 68, column: 25, scope: !1806)
!1817 = !DILocation(line: 68, column: 14, scope: !1806)
!1818 = !DILocation(line: 68, column: 18, scope: !1806)
!1819 = !DILocation(line: 68, column: 7, scope: !1806)
!1820 = !DILocation(line: 68, column: 23, scope: !1806)
!1821 = !DILocation(line: 65, column: 25, scope: !1803)
!1822 = !DILocation(line: 65, column: 5, scope: !1803)
!1823 = distinct !{!1823, !1804, !1824, !130}
!1824 = !DILocation(line: 69, column: 5, scope: !1800)
!1825 = !DILocation(line: 60, column: 33, scope: !1786)
!1826 = !DILocation(line: 60, column: 3, scope: !1786)
!1827 = distinct !{!1827, !1787, !1828, !130}
!1828 = !DILocation(line: 70, column: 3, scope: !1783)
!1829 = !DILocation(line: 71, column: 1, scope: !1777)
!1830 = distinct !DISubprogram(name: "load32_littleendian", scope: !1771, file: !1771, line: 15, type: !1831, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !95, retainedNodes: !49)
!1831 = !DISubroutineType(types: !1832)
!1832 = !{!91, !272}
!1833 = !DILocalVariable(name: "x", arg: 1, scope: !1830, file: !1771, line: 15, type: !272)
!1834 = !DILocation(line: 0, scope: !1830)
!1835 = !DILocation(line: 17, column: 17, scope: !1830)
!1836 = !DILocation(line: 17, column: 7, scope: !1830)
!1837 = !DILocalVariable(name: "r", scope: !1830, file: !1771, line: 16, type: !91)
!1838 = !DILocation(line: 18, column: 18, scope: !1830)
!1839 = !DILocation(line: 18, column: 8, scope: !1830)
!1840 = !DILocation(line: 18, column: 23, scope: !1830)
!1841 = !DILocation(line: 18, column: 5, scope: !1830)
!1842 = !DILocation(line: 19, column: 18, scope: !1830)
!1843 = !DILocation(line: 19, column: 8, scope: !1830)
!1844 = !DILocation(line: 19, column: 23, scope: !1830)
!1845 = !DILocation(line: 19, column: 5, scope: !1830)
!1846 = !DILocation(line: 20, column: 18, scope: !1830)
!1847 = !DILocation(line: 20, column: 8, scope: !1830)
!1848 = !DILocation(line: 20, column: 23, scope: !1830)
!1849 = !DILocation(line: 20, column: 5, scope: !1830)
!1850 = !DILocation(line: 21, column: 3, scope: !1830)
!1851 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_cbd_eta2", scope: !1771, file: !1771, line: 115, type: !1201, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !95, retainedNodes: !49)
!1852 = !DILocalVariable(name: "r", arg: 1, scope: !1851, file: !1771, line: 115, type: !667)
!1853 = !DILocation(line: 0, scope: !1851)
!1854 = !DILocalVariable(name: "buf", arg: 2, scope: !1851, file: !1771, line: 115, type: !272)
!1855 = !DILocation(line: 117, column: 3, scope: !1851)
!1856 = !DILocation(line: 121, column: 1, scope: !1851)
!1857 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_montgomery_reduce", scope: !1858, file: !1858, line: 16, type: !1859, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !97, retainedNodes: !49)
!1858 = !DIFile(filename: "../../../ref/reduce.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!1859 = !DISubroutineType(types: !98)
!1860 = !DILocalVariable(name: "a", arg: 1, scope: !1857, file: !1858, line: 16, type: !55)
!1861 = !DILocation(line: 0, scope: !1857)
!1862 = !DILocalVariable(name: "t", scope: !1857, file: !1858, line: 18, type: !61)
!1863 = !DILocation(line: 21, column: 12, scope: !1857)
!1864 = !DILocation(line: 21, column: 22, scope: !1857)
!1865 = !DILocation(line: 21, column: 10, scope: !1857)
!1866 = !DILocation(line: 21, column: 32, scope: !1857)
!1867 = !DILocation(line: 21, column: 7, scope: !1857)
!1868 = !DILocation(line: 22, column: 3, scope: !1857)
!1869 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_barrett_reduce", scope: !1858, file: !1858, line: 35, type: !1870, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !97, retainedNodes: !49)
!1870 = !DISubroutineType(types: !1871)
!1871 = !{!61, !61}
!1872 = !DILocalVariable(name: "a", arg: 1, scope: !1869, file: !1858, line: 35, type: !61)
!1873 = !DILocation(line: 0, scope: !1869)
!1874 = !DILocalVariable(name: "v", scope: !1869, file: !1858, line: 37, type: !60)
!1875 = !DILocation(line: 39, column: 20, scope: !1869)
!1876 = !DILocation(line: 39, column: 19, scope: !1869)
!1877 = !DILocation(line: 39, column: 22, scope: !1869)
!1878 = !DILocation(line: 39, column: 33, scope: !1869)
!1879 = !DILocalVariable(name: "t", scope: !1869, file: !1858, line: 36, type: !61)
!1880 = !DILocation(line: 41, column: 10, scope: !1869)
!1881 = !DILocation(line: 41, column: 3, scope: !1869)
!1882 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_verify", scope: !1883, file: !1883, line: 16, type: !1884, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !99, retainedNodes: !49)
!1883 = !DIFile(filename: "../../../ref/verify.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!1884 = !DISubroutineType(types: !1885)
!1885 = !{!50, !272, !272, !38}
!1886 = !DILocalVariable(name: "a", arg: 1, scope: !1882, file: !1883, line: 16, type: !272)
!1887 = !DILocation(line: 0, scope: !1882)
!1888 = !DILocalVariable(name: "b", arg: 2, scope: !1882, file: !1883, line: 16, type: !272)
!1889 = !DILocalVariable(name: "len", arg: 3, scope: !1882, file: !1883, line: 16, type: !38)
!1890 = !DILocalVariable(name: "r", scope: !1882, file: !1883, line: 19, type: !33)
!1891 = !DILocalVariable(name: "i", scope: !1882, file: !1883, line: 18, type: !38)
!1892 = !DILocation(line: 21, column: 7, scope: !1893)
!1893 = distinct !DILexicalBlock(scope: !1882, file: !1883, line: 21, column: 3)
!1894 = !DILocation(line: 21, scope: !1893)
!1895 = !DILocation(line: 21, column: 12, scope: !1896)
!1896 = distinct !DILexicalBlock(scope: !1893, file: !1883, line: 21, column: 3)
!1897 = !DILocation(line: 21, column: 3, scope: !1893)
!1898 = !DILocation(line: 22, column: 10, scope: !1896)
!1899 = !DILocation(line: 22, column: 17, scope: !1896)
!1900 = !DILocation(line: 22, column: 15, scope: !1896)
!1901 = !DILocation(line: 22, column: 7, scope: !1896)
!1902 = !DILocation(line: 21, column: 18, scope: !1896)
!1903 = !DILocation(line: 21, column: 3, scope: !1896)
!1904 = distinct !{!1904, !1897, !1905, !130}
!1905 = !DILocation(line: 22, column: 20, scope: !1893)
!1906 = !DILocation(line: 24, column: 25, scope: !1882)
!1907 = !DILocation(line: 24, column: 10, scope: !1882)
!1908 = !DILocation(line: 24, column: 3, scope: !1882)
!1909 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_cmov", scope: !1883, file: !1883, line: 40, type: !1910, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !99, retainedNodes: !49)
!1910 = !DISubroutineType(types: !1911)
!1911 = !{null, !32, !272, !38, !33}
!1912 = !DILocalVariable(name: "r", arg: 1, scope: !1909, file: !1883, line: 40, type: !32)
!1913 = !DILocation(line: 0, scope: !1909)
!1914 = !DILocalVariable(name: "x", arg: 2, scope: !1909, file: !1883, line: 40, type: !272)
!1915 = !DILocalVariable(name: "len", arg: 3, scope: !1909, file: !1883, line: 40, type: !38)
!1916 = !DILocalVariable(name: "b", arg: 4, scope: !1909, file: !1883, line: 40, type: !33)
!1917 = !DILocation(line: 51, column: 3, scope: !1909)
!1918 = !{i64 1722}
!1919 = !DILocation(line: 54, column: 7, scope: !1909)
!1920 = !DILocalVariable(name: "i", scope: !1909, file: !1883, line: 42, type: !38)
!1921 = !DILocation(line: 55, column: 7, scope: !1922)
!1922 = distinct !DILexicalBlock(scope: !1909, file: !1883, line: 55, column: 3)
!1923 = !DILocation(line: 55, scope: !1922)
!1924 = !DILocation(line: 55, column: 12, scope: !1925)
!1925 = distinct !DILexicalBlock(scope: !1922, file: !1883, line: 55, column: 3)
!1926 = !DILocation(line: 55, column: 3, scope: !1922)
!1927 = !DILocation(line: 56, column: 18, scope: !1925)
!1928 = !DILocation(line: 56, column: 25, scope: !1925)
!1929 = !DILocation(line: 56, column: 23, scope: !1925)
!1930 = !DILocation(line: 56, column: 15, scope: !1925)
!1931 = !DILocation(line: 56, column: 5, scope: !1925)
!1932 = !DILocation(line: 56, column: 10, scope: !1925)
!1933 = !DILocation(line: 55, column: 18, scope: !1925)
!1934 = !DILocation(line: 55, column: 3, scope: !1925)
!1935 = distinct !{!1935, !1926, !1936, !130}
!1936 = !DILocation(line: 56, column: 29, scope: !1922)
!1937 = !DILocation(line: 57, column: 1, scope: !1909)
!1938 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_cmov_int16", scope: !1883, file: !1883, line: 71, type: !1939, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !99, retainedNodes: !49)
!1939 = !DISubroutineType(types: !1940)
!1940 = !{null, !436, !61, !86}
!1941 = !DILocalVariable(name: "r", arg: 1, scope: !1938, file: !1883, line: 71, type: !436)
!1942 = !DILocation(line: 0, scope: !1938)
!1943 = !DILocalVariable(name: "v", arg: 2, scope: !1938, file: !1883, line: 71, type: !61)
!1944 = !DILocalVariable(name: "b", arg: 3, scope: !1938, file: !1883, line: 71, type: !86)
!1945 = !DILocation(line: 73, column: 7, scope: !1938)
!1946 = !DILocation(line: 74, column: 15, scope: !1938)
!1947 = !DILocation(line: 74, column: 19, scope: !1938)
!1948 = !DILocation(line: 74, column: 11, scope: !1938)
!1949 = !DILocation(line: 74, column: 6, scope: !1938)
!1950 = !DILocation(line: 75, column: 1, scope: !1938)
!1951 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_init", scope: !74, file: !74, line: 497, type: !1952, scopeLine: 497, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!1952 = !DISubroutineType(types: !1953)
!1953 = !{null, !1954}
!1954 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !384, size: 32)
!1955 = !DILocalVariable(name: "state", arg: 1, scope: !1951, file: !74, line: 497, type: !1954)
!1956 = !DILocation(line: 0, scope: !1951)
!1957 = !DILocation(line: 498, column: 3, scope: !1951)
!1958 = !DILocation(line: 499, column: 3, scope: !1951)
!1959 = !DILocation(line: 499, column: 29, scope: !1951)
!1960 = !DILocation(line: 500, column: 1, scope: !1951)
!1961 = distinct !DISubprogram(name: "keccak_init", scope: !74, file: !74, line: 340, type: !1962, scopeLine: 340, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!1962 = !DISubroutineType(types: !1963)
!1963 = !{null, !1964}
!1964 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 32)
!1965 = !DILocalVariable(name: "s", arg: 1, scope: !1961, file: !74, line: 340, type: !1964)
!1966 = !DILocation(line: 0, scope: !1961)
!1967 = !DILocalVariable(name: "i", scope: !1961, file: !74, line: 341, type: !40)
!1968 = !DILocation(line: 342, column: 8, scope: !1969)
!1969 = distinct !DILexicalBlock(scope: !1961, file: !74, line: 342, column: 3)
!1970 = !DILocation(line: 342, scope: !1969)
!1971 = !DILocation(line: 342, column: 17, scope: !1972)
!1972 = distinct !DILexicalBlock(scope: !1969, file: !74, line: 342, column: 3)
!1973 = !DILocation(line: 342, column: 3, scope: !1969)
!1974 = !DILocation(line: 343, column: 5, scope: !1972)
!1975 = !DILocation(line: 343, column: 10, scope: !1972)
!1976 = !DILocation(line: 342, column: 24, scope: !1972)
!1977 = !DILocation(line: 342, column: 3, scope: !1972)
!1978 = distinct !{!1978, !1973, !1979, !130}
!1979 = !DILocation(line: 343, column: 12, scope: !1969)
!1980 = !DILocation(line: 344, column: 1, scope: !1961)
!1981 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb", scope: !74, file: !74, line: 512, type: !1982, scopeLine: 512, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!1982 = !DISubroutineType(types: !1983)
!1983 = !{null, !1954, !272, !38}
!1984 = !DILocalVariable(name: "state", arg: 1, scope: !1981, file: !74, line: 512, type: !1954)
!1985 = !DILocation(line: 0, scope: !1981)
!1986 = !DILocalVariable(name: "in", arg: 2, scope: !1981, file: !74, line: 512, type: !272)
!1987 = !DILocalVariable(name: "inlen", arg: 3, scope: !1981, file: !74, line: 512, type: !38)
!1988 = !DILocation(line: 513, column: 53, scope: !1981)
!1989 = !DILocation(line: 513, column: 31, scope: !1981)
!1990 = !DILocation(line: 513, column: 3, scope: !1981)
!1991 = !DILocation(line: 513, column: 29, scope: !1981)
!1992 = !DILocation(line: 515, column: 1, scope: !1981)
!1993 = distinct !DISubprogram(name: "keccak_absorb", scope: !74, file: !74, line: 359, type: !1994, scopeLine: 361, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!1994 = !DISubroutineType(types: !1995)
!1995 = !{!40, !1964, !40, !40, !272, !38}
!1996 = !DILocalVariable(name: "s", arg: 1, scope: !1993, file: !74, line: 359, type: !1964)
!1997 = !DILocation(line: 0, scope: !1993)
!1998 = !DILocalVariable(name: "pos", arg: 2, scope: !1993, file: !74, line: 359, type: !40)
!1999 = !DILocalVariable(name: "r", arg: 3, scope: !1993, file: !74, line: 360, type: !40)
!2000 = !DILocalVariable(name: "in", arg: 4, scope: !1993, file: !74, line: 360, type: !272)
!2001 = !DILocalVariable(name: "inlen", arg: 5, scope: !1993, file: !74, line: 361, type: !38)
!2002 = !DILocation(line: 364, column: 3, scope: !1993)
!2003 = !DILocation(line: 364, column: 14, scope: !1993)
!2004 = !DILocation(line: 364, column: 22, scope: !1993)
!2005 = !DILocation(line: 365, column: 5, scope: !2006)
!2006 = distinct !DILexicalBlock(scope: !2007, file: !74, line: 365, column: 5)
!2007 = distinct !DILexicalBlock(scope: !1993, file: !74, line: 364, column: 28)
!2008 = !DILocation(line: 372, column: 3, scope: !2009)
!2009 = distinct !DILexicalBlock(scope: !1993, file: !74, line: 372, column: 3)
!2010 = !DILocation(line: 365, scope: !2006)
!2011 = !DILocalVariable(name: "i", scope: !1993, file: !74, line: 362, type: !40)
!2012 = !DILocation(line: 365, column: 21, scope: !2013)
!2013 = distinct !DILexicalBlock(scope: !2006, file: !74, line: 365, column: 5)
!2014 = !DILocation(line: 366, column: 29, scope: !2013)
!2015 = !DILocation(line: 366, column: 19, scope: !2013)
!2016 = !DILocation(line: 366, column: 40, scope: !2013)
!2017 = !DILocation(line: 366, column: 35, scope: !2013)
!2018 = !DILocation(line: 366, column: 11, scope: !2013)
!2019 = !DILocation(line: 366, column: 7, scope: !2013)
!2020 = !DILocation(line: 366, column: 16, scope: !2013)
!2021 = !DILocation(line: 366, column: 32, scope: !2013)
!2022 = !DILocation(line: 365, column: 27, scope: !2013)
!2023 = !DILocation(line: 365, column: 5, scope: !2013)
!2024 = distinct !{!2024, !2005, !2025, !130}
!2025 = !DILocation(line: 366, column: 48, scope: !2006)
!2026 = !DILocation(line: 367, column: 16, scope: !2007)
!2027 = !DILocation(line: 367, column: 11, scope: !2007)
!2028 = !DILocation(line: 368, column: 5, scope: !2007)
!2029 = distinct !{!2029, !2002, !2030, !130}
!2030 = !DILocation(line: 370, column: 3, scope: !1993)
!2031 = !DILocation(line: 372, scope: !2009)
!2032 = !DILocation(line: 372, column: 25, scope: !2033)
!2033 = distinct !DILexicalBlock(scope: !2009, file: !74, line: 372, column: 3)
!2034 = !DILocation(line: 372, column: 19, scope: !2033)
!2035 = !DILocation(line: 373, column: 27, scope: !2033)
!2036 = !DILocation(line: 373, column: 17, scope: !2033)
!2037 = !DILocation(line: 373, column: 38, scope: !2033)
!2038 = !DILocation(line: 373, column: 33, scope: !2033)
!2039 = !DILocation(line: 373, column: 9, scope: !2033)
!2040 = !DILocation(line: 373, column: 5, scope: !2033)
!2041 = !DILocation(line: 373, column: 14, scope: !2033)
!2042 = !DILocation(line: 373, column: 30, scope: !2033)
!2043 = !DILocation(line: 372, column: 35, scope: !2033)
!2044 = !DILocation(line: 372, column: 3, scope: !2033)
!2045 = distinct !{!2045, !2008, !2046, !130}
!2046 = !DILocation(line: 373, column: 46, scope: !2009)
!2047 = !DILocation(line: 375, column: 3, scope: !1993)
!2048 = distinct !DISubprogram(name: "KeccakF1600_StatePermute", scope: !74, file: !74, line: 70, type: !1962, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2049 = !DILocalVariable(name: "state", arg: 1, scope: !2048, file: !74, line: 70, type: !1964)
!2050 = !DILocation(line: 0, scope: !2048)
!2051 = !DILocation(line: 87, column: 9, scope: !2048)
!2052 = !DILocalVariable(name: "Aba", scope: !2048, file: !74, line: 73, type: !70)
!2053 = !DILocation(line: 88, column: 9, scope: !2048)
!2054 = !DILocalVariable(name: "Abe", scope: !2048, file: !74, line: 73, type: !70)
!2055 = !DILocation(line: 89, column: 9, scope: !2048)
!2056 = !DILocalVariable(name: "Abi", scope: !2048, file: !74, line: 73, type: !70)
!2057 = !DILocation(line: 90, column: 9, scope: !2048)
!2058 = !DILocalVariable(name: "Abo", scope: !2048, file: !74, line: 73, type: !70)
!2059 = !DILocation(line: 91, column: 9, scope: !2048)
!2060 = !DILocalVariable(name: "Abu", scope: !2048, file: !74, line: 73, type: !70)
!2061 = !DILocation(line: 92, column: 9, scope: !2048)
!2062 = !DILocalVariable(name: "Aga", scope: !2048, file: !74, line: 74, type: !70)
!2063 = !DILocation(line: 93, column: 9, scope: !2048)
!2064 = !DILocalVariable(name: "Age", scope: !2048, file: !74, line: 74, type: !70)
!2065 = !DILocation(line: 94, column: 9, scope: !2048)
!2066 = !DILocalVariable(name: "Agi", scope: !2048, file: !74, line: 74, type: !70)
!2067 = !DILocation(line: 95, column: 9, scope: !2048)
!2068 = !DILocalVariable(name: "Ago", scope: !2048, file: !74, line: 74, type: !70)
!2069 = !DILocation(line: 96, column: 9, scope: !2048)
!2070 = !DILocalVariable(name: "Agu", scope: !2048, file: !74, line: 74, type: !70)
!2071 = !DILocation(line: 97, column: 9, scope: !2048)
!2072 = !DILocalVariable(name: "Aka", scope: !2048, file: !74, line: 75, type: !70)
!2073 = !DILocation(line: 98, column: 9, scope: !2048)
!2074 = !DILocalVariable(name: "Ake", scope: !2048, file: !74, line: 75, type: !70)
!2075 = !DILocation(line: 99, column: 9, scope: !2048)
!2076 = !DILocalVariable(name: "Aki", scope: !2048, file: !74, line: 75, type: !70)
!2077 = !DILocation(line: 100, column: 9, scope: !2048)
!2078 = !DILocalVariable(name: "Ako", scope: !2048, file: !74, line: 75, type: !70)
!2079 = !DILocation(line: 101, column: 9, scope: !2048)
!2080 = !DILocalVariable(name: "Aku", scope: !2048, file: !74, line: 75, type: !70)
!2081 = !DILocation(line: 102, column: 9, scope: !2048)
!2082 = !DILocalVariable(name: "Ama", scope: !2048, file: !74, line: 76, type: !70)
!2083 = !DILocation(line: 103, column: 9, scope: !2048)
!2084 = !DILocalVariable(name: "Ame", scope: !2048, file: !74, line: 76, type: !70)
!2085 = !DILocation(line: 104, column: 9, scope: !2048)
!2086 = !DILocalVariable(name: "Ami", scope: !2048, file: !74, line: 76, type: !70)
!2087 = !DILocation(line: 105, column: 9, scope: !2048)
!2088 = !DILocalVariable(name: "Amo", scope: !2048, file: !74, line: 76, type: !70)
!2089 = !DILocation(line: 106, column: 9, scope: !2048)
!2090 = !DILocalVariable(name: "Amu", scope: !2048, file: !74, line: 76, type: !70)
!2091 = !DILocation(line: 107, column: 9, scope: !2048)
!2092 = !DILocalVariable(name: "Asa", scope: !2048, file: !74, line: 77, type: !70)
!2093 = !DILocation(line: 108, column: 9, scope: !2048)
!2094 = !DILocalVariable(name: "Ase", scope: !2048, file: !74, line: 77, type: !70)
!2095 = !DILocation(line: 109, column: 9, scope: !2048)
!2096 = !DILocalVariable(name: "Asi", scope: !2048, file: !74, line: 77, type: !70)
!2097 = !DILocation(line: 110, column: 9, scope: !2048)
!2098 = !DILocalVariable(name: "Aso", scope: !2048, file: !74, line: 77, type: !70)
!2099 = !DILocation(line: 111, column: 9, scope: !2048)
!2100 = !DILocalVariable(name: "Asu", scope: !2048, file: !74, line: 77, type: !70)
!2101 = !DILocalVariable(name: "round", scope: !2048, file: !74, line: 71, type: !50)
!2102 = !DILocation(line: 113, column: 8, scope: !2103)
!2103 = distinct !DILexicalBlock(scope: !2048, file: !74, line: 113, column: 3)
!2104 = !DILocation(line: 113, scope: !2103)
!2105 = !DILocation(line: 113, column: 25, scope: !2106)
!2106 = distinct !DILexicalBlock(scope: !2103, file: !74, line: 113, column: 3)
!2107 = !DILocation(line: 113, column: 3, scope: !2103)
!2108 = !DILocalVariable(name: "BCa", scope: !2048, file: !74, line: 78, type: !70)
!2109 = !DILocalVariable(name: "BCe", scope: !2048, file: !74, line: 78, type: !70)
!2110 = !DILocalVariable(name: "BCi", scope: !2048, file: !74, line: 78, type: !70)
!2111 = !DILocalVariable(name: "BCo", scope: !2048, file: !74, line: 78, type: !70)
!2112 = !DILocalVariable(name: "BCu", scope: !2048, file: !74, line: 78, type: !70)
!2113 = !DILocalVariable(name: "Da", scope: !2048, file: !74, line: 79, type: !70)
!2114 = !DILocalVariable(name: "De", scope: !2048, file: !74, line: 79, type: !70)
!2115 = !DILocalVariable(name: "Di", scope: !2048, file: !74, line: 79, type: !70)
!2116 = !DILocalVariable(name: "Do", scope: !2048, file: !74, line: 79, type: !70)
!2117 = !DILocalVariable(name: "Du", scope: !2048, file: !74, line: 79, type: !70)
!2118 = !DILocalVariable(name: "Eba", scope: !2048, file: !74, line: 80, type: !70)
!2119 = !DILocalVariable(name: "Ebe", scope: !2048, file: !74, line: 80, type: !70)
!2120 = !DILocalVariable(name: "Ebi", scope: !2048, file: !74, line: 80, type: !70)
!2121 = !DILocalVariable(name: "Ebo", scope: !2048, file: !74, line: 80, type: !70)
!2122 = !DILocalVariable(name: "Ebu", scope: !2048, file: !74, line: 80, type: !70)
!2123 = !DILocalVariable(name: "Ega", scope: !2048, file: !74, line: 81, type: !70)
!2124 = !DILocalVariable(name: "Ege", scope: !2048, file: !74, line: 81, type: !70)
!2125 = !DILocalVariable(name: "Egi", scope: !2048, file: !74, line: 81, type: !70)
!2126 = !DILocalVariable(name: "Ego", scope: !2048, file: !74, line: 81, type: !70)
!2127 = !DILocalVariable(name: "Egu", scope: !2048, file: !74, line: 81, type: !70)
!2128 = !DILocalVariable(name: "Eka", scope: !2048, file: !74, line: 82, type: !70)
!2129 = !DILocalVariable(name: "Eke", scope: !2048, file: !74, line: 82, type: !70)
!2130 = !DILocalVariable(name: "Eki", scope: !2048, file: !74, line: 82, type: !70)
!2131 = !DILocalVariable(name: "Eko", scope: !2048, file: !74, line: 82, type: !70)
!2132 = !DILocalVariable(name: "Eku", scope: !2048, file: !74, line: 82, type: !70)
!2133 = !DILocalVariable(name: "Ema", scope: !2048, file: !74, line: 83, type: !70)
!2134 = !DILocalVariable(name: "Eme", scope: !2048, file: !74, line: 83, type: !70)
!2135 = !DILocalVariable(name: "Emi", scope: !2048, file: !74, line: 83, type: !70)
!2136 = !DILocalVariable(name: "Emo", scope: !2048, file: !74, line: 83, type: !70)
!2137 = !DILocalVariable(name: "Emu", scope: !2048, file: !74, line: 83, type: !70)
!2138 = !DILocalVariable(name: "Esa", scope: !2048, file: !74, line: 84, type: !70)
!2139 = !DILocalVariable(name: "Ese", scope: !2048, file: !74, line: 84, type: !70)
!2140 = !DILocalVariable(name: "Esi", scope: !2048, file: !74, line: 84, type: !70)
!2141 = !DILocalVariable(name: "Eso", scope: !2048, file: !74, line: 84, type: !70)
!2142 = !DILocalVariable(name: "Esu", scope: !2048, file: !74, line: 84, type: !70)
!2143 = !DILocation(line: 117, column: 15, scope: !2144)
!2144 = distinct !DILexicalBlock(scope: !2106, file: !74, line: 113, column: 48)
!2145 = !DILocation(line: 117, column: 21, scope: !2144)
!2146 = !DILocation(line: 117, column: 27, scope: !2144)
!2147 = !DILocation(line: 117, column: 33, scope: !2144)
!2148 = !DILocation(line: 119, column: 15, scope: !2144)
!2149 = !DILocation(line: 119, column: 21, scope: !2144)
!2150 = !DILocation(line: 119, column: 27, scope: !2144)
!2151 = !DILocation(line: 119, column: 33, scope: !2144)
!2152 = !DILocation(line: 125, column: 16, scope: !2144)
!2153 = !DILocation(line: 125, column: 14, scope: !2144)
!2154 = !DILocation(line: 195, column: 9, scope: !2144)
!2155 = !DILocation(line: 196, column: 11, scope: !2144)
!2156 = !DILocation(line: 116, column: 15, scope: !2144)
!2157 = !DILocation(line: 116, column: 21, scope: !2144)
!2158 = !DILocation(line: 116, column: 27, scope: !2144)
!2159 = !DILocation(line: 116, column: 33, scope: !2144)
!2160 = !DILocation(line: 122, column: 16, scope: !2144)
!2161 = !DILocation(line: 122, column: 14, scope: !2144)
!2162 = !DILocation(line: 199, column: 9, scope: !2144)
!2163 = !DILocation(line: 200, column: 11, scope: !2144)
!2164 = !DILocation(line: 118, column: 15, scope: !2144)
!2165 = !DILocation(line: 118, column: 21, scope: !2144)
!2166 = !DILocation(line: 118, column: 27, scope: !2144)
!2167 = !DILocation(line: 118, column: 33, scope: !2144)
!2168 = !DILocation(line: 115, column: 15, scope: !2144)
!2169 = !DILocation(line: 115, column: 21, scope: !2144)
!2170 = !DILocation(line: 115, column: 27, scope: !2144)
!2171 = !DILocation(line: 115, column: 33, scope: !2144)
!2172 = !DILocation(line: 126, column: 16, scope: !2144)
!2173 = !DILocation(line: 126, column: 14, scope: !2144)
!2174 = !DILocation(line: 197, column: 9, scope: !2144)
!2175 = !DILocation(line: 198, column: 11, scope: !2144)
!2176 = !DILocation(line: 204, column: 19, scope: !2144)
!2177 = !DILocation(line: 204, column: 25, scope: !2144)
!2178 = !DILocation(line: 204, column: 15, scope: !2144)
!2179 = !DILocation(line: 124, column: 16, scope: !2144)
!2180 = !DILocation(line: 124, column: 14, scope: !2144)
!2181 = !DILocation(line: 132, column: 9, scope: !2144)
!2182 = !DILocation(line: 133, column: 11, scope: !2144)
!2183 = !DILocation(line: 123, column: 16, scope: !2144)
!2184 = !DILocation(line: 123, column: 14, scope: !2144)
!2185 = !DILocation(line: 130, column: 9, scope: !2144)
!2186 = !DILocation(line: 131, column: 11, scope: !2144)
!2187 = !DILocation(line: 138, column: 19, scope: !2144)
!2188 = !DILocation(line: 138, column: 25, scope: !2144)
!2189 = !DILocation(line: 139, column: 22, scope: !2144)
!2190 = !DILocation(line: 139, column: 9, scope: !2144)
!2191 = !DILocation(line: 128, column: 9, scope: !2144)
!2192 = !DILocation(line: 145, column: 9, scope: !2144)
!2193 = !DILocation(line: 146, column: 11, scope: !2144)
!2194 = !DILocation(line: 149, column: 9, scope: !2144)
!2195 = !DILocation(line: 150, column: 11, scope: !2144)
!2196 = !DILocation(line: 147, column: 9, scope: !2144)
!2197 = !DILocation(line: 148, column: 11, scope: !2144)
!2198 = !DILocation(line: 155, column: 19, scope: !2144)
!2199 = !DILocation(line: 155, column: 25, scope: !2144)
!2200 = !DILocation(line: 155, column: 15, scope: !2144)
!2201 = !DILocation(line: 210, column: 15, scope: !2144)
!2202 = !DILocation(line: 161, column: 9, scope: !2144)
!2203 = !DILocation(line: 162, column: 11, scope: !2144)
!2204 = !DILocation(line: 165, column: 9, scope: !2144)
!2205 = !DILocation(line: 166, column: 11, scope: !2144)
!2206 = !DILocation(line: 163, column: 9, scope: !2144)
!2207 = !DILocation(line: 164, column: 11, scope: !2144)
!2208 = !DILocation(line: 171, column: 19, scope: !2144)
!2209 = !DILocation(line: 171, column: 25, scope: !2144)
!2210 = !DILocation(line: 171, column: 15, scope: !2144)
!2211 = !DILocation(line: 210, column: 21, scope: !2144)
!2212 = !DILocation(line: 177, column: 9, scope: !2144)
!2213 = !DILocation(line: 178, column: 11, scope: !2144)
!2214 = !DILocation(line: 181, column: 9, scope: !2144)
!2215 = !DILocation(line: 182, column: 11, scope: !2144)
!2216 = !DILocation(line: 179, column: 9, scope: !2144)
!2217 = !DILocation(line: 180, column: 11, scope: !2144)
!2218 = !DILocation(line: 187, column: 19, scope: !2144)
!2219 = !DILocation(line: 187, column: 25, scope: !2144)
!2220 = !DILocation(line: 187, column: 15, scope: !2144)
!2221 = !DILocation(line: 210, column: 27, scope: !2144)
!2222 = !DILocation(line: 193, column: 9, scope: !2144)
!2223 = !DILocation(line: 194, column: 11, scope: !2144)
!2224 = !DILocation(line: 203, column: 19, scope: !2144)
!2225 = !DILocation(line: 203, column: 25, scope: !2144)
!2226 = !DILocation(line: 203, column: 15, scope: !2144)
!2227 = !DILocation(line: 210, column: 33, scope: !2144)
!2228 = !DILocation(line: 136, column: 9, scope: !2144)
!2229 = !DILocation(line: 137, column: 11, scope: !2144)
!2230 = !DILocation(line: 134, column: 9, scope: !2144)
!2231 = !DILocation(line: 135, column: 11, scope: !2144)
!2232 = !DILocation(line: 141, column: 19, scope: !2144)
!2233 = !DILocation(line: 141, column: 25, scope: !2144)
!2234 = !DILocation(line: 141, column: 15, scope: !2144)
!2235 = !DILocation(line: 153, column: 9, scope: !2144)
!2236 = !DILocation(line: 154, column: 11, scope: !2144)
!2237 = !DILocation(line: 151, column: 9, scope: !2144)
!2238 = !DILocation(line: 152, column: 11, scope: !2144)
!2239 = !DILocation(line: 157, column: 19, scope: !2144)
!2240 = !DILocation(line: 157, column: 25, scope: !2144)
!2241 = !DILocation(line: 157, column: 15, scope: !2144)
!2242 = !DILocation(line: 212, column: 15, scope: !2144)
!2243 = !DILocation(line: 169, column: 9, scope: !2144)
!2244 = !DILocation(line: 170, column: 11, scope: !2144)
!2245 = !DILocation(line: 167, column: 9, scope: !2144)
!2246 = !DILocation(line: 168, column: 11, scope: !2144)
!2247 = !DILocation(line: 173, column: 19, scope: !2144)
!2248 = !DILocation(line: 173, column: 25, scope: !2144)
!2249 = !DILocation(line: 173, column: 15, scope: !2144)
!2250 = !DILocation(line: 212, column: 21, scope: !2144)
!2251 = !DILocation(line: 185, column: 9, scope: !2144)
!2252 = !DILocation(line: 186, column: 11, scope: !2144)
!2253 = !DILocation(line: 183, column: 9, scope: !2144)
!2254 = !DILocation(line: 184, column: 11, scope: !2144)
!2255 = !DILocation(line: 189, column: 19, scope: !2144)
!2256 = !DILocation(line: 189, column: 25, scope: !2144)
!2257 = !DILocation(line: 189, column: 15, scope: !2144)
!2258 = !DILocation(line: 212, column: 27, scope: !2144)
!2259 = !DILocation(line: 201, column: 9, scope: !2144)
!2260 = !DILocation(line: 202, column: 11, scope: !2144)
!2261 = !DILocation(line: 205, column: 19, scope: !2144)
!2262 = !DILocation(line: 205, column: 25, scope: !2144)
!2263 = !DILocation(line: 205, column: 15, scope: !2144)
!2264 = !DILocation(line: 212, column: 33, scope: !2144)
!2265 = !DILocation(line: 218, column: 16, scope: !2144)
!2266 = !DILocation(line: 218, column: 14, scope: !2144)
!2267 = !DILocation(line: 296, column: 9, scope: !2144)
!2268 = !DILocation(line: 297, column: 11, scope: !2144)
!2269 = !DILocation(line: 158, column: 19, scope: !2144)
!2270 = !DILocation(line: 158, column: 25, scope: !2144)
!2271 = !DILocation(line: 158, column: 15, scope: !2144)
!2272 = !DILocation(line: 143, column: 19, scope: !2144)
!2273 = !DILocation(line: 143, column: 25, scope: !2144)
!2274 = !DILocation(line: 143, column: 15, scope: !2144)
!2275 = !DILocation(line: 159, column: 19, scope: !2144)
!2276 = !DILocation(line: 159, column: 25, scope: !2144)
!2277 = !DILocation(line: 159, column: 15, scope: !2144)
!2278 = !DILocation(line: 214, column: 15, scope: !2144)
!2279 = !DILocation(line: 175, column: 19, scope: !2144)
!2280 = !DILocation(line: 175, column: 25, scope: !2144)
!2281 = !DILocation(line: 175, column: 15, scope: !2144)
!2282 = !DILocation(line: 214, column: 21, scope: !2144)
!2283 = !DILocation(line: 191, column: 19, scope: !2144)
!2284 = !DILocation(line: 191, column: 25, scope: !2144)
!2285 = !DILocation(line: 191, column: 15, scope: !2144)
!2286 = !DILocation(line: 214, column: 27, scope: !2144)
!2287 = !DILocation(line: 207, column: 19, scope: !2144)
!2288 = !DILocation(line: 207, column: 25, scope: !2144)
!2289 = !DILocation(line: 207, column: 15, scope: !2144)
!2290 = !DILocation(line: 214, column: 33, scope: !2144)
!2291 = !DILocation(line: 220, column: 16, scope: !2144)
!2292 = !DILocation(line: 220, column: 14, scope: !2144)
!2293 = !DILocation(line: 290, column: 9, scope: !2144)
!2294 = !DILocation(line: 291, column: 11, scope: !2144)
!2295 = !DILocation(line: 140, column: 19, scope: !2144)
!2296 = !DILocation(line: 140, column: 25, scope: !2144)
!2297 = !DILocation(line: 140, column: 15, scope: !2144)
!2298 = !DILocation(line: 156, column: 19, scope: !2144)
!2299 = !DILocation(line: 156, column: 25, scope: !2144)
!2300 = !DILocation(line: 156, column: 15, scope: !2144)
!2301 = !DILocation(line: 211, column: 15, scope: !2144)
!2302 = !DILocation(line: 172, column: 19, scope: !2144)
!2303 = !DILocation(line: 172, column: 25, scope: !2144)
!2304 = !DILocation(line: 172, column: 15, scope: !2144)
!2305 = !DILocation(line: 211, column: 21, scope: !2144)
!2306 = !DILocation(line: 188, column: 19, scope: !2144)
!2307 = !DILocation(line: 188, column: 25, scope: !2144)
!2308 = !DILocation(line: 188, column: 15, scope: !2144)
!2309 = !DILocation(line: 211, column: 27, scope: !2144)
!2310 = !DILocation(line: 211, column: 33, scope: !2144)
!2311 = !DILocation(line: 142, column: 19, scope: !2144)
!2312 = !DILocation(line: 142, column: 25, scope: !2144)
!2313 = !DILocation(line: 142, column: 15, scope: !2144)
!2314 = !DILocation(line: 213, column: 15, scope: !2144)
!2315 = !DILocation(line: 174, column: 19, scope: !2144)
!2316 = !DILocation(line: 174, column: 25, scope: !2144)
!2317 = !DILocation(line: 174, column: 15, scope: !2144)
!2318 = !DILocation(line: 213, column: 21, scope: !2144)
!2319 = !DILocation(line: 190, column: 19, scope: !2144)
!2320 = !DILocation(line: 190, column: 25, scope: !2144)
!2321 = !DILocation(line: 190, column: 15, scope: !2144)
!2322 = !DILocation(line: 213, column: 27, scope: !2144)
!2323 = !DILocation(line: 206, column: 19, scope: !2144)
!2324 = !DILocation(line: 206, column: 25, scope: !2144)
!2325 = !DILocation(line: 206, column: 15, scope: !2144)
!2326 = !DILocation(line: 213, column: 33, scope: !2144)
!2327 = !DILocation(line: 219, column: 16, scope: !2144)
!2328 = !DILocation(line: 219, column: 14, scope: !2144)
!2329 = !DILocation(line: 288, column: 9, scope: !2144)
!2330 = !DILocation(line: 289, column: 11, scope: !2144)
!2331 = !DILocation(line: 302, column: 19, scope: !2144)
!2332 = !DILocation(line: 302, column: 25, scope: !2144)
!2333 = !DILocation(line: 302, column: 15, scope: !2144)
!2334 = !DILocation(line: 217, column: 16, scope: !2144)
!2335 = !DILocation(line: 217, column: 14, scope: !2144)
!2336 = !DILocation(line: 294, column: 9, scope: !2144)
!2337 = !DILocation(line: 295, column: 11, scope: !2144)
!2338 = !DILocation(line: 301, column: 19, scope: !2144)
!2339 = !DILocation(line: 301, column: 25, scope: !2144)
!2340 = !DILocation(line: 301, column: 15, scope: !2144)
!2341 = !DILocation(line: 221, column: 16, scope: !2144)
!2342 = !DILocation(line: 221, column: 14, scope: !2144)
!2343 = !DILocation(line: 292, column: 9, scope: !2144)
!2344 = !DILocation(line: 293, column: 11, scope: !2144)
!2345 = !DILocation(line: 300, column: 19, scope: !2144)
!2346 = !DILocation(line: 300, column: 25, scope: !2144)
!2347 = !DILocation(line: 300, column: 15, scope: !2144)
!2348 = !DILocation(line: 299, column: 19, scope: !2144)
!2349 = !DILocation(line: 299, column: 25, scope: !2144)
!2350 = !DILocation(line: 299, column: 15, scope: !2144)
!2351 = !DILocation(line: 298, column: 19, scope: !2144)
!2352 = !DILocation(line: 298, column: 25, scope: !2144)
!2353 = !DILocation(line: 298, column: 15, scope: !2144)
!2354 = !DILocation(line: 280, column: 9, scope: !2144)
!2355 = !DILocation(line: 281, column: 11, scope: !2144)
!2356 = !DILocation(line: 274, column: 9, scope: !2144)
!2357 = !DILocation(line: 275, column: 11, scope: !2144)
!2358 = !DILocation(line: 272, column: 9, scope: !2144)
!2359 = !DILocation(line: 273, column: 11, scope: !2144)
!2360 = !DILocation(line: 286, column: 19, scope: !2144)
!2361 = !DILocation(line: 286, column: 25, scope: !2144)
!2362 = !DILocation(line: 286, column: 15, scope: !2144)
!2363 = !DILocation(line: 278, column: 9, scope: !2144)
!2364 = !DILocation(line: 279, column: 11, scope: !2144)
!2365 = !DILocation(line: 285, column: 19, scope: !2144)
!2366 = !DILocation(line: 285, column: 25, scope: !2144)
!2367 = !DILocation(line: 285, column: 15, scope: !2144)
!2368 = !DILocation(line: 276, column: 9, scope: !2144)
!2369 = !DILocation(line: 277, column: 11, scope: !2144)
!2370 = !DILocation(line: 284, column: 19, scope: !2144)
!2371 = !DILocation(line: 284, column: 25, scope: !2144)
!2372 = !DILocation(line: 284, column: 15, scope: !2144)
!2373 = !DILocation(line: 283, column: 19, scope: !2144)
!2374 = !DILocation(line: 283, column: 25, scope: !2144)
!2375 = !DILocation(line: 283, column: 15, scope: !2144)
!2376 = !DILocation(line: 282, column: 19, scope: !2144)
!2377 = !DILocation(line: 282, column: 25, scope: !2144)
!2378 = !DILocation(line: 282, column: 15, scope: !2144)
!2379 = !DILocation(line: 264, column: 9, scope: !2144)
!2380 = !DILocation(line: 265, column: 11, scope: !2144)
!2381 = !DILocation(line: 258, column: 9, scope: !2144)
!2382 = !DILocation(line: 259, column: 11, scope: !2144)
!2383 = !DILocation(line: 256, column: 9, scope: !2144)
!2384 = !DILocation(line: 257, column: 11, scope: !2144)
!2385 = !DILocation(line: 270, column: 19, scope: !2144)
!2386 = !DILocation(line: 270, column: 25, scope: !2144)
!2387 = !DILocation(line: 270, column: 15, scope: !2144)
!2388 = !DILocation(line: 262, column: 9, scope: !2144)
!2389 = !DILocation(line: 263, column: 11, scope: !2144)
!2390 = !DILocation(line: 269, column: 19, scope: !2144)
!2391 = !DILocation(line: 269, column: 25, scope: !2144)
!2392 = !DILocation(line: 269, column: 15, scope: !2144)
!2393 = !DILocation(line: 260, column: 9, scope: !2144)
!2394 = !DILocation(line: 261, column: 11, scope: !2144)
!2395 = !DILocation(line: 268, column: 19, scope: !2144)
!2396 = !DILocation(line: 268, column: 25, scope: !2144)
!2397 = !DILocation(line: 268, column: 15, scope: !2144)
!2398 = !DILocation(line: 267, column: 19, scope: !2144)
!2399 = !DILocation(line: 267, column: 25, scope: !2144)
!2400 = !DILocation(line: 267, column: 15, scope: !2144)
!2401 = !DILocation(line: 266, column: 19, scope: !2144)
!2402 = !DILocation(line: 266, column: 25, scope: !2144)
!2403 = !DILocation(line: 266, column: 15, scope: !2144)
!2404 = !DILocation(line: 248, column: 9, scope: !2144)
!2405 = !DILocation(line: 249, column: 11, scope: !2144)
!2406 = !DILocation(line: 242, column: 9, scope: !2144)
!2407 = !DILocation(line: 243, column: 11, scope: !2144)
!2408 = !DILocation(line: 240, column: 9, scope: !2144)
!2409 = !DILocation(line: 241, column: 11, scope: !2144)
!2410 = !DILocation(line: 254, column: 19, scope: !2144)
!2411 = !DILocation(line: 254, column: 25, scope: !2144)
!2412 = !DILocation(line: 254, column: 15, scope: !2144)
!2413 = !DILocation(line: 246, column: 9, scope: !2144)
!2414 = !DILocation(line: 247, column: 11, scope: !2144)
!2415 = !DILocation(line: 253, column: 19, scope: !2144)
!2416 = !DILocation(line: 253, column: 25, scope: !2144)
!2417 = !DILocation(line: 253, column: 15, scope: !2144)
!2418 = !DILocation(line: 244, column: 9, scope: !2144)
!2419 = !DILocation(line: 245, column: 11, scope: !2144)
!2420 = !DILocation(line: 252, column: 19, scope: !2144)
!2421 = !DILocation(line: 252, column: 25, scope: !2144)
!2422 = !DILocation(line: 252, column: 15, scope: !2144)
!2423 = !DILocation(line: 251, column: 19, scope: !2144)
!2424 = !DILocation(line: 251, column: 25, scope: !2144)
!2425 = !DILocation(line: 251, column: 15, scope: !2144)
!2426 = !DILocation(line: 250, column: 19, scope: !2144)
!2427 = !DILocation(line: 250, column: 25, scope: !2144)
!2428 = !DILocation(line: 250, column: 15, scope: !2144)
!2429 = !DILocation(line: 231, column: 9, scope: !2144)
!2430 = !DILocation(line: 232, column: 11, scope: !2144)
!2431 = !DILocation(line: 225, column: 9, scope: !2144)
!2432 = !DILocation(line: 226, column: 11, scope: !2144)
!2433 = !DILocation(line: 223, column: 9, scope: !2144)
!2434 = !DILocation(line: 238, column: 19, scope: !2144)
!2435 = !DILocation(line: 238, column: 25, scope: !2144)
!2436 = !DILocation(line: 238, column: 15, scope: !2144)
!2437 = !DILocation(line: 229, column: 9, scope: !2144)
!2438 = !DILocation(line: 230, column: 11, scope: !2144)
!2439 = !DILocation(line: 237, column: 19, scope: !2144)
!2440 = !DILocation(line: 237, column: 25, scope: !2144)
!2441 = !DILocation(line: 237, column: 15, scope: !2144)
!2442 = !DILocation(line: 227, column: 9, scope: !2144)
!2443 = !DILocation(line: 228, column: 11, scope: !2144)
!2444 = !DILocation(line: 236, column: 19, scope: !2144)
!2445 = !DILocation(line: 236, column: 25, scope: !2144)
!2446 = !DILocation(line: 236, column: 15, scope: !2144)
!2447 = !DILocation(line: 235, column: 19, scope: !2144)
!2448 = !DILocation(line: 235, column: 25, scope: !2144)
!2449 = !DILocation(line: 235, column: 15, scope: !2144)
!2450 = !DILocation(line: 234, column: 51, scope: !2144)
!2451 = !DILocation(line: 234, column: 22, scope: !2144)
!2452 = !DILocation(line: 233, column: 19, scope: !2144)
!2453 = !DILocation(line: 233, column: 25, scope: !2144)
!2454 = !DILocation(line: 234, column: 9, scope: !2144)
!2455 = !DILocation(line: 113, column: 42, scope: !2106)
!2456 = !DILocation(line: 113, column: 3, scope: !2106)
!2457 = distinct !{!2457, !2107, !2458, !130}
!2458 = !DILocation(line: 303, column: 3, scope: !2103)
!2459 = !DILocation(line: 306, column: 12, scope: !2048)
!2460 = !DILocation(line: 307, column: 3, scope: !2048)
!2461 = !DILocation(line: 307, column: 12, scope: !2048)
!2462 = !DILocation(line: 308, column: 3, scope: !2048)
!2463 = !DILocation(line: 308, column: 12, scope: !2048)
!2464 = !DILocation(line: 309, column: 3, scope: !2048)
!2465 = !DILocation(line: 309, column: 12, scope: !2048)
!2466 = !DILocation(line: 310, column: 3, scope: !2048)
!2467 = !DILocation(line: 310, column: 12, scope: !2048)
!2468 = !DILocation(line: 311, column: 3, scope: !2048)
!2469 = !DILocation(line: 311, column: 12, scope: !2048)
!2470 = !DILocation(line: 312, column: 3, scope: !2048)
!2471 = !DILocation(line: 312, column: 12, scope: !2048)
!2472 = !DILocation(line: 313, column: 3, scope: !2048)
!2473 = !DILocation(line: 313, column: 12, scope: !2048)
!2474 = !DILocation(line: 314, column: 3, scope: !2048)
!2475 = !DILocation(line: 314, column: 12, scope: !2048)
!2476 = !DILocation(line: 315, column: 3, scope: !2048)
!2477 = !DILocation(line: 315, column: 12, scope: !2048)
!2478 = !DILocation(line: 316, column: 3, scope: !2048)
!2479 = !DILocation(line: 316, column: 13, scope: !2048)
!2480 = !DILocation(line: 317, column: 3, scope: !2048)
!2481 = !DILocation(line: 317, column: 13, scope: !2048)
!2482 = !DILocation(line: 318, column: 3, scope: !2048)
!2483 = !DILocation(line: 318, column: 13, scope: !2048)
!2484 = !DILocation(line: 319, column: 3, scope: !2048)
!2485 = !DILocation(line: 319, column: 13, scope: !2048)
!2486 = !DILocation(line: 320, column: 3, scope: !2048)
!2487 = !DILocation(line: 320, column: 13, scope: !2048)
!2488 = !DILocation(line: 321, column: 3, scope: !2048)
!2489 = !DILocation(line: 321, column: 13, scope: !2048)
!2490 = !DILocation(line: 322, column: 3, scope: !2048)
!2491 = !DILocation(line: 322, column: 13, scope: !2048)
!2492 = !DILocation(line: 323, column: 3, scope: !2048)
!2493 = !DILocation(line: 323, column: 13, scope: !2048)
!2494 = !DILocation(line: 324, column: 3, scope: !2048)
!2495 = !DILocation(line: 324, column: 13, scope: !2048)
!2496 = !DILocation(line: 325, column: 3, scope: !2048)
!2497 = !DILocation(line: 325, column: 13, scope: !2048)
!2498 = !DILocation(line: 326, column: 3, scope: !2048)
!2499 = !DILocation(line: 326, column: 13, scope: !2048)
!2500 = !DILocation(line: 327, column: 3, scope: !2048)
!2501 = !DILocation(line: 327, column: 13, scope: !2048)
!2502 = !DILocation(line: 328, column: 3, scope: !2048)
!2503 = !DILocation(line: 328, column: 13, scope: !2048)
!2504 = !DILocation(line: 329, column: 3, scope: !2048)
!2505 = !DILocation(line: 329, column: 13, scope: !2048)
!2506 = !DILocation(line: 330, column: 3, scope: !2048)
!2507 = !DILocation(line: 330, column: 13, scope: !2048)
!2508 = !DILocation(line: 331, column: 1, scope: !2048)
!2509 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_finalize", scope: !74, file: !74, line: 524, type: !1952, scopeLine: 524, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2510 = !DILocalVariable(name: "state", arg: 1, scope: !2509, file: !74, line: 524, type: !1954)
!2511 = !DILocation(line: 0, scope: !2509)
!2512 = !DILocation(line: 525, column: 27, scope: !2509)
!2513 = !DILocation(line: 525, column: 3, scope: !2509)
!2514 = !DILocation(line: 526, column: 3, scope: !2509)
!2515 = !DILocation(line: 526, column: 29, scope: !2509)
!2516 = !DILocation(line: 527, column: 1, scope: !2509)
!2517 = distinct !DISubprogram(name: "keccak_finalize", scope: !74, file: !74, line: 388, type: !2518, scopeLine: 389, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2518 = !DISubroutineType(types: !2519)
!2519 = !{null, !1964, !40, !40, !33}
!2520 = !DILocalVariable(name: "s", arg: 1, scope: !2517, file: !74, line: 388, type: !1964)
!2521 = !DILocation(line: 0, scope: !2517)
!2522 = !DILocalVariable(name: "pos", arg: 2, scope: !2517, file: !74, line: 388, type: !40)
!2523 = !DILocalVariable(name: "r", arg: 3, scope: !2517, file: !74, line: 388, type: !40)
!2524 = !DILocalVariable(name: "p", arg: 4, scope: !2517, file: !74, line: 389, type: !33)
!2525 = !DILocation(line: 390, column: 34, scope: !2517)
!2526 = !DILocation(line: 390, column: 29, scope: !2517)
!2527 = !DILocation(line: 390, column: 9, scope: !2517)
!2528 = !DILocation(line: 390, column: 3, scope: !2517)
!2529 = !DILocation(line: 390, column: 14, scope: !2517)
!2530 = !DILocation(line: 391, column: 7, scope: !2517)
!2531 = !DILocation(line: 391, column: 3, scope: !2517)
!2532 = !DILocation(line: 391, column: 16, scope: !2517)
!2533 = !DILocation(line: 392, column: 1, scope: !2517)
!2534 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeeze", scope: !74, file: !74, line: 540, type: !2535, scopeLine: 540, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2535 = !DISubroutineType(types: !2536)
!2536 = !{null, !32, !38, !1954}
!2537 = !DILocalVariable(name: "out", arg: 1, scope: !2534, file: !74, line: 540, type: !32)
!2538 = !DILocation(line: 0, scope: !2534)
!2539 = !DILocalVariable(name: "outlen", arg: 2, scope: !2534, file: !74, line: 540, type: !38)
!2540 = !DILocalVariable(name: "state", arg: 3, scope: !2534, file: !74, line: 540, type: !1954)
!2541 = !DILocation(line: 542, column: 28, scope: !2534)
!2542 = !DILocation(line: 541, column: 31, scope: !2534)
!2543 = !DILocation(line: 541, column: 3, scope: !2534)
!2544 = !DILocation(line: 541, column: 29, scope: !2534)
!2545 = !DILocation(line: 543, column: 1, scope: !2534)
!2546 = distinct !DISubprogram(name: "keccak_squeeze", scope: !74, file: !74, line: 410, type: !2547, scopeLine: 411, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2547 = !DISubroutineType(types: !2548)
!2548 = !{!40, !32, !38, !1964, !40, !40}
!2549 = !DILocalVariable(name: "out", arg: 1, scope: !2546, file: !74, line: 410, type: !32)
!2550 = !DILocation(line: 0, scope: !2546)
!2551 = !DILocalVariable(name: "outlen", arg: 2, scope: !2546, file: !74, line: 410, type: !38)
!2552 = !DILocalVariable(name: "s", arg: 3, scope: !2546, file: !74, line: 410, type: !1964)
!2553 = !DILocalVariable(name: "pos", arg: 4, scope: !2546, file: !74, line: 411, type: !40)
!2554 = !DILocalVariable(name: "r", arg: 5, scope: !2546, file: !74, line: 411, type: !40)
!2555 = !DILocation(line: 414, column: 3, scope: !2546)
!2556 = !DILocation(line: 415, column: 13, scope: !2557)
!2557 = distinct !DILexicalBlock(scope: !2558, file: !74, line: 415, column: 9)
!2558 = distinct !DILexicalBlock(scope: !2546, file: !74, line: 414, column: 18)
!2559 = !DILocation(line: 416, column: 7, scope: !2560)
!2560 = distinct !DILexicalBlock(scope: !2557, file: !74, line: 415, column: 19)
!2561 = !DILocation(line: 418, column: 5, scope: !2560)
!2562 = !DILocalVariable(name: "i", scope: !2546, file: !74, line: 412, type: !40)
!2563 = !DILocation(line: 419, column: 10, scope: !2564)
!2564 = distinct !DILexicalBlock(scope: !2558, file: !74, line: 419, column: 5)
!2565 = !DILocation(line: 419, scope: !2564)
!2566 = !DILocation(line: 419, column: 21, scope: !2567)
!2567 = distinct !DILexicalBlock(scope: !2564, file: !74, line: 419, column: 5)
!2568 = !DILocation(line: 419, column: 25, scope: !2567)
!2569 = !DILocation(line: 419, column: 5, scope: !2564)
!2570 = !DILocation(line: 420, column: 20, scope: !2567)
!2571 = !DILocation(line: 420, column: 16, scope: !2567)
!2572 = !DILocation(line: 420, column: 30, scope: !2567)
!2573 = !DILocation(line: 420, column: 25, scope: !2567)
!2574 = !DILocation(line: 420, column: 14, scope: !2567)
!2575 = !DILocation(line: 420, column: 11, scope: !2567)
!2576 = !DILocation(line: 419, column: 47, scope: !2567)
!2577 = !DILocation(line: 419, column: 5, scope: !2567)
!2578 = distinct !{!2578, !2569, !2579, !130}
!2579 = !DILocation(line: 420, column: 38, scope: !2564)
!2580 = !DILocation(line: 421, column: 17, scope: !2558)
!2581 = !DILocation(line: 421, column: 12, scope: !2558)
!2582 = distinct !{!2582, !2555, !2583, !130}
!2583 = !DILocation(line: 423, column: 3, scope: !2546)
!2584 = !DILocation(line: 425, column: 3, scope: !2546)
!2585 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb_once", scope: !74, file: !74, line: 556, type: !1982, scopeLine: 557, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2586 = !DILocalVariable(name: "state", arg: 1, scope: !2585, file: !74, line: 556, type: !1954)
!2587 = !DILocation(line: 0, scope: !2585)
!2588 = !DILocalVariable(name: "in", arg: 2, scope: !2585, file: !74, line: 556, type: !272)
!2589 = !DILocalVariable(name: "inlen", arg: 3, scope: !2585, file: !74, line: 557, type: !38)
!2590 = !DILocation(line: 558, column: 3, scope: !2585)
!2591 = !DILocation(line: 559, column: 3, scope: !2585)
!2592 = !DILocation(line: 559, column: 29, scope: !2585)
!2593 = !DILocation(line: 560, column: 1, scope: !2585)
!2594 = distinct !DISubprogram(name: "keccak_absorb_once", scope: !74, file: !74, line: 441, type: !2595, scopeLine: 442, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2595 = !DISubroutineType(types: !2596)
!2596 = !{null, !1964, !40, !272, !38, !33}
!2597 = !DILocalVariable(name: "s", arg: 1, scope: !2594, file: !74, line: 441, type: !1964)
!2598 = !DILocation(line: 0, scope: !2594)
!2599 = !DILocalVariable(name: "r", arg: 2, scope: !2594, file: !74, line: 441, type: !40)
!2600 = !DILocalVariable(name: "in", arg: 3, scope: !2594, file: !74, line: 442, type: !272)
!2601 = !DILocalVariable(name: "inlen", arg: 4, scope: !2594, file: !74, line: 442, type: !38)
!2602 = !DILocalVariable(name: "p", arg: 5, scope: !2594, file: !74, line: 442, type: !33)
!2603 = !DILocalVariable(name: "i", scope: !2594, file: !74, line: 443, type: !40)
!2604 = !DILocation(line: 445, column: 8, scope: !2605)
!2605 = distinct !DILexicalBlock(scope: !2594, file: !74, line: 445, column: 3)
!2606 = !DILocation(line: 445, scope: !2605)
!2607 = !DILocation(line: 445, column: 17, scope: !2608)
!2608 = distinct !DILexicalBlock(scope: !2605, file: !74, line: 445, column: 3)
!2609 = !DILocation(line: 445, column: 3, scope: !2605)
!2610 = !DILocation(line: 448, column: 3, scope: !2594)
!2611 = !DILocation(line: 446, column: 5, scope: !2608)
!2612 = !DILocation(line: 446, column: 10, scope: !2608)
!2613 = !DILocation(line: 445, column: 24, scope: !2608)
!2614 = !DILocation(line: 445, column: 3, scope: !2608)
!2615 = distinct !{!2615, !2609, !2616, !130}
!2616 = !DILocation(line: 446, column: 12, scope: !2605)
!2617 = !DILocation(line: 448, column: 16, scope: !2594)
!2618 = !DILocation(line: 449, column: 5, scope: !2619)
!2619 = distinct !DILexicalBlock(scope: !2620, file: !74, line: 449, column: 5)
!2620 = distinct !DILexicalBlock(scope: !2594, file: !74, line: 448, column: 22)
!2621 = !DILocation(line: 456, column: 3, scope: !2622)
!2622 = distinct !DILexicalBlock(scope: !2594, file: !74, line: 456, column: 3)
!2623 = !DILocation(line: 449, scope: !2619)
!2624 = !DILocation(line: 449, column: 19, scope: !2625)
!2625 = distinct !DILexicalBlock(scope: !2619, file: !74, line: 449, column: 5)
!2626 = !DILocation(line: 450, column: 29, scope: !2625)
!2627 = !DILocation(line: 450, column: 25, scope: !2625)
!2628 = !DILocation(line: 450, column: 15, scope: !2625)
!2629 = !DILocation(line: 450, column: 7, scope: !2625)
!2630 = !DILocation(line: 450, column: 12, scope: !2625)
!2631 = !DILocation(line: 449, column: 29, scope: !2625)
!2632 = !DILocation(line: 449, column: 5, scope: !2625)
!2633 = distinct !{!2633, !2618, !2634, !130}
!2634 = !DILocation(line: 450, column: 32, scope: !2619)
!2635 = !DILocation(line: 451, column: 8, scope: !2620)
!2636 = !DILocation(line: 452, column: 11, scope: !2620)
!2637 = !DILocation(line: 453, column: 5, scope: !2620)
!2638 = distinct !{!2638, !2610, !2639, !130}
!2639 = !DILocation(line: 454, column: 3, scope: !2594)
!2640 = !DILocation(line: 456, scope: !2622)
!2641 = !DILocation(line: 456, column: 17, scope: !2642)
!2642 = distinct !DILexicalBlock(scope: !2622, file: !74, line: 456, column: 3)
!2643 = !DILocation(line: 457, column: 27, scope: !2642)
!2644 = !DILocation(line: 457, column: 17, scope: !2642)
!2645 = !DILocation(line: 457, column: 38, scope: !2642)
!2646 = !DILocation(line: 457, column: 33, scope: !2642)
!2647 = !DILocation(line: 457, column: 9, scope: !2642)
!2648 = !DILocation(line: 457, column: 5, scope: !2642)
!2649 = !DILocation(line: 457, column: 14, scope: !2642)
!2650 = !DILocation(line: 456, column: 27, scope: !2642)
!2651 = !DILocation(line: 456, column: 3, scope: !2642)
!2652 = distinct !{!2652, !2621, !2653, !130}
!2653 = !DILocation(line: 457, column: 46, scope: !2622)
!2654 = !DILocation(line: 459, column: 15, scope: !2594)
!2655 = !DILocation(line: 459, column: 32, scope: !2594)
!2656 = !DILocation(line: 459, column: 27, scope: !2594)
!2657 = !DILocation(line: 459, column: 7, scope: !2594)
!2658 = !DILocation(line: 459, column: 3, scope: !2594)
!2659 = !DILocation(line: 459, column: 12, scope: !2594)
!2660 = !DILocation(line: 460, column: 8, scope: !2594)
!2661 = !DILocation(line: 460, column: 13, scope: !2594)
!2662 = !DILocation(line: 460, column: 3, scope: !2594)
!2663 = !DILocation(line: 460, column: 18, scope: !2594)
!2664 = !DILocation(line: 461, column: 1, scope: !2594)
!2665 = distinct !DISubprogram(name: "load64", scope: !74, file: !74, line: 22, type: !2666, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2666 = !DISubroutineType(types: !2667)
!2667 = !{!70, !272}
!2668 = !DILocalVariable(name: "x", arg: 1, scope: !2665, file: !74, line: 22, type: !272)
!2669 = !DILocation(line: 0, scope: !2665)
!2670 = !DILocalVariable(name: "r", scope: !2665, file: !74, line: 24, type: !70)
!2671 = !DILocalVariable(name: "i", scope: !2665, file: !74, line: 23, type: !40)
!2672 = !DILocation(line: 26, column: 8, scope: !2673)
!2673 = distinct !DILexicalBlock(scope: !2665, file: !74, line: 26, column: 3)
!2674 = !DILocation(line: 26, scope: !2673)
!2675 = !DILocation(line: 26, column: 17, scope: !2676)
!2676 = distinct !DILexicalBlock(scope: !2673, file: !74, line: 26, column: 3)
!2677 = !DILocation(line: 26, column: 3, scope: !2673)
!2678 = !DILocation(line: 27, column: 20, scope: !2676)
!2679 = !DILocation(line: 27, column: 10, scope: !2676)
!2680 = !DILocation(line: 27, column: 30, scope: !2676)
!2681 = !DILocation(line: 27, column: 25, scope: !2676)
!2682 = !DILocation(line: 27, column: 7, scope: !2676)
!2683 = !DILocation(line: 26, column: 23, scope: !2676)
!2684 = !DILocation(line: 26, column: 3, scope: !2676)
!2685 = distinct !{!2685, !2677, !2686, !130}
!2686 = !DILocation(line: 27, column: 32, scope: !2673)
!2687 = !DILocation(line: 29, column: 3, scope: !2665)
!2688 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeezeblocks", scope: !74, file: !74, line: 575, type: !2535, scopeLine: 575, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2689 = !DILocalVariable(name: "out", arg: 1, scope: !2688, file: !74, line: 575, type: !32)
!2690 = !DILocation(line: 0, scope: !2688)
!2691 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2688, file: !74, line: 575, type: !38)
!2692 = !DILocalVariable(name: "state", arg: 3, scope: !2688, file: !74, line: 575, type: !1954)
!2693 = !DILocation(line: 576, column: 3, scope: !2688)
!2694 = !DILocation(line: 577, column: 1, scope: !2688)
!2695 = distinct !DISubprogram(name: "keccak_squeezeblocks", scope: !74, file: !74, line: 477, type: !2696, scopeLine: 478, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2696 = !DISubroutineType(types: !2697)
!2697 = !{null, !32, !38, !1964, !40}
!2698 = !DILocalVariable(name: "out", arg: 1, scope: !2695, file: !74, line: 477, type: !32)
!2699 = !DILocation(line: 0, scope: !2695)
!2700 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2695, file: !74, line: 477, type: !38)
!2701 = !DILocalVariable(name: "s", arg: 3, scope: !2695, file: !74, line: 477, type: !1964)
!2702 = !DILocalVariable(name: "r", arg: 4, scope: !2695, file: !74, line: 478, type: !40)
!2703 = !DILocation(line: 481, column: 3, scope: !2695)
!2704 = !DILocation(line: 482, column: 5, scope: !2705)
!2705 = distinct !DILexicalBlock(scope: !2695, file: !74, line: 481, column: 19)
!2706 = !DILocalVariable(name: "i", scope: !2695, file: !74, line: 479, type: !40)
!2707 = !DILocation(line: 483, column: 10, scope: !2708)
!2708 = distinct !DILexicalBlock(scope: !2705, file: !74, line: 483, column: 5)
!2709 = !DILocation(line: 483, scope: !2708)
!2710 = !DILocation(line: 483, column: 19, scope: !2711)
!2711 = distinct !DILexicalBlock(scope: !2708, file: !74, line: 483, column: 5)
!2712 = !DILocation(line: 483, column: 5, scope: !2708)
!2713 = !DILocation(line: 484, column: 23, scope: !2711)
!2714 = !DILocation(line: 484, column: 19, scope: !2711)
!2715 = !DILocation(line: 484, column: 28, scope: !2711)
!2716 = !DILocation(line: 484, column: 7, scope: !2711)
!2717 = !DILocation(line: 483, column: 29, scope: !2711)
!2718 = !DILocation(line: 483, column: 5, scope: !2711)
!2719 = distinct !{!2719, !2712, !2720, !130}
!2720 = !DILocation(line: 484, column: 32, scope: !2708)
!2721 = !DILocation(line: 485, column: 9, scope: !2705)
!2722 = !DILocation(line: 486, column: 13, scope: !2705)
!2723 = distinct !{!2723, !2703, !2724, !130}
!2724 = !DILocation(line: 487, column: 3, scope: !2695)
!2725 = !DILocation(line: 488, column: 1, scope: !2695)
!2726 = distinct !DISubprogram(name: "store64", scope: !74, file: !74, line: 41, type: !2727, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2727 = !DISubroutineType(types: !2728)
!2728 = !{null, !32, !70}
!2729 = !DILocalVariable(name: "x", arg: 1, scope: !2726, file: !74, line: 41, type: !32)
!2730 = !DILocation(line: 0, scope: !2726)
!2731 = !DILocalVariable(name: "u", arg: 2, scope: !2726, file: !74, line: 41, type: !70)
!2732 = !DILocalVariable(name: "i", scope: !2726, file: !74, line: 42, type: !40)
!2733 = !DILocation(line: 44, column: 8, scope: !2734)
!2734 = distinct !DILexicalBlock(scope: !2726, file: !74, line: 44, column: 3)
!2735 = !DILocation(line: 44, scope: !2734)
!2736 = !DILocation(line: 44, column: 17, scope: !2737)
!2737 = distinct !DILexicalBlock(scope: !2734, file: !74, line: 44, column: 3)
!2738 = !DILocation(line: 44, column: 3, scope: !2734)
!2739 = !DILocation(line: 45, column: 19, scope: !2737)
!2740 = !DILocation(line: 45, column: 14, scope: !2737)
!2741 = !DILocation(line: 45, column: 12, scope: !2737)
!2742 = !DILocation(line: 45, column: 5, scope: !2737)
!2743 = !DILocation(line: 45, column: 10, scope: !2737)
!2744 = !DILocation(line: 44, column: 23, scope: !2737)
!2745 = !DILocation(line: 44, column: 3, scope: !2737)
!2746 = distinct !{!2746, !2738, !2747, !130}
!2747 = !DILocation(line: 45, column: 21, scope: !2734)
!2748 = !DILocation(line: 46, column: 1, scope: !2726)
!2749 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_init", scope: !74, file: !74, line: 586, type: !1952, scopeLine: 586, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2750 = !DILocalVariable(name: "state", arg: 1, scope: !2749, file: !74, line: 586, type: !1954)
!2751 = !DILocation(line: 0, scope: !2749)
!2752 = !DILocation(line: 587, column: 3, scope: !2749)
!2753 = !DILocation(line: 588, column: 3, scope: !2749)
!2754 = !DILocation(line: 588, column: 29, scope: !2749)
!2755 = !DILocation(line: 589, column: 1, scope: !2749)
!2756 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb", scope: !74, file: !74, line: 601, type: !1982, scopeLine: 601, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2757 = !DILocalVariable(name: "state", arg: 1, scope: !2756, file: !74, line: 601, type: !1954)
!2758 = !DILocation(line: 0, scope: !2756)
!2759 = !DILocalVariable(name: "in", arg: 2, scope: !2756, file: !74, line: 601, type: !272)
!2760 = !DILocalVariable(name: "inlen", arg: 3, scope: !2756, file: !74, line: 601, type: !38)
!2761 = !DILocation(line: 602, column: 53, scope: !2756)
!2762 = !DILocation(line: 602, column: 31, scope: !2756)
!2763 = !DILocation(line: 602, column: 3, scope: !2756)
!2764 = !DILocation(line: 602, column: 29, scope: !2756)
!2765 = !DILocation(line: 604, column: 1, scope: !2756)
!2766 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_finalize", scope: !74, file: !74, line: 613, type: !1952, scopeLine: 613, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2767 = !DILocalVariable(name: "state", arg: 1, scope: !2766, file: !74, line: 613, type: !1954)
!2768 = !DILocation(line: 0, scope: !2766)
!2769 = !DILocation(line: 614, column: 27, scope: !2766)
!2770 = !DILocation(line: 614, column: 3, scope: !2766)
!2771 = !DILocation(line: 615, column: 3, scope: !2766)
!2772 = !DILocation(line: 615, column: 29, scope: !2766)
!2773 = !DILocation(line: 616, column: 1, scope: !2766)
!2774 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeeze", scope: !74, file: !74, line: 629, type: !2535, scopeLine: 629, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2775 = !DILocalVariable(name: "out", arg: 1, scope: !2774, file: !74, line: 629, type: !32)
!2776 = !DILocation(line: 0, scope: !2774)
!2777 = !DILocalVariable(name: "outlen", arg: 2, scope: !2774, file: !74, line: 629, type: !38)
!2778 = !DILocalVariable(name: "state", arg: 3, scope: !2774, file: !74, line: 629, type: !1954)
!2779 = !DILocation(line: 631, column: 28, scope: !2774)
!2780 = !DILocation(line: 630, column: 31, scope: !2774)
!2781 = !DILocation(line: 630, column: 3, scope: !2774)
!2782 = !DILocation(line: 630, column: 29, scope: !2774)
!2783 = !DILocation(line: 632, column: 1, scope: !2774)
!2784 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb_once", scope: !74, file: !74, line: 645, type: !1982, scopeLine: 646, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2785 = !DILocalVariable(name: "state", arg: 1, scope: !2784, file: !74, line: 645, type: !1954)
!2786 = !DILocation(line: 0, scope: !2784)
!2787 = !DILocalVariable(name: "in", arg: 2, scope: !2784, file: !74, line: 645, type: !272)
!2788 = !DILocalVariable(name: "inlen", arg: 3, scope: !2784, file: !74, line: 646, type: !38)
!2789 = !DILocation(line: 647, column: 3, scope: !2784)
!2790 = !DILocation(line: 648, column: 3, scope: !2784)
!2791 = !DILocation(line: 648, column: 29, scope: !2784)
!2792 = !DILocation(line: 649, column: 1, scope: !2784)
!2793 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeezeblocks", scope: !74, file: !74, line: 664, type: !2535, scopeLine: 664, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2794 = !DILocalVariable(name: "out", arg: 1, scope: !2793, file: !74, line: 664, type: !32)
!2795 = !DILocation(line: 0, scope: !2793)
!2796 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2793, file: !74, line: 664, type: !38)
!2797 = !DILocalVariable(name: "state", arg: 3, scope: !2793, file: !74, line: 664, type: !1954)
!2798 = !DILocation(line: 665, column: 3, scope: !2793)
!2799 = !DILocation(line: 666, column: 1, scope: !2793)
!2800 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128", scope: !74, file: !74, line: 678, type: !2801, scopeLine: 678, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2801 = !DISubroutineType(types: !2802)
!2802 = !{null, !32, !38, !272, !38}
!2803 = !DILocalVariable(name: "out", arg: 1, scope: !2800, file: !74, line: 678, type: !32)
!2804 = !DILocation(line: 0, scope: !2800)
!2805 = !DILocalVariable(name: "outlen", arg: 2, scope: !2800, file: !74, line: 678, type: !38)
!2806 = !DILocalVariable(name: "in", arg: 3, scope: !2800, file: !74, line: 678, type: !272)
!2807 = !DILocalVariable(name: "inlen", arg: 4, scope: !2800, file: !74, line: 678, type: !38)
!2808 = !DILocalVariable(name: "state", scope: !2800, file: !74, line: 680, type: !384)
!2809 = !DILocation(line: 680, column: 16, scope: !2800)
!2810 = !DILocation(line: 682, column: 3, scope: !2800)
!2811 = !DILocation(line: 683, column: 20, scope: !2800)
!2812 = !DILocalVariable(name: "nblocks", scope: !2800, file: !74, line: 679, type: !38)
!2813 = !DILocation(line: 684, column: 3, scope: !2800)
!2814 = !DILocation(line: 685, column: 21, scope: !2800)
!2815 = !DILocation(line: 685, column: 10, scope: !2800)
!2816 = !DILocation(line: 686, column: 18, scope: !2800)
!2817 = !DILocation(line: 686, column: 7, scope: !2800)
!2818 = !DILocation(line: 687, column: 3, scope: !2800)
!2819 = !DILocation(line: 688, column: 1, scope: !2800)
!2820 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256", scope: !74, file: !74, line: 700, type: !2801, scopeLine: 700, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2821 = !DILocalVariable(name: "out", arg: 1, scope: !2820, file: !74, line: 700, type: !32)
!2822 = !DILocation(line: 0, scope: !2820)
!2823 = !DILocalVariable(name: "outlen", arg: 2, scope: !2820, file: !74, line: 700, type: !38)
!2824 = !DILocalVariable(name: "in", arg: 3, scope: !2820, file: !74, line: 700, type: !272)
!2825 = !DILocalVariable(name: "inlen", arg: 4, scope: !2820, file: !74, line: 700, type: !38)
!2826 = !DILocalVariable(name: "state", scope: !2820, file: !74, line: 702, type: !384)
!2827 = !DILocation(line: 702, column: 16, scope: !2820)
!2828 = !DILocation(line: 704, column: 3, scope: !2820)
!2829 = !DILocation(line: 705, column: 20, scope: !2820)
!2830 = !DILocalVariable(name: "nblocks", scope: !2820, file: !74, line: 701, type: !38)
!2831 = !DILocation(line: 706, column: 3, scope: !2820)
!2832 = !DILocation(line: 707, column: 21, scope: !2820)
!2833 = !DILocation(line: 707, column: 10, scope: !2820)
!2834 = !DILocation(line: 708, column: 18, scope: !2820)
!2835 = !DILocation(line: 708, column: 7, scope: !2820)
!2836 = !DILocation(line: 709, column: 3, scope: !2820)
!2837 = !DILocation(line: 710, column: 1, scope: !2820)
!2838 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_256", scope: !74, file: !74, line: 721, type: !2839, scopeLine: 721, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2839 = !DISubroutineType(types: !2840)
!2840 = !{null, !32, !272, !38}
!2841 = !DILocalVariable(name: "h", arg: 1, scope: !2838, file: !74, line: 721, type: !32)
!2842 = !DILocation(line: 0, scope: !2838)
!2843 = !DILocalVariable(name: "in", arg: 2, scope: !2838, file: !74, line: 721, type: !272)
!2844 = !DILocalVariable(name: "inlen", arg: 3, scope: !2838, file: !74, line: 721, type: !38)
!2845 = !DILocalVariable(name: "s", scope: !2838, file: !74, line: 723, type: !2846)
!2846 = !DICompositeType(tag: DW_TAG_array_type, baseType: !70, size: 1600, elements: !2847)
!2847 = !{!2848}
!2848 = !DISubrange(count: 25)
!2849 = !DILocation(line: 723, column: 12, scope: !2838)
!2850 = !DILocation(line: 725, column: 3, scope: !2838)
!2851 = !DILocation(line: 726, column: 3, scope: !2838)
!2852 = !DILocalVariable(name: "i", scope: !2838, file: !74, line: 722, type: !40)
!2853 = !DILocation(line: 727, column: 8, scope: !2854)
!2854 = distinct !DILexicalBlock(scope: !2838, file: !74, line: 727, column: 3)
!2855 = !DILocation(line: 727, scope: !2854)
!2856 = !DILocation(line: 727, column: 17, scope: !2857)
!2857 = distinct !DILexicalBlock(scope: !2854, file: !74, line: 727, column: 3)
!2858 = !DILocation(line: 727, column: 3, scope: !2854)
!2859 = !DILocation(line: 728, column: 19, scope: !2857)
!2860 = !DILocation(line: 728, column: 15, scope: !2857)
!2861 = !DILocation(line: 728, column: 24, scope: !2857)
!2862 = !DILocation(line: 728, column: 5, scope: !2857)
!2863 = !DILocation(line: 727, column: 23, scope: !2857)
!2864 = !DILocation(line: 727, column: 3, scope: !2857)
!2865 = distinct !{!2865, !2858, !2866, !130}
!2866 = !DILocation(line: 728, column: 28, scope: !2854)
!2867 = !DILocation(line: 729, column: 1, scope: !2838)
!2868 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_512", scope: !74, file: !74, line: 740, type: !2839, scopeLine: 740, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2869 = !DILocalVariable(name: "h", arg: 1, scope: !2868, file: !74, line: 740, type: !32)
!2870 = !DILocation(line: 0, scope: !2868)
!2871 = !DILocalVariable(name: "in", arg: 2, scope: !2868, file: !74, line: 740, type: !272)
!2872 = !DILocalVariable(name: "inlen", arg: 3, scope: !2868, file: !74, line: 740, type: !38)
!2873 = !DILocalVariable(name: "s", scope: !2868, file: !74, line: 742, type: !2846)
!2874 = !DILocation(line: 742, column: 12, scope: !2868)
!2875 = !DILocation(line: 744, column: 3, scope: !2868)
!2876 = !DILocation(line: 745, column: 3, scope: !2868)
!2877 = !DILocalVariable(name: "i", scope: !2868, file: !74, line: 741, type: !40)
!2878 = !DILocation(line: 746, column: 8, scope: !2879)
!2879 = distinct !DILexicalBlock(scope: !2868, file: !74, line: 746, column: 3)
!2880 = !DILocation(line: 746, scope: !2879)
!2881 = !DILocation(line: 746, column: 17, scope: !2882)
!2882 = distinct !DILexicalBlock(scope: !2879, file: !74, line: 746, column: 3)
!2883 = !DILocation(line: 746, column: 3, scope: !2879)
!2884 = !DILocation(line: 747, column: 19, scope: !2882)
!2885 = !DILocation(line: 747, column: 15, scope: !2882)
!2886 = !DILocation(line: 747, column: 24, scope: !2882)
!2887 = !DILocation(line: 747, column: 5, scope: !2882)
!2888 = !DILocation(line: 746, column: 23, scope: !2882)
!2889 = !DILocation(line: 746, column: 3, scope: !2882)
!2890 = distinct !{!2890, !2883, !2891, !130}
!2891 = !DILocation(line: 747, column: 28, scope: !2879)
!2892 = !DILocation(line: 748, column: 1, scope: !2868)
!2893 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_kyber_shake128_absorb", scope: !2894, file: !2894, line: 18, type: !2895, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !100, retainedNodes: !49)
!2894 = !DIFile(filename: "../../../ref/symmetric-shake.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!2895 = !DISubroutineType(types: !2896)
!2896 = !{null, !1954, !272, !33, !33}
!2897 = !DILocalVariable(name: "state", arg: 1, scope: !2893, file: !2894, line: 18, type: !1954)
!2898 = !DILocation(line: 0, scope: !2893)
!2899 = !DILocalVariable(name: "seed", arg: 2, scope: !2893, file: !2894, line: 19, type: !272)
!2900 = !DILocalVariable(name: "x", arg: 3, scope: !2893, file: !2894, line: 20, type: !33)
!2901 = !DILocalVariable(name: "y", arg: 4, scope: !2893, file: !2894, line: 21, type: !33)
!2902 = !DILocalVariable(name: "extseed", scope: !2893, file: !2894, line: 23, type: !2903)
!2903 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 272, elements: !2904)
!2904 = !{!2905}
!2905 = !DISubrange(count: 34)
!2906 = !DILocation(line: 23, column: 11, scope: !2893)
!2907 = !DILocation(line: 25, column: 3, scope: !2893)
!2908 = !DILocation(line: 26, column: 3, scope: !2893)
!2909 = !DILocation(line: 26, column: 29, scope: !2893)
!2910 = !DILocation(line: 27, column: 3, scope: !2893)
!2911 = !DILocation(line: 27, column: 29, scope: !2893)
!2912 = !DILocation(line: 29, column: 3, scope: !2893)
!2913 = !DILocation(line: 30, column: 1, scope: !2893)
!2914 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_kyber_shake256_prf", scope: !2894, file: !2894, line: 43, type: !2915, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !100, retainedNodes: !49)
!2915 = !DISubroutineType(types: !2916)
!2916 = !{null, !32, !38, !272, !33}
!2917 = !DILocalVariable(name: "out", arg: 1, scope: !2914, file: !2894, line: 43, type: !32)
!2918 = !DILocation(line: 0, scope: !2914)
!2919 = !DILocalVariable(name: "outlen", arg: 2, scope: !2914, file: !2894, line: 43, type: !38)
!2920 = !DILocalVariable(name: "key", arg: 3, scope: !2914, file: !2894, line: 43, type: !272)
!2921 = !DILocalVariable(name: "nonce", arg: 4, scope: !2914, file: !2894, line: 43, type: !33)
!2922 = !DILocalVariable(name: "extkey", scope: !2914, file: !2894, line: 45, type: !2923)
!2923 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 264, elements: !2924)
!2924 = !{!2925}
!2925 = !DISubrange(count: 33)
!2926 = !DILocation(line: 45, column: 11, scope: !2914)
!2927 = !DILocation(line: 47, column: 3, scope: !2914)
!2928 = !DILocation(line: 48, column: 3, scope: !2914)
!2929 = !DILocation(line: 48, column: 26, scope: !2914)
!2930 = !DILocation(line: 50, column: 3, scope: !2914)
!2931 = !DILocation(line: 51, column: 1, scope: !2914)
!2932 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_kyber_shake256_rkprf", scope: !2894, file: !2894, line: 64, type: !677, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !100, retainedNodes: !49)
!2933 = !DILocalVariable(name: "out", arg: 1, scope: !2932, file: !2894, line: 64, type: !32)
!2934 = !DILocation(line: 0, scope: !2932)
!2935 = !DILocalVariable(name: "key", arg: 2, scope: !2932, file: !2894, line: 64, type: !272)
!2936 = !DILocalVariable(name: "input", arg: 3, scope: !2932, file: !2894, line: 64, type: !272)
!2937 = !DILocalVariable(name: "s", scope: !2932, file: !2894, line: 66, type: !384)
!2938 = !DILocation(line: 66, column: 16, scope: !2932)
!2939 = !DILocation(line: 68, column: 3, scope: !2932)
!2940 = !DILocation(line: 69, column: 3, scope: !2932)
!2941 = !DILocation(line: 70, column: 3, scope: !2932)
!2942 = !DILocation(line: 71, column: 3, scope: !2932)
!2943 = !DILocation(line: 72, column: 3, scope: !2932)
!2944 = !DILocation(line: 73, column: 1, scope: !2932)
