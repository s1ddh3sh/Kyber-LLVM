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
  %tobool.not = icmp eq i32 %call12, 0, !dbg !354
  %conv = zext i1 %tobool.not to i8, !dbg !354
  call void @pqcrystals_kyber1024_ref_cmov(ptr noundef %ss, ptr noundef nonnull %kr, i32 noundef 32, i8 noundef zeroext %conv) #3, !dbg !355
  ret i32 0, !dbg !356
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_gen_matrix(ptr noundef %a, ptr noundef %seed, i32 noundef %transposed) local_unnamed_addr #0 !dbg !357 {
entry:
  %buf = alloca [504 x i8], align 1
  %state = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %a, !378, !DIExpression(), !379)
    #dbg_value(ptr %seed, !380, !DIExpression(), !379)
    #dbg_value(i32 %transposed, !381, !DIExpression(), !379)
    #dbg_declare(ptr %buf, !382, !DIExpression(), !386)
    #dbg_declare(ptr %state, !387, !DIExpression(), !399)
    #dbg_value(i32 0, !400, !DIExpression(), !379)
  br label %for.cond, !dbg !401

for.cond:                                         ; preds = %for.inc20, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc21, %for.inc20 ], !dbg !403
    #dbg_value(i32 %i.0, !400, !DIExpression(), !379)
  %exitcond1 = icmp ne i32 %i.0, 4, !dbg !404
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end22, !dbg !406

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !407

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc
  %j.0 = phi i32 [ %inc, %for.inc ], [ 0, %for.cond1.preheader ], !dbg !410
    #dbg_value(i32 %j.0, !411, !DIExpression(), !379)
  %exitcond = icmp ne i32 %j.0, 4, !dbg !412
  br i1 %exitcond, label %for.body3, label %for.inc20, !dbg !407

for.body3:                                        ; preds = %for.cond1
  %tobool.not = icmp eq i32 %transposed, 0, !dbg !414
  br i1 %tobool.not, label %if.else, label %if.then, !dbg !414

if.then:                                          ; preds = %for.body3
  %conv = trunc nuw i32 %i.0 to i8, !dbg !417
  %conv4 = trunc nuw i32 %j.0 to i8, !dbg !417
  call void @pqcrystals_kyber1024_ref_kyber_shake128_absorb(ptr noundef nonnull %state, ptr noundef %seed, i8 noundef zeroext %conv, i8 noundef zeroext %conv4) #3, !dbg !417
  br label %if.end, !dbg !417

if.else:                                          ; preds = %for.body3
  %conv5 = trunc nuw i32 %j.0 to i8, !dbg !418
  %conv6 = trunc nuw i32 %i.0 to i8, !dbg !418
  call void @pqcrystals_kyber1024_ref_kyber_shake128_absorb(ptr noundef nonnull %state, ptr noundef %seed, i8 noundef zeroext %conv5, i8 noundef zeroext %conv6) #3, !dbg !418
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef nonnull %buf, i32 noundef 3, ptr noundef nonnull %state) #3, !dbg !419
    #dbg_value(i32 504, !420, !DIExpression(), !379)
  %arrayidx = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 %i.0, !dbg !421
  %arrayidx7 = getelementptr inbounds nuw [4 x %struct.poly], ptr %arrayidx, i32 0, i32 %j.0, !dbg !421
  %call = call fastcc i32 @rej_uniform(ptr noundef %arrayidx7, i32 noundef 256, ptr noundef nonnull %buf, i32 noundef 504) #3, !dbg !422
    #dbg_value(i32 %call, !423, !DIExpression(), !379)
  br label %while.cond, !dbg !424

while.cond:                                       ; preds = %while.body, %if.end
  %ctr.0 = phi i32 [ %call, %if.end ], [ %add, %while.body ], !dbg !425
    #dbg_value(i32 %ctr.0, !423, !DIExpression(), !379)
  %cmp10 = icmp ult i32 %ctr.0, 256, !dbg !426
  br i1 %cmp10, label %while.body, label %for.inc, !dbg !424

while.body:                                       ; preds = %while.cond
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef nonnull %buf, i32 noundef 1, ptr noundef nonnull %state) #3, !dbg !427
    #dbg_value(i32 168, !420, !DIExpression(), !379)
  %arrayidx13 = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 %i.0, !dbg !429
  %arrayidx15 = getelementptr inbounds nuw [4 x %struct.poly], ptr %arrayidx13, i32 0, i32 %j.0, !dbg !429
  %add.ptr = getelementptr inbounds nuw i16, ptr %arrayidx15, i32 %ctr.0, !dbg !430
  %sub = sub nuw nsw i32 256, %ctr.0, !dbg !431
  %call19 = call fastcc i32 @rej_uniform(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef nonnull %buf, i32 noundef 168) #3, !dbg !432
  %add = add i32 %ctr.0, %call19, !dbg !433
    #dbg_value(i32 %add, !423, !DIExpression(), !379)
  br label %while.cond, !dbg !424, !llvm.loop !434

for.inc:                                          ; preds = %while.cond
  %inc = add nuw nsw i32 %j.0, 1, !dbg !436
    #dbg_value(i32 %inc, !411, !DIExpression(), !379)
  br label %for.cond1, !dbg !437, !llvm.loop !438

for.inc20:                                        ; preds = %for.cond1
  %inc21 = add nuw nsw i32 %i.0, 1, !dbg !440
    #dbg_value(i32 %inc21, !400, !DIExpression(), !379)
  br label %for.cond, !dbg !441, !llvm.loop !442

for.end22:                                        ; preds = %for.cond
  ret void, !dbg !444
}

; Function Attrs: nounwind
define internal fastcc i32 @rej_uniform(ptr noundef %r, i32 noundef %len, ptr noundef %buf, i32 noundef %buflen) unnamed_addr #0 !dbg !445 {
entry:
    #dbg_value(ptr %r, !449, !DIExpression(), !450)
    #dbg_value(i32 %len, !451, !DIExpression(), !450)
    #dbg_value(ptr %buf, !452, !DIExpression(), !450)
    #dbg_value(i32 %buflen, !453, !DIExpression(), !450)
    #dbg_value(i32 0, !454, !DIExpression(), !450)
    #dbg_value(i32 0, !455, !DIExpression(), !450)
  br label %while.cond, !dbg !456

while.cond:                                       ; preds = %if.end33, %entry
  %ctr.0 = phi i32 [ 0, %entry ], [ %ctr.2, %if.end33 ], !dbg !450
  %pos.0 = phi i32 [ 0, %entry ], [ %add20, %if.end33 ], !dbg !450
    #dbg_value(i32 %pos.0, !454, !DIExpression(), !450)
    #dbg_value(i32 %ctr.0, !455, !DIExpression(), !450)
  %cmp = icmp ult i32 %ctr.0, %len, !dbg !457
  %add = add i32 %pos.0, 3, !dbg !458
  %cmp1 = icmp ule i32 %add, %buflen, !dbg !458
  %0 = select i1 %cmp, i1 %cmp1, i1 false, !dbg !458
  br i1 %0, label %while.body, label %while.end, !dbg !456

while.body:                                       ; preds = %while.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %buf, i32 %pos.0, !dbg !459
  %1 = load i8, ptr %arrayidx, align 1, !dbg !459
  %conv = zext i8 %1 to i16, !dbg !459
  %2 = getelementptr i8, ptr %buf, i32 %pos.0, !dbg !461
  %arrayidx4 = getelementptr i8, ptr %2, i32 1, !dbg !461
  %3 = load i8, ptr %arrayidx4, align 1, !dbg !461
  %conv6 = zext i8 %3 to i16, !dbg !462
  %shl = shl nuw i16 %conv6, 8, !dbg !463
  %shl.masked = and i16 %shl, 3840, !dbg !464
  %and = or disjoint i16 %shl.masked, %conv, !dbg !464
    #dbg_value(i16 %and, !465, !DIExpression(), !450)
  %4 = getelementptr i8, ptr %buf, i32 %pos.0, !dbg !466
  %arrayidx9 = getelementptr i8, ptr %4, i32 1, !dbg !466
  %5 = load i8, ptr %arrayidx9, align 1, !dbg !466
  %6 = lshr i8 %5, 4, !dbg !467
  %shr11 = zext nneg i8 %6 to i16, !dbg !467
  %7 = getelementptr i8, ptr %buf, i32 %pos.0, !dbg !468
  %arrayidx13 = getelementptr i8, ptr %7, i32 2, !dbg !468
  %8 = load i8, ptr %arrayidx13, align 1, !dbg !468
  %conv15 = zext i8 %8 to i16, !dbg !469
  %shl16 = shl nuw nsw i16 %conv15, 4, !dbg !470
  %or17 = or disjoint i16 %shl16, %shr11, !dbg !471
    #dbg_value(i16 %or17, !472, !DIExpression(), !450)
  %add20 = add i32 %pos.0, 3, !dbg !473
    #dbg_value(i32 %add20, !454, !DIExpression(), !450)
  %cmp22 = icmp samesign ult i16 %and, 3329, !dbg !474
  br i1 %cmp22, label %if.then, label %if.end, !dbg !474

if.then:                                          ; preds = %while.body
  %inc = add nuw i32 %ctr.0, 1, !dbg !476
    #dbg_value(i32 %inc, !455, !DIExpression(), !450)
  %arrayidx24 = getelementptr inbounds nuw i16, ptr %r, i32 %ctr.0, !dbg !477
  store i16 %and, ptr %arrayidx24, align 2, !dbg !478
  br label %if.end, !dbg !477

if.end:                                           ; preds = %if.then, %while.body
  %ctr.1 = phi i32 [ %inc, %if.then ], [ %ctr.0, %while.body ], !dbg !450
    #dbg_value(i32 %ctr.1, !455, !DIExpression(), !450)
  %cmp25 = icmp ult i32 %ctr.1, %len, !dbg !479
  %cmp28 = icmp samesign ult i16 %or17, 3329
  %or.cond = select i1 %cmp25, i1 %cmp28, i1 false, !dbg !481
  br i1 %or.cond, label %if.then30, label %if.end33, !dbg !481

if.then30:                                        ; preds = %if.end
  %inc31 = add nuw i32 %ctr.1, 1, !dbg !482
    #dbg_value(i32 %inc31, !455, !DIExpression(), !450)
  %arrayidx32 = getelementptr inbounds nuw i16, ptr %r, i32 %ctr.1, !dbg !483
  store i16 %or17, ptr %arrayidx32, align 2, !dbg !484
  br label %if.end33, !dbg !483

if.end33:                                         ; preds = %if.then30, %if.end
  %ctr.2 = phi i32 [ %inc31, %if.then30 ], [ %ctr.1, %if.end ], !dbg !485
    #dbg_value(i32 %ctr.2, !455, !DIExpression(), !450)
  br label %while.cond, !dbg !456, !llvm.loop !486

while.end:                                        ; preds = %while.cond
  %ctr.0.lcssa = phi i32 [ %ctr.0, %while.cond ], !dbg !450
  ret i32 %ctr.0.lcssa, !dbg !488
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) local_unnamed_addr #0 !dbg !489 {
entry:
  %buf = alloca [64 x i8], align 1
  %a = alloca [4 x %struct.polyvec], align 2
  %e = alloca %struct.polyvec, align 2
  %pkpv = alloca %struct.polyvec, align 2
  %skpv = alloca %struct.polyvec, align 2
    #dbg_value(ptr %pk, !492, !DIExpression(), !493)
    #dbg_value(ptr %sk, !494, !DIExpression(), !493)
    #dbg_value(ptr %coins, !495, !DIExpression(), !493)
    #dbg_declare(ptr %buf, !496, !DIExpression(), !497)
    #dbg_value(ptr %buf, !498, !DIExpression(), !493)
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !499
    #dbg_value(ptr %add.ptr, !500, !DIExpression(), !493)
    #dbg_value(i8 0, !501, !DIExpression(), !493)
    #dbg_declare(ptr %a, !502, !DIExpression(), !504)
    #dbg_declare(ptr %e, !505, !DIExpression(), !506)
    #dbg_declare(ptr %pkpv, !507, !DIExpression(), !508)
    #dbg_declare(ptr %skpv, !509, !DIExpression(), !510)
  %call = call ptr @memcpy(ptr noundef nonnull %buf, ptr noundef %coins, i32 noundef 32) #4, !dbg !511
  %arrayidx = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !512
  store i8 4, ptr %arrayidx, align 1, !dbg !513
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %buf, ptr noundef nonnull %buf, i32 noundef 33) #3, !dbg !514
  call void @pqcrystals_kyber1024_ref_gen_matrix(ptr noundef nonnull %a, ptr noundef nonnull %buf, i32 noundef 0) #3, !dbg !515
    #dbg_value(i32 0, !516, !DIExpression(), !493)
  br label %for.cond, !dbg !517

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc7, %for.body ], !dbg !519
  %nonce.0 = phi i8 [ 0, %entry ], [ %inc, %for.body ], !dbg !493
    #dbg_value(i8 %nonce.0, !501, !DIExpression(), !493)
    #dbg_value(i32 %i.0, !516, !DIExpression(), !493)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !520
  br i1 %exitcond, label %for.body, label %for.cond8.preheader, !dbg !522

for.cond8.preheader:                              ; preds = %for.cond
  br label %for.cond8, !dbg !523

for.body:                                         ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds nuw [4 x %struct.poly], ptr %skpv, i32 0, i32 %i.0, !dbg !525
    #dbg_value(i8 %nonce.0, !501, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !493)
  call void @pqcrystals_kyber1024_ref_poly_getnoise_eta1(ptr noundef nonnull %arrayidx6, ptr noundef nonnull %add.ptr, i8 noundef zeroext %nonce.0) #3, !dbg !526
  %inc = add nuw nsw i8 %nonce.0, 1, !dbg !527
    #dbg_value(i8 %inc, !501, !DIExpression(), !493)
  %inc7 = add nuw nsw i32 %i.0, 1, !dbg !528
    #dbg_value(i32 %inc7, !516, !DIExpression(), !493)
  br label %for.cond, !dbg !529, !llvm.loop !530

for.cond8:                                        ; preds = %for.cond8.preheader, %for.body10
  %i.1 = phi i32 [ %inc15, %for.body10 ], [ 0, %for.cond8.preheader ], !dbg !532
  %nonce.1 = phi i8 [ %inc13, %for.body10 ], [ 4, %for.cond8.preheader ], !dbg !493
    #dbg_value(i8 %nonce.1, !501, !DIExpression(), !493)
    #dbg_value(i32 %i.1, !516, !DIExpression(), !493)
  %exitcond1 = icmp ne i32 %i.1, 4, !dbg !533
  br i1 %exitcond1, label %for.body10, label %for.end16, !dbg !523

for.body10:                                       ; preds = %for.cond8
  %arrayidx12 = getelementptr inbounds nuw [4 x %struct.poly], ptr %e, i32 0, i32 %i.1, !dbg !535
    #dbg_value(i8 %nonce.1, !501, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !493)
  call void @pqcrystals_kyber1024_ref_poly_getnoise_eta1(ptr noundef nonnull %arrayidx12, ptr noundef nonnull %add.ptr, i8 noundef zeroext %nonce.1) #3, !dbg !536
  %inc13 = add nuw nsw i8 %nonce.1, 1, !dbg !537
    #dbg_value(i8 %inc13, !501, !DIExpression(), !493)
  %inc15 = add nuw nsw i32 %i.1, 1, !dbg !538
    #dbg_value(i32 %inc15, !516, !DIExpression(), !493)
  br label %for.cond8, !dbg !539, !llvm.loop !540

for.end16:                                        ; preds = %for.cond8
  call void @pqcrystals_kyber1024_ref_polyvec_ntt(ptr noundef nonnull %skpv) #3, !dbg !542
  call void @pqcrystals_kyber1024_ref_polyvec_ntt(ptr noundef nonnull %e) #3, !dbg !543
    #dbg_value(i32 0, !516, !DIExpression(), !493)
  br label %for.cond17, !dbg !544

for.cond17:                                       ; preds = %for.body19, %for.end16
  %i.2 = phi i32 [ 0, %for.end16 ], [ %inc26, %for.body19 ], !dbg !546
    #dbg_value(i32 %i.2, !516, !DIExpression(), !493)
  %exitcond2 = icmp ne i32 %i.2, 4, !dbg !547
  br i1 %exitcond2, label %for.body19, label %for.end27, !dbg !549

for.body19:                                       ; preds = %for.cond17
  %arrayidx21 = getelementptr inbounds nuw [4 x %struct.poly], ptr %pkpv, i32 0, i32 %i.2, !dbg !550
  %arrayidx22 = getelementptr inbounds nuw [4 x %struct.polyvec], ptr %a, i32 0, i32 %i.2, !dbg !552
  call void @pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %arrayidx21, ptr noundef nonnull %arrayidx22, ptr noundef nonnull %skpv) #3, !dbg !553
  %arrayidx24 = getelementptr inbounds nuw [4 x %struct.poly], ptr %pkpv, i32 0, i32 %i.2, !dbg !554
  call void @pqcrystals_kyber1024_ref_poly_tomont(ptr noundef nonnull %arrayidx24) #3, !dbg !555
  %inc26 = add nuw nsw i32 %i.2, 1, !dbg !556
    #dbg_value(i32 %inc26, !516, !DIExpression(), !493)
  br label %for.cond17, !dbg !557, !llvm.loop !558

for.end27:                                        ; preds = %for.cond17
  call void @pqcrystals_kyber1024_ref_polyvec_add(ptr noundef nonnull %pkpv, ptr noundef nonnull %pkpv, ptr noundef nonnull %e) #3, !dbg !560
  call void @pqcrystals_kyber1024_ref_polyvec_reduce(ptr noundef nonnull %pkpv) #3, !dbg !561
  call fastcc void @pack_sk(ptr noundef %sk, ptr noundef nonnull %skpv) #3, !dbg !562
  call fastcc void @pack_pk(ptr noundef %pk, ptr noundef nonnull %pkpv, ptr noundef nonnull %buf) #3, !dbg !563
  ret void, !dbg !564
}

; Function Attrs: nounwind
define internal fastcc void @pack_sk(ptr noundef %r, ptr noundef %sk) unnamed_addr #0 !dbg !565 {
entry:
    #dbg_value(ptr %r, !568, !DIExpression(), !569)
    #dbg_value(ptr %sk, !570, !DIExpression(), !569)
  call void @pqcrystals_kyber1024_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %sk) #3, !dbg !571
  ret void, !dbg !572
}

; Function Attrs: nounwind
define internal fastcc void @pack_pk(ptr noundef %r, ptr noundef %pk, ptr noundef %seed) unnamed_addr #0 !dbg !573 {
entry:
    #dbg_value(ptr %r, !576, !DIExpression(), !577)
    #dbg_value(ptr %pk, !578, !DIExpression(), !577)
    #dbg_value(ptr %seed, !579, !DIExpression(), !577)
  call void @pqcrystals_kyber1024_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %pk) #3, !dbg !580
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 1536, !dbg !581
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr, ptr noundef %seed, i32 noundef 32) #4, !dbg !582
  ret void, !dbg !583
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_indcpa_enc(ptr noundef %c, ptr noundef %m, ptr noundef %pk, ptr noundef %coins) local_unnamed_addr #0 !dbg !584 {
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
    #dbg_value(ptr %c, !587, !DIExpression(), !588)
    #dbg_value(ptr %m, !589, !DIExpression(), !588)
    #dbg_value(ptr %pk, !590, !DIExpression(), !588)
    #dbg_value(ptr %coins, !591, !DIExpression(), !588)
    #dbg_declare(ptr %seed, !592, !DIExpression(), !593)
    #dbg_value(i8 0, !594, !DIExpression(), !588)
    #dbg_declare(ptr %sp, !595, !DIExpression(), !596)
    #dbg_declare(ptr %pkpv, !597, !DIExpression(), !598)
    #dbg_declare(ptr %ep, !599, !DIExpression(), !600)
    #dbg_declare(ptr %at, !601, !DIExpression(), !602)
    #dbg_declare(ptr %b, !603, !DIExpression(), !604)
    #dbg_declare(ptr %v, !605, !DIExpression(), !606)
    #dbg_declare(ptr %k, !607, !DIExpression(), !608)
    #dbg_declare(ptr %epp, !609, !DIExpression(), !610)
  call fastcc void @unpack_pk(ptr noundef nonnull %pkpv, ptr noundef nonnull %seed, ptr noundef %pk) #3, !dbg !611
  call void @pqcrystals_kyber1024_ref_poly_frommsg(ptr noundef nonnull %k, ptr noundef %m) #3, !dbg !612
  call void @pqcrystals_kyber1024_ref_gen_matrix(ptr noundef nonnull %at, ptr noundef nonnull %seed, i32 noundef 1) #3, !dbg !613
    #dbg_value(i32 0, !614, !DIExpression(), !588)
  br label %for.cond, !dbg !615

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc4, %for.body ], !dbg !617
  %nonce.0 = phi i8 [ 0, %entry ], [ %inc, %for.body ], !dbg !588
    #dbg_value(i8 %nonce.0, !594, !DIExpression(), !588)
    #dbg_value(i32 %i.0, !614, !DIExpression(), !588)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !618
  br i1 %exitcond, label %for.body, label %for.cond5.preheader, !dbg !620

for.cond5.preheader:                              ; preds = %for.cond
  br label %for.cond5, !dbg !621

for.body:                                         ; preds = %for.cond
  %add.ptr = getelementptr inbounds nuw %struct.poly, ptr %sp, i32 %i.0, !dbg !623
    #dbg_value(i8 %nonce.0, !594, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !588)
  call void @pqcrystals_kyber1024_ref_poly_getnoise_eta1(ptr noundef nonnull %add.ptr, ptr noundef %coins, i8 noundef zeroext %nonce.0) #3, !dbg !624
  %inc = add nuw nsw i8 %nonce.0, 1, !dbg !625
    #dbg_value(i8 %inc, !594, !DIExpression(), !588)
  %inc4 = add nuw nsw i32 %i.0, 1, !dbg !626
    #dbg_value(i32 %inc4, !614, !DIExpression(), !588)
  br label %for.cond, !dbg !627, !llvm.loop !628

for.cond5:                                        ; preds = %for.cond5.preheader, %for.body7
  %i.1 = phi i32 [ %inc13, %for.body7 ], [ 0, %for.cond5.preheader ], !dbg !630
  %nonce.1 = phi i8 [ %inc11, %for.body7 ], [ 4, %for.cond5.preheader ], !dbg !588
    #dbg_value(i8 %nonce.1, !594, !DIExpression(), !588)
    #dbg_value(i32 %i.1, !614, !DIExpression(), !588)
  %exitcond1 = icmp ne i32 %i.1, 4, !dbg !631
  br i1 %exitcond1, label %for.body7, label %for.end14, !dbg !621

for.body7:                                        ; preds = %for.cond5
  %add.ptr10 = getelementptr inbounds nuw %struct.poly, ptr %ep, i32 %i.1, !dbg !633
    #dbg_value(i8 %nonce.1, !594, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !588)
  call void @pqcrystals_kyber1024_ref_poly_getnoise_eta2(ptr noundef nonnull %add.ptr10, ptr noundef %coins, i8 noundef zeroext %nonce.1) #3, !dbg !634
  %inc11 = add nuw nsw i8 %nonce.1, 1, !dbg !635
    #dbg_value(i8 %inc11, !594, !DIExpression(), !588)
  %inc13 = add nuw nsw i32 %i.1, 1, !dbg !636
    #dbg_value(i32 %inc13, !614, !DIExpression(), !588)
  br label %for.cond5, !dbg !637, !llvm.loop !638

for.end14:                                        ; preds = %for.cond5
    #dbg_value(i8 8, !594, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !588)
  call void @pqcrystals_kyber1024_ref_poly_getnoise_eta2(ptr noundef nonnull %epp, ptr noundef %coins, i8 noundef zeroext 8) #3, !dbg !640
  call void @pqcrystals_kyber1024_ref_polyvec_ntt(ptr noundef nonnull %sp) #3, !dbg !641
    #dbg_value(i32 0, !614, !DIExpression(), !588)
  br label %for.cond16, !dbg !642

for.cond16:                                       ; preds = %for.body18, %for.end14
  %i.2 = phi i32 [ 0, %for.end14 ], [ %inc22, %for.body18 ], !dbg !644
    #dbg_value(i32 %i.2, !614, !DIExpression(), !588)
  %exitcond2 = icmp ne i32 %i.2, 4, !dbg !645
  br i1 %exitcond2, label %for.body18, label %for.end23, !dbg !647

for.body18:                                       ; preds = %for.cond16
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %b, i32 0, i32 %i.2, !dbg !648
  %arrayidx20 = getelementptr inbounds nuw [4 x %struct.polyvec], ptr %at, i32 0, i32 %i.2, !dbg !649
  call void @pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %arrayidx, ptr noundef nonnull %arrayidx20, ptr noundef nonnull %sp) #3, !dbg !650
  %inc22 = add nuw nsw i32 %i.2, 1, !dbg !651
    #dbg_value(i32 %inc22, !614, !DIExpression(), !588)
  br label %for.cond16, !dbg !652, !llvm.loop !653

for.end23:                                        ; preds = %for.cond16
  call void @pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %v, ptr noundef nonnull %pkpv, ptr noundef nonnull %sp) #3, !dbg !655
  call void @pqcrystals_kyber1024_ref_polyvec_invntt_tomont(ptr noundef nonnull %b) #3, !dbg !656
  call void @pqcrystals_kyber1024_ref_poly_invntt_tomont(ptr noundef nonnull %v) #3, !dbg !657
  call void @pqcrystals_kyber1024_ref_polyvec_add(ptr noundef nonnull %b, ptr noundef nonnull %b, ptr noundef nonnull %ep) #3, !dbg !658
  call void @pqcrystals_kyber1024_ref_poly_add(ptr noundef nonnull %v, ptr noundef nonnull %v, ptr noundef nonnull %epp) #3, !dbg !659
  call void @pqcrystals_kyber1024_ref_poly_add(ptr noundef nonnull %v, ptr noundef nonnull %v, ptr noundef nonnull %k) #3, !dbg !660
  call void @pqcrystals_kyber1024_ref_polyvec_reduce(ptr noundef nonnull %b) #3, !dbg !661
  call void @pqcrystals_kyber1024_ref_poly_reduce(ptr noundef nonnull %v) #3, !dbg !662
  call fastcc void @pack_ciphertext(ptr noundef %c, ptr noundef nonnull %b, ptr noundef nonnull %v) #3, !dbg !663
  ret void, !dbg !664
}

; Function Attrs: nounwind
define internal fastcc void @unpack_pk(ptr noundef %pk, ptr noundef %seed, ptr noundef %packedpk) unnamed_addr #0 !dbg !665 {
entry:
    #dbg_value(ptr %pk, !668, !DIExpression(), !669)
    #dbg_value(ptr %seed, !670, !DIExpression(), !669)
    #dbg_value(ptr %packedpk, !671, !DIExpression(), !669)
  call void @pqcrystals_kyber1024_ref_polyvec_frombytes(ptr noundef %pk, ptr noundef %packedpk) #3, !dbg !672
  %add.ptr = getelementptr inbounds nuw i8, ptr %packedpk, i32 1536, !dbg !673
  %call = call ptr @memcpy(ptr noundef %seed, ptr noundef nonnull %add.ptr, i32 noundef 32) #4, !dbg !674
  ret void, !dbg !675
}

; Function Attrs: nounwind
define internal fastcc void @pack_ciphertext(ptr noundef %r, ptr noundef %b, ptr noundef %v) unnamed_addr #0 !dbg !676 {
entry:
    #dbg_value(ptr %r, !680, !DIExpression(), !681)
    #dbg_value(ptr %b, !682, !DIExpression(), !681)
    #dbg_value(ptr %v, !683, !DIExpression(), !681)
  call void @pqcrystals_kyber1024_ref_polyvec_compress(ptr noundef %r, ptr noundef %b) #3, !dbg !684
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 1408, !dbg !685
  call void @pqcrystals_kyber1024_ref_poly_compress(ptr noundef nonnull %add.ptr, ptr noundef %v) #3, !dbg !686
  ret void, !dbg !687
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_indcpa_dec(ptr noundef %m, ptr noundef %c, ptr noundef %sk) local_unnamed_addr #0 !dbg !688 {
entry:
  %b = alloca %struct.polyvec, align 2
  %skpv = alloca %struct.polyvec, align 2
  %v = alloca %struct.poly, align 2
  %mp = alloca %struct.poly, align 2
    #dbg_value(ptr %m, !691, !DIExpression(), !692)
    #dbg_value(ptr %c, !693, !DIExpression(), !692)
    #dbg_value(ptr %sk, !694, !DIExpression(), !692)
    #dbg_declare(ptr %b, !695, !DIExpression(), !696)
    #dbg_declare(ptr %skpv, !697, !DIExpression(), !698)
    #dbg_declare(ptr %v, !699, !DIExpression(), !700)
    #dbg_declare(ptr %mp, !701, !DIExpression(), !702)
  call fastcc void @unpack_ciphertext(ptr noundef nonnull %b, ptr noundef nonnull %v, ptr noundef %c) #3, !dbg !703
  call fastcc void @unpack_sk(ptr noundef nonnull %skpv, ptr noundef %sk) #3, !dbg !704
  call void @pqcrystals_kyber1024_ref_polyvec_ntt(ptr noundef nonnull %b) #3, !dbg !705
  call void @pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %mp, ptr noundef nonnull %skpv, ptr noundef nonnull %b) #3, !dbg !706
  call void @pqcrystals_kyber1024_ref_poly_invntt_tomont(ptr noundef nonnull %mp) #3, !dbg !707
  call void @pqcrystals_kyber1024_ref_poly_sub(ptr noundef nonnull %mp, ptr noundef nonnull %v, ptr noundef nonnull %mp) #3, !dbg !708
  call void @pqcrystals_kyber1024_ref_poly_reduce(ptr noundef nonnull %mp) #3, !dbg !709
  call void @pqcrystals_kyber1024_ref_poly_tomsg(ptr noundef %m, ptr noundef nonnull %mp) #3, !dbg !710
  ret void, !dbg !711
}

; Function Attrs: nounwind
define internal fastcc void @unpack_ciphertext(ptr noundef %b, ptr noundef %v, ptr noundef %c) unnamed_addr #0 !dbg !712 {
entry:
    #dbg_value(ptr %b, !715, !DIExpression(), !716)
    #dbg_value(ptr %v, !717, !DIExpression(), !716)
    #dbg_value(ptr %c, !718, !DIExpression(), !716)
  call void @pqcrystals_kyber1024_ref_polyvec_decompress(ptr noundef %b, ptr noundef %c) #3, !dbg !719
  %add.ptr = getelementptr inbounds nuw i8, ptr %c, i32 1408, !dbg !720
  call void @pqcrystals_kyber1024_ref_poly_decompress(ptr noundef %v, ptr noundef nonnull %add.ptr) #3, !dbg !721
  ret void, !dbg !722
}

; Function Attrs: nounwind
define internal fastcc void @unpack_sk(ptr noundef %sk, ptr noundef %packedsk) unnamed_addr #0 !dbg !723 {
entry:
    #dbg_value(ptr %sk, !726, !DIExpression(), !727)
    #dbg_value(ptr %packedsk, !728, !DIExpression(), !727)
  call void @pqcrystals_kyber1024_ref_polyvec_frombytes(ptr noundef %sk, ptr noundef %packedsk) #3, !dbg !729
  ret void, !dbg !730
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_compress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !731 {
entry:
  %t = alloca [8 x i16], align 2
    #dbg_value(ptr %r, !746, !DIExpression(), !747)
    #dbg_value(ptr %a, !748, !DIExpression(), !747)
    #dbg_declare(ptr %t, !749, !DIExpression(), !753)
    #dbg_value(i32 0, !754, !DIExpression(), !747)
  br label %for.cond, !dbg !755

for.cond:                                         ; preds = %for.inc107, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc108, %for.inc107 ], !dbg !757
  %r.addr.0 = phi ptr [ %r, %entry ], [ %r.addr.1.lcssa, %for.inc107 ]
    #dbg_value(ptr %r.addr.0, !746, !DIExpression(), !747)
    #dbg_value(i32 %i.0, !754, !DIExpression(), !747)
  %exitcond2 = icmp ne i32 %i.0, 4, !dbg !758
  br i1 %exitcond2, label %for.cond1.preheader, label %for.end109, !dbg !760

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !761

for.cond1:                                        ; preds = %for.cond1.preheader, %for.end
  %j.0 = phi i32 [ %inc105, %for.end ], [ 0, %for.cond1.preheader ], !dbg !764
  %r.addr.1 = phi ptr [ %add.ptr, %for.end ], [ %r.addr.0, %for.cond1.preheader ]
    #dbg_value(ptr %r.addr.1, !746, !DIExpression(), !747)
    #dbg_value(i32 %j.0, !765, !DIExpression(), !747)
  %exitcond1 = icmp ne i32 %j.0, 32, !dbg !766
  br i1 %exitcond1, label %for.cond4.preheader, label %for.inc107, !dbg !761

for.cond4.preheader:                              ; preds = %for.cond1
  br label %for.cond4, !dbg !768

for.cond4:                                        ; preds = %for.cond4.preheader, %for.body6
  %k.0 = phi i32 [ %inc, %for.body6 ], [ 0, %for.cond4.preheader ], !dbg !771
    #dbg_value(i32 %k.0, !772, !DIExpression(), !747)
  %exitcond = icmp ne i32 %k.0, 8, !dbg !773
  br i1 %exitcond, label %for.body6, label %for.end, !dbg !768

for.body6:                                        ; preds = %for.cond4
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %a, i32 0, i32 %i.0, !dbg !775
  %mul = shl nuw nsw i32 %j.0, 3, !dbg !777
  %add = or disjoint i32 %mul, %k.0, !dbg !778
  %arrayidx7 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx, i32 0, i32 %add, !dbg !775
  %0 = load i16, ptr %arrayidx7, align 2, !dbg !775
  %isneg = icmp slt i16 %0, 0, !dbg !779
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !779
  %arrayidx10 = getelementptr inbounds nuw [8 x i16], ptr %t, i32 0, i32 %k.0, !dbg !780
  %add12 = add i16 %and, %0, !dbg !781
  store i16 %add12, ptr %arrayidx10, align 2, !dbg !781
  %conv15 = zext i16 %add12 to i64, !dbg !782
    #dbg_value(i64 %conv15, !783, !DIExpression(), !747)
    #dbg_value(i64 %conv15, !783, !DIExpression(DW_OP_constu, 11, DW_OP_shl, DW_OP_stack_value), !747)
    #dbg_value(i64 %conv15, !783, !DIExpression(DW_OP_constu, 11, DW_OP_shl, DW_OP_constu, 1664, DW_OP_or, DW_OP_stack_value), !747)
  %1 = mul nuw nsw i64 %conv15, 1321132032, !dbg !784
  %mul17 = add nuw nsw i64 %1, 1073419776, !dbg !784
    #dbg_value(i64 %mul17, !783, !DIExpression(), !747)
  %shr18 = lshr i64 %mul17, 31, !dbg !785
    #dbg_value(i64 %shr18, !783, !DIExpression(), !747)
  %2 = trunc nuw i64 %shr18 to i16, !dbg !786
  %conv20 = and i16 %2, 2047, !dbg !786
  %arrayidx21 = getelementptr inbounds nuw [8 x i16], ptr %t, i32 0, i32 %k.0, !dbg !787
  store i16 %conv20, ptr %arrayidx21, align 2, !dbg !788
  %inc = add nuw nsw i32 %k.0, 1, !dbg !789
    #dbg_value(i32 %inc, !772, !DIExpression(), !747)
  br label %for.cond4, !dbg !790, !llvm.loop !791

for.end:                                          ; preds = %for.cond4
  %3 = load i16, ptr %t, align 2, !dbg !793
  %conv25 = trunc i16 %3 to i8, !dbg !794
  store i8 %conv25, ptr %r.addr.1, align 1, !dbg !795
  %4 = load i16, ptr %t, align 2, !dbg !796
  %5 = lshr i16 %4, 8, !dbg !797
  %shr29 = trunc nuw i16 %5 to i8, !dbg !797
  %arrayidx30 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !798
  %6 = load i16, ptr %arrayidx30, align 2, !dbg !798
  %conv31 = trunc i16 %6 to i8, !dbg !798
  %shl32 = shl i8 %conv31, 3, !dbg !799
  %or = or i8 %shl32, %shr29, !dbg !800
  %arrayidx34 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 1, !dbg !801
  store i8 %or, ptr %arrayidx34, align 1, !dbg !802
  %arrayidx35 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !803
  %7 = load i16, ptr %arrayidx35, align 2, !dbg !803
  %8 = lshr i16 %7, 5, !dbg !804
  %shr37 = trunc i16 %8 to i8, !dbg !804
  %arrayidx38 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !805
  %9 = load i16, ptr %arrayidx38, align 2, !dbg !805
  %conv39 = trunc i16 %9 to i8, !dbg !805
  %shl40 = shl i8 %conv39, 6, !dbg !806
  %or41 = or i8 %shl40, %shr37, !dbg !807
  %arrayidx43 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 2, !dbg !808
  store i8 %or41, ptr %arrayidx43, align 1, !dbg !809
  %arrayidx44 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !810
  %10 = load i16, ptr %arrayidx44, align 2, !dbg !810
  %11 = lshr i16 %10, 2, !dbg !811
  %conv47 = trunc i16 %11 to i8, !dbg !812
  %arrayidx48 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 3, !dbg !813
  store i8 %conv47, ptr %arrayidx48, align 1, !dbg !814
  %arrayidx49 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !815
  %12 = load i16, ptr %arrayidx49, align 2, !dbg !815
  %13 = lshr i16 %12, 10, !dbg !816
  %shr51 = trunc nuw nsw i16 %13 to i8, !dbg !816
  %arrayidx52 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !817
  %14 = load i16, ptr %arrayidx52, align 2, !dbg !817
  %conv53 = trunc i16 %14 to i8, !dbg !817
  %shl54 = shl i8 %conv53, 1, !dbg !818
  %or55 = or i8 %shl54, %shr51, !dbg !819
  %arrayidx57 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 4, !dbg !820
  store i8 %or55, ptr %arrayidx57, align 1, !dbg !821
  %arrayidx58 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !822
  %15 = load i16, ptr %arrayidx58, align 2, !dbg !822
  %16 = lshr i16 %15, 7, !dbg !823
  %shr60 = trunc i16 %16 to i8, !dbg !823
  %arrayidx61 = getelementptr inbounds nuw i8, ptr %t, i32 8, !dbg !824
  %17 = load i16, ptr %arrayidx61, align 2, !dbg !824
  %conv62 = trunc i16 %17 to i8, !dbg !824
  %shl63 = shl i8 %conv62, 4, !dbg !825
  %or64 = or i8 %shl63, %shr60, !dbg !826
  %arrayidx66 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 5, !dbg !827
  store i8 %or64, ptr %arrayidx66, align 1, !dbg !828
  %arrayidx67 = getelementptr inbounds nuw i8, ptr %t, i32 8, !dbg !829
  %18 = load i16, ptr %arrayidx67, align 2, !dbg !829
  %19 = lshr i16 %18, 4, !dbg !830
  %shr69 = trunc i16 %19 to i8, !dbg !830
  %arrayidx70 = getelementptr inbounds nuw i8, ptr %t, i32 10, !dbg !831
  %20 = load i16, ptr %arrayidx70, align 2, !dbg !831
  %conv71 = trunc i16 %20 to i8, !dbg !831
  %shl72 = shl i8 %conv71, 7, !dbg !832
  %or73 = or i8 %shl72, %shr69, !dbg !833
  %arrayidx75 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 6, !dbg !834
  store i8 %or73, ptr %arrayidx75, align 1, !dbg !835
  %arrayidx76 = getelementptr inbounds nuw i8, ptr %t, i32 10, !dbg !836
  %21 = load i16, ptr %arrayidx76, align 2, !dbg !836
  %22 = lshr i16 %21, 1, !dbg !837
  %conv79 = trunc i16 %22 to i8, !dbg !838
  %arrayidx80 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 7, !dbg !839
  store i8 %conv79, ptr %arrayidx80, align 1, !dbg !840
  %arrayidx81 = getelementptr inbounds nuw i8, ptr %t, i32 10, !dbg !841
  %23 = load i16, ptr %arrayidx81, align 2, !dbg !841
  %24 = lshr i16 %23, 9, !dbg !842
  %shr83 = trunc nuw nsw i16 %24 to i8, !dbg !842
  %arrayidx84 = getelementptr inbounds nuw i8, ptr %t, i32 12, !dbg !843
  %25 = load i16, ptr %arrayidx84, align 2, !dbg !843
  %conv85 = trunc i16 %25 to i8, !dbg !843
  %shl86 = shl i8 %conv85, 2, !dbg !844
  %or87 = or i8 %shl86, %shr83, !dbg !845
  %arrayidx89 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 8, !dbg !846
  store i8 %or87, ptr %arrayidx89, align 1, !dbg !847
  %arrayidx90 = getelementptr inbounds nuw i8, ptr %t, i32 12, !dbg !848
  %26 = load i16, ptr %arrayidx90, align 2, !dbg !848
  %27 = lshr i16 %26, 6, !dbg !849
  %shr92 = trunc i16 %27 to i8, !dbg !849
  %arrayidx93 = getelementptr inbounds nuw i8, ptr %t, i32 14, !dbg !850
  %28 = load i16, ptr %arrayidx93, align 2, !dbg !850
  %conv94 = trunc i16 %28 to i8, !dbg !850
  %shl95 = shl i8 %conv94, 5, !dbg !851
  %or96 = or i8 %shl95, %shr92, !dbg !852
  %arrayidx98 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 9, !dbg !853
  store i8 %or96, ptr %arrayidx98, align 1, !dbg !854
  %arrayidx99 = getelementptr inbounds nuw i8, ptr %t, i32 14, !dbg !855
  %29 = load i16, ptr %arrayidx99, align 2, !dbg !855
  %30 = lshr i16 %29, 3, !dbg !856
  %conv102 = trunc i16 %30 to i8, !dbg !857
  %arrayidx103 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 10, !dbg !858
  store i8 %conv102, ptr %arrayidx103, align 1, !dbg !859
    #dbg_value(ptr %r.addr.1, !746, !DIExpression(DW_OP_plus_uconst, 11, DW_OP_stack_value), !747)
  %add.ptr = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 11, !dbg !860
    #dbg_value(ptr %add.ptr, !746, !DIExpression(), !747)
  %inc105 = add nuw nsw i32 %j.0, 1, !dbg !861
    #dbg_value(i32 %inc105, !765, !DIExpression(), !747)
  br label %for.cond1, !dbg !862, !llvm.loop !863

for.inc107:                                       ; preds = %for.cond1
  %r.addr.1.lcssa = phi ptr [ %r.addr.1, %for.cond1 ]
  %inc108 = add nuw nsw i32 %i.0, 1, !dbg !865
    #dbg_value(i32 %inc108, !754, !DIExpression(), !747)
  br label %for.cond, !dbg !866, !llvm.loop !867

for.end109:                                       ; preds = %for.cond
  ret void, !dbg !869
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_decompress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !870 {
entry:
  %t = alloca [8 x i16], align 2
    #dbg_value(ptr %r, !874, !DIExpression(), !875)
    #dbg_value(ptr %a, !876, !DIExpression(), !875)
    #dbg_declare(ptr %t, !877, !DIExpression(), !878)
    #dbg_value(i32 0, !879, !DIExpression(), !875)
  br label %for.cond, !dbg !880

for.cond:                                         ; preds = %for.inc104, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc105, %for.inc104 ], !dbg !882
  %a.addr.0 = phi ptr [ %a, %entry ], [ %a.addr.1.lcssa, %for.inc104 ]
    #dbg_value(ptr %a.addr.0, !876, !DIExpression(), !875)
    #dbg_value(i32 %i.0, !879, !DIExpression(), !875)
  %exitcond2 = icmp ne i32 %i.0, 4, !dbg !883
  br i1 %exitcond2, label %for.cond1.preheader, label %for.end106, !dbg !885

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !886

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc101
  %j.0 = phi i32 [ %inc102, %for.inc101 ], [ 0, %for.cond1.preheader ], !dbg !889
  %a.addr.1 = phi ptr [ %add.ptr, %for.inc101 ], [ %a.addr.0, %for.cond1.preheader ]
    #dbg_value(ptr %a.addr.1, !876, !DIExpression(), !875)
    #dbg_value(i32 %j.0, !890, !DIExpression(), !875)
  %exitcond1 = icmp ne i32 %j.0, 32, !dbg !891
  br i1 %exitcond1, label %for.body3, label %for.inc104, !dbg !886

for.body3:                                        ; preds = %for.cond1
  %0 = load i8, ptr %a.addr.1, align 1, !dbg !893
  %conv = zext i8 %0 to i16, !dbg !893
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 1, !dbg !895
  %1 = load i8, ptr %arrayidx4, align 1, !dbg !895
  %conv6 = zext i8 %1 to i16, !dbg !896
  %shl = shl nuw i16 %conv6, 8, !dbg !897
  %or = or disjoint i16 %shl, %conv, !dbg !898
  store i16 %or, ptr %t, align 2, !dbg !899
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 1, !dbg !900
  %2 = load i8, ptr %arrayidx9, align 1, !dbg !900
  %3 = lshr i8 %2, 3, !dbg !901
  %shr11 = zext nneg i8 %3 to i16, !dbg !901
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 2, !dbg !902
  %4 = load i8, ptr %arrayidx12, align 1, !dbg !902
  %conv14 = zext i8 %4 to i16, !dbg !903
  %shl15 = shl nuw nsw i16 %conv14, 5, !dbg !904
  %or16 = or disjoint i16 %shl15, %shr11, !dbg !905
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !906
  store i16 %or16, ptr %arrayidx18, align 2, !dbg !907
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 2, !dbg !908
  %5 = load i8, ptr %arrayidx19, align 1, !dbg !908
  %6 = lshr i8 %5, 6, !dbg !909
  %shr21 = zext nneg i8 %6 to i16, !dbg !909
  %arrayidx22 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 3, !dbg !910
  %7 = load i8, ptr %arrayidx22, align 1, !dbg !910
  %conv24 = zext i8 %7 to i16, !dbg !911
  %shl25 = shl nuw nsw i16 %conv24, 2, !dbg !912
  %or26 = or disjoint i16 %shl25, %shr21, !dbg !913
  %arrayidx27 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 4, !dbg !914
  %8 = load i8, ptr %arrayidx27, align 1, !dbg !914
  %conv29 = zext i8 %8 to i16, !dbg !915
  %shl30 = shl i16 %conv29, 10, !dbg !916
  %or31 = or disjoint i16 %or26, %shl30, !dbg !917
  %arrayidx33 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !918
  store i16 %or31, ptr %arrayidx33, align 2, !dbg !919
  %arrayidx34 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 4, !dbg !920
  %9 = load i8, ptr %arrayidx34, align 1, !dbg !920
  %10 = lshr i8 %9, 1, !dbg !921
  %shr36 = zext nneg i8 %10 to i16, !dbg !921
  %arrayidx37 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 5, !dbg !922
  %11 = load i8, ptr %arrayidx37, align 1, !dbg !922
  %conv39 = zext i8 %11 to i16, !dbg !923
  %shl40 = shl nuw nsw i16 %conv39, 7, !dbg !924
  %or41 = or disjoint i16 %shl40, %shr36, !dbg !925
  %arrayidx43 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !926
  store i16 %or41, ptr %arrayidx43, align 2, !dbg !927
  %arrayidx44 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 5, !dbg !928
  %12 = load i8, ptr %arrayidx44, align 1, !dbg !928
  %13 = lshr i8 %12, 4, !dbg !929
  %shr46 = zext nneg i8 %13 to i16, !dbg !929
  %arrayidx47 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 6, !dbg !930
  %14 = load i8, ptr %arrayidx47, align 1, !dbg !930
  %conv49 = zext i8 %14 to i16, !dbg !931
  %shl50 = shl nuw nsw i16 %conv49, 4, !dbg !932
  %or51 = or disjoint i16 %shl50, %shr46, !dbg !933
  %arrayidx53 = getelementptr inbounds nuw i8, ptr %t, i32 8, !dbg !934
  store i16 %or51, ptr %arrayidx53, align 2, !dbg !935
  %arrayidx54 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 6, !dbg !936
  %15 = load i8, ptr %arrayidx54, align 1, !dbg !936
  %16 = lshr i8 %15, 7, !dbg !937
  %shr56 = zext nneg i8 %16 to i16, !dbg !937
  %arrayidx57 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 7, !dbg !938
  %17 = load i8, ptr %arrayidx57, align 1, !dbg !938
  %conv59 = zext i8 %17 to i16, !dbg !939
  %shl60 = shl nuw nsw i16 %conv59, 1, !dbg !940
  %or61 = or disjoint i16 %shl60, %shr56, !dbg !941
  %arrayidx62 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 8, !dbg !942
  %18 = load i8, ptr %arrayidx62, align 1, !dbg !942
  %conv64 = zext i8 %18 to i16, !dbg !943
  %shl65 = shl i16 %conv64, 9, !dbg !944
  %or66 = or disjoint i16 %or61, %shl65, !dbg !945
  %arrayidx68 = getelementptr inbounds nuw i8, ptr %t, i32 10, !dbg !946
  store i16 %or66, ptr %arrayidx68, align 2, !dbg !947
  %arrayidx69 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 8, !dbg !948
  %19 = load i8, ptr %arrayidx69, align 1, !dbg !948
  %20 = lshr i8 %19, 2, !dbg !949
  %shr71 = zext nneg i8 %20 to i16, !dbg !949
  %arrayidx72 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 9, !dbg !950
  %21 = load i8, ptr %arrayidx72, align 1, !dbg !950
  %conv74 = zext i8 %21 to i16, !dbg !951
  %shl75 = shl nuw nsw i16 %conv74, 6, !dbg !952
  %or76 = or disjoint i16 %shl75, %shr71, !dbg !953
  %arrayidx78 = getelementptr inbounds nuw i8, ptr %t, i32 12, !dbg !954
  store i16 %or76, ptr %arrayidx78, align 2, !dbg !955
  %arrayidx79 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 9, !dbg !956
  %22 = load i8, ptr %arrayidx79, align 1, !dbg !956
  %23 = lshr i8 %22, 5, !dbg !957
  %shr81 = zext nneg i8 %23 to i16, !dbg !957
  %arrayidx82 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 10, !dbg !958
  %24 = load i8, ptr %arrayidx82, align 1, !dbg !958
  %conv84 = zext i8 %24 to i16, !dbg !959
  %shl85 = shl nuw nsw i16 %conv84, 3, !dbg !960
  %or86 = or disjoint i16 %shl85, %shr81, !dbg !961
  %arrayidx88 = getelementptr inbounds nuw i8, ptr %t, i32 14, !dbg !962
  store i16 %or86, ptr %arrayidx88, align 2, !dbg !963
    #dbg_value(ptr %add.ptr, !876, !DIExpression(), !875)
    #dbg_value(i32 0, !964, !DIExpression(), !875)
  br label %for.cond89, !dbg !965

for.cond89:                                       ; preds = %for.body92, %for.body3
  %k.0 = phi i32 [ 0, %for.body3 ], [ %inc, %for.body92 ], !dbg !967
    #dbg_value(i32 %k.0, !964, !DIExpression(), !875)
  %exitcond = icmp ne i32 %k.0, 8, !dbg !968
  br i1 %exitcond, label %for.body92, label %for.inc101, !dbg !970

for.body92:                                       ; preds = %for.cond89
  %arrayidx93 = getelementptr inbounds nuw [8 x i16], ptr %t, i32 0, i32 %k.0, !dbg !971
  %25 = load i16, ptr %arrayidx93, align 2, !dbg !971
  %26 = and i16 %25, 2047, !dbg !972
  %and = zext nneg i16 %26 to i32, !dbg !972
  %mul = mul nuw nsw i32 %and, 3329, !dbg !973
  %add = add nuw nsw i32 %mul, 1024, !dbg !974
  %shr95 = lshr i32 %add, 11, !dbg !975
  %conv96 = trunc nuw nsw i32 %shr95 to i16, !dbg !976
  %arrayidx97 = getelementptr inbounds nuw [4 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !977
  %mul98 = shl nuw nsw i32 %j.0, 3, !dbg !978
  %add99 = or disjoint i32 %mul98, %k.0, !dbg !979
  %arrayidx100 = getelementptr inbounds nuw [256 x i16], ptr %arrayidx97, i32 0, i32 %add99, !dbg !977
  store i16 %conv96, ptr %arrayidx100, align 2, !dbg !980
  %inc = add nuw nsw i32 %k.0, 1, !dbg !981
    #dbg_value(i32 %inc, !964, !DIExpression(), !875)
  br label %for.cond89, !dbg !982, !llvm.loop !983

for.inc101:                                       ; preds = %for.cond89
  %add.ptr = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 11, !dbg !985
  %inc102 = add nuw nsw i32 %j.0, 1, !dbg !986
    #dbg_value(i32 %inc102, !890, !DIExpression(), !875)
  br label %for.cond1, !dbg !987, !llvm.loop !988

for.inc104:                                       ; preds = %for.cond1
  %a.addr.1.lcssa = phi ptr [ %a.addr.1, %for.cond1 ]
  %inc105 = add nuw nsw i32 %i.0, 1, !dbg !990
    #dbg_value(i32 %inc105, !879, !DIExpression(), !875)
  br label %for.cond, !dbg !991, !llvm.loop !992

for.end106:                                       ; preds = %for.cond
  ret void, !dbg !994
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !995 {
entry:
    #dbg_value(ptr %r, !996, !DIExpression(), !997)
    #dbg_value(ptr %a, !998, !DIExpression(), !997)
    #dbg_value(i32 0, !999, !DIExpression(), !997)
  br label %for.cond, !dbg !1000

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1002
    #dbg_value(i32 %i.0, !999, !DIExpression(), !997)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !1003
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1005

for.body:                                         ; preds = %for.cond
  %mul = mul nuw nsw i32 %i.0, 384, !dbg !1006
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 %mul, !dbg !1007
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %a, i32 0, i32 %i.0, !dbg !1008
  call void @pqcrystals_kyber1024_ref_poly_tobytes(ptr noundef %add.ptr, ptr noundef %arrayidx) #3, !dbg !1009
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1010
    #dbg_value(i32 %inc, !999, !DIExpression(), !997)
  br label %for.cond, !dbg !1011, !llvm.loop !1012

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1014
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_frombytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1015 {
entry:
    #dbg_value(ptr %r, !1016, !DIExpression(), !1017)
    #dbg_value(ptr %a, !1018, !DIExpression(), !1017)
    #dbg_value(i32 0, !1019, !DIExpression(), !1017)
  br label %for.cond, !dbg !1020

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1022
    #dbg_value(i32 %i.0, !1019, !DIExpression(), !1017)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !1023
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1025

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !1026
  %mul = mul nuw nsw i32 %i.0, 384, !dbg !1027
  %add.ptr = getelementptr inbounds nuw i8, ptr %a, i32 %mul, !dbg !1028
  call void @pqcrystals_kyber1024_ref_poly_frombytes(ptr noundef %arrayidx, ptr noundef %add.ptr) #3, !dbg !1029
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1030
    #dbg_value(i32 %inc, !1019, !DIExpression(), !1017)
  br label %for.cond, !dbg !1031, !llvm.loop !1032

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1034
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1035 {
entry:
    #dbg_value(ptr %r, !1038, !DIExpression(), !1039)
    #dbg_value(i32 0, !1040, !DIExpression(), !1039)
  br label %for.cond, !dbg !1041

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1043
    #dbg_value(i32 %i.0, !1040, !DIExpression(), !1039)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !1044
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1046

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !1047
  call void @pqcrystals_kyber1024_ref_poly_ntt(ptr noundef %arrayidx) #3, !dbg !1048
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1049
    #dbg_value(i32 %inc, !1040, !DIExpression(), !1039)
  br label %for.cond, !dbg !1050, !llvm.loop !1051

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1053
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_invntt_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !1054 {
entry:
    #dbg_value(ptr %r, !1055, !DIExpression(), !1056)
    #dbg_value(i32 0, !1057, !DIExpression(), !1056)
  br label %for.cond, !dbg !1058

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1060
    #dbg_value(i32 %i.0, !1057, !DIExpression(), !1056)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !1061
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1063

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !1064
  call void @pqcrystals_kyber1024_ref_poly_invntt_tomont(ptr noundef %arrayidx) #3, !dbg !1065
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1066
    #dbg_value(i32 %inc, !1057, !DIExpression(), !1056)
  br label %for.cond, !dbg !1067, !llvm.loop !1068

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1070
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1071 {
entry:
  %t = alloca %struct.poly, align 2
    #dbg_value(ptr %r, !1075, !DIExpression(), !1076)
    #dbg_value(ptr %a, !1077, !DIExpression(), !1076)
    #dbg_value(ptr %b, !1078, !DIExpression(), !1076)
    #dbg_declare(ptr %t, !1079, !DIExpression(), !1080)
  call void @pqcrystals_kyber1024_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) #3, !dbg !1081
    #dbg_value(i32 1, !1082, !DIExpression(), !1076)
  br label %for.cond, !dbg !1083

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 1, %entry ], [ %inc, %for.body ], !dbg !1085
    #dbg_value(i32 %i.0, !1082, !DIExpression(), !1076)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !1086
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1088

for.body:                                         ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds nuw [4 x %struct.poly], ptr %a, i32 0, i32 %i.0, !dbg !1089
  %arrayidx6 = getelementptr inbounds nuw [4 x %struct.poly], ptr %b, i32 0, i32 %i.0, !dbg !1091
  call void @pqcrystals_kyber1024_ref_poly_basemul_montgomery(ptr noundef nonnull %t, ptr noundef nonnull %arrayidx4, ptr noundef nonnull %arrayidx6) #3, !dbg !1092
  call void @pqcrystals_kyber1024_ref_poly_add(ptr noundef %r, ptr noundef %r, ptr noundef nonnull %t) #3, !dbg !1093
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1094
    #dbg_value(i32 %inc, !1082, !DIExpression(), !1076)
  br label %for.cond, !dbg !1095, !llvm.loop !1096

for.end:                                          ; preds = %for.cond
  call void @pqcrystals_kyber1024_ref_poly_reduce(ptr noundef %r) #3, !dbg !1098
  ret void, !dbg !1099
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_reduce(ptr noundef %r) local_unnamed_addr #0 !dbg !1100 {
entry:
    #dbg_value(ptr %r, !1101, !DIExpression(), !1102)
    #dbg_value(i32 0, !1103, !DIExpression(), !1102)
  br label %for.cond, !dbg !1104

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1106
    #dbg_value(i32 %i.0, !1103, !DIExpression(), !1102)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !1107
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1109

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !1110
  call void @pqcrystals_kyber1024_ref_poly_reduce(ptr noundef %arrayidx) #3, !dbg !1111
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1112
    #dbg_value(i32 %inc, !1103, !DIExpression(), !1102)
  br label %for.cond, !dbg !1113, !llvm.loop !1114

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1116
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1117 {
entry:
    #dbg_value(ptr %r, !1120, !DIExpression(), !1121)
    #dbg_value(ptr %a, !1122, !DIExpression(), !1121)
    #dbg_value(ptr %b, !1123, !DIExpression(), !1121)
    #dbg_value(i32 0, !1124, !DIExpression(), !1121)
  br label %for.cond, !dbg !1125

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1127
    #dbg_value(i32 %i.0, !1124, !DIExpression(), !1121)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !1128
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1130

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %r, i32 0, i32 %i.0, !dbg !1131
  %arrayidx2 = getelementptr inbounds nuw [4 x %struct.poly], ptr %a, i32 0, i32 %i.0, !dbg !1132
  %arrayidx4 = getelementptr inbounds nuw [4 x %struct.poly], ptr %b, i32 0, i32 %i.0, !dbg !1133
  call void @pqcrystals_kyber1024_ref_poly_add(ptr noundef %arrayidx, ptr noundef %arrayidx2, ptr noundef %arrayidx4) #3, !dbg !1134
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1135
    #dbg_value(i32 %inc, !1124, !DIExpression(), !1121)
  br label %for.cond, !dbg !1136, !llvm.loop !1137

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1139
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_compress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1140 {
entry:
  %t = alloca [8 x i8], align 1
    #dbg_value(ptr %r, !1150, !DIExpression(), !1151)
    #dbg_value(ptr %a, !1152, !DIExpression(), !1151)
    #dbg_declare(ptr %t, !1153, !DIExpression(), !1155)
    #dbg_value(i32 0, !1156, !DIExpression(), !1151)
  br label %for.cond, !dbg !1157

for.cond:                                         ; preds = %for.end, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc67, %for.end ], !dbg !1159
  %r.addr.0 = phi ptr [ %r, %entry ], [ %add.ptr, %for.end ]
    #dbg_value(ptr %r.addr.0, !1150, !DIExpression(), !1151)
    #dbg_value(i32 %i.0, !1156, !DIExpression(), !1151)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1160
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end68, !dbg !1162

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1163

for.cond1:                                        ; preds = %for.cond1.preheader, %for.body3
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond1.preheader ], !dbg !1166
    #dbg_value(i32 %j.0, !1167, !DIExpression(), !1151)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1168
  br i1 %exitcond, label %for.body3, label %for.end, !dbg !1163

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !1170
  %add = or disjoint i32 %mul, %j.0, !dbg !1172
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add, !dbg !1173
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1173
    #dbg_value(i16 %0, !1174, !DIExpression(), !1151)
  %isneg = icmp slt i16 %0, 0, !dbg !1175
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !1175
  %add5 = add i16 %and, %0, !dbg !1176
    #dbg_value(i16 %add5, !1174, !DIExpression(), !1151)
  %conv7 = sext i16 %add5 to i32, !dbg !1177
    #dbg_value(i32 %conv7, !1178, !DIExpression(DW_OP_constu, 5, DW_OP_shl, DW_OP_stack_value), !1151)
    #dbg_value(i32 %conv7, !1178, !DIExpression(DW_OP_constu, 5, DW_OP_shl, DW_OP_plus_uconst, 1664, DW_OP_stack_value), !1151)
  %1 = mul i32 %conv7, 1290176, !dbg !1179
  %mul9 = add i32 %1, 67089152, !dbg !1179
    #dbg_value(i32 %mul9, !1178, !DIExpression(), !1151)
  %shr10 = lshr i32 %mul9, 27, !dbg !1180
    #dbg_value(i32 %shr10, !1178, !DIExpression(), !1151)
  %conv12 = trunc nuw nsw i32 %shr10 to i8, !dbg !1181
  %arrayidx13 = getelementptr inbounds nuw [8 x i8], ptr %t, i32 0, i32 %j.0, !dbg !1182
  store i8 %conv12, ptr %arrayidx13, align 1, !dbg !1183
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1184
    #dbg_value(i32 %inc, !1167, !DIExpression(), !1151)
  br label %for.cond1, !dbg !1185, !llvm.loop !1186

for.end:                                          ; preds = %for.cond1
  %2 = load i8, ptr %t, align 1, !dbg !1188
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %t, i32 1, !dbg !1189
  %3 = load i8, ptr %arrayidx17, align 1, !dbg !1189
  %shl19 = shl i8 %3, 5, !dbg !1190
  %or = or i8 %shl19, %2, !dbg !1191
  store i8 %or, ptr %r.addr.0, align 1, !dbg !1192
  %4 = lshr i8 %3, 3, !dbg !1193
  %arrayidx25 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !1194
  %5 = load i8, ptr %arrayidx25, align 1, !dbg !1194
  %shl27 = shl i8 %5, 2, !dbg !1195
  %or28 = or i8 %shl27, %4, !dbg !1196
  %arrayidx29 = getelementptr inbounds nuw i8, ptr %t, i32 3, !dbg !1197
  %6 = load i8, ptr %arrayidx29, align 1, !dbg !1197
  %shl31 = shl i8 %6, 7, !dbg !1198
  %or32 = or i8 %or28, %shl31, !dbg !1199
  %arrayidx34 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 1, !dbg !1200
  store i8 %or32, ptr %arrayidx34, align 1, !dbg !1201
  %7 = lshr i8 %6, 1, !dbg !1202
  %arrayidx38 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !1203
  %8 = load i8, ptr %arrayidx38, align 1, !dbg !1203
  %shl40 = shl i8 %8, 4, !dbg !1204
  %or41 = or i8 %shl40, %7, !dbg !1205
  %arrayidx43 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 2, !dbg !1206
  store i8 %or41, ptr %arrayidx43, align 1, !dbg !1207
  %9 = lshr i8 %8, 4, !dbg !1208
  %arrayidx47 = getelementptr inbounds nuw i8, ptr %t, i32 5, !dbg !1209
  %10 = load i8, ptr %arrayidx47, align 1, !dbg !1209
  %shl49 = shl i8 %10, 1, !dbg !1210
  %or50 = or i8 %shl49, %9, !dbg !1211
  %arrayidx51 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !1212
  %11 = load i8, ptr %arrayidx51, align 1, !dbg !1212
  %shl53 = shl i8 %11, 6, !dbg !1213
  %or54 = or i8 %or50, %shl53, !dbg !1214
  %arrayidx56 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 3, !dbg !1215
  store i8 %or54, ptr %arrayidx56, align 1, !dbg !1216
  %12 = lshr i8 %11, 2, !dbg !1217
  %arrayidx60 = getelementptr inbounds nuw i8, ptr %t, i32 7, !dbg !1218
  %13 = load i8, ptr %arrayidx60, align 1, !dbg !1218
  %shl62 = shl i8 %13, 3, !dbg !1219
  %or63 = or i8 %shl62, %12, !dbg !1220
  %arrayidx65 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 4, !dbg !1221
  store i8 %or63, ptr %arrayidx65, align 1, !dbg !1222
    #dbg_value(ptr %r.addr.0, !1150, !DIExpression(DW_OP_plus_uconst, 5, DW_OP_stack_value), !1151)
  %add.ptr = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 5, !dbg !1223
    #dbg_value(ptr %add.ptr, !1150, !DIExpression(), !1151)
  %inc67 = add nuw nsw i32 %i.0, 1, !dbg !1224
    #dbg_value(i32 %inc67, !1156, !DIExpression(), !1151)
  br label %for.cond, !dbg !1225, !llvm.loop !1226

for.end68:                                        ; preds = %for.cond
  ret void, !dbg !1228
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_decompress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1229 {
entry:
  %t = alloca [8 x i8], align 1
    #dbg_value(ptr %r, !1233, !DIExpression(), !1234)
    #dbg_value(ptr %a, !1235, !DIExpression(), !1234)
    #dbg_declare(ptr %t, !1236, !DIExpression(), !1237)
    #dbg_value(i32 0, !1238, !DIExpression(), !1234)
  br label %for.cond, !dbg !1239

for.cond:                                         ; preds = %for.inc63, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc64, %for.inc63 ], !dbg !1241
  %a.addr.0 = phi ptr [ %a, %entry ], [ %add.ptr, %for.inc63 ]
    #dbg_value(ptr %a.addr.0, !1235, !DIExpression(), !1234)
    #dbg_value(i32 %i.0, !1238, !DIExpression(), !1234)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1242
  br i1 %exitcond1, label %for.body, label %for.end65, !dbg !1244

for.body:                                         ; preds = %for.cond
  %0 = load i8, ptr %a.addr.0, align 1, !dbg !1245
  store i8 %0, ptr %t, align 1, !dbg !1247
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 1, !dbg !1248
  %1 = load i8, ptr %arrayidx6, align 1, !dbg !1248
  %or = call i8 @llvm.fshl.i8(i8 %1, i8 %0, i8 3), !dbg !1249
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %t, i32 1, !dbg !1250
  store i8 %or, ptr %arrayidx9, align 1, !dbg !1251
  %2 = lshr i8 %1, 2, !dbg !1252
  %arrayidx14 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !1253
  store i8 %2, ptr %arrayidx14, align 1, !dbg !1254
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 1, !dbg !1255
  %3 = load i8, ptr %arrayidx15, align 1, !dbg !1255
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 2, !dbg !1256
  %4 = load i8, ptr %arrayidx18, align 1, !dbg !1256
  %or21 = call i8 @llvm.fshl.i8(i8 %4, i8 %3, i8 1), !dbg !1257
  %arrayidx23 = getelementptr inbounds nuw i8, ptr %t, i32 3, !dbg !1258
  store i8 %or21, ptr %arrayidx23, align 1, !dbg !1259
  %arrayidx27 = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 3, !dbg !1260
  %5 = load i8, ptr %arrayidx27, align 1, !dbg !1260
  %or30 = call i8 @llvm.fshl.i8(i8 %5, i8 %4, i8 4), !dbg !1261
  %arrayidx32 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !1262
  store i8 %or30, ptr %arrayidx32, align 1, !dbg !1263
  %6 = lshr i8 %5, 1, !dbg !1264
  %arrayidx37 = getelementptr inbounds nuw i8, ptr %t, i32 5, !dbg !1265
  store i8 %6, ptr %arrayidx37, align 1, !dbg !1266
  %arrayidx38 = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 3, !dbg !1267
  %7 = load i8, ptr %arrayidx38, align 1, !dbg !1267
  %arrayidx41 = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 4, !dbg !1268
  %8 = load i8, ptr %arrayidx41, align 1, !dbg !1268
  %or44 = call i8 @llvm.fshl.i8(i8 %8, i8 %7, i8 2), !dbg !1269
  %arrayidx46 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !1270
  store i8 %or44, ptr %arrayidx46, align 1, !dbg !1271
  %9 = lshr i8 %8, 3, !dbg !1272
  %arrayidx51 = getelementptr inbounds nuw i8, ptr %t, i32 7, !dbg !1273
  store i8 %9, ptr %arrayidx51, align 1, !dbg !1274
    #dbg_value(ptr %add.ptr, !1235, !DIExpression(), !1234)
    #dbg_value(i32 0, !1275, !DIExpression(), !1234)
  br label %for.cond52, !dbg !1276

for.cond52:                                       ; preds = %for.body55, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body55 ], !dbg !1278
    #dbg_value(i32 %j.0, !1275, !DIExpression(), !1234)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1279
  br i1 %exitcond, label %for.body55, label %for.inc63, !dbg !1281

for.body55:                                       ; preds = %for.cond52
  %arrayidx56 = getelementptr inbounds nuw [8 x i8], ptr %t, i32 0, i32 %j.0, !dbg !1282
  %10 = load i8, ptr %arrayidx56, align 1, !dbg !1282
  %11 = and i8 %10, 31, !dbg !1283
  %and = zext nneg i8 %11 to i32, !dbg !1283
  %mul = mul nuw nsw i32 %and, 3329, !dbg !1284
  %add = add nuw nsw i32 %mul, 16, !dbg !1285
  %shr58 = lshr i32 %add, 5, !dbg !1286
  %conv59 = trunc nuw nsw i32 %shr58 to i16, !dbg !1287
  %mul60 = shl nuw nsw i32 %i.0, 3, !dbg !1288
  %add61 = or disjoint i32 %mul60, %j.0, !dbg !1289
  %arrayidx62 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add61, !dbg !1290
  store i16 %conv59, ptr %arrayidx62, align 2, !dbg !1291
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1292
    #dbg_value(i32 %inc, !1275, !DIExpression(), !1234)
  br label %for.cond52, !dbg !1293, !llvm.loop !1294

for.inc63:                                        ; preds = %for.cond52
  %add.ptr = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 5, !dbg !1296
  %inc64 = add nuw nsw i32 %i.0, 1, !dbg !1297
    #dbg_value(i32 %inc64, !1238, !DIExpression(), !1234)
  br label %for.cond, !dbg !1298, !llvm.loop !1299

for.end65:                                        ; preds = %for.cond
  ret void, !dbg !1301
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_tobytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1302 {
entry:
    #dbg_value(ptr %r, !1303, !DIExpression(), !1304)
    #dbg_value(ptr %a, !1305, !DIExpression(), !1304)
    #dbg_value(i32 0, !1306, !DIExpression(), !1304)
  br label %for.cond, !dbg !1307

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1309
    #dbg_value(i32 %i.0, !1306, !DIExpression(), !1304)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !1310
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1312

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 1, !dbg !1313
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %mul, !dbg !1315
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1315
    #dbg_value(i16 %0, !1316, !DIExpression(), !1304)
  %isneg = icmp slt i16 %0, 0, !dbg !1317
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !1317
  %add = add i16 %and, %0, !dbg !1318
    #dbg_value(i16 %add, !1316, !DIExpression(), !1304)
  %mul4 = shl nuw nsw i32 %i.0, 1, !dbg !1319
  %add5 = or disjoint i32 %mul4, 1, !dbg !1320
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add5, !dbg !1321
  %1 = load i16, ptr %arrayidx6, align 2, !dbg !1321
    #dbg_value(i16 %1, !1322, !DIExpression(), !1304)
  %isneg1 = icmp slt i16 %1, 0, !dbg !1323
  %and9 = select i1 %isneg1, i16 3329, i16 0, !dbg !1323
  %add11 = add i16 %and9, %1, !dbg !1324
    #dbg_value(i16 %add11, !1322, !DIExpression(), !1304)
  %conv15 = trunc i16 %add to i8, !dbg !1325
  %mul16 = mul nuw nsw i32 %i.0, 3, !dbg !1326
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %r, i32 %mul16, !dbg !1327
  store i8 %conv15, ptr %arrayidx18, align 1, !dbg !1328
  %2 = lshr i16 %add, 8, !dbg !1329
  %shr20 = trunc nuw i16 %2 to i8, !dbg !1329
  %conv21 = trunc i16 %add11 to i8, !dbg !1330
  %shl = shl i8 %conv21, 4, !dbg !1331
  %or = or i8 %shl, %shr20, !dbg !1332
  %mul23 = mul nuw nsw i32 %i.0, 3, !dbg !1333
  %3 = getelementptr inbounds nuw i8, ptr %r, i32 %mul23, !dbg !1334
  %arrayidx25 = getelementptr inbounds nuw i8, ptr %3, i32 1, !dbg !1334
  store i8 %or, ptr %arrayidx25, align 1, !dbg !1335
  %4 = lshr i16 %add11, 4, !dbg !1336
  %conv28 = trunc i16 %4 to i8, !dbg !1337
  %mul29 = mul nuw nsw i32 %i.0, 3, !dbg !1338
  %5 = getelementptr inbounds nuw i8, ptr %r, i32 %mul29, !dbg !1339
  %arrayidx31 = getelementptr inbounds nuw i8, ptr %5, i32 2, !dbg !1339
  store i8 %conv28, ptr %arrayidx31, align 1, !dbg !1340
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1341
    #dbg_value(i32 %inc, !1306, !DIExpression(), !1304)
  br label %for.cond, !dbg !1342, !llvm.loop !1343

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1345
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_frombytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1346 {
entry:
    #dbg_value(ptr %r, !1347, !DIExpression(), !1348)
    #dbg_value(ptr %a, !1349, !DIExpression(), !1348)
    #dbg_value(i32 0, !1350, !DIExpression(), !1348)
  br label %for.cond, !dbg !1351

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1353
    #dbg_value(i32 %i.0, !1350, !DIExpression(), !1348)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !1354
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1356

for.body:                                         ; preds = %for.cond
  %mul = mul nuw nsw i32 %i.0, 3, !dbg !1357
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %mul, !dbg !1359
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1359
  %conv = zext i8 %0 to i16, !dbg !1359
  %mul1 = mul nuw nsw i32 %i.0, 3, !dbg !1360
  %1 = getelementptr inbounds nuw i8, ptr %a, i32 %mul1, !dbg !1361
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %1, i32 1, !dbg !1361
  %2 = load i8, ptr %arrayidx3, align 1, !dbg !1361
  %conv5 = zext i8 %2 to i16, !dbg !1362
  %shl = shl nuw i16 %conv5, 8, !dbg !1363
  %shl.masked = and i16 %shl, 3840, !dbg !1364
  %and = or disjoint i16 %shl.masked, %conv, !dbg !1364
  %mul7 = shl nuw nsw i32 %i.0, 1, !dbg !1365
  %arrayidx8 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul7, !dbg !1366
  store i16 %and, ptr %arrayidx8, align 2, !dbg !1367
  %mul9 = mul nuw nsw i32 %i.0, 3, !dbg !1368
  %3 = getelementptr inbounds nuw i8, ptr %a, i32 %mul9, !dbg !1369
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %3, i32 1, !dbg !1369
  %4 = load i8, ptr %arrayidx11, align 1, !dbg !1369
  %5 = lshr i8 %4, 4, !dbg !1370
  %shr13 = zext nneg i8 %5 to i16, !dbg !1370
  %mul14 = mul nuw nsw i32 %i.0, 3, !dbg !1371
  %6 = getelementptr inbounds nuw i8, ptr %a, i32 %mul14, !dbg !1372
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %6, i32 2, !dbg !1372
  %7 = load i8, ptr %arrayidx16, align 1, !dbg !1372
  %conv18 = zext i8 %7 to i16, !dbg !1373
  %shl19 = shl nuw nsw i16 %conv18, 4, !dbg !1374
  %or20 = or disjoint i16 %shl19, %shr13, !dbg !1375
  %mul24 = shl nuw nsw i32 %i.0, 1, !dbg !1376
  %add25 = or disjoint i32 %mul24, 1, !dbg !1377
  %arrayidx26 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add25, !dbg !1378
  store i16 %or20, ptr %arrayidx26, align 2, !dbg !1379
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1380
    #dbg_value(i32 %inc, !1350, !DIExpression(), !1348)
  br label %for.cond, !dbg !1381, !llvm.loop !1382

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1384
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_frommsg(ptr noundef %r, ptr noundef %msg) local_unnamed_addr #0 !dbg !1385 {
entry:
    #dbg_value(ptr %r, !1386, !DIExpression(), !1387)
    #dbg_value(ptr %msg, !1388, !DIExpression(), !1387)
    #dbg_value(i32 0, !1389, !DIExpression(), !1387)
  br label %for.cond, !dbg !1390

for.cond:                                         ; preds = %for.inc9, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc10, %for.inc9 ], !dbg !1392
    #dbg_value(i32 %i.0, !1389, !DIExpression(), !1387)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1393
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end11, !dbg !1395

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1396

for.cond1:                                        ; preds = %for.cond1.preheader, %for.body3
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond1.preheader ], !dbg !1399
    #dbg_value(i32 %j.0, !1400, !DIExpression(), !1387)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1401
  br i1 %exitcond, label %for.body3, label %for.inc9, !dbg !1396

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !1403
  %add = or disjoint i32 %mul, %j.0, !dbg !1405
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add, !dbg !1406
  store i16 0, ptr %arrayidx, align 2, !dbg !1407
  %add.ptr.idx = shl nuw nsw i32 %i.0, 4, !dbg !1408
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 %add.ptr.idx, !dbg !1408
  %add.ptr6 = getelementptr inbounds nuw i16, ptr %add.ptr, i32 %j.0, !dbg !1409
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1410
  %0 = load i8, ptr %arrayidx7, align 1, !dbg !1410
  %conv = zext i8 %0 to i32, !dbg !1410
  %shr = lshr i32 %conv, %j.0, !dbg !1411
  %1 = trunc nuw nsw i32 %shr to i16, !dbg !1412
  %conv8 = and i16 %1, 1, !dbg !1412
  call void @pqcrystals_kyber1024_ref_cmov_int16(ptr noundef %add.ptr6, i16 noundef signext 1665, i16 noundef zeroext %conv8) #3, !dbg !1413
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1414
    #dbg_value(i32 %inc, !1400, !DIExpression(), !1387)
  br label %for.cond1, !dbg !1415, !llvm.loop !1416

for.inc9:                                         ; preds = %for.cond1
  %inc10 = add nuw nsw i32 %i.0, 1, !dbg !1418
    #dbg_value(i32 %inc10, !1389, !DIExpression(), !1387)
  br label %for.cond, !dbg !1419, !llvm.loop !1420

for.end11:                                        ; preds = %for.cond
  ret void, !dbg !1422
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_tomsg(ptr noundef %msg, ptr noundef %a) local_unnamed_addr #0 !dbg !1423 {
entry:
    #dbg_value(ptr %msg, !1424, !DIExpression(), !1425)
    #dbg_value(ptr %a, !1426, !DIExpression(), !1425)
    #dbg_value(i32 0, !1427, !DIExpression(), !1425)
  br label %for.cond, !dbg !1428

for.cond:                                         ; preds = %for.inc11, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc12, %for.inc11 ], !dbg !1430
    #dbg_value(i32 %i.0, !1427, !DIExpression(), !1425)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1431
  br i1 %exitcond1, label %for.body, label %for.end13, !dbg !1433

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1434
  store i8 0, ptr %arrayidx, align 1, !dbg !1436
    #dbg_value(i32 0, !1437, !DIExpression(), !1425)
  br label %for.cond1, !dbg !1438

for.cond1:                                        ; preds = %for.body3, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body3 ], !dbg !1440
    #dbg_value(i32 %j.0, !1437, !DIExpression(), !1425)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1441
  br i1 %exitcond, label %for.body3, label %for.inc11, !dbg !1443

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !1444
  %add = or disjoint i32 %mul, %j.0, !dbg !1446
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add, !dbg !1447
  %0 = load i16, ptr %arrayidx4, align 2, !dbg !1447
  %conv = sext i16 %0 to i32, !dbg !1447
    #dbg_value(i32 %conv, !1448, !DIExpression(), !1425)
    #dbg_value(i32 %conv, !1448, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_stack_value), !1425)
    #dbg_value(i32 %conv, !1448, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !1425)
  %1 = mul i32 %conv, 161270, !dbg !1449
  %mul6 = add i32 %1, 134257275, !dbg !1449
    #dbg_value(i32 %mul6, !1448, !DIExpression(), !1425)
  %shr = lshr i32 %mul6, 28, !dbg !1450
    #dbg_value(i32 %shr, !1448, !DIExpression(), !1425)
  %and = and i32 %shr, 1, !dbg !1451
    #dbg_value(i32 %and, !1448, !DIExpression(), !1425)
  %shl7 = shl nuw nsw i32 %and, %j.0, !dbg !1452
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1453
  %2 = load i8, ptr %arrayidx8, align 1, !dbg !1454
  %3 = trunc nuw i32 %shl7 to i8, !dbg !1454
  %conv10 = or i8 %2, %3, !dbg !1454
  store i8 %conv10, ptr %arrayidx8, align 1, !dbg !1454
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1455
    #dbg_value(i32 %inc, !1437, !DIExpression(), !1425)
  br label %for.cond1, !dbg !1456, !llvm.loop !1457

for.inc11:                                        ; preds = %for.cond1
  %inc12 = add nuw nsw i32 %i.0, 1, !dbg !1459
    #dbg_value(i32 %inc12, !1427, !DIExpression(), !1425)
  br label %for.cond, !dbg !1460, !llvm.loop !1461

for.end13:                                        ; preds = %for.cond
  ret void, !dbg !1463
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_getnoise_eta1(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !1464 {
entry:
  %buf = alloca [128 x i8], align 1
    #dbg_value(ptr %r, !1467, !DIExpression(), !1468)
    #dbg_value(ptr %seed, !1469, !DIExpression(), !1468)
    #dbg_value(i8 %nonce, !1470, !DIExpression(), !1468)
    #dbg_declare(ptr %buf, !1471, !DIExpression(), !1473)
  call void @pqcrystals_kyber1024_ref_kyber_shake256_prf(ptr noundef nonnull %buf, i32 noundef 128, ptr noundef %seed, i8 noundef zeroext %nonce) #3, !dbg !1474
  call void @pqcrystals_kyber1024_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef nonnull %buf) #3, !dbg !1475
  ret void, !dbg !1476
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_getnoise_eta2(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !1477 {
entry:
  %buf = alloca [128 x i8], align 1
    #dbg_value(ptr %r, !1478, !DIExpression(), !1479)
    #dbg_value(ptr %seed, !1480, !DIExpression(), !1479)
    #dbg_value(i8 %nonce, !1481, !DIExpression(), !1479)
    #dbg_declare(ptr %buf, !1482, !DIExpression(), !1483)
  call void @pqcrystals_kyber1024_ref_kyber_shake256_prf(ptr noundef nonnull %buf, i32 noundef 128, ptr noundef %seed, i8 noundef zeroext %nonce) #3, !dbg !1484
  call void @pqcrystals_kyber1024_ref_poly_cbd_eta2(ptr noundef %r, ptr noundef nonnull %buf) #3, !dbg !1485
  ret void, !dbg !1486
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1487 {
entry:
    #dbg_value(ptr %r, !1490, !DIExpression(), !1491)
  call void @pqcrystals_kyber1024_ref_ntt(ptr noundef %r) #3, !dbg !1492
  call void @pqcrystals_kyber1024_ref_poly_reduce(ptr noundef %r) #3, !dbg !1493
  ret void, !dbg !1494
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_reduce(ptr noundef %r) local_unnamed_addr #0 !dbg !1495 {
entry:
    #dbg_value(ptr %r, !1496, !DIExpression(), !1497)
    #dbg_value(i32 0, !1498, !DIExpression(), !1497)
  br label %for.cond, !dbg !1499

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1501
    #dbg_value(i32 %i.0, !1498, !DIExpression(), !1497)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1502
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1504

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1505
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1505
  %call = call signext i16 @pqcrystals_kyber1024_ref_barrett_reduce(i16 noundef signext %0) #3, !dbg !1506
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1507
  store i16 %call, ptr %arrayidx2, align 2, !dbg !1508
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1509
    #dbg_value(i32 %inc, !1498, !DIExpression(), !1497)
  br label %for.cond, !dbg !1510, !llvm.loop !1511

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1513
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_invntt_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !1514 {
entry:
    #dbg_value(ptr %r, !1515, !DIExpression(), !1516)
  call void @pqcrystals_kyber1024_ref_invntt(ptr noundef %r) #3, !dbg !1517
  ret void, !dbg !1518
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1519 {
entry:
    #dbg_value(ptr %r, !1522, !DIExpression(), !1523)
    #dbg_value(ptr %a, !1524, !DIExpression(), !1523)
    #dbg_value(ptr %b, !1525, !DIExpression(), !1523)
    #dbg_value(i32 0, !1526, !DIExpression(), !1523)
  br label %for.cond, !dbg !1527

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1529
    #dbg_value(i32 %i.0, !1526, !DIExpression(), !1523)
  %exitcond = icmp ne i32 %i.0, 64, !dbg !1530
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1532

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 2, !dbg !1533
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul, !dbg !1535
  %mul2 = shl nuw nsw i32 %i.0, 2, !dbg !1536
  %arrayidx3 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %mul2, !dbg !1537
  %mul5 = shl nuw nsw i32 %i.0, 2, !dbg !1538
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %mul5, !dbg !1539
  %add = or disjoint i32 %i.0, 64, !dbg !1540
  %arrayidx7 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber1024_ref_zetas, i32 0, i32 %add, !dbg !1541
  %0 = load i16, ptr %arrayidx7, align 2, !dbg !1541
  call void @pqcrystals_kyber1024_ref_basemul(ptr noundef %arrayidx, ptr noundef %arrayidx3, ptr noundef %arrayidx6, i16 noundef signext %0) #3, !dbg !1542
  %mul9 = shl nuw nsw i32 %i.0, 2, !dbg !1543
  %add10 = or disjoint i32 %mul9, 2, !dbg !1544
  %arrayidx11 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add10, !dbg !1545
  %mul13 = shl nuw nsw i32 %i.0, 2, !dbg !1546
  %add14 = or disjoint i32 %mul13, 2, !dbg !1547
  %arrayidx15 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add14, !dbg !1548
  %mul17 = shl nuw nsw i32 %i.0, 2, !dbg !1549
  %add18 = or disjoint i32 %mul17, 2, !dbg !1550
  %arrayidx19 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %add18, !dbg !1551
  %add20 = or disjoint i32 %i.0, 64, !dbg !1552
  %arrayidx21 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber1024_ref_zetas, i32 0, i32 %add20, !dbg !1553
  %1 = load i16, ptr %arrayidx21, align 2, !dbg !1553
  %sub = sub i16 0, %1, !dbg !1554
  call void @pqcrystals_kyber1024_ref_basemul(ptr noundef nonnull %arrayidx11, ptr noundef nonnull %arrayidx15, ptr noundef nonnull %arrayidx19, i16 noundef signext %sub) #3, !dbg !1555
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1556
    #dbg_value(i32 %inc, !1526, !DIExpression(), !1523)
  br label %for.cond, !dbg !1557, !llvm.loop !1558

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1560
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !1561 {
entry:
    #dbg_value(ptr %r, !1562, !DIExpression(), !1563)
    #dbg_value(i16 1353, !1564, !DIExpression(), !1563)
    #dbg_value(i32 0, !1565, !DIExpression(), !1563)
  br label %for.cond, !dbg !1566

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1568
    #dbg_value(i32 %i.0, !1565, !DIExpression(), !1563)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1569
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1571

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1572
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1572
  %conv = sext i16 %0 to i32, !dbg !1573
  %mul = mul nsw i32 %conv, 1353, !dbg !1574
  %call = call signext i16 @pqcrystals_kyber1024_ref_montgomery_reduce(i32 noundef %mul) #3, !dbg !1575
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1576
  store i16 %call, ptr %arrayidx2, align 2, !dbg !1577
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1578
    #dbg_value(i32 %inc, !1565, !DIExpression(), !1563)
  br label %for.cond, !dbg !1579, !llvm.loop !1580

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1582
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1583 {
entry:
    #dbg_value(ptr %r, !1584, !DIExpression(), !1585)
    #dbg_value(ptr %a, !1586, !DIExpression(), !1585)
    #dbg_value(ptr %b, !1587, !DIExpression(), !1585)
    #dbg_value(i32 0, !1588, !DIExpression(), !1585)
  br label %for.cond, !dbg !1589

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1591
    #dbg_value(i32 %i.0, !1588, !DIExpression(), !1585)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1592
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1594

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %i.0, !dbg !1595
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1595
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %i.0, !dbg !1596
  %1 = load i16, ptr %arrayidx2, align 2, !dbg !1596
  %add = add i16 %0, %1, !dbg !1597
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1598
  store i16 %add, ptr %arrayidx6, align 2, !dbg !1599
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1600
    #dbg_value(i32 %inc, !1588, !DIExpression(), !1585)
  br label %for.cond, !dbg !1601, !llvm.loop !1602

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1604
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_sub(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1605 {
entry:
    #dbg_value(ptr %r, !1606, !DIExpression(), !1607)
    #dbg_value(ptr %a, !1608, !DIExpression(), !1607)
    #dbg_value(ptr %b, !1609, !DIExpression(), !1607)
    #dbg_value(i32 0, !1610, !DIExpression(), !1607)
  br label %for.cond, !dbg !1611

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1613
    #dbg_value(i32 %i.0, !1610, !DIExpression(), !1607)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1614
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1616

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %i.0, !dbg !1617
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1617
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %i.0, !dbg !1618
  %1 = load i16, ptr %arrayidx2, align 2, !dbg !1618
  %sub = sub i16 %0, %1, !dbg !1619
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1620
  store i16 %sub, ptr %arrayidx6, align 2, !dbg !1621
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1622
    #dbg_value(i32 %inc, !1610, !DIExpression(), !1607)
  br label %for.cond, !dbg !1623, !llvm.loop !1624

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1626
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1627 {
entry:
    #dbg_value(ptr %r, !1630, !DIExpression(), !1631)
    #dbg_value(i32 1, !1632, !DIExpression(), !1631)
    #dbg_value(i32 128, !1633, !DIExpression(), !1631)
  br label %for.cond, !dbg !1634

for.cond:                                         ; preds = %for.inc24, %entry
  %len.0 = phi i32 [ 128, %entry ], [ %shr, %for.inc24 ], !dbg !1636
  %k.0 = phi i32 [ 1, %entry ], [ %k.1.lcssa, %for.inc24 ], !dbg !1637
    #dbg_value(i32 %k.0, !1632, !DIExpression(), !1631)
    #dbg_value(i32 %len.0, !1633, !DIExpression(), !1631)
  %cmp = icmp samesign ugt i32 %len.0, 1, !dbg !1638
  br i1 %cmp, label %for.cond1.preheader, label %for.end25, !dbg !1640

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1641

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc21
  %start.0 = phi i32 [ %add22, %for.inc21 ], [ 0, %for.cond1.preheader ], !dbg !1644
  %k.1 = phi i32 [ %inc, %for.inc21 ], [ %k.0, %for.cond1.preheader ], !dbg !1631
    #dbg_value(i32 %k.1, !1632, !DIExpression(), !1631)
    #dbg_value(i32 %start.0, !1645, !DIExpression(), !1631)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !1646
  br i1 %cmp2, label %for.body3, label %for.inc24, !dbg !1641

for.body3:                                        ; preds = %for.cond1
    #dbg_value(i32 %inc, !1632, !DIExpression(), !1631)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber1024_ref_zetas, i32 0, i32 %k.1, !dbg !1648
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1648
    #dbg_value(i16 %0, !1650, !DIExpression(), !1631)
    #dbg_value(i32 %start.0, !1651, !DIExpression(), !1631)
  br label %for.cond4, !dbg !1652

for.cond4:                                        ; preds = %for.body6, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc20, %for.body6 ], !dbg !1654
    #dbg_value(i32 %j.0, !1651, !DIExpression(), !1631)
  %add = add nuw nsw i32 %start.0, %len.0, !dbg !1655
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !1657
  br i1 %cmp5, label %for.body6, label %for.inc21, !dbg !1658

for.body6:                                        ; preds = %for.cond4
  %1 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1659
  %arrayidx8 = getelementptr i16, ptr %1, i32 %len.0, !dbg !1659
  %2 = load i16, ptr %arrayidx8, align 2, !dbg !1659
  %call = call fastcc signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %2) #3, !dbg !1661
    #dbg_value(i16 %call, !1662, !DIExpression(), !1631)
  %arrayidx9 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1663
  %3 = load i16, ptr %arrayidx9, align 2, !dbg !1663
  %sub = sub i16 %3, %call, !dbg !1664
  %4 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1665
  %arrayidx13 = getelementptr i16, ptr %4, i32 %len.0, !dbg !1665
  store i16 %sub, ptr %arrayidx13, align 2, !dbg !1666
  %arrayidx14 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1667
  %5 = load i16, ptr %arrayidx14, align 2, !dbg !1667
  %add17 = add i16 %5, %call, !dbg !1668
  %arrayidx19 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1669
  store i16 %add17, ptr %arrayidx19, align 2, !dbg !1670
  %inc20 = add nuw i32 %j.0, 1, !dbg !1671
    #dbg_value(i32 %inc20, !1651, !DIExpression(), !1631)
  br label %for.cond4, !dbg !1672, !llvm.loop !1673

for.inc21:                                        ; preds = %for.cond4
  %j.0.lcssa = phi i32 [ %j.0, %for.cond4 ], !dbg !1654
  %inc = add i32 %k.1, 1, !dbg !1675
  %add22 = add i32 %j.0.lcssa, %len.0, !dbg !1676
    #dbg_value(i32 %add22, !1645, !DIExpression(), !1631)
  br label %for.cond1, !dbg !1677, !llvm.loop !1678

for.inc24:                                        ; preds = %for.cond1
  %k.1.lcssa = phi i32 [ %k.1, %for.cond1 ], !dbg !1631
  %shr = lshr i32 %len.0, 1, !dbg !1680
    #dbg_value(i32 %shr, !1633, !DIExpression(), !1631)
  br label %for.cond, !dbg !1681, !llvm.loop !1682

for.end25:                                        ; preds = %for.cond
  ret void, !dbg !1684
}

; Function Attrs: nounwind
define internal fastcc signext i16 @fqmul(i16 noundef signext %a, i16 noundef signext %b) unnamed_addr #0 !dbg !1685 {
entry:
    #dbg_value(i16 %a, !1688, !DIExpression(), !1689)
    #dbg_value(i16 %b, !1690, !DIExpression(), !1689)
  %conv = sext i16 %a to i32, !dbg !1691
  %conv1 = sext i16 %b to i32, !dbg !1692
  %mul = mul nsw i32 %conv, %conv1, !dbg !1693
  %call = call signext i16 @pqcrystals_kyber1024_ref_montgomery_reduce(i32 noundef %mul) #3, !dbg !1694
  ret i16 %call, !dbg !1695
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_invntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1696 {
entry:
    #dbg_value(ptr %r, !1697, !DIExpression(), !1698)
    #dbg_value(i16 1441, !1699, !DIExpression(), !1698)
    #dbg_value(i32 127, !1700, !DIExpression(), !1698)
    #dbg_value(i32 2, !1701, !DIExpression(), !1698)
  br label %for.cond, !dbg !1702

for.cond:                                         ; preds = %for.inc29, %entry
  %len.0 = phi i32 [ 2, %entry ], [ %shl, %for.inc29 ], !dbg !1704
  %k.0 = phi i32 [ 127, %entry ], [ %k.1.lcssa, %for.inc29 ], !dbg !1705
    #dbg_value(i32 %k.0, !1700, !DIExpression(), !1698)
    #dbg_value(i32 %len.0, !1701, !DIExpression(), !1698)
  %cmp = icmp ult i32 %len.0, 129, !dbg !1706
  br i1 %cmp, label %for.cond1.preheader, label %for.cond31.preheader, !dbg !1708

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1709

for.cond31.preheader:                             ; preds = %for.cond
  br label %for.cond31, !dbg !1712

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc26
  %start.0 = phi i32 [ %add27, %for.inc26 ], [ 0, %for.cond1.preheader ], !dbg !1714
  %k.1 = phi i32 [ %dec, %for.inc26 ], [ %k.0, %for.cond1.preheader ], !dbg !1698
    #dbg_value(i32 %k.1, !1700, !DIExpression(), !1698)
    #dbg_value(i32 %start.0, !1715, !DIExpression(), !1698)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !1716
  br i1 %cmp2, label %for.body3, label %for.inc29, !dbg !1709

for.body3:                                        ; preds = %for.cond1
    #dbg_value(i32 %dec, !1700, !DIExpression(), !1698)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber1024_ref_zetas, i32 0, i32 %k.1, !dbg !1718
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1718
    #dbg_value(i16 %0, !1720, !DIExpression(), !1698)
    #dbg_value(i32 %start.0, !1721, !DIExpression(), !1698)
  br label %for.cond4, !dbg !1722

for.cond4:                                        ; preds = %for.body6, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc, %for.body6 ], !dbg !1724
    #dbg_value(i32 %j.0, !1721, !DIExpression(), !1698)
  %add = add nuw nsw i32 %start.0, %len.0, !dbg !1725
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !1727
  br i1 %cmp5, label %for.body6, label %for.inc26, !dbg !1728

for.body6:                                        ; preds = %for.cond4
  %arrayidx7 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1729
  %1 = load i16, ptr %arrayidx7, align 2, !dbg !1729
    #dbg_value(i16 %1, !1731, !DIExpression(), !1698)
  %2 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1732
  %arrayidx9 = getelementptr i16, ptr %2, i32 %len.0, !dbg !1732
  %3 = load i16, ptr %arrayidx9, align 2, !dbg !1732
  %add11 = add i16 %1, %3, !dbg !1733
  %call = call signext i16 @pqcrystals_kyber1024_ref_barrett_reduce(i16 noundef signext %add11) #3, !dbg !1734
  %arrayidx13 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1735
  store i16 %call, ptr %arrayidx13, align 2, !dbg !1736
  %4 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1737
  %arrayidx15 = getelementptr i16, ptr %4, i32 %len.0, !dbg !1737
  %5 = load i16, ptr %arrayidx15, align 2, !dbg !1737
  %sub = sub i16 %5, %1, !dbg !1738
  %6 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1739
  %arrayidx20 = getelementptr i16, ptr %6, i32 %len.0, !dbg !1739
  store i16 %sub, ptr %arrayidx20, align 2, !dbg !1740
  %7 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1741
  %arrayidx22 = getelementptr i16, ptr %7, i32 %len.0, !dbg !1741
  %8 = load i16, ptr %arrayidx22, align 2, !dbg !1741
  %call23 = call fastcc signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %8) #3, !dbg !1742
  %9 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1743
  %arrayidx25 = getelementptr i16, ptr %9, i32 %len.0, !dbg !1743
  store i16 %call23, ptr %arrayidx25, align 2, !dbg !1744
  %inc = add nuw i32 %j.0, 1, !dbg !1745
    #dbg_value(i32 %inc, !1721, !DIExpression(), !1698)
  br label %for.cond4, !dbg !1746, !llvm.loop !1747

for.inc26:                                        ; preds = %for.cond4
  %j.0.lcssa = phi i32 [ %j.0, %for.cond4 ], !dbg !1724
  %dec = add i32 %k.1, -1, !dbg !1749
  %add27 = add i32 %j.0.lcssa, %len.0, !dbg !1750
    #dbg_value(i32 %add27, !1715, !DIExpression(), !1698)
  br label %for.cond1, !dbg !1751, !llvm.loop !1752

for.inc29:                                        ; preds = %for.cond1
  %k.1.lcssa = phi i32 [ %k.1, %for.cond1 ], !dbg !1698
  %shl = shl nuw nsw i32 %len.0, 1, !dbg !1754
    #dbg_value(i32 %shl, !1701, !DIExpression(), !1698)
  br label %for.cond, !dbg !1755, !llvm.loop !1756

for.cond31:                                       ; preds = %for.cond31.preheader, %for.body34
  %j.1 = phi i32 [ %inc39, %for.body34 ], [ 0, %for.cond31.preheader ], !dbg !1758
    #dbg_value(i32 %j.1, !1721, !DIExpression(), !1698)
  %exitcond = icmp ne i32 %j.1, 256, !dbg !1759
  br i1 %exitcond, label %for.body34, label %for.end40, !dbg !1712

for.body34:                                       ; preds = %for.cond31
  %arrayidx35 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !1761
  %10 = load i16, ptr %arrayidx35, align 2, !dbg !1761
  %call36 = call fastcc signext i16 @fqmul(i16 noundef signext %10, i16 noundef signext 1441) #3, !dbg !1762
  %arrayidx37 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !1763
  store i16 %call36, ptr %arrayidx37, align 2, !dbg !1764
  %inc39 = add nuw nsw i32 %j.1, 1, !dbg !1765
    #dbg_value(i32 %inc39, !1721, !DIExpression(), !1698)
  br label %for.cond31, !dbg !1766, !llvm.loop !1767

for.end40:                                        ; preds = %for.cond31
  ret void, !dbg !1769
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_basemul(ptr noundef %r, ptr noundef %a, ptr noundef %b, i16 noundef signext %zeta) local_unnamed_addr #0 !dbg !1770 {
entry:
    #dbg_value(ptr %r, !1774, !DIExpression(), !1775)
    #dbg_value(ptr %a, !1776, !DIExpression(), !1775)
    #dbg_value(ptr %b, !1777, !DIExpression(), !1775)
    #dbg_value(i16 %zeta, !1778, !DIExpression(), !1775)
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 2, !dbg !1779
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1779
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 2, !dbg !1780
  %1 = load i16, ptr %arrayidx1, align 2, !dbg !1780
  %call = call fastcc signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %1) #3, !dbg !1781
  store i16 %call, ptr %r, align 2, !dbg !1782
  %call4 = call fastcc signext i16 @fqmul(i16 noundef signext %call, i16 noundef signext %zeta) #3, !dbg !1783
  store i16 %call4, ptr %r, align 2, !dbg !1784
  %2 = load i16, ptr %a, align 2, !dbg !1785
  %3 = load i16, ptr %b, align 2, !dbg !1786
  %call8 = call fastcc signext i16 @fqmul(i16 noundef signext %2, i16 noundef signext %3) #3, !dbg !1787
  %4 = load i16, ptr %r, align 2, !dbg !1788
  %add = add i16 %4, %call8, !dbg !1788
  store i16 %add, ptr %r, align 2, !dbg !1788
  %5 = load i16, ptr %a, align 2, !dbg !1789
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %b, i32 2, !dbg !1790
  %6 = load i16, ptr %arrayidx13, align 2, !dbg !1790
  %call14 = call fastcc signext i16 @fqmul(i16 noundef signext %5, i16 noundef signext %6) #3, !dbg !1791
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %r, i32 2, !dbg !1792
  store i16 %call14, ptr %arrayidx15, align 2, !dbg !1793
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %a, i32 2, !dbg !1794
  %7 = load i16, ptr %arrayidx16, align 2, !dbg !1794
  %8 = load i16, ptr %b, align 2, !dbg !1795
  %call18 = call fastcc signext i16 @fqmul(i16 noundef signext %7, i16 noundef signext %8) #3, !dbg !1796
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %r, i32 2, !dbg !1797
  %9 = load i16, ptr %arrayidx20, align 2, !dbg !1798
  %add22 = add i16 %9, %call18, !dbg !1798
  store i16 %add22, ptr %arrayidx20, align 2, !dbg !1798
  ret void, !dbg !1799
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef %buf) local_unnamed_addr #0 !dbg !1800 {
entry:
    #dbg_value(ptr %r, !1809, !DIExpression(), !1810)
    #dbg_value(ptr %buf, !1811, !DIExpression(), !1810)
  call fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) #3, !dbg !1812
  ret void, !dbg !1813
}

; Function Attrs: nounwind
define internal fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) unnamed_addr #0 !dbg !1814 {
entry:
    #dbg_value(ptr %r, !1815, !DIExpression(), !1816)
    #dbg_value(ptr %buf, !1817, !DIExpression(), !1816)
    #dbg_value(i32 0, !1818, !DIExpression(), !1816)
  br label %for.cond, !dbg !1819

for.cond:                                         ; preds = %for.inc19, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc20, %for.inc19 ], !dbg !1821
    #dbg_value(i32 %i.0, !1818, !DIExpression(), !1816)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1822
  br i1 %exitcond1, label %for.body, label %for.end21, !dbg !1824

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 2, !dbg !1825
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 %mul, !dbg !1827
  %call = call fastcc i32 @load32_littleendian(ptr noundef %add.ptr) #3, !dbg !1828
    #dbg_value(i32 %call, !1829, !DIExpression(), !1816)
  %and = and i32 %call, 1431655765, !dbg !1830
    #dbg_value(i32 %and, !1831, !DIExpression(), !1816)
  %shr = lshr i32 %call, 1, !dbg !1832
  %and1 = and i32 %shr, 1431655765, !dbg !1833
  %add = add nuw i32 %and, %and1, !dbg !1834
    #dbg_value(i32 %add, !1831, !DIExpression(), !1816)
    #dbg_value(i32 0, !1835, !DIExpression(), !1816)
  br label %for.cond2, !dbg !1836

for.cond2:                                        ; preds = %for.body4, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body4 ], !dbg !1838
    #dbg_value(i32 %j.0, !1835, !DIExpression(), !1816)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1839
  br i1 %exitcond, label %for.body4, label %for.inc19, !dbg !1841

for.body4:                                        ; preds = %for.cond2
  %mul5 = shl nuw nsw i32 %j.0, 2, !dbg !1842
  %shr7 = lshr i32 %add, %mul5, !dbg !1844
  %conv = and i32 %shr7, 3, !dbg !1845
    #dbg_value(i32 %shr7, !1846, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3, DW_OP_and, DW_OP_stack_value), !1816)
  %mul9 = shl nuw nsw i32 %j.0, 2, !dbg !1847
  %add10 = or disjoint i32 %mul9, 2, !dbg !1848
  %shr11 = lshr i32 %add, %add10, !dbg !1849
  %conv13 = and i32 %shr11, 3, !dbg !1850
    #dbg_value(i32 %conv13, !1851, !DIExpression(), !1816)
  %sub = sub nsw i32 %conv, %conv13, !dbg !1852
  %conv16 = trunc nsw i32 %sub to i16, !dbg !1853
  %mul17 = shl nuw nsw i32 %i.0, 3, !dbg !1854
  %add18 = or disjoint i32 %mul17, %j.0, !dbg !1855
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add18, !dbg !1856
  store i16 %conv16, ptr %arrayidx, align 2, !dbg !1857
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1858
    #dbg_value(i32 %inc, !1835, !DIExpression(), !1816)
  br label %for.cond2, !dbg !1859, !llvm.loop !1860

for.inc19:                                        ; preds = %for.cond2
  %inc20 = add nuw nsw i32 %i.0, 1, !dbg !1862
    #dbg_value(i32 %inc20, !1818, !DIExpression(), !1816)
  br label %for.cond, !dbg !1863, !llvm.loop !1864

for.end21:                                        ; preds = %for.cond
  ret void, !dbg !1866
}

; Function Attrs: nounwind
define internal fastcc i32 @load32_littleendian(ptr noundef %x) unnamed_addr #0 !dbg !1867 {
entry:
    #dbg_value(ptr %x, !1870, !DIExpression(), !1871)
  %0 = load i8, ptr %x, align 1, !dbg !1872
  %conv = zext i8 %0 to i32, !dbg !1873
    #dbg_value(i32 %conv, !1874, !DIExpression(), !1871)
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %x, i32 1, !dbg !1875
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !1875
  %conv2 = zext i8 %1 to i32, !dbg !1876
  %shl = shl nuw nsw i32 %conv2, 8, !dbg !1877
  %or = or disjoint i32 %shl, %conv, !dbg !1878
    #dbg_value(i32 %or, !1874, !DIExpression(), !1871)
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %x, i32 2, !dbg !1879
  %2 = load i8, ptr %arrayidx3, align 1, !dbg !1879
  %conv4 = zext i8 %2 to i32, !dbg !1880
  %shl5 = shl nuw nsw i32 %conv4, 16, !dbg !1881
  %or6 = or disjoint i32 %or, %shl5, !dbg !1882
    #dbg_value(i32 %or6, !1874, !DIExpression(), !1871)
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %x, i32 3, !dbg !1883
  %3 = load i8, ptr %arrayidx7, align 1, !dbg !1883
  %conv8 = zext i8 %3 to i32, !dbg !1884
  %shl9 = shl nuw i32 %conv8, 24, !dbg !1885
  %or10 = or disjoint i32 %or6, %shl9, !dbg !1886
    #dbg_value(i32 %or10, !1874, !DIExpression(), !1871)
  ret i32 %or10, !dbg !1887
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_cbd_eta2(ptr noundef %r, ptr noundef %buf) local_unnamed_addr #0 !dbg !1888 {
entry:
    #dbg_value(ptr %r, !1889, !DIExpression(), !1890)
    #dbg_value(ptr %buf, !1891, !DIExpression(), !1890)
  call fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) #3, !dbg !1892
  ret void, !dbg !1893
}

; Function Attrs: nounwind
define dso_local signext i16 @pqcrystals_kyber1024_ref_montgomery_reduce(i32 noundef %a) local_unnamed_addr #0 !dbg !1894 {
entry:
    #dbg_value(i32 %a, !1897, !DIExpression(), !1898)
    #dbg_value(i32 %a, !1899, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !1898)
  %sext = mul i32 %a, -218038272, !dbg !1900
  %conv3 = ashr exact i32 %sext, 16, !dbg !1900
  %mul4.neg = mul nsw i32 %conv3, -3329, !dbg !1901
  %sub = add i32 %mul4.neg, %a, !dbg !1902
  %shr = lshr i32 %sub, 16, !dbg !1903
  %conv5 = trunc nuw i32 %shr to i16, !dbg !1904
    #dbg_value(i16 %conv5, !1899, !DIExpression(), !1898)
  ret i16 %conv5, !dbg !1905
}

; Function Attrs: nounwind
define dso_local signext i16 @pqcrystals_kyber1024_ref_barrett_reduce(i16 noundef signext %a) local_unnamed_addr #0 !dbg !1906 {
entry:
    #dbg_value(i16 %a, !1909, !DIExpression(), !1910)
    #dbg_value(i16 20159, !1911, !DIExpression(), !1910)
  %conv = sext i16 %a to i32, !dbg !1912
  %mul = mul nsw i32 %conv, 20159, !dbg !1913
  %add = add nsw i32 %mul, 33554432, !dbg !1914
  %shr = ashr i32 %add, 26, !dbg !1915
    #dbg_value(i32 %shr, !1916, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1910)
    #dbg_value(i32 %shr, !1916, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1910)
  %0 = trunc nsw i32 %shr to i16, !dbg !1917
  %1 = mul i16 %0, -3329, !dbg !1917
  %conv7 = add i16 %1, %a, !dbg !1917
  ret i16 %conv7, !dbg !1918
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqcrystals_kyber1024_ref_verify(ptr noundef %a, ptr noundef %b, i32 noundef %len) local_unnamed_addr #0 !dbg !1919 {
entry:
    #dbg_value(ptr %a, !1923, !DIExpression(), !1924)
    #dbg_value(ptr %b, !1925, !DIExpression(), !1924)
    #dbg_value(i32 %len, !1926, !DIExpression(), !1924)
    #dbg_value(i8 0, !1927, !DIExpression(), !1924)
    #dbg_value(i32 0, !1928, !DIExpression(), !1924)
  br label %for.cond, !dbg !1929

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1931
  %r.0 = phi i8 [ 0, %entry ], [ %or2, %for.inc ], !dbg !1924
    #dbg_value(i8 %r.0, !1927, !DIExpression(), !1924)
    #dbg_value(i32 %i.0, !1928, !DIExpression(), !1924)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !1932
  br i1 %exitcond, label %for.inc, label %for.end, !dbg !1934

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i8 poison, i8 poison, i8 poison), !1927, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1924)
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %i.0, !dbg !1935
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1935
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 %i.0, !dbg !1936
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !1936
    #dbg_value(!DIArgList(i8 %r.0, i8 %0, i8 %1), !1927, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1924)
  %xor1 = xor i8 %0, %1, !dbg !1937
    #dbg_value(!DIArgList(i8 %r.0, i8 %xor1), !1927, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1924)
  %or2 = or i8 %r.0, %xor1, !dbg !1938
    #dbg_value(i8 %or2, !1927, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1924)
    #dbg_value(i8 %or2, !1927, !DIExpression(), !1924)
  %inc = add i32 %i.0, 1, !dbg !1939
    #dbg_value(i32 %inc, !1928, !DIExpression(), !1924)
  br label %for.cond, !dbg !1940, !llvm.loop !1941

for.end:                                          ; preds = %for.cond
  %r.0.lcssa = phi i8 [ %r.0, %for.cond ], !dbg !1924
  %2 = icmp ne i8 %r.0.lcssa, 0, !dbg !1943
  %conv6 = zext i1 %2 to i32, !dbg !1944
  ret i32 %conv6, !dbg !1945
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_cmov(ptr noundef %r, ptr noundef %x, i32 noundef %len, i8 noundef zeroext %b) local_unnamed_addr #0 !dbg !1946 {
entry:
    #dbg_value(ptr %r, !1949, !DIExpression(), !1950)
    #dbg_value(ptr %x, !1951, !DIExpression(), !1950)
    #dbg_value(i32 %len, !1952, !DIExpression(), !1950)
    #dbg_value(i8 %b, !1953, !DIExpression(), !1950)
  %0 = call i8 asm "", "=r,0"(i8 %b) #5, !dbg !1954, !srcloc !1955
    #dbg_value(i8 %0, !1953, !DIExpression(), !1950)
  %sub = sub i8 0, %0, !dbg !1956
    #dbg_value(i8 %sub, !1953, !DIExpression(), !1950)
    #dbg_value(i32 0, !1957, !DIExpression(), !1950)
  br label %for.cond, !dbg !1958

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1960
    #dbg_value(i32 %i.0, !1957, !DIExpression(), !1950)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !1961
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1963

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !1964
  %1 = load i8, ptr %arrayidx, align 1, !dbg !1964
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !1965
  %2 = load i8, ptr %arrayidx5, align 1, !dbg !1965
  %xor1 = xor i8 %1, %2, !dbg !1966
  %and2 = and i8 %xor1, %sub, !dbg !1967
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !1968
  %xor93 = xor i8 %1, %and2, !dbg !1969
  store i8 %xor93, ptr %arrayidx7, align 1, !dbg !1969
  %inc = add i32 %i.0, 1, !dbg !1970
    #dbg_value(i32 %inc, !1957, !DIExpression(), !1950)
  br label %for.cond, !dbg !1971, !llvm.loop !1972

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1974
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_cmov_int16(ptr noundef %r, i16 noundef signext %v, i16 noundef zeroext %b) local_unnamed_addr #0 !dbg !1975 {
entry:
    #dbg_value(ptr %r, !1978, !DIExpression(), !1979)
    #dbg_value(i16 %v, !1980, !DIExpression(), !1979)
    #dbg_value(i16 %b, !1981, !DIExpression(), !1979)
  %sub = sub i16 0, %b, !dbg !1982
    #dbg_value(i16 %sub, !1981, !DIExpression(), !1979)
  %0 = load i16, ptr %r, align 2, !dbg !1983
  %xor1 = xor i16 %0, %v, !dbg !1984
  %and = and i16 %xor1, %sub, !dbg !1985
  %xor6 = xor i16 %and, %0, !dbg !1986
  store i16 %xor6, ptr %r, align 2, !dbg !1986
  ret void, !dbg !1987
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_init(ptr noundef %state) local_unnamed_addr #0 !dbg !1988 {
entry:
    #dbg_value(ptr %state, !1997, !DIExpression(), !1998)
  call fastcc void @keccak_init(ptr noundef %state) #3, !dbg !1999
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2000
  store i32 0, ptr %pos, align 8, !dbg !2001
  ret void, !dbg !2002
}

; Function Attrs: nounwind
define internal fastcc void @keccak_init(ptr noundef %s) unnamed_addr #0 !dbg !2003 {
entry:
    #dbg_value(ptr %s, !2007, !DIExpression(), !2008)
    #dbg_value(i32 0, !2009, !DIExpression(), !2008)
  br label %for.cond, !dbg !2010

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2012
    #dbg_value(i32 %i.0, !2009, !DIExpression(), !2008)
  %exitcond = icmp ne i32 %i.0, 25, !dbg !2013
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2015

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !2016
  store i64 0, ptr %arrayidx, align 8, !dbg !2017
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2018
    #dbg_value(i32 %inc, !2009, !DIExpression(), !2008)
  br label %for.cond, !dbg !2019, !llvm.loop !2020

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2022
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2023 {
entry:
    #dbg_value(ptr %state, !2026, !DIExpression(), !2027)
    #dbg_value(ptr %in, !2028, !DIExpression(), !2027)
    #dbg_value(i32 %inlen, !2029, !DIExpression(), !2027)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2030
  %0 = load i32, ptr %pos, align 8, !dbg !2030
  %call = call fastcc i32 @keccak_absorb(ptr noundef %state, i32 noundef %0, i32 noundef 168, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2031
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2032
  store i32 %call, ptr %pos1, align 8, !dbg !2033
  ret void, !dbg !2034
}

; Function Attrs: nounwind
define internal fastcc i32 @keccak_absorb(ptr noundef %s, i32 noundef %pos, i32 noundef %r, ptr noundef %in, i32 noundef %inlen) unnamed_addr #0 !dbg !2035 {
entry:
    #dbg_value(ptr %s, !2038, !DIExpression(), !2039)
    #dbg_value(i32 %pos, !2040, !DIExpression(), !2039)
    #dbg_value(i32 %r, !2041, !DIExpression(), !2039)
    #dbg_value(ptr %in, !2042, !DIExpression(), !2039)
    #dbg_value(i32 %inlen, !2043, !DIExpression(), !2039)
  br label %while.cond, !dbg !2044

while.cond:                                       ; preds = %for.end, %entry
  %in.addr.0 = phi ptr [ %in, %entry ], [ %in.addr.1.lcssa, %for.end ]
  %inlen.addr.0 = phi i32 [ %inlen, %entry ], [ %sub2, %for.end ]
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ 0, %for.end ]
    #dbg_value(i32 %pos.addr.0, !2040, !DIExpression(), !2039)
    #dbg_value(i32 %inlen.addr.0, !2043, !DIExpression(), !2039)
    #dbg_value(ptr %in.addr.0, !2042, !DIExpression(), !2039)
  %add = add i32 %pos.addr.0, %inlen.addr.0, !dbg !2045
  %cmp.not = icmp ult i32 %add, %r, !dbg !2046
  br i1 %cmp.not, label %for.cond3.preheader, label %for.cond.preheader, !dbg !2044

for.cond.preheader:                               ; preds = %while.cond
  %umax = call i32 @llvm.umax.i32(i32 %pos.addr.0, i32 %r), !dbg !2047
  br label %for.cond, !dbg !2047

for.cond3.preheader:                              ; preds = %while.cond
  %in.addr.0.lcssa = phi ptr [ %in.addr.0, %while.cond ]
  %inlen.addr.0.lcssa = phi i32 [ %inlen.addr.0, %while.cond ]
  %pos.addr.0.lcssa = phi i32 [ %pos.addr.0, %while.cond ]
  br label %for.cond3, !dbg !2050

for.cond:                                         ; preds = %for.cond.preheader, %for.body
  %in.addr.1 = phi ptr [ %incdec.ptr, %for.body ], [ %in.addr.0, %for.cond.preheader ]
  %i.0 = phi i32 [ %inc, %for.body ], [ %pos.addr.0, %for.cond.preheader ], !dbg !2052
    #dbg_value(i32 %i.0, !2053, !DIExpression(), !2039)
    #dbg_value(ptr %in.addr.1, !2042, !DIExpression(), !2039)
  %exitcond = icmp ne i32 %i.0, %umax, !dbg !2054
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2047

for.body:                                         ; preds = %for.cond
    #dbg_value(ptr %in.addr.1, !2042, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2039)
  %0 = load i8, ptr %in.addr.1, align 1, !dbg !2056
  %conv = zext i8 %0 to i64, !dbg !2057
  %rem = shl i32 %i.0, 3, !dbg !2058
  %mul = and i32 %rem, 56, !dbg !2058
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2059
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !2059
  %div2 = lshr i32 %i.0, 3, !dbg !2060
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div2, !dbg !2061
  %1 = load i64, ptr %arrayidx, align 8, !dbg !2062
  %xor = xor i64 %1, %shl, !dbg !2062
  store i64 %xor, ptr %arrayidx, align 8, !dbg !2062
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %in.addr.1, i32 1, !dbg !2063
    #dbg_value(ptr %incdec.ptr, !2042, !DIExpression(), !2039)
  %inc = add i32 %i.0, 1, !dbg !2064
    #dbg_value(i32 %inc, !2053, !DIExpression(), !2039)
  br label %for.cond, !dbg !2065, !llvm.loop !2066

for.end:                                          ; preds = %for.cond
  %in.addr.1.lcssa = phi ptr [ %in.addr.1, %for.cond ]
  %sub.neg = sub i32 %pos.addr.0, %r, !dbg !2068
  %sub2 = add i32 %sub.neg, %inlen.addr.0, !dbg !2069
    #dbg_value(i32 %sub2, !2043, !DIExpression(), !2039)
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2070
    #dbg_value(i32 0, !2040, !DIExpression(), !2039)
  br label %while.cond, !dbg !2044, !llvm.loop !2071

for.cond3:                                        ; preds = %for.cond3.preheader, %for.body7
  %in.addr.2 = phi ptr [ %incdec.ptr8, %for.body7 ], [ %in.addr.0.lcssa, %for.cond3.preheader ]
  %i.1 = phi i32 [ %inc18, %for.body7 ], [ %pos.addr.0.lcssa, %for.cond3.preheader ], !dbg !2073
    #dbg_value(i32 %i.1, !2053, !DIExpression(), !2039)
    #dbg_value(ptr %in.addr.2, !2042, !DIExpression(), !2039)
  %add4 = add i32 %pos.addr.0.lcssa, %inlen.addr.0.lcssa, !dbg !2074
  %cmp5 = icmp ult i32 %i.1, %add4, !dbg !2076
  br i1 %cmp5, label %for.body7, label %for.end19, !dbg !2050

for.body7:                                        ; preds = %for.cond3
    #dbg_value(ptr %in.addr.2, !2042, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2039)
  %2 = load i8, ptr %in.addr.2, align 1, !dbg !2077
  %conv9 = zext i8 %2 to i64, !dbg !2078
  %rem10 = shl i32 %i.1, 3, !dbg !2079
  %mul11 = and i32 %rem10, 56, !dbg !2079
  %sh_prom12 = zext nneg i32 %mul11 to i64, !dbg !2080
  %shl13 = shl nuw i64 %conv9, %sh_prom12, !dbg !2080
  %div141 = lshr i32 %i.1, 3, !dbg !2081
  %arrayidx15 = getelementptr inbounds nuw i64, ptr %s, i32 %div141, !dbg !2082
  %3 = load i64, ptr %arrayidx15, align 8, !dbg !2083
  %xor16 = xor i64 %3, %shl13, !dbg !2083
  store i64 %xor16, ptr %arrayidx15, align 8, !dbg !2083
  %incdec.ptr8 = getelementptr inbounds nuw i8, ptr %in.addr.2, i32 1, !dbg !2084
    #dbg_value(ptr %incdec.ptr8, !2042, !DIExpression(), !2039)
  %inc18 = add nuw i32 %i.1, 1, !dbg !2085
    #dbg_value(i32 %inc18, !2053, !DIExpression(), !2039)
  br label %for.cond3, !dbg !2086, !llvm.loop !2087

for.end19:                                        ; preds = %for.cond3
  %i.1.lcssa = phi i32 [ %i.1, %for.cond3 ], !dbg !2073
  ret i32 %i.1.lcssa, !dbg !2089
}

; Function Attrs: nounwind
define internal fastcc void @KeccakF1600_StatePermute(ptr noundef %state) unnamed_addr #0 !dbg !2090 {
entry:
    #dbg_value(ptr %state, !2091, !DIExpression(), !2092)
  %0 = load i64, ptr %state, align 8, !dbg !2093
    #dbg_value(i64 %0, !2094, !DIExpression(), !2092)
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !2095
  %1 = load i64, ptr %arrayidx1, align 8, !dbg !2095
    #dbg_value(i64 %1, !2096, !DIExpression(), !2092)
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !2097
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !2097
    #dbg_value(i64 %2, !2098, !DIExpression(), !2092)
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !2099
  %3 = load i64, ptr %arrayidx3, align 8, !dbg !2099
    #dbg_value(i64 %3, !2100, !DIExpression(), !2092)
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !2101
  %4 = load i64, ptr %arrayidx4, align 8, !dbg !2101
    #dbg_value(i64 %4, !2102, !DIExpression(), !2092)
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !2103
  %5 = load i64, ptr %arrayidx5, align 8, !dbg !2103
    #dbg_value(i64 %5, !2104, !DIExpression(), !2092)
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !2105
  %6 = load i64, ptr %arrayidx6, align 8, !dbg !2105
    #dbg_value(i64 %6, !2106, !DIExpression(), !2092)
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !2107
  %7 = load i64, ptr %arrayidx7, align 8, !dbg !2107
    #dbg_value(i64 %7, !2108, !DIExpression(), !2092)
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !2109
  %8 = load i64, ptr %arrayidx8, align 8, !dbg !2109
    #dbg_value(i64 %8, !2110, !DIExpression(), !2092)
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !2111
  %9 = load i64, ptr %arrayidx9, align 8, !dbg !2111
    #dbg_value(i64 %9, !2112, !DIExpression(), !2092)
  %arrayidx10 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !2113
  %10 = load i64, ptr %arrayidx10, align 8, !dbg !2113
    #dbg_value(i64 %10, !2114, !DIExpression(), !2092)
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !2115
  %11 = load i64, ptr %arrayidx11, align 8, !dbg !2115
    #dbg_value(i64 %11, !2116, !DIExpression(), !2092)
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !2117
  %12 = load i64, ptr %arrayidx12, align 8, !dbg !2117
    #dbg_value(i64 %12, !2118, !DIExpression(), !2092)
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !2119
  %13 = load i64, ptr %arrayidx13, align 8, !dbg !2119
    #dbg_value(i64 %13, !2120, !DIExpression(), !2092)
  %arrayidx14 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !2121
  %14 = load i64, ptr %arrayidx14, align 8, !dbg !2121
    #dbg_value(i64 %14, !2122, !DIExpression(), !2092)
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !2123
  %15 = load i64, ptr %arrayidx15, align 8, !dbg !2123
    #dbg_value(i64 %15, !2124, !DIExpression(), !2092)
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !2125
  %16 = load i64, ptr %arrayidx16, align 8, !dbg !2125
    #dbg_value(i64 %16, !2126, !DIExpression(), !2092)
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !2127
  %17 = load i64, ptr %arrayidx17, align 8, !dbg !2127
    #dbg_value(i64 %17, !2128, !DIExpression(), !2092)
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !2129
  %18 = load i64, ptr %arrayidx18, align 8, !dbg !2129
    #dbg_value(i64 %18, !2130, !DIExpression(), !2092)
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !2131
  %19 = load i64, ptr %arrayidx19, align 8, !dbg !2131
    #dbg_value(i64 %19, !2132, !DIExpression(), !2092)
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !2133
  %20 = load i64, ptr %arrayidx20, align 8, !dbg !2133
    #dbg_value(i64 %20, !2134, !DIExpression(), !2092)
  %arrayidx21 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !2135
  %21 = load i64, ptr %arrayidx21, align 8, !dbg !2135
    #dbg_value(i64 %21, !2136, !DIExpression(), !2092)
  %arrayidx22 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !2137
  %22 = load i64, ptr %arrayidx22, align 8, !dbg !2137
    #dbg_value(i64 %22, !2138, !DIExpression(), !2092)
  %arrayidx23 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !2139
  %23 = load i64, ptr %arrayidx23, align 8, !dbg !2139
    #dbg_value(i64 %23, !2140, !DIExpression(), !2092)
  %arrayidx24 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !2141
  %24 = load i64, ptr %arrayidx24, align 8, !dbg !2141
    #dbg_value(i64 %24, !2142, !DIExpression(), !2092)
    #dbg_value(i32 0, !2143, !DIExpression(), !2092)
  br label %for.cond, !dbg !2144

for.cond:                                         ; preds = %for.inc, %entry
  %Aso.0 = phi i64 [ %23, %entry ], [ %xor444, %for.inc ], !dbg !2092
  %Asi.0 = phi i64 [ %22, %entry ], [ %xor441, %for.inc ], !dbg !2092
  %Ase.0 = phi i64 [ %21, %entry ], [ %xor438, %for.inc ], !dbg !2092
  %Asa.0 = phi i64 [ %20, %entry ], [ %xor435, %for.inc ], !dbg !2092
  %Amu.0 = phi i64 [ %19, %entry ], [ %xor412, %for.inc ], !dbg !2092
  %Amo.0 = phi i64 [ %18, %entry ], [ %xor409, %for.inc ], !dbg !2092
  %Ami.0 = phi i64 [ %17, %entry ], [ %xor406, %for.inc ], !dbg !2092
  %Ame.0 = phi i64 [ %16, %entry ], [ %xor403, %for.inc ], !dbg !2092
  %Ama.0 = phi i64 [ %15, %entry ], [ %xor400, %for.inc ], !dbg !2092
  %Aku.0 = phi i64 [ %14, %entry ], [ %xor377, %for.inc ], !dbg !2092
  %Ako.0 = phi i64 [ %13, %entry ], [ %xor374, %for.inc ], !dbg !2092
  %Aki.0 = phi i64 [ %12, %entry ], [ %xor371, %for.inc ], !dbg !2092
  %Ake.0 = phi i64 [ %11, %entry ], [ %xor368, %for.inc ], !dbg !2092
  %Aka.0 = phi i64 [ %10, %entry ], [ %xor365, %for.inc ], !dbg !2092
  %Agu.0 = phi i64 [ %9, %entry ], [ %xor342, %for.inc ], !dbg !2092
  %Ago.0 = phi i64 [ %8, %entry ], [ %xor339, %for.inc ], !dbg !2092
  %Agi.0 = phi i64 [ %7, %entry ], [ %xor336, %for.inc ], !dbg !2092
  %Age.0 = phi i64 [ %6, %entry ], [ %xor333, %for.inc ], !dbg !2092
  %Aga.0 = phi i64 [ %5, %entry ], [ %xor330, %for.inc ], !dbg !2092
  %Abu.0 = phi i64 [ %4, %entry ], [ %xor307, %for.inc ], !dbg !2092
  %Abo.0 = phi i64 [ %3, %entry ], [ %xor304, %for.inc ], !dbg !2092
  %Abi.0 = phi i64 [ %2, %entry ], [ %xor301, %for.inc ], !dbg !2092
  %Abe.0 = phi i64 [ %1, %entry ], [ %xor298, %for.inc ], !dbg !2092
  %Aba.0 = phi i64 [ %0, %entry ], [ %xor295, %for.inc ], !dbg !2092
  %round.0 = phi i32 [ 0, %entry ], [ %add448, %for.inc ], !dbg !2146
  %Asu.0 = phi i64 [ %24, %entry ], [ %xor447, %for.inc ], !dbg !2092
    #dbg_value(i64 %Asu.0, !2142, !DIExpression(), !2092)
    #dbg_value(i32 %round.0, !2143, !DIExpression(), !2092)
    #dbg_value(i64 %Aba.0, !2094, !DIExpression(), !2092)
    #dbg_value(i64 %Abe.0, !2096, !DIExpression(), !2092)
    #dbg_value(i64 %Abi.0, !2098, !DIExpression(), !2092)
    #dbg_value(i64 %Abo.0, !2100, !DIExpression(), !2092)
    #dbg_value(i64 %Abu.0, !2102, !DIExpression(), !2092)
    #dbg_value(i64 %Aga.0, !2104, !DIExpression(), !2092)
    #dbg_value(i64 %Age.0, !2106, !DIExpression(), !2092)
    #dbg_value(i64 %Agi.0, !2108, !DIExpression(), !2092)
    #dbg_value(i64 %Ago.0, !2110, !DIExpression(), !2092)
    #dbg_value(i64 %Agu.0, !2112, !DIExpression(), !2092)
    #dbg_value(i64 %Aka.0, !2114, !DIExpression(), !2092)
    #dbg_value(i64 %Ake.0, !2116, !DIExpression(), !2092)
    #dbg_value(i64 %Aki.0, !2118, !DIExpression(), !2092)
    #dbg_value(i64 %Ako.0, !2120, !DIExpression(), !2092)
    #dbg_value(i64 %Aku.0, !2122, !DIExpression(), !2092)
    #dbg_value(i64 %Ama.0, !2124, !DIExpression(), !2092)
    #dbg_value(i64 %Ame.0, !2126, !DIExpression(), !2092)
    #dbg_value(i64 %Ami.0, !2128, !DIExpression(), !2092)
    #dbg_value(i64 %Amo.0, !2130, !DIExpression(), !2092)
    #dbg_value(i64 %Amu.0, !2132, !DIExpression(), !2092)
    #dbg_value(i64 %Asa.0, !2134, !DIExpression(), !2092)
    #dbg_value(i64 %Ase.0, !2136, !DIExpression(), !2092)
    #dbg_value(i64 %Asi.0, !2138, !DIExpression(), !2092)
    #dbg_value(i64 %Aso.0, !2140, !DIExpression(), !2092)
  %cmp = icmp samesign ult i32 %round.0, 24, !dbg !2147
  br i1 %cmp, label %for.inc, label %for.end, !dbg !2149

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %Asa.0, i64 %Ama.0, i64 %Aka.0, i64 %Aga.0), !2150, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %Ase.0, i64 %Ame.0, i64 %Ake.0, i64 %Age.0), !2151, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %Asi.0, i64 %Ami.0, i64 %Aki.0, i64 %Agi.0), !2152, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %Aso.0, i64 %Amo.0, i64 %Ako.0, i64 %Ago.0), !2153, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %Asu.0, i64 %Amu.0, i64 %Aku.0, i64 %Agu.0), !2154, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2155, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2156, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2157, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2158, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2159, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2094, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2150, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2106, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2151, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2118, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2152, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2130, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2153, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2142, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2154, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2160, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2160, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2161, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2162, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2163, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2164, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2100, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2150, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2112, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2151, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2114, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2152, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2126, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2153, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2138, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2154, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2165, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2166, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2167, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2168, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2169, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2096, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2150, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2108, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2151, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2120, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2152, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2132, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2153, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2134, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2154, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2170, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2171, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2172, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2173, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2174, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2102, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2150, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2104, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2151, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2116, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2152, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2128, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2153, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2140, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2154, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2175, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2176, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2177, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2178, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2179, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2098, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2150, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2110, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2151, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2122, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2152, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2124, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2153, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2136, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2154, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2180, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2181, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2182, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2183, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2184, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2150, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2151, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2152, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2153, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2154, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2155, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2156, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2157, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2158, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2159, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2160, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2150, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2166, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2151, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2172, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2152, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2178, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2153, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2184, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2154, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2094, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2094, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2096, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2098, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2100, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2102, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2163, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2150, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2169, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2151, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2170, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2152, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2176, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2153, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2182, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2154, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2104, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2106, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2108, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2110, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2112, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2161, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2150, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2167, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2151, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2173, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2152, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2179, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2153, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2180, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2154, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2114, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2116, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2118, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2120, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2122, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2164, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2150, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2165, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2151, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2171, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2152, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2177, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2153, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2183, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2154, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2124, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2126, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2128, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2130, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2132, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2162, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2150, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2168, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2151, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2174, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2152, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2175, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2153, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2181, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 poison, !2154, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2134, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2136, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2138, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2140, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2142, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor32 = xor i64 %Abi.0, %Agi.0, !dbg !2185
    #dbg_value(!DIArgList(i64 %xor32, i64 %Asi.0, i64 %Ami.0, i64 %Aki.0), !2152, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor33 = xor i64 %xor32, %Aki.0, !dbg !2187
    #dbg_value(!DIArgList(i64 %xor33, i64 %Asi.0, i64 %Ami.0), !2152, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor34 = xor i64 %xor33, %Ami.0, !dbg !2188
    #dbg_value(!DIArgList(i64 %xor34, i64 %Asi.0), !2152, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor35 = xor i64 %xor34, %Asi.0, !dbg !2189
    #dbg_value(i64 %xor35, !2152, !DIExpression(), !2092)
  %xor40 = xor i64 %Abu.0, %Agu.0, !dbg !2190
    #dbg_value(!DIArgList(i64 %xor40, i64 %Asu.0, i64 %Amu.0, i64 %Aku.0), !2154, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor41 = xor i64 %xor40, %Aku.0, !dbg !2191
    #dbg_value(!DIArgList(i64 %xor41, i64 %Asu.0, i64 %Amu.0), !2154, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor42 = xor i64 %xor41, %Amu.0, !dbg !2192
    #dbg_value(!DIArgList(i64 %xor42, i64 %Asu.0), !2154, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor43 = xor i64 %xor42, %Asu.0, !dbg !2193
    #dbg_value(i64 %xor43, !2154, !DIExpression(), !2092)
  %xor56 = call i64 @llvm.fshl.i64(i64 %xor43, i64 %xor43, i64 1), !dbg !2194
    #dbg_value(!DIArgList(i64 %Ago.0, i64 %xor35, i64 %xor56), !2110, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %xor35, i64 %xor56), !2100, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Ako.0, i64 %xor35, i64 %xor56), !2120, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Amo.0, i64 %xor35, i64 %xor56), !2130, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Aso.0, i64 %xor35, i64 %xor56), !2140, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor35, i64 %xor56), !2158, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor57 = xor i64 %xor35, %xor56, !dbg !2195
    #dbg_value(!DIArgList(i64 %Ago.0, i64 %xor57), !2110, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %xor57), !2100, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Ako.0, i64 %xor57), !2120, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Amo.0, i64 %xor57), !2130, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Aso.0, i64 %xor57), !2140, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 %xor57, !2158, !DIExpression(), !2092)
  %xor203 = xor i64 %Ago.0, %xor57, !dbg !2196
    #dbg_value(i64 %xor203, !2110, !DIExpression(), !2092)
  %xor206 = call i64 @llvm.fshl.i64(i64 %xor203, i64 %xor203, i64 55), !dbg !2197
    #dbg_value(i64 %xor206, !2151, !DIExpression(), !2092)
  %xor28 = xor i64 %Abe.0, %Age.0, !dbg !2198
    #dbg_value(!DIArgList(i64 %xor28, i64 %Ase.0, i64 %Ame.0, i64 %Ake.0), !2151, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor29 = xor i64 %xor28, %Ake.0, !dbg !2199
    #dbg_value(!DIArgList(i64 %xor29, i64 %Ase.0, i64 %Ame.0), !2151, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor30 = xor i64 %xor29, %Ame.0, !dbg !2200
    #dbg_value(!DIArgList(i64 %xor30, i64 %Ase.0), !2151, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor31 = xor i64 %xor30, %Ase.0, !dbg !2201
    #dbg_value(i64 %xor31, !2151, !DIExpression(), !2092)
  %xor44 = call i64 @llvm.fshl.i64(i64 %xor31, i64 %xor31, i64 1), !dbg !2202
    #dbg_value(!DIArgList(i64 %xor43, i64 %xor44), !2155, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor43, i64 %xor44), !2094, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor43, i64 %xor44), !2150, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Aka.0, i64 %xor43, i64 %xor44), !2114, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Aga.0, i64 %xor43, i64 %xor44), !2104, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Asa.0, i64 %xor43, i64 %xor44), !2134, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Ama.0, i64 %xor43, i64 %xor44), !2124, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor45 = xor i64 %xor43, %xor44, !dbg !2203
    #dbg_value(i64 %xor45, !2155, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor45), !2150, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor45), !2094, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Aka.0, i64 %xor45), !2114, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Aga.0, i64 %xor45), !2104, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Asa.0, i64 %xor45), !2134, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Ama.0, i64 %xor45), !2124, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor211 = xor i64 %Ama.0, %xor45, !dbg !2204
    #dbg_value(i64 %xor211, !2124, !DIExpression(), !2092)
  %xor214 = call i64 @llvm.fshl.i64(i64 %xor211, i64 %xor211, i64 41), !dbg !2205
    #dbg_value(i64 %xor214, !2153, !DIExpression(), !2092)
  %xor36 = xor i64 %Abo.0, %Ago.0, !dbg !2206
    #dbg_value(!DIArgList(i64 %xor36, i64 %Aso.0, i64 %Amo.0, i64 %Ako.0), !2153, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor37 = xor i64 %xor36, %Ako.0, !dbg !2207
    #dbg_value(!DIArgList(i64 %xor37, i64 %Aso.0, i64 %Amo.0), !2153, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor38 = xor i64 %xor37, %Amo.0, !dbg !2208
    #dbg_value(!DIArgList(i64 %xor38, i64 %Aso.0), !2153, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor39 = xor i64 %xor38, %Aso.0, !dbg !2209
    #dbg_value(i64 %xor39, !2153, !DIExpression(), !2092)
  %xor = xor i64 %Aba.0, %Aga.0, !dbg !2210
    #dbg_value(!DIArgList(i64 %xor, i64 %Asa.0, i64 %Ama.0, i64 %Aka.0), !2150, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor25 = xor i64 %xor, %Aka.0, !dbg !2211
    #dbg_value(!DIArgList(i64 %xor25, i64 %Asa.0, i64 %Ama.0), !2150, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor26 = xor i64 %xor25, %Ama.0, !dbg !2212
    #dbg_value(!DIArgList(i64 %xor26, i64 %Asa.0), !2150, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor27 = xor i64 %xor26, %Asa.0, !dbg !2213
    #dbg_value(i64 %xor27, !2150, !DIExpression(), !2092)
  %xor60 = call i64 @llvm.fshl.i64(i64 %xor27, i64 %xor27, i64 1), !dbg !2214
    #dbg_value(!DIArgList(i64 %Agu.0, i64 %xor39, i64 %xor60), !2112, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %xor39, i64 %xor60), !2102, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Asu.0, i64 %xor39, i64 %xor60), !2142, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Amu.0, i64 %xor39, i64 %xor60), !2132, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor39, i64 %xor60), !2159, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Aku.0, i64 %xor39, i64 %xor60), !2122, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor61 = xor i64 %xor39, %xor60, !dbg !2215
    #dbg_value(!DIArgList(i64 %Agu.0, i64 %xor61), !2112, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %xor61), !2102, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Asu.0, i64 %xor61), !2142, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Amu.0, i64 %xor61), !2132, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 %xor61, !2159, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 %Aku.0, i64 %xor61), !2122, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor207 = xor i64 %Aku.0, %xor61, !dbg !2216
    #dbg_value(i64 %xor207, !2122, !DIExpression(), !2092)
  %xor210 = call i64 @llvm.fshl.i64(i64 %xor207, i64 %xor207, i64 39), !dbg !2217
    #dbg_value(i64 %xor210, !2152, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 %xor206, i64 %xor214, i64 %xor210), !2181, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %not222 = xor i64 %xor210, -1, !dbg !2218
    #dbg_value(!DIArgList(i64 %xor206, i64 %xor214, i64 %not222), !2181, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %and223 = and i64 %xor214, %not222, !dbg !2219
    #dbg_value(!DIArgList(i64 %xor206, i64 %and223), !2181, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor224 = xor i64 %xor206, %and223, !dbg !2220
    #dbg_value(i64 %xor224, !2181, !DIExpression(), !2092)
  %xor52 = call i64 @llvm.fshl.i64(i64 %xor39, i64 %xor39, i64 1), !dbg !2221
    #dbg_value(!DIArgList(i64 %xor31, i64 %xor52), !2157, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Aki.0, i64 %xor31, i64 %xor52), !2118, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Agi.0, i64 %xor31, i64 %xor52), !2108, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %xor31, i64 %xor52), !2098, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Asi.0, i64 %xor31, i64 %xor52), !2138, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Ami.0, i64 %xor31, i64 %xor52), !2128, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor53 = xor i64 %xor31, %xor52, !dbg !2222
    #dbg_value(i64 %xor53, !2157, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 %Aki.0, i64 %xor53), !2118, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Agi.0, i64 %xor53), !2108, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %xor53), !2098, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Asi.0, i64 %xor53), !2138, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Ami.0, i64 %xor53), !2128, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor67 = xor i64 %Aki.0, %xor53, !dbg !2223
    #dbg_value(i64 %xor67, !2118, !DIExpression(), !2092)
  %xor70 = call i64 @llvm.fshl.i64(i64 %xor67, i64 %xor67, i64 43), !dbg !2224
    #dbg_value(i64 %xor70, !2152, !DIExpression(), !2092)
  %xor48 = call i64 @llvm.fshl.i64(i64 %xor35, i64 %xor35, i64 1), !dbg !2225
    #dbg_value(!DIArgList(i64 %xor27, i64 %xor48), !2156, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Age.0, i64 %xor27, i64 %xor48), !2106, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %xor27, i64 %xor48), !2096, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Ake.0, i64 %xor27, i64 %xor48), !2116, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Ame.0, i64 %xor27, i64 %xor48), !2126, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Ase.0, i64 %xor27, i64 %xor48), !2136, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor49 = xor i64 %xor27, %xor48, !dbg !2226
    #dbg_value(i64 %xor49, !2156, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 %Age.0, i64 %xor49), !2106, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %xor49), !2096, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Ake.0, i64 %xor49), !2116, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Ame.0, i64 %xor49), !2126, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %Ase.0, i64 %xor49), !2136, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor63 = xor i64 %Age.0, %xor49, !dbg !2227
    #dbg_value(i64 %xor63, !2106, !DIExpression(), !2092)
  %xor66 = call i64 @llvm.fshl.i64(i64 %xor63, i64 %xor63, i64 44), !dbg !2228
    #dbg_value(i64 %xor66, !2151, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor70, i64 %xor45, i64 %xor66), !2160, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %not = xor i64 %xor66, -1, !dbg !2229
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor70, i64 %xor45, i64 %not), !2160, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %and = and i64 %xor70, %not, !dbg !2230
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %and, i64 %xor45), !2160, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %arrayidx80 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %round.0, !dbg !2231
  %25 = load i64, ptr %arrayidx80, align 8, !dbg !2231
    #dbg_value(!DIArgList(i64 %and, i64 %Aba.0, i64 %xor45, i64 %25), !2160, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
  %26 = xor i64 %and, %25, !dbg !2232
    #dbg_value(!DIArgList(i64 %26, i64 %Aba.0, i64 %xor45), !2160, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor62 = xor i64 %Aba.0, %xor45, !dbg !2233
    #dbg_value(i64 %xor62, !2094, !DIExpression(), !2092)
    #dbg_value(i64 %xor62, !2150, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 %26, i64 %xor62), !2160, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor81 = xor i64 %26, %xor62, !dbg !2232
    #dbg_value(i64 %xor81, !2160, !DIExpression(), !2092)
  %xor94 = xor i64 %Abo.0, %xor57, !dbg !2234
    #dbg_value(i64 %xor94, !2100, !DIExpression(), !2092)
  %xor97 = call i64 @llvm.fshl.i64(i64 %xor94, i64 %xor94, i64 28), !dbg !2235
    #dbg_value(i64 %xor97, !2150, !DIExpression(), !2092)
  %xor102 = xor i64 %Aka.0, %xor45, !dbg !2236
    #dbg_value(i64 %xor102, !2114, !DIExpression(), !2092)
  %xor105 = call i64 @llvm.fshl.i64(i64 %xor102, i64 %xor102, i64 3), !dbg !2237
    #dbg_value(i64 %xor105, !2152, !DIExpression(), !2092)
  %xor98 = xor i64 %Agu.0, %xor61, !dbg !2238
    #dbg_value(i64 %xor98, !2112, !DIExpression(), !2092)
  %xor101 = call i64 @llvm.fshl.i64(i64 %xor98, i64 %xor98, i64 20), !dbg !2239
    #dbg_value(i64 %xor101, !2151, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 %xor97, i64 %xor105, i64 %xor101), !2165, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %not114 = xor i64 %xor101, -1, !dbg !2240
    #dbg_value(!DIArgList(i64 %xor97, i64 %xor105, i64 %not114), !2165, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %and115 = and i64 %xor105, %not114, !dbg !2241
    #dbg_value(!DIArgList(i64 %xor97, i64 %and115), !2165, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor116 = xor i64 %xor97, %and115, !dbg !2242
    #dbg_value(i64 %xor116, !2165, !DIExpression(), !2092)
  %xor234 = xor i64 %xor81, %xor116, !dbg !2243
  %xor129 = xor i64 %Abe.0, %xor49, !dbg !2244
    #dbg_value(i64 %xor129, !2096, !DIExpression(), !2092)
  %xor132 = call i64 @llvm.fshl.i64(i64 %xor129, i64 %xor129, i64 1), !dbg !2245
    #dbg_value(i64 %xor132, !2150, !DIExpression(), !2092)
  %xor137 = xor i64 %Ako.0, %xor57, !dbg !2246
    #dbg_value(i64 %xor137, !2120, !DIExpression(), !2092)
  %xor140 = call i64 @llvm.fshl.i64(i64 %xor137, i64 %xor137, i64 25), !dbg !2247
    #dbg_value(i64 %xor140, !2152, !DIExpression(), !2092)
  %xor133 = xor i64 %Agi.0, %xor53, !dbg !2248
    #dbg_value(i64 %xor133, !2108, !DIExpression(), !2092)
  %xor136 = call i64 @llvm.fshl.i64(i64 %xor133, i64 %xor133, i64 6), !dbg !2249
    #dbg_value(i64 %xor136, !2151, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 %xor132, i64 %xor140, i64 %xor136), !2170, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %not149 = xor i64 %xor136, -1, !dbg !2250
    #dbg_value(!DIArgList(i64 %xor132, i64 %xor140, i64 %not149), !2170, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %and150 = and i64 %xor140, %not149, !dbg !2251
    #dbg_value(!DIArgList(i64 %xor132, i64 %and150), !2170, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor151 = xor i64 %xor132, %and150, !dbg !2252
    #dbg_value(i64 %xor151, !2170, !DIExpression(), !2092)
  %xor235 = xor i64 %xor234, %xor151, !dbg !2253
  %xor164 = xor i64 %Abu.0, %xor61, !dbg !2254
    #dbg_value(i64 %xor164, !2102, !DIExpression(), !2092)
  %xor167 = call i64 @llvm.fshl.i64(i64 %xor164, i64 %xor164, i64 27), !dbg !2255
    #dbg_value(i64 %xor167, !2150, !DIExpression(), !2092)
  %xor172 = xor i64 %Ake.0, %xor49, !dbg !2256
    #dbg_value(i64 %xor172, !2116, !DIExpression(), !2092)
  %xor175 = call i64 @llvm.fshl.i64(i64 %xor172, i64 %xor172, i64 10), !dbg !2257
    #dbg_value(i64 %xor175, !2152, !DIExpression(), !2092)
  %xor168 = xor i64 %Aga.0, %xor45, !dbg !2258
    #dbg_value(i64 %xor168, !2104, !DIExpression(), !2092)
  %xor171 = call i64 @llvm.fshl.i64(i64 %xor168, i64 %xor168, i64 36), !dbg !2259
    #dbg_value(i64 %xor171, !2151, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 %xor167, i64 %xor175, i64 %xor171), !2175, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %not184 = xor i64 %xor171, -1, !dbg !2260
    #dbg_value(!DIArgList(i64 %xor167, i64 %xor175, i64 %not184), !2175, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %and185 = and i64 %xor175, %not184, !dbg !2261
    #dbg_value(!DIArgList(i64 %xor167, i64 %and185), !2175, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor186 = xor i64 %xor167, %and185, !dbg !2262
    #dbg_value(i64 %xor186, !2175, !DIExpression(), !2092)
  %xor236 = xor i64 %xor235, %xor186, !dbg !2263
  %xor199 = xor i64 %Abi.0, %xor53, !dbg !2264
    #dbg_value(i64 %xor199, !2098, !DIExpression(), !2092)
  %xor202 = call i64 @llvm.fshl.i64(i64 %xor199, i64 %xor199, i64 62), !dbg !2265
    #dbg_value(!DIArgList(i64 %xor202, i64 %xor210, i64 %xor206), !2180, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %xor210, i64 %xor206), !2150, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
  %not219 = xor i64 %xor206, -1, !dbg !2266
    #dbg_value(!DIArgList(i64 %xor202, i64 %xor210, i64 %not219), !2180, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %xor210, i64 %not219), !2150, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
  %and220 = and i64 %xor210, %not219, !dbg !2267
    #dbg_value(!DIArgList(i64 %xor202, i64 %and220), !2180, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %and220), !2150, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor221 = xor i64 %xor202, %and220, !dbg !2268
    #dbg_value(i64 %xor221, !2180, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor221), !2150, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor237 = xor i64 %xor236, %xor221, !dbg !2269
    #dbg_value(i64 %xor237, !2150, !DIExpression(), !2092)
  %xor75 = xor i64 %Asu.0, %xor61, !dbg !2270
    #dbg_value(i64 %xor75, !2142, !DIExpression(), !2092)
  %xor78 = call i64 @llvm.fshl.i64(i64 %xor75, i64 %xor75, i64 14), !dbg !2271
    #dbg_value(i64 %xor78, !2154, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor66, i64 %xor62), !2164, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor71 = xor i64 %Amo.0, %xor57, !dbg !2272
    #dbg_value(i64 %xor71, !2130, !DIExpression(), !2092)
  %xor74 = call i64 @llvm.fshl.i64(i64 %xor71, i64 %xor71, i64 21), !dbg !2273
    #dbg_value(i64 %xor74, !2153, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 %xor70, i64 %xor78, i64 %xor74), !2162, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor74, i64 %xor70), !2161, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor62, i64 %xor78), !2163, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %not85 = xor i64 %xor74, -1, !dbg !2274
    #dbg_value(!DIArgList(i64 %xor70, i64 %xor78, i64 %not85), !2162, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %and86 = and i64 %xor78, %not85, !dbg !2275
    #dbg_value(!DIArgList(i64 %xor70, i64 %and86), !2162, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor87 = xor i64 %xor70, %and86, !dbg !2276
    #dbg_value(i64 %xor87, !2162, !DIExpression(), !2092)
  %xor110 = xor i64 %Asi.0, %xor53, !dbg !2277
    #dbg_value(i64 %xor110, !2138, !DIExpression(), !2092)
  %xor113 = call i64 @llvm.fshl.i64(i64 %xor110, i64 %xor110, i64 61), !dbg !2278
    #dbg_value(i64 %xor113, !2154, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 %xor113, i64 %xor101, i64 %xor97), !2169, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor106 = xor i64 %Ame.0, %xor49, !dbg !2279
    #dbg_value(i64 %xor106, !2126, !DIExpression(), !2092)
  %xor109 = call i64 @llvm.fshl.i64(i64 %xor106, i64 %xor106, i64 45), !dbg !2280
    #dbg_value(i64 %xor109, !2153, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 %xor105, i64 %xor113, i64 %xor109), !2167, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor109, i64 %xor97, i64 %xor113), !2168, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor109, i64 %xor105), !2166, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %not120 = xor i64 %xor109, -1, !dbg !2281
    #dbg_value(!DIArgList(i64 %xor105, i64 %xor113, i64 %not120), !2167, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %and121 = and i64 %xor113, %not120, !dbg !2282
    #dbg_value(!DIArgList(i64 %xor105, i64 %and121), !2167, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor122 = xor i64 %xor105, %and121, !dbg !2283
    #dbg_value(i64 %xor122, !2167, !DIExpression(), !2092)
  %xor242 = xor i64 %xor87, %xor122, !dbg !2284
  %xor145 = xor i64 %Asa.0, %xor45, !dbg !2285
    #dbg_value(i64 %xor145, !2134, !DIExpression(), !2092)
  %xor148 = call i64 @llvm.fshl.i64(i64 %xor145, i64 %xor145, i64 18), !dbg !2286
    #dbg_value(i64 %xor148, !2154, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 %xor148, i64 %xor136, i64 %xor132), !2174, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor141 = xor i64 %Amu.0, %xor61, !dbg !2287
    #dbg_value(i64 %xor141, !2132, !DIExpression(), !2092)
  %xor144 = call i64 @llvm.fshl.i64(i64 %xor141, i64 %xor141, i64 8), !dbg !2288
    #dbg_value(i64 %xor144, !2153, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 %xor140, i64 %xor148, i64 %xor144), !2172, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor144, i64 %xor140), !2171, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor132, i64 %xor148), !2173, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %not155 = xor i64 %xor144, -1, !dbg !2289
    #dbg_value(!DIArgList(i64 %xor140, i64 %xor148, i64 %not155), !2172, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %and156 = and i64 %xor148, %not155, !dbg !2290
    #dbg_value(!DIArgList(i64 %xor140, i64 %and156), !2172, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor157 = xor i64 %xor140, %and156, !dbg !2291
    #dbg_value(i64 %xor157, !2172, !DIExpression(), !2092)
  %xor243 = xor i64 %xor242, %xor157, !dbg !2292
  %xor180 = xor i64 %Aso.0, %xor57, !dbg !2293
    #dbg_value(i64 %xor180, !2140, !DIExpression(), !2092)
  %xor183 = call i64 @llvm.fshl.i64(i64 %xor180, i64 %xor180, i64 56), !dbg !2294
    #dbg_value(i64 %xor183, !2154, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 %xor183, i64 %xor171, i64 %xor167), !2179, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor176 = xor i64 %Ami.0, %xor53, !dbg !2295
    #dbg_value(i64 %xor176, !2128, !DIExpression(), !2092)
  %xor179 = call i64 @llvm.fshl.i64(i64 %xor176, i64 %xor176, i64 15), !dbg !2296
    #dbg_value(i64 %xor179, !2153, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 %xor175, i64 %xor183, i64 %xor179), !2177, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor179, i64 %xor175), !2176, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor167, i64 %xor183), !2178, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %xor74, i64 %xor70), !2151, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %not190 = xor i64 %xor179, -1, !dbg !2297
    #dbg_value(!DIArgList(i64 %xor175, i64 %xor183, i64 %not190), !2177, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %and191 = and i64 %xor183, %not190, !dbg !2298
    #dbg_value(!DIArgList(i64 %xor175, i64 %and191), !2177, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor192 = xor i64 %xor175, %and191, !dbg !2299
    #dbg_value(i64 %xor192, !2177, !DIExpression(), !2092)
  %xor244 = xor i64 %xor243, %xor192, !dbg !2300
  %xor215 = xor i64 %Ase.0, %xor49, !dbg !2301
    #dbg_value(i64 %xor215, !2136, !DIExpression(), !2092)
  %xor218 = call i64 @llvm.fshl.i64(i64 %xor215, i64 %xor215, i64 2), !dbg !2302
    #dbg_value(!DIArgList(i64 %xor210, i64 %xor218, i64 %xor214), !2182, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor218, i64 %xor206, i64 %xor202), !2184, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor202, i64 %xor218), !2183, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %xor218, i64 %xor214), !2152, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %xor97, i64 %xor113), !2153, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %xor66, i64 %xor62), !2154, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
  %not225 = xor i64 %xor214, -1, !dbg !2303
    #dbg_value(!DIArgList(i64 %xor210, i64 %xor218, i64 %not225), !2182, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %xor218, i64 %not225), !2152, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
  %and226 = and i64 %xor218, %not225, !dbg !2304
    #dbg_value(!DIArgList(i64 %xor210, i64 %and226), !2182, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %and226), !2152, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor227 = xor i64 %xor210, %and226, !dbg !2305
    #dbg_value(i64 %xor227, !2182, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor227), !2152, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor245 = xor i64 %xor244, %xor227, !dbg !2306
    #dbg_value(i64 %xor245, !2152, !DIExpression(), !2092)
  %xor260 = call i64 @llvm.fshl.i64(i64 %xor245, i64 %xor245, i64 1), !dbg !2307
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor237, i64 %xor260), !2181, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor237, i64 %xor74, i64 %xor70, i64 %xor260), !2161, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor237, i64 %xor109, i64 %xor105, i64 %xor260), !2166, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor237, i64 %xor144, i64 %xor140, i64 %xor260), !2171, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor237, i64 %xor179, i64 %xor175, i64 %xor260), !2176, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor237, i64 %xor260), !2156, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor261 = xor i64 %xor237, %xor260, !dbg !2308
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor261), !2181, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %xor74, i64 %xor70), !2161, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %xor109, i64 %xor105), !2166, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %xor144, i64 %xor140), !2171, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %xor179, i64 %xor175), !2176, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 %xor261, !2156, !DIExpression(), !2092)
  %xor429 = xor i64 %xor224, %xor261, !dbg !2309
    #dbg_value(i64 %xor429, !2181, !DIExpression(), !2092)
  %xor432 = call i64 @llvm.fshl.i64(i64 %xor429, i64 %xor429, i64 2), !dbg !2310
    #dbg_value(i64 %xor432, !2154, !DIExpression(), !2092)
  %not123 = xor i64 %xor113, -1, !dbg !2311
    #dbg_value(!DIArgList(i64 %xor109, i64 %xor97, i64 %not123), !2168, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %xor97, i64 %not123), !2153, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
  %and124 = and i64 %xor97, %not123, !dbg !2312
    #dbg_value(!DIArgList(i64 %xor109, i64 %and124), !2168, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %and124), !2153, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor125 = xor i64 %xor109, %and124, !dbg !2313
    #dbg_value(i64 %xor125, !2168, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %xor62, i64 %xor78), !2153, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
  %not91 = xor i64 %xor62, -1, !dbg !2314
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor66, i64 %not91), !2164, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %xor66, i64 %not91), !2154, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
  %and92 = and i64 %xor66, %not91, !dbg !2315
    #dbg_value(!DIArgList(i64 %xor78, i64 %and92), !2164, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %and92), !2154, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor93 = xor i64 %xor78, %and92, !dbg !2316
    #dbg_value(i64 %xor93, !2164, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97), !2154, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
  %not126 = xor i64 %xor97, -1, !dbg !2317
    #dbg_value(!DIArgList(i64 %xor113, i64 %xor101, i64 %not126), !2169, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %not126), !2154, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
  %and127 = and i64 %xor101, %not126, !dbg !2318
    #dbg_value(!DIArgList(i64 %xor113, i64 %and127), !2169, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %and127), !2154, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor128 = xor i64 %xor113, %and127, !dbg !2319
    #dbg_value(i64 %xor128, !2169, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor128), !2154, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor250 = xor i64 %xor93, %xor128, !dbg !2320
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132), !2154, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
  %not161 = xor i64 %xor132, -1, !dbg !2321
    #dbg_value(!DIArgList(i64 %xor148, i64 %xor136, i64 %not161), !2174, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %not161), !2154, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
  %and162 = and i64 %xor136, %not161, !dbg !2322
    #dbg_value(!DIArgList(i64 %xor148, i64 %and162), !2174, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %and162), !2154, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor163 = xor i64 %xor148, %and162, !dbg !2323
    #dbg_value(i64 %xor163, !2174, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor163), !2154, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor251 = xor i64 %xor250, %xor163, !dbg !2324
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167), !2154, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
  %not196 = xor i64 %xor167, -1, !dbg !2325
    #dbg_value(!DIArgList(i64 %xor183, i64 %xor171, i64 %not196), !2179, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %not196), !2154, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
  %and197 = and i64 %xor171, %not196, !dbg !2326
    #dbg_value(!DIArgList(i64 %xor183, i64 %and197), !2179, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %and197), !2154, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor198 = xor i64 %xor183, %and197, !dbg !2327
    #dbg_value(i64 %xor198, !2179, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor198), !2154, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor252 = xor i64 %xor251, %xor198, !dbg !2328
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %xor206, i64 %xor202), !2154, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
  %not231 = xor i64 %xor202, -1, !dbg !2329
    #dbg_value(!DIArgList(i64 %xor218, i64 %xor206, i64 %not231), !2184, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %xor206, i64 %not231), !2154, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
  %and232 = and i64 %xor206, %not231, !dbg !2330
    #dbg_value(!DIArgList(i64 %xor218, i64 %and232), !2184, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %and232), !2154, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor233 = xor i64 %xor218, %and232, !dbg !2331
    #dbg_value(i64 %xor233, !2184, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor233), !2154, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor253 = xor i64 %xor252, %xor233, !dbg !2332
    #dbg_value(i64 %xor253, !2154, !DIExpression(), !2092)
  %xor268 = call i64 @llvm.fshl.i64(i64 %xor253, i64 %xor253, i64 1), !dbg !2333
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor245, i64 %xor268), !2168, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor245, i64 %xor62, i64 %xor78, i64 %xor268), !2163, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor245, i64 %xor132, i64 %xor148, i64 %xor268), !2173, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor245, i64 %xor167, i64 %xor183, i64 %xor268), !2178, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor245, i64 %xor202, i64 %xor218, i64 %xor268), !2183, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor245, i64 %xor268), !2158, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor269 = xor i64 %xor245, %xor268, !dbg !2334
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor269), !2168, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %xor62, i64 %xor78), !2163, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %xor132, i64 %xor148), !2173, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %xor167, i64 %xor183), !2178, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %xor202, i64 %xor218), !2183, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 %xor269, !2158, !DIExpression(), !2092)
  %xor417 = xor i64 %xor125, %xor269, !dbg !2335
    #dbg_value(i64 %xor417, !2168, !DIExpression(), !2092)
  %xor420 = call i64 @llvm.fshl.i64(i64 %xor417, i64 %xor417, i64 55), !dbg !2336
    #dbg_value(i64 %xor420, !2151, !DIExpression(), !2092)
  %not82 = xor i64 %xor70, -1, !dbg !2337
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %xor74, i64 %not82), !2151, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %xor74, i64 %not82), !2161, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %and83 = and i64 %xor74, %not82, !dbg !2338
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %and83), !2151, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %and83), !2161, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor84 = xor i64 %xor66, %and83, !dbg !2339
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105), !2151, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor261), !2161, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %not117 = xor i64 %xor105, -1, !dbg !2340
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %not117), !2151, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %xor109, i64 %not117), !2166, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %and118 = and i64 %xor109, %not117, !dbg !2341
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %and118), !2151, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %and118), !2166, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor119 = xor i64 %xor101, %and118, !dbg !2342
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor119), !2151, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor119, i64 %xor261), !2166, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor238 = xor i64 %xor84, %xor119, !dbg !2343
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140), !2151, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %not152 = xor i64 %xor140, -1, !dbg !2344
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %not152), !2151, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %xor144, i64 %not152), !2171, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %and153 = and i64 %xor144, %not152, !dbg !2345
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %and153), !2151, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %and153), !2171, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor154 = xor i64 %xor136, %and153, !dbg !2346
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor154), !2151, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor154, i64 %xor261), !2171, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor239 = xor i64 %xor238, %xor154, !dbg !2347
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175), !2151, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %not187 = xor i64 %xor175, -1, !dbg !2348
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %xor179, i64 %not187), !2151, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %xor179, i64 %not187), !2176, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %and188 = and i64 %xor179, %not187, !dbg !2349
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %and188), !2151, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %and188), !2176, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor189 = xor i64 %xor171, %and188, !dbg !2350
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor189), !2151, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor189, i64 %xor261), !2176, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor240 = xor i64 %xor239, %xor189, !dbg !2351
    #dbg_value(!DIArgList(i64 %xor240, i64 %xor224), !2151, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor241 = xor i64 %xor240, %xor224, !dbg !2352
    #dbg_value(i64 %xor241, !2151, !DIExpression(), !2092)
  %not88 = xor i64 %xor78, -1, !dbg !2353
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %xor62, i64 %not88), !2153, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %xor62, i64 %not88), !2163, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %and89 = and i64 %xor62, %not88, !dbg !2354
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %and89), !2153, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %and89), !2163, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor90 = xor i64 %xor74, %and89, !dbg !2355
    #dbg_value(!DIArgList(i64 %xor90, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125), !2153, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor90, i64 %xor269), !2163, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor246 = xor i64 %xor90, %xor125, !dbg !2356
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148), !2153, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
  %not158 = xor i64 %xor148, -1, !dbg !2357
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %not158), !2153, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %xor132, i64 %not158), !2173, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %and159 = and i64 %xor132, %not158, !dbg !2358
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %and159), !2153, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %and159), !2173, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor160 = xor i64 %xor144, %and159, !dbg !2359
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor160), !2153, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor160, i64 %xor269), !2173, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor247 = xor i64 %xor246, %xor160, !dbg !2360
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183), !2153, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
  %not193 = xor i64 %xor183, -1, !dbg !2361
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %not193), !2153, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %xor167, i64 %not193), !2178, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %and194 = and i64 %xor167, %not193, !dbg !2362
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %and194), !2153, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %and194), !2178, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor195 = xor i64 %xor179, %and194, !dbg !2363
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor195), !2153, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor195, i64 %xor269), !2178, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor248 = xor i64 %xor247, %xor195, !dbg !2364
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %xor202, i64 %xor218), !2153, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
  %not228 = xor i64 %xor218, -1, !dbg !2365
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %xor202, i64 %not228), !2153, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %xor202, i64 %not228), !2183, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %and229 = and i64 %xor202, %not228, !dbg !2366
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %and229), !2153, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %and229), !2183, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor230 = xor i64 %xor214, %and229, !dbg !2367
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor230), !2153, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor230, i64 %xor269), !2183, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor249 = xor i64 %xor248, %xor230, !dbg !2368
    #dbg_value(i64 %xor249, !2153, !DIExpression(), !2092)
  %xor264 = call i64 @llvm.fshl.i64(i64 %xor249, i64 %xor249, i64 1), !dbg !2369
    #dbg_value(!DIArgList(i64 %xor241, i64 %xor264), !2157, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor241, i64 %xor264), !2162, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor241, i64 %xor264), !2177, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor241, i64 %xor264), !2167, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor241, i64 %xor264), !2182, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor241, i64 %xor264), !2172, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor265 = xor i64 %xor241, %xor264, !dbg !2370
    #dbg_value(i64 %xor265, !2157, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor265), !2162, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor265), !2177, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor265), !2167, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor265), !2182, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor265), !2172, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor413 = xor i64 %xor87, %xor265, !dbg !2371
    #dbg_value(i64 %xor413, !2162, !DIExpression(), !2092)
  %xor416 = call i64 @llvm.fshl.i64(i64 %xor413, i64 %xor413, i64 62), !dbg !2372
    #dbg_value(i64 %xor416, !2150, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 %xor432, i64 %xor420, i64 %xor416), !2142, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %not445 = xor i64 %xor416, -1, !dbg !2373
    #dbg_value(!DIArgList(i64 %xor432, i64 %xor420, i64 %not445), !2142, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %and446 = and i64 %xor420, %not445, !dbg !2374
    #dbg_value(!DIArgList(i64 %xor432, i64 %and446), !2142, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor447 = xor i64 %xor432, %and446, !dbg !2375
    #dbg_value(i64 %xor447, !2142, !DIExpression(), !2092)
  %xor256 = call i64 @llvm.fshl.i64(i64 %xor241, i64 %xor241, i64 1), !dbg !2376
    #dbg_value(!DIArgList(i64 %xor253, i64 %xor256), !2155, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor253, i64 %xor256), !2165, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor253, i64 %xor256), !2180, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor253, i64 %xor256), !2170, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %xor256), !2160, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %xor256), !2150, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor253, i64 %xor256), !2175, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor257 = xor i64 %xor253, %xor256, !dbg !2377
    #dbg_value(i64 %xor257, !2155, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor257), !2165, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor257), !2180, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor257), !2170, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !2150, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !2160, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor257), !2175, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor425 = xor i64 %xor186, %xor257, !dbg !2378
    #dbg_value(i64 %xor425, !2175, !DIExpression(), !2092)
  %xor428 = call i64 @llvm.fshl.i64(i64 %xor425, i64 %xor425, i64 41), !dbg !2379
    #dbg_value(i64 %xor428, !2153, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 %xor428, i64 %xor416, i64 %xor432), !2140, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %not442 = xor i64 %xor432, -1, !dbg !2380
    #dbg_value(!DIArgList(i64 %xor428, i64 %xor416, i64 %not442), !2140, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %and443 = and i64 %xor416, %not442, !dbg !2381
    #dbg_value(!DIArgList(i64 %xor428, i64 %and443), !2140, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor444 = xor i64 %xor428, %and443, !dbg !2382
    #dbg_value(i64 %xor444, !2140, !DIExpression(), !2092)
  %xor272 = call i64 @llvm.fshl.i64(i64 %xor237, i64 %xor237, i64 1), !dbg !2383
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor249, i64 %xor272), !2164, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor249, i64 %xor272), !2179, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor249, i64 %xor272), !2169, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor249, i64 %xor272), !2184, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor249, i64 %xor272), !2159, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor249, i64 %xor272), !2174, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor273 = xor i64 %xor249, %xor272, !dbg !2384
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor273), !2164, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor273), !2179, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor273), !2169, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor273), !2184, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(i64 %xor273, !2159, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor273), !2174, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor421 = xor i64 %xor163, %xor273, !dbg !2385
    #dbg_value(i64 %xor421, !2174, !DIExpression(), !2092)
  %xor424 = call i64 @llvm.fshl.i64(i64 %xor421, i64 %xor421, i64 39), !dbg !2386
    #dbg_value(i64 %xor424, !2152, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 %xor424, i64 %xor432, i64 %xor428), !2138, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor420, i64 %xor428, i64 %xor424), !2136, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor416, i64 %xor424, i64 %xor420), !2134, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %not439 = xor i64 %xor428, -1, !dbg !2387
    #dbg_value(!DIArgList(i64 %xor424, i64 %xor432, i64 %not439), !2138, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %and440 = and i64 %xor432, %not439, !dbg !2388
    #dbg_value(!DIArgList(i64 %xor424, i64 %and440), !2138, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor441 = xor i64 %xor424, %and440, !dbg !2389
    #dbg_value(i64 %xor441, !2138, !DIExpression(), !2092)
  %not436 = xor i64 %xor424, -1, !dbg !2390
    #dbg_value(!DIArgList(i64 %xor420, i64 %xor428, i64 %not436), !2136, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %and437 = and i64 %xor428, %not436, !dbg !2391
    #dbg_value(!DIArgList(i64 %xor420, i64 %and437), !2136, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor438 = xor i64 %xor420, %and437, !dbg !2392
    #dbg_value(i64 %xor438, !2136, !DIExpression(), !2092)
  %not433 = xor i64 %xor420, -1, !dbg !2393
    #dbg_value(!DIArgList(i64 %xor416, i64 %xor424, i64 %not433), !2134, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %and434 = and i64 %xor424, %not433, !dbg !2394
    #dbg_value(!DIArgList(i64 %xor416, i64 %and434), !2134, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor435 = xor i64 %xor416, %and434, !dbg !2395
    #dbg_value(i64 %xor435, !2134, !DIExpression(), !2092)
  %xor394 = xor i64 %xor230, %xor269, !dbg !2396
    #dbg_value(i64 %xor394, !2183, !DIExpression(), !2092)
  %xor397 = call i64 @llvm.fshl.i64(i64 %xor394, i64 %xor394, i64 56), !dbg !2397
    #dbg_value(i64 %xor397, !2154, !DIExpression(), !2092)
  %xor382 = xor i64 %xor116, %xor257, !dbg !2398
    #dbg_value(i64 %xor382, !2165, !DIExpression(), !2092)
  %xor385 = call i64 @llvm.fshl.i64(i64 %xor382, i64 %xor382, i64 36), !dbg !2399
    #dbg_value(i64 %xor385, !2151, !DIExpression(), !2092)
  %xor378 = xor i64 %xor93, %xor273, !dbg !2400
    #dbg_value(i64 %xor378, !2164, !DIExpression(), !2092)
  %xor381 = call i64 @llvm.fshl.i64(i64 %xor378, i64 %xor378, i64 27), !dbg !2401
    #dbg_value(i64 %xor381, !2150, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 %xor397, i64 %xor385, i64 %xor381), !2132, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %not410 = xor i64 %xor381, -1, !dbg !2402
    #dbg_value(!DIArgList(i64 %xor397, i64 %xor385, i64 %not410), !2132, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %and411 = and i64 %xor385, %not410, !dbg !2403
    #dbg_value(!DIArgList(i64 %xor397, i64 %and411), !2132, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor412 = xor i64 %xor397, %and411, !dbg !2404
    #dbg_value(i64 %xor412, !2132, !DIExpression(), !2092)
  %xor390 = xor i64 %xor192, %xor265, !dbg !2405
    #dbg_value(i64 %xor390, !2177, !DIExpression(), !2092)
  %xor393 = call i64 @llvm.fshl.i64(i64 %xor390, i64 %xor390, i64 15), !dbg !2406
    #dbg_value(i64 %xor393, !2153, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 %xor393, i64 %xor381, i64 %xor397), !2130, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %not407 = xor i64 %xor397, -1, !dbg !2407
    #dbg_value(!DIArgList(i64 %xor393, i64 %xor381, i64 %not407), !2130, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %and408 = and i64 %xor381, %not407, !dbg !2408
    #dbg_value(!DIArgList(i64 %xor393, i64 %and408), !2130, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor409 = xor i64 %xor393, %and408, !dbg !2409
    #dbg_value(i64 %xor409, !2130, !DIExpression(), !2092)
  %xor386 = xor i64 %xor154, %xor261, !dbg !2410
    #dbg_value(i64 %xor386, !2171, !DIExpression(), !2092)
  %xor389 = call i64 @llvm.fshl.i64(i64 %xor386, i64 %xor386, i64 10), !dbg !2411
    #dbg_value(i64 %xor389, !2152, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 %xor389, i64 %xor397, i64 %xor393), !2128, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor385, i64 %xor393, i64 %xor389), !2126, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor381, i64 %xor389, i64 %xor385), !2124, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %not404 = xor i64 %xor393, -1, !dbg !2412
    #dbg_value(!DIArgList(i64 %xor389, i64 %xor397, i64 %not404), !2128, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %and405 = and i64 %xor397, %not404, !dbg !2413
    #dbg_value(!DIArgList(i64 %xor389, i64 %and405), !2128, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor406 = xor i64 %xor389, %and405, !dbg !2414
    #dbg_value(i64 %xor406, !2128, !DIExpression(), !2092)
  %not401 = xor i64 %xor389, -1, !dbg !2415
    #dbg_value(!DIArgList(i64 %xor385, i64 %xor393, i64 %not401), !2126, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %and402 = and i64 %xor393, %not401, !dbg !2416
    #dbg_value(!DIArgList(i64 %xor385, i64 %and402), !2126, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor403 = xor i64 %xor385, %and402, !dbg !2417
    #dbg_value(i64 %xor403, !2126, !DIExpression(), !2092)
  %not398 = xor i64 %xor385, -1, !dbg !2418
    #dbg_value(!DIArgList(i64 %xor381, i64 %xor389, i64 %not398), !2124, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %and399 = and i64 %xor389, %not398, !dbg !2419
    #dbg_value(!DIArgList(i64 %xor381, i64 %and399), !2124, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor400 = xor i64 %xor381, %and399, !dbg !2420
    #dbg_value(i64 %xor400, !2124, !DIExpression(), !2092)
  %xor359 = xor i64 %xor221, %xor257, !dbg !2421
    #dbg_value(i64 %xor359, !2180, !DIExpression(), !2092)
  %xor362 = call i64 @llvm.fshl.i64(i64 %xor359, i64 %xor359, i64 18), !dbg !2422
    #dbg_value(i64 %xor362, !2154, !DIExpression(), !2092)
  %xor347 = xor i64 %xor122, %xor265, !dbg !2423
    #dbg_value(i64 %xor347, !2167, !DIExpression(), !2092)
  %xor350 = call i64 @llvm.fshl.i64(i64 %xor347, i64 %xor347, i64 6), !dbg !2424
    #dbg_value(i64 %xor350, !2151, !DIExpression(), !2092)
  %xor343 = xor i64 %xor84, %xor261, !dbg !2425
    #dbg_value(i64 %xor343, !2161, !DIExpression(), !2092)
  %xor346 = call i64 @llvm.fshl.i64(i64 %xor343, i64 %xor343, i64 1), !dbg !2426
    #dbg_value(i64 %xor346, !2150, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 %xor362, i64 %xor350, i64 %xor346), !2122, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %not375 = xor i64 %xor346, -1, !dbg !2427
    #dbg_value(!DIArgList(i64 %xor362, i64 %xor350, i64 %not375), !2122, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %and376 = and i64 %xor350, %not375, !dbg !2428
    #dbg_value(!DIArgList(i64 %xor362, i64 %and376), !2122, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor377 = xor i64 %xor362, %and376, !dbg !2429
    #dbg_value(i64 %xor377, !2122, !DIExpression(), !2092)
  %xor355 = xor i64 %xor198, %xor273, !dbg !2430
    #dbg_value(i64 %xor355, !2179, !DIExpression(), !2092)
  %xor358 = call i64 @llvm.fshl.i64(i64 %xor355, i64 %xor355, i64 8), !dbg !2431
    #dbg_value(i64 %xor358, !2153, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 %xor358, i64 %xor346, i64 %xor362), !2120, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %not372 = xor i64 %xor362, -1, !dbg !2432
    #dbg_value(!DIArgList(i64 %xor358, i64 %xor346, i64 %not372), !2120, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %and373 = and i64 %xor346, %not372, !dbg !2433
    #dbg_value(!DIArgList(i64 %xor358, i64 %and373), !2120, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor374 = xor i64 %xor358, %and373, !dbg !2434
    #dbg_value(i64 %xor374, !2120, !DIExpression(), !2092)
  %xor351 = xor i64 %xor160, %xor269, !dbg !2435
    #dbg_value(i64 %xor351, !2173, !DIExpression(), !2092)
  %xor354 = call i64 @llvm.fshl.i64(i64 %xor351, i64 %xor351, i64 25), !dbg !2436
    #dbg_value(i64 %xor354, !2152, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 %xor354, i64 %xor362, i64 %xor358), !2118, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor350, i64 %xor358, i64 %xor354), !2116, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor346, i64 %xor354, i64 %xor350), !2114, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %not369 = xor i64 %xor358, -1, !dbg !2437
    #dbg_value(!DIArgList(i64 %xor354, i64 %xor362, i64 %not369), !2118, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %and370 = and i64 %xor362, %not369, !dbg !2438
    #dbg_value(!DIArgList(i64 %xor354, i64 %and370), !2118, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor371 = xor i64 %xor354, %and370, !dbg !2439
    #dbg_value(i64 %xor371, !2118, !DIExpression(), !2092)
  %not366 = xor i64 %xor354, -1, !dbg !2440
    #dbg_value(!DIArgList(i64 %xor350, i64 %xor358, i64 %not366), !2116, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %and367 = and i64 %xor358, %not366, !dbg !2441
    #dbg_value(!DIArgList(i64 %xor350, i64 %and367), !2116, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor368 = xor i64 %xor350, %and367, !dbg !2442
    #dbg_value(i64 %xor368, !2116, !DIExpression(), !2092)
  %not363 = xor i64 %xor350, -1, !dbg !2443
    #dbg_value(!DIArgList(i64 %xor346, i64 %xor354, i64 %not363), !2114, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %and364 = and i64 %xor354, %not363, !dbg !2444
    #dbg_value(!DIArgList(i64 %xor346, i64 %and364), !2114, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor365 = xor i64 %xor346, %and364, !dbg !2445
    #dbg_value(i64 %xor365, !2114, !DIExpression(), !2092)
  %xor324 = xor i64 %xor227, %xor265, !dbg !2446
    #dbg_value(i64 %xor324, !2182, !DIExpression(), !2092)
  %xor327 = call i64 @llvm.fshl.i64(i64 %xor324, i64 %xor324, i64 61), !dbg !2447
    #dbg_value(i64 %xor327, !2154, !DIExpression(), !2092)
  %xor312 = xor i64 %xor128, %xor273, !dbg !2448
    #dbg_value(i64 %xor312, !2169, !DIExpression(), !2092)
  %xor315 = call i64 @llvm.fshl.i64(i64 %xor312, i64 %xor312, i64 20), !dbg !2449
    #dbg_value(i64 %xor315, !2151, !DIExpression(), !2092)
  %xor308 = xor i64 %xor90, %xor269, !dbg !2450
    #dbg_value(i64 %xor308, !2163, !DIExpression(), !2092)
  %xor311 = call i64 @llvm.fshl.i64(i64 %xor308, i64 %xor308, i64 28), !dbg !2451
    #dbg_value(i64 %xor311, !2150, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 %xor327, i64 %xor315, i64 %xor311), !2112, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %not340 = xor i64 %xor311, -1, !dbg !2452
    #dbg_value(!DIArgList(i64 %xor327, i64 %xor315, i64 %not340), !2112, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %and341 = and i64 %xor315, %not340, !dbg !2453
    #dbg_value(!DIArgList(i64 %xor327, i64 %and341), !2112, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor342 = xor i64 %xor327, %and341, !dbg !2454
    #dbg_value(i64 %xor342, !2112, !DIExpression(), !2092)
  %xor320 = xor i64 %xor189, %xor261, !dbg !2455
    #dbg_value(i64 %xor320, !2176, !DIExpression(), !2092)
  %xor323 = call i64 @llvm.fshl.i64(i64 %xor320, i64 %xor320, i64 45), !dbg !2456
    #dbg_value(i64 %xor323, !2153, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 %xor323, i64 %xor311, i64 %xor327), !2110, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %not337 = xor i64 %xor327, -1, !dbg !2457
    #dbg_value(!DIArgList(i64 %xor323, i64 %xor311, i64 %not337), !2110, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %and338 = and i64 %xor311, %not337, !dbg !2458
    #dbg_value(!DIArgList(i64 %xor323, i64 %and338), !2110, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor339 = xor i64 %xor323, %and338, !dbg !2459
    #dbg_value(i64 %xor339, !2110, !DIExpression(), !2092)
  %xor316 = xor i64 %xor151, %xor257, !dbg !2460
    #dbg_value(i64 %xor316, !2170, !DIExpression(), !2092)
  %xor319 = call i64 @llvm.fshl.i64(i64 %xor316, i64 %xor316, i64 3), !dbg !2461
    #dbg_value(i64 %xor319, !2152, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 %xor319, i64 %xor327, i64 %xor323), !2108, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor315, i64 %xor323, i64 %xor319), !2106, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor311, i64 %xor319, i64 %xor315), !2104, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %not334 = xor i64 %xor323, -1, !dbg !2462
    #dbg_value(!DIArgList(i64 %xor319, i64 %xor327, i64 %not334), !2108, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %and335 = and i64 %xor327, %not334, !dbg !2463
    #dbg_value(!DIArgList(i64 %xor319, i64 %and335), !2108, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor336 = xor i64 %xor319, %and335, !dbg !2464
    #dbg_value(i64 %xor336, !2108, !DIExpression(), !2092)
  %not331 = xor i64 %xor319, -1, !dbg !2465
    #dbg_value(!DIArgList(i64 %xor315, i64 %xor323, i64 %not331), !2106, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %and332 = and i64 %xor323, %not331, !dbg !2466
    #dbg_value(!DIArgList(i64 %xor315, i64 %and332), !2106, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor333 = xor i64 %xor315, %and332, !dbg !2467
    #dbg_value(i64 %xor333, !2106, !DIExpression(), !2092)
  %not328 = xor i64 %xor315, -1, !dbg !2468
    #dbg_value(!DIArgList(i64 %xor311, i64 %xor319, i64 %not328), !2104, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %and329 = and i64 %xor319, %not328, !dbg !2469
    #dbg_value(!DIArgList(i64 %xor311, i64 %and329), !2104, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor330 = xor i64 %xor311, %and329, !dbg !2470
    #dbg_value(i64 %xor330, !2104, !DIExpression(), !2092)
  %xor287 = xor i64 %xor233, %xor273, !dbg !2471
    #dbg_value(i64 %xor287, !2184, !DIExpression(), !2092)
  %xor290 = call i64 @llvm.fshl.i64(i64 %xor287, i64 %xor287, i64 14), !dbg !2472
    #dbg_value(i64 %xor290, !2154, !DIExpression(), !2092)
  %xor275 = xor i64 %xor119, %xor261, !dbg !2473
    #dbg_value(i64 %xor275, !2166, !DIExpression(), !2092)
  %xor278 = call i64 @llvm.fshl.i64(i64 %xor275, i64 %xor275, i64 44), !dbg !2474
    #dbg_value(i64 %xor278, !2151, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %xor81, i64 %xor257), !2102, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor274 = xor i64 %xor81, %xor257, !dbg !2475
    #dbg_value(i64 %xor274, !2160, !DIExpression(), !2092)
    #dbg_value(i64 %xor274, !2150, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %xor274), !2102, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %not305 = xor i64 %xor274, -1, !dbg !2476
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %not305), !2102, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %and306 = and i64 %xor278, %not305, !dbg !2477
    #dbg_value(!DIArgList(i64 %xor290, i64 %and306), !2102, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor307 = xor i64 %xor290, %and306, !dbg !2478
    #dbg_value(i64 %xor307, !2102, !DIExpression(), !2092)
  %xor283 = xor i64 %xor195, %xor269, !dbg !2479
    #dbg_value(i64 %xor283, !2178, !DIExpression(), !2092)
  %xor286 = call i64 @llvm.fshl.i64(i64 %xor283, i64 %xor283, i64 21), !dbg !2480
    #dbg_value(i64 %xor286, !2153, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 %xor286, i64 %xor274, i64 %xor290), !2100, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %not302 = xor i64 %xor290, -1, !dbg !2481
    #dbg_value(!DIArgList(i64 %xor286, i64 %xor274, i64 %not302), !2100, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %and303 = and i64 %xor274, %not302, !dbg !2482
    #dbg_value(!DIArgList(i64 %xor286, i64 %and303), !2100, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor304 = xor i64 %xor286, %and303, !dbg !2483
    #dbg_value(i64 %xor304, !2100, !DIExpression(), !2092)
  %xor279 = xor i64 %xor157, %xor265, !dbg !2484
    #dbg_value(i64 %xor279, !2172, !DIExpression(), !2092)
  %xor282 = call i64 @llvm.fshl.i64(i64 %xor279, i64 %xor279, i64 43), !dbg !2485
    #dbg_value(i64 %xor282, !2152, !DIExpression(), !2092)
    #dbg_value(!DIArgList(i64 %xor282, i64 %xor290, i64 %xor286), !2098, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor278, i64 %xor286, i64 %xor282), !2096, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
    #dbg_value(!DIArgList(i64 %xor274, i64 %xor282, i64 %xor278), !2094, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %not299 = xor i64 %xor286, -1, !dbg !2486
    #dbg_value(!DIArgList(i64 %xor282, i64 %xor290, i64 %not299), !2098, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %and300 = and i64 %xor290, %not299, !dbg !2487
    #dbg_value(!DIArgList(i64 %xor282, i64 %and300), !2098, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor301 = xor i64 %xor282, %and300, !dbg !2488
    #dbg_value(i64 %xor301, !2098, !DIExpression(), !2092)
  %not296 = xor i64 %xor282, -1, !dbg !2489
    #dbg_value(!DIArgList(i64 %xor278, i64 %xor286, i64 %not296), !2096, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2092)
  %and297 = and i64 %xor286, %not296, !dbg !2490
    #dbg_value(!DIArgList(i64 %xor278, i64 %and297), !2096, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %xor298 = xor i64 %xor278, %and297, !dbg !2491
    #dbg_value(i64 %xor298, !2096, !DIExpression(), !2092)
  %add = or disjoint i32 %round.0, 1, !dbg !2492
  %arrayidx294 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %add, !dbg !2493
  %27 = load i64, ptr %arrayidx294, align 8, !dbg !2493
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %xor282, i64 %xor278), !2094, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %not291 = xor i64 %xor278, -1, !dbg !2494
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %xor282, i64 %not291), !2094, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %and292 = and i64 %xor282, %not291, !dbg !2495
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %and292), !2094, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2092)
  %28 = xor i64 %and292, %27, !dbg !2496
  %xor295 = xor i64 %28, %xor274, !dbg !2496
    #dbg_value(i64 %xor295, !2094, !DIExpression(), !2092)
  %add448 = add nuw nsw i32 %round.0, 2, !dbg !2497
    #dbg_value(i32 %add448, !2143, !DIExpression(), !2092)
  br label %for.cond, !dbg !2498, !llvm.loop !2499

for.end:                                          ; preds = %for.cond
  %Aso.0.lcssa = phi i64 [ %Aso.0, %for.cond ], !dbg !2092
  %Asi.0.lcssa = phi i64 [ %Asi.0, %for.cond ], !dbg !2092
  %Ase.0.lcssa = phi i64 [ %Ase.0, %for.cond ], !dbg !2092
  %Asa.0.lcssa = phi i64 [ %Asa.0, %for.cond ], !dbg !2092
  %Amu.0.lcssa = phi i64 [ %Amu.0, %for.cond ], !dbg !2092
  %Amo.0.lcssa = phi i64 [ %Amo.0, %for.cond ], !dbg !2092
  %Ami.0.lcssa = phi i64 [ %Ami.0, %for.cond ], !dbg !2092
  %Ame.0.lcssa = phi i64 [ %Ame.0, %for.cond ], !dbg !2092
  %Ama.0.lcssa = phi i64 [ %Ama.0, %for.cond ], !dbg !2092
  %Aku.0.lcssa = phi i64 [ %Aku.0, %for.cond ], !dbg !2092
  %Ako.0.lcssa = phi i64 [ %Ako.0, %for.cond ], !dbg !2092
  %Aki.0.lcssa = phi i64 [ %Aki.0, %for.cond ], !dbg !2092
  %Ake.0.lcssa = phi i64 [ %Ake.0, %for.cond ], !dbg !2092
  %Aka.0.lcssa = phi i64 [ %Aka.0, %for.cond ], !dbg !2092
  %Agu.0.lcssa = phi i64 [ %Agu.0, %for.cond ], !dbg !2092
  %Ago.0.lcssa = phi i64 [ %Ago.0, %for.cond ], !dbg !2092
  %Agi.0.lcssa = phi i64 [ %Agi.0, %for.cond ], !dbg !2092
  %Age.0.lcssa = phi i64 [ %Age.0, %for.cond ], !dbg !2092
  %Aga.0.lcssa = phi i64 [ %Aga.0, %for.cond ], !dbg !2092
  %Abu.0.lcssa = phi i64 [ %Abu.0, %for.cond ], !dbg !2092
  %Abo.0.lcssa = phi i64 [ %Abo.0, %for.cond ], !dbg !2092
  %Abi.0.lcssa = phi i64 [ %Abi.0, %for.cond ], !dbg !2092
  %Abe.0.lcssa = phi i64 [ %Abe.0, %for.cond ], !dbg !2092
  %Aba.0.lcssa = phi i64 [ %Aba.0, %for.cond ], !dbg !2092
  %Asu.0.lcssa = phi i64 [ %Asu.0, %for.cond ], !dbg !2092
  store i64 %Aba.0.lcssa, ptr %state, align 8, !dbg !2501
  %arrayidx450 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !2502
  store i64 %Abe.0.lcssa, ptr %arrayidx450, align 8, !dbg !2503
  %arrayidx451 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !2504
  store i64 %Abi.0.lcssa, ptr %arrayidx451, align 8, !dbg !2505
  %arrayidx452 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !2506
  store i64 %Abo.0.lcssa, ptr %arrayidx452, align 8, !dbg !2507
  %arrayidx453 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !2508
  store i64 %Abu.0.lcssa, ptr %arrayidx453, align 8, !dbg !2509
  %arrayidx454 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !2510
  store i64 %Aga.0.lcssa, ptr %arrayidx454, align 8, !dbg !2511
  %arrayidx455 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !2512
  store i64 %Age.0.lcssa, ptr %arrayidx455, align 8, !dbg !2513
  %arrayidx456 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !2514
  store i64 %Agi.0.lcssa, ptr %arrayidx456, align 8, !dbg !2515
  %arrayidx457 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !2516
  store i64 %Ago.0.lcssa, ptr %arrayidx457, align 8, !dbg !2517
  %arrayidx458 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !2518
  store i64 %Agu.0.lcssa, ptr %arrayidx458, align 8, !dbg !2519
  %arrayidx459 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !2520
  store i64 %Aka.0.lcssa, ptr %arrayidx459, align 8, !dbg !2521
  %arrayidx460 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !2522
  store i64 %Ake.0.lcssa, ptr %arrayidx460, align 8, !dbg !2523
  %arrayidx461 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !2524
  store i64 %Aki.0.lcssa, ptr %arrayidx461, align 8, !dbg !2525
  %arrayidx462 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !2526
  store i64 %Ako.0.lcssa, ptr %arrayidx462, align 8, !dbg !2527
  %arrayidx463 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !2528
  store i64 %Aku.0.lcssa, ptr %arrayidx463, align 8, !dbg !2529
  %arrayidx464 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !2530
  store i64 %Ama.0.lcssa, ptr %arrayidx464, align 8, !dbg !2531
  %arrayidx465 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !2532
  store i64 %Ame.0.lcssa, ptr %arrayidx465, align 8, !dbg !2533
  %arrayidx466 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !2534
  store i64 %Ami.0.lcssa, ptr %arrayidx466, align 8, !dbg !2535
  %arrayidx467 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !2536
  store i64 %Amo.0.lcssa, ptr %arrayidx467, align 8, !dbg !2537
  %arrayidx468 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !2538
  store i64 %Amu.0.lcssa, ptr %arrayidx468, align 8, !dbg !2539
  %arrayidx469 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !2540
  store i64 %Asa.0.lcssa, ptr %arrayidx469, align 8, !dbg !2541
  %arrayidx470 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !2542
  store i64 %Ase.0.lcssa, ptr %arrayidx470, align 8, !dbg !2543
  %arrayidx471 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !2544
  store i64 %Asi.0.lcssa, ptr %arrayidx471, align 8, !dbg !2545
  %arrayidx472 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !2546
  store i64 %Aso.0.lcssa, ptr %arrayidx472, align 8, !dbg !2547
  %arrayidx473 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !2548
  store i64 %Asu.0.lcssa, ptr %arrayidx473, align 8, !dbg !2549
  ret void, !dbg !2550
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_finalize(ptr noundef %state) local_unnamed_addr #0 !dbg !2551 {
entry:
    #dbg_value(ptr %state, !2552, !DIExpression(), !2553)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2554
  %0 = load i32, ptr %pos, align 8, !dbg !2554
  call fastcc void @keccak_finalize(ptr noundef %state, i32 noundef %0, i32 noundef 168, i8 noundef zeroext 31) #3, !dbg !2555
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2556
  store i32 168, ptr %pos1, align 8, !dbg !2557
  ret void, !dbg !2558
}

; Function Attrs: nounwind
define internal fastcc void @keccak_finalize(ptr noundef %s, i32 noundef %pos, i32 noundef %r, i8 noundef zeroext %p) unnamed_addr #0 !dbg !2559 {
entry:
    #dbg_value(ptr %s, !2562, !DIExpression(), !2563)
    #dbg_value(i32 %pos, !2564, !DIExpression(), !2563)
    #dbg_value(i32 %r, !2565, !DIExpression(), !2563)
    #dbg_value(i8 %p, !2566, !DIExpression(), !2563)
  %conv = zext i8 %p to i64, !dbg !2567
  %rem = shl i32 %pos, 3, !dbg !2568
  %mul = and i32 %rem, 56, !dbg !2568
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2569
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !2569
  %div2 = lshr i32 %pos, 3, !dbg !2570
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div2, !dbg !2571
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2572
  %xor = xor i64 %0, %shl, !dbg !2572
  store i64 %xor, ptr %arrayidx, align 8, !dbg !2572
  %div13 = lshr i32 %r, 3, !dbg !2573
  %1 = getelementptr i64, ptr %s, i32 %div13, !dbg !2574
  %arrayidx2 = getelementptr i8, ptr %1, i32 -8, !dbg !2574
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !2575
  %xor3 = xor i64 %2, -9223372036854775808, !dbg !2575
  store i64 %xor3, ptr %arrayidx2, align 8, !dbg !2575
  ret void, !dbg !2576
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) local_unnamed_addr #0 !dbg !2577 {
entry:
    #dbg_value(ptr %out, !2580, !DIExpression(), !2581)
    #dbg_value(i32 %outlen, !2582, !DIExpression(), !2581)
    #dbg_value(ptr %state, !2583, !DIExpression(), !2581)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2584
  %0 = load i32, ptr %pos, align 8, !dbg !2584
  %call = call fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state, i32 noundef %0, i32 noundef 168) #3, !dbg !2585
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2586
  store i32 %call, ptr %pos1, align 8, !dbg !2587
  ret void, !dbg !2588
}

; Function Attrs: nounwind
define internal fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %s, i32 noundef %pos, i32 noundef %r) unnamed_addr #0 !dbg !2589 {
entry:
    #dbg_value(ptr %out, !2592, !DIExpression(), !2593)
    #dbg_value(i32 %outlen, !2594, !DIExpression(), !2593)
    #dbg_value(ptr %s, !2595, !DIExpression(), !2593)
    #dbg_value(i32 %pos, !2596, !DIExpression(), !2593)
    #dbg_value(i32 %r, !2597, !DIExpression(), !2593)
  br label %while.cond, !dbg !2598

while.cond:                                       ; preds = %for.end, %entry
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ %i.0.lcssa, %for.end ]
  %outlen.addr.0 = phi i32 [ %outlen, %entry ], [ %sub3, %for.end ]
  %out.addr.0 = phi ptr [ %out, %entry ], [ %out.addr.1.lcssa, %for.end ]
    #dbg_value(ptr %out.addr.0, !2592, !DIExpression(), !2593)
    #dbg_value(i32 %outlen.addr.0, !2594, !DIExpression(), !2593)
    #dbg_value(i32 %pos.addr.0, !2596, !DIExpression(), !2593)
  %tobool.not = icmp eq i32 %outlen.addr.0, 0, !dbg !2598
  br i1 %tobool.not, label %while.end, label %while.body, !dbg !2598

while.body:                                       ; preds = %while.cond
  %cmp = icmp eq i32 %pos.addr.0, %r, !dbg !2599
  br i1 %cmp, label %if.then, label %if.end, !dbg !2599

if.then:                                          ; preds = %while.body
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2602
    #dbg_value(i32 0, !2596, !DIExpression(), !2593)
  br label %if.end, !dbg !2604

if.end:                                           ; preds = %if.then, %while.body
  %pos.addr.1 = phi i32 [ 0, %if.then ], [ %pos.addr.0, %while.body ]
    #dbg_value(i32 %pos.addr.1, !2596, !DIExpression(), !2593)
    #dbg_value(i32 %pos.addr.1, !2605, !DIExpression(), !2593)
  br label %for.cond, !dbg !2606

for.cond:                                         ; preds = %for.body, %if.end
  %i.0 = phi i32 [ %pos.addr.1, %if.end ], [ %inc, %for.body ], !dbg !2608
  %out.addr.1 = phi ptr [ %out.addr.0, %if.end ], [ %incdec.ptr, %for.body ]
    #dbg_value(ptr %out.addr.1, !2592, !DIExpression(), !2593)
    #dbg_value(i32 %i.0, !2605, !DIExpression(), !2593)
  %cmp1 = icmp ult i32 %i.0, %r, !dbg !2609
  %add = add i32 %pos.addr.1, %outlen.addr.0, !dbg !2611
  %cmp2 = icmp ult i32 %i.0, %add, !dbg !2611
  %0 = and i1 %cmp1, %cmp2, !dbg !2611
  br i1 %0, label %for.body, label %for.end, !dbg !2612

for.body:                                         ; preds = %for.cond
  %div1 = lshr i32 %i.0, 3, !dbg !2613
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div1, !dbg !2614
  %1 = load i64, ptr %arrayidx, align 8, !dbg !2614
  %rem = shl i32 %i.0, 3, !dbg !2615
  %mul = and i32 %rem, 56, !dbg !2615
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2616
  %shr = lshr i64 %1, %sh_prom, !dbg !2616
  %conv = trunc i64 %shr to i8, !dbg !2614
    #dbg_value(ptr %out.addr.1, !2592, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2593)
  store i8 %conv, ptr %out.addr.1, align 1, !dbg !2617
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %out.addr.1, i32 1, !dbg !2618
    #dbg_value(ptr %incdec.ptr, !2592, !DIExpression(), !2593)
  %inc = add nuw i32 %i.0, 1, !dbg !2619
    #dbg_value(i32 %inc, !2605, !DIExpression(), !2593)
  br label %for.cond, !dbg !2620, !llvm.loop !2621

for.end:                                          ; preds = %for.cond
  %i.0.lcssa = phi i32 [ %i.0, %for.cond ], !dbg !2608
  %out.addr.1.lcssa = phi ptr [ %out.addr.1, %for.cond ]
  %sub.neg = sub i32 %pos.addr.1, %i.0.lcssa, !dbg !2623
  %sub3 = add i32 %sub.neg, %outlen.addr.0, !dbg !2624
    #dbg_value(i32 %sub3, !2594, !DIExpression(), !2593)
    #dbg_value(i32 %i.0.lcssa, !2596, !DIExpression(), !2593)
  br label %while.cond, !dbg !2598, !llvm.loop !2625

while.end:                                        ; preds = %while.cond
  %pos.addr.0.lcssa = phi i32 [ %pos.addr.0, %while.cond ]
  ret i32 %pos.addr.0.lcssa, !dbg !2627
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2628 {
entry:
    #dbg_value(ptr %state, !2629, !DIExpression(), !2630)
    #dbg_value(ptr %in, !2631, !DIExpression(), !2630)
    #dbg_value(i32 %inlen, !2632, !DIExpression(), !2630)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 168, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #3, !dbg !2633
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2634
  store i32 168, ptr %pos, align 8, !dbg !2635
  ret void, !dbg !2636
}

; Function Attrs: nounwind
define internal fastcc void @keccak_absorb_once(ptr noundef %s, i32 noundef %r, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext %p) unnamed_addr #0 !dbg !2637 {
entry:
    #dbg_value(ptr %s, !2640, !DIExpression(), !2641)
    #dbg_value(i32 %r, !2642, !DIExpression(), !2641)
    #dbg_value(ptr %in, !2643, !DIExpression(), !2641)
    #dbg_value(i32 %inlen, !2644, !DIExpression(), !2641)
    #dbg_value(i8 %p, !2645, !DIExpression(), !2641)
    #dbg_value(i32 0, !2646, !DIExpression(), !2641)
  br label %for.cond, !dbg !2647

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2649
    #dbg_value(i32 %i.0, !2646, !DIExpression(), !2641)
  %exitcond = icmp ne i32 %i.0, 25, !dbg !2650
  br i1 %exitcond, label %for.body, label %while.cond.preheader, !dbg !2652

while.cond.preheader:                             ; preds = %for.cond
  %0 = lshr i32 %r, 3, !dbg !2653
  br label %while.cond, !dbg !2653

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !2654
  store i64 0, ptr %arrayidx, align 8, !dbg !2655
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2656
    #dbg_value(i32 %inc, !2646, !DIExpression(), !2641)
  br label %for.cond, !dbg !2657, !llvm.loop !2658

while.cond:                                       ; preds = %while.cond.preheader, %for.end8
  %in.addr.0 = phi ptr [ %add.ptr9, %for.end8 ], [ %in, %while.cond.preheader ]
  %inlen.addr.0 = phi i32 [ %sub, %for.end8 ], [ %inlen, %while.cond.preheader ]
    #dbg_value(i32 %inlen.addr.0, !2644, !DIExpression(), !2641)
    #dbg_value(ptr %in.addr.0, !2643, !DIExpression(), !2641)
  %cmp1.not = icmp ult i32 %inlen.addr.0, %r, !dbg !2660
  br i1 %cmp1.not, label %for.cond10.preheader, label %for.cond2.preheader, !dbg !2653

for.cond2.preheader:                              ; preds = %while.cond
  br label %for.cond2, !dbg !2661

for.cond10.preheader:                             ; preds = %while.cond
  %inlen.addr.0.lcssa6 = phi i32 [ %inlen.addr.0, %while.cond ]
  %in.addr.0.lcssa = phi ptr [ %in.addr.0, %while.cond ]
  br label %for.cond10, !dbg !2664

for.cond2:                                        ; preds = %for.cond2.preheader, %for.body4
  %i.1 = phi i32 [ %inc7, %for.body4 ], [ 0, %for.cond2.preheader ], !dbg !2666
    #dbg_value(i32 %i.1, !2646, !DIExpression(), !2641)
  %exitcond5 = icmp ne i32 %i.1, %0, !dbg !2667
  br i1 %exitcond5, label %for.body4, label %for.end8, !dbg !2661

for.body4:                                        ; preds = %for.cond2
  %mul = shl nuw i32 %i.1, 3, !dbg !2669
  %add.ptr = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %mul, !dbg !2670
  %call = call fastcc i64 @load64(ptr noundef %add.ptr) #3, !dbg !2671
  %arrayidx5 = getelementptr inbounds nuw i64, ptr %s, i32 %i.1, !dbg !2672
  %1 = load i64, ptr %arrayidx5, align 8, !dbg !2673
  %xor = xor i64 %1, %call, !dbg !2673
  store i64 %xor, ptr %arrayidx5, align 8, !dbg !2673
  %inc7 = add nuw nsw i32 %i.1, 1, !dbg !2674
    #dbg_value(i32 %inc7, !2646, !DIExpression(), !2641)
  br label %for.cond2, !dbg !2675, !llvm.loop !2676

for.end8:                                         ; preds = %for.cond2
  %add.ptr9 = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %r, !dbg !2678
    #dbg_value(ptr %add.ptr9, !2643, !DIExpression(), !2641)
  %sub = sub i32 %inlen.addr.0, %r, !dbg !2679
    #dbg_value(i32 %sub, !2644, !DIExpression(), !2641)
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2680
  br label %while.cond, !dbg !2653, !llvm.loop !2681

for.cond10:                                       ; preds = %for.cond10.preheader, %for.body12
  %i.2 = phi i32 [ %inc19, %for.body12 ], [ 0, %for.cond10.preheader ], !dbg !2683
    #dbg_value(i32 %i.2, !2646, !DIExpression(), !2641)
  %exitcond7 = icmp ne i32 %i.2, %inlen.addr.0.lcssa6, !dbg !2684
  br i1 %exitcond7, label %for.body12, label %for.end20, !dbg !2664

for.body12:                                       ; preds = %for.cond10
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %in.addr.0.lcssa, i32 %i.2, !dbg !2686
  %2 = load i8, ptr %arrayidx13, align 1, !dbg !2686
  %conv = zext i8 %2 to i64, !dbg !2687
  %rem = shl i32 %i.2, 3, !dbg !2688
  %mul14 = and i32 %rem, 56, !dbg !2688
  %sh_prom = zext nneg i32 %mul14 to i64, !dbg !2689
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !2689
  %div153 = lshr i32 %i.2, 3, !dbg !2690
  %arrayidx16 = getelementptr inbounds nuw i64, ptr %s, i32 %div153, !dbg !2691
  %3 = load i64, ptr %arrayidx16, align 8, !dbg !2692
  %xor17 = xor i64 %3, %shl, !dbg !2692
  store i64 %xor17, ptr %arrayidx16, align 8, !dbg !2692
  %inc19 = add i32 %i.2, 1, !dbg !2693
    #dbg_value(i32 %inc19, !2646, !DIExpression(), !2641)
  br label %for.cond10, !dbg !2694, !llvm.loop !2695

for.end20:                                        ; preds = %for.cond10
  %i.2.lcssa = phi i32 [ %i.2, %for.cond10 ], !dbg !2683
  %conv21 = zext i8 %p to i64, !dbg !2697
  %rem22 = shl i32 %i.2.lcssa, 3, !dbg !2698
  %mul23 = and i32 %rem22, 56, !dbg !2698
  %sh_prom24 = zext nneg i32 %mul23 to i64, !dbg !2699
  %shl25 = shl nuw i64 %conv21, %sh_prom24, !dbg !2699
  %div261 = lshr i32 %i.2.lcssa, 3, !dbg !2700
  %arrayidx27 = getelementptr inbounds nuw i64, ptr %s, i32 %div261, !dbg !2701
  %4 = load i64, ptr %arrayidx27, align 8, !dbg !2702
  %xor28 = xor i64 %4, %shl25, !dbg !2702
  store i64 %xor28, ptr %arrayidx27, align 8, !dbg !2702
  %sub29 = add i32 %r, -1, !dbg !2703
  %div302 = lshr i32 %sub29, 3, !dbg !2704
  %arrayidx31 = getelementptr inbounds nuw i64, ptr %s, i32 %div302, !dbg !2705
  %5 = load i64, ptr %arrayidx31, align 8, !dbg !2706
  %xor32 = xor i64 %5, -9223372036854775808, !dbg !2706
  store i64 %xor32, ptr %arrayidx31, align 8, !dbg !2706
  ret void, !dbg !2707
}

; Function Attrs: nounwind
define internal fastcc i64 @load64(ptr noundef %x) unnamed_addr #0 !dbg !2708 {
entry:
    #dbg_value(ptr %x, !2711, !DIExpression(), !2712)
    #dbg_value(i64 0, !2713, !DIExpression(), !2712)
    #dbg_value(i32 0, !2714, !DIExpression(), !2712)
  br label %for.cond, !dbg !2715

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !2717
  %r.0 = phi i64 [ 0, %entry ], [ %or, %for.inc ], !dbg !2712
    #dbg_value(i64 %r.0, !2713, !DIExpression(), !2712)
    #dbg_value(i32 %i.0, !2714, !DIExpression(), !2712)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !2718
  br i1 %exitcond, label %for.inc, label %for.end, !dbg !2720

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i64 poison, i8 poison, i32 poison), !2713, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2712)
  %arrayidx = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2721
  %0 = load i8, ptr %arrayidx, align 1, !dbg !2721
    #dbg_value(!DIArgList(i64 %r.0, i8 %0, i32 %i.0), !2713, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2712)
  %conv = zext i8 %0 to i64, !dbg !2722
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i32 %i.0), !2713, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2712)
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2723
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i32 %mul), !2713, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2712)
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2724
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i64 %sh_prom), !2713, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2712)
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !2724
    #dbg_value(!DIArgList(i64 %r.0, i64 %shl), !2713, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value), !2712)
  %or = or i64 %r.0, %shl, !dbg !2725
    #dbg_value(i64 %or, !2713, !DIExpression(), !2712)
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2726
    #dbg_value(i32 %inc, !2714, !DIExpression(), !2712)
  br label %for.cond, !dbg !2727, !llvm.loop !2728

for.end:                                          ; preds = %for.cond
  %r.0.lcssa = phi i64 [ %r.0, %for.cond ], !dbg !2712
  ret i64 %r.0.lcssa, !dbg !2730
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #0 !dbg !2731 {
entry:
    #dbg_value(ptr %out, !2732, !DIExpression(), !2733)
    #dbg_value(i32 %nblocks, !2734, !DIExpression(), !2733)
    #dbg_value(ptr %state, !2735, !DIExpression(), !2733)
  call fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state, i32 noundef 168) #3, !dbg !2736
  ret void, !dbg !2737
}

; Function Attrs: nounwind
define internal fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %s, i32 noundef %r) unnamed_addr #0 !dbg !2738 {
entry:
    #dbg_value(ptr %out, !2741, !DIExpression(), !2742)
    #dbg_value(i32 %nblocks, !2743, !DIExpression(), !2742)
    #dbg_value(ptr %s, !2744, !DIExpression(), !2742)
    #dbg_value(i32 %r, !2745, !DIExpression(), !2742)
  %0 = lshr i32 %r, 3, !dbg !2746
  br label %while.cond, !dbg !2746

while.cond:                                       ; preds = %for.end, %entry
  %nblocks.addr.0 = phi i32 [ %nblocks, %entry ], [ %sub, %for.end ]
  %out.addr.0 = phi ptr [ %out, %entry ], [ %add.ptr1, %for.end ]
    #dbg_value(ptr %out.addr.0, !2741, !DIExpression(), !2742)
    #dbg_value(i32 %nblocks.addr.0, !2743, !DIExpression(), !2742)
  %tobool.not = icmp eq i32 %nblocks.addr.0, 0, !dbg !2746
  br i1 %tobool.not, label %while.end, label %while.body, !dbg !2746

while.body:                                       ; preds = %while.cond
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2747
    #dbg_value(i32 0, !2749, !DIExpression(), !2742)
  br label %for.cond, !dbg !2750

for.cond:                                         ; preds = %for.body, %while.body
  %i.0 = phi i32 [ 0, %while.body ], [ %inc, %for.body ], !dbg !2752
    #dbg_value(i32 %i.0, !2749, !DIExpression(), !2742)
  %exitcond = icmp ne i32 %i.0, %0, !dbg !2753
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2755

for.body:                                         ; preds = %for.cond
  %mul = shl nuw i32 %i.0, 3, !dbg !2756
  %add.ptr = getelementptr inbounds nuw i8, ptr %out.addr.0, i32 %mul, !dbg !2757
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !2758
  %1 = load i64, ptr %arrayidx, align 8, !dbg !2758
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %1) #3, !dbg !2759
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2760
    #dbg_value(i32 %inc, !2749, !DIExpression(), !2742)
  br label %for.cond, !dbg !2761, !llvm.loop !2762

for.end:                                          ; preds = %for.cond
  %add.ptr1 = getelementptr inbounds nuw i8, ptr %out.addr.0, i32 %r, !dbg !2764
    #dbg_value(ptr %add.ptr1, !2741, !DIExpression(), !2742)
  %sub = add i32 %nblocks.addr.0, -1, !dbg !2765
    #dbg_value(i32 %sub, !2743, !DIExpression(), !2742)
  br label %while.cond, !dbg !2746, !llvm.loop !2766

while.end:                                        ; preds = %while.cond
  ret void, !dbg !2768
}

; Function Attrs: nounwind
define internal fastcc void @store64(ptr noundef %x, i64 noundef %u) unnamed_addr #0 !dbg !2769 {
entry:
    #dbg_value(ptr %x, !2772, !DIExpression(), !2773)
    #dbg_value(i64 %u, !2774, !DIExpression(), !2773)
    #dbg_value(i32 0, !2775, !DIExpression(), !2773)
  br label %for.cond, !dbg !2776

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2778
    #dbg_value(i32 %i.0, !2775, !DIExpression(), !2773)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !2779
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2781

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2782
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2783
  %shr = lshr i64 %u, %sh_prom, !dbg !2783
  %conv = trunc i64 %shr to i8, !dbg !2784
  %arrayidx = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2785
  store i8 %conv, ptr %arrayidx, align 1, !dbg !2786
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2787
    #dbg_value(i32 %inc, !2775, !DIExpression(), !2773)
  br label %for.cond, !dbg !2788, !llvm.loop !2789

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2791
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef %state) local_unnamed_addr #0 !dbg !2792 {
entry:
    #dbg_value(ptr %state, !2793, !DIExpression(), !2794)
  call fastcc void @keccak_init(ptr noundef %state) #3, !dbg !2795
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2796
  store i32 0, ptr %pos, align 8, !dbg !2797
  ret void, !dbg !2798
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2799 {
entry:
    #dbg_value(ptr %state, !2800, !DIExpression(), !2801)
    #dbg_value(ptr %in, !2802, !DIExpression(), !2801)
    #dbg_value(i32 %inlen, !2803, !DIExpression(), !2801)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2804
  %0 = load i32, ptr %pos, align 8, !dbg !2804
  %call = call fastcc i32 @keccak_absorb(ptr noundef %state, i32 noundef %0, i32 noundef 136, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2805
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2806
  store i32 %call, ptr %pos1, align 8, !dbg !2807
  ret void, !dbg !2808
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef %state) local_unnamed_addr #0 !dbg !2809 {
entry:
    #dbg_value(ptr %state, !2810, !DIExpression(), !2811)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2812
  %0 = load i32, ptr %pos, align 8, !dbg !2812
  call fastcc void @keccak_finalize(ptr noundef %state, i32 noundef %0, i32 noundef 136, i8 noundef zeroext 31) #3, !dbg !2813
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2814
  store i32 136, ptr %pos1, align 8, !dbg !2815
  ret void, !dbg !2816
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) local_unnamed_addr #0 !dbg !2817 {
entry:
    #dbg_value(ptr %out, !2818, !DIExpression(), !2819)
    #dbg_value(i32 %outlen, !2820, !DIExpression(), !2819)
    #dbg_value(ptr %state, !2821, !DIExpression(), !2819)
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2822
  %0 = load i32, ptr %pos, align 8, !dbg !2822
  %call = call fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state, i32 noundef %0, i32 noundef 136) #3, !dbg !2823
  %pos1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2824
  store i32 %call, ptr %pos1, align 8, !dbg !2825
  ret void, !dbg !2826
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2827 {
entry:
    #dbg_value(ptr %state, !2828, !DIExpression(), !2829)
    #dbg_value(ptr %in, !2830, !DIExpression(), !2829)
    #dbg_value(i32 %inlen, !2831, !DIExpression(), !2829)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #3, !dbg !2832
  %pos = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2833
  store i32 136, ptr %pos, align 8, !dbg !2834
  ret void, !dbg !2835
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #0 !dbg !2836 {
entry:
    #dbg_value(ptr %out, !2837, !DIExpression(), !2838)
    #dbg_value(i32 %nblocks, !2839, !DIExpression(), !2838)
    #dbg_value(ptr %state, !2840, !DIExpression(), !2838)
  call fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state, i32 noundef 136) #3, !dbg !2841
  ret void, !dbg !2842
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2843 {
entry:
  %state = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !2846, !DIExpression(), !2847)
    #dbg_value(i32 %outlen, !2848, !DIExpression(), !2847)
    #dbg_value(ptr %in, !2849, !DIExpression(), !2847)
    #dbg_value(i32 %inlen, !2850, !DIExpression(), !2847)
    #dbg_declare(ptr %state, !2851, !DIExpression(), !2852)
  call void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef nonnull %state, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2853
  %div = udiv i32 %outlen, 168, !dbg !2854
    #dbg_value(i32 %div, !2855, !DIExpression(), !2847)
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %div, ptr noundef nonnull %state) #3, !dbg !2856
  %mul.neg = mul i32 %div, -168, !dbg !2857
  %sub = add i32 %mul.neg, %outlen, !dbg !2858
    #dbg_value(i32 %sub, !2848, !DIExpression(), !2847)
  %mul1 = mul nuw i32 %div, 168, !dbg !2859
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !2860
    #dbg_value(ptr %add.ptr, !2846, !DIExpression(), !2847)
  call void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef nonnull %state) #3, !dbg !2861
  ret void, !dbg !2862
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2863 {
entry:
  %state = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !2864, !DIExpression(), !2865)
    #dbg_value(i32 %outlen, !2866, !DIExpression(), !2865)
    #dbg_value(ptr %in, !2867, !DIExpression(), !2865)
    #dbg_value(i32 %inlen, !2868, !DIExpression(), !2865)
    #dbg_declare(ptr %state, !2869, !DIExpression(), !2870)
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef nonnull %state, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2871
  %div = udiv i32 %outlen, 136, !dbg !2872
    #dbg_value(i32 %div, !2873, !DIExpression(), !2865)
  call void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %div, ptr noundef nonnull %state) #3, !dbg !2874
  %mul.neg = mul i32 %div, -136, !dbg !2875
  %sub = add i32 %mul.neg, %outlen, !dbg !2876
    #dbg_value(i32 %sub, !2866, !DIExpression(), !2865)
  %mul1 = mul nuw i32 %div, 136, !dbg !2877
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !2878
    #dbg_value(ptr %add.ptr, !2864, !DIExpression(), !2865)
  call void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef nonnull %state) #3, !dbg !2879
  ret void, !dbg !2880
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2881 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !2884, !DIExpression(), !2885)
    #dbg_value(ptr %in, !2886, !DIExpression(), !2885)
    #dbg_value(i32 %inlen, !2887, !DIExpression(), !2885)
    #dbg_declare(ptr %s, !2888, !DIExpression(), !2889)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %s, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #3, !dbg !2890
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #3, !dbg !2891
    #dbg_value(i32 0, !2892, !DIExpression(), !2885)
  br label %for.cond, !dbg !2893

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2895
    #dbg_value(i32 %i.0, !2892, !DIExpression(), !2885)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !2896
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2898

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2899
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !2900
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !2901
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2901
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %0) #3, !dbg !2902
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2903
    #dbg_value(i32 %inc, !2892, !DIExpression(), !2885)
  br label %for.cond, !dbg !2904, !llvm.loop !2905

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2907
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2908 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !2909, !DIExpression(), !2910)
    #dbg_value(ptr %in, !2911, !DIExpression(), !2910)
    #dbg_value(i32 %inlen, !2912, !DIExpression(), !2910)
    #dbg_declare(ptr %s, !2913, !DIExpression(), !2914)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %s, i32 noundef 72, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #3, !dbg !2915
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #3, !dbg !2916
    #dbg_value(i32 0, !2917, !DIExpression(), !2910)
  br label %for.cond, !dbg !2918

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2920
    #dbg_value(i32 %i.0, !2917, !DIExpression(), !2910)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !2921
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2923

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2924
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !2925
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !2926
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2926
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %0) #3, !dbg !2927
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2928
    #dbg_value(i32 %inc, !2917, !DIExpression(), !2910)
  br label %for.cond, !dbg !2929, !llvm.loop !2930

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2932
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_kyber_shake128_absorb(ptr noundef %state, ptr noundef %seed, i8 noundef zeroext %x, i8 noundef zeroext %y) local_unnamed_addr #0 !dbg !2933 {
entry:
  %extseed = alloca [34 x i8], align 1
    #dbg_value(ptr %state, !2943, !DIExpression(), !2944)
    #dbg_value(ptr %seed, !2945, !DIExpression(), !2944)
    #dbg_value(i8 %x, !2946, !DIExpression(), !2944)
    #dbg_value(i8 %y, !2947, !DIExpression(), !2944)
    #dbg_declare(ptr %extseed, !2948, !DIExpression(), !2952)
  %call = call ptr @memcpy(ptr noundef nonnull %extseed, ptr noundef %seed, i32 noundef 32) #4, !dbg !2953
  %arrayidx = getelementptr inbounds nuw i8, ptr %extseed, i32 32, !dbg !2954
  store i8 %x, ptr %arrayidx, align 1, !dbg !2955
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %extseed, i32 33, !dbg !2956
  store i8 %y, ptr %arrayidx1, align 1, !dbg !2957
  call void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef nonnull %extseed, i32 noundef 34) #3, !dbg !2958
  ret void, !dbg !2959
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_kyber_shake256_prf(ptr noundef %out, i32 noundef %outlen, ptr noundef %key, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !2960 {
entry:
  %extkey = alloca [33 x i8], align 1
    #dbg_value(ptr %out, !2963, !DIExpression(), !2964)
    #dbg_value(i32 %outlen, !2965, !DIExpression(), !2964)
    #dbg_value(ptr %key, !2966, !DIExpression(), !2964)
    #dbg_value(i8 %nonce, !2967, !DIExpression(), !2964)
    #dbg_declare(ptr %extkey, !2968, !DIExpression(), !2972)
  %call = call ptr @memcpy(ptr noundef nonnull %extkey, ptr noundef %key, i32 noundef 32) #4, !dbg !2973
  %arrayidx = getelementptr inbounds nuw i8, ptr %extkey, i32 32, !dbg !2974
  store i8 %nonce, ptr %arrayidx, align 1, !dbg !2975
  call void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef nonnull %extkey, i32 noundef 33) #3, !dbg !2976
  ret void, !dbg !2977
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_kyber_shake256_rkprf(ptr noundef %out, ptr noundef %key, ptr noundef %input) local_unnamed_addr #0 !dbg !2978 {
entry:
  %s = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !2979, !DIExpression(), !2980)
    #dbg_value(ptr %key, !2981, !DIExpression(), !2980)
    #dbg_value(ptr %input, !2982, !DIExpression(), !2980)
    #dbg_declare(ptr %s, !2983, !DIExpression(), !2984)
  call void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef nonnull %s) #3, !dbg !2985
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef nonnull %s, ptr noundef %key, i32 noundef 32) #3, !dbg !2986
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef nonnull %s, ptr noundef %input, i32 noundef 1568) #3, !dbg !2987
  call void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef nonnull %s) #3, !dbg !2988
  call void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef 32, ptr noundef nonnull %s) #3, !dbg !2989
  ret void, !dbg !2990
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
!269 = !DIFile(filename: "../../ref/kem.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
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
!358 = !DIFile(filename: "../../ref/indcpa.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!359 = !DISubroutineType(types: !360)
!360 = !{null, !361, !272, !50}
!361 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !362, size: 32)
!362 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyvec", file: !363, line: 10, baseType: !364)
!363 = !DIFile(filename: "../../ref/polyvec.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!364 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !363, line: 8, size: 16384, elements: !365)
!365 = !{!366}
!366 = !DIDerivedType(tag: DW_TAG_member, name: "vec", scope: !364, file: !363, line: 9, baseType: !367, size: 16384)
!367 = !DICompositeType(tag: DW_TAG_array_type, baseType: !368, size: 16384, elements: !376)
!368 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !369, line: 13, baseType: !370)
!369 = !DIFile(filename: "../../ref/poly.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!370 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !369, line: 11, size: 4096, elements: !371)
!371 = !{!372}
!372 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !370, file: !369, line: 12, baseType: !373, size: 4096)
!373 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 4096, elements: !374)
!374 = !{!375}
!375 = !DISubrange(count: 256)
!376 = !{!377}
!377 = !DISubrange(count: 4)
!378 = !DILocalVariable(name: "a", arg: 1, scope: !357, file: !358, line: 165, type: !361)
!379 = !DILocation(line: 0, scope: !357)
!380 = !DILocalVariable(name: "seed", arg: 2, scope: !357, file: !358, line: 165, type: !272)
!381 = !DILocalVariable(name: "transposed", arg: 3, scope: !357, file: !358, line: 165, type: !50)
!382 = !DILocalVariable(name: "buf", scope: !357, file: !358, line: 169, type: !383)
!383 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 4032, elements: !384)
!384 = !{!385}
!385 = !DISubrange(count: 504)
!386 = !DILocation(line: 169, column: 11, scope: !357)
!387 = !DILocalVariable(name: "state", scope: !357, file: !358, line: 170, type: !388)
!388 = !DIDerivedType(tag: DW_TAG_typedef, name: "xof_state", file: !389, line: 10, baseType: !390)
!389 = !DIFile(filename: "../../ref/symmetric.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!390 = !DIDerivedType(tag: DW_TAG_typedef, name: "keccak_state", file: !391, line: 17, baseType: !392)
!391 = !DIFile(filename: "../../ref/fips202.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!392 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !391, line: 14, size: 1664, elements: !393)
!393 = !{!394, !398}
!394 = !DIDerivedType(tag: DW_TAG_member, name: "s", scope: !392, file: !391, line: 15, baseType: !395, size: 1600)
!395 = !DICompositeType(tag: DW_TAG_array_type, baseType: !70, size: 1600, elements: !396)
!396 = !{!397}
!397 = !DISubrange(count: 25)
!398 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !392, file: !391, line: 16, baseType: !40, size: 32, offset: 1600)
!399 = !DILocation(line: 170, column: 13, scope: !357)
!400 = !DILocalVariable(name: "i", scope: !357, file: !358, line: 167, type: !40)
!401 = !DILocation(line: 172, column: 7, scope: !402)
!402 = distinct !DILexicalBlock(scope: !357, file: !358, line: 172, column: 3)
!403 = !DILocation(line: 172, scope: !402)
!404 = !DILocation(line: 172, column: 12, scope: !405)
!405 = distinct !DILexicalBlock(scope: !402, file: !358, line: 172, column: 3)
!406 = !DILocation(line: 172, column: 3, scope: !402)
!407 = !DILocation(line: 173, column: 5, scope: !408)
!408 = distinct !DILexicalBlock(scope: !409, file: !358, line: 173, column: 5)
!409 = distinct !DILexicalBlock(scope: !405, file: !358, line: 172, column: 26)
!410 = !DILocation(line: 173, scope: !408)
!411 = !DILocalVariable(name: "j", scope: !357, file: !358, line: 167, type: !40)
!412 = !DILocation(line: 173, column: 14, scope: !413)
!413 = distinct !DILexicalBlock(scope: !408, file: !358, line: 173, column: 5)
!414 = !DILocation(line: 174, column: 10, scope: !415)
!415 = distinct !DILexicalBlock(scope: !416, file: !358, line: 174, column: 10)
!416 = distinct !DILexicalBlock(scope: !413, file: !358, line: 173, column: 28)
!417 = !DILocation(line: 175, column: 9, scope: !415)
!418 = !DILocation(line: 177, column: 9, scope: !415)
!419 = !DILocation(line: 179, column: 7, scope: !416)
!420 = !DILocalVariable(name: "buflen", scope: !357, file: !358, line: 168, type: !40)
!421 = !DILocation(line: 181, column: 25, scope: !416)
!422 = !DILocation(line: 181, column: 13, scope: !416)
!423 = !DILocalVariable(name: "ctr", scope: !357, file: !358, line: 167, type: !40)
!424 = !DILocation(line: 183, column: 7, scope: !416)
!425 = !DILocation(line: 0, scope: !416)
!426 = !DILocation(line: 183, column: 17, scope: !416)
!427 = !DILocation(line: 184, column: 9, scope: !428)
!428 = distinct !DILexicalBlock(scope: !416, file: !358, line: 183, column: 28)
!429 = !DILocation(line: 186, column: 28, scope: !428)
!430 = !DILocation(line: 186, column: 47, scope: !428)
!431 = !DILocation(line: 186, column: 62, scope: !428)
!432 = !DILocation(line: 186, column: 16, scope: !428)
!433 = !DILocation(line: 186, column: 13, scope: !428)
!434 = distinct !{!434, !424, !435, !130}
!435 = !DILocation(line: 187, column: 7, scope: !416)
!436 = !DILocation(line: 173, column: 24, scope: !413)
!437 = !DILocation(line: 173, column: 5, scope: !413)
!438 = distinct !{!438, !407, !439, !130}
!439 = !DILocation(line: 188, column: 5, scope: !408)
!440 = !DILocation(line: 172, column: 22, scope: !405)
!441 = !DILocation(line: 172, column: 3, scope: !405)
!442 = distinct !{!442, !406, !443, !130}
!443 = !DILocation(line: 189, column: 3, scope: !402)
!444 = !DILocation(line: 190, column: 1, scope: !357)
!445 = distinct !DISubprogram(name: "rej_uniform", scope: !358, file: !358, line: 121, type: !446, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!446 = !DISubroutineType(types: !447)
!447 = !{!40, !448, !40, !272, !40}
!448 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 32)
!449 = !DILocalVariable(name: "r", arg: 1, scope: !445, file: !358, line: 121, type: !448)
!450 = !DILocation(line: 0, scope: !445)
!451 = !DILocalVariable(name: "len", arg: 2, scope: !445, file: !358, line: 122, type: !40)
!452 = !DILocalVariable(name: "buf", arg: 3, scope: !445, file: !358, line: 123, type: !272)
!453 = !DILocalVariable(name: "buflen", arg: 4, scope: !445, file: !358, line: 124, type: !40)
!454 = !DILocalVariable(name: "pos", scope: !445, file: !358, line: 126, type: !40)
!455 = !DILocalVariable(name: "ctr", scope: !445, file: !358, line: 126, type: !40)
!456 = !DILocation(line: 130, column: 3, scope: !445)
!457 = !DILocation(line: 130, column: 13, scope: !445)
!458 = !DILocation(line: 130, column: 19, scope: !445)
!459 = !DILocation(line: 131, column: 14, scope: !460)
!460 = distinct !DILexicalBlock(scope: !445, file: !358, line: 130, column: 41)
!461 = !DILocation(line: 131, column: 44, scope: !460)
!462 = !DILocation(line: 131, column: 34, scope: !460)
!463 = !DILocation(line: 131, column: 55, scope: !460)
!464 = !DILocation(line: 131, column: 62, scope: !460)
!465 = !DILocalVariable(name: "val0", scope: !445, file: !358, line: 127, type: !86)
!466 = !DILocation(line: 132, column: 14, scope: !460)
!467 = !DILocation(line: 132, column: 25, scope: !460)
!468 = !DILocation(line: 132, column: 44, scope: !460)
!469 = !DILocation(line: 132, column: 34, scope: !460)
!470 = !DILocation(line: 132, column: 55, scope: !460)
!471 = !DILocation(line: 132, column: 31, scope: !460)
!472 = !DILocalVariable(name: "val1", scope: !445, file: !358, line: 127, type: !86)
!473 = !DILocation(line: 133, column: 9, scope: !460)
!474 = !DILocation(line: 135, column: 13, scope: !475)
!475 = distinct !DILexicalBlock(scope: !460, file: !358, line: 135, column: 8)
!476 = !DILocation(line: 136, column: 12, scope: !475)
!477 = !DILocation(line: 136, column: 7, scope: !475)
!478 = !DILocation(line: 136, column: 16, scope: !475)
!479 = !DILocation(line: 137, column: 12, scope: !480)
!480 = distinct !DILexicalBlock(scope: !460, file: !358, line: 137, column: 8)
!481 = !DILocation(line: 137, column: 18, scope: !480)
!482 = !DILocation(line: 138, column: 12, scope: !480)
!483 = !DILocation(line: 138, column: 7, scope: !480)
!484 = !DILocation(line: 138, column: 16, scope: !480)
!485 = !DILocation(line: 0, scope: !460)
!486 = distinct !{!486, !456, !487, !130}
!487 = !DILocation(line: 139, column: 3, scope: !445)
!488 = !DILocation(line: 141, column: 3, scope: !445)
!489 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_indcpa_keypair_derand", scope: !358, file: !358, line: 205, type: !490, scopeLine: 208, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !49)
!490 = !DISubroutineType(types: !491)
!491 = !{null, !32, !32, !272}
!492 = !DILocalVariable(name: "pk", arg: 1, scope: !489, file: !358, line: 205, type: !32)
!493 = !DILocation(line: 0, scope: !489)
!494 = !DILocalVariable(name: "sk", arg: 2, scope: !489, file: !358, line: 206, type: !32)
!495 = !DILocalVariable(name: "coins", arg: 3, scope: !489, file: !358, line: 207, type: !272)
!496 = !DILocalVariable(name: "buf", scope: !489, file: !358, line: 210, type: !293)
!497 = !DILocation(line: 210, column: 11, scope: !489)
!498 = !DILocalVariable(name: "publicseed", scope: !489, file: !358, line: 211, type: !272)
!499 = !DILocation(line: 212, column: 33, scope: !489)
!500 = !DILocalVariable(name: "noiseseed", scope: !489, file: !358, line: 212, type: !272)
!501 = !DILocalVariable(name: "nonce", scope: !489, file: !358, line: 213, type: !33)
!502 = !DILocalVariable(name: "a", scope: !489, file: !358, line: 214, type: !503)
!503 = !DICompositeType(tag: DW_TAG_array_type, baseType: !362, size: 65536, elements: !376)
!504 = !DILocation(line: 214, column: 11, scope: !489)
!505 = !DILocalVariable(name: "e", scope: !489, file: !358, line: 214, type: !362)
!506 = !DILocation(line: 214, column: 23, scope: !489)
!507 = !DILocalVariable(name: "pkpv", scope: !489, file: !358, line: 214, type: !362)
!508 = !DILocation(line: 214, column: 26, scope: !489)
!509 = !DILocalVariable(name: "skpv", scope: !489, file: !358, line: 214, type: !362)
!510 = !DILocation(line: 214, column: 32, scope: !489)
!511 = !DILocation(line: 216, column: 3, scope: !489)
!512 = !DILocation(line: 217, column: 3, scope: !489)
!513 = !DILocation(line: 217, column: 23, scope: !489)
!514 = !DILocation(line: 218, column: 3, scope: !489)
!515 = !DILocation(line: 220, column: 3, scope: !489)
!516 = !DILocalVariable(name: "i", scope: !489, file: !358, line: 209, type: !40)
!517 = !DILocation(line: 222, column: 7, scope: !518)
!518 = distinct !DILexicalBlock(scope: !489, file: !358, line: 222, column: 3)
!519 = !DILocation(line: 222, scope: !518)
!520 = !DILocation(line: 222, column: 12, scope: !521)
!521 = distinct !DILexicalBlock(scope: !518, file: !358, line: 222, column: 3)
!522 = !DILocation(line: 222, column: 3, scope: !518)
!523 = !DILocation(line: 224, column: 3, scope: !524)
!524 = distinct !DILexicalBlock(scope: !489, file: !358, line: 224, column: 3)
!525 = !DILocation(line: 223, column: 25, scope: !521)
!526 = !DILocation(line: 223, column: 5, scope: !521)
!527 = !DILocation(line: 223, column: 54, scope: !521)
!528 = !DILocation(line: 222, column: 22, scope: !521)
!529 = !DILocation(line: 222, column: 3, scope: !521)
!530 = distinct !{!530, !522, !531, !130}
!531 = !DILocation(line: 223, column: 56, scope: !518)
!532 = !DILocation(line: 224, scope: !524)
!533 = !DILocation(line: 224, column: 12, scope: !534)
!534 = distinct !DILexicalBlock(scope: !524, file: !358, line: 224, column: 3)
!535 = !DILocation(line: 225, column: 25, scope: !534)
!536 = !DILocation(line: 225, column: 5, scope: !534)
!537 = !DILocation(line: 225, column: 51, scope: !534)
!538 = !DILocation(line: 224, column: 22, scope: !534)
!539 = !DILocation(line: 224, column: 3, scope: !534)
!540 = distinct !{!540, !523, !541, !130}
!541 = !DILocation(line: 225, column: 53, scope: !524)
!542 = !DILocation(line: 227, column: 3, scope: !489)
!543 = !DILocation(line: 228, column: 3, scope: !489)
!544 = !DILocation(line: 231, column: 7, scope: !545)
!545 = distinct !DILexicalBlock(scope: !489, file: !358, line: 231, column: 3)
!546 = !DILocation(line: 231, scope: !545)
!547 = !DILocation(line: 231, column: 12, scope: !548)
!548 = distinct !DILexicalBlock(scope: !545, file: !358, line: 231, column: 3)
!549 = !DILocation(line: 231, column: 3, scope: !545)
!550 = !DILocation(line: 232, column: 37, scope: !551)
!551 = distinct !DILexicalBlock(scope: !548, file: !358, line: 231, column: 26)
!552 = !DILocation(line: 232, column: 51, scope: !551)
!553 = !DILocation(line: 232, column: 5, scope: !551)
!554 = !DILocation(line: 233, column: 18, scope: !551)
!555 = !DILocation(line: 233, column: 5, scope: !551)
!556 = !DILocation(line: 231, column: 22, scope: !548)
!557 = !DILocation(line: 231, column: 3, scope: !548)
!558 = distinct !{!558, !549, !559, !130}
!559 = !DILocation(line: 234, column: 3, scope: !545)
!560 = !DILocation(line: 236, column: 3, scope: !489)
!561 = !DILocation(line: 237, column: 3, scope: !489)
!562 = !DILocation(line: 239, column: 3, scope: !489)
!563 = !DILocation(line: 240, column: 3, scope: !489)
!564 = !DILocation(line: 241, column: 1, scope: !489)
!565 = distinct !DISubprogram(name: "pack_sk", scope: !358, file: !358, line: 57, type: !566, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!566 = !DISubroutineType(types: !567)
!567 = !{null, !32, !361}
!568 = !DILocalVariable(name: "r", arg: 1, scope: !565, file: !358, line: 57, type: !32)
!569 = !DILocation(line: 0, scope: !565)
!570 = !DILocalVariable(name: "sk", arg: 2, scope: !565, file: !358, line: 57, type: !361)
!571 = !DILocation(line: 59, column: 3, scope: !565)
!572 = !DILocation(line: 60, column: 1, scope: !565)
!573 = distinct !DISubprogram(name: "pack_pk", scope: !358, file: !358, line: 23, type: !574, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!574 = !DISubroutineType(types: !575)
!575 = !{null, !32, !361, !272}
!576 = !DILocalVariable(name: "r", arg: 1, scope: !573, file: !358, line: 23, type: !32)
!577 = !DILocation(line: 0, scope: !573)
!578 = !DILocalVariable(name: "pk", arg: 2, scope: !573, file: !358, line: 24, type: !361)
!579 = !DILocalVariable(name: "seed", arg: 3, scope: !573, file: !358, line: 25, type: !272)
!580 = !DILocation(line: 27, column: 3, scope: !573)
!581 = !DILocation(line: 28, column: 11, scope: !573)
!582 = !DILocation(line: 28, column: 3, scope: !573)
!583 = !DILocation(line: 29, column: 1, scope: !573)
!584 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_indcpa_enc", scope: !358, file: !358, line: 260, type: !585, scopeLine: 264, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !49)
!585 = !DISubroutineType(types: !586)
!586 = !{null, !32, !272, !272, !272}
!587 = !DILocalVariable(name: "c", arg: 1, scope: !584, file: !358, line: 260, type: !32)
!588 = !DILocation(line: 0, scope: !584)
!589 = !DILocalVariable(name: "m", arg: 2, scope: !584, file: !358, line: 261, type: !272)
!590 = !DILocalVariable(name: "pk", arg: 3, scope: !584, file: !358, line: 262, type: !272)
!591 = !DILocalVariable(name: "coins", arg: 4, scope: !584, file: !358, line: 263, type: !272)
!592 = !DILocalVariable(name: "seed", scope: !584, file: !358, line: 266, type: !150)
!593 = !DILocation(line: 266, column: 11, scope: !584)
!594 = !DILocalVariable(name: "nonce", scope: !584, file: !358, line: 267, type: !33)
!595 = !DILocalVariable(name: "sp", scope: !584, file: !358, line: 268, type: !362)
!596 = !DILocation(line: 268, column: 11, scope: !584)
!597 = !DILocalVariable(name: "pkpv", scope: !584, file: !358, line: 268, type: !362)
!598 = !DILocation(line: 268, column: 15, scope: !584)
!599 = !DILocalVariable(name: "ep", scope: !584, file: !358, line: 268, type: !362)
!600 = !DILocation(line: 268, column: 21, scope: !584)
!601 = !DILocalVariable(name: "at", scope: !584, file: !358, line: 268, type: !503)
!602 = !DILocation(line: 268, column: 25, scope: !584)
!603 = !DILocalVariable(name: "b", scope: !584, file: !358, line: 268, type: !362)
!604 = !DILocation(line: 268, column: 38, scope: !584)
!605 = !DILocalVariable(name: "v", scope: !584, file: !358, line: 269, type: !368)
!606 = !DILocation(line: 269, column: 8, scope: !584)
!607 = !DILocalVariable(name: "k", scope: !584, file: !358, line: 269, type: !368)
!608 = !DILocation(line: 269, column: 11, scope: !584)
!609 = !DILocalVariable(name: "epp", scope: !584, file: !358, line: 269, type: !368)
!610 = !DILocation(line: 269, column: 14, scope: !584)
!611 = !DILocation(line: 271, column: 3, scope: !584)
!612 = !DILocation(line: 272, column: 3, scope: !584)
!613 = !DILocation(line: 273, column: 3, scope: !584)
!614 = !DILocalVariable(name: "i", scope: !584, file: !358, line: 265, type: !40)
!615 = !DILocation(line: 275, column: 7, scope: !616)
!616 = distinct !DILexicalBlock(scope: !584, file: !358, line: 275, column: 3)
!617 = !DILocation(line: 275, scope: !616)
!618 = !DILocation(line: 275, column: 12, scope: !619)
!619 = distinct !DILexicalBlock(scope: !616, file: !358, line: 275, column: 3)
!620 = !DILocation(line: 275, column: 3, scope: !616)
!621 = !DILocation(line: 277, column: 3, scope: !622)
!622 = distinct !DILexicalBlock(scope: !584, file: !358, line: 277, column: 3)
!623 = !DILocation(line: 276, column: 30, scope: !619)
!624 = !DILocation(line: 276, column: 5, scope: !619)
!625 = !DILocation(line: 276, column: 46, scope: !619)
!626 = !DILocation(line: 275, column: 22, scope: !619)
!627 = !DILocation(line: 275, column: 3, scope: !619)
!628 = distinct !{!628, !620, !629, !130}
!629 = !DILocation(line: 276, column: 48, scope: !616)
!630 = !DILocation(line: 277, scope: !622)
!631 = !DILocation(line: 277, column: 12, scope: !632)
!632 = distinct !DILexicalBlock(scope: !622, file: !358, line: 277, column: 3)
!633 = !DILocation(line: 278, column: 30, scope: !632)
!634 = !DILocation(line: 278, column: 5, scope: !632)
!635 = !DILocation(line: 278, column: 46, scope: !632)
!636 = !DILocation(line: 277, column: 22, scope: !632)
!637 = !DILocation(line: 277, column: 3, scope: !632)
!638 = distinct !{!638, !621, !639, !130}
!639 = !DILocation(line: 278, column: 48, scope: !622)
!640 = !DILocation(line: 279, column: 3, scope: !584)
!641 = !DILocation(line: 281, column: 3, scope: !584)
!642 = !DILocation(line: 284, column: 7, scope: !643)
!643 = distinct !DILexicalBlock(scope: !584, file: !358, line: 284, column: 3)
!644 = !DILocation(line: 284, scope: !643)
!645 = !DILocation(line: 284, column: 12, scope: !646)
!646 = distinct !DILexicalBlock(scope: !643, file: !358, line: 284, column: 3)
!647 = !DILocation(line: 284, column: 3, scope: !643)
!648 = !DILocation(line: 285, column: 37, scope: !646)
!649 = !DILocation(line: 285, column: 48, scope: !646)
!650 = !DILocation(line: 285, column: 5, scope: !646)
!651 = !DILocation(line: 284, column: 22, scope: !646)
!652 = !DILocation(line: 284, column: 3, scope: !646)
!653 = distinct !{!653, !647, !654, !130}
!654 = !DILocation(line: 285, column: 58, scope: !643)
!655 = !DILocation(line: 287, column: 3, scope: !584)
!656 = !DILocation(line: 289, column: 3, scope: !584)
!657 = !DILocation(line: 290, column: 3, scope: !584)
!658 = !DILocation(line: 292, column: 3, scope: !584)
!659 = !DILocation(line: 293, column: 3, scope: !584)
!660 = !DILocation(line: 294, column: 3, scope: !584)
!661 = !DILocation(line: 295, column: 3, scope: !584)
!662 = !DILocation(line: 296, column: 3, scope: !584)
!663 = !DILocation(line: 298, column: 3, scope: !584)
!664 = !DILocation(line: 299, column: 1, scope: !584)
!665 = distinct !DISubprogram(name: "unpack_pk", scope: !358, file: !358, line: 41, type: !666, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!666 = !DISubroutineType(types: !667)
!667 = !{null, !361, !32, !272}
!668 = !DILocalVariable(name: "pk", arg: 1, scope: !665, file: !358, line: 41, type: !361)
!669 = !DILocation(line: 0, scope: !665)
!670 = !DILocalVariable(name: "seed", arg: 2, scope: !665, file: !358, line: 42, type: !32)
!671 = !DILocalVariable(name: "packedpk", arg: 3, scope: !665, file: !358, line: 43, type: !272)
!672 = !DILocation(line: 45, column: 3, scope: !665)
!673 = !DILocation(line: 46, column: 24, scope: !665)
!674 = !DILocation(line: 46, column: 3, scope: !665)
!675 = !DILocation(line: 47, column: 1, scope: !665)
!676 = distinct !DISubprogram(name: "pack_ciphertext", scope: !358, file: !358, line: 86, type: !677, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!677 = !DISubroutineType(types: !678)
!678 = !{null, !32, !361, !679}
!679 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !368, size: 32)
!680 = !DILocalVariable(name: "r", arg: 1, scope: !676, file: !358, line: 86, type: !32)
!681 = !DILocation(line: 0, scope: !676)
!682 = !DILocalVariable(name: "b", arg: 2, scope: !676, file: !358, line: 86, type: !361)
!683 = !DILocalVariable(name: "v", arg: 3, scope: !676, file: !358, line: 86, type: !679)
!684 = !DILocation(line: 88, column: 3, scope: !676)
!685 = !DILocation(line: 89, column: 18, scope: !676)
!686 = !DILocation(line: 89, column: 3, scope: !676)
!687 = !DILocation(line: 90, column: 1, scope: !676)
!688 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_indcpa_dec", scope: !358, file: !358, line: 314, type: !689, scopeLine: 317, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !49)
!689 = !DISubroutineType(types: !690)
!690 = !{null, !32, !272, !272}
!691 = !DILocalVariable(name: "m", arg: 1, scope: !688, file: !358, line: 314, type: !32)
!692 = !DILocation(line: 0, scope: !688)
!693 = !DILocalVariable(name: "c", arg: 2, scope: !688, file: !358, line: 315, type: !272)
!694 = !DILocalVariable(name: "sk", arg: 3, scope: !688, file: !358, line: 316, type: !272)
!695 = !DILocalVariable(name: "b", scope: !688, file: !358, line: 318, type: !362)
!696 = !DILocation(line: 318, column: 11, scope: !688)
!697 = !DILocalVariable(name: "skpv", scope: !688, file: !358, line: 318, type: !362)
!698 = !DILocation(line: 318, column: 14, scope: !688)
!699 = !DILocalVariable(name: "v", scope: !688, file: !358, line: 319, type: !368)
!700 = !DILocation(line: 319, column: 8, scope: !688)
!701 = !DILocalVariable(name: "mp", scope: !688, file: !358, line: 319, type: !368)
!702 = !DILocation(line: 319, column: 11, scope: !688)
!703 = !DILocation(line: 321, column: 3, scope: !688)
!704 = !DILocation(line: 322, column: 3, scope: !688)
!705 = !DILocation(line: 324, column: 3, scope: !688)
!706 = !DILocation(line: 325, column: 3, scope: !688)
!707 = !DILocation(line: 326, column: 3, scope: !688)
!708 = !DILocation(line: 328, column: 3, scope: !688)
!709 = !DILocation(line: 329, column: 3, scope: !688)
!710 = !DILocation(line: 331, column: 3, scope: !688)
!711 = !DILocation(line: 332, column: 1, scope: !688)
!712 = distinct !DISubprogram(name: "unpack_ciphertext", scope: !358, file: !358, line: 102, type: !713, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!713 = !DISubroutineType(types: !714)
!714 = !{null, !361, !679, !272}
!715 = !DILocalVariable(name: "b", arg: 1, scope: !712, file: !358, line: 102, type: !361)
!716 = !DILocation(line: 0, scope: !712)
!717 = !DILocalVariable(name: "v", arg: 2, scope: !712, file: !358, line: 102, type: !679)
!718 = !DILocalVariable(name: "c", arg: 3, scope: !712, file: !358, line: 102, type: !272)
!719 = !DILocation(line: 104, column: 3, scope: !712)
!720 = !DILocation(line: 105, column: 23, scope: !712)
!721 = !DILocation(line: 105, column: 3, scope: !712)
!722 = !DILocation(line: 106, column: 1, scope: !712)
!723 = distinct !DISubprogram(name: "unpack_sk", scope: !358, file: !358, line: 70, type: !724, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!724 = !DISubroutineType(types: !725)
!725 = !{null, !361, !272}
!726 = !DILocalVariable(name: "sk", arg: 1, scope: !723, file: !358, line: 70, type: !361)
!727 = !DILocation(line: 0, scope: !723)
!728 = !DILocalVariable(name: "packedsk", arg: 2, scope: !723, file: !358, line: 70, type: !272)
!729 = !DILocation(line: 72, column: 3, scope: !723)
!730 = !DILocation(line: 73, column: 1, scope: !723)
!731 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_compress", scope: !732, file: !732, line: 15, type: !733, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!732 = !DIFile(filename: "../../ref/polyvec.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!733 = !DISubroutineType(types: !734)
!734 = !{null, !32, !735}
!735 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !736, size: 32)
!736 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !737)
!737 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyvec", file: !363, line: 10, baseType: !738)
!738 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !363, line: 8, size: 16384, elements: !739)
!739 = !{!740}
!740 = !DIDerivedType(tag: DW_TAG_member, name: "vec", scope: !738, file: !363, line: 9, baseType: !741, size: 16384)
!741 = !DICompositeType(tag: DW_TAG_array_type, baseType: !742, size: 16384, elements: !376)
!742 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !369, line: 13, baseType: !743)
!743 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !369, line: 11, size: 4096, elements: !744)
!744 = !{!745}
!745 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !743, file: !369, line: 12, baseType: !373, size: 4096)
!746 = !DILocalVariable(name: "r", arg: 1, scope: !731, file: !732, line: 15, type: !32)
!747 = !DILocation(line: 0, scope: !731)
!748 = !DILocalVariable(name: "a", arg: 2, scope: !731, file: !732, line: 15, type: !735)
!749 = !DILocalVariable(name: "t", scope: !731, file: !732, line: 21, type: !750)
!750 = !DICompositeType(tag: DW_TAG_array_type, baseType: !86, size: 128, elements: !751)
!751 = !{!752}
!752 = !DISubrange(count: 8)
!753 = !DILocation(line: 21, column: 12, scope: !731)
!754 = !DILocalVariable(name: "i", scope: !731, file: !732, line: 17, type: !40)
!755 = !DILocation(line: 22, column: 7, scope: !756)
!756 = distinct !DILexicalBlock(scope: !731, file: !732, line: 22, column: 3)
!757 = !DILocation(line: 22, scope: !756)
!758 = !DILocation(line: 22, column: 12, scope: !759)
!759 = distinct !DILexicalBlock(scope: !756, file: !732, line: 22, column: 3)
!760 = !DILocation(line: 22, column: 3, scope: !756)
!761 = !DILocation(line: 23, column: 5, scope: !762)
!762 = distinct !DILexicalBlock(scope: !763, file: !732, line: 23, column: 5)
!763 = distinct !DILexicalBlock(scope: !759, file: !732, line: 22, column: 26)
!764 = !DILocation(line: 23, scope: !762)
!765 = !DILocalVariable(name: "j", scope: !731, file: !732, line: 17, type: !40)
!766 = !DILocation(line: 23, column: 14, scope: !767)
!767 = distinct !DILexicalBlock(scope: !762, file: !732, line: 23, column: 5)
!768 = !DILocation(line: 24, column: 7, scope: !769)
!769 = distinct !DILexicalBlock(scope: !770, file: !732, line: 24, column: 7)
!770 = distinct !DILexicalBlock(scope: !767, file: !732, line: 23, column: 30)
!771 = !DILocation(line: 24, scope: !769)
!772 = !DILocalVariable(name: "k", scope: !731, file: !732, line: 17, type: !40)
!773 = !DILocation(line: 24, column: 16, scope: !774)
!774 = distinct !DILexicalBlock(scope: !769, file: !732, line: 24, column: 7)
!775 = !DILocation(line: 25, column: 17, scope: !776)
!776 = distinct !DILexicalBlock(scope: !774, file: !732, line: 24, column: 24)
!777 = !DILocation(line: 25, column: 35, scope: !776)
!778 = !DILocation(line: 25, column: 37, scope: !776)
!779 = !DILocation(line: 26, column: 39, scope: !776)
!780 = !DILocation(line: 26, column: 9, scope: !776)
!781 = !DILocation(line: 26, column: 14, scope: !776)
!782 = !DILocation(line: 28, column: 14, scope: !776)
!783 = !DILocalVariable(name: "d0", scope: !731, file: !732, line: 18, type: !70)
!784 = !DILocation(line: 31, column: 12, scope: !776)
!785 = !DILocation(line: 32, column: 12, scope: !776)
!786 = !DILocation(line: 33, column: 16, scope: !776)
!787 = !DILocation(line: 33, column: 9, scope: !776)
!788 = !DILocation(line: 33, column: 14, scope: !776)
!789 = !DILocation(line: 24, column: 20, scope: !774)
!790 = !DILocation(line: 24, column: 7, scope: !774)
!791 = distinct !{!791, !768, !792, !130}
!792 = !DILocation(line: 34, column: 7, scope: !769)
!793 = !DILocation(line: 36, column: 16, scope: !770)
!794 = !DILocation(line: 36, column: 15, scope: !770)
!795 = !DILocation(line: 36, column: 13, scope: !770)
!796 = !DILocation(line: 37, column: 16, scope: !770)
!797 = !DILocation(line: 37, column: 21, scope: !770)
!798 = !DILocation(line: 37, column: 31, scope: !770)
!799 = !DILocation(line: 37, column: 36, scope: !770)
!800 = !DILocation(line: 37, column: 28, scope: !770)
!801 = !DILocation(line: 37, column: 7, scope: !770)
!802 = !DILocation(line: 37, column: 13, scope: !770)
!803 = !DILocation(line: 38, column: 16, scope: !770)
!804 = !DILocation(line: 38, column: 21, scope: !770)
!805 = !DILocation(line: 38, column: 31, scope: !770)
!806 = !DILocation(line: 38, column: 36, scope: !770)
!807 = !DILocation(line: 38, column: 28, scope: !770)
!808 = !DILocation(line: 38, column: 7, scope: !770)
!809 = !DILocation(line: 38, column: 13, scope: !770)
!810 = !DILocation(line: 39, column: 16, scope: !770)
!811 = !DILocation(line: 39, column: 21, scope: !770)
!812 = !DILocation(line: 39, column: 15, scope: !770)
!813 = !DILocation(line: 39, column: 7, scope: !770)
!814 = !DILocation(line: 39, column: 13, scope: !770)
!815 = !DILocation(line: 40, column: 16, scope: !770)
!816 = !DILocation(line: 40, column: 21, scope: !770)
!817 = !DILocation(line: 40, column: 31, scope: !770)
!818 = !DILocation(line: 40, column: 36, scope: !770)
!819 = !DILocation(line: 40, column: 28, scope: !770)
!820 = !DILocation(line: 40, column: 7, scope: !770)
!821 = !DILocation(line: 40, column: 13, scope: !770)
!822 = !DILocation(line: 41, column: 16, scope: !770)
!823 = !DILocation(line: 41, column: 21, scope: !770)
!824 = !DILocation(line: 41, column: 31, scope: !770)
!825 = !DILocation(line: 41, column: 36, scope: !770)
!826 = !DILocation(line: 41, column: 28, scope: !770)
!827 = !DILocation(line: 41, column: 7, scope: !770)
!828 = !DILocation(line: 41, column: 13, scope: !770)
!829 = !DILocation(line: 42, column: 16, scope: !770)
!830 = !DILocation(line: 42, column: 21, scope: !770)
!831 = !DILocation(line: 42, column: 31, scope: !770)
!832 = !DILocation(line: 42, column: 36, scope: !770)
!833 = !DILocation(line: 42, column: 28, scope: !770)
!834 = !DILocation(line: 42, column: 7, scope: !770)
!835 = !DILocation(line: 42, column: 13, scope: !770)
!836 = !DILocation(line: 43, column: 16, scope: !770)
!837 = !DILocation(line: 43, column: 21, scope: !770)
!838 = !DILocation(line: 43, column: 15, scope: !770)
!839 = !DILocation(line: 43, column: 7, scope: !770)
!840 = !DILocation(line: 43, column: 13, scope: !770)
!841 = !DILocation(line: 44, column: 16, scope: !770)
!842 = !DILocation(line: 44, column: 21, scope: !770)
!843 = !DILocation(line: 44, column: 31, scope: !770)
!844 = !DILocation(line: 44, column: 36, scope: !770)
!845 = !DILocation(line: 44, column: 28, scope: !770)
!846 = !DILocation(line: 44, column: 7, scope: !770)
!847 = !DILocation(line: 44, column: 13, scope: !770)
!848 = !DILocation(line: 45, column: 16, scope: !770)
!849 = !DILocation(line: 45, column: 21, scope: !770)
!850 = !DILocation(line: 45, column: 31, scope: !770)
!851 = !DILocation(line: 45, column: 36, scope: !770)
!852 = !DILocation(line: 45, column: 28, scope: !770)
!853 = !DILocation(line: 45, column: 7, scope: !770)
!854 = !DILocation(line: 45, column: 13, scope: !770)
!855 = !DILocation(line: 46, column: 16, scope: !770)
!856 = !DILocation(line: 46, column: 21, scope: !770)
!857 = !DILocation(line: 46, column: 15, scope: !770)
!858 = !DILocation(line: 46, column: 7, scope: !770)
!859 = !DILocation(line: 46, column: 13, scope: !770)
!860 = !DILocation(line: 47, column: 9, scope: !770)
!861 = !DILocation(line: 23, column: 26, scope: !767)
!862 = !DILocation(line: 23, column: 5, scope: !767)
!863 = distinct !{!863, !761, !864, !130}
!864 = !DILocation(line: 48, column: 5, scope: !762)
!865 = !DILocation(line: 22, column: 22, scope: !759)
!866 = !DILocation(line: 22, column: 3, scope: !759)
!867 = distinct !{!867, !760, !868, !130}
!868 = !DILocation(line: 49, column: 3, scope: !756)
!869 = !DILocation(line: 77, column: 1, scope: !731)
!870 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_decompress", scope: !732, file: !732, line: 89, type: !871, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!871 = !DISubroutineType(types: !872)
!872 = !{null, !873, !272}
!873 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !737, size: 32)
!874 = !DILocalVariable(name: "r", arg: 1, scope: !870, file: !732, line: 89, type: !873)
!875 = !DILocation(line: 0, scope: !870)
!876 = !DILocalVariable(name: "a", arg: 2, scope: !870, file: !732, line: 89, type: !272)
!877 = !DILocalVariable(name: "t", scope: !870, file: !732, line: 94, type: !750)
!878 = !DILocation(line: 94, column: 12, scope: !870)
!879 = !DILocalVariable(name: "i", scope: !870, file: !732, line: 91, type: !40)
!880 = !DILocation(line: 95, column: 7, scope: !881)
!881 = distinct !DILexicalBlock(scope: !870, file: !732, line: 95, column: 3)
!882 = !DILocation(line: 95, scope: !881)
!883 = !DILocation(line: 95, column: 12, scope: !884)
!884 = distinct !DILexicalBlock(scope: !881, file: !732, line: 95, column: 3)
!885 = !DILocation(line: 95, column: 3, scope: !881)
!886 = !DILocation(line: 96, column: 5, scope: !887)
!887 = distinct !DILexicalBlock(scope: !888, file: !732, line: 96, column: 5)
!888 = distinct !DILexicalBlock(scope: !884, file: !732, line: 95, column: 26)
!889 = !DILocation(line: 96, scope: !887)
!890 = !DILocalVariable(name: "j", scope: !870, file: !732, line: 91, type: !40)
!891 = !DILocation(line: 96, column: 14, scope: !892)
!892 = distinct !DILexicalBlock(scope: !887, file: !732, line: 96, column: 5)
!893 = !DILocation(line: 97, column: 15, scope: !894)
!894 = distinct !DILexicalBlock(scope: !892, file: !732, line: 96, column: 30)
!895 = !DILocation(line: 97, column: 39, scope: !894)
!896 = !DILocation(line: 97, column: 29, scope: !894)
!897 = !DILocation(line: 97, column: 45, scope: !894)
!898 = !DILocation(line: 97, column: 26, scope: !894)
!899 = !DILocation(line: 97, column: 12, scope: !894)
!900 = !DILocation(line: 98, column: 15, scope: !894)
!901 = !DILocation(line: 98, column: 20, scope: !894)
!902 = !DILocation(line: 98, column: 39, scope: !894)
!903 = !DILocation(line: 98, column: 29, scope: !894)
!904 = !DILocation(line: 98, column: 45, scope: !894)
!905 = !DILocation(line: 98, column: 26, scope: !894)
!906 = !DILocation(line: 98, column: 7, scope: !894)
!907 = !DILocation(line: 98, column: 12, scope: !894)
!908 = !DILocation(line: 99, column: 15, scope: !894)
!909 = !DILocation(line: 99, column: 20, scope: !894)
!910 = !DILocation(line: 99, column: 39, scope: !894)
!911 = !DILocation(line: 99, column: 29, scope: !894)
!912 = !DILocation(line: 99, column: 45, scope: !894)
!913 = !DILocation(line: 99, column: 26, scope: !894)
!914 = !DILocation(line: 99, column: 64, scope: !894)
!915 = !DILocation(line: 99, column: 54, scope: !894)
!916 = !DILocation(line: 99, column: 69, scope: !894)
!917 = !DILocation(line: 99, column: 51, scope: !894)
!918 = !DILocation(line: 99, column: 7, scope: !894)
!919 = !DILocation(line: 99, column: 12, scope: !894)
!920 = !DILocation(line: 100, column: 15, scope: !894)
!921 = !DILocation(line: 100, column: 20, scope: !894)
!922 = !DILocation(line: 100, column: 39, scope: !894)
!923 = !DILocation(line: 100, column: 29, scope: !894)
!924 = !DILocation(line: 100, column: 45, scope: !894)
!925 = !DILocation(line: 100, column: 26, scope: !894)
!926 = !DILocation(line: 100, column: 7, scope: !894)
!927 = !DILocation(line: 100, column: 12, scope: !894)
!928 = !DILocation(line: 101, column: 15, scope: !894)
!929 = !DILocation(line: 101, column: 20, scope: !894)
!930 = !DILocation(line: 101, column: 39, scope: !894)
!931 = !DILocation(line: 101, column: 29, scope: !894)
!932 = !DILocation(line: 101, column: 45, scope: !894)
!933 = !DILocation(line: 101, column: 26, scope: !894)
!934 = !DILocation(line: 101, column: 7, scope: !894)
!935 = !DILocation(line: 101, column: 12, scope: !894)
!936 = !DILocation(line: 102, column: 15, scope: !894)
!937 = !DILocation(line: 102, column: 20, scope: !894)
!938 = !DILocation(line: 102, column: 39, scope: !894)
!939 = !DILocation(line: 102, column: 29, scope: !894)
!940 = !DILocation(line: 102, column: 45, scope: !894)
!941 = !DILocation(line: 102, column: 26, scope: !894)
!942 = !DILocation(line: 102, column: 64, scope: !894)
!943 = !DILocation(line: 102, column: 54, scope: !894)
!944 = !DILocation(line: 102, column: 69, scope: !894)
!945 = !DILocation(line: 102, column: 51, scope: !894)
!946 = !DILocation(line: 102, column: 7, scope: !894)
!947 = !DILocation(line: 102, column: 12, scope: !894)
!948 = !DILocation(line: 103, column: 15, scope: !894)
!949 = !DILocation(line: 103, column: 20, scope: !894)
!950 = !DILocation(line: 103, column: 39, scope: !894)
!951 = !DILocation(line: 103, column: 29, scope: !894)
!952 = !DILocation(line: 103, column: 45, scope: !894)
!953 = !DILocation(line: 103, column: 26, scope: !894)
!954 = !DILocation(line: 103, column: 7, scope: !894)
!955 = !DILocation(line: 103, column: 12, scope: !894)
!956 = !DILocation(line: 104, column: 15, scope: !894)
!957 = !DILocation(line: 104, column: 20, scope: !894)
!958 = !DILocation(line: 104, column: 39, scope: !894)
!959 = !DILocation(line: 104, column: 29, scope: !894)
!960 = !DILocation(line: 104, column: 45, scope: !894)
!961 = !DILocation(line: 104, column: 26, scope: !894)
!962 = !DILocation(line: 104, column: 7, scope: !894)
!963 = !DILocation(line: 104, column: 12, scope: !894)
!964 = !DILocalVariable(name: "k", scope: !870, file: !732, line: 91, type: !40)
!965 = !DILocation(line: 107, column: 11, scope: !966)
!966 = distinct !DILexicalBlock(scope: !894, file: !732, line: 107, column: 7)
!967 = !DILocation(line: 107, scope: !966)
!968 = !DILocation(line: 107, column: 16, scope: !969)
!969 = distinct !DILexicalBlock(scope: !966, file: !732, line: 107, column: 7)
!970 = !DILocation(line: 107, column: 7, scope: !966)
!971 = !DILocation(line: 108, column: 47, scope: !969)
!972 = !DILocation(line: 108, column: 52, scope: !969)
!973 = !DILocation(line: 108, column: 60, scope: !969)
!974 = !DILocation(line: 108, column: 69, scope: !969)
!975 = !DILocation(line: 108, column: 77, scope: !969)
!976 = !DILocation(line: 108, column: 35, scope: !969)
!977 = !DILocation(line: 108, column: 9, scope: !969)
!978 = !DILocation(line: 108, column: 27, scope: !969)
!979 = !DILocation(line: 108, column: 29, scope: !969)
!980 = !DILocation(line: 108, column: 33, scope: !969)
!981 = !DILocation(line: 107, column: 20, scope: !969)
!982 = !DILocation(line: 107, column: 7, scope: !969)
!983 = distinct !{!983, !970, !984, !130}
!984 = !DILocation(line: 108, column: 80, scope: !966)
!985 = !DILocation(line: 105, column: 9, scope: !894)
!986 = !DILocation(line: 96, column: 26, scope: !892)
!987 = !DILocation(line: 96, column: 5, scope: !892)
!988 = distinct !{!988, !886, !989, !130}
!989 = !DILocation(line: 109, column: 5, scope: !887)
!990 = !DILocation(line: 95, column: 22, scope: !884)
!991 = !DILocation(line: 95, column: 3, scope: !884)
!992 = distinct !{!992, !885, !993, !130}
!993 = !DILocation(line: 110, column: 3, scope: !881)
!994 = !DILocation(line: 128, column: 1, scope: !870)
!995 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_tobytes", scope: !732, file: !732, line: 139, type: !733, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!996 = !DILocalVariable(name: "r", arg: 1, scope: !995, file: !732, line: 139, type: !32)
!997 = !DILocation(line: 0, scope: !995)
!998 = !DILocalVariable(name: "a", arg: 2, scope: !995, file: !732, line: 139, type: !735)
!999 = !DILocalVariable(name: "i", scope: !995, file: !732, line: 141, type: !40)
!1000 = !DILocation(line: 142, column: 7, scope: !1001)
!1001 = distinct !DILexicalBlock(scope: !995, file: !732, line: 142, column: 3)
!1002 = !DILocation(line: 142, scope: !1001)
!1003 = !DILocation(line: 142, column: 12, scope: !1004)
!1004 = distinct !DILexicalBlock(scope: !1001, file: !732, line: 142, column: 3)
!1005 = !DILocation(line: 142, column: 3, scope: !1001)
!1006 = !DILocation(line: 143, column: 21, scope: !1004)
!1007 = !DILocation(line: 143, column: 19, scope: !1004)
!1008 = !DILocation(line: 143, column: 40, scope: !1004)
!1009 = !DILocation(line: 143, column: 5, scope: !1004)
!1010 = !DILocation(line: 142, column: 22, scope: !1004)
!1011 = !DILocation(line: 142, column: 3, scope: !1004)
!1012 = distinct !{!1012, !1005, !1013, !130}
!1013 = !DILocation(line: 143, column: 49, scope: !1001)
!1014 = !DILocation(line: 144, column: 1, scope: !995)
!1015 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_frombytes", scope: !732, file: !732, line: 156, type: !871, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1016 = !DILocalVariable(name: "r", arg: 1, scope: !1015, file: !732, line: 156, type: !873)
!1017 = !DILocation(line: 0, scope: !1015)
!1018 = !DILocalVariable(name: "a", arg: 2, scope: !1015, file: !732, line: 156, type: !272)
!1019 = !DILocalVariable(name: "i", scope: !1015, file: !732, line: 158, type: !40)
!1020 = !DILocation(line: 159, column: 7, scope: !1021)
!1021 = distinct !DILexicalBlock(scope: !1015, file: !732, line: 159, column: 3)
!1022 = !DILocation(line: 159, scope: !1021)
!1023 = !DILocation(line: 159, column: 12, scope: !1024)
!1024 = distinct !DILexicalBlock(scope: !1021, file: !732, line: 159, column: 3)
!1025 = !DILocation(line: 159, column: 3, scope: !1021)
!1026 = !DILocation(line: 160, column: 21, scope: !1024)
!1027 = !DILocation(line: 160, column: 35, scope: !1024)
!1028 = !DILocation(line: 160, column: 33, scope: !1024)
!1029 = !DILocation(line: 160, column: 5, scope: !1024)
!1030 = !DILocation(line: 159, column: 22, scope: !1024)
!1031 = !DILocation(line: 159, column: 3, scope: !1024)
!1032 = distinct !{!1032, !1025, !1033, !130}
!1033 = !DILocation(line: 160, column: 51, scope: !1021)
!1034 = !DILocation(line: 161, column: 1, scope: !1015)
!1035 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_ntt", scope: !732, file: !732, line: 170, type: !1036, scopeLine: 171, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1036 = !DISubroutineType(types: !1037)
!1037 = !{null, !873}
!1038 = !DILocalVariable(name: "r", arg: 1, scope: !1035, file: !732, line: 170, type: !873)
!1039 = !DILocation(line: 0, scope: !1035)
!1040 = !DILocalVariable(name: "i", scope: !1035, file: !732, line: 172, type: !40)
!1041 = !DILocation(line: 173, column: 7, scope: !1042)
!1042 = distinct !DILexicalBlock(scope: !1035, file: !732, line: 173, column: 3)
!1043 = !DILocation(line: 173, scope: !1042)
!1044 = !DILocation(line: 173, column: 12, scope: !1045)
!1045 = distinct !DILexicalBlock(scope: !1042, file: !732, line: 173, column: 3)
!1046 = !DILocation(line: 173, column: 3, scope: !1042)
!1047 = !DILocation(line: 174, column: 15, scope: !1045)
!1048 = !DILocation(line: 174, column: 5, scope: !1045)
!1049 = !DILocation(line: 173, column: 22, scope: !1045)
!1050 = !DILocation(line: 173, column: 3, scope: !1045)
!1051 = distinct !{!1051, !1046, !1052, !130}
!1052 = !DILocation(line: 174, column: 24, scope: !1042)
!1053 = !DILocation(line: 175, column: 1, scope: !1035)
!1054 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_invntt_tomont", scope: !732, file: !732, line: 185, type: !1036, scopeLine: 186, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1055 = !DILocalVariable(name: "r", arg: 1, scope: !1054, file: !732, line: 185, type: !873)
!1056 = !DILocation(line: 0, scope: !1054)
!1057 = !DILocalVariable(name: "i", scope: !1054, file: !732, line: 187, type: !40)
!1058 = !DILocation(line: 188, column: 7, scope: !1059)
!1059 = distinct !DILexicalBlock(scope: !1054, file: !732, line: 188, column: 3)
!1060 = !DILocation(line: 188, scope: !1059)
!1061 = !DILocation(line: 188, column: 12, scope: !1062)
!1062 = distinct !DILexicalBlock(scope: !1059, file: !732, line: 188, column: 3)
!1063 = !DILocation(line: 188, column: 3, scope: !1059)
!1064 = !DILocation(line: 189, column: 25, scope: !1062)
!1065 = !DILocation(line: 189, column: 5, scope: !1062)
!1066 = !DILocation(line: 188, column: 22, scope: !1062)
!1067 = !DILocation(line: 188, column: 3, scope: !1062)
!1068 = distinct !{!1068, !1063, !1069, !130}
!1069 = !DILocation(line: 189, column: 34, scope: !1059)
!1070 = !DILocation(line: 190, column: 1, scope: !1054)
!1071 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery", scope: !732, file: !732, line: 202, type: !1072, scopeLine: 203, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1072 = !DISubroutineType(types: !1073)
!1073 = !{null, !1074, !735, !735}
!1074 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !742, size: 32)
!1075 = !DILocalVariable(name: "r", arg: 1, scope: !1071, file: !732, line: 202, type: !1074)
!1076 = !DILocation(line: 0, scope: !1071)
!1077 = !DILocalVariable(name: "a", arg: 2, scope: !1071, file: !732, line: 202, type: !735)
!1078 = !DILocalVariable(name: "b", arg: 3, scope: !1071, file: !732, line: 202, type: !735)
!1079 = !DILocalVariable(name: "t", scope: !1071, file: !732, line: 205, type: !742)
!1080 = !DILocation(line: 205, column: 8, scope: !1071)
!1081 = !DILocation(line: 207, column: 3, scope: !1071)
!1082 = !DILocalVariable(name: "i", scope: !1071, file: !732, line: 204, type: !40)
!1083 = !DILocation(line: 208, column: 7, scope: !1084)
!1084 = distinct !DILexicalBlock(scope: !1071, file: !732, line: 208, column: 3)
!1085 = !DILocation(line: 208, scope: !1084)
!1086 = !DILocation(line: 208, column: 12, scope: !1087)
!1087 = distinct !DILexicalBlock(scope: !1084, file: !732, line: 208, column: 3)
!1088 = !DILocation(line: 208, column: 3, scope: !1084)
!1089 = !DILocation(line: 209, column: 34, scope: !1090)
!1090 = distinct !DILexicalBlock(scope: !1087, file: !732, line: 208, column: 26)
!1091 = !DILocation(line: 209, column: 46, scope: !1090)
!1092 = !DILocation(line: 209, column: 5, scope: !1090)
!1093 = !DILocation(line: 210, column: 5, scope: !1090)
!1094 = !DILocation(line: 208, column: 22, scope: !1087)
!1095 = !DILocation(line: 208, column: 3, scope: !1087)
!1096 = distinct !{!1096, !1088, !1097, !130}
!1097 = !DILocation(line: 211, column: 3, scope: !1084)
!1098 = !DILocation(line: 213, column: 3, scope: !1071)
!1099 = !DILocation(line: 214, column: 1, scope: !1071)
!1100 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_reduce", scope: !732, file: !732, line: 225, type: !1036, scopeLine: 226, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1101 = !DILocalVariable(name: "r", arg: 1, scope: !1100, file: !732, line: 225, type: !873)
!1102 = !DILocation(line: 0, scope: !1100)
!1103 = !DILocalVariable(name: "i", scope: !1100, file: !732, line: 227, type: !40)
!1104 = !DILocation(line: 228, column: 7, scope: !1105)
!1105 = distinct !DILexicalBlock(scope: !1100, file: !732, line: 228, column: 3)
!1106 = !DILocation(line: 228, scope: !1105)
!1107 = !DILocation(line: 228, column: 12, scope: !1108)
!1108 = distinct !DILexicalBlock(scope: !1105, file: !732, line: 228, column: 3)
!1109 = !DILocation(line: 228, column: 3, scope: !1105)
!1110 = !DILocation(line: 229, column: 18, scope: !1108)
!1111 = !DILocation(line: 229, column: 5, scope: !1108)
!1112 = !DILocation(line: 228, column: 22, scope: !1108)
!1113 = !DILocation(line: 228, column: 3, scope: !1108)
!1114 = distinct !{!1114, !1109, !1115, !130}
!1115 = !DILocation(line: 229, column: 27, scope: !1105)
!1116 = !DILocation(line: 230, column: 1, scope: !1100)
!1117 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_add", scope: !732, file: !732, line: 241, type: !1118, scopeLine: 242, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1118 = !DISubroutineType(types: !1119)
!1119 = !{null, !873, !735, !735}
!1120 = !DILocalVariable(name: "r", arg: 1, scope: !1117, file: !732, line: 241, type: !873)
!1121 = !DILocation(line: 0, scope: !1117)
!1122 = !DILocalVariable(name: "a", arg: 2, scope: !1117, file: !732, line: 241, type: !735)
!1123 = !DILocalVariable(name: "b", arg: 3, scope: !1117, file: !732, line: 241, type: !735)
!1124 = !DILocalVariable(name: "i", scope: !1117, file: !732, line: 243, type: !40)
!1125 = !DILocation(line: 244, column: 7, scope: !1126)
!1126 = distinct !DILexicalBlock(scope: !1117, file: !732, line: 244, column: 3)
!1127 = !DILocation(line: 244, scope: !1126)
!1128 = !DILocation(line: 244, column: 12, scope: !1129)
!1129 = distinct !DILexicalBlock(scope: !1126, file: !732, line: 244, column: 3)
!1130 = !DILocation(line: 244, column: 3, scope: !1126)
!1131 = !DILocation(line: 245, column: 15, scope: !1129)
!1132 = !DILocation(line: 245, column: 27, scope: !1129)
!1133 = !DILocation(line: 245, column: 39, scope: !1129)
!1134 = !DILocation(line: 245, column: 5, scope: !1129)
!1135 = !DILocation(line: 244, column: 22, scope: !1129)
!1136 = !DILocation(line: 244, column: 3, scope: !1129)
!1137 = distinct !{!1137, !1130, !1138, !130}
!1138 = !DILocation(line: 245, column: 48, scope: !1126)
!1139 = !DILocation(line: 246, column: 1, scope: !1117)
!1140 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_compress", scope: !1141, file: !1141, line: 19, type: !1142, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1141 = !DIFile(filename: "../../ref/poly.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!1142 = !DISubroutineType(types: !1143)
!1143 = !{null, !32, !1144}
!1144 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1145, size: 32)
!1145 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1146)
!1146 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !369, line: 13, baseType: !1147)
!1147 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !369, line: 11, size: 4096, elements: !1148)
!1148 = !{!1149}
!1149 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !1147, file: !369, line: 12, baseType: !373, size: 4096)
!1150 = !DILocalVariable(name: "r", arg: 1, scope: !1140, file: !1141, line: 19, type: !32)
!1151 = !DILocation(line: 0, scope: !1140)
!1152 = !DILocalVariable(name: "a", arg: 2, scope: !1140, file: !1141, line: 19, type: !1144)
!1153 = !DILocalVariable(name: "t", scope: !1140, file: !1141, line: 24, type: !1154)
!1154 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 64, elements: !751)
!1155 = !DILocation(line: 24, column: 11, scope: !1140)
!1156 = !DILocalVariable(name: "i", scope: !1140, file: !1141, line: 21, type: !40)
!1157 = !DILocation(line: 48, column: 7, scope: !1158)
!1158 = distinct !DILexicalBlock(scope: !1140, file: !1141, line: 48, column: 3)
!1159 = !DILocation(line: 48, scope: !1158)
!1160 = !DILocation(line: 48, column: 12, scope: !1161)
!1161 = distinct !DILexicalBlock(scope: !1158, file: !1141, line: 48, column: 3)
!1162 = !DILocation(line: 48, column: 3, scope: !1158)
!1163 = !DILocation(line: 49, column: 5, scope: !1164)
!1164 = distinct !DILexicalBlock(scope: !1165, file: !1141, line: 49, column: 5)
!1165 = distinct !DILexicalBlock(scope: !1161, file: !1141, line: 48, column: 28)
!1166 = !DILocation(line: 49, scope: !1164)
!1167 = !DILocalVariable(name: "j", scope: !1140, file: !1141, line: 21, type: !40)
!1168 = !DILocation(line: 49, column: 14, scope: !1169)
!1169 = distinct !DILexicalBlock(scope: !1164, file: !1141, line: 49, column: 5)
!1170 = !DILocation(line: 51, column: 23, scope: !1171)
!1171 = distinct !DILexicalBlock(scope: !1169, file: !1141, line: 49, column: 22)
!1172 = !DILocation(line: 51, column: 25, scope: !1171)
!1173 = !DILocation(line: 51, column: 12, scope: !1171)
!1174 = !DILocalVariable(name: "u", scope: !1140, file: !1141, line: 22, type: !61)
!1175 = !DILocation(line: 52, column: 22, scope: !1171)
!1176 = !DILocation(line: 52, column: 9, scope: !1171)
!1177 = !DILocation(line: 54, column: 12, scope: !1171)
!1178 = !DILocalVariable(name: "d0", scope: !1140, file: !1141, line: 23, type: !91)
!1179 = !DILocation(line: 56, column: 10, scope: !1171)
!1180 = !DILocation(line: 57, column: 10, scope: !1171)
!1181 = !DILocation(line: 58, column: 14, scope: !1171)
!1182 = !DILocation(line: 58, column: 7, scope: !1171)
!1183 = !DILocation(line: 58, column: 12, scope: !1171)
!1184 = !DILocation(line: 49, column: 18, scope: !1169)
!1185 = !DILocation(line: 49, column: 5, scope: !1169)
!1186 = distinct !{!1186, !1163, !1187, !130}
!1187 = !DILocation(line: 59, column: 5, scope: !1164)
!1188 = !DILocation(line: 61, column: 13, scope: !1165)
!1189 = !DILocation(line: 61, column: 27, scope: !1165)
!1190 = !DILocation(line: 61, column: 32, scope: !1165)
!1191 = !DILocation(line: 61, column: 24, scope: !1165)
!1192 = !DILocation(line: 61, column: 10, scope: !1165)
!1193 = !DILocation(line: 62, column: 18, scope: !1165)
!1194 = !DILocation(line: 62, column: 27, scope: !1165)
!1195 = !DILocation(line: 62, column: 32, scope: !1165)
!1196 = !DILocation(line: 62, column: 24, scope: !1165)
!1197 = !DILocation(line: 62, column: 41, scope: !1165)
!1198 = !DILocation(line: 62, column: 46, scope: !1165)
!1199 = !DILocation(line: 62, column: 38, scope: !1165)
!1200 = !DILocation(line: 62, column: 5, scope: !1165)
!1201 = !DILocation(line: 62, column: 10, scope: !1165)
!1202 = !DILocation(line: 63, column: 18, scope: !1165)
!1203 = !DILocation(line: 63, column: 27, scope: !1165)
!1204 = !DILocation(line: 63, column: 32, scope: !1165)
!1205 = !DILocation(line: 63, column: 24, scope: !1165)
!1206 = !DILocation(line: 63, column: 5, scope: !1165)
!1207 = !DILocation(line: 63, column: 10, scope: !1165)
!1208 = !DILocation(line: 64, column: 18, scope: !1165)
!1209 = !DILocation(line: 64, column: 27, scope: !1165)
!1210 = !DILocation(line: 64, column: 32, scope: !1165)
!1211 = !DILocation(line: 64, column: 24, scope: !1165)
!1212 = !DILocation(line: 64, column: 41, scope: !1165)
!1213 = !DILocation(line: 64, column: 46, scope: !1165)
!1214 = !DILocation(line: 64, column: 38, scope: !1165)
!1215 = !DILocation(line: 64, column: 5, scope: !1165)
!1216 = !DILocation(line: 64, column: 10, scope: !1165)
!1217 = !DILocation(line: 65, column: 18, scope: !1165)
!1218 = !DILocation(line: 65, column: 27, scope: !1165)
!1219 = !DILocation(line: 65, column: 32, scope: !1165)
!1220 = !DILocation(line: 65, column: 24, scope: !1165)
!1221 = !DILocation(line: 65, column: 5, scope: !1165)
!1222 = !DILocation(line: 65, column: 10, scope: !1165)
!1223 = !DILocation(line: 66, column: 7, scope: !1165)
!1224 = !DILocation(line: 48, column: 24, scope: !1161)
!1225 = !DILocation(line: 48, column: 3, scope: !1161)
!1226 = distinct !{!1226, !1162, !1227, !130}
!1227 = !DILocation(line: 67, column: 3, scope: !1158)
!1228 = !DILocation(line: 71, column: 1, scope: !1140)
!1229 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_decompress", scope: !1141, file: !1141, line: 83, type: !1230, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1230 = !DISubroutineType(types: !1231)
!1231 = !{null, !1232, !272}
!1232 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1146, size: 32)
!1233 = !DILocalVariable(name: "r", arg: 1, scope: !1229, file: !1141, line: 83, type: !1232)
!1234 = !DILocation(line: 0, scope: !1229)
!1235 = !DILocalVariable(name: "a", arg: 2, scope: !1229, file: !1141, line: 83, type: !272)
!1236 = !DILocalVariable(name: "t", scope: !1229, file: !1141, line: 95, type: !1154)
!1237 = !DILocation(line: 95, column: 11, scope: !1229)
!1238 = !DILocalVariable(name: "i", scope: !1229, file: !1141, line: 85, type: !40)
!1239 = !DILocation(line: 96, column: 7, scope: !1240)
!1240 = distinct !DILexicalBlock(scope: !1229, file: !1141, line: 96, column: 3)
!1241 = !DILocation(line: 96, scope: !1240)
!1242 = !DILocation(line: 96, column: 12, scope: !1243)
!1243 = distinct !DILexicalBlock(scope: !1240, file: !1141, line: 96, column: 3)
!1244 = !DILocation(line: 96, column: 3, scope: !1240)
!1245 = !DILocation(line: 97, column: 13, scope: !1246)
!1246 = distinct !DILexicalBlock(scope: !1243, file: !1141, line: 96, column: 28)
!1247 = !DILocation(line: 97, column: 10, scope: !1246)
!1248 = !DILocation(line: 98, column: 27, scope: !1246)
!1249 = !DILocation(line: 98, column: 24, scope: !1246)
!1250 = !DILocation(line: 98, column: 5, scope: !1246)
!1251 = !DILocation(line: 98, column: 10, scope: !1246)
!1252 = !DILocation(line: 99, column: 18, scope: !1246)
!1253 = !DILocation(line: 99, column: 5, scope: !1246)
!1254 = !DILocation(line: 99, column: 10, scope: !1246)
!1255 = !DILocation(line: 100, column: 13, scope: !1246)
!1256 = !DILocation(line: 100, column: 27, scope: !1246)
!1257 = !DILocation(line: 100, column: 24, scope: !1246)
!1258 = !DILocation(line: 100, column: 5, scope: !1246)
!1259 = !DILocation(line: 100, column: 10, scope: !1246)
!1260 = !DILocation(line: 101, column: 27, scope: !1246)
!1261 = !DILocation(line: 101, column: 24, scope: !1246)
!1262 = !DILocation(line: 101, column: 5, scope: !1246)
!1263 = !DILocation(line: 101, column: 10, scope: !1246)
!1264 = !DILocation(line: 102, column: 18, scope: !1246)
!1265 = !DILocation(line: 102, column: 5, scope: !1246)
!1266 = !DILocation(line: 102, column: 10, scope: !1246)
!1267 = !DILocation(line: 103, column: 13, scope: !1246)
!1268 = !DILocation(line: 103, column: 27, scope: !1246)
!1269 = !DILocation(line: 103, column: 24, scope: !1246)
!1270 = !DILocation(line: 103, column: 5, scope: !1246)
!1271 = !DILocation(line: 103, column: 10, scope: !1246)
!1272 = !DILocation(line: 104, column: 18, scope: !1246)
!1273 = !DILocation(line: 104, column: 5, scope: !1246)
!1274 = !DILocation(line: 104, column: 10, scope: !1246)
!1275 = !DILocalVariable(name: "j", scope: !1229, file: !1141, line: 94, type: !40)
!1276 = !DILocation(line: 107, column: 9, scope: !1277)
!1277 = distinct !DILexicalBlock(scope: !1246, file: !1141, line: 107, column: 5)
!1278 = !DILocation(line: 107, scope: !1277)
!1279 = !DILocation(line: 107, column: 14, scope: !1280)
!1280 = distinct !DILexicalBlock(scope: !1277, file: !1141, line: 107, column: 5)
!1281 = !DILocation(line: 107, column: 5, scope: !1277)
!1282 = !DILocation(line: 108, column: 38, scope: !1280)
!1283 = !DILocation(line: 108, column: 43, scope: !1280)
!1284 = !DILocation(line: 108, column: 48, scope: !1280)
!1285 = !DILocation(line: 108, column: 57, scope: !1280)
!1286 = !DILocation(line: 108, column: 63, scope: !1280)
!1287 = !DILocation(line: 108, column: 26, scope: !1280)
!1288 = !DILocation(line: 108, column: 18, scope: !1280)
!1289 = !DILocation(line: 108, column: 20, scope: !1280)
!1290 = !DILocation(line: 108, column: 7, scope: !1280)
!1291 = !DILocation(line: 108, column: 24, scope: !1280)
!1292 = !DILocation(line: 107, column: 18, scope: !1280)
!1293 = !DILocation(line: 107, column: 5, scope: !1280)
!1294 = distinct !{!1294, !1281, !1295, !130}
!1295 = !DILocation(line: 108, column: 66, scope: !1277)
!1296 = !DILocation(line: 105, column: 7, scope: !1246)
!1297 = !DILocation(line: 96, column: 24, scope: !1243)
!1298 = !DILocation(line: 96, column: 3, scope: !1243)
!1299 = distinct !{!1299, !1244, !1300, !130}
!1300 = !DILocation(line: 109, column: 3, scope: !1240)
!1301 = !DILocation(line: 113, column: 1, scope: !1229)
!1302 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_tobytes", scope: !1141, file: !1141, line: 124, type: !1142, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1303 = !DILocalVariable(name: "r", arg: 1, scope: !1302, file: !1141, line: 124, type: !32)
!1304 = !DILocation(line: 0, scope: !1302)
!1305 = !DILocalVariable(name: "a", arg: 2, scope: !1302, file: !1141, line: 124, type: !1144)
!1306 = !DILocalVariable(name: "i", scope: !1302, file: !1141, line: 126, type: !40)
!1307 = !DILocation(line: 129, column: 7, scope: !1308)
!1308 = distinct !DILexicalBlock(scope: !1302, file: !1141, line: 129, column: 3)
!1309 = !DILocation(line: 129, scope: !1308)
!1310 = !DILocation(line: 129, column: 12, scope: !1311)
!1311 = distinct !DILexicalBlock(scope: !1308, file: !1141, line: 129, column: 3)
!1312 = !DILocation(line: 129, column: 3, scope: !1308)
!1313 = !DILocation(line: 131, column: 22, scope: !1314)
!1314 = distinct !DILexicalBlock(scope: !1311, file: !1141, line: 129, column: 28)
!1315 = !DILocation(line: 131, column: 11, scope: !1314)
!1316 = !DILocalVariable(name: "t0", scope: !1302, file: !1141, line: 127, type: !86)
!1317 = !DILocation(line: 132, column: 31, scope: !1314)
!1318 = !DILocation(line: 132, column: 8, scope: !1314)
!1319 = !DILocation(line: 133, column: 21, scope: !1314)
!1320 = !DILocation(line: 133, column: 23, scope: !1314)
!1321 = !DILocation(line: 133, column: 10, scope: !1314)
!1322 = !DILocalVariable(name: "t1", scope: !1302, file: !1141, line: 127, type: !86)
!1323 = !DILocation(line: 134, column: 31, scope: !1314)
!1324 = !DILocation(line: 134, column: 8, scope: !1314)
!1325 = !DILocation(line: 135, column: 16, scope: !1314)
!1326 = !DILocation(line: 135, column: 8, scope: !1314)
!1327 = !DILocation(line: 135, column: 5, scope: !1314)
!1328 = !DILocation(line: 135, column: 14, scope: !1314)
!1329 = !DILocation(line: 136, column: 20, scope: !1314)
!1330 = !DILocation(line: 136, column: 29, scope: !1314)
!1331 = !DILocation(line: 136, column: 32, scope: !1314)
!1332 = !DILocation(line: 136, column: 26, scope: !1314)
!1333 = !DILocation(line: 136, column: 8, scope: !1314)
!1334 = !DILocation(line: 136, column: 5, scope: !1314)
!1335 = !DILocation(line: 136, column: 14, scope: !1314)
!1336 = !DILocation(line: 137, column: 20, scope: !1314)
!1337 = !DILocation(line: 137, column: 16, scope: !1314)
!1338 = !DILocation(line: 137, column: 8, scope: !1314)
!1339 = !DILocation(line: 137, column: 5, scope: !1314)
!1340 = !DILocation(line: 137, column: 14, scope: !1314)
!1341 = !DILocation(line: 129, column: 24, scope: !1311)
!1342 = !DILocation(line: 129, column: 3, scope: !1311)
!1343 = distinct !{!1343, !1312, !1344, !130}
!1344 = !DILocation(line: 138, column: 3, scope: !1308)
!1345 = !DILocation(line: 139, column: 1, scope: !1302)
!1346 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_frombytes", scope: !1141, file: !1141, line: 151, type: !1230, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1347 = !DILocalVariable(name: "r", arg: 1, scope: !1346, file: !1141, line: 151, type: !1232)
!1348 = !DILocation(line: 0, scope: !1346)
!1349 = !DILocalVariable(name: "a", arg: 2, scope: !1346, file: !1141, line: 151, type: !272)
!1350 = !DILocalVariable(name: "i", scope: !1346, file: !1141, line: 153, type: !40)
!1351 = !DILocation(line: 154, column: 7, scope: !1352)
!1352 = distinct !DILexicalBlock(scope: !1346, file: !1141, line: 154, column: 3)
!1353 = !DILocation(line: 154, scope: !1352)
!1354 = !DILocation(line: 154, column: 12, scope: !1355)
!1355 = distinct !DILexicalBlock(scope: !1352, file: !1141, line: 154, column: 3)
!1356 = !DILocation(line: 154, column: 3, scope: !1352)
!1357 = !DILocation(line: 155, column: 29, scope: !1358)
!1358 = distinct !DILexicalBlock(scope: !1355, file: !1141, line: 154, column: 28)
!1359 = !DILocation(line: 155, column: 26, scope: !1358)
!1360 = !DILocation(line: 155, column: 57, scope: !1358)
!1361 = !DILocation(line: 155, column: 54, scope: !1358)
!1362 = !DILocation(line: 155, column: 44, scope: !1358)
!1363 = !DILocation(line: 155, column: 63, scope: !1358)
!1364 = !DILocation(line: 155, column: 70, scope: !1358)
!1365 = !DILocation(line: 155, column: 16, scope: !1358)
!1366 = !DILocation(line: 155, column: 5, scope: !1358)
!1367 = !DILocation(line: 155, column: 22, scope: !1358)
!1368 = !DILocation(line: 156, column: 29, scope: !1358)
!1369 = !DILocation(line: 156, column: 26, scope: !1358)
!1370 = !DILocation(line: 156, column: 35, scope: !1358)
!1371 = !DILocation(line: 156, column: 57, scope: !1358)
!1372 = !DILocation(line: 156, column: 54, scope: !1358)
!1373 = !DILocation(line: 156, column: 44, scope: !1358)
!1374 = !DILocation(line: 156, column: 63, scope: !1358)
!1375 = !DILocation(line: 156, column: 41, scope: !1358)
!1376 = !DILocation(line: 156, column: 16, scope: !1358)
!1377 = !DILocation(line: 156, column: 18, scope: !1358)
!1378 = !DILocation(line: 156, column: 5, scope: !1358)
!1379 = !DILocation(line: 156, column: 22, scope: !1358)
!1380 = !DILocation(line: 154, column: 24, scope: !1355)
!1381 = !DILocation(line: 154, column: 3, scope: !1355)
!1382 = distinct !{!1382, !1356, !1383, !130}
!1383 = !DILocation(line: 157, column: 3, scope: !1352)
!1384 = !DILocation(line: 158, column: 1, scope: !1346)
!1385 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_frommsg", scope: !1141, file: !1141, line: 168, type: !1230, scopeLine: 169, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1386 = !DILocalVariable(name: "r", arg: 1, scope: !1385, file: !1141, line: 168, type: !1232)
!1387 = !DILocation(line: 0, scope: !1385)
!1388 = !DILocalVariable(name: "msg", arg: 2, scope: !1385, file: !1141, line: 168, type: !272)
!1389 = !DILocalVariable(name: "i", scope: !1385, file: !1141, line: 170, type: !40)
!1390 = !DILocation(line: 176, column: 7, scope: !1391)
!1391 = distinct !DILexicalBlock(scope: !1385, file: !1141, line: 176, column: 3)
!1392 = !DILocation(line: 176, scope: !1391)
!1393 = !DILocation(line: 176, column: 12, scope: !1394)
!1394 = distinct !DILexicalBlock(scope: !1391, file: !1141, line: 176, column: 3)
!1395 = !DILocation(line: 176, column: 3, scope: !1391)
!1396 = !DILocation(line: 177, column: 5, scope: !1397)
!1397 = distinct !DILexicalBlock(scope: !1398, file: !1141, line: 177, column: 5)
!1398 = distinct !DILexicalBlock(scope: !1394, file: !1141, line: 176, column: 28)
!1399 = !DILocation(line: 177, scope: !1397)
!1400 = !DILocalVariable(name: "j", scope: !1385, file: !1141, line: 170, type: !40)
!1401 = !DILocation(line: 177, column: 14, scope: !1402)
!1402 = distinct !DILexicalBlock(scope: !1397, file: !1141, line: 177, column: 5)
!1403 = !DILocation(line: 178, column: 18, scope: !1404)
!1404 = distinct !DILexicalBlock(scope: !1402, file: !1141, line: 177, column: 22)
!1405 = !DILocation(line: 178, column: 20, scope: !1404)
!1406 = !DILocation(line: 178, column: 7, scope: !1404)
!1407 = !DILocation(line: 178, column: 24, scope: !1404)
!1408 = !DILocation(line: 179, column: 27, scope: !1404)
!1409 = !DILocation(line: 179, column: 31, scope: !1404)
!1410 = !DILocation(line: 179, column: 53, scope: !1404)
!1411 = !DILocation(line: 179, column: 60, scope: !1404)
!1412 = !DILocation(line: 179, column: 52, scope: !1404)
!1413 = !DILocation(line: 179, column: 7, scope: !1404)
!1414 = !DILocation(line: 177, column: 18, scope: !1402)
!1415 = !DILocation(line: 177, column: 5, scope: !1402)
!1416 = distinct !{!1416, !1396, !1417, !130}
!1417 = !DILocation(line: 180, column: 5, scope: !1397)
!1418 = !DILocation(line: 176, column: 24, scope: !1394)
!1419 = !DILocation(line: 176, column: 3, scope: !1394)
!1420 = distinct !{!1420, !1395, !1421, !130}
!1421 = !DILocation(line: 181, column: 3, scope: !1391)
!1422 = !DILocation(line: 182, column: 1, scope: !1385)
!1423 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_tomsg", scope: !1141, file: !1141, line: 192, type: !1142, scopeLine: 193, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1424 = !DILocalVariable(name: "msg", arg: 1, scope: !1423, file: !1141, line: 192, type: !32)
!1425 = !DILocation(line: 0, scope: !1423)
!1426 = !DILocalVariable(name: "a", arg: 2, scope: !1423, file: !1141, line: 192, type: !1144)
!1427 = !DILocalVariable(name: "i", scope: !1423, file: !1141, line: 194, type: !40)
!1428 = !DILocation(line: 197, column: 7, scope: !1429)
!1429 = distinct !DILexicalBlock(scope: !1423, file: !1141, line: 197, column: 3)
!1430 = !DILocation(line: 197, scope: !1429)
!1431 = !DILocation(line: 197, column: 12, scope: !1432)
!1432 = distinct !DILexicalBlock(scope: !1429, file: !1141, line: 197, column: 3)
!1433 = !DILocation(line: 197, column: 3, scope: !1429)
!1434 = !DILocation(line: 198, column: 5, scope: !1435)
!1435 = distinct !DILexicalBlock(scope: !1432, file: !1141, line: 197, column: 28)
!1436 = !DILocation(line: 198, column: 12, scope: !1435)
!1437 = !DILocalVariable(name: "j", scope: !1423, file: !1141, line: 194, type: !40)
!1438 = !DILocation(line: 199, column: 9, scope: !1439)
!1439 = distinct !DILexicalBlock(scope: !1435, file: !1141, line: 199, column: 5)
!1440 = !DILocation(line: 199, scope: !1439)
!1441 = !DILocation(line: 199, column: 14, scope: !1442)
!1442 = distinct !DILexicalBlock(scope: !1439, file: !1141, line: 199, column: 5)
!1443 = !DILocation(line: 199, column: 5, scope: !1439)
!1444 = !DILocation(line: 200, column: 23, scope: !1445)
!1445 = distinct !DILexicalBlock(scope: !1442, file: !1141, line: 199, column: 22)
!1446 = !DILocation(line: 200, column: 25, scope: !1445)
!1447 = !DILocation(line: 200, column: 12, scope: !1445)
!1448 = !DILocalVariable(name: "t", scope: !1423, file: !1141, line: 195, type: !91)
!1449 = !DILocation(line: 205, column: 9, scope: !1445)
!1450 = !DILocation(line: 206, column: 9, scope: !1445)
!1451 = !DILocation(line: 207, column: 9, scope: !1445)
!1452 = !DILocation(line: 208, column: 19, scope: !1445)
!1453 = !DILocation(line: 208, column: 7, scope: !1445)
!1454 = !DILocation(line: 208, column: 14, scope: !1445)
!1455 = !DILocation(line: 199, column: 18, scope: !1442)
!1456 = !DILocation(line: 199, column: 5, scope: !1442)
!1457 = distinct !{!1457, !1443, !1458, !130}
!1458 = !DILocation(line: 209, column: 5, scope: !1439)
!1459 = !DILocation(line: 197, column: 24, scope: !1432)
!1460 = !DILocation(line: 197, column: 3, scope: !1432)
!1461 = distinct !{!1461, !1433, !1462, !130}
!1462 = !DILocation(line: 210, column: 3, scope: !1429)
!1463 = !DILocation(line: 211, column: 1, scope: !1423)
!1464 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_getnoise_eta1", scope: !1141, file: !1141, line: 225, type: !1465, scopeLine: 226, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1465 = !DISubroutineType(types: !1466)
!1466 = !{null, !1232, !272, !33}
!1467 = !DILocalVariable(name: "r", arg: 1, scope: !1464, file: !1141, line: 225, type: !1232)
!1468 = !DILocation(line: 0, scope: !1464)
!1469 = !DILocalVariable(name: "seed", arg: 2, scope: !1464, file: !1141, line: 225, type: !272)
!1470 = !DILocalVariable(name: "nonce", arg: 3, scope: !1464, file: !1141, line: 225, type: !33)
!1471 = !DILocalVariable(name: "buf", scope: !1464, file: !1141, line: 227, type: !1472)
!1472 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 1024, elements: !64)
!1473 = !DILocation(line: 227, column: 11, scope: !1464)
!1474 = !DILocation(line: 228, column: 3, scope: !1464)
!1475 = !DILocation(line: 229, column: 3, scope: !1464)
!1476 = !DILocation(line: 230, column: 1, scope: !1464)
!1477 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_getnoise_eta2", scope: !1141, file: !1141, line: 244, type: !1465, scopeLine: 245, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1478 = !DILocalVariable(name: "r", arg: 1, scope: !1477, file: !1141, line: 244, type: !1232)
!1479 = !DILocation(line: 0, scope: !1477)
!1480 = !DILocalVariable(name: "seed", arg: 2, scope: !1477, file: !1141, line: 244, type: !272)
!1481 = !DILocalVariable(name: "nonce", arg: 3, scope: !1477, file: !1141, line: 244, type: !33)
!1482 = !DILocalVariable(name: "buf", scope: !1477, file: !1141, line: 246, type: !1472)
!1483 = !DILocation(line: 246, column: 11, scope: !1477)
!1484 = !DILocation(line: 247, column: 3, scope: !1477)
!1485 = !DILocation(line: 248, column: 3, scope: !1477)
!1486 = !DILocation(line: 249, column: 1, scope: !1477)
!1487 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_ntt", scope: !1141, file: !1141, line: 261, type: !1488, scopeLine: 262, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1488 = !DISubroutineType(types: !1489)
!1489 = !{null, !1232}
!1490 = !DILocalVariable(name: "r", arg: 1, scope: !1487, file: !1141, line: 261, type: !1232)
!1491 = !DILocation(line: 0, scope: !1487)
!1492 = !DILocation(line: 263, column: 3, scope: !1487)
!1493 = !DILocation(line: 264, column: 3, scope: !1487)
!1494 = !DILocation(line: 265, column: 1, scope: !1487)
!1495 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_reduce", scope: !1141, file: !1141, line: 323, type: !1488, scopeLine: 324, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1496 = !DILocalVariable(name: "r", arg: 1, scope: !1495, file: !1141, line: 323, type: !1232)
!1497 = !DILocation(line: 0, scope: !1495)
!1498 = !DILocalVariable(name: "i", scope: !1495, file: !1141, line: 325, type: !40)
!1499 = !DILocation(line: 326, column: 7, scope: !1500)
!1500 = distinct !DILexicalBlock(scope: !1495, file: !1141, line: 326, column: 3)
!1501 = !DILocation(line: 326, scope: !1500)
!1502 = !DILocation(line: 326, column: 12, scope: !1503)
!1503 = distinct !DILexicalBlock(scope: !1500, file: !1141, line: 326, column: 3)
!1504 = !DILocation(line: 326, column: 3, scope: !1500)
!1505 = !DILocation(line: 327, column: 35, scope: !1503)
!1506 = !DILocation(line: 327, column: 20, scope: !1503)
!1507 = !DILocation(line: 327, column: 5, scope: !1503)
!1508 = !DILocation(line: 327, column: 18, scope: !1503)
!1509 = !DILocation(line: 326, column: 22, scope: !1503)
!1510 = !DILocation(line: 326, column: 3, scope: !1503)
!1511 = distinct !{!1511, !1504, !1512, !130}
!1512 = !DILocation(line: 327, column: 47, scope: !1500)
!1513 = !DILocation(line: 328, column: 1, scope: !1495)
!1514 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_invntt_tomont", scope: !1141, file: !1141, line: 276, type: !1488, scopeLine: 277, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1515 = !DILocalVariable(name: "r", arg: 1, scope: !1514, file: !1141, line: 276, type: !1232)
!1516 = !DILocation(line: 0, scope: !1514)
!1517 = !DILocation(line: 278, column: 3, scope: !1514)
!1518 = !DILocation(line: 279, column: 1, scope: !1514)
!1519 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_basemul_montgomery", scope: !1141, file: !1141, line: 290, type: !1520, scopeLine: 291, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1520 = !DISubroutineType(types: !1521)
!1521 = !{null, !1232, !1144, !1144}
!1522 = !DILocalVariable(name: "r", arg: 1, scope: !1519, file: !1141, line: 290, type: !1232)
!1523 = !DILocation(line: 0, scope: !1519)
!1524 = !DILocalVariable(name: "a", arg: 2, scope: !1519, file: !1141, line: 290, type: !1144)
!1525 = !DILocalVariable(name: "b", arg: 3, scope: !1519, file: !1141, line: 290, type: !1144)
!1526 = !DILocalVariable(name: "i", scope: !1519, file: !1141, line: 292, type: !40)
!1527 = !DILocation(line: 293, column: 7, scope: !1528)
!1528 = distinct !DILexicalBlock(scope: !1519, file: !1141, line: 293, column: 3)
!1529 = !DILocation(line: 293, scope: !1528)
!1530 = !DILocation(line: 293, column: 12, scope: !1531)
!1531 = distinct !DILexicalBlock(scope: !1528, file: !1141, line: 293, column: 3)
!1532 = !DILocation(line: 293, column: 3, scope: !1528)
!1533 = !DILocation(line: 294, column: 25, scope: !1534)
!1534 = distinct !DILexicalBlock(scope: !1531, file: !1141, line: 293, column: 28)
!1535 = !DILocation(line: 294, column: 14, scope: !1534)
!1536 = !DILocation(line: 294, column: 42, scope: !1534)
!1537 = !DILocation(line: 294, column: 31, scope: !1534)
!1538 = !DILocation(line: 294, column: 59, scope: !1534)
!1539 = !DILocation(line: 294, column: 48, scope: !1534)
!1540 = !DILocation(line: 294, column: 72, scope: !1534)
!1541 = !DILocation(line: 294, column: 64, scope: !1534)
!1542 = !DILocation(line: 294, column: 5, scope: !1534)
!1543 = !DILocation(line: 295, column: 25, scope: !1534)
!1544 = !DILocation(line: 295, column: 27, scope: !1534)
!1545 = !DILocation(line: 295, column: 14, scope: !1534)
!1546 = !DILocation(line: 295, column: 44, scope: !1534)
!1547 = !DILocation(line: 295, column: 46, scope: !1534)
!1548 = !DILocation(line: 295, column: 33, scope: !1534)
!1549 = !DILocation(line: 295, column: 63, scope: !1534)
!1550 = !DILocation(line: 295, column: 65, scope: !1534)
!1551 = !DILocation(line: 295, column: 52, scope: !1534)
!1552 = !DILocation(line: 295, column: 79, scope: !1534)
!1553 = !DILocation(line: 295, column: 71, scope: !1534)
!1554 = !DILocation(line: 295, column: 70, scope: !1534)
!1555 = !DILocation(line: 295, column: 5, scope: !1534)
!1556 = !DILocation(line: 293, column: 24, scope: !1531)
!1557 = !DILocation(line: 293, column: 3, scope: !1531)
!1558 = distinct !{!1558, !1532, !1559, !130}
!1559 = !DILocation(line: 296, column: 3, scope: !1528)
!1560 = !DILocation(line: 297, column: 1, scope: !1519)
!1561 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_tomont", scope: !1141, file: !1141, line: 307, type: !1488, scopeLine: 308, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1562 = !DILocalVariable(name: "r", arg: 1, scope: !1561, file: !1141, line: 307, type: !1232)
!1563 = !DILocation(line: 0, scope: !1561)
!1564 = !DILocalVariable(name: "f", scope: !1561, file: !1141, line: 310, type: !60)
!1565 = !DILocalVariable(name: "i", scope: !1561, file: !1141, line: 309, type: !40)
!1566 = !DILocation(line: 311, column: 7, scope: !1567)
!1567 = distinct !DILexicalBlock(scope: !1561, file: !1141, line: 311, column: 3)
!1568 = !DILocation(line: 311, scope: !1567)
!1569 = !DILocation(line: 311, column: 12, scope: !1570)
!1570 = distinct !DILexicalBlock(scope: !1567, file: !1141, line: 311, column: 3)
!1571 = !DILocation(line: 311, column: 3, scope: !1567)
!1572 = !DILocation(line: 312, column: 47, scope: !1570)
!1573 = !DILocation(line: 312, column: 38, scope: !1570)
!1574 = !DILocation(line: 312, column: 59, scope: !1570)
!1575 = !DILocation(line: 312, column: 20, scope: !1570)
!1576 = !DILocation(line: 312, column: 5, scope: !1570)
!1577 = !DILocation(line: 312, column: 18, scope: !1570)
!1578 = !DILocation(line: 311, column: 22, scope: !1570)
!1579 = !DILocation(line: 311, column: 3, scope: !1570)
!1580 = distinct !{!1580, !1571, !1581, !130}
!1581 = !DILocation(line: 312, column: 61, scope: !1567)
!1582 = !DILocation(line: 313, column: 1, scope: !1561)
!1583 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_add", scope: !1141, file: !1141, line: 339, type: !1520, scopeLine: 340, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1584 = !DILocalVariable(name: "r", arg: 1, scope: !1583, file: !1141, line: 339, type: !1232)
!1585 = !DILocation(line: 0, scope: !1583)
!1586 = !DILocalVariable(name: "a", arg: 2, scope: !1583, file: !1141, line: 339, type: !1144)
!1587 = !DILocalVariable(name: "b", arg: 3, scope: !1583, file: !1141, line: 339, type: !1144)
!1588 = !DILocalVariable(name: "i", scope: !1583, file: !1141, line: 341, type: !40)
!1589 = !DILocation(line: 342, column: 7, scope: !1590)
!1590 = distinct !DILexicalBlock(scope: !1583, file: !1141, line: 342, column: 3)
!1591 = !DILocation(line: 342, scope: !1590)
!1592 = !DILocation(line: 342, column: 12, scope: !1593)
!1593 = distinct !DILexicalBlock(scope: !1590, file: !1141, line: 342, column: 3)
!1594 = !DILocation(line: 342, column: 3, scope: !1590)
!1595 = !DILocation(line: 343, column: 20, scope: !1593)
!1596 = !DILocation(line: 343, column: 35, scope: !1593)
!1597 = !DILocation(line: 343, column: 33, scope: !1593)
!1598 = !DILocation(line: 343, column: 5, scope: !1593)
!1599 = !DILocation(line: 343, column: 18, scope: !1593)
!1600 = !DILocation(line: 342, column: 22, scope: !1593)
!1601 = !DILocation(line: 342, column: 3, scope: !1593)
!1602 = distinct !{!1602, !1594, !1603, !130}
!1603 = !DILocation(line: 343, column: 46, scope: !1590)
!1604 = !DILocation(line: 344, column: 1, scope: !1583)
!1605 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_sub", scope: !1141, file: !1141, line: 355, type: !1520, scopeLine: 356, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1606 = !DILocalVariable(name: "r", arg: 1, scope: !1605, file: !1141, line: 355, type: !1232)
!1607 = !DILocation(line: 0, scope: !1605)
!1608 = !DILocalVariable(name: "a", arg: 2, scope: !1605, file: !1141, line: 355, type: !1144)
!1609 = !DILocalVariable(name: "b", arg: 3, scope: !1605, file: !1141, line: 355, type: !1144)
!1610 = !DILocalVariable(name: "i", scope: !1605, file: !1141, line: 357, type: !40)
!1611 = !DILocation(line: 358, column: 7, scope: !1612)
!1612 = distinct !DILexicalBlock(scope: !1605, file: !1141, line: 358, column: 3)
!1613 = !DILocation(line: 358, scope: !1612)
!1614 = !DILocation(line: 358, column: 12, scope: !1615)
!1615 = distinct !DILexicalBlock(scope: !1612, file: !1141, line: 358, column: 3)
!1616 = !DILocation(line: 358, column: 3, scope: !1612)
!1617 = !DILocation(line: 359, column: 20, scope: !1615)
!1618 = !DILocation(line: 359, column: 35, scope: !1615)
!1619 = !DILocation(line: 359, column: 33, scope: !1615)
!1620 = !DILocation(line: 359, column: 5, scope: !1615)
!1621 = !DILocation(line: 359, column: 18, scope: !1615)
!1622 = !DILocation(line: 358, column: 22, scope: !1615)
!1623 = !DILocation(line: 358, column: 3, scope: !1615)
!1624 = distinct !{!1624, !1616, !1625, !130}
!1625 = !DILocation(line: 359, column: 46, scope: !1612)
!1626 = !DILocation(line: 360, column: 1, scope: !1605)
!1627 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_ntt", scope: !58, file: !58, line: 80, type: !1628, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !53, retainedNodes: !49)
!1628 = !DISubroutineType(types: !1629)
!1629 = !{null, !448}
!1630 = !DILocalVariable(name: "r", arg: 1, scope: !1627, file: !58, line: 80, type: !448)
!1631 = !DILocation(line: 0, scope: !1627)
!1632 = !DILocalVariable(name: "k", scope: !1627, file: !58, line: 81, type: !40)
!1633 = !DILocalVariable(name: "len", scope: !1627, file: !58, line: 81, type: !40)
!1634 = !DILocation(line: 85, column: 7, scope: !1635)
!1635 = distinct !DILexicalBlock(scope: !1627, file: !58, line: 85, column: 3)
!1636 = !DILocation(line: 85, scope: !1635)
!1637 = !DILocation(line: 84, column: 5, scope: !1627)
!1638 = !DILocation(line: 85, column: 22, scope: !1639)
!1639 = distinct !DILexicalBlock(scope: !1635, file: !58, line: 85, column: 3)
!1640 = !DILocation(line: 85, column: 3, scope: !1635)
!1641 = !DILocation(line: 86, column: 5, scope: !1642)
!1642 = distinct !DILexicalBlock(scope: !1643, file: !58, line: 86, column: 5)
!1643 = distinct !DILexicalBlock(scope: !1639, file: !58, line: 85, column: 39)
!1644 = !DILocation(line: 86, scope: !1642)
!1645 = !DILocalVariable(name: "start", scope: !1627, file: !58, line: 81, type: !40)
!1646 = !DILocation(line: 86, column: 26, scope: !1647)
!1647 = distinct !DILexicalBlock(scope: !1642, file: !58, line: 86, column: 5)
!1648 = !DILocation(line: 87, column: 14, scope: !1649)
!1649 = distinct !DILexicalBlock(scope: !1647, file: !58, line: 86, column: 50)
!1650 = !DILocalVariable(name: "zeta", scope: !1627, file: !58, line: 82, type: !61)
!1651 = !DILocalVariable(name: "j", scope: !1627, file: !58, line: 81, type: !40)
!1652 = !DILocation(line: 88, column: 11, scope: !1653)
!1653 = distinct !DILexicalBlock(scope: !1649, file: !58, line: 88, column: 7)
!1654 = !DILocation(line: 88, scope: !1653)
!1655 = !DILocation(line: 88, column: 32, scope: !1656)
!1656 = distinct !DILexicalBlock(scope: !1653, file: !58, line: 88, column: 7)
!1657 = !DILocation(line: 88, column: 24, scope: !1656)
!1658 = !DILocation(line: 88, column: 7, scope: !1653)
!1659 = !DILocation(line: 89, column: 25, scope: !1660)
!1660 = distinct !DILexicalBlock(scope: !1656, file: !58, line: 88, column: 44)
!1661 = !DILocation(line: 89, column: 13, scope: !1660)
!1662 = !DILocalVariable(name: "t", scope: !1627, file: !58, line: 82, type: !61)
!1663 = !DILocation(line: 90, column: 22, scope: !1660)
!1664 = !DILocation(line: 90, column: 27, scope: !1660)
!1665 = !DILocation(line: 90, column: 9, scope: !1660)
!1666 = !DILocation(line: 90, column: 20, scope: !1660)
!1667 = !DILocation(line: 91, column: 16, scope: !1660)
!1668 = !DILocation(line: 91, column: 21, scope: !1660)
!1669 = !DILocation(line: 91, column: 9, scope: !1660)
!1670 = !DILocation(line: 91, column: 14, scope: !1660)
!1671 = !DILocation(line: 88, column: 40, scope: !1656)
!1672 = !DILocation(line: 88, column: 7, scope: !1656)
!1673 = distinct !{!1673, !1658, !1674, !130}
!1674 = !DILocation(line: 92, column: 7, scope: !1653)
!1675 = !DILocation(line: 87, column: 21, scope: !1649)
!1676 = !DILocation(line: 86, column: 43, scope: !1647)
!1677 = !DILocation(line: 86, column: 5, scope: !1647)
!1678 = distinct !{!1678, !1641, !1679, !130}
!1679 = !DILocation(line: 93, column: 5, scope: !1642)
!1680 = !DILocation(line: 85, column: 32, scope: !1639)
!1681 = !DILocation(line: 85, column: 3, scope: !1639)
!1682 = distinct !{!1682, !1640, !1683, !130}
!1683 = !DILocation(line: 94, column: 3, scope: !1635)
!1684 = !DILocation(line: 95, column: 1, scope: !1627)
!1685 = distinct !DISubprogram(name: "fqmul", scope: !58, file: !58, line: 68, type: !1686, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !53, retainedNodes: !49)
!1686 = !DISubroutineType(types: !1687)
!1687 = !{!61, !61, !61}
!1688 = !DILocalVariable(name: "a", arg: 1, scope: !1685, file: !58, line: 68, type: !61)
!1689 = !DILocation(line: 0, scope: !1685)
!1690 = !DILocalVariable(name: "b", arg: 2, scope: !1685, file: !58, line: 68, type: !61)
!1691 = !DILocation(line: 69, column: 28, scope: !1685)
!1692 = !DILocation(line: 69, column: 39, scope: !1685)
!1693 = !DILocation(line: 69, column: 38, scope: !1685)
!1694 = !DILocation(line: 69, column: 10, scope: !1685)
!1695 = !DILocation(line: 69, column: 3, scope: !1685)
!1696 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_invntt", scope: !58, file: !58, line: 106, type: !1628, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !53, retainedNodes: !49)
!1697 = !DILocalVariable(name: "r", arg: 1, scope: !1696, file: !58, line: 106, type: !448)
!1698 = !DILocation(line: 0, scope: !1696)
!1699 = !DILocalVariable(name: "f", scope: !1696, file: !58, line: 109, type: !60)
!1700 = !DILocalVariable(name: "k", scope: !1696, file: !58, line: 107, type: !40)
!1701 = !DILocalVariable(name: "len", scope: !1696, file: !58, line: 107, type: !40)
!1702 = !DILocation(line: 112, column: 7, scope: !1703)
!1703 = distinct !DILexicalBlock(scope: !1696, file: !58, line: 112, column: 3)
!1704 = !DILocation(line: 112, scope: !1703)
!1705 = !DILocation(line: 111, column: 5, scope: !1696)
!1706 = !DILocation(line: 112, column: 20, scope: !1707)
!1707 = distinct !DILexicalBlock(scope: !1703, file: !58, line: 112, column: 3)
!1708 = !DILocation(line: 112, column: 3, scope: !1703)
!1709 = !DILocation(line: 113, column: 5, scope: !1710)
!1710 = distinct !DILexicalBlock(scope: !1711, file: !58, line: 113, column: 5)
!1711 = distinct !DILexicalBlock(scope: !1707, file: !58, line: 112, column: 39)
!1712 = !DILocation(line: 124, column: 3, scope: !1713)
!1713 = distinct !DILexicalBlock(scope: !1696, file: !58, line: 124, column: 3)
!1714 = !DILocation(line: 113, scope: !1710)
!1715 = !DILocalVariable(name: "start", scope: !1696, file: !58, line: 107, type: !40)
!1716 = !DILocation(line: 113, column: 26, scope: !1717)
!1717 = distinct !DILexicalBlock(scope: !1710, file: !58, line: 113, column: 5)
!1718 = !DILocation(line: 114, column: 14, scope: !1719)
!1719 = distinct !DILexicalBlock(scope: !1717, file: !58, line: 113, column: 50)
!1720 = !DILocalVariable(name: "zeta", scope: !1696, file: !58, line: 108, type: !61)
!1721 = !DILocalVariable(name: "j", scope: !1696, file: !58, line: 107, type: !40)
!1722 = !DILocation(line: 115, column: 11, scope: !1723)
!1723 = distinct !DILexicalBlock(scope: !1719, file: !58, line: 115, column: 7)
!1724 = !DILocation(line: 115, scope: !1723)
!1725 = !DILocation(line: 115, column: 32, scope: !1726)
!1726 = distinct !DILexicalBlock(scope: !1723, file: !58, line: 115, column: 7)
!1727 = !DILocation(line: 115, column: 24, scope: !1726)
!1728 = !DILocation(line: 115, column: 7, scope: !1723)
!1729 = !DILocation(line: 116, column: 13, scope: !1730)
!1730 = distinct !DILexicalBlock(scope: !1726, file: !58, line: 115, column: 44)
!1731 = !DILocalVariable(name: "t", scope: !1696, file: !58, line: 108, type: !61)
!1732 = !DILocation(line: 117, column: 35, scope: !1730)
!1733 = !DILocation(line: 117, column: 33, scope: !1730)
!1734 = !DILocation(line: 117, column: 16, scope: !1730)
!1735 = !DILocation(line: 117, column: 9, scope: !1730)
!1736 = !DILocation(line: 117, column: 14, scope: !1730)
!1737 = !DILocation(line: 118, column: 22, scope: !1730)
!1738 = !DILocation(line: 118, column: 33, scope: !1730)
!1739 = !DILocation(line: 118, column: 9, scope: !1730)
!1740 = !DILocation(line: 118, column: 20, scope: !1730)
!1741 = !DILocation(line: 119, column: 34, scope: !1730)
!1742 = !DILocation(line: 119, column: 22, scope: !1730)
!1743 = !DILocation(line: 119, column: 9, scope: !1730)
!1744 = !DILocation(line: 119, column: 20, scope: !1730)
!1745 = !DILocation(line: 115, column: 40, scope: !1726)
!1746 = !DILocation(line: 115, column: 7, scope: !1726)
!1747 = distinct !{!1747, !1728, !1748, !130}
!1748 = !DILocation(line: 120, column: 7, scope: !1723)
!1749 = !DILocation(line: 114, column: 21, scope: !1719)
!1750 = !DILocation(line: 113, column: 43, scope: !1717)
!1751 = !DILocation(line: 113, column: 5, scope: !1717)
!1752 = distinct !{!1752, !1709, !1753, !130}
!1753 = !DILocation(line: 121, column: 5, scope: !1710)
!1754 = !DILocation(line: 112, column: 32, scope: !1707)
!1755 = !DILocation(line: 112, column: 3, scope: !1707)
!1756 = distinct !{!1756, !1708, !1757, !130}
!1757 = !DILocation(line: 122, column: 3, scope: !1703)
!1758 = !DILocation(line: 124, scope: !1713)
!1759 = !DILocation(line: 124, column: 16, scope: !1760)
!1760 = distinct !DILexicalBlock(scope: !1713, file: !58, line: 124, column: 3)
!1761 = !DILocation(line: 125, column: 18, scope: !1760)
!1762 = !DILocation(line: 125, column: 12, scope: !1760)
!1763 = !DILocation(line: 125, column: 5, scope: !1760)
!1764 = !DILocation(line: 125, column: 10, scope: !1760)
!1765 = !DILocation(line: 124, column: 24, scope: !1760)
!1766 = !DILocation(line: 124, column: 3, scope: !1760)
!1767 = distinct !{!1767, !1712, !1768, !130}
!1768 = !DILocation(line: 125, column: 25, scope: !1713)
!1769 = !DILocation(line: 126, column: 1, scope: !1696)
!1770 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_basemul", scope: !58, file: !58, line: 139, type: !1771, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !53, retainedNodes: !49)
!1771 = !DISubroutineType(types: !1772)
!1772 = !{null, !448, !1773, !1773, !61}
!1773 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 32)
!1774 = !DILocalVariable(name: "r", arg: 1, scope: !1770, file: !58, line: 139, type: !448)
!1775 = !DILocation(line: 0, scope: !1770)
!1776 = !DILocalVariable(name: "a", arg: 2, scope: !1770, file: !58, line: 139, type: !1773)
!1777 = !DILocalVariable(name: "b", arg: 3, scope: !1770, file: !58, line: 139, type: !1773)
!1778 = !DILocalVariable(name: "zeta", arg: 4, scope: !1770, file: !58, line: 139, type: !61)
!1779 = !DILocation(line: 141, column: 17, scope: !1770)
!1780 = !DILocation(line: 141, column: 23, scope: !1770)
!1781 = !DILocation(line: 141, column: 11, scope: !1770)
!1782 = !DILocation(line: 141, column: 9, scope: !1770)
!1783 = !DILocation(line: 142, column: 11, scope: !1770)
!1784 = !DILocation(line: 142, column: 9, scope: !1770)
!1785 = !DILocation(line: 143, column: 17, scope: !1770)
!1786 = !DILocation(line: 143, column: 23, scope: !1770)
!1787 = !DILocation(line: 143, column: 11, scope: !1770)
!1788 = !DILocation(line: 143, column: 8, scope: !1770)
!1789 = !DILocation(line: 144, column: 17, scope: !1770)
!1790 = !DILocation(line: 144, column: 23, scope: !1770)
!1791 = !DILocation(line: 144, column: 11, scope: !1770)
!1792 = !DILocation(line: 144, column: 3, scope: !1770)
!1793 = !DILocation(line: 144, column: 9, scope: !1770)
!1794 = !DILocation(line: 145, column: 17, scope: !1770)
!1795 = !DILocation(line: 145, column: 23, scope: !1770)
!1796 = !DILocation(line: 145, column: 11, scope: !1770)
!1797 = !DILocation(line: 145, column: 3, scope: !1770)
!1798 = !DILocation(line: 145, column: 8, scope: !1770)
!1799 = !DILocation(line: 146, column: 1, scope: !1770)
!1800 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_cbd_eta1", scope: !1801, file: !1801, line: 110, type: !1802, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !95, retainedNodes: !49)
!1801 = !DIFile(filename: "../../ref/cbd.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!1802 = !DISubroutineType(types: !1803)
!1803 = !{null, !1804, !272}
!1804 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1805, size: 32)
!1805 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !369, line: 13, baseType: !1806)
!1806 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !369, line: 11, size: 4096, elements: !1807)
!1807 = !{!1808}
!1808 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !1806, file: !369, line: 12, baseType: !373, size: 4096)
!1809 = !DILocalVariable(name: "r", arg: 1, scope: !1800, file: !1801, line: 110, type: !1804)
!1810 = !DILocation(line: 0, scope: !1800)
!1811 = !DILocalVariable(name: "buf", arg: 2, scope: !1800, file: !1801, line: 110, type: !272)
!1812 = !DILocation(line: 113, column: 3, scope: !1800)
!1813 = !DILocation(line: 119, column: 1, scope: !1800)
!1814 = distinct !DISubprogram(name: "cbd2", scope: !1801, file: !1801, line: 58, type: !1802, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !95, retainedNodes: !49)
!1815 = !DILocalVariable(name: "r", arg: 1, scope: !1814, file: !1801, line: 58, type: !1804)
!1816 = !DILocation(line: 0, scope: !1814)
!1817 = !DILocalVariable(name: "buf", arg: 2, scope: !1814, file: !1801, line: 58, type: !272)
!1818 = !DILocalVariable(name: "i", scope: !1814, file: !1801, line: 60, type: !40)
!1819 = !DILocation(line: 64, column: 7, scope: !1820)
!1820 = distinct !DILexicalBlock(scope: !1814, file: !1801, line: 64, column: 3)
!1821 = !DILocation(line: 64, scope: !1820)
!1822 = !DILocation(line: 64, column: 12, scope: !1823)
!1823 = distinct !DILexicalBlock(scope: !1820, file: !1801, line: 64, column: 3)
!1824 = !DILocation(line: 64, column: 3, scope: !1820)
!1825 = !DILocation(line: 65, column: 35, scope: !1826)
!1826 = distinct !DILexicalBlock(scope: !1823, file: !1801, line: 64, column: 28)
!1827 = !DILocation(line: 65, column: 33, scope: !1826)
!1828 = !DILocation(line: 65, column: 10, scope: !1826)
!1829 = !DILocalVariable(name: "t", scope: !1814, file: !1801, line: 61, type: !91)
!1830 = !DILocation(line: 66, column: 12, scope: !1826)
!1831 = !DILocalVariable(name: "d", scope: !1814, file: !1801, line: 61, type: !91)
!1832 = !DILocation(line: 67, column: 12, scope: !1826)
!1833 = !DILocation(line: 67, column: 17, scope: !1826)
!1834 = !DILocation(line: 67, column: 7, scope: !1826)
!1835 = !DILocalVariable(name: "j", scope: !1814, file: !1801, line: 60, type: !40)
!1836 = !DILocation(line: 69, column: 9, scope: !1837)
!1837 = distinct !DILexicalBlock(scope: !1826, file: !1801, line: 69, column: 5)
!1838 = !DILocation(line: 69, scope: !1837)
!1839 = !DILocation(line: 69, column: 14, scope: !1840)
!1840 = distinct !DILexicalBlock(scope: !1837, file: !1801, line: 69, column: 5)
!1841 = !DILocation(line: 69, column: 5, scope: !1837)
!1842 = !DILocation(line: 70, column: 19, scope: !1843)
!1843 = distinct !DILexicalBlock(scope: !1840, file: !1801, line: 69, column: 22)
!1844 = !DILocation(line: 70, column: 14, scope: !1843)
!1845 = !DILocation(line: 70, column: 11, scope: !1843)
!1846 = !DILocalVariable(name: "a", scope: !1814, file: !1801, line: 62, type: !61)
!1847 = !DILocation(line: 71, column: 19, scope: !1843)
!1848 = !DILocation(line: 71, column: 21, scope: !1843)
!1849 = !DILocation(line: 71, column: 14, scope: !1843)
!1850 = !DILocation(line: 71, column: 11, scope: !1843)
!1851 = !DILocalVariable(name: "b", scope: !1814, file: !1801, line: 62, type: !61)
!1852 = !DILocation(line: 72, column: 28, scope: !1843)
!1853 = !DILocation(line: 72, column: 26, scope: !1843)
!1854 = !DILocation(line: 72, column: 18, scope: !1843)
!1855 = !DILocation(line: 72, column: 20, scope: !1843)
!1856 = !DILocation(line: 72, column: 7, scope: !1843)
!1857 = !DILocation(line: 72, column: 24, scope: !1843)
!1858 = !DILocation(line: 69, column: 18, scope: !1840)
!1859 = !DILocation(line: 69, column: 5, scope: !1840)
!1860 = distinct !{!1860, !1841, !1861, !130}
!1861 = !DILocation(line: 73, column: 5, scope: !1837)
!1862 = !DILocation(line: 64, column: 24, scope: !1823)
!1863 = !DILocation(line: 64, column: 3, scope: !1823)
!1864 = distinct !{!1864, !1824, !1865, !130}
!1865 = !DILocation(line: 74, column: 3, scope: !1820)
!1866 = !DILocation(line: 75, column: 1, scope: !1814)
!1867 = distinct !DISubprogram(name: "load32_littleendian", scope: !1801, file: !1801, line: 15, type: !1868, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !95, retainedNodes: !49)
!1868 = !DISubroutineType(types: !1869)
!1869 = !{!91, !272}
!1870 = !DILocalVariable(name: "x", arg: 1, scope: !1867, file: !1801, line: 15, type: !272)
!1871 = !DILocation(line: 0, scope: !1867)
!1872 = !DILocation(line: 18, column: 18, scope: !1867)
!1873 = !DILocation(line: 18, column: 8, scope: !1867)
!1874 = !DILocalVariable(name: "r", scope: !1867, file: !1801, line: 17, type: !91)
!1875 = !DILocation(line: 19, column: 18, scope: !1867)
!1876 = !DILocation(line: 19, column: 8, scope: !1867)
!1877 = !DILocation(line: 19, column: 23, scope: !1867)
!1878 = !DILocation(line: 19, column: 5, scope: !1867)
!1879 = !DILocation(line: 20, column: 18, scope: !1867)
!1880 = !DILocation(line: 20, column: 8, scope: !1867)
!1881 = !DILocation(line: 20, column: 23, scope: !1867)
!1882 = !DILocation(line: 20, column: 5, scope: !1867)
!1883 = !DILocation(line: 21, column: 18, scope: !1867)
!1884 = !DILocation(line: 21, column: 8, scope: !1867)
!1885 = !DILocation(line: 21, column: 23, scope: !1867)
!1886 = !DILocation(line: 21, column: 5, scope: !1867)
!1887 = !DILocation(line: 22, column: 3, scope: !1867)
!1888 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_cbd_eta2", scope: !1801, file: !1801, line: 121, type: !1802, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !95, retainedNodes: !49)
!1889 = !DILocalVariable(name: "r", arg: 1, scope: !1888, file: !1801, line: 121, type: !1804)
!1890 = !DILocation(line: 0, scope: !1888)
!1891 = !DILocalVariable(name: "buf", arg: 2, scope: !1888, file: !1801, line: 121, type: !272)
!1892 = !DILocation(line: 124, column: 3, scope: !1888)
!1893 = !DILocation(line: 128, column: 1, scope: !1888)
!1894 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_montgomery_reduce", scope: !1895, file: !1895, line: 16, type: !1896, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !97, retainedNodes: !49)
!1895 = !DIFile(filename: "../../ref/reduce.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!1896 = !DISubroutineType(types: !98)
!1897 = !DILocalVariable(name: "a", arg: 1, scope: !1894, file: !1895, line: 16, type: !55)
!1898 = !DILocation(line: 0, scope: !1894)
!1899 = !DILocalVariable(name: "t", scope: !1894, file: !1895, line: 18, type: !61)
!1900 = !DILocation(line: 21, column: 12, scope: !1894)
!1901 = !DILocation(line: 21, column: 22, scope: !1894)
!1902 = !DILocation(line: 21, column: 10, scope: !1894)
!1903 = !DILocation(line: 21, column: 32, scope: !1894)
!1904 = !DILocation(line: 21, column: 7, scope: !1894)
!1905 = !DILocation(line: 22, column: 3, scope: !1894)
!1906 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_barrett_reduce", scope: !1895, file: !1895, line: 35, type: !1907, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !97, retainedNodes: !49)
!1907 = !DISubroutineType(types: !1908)
!1908 = !{!61, !61}
!1909 = !DILocalVariable(name: "a", arg: 1, scope: !1906, file: !1895, line: 35, type: !61)
!1910 = !DILocation(line: 0, scope: !1906)
!1911 = !DILocalVariable(name: "v", scope: !1906, file: !1895, line: 37, type: !60)
!1912 = !DILocation(line: 39, column: 20, scope: !1906)
!1913 = !DILocation(line: 39, column: 19, scope: !1906)
!1914 = !DILocation(line: 39, column: 22, scope: !1906)
!1915 = !DILocation(line: 39, column: 33, scope: !1906)
!1916 = !DILocalVariable(name: "t", scope: !1906, file: !1895, line: 36, type: !61)
!1917 = !DILocation(line: 41, column: 10, scope: !1906)
!1918 = !DILocation(line: 41, column: 3, scope: !1906)
!1919 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_verify", scope: !1920, file: !1920, line: 16, type: !1921, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !99, retainedNodes: !49)
!1920 = !DIFile(filename: "../../ref/verify.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!1921 = !DISubroutineType(types: !1922)
!1922 = !{!50, !272, !272, !38}
!1923 = !DILocalVariable(name: "a", arg: 1, scope: !1919, file: !1920, line: 16, type: !272)
!1924 = !DILocation(line: 0, scope: !1919)
!1925 = !DILocalVariable(name: "b", arg: 2, scope: !1919, file: !1920, line: 16, type: !272)
!1926 = !DILocalVariable(name: "len", arg: 3, scope: !1919, file: !1920, line: 16, type: !38)
!1927 = !DILocalVariable(name: "r", scope: !1919, file: !1920, line: 19, type: !33)
!1928 = !DILocalVariable(name: "i", scope: !1919, file: !1920, line: 18, type: !38)
!1929 = !DILocation(line: 21, column: 7, scope: !1930)
!1930 = distinct !DILexicalBlock(scope: !1919, file: !1920, line: 21, column: 3)
!1931 = !DILocation(line: 21, scope: !1930)
!1932 = !DILocation(line: 21, column: 12, scope: !1933)
!1933 = distinct !DILexicalBlock(scope: !1930, file: !1920, line: 21, column: 3)
!1934 = !DILocation(line: 21, column: 3, scope: !1930)
!1935 = !DILocation(line: 22, column: 10, scope: !1933)
!1936 = !DILocation(line: 22, column: 17, scope: !1933)
!1937 = !DILocation(line: 22, column: 15, scope: !1933)
!1938 = !DILocation(line: 22, column: 7, scope: !1933)
!1939 = !DILocation(line: 21, column: 18, scope: !1933)
!1940 = !DILocation(line: 21, column: 3, scope: !1933)
!1941 = distinct !{!1941, !1934, !1942, !130}
!1942 = !DILocation(line: 22, column: 20, scope: !1930)
!1943 = !DILocation(line: 24, column: 25, scope: !1919)
!1944 = !DILocation(line: 24, column: 10, scope: !1919)
!1945 = !DILocation(line: 24, column: 3, scope: !1919)
!1946 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_cmov", scope: !1920, file: !1920, line: 40, type: !1947, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !99, retainedNodes: !49)
!1947 = !DISubroutineType(types: !1948)
!1948 = !{null, !32, !272, !38, !33}
!1949 = !DILocalVariable(name: "r", arg: 1, scope: !1946, file: !1920, line: 40, type: !32)
!1950 = !DILocation(line: 0, scope: !1946)
!1951 = !DILocalVariable(name: "x", arg: 2, scope: !1946, file: !1920, line: 40, type: !272)
!1952 = !DILocalVariable(name: "len", arg: 3, scope: !1946, file: !1920, line: 40, type: !38)
!1953 = !DILocalVariable(name: "b", arg: 4, scope: !1946, file: !1920, line: 40, type: !33)
!1954 = !DILocation(line: 51, column: 3, scope: !1946)
!1955 = !{i64 1722}
!1956 = !DILocation(line: 54, column: 7, scope: !1946)
!1957 = !DILocalVariable(name: "i", scope: !1946, file: !1920, line: 42, type: !38)
!1958 = !DILocation(line: 55, column: 7, scope: !1959)
!1959 = distinct !DILexicalBlock(scope: !1946, file: !1920, line: 55, column: 3)
!1960 = !DILocation(line: 55, scope: !1959)
!1961 = !DILocation(line: 55, column: 12, scope: !1962)
!1962 = distinct !DILexicalBlock(scope: !1959, file: !1920, line: 55, column: 3)
!1963 = !DILocation(line: 55, column: 3, scope: !1959)
!1964 = !DILocation(line: 56, column: 18, scope: !1962)
!1965 = !DILocation(line: 56, column: 25, scope: !1962)
!1966 = !DILocation(line: 56, column: 23, scope: !1962)
!1967 = !DILocation(line: 56, column: 15, scope: !1962)
!1968 = !DILocation(line: 56, column: 5, scope: !1962)
!1969 = !DILocation(line: 56, column: 10, scope: !1962)
!1970 = !DILocation(line: 55, column: 18, scope: !1962)
!1971 = !DILocation(line: 55, column: 3, scope: !1962)
!1972 = distinct !{!1972, !1963, !1973, !130}
!1973 = !DILocation(line: 56, column: 29, scope: !1959)
!1974 = !DILocation(line: 57, column: 1, scope: !1946)
!1975 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_cmov_int16", scope: !1920, file: !1920, line: 71, type: !1976, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !99, retainedNodes: !49)
!1976 = !DISubroutineType(types: !1977)
!1977 = !{null, !448, !61, !86}
!1978 = !DILocalVariable(name: "r", arg: 1, scope: !1975, file: !1920, line: 71, type: !448)
!1979 = !DILocation(line: 0, scope: !1975)
!1980 = !DILocalVariable(name: "v", arg: 2, scope: !1975, file: !1920, line: 71, type: !61)
!1981 = !DILocalVariable(name: "b", arg: 3, scope: !1975, file: !1920, line: 71, type: !86)
!1982 = !DILocation(line: 73, column: 7, scope: !1975)
!1983 = !DILocation(line: 74, column: 15, scope: !1975)
!1984 = !DILocation(line: 74, column: 19, scope: !1975)
!1985 = !DILocation(line: 74, column: 11, scope: !1975)
!1986 = !DILocation(line: 74, column: 6, scope: !1975)
!1987 = !DILocation(line: 75, column: 1, scope: !1975)
!1988 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_init", scope: !74, file: !74, line: 523, type: !1989, scopeLine: 524, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!1989 = !DISubroutineType(types: !1990)
!1990 = !{null, !1991}
!1991 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1992, size: 32)
!1992 = !DIDerivedType(tag: DW_TAG_typedef, name: "keccak_state", file: !391, line: 17, baseType: !1993)
!1993 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !391, line: 14, size: 1664, elements: !1994)
!1994 = !{!1995, !1996}
!1995 = !DIDerivedType(tag: DW_TAG_member, name: "s", scope: !1993, file: !391, line: 15, baseType: !395, size: 1600)
!1996 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !1993, file: !391, line: 16, baseType: !40, size: 32, offset: 1600)
!1997 = !DILocalVariable(name: "state", arg: 1, scope: !1988, file: !74, line: 523, type: !1991)
!1998 = !DILocation(line: 0, scope: !1988)
!1999 = !DILocation(line: 525, column: 3, scope: !1988)
!2000 = !DILocation(line: 526, column: 10, scope: !1988)
!2001 = !DILocation(line: 526, column: 14, scope: !1988)
!2002 = !DILocation(line: 527, column: 1, scope: !1988)
!2003 = distinct !DISubprogram(name: "keccak_init", scope: !74, file: !74, line: 353, type: !2004, scopeLine: 354, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2004 = !DISubroutineType(types: !2005)
!2005 = !{null, !2006}
!2006 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 32)
!2007 = !DILocalVariable(name: "s", arg: 1, scope: !2003, file: !74, line: 353, type: !2006)
!2008 = !DILocation(line: 0, scope: !2003)
!2009 = !DILocalVariable(name: "i", scope: !2003, file: !74, line: 355, type: !40)
!2010 = !DILocation(line: 356, column: 7, scope: !2011)
!2011 = distinct !DILexicalBlock(scope: !2003, file: !74, line: 356, column: 3)
!2012 = !DILocation(line: 356, scope: !2011)
!2013 = !DILocation(line: 356, column: 12, scope: !2014)
!2014 = distinct !DILexicalBlock(scope: !2011, file: !74, line: 356, column: 3)
!2015 = !DILocation(line: 356, column: 3, scope: !2011)
!2016 = !DILocation(line: 357, column: 5, scope: !2014)
!2017 = !DILocation(line: 357, column: 10, scope: !2014)
!2018 = !DILocation(line: 356, column: 17, scope: !2014)
!2019 = !DILocation(line: 356, column: 3, scope: !2014)
!2020 = distinct !{!2020, !2015, !2021, !130}
!2021 = !DILocation(line: 357, column: 12, scope: !2011)
!2022 = !DILocation(line: 358, column: 1, scope: !2003)
!2023 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb", scope: !74, file: !74, line: 538, type: !2024, scopeLine: 539, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2024 = !DISubroutineType(types: !2025)
!2025 = !{null, !1991, !272, !38}
!2026 = !DILocalVariable(name: "state", arg: 1, scope: !2023, file: !74, line: 538, type: !1991)
!2027 = !DILocation(line: 0, scope: !2023)
!2028 = !DILocalVariable(name: "in", arg: 2, scope: !2023, file: !74, line: 538, type: !272)
!2029 = !DILocalVariable(name: "inlen", arg: 3, scope: !2023, file: !74, line: 538, type: !38)
!2030 = !DILocation(line: 540, column: 47, scope: !2023)
!2031 = !DILocation(line: 540, column: 16, scope: !2023)
!2032 = !DILocation(line: 540, column: 10, scope: !2023)
!2033 = !DILocation(line: 540, column: 14, scope: !2023)
!2034 = !DILocation(line: 541, column: 1, scope: !2023)
!2035 = distinct !DISubprogram(name: "keccak_absorb", scope: !74, file: !74, line: 373, type: !2036, scopeLine: 378, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2036 = !DISubroutineType(types: !2037)
!2037 = !{!40, !2006, !40, !40, !272, !38}
!2038 = !DILocalVariable(name: "s", arg: 1, scope: !2035, file: !74, line: 373, type: !2006)
!2039 = !DILocation(line: 0, scope: !2035)
!2040 = !DILocalVariable(name: "pos", arg: 2, scope: !2035, file: !74, line: 374, type: !40)
!2041 = !DILocalVariable(name: "r", arg: 3, scope: !2035, file: !74, line: 375, type: !40)
!2042 = !DILocalVariable(name: "in", arg: 4, scope: !2035, file: !74, line: 376, type: !272)
!2043 = !DILocalVariable(name: "inlen", arg: 5, scope: !2035, file: !74, line: 377, type: !38)
!2044 = !DILocation(line: 381, column: 3, scope: !2035)
!2045 = !DILocation(line: 381, column: 12, scope: !2035)
!2046 = !DILocation(line: 381, column: 19, scope: !2035)
!2047 = !DILocation(line: 382, column: 5, scope: !2048)
!2048 = distinct !DILexicalBlock(scope: !2049, file: !74, line: 382, column: 5)
!2049 = distinct !DILexicalBlock(scope: !2035, file: !74, line: 381, column: 25)
!2050 = !DILocation(line: 389, column: 3, scope: !2051)
!2051 = distinct !DILexicalBlock(scope: !2035, file: !74, line: 389, column: 3)
!2052 = !DILocation(line: 382, scope: !2048)
!2053 = !DILocalVariable(name: "i", scope: !2035, file: !74, line: 379, type: !40)
!2054 = !DILocation(line: 382, column: 16, scope: !2055)
!2055 = distinct !DILexicalBlock(scope: !2048, file: !74, line: 382, column: 5)
!2056 = !DILocation(line: 383, column: 27, scope: !2055)
!2057 = !DILocation(line: 383, column: 17, scope: !2055)
!2058 = !DILocation(line: 383, column: 37, scope: !2055)
!2059 = !DILocation(line: 383, column: 33, scope: !2055)
!2060 = !DILocation(line: 383, column: 10, scope: !2055)
!2061 = !DILocation(line: 383, column: 7, scope: !2055)
!2062 = !DILocation(line: 383, column: 14, scope: !2055)
!2063 = !DILocation(line: 383, column: 30, scope: !2055)
!2064 = !DILocation(line: 382, column: 20, scope: !2055)
!2065 = !DILocation(line: 382, column: 5, scope: !2055)
!2066 = distinct !{!2066, !2047, !2067, !130}
!2067 = !DILocation(line: 383, column: 42, scope: !2048)
!2068 = !DILocation(line: 384, column: 15, scope: !2049)
!2069 = !DILocation(line: 384, column: 11, scope: !2049)
!2070 = !DILocation(line: 385, column: 5, scope: !2049)
!2071 = distinct !{!2071, !2044, !2072, !130}
!2072 = !DILocation(line: 387, column: 3, scope: !2035)
!2073 = !DILocation(line: 389, scope: !2051)
!2074 = !DILocation(line: 389, column: 18, scope: !2075)
!2075 = distinct !DILexicalBlock(scope: !2051, file: !74, line: 389, column: 3)
!2076 = !DILocation(line: 389, column: 14, scope: !2075)
!2077 = !DILocation(line: 390, column: 25, scope: !2075)
!2078 = !DILocation(line: 390, column: 15, scope: !2075)
!2079 = !DILocation(line: 390, column: 35, scope: !2075)
!2080 = !DILocation(line: 390, column: 31, scope: !2075)
!2081 = !DILocation(line: 390, column: 8, scope: !2075)
!2082 = !DILocation(line: 390, column: 5, scope: !2075)
!2083 = !DILocation(line: 390, column: 12, scope: !2075)
!2084 = !DILocation(line: 390, column: 28, scope: !2075)
!2085 = !DILocation(line: 389, column: 26, scope: !2075)
!2086 = !DILocation(line: 389, column: 3, scope: !2075)
!2087 = distinct !{!2087, !2050, !2088, !130}
!2088 = !DILocation(line: 390, column: 40, scope: !2051)
!2089 = !DILocation(line: 392, column: 3, scope: !2035)
!2090 = distinct !DISubprogram(name: "KeccakF1600_StatePermute", scope: !74, file: !74, line: 82, type: !2004, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2091 = !DILocalVariable(name: "state", arg: 1, scope: !2090, file: !74, line: 82, type: !2006)
!2092 = !DILocation(line: 0, scope: !2090)
!2093 = !DILocation(line: 100, column: 15, scope: !2090)
!2094 = !DILocalVariable(name: "Aba", scope: !2090, file: !74, line: 86, type: !70)
!2095 = !DILocation(line: 101, column: 15, scope: !2090)
!2096 = !DILocalVariable(name: "Abe", scope: !2090, file: !74, line: 86, type: !70)
!2097 = !DILocation(line: 102, column: 15, scope: !2090)
!2098 = !DILocalVariable(name: "Abi", scope: !2090, file: !74, line: 86, type: !70)
!2099 = !DILocation(line: 103, column: 15, scope: !2090)
!2100 = !DILocalVariable(name: "Abo", scope: !2090, file: !74, line: 86, type: !70)
!2101 = !DILocation(line: 104, column: 15, scope: !2090)
!2102 = !DILocalVariable(name: "Abu", scope: !2090, file: !74, line: 86, type: !70)
!2103 = !DILocation(line: 105, column: 15, scope: !2090)
!2104 = !DILocalVariable(name: "Aga", scope: !2090, file: !74, line: 87, type: !70)
!2105 = !DILocation(line: 106, column: 15, scope: !2090)
!2106 = !DILocalVariable(name: "Age", scope: !2090, file: !74, line: 87, type: !70)
!2107 = !DILocation(line: 107, column: 15, scope: !2090)
!2108 = !DILocalVariable(name: "Agi", scope: !2090, file: !74, line: 87, type: !70)
!2109 = !DILocation(line: 108, column: 15, scope: !2090)
!2110 = !DILocalVariable(name: "Ago", scope: !2090, file: !74, line: 87, type: !70)
!2111 = !DILocation(line: 109, column: 15, scope: !2090)
!2112 = !DILocalVariable(name: "Agu", scope: !2090, file: !74, line: 87, type: !70)
!2113 = !DILocation(line: 110, column: 15, scope: !2090)
!2114 = !DILocalVariable(name: "Aka", scope: !2090, file: !74, line: 88, type: !70)
!2115 = !DILocation(line: 111, column: 15, scope: !2090)
!2116 = !DILocalVariable(name: "Ake", scope: !2090, file: !74, line: 88, type: !70)
!2117 = !DILocation(line: 112, column: 15, scope: !2090)
!2118 = !DILocalVariable(name: "Aki", scope: !2090, file: !74, line: 88, type: !70)
!2119 = !DILocation(line: 113, column: 15, scope: !2090)
!2120 = !DILocalVariable(name: "Ako", scope: !2090, file: !74, line: 88, type: !70)
!2121 = !DILocation(line: 114, column: 15, scope: !2090)
!2122 = !DILocalVariable(name: "Aku", scope: !2090, file: !74, line: 88, type: !70)
!2123 = !DILocation(line: 115, column: 15, scope: !2090)
!2124 = !DILocalVariable(name: "Ama", scope: !2090, file: !74, line: 89, type: !70)
!2125 = !DILocation(line: 116, column: 15, scope: !2090)
!2126 = !DILocalVariable(name: "Ame", scope: !2090, file: !74, line: 89, type: !70)
!2127 = !DILocation(line: 117, column: 15, scope: !2090)
!2128 = !DILocalVariable(name: "Ami", scope: !2090, file: !74, line: 89, type: !70)
!2129 = !DILocation(line: 118, column: 15, scope: !2090)
!2130 = !DILocalVariable(name: "Amo", scope: !2090, file: !74, line: 89, type: !70)
!2131 = !DILocation(line: 119, column: 15, scope: !2090)
!2132 = !DILocalVariable(name: "Amu", scope: !2090, file: !74, line: 89, type: !70)
!2133 = !DILocation(line: 120, column: 15, scope: !2090)
!2134 = !DILocalVariable(name: "Asa", scope: !2090, file: !74, line: 90, type: !70)
!2135 = !DILocation(line: 121, column: 15, scope: !2090)
!2136 = !DILocalVariable(name: "Ase", scope: !2090, file: !74, line: 90, type: !70)
!2137 = !DILocation(line: 122, column: 15, scope: !2090)
!2138 = !DILocalVariable(name: "Asi", scope: !2090, file: !74, line: 90, type: !70)
!2139 = !DILocation(line: 123, column: 15, scope: !2090)
!2140 = !DILocalVariable(name: "Aso", scope: !2090, file: !74, line: 90, type: !70)
!2141 = !DILocation(line: 124, column: 15, scope: !2090)
!2142 = !DILocalVariable(name: "Asu", scope: !2090, file: !74, line: 90, type: !70)
!2143 = !DILocalVariable(name: "round", scope: !2090, file: !74, line: 84, type: !50)
!2144 = !DILocation(line: 126, column: 13, scope: !2145)
!2145 = distinct !DILexicalBlock(scope: !2090, file: !74, line: 126, column: 9)
!2146 = !DILocation(line: 126, scope: !2145)
!2147 = !DILocation(line: 126, column: 30, scope: !2148)
!2148 = distinct !DILexicalBlock(scope: !2145, file: !74, line: 126, column: 9)
!2149 = !DILocation(line: 126, column: 9, scope: !2145)
!2150 = !DILocalVariable(name: "BCa", scope: !2090, file: !74, line: 91, type: !70)
!2151 = !DILocalVariable(name: "BCe", scope: !2090, file: !74, line: 91, type: !70)
!2152 = !DILocalVariable(name: "BCi", scope: !2090, file: !74, line: 91, type: !70)
!2153 = !DILocalVariable(name: "BCo", scope: !2090, file: !74, line: 91, type: !70)
!2154 = !DILocalVariable(name: "BCu", scope: !2090, file: !74, line: 91, type: !70)
!2155 = !DILocalVariable(name: "Da", scope: !2090, file: !74, line: 92, type: !70)
!2156 = !DILocalVariable(name: "De", scope: !2090, file: !74, line: 92, type: !70)
!2157 = !DILocalVariable(name: "Di", scope: !2090, file: !74, line: 92, type: !70)
!2158 = !DILocalVariable(name: "Do", scope: !2090, file: !74, line: 92, type: !70)
!2159 = !DILocalVariable(name: "Du", scope: !2090, file: !74, line: 92, type: !70)
!2160 = !DILocalVariable(name: "Eba", scope: !2090, file: !74, line: 93, type: !70)
!2161 = !DILocalVariable(name: "Ebe", scope: !2090, file: !74, line: 93, type: !70)
!2162 = !DILocalVariable(name: "Ebi", scope: !2090, file: !74, line: 93, type: !70)
!2163 = !DILocalVariable(name: "Ebo", scope: !2090, file: !74, line: 93, type: !70)
!2164 = !DILocalVariable(name: "Ebu", scope: !2090, file: !74, line: 93, type: !70)
!2165 = !DILocalVariable(name: "Ega", scope: !2090, file: !74, line: 94, type: !70)
!2166 = !DILocalVariable(name: "Ege", scope: !2090, file: !74, line: 94, type: !70)
!2167 = !DILocalVariable(name: "Egi", scope: !2090, file: !74, line: 94, type: !70)
!2168 = !DILocalVariable(name: "Ego", scope: !2090, file: !74, line: 94, type: !70)
!2169 = !DILocalVariable(name: "Egu", scope: !2090, file: !74, line: 94, type: !70)
!2170 = !DILocalVariable(name: "Eka", scope: !2090, file: !74, line: 95, type: !70)
!2171 = !DILocalVariable(name: "Eke", scope: !2090, file: !74, line: 95, type: !70)
!2172 = !DILocalVariable(name: "Eki", scope: !2090, file: !74, line: 95, type: !70)
!2173 = !DILocalVariable(name: "Eko", scope: !2090, file: !74, line: 95, type: !70)
!2174 = !DILocalVariable(name: "Eku", scope: !2090, file: !74, line: 95, type: !70)
!2175 = !DILocalVariable(name: "Ema", scope: !2090, file: !74, line: 96, type: !70)
!2176 = !DILocalVariable(name: "Eme", scope: !2090, file: !74, line: 96, type: !70)
!2177 = !DILocalVariable(name: "Emi", scope: !2090, file: !74, line: 96, type: !70)
!2178 = !DILocalVariable(name: "Emo", scope: !2090, file: !74, line: 96, type: !70)
!2179 = !DILocalVariable(name: "Emu", scope: !2090, file: !74, line: 96, type: !70)
!2180 = !DILocalVariable(name: "Esa", scope: !2090, file: !74, line: 97, type: !70)
!2181 = !DILocalVariable(name: "Ese", scope: !2090, file: !74, line: 97, type: !70)
!2182 = !DILocalVariable(name: "Esi", scope: !2090, file: !74, line: 97, type: !70)
!2183 = !DILocalVariable(name: "Eso", scope: !2090, file: !74, line: 97, type: !70)
!2184 = !DILocalVariable(name: "Esu", scope: !2090, file: !74, line: 97, type: !70)
!2185 = !DILocation(line: 130, column: 22, scope: !2186)
!2186 = distinct !DILexicalBlock(scope: !2148, file: !74, line: 126, column: 53)
!2187 = !DILocation(line: 130, column: 26, scope: !2186)
!2188 = !DILocation(line: 130, column: 30, scope: !2186)
!2189 = !DILocation(line: 130, column: 34, scope: !2186)
!2190 = !DILocation(line: 132, column: 22, scope: !2186)
!2191 = !DILocation(line: 132, column: 26, scope: !2186)
!2192 = !DILocation(line: 132, column: 30, scope: !2186)
!2193 = !DILocation(line: 132, column: 34, scope: !2186)
!2194 = !DILocation(line: 138, column: 22, scope: !2186)
!2195 = !DILocation(line: 138, column: 21, scope: !2186)
!2196 = !DILocation(line: 208, column: 17, scope: !2186)
!2197 = !DILocation(line: 209, column: 19, scope: !2186)
!2198 = !DILocation(line: 129, column: 22, scope: !2186)
!2199 = !DILocation(line: 129, column: 26, scope: !2186)
!2200 = !DILocation(line: 129, column: 30, scope: !2186)
!2201 = !DILocation(line: 129, column: 34, scope: !2186)
!2202 = !DILocation(line: 135, column: 22, scope: !2186)
!2203 = !DILocation(line: 135, column: 21, scope: !2186)
!2204 = !DILocation(line: 212, column: 17, scope: !2186)
!2205 = !DILocation(line: 213, column: 19, scope: !2186)
!2206 = !DILocation(line: 131, column: 22, scope: !2186)
!2207 = !DILocation(line: 131, column: 26, scope: !2186)
!2208 = !DILocation(line: 131, column: 30, scope: !2186)
!2209 = !DILocation(line: 131, column: 34, scope: !2186)
!2210 = !DILocation(line: 128, column: 22, scope: !2186)
!2211 = !DILocation(line: 128, column: 26, scope: !2186)
!2212 = !DILocation(line: 128, column: 30, scope: !2186)
!2213 = !DILocation(line: 128, column: 34, scope: !2186)
!2214 = !DILocation(line: 139, column: 22, scope: !2186)
!2215 = !DILocation(line: 139, column: 21, scope: !2186)
!2216 = !DILocation(line: 210, column: 17, scope: !2186)
!2217 = !DILocation(line: 211, column: 19, scope: !2186)
!2218 = !DILocation(line: 217, column: 28, scope: !2186)
!2219 = !DILocation(line: 217, column: 33, scope: !2186)
!2220 = !DILocation(line: 217, column: 25, scope: !2186)
!2221 = !DILocation(line: 137, column: 22, scope: !2186)
!2222 = !DILocation(line: 137, column: 21, scope: !2186)
!2223 = !DILocation(line: 145, column: 17, scope: !2186)
!2224 = !DILocation(line: 146, column: 19, scope: !2186)
!2225 = !DILocation(line: 136, column: 22, scope: !2186)
!2226 = !DILocation(line: 136, column: 21, scope: !2186)
!2227 = !DILocation(line: 143, column: 17, scope: !2186)
!2228 = !DILocation(line: 144, column: 19, scope: !2186)
!2229 = !DILocation(line: 151, column: 28, scope: !2186)
!2230 = !DILocation(line: 151, column: 33, scope: !2186)
!2231 = !DILocation(line: 152, column: 30, scope: !2186)
!2232 = !DILocation(line: 152, column: 17, scope: !2186)
!2233 = !DILocation(line: 141, column: 17, scope: !2186)
!2234 = !DILocation(line: 158, column: 17, scope: !2186)
!2235 = !DILocation(line: 159, column: 19, scope: !2186)
!2236 = !DILocation(line: 162, column: 17, scope: !2186)
!2237 = !DILocation(line: 163, column: 19, scope: !2186)
!2238 = !DILocation(line: 160, column: 17, scope: !2186)
!2239 = !DILocation(line: 161, column: 19, scope: !2186)
!2240 = !DILocation(line: 168, column: 28, scope: !2186)
!2241 = !DILocation(line: 168, column: 33, scope: !2186)
!2242 = !DILocation(line: 168, column: 25, scope: !2186)
!2243 = !DILocation(line: 223, column: 22, scope: !2186)
!2244 = !DILocation(line: 174, column: 17, scope: !2186)
!2245 = !DILocation(line: 175, column: 19, scope: !2186)
!2246 = !DILocation(line: 178, column: 17, scope: !2186)
!2247 = !DILocation(line: 179, column: 19, scope: !2186)
!2248 = !DILocation(line: 176, column: 17, scope: !2186)
!2249 = !DILocation(line: 177, column: 19, scope: !2186)
!2250 = !DILocation(line: 184, column: 28, scope: !2186)
!2251 = !DILocation(line: 184, column: 33, scope: !2186)
!2252 = !DILocation(line: 184, column: 25, scope: !2186)
!2253 = !DILocation(line: 223, column: 26, scope: !2186)
!2254 = !DILocation(line: 190, column: 17, scope: !2186)
!2255 = !DILocation(line: 191, column: 19, scope: !2186)
!2256 = !DILocation(line: 194, column: 17, scope: !2186)
!2257 = !DILocation(line: 195, column: 19, scope: !2186)
!2258 = !DILocation(line: 192, column: 17, scope: !2186)
!2259 = !DILocation(line: 193, column: 19, scope: !2186)
!2260 = !DILocation(line: 200, column: 28, scope: !2186)
!2261 = !DILocation(line: 200, column: 33, scope: !2186)
!2262 = !DILocation(line: 200, column: 25, scope: !2186)
!2263 = !DILocation(line: 223, column: 30, scope: !2186)
!2264 = !DILocation(line: 206, column: 17, scope: !2186)
!2265 = !DILocation(line: 207, column: 19, scope: !2186)
!2266 = !DILocation(line: 216, column: 28, scope: !2186)
!2267 = !DILocation(line: 216, column: 33, scope: !2186)
!2268 = !DILocation(line: 216, column: 25, scope: !2186)
!2269 = !DILocation(line: 223, column: 34, scope: !2186)
!2270 = !DILocation(line: 149, column: 17, scope: !2186)
!2271 = !DILocation(line: 150, column: 19, scope: !2186)
!2272 = !DILocation(line: 147, column: 17, scope: !2186)
!2273 = !DILocation(line: 148, column: 19, scope: !2186)
!2274 = !DILocation(line: 154, column: 28, scope: !2186)
!2275 = !DILocation(line: 154, column: 33, scope: !2186)
!2276 = !DILocation(line: 154, column: 25, scope: !2186)
!2277 = !DILocation(line: 166, column: 17, scope: !2186)
!2278 = !DILocation(line: 167, column: 19, scope: !2186)
!2279 = !DILocation(line: 164, column: 17, scope: !2186)
!2280 = !DILocation(line: 165, column: 19, scope: !2186)
!2281 = !DILocation(line: 170, column: 28, scope: !2186)
!2282 = !DILocation(line: 170, column: 33, scope: !2186)
!2283 = !DILocation(line: 170, column: 25, scope: !2186)
!2284 = !DILocation(line: 225, column: 22, scope: !2186)
!2285 = !DILocation(line: 182, column: 17, scope: !2186)
!2286 = !DILocation(line: 183, column: 19, scope: !2186)
!2287 = !DILocation(line: 180, column: 17, scope: !2186)
!2288 = !DILocation(line: 181, column: 19, scope: !2186)
!2289 = !DILocation(line: 186, column: 28, scope: !2186)
!2290 = !DILocation(line: 186, column: 33, scope: !2186)
!2291 = !DILocation(line: 186, column: 25, scope: !2186)
!2292 = !DILocation(line: 225, column: 26, scope: !2186)
!2293 = !DILocation(line: 198, column: 17, scope: !2186)
!2294 = !DILocation(line: 199, column: 19, scope: !2186)
!2295 = !DILocation(line: 196, column: 17, scope: !2186)
!2296 = !DILocation(line: 197, column: 19, scope: !2186)
!2297 = !DILocation(line: 202, column: 28, scope: !2186)
!2298 = !DILocation(line: 202, column: 33, scope: !2186)
!2299 = !DILocation(line: 202, column: 25, scope: !2186)
!2300 = !DILocation(line: 225, column: 30, scope: !2186)
!2301 = !DILocation(line: 214, column: 17, scope: !2186)
!2302 = !DILocation(line: 215, column: 19, scope: !2186)
!2303 = !DILocation(line: 218, column: 28, scope: !2186)
!2304 = !DILocation(line: 218, column: 33, scope: !2186)
!2305 = !DILocation(line: 218, column: 25, scope: !2186)
!2306 = !DILocation(line: 225, column: 34, scope: !2186)
!2307 = !DILocation(line: 231, column: 22, scope: !2186)
!2308 = !DILocation(line: 231, column: 21, scope: !2186)
!2309 = !DILocation(line: 309, column: 17, scope: !2186)
!2310 = !DILocation(line: 310, column: 19, scope: !2186)
!2311 = !DILocation(line: 171, column: 28, scope: !2186)
!2312 = !DILocation(line: 171, column: 33, scope: !2186)
!2313 = !DILocation(line: 171, column: 25, scope: !2186)
!2314 = !DILocation(line: 156, column: 28, scope: !2186)
!2315 = !DILocation(line: 156, column: 33, scope: !2186)
!2316 = !DILocation(line: 156, column: 25, scope: !2186)
!2317 = !DILocation(line: 172, column: 28, scope: !2186)
!2318 = !DILocation(line: 172, column: 33, scope: !2186)
!2319 = !DILocation(line: 172, column: 25, scope: !2186)
!2320 = !DILocation(line: 227, column: 22, scope: !2186)
!2321 = !DILocation(line: 188, column: 28, scope: !2186)
!2322 = !DILocation(line: 188, column: 33, scope: !2186)
!2323 = !DILocation(line: 188, column: 25, scope: !2186)
!2324 = !DILocation(line: 227, column: 26, scope: !2186)
!2325 = !DILocation(line: 204, column: 28, scope: !2186)
!2326 = !DILocation(line: 204, column: 33, scope: !2186)
!2327 = !DILocation(line: 204, column: 25, scope: !2186)
!2328 = !DILocation(line: 227, column: 30, scope: !2186)
!2329 = !DILocation(line: 220, column: 28, scope: !2186)
!2330 = !DILocation(line: 220, column: 33, scope: !2186)
!2331 = !DILocation(line: 220, column: 25, scope: !2186)
!2332 = !DILocation(line: 227, column: 34, scope: !2186)
!2333 = !DILocation(line: 233, column: 22, scope: !2186)
!2334 = !DILocation(line: 233, column: 21, scope: !2186)
!2335 = !DILocation(line: 303, column: 17, scope: !2186)
!2336 = !DILocation(line: 304, column: 19, scope: !2186)
!2337 = !DILocation(line: 153, column: 28, scope: !2186)
!2338 = !DILocation(line: 153, column: 33, scope: !2186)
!2339 = !DILocation(line: 153, column: 25, scope: !2186)
!2340 = !DILocation(line: 169, column: 28, scope: !2186)
!2341 = !DILocation(line: 169, column: 33, scope: !2186)
!2342 = !DILocation(line: 169, column: 25, scope: !2186)
!2343 = !DILocation(line: 224, column: 22, scope: !2186)
!2344 = !DILocation(line: 185, column: 28, scope: !2186)
!2345 = !DILocation(line: 185, column: 33, scope: !2186)
!2346 = !DILocation(line: 185, column: 25, scope: !2186)
!2347 = !DILocation(line: 224, column: 26, scope: !2186)
!2348 = !DILocation(line: 201, column: 28, scope: !2186)
!2349 = !DILocation(line: 201, column: 33, scope: !2186)
!2350 = !DILocation(line: 201, column: 25, scope: !2186)
!2351 = !DILocation(line: 224, column: 30, scope: !2186)
!2352 = !DILocation(line: 224, column: 34, scope: !2186)
!2353 = !DILocation(line: 155, column: 28, scope: !2186)
!2354 = !DILocation(line: 155, column: 33, scope: !2186)
!2355 = !DILocation(line: 155, column: 25, scope: !2186)
!2356 = !DILocation(line: 226, column: 22, scope: !2186)
!2357 = !DILocation(line: 187, column: 28, scope: !2186)
!2358 = !DILocation(line: 187, column: 33, scope: !2186)
!2359 = !DILocation(line: 187, column: 25, scope: !2186)
!2360 = !DILocation(line: 226, column: 26, scope: !2186)
!2361 = !DILocation(line: 203, column: 28, scope: !2186)
!2362 = !DILocation(line: 203, column: 33, scope: !2186)
!2363 = !DILocation(line: 203, column: 25, scope: !2186)
!2364 = !DILocation(line: 226, column: 30, scope: !2186)
!2365 = !DILocation(line: 219, column: 28, scope: !2186)
!2366 = !DILocation(line: 219, column: 33, scope: !2186)
!2367 = !DILocation(line: 219, column: 25, scope: !2186)
!2368 = !DILocation(line: 226, column: 34, scope: !2186)
!2369 = !DILocation(line: 232, column: 22, scope: !2186)
!2370 = !DILocation(line: 232, column: 21, scope: !2186)
!2371 = !DILocation(line: 301, column: 17, scope: !2186)
!2372 = !DILocation(line: 302, column: 19, scope: !2186)
!2373 = !DILocation(line: 315, column: 28, scope: !2186)
!2374 = !DILocation(line: 315, column: 33, scope: !2186)
!2375 = !DILocation(line: 315, column: 25, scope: !2186)
!2376 = !DILocation(line: 230, column: 22, scope: !2186)
!2377 = !DILocation(line: 230, column: 21, scope: !2186)
!2378 = !DILocation(line: 307, column: 17, scope: !2186)
!2379 = !DILocation(line: 308, column: 19, scope: !2186)
!2380 = !DILocation(line: 314, column: 28, scope: !2186)
!2381 = !DILocation(line: 314, column: 33, scope: !2186)
!2382 = !DILocation(line: 314, column: 25, scope: !2186)
!2383 = !DILocation(line: 234, column: 22, scope: !2186)
!2384 = !DILocation(line: 234, column: 21, scope: !2186)
!2385 = !DILocation(line: 305, column: 17, scope: !2186)
!2386 = !DILocation(line: 306, column: 19, scope: !2186)
!2387 = !DILocation(line: 313, column: 28, scope: !2186)
!2388 = !DILocation(line: 313, column: 33, scope: !2186)
!2389 = !DILocation(line: 313, column: 25, scope: !2186)
!2390 = !DILocation(line: 312, column: 28, scope: !2186)
!2391 = !DILocation(line: 312, column: 33, scope: !2186)
!2392 = !DILocation(line: 312, column: 25, scope: !2186)
!2393 = !DILocation(line: 311, column: 28, scope: !2186)
!2394 = !DILocation(line: 311, column: 33, scope: !2186)
!2395 = !DILocation(line: 311, column: 25, scope: !2186)
!2396 = !DILocation(line: 293, column: 17, scope: !2186)
!2397 = !DILocation(line: 294, column: 19, scope: !2186)
!2398 = !DILocation(line: 287, column: 17, scope: !2186)
!2399 = !DILocation(line: 288, column: 19, scope: !2186)
!2400 = !DILocation(line: 285, column: 17, scope: !2186)
!2401 = !DILocation(line: 286, column: 19, scope: !2186)
!2402 = !DILocation(line: 299, column: 28, scope: !2186)
!2403 = !DILocation(line: 299, column: 33, scope: !2186)
!2404 = !DILocation(line: 299, column: 25, scope: !2186)
!2405 = !DILocation(line: 291, column: 17, scope: !2186)
!2406 = !DILocation(line: 292, column: 19, scope: !2186)
!2407 = !DILocation(line: 298, column: 28, scope: !2186)
!2408 = !DILocation(line: 298, column: 33, scope: !2186)
!2409 = !DILocation(line: 298, column: 25, scope: !2186)
!2410 = !DILocation(line: 289, column: 17, scope: !2186)
!2411 = !DILocation(line: 290, column: 19, scope: !2186)
!2412 = !DILocation(line: 297, column: 28, scope: !2186)
!2413 = !DILocation(line: 297, column: 33, scope: !2186)
!2414 = !DILocation(line: 297, column: 25, scope: !2186)
!2415 = !DILocation(line: 296, column: 28, scope: !2186)
!2416 = !DILocation(line: 296, column: 33, scope: !2186)
!2417 = !DILocation(line: 296, column: 25, scope: !2186)
!2418 = !DILocation(line: 295, column: 28, scope: !2186)
!2419 = !DILocation(line: 295, column: 33, scope: !2186)
!2420 = !DILocation(line: 295, column: 25, scope: !2186)
!2421 = !DILocation(line: 277, column: 17, scope: !2186)
!2422 = !DILocation(line: 278, column: 19, scope: !2186)
!2423 = !DILocation(line: 271, column: 17, scope: !2186)
!2424 = !DILocation(line: 272, column: 19, scope: !2186)
!2425 = !DILocation(line: 269, column: 17, scope: !2186)
!2426 = !DILocation(line: 270, column: 19, scope: !2186)
!2427 = !DILocation(line: 283, column: 28, scope: !2186)
!2428 = !DILocation(line: 283, column: 33, scope: !2186)
!2429 = !DILocation(line: 283, column: 25, scope: !2186)
!2430 = !DILocation(line: 275, column: 17, scope: !2186)
!2431 = !DILocation(line: 276, column: 19, scope: !2186)
!2432 = !DILocation(line: 282, column: 28, scope: !2186)
!2433 = !DILocation(line: 282, column: 33, scope: !2186)
!2434 = !DILocation(line: 282, column: 25, scope: !2186)
!2435 = !DILocation(line: 273, column: 17, scope: !2186)
!2436 = !DILocation(line: 274, column: 19, scope: !2186)
!2437 = !DILocation(line: 281, column: 28, scope: !2186)
!2438 = !DILocation(line: 281, column: 33, scope: !2186)
!2439 = !DILocation(line: 281, column: 25, scope: !2186)
!2440 = !DILocation(line: 280, column: 28, scope: !2186)
!2441 = !DILocation(line: 280, column: 33, scope: !2186)
!2442 = !DILocation(line: 280, column: 25, scope: !2186)
!2443 = !DILocation(line: 279, column: 28, scope: !2186)
!2444 = !DILocation(line: 279, column: 33, scope: !2186)
!2445 = !DILocation(line: 279, column: 25, scope: !2186)
!2446 = !DILocation(line: 261, column: 17, scope: !2186)
!2447 = !DILocation(line: 262, column: 19, scope: !2186)
!2448 = !DILocation(line: 255, column: 17, scope: !2186)
!2449 = !DILocation(line: 256, column: 19, scope: !2186)
!2450 = !DILocation(line: 253, column: 17, scope: !2186)
!2451 = !DILocation(line: 254, column: 19, scope: !2186)
!2452 = !DILocation(line: 267, column: 28, scope: !2186)
!2453 = !DILocation(line: 267, column: 33, scope: !2186)
!2454 = !DILocation(line: 267, column: 25, scope: !2186)
!2455 = !DILocation(line: 259, column: 17, scope: !2186)
!2456 = !DILocation(line: 260, column: 19, scope: !2186)
!2457 = !DILocation(line: 266, column: 28, scope: !2186)
!2458 = !DILocation(line: 266, column: 33, scope: !2186)
!2459 = !DILocation(line: 266, column: 25, scope: !2186)
!2460 = !DILocation(line: 257, column: 17, scope: !2186)
!2461 = !DILocation(line: 258, column: 19, scope: !2186)
!2462 = !DILocation(line: 265, column: 28, scope: !2186)
!2463 = !DILocation(line: 265, column: 33, scope: !2186)
!2464 = !DILocation(line: 265, column: 25, scope: !2186)
!2465 = !DILocation(line: 264, column: 28, scope: !2186)
!2466 = !DILocation(line: 264, column: 33, scope: !2186)
!2467 = !DILocation(line: 264, column: 25, scope: !2186)
!2468 = !DILocation(line: 263, column: 28, scope: !2186)
!2469 = !DILocation(line: 263, column: 33, scope: !2186)
!2470 = !DILocation(line: 263, column: 25, scope: !2186)
!2471 = !DILocation(line: 244, column: 17, scope: !2186)
!2472 = !DILocation(line: 245, column: 19, scope: !2186)
!2473 = !DILocation(line: 238, column: 17, scope: !2186)
!2474 = !DILocation(line: 239, column: 19, scope: !2186)
!2475 = !DILocation(line: 236, column: 17, scope: !2186)
!2476 = !DILocation(line: 251, column: 28, scope: !2186)
!2477 = !DILocation(line: 251, column: 33, scope: !2186)
!2478 = !DILocation(line: 251, column: 25, scope: !2186)
!2479 = !DILocation(line: 242, column: 17, scope: !2186)
!2480 = !DILocation(line: 243, column: 19, scope: !2186)
!2481 = !DILocation(line: 250, column: 28, scope: !2186)
!2482 = !DILocation(line: 250, column: 33, scope: !2186)
!2483 = !DILocation(line: 250, column: 25, scope: !2186)
!2484 = !DILocation(line: 240, column: 17, scope: !2186)
!2485 = !DILocation(line: 241, column: 19, scope: !2186)
!2486 = !DILocation(line: 249, column: 28, scope: !2186)
!2487 = !DILocation(line: 249, column: 33, scope: !2186)
!2488 = !DILocation(line: 249, column: 25, scope: !2186)
!2489 = !DILocation(line: 248, column: 28, scope: !2186)
!2490 = !DILocation(line: 248, column: 33, scope: !2186)
!2491 = !DILocation(line: 248, column: 25, scope: !2186)
!2492 = !DILocation(line: 247, column: 58, scope: !2186)
!2493 = !DILocation(line: 247, column: 30, scope: !2186)
!2494 = !DILocation(line: 246, column: 28, scope: !2186)
!2495 = !DILocation(line: 246, column: 33, scope: !2186)
!2496 = !DILocation(line: 247, column: 17, scope: !2186)
!2497 = !DILocation(line: 126, column: 47, scope: !2148)
!2498 = !DILocation(line: 126, column: 9, scope: !2148)
!2499 = distinct !{!2499, !2149, !2500, !130}
!2500 = !DILocation(line: 316, column: 9, scope: !2145)
!2501 = !DILocation(line: 319, column: 19, scope: !2090)
!2502 = !DILocation(line: 320, column: 9, scope: !2090)
!2503 = !DILocation(line: 320, column: 19, scope: !2090)
!2504 = !DILocation(line: 321, column: 9, scope: !2090)
!2505 = !DILocation(line: 321, column: 19, scope: !2090)
!2506 = !DILocation(line: 322, column: 9, scope: !2090)
!2507 = !DILocation(line: 322, column: 19, scope: !2090)
!2508 = !DILocation(line: 323, column: 9, scope: !2090)
!2509 = !DILocation(line: 323, column: 19, scope: !2090)
!2510 = !DILocation(line: 324, column: 9, scope: !2090)
!2511 = !DILocation(line: 324, column: 19, scope: !2090)
!2512 = !DILocation(line: 325, column: 9, scope: !2090)
!2513 = !DILocation(line: 325, column: 19, scope: !2090)
!2514 = !DILocation(line: 326, column: 9, scope: !2090)
!2515 = !DILocation(line: 326, column: 19, scope: !2090)
!2516 = !DILocation(line: 327, column: 9, scope: !2090)
!2517 = !DILocation(line: 327, column: 19, scope: !2090)
!2518 = !DILocation(line: 328, column: 9, scope: !2090)
!2519 = !DILocation(line: 328, column: 19, scope: !2090)
!2520 = !DILocation(line: 329, column: 9, scope: !2090)
!2521 = !DILocation(line: 329, column: 19, scope: !2090)
!2522 = !DILocation(line: 330, column: 9, scope: !2090)
!2523 = !DILocation(line: 330, column: 19, scope: !2090)
!2524 = !DILocation(line: 331, column: 9, scope: !2090)
!2525 = !DILocation(line: 331, column: 19, scope: !2090)
!2526 = !DILocation(line: 332, column: 9, scope: !2090)
!2527 = !DILocation(line: 332, column: 19, scope: !2090)
!2528 = !DILocation(line: 333, column: 9, scope: !2090)
!2529 = !DILocation(line: 333, column: 19, scope: !2090)
!2530 = !DILocation(line: 334, column: 9, scope: !2090)
!2531 = !DILocation(line: 334, column: 19, scope: !2090)
!2532 = !DILocation(line: 335, column: 9, scope: !2090)
!2533 = !DILocation(line: 335, column: 19, scope: !2090)
!2534 = !DILocation(line: 336, column: 9, scope: !2090)
!2535 = !DILocation(line: 336, column: 19, scope: !2090)
!2536 = !DILocation(line: 337, column: 9, scope: !2090)
!2537 = !DILocation(line: 337, column: 19, scope: !2090)
!2538 = !DILocation(line: 338, column: 9, scope: !2090)
!2539 = !DILocation(line: 338, column: 19, scope: !2090)
!2540 = !DILocation(line: 339, column: 9, scope: !2090)
!2541 = !DILocation(line: 339, column: 19, scope: !2090)
!2542 = !DILocation(line: 340, column: 9, scope: !2090)
!2543 = !DILocation(line: 340, column: 19, scope: !2090)
!2544 = !DILocation(line: 341, column: 9, scope: !2090)
!2545 = !DILocation(line: 341, column: 19, scope: !2090)
!2546 = !DILocation(line: 342, column: 9, scope: !2090)
!2547 = !DILocation(line: 342, column: 19, scope: !2090)
!2548 = !DILocation(line: 343, column: 9, scope: !2090)
!2549 = !DILocation(line: 343, column: 19, scope: !2090)
!2550 = !DILocation(line: 344, column: 1, scope: !2090)
!2551 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_finalize", scope: !74, file: !74, line: 550, type: !1989, scopeLine: 551, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2552 = !DILocalVariable(name: "state", arg: 1, scope: !2551, file: !74, line: 550, type: !1991)
!2553 = !DILocation(line: 0, scope: !2551)
!2554 = !DILocation(line: 552, column: 36, scope: !2551)
!2555 = !DILocation(line: 552, column: 3, scope: !2551)
!2556 = !DILocation(line: 553, column: 10, scope: !2551)
!2557 = !DILocation(line: 553, column: 14, scope: !2551)
!2558 = !DILocation(line: 554, column: 1, scope: !2551)
!2559 = distinct !DISubprogram(name: "keccak_finalize", scope: !74, file: !74, line: 405, type: !2560, scopeLine: 406, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2560 = !DISubroutineType(types: !2561)
!2561 = !{null, !2006, !40, !40, !33}
!2562 = !DILocalVariable(name: "s", arg: 1, scope: !2559, file: !74, line: 405, type: !2006)
!2563 = !DILocation(line: 0, scope: !2559)
!2564 = !DILocalVariable(name: "pos", arg: 2, scope: !2559, file: !74, line: 405, type: !40)
!2565 = !DILocalVariable(name: "r", arg: 3, scope: !2559, file: !74, line: 405, type: !40)
!2566 = !DILocalVariable(name: "p", arg: 4, scope: !2559, file: !74, line: 405, type: !33)
!2567 = !DILocation(line: 407, column: 15, scope: !2559)
!2568 = !DILocation(line: 407, column: 31, scope: !2559)
!2569 = !DILocation(line: 407, column: 27, scope: !2559)
!2570 = !DILocation(line: 407, column: 8, scope: !2559)
!2571 = !DILocation(line: 407, column: 3, scope: !2559)
!2572 = !DILocation(line: 407, column: 12, scope: !2559)
!2573 = !DILocation(line: 408, column: 6, scope: !2559)
!2574 = !DILocation(line: 408, column: 3, scope: !2559)
!2575 = !DILocation(line: 408, column: 12, scope: !2559)
!2576 = !DILocation(line: 409, column: 1, scope: !2559)
!2577 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeeze", scope: !74, file: !74, line: 566, type: !2578, scopeLine: 567, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2578 = !DISubroutineType(types: !2579)
!2579 = !{null, !32, !38, !1991}
!2580 = !DILocalVariable(name: "out", arg: 1, scope: !2577, file: !74, line: 566, type: !32)
!2581 = !DILocation(line: 0, scope: !2577)
!2582 = !DILocalVariable(name: "outlen", arg: 2, scope: !2577, file: !74, line: 566, type: !38)
!2583 = !DILocalVariable(name: "state", arg: 3, scope: !2577, file: !74, line: 566, type: !1991)
!2584 = !DILocation(line: 568, column: 61, scope: !2577)
!2585 = !DILocation(line: 568, column: 16, scope: !2577)
!2586 = !DILocation(line: 568, column: 10, scope: !2577)
!2587 = !DILocation(line: 568, column: 14, scope: !2577)
!2588 = !DILocation(line: 569, column: 1, scope: !2577)
!2589 = distinct !DISubprogram(name: "keccak_squeeze", scope: !74, file: !74, line: 426, type: !2590, scopeLine: 431, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2590 = !DISubroutineType(types: !2591)
!2591 = !{!40, !32, !38, !2006, !40, !40}
!2592 = !DILocalVariable(name: "out", arg: 1, scope: !2589, file: !74, line: 426, type: !32)
!2593 = !DILocation(line: 0, scope: !2589)
!2594 = !DILocalVariable(name: "outlen", arg: 2, scope: !2589, file: !74, line: 427, type: !38)
!2595 = !DILocalVariable(name: "s", arg: 3, scope: !2589, file: !74, line: 428, type: !2006)
!2596 = !DILocalVariable(name: "pos", arg: 4, scope: !2589, file: !74, line: 429, type: !40)
!2597 = !DILocalVariable(name: "r", arg: 5, scope: !2589, file: !74, line: 430, type: !40)
!2598 = !DILocation(line: 434, column: 3, scope: !2589)
!2599 = !DILocation(line: 435, column: 12, scope: !2600)
!2600 = distinct !DILexicalBlock(scope: !2601, file: !74, line: 435, column: 8)
!2601 = distinct !DILexicalBlock(scope: !2589, file: !74, line: 434, column: 17)
!2602 = !DILocation(line: 436, column: 7, scope: !2603)
!2603 = distinct !DILexicalBlock(scope: !2600, file: !74, line: 435, column: 18)
!2604 = !DILocation(line: 438, column: 5, scope: !2603)
!2605 = !DILocalVariable(name: "i", scope: !2589, file: !74, line: 432, type: !40)
!2606 = !DILocation(line: 439, column: 9, scope: !2607)
!2607 = distinct !DILexicalBlock(scope: !2601, file: !74, line: 439, column: 5)
!2608 = !DILocation(line: 439, scope: !2607)
!2609 = !DILocation(line: 439, column: 17, scope: !2610)
!2610 = distinct !DILexicalBlock(scope: !2607, file: !74, line: 439, column: 5)
!2611 = !DILocation(line: 439, column: 21, scope: !2610)
!2612 = !DILocation(line: 439, column: 5, scope: !2607)
!2613 = !DILocation(line: 440, column: 19, scope: !2610)
!2614 = !DILocation(line: 440, column: 16, scope: !2610)
!2615 = !DILocation(line: 440, column: 27, scope: !2610)
!2616 = !DILocation(line: 440, column: 23, scope: !2610)
!2617 = !DILocation(line: 440, column: 14, scope: !2610)
!2618 = !DILocation(line: 440, column: 11, scope: !2610)
!2619 = !DILocation(line: 439, column: 41, scope: !2610)
!2620 = !DILocation(line: 439, column: 5, scope: !2610)
!2621 = distinct !{!2621, !2612, !2622, !130}
!2622 = !DILocation(line: 440, column: 32, scope: !2607)
!2623 = !DILocation(line: 441, column: 16, scope: !2601)
!2624 = !DILocation(line: 441, column: 12, scope: !2601)
!2625 = distinct !{!2625, !2598, !2626, !130}
!2626 = !DILocation(line: 443, column: 3, scope: !2589)
!2627 = !DILocation(line: 445, column: 3, scope: !2589)
!2628 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb_once", scope: !74, file: !74, line: 580, type: !2024, scopeLine: 581, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2629 = !DILocalVariable(name: "state", arg: 1, scope: !2628, file: !74, line: 580, type: !1991)
!2630 = !DILocation(line: 0, scope: !2628)
!2631 = !DILocalVariable(name: "in", arg: 2, scope: !2628, file: !74, line: 580, type: !272)
!2632 = !DILocalVariable(name: "inlen", arg: 3, scope: !2628, file: !74, line: 580, type: !38)
!2633 = !DILocation(line: 582, column: 3, scope: !2628)
!2634 = !DILocation(line: 583, column: 10, scope: !2628)
!2635 = !DILocation(line: 583, column: 14, scope: !2628)
!2636 = !DILocation(line: 584, column: 1, scope: !2628)
!2637 = distinct !DISubprogram(name: "keccak_absorb_once", scope: !74, file: !74, line: 461, type: !2638, scopeLine: 466, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2638 = !DISubroutineType(types: !2639)
!2639 = !{null, !2006, !40, !272, !38, !33}
!2640 = !DILocalVariable(name: "s", arg: 1, scope: !2637, file: !74, line: 461, type: !2006)
!2641 = !DILocation(line: 0, scope: !2637)
!2642 = !DILocalVariable(name: "r", arg: 2, scope: !2637, file: !74, line: 462, type: !40)
!2643 = !DILocalVariable(name: "in", arg: 3, scope: !2637, file: !74, line: 463, type: !272)
!2644 = !DILocalVariable(name: "inlen", arg: 4, scope: !2637, file: !74, line: 464, type: !38)
!2645 = !DILocalVariable(name: "p", arg: 5, scope: !2637, file: !74, line: 465, type: !33)
!2646 = !DILocalVariable(name: "i", scope: !2637, file: !74, line: 467, type: !40)
!2647 = !DILocation(line: 469, column: 7, scope: !2648)
!2648 = distinct !DILexicalBlock(scope: !2637, file: !74, line: 469, column: 3)
!2649 = !DILocation(line: 469, scope: !2648)
!2650 = !DILocation(line: 469, column: 12, scope: !2651)
!2651 = distinct !DILexicalBlock(scope: !2648, file: !74, line: 469, column: 3)
!2652 = !DILocation(line: 469, column: 3, scope: !2648)
!2653 = !DILocation(line: 472, column: 3, scope: !2637)
!2654 = !DILocation(line: 470, column: 5, scope: !2651)
!2655 = !DILocation(line: 470, column: 10, scope: !2651)
!2656 = !DILocation(line: 469, column: 17, scope: !2651)
!2657 = !DILocation(line: 469, column: 3, scope: !2651)
!2658 = distinct !{!2658, !2652, !2659, !130}
!2659 = !DILocation(line: 470, column: 12, scope: !2648)
!2660 = !DILocation(line: 472, column: 15, scope: !2637)
!2661 = !DILocation(line: 473, column: 5, scope: !2662)
!2662 = distinct !DILexicalBlock(scope: !2663, file: !74, line: 473, column: 5)
!2663 = distinct !DILexicalBlock(scope: !2637, file: !74, line: 472, column: 21)
!2664 = !DILocation(line: 480, column: 3, scope: !2665)
!2665 = distinct !DILexicalBlock(scope: !2637, file: !74, line: 480, column: 3)
!2666 = !DILocation(line: 473, scope: !2662)
!2667 = !DILocation(line: 473, column: 14, scope: !2668)
!2668 = distinct !DILexicalBlock(scope: !2662, file: !74, line: 473, column: 5)
!2669 = !DILocation(line: 474, column: 26, scope: !2668)
!2670 = !DILocation(line: 474, column: 24, scope: !2668)
!2671 = !DILocation(line: 474, column: 15, scope: !2668)
!2672 = !DILocation(line: 474, column: 7, scope: !2668)
!2673 = !DILocation(line: 474, column: 12, scope: !2668)
!2674 = !DILocation(line: 473, column: 20, scope: !2668)
!2675 = !DILocation(line: 473, column: 5, scope: !2668)
!2676 = distinct !{!2676, !2661, !2677, !130}
!2677 = !DILocation(line: 474, column: 28, scope: !2662)
!2678 = !DILocation(line: 475, column: 8, scope: !2663)
!2679 = !DILocation(line: 476, column: 11, scope: !2663)
!2680 = !DILocation(line: 477, column: 5, scope: !2663)
!2681 = distinct !{!2681, !2653, !2682, !130}
!2682 = !DILocation(line: 478, column: 3, scope: !2637)
!2683 = !DILocation(line: 480, scope: !2665)
!2684 = !DILocation(line: 480, column: 12, scope: !2685)
!2685 = distinct !DILexicalBlock(scope: !2665, file: !74, line: 480, column: 3)
!2686 = !DILocation(line: 481, column: 25, scope: !2685)
!2687 = !DILocation(line: 481, column: 15, scope: !2685)
!2688 = !DILocation(line: 481, column: 35, scope: !2685)
!2689 = !DILocation(line: 481, column: 31, scope: !2685)
!2690 = !DILocation(line: 481, column: 8, scope: !2685)
!2691 = !DILocation(line: 481, column: 5, scope: !2685)
!2692 = !DILocation(line: 481, column: 12, scope: !2685)
!2693 = !DILocation(line: 480, column: 20, scope: !2685)
!2694 = !DILocation(line: 480, column: 3, scope: !2685)
!2695 = distinct !{!2695, !2664, !2696, !130}
!2696 = !DILocation(line: 481, column: 40, scope: !2665)
!2697 = !DILocation(line: 483, column: 13, scope: !2637)
!2698 = !DILocation(line: 483, column: 29, scope: !2637)
!2699 = !DILocation(line: 483, column: 25, scope: !2637)
!2700 = !DILocation(line: 483, column: 6, scope: !2637)
!2701 = !DILocation(line: 483, column: 3, scope: !2637)
!2702 = !DILocation(line: 483, column: 10, scope: !2637)
!2703 = !DILocation(line: 484, column: 7, scope: !2637)
!2704 = !DILocation(line: 484, column: 10, scope: !2637)
!2705 = !DILocation(line: 484, column: 3, scope: !2637)
!2706 = !DILocation(line: 484, column: 14, scope: !2637)
!2707 = !DILocation(line: 485, column: 1, scope: !2637)
!2708 = distinct !DISubprogram(name: "load64", scope: !74, file: !74, line: 22, type: !2709, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2709 = !DISubroutineType(types: !2710)
!2710 = !{!70, !272}
!2711 = !DILocalVariable(name: "x", arg: 1, scope: !2708, file: !74, line: 22, type: !272)
!2712 = !DILocation(line: 0, scope: !2708)
!2713 = !DILocalVariable(name: "r", scope: !2708, file: !74, line: 24, type: !70)
!2714 = !DILocalVariable(name: "i", scope: !2708, file: !74, line: 23, type: !40)
!2715 = !DILocation(line: 26, column: 7, scope: !2716)
!2716 = distinct !DILexicalBlock(scope: !2708, file: !74, line: 26, column: 3)
!2717 = !DILocation(line: 26, scope: !2716)
!2718 = !DILocation(line: 26, column: 12, scope: !2719)
!2719 = distinct !DILexicalBlock(scope: !2716, file: !74, line: 26, column: 3)
!2720 = !DILocation(line: 26, column: 3, scope: !2716)
!2721 = !DILocation(line: 27, column: 20, scope: !2719)
!2722 = !DILocation(line: 27, column: 10, scope: !2719)
!2723 = !DILocation(line: 27, column: 29, scope: !2719)
!2724 = !DILocation(line: 27, column: 25, scope: !2719)
!2725 = !DILocation(line: 27, column: 7, scope: !2719)
!2726 = !DILocation(line: 26, column: 16, scope: !2719)
!2727 = !DILocation(line: 26, column: 3, scope: !2719)
!2728 = distinct !{!2728, !2720, !2729, !130}
!2729 = !DILocation(line: 27, column: 30, scope: !2716)
!2730 = !DILocation(line: 29, column: 3, scope: !2708)
!2731 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeezeblocks", scope: !74, file: !74, line: 598, type: !2578, scopeLine: 599, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2732 = !DILocalVariable(name: "out", arg: 1, scope: !2731, file: !74, line: 598, type: !32)
!2733 = !DILocation(line: 0, scope: !2731)
!2734 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2731, file: !74, line: 598, type: !38)
!2735 = !DILocalVariable(name: "state", arg: 3, scope: !2731, file: !74, line: 598, type: !1991)
!2736 = !DILocation(line: 600, column: 3, scope: !2731)
!2737 = !DILocation(line: 601, column: 1, scope: !2731)
!2738 = distinct !DISubprogram(name: "keccak_squeezeblocks", scope: !74, file: !74, line: 500, type: !2739, scopeLine: 504, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2739 = !DISubroutineType(types: !2740)
!2740 = !{null, !32, !38, !2006, !40}
!2741 = !DILocalVariable(name: "out", arg: 1, scope: !2738, file: !74, line: 500, type: !32)
!2742 = !DILocation(line: 0, scope: !2738)
!2743 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2738, file: !74, line: 501, type: !38)
!2744 = !DILocalVariable(name: "s", arg: 3, scope: !2738, file: !74, line: 502, type: !2006)
!2745 = !DILocalVariable(name: "r", arg: 4, scope: !2738, file: !74, line: 503, type: !40)
!2746 = !DILocation(line: 507, column: 3, scope: !2738)
!2747 = !DILocation(line: 508, column: 5, scope: !2748)
!2748 = distinct !DILexicalBlock(scope: !2738, file: !74, line: 507, column: 18)
!2749 = !DILocalVariable(name: "i", scope: !2738, file: !74, line: 505, type: !40)
!2750 = !DILocation(line: 509, column: 9, scope: !2751)
!2751 = distinct !DILexicalBlock(scope: !2748, file: !74, line: 509, column: 5)
!2752 = !DILocation(line: 509, scope: !2751)
!2753 = !DILocation(line: 509, column: 14, scope: !2754)
!2754 = distinct !DILexicalBlock(scope: !2751, file: !74, line: 509, column: 5)
!2755 = !DILocation(line: 509, column: 5, scope: !2751)
!2756 = !DILocation(line: 510, column: 20, scope: !2754)
!2757 = !DILocation(line: 510, column: 18, scope: !2754)
!2758 = !DILocation(line: 510, column: 24, scope: !2754)
!2759 = !DILocation(line: 510, column: 7, scope: !2754)
!2760 = !DILocation(line: 509, column: 20, scope: !2754)
!2761 = !DILocation(line: 509, column: 5, scope: !2754)
!2762 = distinct !{!2762, !2755, !2763, !130}
!2763 = !DILocation(line: 510, column: 28, scope: !2751)
!2764 = !DILocation(line: 511, column: 9, scope: !2748)
!2765 = !DILocation(line: 512, column: 13, scope: !2748)
!2766 = distinct !{!2766, !2746, !2767, !130}
!2767 = !DILocation(line: 513, column: 3, scope: !2738)
!2768 = !DILocation(line: 514, column: 1, scope: !2738)
!2769 = distinct !DISubprogram(name: "store64", scope: !74, file: !74, line: 40, type: !2770, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2770 = !DISubroutineType(types: !2771)
!2771 = !{null, !32, !70}
!2772 = !DILocalVariable(name: "x", arg: 1, scope: !2769, file: !74, line: 40, type: !32)
!2773 = !DILocation(line: 0, scope: !2769)
!2774 = !DILocalVariable(name: "u", arg: 2, scope: !2769, file: !74, line: 40, type: !70)
!2775 = !DILocalVariable(name: "i", scope: !2769, file: !74, line: 41, type: !40)
!2776 = !DILocation(line: 43, column: 7, scope: !2777)
!2777 = distinct !DILexicalBlock(scope: !2769, file: !74, line: 43, column: 3)
!2778 = !DILocation(line: 43, scope: !2777)
!2779 = !DILocation(line: 43, column: 12, scope: !2780)
!2780 = distinct !DILexicalBlock(scope: !2777, file: !74, line: 43, column: 3)
!2781 = !DILocation(line: 43, column: 3, scope: !2777)
!2782 = !DILocation(line: 44, column: 18, scope: !2780)
!2783 = !DILocation(line: 44, column: 14, scope: !2780)
!2784 = !DILocation(line: 44, column: 12, scope: !2780)
!2785 = !DILocation(line: 44, column: 5, scope: !2780)
!2786 = !DILocation(line: 44, column: 10, scope: !2780)
!2787 = !DILocation(line: 43, column: 16, scope: !2780)
!2788 = !DILocation(line: 43, column: 3, scope: !2780)
!2789 = distinct !{!2789, !2781, !2790, !130}
!2790 = !DILocation(line: 44, column: 19, scope: !2777)
!2791 = !DILocation(line: 45, column: 1, scope: !2769)
!2792 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_init", scope: !74, file: !74, line: 610, type: !1989, scopeLine: 611, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2793 = !DILocalVariable(name: "state", arg: 1, scope: !2792, file: !74, line: 610, type: !1991)
!2794 = !DILocation(line: 0, scope: !2792)
!2795 = !DILocation(line: 612, column: 3, scope: !2792)
!2796 = !DILocation(line: 613, column: 10, scope: !2792)
!2797 = !DILocation(line: 613, column: 14, scope: !2792)
!2798 = !DILocation(line: 614, column: 1, scope: !2792)
!2799 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb", scope: !74, file: !74, line: 625, type: !2024, scopeLine: 626, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2800 = !DILocalVariable(name: "state", arg: 1, scope: !2799, file: !74, line: 625, type: !1991)
!2801 = !DILocation(line: 0, scope: !2799)
!2802 = !DILocalVariable(name: "in", arg: 2, scope: !2799, file: !74, line: 625, type: !272)
!2803 = !DILocalVariable(name: "inlen", arg: 3, scope: !2799, file: !74, line: 625, type: !38)
!2804 = !DILocation(line: 627, column: 47, scope: !2799)
!2805 = !DILocation(line: 627, column: 16, scope: !2799)
!2806 = !DILocation(line: 627, column: 10, scope: !2799)
!2807 = !DILocation(line: 627, column: 14, scope: !2799)
!2808 = !DILocation(line: 628, column: 1, scope: !2799)
!2809 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_finalize", scope: !74, file: !74, line: 637, type: !1989, scopeLine: 638, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2810 = !DILocalVariable(name: "state", arg: 1, scope: !2809, file: !74, line: 637, type: !1991)
!2811 = !DILocation(line: 0, scope: !2809)
!2812 = !DILocation(line: 639, column: 36, scope: !2809)
!2813 = !DILocation(line: 639, column: 3, scope: !2809)
!2814 = !DILocation(line: 640, column: 10, scope: !2809)
!2815 = !DILocation(line: 640, column: 14, scope: !2809)
!2816 = !DILocation(line: 641, column: 1, scope: !2809)
!2817 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeeze", scope: !74, file: !74, line: 653, type: !2578, scopeLine: 654, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2818 = !DILocalVariable(name: "out", arg: 1, scope: !2817, file: !74, line: 653, type: !32)
!2819 = !DILocation(line: 0, scope: !2817)
!2820 = !DILocalVariable(name: "outlen", arg: 2, scope: !2817, file: !74, line: 653, type: !38)
!2821 = !DILocalVariable(name: "state", arg: 3, scope: !2817, file: !74, line: 653, type: !1991)
!2822 = !DILocation(line: 655, column: 61, scope: !2817)
!2823 = !DILocation(line: 655, column: 16, scope: !2817)
!2824 = !DILocation(line: 655, column: 10, scope: !2817)
!2825 = !DILocation(line: 655, column: 14, scope: !2817)
!2826 = !DILocation(line: 656, column: 1, scope: !2817)
!2827 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb_once", scope: !74, file: !74, line: 667, type: !2024, scopeLine: 668, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2828 = !DILocalVariable(name: "state", arg: 1, scope: !2827, file: !74, line: 667, type: !1991)
!2829 = !DILocation(line: 0, scope: !2827)
!2830 = !DILocalVariable(name: "in", arg: 2, scope: !2827, file: !74, line: 667, type: !272)
!2831 = !DILocalVariable(name: "inlen", arg: 3, scope: !2827, file: !74, line: 667, type: !38)
!2832 = !DILocation(line: 669, column: 3, scope: !2827)
!2833 = !DILocation(line: 670, column: 10, scope: !2827)
!2834 = !DILocation(line: 670, column: 14, scope: !2827)
!2835 = !DILocation(line: 671, column: 1, scope: !2827)
!2836 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeezeblocks", scope: !74, file: !74, line: 685, type: !2578, scopeLine: 686, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2837 = !DILocalVariable(name: "out", arg: 1, scope: !2836, file: !74, line: 685, type: !32)
!2838 = !DILocation(line: 0, scope: !2836)
!2839 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2836, file: !74, line: 685, type: !38)
!2840 = !DILocalVariable(name: "state", arg: 3, scope: !2836, file: !74, line: 685, type: !1991)
!2841 = !DILocation(line: 687, column: 3, scope: !2836)
!2842 = !DILocation(line: 688, column: 1, scope: !2836)
!2843 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128", scope: !74, file: !74, line: 700, type: !2844, scopeLine: 701, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2844 = !DISubroutineType(types: !2845)
!2845 = !{null, !32, !38, !272, !38}
!2846 = !DILocalVariable(name: "out", arg: 1, scope: !2843, file: !74, line: 700, type: !32)
!2847 = !DILocation(line: 0, scope: !2843)
!2848 = !DILocalVariable(name: "outlen", arg: 2, scope: !2843, file: !74, line: 700, type: !38)
!2849 = !DILocalVariable(name: "in", arg: 3, scope: !2843, file: !74, line: 700, type: !272)
!2850 = !DILocalVariable(name: "inlen", arg: 4, scope: !2843, file: !74, line: 700, type: !38)
!2851 = !DILocalVariable(name: "state", scope: !2843, file: !74, line: 703, type: !1992)
!2852 = !DILocation(line: 703, column: 16, scope: !2843)
!2853 = !DILocation(line: 705, column: 3, scope: !2843)
!2854 = !DILocation(line: 706, column: 19, scope: !2843)
!2855 = !DILocalVariable(name: "nblocks", scope: !2843, file: !74, line: 702, type: !38)
!2856 = !DILocation(line: 707, column: 3, scope: !2843)
!2857 = !DILocation(line: 708, column: 20, scope: !2843)
!2858 = !DILocation(line: 708, column: 10, scope: !2843)
!2859 = !DILocation(line: 709, column: 17, scope: !2843)
!2860 = !DILocation(line: 709, column: 7, scope: !2843)
!2861 = !DILocation(line: 710, column: 3, scope: !2843)
!2862 = !DILocation(line: 711, column: 1, scope: !2843)
!2863 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256", scope: !74, file: !74, line: 723, type: !2844, scopeLine: 724, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2864 = !DILocalVariable(name: "out", arg: 1, scope: !2863, file: !74, line: 723, type: !32)
!2865 = !DILocation(line: 0, scope: !2863)
!2866 = !DILocalVariable(name: "outlen", arg: 2, scope: !2863, file: !74, line: 723, type: !38)
!2867 = !DILocalVariable(name: "in", arg: 3, scope: !2863, file: !74, line: 723, type: !272)
!2868 = !DILocalVariable(name: "inlen", arg: 4, scope: !2863, file: !74, line: 723, type: !38)
!2869 = !DILocalVariable(name: "state", scope: !2863, file: !74, line: 726, type: !1992)
!2870 = !DILocation(line: 726, column: 16, scope: !2863)
!2871 = !DILocation(line: 728, column: 3, scope: !2863)
!2872 = !DILocation(line: 729, column: 19, scope: !2863)
!2873 = !DILocalVariable(name: "nblocks", scope: !2863, file: !74, line: 725, type: !38)
!2874 = !DILocation(line: 730, column: 3, scope: !2863)
!2875 = !DILocation(line: 731, column: 20, scope: !2863)
!2876 = !DILocation(line: 731, column: 10, scope: !2863)
!2877 = !DILocation(line: 732, column: 17, scope: !2863)
!2878 = !DILocation(line: 732, column: 7, scope: !2863)
!2879 = !DILocation(line: 733, column: 3, scope: !2863)
!2880 = !DILocation(line: 734, column: 1, scope: !2863)
!2881 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_256", scope: !74, file: !74, line: 745, type: !2882, scopeLine: 746, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2882 = !DISubroutineType(types: !2883)
!2883 = !{null, !32, !272, !38}
!2884 = !DILocalVariable(name: "h", arg: 1, scope: !2881, file: !74, line: 745, type: !32)
!2885 = !DILocation(line: 0, scope: !2881)
!2886 = !DILocalVariable(name: "in", arg: 2, scope: !2881, file: !74, line: 745, type: !272)
!2887 = !DILocalVariable(name: "inlen", arg: 3, scope: !2881, file: !74, line: 745, type: !38)
!2888 = !DILocalVariable(name: "s", scope: !2881, file: !74, line: 748, type: !395)
!2889 = !DILocation(line: 748, column: 12, scope: !2881)
!2890 = !DILocation(line: 750, column: 3, scope: !2881)
!2891 = !DILocation(line: 751, column: 3, scope: !2881)
!2892 = !DILocalVariable(name: "i", scope: !2881, file: !74, line: 747, type: !40)
!2893 = !DILocation(line: 752, column: 7, scope: !2894)
!2894 = distinct !DILexicalBlock(scope: !2881, file: !74, line: 752, column: 3)
!2895 = !DILocation(line: 752, scope: !2894)
!2896 = !DILocation(line: 752, column: 12, scope: !2897)
!2897 = distinct !DILexicalBlock(scope: !2894, file: !74, line: 752, column: 3)
!2898 = !DILocation(line: 752, column: 3, scope: !2894)
!2899 = !DILocation(line: 753, column: 16, scope: !2897)
!2900 = !DILocation(line: 753, column: 14, scope: !2897)
!2901 = !DILocation(line: 753, column: 19, scope: !2897)
!2902 = !DILocation(line: 753, column: 5, scope: !2897)
!2903 = !DILocation(line: 752, column: 16, scope: !2897)
!2904 = !DILocation(line: 752, column: 3, scope: !2897)
!2905 = distinct !{!2905, !2898, !2906, !130}
!2906 = !DILocation(line: 753, column: 23, scope: !2894)
!2907 = !DILocation(line: 754, column: 1, scope: !2881)
!2908 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_512", scope: !74, file: !74, line: 765, type: !2882, scopeLine: 766, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2909 = !DILocalVariable(name: "h", arg: 1, scope: !2908, file: !74, line: 765, type: !32)
!2910 = !DILocation(line: 0, scope: !2908)
!2911 = !DILocalVariable(name: "in", arg: 2, scope: !2908, file: !74, line: 765, type: !272)
!2912 = !DILocalVariable(name: "inlen", arg: 3, scope: !2908, file: !74, line: 765, type: !38)
!2913 = !DILocalVariable(name: "s", scope: !2908, file: !74, line: 768, type: !395)
!2914 = !DILocation(line: 768, column: 12, scope: !2908)
!2915 = !DILocation(line: 770, column: 3, scope: !2908)
!2916 = !DILocation(line: 771, column: 3, scope: !2908)
!2917 = !DILocalVariable(name: "i", scope: !2908, file: !74, line: 767, type: !40)
!2918 = !DILocation(line: 772, column: 7, scope: !2919)
!2919 = distinct !DILexicalBlock(scope: !2908, file: !74, line: 772, column: 3)
!2920 = !DILocation(line: 772, scope: !2919)
!2921 = !DILocation(line: 772, column: 12, scope: !2922)
!2922 = distinct !DILexicalBlock(scope: !2919, file: !74, line: 772, column: 3)
!2923 = !DILocation(line: 772, column: 3, scope: !2919)
!2924 = !DILocation(line: 773, column: 16, scope: !2922)
!2925 = !DILocation(line: 773, column: 14, scope: !2922)
!2926 = !DILocation(line: 773, column: 19, scope: !2922)
!2927 = !DILocation(line: 773, column: 5, scope: !2922)
!2928 = !DILocation(line: 772, column: 16, scope: !2922)
!2929 = !DILocation(line: 772, column: 3, scope: !2922)
!2930 = distinct !{!2930, !2923, !2931, !130}
!2931 = !DILocation(line: 773, column: 23, scope: !2919)
!2932 = !DILocation(line: 774, column: 1, scope: !2908)
!2933 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_kyber_shake128_absorb", scope: !2934, file: !2934, line: 18, type: !2935, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !100, retainedNodes: !49)
!2934 = !DIFile(filename: "../../ref/symmetric-shake.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!2935 = !DISubroutineType(types: !2936)
!2936 = !{null, !2937, !272, !33, !33}
!2937 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2938, size: 32)
!2938 = !DIDerivedType(tag: DW_TAG_typedef, name: "keccak_state", file: !391, line: 17, baseType: !2939)
!2939 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !391, line: 14, size: 1664, elements: !2940)
!2940 = !{!2941, !2942}
!2941 = !DIDerivedType(tag: DW_TAG_member, name: "s", scope: !2939, file: !391, line: 15, baseType: !395, size: 1600)
!2942 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !2939, file: !391, line: 16, baseType: !40, size: 32, offset: 1600)
!2943 = !DILocalVariable(name: "state", arg: 1, scope: !2933, file: !2934, line: 18, type: !2937)
!2944 = !DILocation(line: 0, scope: !2933)
!2945 = !DILocalVariable(name: "seed", arg: 2, scope: !2933, file: !2934, line: 19, type: !272)
!2946 = !DILocalVariable(name: "x", arg: 3, scope: !2933, file: !2934, line: 20, type: !33)
!2947 = !DILocalVariable(name: "y", arg: 4, scope: !2933, file: !2934, line: 21, type: !33)
!2948 = !DILocalVariable(name: "extseed", scope: !2933, file: !2934, line: 23, type: !2949)
!2949 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 272, elements: !2950)
!2950 = !{!2951}
!2951 = !DISubrange(count: 34)
!2952 = !DILocation(line: 23, column: 11, scope: !2933)
!2953 = !DILocation(line: 25, column: 3, scope: !2933)
!2954 = !DILocation(line: 26, column: 3, scope: !2933)
!2955 = !DILocation(line: 26, column: 29, scope: !2933)
!2956 = !DILocation(line: 27, column: 3, scope: !2933)
!2957 = !DILocation(line: 27, column: 29, scope: !2933)
!2958 = !DILocation(line: 29, column: 3, scope: !2933)
!2959 = !DILocation(line: 30, column: 1, scope: !2933)
!2960 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_kyber_shake256_prf", scope: !2934, file: !2934, line: 43, type: !2961, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !100, retainedNodes: !49)
!2961 = !DISubroutineType(types: !2962)
!2962 = !{null, !32, !38, !272, !33}
!2963 = !DILocalVariable(name: "out", arg: 1, scope: !2960, file: !2934, line: 43, type: !32)
!2964 = !DILocation(line: 0, scope: !2960)
!2965 = !DILocalVariable(name: "outlen", arg: 2, scope: !2960, file: !2934, line: 43, type: !38)
!2966 = !DILocalVariable(name: "key", arg: 3, scope: !2960, file: !2934, line: 43, type: !272)
!2967 = !DILocalVariable(name: "nonce", arg: 4, scope: !2960, file: !2934, line: 43, type: !33)
!2968 = !DILocalVariable(name: "extkey", scope: !2960, file: !2934, line: 45, type: !2969)
!2969 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 264, elements: !2970)
!2970 = !{!2971}
!2971 = !DISubrange(count: 33)
!2972 = !DILocation(line: 45, column: 11, scope: !2960)
!2973 = !DILocation(line: 47, column: 3, scope: !2960)
!2974 = !DILocation(line: 48, column: 3, scope: !2960)
!2975 = !DILocation(line: 48, column: 26, scope: !2960)
!2976 = !DILocation(line: 50, column: 3, scope: !2960)
!2977 = !DILocation(line: 51, column: 1, scope: !2960)
!2978 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_kyber_shake256_rkprf", scope: !2934, file: !2934, line: 64, type: !689, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !100, retainedNodes: !49)
!2979 = !DILocalVariable(name: "out", arg: 1, scope: !2978, file: !2934, line: 64, type: !32)
!2980 = !DILocation(line: 0, scope: !2978)
!2981 = !DILocalVariable(name: "key", arg: 2, scope: !2978, file: !2934, line: 64, type: !272)
!2982 = !DILocalVariable(name: "input", arg: 3, scope: !2978, file: !2934, line: 64, type: !272)
!2983 = !DILocalVariable(name: "s", scope: !2978, file: !2934, line: 66, type: !2938)
!2984 = !DILocation(line: 66, column: 16, scope: !2978)
!2985 = !DILocation(line: 68, column: 3, scope: !2978)
!2986 = !DILocation(line: 69, column: 3, scope: !2978)
!2987 = !DILocation(line: 70, column: 3, scope: !2978)
!2988 = !DILocation(line: 71, column: 3, scope: !2978)
!2989 = !DILocation(line: 72, column: 3, scope: !2978)
!2990 = !DILocation(line: 73, column: 1, scope: !2978)
