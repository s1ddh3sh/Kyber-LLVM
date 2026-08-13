; ModuleID = 'kyber_composite'
source_filename = "kyber_composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "arm-unknown-none-eabi"

@randombytes.fd = internal unnamed_addr global i32 -1, align 4, !dbg !0
@.str = private unnamed_addr constant [13 x i8] c"/dev/urandom\00", align 1, !dbg !18
@pqcrystals_kyber512_ref_zetas = dso_local local_unnamed_addr constant [128 x i16] [i16 -1044, i16 -758, i16 -359, i16 -1517, i16 1493, i16 1422, i16 287, i16 202, i16 -171, i16 622, i16 1577, i16 182, i16 962, i16 -1202, i16 -1474, i16 1468, i16 573, i16 -1325, i16 264, i16 383, i16 -829, i16 1458, i16 -1602, i16 -130, i16 -681, i16 1017, i16 732, i16 608, i16 -1542, i16 411, i16 -205, i16 -1571, i16 1223, i16 652, i16 -552, i16 1015, i16 -1293, i16 1491, i16 -282, i16 -1544, i16 516, i16 -8, i16 -320, i16 -666, i16 -1618, i16 -1162, i16 126, i16 1469, i16 -853, i16 -90, i16 -271, i16 830, i16 107, i16 -1421, i16 -247, i16 -951, i16 -398, i16 961, i16 -1508, i16 -725, i16 448, i16 -1065, i16 677, i16 -1275, i16 -1103, i16 430, i16 555, i16 843, i16 -1251, i16 871, i16 1550, i16 105, i16 422, i16 587, i16 177, i16 -235, i16 -291, i16 -460, i16 1574, i16 1653, i16 -246, i16 778, i16 1159, i16 -147, i16 -777, i16 1483, i16 -602, i16 1119, i16 -1590, i16 644, i16 -872, i16 349, i16 418, i16 329, i16 -156, i16 -75, i16 817, i16 1097, i16 603, i16 610, i16 1322, i16 -1285, i16 -1465, i16 384, i16 -1215, i16 -136, i16 1218, i16 -1335, i16 -874, i16 220, i16 -1187, i16 -1659, i16 -1185, i16 -1530, i16 -1278, i16 794, i16 -1510, i16 -854, i16 -870, i16 478, i16 -108, i16 -308, i16 996, i16 991, i16 958, i16 -1460, i16 1522, i16 1628], align 2, !dbg !26
@KeccakF_RoundConstants = internal unnamed_addr constant [24 x i64] [i64 1, i64 32898, i64 -9223372036854742902, i64 -9223372034707259392, i64 32907, i64 2147483649, i64 -9223372034707259263, i64 -9223372036854743031, i64 138, i64 136, i64 2147516425, i64 2147483658, i64 2147516555, i64 -9223372036854775669, i64 -9223372036854742903, i64 -9223372036854743037, i64 -9223372036854743038, i64 -9223372036854775680, i64 32778, i64 -9223372034707292150, i64 -9223372034707259263, i64 -9223372036854742912, i64 2147483649, i64 -9223372034707259384], align 8, !dbg !41

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @main() local_unnamed_addr #0 !dbg !80 {
entry:
    #dbg_value(i32 0, !84, !DIExpression(), !85)
  br label %for.cond, !dbg !86

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !88
    #dbg_value(i32 %i.0, !84, !DIExpression(), !85)
  %exitcond = icmp ne i32 %i.0, 1000, !dbg !89
  br i1 %exitcond, label %for.body, label %return, !dbg !91

for.body:                                         ; preds = %for.cond
  %call = call fastcc i32 @test_keys() #3, !dbg !92
    #dbg_value(i32 %call, !94, !DIExpression(), !85)
  %call1 = call fastcc i32 @test_invalid_sk_a() #3, !dbg !95
  %or = or i32 %call, %call1, !dbg !96
    #dbg_value(i32 %or, !94, !DIExpression(), !85)
  %call2 = call fastcc i32 @test_invalid_ciphertext() #3, !dbg !97
  %or3 = or i32 %or, %call2, !dbg !98
    #dbg_value(i32 %or3, !94, !DIExpression(), !85)
  %tobool.not = icmp eq i32 %or3, 0, !dbg !99
  br i1 %tobool.not, label %for.inc, label %return, !dbg !99

for.inc:                                          ; preds = %for.body
  %inc = add nuw nsw i32 %i.0, 1, !dbg !101
    #dbg_value(i32 %inc, !84, !DIExpression(), !85)
  br label %for.cond, !dbg !102, !llvm.loop !103

return:                                           ; preds = %for.cond, %for.body
  %retval.0 = phi i32 [ 1, %for.body ], [ 0, %for.cond ], !dbg !85
  ret i32 %retval.0, !dbg !106
}

; Function Attrs: nounwind
define internal fastcc range(i32 0, 2) i32 @test_keys() unnamed_addr #0 !dbg !107 {
entry:
  %pk = alloca [800 x i8], align 1
  %sk = alloca [1632 x i8], align 1
  %ct = alloca [768 x i8], align 1
  %key_a = alloca [32 x i8], align 1
  %key_b = alloca [32 x i8], align 1
    #dbg_declare(ptr %pk, !108, !DIExpression(), !112)
    #dbg_declare(ptr %sk, !113, !DIExpression(), !117)
    #dbg_declare(ptr %ct, !118, !DIExpression(), !122)
    #dbg_declare(ptr %key_a, !123, !DIExpression(), !127)
    #dbg_declare(ptr %key_b, !128, !DIExpression(), !129)
  %call = call i32 @pqcrystals_kyber512_ref_keypair(ptr noundef nonnull %pk, ptr noundef nonnull %sk) #3, !dbg !130
  %call5 = call i32 @pqcrystals_kyber512_ref_enc(ptr noundef nonnull %ct, ptr noundef nonnull %key_b, ptr noundef nonnull %pk) #3, !dbg !131
  %call9 = call i32 @pqcrystals_kyber512_ref_dec(ptr noundef nonnull %key_a, ptr noundef nonnull %ct, ptr noundef nonnull %sk) #3, !dbg !132
  %call12 = call i32 @memcmp(ptr noundef nonnull %key_a, ptr noundef nonnull %key_b, i32 noundef 32) #4, !dbg !133
  %tobool.not = icmp ne i32 %call12, 0, !dbg !133
  %. = zext i1 %tobool.not to i32, !dbg !135
  ret i32 %., !dbg !136
}

; Function Attrs: nounwind
define internal fastcc range(i32 0, 2) i32 @test_invalid_sk_a() unnamed_addr #0 !dbg !137 {
entry:
  %pk = alloca [800 x i8], align 1
  %sk = alloca [1632 x i8], align 1
  %ct = alloca [768 x i8], align 1
  %key_a = alloca [32 x i8], align 1
  %key_b = alloca [32 x i8], align 1
    #dbg_declare(ptr %pk, !138, !DIExpression(), !139)
    #dbg_declare(ptr %sk, !140, !DIExpression(), !141)
    #dbg_declare(ptr %ct, !142, !DIExpression(), !143)
    #dbg_declare(ptr %key_a, !144, !DIExpression(), !145)
    #dbg_declare(ptr %key_b, !146, !DIExpression(), !147)
  %call = call i32 @pqcrystals_kyber512_ref_keypair(ptr noundef nonnull %pk, ptr noundef nonnull %sk) #3, !dbg !148
  %call5 = call i32 @pqcrystals_kyber512_ref_enc(ptr noundef nonnull %ct, ptr noundef nonnull %key_b, ptr noundef nonnull %pk) #3, !dbg !149
  call void @randombytes(ptr noundef nonnull %sk, i32 noundef 1632) #3, !dbg !150
  %call10 = call i32 @pqcrystals_kyber512_ref_dec(ptr noundef nonnull %key_a, ptr noundef nonnull %ct, ptr noundef nonnull %sk) #3, !dbg !151
  %call13 = call i32 @memcmp(ptr noundef nonnull %key_a, ptr noundef nonnull %key_b, i32 noundef 32) #4, !dbg !152
  %tobool.not = icmp eq i32 %call13, 0, !dbg !152
  %. = zext i1 %tobool.not to i32, !dbg !154
  ret i32 %., !dbg !155
}

; Function Attrs: nounwind
define internal fastcc range(i32 0, 2) i32 @test_invalid_ciphertext() unnamed_addr #0 !dbg !156 {
entry:
  %pk = alloca [800 x i8], align 1
  %sk = alloca [1632 x i8], align 1
  %ct = alloca [768 x i8], align 1
  %key_a = alloca [32 x i8], align 1
  %key_b = alloca [32 x i8], align 1
  %b = alloca i8, align 1
  %pos = alloca i32, align 4
    #dbg_declare(ptr %pk, !157, !DIExpression(), !158)
    #dbg_declare(ptr %sk, !159, !DIExpression(), !160)
    #dbg_declare(ptr %ct, !161, !DIExpression(), !162)
    #dbg_declare(ptr %key_a, !163, !DIExpression(), !164)
    #dbg_declare(ptr %key_b, !165, !DIExpression(), !166)
  br label %do.body, !dbg !167

do.body:                                          ; preds = %do.body, %entry
    #dbg_value(ptr %b, !168, !DIExpression(DW_OP_deref), !169)
  call void @randombytes(ptr noundef nonnull %b, i32 noundef 1) #3, !dbg !170
  %0 = load i8, ptr %b, align 1, !dbg !172
    #dbg_value(i8 %0, !168, !DIExpression(), !169)
  %tobool.not = icmp eq i8 %0, 0, !dbg !173
  br i1 %tobool.not, label %do.body, label %do.end, !dbg !174, !llvm.loop !175

do.end:                                           ; preds = %do.body
    #dbg_value(ptr %pos, !177, !DIExpression(DW_OP_deref), !169)
  call void @randombytes(ptr noundef nonnull %pos, i32 noundef 4) #3, !dbg !178
  %call = call i32 @pqcrystals_kyber512_ref_keypair(ptr noundef nonnull %pk, ptr noundef nonnull %sk) #3, !dbg !179
  %call5 = call i32 @pqcrystals_kyber512_ref_enc(ptr noundef nonnull %ct, ptr noundef nonnull %key_b, ptr noundef nonnull %pk) #3, !dbg !180
  %1 = load i8, ptr %b, align 1, !dbg !181
    #dbg_value(i8 %1, !168, !DIExpression(), !169)
  %2 = load i32, ptr %pos, align 4, !dbg !182
    #dbg_value(i32 %2, !177, !DIExpression(), !169)
  %rem = urem i32 %2, 768, !dbg !183
  %arrayidx = getelementptr inbounds nuw [768 x i8], ptr %ct, i32 0, i32 %rem, !dbg !184
  %3 = load i8, ptr %arrayidx, align 1, !dbg !185
  %xor1 = xor i8 %3, %1, !dbg !185
  store i8 %xor1, ptr %arrayidx, align 1, !dbg !185
  %call11 = call i32 @pqcrystals_kyber512_ref_dec(ptr noundef nonnull %key_a, ptr noundef nonnull %ct, ptr noundef nonnull %sk) #3, !dbg !186
  %call14 = call i32 @memcmp(ptr noundef nonnull %key_a, ptr noundef nonnull %key_b, i32 noundef 32) #4, !dbg !187
  %tobool15.not = icmp eq i32 %call14, 0, !dbg !187
  %. = zext i1 %tobool15.not to i32, !dbg !169
  ret i32 %., !dbg !189
}

declare dso_local i32 @memcmp(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local void @randombytes(ptr noundef %out, i32 noundef %outlen) local_unnamed_addr #0 !dbg !2 {
entry:
    #dbg_value(ptr %out, !190, !DIExpression(), !191)
    #dbg_value(i32 %outlen, !192, !DIExpression(), !191)
  br label %while.cond, !dbg !193

while.cond:                                       ; preds = %while.cond.backedge, %entry
  %0 = load i32, ptr @randombytes.fd, align 4, !dbg !194
  %cmp = icmp eq i32 %0, -1, !dbg !195
  br i1 %cmp, label %while.body, label %while.cond7.preheader, !dbg !193

while.cond7.preheader:                            ; preds = %while.cond
  br label %while.cond7.outer, !dbg !196

while.body:                                       ; preds = %while.cond
  %call = call i32 (ptr, i32, ...) @open(ptr noundef nonnull @.str, i32 noundef 0) #4, !dbg !197
  store i32 %call, ptr @randombytes.fd, align 4, !dbg !199
  %cmp1 = icmp eq i32 %call, -1, !dbg !200
  br i1 %cmp1, label %land.lhs.true, label %if.else, !dbg !202

land.lhs.true:                                    ; preds = %while.body
  %call2 = call ptr @__errno() #4, !dbg !203
  %1 = load i32, ptr %call2, align 4, !dbg !203
  %cmp3 = icmp eq i32 %1, 4, !dbg !204
  br i1 %cmp3, label %while.cond.backedge, label %if.else, !dbg !202

if.else:                                          ; preds = %land.lhs.true, %while.body
  %2 = load i32, ptr @randombytes.fd, align 4, !dbg !205
  %cmp4 = icmp eq i32 %2, -1, !dbg !207
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !207

if.then5:                                         ; preds = %if.else
  call void @abort() #4, !dbg !208
  br label %if.end6, !dbg !208

if.end6:                                          ; preds = %if.else, %if.then5
  br label %while.cond.backedge, !dbg !193

while.cond.backedge:                              ; preds = %if.end6, %land.lhs.true
  br label %while.cond, !dbg !194, !llvm.loop !209

while.cond7:                                      ; preds = %while.cond7.outer, %land.lhs.true12
    #dbg_value(ptr %out.addr.0.ph, !190, !DIExpression(), !191)
    #dbg_value(i32 %outlen.addr.0.ph, !192, !DIExpression(), !191)
  %cmp8.not = icmp eq i32 %outlen.addr.0.ph, 0, !dbg !211
  br i1 %cmp8.not, label %while.end21, label %while.body9, !dbg !196

while.body9:                                      ; preds = %while.cond7
  %3 = load i32, ptr @randombytes.fd, align 4, !dbg !212
  %call10 = call i32 @read(i32 noundef %3, ptr noundef %out.addr.0.ph, i32 noundef %outlen.addr.0.ph) #4, !dbg !214
    #dbg_value(i32 %call10, !215, !DIExpression(), !191)
  %cond = icmp eq i32 %call10, -1, !dbg !220
  br i1 %cond, label %land.lhs.true12, label %if.end20.loopexit, !dbg !220

land.lhs.true12:                                  ; preds = %while.body9
  %call13 = call ptr @__errno() #4, !dbg !222
  %4 = load i32, ptr %call13, align 4, !dbg !222
  %cmp14 = icmp eq i32 %4, 4, !dbg !223
  br i1 %cmp14, label %while.cond7, label %if.then18, !dbg !220, !llvm.loop !224

if.then18:                                        ; preds = %land.lhs.true12
  %call10.lcssa1 = phi i32 [ %call10, %land.lhs.true12 ], !dbg !214
  call void @abort() #4, !dbg !226
  br label %if.end20, !dbg !226

if.end20.loopexit:                                ; preds = %while.body9
  %call10.lcssa = phi i32 [ %call10, %while.body9 ], !dbg !214
  br label %if.end20, !dbg !228

if.end20:                                         ; preds = %if.end20.loopexit, %if.then18
  %call102 = phi i32 [ %call10.lcssa, %if.end20.loopexit ], [ %call10.lcssa1, %if.then18 ]
  %add.ptr = getelementptr inbounds i8, ptr %out.addr.0.ph, i32 %call102, !dbg !228
    #dbg_value(ptr %add.ptr, !190, !DIExpression(), !191)
  %sub = sub i32 %outlen.addr.0.ph, %call102, !dbg !229
    #dbg_value(i32 %sub, !192, !DIExpression(), !191)
  br label %while.cond7.outer, !dbg !196, !llvm.loop !224

while.cond7.outer:                                ; preds = %while.cond7.preheader, %if.end20
  %outlen.addr.0.ph = phi i32 [ %outlen, %while.cond7.preheader ], [ %sub, %if.end20 ]
  %out.addr.0.ph = phi ptr [ %out, %while.cond7.preheader ], [ %add.ptr, %if.end20 ]
  br label %while.cond7, !dbg !196

while.end21:                                      ; preds = %while.cond7
  ret void, !dbg !230
}

declare dso_local i32 @open(ptr noundef, i32 noundef, ...) local_unnamed_addr #1

declare dso_local ptr @__errno() local_unnamed_addr #1

declare dso_local void @abort() local_unnamed_addr #1

declare dso_local i32 @read(i32 noundef, ptr noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber512_ref_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) local_unnamed_addr #0 !dbg !231 {
entry:
    #dbg_value(ptr %pk, !237, !DIExpression(), !238)
    #dbg_value(ptr %sk, !239, !DIExpression(), !238)
    #dbg_value(ptr %coins, !240, !DIExpression(), !238)
  call void @pqcrystals_kyber512_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) #3, !dbg !241
  %add.ptr = getelementptr inbounds nuw i8, ptr %sk, i32 768, !dbg !242
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr, ptr noundef %pk, i32 noundef 800) #4, !dbg !243
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %sk, i32 1568, !dbg !244
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr2, ptr noundef %pk, i32 noundef 800) #3, !dbg !244
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %sk, i32 1600, !dbg !245
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %coins, i32 32, !dbg !246
  %call6 = call ptr @memcpy(ptr noundef nonnull %add.ptr4, ptr noundef nonnull %add.ptr5, i32 noundef 32) #4, !dbg !247
  ret i32 0, !dbg !248
}

declare dso_local ptr @memcpy(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber512_ref_keypair(ptr noundef %pk, ptr noundef %sk) local_unnamed_addr #0 !dbg !249 {
entry:
  %coins = alloca [64 x i8], align 1
    #dbg_value(ptr %pk, !252, !DIExpression(), !253)
    #dbg_value(ptr %sk, !254, !DIExpression(), !253)
    #dbg_declare(ptr %coins, !255, !DIExpression(), !259)
  call void @randombytes(ptr noundef nonnull %coins, i32 noundef 64) #3, !dbg !260
  %call = call i32 @pqcrystals_kyber512_ref_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef nonnull %coins) #3, !dbg !261
  ret i32 0, !dbg !262
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber512_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef %coins) local_unnamed_addr #0 !dbg !263 {
entry:
  %buf = alloca [64 x i8], align 1
  %kr = alloca [64 x i8], align 1
    #dbg_value(ptr %ct, !266, !DIExpression(), !267)
    #dbg_value(ptr %ss, !268, !DIExpression(), !267)
    #dbg_value(ptr %pk, !269, !DIExpression(), !267)
    #dbg_value(ptr %coins, !270, !DIExpression(), !267)
    #dbg_declare(ptr %buf, !271, !DIExpression(), !272)
    #dbg_declare(ptr %kr, !273, !DIExpression(), !274)
  %call = call ptr @memcpy(ptr noundef nonnull %buf, ptr noundef %coins, i32 noundef 32) #4, !dbg !275
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !276
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr, ptr noundef %pk, i32 noundef 800) #3, !dbg !276
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %kr, ptr noundef nonnull %buf, i32 noundef 64) #3, !dbg !277
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %kr, i32 32, !dbg !278
  call void @pqcrystals_kyber512_ref_indcpa_enc(ptr noundef %ct, ptr noundef nonnull %buf, ptr noundef %pk, ptr noundef nonnull %add.ptr6) #3, !dbg !279
  %call8 = call ptr @memcpy(ptr noundef %ss, ptr noundef nonnull %kr, i32 noundef 32) #4, !dbg !280
  ret i32 0, !dbg !281
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber512_ref_enc(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk) local_unnamed_addr #0 !dbg !282 {
entry:
  %coins = alloca [32 x i8], align 1
    #dbg_value(ptr %ct, !283, !DIExpression(), !284)
    #dbg_value(ptr %ss, !285, !DIExpression(), !284)
    #dbg_value(ptr %pk, !286, !DIExpression(), !284)
    #dbg_declare(ptr %coins, !287, !DIExpression(), !288)
  call void @randombytes(ptr noundef nonnull %coins, i32 noundef 32) #3, !dbg !289
  %call = call i32 @pqcrystals_kyber512_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef nonnull %coins) #3, !dbg !290
  ret i32 0, !dbg !291
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber512_ref_dec(ptr noundef %ss, ptr noundef %ct, ptr noundef %sk) local_unnamed_addr #0 !dbg !292 {
entry:
  %buf = alloca [64 x i8], align 1
  %kr = alloca [64 x i8], align 1
  %cmp = alloca [768 x i8], align 1
    #dbg_value(ptr %ss, !295, !DIExpression(), !296)
    #dbg_value(ptr %ct, !297, !DIExpression(), !296)
    #dbg_value(ptr %sk, !298, !DIExpression(), !296)
    #dbg_declare(ptr %buf, !299, !DIExpression(), !300)
    #dbg_declare(ptr %kr, !301, !DIExpression(), !302)
    #dbg_declare(ptr %cmp, !303, !DIExpression(), !304)
  %add.ptr = getelementptr inbounds nuw i8, ptr %sk, i32 768, !dbg !305
    #dbg_value(ptr %add.ptr, !306, !DIExpression(), !296)
  call void @pqcrystals_kyber512_ref_indcpa_dec(ptr noundef nonnull %buf, ptr noundef %ct, ptr noundef %sk) #3, !dbg !307
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !308
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %sk, i32 1568, !dbg !309
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr2, ptr noundef nonnull %add.ptr4, i32 noundef 32) #4, !dbg !310
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %kr, ptr noundef nonnull %buf, i32 noundef 64) #3, !dbg !311
  %add.ptr10 = getelementptr inbounds nuw i8, ptr %kr, i32 32, !dbg !312
  call void @pqcrystals_kyber512_ref_indcpa_enc(ptr noundef nonnull %cmp, ptr noundef nonnull %buf, ptr noundef nonnull %add.ptr, ptr noundef nonnull %add.ptr10) #3, !dbg !313
  %call12 = call i32 @pqcrystals_kyber512_ref_verify(ptr noundef %ct, ptr noundef nonnull %cmp, i32 noundef 768) #3, !dbg !314
    #dbg_value(i32 %call12, !315, !DIExpression(), !296)
  %add.ptr14 = getelementptr inbounds nuw i8, ptr %sk, i32 1600, !dbg !316
  call void @pqcrystals_kyber512_ref_kyber_shake256_rkprf(ptr noundef %ss, ptr noundef nonnull %add.ptr14, ptr noundef %ct) #3, !dbg !316
  %0 = trunc nuw nsw i32 %call12 to i8, !dbg !317
  %conv = xor i8 %0, 1, !dbg !317
  call void @pqcrystals_kyber512_ref_cmov(ptr noundef %ss, ptr noundef nonnull %kr, i32 noundef 32, i8 noundef zeroext %conv) #3, !dbg !318
  ret i32 0, !dbg !319
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_gen_matrix(ptr noundef %a, ptr noundef %seed, i32 noundef %transposed) local_unnamed_addr #0 !dbg !320 {
entry:
  %buf = alloca [504 x i8], align 1
  %state = alloca [26 x i64], align 8
    #dbg_value(ptr %a, !335, !DIExpression(), !336)
    #dbg_value(ptr %seed, !337, !DIExpression(), !336)
    #dbg_value(i32 %transposed, !338, !DIExpression(), !336)
    #dbg_declare(ptr %buf, !339, !DIExpression(), !343)
    #dbg_declare(ptr %state, !344, !DIExpression(), !352)
    #dbg_value(i32 0, !353, !DIExpression(), !336)
  br label %for.cond, !dbg !354

for.cond:                                         ; preds = %for.inc18, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc19, %for.inc18 ], !dbg !356
    #dbg_value(i32 %i.0, !353, !DIExpression(), !336)
  %exitcond1 = icmp ne i32 %i.0, 2, !dbg !357
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end20, !dbg !359

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !360

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc
  %j.0 = phi i32 [ %inc, %for.inc ], [ 0, %for.cond1.preheader ], !dbg !363
    #dbg_value(i32 %j.0, !364, !DIExpression(), !336)
  %exitcond = icmp ne i32 %j.0, 2, !dbg !365
  br i1 %exitcond, label %for.body3, label %for.inc18, !dbg !360

for.body3:                                        ; preds = %for.cond1
  %tobool.not = icmp eq i32 %transposed, 0, !dbg !367
  br i1 %tobool.not, label %if.else, label %if.then, !dbg !367

if.then:                                          ; preds = %for.body3
  %conv = trunc nuw i32 %i.0 to i8, !dbg !370
  %conv4 = trunc nuw nsw i32 %j.0 to i8, !dbg !370
  call void @pqcrystals_kyber512_ref_kyber_shake128_absorb(ptr noundef nonnull %state, ptr noundef %seed, i8 noundef zeroext %conv, i8 noundef zeroext %conv4) #3, !dbg !370
  br label %if.end, !dbg !370

if.else:                                          ; preds = %for.body3
  %conv5 = trunc nuw nsw i32 %j.0 to i8, !dbg !371
  %conv6 = trunc nuw i32 %i.0 to i8, !dbg !371
  call void @pqcrystals_kyber512_ref_kyber_shake128_absorb(ptr noundef nonnull %state, ptr noundef %seed, i8 noundef zeroext %conv5, i8 noundef zeroext %conv6) #3, !dbg !371
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef nonnull %buf, i32 noundef 3, ptr noundef nonnull %state) #3, !dbg !372
    #dbg_value(i32 504, !373, !DIExpression(), !336)
  %arrayidx7 = getelementptr inbounds nuw [2 x [256 x i16]], ptr %a, i32 %i.0, i32 %j.0, !dbg !374
  %call = call fastcc i32 @rej_uniform(ptr noundef %arrayidx7, i32 noundef 256, ptr noundef nonnull %buf, i32 noundef 504) #3, !dbg !375
    #dbg_value(i32 %call, !376, !DIExpression(), !336)
  br label %while.cond, !dbg !377

while.cond:                                       ; preds = %while.body, %if.end
  %ctr.0 = phi i32 [ %call, %if.end ], [ %add, %while.body ], !dbg !378
    #dbg_value(i32 %ctr.0, !376, !DIExpression(), !336)
  %cmp10 = icmp ult i32 %ctr.0, 256, !dbg !379
  br i1 %cmp10, label %while.body, label %for.inc, !dbg !377

while.body:                                       ; preds = %while.cond
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef nonnull %buf, i32 noundef 1, ptr noundef nonnull %state) #3, !dbg !380
    #dbg_value(i32 168, !373, !DIExpression(), !336)
  %arrayidx14 = getelementptr inbounds nuw [2 x [256 x i16]], ptr %a, i32 %i.0, i32 %j.0, !dbg !382
  %add.ptr = getelementptr inbounds nuw i16, ptr %arrayidx14, i32 %ctr.0, !dbg !383
  %sub = sub nuw nsw i32 256, %ctr.0, !dbg !384
  %call17 = call fastcc i32 @rej_uniform(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef nonnull %buf, i32 noundef 168) #3, !dbg !385
  %add = add i32 %ctr.0, %call17, !dbg !386
    #dbg_value(i32 %add, !376, !DIExpression(), !336)
  br label %while.cond, !dbg !377, !llvm.loop !387

for.inc:                                          ; preds = %while.cond
  %inc = add nuw nsw i32 %j.0, 1, !dbg !389
    #dbg_value(i32 %inc, !364, !DIExpression(), !336)
  br label %for.cond1, !dbg !390, !llvm.loop !391

for.inc18:                                        ; preds = %for.cond1
  %inc19 = add nuw nsw i32 %i.0, 1, !dbg !393
    #dbg_value(i32 %inc19, !353, !DIExpression(), !336)
  br label %for.cond, !dbg !394, !llvm.loop !395

for.end20:                                        ; preds = %for.cond
  ret void, !dbg !397
}

; Function Attrs: nounwind
define internal fastcc i32 @rej_uniform(ptr noundef %r, i32 noundef range(i32 1, 257) %len, ptr noundef nonnull %buf, i32 noundef range(i32 168, 505) %buflen) unnamed_addr #0 !dbg !398 {
entry:
    #dbg_value(ptr %r, !402, !DIExpression(), !403)
    #dbg_value(i32 %len, !404, !DIExpression(), !403)
    #dbg_value(ptr %buf, !405, !DIExpression(), !403)
    #dbg_value(i32 %buflen, !406, !DIExpression(), !403)
    #dbg_value(i32 0, !407, !DIExpression(), !403)
    #dbg_value(i32 0, !408, !DIExpression(), !403)
  br label %while.cond, !dbg !409

while.cond:                                       ; preds = %if.end33, %entry
  %ctr.0 = phi i32 [ 0, %entry ], [ %ctr.2, %if.end33 ], !dbg !403
  %pos.0 = phi i32 [ 0, %entry ], [ %add20, %if.end33 ], !dbg !403
    #dbg_value(i32 %pos.0, !407, !DIExpression(), !403)
    #dbg_value(i32 %ctr.0, !408, !DIExpression(), !403)
  %cmp = icmp ult i32 %ctr.0, %len, !dbg !410
  %add = add nuw nsw i32 %pos.0, 3, !dbg !411
  %cmp1 = icmp ule i32 %add, %buflen, !dbg !411
  %0 = select i1 %cmp, i1 %cmp1, i1 false, !dbg !411
  br i1 %0, label %while.body, label %while.end, !dbg !409

while.body:                                       ; preds = %while.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %buf, i32 %pos.0, !dbg !412
  %1 = load i8, ptr %arrayidx, align 1, !dbg !412
  %conv = zext i8 %1 to i16, !dbg !412
  %2 = getelementptr i8, ptr %buf, i32 %pos.0, !dbg !414
  %arrayidx4 = getelementptr i8, ptr %2, i32 1, !dbg !414
  %3 = load i8, ptr %arrayidx4, align 1, !dbg !414
  %conv6 = zext i8 %3 to i16, !dbg !415
  %shl = shl nuw i16 %conv6, 8, !dbg !416
  %shl.masked = and i16 %shl, 3840, !dbg !417
  %and = or disjoint i16 %shl.masked, %conv, !dbg !417
    #dbg_value(i16 %and, !418, !DIExpression(), !403)
  %4 = getelementptr i8, ptr %buf, i32 %pos.0, !dbg !419
  %arrayidx9 = getelementptr i8, ptr %4, i32 1, !dbg !419
  %5 = load i8, ptr %arrayidx9, align 1, !dbg !419
  %6 = lshr i8 %5, 4, !dbg !420
  %shr11 = zext nneg i8 %6 to i16, !dbg !420
  %7 = getelementptr i8, ptr %buf, i32 %pos.0, !dbg !421
  %arrayidx13 = getelementptr i8, ptr %7, i32 2, !dbg !421
  %8 = load i8, ptr %arrayidx13, align 1, !dbg !421
  %conv15 = zext i8 %8 to i16, !dbg !422
  %shl16 = shl nuw nsw i16 %conv15, 4, !dbg !423
  %or17 = or disjoint i16 %shl16, %shr11, !dbg !424
    #dbg_value(i16 %or17, !425, !DIExpression(), !403)
  %add20 = add nuw nsw i32 %pos.0, 3, !dbg !426
    #dbg_value(i32 %add20, !407, !DIExpression(), !403)
  %cmp22 = icmp samesign ult i16 %and, 3329, !dbg !427
  br i1 %cmp22, label %if.then, label %if.end, !dbg !427

if.then:                                          ; preds = %while.body
  %inc = add nuw nsw i32 %ctr.0, 1, !dbg !429
    #dbg_value(i32 %inc, !408, !DIExpression(), !403)
  %arrayidx24 = getelementptr inbounds nuw i16, ptr %r, i32 %ctr.0, !dbg !430
  store i16 %and, ptr %arrayidx24, align 2, !dbg !431
  br label %if.end, !dbg !430

if.end:                                           ; preds = %if.then, %while.body
  %ctr.1 = phi i32 [ %inc, %if.then ], [ %ctr.0, %while.body ], !dbg !403
    #dbg_value(i32 %ctr.1, !408, !DIExpression(), !403)
  %cmp25 = icmp ult i32 %ctr.1, %len, !dbg !432
  %cmp28 = icmp samesign ult i16 %or17, 3329
  %or.cond = select i1 %cmp25, i1 %cmp28, i1 false, !dbg !434
  br i1 %or.cond, label %if.then30, label %if.end33, !dbg !434

if.then30:                                        ; preds = %if.end
  %inc31 = add nuw nsw i32 %ctr.1, 1, !dbg !435
    #dbg_value(i32 %inc31, !408, !DIExpression(), !403)
  %arrayidx32 = getelementptr inbounds nuw i16, ptr %r, i32 %ctr.1, !dbg !436
  store i16 %or17, ptr %arrayidx32, align 2, !dbg !437
  br label %if.end33, !dbg !436

if.end33:                                         ; preds = %if.then30, %if.end
  %ctr.2 = phi i32 [ %inc31, %if.then30 ], [ %ctr.1, %if.end ], !dbg !438
    #dbg_value(i32 %ctr.2, !408, !DIExpression(), !403)
  br label %while.cond, !dbg !409, !llvm.loop !439

while.end:                                        ; preds = %while.cond
  %ctr.0.lcssa = phi i32 [ %ctr.0, %while.cond ], !dbg !403
  ret i32 %ctr.0.lcssa, !dbg !441
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) local_unnamed_addr #0 !dbg !442 {
entry:
  %buf = alloca [64 x i8], align 1
  %a = alloca [2 x [2 x [256 x i16]]], align 2
  %e = alloca [2 x [256 x i16]], align 2
  %pkpv = alloca [2 x [256 x i16]], align 2
  %skpv = alloca [2 x [256 x i16]], align 2
    #dbg_value(ptr %pk, !445, !DIExpression(), !446)
    #dbg_value(ptr %sk, !447, !DIExpression(), !446)
    #dbg_value(ptr %coins, !448, !DIExpression(), !446)
    #dbg_declare(ptr %buf, !449, !DIExpression(), !450)
    #dbg_value(ptr %buf, !451, !DIExpression(), !446)
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !452
    #dbg_value(ptr %add.ptr, !453, !DIExpression(), !446)
    #dbg_value(i8 0, !454, !DIExpression(), !446)
    #dbg_declare(ptr %a, !455, !DIExpression(), !457)
    #dbg_declare(ptr %e, !458, !DIExpression(), !459)
    #dbg_declare(ptr %pkpv, !460, !DIExpression(), !461)
    #dbg_declare(ptr %skpv, !462, !DIExpression(), !463)
  %call = call ptr @memcpy(ptr noundef nonnull %buf, ptr noundef %coins, i32 noundef 32) #4, !dbg !464
  %arrayidx = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !465
  store i8 2, ptr %arrayidx, align 1, !dbg !466
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %buf, ptr noundef nonnull %buf, i32 noundef 33) #3, !dbg !467
  call void @pqcrystals_kyber512_ref_gen_matrix(ptr noundef nonnull %a, ptr noundef nonnull %buf, i32 noundef 0) #3, !dbg !468
    #dbg_value(i32 0, !469, !DIExpression(), !446)
  br label %for.cond, !dbg !470

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc7, %for.body ], !dbg !472
  %nonce.0 = phi i8 [ 0, %entry ], [ %inc, %for.body ], !dbg !446
    #dbg_value(i8 %nonce.0, !454, !DIExpression(), !446)
    #dbg_value(i32 %i.0, !469, !DIExpression(), !446)
  %exitcond = icmp ne i32 %i.0, 2, !dbg !473
  br i1 %exitcond, label %for.body, label %for.cond8.preheader, !dbg !475

for.cond8.preheader:                              ; preds = %for.cond
  br label %for.cond8, !dbg !476

for.body:                                         ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds nuw [2 x [256 x i16]], ptr %skpv, i32 0, i32 %i.0, !dbg !478
    #dbg_value(i8 %nonce.0, !454, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !446)
  call void @pqcrystals_kyber512_ref_poly_getnoise_eta1(ptr noundef nonnull %arrayidx6, ptr noundef nonnull %add.ptr, i8 noundef zeroext %nonce.0) #3, !dbg !479
  %inc = add nuw nsw i8 %nonce.0, 1, !dbg !480
    #dbg_value(i8 %inc, !454, !DIExpression(), !446)
  %inc7 = add nuw nsw i32 %i.0, 1, !dbg !481
    #dbg_value(i32 %inc7, !469, !DIExpression(), !446)
  br label %for.cond, !dbg !482, !llvm.loop !483

for.cond8:                                        ; preds = %for.cond8.preheader, %for.body10
  %i.1 = phi i32 [ %inc14, %for.body10 ], [ 0, %for.cond8.preheader ], !dbg !485
  %nonce.1 = phi i8 [ %inc12, %for.body10 ], [ 2, %for.cond8.preheader ], !dbg !446
    #dbg_value(i8 %nonce.1, !454, !DIExpression(), !446)
    #dbg_value(i32 %i.1, !469, !DIExpression(), !446)
  %exitcond1 = icmp ne i32 %i.1, 2, !dbg !486
  br i1 %exitcond1, label %for.body10, label %for.end15, !dbg !476

for.body10:                                       ; preds = %for.cond8
  %arrayidx11 = getelementptr inbounds nuw [2 x [256 x i16]], ptr %e, i32 0, i32 %i.1, !dbg !488
    #dbg_value(i8 %nonce.1, !454, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !446)
  call void @pqcrystals_kyber512_ref_poly_getnoise_eta1(ptr noundef nonnull %arrayidx11, ptr noundef nonnull %add.ptr, i8 noundef zeroext %nonce.1) #3, !dbg !489
  %inc12 = add nuw nsw i8 %nonce.1, 1, !dbg !490
    #dbg_value(i8 %inc12, !454, !DIExpression(), !446)
  %inc14 = add nuw nsw i32 %i.1, 1, !dbg !491
    #dbg_value(i32 %inc14, !469, !DIExpression(), !446)
  br label %for.cond8, !dbg !492, !llvm.loop !493

for.end15:                                        ; preds = %for.cond8
  call void @pqcrystals_kyber512_ref_polyvec_ntt(ptr noundef nonnull %skpv) #3, !dbg !495
  call void @pqcrystals_kyber512_ref_polyvec_ntt(ptr noundef nonnull %e) #3, !dbg !496
    #dbg_value(i32 0, !469, !DIExpression(), !446)
  br label %for.cond16, !dbg !497

for.cond16:                                       ; preds = %for.body18, %for.end15
  %i.2 = phi i32 [ 0, %for.end15 ], [ %inc23, %for.body18 ], !dbg !499
    #dbg_value(i32 %i.2, !469, !DIExpression(), !446)
  %exitcond2 = icmp ne i32 %i.2, 2, !dbg !500
  br i1 %exitcond2, label %for.body18, label %for.end24, !dbg !502

for.body18:                                       ; preds = %for.cond16
  %arrayidx19 = getelementptr inbounds nuw [2 x [256 x i16]], ptr %pkpv, i32 0, i32 %i.2, !dbg !503
  %arrayidx20 = getelementptr inbounds nuw [2 x [2 x [256 x i16]]], ptr %a, i32 0, i32 %i.2, !dbg !505
  call void @pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %arrayidx19, ptr noundef nonnull %arrayidx20, ptr noundef nonnull %skpv) #3, !dbg !506
  %arrayidx21 = getelementptr inbounds nuw [2 x [256 x i16]], ptr %pkpv, i32 0, i32 %i.2, !dbg !507
  call void @pqcrystals_kyber512_ref_poly_tomont(ptr noundef nonnull %arrayidx21) #3, !dbg !508
  %inc23 = add nuw nsw i32 %i.2, 1, !dbg !509
    #dbg_value(i32 %inc23, !469, !DIExpression(), !446)
  br label %for.cond16, !dbg !510, !llvm.loop !511

for.end24:                                        ; preds = %for.cond16
  call void @pqcrystals_kyber512_ref_polyvec_add(ptr noundef nonnull %pkpv, ptr noundef nonnull %pkpv, ptr noundef nonnull %e) #3, !dbg !513
  call void @pqcrystals_kyber512_ref_polyvec_reduce(ptr noundef nonnull %pkpv) #3, !dbg !514
  call fastcc void @pack_sk(ptr noundef %sk, ptr noundef nonnull %skpv) #3, !dbg !515
  call fastcc void @pack_pk(ptr noundef %pk, ptr noundef nonnull %pkpv, ptr noundef nonnull %buf) #3, !dbg !516
  ret void, !dbg !517
}

; Function Attrs: nounwind
define internal fastcc void @pack_sk(ptr noundef %r, ptr noundef nonnull %sk) unnamed_addr #0 !dbg !518 {
entry:
    #dbg_value(ptr %r, !521, !DIExpression(), !522)
    #dbg_value(ptr %sk, !523, !DIExpression(), !522)
  call void @pqcrystals_kyber512_ref_polyvec_tobytes(ptr noundef %r, ptr noundef nonnull %sk) #3, !dbg !524
  ret void, !dbg !525
}

; Function Attrs: nounwind
define internal fastcc void @pack_pk(ptr noundef %r, ptr noundef nonnull %pk, ptr noundef nonnull %seed) unnamed_addr #0 !dbg !526 {
entry:
    #dbg_value(ptr %r, !529, !DIExpression(), !530)
    #dbg_value(ptr %pk, !531, !DIExpression(), !530)
    #dbg_value(ptr %seed, !532, !DIExpression(), !530)
  call void @pqcrystals_kyber512_ref_polyvec_tobytes(ptr noundef %r, ptr noundef nonnull %pk) #3, !dbg !533
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 768, !dbg !534
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr, ptr noundef nonnull %seed, i32 noundef 32) #4, !dbg !535
  ret void, !dbg !536
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_indcpa_enc(ptr noundef %c, ptr noundef %m, ptr noundef %pk, ptr noundef %coins) local_unnamed_addr #0 !dbg !537 {
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
    #dbg_value(ptr %c, !540, !DIExpression(), !541)
    #dbg_value(ptr %m, !542, !DIExpression(), !541)
    #dbg_value(ptr %pk, !543, !DIExpression(), !541)
    #dbg_value(ptr %coins, !544, !DIExpression(), !541)
    #dbg_declare(ptr %seed, !545, !DIExpression(), !546)
    #dbg_value(i8 0, !547, !DIExpression(), !541)
    #dbg_declare(ptr %sp, !548, !DIExpression(), !549)
    #dbg_declare(ptr %pkpv, !550, !DIExpression(), !551)
    #dbg_declare(ptr %ep, !552, !DIExpression(), !553)
    #dbg_declare(ptr %at, !554, !DIExpression(), !555)
    #dbg_declare(ptr %b, !556, !DIExpression(), !557)
    #dbg_declare(ptr %v, !558, !DIExpression(), !559)
    #dbg_declare(ptr %k, !560, !DIExpression(), !561)
    #dbg_declare(ptr %epp, !562, !DIExpression(), !563)
  call fastcc void @unpack_pk(ptr noundef nonnull %pkpv, ptr noundef nonnull %seed, ptr noundef %pk) #3, !dbg !564
  call void @pqcrystals_kyber512_ref_poly_frommsg(ptr noundef nonnull %k, ptr noundef %m) #3, !dbg !565
  call void @pqcrystals_kyber512_ref_gen_matrix(ptr noundef nonnull %at, ptr noundef nonnull %seed, i32 noundef 1) #3, !dbg !566
    #dbg_value(i32 0, !567, !DIExpression(), !541)
  br label %for.cond, !dbg !568

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc4, %for.body ], !dbg !570
  %nonce.0 = phi i8 [ 0, %entry ], [ %inc, %for.body ], !dbg !541
    #dbg_value(i8 %nonce.0, !547, !DIExpression(), !541)
    #dbg_value(i32 %i.0, !567, !DIExpression(), !541)
  %exitcond = icmp ne i32 %i.0, 2, !dbg !571
  br i1 %exitcond, label %for.body, label %for.cond5.preheader, !dbg !573

for.cond5.preheader:                              ; preds = %for.cond
  br label %for.cond5, !dbg !574

for.body:                                         ; preds = %for.cond
  %add.ptr = getelementptr inbounds nuw [256 x i16], ptr %sp, i32 %i.0, !dbg !576
    #dbg_value(i8 %nonce.0, !547, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !541)
  call void @pqcrystals_kyber512_ref_poly_getnoise_eta1(ptr noundef nonnull %add.ptr, ptr noundef %coins, i8 noundef zeroext %nonce.0) #3, !dbg !577
  %inc = add nuw nsw i8 %nonce.0, 1, !dbg !578
    #dbg_value(i8 %inc, !547, !DIExpression(), !541)
  %inc4 = add nuw nsw i32 %i.0, 1, !dbg !579
    #dbg_value(i32 %inc4, !567, !DIExpression(), !541)
  br label %for.cond, !dbg !580, !llvm.loop !581

for.cond5:                                        ; preds = %for.cond5.preheader, %for.body7
  %i.1 = phi i32 [ %inc12, %for.body7 ], [ 0, %for.cond5.preheader ], !dbg !583
  %nonce.1 = phi i8 [ %inc10, %for.body7 ], [ 2, %for.cond5.preheader ], !dbg !541
    #dbg_value(i8 %nonce.1, !547, !DIExpression(), !541)
    #dbg_value(i32 %i.1, !567, !DIExpression(), !541)
  %exitcond1 = icmp ne i32 %i.1, 2, !dbg !584
  br i1 %exitcond1, label %for.body7, label %for.end13, !dbg !574

for.body7:                                        ; preds = %for.cond5
  %add.ptr9 = getelementptr inbounds nuw [256 x i16], ptr %ep, i32 %i.1, !dbg !586
    #dbg_value(i8 %nonce.1, !547, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !541)
  call void @pqcrystals_kyber512_ref_poly_getnoise_eta2(ptr noundef nonnull %add.ptr9, ptr noundef %coins, i8 noundef zeroext %nonce.1) #3, !dbg !587
  %inc10 = add nuw nsw i8 %nonce.1, 1, !dbg !588
    #dbg_value(i8 %inc10, !547, !DIExpression(), !541)
  %inc12 = add nuw nsw i32 %i.1, 1, !dbg !589
    #dbg_value(i32 %inc12, !567, !DIExpression(), !541)
  br label %for.cond5, !dbg !590, !llvm.loop !591

for.end13:                                        ; preds = %for.cond5
    #dbg_value(i8 4, !547, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !541)
  call void @pqcrystals_kyber512_ref_poly_getnoise_eta2(ptr noundef nonnull %epp, ptr noundef %coins, i8 noundef zeroext 4) #3, !dbg !593
  call void @pqcrystals_kyber512_ref_polyvec_ntt(ptr noundef nonnull %sp) #3, !dbg !594
    #dbg_value(i32 0, !567, !DIExpression(), !541)
  br label %for.cond15, !dbg !595

for.cond15:                                       ; preds = %for.body17, %for.end13
  %i.2 = phi i32 [ 0, %for.end13 ], [ %inc20, %for.body17 ], !dbg !597
    #dbg_value(i32 %i.2, !567, !DIExpression(), !541)
  %exitcond2 = icmp ne i32 %i.2, 2, !dbg !598
  br i1 %exitcond2, label %for.body17, label %for.end21, !dbg !600

for.body17:                                       ; preds = %for.cond15
  %arrayidx = getelementptr inbounds nuw [2 x [256 x i16]], ptr %b, i32 0, i32 %i.2, !dbg !601
  %arrayidx18 = getelementptr inbounds nuw [2 x [2 x [256 x i16]]], ptr %at, i32 0, i32 %i.2, !dbg !602
  call void @pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %arrayidx, ptr noundef nonnull %arrayidx18, ptr noundef nonnull %sp) #3, !dbg !603
  %inc20 = add nuw nsw i32 %i.2, 1, !dbg !604
    #dbg_value(i32 %inc20, !567, !DIExpression(), !541)
  br label %for.cond15, !dbg !605, !llvm.loop !606

for.end21:                                        ; preds = %for.cond15
  call void @pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %v, ptr noundef nonnull %pkpv, ptr noundef nonnull %sp) #3, !dbg !608
  call void @pqcrystals_kyber512_ref_polyvec_invntt_tomont(ptr noundef nonnull %b) #3, !dbg !609
  call void @pqcrystals_kyber512_ref_poly_invntt_tomont(ptr noundef nonnull %v) #3, !dbg !610
  call void @pqcrystals_kyber512_ref_polyvec_add(ptr noundef nonnull %b, ptr noundef nonnull %b, ptr noundef nonnull %ep) #3, !dbg !611
  call void @pqcrystals_kyber512_ref_poly_add(ptr noundef nonnull %v, ptr noundef nonnull %v, ptr noundef nonnull %epp) #3, !dbg !612
  call void @pqcrystals_kyber512_ref_poly_add(ptr noundef nonnull %v, ptr noundef nonnull %v, ptr noundef nonnull %k) #3, !dbg !613
  call void @pqcrystals_kyber512_ref_polyvec_reduce(ptr noundef nonnull %b) #3, !dbg !614
  call void @pqcrystals_kyber512_ref_poly_reduce(ptr noundef nonnull %v) #3, !dbg !615
  call fastcc void @pack_ciphertext(ptr noundef %c, ptr noundef nonnull %b, ptr noundef nonnull %v) #3, !dbg !616
  ret void, !dbg !617
}

; Function Attrs: nounwind
define internal fastcc void @unpack_pk(ptr noundef nonnull %pk, ptr noundef nonnull %seed, ptr noundef %packedpk) unnamed_addr #0 !dbg !618 {
entry:
    #dbg_value(ptr %pk, !621, !DIExpression(), !622)
    #dbg_value(ptr %seed, !623, !DIExpression(), !622)
    #dbg_value(ptr %packedpk, !624, !DIExpression(), !622)
  call void @pqcrystals_kyber512_ref_polyvec_frombytes(ptr noundef nonnull %pk, ptr noundef %packedpk) #3, !dbg !625
  %add.ptr = getelementptr inbounds nuw i8, ptr %packedpk, i32 768, !dbg !626
  %call = call ptr @memcpy(ptr noundef nonnull %seed, ptr noundef nonnull %add.ptr, i32 noundef 32) #4, !dbg !627
  ret void, !dbg !628
}

; Function Attrs: nounwind
define internal fastcc void @pack_ciphertext(ptr noundef %r, ptr noundef nonnull %b, ptr noundef nonnull %v) unnamed_addr #0 !dbg !629 {
entry:
    #dbg_value(ptr %r, !633, !DIExpression(), !634)
    #dbg_value(ptr %b, !635, !DIExpression(), !634)
    #dbg_value(ptr %v, !636, !DIExpression(), !634)
  call void @pqcrystals_kyber512_ref_polyvec_compress(ptr noundef %r, ptr noundef nonnull %b) #3, !dbg !637
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 640, !dbg !638
  call void @pqcrystals_kyber512_ref_poly_compress(ptr noundef nonnull %add.ptr, ptr noundef nonnull %v) #3, !dbg !639
  ret void, !dbg !640
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_indcpa_dec(ptr noundef %m, ptr noundef %c, ptr noundef %sk) local_unnamed_addr #0 !dbg !641 {
entry:
  %b = alloca [2 x [256 x i16]], align 2
  %skpv = alloca [2 x [256 x i16]], align 2
  %v = alloca [256 x i16], align 2
  %mp = alloca [256 x i16], align 2
    #dbg_value(ptr %m, !644, !DIExpression(), !645)
    #dbg_value(ptr %c, !646, !DIExpression(), !645)
    #dbg_value(ptr %sk, !647, !DIExpression(), !645)
    #dbg_declare(ptr %b, !648, !DIExpression(), !649)
    #dbg_declare(ptr %skpv, !650, !DIExpression(), !651)
    #dbg_declare(ptr %v, !652, !DIExpression(), !653)
    #dbg_declare(ptr %mp, !654, !DIExpression(), !655)
  call fastcc void @unpack_ciphertext(ptr noundef nonnull %b, ptr noundef nonnull %v, ptr noundef %c) #3, !dbg !656
  call fastcc void @unpack_sk(ptr noundef nonnull %skpv, ptr noundef %sk) #3, !dbg !657
  call void @pqcrystals_kyber512_ref_polyvec_ntt(ptr noundef nonnull %b) #3, !dbg !658
  call void @pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %mp, ptr noundef nonnull %skpv, ptr noundef nonnull %b) #3, !dbg !659
  call void @pqcrystals_kyber512_ref_poly_invntt_tomont(ptr noundef nonnull %mp) #3, !dbg !660
  call void @pqcrystals_kyber512_ref_poly_sub(ptr noundef nonnull %mp, ptr noundef nonnull %v, ptr noundef nonnull %mp) #3, !dbg !661
  call void @pqcrystals_kyber512_ref_poly_reduce(ptr noundef nonnull %mp) #3, !dbg !662
  call void @pqcrystals_kyber512_ref_poly_tomsg(ptr noundef %m, ptr noundef nonnull %mp) #3, !dbg !663
  ret void, !dbg !664
}

; Function Attrs: nounwind
define internal fastcc void @unpack_ciphertext(ptr noundef nonnull %b, ptr noundef nonnull %v, ptr noundef %c) unnamed_addr #0 !dbg !665 {
entry:
    #dbg_value(ptr %b, !668, !DIExpression(), !669)
    #dbg_value(ptr %v, !670, !DIExpression(), !669)
    #dbg_value(ptr %c, !671, !DIExpression(), !669)
  call void @pqcrystals_kyber512_ref_polyvec_decompress(ptr noundef nonnull %b, ptr noundef %c) #3, !dbg !672
  %add.ptr = getelementptr inbounds nuw i8, ptr %c, i32 640, !dbg !673
  call void @pqcrystals_kyber512_ref_poly_decompress(ptr noundef nonnull %v, ptr noundef nonnull %add.ptr) #3, !dbg !674
  ret void, !dbg !675
}

; Function Attrs: nounwind
define internal fastcc void @unpack_sk(ptr noundef nonnull %sk, ptr noundef %packedsk) unnamed_addr #0 !dbg !676 {
entry:
    #dbg_value(ptr %sk, !679, !DIExpression(), !680)
    #dbg_value(ptr %packedsk, !681, !DIExpression(), !680)
  call void @pqcrystals_kyber512_ref_polyvec_frombytes(ptr noundef nonnull %sk, ptr noundef %packedsk) #3, !dbg !682
  ret void, !dbg !683
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_compress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !684 {
entry:
  %t = alloca [4 x i16], align 2
    #dbg_value(ptr %r, !690, !DIExpression(), !691)
    #dbg_value(ptr %a, !692, !DIExpression(), !691)
    #dbg_declare(ptr %t, !693, !DIExpression(), !697)
    #dbg_value(i32 0, !698, !DIExpression(), !691)
  br label %for.cond, !dbg !699

for.cond:                                         ; preds = %for.inc61, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc62, %for.inc61 ], !dbg !701
  %r.addr.0 = phi ptr [ %r, %entry ], [ %r.addr.1.lcssa, %for.inc61 ]
    #dbg_value(ptr %r.addr.0, !690, !DIExpression(), !691)
    #dbg_value(i32 %i.0, !698, !DIExpression(), !691)
  %exitcond2 = icmp ne i32 %i.0, 2, !dbg !702
  br i1 %exitcond2, label %for.cond1.preheader, label %for.end63, !dbg !704

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !705

for.cond1:                                        ; preds = %for.cond1.preheader, %for.end
  %j.0 = phi i32 [ %inc59, %for.end ], [ 0, %for.cond1.preheader ], !dbg !708
  %r.addr.1 = phi ptr [ %add.ptr, %for.end ], [ %r.addr.0, %for.cond1.preheader ]
    #dbg_value(ptr %r.addr.1, !690, !DIExpression(), !691)
    #dbg_value(i32 %j.0, !709, !DIExpression(), !691)
  %exitcond1 = icmp ne i32 %j.0, 64, !dbg !710
  br i1 %exitcond1, label %for.cond4.preheader, label %for.inc61, !dbg !705

for.cond4.preheader:                              ; preds = %for.cond1
  br label %for.cond4, !dbg !712

for.cond4:                                        ; preds = %for.cond4.preheader, %for.body6
  %k.0 = phi i32 [ %inc, %for.body6 ], [ 0, %for.cond4.preheader ], !dbg !715
    #dbg_value(i32 %k.0, !716, !DIExpression(), !691)
  %exitcond = icmp ne i32 %k.0, 4, !dbg !717
  br i1 %exitcond, label %for.body6, label %for.end, !dbg !712

for.body6:                                        ; preds = %for.cond4
  %mul = shl nuw nsw i32 %j.0, 2, !dbg !719
  %add = or disjoint i32 %mul, %k.0, !dbg !721
  %arrayidx7 = getelementptr inbounds nuw [2 x [256 x i16]], ptr %a, i32 0, i32 %i.0, i32 %add, !dbg !722
  %0 = load i16, ptr %arrayidx7, align 2, !dbg !722
  %isneg = icmp slt i16 %0, 0, !dbg !723
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !723
  %arrayidx10 = getelementptr inbounds nuw [4 x i16], ptr %t, i32 0, i32 %k.0, !dbg !724
  %add12 = add i16 %and, %0, !dbg !725
  store i16 %add12, ptr %arrayidx10, align 2, !dbg !725
  %conv15 = zext i16 %add12 to i64, !dbg !726
    #dbg_value(i64 %conv15, !727, !DIExpression(), !691)
    #dbg_value(i64 %conv15, !727, !DIExpression(DW_OP_constu, 10, DW_OP_shl, DW_OP_stack_value), !691)
    #dbg_value(i64 %conv15, !727, !DIExpression(DW_OP_constu, 10, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !691)
  %1 = mul nuw nsw i64 %conv15, 1321131008, !dbg !728
  %mul17 = add nuw nsw i64 %1, 2148128055, !dbg !728
    #dbg_value(i64 %mul17, !727, !DIExpression(), !691)
  %shr18 = lshr i64 %mul17, 32, !dbg !729
    #dbg_value(i64 %shr18, !727, !DIExpression(), !691)
  %2 = trunc nuw nsw i64 %shr18 to i16, !dbg !730
  %conv20 = and i16 %2, 1023, !dbg !730
  %arrayidx21 = getelementptr inbounds nuw [4 x i16], ptr %t, i32 0, i32 %k.0, !dbg !731
  store i16 %conv20, ptr %arrayidx21, align 2, !dbg !732
  %inc = add nuw nsw i32 %k.0, 1, !dbg !733
    #dbg_value(i32 %inc, !716, !DIExpression(), !691)
  br label %for.cond4, !dbg !734, !llvm.loop !735

for.end:                                          ; preds = %for.cond4
  %3 = load i16, ptr %t, align 2, !dbg !737
  %conv25 = trunc i16 %3 to i8, !dbg !738
  store i8 %conv25, ptr %r.addr.1, align 1, !dbg !739
  %4 = load i16, ptr %t, align 2, !dbg !740
  %5 = lshr i16 %4, 8, !dbg !741
  %shr29 = trunc nuw i16 %5 to i8, !dbg !741
  %arrayidx30 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !742
  %6 = load i16, ptr %arrayidx30, align 2, !dbg !742
  %conv31 = trunc i16 %6 to i8, !dbg !742
  %shl32 = shl i8 %conv31, 2, !dbg !743
  %or = or i8 %shl32, %shr29, !dbg !744
  %arrayidx34 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 1, !dbg !745
  store i8 %or, ptr %arrayidx34, align 1, !dbg !746
  %arrayidx35 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !747
  %7 = load i16, ptr %arrayidx35, align 2, !dbg !747
  %8 = lshr i16 %7, 6, !dbg !748
  %shr37 = trunc i16 %8 to i8, !dbg !748
  %arrayidx38 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !749
  %9 = load i16, ptr %arrayidx38, align 2, !dbg !749
  %conv39 = trunc i16 %9 to i8, !dbg !749
  %shl40 = shl i8 %conv39, 4, !dbg !750
  %or41 = or i8 %shl40, %shr37, !dbg !751
  %arrayidx43 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 2, !dbg !752
  store i8 %or41, ptr %arrayidx43, align 1, !dbg !753
  %arrayidx44 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !754
  %10 = load i16, ptr %arrayidx44, align 2, !dbg !754
  %11 = lshr i16 %10, 4, !dbg !755
  %shr46 = trunc i16 %11 to i8, !dbg !755
  %arrayidx47 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !756
  %12 = load i16, ptr %arrayidx47, align 2, !dbg !756
  %conv48 = trunc i16 %12 to i8, !dbg !756
  %shl49 = shl i8 %conv48, 6, !dbg !757
  %or50 = or i8 %shl49, %shr46, !dbg !758
  %arrayidx52 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 3, !dbg !759
  store i8 %or50, ptr %arrayidx52, align 1, !dbg !760
  %arrayidx53 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !761
  %13 = load i16, ptr %arrayidx53, align 2, !dbg !761
  %14 = lshr i16 %13, 2, !dbg !762
  %conv56 = trunc i16 %14 to i8, !dbg !763
  %arrayidx57 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 4, !dbg !764
  store i8 %conv56, ptr %arrayidx57, align 1, !dbg !765
    #dbg_value(ptr %r.addr.1, !690, !DIExpression(DW_OP_plus_uconst, 5, DW_OP_stack_value), !691)
  %add.ptr = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 5, !dbg !766
    #dbg_value(ptr %add.ptr, !690, !DIExpression(), !691)
  %inc59 = add nuw nsw i32 %j.0, 1, !dbg !767
    #dbg_value(i32 %inc59, !709, !DIExpression(), !691)
  br label %for.cond1, !dbg !768, !llvm.loop !769

for.inc61:                                        ; preds = %for.cond1
  %r.addr.1.lcssa = phi ptr [ %r.addr.1, %for.cond1 ]
  %inc62 = add nuw nsw i32 %i.0, 1, !dbg !771
    #dbg_value(i32 %inc62, !698, !DIExpression(), !691)
  br label %for.cond, !dbg !772, !llvm.loop !773

for.end63:                                        ; preds = %for.cond
  ret void, !dbg !775
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_decompress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !776 {
entry:
  %t = alloca [4 x i16], align 2
    #dbg_value(ptr %r, !777, !DIExpression(), !778)
    #dbg_value(ptr %a, !779, !DIExpression(), !778)
    #dbg_declare(ptr %t, !780, !DIExpression(), !781)
    #dbg_value(i32 0, !782, !DIExpression(), !778)
  br label %for.cond, !dbg !783

for.cond:                                         ; preds = %for.inc54, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc55, %for.inc54 ], !dbg !785
  %a.addr.0 = phi ptr [ %a, %entry ], [ %a.addr.1.lcssa, %for.inc54 ]
    #dbg_value(ptr %a.addr.0, !779, !DIExpression(), !778)
    #dbg_value(i32 %i.0, !782, !DIExpression(), !778)
  %exitcond2 = icmp ne i32 %i.0, 2, !dbg !786
  br i1 %exitcond2, label %for.cond1.preheader, label %for.end56, !dbg !788

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !789

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc51
  %j.0 = phi i32 [ %inc52, %for.inc51 ], [ 0, %for.cond1.preheader ], !dbg !792
  %a.addr.1 = phi ptr [ %add.ptr, %for.inc51 ], [ %a.addr.0, %for.cond1.preheader ]
    #dbg_value(ptr %a.addr.1, !779, !DIExpression(), !778)
    #dbg_value(i32 %j.0, !793, !DIExpression(), !778)
  %exitcond1 = icmp ne i32 %j.0, 64, !dbg !794
  br i1 %exitcond1, label %for.body3, label %for.inc54, !dbg !789

for.body3:                                        ; preds = %for.cond1
  %0 = load i8, ptr %a.addr.1, align 1, !dbg !796
  %conv = zext i8 %0 to i16, !dbg !796
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 1, !dbg !798
  %1 = load i8, ptr %arrayidx4, align 1, !dbg !798
  %conv6 = zext i8 %1 to i16, !dbg !799
  %shl = shl nuw i16 %conv6, 8, !dbg !800
  %or = or disjoint i16 %shl, %conv, !dbg !801
  store i16 %or, ptr %t, align 2, !dbg !802
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 1, !dbg !803
  %2 = load i8, ptr %arrayidx9, align 1, !dbg !803
  %3 = lshr i8 %2, 2, !dbg !804
  %shr11 = zext nneg i8 %3 to i16, !dbg !804
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 2, !dbg !805
  %4 = load i8, ptr %arrayidx12, align 1, !dbg !805
  %conv14 = zext i8 %4 to i16, !dbg !806
  %shl15 = shl nuw nsw i16 %conv14, 6, !dbg !807
  %or16 = or disjoint i16 %shl15, %shr11, !dbg !808
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !809
  store i16 %or16, ptr %arrayidx18, align 2, !dbg !810
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 2, !dbg !811
  %5 = load i8, ptr %arrayidx19, align 1, !dbg !811
  %6 = lshr i8 %5, 4, !dbg !812
  %shr21 = zext nneg i8 %6 to i16, !dbg !812
  %arrayidx22 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 3, !dbg !813
  %7 = load i8, ptr %arrayidx22, align 1, !dbg !813
  %conv24 = zext i8 %7 to i16, !dbg !814
  %shl25 = shl nuw nsw i16 %conv24, 4, !dbg !815
  %or26 = or disjoint i16 %shl25, %shr21, !dbg !816
  %arrayidx28 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !817
  store i16 %or26, ptr %arrayidx28, align 2, !dbg !818
  %arrayidx29 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 3, !dbg !819
  %8 = load i8, ptr %arrayidx29, align 1, !dbg !819
  %9 = lshr i8 %8, 6, !dbg !820
  %shr31 = zext nneg i8 %9 to i16, !dbg !820
  %arrayidx32 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 4, !dbg !821
  %10 = load i8, ptr %arrayidx32, align 1, !dbg !821
  %conv34 = zext i8 %10 to i16, !dbg !822
  %shl35 = shl nuw nsw i16 %conv34, 2, !dbg !823
  %or36 = or disjoint i16 %shl35, %shr31, !dbg !824
  %arrayidx38 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !825
  store i16 %or36, ptr %arrayidx38, align 2, !dbg !826
    #dbg_value(ptr %add.ptr, !779, !DIExpression(), !778)
    #dbg_value(i32 0, !827, !DIExpression(), !778)
  br label %for.cond39, !dbg !828

for.cond39:                                       ; preds = %for.body42, %for.body3
  %k.0 = phi i32 [ 0, %for.body3 ], [ %inc, %for.body42 ], !dbg !830
    #dbg_value(i32 %k.0, !827, !DIExpression(), !778)
  %exitcond = icmp ne i32 %k.0, 4, !dbg !831
  br i1 %exitcond, label %for.body42, label %for.inc51, !dbg !833

for.body42:                                       ; preds = %for.cond39
  %arrayidx43 = getelementptr inbounds nuw [4 x i16], ptr %t, i32 0, i32 %k.0, !dbg !834
  %11 = load i16, ptr %arrayidx43, align 2, !dbg !834
  %12 = and i16 %11, 1023, !dbg !835
  %and = zext nneg i16 %12 to i32, !dbg !835
  %mul = mul nuw nsw i32 %and, 3329, !dbg !836
  %add = add nuw nsw i32 %mul, 512, !dbg !837
  %shr45 = lshr i32 %add, 10, !dbg !838
  %conv46 = trunc nuw nsw i32 %shr45 to i16, !dbg !839
  %mul48 = shl nuw nsw i32 %j.0, 2, !dbg !840
  %add49 = or disjoint i32 %mul48, %k.0, !dbg !841
  %arrayidx50 = getelementptr inbounds nuw [2 x [256 x i16]], ptr %r, i32 0, i32 %i.0, i32 %add49, !dbg !842
  store i16 %conv46, ptr %arrayidx50, align 2, !dbg !843
  %inc = add nuw nsw i32 %k.0, 1, !dbg !844
    #dbg_value(i32 %inc, !827, !DIExpression(), !778)
  br label %for.cond39, !dbg !845, !llvm.loop !846

for.inc51:                                        ; preds = %for.cond39
  %add.ptr = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 5, !dbg !848
  %inc52 = add nuw nsw i32 %j.0, 1, !dbg !849
    #dbg_value(i32 %inc52, !793, !DIExpression(), !778)
  br label %for.cond1, !dbg !850, !llvm.loop !851

for.inc54:                                        ; preds = %for.cond1
  %a.addr.1.lcssa = phi ptr [ %a.addr.1, %for.cond1 ]
  %inc55 = add nuw nsw i32 %i.0, 1, !dbg !853
    #dbg_value(i32 %inc55, !782, !DIExpression(), !778)
  br label %for.cond, !dbg !854, !llvm.loop !855

for.end56:                                        ; preds = %for.cond
  ret void, !dbg !857
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !858 {
entry:
    #dbg_value(ptr %r, !859, !DIExpression(), !860)
    #dbg_value(ptr %a, !861, !DIExpression(), !860)
    #dbg_value(i32 0, !862, !DIExpression(), !860)
  br label %for.cond, !dbg !863

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !865
    #dbg_value(i32 %i.0, !862, !DIExpression(), !860)
  %exitcond = icmp ne i32 %i.0, 2, !dbg !866
  br i1 %exitcond, label %for.body, label %for.end, !dbg !868

for.body:                                         ; preds = %for.cond
  %mul = mul nuw nsw i32 %i.0, 384, !dbg !869
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 %mul, !dbg !870
  %arrayidx = getelementptr inbounds nuw [2 x [256 x i16]], ptr %a, i32 0, i32 %i.0, !dbg !871
  call void @pqcrystals_kyber512_ref_poly_tobytes(ptr noundef %add.ptr, ptr noundef %arrayidx) #3, !dbg !872
  %inc = add nuw nsw i32 %i.0, 1, !dbg !873
    #dbg_value(i32 %inc, !862, !DIExpression(), !860)
  br label %for.cond, !dbg !874, !llvm.loop !875

for.end:                                          ; preds = %for.cond
  ret void, !dbg !877
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_frombytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !878 {
entry:
    #dbg_value(ptr %r, !879, !DIExpression(), !880)
    #dbg_value(ptr %a, !881, !DIExpression(), !880)
    #dbg_value(i32 0, !882, !DIExpression(), !880)
  br label %for.cond, !dbg !883

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !885
    #dbg_value(i32 %i.0, !882, !DIExpression(), !880)
  %exitcond = icmp ne i32 %i.0, 2, !dbg !886
  br i1 %exitcond, label %for.body, label %for.end, !dbg !888

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [2 x [256 x i16]], ptr %r, i32 0, i32 %i.0, !dbg !889
  %mul = mul nuw nsw i32 %i.0, 384, !dbg !890
  %add.ptr = getelementptr inbounds nuw i8, ptr %a, i32 %mul, !dbg !891
  call void @pqcrystals_kyber512_ref_poly_frombytes(ptr noundef %arrayidx, ptr noundef %add.ptr) #3, !dbg !892
  %inc = add nuw nsw i32 %i.0, 1, !dbg !893
    #dbg_value(i32 %inc, !882, !DIExpression(), !880)
  br label %for.cond, !dbg !894, !llvm.loop !895

for.end:                                          ; preds = %for.cond
  ret void, !dbg !897
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !898 {
entry:
    #dbg_value(ptr %r, !901, !DIExpression(), !902)
    #dbg_value(i32 0, !903, !DIExpression(), !902)
  br label %for.cond, !dbg !904

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !906
    #dbg_value(i32 %i.0, !903, !DIExpression(), !902)
  %exitcond = icmp ne i32 %i.0, 2, !dbg !907
  br i1 %exitcond, label %for.body, label %for.end, !dbg !909

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [2 x [256 x i16]], ptr %r, i32 0, i32 %i.0, !dbg !910
  call void @pqcrystals_kyber512_ref_poly_ntt(ptr noundef %arrayidx) #3, !dbg !911
  %inc = add nuw nsw i32 %i.0, 1, !dbg !912
    #dbg_value(i32 %inc, !903, !DIExpression(), !902)
  br label %for.cond, !dbg !913, !llvm.loop !914

for.end:                                          ; preds = %for.cond
  ret void, !dbg !916
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_invntt_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !917 {
entry:
    #dbg_value(ptr %r, !918, !DIExpression(), !919)
    #dbg_value(i32 0, !920, !DIExpression(), !919)
  br label %for.cond, !dbg !921

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !923
    #dbg_value(i32 %i.0, !920, !DIExpression(), !919)
  %exitcond = icmp ne i32 %i.0, 2, !dbg !924
  br i1 %exitcond, label %for.body, label %for.end, !dbg !926

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [2 x [256 x i16]], ptr %r, i32 0, i32 %i.0, !dbg !927
  call void @pqcrystals_kyber512_ref_poly_invntt_tomont(ptr noundef %arrayidx) #3, !dbg !928
  %inc = add nuw nsw i32 %i.0, 1, !dbg !929
    #dbg_value(i32 %inc, !920, !DIExpression(), !919)
  br label %for.cond, !dbg !930, !llvm.loop !931

for.end:                                          ; preds = %for.cond
  ret void, !dbg !933
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !934 {
entry:
  %t = alloca [256 x i16], align 2
    #dbg_value(ptr %r, !937, !DIExpression(), !938)
    #dbg_value(ptr %a, !939, !DIExpression(), !938)
    #dbg_value(ptr %b, !940, !DIExpression(), !938)
    #dbg_declare(ptr %t, !941, !DIExpression(), !942)
  call void @pqcrystals_kyber512_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) #3, !dbg !943
    #dbg_value(i32 1, !944, !DIExpression(), !938)
    #dbg_value(i32 poison, !944, !DIExpression(), !938)
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %a, i32 512, !dbg !945
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %b, i32 512, !dbg !949
  call void @pqcrystals_kyber512_ref_poly_basemul_montgomery(ptr noundef nonnull %t, ptr noundef nonnull %arrayidx2, ptr noundef nonnull %arrayidx3) #3, !dbg !950
  call void @pqcrystals_kyber512_ref_poly_add(ptr noundef %r, ptr noundef %r, ptr noundef nonnull %t) #3, !dbg !951
    #dbg_value(i32 2, !944, !DIExpression(), !938)
    #dbg_value(i32 poison, !944, !DIExpression(), !938)
  call void @pqcrystals_kyber512_ref_poly_reduce(ptr noundef %r) #3, !dbg !952
  ret void, !dbg !953
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_reduce(ptr noundef %r) local_unnamed_addr #0 !dbg !954 {
entry:
    #dbg_value(ptr %r, !955, !DIExpression(), !956)
    #dbg_value(i32 0, !957, !DIExpression(), !956)
  br label %for.cond, !dbg !958

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !960
    #dbg_value(i32 %i.0, !957, !DIExpression(), !956)
  %exitcond = icmp ne i32 %i.0, 2, !dbg !961
  br i1 %exitcond, label %for.body, label %for.end, !dbg !963

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [2 x [256 x i16]], ptr %r, i32 0, i32 %i.0, !dbg !964
  call void @pqcrystals_kyber512_ref_poly_reduce(ptr noundef %arrayidx) #3, !dbg !965
  %inc = add nuw nsw i32 %i.0, 1, !dbg !966
    #dbg_value(i32 %inc, !957, !DIExpression(), !956)
  br label %for.cond, !dbg !967, !llvm.loop !968

for.end:                                          ; preds = %for.cond
  ret void, !dbg !970
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !971 {
entry:
    #dbg_value(ptr %r, !974, !DIExpression(), !975)
    #dbg_value(ptr %a, !976, !DIExpression(), !975)
    #dbg_value(ptr %b, !977, !DIExpression(), !975)
    #dbg_value(i32 0, !978, !DIExpression(), !975)
  br label %for.cond, !dbg !979

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !981
    #dbg_value(i32 %i.0, !978, !DIExpression(), !975)
  %exitcond = icmp ne i32 %i.0, 2, !dbg !982
  br i1 %exitcond, label %for.body, label %for.end, !dbg !984

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [2 x [256 x i16]], ptr %r, i32 0, i32 %i.0, !dbg !985
  %arrayidx1 = getelementptr inbounds nuw [2 x [256 x i16]], ptr %a, i32 0, i32 %i.0, !dbg !986
  %arrayidx2 = getelementptr inbounds nuw [2 x [256 x i16]], ptr %b, i32 0, i32 %i.0, !dbg !987
  call void @pqcrystals_kyber512_ref_poly_add(ptr noundef %arrayidx, ptr noundef %arrayidx1, ptr noundef %arrayidx2) #3, !dbg !988
  %inc = add nuw nsw i32 %i.0, 1, !dbg !989
    #dbg_value(i32 %inc, !978, !DIExpression(), !975)
  br label %for.cond, !dbg !990, !llvm.loop !991

for.end:                                          ; preds = %for.cond
  ret void, !dbg !993
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_compress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !994 {
entry:
  %t = alloca [8 x i8], align 1
    #dbg_value(ptr %r, !1000, !DIExpression(), !1001)
    #dbg_value(ptr %a, !1002, !DIExpression(), !1001)
    #dbg_declare(ptr %t, !1003, !DIExpression(), !1007)
    #dbg_value(i32 0, !1008, !DIExpression(), !1001)
  br label %for.cond, !dbg !1009

for.cond:                                         ; preds = %for.end, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc46, %for.end ], !dbg !1011
  %r.addr.0 = phi ptr [ %r, %entry ], [ %add.ptr, %for.end ]
    #dbg_value(ptr %r.addr.0, !1000, !DIExpression(), !1001)
    #dbg_value(i32 %i.0, !1008, !DIExpression(), !1001)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1012
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end47, !dbg !1014

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1015

for.cond1:                                        ; preds = %for.cond1.preheader, %for.body3
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond1.preheader ], !dbg !1018
    #dbg_value(i32 %j.0, !1019, !DIExpression(), !1001)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1020
  br i1 %exitcond, label %for.body3, label %for.end, !dbg !1015

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !1022
  %add = or disjoint i32 %mul, %j.0, !dbg !1024
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add, !dbg !1025
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1025
    #dbg_value(i16 %0, !1026, !DIExpression(), !1001)
  %isneg = icmp slt i16 %0, 0, !dbg !1027
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !1027
  %add5 = add i16 %and, %0, !dbg !1028
    #dbg_value(i16 %add5, !1026, !DIExpression(), !1001)
  %conv7 = sext i16 %add5 to i32, !dbg !1029
    #dbg_value(i32 %conv7, !1030, !DIExpression(DW_OP_constu, 4, DW_OP_shl, DW_OP_stack_value), !1001)
    #dbg_value(i32 %conv7, !1030, !DIExpression(DW_OP_constu, 4, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !1001)
  %1 = mul i32 %conv7, 1290160, !dbg !1031
  %mul9 = add i32 %1, 134257275, !dbg !1031
    #dbg_value(i32 %mul9, !1030, !DIExpression(), !1001)
  %shr10 = lshr i32 %mul9, 28, !dbg !1032
    #dbg_value(i32 %shr10, !1030, !DIExpression(), !1001)
  %conv12 = trunc nuw nsw i32 %shr10 to i8, !dbg !1033
  %arrayidx13 = getelementptr inbounds nuw [8 x i8], ptr %t, i32 0, i32 %j.0, !dbg !1034
  store i8 %conv12, ptr %arrayidx13, align 1, !dbg !1035
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1036
    #dbg_value(i32 %inc, !1019, !DIExpression(), !1001)
  br label %for.cond1, !dbg !1037, !llvm.loop !1038

for.end:                                          ; preds = %for.cond1
  %2 = load i8, ptr %t, align 1, !dbg !1040
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %t, i32 1, !dbg !1041
  %3 = load i8, ptr %arrayidx16, align 1, !dbg !1041
  %shl18 = shl i8 %3, 4, !dbg !1042
  %or = or i8 %shl18, %2, !dbg !1043
  store i8 %or, ptr %r.addr.0, align 1, !dbg !1044
  %arrayidx21 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !1045
  %4 = load i8, ptr %arrayidx21, align 1, !dbg !1045
  %arrayidx23 = getelementptr inbounds nuw i8, ptr %t, i32 3, !dbg !1046
  %5 = load i8, ptr %arrayidx23, align 1, !dbg !1046
  %shl25 = shl i8 %5, 4, !dbg !1047
  %or26 = or i8 %shl25, %4, !dbg !1048
  %arrayidx28 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 1, !dbg !1049
  store i8 %or26, ptr %arrayidx28, align 1, !dbg !1050
  %arrayidx29 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !1051
  %6 = load i8, ptr %arrayidx29, align 1, !dbg !1051
  %arrayidx31 = getelementptr inbounds nuw i8, ptr %t, i32 5, !dbg !1052
  %7 = load i8, ptr %arrayidx31, align 1, !dbg !1052
  %shl33 = shl i8 %7, 4, !dbg !1053
  %or34 = or i8 %shl33, %6, !dbg !1054
  %arrayidx36 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 2, !dbg !1055
  store i8 %or34, ptr %arrayidx36, align 1, !dbg !1056
  %arrayidx37 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !1057
  %8 = load i8, ptr %arrayidx37, align 1, !dbg !1057
  %arrayidx39 = getelementptr inbounds nuw i8, ptr %t, i32 7, !dbg !1058
  %9 = load i8, ptr %arrayidx39, align 1, !dbg !1058
  %shl41 = shl i8 %9, 4, !dbg !1059
  %or42 = or i8 %shl41, %8, !dbg !1060
  %arrayidx44 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 3, !dbg !1061
  store i8 %or42, ptr %arrayidx44, align 1, !dbg !1062
    #dbg_value(ptr %r.addr.0, !1000, !DIExpression(DW_OP_plus_uconst, 4, DW_OP_stack_value), !1001)
  %add.ptr = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 4, !dbg !1063
    #dbg_value(ptr %add.ptr, !1000, !DIExpression(), !1001)
  %inc46 = add nuw nsw i32 %i.0, 1, !dbg !1064
    #dbg_value(i32 %inc46, !1008, !DIExpression(), !1001)
  br label %for.cond, !dbg !1065, !llvm.loop !1066

for.end47:                                        ; preds = %for.cond
  ret void, !dbg !1068
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_decompress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1069 {
entry:
    #dbg_value(ptr %r, !1072, !DIExpression(), !1073)
    #dbg_value(ptr %a, !1074, !DIExpression(), !1073)
    #dbg_value(i32 0, !1075, !DIExpression(), !1073)
  br label %for.cond, !dbg !1076

for.cond:                                         ; preds = %for.body, %entry
  %a.addr.0 = phi ptr [ %a, %entry ], [ %add.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1078
    #dbg_value(i32 %i.0, !1075, !DIExpression(), !1073)
    #dbg_value(ptr %a.addr.0, !1074, !DIExpression(), !1073)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !1079
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1081

for.body:                                         ; preds = %for.cond
  %0 = load i8, ptr %a.addr.0, align 1, !dbg !1082
  %1 = and i8 %0, 15, !dbg !1084
  %conv2 = zext nneg i8 %1 to i32, !dbg !1085
  %mul = mul nuw nsw i32 %conv2, 3329, !dbg !1086
  %add = add nuw nsw i32 %mul, 8, !dbg !1087
  %shr = lshr i32 %add, 4, !dbg !1088
  %conv3 = trunc nuw nsw i32 %shr to i16, !dbg !1089
  %mul4 = shl nuw nsw i32 %i.0, 1, !dbg !1090
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul4, !dbg !1091
  store i16 %conv3, ptr %arrayidx6, align 2, !dbg !1092
  %2 = load i8, ptr %a.addr.0, align 1, !dbg !1093
  %3 = lshr i8 %2, 4, !dbg !1094
  %conv11 = zext nneg i8 %3 to i32, !dbg !1095
  %mul12 = mul nuw nsw i32 %conv11, 3329, !dbg !1096
  %add13 = add nuw nsw i32 %mul12, 8, !dbg !1097
  %shr14 = lshr i32 %add13, 4, !dbg !1098
  %conv15 = trunc nuw nsw i32 %shr14 to i16, !dbg !1099
  %mul16 = shl nuw nsw i32 %i.0, 1, !dbg !1100
  %add17 = or disjoint i32 %mul16, 1, !dbg !1101
  %arrayidx18 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add17, !dbg !1102
  store i16 %conv15, ptr %arrayidx18, align 2, !dbg !1103
    #dbg_value(ptr %a.addr.0, !1074, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1073)
  %add.ptr = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 1, !dbg !1104
    #dbg_value(ptr %add.ptr, !1074, !DIExpression(), !1073)
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1105
    #dbg_value(i32 %inc, !1075, !DIExpression(), !1073)
  br label %for.cond, !dbg !1106, !llvm.loop !1107

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1109
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_tobytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1110 {
entry:
    #dbg_value(ptr %r, !1111, !DIExpression(), !1112)
    #dbg_value(ptr %a, !1113, !DIExpression(), !1112)
    #dbg_value(i32 0, !1114, !DIExpression(), !1112)
  br label %for.cond, !dbg !1115

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1117
    #dbg_value(i32 %i.0, !1114, !DIExpression(), !1112)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !1118
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1120

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 1, !dbg !1121
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %mul, !dbg !1123
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1123
    #dbg_value(i16 %0, !1124, !DIExpression(), !1112)
  %isneg = icmp slt i16 %0, 0, !dbg !1125
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !1125
  %add = add i16 %and, %0, !dbg !1126
    #dbg_value(i16 %add, !1124, !DIExpression(), !1112)
  %mul3 = shl nuw nsw i32 %i.0, 1, !dbg !1127
  %add4 = or disjoint i32 %mul3, 1, !dbg !1128
  %arrayidx5 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add4, !dbg !1129
  %1 = load i16, ptr %arrayidx5, align 2, !dbg !1129
    #dbg_value(i16 %1, !1130, !DIExpression(), !1112)
  %isneg1 = icmp slt i16 %1, 0, !dbg !1131
  %and8 = select i1 %isneg1, i16 3329, i16 0, !dbg !1131
  %add10 = add i16 %and8, %1, !dbg !1132
    #dbg_value(i16 %add10, !1130, !DIExpression(), !1112)
  %conv14 = trunc i16 %add to i8, !dbg !1133
  %mul15 = mul nuw nsw i32 %i.0, 3, !dbg !1134
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %r, i32 %mul15, !dbg !1135
  store i8 %conv14, ptr %arrayidx17, align 1, !dbg !1136
  %2 = lshr i16 %add, 8, !dbg !1137
  %shr19 = trunc nuw i16 %2 to i8, !dbg !1137
  %conv20 = trunc i16 %add10 to i8, !dbg !1138
  %shl = shl i8 %conv20, 4, !dbg !1139
  %or = or i8 %shl, %shr19, !dbg !1140
  %mul22 = mul nuw nsw i32 %i.0, 3, !dbg !1141
  %3 = getelementptr inbounds nuw i8, ptr %r, i32 %mul22, !dbg !1142
  %arrayidx24 = getelementptr inbounds nuw i8, ptr %3, i32 1, !dbg !1142
  store i8 %or, ptr %arrayidx24, align 1, !dbg !1143
  %4 = lshr i16 %add10, 4, !dbg !1144
  %conv27 = trunc i16 %4 to i8, !dbg !1145
  %mul28 = mul nuw nsw i32 %i.0, 3, !dbg !1146
  %5 = getelementptr inbounds nuw i8, ptr %r, i32 %mul28, !dbg !1147
  %arrayidx30 = getelementptr inbounds nuw i8, ptr %5, i32 2, !dbg !1147
  store i8 %conv27, ptr %arrayidx30, align 1, !dbg !1148
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1149
    #dbg_value(i32 %inc, !1114, !DIExpression(), !1112)
  br label %for.cond, !dbg !1150, !llvm.loop !1151

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1153
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_frombytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1154 {
entry:
    #dbg_value(ptr %r, !1155, !DIExpression(), !1156)
    #dbg_value(ptr %a, !1157, !DIExpression(), !1156)
    #dbg_value(i32 0, !1158, !DIExpression(), !1156)
  br label %for.cond, !dbg !1159

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1161
    #dbg_value(i32 %i.0, !1158, !DIExpression(), !1156)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !1162
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1164

for.body:                                         ; preds = %for.cond
  %mul = mul nuw nsw i32 %i.0, 3, !dbg !1165
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %mul, !dbg !1167
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1167
  %conv = zext i8 %0 to i16, !dbg !1167
  %mul1 = mul nuw nsw i32 %i.0, 3, !dbg !1168
  %1 = getelementptr inbounds nuw i8, ptr %a, i32 %mul1, !dbg !1169
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %1, i32 1, !dbg !1169
  %2 = load i8, ptr %arrayidx3, align 1, !dbg !1169
  %conv5 = zext i8 %2 to i16, !dbg !1170
  %shl = shl nuw i16 %conv5, 8, !dbg !1171
  %shl.masked = and i16 %shl, 3840, !dbg !1172
  %and = or disjoint i16 %shl.masked, %conv, !dbg !1172
  %mul7 = shl nuw nsw i32 %i.0, 1, !dbg !1173
  %arrayidx8 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul7, !dbg !1174
  store i16 %and, ptr %arrayidx8, align 2, !dbg !1175
  %mul9 = mul nuw nsw i32 %i.0, 3, !dbg !1176
  %3 = getelementptr inbounds nuw i8, ptr %a, i32 %mul9, !dbg !1177
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %3, i32 1, !dbg !1177
  %4 = load i8, ptr %arrayidx11, align 1, !dbg !1177
  %5 = lshr i8 %4, 4, !dbg !1178
  %shr13 = zext nneg i8 %5 to i16, !dbg !1178
  %mul14 = mul nuw nsw i32 %i.0, 3, !dbg !1179
  %6 = getelementptr inbounds nuw i8, ptr %a, i32 %mul14, !dbg !1180
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %6, i32 2, !dbg !1180
  %7 = load i8, ptr %arrayidx16, align 1, !dbg !1180
  %conv18 = zext i8 %7 to i16, !dbg !1181
  %shl19 = shl nuw nsw i16 %conv18, 4, !dbg !1182
  %or20 = or disjoint i16 %shl19, %shr13, !dbg !1183
  %mul23 = shl nuw nsw i32 %i.0, 1, !dbg !1184
  %add24 = or disjoint i32 %mul23, 1, !dbg !1185
  %arrayidx25 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add24, !dbg !1186
  store i16 %or20, ptr %arrayidx25, align 2, !dbg !1187
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1188
    #dbg_value(i32 %inc, !1158, !DIExpression(), !1156)
  br label %for.cond, !dbg !1189, !llvm.loop !1190

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1192
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_frommsg(ptr noundef %r, ptr noundef %msg) local_unnamed_addr #0 !dbg !1193 {
entry:
    #dbg_value(ptr %r, !1194, !DIExpression(), !1195)
    #dbg_value(ptr %msg, !1196, !DIExpression(), !1195)
    #dbg_value(i32 0, !1197, !DIExpression(), !1195)
  br label %for.cond, !dbg !1198

for.cond:                                         ; preds = %for.inc8, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc9, %for.inc8 ], !dbg !1200
    #dbg_value(i32 %i.0, !1197, !DIExpression(), !1195)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1201
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end10, !dbg !1203

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1204

for.cond1:                                        ; preds = %for.cond1.preheader, %for.body3
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond1.preheader ], !dbg !1207
    #dbg_value(i32 %j.0, !1208, !DIExpression(), !1195)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1209
  br i1 %exitcond, label %for.body3, label %for.inc8, !dbg !1204

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !1211
  %add = or disjoint i32 %mul, %j.0, !dbg !1213
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add, !dbg !1214
  store i16 0, ptr %arrayidx, align 2, !dbg !1215
  %add.ptr.idx = shl nuw nsw i32 %i.0, 4, !dbg !1216
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 %add.ptr.idx, !dbg !1216
  %add.ptr5 = getelementptr inbounds nuw i16, ptr %add.ptr, i32 %j.0, !dbg !1217
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1218
  %0 = load i8, ptr %arrayidx6, align 1, !dbg !1218
  %conv = zext i8 %0 to i32, !dbg !1218
  %shr = lshr i32 %conv, %j.0, !dbg !1219
  %1 = trunc nuw nsw i32 %shr to i16, !dbg !1220
  %conv7 = and i16 %1, 1, !dbg !1220
  call void @pqcrystals_kyber512_ref_cmov_int16(ptr noundef %add.ptr5, i16 noundef signext 1665, i16 noundef zeroext %conv7) #3, !dbg !1221
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1222
    #dbg_value(i32 %inc, !1208, !DIExpression(), !1195)
  br label %for.cond1, !dbg !1223, !llvm.loop !1224

for.inc8:                                         ; preds = %for.cond1
  %inc9 = add nuw nsw i32 %i.0, 1, !dbg !1226
    #dbg_value(i32 %inc9, !1197, !DIExpression(), !1195)
  br label %for.cond, !dbg !1227, !llvm.loop !1228

for.end10:                                        ; preds = %for.cond
  ret void, !dbg !1230
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_tomsg(ptr noundef %msg, ptr noundef %a) local_unnamed_addr #0 !dbg !1231 {
entry:
    #dbg_value(ptr %msg, !1232, !DIExpression(), !1233)
    #dbg_value(ptr %a, !1234, !DIExpression(), !1233)
    #dbg_value(i32 0, !1235, !DIExpression(), !1233)
  br label %for.cond, !dbg !1236

for.cond:                                         ; preds = %for.inc11, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc12, %for.inc11 ], !dbg !1238
    #dbg_value(i32 %i.0, !1235, !DIExpression(), !1233)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1239
  br i1 %exitcond1, label %for.body, label %for.end13, !dbg !1241

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1242
  store i8 0, ptr %arrayidx, align 1, !dbg !1244
    #dbg_value(i32 0, !1245, !DIExpression(), !1233)
  br label %for.cond1, !dbg !1246

for.cond1:                                        ; preds = %for.body3, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body3 ], !dbg !1248
    #dbg_value(i32 %j.0, !1245, !DIExpression(), !1233)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1249
  br i1 %exitcond, label %for.body3, label %for.inc11, !dbg !1251

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !1252
  %add = or disjoint i32 %mul, %j.0, !dbg !1254
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add, !dbg !1255
  %0 = load i16, ptr %arrayidx4, align 2, !dbg !1255
  %conv = sext i16 %0 to i32, !dbg !1255
    #dbg_value(i32 %conv, !1256, !DIExpression(), !1233)
    #dbg_value(i32 %conv, !1256, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_stack_value), !1233)
    #dbg_value(i32 %conv, !1256, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !1233)
  %1 = mul i32 %conv, 161270, !dbg !1257
  %mul6 = add i32 %1, 134257275, !dbg !1257
    #dbg_value(i32 %mul6, !1256, !DIExpression(), !1233)
  %shr = lshr i32 %mul6, 28, !dbg !1258
    #dbg_value(i32 %shr, !1256, !DIExpression(), !1233)
  %and = and i32 %shr, 1, !dbg !1259
    #dbg_value(i32 %and, !1256, !DIExpression(), !1233)
  %shl7 = shl nuw nsw i32 %and, %j.0, !dbg !1260
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1261
  %2 = load i8, ptr %arrayidx8, align 1, !dbg !1262
  %3 = trunc nuw i32 %shl7 to i8, !dbg !1262
  %conv10 = or i8 %2, %3, !dbg !1262
  store i8 %conv10, ptr %arrayidx8, align 1, !dbg !1262
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1263
    #dbg_value(i32 %inc, !1245, !DIExpression(), !1233)
  br label %for.cond1, !dbg !1264, !llvm.loop !1265

for.inc11:                                        ; preds = %for.cond1
  %inc12 = add nuw nsw i32 %i.0, 1, !dbg !1267
    #dbg_value(i32 %inc12, !1235, !DIExpression(), !1233)
  br label %for.cond, !dbg !1268, !llvm.loop !1269

for.end13:                                        ; preds = %for.cond
  ret void, !dbg !1271
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_getnoise_eta1(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !1272 {
entry:
  %buf = alloca [192 x i8], align 1
    #dbg_value(ptr %r, !1275, !DIExpression(), !1276)
    #dbg_value(ptr %seed, !1277, !DIExpression(), !1276)
    #dbg_value(i8 %nonce, !1278, !DIExpression(), !1276)
    #dbg_declare(ptr %buf, !1279, !DIExpression(), !1283)
  call void @pqcrystals_kyber512_ref_kyber_shake256_prf(ptr noundef nonnull %buf, i32 noundef 192, ptr noundef %seed, i8 noundef zeroext %nonce) #3, !dbg !1284
  call void @pqcrystals_kyber512_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef nonnull %buf) #3, !dbg !1285
  ret void, !dbg !1286
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_getnoise_eta2(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !1287 {
entry:
  %buf = alloca [128 x i8], align 1
    #dbg_value(ptr %r, !1288, !DIExpression(), !1289)
    #dbg_value(ptr %seed, !1290, !DIExpression(), !1289)
    #dbg_value(i8 %nonce, !1291, !DIExpression(), !1289)
    #dbg_declare(ptr %buf, !1292, !DIExpression(), !1294)
  call void @pqcrystals_kyber512_ref_kyber_shake256_prf(ptr noundef nonnull %buf, i32 noundef 128, ptr noundef %seed, i8 noundef zeroext %nonce) #3, !dbg !1295
  call void @pqcrystals_kyber512_ref_poly_cbd_eta2(ptr noundef %r, ptr noundef nonnull %buf) #3, !dbg !1296
  ret void, !dbg !1297
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1298 {
entry:
    #dbg_value(ptr %r, !1301, !DIExpression(), !1302)
  call void @pqcrystals_kyber512_ref_ntt(ptr noundef %r) #3, !dbg !1303
  call void @pqcrystals_kyber512_ref_poly_reduce(ptr noundef %r) #3, !dbg !1304
  ret void, !dbg !1305
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_reduce(ptr noundef %r) local_unnamed_addr #0 !dbg !1306 {
entry:
    #dbg_value(ptr %r, !1307, !DIExpression(), !1308)
    #dbg_value(i32 0, !1309, !DIExpression(), !1308)
  br label %for.cond, !dbg !1310

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1312
    #dbg_value(i32 %i.0, !1309, !DIExpression(), !1308)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1313
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1315

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1316
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1316
  %call = call signext i16 @pqcrystals_kyber512_ref_barrett_reduce(i16 noundef signext %0) #3, !dbg !1317
  %arrayidx1 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1318
  store i16 %call, ptr %arrayidx1, align 2, !dbg !1319
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1320
    #dbg_value(i32 %inc, !1309, !DIExpression(), !1308)
  br label %for.cond, !dbg !1321, !llvm.loop !1322

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1324
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_invntt_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !1325 {
entry:
    #dbg_value(ptr %r, !1326, !DIExpression(), !1327)
  call void @pqcrystals_kyber512_ref_invntt(ptr noundef %r) #3, !dbg !1328
  ret void, !dbg !1329
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1330 {
entry:
    #dbg_value(ptr %r, !1333, !DIExpression(), !1334)
    #dbg_value(ptr %a, !1335, !DIExpression(), !1334)
    #dbg_value(ptr %b, !1336, !DIExpression(), !1334)
    #dbg_value(i32 0, !1337, !DIExpression(), !1334)
  br label %for.cond, !dbg !1338

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1340
    #dbg_value(i32 %i.0, !1337, !DIExpression(), !1334)
  %exitcond = icmp ne i32 %i.0, 64, !dbg !1341
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1343

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 2, !dbg !1344
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul, !dbg !1346
  %mul1 = shl nuw nsw i32 %i.0, 2, !dbg !1347
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %mul1, !dbg !1348
  %mul3 = shl nuw nsw i32 %i.0, 2, !dbg !1349
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %mul3, !dbg !1350
  %add = or disjoint i32 %i.0, 64, !dbg !1351
  %arrayidx5 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber512_ref_zetas, i32 0, i32 %add, !dbg !1352
  %0 = load i16, ptr %arrayidx5, align 2, !dbg !1352
  call void @pqcrystals_kyber512_ref_basemul(ptr noundef %arrayidx, ptr noundef %arrayidx2, ptr noundef %arrayidx4, i16 noundef signext %0) #3, !dbg !1353
  %mul6 = shl nuw nsw i32 %i.0, 2, !dbg !1354
  %add7 = or disjoint i32 %mul6, 2, !dbg !1355
  %arrayidx8 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add7, !dbg !1356
  %mul9 = shl nuw nsw i32 %i.0, 2, !dbg !1357
  %add10 = or disjoint i32 %mul9, 2, !dbg !1358
  %arrayidx11 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add10, !dbg !1359
  %mul12 = shl nuw nsw i32 %i.0, 2, !dbg !1360
  %add13 = or disjoint i32 %mul12, 2, !dbg !1361
  %arrayidx14 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %add13, !dbg !1362
  %add15 = or disjoint i32 %i.0, 64, !dbg !1363
  %arrayidx16 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber512_ref_zetas, i32 0, i32 %add15, !dbg !1364
  %1 = load i16, ptr %arrayidx16, align 2, !dbg !1364
  %sub = sub i16 0, %1, !dbg !1365
  call void @pqcrystals_kyber512_ref_basemul(ptr noundef nonnull %arrayidx8, ptr noundef nonnull %arrayidx11, ptr noundef nonnull %arrayidx14, i16 noundef signext %sub) #3, !dbg !1366
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1367
    #dbg_value(i32 %inc, !1337, !DIExpression(), !1334)
  br label %for.cond, !dbg !1368, !llvm.loop !1369

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1371
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !1372 {
entry:
    #dbg_value(ptr %r, !1373, !DIExpression(), !1374)
    #dbg_value(i16 1353, !1375, !DIExpression(), !1374)
    #dbg_value(i32 0, !1376, !DIExpression(), !1374)
  br label %for.cond, !dbg !1377

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1379
    #dbg_value(i32 %i.0, !1376, !DIExpression(), !1374)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1380
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1382

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1383
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1383
  %conv = sext i16 %0 to i32, !dbg !1384
  %mul = mul nsw i32 %conv, 1353, !dbg !1385
  %call = call signext i16 @pqcrystals_kyber512_ref_montgomery_reduce(i32 noundef %mul) #3, !dbg !1386
  %arrayidx1 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1387
  store i16 %call, ptr %arrayidx1, align 2, !dbg !1388
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1389
    #dbg_value(i32 %inc, !1376, !DIExpression(), !1374)
  br label %for.cond, !dbg !1390, !llvm.loop !1391

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1393
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1394 {
entry:
    #dbg_value(ptr %r, !1395, !DIExpression(), !1396)
    #dbg_value(ptr %a, !1397, !DIExpression(), !1396)
    #dbg_value(ptr %b, !1398, !DIExpression(), !1396)
    #dbg_value(i32 0, !1399, !DIExpression(), !1396)
  br label %for.cond, !dbg !1400

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1402
    #dbg_value(i32 %i.0, !1399, !DIExpression(), !1396)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1403
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1405

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %i.0, !dbg !1406
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1406
  %arrayidx1 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %i.0, !dbg !1407
  %1 = load i16, ptr %arrayidx1, align 2, !dbg !1407
  %add = add i16 %0, %1, !dbg !1408
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1409
  store i16 %add, ptr %arrayidx4, align 2, !dbg !1410
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1411
    #dbg_value(i32 %inc, !1399, !DIExpression(), !1396)
  br label %for.cond, !dbg !1412, !llvm.loop !1413

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1415
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_sub(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1416 {
entry:
    #dbg_value(ptr %r, !1417, !DIExpression(), !1418)
    #dbg_value(ptr %a, !1419, !DIExpression(), !1418)
    #dbg_value(ptr %b, !1420, !DIExpression(), !1418)
    #dbg_value(i32 0, !1421, !DIExpression(), !1418)
  br label %for.cond, !dbg !1422

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1424
    #dbg_value(i32 %i.0, !1421, !DIExpression(), !1418)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1425
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1427

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %i.0, !dbg !1428
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1428
  %arrayidx1 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %i.0, !dbg !1429
  %1 = load i16, ptr %arrayidx1, align 2, !dbg !1429
  %sub = sub i16 %0, %1, !dbg !1430
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1431
  store i16 %sub, ptr %arrayidx4, align 2, !dbg !1432
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1433
    #dbg_value(i32 %inc, !1421, !DIExpression(), !1418)
  br label %for.cond, !dbg !1434, !llvm.loop !1435

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1437
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1438 {
entry:
    #dbg_value(ptr %r, !1441, !DIExpression(), !1442)
    #dbg_value(i32 1, !1443, !DIExpression(), !1442)
    #dbg_value(i32 128, !1444, !DIExpression(), !1442)
  br label %for.cond, !dbg !1445

for.cond:                                         ; preds = %for.inc24, %entry
  %len.0 = phi i32 [ 128, %entry ], [ %shr, %for.inc24 ], !dbg !1447
  %k.0 = phi i32 [ 1, %entry ], [ %k.1.lcssa, %for.inc24 ], !dbg !1448
    #dbg_value(i32 %k.0, !1443, !DIExpression(), !1442)
    #dbg_value(i32 %len.0, !1444, !DIExpression(), !1442)
  %cmp = icmp samesign ugt i32 %len.0, 1, !dbg !1449
  br i1 %cmp, label %for.cond1.preheader, label %for.end25, !dbg !1451

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1452

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc21
  %start.0 = phi i32 [ %add22, %for.inc21 ], [ 0, %for.cond1.preheader ], !dbg !1455
  %k.1 = phi i32 [ %inc, %for.inc21 ], [ %k.0, %for.cond1.preheader ], !dbg !1442
    #dbg_value(i32 %k.1, !1443, !DIExpression(), !1442)
    #dbg_value(i32 %start.0, !1456, !DIExpression(), !1442)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !1457
  br i1 %cmp2, label %for.body3, label %for.inc24, !dbg !1452

for.body3:                                        ; preds = %for.cond1
    #dbg_value(i32 %inc, !1443, !DIExpression(), !1442)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber512_ref_zetas, i32 0, i32 %k.1, !dbg !1459
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1459
    #dbg_value(i16 %0, !1461, !DIExpression(), !1442)
    #dbg_value(i32 %start.0, !1462, !DIExpression(), !1442)
  br label %for.cond4, !dbg !1463

for.cond4:                                        ; preds = %for.body6, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc20, %for.body6 ], !dbg !1465
    #dbg_value(i32 %j.0, !1462, !DIExpression(), !1442)
  %add = add nuw nsw i32 %start.0, %len.0, !dbg !1466
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !1468
  br i1 %cmp5, label %for.body6, label %for.inc21, !dbg !1469

for.body6:                                        ; preds = %for.cond4
  %1 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1470
  %arrayidx8 = getelementptr i16, ptr %1, i32 %len.0, !dbg !1470
  %2 = load i16, ptr %arrayidx8, align 2, !dbg !1470
  %call = call fastcc signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %2) #3, !dbg !1472
    #dbg_value(i16 %call, !1473, !DIExpression(), !1442)
  %arrayidx9 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1474
  %3 = load i16, ptr %arrayidx9, align 2, !dbg !1474
  %sub = sub i16 %3, %call, !dbg !1475
  %4 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1476
  %arrayidx13 = getelementptr i16, ptr %4, i32 %len.0, !dbg !1476
  store i16 %sub, ptr %arrayidx13, align 2, !dbg !1477
  %arrayidx14 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1478
  %5 = load i16, ptr %arrayidx14, align 2, !dbg !1478
  %add17 = add i16 %5, %call, !dbg !1479
  %arrayidx19 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1480
  store i16 %add17, ptr %arrayidx19, align 2, !dbg !1481
  %inc20 = add nuw i32 %j.0, 1, !dbg !1482
    #dbg_value(i32 %inc20, !1462, !DIExpression(), !1442)
  br label %for.cond4, !dbg !1483, !llvm.loop !1484

for.inc21:                                        ; preds = %for.cond4
  %j.0.lcssa = phi i32 [ %j.0, %for.cond4 ], !dbg !1465
  %inc = add i32 %k.1, 1, !dbg !1486
  %add22 = add i32 %j.0.lcssa, %len.0, !dbg !1487
    #dbg_value(i32 %add22, !1456, !DIExpression(), !1442)
  br label %for.cond1, !dbg !1488, !llvm.loop !1489

for.inc24:                                        ; preds = %for.cond1
  %k.1.lcssa = phi i32 [ %k.1, %for.cond1 ], !dbg !1442
  %shr = lshr i32 %len.0, 1, !dbg !1491
    #dbg_value(i32 %shr, !1444, !DIExpression(), !1442)
  br label %for.cond, !dbg !1492, !llvm.loop !1493

for.end25:                                        ; preds = %for.cond
  ret void, !dbg !1495
}

; Function Attrs: nounwind
define internal fastcc signext i16 @fqmul(i16 noundef signext %a, i16 noundef signext %b) unnamed_addr #0 !dbg !1496 {
entry:
    #dbg_value(i16 %a, !1499, !DIExpression(), !1500)
    #dbg_value(i16 %b, !1501, !DIExpression(), !1500)
  %conv = sext i16 %a to i32, !dbg !1502
  %conv1 = sext i16 %b to i32, !dbg !1503
  %mul = mul nsw i32 %conv, %conv1, !dbg !1504
  %call = call signext i16 @pqcrystals_kyber512_ref_montgomery_reduce(i32 noundef %mul) #3, !dbg !1505
  ret i16 %call, !dbg !1506
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_invntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1507 {
entry:
    #dbg_value(ptr %r, !1508, !DIExpression(), !1509)
    #dbg_value(i16 1441, !1510, !DIExpression(), !1509)
    #dbg_value(i32 127, !1511, !DIExpression(), !1509)
    #dbg_value(i32 2, !1512, !DIExpression(), !1509)
  br label %for.cond, !dbg !1513

for.cond:                                         ; preds = %for.inc29, %entry
  %len.0 = phi i32 [ 2, %entry ], [ %shl, %for.inc29 ], !dbg !1515
  %k.0 = phi i32 [ 127, %entry ], [ %k.1.lcssa, %for.inc29 ], !dbg !1516
    #dbg_value(i32 %k.0, !1511, !DIExpression(), !1509)
    #dbg_value(i32 %len.0, !1512, !DIExpression(), !1509)
  %cmp = icmp ult i32 %len.0, 129, !dbg !1517
  br i1 %cmp, label %for.cond1.preheader, label %for.cond31.preheader, !dbg !1519

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1520

for.cond31.preheader:                             ; preds = %for.cond
  br label %for.cond31, !dbg !1523

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc26
  %start.0 = phi i32 [ %add27, %for.inc26 ], [ 0, %for.cond1.preheader ], !dbg !1525
  %k.1 = phi i32 [ %dec, %for.inc26 ], [ %k.0, %for.cond1.preheader ], !dbg !1509
    #dbg_value(i32 %k.1, !1511, !DIExpression(), !1509)
    #dbg_value(i32 %start.0, !1526, !DIExpression(), !1509)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !1527
  br i1 %cmp2, label %for.body3, label %for.inc29, !dbg !1520

for.body3:                                        ; preds = %for.cond1
    #dbg_value(i32 %dec, !1511, !DIExpression(), !1509)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber512_ref_zetas, i32 0, i32 %k.1, !dbg !1529
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1529
    #dbg_value(i16 %0, !1531, !DIExpression(), !1509)
    #dbg_value(i32 %start.0, !1532, !DIExpression(), !1509)
  br label %for.cond4, !dbg !1533

for.cond4:                                        ; preds = %for.body6, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc, %for.body6 ], !dbg !1535
    #dbg_value(i32 %j.0, !1532, !DIExpression(), !1509)
  %add = add nuw nsw i32 %start.0, %len.0, !dbg !1536
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !1538
  br i1 %cmp5, label %for.body6, label %for.inc26, !dbg !1539

for.body6:                                        ; preds = %for.cond4
  %arrayidx7 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1540
  %1 = load i16, ptr %arrayidx7, align 2, !dbg !1540
    #dbg_value(i16 %1, !1542, !DIExpression(), !1509)
  %2 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1543
  %arrayidx9 = getelementptr i16, ptr %2, i32 %len.0, !dbg !1543
  %3 = load i16, ptr %arrayidx9, align 2, !dbg !1543
  %add11 = add i16 %1, %3, !dbg !1544
  %call = call signext i16 @pqcrystals_kyber512_ref_barrett_reduce(i16 noundef signext %add11) #3, !dbg !1545
  %arrayidx13 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1546
  store i16 %call, ptr %arrayidx13, align 2, !dbg !1547
  %4 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1548
  %arrayidx15 = getelementptr i16, ptr %4, i32 %len.0, !dbg !1548
  %5 = load i16, ptr %arrayidx15, align 2, !dbg !1548
  %sub = sub i16 %5, %1, !dbg !1549
  %6 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1550
  %arrayidx20 = getelementptr i16, ptr %6, i32 %len.0, !dbg !1550
  store i16 %sub, ptr %arrayidx20, align 2, !dbg !1551
  %7 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1552
  %arrayidx22 = getelementptr i16, ptr %7, i32 %len.0, !dbg !1552
  %8 = load i16, ptr %arrayidx22, align 2, !dbg !1552
  %call23 = call fastcc signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %8) #3, !dbg !1553
  %9 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1554
  %arrayidx25 = getelementptr i16, ptr %9, i32 %len.0, !dbg !1554
  store i16 %call23, ptr %arrayidx25, align 2, !dbg !1555
  %inc = add nuw i32 %j.0, 1, !dbg !1556
    #dbg_value(i32 %inc, !1532, !DIExpression(), !1509)
  br label %for.cond4, !dbg !1557, !llvm.loop !1558

for.inc26:                                        ; preds = %for.cond4
  %j.0.lcssa = phi i32 [ %j.0, %for.cond4 ], !dbg !1535
  %dec = add i32 %k.1, -1, !dbg !1560
  %add27 = add i32 %j.0.lcssa, %len.0, !dbg !1561
    #dbg_value(i32 %add27, !1526, !DIExpression(), !1509)
  br label %for.cond1, !dbg !1562, !llvm.loop !1563

for.inc29:                                        ; preds = %for.cond1
  %k.1.lcssa = phi i32 [ %k.1, %for.cond1 ], !dbg !1509
  %shl = shl nuw nsw i32 %len.0, 1, !dbg !1565
    #dbg_value(i32 %shl, !1512, !DIExpression(), !1509)
  br label %for.cond, !dbg !1566, !llvm.loop !1567

for.cond31:                                       ; preds = %for.cond31.preheader, %for.body34
  %j.1 = phi i32 [ %inc39, %for.body34 ], [ 0, %for.cond31.preheader ], !dbg !1569
    #dbg_value(i32 %j.1, !1532, !DIExpression(), !1509)
  %exitcond = icmp ne i32 %j.1, 256, !dbg !1570
  br i1 %exitcond, label %for.body34, label %for.end40, !dbg !1523

for.body34:                                       ; preds = %for.cond31
  %arrayidx35 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !1572
  %10 = load i16, ptr %arrayidx35, align 2, !dbg !1572
  %call36 = call fastcc signext i16 @fqmul(i16 noundef signext %10, i16 noundef signext 1441) #3, !dbg !1573
  %arrayidx37 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !1574
  store i16 %call36, ptr %arrayidx37, align 2, !dbg !1575
  %inc39 = add nuw nsw i32 %j.1, 1, !dbg !1576
    #dbg_value(i32 %inc39, !1532, !DIExpression(), !1509)
  br label %for.cond31, !dbg !1577, !llvm.loop !1578

for.end40:                                        ; preds = %for.cond31
  ret void, !dbg !1580
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_basemul(ptr noundef %r, ptr noundef %a, ptr noundef %b, i16 noundef signext %zeta) local_unnamed_addr #0 !dbg !1581 {
entry:
    #dbg_value(ptr %r, !1585, !DIExpression(), !1586)
    #dbg_value(ptr %a, !1587, !DIExpression(), !1586)
    #dbg_value(ptr %b, !1588, !DIExpression(), !1586)
    #dbg_value(i16 %zeta, !1589, !DIExpression(), !1586)
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 2, !dbg !1590
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1590
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 2, !dbg !1591
  %1 = load i16, ptr %arrayidx1, align 2, !dbg !1591
  %call = call fastcc signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %1) #3, !dbg !1592
  store i16 %call, ptr %r, align 2, !dbg !1593
  %call4 = call fastcc signext i16 @fqmul(i16 noundef signext %call, i16 noundef signext %zeta) #3, !dbg !1594
  store i16 %call4, ptr %r, align 2, !dbg !1595
  %2 = load i16, ptr %a, align 2, !dbg !1596
  %3 = load i16, ptr %b, align 2, !dbg !1597
  %call8 = call fastcc signext i16 @fqmul(i16 noundef signext %2, i16 noundef signext %3) #3, !dbg !1598
  %4 = load i16, ptr %r, align 2, !dbg !1599
  %add = add i16 %4, %call8, !dbg !1599
  store i16 %add, ptr %r, align 2, !dbg !1599
  %5 = load i16, ptr %a, align 2, !dbg !1600
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %b, i32 2, !dbg !1601
  %6 = load i16, ptr %arrayidx13, align 2, !dbg !1601
  %call14 = call fastcc signext i16 @fqmul(i16 noundef signext %5, i16 noundef signext %6) #3, !dbg !1602
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %r, i32 2, !dbg !1603
  store i16 %call14, ptr %arrayidx15, align 2, !dbg !1604
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %a, i32 2, !dbg !1605
  %7 = load i16, ptr %arrayidx16, align 2, !dbg !1605
  %8 = load i16, ptr %b, align 2, !dbg !1606
  %call18 = call fastcc signext i16 @fqmul(i16 noundef signext %7, i16 noundef signext %8) #3, !dbg !1607
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %r, i32 2, !dbg !1608
  %9 = load i16, ptr %arrayidx20, align 2, !dbg !1609
  %add22 = add i16 %9, %call18, !dbg !1609
  store i16 %add22, ptr %arrayidx20, align 2, !dbg !1609
  ret void, !dbg !1610
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef %buf) local_unnamed_addr #0 !dbg !1611 {
entry:
    #dbg_value(ptr %r, !1613, !DIExpression(), !1614)
    #dbg_value(ptr %buf, !1615, !DIExpression(), !1614)
  call fastcc void @cbd3(ptr noundef %r, ptr noundef %buf) #3, !dbg !1616
  ret void, !dbg !1617
}

; Function Attrs: nounwind
define internal fastcc void @cbd3(ptr noundef %r, ptr noundef %buf) unnamed_addr #0 !dbg !1618 {
entry:
    #dbg_value(ptr %r, !1619, !DIExpression(), !1620)
    #dbg_value(ptr %buf, !1621, !DIExpression(), !1620)
    #dbg_value(i32 0, !1622, !DIExpression(), !1620)
  br label %for.cond, !dbg !1623

for.cond:                                         ; preds = %for.inc22, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc23, %for.inc22 ], !dbg !1625
    #dbg_value(i32 %i.0, !1622, !DIExpression(), !1620)
  %exitcond1 = icmp ne i32 %i.0, 64, !dbg !1626
  br i1 %exitcond1, label %for.body, label %for.end24, !dbg !1628

for.body:                                         ; preds = %for.cond
  %mul = mul nuw nsw i32 %i.0, 3, !dbg !1629
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 %mul, !dbg !1631
  %call = call fastcc i32 @load24_littleendian(ptr noundef %add.ptr) #3, !dbg !1632
    #dbg_value(i32 %call, !1633, !DIExpression(), !1620)
  %and = and i32 %call, 2396745, !dbg !1634
    #dbg_value(i32 %and, !1635, !DIExpression(), !1620)
  %shr = lshr i32 %call, 1, !dbg !1636
  %and1 = and i32 %shr, 2396745, !dbg !1637
  %add = add nuw nsw i32 %and, %and1, !dbg !1638
    #dbg_value(i32 %add, !1635, !DIExpression(), !1620)
  %shr2 = lshr i32 %call, 2, !dbg !1639
  %and3 = and i32 %shr2, 2396745, !dbg !1640
  %add4 = add nuw nsw i32 %add, %and3, !dbg !1641
    #dbg_value(i32 %add4, !1635, !DIExpression(), !1620)
    #dbg_value(i32 0, !1642, !DIExpression(), !1620)
  br label %for.cond5, !dbg !1643

for.cond5:                                        ; preds = %for.body7, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body7 ], !dbg !1645
    #dbg_value(i32 %j.0, !1642, !DIExpression(), !1620)
  %exitcond = icmp ne i32 %j.0, 4, !dbg !1646
  br i1 %exitcond, label %for.body7, label %for.inc22, !dbg !1648

for.body7:                                        ; preds = %for.cond5
  %mul8 = mul nuw nsw i32 %j.0, 6, !dbg !1649
  %shr10 = lshr i32 %add4, %mul8, !dbg !1651
  %conv = and i32 %shr10, 7, !dbg !1652
    #dbg_value(i32 %shr10, !1653, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 7, DW_OP_and, DW_OP_stack_value), !1620)
  %mul12 = mul nuw nsw i32 %j.0, 6, !dbg !1654
  %add13 = add nuw nsw i32 %mul12, 3, !dbg !1655
  %shr14 = lshr i32 %add4, %add13, !dbg !1656
  %conv16 = and i32 %shr14, 7, !dbg !1657
    #dbg_value(i32 %conv16, !1658, !DIExpression(), !1620)
  %sub = sub nsw i32 %conv, %conv16, !dbg !1659
  %conv19 = trunc nsw i32 %sub to i16, !dbg !1660
  %mul20 = shl nuw nsw i32 %i.0, 2, !dbg !1661
  %add21 = or disjoint i32 %mul20, %j.0, !dbg !1662
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add21, !dbg !1663
  store i16 %conv19, ptr %arrayidx, align 2, !dbg !1664
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1665
    #dbg_value(i32 %inc, !1642, !DIExpression(), !1620)
  br label %for.cond5, !dbg !1666, !llvm.loop !1667

for.inc22:                                        ; preds = %for.cond5
  %inc23 = add nuw nsw i32 %i.0, 1, !dbg !1669
    #dbg_value(i32 %inc23, !1622, !DIExpression(), !1620)
  br label %for.cond, !dbg !1670, !llvm.loop !1671

for.end24:                                        ; preds = %for.cond
  ret void, !dbg !1673
}

; Function Attrs: nounwind
define internal fastcc range(i32 0, 16777216) i32 @load24_littleendian(ptr noundef %x) unnamed_addr #0 !dbg !1674 {
entry:
    #dbg_value(ptr %x, !1677, !DIExpression(), !1678)
  %0 = load i8, ptr %x, align 1, !dbg !1679
  %conv = zext i8 %0 to i32, !dbg !1680
    #dbg_value(i32 %conv, !1681, !DIExpression(), !1678)
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %x, i32 1, !dbg !1682
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !1682
  %conv2 = zext i8 %1 to i32, !dbg !1683
  %shl = shl nuw nsw i32 %conv2, 8, !dbg !1684
  %or = or disjoint i32 %shl, %conv, !dbg !1685
    #dbg_value(i32 %or, !1681, !DIExpression(), !1678)
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %x, i32 2, !dbg !1686
  %2 = load i8, ptr %arrayidx3, align 1, !dbg !1686
  %conv4 = zext i8 %2 to i32, !dbg !1687
  %shl5 = shl nuw nsw i32 %conv4, 16, !dbg !1688
  %or6 = or disjoint i32 %or, %shl5, !dbg !1689
    #dbg_value(i32 %or6, !1681, !DIExpression(), !1678)
  ret i32 %or6, !dbg !1690
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_cbd_eta2(ptr noundef %r, ptr noundef %buf) local_unnamed_addr #0 !dbg !1691 {
entry:
    #dbg_value(ptr %r, !1692, !DIExpression(), !1693)
    #dbg_value(ptr %buf, !1694, !DIExpression(), !1693)
  call fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) #3, !dbg !1695
  ret void, !dbg !1696
}

; Function Attrs: nounwind
define internal fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) unnamed_addr #0 !dbg !1697 {
entry:
    #dbg_value(ptr %r, !1698, !DIExpression(), !1699)
    #dbg_value(ptr %buf, !1700, !DIExpression(), !1699)
    #dbg_value(i32 0, !1701, !DIExpression(), !1699)
  br label %for.cond, !dbg !1702

for.cond:                                         ; preds = %for.inc19, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc20, %for.inc19 ], !dbg !1704
    #dbg_value(i32 %i.0, !1701, !DIExpression(), !1699)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1705
  br i1 %exitcond1, label %for.body, label %for.end21, !dbg !1707

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 2, !dbg !1708
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 %mul, !dbg !1710
  %call = call fastcc i32 @load32_littleendian(ptr noundef %add.ptr) #3, !dbg !1711
    #dbg_value(i32 %call, !1712, !DIExpression(), !1699)
  %and = and i32 %call, 1431655765, !dbg !1713
    #dbg_value(i32 %and, !1714, !DIExpression(), !1699)
  %shr = lshr i32 %call, 1, !dbg !1715
  %and1 = and i32 %shr, 1431655765, !dbg !1716
  %add = add nuw i32 %and, %and1, !dbg !1717
    #dbg_value(i32 %add, !1714, !DIExpression(), !1699)
    #dbg_value(i32 0, !1718, !DIExpression(), !1699)
  br label %for.cond2, !dbg !1719

for.cond2:                                        ; preds = %for.body4, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body4 ], !dbg !1721
    #dbg_value(i32 %j.0, !1718, !DIExpression(), !1699)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1722
  br i1 %exitcond, label %for.body4, label %for.inc19, !dbg !1724

for.body4:                                        ; preds = %for.cond2
  %mul5 = shl nuw nsw i32 %j.0, 2, !dbg !1725
  %shr7 = lshr i32 %add, %mul5, !dbg !1727
  %conv = and i32 %shr7, 3, !dbg !1728
    #dbg_value(i32 %shr7, !1729, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3, DW_OP_and, DW_OP_stack_value), !1699)
  %mul9 = shl nuw nsw i32 %j.0, 2, !dbg !1730
  %add10 = or disjoint i32 %mul9, 2, !dbg !1731
  %shr11 = lshr i32 %add, %add10, !dbg !1732
  %conv13 = and i32 %shr11, 3, !dbg !1733
    #dbg_value(i32 %conv13, !1734, !DIExpression(), !1699)
  %sub = sub nsw i32 %conv, %conv13, !dbg !1735
  %conv16 = trunc nsw i32 %sub to i16, !dbg !1736
  %mul17 = shl nuw nsw i32 %i.0, 3, !dbg !1737
  %add18 = or disjoint i32 %mul17, %j.0, !dbg !1738
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add18, !dbg !1739
  store i16 %conv16, ptr %arrayidx, align 2, !dbg !1740
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1741
    #dbg_value(i32 %inc, !1718, !DIExpression(), !1699)
  br label %for.cond2, !dbg !1742, !llvm.loop !1743

for.inc19:                                        ; preds = %for.cond2
  %inc20 = add nuw nsw i32 %i.0, 1, !dbg !1745
    #dbg_value(i32 %inc20, !1701, !DIExpression(), !1699)
  br label %for.cond, !dbg !1746, !llvm.loop !1747

for.end21:                                        ; preds = %for.cond
  ret void, !dbg !1749
}

; Function Attrs: nounwind
define internal fastcc i32 @load32_littleendian(ptr noundef %x) unnamed_addr #0 !dbg !1750 {
entry:
    #dbg_value(ptr %x, !1751, !DIExpression(), !1752)
  %0 = load i8, ptr %x, align 1, !dbg !1753
  %conv = zext i8 %0 to i32, !dbg !1754
    #dbg_value(i32 %conv, !1755, !DIExpression(), !1752)
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %x, i32 1, !dbg !1756
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !1756
  %conv2 = zext i8 %1 to i32, !dbg !1757
  %shl = shl nuw nsw i32 %conv2, 8, !dbg !1758
  %or = or disjoint i32 %shl, %conv, !dbg !1759
    #dbg_value(i32 %or, !1755, !DIExpression(), !1752)
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %x, i32 2, !dbg !1760
  %2 = load i8, ptr %arrayidx3, align 1, !dbg !1760
  %conv4 = zext i8 %2 to i32, !dbg !1761
  %shl5 = shl nuw nsw i32 %conv4, 16, !dbg !1762
  %or6 = or disjoint i32 %or, %shl5, !dbg !1763
    #dbg_value(i32 %or6, !1755, !DIExpression(), !1752)
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %x, i32 3, !dbg !1764
  %3 = load i8, ptr %arrayidx7, align 1, !dbg !1764
  %conv8 = zext i8 %3 to i32, !dbg !1765
  %shl9 = shl nuw i32 %conv8, 24, !dbg !1766
  %or10 = or disjoint i32 %or6, %shl9, !dbg !1767
    #dbg_value(i32 %or10, !1755, !DIExpression(), !1752)
  ret i32 %or10, !dbg !1768
}

; Function Attrs: nounwind
define dso_local signext i16 @pqcrystals_kyber512_ref_montgomery_reduce(i32 noundef %a) local_unnamed_addr #0 !dbg !1769 {
entry:
    #dbg_value(i32 %a, !1772, !DIExpression(), !1773)
    #dbg_value(i32 %a, !1774, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !1773)
  %sext = mul i32 %a, -218038272, !dbg !1775
  %conv3 = ashr exact i32 %sext, 16, !dbg !1775
  %mul4.neg = mul nsw i32 %conv3, -3329, !dbg !1776
  %sub = add i32 %mul4.neg, %a, !dbg !1777
  %shr = lshr i32 %sub, 16, !dbg !1778
  %conv5 = trunc nuw i32 %shr to i16, !dbg !1779
    #dbg_value(i16 %conv5, !1774, !DIExpression(), !1773)
  ret i16 %conv5, !dbg !1780
}

; Function Attrs: nounwind
define dso_local signext i16 @pqcrystals_kyber512_ref_barrett_reduce(i16 noundef signext %a) local_unnamed_addr #0 !dbg !1781 {
entry:
    #dbg_value(i16 %a, !1784, !DIExpression(), !1785)
    #dbg_value(i16 20159, !1786, !DIExpression(), !1785)
  %conv = sext i16 %a to i32, !dbg !1787
  %mul = mul nsw i32 %conv, 20159, !dbg !1788
  %add = add nsw i32 %mul, 33554432, !dbg !1789
  %shr = ashr i32 %add, 26, !dbg !1790
    #dbg_value(i32 %shr, !1791, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1785)
    #dbg_value(i32 %shr, !1791, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1785)
  %0 = trunc nsw i32 %shr to i16, !dbg !1792
  %1 = mul i16 %0, -3329, !dbg !1792
  %conv7 = add i16 %1, %a, !dbg !1792
  ret i16 %conv7, !dbg !1793
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqcrystals_kyber512_ref_verify(ptr noundef %a, ptr noundef %b, i32 noundef %len) local_unnamed_addr #0 !dbg !1794 {
entry:
    #dbg_value(ptr %a, !1798, !DIExpression(), !1799)
    #dbg_value(ptr %b, !1800, !DIExpression(), !1799)
    #dbg_value(i32 %len, !1801, !DIExpression(), !1799)
    #dbg_value(i8 0, !1802, !DIExpression(), !1799)
    #dbg_value(i32 0, !1803, !DIExpression(), !1799)
  br label %for.cond, !dbg !1804

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1806
  %r.0 = phi i8 [ 0, %entry ], [ %or2, %for.inc ], !dbg !1799
    #dbg_value(i8 %r.0, !1802, !DIExpression(), !1799)
    #dbg_value(i32 %i.0, !1803, !DIExpression(), !1799)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !1807
  br i1 %exitcond, label %for.inc, label %for.end, !dbg !1809

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i8 poison, i8 poison, i8 poison), !1802, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1799)
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %i.0, !dbg !1810
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1810
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 %i.0, !dbg !1811
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !1811
    #dbg_value(!DIArgList(i8 %r.0, i8 %0, i8 %1), !1802, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1799)
  %xor1 = xor i8 %0, %1, !dbg !1812
    #dbg_value(!DIArgList(i8 %r.0, i8 %xor1), !1802, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1799)
  %or2 = or i8 %r.0, %xor1, !dbg !1813
    #dbg_value(i8 %or2, !1802, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1799)
    #dbg_value(i8 %or2, !1802, !DIExpression(), !1799)
  %inc = add i32 %i.0, 1, !dbg !1814
    #dbg_value(i32 %inc, !1803, !DIExpression(), !1799)
  br label %for.cond, !dbg !1815, !llvm.loop !1816

for.end:                                          ; preds = %for.cond
  %r.0.lcssa = phi i8 [ %r.0, %for.cond ], !dbg !1799
  %2 = icmp ne i8 %r.0.lcssa, 0, !dbg !1818
  %conv6 = zext i1 %2 to i32, !dbg !1819
  ret i32 %conv6, !dbg !1820
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_cmov(ptr noundef %r, ptr noundef %x, i32 noundef %len, i8 noundef zeroext %b) local_unnamed_addr #0 !dbg !1821 {
entry:
    #dbg_value(ptr %r, !1824, !DIExpression(), !1825)
    #dbg_value(ptr %x, !1826, !DIExpression(), !1825)
    #dbg_value(i32 %len, !1827, !DIExpression(), !1825)
    #dbg_value(i8 %b, !1828, !DIExpression(), !1825)
  %0 = call i8 asm "", "=r,0"(i8 %b) #5, !dbg !1829, !srcloc !1830
    #dbg_value(i8 %0, !1828, !DIExpression(), !1825)
  %sub = sub i8 0, %0, !dbg !1831
    #dbg_value(i8 %sub, !1828, !DIExpression(), !1825)
    #dbg_value(i32 0, !1832, !DIExpression(), !1825)
  br label %for.cond, !dbg !1833

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1835
    #dbg_value(i32 %i.0, !1832, !DIExpression(), !1825)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !1836
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1838

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !1839
  %1 = load i8, ptr %arrayidx, align 1, !dbg !1839
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !1840
  %2 = load i8, ptr %arrayidx5, align 1, !dbg !1840
  %xor1 = xor i8 %1, %2, !dbg !1841
  %and2 = and i8 %xor1, %sub, !dbg !1842
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !1843
  %xor93 = xor i8 %1, %and2, !dbg !1844
  store i8 %xor93, ptr %arrayidx7, align 1, !dbg !1844
  %inc = add i32 %i.0, 1, !dbg !1845
    #dbg_value(i32 %inc, !1832, !DIExpression(), !1825)
  br label %for.cond, !dbg !1846, !llvm.loop !1847

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1849
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_cmov_int16(ptr noundef %r, i16 noundef signext %v, i16 noundef zeroext %b) local_unnamed_addr #0 !dbg !1850 {
entry:
    #dbg_value(ptr %r, !1853, !DIExpression(), !1854)
    #dbg_value(i16 %v, !1855, !DIExpression(), !1854)
    #dbg_value(i16 %b, !1856, !DIExpression(), !1854)
  %sub = sub i16 0, %b, !dbg !1857
    #dbg_value(i16 %sub, !1856, !DIExpression(), !1854)
  %0 = load i16, ptr %r, align 2, !dbg !1858
  %xor1 = xor i16 %0, %v, !dbg !1859
  %and = and i16 %xor1, %sub, !dbg !1860
  %xor6 = xor i16 %and, %0, !dbg !1861
  store i16 %xor6, ptr %r, align 2, !dbg !1861
  ret void, !dbg !1862
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_init(ptr noundef %state) local_unnamed_addr #0 !dbg !1863 {
entry:
    #dbg_value(ptr %state, !1867, !DIExpression(), !1868)
  call fastcc void @keccak_init(ptr noundef %state) #3, !dbg !1869
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1870
  store i64 0, ptr %arrayidx, align 8, !dbg !1871
  ret void, !dbg !1872
}

; Function Attrs: nounwind
define internal fastcc void @keccak_init(ptr noundef %s) unnamed_addr #0 !dbg !1873 {
entry:
    #dbg_value(ptr %s, !1877, !DIExpression(), !1878)
    #dbg_value(i32 0, !1879, !DIExpression(), !1878)
  br label %for.cond, !dbg !1880

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1882
    #dbg_value(i32 %i.0, !1879, !DIExpression(), !1878)
  %exitcond = icmp ne i32 %i.0, 25, !dbg !1883
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1885

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !1886
  store i64 0, ptr %arrayidx, align 8, !dbg !1887
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1888
    #dbg_value(i32 %inc, !1879, !DIExpression(), !1878)
  br label %for.cond, !dbg !1889, !llvm.loop !1890

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1892
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !1893 {
entry:
    #dbg_value(ptr %state, !1896, !DIExpression(), !1897)
    #dbg_value(ptr %in, !1898, !DIExpression(), !1897)
    #dbg_value(i32 %inlen, !1899, !DIExpression(), !1897)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1900
  %0 = load i64, ptr %arrayidx, align 8, !dbg !1900
  %conv = trunc i64 %0 to i32, !dbg !1900
  %call = call fastcc i32 @keccak_absorb(ptr noundef %state, i32 noundef %conv, i32 noundef 168, ptr noundef %in, i32 noundef %inlen) #3, !dbg !1901
  %conv1 = zext i32 %call to i64, !dbg !1901
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1902
  store i64 %conv1, ptr %arrayidx2, align 8, !dbg !1903
  ret void, !dbg !1904
}

; Function Attrs: nounwind
define internal fastcc i32 @keccak_absorb(ptr noundef %s, i32 noundef %pos, i32 noundef range(i32 136, 169) %r, ptr noundef %in, i32 noundef %inlen) unnamed_addr #0 !dbg !1905 {
entry:
    #dbg_value(ptr %s, !1908, !DIExpression(), !1909)
    #dbg_value(i32 %pos, !1910, !DIExpression(), !1909)
    #dbg_value(i32 %r, !1911, !DIExpression(), !1909)
    #dbg_value(ptr %in, !1912, !DIExpression(), !1909)
    #dbg_value(i32 %inlen, !1913, !DIExpression(), !1909)
  br label %while.cond, !dbg !1914

while.cond:                                       ; preds = %for.end, %entry
  %in.addr.0 = phi ptr [ %in, %entry ], [ %in.addr.1.lcssa, %for.end ]
  %inlen.addr.0 = phi i32 [ %inlen, %entry ], [ %sub2, %for.end ]
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ 0, %for.end ]
    #dbg_value(i32 %pos.addr.0, !1910, !DIExpression(), !1909)
    #dbg_value(i32 %inlen.addr.0, !1913, !DIExpression(), !1909)
    #dbg_value(ptr %in.addr.0, !1912, !DIExpression(), !1909)
  %add = add i32 %pos.addr.0, %inlen.addr.0, !dbg !1915
  %cmp.not = icmp ult i32 %add, %r, !dbg !1916
  br i1 %cmp.not, label %for.cond3.preheader, label %for.cond.preheader, !dbg !1914

for.cond.preheader:                               ; preds = %while.cond
  %umax = call i32 @llvm.umax.i32(i32 %pos.addr.0, i32 %r), !dbg !1917
  br label %for.cond, !dbg !1917

for.cond3.preheader:                              ; preds = %while.cond
  %in.addr.0.lcssa = phi ptr [ %in.addr.0, %while.cond ]
  %inlen.addr.0.lcssa = phi i32 [ %inlen.addr.0, %while.cond ]
  %pos.addr.0.lcssa = phi i32 [ %pos.addr.0, %while.cond ]
  br label %for.cond3, !dbg !1920

for.cond:                                         ; preds = %for.cond.preheader, %for.body
  %in.addr.1 = phi ptr [ %incdec.ptr, %for.body ], [ %in.addr.0, %for.cond.preheader ]
  %i.0 = phi i32 [ %inc, %for.body ], [ %pos.addr.0, %for.cond.preheader ], !dbg !1922
    #dbg_value(i32 %i.0, !1923, !DIExpression(), !1909)
    #dbg_value(ptr %in.addr.1, !1912, !DIExpression(), !1909)
  %exitcond = icmp ne i32 %i.0, %umax, !dbg !1924
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1917

for.body:                                         ; preds = %for.cond
    #dbg_value(ptr %in.addr.1, !1912, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1909)
  %0 = load i8, ptr %in.addr.1, align 1, !dbg !1926
  %conv = zext i8 %0 to i64, !dbg !1927
  %rem = shl nuw nsw i32 %i.0, 3, !dbg !1928
  %mul = and i32 %rem, 56, !dbg !1928
  %sh_prom = zext nneg i32 %mul to i64, !dbg !1929
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !1929
  %div2 = lshr i32 %i.0, 3, !dbg !1930
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div2, !dbg !1931
  %1 = load i64, ptr %arrayidx, align 8, !dbg !1932
  %xor = xor i64 %1, %shl, !dbg !1932
  store i64 %xor, ptr %arrayidx, align 8, !dbg !1932
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %in.addr.1, i32 1, !dbg !1933
    #dbg_value(ptr %incdec.ptr, !1912, !DIExpression(), !1909)
  %inc = add i32 %i.0, 1, !dbg !1934
    #dbg_value(i32 %inc, !1923, !DIExpression(), !1909)
  br label %for.cond, !dbg !1935, !llvm.loop !1936

for.end:                                          ; preds = %for.cond
  %in.addr.1.lcssa = phi ptr [ %in.addr.1, %for.cond ]
  %sub.neg = sub i32 %pos.addr.0, %r, !dbg !1938
  %sub2 = add i32 %sub.neg, %inlen.addr.0, !dbg !1939
    #dbg_value(i32 %sub2, !1913, !DIExpression(), !1909)
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !1940
    #dbg_value(i32 0, !1910, !DIExpression(), !1909)
  br label %while.cond, !dbg !1914, !llvm.loop !1941

for.cond3:                                        ; preds = %for.cond3.preheader, %for.body7
  %in.addr.2 = phi ptr [ %incdec.ptr8, %for.body7 ], [ %in.addr.0.lcssa, %for.cond3.preheader ]
  %i.1 = phi i32 [ %inc18, %for.body7 ], [ %pos.addr.0.lcssa, %for.cond3.preheader ], !dbg !1943
    #dbg_value(i32 %i.1, !1923, !DIExpression(), !1909)
    #dbg_value(ptr %in.addr.2, !1912, !DIExpression(), !1909)
  %add4 = add i32 %pos.addr.0.lcssa, %inlen.addr.0.lcssa, !dbg !1944
  %cmp5 = icmp ult i32 %i.1, %add4, !dbg !1946
  br i1 %cmp5, label %for.body7, label %for.end19, !dbg !1920

for.body7:                                        ; preds = %for.cond3
    #dbg_value(ptr %in.addr.2, !1912, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1909)
  %2 = load i8, ptr %in.addr.2, align 1, !dbg !1947
  %conv9 = zext i8 %2 to i64, !dbg !1948
  %rem10 = shl i32 %i.1, 3, !dbg !1949
  %mul11 = and i32 %rem10, 56, !dbg !1949
  %sh_prom12 = zext nneg i32 %mul11 to i64, !dbg !1950
  %shl13 = shl nuw i64 %conv9, %sh_prom12, !dbg !1950
  %div141 = lshr i32 %i.1, 3, !dbg !1951
  %arrayidx15 = getelementptr inbounds nuw i64, ptr %s, i32 %div141, !dbg !1952
  %3 = load i64, ptr %arrayidx15, align 8, !dbg !1953
  %xor16 = xor i64 %3, %shl13, !dbg !1953
  store i64 %xor16, ptr %arrayidx15, align 8, !dbg !1953
  %incdec.ptr8 = getelementptr inbounds nuw i8, ptr %in.addr.2, i32 1, !dbg !1954
    #dbg_value(ptr %incdec.ptr8, !1912, !DIExpression(), !1909)
  %inc18 = add nuw i32 %i.1, 1, !dbg !1955
    #dbg_value(i32 %inc18, !1923, !DIExpression(), !1909)
  br label %for.cond3, !dbg !1956, !llvm.loop !1957

for.end19:                                        ; preds = %for.cond3
  %i.1.lcssa = phi i32 [ %i.1, %for.cond3 ], !dbg !1943
  ret i32 %i.1.lcssa, !dbg !1959
}

; Function Attrs: nounwind
define internal fastcc void @KeccakF1600_StatePermute(ptr noundef %state) unnamed_addr #0 !dbg !1960 {
entry:
    #dbg_value(ptr %state, !1961, !DIExpression(), !1962)
  %0 = load i64, ptr %state, align 8, !dbg !1963
    #dbg_value(i64 %0, !1964, !DIExpression(), !1962)
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !1965
  %1 = load i64, ptr %arrayidx1, align 8, !dbg !1965
    #dbg_value(i64 %1, !1966, !DIExpression(), !1962)
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !1967
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !1967
    #dbg_value(i64 %2, !1968, !DIExpression(), !1962)
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !1969
  %3 = load i64, ptr %arrayidx3, align 8, !dbg !1969
    #dbg_value(i64 %3, !1970, !DIExpression(), !1962)
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !1971
  %4 = load i64, ptr %arrayidx4, align 8, !dbg !1971
    #dbg_value(i64 %4, !1972, !DIExpression(), !1962)
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !1973
  %5 = load i64, ptr %arrayidx5, align 8, !dbg !1973
    #dbg_value(i64 %5, !1974, !DIExpression(), !1962)
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !1975
  %6 = load i64, ptr %arrayidx6, align 8, !dbg !1975
    #dbg_value(i64 %6, !1976, !DIExpression(), !1962)
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !1977
  %7 = load i64, ptr %arrayidx7, align 8, !dbg !1977
    #dbg_value(i64 %7, !1978, !DIExpression(), !1962)
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !1979
  %8 = load i64, ptr %arrayidx8, align 8, !dbg !1979
    #dbg_value(i64 %8, !1980, !DIExpression(), !1962)
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !1981
  %9 = load i64, ptr %arrayidx9, align 8, !dbg !1981
    #dbg_value(i64 %9, !1982, !DIExpression(), !1962)
  %arrayidx10 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !1983
  %10 = load i64, ptr %arrayidx10, align 8, !dbg !1983
    #dbg_value(i64 %10, !1984, !DIExpression(), !1962)
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !1985
  %11 = load i64, ptr %arrayidx11, align 8, !dbg !1985
    #dbg_value(i64 %11, !1986, !DIExpression(), !1962)
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !1987
  %12 = load i64, ptr %arrayidx12, align 8, !dbg !1987
    #dbg_value(i64 %12, !1988, !DIExpression(), !1962)
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !1989
  %13 = load i64, ptr %arrayidx13, align 8, !dbg !1989
    #dbg_value(i64 %13, !1990, !DIExpression(), !1962)
  %arrayidx14 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !1991
  %14 = load i64, ptr %arrayidx14, align 8, !dbg !1991
    #dbg_value(i64 %14, !1992, !DIExpression(), !1962)
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !1993
  %15 = load i64, ptr %arrayidx15, align 8, !dbg !1993
    #dbg_value(i64 %15, !1994, !DIExpression(), !1962)
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !1995
  %16 = load i64, ptr %arrayidx16, align 8, !dbg !1995
    #dbg_value(i64 %16, !1996, !DIExpression(), !1962)
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !1997
  %17 = load i64, ptr %arrayidx17, align 8, !dbg !1997
    #dbg_value(i64 %17, !1998, !DIExpression(), !1962)
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !1999
  %18 = load i64, ptr %arrayidx18, align 8, !dbg !1999
    #dbg_value(i64 %18, !2000, !DIExpression(), !1962)
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !2001
  %19 = load i64, ptr %arrayidx19, align 8, !dbg !2001
    #dbg_value(i64 %19, !2002, !DIExpression(), !1962)
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !2003
  %20 = load i64, ptr %arrayidx20, align 8, !dbg !2003
    #dbg_value(i64 %20, !2004, !DIExpression(), !1962)
  %arrayidx21 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !2005
  %21 = load i64, ptr %arrayidx21, align 8, !dbg !2005
    #dbg_value(i64 %21, !2006, !DIExpression(), !1962)
  %arrayidx22 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !2007
  %22 = load i64, ptr %arrayidx22, align 8, !dbg !2007
    #dbg_value(i64 %22, !2008, !DIExpression(), !1962)
  %arrayidx23 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !2009
  %23 = load i64, ptr %arrayidx23, align 8, !dbg !2009
    #dbg_value(i64 %23, !2010, !DIExpression(), !1962)
  %arrayidx24 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !2011
  %24 = load i64, ptr %arrayidx24, align 8, !dbg !2011
    #dbg_value(i64 %24, !2012, !DIExpression(), !1962)
    #dbg_value(i32 0, !2013, !DIExpression(), !1962)
  br label %for.cond, !dbg !2014

for.cond:                                         ; preds = %for.inc, %entry
  %Aso.0 = phi i64 [ %23, %entry ], [ %xor444, %for.inc ], !dbg !1962
  %Asi.0 = phi i64 [ %22, %entry ], [ %xor441, %for.inc ], !dbg !1962
  %Ase.0 = phi i64 [ %21, %entry ], [ %xor438, %for.inc ], !dbg !1962
  %Asa.0 = phi i64 [ %20, %entry ], [ %xor435, %for.inc ], !dbg !1962
  %Amu.0 = phi i64 [ %19, %entry ], [ %xor412, %for.inc ], !dbg !1962
  %Amo.0 = phi i64 [ %18, %entry ], [ %xor409, %for.inc ], !dbg !1962
  %Ami.0 = phi i64 [ %17, %entry ], [ %xor406, %for.inc ], !dbg !1962
  %Ame.0 = phi i64 [ %16, %entry ], [ %xor403, %for.inc ], !dbg !1962
  %Ama.0 = phi i64 [ %15, %entry ], [ %xor400, %for.inc ], !dbg !1962
  %Aku.0 = phi i64 [ %14, %entry ], [ %xor377, %for.inc ], !dbg !1962
  %Ako.0 = phi i64 [ %13, %entry ], [ %xor374, %for.inc ], !dbg !1962
  %Aki.0 = phi i64 [ %12, %entry ], [ %xor371, %for.inc ], !dbg !1962
  %Ake.0 = phi i64 [ %11, %entry ], [ %xor368, %for.inc ], !dbg !1962
  %Aka.0 = phi i64 [ %10, %entry ], [ %xor365, %for.inc ], !dbg !1962
  %Agu.0 = phi i64 [ %9, %entry ], [ %xor342, %for.inc ], !dbg !1962
  %Ago.0 = phi i64 [ %8, %entry ], [ %xor339, %for.inc ], !dbg !1962
  %Agi.0 = phi i64 [ %7, %entry ], [ %xor336, %for.inc ], !dbg !1962
  %Age.0 = phi i64 [ %6, %entry ], [ %xor333, %for.inc ], !dbg !1962
  %Aga.0 = phi i64 [ %5, %entry ], [ %xor330, %for.inc ], !dbg !1962
  %Abu.0 = phi i64 [ %4, %entry ], [ %xor307, %for.inc ], !dbg !1962
  %Abo.0 = phi i64 [ %3, %entry ], [ %xor304, %for.inc ], !dbg !1962
  %Abi.0 = phi i64 [ %2, %entry ], [ %xor301, %for.inc ], !dbg !1962
  %Abe.0 = phi i64 [ %1, %entry ], [ %xor298, %for.inc ], !dbg !1962
  %Aba.0 = phi i64 [ %0, %entry ], [ %xor295, %for.inc ], !dbg !1962
  %round.0 = phi i32 [ 0, %entry ], [ %add448, %for.inc ], !dbg !2016
  %Asu.0 = phi i64 [ %24, %entry ], [ %xor447, %for.inc ], !dbg !1962
    #dbg_value(i64 %Asu.0, !2012, !DIExpression(), !1962)
    #dbg_value(i32 %round.0, !2013, !DIExpression(), !1962)
    #dbg_value(i64 %Aba.0, !1964, !DIExpression(), !1962)
    #dbg_value(i64 %Abe.0, !1966, !DIExpression(), !1962)
    #dbg_value(i64 %Abi.0, !1968, !DIExpression(), !1962)
    #dbg_value(i64 %Abo.0, !1970, !DIExpression(), !1962)
    #dbg_value(i64 %Abu.0, !1972, !DIExpression(), !1962)
    #dbg_value(i64 %Aga.0, !1974, !DIExpression(), !1962)
    #dbg_value(i64 %Age.0, !1976, !DIExpression(), !1962)
    #dbg_value(i64 %Agi.0, !1978, !DIExpression(), !1962)
    #dbg_value(i64 %Ago.0, !1980, !DIExpression(), !1962)
    #dbg_value(i64 %Agu.0, !1982, !DIExpression(), !1962)
    #dbg_value(i64 %Aka.0, !1984, !DIExpression(), !1962)
    #dbg_value(i64 %Ake.0, !1986, !DIExpression(), !1962)
    #dbg_value(i64 %Aki.0, !1988, !DIExpression(), !1962)
    #dbg_value(i64 %Ako.0, !1990, !DIExpression(), !1962)
    #dbg_value(i64 %Aku.0, !1992, !DIExpression(), !1962)
    #dbg_value(i64 %Ama.0, !1994, !DIExpression(), !1962)
    #dbg_value(i64 %Ame.0, !1996, !DIExpression(), !1962)
    #dbg_value(i64 %Ami.0, !1998, !DIExpression(), !1962)
    #dbg_value(i64 %Amo.0, !2000, !DIExpression(), !1962)
    #dbg_value(i64 %Amu.0, !2002, !DIExpression(), !1962)
    #dbg_value(i64 %Asa.0, !2004, !DIExpression(), !1962)
    #dbg_value(i64 %Ase.0, !2006, !DIExpression(), !1962)
    #dbg_value(i64 %Asi.0, !2008, !DIExpression(), !1962)
    #dbg_value(i64 %Aso.0, !2010, !DIExpression(), !1962)
  %cmp = icmp samesign ult i32 %round.0, 24, !dbg !2017
  br i1 %cmp, label %for.inc, label %for.end, !dbg !2019

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %Asa.0, i64 %Ama.0, i64 %Aka.0, i64 %Aga.0), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %Ase.0, i64 %Ame.0, i64 %Ake.0, i64 %Age.0), !2021, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %Asi.0, i64 %Ami.0, i64 %Aki.0, i64 %Agi.0), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %Aso.0, i64 %Amo.0, i64 %Ako.0, i64 %Ago.0), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %Asu.0, i64 %Amu.0, i64 %Aku.0, i64 %Agu.0), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2025, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2027, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2028, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2029, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1964, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1976, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2021, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1988, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2022, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2000, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2023, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2012, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2024, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2030, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2030, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2031, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2032, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2033, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1970, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2020, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2021, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2022, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1996, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2023, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2008, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2024, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2035, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2036, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2037, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2039, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2020, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2021, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1990, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2022, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2002, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2023, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2004, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2024, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2040, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2041, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2042, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2043, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1972, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2020, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2021, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1986, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2022, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1998, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2023, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2010, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2024, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2045, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2046, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2047, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2048, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2049, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1968, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2020, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2021, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1992, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2022, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1994, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2023, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2006, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2024, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2050, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2051, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2052, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2053, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2054, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2021, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2025, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2027, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2028, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2029, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2030, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2036, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2021, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2042, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2022, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2048, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2023, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2054, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2024, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1964, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !1964, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1968, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1970, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !1972, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2033, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2020, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2039, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2021, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2040, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2022, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2046, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2023, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2052, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2024, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1976, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2031, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2020, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2037, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2021, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2043, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2022, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2049, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2023, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2050, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2024, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1986, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1988, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1990, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1992, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2020, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2035, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2021, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2041, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2022, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2047, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2023, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2053, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2024, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1994, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1996, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1998, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2000, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2002, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2032, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2020, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2021, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2022, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2045, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2023, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2051, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 poison, !2024, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2004, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2006, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2008, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2010, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2012, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor32 = xor i64 %Abi.0, %Agi.0, !dbg !2055
    #dbg_value(!DIArgList(i64 %xor32, i64 %Asi.0, i64 %Ami.0, i64 %Aki.0), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor33 = xor i64 %xor32, %Aki.0, !dbg !2057
    #dbg_value(!DIArgList(i64 %xor33, i64 %Asi.0, i64 %Ami.0), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor34 = xor i64 %xor33, %Ami.0, !dbg !2058
    #dbg_value(!DIArgList(i64 %xor34, i64 %Asi.0), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor35 = xor i64 %xor34, %Asi.0, !dbg !2059
    #dbg_value(i64 %xor35, !2022, !DIExpression(), !1962)
  %xor40 = xor i64 %Abu.0, %Agu.0, !dbg !2060
    #dbg_value(!DIArgList(i64 %xor40, i64 %Asu.0, i64 %Amu.0, i64 %Aku.0), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor41 = xor i64 %xor40, %Aku.0, !dbg !2061
    #dbg_value(!DIArgList(i64 %xor41, i64 %Asu.0, i64 %Amu.0), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor42 = xor i64 %xor41, %Amu.0, !dbg !2062
    #dbg_value(!DIArgList(i64 %xor42, i64 %Asu.0), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor43 = xor i64 %xor42, %Asu.0, !dbg !2063
    #dbg_value(i64 %xor43, !2024, !DIExpression(), !1962)
  %xor56 = call i64 @llvm.fshl.i64(i64 %xor43, i64 %xor43, i64 1), !dbg !2064
    #dbg_value(!DIArgList(i64 %Ago.0, i64 %xor35, i64 %xor56), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %xor35, i64 %xor56), !1970, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Ako.0, i64 %xor35, i64 %xor56), !1990, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Amo.0, i64 %xor35, i64 %xor56), !2000, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Aso.0, i64 %xor35, i64 %xor56), !2010, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor35, i64 %xor56), !2028, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor57 = xor i64 %xor35, %xor56, !dbg !2065
    #dbg_value(!DIArgList(i64 %Ago.0, i64 %xor57), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %xor57), !1970, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Ako.0, i64 %xor57), !1990, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Amo.0, i64 %xor57), !2000, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Aso.0, i64 %xor57), !2010, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 %xor57, !2028, !DIExpression(), !1962)
  %xor203 = xor i64 %Ago.0, %xor57, !dbg !2066
    #dbg_value(i64 %xor203, !1980, !DIExpression(), !1962)
  %xor206 = call i64 @llvm.fshl.i64(i64 %xor203, i64 %xor203, i64 55), !dbg !2067
    #dbg_value(i64 %xor206, !2021, !DIExpression(), !1962)
  %xor28 = xor i64 %Abe.0, %Age.0, !dbg !2068
    #dbg_value(!DIArgList(i64 %xor28, i64 %Ase.0, i64 %Ame.0, i64 %Ake.0), !2021, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor29 = xor i64 %xor28, %Ake.0, !dbg !2069
    #dbg_value(!DIArgList(i64 %xor29, i64 %Ase.0, i64 %Ame.0), !2021, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor30 = xor i64 %xor29, %Ame.0, !dbg !2070
    #dbg_value(!DIArgList(i64 %xor30, i64 %Ase.0), !2021, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor31 = xor i64 %xor30, %Ase.0, !dbg !2071
    #dbg_value(i64 %xor31, !2021, !DIExpression(), !1962)
  %xor44 = call i64 @llvm.fshl.i64(i64 %xor31, i64 %xor31, i64 1), !dbg !2072
    #dbg_value(!DIArgList(i64 %xor43, i64 %xor44), !2025, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor43, i64 %xor44), !1964, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor43, i64 %xor44), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Aka.0, i64 %xor43, i64 %xor44), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Aga.0, i64 %xor43, i64 %xor44), !1974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Asa.0, i64 %xor43, i64 %xor44), !2004, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Ama.0, i64 %xor43, i64 %xor44), !1994, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor45 = xor i64 %xor43, %xor44, !dbg !2073
    #dbg_value(i64 %xor45, !2025, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor45), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor45), !1964, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Aka.0, i64 %xor45), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Aga.0, i64 %xor45), !1974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Asa.0, i64 %xor45), !2004, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Ama.0, i64 %xor45), !1994, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor211 = xor i64 %Ama.0, %xor45, !dbg !2074
    #dbg_value(i64 %xor211, !1994, !DIExpression(), !1962)
  %xor214 = call i64 @llvm.fshl.i64(i64 %xor211, i64 %xor211, i64 41), !dbg !2075
    #dbg_value(i64 %xor214, !2023, !DIExpression(), !1962)
  %xor36 = xor i64 %Abo.0, %Ago.0, !dbg !2076
    #dbg_value(!DIArgList(i64 %xor36, i64 %Aso.0, i64 %Amo.0, i64 %Ako.0), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor37 = xor i64 %xor36, %Ako.0, !dbg !2077
    #dbg_value(!DIArgList(i64 %xor37, i64 %Aso.0, i64 %Amo.0), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor38 = xor i64 %xor37, %Amo.0, !dbg !2078
    #dbg_value(!DIArgList(i64 %xor38, i64 %Aso.0), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor39 = xor i64 %xor38, %Aso.0, !dbg !2079
    #dbg_value(i64 %xor39, !2023, !DIExpression(), !1962)
  %xor = xor i64 %Aba.0, %Aga.0, !dbg !2080
    #dbg_value(!DIArgList(i64 %xor, i64 %Asa.0, i64 %Ama.0, i64 %Aka.0), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor25 = xor i64 %xor, %Aka.0, !dbg !2081
    #dbg_value(!DIArgList(i64 %xor25, i64 %Asa.0, i64 %Ama.0), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor26 = xor i64 %xor25, %Ama.0, !dbg !2082
    #dbg_value(!DIArgList(i64 %xor26, i64 %Asa.0), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor27 = xor i64 %xor26, %Asa.0, !dbg !2083
    #dbg_value(i64 %xor27, !2020, !DIExpression(), !1962)
  %xor60 = call i64 @llvm.fshl.i64(i64 %xor27, i64 %xor27, i64 1), !dbg !2084
    #dbg_value(!DIArgList(i64 %Agu.0, i64 %xor39, i64 %xor60), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %xor39, i64 %xor60), !1972, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Asu.0, i64 %xor39, i64 %xor60), !2012, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Amu.0, i64 %xor39, i64 %xor60), !2002, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor39, i64 %xor60), !2029, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Aku.0, i64 %xor39, i64 %xor60), !1992, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor61 = xor i64 %xor39, %xor60, !dbg !2085
    #dbg_value(!DIArgList(i64 %Agu.0, i64 %xor61), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %xor61), !1972, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Asu.0, i64 %xor61), !2012, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Amu.0, i64 %xor61), !2002, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 %xor61, !2029, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 %Aku.0, i64 %xor61), !1992, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor207 = xor i64 %Aku.0, %xor61, !dbg !2086
    #dbg_value(i64 %xor207, !1992, !DIExpression(), !1962)
  %xor210 = call i64 @llvm.fshl.i64(i64 %xor207, i64 %xor207, i64 39), !dbg !2087
    #dbg_value(i64 %xor210, !2022, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 %xor206, i64 %xor214, i64 %xor210), !2051, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %not222 = xor i64 %xor210, -1, !dbg !2088
    #dbg_value(!DIArgList(i64 %xor206, i64 %xor214, i64 %not222), !2051, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %and223 = and i64 %xor214, %not222, !dbg !2089
    #dbg_value(!DIArgList(i64 %xor206, i64 %and223), !2051, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor224 = xor i64 %xor206, %and223, !dbg !2090
    #dbg_value(i64 %xor224, !2051, !DIExpression(), !1962)
  %xor52 = call i64 @llvm.fshl.i64(i64 %xor39, i64 %xor39, i64 1), !dbg !2091
    #dbg_value(!DIArgList(i64 %xor31, i64 %xor52), !2027, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Aki.0, i64 %xor31, i64 %xor52), !1988, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Agi.0, i64 %xor31, i64 %xor52), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %xor31, i64 %xor52), !1968, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Asi.0, i64 %xor31, i64 %xor52), !2008, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Ami.0, i64 %xor31, i64 %xor52), !1998, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor53 = xor i64 %xor31, %xor52, !dbg !2092
    #dbg_value(i64 %xor53, !2027, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 %Aki.0, i64 %xor53), !1988, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Agi.0, i64 %xor53), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %xor53), !1968, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Asi.0, i64 %xor53), !2008, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Ami.0, i64 %xor53), !1998, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor67 = xor i64 %Aki.0, %xor53, !dbg !2093
    #dbg_value(i64 %xor67, !1988, !DIExpression(), !1962)
  %xor70 = call i64 @llvm.fshl.i64(i64 %xor67, i64 %xor67, i64 43), !dbg !2094
    #dbg_value(i64 %xor70, !2022, !DIExpression(), !1962)
  %xor48 = call i64 @llvm.fshl.i64(i64 %xor35, i64 %xor35, i64 1), !dbg !2095
    #dbg_value(!DIArgList(i64 %xor27, i64 %xor48), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Age.0, i64 %xor27, i64 %xor48), !1976, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %xor27, i64 %xor48), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Ake.0, i64 %xor27, i64 %xor48), !1986, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Ame.0, i64 %xor27, i64 %xor48), !1996, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Ase.0, i64 %xor27, i64 %xor48), !2006, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor49 = xor i64 %xor27, %xor48, !dbg !2096
    #dbg_value(i64 %xor49, !2026, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 %Age.0, i64 %xor49), !1976, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %xor49), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Ake.0, i64 %xor49), !1986, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Ame.0, i64 %xor49), !1996, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %Ase.0, i64 %xor49), !2006, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor63 = xor i64 %Age.0, %xor49, !dbg !2097
    #dbg_value(i64 %xor63, !1976, !DIExpression(), !1962)
  %xor66 = call i64 @llvm.fshl.i64(i64 %xor63, i64 %xor63, i64 44), !dbg !2098
    #dbg_value(i64 %xor66, !2021, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor70, i64 %xor45, i64 %xor66), !2030, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %not = xor i64 %xor66, -1, !dbg !2099
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor70, i64 %xor45, i64 %not), !2030, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %and = and i64 %xor70, %not, !dbg !2100
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %and, i64 %xor45), !2030, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %arrayidx80 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %round.0, !dbg !2101
  %25 = load i64, ptr %arrayidx80, align 8, !dbg !2101
    #dbg_value(!DIArgList(i64 %and, i64 %Aba.0, i64 %xor45, i64 %25), !2030, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
  %26 = xor i64 %and, %25, !dbg !2102
    #dbg_value(!DIArgList(i64 %26, i64 %Aba.0, i64 %xor45), !2030, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor62 = xor i64 %Aba.0, %xor45, !dbg !2103
    #dbg_value(i64 %xor62, !1964, !DIExpression(), !1962)
    #dbg_value(i64 %xor62, !2020, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 %26, i64 %xor62), !2030, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor81 = xor i64 %26, %xor62, !dbg !2102
    #dbg_value(i64 %xor81, !2030, !DIExpression(), !1962)
  %xor94 = xor i64 %Abo.0, %xor57, !dbg !2104
    #dbg_value(i64 %xor94, !1970, !DIExpression(), !1962)
  %xor97 = call i64 @llvm.fshl.i64(i64 %xor94, i64 %xor94, i64 28), !dbg !2105
    #dbg_value(i64 %xor97, !2020, !DIExpression(), !1962)
  %xor102 = xor i64 %Aka.0, %xor45, !dbg !2106
    #dbg_value(i64 %xor102, !1984, !DIExpression(), !1962)
  %xor105 = call i64 @llvm.fshl.i64(i64 %xor102, i64 %xor102, i64 3), !dbg !2107
    #dbg_value(i64 %xor105, !2022, !DIExpression(), !1962)
  %xor98 = xor i64 %Agu.0, %xor61, !dbg !2108
    #dbg_value(i64 %xor98, !1982, !DIExpression(), !1962)
  %xor101 = call i64 @llvm.fshl.i64(i64 %xor98, i64 %xor98, i64 20), !dbg !2109
    #dbg_value(i64 %xor101, !2021, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 %xor97, i64 %xor105, i64 %xor101), !2035, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %not114 = xor i64 %xor101, -1, !dbg !2110
    #dbg_value(!DIArgList(i64 %xor97, i64 %xor105, i64 %not114), !2035, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %and115 = and i64 %xor105, %not114, !dbg !2111
    #dbg_value(!DIArgList(i64 %xor97, i64 %and115), !2035, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor116 = xor i64 %xor97, %and115, !dbg !2112
    #dbg_value(i64 %xor116, !2035, !DIExpression(), !1962)
  %xor234 = xor i64 %xor81, %xor116, !dbg !2113
  %xor129 = xor i64 %Abe.0, %xor49, !dbg !2114
    #dbg_value(i64 %xor129, !1966, !DIExpression(), !1962)
  %xor132 = call i64 @llvm.fshl.i64(i64 %xor129, i64 %xor129, i64 1), !dbg !2115
    #dbg_value(i64 %xor132, !2020, !DIExpression(), !1962)
  %xor137 = xor i64 %Ako.0, %xor57, !dbg !2116
    #dbg_value(i64 %xor137, !1990, !DIExpression(), !1962)
  %xor140 = call i64 @llvm.fshl.i64(i64 %xor137, i64 %xor137, i64 25), !dbg !2117
    #dbg_value(i64 %xor140, !2022, !DIExpression(), !1962)
  %xor133 = xor i64 %Agi.0, %xor53, !dbg !2118
    #dbg_value(i64 %xor133, !1978, !DIExpression(), !1962)
  %xor136 = call i64 @llvm.fshl.i64(i64 %xor133, i64 %xor133, i64 6), !dbg !2119
    #dbg_value(i64 %xor136, !2021, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 %xor132, i64 %xor140, i64 %xor136), !2040, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %not149 = xor i64 %xor136, -1, !dbg !2120
    #dbg_value(!DIArgList(i64 %xor132, i64 %xor140, i64 %not149), !2040, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %and150 = and i64 %xor140, %not149, !dbg !2121
    #dbg_value(!DIArgList(i64 %xor132, i64 %and150), !2040, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor151 = xor i64 %xor132, %and150, !dbg !2122
    #dbg_value(i64 %xor151, !2040, !DIExpression(), !1962)
  %xor235 = xor i64 %xor234, %xor151, !dbg !2123
  %xor164 = xor i64 %Abu.0, %xor61, !dbg !2124
    #dbg_value(i64 %xor164, !1972, !DIExpression(), !1962)
  %xor167 = call i64 @llvm.fshl.i64(i64 %xor164, i64 %xor164, i64 27), !dbg !2125
    #dbg_value(i64 %xor167, !2020, !DIExpression(), !1962)
  %xor172 = xor i64 %Ake.0, %xor49, !dbg !2126
    #dbg_value(i64 %xor172, !1986, !DIExpression(), !1962)
  %xor175 = call i64 @llvm.fshl.i64(i64 %xor172, i64 %xor172, i64 10), !dbg !2127
    #dbg_value(i64 %xor175, !2022, !DIExpression(), !1962)
  %xor168 = xor i64 %Aga.0, %xor45, !dbg !2128
    #dbg_value(i64 %xor168, !1974, !DIExpression(), !1962)
  %xor171 = call i64 @llvm.fshl.i64(i64 %xor168, i64 %xor168, i64 36), !dbg !2129
    #dbg_value(i64 %xor171, !2021, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 %xor167, i64 %xor175, i64 %xor171), !2045, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %not184 = xor i64 %xor171, -1, !dbg !2130
    #dbg_value(!DIArgList(i64 %xor167, i64 %xor175, i64 %not184), !2045, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %and185 = and i64 %xor175, %not184, !dbg !2131
    #dbg_value(!DIArgList(i64 %xor167, i64 %and185), !2045, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor186 = xor i64 %xor167, %and185, !dbg !2132
    #dbg_value(i64 %xor186, !2045, !DIExpression(), !1962)
  %xor236 = xor i64 %xor235, %xor186, !dbg !2133
  %xor199 = xor i64 %Abi.0, %xor53, !dbg !2134
    #dbg_value(i64 %xor199, !1968, !DIExpression(), !1962)
  %xor202 = call i64 @llvm.fshl.i64(i64 %xor199, i64 %xor199, i64 62), !dbg !2135
    #dbg_value(!DIArgList(i64 %xor202, i64 %xor210, i64 %xor206), !2050, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %xor210, i64 %xor206), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
  %not219 = xor i64 %xor206, -1, !dbg !2136
    #dbg_value(!DIArgList(i64 %xor202, i64 %xor210, i64 %not219), !2050, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %xor210, i64 %not219), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
  %and220 = and i64 %xor210, %not219, !dbg !2137
    #dbg_value(!DIArgList(i64 %xor202, i64 %and220), !2050, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %and220), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor221 = xor i64 %xor202, %and220, !dbg !2138
    #dbg_value(i64 %xor221, !2050, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor221), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor237 = xor i64 %xor236, %xor221, !dbg !2139
    #dbg_value(i64 %xor237, !2020, !DIExpression(), !1962)
  %xor75 = xor i64 %Asu.0, %xor61, !dbg !2140
    #dbg_value(i64 %xor75, !2012, !DIExpression(), !1962)
  %xor78 = call i64 @llvm.fshl.i64(i64 %xor75, i64 %xor75, i64 14), !dbg !2141
    #dbg_value(i64 %xor78, !2024, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor66, i64 %xor62), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor71 = xor i64 %Amo.0, %xor57, !dbg !2142
    #dbg_value(i64 %xor71, !2000, !DIExpression(), !1962)
  %xor74 = call i64 @llvm.fshl.i64(i64 %xor71, i64 %xor71, i64 21), !dbg !2143
    #dbg_value(i64 %xor74, !2023, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 %xor70, i64 %xor78, i64 %xor74), !2032, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor74, i64 %xor70), !2031, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor62, i64 %xor78), !2033, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %not85 = xor i64 %xor74, -1, !dbg !2144
    #dbg_value(!DIArgList(i64 %xor70, i64 %xor78, i64 %not85), !2032, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %and86 = and i64 %xor78, %not85, !dbg !2145
    #dbg_value(!DIArgList(i64 %xor70, i64 %and86), !2032, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor87 = xor i64 %xor70, %and86, !dbg !2146
    #dbg_value(i64 %xor87, !2032, !DIExpression(), !1962)
  %xor110 = xor i64 %Asi.0, %xor53, !dbg !2147
    #dbg_value(i64 %xor110, !2008, !DIExpression(), !1962)
  %xor113 = call i64 @llvm.fshl.i64(i64 %xor110, i64 %xor110, i64 61), !dbg !2148
    #dbg_value(i64 %xor113, !2024, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 %xor113, i64 %xor101, i64 %xor97), !2039, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor106 = xor i64 %Ame.0, %xor49, !dbg !2149
    #dbg_value(i64 %xor106, !1996, !DIExpression(), !1962)
  %xor109 = call i64 @llvm.fshl.i64(i64 %xor106, i64 %xor106, i64 45), !dbg !2150
    #dbg_value(i64 %xor109, !2023, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 %xor105, i64 %xor113, i64 %xor109), !2037, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor109, i64 %xor97, i64 %xor113), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor109, i64 %xor105), !2036, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %not120 = xor i64 %xor109, -1, !dbg !2151
    #dbg_value(!DIArgList(i64 %xor105, i64 %xor113, i64 %not120), !2037, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %and121 = and i64 %xor113, %not120, !dbg !2152
    #dbg_value(!DIArgList(i64 %xor105, i64 %and121), !2037, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor122 = xor i64 %xor105, %and121, !dbg !2153
    #dbg_value(i64 %xor122, !2037, !DIExpression(), !1962)
  %xor242 = xor i64 %xor87, %xor122, !dbg !2154
  %xor145 = xor i64 %Asa.0, %xor45, !dbg !2155
    #dbg_value(i64 %xor145, !2004, !DIExpression(), !1962)
  %xor148 = call i64 @llvm.fshl.i64(i64 %xor145, i64 %xor145, i64 18), !dbg !2156
    #dbg_value(i64 %xor148, !2024, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 %xor148, i64 %xor136, i64 %xor132), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor141 = xor i64 %Amu.0, %xor61, !dbg !2157
    #dbg_value(i64 %xor141, !2002, !DIExpression(), !1962)
  %xor144 = call i64 @llvm.fshl.i64(i64 %xor141, i64 %xor141, i64 8), !dbg !2158
    #dbg_value(i64 %xor144, !2023, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 %xor140, i64 %xor148, i64 %xor144), !2042, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor144, i64 %xor140), !2041, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor132, i64 %xor148), !2043, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %not155 = xor i64 %xor144, -1, !dbg !2159
    #dbg_value(!DIArgList(i64 %xor140, i64 %xor148, i64 %not155), !2042, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %and156 = and i64 %xor148, %not155, !dbg !2160
    #dbg_value(!DIArgList(i64 %xor140, i64 %and156), !2042, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor157 = xor i64 %xor140, %and156, !dbg !2161
    #dbg_value(i64 %xor157, !2042, !DIExpression(), !1962)
  %xor243 = xor i64 %xor242, %xor157, !dbg !2162
  %xor180 = xor i64 %Aso.0, %xor57, !dbg !2163
    #dbg_value(i64 %xor180, !2010, !DIExpression(), !1962)
  %xor183 = call i64 @llvm.fshl.i64(i64 %xor180, i64 %xor180, i64 56), !dbg !2164
    #dbg_value(i64 %xor183, !2024, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 %xor183, i64 %xor171, i64 %xor167), !2049, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor176 = xor i64 %Ami.0, %xor53, !dbg !2165
    #dbg_value(i64 %xor176, !1998, !DIExpression(), !1962)
  %xor179 = call i64 @llvm.fshl.i64(i64 %xor176, i64 %xor176, i64 15), !dbg !2166
    #dbg_value(i64 %xor179, !2023, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 %xor175, i64 %xor183, i64 %xor179), !2047, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor179, i64 %xor175), !2046, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor167, i64 %xor183), !2048, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %xor74, i64 %xor70), !2021, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %not190 = xor i64 %xor179, -1, !dbg !2167
    #dbg_value(!DIArgList(i64 %xor175, i64 %xor183, i64 %not190), !2047, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %and191 = and i64 %xor183, %not190, !dbg !2168
    #dbg_value(!DIArgList(i64 %xor175, i64 %and191), !2047, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor192 = xor i64 %xor175, %and191, !dbg !2169
    #dbg_value(i64 %xor192, !2047, !DIExpression(), !1962)
  %xor244 = xor i64 %xor243, %xor192, !dbg !2170
  %xor215 = xor i64 %Ase.0, %xor49, !dbg !2171
    #dbg_value(i64 %xor215, !2006, !DIExpression(), !1962)
  %xor218 = call i64 @llvm.fshl.i64(i64 %xor215, i64 %xor215, i64 2), !dbg !2172
    #dbg_value(!DIArgList(i64 %xor210, i64 %xor218, i64 %xor214), !2052, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor218, i64 %xor206, i64 %xor202), !2054, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor202, i64 %xor218), !2053, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %xor218, i64 %xor214), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %xor97, i64 %xor113), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %xor66, i64 %xor62), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
  %not225 = xor i64 %xor214, -1, !dbg !2173
    #dbg_value(!DIArgList(i64 %xor210, i64 %xor218, i64 %not225), !2052, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %xor218, i64 %not225), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
  %and226 = and i64 %xor218, %not225, !dbg !2174
    #dbg_value(!DIArgList(i64 %xor210, i64 %and226), !2052, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %and226), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor227 = xor i64 %xor210, %and226, !dbg !2175
    #dbg_value(i64 %xor227, !2052, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor227), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor245 = xor i64 %xor244, %xor227, !dbg !2176
    #dbg_value(i64 %xor245, !2022, !DIExpression(), !1962)
  %xor260 = call i64 @llvm.fshl.i64(i64 %xor245, i64 %xor245, i64 1), !dbg !2177
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor237, i64 %xor260), !2051, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor237, i64 %xor74, i64 %xor70, i64 %xor260), !2031, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor237, i64 %xor109, i64 %xor105, i64 %xor260), !2036, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor237, i64 %xor144, i64 %xor140, i64 %xor260), !2041, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor237, i64 %xor179, i64 %xor175, i64 %xor260), !2046, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor237, i64 %xor260), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor261 = xor i64 %xor237, %xor260, !dbg !2178
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor261), !2051, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %xor74, i64 %xor70), !2031, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %xor109, i64 %xor105), !2036, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %xor144, i64 %xor140), !2041, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %xor179, i64 %xor175), !2046, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 %xor261, !2026, !DIExpression(), !1962)
  %xor429 = xor i64 %xor224, %xor261, !dbg !2179
    #dbg_value(i64 %xor429, !2051, !DIExpression(), !1962)
  %xor432 = call i64 @llvm.fshl.i64(i64 %xor429, i64 %xor429, i64 2), !dbg !2180
    #dbg_value(i64 %xor432, !2024, !DIExpression(), !1962)
  %not123 = xor i64 %xor113, -1, !dbg !2181
    #dbg_value(!DIArgList(i64 %xor109, i64 %xor97, i64 %not123), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %xor97, i64 %not123), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
  %and124 = and i64 %xor97, %not123, !dbg !2182
    #dbg_value(!DIArgList(i64 %xor109, i64 %and124), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %and124), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor125 = xor i64 %xor109, %and124, !dbg !2183
    #dbg_value(i64 %xor125, !2038, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %xor62, i64 %xor78), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
  %not91 = xor i64 %xor62, -1, !dbg !2184
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor66, i64 %not91), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %xor66, i64 %not91), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
  %and92 = and i64 %xor66, %not91, !dbg !2185
    #dbg_value(!DIArgList(i64 %xor78, i64 %and92), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %and92), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor93 = xor i64 %xor78, %and92, !dbg !2186
    #dbg_value(i64 %xor93, !2034, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
  %not126 = xor i64 %xor97, -1, !dbg !2187
    #dbg_value(!DIArgList(i64 %xor113, i64 %xor101, i64 %not126), !2039, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %not126), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
  %and127 = and i64 %xor101, %not126, !dbg !2188
    #dbg_value(!DIArgList(i64 %xor113, i64 %and127), !2039, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %and127), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor128 = xor i64 %xor113, %and127, !dbg !2189
    #dbg_value(i64 %xor128, !2039, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor128), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor250 = xor i64 %xor93, %xor128, !dbg !2190
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
  %not161 = xor i64 %xor132, -1, !dbg !2191
    #dbg_value(!DIArgList(i64 %xor148, i64 %xor136, i64 %not161), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %not161), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
  %and162 = and i64 %xor136, %not161, !dbg !2192
    #dbg_value(!DIArgList(i64 %xor148, i64 %and162), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %and162), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor163 = xor i64 %xor148, %and162, !dbg !2193
    #dbg_value(i64 %xor163, !2044, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor163), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor251 = xor i64 %xor250, %xor163, !dbg !2194
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
  %not196 = xor i64 %xor167, -1, !dbg !2195
    #dbg_value(!DIArgList(i64 %xor183, i64 %xor171, i64 %not196), !2049, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %not196), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
  %and197 = and i64 %xor171, %not196, !dbg !2196
    #dbg_value(!DIArgList(i64 %xor183, i64 %and197), !2049, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %and197), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor198 = xor i64 %xor183, %and197, !dbg !2197
    #dbg_value(i64 %xor198, !2049, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor198), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor252 = xor i64 %xor251, %xor198, !dbg !2198
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %xor206, i64 %xor202), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
  %not231 = xor i64 %xor202, -1, !dbg !2199
    #dbg_value(!DIArgList(i64 %xor218, i64 %xor206, i64 %not231), !2054, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %xor206, i64 %not231), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
  %and232 = and i64 %xor206, %not231, !dbg !2200
    #dbg_value(!DIArgList(i64 %xor218, i64 %and232), !2054, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %and232), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor233 = xor i64 %xor218, %and232, !dbg !2201
    #dbg_value(i64 %xor233, !2054, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor233), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor253 = xor i64 %xor252, %xor233, !dbg !2202
    #dbg_value(i64 %xor253, !2024, !DIExpression(), !1962)
  %xor268 = call i64 @llvm.fshl.i64(i64 %xor253, i64 %xor253, i64 1), !dbg !2203
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor245, i64 %xor268), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor245, i64 %xor62, i64 %xor78, i64 %xor268), !2033, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor245, i64 %xor132, i64 %xor148, i64 %xor268), !2043, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor245, i64 %xor167, i64 %xor183, i64 %xor268), !2048, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor245, i64 %xor202, i64 %xor218, i64 %xor268), !2053, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor245, i64 %xor268), !2028, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor269 = xor i64 %xor245, %xor268, !dbg !2204
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor269), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %xor62, i64 %xor78), !2033, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %xor132, i64 %xor148), !2043, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %xor167, i64 %xor183), !2048, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %xor202, i64 %xor218), !2053, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 %xor269, !2028, !DIExpression(), !1962)
  %xor417 = xor i64 %xor125, %xor269, !dbg !2205
    #dbg_value(i64 %xor417, !2038, !DIExpression(), !1962)
  %xor420 = call i64 @llvm.fshl.i64(i64 %xor417, i64 %xor417, i64 55), !dbg !2206
    #dbg_value(i64 %xor420, !2021, !DIExpression(), !1962)
  %not82 = xor i64 %xor70, -1, !dbg !2207
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %xor74, i64 %not82), !2021, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %xor74, i64 %not82), !2031, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %and83 = and i64 %xor74, %not82, !dbg !2208
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %and83), !2021, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %and83), !2031, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor84 = xor i64 %xor66, %and83, !dbg !2209
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105), !2021, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor261), !2031, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %not117 = xor i64 %xor105, -1, !dbg !2210
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %not117), !2021, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %xor109, i64 %not117), !2036, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %and118 = and i64 %xor109, %not117, !dbg !2211
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %and118), !2021, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %and118), !2036, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor119 = xor i64 %xor101, %and118, !dbg !2212
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor119), !2021, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor119, i64 %xor261), !2036, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor238 = xor i64 %xor84, %xor119, !dbg !2213
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140), !2021, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %not152 = xor i64 %xor140, -1, !dbg !2214
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %not152), !2021, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %xor144, i64 %not152), !2041, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %and153 = and i64 %xor144, %not152, !dbg !2215
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %and153), !2021, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %and153), !2041, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor154 = xor i64 %xor136, %and153, !dbg !2216
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor154), !2021, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor154, i64 %xor261), !2041, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor239 = xor i64 %xor238, %xor154, !dbg !2217
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175), !2021, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %not187 = xor i64 %xor175, -1, !dbg !2218
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %xor179, i64 %not187), !2021, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %xor179, i64 %not187), !2046, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %and188 = and i64 %xor179, %not187, !dbg !2219
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %and188), !2021, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %and188), !2046, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor189 = xor i64 %xor171, %and188, !dbg !2220
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor189), !2021, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor189, i64 %xor261), !2046, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor240 = xor i64 %xor239, %xor189, !dbg !2221
    #dbg_value(!DIArgList(i64 %xor240, i64 %xor224), !2021, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor241 = xor i64 %xor240, %xor224, !dbg !2222
    #dbg_value(i64 %xor241, !2021, !DIExpression(), !1962)
  %not88 = xor i64 %xor78, -1, !dbg !2223
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %xor62, i64 %not88), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %xor62, i64 %not88), !2033, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %and89 = and i64 %xor62, %not88, !dbg !2224
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %and89), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %and89), !2033, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor90 = xor i64 %xor74, %and89, !dbg !2225
    #dbg_value(!DIArgList(i64 %xor90, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor90, i64 %xor269), !2033, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor246 = xor i64 %xor90, %xor125, !dbg !2226
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
  %not158 = xor i64 %xor148, -1, !dbg !2227
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %not158), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %xor132, i64 %not158), !2043, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %and159 = and i64 %xor132, %not158, !dbg !2228
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %and159), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %and159), !2043, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor160 = xor i64 %xor144, %and159, !dbg !2229
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor160), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor160, i64 %xor269), !2043, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor247 = xor i64 %xor246, %xor160, !dbg !2230
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
  %not193 = xor i64 %xor183, -1, !dbg !2231
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %not193), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %xor167, i64 %not193), !2048, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %and194 = and i64 %xor167, %not193, !dbg !2232
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %and194), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %and194), !2048, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor195 = xor i64 %xor179, %and194, !dbg !2233
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor195), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor195, i64 %xor269), !2048, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor248 = xor i64 %xor247, %xor195, !dbg !2234
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %xor202, i64 %xor218), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
  %not228 = xor i64 %xor218, -1, !dbg !2235
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %xor202, i64 %not228), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %xor202, i64 %not228), !2053, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %and229 = and i64 %xor202, %not228, !dbg !2236
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %and229), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %and229), !2053, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor230 = xor i64 %xor214, %and229, !dbg !2237
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor230), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor230, i64 %xor269), !2053, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor249 = xor i64 %xor248, %xor230, !dbg !2238
    #dbg_value(i64 %xor249, !2023, !DIExpression(), !1962)
  %xor264 = call i64 @llvm.fshl.i64(i64 %xor249, i64 %xor249, i64 1), !dbg !2239
    #dbg_value(!DIArgList(i64 %xor241, i64 %xor264), !2027, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor241, i64 %xor264), !2032, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor241, i64 %xor264), !2047, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor241, i64 %xor264), !2037, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor241, i64 %xor264), !2052, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor241, i64 %xor264), !2042, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor265 = xor i64 %xor241, %xor264, !dbg !2240
    #dbg_value(i64 %xor265, !2027, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor265), !2032, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor265), !2047, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor265), !2037, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor265), !2052, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor265), !2042, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor413 = xor i64 %xor87, %xor265, !dbg !2241
    #dbg_value(i64 %xor413, !2032, !DIExpression(), !1962)
  %xor416 = call i64 @llvm.fshl.i64(i64 %xor413, i64 %xor413, i64 62), !dbg !2242
    #dbg_value(i64 %xor416, !2020, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 %xor432, i64 %xor420, i64 %xor416), !2012, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %not445 = xor i64 %xor416, -1, !dbg !2243
    #dbg_value(!DIArgList(i64 %xor432, i64 %xor420, i64 %not445), !2012, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %and446 = and i64 %xor420, %not445, !dbg !2244
    #dbg_value(!DIArgList(i64 %xor432, i64 %and446), !2012, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor447 = xor i64 %xor432, %and446, !dbg !2245
    #dbg_value(i64 %xor447, !2012, !DIExpression(), !1962)
  %xor256 = call i64 @llvm.fshl.i64(i64 %xor241, i64 %xor241, i64 1), !dbg !2246
    #dbg_value(!DIArgList(i64 %xor253, i64 %xor256), !2025, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor253, i64 %xor256), !2035, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor253, i64 %xor256), !2050, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor253, i64 %xor256), !2040, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %xor256), !2030, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %xor256), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor253, i64 %xor256), !2045, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor257 = xor i64 %xor253, %xor256, !dbg !2247
    #dbg_value(i64 %xor257, !2025, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor257), !2035, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor257), !2050, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor257), !2040, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !2030, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor257), !2045, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor425 = xor i64 %xor186, %xor257, !dbg !2248
    #dbg_value(i64 %xor425, !2045, !DIExpression(), !1962)
  %xor428 = call i64 @llvm.fshl.i64(i64 %xor425, i64 %xor425, i64 41), !dbg !2249
    #dbg_value(i64 %xor428, !2023, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 %xor428, i64 %xor416, i64 %xor432), !2010, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %not442 = xor i64 %xor432, -1, !dbg !2250
    #dbg_value(!DIArgList(i64 %xor428, i64 %xor416, i64 %not442), !2010, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %and443 = and i64 %xor416, %not442, !dbg !2251
    #dbg_value(!DIArgList(i64 %xor428, i64 %and443), !2010, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor444 = xor i64 %xor428, %and443, !dbg !2252
    #dbg_value(i64 %xor444, !2010, !DIExpression(), !1962)
  %xor272 = call i64 @llvm.fshl.i64(i64 %xor237, i64 %xor237, i64 1), !dbg !2253
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor249, i64 %xor272), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor249, i64 %xor272), !2049, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor249, i64 %xor272), !2039, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor249, i64 %xor272), !2054, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor249, i64 %xor272), !2029, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor249, i64 %xor272), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor273 = xor i64 %xor249, %xor272, !dbg !2254
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor273), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor273), !2049, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor273), !2039, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor273), !2054, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(i64 %xor273, !2029, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor273), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor421 = xor i64 %xor163, %xor273, !dbg !2255
    #dbg_value(i64 %xor421, !2044, !DIExpression(), !1962)
  %xor424 = call i64 @llvm.fshl.i64(i64 %xor421, i64 %xor421, i64 39), !dbg !2256
    #dbg_value(i64 %xor424, !2022, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 %xor424, i64 %xor432, i64 %xor428), !2008, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor420, i64 %xor428, i64 %xor424), !2006, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor416, i64 %xor424, i64 %xor420), !2004, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %not439 = xor i64 %xor428, -1, !dbg !2257
    #dbg_value(!DIArgList(i64 %xor424, i64 %xor432, i64 %not439), !2008, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %and440 = and i64 %xor432, %not439, !dbg !2258
    #dbg_value(!DIArgList(i64 %xor424, i64 %and440), !2008, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor441 = xor i64 %xor424, %and440, !dbg !2259
    #dbg_value(i64 %xor441, !2008, !DIExpression(), !1962)
  %not436 = xor i64 %xor424, -1, !dbg !2260
    #dbg_value(!DIArgList(i64 %xor420, i64 %xor428, i64 %not436), !2006, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %and437 = and i64 %xor428, %not436, !dbg !2261
    #dbg_value(!DIArgList(i64 %xor420, i64 %and437), !2006, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor438 = xor i64 %xor420, %and437, !dbg !2262
    #dbg_value(i64 %xor438, !2006, !DIExpression(), !1962)
  %not433 = xor i64 %xor420, -1, !dbg !2263
    #dbg_value(!DIArgList(i64 %xor416, i64 %xor424, i64 %not433), !2004, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %and434 = and i64 %xor424, %not433, !dbg !2264
    #dbg_value(!DIArgList(i64 %xor416, i64 %and434), !2004, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor435 = xor i64 %xor416, %and434, !dbg !2265
    #dbg_value(i64 %xor435, !2004, !DIExpression(), !1962)
  %xor394 = xor i64 %xor230, %xor269, !dbg !2266
    #dbg_value(i64 %xor394, !2053, !DIExpression(), !1962)
  %xor397 = call i64 @llvm.fshl.i64(i64 %xor394, i64 %xor394, i64 56), !dbg !2267
    #dbg_value(i64 %xor397, !2024, !DIExpression(), !1962)
  %xor382 = xor i64 %xor116, %xor257, !dbg !2268
    #dbg_value(i64 %xor382, !2035, !DIExpression(), !1962)
  %xor385 = call i64 @llvm.fshl.i64(i64 %xor382, i64 %xor382, i64 36), !dbg !2269
    #dbg_value(i64 %xor385, !2021, !DIExpression(), !1962)
  %xor378 = xor i64 %xor93, %xor273, !dbg !2270
    #dbg_value(i64 %xor378, !2034, !DIExpression(), !1962)
  %xor381 = call i64 @llvm.fshl.i64(i64 %xor378, i64 %xor378, i64 27), !dbg !2271
    #dbg_value(i64 %xor381, !2020, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 %xor397, i64 %xor385, i64 %xor381), !2002, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %not410 = xor i64 %xor381, -1, !dbg !2272
    #dbg_value(!DIArgList(i64 %xor397, i64 %xor385, i64 %not410), !2002, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %and411 = and i64 %xor385, %not410, !dbg !2273
    #dbg_value(!DIArgList(i64 %xor397, i64 %and411), !2002, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor412 = xor i64 %xor397, %and411, !dbg !2274
    #dbg_value(i64 %xor412, !2002, !DIExpression(), !1962)
  %xor390 = xor i64 %xor192, %xor265, !dbg !2275
    #dbg_value(i64 %xor390, !2047, !DIExpression(), !1962)
  %xor393 = call i64 @llvm.fshl.i64(i64 %xor390, i64 %xor390, i64 15), !dbg !2276
    #dbg_value(i64 %xor393, !2023, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 %xor393, i64 %xor381, i64 %xor397), !2000, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %not407 = xor i64 %xor397, -1, !dbg !2277
    #dbg_value(!DIArgList(i64 %xor393, i64 %xor381, i64 %not407), !2000, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %and408 = and i64 %xor381, %not407, !dbg !2278
    #dbg_value(!DIArgList(i64 %xor393, i64 %and408), !2000, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor409 = xor i64 %xor393, %and408, !dbg !2279
    #dbg_value(i64 %xor409, !2000, !DIExpression(), !1962)
  %xor386 = xor i64 %xor154, %xor261, !dbg !2280
    #dbg_value(i64 %xor386, !2041, !DIExpression(), !1962)
  %xor389 = call i64 @llvm.fshl.i64(i64 %xor386, i64 %xor386, i64 10), !dbg !2281
    #dbg_value(i64 %xor389, !2022, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 %xor389, i64 %xor397, i64 %xor393), !1998, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor385, i64 %xor393, i64 %xor389), !1996, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor381, i64 %xor389, i64 %xor385), !1994, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %not404 = xor i64 %xor393, -1, !dbg !2282
    #dbg_value(!DIArgList(i64 %xor389, i64 %xor397, i64 %not404), !1998, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %and405 = and i64 %xor397, %not404, !dbg !2283
    #dbg_value(!DIArgList(i64 %xor389, i64 %and405), !1998, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor406 = xor i64 %xor389, %and405, !dbg !2284
    #dbg_value(i64 %xor406, !1998, !DIExpression(), !1962)
  %not401 = xor i64 %xor389, -1, !dbg !2285
    #dbg_value(!DIArgList(i64 %xor385, i64 %xor393, i64 %not401), !1996, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %and402 = and i64 %xor393, %not401, !dbg !2286
    #dbg_value(!DIArgList(i64 %xor385, i64 %and402), !1996, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor403 = xor i64 %xor385, %and402, !dbg !2287
    #dbg_value(i64 %xor403, !1996, !DIExpression(), !1962)
  %not398 = xor i64 %xor385, -1, !dbg !2288
    #dbg_value(!DIArgList(i64 %xor381, i64 %xor389, i64 %not398), !1994, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %and399 = and i64 %xor389, %not398, !dbg !2289
    #dbg_value(!DIArgList(i64 %xor381, i64 %and399), !1994, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor400 = xor i64 %xor381, %and399, !dbg !2290
    #dbg_value(i64 %xor400, !1994, !DIExpression(), !1962)
  %xor359 = xor i64 %xor221, %xor257, !dbg !2291
    #dbg_value(i64 %xor359, !2050, !DIExpression(), !1962)
  %xor362 = call i64 @llvm.fshl.i64(i64 %xor359, i64 %xor359, i64 18), !dbg !2292
    #dbg_value(i64 %xor362, !2024, !DIExpression(), !1962)
  %xor347 = xor i64 %xor122, %xor265, !dbg !2293
    #dbg_value(i64 %xor347, !2037, !DIExpression(), !1962)
  %xor350 = call i64 @llvm.fshl.i64(i64 %xor347, i64 %xor347, i64 6), !dbg !2294
    #dbg_value(i64 %xor350, !2021, !DIExpression(), !1962)
  %xor343 = xor i64 %xor84, %xor261, !dbg !2295
    #dbg_value(i64 %xor343, !2031, !DIExpression(), !1962)
  %xor346 = call i64 @llvm.fshl.i64(i64 %xor343, i64 %xor343, i64 1), !dbg !2296
    #dbg_value(i64 %xor346, !2020, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 %xor362, i64 %xor350, i64 %xor346), !1992, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %not375 = xor i64 %xor346, -1, !dbg !2297
    #dbg_value(!DIArgList(i64 %xor362, i64 %xor350, i64 %not375), !1992, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %and376 = and i64 %xor350, %not375, !dbg !2298
    #dbg_value(!DIArgList(i64 %xor362, i64 %and376), !1992, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor377 = xor i64 %xor362, %and376, !dbg !2299
    #dbg_value(i64 %xor377, !1992, !DIExpression(), !1962)
  %xor355 = xor i64 %xor198, %xor273, !dbg !2300
    #dbg_value(i64 %xor355, !2049, !DIExpression(), !1962)
  %xor358 = call i64 @llvm.fshl.i64(i64 %xor355, i64 %xor355, i64 8), !dbg !2301
    #dbg_value(i64 %xor358, !2023, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 %xor358, i64 %xor346, i64 %xor362), !1990, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %not372 = xor i64 %xor362, -1, !dbg !2302
    #dbg_value(!DIArgList(i64 %xor358, i64 %xor346, i64 %not372), !1990, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %and373 = and i64 %xor346, %not372, !dbg !2303
    #dbg_value(!DIArgList(i64 %xor358, i64 %and373), !1990, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor374 = xor i64 %xor358, %and373, !dbg !2304
    #dbg_value(i64 %xor374, !1990, !DIExpression(), !1962)
  %xor351 = xor i64 %xor160, %xor269, !dbg !2305
    #dbg_value(i64 %xor351, !2043, !DIExpression(), !1962)
  %xor354 = call i64 @llvm.fshl.i64(i64 %xor351, i64 %xor351, i64 25), !dbg !2306
    #dbg_value(i64 %xor354, !2022, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 %xor354, i64 %xor362, i64 %xor358), !1988, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor350, i64 %xor358, i64 %xor354), !1986, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor346, i64 %xor354, i64 %xor350), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %not369 = xor i64 %xor358, -1, !dbg !2307
    #dbg_value(!DIArgList(i64 %xor354, i64 %xor362, i64 %not369), !1988, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %and370 = and i64 %xor362, %not369, !dbg !2308
    #dbg_value(!DIArgList(i64 %xor354, i64 %and370), !1988, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor371 = xor i64 %xor354, %and370, !dbg !2309
    #dbg_value(i64 %xor371, !1988, !DIExpression(), !1962)
  %not366 = xor i64 %xor354, -1, !dbg !2310
    #dbg_value(!DIArgList(i64 %xor350, i64 %xor358, i64 %not366), !1986, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %and367 = and i64 %xor358, %not366, !dbg !2311
    #dbg_value(!DIArgList(i64 %xor350, i64 %and367), !1986, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor368 = xor i64 %xor350, %and367, !dbg !2312
    #dbg_value(i64 %xor368, !1986, !DIExpression(), !1962)
  %not363 = xor i64 %xor350, -1, !dbg !2313
    #dbg_value(!DIArgList(i64 %xor346, i64 %xor354, i64 %not363), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %and364 = and i64 %xor354, %not363, !dbg !2314
    #dbg_value(!DIArgList(i64 %xor346, i64 %and364), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor365 = xor i64 %xor346, %and364, !dbg !2315
    #dbg_value(i64 %xor365, !1984, !DIExpression(), !1962)
  %xor324 = xor i64 %xor227, %xor265, !dbg !2316
    #dbg_value(i64 %xor324, !2052, !DIExpression(), !1962)
  %xor327 = call i64 @llvm.fshl.i64(i64 %xor324, i64 %xor324, i64 61), !dbg !2317
    #dbg_value(i64 %xor327, !2024, !DIExpression(), !1962)
  %xor312 = xor i64 %xor128, %xor273, !dbg !2318
    #dbg_value(i64 %xor312, !2039, !DIExpression(), !1962)
  %xor315 = call i64 @llvm.fshl.i64(i64 %xor312, i64 %xor312, i64 20), !dbg !2319
    #dbg_value(i64 %xor315, !2021, !DIExpression(), !1962)
  %xor308 = xor i64 %xor90, %xor269, !dbg !2320
    #dbg_value(i64 %xor308, !2033, !DIExpression(), !1962)
  %xor311 = call i64 @llvm.fshl.i64(i64 %xor308, i64 %xor308, i64 28), !dbg !2321
    #dbg_value(i64 %xor311, !2020, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 %xor327, i64 %xor315, i64 %xor311), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %not340 = xor i64 %xor311, -1, !dbg !2322
    #dbg_value(!DIArgList(i64 %xor327, i64 %xor315, i64 %not340), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %and341 = and i64 %xor315, %not340, !dbg !2323
    #dbg_value(!DIArgList(i64 %xor327, i64 %and341), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor342 = xor i64 %xor327, %and341, !dbg !2324
    #dbg_value(i64 %xor342, !1982, !DIExpression(), !1962)
  %xor320 = xor i64 %xor189, %xor261, !dbg !2325
    #dbg_value(i64 %xor320, !2046, !DIExpression(), !1962)
  %xor323 = call i64 @llvm.fshl.i64(i64 %xor320, i64 %xor320, i64 45), !dbg !2326
    #dbg_value(i64 %xor323, !2023, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 %xor323, i64 %xor311, i64 %xor327), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %not337 = xor i64 %xor327, -1, !dbg !2327
    #dbg_value(!DIArgList(i64 %xor323, i64 %xor311, i64 %not337), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %and338 = and i64 %xor311, %not337, !dbg !2328
    #dbg_value(!DIArgList(i64 %xor323, i64 %and338), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor339 = xor i64 %xor323, %and338, !dbg !2329
    #dbg_value(i64 %xor339, !1980, !DIExpression(), !1962)
  %xor316 = xor i64 %xor151, %xor257, !dbg !2330
    #dbg_value(i64 %xor316, !2040, !DIExpression(), !1962)
  %xor319 = call i64 @llvm.fshl.i64(i64 %xor316, i64 %xor316, i64 3), !dbg !2331
    #dbg_value(i64 %xor319, !2022, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 %xor319, i64 %xor327, i64 %xor323), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor315, i64 %xor323, i64 %xor319), !1976, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor311, i64 %xor319, i64 %xor315), !1974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %not334 = xor i64 %xor323, -1, !dbg !2332
    #dbg_value(!DIArgList(i64 %xor319, i64 %xor327, i64 %not334), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %and335 = and i64 %xor327, %not334, !dbg !2333
    #dbg_value(!DIArgList(i64 %xor319, i64 %and335), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor336 = xor i64 %xor319, %and335, !dbg !2334
    #dbg_value(i64 %xor336, !1978, !DIExpression(), !1962)
  %not331 = xor i64 %xor319, -1, !dbg !2335
    #dbg_value(!DIArgList(i64 %xor315, i64 %xor323, i64 %not331), !1976, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %and332 = and i64 %xor323, %not331, !dbg !2336
    #dbg_value(!DIArgList(i64 %xor315, i64 %and332), !1976, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor333 = xor i64 %xor315, %and332, !dbg !2337
    #dbg_value(i64 %xor333, !1976, !DIExpression(), !1962)
  %not328 = xor i64 %xor315, -1, !dbg !2338
    #dbg_value(!DIArgList(i64 %xor311, i64 %xor319, i64 %not328), !1974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %and329 = and i64 %xor319, %not328, !dbg !2339
    #dbg_value(!DIArgList(i64 %xor311, i64 %and329), !1974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor330 = xor i64 %xor311, %and329, !dbg !2340
    #dbg_value(i64 %xor330, !1974, !DIExpression(), !1962)
  %xor287 = xor i64 %xor233, %xor273, !dbg !2341
    #dbg_value(i64 %xor287, !2054, !DIExpression(), !1962)
  %xor290 = call i64 @llvm.fshl.i64(i64 %xor287, i64 %xor287, i64 14), !dbg !2342
    #dbg_value(i64 %xor290, !2024, !DIExpression(), !1962)
  %xor275 = xor i64 %xor119, %xor261, !dbg !2343
    #dbg_value(i64 %xor275, !2036, !DIExpression(), !1962)
  %xor278 = call i64 @llvm.fshl.i64(i64 %xor275, i64 %xor275, i64 44), !dbg !2344
    #dbg_value(i64 %xor278, !2021, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %xor81, i64 %xor257), !1972, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor274 = xor i64 %xor81, %xor257, !dbg !2345
    #dbg_value(i64 %xor274, !2030, !DIExpression(), !1962)
    #dbg_value(i64 %xor274, !2020, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %xor274), !1972, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %not305 = xor i64 %xor274, -1, !dbg !2346
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %not305), !1972, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %and306 = and i64 %xor278, %not305, !dbg !2347
    #dbg_value(!DIArgList(i64 %xor290, i64 %and306), !1972, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor307 = xor i64 %xor290, %and306, !dbg !2348
    #dbg_value(i64 %xor307, !1972, !DIExpression(), !1962)
  %xor283 = xor i64 %xor195, %xor269, !dbg !2349
    #dbg_value(i64 %xor283, !2048, !DIExpression(), !1962)
  %xor286 = call i64 @llvm.fshl.i64(i64 %xor283, i64 %xor283, i64 21), !dbg !2350
    #dbg_value(i64 %xor286, !2023, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 %xor286, i64 %xor274, i64 %xor290), !1970, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %not302 = xor i64 %xor290, -1, !dbg !2351
    #dbg_value(!DIArgList(i64 %xor286, i64 %xor274, i64 %not302), !1970, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %and303 = and i64 %xor274, %not302, !dbg !2352
    #dbg_value(!DIArgList(i64 %xor286, i64 %and303), !1970, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor304 = xor i64 %xor286, %and303, !dbg !2353
    #dbg_value(i64 %xor304, !1970, !DIExpression(), !1962)
  %xor279 = xor i64 %xor157, %xor265, !dbg !2354
    #dbg_value(i64 %xor279, !2042, !DIExpression(), !1962)
  %xor282 = call i64 @llvm.fshl.i64(i64 %xor279, i64 %xor279, i64 43), !dbg !2355
    #dbg_value(i64 %xor282, !2022, !DIExpression(), !1962)
    #dbg_value(!DIArgList(i64 %xor282, i64 %xor290, i64 %xor286), !1968, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor278, i64 %xor286, i64 %xor282), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
    #dbg_value(!DIArgList(i64 %xor274, i64 %xor282, i64 %xor278), !1964, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %not299 = xor i64 %xor286, -1, !dbg !2356
    #dbg_value(!DIArgList(i64 %xor282, i64 %xor290, i64 %not299), !1968, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %and300 = and i64 %xor290, %not299, !dbg !2357
    #dbg_value(!DIArgList(i64 %xor282, i64 %and300), !1968, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor301 = xor i64 %xor282, %and300, !dbg !2358
    #dbg_value(i64 %xor301, !1968, !DIExpression(), !1962)
  %not296 = xor i64 %xor282, -1, !dbg !2359
    #dbg_value(!DIArgList(i64 %xor278, i64 %xor286, i64 %not296), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1962)
  %and297 = and i64 %xor286, %not296, !dbg !2360
    #dbg_value(!DIArgList(i64 %xor278, i64 %and297), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %xor298 = xor i64 %xor278, %and297, !dbg !2361
    #dbg_value(i64 %xor298, !1966, !DIExpression(), !1962)
  %add = or disjoint i32 %round.0, 1, !dbg !2362
  %arrayidx294 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %add, !dbg !2363
  %27 = load i64, ptr %arrayidx294, align 8, !dbg !2363
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %xor282, i64 %xor278), !1964, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %not291 = xor i64 %xor278, -1, !dbg !2364
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %xor282, i64 %not291), !1964, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %and292 = and i64 %xor282, %not291, !dbg !2365
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %and292), !1964, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1962)
  %28 = xor i64 %and292, %27, !dbg !2366
  %xor295 = xor i64 %28, %xor274, !dbg !2366
    #dbg_value(i64 %xor295, !1964, !DIExpression(), !1962)
  %add448 = add nuw nsw i32 %round.0, 2, !dbg !2367
    #dbg_value(i32 %add448, !2013, !DIExpression(), !1962)
  br label %for.cond, !dbg !2368, !llvm.loop !2369

for.end:                                          ; preds = %for.cond
  %Aso.0.lcssa = phi i64 [ %Aso.0, %for.cond ], !dbg !1962
  %Asi.0.lcssa = phi i64 [ %Asi.0, %for.cond ], !dbg !1962
  %Ase.0.lcssa = phi i64 [ %Ase.0, %for.cond ], !dbg !1962
  %Asa.0.lcssa = phi i64 [ %Asa.0, %for.cond ], !dbg !1962
  %Amu.0.lcssa = phi i64 [ %Amu.0, %for.cond ], !dbg !1962
  %Amo.0.lcssa = phi i64 [ %Amo.0, %for.cond ], !dbg !1962
  %Ami.0.lcssa = phi i64 [ %Ami.0, %for.cond ], !dbg !1962
  %Ame.0.lcssa = phi i64 [ %Ame.0, %for.cond ], !dbg !1962
  %Ama.0.lcssa = phi i64 [ %Ama.0, %for.cond ], !dbg !1962
  %Aku.0.lcssa = phi i64 [ %Aku.0, %for.cond ], !dbg !1962
  %Ako.0.lcssa = phi i64 [ %Ako.0, %for.cond ], !dbg !1962
  %Aki.0.lcssa = phi i64 [ %Aki.0, %for.cond ], !dbg !1962
  %Ake.0.lcssa = phi i64 [ %Ake.0, %for.cond ], !dbg !1962
  %Aka.0.lcssa = phi i64 [ %Aka.0, %for.cond ], !dbg !1962
  %Agu.0.lcssa = phi i64 [ %Agu.0, %for.cond ], !dbg !1962
  %Ago.0.lcssa = phi i64 [ %Ago.0, %for.cond ], !dbg !1962
  %Agi.0.lcssa = phi i64 [ %Agi.0, %for.cond ], !dbg !1962
  %Age.0.lcssa = phi i64 [ %Age.0, %for.cond ], !dbg !1962
  %Aga.0.lcssa = phi i64 [ %Aga.0, %for.cond ], !dbg !1962
  %Abu.0.lcssa = phi i64 [ %Abu.0, %for.cond ], !dbg !1962
  %Abo.0.lcssa = phi i64 [ %Abo.0, %for.cond ], !dbg !1962
  %Abi.0.lcssa = phi i64 [ %Abi.0, %for.cond ], !dbg !1962
  %Abe.0.lcssa = phi i64 [ %Abe.0, %for.cond ], !dbg !1962
  %Aba.0.lcssa = phi i64 [ %Aba.0, %for.cond ], !dbg !1962
  %Asu.0.lcssa = phi i64 [ %Asu.0, %for.cond ], !dbg !1962
  store i64 %Aba.0.lcssa, ptr %state, align 8, !dbg !2371
  %arrayidx450 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !2372
  store i64 %Abe.0.lcssa, ptr %arrayidx450, align 8, !dbg !2373
  %arrayidx451 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !2374
  store i64 %Abi.0.lcssa, ptr %arrayidx451, align 8, !dbg !2375
  %arrayidx452 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !2376
  store i64 %Abo.0.lcssa, ptr %arrayidx452, align 8, !dbg !2377
  %arrayidx453 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !2378
  store i64 %Abu.0.lcssa, ptr %arrayidx453, align 8, !dbg !2379
  %arrayidx454 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !2380
  store i64 %Aga.0.lcssa, ptr %arrayidx454, align 8, !dbg !2381
  %arrayidx455 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !2382
  store i64 %Age.0.lcssa, ptr %arrayidx455, align 8, !dbg !2383
  %arrayidx456 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !2384
  store i64 %Agi.0.lcssa, ptr %arrayidx456, align 8, !dbg !2385
  %arrayidx457 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !2386
  store i64 %Ago.0.lcssa, ptr %arrayidx457, align 8, !dbg !2387
  %arrayidx458 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !2388
  store i64 %Agu.0.lcssa, ptr %arrayidx458, align 8, !dbg !2389
  %arrayidx459 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !2390
  store i64 %Aka.0.lcssa, ptr %arrayidx459, align 8, !dbg !2391
  %arrayidx460 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !2392
  store i64 %Ake.0.lcssa, ptr %arrayidx460, align 8, !dbg !2393
  %arrayidx461 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !2394
  store i64 %Aki.0.lcssa, ptr %arrayidx461, align 8, !dbg !2395
  %arrayidx462 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !2396
  store i64 %Ako.0.lcssa, ptr %arrayidx462, align 8, !dbg !2397
  %arrayidx463 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !2398
  store i64 %Aku.0.lcssa, ptr %arrayidx463, align 8, !dbg !2399
  %arrayidx464 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !2400
  store i64 %Ama.0.lcssa, ptr %arrayidx464, align 8, !dbg !2401
  %arrayidx465 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !2402
  store i64 %Ame.0.lcssa, ptr %arrayidx465, align 8, !dbg !2403
  %arrayidx466 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !2404
  store i64 %Ami.0.lcssa, ptr %arrayidx466, align 8, !dbg !2405
  %arrayidx467 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !2406
  store i64 %Amo.0.lcssa, ptr %arrayidx467, align 8, !dbg !2407
  %arrayidx468 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !2408
  store i64 %Amu.0.lcssa, ptr %arrayidx468, align 8, !dbg !2409
  %arrayidx469 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !2410
  store i64 %Asa.0.lcssa, ptr %arrayidx469, align 8, !dbg !2411
  %arrayidx470 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !2412
  store i64 %Ase.0.lcssa, ptr %arrayidx470, align 8, !dbg !2413
  %arrayidx471 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !2414
  store i64 %Asi.0.lcssa, ptr %arrayidx471, align 8, !dbg !2415
  %arrayidx472 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !2416
  store i64 %Aso.0.lcssa, ptr %arrayidx472, align 8, !dbg !2417
  %arrayidx473 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !2418
  store i64 %Asu.0.lcssa, ptr %arrayidx473, align 8, !dbg !2419
  ret void, !dbg !2420
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_finalize(ptr noundef %state) local_unnamed_addr #0 !dbg !2421 {
entry:
    #dbg_value(ptr %state, !2422, !DIExpression(), !2423)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2424
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2424
  %conv = trunc i64 %0 to i32, !dbg !2424
  call fastcc void @keccak_finalize(ptr noundef %state, i32 noundef %conv, i32 noundef 168, i8 noundef zeroext 31) #3, !dbg !2425
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2426
  store i64 168, ptr %arrayidx1, align 8, !dbg !2427
  ret void, !dbg !2428
}

; Function Attrs: nounwind
define internal fastcc void @keccak_finalize(ptr noundef %s, i32 noundef %pos, i32 noundef range(i32 136, 169) %r, i8 noundef zeroext %p) unnamed_addr #0 !dbg !2429 {
entry:
    #dbg_value(ptr %s, !2432, !DIExpression(), !2433)
    #dbg_value(i32 %pos, !2434, !DIExpression(), !2433)
    #dbg_value(i32 %r, !2435, !DIExpression(), !2433)
    #dbg_value(i8 31, !2436, !DIExpression(), !2433)
  %rem = shl i32 %pos, 3, !dbg !2437
  %mul = and i32 %rem, 56, !dbg !2437
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2438
  %shl = shl nuw nsw i64 31, %sh_prom, !dbg !2438
  %div2 = lshr i32 %pos, 3, !dbg !2439
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div2, !dbg !2440
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2441
  %xor = xor i64 %0, %shl, !dbg !2441
  store i64 %xor, ptr %arrayidx, align 8, !dbg !2441
  %div13 = lshr i32 %r, 3, !dbg !2442
  %1 = getelementptr i64, ptr %s, i32 %div13, !dbg !2443
  %arrayidx2 = getelementptr i8, ptr %1, i32 -8, !dbg !2443
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !2444
  %xor3 = xor i64 %2, -9223372036854775808, !dbg !2444
  store i64 %xor3, ptr %arrayidx2, align 8, !dbg !2444
  ret void, !dbg !2445
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) local_unnamed_addr #0 !dbg !2446 {
entry:
    #dbg_value(ptr %out, !2449, !DIExpression(), !2450)
    #dbg_value(i32 %outlen, !2451, !DIExpression(), !2450)
    #dbg_value(ptr %state, !2452, !DIExpression(), !2450)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2453
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2453
  %conv = trunc i64 %0 to i32, !dbg !2453
  %call = call fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state, i32 noundef %conv, i32 noundef 168) #3, !dbg !2454
  %conv1 = zext i32 %call to i64, !dbg !2454
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2455
  store i64 %conv1, ptr %arrayidx2, align 8, !dbg !2456
  ret void, !dbg !2457
}

; Function Attrs: nounwind
define internal fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %s, i32 noundef %pos, i32 noundef range(i32 136, 169) %r) unnamed_addr #0 !dbg !2458 {
entry:
    #dbg_value(ptr %out, !2461, !DIExpression(), !2462)
    #dbg_value(i32 %outlen, !2463, !DIExpression(), !2462)
    #dbg_value(ptr %s, !2464, !DIExpression(), !2462)
    #dbg_value(i32 %pos, !2465, !DIExpression(), !2462)
    #dbg_value(i32 %r, !2466, !DIExpression(), !2462)
  br label %while.cond, !dbg !2467

while.cond:                                       ; preds = %for.end, %entry
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ %i.0.lcssa, %for.end ]
  %outlen.addr.0 = phi i32 [ %outlen, %entry ], [ %sub3, %for.end ]
  %out.addr.0 = phi ptr [ %out, %entry ], [ %out.addr.1.lcssa, %for.end ]
    #dbg_value(ptr %out.addr.0, !2461, !DIExpression(), !2462)
    #dbg_value(i32 %outlen.addr.0, !2463, !DIExpression(), !2462)
    #dbg_value(i32 %pos.addr.0, !2465, !DIExpression(), !2462)
  %tobool.not = icmp eq i32 %outlen.addr.0, 0, !dbg !2467
  br i1 %tobool.not, label %while.end, label %while.body, !dbg !2467

while.body:                                       ; preds = %while.cond
  %cmp = icmp eq i32 %pos.addr.0, %r, !dbg !2468
  br i1 %cmp, label %if.then, label %if.end, !dbg !2468

if.then:                                          ; preds = %while.body
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2471
    #dbg_value(i32 0, !2465, !DIExpression(), !2462)
  br label %if.end, !dbg !2473

if.end:                                           ; preds = %if.then, %while.body
  %pos.addr.1 = phi i32 [ 0, %if.then ], [ %pos.addr.0, %while.body ]
    #dbg_value(i32 %pos.addr.1, !2465, !DIExpression(), !2462)
    #dbg_value(i32 %pos.addr.1, !2474, !DIExpression(), !2462)
  br label %for.cond, !dbg !2475

for.cond:                                         ; preds = %for.body, %if.end
  %i.0 = phi i32 [ %pos.addr.1, %if.end ], [ %inc, %for.body ], !dbg !2477
  %out.addr.1 = phi ptr [ %out.addr.0, %if.end ], [ %incdec.ptr, %for.body ]
    #dbg_value(ptr %out.addr.1, !2461, !DIExpression(), !2462)
    #dbg_value(i32 %i.0, !2474, !DIExpression(), !2462)
  %cmp1 = icmp ult i32 %i.0, %r, !dbg !2478
  %add = add i32 %pos.addr.1, %outlen.addr.0, !dbg !2480
  %cmp2 = icmp ult i32 %i.0, %add, !dbg !2480
  %0 = and i1 %cmp1, %cmp2, !dbg !2480
  br i1 %0, label %for.body, label %for.end, !dbg !2481

for.body:                                         ; preds = %for.cond
  %div1 = lshr i32 %i.0, 3, !dbg !2482
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div1, !dbg !2483
  %1 = load i64, ptr %arrayidx, align 8, !dbg !2483
  %rem = shl nuw nsw i32 %i.0, 3, !dbg !2484
  %mul = and i32 %rem, 56, !dbg !2484
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2485
  %shr = lshr i64 %1, %sh_prom, !dbg !2485
  %conv = trunc i64 %shr to i8, !dbg !2483
    #dbg_value(ptr %out.addr.1, !2461, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2462)
  store i8 %conv, ptr %out.addr.1, align 1, !dbg !2486
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %out.addr.1, i32 1, !dbg !2487
    #dbg_value(ptr %incdec.ptr, !2461, !DIExpression(), !2462)
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2488
    #dbg_value(i32 %inc, !2474, !DIExpression(), !2462)
  br label %for.cond, !dbg !2489, !llvm.loop !2490

for.end:                                          ; preds = %for.cond
  %i.0.lcssa = phi i32 [ %i.0, %for.cond ], !dbg !2477
  %out.addr.1.lcssa = phi ptr [ %out.addr.1, %for.cond ]
  %sub.neg = sub i32 %pos.addr.1, %i.0.lcssa, !dbg !2492
  %sub3 = add i32 %sub.neg, %outlen.addr.0, !dbg !2493
    #dbg_value(i32 %sub3, !2463, !DIExpression(), !2462)
    #dbg_value(i32 %i.0.lcssa, !2465, !DIExpression(), !2462)
  br label %while.cond, !dbg !2467, !llvm.loop !2494

while.end:                                        ; preds = %while.cond
  %pos.addr.0.lcssa = phi i32 [ %pos.addr.0, %while.cond ]
  ret i32 %pos.addr.0.lcssa, !dbg !2496
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2497 {
entry:
    #dbg_value(ptr %state, !2498, !DIExpression(), !2499)
    #dbg_value(ptr %in, !2500, !DIExpression(), !2499)
    #dbg_value(i32 %inlen, !2501, !DIExpression(), !2499)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 168, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #3, !dbg !2502
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2503
  store i64 168, ptr %arrayidx, align 8, !dbg !2504
  ret void, !dbg !2505
}

; Function Attrs: nounwind
define internal fastcc void @keccak_absorb_once(ptr noundef %s, i32 noundef range(i32 72, 169) %r, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext range(i8 6, 32) %p) unnamed_addr #0 !dbg !2506 {
entry:
    #dbg_value(ptr %s, !2509, !DIExpression(), !2510)
    #dbg_value(i32 %r, !2511, !DIExpression(), !2510)
    #dbg_value(ptr %in, !2512, !DIExpression(), !2510)
    #dbg_value(i32 %inlen, !2513, !DIExpression(), !2510)
    #dbg_value(i8 %p, !2514, !DIExpression(), !2510)
    #dbg_value(i32 0, !2515, !DIExpression(), !2510)
  br label %for.cond, !dbg !2516

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2518
    #dbg_value(i32 %i.0, !2515, !DIExpression(), !2510)
  %exitcond = icmp ne i32 %i.0, 25, !dbg !2519
  br i1 %exitcond, label %for.body, label %while.cond.preheader, !dbg !2521

while.cond.preheader:                             ; preds = %for.cond
  %0 = lshr i32 %r, 3, !dbg !2522
  br label %while.cond, !dbg !2522

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !2523
  store i64 0, ptr %arrayidx, align 8, !dbg !2524
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2525
    #dbg_value(i32 %inc, !2515, !DIExpression(), !2510)
  br label %for.cond, !dbg !2526, !llvm.loop !2527

while.cond:                                       ; preds = %while.cond.preheader, %for.end8
  %in.addr.0 = phi ptr [ %add.ptr9, %for.end8 ], [ %in, %while.cond.preheader ]
  %inlen.addr.0 = phi i32 [ %sub, %for.end8 ], [ %inlen, %while.cond.preheader ]
    #dbg_value(i32 %inlen.addr.0, !2513, !DIExpression(), !2510)
    #dbg_value(ptr %in.addr.0, !2512, !DIExpression(), !2510)
  %cmp1.not = icmp ult i32 %inlen.addr.0, %r, !dbg !2529
  br i1 %cmp1.not, label %for.cond10.preheader, label %for.cond2.preheader, !dbg !2522

for.cond2.preheader:                              ; preds = %while.cond
  br label %for.cond2, !dbg !2530

for.cond10.preheader:                             ; preds = %while.cond
  %inlen.addr.0.lcssa6 = phi i32 [ %inlen.addr.0, %while.cond ]
  %in.addr.0.lcssa = phi ptr [ %in.addr.0, %while.cond ]
  br label %for.cond10, !dbg !2533

for.cond2:                                        ; preds = %for.cond2.preheader, %for.body4
  %i.1 = phi i32 [ %inc7, %for.body4 ], [ 0, %for.cond2.preheader ], !dbg !2535
    #dbg_value(i32 %i.1, !2515, !DIExpression(), !2510)
  %exitcond5 = icmp ne i32 %i.1, %0, !dbg !2536
  br i1 %exitcond5, label %for.body4, label %for.end8, !dbg !2530

for.body4:                                        ; preds = %for.cond2
  %mul = shl nuw nsw i32 %i.1, 3, !dbg !2538
  %add.ptr = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %mul, !dbg !2539
  %call = call fastcc i64 @load64(ptr noundef %add.ptr) #3, !dbg !2540
  %arrayidx5 = getelementptr inbounds nuw i64, ptr %s, i32 %i.1, !dbg !2541
  %1 = load i64, ptr %arrayidx5, align 8, !dbg !2542
  %xor = xor i64 %1, %call, !dbg !2542
  store i64 %xor, ptr %arrayidx5, align 8, !dbg !2542
  %inc7 = add nuw nsw i32 %i.1, 1, !dbg !2543
    #dbg_value(i32 %inc7, !2515, !DIExpression(), !2510)
  br label %for.cond2, !dbg !2544, !llvm.loop !2545

for.end8:                                         ; preds = %for.cond2
  %add.ptr9 = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %r, !dbg !2547
    #dbg_value(ptr %add.ptr9, !2512, !DIExpression(), !2510)
  %sub = sub i32 %inlen.addr.0, %r, !dbg !2548
    #dbg_value(i32 %sub, !2513, !DIExpression(), !2510)
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2549
  br label %while.cond, !dbg !2522, !llvm.loop !2550

for.cond10:                                       ; preds = %for.cond10.preheader, %for.body12
  %i.2 = phi i32 [ %inc19, %for.body12 ], [ 0, %for.cond10.preheader ], !dbg !2552
    #dbg_value(i32 %i.2, !2515, !DIExpression(), !2510)
  %exitcond7 = icmp ne i32 %i.2, %inlen.addr.0.lcssa6, !dbg !2553
  br i1 %exitcond7, label %for.body12, label %for.end20, !dbg !2533

for.body12:                                       ; preds = %for.cond10
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %in.addr.0.lcssa, i32 %i.2, !dbg !2555
  %2 = load i8, ptr %arrayidx13, align 1, !dbg !2555
  %conv = zext i8 %2 to i64, !dbg !2556
  %rem = shl i32 %i.2, 3, !dbg !2557
  %mul14 = and i32 %rem, 56, !dbg !2557
  %sh_prom = zext nneg i32 %mul14 to i64, !dbg !2558
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !2558
  %div153 = lshr i32 %i.2, 3, !dbg !2559
  %arrayidx16 = getelementptr inbounds nuw i64, ptr %s, i32 %div153, !dbg !2560
  %3 = load i64, ptr %arrayidx16, align 8, !dbg !2561
  %xor17 = xor i64 %3, %shl, !dbg !2561
  store i64 %xor17, ptr %arrayidx16, align 8, !dbg !2561
  %inc19 = add i32 %i.2, 1, !dbg !2562
    #dbg_value(i32 %inc19, !2515, !DIExpression(), !2510)
  br label %for.cond10, !dbg !2563, !llvm.loop !2564

for.end20:                                        ; preds = %for.cond10
  %i.2.lcssa = phi i32 [ %i.2, %for.cond10 ], !dbg !2552
  %conv21 = zext nneg i8 %p to i64, !dbg !2566
  %rem22 = shl i32 %i.2.lcssa, 3, !dbg !2567
  %mul23 = and i32 %rem22, 56, !dbg !2567
  %sh_prom24 = zext nneg i32 %mul23 to i64, !dbg !2568
  %shl25 = shl nuw nsw i64 %conv21, %sh_prom24, !dbg !2568
  %div261 = lshr i32 %i.2.lcssa, 3, !dbg !2569
  %arrayidx27 = getelementptr inbounds nuw i64, ptr %s, i32 %div261, !dbg !2570
  %4 = load i64, ptr %arrayidx27, align 8, !dbg !2571
  %xor28 = xor i64 %4, %shl25, !dbg !2571
  store i64 %xor28, ptr %arrayidx27, align 8, !dbg !2571
  %sub29 = add nsw i32 %r, -1, !dbg !2572
  %div302 = lshr i32 %sub29, 3, !dbg !2573
  %arrayidx31 = getelementptr inbounds nuw i64, ptr %s, i32 %div302, !dbg !2574
  %5 = load i64, ptr %arrayidx31, align 8, !dbg !2575
  %xor32 = xor i64 %5, -9223372036854775808, !dbg !2575
  store i64 %xor32, ptr %arrayidx31, align 8, !dbg !2575
  ret void, !dbg !2576
}

; Function Attrs: nounwind
define internal fastcc i64 @load64(ptr noundef %x) unnamed_addr #0 !dbg !2577 {
entry:
    #dbg_value(ptr %x, !2580, !DIExpression(), !2581)
    #dbg_value(i64 0, !2582, !DIExpression(), !2581)
    #dbg_value(i32 0, !2583, !DIExpression(), !2581)
  br label %for.cond, !dbg !2584

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !2586
  %r.0 = phi i64 [ 0, %entry ], [ %or, %for.inc ], !dbg !2581
    #dbg_value(i64 %r.0, !2582, !DIExpression(), !2581)
    #dbg_value(i32 %i.0, !2583, !DIExpression(), !2581)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !2587
  br i1 %exitcond, label %for.inc, label %for.end, !dbg !2589

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i64 poison, i8 poison, i32 poison), !2582, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2581)
  %arrayidx = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2590
  %0 = load i8, ptr %arrayidx, align 1, !dbg !2590
    #dbg_value(!DIArgList(i64 %r.0, i8 %0, i32 %i.0), !2582, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2581)
  %conv = zext i8 %0 to i64, !dbg !2591
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i32 %i.0), !2582, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2581)
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2592
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i32 %mul), !2582, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2581)
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2593
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i64 %sh_prom), !2582, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2581)
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !2593
    #dbg_value(!DIArgList(i64 %r.0, i64 %shl), !2582, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value), !2581)
  %or = or i64 %r.0, %shl, !dbg !2594
    #dbg_value(i64 %or, !2582, !DIExpression(), !2581)
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2595
    #dbg_value(i32 %inc, !2583, !DIExpression(), !2581)
  br label %for.cond, !dbg !2596, !llvm.loop !2597

for.end:                                          ; preds = %for.cond
  %r.0.lcssa = phi i64 [ %r.0, %for.cond ], !dbg !2581
  ret i64 %r.0.lcssa, !dbg !2599
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #0 !dbg !2600 {
entry:
    #dbg_value(ptr %out, !2601, !DIExpression(), !2602)
    #dbg_value(i32 %nblocks, !2603, !DIExpression(), !2602)
    #dbg_value(ptr %state, !2604, !DIExpression(), !2602)
  call fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state, i32 noundef 168) #3, !dbg !2605
  ret void, !dbg !2606
}

; Function Attrs: nounwind
define internal fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %s, i32 noundef range(i32 136, 169) %r) unnamed_addr #0 !dbg !2607 {
entry:
    #dbg_value(ptr %out, !2610, !DIExpression(), !2611)
    #dbg_value(i32 %nblocks, !2612, !DIExpression(), !2611)
    #dbg_value(ptr %s, !2613, !DIExpression(), !2611)
    #dbg_value(i32 %r, !2614, !DIExpression(), !2611)
  %0 = lshr i32 %r, 3, !dbg !2615
  br label %while.cond, !dbg !2615

while.cond:                                       ; preds = %for.end, %entry
  %nblocks.addr.0 = phi i32 [ %nblocks, %entry ], [ %sub, %for.end ]
  %out.addr.0 = phi ptr [ %out, %entry ], [ %add.ptr1, %for.end ]
    #dbg_value(ptr %out.addr.0, !2610, !DIExpression(), !2611)
    #dbg_value(i32 %nblocks.addr.0, !2612, !DIExpression(), !2611)
  %tobool.not = icmp eq i32 %nblocks.addr.0, 0, !dbg !2615
  br i1 %tobool.not, label %while.end, label %while.body, !dbg !2615

while.body:                                       ; preds = %while.cond
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2616
    #dbg_value(i32 0, !2618, !DIExpression(), !2611)
  br label %for.cond, !dbg !2619

for.cond:                                         ; preds = %for.body, %while.body
  %i.0 = phi i32 [ 0, %while.body ], [ %inc, %for.body ], !dbg !2621
    #dbg_value(i32 %i.0, !2618, !DIExpression(), !2611)
  %exitcond = icmp ne i32 %i.0, %0, !dbg !2622
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2624

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2625
  %add.ptr = getelementptr inbounds nuw i8, ptr %out.addr.0, i32 %mul, !dbg !2626
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !2627
  %1 = load i64, ptr %arrayidx, align 8, !dbg !2627
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %1) #3, !dbg !2628
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2629
    #dbg_value(i32 %inc, !2618, !DIExpression(), !2611)
  br label %for.cond, !dbg !2630, !llvm.loop !2631

for.end:                                          ; preds = %for.cond
  %add.ptr1 = getelementptr inbounds nuw i8, ptr %out.addr.0, i32 %r, !dbg !2633
    #dbg_value(ptr %add.ptr1, !2610, !DIExpression(), !2611)
  %sub = add i32 %nblocks.addr.0, -1, !dbg !2634
    #dbg_value(i32 %sub, !2612, !DIExpression(), !2611)
  br label %while.cond, !dbg !2615, !llvm.loop !2635

while.end:                                        ; preds = %while.cond
  ret void, !dbg !2637
}

; Function Attrs: nounwind
define internal fastcc void @store64(ptr noundef %x, i64 noundef %u) unnamed_addr #0 !dbg !2638 {
entry:
    #dbg_value(ptr %x, !2641, !DIExpression(), !2642)
    #dbg_value(i64 %u, !2643, !DIExpression(), !2642)
    #dbg_value(i32 0, !2644, !DIExpression(), !2642)
  br label %for.cond, !dbg !2645

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2647
    #dbg_value(i32 %i.0, !2644, !DIExpression(), !2642)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !2648
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2650

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2651
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2652
  %shr = lshr i64 %u, %sh_prom, !dbg !2652
  %conv = trunc i64 %shr to i8, !dbg !2653
  %arrayidx = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2654
  store i8 %conv, ptr %arrayidx, align 1, !dbg !2655
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2656
    #dbg_value(i32 %inc, !2644, !DIExpression(), !2642)
  br label %for.cond, !dbg !2657, !llvm.loop !2658

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2660
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef %state) local_unnamed_addr #0 !dbg !2661 {
entry:
    #dbg_value(ptr %state, !2662, !DIExpression(), !2663)
  call fastcc void @keccak_init(ptr noundef %state) #3, !dbg !2664
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2665
  store i64 0, ptr %arrayidx, align 8, !dbg !2666
  ret void, !dbg !2667
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2668 {
entry:
    #dbg_value(ptr %state, !2669, !DIExpression(), !2670)
    #dbg_value(ptr %in, !2671, !DIExpression(), !2670)
    #dbg_value(i32 %inlen, !2672, !DIExpression(), !2670)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2673
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2673
  %conv = trunc i64 %0 to i32, !dbg !2673
  %call = call fastcc i32 @keccak_absorb(ptr noundef %state, i32 noundef %conv, i32 noundef 136, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2674
  %conv1 = zext i32 %call to i64, !dbg !2674
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2675
  store i64 %conv1, ptr %arrayidx2, align 8, !dbg !2676
  ret void, !dbg !2677
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef %state) local_unnamed_addr #0 !dbg !2678 {
entry:
    #dbg_value(ptr %state, !2679, !DIExpression(), !2680)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2681
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2681
  %conv = trunc i64 %0 to i32, !dbg !2681
  call fastcc void @keccak_finalize(ptr noundef %state, i32 noundef %conv, i32 noundef 136, i8 noundef zeroext 31) #3, !dbg !2682
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2683
  store i64 136, ptr %arrayidx1, align 8, !dbg !2684
  ret void, !dbg !2685
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) local_unnamed_addr #0 !dbg !2686 {
entry:
    #dbg_value(ptr %out, !2687, !DIExpression(), !2688)
    #dbg_value(i32 %outlen, !2689, !DIExpression(), !2688)
    #dbg_value(ptr %state, !2690, !DIExpression(), !2688)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2691
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2691
  %conv = trunc i64 %0 to i32, !dbg !2691
  %call = call fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state, i32 noundef %conv, i32 noundef 136) #3, !dbg !2692
  %conv1 = zext i32 %call to i64, !dbg !2692
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2693
  store i64 %conv1, ptr %arrayidx2, align 8, !dbg !2694
  ret void, !dbg !2695
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2696 {
entry:
    #dbg_value(ptr %state, !2697, !DIExpression(), !2698)
    #dbg_value(ptr %in, !2699, !DIExpression(), !2698)
    #dbg_value(i32 %inlen, !2700, !DIExpression(), !2698)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #3, !dbg !2701
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2702
  store i64 136, ptr %arrayidx, align 8, !dbg !2703
  ret void, !dbg !2704
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #0 !dbg !2705 {
entry:
    #dbg_value(ptr %out, !2706, !DIExpression(), !2707)
    #dbg_value(i32 %nblocks, !2708, !DIExpression(), !2707)
    #dbg_value(ptr %state, !2709, !DIExpression(), !2707)
  call fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state, i32 noundef 136) #3, !dbg !2710
  ret void, !dbg !2711
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2712 {
entry:
  %state = alloca [26 x i64], align 8
    #dbg_value(ptr %out, !2715, !DIExpression(), !2716)
    #dbg_value(i32 %outlen, !2717, !DIExpression(), !2716)
    #dbg_value(ptr %in, !2718, !DIExpression(), !2716)
    #dbg_value(i32 %inlen, !2719, !DIExpression(), !2716)
    #dbg_declare(ptr %state, !2720, !DIExpression(), !2721)
  call void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef nonnull %state, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2722
  %div = udiv i32 %outlen, 168, !dbg !2723
    #dbg_value(i32 %div, !2724, !DIExpression(), !2716)
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %div, ptr noundef nonnull %state) #3, !dbg !2725
  %mul.neg = mul i32 %div, -168, !dbg !2726
  %sub = add i32 %mul.neg, %outlen, !dbg !2727
    #dbg_value(i32 %sub, !2717, !DIExpression(), !2716)
  %mul1 = mul nuw i32 %div, 168, !dbg !2728
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !2729
    #dbg_value(ptr %add.ptr, !2715, !DIExpression(), !2716)
  call void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef nonnull %state) #3, !dbg !2730
  ret void, !dbg !2731
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2732 {
entry:
  %state = alloca [26 x i64], align 8
    #dbg_value(ptr %out, !2733, !DIExpression(), !2734)
    #dbg_value(i32 %outlen, !2735, !DIExpression(), !2734)
    #dbg_value(ptr %in, !2736, !DIExpression(), !2734)
    #dbg_value(i32 %inlen, !2737, !DIExpression(), !2734)
    #dbg_declare(ptr %state, !2738, !DIExpression(), !2739)
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef nonnull %state, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2740
  %div = udiv i32 %outlen, 136, !dbg !2741
    #dbg_value(i32 %div, !2742, !DIExpression(), !2734)
  call void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %div, ptr noundef nonnull %state) #3, !dbg !2743
  %mul.neg = mul i32 %div, -136, !dbg !2744
  %sub = add i32 %mul.neg, %outlen, !dbg !2745
    #dbg_value(i32 %sub, !2735, !DIExpression(), !2734)
  %mul1 = mul nuw i32 %div, 136, !dbg !2746
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !2747
    #dbg_value(ptr %add.ptr, !2733, !DIExpression(), !2734)
  call void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef nonnull %state) #3, !dbg !2748
  ret void, !dbg !2749
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2750 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !2753, !DIExpression(), !2754)
    #dbg_value(ptr %in, !2755, !DIExpression(), !2754)
    #dbg_value(i32 %inlen, !2756, !DIExpression(), !2754)
    #dbg_declare(ptr %s, !2757, !DIExpression(), !2761)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %s, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #3, !dbg !2762
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #3, !dbg !2763
    #dbg_value(i32 0, !2764, !DIExpression(), !2754)
  br label %for.cond, !dbg !2765

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2767
    #dbg_value(i32 %i.0, !2764, !DIExpression(), !2754)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !2768
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2770

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2771
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !2772
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !2773
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2773
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %0) #3, !dbg !2774
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2775
    #dbg_value(i32 %inc, !2764, !DIExpression(), !2754)
  br label %for.cond, !dbg !2776, !llvm.loop !2777

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2779
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2780 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !2781, !DIExpression(), !2782)
    #dbg_value(ptr %in, !2783, !DIExpression(), !2782)
    #dbg_value(i32 %inlen, !2784, !DIExpression(), !2782)
    #dbg_declare(ptr %s, !2785, !DIExpression(), !2786)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %s, i32 noundef 72, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #3, !dbg !2787
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #3, !dbg !2788
    #dbg_value(i32 0, !2789, !DIExpression(), !2782)
  br label %for.cond, !dbg !2790

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2792
    #dbg_value(i32 %i.0, !2789, !DIExpression(), !2782)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !2793
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2795

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2796
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !2797
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !2798
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2798
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %0) #3, !dbg !2799
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2800
    #dbg_value(i32 %inc, !2789, !DIExpression(), !2782)
  br label %for.cond, !dbg !2801, !llvm.loop !2802

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2804
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_kyber_shake128_absorb(ptr noundef %state, ptr noundef %seed, i8 noundef zeroext %x, i8 noundef zeroext %y) local_unnamed_addr #0 !dbg !2805 {
entry:
  %extseed = alloca [34 x i8], align 1
    #dbg_value(ptr %state, !2809, !DIExpression(), !2810)
    #dbg_value(ptr %seed, !2811, !DIExpression(), !2810)
    #dbg_value(i8 %x, !2812, !DIExpression(), !2810)
    #dbg_value(i8 %y, !2813, !DIExpression(), !2810)
    #dbg_declare(ptr %extseed, !2814, !DIExpression(), !2818)
  %call = call ptr @memcpy(ptr noundef nonnull %extseed, ptr noundef %seed, i32 noundef 32) #4, !dbg !2819
  %arrayidx = getelementptr inbounds nuw i8, ptr %extseed, i32 32, !dbg !2820
  store i8 %x, ptr %arrayidx, align 1, !dbg !2821
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %extseed, i32 33, !dbg !2822
  store i8 %y, ptr %arrayidx1, align 1, !dbg !2823
  call void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef nonnull %extseed, i32 noundef 34) #3, !dbg !2824
  ret void, !dbg !2825
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_kyber_shake256_prf(ptr noundef %out, i32 noundef %outlen, ptr noundef %key, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !2826 {
entry:
  %extkey = alloca [33 x i8], align 1
    #dbg_value(ptr %out, !2829, !DIExpression(), !2830)
    #dbg_value(i32 %outlen, !2831, !DIExpression(), !2830)
    #dbg_value(ptr %key, !2832, !DIExpression(), !2830)
    #dbg_value(i8 %nonce, !2833, !DIExpression(), !2830)
    #dbg_declare(ptr %extkey, !2834, !DIExpression(), !2838)
  %call = call ptr @memcpy(ptr noundef nonnull %extkey, ptr noundef %key, i32 noundef 32) #4, !dbg !2839
  %arrayidx = getelementptr inbounds nuw i8, ptr %extkey, i32 32, !dbg !2840
  store i8 %nonce, ptr %arrayidx, align 1, !dbg !2841
  call void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef nonnull %extkey, i32 noundef 33) #3, !dbg !2842
  ret void, !dbg !2843
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_kyber_shake256_rkprf(ptr noundef %out, ptr noundef %key, ptr noundef %input) local_unnamed_addr #0 !dbg !2844 {
entry:
  %s = alloca [26 x i64], align 8
    #dbg_value(ptr %out, !2845, !DIExpression(), !2846)
    #dbg_value(ptr %key, !2847, !DIExpression(), !2846)
    #dbg_value(ptr %input, !2848, !DIExpression(), !2846)
    #dbg_declare(ptr %s, !2849, !DIExpression(), !2850)
  call void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef nonnull %s) #3, !dbg !2851
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef nonnull %s, ptr noundef %key, i32 noundef 32) #3, !dbg !2852
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef nonnull %s, ptr noundef %input, i32 noundef 768) #3, !dbg !2853
  call void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef nonnull %s) #3, !dbg !2854
  call void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef 32, ptr noundef nonnull %s) #3, !dbg !2855
  ret void, !dbg !2856
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

!llvm.dbg.cu = !{!54, !15, !57, !58, !63, !67, !28, !69, !71, !73, !43, !74}
!llvm.ident = !{!75, !75, !75, !75, !75, !75, !75, !75, !75, !75, !75, !75}
!llvm.module.flags = !{!76, !77, !78, !79}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "fd", scope: !2, file: !3, line: 75, type: !25, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "randombytes", scope: !3, file: !3, line: 74, type: !4, scopeLine: 74, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !24)
!3 = !DIFile(filename: "../../../ref/randombytes.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!4 = !DISubroutineType(types: !5)
!5 = !{null, !6, !12}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 32)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !8, line: 24, baseType: !9)
!8 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/sys/_stdint.h", directory: "")
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !10, line: 43, baseType: !11)
!10 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/machine/_default_types.h", directory: "")
!11 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !13, line: 214, baseType: !14)
!13 = !DIFile(filename: "/usr/lib/gcc/arm-none-eabi/13.2.1/include/stddef.h", directory: "")
!14 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!15 = distinct !DICompileUnit(language: DW_LANG_C11, file: !16, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !17, splitDebugInlining: false, nameTableKind: None)
!16 = !DIFile(filename: "../../../ref/<stdin>", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!17 = !{!0, !18}
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(scope: null, file: !3, line: 79, type: !20, isLocal: true, isDefinition: true)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 104, elements: !22)
!21 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!22 = !{!23}
!23 = !DISubrange(count: 13)
!24 = !{}
!25 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!26 = !DIGlobalVariableExpression(var: !27, expr: !DIExpression())
!27 = distinct !DIGlobalVariable(name: "pqcrystals_kyber512_ref_zetas", scope: !28, file: !33, line: 39, type: !34, isLocal: false, isDefinition: true)
!28 = distinct !DICompileUnit(language: DW_LANG_C11, file: !16, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !29, globals: !32, splitDebugInlining: false, nameTableKind: None)
!29 = !{!30}
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !8, line: 44, baseType: !31)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !10, line: 77, baseType: !25)
!32 = !{!26}
!33 = !DIFile(filename: "../../../ref/ntt.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !35, size: 2048, elements: !39)
!35 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !36)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !8, line: 32, baseType: !37)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !10, line: 55, baseType: !38)
!38 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!39 = !{!40}
!40 = !DISubrange(count: 128)
!41 = !DIGlobalVariableExpression(var: !42, expr: !DIExpression())
!42 = distinct !DIGlobalVariable(name: "KeccakF_RoundConstants", scope: !43, file: !49, line: 49, type: !50, isLocal: true, isDefinition: true)
!43 = distinct !DICompileUnit(language: DW_LANG_C11, file: !16, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !44, globals: !48, splitDebugInlining: false, nameTableKind: None)
!44 = !{!45}
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !8, line: 60, baseType: !46)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !10, line: 105, baseType: !47)
!47 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!48 = !{!41}
!49 = !DIFile(filename: "../../../ref/fips202.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 1536, elements: !52)
!51 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !45)
!52 = !{!53}
!53 = !DISubrange(count: 24)
!54 = distinct !DICompileUnit(language: DW_LANG_C11, file: !55, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !56, splitDebugInlining: false, nameTableKind: None)
!55 = !DIFile(filename: "../../../ref/test/<stdin>", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!56 = !{!6}
!57 = distinct !DICompileUnit(language: DW_LANG_C11, file: !16, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!58 = distinct !DICompileUnit(language: DW_LANG_C11, file: !16, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !59, splitDebugInlining: false, nameTableKind: None)
!59 = !{!60}
!60 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !8, line: 36, baseType: !61)
!61 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !10, line: 57, baseType: !62)
!62 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!63 = distinct !DICompileUnit(language: DW_LANG_C11, file: !16, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !64, splitDebugInlining: false, nameTableKind: None)
!64 = !{!36, !60, !65}
!65 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !8, line: 48, baseType: !66)
!66 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !10, line: 79, baseType: !14)
!67 = distinct !DICompileUnit(language: DW_LANG_C11, file: !16, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !68, splitDebugInlining: false, nameTableKind: None)
!68 = !{!60, !36, !30}
!69 = distinct !DICompileUnit(language: DW_LANG_C11, file: !16, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !70, splitDebugInlining: false, nameTableKind: None)
!70 = !{!65}
!71 = distinct !DICompileUnit(language: DW_LANG_C11, file: !16, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !72, splitDebugInlining: false, nameTableKind: None)
!72 = !{!36, !30}
!73 = distinct !DICompileUnit(language: DW_LANG_C11, file: !16, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !44, splitDebugInlining: false, nameTableKind: None)
!74 = distinct !DICompileUnit(language: DW_LANG_C11, file: !16, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!75 = !{!"Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)"}
!76 = !{i32 2, !"Debug Info Version", i32 3}
!77 = !{i32 1, !"wchar_size", i32 4}
!78 = !{i32 1, !"min_enum_size", i32 4}
!79 = !{i32 1, !"Code Model", i32 1}
!80 = distinct !DISubprogram(name: "main", scope: !81, file: !81, line: 97, type: !82, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !54, retainedNodes: !24)
!81 = !DIFile(filename: "../../../ref/test/test_kyber.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!82 = !DISubroutineType(types: !83)
!83 = !{!25}
!84 = !DILocalVariable(name: "i", scope: !80, file: !81, line: 99, type: !14)
!85 = !DILocation(line: 0, scope: !80)
!86 = !DILocation(line: 102, column: 7, scope: !87)
!87 = distinct !DILexicalBlock(scope: !80, file: !81, line: 102, column: 3)
!88 = !DILocation(line: 102, scope: !87)
!89 = !DILocation(line: 102, column: 12, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !81, line: 102, column: 3)
!91 = !DILocation(line: 102, column: 3, scope: !87)
!92 = !DILocation(line: 103, column: 10, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !81, line: 102, column: 25)
!94 = !DILocalVariable(name: "r", scope: !80, file: !81, line: 100, type: !25)
!95 = !DILocation(line: 104, column: 10, scope: !93)
!96 = !DILocation(line: 104, column: 7, scope: !93)
!97 = !DILocation(line: 105, column: 10, scope: !93)
!98 = !DILocation(line: 105, column: 7, scope: !93)
!99 = !DILocation(line: 106, column: 8, scope: !100)
!100 = distinct !DILexicalBlock(scope: !93, file: !81, line: 106, column: 8)
!101 = !DILocation(line: 102, column: 21, scope: !90)
!102 = !DILocation(line: 102, column: 3, scope: !90)
!103 = distinct !{!103, !91, !104, !105}
!104 = !DILocation(line: 108, column: 3, scope: !87)
!105 = !{!"llvm.loop.mustprogress"}
!106 = !DILocation(line: 115, column: 1, scope: !80)
!107 = distinct !DISubprogram(name: "test_keys", scope: !81, file: !81, line: 9, type: !82, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !54, retainedNodes: !24)
!108 = !DILocalVariable(name: "pk", scope: !107, file: !81, line: 11, type: !109)
!109 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 6400, elements: !110)
!110 = !{!111}
!111 = !DISubrange(count: 800)
!112 = !DILocation(line: 11, column: 11, scope: !107)
!113 = !DILocalVariable(name: "sk", scope: !107, file: !81, line: 12, type: !114)
!114 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 13056, elements: !115)
!115 = !{!116}
!116 = !DISubrange(count: 1632)
!117 = !DILocation(line: 12, column: 11, scope: !107)
!118 = !DILocalVariable(name: "ct", scope: !107, file: !81, line: 13, type: !119)
!119 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 6144, elements: !120)
!120 = !{!121}
!121 = !DISubrange(count: 768)
!122 = !DILocation(line: 13, column: 11, scope: !107)
!123 = !DILocalVariable(name: "key_a", scope: !107, file: !81, line: 14, type: !124)
!124 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 256, elements: !125)
!125 = !{!126}
!126 = !DISubrange(count: 32)
!127 = !DILocation(line: 14, column: 11, scope: !107)
!128 = !DILocalVariable(name: "key_b", scope: !107, file: !81, line: 15, type: !124)
!129 = !DILocation(line: 15, column: 11, scope: !107)
!130 = !DILocation(line: 18, column: 3, scope: !107)
!131 = !DILocation(line: 21, column: 3, scope: !107)
!132 = !DILocation(line: 24, column: 3, scope: !107)
!133 = !DILocation(line: 26, column: 6, scope: !134)
!134 = distinct !DILexicalBlock(scope: !107, file: !81, line: 26, column: 6)
!135 = !DILocation(line: 0, scope: !107)
!136 = !DILocation(line: 32, column: 1, scope: !107)
!137 = distinct !DISubprogram(name: "test_invalid_sk_a", scope: !81, file: !81, line: 34, type: !82, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !54, retainedNodes: !24)
!138 = !DILocalVariable(name: "pk", scope: !137, file: !81, line: 36, type: !109)
!139 = !DILocation(line: 36, column: 11, scope: !137)
!140 = !DILocalVariable(name: "sk", scope: !137, file: !81, line: 37, type: !114)
!141 = !DILocation(line: 37, column: 11, scope: !137)
!142 = !DILocalVariable(name: "ct", scope: !137, file: !81, line: 38, type: !119)
!143 = !DILocation(line: 38, column: 11, scope: !137)
!144 = !DILocalVariable(name: "key_a", scope: !137, file: !81, line: 39, type: !124)
!145 = !DILocation(line: 39, column: 11, scope: !137)
!146 = !DILocalVariable(name: "key_b", scope: !137, file: !81, line: 40, type: !124)
!147 = !DILocation(line: 40, column: 11, scope: !137)
!148 = !DILocation(line: 43, column: 3, scope: !137)
!149 = !DILocation(line: 46, column: 3, scope: !137)
!150 = !DILocation(line: 49, column: 3, scope: !137)
!151 = !DILocation(line: 52, column: 3, scope: !137)
!152 = !DILocation(line: 54, column: 7, scope: !153)
!153 = distinct !DILexicalBlock(scope: !137, file: !81, line: 54, column: 6)
!154 = !DILocation(line: 0, scope: !137)
!155 = !DILocation(line: 60, column: 1, scope: !137)
!156 = distinct !DISubprogram(name: "test_invalid_ciphertext", scope: !81, file: !81, line: 62, type: !82, scopeLine: 63, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !54, retainedNodes: !24)
!157 = !DILocalVariable(name: "pk", scope: !156, file: !81, line: 64, type: !109)
!158 = !DILocation(line: 64, column: 11, scope: !156)
!159 = !DILocalVariable(name: "sk", scope: !156, file: !81, line: 65, type: !114)
!160 = !DILocation(line: 65, column: 11, scope: !156)
!161 = !DILocalVariable(name: "ct", scope: !156, file: !81, line: 66, type: !119)
!162 = !DILocation(line: 66, column: 11, scope: !156)
!163 = !DILocalVariable(name: "key_a", scope: !156, file: !81, line: 67, type: !124)
!164 = !DILocation(line: 67, column: 11, scope: !156)
!165 = !DILocalVariable(name: "key_b", scope: !156, file: !81, line: 68, type: !124)
!166 = !DILocation(line: 68, column: 11, scope: !156)
!167 = !DILocation(line: 72, column: 3, scope: !156)
!168 = !DILocalVariable(name: "b", scope: !156, file: !81, line: 69, type: !7)
!169 = !DILocation(line: 0, scope: !156)
!170 = !DILocation(line: 73, column: 5, scope: !171)
!171 = distinct !DILexicalBlock(scope: !156, file: !81, line: 72, column: 6)
!172 = !DILocation(line: 74, column: 12, scope: !156)
!173 = !DILocation(line: 74, column: 11, scope: !156)
!174 = !DILocation(line: 74, column: 3, scope: !171)
!175 = distinct !{!175, !167, !176, !105}
!176 = !DILocation(line: 74, column: 13, scope: !156)
!177 = !DILocalVariable(name: "pos", scope: !156, file: !81, line: 70, type: !12)
!178 = !DILocation(line: 75, column: 3, scope: !156)
!179 = !DILocation(line: 78, column: 3, scope: !156)
!180 = !DILocation(line: 81, column: 3, scope: !156)
!181 = !DILocation(line: 84, column: 39, scope: !156)
!182 = !DILocation(line: 84, column: 6, scope: !156)
!183 = !DILocation(line: 84, column: 10, scope: !156)
!184 = !DILocation(line: 84, column: 3, scope: !156)
!185 = !DILocation(line: 84, column: 36, scope: !156)
!186 = !DILocation(line: 87, column: 3, scope: !156)
!187 = !DILocation(line: 89, column: 7, scope: !188)
!188 = distinct !DILexicalBlock(scope: !156, file: !81, line: 89, column: 6)
!189 = !DILocation(line: 95, column: 1, scope: !156)
!190 = !DILocalVariable(name: "out", arg: 1, scope: !2, file: !3, line: 74, type: !6)
!191 = !DILocation(line: 0, scope: !2)
!192 = !DILocalVariable(name: "outlen", arg: 2, scope: !2, file: !3, line: 74, type: !12)
!193 = !DILocation(line: 78, column: 3, scope: !2)
!194 = !DILocation(line: 78, column: 9, scope: !2)
!195 = !DILocation(line: 78, column: 12, scope: !2)
!196 = !DILocation(line: 86, column: 3, scope: !2)
!197 = !DILocation(line: 79, column: 10, scope: !198)
!198 = distinct !DILexicalBlock(scope: !2, file: !3, line: 78, column: 19)
!199 = !DILocation(line: 79, column: 8, scope: !198)
!200 = !DILocation(line: 80, column: 11, scope: !201)
!201 = distinct !DILexicalBlock(scope: !198, file: !3, line: 80, column: 8)
!202 = !DILocation(line: 80, column: 17, scope: !201)
!203 = !DILocation(line: 80, column: 20, scope: !201)
!204 = !DILocation(line: 80, column: 26, scope: !201)
!205 = !DILocation(line: 82, column: 13, scope: !206)
!206 = distinct !DILexicalBlock(scope: !201, file: !3, line: 82, column: 13)
!207 = !DILocation(line: 82, column: 16, scope: !206)
!208 = !DILocation(line: 83, column: 7, scope: !206)
!209 = distinct !{!209, !193, !210, !105}
!210 = !DILocation(line: 84, column: 3, scope: !2)
!211 = !DILocation(line: 86, column: 16, scope: !2)
!212 = !DILocation(line: 87, column: 16, scope: !213)
!213 = distinct !DILexicalBlock(scope: !2, file: !3, line: 86, column: 21)
!214 = !DILocation(line: 87, column: 11, scope: !213)
!215 = !DILocalVariable(name: "ret", scope: !2, file: !3, line: 76, type: !216)
!216 = !DIDerivedType(tag: DW_TAG_typedef, name: "ssize_t", file: !217, line: 182, baseType: !218)
!217 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/sys/types.h", directory: "")
!218 = !DIDerivedType(tag: DW_TAG_typedef, name: "_ssize_t", file: !219, line: 147, baseType: !25)
!219 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/sys/_types.h", directory: "")
!220 = !DILocation(line: 88, column: 18, scope: !221)
!221 = distinct !DILexicalBlock(scope: !213, file: !3, line: 88, column: 8)
!222 = !DILocation(line: 88, column: 21, scope: !221)
!223 = !DILocation(line: 88, column: 27, scope: !221)
!224 = distinct !{!224, !196, !225, !105}
!225 = !DILocation(line: 95, column: 3, scope: !2)
!226 = !DILocation(line: 91, column: 7, scope: !227)
!227 = distinct !DILexicalBlock(scope: !221, file: !3, line: 90, column: 13)
!228 = !DILocation(line: 93, column: 9, scope: !213)
!229 = !DILocation(line: 94, column: 12, scope: !213)
!230 = !DILocation(line: 96, column: 1, scope: !2)
!231 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_keypair_derand", scope: !232, file: !232, line: 25, type: !233, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !24)
!232 = !DIFile(filename: "../../../ref/kem.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!233 = !DISubroutineType(types: !234)
!234 = !{!25, !6, !6, !235}
!235 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !236, size: 32)
!236 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !7)
!237 = !DILocalVariable(name: "pk", arg: 1, scope: !231, file: !232, line: 25, type: !6)
!238 = !DILocation(line: 0, scope: !231)
!239 = !DILocalVariable(name: "sk", arg: 2, scope: !231, file: !232, line: 26, type: !6)
!240 = !DILocalVariable(name: "coins", arg: 3, scope: !231, file: !232, line: 27, type: !235)
!241 = !DILocation(line: 29, column: 3, scope: !231)
!242 = !DILocation(line: 30, column: 12, scope: !231)
!243 = !DILocation(line: 30, column: 3, scope: !231)
!244 = !DILocation(line: 31, column: 3, scope: !231)
!245 = !DILocation(line: 33, column: 33, scope: !231)
!246 = !DILocation(line: 33, column: 55, scope: !231)
!247 = !DILocation(line: 33, column: 3, scope: !231)
!248 = !DILocation(line: 34, column: 3, scope: !231)
!249 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_keypair", scope: !232, file: !232, line: 50, type: !250, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !24)
!250 = !DISubroutineType(types: !251)
!251 = !{!25, !6, !6}
!252 = !DILocalVariable(name: "pk", arg: 1, scope: !249, file: !232, line: 50, type: !6)
!253 = !DILocation(line: 0, scope: !249)
!254 = !DILocalVariable(name: "sk", arg: 2, scope: !249, file: !232, line: 51, type: !6)
!255 = !DILocalVariable(name: "coins", scope: !249, file: !232, line: 53, type: !256)
!256 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 512, elements: !257)
!257 = !{!258}
!258 = !DISubrange(count: 64)
!259 = !DILocation(line: 53, column: 11, scope: !249)
!260 = !DILocation(line: 54, column: 3, scope: !249)
!261 = !DILocation(line: 55, column: 3, scope: !249)
!262 = !DILocation(line: 56, column: 3, scope: !249)
!263 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_enc_derand", scope: !232, file: !232, line: 76, type: !264, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !24)
!264 = !DISubroutineType(types: !265)
!265 = !{!25, !6, !6, !235, !235}
!266 = !DILocalVariable(name: "ct", arg: 1, scope: !263, file: !232, line: 76, type: !6)
!267 = !DILocation(line: 0, scope: !263)
!268 = !DILocalVariable(name: "ss", arg: 2, scope: !263, file: !232, line: 77, type: !6)
!269 = !DILocalVariable(name: "pk", arg: 3, scope: !263, file: !232, line: 78, type: !235)
!270 = !DILocalVariable(name: "coins", arg: 4, scope: !263, file: !232, line: 79, type: !235)
!271 = !DILocalVariable(name: "buf", scope: !263, file: !232, line: 81, type: !256)
!272 = !DILocation(line: 81, column: 11, scope: !263)
!273 = !DILocalVariable(name: "kr", scope: !263, file: !232, line: 83, type: !256)
!274 = !DILocation(line: 83, column: 11, scope: !263)
!275 = !DILocation(line: 85, column: 3, scope: !263)
!276 = !DILocation(line: 88, column: 3, scope: !263)
!277 = !DILocation(line: 89, column: 3, scope: !263)
!278 = !DILocation(line: 92, column: 29, scope: !263)
!279 = !DILocation(line: 92, column: 3, scope: !263)
!280 = !DILocation(line: 94, column: 3, scope: !263)
!281 = !DILocation(line: 95, column: 3, scope: !263)
!282 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_enc", scope: !232, file: !232, line: 113, type: !233, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !24)
!283 = !DILocalVariable(name: "ct", arg: 1, scope: !282, file: !232, line: 113, type: !6)
!284 = !DILocation(line: 0, scope: !282)
!285 = !DILocalVariable(name: "ss", arg: 2, scope: !282, file: !232, line: 114, type: !6)
!286 = !DILocalVariable(name: "pk", arg: 3, scope: !282, file: !232, line: 115, type: !235)
!287 = !DILocalVariable(name: "coins", scope: !282, file: !232, line: 117, type: !124)
!288 = !DILocation(line: 117, column: 11, scope: !282)
!289 = !DILocation(line: 118, column: 3, scope: !282)
!290 = !DILocation(line: 119, column: 3, scope: !282)
!291 = !DILocation(line: 120, column: 3, scope: !282)
!292 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_dec", scope: !232, file: !232, line: 140, type: !293, scopeLine: 143, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !24)
!293 = !DISubroutineType(types: !294)
!294 = !{!25, !6, !235, !235}
!295 = !DILocalVariable(name: "ss", arg: 1, scope: !292, file: !232, line: 140, type: !6)
!296 = !DILocation(line: 0, scope: !292)
!297 = !DILocalVariable(name: "ct", arg: 2, scope: !292, file: !232, line: 141, type: !235)
!298 = !DILocalVariable(name: "sk", arg: 3, scope: !292, file: !232, line: 142, type: !235)
!299 = !DILocalVariable(name: "buf", scope: !292, file: !232, line: 145, type: !256)
!300 = !DILocation(line: 145, column: 11, scope: !292)
!301 = !DILocalVariable(name: "kr", scope: !292, file: !232, line: 147, type: !256)
!302 = !DILocation(line: 147, column: 11, scope: !292)
!303 = !DILocalVariable(name: "cmp", scope: !292, file: !232, line: 149, type: !119)
!304 = !DILocation(line: 149, column: 11, scope: !292)
!305 = !DILocation(line: 150, column: 25, scope: !292)
!306 = !DILocalVariable(name: "pk", scope: !292, file: !232, line: 150, type: !235)
!307 = !DILocation(line: 152, column: 3, scope: !292)
!308 = !DILocation(line: 155, column: 13, scope: !292)
!309 = !DILocation(line: 155, column: 53, scope: !292)
!310 = !DILocation(line: 155, column: 3, scope: !292)
!311 = !DILocation(line: 156, column: 3, scope: !292)
!312 = !DILocation(line: 159, column: 30, scope: !292)
!313 = !DILocation(line: 159, column: 3, scope: !292)
!314 = !DILocation(line: 161, column: 10, scope: !292)
!315 = !DILocalVariable(name: "fail", scope: !292, file: !232, line: 144, type: !25)
!316 = !DILocation(line: 164, column: 3, scope: !292)
!317 = !DILocation(line: 167, column: 29, scope: !292)
!318 = !DILocation(line: 167, column: 3, scope: !292)
!319 = !DILocation(line: 169, column: 3, scope: !292)
!320 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_gen_matrix", scope: !321, file: !321, line: 165, type: !322, scopeLine: 166, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !58, retainedNodes: !24)
!321 = !DIFile(filename: "../../../ref/indcpa.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!322 = !DISubroutineType(types: !323)
!323 = !{null, !324, !235, !25}
!324 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !325, size: 32)
!325 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyvec", file: !326, line: 8, baseType: !327)
!326 = !DIFile(filename: "../../../ref/polyvec.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!327 = !DICompositeType(tag: DW_TAG_array_type, baseType: !328, size: 8192, elements: !333)
!328 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !329, line: 11, baseType: !330)
!329 = !DIFile(filename: "../../../ref/poly.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!330 = !DICompositeType(tag: DW_TAG_array_type, baseType: !36, size: 4096, elements: !331)
!331 = !{!332}
!332 = !DISubrange(count: 256)
!333 = !{!334}
!334 = !DISubrange(count: 2)
!335 = !DILocalVariable(name: "a", arg: 1, scope: !320, file: !321, line: 165, type: !324)
!336 = !DILocation(line: 0, scope: !320)
!337 = !DILocalVariable(name: "seed", arg: 2, scope: !320, file: !321, line: 165, type: !235)
!338 = !DILocalVariable(name: "transposed", arg: 3, scope: !320, file: !321, line: 166, type: !25)
!339 = !DILocalVariable(name: "buf", scope: !320, file: !321, line: 169, type: !340)
!340 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 4032, elements: !341)
!341 = !{!342}
!342 = !DISubrange(count: 504)
!343 = !DILocation(line: 169, column: 11, scope: !320)
!344 = !DILocalVariable(name: "state", scope: !320, file: !321, line: 170, type: !345)
!345 = !DIDerivedType(tag: DW_TAG_typedef, name: "xof_state", file: !346, line: 10, baseType: !347)
!346 = !DIFile(filename: "../../../ref/symmetric.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!347 = !DIDerivedType(tag: DW_TAG_typedef, name: "keccak_state", file: !348, line: 14, baseType: !349)
!348 = !DIFile(filename: "../../../ref/fips202.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!349 = !DICompositeType(tag: DW_TAG_array_type, baseType: !45, size: 1664, elements: !350)
!350 = !{!351}
!351 = !DISubrange(count: 26)
!352 = !DILocation(line: 170, column: 13, scope: !320)
!353 = !DILocalVariable(name: "i", scope: !320, file: !321, line: 167, type: !14)
!354 = !DILocation(line: 172, column: 8, scope: !355)
!355 = distinct !DILexicalBlock(scope: !320, file: !321, line: 172, column: 3)
!356 = !DILocation(line: 172, scope: !355)
!357 = !DILocation(line: 172, column: 17, scope: !358)
!358 = distinct !DILexicalBlock(scope: !355, file: !321, line: 172, column: 3)
!359 = !DILocation(line: 172, column: 3, scope: !355)
!360 = !DILocation(line: 173, column: 5, scope: !361)
!361 = distinct !DILexicalBlock(scope: !362, file: !321, line: 173, column: 5)
!362 = distinct !DILexicalBlock(scope: !358, file: !321, line: 172, column: 33)
!363 = !DILocation(line: 173, scope: !361)
!364 = !DILocalVariable(name: "j", scope: !320, file: !321, line: 167, type: !14)
!365 = !DILocation(line: 173, column: 19, scope: !366)
!366 = distinct !DILexicalBlock(scope: !361, file: !321, line: 173, column: 5)
!367 = !DILocation(line: 174, column: 11, scope: !368)
!368 = distinct !DILexicalBlock(scope: !369, file: !321, line: 174, column: 11)
!369 = distinct !DILexicalBlock(scope: !366, file: !321, line: 173, column: 35)
!370 = !DILocation(line: 175, column: 9, scope: !368)
!371 = !DILocation(line: 177, column: 9, scope: !368)
!372 = !DILocation(line: 179, column: 7, scope: !369)
!373 = !DILocalVariable(name: "buflen", scope: !320, file: !321, line: 168, type: !14)
!374 = !DILocation(line: 181, column: 25, scope: !369)
!375 = !DILocation(line: 181, column: 13, scope: !369)
!376 = !DILocalVariable(name: "ctr", scope: !320, file: !321, line: 167, type: !14)
!377 = !DILocation(line: 183, column: 7, scope: !369)
!378 = !DILocation(line: 0, scope: !369)
!379 = !DILocation(line: 183, column: 18, scope: !369)
!380 = !DILocation(line: 184, column: 9, scope: !381)
!381 = distinct !DILexicalBlock(scope: !369, file: !321, line: 183, column: 29)
!382 = !DILocation(line: 186, column: 28, scope: !381)
!383 = !DILocation(line: 186, column: 36, scope: !381)
!384 = !DILocation(line: 186, column: 51, scope: !381)
!385 = !DILocation(line: 186, column: 16, scope: !381)
!386 = !DILocation(line: 186, column: 13, scope: !381)
!387 = distinct !{!387, !377, !388, !105}
!388 = !DILocation(line: 187, column: 7, scope: !369)
!389 = !DILocation(line: 173, column: 31, scope: !366)
!390 = !DILocation(line: 173, column: 5, scope: !366)
!391 = distinct !{!391, !360, !392, !105}
!392 = !DILocation(line: 188, column: 5, scope: !361)
!393 = !DILocation(line: 172, column: 29, scope: !358)
!394 = !DILocation(line: 172, column: 3, scope: !358)
!395 = distinct !{!395, !359, !396, !105}
!396 = !DILocation(line: 189, column: 3, scope: !355)
!397 = !DILocation(line: 190, column: 1, scope: !320)
!398 = distinct !DISubprogram(name: "rej_uniform", scope: !321, file: !321, line: 122, type: !399, scopeLine: 123, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !58, retainedNodes: !24)
!399 = !DISubroutineType(types: !400)
!400 = !{!14, !401, !14, !235, !14}
!401 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 32)
!402 = !DILocalVariable(name: "r", arg: 1, scope: !398, file: !321, line: 122, type: !401)
!403 = !DILocation(line: 0, scope: !398)
!404 = !DILocalVariable(name: "len", arg: 2, scope: !398, file: !321, line: 122, type: !14)
!405 = !DILocalVariable(name: "buf", arg: 3, scope: !398, file: !321, line: 123, type: !235)
!406 = !DILocalVariable(name: "buflen", arg: 4, scope: !398, file: !321, line: 123, type: !14)
!407 = !DILocalVariable(name: "pos", scope: !398, file: !321, line: 124, type: !14)
!408 = !DILocalVariable(name: "ctr", scope: !398, file: !321, line: 124, type: !14)
!409 = !DILocation(line: 128, column: 3, scope: !398)
!410 = !DILocation(line: 128, column: 14, scope: !398)
!411 = !DILocation(line: 128, column: 20, scope: !398)
!412 = !DILocation(line: 129, column: 14, scope: !413)
!413 = distinct !DILexicalBlock(scope: !398, file: !321, line: 128, column: 42)
!414 = !DILocation(line: 129, column: 46, scope: !413)
!415 = !DILocation(line: 129, column: 36, scope: !413)
!416 = !DILocation(line: 129, column: 59, scope: !413)
!417 = !DILocation(line: 129, column: 66, scope: !413)
!418 = !DILocalVariable(name: "val0", scope: !398, file: !321, line: 125, type: !60)
!419 = !DILocation(line: 130, column: 14, scope: !413)
!420 = !DILocation(line: 130, column: 27, scope: !413)
!421 = !DILocation(line: 130, column: 46, scope: !413)
!422 = !DILocation(line: 130, column: 36, scope: !413)
!423 = !DILocation(line: 130, column: 59, scope: !413)
!424 = !DILocation(line: 130, column: 33, scope: !413)
!425 = !DILocalVariable(name: "val1", scope: !398, file: !321, line: 125, type: !60)
!426 = !DILocation(line: 131, column: 9, scope: !413)
!427 = !DILocation(line: 133, column: 14, scope: !428)
!428 = distinct !DILexicalBlock(scope: !413, file: !321, line: 133, column: 9)
!429 = !DILocation(line: 134, column: 12, scope: !428)
!430 = !DILocation(line: 134, column: 7, scope: !428)
!431 = !DILocation(line: 134, column: 16, scope: !428)
!432 = !DILocation(line: 135, column: 13, scope: !433)
!433 = distinct !DILexicalBlock(scope: !413, file: !321, line: 135, column: 9)
!434 = !DILocation(line: 135, column: 19, scope: !433)
!435 = !DILocation(line: 136, column: 12, scope: !433)
!436 = !DILocation(line: 136, column: 7, scope: !433)
!437 = !DILocation(line: 136, column: 16, scope: !433)
!438 = !DILocation(line: 0, scope: !413)
!439 = distinct !{!439, !409, !440, !105}
!440 = !DILocation(line: 137, column: 3, scope: !398)
!441 = !DILocation(line: 139, column: 3, scope: !398)
!442 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_indcpa_keypair_derand", scope: !321, file: !321, line: 205, type: !443, scopeLine: 207, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !58, retainedNodes: !24)
!443 = !DISubroutineType(types: !444)
!444 = !{null, !6, !6, !235}
!445 = !DILocalVariable(name: "pk", arg: 1, scope: !442, file: !321, line: 205, type: !6)
!446 = !DILocation(line: 0, scope: !442)
!447 = !DILocalVariable(name: "sk", arg: 2, scope: !442, file: !321, line: 206, type: !6)
!448 = !DILocalVariable(name: "coins", arg: 3, scope: !442, file: !321, line: 207, type: !235)
!449 = !DILocalVariable(name: "buf", scope: !442, file: !321, line: 209, type: !256)
!450 = !DILocation(line: 209, column: 11, scope: !442)
!451 = !DILocalVariable(name: "publicseed", scope: !442, file: !321, line: 210, type: !235)
!452 = !DILocation(line: 211, column: 34, scope: !442)
!453 = !DILocalVariable(name: "noiseseed", scope: !442, file: !321, line: 211, type: !235)
!454 = !DILocalVariable(name: "nonce", scope: !442, file: !321, line: 212, type: !7)
!455 = !DILocalVariable(name: "a", scope: !442, file: !321, line: 213, type: !456)
!456 = !DICompositeType(tag: DW_TAG_array_type, baseType: !325, size: 16384, elements: !333)
!457 = !DILocation(line: 213, column: 11, scope: !442)
!458 = !DILocalVariable(name: "e", scope: !442, file: !321, line: 213, type: !325)
!459 = !DILocation(line: 213, column: 23, scope: !442)
!460 = !DILocalVariable(name: "pkpv", scope: !442, file: !321, line: 213, type: !325)
!461 = !DILocation(line: 213, column: 26, scope: !442)
!462 = !DILocalVariable(name: "skpv", scope: !442, file: !321, line: 213, type: !325)
!463 = !DILocation(line: 213, column: 32, scope: !442)
!464 = !DILocation(line: 215, column: 3, scope: !442)
!465 = !DILocation(line: 216, column: 3, scope: !442)
!466 = !DILocation(line: 216, column: 23, scope: !442)
!467 = !DILocation(line: 217, column: 3, scope: !442)
!468 = !DILocation(line: 219, column: 3, scope: !442)
!469 = !DILocalVariable(name: "i", scope: !442, file: !321, line: 208, type: !14)
!470 = !DILocation(line: 221, column: 8, scope: !471)
!471 = distinct !DILexicalBlock(scope: !442, file: !321, line: 221, column: 3)
!472 = !DILocation(line: 221, scope: !471)
!473 = !DILocation(line: 221, column: 17, scope: !474)
!474 = distinct !DILexicalBlock(scope: !471, file: !321, line: 221, column: 3)
!475 = !DILocation(line: 221, column: 3, scope: !471)
!476 = !DILocation(line: 223, column: 3, scope: !477)
!477 = distinct !DILexicalBlock(scope: !442, file: !321, line: 223, column: 3)
!478 = !DILocation(line: 222, column: 25, scope: !474)
!479 = !DILocation(line: 222, column: 5, scope: !474)
!480 = !DILocation(line: 222, column: 50, scope: !474)
!481 = !DILocation(line: 221, column: 29, scope: !474)
!482 = !DILocation(line: 221, column: 3, scope: !474)
!483 = distinct !{!483, !475, !484, !105}
!484 = !DILocation(line: 222, column: 52, scope: !471)
!485 = !DILocation(line: 223, scope: !477)
!486 = !DILocation(line: 223, column: 17, scope: !487)
!487 = distinct !DILexicalBlock(scope: !477, file: !321, line: 223, column: 3)
!488 = !DILocation(line: 224, column: 25, scope: !487)
!489 = !DILocation(line: 224, column: 5, scope: !487)
!490 = !DILocation(line: 224, column: 47, scope: !487)
!491 = !DILocation(line: 223, column: 29, scope: !487)
!492 = !DILocation(line: 223, column: 3, scope: !487)
!493 = distinct !{!493, !476, !494, !105}
!494 = !DILocation(line: 224, column: 49, scope: !477)
!495 = !DILocation(line: 226, column: 3, scope: !442)
!496 = !DILocation(line: 227, column: 3, scope: !442)
!497 = !DILocation(line: 230, column: 8, scope: !498)
!498 = distinct !DILexicalBlock(scope: !442, file: !321, line: 230, column: 3)
!499 = !DILocation(line: 230, scope: !498)
!500 = !DILocation(line: 230, column: 17, scope: !501)
!501 = distinct !DILexicalBlock(scope: !498, file: !321, line: 230, column: 3)
!502 = !DILocation(line: 230, column: 3, scope: !498)
!503 = !DILocation(line: 231, column: 37, scope: !504)
!504 = distinct !DILexicalBlock(scope: !501, file: !321, line: 230, column: 33)
!505 = !DILocation(line: 231, column: 47, scope: !504)
!506 = !DILocation(line: 231, column: 5, scope: !504)
!507 = !DILocation(line: 232, column: 18, scope: !504)
!508 = !DILocation(line: 232, column: 5, scope: !504)
!509 = !DILocation(line: 230, column: 29, scope: !501)
!510 = !DILocation(line: 230, column: 3, scope: !501)
!511 = distinct !{!511, !502, !512, !105}
!512 = !DILocation(line: 233, column: 3, scope: !498)
!513 = !DILocation(line: 235, column: 3, scope: !442)
!514 = !DILocation(line: 236, column: 3, scope: !442)
!515 = !DILocation(line: 238, column: 3, scope: !442)
!516 = !DILocation(line: 239, column: 3, scope: !442)
!517 = !DILocation(line: 240, column: 1, scope: !442)
!518 = distinct !DISubprogram(name: "pack_sk", scope: !321, file: !321, line: 55, type: !519, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !58, retainedNodes: !24)
!519 = !DISubroutineType(types: !520)
!520 = !{null, !6, !324}
!521 = !DILocalVariable(name: "r", arg: 1, scope: !518, file: !321, line: 55, type: !6)
!522 = !DILocation(line: 0, scope: !518)
!523 = !DILocalVariable(name: "sk", arg: 2, scope: !518, file: !321, line: 55, type: !324)
!524 = !DILocation(line: 56, column: 3, scope: !518)
!525 = !DILocation(line: 57, column: 1, scope: !518)
!526 = distinct !DISubprogram(name: "pack_pk", scope: !321, file: !321, line: 23, type: !527, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !58, retainedNodes: !24)
!527 = !DISubroutineType(types: !528)
!528 = !{null, !6, !324, !235}
!529 = !DILocalVariable(name: "r", arg: 1, scope: !526, file: !321, line: 23, type: !6)
!530 = !DILocation(line: 0, scope: !526)
!531 = !DILocalVariable(name: "pk", arg: 2, scope: !526, file: !321, line: 23, type: !324)
!532 = !DILocalVariable(name: "seed", arg: 3, scope: !526, file: !321, line: 24, type: !235)
!533 = !DILocation(line: 25, column: 3, scope: !526)
!534 = !DILocation(line: 26, column: 12, scope: !526)
!535 = !DILocation(line: 26, column: 3, scope: !526)
!536 = !DILocation(line: 27, column: 1, scope: !526)
!537 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_indcpa_enc", scope: !321, file: !321, line: 257, type: !538, scopeLine: 260, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !58, retainedNodes: !24)
!538 = !DISubroutineType(types: !539)
!539 = !{null, !6, !235, !235, !235}
!540 = !DILocalVariable(name: "c", arg: 1, scope: !537, file: !321, line: 257, type: !6)
!541 = !DILocation(line: 0, scope: !537)
!542 = !DILocalVariable(name: "m", arg: 2, scope: !537, file: !321, line: 258, type: !235)
!543 = !DILocalVariable(name: "pk", arg: 3, scope: !537, file: !321, line: 259, type: !235)
!544 = !DILocalVariable(name: "coins", arg: 4, scope: !537, file: !321, line: 260, type: !235)
!545 = !DILocalVariable(name: "seed", scope: !537, file: !321, line: 262, type: !124)
!546 = !DILocation(line: 262, column: 11, scope: !537)
!547 = !DILocalVariable(name: "nonce", scope: !537, file: !321, line: 263, type: !7)
!548 = !DILocalVariable(name: "sp", scope: !537, file: !321, line: 264, type: !325)
!549 = !DILocation(line: 264, column: 11, scope: !537)
!550 = !DILocalVariable(name: "pkpv", scope: !537, file: !321, line: 264, type: !325)
!551 = !DILocation(line: 264, column: 15, scope: !537)
!552 = !DILocalVariable(name: "ep", scope: !537, file: !321, line: 264, type: !325)
!553 = !DILocation(line: 264, column: 21, scope: !537)
!554 = !DILocalVariable(name: "at", scope: !537, file: !321, line: 264, type: !456)
!555 = !DILocation(line: 264, column: 25, scope: !537)
!556 = !DILocalVariable(name: "b", scope: !537, file: !321, line: 264, type: !325)
!557 = !DILocation(line: 264, column: 38, scope: !537)
!558 = !DILocalVariable(name: "v", scope: !537, file: !321, line: 265, type: !328)
!559 = !DILocation(line: 265, column: 8, scope: !537)
!560 = !DILocalVariable(name: "k", scope: !537, file: !321, line: 265, type: !328)
!561 = !DILocation(line: 265, column: 11, scope: !537)
!562 = !DILocalVariable(name: "epp", scope: !537, file: !321, line: 265, type: !328)
!563 = !DILocation(line: 265, column: 14, scope: !537)
!564 = !DILocation(line: 267, column: 3, scope: !537)
!565 = !DILocation(line: 268, column: 3, scope: !537)
!566 = !DILocation(line: 269, column: 3, scope: !537)
!567 = !DILocalVariable(name: "i", scope: !537, file: !321, line: 261, type: !14)
!568 = !DILocation(line: 271, column: 8, scope: !569)
!569 = distinct !DILexicalBlock(scope: !537, file: !321, line: 271, column: 3)
!570 = !DILocation(line: 271, scope: !569)
!571 = !DILocation(line: 271, column: 17, scope: !572)
!572 = distinct !DILexicalBlock(scope: !569, file: !321, line: 271, column: 3)
!573 = !DILocation(line: 271, column: 3, scope: !569)
!574 = !DILocation(line: 273, column: 3, scope: !575)
!575 = distinct !DILexicalBlock(scope: !537, file: !321, line: 273, column: 3)
!576 = !DILocation(line: 272, column: 27, scope: !572)
!577 = !DILocation(line: 272, column: 5, scope: !572)
!578 = !DILocation(line: 272, column: 44, scope: !572)
!579 = !DILocation(line: 271, column: 29, scope: !572)
!580 = !DILocation(line: 271, column: 3, scope: !572)
!581 = distinct !{!581, !573, !582, !105}
!582 = !DILocation(line: 272, column: 46, scope: !569)
!583 = !DILocation(line: 273, scope: !575)
!584 = !DILocation(line: 273, column: 17, scope: !585)
!585 = distinct !DILexicalBlock(scope: !575, file: !321, line: 273, column: 3)
!586 = !DILocation(line: 274, column: 27, scope: !585)
!587 = !DILocation(line: 274, column: 5, scope: !585)
!588 = !DILocation(line: 274, column: 44, scope: !585)
!589 = !DILocation(line: 273, column: 29, scope: !585)
!590 = !DILocation(line: 273, column: 3, scope: !585)
!591 = distinct !{!591, !574, !592, !105}
!592 = !DILocation(line: 274, column: 46, scope: !575)
!593 = !DILocation(line: 275, column: 3, scope: !537)
!594 = !DILocation(line: 277, column: 3, scope: !537)
!595 = !DILocation(line: 280, column: 8, scope: !596)
!596 = distinct !DILexicalBlock(scope: !537, file: !321, line: 280, column: 3)
!597 = !DILocation(line: 280, scope: !596)
!598 = !DILocation(line: 280, column: 17, scope: !599)
!599 = distinct !DILexicalBlock(scope: !596, file: !321, line: 280, column: 3)
!600 = !DILocation(line: 280, column: 3, scope: !596)
!601 = !DILocation(line: 281, column: 37, scope: !599)
!602 = !DILocation(line: 281, column: 44, scope: !599)
!603 = !DILocation(line: 281, column: 5, scope: !599)
!604 = !DILocation(line: 280, column: 29, scope: !599)
!605 = !DILocation(line: 280, column: 3, scope: !599)
!606 = distinct !{!606, !600, !607, !105}
!607 = !DILocation(line: 281, column: 54, scope: !596)
!608 = !DILocation(line: 283, column: 3, scope: !537)
!609 = !DILocation(line: 285, column: 3, scope: !537)
!610 = !DILocation(line: 286, column: 3, scope: !537)
!611 = !DILocation(line: 288, column: 3, scope: !537)
!612 = !DILocation(line: 289, column: 3, scope: !537)
!613 = !DILocation(line: 290, column: 3, scope: !537)
!614 = !DILocation(line: 291, column: 3, scope: !537)
!615 = !DILocation(line: 292, column: 3, scope: !537)
!616 = !DILocation(line: 294, column: 3, scope: !537)
!617 = !DILocation(line: 295, column: 1, scope: !537)
!618 = distinct !DISubprogram(name: "unpack_pk", scope: !321, file: !321, line: 40, type: !619, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !58, retainedNodes: !24)
!619 = !DISubroutineType(types: !620)
!620 = !{null, !324, !6, !235}
!621 = !DILocalVariable(name: "pk", arg: 1, scope: !618, file: !321, line: 40, type: !324)
!622 = !DILocation(line: 0, scope: !618)
!623 = !DILocalVariable(name: "seed", arg: 2, scope: !618, file: !321, line: 40, type: !6)
!624 = !DILocalVariable(name: "packedpk", arg: 3, scope: !618, file: !321, line: 41, type: !235)
!625 = !DILocation(line: 42, column: 3, scope: !618)
!626 = !DILocation(line: 43, column: 25, scope: !618)
!627 = !DILocation(line: 43, column: 3, scope: !618)
!628 = !DILocation(line: 44, column: 1, scope: !618)
!629 = distinct !DISubprogram(name: "pack_ciphertext", scope: !321, file: !321, line: 85, type: !630, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !58, retainedNodes: !24)
!630 = !DISubroutineType(types: !631)
!631 = !{null, !6, !324, !632}
!632 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !328, size: 32)
!633 = !DILocalVariable(name: "r", arg: 1, scope: !629, file: !321, line: 85, type: !6)
!634 = !DILocation(line: 0, scope: !629)
!635 = !DILocalVariable(name: "b", arg: 2, scope: !629, file: !321, line: 85, type: !324)
!636 = !DILocalVariable(name: "v", arg: 3, scope: !629, file: !321, line: 86, type: !632)
!637 = !DILocation(line: 87, column: 3, scope: !629)
!638 = !DILocation(line: 88, column: 19, scope: !629)
!639 = !DILocation(line: 88, column: 3, scope: !629)
!640 = !DILocation(line: 89, column: 1, scope: !629)
!641 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_indcpa_dec", scope: !321, file: !321, line: 310, type: !642, scopeLine: 312, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !58, retainedNodes: !24)
!642 = !DISubroutineType(types: !643)
!643 = !{null, !6, !235, !235}
!644 = !DILocalVariable(name: "m", arg: 1, scope: !641, file: !321, line: 310, type: !6)
!645 = !DILocation(line: 0, scope: !641)
!646 = !DILocalVariable(name: "c", arg: 2, scope: !641, file: !321, line: 311, type: !235)
!647 = !DILocalVariable(name: "sk", arg: 3, scope: !641, file: !321, line: 312, type: !235)
!648 = !DILocalVariable(name: "b", scope: !641, file: !321, line: 313, type: !325)
!649 = !DILocation(line: 313, column: 11, scope: !641)
!650 = !DILocalVariable(name: "skpv", scope: !641, file: !321, line: 313, type: !325)
!651 = !DILocation(line: 313, column: 14, scope: !641)
!652 = !DILocalVariable(name: "v", scope: !641, file: !321, line: 314, type: !328)
!653 = !DILocation(line: 314, column: 8, scope: !641)
!654 = !DILocalVariable(name: "mp", scope: !641, file: !321, line: 314, type: !328)
!655 = !DILocation(line: 314, column: 11, scope: !641)
!656 = !DILocation(line: 316, column: 3, scope: !641)
!657 = !DILocation(line: 317, column: 3, scope: !641)
!658 = !DILocation(line: 319, column: 3, scope: !641)
!659 = !DILocation(line: 320, column: 3, scope: !641)
!660 = !DILocation(line: 321, column: 3, scope: !641)
!661 = !DILocation(line: 323, column: 3, scope: !641)
!662 = !DILocation(line: 324, column: 3, scope: !641)
!663 = !DILocation(line: 326, column: 3, scope: !641)
!664 = !DILocation(line: 327, column: 1, scope: !641)
!665 = distinct !DISubprogram(name: "unpack_ciphertext", scope: !321, file: !321, line: 101, type: !666, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !58, retainedNodes: !24)
!666 = !DISubroutineType(types: !667)
!667 = !{null, !324, !632, !235}
!668 = !DILocalVariable(name: "b", arg: 1, scope: !665, file: !321, line: 101, type: !324)
!669 = !DILocation(line: 0, scope: !665)
!670 = !DILocalVariable(name: "v", arg: 2, scope: !665, file: !321, line: 101, type: !632)
!671 = !DILocalVariable(name: "c", arg: 3, scope: !665, file: !321, line: 102, type: !235)
!672 = !DILocation(line: 103, column: 3, scope: !665)
!673 = !DILocation(line: 104, column: 24, scope: !665)
!674 = !DILocation(line: 104, column: 3, scope: !665)
!675 = !DILocation(line: 105, column: 1, scope: !665)
!676 = distinct !DISubprogram(name: "unpack_sk", scope: !321, file: !321, line: 69, type: !677, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !58, retainedNodes: !24)
!677 = !DISubroutineType(types: !678)
!678 = !{null, !324, !235}
!679 = !DILocalVariable(name: "sk", arg: 1, scope: !676, file: !321, line: 69, type: !324)
!680 = !DILocation(line: 0, scope: !676)
!681 = !DILocalVariable(name: "packedsk", arg: 2, scope: !676, file: !321, line: 70, type: !235)
!682 = !DILocation(line: 71, column: 3, scope: !676)
!683 = !DILocation(line: 72, column: 1, scope: !676)
!684 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_compress", scope: !685, file: !685, line: 15, type: !686, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!685 = !DIFile(filename: "../../../ref/polyvec.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!686 = !DISubroutineType(types: !687)
!687 = !{null, !6, !688}
!688 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !689, size: 32)
!689 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !325)
!690 = !DILocalVariable(name: "r", arg: 1, scope: !684, file: !685, line: 15, type: !6)
!691 = !DILocation(line: 0, scope: !684)
!692 = !DILocalVariable(name: "a", arg: 2, scope: !684, file: !685, line: 16, type: !688)
!693 = !DILocalVariable(name: "t", scope: !684, file: !685, line: 52, type: !694)
!694 = !DICompositeType(tag: DW_TAG_array_type, baseType: !60, size: 64, elements: !695)
!695 = !{!696}
!696 = !DISubrange(count: 4)
!697 = !DILocation(line: 52, column: 12, scope: !684)
!698 = !DILocalVariable(name: "i", scope: !684, file: !685, line: 17, type: !14)
!699 = !DILocation(line: 53, column: 8, scope: !700)
!700 = distinct !DILexicalBlock(scope: !684, file: !685, line: 53, column: 3)
!701 = !DILocation(line: 53, scope: !700)
!702 = !DILocation(line: 53, column: 17, scope: !703)
!703 = distinct !DILexicalBlock(scope: !700, file: !685, line: 53, column: 3)
!704 = !DILocation(line: 53, column: 3, scope: !700)
!705 = !DILocation(line: 54, column: 5, scope: !706)
!706 = distinct !DILexicalBlock(scope: !707, file: !685, line: 54, column: 5)
!707 = distinct !DILexicalBlock(scope: !703, file: !685, line: 53, column: 33)
!708 = !DILocation(line: 54, scope: !706)
!709 = !DILocalVariable(name: "j", scope: !684, file: !685, line: 17, type: !14)
!710 = !DILocation(line: 54, column: 19, scope: !711)
!711 = distinct !DILexicalBlock(scope: !706, file: !685, line: 54, column: 5)
!712 = !DILocation(line: 55, column: 7, scope: !713)
!713 = distinct !DILexicalBlock(scope: !714, file: !685, line: 55, column: 7)
!714 = distinct !DILexicalBlock(scope: !711, file: !685, line: 54, column: 39)
!715 = !DILocation(line: 55, scope: !713)
!716 = !DILocalVariable(name: "k", scope: !684, file: !685, line: 17, type: !14)
!717 = !DILocation(line: 55, column: 21, scope: !718)
!718 = distinct !DILexicalBlock(scope: !713, file: !685, line: 55, column: 7)
!719 = !DILocation(line: 56, column: 26, scope: !720)
!720 = distinct !DILexicalBlock(scope: !718, file: !685, line: 55, column: 31)
!721 = !DILocation(line: 56, column: 30, scope: !720)
!722 = !DILocation(line: 56, column: 16, scope: !720)
!723 = !DILocation(line: 57, column: 39, scope: !720)
!724 = !DILocation(line: 57, column: 9, scope: !720)
!725 = !DILocation(line: 57, column: 14, scope: !720)
!726 = !DILocation(line: 60, column: 14, scope: !720)
!727 = !DILocalVariable(name: "d0", scope: !684, file: !685, line: 18, type: !45)
!728 = !DILocation(line: 63, column: 12, scope: !720)
!729 = !DILocation(line: 64, column: 12, scope: !720)
!730 = !DILocation(line: 65, column: 16, scope: !720)
!731 = !DILocation(line: 65, column: 9, scope: !720)
!732 = !DILocation(line: 65, column: 14, scope: !720)
!733 = !DILocation(line: 55, column: 27, scope: !718)
!734 = !DILocation(line: 55, column: 7, scope: !718)
!735 = distinct !{!735, !712, !736, !105}
!736 = !DILocation(line: 66, column: 7, scope: !713)
!737 = !DILocation(line: 68, column: 15, scope: !714)
!738 = !DILocation(line: 68, column: 14, scope: !714)
!739 = !DILocation(line: 68, column: 12, scope: !714)
!740 = !DILocation(line: 69, column: 15, scope: !714)
!741 = !DILocation(line: 69, column: 20, scope: !714)
!742 = !DILocation(line: 69, column: 29, scope: !714)
!743 = !DILocation(line: 69, column: 34, scope: !714)
!744 = !DILocation(line: 69, column: 26, scope: !714)
!745 = !DILocation(line: 69, column: 7, scope: !714)
!746 = !DILocation(line: 69, column: 12, scope: !714)
!747 = !DILocation(line: 70, column: 15, scope: !714)
!748 = !DILocation(line: 70, column: 20, scope: !714)
!749 = !DILocation(line: 70, column: 29, scope: !714)
!750 = !DILocation(line: 70, column: 34, scope: !714)
!751 = !DILocation(line: 70, column: 26, scope: !714)
!752 = !DILocation(line: 70, column: 7, scope: !714)
!753 = !DILocation(line: 70, column: 12, scope: !714)
!754 = !DILocation(line: 71, column: 15, scope: !714)
!755 = !DILocation(line: 71, column: 20, scope: !714)
!756 = !DILocation(line: 71, column: 29, scope: !714)
!757 = !DILocation(line: 71, column: 34, scope: !714)
!758 = !DILocation(line: 71, column: 26, scope: !714)
!759 = !DILocation(line: 71, column: 7, scope: !714)
!760 = !DILocation(line: 71, column: 12, scope: !714)
!761 = !DILocation(line: 72, column: 15, scope: !714)
!762 = !DILocation(line: 72, column: 20, scope: !714)
!763 = !DILocation(line: 72, column: 14, scope: !714)
!764 = !DILocation(line: 72, column: 7, scope: !714)
!765 = !DILocation(line: 72, column: 12, scope: !714)
!766 = !DILocation(line: 73, column: 9, scope: !714)
!767 = !DILocation(line: 54, column: 35, scope: !711)
!768 = !DILocation(line: 54, column: 5, scope: !711)
!769 = distinct !{!769, !705, !770, !105}
!770 = !DILocation(line: 74, column: 5, scope: !706)
!771 = !DILocation(line: 53, column: 29, scope: !703)
!772 = !DILocation(line: 53, column: 3, scope: !703)
!773 = distinct !{!773, !704, !774, !105}
!774 = !DILocation(line: 75, column: 3, scope: !700)
!775 = !DILocation(line: 79, column: 1, scope: !684)
!776 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_decompress", scope: !685, file: !685, line: 91, type: !677, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!777 = !DILocalVariable(name: "r", arg: 1, scope: !776, file: !685, line: 91, type: !324)
!778 = !DILocation(line: 0, scope: !776)
!779 = !DILocalVariable(name: "a", arg: 2, scope: !776, file: !685, line: 92, type: !235)
!780 = !DILocalVariable(name: "t", scope: !776, file: !685, line: 114, type: !694)
!781 = !DILocation(line: 114, column: 12, scope: !776)
!782 = !DILocalVariable(name: "i", scope: !776, file: !685, line: 93, type: !14)
!783 = !DILocation(line: 115, column: 8, scope: !784)
!784 = distinct !DILexicalBlock(scope: !776, file: !685, line: 115, column: 3)
!785 = !DILocation(line: 115, scope: !784)
!786 = !DILocation(line: 115, column: 17, scope: !787)
!787 = distinct !DILexicalBlock(scope: !784, file: !685, line: 115, column: 3)
!788 = !DILocation(line: 115, column: 3, scope: !784)
!789 = !DILocation(line: 116, column: 5, scope: !790)
!790 = distinct !DILexicalBlock(scope: !791, file: !685, line: 116, column: 5)
!791 = distinct !DILexicalBlock(scope: !787, file: !685, line: 115, column: 33)
!792 = !DILocation(line: 116, scope: !790)
!793 = !DILocalVariable(name: "j", scope: !776, file: !685, line: 93, type: !14)
!794 = !DILocation(line: 116, column: 19, scope: !795)
!795 = distinct !DILexicalBlock(scope: !790, file: !685, line: 116, column: 5)
!796 = !DILocation(line: 117, column: 15, scope: !797)
!797 = distinct !DILexicalBlock(scope: !795, file: !685, line: 116, column: 39)
!798 = !DILocation(line: 117, column: 39, scope: !797)
!799 = !DILocation(line: 117, column: 29, scope: !797)
!800 = !DILocation(line: 117, column: 44, scope: !797)
!801 = !DILocation(line: 117, column: 26, scope: !797)
!802 = !DILocation(line: 117, column: 12, scope: !797)
!803 = !DILocation(line: 118, column: 15, scope: !797)
!804 = !DILocation(line: 118, column: 20, scope: !797)
!805 = !DILocation(line: 118, column: 39, scope: !797)
!806 = !DILocation(line: 118, column: 29, scope: !797)
!807 = !DILocation(line: 118, column: 44, scope: !797)
!808 = !DILocation(line: 118, column: 26, scope: !797)
!809 = !DILocation(line: 118, column: 7, scope: !797)
!810 = !DILocation(line: 118, column: 12, scope: !797)
!811 = !DILocation(line: 119, column: 15, scope: !797)
!812 = !DILocation(line: 119, column: 20, scope: !797)
!813 = !DILocation(line: 119, column: 39, scope: !797)
!814 = !DILocation(line: 119, column: 29, scope: !797)
!815 = !DILocation(line: 119, column: 44, scope: !797)
!816 = !DILocation(line: 119, column: 26, scope: !797)
!817 = !DILocation(line: 119, column: 7, scope: !797)
!818 = !DILocation(line: 119, column: 12, scope: !797)
!819 = !DILocation(line: 120, column: 15, scope: !797)
!820 = !DILocation(line: 120, column: 20, scope: !797)
!821 = !DILocation(line: 120, column: 39, scope: !797)
!822 = !DILocation(line: 120, column: 29, scope: !797)
!823 = !DILocation(line: 120, column: 44, scope: !797)
!824 = !DILocation(line: 120, column: 26, scope: !797)
!825 = !DILocation(line: 120, column: 7, scope: !797)
!826 = !DILocation(line: 120, column: 12, scope: !797)
!827 = !DILocalVariable(name: "k", scope: !776, file: !685, line: 93, type: !14)
!828 = !DILocation(line: 123, column: 12, scope: !829)
!829 = distinct !DILexicalBlock(scope: !797, file: !685, line: 123, column: 7)
!830 = !DILocation(line: 123, scope: !829)
!831 = !DILocation(line: 123, column: 21, scope: !832)
!832 = distinct !DILexicalBlock(scope: !829, file: !685, line: 123, column: 7)
!833 = !DILocation(line: 123, column: 7, scope: !829)
!834 = !DILocation(line: 124, column: 42, scope: !832)
!835 = !DILocation(line: 124, column: 47, scope: !832)
!836 = !DILocation(line: 124, column: 56, scope: !832)
!837 = !DILocation(line: 124, column: 66, scope: !832)
!838 = !DILocation(line: 124, column: 73, scope: !832)
!839 = !DILocation(line: 124, column: 30, scope: !832)
!840 = !DILocation(line: 124, column: 19, scope: !832)
!841 = !DILocation(line: 124, column: 23, scope: !832)
!842 = !DILocation(line: 124, column: 9, scope: !832)
!843 = !DILocation(line: 124, column: 28, scope: !832)
!844 = !DILocation(line: 123, column: 27, scope: !832)
!845 = !DILocation(line: 123, column: 7, scope: !832)
!846 = distinct !{!846, !833, !847, !105}
!847 = !DILocation(line: 124, column: 76, scope: !829)
!848 = !DILocation(line: 121, column: 9, scope: !797)
!849 = !DILocation(line: 116, column: 35, scope: !795)
!850 = !DILocation(line: 116, column: 5, scope: !795)
!851 = distinct !{!851, !789, !852, !105}
!852 = !DILocation(line: 125, column: 5, scope: !790)
!853 = !DILocation(line: 115, column: 29, scope: !787)
!854 = !DILocation(line: 115, column: 3, scope: !787)
!855 = distinct !{!855, !788, !856, !105}
!856 = !DILocation(line: 126, column: 3, scope: !784)
!857 = !DILocation(line: 130, column: 1, scope: !776)
!858 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_tobytes", scope: !685, file: !685, line: 141, type: !686, scopeLine: 141, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!859 = !DILocalVariable(name: "r", arg: 1, scope: !858, file: !685, line: 141, type: !6)
!860 = !DILocation(line: 0, scope: !858)
!861 = !DILocalVariable(name: "a", arg: 2, scope: !858, file: !685, line: 141, type: !688)
!862 = !DILocalVariable(name: "i", scope: !858, file: !685, line: 142, type: !14)
!863 = !DILocation(line: 143, column: 8, scope: !864)
!864 = distinct !DILexicalBlock(scope: !858, file: !685, line: 143, column: 3)
!865 = !DILocation(line: 143, scope: !864)
!866 = !DILocation(line: 143, column: 17, scope: !867)
!867 = distinct !DILexicalBlock(scope: !864, file: !685, line: 143, column: 3)
!868 = !DILocation(line: 143, column: 3, scope: !864)
!869 = !DILocation(line: 144, column: 24, scope: !867)
!870 = !DILocation(line: 144, column: 20, scope: !867)
!871 = !DILocation(line: 144, column: 44, scope: !867)
!872 = !DILocation(line: 144, column: 5, scope: !867)
!873 = !DILocation(line: 143, column: 29, scope: !867)
!874 = !DILocation(line: 143, column: 3, scope: !867)
!875 = distinct !{!875, !868, !876, !105}
!876 = !DILocation(line: 144, column: 51, scope: !864)
!877 = !DILocation(line: 145, column: 1, scope: !858)
!878 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_frombytes", scope: !685, file: !685, line: 157, type: !677, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!879 = !DILocalVariable(name: "r", arg: 1, scope: !878, file: !685, line: 157, type: !324)
!880 = !DILocation(line: 0, scope: !878)
!881 = !DILocalVariable(name: "a", arg: 2, scope: !878, file: !685, line: 157, type: !235)
!882 = !DILocalVariable(name: "i", scope: !878, file: !685, line: 158, type: !14)
!883 = !DILocation(line: 159, column: 8, scope: !884)
!884 = distinct !DILexicalBlock(scope: !878, file: !685, line: 159, column: 3)
!885 = !DILocation(line: 159, scope: !884)
!886 = !DILocation(line: 159, column: 17, scope: !887)
!887 = distinct !DILexicalBlock(scope: !884, file: !685, line: 159, column: 3)
!888 = !DILocation(line: 159, column: 3, scope: !884)
!889 = !DILocation(line: 160, column: 21, scope: !887)
!890 = !DILocation(line: 160, column: 36, scope: !887)
!891 = !DILocation(line: 160, column: 32, scope: !887)
!892 = !DILocation(line: 160, column: 5, scope: !887)
!893 = !DILocation(line: 159, column: 29, scope: !887)
!894 = !DILocation(line: 159, column: 3, scope: !887)
!895 = distinct !{!895, !888, !896, !105}
!896 = !DILocation(line: 160, column: 53, scope: !884)
!897 = !DILocation(line: 161, column: 1, scope: !878)
!898 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_ntt", scope: !685, file: !685, line: 170, type: !899, scopeLine: 170, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!899 = !DISubroutineType(types: !900)
!900 = !{null, !324}
!901 = !DILocalVariable(name: "r", arg: 1, scope: !898, file: !685, line: 170, type: !324)
!902 = !DILocation(line: 0, scope: !898)
!903 = !DILocalVariable(name: "i", scope: !898, file: !685, line: 171, type: !14)
!904 = !DILocation(line: 172, column: 8, scope: !905)
!905 = distinct !DILexicalBlock(scope: !898, file: !685, line: 172, column: 3)
!906 = !DILocation(line: 172, scope: !905)
!907 = !DILocation(line: 172, column: 17, scope: !908)
!908 = distinct !DILexicalBlock(scope: !905, file: !685, line: 172, column: 3)
!909 = !DILocation(line: 172, column: 3, scope: !905)
!910 = !DILocation(line: 173, column: 15, scope: !908)
!911 = !DILocation(line: 173, column: 5, scope: !908)
!912 = !DILocation(line: 172, column: 29, scope: !908)
!913 = !DILocation(line: 172, column: 3, scope: !908)
!914 = distinct !{!914, !909, !915, !105}
!915 = !DILocation(line: 173, column: 22, scope: !905)
!916 = !DILocation(line: 174, column: 1, scope: !898)
!917 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_invntt_tomont", scope: !685, file: !685, line: 184, type: !899, scopeLine: 184, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!918 = !DILocalVariable(name: "r", arg: 1, scope: !917, file: !685, line: 184, type: !324)
!919 = !DILocation(line: 0, scope: !917)
!920 = !DILocalVariable(name: "i", scope: !917, file: !685, line: 185, type: !14)
!921 = !DILocation(line: 186, column: 8, scope: !922)
!922 = distinct !DILexicalBlock(scope: !917, file: !685, line: 186, column: 3)
!923 = !DILocation(line: 186, scope: !922)
!924 = !DILocation(line: 186, column: 17, scope: !925)
!925 = distinct !DILexicalBlock(scope: !922, file: !685, line: 186, column: 3)
!926 = !DILocation(line: 186, column: 3, scope: !922)
!927 = !DILocation(line: 187, column: 25, scope: !925)
!928 = !DILocation(line: 187, column: 5, scope: !925)
!929 = !DILocation(line: 186, column: 29, scope: !925)
!930 = !DILocation(line: 186, column: 3, scope: !925)
!931 = distinct !{!931, !926, !932, !105}
!932 = !DILocation(line: 187, column: 32, scope: !922)
!933 = !DILocation(line: 188, column: 1, scope: !917)
!934 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery", scope: !685, file: !685, line: 200, type: !935, scopeLine: 201, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!935 = !DISubroutineType(types: !936)
!936 = !{null, !632, !688, !688}
!937 = !DILocalVariable(name: "r", arg: 1, scope: !934, file: !685, line: 200, type: !632)
!938 = !DILocation(line: 0, scope: !934)
!939 = !DILocalVariable(name: "a", arg: 2, scope: !934, file: !685, line: 200, type: !688)
!940 = !DILocalVariable(name: "b", arg: 3, scope: !934, file: !685, line: 201, type: !688)
!941 = !DILocalVariable(name: "t", scope: !934, file: !685, line: 203, type: !328)
!942 = !DILocation(line: 203, column: 8, scope: !934)
!943 = !DILocation(line: 205, column: 3, scope: !934)
!944 = !DILocalVariable(name: "i", scope: !934, file: !685, line: 202, type: !14)
!945 = !DILocation(line: 207, column: 34, scope: !946)
!946 = distinct !DILexicalBlock(scope: !947, file: !685, line: 206, column: 33)
!947 = distinct !DILexicalBlock(scope: !948, file: !685, line: 206, column: 3)
!948 = distinct !DILexicalBlock(scope: !934, file: !685, line: 206, column: 3)
!949 = !DILocation(line: 207, column: 44, scope: !946)
!950 = !DILocation(line: 207, column: 5, scope: !946)
!951 = !DILocation(line: 208, column: 5, scope: !946)
!952 = !DILocation(line: 211, column: 3, scope: !934)
!953 = !DILocation(line: 212, column: 1, scope: !934)
!954 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_reduce", scope: !685, file: !685, line: 223, type: !899, scopeLine: 223, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!955 = !DILocalVariable(name: "r", arg: 1, scope: !954, file: !685, line: 223, type: !324)
!956 = !DILocation(line: 0, scope: !954)
!957 = !DILocalVariable(name: "i", scope: !954, file: !685, line: 224, type: !14)
!958 = !DILocation(line: 225, column: 8, scope: !959)
!959 = distinct !DILexicalBlock(scope: !954, file: !685, line: 225, column: 3)
!960 = !DILocation(line: 225, scope: !959)
!961 = !DILocation(line: 225, column: 17, scope: !962)
!962 = distinct !DILexicalBlock(scope: !959, file: !685, line: 225, column: 3)
!963 = !DILocation(line: 225, column: 3, scope: !959)
!964 = !DILocation(line: 226, column: 18, scope: !962)
!965 = !DILocation(line: 226, column: 5, scope: !962)
!966 = !DILocation(line: 225, column: 29, scope: !962)
!967 = !DILocation(line: 225, column: 3, scope: !962)
!968 = distinct !{!968, !963, !969, !105}
!969 = !DILocation(line: 226, column: 25, scope: !959)
!970 = !DILocation(line: 227, column: 1, scope: !954)
!971 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_add", scope: !685, file: !685, line: 238, type: !972, scopeLine: 238, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!972 = !DISubroutineType(types: !973)
!973 = !{null, !324, !688, !688}
!974 = !DILocalVariable(name: "r", arg: 1, scope: !971, file: !685, line: 238, type: !324)
!975 = !DILocation(line: 0, scope: !971)
!976 = !DILocalVariable(name: "a", arg: 2, scope: !971, file: !685, line: 238, type: !688)
!977 = !DILocalVariable(name: "b", arg: 3, scope: !971, file: !685, line: 238, type: !688)
!978 = !DILocalVariable(name: "i", scope: !971, file: !685, line: 239, type: !14)
!979 = !DILocation(line: 240, column: 8, scope: !980)
!980 = distinct !DILexicalBlock(scope: !971, file: !685, line: 240, column: 3)
!981 = !DILocation(line: 240, scope: !980)
!982 = !DILocation(line: 240, column: 17, scope: !983)
!983 = distinct !DILexicalBlock(scope: !980, file: !685, line: 240, column: 3)
!984 = !DILocation(line: 240, column: 3, scope: !980)
!985 = !DILocation(line: 241, column: 15, scope: !983)
!986 = !DILocation(line: 241, column: 25, scope: !983)
!987 = !DILocation(line: 241, column: 35, scope: !983)
!988 = !DILocation(line: 241, column: 5, scope: !983)
!989 = !DILocation(line: 240, column: 29, scope: !983)
!990 = !DILocation(line: 240, column: 3, scope: !983)
!991 = distinct !{!991, !984, !992, !105}
!992 = !DILocation(line: 241, column: 42, scope: !980)
!993 = !DILocation(line: 242, column: 1, scope: !971)
!994 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_compress", scope: !995, file: !995, line: 19, type: !996, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!995 = !DIFile(filename: "../../../ref/poly.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!996 = !DISubroutineType(types: !997)
!997 = !{null, !6, !998}
!998 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !999, size: 32)
!999 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !328)
!1000 = !DILocalVariable(name: "r", arg: 1, scope: !994, file: !995, line: 19, type: !6)
!1001 = !DILocation(line: 0, scope: !994)
!1002 = !DILocalVariable(name: "a", arg: 2, scope: !994, file: !995, line: 19, type: !998)
!1003 = !DILocalVariable(name: "t", scope: !994, file: !995, line: 23, type: !1004)
!1004 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 64, elements: !1005)
!1005 = !{!1006}
!1006 = !DISubrange(count: 8)
!1007 = !DILocation(line: 23, column: 11, scope: !994)
!1008 = !DILocalVariable(name: "i", scope: !994, file: !995, line: 20, type: !14)
!1009 = !DILocation(line: 27, column: 8, scope: !1010)
!1010 = distinct !DILexicalBlock(scope: !994, file: !995, line: 27, column: 3)
!1011 = !DILocation(line: 27, scope: !1010)
!1012 = !DILocation(line: 27, column: 17, scope: !1013)
!1013 = distinct !DILexicalBlock(scope: !1010, file: !995, line: 27, column: 3)
!1014 = !DILocation(line: 27, column: 3, scope: !1010)
!1015 = !DILocation(line: 28, column: 5, scope: !1016)
!1016 = distinct !DILexicalBlock(scope: !1017, file: !995, line: 28, column: 5)
!1017 = distinct !DILexicalBlock(scope: !1013, file: !995, line: 27, column: 37)
!1018 = !DILocation(line: 28, scope: !1016)
!1019 = !DILocalVariable(name: "j", scope: !994, file: !995, line: 20, type: !14)
!1020 = !DILocation(line: 28, column: 19, scope: !1021)
!1021 = distinct !DILexicalBlock(scope: !1016, file: !995, line: 28, column: 5)
!1022 = !DILocation(line: 30, column: 18, scope: !1023)
!1023 = distinct !DILexicalBlock(scope: !1021, file: !995, line: 28, column: 29)
!1024 = !DILocation(line: 30, column: 22, scope: !1023)
!1025 = !DILocation(line: 30, column: 11, scope: !1023)
!1026 = !DILocalVariable(name: "u", scope: !994, file: !995, line: 21, type: !36)
!1027 = !DILocation(line: 31, column: 22, scope: !1023)
!1028 = !DILocation(line: 31, column: 9, scope: !1023)
!1029 = !DILocation(line: 33, column: 12, scope: !1023)
!1030 = !DILocalVariable(name: "d0", scope: !994, file: !995, line: 22, type: !65)
!1031 = !DILocation(line: 35, column: 10, scope: !1023)
!1032 = !DILocation(line: 36, column: 10, scope: !1023)
!1033 = !DILocation(line: 37, column: 14, scope: !1023)
!1034 = !DILocation(line: 37, column: 7, scope: !1023)
!1035 = !DILocation(line: 37, column: 12, scope: !1023)
!1036 = !DILocation(line: 28, column: 25, scope: !1021)
!1037 = !DILocation(line: 28, column: 5, scope: !1021)
!1038 = distinct !{!1038, !1015, !1039, !105}
!1039 = !DILocation(line: 38, column: 5, scope: !1016)
!1040 = !DILocation(line: 40, column: 12, scope: !1017)
!1041 = !DILocation(line: 40, column: 20, scope: !1017)
!1042 = !DILocation(line: 40, column: 25, scope: !1017)
!1043 = !DILocation(line: 40, column: 17, scope: !1017)
!1044 = !DILocation(line: 40, column: 10, scope: !1017)
!1045 = !DILocation(line: 41, column: 12, scope: !1017)
!1046 = !DILocation(line: 41, column: 20, scope: !1017)
!1047 = !DILocation(line: 41, column: 25, scope: !1017)
!1048 = !DILocation(line: 41, column: 17, scope: !1017)
!1049 = !DILocation(line: 41, column: 5, scope: !1017)
!1050 = !DILocation(line: 41, column: 10, scope: !1017)
!1051 = !DILocation(line: 42, column: 12, scope: !1017)
!1052 = !DILocation(line: 42, column: 20, scope: !1017)
!1053 = !DILocation(line: 42, column: 25, scope: !1017)
!1054 = !DILocation(line: 42, column: 17, scope: !1017)
!1055 = !DILocation(line: 42, column: 5, scope: !1017)
!1056 = !DILocation(line: 42, column: 10, scope: !1017)
!1057 = !DILocation(line: 43, column: 12, scope: !1017)
!1058 = !DILocation(line: 43, column: 20, scope: !1017)
!1059 = !DILocation(line: 43, column: 25, scope: !1017)
!1060 = !DILocation(line: 43, column: 17, scope: !1017)
!1061 = !DILocation(line: 43, column: 5, scope: !1017)
!1062 = !DILocation(line: 43, column: 10, scope: !1017)
!1063 = !DILocation(line: 44, column: 7, scope: !1017)
!1064 = !DILocation(line: 27, column: 33, scope: !1013)
!1065 = !DILocation(line: 27, column: 3, scope: !1013)
!1066 = distinct !{!1066, !1014, !1067, !105}
!1067 = !DILocation(line: 45, column: 3, scope: !1010)
!1068 = !DILocation(line: 70, column: 1, scope: !994)
!1069 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_decompress", scope: !995, file: !995, line: 82, type: !1070, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1070 = !DISubroutineType(types: !1071)
!1071 = !{null, !632, !235}
!1072 = !DILocalVariable(name: "r", arg: 1, scope: !1069, file: !995, line: 82, type: !632)
!1073 = !DILocation(line: 0, scope: !1069)
!1074 = !DILocalVariable(name: "a", arg: 2, scope: !1069, file: !995, line: 82, type: !235)
!1075 = !DILocalVariable(name: "i", scope: !1069, file: !995, line: 83, type: !14)
!1076 = !DILocation(line: 86, column: 8, scope: !1077)
!1077 = distinct !DILexicalBlock(scope: !1069, file: !995, line: 86, column: 3)
!1078 = !DILocation(line: 86, scope: !1077)
!1079 = !DILocation(line: 86, column: 17, scope: !1080)
!1080 = distinct !DILexicalBlock(scope: !1077, file: !995, line: 86, column: 3)
!1081 = !DILocation(line: 86, column: 3, scope: !1077)
!1082 = !DILocation(line: 87, column: 36, scope: !1083)
!1083 = distinct !DILexicalBlock(scope: !1080, file: !995, line: 86, column: 37)
!1084 = !DILocation(line: 87, column: 41, scope: !1083)
!1085 = !DILocation(line: 87, column: 25, scope: !1083)
!1086 = !DILocation(line: 87, column: 47, scope: !1083)
!1087 = !DILocation(line: 87, column: 58, scope: !1083)
!1088 = !DILocation(line: 87, column: 63, scope: !1083)
!1089 = !DILocation(line: 87, column: 23, scope: !1083)
!1090 = !DILocation(line: 87, column: 12, scope: !1083)
!1091 = !DILocation(line: 87, column: 5, scope: !1083)
!1092 = !DILocation(line: 87, column: 21, scope: !1083)
!1093 = !DILocation(line: 88, column: 36, scope: !1083)
!1094 = !DILocation(line: 88, column: 41, scope: !1083)
!1095 = !DILocation(line: 88, column: 25, scope: !1083)
!1096 = !DILocation(line: 88, column: 47, scope: !1083)
!1097 = !DILocation(line: 88, column: 58, scope: !1083)
!1098 = !DILocation(line: 88, column: 63, scope: !1083)
!1099 = !DILocation(line: 88, column: 23, scope: !1083)
!1100 = !DILocation(line: 88, column: 12, scope: !1083)
!1101 = !DILocation(line: 88, column: 16, scope: !1083)
!1102 = !DILocation(line: 88, column: 5, scope: !1083)
!1103 = !DILocation(line: 88, column: 21, scope: !1083)
!1104 = !DILocation(line: 89, column: 7, scope: !1083)
!1105 = !DILocation(line: 86, column: 33, scope: !1080)
!1106 = !DILocation(line: 86, column: 3, scope: !1080)
!1107 = distinct !{!1107, !1081, !1108, !105}
!1108 = !DILocation(line: 90, column: 3, scope: !1077)
!1109 = !DILocation(line: 111, column: 1, scope: !1069)
!1110 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_tobytes", scope: !995, file: !995, line: 122, type: !996, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1111 = !DILocalVariable(name: "r", arg: 1, scope: !1110, file: !995, line: 122, type: !6)
!1112 = !DILocation(line: 0, scope: !1110)
!1113 = !DILocalVariable(name: "a", arg: 2, scope: !1110, file: !995, line: 122, type: !998)
!1114 = !DILocalVariable(name: "i", scope: !1110, file: !995, line: 123, type: !14)
!1115 = !DILocation(line: 126, column: 8, scope: !1116)
!1116 = distinct !DILexicalBlock(scope: !1110, file: !995, line: 126, column: 3)
!1117 = !DILocation(line: 126, scope: !1116)
!1118 = !DILocation(line: 126, column: 17, scope: !1119)
!1119 = distinct !DILexicalBlock(scope: !1116, file: !995, line: 126, column: 3)
!1120 = !DILocation(line: 126, column: 3, scope: !1116)
!1121 = !DILocation(line: 128, column: 17, scope: !1122)
!1122 = distinct !DILexicalBlock(scope: !1119, file: !995, line: 126, column: 37)
!1123 = !DILocation(line: 128, column: 10, scope: !1122)
!1124 = !DILocalVariable(name: "t0", scope: !1110, file: !995, line: 124, type: !60)
!1125 = !DILocation(line: 129, column: 31, scope: !1122)
!1126 = !DILocation(line: 129, column: 8, scope: !1122)
!1127 = !DILocation(line: 130, column: 17, scope: !1122)
!1128 = !DILocation(line: 130, column: 21, scope: !1122)
!1129 = !DILocation(line: 130, column: 10, scope: !1122)
!1130 = !DILocalVariable(name: "t1", scope: !1110, file: !995, line: 124, type: !60)
!1131 = !DILocation(line: 131, column: 31, scope: !1122)
!1132 = !DILocation(line: 131, column: 8, scope: !1122)
!1133 = !DILocation(line: 132, column: 20, scope: !1122)
!1134 = !DILocation(line: 132, column: 9, scope: !1122)
!1135 = !DILocation(line: 132, column: 5, scope: !1122)
!1136 = !DILocation(line: 132, column: 18, scope: !1122)
!1137 = !DILocation(line: 133, column: 24, scope: !1122)
!1138 = !DILocation(line: 133, column: 33, scope: !1122)
!1139 = !DILocation(line: 133, column: 36, scope: !1122)
!1140 = !DILocation(line: 133, column: 30, scope: !1122)
!1141 = !DILocation(line: 133, column: 9, scope: !1122)
!1142 = !DILocation(line: 133, column: 5, scope: !1122)
!1143 = !DILocation(line: 133, column: 18, scope: !1122)
!1144 = !DILocation(line: 134, column: 24, scope: !1122)
!1145 = !DILocation(line: 134, column: 20, scope: !1122)
!1146 = !DILocation(line: 134, column: 9, scope: !1122)
!1147 = !DILocation(line: 134, column: 5, scope: !1122)
!1148 = !DILocation(line: 134, column: 18, scope: !1122)
!1149 = !DILocation(line: 126, column: 33, scope: !1119)
!1150 = !DILocation(line: 126, column: 3, scope: !1119)
!1151 = distinct !{!1151, !1120, !1152, !105}
!1152 = !DILocation(line: 135, column: 3, scope: !1116)
!1153 = !DILocation(line: 136, column: 1, scope: !1110)
!1154 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_frombytes", scope: !995, file: !995, line: 148, type: !1070, scopeLine: 148, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1155 = !DILocalVariable(name: "r", arg: 1, scope: !1154, file: !995, line: 148, type: !632)
!1156 = !DILocation(line: 0, scope: !1154)
!1157 = !DILocalVariable(name: "a", arg: 2, scope: !1154, file: !995, line: 148, type: !235)
!1158 = !DILocalVariable(name: "i", scope: !1154, file: !995, line: 149, type: !14)
!1159 = !DILocation(line: 150, column: 8, scope: !1160)
!1160 = distinct !DILexicalBlock(scope: !1154, file: !995, line: 150, column: 3)
!1161 = !DILocation(line: 150, scope: !1160)
!1162 = !DILocation(line: 150, column: 17, scope: !1163)
!1163 = distinct !DILexicalBlock(scope: !1160, file: !995, line: 150, column: 3)
!1164 = !DILocation(line: 150, column: 3, scope: !1160)
!1165 = !DILocation(line: 151, column: 25, scope: !1166)
!1166 = distinct !DILexicalBlock(scope: !1163, file: !995, line: 150, column: 37)
!1167 = !DILocation(line: 151, column: 21, scope: !1166)
!1168 = !DILocation(line: 151, column: 57, scope: !1166)
!1169 = !DILocation(line: 151, column: 53, scope: !1166)
!1170 = !DILocation(line: 151, column: 43, scope: !1166)
!1171 = !DILocation(line: 151, column: 66, scope: !1166)
!1172 = !DILocation(line: 151, column: 73, scope: !1166)
!1173 = !DILocation(line: 151, column: 12, scope: !1166)
!1174 = !DILocation(line: 151, column: 5, scope: !1166)
!1175 = !DILocation(line: 151, column: 17, scope: !1166)
!1176 = !DILocation(line: 153, column: 15, scope: !1166)
!1177 = !DILocation(line: 153, column: 11, scope: !1166)
!1178 = !DILocation(line: 153, column: 24, scope: !1166)
!1179 = !DILocation(line: 153, column: 47, scope: !1166)
!1180 = !DILocation(line: 153, column: 43, scope: !1166)
!1181 = !DILocation(line: 153, column: 33, scope: !1166)
!1182 = !DILocation(line: 153, column: 56, scope: !1166)
!1183 = !DILocation(line: 153, column: 30, scope: !1166)
!1184 = !DILocation(line: 152, column: 12, scope: !1166)
!1185 = !DILocation(line: 152, column: 16, scope: !1166)
!1186 = !DILocation(line: 152, column: 5, scope: !1166)
!1187 = !DILocation(line: 152, column: 21, scope: !1166)
!1188 = !DILocation(line: 150, column: 33, scope: !1163)
!1189 = !DILocation(line: 150, column: 3, scope: !1163)
!1190 = distinct !{!1190, !1164, !1191, !105}
!1191 = !DILocation(line: 154, column: 3, scope: !1160)
!1192 = !DILocation(line: 155, column: 1, scope: !1154)
!1193 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_frommsg", scope: !995, file: !995, line: 165, type: !1070, scopeLine: 165, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1194 = !DILocalVariable(name: "r", arg: 1, scope: !1193, file: !995, line: 165, type: !632)
!1195 = !DILocation(line: 0, scope: !1193)
!1196 = !DILocalVariable(name: "msg", arg: 2, scope: !1193, file: !995, line: 165, type: !235)
!1197 = !DILocalVariable(name: "i", scope: !1193, file: !995, line: 166, type: !14)
!1198 = !DILocation(line: 172, column: 8, scope: !1199)
!1199 = distinct !DILexicalBlock(scope: !1193, file: !995, line: 172, column: 3)
!1200 = !DILocation(line: 172, scope: !1199)
!1201 = !DILocation(line: 172, column: 17, scope: !1202)
!1202 = distinct !DILexicalBlock(scope: !1199, file: !995, line: 172, column: 3)
!1203 = !DILocation(line: 172, column: 3, scope: !1199)
!1204 = !DILocation(line: 173, column: 5, scope: !1205)
!1205 = distinct !DILexicalBlock(scope: !1206, file: !995, line: 173, column: 5)
!1206 = distinct !DILexicalBlock(scope: !1202, file: !995, line: 172, column: 37)
!1207 = !DILocation(line: 173, scope: !1205)
!1208 = !DILocalVariable(name: "j", scope: !1193, file: !995, line: 166, type: !14)
!1209 = !DILocation(line: 173, column: 19, scope: !1210)
!1210 = distinct !DILexicalBlock(scope: !1205, file: !995, line: 173, column: 5)
!1211 = !DILocation(line: 174, column: 14, scope: !1212)
!1212 = distinct !DILexicalBlock(scope: !1210, file: !995, line: 173, column: 29)
!1213 = !DILocation(line: 174, column: 18, scope: !1212)
!1214 = !DILocation(line: 174, column: 7, scope: !1212)
!1215 = !DILocation(line: 174, column: 23, scope: !1212)
!1216 = !DILocation(line: 175, column: 23, scope: !1212)
!1217 = !DILocation(line: 175, column: 31, scope: !1212)
!1218 = !DILocation(line: 175, column: 58, scope: !1212)
!1219 = !DILocation(line: 175, column: 65, scope: !1212)
!1220 = !DILocation(line: 175, column: 57, scope: !1212)
!1221 = !DILocation(line: 175, column: 7, scope: !1212)
!1222 = !DILocation(line: 173, column: 25, scope: !1210)
!1223 = !DILocation(line: 173, column: 5, scope: !1210)
!1224 = distinct !{!1224, !1204, !1225, !105}
!1225 = !DILocation(line: 176, column: 5, scope: !1205)
!1226 = !DILocation(line: 172, column: 33, scope: !1202)
!1227 = !DILocation(line: 172, column: 3, scope: !1202)
!1228 = distinct !{!1228, !1203, !1229, !105}
!1229 = !DILocation(line: 177, column: 3, scope: !1199)
!1230 = !DILocation(line: 178, column: 1, scope: !1193)
!1231 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_tomsg", scope: !995, file: !995, line: 188, type: !996, scopeLine: 188, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1232 = !DILocalVariable(name: "msg", arg: 1, scope: !1231, file: !995, line: 188, type: !6)
!1233 = !DILocation(line: 0, scope: !1231)
!1234 = !DILocalVariable(name: "a", arg: 2, scope: !1231, file: !995, line: 188, type: !998)
!1235 = !DILocalVariable(name: "i", scope: !1231, file: !995, line: 189, type: !14)
!1236 = !DILocation(line: 192, column: 8, scope: !1237)
!1237 = distinct !DILexicalBlock(scope: !1231, file: !995, line: 192, column: 3)
!1238 = !DILocation(line: 192, scope: !1237)
!1239 = !DILocation(line: 192, column: 17, scope: !1240)
!1240 = distinct !DILexicalBlock(scope: !1237, file: !995, line: 192, column: 3)
!1241 = !DILocation(line: 192, column: 3, scope: !1237)
!1242 = !DILocation(line: 193, column: 5, scope: !1243)
!1243 = distinct !DILexicalBlock(scope: !1240, file: !995, line: 192, column: 37)
!1244 = !DILocation(line: 193, column: 12, scope: !1243)
!1245 = !DILocalVariable(name: "j", scope: !1231, file: !995, line: 189, type: !14)
!1246 = !DILocation(line: 194, column: 10, scope: !1247)
!1247 = distinct !DILexicalBlock(scope: !1243, file: !995, line: 194, column: 5)
!1248 = !DILocation(line: 194, scope: !1247)
!1249 = !DILocation(line: 194, column: 19, scope: !1250)
!1250 = distinct !DILexicalBlock(scope: !1247, file: !995, line: 194, column: 5)
!1251 = !DILocation(line: 194, column: 5, scope: !1247)
!1252 = !DILocation(line: 195, column: 18, scope: !1253)
!1253 = distinct !DILexicalBlock(scope: !1250, file: !995, line: 194, column: 29)
!1254 = !DILocation(line: 195, column: 22, scope: !1253)
!1255 = !DILocation(line: 195, column: 11, scope: !1253)
!1256 = !DILocalVariable(name: "t", scope: !1231, file: !995, line: 190, type: !65)
!1257 = !DILocation(line: 200, column: 9, scope: !1253)
!1258 = !DILocation(line: 201, column: 9, scope: !1253)
!1259 = !DILocation(line: 202, column: 9, scope: !1253)
!1260 = !DILocation(line: 203, column: 19, scope: !1253)
!1261 = !DILocation(line: 203, column: 7, scope: !1253)
!1262 = !DILocation(line: 203, column: 14, scope: !1253)
!1263 = !DILocation(line: 194, column: 25, scope: !1250)
!1264 = !DILocation(line: 194, column: 5, scope: !1250)
!1265 = distinct !{!1265, !1251, !1266, !105}
!1266 = !DILocation(line: 204, column: 5, scope: !1247)
!1267 = !DILocation(line: 192, column: 33, scope: !1240)
!1268 = !DILocation(line: 192, column: 3, scope: !1240)
!1269 = distinct !{!1269, !1241, !1270, !105}
!1270 = !DILocation(line: 205, column: 3, scope: !1237)
!1271 = !DILocation(line: 206, column: 1, scope: !1231)
!1272 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_getnoise_eta1", scope: !995, file: !995, line: 220, type: !1273, scopeLine: 221, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1273 = !DISubroutineType(types: !1274)
!1274 = !{null, !632, !235, !7}
!1275 = !DILocalVariable(name: "r", arg: 1, scope: !1272, file: !995, line: 220, type: !632)
!1276 = !DILocation(line: 0, scope: !1272)
!1277 = !DILocalVariable(name: "seed", arg: 2, scope: !1272, file: !995, line: 220, type: !235)
!1278 = !DILocalVariable(name: "nonce", arg: 3, scope: !1272, file: !995, line: 221, type: !7)
!1279 = !DILocalVariable(name: "buf", scope: !1272, file: !995, line: 222, type: !1280)
!1280 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1536, elements: !1281)
!1281 = !{!1282}
!1282 = !DISubrange(count: 192)
!1283 = !DILocation(line: 222, column: 11, scope: !1272)
!1284 = !DILocation(line: 223, column: 3, scope: !1272)
!1285 = !DILocation(line: 224, column: 3, scope: !1272)
!1286 = !DILocation(line: 225, column: 1, scope: !1272)
!1287 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_getnoise_eta2", scope: !995, file: !995, line: 239, type: !1273, scopeLine: 240, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1288 = !DILocalVariable(name: "r", arg: 1, scope: !1287, file: !995, line: 239, type: !632)
!1289 = !DILocation(line: 0, scope: !1287)
!1290 = !DILocalVariable(name: "seed", arg: 2, scope: !1287, file: !995, line: 239, type: !235)
!1291 = !DILocalVariable(name: "nonce", arg: 3, scope: !1287, file: !995, line: 240, type: !7)
!1292 = !DILocalVariable(name: "buf", scope: !1287, file: !995, line: 241, type: !1293)
!1293 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1024, elements: !39)
!1294 = !DILocation(line: 241, column: 11, scope: !1287)
!1295 = !DILocation(line: 242, column: 3, scope: !1287)
!1296 = !DILocation(line: 243, column: 3, scope: !1287)
!1297 = !DILocation(line: 244, column: 1, scope: !1287)
!1298 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_ntt", scope: !995, file: !995, line: 256, type: !1299, scopeLine: 256, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1299 = !DISubroutineType(types: !1300)
!1300 = !{null, !632}
!1301 = !DILocalVariable(name: "r", arg: 1, scope: !1298, file: !995, line: 256, type: !632)
!1302 = !DILocation(line: 0, scope: !1298)
!1303 = !DILocation(line: 257, column: 3, scope: !1298)
!1304 = !DILocation(line: 258, column: 3, scope: !1298)
!1305 = !DILocation(line: 259, column: 1, scope: !1298)
!1306 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_reduce", scope: !995, file: !995, line: 314, type: !1299, scopeLine: 314, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1307 = !DILocalVariable(name: "r", arg: 1, scope: !1306, file: !995, line: 314, type: !632)
!1308 = !DILocation(line: 0, scope: !1306)
!1309 = !DILocalVariable(name: "i", scope: !1306, file: !995, line: 315, type: !14)
!1310 = !DILocation(line: 316, column: 8, scope: !1311)
!1311 = distinct !DILexicalBlock(scope: !1306, file: !995, line: 316, column: 3)
!1312 = !DILocation(line: 316, scope: !1311)
!1313 = !DILocation(line: 316, column: 17, scope: !1314)
!1314 = distinct !DILexicalBlock(scope: !1311, file: !995, line: 316, column: 3)
!1315 = !DILocation(line: 316, column: 3, scope: !1311)
!1316 = !DILocation(line: 317, column: 30, scope: !1314)
!1317 = !DILocation(line: 317, column: 15, scope: !1314)
!1318 = !DILocation(line: 317, column: 5, scope: !1314)
!1319 = !DILocation(line: 317, column: 13, scope: !1314)
!1320 = !DILocation(line: 316, column: 29, scope: !1314)
!1321 = !DILocation(line: 316, column: 3, scope: !1314)
!1322 = distinct !{!1322, !1315, !1323, !105}
!1323 = !DILocation(line: 317, column: 37, scope: !1311)
!1324 = !DILocation(line: 318, column: 1, scope: !1306)
!1325 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_invntt_tomont", scope: !995, file: !995, line: 271, type: !1299, scopeLine: 271, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1326 = !DILocalVariable(name: "r", arg: 1, scope: !1325, file: !995, line: 271, type: !632)
!1327 = !DILocation(line: 0, scope: !1325)
!1328 = !DILocation(line: 271, column: 36, scope: !1325)
!1329 = !DILocation(line: 271, column: 48, scope: !1325)
!1330 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_basemul_montgomery", scope: !995, file: !995, line: 282, type: !1331, scopeLine: 282, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1331 = !DISubroutineType(types: !1332)
!1332 = !{null, !632, !998, !998}
!1333 = !DILocalVariable(name: "r", arg: 1, scope: !1330, file: !995, line: 282, type: !632)
!1334 = !DILocation(line: 0, scope: !1330)
!1335 = !DILocalVariable(name: "a", arg: 2, scope: !1330, file: !995, line: 282, type: !998)
!1336 = !DILocalVariable(name: "b", arg: 3, scope: !1330, file: !995, line: 282, type: !998)
!1337 = !DILocalVariable(name: "i", scope: !1330, file: !995, line: 283, type: !14)
!1338 = !DILocation(line: 284, column: 8, scope: !1339)
!1339 = distinct !DILexicalBlock(scope: !1330, file: !995, line: 284, column: 3)
!1340 = !DILocation(line: 284, scope: !1339)
!1341 = !DILocation(line: 284, column: 17, scope: !1342)
!1342 = distinct !DILexicalBlock(scope: !1339, file: !995, line: 284, column: 3)
!1343 = !DILocation(line: 284, column: 3, scope: !1339)
!1344 = !DILocation(line: 285, column: 21, scope: !1345)
!1345 = distinct !DILexicalBlock(scope: !1342, file: !995, line: 284, column: 37)
!1346 = !DILocation(line: 285, column: 14, scope: !1345)
!1347 = !DILocation(line: 285, column: 35, scope: !1345)
!1348 = !DILocation(line: 285, column: 28, scope: !1345)
!1349 = !DILocation(line: 285, column: 49, scope: !1345)
!1350 = !DILocation(line: 285, column: 42, scope: !1345)
!1351 = !DILocation(line: 285, column: 64, scope: !1345)
!1352 = !DILocation(line: 285, column: 55, scope: !1345)
!1353 = !DILocation(line: 285, column: 5, scope: !1345)
!1354 = !DILocation(line: 286, column: 21, scope: !1345)
!1355 = !DILocation(line: 286, column: 25, scope: !1345)
!1356 = !DILocation(line: 286, column: 14, scope: !1345)
!1357 = !DILocation(line: 286, column: 39, scope: !1345)
!1358 = !DILocation(line: 286, column: 43, scope: !1345)
!1359 = !DILocation(line: 286, column: 32, scope: !1345)
!1360 = !DILocation(line: 286, column: 57, scope: !1345)
!1361 = !DILocation(line: 286, column: 61, scope: !1345)
!1362 = !DILocation(line: 286, column: 50, scope: !1345)
!1363 = !DILocation(line: 287, column: 23, scope: !1345)
!1364 = !DILocation(line: 287, column: 14, scope: !1345)
!1365 = !DILocation(line: 287, column: 13, scope: !1345)
!1366 = !DILocation(line: 286, column: 5, scope: !1345)
!1367 = !DILocation(line: 284, column: 33, scope: !1342)
!1368 = !DILocation(line: 284, column: 3, scope: !1342)
!1369 = distinct !{!1369, !1343, !1370, !105}
!1370 = !DILocation(line: 288, column: 3, scope: !1339)
!1371 = !DILocation(line: 289, column: 1, scope: !1330)
!1372 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_tomont", scope: !995, file: !995, line: 299, type: !1299, scopeLine: 299, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1373 = !DILocalVariable(name: "r", arg: 1, scope: !1372, file: !995, line: 299, type: !632)
!1374 = !DILocation(line: 0, scope: !1372)
!1375 = !DILocalVariable(name: "f", scope: !1372, file: !995, line: 301, type: !35)
!1376 = !DILocalVariable(name: "i", scope: !1372, file: !995, line: 300, type: !14)
!1377 = !DILocation(line: 302, column: 8, scope: !1378)
!1378 = distinct !DILexicalBlock(scope: !1372, file: !995, line: 302, column: 3)
!1379 = !DILocation(line: 302, scope: !1378)
!1380 = !DILocation(line: 302, column: 17, scope: !1381)
!1381 = distinct !DILexicalBlock(scope: !1378, file: !995, line: 302, column: 3)
!1382 = !DILocation(line: 302, column: 3, scope: !1378)
!1383 = !DILocation(line: 303, column: 42, scope: !1381)
!1384 = !DILocation(line: 303, column: 33, scope: !1381)
!1385 = !DILocation(line: 303, column: 50, scope: !1381)
!1386 = !DILocation(line: 303, column: 15, scope: !1381)
!1387 = !DILocation(line: 303, column: 5, scope: !1381)
!1388 = !DILocation(line: 303, column: 13, scope: !1381)
!1389 = !DILocation(line: 302, column: 29, scope: !1381)
!1390 = !DILocation(line: 302, column: 3, scope: !1381)
!1391 = distinct !{!1391, !1382, !1392, !105}
!1392 = !DILocation(line: 303, column: 53, scope: !1378)
!1393 = !DILocation(line: 304, column: 1, scope: !1372)
!1394 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_add", scope: !995, file: !995, line: 329, type: !1331, scopeLine: 329, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1395 = !DILocalVariable(name: "r", arg: 1, scope: !1394, file: !995, line: 329, type: !632)
!1396 = !DILocation(line: 0, scope: !1394)
!1397 = !DILocalVariable(name: "a", arg: 2, scope: !1394, file: !995, line: 329, type: !998)
!1398 = !DILocalVariable(name: "b", arg: 3, scope: !1394, file: !995, line: 329, type: !998)
!1399 = !DILocalVariable(name: "i", scope: !1394, file: !995, line: 330, type: !14)
!1400 = !DILocation(line: 331, column: 8, scope: !1401)
!1401 = distinct !DILexicalBlock(scope: !1394, file: !995, line: 331, column: 3)
!1402 = !DILocation(line: 331, scope: !1401)
!1403 = !DILocation(line: 331, column: 17, scope: !1404)
!1404 = distinct !DILexicalBlock(scope: !1401, file: !995, line: 331, column: 3)
!1405 = !DILocation(line: 331, column: 3, scope: !1401)
!1406 = !DILocation(line: 332, column: 15, scope: !1404)
!1407 = !DILocation(line: 332, column: 25, scope: !1404)
!1408 = !DILocation(line: 332, column: 23, scope: !1404)
!1409 = !DILocation(line: 332, column: 5, scope: !1404)
!1410 = !DILocation(line: 332, column: 13, scope: !1404)
!1411 = !DILocation(line: 331, column: 29, scope: !1404)
!1412 = !DILocation(line: 331, column: 3, scope: !1404)
!1413 = distinct !{!1413, !1405, !1414, !105}
!1414 = !DILocation(line: 332, column: 31, scope: !1401)
!1415 = !DILocation(line: 333, column: 1, scope: !1394)
!1416 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_sub", scope: !995, file: !995, line: 344, type: !1331, scopeLine: 344, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1417 = !DILocalVariable(name: "r", arg: 1, scope: !1416, file: !995, line: 344, type: !632)
!1418 = !DILocation(line: 0, scope: !1416)
!1419 = !DILocalVariable(name: "a", arg: 2, scope: !1416, file: !995, line: 344, type: !998)
!1420 = !DILocalVariable(name: "b", arg: 3, scope: !1416, file: !995, line: 344, type: !998)
!1421 = !DILocalVariable(name: "i", scope: !1416, file: !995, line: 345, type: !14)
!1422 = !DILocation(line: 346, column: 8, scope: !1423)
!1423 = distinct !DILexicalBlock(scope: !1416, file: !995, line: 346, column: 3)
!1424 = !DILocation(line: 346, scope: !1423)
!1425 = !DILocation(line: 346, column: 17, scope: !1426)
!1426 = distinct !DILexicalBlock(scope: !1423, file: !995, line: 346, column: 3)
!1427 = !DILocation(line: 346, column: 3, scope: !1423)
!1428 = !DILocation(line: 347, column: 15, scope: !1426)
!1429 = !DILocation(line: 347, column: 25, scope: !1426)
!1430 = !DILocation(line: 347, column: 23, scope: !1426)
!1431 = !DILocation(line: 347, column: 5, scope: !1426)
!1432 = !DILocation(line: 347, column: 13, scope: !1426)
!1433 = !DILocation(line: 346, column: 29, scope: !1426)
!1434 = !DILocation(line: 346, column: 3, scope: !1426)
!1435 = distinct !{!1435, !1427, !1436, !105}
!1436 = !DILocation(line: 347, column: 31, scope: !1423)
!1437 = !DILocation(line: 348, column: 1, scope: !1416)
!1438 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_ntt", scope: !33, file: !33, line: 80, type: !1439, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, retainedNodes: !24)
!1439 = !DISubroutineType(types: !1440)
!1440 = !{null, !401}
!1441 = !DILocalVariable(name: "r", arg: 1, scope: !1438, file: !33, line: 80, type: !401)
!1442 = !DILocation(line: 0, scope: !1438)
!1443 = !DILocalVariable(name: "k", scope: !1438, file: !33, line: 81, type: !14)
!1444 = !DILocalVariable(name: "len", scope: !1438, file: !33, line: 81, type: !14)
!1445 = !DILocation(line: 85, column: 7, scope: !1446)
!1446 = distinct !DILexicalBlock(scope: !1438, file: !33, line: 85, column: 3)
!1447 = !DILocation(line: 85, scope: !1446)
!1448 = !DILocation(line: 84, column: 5, scope: !1438)
!1449 = !DILocation(line: 85, column: 22, scope: !1450)
!1450 = distinct !DILexicalBlock(scope: !1446, file: !33, line: 85, column: 3)
!1451 = !DILocation(line: 85, column: 3, scope: !1446)
!1452 = !DILocation(line: 86, column: 5, scope: !1453)
!1453 = distinct !DILexicalBlock(scope: !1454, file: !33, line: 86, column: 5)
!1454 = distinct !DILexicalBlock(scope: !1450, file: !33, line: 85, column: 39)
!1455 = !DILocation(line: 86, scope: !1453)
!1456 = !DILocalVariable(name: "start", scope: !1438, file: !33, line: 81, type: !14)
!1457 = !DILocation(line: 86, column: 26, scope: !1458)
!1458 = distinct !DILexicalBlock(scope: !1453, file: !33, line: 86, column: 5)
!1459 = !DILocation(line: 87, column: 14, scope: !1460)
!1460 = distinct !DILexicalBlock(scope: !1458, file: !33, line: 86, column: 50)
!1461 = !DILocalVariable(name: "zeta", scope: !1438, file: !33, line: 82, type: !36)
!1462 = !DILocalVariable(name: "j", scope: !1438, file: !33, line: 81, type: !14)
!1463 = !DILocation(line: 88, column: 11, scope: !1464)
!1464 = distinct !DILexicalBlock(scope: !1460, file: !33, line: 88, column: 7)
!1465 = !DILocation(line: 88, scope: !1464)
!1466 = !DILocation(line: 88, column: 32, scope: !1467)
!1467 = distinct !DILexicalBlock(scope: !1464, file: !33, line: 88, column: 7)
!1468 = !DILocation(line: 88, column: 24, scope: !1467)
!1469 = !DILocation(line: 88, column: 7, scope: !1464)
!1470 = !DILocation(line: 89, column: 25, scope: !1471)
!1471 = distinct !DILexicalBlock(scope: !1467, file: !33, line: 88, column: 44)
!1472 = !DILocation(line: 89, column: 13, scope: !1471)
!1473 = !DILocalVariable(name: "t", scope: !1438, file: !33, line: 82, type: !36)
!1474 = !DILocation(line: 90, column: 22, scope: !1471)
!1475 = !DILocation(line: 90, column: 27, scope: !1471)
!1476 = !DILocation(line: 90, column: 9, scope: !1471)
!1477 = !DILocation(line: 90, column: 20, scope: !1471)
!1478 = !DILocation(line: 91, column: 16, scope: !1471)
!1479 = !DILocation(line: 91, column: 21, scope: !1471)
!1480 = !DILocation(line: 91, column: 9, scope: !1471)
!1481 = !DILocation(line: 91, column: 14, scope: !1471)
!1482 = !DILocation(line: 88, column: 40, scope: !1467)
!1483 = !DILocation(line: 88, column: 7, scope: !1467)
!1484 = distinct !{!1484, !1469, !1485, !105}
!1485 = !DILocation(line: 92, column: 7, scope: !1464)
!1486 = !DILocation(line: 87, column: 21, scope: !1460)
!1487 = !DILocation(line: 86, column: 43, scope: !1458)
!1488 = !DILocation(line: 86, column: 5, scope: !1458)
!1489 = distinct !{!1489, !1452, !1490, !105}
!1490 = !DILocation(line: 93, column: 5, scope: !1453)
!1491 = !DILocation(line: 85, column: 32, scope: !1450)
!1492 = !DILocation(line: 85, column: 3, scope: !1450)
!1493 = distinct !{!1493, !1451, !1494, !105}
!1494 = !DILocation(line: 94, column: 3, scope: !1446)
!1495 = !DILocation(line: 95, column: 1, scope: !1438)
!1496 = distinct !DISubprogram(name: "fqmul", scope: !33, file: !33, line: 68, type: !1497, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !28, retainedNodes: !24)
!1497 = !DISubroutineType(types: !1498)
!1498 = !{!36, !36, !36}
!1499 = !DILocalVariable(name: "a", arg: 1, scope: !1496, file: !33, line: 68, type: !36)
!1500 = !DILocation(line: 0, scope: !1496)
!1501 = !DILocalVariable(name: "b", arg: 2, scope: !1496, file: !33, line: 68, type: !36)
!1502 = !DILocation(line: 69, column: 28, scope: !1496)
!1503 = !DILocation(line: 69, column: 39, scope: !1496)
!1504 = !DILocation(line: 69, column: 38, scope: !1496)
!1505 = !DILocation(line: 69, column: 10, scope: !1496)
!1506 = !DILocation(line: 69, column: 3, scope: !1496)
!1507 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_invntt", scope: !33, file: !33, line: 106, type: !1439, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, retainedNodes: !24)
!1508 = !DILocalVariable(name: "r", arg: 1, scope: !1507, file: !33, line: 106, type: !401)
!1509 = !DILocation(line: 0, scope: !1507)
!1510 = !DILocalVariable(name: "f", scope: !1507, file: !33, line: 109, type: !35)
!1511 = !DILocalVariable(name: "k", scope: !1507, file: !33, line: 107, type: !14)
!1512 = !DILocalVariable(name: "len", scope: !1507, file: !33, line: 107, type: !14)
!1513 = !DILocation(line: 112, column: 7, scope: !1514)
!1514 = distinct !DILexicalBlock(scope: !1507, file: !33, line: 112, column: 3)
!1515 = !DILocation(line: 112, scope: !1514)
!1516 = !DILocation(line: 111, column: 5, scope: !1507)
!1517 = !DILocation(line: 112, column: 20, scope: !1518)
!1518 = distinct !DILexicalBlock(scope: !1514, file: !33, line: 112, column: 3)
!1519 = !DILocation(line: 112, column: 3, scope: !1514)
!1520 = !DILocation(line: 113, column: 5, scope: !1521)
!1521 = distinct !DILexicalBlock(scope: !1522, file: !33, line: 113, column: 5)
!1522 = distinct !DILexicalBlock(scope: !1518, file: !33, line: 112, column: 39)
!1523 = !DILocation(line: 124, column: 3, scope: !1524)
!1524 = distinct !DILexicalBlock(scope: !1507, file: !33, line: 124, column: 3)
!1525 = !DILocation(line: 113, scope: !1521)
!1526 = !DILocalVariable(name: "start", scope: !1507, file: !33, line: 107, type: !14)
!1527 = !DILocation(line: 113, column: 26, scope: !1528)
!1528 = distinct !DILexicalBlock(scope: !1521, file: !33, line: 113, column: 5)
!1529 = !DILocation(line: 114, column: 14, scope: !1530)
!1530 = distinct !DILexicalBlock(scope: !1528, file: !33, line: 113, column: 50)
!1531 = !DILocalVariable(name: "zeta", scope: !1507, file: !33, line: 108, type: !36)
!1532 = !DILocalVariable(name: "j", scope: !1507, file: !33, line: 107, type: !14)
!1533 = !DILocation(line: 115, column: 11, scope: !1534)
!1534 = distinct !DILexicalBlock(scope: !1530, file: !33, line: 115, column: 7)
!1535 = !DILocation(line: 115, scope: !1534)
!1536 = !DILocation(line: 115, column: 32, scope: !1537)
!1537 = distinct !DILexicalBlock(scope: !1534, file: !33, line: 115, column: 7)
!1538 = !DILocation(line: 115, column: 24, scope: !1537)
!1539 = !DILocation(line: 115, column: 7, scope: !1534)
!1540 = !DILocation(line: 116, column: 13, scope: !1541)
!1541 = distinct !DILexicalBlock(scope: !1537, file: !33, line: 115, column: 44)
!1542 = !DILocalVariable(name: "t", scope: !1507, file: !33, line: 108, type: !36)
!1543 = !DILocation(line: 117, column: 35, scope: !1541)
!1544 = !DILocation(line: 117, column: 33, scope: !1541)
!1545 = !DILocation(line: 117, column: 16, scope: !1541)
!1546 = !DILocation(line: 117, column: 9, scope: !1541)
!1547 = !DILocation(line: 117, column: 14, scope: !1541)
!1548 = !DILocation(line: 118, column: 22, scope: !1541)
!1549 = !DILocation(line: 118, column: 33, scope: !1541)
!1550 = !DILocation(line: 118, column: 9, scope: !1541)
!1551 = !DILocation(line: 118, column: 20, scope: !1541)
!1552 = !DILocation(line: 119, column: 34, scope: !1541)
!1553 = !DILocation(line: 119, column: 22, scope: !1541)
!1554 = !DILocation(line: 119, column: 9, scope: !1541)
!1555 = !DILocation(line: 119, column: 20, scope: !1541)
!1556 = !DILocation(line: 115, column: 40, scope: !1537)
!1557 = !DILocation(line: 115, column: 7, scope: !1537)
!1558 = distinct !{!1558, !1539, !1559, !105}
!1559 = !DILocation(line: 120, column: 7, scope: !1534)
!1560 = !DILocation(line: 114, column: 21, scope: !1530)
!1561 = !DILocation(line: 113, column: 43, scope: !1528)
!1562 = !DILocation(line: 113, column: 5, scope: !1528)
!1563 = distinct !{!1563, !1520, !1564, !105}
!1564 = !DILocation(line: 121, column: 5, scope: !1521)
!1565 = !DILocation(line: 112, column: 32, scope: !1518)
!1566 = !DILocation(line: 112, column: 3, scope: !1518)
!1567 = distinct !{!1567, !1519, !1568, !105}
!1568 = !DILocation(line: 122, column: 3, scope: !1514)
!1569 = !DILocation(line: 124, scope: !1524)
!1570 = !DILocation(line: 124, column: 16, scope: !1571)
!1571 = distinct !DILexicalBlock(scope: !1524, file: !33, line: 124, column: 3)
!1572 = !DILocation(line: 125, column: 18, scope: !1571)
!1573 = !DILocation(line: 125, column: 12, scope: !1571)
!1574 = !DILocation(line: 125, column: 5, scope: !1571)
!1575 = !DILocation(line: 125, column: 10, scope: !1571)
!1576 = !DILocation(line: 124, column: 24, scope: !1571)
!1577 = !DILocation(line: 124, column: 3, scope: !1571)
!1578 = distinct !{!1578, !1523, !1579, !105}
!1579 = !DILocation(line: 125, column: 25, scope: !1524)
!1580 = !DILocation(line: 126, column: 1, scope: !1507)
!1581 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_basemul", scope: !33, file: !33, line: 139, type: !1582, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, retainedNodes: !24)
!1582 = !DISubroutineType(types: !1583)
!1583 = !{null, !401, !1584, !1584, !36}
!1584 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 32)
!1585 = !DILocalVariable(name: "r", arg: 1, scope: !1581, file: !33, line: 139, type: !401)
!1586 = !DILocation(line: 0, scope: !1581)
!1587 = !DILocalVariable(name: "a", arg: 2, scope: !1581, file: !33, line: 139, type: !1584)
!1588 = !DILocalVariable(name: "b", arg: 3, scope: !1581, file: !33, line: 139, type: !1584)
!1589 = !DILocalVariable(name: "zeta", arg: 4, scope: !1581, file: !33, line: 139, type: !36)
!1590 = !DILocation(line: 141, column: 17, scope: !1581)
!1591 = !DILocation(line: 141, column: 23, scope: !1581)
!1592 = !DILocation(line: 141, column: 11, scope: !1581)
!1593 = !DILocation(line: 141, column: 9, scope: !1581)
!1594 = !DILocation(line: 142, column: 11, scope: !1581)
!1595 = !DILocation(line: 142, column: 9, scope: !1581)
!1596 = !DILocation(line: 143, column: 17, scope: !1581)
!1597 = !DILocation(line: 143, column: 23, scope: !1581)
!1598 = !DILocation(line: 143, column: 11, scope: !1581)
!1599 = !DILocation(line: 143, column: 8, scope: !1581)
!1600 = !DILocation(line: 144, column: 17, scope: !1581)
!1601 = !DILocation(line: 144, column: 23, scope: !1581)
!1602 = !DILocation(line: 144, column: 11, scope: !1581)
!1603 = !DILocation(line: 144, column: 3, scope: !1581)
!1604 = !DILocation(line: 144, column: 9, scope: !1581)
!1605 = !DILocation(line: 145, column: 17, scope: !1581)
!1606 = !DILocation(line: 145, column: 23, scope: !1581)
!1607 = !DILocation(line: 145, column: 11, scope: !1581)
!1608 = !DILocation(line: 145, column: 3, scope: !1581)
!1609 = !DILocation(line: 145, column: 8, scope: !1581)
!1610 = !DILocation(line: 146, column: 1, scope: !1581)
!1611 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_cbd_eta1", scope: !1612, file: !1612, line: 105, type: !1070, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !69, retainedNodes: !24)
!1612 = !DIFile(filename: "../../../ref/cbd.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!1613 = !DILocalVariable(name: "r", arg: 1, scope: !1611, file: !1612, line: 105, type: !632)
!1614 = !DILocation(line: 0, scope: !1611)
!1615 = !DILocalVariable(name: "buf", arg: 2, scope: !1611, file: !1612, line: 105, type: !235)
!1616 = !DILocation(line: 109, column: 3, scope: !1611)
!1617 = !DILocation(line: 113, column: 1, scope: !1611)
!1618 = distinct !DISubprogram(name: "cbd3", scope: !1612, file: !1612, line: 85, type: !1070, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !69, retainedNodes: !24)
!1619 = !DILocalVariable(name: "r", arg: 1, scope: !1618, file: !1612, line: 85, type: !632)
!1620 = !DILocation(line: 0, scope: !1618)
!1621 = !DILocalVariable(name: "buf", arg: 2, scope: !1618, file: !1612, line: 85, type: !235)
!1622 = !DILocalVariable(name: "i", scope: !1618, file: !1612, line: 86, type: !14)
!1623 = !DILocation(line: 90, column: 8, scope: !1624)
!1624 = distinct !DILexicalBlock(scope: !1618, file: !1612, line: 90, column: 3)
!1625 = !DILocation(line: 90, scope: !1624)
!1626 = !DILocation(line: 90, column: 17, scope: !1627)
!1627 = distinct !DILexicalBlock(scope: !1624, file: !1612, line: 90, column: 3)
!1628 = !DILocation(line: 90, column: 3, scope: !1624)
!1629 = !DILocation(line: 91, column: 37, scope: !1630)
!1630 = distinct !DILexicalBlock(scope: !1627, file: !1612, line: 90, column: 37)
!1631 = !DILocation(line: 91, column: 33, scope: !1630)
!1632 = !DILocation(line: 91, column: 9, scope: !1630)
!1633 = !DILocalVariable(name: "t", scope: !1618, file: !1612, line: 87, type: !65)
!1634 = !DILocation(line: 92, column: 11, scope: !1630)
!1635 = !DILocalVariable(name: "d", scope: !1618, file: !1612, line: 87, type: !65)
!1636 = !DILocation(line: 93, column: 13, scope: !1630)
!1637 = !DILocation(line: 93, column: 19, scope: !1630)
!1638 = !DILocation(line: 93, column: 7, scope: !1630)
!1639 = !DILocation(line: 94, column: 13, scope: !1630)
!1640 = !DILocation(line: 94, column: 19, scope: !1630)
!1641 = !DILocation(line: 94, column: 7, scope: !1630)
!1642 = !DILocalVariable(name: "j", scope: !1618, file: !1612, line: 86, type: !14)
!1643 = !DILocation(line: 96, column: 10, scope: !1644)
!1644 = distinct !DILexicalBlock(scope: !1630, file: !1612, line: 96, column: 5)
!1645 = !DILocation(line: 96, scope: !1644)
!1646 = !DILocation(line: 96, column: 19, scope: !1647)
!1647 = distinct !DILexicalBlock(scope: !1644, file: !1612, line: 96, column: 5)
!1648 = !DILocation(line: 96, column: 5, scope: !1644)
!1649 = !DILocation(line: 97, column: 20, scope: !1650)
!1650 = distinct !DILexicalBlock(scope: !1647, file: !1612, line: 96, column: 29)
!1651 = !DILocation(line: 97, column: 14, scope: !1650)
!1652 = !DILocation(line: 97, column: 11, scope: !1650)
!1653 = !DILocalVariable(name: "a", scope: !1618, file: !1612, line: 88, type: !36)
!1654 = !DILocation(line: 98, column: 20, scope: !1650)
!1655 = !DILocation(line: 98, column: 24, scope: !1650)
!1656 = !DILocation(line: 98, column: 14, scope: !1650)
!1657 = !DILocation(line: 98, column: 11, scope: !1650)
!1658 = !DILocalVariable(name: "b", scope: !1618, file: !1612, line: 88, type: !36)
!1659 = !DILocation(line: 99, column: 27, scope: !1650)
!1660 = !DILocation(line: 99, column: 25, scope: !1650)
!1661 = !DILocation(line: 99, column: 14, scope: !1650)
!1662 = !DILocation(line: 99, column: 18, scope: !1650)
!1663 = !DILocation(line: 99, column: 7, scope: !1650)
!1664 = !DILocation(line: 99, column: 23, scope: !1650)
!1665 = !DILocation(line: 96, column: 25, scope: !1647)
!1666 = !DILocation(line: 96, column: 5, scope: !1647)
!1667 = distinct !{!1667, !1648, !1668, !105}
!1668 = !DILocation(line: 100, column: 5, scope: !1644)
!1669 = !DILocation(line: 90, column: 33, scope: !1627)
!1670 = !DILocation(line: 90, column: 3, scope: !1627)
!1671 = distinct !{!1671, !1628, !1672, !105}
!1672 = !DILocation(line: 101, column: 3, scope: !1624)
!1673 = !DILocation(line: 102, column: 1, scope: !1618)
!1674 = distinct !DISubprogram(name: "load24_littleendian", scope: !1612, file: !1612, line: 36, type: !1675, scopeLine: 36, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !69, retainedNodes: !24)
!1675 = !DISubroutineType(types: !1676)
!1676 = !{!65, !235}
!1677 = !DILocalVariable(name: "x", arg: 1, scope: !1674, file: !1612, line: 36, type: !235)
!1678 = !DILocation(line: 0, scope: !1674)
!1679 = !DILocation(line: 38, column: 17, scope: !1674)
!1680 = !DILocation(line: 38, column: 7, scope: !1674)
!1681 = !DILocalVariable(name: "r", scope: !1674, file: !1612, line: 37, type: !65)
!1682 = !DILocation(line: 39, column: 18, scope: !1674)
!1683 = !DILocation(line: 39, column: 8, scope: !1674)
!1684 = !DILocation(line: 39, column: 23, scope: !1674)
!1685 = !DILocation(line: 39, column: 5, scope: !1674)
!1686 = !DILocation(line: 40, column: 18, scope: !1674)
!1687 = !DILocation(line: 40, column: 8, scope: !1674)
!1688 = !DILocation(line: 40, column: 23, scope: !1674)
!1689 = !DILocation(line: 40, column: 5, scope: !1674)
!1690 = !DILocation(line: 41, column: 3, scope: !1674)
!1691 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_cbd_eta2", scope: !1612, file: !1612, line: 115, type: !1070, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !69, retainedNodes: !24)
!1692 = !DILocalVariable(name: "r", arg: 1, scope: !1691, file: !1612, line: 115, type: !632)
!1693 = !DILocation(line: 0, scope: !1691)
!1694 = !DILocalVariable(name: "buf", arg: 2, scope: !1691, file: !1612, line: 115, type: !235)
!1695 = !DILocation(line: 117, column: 3, scope: !1691)
!1696 = !DILocation(line: 121, column: 1, scope: !1691)
!1697 = distinct !DISubprogram(name: "cbd2", scope: !1612, file: !1612, line: 55, type: !1070, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !69, retainedNodes: !24)
!1698 = !DILocalVariable(name: "r", arg: 1, scope: !1697, file: !1612, line: 55, type: !632)
!1699 = !DILocation(line: 0, scope: !1697)
!1700 = !DILocalVariable(name: "buf", arg: 2, scope: !1697, file: !1612, line: 55, type: !235)
!1701 = !DILocalVariable(name: "i", scope: !1697, file: !1612, line: 56, type: !14)
!1702 = !DILocation(line: 60, column: 8, scope: !1703)
!1703 = distinct !DILexicalBlock(scope: !1697, file: !1612, line: 60, column: 3)
!1704 = !DILocation(line: 60, scope: !1703)
!1705 = !DILocation(line: 60, column: 17, scope: !1706)
!1706 = distinct !DILexicalBlock(scope: !1703, file: !1612, line: 60, column: 3)
!1707 = !DILocation(line: 60, column: 3, scope: !1703)
!1708 = !DILocation(line: 61, column: 37, scope: !1709)
!1709 = distinct !DILexicalBlock(scope: !1706, file: !1612, line: 60, column: 37)
!1710 = !DILocation(line: 61, column: 33, scope: !1709)
!1711 = !DILocation(line: 61, column: 9, scope: !1709)
!1712 = !DILocalVariable(name: "t", scope: !1697, file: !1612, line: 57, type: !65)
!1713 = !DILocation(line: 62, column: 11, scope: !1709)
!1714 = !DILocalVariable(name: "d", scope: !1697, file: !1612, line: 57, type: !65)
!1715 = !DILocation(line: 63, column: 13, scope: !1709)
!1716 = !DILocation(line: 63, column: 19, scope: !1709)
!1717 = !DILocation(line: 63, column: 7, scope: !1709)
!1718 = !DILocalVariable(name: "j", scope: !1697, file: !1612, line: 56, type: !14)
!1719 = !DILocation(line: 65, column: 10, scope: !1720)
!1720 = distinct !DILexicalBlock(scope: !1709, file: !1612, line: 65, column: 5)
!1721 = !DILocation(line: 65, scope: !1720)
!1722 = !DILocation(line: 65, column: 19, scope: !1723)
!1723 = distinct !DILexicalBlock(scope: !1720, file: !1612, line: 65, column: 5)
!1724 = !DILocation(line: 65, column: 5, scope: !1720)
!1725 = !DILocation(line: 66, column: 20, scope: !1726)
!1726 = distinct !DILexicalBlock(scope: !1723, file: !1612, line: 65, column: 29)
!1727 = !DILocation(line: 66, column: 14, scope: !1726)
!1728 = !DILocation(line: 66, column: 11, scope: !1726)
!1729 = !DILocalVariable(name: "a", scope: !1697, file: !1612, line: 58, type: !36)
!1730 = !DILocation(line: 67, column: 20, scope: !1726)
!1731 = !DILocation(line: 67, column: 24, scope: !1726)
!1732 = !DILocation(line: 67, column: 14, scope: !1726)
!1733 = !DILocation(line: 67, column: 11, scope: !1726)
!1734 = !DILocalVariable(name: "b", scope: !1697, file: !1612, line: 58, type: !36)
!1735 = !DILocation(line: 68, column: 27, scope: !1726)
!1736 = !DILocation(line: 68, column: 25, scope: !1726)
!1737 = !DILocation(line: 68, column: 14, scope: !1726)
!1738 = !DILocation(line: 68, column: 18, scope: !1726)
!1739 = !DILocation(line: 68, column: 7, scope: !1726)
!1740 = !DILocation(line: 68, column: 23, scope: !1726)
!1741 = !DILocation(line: 65, column: 25, scope: !1723)
!1742 = !DILocation(line: 65, column: 5, scope: !1723)
!1743 = distinct !{!1743, !1724, !1744, !105}
!1744 = !DILocation(line: 69, column: 5, scope: !1720)
!1745 = !DILocation(line: 60, column: 33, scope: !1706)
!1746 = !DILocation(line: 60, column: 3, scope: !1706)
!1747 = distinct !{!1747, !1707, !1748, !105}
!1748 = !DILocation(line: 70, column: 3, scope: !1703)
!1749 = !DILocation(line: 71, column: 1, scope: !1697)
!1750 = distinct !DISubprogram(name: "load32_littleendian", scope: !1612, file: !1612, line: 15, type: !1675, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !69, retainedNodes: !24)
!1751 = !DILocalVariable(name: "x", arg: 1, scope: !1750, file: !1612, line: 15, type: !235)
!1752 = !DILocation(line: 0, scope: !1750)
!1753 = !DILocation(line: 17, column: 17, scope: !1750)
!1754 = !DILocation(line: 17, column: 7, scope: !1750)
!1755 = !DILocalVariable(name: "r", scope: !1750, file: !1612, line: 16, type: !65)
!1756 = !DILocation(line: 18, column: 18, scope: !1750)
!1757 = !DILocation(line: 18, column: 8, scope: !1750)
!1758 = !DILocation(line: 18, column: 23, scope: !1750)
!1759 = !DILocation(line: 18, column: 5, scope: !1750)
!1760 = !DILocation(line: 19, column: 18, scope: !1750)
!1761 = !DILocation(line: 19, column: 8, scope: !1750)
!1762 = !DILocation(line: 19, column: 23, scope: !1750)
!1763 = !DILocation(line: 19, column: 5, scope: !1750)
!1764 = !DILocation(line: 20, column: 18, scope: !1750)
!1765 = !DILocation(line: 20, column: 8, scope: !1750)
!1766 = !DILocation(line: 20, column: 23, scope: !1750)
!1767 = !DILocation(line: 20, column: 5, scope: !1750)
!1768 = !DILocation(line: 21, column: 3, scope: !1750)
!1769 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_montgomery_reduce", scope: !1770, file: !1770, line: 16, type: !1771, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !71, retainedNodes: !24)
!1770 = !DIFile(filename: "../../../ref/reduce.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!1771 = !DISubroutineType(types: !72)
!1772 = !DILocalVariable(name: "a", arg: 1, scope: !1769, file: !1770, line: 16, type: !30)
!1773 = !DILocation(line: 0, scope: !1769)
!1774 = !DILocalVariable(name: "t", scope: !1769, file: !1770, line: 18, type: !36)
!1775 = !DILocation(line: 21, column: 12, scope: !1769)
!1776 = !DILocation(line: 21, column: 22, scope: !1769)
!1777 = !DILocation(line: 21, column: 10, scope: !1769)
!1778 = !DILocation(line: 21, column: 32, scope: !1769)
!1779 = !DILocation(line: 21, column: 7, scope: !1769)
!1780 = !DILocation(line: 22, column: 3, scope: !1769)
!1781 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_barrett_reduce", scope: !1770, file: !1770, line: 35, type: !1782, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !71, retainedNodes: !24)
!1782 = !DISubroutineType(types: !1783)
!1783 = !{!36, !36}
!1784 = !DILocalVariable(name: "a", arg: 1, scope: !1781, file: !1770, line: 35, type: !36)
!1785 = !DILocation(line: 0, scope: !1781)
!1786 = !DILocalVariable(name: "v", scope: !1781, file: !1770, line: 37, type: !35)
!1787 = !DILocation(line: 39, column: 20, scope: !1781)
!1788 = !DILocation(line: 39, column: 19, scope: !1781)
!1789 = !DILocation(line: 39, column: 22, scope: !1781)
!1790 = !DILocation(line: 39, column: 33, scope: !1781)
!1791 = !DILocalVariable(name: "t", scope: !1781, file: !1770, line: 36, type: !36)
!1792 = !DILocation(line: 41, column: 10, scope: !1781)
!1793 = !DILocation(line: 41, column: 3, scope: !1781)
!1794 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_verify", scope: !1795, file: !1795, line: 16, type: !1796, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !73, retainedNodes: !24)
!1795 = !DIFile(filename: "../../../ref/verify.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!1796 = !DISubroutineType(types: !1797)
!1797 = !{!25, !235, !235, !12}
!1798 = !DILocalVariable(name: "a", arg: 1, scope: !1794, file: !1795, line: 16, type: !235)
!1799 = !DILocation(line: 0, scope: !1794)
!1800 = !DILocalVariable(name: "b", arg: 2, scope: !1794, file: !1795, line: 16, type: !235)
!1801 = !DILocalVariable(name: "len", arg: 3, scope: !1794, file: !1795, line: 16, type: !12)
!1802 = !DILocalVariable(name: "r", scope: !1794, file: !1795, line: 19, type: !7)
!1803 = !DILocalVariable(name: "i", scope: !1794, file: !1795, line: 18, type: !12)
!1804 = !DILocation(line: 21, column: 7, scope: !1805)
!1805 = distinct !DILexicalBlock(scope: !1794, file: !1795, line: 21, column: 3)
!1806 = !DILocation(line: 21, scope: !1805)
!1807 = !DILocation(line: 21, column: 12, scope: !1808)
!1808 = distinct !DILexicalBlock(scope: !1805, file: !1795, line: 21, column: 3)
!1809 = !DILocation(line: 21, column: 3, scope: !1805)
!1810 = !DILocation(line: 22, column: 10, scope: !1808)
!1811 = !DILocation(line: 22, column: 17, scope: !1808)
!1812 = !DILocation(line: 22, column: 15, scope: !1808)
!1813 = !DILocation(line: 22, column: 7, scope: !1808)
!1814 = !DILocation(line: 21, column: 18, scope: !1808)
!1815 = !DILocation(line: 21, column: 3, scope: !1808)
!1816 = distinct !{!1816, !1809, !1817, !105}
!1817 = !DILocation(line: 22, column: 20, scope: !1805)
!1818 = !DILocation(line: 24, column: 25, scope: !1794)
!1819 = !DILocation(line: 24, column: 10, scope: !1794)
!1820 = !DILocation(line: 24, column: 3, scope: !1794)
!1821 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_cmov", scope: !1795, file: !1795, line: 40, type: !1822, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !73, retainedNodes: !24)
!1822 = !DISubroutineType(types: !1823)
!1823 = !{null, !6, !235, !12, !7}
!1824 = !DILocalVariable(name: "r", arg: 1, scope: !1821, file: !1795, line: 40, type: !6)
!1825 = !DILocation(line: 0, scope: !1821)
!1826 = !DILocalVariable(name: "x", arg: 2, scope: !1821, file: !1795, line: 40, type: !235)
!1827 = !DILocalVariable(name: "len", arg: 3, scope: !1821, file: !1795, line: 40, type: !12)
!1828 = !DILocalVariable(name: "b", arg: 4, scope: !1821, file: !1795, line: 40, type: !7)
!1829 = !DILocation(line: 51, column: 3, scope: !1821)
!1830 = !{i64 1722}
!1831 = !DILocation(line: 54, column: 7, scope: !1821)
!1832 = !DILocalVariable(name: "i", scope: !1821, file: !1795, line: 42, type: !12)
!1833 = !DILocation(line: 55, column: 7, scope: !1834)
!1834 = distinct !DILexicalBlock(scope: !1821, file: !1795, line: 55, column: 3)
!1835 = !DILocation(line: 55, scope: !1834)
!1836 = !DILocation(line: 55, column: 12, scope: !1837)
!1837 = distinct !DILexicalBlock(scope: !1834, file: !1795, line: 55, column: 3)
!1838 = !DILocation(line: 55, column: 3, scope: !1834)
!1839 = !DILocation(line: 56, column: 18, scope: !1837)
!1840 = !DILocation(line: 56, column: 25, scope: !1837)
!1841 = !DILocation(line: 56, column: 23, scope: !1837)
!1842 = !DILocation(line: 56, column: 15, scope: !1837)
!1843 = !DILocation(line: 56, column: 5, scope: !1837)
!1844 = !DILocation(line: 56, column: 10, scope: !1837)
!1845 = !DILocation(line: 55, column: 18, scope: !1837)
!1846 = !DILocation(line: 55, column: 3, scope: !1837)
!1847 = distinct !{!1847, !1838, !1848, !105}
!1848 = !DILocation(line: 56, column: 29, scope: !1834)
!1849 = !DILocation(line: 57, column: 1, scope: !1821)
!1850 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_cmov_int16", scope: !1795, file: !1795, line: 71, type: !1851, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !73, retainedNodes: !24)
!1851 = !DISubroutineType(types: !1852)
!1852 = !{null, !401, !36, !60}
!1853 = !DILocalVariable(name: "r", arg: 1, scope: !1850, file: !1795, line: 71, type: !401)
!1854 = !DILocation(line: 0, scope: !1850)
!1855 = !DILocalVariable(name: "v", arg: 2, scope: !1850, file: !1795, line: 71, type: !36)
!1856 = !DILocalVariable(name: "b", arg: 3, scope: !1850, file: !1795, line: 71, type: !60)
!1857 = !DILocation(line: 73, column: 7, scope: !1850)
!1858 = !DILocation(line: 74, column: 15, scope: !1850)
!1859 = !DILocation(line: 74, column: 19, scope: !1850)
!1860 = !DILocation(line: 74, column: 11, scope: !1850)
!1861 = !DILocation(line: 74, column: 6, scope: !1850)
!1862 = !DILocation(line: 75, column: 1, scope: !1850)
!1863 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_init", scope: !49, file: !49, line: 497, type: !1864, scopeLine: 497, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!1864 = !DISubroutineType(types: !1865)
!1865 = !{null, !1866}
!1866 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !347, size: 32)
!1867 = !DILocalVariable(name: "state", arg: 1, scope: !1863, file: !49, line: 497, type: !1866)
!1868 = !DILocation(line: 0, scope: !1863)
!1869 = !DILocation(line: 498, column: 3, scope: !1863)
!1870 = !DILocation(line: 499, column: 3, scope: !1863)
!1871 = !DILocation(line: 499, column: 29, scope: !1863)
!1872 = !DILocation(line: 500, column: 1, scope: !1863)
!1873 = distinct !DISubprogram(name: "keccak_init", scope: !49, file: !49, line: 340, type: !1874, scopeLine: 340, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!1874 = !DISubroutineType(types: !1875)
!1875 = !{null, !1876}
!1876 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 32)
!1877 = !DILocalVariable(name: "s", arg: 1, scope: !1873, file: !49, line: 340, type: !1876)
!1878 = !DILocation(line: 0, scope: !1873)
!1879 = !DILocalVariable(name: "i", scope: !1873, file: !49, line: 341, type: !14)
!1880 = !DILocation(line: 342, column: 8, scope: !1881)
!1881 = distinct !DILexicalBlock(scope: !1873, file: !49, line: 342, column: 3)
!1882 = !DILocation(line: 342, scope: !1881)
!1883 = !DILocation(line: 342, column: 17, scope: !1884)
!1884 = distinct !DILexicalBlock(scope: !1881, file: !49, line: 342, column: 3)
!1885 = !DILocation(line: 342, column: 3, scope: !1881)
!1886 = !DILocation(line: 343, column: 5, scope: !1884)
!1887 = !DILocation(line: 343, column: 10, scope: !1884)
!1888 = !DILocation(line: 342, column: 24, scope: !1884)
!1889 = !DILocation(line: 342, column: 3, scope: !1884)
!1890 = distinct !{!1890, !1885, !1891, !105}
!1891 = !DILocation(line: 343, column: 12, scope: !1881)
!1892 = !DILocation(line: 344, column: 1, scope: !1873)
!1893 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb", scope: !49, file: !49, line: 512, type: !1894, scopeLine: 512, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!1894 = !DISubroutineType(types: !1895)
!1895 = !{null, !1866, !235, !12}
!1896 = !DILocalVariable(name: "state", arg: 1, scope: !1893, file: !49, line: 512, type: !1866)
!1897 = !DILocation(line: 0, scope: !1893)
!1898 = !DILocalVariable(name: "in", arg: 2, scope: !1893, file: !49, line: 512, type: !235)
!1899 = !DILocalVariable(name: "inlen", arg: 3, scope: !1893, file: !49, line: 512, type: !12)
!1900 = !DILocation(line: 513, column: 53, scope: !1893)
!1901 = !DILocation(line: 513, column: 31, scope: !1893)
!1902 = !DILocation(line: 513, column: 3, scope: !1893)
!1903 = !DILocation(line: 513, column: 29, scope: !1893)
!1904 = !DILocation(line: 515, column: 1, scope: !1893)
!1905 = distinct !DISubprogram(name: "keccak_absorb", scope: !49, file: !49, line: 359, type: !1906, scopeLine: 361, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!1906 = !DISubroutineType(types: !1907)
!1907 = !{!14, !1876, !14, !14, !235, !12}
!1908 = !DILocalVariable(name: "s", arg: 1, scope: !1905, file: !49, line: 359, type: !1876)
!1909 = !DILocation(line: 0, scope: !1905)
!1910 = !DILocalVariable(name: "pos", arg: 2, scope: !1905, file: !49, line: 359, type: !14)
!1911 = !DILocalVariable(name: "r", arg: 3, scope: !1905, file: !49, line: 360, type: !14)
!1912 = !DILocalVariable(name: "in", arg: 4, scope: !1905, file: !49, line: 360, type: !235)
!1913 = !DILocalVariable(name: "inlen", arg: 5, scope: !1905, file: !49, line: 361, type: !12)
!1914 = !DILocation(line: 364, column: 3, scope: !1905)
!1915 = !DILocation(line: 364, column: 14, scope: !1905)
!1916 = !DILocation(line: 364, column: 22, scope: !1905)
!1917 = !DILocation(line: 365, column: 5, scope: !1918)
!1918 = distinct !DILexicalBlock(scope: !1919, file: !49, line: 365, column: 5)
!1919 = distinct !DILexicalBlock(scope: !1905, file: !49, line: 364, column: 28)
!1920 = !DILocation(line: 372, column: 3, scope: !1921)
!1921 = distinct !DILexicalBlock(scope: !1905, file: !49, line: 372, column: 3)
!1922 = !DILocation(line: 365, scope: !1918)
!1923 = !DILocalVariable(name: "i", scope: !1905, file: !49, line: 362, type: !14)
!1924 = !DILocation(line: 365, column: 21, scope: !1925)
!1925 = distinct !DILexicalBlock(scope: !1918, file: !49, line: 365, column: 5)
!1926 = !DILocation(line: 366, column: 29, scope: !1925)
!1927 = !DILocation(line: 366, column: 19, scope: !1925)
!1928 = !DILocation(line: 366, column: 40, scope: !1925)
!1929 = !DILocation(line: 366, column: 35, scope: !1925)
!1930 = !DILocation(line: 366, column: 11, scope: !1925)
!1931 = !DILocation(line: 366, column: 7, scope: !1925)
!1932 = !DILocation(line: 366, column: 16, scope: !1925)
!1933 = !DILocation(line: 366, column: 32, scope: !1925)
!1934 = !DILocation(line: 365, column: 27, scope: !1925)
!1935 = !DILocation(line: 365, column: 5, scope: !1925)
!1936 = distinct !{!1936, !1917, !1937, !105}
!1937 = !DILocation(line: 366, column: 48, scope: !1918)
!1938 = !DILocation(line: 367, column: 16, scope: !1919)
!1939 = !DILocation(line: 367, column: 11, scope: !1919)
!1940 = !DILocation(line: 368, column: 5, scope: !1919)
!1941 = distinct !{!1941, !1914, !1942, !105}
!1942 = !DILocation(line: 370, column: 3, scope: !1905)
!1943 = !DILocation(line: 372, scope: !1921)
!1944 = !DILocation(line: 372, column: 25, scope: !1945)
!1945 = distinct !DILexicalBlock(scope: !1921, file: !49, line: 372, column: 3)
!1946 = !DILocation(line: 372, column: 19, scope: !1945)
!1947 = !DILocation(line: 373, column: 27, scope: !1945)
!1948 = !DILocation(line: 373, column: 17, scope: !1945)
!1949 = !DILocation(line: 373, column: 38, scope: !1945)
!1950 = !DILocation(line: 373, column: 33, scope: !1945)
!1951 = !DILocation(line: 373, column: 9, scope: !1945)
!1952 = !DILocation(line: 373, column: 5, scope: !1945)
!1953 = !DILocation(line: 373, column: 14, scope: !1945)
!1954 = !DILocation(line: 373, column: 30, scope: !1945)
!1955 = !DILocation(line: 372, column: 35, scope: !1945)
!1956 = !DILocation(line: 372, column: 3, scope: !1945)
!1957 = distinct !{!1957, !1920, !1958, !105}
!1958 = !DILocation(line: 373, column: 46, scope: !1921)
!1959 = !DILocation(line: 375, column: 3, scope: !1905)
!1960 = distinct !DISubprogram(name: "KeccakF1600_StatePermute", scope: !49, file: !49, line: 70, type: !1874, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!1961 = !DILocalVariable(name: "state", arg: 1, scope: !1960, file: !49, line: 70, type: !1876)
!1962 = !DILocation(line: 0, scope: !1960)
!1963 = !DILocation(line: 87, column: 9, scope: !1960)
!1964 = !DILocalVariable(name: "Aba", scope: !1960, file: !49, line: 73, type: !45)
!1965 = !DILocation(line: 88, column: 9, scope: !1960)
!1966 = !DILocalVariable(name: "Abe", scope: !1960, file: !49, line: 73, type: !45)
!1967 = !DILocation(line: 89, column: 9, scope: !1960)
!1968 = !DILocalVariable(name: "Abi", scope: !1960, file: !49, line: 73, type: !45)
!1969 = !DILocation(line: 90, column: 9, scope: !1960)
!1970 = !DILocalVariable(name: "Abo", scope: !1960, file: !49, line: 73, type: !45)
!1971 = !DILocation(line: 91, column: 9, scope: !1960)
!1972 = !DILocalVariable(name: "Abu", scope: !1960, file: !49, line: 73, type: !45)
!1973 = !DILocation(line: 92, column: 9, scope: !1960)
!1974 = !DILocalVariable(name: "Aga", scope: !1960, file: !49, line: 74, type: !45)
!1975 = !DILocation(line: 93, column: 9, scope: !1960)
!1976 = !DILocalVariable(name: "Age", scope: !1960, file: !49, line: 74, type: !45)
!1977 = !DILocation(line: 94, column: 9, scope: !1960)
!1978 = !DILocalVariable(name: "Agi", scope: !1960, file: !49, line: 74, type: !45)
!1979 = !DILocation(line: 95, column: 9, scope: !1960)
!1980 = !DILocalVariable(name: "Ago", scope: !1960, file: !49, line: 74, type: !45)
!1981 = !DILocation(line: 96, column: 9, scope: !1960)
!1982 = !DILocalVariable(name: "Agu", scope: !1960, file: !49, line: 74, type: !45)
!1983 = !DILocation(line: 97, column: 9, scope: !1960)
!1984 = !DILocalVariable(name: "Aka", scope: !1960, file: !49, line: 75, type: !45)
!1985 = !DILocation(line: 98, column: 9, scope: !1960)
!1986 = !DILocalVariable(name: "Ake", scope: !1960, file: !49, line: 75, type: !45)
!1987 = !DILocation(line: 99, column: 9, scope: !1960)
!1988 = !DILocalVariable(name: "Aki", scope: !1960, file: !49, line: 75, type: !45)
!1989 = !DILocation(line: 100, column: 9, scope: !1960)
!1990 = !DILocalVariable(name: "Ako", scope: !1960, file: !49, line: 75, type: !45)
!1991 = !DILocation(line: 101, column: 9, scope: !1960)
!1992 = !DILocalVariable(name: "Aku", scope: !1960, file: !49, line: 75, type: !45)
!1993 = !DILocation(line: 102, column: 9, scope: !1960)
!1994 = !DILocalVariable(name: "Ama", scope: !1960, file: !49, line: 76, type: !45)
!1995 = !DILocation(line: 103, column: 9, scope: !1960)
!1996 = !DILocalVariable(name: "Ame", scope: !1960, file: !49, line: 76, type: !45)
!1997 = !DILocation(line: 104, column: 9, scope: !1960)
!1998 = !DILocalVariable(name: "Ami", scope: !1960, file: !49, line: 76, type: !45)
!1999 = !DILocation(line: 105, column: 9, scope: !1960)
!2000 = !DILocalVariable(name: "Amo", scope: !1960, file: !49, line: 76, type: !45)
!2001 = !DILocation(line: 106, column: 9, scope: !1960)
!2002 = !DILocalVariable(name: "Amu", scope: !1960, file: !49, line: 76, type: !45)
!2003 = !DILocation(line: 107, column: 9, scope: !1960)
!2004 = !DILocalVariable(name: "Asa", scope: !1960, file: !49, line: 77, type: !45)
!2005 = !DILocation(line: 108, column: 9, scope: !1960)
!2006 = !DILocalVariable(name: "Ase", scope: !1960, file: !49, line: 77, type: !45)
!2007 = !DILocation(line: 109, column: 9, scope: !1960)
!2008 = !DILocalVariable(name: "Asi", scope: !1960, file: !49, line: 77, type: !45)
!2009 = !DILocation(line: 110, column: 9, scope: !1960)
!2010 = !DILocalVariable(name: "Aso", scope: !1960, file: !49, line: 77, type: !45)
!2011 = !DILocation(line: 111, column: 9, scope: !1960)
!2012 = !DILocalVariable(name: "Asu", scope: !1960, file: !49, line: 77, type: !45)
!2013 = !DILocalVariable(name: "round", scope: !1960, file: !49, line: 71, type: !25)
!2014 = !DILocation(line: 113, column: 8, scope: !2015)
!2015 = distinct !DILexicalBlock(scope: !1960, file: !49, line: 113, column: 3)
!2016 = !DILocation(line: 113, scope: !2015)
!2017 = !DILocation(line: 113, column: 25, scope: !2018)
!2018 = distinct !DILexicalBlock(scope: !2015, file: !49, line: 113, column: 3)
!2019 = !DILocation(line: 113, column: 3, scope: !2015)
!2020 = !DILocalVariable(name: "BCa", scope: !1960, file: !49, line: 78, type: !45)
!2021 = !DILocalVariable(name: "BCe", scope: !1960, file: !49, line: 78, type: !45)
!2022 = !DILocalVariable(name: "BCi", scope: !1960, file: !49, line: 78, type: !45)
!2023 = !DILocalVariable(name: "BCo", scope: !1960, file: !49, line: 78, type: !45)
!2024 = !DILocalVariable(name: "BCu", scope: !1960, file: !49, line: 78, type: !45)
!2025 = !DILocalVariable(name: "Da", scope: !1960, file: !49, line: 79, type: !45)
!2026 = !DILocalVariable(name: "De", scope: !1960, file: !49, line: 79, type: !45)
!2027 = !DILocalVariable(name: "Di", scope: !1960, file: !49, line: 79, type: !45)
!2028 = !DILocalVariable(name: "Do", scope: !1960, file: !49, line: 79, type: !45)
!2029 = !DILocalVariable(name: "Du", scope: !1960, file: !49, line: 79, type: !45)
!2030 = !DILocalVariable(name: "Eba", scope: !1960, file: !49, line: 80, type: !45)
!2031 = !DILocalVariable(name: "Ebe", scope: !1960, file: !49, line: 80, type: !45)
!2032 = !DILocalVariable(name: "Ebi", scope: !1960, file: !49, line: 80, type: !45)
!2033 = !DILocalVariable(name: "Ebo", scope: !1960, file: !49, line: 80, type: !45)
!2034 = !DILocalVariable(name: "Ebu", scope: !1960, file: !49, line: 80, type: !45)
!2035 = !DILocalVariable(name: "Ega", scope: !1960, file: !49, line: 81, type: !45)
!2036 = !DILocalVariable(name: "Ege", scope: !1960, file: !49, line: 81, type: !45)
!2037 = !DILocalVariable(name: "Egi", scope: !1960, file: !49, line: 81, type: !45)
!2038 = !DILocalVariable(name: "Ego", scope: !1960, file: !49, line: 81, type: !45)
!2039 = !DILocalVariable(name: "Egu", scope: !1960, file: !49, line: 81, type: !45)
!2040 = !DILocalVariable(name: "Eka", scope: !1960, file: !49, line: 82, type: !45)
!2041 = !DILocalVariable(name: "Eke", scope: !1960, file: !49, line: 82, type: !45)
!2042 = !DILocalVariable(name: "Eki", scope: !1960, file: !49, line: 82, type: !45)
!2043 = !DILocalVariable(name: "Eko", scope: !1960, file: !49, line: 82, type: !45)
!2044 = !DILocalVariable(name: "Eku", scope: !1960, file: !49, line: 82, type: !45)
!2045 = !DILocalVariable(name: "Ema", scope: !1960, file: !49, line: 83, type: !45)
!2046 = !DILocalVariable(name: "Eme", scope: !1960, file: !49, line: 83, type: !45)
!2047 = !DILocalVariable(name: "Emi", scope: !1960, file: !49, line: 83, type: !45)
!2048 = !DILocalVariable(name: "Emo", scope: !1960, file: !49, line: 83, type: !45)
!2049 = !DILocalVariable(name: "Emu", scope: !1960, file: !49, line: 83, type: !45)
!2050 = !DILocalVariable(name: "Esa", scope: !1960, file: !49, line: 84, type: !45)
!2051 = !DILocalVariable(name: "Ese", scope: !1960, file: !49, line: 84, type: !45)
!2052 = !DILocalVariable(name: "Esi", scope: !1960, file: !49, line: 84, type: !45)
!2053 = !DILocalVariable(name: "Eso", scope: !1960, file: !49, line: 84, type: !45)
!2054 = !DILocalVariable(name: "Esu", scope: !1960, file: !49, line: 84, type: !45)
!2055 = !DILocation(line: 117, column: 15, scope: !2056)
!2056 = distinct !DILexicalBlock(scope: !2018, file: !49, line: 113, column: 48)
!2057 = !DILocation(line: 117, column: 21, scope: !2056)
!2058 = !DILocation(line: 117, column: 27, scope: !2056)
!2059 = !DILocation(line: 117, column: 33, scope: !2056)
!2060 = !DILocation(line: 119, column: 15, scope: !2056)
!2061 = !DILocation(line: 119, column: 21, scope: !2056)
!2062 = !DILocation(line: 119, column: 27, scope: !2056)
!2063 = !DILocation(line: 119, column: 33, scope: !2056)
!2064 = !DILocation(line: 125, column: 16, scope: !2056)
!2065 = !DILocation(line: 125, column: 14, scope: !2056)
!2066 = !DILocation(line: 195, column: 9, scope: !2056)
!2067 = !DILocation(line: 196, column: 11, scope: !2056)
!2068 = !DILocation(line: 116, column: 15, scope: !2056)
!2069 = !DILocation(line: 116, column: 21, scope: !2056)
!2070 = !DILocation(line: 116, column: 27, scope: !2056)
!2071 = !DILocation(line: 116, column: 33, scope: !2056)
!2072 = !DILocation(line: 122, column: 16, scope: !2056)
!2073 = !DILocation(line: 122, column: 14, scope: !2056)
!2074 = !DILocation(line: 199, column: 9, scope: !2056)
!2075 = !DILocation(line: 200, column: 11, scope: !2056)
!2076 = !DILocation(line: 118, column: 15, scope: !2056)
!2077 = !DILocation(line: 118, column: 21, scope: !2056)
!2078 = !DILocation(line: 118, column: 27, scope: !2056)
!2079 = !DILocation(line: 118, column: 33, scope: !2056)
!2080 = !DILocation(line: 115, column: 15, scope: !2056)
!2081 = !DILocation(line: 115, column: 21, scope: !2056)
!2082 = !DILocation(line: 115, column: 27, scope: !2056)
!2083 = !DILocation(line: 115, column: 33, scope: !2056)
!2084 = !DILocation(line: 126, column: 16, scope: !2056)
!2085 = !DILocation(line: 126, column: 14, scope: !2056)
!2086 = !DILocation(line: 197, column: 9, scope: !2056)
!2087 = !DILocation(line: 198, column: 11, scope: !2056)
!2088 = !DILocation(line: 204, column: 19, scope: !2056)
!2089 = !DILocation(line: 204, column: 25, scope: !2056)
!2090 = !DILocation(line: 204, column: 15, scope: !2056)
!2091 = !DILocation(line: 124, column: 16, scope: !2056)
!2092 = !DILocation(line: 124, column: 14, scope: !2056)
!2093 = !DILocation(line: 132, column: 9, scope: !2056)
!2094 = !DILocation(line: 133, column: 11, scope: !2056)
!2095 = !DILocation(line: 123, column: 16, scope: !2056)
!2096 = !DILocation(line: 123, column: 14, scope: !2056)
!2097 = !DILocation(line: 130, column: 9, scope: !2056)
!2098 = !DILocation(line: 131, column: 11, scope: !2056)
!2099 = !DILocation(line: 138, column: 19, scope: !2056)
!2100 = !DILocation(line: 138, column: 25, scope: !2056)
!2101 = !DILocation(line: 139, column: 22, scope: !2056)
!2102 = !DILocation(line: 139, column: 9, scope: !2056)
!2103 = !DILocation(line: 128, column: 9, scope: !2056)
!2104 = !DILocation(line: 145, column: 9, scope: !2056)
!2105 = !DILocation(line: 146, column: 11, scope: !2056)
!2106 = !DILocation(line: 149, column: 9, scope: !2056)
!2107 = !DILocation(line: 150, column: 11, scope: !2056)
!2108 = !DILocation(line: 147, column: 9, scope: !2056)
!2109 = !DILocation(line: 148, column: 11, scope: !2056)
!2110 = !DILocation(line: 155, column: 19, scope: !2056)
!2111 = !DILocation(line: 155, column: 25, scope: !2056)
!2112 = !DILocation(line: 155, column: 15, scope: !2056)
!2113 = !DILocation(line: 210, column: 15, scope: !2056)
!2114 = !DILocation(line: 161, column: 9, scope: !2056)
!2115 = !DILocation(line: 162, column: 11, scope: !2056)
!2116 = !DILocation(line: 165, column: 9, scope: !2056)
!2117 = !DILocation(line: 166, column: 11, scope: !2056)
!2118 = !DILocation(line: 163, column: 9, scope: !2056)
!2119 = !DILocation(line: 164, column: 11, scope: !2056)
!2120 = !DILocation(line: 171, column: 19, scope: !2056)
!2121 = !DILocation(line: 171, column: 25, scope: !2056)
!2122 = !DILocation(line: 171, column: 15, scope: !2056)
!2123 = !DILocation(line: 210, column: 21, scope: !2056)
!2124 = !DILocation(line: 177, column: 9, scope: !2056)
!2125 = !DILocation(line: 178, column: 11, scope: !2056)
!2126 = !DILocation(line: 181, column: 9, scope: !2056)
!2127 = !DILocation(line: 182, column: 11, scope: !2056)
!2128 = !DILocation(line: 179, column: 9, scope: !2056)
!2129 = !DILocation(line: 180, column: 11, scope: !2056)
!2130 = !DILocation(line: 187, column: 19, scope: !2056)
!2131 = !DILocation(line: 187, column: 25, scope: !2056)
!2132 = !DILocation(line: 187, column: 15, scope: !2056)
!2133 = !DILocation(line: 210, column: 27, scope: !2056)
!2134 = !DILocation(line: 193, column: 9, scope: !2056)
!2135 = !DILocation(line: 194, column: 11, scope: !2056)
!2136 = !DILocation(line: 203, column: 19, scope: !2056)
!2137 = !DILocation(line: 203, column: 25, scope: !2056)
!2138 = !DILocation(line: 203, column: 15, scope: !2056)
!2139 = !DILocation(line: 210, column: 33, scope: !2056)
!2140 = !DILocation(line: 136, column: 9, scope: !2056)
!2141 = !DILocation(line: 137, column: 11, scope: !2056)
!2142 = !DILocation(line: 134, column: 9, scope: !2056)
!2143 = !DILocation(line: 135, column: 11, scope: !2056)
!2144 = !DILocation(line: 141, column: 19, scope: !2056)
!2145 = !DILocation(line: 141, column: 25, scope: !2056)
!2146 = !DILocation(line: 141, column: 15, scope: !2056)
!2147 = !DILocation(line: 153, column: 9, scope: !2056)
!2148 = !DILocation(line: 154, column: 11, scope: !2056)
!2149 = !DILocation(line: 151, column: 9, scope: !2056)
!2150 = !DILocation(line: 152, column: 11, scope: !2056)
!2151 = !DILocation(line: 157, column: 19, scope: !2056)
!2152 = !DILocation(line: 157, column: 25, scope: !2056)
!2153 = !DILocation(line: 157, column: 15, scope: !2056)
!2154 = !DILocation(line: 212, column: 15, scope: !2056)
!2155 = !DILocation(line: 169, column: 9, scope: !2056)
!2156 = !DILocation(line: 170, column: 11, scope: !2056)
!2157 = !DILocation(line: 167, column: 9, scope: !2056)
!2158 = !DILocation(line: 168, column: 11, scope: !2056)
!2159 = !DILocation(line: 173, column: 19, scope: !2056)
!2160 = !DILocation(line: 173, column: 25, scope: !2056)
!2161 = !DILocation(line: 173, column: 15, scope: !2056)
!2162 = !DILocation(line: 212, column: 21, scope: !2056)
!2163 = !DILocation(line: 185, column: 9, scope: !2056)
!2164 = !DILocation(line: 186, column: 11, scope: !2056)
!2165 = !DILocation(line: 183, column: 9, scope: !2056)
!2166 = !DILocation(line: 184, column: 11, scope: !2056)
!2167 = !DILocation(line: 189, column: 19, scope: !2056)
!2168 = !DILocation(line: 189, column: 25, scope: !2056)
!2169 = !DILocation(line: 189, column: 15, scope: !2056)
!2170 = !DILocation(line: 212, column: 27, scope: !2056)
!2171 = !DILocation(line: 201, column: 9, scope: !2056)
!2172 = !DILocation(line: 202, column: 11, scope: !2056)
!2173 = !DILocation(line: 205, column: 19, scope: !2056)
!2174 = !DILocation(line: 205, column: 25, scope: !2056)
!2175 = !DILocation(line: 205, column: 15, scope: !2056)
!2176 = !DILocation(line: 212, column: 33, scope: !2056)
!2177 = !DILocation(line: 218, column: 16, scope: !2056)
!2178 = !DILocation(line: 218, column: 14, scope: !2056)
!2179 = !DILocation(line: 296, column: 9, scope: !2056)
!2180 = !DILocation(line: 297, column: 11, scope: !2056)
!2181 = !DILocation(line: 158, column: 19, scope: !2056)
!2182 = !DILocation(line: 158, column: 25, scope: !2056)
!2183 = !DILocation(line: 158, column: 15, scope: !2056)
!2184 = !DILocation(line: 143, column: 19, scope: !2056)
!2185 = !DILocation(line: 143, column: 25, scope: !2056)
!2186 = !DILocation(line: 143, column: 15, scope: !2056)
!2187 = !DILocation(line: 159, column: 19, scope: !2056)
!2188 = !DILocation(line: 159, column: 25, scope: !2056)
!2189 = !DILocation(line: 159, column: 15, scope: !2056)
!2190 = !DILocation(line: 214, column: 15, scope: !2056)
!2191 = !DILocation(line: 175, column: 19, scope: !2056)
!2192 = !DILocation(line: 175, column: 25, scope: !2056)
!2193 = !DILocation(line: 175, column: 15, scope: !2056)
!2194 = !DILocation(line: 214, column: 21, scope: !2056)
!2195 = !DILocation(line: 191, column: 19, scope: !2056)
!2196 = !DILocation(line: 191, column: 25, scope: !2056)
!2197 = !DILocation(line: 191, column: 15, scope: !2056)
!2198 = !DILocation(line: 214, column: 27, scope: !2056)
!2199 = !DILocation(line: 207, column: 19, scope: !2056)
!2200 = !DILocation(line: 207, column: 25, scope: !2056)
!2201 = !DILocation(line: 207, column: 15, scope: !2056)
!2202 = !DILocation(line: 214, column: 33, scope: !2056)
!2203 = !DILocation(line: 220, column: 16, scope: !2056)
!2204 = !DILocation(line: 220, column: 14, scope: !2056)
!2205 = !DILocation(line: 290, column: 9, scope: !2056)
!2206 = !DILocation(line: 291, column: 11, scope: !2056)
!2207 = !DILocation(line: 140, column: 19, scope: !2056)
!2208 = !DILocation(line: 140, column: 25, scope: !2056)
!2209 = !DILocation(line: 140, column: 15, scope: !2056)
!2210 = !DILocation(line: 156, column: 19, scope: !2056)
!2211 = !DILocation(line: 156, column: 25, scope: !2056)
!2212 = !DILocation(line: 156, column: 15, scope: !2056)
!2213 = !DILocation(line: 211, column: 15, scope: !2056)
!2214 = !DILocation(line: 172, column: 19, scope: !2056)
!2215 = !DILocation(line: 172, column: 25, scope: !2056)
!2216 = !DILocation(line: 172, column: 15, scope: !2056)
!2217 = !DILocation(line: 211, column: 21, scope: !2056)
!2218 = !DILocation(line: 188, column: 19, scope: !2056)
!2219 = !DILocation(line: 188, column: 25, scope: !2056)
!2220 = !DILocation(line: 188, column: 15, scope: !2056)
!2221 = !DILocation(line: 211, column: 27, scope: !2056)
!2222 = !DILocation(line: 211, column: 33, scope: !2056)
!2223 = !DILocation(line: 142, column: 19, scope: !2056)
!2224 = !DILocation(line: 142, column: 25, scope: !2056)
!2225 = !DILocation(line: 142, column: 15, scope: !2056)
!2226 = !DILocation(line: 213, column: 15, scope: !2056)
!2227 = !DILocation(line: 174, column: 19, scope: !2056)
!2228 = !DILocation(line: 174, column: 25, scope: !2056)
!2229 = !DILocation(line: 174, column: 15, scope: !2056)
!2230 = !DILocation(line: 213, column: 21, scope: !2056)
!2231 = !DILocation(line: 190, column: 19, scope: !2056)
!2232 = !DILocation(line: 190, column: 25, scope: !2056)
!2233 = !DILocation(line: 190, column: 15, scope: !2056)
!2234 = !DILocation(line: 213, column: 27, scope: !2056)
!2235 = !DILocation(line: 206, column: 19, scope: !2056)
!2236 = !DILocation(line: 206, column: 25, scope: !2056)
!2237 = !DILocation(line: 206, column: 15, scope: !2056)
!2238 = !DILocation(line: 213, column: 33, scope: !2056)
!2239 = !DILocation(line: 219, column: 16, scope: !2056)
!2240 = !DILocation(line: 219, column: 14, scope: !2056)
!2241 = !DILocation(line: 288, column: 9, scope: !2056)
!2242 = !DILocation(line: 289, column: 11, scope: !2056)
!2243 = !DILocation(line: 302, column: 19, scope: !2056)
!2244 = !DILocation(line: 302, column: 25, scope: !2056)
!2245 = !DILocation(line: 302, column: 15, scope: !2056)
!2246 = !DILocation(line: 217, column: 16, scope: !2056)
!2247 = !DILocation(line: 217, column: 14, scope: !2056)
!2248 = !DILocation(line: 294, column: 9, scope: !2056)
!2249 = !DILocation(line: 295, column: 11, scope: !2056)
!2250 = !DILocation(line: 301, column: 19, scope: !2056)
!2251 = !DILocation(line: 301, column: 25, scope: !2056)
!2252 = !DILocation(line: 301, column: 15, scope: !2056)
!2253 = !DILocation(line: 221, column: 16, scope: !2056)
!2254 = !DILocation(line: 221, column: 14, scope: !2056)
!2255 = !DILocation(line: 292, column: 9, scope: !2056)
!2256 = !DILocation(line: 293, column: 11, scope: !2056)
!2257 = !DILocation(line: 300, column: 19, scope: !2056)
!2258 = !DILocation(line: 300, column: 25, scope: !2056)
!2259 = !DILocation(line: 300, column: 15, scope: !2056)
!2260 = !DILocation(line: 299, column: 19, scope: !2056)
!2261 = !DILocation(line: 299, column: 25, scope: !2056)
!2262 = !DILocation(line: 299, column: 15, scope: !2056)
!2263 = !DILocation(line: 298, column: 19, scope: !2056)
!2264 = !DILocation(line: 298, column: 25, scope: !2056)
!2265 = !DILocation(line: 298, column: 15, scope: !2056)
!2266 = !DILocation(line: 280, column: 9, scope: !2056)
!2267 = !DILocation(line: 281, column: 11, scope: !2056)
!2268 = !DILocation(line: 274, column: 9, scope: !2056)
!2269 = !DILocation(line: 275, column: 11, scope: !2056)
!2270 = !DILocation(line: 272, column: 9, scope: !2056)
!2271 = !DILocation(line: 273, column: 11, scope: !2056)
!2272 = !DILocation(line: 286, column: 19, scope: !2056)
!2273 = !DILocation(line: 286, column: 25, scope: !2056)
!2274 = !DILocation(line: 286, column: 15, scope: !2056)
!2275 = !DILocation(line: 278, column: 9, scope: !2056)
!2276 = !DILocation(line: 279, column: 11, scope: !2056)
!2277 = !DILocation(line: 285, column: 19, scope: !2056)
!2278 = !DILocation(line: 285, column: 25, scope: !2056)
!2279 = !DILocation(line: 285, column: 15, scope: !2056)
!2280 = !DILocation(line: 276, column: 9, scope: !2056)
!2281 = !DILocation(line: 277, column: 11, scope: !2056)
!2282 = !DILocation(line: 284, column: 19, scope: !2056)
!2283 = !DILocation(line: 284, column: 25, scope: !2056)
!2284 = !DILocation(line: 284, column: 15, scope: !2056)
!2285 = !DILocation(line: 283, column: 19, scope: !2056)
!2286 = !DILocation(line: 283, column: 25, scope: !2056)
!2287 = !DILocation(line: 283, column: 15, scope: !2056)
!2288 = !DILocation(line: 282, column: 19, scope: !2056)
!2289 = !DILocation(line: 282, column: 25, scope: !2056)
!2290 = !DILocation(line: 282, column: 15, scope: !2056)
!2291 = !DILocation(line: 264, column: 9, scope: !2056)
!2292 = !DILocation(line: 265, column: 11, scope: !2056)
!2293 = !DILocation(line: 258, column: 9, scope: !2056)
!2294 = !DILocation(line: 259, column: 11, scope: !2056)
!2295 = !DILocation(line: 256, column: 9, scope: !2056)
!2296 = !DILocation(line: 257, column: 11, scope: !2056)
!2297 = !DILocation(line: 270, column: 19, scope: !2056)
!2298 = !DILocation(line: 270, column: 25, scope: !2056)
!2299 = !DILocation(line: 270, column: 15, scope: !2056)
!2300 = !DILocation(line: 262, column: 9, scope: !2056)
!2301 = !DILocation(line: 263, column: 11, scope: !2056)
!2302 = !DILocation(line: 269, column: 19, scope: !2056)
!2303 = !DILocation(line: 269, column: 25, scope: !2056)
!2304 = !DILocation(line: 269, column: 15, scope: !2056)
!2305 = !DILocation(line: 260, column: 9, scope: !2056)
!2306 = !DILocation(line: 261, column: 11, scope: !2056)
!2307 = !DILocation(line: 268, column: 19, scope: !2056)
!2308 = !DILocation(line: 268, column: 25, scope: !2056)
!2309 = !DILocation(line: 268, column: 15, scope: !2056)
!2310 = !DILocation(line: 267, column: 19, scope: !2056)
!2311 = !DILocation(line: 267, column: 25, scope: !2056)
!2312 = !DILocation(line: 267, column: 15, scope: !2056)
!2313 = !DILocation(line: 266, column: 19, scope: !2056)
!2314 = !DILocation(line: 266, column: 25, scope: !2056)
!2315 = !DILocation(line: 266, column: 15, scope: !2056)
!2316 = !DILocation(line: 248, column: 9, scope: !2056)
!2317 = !DILocation(line: 249, column: 11, scope: !2056)
!2318 = !DILocation(line: 242, column: 9, scope: !2056)
!2319 = !DILocation(line: 243, column: 11, scope: !2056)
!2320 = !DILocation(line: 240, column: 9, scope: !2056)
!2321 = !DILocation(line: 241, column: 11, scope: !2056)
!2322 = !DILocation(line: 254, column: 19, scope: !2056)
!2323 = !DILocation(line: 254, column: 25, scope: !2056)
!2324 = !DILocation(line: 254, column: 15, scope: !2056)
!2325 = !DILocation(line: 246, column: 9, scope: !2056)
!2326 = !DILocation(line: 247, column: 11, scope: !2056)
!2327 = !DILocation(line: 253, column: 19, scope: !2056)
!2328 = !DILocation(line: 253, column: 25, scope: !2056)
!2329 = !DILocation(line: 253, column: 15, scope: !2056)
!2330 = !DILocation(line: 244, column: 9, scope: !2056)
!2331 = !DILocation(line: 245, column: 11, scope: !2056)
!2332 = !DILocation(line: 252, column: 19, scope: !2056)
!2333 = !DILocation(line: 252, column: 25, scope: !2056)
!2334 = !DILocation(line: 252, column: 15, scope: !2056)
!2335 = !DILocation(line: 251, column: 19, scope: !2056)
!2336 = !DILocation(line: 251, column: 25, scope: !2056)
!2337 = !DILocation(line: 251, column: 15, scope: !2056)
!2338 = !DILocation(line: 250, column: 19, scope: !2056)
!2339 = !DILocation(line: 250, column: 25, scope: !2056)
!2340 = !DILocation(line: 250, column: 15, scope: !2056)
!2341 = !DILocation(line: 231, column: 9, scope: !2056)
!2342 = !DILocation(line: 232, column: 11, scope: !2056)
!2343 = !DILocation(line: 225, column: 9, scope: !2056)
!2344 = !DILocation(line: 226, column: 11, scope: !2056)
!2345 = !DILocation(line: 223, column: 9, scope: !2056)
!2346 = !DILocation(line: 238, column: 19, scope: !2056)
!2347 = !DILocation(line: 238, column: 25, scope: !2056)
!2348 = !DILocation(line: 238, column: 15, scope: !2056)
!2349 = !DILocation(line: 229, column: 9, scope: !2056)
!2350 = !DILocation(line: 230, column: 11, scope: !2056)
!2351 = !DILocation(line: 237, column: 19, scope: !2056)
!2352 = !DILocation(line: 237, column: 25, scope: !2056)
!2353 = !DILocation(line: 237, column: 15, scope: !2056)
!2354 = !DILocation(line: 227, column: 9, scope: !2056)
!2355 = !DILocation(line: 228, column: 11, scope: !2056)
!2356 = !DILocation(line: 236, column: 19, scope: !2056)
!2357 = !DILocation(line: 236, column: 25, scope: !2056)
!2358 = !DILocation(line: 236, column: 15, scope: !2056)
!2359 = !DILocation(line: 235, column: 19, scope: !2056)
!2360 = !DILocation(line: 235, column: 25, scope: !2056)
!2361 = !DILocation(line: 235, column: 15, scope: !2056)
!2362 = !DILocation(line: 234, column: 51, scope: !2056)
!2363 = !DILocation(line: 234, column: 22, scope: !2056)
!2364 = !DILocation(line: 233, column: 19, scope: !2056)
!2365 = !DILocation(line: 233, column: 25, scope: !2056)
!2366 = !DILocation(line: 234, column: 9, scope: !2056)
!2367 = !DILocation(line: 113, column: 42, scope: !2018)
!2368 = !DILocation(line: 113, column: 3, scope: !2018)
!2369 = distinct !{!2369, !2019, !2370, !105}
!2370 = !DILocation(line: 303, column: 3, scope: !2015)
!2371 = !DILocation(line: 306, column: 12, scope: !1960)
!2372 = !DILocation(line: 307, column: 3, scope: !1960)
!2373 = !DILocation(line: 307, column: 12, scope: !1960)
!2374 = !DILocation(line: 308, column: 3, scope: !1960)
!2375 = !DILocation(line: 308, column: 12, scope: !1960)
!2376 = !DILocation(line: 309, column: 3, scope: !1960)
!2377 = !DILocation(line: 309, column: 12, scope: !1960)
!2378 = !DILocation(line: 310, column: 3, scope: !1960)
!2379 = !DILocation(line: 310, column: 12, scope: !1960)
!2380 = !DILocation(line: 311, column: 3, scope: !1960)
!2381 = !DILocation(line: 311, column: 12, scope: !1960)
!2382 = !DILocation(line: 312, column: 3, scope: !1960)
!2383 = !DILocation(line: 312, column: 12, scope: !1960)
!2384 = !DILocation(line: 313, column: 3, scope: !1960)
!2385 = !DILocation(line: 313, column: 12, scope: !1960)
!2386 = !DILocation(line: 314, column: 3, scope: !1960)
!2387 = !DILocation(line: 314, column: 12, scope: !1960)
!2388 = !DILocation(line: 315, column: 3, scope: !1960)
!2389 = !DILocation(line: 315, column: 12, scope: !1960)
!2390 = !DILocation(line: 316, column: 3, scope: !1960)
!2391 = !DILocation(line: 316, column: 13, scope: !1960)
!2392 = !DILocation(line: 317, column: 3, scope: !1960)
!2393 = !DILocation(line: 317, column: 13, scope: !1960)
!2394 = !DILocation(line: 318, column: 3, scope: !1960)
!2395 = !DILocation(line: 318, column: 13, scope: !1960)
!2396 = !DILocation(line: 319, column: 3, scope: !1960)
!2397 = !DILocation(line: 319, column: 13, scope: !1960)
!2398 = !DILocation(line: 320, column: 3, scope: !1960)
!2399 = !DILocation(line: 320, column: 13, scope: !1960)
!2400 = !DILocation(line: 321, column: 3, scope: !1960)
!2401 = !DILocation(line: 321, column: 13, scope: !1960)
!2402 = !DILocation(line: 322, column: 3, scope: !1960)
!2403 = !DILocation(line: 322, column: 13, scope: !1960)
!2404 = !DILocation(line: 323, column: 3, scope: !1960)
!2405 = !DILocation(line: 323, column: 13, scope: !1960)
!2406 = !DILocation(line: 324, column: 3, scope: !1960)
!2407 = !DILocation(line: 324, column: 13, scope: !1960)
!2408 = !DILocation(line: 325, column: 3, scope: !1960)
!2409 = !DILocation(line: 325, column: 13, scope: !1960)
!2410 = !DILocation(line: 326, column: 3, scope: !1960)
!2411 = !DILocation(line: 326, column: 13, scope: !1960)
!2412 = !DILocation(line: 327, column: 3, scope: !1960)
!2413 = !DILocation(line: 327, column: 13, scope: !1960)
!2414 = !DILocation(line: 328, column: 3, scope: !1960)
!2415 = !DILocation(line: 328, column: 13, scope: !1960)
!2416 = !DILocation(line: 329, column: 3, scope: !1960)
!2417 = !DILocation(line: 329, column: 13, scope: !1960)
!2418 = !DILocation(line: 330, column: 3, scope: !1960)
!2419 = !DILocation(line: 330, column: 13, scope: !1960)
!2420 = !DILocation(line: 331, column: 1, scope: !1960)
!2421 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_finalize", scope: !49, file: !49, line: 524, type: !1864, scopeLine: 524, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2422 = !DILocalVariable(name: "state", arg: 1, scope: !2421, file: !49, line: 524, type: !1866)
!2423 = !DILocation(line: 0, scope: !2421)
!2424 = !DILocation(line: 525, column: 27, scope: !2421)
!2425 = !DILocation(line: 525, column: 3, scope: !2421)
!2426 = !DILocation(line: 526, column: 3, scope: !2421)
!2427 = !DILocation(line: 526, column: 29, scope: !2421)
!2428 = !DILocation(line: 527, column: 1, scope: !2421)
!2429 = distinct !DISubprogram(name: "keccak_finalize", scope: !49, file: !49, line: 388, type: !2430, scopeLine: 389, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2430 = !DISubroutineType(types: !2431)
!2431 = !{null, !1876, !14, !14, !7}
!2432 = !DILocalVariable(name: "s", arg: 1, scope: !2429, file: !49, line: 388, type: !1876)
!2433 = !DILocation(line: 0, scope: !2429)
!2434 = !DILocalVariable(name: "pos", arg: 2, scope: !2429, file: !49, line: 388, type: !14)
!2435 = !DILocalVariable(name: "r", arg: 3, scope: !2429, file: !49, line: 388, type: !14)
!2436 = !DILocalVariable(name: "p", arg: 4, scope: !2429, file: !49, line: 389, type: !7)
!2437 = !DILocation(line: 390, column: 34, scope: !2429)
!2438 = !DILocation(line: 390, column: 29, scope: !2429)
!2439 = !DILocation(line: 390, column: 9, scope: !2429)
!2440 = !DILocation(line: 390, column: 3, scope: !2429)
!2441 = !DILocation(line: 390, column: 14, scope: !2429)
!2442 = !DILocation(line: 391, column: 7, scope: !2429)
!2443 = !DILocation(line: 391, column: 3, scope: !2429)
!2444 = !DILocation(line: 391, column: 16, scope: !2429)
!2445 = !DILocation(line: 392, column: 1, scope: !2429)
!2446 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeeze", scope: !49, file: !49, line: 540, type: !2447, scopeLine: 540, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2447 = !DISubroutineType(types: !2448)
!2448 = !{null, !6, !12, !1866}
!2449 = !DILocalVariable(name: "out", arg: 1, scope: !2446, file: !49, line: 540, type: !6)
!2450 = !DILocation(line: 0, scope: !2446)
!2451 = !DILocalVariable(name: "outlen", arg: 2, scope: !2446, file: !49, line: 540, type: !12)
!2452 = !DILocalVariable(name: "state", arg: 3, scope: !2446, file: !49, line: 540, type: !1866)
!2453 = !DILocation(line: 542, column: 28, scope: !2446)
!2454 = !DILocation(line: 541, column: 31, scope: !2446)
!2455 = !DILocation(line: 541, column: 3, scope: !2446)
!2456 = !DILocation(line: 541, column: 29, scope: !2446)
!2457 = !DILocation(line: 543, column: 1, scope: !2446)
!2458 = distinct !DISubprogram(name: "keccak_squeeze", scope: !49, file: !49, line: 410, type: !2459, scopeLine: 411, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2459 = !DISubroutineType(types: !2460)
!2460 = !{!14, !6, !12, !1876, !14, !14}
!2461 = !DILocalVariable(name: "out", arg: 1, scope: !2458, file: !49, line: 410, type: !6)
!2462 = !DILocation(line: 0, scope: !2458)
!2463 = !DILocalVariable(name: "outlen", arg: 2, scope: !2458, file: !49, line: 410, type: !12)
!2464 = !DILocalVariable(name: "s", arg: 3, scope: !2458, file: !49, line: 410, type: !1876)
!2465 = !DILocalVariable(name: "pos", arg: 4, scope: !2458, file: !49, line: 411, type: !14)
!2466 = !DILocalVariable(name: "r", arg: 5, scope: !2458, file: !49, line: 411, type: !14)
!2467 = !DILocation(line: 414, column: 3, scope: !2458)
!2468 = !DILocation(line: 415, column: 13, scope: !2469)
!2469 = distinct !DILexicalBlock(scope: !2470, file: !49, line: 415, column: 9)
!2470 = distinct !DILexicalBlock(scope: !2458, file: !49, line: 414, column: 18)
!2471 = !DILocation(line: 416, column: 7, scope: !2472)
!2472 = distinct !DILexicalBlock(scope: !2469, file: !49, line: 415, column: 19)
!2473 = !DILocation(line: 418, column: 5, scope: !2472)
!2474 = !DILocalVariable(name: "i", scope: !2458, file: !49, line: 412, type: !14)
!2475 = !DILocation(line: 419, column: 10, scope: !2476)
!2476 = distinct !DILexicalBlock(scope: !2470, file: !49, line: 419, column: 5)
!2477 = !DILocation(line: 419, scope: !2476)
!2478 = !DILocation(line: 419, column: 21, scope: !2479)
!2479 = distinct !DILexicalBlock(scope: !2476, file: !49, line: 419, column: 5)
!2480 = !DILocation(line: 419, column: 25, scope: !2479)
!2481 = !DILocation(line: 419, column: 5, scope: !2476)
!2482 = !DILocation(line: 420, column: 20, scope: !2479)
!2483 = !DILocation(line: 420, column: 16, scope: !2479)
!2484 = !DILocation(line: 420, column: 30, scope: !2479)
!2485 = !DILocation(line: 420, column: 25, scope: !2479)
!2486 = !DILocation(line: 420, column: 14, scope: !2479)
!2487 = !DILocation(line: 420, column: 11, scope: !2479)
!2488 = !DILocation(line: 419, column: 47, scope: !2479)
!2489 = !DILocation(line: 419, column: 5, scope: !2479)
!2490 = distinct !{!2490, !2481, !2491, !105}
!2491 = !DILocation(line: 420, column: 38, scope: !2476)
!2492 = !DILocation(line: 421, column: 17, scope: !2470)
!2493 = !DILocation(line: 421, column: 12, scope: !2470)
!2494 = distinct !{!2494, !2467, !2495, !105}
!2495 = !DILocation(line: 423, column: 3, scope: !2458)
!2496 = !DILocation(line: 425, column: 3, scope: !2458)
!2497 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb_once", scope: !49, file: !49, line: 556, type: !1894, scopeLine: 557, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2498 = !DILocalVariable(name: "state", arg: 1, scope: !2497, file: !49, line: 556, type: !1866)
!2499 = !DILocation(line: 0, scope: !2497)
!2500 = !DILocalVariable(name: "in", arg: 2, scope: !2497, file: !49, line: 556, type: !235)
!2501 = !DILocalVariable(name: "inlen", arg: 3, scope: !2497, file: !49, line: 557, type: !12)
!2502 = !DILocation(line: 558, column: 3, scope: !2497)
!2503 = !DILocation(line: 559, column: 3, scope: !2497)
!2504 = !DILocation(line: 559, column: 29, scope: !2497)
!2505 = !DILocation(line: 560, column: 1, scope: !2497)
!2506 = distinct !DISubprogram(name: "keccak_absorb_once", scope: !49, file: !49, line: 441, type: !2507, scopeLine: 442, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2507 = !DISubroutineType(types: !2508)
!2508 = !{null, !1876, !14, !235, !12, !7}
!2509 = !DILocalVariable(name: "s", arg: 1, scope: !2506, file: !49, line: 441, type: !1876)
!2510 = !DILocation(line: 0, scope: !2506)
!2511 = !DILocalVariable(name: "r", arg: 2, scope: !2506, file: !49, line: 441, type: !14)
!2512 = !DILocalVariable(name: "in", arg: 3, scope: !2506, file: !49, line: 442, type: !235)
!2513 = !DILocalVariable(name: "inlen", arg: 4, scope: !2506, file: !49, line: 442, type: !12)
!2514 = !DILocalVariable(name: "p", arg: 5, scope: !2506, file: !49, line: 442, type: !7)
!2515 = !DILocalVariable(name: "i", scope: !2506, file: !49, line: 443, type: !14)
!2516 = !DILocation(line: 445, column: 8, scope: !2517)
!2517 = distinct !DILexicalBlock(scope: !2506, file: !49, line: 445, column: 3)
!2518 = !DILocation(line: 445, scope: !2517)
!2519 = !DILocation(line: 445, column: 17, scope: !2520)
!2520 = distinct !DILexicalBlock(scope: !2517, file: !49, line: 445, column: 3)
!2521 = !DILocation(line: 445, column: 3, scope: !2517)
!2522 = !DILocation(line: 448, column: 3, scope: !2506)
!2523 = !DILocation(line: 446, column: 5, scope: !2520)
!2524 = !DILocation(line: 446, column: 10, scope: !2520)
!2525 = !DILocation(line: 445, column: 24, scope: !2520)
!2526 = !DILocation(line: 445, column: 3, scope: !2520)
!2527 = distinct !{!2527, !2521, !2528, !105}
!2528 = !DILocation(line: 446, column: 12, scope: !2517)
!2529 = !DILocation(line: 448, column: 16, scope: !2506)
!2530 = !DILocation(line: 449, column: 5, scope: !2531)
!2531 = distinct !DILexicalBlock(scope: !2532, file: !49, line: 449, column: 5)
!2532 = distinct !DILexicalBlock(scope: !2506, file: !49, line: 448, column: 22)
!2533 = !DILocation(line: 456, column: 3, scope: !2534)
!2534 = distinct !DILexicalBlock(scope: !2506, file: !49, line: 456, column: 3)
!2535 = !DILocation(line: 449, scope: !2531)
!2536 = !DILocation(line: 449, column: 19, scope: !2537)
!2537 = distinct !DILexicalBlock(scope: !2531, file: !49, line: 449, column: 5)
!2538 = !DILocation(line: 450, column: 29, scope: !2537)
!2539 = !DILocation(line: 450, column: 25, scope: !2537)
!2540 = !DILocation(line: 450, column: 15, scope: !2537)
!2541 = !DILocation(line: 450, column: 7, scope: !2537)
!2542 = !DILocation(line: 450, column: 12, scope: !2537)
!2543 = !DILocation(line: 449, column: 29, scope: !2537)
!2544 = !DILocation(line: 449, column: 5, scope: !2537)
!2545 = distinct !{!2545, !2530, !2546, !105}
!2546 = !DILocation(line: 450, column: 32, scope: !2531)
!2547 = !DILocation(line: 451, column: 8, scope: !2532)
!2548 = !DILocation(line: 452, column: 11, scope: !2532)
!2549 = !DILocation(line: 453, column: 5, scope: !2532)
!2550 = distinct !{!2550, !2522, !2551, !105}
!2551 = !DILocation(line: 454, column: 3, scope: !2506)
!2552 = !DILocation(line: 456, scope: !2534)
!2553 = !DILocation(line: 456, column: 17, scope: !2554)
!2554 = distinct !DILexicalBlock(scope: !2534, file: !49, line: 456, column: 3)
!2555 = !DILocation(line: 457, column: 27, scope: !2554)
!2556 = !DILocation(line: 457, column: 17, scope: !2554)
!2557 = !DILocation(line: 457, column: 38, scope: !2554)
!2558 = !DILocation(line: 457, column: 33, scope: !2554)
!2559 = !DILocation(line: 457, column: 9, scope: !2554)
!2560 = !DILocation(line: 457, column: 5, scope: !2554)
!2561 = !DILocation(line: 457, column: 14, scope: !2554)
!2562 = !DILocation(line: 456, column: 27, scope: !2554)
!2563 = !DILocation(line: 456, column: 3, scope: !2554)
!2564 = distinct !{!2564, !2533, !2565, !105}
!2565 = !DILocation(line: 457, column: 46, scope: !2534)
!2566 = !DILocation(line: 459, column: 15, scope: !2506)
!2567 = !DILocation(line: 459, column: 32, scope: !2506)
!2568 = !DILocation(line: 459, column: 27, scope: !2506)
!2569 = !DILocation(line: 459, column: 7, scope: !2506)
!2570 = !DILocation(line: 459, column: 3, scope: !2506)
!2571 = !DILocation(line: 459, column: 12, scope: !2506)
!2572 = !DILocation(line: 460, column: 8, scope: !2506)
!2573 = !DILocation(line: 460, column: 13, scope: !2506)
!2574 = !DILocation(line: 460, column: 3, scope: !2506)
!2575 = !DILocation(line: 460, column: 18, scope: !2506)
!2576 = !DILocation(line: 461, column: 1, scope: !2506)
!2577 = distinct !DISubprogram(name: "load64", scope: !49, file: !49, line: 22, type: !2578, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2578 = !DISubroutineType(types: !2579)
!2579 = !{!45, !235}
!2580 = !DILocalVariable(name: "x", arg: 1, scope: !2577, file: !49, line: 22, type: !235)
!2581 = !DILocation(line: 0, scope: !2577)
!2582 = !DILocalVariable(name: "r", scope: !2577, file: !49, line: 24, type: !45)
!2583 = !DILocalVariable(name: "i", scope: !2577, file: !49, line: 23, type: !14)
!2584 = !DILocation(line: 26, column: 8, scope: !2585)
!2585 = distinct !DILexicalBlock(scope: !2577, file: !49, line: 26, column: 3)
!2586 = !DILocation(line: 26, scope: !2585)
!2587 = !DILocation(line: 26, column: 17, scope: !2588)
!2588 = distinct !DILexicalBlock(scope: !2585, file: !49, line: 26, column: 3)
!2589 = !DILocation(line: 26, column: 3, scope: !2585)
!2590 = !DILocation(line: 27, column: 20, scope: !2588)
!2591 = !DILocation(line: 27, column: 10, scope: !2588)
!2592 = !DILocation(line: 27, column: 30, scope: !2588)
!2593 = !DILocation(line: 27, column: 25, scope: !2588)
!2594 = !DILocation(line: 27, column: 7, scope: !2588)
!2595 = !DILocation(line: 26, column: 23, scope: !2588)
!2596 = !DILocation(line: 26, column: 3, scope: !2588)
!2597 = distinct !{!2597, !2589, !2598, !105}
!2598 = !DILocation(line: 27, column: 32, scope: !2585)
!2599 = !DILocation(line: 29, column: 3, scope: !2577)
!2600 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeezeblocks", scope: !49, file: !49, line: 575, type: !2447, scopeLine: 575, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2601 = !DILocalVariable(name: "out", arg: 1, scope: !2600, file: !49, line: 575, type: !6)
!2602 = !DILocation(line: 0, scope: !2600)
!2603 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2600, file: !49, line: 575, type: !12)
!2604 = !DILocalVariable(name: "state", arg: 3, scope: !2600, file: !49, line: 575, type: !1866)
!2605 = !DILocation(line: 576, column: 3, scope: !2600)
!2606 = !DILocation(line: 577, column: 1, scope: !2600)
!2607 = distinct !DISubprogram(name: "keccak_squeezeblocks", scope: !49, file: !49, line: 477, type: !2608, scopeLine: 478, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2608 = !DISubroutineType(types: !2609)
!2609 = !{null, !6, !12, !1876, !14}
!2610 = !DILocalVariable(name: "out", arg: 1, scope: !2607, file: !49, line: 477, type: !6)
!2611 = !DILocation(line: 0, scope: !2607)
!2612 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2607, file: !49, line: 477, type: !12)
!2613 = !DILocalVariable(name: "s", arg: 3, scope: !2607, file: !49, line: 477, type: !1876)
!2614 = !DILocalVariable(name: "r", arg: 4, scope: !2607, file: !49, line: 478, type: !14)
!2615 = !DILocation(line: 481, column: 3, scope: !2607)
!2616 = !DILocation(line: 482, column: 5, scope: !2617)
!2617 = distinct !DILexicalBlock(scope: !2607, file: !49, line: 481, column: 19)
!2618 = !DILocalVariable(name: "i", scope: !2607, file: !49, line: 479, type: !14)
!2619 = !DILocation(line: 483, column: 10, scope: !2620)
!2620 = distinct !DILexicalBlock(scope: !2617, file: !49, line: 483, column: 5)
!2621 = !DILocation(line: 483, scope: !2620)
!2622 = !DILocation(line: 483, column: 19, scope: !2623)
!2623 = distinct !DILexicalBlock(scope: !2620, file: !49, line: 483, column: 5)
!2624 = !DILocation(line: 483, column: 5, scope: !2620)
!2625 = !DILocation(line: 484, column: 23, scope: !2623)
!2626 = !DILocation(line: 484, column: 19, scope: !2623)
!2627 = !DILocation(line: 484, column: 28, scope: !2623)
!2628 = !DILocation(line: 484, column: 7, scope: !2623)
!2629 = !DILocation(line: 483, column: 29, scope: !2623)
!2630 = !DILocation(line: 483, column: 5, scope: !2623)
!2631 = distinct !{!2631, !2624, !2632, !105}
!2632 = !DILocation(line: 484, column: 32, scope: !2620)
!2633 = !DILocation(line: 485, column: 9, scope: !2617)
!2634 = !DILocation(line: 486, column: 13, scope: !2617)
!2635 = distinct !{!2635, !2615, !2636, !105}
!2636 = !DILocation(line: 487, column: 3, scope: !2607)
!2637 = !DILocation(line: 488, column: 1, scope: !2607)
!2638 = distinct !DISubprogram(name: "store64", scope: !49, file: !49, line: 41, type: !2639, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2639 = !DISubroutineType(types: !2640)
!2640 = !{null, !6, !45}
!2641 = !DILocalVariable(name: "x", arg: 1, scope: !2638, file: !49, line: 41, type: !6)
!2642 = !DILocation(line: 0, scope: !2638)
!2643 = !DILocalVariable(name: "u", arg: 2, scope: !2638, file: !49, line: 41, type: !45)
!2644 = !DILocalVariable(name: "i", scope: !2638, file: !49, line: 42, type: !14)
!2645 = !DILocation(line: 44, column: 8, scope: !2646)
!2646 = distinct !DILexicalBlock(scope: !2638, file: !49, line: 44, column: 3)
!2647 = !DILocation(line: 44, scope: !2646)
!2648 = !DILocation(line: 44, column: 17, scope: !2649)
!2649 = distinct !DILexicalBlock(scope: !2646, file: !49, line: 44, column: 3)
!2650 = !DILocation(line: 44, column: 3, scope: !2646)
!2651 = !DILocation(line: 45, column: 19, scope: !2649)
!2652 = !DILocation(line: 45, column: 14, scope: !2649)
!2653 = !DILocation(line: 45, column: 12, scope: !2649)
!2654 = !DILocation(line: 45, column: 5, scope: !2649)
!2655 = !DILocation(line: 45, column: 10, scope: !2649)
!2656 = !DILocation(line: 44, column: 23, scope: !2649)
!2657 = !DILocation(line: 44, column: 3, scope: !2649)
!2658 = distinct !{!2658, !2650, !2659, !105}
!2659 = !DILocation(line: 45, column: 21, scope: !2646)
!2660 = !DILocation(line: 46, column: 1, scope: !2638)
!2661 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_init", scope: !49, file: !49, line: 586, type: !1864, scopeLine: 586, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2662 = !DILocalVariable(name: "state", arg: 1, scope: !2661, file: !49, line: 586, type: !1866)
!2663 = !DILocation(line: 0, scope: !2661)
!2664 = !DILocation(line: 587, column: 3, scope: !2661)
!2665 = !DILocation(line: 588, column: 3, scope: !2661)
!2666 = !DILocation(line: 588, column: 29, scope: !2661)
!2667 = !DILocation(line: 589, column: 1, scope: !2661)
!2668 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb", scope: !49, file: !49, line: 601, type: !1894, scopeLine: 601, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2669 = !DILocalVariable(name: "state", arg: 1, scope: !2668, file: !49, line: 601, type: !1866)
!2670 = !DILocation(line: 0, scope: !2668)
!2671 = !DILocalVariable(name: "in", arg: 2, scope: !2668, file: !49, line: 601, type: !235)
!2672 = !DILocalVariable(name: "inlen", arg: 3, scope: !2668, file: !49, line: 601, type: !12)
!2673 = !DILocation(line: 602, column: 53, scope: !2668)
!2674 = !DILocation(line: 602, column: 31, scope: !2668)
!2675 = !DILocation(line: 602, column: 3, scope: !2668)
!2676 = !DILocation(line: 602, column: 29, scope: !2668)
!2677 = !DILocation(line: 604, column: 1, scope: !2668)
!2678 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_finalize", scope: !49, file: !49, line: 613, type: !1864, scopeLine: 613, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2679 = !DILocalVariable(name: "state", arg: 1, scope: !2678, file: !49, line: 613, type: !1866)
!2680 = !DILocation(line: 0, scope: !2678)
!2681 = !DILocation(line: 614, column: 27, scope: !2678)
!2682 = !DILocation(line: 614, column: 3, scope: !2678)
!2683 = !DILocation(line: 615, column: 3, scope: !2678)
!2684 = !DILocation(line: 615, column: 29, scope: !2678)
!2685 = !DILocation(line: 616, column: 1, scope: !2678)
!2686 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeeze", scope: !49, file: !49, line: 629, type: !2447, scopeLine: 629, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2687 = !DILocalVariable(name: "out", arg: 1, scope: !2686, file: !49, line: 629, type: !6)
!2688 = !DILocation(line: 0, scope: !2686)
!2689 = !DILocalVariable(name: "outlen", arg: 2, scope: !2686, file: !49, line: 629, type: !12)
!2690 = !DILocalVariable(name: "state", arg: 3, scope: !2686, file: !49, line: 629, type: !1866)
!2691 = !DILocation(line: 631, column: 28, scope: !2686)
!2692 = !DILocation(line: 630, column: 31, scope: !2686)
!2693 = !DILocation(line: 630, column: 3, scope: !2686)
!2694 = !DILocation(line: 630, column: 29, scope: !2686)
!2695 = !DILocation(line: 632, column: 1, scope: !2686)
!2696 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb_once", scope: !49, file: !49, line: 645, type: !1894, scopeLine: 646, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2697 = !DILocalVariable(name: "state", arg: 1, scope: !2696, file: !49, line: 645, type: !1866)
!2698 = !DILocation(line: 0, scope: !2696)
!2699 = !DILocalVariable(name: "in", arg: 2, scope: !2696, file: !49, line: 645, type: !235)
!2700 = !DILocalVariable(name: "inlen", arg: 3, scope: !2696, file: !49, line: 646, type: !12)
!2701 = !DILocation(line: 647, column: 3, scope: !2696)
!2702 = !DILocation(line: 648, column: 3, scope: !2696)
!2703 = !DILocation(line: 648, column: 29, scope: !2696)
!2704 = !DILocation(line: 649, column: 1, scope: !2696)
!2705 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeezeblocks", scope: !49, file: !49, line: 664, type: !2447, scopeLine: 664, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2706 = !DILocalVariable(name: "out", arg: 1, scope: !2705, file: !49, line: 664, type: !6)
!2707 = !DILocation(line: 0, scope: !2705)
!2708 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2705, file: !49, line: 664, type: !12)
!2709 = !DILocalVariable(name: "state", arg: 3, scope: !2705, file: !49, line: 664, type: !1866)
!2710 = !DILocation(line: 665, column: 3, scope: !2705)
!2711 = !DILocation(line: 666, column: 1, scope: !2705)
!2712 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128", scope: !49, file: !49, line: 678, type: !2713, scopeLine: 678, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2713 = !DISubroutineType(types: !2714)
!2714 = !{null, !6, !12, !235, !12}
!2715 = !DILocalVariable(name: "out", arg: 1, scope: !2712, file: !49, line: 678, type: !6)
!2716 = !DILocation(line: 0, scope: !2712)
!2717 = !DILocalVariable(name: "outlen", arg: 2, scope: !2712, file: !49, line: 678, type: !12)
!2718 = !DILocalVariable(name: "in", arg: 3, scope: !2712, file: !49, line: 678, type: !235)
!2719 = !DILocalVariable(name: "inlen", arg: 4, scope: !2712, file: !49, line: 678, type: !12)
!2720 = !DILocalVariable(name: "state", scope: !2712, file: !49, line: 680, type: !347)
!2721 = !DILocation(line: 680, column: 16, scope: !2712)
!2722 = !DILocation(line: 682, column: 3, scope: !2712)
!2723 = !DILocation(line: 683, column: 20, scope: !2712)
!2724 = !DILocalVariable(name: "nblocks", scope: !2712, file: !49, line: 679, type: !12)
!2725 = !DILocation(line: 684, column: 3, scope: !2712)
!2726 = !DILocation(line: 685, column: 21, scope: !2712)
!2727 = !DILocation(line: 685, column: 10, scope: !2712)
!2728 = !DILocation(line: 686, column: 18, scope: !2712)
!2729 = !DILocation(line: 686, column: 7, scope: !2712)
!2730 = !DILocation(line: 687, column: 3, scope: !2712)
!2731 = !DILocation(line: 688, column: 1, scope: !2712)
!2732 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256", scope: !49, file: !49, line: 700, type: !2713, scopeLine: 700, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2733 = !DILocalVariable(name: "out", arg: 1, scope: !2732, file: !49, line: 700, type: !6)
!2734 = !DILocation(line: 0, scope: !2732)
!2735 = !DILocalVariable(name: "outlen", arg: 2, scope: !2732, file: !49, line: 700, type: !12)
!2736 = !DILocalVariable(name: "in", arg: 3, scope: !2732, file: !49, line: 700, type: !235)
!2737 = !DILocalVariable(name: "inlen", arg: 4, scope: !2732, file: !49, line: 700, type: !12)
!2738 = !DILocalVariable(name: "state", scope: !2732, file: !49, line: 702, type: !347)
!2739 = !DILocation(line: 702, column: 16, scope: !2732)
!2740 = !DILocation(line: 704, column: 3, scope: !2732)
!2741 = !DILocation(line: 705, column: 20, scope: !2732)
!2742 = !DILocalVariable(name: "nblocks", scope: !2732, file: !49, line: 701, type: !12)
!2743 = !DILocation(line: 706, column: 3, scope: !2732)
!2744 = !DILocation(line: 707, column: 21, scope: !2732)
!2745 = !DILocation(line: 707, column: 10, scope: !2732)
!2746 = !DILocation(line: 708, column: 18, scope: !2732)
!2747 = !DILocation(line: 708, column: 7, scope: !2732)
!2748 = !DILocation(line: 709, column: 3, scope: !2732)
!2749 = !DILocation(line: 710, column: 1, scope: !2732)
!2750 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_256", scope: !49, file: !49, line: 721, type: !2751, scopeLine: 721, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2751 = !DISubroutineType(types: !2752)
!2752 = !{null, !6, !235, !12}
!2753 = !DILocalVariable(name: "h", arg: 1, scope: !2750, file: !49, line: 721, type: !6)
!2754 = !DILocation(line: 0, scope: !2750)
!2755 = !DILocalVariable(name: "in", arg: 2, scope: !2750, file: !49, line: 721, type: !235)
!2756 = !DILocalVariable(name: "inlen", arg: 3, scope: !2750, file: !49, line: 721, type: !12)
!2757 = !DILocalVariable(name: "s", scope: !2750, file: !49, line: 723, type: !2758)
!2758 = !DICompositeType(tag: DW_TAG_array_type, baseType: !45, size: 1600, elements: !2759)
!2759 = !{!2760}
!2760 = !DISubrange(count: 25)
!2761 = !DILocation(line: 723, column: 12, scope: !2750)
!2762 = !DILocation(line: 725, column: 3, scope: !2750)
!2763 = !DILocation(line: 726, column: 3, scope: !2750)
!2764 = !DILocalVariable(name: "i", scope: !2750, file: !49, line: 722, type: !14)
!2765 = !DILocation(line: 727, column: 8, scope: !2766)
!2766 = distinct !DILexicalBlock(scope: !2750, file: !49, line: 727, column: 3)
!2767 = !DILocation(line: 727, scope: !2766)
!2768 = !DILocation(line: 727, column: 17, scope: !2769)
!2769 = distinct !DILexicalBlock(scope: !2766, file: !49, line: 727, column: 3)
!2770 = !DILocation(line: 727, column: 3, scope: !2766)
!2771 = !DILocation(line: 728, column: 19, scope: !2769)
!2772 = !DILocation(line: 728, column: 15, scope: !2769)
!2773 = !DILocation(line: 728, column: 24, scope: !2769)
!2774 = !DILocation(line: 728, column: 5, scope: !2769)
!2775 = !DILocation(line: 727, column: 23, scope: !2769)
!2776 = !DILocation(line: 727, column: 3, scope: !2769)
!2777 = distinct !{!2777, !2770, !2778, !105}
!2778 = !DILocation(line: 728, column: 28, scope: !2766)
!2779 = !DILocation(line: 729, column: 1, scope: !2750)
!2780 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_512", scope: !49, file: !49, line: 740, type: !2751, scopeLine: 740, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2781 = !DILocalVariable(name: "h", arg: 1, scope: !2780, file: !49, line: 740, type: !6)
!2782 = !DILocation(line: 0, scope: !2780)
!2783 = !DILocalVariable(name: "in", arg: 2, scope: !2780, file: !49, line: 740, type: !235)
!2784 = !DILocalVariable(name: "inlen", arg: 3, scope: !2780, file: !49, line: 740, type: !12)
!2785 = !DILocalVariable(name: "s", scope: !2780, file: !49, line: 742, type: !2758)
!2786 = !DILocation(line: 742, column: 12, scope: !2780)
!2787 = !DILocation(line: 744, column: 3, scope: !2780)
!2788 = !DILocation(line: 745, column: 3, scope: !2780)
!2789 = !DILocalVariable(name: "i", scope: !2780, file: !49, line: 741, type: !14)
!2790 = !DILocation(line: 746, column: 8, scope: !2791)
!2791 = distinct !DILexicalBlock(scope: !2780, file: !49, line: 746, column: 3)
!2792 = !DILocation(line: 746, scope: !2791)
!2793 = !DILocation(line: 746, column: 17, scope: !2794)
!2794 = distinct !DILexicalBlock(scope: !2791, file: !49, line: 746, column: 3)
!2795 = !DILocation(line: 746, column: 3, scope: !2791)
!2796 = !DILocation(line: 747, column: 19, scope: !2794)
!2797 = !DILocation(line: 747, column: 15, scope: !2794)
!2798 = !DILocation(line: 747, column: 24, scope: !2794)
!2799 = !DILocation(line: 747, column: 5, scope: !2794)
!2800 = !DILocation(line: 746, column: 23, scope: !2794)
!2801 = !DILocation(line: 746, column: 3, scope: !2794)
!2802 = distinct !{!2802, !2795, !2803, !105}
!2803 = !DILocation(line: 747, column: 28, scope: !2791)
!2804 = !DILocation(line: 748, column: 1, scope: !2780)
!2805 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_kyber_shake128_absorb", scope: !2806, file: !2806, line: 18, type: !2807, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !74, retainedNodes: !24)
!2806 = !DIFile(filename: "../../../ref/symmetric-shake.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!2807 = !DISubroutineType(types: !2808)
!2808 = !{null, !1866, !235, !7, !7}
!2809 = !DILocalVariable(name: "state", arg: 1, scope: !2805, file: !2806, line: 18, type: !1866)
!2810 = !DILocation(line: 0, scope: !2805)
!2811 = !DILocalVariable(name: "seed", arg: 2, scope: !2805, file: !2806, line: 19, type: !235)
!2812 = !DILocalVariable(name: "x", arg: 3, scope: !2805, file: !2806, line: 20, type: !7)
!2813 = !DILocalVariable(name: "y", arg: 4, scope: !2805, file: !2806, line: 21, type: !7)
!2814 = !DILocalVariable(name: "extseed", scope: !2805, file: !2806, line: 23, type: !2815)
!2815 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 272, elements: !2816)
!2816 = !{!2817}
!2817 = !DISubrange(count: 34)
!2818 = !DILocation(line: 23, column: 11, scope: !2805)
!2819 = !DILocation(line: 25, column: 3, scope: !2805)
!2820 = !DILocation(line: 26, column: 3, scope: !2805)
!2821 = !DILocation(line: 26, column: 29, scope: !2805)
!2822 = !DILocation(line: 27, column: 3, scope: !2805)
!2823 = !DILocation(line: 27, column: 29, scope: !2805)
!2824 = !DILocation(line: 29, column: 3, scope: !2805)
!2825 = !DILocation(line: 30, column: 1, scope: !2805)
!2826 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_kyber_shake256_prf", scope: !2806, file: !2806, line: 43, type: !2827, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !74, retainedNodes: !24)
!2827 = !DISubroutineType(types: !2828)
!2828 = !{null, !6, !12, !235, !7}
!2829 = !DILocalVariable(name: "out", arg: 1, scope: !2826, file: !2806, line: 43, type: !6)
!2830 = !DILocation(line: 0, scope: !2826)
!2831 = !DILocalVariable(name: "outlen", arg: 2, scope: !2826, file: !2806, line: 43, type: !12)
!2832 = !DILocalVariable(name: "key", arg: 3, scope: !2826, file: !2806, line: 43, type: !235)
!2833 = !DILocalVariable(name: "nonce", arg: 4, scope: !2826, file: !2806, line: 43, type: !7)
!2834 = !DILocalVariable(name: "extkey", scope: !2826, file: !2806, line: 45, type: !2835)
!2835 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 264, elements: !2836)
!2836 = !{!2837}
!2837 = !DISubrange(count: 33)
!2838 = !DILocation(line: 45, column: 11, scope: !2826)
!2839 = !DILocation(line: 47, column: 3, scope: !2826)
!2840 = !DILocation(line: 48, column: 3, scope: !2826)
!2841 = !DILocation(line: 48, column: 26, scope: !2826)
!2842 = !DILocation(line: 50, column: 3, scope: !2826)
!2843 = !DILocation(line: 51, column: 1, scope: !2826)
!2844 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_kyber_shake256_rkprf", scope: !2806, file: !2806, line: 64, type: !642, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !74, retainedNodes: !24)
!2845 = !DILocalVariable(name: "out", arg: 1, scope: !2844, file: !2806, line: 64, type: !6)
!2846 = !DILocation(line: 0, scope: !2844)
!2847 = !DILocalVariable(name: "key", arg: 2, scope: !2844, file: !2806, line: 64, type: !235)
!2848 = !DILocalVariable(name: "input", arg: 3, scope: !2844, file: !2806, line: 64, type: !235)
!2849 = !DILocalVariable(name: "s", scope: !2844, file: !2806, line: 66, type: !347)
!2850 = !DILocation(line: 66, column: 16, scope: !2844)
!2851 = !DILocation(line: 68, column: 3, scope: !2844)
!2852 = !DILocation(line: 69, column: 3, scope: !2844)
!2853 = !DILocation(line: 70, column: 3, scope: !2844)
!2854 = !DILocation(line: 71, column: 3, scope: !2844)
!2855 = !DILocation(line: 72, column: 3, scope: !2844)
!2856 = !DILocation(line: 73, column: 1, scope: !2844)
