; ModuleID = 'kyber_composite'
source_filename = "kyber_composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "arm-unknown-none-eabi"

@randombytes.fd = internal unnamed_addr global i32 -1, align 4, !dbg !0
@.str = private unnamed_addr constant [13 x i8] c"/dev/urandom\00", align 1, !dbg !18
@pqcrystals_kyber512_ref_zetas = dso_local local_unnamed_addr constant [128 x i16] [i16 -1044, i16 -758, i16 -359, i16 -1517, i16 1493, i16 1422, i16 287, i16 202, i16 -171, i16 622, i16 1577, i16 182, i16 962, i16 -1202, i16 -1474, i16 1468, i16 573, i16 -1325, i16 264, i16 383, i16 -829, i16 1458, i16 -1602, i16 -130, i16 -681, i16 1017, i16 732, i16 608, i16 -1542, i16 411, i16 -205, i16 -1571, i16 1223, i16 652, i16 -552, i16 1015, i16 -1293, i16 1491, i16 -282, i16 -1544, i16 516, i16 -8, i16 -320, i16 -666, i16 -1618, i16 -1162, i16 126, i16 1469, i16 -853, i16 -90, i16 -271, i16 830, i16 107, i16 -1421, i16 -247, i16 -951, i16 -398, i16 961, i16 -1508, i16 -725, i16 448, i16 -1065, i16 677, i16 -1275, i16 -1103, i16 430, i16 555, i16 843, i16 -1251, i16 871, i16 1550, i16 105, i16 422, i16 587, i16 177, i16 -235, i16 -291, i16 -460, i16 1574, i16 1653, i16 -246, i16 778, i16 1159, i16 -147, i16 -777, i16 1483, i16 -602, i16 1119, i16 -1590, i16 644, i16 -872, i16 349, i16 418, i16 329, i16 -156, i16 -75, i16 817, i16 1097, i16 603, i16 610, i16 1322, i16 -1285, i16 -1465, i16 384, i16 -1215, i16 -136, i16 1218, i16 -1335, i16 -874, i16 220, i16 -1187, i16 -1659, i16 -1185, i16 -1530, i16 -1278, i16 794, i16 -1510, i16 -854, i16 -870, i16 478, i16 -108, i16 -308, i16 996, i16 991, i16 958, i16 -1460, i16 1522, i16 1628], align 2, !dbg !26
@KeccakF_RoundConstants = internal unnamed_addr constant [24 x i64] [i64 1, i64 32898, i64 -9223372036854742902, i64 -9223372034707259392, i64 32907, i64 2147483649, i64 -9223372034707259263, i64 -9223372036854743031, i64 138, i64 136, i64 2147516425, i64 2147483658, i64 2147516555, i64 -9223372036854775669, i64 -9223372036854742903, i64 -9223372036854743037, i64 -9223372036854743038, i64 -9223372036854775680, i64 32778, i64 -9223372034707292150, i64 -9223372034707259263, i64 -9223372036854742912, i64 2147483649, i64 -9223372034707259384], align 8, !dbg !41

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @main() local_unnamed_addr #0 !dbg !84 {
entry:
    #dbg_value(i32 0, !88, !DIExpression(), !89)
  br label %for.cond, !dbg !90

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !92
    #dbg_value(i32 %i.0, !88, !DIExpression(), !89)
  %exitcond = icmp ne i32 %i.0, 1000, !dbg !93
  br i1 %exitcond, label %for.body, label %return, !dbg !95

for.body:                                         ; preds = %for.cond
  %call = call fastcc i32 @test_keys() #3, !dbg !96
    #dbg_value(i32 %call, !98, !DIExpression(), !89)
  %call1 = call fastcc i32 @test_invalid_sk_a() #3, !dbg !99
  %or = or i32 %call, %call1, !dbg !100
    #dbg_value(i32 %or, !98, !DIExpression(), !89)
  %call2 = call fastcc i32 @test_invalid_ciphertext() #3, !dbg !101
  %or3 = or i32 %or, %call2, !dbg !102
    #dbg_value(i32 %or3, !98, !DIExpression(), !89)
  %tobool.not = icmp eq i32 %or3, 0, !dbg !103
  br i1 %tobool.not, label %for.inc, label %return, !dbg !103

for.inc:                                          ; preds = %for.body
  %inc = add nuw nsw i32 %i.0, 1, !dbg !105
    #dbg_value(i32 %inc, !88, !DIExpression(), !89)
  br label %for.cond, !dbg !106, !llvm.loop !107

return:                                           ; preds = %for.cond, %for.body
  %retval.0 = phi i32 [ 1, %for.body ], [ 0, %for.cond ], !dbg !89
  ret i32 %retval.0, !dbg !110
}

; Function Attrs: nounwind
define internal fastcc range(i32 0, 2) i32 @test_keys() unnamed_addr #0 !dbg !111 {
entry:
  %pk = alloca [800 x i8], align 1
  %sk = alloca [1632 x i8], align 1
  %ct = alloca [768 x i8], align 1
  %key_a = alloca [32 x i8], align 1
  %key_b = alloca [32 x i8], align 1
    #dbg_declare(ptr %pk, !112, !DIExpression(), !116)
    #dbg_declare(ptr %sk, !117, !DIExpression(), !121)
    #dbg_declare(ptr %ct, !122, !DIExpression(), !126)
    #dbg_declare(ptr %key_a, !127, !DIExpression(), !131)
    #dbg_declare(ptr %key_b, !132, !DIExpression(), !133)
  %call = call i32 @pqcrystals_kyber512_ref_keypair(ptr noundef nonnull %pk, ptr noundef nonnull %sk) #3, !dbg !134
  %call5 = call i32 @pqcrystals_kyber512_ref_enc(ptr noundef nonnull %ct, ptr noundef nonnull %key_b, ptr noundef nonnull %pk) #3, !dbg !135
  %call9 = call i32 @pqcrystals_kyber512_ref_dec(ptr noundef nonnull %key_a, ptr noundef nonnull %ct, ptr noundef nonnull %sk) #3, !dbg !136
  %call12 = call i32 @memcmp(ptr noundef nonnull %key_a, ptr noundef nonnull %key_b, i32 noundef 32) #3, !dbg !137
  %tobool.not = icmp ne i32 %call12, 0, !dbg !137
  %. = zext i1 %tobool.not to i32, !dbg !139
  ret i32 %., !dbg !140
}

; Function Attrs: nounwind
define internal fastcc range(i32 0, 2) i32 @test_invalid_sk_a() unnamed_addr #0 !dbg !141 {
entry:
  %pk = alloca [800 x i8], align 1
  %sk = alloca [1632 x i8], align 1
  %ct = alloca [768 x i8], align 1
  %key_a = alloca [32 x i8], align 1
  %key_b = alloca [32 x i8], align 1
    #dbg_declare(ptr %pk, !142, !DIExpression(), !143)
    #dbg_declare(ptr %sk, !144, !DIExpression(), !145)
    #dbg_declare(ptr %ct, !146, !DIExpression(), !147)
    #dbg_declare(ptr %key_a, !148, !DIExpression(), !149)
    #dbg_declare(ptr %key_b, !150, !DIExpression(), !151)
  %call = call i32 @pqcrystals_kyber512_ref_keypair(ptr noundef nonnull %pk, ptr noundef nonnull %sk) #3, !dbg !152
  %call5 = call i32 @pqcrystals_kyber512_ref_enc(ptr noundef nonnull %ct, ptr noundef nonnull %key_b, ptr noundef nonnull %pk) #3, !dbg !153
  call void @randombytes(ptr noundef nonnull %sk, i32 noundef 1632) #3, !dbg !154
  %call10 = call i32 @pqcrystals_kyber512_ref_dec(ptr noundef nonnull %key_a, ptr noundef nonnull %ct, ptr noundef nonnull %sk) #3, !dbg !155
  %call13 = call i32 @memcmp(ptr noundef nonnull %key_a, ptr noundef nonnull %key_b, i32 noundef 32) #3, !dbg !156
  %tobool.not = icmp eq i32 %call13, 0, !dbg !156
  %. = zext i1 %tobool.not to i32, !dbg !158
  ret i32 %., !dbg !159
}

; Function Attrs: nounwind
define internal fastcc range(i32 0, 2) i32 @test_invalid_ciphertext() unnamed_addr #0 !dbg !160 {
entry:
  %pk = alloca [800 x i8], align 1
  %sk = alloca [1632 x i8], align 1
  %ct = alloca [768 x i8], align 1
  %key_a = alloca [32 x i8], align 1
  %key_b = alloca [32 x i8], align 1
  %b = alloca i8, align 1
  %pos = alloca i32, align 4
    #dbg_declare(ptr %pk, !161, !DIExpression(), !162)
    #dbg_declare(ptr %sk, !163, !DIExpression(), !164)
    #dbg_declare(ptr %ct, !165, !DIExpression(), !166)
    #dbg_declare(ptr %key_a, !167, !DIExpression(), !168)
    #dbg_declare(ptr %key_b, !169, !DIExpression(), !170)
  br label %do.body, !dbg !171

do.body:                                          ; preds = %do.body, %entry
    #dbg_value(ptr %b, !172, !DIExpression(DW_OP_deref), !173)
  call void @randombytes(ptr noundef nonnull %b, i32 noundef 1) #3, !dbg !174
  %0 = load i8, ptr %b, align 1, !dbg !176
    #dbg_value(i8 %0, !172, !DIExpression(), !173)
  %tobool.not = icmp eq i8 %0, 0, !dbg !177
  br i1 %tobool.not, label %do.body, label %do.end, !dbg !178, !llvm.loop !179

do.end:                                           ; preds = %do.body
    #dbg_value(ptr %pos, !181, !DIExpression(DW_OP_deref), !173)
  call void @randombytes(ptr noundef nonnull %pos, i32 noundef 4) #3, !dbg !182
  %call = call i32 @pqcrystals_kyber512_ref_keypair(ptr noundef nonnull %pk, ptr noundef nonnull %sk) #3, !dbg !183
  %call5 = call i32 @pqcrystals_kyber512_ref_enc(ptr noundef nonnull %ct, ptr noundef nonnull %key_b, ptr noundef nonnull %pk) #3, !dbg !184
  %1 = load i8, ptr %b, align 1, !dbg !185
    #dbg_value(i8 %1, !172, !DIExpression(), !173)
  %2 = load i32, ptr %pos, align 4, !dbg !186
    #dbg_value(i32 %2, !181, !DIExpression(), !173)
  %rem = urem i32 %2, 768, !dbg !187
  %arrayidx = getelementptr inbounds nuw [768 x i8], ptr %ct, i32 0, i32 %rem, !dbg !188
  %3 = load i8, ptr %arrayidx, align 1, !dbg !189
  %xor1 = xor i8 %3, %1, !dbg !189
  store i8 %xor1, ptr %arrayidx, align 1, !dbg !189
  %call11 = call i32 @pqcrystals_kyber512_ref_dec(ptr noundef nonnull %key_a, ptr noundef nonnull %ct, ptr noundef nonnull %sk) #3, !dbg !190
  %call14 = call i32 @memcmp(ptr noundef nonnull %key_a, ptr noundef nonnull %key_b, i32 noundef 32) #3, !dbg !191
  %tobool15.not = icmp eq i32 %call14, 0, !dbg !191
  %. = zext i1 %tobool15.not to i32, !dbg !173
  ret i32 %., !dbg !193
}

; Function Attrs: nounwind
define dso_local void @randombytes(ptr noundef %out, i32 noundef %outlen) local_unnamed_addr #0 !dbg !2 {
entry:
    #dbg_value(ptr %out, !194, !DIExpression(), !195)
    #dbg_value(i32 %outlen, !196, !DIExpression(), !195)
  br label %while.cond, !dbg !197

while.cond:                                       ; preds = %while.cond.backedge, %entry
  %0 = load i32, ptr @randombytes.fd, align 4, !dbg !198
  %cmp = icmp eq i32 %0, -1, !dbg !199
  br i1 %cmp, label %while.body, label %while.cond7.preheader, !dbg !197

while.cond7.preheader:                            ; preds = %while.cond
  br label %while.cond7.outer, !dbg !200

while.body:                                       ; preds = %while.cond
  %call = call i32 (ptr, i32, ...) @open(ptr noundef nonnull @.str, i32 noundef 0) #4, !dbg !201
  store i32 %call, ptr @randombytes.fd, align 4, !dbg !203
  %cmp1 = icmp eq i32 %call, -1, !dbg !204
  br i1 %cmp1, label %land.lhs.true, label %if.else, !dbg !206

land.lhs.true:                                    ; preds = %while.body
  %call2 = call ptr @__errno() #4, !dbg !207
  %1 = load i32, ptr %call2, align 4, !dbg !207
  %cmp3 = icmp eq i32 %1, 4, !dbg !208
  br i1 %cmp3, label %while.cond.backedge, label %if.else, !dbg !206

if.else:                                          ; preds = %land.lhs.true, %while.body
  %2 = load i32, ptr @randombytes.fd, align 4, !dbg !209
  %cmp4 = icmp eq i32 %2, -1, !dbg !211
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !211

if.then5:                                         ; preds = %if.else
  call void @abort() #4, !dbg !212
  br label %if.end6, !dbg !212

if.end6:                                          ; preds = %if.else, %if.then5
  br label %while.cond.backedge, !dbg !197

while.cond.backedge:                              ; preds = %if.end6, %land.lhs.true
  br label %while.cond, !dbg !198, !llvm.loop !213

while.cond7:                                      ; preds = %while.cond7.outer, %land.lhs.true12
    #dbg_value(ptr %out.addr.0.ph, !194, !DIExpression(), !195)
    #dbg_value(i32 %outlen.addr.0.ph, !196, !DIExpression(), !195)
  %cmp8.not = icmp eq i32 %outlen.addr.0.ph, 0, !dbg !215
  br i1 %cmp8.not, label %while.end21, label %while.body9, !dbg !200

while.body9:                                      ; preds = %while.cond7
  %3 = load i32, ptr @randombytes.fd, align 4, !dbg !216
  %call10 = call i32 @read(i32 noundef %3, ptr noundef %out.addr.0.ph, i32 noundef %outlen.addr.0.ph) #4, !dbg !218
    #dbg_value(i32 %call10, !219, !DIExpression(), !195)
  %cond = icmp eq i32 %call10, -1, !dbg !224
  br i1 %cond, label %land.lhs.true12, label %if.end20.loopexit, !dbg !224

land.lhs.true12:                                  ; preds = %while.body9
  %call13 = call ptr @__errno() #4, !dbg !226
  %4 = load i32, ptr %call13, align 4, !dbg !226
  %cmp14 = icmp eq i32 %4, 4, !dbg !227
  br i1 %cmp14, label %while.cond7, label %if.then18, !dbg !224, !llvm.loop !228

if.then18:                                        ; preds = %land.lhs.true12
  %call10.lcssa1 = phi i32 [ %call10, %land.lhs.true12 ], !dbg !218
  call void @abort() #4, !dbg !230
  br label %if.end20, !dbg !230

if.end20.loopexit:                                ; preds = %while.body9
  %call10.lcssa = phi i32 [ %call10, %while.body9 ], !dbg !218
  br label %if.end20, !dbg !232

if.end20:                                         ; preds = %if.end20.loopexit, %if.then18
  %call102 = phi i32 [ %call10.lcssa, %if.end20.loopexit ], [ %call10.lcssa1, %if.then18 ]
  %add.ptr = getelementptr inbounds i8, ptr %out.addr.0.ph, i32 %call102, !dbg !232
    #dbg_value(ptr %add.ptr, !194, !DIExpression(), !195)
  %sub = sub i32 %outlen.addr.0.ph, %call102, !dbg !233
    #dbg_value(i32 %sub, !196, !DIExpression(), !195)
  br label %while.cond7.outer, !dbg !200, !llvm.loop !228

while.cond7.outer:                                ; preds = %while.cond7.preheader, %if.end20
  %outlen.addr.0.ph = phi i32 [ %outlen, %while.cond7.preheader ], [ %sub, %if.end20 ]
  %out.addr.0.ph = phi ptr [ %out, %while.cond7.preheader ], [ %add.ptr, %if.end20 ]
  br label %while.cond7, !dbg !200

while.end21:                                      ; preds = %while.cond7
  ret void, !dbg !234
}

declare dso_local i32 @open(ptr noundef, i32 noundef, ...) local_unnamed_addr #1

declare dso_local ptr @__errno() local_unnamed_addr #1

declare dso_local void @abort() local_unnamed_addr #1

declare dso_local i32 @read(i32 noundef, ptr noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber512_ref_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) local_unnamed_addr #0 !dbg !235 {
entry:
    #dbg_value(ptr %pk, !239, !DIExpression(), !240)
    #dbg_value(ptr %sk, !241, !DIExpression(), !240)
    #dbg_value(ptr %coins, !242, !DIExpression(), !240)
  call void @pqcrystals_kyber512_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) #3, !dbg !243
  %add.ptr = getelementptr inbounds nuw i8, ptr %sk, i32 768, !dbg !244
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr, ptr noundef %pk, i32 noundef 800) #3, !dbg !245
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %sk, i32 1568, !dbg !246
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr2, ptr noundef %pk, i32 noundef 800) #3, !dbg !246
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %sk, i32 1600, !dbg !247
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %coins, i32 32, !dbg !248
  %call6 = call ptr @memcpy(ptr noundef nonnull %add.ptr4, ptr noundef nonnull %add.ptr5, i32 noundef 32) #3, !dbg !249
  ret i32 0, !dbg !250
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber512_ref_keypair(ptr noundef %pk, ptr noundef %sk) local_unnamed_addr #0 !dbg !251 {
entry:
  %coins = alloca [64 x i8], align 1
    #dbg_value(ptr %pk, !254, !DIExpression(), !255)
    #dbg_value(ptr %sk, !256, !DIExpression(), !255)
    #dbg_declare(ptr %coins, !257, !DIExpression(), !261)
  call void @randombytes(ptr noundef nonnull %coins, i32 noundef 64) #3, !dbg !262
  %call = call i32 @pqcrystals_kyber512_ref_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef nonnull %coins) #3, !dbg !263
  ret i32 0, !dbg !264
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber512_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef %coins) local_unnamed_addr #0 !dbg !265 {
entry:
  %buf = alloca [64 x i8], align 1
  %kr = alloca [64 x i8], align 1
    #dbg_value(ptr %ct, !268, !DIExpression(), !269)
    #dbg_value(ptr %ss, !270, !DIExpression(), !269)
    #dbg_value(ptr %pk, !271, !DIExpression(), !269)
    #dbg_value(ptr %coins, !272, !DIExpression(), !269)
    #dbg_declare(ptr %buf, !273, !DIExpression(), !274)
    #dbg_declare(ptr %kr, !275, !DIExpression(), !276)
  %call = call ptr @memcpy(ptr noundef nonnull %buf, ptr noundef %coins, i32 noundef 32) #3, !dbg !277
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !278
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr, ptr noundef %pk, i32 noundef 800) #3, !dbg !278
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %kr, ptr noundef nonnull %buf, i32 noundef 64) #3, !dbg !279
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %kr, i32 32, !dbg !280
  call void @pqcrystals_kyber512_ref_indcpa_enc(ptr noundef %ct, ptr noundef nonnull %buf, ptr noundef %pk, ptr noundef nonnull %add.ptr6) #3, !dbg !281
  %call8 = call ptr @memcpy(ptr noundef %ss, ptr noundef nonnull %kr, i32 noundef 32) #3, !dbg !282
  ret i32 0, !dbg !283
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber512_ref_enc(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk) local_unnamed_addr #0 !dbg !284 {
entry:
  %coins = alloca [32 x i8], align 1
    #dbg_value(ptr %ct, !285, !DIExpression(), !286)
    #dbg_value(ptr %ss, !287, !DIExpression(), !286)
    #dbg_value(ptr %pk, !288, !DIExpression(), !286)
    #dbg_declare(ptr %coins, !289, !DIExpression(), !290)
  call void @randombytes(ptr noundef nonnull %coins, i32 noundef 32) #3, !dbg !291
  %call = call i32 @pqcrystals_kyber512_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef nonnull %coins) #3, !dbg !292
  ret i32 0, !dbg !293
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber512_ref_dec(ptr noundef %ss, ptr noundef %ct, ptr noundef %sk) local_unnamed_addr #0 !dbg !294 {
entry:
  %buf = alloca [64 x i8], align 1
  %kr = alloca [64 x i8], align 1
  %cmp = alloca [768 x i8], align 1
    #dbg_value(ptr %ss, !297, !DIExpression(), !298)
    #dbg_value(ptr %ct, !299, !DIExpression(), !298)
    #dbg_value(ptr %sk, !300, !DIExpression(), !298)
    #dbg_declare(ptr %buf, !301, !DIExpression(), !302)
    #dbg_declare(ptr %kr, !303, !DIExpression(), !304)
    #dbg_declare(ptr %cmp, !305, !DIExpression(), !306)
  %add.ptr = getelementptr inbounds nuw i8, ptr %sk, i32 768, !dbg !307
    #dbg_value(ptr %add.ptr, !308, !DIExpression(), !298)
  call void @pqcrystals_kyber512_ref_indcpa_dec(ptr noundef nonnull %buf, ptr noundef %ct, ptr noundef %sk) #3, !dbg !309
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !310
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %sk, i32 1568, !dbg !311
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr2, ptr noundef nonnull %add.ptr4, i32 noundef 32) #3, !dbg !312
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %kr, ptr noundef nonnull %buf, i32 noundef 64) #3, !dbg !313
  %add.ptr10 = getelementptr inbounds nuw i8, ptr %kr, i32 32, !dbg !314
  call void @pqcrystals_kyber512_ref_indcpa_enc(ptr noundef nonnull %cmp, ptr noundef nonnull %buf, ptr noundef nonnull %add.ptr, ptr noundef nonnull %add.ptr10) #3, !dbg !315
  %call12 = call i32 @pqcrystals_kyber512_ref_verify(ptr noundef %ct, ptr noundef nonnull %cmp, i32 noundef 768) #3, !dbg !316
    #dbg_value(i32 %call12, !317, !DIExpression(), !298)
  %add.ptr14 = getelementptr inbounds nuw i8, ptr %sk, i32 1600, !dbg !318
  call void @pqcrystals_kyber512_ref_kyber_shake256_rkprf(ptr noundef %ss, ptr noundef nonnull %add.ptr14, ptr noundef %ct) #3, !dbg !318
  %0 = trunc nuw nsw i32 %call12 to i8, !dbg !319
  %conv = xor i8 %0, 1, !dbg !319
  call void @pqcrystals_kyber512_ref_cmov(ptr noundef %ss, ptr noundef nonnull %kr, i32 noundef 32, i8 noundef zeroext %conv) #3, !dbg !320
  ret i32 0, !dbg !321
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_gen_matrix(ptr noundef %a, ptr noundef %seed, i32 noundef %transposed) local_unnamed_addr #0 !dbg !322 {
entry:
  %buf = alloca [504 x i8], align 1
  %state = alloca [26 x i64], align 8
    #dbg_value(ptr %a, !337, !DIExpression(), !338)
    #dbg_value(ptr %seed, !339, !DIExpression(), !338)
    #dbg_value(i32 %transposed, !340, !DIExpression(), !338)
    #dbg_declare(ptr %buf, !341, !DIExpression(), !345)
    #dbg_declare(ptr %state, !346, !DIExpression(), !354)
    #dbg_value(i32 0, !355, !DIExpression(), !338)
  br label %for.cond, !dbg !356

for.cond:                                         ; preds = %for.inc18, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc19, %for.inc18 ], !dbg !358
    #dbg_value(i32 %i.0, !355, !DIExpression(), !338)
  %exitcond1 = icmp ne i32 %i.0, 2, !dbg !359
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end20, !dbg !361

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !362

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc
  %j.0 = phi i32 [ %inc, %for.inc ], [ 0, %for.cond1.preheader ], !dbg !365
    #dbg_value(i32 %j.0, !366, !DIExpression(), !338)
  %exitcond = icmp ne i32 %j.0, 2, !dbg !367
  br i1 %exitcond, label %for.body3, label %for.inc18, !dbg !362

for.body3:                                        ; preds = %for.cond1
  %tobool.not = icmp eq i32 %transposed, 0, !dbg !369
  br i1 %tobool.not, label %if.else, label %if.then, !dbg !369

if.then:                                          ; preds = %for.body3
  %conv = trunc nuw i32 %i.0 to i8, !dbg !372
  %conv4 = trunc nuw nsw i32 %j.0 to i8, !dbg !372
  call void @pqcrystals_kyber512_ref_kyber_shake128_absorb(ptr noundef nonnull %state, ptr noundef %seed, i8 noundef zeroext %conv, i8 noundef zeroext %conv4) #3, !dbg !372
  br label %if.end, !dbg !372

if.else:                                          ; preds = %for.body3
  %conv5 = trunc nuw nsw i32 %j.0 to i8, !dbg !373
  %conv6 = trunc nuw i32 %i.0 to i8, !dbg !373
  call void @pqcrystals_kyber512_ref_kyber_shake128_absorb(ptr noundef nonnull %state, ptr noundef %seed, i8 noundef zeroext %conv5, i8 noundef zeroext %conv6) #3, !dbg !373
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef nonnull %buf, i32 noundef 3, ptr noundef nonnull %state) #3, !dbg !374
    #dbg_value(i32 504, !375, !DIExpression(), !338)
  %arrayidx7 = getelementptr inbounds nuw [2 x [256 x i16]], ptr %a, i32 %i.0, i32 %j.0, !dbg !376
  %call = call fastcc i32 @rej_uniform(ptr noundef %arrayidx7, i32 noundef 256, ptr noundef nonnull %buf, i32 noundef 504) #3, !dbg !377
    #dbg_value(i32 %call, !378, !DIExpression(), !338)
  br label %while.cond, !dbg !379

while.cond:                                       ; preds = %while.body, %if.end
  %ctr.0 = phi i32 [ %call, %if.end ], [ %add, %while.body ], !dbg !380
    #dbg_value(i32 %ctr.0, !378, !DIExpression(), !338)
  %cmp10 = icmp ult i32 %ctr.0, 256, !dbg !381
  br i1 %cmp10, label %while.body, label %for.inc, !dbg !379

while.body:                                       ; preds = %while.cond
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef nonnull %buf, i32 noundef 1, ptr noundef nonnull %state) #3, !dbg !382
    #dbg_value(i32 168, !375, !DIExpression(), !338)
  %arrayidx14 = getelementptr inbounds nuw [2 x [256 x i16]], ptr %a, i32 %i.0, i32 %j.0, !dbg !384
  %add.ptr = getelementptr inbounds nuw i16, ptr %arrayidx14, i32 %ctr.0, !dbg !385
  %sub = sub nuw nsw i32 256, %ctr.0, !dbg !386
  %call17 = call fastcc i32 @rej_uniform(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef nonnull %buf, i32 noundef 168) #3, !dbg !387
  %add = add i32 %ctr.0, %call17, !dbg !388
    #dbg_value(i32 %add, !378, !DIExpression(), !338)
  br label %while.cond, !dbg !379, !llvm.loop !389

for.inc:                                          ; preds = %while.cond
  %inc = add nuw nsw i32 %j.0, 1, !dbg !391
    #dbg_value(i32 %inc, !366, !DIExpression(), !338)
  br label %for.cond1, !dbg !392, !llvm.loop !393

for.inc18:                                        ; preds = %for.cond1
  %inc19 = add nuw nsw i32 %i.0, 1, !dbg !395
    #dbg_value(i32 %inc19, !355, !DIExpression(), !338)
  br label %for.cond, !dbg !396, !llvm.loop !397

for.end20:                                        ; preds = %for.cond
  ret void, !dbg !399
}

; Function Attrs: nounwind
define internal fastcc i32 @rej_uniform(ptr noundef %r, i32 noundef range(i32 1, 257) %len, ptr noundef nonnull %buf, i32 noundef range(i32 168, 505) %buflen) unnamed_addr #0 !dbg !400 {
entry:
    #dbg_value(ptr %r, !404, !DIExpression(), !405)
    #dbg_value(i32 %len, !406, !DIExpression(), !405)
    #dbg_value(ptr %buf, !407, !DIExpression(), !405)
    #dbg_value(i32 %buflen, !408, !DIExpression(), !405)
    #dbg_value(i32 0, !409, !DIExpression(), !405)
    #dbg_value(i32 0, !410, !DIExpression(), !405)
  br label %while.cond, !dbg !411

while.cond:                                       ; preds = %if.end33, %entry
  %ctr.0 = phi i32 [ 0, %entry ], [ %ctr.2, %if.end33 ], !dbg !405
  %pos.0 = phi i32 [ 0, %entry ], [ %add20, %if.end33 ], !dbg !405
    #dbg_value(i32 %pos.0, !409, !DIExpression(), !405)
    #dbg_value(i32 %ctr.0, !410, !DIExpression(), !405)
  %cmp = icmp ult i32 %ctr.0, %len, !dbg !412
  %add = add nuw nsw i32 %pos.0, 3, !dbg !413
  %cmp1 = icmp ule i32 %add, %buflen, !dbg !413
  %0 = select i1 %cmp, i1 %cmp1, i1 false, !dbg !413
  br i1 %0, label %while.body, label %while.end, !dbg !411

while.body:                                       ; preds = %while.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %buf, i32 %pos.0, !dbg !414
  %1 = load i8, ptr %arrayidx, align 1, !dbg !414
  %conv = zext i8 %1 to i16, !dbg !414
  %2 = getelementptr i8, ptr %buf, i32 %pos.0, !dbg !416
  %arrayidx4 = getelementptr i8, ptr %2, i32 1, !dbg !416
  %3 = load i8, ptr %arrayidx4, align 1, !dbg !416
  %conv6 = zext i8 %3 to i16, !dbg !417
  %shl = shl nuw i16 %conv6, 8, !dbg !418
  %shl.masked = and i16 %shl, 3840, !dbg !419
  %and = or disjoint i16 %shl.masked, %conv, !dbg !419
    #dbg_value(i16 %and, !420, !DIExpression(), !405)
  %4 = getelementptr i8, ptr %buf, i32 %pos.0, !dbg !421
  %arrayidx9 = getelementptr i8, ptr %4, i32 1, !dbg !421
  %5 = load i8, ptr %arrayidx9, align 1, !dbg !421
  %6 = lshr i8 %5, 4, !dbg !422
  %shr11 = zext nneg i8 %6 to i16, !dbg !422
  %7 = getelementptr i8, ptr %buf, i32 %pos.0, !dbg !423
  %arrayidx13 = getelementptr i8, ptr %7, i32 2, !dbg !423
  %8 = load i8, ptr %arrayidx13, align 1, !dbg !423
  %conv15 = zext i8 %8 to i16, !dbg !424
  %shl16 = shl nuw nsw i16 %conv15, 4, !dbg !425
  %or17 = or disjoint i16 %shl16, %shr11, !dbg !426
    #dbg_value(i16 %or17, !427, !DIExpression(), !405)
  %add20 = add nuw nsw i32 %pos.0, 3, !dbg !428
    #dbg_value(i32 %add20, !409, !DIExpression(), !405)
  %cmp22 = icmp samesign ult i16 %and, 3329, !dbg !429
  br i1 %cmp22, label %if.then, label %if.end, !dbg !429

if.then:                                          ; preds = %while.body
  %inc = add nuw nsw i32 %ctr.0, 1, !dbg !431
    #dbg_value(i32 %inc, !410, !DIExpression(), !405)
  %arrayidx24 = getelementptr inbounds nuw i16, ptr %r, i32 %ctr.0, !dbg !432
  store i16 %and, ptr %arrayidx24, align 2, !dbg !433
  br label %if.end, !dbg !432

if.end:                                           ; preds = %if.then, %while.body
  %ctr.1 = phi i32 [ %inc, %if.then ], [ %ctr.0, %while.body ], !dbg !405
    #dbg_value(i32 %ctr.1, !410, !DIExpression(), !405)
  %cmp25 = icmp ult i32 %ctr.1, %len, !dbg !434
  %cmp28 = icmp samesign ult i16 %or17, 3329
  %or.cond = select i1 %cmp25, i1 %cmp28, i1 false, !dbg !436
  br i1 %or.cond, label %if.then30, label %if.end33, !dbg !436

if.then30:                                        ; preds = %if.end
  %inc31 = add nuw nsw i32 %ctr.1, 1, !dbg !437
    #dbg_value(i32 %inc31, !410, !DIExpression(), !405)
  %arrayidx32 = getelementptr inbounds nuw i16, ptr %r, i32 %ctr.1, !dbg !438
  store i16 %or17, ptr %arrayidx32, align 2, !dbg !439
  br label %if.end33, !dbg !438

if.end33:                                         ; preds = %if.then30, %if.end
  %ctr.2 = phi i32 [ %inc31, %if.then30 ], [ %ctr.1, %if.end ], !dbg !440
    #dbg_value(i32 %ctr.2, !410, !DIExpression(), !405)
  br label %while.cond, !dbg !411, !llvm.loop !441

while.end:                                        ; preds = %while.cond
  %ctr.0.lcssa = phi i32 [ %ctr.0, %while.cond ], !dbg !405
  ret i32 %ctr.0.lcssa, !dbg !443
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) local_unnamed_addr #0 !dbg !444 {
entry:
  %buf = alloca [64 x i8], align 1
  %a = alloca [2 x [2 x [256 x i16]]], align 2
  %e = alloca [2 x [256 x i16]], align 2
  %pkpv = alloca [2 x [256 x i16]], align 2
  %skpv = alloca [2 x [256 x i16]], align 2
    #dbg_value(ptr %pk, !447, !DIExpression(), !448)
    #dbg_value(ptr %sk, !449, !DIExpression(), !448)
    #dbg_value(ptr %coins, !450, !DIExpression(), !448)
    #dbg_declare(ptr %buf, !451, !DIExpression(), !452)
    #dbg_value(ptr %buf, !453, !DIExpression(), !448)
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !454
    #dbg_value(ptr %add.ptr, !455, !DIExpression(), !448)
    #dbg_value(i8 0, !456, !DIExpression(), !448)
    #dbg_declare(ptr %a, !457, !DIExpression(), !459)
    #dbg_declare(ptr %e, !460, !DIExpression(), !461)
    #dbg_declare(ptr %pkpv, !462, !DIExpression(), !463)
    #dbg_declare(ptr %skpv, !464, !DIExpression(), !465)
  %call = call ptr @memcpy(ptr noundef nonnull %buf, ptr noundef %coins, i32 noundef 32) #3, !dbg !466
  %arrayidx = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !467
  store i8 2, ptr %arrayidx, align 1, !dbg !468
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %buf, ptr noundef nonnull %buf, i32 noundef 33) #3, !dbg !469
  call void @pqcrystals_kyber512_ref_gen_matrix(ptr noundef nonnull %a, ptr noundef nonnull %buf, i32 noundef 0) #3, !dbg !470
    #dbg_value(i32 0, !471, !DIExpression(), !448)
  br label %for.cond, !dbg !472

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc7, %for.body ], !dbg !474
  %nonce.0 = phi i8 [ 0, %entry ], [ %inc, %for.body ], !dbg !448
    #dbg_value(i8 %nonce.0, !456, !DIExpression(), !448)
    #dbg_value(i32 %i.0, !471, !DIExpression(), !448)
  %exitcond = icmp ne i32 %i.0, 2, !dbg !475
  br i1 %exitcond, label %for.body, label %for.cond8.preheader, !dbg !477

for.cond8.preheader:                              ; preds = %for.cond
  br label %for.cond8, !dbg !478

for.body:                                         ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds nuw [2 x [256 x i16]], ptr %skpv, i32 0, i32 %i.0, !dbg !480
    #dbg_value(i8 %nonce.0, !456, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !448)
  call void @pqcrystals_kyber512_ref_poly_getnoise_eta1(ptr noundef nonnull %arrayidx6, ptr noundef nonnull %add.ptr, i8 noundef zeroext %nonce.0) #3, !dbg !481
  %inc = add nuw nsw i8 %nonce.0, 1, !dbg !482
    #dbg_value(i8 %inc, !456, !DIExpression(), !448)
  %inc7 = add nuw nsw i32 %i.0, 1, !dbg !483
    #dbg_value(i32 %inc7, !471, !DIExpression(), !448)
  br label %for.cond, !dbg !484, !llvm.loop !485

for.cond8:                                        ; preds = %for.cond8.preheader, %for.body10
  %i.1 = phi i32 [ %inc14, %for.body10 ], [ 0, %for.cond8.preheader ], !dbg !487
  %nonce.1 = phi i8 [ %inc12, %for.body10 ], [ 2, %for.cond8.preheader ], !dbg !448
    #dbg_value(i8 %nonce.1, !456, !DIExpression(), !448)
    #dbg_value(i32 %i.1, !471, !DIExpression(), !448)
  %exitcond1 = icmp ne i32 %i.1, 2, !dbg !488
  br i1 %exitcond1, label %for.body10, label %for.end15, !dbg !478

for.body10:                                       ; preds = %for.cond8
  %arrayidx11 = getelementptr inbounds nuw [2 x [256 x i16]], ptr %e, i32 0, i32 %i.1, !dbg !490
    #dbg_value(i8 %nonce.1, !456, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !448)
  call void @pqcrystals_kyber512_ref_poly_getnoise_eta1(ptr noundef nonnull %arrayidx11, ptr noundef nonnull %add.ptr, i8 noundef zeroext %nonce.1) #3, !dbg !491
  %inc12 = add nuw nsw i8 %nonce.1, 1, !dbg !492
    #dbg_value(i8 %inc12, !456, !DIExpression(), !448)
  %inc14 = add nuw nsw i32 %i.1, 1, !dbg !493
    #dbg_value(i32 %inc14, !471, !DIExpression(), !448)
  br label %for.cond8, !dbg !494, !llvm.loop !495

for.end15:                                        ; preds = %for.cond8
  call void @pqcrystals_kyber512_ref_polyvec_ntt(ptr noundef nonnull %skpv) #3, !dbg !497
  call void @pqcrystals_kyber512_ref_polyvec_ntt(ptr noundef nonnull %e) #3, !dbg !498
    #dbg_value(i32 0, !471, !DIExpression(), !448)
  br label %for.cond16, !dbg !499

for.cond16:                                       ; preds = %for.body18, %for.end15
  %i.2 = phi i32 [ 0, %for.end15 ], [ %inc23, %for.body18 ], !dbg !501
    #dbg_value(i32 %i.2, !471, !DIExpression(), !448)
  %exitcond2 = icmp ne i32 %i.2, 2, !dbg !502
  br i1 %exitcond2, label %for.body18, label %for.end24, !dbg !504

for.body18:                                       ; preds = %for.cond16
  %arrayidx19 = getelementptr inbounds nuw [2 x [256 x i16]], ptr %pkpv, i32 0, i32 %i.2, !dbg !505
  %arrayidx20 = getelementptr inbounds nuw [2 x [2 x [256 x i16]]], ptr %a, i32 0, i32 %i.2, !dbg !507
  call void @pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %arrayidx19, ptr noundef nonnull %arrayidx20, ptr noundef nonnull %skpv) #3, !dbg !508
  %arrayidx21 = getelementptr inbounds nuw [2 x [256 x i16]], ptr %pkpv, i32 0, i32 %i.2, !dbg !509
  call void @pqcrystals_kyber512_ref_poly_tomont(ptr noundef nonnull %arrayidx21) #3, !dbg !510
  %inc23 = add nuw nsw i32 %i.2, 1, !dbg !511
    #dbg_value(i32 %inc23, !471, !DIExpression(), !448)
  br label %for.cond16, !dbg !512, !llvm.loop !513

for.end24:                                        ; preds = %for.cond16
  call void @pqcrystals_kyber512_ref_polyvec_add(ptr noundef nonnull %pkpv, ptr noundef nonnull %pkpv, ptr noundef nonnull %e) #3, !dbg !515
  call void @pqcrystals_kyber512_ref_polyvec_reduce(ptr noundef nonnull %pkpv) #3, !dbg !516
  call fastcc void @pack_sk(ptr noundef %sk, ptr noundef nonnull %skpv) #3, !dbg !517
  call fastcc void @pack_pk(ptr noundef %pk, ptr noundef nonnull %pkpv, ptr noundef nonnull %buf) #3, !dbg !518
  ret void, !dbg !519
}

; Function Attrs: nounwind
define internal fastcc void @pack_sk(ptr noundef %r, ptr noundef nonnull %sk) unnamed_addr #0 !dbg !520 {
entry:
    #dbg_value(ptr %r, !523, !DIExpression(), !524)
    #dbg_value(ptr %sk, !525, !DIExpression(), !524)
  call void @pqcrystals_kyber512_ref_polyvec_tobytes(ptr noundef %r, ptr noundef nonnull %sk) #3, !dbg !526
  ret void, !dbg !527
}

; Function Attrs: nounwind
define internal fastcc void @pack_pk(ptr noundef %r, ptr noundef nonnull %pk, ptr noundef nonnull %seed) unnamed_addr #0 !dbg !528 {
entry:
    #dbg_value(ptr %r, !531, !DIExpression(), !532)
    #dbg_value(ptr %pk, !533, !DIExpression(), !532)
    #dbg_value(ptr %seed, !534, !DIExpression(), !532)
  call void @pqcrystals_kyber512_ref_polyvec_tobytes(ptr noundef %r, ptr noundef nonnull %pk) #3, !dbg !535
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 768, !dbg !536
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr, ptr noundef nonnull %seed, i32 noundef 32) #3, !dbg !537
  ret void, !dbg !538
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_indcpa_enc(ptr noundef %c, ptr noundef %m, ptr noundef %pk, ptr noundef %coins) local_unnamed_addr #0 !dbg !539 {
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
    #dbg_value(ptr %c, !542, !DIExpression(), !543)
    #dbg_value(ptr %m, !544, !DIExpression(), !543)
    #dbg_value(ptr %pk, !545, !DIExpression(), !543)
    #dbg_value(ptr %coins, !546, !DIExpression(), !543)
    #dbg_declare(ptr %seed, !547, !DIExpression(), !548)
    #dbg_value(i8 0, !549, !DIExpression(), !543)
    #dbg_declare(ptr %sp, !550, !DIExpression(), !551)
    #dbg_declare(ptr %pkpv, !552, !DIExpression(), !553)
    #dbg_declare(ptr %ep, !554, !DIExpression(), !555)
    #dbg_declare(ptr %at, !556, !DIExpression(), !557)
    #dbg_declare(ptr %b, !558, !DIExpression(), !559)
    #dbg_declare(ptr %v, !560, !DIExpression(), !561)
    #dbg_declare(ptr %k, !562, !DIExpression(), !563)
    #dbg_declare(ptr %epp, !564, !DIExpression(), !565)
  call fastcc void @unpack_pk(ptr noundef nonnull %pkpv, ptr noundef nonnull %seed, ptr noundef %pk) #3, !dbg !566
  call void @pqcrystals_kyber512_ref_poly_frommsg(ptr noundef nonnull %k, ptr noundef %m) #3, !dbg !567
  call void @pqcrystals_kyber512_ref_gen_matrix(ptr noundef nonnull %at, ptr noundef nonnull %seed, i32 noundef 1) #3, !dbg !568
    #dbg_value(i32 0, !569, !DIExpression(), !543)
  br label %for.cond, !dbg !570

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc4, %for.body ], !dbg !572
  %nonce.0 = phi i8 [ 0, %entry ], [ %inc, %for.body ], !dbg !543
    #dbg_value(i8 %nonce.0, !549, !DIExpression(), !543)
    #dbg_value(i32 %i.0, !569, !DIExpression(), !543)
  %exitcond = icmp ne i32 %i.0, 2, !dbg !573
  br i1 %exitcond, label %for.body, label %for.cond5.preheader, !dbg !575

for.cond5.preheader:                              ; preds = %for.cond
  br label %for.cond5, !dbg !576

for.body:                                         ; preds = %for.cond
  %add.ptr = getelementptr inbounds nuw [256 x i16], ptr %sp, i32 %i.0, !dbg !578
    #dbg_value(i8 %nonce.0, !549, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !543)
  call void @pqcrystals_kyber512_ref_poly_getnoise_eta1(ptr noundef nonnull %add.ptr, ptr noundef %coins, i8 noundef zeroext %nonce.0) #3, !dbg !579
  %inc = add nuw nsw i8 %nonce.0, 1, !dbg !580
    #dbg_value(i8 %inc, !549, !DIExpression(), !543)
  %inc4 = add nuw nsw i32 %i.0, 1, !dbg !581
    #dbg_value(i32 %inc4, !569, !DIExpression(), !543)
  br label %for.cond, !dbg !582, !llvm.loop !583

for.cond5:                                        ; preds = %for.cond5.preheader, %for.body7
  %i.1 = phi i32 [ %inc12, %for.body7 ], [ 0, %for.cond5.preheader ], !dbg !585
  %nonce.1 = phi i8 [ %inc10, %for.body7 ], [ 2, %for.cond5.preheader ], !dbg !543
    #dbg_value(i8 %nonce.1, !549, !DIExpression(), !543)
    #dbg_value(i32 %i.1, !569, !DIExpression(), !543)
  %exitcond1 = icmp ne i32 %i.1, 2, !dbg !586
  br i1 %exitcond1, label %for.body7, label %for.end13, !dbg !576

for.body7:                                        ; preds = %for.cond5
  %add.ptr9 = getelementptr inbounds nuw [256 x i16], ptr %ep, i32 %i.1, !dbg !588
    #dbg_value(i8 %nonce.1, !549, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !543)
  call void @pqcrystals_kyber512_ref_poly_getnoise_eta2(ptr noundef nonnull %add.ptr9, ptr noundef %coins, i8 noundef zeroext %nonce.1) #3, !dbg !589
  %inc10 = add nuw nsw i8 %nonce.1, 1, !dbg !590
    #dbg_value(i8 %inc10, !549, !DIExpression(), !543)
  %inc12 = add nuw nsw i32 %i.1, 1, !dbg !591
    #dbg_value(i32 %inc12, !569, !DIExpression(), !543)
  br label %for.cond5, !dbg !592, !llvm.loop !593

for.end13:                                        ; preds = %for.cond5
    #dbg_value(i8 4, !549, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !543)
  call void @pqcrystals_kyber512_ref_poly_getnoise_eta2(ptr noundef nonnull %epp, ptr noundef %coins, i8 noundef zeroext 4) #3, !dbg !595
  call void @pqcrystals_kyber512_ref_polyvec_ntt(ptr noundef nonnull %sp) #3, !dbg !596
    #dbg_value(i32 0, !569, !DIExpression(), !543)
  br label %for.cond15, !dbg !597

for.cond15:                                       ; preds = %for.body17, %for.end13
  %i.2 = phi i32 [ 0, %for.end13 ], [ %inc20, %for.body17 ], !dbg !599
    #dbg_value(i32 %i.2, !569, !DIExpression(), !543)
  %exitcond2 = icmp ne i32 %i.2, 2, !dbg !600
  br i1 %exitcond2, label %for.body17, label %for.end21, !dbg !602

for.body17:                                       ; preds = %for.cond15
  %arrayidx = getelementptr inbounds nuw [2 x [256 x i16]], ptr %b, i32 0, i32 %i.2, !dbg !603
  %arrayidx18 = getelementptr inbounds nuw [2 x [2 x [256 x i16]]], ptr %at, i32 0, i32 %i.2, !dbg !604
  call void @pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %arrayidx, ptr noundef nonnull %arrayidx18, ptr noundef nonnull %sp) #3, !dbg !605
  %inc20 = add nuw nsw i32 %i.2, 1, !dbg !606
    #dbg_value(i32 %inc20, !569, !DIExpression(), !543)
  br label %for.cond15, !dbg !607, !llvm.loop !608

for.end21:                                        ; preds = %for.cond15
  call void @pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %v, ptr noundef nonnull %pkpv, ptr noundef nonnull %sp) #3, !dbg !610
  call void @pqcrystals_kyber512_ref_polyvec_invntt_tomont(ptr noundef nonnull %b) #3, !dbg !611
  call void @pqcrystals_kyber512_ref_poly_invntt_tomont(ptr noundef nonnull %v) #3, !dbg !612
  call void @pqcrystals_kyber512_ref_polyvec_add(ptr noundef nonnull %b, ptr noundef nonnull %b, ptr noundef nonnull %ep) #3, !dbg !613
  call void @pqcrystals_kyber512_ref_poly_add(ptr noundef nonnull %v, ptr noundef nonnull %v, ptr noundef nonnull %epp) #3, !dbg !614
  call void @pqcrystals_kyber512_ref_poly_add(ptr noundef nonnull %v, ptr noundef nonnull %v, ptr noundef nonnull %k) #3, !dbg !615
  call void @pqcrystals_kyber512_ref_polyvec_reduce(ptr noundef nonnull %b) #3, !dbg !616
  call void @pqcrystals_kyber512_ref_poly_reduce(ptr noundef nonnull %v) #3, !dbg !617
  call fastcc void @pack_ciphertext(ptr noundef %c, ptr noundef nonnull %b, ptr noundef nonnull %v) #3, !dbg !618
  ret void, !dbg !619
}

; Function Attrs: nounwind
define internal fastcc void @unpack_pk(ptr noundef nonnull %pk, ptr noundef nonnull %seed, ptr noundef %packedpk) unnamed_addr #0 !dbg !620 {
entry:
    #dbg_value(ptr %pk, !623, !DIExpression(), !624)
    #dbg_value(ptr %seed, !625, !DIExpression(), !624)
    #dbg_value(ptr %packedpk, !626, !DIExpression(), !624)
  call void @pqcrystals_kyber512_ref_polyvec_frombytes(ptr noundef nonnull %pk, ptr noundef %packedpk) #3, !dbg !627
  %add.ptr = getelementptr inbounds nuw i8, ptr %packedpk, i32 768, !dbg !628
  %call = call ptr @memcpy(ptr noundef nonnull %seed, ptr noundef nonnull %add.ptr, i32 noundef 32) #3, !dbg !629
  ret void, !dbg !630
}

; Function Attrs: nounwind
define internal fastcc void @pack_ciphertext(ptr noundef %r, ptr noundef nonnull %b, ptr noundef nonnull %v) unnamed_addr #0 !dbg !631 {
entry:
    #dbg_value(ptr %r, !635, !DIExpression(), !636)
    #dbg_value(ptr %b, !637, !DIExpression(), !636)
    #dbg_value(ptr %v, !638, !DIExpression(), !636)
  call void @pqcrystals_kyber512_ref_polyvec_compress(ptr noundef %r, ptr noundef nonnull %b) #3, !dbg !639
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 640, !dbg !640
  call void @pqcrystals_kyber512_ref_poly_compress(ptr noundef nonnull %add.ptr, ptr noundef nonnull %v) #3, !dbg !641
  ret void, !dbg !642
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_indcpa_dec(ptr noundef %m, ptr noundef %c, ptr noundef %sk) local_unnamed_addr #0 !dbg !643 {
entry:
  %b = alloca [2 x [256 x i16]], align 2
  %skpv = alloca [2 x [256 x i16]], align 2
  %v = alloca [256 x i16], align 2
  %mp = alloca [256 x i16], align 2
    #dbg_value(ptr %m, !646, !DIExpression(), !647)
    #dbg_value(ptr %c, !648, !DIExpression(), !647)
    #dbg_value(ptr %sk, !649, !DIExpression(), !647)
    #dbg_declare(ptr %b, !650, !DIExpression(), !651)
    #dbg_declare(ptr %skpv, !652, !DIExpression(), !653)
    #dbg_declare(ptr %v, !654, !DIExpression(), !655)
    #dbg_declare(ptr %mp, !656, !DIExpression(), !657)
  call fastcc void @unpack_ciphertext(ptr noundef nonnull %b, ptr noundef nonnull %v, ptr noundef %c) #3, !dbg !658
  call fastcc void @unpack_sk(ptr noundef nonnull %skpv, ptr noundef %sk) #3, !dbg !659
  call void @pqcrystals_kyber512_ref_polyvec_ntt(ptr noundef nonnull %b) #3, !dbg !660
  call void @pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %mp, ptr noundef nonnull %skpv, ptr noundef nonnull %b) #3, !dbg !661
  call void @pqcrystals_kyber512_ref_poly_invntt_tomont(ptr noundef nonnull %mp) #3, !dbg !662
  call void @pqcrystals_kyber512_ref_poly_sub(ptr noundef nonnull %mp, ptr noundef nonnull %v, ptr noundef nonnull %mp) #3, !dbg !663
  call void @pqcrystals_kyber512_ref_poly_reduce(ptr noundef nonnull %mp) #3, !dbg !664
  call void @pqcrystals_kyber512_ref_poly_tomsg(ptr noundef %m, ptr noundef nonnull %mp) #3, !dbg !665
  ret void, !dbg !666
}

; Function Attrs: nounwind
define internal fastcc void @unpack_ciphertext(ptr noundef nonnull %b, ptr noundef nonnull %v, ptr noundef %c) unnamed_addr #0 !dbg !667 {
entry:
    #dbg_value(ptr %b, !670, !DIExpression(), !671)
    #dbg_value(ptr %v, !672, !DIExpression(), !671)
    #dbg_value(ptr %c, !673, !DIExpression(), !671)
  call void @pqcrystals_kyber512_ref_polyvec_decompress(ptr noundef nonnull %b, ptr noundef %c) #3, !dbg !674
  %add.ptr = getelementptr inbounds nuw i8, ptr %c, i32 640, !dbg !675
  call void @pqcrystals_kyber512_ref_poly_decompress(ptr noundef nonnull %v, ptr noundef nonnull %add.ptr) #3, !dbg !676
  ret void, !dbg !677
}

; Function Attrs: nounwind
define internal fastcc void @unpack_sk(ptr noundef nonnull %sk, ptr noundef %packedsk) unnamed_addr #0 !dbg !678 {
entry:
    #dbg_value(ptr %sk, !681, !DIExpression(), !682)
    #dbg_value(ptr %packedsk, !683, !DIExpression(), !682)
  call void @pqcrystals_kyber512_ref_polyvec_frombytes(ptr noundef nonnull %sk, ptr noundef %packedsk) #3, !dbg !684
  ret void, !dbg !685
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_compress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !686 {
entry:
  %t = alloca [4 x i16], align 2
    #dbg_value(ptr %r, !692, !DIExpression(), !693)
    #dbg_value(ptr %a, !694, !DIExpression(), !693)
    #dbg_declare(ptr %t, !695, !DIExpression(), !699)
    #dbg_value(i32 0, !700, !DIExpression(), !693)
  br label %for.cond, !dbg !701

for.cond:                                         ; preds = %for.inc61, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc62, %for.inc61 ], !dbg !703
  %r.addr.0 = phi ptr [ %r, %entry ], [ %r.addr.1.lcssa, %for.inc61 ]
    #dbg_value(ptr %r.addr.0, !692, !DIExpression(), !693)
    #dbg_value(i32 %i.0, !700, !DIExpression(), !693)
  %exitcond2 = icmp ne i32 %i.0, 2, !dbg !704
  br i1 %exitcond2, label %for.cond1.preheader, label %for.end63, !dbg !706

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !707

for.cond1:                                        ; preds = %for.cond1.preheader, %for.end
  %j.0 = phi i32 [ %inc59, %for.end ], [ 0, %for.cond1.preheader ], !dbg !710
  %r.addr.1 = phi ptr [ %add.ptr, %for.end ], [ %r.addr.0, %for.cond1.preheader ]
    #dbg_value(ptr %r.addr.1, !692, !DIExpression(), !693)
    #dbg_value(i32 %j.0, !711, !DIExpression(), !693)
  %exitcond1 = icmp ne i32 %j.0, 64, !dbg !712
  br i1 %exitcond1, label %for.cond4.preheader, label %for.inc61, !dbg !707

for.cond4.preheader:                              ; preds = %for.cond1
  br label %for.cond4, !dbg !714

for.cond4:                                        ; preds = %for.cond4.preheader, %for.body6
  %k.0 = phi i32 [ %inc, %for.body6 ], [ 0, %for.cond4.preheader ], !dbg !717
    #dbg_value(i32 %k.0, !718, !DIExpression(), !693)
  %exitcond = icmp ne i32 %k.0, 4, !dbg !719
  br i1 %exitcond, label %for.body6, label %for.end, !dbg !714

for.body6:                                        ; preds = %for.cond4
  %mul = shl nuw nsw i32 %j.0, 2, !dbg !721
  %add = or disjoint i32 %mul, %k.0, !dbg !723
  %arrayidx7 = getelementptr inbounds nuw [2 x [256 x i16]], ptr %a, i32 0, i32 %i.0, i32 %add, !dbg !724
  %0 = load i16, ptr %arrayidx7, align 2, !dbg !724
  %isneg = icmp slt i16 %0, 0, !dbg !725
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !725
  %arrayidx10 = getelementptr inbounds nuw [4 x i16], ptr %t, i32 0, i32 %k.0, !dbg !726
  %add12 = add i16 %and, %0, !dbg !727
  store i16 %add12, ptr %arrayidx10, align 2, !dbg !727
  %conv15 = zext i16 %add12 to i64, !dbg !728
    #dbg_value(i64 %conv15, !729, !DIExpression(), !693)
    #dbg_value(i64 %conv15, !729, !DIExpression(DW_OP_constu, 10, DW_OP_shl, DW_OP_stack_value), !693)
    #dbg_value(i64 %conv15, !729, !DIExpression(DW_OP_constu, 10, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !693)
  %1 = mul nuw nsw i64 %conv15, 1321131008, !dbg !730
  %mul17 = add nuw nsw i64 %1, 2148128055, !dbg !730
    #dbg_value(i64 %mul17, !729, !DIExpression(), !693)
  %shr18 = lshr i64 %mul17, 32, !dbg !731
    #dbg_value(i64 %shr18, !729, !DIExpression(), !693)
  %2 = trunc nuw nsw i64 %shr18 to i16, !dbg !732
  %conv20 = and i16 %2, 1023, !dbg !732
  %arrayidx21 = getelementptr inbounds nuw [4 x i16], ptr %t, i32 0, i32 %k.0, !dbg !733
  store i16 %conv20, ptr %arrayidx21, align 2, !dbg !734
  %inc = add nuw nsw i32 %k.0, 1, !dbg !735
    #dbg_value(i32 %inc, !718, !DIExpression(), !693)
  br label %for.cond4, !dbg !736, !llvm.loop !737

for.end:                                          ; preds = %for.cond4
  %3 = load i16, ptr %t, align 2, !dbg !739
  %conv25 = trunc i16 %3 to i8, !dbg !740
  store i8 %conv25, ptr %r.addr.1, align 1, !dbg !741
  %4 = load i16, ptr %t, align 2, !dbg !742
  %5 = lshr i16 %4, 8, !dbg !743
  %shr29 = trunc nuw i16 %5 to i8, !dbg !743
  %arrayidx30 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !744
  %6 = load i16, ptr %arrayidx30, align 2, !dbg !744
  %conv31 = trunc i16 %6 to i8, !dbg !744
  %shl32 = shl i8 %conv31, 2, !dbg !745
  %or = or i8 %shl32, %shr29, !dbg !746
  %arrayidx34 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 1, !dbg !747
  store i8 %or, ptr %arrayidx34, align 1, !dbg !748
  %arrayidx35 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !749
  %7 = load i16, ptr %arrayidx35, align 2, !dbg !749
  %8 = lshr i16 %7, 6, !dbg !750
  %shr37 = trunc i16 %8 to i8, !dbg !750
  %arrayidx38 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !751
  %9 = load i16, ptr %arrayidx38, align 2, !dbg !751
  %conv39 = trunc i16 %9 to i8, !dbg !751
  %shl40 = shl i8 %conv39, 4, !dbg !752
  %or41 = or i8 %shl40, %shr37, !dbg !753
  %arrayidx43 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 2, !dbg !754
  store i8 %or41, ptr %arrayidx43, align 1, !dbg !755
  %arrayidx44 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !756
  %10 = load i16, ptr %arrayidx44, align 2, !dbg !756
  %11 = lshr i16 %10, 4, !dbg !757
  %shr46 = trunc i16 %11 to i8, !dbg !757
  %arrayidx47 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !758
  %12 = load i16, ptr %arrayidx47, align 2, !dbg !758
  %conv48 = trunc i16 %12 to i8, !dbg !758
  %shl49 = shl i8 %conv48, 6, !dbg !759
  %or50 = or i8 %shl49, %shr46, !dbg !760
  %arrayidx52 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 3, !dbg !761
  store i8 %or50, ptr %arrayidx52, align 1, !dbg !762
  %arrayidx53 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !763
  %13 = load i16, ptr %arrayidx53, align 2, !dbg !763
  %14 = lshr i16 %13, 2, !dbg !764
  %conv56 = trunc i16 %14 to i8, !dbg !765
  %arrayidx57 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 4, !dbg !766
  store i8 %conv56, ptr %arrayidx57, align 1, !dbg !767
    #dbg_value(ptr %r.addr.1, !692, !DIExpression(DW_OP_plus_uconst, 5, DW_OP_stack_value), !693)
  %add.ptr = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 5, !dbg !768
    #dbg_value(ptr %add.ptr, !692, !DIExpression(), !693)
  %inc59 = add nuw nsw i32 %j.0, 1, !dbg !769
    #dbg_value(i32 %inc59, !711, !DIExpression(), !693)
  br label %for.cond1, !dbg !770, !llvm.loop !771

for.inc61:                                        ; preds = %for.cond1
  %r.addr.1.lcssa = phi ptr [ %r.addr.1, %for.cond1 ]
  %inc62 = add nuw nsw i32 %i.0, 1, !dbg !773
    #dbg_value(i32 %inc62, !700, !DIExpression(), !693)
  br label %for.cond, !dbg !774, !llvm.loop !775

for.end63:                                        ; preds = %for.cond
  ret void, !dbg !777
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_decompress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !778 {
entry:
  %t = alloca [4 x i16], align 2
    #dbg_value(ptr %r, !779, !DIExpression(), !780)
    #dbg_value(ptr %a, !781, !DIExpression(), !780)
    #dbg_declare(ptr %t, !782, !DIExpression(), !783)
    #dbg_value(i32 0, !784, !DIExpression(), !780)
  br label %for.cond, !dbg !785

for.cond:                                         ; preds = %for.inc54, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc55, %for.inc54 ], !dbg !787
  %a.addr.0 = phi ptr [ %a, %entry ], [ %a.addr.1.lcssa, %for.inc54 ]
    #dbg_value(ptr %a.addr.0, !781, !DIExpression(), !780)
    #dbg_value(i32 %i.0, !784, !DIExpression(), !780)
  %exitcond2 = icmp ne i32 %i.0, 2, !dbg !788
  br i1 %exitcond2, label %for.cond1.preheader, label %for.end56, !dbg !790

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !791

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc51
  %j.0 = phi i32 [ %inc52, %for.inc51 ], [ 0, %for.cond1.preheader ], !dbg !794
  %a.addr.1 = phi ptr [ %add.ptr, %for.inc51 ], [ %a.addr.0, %for.cond1.preheader ]
    #dbg_value(ptr %a.addr.1, !781, !DIExpression(), !780)
    #dbg_value(i32 %j.0, !795, !DIExpression(), !780)
  %exitcond1 = icmp ne i32 %j.0, 64, !dbg !796
  br i1 %exitcond1, label %for.body3, label %for.inc54, !dbg !791

for.body3:                                        ; preds = %for.cond1
  %0 = load i8, ptr %a.addr.1, align 1, !dbg !798
  %conv = zext i8 %0 to i16, !dbg !798
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 1, !dbg !800
  %1 = load i8, ptr %arrayidx4, align 1, !dbg !800
  %conv6 = zext i8 %1 to i16, !dbg !801
  %shl = shl nuw i16 %conv6, 8, !dbg !802
  %or = or disjoint i16 %shl, %conv, !dbg !803
  store i16 %or, ptr %t, align 2, !dbg !804
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 1, !dbg !805
  %2 = load i8, ptr %arrayidx9, align 1, !dbg !805
  %3 = lshr i8 %2, 2, !dbg !806
  %shr11 = zext nneg i8 %3 to i16, !dbg !806
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 2, !dbg !807
  %4 = load i8, ptr %arrayidx12, align 1, !dbg !807
  %conv14 = zext i8 %4 to i16, !dbg !808
  %shl15 = shl nuw nsw i16 %conv14, 6, !dbg !809
  %or16 = or disjoint i16 %shl15, %shr11, !dbg !810
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !811
  store i16 %or16, ptr %arrayidx18, align 2, !dbg !812
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 2, !dbg !813
  %5 = load i8, ptr %arrayidx19, align 1, !dbg !813
  %6 = lshr i8 %5, 4, !dbg !814
  %shr21 = zext nneg i8 %6 to i16, !dbg !814
  %arrayidx22 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 3, !dbg !815
  %7 = load i8, ptr %arrayidx22, align 1, !dbg !815
  %conv24 = zext i8 %7 to i16, !dbg !816
  %shl25 = shl nuw nsw i16 %conv24, 4, !dbg !817
  %or26 = or disjoint i16 %shl25, %shr21, !dbg !818
  %arrayidx28 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !819
  store i16 %or26, ptr %arrayidx28, align 2, !dbg !820
  %arrayidx29 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 3, !dbg !821
  %8 = load i8, ptr %arrayidx29, align 1, !dbg !821
  %9 = lshr i8 %8, 6, !dbg !822
  %shr31 = zext nneg i8 %9 to i16, !dbg !822
  %arrayidx32 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 4, !dbg !823
  %10 = load i8, ptr %arrayidx32, align 1, !dbg !823
  %conv34 = zext i8 %10 to i16, !dbg !824
  %shl35 = shl nuw nsw i16 %conv34, 2, !dbg !825
  %or36 = or disjoint i16 %shl35, %shr31, !dbg !826
  %arrayidx38 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !827
  store i16 %or36, ptr %arrayidx38, align 2, !dbg !828
    #dbg_value(ptr %add.ptr, !781, !DIExpression(), !780)
    #dbg_value(i32 0, !829, !DIExpression(), !780)
  br label %for.cond39, !dbg !830

for.cond39:                                       ; preds = %for.body42, %for.body3
  %k.0 = phi i32 [ 0, %for.body3 ], [ %inc, %for.body42 ], !dbg !832
    #dbg_value(i32 %k.0, !829, !DIExpression(), !780)
  %exitcond = icmp ne i32 %k.0, 4, !dbg !833
  br i1 %exitcond, label %for.body42, label %for.inc51, !dbg !835

for.body42:                                       ; preds = %for.cond39
  %arrayidx43 = getelementptr inbounds nuw [4 x i16], ptr %t, i32 0, i32 %k.0, !dbg !836
  %11 = load i16, ptr %arrayidx43, align 2, !dbg !836
  %12 = and i16 %11, 1023, !dbg !837
  %and = zext nneg i16 %12 to i32, !dbg !837
  %mul = mul nuw nsw i32 %and, 3329, !dbg !838
  %add = add nuw nsw i32 %mul, 512, !dbg !839
  %shr45 = lshr i32 %add, 10, !dbg !840
  %conv46 = trunc nuw nsw i32 %shr45 to i16, !dbg !841
  %mul48 = shl nuw nsw i32 %j.0, 2, !dbg !842
  %add49 = or disjoint i32 %mul48, %k.0, !dbg !843
  %arrayidx50 = getelementptr inbounds nuw [2 x [256 x i16]], ptr %r, i32 0, i32 %i.0, i32 %add49, !dbg !844
  store i16 %conv46, ptr %arrayidx50, align 2, !dbg !845
  %inc = add nuw nsw i32 %k.0, 1, !dbg !846
    #dbg_value(i32 %inc, !829, !DIExpression(), !780)
  br label %for.cond39, !dbg !847, !llvm.loop !848

for.inc51:                                        ; preds = %for.cond39
  %add.ptr = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 5, !dbg !850
  %inc52 = add nuw nsw i32 %j.0, 1, !dbg !851
    #dbg_value(i32 %inc52, !795, !DIExpression(), !780)
  br label %for.cond1, !dbg !852, !llvm.loop !853

for.inc54:                                        ; preds = %for.cond1
  %a.addr.1.lcssa = phi ptr [ %a.addr.1, %for.cond1 ]
  %inc55 = add nuw nsw i32 %i.0, 1, !dbg !855
    #dbg_value(i32 %inc55, !784, !DIExpression(), !780)
  br label %for.cond, !dbg !856, !llvm.loop !857

for.end56:                                        ; preds = %for.cond
  ret void, !dbg !859
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !860 {
entry:
    #dbg_value(ptr %r, !861, !DIExpression(), !862)
    #dbg_value(ptr %a, !863, !DIExpression(), !862)
    #dbg_value(i32 0, !864, !DIExpression(), !862)
  br label %for.cond, !dbg !865

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !867
    #dbg_value(i32 %i.0, !864, !DIExpression(), !862)
  %exitcond = icmp ne i32 %i.0, 2, !dbg !868
  br i1 %exitcond, label %for.body, label %for.end, !dbg !870

for.body:                                         ; preds = %for.cond
  %mul = mul nuw nsw i32 %i.0, 384, !dbg !871
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 %mul, !dbg !872
  %arrayidx = getelementptr inbounds nuw [2 x [256 x i16]], ptr %a, i32 0, i32 %i.0, !dbg !873
  call void @pqcrystals_kyber512_ref_poly_tobytes(ptr noundef %add.ptr, ptr noundef %arrayidx) #3, !dbg !874
  %inc = add nuw nsw i32 %i.0, 1, !dbg !875
    #dbg_value(i32 %inc, !864, !DIExpression(), !862)
  br label %for.cond, !dbg !876, !llvm.loop !877

for.end:                                          ; preds = %for.cond
  ret void, !dbg !879
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_frombytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !880 {
entry:
    #dbg_value(ptr %r, !881, !DIExpression(), !882)
    #dbg_value(ptr %a, !883, !DIExpression(), !882)
    #dbg_value(i32 0, !884, !DIExpression(), !882)
  br label %for.cond, !dbg !885

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !887
    #dbg_value(i32 %i.0, !884, !DIExpression(), !882)
  %exitcond = icmp ne i32 %i.0, 2, !dbg !888
  br i1 %exitcond, label %for.body, label %for.end, !dbg !890

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [2 x [256 x i16]], ptr %r, i32 0, i32 %i.0, !dbg !891
  %mul = mul nuw nsw i32 %i.0, 384, !dbg !892
  %add.ptr = getelementptr inbounds nuw i8, ptr %a, i32 %mul, !dbg !893
  call void @pqcrystals_kyber512_ref_poly_frombytes(ptr noundef %arrayidx, ptr noundef %add.ptr) #3, !dbg !894
  %inc = add nuw nsw i32 %i.0, 1, !dbg !895
    #dbg_value(i32 %inc, !884, !DIExpression(), !882)
  br label %for.cond, !dbg !896, !llvm.loop !897

for.end:                                          ; preds = %for.cond
  ret void, !dbg !899
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !900 {
entry:
    #dbg_value(ptr %r, !903, !DIExpression(), !904)
    #dbg_value(i32 0, !905, !DIExpression(), !904)
  br label %for.cond, !dbg !906

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !908
    #dbg_value(i32 %i.0, !905, !DIExpression(), !904)
  %exitcond = icmp ne i32 %i.0, 2, !dbg !909
  br i1 %exitcond, label %for.body, label %for.end, !dbg !911

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [2 x [256 x i16]], ptr %r, i32 0, i32 %i.0, !dbg !912
  call void @pqcrystals_kyber512_ref_poly_ntt(ptr noundef %arrayidx) #3, !dbg !913
  %inc = add nuw nsw i32 %i.0, 1, !dbg !914
    #dbg_value(i32 %inc, !905, !DIExpression(), !904)
  br label %for.cond, !dbg !915, !llvm.loop !916

for.end:                                          ; preds = %for.cond
  ret void, !dbg !918
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_invntt_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !919 {
entry:
    #dbg_value(ptr %r, !920, !DIExpression(), !921)
    #dbg_value(i32 0, !922, !DIExpression(), !921)
  br label %for.cond, !dbg !923

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !925
    #dbg_value(i32 %i.0, !922, !DIExpression(), !921)
  %exitcond = icmp ne i32 %i.0, 2, !dbg !926
  br i1 %exitcond, label %for.body, label %for.end, !dbg !928

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [2 x [256 x i16]], ptr %r, i32 0, i32 %i.0, !dbg !929
  call void @pqcrystals_kyber512_ref_poly_invntt_tomont(ptr noundef %arrayidx) #3, !dbg !930
  %inc = add nuw nsw i32 %i.0, 1, !dbg !931
    #dbg_value(i32 %inc, !922, !DIExpression(), !921)
  br label %for.cond, !dbg !932, !llvm.loop !933

for.end:                                          ; preds = %for.cond
  ret void, !dbg !935
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !936 {
entry:
  %t = alloca [256 x i16], align 2
    #dbg_value(ptr %r, !939, !DIExpression(), !940)
    #dbg_value(ptr %a, !941, !DIExpression(), !940)
    #dbg_value(ptr %b, !942, !DIExpression(), !940)
    #dbg_declare(ptr %t, !943, !DIExpression(), !944)
  call void @pqcrystals_kyber512_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) #3, !dbg !945
    #dbg_value(i32 1, !946, !DIExpression(), !940)
    #dbg_value(i32 poison, !946, !DIExpression(), !940)
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %a, i32 512, !dbg !947
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %b, i32 512, !dbg !951
  call void @pqcrystals_kyber512_ref_poly_basemul_montgomery(ptr noundef nonnull %t, ptr noundef nonnull %arrayidx2, ptr noundef nonnull %arrayidx3) #3, !dbg !952
  call void @pqcrystals_kyber512_ref_poly_add(ptr noundef %r, ptr noundef %r, ptr noundef nonnull %t) #3, !dbg !953
    #dbg_value(i32 2, !946, !DIExpression(), !940)
    #dbg_value(i32 poison, !946, !DIExpression(), !940)
  call void @pqcrystals_kyber512_ref_poly_reduce(ptr noundef %r) #3, !dbg !954
  ret void, !dbg !955
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_reduce(ptr noundef %r) local_unnamed_addr #0 !dbg !956 {
entry:
    #dbg_value(ptr %r, !957, !DIExpression(), !958)
    #dbg_value(i32 0, !959, !DIExpression(), !958)
  br label %for.cond, !dbg !960

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !962
    #dbg_value(i32 %i.0, !959, !DIExpression(), !958)
  %exitcond = icmp ne i32 %i.0, 2, !dbg !963
  br i1 %exitcond, label %for.body, label %for.end, !dbg !965

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [2 x [256 x i16]], ptr %r, i32 0, i32 %i.0, !dbg !966
  call void @pqcrystals_kyber512_ref_poly_reduce(ptr noundef %arrayidx) #3, !dbg !967
  %inc = add nuw nsw i32 %i.0, 1, !dbg !968
    #dbg_value(i32 %inc, !959, !DIExpression(), !958)
  br label %for.cond, !dbg !969, !llvm.loop !970

for.end:                                          ; preds = %for.cond
  ret void, !dbg !972
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_polyvec_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !973 {
entry:
    #dbg_value(ptr %r, !976, !DIExpression(), !977)
    #dbg_value(ptr %a, !978, !DIExpression(), !977)
    #dbg_value(ptr %b, !979, !DIExpression(), !977)
    #dbg_value(i32 0, !980, !DIExpression(), !977)
  br label %for.cond, !dbg !981

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !983
    #dbg_value(i32 %i.0, !980, !DIExpression(), !977)
  %exitcond = icmp ne i32 %i.0, 2, !dbg !984
  br i1 %exitcond, label %for.body, label %for.end, !dbg !986

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [2 x [256 x i16]], ptr %r, i32 0, i32 %i.0, !dbg !987
  %arrayidx1 = getelementptr inbounds nuw [2 x [256 x i16]], ptr %a, i32 0, i32 %i.0, !dbg !988
  %arrayidx2 = getelementptr inbounds nuw [2 x [256 x i16]], ptr %b, i32 0, i32 %i.0, !dbg !989
  call void @pqcrystals_kyber512_ref_poly_add(ptr noundef %arrayidx, ptr noundef %arrayidx1, ptr noundef %arrayidx2) #3, !dbg !990
  %inc = add nuw nsw i32 %i.0, 1, !dbg !991
    #dbg_value(i32 %inc, !980, !DIExpression(), !977)
  br label %for.cond, !dbg !992, !llvm.loop !993

for.end:                                          ; preds = %for.cond
  ret void, !dbg !995
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_compress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !996 {
entry:
  %t = alloca [8 x i8], align 1
    #dbg_value(ptr %r, !1002, !DIExpression(), !1003)
    #dbg_value(ptr %a, !1004, !DIExpression(), !1003)
    #dbg_declare(ptr %t, !1005, !DIExpression(), !1009)
    #dbg_value(i32 0, !1010, !DIExpression(), !1003)
  br label %for.cond, !dbg !1011

for.cond:                                         ; preds = %for.end, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc46, %for.end ], !dbg !1013
  %r.addr.0 = phi ptr [ %r, %entry ], [ %add.ptr, %for.end ]
    #dbg_value(ptr %r.addr.0, !1002, !DIExpression(), !1003)
    #dbg_value(i32 %i.0, !1010, !DIExpression(), !1003)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1014
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end47, !dbg !1016

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1017

for.cond1:                                        ; preds = %for.cond1.preheader, %for.body3
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond1.preheader ], !dbg !1020
    #dbg_value(i32 %j.0, !1021, !DIExpression(), !1003)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1022
  br i1 %exitcond, label %for.body3, label %for.end, !dbg !1017

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !1024
  %add = or disjoint i32 %mul, %j.0, !dbg !1026
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add, !dbg !1027
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1027
    #dbg_value(i16 %0, !1028, !DIExpression(), !1003)
  %isneg = icmp slt i16 %0, 0, !dbg !1029
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !1029
  %add5 = add i16 %and, %0, !dbg !1030
    #dbg_value(i16 %add5, !1028, !DIExpression(), !1003)
  %conv7 = sext i16 %add5 to i32, !dbg !1031
    #dbg_value(i32 %conv7, !1032, !DIExpression(DW_OP_constu, 4, DW_OP_shl, DW_OP_stack_value), !1003)
    #dbg_value(i32 %conv7, !1032, !DIExpression(DW_OP_constu, 4, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !1003)
  %1 = mul i32 %conv7, 1290160, !dbg !1033
  %mul9 = add i32 %1, 134257275, !dbg !1033
    #dbg_value(i32 %mul9, !1032, !DIExpression(), !1003)
  %shr10 = lshr i32 %mul9, 28, !dbg !1034
    #dbg_value(i32 %shr10, !1032, !DIExpression(), !1003)
  %conv12 = trunc nuw nsw i32 %shr10 to i8, !dbg !1035
  %arrayidx13 = getelementptr inbounds nuw [8 x i8], ptr %t, i32 0, i32 %j.0, !dbg !1036
  store i8 %conv12, ptr %arrayidx13, align 1, !dbg !1037
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1038
    #dbg_value(i32 %inc, !1021, !DIExpression(), !1003)
  br label %for.cond1, !dbg !1039, !llvm.loop !1040

for.end:                                          ; preds = %for.cond1
  %2 = load i8, ptr %t, align 1, !dbg !1042
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %t, i32 1, !dbg !1043
  %3 = load i8, ptr %arrayidx16, align 1, !dbg !1043
  %shl18 = shl i8 %3, 4, !dbg !1044
  %or = or i8 %shl18, %2, !dbg !1045
  store i8 %or, ptr %r.addr.0, align 1, !dbg !1046
  %arrayidx21 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !1047
  %4 = load i8, ptr %arrayidx21, align 1, !dbg !1047
  %arrayidx23 = getelementptr inbounds nuw i8, ptr %t, i32 3, !dbg !1048
  %5 = load i8, ptr %arrayidx23, align 1, !dbg !1048
  %shl25 = shl i8 %5, 4, !dbg !1049
  %or26 = or i8 %shl25, %4, !dbg !1050
  %arrayidx28 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 1, !dbg !1051
  store i8 %or26, ptr %arrayidx28, align 1, !dbg !1052
  %arrayidx29 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !1053
  %6 = load i8, ptr %arrayidx29, align 1, !dbg !1053
  %arrayidx31 = getelementptr inbounds nuw i8, ptr %t, i32 5, !dbg !1054
  %7 = load i8, ptr %arrayidx31, align 1, !dbg !1054
  %shl33 = shl i8 %7, 4, !dbg !1055
  %or34 = or i8 %shl33, %6, !dbg !1056
  %arrayidx36 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 2, !dbg !1057
  store i8 %or34, ptr %arrayidx36, align 1, !dbg !1058
  %arrayidx37 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !1059
  %8 = load i8, ptr %arrayidx37, align 1, !dbg !1059
  %arrayidx39 = getelementptr inbounds nuw i8, ptr %t, i32 7, !dbg !1060
  %9 = load i8, ptr %arrayidx39, align 1, !dbg !1060
  %shl41 = shl i8 %9, 4, !dbg !1061
  %or42 = or i8 %shl41, %8, !dbg !1062
  %arrayidx44 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 3, !dbg !1063
  store i8 %or42, ptr %arrayidx44, align 1, !dbg !1064
    #dbg_value(ptr %r.addr.0, !1002, !DIExpression(DW_OP_plus_uconst, 4, DW_OP_stack_value), !1003)
  %add.ptr = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 4, !dbg !1065
    #dbg_value(ptr %add.ptr, !1002, !DIExpression(), !1003)
  %inc46 = add nuw nsw i32 %i.0, 1, !dbg !1066
    #dbg_value(i32 %inc46, !1010, !DIExpression(), !1003)
  br label %for.cond, !dbg !1067, !llvm.loop !1068

for.end47:                                        ; preds = %for.cond
  ret void, !dbg !1070
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_decompress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1071 {
entry:
    #dbg_value(ptr %r, !1074, !DIExpression(), !1075)
    #dbg_value(ptr %a, !1076, !DIExpression(), !1075)
    #dbg_value(i32 0, !1077, !DIExpression(), !1075)
  br label %for.cond, !dbg !1078

for.cond:                                         ; preds = %for.body, %entry
  %a.addr.0 = phi ptr [ %a, %entry ], [ %add.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1080
    #dbg_value(i32 %i.0, !1077, !DIExpression(), !1075)
    #dbg_value(ptr %a.addr.0, !1076, !DIExpression(), !1075)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !1081
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1083

for.body:                                         ; preds = %for.cond
  %0 = load i8, ptr %a.addr.0, align 1, !dbg !1084
  %1 = and i8 %0, 15, !dbg !1086
  %conv2 = zext nneg i8 %1 to i32, !dbg !1087
  %mul = mul nuw nsw i32 %conv2, 3329, !dbg !1088
  %add = add nuw nsw i32 %mul, 8, !dbg !1089
  %shr = lshr i32 %add, 4, !dbg !1090
  %conv3 = trunc nuw nsw i32 %shr to i16, !dbg !1091
  %mul4 = shl nuw nsw i32 %i.0, 1, !dbg !1092
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul4, !dbg !1093
  store i16 %conv3, ptr %arrayidx6, align 2, !dbg !1094
  %2 = load i8, ptr %a.addr.0, align 1, !dbg !1095
  %3 = lshr i8 %2, 4, !dbg !1096
  %conv11 = zext nneg i8 %3 to i32, !dbg !1097
  %mul12 = mul nuw nsw i32 %conv11, 3329, !dbg !1098
  %add13 = add nuw nsw i32 %mul12, 8, !dbg !1099
  %shr14 = lshr i32 %add13, 4, !dbg !1100
  %conv15 = trunc nuw nsw i32 %shr14 to i16, !dbg !1101
  %mul16 = shl nuw nsw i32 %i.0, 1, !dbg !1102
  %add17 = or disjoint i32 %mul16, 1, !dbg !1103
  %arrayidx18 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add17, !dbg !1104
  store i16 %conv15, ptr %arrayidx18, align 2, !dbg !1105
    #dbg_value(ptr %a.addr.0, !1076, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1075)
  %add.ptr = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 1, !dbg !1106
    #dbg_value(ptr %add.ptr, !1076, !DIExpression(), !1075)
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1107
    #dbg_value(i32 %inc, !1077, !DIExpression(), !1075)
  br label %for.cond, !dbg !1108, !llvm.loop !1109

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1111
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_tobytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1112 {
entry:
    #dbg_value(ptr %r, !1113, !DIExpression(), !1114)
    #dbg_value(ptr %a, !1115, !DIExpression(), !1114)
    #dbg_value(i32 0, !1116, !DIExpression(), !1114)
  br label %for.cond, !dbg !1117

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1119
    #dbg_value(i32 %i.0, !1116, !DIExpression(), !1114)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !1120
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1122

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 1, !dbg !1123
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %mul, !dbg !1125
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1125
    #dbg_value(i16 %0, !1126, !DIExpression(), !1114)
  %isneg = icmp slt i16 %0, 0, !dbg !1127
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !1127
  %add = add i16 %and, %0, !dbg !1128
    #dbg_value(i16 %add, !1126, !DIExpression(), !1114)
  %mul3 = shl nuw nsw i32 %i.0, 1, !dbg !1129
  %add4 = or disjoint i32 %mul3, 1, !dbg !1130
  %arrayidx5 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add4, !dbg !1131
  %1 = load i16, ptr %arrayidx5, align 2, !dbg !1131
    #dbg_value(i16 %1, !1132, !DIExpression(), !1114)
  %isneg1 = icmp slt i16 %1, 0, !dbg !1133
  %and8 = select i1 %isneg1, i16 3329, i16 0, !dbg !1133
  %add10 = add i16 %and8, %1, !dbg !1134
    #dbg_value(i16 %add10, !1132, !DIExpression(), !1114)
  %conv14 = trunc i16 %add to i8, !dbg !1135
  %mul15 = mul nuw nsw i32 %i.0, 3, !dbg !1136
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %r, i32 %mul15, !dbg !1137
  store i8 %conv14, ptr %arrayidx17, align 1, !dbg !1138
  %2 = lshr i16 %add, 8, !dbg !1139
  %shr19 = trunc nuw i16 %2 to i8, !dbg !1139
  %conv20 = trunc i16 %add10 to i8, !dbg !1140
  %shl = shl i8 %conv20, 4, !dbg !1141
  %or = or i8 %shl, %shr19, !dbg !1142
  %mul22 = mul nuw nsw i32 %i.0, 3, !dbg !1143
  %3 = getelementptr inbounds nuw i8, ptr %r, i32 %mul22, !dbg !1144
  %arrayidx24 = getelementptr inbounds nuw i8, ptr %3, i32 1, !dbg !1144
  store i8 %or, ptr %arrayidx24, align 1, !dbg !1145
  %4 = lshr i16 %add10, 4, !dbg !1146
  %conv27 = trunc i16 %4 to i8, !dbg !1147
  %mul28 = mul nuw nsw i32 %i.0, 3, !dbg !1148
  %5 = getelementptr inbounds nuw i8, ptr %r, i32 %mul28, !dbg !1149
  %arrayidx30 = getelementptr inbounds nuw i8, ptr %5, i32 2, !dbg !1149
  store i8 %conv27, ptr %arrayidx30, align 1, !dbg !1150
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1151
    #dbg_value(i32 %inc, !1116, !DIExpression(), !1114)
  br label %for.cond, !dbg !1152, !llvm.loop !1153

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1155
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_frombytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1156 {
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
  %mul = mul nuw nsw i32 %i.0, 3, !dbg !1167
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %mul, !dbg !1169
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1169
  %conv = zext i8 %0 to i16, !dbg !1169
  %mul1 = mul nuw nsw i32 %i.0, 3, !dbg !1170
  %1 = getelementptr inbounds nuw i8, ptr %a, i32 %mul1, !dbg !1171
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %1, i32 1, !dbg !1171
  %2 = load i8, ptr %arrayidx3, align 1, !dbg !1171
  %conv5 = zext i8 %2 to i16, !dbg !1172
  %shl = shl nuw i16 %conv5, 8, !dbg !1173
  %shl.masked = and i16 %shl, 3840, !dbg !1174
  %and = or disjoint i16 %shl.masked, %conv, !dbg !1174
  %mul7 = shl nuw nsw i32 %i.0, 1, !dbg !1175
  %arrayidx8 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul7, !dbg !1176
  store i16 %and, ptr %arrayidx8, align 2, !dbg !1177
  %mul9 = mul nuw nsw i32 %i.0, 3, !dbg !1178
  %3 = getelementptr inbounds nuw i8, ptr %a, i32 %mul9, !dbg !1179
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %3, i32 1, !dbg !1179
  %4 = load i8, ptr %arrayidx11, align 1, !dbg !1179
  %5 = lshr i8 %4, 4, !dbg !1180
  %shr13 = zext nneg i8 %5 to i16, !dbg !1180
  %mul14 = mul nuw nsw i32 %i.0, 3, !dbg !1181
  %6 = getelementptr inbounds nuw i8, ptr %a, i32 %mul14, !dbg !1182
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %6, i32 2, !dbg !1182
  %7 = load i8, ptr %arrayidx16, align 1, !dbg !1182
  %conv18 = zext i8 %7 to i16, !dbg !1183
  %shl19 = shl nuw nsw i16 %conv18, 4, !dbg !1184
  %or20 = or disjoint i16 %shl19, %shr13, !dbg !1185
  %mul23 = shl nuw nsw i32 %i.0, 1, !dbg !1186
  %add24 = or disjoint i32 %mul23, 1, !dbg !1187
  %arrayidx25 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add24, !dbg !1188
  store i16 %or20, ptr %arrayidx25, align 2, !dbg !1189
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1190
    #dbg_value(i32 %inc, !1160, !DIExpression(), !1158)
  br label %for.cond, !dbg !1191, !llvm.loop !1192

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1194
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_frommsg(ptr noundef %r, ptr noundef %msg) local_unnamed_addr #0 !dbg !1195 {
entry:
    #dbg_value(ptr %r, !1196, !DIExpression(), !1197)
    #dbg_value(ptr %msg, !1198, !DIExpression(), !1197)
    #dbg_value(i32 0, !1199, !DIExpression(), !1197)
  br label %for.cond, !dbg !1200

for.cond:                                         ; preds = %for.inc8, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc9, %for.inc8 ], !dbg !1202
    #dbg_value(i32 %i.0, !1199, !DIExpression(), !1197)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1203
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end10, !dbg !1205

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1206

for.cond1:                                        ; preds = %for.cond1.preheader, %for.body3
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond1.preheader ], !dbg !1209
    #dbg_value(i32 %j.0, !1210, !DIExpression(), !1197)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1211
  br i1 %exitcond, label %for.body3, label %for.inc8, !dbg !1206

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !1213
  %add = or disjoint i32 %mul, %j.0, !dbg !1215
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add, !dbg !1216
  store i16 0, ptr %arrayidx, align 2, !dbg !1217
  %add.ptr.idx = shl nuw nsw i32 %i.0, 4, !dbg !1218
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 %add.ptr.idx, !dbg !1218
  %add.ptr5 = getelementptr inbounds nuw i16, ptr %add.ptr, i32 %j.0, !dbg !1219
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1220
  %0 = load i8, ptr %arrayidx6, align 1, !dbg !1220
  %conv = zext i8 %0 to i32, !dbg !1220
  %shr = lshr i32 %conv, %j.0, !dbg !1221
  %1 = trunc nuw nsw i32 %shr to i16, !dbg !1222
  %conv7 = and i16 %1, 1, !dbg !1222
  call void @pqcrystals_kyber512_ref_cmov_int16(ptr noundef %add.ptr5, i16 noundef signext 1665, i16 noundef zeroext %conv7) #3, !dbg !1223
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1224
    #dbg_value(i32 %inc, !1210, !DIExpression(), !1197)
  br label %for.cond1, !dbg !1225, !llvm.loop !1226

for.inc8:                                         ; preds = %for.cond1
  %inc9 = add nuw nsw i32 %i.0, 1, !dbg !1228
    #dbg_value(i32 %inc9, !1199, !DIExpression(), !1197)
  br label %for.cond, !dbg !1229, !llvm.loop !1230

for.end10:                                        ; preds = %for.cond
  ret void, !dbg !1232
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_tomsg(ptr noundef %msg, ptr noundef %a) local_unnamed_addr #0 !dbg !1233 {
entry:
    #dbg_value(ptr %msg, !1234, !DIExpression(), !1235)
    #dbg_value(ptr %a, !1236, !DIExpression(), !1235)
    #dbg_value(i32 0, !1237, !DIExpression(), !1235)
  br label %for.cond, !dbg !1238

for.cond:                                         ; preds = %for.inc11, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc12, %for.inc11 ], !dbg !1240
    #dbg_value(i32 %i.0, !1237, !DIExpression(), !1235)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1241
  br i1 %exitcond1, label %for.body, label %for.end13, !dbg !1243

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1244
  store i8 0, ptr %arrayidx, align 1, !dbg !1246
    #dbg_value(i32 0, !1247, !DIExpression(), !1235)
  br label %for.cond1, !dbg !1248

for.cond1:                                        ; preds = %for.body3, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body3 ], !dbg !1250
    #dbg_value(i32 %j.0, !1247, !DIExpression(), !1235)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1251
  br i1 %exitcond, label %for.body3, label %for.inc11, !dbg !1253

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !1254
  %add = or disjoint i32 %mul, %j.0, !dbg !1256
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add, !dbg !1257
  %0 = load i16, ptr %arrayidx4, align 2, !dbg !1257
  %conv = sext i16 %0 to i32, !dbg !1257
    #dbg_value(i32 %conv, !1258, !DIExpression(), !1235)
    #dbg_value(i32 %conv, !1258, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_stack_value), !1235)
    #dbg_value(i32 %conv, !1258, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !1235)
  %1 = mul i32 %conv, 161270, !dbg !1259
  %mul6 = add i32 %1, 134257275, !dbg !1259
    #dbg_value(i32 %mul6, !1258, !DIExpression(), !1235)
  %shr = lshr i32 %mul6, 28, !dbg !1260
    #dbg_value(i32 %shr, !1258, !DIExpression(), !1235)
  %and = and i32 %shr, 1, !dbg !1261
    #dbg_value(i32 %and, !1258, !DIExpression(), !1235)
  %shl7 = shl nuw nsw i32 %and, %j.0, !dbg !1262
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1263
  %2 = load i8, ptr %arrayidx8, align 1, !dbg !1264
  %3 = trunc nuw i32 %shl7 to i8, !dbg !1264
  %conv10 = or i8 %2, %3, !dbg !1264
  store i8 %conv10, ptr %arrayidx8, align 1, !dbg !1264
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1265
    #dbg_value(i32 %inc, !1247, !DIExpression(), !1235)
  br label %for.cond1, !dbg !1266, !llvm.loop !1267

for.inc11:                                        ; preds = %for.cond1
  %inc12 = add nuw nsw i32 %i.0, 1, !dbg !1269
    #dbg_value(i32 %inc12, !1237, !DIExpression(), !1235)
  br label %for.cond, !dbg !1270, !llvm.loop !1271

for.end13:                                        ; preds = %for.cond
  ret void, !dbg !1273
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_getnoise_eta1(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !1274 {
entry:
  %buf = alloca [192 x i8], align 1
    #dbg_value(ptr %r, !1277, !DIExpression(), !1278)
    #dbg_value(ptr %seed, !1279, !DIExpression(), !1278)
    #dbg_value(i8 %nonce, !1280, !DIExpression(), !1278)
    #dbg_declare(ptr %buf, !1281, !DIExpression(), !1285)
  call void @pqcrystals_kyber512_ref_kyber_shake256_prf(ptr noundef nonnull %buf, i32 noundef 192, ptr noundef %seed, i8 noundef zeroext %nonce) #3, !dbg !1286
  call void @pqcrystals_kyber512_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef nonnull %buf) #3, !dbg !1287
  ret void, !dbg !1288
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_getnoise_eta2(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !1289 {
entry:
  %buf = alloca [128 x i8], align 1
    #dbg_value(ptr %r, !1290, !DIExpression(), !1291)
    #dbg_value(ptr %seed, !1292, !DIExpression(), !1291)
    #dbg_value(i8 %nonce, !1293, !DIExpression(), !1291)
    #dbg_declare(ptr %buf, !1294, !DIExpression(), !1296)
  call void @pqcrystals_kyber512_ref_kyber_shake256_prf(ptr noundef nonnull %buf, i32 noundef 128, ptr noundef %seed, i8 noundef zeroext %nonce) #3, !dbg !1297
  call void @pqcrystals_kyber512_ref_poly_cbd_eta2(ptr noundef %r, ptr noundef nonnull %buf) #3, !dbg !1298
  ret void, !dbg !1299
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1300 {
entry:
    #dbg_value(ptr %r, !1303, !DIExpression(), !1304)
  call void @pqcrystals_kyber512_ref_ntt(ptr noundef %r) #3, !dbg !1305
  call void @pqcrystals_kyber512_ref_poly_reduce(ptr noundef %r) #3, !dbg !1306
  ret void, !dbg !1307
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_reduce(ptr noundef %r) local_unnamed_addr #0 !dbg !1308 {
entry:
    #dbg_value(ptr %r, !1309, !DIExpression(), !1310)
    #dbg_value(i32 0, !1311, !DIExpression(), !1310)
  br label %for.cond, !dbg !1312

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1314
    #dbg_value(i32 %i.0, !1311, !DIExpression(), !1310)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1315
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1317

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1318
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1318
  %call = call signext i16 @pqcrystals_kyber512_ref_barrett_reduce(i16 noundef signext %0) #3, !dbg !1319
  %arrayidx1 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1320
  store i16 %call, ptr %arrayidx1, align 2, !dbg !1321
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1322
    #dbg_value(i32 %inc, !1311, !DIExpression(), !1310)
  br label %for.cond, !dbg !1323, !llvm.loop !1324

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1326
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_invntt_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !1327 {
entry:
    #dbg_value(ptr %r, !1328, !DIExpression(), !1329)
  call void @pqcrystals_kyber512_ref_invntt(ptr noundef %r) #3, !dbg !1330
  ret void, !dbg !1331
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1332 {
entry:
    #dbg_value(ptr %r, !1335, !DIExpression(), !1336)
    #dbg_value(ptr %a, !1337, !DIExpression(), !1336)
    #dbg_value(ptr %b, !1338, !DIExpression(), !1336)
    #dbg_value(i32 0, !1339, !DIExpression(), !1336)
  br label %for.cond, !dbg !1340

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1342
    #dbg_value(i32 %i.0, !1339, !DIExpression(), !1336)
  %exitcond = icmp ne i32 %i.0, 64, !dbg !1343
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1345

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 2, !dbg !1346
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul, !dbg !1348
  %mul1 = shl nuw nsw i32 %i.0, 2, !dbg !1349
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %mul1, !dbg !1350
  %mul3 = shl nuw nsw i32 %i.0, 2, !dbg !1351
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %mul3, !dbg !1352
  %add = or disjoint i32 %i.0, 64, !dbg !1353
  %arrayidx5 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber512_ref_zetas, i32 0, i32 %add, !dbg !1354
  %0 = load i16, ptr %arrayidx5, align 2, !dbg !1354
  call void @pqcrystals_kyber512_ref_basemul(ptr noundef %arrayidx, ptr noundef %arrayidx2, ptr noundef %arrayidx4, i16 noundef signext %0) #3, !dbg !1355
  %mul6 = shl nuw nsw i32 %i.0, 2, !dbg !1356
  %add7 = or disjoint i32 %mul6, 2, !dbg !1357
  %arrayidx8 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add7, !dbg !1358
  %mul9 = shl nuw nsw i32 %i.0, 2, !dbg !1359
  %add10 = or disjoint i32 %mul9, 2, !dbg !1360
  %arrayidx11 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add10, !dbg !1361
  %mul12 = shl nuw nsw i32 %i.0, 2, !dbg !1362
  %add13 = or disjoint i32 %mul12, 2, !dbg !1363
  %arrayidx14 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %add13, !dbg !1364
  %add15 = or disjoint i32 %i.0, 64, !dbg !1365
  %arrayidx16 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber512_ref_zetas, i32 0, i32 %add15, !dbg !1366
  %1 = load i16, ptr %arrayidx16, align 2, !dbg !1366
  %sub = sub i16 0, %1, !dbg !1367
  call void @pqcrystals_kyber512_ref_basemul(ptr noundef nonnull %arrayidx8, ptr noundef nonnull %arrayidx11, ptr noundef nonnull %arrayidx14, i16 noundef signext %sub) #3, !dbg !1368
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1369
    #dbg_value(i32 %inc, !1339, !DIExpression(), !1336)
  br label %for.cond, !dbg !1370, !llvm.loop !1371

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1373
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !1374 {
entry:
    #dbg_value(ptr %r, !1375, !DIExpression(), !1376)
    #dbg_value(i16 1353, !1377, !DIExpression(), !1376)
    #dbg_value(i32 0, !1378, !DIExpression(), !1376)
  br label %for.cond, !dbg !1379

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1381
    #dbg_value(i32 %i.0, !1378, !DIExpression(), !1376)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1382
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1384

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1385
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1385
  %conv = sext i16 %0 to i32, !dbg !1386
  %mul = mul nsw i32 %conv, 1353, !dbg !1387
  %call = call signext i16 @pqcrystals_kyber512_ref_montgomery_reduce(i32 noundef %mul) #3, !dbg !1388
  %arrayidx1 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1389
  store i16 %call, ptr %arrayidx1, align 2, !dbg !1390
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1391
    #dbg_value(i32 %inc, !1378, !DIExpression(), !1376)
  br label %for.cond, !dbg !1392, !llvm.loop !1393

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1395
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1396 {
entry:
    #dbg_value(ptr %r, !1397, !DIExpression(), !1398)
    #dbg_value(ptr %a, !1399, !DIExpression(), !1398)
    #dbg_value(ptr %b, !1400, !DIExpression(), !1398)
    #dbg_value(i32 0, !1401, !DIExpression(), !1398)
  br label %for.cond, !dbg !1402

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1404
    #dbg_value(i32 %i.0, !1401, !DIExpression(), !1398)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1405
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1407

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %i.0, !dbg !1408
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1408
  %arrayidx1 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %i.0, !dbg !1409
  %1 = load i16, ptr %arrayidx1, align 2, !dbg !1409
  %add = add i16 %0, %1, !dbg !1410
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1411
  store i16 %add, ptr %arrayidx4, align 2, !dbg !1412
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1413
    #dbg_value(i32 %inc, !1401, !DIExpression(), !1398)
  br label %for.cond, !dbg !1414, !llvm.loop !1415

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1417
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_sub(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1418 {
entry:
    #dbg_value(ptr %r, !1419, !DIExpression(), !1420)
    #dbg_value(ptr %a, !1421, !DIExpression(), !1420)
    #dbg_value(ptr %b, !1422, !DIExpression(), !1420)
    #dbg_value(i32 0, !1423, !DIExpression(), !1420)
  br label %for.cond, !dbg !1424

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1426
    #dbg_value(i32 %i.0, !1423, !DIExpression(), !1420)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1427
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1429

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %i.0, !dbg !1430
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1430
  %arrayidx1 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %i.0, !dbg !1431
  %1 = load i16, ptr %arrayidx1, align 2, !dbg !1431
  %sub = sub i16 %0, %1, !dbg !1432
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1433
  store i16 %sub, ptr %arrayidx4, align 2, !dbg !1434
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1435
    #dbg_value(i32 %inc, !1423, !DIExpression(), !1420)
  br label %for.cond, !dbg !1436, !llvm.loop !1437

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1439
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1440 {
entry:
    #dbg_value(ptr %r, !1443, !DIExpression(), !1444)
    #dbg_value(i32 1, !1445, !DIExpression(), !1444)
    #dbg_value(i32 128, !1446, !DIExpression(), !1444)
  br label %for.cond, !dbg !1447

for.cond:                                         ; preds = %for.inc24, %entry
  %len.0 = phi i32 [ 128, %entry ], [ %shr, %for.inc24 ], !dbg !1449
  %k.0 = phi i32 [ 1, %entry ], [ %k.1.lcssa, %for.inc24 ], !dbg !1450
    #dbg_value(i32 %k.0, !1445, !DIExpression(), !1444)
    #dbg_value(i32 %len.0, !1446, !DIExpression(), !1444)
  %cmp = icmp samesign ugt i32 %len.0, 1, !dbg !1451
  br i1 %cmp, label %for.cond1.preheader, label %for.end25, !dbg !1453

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1454

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc21
  %start.0 = phi i32 [ %add22, %for.inc21 ], [ 0, %for.cond1.preheader ], !dbg !1457
  %k.1 = phi i32 [ %inc, %for.inc21 ], [ %k.0, %for.cond1.preheader ], !dbg !1444
    #dbg_value(i32 %k.1, !1445, !DIExpression(), !1444)
    #dbg_value(i32 %start.0, !1458, !DIExpression(), !1444)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !1459
  br i1 %cmp2, label %for.body3, label %for.inc24, !dbg !1454

for.body3:                                        ; preds = %for.cond1
    #dbg_value(i32 %inc, !1445, !DIExpression(), !1444)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber512_ref_zetas, i32 0, i32 %k.1, !dbg !1461
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1461
    #dbg_value(i16 %0, !1463, !DIExpression(), !1444)
    #dbg_value(i32 %start.0, !1464, !DIExpression(), !1444)
  br label %for.cond4, !dbg !1465

for.cond4:                                        ; preds = %for.body6, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc20, %for.body6 ], !dbg !1467
    #dbg_value(i32 %j.0, !1464, !DIExpression(), !1444)
  %add = add nuw nsw i32 %start.0, %len.0, !dbg !1468
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !1470
  br i1 %cmp5, label %for.body6, label %for.inc21, !dbg !1471

for.body6:                                        ; preds = %for.cond4
  %1 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1472
  %arrayidx8 = getelementptr i16, ptr %1, i32 %len.0, !dbg !1472
  %2 = load i16, ptr %arrayidx8, align 2, !dbg !1472
  %call = call fastcc signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %2) #3, !dbg !1474
    #dbg_value(i16 %call, !1475, !DIExpression(), !1444)
  %arrayidx9 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1476
  %3 = load i16, ptr %arrayidx9, align 2, !dbg !1476
  %sub = sub i16 %3, %call, !dbg !1477
  %4 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1478
  %arrayidx13 = getelementptr i16, ptr %4, i32 %len.0, !dbg !1478
  store i16 %sub, ptr %arrayidx13, align 2, !dbg !1479
  %arrayidx14 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1480
  %5 = load i16, ptr %arrayidx14, align 2, !dbg !1480
  %add17 = add i16 %5, %call, !dbg !1481
  %arrayidx19 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1482
  store i16 %add17, ptr %arrayidx19, align 2, !dbg !1483
  %inc20 = add nuw i32 %j.0, 1, !dbg !1484
    #dbg_value(i32 %inc20, !1464, !DIExpression(), !1444)
  br label %for.cond4, !dbg !1485, !llvm.loop !1486

for.inc21:                                        ; preds = %for.cond4
  %j.0.lcssa = phi i32 [ %j.0, %for.cond4 ], !dbg !1467
  %inc = add i32 %k.1, 1, !dbg !1488
  %add22 = add i32 %j.0.lcssa, %len.0, !dbg !1489
    #dbg_value(i32 %add22, !1458, !DIExpression(), !1444)
  br label %for.cond1, !dbg !1490, !llvm.loop !1491

for.inc24:                                        ; preds = %for.cond1
  %k.1.lcssa = phi i32 [ %k.1, %for.cond1 ], !dbg !1444
  %shr = lshr i32 %len.0, 1, !dbg !1493
    #dbg_value(i32 %shr, !1446, !DIExpression(), !1444)
  br label %for.cond, !dbg !1494, !llvm.loop !1495

for.end25:                                        ; preds = %for.cond
  ret void, !dbg !1497
}

; Function Attrs: nounwind
define internal fastcc signext i16 @fqmul(i16 noundef signext %a, i16 noundef signext %b) unnamed_addr #0 !dbg !1498 {
entry:
    #dbg_value(i16 %a, !1501, !DIExpression(), !1502)
    #dbg_value(i16 %b, !1503, !DIExpression(), !1502)
  %conv = sext i16 %a to i32, !dbg !1504
  %conv1 = sext i16 %b to i32, !dbg !1505
  %mul = mul nsw i32 %conv, %conv1, !dbg !1506
  %call = call signext i16 @pqcrystals_kyber512_ref_montgomery_reduce(i32 noundef %mul) #3, !dbg !1507
  ret i16 %call, !dbg !1508
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_invntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1509 {
entry:
    #dbg_value(ptr %r, !1510, !DIExpression(), !1511)
    #dbg_value(i16 1441, !1512, !DIExpression(), !1511)
    #dbg_value(i32 127, !1513, !DIExpression(), !1511)
    #dbg_value(i32 2, !1514, !DIExpression(), !1511)
  br label %for.cond, !dbg !1515

for.cond:                                         ; preds = %for.inc29, %entry
  %len.0 = phi i32 [ 2, %entry ], [ %shl, %for.inc29 ], !dbg !1517
  %k.0 = phi i32 [ 127, %entry ], [ %k.1.lcssa, %for.inc29 ], !dbg !1518
    #dbg_value(i32 %k.0, !1513, !DIExpression(), !1511)
    #dbg_value(i32 %len.0, !1514, !DIExpression(), !1511)
  %cmp = icmp ult i32 %len.0, 129, !dbg !1519
  br i1 %cmp, label %for.cond1.preheader, label %for.cond31.preheader, !dbg !1521

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1522

for.cond31.preheader:                             ; preds = %for.cond
  br label %for.cond31, !dbg !1525

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc26
  %start.0 = phi i32 [ %add27, %for.inc26 ], [ 0, %for.cond1.preheader ], !dbg !1527
  %k.1 = phi i32 [ %dec, %for.inc26 ], [ %k.0, %for.cond1.preheader ], !dbg !1511
    #dbg_value(i32 %k.1, !1513, !DIExpression(), !1511)
    #dbg_value(i32 %start.0, !1528, !DIExpression(), !1511)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !1529
  br i1 %cmp2, label %for.body3, label %for.inc29, !dbg !1522

for.body3:                                        ; preds = %for.cond1
    #dbg_value(i32 %dec, !1513, !DIExpression(), !1511)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber512_ref_zetas, i32 0, i32 %k.1, !dbg !1531
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1531
    #dbg_value(i16 %0, !1533, !DIExpression(), !1511)
    #dbg_value(i32 %start.0, !1534, !DIExpression(), !1511)
  br label %for.cond4, !dbg !1535

for.cond4:                                        ; preds = %for.body6, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc, %for.body6 ], !dbg !1537
    #dbg_value(i32 %j.0, !1534, !DIExpression(), !1511)
  %add = add nuw nsw i32 %start.0, %len.0, !dbg !1538
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !1540
  br i1 %cmp5, label %for.body6, label %for.inc26, !dbg !1541

for.body6:                                        ; preds = %for.cond4
  %arrayidx7 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1542
  %1 = load i16, ptr %arrayidx7, align 2, !dbg !1542
    #dbg_value(i16 %1, !1544, !DIExpression(), !1511)
  %2 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1545
  %arrayidx9 = getelementptr i16, ptr %2, i32 %len.0, !dbg !1545
  %3 = load i16, ptr %arrayidx9, align 2, !dbg !1545
  %add11 = add i16 %1, %3, !dbg !1546
  %call = call signext i16 @pqcrystals_kyber512_ref_barrett_reduce(i16 noundef signext %add11) #3, !dbg !1547
  %arrayidx13 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1548
  store i16 %call, ptr %arrayidx13, align 2, !dbg !1549
  %4 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1550
  %arrayidx15 = getelementptr i16, ptr %4, i32 %len.0, !dbg !1550
  %5 = load i16, ptr %arrayidx15, align 2, !dbg !1550
  %sub = sub i16 %5, %1, !dbg !1551
  %6 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1552
  %arrayidx20 = getelementptr i16, ptr %6, i32 %len.0, !dbg !1552
  store i16 %sub, ptr %arrayidx20, align 2, !dbg !1553
  %7 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1554
  %arrayidx22 = getelementptr i16, ptr %7, i32 %len.0, !dbg !1554
  %8 = load i16, ptr %arrayidx22, align 2, !dbg !1554
  %call23 = call fastcc signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %8) #3, !dbg !1555
  %9 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1556
  %arrayidx25 = getelementptr i16, ptr %9, i32 %len.0, !dbg !1556
  store i16 %call23, ptr %arrayidx25, align 2, !dbg !1557
  %inc = add nuw i32 %j.0, 1, !dbg !1558
    #dbg_value(i32 %inc, !1534, !DIExpression(), !1511)
  br label %for.cond4, !dbg !1559, !llvm.loop !1560

for.inc26:                                        ; preds = %for.cond4
  %j.0.lcssa = phi i32 [ %j.0, %for.cond4 ], !dbg !1537
  %dec = add i32 %k.1, -1, !dbg !1562
  %add27 = add i32 %j.0.lcssa, %len.0, !dbg !1563
    #dbg_value(i32 %add27, !1528, !DIExpression(), !1511)
  br label %for.cond1, !dbg !1564, !llvm.loop !1565

for.inc29:                                        ; preds = %for.cond1
  %k.1.lcssa = phi i32 [ %k.1, %for.cond1 ], !dbg !1511
  %shl = shl nuw nsw i32 %len.0, 1, !dbg !1567
    #dbg_value(i32 %shl, !1514, !DIExpression(), !1511)
  br label %for.cond, !dbg !1568, !llvm.loop !1569

for.cond31:                                       ; preds = %for.cond31.preheader, %for.body34
  %j.1 = phi i32 [ %inc39, %for.body34 ], [ 0, %for.cond31.preheader ], !dbg !1571
    #dbg_value(i32 %j.1, !1534, !DIExpression(), !1511)
  %exitcond = icmp ne i32 %j.1, 256, !dbg !1572
  br i1 %exitcond, label %for.body34, label %for.end40, !dbg !1525

for.body34:                                       ; preds = %for.cond31
  %arrayidx35 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !1574
  %10 = load i16, ptr %arrayidx35, align 2, !dbg !1574
  %call36 = call fastcc signext i16 @fqmul(i16 noundef signext %10, i16 noundef signext 1441) #3, !dbg !1575
  %arrayidx37 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !1576
  store i16 %call36, ptr %arrayidx37, align 2, !dbg !1577
  %inc39 = add nuw nsw i32 %j.1, 1, !dbg !1578
    #dbg_value(i32 %inc39, !1534, !DIExpression(), !1511)
  br label %for.cond31, !dbg !1579, !llvm.loop !1580

for.end40:                                        ; preds = %for.cond31
  ret void, !dbg !1582
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_basemul(ptr noundef %r, ptr noundef %a, ptr noundef %b, i16 noundef signext %zeta) local_unnamed_addr #0 !dbg !1583 {
entry:
    #dbg_value(ptr %r, !1587, !DIExpression(), !1588)
    #dbg_value(ptr %a, !1589, !DIExpression(), !1588)
    #dbg_value(ptr %b, !1590, !DIExpression(), !1588)
    #dbg_value(i16 %zeta, !1591, !DIExpression(), !1588)
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 2, !dbg !1592
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1592
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 2, !dbg !1593
  %1 = load i16, ptr %arrayidx1, align 2, !dbg !1593
  %call = call fastcc signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %1) #3, !dbg !1594
  store i16 %call, ptr %r, align 2, !dbg !1595
  %call4 = call fastcc signext i16 @fqmul(i16 noundef signext %call, i16 noundef signext %zeta) #3, !dbg !1596
  store i16 %call4, ptr %r, align 2, !dbg !1597
  %2 = load i16, ptr %a, align 2, !dbg !1598
  %3 = load i16, ptr %b, align 2, !dbg !1599
  %call8 = call fastcc signext i16 @fqmul(i16 noundef signext %2, i16 noundef signext %3) #3, !dbg !1600
  %4 = load i16, ptr %r, align 2, !dbg !1601
  %add = add i16 %4, %call8, !dbg !1601
  store i16 %add, ptr %r, align 2, !dbg !1601
  %5 = load i16, ptr %a, align 2, !dbg !1602
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %b, i32 2, !dbg !1603
  %6 = load i16, ptr %arrayidx13, align 2, !dbg !1603
  %call14 = call fastcc signext i16 @fqmul(i16 noundef signext %5, i16 noundef signext %6) #3, !dbg !1604
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %r, i32 2, !dbg !1605
  store i16 %call14, ptr %arrayidx15, align 2, !dbg !1606
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %a, i32 2, !dbg !1607
  %7 = load i16, ptr %arrayidx16, align 2, !dbg !1607
  %8 = load i16, ptr %b, align 2, !dbg !1608
  %call18 = call fastcc signext i16 @fqmul(i16 noundef signext %7, i16 noundef signext %8) #3, !dbg !1609
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %r, i32 2, !dbg !1610
  %9 = load i16, ptr %arrayidx20, align 2, !dbg !1611
  %add22 = add i16 %9, %call18, !dbg !1611
  store i16 %add22, ptr %arrayidx20, align 2, !dbg !1611
  ret void, !dbg !1612
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef %buf) local_unnamed_addr #0 !dbg !1613 {
entry:
    #dbg_value(ptr %r, !1615, !DIExpression(), !1616)
    #dbg_value(ptr %buf, !1617, !DIExpression(), !1616)
  call fastcc void @cbd3(ptr noundef %r, ptr noundef %buf) #3, !dbg !1618
  ret void, !dbg !1619
}

; Function Attrs: nounwind
define internal fastcc void @cbd3(ptr noundef %r, ptr noundef %buf) unnamed_addr #0 !dbg !1620 {
entry:
    #dbg_value(ptr %r, !1621, !DIExpression(), !1622)
    #dbg_value(ptr %buf, !1623, !DIExpression(), !1622)
    #dbg_value(i32 0, !1624, !DIExpression(), !1622)
  br label %for.cond, !dbg !1625

for.cond:                                         ; preds = %for.inc22, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc23, %for.inc22 ], !dbg !1627
    #dbg_value(i32 %i.0, !1624, !DIExpression(), !1622)
  %exitcond1 = icmp ne i32 %i.0, 64, !dbg !1628
  br i1 %exitcond1, label %for.body, label %for.end24, !dbg !1630

for.body:                                         ; preds = %for.cond
  %mul = mul nuw nsw i32 %i.0, 3, !dbg !1631
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 %mul, !dbg !1633
  %call = call fastcc i32 @load24_littleendian(ptr noundef %add.ptr) #3, !dbg !1634
    #dbg_value(i32 %call, !1635, !DIExpression(), !1622)
  %and = and i32 %call, 2396745, !dbg !1636
    #dbg_value(i32 %and, !1637, !DIExpression(), !1622)
  %shr = lshr i32 %call, 1, !dbg !1638
  %and1 = and i32 %shr, 2396745, !dbg !1639
  %add = add nuw nsw i32 %and, %and1, !dbg !1640
    #dbg_value(i32 %add, !1637, !DIExpression(), !1622)
  %shr2 = lshr i32 %call, 2, !dbg !1641
  %and3 = and i32 %shr2, 2396745, !dbg !1642
  %add4 = add nuw nsw i32 %add, %and3, !dbg !1643
    #dbg_value(i32 %add4, !1637, !DIExpression(), !1622)
    #dbg_value(i32 0, !1644, !DIExpression(), !1622)
  br label %for.cond5, !dbg !1645

for.cond5:                                        ; preds = %for.body7, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body7 ], !dbg !1647
    #dbg_value(i32 %j.0, !1644, !DIExpression(), !1622)
  %exitcond = icmp ne i32 %j.0, 4, !dbg !1648
  br i1 %exitcond, label %for.body7, label %for.inc22, !dbg !1650

for.body7:                                        ; preds = %for.cond5
  %mul8 = mul nuw nsw i32 %j.0, 6, !dbg !1651
  %shr10 = lshr i32 %add4, %mul8, !dbg !1653
  %conv = and i32 %shr10, 7, !dbg !1654
    #dbg_value(i32 %shr10, !1655, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 7, DW_OP_and, DW_OP_stack_value), !1622)
  %mul12 = mul nuw nsw i32 %j.0, 6, !dbg !1656
  %add13 = add nuw nsw i32 %mul12, 3, !dbg !1657
  %shr14 = lshr i32 %add4, %add13, !dbg !1658
  %conv16 = and i32 %shr14, 7, !dbg !1659
    #dbg_value(i32 %conv16, !1660, !DIExpression(), !1622)
  %sub = sub nsw i32 %conv, %conv16, !dbg !1661
  %conv19 = trunc nsw i32 %sub to i16, !dbg !1662
  %mul20 = shl nuw nsw i32 %i.0, 2, !dbg !1663
  %add21 = or disjoint i32 %mul20, %j.0, !dbg !1664
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add21, !dbg !1665
  store i16 %conv19, ptr %arrayidx, align 2, !dbg !1666
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1667
    #dbg_value(i32 %inc, !1644, !DIExpression(), !1622)
  br label %for.cond5, !dbg !1668, !llvm.loop !1669

for.inc22:                                        ; preds = %for.cond5
  %inc23 = add nuw nsw i32 %i.0, 1, !dbg !1671
    #dbg_value(i32 %inc23, !1624, !DIExpression(), !1622)
  br label %for.cond, !dbg !1672, !llvm.loop !1673

for.end24:                                        ; preds = %for.cond
  ret void, !dbg !1675
}

; Function Attrs: nounwind
define internal fastcc range(i32 0, 16777216) i32 @load24_littleendian(ptr noundef %x) unnamed_addr #0 !dbg !1676 {
entry:
    #dbg_value(ptr %x, !1679, !DIExpression(), !1680)
  %0 = load i8, ptr %x, align 1, !dbg !1681
  %conv = zext i8 %0 to i32, !dbg !1682
    #dbg_value(i32 %conv, !1683, !DIExpression(), !1680)
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %x, i32 1, !dbg !1684
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !1684
  %conv2 = zext i8 %1 to i32, !dbg !1685
  %shl = shl nuw nsw i32 %conv2, 8, !dbg !1686
  %or = or disjoint i32 %shl, %conv, !dbg !1687
    #dbg_value(i32 %or, !1683, !DIExpression(), !1680)
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %x, i32 2, !dbg !1688
  %2 = load i8, ptr %arrayidx3, align 1, !dbg !1688
  %conv4 = zext i8 %2 to i32, !dbg !1689
  %shl5 = shl nuw nsw i32 %conv4, 16, !dbg !1690
  %or6 = or disjoint i32 %or, %shl5, !dbg !1691
    #dbg_value(i32 %or6, !1683, !DIExpression(), !1680)
  ret i32 %or6, !dbg !1692
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_poly_cbd_eta2(ptr noundef %r, ptr noundef %buf) local_unnamed_addr #0 !dbg !1693 {
entry:
    #dbg_value(ptr %r, !1694, !DIExpression(), !1695)
    #dbg_value(ptr %buf, !1696, !DIExpression(), !1695)
  call fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) #3, !dbg !1697
  ret void, !dbg !1698
}

; Function Attrs: nounwind
define internal fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) unnamed_addr #0 !dbg !1699 {
entry:
    #dbg_value(ptr %r, !1700, !DIExpression(), !1701)
    #dbg_value(ptr %buf, !1702, !DIExpression(), !1701)
    #dbg_value(i32 0, !1703, !DIExpression(), !1701)
  br label %for.cond, !dbg !1704

for.cond:                                         ; preds = %for.inc19, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc20, %for.inc19 ], !dbg !1706
    #dbg_value(i32 %i.0, !1703, !DIExpression(), !1701)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1707
  br i1 %exitcond1, label %for.body, label %for.end21, !dbg !1709

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 2, !dbg !1710
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 %mul, !dbg !1712
  %call = call fastcc i32 @load32_littleendian(ptr noundef %add.ptr) #3, !dbg !1713
    #dbg_value(i32 %call, !1714, !DIExpression(), !1701)
  %and = and i32 %call, 1431655765, !dbg !1715
    #dbg_value(i32 %and, !1716, !DIExpression(), !1701)
  %shr = lshr i32 %call, 1, !dbg !1717
  %and1 = and i32 %shr, 1431655765, !dbg !1718
  %add = add nuw i32 %and, %and1, !dbg !1719
    #dbg_value(i32 %add, !1716, !DIExpression(), !1701)
    #dbg_value(i32 0, !1720, !DIExpression(), !1701)
  br label %for.cond2, !dbg !1721

for.cond2:                                        ; preds = %for.body4, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body4 ], !dbg !1723
    #dbg_value(i32 %j.0, !1720, !DIExpression(), !1701)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1724
  br i1 %exitcond, label %for.body4, label %for.inc19, !dbg !1726

for.body4:                                        ; preds = %for.cond2
  %mul5 = shl nuw nsw i32 %j.0, 2, !dbg !1727
  %shr7 = lshr i32 %add, %mul5, !dbg !1729
  %conv = and i32 %shr7, 3, !dbg !1730
    #dbg_value(i32 %shr7, !1731, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3, DW_OP_and, DW_OP_stack_value), !1701)
  %mul9 = shl nuw nsw i32 %j.0, 2, !dbg !1732
  %add10 = or disjoint i32 %mul9, 2, !dbg !1733
  %shr11 = lshr i32 %add, %add10, !dbg !1734
  %conv13 = and i32 %shr11, 3, !dbg !1735
    #dbg_value(i32 %conv13, !1736, !DIExpression(), !1701)
  %sub = sub nsw i32 %conv, %conv13, !dbg !1737
  %conv16 = trunc nsw i32 %sub to i16, !dbg !1738
  %mul17 = shl nuw nsw i32 %i.0, 3, !dbg !1739
  %add18 = or disjoint i32 %mul17, %j.0, !dbg !1740
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add18, !dbg !1741
  store i16 %conv16, ptr %arrayidx, align 2, !dbg !1742
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1743
    #dbg_value(i32 %inc, !1720, !DIExpression(), !1701)
  br label %for.cond2, !dbg !1744, !llvm.loop !1745

for.inc19:                                        ; preds = %for.cond2
  %inc20 = add nuw nsw i32 %i.0, 1, !dbg !1747
    #dbg_value(i32 %inc20, !1703, !DIExpression(), !1701)
  br label %for.cond, !dbg !1748, !llvm.loop !1749

for.end21:                                        ; preds = %for.cond
  ret void, !dbg !1751
}

; Function Attrs: nounwind
define internal fastcc i32 @load32_littleendian(ptr noundef %x) unnamed_addr #0 !dbg !1752 {
entry:
    #dbg_value(ptr %x, !1753, !DIExpression(), !1754)
  %0 = load i8, ptr %x, align 1, !dbg !1755
  %conv = zext i8 %0 to i32, !dbg !1756
    #dbg_value(i32 %conv, !1757, !DIExpression(), !1754)
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %x, i32 1, !dbg !1758
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !1758
  %conv2 = zext i8 %1 to i32, !dbg !1759
  %shl = shl nuw nsw i32 %conv2, 8, !dbg !1760
  %or = or disjoint i32 %shl, %conv, !dbg !1761
    #dbg_value(i32 %or, !1757, !DIExpression(), !1754)
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %x, i32 2, !dbg !1762
  %2 = load i8, ptr %arrayidx3, align 1, !dbg !1762
  %conv4 = zext i8 %2 to i32, !dbg !1763
  %shl5 = shl nuw nsw i32 %conv4, 16, !dbg !1764
  %or6 = or disjoint i32 %or, %shl5, !dbg !1765
    #dbg_value(i32 %or6, !1757, !DIExpression(), !1754)
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %x, i32 3, !dbg !1766
  %3 = load i8, ptr %arrayidx7, align 1, !dbg !1766
  %conv8 = zext i8 %3 to i32, !dbg !1767
  %shl9 = shl nuw i32 %conv8, 24, !dbg !1768
  %or10 = or disjoint i32 %or6, %shl9, !dbg !1769
    #dbg_value(i32 %or10, !1757, !DIExpression(), !1754)
  ret i32 %or10, !dbg !1770
}

; Function Attrs: nounwind
define dso_local signext i16 @pqcrystals_kyber512_ref_montgomery_reduce(i32 noundef %a) local_unnamed_addr #0 !dbg !1771 {
entry:
    #dbg_value(i32 %a, !1774, !DIExpression(), !1775)
    #dbg_value(i32 %a, !1776, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !1775)
  %sext = mul i32 %a, -218038272, !dbg !1777
  %conv3 = ashr exact i32 %sext, 16, !dbg !1777
  %mul4.neg = mul nsw i32 %conv3, -3329, !dbg !1778
  %sub = add i32 %mul4.neg, %a, !dbg !1779
  %shr = lshr i32 %sub, 16, !dbg !1780
  %conv5 = trunc nuw i32 %shr to i16, !dbg !1781
    #dbg_value(i16 %conv5, !1776, !DIExpression(), !1775)
  ret i16 %conv5, !dbg !1782
}

; Function Attrs: nounwind
define dso_local signext i16 @pqcrystals_kyber512_ref_barrett_reduce(i16 noundef signext %a) local_unnamed_addr #0 !dbg !1783 {
entry:
    #dbg_value(i16 %a, !1786, !DIExpression(), !1787)
    #dbg_value(i16 20159, !1788, !DIExpression(), !1787)
  %conv = sext i16 %a to i32, !dbg !1789
  %mul = mul nsw i32 %conv, 20159, !dbg !1790
  %add = add nsw i32 %mul, 33554432, !dbg !1791
  %shr = ashr i32 %add, 26, !dbg !1792
    #dbg_value(i32 %shr, !1793, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1787)
    #dbg_value(i32 %shr, !1793, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1787)
  %0 = trunc nsw i32 %shr to i16, !dbg !1794
  %1 = mul i16 %0, -3329, !dbg !1794
  %conv7 = add i16 %1, %a, !dbg !1794
  ret i16 %conv7, !dbg !1795
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqcrystals_kyber512_ref_verify(ptr noundef %a, ptr noundef %b, i32 noundef %len) local_unnamed_addr #0 !dbg !1796 {
entry:
    #dbg_value(ptr %a, !1800, !DIExpression(), !1801)
    #dbg_value(ptr %b, !1802, !DIExpression(), !1801)
    #dbg_value(i32 %len, !1803, !DIExpression(), !1801)
    #dbg_value(i8 0, !1804, !DIExpression(), !1801)
    #dbg_value(i32 0, !1805, !DIExpression(), !1801)
  br label %for.cond, !dbg !1806

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1808
  %r.0 = phi i8 [ 0, %entry ], [ %or2, %for.inc ], !dbg !1801
    #dbg_value(i8 %r.0, !1804, !DIExpression(), !1801)
    #dbg_value(i32 %i.0, !1805, !DIExpression(), !1801)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !1809
  br i1 %exitcond, label %for.inc, label %for.end, !dbg !1811

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i8 poison, i8 poison, i8 poison), !1804, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1801)
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %i.0, !dbg !1812
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1812
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 %i.0, !dbg !1813
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !1813
    #dbg_value(!DIArgList(i8 %r.0, i8 %0, i8 %1), !1804, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1801)
  %xor1 = xor i8 %0, %1, !dbg !1814
    #dbg_value(!DIArgList(i8 %r.0, i8 %xor1), !1804, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1801)
  %or2 = or i8 %r.0, %xor1, !dbg !1815
    #dbg_value(i8 %or2, !1804, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1801)
    #dbg_value(i8 %or2, !1804, !DIExpression(), !1801)
  %inc = add i32 %i.0, 1, !dbg !1816
    #dbg_value(i32 %inc, !1805, !DIExpression(), !1801)
  br label %for.cond, !dbg !1817, !llvm.loop !1818

for.end:                                          ; preds = %for.cond
  %r.0.lcssa = phi i8 [ %r.0, %for.cond ], !dbg !1801
  %2 = icmp ne i8 %r.0.lcssa, 0, !dbg !1820
  %conv6 = zext i1 %2 to i32, !dbg !1821
  ret i32 %conv6, !dbg !1822
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_cmov(ptr noundef %r, ptr noundef %x, i32 noundef %len, i8 noundef zeroext %b) local_unnamed_addr #0 !dbg !1823 {
entry:
    #dbg_value(ptr %r, !1826, !DIExpression(), !1827)
    #dbg_value(ptr %x, !1828, !DIExpression(), !1827)
    #dbg_value(i32 %len, !1829, !DIExpression(), !1827)
    #dbg_value(i8 %b, !1830, !DIExpression(), !1827)
  %0 = call i8 asm "", "=r,0"(i8 %b) #5, !dbg !1831, !srcloc !1832
    #dbg_value(i8 %0, !1830, !DIExpression(), !1827)
  %sub = sub i8 0, %0, !dbg !1833
    #dbg_value(i8 %sub, !1830, !DIExpression(), !1827)
    #dbg_value(i32 0, !1834, !DIExpression(), !1827)
  br label %for.cond, !dbg !1835

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1837
    #dbg_value(i32 %i.0, !1834, !DIExpression(), !1827)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !1838
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1840

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !1841
  %1 = load i8, ptr %arrayidx, align 1, !dbg !1841
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !1842
  %2 = load i8, ptr %arrayidx5, align 1, !dbg !1842
  %xor1 = xor i8 %1, %2, !dbg !1843
  %and2 = and i8 %xor1, %sub, !dbg !1844
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !1845
  %xor93 = xor i8 %1, %and2, !dbg !1846
  store i8 %xor93, ptr %arrayidx7, align 1, !dbg !1846
  %inc = add i32 %i.0, 1, !dbg !1847
    #dbg_value(i32 %inc, !1834, !DIExpression(), !1827)
  br label %for.cond, !dbg !1848, !llvm.loop !1849

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1851
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_cmov_int16(ptr noundef %r, i16 noundef signext %v, i16 noundef zeroext %b) local_unnamed_addr #0 !dbg !1852 {
entry:
    #dbg_value(ptr %r, !1855, !DIExpression(), !1856)
    #dbg_value(i16 %v, !1857, !DIExpression(), !1856)
    #dbg_value(i16 %b, !1858, !DIExpression(), !1856)
  %sub = sub i16 0, %b, !dbg !1859
    #dbg_value(i16 %sub, !1858, !DIExpression(), !1856)
  %0 = load i16, ptr %r, align 2, !dbg !1860
  %xor1 = xor i16 %0, %v, !dbg !1861
  %and = and i16 %xor1, %sub, !dbg !1862
  %xor6 = xor i16 %and, %0, !dbg !1863
  store i16 %xor6, ptr %r, align 2, !dbg !1863
  ret void, !dbg !1864
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_init(ptr noundef %state) local_unnamed_addr #0 !dbg !1865 {
entry:
    #dbg_value(ptr %state, !1869, !DIExpression(), !1870)
  call fastcc void @keccak_init(ptr noundef %state) #3, !dbg !1871
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1872
  store i64 0, ptr %arrayidx, align 8, !dbg !1873
  ret void, !dbg !1874
}

; Function Attrs: nounwind
define internal fastcc void @keccak_init(ptr noundef %s) unnamed_addr #0 !dbg !1875 {
entry:
    #dbg_value(ptr %s, !1879, !DIExpression(), !1880)
    #dbg_value(i32 0, !1881, !DIExpression(), !1880)
  br label %for.cond, !dbg !1882

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1884
    #dbg_value(i32 %i.0, !1881, !DIExpression(), !1880)
  %exitcond = icmp ne i32 %i.0, 25, !dbg !1885
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1887

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !1888
  store i64 0, ptr %arrayidx, align 8, !dbg !1889
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1890
    #dbg_value(i32 %inc, !1881, !DIExpression(), !1880)
  br label %for.cond, !dbg !1891, !llvm.loop !1892

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1894
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !1895 {
entry:
    #dbg_value(ptr %state, !1898, !DIExpression(), !1899)
    #dbg_value(ptr %in, !1900, !DIExpression(), !1899)
    #dbg_value(i32 %inlen, !1901, !DIExpression(), !1899)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1902
  %0 = load i64, ptr %arrayidx, align 8, !dbg !1902
  %conv = trunc i64 %0 to i32, !dbg !1902
  %call = call fastcc i32 @keccak_absorb(ptr noundef %state, i32 noundef %conv, i32 noundef 168, ptr noundef %in, i32 noundef %inlen) #3, !dbg !1903
  %conv1 = zext i32 %call to i64, !dbg !1903
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1904
  store i64 %conv1, ptr %arrayidx2, align 8, !dbg !1905
  ret void, !dbg !1906
}

; Function Attrs: nounwind
define internal fastcc i32 @keccak_absorb(ptr noundef %s, i32 noundef %pos, i32 noundef range(i32 136, 169) %r, ptr noundef %in, i32 noundef %inlen) unnamed_addr #0 !dbg !1907 {
entry:
    #dbg_value(ptr %s, !1910, !DIExpression(), !1911)
    #dbg_value(i32 %pos, !1912, !DIExpression(), !1911)
    #dbg_value(i32 %r, !1913, !DIExpression(), !1911)
    #dbg_value(ptr %in, !1914, !DIExpression(), !1911)
    #dbg_value(i32 %inlen, !1915, !DIExpression(), !1911)
  br label %while.cond, !dbg !1916

while.cond:                                       ; preds = %for.end, %entry
  %in.addr.0 = phi ptr [ %in, %entry ], [ %in.addr.1.lcssa, %for.end ]
  %inlen.addr.0 = phi i32 [ %inlen, %entry ], [ %sub2, %for.end ]
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ 0, %for.end ]
    #dbg_value(i32 %pos.addr.0, !1912, !DIExpression(), !1911)
    #dbg_value(i32 %inlen.addr.0, !1915, !DIExpression(), !1911)
    #dbg_value(ptr %in.addr.0, !1914, !DIExpression(), !1911)
  %add = add i32 %pos.addr.0, %inlen.addr.0, !dbg !1917
  %cmp.not = icmp ult i32 %add, %r, !dbg !1918
  br i1 %cmp.not, label %for.cond3.preheader, label %for.cond.preheader, !dbg !1916

for.cond.preheader:                               ; preds = %while.cond
  %umax = call i32 @llvm.umax.i32(i32 %pos.addr.0, i32 %r), !dbg !1919
  br label %for.cond, !dbg !1919

for.cond3.preheader:                              ; preds = %while.cond
  %in.addr.0.lcssa = phi ptr [ %in.addr.0, %while.cond ]
  %inlen.addr.0.lcssa = phi i32 [ %inlen.addr.0, %while.cond ]
  %pos.addr.0.lcssa = phi i32 [ %pos.addr.0, %while.cond ]
  br label %for.cond3, !dbg !1922

for.cond:                                         ; preds = %for.cond.preheader, %for.body
  %in.addr.1 = phi ptr [ %incdec.ptr, %for.body ], [ %in.addr.0, %for.cond.preheader ]
  %i.0 = phi i32 [ %inc, %for.body ], [ %pos.addr.0, %for.cond.preheader ], !dbg !1924
    #dbg_value(i32 %i.0, !1925, !DIExpression(), !1911)
    #dbg_value(ptr %in.addr.1, !1914, !DIExpression(), !1911)
  %exitcond = icmp ne i32 %i.0, %umax, !dbg !1926
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1919

for.body:                                         ; preds = %for.cond
    #dbg_value(ptr %in.addr.1, !1914, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1911)
  %0 = load i8, ptr %in.addr.1, align 1, !dbg !1928
  %conv = zext i8 %0 to i64, !dbg !1929
  %rem = shl nuw nsw i32 %i.0, 3, !dbg !1930
  %mul = and i32 %rem, 56, !dbg !1930
  %sh_prom = zext nneg i32 %mul to i64, !dbg !1931
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !1931
  %div2 = lshr i32 %i.0, 3, !dbg !1932
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div2, !dbg !1933
  %1 = load i64, ptr %arrayidx, align 8, !dbg !1934
  %xor = xor i64 %1, %shl, !dbg !1934
  store i64 %xor, ptr %arrayidx, align 8, !dbg !1934
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %in.addr.1, i32 1, !dbg !1935
    #dbg_value(ptr %incdec.ptr, !1914, !DIExpression(), !1911)
  %inc = add i32 %i.0, 1, !dbg !1936
    #dbg_value(i32 %inc, !1925, !DIExpression(), !1911)
  br label %for.cond, !dbg !1937, !llvm.loop !1938

for.end:                                          ; preds = %for.cond
  %in.addr.1.lcssa = phi ptr [ %in.addr.1, %for.cond ]
  %sub.neg = sub i32 %pos.addr.0, %r, !dbg !1940
  %sub2 = add i32 %sub.neg, %inlen.addr.0, !dbg !1941
    #dbg_value(i32 %sub2, !1915, !DIExpression(), !1911)
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !1942
    #dbg_value(i32 0, !1912, !DIExpression(), !1911)
  br label %while.cond, !dbg !1916, !llvm.loop !1943

for.cond3:                                        ; preds = %for.cond3.preheader, %for.body7
  %in.addr.2 = phi ptr [ %incdec.ptr8, %for.body7 ], [ %in.addr.0.lcssa, %for.cond3.preheader ]
  %i.1 = phi i32 [ %inc18, %for.body7 ], [ %pos.addr.0.lcssa, %for.cond3.preheader ], !dbg !1945
    #dbg_value(i32 %i.1, !1925, !DIExpression(), !1911)
    #dbg_value(ptr %in.addr.2, !1914, !DIExpression(), !1911)
  %add4 = add i32 %pos.addr.0.lcssa, %inlen.addr.0.lcssa, !dbg !1946
  %cmp5 = icmp ult i32 %i.1, %add4, !dbg !1948
  br i1 %cmp5, label %for.body7, label %for.end19, !dbg !1922

for.body7:                                        ; preds = %for.cond3
    #dbg_value(ptr %in.addr.2, !1914, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1911)
  %2 = load i8, ptr %in.addr.2, align 1, !dbg !1949
  %conv9 = zext i8 %2 to i64, !dbg !1950
  %rem10 = shl i32 %i.1, 3, !dbg !1951
  %mul11 = and i32 %rem10, 56, !dbg !1951
  %sh_prom12 = zext nneg i32 %mul11 to i64, !dbg !1952
  %shl13 = shl nuw i64 %conv9, %sh_prom12, !dbg !1952
  %div141 = lshr i32 %i.1, 3, !dbg !1953
  %arrayidx15 = getelementptr inbounds nuw i64, ptr %s, i32 %div141, !dbg !1954
  %3 = load i64, ptr %arrayidx15, align 8, !dbg !1955
  %xor16 = xor i64 %3, %shl13, !dbg !1955
  store i64 %xor16, ptr %arrayidx15, align 8, !dbg !1955
  %incdec.ptr8 = getelementptr inbounds nuw i8, ptr %in.addr.2, i32 1, !dbg !1956
    #dbg_value(ptr %incdec.ptr8, !1914, !DIExpression(), !1911)
  %inc18 = add nuw i32 %i.1, 1, !dbg !1957
    #dbg_value(i32 %inc18, !1925, !DIExpression(), !1911)
  br label %for.cond3, !dbg !1958, !llvm.loop !1959

for.end19:                                        ; preds = %for.cond3
  %i.1.lcssa = phi i32 [ %i.1, %for.cond3 ], !dbg !1945
  ret i32 %i.1.lcssa, !dbg !1961
}

; Function Attrs: nounwind
define internal fastcc void @KeccakF1600_StatePermute(ptr noundef %state) unnamed_addr #0 !dbg !1962 {
entry:
    #dbg_value(ptr %state, !1963, !DIExpression(), !1964)
  %0 = load i64, ptr %state, align 8, !dbg !1965
    #dbg_value(i64 %0, !1966, !DIExpression(), !1964)
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !1967
  %1 = load i64, ptr %arrayidx1, align 8, !dbg !1967
    #dbg_value(i64 %1, !1968, !DIExpression(), !1964)
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !1969
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !1969
    #dbg_value(i64 %2, !1970, !DIExpression(), !1964)
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !1971
  %3 = load i64, ptr %arrayidx3, align 8, !dbg !1971
    #dbg_value(i64 %3, !1972, !DIExpression(), !1964)
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !1973
  %4 = load i64, ptr %arrayidx4, align 8, !dbg !1973
    #dbg_value(i64 %4, !1974, !DIExpression(), !1964)
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !1975
  %5 = load i64, ptr %arrayidx5, align 8, !dbg !1975
    #dbg_value(i64 %5, !1976, !DIExpression(), !1964)
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !1977
  %6 = load i64, ptr %arrayidx6, align 8, !dbg !1977
    #dbg_value(i64 %6, !1978, !DIExpression(), !1964)
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !1979
  %7 = load i64, ptr %arrayidx7, align 8, !dbg !1979
    #dbg_value(i64 %7, !1980, !DIExpression(), !1964)
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !1981
  %8 = load i64, ptr %arrayidx8, align 8, !dbg !1981
    #dbg_value(i64 %8, !1982, !DIExpression(), !1964)
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !1983
  %9 = load i64, ptr %arrayidx9, align 8, !dbg !1983
    #dbg_value(i64 %9, !1984, !DIExpression(), !1964)
  %arrayidx10 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !1985
  %10 = load i64, ptr %arrayidx10, align 8, !dbg !1985
    #dbg_value(i64 %10, !1986, !DIExpression(), !1964)
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !1987
  %11 = load i64, ptr %arrayidx11, align 8, !dbg !1987
    #dbg_value(i64 %11, !1988, !DIExpression(), !1964)
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !1989
  %12 = load i64, ptr %arrayidx12, align 8, !dbg !1989
    #dbg_value(i64 %12, !1990, !DIExpression(), !1964)
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !1991
  %13 = load i64, ptr %arrayidx13, align 8, !dbg !1991
    #dbg_value(i64 %13, !1992, !DIExpression(), !1964)
  %arrayidx14 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !1993
  %14 = load i64, ptr %arrayidx14, align 8, !dbg !1993
    #dbg_value(i64 %14, !1994, !DIExpression(), !1964)
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !1995
  %15 = load i64, ptr %arrayidx15, align 8, !dbg !1995
    #dbg_value(i64 %15, !1996, !DIExpression(), !1964)
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !1997
  %16 = load i64, ptr %arrayidx16, align 8, !dbg !1997
    #dbg_value(i64 %16, !1998, !DIExpression(), !1964)
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !1999
  %17 = load i64, ptr %arrayidx17, align 8, !dbg !1999
    #dbg_value(i64 %17, !2000, !DIExpression(), !1964)
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !2001
  %18 = load i64, ptr %arrayidx18, align 8, !dbg !2001
    #dbg_value(i64 %18, !2002, !DIExpression(), !1964)
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !2003
  %19 = load i64, ptr %arrayidx19, align 8, !dbg !2003
    #dbg_value(i64 %19, !2004, !DIExpression(), !1964)
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !2005
  %20 = load i64, ptr %arrayidx20, align 8, !dbg !2005
    #dbg_value(i64 %20, !2006, !DIExpression(), !1964)
  %arrayidx21 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !2007
  %21 = load i64, ptr %arrayidx21, align 8, !dbg !2007
    #dbg_value(i64 %21, !2008, !DIExpression(), !1964)
  %arrayidx22 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !2009
  %22 = load i64, ptr %arrayidx22, align 8, !dbg !2009
    #dbg_value(i64 %22, !2010, !DIExpression(), !1964)
  %arrayidx23 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !2011
  %23 = load i64, ptr %arrayidx23, align 8, !dbg !2011
    #dbg_value(i64 %23, !2012, !DIExpression(), !1964)
  %arrayidx24 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !2013
  %24 = load i64, ptr %arrayidx24, align 8, !dbg !2013
    #dbg_value(i64 %24, !2014, !DIExpression(), !1964)
    #dbg_value(i32 0, !2015, !DIExpression(), !1964)
  br label %for.cond, !dbg !2016

for.cond:                                         ; preds = %for.inc, %entry
  %Aso.0 = phi i64 [ %23, %entry ], [ %xor444, %for.inc ], !dbg !1964
  %Asi.0 = phi i64 [ %22, %entry ], [ %xor441, %for.inc ], !dbg !1964
  %Ase.0 = phi i64 [ %21, %entry ], [ %xor438, %for.inc ], !dbg !1964
  %Asa.0 = phi i64 [ %20, %entry ], [ %xor435, %for.inc ], !dbg !1964
  %Amu.0 = phi i64 [ %19, %entry ], [ %xor412, %for.inc ], !dbg !1964
  %Amo.0 = phi i64 [ %18, %entry ], [ %xor409, %for.inc ], !dbg !1964
  %Ami.0 = phi i64 [ %17, %entry ], [ %xor406, %for.inc ], !dbg !1964
  %Ame.0 = phi i64 [ %16, %entry ], [ %xor403, %for.inc ], !dbg !1964
  %Ama.0 = phi i64 [ %15, %entry ], [ %xor400, %for.inc ], !dbg !1964
  %Aku.0 = phi i64 [ %14, %entry ], [ %xor377, %for.inc ], !dbg !1964
  %Ako.0 = phi i64 [ %13, %entry ], [ %xor374, %for.inc ], !dbg !1964
  %Aki.0 = phi i64 [ %12, %entry ], [ %xor371, %for.inc ], !dbg !1964
  %Ake.0 = phi i64 [ %11, %entry ], [ %xor368, %for.inc ], !dbg !1964
  %Aka.0 = phi i64 [ %10, %entry ], [ %xor365, %for.inc ], !dbg !1964
  %Agu.0 = phi i64 [ %9, %entry ], [ %xor342, %for.inc ], !dbg !1964
  %Ago.0 = phi i64 [ %8, %entry ], [ %xor339, %for.inc ], !dbg !1964
  %Agi.0 = phi i64 [ %7, %entry ], [ %xor336, %for.inc ], !dbg !1964
  %Age.0 = phi i64 [ %6, %entry ], [ %xor333, %for.inc ], !dbg !1964
  %Aga.0 = phi i64 [ %5, %entry ], [ %xor330, %for.inc ], !dbg !1964
  %Abu.0 = phi i64 [ %4, %entry ], [ %xor307, %for.inc ], !dbg !1964
  %Abo.0 = phi i64 [ %3, %entry ], [ %xor304, %for.inc ], !dbg !1964
  %Abi.0 = phi i64 [ %2, %entry ], [ %xor301, %for.inc ], !dbg !1964
  %Abe.0 = phi i64 [ %1, %entry ], [ %xor298, %for.inc ], !dbg !1964
  %Aba.0 = phi i64 [ %0, %entry ], [ %xor295, %for.inc ], !dbg !1964
  %round.0 = phi i32 [ 0, %entry ], [ %add448, %for.inc ], !dbg !2018
  %Asu.0 = phi i64 [ %24, %entry ], [ %xor447, %for.inc ], !dbg !1964
    #dbg_value(i64 %Asu.0, !2014, !DIExpression(), !1964)
    #dbg_value(i32 %round.0, !2015, !DIExpression(), !1964)
    #dbg_value(i64 %Aba.0, !1966, !DIExpression(), !1964)
    #dbg_value(i64 %Abe.0, !1968, !DIExpression(), !1964)
    #dbg_value(i64 %Abi.0, !1970, !DIExpression(), !1964)
    #dbg_value(i64 %Abo.0, !1972, !DIExpression(), !1964)
    #dbg_value(i64 %Abu.0, !1974, !DIExpression(), !1964)
    #dbg_value(i64 %Aga.0, !1976, !DIExpression(), !1964)
    #dbg_value(i64 %Age.0, !1978, !DIExpression(), !1964)
    #dbg_value(i64 %Agi.0, !1980, !DIExpression(), !1964)
    #dbg_value(i64 %Ago.0, !1982, !DIExpression(), !1964)
    #dbg_value(i64 %Agu.0, !1984, !DIExpression(), !1964)
    #dbg_value(i64 %Aka.0, !1986, !DIExpression(), !1964)
    #dbg_value(i64 %Ake.0, !1988, !DIExpression(), !1964)
    #dbg_value(i64 %Aki.0, !1990, !DIExpression(), !1964)
    #dbg_value(i64 %Ako.0, !1992, !DIExpression(), !1964)
    #dbg_value(i64 %Aku.0, !1994, !DIExpression(), !1964)
    #dbg_value(i64 %Ama.0, !1996, !DIExpression(), !1964)
    #dbg_value(i64 %Ame.0, !1998, !DIExpression(), !1964)
    #dbg_value(i64 %Ami.0, !2000, !DIExpression(), !1964)
    #dbg_value(i64 %Amo.0, !2002, !DIExpression(), !1964)
    #dbg_value(i64 %Amu.0, !2004, !DIExpression(), !1964)
    #dbg_value(i64 %Asa.0, !2006, !DIExpression(), !1964)
    #dbg_value(i64 %Ase.0, !2008, !DIExpression(), !1964)
    #dbg_value(i64 %Asi.0, !2010, !DIExpression(), !1964)
    #dbg_value(i64 %Aso.0, !2012, !DIExpression(), !1964)
  %cmp = icmp samesign ult i32 %round.0, 24, !dbg !2019
  br i1 %cmp, label %for.inc, label %for.end, !dbg !2021

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %Asa.0, i64 %Ama.0, i64 %Aka.0, i64 %Aga.0), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %Ase.0, i64 %Ame.0, i64 %Ake.0, i64 %Age.0), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %Asi.0, i64 %Ami.0, i64 %Aki.0, i64 %Agi.0), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %Aso.0, i64 %Amo.0, i64 %Ako.0, i64 %Ago.0), !2025, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %Asu.0, i64 %Amu.0, i64 %Aku.0, i64 %Agu.0), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2027, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2028, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2029, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2030, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2031, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2023, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1990, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2024, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2002, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2025, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2014, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2026, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2032, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2032, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2033, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2035, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2036, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1972, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2022, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2023, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1986, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2024, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1998, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2025, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2010, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2026, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2037, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2039, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2040, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2041, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1968, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2022, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2023, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1992, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2024, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2004, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2025, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2006, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2026, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2042, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2043, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2045, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2046, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2022, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1976, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2023, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1988, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2024, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2000, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2025, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2012, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2026, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2047, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2048, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2049, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2050, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2051, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1970, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2022, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2023, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1994, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2024, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1996, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2025, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2008, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2026, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2052, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2053, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2054, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2055, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2056, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2025, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2027, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2028, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2029, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2030, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2031, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2032, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2023, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2024, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2050, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2025, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2056, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2026, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1968, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1970, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1972, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !1974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2035, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2022, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2041, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2023, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2042, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2024, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2048, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2025, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2054, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2026, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1976, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2033, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2022, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2039, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2023, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2045, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2024, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2051, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2025, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2052, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2026, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1986, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1988, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1990, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1992, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1994, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2036, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2022, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2037, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2023, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2043, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2024, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2049, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2025, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2055, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2026, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1996, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1998, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2000, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2002, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2004, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2022, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2040, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2023, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2046, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2024, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2047, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2025, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2053, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 poison, !2026, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2006, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2008, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2010, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2012, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2014, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor32 = xor i64 %Abi.0, %Agi.0, !dbg !2057
    #dbg_value(!DIArgList(i64 %xor32, i64 %Asi.0, i64 %Ami.0, i64 %Aki.0), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor33 = xor i64 %xor32, %Aki.0, !dbg !2059
    #dbg_value(!DIArgList(i64 %xor33, i64 %Asi.0, i64 %Ami.0), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor34 = xor i64 %xor33, %Ami.0, !dbg !2060
    #dbg_value(!DIArgList(i64 %xor34, i64 %Asi.0), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor35 = xor i64 %xor34, %Asi.0, !dbg !2061
    #dbg_value(i64 %xor35, !2024, !DIExpression(), !1964)
  %xor40 = xor i64 %Abu.0, %Agu.0, !dbg !2062
    #dbg_value(!DIArgList(i64 %xor40, i64 %Asu.0, i64 %Amu.0, i64 %Aku.0), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor41 = xor i64 %xor40, %Aku.0, !dbg !2063
    #dbg_value(!DIArgList(i64 %xor41, i64 %Asu.0, i64 %Amu.0), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor42 = xor i64 %xor41, %Amu.0, !dbg !2064
    #dbg_value(!DIArgList(i64 %xor42, i64 %Asu.0), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor43 = xor i64 %xor42, %Asu.0, !dbg !2065
    #dbg_value(i64 %xor43, !2026, !DIExpression(), !1964)
  %xor56 = call i64 @llvm.fshl.i64(i64 %xor43, i64 %xor43, i64 1), !dbg !2066
    #dbg_value(!DIArgList(i64 %Ago.0, i64 %xor35, i64 %xor56), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %xor35, i64 %xor56), !1972, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Ako.0, i64 %xor35, i64 %xor56), !1992, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Amo.0, i64 %xor35, i64 %xor56), !2002, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Aso.0, i64 %xor35, i64 %xor56), !2012, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor35, i64 %xor56), !2030, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor57 = xor i64 %xor35, %xor56, !dbg !2067
    #dbg_value(!DIArgList(i64 %Ago.0, i64 %xor57), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %xor57), !1972, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Ako.0, i64 %xor57), !1992, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Amo.0, i64 %xor57), !2002, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Aso.0, i64 %xor57), !2012, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 %xor57, !2030, !DIExpression(), !1964)
  %xor203 = xor i64 %Ago.0, %xor57, !dbg !2068
    #dbg_value(i64 %xor203, !1982, !DIExpression(), !1964)
  %xor206 = call i64 @llvm.fshl.i64(i64 %xor203, i64 %xor203, i64 55), !dbg !2069
    #dbg_value(i64 %xor206, !2023, !DIExpression(), !1964)
  %xor28 = xor i64 %Abe.0, %Age.0, !dbg !2070
    #dbg_value(!DIArgList(i64 %xor28, i64 %Ase.0, i64 %Ame.0, i64 %Ake.0), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor29 = xor i64 %xor28, %Ake.0, !dbg !2071
    #dbg_value(!DIArgList(i64 %xor29, i64 %Ase.0, i64 %Ame.0), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor30 = xor i64 %xor29, %Ame.0, !dbg !2072
    #dbg_value(!DIArgList(i64 %xor30, i64 %Ase.0), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor31 = xor i64 %xor30, %Ase.0, !dbg !2073
    #dbg_value(i64 %xor31, !2023, !DIExpression(), !1964)
  %xor44 = call i64 @llvm.fshl.i64(i64 %xor31, i64 %xor31, i64 1), !dbg !2074
    #dbg_value(!DIArgList(i64 %xor43, i64 %xor44), !2027, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor43, i64 %xor44), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor43, i64 %xor44), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Aka.0, i64 %xor43, i64 %xor44), !1986, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Aga.0, i64 %xor43, i64 %xor44), !1976, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Asa.0, i64 %xor43, i64 %xor44), !2006, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Ama.0, i64 %xor43, i64 %xor44), !1996, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor45 = xor i64 %xor43, %xor44, !dbg !2075
    #dbg_value(i64 %xor45, !2027, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor45), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor45), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Aka.0, i64 %xor45), !1986, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Aga.0, i64 %xor45), !1976, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Asa.0, i64 %xor45), !2006, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Ama.0, i64 %xor45), !1996, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor211 = xor i64 %Ama.0, %xor45, !dbg !2076
    #dbg_value(i64 %xor211, !1996, !DIExpression(), !1964)
  %xor214 = call i64 @llvm.fshl.i64(i64 %xor211, i64 %xor211, i64 41), !dbg !2077
    #dbg_value(i64 %xor214, !2025, !DIExpression(), !1964)
  %xor36 = xor i64 %Abo.0, %Ago.0, !dbg !2078
    #dbg_value(!DIArgList(i64 %xor36, i64 %Aso.0, i64 %Amo.0, i64 %Ako.0), !2025, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor37 = xor i64 %xor36, %Ako.0, !dbg !2079
    #dbg_value(!DIArgList(i64 %xor37, i64 %Aso.0, i64 %Amo.0), !2025, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor38 = xor i64 %xor37, %Amo.0, !dbg !2080
    #dbg_value(!DIArgList(i64 %xor38, i64 %Aso.0), !2025, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor39 = xor i64 %xor38, %Aso.0, !dbg !2081
    #dbg_value(i64 %xor39, !2025, !DIExpression(), !1964)
  %xor = xor i64 %Aba.0, %Aga.0, !dbg !2082
    #dbg_value(!DIArgList(i64 %xor, i64 %Asa.0, i64 %Ama.0, i64 %Aka.0), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor25 = xor i64 %xor, %Aka.0, !dbg !2083
    #dbg_value(!DIArgList(i64 %xor25, i64 %Asa.0, i64 %Ama.0), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor26 = xor i64 %xor25, %Ama.0, !dbg !2084
    #dbg_value(!DIArgList(i64 %xor26, i64 %Asa.0), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor27 = xor i64 %xor26, %Asa.0, !dbg !2085
    #dbg_value(i64 %xor27, !2022, !DIExpression(), !1964)
  %xor60 = call i64 @llvm.fshl.i64(i64 %xor27, i64 %xor27, i64 1), !dbg !2086
    #dbg_value(!DIArgList(i64 %Agu.0, i64 %xor39, i64 %xor60), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %xor39, i64 %xor60), !1974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Asu.0, i64 %xor39, i64 %xor60), !2014, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Amu.0, i64 %xor39, i64 %xor60), !2004, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor39, i64 %xor60), !2031, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Aku.0, i64 %xor39, i64 %xor60), !1994, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor61 = xor i64 %xor39, %xor60, !dbg !2087
    #dbg_value(!DIArgList(i64 %Agu.0, i64 %xor61), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %xor61), !1974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Asu.0, i64 %xor61), !2014, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Amu.0, i64 %xor61), !2004, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 %xor61, !2031, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 %Aku.0, i64 %xor61), !1994, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor207 = xor i64 %Aku.0, %xor61, !dbg !2088
    #dbg_value(i64 %xor207, !1994, !DIExpression(), !1964)
  %xor210 = call i64 @llvm.fshl.i64(i64 %xor207, i64 %xor207, i64 39), !dbg !2089
    #dbg_value(i64 %xor210, !2024, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 %xor206, i64 %xor214, i64 %xor210), !2053, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %not222 = xor i64 %xor210, -1, !dbg !2090
    #dbg_value(!DIArgList(i64 %xor206, i64 %xor214, i64 %not222), !2053, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %and223 = and i64 %xor214, %not222, !dbg !2091
    #dbg_value(!DIArgList(i64 %xor206, i64 %and223), !2053, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor224 = xor i64 %xor206, %and223, !dbg !2092
    #dbg_value(i64 %xor224, !2053, !DIExpression(), !1964)
  %xor52 = call i64 @llvm.fshl.i64(i64 %xor39, i64 %xor39, i64 1), !dbg !2093
    #dbg_value(!DIArgList(i64 %xor31, i64 %xor52), !2029, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Aki.0, i64 %xor31, i64 %xor52), !1990, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Agi.0, i64 %xor31, i64 %xor52), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %xor31, i64 %xor52), !1970, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Asi.0, i64 %xor31, i64 %xor52), !2010, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Ami.0, i64 %xor31, i64 %xor52), !2000, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor53 = xor i64 %xor31, %xor52, !dbg !2094
    #dbg_value(i64 %xor53, !2029, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 %Aki.0, i64 %xor53), !1990, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Agi.0, i64 %xor53), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %xor53), !1970, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Asi.0, i64 %xor53), !2010, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Ami.0, i64 %xor53), !2000, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor67 = xor i64 %Aki.0, %xor53, !dbg !2095
    #dbg_value(i64 %xor67, !1990, !DIExpression(), !1964)
  %xor70 = call i64 @llvm.fshl.i64(i64 %xor67, i64 %xor67, i64 43), !dbg !2096
    #dbg_value(i64 %xor70, !2024, !DIExpression(), !1964)
  %xor48 = call i64 @llvm.fshl.i64(i64 %xor35, i64 %xor35, i64 1), !dbg !2097
    #dbg_value(!DIArgList(i64 %xor27, i64 %xor48), !2028, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Age.0, i64 %xor27, i64 %xor48), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %xor27, i64 %xor48), !1968, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Ake.0, i64 %xor27, i64 %xor48), !1988, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Ame.0, i64 %xor27, i64 %xor48), !1998, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Ase.0, i64 %xor27, i64 %xor48), !2008, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor49 = xor i64 %xor27, %xor48, !dbg !2098
    #dbg_value(i64 %xor49, !2028, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 %Age.0, i64 %xor49), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %xor49), !1968, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Ake.0, i64 %xor49), !1988, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Ame.0, i64 %xor49), !1998, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %Ase.0, i64 %xor49), !2008, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor63 = xor i64 %Age.0, %xor49, !dbg !2099
    #dbg_value(i64 %xor63, !1978, !DIExpression(), !1964)
  %xor66 = call i64 @llvm.fshl.i64(i64 %xor63, i64 %xor63, i64 44), !dbg !2100
    #dbg_value(i64 %xor66, !2023, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor70, i64 %xor45, i64 %xor66), !2032, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %not = xor i64 %xor66, -1, !dbg !2101
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor70, i64 %xor45, i64 %not), !2032, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %and = and i64 %xor70, %not, !dbg !2102
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %and, i64 %xor45), !2032, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %arrayidx80 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %round.0, !dbg !2103
  %25 = load i64, ptr %arrayidx80, align 8, !dbg !2103
    #dbg_value(!DIArgList(i64 %and, i64 %Aba.0, i64 %xor45, i64 %25), !2032, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
  %26 = xor i64 %and, %25, !dbg !2104
    #dbg_value(!DIArgList(i64 %26, i64 %Aba.0, i64 %xor45), !2032, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor62 = xor i64 %Aba.0, %xor45, !dbg !2105
    #dbg_value(i64 %xor62, !1966, !DIExpression(), !1964)
    #dbg_value(i64 %xor62, !2022, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 %26, i64 %xor62), !2032, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor81 = xor i64 %26, %xor62, !dbg !2104
    #dbg_value(i64 %xor81, !2032, !DIExpression(), !1964)
  %xor94 = xor i64 %Abo.0, %xor57, !dbg !2106
    #dbg_value(i64 %xor94, !1972, !DIExpression(), !1964)
  %xor97 = call i64 @llvm.fshl.i64(i64 %xor94, i64 %xor94, i64 28), !dbg !2107
    #dbg_value(i64 %xor97, !2022, !DIExpression(), !1964)
  %xor102 = xor i64 %Aka.0, %xor45, !dbg !2108
    #dbg_value(i64 %xor102, !1986, !DIExpression(), !1964)
  %xor105 = call i64 @llvm.fshl.i64(i64 %xor102, i64 %xor102, i64 3), !dbg !2109
    #dbg_value(i64 %xor105, !2024, !DIExpression(), !1964)
  %xor98 = xor i64 %Agu.0, %xor61, !dbg !2110
    #dbg_value(i64 %xor98, !1984, !DIExpression(), !1964)
  %xor101 = call i64 @llvm.fshl.i64(i64 %xor98, i64 %xor98, i64 20), !dbg !2111
    #dbg_value(i64 %xor101, !2023, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 %xor97, i64 %xor105, i64 %xor101), !2037, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %not114 = xor i64 %xor101, -1, !dbg !2112
    #dbg_value(!DIArgList(i64 %xor97, i64 %xor105, i64 %not114), !2037, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %and115 = and i64 %xor105, %not114, !dbg !2113
    #dbg_value(!DIArgList(i64 %xor97, i64 %and115), !2037, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor116 = xor i64 %xor97, %and115, !dbg !2114
    #dbg_value(i64 %xor116, !2037, !DIExpression(), !1964)
  %xor234 = xor i64 %xor81, %xor116, !dbg !2115
  %xor129 = xor i64 %Abe.0, %xor49, !dbg !2116
    #dbg_value(i64 %xor129, !1968, !DIExpression(), !1964)
  %xor132 = call i64 @llvm.fshl.i64(i64 %xor129, i64 %xor129, i64 1), !dbg !2117
    #dbg_value(i64 %xor132, !2022, !DIExpression(), !1964)
  %xor137 = xor i64 %Ako.0, %xor57, !dbg !2118
    #dbg_value(i64 %xor137, !1992, !DIExpression(), !1964)
  %xor140 = call i64 @llvm.fshl.i64(i64 %xor137, i64 %xor137, i64 25), !dbg !2119
    #dbg_value(i64 %xor140, !2024, !DIExpression(), !1964)
  %xor133 = xor i64 %Agi.0, %xor53, !dbg !2120
    #dbg_value(i64 %xor133, !1980, !DIExpression(), !1964)
  %xor136 = call i64 @llvm.fshl.i64(i64 %xor133, i64 %xor133, i64 6), !dbg !2121
    #dbg_value(i64 %xor136, !2023, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 %xor132, i64 %xor140, i64 %xor136), !2042, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %not149 = xor i64 %xor136, -1, !dbg !2122
    #dbg_value(!DIArgList(i64 %xor132, i64 %xor140, i64 %not149), !2042, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %and150 = and i64 %xor140, %not149, !dbg !2123
    #dbg_value(!DIArgList(i64 %xor132, i64 %and150), !2042, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor151 = xor i64 %xor132, %and150, !dbg !2124
    #dbg_value(i64 %xor151, !2042, !DIExpression(), !1964)
  %xor235 = xor i64 %xor234, %xor151, !dbg !2125
  %xor164 = xor i64 %Abu.0, %xor61, !dbg !2126
    #dbg_value(i64 %xor164, !1974, !DIExpression(), !1964)
  %xor167 = call i64 @llvm.fshl.i64(i64 %xor164, i64 %xor164, i64 27), !dbg !2127
    #dbg_value(i64 %xor167, !2022, !DIExpression(), !1964)
  %xor172 = xor i64 %Ake.0, %xor49, !dbg !2128
    #dbg_value(i64 %xor172, !1988, !DIExpression(), !1964)
  %xor175 = call i64 @llvm.fshl.i64(i64 %xor172, i64 %xor172, i64 10), !dbg !2129
    #dbg_value(i64 %xor175, !2024, !DIExpression(), !1964)
  %xor168 = xor i64 %Aga.0, %xor45, !dbg !2130
    #dbg_value(i64 %xor168, !1976, !DIExpression(), !1964)
  %xor171 = call i64 @llvm.fshl.i64(i64 %xor168, i64 %xor168, i64 36), !dbg !2131
    #dbg_value(i64 %xor171, !2023, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 %xor167, i64 %xor175, i64 %xor171), !2047, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %not184 = xor i64 %xor171, -1, !dbg !2132
    #dbg_value(!DIArgList(i64 %xor167, i64 %xor175, i64 %not184), !2047, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %and185 = and i64 %xor175, %not184, !dbg !2133
    #dbg_value(!DIArgList(i64 %xor167, i64 %and185), !2047, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor186 = xor i64 %xor167, %and185, !dbg !2134
    #dbg_value(i64 %xor186, !2047, !DIExpression(), !1964)
  %xor236 = xor i64 %xor235, %xor186, !dbg !2135
  %xor199 = xor i64 %Abi.0, %xor53, !dbg !2136
    #dbg_value(i64 %xor199, !1970, !DIExpression(), !1964)
  %xor202 = call i64 @llvm.fshl.i64(i64 %xor199, i64 %xor199, i64 62), !dbg !2137
    #dbg_value(!DIArgList(i64 %xor202, i64 %xor210, i64 %xor206), !2052, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %xor210, i64 %xor206), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
  %not219 = xor i64 %xor206, -1, !dbg !2138
    #dbg_value(!DIArgList(i64 %xor202, i64 %xor210, i64 %not219), !2052, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %xor210, i64 %not219), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
  %and220 = and i64 %xor210, %not219, !dbg !2139
    #dbg_value(!DIArgList(i64 %xor202, i64 %and220), !2052, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor202, i64 %and220), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor221 = xor i64 %xor202, %and220, !dbg !2140
    #dbg_value(i64 %xor221, !2052, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor221), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor237 = xor i64 %xor236, %xor221, !dbg !2141
    #dbg_value(i64 %xor237, !2022, !DIExpression(), !1964)
  %xor75 = xor i64 %Asu.0, %xor61, !dbg !2142
    #dbg_value(i64 %xor75, !2014, !DIExpression(), !1964)
  %xor78 = call i64 @llvm.fshl.i64(i64 %xor75, i64 %xor75, i64 14), !dbg !2143
    #dbg_value(i64 %xor78, !2026, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor66, i64 %xor62), !2036, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor71 = xor i64 %Amo.0, %xor57, !dbg !2144
    #dbg_value(i64 %xor71, !2002, !DIExpression(), !1964)
  %xor74 = call i64 @llvm.fshl.i64(i64 %xor71, i64 %xor71, i64 21), !dbg !2145
    #dbg_value(i64 %xor74, !2025, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 %xor70, i64 %xor78, i64 %xor74), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor74, i64 %xor70), !2033, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor62, i64 %xor78), !2035, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %not85 = xor i64 %xor74, -1, !dbg !2146
    #dbg_value(!DIArgList(i64 %xor70, i64 %xor78, i64 %not85), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %and86 = and i64 %xor78, %not85, !dbg !2147
    #dbg_value(!DIArgList(i64 %xor70, i64 %and86), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor87 = xor i64 %xor70, %and86, !dbg !2148
    #dbg_value(i64 %xor87, !2034, !DIExpression(), !1964)
  %xor110 = xor i64 %Asi.0, %xor53, !dbg !2149
    #dbg_value(i64 %xor110, !2010, !DIExpression(), !1964)
  %xor113 = call i64 @llvm.fshl.i64(i64 %xor110, i64 %xor110, i64 61), !dbg !2150
    #dbg_value(i64 %xor113, !2026, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 %xor113, i64 %xor101, i64 %xor97), !2041, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor106 = xor i64 %Ame.0, %xor49, !dbg !2151
    #dbg_value(i64 %xor106, !1998, !DIExpression(), !1964)
  %xor109 = call i64 @llvm.fshl.i64(i64 %xor106, i64 %xor106, i64 45), !dbg !2152
    #dbg_value(i64 %xor109, !2025, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 %xor105, i64 %xor113, i64 %xor109), !2039, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor109, i64 %xor97, i64 %xor113), !2040, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor109, i64 %xor105), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %not120 = xor i64 %xor109, -1, !dbg !2153
    #dbg_value(!DIArgList(i64 %xor105, i64 %xor113, i64 %not120), !2039, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %and121 = and i64 %xor113, %not120, !dbg !2154
    #dbg_value(!DIArgList(i64 %xor105, i64 %and121), !2039, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor122 = xor i64 %xor105, %and121, !dbg !2155
    #dbg_value(i64 %xor122, !2039, !DIExpression(), !1964)
  %xor242 = xor i64 %xor87, %xor122, !dbg !2156
  %xor145 = xor i64 %Asa.0, %xor45, !dbg !2157
    #dbg_value(i64 %xor145, !2006, !DIExpression(), !1964)
  %xor148 = call i64 @llvm.fshl.i64(i64 %xor145, i64 %xor145, i64 18), !dbg !2158
    #dbg_value(i64 %xor148, !2026, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 %xor148, i64 %xor136, i64 %xor132), !2046, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor141 = xor i64 %Amu.0, %xor61, !dbg !2159
    #dbg_value(i64 %xor141, !2004, !DIExpression(), !1964)
  %xor144 = call i64 @llvm.fshl.i64(i64 %xor141, i64 %xor141, i64 8), !dbg !2160
    #dbg_value(i64 %xor144, !2025, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 %xor140, i64 %xor148, i64 %xor144), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor144, i64 %xor140), !2043, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor132, i64 %xor148), !2045, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %not155 = xor i64 %xor144, -1, !dbg !2161
    #dbg_value(!DIArgList(i64 %xor140, i64 %xor148, i64 %not155), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %and156 = and i64 %xor148, %not155, !dbg !2162
    #dbg_value(!DIArgList(i64 %xor140, i64 %and156), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor157 = xor i64 %xor140, %and156, !dbg !2163
    #dbg_value(i64 %xor157, !2044, !DIExpression(), !1964)
  %xor243 = xor i64 %xor242, %xor157, !dbg !2164
  %xor180 = xor i64 %Aso.0, %xor57, !dbg !2165
    #dbg_value(i64 %xor180, !2012, !DIExpression(), !1964)
  %xor183 = call i64 @llvm.fshl.i64(i64 %xor180, i64 %xor180, i64 56), !dbg !2166
    #dbg_value(i64 %xor183, !2026, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 %xor183, i64 %xor171, i64 %xor167), !2051, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor176 = xor i64 %Ami.0, %xor53, !dbg !2167
    #dbg_value(i64 %xor176, !2000, !DIExpression(), !1964)
  %xor179 = call i64 @llvm.fshl.i64(i64 %xor176, i64 %xor176, i64 15), !dbg !2168
    #dbg_value(i64 %xor179, !2025, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 %xor175, i64 %xor183, i64 %xor179), !2049, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor179, i64 %xor175), !2048, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor167, i64 %xor183), !2050, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %xor74, i64 %xor70), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %not190 = xor i64 %xor179, -1, !dbg !2169
    #dbg_value(!DIArgList(i64 %xor175, i64 %xor183, i64 %not190), !2049, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %and191 = and i64 %xor183, %not190, !dbg !2170
    #dbg_value(!DIArgList(i64 %xor175, i64 %and191), !2049, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor192 = xor i64 %xor175, %and191, !dbg !2171
    #dbg_value(i64 %xor192, !2049, !DIExpression(), !1964)
  %xor244 = xor i64 %xor243, %xor192, !dbg !2172
  %xor215 = xor i64 %Ase.0, %xor49, !dbg !2173
    #dbg_value(i64 %xor215, !2008, !DIExpression(), !1964)
  %xor218 = call i64 @llvm.fshl.i64(i64 %xor215, i64 %xor215, i64 2), !dbg !2174
    #dbg_value(!DIArgList(i64 %xor210, i64 %xor218, i64 %xor214), !2054, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor218, i64 %xor206, i64 %xor202), !2056, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor202, i64 %xor218), !2055, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %xor218, i64 %xor214), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %xor97, i64 %xor113), !2025, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %xor66, i64 %xor62), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
  %not225 = xor i64 %xor214, -1, !dbg !2175
    #dbg_value(!DIArgList(i64 %xor210, i64 %xor218, i64 %not225), !2054, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %xor218, i64 %not225), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
  %and226 = and i64 %xor218, %not225, !dbg !2176
    #dbg_value(!DIArgList(i64 %xor210, i64 %and226), !2054, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor210, i64 %and226), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor227 = xor i64 %xor210, %and226, !dbg !2177
    #dbg_value(i64 %xor227, !2054, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor227), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor245 = xor i64 %xor244, %xor227, !dbg !2178
    #dbg_value(i64 %xor245, !2024, !DIExpression(), !1964)
  %xor260 = call i64 @llvm.fshl.i64(i64 %xor245, i64 %xor245, i64 1), !dbg !2179
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor237, i64 %xor260), !2053, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor237, i64 %xor74, i64 %xor70, i64 %xor260), !2033, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor237, i64 %xor109, i64 %xor105, i64 %xor260), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor237, i64 %xor144, i64 %xor140, i64 %xor260), !2043, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor237, i64 %xor179, i64 %xor175, i64 %xor260), !2048, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor237, i64 %xor260), !2028, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor261 = xor i64 %xor237, %xor260, !dbg !2180
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor261), !2053, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %xor74, i64 %xor70), !2033, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %xor109, i64 %xor105), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %xor144, i64 %xor140), !2043, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %xor179, i64 %xor175), !2048, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 %xor261, !2028, !DIExpression(), !1964)
  %xor429 = xor i64 %xor224, %xor261, !dbg !2181
    #dbg_value(i64 %xor429, !2053, !DIExpression(), !1964)
  %xor432 = call i64 @llvm.fshl.i64(i64 %xor429, i64 %xor429, i64 2), !dbg !2182
    #dbg_value(i64 %xor432, !2026, !DIExpression(), !1964)
  %not123 = xor i64 %xor113, -1, !dbg !2183
    #dbg_value(!DIArgList(i64 %xor109, i64 %xor97, i64 %not123), !2040, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %xor97, i64 %not123), !2025, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
  %and124 = and i64 %xor97, %not123, !dbg !2184
    #dbg_value(!DIArgList(i64 %xor109, i64 %and124), !2040, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor109, i64 %xor62, i64 %xor78, i64 %and124), !2025, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor125 = xor i64 %xor109, %and124, !dbg !2185
    #dbg_value(i64 %xor125, !2040, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %xor62, i64 %xor78), !2025, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
  %not91 = xor i64 %xor62, -1, !dbg !2186
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor66, i64 %not91), !2036, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %xor66, i64 %not91), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
  %and92 = and i64 %xor66, %not91, !dbg !2187
    #dbg_value(!DIArgList(i64 %xor78, i64 %and92), !2036, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor78, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97, i64 %and92), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor93 = xor i64 %xor78, %and92, !dbg !2188
    #dbg_value(i64 %xor93, !2036, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %xor97), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
  %not126 = xor i64 %xor97, -1, !dbg !2189
    #dbg_value(!DIArgList(i64 %xor113, i64 %xor101, i64 %not126), !2041, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %xor101, i64 %not126), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
  %and127 = and i64 %xor101, %not126, !dbg !2190
    #dbg_value(!DIArgList(i64 %xor113, i64 %and127), !2041, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor113, i64 %and127), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor128 = xor i64 %xor113, %and127, !dbg !2191
    #dbg_value(i64 %xor128, !2041, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132, i64 %xor128), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor250 = xor i64 %xor93, %xor128, !dbg !2192
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %xor132), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
  %not161 = xor i64 %xor132, -1, !dbg !2193
    #dbg_value(!DIArgList(i64 %xor148, i64 %xor136, i64 %not161), !2046, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %xor136, i64 %not161), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
  %and162 = and i64 %xor136, %not161, !dbg !2194
    #dbg_value(!DIArgList(i64 %xor148, i64 %and162), !2046, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor148, i64 %and162), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor163 = xor i64 %xor148, %and162, !dbg !2195
    #dbg_value(i64 %xor163, !2046, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 %xor250, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167, i64 %xor163), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor251 = xor i64 %xor250, %xor163, !dbg !2196
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %xor167), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
  %not196 = xor i64 %xor167, -1, !dbg !2197
    #dbg_value(!DIArgList(i64 %xor183, i64 %xor171, i64 %not196), !2051, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %xor171, i64 %not196), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
  %and197 = and i64 %xor171, %not196, !dbg !2198
    #dbg_value(!DIArgList(i64 %xor183, i64 %and197), !2051, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor183, i64 %and197), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor198 = xor i64 %xor183, %and197, !dbg !2199
    #dbg_value(i64 %xor198, !2051, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 %xor251, i64 %xor218, i64 %xor206, i64 %xor202, i64 %xor198), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor252 = xor i64 %xor251, %xor198, !dbg !2200
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %xor206, i64 %xor202), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
  %not231 = xor i64 %xor202, -1, !dbg !2201
    #dbg_value(!DIArgList(i64 %xor218, i64 %xor206, i64 %not231), !2056, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %xor206, i64 %not231), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
  %and232 = and i64 %xor206, %not231, !dbg !2202
    #dbg_value(!DIArgList(i64 %xor218, i64 %and232), !2056, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor218, i64 %and232), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor233 = xor i64 %xor218, %and232, !dbg !2203
    #dbg_value(i64 %xor233, !2056, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor233), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor253 = xor i64 %xor252, %xor233, !dbg !2204
    #dbg_value(i64 %xor253, !2026, !DIExpression(), !1964)
  %xor268 = call i64 @llvm.fshl.i64(i64 %xor253, i64 %xor253, i64 1), !dbg !2205
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor245, i64 %xor268), !2040, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor245, i64 %xor62, i64 %xor78, i64 %xor268), !2035, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor245, i64 %xor132, i64 %xor148, i64 %xor268), !2045, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor245, i64 %xor167, i64 %xor183, i64 %xor268), !2050, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor245, i64 %xor202, i64 %xor218, i64 %xor268), !2055, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor245, i64 %xor268), !2030, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor269 = xor i64 %xor245, %xor268, !dbg !2206
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor269), !2040, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %xor62, i64 %xor78), !2035, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %xor132, i64 %xor148), !2045, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %xor167, i64 %xor183), !2050, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %xor202, i64 %xor218), !2055, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 %xor269, !2030, !DIExpression(), !1964)
  %xor417 = xor i64 %xor125, %xor269, !dbg !2207
    #dbg_value(i64 %xor417, !2040, !DIExpression(), !1964)
  %xor420 = call i64 @llvm.fshl.i64(i64 %xor417, i64 %xor417, i64 55), !dbg !2208
    #dbg_value(i64 %xor420, !2023, !DIExpression(), !1964)
  %not82 = xor i64 %xor70, -1, !dbg !2209
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %xor74, i64 %not82), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %xor74, i64 %not82), !2033, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %and83 = and i64 %xor74, %not82, !dbg !2210
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105, i64 %and83), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor66, i64 %xor261, i64 %and83), !2033, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor84 = xor i64 %xor66, %and83, !dbg !2211
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %xor105), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor261), !2033, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %not117 = xor i64 %xor105, -1, !dbg !2212
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %xor109, i64 %not117), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %xor109, i64 %not117), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %and118 = and i64 %xor109, %not117, !dbg !2213
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor101, i64 %and118), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor101, i64 %xor261, i64 %and118), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor119 = xor i64 %xor101, %and118, !dbg !2214
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140, i64 %xor119), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor119, i64 %xor261), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor238 = xor i64 %xor84, %xor119, !dbg !2215
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %xor140), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %not152 = xor i64 %xor140, -1, !dbg !2216
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %xor144, i64 %not152), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %xor144, i64 %not152), !2043, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %and153 = and i64 %xor144, %not152, !dbg !2217
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor136, i64 %and153), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor136, i64 %xor261, i64 %and153), !2043, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor154 = xor i64 %xor136, %and153, !dbg !2218
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175, i64 %xor154), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor154, i64 %xor261), !2043, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor239 = xor i64 %xor238, %xor154, !dbg !2219
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %xor179, i64 %xor175), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %not187 = xor i64 %xor175, -1, !dbg !2220
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %xor179, i64 %not187), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %xor179, i64 %not187), !2048, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %and188 = and i64 %xor179, %not187, !dbg !2221
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor171, i64 %and188), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor171, i64 %xor261, i64 %and188), !2048, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor189 = xor i64 %xor171, %and188, !dbg !2222
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor189), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor189, i64 %xor261), !2048, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor240 = xor i64 %xor239, %xor189, !dbg !2223
    #dbg_value(!DIArgList(i64 %xor240, i64 %xor224), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor241 = xor i64 %xor240, %xor224, !dbg !2224
    #dbg_value(i64 %xor241, !2023, !DIExpression(), !1964)
  %not88 = xor i64 %xor78, -1, !dbg !2225
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %xor62, i64 %not88), !2025, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %xor62, i64 %not88), !2035, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %and89 = and i64 %xor62, %not88, !dbg !2226
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125, i64 %and89), !2025, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor74, i64 %xor269, i64 %and89), !2035, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor90 = xor i64 %xor74, %and89, !dbg !2227
    #dbg_value(!DIArgList(i64 %xor90, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148, i64 %xor125), !2025, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor90, i64 %xor269), !2035, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor246 = xor i64 %xor90, %xor125, !dbg !2228
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %xor148), !2025, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
  %not158 = xor i64 %xor148, -1, !dbg !2229
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %xor132, i64 %not158), !2025, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %xor132, i64 %not158), !2045, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %and159 = and i64 %xor132, %not158, !dbg !2230
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor144, i64 %and159), !2025, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor144, i64 %xor269, i64 %and159), !2045, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor160 = xor i64 %xor144, %and159, !dbg !2231
    #dbg_value(!DIArgList(i64 %xor246, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183, i64 %xor160), !2025, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor160, i64 %xor269), !2045, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor247 = xor i64 %xor246, %xor160, !dbg !2232
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %xor183), !2025, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
  %not193 = xor i64 %xor183, -1, !dbg !2233
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %xor167, i64 %not193), !2025, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %xor167, i64 %not193), !2050, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %and194 = and i64 %xor167, %not193, !dbg !2234
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor179, i64 %and194), !2025, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor179, i64 %xor269, i64 %and194), !2050, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor195 = xor i64 %xor179, %and194, !dbg !2235
    #dbg_value(!DIArgList(i64 %xor247, i64 %xor214, i64 %xor202, i64 %xor218, i64 %xor195), !2025, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor195, i64 %xor269), !2050, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor248 = xor i64 %xor247, %xor195, !dbg !2236
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %xor202, i64 %xor218), !2025, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
  %not228 = xor i64 %xor218, -1, !dbg !2237
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %xor202, i64 %not228), !2025, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %xor202, i64 %not228), !2055, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %and229 = and i64 %xor202, %not228, !dbg !2238
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor214, i64 %and229), !2025, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor214, i64 %xor269, i64 %and229), !2055, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor230 = xor i64 %xor214, %and229, !dbg !2239
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor230), !2025, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor230, i64 %xor269), !2055, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor249 = xor i64 %xor248, %xor230, !dbg !2240
    #dbg_value(i64 %xor249, !2025, !DIExpression(), !1964)
  %xor264 = call i64 @llvm.fshl.i64(i64 %xor249, i64 %xor249, i64 1), !dbg !2241
    #dbg_value(!DIArgList(i64 %xor241, i64 %xor264), !2029, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor241, i64 %xor264), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor241, i64 %xor264), !2049, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor241, i64 %xor264), !2039, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor241, i64 %xor264), !2054, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor241, i64 %xor264), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor265 = xor i64 %xor241, %xor264, !dbg !2242
    #dbg_value(i64 %xor265, !2029, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor265), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor265), !2049, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor265), !2039, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor265), !2054, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor265), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor413 = xor i64 %xor87, %xor265, !dbg !2243
    #dbg_value(i64 %xor413, !2034, !DIExpression(), !1964)
  %xor416 = call i64 @llvm.fshl.i64(i64 %xor413, i64 %xor413, i64 62), !dbg !2244
    #dbg_value(i64 %xor416, !2022, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 %xor432, i64 %xor420, i64 %xor416), !2014, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %not445 = xor i64 %xor416, -1, !dbg !2245
    #dbg_value(!DIArgList(i64 %xor432, i64 %xor420, i64 %not445), !2014, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %and446 = and i64 %xor420, %not445, !dbg !2246
    #dbg_value(!DIArgList(i64 %xor432, i64 %and446), !2014, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor447 = xor i64 %xor432, %and446, !dbg !2247
    #dbg_value(i64 %xor447, !2014, !DIExpression(), !1964)
  %xor256 = call i64 @llvm.fshl.i64(i64 %xor241, i64 %xor241, i64 1), !dbg !2248
    #dbg_value(!DIArgList(i64 %xor253, i64 %xor256), !2027, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor253, i64 %xor256), !2037, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor253, i64 %xor256), !2052, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor253, i64 %xor256), !2042, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %xor256), !2032, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %xor256), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor253, i64 %xor256), !2047, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor257 = xor i64 %xor253, %xor256, !dbg !2249
    #dbg_value(i64 %xor257, !2027, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor257), !2037, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor257), !2052, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor257), !2042, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !2032, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor257), !2047, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor425 = xor i64 %xor186, %xor257, !dbg !2250
    #dbg_value(i64 %xor425, !2047, !DIExpression(), !1964)
  %xor428 = call i64 @llvm.fshl.i64(i64 %xor425, i64 %xor425, i64 41), !dbg !2251
    #dbg_value(i64 %xor428, !2025, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 %xor428, i64 %xor416, i64 %xor432), !2012, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %not442 = xor i64 %xor432, -1, !dbg !2252
    #dbg_value(!DIArgList(i64 %xor428, i64 %xor416, i64 %not442), !2012, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %and443 = and i64 %xor416, %not442, !dbg !2253
    #dbg_value(!DIArgList(i64 %xor428, i64 %and443), !2012, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor444 = xor i64 %xor428, %and443, !dbg !2254
    #dbg_value(i64 %xor444, !2012, !DIExpression(), !1964)
  %xor272 = call i64 @llvm.fshl.i64(i64 %xor237, i64 %xor237, i64 1), !dbg !2255
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor249, i64 %xor272), !2036, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor249, i64 %xor272), !2051, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor249, i64 %xor272), !2041, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor249, i64 %xor272), !2056, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor249, i64 %xor272), !2031, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor249, i64 %xor272), !2046, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor273 = xor i64 %xor249, %xor272, !dbg !2256
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor273), !2036, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor273), !2051, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor273), !2041, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor273), !2056, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(i64 %xor273, !2031, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor273), !2046, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor421 = xor i64 %xor163, %xor273, !dbg !2257
    #dbg_value(i64 %xor421, !2046, !DIExpression(), !1964)
  %xor424 = call i64 @llvm.fshl.i64(i64 %xor421, i64 %xor421, i64 39), !dbg !2258
    #dbg_value(i64 %xor424, !2024, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 %xor424, i64 %xor432, i64 %xor428), !2010, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor420, i64 %xor428, i64 %xor424), !2008, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor416, i64 %xor424, i64 %xor420), !2006, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %not439 = xor i64 %xor428, -1, !dbg !2259
    #dbg_value(!DIArgList(i64 %xor424, i64 %xor432, i64 %not439), !2010, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %and440 = and i64 %xor432, %not439, !dbg !2260
    #dbg_value(!DIArgList(i64 %xor424, i64 %and440), !2010, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor441 = xor i64 %xor424, %and440, !dbg !2261
    #dbg_value(i64 %xor441, !2010, !DIExpression(), !1964)
  %not436 = xor i64 %xor424, -1, !dbg !2262
    #dbg_value(!DIArgList(i64 %xor420, i64 %xor428, i64 %not436), !2008, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %and437 = and i64 %xor428, %not436, !dbg !2263
    #dbg_value(!DIArgList(i64 %xor420, i64 %and437), !2008, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor438 = xor i64 %xor420, %and437, !dbg !2264
    #dbg_value(i64 %xor438, !2008, !DIExpression(), !1964)
  %not433 = xor i64 %xor420, -1, !dbg !2265
    #dbg_value(!DIArgList(i64 %xor416, i64 %xor424, i64 %not433), !2006, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %and434 = and i64 %xor424, %not433, !dbg !2266
    #dbg_value(!DIArgList(i64 %xor416, i64 %and434), !2006, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor435 = xor i64 %xor416, %and434, !dbg !2267
    #dbg_value(i64 %xor435, !2006, !DIExpression(), !1964)
  %xor394 = xor i64 %xor230, %xor269, !dbg !2268
    #dbg_value(i64 %xor394, !2055, !DIExpression(), !1964)
  %xor397 = call i64 @llvm.fshl.i64(i64 %xor394, i64 %xor394, i64 56), !dbg !2269
    #dbg_value(i64 %xor397, !2026, !DIExpression(), !1964)
  %xor382 = xor i64 %xor116, %xor257, !dbg !2270
    #dbg_value(i64 %xor382, !2037, !DIExpression(), !1964)
  %xor385 = call i64 @llvm.fshl.i64(i64 %xor382, i64 %xor382, i64 36), !dbg !2271
    #dbg_value(i64 %xor385, !2023, !DIExpression(), !1964)
  %xor378 = xor i64 %xor93, %xor273, !dbg !2272
    #dbg_value(i64 %xor378, !2036, !DIExpression(), !1964)
  %xor381 = call i64 @llvm.fshl.i64(i64 %xor378, i64 %xor378, i64 27), !dbg !2273
    #dbg_value(i64 %xor381, !2022, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 %xor397, i64 %xor385, i64 %xor381), !2004, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %not410 = xor i64 %xor381, -1, !dbg !2274
    #dbg_value(!DIArgList(i64 %xor397, i64 %xor385, i64 %not410), !2004, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %and411 = and i64 %xor385, %not410, !dbg !2275
    #dbg_value(!DIArgList(i64 %xor397, i64 %and411), !2004, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor412 = xor i64 %xor397, %and411, !dbg !2276
    #dbg_value(i64 %xor412, !2004, !DIExpression(), !1964)
  %xor390 = xor i64 %xor192, %xor265, !dbg !2277
    #dbg_value(i64 %xor390, !2049, !DIExpression(), !1964)
  %xor393 = call i64 @llvm.fshl.i64(i64 %xor390, i64 %xor390, i64 15), !dbg !2278
    #dbg_value(i64 %xor393, !2025, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 %xor393, i64 %xor381, i64 %xor397), !2002, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %not407 = xor i64 %xor397, -1, !dbg !2279
    #dbg_value(!DIArgList(i64 %xor393, i64 %xor381, i64 %not407), !2002, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %and408 = and i64 %xor381, %not407, !dbg !2280
    #dbg_value(!DIArgList(i64 %xor393, i64 %and408), !2002, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor409 = xor i64 %xor393, %and408, !dbg !2281
    #dbg_value(i64 %xor409, !2002, !DIExpression(), !1964)
  %xor386 = xor i64 %xor154, %xor261, !dbg !2282
    #dbg_value(i64 %xor386, !2043, !DIExpression(), !1964)
  %xor389 = call i64 @llvm.fshl.i64(i64 %xor386, i64 %xor386, i64 10), !dbg !2283
    #dbg_value(i64 %xor389, !2024, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 %xor389, i64 %xor397, i64 %xor393), !2000, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor385, i64 %xor393, i64 %xor389), !1998, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor381, i64 %xor389, i64 %xor385), !1996, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %not404 = xor i64 %xor393, -1, !dbg !2284
    #dbg_value(!DIArgList(i64 %xor389, i64 %xor397, i64 %not404), !2000, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %and405 = and i64 %xor397, %not404, !dbg !2285
    #dbg_value(!DIArgList(i64 %xor389, i64 %and405), !2000, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor406 = xor i64 %xor389, %and405, !dbg !2286
    #dbg_value(i64 %xor406, !2000, !DIExpression(), !1964)
  %not401 = xor i64 %xor389, -1, !dbg !2287
    #dbg_value(!DIArgList(i64 %xor385, i64 %xor393, i64 %not401), !1998, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %and402 = and i64 %xor393, %not401, !dbg !2288
    #dbg_value(!DIArgList(i64 %xor385, i64 %and402), !1998, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor403 = xor i64 %xor385, %and402, !dbg !2289
    #dbg_value(i64 %xor403, !1998, !DIExpression(), !1964)
  %not398 = xor i64 %xor385, -1, !dbg !2290
    #dbg_value(!DIArgList(i64 %xor381, i64 %xor389, i64 %not398), !1996, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %and399 = and i64 %xor389, %not398, !dbg !2291
    #dbg_value(!DIArgList(i64 %xor381, i64 %and399), !1996, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor400 = xor i64 %xor381, %and399, !dbg !2292
    #dbg_value(i64 %xor400, !1996, !DIExpression(), !1964)
  %xor359 = xor i64 %xor221, %xor257, !dbg !2293
    #dbg_value(i64 %xor359, !2052, !DIExpression(), !1964)
  %xor362 = call i64 @llvm.fshl.i64(i64 %xor359, i64 %xor359, i64 18), !dbg !2294
    #dbg_value(i64 %xor362, !2026, !DIExpression(), !1964)
  %xor347 = xor i64 %xor122, %xor265, !dbg !2295
    #dbg_value(i64 %xor347, !2039, !DIExpression(), !1964)
  %xor350 = call i64 @llvm.fshl.i64(i64 %xor347, i64 %xor347, i64 6), !dbg !2296
    #dbg_value(i64 %xor350, !2023, !DIExpression(), !1964)
  %xor343 = xor i64 %xor84, %xor261, !dbg !2297
    #dbg_value(i64 %xor343, !2033, !DIExpression(), !1964)
  %xor346 = call i64 @llvm.fshl.i64(i64 %xor343, i64 %xor343, i64 1), !dbg !2298
    #dbg_value(i64 %xor346, !2022, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 %xor362, i64 %xor350, i64 %xor346), !1994, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %not375 = xor i64 %xor346, -1, !dbg !2299
    #dbg_value(!DIArgList(i64 %xor362, i64 %xor350, i64 %not375), !1994, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %and376 = and i64 %xor350, %not375, !dbg !2300
    #dbg_value(!DIArgList(i64 %xor362, i64 %and376), !1994, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor377 = xor i64 %xor362, %and376, !dbg !2301
    #dbg_value(i64 %xor377, !1994, !DIExpression(), !1964)
  %xor355 = xor i64 %xor198, %xor273, !dbg !2302
    #dbg_value(i64 %xor355, !2051, !DIExpression(), !1964)
  %xor358 = call i64 @llvm.fshl.i64(i64 %xor355, i64 %xor355, i64 8), !dbg !2303
    #dbg_value(i64 %xor358, !2025, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 %xor358, i64 %xor346, i64 %xor362), !1992, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %not372 = xor i64 %xor362, -1, !dbg !2304
    #dbg_value(!DIArgList(i64 %xor358, i64 %xor346, i64 %not372), !1992, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %and373 = and i64 %xor346, %not372, !dbg !2305
    #dbg_value(!DIArgList(i64 %xor358, i64 %and373), !1992, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor374 = xor i64 %xor358, %and373, !dbg !2306
    #dbg_value(i64 %xor374, !1992, !DIExpression(), !1964)
  %xor351 = xor i64 %xor160, %xor269, !dbg !2307
    #dbg_value(i64 %xor351, !2045, !DIExpression(), !1964)
  %xor354 = call i64 @llvm.fshl.i64(i64 %xor351, i64 %xor351, i64 25), !dbg !2308
    #dbg_value(i64 %xor354, !2024, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 %xor354, i64 %xor362, i64 %xor358), !1990, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor350, i64 %xor358, i64 %xor354), !1988, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor346, i64 %xor354, i64 %xor350), !1986, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %not369 = xor i64 %xor358, -1, !dbg !2309
    #dbg_value(!DIArgList(i64 %xor354, i64 %xor362, i64 %not369), !1990, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %and370 = and i64 %xor362, %not369, !dbg !2310
    #dbg_value(!DIArgList(i64 %xor354, i64 %and370), !1990, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor371 = xor i64 %xor354, %and370, !dbg !2311
    #dbg_value(i64 %xor371, !1990, !DIExpression(), !1964)
  %not366 = xor i64 %xor354, -1, !dbg !2312
    #dbg_value(!DIArgList(i64 %xor350, i64 %xor358, i64 %not366), !1988, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %and367 = and i64 %xor358, %not366, !dbg !2313
    #dbg_value(!DIArgList(i64 %xor350, i64 %and367), !1988, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor368 = xor i64 %xor350, %and367, !dbg !2314
    #dbg_value(i64 %xor368, !1988, !DIExpression(), !1964)
  %not363 = xor i64 %xor350, -1, !dbg !2315
    #dbg_value(!DIArgList(i64 %xor346, i64 %xor354, i64 %not363), !1986, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %and364 = and i64 %xor354, %not363, !dbg !2316
    #dbg_value(!DIArgList(i64 %xor346, i64 %and364), !1986, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor365 = xor i64 %xor346, %and364, !dbg !2317
    #dbg_value(i64 %xor365, !1986, !DIExpression(), !1964)
  %xor324 = xor i64 %xor227, %xor265, !dbg !2318
    #dbg_value(i64 %xor324, !2054, !DIExpression(), !1964)
  %xor327 = call i64 @llvm.fshl.i64(i64 %xor324, i64 %xor324, i64 61), !dbg !2319
    #dbg_value(i64 %xor327, !2026, !DIExpression(), !1964)
  %xor312 = xor i64 %xor128, %xor273, !dbg !2320
    #dbg_value(i64 %xor312, !2041, !DIExpression(), !1964)
  %xor315 = call i64 @llvm.fshl.i64(i64 %xor312, i64 %xor312, i64 20), !dbg !2321
    #dbg_value(i64 %xor315, !2023, !DIExpression(), !1964)
  %xor308 = xor i64 %xor90, %xor269, !dbg !2322
    #dbg_value(i64 %xor308, !2035, !DIExpression(), !1964)
  %xor311 = call i64 @llvm.fshl.i64(i64 %xor308, i64 %xor308, i64 28), !dbg !2323
    #dbg_value(i64 %xor311, !2022, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 %xor327, i64 %xor315, i64 %xor311), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %not340 = xor i64 %xor311, -1, !dbg !2324
    #dbg_value(!DIArgList(i64 %xor327, i64 %xor315, i64 %not340), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %and341 = and i64 %xor315, %not340, !dbg !2325
    #dbg_value(!DIArgList(i64 %xor327, i64 %and341), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor342 = xor i64 %xor327, %and341, !dbg !2326
    #dbg_value(i64 %xor342, !1984, !DIExpression(), !1964)
  %xor320 = xor i64 %xor189, %xor261, !dbg !2327
    #dbg_value(i64 %xor320, !2048, !DIExpression(), !1964)
  %xor323 = call i64 @llvm.fshl.i64(i64 %xor320, i64 %xor320, i64 45), !dbg !2328
    #dbg_value(i64 %xor323, !2025, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 %xor323, i64 %xor311, i64 %xor327), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %not337 = xor i64 %xor327, -1, !dbg !2329
    #dbg_value(!DIArgList(i64 %xor323, i64 %xor311, i64 %not337), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %and338 = and i64 %xor311, %not337, !dbg !2330
    #dbg_value(!DIArgList(i64 %xor323, i64 %and338), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor339 = xor i64 %xor323, %and338, !dbg !2331
    #dbg_value(i64 %xor339, !1982, !DIExpression(), !1964)
  %xor316 = xor i64 %xor151, %xor257, !dbg !2332
    #dbg_value(i64 %xor316, !2042, !DIExpression(), !1964)
  %xor319 = call i64 @llvm.fshl.i64(i64 %xor316, i64 %xor316, i64 3), !dbg !2333
    #dbg_value(i64 %xor319, !2024, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 %xor319, i64 %xor327, i64 %xor323), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor315, i64 %xor323, i64 %xor319), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor311, i64 %xor319, i64 %xor315), !1976, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %not334 = xor i64 %xor323, -1, !dbg !2334
    #dbg_value(!DIArgList(i64 %xor319, i64 %xor327, i64 %not334), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %and335 = and i64 %xor327, %not334, !dbg !2335
    #dbg_value(!DIArgList(i64 %xor319, i64 %and335), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor336 = xor i64 %xor319, %and335, !dbg !2336
    #dbg_value(i64 %xor336, !1980, !DIExpression(), !1964)
  %not331 = xor i64 %xor319, -1, !dbg !2337
    #dbg_value(!DIArgList(i64 %xor315, i64 %xor323, i64 %not331), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %and332 = and i64 %xor323, %not331, !dbg !2338
    #dbg_value(!DIArgList(i64 %xor315, i64 %and332), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor333 = xor i64 %xor315, %and332, !dbg !2339
    #dbg_value(i64 %xor333, !1978, !DIExpression(), !1964)
  %not328 = xor i64 %xor315, -1, !dbg !2340
    #dbg_value(!DIArgList(i64 %xor311, i64 %xor319, i64 %not328), !1976, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %and329 = and i64 %xor319, %not328, !dbg !2341
    #dbg_value(!DIArgList(i64 %xor311, i64 %and329), !1976, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor330 = xor i64 %xor311, %and329, !dbg !2342
    #dbg_value(i64 %xor330, !1976, !DIExpression(), !1964)
  %xor287 = xor i64 %xor233, %xor273, !dbg !2343
    #dbg_value(i64 %xor287, !2056, !DIExpression(), !1964)
  %xor290 = call i64 @llvm.fshl.i64(i64 %xor287, i64 %xor287, i64 14), !dbg !2344
    #dbg_value(i64 %xor290, !2026, !DIExpression(), !1964)
  %xor275 = xor i64 %xor119, %xor261, !dbg !2345
    #dbg_value(i64 %xor275, !2038, !DIExpression(), !1964)
  %xor278 = call i64 @llvm.fshl.i64(i64 %xor275, i64 %xor275, i64 44), !dbg !2346
    #dbg_value(i64 %xor278, !2023, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %xor81, i64 %xor257), !1974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor274 = xor i64 %xor81, %xor257, !dbg !2347
    #dbg_value(i64 %xor274, !2032, !DIExpression(), !1964)
    #dbg_value(i64 %xor274, !2022, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %xor274), !1974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %not305 = xor i64 %xor274, -1, !dbg !2348
    #dbg_value(!DIArgList(i64 %xor290, i64 %xor278, i64 %not305), !1974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %and306 = and i64 %xor278, %not305, !dbg !2349
    #dbg_value(!DIArgList(i64 %xor290, i64 %and306), !1974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor307 = xor i64 %xor290, %and306, !dbg !2350
    #dbg_value(i64 %xor307, !1974, !DIExpression(), !1964)
  %xor283 = xor i64 %xor195, %xor269, !dbg !2351
    #dbg_value(i64 %xor283, !2050, !DIExpression(), !1964)
  %xor286 = call i64 @llvm.fshl.i64(i64 %xor283, i64 %xor283, i64 21), !dbg !2352
    #dbg_value(i64 %xor286, !2025, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 %xor286, i64 %xor274, i64 %xor290), !1972, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %not302 = xor i64 %xor290, -1, !dbg !2353
    #dbg_value(!DIArgList(i64 %xor286, i64 %xor274, i64 %not302), !1972, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %and303 = and i64 %xor274, %not302, !dbg !2354
    #dbg_value(!DIArgList(i64 %xor286, i64 %and303), !1972, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor304 = xor i64 %xor286, %and303, !dbg !2355
    #dbg_value(i64 %xor304, !1972, !DIExpression(), !1964)
  %xor279 = xor i64 %xor157, %xor265, !dbg !2356
    #dbg_value(i64 %xor279, !2044, !DIExpression(), !1964)
  %xor282 = call i64 @llvm.fshl.i64(i64 %xor279, i64 %xor279, i64 43), !dbg !2357
    #dbg_value(i64 %xor282, !2024, !DIExpression(), !1964)
    #dbg_value(!DIArgList(i64 %xor282, i64 %xor290, i64 %xor286), !1970, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor278, i64 %xor286, i64 %xor282), !1968, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
    #dbg_value(!DIArgList(i64 %xor274, i64 %xor282, i64 %xor278), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %not299 = xor i64 %xor286, -1, !dbg !2358
    #dbg_value(!DIArgList(i64 %xor282, i64 %xor290, i64 %not299), !1970, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %and300 = and i64 %xor290, %not299, !dbg !2359
    #dbg_value(!DIArgList(i64 %xor282, i64 %and300), !1970, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor301 = xor i64 %xor282, %and300, !dbg !2360
    #dbg_value(i64 %xor301, !1970, !DIExpression(), !1964)
  %not296 = xor i64 %xor282, -1, !dbg !2361
    #dbg_value(!DIArgList(i64 %xor278, i64 %xor286, i64 %not296), !1968, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1964)
  %and297 = and i64 %xor286, %not296, !dbg !2362
    #dbg_value(!DIArgList(i64 %xor278, i64 %and297), !1968, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %xor298 = xor i64 %xor278, %and297, !dbg !2363
    #dbg_value(i64 %xor298, !1968, !DIExpression(), !1964)
  %add = or disjoint i32 %round.0, 1, !dbg !2364
  %arrayidx294 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %add, !dbg !2365
  %27 = load i64, ptr %arrayidx294, align 8, !dbg !2365
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %xor282, i64 %xor278), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %not291 = xor i64 %xor278, -1, !dbg !2366
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %xor282, i64 %not291), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %and292 = and i64 %xor282, %not291, !dbg !2367
    #dbg_value(!DIArgList(i64 %xor274, i64 %27, i64 %and292), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1964)
  %28 = xor i64 %and292, %27, !dbg !2368
  %xor295 = xor i64 %28, %xor274, !dbg !2368
    #dbg_value(i64 %xor295, !1966, !DIExpression(), !1964)
  %add448 = add nuw nsw i32 %round.0, 2, !dbg !2369
    #dbg_value(i32 %add448, !2015, !DIExpression(), !1964)
  br label %for.cond, !dbg !2370, !llvm.loop !2371

for.end:                                          ; preds = %for.cond
  %Aso.0.lcssa = phi i64 [ %Aso.0, %for.cond ], !dbg !1964
  %Asi.0.lcssa = phi i64 [ %Asi.0, %for.cond ], !dbg !1964
  %Ase.0.lcssa = phi i64 [ %Ase.0, %for.cond ], !dbg !1964
  %Asa.0.lcssa = phi i64 [ %Asa.0, %for.cond ], !dbg !1964
  %Amu.0.lcssa = phi i64 [ %Amu.0, %for.cond ], !dbg !1964
  %Amo.0.lcssa = phi i64 [ %Amo.0, %for.cond ], !dbg !1964
  %Ami.0.lcssa = phi i64 [ %Ami.0, %for.cond ], !dbg !1964
  %Ame.0.lcssa = phi i64 [ %Ame.0, %for.cond ], !dbg !1964
  %Ama.0.lcssa = phi i64 [ %Ama.0, %for.cond ], !dbg !1964
  %Aku.0.lcssa = phi i64 [ %Aku.0, %for.cond ], !dbg !1964
  %Ako.0.lcssa = phi i64 [ %Ako.0, %for.cond ], !dbg !1964
  %Aki.0.lcssa = phi i64 [ %Aki.0, %for.cond ], !dbg !1964
  %Ake.0.lcssa = phi i64 [ %Ake.0, %for.cond ], !dbg !1964
  %Aka.0.lcssa = phi i64 [ %Aka.0, %for.cond ], !dbg !1964
  %Agu.0.lcssa = phi i64 [ %Agu.0, %for.cond ], !dbg !1964
  %Ago.0.lcssa = phi i64 [ %Ago.0, %for.cond ], !dbg !1964
  %Agi.0.lcssa = phi i64 [ %Agi.0, %for.cond ], !dbg !1964
  %Age.0.lcssa = phi i64 [ %Age.0, %for.cond ], !dbg !1964
  %Aga.0.lcssa = phi i64 [ %Aga.0, %for.cond ], !dbg !1964
  %Abu.0.lcssa = phi i64 [ %Abu.0, %for.cond ], !dbg !1964
  %Abo.0.lcssa = phi i64 [ %Abo.0, %for.cond ], !dbg !1964
  %Abi.0.lcssa = phi i64 [ %Abi.0, %for.cond ], !dbg !1964
  %Abe.0.lcssa = phi i64 [ %Abe.0, %for.cond ], !dbg !1964
  %Aba.0.lcssa = phi i64 [ %Aba.0, %for.cond ], !dbg !1964
  %Asu.0.lcssa = phi i64 [ %Asu.0, %for.cond ], !dbg !1964
  store i64 %Aba.0.lcssa, ptr %state, align 8, !dbg !2373
  %arrayidx450 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !2374
  store i64 %Abe.0.lcssa, ptr %arrayidx450, align 8, !dbg !2375
  %arrayidx451 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !2376
  store i64 %Abi.0.lcssa, ptr %arrayidx451, align 8, !dbg !2377
  %arrayidx452 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !2378
  store i64 %Abo.0.lcssa, ptr %arrayidx452, align 8, !dbg !2379
  %arrayidx453 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !2380
  store i64 %Abu.0.lcssa, ptr %arrayidx453, align 8, !dbg !2381
  %arrayidx454 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !2382
  store i64 %Aga.0.lcssa, ptr %arrayidx454, align 8, !dbg !2383
  %arrayidx455 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !2384
  store i64 %Age.0.lcssa, ptr %arrayidx455, align 8, !dbg !2385
  %arrayidx456 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !2386
  store i64 %Agi.0.lcssa, ptr %arrayidx456, align 8, !dbg !2387
  %arrayidx457 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !2388
  store i64 %Ago.0.lcssa, ptr %arrayidx457, align 8, !dbg !2389
  %arrayidx458 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !2390
  store i64 %Agu.0.lcssa, ptr %arrayidx458, align 8, !dbg !2391
  %arrayidx459 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !2392
  store i64 %Aka.0.lcssa, ptr %arrayidx459, align 8, !dbg !2393
  %arrayidx460 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !2394
  store i64 %Ake.0.lcssa, ptr %arrayidx460, align 8, !dbg !2395
  %arrayidx461 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !2396
  store i64 %Aki.0.lcssa, ptr %arrayidx461, align 8, !dbg !2397
  %arrayidx462 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !2398
  store i64 %Ako.0.lcssa, ptr %arrayidx462, align 8, !dbg !2399
  %arrayidx463 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !2400
  store i64 %Aku.0.lcssa, ptr %arrayidx463, align 8, !dbg !2401
  %arrayidx464 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !2402
  store i64 %Ama.0.lcssa, ptr %arrayidx464, align 8, !dbg !2403
  %arrayidx465 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !2404
  store i64 %Ame.0.lcssa, ptr %arrayidx465, align 8, !dbg !2405
  %arrayidx466 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !2406
  store i64 %Ami.0.lcssa, ptr %arrayidx466, align 8, !dbg !2407
  %arrayidx467 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !2408
  store i64 %Amo.0.lcssa, ptr %arrayidx467, align 8, !dbg !2409
  %arrayidx468 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !2410
  store i64 %Amu.0.lcssa, ptr %arrayidx468, align 8, !dbg !2411
  %arrayidx469 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !2412
  store i64 %Asa.0.lcssa, ptr %arrayidx469, align 8, !dbg !2413
  %arrayidx470 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !2414
  store i64 %Ase.0.lcssa, ptr %arrayidx470, align 8, !dbg !2415
  %arrayidx471 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !2416
  store i64 %Asi.0.lcssa, ptr %arrayidx471, align 8, !dbg !2417
  %arrayidx472 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !2418
  store i64 %Aso.0.lcssa, ptr %arrayidx472, align 8, !dbg !2419
  %arrayidx473 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !2420
  store i64 %Asu.0.lcssa, ptr %arrayidx473, align 8, !dbg !2421
  ret void, !dbg !2422
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_finalize(ptr noundef %state) local_unnamed_addr #0 !dbg !2423 {
entry:
    #dbg_value(ptr %state, !2424, !DIExpression(), !2425)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2426
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2426
  %conv = trunc i64 %0 to i32, !dbg !2426
  call fastcc void @keccak_finalize(ptr noundef %state, i32 noundef %conv, i32 noundef 168, i8 noundef zeroext 31) #3, !dbg !2427
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2428
  store i64 168, ptr %arrayidx1, align 8, !dbg !2429
  ret void, !dbg !2430
}

; Function Attrs: nounwind
define internal fastcc void @keccak_finalize(ptr noundef %s, i32 noundef %pos, i32 noundef range(i32 136, 169) %r, i8 noundef zeroext %p) unnamed_addr #0 !dbg !2431 {
entry:
    #dbg_value(ptr %s, !2434, !DIExpression(), !2435)
    #dbg_value(i32 %pos, !2436, !DIExpression(), !2435)
    #dbg_value(i32 %r, !2437, !DIExpression(), !2435)
    #dbg_value(i8 31, !2438, !DIExpression(), !2435)
  %rem = shl i32 %pos, 3, !dbg !2439
  %mul = and i32 %rem, 56, !dbg !2439
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2440
  %shl = shl nuw nsw i64 31, %sh_prom, !dbg !2440
  %div2 = lshr i32 %pos, 3, !dbg !2441
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div2, !dbg !2442
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2443
  %xor = xor i64 %0, %shl, !dbg !2443
  store i64 %xor, ptr %arrayidx, align 8, !dbg !2443
  %div13 = lshr i32 %r, 3, !dbg !2444
  %1 = getelementptr i64, ptr %s, i32 %div13, !dbg !2445
  %arrayidx2 = getelementptr i8, ptr %1, i32 -8, !dbg !2445
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !2446
  %xor3 = xor i64 %2, -9223372036854775808, !dbg !2446
  store i64 %xor3, ptr %arrayidx2, align 8, !dbg !2446
  ret void, !dbg !2447
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) local_unnamed_addr #0 !dbg !2448 {
entry:
    #dbg_value(ptr %out, !2451, !DIExpression(), !2452)
    #dbg_value(i32 %outlen, !2453, !DIExpression(), !2452)
    #dbg_value(ptr %state, !2454, !DIExpression(), !2452)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2455
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2455
  %conv = trunc i64 %0 to i32, !dbg !2455
  %call = call fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state, i32 noundef %conv, i32 noundef 168) #3, !dbg !2456
  %conv1 = zext i32 %call to i64, !dbg !2456
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2457
  store i64 %conv1, ptr %arrayidx2, align 8, !dbg !2458
  ret void, !dbg !2459
}

; Function Attrs: nounwind
define internal fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %s, i32 noundef %pos, i32 noundef range(i32 136, 169) %r) unnamed_addr #0 !dbg !2460 {
entry:
    #dbg_value(ptr %out, !2463, !DIExpression(), !2464)
    #dbg_value(i32 %outlen, !2465, !DIExpression(), !2464)
    #dbg_value(ptr %s, !2466, !DIExpression(), !2464)
    #dbg_value(i32 %pos, !2467, !DIExpression(), !2464)
    #dbg_value(i32 %r, !2468, !DIExpression(), !2464)
  br label %while.cond, !dbg !2469

while.cond:                                       ; preds = %for.end, %entry
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ %i.0.lcssa, %for.end ]
  %outlen.addr.0 = phi i32 [ %outlen, %entry ], [ %sub3, %for.end ]
  %out.addr.0 = phi ptr [ %out, %entry ], [ %out.addr.1.lcssa, %for.end ]
    #dbg_value(ptr %out.addr.0, !2463, !DIExpression(), !2464)
    #dbg_value(i32 %outlen.addr.0, !2465, !DIExpression(), !2464)
    #dbg_value(i32 %pos.addr.0, !2467, !DIExpression(), !2464)
  %tobool.not = icmp eq i32 %outlen.addr.0, 0, !dbg !2469
  br i1 %tobool.not, label %while.end, label %while.body, !dbg !2469

while.body:                                       ; preds = %while.cond
  %cmp = icmp eq i32 %pos.addr.0, %r, !dbg !2470
  br i1 %cmp, label %if.then, label %if.end, !dbg !2470

if.then:                                          ; preds = %while.body
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2473
    #dbg_value(i32 0, !2467, !DIExpression(), !2464)
  br label %if.end, !dbg !2475

if.end:                                           ; preds = %if.then, %while.body
  %pos.addr.1 = phi i32 [ 0, %if.then ], [ %pos.addr.0, %while.body ]
    #dbg_value(i32 %pos.addr.1, !2467, !DIExpression(), !2464)
    #dbg_value(i32 %pos.addr.1, !2476, !DIExpression(), !2464)
  br label %for.cond, !dbg !2477

for.cond:                                         ; preds = %for.body, %if.end
  %i.0 = phi i32 [ %pos.addr.1, %if.end ], [ %inc, %for.body ], !dbg !2479
  %out.addr.1 = phi ptr [ %out.addr.0, %if.end ], [ %incdec.ptr, %for.body ]
    #dbg_value(ptr %out.addr.1, !2463, !DIExpression(), !2464)
    #dbg_value(i32 %i.0, !2476, !DIExpression(), !2464)
  %cmp1 = icmp ult i32 %i.0, %r, !dbg !2480
  %add = add i32 %pos.addr.1, %outlen.addr.0, !dbg !2482
  %cmp2 = icmp ult i32 %i.0, %add, !dbg !2482
  %0 = and i1 %cmp1, %cmp2, !dbg !2482
  br i1 %0, label %for.body, label %for.end, !dbg !2483

for.body:                                         ; preds = %for.cond
  %div1 = lshr i32 %i.0, 3, !dbg !2484
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div1, !dbg !2485
  %1 = load i64, ptr %arrayidx, align 8, !dbg !2485
  %rem = shl nuw nsw i32 %i.0, 3, !dbg !2486
  %mul = and i32 %rem, 56, !dbg !2486
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2487
  %shr = lshr i64 %1, %sh_prom, !dbg !2487
  %conv = trunc i64 %shr to i8, !dbg !2485
    #dbg_value(ptr %out.addr.1, !2463, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2464)
  store i8 %conv, ptr %out.addr.1, align 1, !dbg !2488
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %out.addr.1, i32 1, !dbg !2489
    #dbg_value(ptr %incdec.ptr, !2463, !DIExpression(), !2464)
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2490
    #dbg_value(i32 %inc, !2476, !DIExpression(), !2464)
  br label %for.cond, !dbg !2491, !llvm.loop !2492

for.end:                                          ; preds = %for.cond
  %i.0.lcssa = phi i32 [ %i.0, %for.cond ], !dbg !2479
  %out.addr.1.lcssa = phi ptr [ %out.addr.1, %for.cond ]
  %sub.neg = sub i32 %pos.addr.1, %i.0.lcssa, !dbg !2494
  %sub3 = add i32 %sub.neg, %outlen.addr.0, !dbg !2495
    #dbg_value(i32 %sub3, !2465, !DIExpression(), !2464)
    #dbg_value(i32 %i.0.lcssa, !2467, !DIExpression(), !2464)
  br label %while.cond, !dbg !2469, !llvm.loop !2496

while.end:                                        ; preds = %while.cond
  %pos.addr.0.lcssa = phi i32 [ %pos.addr.0, %while.cond ]
  ret i32 %pos.addr.0.lcssa, !dbg !2498
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2499 {
entry:
    #dbg_value(ptr %state, !2500, !DIExpression(), !2501)
    #dbg_value(ptr %in, !2502, !DIExpression(), !2501)
    #dbg_value(i32 %inlen, !2503, !DIExpression(), !2501)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 168, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #3, !dbg !2504
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2505
  store i64 168, ptr %arrayidx, align 8, !dbg !2506
  ret void, !dbg !2507
}

; Function Attrs: nounwind
define internal fastcc void @keccak_absorb_once(ptr noundef %s, i32 noundef range(i32 72, 169) %r, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext range(i8 6, 32) %p) unnamed_addr #0 !dbg !2508 {
entry:
    #dbg_value(ptr %s, !2511, !DIExpression(), !2512)
    #dbg_value(i32 %r, !2513, !DIExpression(), !2512)
    #dbg_value(ptr %in, !2514, !DIExpression(), !2512)
    #dbg_value(i32 %inlen, !2515, !DIExpression(), !2512)
    #dbg_value(i8 %p, !2516, !DIExpression(), !2512)
    #dbg_value(i32 0, !2517, !DIExpression(), !2512)
  br label %for.cond, !dbg !2518

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2520
    #dbg_value(i32 %i.0, !2517, !DIExpression(), !2512)
  %exitcond = icmp ne i32 %i.0, 25, !dbg !2521
  br i1 %exitcond, label %for.body, label %while.cond.preheader, !dbg !2523

while.cond.preheader:                             ; preds = %for.cond
  %0 = lshr i32 %r, 3, !dbg !2524
  br label %while.cond, !dbg !2524

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !2525
  store i64 0, ptr %arrayidx, align 8, !dbg !2526
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2527
    #dbg_value(i32 %inc, !2517, !DIExpression(), !2512)
  br label %for.cond, !dbg !2528, !llvm.loop !2529

while.cond:                                       ; preds = %while.cond.preheader, %for.end8
  %in.addr.0 = phi ptr [ %add.ptr9, %for.end8 ], [ %in, %while.cond.preheader ]
  %inlen.addr.0 = phi i32 [ %sub, %for.end8 ], [ %inlen, %while.cond.preheader ]
    #dbg_value(i32 %inlen.addr.0, !2515, !DIExpression(), !2512)
    #dbg_value(ptr %in.addr.0, !2514, !DIExpression(), !2512)
  %cmp1.not = icmp ult i32 %inlen.addr.0, %r, !dbg !2531
  br i1 %cmp1.not, label %for.cond10.preheader, label %for.cond2.preheader, !dbg !2524

for.cond2.preheader:                              ; preds = %while.cond
  br label %for.cond2, !dbg !2532

for.cond10.preheader:                             ; preds = %while.cond
  %inlen.addr.0.lcssa6 = phi i32 [ %inlen.addr.0, %while.cond ]
  %in.addr.0.lcssa = phi ptr [ %in.addr.0, %while.cond ]
  br label %for.cond10, !dbg !2535

for.cond2:                                        ; preds = %for.cond2.preheader, %for.body4
  %i.1 = phi i32 [ %inc7, %for.body4 ], [ 0, %for.cond2.preheader ], !dbg !2537
    #dbg_value(i32 %i.1, !2517, !DIExpression(), !2512)
  %exitcond5 = icmp ne i32 %i.1, %0, !dbg !2538
  br i1 %exitcond5, label %for.body4, label %for.end8, !dbg !2532

for.body4:                                        ; preds = %for.cond2
  %mul = shl nuw nsw i32 %i.1, 3, !dbg !2540
  %add.ptr = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %mul, !dbg !2541
  %call = call fastcc i64 @load64(ptr noundef %add.ptr) #3, !dbg !2542
  %arrayidx5 = getelementptr inbounds nuw i64, ptr %s, i32 %i.1, !dbg !2543
  %1 = load i64, ptr %arrayidx5, align 8, !dbg !2544
  %xor = xor i64 %1, %call, !dbg !2544
  store i64 %xor, ptr %arrayidx5, align 8, !dbg !2544
  %inc7 = add nuw nsw i32 %i.1, 1, !dbg !2545
    #dbg_value(i32 %inc7, !2517, !DIExpression(), !2512)
  br label %for.cond2, !dbg !2546, !llvm.loop !2547

for.end8:                                         ; preds = %for.cond2
  %add.ptr9 = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %r, !dbg !2549
    #dbg_value(ptr %add.ptr9, !2514, !DIExpression(), !2512)
  %sub = sub i32 %inlen.addr.0, %r, !dbg !2550
    #dbg_value(i32 %sub, !2515, !DIExpression(), !2512)
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2551
  br label %while.cond, !dbg !2524, !llvm.loop !2552

for.cond10:                                       ; preds = %for.cond10.preheader, %for.body12
  %i.2 = phi i32 [ %inc19, %for.body12 ], [ 0, %for.cond10.preheader ], !dbg !2554
    #dbg_value(i32 %i.2, !2517, !DIExpression(), !2512)
  %exitcond7 = icmp ne i32 %i.2, %inlen.addr.0.lcssa6, !dbg !2555
  br i1 %exitcond7, label %for.body12, label %for.end20, !dbg !2535

for.body12:                                       ; preds = %for.cond10
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %in.addr.0.lcssa, i32 %i.2, !dbg !2557
  %2 = load i8, ptr %arrayidx13, align 1, !dbg !2557
  %conv = zext i8 %2 to i64, !dbg !2558
  %rem = shl i32 %i.2, 3, !dbg !2559
  %mul14 = and i32 %rem, 56, !dbg !2559
  %sh_prom = zext nneg i32 %mul14 to i64, !dbg !2560
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !2560
  %div153 = lshr i32 %i.2, 3, !dbg !2561
  %arrayidx16 = getelementptr inbounds nuw i64, ptr %s, i32 %div153, !dbg !2562
  %3 = load i64, ptr %arrayidx16, align 8, !dbg !2563
  %xor17 = xor i64 %3, %shl, !dbg !2563
  store i64 %xor17, ptr %arrayidx16, align 8, !dbg !2563
  %inc19 = add i32 %i.2, 1, !dbg !2564
    #dbg_value(i32 %inc19, !2517, !DIExpression(), !2512)
  br label %for.cond10, !dbg !2565, !llvm.loop !2566

for.end20:                                        ; preds = %for.cond10
  %i.2.lcssa = phi i32 [ %i.2, %for.cond10 ], !dbg !2554
  %conv21 = zext nneg i8 %p to i64, !dbg !2568
  %rem22 = shl i32 %i.2.lcssa, 3, !dbg !2569
  %mul23 = and i32 %rem22, 56, !dbg !2569
  %sh_prom24 = zext nneg i32 %mul23 to i64, !dbg !2570
  %shl25 = shl nuw nsw i64 %conv21, %sh_prom24, !dbg !2570
  %div261 = lshr i32 %i.2.lcssa, 3, !dbg !2571
  %arrayidx27 = getelementptr inbounds nuw i64, ptr %s, i32 %div261, !dbg !2572
  %4 = load i64, ptr %arrayidx27, align 8, !dbg !2573
  %xor28 = xor i64 %4, %shl25, !dbg !2573
  store i64 %xor28, ptr %arrayidx27, align 8, !dbg !2573
  %sub29 = add nsw i32 %r, -1, !dbg !2574
  %div302 = lshr i32 %sub29, 3, !dbg !2575
  %arrayidx31 = getelementptr inbounds nuw i64, ptr %s, i32 %div302, !dbg !2576
  %5 = load i64, ptr %arrayidx31, align 8, !dbg !2577
  %xor32 = xor i64 %5, -9223372036854775808, !dbg !2577
  store i64 %xor32, ptr %arrayidx31, align 8, !dbg !2577
  ret void, !dbg !2578
}

; Function Attrs: nounwind
define internal fastcc i64 @load64(ptr noundef %x) unnamed_addr #0 !dbg !2579 {
entry:
    #dbg_value(ptr %x, !2582, !DIExpression(), !2583)
    #dbg_value(i64 0, !2584, !DIExpression(), !2583)
    #dbg_value(i32 0, !2585, !DIExpression(), !2583)
  br label %for.cond, !dbg !2586

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !2588
  %r.0 = phi i64 [ 0, %entry ], [ %or, %for.inc ], !dbg !2583
    #dbg_value(i64 %r.0, !2584, !DIExpression(), !2583)
    #dbg_value(i32 %i.0, !2585, !DIExpression(), !2583)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !2589
  br i1 %exitcond, label %for.inc, label %for.end, !dbg !2591

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i64 poison, i8 poison, i32 poison), !2584, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2583)
  %arrayidx = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2592
  %0 = load i8, ptr %arrayidx, align 1, !dbg !2592
    #dbg_value(!DIArgList(i64 %r.0, i8 %0, i32 %i.0), !2584, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2583)
  %conv = zext i8 %0 to i64, !dbg !2593
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i32 %i.0), !2584, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2583)
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2594
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i32 %mul), !2584, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2583)
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2595
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i64 %sh_prom), !2584, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2583)
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !2595
    #dbg_value(!DIArgList(i64 %r.0, i64 %shl), !2584, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value), !2583)
  %or = or i64 %r.0, %shl, !dbg !2596
    #dbg_value(i64 %or, !2584, !DIExpression(), !2583)
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2597
    #dbg_value(i32 %inc, !2585, !DIExpression(), !2583)
  br label %for.cond, !dbg !2598, !llvm.loop !2599

for.end:                                          ; preds = %for.cond
  %r.0.lcssa = phi i64 [ %r.0, %for.cond ], !dbg !2583
  ret i64 %r.0.lcssa, !dbg !2601
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #0 !dbg !2602 {
entry:
    #dbg_value(ptr %out, !2603, !DIExpression(), !2604)
    #dbg_value(i32 %nblocks, !2605, !DIExpression(), !2604)
    #dbg_value(ptr %state, !2606, !DIExpression(), !2604)
  call fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state, i32 noundef 168) #3, !dbg !2607
  ret void, !dbg !2608
}

; Function Attrs: nounwind
define internal fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %s, i32 noundef range(i32 136, 169) %r) unnamed_addr #0 !dbg !2609 {
entry:
    #dbg_value(ptr %out, !2612, !DIExpression(), !2613)
    #dbg_value(i32 %nblocks, !2614, !DIExpression(), !2613)
    #dbg_value(ptr %s, !2615, !DIExpression(), !2613)
    #dbg_value(i32 %r, !2616, !DIExpression(), !2613)
  %0 = lshr i32 %r, 3, !dbg !2617
  br label %while.cond, !dbg !2617

while.cond:                                       ; preds = %for.end, %entry
  %nblocks.addr.0 = phi i32 [ %nblocks, %entry ], [ %sub, %for.end ]
  %out.addr.0 = phi ptr [ %out, %entry ], [ %add.ptr1, %for.end ]
    #dbg_value(ptr %out.addr.0, !2612, !DIExpression(), !2613)
    #dbg_value(i32 %nblocks.addr.0, !2614, !DIExpression(), !2613)
  %tobool.not = icmp eq i32 %nblocks.addr.0, 0, !dbg !2617
  br i1 %tobool.not, label %while.end, label %while.body, !dbg !2617

while.body:                                       ; preds = %while.cond
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2618
    #dbg_value(i32 0, !2620, !DIExpression(), !2613)
  br label %for.cond, !dbg !2621

for.cond:                                         ; preds = %for.body, %while.body
  %i.0 = phi i32 [ 0, %while.body ], [ %inc, %for.body ], !dbg !2623
    #dbg_value(i32 %i.0, !2620, !DIExpression(), !2613)
  %exitcond = icmp ne i32 %i.0, %0, !dbg !2624
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2626

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2627
  %add.ptr = getelementptr inbounds nuw i8, ptr %out.addr.0, i32 %mul, !dbg !2628
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !2629
  %1 = load i64, ptr %arrayidx, align 8, !dbg !2629
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %1) #3, !dbg !2630
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2631
    #dbg_value(i32 %inc, !2620, !DIExpression(), !2613)
  br label %for.cond, !dbg !2632, !llvm.loop !2633

for.end:                                          ; preds = %for.cond
  %add.ptr1 = getelementptr inbounds nuw i8, ptr %out.addr.0, i32 %r, !dbg !2635
    #dbg_value(ptr %add.ptr1, !2612, !DIExpression(), !2613)
  %sub = add i32 %nblocks.addr.0, -1, !dbg !2636
    #dbg_value(i32 %sub, !2614, !DIExpression(), !2613)
  br label %while.cond, !dbg !2617, !llvm.loop !2637

while.end:                                        ; preds = %while.cond
  ret void, !dbg !2639
}

; Function Attrs: nounwind
define internal fastcc void @store64(ptr noundef %x, i64 noundef %u) unnamed_addr #0 !dbg !2640 {
entry:
    #dbg_value(ptr %x, !2643, !DIExpression(), !2644)
    #dbg_value(i64 %u, !2645, !DIExpression(), !2644)
    #dbg_value(i32 0, !2646, !DIExpression(), !2644)
  br label %for.cond, !dbg !2647

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2649
    #dbg_value(i32 %i.0, !2646, !DIExpression(), !2644)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !2650
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2652

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2653
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2654
  %shr = lshr i64 %u, %sh_prom, !dbg !2654
  %conv = trunc i64 %shr to i8, !dbg !2655
  %arrayidx = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2656
  store i8 %conv, ptr %arrayidx, align 1, !dbg !2657
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2658
    #dbg_value(i32 %inc, !2646, !DIExpression(), !2644)
  br label %for.cond, !dbg !2659, !llvm.loop !2660

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2662
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef %state) local_unnamed_addr #0 !dbg !2663 {
entry:
    #dbg_value(ptr %state, !2664, !DIExpression(), !2665)
  call fastcc void @keccak_init(ptr noundef %state) #3, !dbg !2666
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2667
  store i64 0, ptr %arrayidx, align 8, !dbg !2668
  ret void, !dbg !2669
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2670 {
entry:
    #dbg_value(ptr %state, !2671, !DIExpression(), !2672)
    #dbg_value(ptr %in, !2673, !DIExpression(), !2672)
    #dbg_value(i32 %inlen, !2674, !DIExpression(), !2672)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2675
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2675
  %conv = trunc i64 %0 to i32, !dbg !2675
  %call = call fastcc i32 @keccak_absorb(ptr noundef %state, i32 noundef %conv, i32 noundef 136, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2676
  %conv1 = zext i32 %call to i64, !dbg !2676
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2677
  store i64 %conv1, ptr %arrayidx2, align 8, !dbg !2678
  ret void, !dbg !2679
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef %state) local_unnamed_addr #0 !dbg !2680 {
entry:
    #dbg_value(ptr %state, !2681, !DIExpression(), !2682)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2683
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2683
  %conv = trunc i64 %0 to i32, !dbg !2683
  call fastcc void @keccak_finalize(ptr noundef %state, i32 noundef %conv, i32 noundef 136, i8 noundef zeroext 31) #3, !dbg !2684
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2685
  store i64 136, ptr %arrayidx1, align 8, !dbg !2686
  ret void, !dbg !2687
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) local_unnamed_addr #0 !dbg !2688 {
entry:
    #dbg_value(ptr %out, !2689, !DIExpression(), !2690)
    #dbg_value(i32 %outlen, !2691, !DIExpression(), !2690)
    #dbg_value(ptr %state, !2692, !DIExpression(), !2690)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2693
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2693
  %conv = trunc i64 %0 to i32, !dbg !2693
  %call = call fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state, i32 noundef %conv, i32 noundef 136) #3, !dbg !2694
  %conv1 = zext i32 %call to i64, !dbg !2694
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2695
  store i64 %conv1, ptr %arrayidx2, align 8, !dbg !2696
  ret void, !dbg !2697
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2698 {
entry:
    #dbg_value(ptr %state, !2699, !DIExpression(), !2700)
    #dbg_value(ptr %in, !2701, !DIExpression(), !2700)
    #dbg_value(i32 %inlen, !2702, !DIExpression(), !2700)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #3, !dbg !2703
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2704
  store i64 136, ptr %arrayidx, align 8, !dbg !2705
  ret void, !dbg !2706
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #0 !dbg !2707 {
entry:
    #dbg_value(ptr %out, !2708, !DIExpression(), !2709)
    #dbg_value(i32 %nblocks, !2710, !DIExpression(), !2709)
    #dbg_value(ptr %state, !2711, !DIExpression(), !2709)
  call fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state, i32 noundef 136) #3, !dbg !2712
  ret void, !dbg !2713
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2714 {
entry:
  %state = alloca [26 x i64], align 8
    #dbg_value(ptr %out, !2717, !DIExpression(), !2718)
    #dbg_value(i32 %outlen, !2719, !DIExpression(), !2718)
    #dbg_value(ptr %in, !2720, !DIExpression(), !2718)
    #dbg_value(i32 %inlen, !2721, !DIExpression(), !2718)
    #dbg_declare(ptr %state, !2722, !DIExpression(), !2723)
  call void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef nonnull %state, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2724
  %div = udiv i32 %outlen, 168, !dbg !2725
    #dbg_value(i32 %div, !2726, !DIExpression(), !2718)
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %div, ptr noundef nonnull %state) #3, !dbg !2727
  %mul.neg = mul i32 %div, -168, !dbg !2728
  %sub = add i32 %mul.neg, %outlen, !dbg !2729
    #dbg_value(i32 %sub, !2719, !DIExpression(), !2718)
  %mul1 = mul nuw i32 %div, 168, !dbg !2730
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !2731
    #dbg_value(ptr %add.ptr, !2717, !DIExpression(), !2718)
  call void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef nonnull %state) #3, !dbg !2732
  ret void, !dbg !2733
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2734 {
entry:
  %state = alloca [26 x i64], align 8
    #dbg_value(ptr %out, !2735, !DIExpression(), !2736)
    #dbg_value(i32 %outlen, !2737, !DIExpression(), !2736)
    #dbg_value(ptr %in, !2738, !DIExpression(), !2736)
    #dbg_value(i32 %inlen, !2739, !DIExpression(), !2736)
    #dbg_declare(ptr %state, !2740, !DIExpression(), !2741)
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef nonnull %state, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2742
  %div = udiv i32 %outlen, 136, !dbg !2743
    #dbg_value(i32 %div, !2744, !DIExpression(), !2736)
  call void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %div, ptr noundef nonnull %state) #3, !dbg !2745
  %mul.neg = mul i32 %div, -136, !dbg !2746
  %sub = add i32 %mul.neg, %outlen, !dbg !2747
    #dbg_value(i32 %sub, !2737, !DIExpression(), !2736)
  %mul1 = mul nuw i32 %div, 136, !dbg !2748
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !2749
    #dbg_value(ptr %add.ptr, !2735, !DIExpression(), !2736)
  call void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef nonnull %state) #3, !dbg !2750
  ret void, !dbg !2751
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2752 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !2755, !DIExpression(), !2756)
    #dbg_value(ptr %in, !2757, !DIExpression(), !2756)
    #dbg_value(i32 %inlen, !2758, !DIExpression(), !2756)
    #dbg_declare(ptr %s, !2759, !DIExpression(), !2763)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %s, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #3, !dbg !2764
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #3, !dbg !2765
    #dbg_value(i32 0, !2766, !DIExpression(), !2756)
  br label %for.cond, !dbg !2767

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2769
    #dbg_value(i32 %i.0, !2766, !DIExpression(), !2756)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !2770
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2772

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2773
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !2774
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !2775
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2775
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %0) #3, !dbg !2776
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2777
    #dbg_value(i32 %inc, !2766, !DIExpression(), !2756)
  br label %for.cond, !dbg !2778, !llvm.loop !2779

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2781
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2782 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !2783, !DIExpression(), !2784)
    #dbg_value(ptr %in, !2785, !DIExpression(), !2784)
    #dbg_value(i32 %inlen, !2786, !DIExpression(), !2784)
    #dbg_declare(ptr %s, !2787, !DIExpression(), !2788)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %s, i32 noundef 72, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #3, !dbg !2789
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #3, !dbg !2790
    #dbg_value(i32 0, !2791, !DIExpression(), !2784)
  br label %for.cond, !dbg !2792

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2794
    #dbg_value(i32 %i.0, !2791, !DIExpression(), !2784)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !2795
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2797

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2798
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !2799
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !2800
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2800
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %0) #3, !dbg !2801
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2802
    #dbg_value(i32 %inc, !2791, !DIExpression(), !2784)
  br label %for.cond, !dbg !2803, !llvm.loop !2804

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2806
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_kyber_shake128_absorb(ptr noundef %state, ptr noundef %seed, i8 noundef zeroext %x, i8 noundef zeroext %y) local_unnamed_addr #0 !dbg !2807 {
entry:
  %extseed = alloca [34 x i8], align 1
    #dbg_value(ptr %state, !2811, !DIExpression(), !2812)
    #dbg_value(ptr %seed, !2813, !DIExpression(), !2812)
    #dbg_value(i8 %x, !2814, !DIExpression(), !2812)
    #dbg_value(i8 %y, !2815, !DIExpression(), !2812)
    #dbg_declare(ptr %extseed, !2816, !DIExpression(), !2820)
  %call = call ptr @memcpy(ptr noundef nonnull %extseed, ptr noundef %seed, i32 noundef 32) #3, !dbg !2821
  %arrayidx = getelementptr inbounds nuw i8, ptr %extseed, i32 32, !dbg !2822
  store i8 %x, ptr %arrayidx, align 1, !dbg !2823
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %extseed, i32 33, !dbg !2824
  store i8 %y, ptr %arrayidx1, align 1, !dbg !2825
  call void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef nonnull %extseed, i32 noundef 34) #3, !dbg !2826
  ret void, !dbg !2827
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_kyber_shake256_prf(ptr noundef %out, i32 noundef %outlen, ptr noundef %key, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !2828 {
entry:
  %extkey = alloca [33 x i8], align 1
    #dbg_value(ptr %out, !2831, !DIExpression(), !2832)
    #dbg_value(i32 %outlen, !2833, !DIExpression(), !2832)
    #dbg_value(ptr %key, !2834, !DIExpression(), !2832)
    #dbg_value(i8 %nonce, !2835, !DIExpression(), !2832)
    #dbg_declare(ptr %extkey, !2836, !DIExpression(), !2840)
  %call = call ptr @memcpy(ptr noundef nonnull %extkey, ptr noundef %key, i32 noundef 32) #3, !dbg !2841
  %arrayidx = getelementptr inbounds nuw i8, ptr %extkey, i32 32, !dbg !2842
  store i8 %nonce, ptr %arrayidx, align 1, !dbg !2843
  call void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef nonnull %extkey, i32 noundef 33) #3, !dbg !2844
  ret void, !dbg !2845
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber512_ref_kyber_shake256_rkprf(ptr noundef %out, ptr noundef %key, ptr noundef %input) local_unnamed_addr #0 !dbg !2846 {
entry:
  %s = alloca [26 x i64], align 8
    #dbg_value(ptr %out, !2847, !DIExpression(), !2848)
    #dbg_value(ptr %key, !2849, !DIExpression(), !2848)
    #dbg_value(ptr %input, !2850, !DIExpression(), !2848)
    #dbg_declare(ptr %s, !2851, !DIExpression(), !2852)
  call void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef nonnull %s) #3, !dbg !2853
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef nonnull %s, ptr noundef %key, i32 noundef 32) #3, !dbg !2854
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef nonnull %s, ptr noundef %input, i32 noundef 768) #3, !dbg !2855
  call void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef nonnull %s) #3, !dbg !2856
  call void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef 32, ptr noundef nonnull %s) #3, !dbg !2857
  ret void, !dbg !2858
}

; Function Attrs: nounwind
define dso_local ptr @memcpy(ptr noundef %dest, ptr noundef %src, i32 noundef %n) local_unnamed_addr #0 !dbg !2859 {
entry:
    #dbg_value(ptr %dest, !2866, !DIExpression(), !2867)
    #dbg_value(ptr %src, !2868, !DIExpression(), !2867)
    #dbg_value(i32 %n, !2869, !DIExpression(), !2867)
    #dbg_value(ptr %dest, !2870, !DIExpression(), !2867)
    #dbg_value(ptr %src, !2871, !DIExpression(), !2867)
    #dbg_value(i32 0, !2872, !DIExpression(), !2874)
  br label %for.cond, !dbg !2875

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2876
    #dbg_value(i32 %i.0, !2872, !DIExpression(), !2874)
  %exitcond = icmp ne i32 %i.0, %n, !dbg !2877
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2879

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %src, i32 %i.0, !dbg !2880
  %0 = load i8, ptr %arrayidx, align 1, !dbg !2880
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %dest, i32 %i.0, !dbg !2881
  store i8 %0, ptr %arrayidx1, align 1, !dbg !2882
  %inc = add i32 %i.0, 1, !dbg !2883
    #dbg_value(i32 %inc, !2872, !DIExpression(), !2874)
  br label %for.cond, !dbg !2884, !llvm.loop !2885

for.end:                                          ; preds = %for.cond
  ret ptr %dest, !dbg !2887
}

; Function Attrs: nounwind
define dso_local range(i32 -255, 256) i32 @memcmp(ptr noundef %s1, ptr noundef %s2, i32 noundef %n) local_unnamed_addr #0 !dbg !2888 {
entry:
    #dbg_value(ptr %s1, !2891, !DIExpression(), !2892)
    #dbg_value(ptr %s2, !2893, !DIExpression(), !2892)
    #dbg_value(i32 %n, !2894, !DIExpression(), !2892)
    #dbg_value(ptr %s1, !2895, !DIExpression(), !2892)
    #dbg_value(ptr %s2, !2896, !DIExpression(), !2892)
    #dbg_value(i32 0, !2897, !DIExpression(), !2899)
  br label %for.cond, !dbg !2900

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !2901
    #dbg_value(i32 %i.0, !2897, !DIExpression(), !2899)
  %exitcond = icmp ne i32 %i.0, %n, !dbg !2902
  br i1 %exitcond, label %for.body, label %return.loopexit, !dbg !2904

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %s1, i32 %i.0, !dbg !2905
  %0 = load i8, ptr %arrayidx, align 1, !dbg !2905
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %s2, i32 %i.0, !dbg !2908
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !2908
  %cmp3.not = icmp eq i8 %0, %1, !dbg !2909
  br i1 %cmp3.not, label %for.inc, label %if.then, !dbg !2909

if.then:                                          ; preds = %for.body
  %i.0.lcssa1 = phi i32 [ %i.0, %for.body ], !dbg !2901
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %s1, i32 %i.0.lcssa1, !dbg !2910
  %2 = load i8, ptr %arrayidx5, align 1, !dbg !2910
  %conv6 = zext i8 %2 to i32, !dbg !2911
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %s2, i32 %i.0.lcssa1, !dbg !2912
  %3 = load i8, ptr %arrayidx7, align 1, !dbg !2912
  %conv8 = zext i8 %3 to i32, !dbg !2913
  %sub = sub nsw i32 %conv6, %conv8, !dbg !2914
  br label %return, !dbg !2915

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !2916
    #dbg_value(i32 %inc, !2897, !DIExpression(), !2899)
  br label %for.cond, !dbg !2917, !llvm.loop !2918

return.loopexit:                                  ; preds = %for.cond
  br label %return, !dbg !2920

return:                                           ; preds = %return.loopexit, %if.then
  %retval.0 = phi i32 [ %sub, %if.then ], [ 0, %return.loopexit ], !dbg !2892
  ret i32 %retval.0, !dbg !2920
}

; Function Attrs: nounwind
define dso_local ptr @memset(ptr noundef %s, i32 noundef %c, i32 noundef %n) local_unnamed_addr #0 !dbg !2921 {
entry:
    #dbg_value(ptr %s, !2924, !DIExpression(), !2925)
    #dbg_value(i32 %c, !2926, !DIExpression(), !2925)
    #dbg_value(i32 %n, !2927, !DIExpression(), !2925)
    #dbg_value(ptr %s, !2928, !DIExpression(), !2925)
    #dbg_value(i32 0, !2929, !DIExpression(), !2931)
  br label %for.cond, !dbg !2932

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2933
    #dbg_value(i32 %i.0, !2929, !DIExpression(), !2931)
  %exitcond = icmp ne i32 %i.0, %n, !dbg !2934
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2936

for.body:                                         ; preds = %for.cond
  %conv = trunc i32 %c to i8, !dbg !2937
  %arrayidx = getelementptr inbounds nuw i8, ptr %s, i32 %i.0, !dbg !2938
  store i8 %conv, ptr %arrayidx, align 1, !dbg !2939
  %inc = add i32 %i.0, 1, !dbg !2940
    #dbg_value(i32 %inc, !2929, !DIExpression(), !2931)
  br label %for.cond, !dbg !2941, !llvm.loop !2942

for.end:                                          ; preds = %for.cond
  ret ptr %s, !dbg !2944
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

!llvm.dbg.cu = !{!54, !15, !57, !58, !63, !67, !28, !69, !71, !73, !43, !74, !75}
!llvm.ident = !{!79, !79, !79, !79, !79, !79, !79, !79, !79, !79, !79, !79, !79}
!llvm.module.flags = !{!80, !81, !82, !83}

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
!75 = distinct !DICompileUnit(language: DW_LANG_C11, file: !16, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !76, splitDebugInlining: false, nameTableKind: None)
!76 = !{!6, !77, !25, !7}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 32)
!78 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !7)
!79 = !{!"Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)"}
!80 = !{i32 2, !"Debug Info Version", i32 3}
!81 = !{i32 1, !"wchar_size", i32 4}
!82 = !{i32 1, !"min_enum_size", i32 4}
!83 = !{i32 1, !"Code Model", i32 1}
!84 = distinct !DISubprogram(name: "main", scope: !85, file: !85, line: 97, type: !86, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !54, retainedNodes: !24)
!85 = !DIFile(filename: "../../../ref/test/test_kyber.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!86 = !DISubroutineType(types: !87)
!87 = !{!25}
!88 = !DILocalVariable(name: "i", scope: !84, file: !85, line: 99, type: !14)
!89 = !DILocation(line: 0, scope: !84)
!90 = !DILocation(line: 102, column: 7, scope: !91)
!91 = distinct !DILexicalBlock(scope: !84, file: !85, line: 102, column: 3)
!92 = !DILocation(line: 102, scope: !91)
!93 = !DILocation(line: 102, column: 12, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !85, line: 102, column: 3)
!95 = !DILocation(line: 102, column: 3, scope: !91)
!96 = !DILocation(line: 103, column: 10, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !85, line: 102, column: 25)
!98 = !DILocalVariable(name: "r", scope: !84, file: !85, line: 100, type: !25)
!99 = !DILocation(line: 104, column: 10, scope: !97)
!100 = !DILocation(line: 104, column: 7, scope: !97)
!101 = !DILocation(line: 105, column: 10, scope: !97)
!102 = !DILocation(line: 105, column: 7, scope: !97)
!103 = !DILocation(line: 106, column: 8, scope: !104)
!104 = distinct !DILexicalBlock(scope: !97, file: !85, line: 106, column: 8)
!105 = !DILocation(line: 102, column: 21, scope: !94)
!106 = !DILocation(line: 102, column: 3, scope: !94)
!107 = distinct !{!107, !95, !108, !109}
!108 = !DILocation(line: 108, column: 3, scope: !91)
!109 = !{!"llvm.loop.mustprogress"}
!110 = !DILocation(line: 115, column: 1, scope: !84)
!111 = distinct !DISubprogram(name: "test_keys", scope: !85, file: !85, line: 9, type: !86, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !54, retainedNodes: !24)
!112 = !DILocalVariable(name: "pk", scope: !111, file: !85, line: 11, type: !113)
!113 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 6400, elements: !114)
!114 = !{!115}
!115 = !DISubrange(count: 800)
!116 = !DILocation(line: 11, column: 11, scope: !111)
!117 = !DILocalVariable(name: "sk", scope: !111, file: !85, line: 12, type: !118)
!118 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 13056, elements: !119)
!119 = !{!120}
!120 = !DISubrange(count: 1632)
!121 = !DILocation(line: 12, column: 11, scope: !111)
!122 = !DILocalVariable(name: "ct", scope: !111, file: !85, line: 13, type: !123)
!123 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 6144, elements: !124)
!124 = !{!125}
!125 = !DISubrange(count: 768)
!126 = !DILocation(line: 13, column: 11, scope: !111)
!127 = !DILocalVariable(name: "key_a", scope: !111, file: !85, line: 14, type: !128)
!128 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 256, elements: !129)
!129 = !{!130}
!130 = !DISubrange(count: 32)
!131 = !DILocation(line: 14, column: 11, scope: !111)
!132 = !DILocalVariable(name: "key_b", scope: !111, file: !85, line: 15, type: !128)
!133 = !DILocation(line: 15, column: 11, scope: !111)
!134 = !DILocation(line: 18, column: 3, scope: !111)
!135 = !DILocation(line: 21, column: 3, scope: !111)
!136 = !DILocation(line: 24, column: 3, scope: !111)
!137 = !DILocation(line: 26, column: 6, scope: !138)
!138 = distinct !DILexicalBlock(scope: !111, file: !85, line: 26, column: 6)
!139 = !DILocation(line: 0, scope: !111)
!140 = !DILocation(line: 32, column: 1, scope: !111)
!141 = distinct !DISubprogram(name: "test_invalid_sk_a", scope: !85, file: !85, line: 34, type: !86, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !54, retainedNodes: !24)
!142 = !DILocalVariable(name: "pk", scope: !141, file: !85, line: 36, type: !113)
!143 = !DILocation(line: 36, column: 11, scope: !141)
!144 = !DILocalVariable(name: "sk", scope: !141, file: !85, line: 37, type: !118)
!145 = !DILocation(line: 37, column: 11, scope: !141)
!146 = !DILocalVariable(name: "ct", scope: !141, file: !85, line: 38, type: !123)
!147 = !DILocation(line: 38, column: 11, scope: !141)
!148 = !DILocalVariable(name: "key_a", scope: !141, file: !85, line: 39, type: !128)
!149 = !DILocation(line: 39, column: 11, scope: !141)
!150 = !DILocalVariable(name: "key_b", scope: !141, file: !85, line: 40, type: !128)
!151 = !DILocation(line: 40, column: 11, scope: !141)
!152 = !DILocation(line: 43, column: 3, scope: !141)
!153 = !DILocation(line: 46, column: 3, scope: !141)
!154 = !DILocation(line: 49, column: 3, scope: !141)
!155 = !DILocation(line: 52, column: 3, scope: !141)
!156 = !DILocation(line: 54, column: 7, scope: !157)
!157 = distinct !DILexicalBlock(scope: !141, file: !85, line: 54, column: 6)
!158 = !DILocation(line: 0, scope: !141)
!159 = !DILocation(line: 60, column: 1, scope: !141)
!160 = distinct !DISubprogram(name: "test_invalid_ciphertext", scope: !85, file: !85, line: 62, type: !86, scopeLine: 63, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !54, retainedNodes: !24)
!161 = !DILocalVariable(name: "pk", scope: !160, file: !85, line: 64, type: !113)
!162 = !DILocation(line: 64, column: 11, scope: !160)
!163 = !DILocalVariable(name: "sk", scope: !160, file: !85, line: 65, type: !118)
!164 = !DILocation(line: 65, column: 11, scope: !160)
!165 = !DILocalVariable(name: "ct", scope: !160, file: !85, line: 66, type: !123)
!166 = !DILocation(line: 66, column: 11, scope: !160)
!167 = !DILocalVariable(name: "key_a", scope: !160, file: !85, line: 67, type: !128)
!168 = !DILocation(line: 67, column: 11, scope: !160)
!169 = !DILocalVariable(name: "key_b", scope: !160, file: !85, line: 68, type: !128)
!170 = !DILocation(line: 68, column: 11, scope: !160)
!171 = !DILocation(line: 72, column: 3, scope: !160)
!172 = !DILocalVariable(name: "b", scope: !160, file: !85, line: 69, type: !7)
!173 = !DILocation(line: 0, scope: !160)
!174 = !DILocation(line: 73, column: 5, scope: !175)
!175 = distinct !DILexicalBlock(scope: !160, file: !85, line: 72, column: 6)
!176 = !DILocation(line: 74, column: 12, scope: !160)
!177 = !DILocation(line: 74, column: 11, scope: !160)
!178 = !DILocation(line: 74, column: 3, scope: !175)
!179 = distinct !{!179, !171, !180, !109}
!180 = !DILocation(line: 74, column: 13, scope: !160)
!181 = !DILocalVariable(name: "pos", scope: !160, file: !85, line: 70, type: !12)
!182 = !DILocation(line: 75, column: 3, scope: !160)
!183 = !DILocation(line: 78, column: 3, scope: !160)
!184 = !DILocation(line: 81, column: 3, scope: !160)
!185 = !DILocation(line: 84, column: 39, scope: !160)
!186 = !DILocation(line: 84, column: 6, scope: !160)
!187 = !DILocation(line: 84, column: 10, scope: !160)
!188 = !DILocation(line: 84, column: 3, scope: !160)
!189 = !DILocation(line: 84, column: 36, scope: !160)
!190 = !DILocation(line: 87, column: 3, scope: !160)
!191 = !DILocation(line: 89, column: 7, scope: !192)
!192 = distinct !DILexicalBlock(scope: !160, file: !85, line: 89, column: 6)
!193 = !DILocation(line: 95, column: 1, scope: !160)
!194 = !DILocalVariable(name: "out", arg: 1, scope: !2, file: !3, line: 74, type: !6)
!195 = !DILocation(line: 0, scope: !2)
!196 = !DILocalVariable(name: "outlen", arg: 2, scope: !2, file: !3, line: 74, type: !12)
!197 = !DILocation(line: 78, column: 3, scope: !2)
!198 = !DILocation(line: 78, column: 9, scope: !2)
!199 = !DILocation(line: 78, column: 12, scope: !2)
!200 = !DILocation(line: 86, column: 3, scope: !2)
!201 = !DILocation(line: 79, column: 10, scope: !202)
!202 = distinct !DILexicalBlock(scope: !2, file: !3, line: 78, column: 19)
!203 = !DILocation(line: 79, column: 8, scope: !202)
!204 = !DILocation(line: 80, column: 11, scope: !205)
!205 = distinct !DILexicalBlock(scope: !202, file: !3, line: 80, column: 8)
!206 = !DILocation(line: 80, column: 17, scope: !205)
!207 = !DILocation(line: 80, column: 20, scope: !205)
!208 = !DILocation(line: 80, column: 26, scope: !205)
!209 = !DILocation(line: 82, column: 13, scope: !210)
!210 = distinct !DILexicalBlock(scope: !205, file: !3, line: 82, column: 13)
!211 = !DILocation(line: 82, column: 16, scope: !210)
!212 = !DILocation(line: 83, column: 7, scope: !210)
!213 = distinct !{!213, !197, !214, !109}
!214 = !DILocation(line: 84, column: 3, scope: !2)
!215 = !DILocation(line: 86, column: 16, scope: !2)
!216 = !DILocation(line: 87, column: 16, scope: !217)
!217 = distinct !DILexicalBlock(scope: !2, file: !3, line: 86, column: 21)
!218 = !DILocation(line: 87, column: 11, scope: !217)
!219 = !DILocalVariable(name: "ret", scope: !2, file: !3, line: 76, type: !220)
!220 = !DIDerivedType(tag: DW_TAG_typedef, name: "ssize_t", file: !221, line: 182, baseType: !222)
!221 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/sys/types.h", directory: "")
!222 = !DIDerivedType(tag: DW_TAG_typedef, name: "_ssize_t", file: !223, line: 147, baseType: !25)
!223 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/sys/_types.h", directory: "")
!224 = !DILocation(line: 88, column: 18, scope: !225)
!225 = distinct !DILexicalBlock(scope: !217, file: !3, line: 88, column: 8)
!226 = !DILocation(line: 88, column: 21, scope: !225)
!227 = !DILocation(line: 88, column: 27, scope: !225)
!228 = distinct !{!228, !200, !229, !109}
!229 = !DILocation(line: 95, column: 3, scope: !2)
!230 = !DILocation(line: 91, column: 7, scope: !231)
!231 = distinct !DILexicalBlock(scope: !225, file: !3, line: 90, column: 13)
!232 = !DILocation(line: 93, column: 9, scope: !217)
!233 = !DILocation(line: 94, column: 12, scope: !217)
!234 = !DILocation(line: 96, column: 1, scope: !2)
!235 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_keypair_derand", scope: !236, file: !236, line: 25, type: !237, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !24)
!236 = !DIFile(filename: "../../../ref/kem.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!237 = !DISubroutineType(types: !238)
!238 = !{!25, !6, !6, !77}
!239 = !DILocalVariable(name: "pk", arg: 1, scope: !235, file: !236, line: 25, type: !6)
!240 = !DILocation(line: 0, scope: !235)
!241 = !DILocalVariable(name: "sk", arg: 2, scope: !235, file: !236, line: 26, type: !6)
!242 = !DILocalVariable(name: "coins", arg: 3, scope: !235, file: !236, line: 27, type: !77)
!243 = !DILocation(line: 29, column: 3, scope: !235)
!244 = !DILocation(line: 30, column: 12, scope: !235)
!245 = !DILocation(line: 30, column: 3, scope: !235)
!246 = !DILocation(line: 31, column: 3, scope: !235)
!247 = !DILocation(line: 33, column: 33, scope: !235)
!248 = !DILocation(line: 33, column: 55, scope: !235)
!249 = !DILocation(line: 33, column: 3, scope: !235)
!250 = !DILocation(line: 34, column: 3, scope: !235)
!251 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_keypair", scope: !236, file: !236, line: 50, type: !252, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !24)
!252 = !DISubroutineType(types: !253)
!253 = !{!25, !6, !6}
!254 = !DILocalVariable(name: "pk", arg: 1, scope: !251, file: !236, line: 50, type: !6)
!255 = !DILocation(line: 0, scope: !251)
!256 = !DILocalVariable(name: "sk", arg: 2, scope: !251, file: !236, line: 51, type: !6)
!257 = !DILocalVariable(name: "coins", scope: !251, file: !236, line: 53, type: !258)
!258 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 512, elements: !259)
!259 = !{!260}
!260 = !DISubrange(count: 64)
!261 = !DILocation(line: 53, column: 11, scope: !251)
!262 = !DILocation(line: 54, column: 3, scope: !251)
!263 = !DILocation(line: 55, column: 3, scope: !251)
!264 = !DILocation(line: 56, column: 3, scope: !251)
!265 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_enc_derand", scope: !236, file: !236, line: 76, type: !266, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !24)
!266 = !DISubroutineType(types: !267)
!267 = !{!25, !6, !6, !77, !77}
!268 = !DILocalVariable(name: "ct", arg: 1, scope: !265, file: !236, line: 76, type: !6)
!269 = !DILocation(line: 0, scope: !265)
!270 = !DILocalVariable(name: "ss", arg: 2, scope: !265, file: !236, line: 77, type: !6)
!271 = !DILocalVariable(name: "pk", arg: 3, scope: !265, file: !236, line: 78, type: !77)
!272 = !DILocalVariable(name: "coins", arg: 4, scope: !265, file: !236, line: 79, type: !77)
!273 = !DILocalVariable(name: "buf", scope: !265, file: !236, line: 81, type: !258)
!274 = !DILocation(line: 81, column: 11, scope: !265)
!275 = !DILocalVariable(name: "kr", scope: !265, file: !236, line: 83, type: !258)
!276 = !DILocation(line: 83, column: 11, scope: !265)
!277 = !DILocation(line: 85, column: 3, scope: !265)
!278 = !DILocation(line: 88, column: 3, scope: !265)
!279 = !DILocation(line: 89, column: 3, scope: !265)
!280 = !DILocation(line: 92, column: 29, scope: !265)
!281 = !DILocation(line: 92, column: 3, scope: !265)
!282 = !DILocation(line: 94, column: 3, scope: !265)
!283 = !DILocation(line: 95, column: 3, scope: !265)
!284 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_enc", scope: !236, file: !236, line: 113, type: !237, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !24)
!285 = !DILocalVariable(name: "ct", arg: 1, scope: !284, file: !236, line: 113, type: !6)
!286 = !DILocation(line: 0, scope: !284)
!287 = !DILocalVariable(name: "ss", arg: 2, scope: !284, file: !236, line: 114, type: !6)
!288 = !DILocalVariable(name: "pk", arg: 3, scope: !284, file: !236, line: 115, type: !77)
!289 = !DILocalVariable(name: "coins", scope: !284, file: !236, line: 117, type: !128)
!290 = !DILocation(line: 117, column: 11, scope: !284)
!291 = !DILocation(line: 118, column: 3, scope: !284)
!292 = !DILocation(line: 119, column: 3, scope: !284)
!293 = !DILocation(line: 120, column: 3, scope: !284)
!294 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_dec", scope: !236, file: !236, line: 140, type: !295, scopeLine: 143, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !24)
!295 = !DISubroutineType(types: !296)
!296 = !{!25, !6, !77, !77}
!297 = !DILocalVariable(name: "ss", arg: 1, scope: !294, file: !236, line: 140, type: !6)
!298 = !DILocation(line: 0, scope: !294)
!299 = !DILocalVariable(name: "ct", arg: 2, scope: !294, file: !236, line: 141, type: !77)
!300 = !DILocalVariable(name: "sk", arg: 3, scope: !294, file: !236, line: 142, type: !77)
!301 = !DILocalVariable(name: "buf", scope: !294, file: !236, line: 145, type: !258)
!302 = !DILocation(line: 145, column: 11, scope: !294)
!303 = !DILocalVariable(name: "kr", scope: !294, file: !236, line: 147, type: !258)
!304 = !DILocation(line: 147, column: 11, scope: !294)
!305 = !DILocalVariable(name: "cmp", scope: !294, file: !236, line: 149, type: !123)
!306 = !DILocation(line: 149, column: 11, scope: !294)
!307 = !DILocation(line: 150, column: 25, scope: !294)
!308 = !DILocalVariable(name: "pk", scope: !294, file: !236, line: 150, type: !77)
!309 = !DILocation(line: 152, column: 3, scope: !294)
!310 = !DILocation(line: 155, column: 13, scope: !294)
!311 = !DILocation(line: 155, column: 53, scope: !294)
!312 = !DILocation(line: 155, column: 3, scope: !294)
!313 = !DILocation(line: 156, column: 3, scope: !294)
!314 = !DILocation(line: 159, column: 30, scope: !294)
!315 = !DILocation(line: 159, column: 3, scope: !294)
!316 = !DILocation(line: 161, column: 10, scope: !294)
!317 = !DILocalVariable(name: "fail", scope: !294, file: !236, line: 144, type: !25)
!318 = !DILocation(line: 164, column: 3, scope: !294)
!319 = !DILocation(line: 167, column: 29, scope: !294)
!320 = !DILocation(line: 167, column: 3, scope: !294)
!321 = !DILocation(line: 169, column: 3, scope: !294)
!322 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_gen_matrix", scope: !323, file: !323, line: 165, type: !324, scopeLine: 166, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !58, retainedNodes: !24)
!323 = !DIFile(filename: "../../../ref/indcpa.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!324 = !DISubroutineType(types: !325)
!325 = !{null, !326, !77, !25}
!326 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !327, size: 32)
!327 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyvec", file: !328, line: 8, baseType: !329)
!328 = !DIFile(filename: "../../../ref/polyvec.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!329 = !DICompositeType(tag: DW_TAG_array_type, baseType: !330, size: 8192, elements: !335)
!330 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !331, line: 11, baseType: !332)
!331 = !DIFile(filename: "../../../ref/poly.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!332 = !DICompositeType(tag: DW_TAG_array_type, baseType: !36, size: 4096, elements: !333)
!333 = !{!334}
!334 = !DISubrange(count: 256)
!335 = !{!336}
!336 = !DISubrange(count: 2)
!337 = !DILocalVariable(name: "a", arg: 1, scope: !322, file: !323, line: 165, type: !326)
!338 = !DILocation(line: 0, scope: !322)
!339 = !DILocalVariable(name: "seed", arg: 2, scope: !322, file: !323, line: 165, type: !77)
!340 = !DILocalVariable(name: "transposed", arg: 3, scope: !322, file: !323, line: 166, type: !25)
!341 = !DILocalVariable(name: "buf", scope: !322, file: !323, line: 169, type: !342)
!342 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 4032, elements: !343)
!343 = !{!344}
!344 = !DISubrange(count: 504)
!345 = !DILocation(line: 169, column: 11, scope: !322)
!346 = !DILocalVariable(name: "state", scope: !322, file: !323, line: 170, type: !347)
!347 = !DIDerivedType(tag: DW_TAG_typedef, name: "xof_state", file: !348, line: 10, baseType: !349)
!348 = !DIFile(filename: "../../../ref/symmetric.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!349 = !DIDerivedType(tag: DW_TAG_typedef, name: "keccak_state", file: !350, line: 14, baseType: !351)
!350 = !DIFile(filename: "../../../ref/fips202.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!351 = !DICompositeType(tag: DW_TAG_array_type, baseType: !45, size: 1664, elements: !352)
!352 = !{!353}
!353 = !DISubrange(count: 26)
!354 = !DILocation(line: 170, column: 13, scope: !322)
!355 = !DILocalVariable(name: "i", scope: !322, file: !323, line: 167, type: !14)
!356 = !DILocation(line: 172, column: 8, scope: !357)
!357 = distinct !DILexicalBlock(scope: !322, file: !323, line: 172, column: 3)
!358 = !DILocation(line: 172, scope: !357)
!359 = !DILocation(line: 172, column: 17, scope: !360)
!360 = distinct !DILexicalBlock(scope: !357, file: !323, line: 172, column: 3)
!361 = !DILocation(line: 172, column: 3, scope: !357)
!362 = !DILocation(line: 173, column: 5, scope: !363)
!363 = distinct !DILexicalBlock(scope: !364, file: !323, line: 173, column: 5)
!364 = distinct !DILexicalBlock(scope: !360, file: !323, line: 172, column: 33)
!365 = !DILocation(line: 173, scope: !363)
!366 = !DILocalVariable(name: "j", scope: !322, file: !323, line: 167, type: !14)
!367 = !DILocation(line: 173, column: 19, scope: !368)
!368 = distinct !DILexicalBlock(scope: !363, file: !323, line: 173, column: 5)
!369 = !DILocation(line: 174, column: 11, scope: !370)
!370 = distinct !DILexicalBlock(scope: !371, file: !323, line: 174, column: 11)
!371 = distinct !DILexicalBlock(scope: !368, file: !323, line: 173, column: 35)
!372 = !DILocation(line: 175, column: 9, scope: !370)
!373 = !DILocation(line: 177, column: 9, scope: !370)
!374 = !DILocation(line: 179, column: 7, scope: !371)
!375 = !DILocalVariable(name: "buflen", scope: !322, file: !323, line: 168, type: !14)
!376 = !DILocation(line: 181, column: 25, scope: !371)
!377 = !DILocation(line: 181, column: 13, scope: !371)
!378 = !DILocalVariable(name: "ctr", scope: !322, file: !323, line: 167, type: !14)
!379 = !DILocation(line: 183, column: 7, scope: !371)
!380 = !DILocation(line: 0, scope: !371)
!381 = !DILocation(line: 183, column: 18, scope: !371)
!382 = !DILocation(line: 184, column: 9, scope: !383)
!383 = distinct !DILexicalBlock(scope: !371, file: !323, line: 183, column: 29)
!384 = !DILocation(line: 186, column: 28, scope: !383)
!385 = !DILocation(line: 186, column: 36, scope: !383)
!386 = !DILocation(line: 186, column: 51, scope: !383)
!387 = !DILocation(line: 186, column: 16, scope: !383)
!388 = !DILocation(line: 186, column: 13, scope: !383)
!389 = distinct !{!389, !379, !390, !109}
!390 = !DILocation(line: 187, column: 7, scope: !371)
!391 = !DILocation(line: 173, column: 31, scope: !368)
!392 = !DILocation(line: 173, column: 5, scope: !368)
!393 = distinct !{!393, !362, !394, !109}
!394 = !DILocation(line: 188, column: 5, scope: !363)
!395 = !DILocation(line: 172, column: 29, scope: !360)
!396 = !DILocation(line: 172, column: 3, scope: !360)
!397 = distinct !{!397, !361, !398, !109}
!398 = !DILocation(line: 189, column: 3, scope: !357)
!399 = !DILocation(line: 190, column: 1, scope: !322)
!400 = distinct !DISubprogram(name: "rej_uniform", scope: !323, file: !323, line: 122, type: !401, scopeLine: 123, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !58, retainedNodes: !24)
!401 = !DISubroutineType(types: !402)
!402 = !{!14, !403, !14, !77, !14}
!403 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 32)
!404 = !DILocalVariable(name: "r", arg: 1, scope: !400, file: !323, line: 122, type: !403)
!405 = !DILocation(line: 0, scope: !400)
!406 = !DILocalVariable(name: "len", arg: 2, scope: !400, file: !323, line: 122, type: !14)
!407 = !DILocalVariable(name: "buf", arg: 3, scope: !400, file: !323, line: 123, type: !77)
!408 = !DILocalVariable(name: "buflen", arg: 4, scope: !400, file: !323, line: 123, type: !14)
!409 = !DILocalVariable(name: "pos", scope: !400, file: !323, line: 124, type: !14)
!410 = !DILocalVariable(name: "ctr", scope: !400, file: !323, line: 124, type: !14)
!411 = !DILocation(line: 128, column: 3, scope: !400)
!412 = !DILocation(line: 128, column: 14, scope: !400)
!413 = !DILocation(line: 128, column: 20, scope: !400)
!414 = !DILocation(line: 129, column: 14, scope: !415)
!415 = distinct !DILexicalBlock(scope: !400, file: !323, line: 128, column: 42)
!416 = !DILocation(line: 129, column: 46, scope: !415)
!417 = !DILocation(line: 129, column: 36, scope: !415)
!418 = !DILocation(line: 129, column: 59, scope: !415)
!419 = !DILocation(line: 129, column: 66, scope: !415)
!420 = !DILocalVariable(name: "val0", scope: !400, file: !323, line: 125, type: !60)
!421 = !DILocation(line: 130, column: 14, scope: !415)
!422 = !DILocation(line: 130, column: 27, scope: !415)
!423 = !DILocation(line: 130, column: 46, scope: !415)
!424 = !DILocation(line: 130, column: 36, scope: !415)
!425 = !DILocation(line: 130, column: 59, scope: !415)
!426 = !DILocation(line: 130, column: 33, scope: !415)
!427 = !DILocalVariable(name: "val1", scope: !400, file: !323, line: 125, type: !60)
!428 = !DILocation(line: 131, column: 9, scope: !415)
!429 = !DILocation(line: 133, column: 14, scope: !430)
!430 = distinct !DILexicalBlock(scope: !415, file: !323, line: 133, column: 9)
!431 = !DILocation(line: 134, column: 12, scope: !430)
!432 = !DILocation(line: 134, column: 7, scope: !430)
!433 = !DILocation(line: 134, column: 16, scope: !430)
!434 = !DILocation(line: 135, column: 13, scope: !435)
!435 = distinct !DILexicalBlock(scope: !415, file: !323, line: 135, column: 9)
!436 = !DILocation(line: 135, column: 19, scope: !435)
!437 = !DILocation(line: 136, column: 12, scope: !435)
!438 = !DILocation(line: 136, column: 7, scope: !435)
!439 = !DILocation(line: 136, column: 16, scope: !435)
!440 = !DILocation(line: 0, scope: !415)
!441 = distinct !{!441, !411, !442, !109}
!442 = !DILocation(line: 137, column: 3, scope: !400)
!443 = !DILocation(line: 139, column: 3, scope: !400)
!444 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_indcpa_keypair_derand", scope: !323, file: !323, line: 205, type: !445, scopeLine: 207, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !58, retainedNodes: !24)
!445 = !DISubroutineType(types: !446)
!446 = !{null, !6, !6, !77}
!447 = !DILocalVariable(name: "pk", arg: 1, scope: !444, file: !323, line: 205, type: !6)
!448 = !DILocation(line: 0, scope: !444)
!449 = !DILocalVariable(name: "sk", arg: 2, scope: !444, file: !323, line: 206, type: !6)
!450 = !DILocalVariable(name: "coins", arg: 3, scope: !444, file: !323, line: 207, type: !77)
!451 = !DILocalVariable(name: "buf", scope: !444, file: !323, line: 209, type: !258)
!452 = !DILocation(line: 209, column: 11, scope: !444)
!453 = !DILocalVariable(name: "publicseed", scope: !444, file: !323, line: 210, type: !77)
!454 = !DILocation(line: 211, column: 34, scope: !444)
!455 = !DILocalVariable(name: "noiseseed", scope: !444, file: !323, line: 211, type: !77)
!456 = !DILocalVariable(name: "nonce", scope: !444, file: !323, line: 212, type: !7)
!457 = !DILocalVariable(name: "a", scope: !444, file: !323, line: 213, type: !458)
!458 = !DICompositeType(tag: DW_TAG_array_type, baseType: !327, size: 16384, elements: !335)
!459 = !DILocation(line: 213, column: 11, scope: !444)
!460 = !DILocalVariable(name: "e", scope: !444, file: !323, line: 213, type: !327)
!461 = !DILocation(line: 213, column: 23, scope: !444)
!462 = !DILocalVariable(name: "pkpv", scope: !444, file: !323, line: 213, type: !327)
!463 = !DILocation(line: 213, column: 26, scope: !444)
!464 = !DILocalVariable(name: "skpv", scope: !444, file: !323, line: 213, type: !327)
!465 = !DILocation(line: 213, column: 32, scope: !444)
!466 = !DILocation(line: 215, column: 3, scope: !444)
!467 = !DILocation(line: 216, column: 3, scope: !444)
!468 = !DILocation(line: 216, column: 23, scope: !444)
!469 = !DILocation(line: 217, column: 3, scope: !444)
!470 = !DILocation(line: 219, column: 3, scope: !444)
!471 = !DILocalVariable(name: "i", scope: !444, file: !323, line: 208, type: !14)
!472 = !DILocation(line: 221, column: 8, scope: !473)
!473 = distinct !DILexicalBlock(scope: !444, file: !323, line: 221, column: 3)
!474 = !DILocation(line: 221, scope: !473)
!475 = !DILocation(line: 221, column: 17, scope: !476)
!476 = distinct !DILexicalBlock(scope: !473, file: !323, line: 221, column: 3)
!477 = !DILocation(line: 221, column: 3, scope: !473)
!478 = !DILocation(line: 223, column: 3, scope: !479)
!479 = distinct !DILexicalBlock(scope: !444, file: !323, line: 223, column: 3)
!480 = !DILocation(line: 222, column: 25, scope: !476)
!481 = !DILocation(line: 222, column: 5, scope: !476)
!482 = !DILocation(line: 222, column: 50, scope: !476)
!483 = !DILocation(line: 221, column: 29, scope: !476)
!484 = !DILocation(line: 221, column: 3, scope: !476)
!485 = distinct !{!485, !477, !486, !109}
!486 = !DILocation(line: 222, column: 52, scope: !473)
!487 = !DILocation(line: 223, scope: !479)
!488 = !DILocation(line: 223, column: 17, scope: !489)
!489 = distinct !DILexicalBlock(scope: !479, file: !323, line: 223, column: 3)
!490 = !DILocation(line: 224, column: 25, scope: !489)
!491 = !DILocation(line: 224, column: 5, scope: !489)
!492 = !DILocation(line: 224, column: 47, scope: !489)
!493 = !DILocation(line: 223, column: 29, scope: !489)
!494 = !DILocation(line: 223, column: 3, scope: !489)
!495 = distinct !{!495, !478, !496, !109}
!496 = !DILocation(line: 224, column: 49, scope: !479)
!497 = !DILocation(line: 226, column: 3, scope: !444)
!498 = !DILocation(line: 227, column: 3, scope: !444)
!499 = !DILocation(line: 230, column: 8, scope: !500)
!500 = distinct !DILexicalBlock(scope: !444, file: !323, line: 230, column: 3)
!501 = !DILocation(line: 230, scope: !500)
!502 = !DILocation(line: 230, column: 17, scope: !503)
!503 = distinct !DILexicalBlock(scope: !500, file: !323, line: 230, column: 3)
!504 = !DILocation(line: 230, column: 3, scope: !500)
!505 = !DILocation(line: 231, column: 37, scope: !506)
!506 = distinct !DILexicalBlock(scope: !503, file: !323, line: 230, column: 33)
!507 = !DILocation(line: 231, column: 47, scope: !506)
!508 = !DILocation(line: 231, column: 5, scope: !506)
!509 = !DILocation(line: 232, column: 18, scope: !506)
!510 = !DILocation(line: 232, column: 5, scope: !506)
!511 = !DILocation(line: 230, column: 29, scope: !503)
!512 = !DILocation(line: 230, column: 3, scope: !503)
!513 = distinct !{!513, !504, !514, !109}
!514 = !DILocation(line: 233, column: 3, scope: !500)
!515 = !DILocation(line: 235, column: 3, scope: !444)
!516 = !DILocation(line: 236, column: 3, scope: !444)
!517 = !DILocation(line: 238, column: 3, scope: !444)
!518 = !DILocation(line: 239, column: 3, scope: !444)
!519 = !DILocation(line: 240, column: 1, scope: !444)
!520 = distinct !DISubprogram(name: "pack_sk", scope: !323, file: !323, line: 55, type: !521, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !58, retainedNodes: !24)
!521 = !DISubroutineType(types: !522)
!522 = !{null, !6, !326}
!523 = !DILocalVariable(name: "r", arg: 1, scope: !520, file: !323, line: 55, type: !6)
!524 = !DILocation(line: 0, scope: !520)
!525 = !DILocalVariable(name: "sk", arg: 2, scope: !520, file: !323, line: 55, type: !326)
!526 = !DILocation(line: 56, column: 3, scope: !520)
!527 = !DILocation(line: 57, column: 1, scope: !520)
!528 = distinct !DISubprogram(name: "pack_pk", scope: !323, file: !323, line: 23, type: !529, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !58, retainedNodes: !24)
!529 = !DISubroutineType(types: !530)
!530 = !{null, !6, !326, !77}
!531 = !DILocalVariable(name: "r", arg: 1, scope: !528, file: !323, line: 23, type: !6)
!532 = !DILocation(line: 0, scope: !528)
!533 = !DILocalVariable(name: "pk", arg: 2, scope: !528, file: !323, line: 23, type: !326)
!534 = !DILocalVariable(name: "seed", arg: 3, scope: !528, file: !323, line: 24, type: !77)
!535 = !DILocation(line: 25, column: 3, scope: !528)
!536 = !DILocation(line: 26, column: 12, scope: !528)
!537 = !DILocation(line: 26, column: 3, scope: !528)
!538 = !DILocation(line: 27, column: 1, scope: !528)
!539 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_indcpa_enc", scope: !323, file: !323, line: 257, type: !540, scopeLine: 260, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !58, retainedNodes: !24)
!540 = !DISubroutineType(types: !541)
!541 = !{null, !6, !77, !77, !77}
!542 = !DILocalVariable(name: "c", arg: 1, scope: !539, file: !323, line: 257, type: !6)
!543 = !DILocation(line: 0, scope: !539)
!544 = !DILocalVariable(name: "m", arg: 2, scope: !539, file: !323, line: 258, type: !77)
!545 = !DILocalVariable(name: "pk", arg: 3, scope: !539, file: !323, line: 259, type: !77)
!546 = !DILocalVariable(name: "coins", arg: 4, scope: !539, file: !323, line: 260, type: !77)
!547 = !DILocalVariable(name: "seed", scope: !539, file: !323, line: 262, type: !128)
!548 = !DILocation(line: 262, column: 11, scope: !539)
!549 = !DILocalVariable(name: "nonce", scope: !539, file: !323, line: 263, type: !7)
!550 = !DILocalVariable(name: "sp", scope: !539, file: !323, line: 264, type: !327)
!551 = !DILocation(line: 264, column: 11, scope: !539)
!552 = !DILocalVariable(name: "pkpv", scope: !539, file: !323, line: 264, type: !327)
!553 = !DILocation(line: 264, column: 15, scope: !539)
!554 = !DILocalVariable(name: "ep", scope: !539, file: !323, line: 264, type: !327)
!555 = !DILocation(line: 264, column: 21, scope: !539)
!556 = !DILocalVariable(name: "at", scope: !539, file: !323, line: 264, type: !458)
!557 = !DILocation(line: 264, column: 25, scope: !539)
!558 = !DILocalVariable(name: "b", scope: !539, file: !323, line: 264, type: !327)
!559 = !DILocation(line: 264, column: 38, scope: !539)
!560 = !DILocalVariable(name: "v", scope: !539, file: !323, line: 265, type: !330)
!561 = !DILocation(line: 265, column: 8, scope: !539)
!562 = !DILocalVariable(name: "k", scope: !539, file: !323, line: 265, type: !330)
!563 = !DILocation(line: 265, column: 11, scope: !539)
!564 = !DILocalVariable(name: "epp", scope: !539, file: !323, line: 265, type: !330)
!565 = !DILocation(line: 265, column: 14, scope: !539)
!566 = !DILocation(line: 267, column: 3, scope: !539)
!567 = !DILocation(line: 268, column: 3, scope: !539)
!568 = !DILocation(line: 269, column: 3, scope: !539)
!569 = !DILocalVariable(name: "i", scope: !539, file: !323, line: 261, type: !14)
!570 = !DILocation(line: 271, column: 8, scope: !571)
!571 = distinct !DILexicalBlock(scope: !539, file: !323, line: 271, column: 3)
!572 = !DILocation(line: 271, scope: !571)
!573 = !DILocation(line: 271, column: 17, scope: !574)
!574 = distinct !DILexicalBlock(scope: !571, file: !323, line: 271, column: 3)
!575 = !DILocation(line: 271, column: 3, scope: !571)
!576 = !DILocation(line: 273, column: 3, scope: !577)
!577 = distinct !DILexicalBlock(scope: !539, file: !323, line: 273, column: 3)
!578 = !DILocation(line: 272, column: 27, scope: !574)
!579 = !DILocation(line: 272, column: 5, scope: !574)
!580 = !DILocation(line: 272, column: 44, scope: !574)
!581 = !DILocation(line: 271, column: 29, scope: !574)
!582 = !DILocation(line: 271, column: 3, scope: !574)
!583 = distinct !{!583, !575, !584, !109}
!584 = !DILocation(line: 272, column: 46, scope: !571)
!585 = !DILocation(line: 273, scope: !577)
!586 = !DILocation(line: 273, column: 17, scope: !587)
!587 = distinct !DILexicalBlock(scope: !577, file: !323, line: 273, column: 3)
!588 = !DILocation(line: 274, column: 27, scope: !587)
!589 = !DILocation(line: 274, column: 5, scope: !587)
!590 = !DILocation(line: 274, column: 44, scope: !587)
!591 = !DILocation(line: 273, column: 29, scope: !587)
!592 = !DILocation(line: 273, column: 3, scope: !587)
!593 = distinct !{!593, !576, !594, !109}
!594 = !DILocation(line: 274, column: 46, scope: !577)
!595 = !DILocation(line: 275, column: 3, scope: !539)
!596 = !DILocation(line: 277, column: 3, scope: !539)
!597 = !DILocation(line: 280, column: 8, scope: !598)
!598 = distinct !DILexicalBlock(scope: !539, file: !323, line: 280, column: 3)
!599 = !DILocation(line: 280, scope: !598)
!600 = !DILocation(line: 280, column: 17, scope: !601)
!601 = distinct !DILexicalBlock(scope: !598, file: !323, line: 280, column: 3)
!602 = !DILocation(line: 280, column: 3, scope: !598)
!603 = !DILocation(line: 281, column: 37, scope: !601)
!604 = !DILocation(line: 281, column: 44, scope: !601)
!605 = !DILocation(line: 281, column: 5, scope: !601)
!606 = !DILocation(line: 280, column: 29, scope: !601)
!607 = !DILocation(line: 280, column: 3, scope: !601)
!608 = distinct !{!608, !602, !609, !109}
!609 = !DILocation(line: 281, column: 54, scope: !598)
!610 = !DILocation(line: 283, column: 3, scope: !539)
!611 = !DILocation(line: 285, column: 3, scope: !539)
!612 = !DILocation(line: 286, column: 3, scope: !539)
!613 = !DILocation(line: 288, column: 3, scope: !539)
!614 = !DILocation(line: 289, column: 3, scope: !539)
!615 = !DILocation(line: 290, column: 3, scope: !539)
!616 = !DILocation(line: 291, column: 3, scope: !539)
!617 = !DILocation(line: 292, column: 3, scope: !539)
!618 = !DILocation(line: 294, column: 3, scope: !539)
!619 = !DILocation(line: 295, column: 1, scope: !539)
!620 = distinct !DISubprogram(name: "unpack_pk", scope: !323, file: !323, line: 40, type: !621, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !58, retainedNodes: !24)
!621 = !DISubroutineType(types: !622)
!622 = !{null, !326, !6, !77}
!623 = !DILocalVariable(name: "pk", arg: 1, scope: !620, file: !323, line: 40, type: !326)
!624 = !DILocation(line: 0, scope: !620)
!625 = !DILocalVariable(name: "seed", arg: 2, scope: !620, file: !323, line: 40, type: !6)
!626 = !DILocalVariable(name: "packedpk", arg: 3, scope: !620, file: !323, line: 41, type: !77)
!627 = !DILocation(line: 42, column: 3, scope: !620)
!628 = !DILocation(line: 43, column: 25, scope: !620)
!629 = !DILocation(line: 43, column: 3, scope: !620)
!630 = !DILocation(line: 44, column: 1, scope: !620)
!631 = distinct !DISubprogram(name: "pack_ciphertext", scope: !323, file: !323, line: 85, type: !632, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !58, retainedNodes: !24)
!632 = !DISubroutineType(types: !633)
!633 = !{null, !6, !326, !634}
!634 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !330, size: 32)
!635 = !DILocalVariable(name: "r", arg: 1, scope: !631, file: !323, line: 85, type: !6)
!636 = !DILocation(line: 0, scope: !631)
!637 = !DILocalVariable(name: "b", arg: 2, scope: !631, file: !323, line: 85, type: !326)
!638 = !DILocalVariable(name: "v", arg: 3, scope: !631, file: !323, line: 86, type: !634)
!639 = !DILocation(line: 87, column: 3, scope: !631)
!640 = !DILocation(line: 88, column: 19, scope: !631)
!641 = !DILocation(line: 88, column: 3, scope: !631)
!642 = !DILocation(line: 89, column: 1, scope: !631)
!643 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_indcpa_dec", scope: !323, file: !323, line: 310, type: !644, scopeLine: 312, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !58, retainedNodes: !24)
!644 = !DISubroutineType(types: !645)
!645 = !{null, !6, !77, !77}
!646 = !DILocalVariable(name: "m", arg: 1, scope: !643, file: !323, line: 310, type: !6)
!647 = !DILocation(line: 0, scope: !643)
!648 = !DILocalVariable(name: "c", arg: 2, scope: !643, file: !323, line: 311, type: !77)
!649 = !DILocalVariable(name: "sk", arg: 3, scope: !643, file: !323, line: 312, type: !77)
!650 = !DILocalVariable(name: "b", scope: !643, file: !323, line: 313, type: !327)
!651 = !DILocation(line: 313, column: 11, scope: !643)
!652 = !DILocalVariable(name: "skpv", scope: !643, file: !323, line: 313, type: !327)
!653 = !DILocation(line: 313, column: 14, scope: !643)
!654 = !DILocalVariable(name: "v", scope: !643, file: !323, line: 314, type: !330)
!655 = !DILocation(line: 314, column: 8, scope: !643)
!656 = !DILocalVariable(name: "mp", scope: !643, file: !323, line: 314, type: !330)
!657 = !DILocation(line: 314, column: 11, scope: !643)
!658 = !DILocation(line: 316, column: 3, scope: !643)
!659 = !DILocation(line: 317, column: 3, scope: !643)
!660 = !DILocation(line: 319, column: 3, scope: !643)
!661 = !DILocation(line: 320, column: 3, scope: !643)
!662 = !DILocation(line: 321, column: 3, scope: !643)
!663 = !DILocation(line: 323, column: 3, scope: !643)
!664 = !DILocation(line: 324, column: 3, scope: !643)
!665 = !DILocation(line: 326, column: 3, scope: !643)
!666 = !DILocation(line: 327, column: 1, scope: !643)
!667 = distinct !DISubprogram(name: "unpack_ciphertext", scope: !323, file: !323, line: 101, type: !668, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !58, retainedNodes: !24)
!668 = !DISubroutineType(types: !669)
!669 = !{null, !326, !634, !77}
!670 = !DILocalVariable(name: "b", arg: 1, scope: !667, file: !323, line: 101, type: !326)
!671 = !DILocation(line: 0, scope: !667)
!672 = !DILocalVariable(name: "v", arg: 2, scope: !667, file: !323, line: 101, type: !634)
!673 = !DILocalVariable(name: "c", arg: 3, scope: !667, file: !323, line: 102, type: !77)
!674 = !DILocation(line: 103, column: 3, scope: !667)
!675 = !DILocation(line: 104, column: 24, scope: !667)
!676 = !DILocation(line: 104, column: 3, scope: !667)
!677 = !DILocation(line: 105, column: 1, scope: !667)
!678 = distinct !DISubprogram(name: "unpack_sk", scope: !323, file: !323, line: 69, type: !679, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !58, retainedNodes: !24)
!679 = !DISubroutineType(types: !680)
!680 = !{null, !326, !77}
!681 = !DILocalVariable(name: "sk", arg: 1, scope: !678, file: !323, line: 69, type: !326)
!682 = !DILocation(line: 0, scope: !678)
!683 = !DILocalVariable(name: "packedsk", arg: 2, scope: !678, file: !323, line: 70, type: !77)
!684 = !DILocation(line: 71, column: 3, scope: !678)
!685 = !DILocation(line: 72, column: 1, scope: !678)
!686 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_compress", scope: !687, file: !687, line: 15, type: !688, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!687 = !DIFile(filename: "../../../ref/polyvec.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!688 = !DISubroutineType(types: !689)
!689 = !{null, !6, !690}
!690 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !691, size: 32)
!691 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !327)
!692 = !DILocalVariable(name: "r", arg: 1, scope: !686, file: !687, line: 15, type: !6)
!693 = !DILocation(line: 0, scope: !686)
!694 = !DILocalVariable(name: "a", arg: 2, scope: !686, file: !687, line: 16, type: !690)
!695 = !DILocalVariable(name: "t", scope: !686, file: !687, line: 52, type: !696)
!696 = !DICompositeType(tag: DW_TAG_array_type, baseType: !60, size: 64, elements: !697)
!697 = !{!698}
!698 = !DISubrange(count: 4)
!699 = !DILocation(line: 52, column: 12, scope: !686)
!700 = !DILocalVariable(name: "i", scope: !686, file: !687, line: 17, type: !14)
!701 = !DILocation(line: 53, column: 8, scope: !702)
!702 = distinct !DILexicalBlock(scope: !686, file: !687, line: 53, column: 3)
!703 = !DILocation(line: 53, scope: !702)
!704 = !DILocation(line: 53, column: 17, scope: !705)
!705 = distinct !DILexicalBlock(scope: !702, file: !687, line: 53, column: 3)
!706 = !DILocation(line: 53, column: 3, scope: !702)
!707 = !DILocation(line: 54, column: 5, scope: !708)
!708 = distinct !DILexicalBlock(scope: !709, file: !687, line: 54, column: 5)
!709 = distinct !DILexicalBlock(scope: !705, file: !687, line: 53, column: 33)
!710 = !DILocation(line: 54, scope: !708)
!711 = !DILocalVariable(name: "j", scope: !686, file: !687, line: 17, type: !14)
!712 = !DILocation(line: 54, column: 19, scope: !713)
!713 = distinct !DILexicalBlock(scope: !708, file: !687, line: 54, column: 5)
!714 = !DILocation(line: 55, column: 7, scope: !715)
!715 = distinct !DILexicalBlock(scope: !716, file: !687, line: 55, column: 7)
!716 = distinct !DILexicalBlock(scope: !713, file: !687, line: 54, column: 39)
!717 = !DILocation(line: 55, scope: !715)
!718 = !DILocalVariable(name: "k", scope: !686, file: !687, line: 17, type: !14)
!719 = !DILocation(line: 55, column: 21, scope: !720)
!720 = distinct !DILexicalBlock(scope: !715, file: !687, line: 55, column: 7)
!721 = !DILocation(line: 56, column: 26, scope: !722)
!722 = distinct !DILexicalBlock(scope: !720, file: !687, line: 55, column: 31)
!723 = !DILocation(line: 56, column: 30, scope: !722)
!724 = !DILocation(line: 56, column: 16, scope: !722)
!725 = !DILocation(line: 57, column: 39, scope: !722)
!726 = !DILocation(line: 57, column: 9, scope: !722)
!727 = !DILocation(line: 57, column: 14, scope: !722)
!728 = !DILocation(line: 60, column: 14, scope: !722)
!729 = !DILocalVariable(name: "d0", scope: !686, file: !687, line: 18, type: !45)
!730 = !DILocation(line: 63, column: 12, scope: !722)
!731 = !DILocation(line: 64, column: 12, scope: !722)
!732 = !DILocation(line: 65, column: 16, scope: !722)
!733 = !DILocation(line: 65, column: 9, scope: !722)
!734 = !DILocation(line: 65, column: 14, scope: !722)
!735 = !DILocation(line: 55, column: 27, scope: !720)
!736 = !DILocation(line: 55, column: 7, scope: !720)
!737 = distinct !{!737, !714, !738, !109}
!738 = !DILocation(line: 66, column: 7, scope: !715)
!739 = !DILocation(line: 68, column: 15, scope: !716)
!740 = !DILocation(line: 68, column: 14, scope: !716)
!741 = !DILocation(line: 68, column: 12, scope: !716)
!742 = !DILocation(line: 69, column: 15, scope: !716)
!743 = !DILocation(line: 69, column: 20, scope: !716)
!744 = !DILocation(line: 69, column: 29, scope: !716)
!745 = !DILocation(line: 69, column: 34, scope: !716)
!746 = !DILocation(line: 69, column: 26, scope: !716)
!747 = !DILocation(line: 69, column: 7, scope: !716)
!748 = !DILocation(line: 69, column: 12, scope: !716)
!749 = !DILocation(line: 70, column: 15, scope: !716)
!750 = !DILocation(line: 70, column: 20, scope: !716)
!751 = !DILocation(line: 70, column: 29, scope: !716)
!752 = !DILocation(line: 70, column: 34, scope: !716)
!753 = !DILocation(line: 70, column: 26, scope: !716)
!754 = !DILocation(line: 70, column: 7, scope: !716)
!755 = !DILocation(line: 70, column: 12, scope: !716)
!756 = !DILocation(line: 71, column: 15, scope: !716)
!757 = !DILocation(line: 71, column: 20, scope: !716)
!758 = !DILocation(line: 71, column: 29, scope: !716)
!759 = !DILocation(line: 71, column: 34, scope: !716)
!760 = !DILocation(line: 71, column: 26, scope: !716)
!761 = !DILocation(line: 71, column: 7, scope: !716)
!762 = !DILocation(line: 71, column: 12, scope: !716)
!763 = !DILocation(line: 72, column: 15, scope: !716)
!764 = !DILocation(line: 72, column: 20, scope: !716)
!765 = !DILocation(line: 72, column: 14, scope: !716)
!766 = !DILocation(line: 72, column: 7, scope: !716)
!767 = !DILocation(line: 72, column: 12, scope: !716)
!768 = !DILocation(line: 73, column: 9, scope: !716)
!769 = !DILocation(line: 54, column: 35, scope: !713)
!770 = !DILocation(line: 54, column: 5, scope: !713)
!771 = distinct !{!771, !707, !772, !109}
!772 = !DILocation(line: 74, column: 5, scope: !708)
!773 = !DILocation(line: 53, column: 29, scope: !705)
!774 = !DILocation(line: 53, column: 3, scope: !705)
!775 = distinct !{!775, !706, !776, !109}
!776 = !DILocation(line: 75, column: 3, scope: !702)
!777 = !DILocation(line: 79, column: 1, scope: !686)
!778 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_decompress", scope: !687, file: !687, line: 91, type: !679, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!779 = !DILocalVariable(name: "r", arg: 1, scope: !778, file: !687, line: 91, type: !326)
!780 = !DILocation(line: 0, scope: !778)
!781 = !DILocalVariable(name: "a", arg: 2, scope: !778, file: !687, line: 92, type: !77)
!782 = !DILocalVariable(name: "t", scope: !778, file: !687, line: 114, type: !696)
!783 = !DILocation(line: 114, column: 12, scope: !778)
!784 = !DILocalVariable(name: "i", scope: !778, file: !687, line: 93, type: !14)
!785 = !DILocation(line: 115, column: 8, scope: !786)
!786 = distinct !DILexicalBlock(scope: !778, file: !687, line: 115, column: 3)
!787 = !DILocation(line: 115, scope: !786)
!788 = !DILocation(line: 115, column: 17, scope: !789)
!789 = distinct !DILexicalBlock(scope: !786, file: !687, line: 115, column: 3)
!790 = !DILocation(line: 115, column: 3, scope: !786)
!791 = !DILocation(line: 116, column: 5, scope: !792)
!792 = distinct !DILexicalBlock(scope: !793, file: !687, line: 116, column: 5)
!793 = distinct !DILexicalBlock(scope: !789, file: !687, line: 115, column: 33)
!794 = !DILocation(line: 116, scope: !792)
!795 = !DILocalVariable(name: "j", scope: !778, file: !687, line: 93, type: !14)
!796 = !DILocation(line: 116, column: 19, scope: !797)
!797 = distinct !DILexicalBlock(scope: !792, file: !687, line: 116, column: 5)
!798 = !DILocation(line: 117, column: 15, scope: !799)
!799 = distinct !DILexicalBlock(scope: !797, file: !687, line: 116, column: 39)
!800 = !DILocation(line: 117, column: 39, scope: !799)
!801 = !DILocation(line: 117, column: 29, scope: !799)
!802 = !DILocation(line: 117, column: 44, scope: !799)
!803 = !DILocation(line: 117, column: 26, scope: !799)
!804 = !DILocation(line: 117, column: 12, scope: !799)
!805 = !DILocation(line: 118, column: 15, scope: !799)
!806 = !DILocation(line: 118, column: 20, scope: !799)
!807 = !DILocation(line: 118, column: 39, scope: !799)
!808 = !DILocation(line: 118, column: 29, scope: !799)
!809 = !DILocation(line: 118, column: 44, scope: !799)
!810 = !DILocation(line: 118, column: 26, scope: !799)
!811 = !DILocation(line: 118, column: 7, scope: !799)
!812 = !DILocation(line: 118, column: 12, scope: !799)
!813 = !DILocation(line: 119, column: 15, scope: !799)
!814 = !DILocation(line: 119, column: 20, scope: !799)
!815 = !DILocation(line: 119, column: 39, scope: !799)
!816 = !DILocation(line: 119, column: 29, scope: !799)
!817 = !DILocation(line: 119, column: 44, scope: !799)
!818 = !DILocation(line: 119, column: 26, scope: !799)
!819 = !DILocation(line: 119, column: 7, scope: !799)
!820 = !DILocation(line: 119, column: 12, scope: !799)
!821 = !DILocation(line: 120, column: 15, scope: !799)
!822 = !DILocation(line: 120, column: 20, scope: !799)
!823 = !DILocation(line: 120, column: 39, scope: !799)
!824 = !DILocation(line: 120, column: 29, scope: !799)
!825 = !DILocation(line: 120, column: 44, scope: !799)
!826 = !DILocation(line: 120, column: 26, scope: !799)
!827 = !DILocation(line: 120, column: 7, scope: !799)
!828 = !DILocation(line: 120, column: 12, scope: !799)
!829 = !DILocalVariable(name: "k", scope: !778, file: !687, line: 93, type: !14)
!830 = !DILocation(line: 123, column: 12, scope: !831)
!831 = distinct !DILexicalBlock(scope: !799, file: !687, line: 123, column: 7)
!832 = !DILocation(line: 123, scope: !831)
!833 = !DILocation(line: 123, column: 21, scope: !834)
!834 = distinct !DILexicalBlock(scope: !831, file: !687, line: 123, column: 7)
!835 = !DILocation(line: 123, column: 7, scope: !831)
!836 = !DILocation(line: 124, column: 42, scope: !834)
!837 = !DILocation(line: 124, column: 47, scope: !834)
!838 = !DILocation(line: 124, column: 56, scope: !834)
!839 = !DILocation(line: 124, column: 66, scope: !834)
!840 = !DILocation(line: 124, column: 73, scope: !834)
!841 = !DILocation(line: 124, column: 30, scope: !834)
!842 = !DILocation(line: 124, column: 19, scope: !834)
!843 = !DILocation(line: 124, column: 23, scope: !834)
!844 = !DILocation(line: 124, column: 9, scope: !834)
!845 = !DILocation(line: 124, column: 28, scope: !834)
!846 = !DILocation(line: 123, column: 27, scope: !834)
!847 = !DILocation(line: 123, column: 7, scope: !834)
!848 = distinct !{!848, !835, !849, !109}
!849 = !DILocation(line: 124, column: 76, scope: !831)
!850 = !DILocation(line: 121, column: 9, scope: !799)
!851 = !DILocation(line: 116, column: 35, scope: !797)
!852 = !DILocation(line: 116, column: 5, scope: !797)
!853 = distinct !{!853, !791, !854, !109}
!854 = !DILocation(line: 125, column: 5, scope: !792)
!855 = !DILocation(line: 115, column: 29, scope: !789)
!856 = !DILocation(line: 115, column: 3, scope: !789)
!857 = distinct !{!857, !790, !858, !109}
!858 = !DILocation(line: 126, column: 3, scope: !786)
!859 = !DILocation(line: 130, column: 1, scope: !778)
!860 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_tobytes", scope: !687, file: !687, line: 141, type: !688, scopeLine: 141, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!861 = !DILocalVariable(name: "r", arg: 1, scope: !860, file: !687, line: 141, type: !6)
!862 = !DILocation(line: 0, scope: !860)
!863 = !DILocalVariable(name: "a", arg: 2, scope: !860, file: !687, line: 141, type: !690)
!864 = !DILocalVariable(name: "i", scope: !860, file: !687, line: 142, type: !14)
!865 = !DILocation(line: 143, column: 8, scope: !866)
!866 = distinct !DILexicalBlock(scope: !860, file: !687, line: 143, column: 3)
!867 = !DILocation(line: 143, scope: !866)
!868 = !DILocation(line: 143, column: 17, scope: !869)
!869 = distinct !DILexicalBlock(scope: !866, file: !687, line: 143, column: 3)
!870 = !DILocation(line: 143, column: 3, scope: !866)
!871 = !DILocation(line: 144, column: 24, scope: !869)
!872 = !DILocation(line: 144, column: 20, scope: !869)
!873 = !DILocation(line: 144, column: 44, scope: !869)
!874 = !DILocation(line: 144, column: 5, scope: !869)
!875 = !DILocation(line: 143, column: 29, scope: !869)
!876 = !DILocation(line: 143, column: 3, scope: !869)
!877 = distinct !{!877, !870, !878, !109}
!878 = !DILocation(line: 144, column: 51, scope: !866)
!879 = !DILocation(line: 145, column: 1, scope: !860)
!880 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_frombytes", scope: !687, file: !687, line: 157, type: !679, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!881 = !DILocalVariable(name: "r", arg: 1, scope: !880, file: !687, line: 157, type: !326)
!882 = !DILocation(line: 0, scope: !880)
!883 = !DILocalVariable(name: "a", arg: 2, scope: !880, file: !687, line: 157, type: !77)
!884 = !DILocalVariable(name: "i", scope: !880, file: !687, line: 158, type: !14)
!885 = !DILocation(line: 159, column: 8, scope: !886)
!886 = distinct !DILexicalBlock(scope: !880, file: !687, line: 159, column: 3)
!887 = !DILocation(line: 159, scope: !886)
!888 = !DILocation(line: 159, column: 17, scope: !889)
!889 = distinct !DILexicalBlock(scope: !886, file: !687, line: 159, column: 3)
!890 = !DILocation(line: 159, column: 3, scope: !886)
!891 = !DILocation(line: 160, column: 21, scope: !889)
!892 = !DILocation(line: 160, column: 36, scope: !889)
!893 = !DILocation(line: 160, column: 32, scope: !889)
!894 = !DILocation(line: 160, column: 5, scope: !889)
!895 = !DILocation(line: 159, column: 29, scope: !889)
!896 = !DILocation(line: 159, column: 3, scope: !889)
!897 = distinct !{!897, !890, !898, !109}
!898 = !DILocation(line: 160, column: 53, scope: !886)
!899 = !DILocation(line: 161, column: 1, scope: !880)
!900 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_ntt", scope: !687, file: !687, line: 170, type: !901, scopeLine: 170, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!901 = !DISubroutineType(types: !902)
!902 = !{null, !326}
!903 = !DILocalVariable(name: "r", arg: 1, scope: !900, file: !687, line: 170, type: !326)
!904 = !DILocation(line: 0, scope: !900)
!905 = !DILocalVariable(name: "i", scope: !900, file: !687, line: 171, type: !14)
!906 = !DILocation(line: 172, column: 8, scope: !907)
!907 = distinct !DILexicalBlock(scope: !900, file: !687, line: 172, column: 3)
!908 = !DILocation(line: 172, scope: !907)
!909 = !DILocation(line: 172, column: 17, scope: !910)
!910 = distinct !DILexicalBlock(scope: !907, file: !687, line: 172, column: 3)
!911 = !DILocation(line: 172, column: 3, scope: !907)
!912 = !DILocation(line: 173, column: 15, scope: !910)
!913 = !DILocation(line: 173, column: 5, scope: !910)
!914 = !DILocation(line: 172, column: 29, scope: !910)
!915 = !DILocation(line: 172, column: 3, scope: !910)
!916 = distinct !{!916, !911, !917, !109}
!917 = !DILocation(line: 173, column: 22, scope: !907)
!918 = !DILocation(line: 174, column: 1, scope: !900)
!919 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_invntt_tomont", scope: !687, file: !687, line: 184, type: !901, scopeLine: 184, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!920 = !DILocalVariable(name: "r", arg: 1, scope: !919, file: !687, line: 184, type: !326)
!921 = !DILocation(line: 0, scope: !919)
!922 = !DILocalVariable(name: "i", scope: !919, file: !687, line: 185, type: !14)
!923 = !DILocation(line: 186, column: 8, scope: !924)
!924 = distinct !DILexicalBlock(scope: !919, file: !687, line: 186, column: 3)
!925 = !DILocation(line: 186, scope: !924)
!926 = !DILocation(line: 186, column: 17, scope: !927)
!927 = distinct !DILexicalBlock(scope: !924, file: !687, line: 186, column: 3)
!928 = !DILocation(line: 186, column: 3, scope: !924)
!929 = !DILocation(line: 187, column: 25, scope: !927)
!930 = !DILocation(line: 187, column: 5, scope: !927)
!931 = !DILocation(line: 186, column: 29, scope: !927)
!932 = !DILocation(line: 186, column: 3, scope: !927)
!933 = distinct !{!933, !928, !934, !109}
!934 = !DILocation(line: 187, column: 32, scope: !924)
!935 = !DILocation(line: 188, column: 1, scope: !919)
!936 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery", scope: !687, file: !687, line: 200, type: !937, scopeLine: 201, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!937 = !DISubroutineType(types: !938)
!938 = !{null, !634, !690, !690}
!939 = !DILocalVariable(name: "r", arg: 1, scope: !936, file: !687, line: 200, type: !634)
!940 = !DILocation(line: 0, scope: !936)
!941 = !DILocalVariable(name: "a", arg: 2, scope: !936, file: !687, line: 200, type: !690)
!942 = !DILocalVariable(name: "b", arg: 3, scope: !936, file: !687, line: 201, type: !690)
!943 = !DILocalVariable(name: "t", scope: !936, file: !687, line: 203, type: !330)
!944 = !DILocation(line: 203, column: 8, scope: !936)
!945 = !DILocation(line: 205, column: 3, scope: !936)
!946 = !DILocalVariable(name: "i", scope: !936, file: !687, line: 202, type: !14)
!947 = !DILocation(line: 207, column: 34, scope: !948)
!948 = distinct !DILexicalBlock(scope: !949, file: !687, line: 206, column: 33)
!949 = distinct !DILexicalBlock(scope: !950, file: !687, line: 206, column: 3)
!950 = distinct !DILexicalBlock(scope: !936, file: !687, line: 206, column: 3)
!951 = !DILocation(line: 207, column: 44, scope: !948)
!952 = !DILocation(line: 207, column: 5, scope: !948)
!953 = !DILocation(line: 208, column: 5, scope: !948)
!954 = !DILocation(line: 211, column: 3, scope: !936)
!955 = !DILocation(line: 212, column: 1, scope: !936)
!956 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_reduce", scope: !687, file: !687, line: 223, type: !901, scopeLine: 223, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!957 = !DILocalVariable(name: "r", arg: 1, scope: !956, file: !687, line: 223, type: !326)
!958 = !DILocation(line: 0, scope: !956)
!959 = !DILocalVariable(name: "i", scope: !956, file: !687, line: 224, type: !14)
!960 = !DILocation(line: 225, column: 8, scope: !961)
!961 = distinct !DILexicalBlock(scope: !956, file: !687, line: 225, column: 3)
!962 = !DILocation(line: 225, scope: !961)
!963 = !DILocation(line: 225, column: 17, scope: !964)
!964 = distinct !DILexicalBlock(scope: !961, file: !687, line: 225, column: 3)
!965 = !DILocation(line: 225, column: 3, scope: !961)
!966 = !DILocation(line: 226, column: 18, scope: !964)
!967 = !DILocation(line: 226, column: 5, scope: !964)
!968 = !DILocation(line: 225, column: 29, scope: !964)
!969 = !DILocation(line: 225, column: 3, scope: !964)
!970 = distinct !{!970, !965, !971, !109}
!971 = !DILocation(line: 226, column: 25, scope: !961)
!972 = !DILocation(line: 227, column: 1, scope: !956)
!973 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_add", scope: !687, file: !687, line: 238, type: !974, scopeLine: 238, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!974 = !DISubroutineType(types: !975)
!975 = !{null, !326, !690, !690}
!976 = !DILocalVariable(name: "r", arg: 1, scope: !973, file: !687, line: 238, type: !326)
!977 = !DILocation(line: 0, scope: !973)
!978 = !DILocalVariable(name: "a", arg: 2, scope: !973, file: !687, line: 238, type: !690)
!979 = !DILocalVariable(name: "b", arg: 3, scope: !973, file: !687, line: 238, type: !690)
!980 = !DILocalVariable(name: "i", scope: !973, file: !687, line: 239, type: !14)
!981 = !DILocation(line: 240, column: 8, scope: !982)
!982 = distinct !DILexicalBlock(scope: !973, file: !687, line: 240, column: 3)
!983 = !DILocation(line: 240, scope: !982)
!984 = !DILocation(line: 240, column: 17, scope: !985)
!985 = distinct !DILexicalBlock(scope: !982, file: !687, line: 240, column: 3)
!986 = !DILocation(line: 240, column: 3, scope: !982)
!987 = !DILocation(line: 241, column: 15, scope: !985)
!988 = !DILocation(line: 241, column: 25, scope: !985)
!989 = !DILocation(line: 241, column: 35, scope: !985)
!990 = !DILocation(line: 241, column: 5, scope: !985)
!991 = !DILocation(line: 240, column: 29, scope: !985)
!992 = !DILocation(line: 240, column: 3, scope: !985)
!993 = distinct !{!993, !986, !994, !109}
!994 = !DILocation(line: 241, column: 42, scope: !982)
!995 = !DILocation(line: 242, column: 1, scope: !973)
!996 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_compress", scope: !997, file: !997, line: 19, type: !998, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!997 = !DIFile(filename: "../../../ref/poly.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!998 = !DISubroutineType(types: !999)
!999 = !{null, !6, !1000}
!1000 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1001, size: 32)
!1001 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !330)
!1002 = !DILocalVariable(name: "r", arg: 1, scope: !996, file: !997, line: 19, type: !6)
!1003 = !DILocation(line: 0, scope: !996)
!1004 = !DILocalVariable(name: "a", arg: 2, scope: !996, file: !997, line: 19, type: !1000)
!1005 = !DILocalVariable(name: "t", scope: !996, file: !997, line: 23, type: !1006)
!1006 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 64, elements: !1007)
!1007 = !{!1008}
!1008 = !DISubrange(count: 8)
!1009 = !DILocation(line: 23, column: 11, scope: !996)
!1010 = !DILocalVariable(name: "i", scope: !996, file: !997, line: 20, type: !14)
!1011 = !DILocation(line: 27, column: 8, scope: !1012)
!1012 = distinct !DILexicalBlock(scope: !996, file: !997, line: 27, column: 3)
!1013 = !DILocation(line: 27, scope: !1012)
!1014 = !DILocation(line: 27, column: 17, scope: !1015)
!1015 = distinct !DILexicalBlock(scope: !1012, file: !997, line: 27, column: 3)
!1016 = !DILocation(line: 27, column: 3, scope: !1012)
!1017 = !DILocation(line: 28, column: 5, scope: !1018)
!1018 = distinct !DILexicalBlock(scope: !1019, file: !997, line: 28, column: 5)
!1019 = distinct !DILexicalBlock(scope: !1015, file: !997, line: 27, column: 37)
!1020 = !DILocation(line: 28, scope: !1018)
!1021 = !DILocalVariable(name: "j", scope: !996, file: !997, line: 20, type: !14)
!1022 = !DILocation(line: 28, column: 19, scope: !1023)
!1023 = distinct !DILexicalBlock(scope: !1018, file: !997, line: 28, column: 5)
!1024 = !DILocation(line: 30, column: 18, scope: !1025)
!1025 = distinct !DILexicalBlock(scope: !1023, file: !997, line: 28, column: 29)
!1026 = !DILocation(line: 30, column: 22, scope: !1025)
!1027 = !DILocation(line: 30, column: 11, scope: !1025)
!1028 = !DILocalVariable(name: "u", scope: !996, file: !997, line: 21, type: !36)
!1029 = !DILocation(line: 31, column: 22, scope: !1025)
!1030 = !DILocation(line: 31, column: 9, scope: !1025)
!1031 = !DILocation(line: 33, column: 12, scope: !1025)
!1032 = !DILocalVariable(name: "d0", scope: !996, file: !997, line: 22, type: !65)
!1033 = !DILocation(line: 35, column: 10, scope: !1025)
!1034 = !DILocation(line: 36, column: 10, scope: !1025)
!1035 = !DILocation(line: 37, column: 14, scope: !1025)
!1036 = !DILocation(line: 37, column: 7, scope: !1025)
!1037 = !DILocation(line: 37, column: 12, scope: !1025)
!1038 = !DILocation(line: 28, column: 25, scope: !1023)
!1039 = !DILocation(line: 28, column: 5, scope: !1023)
!1040 = distinct !{!1040, !1017, !1041, !109}
!1041 = !DILocation(line: 38, column: 5, scope: !1018)
!1042 = !DILocation(line: 40, column: 12, scope: !1019)
!1043 = !DILocation(line: 40, column: 20, scope: !1019)
!1044 = !DILocation(line: 40, column: 25, scope: !1019)
!1045 = !DILocation(line: 40, column: 17, scope: !1019)
!1046 = !DILocation(line: 40, column: 10, scope: !1019)
!1047 = !DILocation(line: 41, column: 12, scope: !1019)
!1048 = !DILocation(line: 41, column: 20, scope: !1019)
!1049 = !DILocation(line: 41, column: 25, scope: !1019)
!1050 = !DILocation(line: 41, column: 17, scope: !1019)
!1051 = !DILocation(line: 41, column: 5, scope: !1019)
!1052 = !DILocation(line: 41, column: 10, scope: !1019)
!1053 = !DILocation(line: 42, column: 12, scope: !1019)
!1054 = !DILocation(line: 42, column: 20, scope: !1019)
!1055 = !DILocation(line: 42, column: 25, scope: !1019)
!1056 = !DILocation(line: 42, column: 17, scope: !1019)
!1057 = !DILocation(line: 42, column: 5, scope: !1019)
!1058 = !DILocation(line: 42, column: 10, scope: !1019)
!1059 = !DILocation(line: 43, column: 12, scope: !1019)
!1060 = !DILocation(line: 43, column: 20, scope: !1019)
!1061 = !DILocation(line: 43, column: 25, scope: !1019)
!1062 = !DILocation(line: 43, column: 17, scope: !1019)
!1063 = !DILocation(line: 43, column: 5, scope: !1019)
!1064 = !DILocation(line: 43, column: 10, scope: !1019)
!1065 = !DILocation(line: 44, column: 7, scope: !1019)
!1066 = !DILocation(line: 27, column: 33, scope: !1015)
!1067 = !DILocation(line: 27, column: 3, scope: !1015)
!1068 = distinct !{!1068, !1016, !1069, !109}
!1069 = !DILocation(line: 45, column: 3, scope: !1012)
!1070 = !DILocation(line: 70, column: 1, scope: !996)
!1071 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_decompress", scope: !997, file: !997, line: 82, type: !1072, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1072 = !DISubroutineType(types: !1073)
!1073 = !{null, !634, !77}
!1074 = !DILocalVariable(name: "r", arg: 1, scope: !1071, file: !997, line: 82, type: !634)
!1075 = !DILocation(line: 0, scope: !1071)
!1076 = !DILocalVariable(name: "a", arg: 2, scope: !1071, file: !997, line: 82, type: !77)
!1077 = !DILocalVariable(name: "i", scope: !1071, file: !997, line: 83, type: !14)
!1078 = !DILocation(line: 86, column: 8, scope: !1079)
!1079 = distinct !DILexicalBlock(scope: !1071, file: !997, line: 86, column: 3)
!1080 = !DILocation(line: 86, scope: !1079)
!1081 = !DILocation(line: 86, column: 17, scope: !1082)
!1082 = distinct !DILexicalBlock(scope: !1079, file: !997, line: 86, column: 3)
!1083 = !DILocation(line: 86, column: 3, scope: !1079)
!1084 = !DILocation(line: 87, column: 36, scope: !1085)
!1085 = distinct !DILexicalBlock(scope: !1082, file: !997, line: 86, column: 37)
!1086 = !DILocation(line: 87, column: 41, scope: !1085)
!1087 = !DILocation(line: 87, column: 25, scope: !1085)
!1088 = !DILocation(line: 87, column: 47, scope: !1085)
!1089 = !DILocation(line: 87, column: 58, scope: !1085)
!1090 = !DILocation(line: 87, column: 63, scope: !1085)
!1091 = !DILocation(line: 87, column: 23, scope: !1085)
!1092 = !DILocation(line: 87, column: 12, scope: !1085)
!1093 = !DILocation(line: 87, column: 5, scope: !1085)
!1094 = !DILocation(line: 87, column: 21, scope: !1085)
!1095 = !DILocation(line: 88, column: 36, scope: !1085)
!1096 = !DILocation(line: 88, column: 41, scope: !1085)
!1097 = !DILocation(line: 88, column: 25, scope: !1085)
!1098 = !DILocation(line: 88, column: 47, scope: !1085)
!1099 = !DILocation(line: 88, column: 58, scope: !1085)
!1100 = !DILocation(line: 88, column: 63, scope: !1085)
!1101 = !DILocation(line: 88, column: 23, scope: !1085)
!1102 = !DILocation(line: 88, column: 12, scope: !1085)
!1103 = !DILocation(line: 88, column: 16, scope: !1085)
!1104 = !DILocation(line: 88, column: 5, scope: !1085)
!1105 = !DILocation(line: 88, column: 21, scope: !1085)
!1106 = !DILocation(line: 89, column: 7, scope: !1085)
!1107 = !DILocation(line: 86, column: 33, scope: !1082)
!1108 = !DILocation(line: 86, column: 3, scope: !1082)
!1109 = distinct !{!1109, !1083, !1110, !109}
!1110 = !DILocation(line: 90, column: 3, scope: !1079)
!1111 = !DILocation(line: 111, column: 1, scope: !1071)
!1112 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_tobytes", scope: !997, file: !997, line: 122, type: !998, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1113 = !DILocalVariable(name: "r", arg: 1, scope: !1112, file: !997, line: 122, type: !6)
!1114 = !DILocation(line: 0, scope: !1112)
!1115 = !DILocalVariable(name: "a", arg: 2, scope: !1112, file: !997, line: 122, type: !1000)
!1116 = !DILocalVariable(name: "i", scope: !1112, file: !997, line: 123, type: !14)
!1117 = !DILocation(line: 126, column: 8, scope: !1118)
!1118 = distinct !DILexicalBlock(scope: !1112, file: !997, line: 126, column: 3)
!1119 = !DILocation(line: 126, scope: !1118)
!1120 = !DILocation(line: 126, column: 17, scope: !1121)
!1121 = distinct !DILexicalBlock(scope: !1118, file: !997, line: 126, column: 3)
!1122 = !DILocation(line: 126, column: 3, scope: !1118)
!1123 = !DILocation(line: 128, column: 17, scope: !1124)
!1124 = distinct !DILexicalBlock(scope: !1121, file: !997, line: 126, column: 37)
!1125 = !DILocation(line: 128, column: 10, scope: !1124)
!1126 = !DILocalVariable(name: "t0", scope: !1112, file: !997, line: 124, type: !60)
!1127 = !DILocation(line: 129, column: 31, scope: !1124)
!1128 = !DILocation(line: 129, column: 8, scope: !1124)
!1129 = !DILocation(line: 130, column: 17, scope: !1124)
!1130 = !DILocation(line: 130, column: 21, scope: !1124)
!1131 = !DILocation(line: 130, column: 10, scope: !1124)
!1132 = !DILocalVariable(name: "t1", scope: !1112, file: !997, line: 124, type: !60)
!1133 = !DILocation(line: 131, column: 31, scope: !1124)
!1134 = !DILocation(line: 131, column: 8, scope: !1124)
!1135 = !DILocation(line: 132, column: 20, scope: !1124)
!1136 = !DILocation(line: 132, column: 9, scope: !1124)
!1137 = !DILocation(line: 132, column: 5, scope: !1124)
!1138 = !DILocation(line: 132, column: 18, scope: !1124)
!1139 = !DILocation(line: 133, column: 24, scope: !1124)
!1140 = !DILocation(line: 133, column: 33, scope: !1124)
!1141 = !DILocation(line: 133, column: 36, scope: !1124)
!1142 = !DILocation(line: 133, column: 30, scope: !1124)
!1143 = !DILocation(line: 133, column: 9, scope: !1124)
!1144 = !DILocation(line: 133, column: 5, scope: !1124)
!1145 = !DILocation(line: 133, column: 18, scope: !1124)
!1146 = !DILocation(line: 134, column: 24, scope: !1124)
!1147 = !DILocation(line: 134, column: 20, scope: !1124)
!1148 = !DILocation(line: 134, column: 9, scope: !1124)
!1149 = !DILocation(line: 134, column: 5, scope: !1124)
!1150 = !DILocation(line: 134, column: 18, scope: !1124)
!1151 = !DILocation(line: 126, column: 33, scope: !1121)
!1152 = !DILocation(line: 126, column: 3, scope: !1121)
!1153 = distinct !{!1153, !1122, !1154, !109}
!1154 = !DILocation(line: 135, column: 3, scope: !1118)
!1155 = !DILocation(line: 136, column: 1, scope: !1112)
!1156 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_frombytes", scope: !997, file: !997, line: 148, type: !1072, scopeLine: 148, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1157 = !DILocalVariable(name: "r", arg: 1, scope: !1156, file: !997, line: 148, type: !634)
!1158 = !DILocation(line: 0, scope: !1156)
!1159 = !DILocalVariable(name: "a", arg: 2, scope: !1156, file: !997, line: 148, type: !77)
!1160 = !DILocalVariable(name: "i", scope: !1156, file: !997, line: 149, type: !14)
!1161 = !DILocation(line: 150, column: 8, scope: !1162)
!1162 = distinct !DILexicalBlock(scope: !1156, file: !997, line: 150, column: 3)
!1163 = !DILocation(line: 150, scope: !1162)
!1164 = !DILocation(line: 150, column: 17, scope: !1165)
!1165 = distinct !DILexicalBlock(scope: !1162, file: !997, line: 150, column: 3)
!1166 = !DILocation(line: 150, column: 3, scope: !1162)
!1167 = !DILocation(line: 151, column: 25, scope: !1168)
!1168 = distinct !DILexicalBlock(scope: !1165, file: !997, line: 150, column: 37)
!1169 = !DILocation(line: 151, column: 21, scope: !1168)
!1170 = !DILocation(line: 151, column: 57, scope: !1168)
!1171 = !DILocation(line: 151, column: 53, scope: !1168)
!1172 = !DILocation(line: 151, column: 43, scope: !1168)
!1173 = !DILocation(line: 151, column: 66, scope: !1168)
!1174 = !DILocation(line: 151, column: 73, scope: !1168)
!1175 = !DILocation(line: 151, column: 12, scope: !1168)
!1176 = !DILocation(line: 151, column: 5, scope: !1168)
!1177 = !DILocation(line: 151, column: 17, scope: !1168)
!1178 = !DILocation(line: 153, column: 15, scope: !1168)
!1179 = !DILocation(line: 153, column: 11, scope: !1168)
!1180 = !DILocation(line: 153, column: 24, scope: !1168)
!1181 = !DILocation(line: 153, column: 47, scope: !1168)
!1182 = !DILocation(line: 153, column: 43, scope: !1168)
!1183 = !DILocation(line: 153, column: 33, scope: !1168)
!1184 = !DILocation(line: 153, column: 56, scope: !1168)
!1185 = !DILocation(line: 153, column: 30, scope: !1168)
!1186 = !DILocation(line: 152, column: 12, scope: !1168)
!1187 = !DILocation(line: 152, column: 16, scope: !1168)
!1188 = !DILocation(line: 152, column: 5, scope: !1168)
!1189 = !DILocation(line: 152, column: 21, scope: !1168)
!1190 = !DILocation(line: 150, column: 33, scope: !1165)
!1191 = !DILocation(line: 150, column: 3, scope: !1165)
!1192 = distinct !{!1192, !1166, !1193, !109}
!1193 = !DILocation(line: 154, column: 3, scope: !1162)
!1194 = !DILocation(line: 155, column: 1, scope: !1156)
!1195 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_frommsg", scope: !997, file: !997, line: 165, type: !1072, scopeLine: 165, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1196 = !DILocalVariable(name: "r", arg: 1, scope: !1195, file: !997, line: 165, type: !634)
!1197 = !DILocation(line: 0, scope: !1195)
!1198 = !DILocalVariable(name: "msg", arg: 2, scope: !1195, file: !997, line: 165, type: !77)
!1199 = !DILocalVariable(name: "i", scope: !1195, file: !997, line: 166, type: !14)
!1200 = !DILocation(line: 172, column: 8, scope: !1201)
!1201 = distinct !DILexicalBlock(scope: !1195, file: !997, line: 172, column: 3)
!1202 = !DILocation(line: 172, scope: !1201)
!1203 = !DILocation(line: 172, column: 17, scope: !1204)
!1204 = distinct !DILexicalBlock(scope: !1201, file: !997, line: 172, column: 3)
!1205 = !DILocation(line: 172, column: 3, scope: !1201)
!1206 = !DILocation(line: 173, column: 5, scope: !1207)
!1207 = distinct !DILexicalBlock(scope: !1208, file: !997, line: 173, column: 5)
!1208 = distinct !DILexicalBlock(scope: !1204, file: !997, line: 172, column: 37)
!1209 = !DILocation(line: 173, scope: !1207)
!1210 = !DILocalVariable(name: "j", scope: !1195, file: !997, line: 166, type: !14)
!1211 = !DILocation(line: 173, column: 19, scope: !1212)
!1212 = distinct !DILexicalBlock(scope: !1207, file: !997, line: 173, column: 5)
!1213 = !DILocation(line: 174, column: 14, scope: !1214)
!1214 = distinct !DILexicalBlock(scope: !1212, file: !997, line: 173, column: 29)
!1215 = !DILocation(line: 174, column: 18, scope: !1214)
!1216 = !DILocation(line: 174, column: 7, scope: !1214)
!1217 = !DILocation(line: 174, column: 23, scope: !1214)
!1218 = !DILocation(line: 175, column: 23, scope: !1214)
!1219 = !DILocation(line: 175, column: 31, scope: !1214)
!1220 = !DILocation(line: 175, column: 58, scope: !1214)
!1221 = !DILocation(line: 175, column: 65, scope: !1214)
!1222 = !DILocation(line: 175, column: 57, scope: !1214)
!1223 = !DILocation(line: 175, column: 7, scope: !1214)
!1224 = !DILocation(line: 173, column: 25, scope: !1212)
!1225 = !DILocation(line: 173, column: 5, scope: !1212)
!1226 = distinct !{!1226, !1206, !1227, !109}
!1227 = !DILocation(line: 176, column: 5, scope: !1207)
!1228 = !DILocation(line: 172, column: 33, scope: !1204)
!1229 = !DILocation(line: 172, column: 3, scope: !1204)
!1230 = distinct !{!1230, !1205, !1231, !109}
!1231 = !DILocation(line: 177, column: 3, scope: !1201)
!1232 = !DILocation(line: 178, column: 1, scope: !1195)
!1233 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_tomsg", scope: !997, file: !997, line: 188, type: !998, scopeLine: 188, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1234 = !DILocalVariable(name: "msg", arg: 1, scope: !1233, file: !997, line: 188, type: !6)
!1235 = !DILocation(line: 0, scope: !1233)
!1236 = !DILocalVariable(name: "a", arg: 2, scope: !1233, file: !997, line: 188, type: !1000)
!1237 = !DILocalVariable(name: "i", scope: !1233, file: !997, line: 189, type: !14)
!1238 = !DILocation(line: 192, column: 8, scope: !1239)
!1239 = distinct !DILexicalBlock(scope: !1233, file: !997, line: 192, column: 3)
!1240 = !DILocation(line: 192, scope: !1239)
!1241 = !DILocation(line: 192, column: 17, scope: !1242)
!1242 = distinct !DILexicalBlock(scope: !1239, file: !997, line: 192, column: 3)
!1243 = !DILocation(line: 192, column: 3, scope: !1239)
!1244 = !DILocation(line: 193, column: 5, scope: !1245)
!1245 = distinct !DILexicalBlock(scope: !1242, file: !997, line: 192, column: 37)
!1246 = !DILocation(line: 193, column: 12, scope: !1245)
!1247 = !DILocalVariable(name: "j", scope: !1233, file: !997, line: 189, type: !14)
!1248 = !DILocation(line: 194, column: 10, scope: !1249)
!1249 = distinct !DILexicalBlock(scope: !1245, file: !997, line: 194, column: 5)
!1250 = !DILocation(line: 194, scope: !1249)
!1251 = !DILocation(line: 194, column: 19, scope: !1252)
!1252 = distinct !DILexicalBlock(scope: !1249, file: !997, line: 194, column: 5)
!1253 = !DILocation(line: 194, column: 5, scope: !1249)
!1254 = !DILocation(line: 195, column: 18, scope: !1255)
!1255 = distinct !DILexicalBlock(scope: !1252, file: !997, line: 194, column: 29)
!1256 = !DILocation(line: 195, column: 22, scope: !1255)
!1257 = !DILocation(line: 195, column: 11, scope: !1255)
!1258 = !DILocalVariable(name: "t", scope: !1233, file: !997, line: 190, type: !65)
!1259 = !DILocation(line: 200, column: 9, scope: !1255)
!1260 = !DILocation(line: 201, column: 9, scope: !1255)
!1261 = !DILocation(line: 202, column: 9, scope: !1255)
!1262 = !DILocation(line: 203, column: 19, scope: !1255)
!1263 = !DILocation(line: 203, column: 7, scope: !1255)
!1264 = !DILocation(line: 203, column: 14, scope: !1255)
!1265 = !DILocation(line: 194, column: 25, scope: !1252)
!1266 = !DILocation(line: 194, column: 5, scope: !1252)
!1267 = distinct !{!1267, !1253, !1268, !109}
!1268 = !DILocation(line: 204, column: 5, scope: !1249)
!1269 = !DILocation(line: 192, column: 33, scope: !1242)
!1270 = !DILocation(line: 192, column: 3, scope: !1242)
!1271 = distinct !{!1271, !1243, !1272, !109}
!1272 = !DILocation(line: 205, column: 3, scope: !1239)
!1273 = !DILocation(line: 206, column: 1, scope: !1233)
!1274 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_getnoise_eta1", scope: !997, file: !997, line: 220, type: !1275, scopeLine: 221, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1275 = !DISubroutineType(types: !1276)
!1276 = !{null, !634, !77, !7}
!1277 = !DILocalVariable(name: "r", arg: 1, scope: !1274, file: !997, line: 220, type: !634)
!1278 = !DILocation(line: 0, scope: !1274)
!1279 = !DILocalVariable(name: "seed", arg: 2, scope: !1274, file: !997, line: 220, type: !77)
!1280 = !DILocalVariable(name: "nonce", arg: 3, scope: !1274, file: !997, line: 221, type: !7)
!1281 = !DILocalVariable(name: "buf", scope: !1274, file: !997, line: 222, type: !1282)
!1282 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1536, elements: !1283)
!1283 = !{!1284}
!1284 = !DISubrange(count: 192)
!1285 = !DILocation(line: 222, column: 11, scope: !1274)
!1286 = !DILocation(line: 223, column: 3, scope: !1274)
!1287 = !DILocation(line: 224, column: 3, scope: !1274)
!1288 = !DILocation(line: 225, column: 1, scope: !1274)
!1289 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_getnoise_eta2", scope: !997, file: !997, line: 239, type: !1275, scopeLine: 240, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1290 = !DILocalVariable(name: "r", arg: 1, scope: !1289, file: !997, line: 239, type: !634)
!1291 = !DILocation(line: 0, scope: !1289)
!1292 = !DILocalVariable(name: "seed", arg: 2, scope: !1289, file: !997, line: 239, type: !77)
!1293 = !DILocalVariable(name: "nonce", arg: 3, scope: !1289, file: !997, line: 240, type: !7)
!1294 = !DILocalVariable(name: "buf", scope: !1289, file: !997, line: 241, type: !1295)
!1295 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1024, elements: !39)
!1296 = !DILocation(line: 241, column: 11, scope: !1289)
!1297 = !DILocation(line: 242, column: 3, scope: !1289)
!1298 = !DILocation(line: 243, column: 3, scope: !1289)
!1299 = !DILocation(line: 244, column: 1, scope: !1289)
!1300 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_ntt", scope: !997, file: !997, line: 256, type: !1301, scopeLine: 256, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1301 = !DISubroutineType(types: !1302)
!1302 = !{null, !634}
!1303 = !DILocalVariable(name: "r", arg: 1, scope: !1300, file: !997, line: 256, type: !634)
!1304 = !DILocation(line: 0, scope: !1300)
!1305 = !DILocation(line: 257, column: 3, scope: !1300)
!1306 = !DILocation(line: 258, column: 3, scope: !1300)
!1307 = !DILocation(line: 259, column: 1, scope: !1300)
!1308 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_reduce", scope: !997, file: !997, line: 314, type: !1301, scopeLine: 314, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1309 = !DILocalVariable(name: "r", arg: 1, scope: !1308, file: !997, line: 314, type: !634)
!1310 = !DILocation(line: 0, scope: !1308)
!1311 = !DILocalVariable(name: "i", scope: !1308, file: !997, line: 315, type: !14)
!1312 = !DILocation(line: 316, column: 8, scope: !1313)
!1313 = distinct !DILexicalBlock(scope: !1308, file: !997, line: 316, column: 3)
!1314 = !DILocation(line: 316, scope: !1313)
!1315 = !DILocation(line: 316, column: 17, scope: !1316)
!1316 = distinct !DILexicalBlock(scope: !1313, file: !997, line: 316, column: 3)
!1317 = !DILocation(line: 316, column: 3, scope: !1313)
!1318 = !DILocation(line: 317, column: 30, scope: !1316)
!1319 = !DILocation(line: 317, column: 15, scope: !1316)
!1320 = !DILocation(line: 317, column: 5, scope: !1316)
!1321 = !DILocation(line: 317, column: 13, scope: !1316)
!1322 = !DILocation(line: 316, column: 29, scope: !1316)
!1323 = !DILocation(line: 316, column: 3, scope: !1316)
!1324 = distinct !{!1324, !1317, !1325, !109}
!1325 = !DILocation(line: 317, column: 37, scope: !1313)
!1326 = !DILocation(line: 318, column: 1, scope: !1308)
!1327 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_invntt_tomont", scope: !997, file: !997, line: 271, type: !1301, scopeLine: 271, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1328 = !DILocalVariable(name: "r", arg: 1, scope: !1327, file: !997, line: 271, type: !634)
!1329 = !DILocation(line: 0, scope: !1327)
!1330 = !DILocation(line: 271, column: 36, scope: !1327)
!1331 = !DILocation(line: 271, column: 48, scope: !1327)
!1332 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_basemul_montgomery", scope: !997, file: !997, line: 282, type: !1333, scopeLine: 282, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1333 = !DISubroutineType(types: !1334)
!1334 = !{null, !634, !1000, !1000}
!1335 = !DILocalVariable(name: "r", arg: 1, scope: !1332, file: !997, line: 282, type: !634)
!1336 = !DILocation(line: 0, scope: !1332)
!1337 = !DILocalVariable(name: "a", arg: 2, scope: !1332, file: !997, line: 282, type: !1000)
!1338 = !DILocalVariable(name: "b", arg: 3, scope: !1332, file: !997, line: 282, type: !1000)
!1339 = !DILocalVariable(name: "i", scope: !1332, file: !997, line: 283, type: !14)
!1340 = !DILocation(line: 284, column: 8, scope: !1341)
!1341 = distinct !DILexicalBlock(scope: !1332, file: !997, line: 284, column: 3)
!1342 = !DILocation(line: 284, scope: !1341)
!1343 = !DILocation(line: 284, column: 17, scope: !1344)
!1344 = distinct !DILexicalBlock(scope: !1341, file: !997, line: 284, column: 3)
!1345 = !DILocation(line: 284, column: 3, scope: !1341)
!1346 = !DILocation(line: 285, column: 21, scope: !1347)
!1347 = distinct !DILexicalBlock(scope: !1344, file: !997, line: 284, column: 37)
!1348 = !DILocation(line: 285, column: 14, scope: !1347)
!1349 = !DILocation(line: 285, column: 35, scope: !1347)
!1350 = !DILocation(line: 285, column: 28, scope: !1347)
!1351 = !DILocation(line: 285, column: 49, scope: !1347)
!1352 = !DILocation(line: 285, column: 42, scope: !1347)
!1353 = !DILocation(line: 285, column: 64, scope: !1347)
!1354 = !DILocation(line: 285, column: 55, scope: !1347)
!1355 = !DILocation(line: 285, column: 5, scope: !1347)
!1356 = !DILocation(line: 286, column: 21, scope: !1347)
!1357 = !DILocation(line: 286, column: 25, scope: !1347)
!1358 = !DILocation(line: 286, column: 14, scope: !1347)
!1359 = !DILocation(line: 286, column: 39, scope: !1347)
!1360 = !DILocation(line: 286, column: 43, scope: !1347)
!1361 = !DILocation(line: 286, column: 32, scope: !1347)
!1362 = !DILocation(line: 286, column: 57, scope: !1347)
!1363 = !DILocation(line: 286, column: 61, scope: !1347)
!1364 = !DILocation(line: 286, column: 50, scope: !1347)
!1365 = !DILocation(line: 287, column: 23, scope: !1347)
!1366 = !DILocation(line: 287, column: 14, scope: !1347)
!1367 = !DILocation(line: 287, column: 13, scope: !1347)
!1368 = !DILocation(line: 286, column: 5, scope: !1347)
!1369 = !DILocation(line: 284, column: 33, scope: !1344)
!1370 = !DILocation(line: 284, column: 3, scope: !1344)
!1371 = distinct !{!1371, !1345, !1372, !109}
!1372 = !DILocation(line: 288, column: 3, scope: !1341)
!1373 = !DILocation(line: 289, column: 1, scope: !1332)
!1374 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_tomont", scope: !997, file: !997, line: 299, type: !1301, scopeLine: 299, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1375 = !DILocalVariable(name: "r", arg: 1, scope: !1374, file: !997, line: 299, type: !634)
!1376 = !DILocation(line: 0, scope: !1374)
!1377 = !DILocalVariable(name: "f", scope: !1374, file: !997, line: 301, type: !35)
!1378 = !DILocalVariable(name: "i", scope: !1374, file: !997, line: 300, type: !14)
!1379 = !DILocation(line: 302, column: 8, scope: !1380)
!1380 = distinct !DILexicalBlock(scope: !1374, file: !997, line: 302, column: 3)
!1381 = !DILocation(line: 302, scope: !1380)
!1382 = !DILocation(line: 302, column: 17, scope: !1383)
!1383 = distinct !DILexicalBlock(scope: !1380, file: !997, line: 302, column: 3)
!1384 = !DILocation(line: 302, column: 3, scope: !1380)
!1385 = !DILocation(line: 303, column: 42, scope: !1383)
!1386 = !DILocation(line: 303, column: 33, scope: !1383)
!1387 = !DILocation(line: 303, column: 50, scope: !1383)
!1388 = !DILocation(line: 303, column: 15, scope: !1383)
!1389 = !DILocation(line: 303, column: 5, scope: !1383)
!1390 = !DILocation(line: 303, column: 13, scope: !1383)
!1391 = !DILocation(line: 302, column: 29, scope: !1383)
!1392 = !DILocation(line: 302, column: 3, scope: !1383)
!1393 = distinct !{!1393, !1384, !1394, !109}
!1394 = !DILocation(line: 303, column: 53, scope: !1380)
!1395 = !DILocation(line: 304, column: 1, scope: !1374)
!1396 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_add", scope: !997, file: !997, line: 329, type: !1333, scopeLine: 329, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1397 = !DILocalVariable(name: "r", arg: 1, scope: !1396, file: !997, line: 329, type: !634)
!1398 = !DILocation(line: 0, scope: !1396)
!1399 = !DILocalVariable(name: "a", arg: 2, scope: !1396, file: !997, line: 329, type: !1000)
!1400 = !DILocalVariable(name: "b", arg: 3, scope: !1396, file: !997, line: 329, type: !1000)
!1401 = !DILocalVariable(name: "i", scope: !1396, file: !997, line: 330, type: !14)
!1402 = !DILocation(line: 331, column: 8, scope: !1403)
!1403 = distinct !DILexicalBlock(scope: !1396, file: !997, line: 331, column: 3)
!1404 = !DILocation(line: 331, scope: !1403)
!1405 = !DILocation(line: 331, column: 17, scope: !1406)
!1406 = distinct !DILexicalBlock(scope: !1403, file: !997, line: 331, column: 3)
!1407 = !DILocation(line: 331, column: 3, scope: !1403)
!1408 = !DILocation(line: 332, column: 15, scope: !1406)
!1409 = !DILocation(line: 332, column: 25, scope: !1406)
!1410 = !DILocation(line: 332, column: 23, scope: !1406)
!1411 = !DILocation(line: 332, column: 5, scope: !1406)
!1412 = !DILocation(line: 332, column: 13, scope: !1406)
!1413 = !DILocation(line: 331, column: 29, scope: !1406)
!1414 = !DILocation(line: 331, column: 3, scope: !1406)
!1415 = distinct !{!1415, !1407, !1416, !109}
!1416 = !DILocation(line: 332, column: 31, scope: !1403)
!1417 = !DILocation(line: 333, column: 1, scope: !1396)
!1418 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_sub", scope: !997, file: !997, line: 344, type: !1333, scopeLine: 344, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1419 = !DILocalVariable(name: "r", arg: 1, scope: !1418, file: !997, line: 344, type: !634)
!1420 = !DILocation(line: 0, scope: !1418)
!1421 = !DILocalVariable(name: "a", arg: 2, scope: !1418, file: !997, line: 344, type: !1000)
!1422 = !DILocalVariable(name: "b", arg: 3, scope: !1418, file: !997, line: 344, type: !1000)
!1423 = !DILocalVariable(name: "i", scope: !1418, file: !997, line: 345, type: !14)
!1424 = !DILocation(line: 346, column: 8, scope: !1425)
!1425 = distinct !DILexicalBlock(scope: !1418, file: !997, line: 346, column: 3)
!1426 = !DILocation(line: 346, scope: !1425)
!1427 = !DILocation(line: 346, column: 17, scope: !1428)
!1428 = distinct !DILexicalBlock(scope: !1425, file: !997, line: 346, column: 3)
!1429 = !DILocation(line: 346, column: 3, scope: !1425)
!1430 = !DILocation(line: 347, column: 15, scope: !1428)
!1431 = !DILocation(line: 347, column: 25, scope: !1428)
!1432 = !DILocation(line: 347, column: 23, scope: !1428)
!1433 = !DILocation(line: 347, column: 5, scope: !1428)
!1434 = !DILocation(line: 347, column: 13, scope: !1428)
!1435 = !DILocation(line: 346, column: 29, scope: !1428)
!1436 = !DILocation(line: 346, column: 3, scope: !1428)
!1437 = distinct !{!1437, !1429, !1438, !109}
!1438 = !DILocation(line: 347, column: 31, scope: !1425)
!1439 = !DILocation(line: 348, column: 1, scope: !1418)
!1440 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_ntt", scope: !33, file: !33, line: 80, type: !1441, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, retainedNodes: !24)
!1441 = !DISubroutineType(types: !1442)
!1442 = !{null, !403}
!1443 = !DILocalVariable(name: "r", arg: 1, scope: !1440, file: !33, line: 80, type: !403)
!1444 = !DILocation(line: 0, scope: !1440)
!1445 = !DILocalVariable(name: "k", scope: !1440, file: !33, line: 81, type: !14)
!1446 = !DILocalVariable(name: "len", scope: !1440, file: !33, line: 81, type: !14)
!1447 = !DILocation(line: 85, column: 7, scope: !1448)
!1448 = distinct !DILexicalBlock(scope: !1440, file: !33, line: 85, column: 3)
!1449 = !DILocation(line: 85, scope: !1448)
!1450 = !DILocation(line: 84, column: 5, scope: !1440)
!1451 = !DILocation(line: 85, column: 22, scope: !1452)
!1452 = distinct !DILexicalBlock(scope: !1448, file: !33, line: 85, column: 3)
!1453 = !DILocation(line: 85, column: 3, scope: !1448)
!1454 = !DILocation(line: 86, column: 5, scope: !1455)
!1455 = distinct !DILexicalBlock(scope: !1456, file: !33, line: 86, column: 5)
!1456 = distinct !DILexicalBlock(scope: !1452, file: !33, line: 85, column: 39)
!1457 = !DILocation(line: 86, scope: !1455)
!1458 = !DILocalVariable(name: "start", scope: !1440, file: !33, line: 81, type: !14)
!1459 = !DILocation(line: 86, column: 26, scope: !1460)
!1460 = distinct !DILexicalBlock(scope: !1455, file: !33, line: 86, column: 5)
!1461 = !DILocation(line: 87, column: 14, scope: !1462)
!1462 = distinct !DILexicalBlock(scope: !1460, file: !33, line: 86, column: 50)
!1463 = !DILocalVariable(name: "zeta", scope: !1440, file: !33, line: 82, type: !36)
!1464 = !DILocalVariable(name: "j", scope: !1440, file: !33, line: 81, type: !14)
!1465 = !DILocation(line: 88, column: 11, scope: !1466)
!1466 = distinct !DILexicalBlock(scope: !1462, file: !33, line: 88, column: 7)
!1467 = !DILocation(line: 88, scope: !1466)
!1468 = !DILocation(line: 88, column: 32, scope: !1469)
!1469 = distinct !DILexicalBlock(scope: !1466, file: !33, line: 88, column: 7)
!1470 = !DILocation(line: 88, column: 24, scope: !1469)
!1471 = !DILocation(line: 88, column: 7, scope: !1466)
!1472 = !DILocation(line: 89, column: 25, scope: !1473)
!1473 = distinct !DILexicalBlock(scope: !1469, file: !33, line: 88, column: 44)
!1474 = !DILocation(line: 89, column: 13, scope: !1473)
!1475 = !DILocalVariable(name: "t", scope: !1440, file: !33, line: 82, type: !36)
!1476 = !DILocation(line: 90, column: 22, scope: !1473)
!1477 = !DILocation(line: 90, column: 27, scope: !1473)
!1478 = !DILocation(line: 90, column: 9, scope: !1473)
!1479 = !DILocation(line: 90, column: 20, scope: !1473)
!1480 = !DILocation(line: 91, column: 16, scope: !1473)
!1481 = !DILocation(line: 91, column: 21, scope: !1473)
!1482 = !DILocation(line: 91, column: 9, scope: !1473)
!1483 = !DILocation(line: 91, column: 14, scope: !1473)
!1484 = !DILocation(line: 88, column: 40, scope: !1469)
!1485 = !DILocation(line: 88, column: 7, scope: !1469)
!1486 = distinct !{!1486, !1471, !1487, !109}
!1487 = !DILocation(line: 92, column: 7, scope: !1466)
!1488 = !DILocation(line: 87, column: 21, scope: !1462)
!1489 = !DILocation(line: 86, column: 43, scope: !1460)
!1490 = !DILocation(line: 86, column: 5, scope: !1460)
!1491 = distinct !{!1491, !1454, !1492, !109}
!1492 = !DILocation(line: 93, column: 5, scope: !1455)
!1493 = !DILocation(line: 85, column: 32, scope: !1452)
!1494 = !DILocation(line: 85, column: 3, scope: !1452)
!1495 = distinct !{!1495, !1453, !1496, !109}
!1496 = !DILocation(line: 94, column: 3, scope: !1448)
!1497 = !DILocation(line: 95, column: 1, scope: !1440)
!1498 = distinct !DISubprogram(name: "fqmul", scope: !33, file: !33, line: 68, type: !1499, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !28, retainedNodes: !24)
!1499 = !DISubroutineType(types: !1500)
!1500 = !{!36, !36, !36}
!1501 = !DILocalVariable(name: "a", arg: 1, scope: !1498, file: !33, line: 68, type: !36)
!1502 = !DILocation(line: 0, scope: !1498)
!1503 = !DILocalVariable(name: "b", arg: 2, scope: !1498, file: !33, line: 68, type: !36)
!1504 = !DILocation(line: 69, column: 28, scope: !1498)
!1505 = !DILocation(line: 69, column: 39, scope: !1498)
!1506 = !DILocation(line: 69, column: 38, scope: !1498)
!1507 = !DILocation(line: 69, column: 10, scope: !1498)
!1508 = !DILocation(line: 69, column: 3, scope: !1498)
!1509 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_invntt", scope: !33, file: !33, line: 106, type: !1441, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, retainedNodes: !24)
!1510 = !DILocalVariable(name: "r", arg: 1, scope: !1509, file: !33, line: 106, type: !403)
!1511 = !DILocation(line: 0, scope: !1509)
!1512 = !DILocalVariable(name: "f", scope: !1509, file: !33, line: 109, type: !35)
!1513 = !DILocalVariable(name: "k", scope: !1509, file: !33, line: 107, type: !14)
!1514 = !DILocalVariable(name: "len", scope: !1509, file: !33, line: 107, type: !14)
!1515 = !DILocation(line: 112, column: 7, scope: !1516)
!1516 = distinct !DILexicalBlock(scope: !1509, file: !33, line: 112, column: 3)
!1517 = !DILocation(line: 112, scope: !1516)
!1518 = !DILocation(line: 111, column: 5, scope: !1509)
!1519 = !DILocation(line: 112, column: 20, scope: !1520)
!1520 = distinct !DILexicalBlock(scope: !1516, file: !33, line: 112, column: 3)
!1521 = !DILocation(line: 112, column: 3, scope: !1516)
!1522 = !DILocation(line: 113, column: 5, scope: !1523)
!1523 = distinct !DILexicalBlock(scope: !1524, file: !33, line: 113, column: 5)
!1524 = distinct !DILexicalBlock(scope: !1520, file: !33, line: 112, column: 39)
!1525 = !DILocation(line: 124, column: 3, scope: !1526)
!1526 = distinct !DILexicalBlock(scope: !1509, file: !33, line: 124, column: 3)
!1527 = !DILocation(line: 113, scope: !1523)
!1528 = !DILocalVariable(name: "start", scope: !1509, file: !33, line: 107, type: !14)
!1529 = !DILocation(line: 113, column: 26, scope: !1530)
!1530 = distinct !DILexicalBlock(scope: !1523, file: !33, line: 113, column: 5)
!1531 = !DILocation(line: 114, column: 14, scope: !1532)
!1532 = distinct !DILexicalBlock(scope: !1530, file: !33, line: 113, column: 50)
!1533 = !DILocalVariable(name: "zeta", scope: !1509, file: !33, line: 108, type: !36)
!1534 = !DILocalVariable(name: "j", scope: !1509, file: !33, line: 107, type: !14)
!1535 = !DILocation(line: 115, column: 11, scope: !1536)
!1536 = distinct !DILexicalBlock(scope: !1532, file: !33, line: 115, column: 7)
!1537 = !DILocation(line: 115, scope: !1536)
!1538 = !DILocation(line: 115, column: 32, scope: !1539)
!1539 = distinct !DILexicalBlock(scope: !1536, file: !33, line: 115, column: 7)
!1540 = !DILocation(line: 115, column: 24, scope: !1539)
!1541 = !DILocation(line: 115, column: 7, scope: !1536)
!1542 = !DILocation(line: 116, column: 13, scope: !1543)
!1543 = distinct !DILexicalBlock(scope: !1539, file: !33, line: 115, column: 44)
!1544 = !DILocalVariable(name: "t", scope: !1509, file: !33, line: 108, type: !36)
!1545 = !DILocation(line: 117, column: 35, scope: !1543)
!1546 = !DILocation(line: 117, column: 33, scope: !1543)
!1547 = !DILocation(line: 117, column: 16, scope: !1543)
!1548 = !DILocation(line: 117, column: 9, scope: !1543)
!1549 = !DILocation(line: 117, column: 14, scope: !1543)
!1550 = !DILocation(line: 118, column: 22, scope: !1543)
!1551 = !DILocation(line: 118, column: 33, scope: !1543)
!1552 = !DILocation(line: 118, column: 9, scope: !1543)
!1553 = !DILocation(line: 118, column: 20, scope: !1543)
!1554 = !DILocation(line: 119, column: 34, scope: !1543)
!1555 = !DILocation(line: 119, column: 22, scope: !1543)
!1556 = !DILocation(line: 119, column: 9, scope: !1543)
!1557 = !DILocation(line: 119, column: 20, scope: !1543)
!1558 = !DILocation(line: 115, column: 40, scope: !1539)
!1559 = !DILocation(line: 115, column: 7, scope: !1539)
!1560 = distinct !{!1560, !1541, !1561, !109}
!1561 = !DILocation(line: 120, column: 7, scope: !1536)
!1562 = !DILocation(line: 114, column: 21, scope: !1532)
!1563 = !DILocation(line: 113, column: 43, scope: !1530)
!1564 = !DILocation(line: 113, column: 5, scope: !1530)
!1565 = distinct !{!1565, !1522, !1566, !109}
!1566 = !DILocation(line: 121, column: 5, scope: !1523)
!1567 = !DILocation(line: 112, column: 32, scope: !1520)
!1568 = !DILocation(line: 112, column: 3, scope: !1520)
!1569 = distinct !{!1569, !1521, !1570, !109}
!1570 = !DILocation(line: 122, column: 3, scope: !1516)
!1571 = !DILocation(line: 124, scope: !1526)
!1572 = !DILocation(line: 124, column: 16, scope: !1573)
!1573 = distinct !DILexicalBlock(scope: !1526, file: !33, line: 124, column: 3)
!1574 = !DILocation(line: 125, column: 18, scope: !1573)
!1575 = !DILocation(line: 125, column: 12, scope: !1573)
!1576 = !DILocation(line: 125, column: 5, scope: !1573)
!1577 = !DILocation(line: 125, column: 10, scope: !1573)
!1578 = !DILocation(line: 124, column: 24, scope: !1573)
!1579 = !DILocation(line: 124, column: 3, scope: !1573)
!1580 = distinct !{!1580, !1525, !1581, !109}
!1581 = !DILocation(line: 125, column: 25, scope: !1526)
!1582 = !DILocation(line: 126, column: 1, scope: !1509)
!1583 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_basemul", scope: !33, file: !33, line: 139, type: !1584, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, retainedNodes: !24)
!1584 = !DISubroutineType(types: !1585)
!1585 = !{null, !403, !1586, !1586, !36}
!1586 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 32)
!1587 = !DILocalVariable(name: "r", arg: 1, scope: !1583, file: !33, line: 139, type: !403)
!1588 = !DILocation(line: 0, scope: !1583)
!1589 = !DILocalVariable(name: "a", arg: 2, scope: !1583, file: !33, line: 139, type: !1586)
!1590 = !DILocalVariable(name: "b", arg: 3, scope: !1583, file: !33, line: 139, type: !1586)
!1591 = !DILocalVariable(name: "zeta", arg: 4, scope: !1583, file: !33, line: 139, type: !36)
!1592 = !DILocation(line: 141, column: 17, scope: !1583)
!1593 = !DILocation(line: 141, column: 23, scope: !1583)
!1594 = !DILocation(line: 141, column: 11, scope: !1583)
!1595 = !DILocation(line: 141, column: 9, scope: !1583)
!1596 = !DILocation(line: 142, column: 11, scope: !1583)
!1597 = !DILocation(line: 142, column: 9, scope: !1583)
!1598 = !DILocation(line: 143, column: 17, scope: !1583)
!1599 = !DILocation(line: 143, column: 23, scope: !1583)
!1600 = !DILocation(line: 143, column: 11, scope: !1583)
!1601 = !DILocation(line: 143, column: 8, scope: !1583)
!1602 = !DILocation(line: 144, column: 17, scope: !1583)
!1603 = !DILocation(line: 144, column: 23, scope: !1583)
!1604 = !DILocation(line: 144, column: 11, scope: !1583)
!1605 = !DILocation(line: 144, column: 3, scope: !1583)
!1606 = !DILocation(line: 144, column: 9, scope: !1583)
!1607 = !DILocation(line: 145, column: 17, scope: !1583)
!1608 = !DILocation(line: 145, column: 23, scope: !1583)
!1609 = !DILocation(line: 145, column: 11, scope: !1583)
!1610 = !DILocation(line: 145, column: 3, scope: !1583)
!1611 = !DILocation(line: 145, column: 8, scope: !1583)
!1612 = !DILocation(line: 146, column: 1, scope: !1583)
!1613 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_cbd_eta1", scope: !1614, file: !1614, line: 105, type: !1072, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !69, retainedNodes: !24)
!1614 = !DIFile(filename: "../../../ref/cbd.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!1615 = !DILocalVariable(name: "r", arg: 1, scope: !1613, file: !1614, line: 105, type: !634)
!1616 = !DILocation(line: 0, scope: !1613)
!1617 = !DILocalVariable(name: "buf", arg: 2, scope: !1613, file: !1614, line: 105, type: !77)
!1618 = !DILocation(line: 109, column: 3, scope: !1613)
!1619 = !DILocation(line: 113, column: 1, scope: !1613)
!1620 = distinct !DISubprogram(name: "cbd3", scope: !1614, file: !1614, line: 85, type: !1072, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !69, retainedNodes: !24)
!1621 = !DILocalVariable(name: "r", arg: 1, scope: !1620, file: !1614, line: 85, type: !634)
!1622 = !DILocation(line: 0, scope: !1620)
!1623 = !DILocalVariable(name: "buf", arg: 2, scope: !1620, file: !1614, line: 85, type: !77)
!1624 = !DILocalVariable(name: "i", scope: !1620, file: !1614, line: 86, type: !14)
!1625 = !DILocation(line: 90, column: 8, scope: !1626)
!1626 = distinct !DILexicalBlock(scope: !1620, file: !1614, line: 90, column: 3)
!1627 = !DILocation(line: 90, scope: !1626)
!1628 = !DILocation(line: 90, column: 17, scope: !1629)
!1629 = distinct !DILexicalBlock(scope: !1626, file: !1614, line: 90, column: 3)
!1630 = !DILocation(line: 90, column: 3, scope: !1626)
!1631 = !DILocation(line: 91, column: 37, scope: !1632)
!1632 = distinct !DILexicalBlock(scope: !1629, file: !1614, line: 90, column: 37)
!1633 = !DILocation(line: 91, column: 33, scope: !1632)
!1634 = !DILocation(line: 91, column: 9, scope: !1632)
!1635 = !DILocalVariable(name: "t", scope: !1620, file: !1614, line: 87, type: !65)
!1636 = !DILocation(line: 92, column: 11, scope: !1632)
!1637 = !DILocalVariable(name: "d", scope: !1620, file: !1614, line: 87, type: !65)
!1638 = !DILocation(line: 93, column: 13, scope: !1632)
!1639 = !DILocation(line: 93, column: 19, scope: !1632)
!1640 = !DILocation(line: 93, column: 7, scope: !1632)
!1641 = !DILocation(line: 94, column: 13, scope: !1632)
!1642 = !DILocation(line: 94, column: 19, scope: !1632)
!1643 = !DILocation(line: 94, column: 7, scope: !1632)
!1644 = !DILocalVariable(name: "j", scope: !1620, file: !1614, line: 86, type: !14)
!1645 = !DILocation(line: 96, column: 10, scope: !1646)
!1646 = distinct !DILexicalBlock(scope: !1632, file: !1614, line: 96, column: 5)
!1647 = !DILocation(line: 96, scope: !1646)
!1648 = !DILocation(line: 96, column: 19, scope: !1649)
!1649 = distinct !DILexicalBlock(scope: !1646, file: !1614, line: 96, column: 5)
!1650 = !DILocation(line: 96, column: 5, scope: !1646)
!1651 = !DILocation(line: 97, column: 20, scope: !1652)
!1652 = distinct !DILexicalBlock(scope: !1649, file: !1614, line: 96, column: 29)
!1653 = !DILocation(line: 97, column: 14, scope: !1652)
!1654 = !DILocation(line: 97, column: 11, scope: !1652)
!1655 = !DILocalVariable(name: "a", scope: !1620, file: !1614, line: 88, type: !36)
!1656 = !DILocation(line: 98, column: 20, scope: !1652)
!1657 = !DILocation(line: 98, column: 24, scope: !1652)
!1658 = !DILocation(line: 98, column: 14, scope: !1652)
!1659 = !DILocation(line: 98, column: 11, scope: !1652)
!1660 = !DILocalVariable(name: "b", scope: !1620, file: !1614, line: 88, type: !36)
!1661 = !DILocation(line: 99, column: 27, scope: !1652)
!1662 = !DILocation(line: 99, column: 25, scope: !1652)
!1663 = !DILocation(line: 99, column: 14, scope: !1652)
!1664 = !DILocation(line: 99, column: 18, scope: !1652)
!1665 = !DILocation(line: 99, column: 7, scope: !1652)
!1666 = !DILocation(line: 99, column: 23, scope: !1652)
!1667 = !DILocation(line: 96, column: 25, scope: !1649)
!1668 = !DILocation(line: 96, column: 5, scope: !1649)
!1669 = distinct !{!1669, !1650, !1670, !109}
!1670 = !DILocation(line: 100, column: 5, scope: !1646)
!1671 = !DILocation(line: 90, column: 33, scope: !1629)
!1672 = !DILocation(line: 90, column: 3, scope: !1629)
!1673 = distinct !{!1673, !1630, !1674, !109}
!1674 = !DILocation(line: 101, column: 3, scope: !1626)
!1675 = !DILocation(line: 102, column: 1, scope: !1620)
!1676 = distinct !DISubprogram(name: "load24_littleendian", scope: !1614, file: !1614, line: 36, type: !1677, scopeLine: 36, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !69, retainedNodes: !24)
!1677 = !DISubroutineType(types: !1678)
!1678 = !{!65, !77}
!1679 = !DILocalVariable(name: "x", arg: 1, scope: !1676, file: !1614, line: 36, type: !77)
!1680 = !DILocation(line: 0, scope: !1676)
!1681 = !DILocation(line: 38, column: 17, scope: !1676)
!1682 = !DILocation(line: 38, column: 7, scope: !1676)
!1683 = !DILocalVariable(name: "r", scope: !1676, file: !1614, line: 37, type: !65)
!1684 = !DILocation(line: 39, column: 18, scope: !1676)
!1685 = !DILocation(line: 39, column: 8, scope: !1676)
!1686 = !DILocation(line: 39, column: 23, scope: !1676)
!1687 = !DILocation(line: 39, column: 5, scope: !1676)
!1688 = !DILocation(line: 40, column: 18, scope: !1676)
!1689 = !DILocation(line: 40, column: 8, scope: !1676)
!1690 = !DILocation(line: 40, column: 23, scope: !1676)
!1691 = !DILocation(line: 40, column: 5, scope: !1676)
!1692 = !DILocation(line: 41, column: 3, scope: !1676)
!1693 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_cbd_eta2", scope: !1614, file: !1614, line: 115, type: !1072, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !69, retainedNodes: !24)
!1694 = !DILocalVariable(name: "r", arg: 1, scope: !1693, file: !1614, line: 115, type: !634)
!1695 = !DILocation(line: 0, scope: !1693)
!1696 = !DILocalVariable(name: "buf", arg: 2, scope: !1693, file: !1614, line: 115, type: !77)
!1697 = !DILocation(line: 117, column: 3, scope: !1693)
!1698 = !DILocation(line: 121, column: 1, scope: !1693)
!1699 = distinct !DISubprogram(name: "cbd2", scope: !1614, file: !1614, line: 55, type: !1072, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !69, retainedNodes: !24)
!1700 = !DILocalVariable(name: "r", arg: 1, scope: !1699, file: !1614, line: 55, type: !634)
!1701 = !DILocation(line: 0, scope: !1699)
!1702 = !DILocalVariable(name: "buf", arg: 2, scope: !1699, file: !1614, line: 55, type: !77)
!1703 = !DILocalVariable(name: "i", scope: !1699, file: !1614, line: 56, type: !14)
!1704 = !DILocation(line: 60, column: 8, scope: !1705)
!1705 = distinct !DILexicalBlock(scope: !1699, file: !1614, line: 60, column: 3)
!1706 = !DILocation(line: 60, scope: !1705)
!1707 = !DILocation(line: 60, column: 17, scope: !1708)
!1708 = distinct !DILexicalBlock(scope: !1705, file: !1614, line: 60, column: 3)
!1709 = !DILocation(line: 60, column: 3, scope: !1705)
!1710 = !DILocation(line: 61, column: 37, scope: !1711)
!1711 = distinct !DILexicalBlock(scope: !1708, file: !1614, line: 60, column: 37)
!1712 = !DILocation(line: 61, column: 33, scope: !1711)
!1713 = !DILocation(line: 61, column: 9, scope: !1711)
!1714 = !DILocalVariable(name: "t", scope: !1699, file: !1614, line: 57, type: !65)
!1715 = !DILocation(line: 62, column: 11, scope: !1711)
!1716 = !DILocalVariable(name: "d", scope: !1699, file: !1614, line: 57, type: !65)
!1717 = !DILocation(line: 63, column: 13, scope: !1711)
!1718 = !DILocation(line: 63, column: 19, scope: !1711)
!1719 = !DILocation(line: 63, column: 7, scope: !1711)
!1720 = !DILocalVariable(name: "j", scope: !1699, file: !1614, line: 56, type: !14)
!1721 = !DILocation(line: 65, column: 10, scope: !1722)
!1722 = distinct !DILexicalBlock(scope: !1711, file: !1614, line: 65, column: 5)
!1723 = !DILocation(line: 65, scope: !1722)
!1724 = !DILocation(line: 65, column: 19, scope: !1725)
!1725 = distinct !DILexicalBlock(scope: !1722, file: !1614, line: 65, column: 5)
!1726 = !DILocation(line: 65, column: 5, scope: !1722)
!1727 = !DILocation(line: 66, column: 20, scope: !1728)
!1728 = distinct !DILexicalBlock(scope: !1725, file: !1614, line: 65, column: 29)
!1729 = !DILocation(line: 66, column: 14, scope: !1728)
!1730 = !DILocation(line: 66, column: 11, scope: !1728)
!1731 = !DILocalVariable(name: "a", scope: !1699, file: !1614, line: 58, type: !36)
!1732 = !DILocation(line: 67, column: 20, scope: !1728)
!1733 = !DILocation(line: 67, column: 24, scope: !1728)
!1734 = !DILocation(line: 67, column: 14, scope: !1728)
!1735 = !DILocation(line: 67, column: 11, scope: !1728)
!1736 = !DILocalVariable(name: "b", scope: !1699, file: !1614, line: 58, type: !36)
!1737 = !DILocation(line: 68, column: 27, scope: !1728)
!1738 = !DILocation(line: 68, column: 25, scope: !1728)
!1739 = !DILocation(line: 68, column: 14, scope: !1728)
!1740 = !DILocation(line: 68, column: 18, scope: !1728)
!1741 = !DILocation(line: 68, column: 7, scope: !1728)
!1742 = !DILocation(line: 68, column: 23, scope: !1728)
!1743 = !DILocation(line: 65, column: 25, scope: !1725)
!1744 = !DILocation(line: 65, column: 5, scope: !1725)
!1745 = distinct !{!1745, !1726, !1746, !109}
!1746 = !DILocation(line: 69, column: 5, scope: !1722)
!1747 = !DILocation(line: 60, column: 33, scope: !1708)
!1748 = !DILocation(line: 60, column: 3, scope: !1708)
!1749 = distinct !{!1749, !1709, !1750, !109}
!1750 = !DILocation(line: 70, column: 3, scope: !1705)
!1751 = !DILocation(line: 71, column: 1, scope: !1699)
!1752 = distinct !DISubprogram(name: "load32_littleendian", scope: !1614, file: !1614, line: 15, type: !1677, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !69, retainedNodes: !24)
!1753 = !DILocalVariable(name: "x", arg: 1, scope: !1752, file: !1614, line: 15, type: !77)
!1754 = !DILocation(line: 0, scope: !1752)
!1755 = !DILocation(line: 17, column: 17, scope: !1752)
!1756 = !DILocation(line: 17, column: 7, scope: !1752)
!1757 = !DILocalVariable(name: "r", scope: !1752, file: !1614, line: 16, type: !65)
!1758 = !DILocation(line: 18, column: 18, scope: !1752)
!1759 = !DILocation(line: 18, column: 8, scope: !1752)
!1760 = !DILocation(line: 18, column: 23, scope: !1752)
!1761 = !DILocation(line: 18, column: 5, scope: !1752)
!1762 = !DILocation(line: 19, column: 18, scope: !1752)
!1763 = !DILocation(line: 19, column: 8, scope: !1752)
!1764 = !DILocation(line: 19, column: 23, scope: !1752)
!1765 = !DILocation(line: 19, column: 5, scope: !1752)
!1766 = !DILocation(line: 20, column: 18, scope: !1752)
!1767 = !DILocation(line: 20, column: 8, scope: !1752)
!1768 = !DILocation(line: 20, column: 23, scope: !1752)
!1769 = !DILocation(line: 20, column: 5, scope: !1752)
!1770 = !DILocation(line: 21, column: 3, scope: !1752)
!1771 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_montgomery_reduce", scope: !1772, file: !1772, line: 16, type: !1773, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !71, retainedNodes: !24)
!1772 = !DIFile(filename: "../../../ref/reduce.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!1773 = !DISubroutineType(types: !72)
!1774 = !DILocalVariable(name: "a", arg: 1, scope: !1771, file: !1772, line: 16, type: !30)
!1775 = !DILocation(line: 0, scope: !1771)
!1776 = !DILocalVariable(name: "t", scope: !1771, file: !1772, line: 18, type: !36)
!1777 = !DILocation(line: 21, column: 12, scope: !1771)
!1778 = !DILocation(line: 21, column: 22, scope: !1771)
!1779 = !DILocation(line: 21, column: 10, scope: !1771)
!1780 = !DILocation(line: 21, column: 32, scope: !1771)
!1781 = !DILocation(line: 21, column: 7, scope: !1771)
!1782 = !DILocation(line: 22, column: 3, scope: !1771)
!1783 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_barrett_reduce", scope: !1772, file: !1772, line: 35, type: !1784, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !71, retainedNodes: !24)
!1784 = !DISubroutineType(types: !1785)
!1785 = !{!36, !36}
!1786 = !DILocalVariable(name: "a", arg: 1, scope: !1783, file: !1772, line: 35, type: !36)
!1787 = !DILocation(line: 0, scope: !1783)
!1788 = !DILocalVariable(name: "v", scope: !1783, file: !1772, line: 37, type: !35)
!1789 = !DILocation(line: 39, column: 20, scope: !1783)
!1790 = !DILocation(line: 39, column: 19, scope: !1783)
!1791 = !DILocation(line: 39, column: 22, scope: !1783)
!1792 = !DILocation(line: 39, column: 33, scope: !1783)
!1793 = !DILocalVariable(name: "t", scope: !1783, file: !1772, line: 36, type: !36)
!1794 = !DILocation(line: 41, column: 10, scope: !1783)
!1795 = !DILocation(line: 41, column: 3, scope: !1783)
!1796 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_verify", scope: !1797, file: !1797, line: 16, type: !1798, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !73, retainedNodes: !24)
!1797 = !DIFile(filename: "../../../ref/verify.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!1798 = !DISubroutineType(types: !1799)
!1799 = !{!25, !77, !77, !12}
!1800 = !DILocalVariable(name: "a", arg: 1, scope: !1796, file: !1797, line: 16, type: !77)
!1801 = !DILocation(line: 0, scope: !1796)
!1802 = !DILocalVariable(name: "b", arg: 2, scope: !1796, file: !1797, line: 16, type: !77)
!1803 = !DILocalVariable(name: "len", arg: 3, scope: !1796, file: !1797, line: 16, type: !12)
!1804 = !DILocalVariable(name: "r", scope: !1796, file: !1797, line: 19, type: !7)
!1805 = !DILocalVariable(name: "i", scope: !1796, file: !1797, line: 18, type: !12)
!1806 = !DILocation(line: 21, column: 7, scope: !1807)
!1807 = distinct !DILexicalBlock(scope: !1796, file: !1797, line: 21, column: 3)
!1808 = !DILocation(line: 21, scope: !1807)
!1809 = !DILocation(line: 21, column: 12, scope: !1810)
!1810 = distinct !DILexicalBlock(scope: !1807, file: !1797, line: 21, column: 3)
!1811 = !DILocation(line: 21, column: 3, scope: !1807)
!1812 = !DILocation(line: 22, column: 10, scope: !1810)
!1813 = !DILocation(line: 22, column: 17, scope: !1810)
!1814 = !DILocation(line: 22, column: 15, scope: !1810)
!1815 = !DILocation(line: 22, column: 7, scope: !1810)
!1816 = !DILocation(line: 21, column: 18, scope: !1810)
!1817 = !DILocation(line: 21, column: 3, scope: !1810)
!1818 = distinct !{!1818, !1811, !1819, !109}
!1819 = !DILocation(line: 22, column: 20, scope: !1807)
!1820 = !DILocation(line: 24, column: 25, scope: !1796)
!1821 = !DILocation(line: 24, column: 10, scope: !1796)
!1822 = !DILocation(line: 24, column: 3, scope: !1796)
!1823 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_cmov", scope: !1797, file: !1797, line: 40, type: !1824, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !73, retainedNodes: !24)
!1824 = !DISubroutineType(types: !1825)
!1825 = !{null, !6, !77, !12, !7}
!1826 = !DILocalVariable(name: "r", arg: 1, scope: !1823, file: !1797, line: 40, type: !6)
!1827 = !DILocation(line: 0, scope: !1823)
!1828 = !DILocalVariable(name: "x", arg: 2, scope: !1823, file: !1797, line: 40, type: !77)
!1829 = !DILocalVariable(name: "len", arg: 3, scope: !1823, file: !1797, line: 40, type: !12)
!1830 = !DILocalVariable(name: "b", arg: 4, scope: !1823, file: !1797, line: 40, type: !7)
!1831 = !DILocation(line: 51, column: 3, scope: !1823)
!1832 = !{i64 1722}
!1833 = !DILocation(line: 54, column: 7, scope: !1823)
!1834 = !DILocalVariable(name: "i", scope: !1823, file: !1797, line: 42, type: !12)
!1835 = !DILocation(line: 55, column: 7, scope: !1836)
!1836 = distinct !DILexicalBlock(scope: !1823, file: !1797, line: 55, column: 3)
!1837 = !DILocation(line: 55, scope: !1836)
!1838 = !DILocation(line: 55, column: 12, scope: !1839)
!1839 = distinct !DILexicalBlock(scope: !1836, file: !1797, line: 55, column: 3)
!1840 = !DILocation(line: 55, column: 3, scope: !1836)
!1841 = !DILocation(line: 56, column: 18, scope: !1839)
!1842 = !DILocation(line: 56, column: 25, scope: !1839)
!1843 = !DILocation(line: 56, column: 23, scope: !1839)
!1844 = !DILocation(line: 56, column: 15, scope: !1839)
!1845 = !DILocation(line: 56, column: 5, scope: !1839)
!1846 = !DILocation(line: 56, column: 10, scope: !1839)
!1847 = !DILocation(line: 55, column: 18, scope: !1839)
!1848 = !DILocation(line: 55, column: 3, scope: !1839)
!1849 = distinct !{!1849, !1840, !1850, !109}
!1850 = !DILocation(line: 56, column: 29, scope: !1836)
!1851 = !DILocation(line: 57, column: 1, scope: !1823)
!1852 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_cmov_int16", scope: !1797, file: !1797, line: 71, type: !1853, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !73, retainedNodes: !24)
!1853 = !DISubroutineType(types: !1854)
!1854 = !{null, !403, !36, !60}
!1855 = !DILocalVariable(name: "r", arg: 1, scope: !1852, file: !1797, line: 71, type: !403)
!1856 = !DILocation(line: 0, scope: !1852)
!1857 = !DILocalVariable(name: "v", arg: 2, scope: !1852, file: !1797, line: 71, type: !36)
!1858 = !DILocalVariable(name: "b", arg: 3, scope: !1852, file: !1797, line: 71, type: !60)
!1859 = !DILocation(line: 73, column: 7, scope: !1852)
!1860 = !DILocation(line: 74, column: 15, scope: !1852)
!1861 = !DILocation(line: 74, column: 19, scope: !1852)
!1862 = !DILocation(line: 74, column: 11, scope: !1852)
!1863 = !DILocation(line: 74, column: 6, scope: !1852)
!1864 = !DILocation(line: 75, column: 1, scope: !1852)
!1865 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_init", scope: !49, file: !49, line: 497, type: !1866, scopeLine: 497, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!1866 = !DISubroutineType(types: !1867)
!1867 = !{null, !1868}
!1868 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !349, size: 32)
!1869 = !DILocalVariable(name: "state", arg: 1, scope: !1865, file: !49, line: 497, type: !1868)
!1870 = !DILocation(line: 0, scope: !1865)
!1871 = !DILocation(line: 498, column: 3, scope: !1865)
!1872 = !DILocation(line: 499, column: 3, scope: !1865)
!1873 = !DILocation(line: 499, column: 29, scope: !1865)
!1874 = !DILocation(line: 500, column: 1, scope: !1865)
!1875 = distinct !DISubprogram(name: "keccak_init", scope: !49, file: !49, line: 340, type: !1876, scopeLine: 340, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!1876 = !DISubroutineType(types: !1877)
!1877 = !{null, !1878}
!1878 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 32)
!1879 = !DILocalVariable(name: "s", arg: 1, scope: !1875, file: !49, line: 340, type: !1878)
!1880 = !DILocation(line: 0, scope: !1875)
!1881 = !DILocalVariable(name: "i", scope: !1875, file: !49, line: 341, type: !14)
!1882 = !DILocation(line: 342, column: 8, scope: !1883)
!1883 = distinct !DILexicalBlock(scope: !1875, file: !49, line: 342, column: 3)
!1884 = !DILocation(line: 342, scope: !1883)
!1885 = !DILocation(line: 342, column: 17, scope: !1886)
!1886 = distinct !DILexicalBlock(scope: !1883, file: !49, line: 342, column: 3)
!1887 = !DILocation(line: 342, column: 3, scope: !1883)
!1888 = !DILocation(line: 343, column: 5, scope: !1886)
!1889 = !DILocation(line: 343, column: 10, scope: !1886)
!1890 = !DILocation(line: 342, column: 24, scope: !1886)
!1891 = !DILocation(line: 342, column: 3, scope: !1886)
!1892 = distinct !{!1892, !1887, !1893, !109}
!1893 = !DILocation(line: 343, column: 12, scope: !1883)
!1894 = !DILocation(line: 344, column: 1, scope: !1875)
!1895 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb", scope: !49, file: !49, line: 512, type: !1896, scopeLine: 512, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!1896 = !DISubroutineType(types: !1897)
!1897 = !{null, !1868, !77, !12}
!1898 = !DILocalVariable(name: "state", arg: 1, scope: !1895, file: !49, line: 512, type: !1868)
!1899 = !DILocation(line: 0, scope: !1895)
!1900 = !DILocalVariable(name: "in", arg: 2, scope: !1895, file: !49, line: 512, type: !77)
!1901 = !DILocalVariable(name: "inlen", arg: 3, scope: !1895, file: !49, line: 512, type: !12)
!1902 = !DILocation(line: 513, column: 53, scope: !1895)
!1903 = !DILocation(line: 513, column: 31, scope: !1895)
!1904 = !DILocation(line: 513, column: 3, scope: !1895)
!1905 = !DILocation(line: 513, column: 29, scope: !1895)
!1906 = !DILocation(line: 515, column: 1, scope: !1895)
!1907 = distinct !DISubprogram(name: "keccak_absorb", scope: !49, file: !49, line: 359, type: !1908, scopeLine: 361, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!1908 = !DISubroutineType(types: !1909)
!1909 = !{!14, !1878, !14, !14, !77, !12}
!1910 = !DILocalVariable(name: "s", arg: 1, scope: !1907, file: !49, line: 359, type: !1878)
!1911 = !DILocation(line: 0, scope: !1907)
!1912 = !DILocalVariable(name: "pos", arg: 2, scope: !1907, file: !49, line: 359, type: !14)
!1913 = !DILocalVariable(name: "r", arg: 3, scope: !1907, file: !49, line: 360, type: !14)
!1914 = !DILocalVariable(name: "in", arg: 4, scope: !1907, file: !49, line: 360, type: !77)
!1915 = !DILocalVariable(name: "inlen", arg: 5, scope: !1907, file: !49, line: 361, type: !12)
!1916 = !DILocation(line: 364, column: 3, scope: !1907)
!1917 = !DILocation(line: 364, column: 14, scope: !1907)
!1918 = !DILocation(line: 364, column: 22, scope: !1907)
!1919 = !DILocation(line: 365, column: 5, scope: !1920)
!1920 = distinct !DILexicalBlock(scope: !1921, file: !49, line: 365, column: 5)
!1921 = distinct !DILexicalBlock(scope: !1907, file: !49, line: 364, column: 28)
!1922 = !DILocation(line: 372, column: 3, scope: !1923)
!1923 = distinct !DILexicalBlock(scope: !1907, file: !49, line: 372, column: 3)
!1924 = !DILocation(line: 365, scope: !1920)
!1925 = !DILocalVariable(name: "i", scope: !1907, file: !49, line: 362, type: !14)
!1926 = !DILocation(line: 365, column: 21, scope: !1927)
!1927 = distinct !DILexicalBlock(scope: !1920, file: !49, line: 365, column: 5)
!1928 = !DILocation(line: 366, column: 29, scope: !1927)
!1929 = !DILocation(line: 366, column: 19, scope: !1927)
!1930 = !DILocation(line: 366, column: 40, scope: !1927)
!1931 = !DILocation(line: 366, column: 35, scope: !1927)
!1932 = !DILocation(line: 366, column: 11, scope: !1927)
!1933 = !DILocation(line: 366, column: 7, scope: !1927)
!1934 = !DILocation(line: 366, column: 16, scope: !1927)
!1935 = !DILocation(line: 366, column: 32, scope: !1927)
!1936 = !DILocation(line: 365, column: 27, scope: !1927)
!1937 = !DILocation(line: 365, column: 5, scope: !1927)
!1938 = distinct !{!1938, !1919, !1939, !109}
!1939 = !DILocation(line: 366, column: 48, scope: !1920)
!1940 = !DILocation(line: 367, column: 16, scope: !1921)
!1941 = !DILocation(line: 367, column: 11, scope: !1921)
!1942 = !DILocation(line: 368, column: 5, scope: !1921)
!1943 = distinct !{!1943, !1916, !1944, !109}
!1944 = !DILocation(line: 370, column: 3, scope: !1907)
!1945 = !DILocation(line: 372, scope: !1923)
!1946 = !DILocation(line: 372, column: 25, scope: !1947)
!1947 = distinct !DILexicalBlock(scope: !1923, file: !49, line: 372, column: 3)
!1948 = !DILocation(line: 372, column: 19, scope: !1947)
!1949 = !DILocation(line: 373, column: 27, scope: !1947)
!1950 = !DILocation(line: 373, column: 17, scope: !1947)
!1951 = !DILocation(line: 373, column: 38, scope: !1947)
!1952 = !DILocation(line: 373, column: 33, scope: !1947)
!1953 = !DILocation(line: 373, column: 9, scope: !1947)
!1954 = !DILocation(line: 373, column: 5, scope: !1947)
!1955 = !DILocation(line: 373, column: 14, scope: !1947)
!1956 = !DILocation(line: 373, column: 30, scope: !1947)
!1957 = !DILocation(line: 372, column: 35, scope: !1947)
!1958 = !DILocation(line: 372, column: 3, scope: !1947)
!1959 = distinct !{!1959, !1922, !1960, !109}
!1960 = !DILocation(line: 373, column: 46, scope: !1923)
!1961 = !DILocation(line: 375, column: 3, scope: !1907)
!1962 = distinct !DISubprogram(name: "KeccakF1600_StatePermute", scope: !49, file: !49, line: 70, type: !1876, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!1963 = !DILocalVariable(name: "state", arg: 1, scope: !1962, file: !49, line: 70, type: !1878)
!1964 = !DILocation(line: 0, scope: !1962)
!1965 = !DILocation(line: 87, column: 9, scope: !1962)
!1966 = !DILocalVariable(name: "Aba", scope: !1962, file: !49, line: 73, type: !45)
!1967 = !DILocation(line: 88, column: 9, scope: !1962)
!1968 = !DILocalVariable(name: "Abe", scope: !1962, file: !49, line: 73, type: !45)
!1969 = !DILocation(line: 89, column: 9, scope: !1962)
!1970 = !DILocalVariable(name: "Abi", scope: !1962, file: !49, line: 73, type: !45)
!1971 = !DILocation(line: 90, column: 9, scope: !1962)
!1972 = !DILocalVariable(name: "Abo", scope: !1962, file: !49, line: 73, type: !45)
!1973 = !DILocation(line: 91, column: 9, scope: !1962)
!1974 = !DILocalVariable(name: "Abu", scope: !1962, file: !49, line: 73, type: !45)
!1975 = !DILocation(line: 92, column: 9, scope: !1962)
!1976 = !DILocalVariable(name: "Aga", scope: !1962, file: !49, line: 74, type: !45)
!1977 = !DILocation(line: 93, column: 9, scope: !1962)
!1978 = !DILocalVariable(name: "Age", scope: !1962, file: !49, line: 74, type: !45)
!1979 = !DILocation(line: 94, column: 9, scope: !1962)
!1980 = !DILocalVariable(name: "Agi", scope: !1962, file: !49, line: 74, type: !45)
!1981 = !DILocation(line: 95, column: 9, scope: !1962)
!1982 = !DILocalVariable(name: "Ago", scope: !1962, file: !49, line: 74, type: !45)
!1983 = !DILocation(line: 96, column: 9, scope: !1962)
!1984 = !DILocalVariable(name: "Agu", scope: !1962, file: !49, line: 74, type: !45)
!1985 = !DILocation(line: 97, column: 9, scope: !1962)
!1986 = !DILocalVariable(name: "Aka", scope: !1962, file: !49, line: 75, type: !45)
!1987 = !DILocation(line: 98, column: 9, scope: !1962)
!1988 = !DILocalVariable(name: "Ake", scope: !1962, file: !49, line: 75, type: !45)
!1989 = !DILocation(line: 99, column: 9, scope: !1962)
!1990 = !DILocalVariable(name: "Aki", scope: !1962, file: !49, line: 75, type: !45)
!1991 = !DILocation(line: 100, column: 9, scope: !1962)
!1992 = !DILocalVariable(name: "Ako", scope: !1962, file: !49, line: 75, type: !45)
!1993 = !DILocation(line: 101, column: 9, scope: !1962)
!1994 = !DILocalVariable(name: "Aku", scope: !1962, file: !49, line: 75, type: !45)
!1995 = !DILocation(line: 102, column: 9, scope: !1962)
!1996 = !DILocalVariable(name: "Ama", scope: !1962, file: !49, line: 76, type: !45)
!1997 = !DILocation(line: 103, column: 9, scope: !1962)
!1998 = !DILocalVariable(name: "Ame", scope: !1962, file: !49, line: 76, type: !45)
!1999 = !DILocation(line: 104, column: 9, scope: !1962)
!2000 = !DILocalVariable(name: "Ami", scope: !1962, file: !49, line: 76, type: !45)
!2001 = !DILocation(line: 105, column: 9, scope: !1962)
!2002 = !DILocalVariable(name: "Amo", scope: !1962, file: !49, line: 76, type: !45)
!2003 = !DILocation(line: 106, column: 9, scope: !1962)
!2004 = !DILocalVariable(name: "Amu", scope: !1962, file: !49, line: 76, type: !45)
!2005 = !DILocation(line: 107, column: 9, scope: !1962)
!2006 = !DILocalVariable(name: "Asa", scope: !1962, file: !49, line: 77, type: !45)
!2007 = !DILocation(line: 108, column: 9, scope: !1962)
!2008 = !DILocalVariable(name: "Ase", scope: !1962, file: !49, line: 77, type: !45)
!2009 = !DILocation(line: 109, column: 9, scope: !1962)
!2010 = !DILocalVariable(name: "Asi", scope: !1962, file: !49, line: 77, type: !45)
!2011 = !DILocation(line: 110, column: 9, scope: !1962)
!2012 = !DILocalVariable(name: "Aso", scope: !1962, file: !49, line: 77, type: !45)
!2013 = !DILocation(line: 111, column: 9, scope: !1962)
!2014 = !DILocalVariable(name: "Asu", scope: !1962, file: !49, line: 77, type: !45)
!2015 = !DILocalVariable(name: "round", scope: !1962, file: !49, line: 71, type: !25)
!2016 = !DILocation(line: 113, column: 8, scope: !2017)
!2017 = distinct !DILexicalBlock(scope: !1962, file: !49, line: 113, column: 3)
!2018 = !DILocation(line: 113, scope: !2017)
!2019 = !DILocation(line: 113, column: 25, scope: !2020)
!2020 = distinct !DILexicalBlock(scope: !2017, file: !49, line: 113, column: 3)
!2021 = !DILocation(line: 113, column: 3, scope: !2017)
!2022 = !DILocalVariable(name: "BCa", scope: !1962, file: !49, line: 78, type: !45)
!2023 = !DILocalVariable(name: "BCe", scope: !1962, file: !49, line: 78, type: !45)
!2024 = !DILocalVariable(name: "BCi", scope: !1962, file: !49, line: 78, type: !45)
!2025 = !DILocalVariable(name: "BCo", scope: !1962, file: !49, line: 78, type: !45)
!2026 = !DILocalVariable(name: "BCu", scope: !1962, file: !49, line: 78, type: !45)
!2027 = !DILocalVariable(name: "Da", scope: !1962, file: !49, line: 79, type: !45)
!2028 = !DILocalVariable(name: "De", scope: !1962, file: !49, line: 79, type: !45)
!2029 = !DILocalVariable(name: "Di", scope: !1962, file: !49, line: 79, type: !45)
!2030 = !DILocalVariable(name: "Do", scope: !1962, file: !49, line: 79, type: !45)
!2031 = !DILocalVariable(name: "Du", scope: !1962, file: !49, line: 79, type: !45)
!2032 = !DILocalVariable(name: "Eba", scope: !1962, file: !49, line: 80, type: !45)
!2033 = !DILocalVariable(name: "Ebe", scope: !1962, file: !49, line: 80, type: !45)
!2034 = !DILocalVariable(name: "Ebi", scope: !1962, file: !49, line: 80, type: !45)
!2035 = !DILocalVariable(name: "Ebo", scope: !1962, file: !49, line: 80, type: !45)
!2036 = !DILocalVariable(name: "Ebu", scope: !1962, file: !49, line: 80, type: !45)
!2037 = !DILocalVariable(name: "Ega", scope: !1962, file: !49, line: 81, type: !45)
!2038 = !DILocalVariable(name: "Ege", scope: !1962, file: !49, line: 81, type: !45)
!2039 = !DILocalVariable(name: "Egi", scope: !1962, file: !49, line: 81, type: !45)
!2040 = !DILocalVariable(name: "Ego", scope: !1962, file: !49, line: 81, type: !45)
!2041 = !DILocalVariable(name: "Egu", scope: !1962, file: !49, line: 81, type: !45)
!2042 = !DILocalVariable(name: "Eka", scope: !1962, file: !49, line: 82, type: !45)
!2043 = !DILocalVariable(name: "Eke", scope: !1962, file: !49, line: 82, type: !45)
!2044 = !DILocalVariable(name: "Eki", scope: !1962, file: !49, line: 82, type: !45)
!2045 = !DILocalVariable(name: "Eko", scope: !1962, file: !49, line: 82, type: !45)
!2046 = !DILocalVariable(name: "Eku", scope: !1962, file: !49, line: 82, type: !45)
!2047 = !DILocalVariable(name: "Ema", scope: !1962, file: !49, line: 83, type: !45)
!2048 = !DILocalVariable(name: "Eme", scope: !1962, file: !49, line: 83, type: !45)
!2049 = !DILocalVariable(name: "Emi", scope: !1962, file: !49, line: 83, type: !45)
!2050 = !DILocalVariable(name: "Emo", scope: !1962, file: !49, line: 83, type: !45)
!2051 = !DILocalVariable(name: "Emu", scope: !1962, file: !49, line: 83, type: !45)
!2052 = !DILocalVariable(name: "Esa", scope: !1962, file: !49, line: 84, type: !45)
!2053 = !DILocalVariable(name: "Ese", scope: !1962, file: !49, line: 84, type: !45)
!2054 = !DILocalVariable(name: "Esi", scope: !1962, file: !49, line: 84, type: !45)
!2055 = !DILocalVariable(name: "Eso", scope: !1962, file: !49, line: 84, type: !45)
!2056 = !DILocalVariable(name: "Esu", scope: !1962, file: !49, line: 84, type: !45)
!2057 = !DILocation(line: 117, column: 15, scope: !2058)
!2058 = distinct !DILexicalBlock(scope: !2020, file: !49, line: 113, column: 48)
!2059 = !DILocation(line: 117, column: 21, scope: !2058)
!2060 = !DILocation(line: 117, column: 27, scope: !2058)
!2061 = !DILocation(line: 117, column: 33, scope: !2058)
!2062 = !DILocation(line: 119, column: 15, scope: !2058)
!2063 = !DILocation(line: 119, column: 21, scope: !2058)
!2064 = !DILocation(line: 119, column: 27, scope: !2058)
!2065 = !DILocation(line: 119, column: 33, scope: !2058)
!2066 = !DILocation(line: 125, column: 16, scope: !2058)
!2067 = !DILocation(line: 125, column: 14, scope: !2058)
!2068 = !DILocation(line: 195, column: 9, scope: !2058)
!2069 = !DILocation(line: 196, column: 11, scope: !2058)
!2070 = !DILocation(line: 116, column: 15, scope: !2058)
!2071 = !DILocation(line: 116, column: 21, scope: !2058)
!2072 = !DILocation(line: 116, column: 27, scope: !2058)
!2073 = !DILocation(line: 116, column: 33, scope: !2058)
!2074 = !DILocation(line: 122, column: 16, scope: !2058)
!2075 = !DILocation(line: 122, column: 14, scope: !2058)
!2076 = !DILocation(line: 199, column: 9, scope: !2058)
!2077 = !DILocation(line: 200, column: 11, scope: !2058)
!2078 = !DILocation(line: 118, column: 15, scope: !2058)
!2079 = !DILocation(line: 118, column: 21, scope: !2058)
!2080 = !DILocation(line: 118, column: 27, scope: !2058)
!2081 = !DILocation(line: 118, column: 33, scope: !2058)
!2082 = !DILocation(line: 115, column: 15, scope: !2058)
!2083 = !DILocation(line: 115, column: 21, scope: !2058)
!2084 = !DILocation(line: 115, column: 27, scope: !2058)
!2085 = !DILocation(line: 115, column: 33, scope: !2058)
!2086 = !DILocation(line: 126, column: 16, scope: !2058)
!2087 = !DILocation(line: 126, column: 14, scope: !2058)
!2088 = !DILocation(line: 197, column: 9, scope: !2058)
!2089 = !DILocation(line: 198, column: 11, scope: !2058)
!2090 = !DILocation(line: 204, column: 19, scope: !2058)
!2091 = !DILocation(line: 204, column: 25, scope: !2058)
!2092 = !DILocation(line: 204, column: 15, scope: !2058)
!2093 = !DILocation(line: 124, column: 16, scope: !2058)
!2094 = !DILocation(line: 124, column: 14, scope: !2058)
!2095 = !DILocation(line: 132, column: 9, scope: !2058)
!2096 = !DILocation(line: 133, column: 11, scope: !2058)
!2097 = !DILocation(line: 123, column: 16, scope: !2058)
!2098 = !DILocation(line: 123, column: 14, scope: !2058)
!2099 = !DILocation(line: 130, column: 9, scope: !2058)
!2100 = !DILocation(line: 131, column: 11, scope: !2058)
!2101 = !DILocation(line: 138, column: 19, scope: !2058)
!2102 = !DILocation(line: 138, column: 25, scope: !2058)
!2103 = !DILocation(line: 139, column: 22, scope: !2058)
!2104 = !DILocation(line: 139, column: 9, scope: !2058)
!2105 = !DILocation(line: 128, column: 9, scope: !2058)
!2106 = !DILocation(line: 145, column: 9, scope: !2058)
!2107 = !DILocation(line: 146, column: 11, scope: !2058)
!2108 = !DILocation(line: 149, column: 9, scope: !2058)
!2109 = !DILocation(line: 150, column: 11, scope: !2058)
!2110 = !DILocation(line: 147, column: 9, scope: !2058)
!2111 = !DILocation(line: 148, column: 11, scope: !2058)
!2112 = !DILocation(line: 155, column: 19, scope: !2058)
!2113 = !DILocation(line: 155, column: 25, scope: !2058)
!2114 = !DILocation(line: 155, column: 15, scope: !2058)
!2115 = !DILocation(line: 210, column: 15, scope: !2058)
!2116 = !DILocation(line: 161, column: 9, scope: !2058)
!2117 = !DILocation(line: 162, column: 11, scope: !2058)
!2118 = !DILocation(line: 165, column: 9, scope: !2058)
!2119 = !DILocation(line: 166, column: 11, scope: !2058)
!2120 = !DILocation(line: 163, column: 9, scope: !2058)
!2121 = !DILocation(line: 164, column: 11, scope: !2058)
!2122 = !DILocation(line: 171, column: 19, scope: !2058)
!2123 = !DILocation(line: 171, column: 25, scope: !2058)
!2124 = !DILocation(line: 171, column: 15, scope: !2058)
!2125 = !DILocation(line: 210, column: 21, scope: !2058)
!2126 = !DILocation(line: 177, column: 9, scope: !2058)
!2127 = !DILocation(line: 178, column: 11, scope: !2058)
!2128 = !DILocation(line: 181, column: 9, scope: !2058)
!2129 = !DILocation(line: 182, column: 11, scope: !2058)
!2130 = !DILocation(line: 179, column: 9, scope: !2058)
!2131 = !DILocation(line: 180, column: 11, scope: !2058)
!2132 = !DILocation(line: 187, column: 19, scope: !2058)
!2133 = !DILocation(line: 187, column: 25, scope: !2058)
!2134 = !DILocation(line: 187, column: 15, scope: !2058)
!2135 = !DILocation(line: 210, column: 27, scope: !2058)
!2136 = !DILocation(line: 193, column: 9, scope: !2058)
!2137 = !DILocation(line: 194, column: 11, scope: !2058)
!2138 = !DILocation(line: 203, column: 19, scope: !2058)
!2139 = !DILocation(line: 203, column: 25, scope: !2058)
!2140 = !DILocation(line: 203, column: 15, scope: !2058)
!2141 = !DILocation(line: 210, column: 33, scope: !2058)
!2142 = !DILocation(line: 136, column: 9, scope: !2058)
!2143 = !DILocation(line: 137, column: 11, scope: !2058)
!2144 = !DILocation(line: 134, column: 9, scope: !2058)
!2145 = !DILocation(line: 135, column: 11, scope: !2058)
!2146 = !DILocation(line: 141, column: 19, scope: !2058)
!2147 = !DILocation(line: 141, column: 25, scope: !2058)
!2148 = !DILocation(line: 141, column: 15, scope: !2058)
!2149 = !DILocation(line: 153, column: 9, scope: !2058)
!2150 = !DILocation(line: 154, column: 11, scope: !2058)
!2151 = !DILocation(line: 151, column: 9, scope: !2058)
!2152 = !DILocation(line: 152, column: 11, scope: !2058)
!2153 = !DILocation(line: 157, column: 19, scope: !2058)
!2154 = !DILocation(line: 157, column: 25, scope: !2058)
!2155 = !DILocation(line: 157, column: 15, scope: !2058)
!2156 = !DILocation(line: 212, column: 15, scope: !2058)
!2157 = !DILocation(line: 169, column: 9, scope: !2058)
!2158 = !DILocation(line: 170, column: 11, scope: !2058)
!2159 = !DILocation(line: 167, column: 9, scope: !2058)
!2160 = !DILocation(line: 168, column: 11, scope: !2058)
!2161 = !DILocation(line: 173, column: 19, scope: !2058)
!2162 = !DILocation(line: 173, column: 25, scope: !2058)
!2163 = !DILocation(line: 173, column: 15, scope: !2058)
!2164 = !DILocation(line: 212, column: 21, scope: !2058)
!2165 = !DILocation(line: 185, column: 9, scope: !2058)
!2166 = !DILocation(line: 186, column: 11, scope: !2058)
!2167 = !DILocation(line: 183, column: 9, scope: !2058)
!2168 = !DILocation(line: 184, column: 11, scope: !2058)
!2169 = !DILocation(line: 189, column: 19, scope: !2058)
!2170 = !DILocation(line: 189, column: 25, scope: !2058)
!2171 = !DILocation(line: 189, column: 15, scope: !2058)
!2172 = !DILocation(line: 212, column: 27, scope: !2058)
!2173 = !DILocation(line: 201, column: 9, scope: !2058)
!2174 = !DILocation(line: 202, column: 11, scope: !2058)
!2175 = !DILocation(line: 205, column: 19, scope: !2058)
!2176 = !DILocation(line: 205, column: 25, scope: !2058)
!2177 = !DILocation(line: 205, column: 15, scope: !2058)
!2178 = !DILocation(line: 212, column: 33, scope: !2058)
!2179 = !DILocation(line: 218, column: 16, scope: !2058)
!2180 = !DILocation(line: 218, column: 14, scope: !2058)
!2181 = !DILocation(line: 296, column: 9, scope: !2058)
!2182 = !DILocation(line: 297, column: 11, scope: !2058)
!2183 = !DILocation(line: 158, column: 19, scope: !2058)
!2184 = !DILocation(line: 158, column: 25, scope: !2058)
!2185 = !DILocation(line: 158, column: 15, scope: !2058)
!2186 = !DILocation(line: 143, column: 19, scope: !2058)
!2187 = !DILocation(line: 143, column: 25, scope: !2058)
!2188 = !DILocation(line: 143, column: 15, scope: !2058)
!2189 = !DILocation(line: 159, column: 19, scope: !2058)
!2190 = !DILocation(line: 159, column: 25, scope: !2058)
!2191 = !DILocation(line: 159, column: 15, scope: !2058)
!2192 = !DILocation(line: 214, column: 15, scope: !2058)
!2193 = !DILocation(line: 175, column: 19, scope: !2058)
!2194 = !DILocation(line: 175, column: 25, scope: !2058)
!2195 = !DILocation(line: 175, column: 15, scope: !2058)
!2196 = !DILocation(line: 214, column: 21, scope: !2058)
!2197 = !DILocation(line: 191, column: 19, scope: !2058)
!2198 = !DILocation(line: 191, column: 25, scope: !2058)
!2199 = !DILocation(line: 191, column: 15, scope: !2058)
!2200 = !DILocation(line: 214, column: 27, scope: !2058)
!2201 = !DILocation(line: 207, column: 19, scope: !2058)
!2202 = !DILocation(line: 207, column: 25, scope: !2058)
!2203 = !DILocation(line: 207, column: 15, scope: !2058)
!2204 = !DILocation(line: 214, column: 33, scope: !2058)
!2205 = !DILocation(line: 220, column: 16, scope: !2058)
!2206 = !DILocation(line: 220, column: 14, scope: !2058)
!2207 = !DILocation(line: 290, column: 9, scope: !2058)
!2208 = !DILocation(line: 291, column: 11, scope: !2058)
!2209 = !DILocation(line: 140, column: 19, scope: !2058)
!2210 = !DILocation(line: 140, column: 25, scope: !2058)
!2211 = !DILocation(line: 140, column: 15, scope: !2058)
!2212 = !DILocation(line: 156, column: 19, scope: !2058)
!2213 = !DILocation(line: 156, column: 25, scope: !2058)
!2214 = !DILocation(line: 156, column: 15, scope: !2058)
!2215 = !DILocation(line: 211, column: 15, scope: !2058)
!2216 = !DILocation(line: 172, column: 19, scope: !2058)
!2217 = !DILocation(line: 172, column: 25, scope: !2058)
!2218 = !DILocation(line: 172, column: 15, scope: !2058)
!2219 = !DILocation(line: 211, column: 21, scope: !2058)
!2220 = !DILocation(line: 188, column: 19, scope: !2058)
!2221 = !DILocation(line: 188, column: 25, scope: !2058)
!2222 = !DILocation(line: 188, column: 15, scope: !2058)
!2223 = !DILocation(line: 211, column: 27, scope: !2058)
!2224 = !DILocation(line: 211, column: 33, scope: !2058)
!2225 = !DILocation(line: 142, column: 19, scope: !2058)
!2226 = !DILocation(line: 142, column: 25, scope: !2058)
!2227 = !DILocation(line: 142, column: 15, scope: !2058)
!2228 = !DILocation(line: 213, column: 15, scope: !2058)
!2229 = !DILocation(line: 174, column: 19, scope: !2058)
!2230 = !DILocation(line: 174, column: 25, scope: !2058)
!2231 = !DILocation(line: 174, column: 15, scope: !2058)
!2232 = !DILocation(line: 213, column: 21, scope: !2058)
!2233 = !DILocation(line: 190, column: 19, scope: !2058)
!2234 = !DILocation(line: 190, column: 25, scope: !2058)
!2235 = !DILocation(line: 190, column: 15, scope: !2058)
!2236 = !DILocation(line: 213, column: 27, scope: !2058)
!2237 = !DILocation(line: 206, column: 19, scope: !2058)
!2238 = !DILocation(line: 206, column: 25, scope: !2058)
!2239 = !DILocation(line: 206, column: 15, scope: !2058)
!2240 = !DILocation(line: 213, column: 33, scope: !2058)
!2241 = !DILocation(line: 219, column: 16, scope: !2058)
!2242 = !DILocation(line: 219, column: 14, scope: !2058)
!2243 = !DILocation(line: 288, column: 9, scope: !2058)
!2244 = !DILocation(line: 289, column: 11, scope: !2058)
!2245 = !DILocation(line: 302, column: 19, scope: !2058)
!2246 = !DILocation(line: 302, column: 25, scope: !2058)
!2247 = !DILocation(line: 302, column: 15, scope: !2058)
!2248 = !DILocation(line: 217, column: 16, scope: !2058)
!2249 = !DILocation(line: 217, column: 14, scope: !2058)
!2250 = !DILocation(line: 294, column: 9, scope: !2058)
!2251 = !DILocation(line: 295, column: 11, scope: !2058)
!2252 = !DILocation(line: 301, column: 19, scope: !2058)
!2253 = !DILocation(line: 301, column: 25, scope: !2058)
!2254 = !DILocation(line: 301, column: 15, scope: !2058)
!2255 = !DILocation(line: 221, column: 16, scope: !2058)
!2256 = !DILocation(line: 221, column: 14, scope: !2058)
!2257 = !DILocation(line: 292, column: 9, scope: !2058)
!2258 = !DILocation(line: 293, column: 11, scope: !2058)
!2259 = !DILocation(line: 300, column: 19, scope: !2058)
!2260 = !DILocation(line: 300, column: 25, scope: !2058)
!2261 = !DILocation(line: 300, column: 15, scope: !2058)
!2262 = !DILocation(line: 299, column: 19, scope: !2058)
!2263 = !DILocation(line: 299, column: 25, scope: !2058)
!2264 = !DILocation(line: 299, column: 15, scope: !2058)
!2265 = !DILocation(line: 298, column: 19, scope: !2058)
!2266 = !DILocation(line: 298, column: 25, scope: !2058)
!2267 = !DILocation(line: 298, column: 15, scope: !2058)
!2268 = !DILocation(line: 280, column: 9, scope: !2058)
!2269 = !DILocation(line: 281, column: 11, scope: !2058)
!2270 = !DILocation(line: 274, column: 9, scope: !2058)
!2271 = !DILocation(line: 275, column: 11, scope: !2058)
!2272 = !DILocation(line: 272, column: 9, scope: !2058)
!2273 = !DILocation(line: 273, column: 11, scope: !2058)
!2274 = !DILocation(line: 286, column: 19, scope: !2058)
!2275 = !DILocation(line: 286, column: 25, scope: !2058)
!2276 = !DILocation(line: 286, column: 15, scope: !2058)
!2277 = !DILocation(line: 278, column: 9, scope: !2058)
!2278 = !DILocation(line: 279, column: 11, scope: !2058)
!2279 = !DILocation(line: 285, column: 19, scope: !2058)
!2280 = !DILocation(line: 285, column: 25, scope: !2058)
!2281 = !DILocation(line: 285, column: 15, scope: !2058)
!2282 = !DILocation(line: 276, column: 9, scope: !2058)
!2283 = !DILocation(line: 277, column: 11, scope: !2058)
!2284 = !DILocation(line: 284, column: 19, scope: !2058)
!2285 = !DILocation(line: 284, column: 25, scope: !2058)
!2286 = !DILocation(line: 284, column: 15, scope: !2058)
!2287 = !DILocation(line: 283, column: 19, scope: !2058)
!2288 = !DILocation(line: 283, column: 25, scope: !2058)
!2289 = !DILocation(line: 283, column: 15, scope: !2058)
!2290 = !DILocation(line: 282, column: 19, scope: !2058)
!2291 = !DILocation(line: 282, column: 25, scope: !2058)
!2292 = !DILocation(line: 282, column: 15, scope: !2058)
!2293 = !DILocation(line: 264, column: 9, scope: !2058)
!2294 = !DILocation(line: 265, column: 11, scope: !2058)
!2295 = !DILocation(line: 258, column: 9, scope: !2058)
!2296 = !DILocation(line: 259, column: 11, scope: !2058)
!2297 = !DILocation(line: 256, column: 9, scope: !2058)
!2298 = !DILocation(line: 257, column: 11, scope: !2058)
!2299 = !DILocation(line: 270, column: 19, scope: !2058)
!2300 = !DILocation(line: 270, column: 25, scope: !2058)
!2301 = !DILocation(line: 270, column: 15, scope: !2058)
!2302 = !DILocation(line: 262, column: 9, scope: !2058)
!2303 = !DILocation(line: 263, column: 11, scope: !2058)
!2304 = !DILocation(line: 269, column: 19, scope: !2058)
!2305 = !DILocation(line: 269, column: 25, scope: !2058)
!2306 = !DILocation(line: 269, column: 15, scope: !2058)
!2307 = !DILocation(line: 260, column: 9, scope: !2058)
!2308 = !DILocation(line: 261, column: 11, scope: !2058)
!2309 = !DILocation(line: 268, column: 19, scope: !2058)
!2310 = !DILocation(line: 268, column: 25, scope: !2058)
!2311 = !DILocation(line: 268, column: 15, scope: !2058)
!2312 = !DILocation(line: 267, column: 19, scope: !2058)
!2313 = !DILocation(line: 267, column: 25, scope: !2058)
!2314 = !DILocation(line: 267, column: 15, scope: !2058)
!2315 = !DILocation(line: 266, column: 19, scope: !2058)
!2316 = !DILocation(line: 266, column: 25, scope: !2058)
!2317 = !DILocation(line: 266, column: 15, scope: !2058)
!2318 = !DILocation(line: 248, column: 9, scope: !2058)
!2319 = !DILocation(line: 249, column: 11, scope: !2058)
!2320 = !DILocation(line: 242, column: 9, scope: !2058)
!2321 = !DILocation(line: 243, column: 11, scope: !2058)
!2322 = !DILocation(line: 240, column: 9, scope: !2058)
!2323 = !DILocation(line: 241, column: 11, scope: !2058)
!2324 = !DILocation(line: 254, column: 19, scope: !2058)
!2325 = !DILocation(line: 254, column: 25, scope: !2058)
!2326 = !DILocation(line: 254, column: 15, scope: !2058)
!2327 = !DILocation(line: 246, column: 9, scope: !2058)
!2328 = !DILocation(line: 247, column: 11, scope: !2058)
!2329 = !DILocation(line: 253, column: 19, scope: !2058)
!2330 = !DILocation(line: 253, column: 25, scope: !2058)
!2331 = !DILocation(line: 253, column: 15, scope: !2058)
!2332 = !DILocation(line: 244, column: 9, scope: !2058)
!2333 = !DILocation(line: 245, column: 11, scope: !2058)
!2334 = !DILocation(line: 252, column: 19, scope: !2058)
!2335 = !DILocation(line: 252, column: 25, scope: !2058)
!2336 = !DILocation(line: 252, column: 15, scope: !2058)
!2337 = !DILocation(line: 251, column: 19, scope: !2058)
!2338 = !DILocation(line: 251, column: 25, scope: !2058)
!2339 = !DILocation(line: 251, column: 15, scope: !2058)
!2340 = !DILocation(line: 250, column: 19, scope: !2058)
!2341 = !DILocation(line: 250, column: 25, scope: !2058)
!2342 = !DILocation(line: 250, column: 15, scope: !2058)
!2343 = !DILocation(line: 231, column: 9, scope: !2058)
!2344 = !DILocation(line: 232, column: 11, scope: !2058)
!2345 = !DILocation(line: 225, column: 9, scope: !2058)
!2346 = !DILocation(line: 226, column: 11, scope: !2058)
!2347 = !DILocation(line: 223, column: 9, scope: !2058)
!2348 = !DILocation(line: 238, column: 19, scope: !2058)
!2349 = !DILocation(line: 238, column: 25, scope: !2058)
!2350 = !DILocation(line: 238, column: 15, scope: !2058)
!2351 = !DILocation(line: 229, column: 9, scope: !2058)
!2352 = !DILocation(line: 230, column: 11, scope: !2058)
!2353 = !DILocation(line: 237, column: 19, scope: !2058)
!2354 = !DILocation(line: 237, column: 25, scope: !2058)
!2355 = !DILocation(line: 237, column: 15, scope: !2058)
!2356 = !DILocation(line: 227, column: 9, scope: !2058)
!2357 = !DILocation(line: 228, column: 11, scope: !2058)
!2358 = !DILocation(line: 236, column: 19, scope: !2058)
!2359 = !DILocation(line: 236, column: 25, scope: !2058)
!2360 = !DILocation(line: 236, column: 15, scope: !2058)
!2361 = !DILocation(line: 235, column: 19, scope: !2058)
!2362 = !DILocation(line: 235, column: 25, scope: !2058)
!2363 = !DILocation(line: 235, column: 15, scope: !2058)
!2364 = !DILocation(line: 234, column: 51, scope: !2058)
!2365 = !DILocation(line: 234, column: 22, scope: !2058)
!2366 = !DILocation(line: 233, column: 19, scope: !2058)
!2367 = !DILocation(line: 233, column: 25, scope: !2058)
!2368 = !DILocation(line: 234, column: 9, scope: !2058)
!2369 = !DILocation(line: 113, column: 42, scope: !2020)
!2370 = !DILocation(line: 113, column: 3, scope: !2020)
!2371 = distinct !{!2371, !2021, !2372, !109}
!2372 = !DILocation(line: 303, column: 3, scope: !2017)
!2373 = !DILocation(line: 306, column: 12, scope: !1962)
!2374 = !DILocation(line: 307, column: 3, scope: !1962)
!2375 = !DILocation(line: 307, column: 12, scope: !1962)
!2376 = !DILocation(line: 308, column: 3, scope: !1962)
!2377 = !DILocation(line: 308, column: 12, scope: !1962)
!2378 = !DILocation(line: 309, column: 3, scope: !1962)
!2379 = !DILocation(line: 309, column: 12, scope: !1962)
!2380 = !DILocation(line: 310, column: 3, scope: !1962)
!2381 = !DILocation(line: 310, column: 12, scope: !1962)
!2382 = !DILocation(line: 311, column: 3, scope: !1962)
!2383 = !DILocation(line: 311, column: 12, scope: !1962)
!2384 = !DILocation(line: 312, column: 3, scope: !1962)
!2385 = !DILocation(line: 312, column: 12, scope: !1962)
!2386 = !DILocation(line: 313, column: 3, scope: !1962)
!2387 = !DILocation(line: 313, column: 12, scope: !1962)
!2388 = !DILocation(line: 314, column: 3, scope: !1962)
!2389 = !DILocation(line: 314, column: 12, scope: !1962)
!2390 = !DILocation(line: 315, column: 3, scope: !1962)
!2391 = !DILocation(line: 315, column: 12, scope: !1962)
!2392 = !DILocation(line: 316, column: 3, scope: !1962)
!2393 = !DILocation(line: 316, column: 13, scope: !1962)
!2394 = !DILocation(line: 317, column: 3, scope: !1962)
!2395 = !DILocation(line: 317, column: 13, scope: !1962)
!2396 = !DILocation(line: 318, column: 3, scope: !1962)
!2397 = !DILocation(line: 318, column: 13, scope: !1962)
!2398 = !DILocation(line: 319, column: 3, scope: !1962)
!2399 = !DILocation(line: 319, column: 13, scope: !1962)
!2400 = !DILocation(line: 320, column: 3, scope: !1962)
!2401 = !DILocation(line: 320, column: 13, scope: !1962)
!2402 = !DILocation(line: 321, column: 3, scope: !1962)
!2403 = !DILocation(line: 321, column: 13, scope: !1962)
!2404 = !DILocation(line: 322, column: 3, scope: !1962)
!2405 = !DILocation(line: 322, column: 13, scope: !1962)
!2406 = !DILocation(line: 323, column: 3, scope: !1962)
!2407 = !DILocation(line: 323, column: 13, scope: !1962)
!2408 = !DILocation(line: 324, column: 3, scope: !1962)
!2409 = !DILocation(line: 324, column: 13, scope: !1962)
!2410 = !DILocation(line: 325, column: 3, scope: !1962)
!2411 = !DILocation(line: 325, column: 13, scope: !1962)
!2412 = !DILocation(line: 326, column: 3, scope: !1962)
!2413 = !DILocation(line: 326, column: 13, scope: !1962)
!2414 = !DILocation(line: 327, column: 3, scope: !1962)
!2415 = !DILocation(line: 327, column: 13, scope: !1962)
!2416 = !DILocation(line: 328, column: 3, scope: !1962)
!2417 = !DILocation(line: 328, column: 13, scope: !1962)
!2418 = !DILocation(line: 329, column: 3, scope: !1962)
!2419 = !DILocation(line: 329, column: 13, scope: !1962)
!2420 = !DILocation(line: 330, column: 3, scope: !1962)
!2421 = !DILocation(line: 330, column: 13, scope: !1962)
!2422 = !DILocation(line: 331, column: 1, scope: !1962)
!2423 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_finalize", scope: !49, file: !49, line: 524, type: !1866, scopeLine: 524, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2424 = !DILocalVariable(name: "state", arg: 1, scope: !2423, file: !49, line: 524, type: !1868)
!2425 = !DILocation(line: 0, scope: !2423)
!2426 = !DILocation(line: 525, column: 27, scope: !2423)
!2427 = !DILocation(line: 525, column: 3, scope: !2423)
!2428 = !DILocation(line: 526, column: 3, scope: !2423)
!2429 = !DILocation(line: 526, column: 29, scope: !2423)
!2430 = !DILocation(line: 527, column: 1, scope: !2423)
!2431 = distinct !DISubprogram(name: "keccak_finalize", scope: !49, file: !49, line: 388, type: !2432, scopeLine: 389, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2432 = !DISubroutineType(types: !2433)
!2433 = !{null, !1878, !14, !14, !7}
!2434 = !DILocalVariable(name: "s", arg: 1, scope: !2431, file: !49, line: 388, type: !1878)
!2435 = !DILocation(line: 0, scope: !2431)
!2436 = !DILocalVariable(name: "pos", arg: 2, scope: !2431, file: !49, line: 388, type: !14)
!2437 = !DILocalVariable(name: "r", arg: 3, scope: !2431, file: !49, line: 388, type: !14)
!2438 = !DILocalVariable(name: "p", arg: 4, scope: !2431, file: !49, line: 389, type: !7)
!2439 = !DILocation(line: 390, column: 34, scope: !2431)
!2440 = !DILocation(line: 390, column: 29, scope: !2431)
!2441 = !DILocation(line: 390, column: 9, scope: !2431)
!2442 = !DILocation(line: 390, column: 3, scope: !2431)
!2443 = !DILocation(line: 390, column: 14, scope: !2431)
!2444 = !DILocation(line: 391, column: 7, scope: !2431)
!2445 = !DILocation(line: 391, column: 3, scope: !2431)
!2446 = !DILocation(line: 391, column: 16, scope: !2431)
!2447 = !DILocation(line: 392, column: 1, scope: !2431)
!2448 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeeze", scope: !49, file: !49, line: 540, type: !2449, scopeLine: 540, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2449 = !DISubroutineType(types: !2450)
!2450 = !{null, !6, !12, !1868}
!2451 = !DILocalVariable(name: "out", arg: 1, scope: !2448, file: !49, line: 540, type: !6)
!2452 = !DILocation(line: 0, scope: !2448)
!2453 = !DILocalVariable(name: "outlen", arg: 2, scope: !2448, file: !49, line: 540, type: !12)
!2454 = !DILocalVariable(name: "state", arg: 3, scope: !2448, file: !49, line: 540, type: !1868)
!2455 = !DILocation(line: 542, column: 28, scope: !2448)
!2456 = !DILocation(line: 541, column: 31, scope: !2448)
!2457 = !DILocation(line: 541, column: 3, scope: !2448)
!2458 = !DILocation(line: 541, column: 29, scope: !2448)
!2459 = !DILocation(line: 543, column: 1, scope: !2448)
!2460 = distinct !DISubprogram(name: "keccak_squeeze", scope: !49, file: !49, line: 410, type: !2461, scopeLine: 411, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2461 = !DISubroutineType(types: !2462)
!2462 = !{!14, !6, !12, !1878, !14, !14}
!2463 = !DILocalVariable(name: "out", arg: 1, scope: !2460, file: !49, line: 410, type: !6)
!2464 = !DILocation(line: 0, scope: !2460)
!2465 = !DILocalVariable(name: "outlen", arg: 2, scope: !2460, file: !49, line: 410, type: !12)
!2466 = !DILocalVariable(name: "s", arg: 3, scope: !2460, file: !49, line: 410, type: !1878)
!2467 = !DILocalVariable(name: "pos", arg: 4, scope: !2460, file: !49, line: 411, type: !14)
!2468 = !DILocalVariable(name: "r", arg: 5, scope: !2460, file: !49, line: 411, type: !14)
!2469 = !DILocation(line: 414, column: 3, scope: !2460)
!2470 = !DILocation(line: 415, column: 13, scope: !2471)
!2471 = distinct !DILexicalBlock(scope: !2472, file: !49, line: 415, column: 9)
!2472 = distinct !DILexicalBlock(scope: !2460, file: !49, line: 414, column: 18)
!2473 = !DILocation(line: 416, column: 7, scope: !2474)
!2474 = distinct !DILexicalBlock(scope: !2471, file: !49, line: 415, column: 19)
!2475 = !DILocation(line: 418, column: 5, scope: !2474)
!2476 = !DILocalVariable(name: "i", scope: !2460, file: !49, line: 412, type: !14)
!2477 = !DILocation(line: 419, column: 10, scope: !2478)
!2478 = distinct !DILexicalBlock(scope: !2472, file: !49, line: 419, column: 5)
!2479 = !DILocation(line: 419, scope: !2478)
!2480 = !DILocation(line: 419, column: 21, scope: !2481)
!2481 = distinct !DILexicalBlock(scope: !2478, file: !49, line: 419, column: 5)
!2482 = !DILocation(line: 419, column: 25, scope: !2481)
!2483 = !DILocation(line: 419, column: 5, scope: !2478)
!2484 = !DILocation(line: 420, column: 20, scope: !2481)
!2485 = !DILocation(line: 420, column: 16, scope: !2481)
!2486 = !DILocation(line: 420, column: 30, scope: !2481)
!2487 = !DILocation(line: 420, column: 25, scope: !2481)
!2488 = !DILocation(line: 420, column: 14, scope: !2481)
!2489 = !DILocation(line: 420, column: 11, scope: !2481)
!2490 = !DILocation(line: 419, column: 47, scope: !2481)
!2491 = !DILocation(line: 419, column: 5, scope: !2481)
!2492 = distinct !{!2492, !2483, !2493, !109}
!2493 = !DILocation(line: 420, column: 38, scope: !2478)
!2494 = !DILocation(line: 421, column: 17, scope: !2472)
!2495 = !DILocation(line: 421, column: 12, scope: !2472)
!2496 = distinct !{!2496, !2469, !2497, !109}
!2497 = !DILocation(line: 423, column: 3, scope: !2460)
!2498 = !DILocation(line: 425, column: 3, scope: !2460)
!2499 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb_once", scope: !49, file: !49, line: 556, type: !1896, scopeLine: 557, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2500 = !DILocalVariable(name: "state", arg: 1, scope: !2499, file: !49, line: 556, type: !1868)
!2501 = !DILocation(line: 0, scope: !2499)
!2502 = !DILocalVariable(name: "in", arg: 2, scope: !2499, file: !49, line: 556, type: !77)
!2503 = !DILocalVariable(name: "inlen", arg: 3, scope: !2499, file: !49, line: 557, type: !12)
!2504 = !DILocation(line: 558, column: 3, scope: !2499)
!2505 = !DILocation(line: 559, column: 3, scope: !2499)
!2506 = !DILocation(line: 559, column: 29, scope: !2499)
!2507 = !DILocation(line: 560, column: 1, scope: !2499)
!2508 = distinct !DISubprogram(name: "keccak_absorb_once", scope: !49, file: !49, line: 441, type: !2509, scopeLine: 442, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2509 = !DISubroutineType(types: !2510)
!2510 = !{null, !1878, !14, !77, !12, !7}
!2511 = !DILocalVariable(name: "s", arg: 1, scope: !2508, file: !49, line: 441, type: !1878)
!2512 = !DILocation(line: 0, scope: !2508)
!2513 = !DILocalVariable(name: "r", arg: 2, scope: !2508, file: !49, line: 441, type: !14)
!2514 = !DILocalVariable(name: "in", arg: 3, scope: !2508, file: !49, line: 442, type: !77)
!2515 = !DILocalVariable(name: "inlen", arg: 4, scope: !2508, file: !49, line: 442, type: !12)
!2516 = !DILocalVariable(name: "p", arg: 5, scope: !2508, file: !49, line: 442, type: !7)
!2517 = !DILocalVariable(name: "i", scope: !2508, file: !49, line: 443, type: !14)
!2518 = !DILocation(line: 445, column: 8, scope: !2519)
!2519 = distinct !DILexicalBlock(scope: !2508, file: !49, line: 445, column: 3)
!2520 = !DILocation(line: 445, scope: !2519)
!2521 = !DILocation(line: 445, column: 17, scope: !2522)
!2522 = distinct !DILexicalBlock(scope: !2519, file: !49, line: 445, column: 3)
!2523 = !DILocation(line: 445, column: 3, scope: !2519)
!2524 = !DILocation(line: 448, column: 3, scope: !2508)
!2525 = !DILocation(line: 446, column: 5, scope: !2522)
!2526 = !DILocation(line: 446, column: 10, scope: !2522)
!2527 = !DILocation(line: 445, column: 24, scope: !2522)
!2528 = !DILocation(line: 445, column: 3, scope: !2522)
!2529 = distinct !{!2529, !2523, !2530, !109}
!2530 = !DILocation(line: 446, column: 12, scope: !2519)
!2531 = !DILocation(line: 448, column: 16, scope: !2508)
!2532 = !DILocation(line: 449, column: 5, scope: !2533)
!2533 = distinct !DILexicalBlock(scope: !2534, file: !49, line: 449, column: 5)
!2534 = distinct !DILexicalBlock(scope: !2508, file: !49, line: 448, column: 22)
!2535 = !DILocation(line: 456, column: 3, scope: !2536)
!2536 = distinct !DILexicalBlock(scope: !2508, file: !49, line: 456, column: 3)
!2537 = !DILocation(line: 449, scope: !2533)
!2538 = !DILocation(line: 449, column: 19, scope: !2539)
!2539 = distinct !DILexicalBlock(scope: !2533, file: !49, line: 449, column: 5)
!2540 = !DILocation(line: 450, column: 29, scope: !2539)
!2541 = !DILocation(line: 450, column: 25, scope: !2539)
!2542 = !DILocation(line: 450, column: 15, scope: !2539)
!2543 = !DILocation(line: 450, column: 7, scope: !2539)
!2544 = !DILocation(line: 450, column: 12, scope: !2539)
!2545 = !DILocation(line: 449, column: 29, scope: !2539)
!2546 = !DILocation(line: 449, column: 5, scope: !2539)
!2547 = distinct !{!2547, !2532, !2548, !109}
!2548 = !DILocation(line: 450, column: 32, scope: !2533)
!2549 = !DILocation(line: 451, column: 8, scope: !2534)
!2550 = !DILocation(line: 452, column: 11, scope: !2534)
!2551 = !DILocation(line: 453, column: 5, scope: !2534)
!2552 = distinct !{!2552, !2524, !2553, !109}
!2553 = !DILocation(line: 454, column: 3, scope: !2508)
!2554 = !DILocation(line: 456, scope: !2536)
!2555 = !DILocation(line: 456, column: 17, scope: !2556)
!2556 = distinct !DILexicalBlock(scope: !2536, file: !49, line: 456, column: 3)
!2557 = !DILocation(line: 457, column: 27, scope: !2556)
!2558 = !DILocation(line: 457, column: 17, scope: !2556)
!2559 = !DILocation(line: 457, column: 38, scope: !2556)
!2560 = !DILocation(line: 457, column: 33, scope: !2556)
!2561 = !DILocation(line: 457, column: 9, scope: !2556)
!2562 = !DILocation(line: 457, column: 5, scope: !2556)
!2563 = !DILocation(line: 457, column: 14, scope: !2556)
!2564 = !DILocation(line: 456, column: 27, scope: !2556)
!2565 = !DILocation(line: 456, column: 3, scope: !2556)
!2566 = distinct !{!2566, !2535, !2567, !109}
!2567 = !DILocation(line: 457, column: 46, scope: !2536)
!2568 = !DILocation(line: 459, column: 15, scope: !2508)
!2569 = !DILocation(line: 459, column: 32, scope: !2508)
!2570 = !DILocation(line: 459, column: 27, scope: !2508)
!2571 = !DILocation(line: 459, column: 7, scope: !2508)
!2572 = !DILocation(line: 459, column: 3, scope: !2508)
!2573 = !DILocation(line: 459, column: 12, scope: !2508)
!2574 = !DILocation(line: 460, column: 8, scope: !2508)
!2575 = !DILocation(line: 460, column: 13, scope: !2508)
!2576 = !DILocation(line: 460, column: 3, scope: !2508)
!2577 = !DILocation(line: 460, column: 18, scope: !2508)
!2578 = !DILocation(line: 461, column: 1, scope: !2508)
!2579 = distinct !DISubprogram(name: "load64", scope: !49, file: !49, line: 22, type: !2580, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2580 = !DISubroutineType(types: !2581)
!2581 = !{!45, !77}
!2582 = !DILocalVariable(name: "x", arg: 1, scope: !2579, file: !49, line: 22, type: !77)
!2583 = !DILocation(line: 0, scope: !2579)
!2584 = !DILocalVariable(name: "r", scope: !2579, file: !49, line: 24, type: !45)
!2585 = !DILocalVariable(name: "i", scope: !2579, file: !49, line: 23, type: !14)
!2586 = !DILocation(line: 26, column: 8, scope: !2587)
!2587 = distinct !DILexicalBlock(scope: !2579, file: !49, line: 26, column: 3)
!2588 = !DILocation(line: 26, scope: !2587)
!2589 = !DILocation(line: 26, column: 17, scope: !2590)
!2590 = distinct !DILexicalBlock(scope: !2587, file: !49, line: 26, column: 3)
!2591 = !DILocation(line: 26, column: 3, scope: !2587)
!2592 = !DILocation(line: 27, column: 20, scope: !2590)
!2593 = !DILocation(line: 27, column: 10, scope: !2590)
!2594 = !DILocation(line: 27, column: 30, scope: !2590)
!2595 = !DILocation(line: 27, column: 25, scope: !2590)
!2596 = !DILocation(line: 27, column: 7, scope: !2590)
!2597 = !DILocation(line: 26, column: 23, scope: !2590)
!2598 = !DILocation(line: 26, column: 3, scope: !2590)
!2599 = distinct !{!2599, !2591, !2600, !109}
!2600 = !DILocation(line: 27, column: 32, scope: !2587)
!2601 = !DILocation(line: 29, column: 3, scope: !2579)
!2602 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeezeblocks", scope: !49, file: !49, line: 575, type: !2449, scopeLine: 575, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2603 = !DILocalVariable(name: "out", arg: 1, scope: !2602, file: !49, line: 575, type: !6)
!2604 = !DILocation(line: 0, scope: !2602)
!2605 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2602, file: !49, line: 575, type: !12)
!2606 = !DILocalVariable(name: "state", arg: 3, scope: !2602, file: !49, line: 575, type: !1868)
!2607 = !DILocation(line: 576, column: 3, scope: !2602)
!2608 = !DILocation(line: 577, column: 1, scope: !2602)
!2609 = distinct !DISubprogram(name: "keccak_squeezeblocks", scope: !49, file: !49, line: 477, type: !2610, scopeLine: 478, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2610 = !DISubroutineType(types: !2611)
!2611 = !{null, !6, !12, !1878, !14}
!2612 = !DILocalVariable(name: "out", arg: 1, scope: !2609, file: !49, line: 477, type: !6)
!2613 = !DILocation(line: 0, scope: !2609)
!2614 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2609, file: !49, line: 477, type: !12)
!2615 = !DILocalVariable(name: "s", arg: 3, scope: !2609, file: !49, line: 477, type: !1878)
!2616 = !DILocalVariable(name: "r", arg: 4, scope: !2609, file: !49, line: 478, type: !14)
!2617 = !DILocation(line: 481, column: 3, scope: !2609)
!2618 = !DILocation(line: 482, column: 5, scope: !2619)
!2619 = distinct !DILexicalBlock(scope: !2609, file: !49, line: 481, column: 19)
!2620 = !DILocalVariable(name: "i", scope: !2609, file: !49, line: 479, type: !14)
!2621 = !DILocation(line: 483, column: 10, scope: !2622)
!2622 = distinct !DILexicalBlock(scope: !2619, file: !49, line: 483, column: 5)
!2623 = !DILocation(line: 483, scope: !2622)
!2624 = !DILocation(line: 483, column: 19, scope: !2625)
!2625 = distinct !DILexicalBlock(scope: !2622, file: !49, line: 483, column: 5)
!2626 = !DILocation(line: 483, column: 5, scope: !2622)
!2627 = !DILocation(line: 484, column: 23, scope: !2625)
!2628 = !DILocation(line: 484, column: 19, scope: !2625)
!2629 = !DILocation(line: 484, column: 28, scope: !2625)
!2630 = !DILocation(line: 484, column: 7, scope: !2625)
!2631 = !DILocation(line: 483, column: 29, scope: !2625)
!2632 = !DILocation(line: 483, column: 5, scope: !2625)
!2633 = distinct !{!2633, !2626, !2634, !109}
!2634 = !DILocation(line: 484, column: 32, scope: !2622)
!2635 = !DILocation(line: 485, column: 9, scope: !2619)
!2636 = !DILocation(line: 486, column: 13, scope: !2619)
!2637 = distinct !{!2637, !2617, !2638, !109}
!2638 = !DILocation(line: 487, column: 3, scope: !2609)
!2639 = !DILocation(line: 488, column: 1, scope: !2609)
!2640 = distinct !DISubprogram(name: "store64", scope: !49, file: !49, line: 41, type: !2641, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2641 = !DISubroutineType(types: !2642)
!2642 = !{null, !6, !45}
!2643 = !DILocalVariable(name: "x", arg: 1, scope: !2640, file: !49, line: 41, type: !6)
!2644 = !DILocation(line: 0, scope: !2640)
!2645 = !DILocalVariable(name: "u", arg: 2, scope: !2640, file: !49, line: 41, type: !45)
!2646 = !DILocalVariable(name: "i", scope: !2640, file: !49, line: 42, type: !14)
!2647 = !DILocation(line: 44, column: 8, scope: !2648)
!2648 = distinct !DILexicalBlock(scope: !2640, file: !49, line: 44, column: 3)
!2649 = !DILocation(line: 44, scope: !2648)
!2650 = !DILocation(line: 44, column: 17, scope: !2651)
!2651 = distinct !DILexicalBlock(scope: !2648, file: !49, line: 44, column: 3)
!2652 = !DILocation(line: 44, column: 3, scope: !2648)
!2653 = !DILocation(line: 45, column: 19, scope: !2651)
!2654 = !DILocation(line: 45, column: 14, scope: !2651)
!2655 = !DILocation(line: 45, column: 12, scope: !2651)
!2656 = !DILocation(line: 45, column: 5, scope: !2651)
!2657 = !DILocation(line: 45, column: 10, scope: !2651)
!2658 = !DILocation(line: 44, column: 23, scope: !2651)
!2659 = !DILocation(line: 44, column: 3, scope: !2651)
!2660 = distinct !{!2660, !2652, !2661, !109}
!2661 = !DILocation(line: 45, column: 21, scope: !2648)
!2662 = !DILocation(line: 46, column: 1, scope: !2640)
!2663 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_init", scope: !49, file: !49, line: 586, type: !1866, scopeLine: 586, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2664 = !DILocalVariable(name: "state", arg: 1, scope: !2663, file: !49, line: 586, type: !1868)
!2665 = !DILocation(line: 0, scope: !2663)
!2666 = !DILocation(line: 587, column: 3, scope: !2663)
!2667 = !DILocation(line: 588, column: 3, scope: !2663)
!2668 = !DILocation(line: 588, column: 29, scope: !2663)
!2669 = !DILocation(line: 589, column: 1, scope: !2663)
!2670 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb", scope: !49, file: !49, line: 601, type: !1896, scopeLine: 601, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2671 = !DILocalVariable(name: "state", arg: 1, scope: !2670, file: !49, line: 601, type: !1868)
!2672 = !DILocation(line: 0, scope: !2670)
!2673 = !DILocalVariable(name: "in", arg: 2, scope: !2670, file: !49, line: 601, type: !77)
!2674 = !DILocalVariable(name: "inlen", arg: 3, scope: !2670, file: !49, line: 601, type: !12)
!2675 = !DILocation(line: 602, column: 53, scope: !2670)
!2676 = !DILocation(line: 602, column: 31, scope: !2670)
!2677 = !DILocation(line: 602, column: 3, scope: !2670)
!2678 = !DILocation(line: 602, column: 29, scope: !2670)
!2679 = !DILocation(line: 604, column: 1, scope: !2670)
!2680 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_finalize", scope: !49, file: !49, line: 613, type: !1866, scopeLine: 613, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2681 = !DILocalVariable(name: "state", arg: 1, scope: !2680, file: !49, line: 613, type: !1868)
!2682 = !DILocation(line: 0, scope: !2680)
!2683 = !DILocation(line: 614, column: 27, scope: !2680)
!2684 = !DILocation(line: 614, column: 3, scope: !2680)
!2685 = !DILocation(line: 615, column: 3, scope: !2680)
!2686 = !DILocation(line: 615, column: 29, scope: !2680)
!2687 = !DILocation(line: 616, column: 1, scope: !2680)
!2688 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeeze", scope: !49, file: !49, line: 629, type: !2449, scopeLine: 629, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2689 = !DILocalVariable(name: "out", arg: 1, scope: !2688, file: !49, line: 629, type: !6)
!2690 = !DILocation(line: 0, scope: !2688)
!2691 = !DILocalVariable(name: "outlen", arg: 2, scope: !2688, file: !49, line: 629, type: !12)
!2692 = !DILocalVariable(name: "state", arg: 3, scope: !2688, file: !49, line: 629, type: !1868)
!2693 = !DILocation(line: 631, column: 28, scope: !2688)
!2694 = !DILocation(line: 630, column: 31, scope: !2688)
!2695 = !DILocation(line: 630, column: 3, scope: !2688)
!2696 = !DILocation(line: 630, column: 29, scope: !2688)
!2697 = !DILocation(line: 632, column: 1, scope: !2688)
!2698 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb_once", scope: !49, file: !49, line: 645, type: !1896, scopeLine: 646, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2699 = !DILocalVariable(name: "state", arg: 1, scope: !2698, file: !49, line: 645, type: !1868)
!2700 = !DILocation(line: 0, scope: !2698)
!2701 = !DILocalVariable(name: "in", arg: 2, scope: !2698, file: !49, line: 645, type: !77)
!2702 = !DILocalVariable(name: "inlen", arg: 3, scope: !2698, file: !49, line: 646, type: !12)
!2703 = !DILocation(line: 647, column: 3, scope: !2698)
!2704 = !DILocation(line: 648, column: 3, scope: !2698)
!2705 = !DILocation(line: 648, column: 29, scope: !2698)
!2706 = !DILocation(line: 649, column: 1, scope: !2698)
!2707 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeezeblocks", scope: !49, file: !49, line: 664, type: !2449, scopeLine: 664, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2708 = !DILocalVariable(name: "out", arg: 1, scope: !2707, file: !49, line: 664, type: !6)
!2709 = !DILocation(line: 0, scope: !2707)
!2710 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2707, file: !49, line: 664, type: !12)
!2711 = !DILocalVariable(name: "state", arg: 3, scope: !2707, file: !49, line: 664, type: !1868)
!2712 = !DILocation(line: 665, column: 3, scope: !2707)
!2713 = !DILocation(line: 666, column: 1, scope: !2707)
!2714 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128", scope: !49, file: !49, line: 678, type: !2715, scopeLine: 678, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2715 = !DISubroutineType(types: !2716)
!2716 = !{null, !6, !12, !77, !12}
!2717 = !DILocalVariable(name: "out", arg: 1, scope: !2714, file: !49, line: 678, type: !6)
!2718 = !DILocation(line: 0, scope: !2714)
!2719 = !DILocalVariable(name: "outlen", arg: 2, scope: !2714, file: !49, line: 678, type: !12)
!2720 = !DILocalVariable(name: "in", arg: 3, scope: !2714, file: !49, line: 678, type: !77)
!2721 = !DILocalVariable(name: "inlen", arg: 4, scope: !2714, file: !49, line: 678, type: !12)
!2722 = !DILocalVariable(name: "state", scope: !2714, file: !49, line: 680, type: !349)
!2723 = !DILocation(line: 680, column: 16, scope: !2714)
!2724 = !DILocation(line: 682, column: 3, scope: !2714)
!2725 = !DILocation(line: 683, column: 20, scope: !2714)
!2726 = !DILocalVariable(name: "nblocks", scope: !2714, file: !49, line: 679, type: !12)
!2727 = !DILocation(line: 684, column: 3, scope: !2714)
!2728 = !DILocation(line: 685, column: 21, scope: !2714)
!2729 = !DILocation(line: 685, column: 10, scope: !2714)
!2730 = !DILocation(line: 686, column: 18, scope: !2714)
!2731 = !DILocation(line: 686, column: 7, scope: !2714)
!2732 = !DILocation(line: 687, column: 3, scope: !2714)
!2733 = !DILocation(line: 688, column: 1, scope: !2714)
!2734 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256", scope: !49, file: !49, line: 700, type: !2715, scopeLine: 700, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2735 = !DILocalVariable(name: "out", arg: 1, scope: !2734, file: !49, line: 700, type: !6)
!2736 = !DILocation(line: 0, scope: !2734)
!2737 = !DILocalVariable(name: "outlen", arg: 2, scope: !2734, file: !49, line: 700, type: !12)
!2738 = !DILocalVariable(name: "in", arg: 3, scope: !2734, file: !49, line: 700, type: !77)
!2739 = !DILocalVariable(name: "inlen", arg: 4, scope: !2734, file: !49, line: 700, type: !12)
!2740 = !DILocalVariable(name: "state", scope: !2734, file: !49, line: 702, type: !349)
!2741 = !DILocation(line: 702, column: 16, scope: !2734)
!2742 = !DILocation(line: 704, column: 3, scope: !2734)
!2743 = !DILocation(line: 705, column: 20, scope: !2734)
!2744 = !DILocalVariable(name: "nblocks", scope: !2734, file: !49, line: 701, type: !12)
!2745 = !DILocation(line: 706, column: 3, scope: !2734)
!2746 = !DILocation(line: 707, column: 21, scope: !2734)
!2747 = !DILocation(line: 707, column: 10, scope: !2734)
!2748 = !DILocation(line: 708, column: 18, scope: !2734)
!2749 = !DILocation(line: 708, column: 7, scope: !2734)
!2750 = !DILocation(line: 709, column: 3, scope: !2734)
!2751 = !DILocation(line: 710, column: 1, scope: !2734)
!2752 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_256", scope: !49, file: !49, line: 721, type: !2753, scopeLine: 721, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2753 = !DISubroutineType(types: !2754)
!2754 = !{null, !6, !77, !12}
!2755 = !DILocalVariable(name: "h", arg: 1, scope: !2752, file: !49, line: 721, type: !6)
!2756 = !DILocation(line: 0, scope: !2752)
!2757 = !DILocalVariable(name: "in", arg: 2, scope: !2752, file: !49, line: 721, type: !77)
!2758 = !DILocalVariable(name: "inlen", arg: 3, scope: !2752, file: !49, line: 721, type: !12)
!2759 = !DILocalVariable(name: "s", scope: !2752, file: !49, line: 723, type: !2760)
!2760 = !DICompositeType(tag: DW_TAG_array_type, baseType: !45, size: 1600, elements: !2761)
!2761 = !{!2762}
!2762 = !DISubrange(count: 25)
!2763 = !DILocation(line: 723, column: 12, scope: !2752)
!2764 = !DILocation(line: 725, column: 3, scope: !2752)
!2765 = !DILocation(line: 726, column: 3, scope: !2752)
!2766 = !DILocalVariable(name: "i", scope: !2752, file: !49, line: 722, type: !14)
!2767 = !DILocation(line: 727, column: 8, scope: !2768)
!2768 = distinct !DILexicalBlock(scope: !2752, file: !49, line: 727, column: 3)
!2769 = !DILocation(line: 727, scope: !2768)
!2770 = !DILocation(line: 727, column: 17, scope: !2771)
!2771 = distinct !DILexicalBlock(scope: !2768, file: !49, line: 727, column: 3)
!2772 = !DILocation(line: 727, column: 3, scope: !2768)
!2773 = !DILocation(line: 728, column: 19, scope: !2771)
!2774 = !DILocation(line: 728, column: 15, scope: !2771)
!2775 = !DILocation(line: 728, column: 24, scope: !2771)
!2776 = !DILocation(line: 728, column: 5, scope: !2771)
!2777 = !DILocation(line: 727, column: 23, scope: !2771)
!2778 = !DILocation(line: 727, column: 3, scope: !2771)
!2779 = distinct !{!2779, !2772, !2780, !109}
!2780 = !DILocation(line: 728, column: 28, scope: !2768)
!2781 = !DILocation(line: 729, column: 1, scope: !2752)
!2782 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_512", scope: !49, file: !49, line: 740, type: !2753, scopeLine: 740, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2783 = !DILocalVariable(name: "h", arg: 1, scope: !2782, file: !49, line: 740, type: !6)
!2784 = !DILocation(line: 0, scope: !2782)
!2785 = !DILocalVariable(name: "in", arg: 2, scope: !2782, file: !49, line: 740, type: !77)
!2786 = !DILocalVariable(name: "inlen", arg: 3, scope: !2782, file: !49, line: 740, type: !12)
!2787 = !DILocalVariable(name: "s", scope: !2782, file: !49, line: 742, type: !2760)
!2788 = !DILocation(line: 742, column: 12, scope: !2782)
!2789 = !DILocation(line: 744, column: 3, scope: !2782)
!2790 = !DILocation(line: 745, column: 3, scope: !2782)
!2791 = !DILocalVariable(name: "i", scope: !2782, file: !49, line: 741, type: !14)
!2792 = !DILocation(line: 746, column: 8, scope: !2793)
!2793 = distinct !DILexicalBlock(scope: !2782, file: !49, line: 746, column: 3)
!2794 = !DILocation(line: 746, scope: !2793)
!2795 = !DILocation(line: 746, column: 17, scope: !2796)
!2796 = distinct !DILexicalBlock(scope: !2793, file: !49, line: 746, column: 3)
!2797 = !DILocation(line: 746, column: 3, scope: !2793)
!2798 = !DILocation(line: 747, column: 19, scope: !2796)
!2799 = !DILocation(line: 747, column: 15, scope: !2796)
!2800 = !DILocation(line: 747, column: 24, scope: !2796)
!2801 = !DILocation(line: 747, column: 5, scope: !2796)
!2802 = !DILocation(line: 746, column: 23, scope: !2796)
!2803 = !DILocation(line: 746, column: 3, scope: !2796)
!2804 = distinct !{!2804, !2797, !2805, !109}
!2805 = !DILocation(line: 747, column: 28, scope: !2793)
!2806 = !DILocation(line: 748, column: 1, scope: !2782)
!2807 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_kyber_shake128_absorb", scope: !2808, file: !2808, line: 18, type: !2809, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !74, retainedNodes: !24)
!2808 = !DIFile(filename: "../../../ref/symmetric-shake.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!2809 = !DISubroutineType(types: !2810)
!2810 = !{null, !1868, !77, !7, !7}
!2811 = !DILocalVariable(name: "state", arg: 1, scope: !2807, file: !2808, line: 18, type: !1868)
!2812 = !DILocation(line: 0, scope: !2807)
!2813 = !DILocalVariable(name: "seed", arg: 2, scope: !2807, file: !2808, line: 19, type: !77)
!2814 = !DILocalVariable(name: "x", arg: 3, scope: !2807, file: !2808, line: 20, type: !7)
!2815 = !DILocalVariable(name: "y", arg: 4, scope: !2807, file: !2808, line: 21, type: !7)
!2816 = !DILocalVariable(name: "extseed", scope: !2807, file: !2808, line: 23, type: !2817)
!2817 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 272, elements: !2818)
!2818 = !{!2819}
!2819 = !DISubrange(count: 34)
!2820 = !DILocation(line: 23, column: 11, scope: !2807)
!2821 = !DILocation(line: 25, column: 3, scope: !2807)
!2822 = !DILocation(line: 26, column: 3, scope: !2807)
!2823 = !DILocation(line: 26, column: 29, scope: !2807)
!2824 = !DILocation(line: 27, column: 3, scope: !2807)
!2825 = !DILocation(line: 27, column: 29, scope: !2807)
!2826 = !DILocation(line: 29, column: 3, scope: !2807)
!2827 = !DILocation(line: 30, column: 1, scope: !2807)
!2828 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_kyber_shake256_prf", scope: !2808, file: !2808, line: 43, type: !2829, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !74, retainedNodes: !24)
!2829 = !DISubroutineType(types: !2830)
!2830 = !{null, !6, !12, !77, !7}
!2831 = !DILocalVariable(name: "out", arg: 1, scope: !2828, file: !2808, line: 43, type: !6)
!2832 = !DILocation(line: 0, scope: !2828)
!2833 = !DILocalVariable(name: "outlen", arg: 2, scope: !2828, file: !2808, line: 43, type: !12)
!2834 = !DILocalVariable(name: "key", arg: 3, scope: !2828, file: !2808, line: 43, type: !77)
!2835 = !DILocalVariable(name: "nonce", arg: 4, scope: !2828, file: !2808, line: 43, type: !7)
!2836 = !DILocalVariable(name: "extkey", scope: !2828, file: !2808, line: 45, type: !2837)
!2837 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 264, elements: !2838)
!2838 = !{!2839}
!2839 = !DISubrange(count: 33)
!2840 = !DILocation(line: 45, column: 11, scope: !2828)
!2841 = !DILocation(line: 47, column: 3, scope: !2828)
!2842 = !DILocation(line: 48, column: 3, scope: !2828)
!2843 = !DILocation(line: 48, column: 26, scope: !2828)
!2844 = !DILocation(line: 50, column: 3, scope: !2828)
!2845 = !DILocation(line: 51, column: 1, scope: !2828)
!2846 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_kyber_shake256_rkprf", scope: !2808, file: !2808, line: 64, type: !644, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !74, retainedNodes: !24)
!2847 = !DILocalVariable(name: "out", arg: 1, scope: !2846, file: !2808, line: 64, type: !6)
!2848 = !DILocation(line: 0, scope: !2846)
!2849 = !DILocalVariable(name: "key", arg: 2, scope: !2846, file: !2808, line: 64, type: !77)
!2850 = !DILocalVariable(name: "input", arg: 3, scope: !2846, file: !2808, line: 64, type: !77)
!2851 = !DILocalVariable(name: "s", scope: !2846, file: !2808, line: 66, type: !349)
!2852 = !DILocation(line: 66, column: 16, scope: !2846)
!2853 = !DILocation(line: 68, column: 3, scope: !2846)
!2854 = !DILocation(line: 69, column: 3, scope: !2846)
!2855 = !DILocation(line: 70, column: 3, scope: !2846)
!2856 = !DILocation(line: 71, column: 3, scope: !2846)
!2857 = !DILocation(line: 72, column: 3, scope: !2846)
!2858 = !DILocation(line: 73, column: 1, scope: !2846)
!2859 = distinct !DISubprogram(name: "memcpy", scope: !2860, file: !2860, line: 12, type: !2861, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !75, retainedNodes: !24)
!2860 = !DIFile(filename: "../../../ref/builtins.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/kyberLL-pass/build")
!2861 = !DISubroutineType(types: !2862)
!2862 = !{!2863, !2863, !2864, !12}
!2863 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 32)
!2864 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2865, size: 32)
!2865 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!2866 = !DILocalVariable(name: "dest", arg: 1, scope: !2859, file: !2860, line: 12, type: !2863)
!2867 = !DILocation(line: 0, scope: !2859)
!2868 = !DILocalVariable(name: "src", arg: 2, scope: !2859, file: !2860, line: 12, type: !2864)
!2869 = !DILocalVariable(name: "n", arg: 3, scope: !2859, file: !2860, line: 12, type: !12)
!2870 = !DILocalVariable(name: "d", scope: !2859, file: !2860, line: 13, type: !6)
!2871 = !DILocalVariable(name: "s", scope: !2859, file: !2860, line: 14, type: !77)
!2872 = !DILocalVariable(name: "i", scope: !2873, file: !2860, line: 15, type: !12)
!2873 = distinct !DILexicalBlock(scope: !2859, file: !2860, line: 15, column: 3)
!2874 = !DILocation(line: 0, scope: !2873)
!2875 = !DILocation(line: 15, column: 8, scope: !2873)
!2876 = !DILocation(line: 15, scope: !2873)
!2877 = !DILocation(line: 15, column: 24, scope: !2878)
!2878 = distinct !DILexicalBlock(scope: !2873, file: !2860, line: 15, column: 3)
!2879 = !DILocation(line: 15, column: 3, scope: !2873)
!2880 = !DILocation(line: 16, column: 12, scope: !2878)
!2881 = !DILocation(line: 16, column: 5, scope: !2878)
!2882 = !DILocation(line: 16, column: 10, scope: !2878)
!2883 = !DILocation(line: 15, column: 30, scope: !2878)
!2884 = !DILocation(line: 15, column: 3, scope: !2878)
!2885 = distinct !{!2885, !2879, !2886, !109}
!2886 = !DILocation(line: 16, column: 15, scope: !2873)
!2887 = !DILocation(line: 17, column: 3, scope: !2859)
!2888 = distinct !DISubprogram(name: "memcmp", scope: !2860, file: !2860, line: 20, type: !2889, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !75, retainedNodes: !24)
!2889 = !DISubroutineType(types: !2890)
!2890 = !{!25, !2864, !2864, !12}
!2891 = !DILocalVariable(name: "s1", arg: 1, scope: !2888, file: !2860, line: 20, type: !2864)
!2892 = !DILocation(line: 0, scope: !2888)
!2893 = !DILocalVariable(name: "s2", arg: 2, scope: !2888, file: !2860, line: 20, type: !2864)
!2894 = !DILocalVariable(name: "n", arg: 3, scope: !2888, file: !2860, line: 20, type: !12)
!2895 = !DILocalVariable(name: "a", scope: !2888, file: !2860, line: 21, type: !77)
!2896 = !DILocalVariable(name: "b", scope: !2888, file: !2860, line: 22, type: !77)
!2897 = !DILocalVariable(name: "i", scope: !2898, file: !2860, line: 23, type: !12)
!2898 = distinct !DILexicalBlock(scope: !2888, file: !2860, line: 23, column: 3)
!2899 = !DILocation(line: 0, scope: !2898)
!2900 = !DILocation(line: 23, column: 8, scope: !2898)
!2901 = !DILocation(line: 23, scope: !2898)
!2902 = !DILocation(line: 23, column: 24, scope: !2903)
!2903 = distinct !DILexicalBlock(scope: !2898, file: !2860, line: 23, column: 3)
!2904 = !DILocation(line: 23, column: 3, scope: !2898)
!2905 = !DILocation(line: 24, column: 9, scope: !2906)
!2906 = distinct !DILexicalBlock(scope: !2907, file: !2860, line: 24, column: 9)
!2907 = distinct !DILexicalBlock(scope: !2903, file: !2860, line: 23, column: 34)
!2908 = !DILocation(line: 24, column: 17, scope: !2906)
!2909 = !DILocation(line: 24, column: 14, scope: !2906)
!2910 = !DILocation(line: 25, column: 19, scope: !2906)
!2911 = !DILocation(line: 25, column: 14, scope: !2906)
!2912 = !DILocation(line: 25, column: 31, scope: !2906)
!2913 = !DILocation(line: 25, column: 26, scope: !2906)
!2914 = !DILocation(line: 25, column: 24, scope: !2906)
!2915 = !DILocation(line: 25, column: 7, scope: !2906)
!2916 = !DILocation(line: 23, column: 30, scope: !2903)
!2917 = !DILocation(line: 23, column: 3, scope: !2903)
!2918 = distinct !{!2918, !2904, !2919, !109}
!2919 = !DILocation(line: 26, column: 3, scope: !2898)
!2920 = !DILocation(line: 28, column: 1, scope: !2888)
!2921 = distinct !DISubprogram(name: "memset", scope: !2860, file: !2860, line: 30, type: !2922, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !75, retainedNodes: !24)
!2922 = !DISubroutineType(types: !2923)
!2923 = !{!2863, !2863, !25, !12}
!2924 = !DILocalVariable(name: "s", arg: 1, scope: !2921, file: !2860, line: 30, type: !2863)
!2925 = !DILocation(line: 0, scope: !2921)
!2926 = !DILocalVariable(name: "c", arg: 2, scope: !2921, file: !2860, line: 30, type: !25)
!2927 = !DILocalVariable(name: "n", arg: 3, scope: !2921, file: !2860, line: 30, type: !12)
!2928 = !DILocalVariable(name: "p", scope: !2921, file: !2860, line: 31, type: !6)
!2929 = !DILocalVariable(name: "i", scope: !2930, file: !2860, line: 32, type: !12)
!2930 = distinct !DILexicalBlock(scope: !2921, file: !2860, line: 32, column: 3)
!2931 = !DILocation(line: 0, scope: !2930)
!2932 = !DILocation(line: 32, column: 8, scope: !2930)
!2933 = !DILocation(line: 32, scope: !2930)
!2934 = !DILocation(line: 32, column: 24, scope: !2935)
!2935 = distinct !DILexicalBlock(scope: !2930, file: !2860, line: 32, column: 3)
!2936 = !DILocation(line: 32, column: 3, scope: !2930)
!2937 = !DILocation(line: 33, column: 12, scope: !2935)
!2938 = !DILocation(line: 33, column: 5, scope: !2935)
!2939 = !DILocation(line: 33, column: 10, scope: !2935)
!2940 = !DILocation(line: 32, column: 30, scope: !2935)
!2941 = !DILocation(line: 32, column: 3, scope: !2935)
!2942 = distinct !{!2942, !2936, !2943, !109}
!2943 = !DILocation(line: 33, column: 21, scope: !2930)
!2944 = !DILocation(line: 34, column: 3, scope: !2921)
