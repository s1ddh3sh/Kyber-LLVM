; ModuleID = 'kyber_composite'
source_filename = "kyber_composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "thumbv7em-unknown-none-eabihf"

@randombytes.fd = internal unnamed_addr global i32 -1, align 4, !dbg !0
@.str = private unnamed_addr constant [13 x i8] c"/dev/urandom\00", align 1, !dbg !18
@pqcrystals_kyber768_ref_zetas = dso_local local_unnamed_addr constant [128 x i16] [i16 -1044, i16 -758, i16 -359, i16 -1517, i16 1493, i16 1422, i16 287, i16 202, i16 -171, i16 622, i16 1577, i16 182, i16 962, i16 -1202, i16 -1474, i16 1468, i16 573, i16 -1325, i16 264, i16 383, i16 -829, i16 1458, i16 -1602, i16 -130, i16 -681, i16 1017, i16 732, i16 608, i16 -1542, i16 411, i16 -205, i16 -1571, i16 1223, i16 652, i16 -552, i16 1015, i16 -1293, i16 1491, i16 -282, i16 -1544, i16 516, i16 -8, i16 -320, i16 -666, i16 -1618, i16 -1162, i16 126, i16 1469, i16 -853, i16 -90, i16 -271, i16 830, i16 107, i16 -1421, i16 -247, i16 -951, i16 -398, i16 961, i16 -1508, i16 -725, i16 448, i16 -1065, i16 677, i16 -1275, i16 -1103, i16 430, i16 555, i16 843, i16 -1251, i16 871, i16 1550, i16 105, i16 422, i16 587, i16 177, i16 -235, i16 -291, i16 -460, i16 1574, i16 1653, i16 -246, i16 778, i16 1159, i16 -147, i16 -777, i16 1483, i16 -602, i16 1119, i16 -1590, i16 644, i16 -872, i16 349, i16 418, i16 329, i16 -156, i16 -75, i16 817, i16 1097, i16 603, i16 610, i16 1322, i16 -1285, i16 -1465, i16 384, i16 -1215, i16 -136, i16 1218, i16 -1335, i16 -874, i16 220, i16 -1187, i16 -1659, i16 -1185, i16 -1530, i16 -1278, i16 794, i16 -1510, i16 -854, i16 -870, i16 478, i16 -108, i16 -308, i16 996, i16 991, i16 958, i16 -1460, i16 1522, i16 1628], align 2, !dbg !26
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
  %pk = alloca [1184 x i8], align 1
  %sk = alloca [2400 x i8], align 1
  %ct = alloca [1088 x i8], align 1
  %key_a = alloca [32 x i8], align 1
  %key_b = alloca [32 x i8], align 1
    #dbg_declare(ptr %pk, !108, !DIExpression(), !112)
    #dbg_declare(ptr %sk, !113, !DIExpression(), !117)
    #dbg_declare(ptr %ct, !118, !DIExpression(), !122)
    #dbg_declare(ptr %key_a, !123, !DIExpression(), !127)
    #dbg_declare(ptr %key_b, !128, !DIExpression(), !129)
  %call = call i32 @pqcrystals_kyber768_ref_keypair(ptr noundef nonnull %pk, ptr noundef nonnull %sk) #3, !dbg !130
  %call5 = call i32 @pqcrystals_kyber768_ref_enc(ptr noundef nonnull %ct, ptr noundef nonnull %key_b, ptr noundef nonnull %pk) #3, !dbg !131
  %call9 = call i32 @pqcrystals_kyber768_ref_dec(ptr noundef nonnull %key_a, ptr noundef nonnull %ct, ptr noundef nonnull %sk) #3, !dbg !132
  %call12 = call i32 @memcmp(ptr noundef nonnull %key_a, ptr noundef nonnull %key_b, i32 noundef 32) #4, !dbg !133
  %tobool.not = icmp ne i32 %call12, 0, !dbg !133
  %. = zext i1 %tobool.not to i32, !dbg !135
  ret i32 %., !dbg !136
}

; Function Attrs: nounwind
define internal fastcc range(i32 0, 2) i32 @test_invalid_sk_a() unnamed_addr #0 !dbg !137 {
entry:
  %pk = alloca [1184 x i8], align 1
  %sk = alloca [2400 x i8], align 1
  %ct = alloca [1088 x i8], align 1
  %key_a = alloca [32 x i8], align 1
  %key_b = alloca [32 x i8], align 1
    #dbg_declare(ptr %pk, !138, !DIExpression(), !139)
    #dbg_declare(ptr %sk, !140, !DIExpression(), !141)
    #dbg_declare(ptr %ct, !142, !DIExpression(), !143)
    #dbg_declare(ptr %key_a, !144, !DIExpression(), !145)
    #dbg_declare(ptr %key_b, !146, !DIExpression(), !147)
  %call = call i32 @pqcrystals_kyber768_ref_keypair(ptr noundef nonnull %pk, ptr noundef nonnull %sk) #3, !dbg !148
  %call5 = call i32 @pqcrystals_kyber768_ref_enc(ptr noundef nonnull %ct, ptr noundef nonnull %key_b, ptr noundef nonnull %pk) #3, !dbg !149
  call void @randombytes(ptr noundef nonnull %sk, i32 noundef 2400) #3, !dbg !150
  %call10 = call i32 @pqcrystals_kyber768_ref_dec(ptr noundef nonnull %key_a, ptr noundef nonnull %ct, ptr noundef nonnull %sk) #3, !dbg !151
  %call13 = call i32 @memcmp(ptr noundef nonnull %key_a, ptr noundef nonnull %key_b, i32 noundef 32) #4, !dbg !152
  %tobool.not = icmp eq i32 %call13, 0, !dbg !152
  %. = zext i1 %tobool.not to i32, !dbg !154
  ret i32 %., !dbg !155
}

; Function Attrs: nounwind
define internal fastcc range(i32 0, 2) i32 @test_invalid_ciphertext() unnamed_addr #0 !dbg !156 {
entry:
  %pk = alloca [1184 x i8], align 1
  %sk = alloca [2400 x i8], align 1
  %ct = alloca [1088 x i8], align 1
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
  %call = call i32 @pqcrystals_kyber768_ref_keypair(ptr noundef nonnull %pk, ptr noundef nonnull %sk) #3, !dbg !179
  %call5 = call i32 @pqcrystals_kyber768_ref_enc(ptr noundef nonnull %ct, ptr noundef nonnull %key_b, ptr noundef nonnull %pk) #3, !dbg !180
  %1 = load i8, ptr %b, align 1, !dbg !181
    #dbg_value(i8 %1, !168, !DIExpression(), !169)
  %2 = load i32, ptr %pos, align 4, !dbg !182
    #dbg_value(i32 %2, !177, !DIExpression(), !169)
  %rem = urem i32 %2, 1088, !dbg !183
  %arrayidx = getelementptr inbounds nuw [1088 x i8], ptr %ct, i32 0, i32 %rem, !dbg !184
  %3 = load i8, ptr %arrayidx, align 1, !dbg !185
  %xor1 = xor i8 %3, %1, !dbg !185
  store i8 %xor1, ptr %arrayidx, align 1, !dbg !185
  %call11 = call i32 @pqcrystals_kyber768_ref_dec(ptr noundef nonnull %key_a, ptr noundef nonnull %ct, ptr noundef nonnull %sk) #3, !dbg !186
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
define dso_local i32 @pqcrystals_kyber768_ref_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) local_unnamed_addr #0 !dbg !231 {
entry:
    #dbg_value(ptr %pk, !237, !DIExpression(), !238)
    #dbg_value(ptr %sk, !239, !DIExpression(), !238)
    #dbg_value(ptr %coins, !240, !DIExpression(), !238)
  call void @pqcrystals_kyber768_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) #3, !dbg !241
  %add.ptr = getelementptr inbounds nuw i8, ptr %sk, i32 1152, !dbg !242
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr, ptr noundef %pk, i32 noundef 1184) #4, !dbg !243
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %sk, i32 2336, !dbg !244
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr2, ptr noundef %pk, i32 noundef 1184) #3, !dbg !244
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %sk, i32 2368, !dbg !245
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %coins, i32 32, !dbg !246
  %call6 = call ptr @memcpy(ptr noundef nonnull %add.ptr4, ptr noundef nonnull %add.ptr5, i32 noundef 32) #4, !dbg !247
  ret i32 0, !dbg !248
}

declare dso_local ptr @memcpy(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber768_ref_keypair(ptr noundef %pk, ptr noundef %sk) local_unnamed_addr #0 !dbg !249 {
entry:
  %coins = alloca [64 x i8], align 1
    #dbg_value(ptr %pk, !252, !DIExpression(), !253)
    #dbg_value(ptr %sk, !254, !DIExpression(), !253)
    #dbg_declare(ptr %coins, !255, !DIExpression(), !259)
  call void @randombytes(ptr noundef nonnull %coins, i32 noundef 64) #3, !dbg !260
  %call = call i32 @pqcrystals_kyber768_ref_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef nonnull %coins) #3, !dbg !261
  ret i32 0, !dbg !262
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber768_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef %coins) local_unnamed_addr #0 !dbg !263 {
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
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr, ptr noundef %pk, i32 noundef 1184) #3, !dbg !276
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %kr, ptr noundef nonnull %buf, i32 noundef 64) #3, !dbg !277
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %kr, i32 32, !dbg !278
  call void @pqcrystals_kyber768_ref_indcpa_enc(ptr noundef %ct, ptr noundef nonnull %buf, ptr noundef %pk, ptr noundef nonnull %add.ptr6) #3, !dbg !279
  %call8 = call ptr @memcpy(ptr noundef %ss, ptr noundef nonnull %kr, i32 noundef 32) #4, !dbg !280
  ret i32 0, !dbg !281
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber768_ref_enc(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk) local_unnamed_addr #0 !dbg !282 {
entry:
  %coins = alloca [32 x i8], align 1
    #dbg_value(ptr %ct, !283, !DIExpression(), !284)
    #dbg_value(ptr %ss, !285, !DIExpression(), !284)
    #dbg_value(ptr %pk, !286, !DIExpression(), !284)
    #dbg_declare(ptr %coins, !287, !DIExpression(), !288)
  call void @randombytes(ptr noundef nonnull %coins, i32 noundef 32) #3, !dbg !289
  %call = call i32 @pqcrystals_kyber768_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef nonnull %coins) #3, !dbg !290
  ret i32 0, !dbg !291
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber768_ref_dec(ptr noundef %ss, ptr noundef %ct, ptr noundef %sk) local_unnamed_addr #0 !dbg !292 {
entry:
  %buf = alloca [64 x i8], align 1
  %kr = alloca [64 x i8], align 1
  %cmp = alloca [1088 x i8], align 1
    #dbg_value(ptr %ss, !295, !DIExpression(), !296)
    #dbg_value(ptr %ct, !297, !DIExpression(), !296)
    #dbg_value(ptr %sk, !298, !DIExpression(), !296)
    #dbg_declare(ptr %buf, !299, !DIExpression(), !300)
    #dbg_declare(ptr %kr, !301, !DIExpression(), !302)
    #dbg_declare(ptr %cmp, !303, !DIExpression(), !304)
  %add.ptr = getelementptr inbounds nuw i8, ptr %sk, i32 1152, !dbg !305
    #dbg_value(ptr %add.ptr, !306, !DIExpression(), !296)
  call void @pqcrystals_kyber768_ref_indcpa_dec(ptr noundef nonnull %buf, ptr noundef %ct, ptr noundef %sk) #3, !dbg !307
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !308
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %sk, i32 2336, !dbg !309
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr2, ptr noundef nonnull %add.ptr4, i32 noundef 32) #4, !dbg !310
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %kr, ptr noundef nonnull %buf, i32 noundef 64) #3, !dbg !311
  %add.ptr10 = getelementptr inbounds nuw i8, ptr %kr, i32 32, !dbg !312
  call void @pqcrystals_kyber768_ref_indcpa_enc(ptr noundef nonnull %cmp, ptr noundef nonnull %buf, ptr noundef nonnull %add.ptr, ptr noundef nonnull %add.ptr10) #3, !dbg !313
  %call12 = call i32 @pqcrystals_kyber768_ref_verify(ptr noundef %ct, ptr noundef nonnull %cmp, i32 noundef 1088) #3, !dbg !314
    #dbg_value(i32 %call12, !315, !DIExpression(), !296)
  %add.ptr14 = getelementptr inbounds nuw i8, ptr %sk, i32 2368, !dbg !316
  call void @pqcrystals_kyber768_ref_kyber_shake256_rkprf(ptr noundef %ss, ptr noundef nonnull %add.ptr14, ptr noundef %ct) #3, !dbg !316
  %0 = trunc nuw nsw i32 %call12 to i8, !dbg !317
  %conv = xor i8 %0, 1, !dbg !317
  call void @pqcrystals_kyber768_ref_cmov(ptr noundef %ss, ptr noundef nonnull %kr, i32 noundef 32, i8 noundef zeroext %conv) #3, !dbg !318
  ret i32 0, !dbg !319
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_gen_matrix(ptr noundef %a, ptr noundef %seed, i32 noundef %transposed) local_unnamed_addr #0 !dbg !320 {
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
  %exitcond1 = icmp ne i32 %i.0, 3, !dbg !357
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end20, !dbg !359

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !360

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc
  %j.0 = phi i32 [ %inc, %for.inc ], [ 0, %for.cond1.preheader ], !dbg !363
    #dbg_value(i32 %j.0, !364, !DIExpression(), !336)
  %exitcond = icmp ne i32 %j.0, 3, !dbg !365
  br i1 %exitcond, label %for.body3, label %for.inc18, !dbg !360

for.body3:                                        ; preds = %for.cond1
  %tobool.not = icmp eq i32 %transposed, 0, !dbg !367
  br i1 %tobool.not, label %if.else, label %if.then, !dbg !367

if.then:                                          ; preds = %for.body3
  %conv = trunc nuw i32 %i.0 to i8, !dbg !370
  %conv4 = trunc nuw nsw i32 %j.0 to i8, !dbg !370
  call void @pqcrystals_kyber768_ref_kyber_shake128_absorb(ptr noundef nonnull %state, ptr noundef %seed, i8 noundef zeroext %conv, i8 noundef zeroext %conv4) #3, !dbg !370
  br label %if.end, !dbg !370

if.else:                                          ; preds = %for.body3
  %conv5 = trunc nuw nsw i32 %j.0 to i8, !dbg !371
  %conv6 = trunc nuw i32 %i.0 to i8, !dbg !371
  call void @pqcrystals_kyber768_ref_kyber_shake128_absorb(ptr noundef nonnull %state, ptr noundef %seed, i8 noundef zeroext %conv5, i8 noundef zeroext %conv6) #3, !dbg !371
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef nonnull %buf, i32 noundef 3, ptr noundef nonnull %state) #3, !dbg !372
    #dbg_value(i32 504, !373, !DIExpression(), !336)
  %arrayidx7 = getelementptr inbounds nuw [3 x [256 x i16]], ptr %a, i32 %i.0, i32 %j.0, !dbg !374
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
  %arrayidx14 = getelementptr inbounds nuw [3 x [256 x i16]], ptr %a, i32 %i.0, i32 %j.0, !dbg !382
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
define dso_local void @pqcrystals_kyber768_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) local_unnamed_addr #0 !dbg !442 {
entry:
  %buf = alloca [64 x i8], align 1
  %a = alloca [3 x [3 x [256 x i16]]], align 2
  %e = alloca [3 x [256 x i16]], align 2
  %pkpv = alloca [3 x [256 x i16]], align 2
  %skpv = alloca [3 x [256 x i16]], align 2
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
  store i8 3, ptr %arrayidx, align 1, !dbg !466
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %buf, ptr noundef nonnull %buf, i32 noundef 33) #3, !dbg !467
  call void @pqcrystals_kyber768_ref_gen_matrix(ptr noundef nonnull %a, ptr noundef nonnull %buf, i32 noundef 0) #3, !dbg !468
    #dbg_value(i32 0, !469, !DIExpression(), !446)
  br label %for.cond, !dbg !470

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc7, %for.body ], !dbg !472
  %nonce.0 = phi i8 [ 0, %entry ], [ %inc, %for.body ], !dbg !446
    #dbg_value(i8 %nonce.0, !454, !DIExpression(), !446)
    #dbg_value(i32 %i.0, !469, !DIExpression(), !446)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !473
  br i1 %exitcond, label %for.body, label %for.cond8.preheader, !dbg !475

for.cond8.preheader:                              ; preds = %for.cond
  br label %for.cond8, !dbg !476

for.body:                                         ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds nuw [3 x [256 x i16]], ptr %skpv, i32 0, i32 %i.0, !dbg !478
    #dbg_value(i8 %nonce.0, !454, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !446)
  call void @pqcrystals_kyber768_ref_poly_getnoise_eta1(ptr noundef nonnull %arrayidx6, ptr noundef nonnull %add.ptr, i8 noundef zeroext %nonce.0) #3, !dbg !479
  %inc = add nuw nsw i8 %nonce.0, 1, !dbg !480
    #dbg_value(i8 %inc, !454, !DIExpression(), !446)
  %inc7 = add nuw nsw i32 %i.0, 1, !dbg !481
    #dbg_value(i32 %inc7, !469, !DIExpression(), !446)
  br label %for.cond, !dbg !482, !llvm.loop !483

for.cond8:                                        ; preds = %for.cond8.preheader, %for.body10
  %i.1 = phi i32 [ %inc14, %for.body10 ], [ 0, %for.cond8.preheader ], !dbg !485
  %nonce.1 = phi i8 [ %inc12, %for.body10 ], [ 3, %for.cond8.preheader ], !dbg !446
    #dbg_value(i8 %nonce.1, !454, !DIExpression(), !446)
    #dbg_value(i32 %i.1, !469, !DIExpression(), !446)
  %exitcond1 = icmp ne i32 %i.1, 3, !dbg !486
  br i1 %exitcond1, label %for.body10, label %for.end15, !dbg !476

for.body10:                                       ; preds = %for.cond8
  %arrayidx11 = getelementptr inbounds nuw [3 x [256 x i16]], ptr %e, i32 0, i32 %i.1, !dbg !488
    #dbg_value(i8 %nonce.1, !454, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !446)
  call void @pqcrystals_kyber768_ref_poly_getnoise_eta1(ptr noundef nonnull %arrayidx11, ptr noundef nonnull %add.ptr, i8 noundef zeroext %nonce.1) #3, !dbg !489
  %inc12 = add nuw nsw i8 %nonce.1, 1, !dbg !490
    #dbg_value(i8 %inc12, !454, !DIExpression(), !446)
  %inc14 = add nuw nsw i32 %i.1, 1, !dbg !491
    #dbg_value(i32 %inc14, !469, !DIExpression(), !446)
  br label %for.cond8, !dbg !492, !llvm.loop !493

for.end15:                                        ; preds = %for.cond8
  call void @pqcrystals_kyber768_ref_polyvec_ntt(ptr noundef nonnull %skpv) #3, !dbg !495
  call void @pqcrystals_kyber768_ref_polyvec_ntt(ptr noundef nonnull %e) #3, !dbg !496
    #dbg_value(i32 0, !469, !DIExpression(), !446)
  br label %for.cond16, !dbg !497

for.cond16:                                       ; preds = %for.body18, %for.end15
  %i.2 = phi i32 [ 0, %for.end15 ], [ %inc23, %for.body18 ], !dbg !499
    #dbg_value(i32 %i.2, !469, !DIExpression(), !446)
  %exitcond2 = icmp ne i32 %i.2, 3, !dbg !500
  br i1 %exitcond2, label %for.body18, label %for.end24, !dbg !502

for.body18:                                       ; preds = %for.cond16
  %arrayidx19 = getelementptr inbounds nuw [3 x [256 x i16]], ptr %pkpv, i32 0, i32 %i.2, !dbg !503
  %arrayidx20 = getelementptr inbounds nuw [3 x [3 x [256 x i16]]], ptr %a, i32 0, i32 %i.2, !dbg !505
  call void @pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %arrayidx19, ptr noundef nonnull %arrayidx20, ptr noundef nonnull %skpv) #3, !dbg !506
  %arrayidx21 = getelementptr inbounds nuw [3 x [256 x i16]], ptr %pkpv, i32 0, i32 %i.2, !dbg !507
  call void @pqcrystals_kyber768_ref_poly_tomont(ptr noundef nonnull %arrayidx21) #3, !dbg !508
  %inc23 = add nuw nsw i32 %i.2, 1, !dbg !509
    #dbg_value(i32 %inc23, !469, !DIExpression(), !446)
  br label %for.cond16, !dbg !510, !llvm.loop !511

for.end24:                                        ; preds = %for.cond16
  call void @pqcrystals_kyber768_ref_polyvec_add(ptr noundef nonnull %pkpv, ptr noundef nonnull %pkpv, ptr noundef nonnull %e) #3, !dbg !513
  call void @pqcrystals_kyber768_ref_polyvec_reduce(ptr noundef nonnull %pkpv) #3, !dbg !514
  call fastcc void @pack_sk(ptr noundef %sk, ptr noundef nonnull %skpv) #3, !dbg !515
  call fastcc void @pack_pk(ptr noundef %pk, ptr noundef nonnull %pkpv, ptr noundef nonnull %buf) #3, !dbg !516
  ret void, !dbg !517
}

; Function Attrs: nounwind
define internal fastcc void @pack_sk(ptr noundef %r, ptr noundef nonnull %sk) unnamed_addr #0 !dbg !518 {
entry:
    #dbg_value(ptr %r, !521, !DIExpression(), !522)
    #dbg_value(ptr %sk, !523, !DIExpression(), !522)
  call void @pqcrystals_kyber768_ref_polyvec_tobytes(ptr noundef %r, ptr noundef nonnull %sk) #3, !dbg !524
  ret void, !dbg !525
}

; Function Attrs: nounwind
define internal fastcc void @pack_pk(ptr noundef %r, ptr noundef nonnull %pk, ptr noundef nonnull %seed) unnamed_addr #0 !dbg !526 {
entry:
    #dbg_value(ptr %r, !529, !DIExpression(), !530)
    #dbg_value(ptr %pk, !531, !DIExpression(), !530)
    #dbg_value(ptr %seed, !532, !DIExpression(), !530)
  call void @pqcrystals_kyber768_ref_polyvec_tobytes(ptr noundef %r, ptr noundef nonnull %pk) #3, !dbg !533
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 1152, !dbg !534
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr, ptr noundef nonnull %seed, i32 noundef 32) #4, !dbg !535
  ret void, !dbg !536
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_indcpa_enc(ptr noundef %c, ptr noundef %m, ptr noundef %pk, ptr noundef %coins) local_unnamed_addr #0 !dbg !537 {
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
  call void @pqcrystals_kyber768_ref_poly_frommsg(ptr noundef nonnull %k, ptr noundef %m) #3, !dbg !565
  call void @pqcrystals_kyber768_ref_gen_matrix(ptr noundef nonnull %at, ptr noundef nonnull %seed, i32 noundef 1) #3, !dbg !566
    #dbg_value(i32 0, !567, !DIExpression(), !541)
  br label %for.cond, !dbg !568

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc4, %for.body ], !dbg !570
  %nonce.0 = phi i8 [ 0, %entry ], [ %inc, %for.body ], !dbg !541
    #dbg_value(i8 %nonce.0, !547, !DIExpression(), !541)
    #dbg_value(i32 %i.0, !567, !DIExpression(), !541)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !571
  br i1 %exitcond, label %for.body, label %for.cond5.preheader, !dbg !573

for.cond5.preheader:                              ; preds = %for.cond
  br label %for.cond5, !dbg !574

for.body:                                         ; preds = %for.cond
  %add.ptr = getelementptr inbounds nuw [256 x i16], ptr %sp, i32 %i.0, !dbg !576
    #dbg_value(i8 %nonce.0, !547, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !541)
  call void @pqcrystals_kyber768_ref_poly_getnoise_eta1(ptr noundef nonnull %add.ptr, ptr noundef %coins, i8 noundef zeroext %nonce.0) #3, !dbg !577
  %inc = add nuw nsw i8 %nonce.0, 1, !dbg !578
    #dbg_value(i8 %inc, !547, !DIExpression(), !541)
  %inc4 = add nuw nsw i32 %i.0, 1, !dbg !579
    #dbg_value(i32 %inc4, !567, !DIExpression(), !541)
  br label %for.cond, !dbg !580, !llvm.loop !581

for.cond5:                                        ; preds = %for.cond5.preheader, %for.body7
  %i.1 = phi i32 [ %inc12, %for.body7 ], [ 0, %for.cond5.preheader ], !dbg !583
  %nonce.1 = phi i8 [ %inc10, %for.body7 ], [ 3, %for.cond5.preheader ], !dbg !541
    #dbg_value(i8 %nonce.1, !547, !DIExpression(), !541)
    #dbg_value(i32 %i.1, !567, !DIExpression(), !541)
  %exitcond1 = icmp ne i32 %i.1, 3, !dbg !584
  br i1 %exitcond1, label %for.body7, label %for.end13, !dbg !574

for.body7:                                        ; preds = %for.cond5
  %add.ptr9 = getelementptr inbounds nuw [256 x i16], ptr %ep, i32 %i.1, !dbg !586
    #dbg_value(i8 %nonce.1, !547, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !541)
  call void @pqcrystals_kyber768_ref_poly_getnoise_eta2(ptr noundef nonnull %add.ptr9, ptr noundef %coins, i8 noundef zeroext %nonce.1) #3, !dbg !587
  %inc10 = add nuw nsw i8 %nonce.1, 1, !dbg !588
    #dbg_value(i8 %inc10, !547, !DIExpression(), !541)
  %inc12 = add nuw nsw i32 %i.1, 1, !dbg !589
    #dbg_value(i32 %inc12, !567, !DIExpression(), !541)
  br label %for.cond5, !dbg !590, !llvm.loop !591

for.end13:                                        ; preds = %for.cond5
    #dbg_value(i8 6, !547, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !541)
  call void @pqcrystals_kyber768_ref_poly_getnoise_eta2(ptr noundef nonnull %epp, ptr noundef %coins, i8 noundef zeroext 6) #3, !dbg !593
  call void @pqcrystals_kyber768_ref_polyvec_ntt(ptr noundef nonnull %sp) #3, !dbg !594
    #dbg_value(i32 0, !567, !DIExpression(), !541)
  br label %for.cond15, !dbg !595

for.cond15:                                       ; preds = %for.body17, %for.end13
  %i.2 = phi i32 [ 0, %for.end13 ], [ %inc20, %for.body17 ], !dbg !597
    #dbg_value(i32 %i.2, !567, !DIExpression(), !541)
  %exitcond2 = icmp ne i32 %i.2, 3, !dbg !598
  br i1 %exitcond2, label %for.body17, label %for.end21, !dbg !600

for.body17:                                       ; preds = %for.cond15
  %arrayidx = getelementptr inbounds nuw [3 x [256 x i16]], ptr %b, i32 0, i32 %i.2, !dbg !601
  %arrayidx18 = getelementptr inbounds nuw [3 x [3 x [256 x i16]]], ptr %at, i32 0, i32 %i.2, !dbg !602
  call void @pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %arrayidx, ptr noundef nonnull %arrayidx18, ptr noundef nonnull %sp) #3, !dbg !603
  %inc20 = add nuw nsw i32 %i.2, 1, !dbg !604
    #dbg_value(i32 %inc20, !567, !DIExpression(), !541)
  br label %for.cond15, !dbg !605, !llvm.loop !606

for.end21:                                        ; preds = %for.cond15
  call void @pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %v, ptr noundef nonnull %pkpv, ptr noundef nonnull %sp) #3, !dbg !608
  call void @pqcrystals_kyber768_ref_polyvec_invntt_tomont(ptr noundef nonnull %b) #3, !dbg !609
  call void @pqcrystals_kyber768_ref_poly_invntt_tomont(ptr noundef nonnull %v) #3, !dbg !610
  call void @pqcrystals_kyber768_ref_polyvec_add(ptr noundef nonnull %b, ptr noundef nonnull %b, ptr noundef nonnull %ep) #3, !dbg !611
  call void @pqcrystals_kyber768_ref_poly_add(ptr noundef nonnull %v, ptr noundef nonnull %v, ptr noundef nonnull %epp) #3, !dbg !612
  call void @pqcrystals_kyber768_ref_poly_add(ptr noundef nonnull %v, ptr noundef nonnull %v, ptr noundef nonnull %k) #3, !dbg !613
  call void @pqcrystals_kyber768_ref_polyvec_reduce(ptr noundef nonnull %b) #3, !dbg !614
  call void @pqcrystals_kyber768_ref_poly_reduce(ptr noundef nonnull %v) #3, !dbg !615
  call fastcc void @pack_ciphertext(ptr noundef %c, ptr noundef nonnull %b, ptr noundef nonnull %v) #3, !dbg !616
  ret void, !dbg !617
}

; Function Attrs: nounwind
define internal fastcc void @unpack_pk(ptr noundef nonnull %pk, ptr noundef nonnull %seed, ptr noundef %packedpk) unnamed_addr #0 !dbg !618 {
entry:
    #dbg_value(ptr %pk, !621, !DIExpression(), !622)
    #dbg_value(ptr %seed, !623, !DIExpression(), !622)
    #dbg_value(ptr %packedpk, !624, !DIExpression(), !622)
  call void @pqcrystals_kyber768_ref_polyvec_frombytes(ptr noundef nonnull %pk, ptr noundef %packedpk) #3, !dbg !625
  %add.ptr = getelementptr inbounds nuw i8, ptr %packedpk, i32 1152, !dbg !626
  %call = call ptr @memcpy(ptr noundef nonnull %seed, ptr noundef nonnull %add.ptr, i32 noundef 32) #4, !dbg !627
  ret void, !dbg !628
}

; Function Attrs: nounwind
define internal fastcc void @pack_ciphertext(ptr noundef %r, ptr noundef nonnull %b, ptr noundef nonnull %v) unnamed_addr #0 !dbg !629 {
entry:
    #dbg_value(ptr %r, !633, !DIExpression(), !634)
    #dbg_value(ptr %b, !635, !DIExpression(), !634)
    #dbg_value(ptr %v, !636, !DIExpression(), !634)
  call void @pqcrystals_kyber768_ref_polyvec_compress(ptr noundef %r, ptr noundef nonnull %b) #3, !dbg !637
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 960, !dbg !638
  call void @pqcrystals_kyber768_ref_poly_compress(ptr noundef nonnull %add.ptr, ptr noundef nonnull %v) #3, !dbg !639
  ret void, !dbg !640
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_indcpa_dec(ptr noundef %m, ptr noundef %c, ptr noundef %sk) local_unnamed_addr #0 !dbg !641 {
entry:
  %b = alloca [3 x [256 x i16]], align 2
  %skpv = alloca [3 x [256 x i16]], align 2
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
  call void @pqcrystals_kyber768_ref_polyvec_ntt(ptr noundef nonnull %b) #3, !dbg !658
  call void @pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %mp, ptr noundef nonnull %skpv, ptr noundef nonnull %b) #3, !dbg !659
  call void @pqcrystals_kyber768_ref_poly_invntt_tomont(ptr noundef nonnull %mp) #3, !dbg !660
  call void @pqcrystals_kyber768_ref_poly_sub(ptr noundef nonnull %mp, ptr noundef nonnull %v, ptr noundef nonnull %mp) #3, !dbg !661
  call void @pqcrystals_kyber768_ref_poly_reduce(ptr noundef nonnull %mp) #3, !dbg !662
  call void @pqcrystals_kyber768_ref_poly_tomsg(ptr noundef %m, ptr noundef nonnull %mp) #3, !dbg !663
  ret void, !dbg !664
}

; Function Attrs: nounwind
define internal fastcc void @unpack_ciphertext(ptr noundef nonnull %b, ptr noundef nonnull %v, ptr noundef %c) unnamed_addr #0 !dbg !665 {
entry:
    #dbg_value(ptr %b, !668, !DIExpression(), !669)
    #dbg_value(ptr %v, !670, !DIExpression(), !669)
    #dbg_value(ptr %c, !671, !DIExpression(), !669)
  call void @pqcrystals_kyber768_ref_polyvec_decompress(ptr noundef nonnull %b, ptr noundef %c) #3, !dbg !672
  %add.ptr = getelementptr inbounds nuw i8, ptr %c, i32 960, !dbg !673
  call void @pqcrystals_kyber768_ref_poly_decompress(ptr noundef nonnull %v, ptr noundef nonnull %add.ptr) #3, !dbg !674
  ret void, !dbg !675
}

; Function Attrs: nounwind
define internal fastcc void @unpack_sk(ptr noundef nonnull %sk, ptr noundef %packedsk) unnamed_addr #0 !dbg !676 {
entry:
    #dbg_value(ptr %sk, !679, !DIExpression(), !680)
    #dbg_value(ptr %packedsk, !681, !DIExpression(), !680)
  call void @pqcrystals_kyber768_ref_polyvec_frombytes(ptr noundef nonnull %sk, ptr noundef %packedsk) #3, !dbg !682
  ret void, !dbg !683
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_compress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !684 {
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
  %exitcond2 = icmp ne i32 %i.0, 3, !dbg !702
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
  %arrayidx7 = getelementptr inbounds nuw [3 x [256 x i16]], ptr %a, i32 0, i32 %i.0, i32 %add, !dbg !722
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
define dso_local void @pqcrystals_kyber768_ref_polyvec_decompress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !776 {
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
  %exitcond2 = icmp ne i32 %i.0, 3, !dbg !786
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
  %arrayidx50 = getelementptr inbounds nuw [3 x [256 x i16]], ptr %r, i32 0, i32 %i.0, i32 %add49, !dbg !842
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
define dso_local void @pqcrystals_kyber768_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !858 {
entry:
    #dbg_value(ptr %r, !859, !DIExpression(), !860)
    #dbg_value(ptr %a, !861, !DIExpression(), !860)
    #dbg_value(i32 0, !862, !DIExpression(), !860)
  br label %for.cond, !dbg !863

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !865
    #dbg_value(i32 %i.0, !862, !DIExpression(), !860)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !866
  br i1 %exitcond, label %for.body, label %for.end, !dbg !868

for.body:                                         ; preds = %for.cond
  %mul = mul nuw nsw i32 %i.0, 384, !dbg !869
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 %mul, !dbg !870
  %arrayidx = getelementptr inbounds nuw [3 x [256 x i16]], ptr %a, i32 0, i32 %i.0, !dbg !871
  call void @pqcrystals_kyber768_ref_poly_tobytes(ptr noundef %add.ptr, ptr noundef %arrayidx) #3, !dbg !872
  %inc = add nuw nsw i32 %i.0, 1, !dbg !873
    #dbg_value(i32 %inc, !862, !DIExpression(), !860)
  br label %for.cond, !dbg !874, !llvm.loop !875

for.end:                                          ; preds = %for.cond
  ret void, !dbg !877
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_frombytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !878 {
entry:
    #dbg_value(ptr %r, !879, !DIExpression(), !880)
    #dbg_value(ptr %a, !881, !DIExpression(), !880)
    #dbg_value(i32 0, !882, !DIExpression(), !880)
  br label %for.cond, !dbg !883

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !885
    #dbg_value(i32 %i.0, !882, !DIExpression(), !880)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !886
  br i1 %exitcond, label %for.body, label %for.end, !dbg !888

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [3 x [256 x i16]], ptr %r, i32 0, i32 %i.0, !dbg !889
  %mul = mul nuw nsw i32 %i.0, 384, !dbg !890
  %add.ptr = getelementptr inbounds nuw i8, ptr %a, i32 %mul, !dbg !891
  call void @pqcrystals_kyber768_ref_poly_frombytes(ptr noundef %arrayidx, ptr noundef %add.ptr) #3, !dbg !892
  %inc = add nuw nsw i32 %i.0, 1, !dbg !893
    #dbg_value(i32 %inc, !882, !DIExpression(), !880)
  br label %for.cond, !dbg !894, !llvm.loop !895

for.end:                                          ; preds = %for.cond
  ret void, !dbg !897
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !898 {
entry:
    #dbg_value(ptr %r, !901, !DIExpression(), !902)
    #dbg_value(i32 0, !903, !DIExpression(), !902)
  br label %for.cond, !dbg !904

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !906
    #dbg_value(i32 %i.0, !903, !DIExpression(), !902)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !907
  br i1 %exitcond, label %for.body, label %for.end, !dbg !909

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [3 x [256 x i16]], ptr %r, i32 0, i32 %i.0, !dbg !910
  call void @pqcrystals_kyber768_ref_poly_ntt(ptr noundef %arrayidx) #3, !dbg !911
  %inc = add nuw nsw i32 %i.0, 1, !dbg !912
    #dbg_value(i32 %inc, !903, !DIExpression(), !902)
  br label %for.cond, !dbg !913, !llvm.loop !914

for.end:                                          ; preds = %for.cond
  ret void, !dbg !916
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_invntt_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !917 {
entry:
    #dbg_value(ptr %r, !918, !DIExpression(), !919)
    #dbg_value(i32 0, !920, !DIExpression(), !919)
  br label %for.cond, !dbg !921

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !923
    #dbg_value(i32 %i.0, !920, !DIExpression(), !919)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !924
  br i1 %exitcond, label %for.body, label %for.end, !dbg !926

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [3 x [256 x i16]], ptr %r, i32 0, i32 %i.0, !dbg !927
  call void @pqcrystals_kyber768_ref_poly_invntt_tomont(ptr noundef %arrayidx) #3, !dbg !928
  %inc = add nuw nsw i32 %i.0, 1, !dbg !929
    #dbg_value(i32 %inc, !920, !DIExpression(), !919)
  br label %for.cond, !dbg !930, !llvm.loop !931

for.end:                                          ; preds = %for.cond
  ret void, !dbg !933
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !934 {
entry:
  %t = alloca [256 x i16], align 2
    #dbg_value(ptr %r, !937, !DIExpression(), !938)
    #dbg_value(ptr %a, !939, !DIExpression(), !938)
    #dbg_value(ptr %b, !940, !DIExpression(), !938)
    #dbg_declare(ptr %t, !941, !DIExpression(), !942)
  call void @pqcrystals_kyber768_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) #3, !dbg !943
    #dbg_value(i32 1, !944, !DIExpression(), !938)
  br label %for.cond, !dbg !945

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 1, %entry ], [ %inc, %for.body ], !dbg !947
    #dbg_value(i32 %i.0, !944, !DIExpression(), !938)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !948
  br i1 %exitcond, label %for.body, label %for.end, !dbg !950

for.body:                                         ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds nuw [3 x [256 x i16]], ptr %a, i32 0, i32 %i.0, !dbg !951
  %arrayidx3 = getelementptr inbounds nuw [3 x [256 x i16]], ptr %b, i32 0, i32 %i.0, !dbg !953
  call void @pqcrystals_kyber768_ref_poly_basemul_montgomery(ptr noundef nonnull %t, ptr noundef nonnull %arrayidx2, ptr noundef nonnull %arrayidx3) #3, !dbg !954
  call void @pqcrystals_kyber768_ref_poly_add(ptr noundef %r, ptr noundef %r, ptr noundef nonnull %t) #3, !dbg !955
  %inc = add nuw nsw i32 %i.0, 1, !dbg !956
    #dbg_value(i32 %inc, !944, !DIExpression(), !938)
  br label %for.cond, !dbg !957, !llvm.loop !958

for.end:                                          ; preds = %for.cond
  call void @pqcrystals_kyber768_ref_poly_reduce(ptr noundef %r) #3, !dbg !960
  ret void, !dbg !961
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_reduce(ptr noundef %r) local_unnamed_addr #0 !dbg !962 {
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
  %arrayidx = getelementptr inbounds nuw [3 x [256 x i16]], ptr %r, i32 0, i32 %i.0, !dbg !972
  call void @pqcrystals_kyber768_ref_poly_reduce(ptr noundef %arrayidx) #3, !dbg !973
  %inc = add nuw nsw i32 %i.0, 1, !dbg !974
    #dbg_value(i32 %inc, !965, !DIExpression(), !964)
  br label %for.cond, !dbg !975, !llvm.loop !976

for.end:                                          ; preds = %for.cond
  ret void, !dbg !978
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !979 {
entry:
    #dbg_value(ptr %r, !982, !DIExpression(), !983)
    #dbg_value(ptr %a, !984, !DIExpression(), !983)
    #dbg_value(ptr %b, !985, !DIExpression(), !983)
    #dbg_value(i32 0, !986, !DIExpression(), !983)
  br label %for.cond, !dbg !987

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !989
    #dbg_value(i32 %i.0, !986, !DIExpression(), !983)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !990
  br i1 %exitcond, label %for.body, label %for.end, !dbg !992

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [3 x [256 x i16]], ptr %r, i32 0, i32 %i.0, !dbg !993
  %arrayidx1 = getelementptr inbounds nuw [3 x [256 x i16]], ptr %a, i32 0, i32 %i.0, !dbg !994
  %arrayidx2 = getelementptr inbounds nuw [3 x [256 x i16]], ptr %b, i32 0, i32 %i.0, !dbg !995
  call void @pqcrystals_kyber768_ref_poly_add(ptr noundef %arrayidx, ptr noundef %arrayidx1, ptr noundef %arrayidx2) #3, !dbg !996
  %inc = add nuw nsw i32 %i.0, 1, !dbg !997
    #dbg_value(i32 %inc, !986, !DIExpression(), !983)
  br label %for.cond, !dbg !998, !llvm.loop !999

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1001
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_compress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1002 {
entry:
  %t = alloca [8 x i8], align 1
    #dbg_value(ptr %r, !1008, !DIExpression(), !1009)
    #dbg_value(ptr %a, !1010, !DIExpression(), !1009)
    #dbg_declare(ptr %t, !1011, !DIExpression(), !1015)
    #dbg_value(i32 0, !1016, !DIExpression(), !1009)
  br label %for.cond, !dbg !1017

for.cond:                                         ; preds = %for.end, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc46, %for.end ], !dbg !1019
  %r.addr.0 = phi ptr [ %r, %entry ], [ %add.ptr, %for.end ]
    #dbg_value(ptr %r.addr.0, !1008, !DIExpression(), !1009)
    #dbg_value(i32 %i.0, !1016, !DIExpression(), !1009)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1020
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end47, !dbg !1022

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1023

for.cond1:                                        ; preds = %for.cond1.preheader, %for.body3
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond1.preheader ], !dbg !1026
    #dbg_value(i32 %j.0, !1027, !DIExpression(), !1009)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1028
  br i1 %exitcond, label %for.body3, label %for.end, !dbg !1023

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !1030
  %add = or disjoint i32 %mul, %j.0, !dbg !1032
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add, !dbg !1033
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1033
    #dbg_value(i16 %0, !1034, !DIExpression(), !1009)
  %isneg = icmp slt i16 %0, 0, !dbg !1035
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !1035
  %add5 = add i16 %and, %0, !dbg !1036
    #dbg_value(i16 %add5, !1034, !DIExpression(), !1009)
  %conv7 = sext i16 %add5 to i32, !dbg !1037
    #dbg_value(i32 %conv7, !1038, !DIExpression(DW_OP_constu, 4, DW_OP_shl, DW_OP_stack_value), !1009)
    #dbg_value(i32 %conv7, !1038, !DIExpression(DW_OP_constu, 4, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !1009)
  %1 = mul i32 %conv7, 1290160, !dbg !1039
  %mul9 = add i32 %1, 134257275, !dbg !1039
    #dbg_value(i32 %mul9, !1038, !DIExpression(), !1009)
  %shr10 = lshr i32 %mul9, 28, !dbg !1040
    #dbg_value(i32 %shr10, !1038, !DIExpression(), !1009)
  %conv12 = trunc nuw nsw i32 %shr10 to i8, !dbg !1041
  %arrayidx13 = getelementptr inbounds nuw [8 x i8], ptr %t, i32 0, i32 %j.0, !dbg !1042
  store i8 %conv12, ptr %arrayidx13, align 1, !dbg !1043
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1044
    #dbg_value(i32 %inc, !1027, !DIExpression(), !1009)
  br label %for.cond1, !dbg !1045, !llvm.loop !1046

for.end:                                          ; preds = %for.cond1
  %2 = load i8, ptr %t, align 1, !dbg !1048
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %t, i32 1, !dbg !1049
  %3 = load i8, ptr %arrayidx16, align 1, !dbg !1049
  %shl18 = shl i8 %3, 4, !dbg !1050
  %or = or i8 %shl18, %2, !dbg !1051
  store i8 %or, ptr %r.addr.0, align 1, !dbg !1052
  %arrayidx21 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !1053
  %4 = load i8, ptr %arrayidx21, align 1, !dbg !1053
  %arrayidx23 = getelementptr inbounds nuw i8, ptr %t, i32 3, !dbg !1054
  %5 = load i8, ptr %arrayidx23, align 1, !dbg !1054
  %shl25 = shl i8 %5, 4, !dbg !1055
  %or26 = or i8 %shl25, %4, !dbg !1056
  %arrayidx28 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 1, !dbg !1057
  store i8 %or26, ptr %arrayidx28, align 1, !dbg !1058
  %arrayidx29 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !1059
  %6 = load i8, ptr %arrayidx29, align 1, !dbg !1059
  %arrayidx31 = getelementptr inbounds nuw i8, ptr %t, i32 5, !dbg !1060
  %7 = load i8, ptr %arrayidx31, align 1, !dbg !1060
  %shl33 = shl i8 %7, 4, !dbg !1061
  %or34 = or i8 %shl33, %6, !dbg !1062
  %arrayidx36 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 2, !dbg !1063
  store i8 %or34, ptr %arrayidx36, align 1, !dbg !1064
  %arrayidx37 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !1065
  %8 = load i8, ptr %arrayidx37, align 1, !dbg !1065
  %arrayidx39 = getelementptr inbounds nuw i8, ptr %t, i32 7, !dbg !1066
  %9 = load i8, ptr %arrayidx39, align 1, !dbg !1066
  %shl41 = shl i8 %9, 4, !dbg !1067
  %or42 = or i8 %shl41, %8, !dbg !1068
  %arrayidx44 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 3, !dbg !1069
  store i8 %or42, ptr %arrayidx44, align 1, !dbg !1070
    #dbg_value(ptr %r.addr.0, !1008, !DIExpression(DW_OP_plus_uconst, 4, DW_OP_stack_value), !1009)
  %add.ptr = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 4, !dbg !1071
    #dbg_value(ptr %add.ptr, !1008, !DIExpression(), !1009)
  %inc46 = add nuw nsw i32 %i.0, 1, !dbg !1072
    #dbg_value(i32 %inc46, !1016, !DIExpression(), !1009)
  br label %for.cond, !dbg !1073, !llvm.loop !1074

for.end47:                                        ; preds = %for.cond
  ret void, !dbg !1076
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_decompress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1077 {
entry:
    #dbg_value(ptr %r, !1080, !DIExpression(), !1081)
    #dbg_value(ptr %a, !1082, !DIExpression(), !1081)
    #dbg_value(i32 0, !1083, !DIExpression(), !1081)
  br label %for.cond, !dbg !1084

for.cond:                                         ; preds = %for.body, %entry
  %a.addr.0 = phi ptr [ %a, %entry ], [ %add.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1086
    #dbg_value(i32 %i.0, !1083, !DIExpression(), !1081)
    #dbg_value(ptr %a.addr.0, !1082, !DIExpression(), !1081)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !1087
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1089

for.body:                                         ; preds = %for.cond
  %0 = load i8, ptr %a.addr.0, align 1, !dbg !1090
  %1 = and i8 %0, 15, !dbg !1092
  %conv2 = zext nneg i8 %1 to i32, !dbg !1093
  %mul = mul nuw nsw i32 %conv2, 3329, !dbg !1094
  %add = add nuw nsw i32 %mul, 8, !dbg !1095
  %shr = lshr i32 %add, 4, !dbg !1096
  %conv3 = trunc nuw nsw i32 %shr to i16, !dbg !1097
  %mul4 = shl nuw nsw i32 %i.0, 1, !dbg !1098
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul4, !dbg !1099
  store i16 %conv3, ptr %arrayidx6, align 2, !dbg !1100
  %2 = load i8, ptr %a.addr.0, align 1, !dbg !1101
  %3 = lshr i8 %2, 4, !dbg !1102
  %conv11 = zext nneg i8 %3 to i32, !dbg !1103
  %mul12 = mul nuw nsw i32 %conv11, 3329, !dbg !1104
  %add13 = add nuw nsw i32 %mul12, 8, !dbg !1105
  %shr14 = lshr i32 %add13, 4, !dbg !1106
  %conv15 = trunc nuw nsw i32 %shr14 to i16, !dbg !1107
  %mul16 = shl nuw nsw i32 %i.0, 1, !dbg !1108
  %add17 = or disjoint i32 %mul16, 1, !dbg !1109
  %arrayidx18 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add17, !dbg !1110
  store i16 %conv15, ptr %arrayidx18, align 2, !dbg !1111
    #dbg_value(ptr %a.addr.0, !1082, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1081)
  %add.ptr = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 1, !dbg !1112
    #dbg_value(ptr %add.ptr, !1082, !DIExpression(), !1081)
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1113
    #dbg_value(i32 %inc, !1083, !DIExpression(), !1081)
  br label %for.cond, !dbg !1114, !llvm.loop !1115

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1117
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_tobytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1118 {
entry:
    #dbg_value(ptr %r, !1119, !DIExpression(), !1120)
    #dbg_value(ptr %a, !1121, !DIExpression(), !1120)
    #dbg_value(i32 0, !1122, !DIExpression(), !1120)
  br label %for.cond, !dbg !1123

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1125
    #dbg_value(i32 %i.0, !1122, !DIExpression(), !1120)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !1126
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1128

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 1, !dbg !1129
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %mul, !dbg !1131
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1131
    #dbg_value(i16 %0, !1132, !DIExpression(), !1120)
  %isneg = icmp slt i16 %0, 0, !dbg !1133
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !1133
  %add = add i16 %and, %0, !dbg !1134
    #dbg_value(i16 %add, !1132, !DIExpression(), !1120)
  %mul3 = shl nuw nsw i32 %i.0, 1, !dbg !1135
  %add4 = or disjoint i32 %mul3, 1, !dbg !1136
  %arrayidx5 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add4, !dbg !1137
  %1 = load i16, ptr %arrayidx5, align 2, !dbg !1137
    #dbg_value(i16 %1, !1138, !DIExpression(), !1120)
  %isneg1 = icmp slt i16 %1, 0, !dbg !1139
  %and8 = select i1 %isneg1, i16 3329, i16 0, !dbg !1139
  %add10 = add i16 %and8, %1, !dbg !1140
    #dbg_value(i16 %add10, !1138, !DIExpression(), !1120)
  %conv14 = trunc i16 %add to i8, !dbg !1141
  %mul15 = mul nuw nsw i32 %i.0, 3, !dbg !1142
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %r, i32 %mul15, !dbg !1143
  store i8 %conv14, ptr %arrayidx17, align 1, !dbg !1144
  %2 = lshr i16 %add, 8, !dbg !1145
  %shr19 = trunc nuw i16 %2 to i8, !dbg !1145
  %conv20 = trunc i16 %add10 to i8, !dbg !1146
  %shl = shl i8 %conv20, 4, !dbg !1147
  %or = or i8 %shl, %shr19, !dbg !1148
  %mul22 = mul nuw nsw i32 %i.0, 3, !dbg !1149
  %3 = getelementptr inbounds nuw i8, ptr %r, i32 %mul22, !dbg !1150
  %arrayidx24 = getelementptr inbounds nuw i8, ptr %3, i32 1, !dbg !1150
  store i8 %or, ptr %arrayidx24, align 1, !dbg !1151
  %4 = lshr i16 %add10, 4, !dbg !1152
  %conv27 = trunc i16 %4 to i8, !dbg !1153
  %mul28 = mul nuw nsw i32 %i.0, 3, !dbg !1154
  %5 = getelementptr inbounds nuw i8, ptr %r, i32 %mul28, !dbg !1155
  %arrayidx30 = getelementptr inbounds nuw i8, ptr %5, i32 2, !dbg !1155
  store i8 %conv27, ptr %arrayidx30, align 1, !dbg !1156
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1157
    #dbg_value(i32 %inc, !1122, !DIExpression(), !1120)
  br label %for.cond, !dbg !1158, !llvm.loop !1159

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1161
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_frombytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1162 {
entry:
    #dbg_value(ptr %r, !1163, !DIExpression(), !1164)
    #dbg_value(ptr %a, !1165, !DIExpression(), !1164)
    #dbg_value(i32 0, !1166, !DIExpression(), !1164)
  br label %for.cond, !dbg !1167

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1169
    #dbg_value(i32 %i.0, !1166, !DIExpression(), !1164)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !1170
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1172

for.body:                                         ; preds = %for.cond
  %mul = mul nuw nsw i32 %i.0, 3, !dbg !1173
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %mul, !dbg !1175
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1175
  %conv = zext i8 %0 to i16, !dbg !1175
  %mul1 = mul nuw nsw i32 %i.0, 3, !dbg !1176
  %1 = getelementptr inbounds nuw i8, ptr %a, i32 %mul1, !dbg !1177
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %1, i32 1, !dbg !1177
  %2 = load i8, ptr %arrayidx3, align 1, !dbg !1177
  %conv5 = zext i8 %2 to i16, !dbg !1178
  %shl = shl nuw i16 %conv5, 8, !dbg !1179
  %shl.masked = and i16 %shl, 3840, !dbg !1180
  %and = or disjoint i16 %shl.masked, %conv, !dbg !1180
  %mul7 = shl nuw nsw i32 %i.0, 1, !dbg !1181
  %arrayidx8 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul7, !dbg !1182
  store i16 %and, ptr %arrayidx8, align 2, !dbg !1183
  %mul9 = mul nuw nsw i32 %i.0, 3, !dbg !1184
  %3 = getelementptr inbounds nuw i8, ptr %a, i32 %mul9, !dbg !1185
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %3, i32 1, !dbg !1185
  %4 = load i8, ptr %arrayidx11, align 1, !dbg !1185
  %5 = lshr i8 %4, 4, !dbg !1186
  %shr13 = zext nneg i8 %5 to i16, !dbg !1186
  %mul14 = mul nuw nsw i32 %i.0, 3, !dbg !1187
  %6 = getelementptr inbounds nuw i8, ptr %a, i32 %mul14, !dbg !1188
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %6, i32 2, !dbg !1188
  %7 = load i8, ptr %arrayidx16, align 1, !dbg !1188
  %conv18 = zext i8 %7 to i16, !dbg !1189
  %shl19 = shl nuw nsw i16 %conv18, 4, !dbg !1190
  %or20 = or disjoint i16 %shl19, %shr13, !dbg !1191
  %mul23 = shl nuw nsw i32 %i.0, 1, !dbg !1192
  %add24 = or disjoint i32 %mul23, 1, !dbg !1193
  %arrayidx25 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add24, !dbg !1194
  store i16 %or20, ptr %arrayidx25, align 2, !dbg !1195
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1196
    #dbg_value(i32 %inc, !1166, !DIExpression(), !1164)
  br label %for.cond, !dbg !1197, !llvm.loop !1198

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1200
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_frommsg(ptr noundef %r, ptr noundef %msg) local_unnamed_addr #0 !dbg !1201 {
entry:
    #dbg_value(ptr %r, !1202, !DIExpression(), !1203)
    #dbg_value(ptr %msg, !1204, !DIExpression(), !1203)
    #dbg_value(i32 0, !1205, !DIExpression(), !1203)
  br label %for.cond, !dbg !1206

for.cond:                                         ; preds = %for.inc8, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc9, %for.inc8 ], !dbg !1208
    #dbg_value(i32 %i.0, !1205, !DIExpression(), !1203)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1209
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end10, !dbg !1211

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1212

for.cond1:                                        ; preds = %for.cond1.preheader, %for.body3
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond1.preheader ], !dbg !1215
    #dbg_value(i32 %j.0, !1216, !DIExpression(), !1203)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1217
  br i1 %exitcond, label %for.body3, label %for.inc8, !dbg !1212

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !1219
  %add = or disjoint i32 %mul, %j.0, !dbg !1221
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add, !dbg !1222
  store i16 0, ptr %arrayidx, align 2, !dbg !1223
  %add.ptr.idx = shl nuw nsw i32 %i.0, 4, !dbg !1224
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 %add.ptr.idx, !dbg !1224
  %add.ptr5 = getelementptr inbounds nuw i16, ptr %add.ptr, i32 %j.0, !dbg !1225
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1226
  %0 = load i8, ptr %arrayidx6, align 1, !dbg !1226
  %conv = zext i8 %0 to i32, !dbg !1226
  %shr = lshr i32 %conv, %j.0, !dbg !1227
  %1 = trunc nuw nsw i32 %shr to i16, !dbg !1228
  %conv7 = and i16 %1, 1, !dbg !1228
  call void @pqcrystals_kyber768_ref_cmov_int16(ptr noundef %add.ptr5, i16 noundef signext 1665, i16 noundef zeroext %conv7) #3, !dbg !1229
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1230
    #dbg_value(i32 %inc, !1216, !DIExpression(), !1203)
  br label %for.cond1, !dbg !1231, !llvm.loop !1232

for.inc8:                                         ; preds = %for.cond1
  %inc9 = add nuw nsw i32 %i.0, 1, !dbg !1234
    #dbg_value(i32 %inc9, !1205, !DIExpression(), !1203)
  br label %for.cond, !dbg !1235, !llvm.loop !1236

for.end10:                                        ; preds = %for.cond
  ret void, !dbg !1238
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_tomsg(ptr noundef %msg, ptr noundef %a) local_unnamed_addr #0 !dbg !1239 {
entry:
    #dbg_value(ptr %msg, !1240, !DIExpression(), !1241)
    #dbg_value(ptr %a, !1242, !DIExpression(), !1241)
    #dbg_value(i32 0, !1243, !DIExpression(), !1241)
  br label %for.cond, !dbg !1244

for.cond:                                         ; preds = %for.inc11, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc12, %for.inc11 ], !dbg !1246
    #dbg_value(i32 %i.0, !1243, !DIExpression(), !1241)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1247
  br i1 %exitcond1, label %for.body, label %for.end13, !dbg !1249

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1250
  store i8 0, ptr %arrayidx, align 1, !dbg !1252
    #dbg_value(i32 0, !1253, !DIExpression(), !1241)
  br label %for.cond1, !dbg !1254

for.cond1:                                        ; preds = %for.body3, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body3 ], !dbg !1256
    #dbg_value(i32 %j.0, !1253, !DIExpression(), !1241)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1257
  br i1 %exitcond, label %for.body3, label %for.inc11, !dbg !1259

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !1260
  %add = or disjoint i32 %mul, %j.0, !dbg !1262
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add, !dbg !1263
  %0 = load i16, ptr %arrayidx4, align 2, !dbg !1263
  %conv = sext i16 %0 to i32, !dbg !1263
    #dbg_value(i32 %conv, !1264, !DIExpression(), !1241)
    #dbg_value(i32 %conv, !1264, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_stack_value), !1241)
    #dbg_value(i32 %conv, !1264, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !1241)
  %1 = mul i32 %conv, 161270, !dbg !1265
  %mul6 = add i32 %1, 134257275, !dbg !1265
    #dbg_value(i32 %mul6, !1264, !DIExpression(), !1241)
  %shr = lshr i32 %mul6, 28, !dbg !1266
    #dbg_value(i32 %shr, !1264, !DIExpression(), !1241)
  %and = and i32 %shr, 1, !dbg !1267
    #dbg_value(i32 %and, !1264, !DIExpression(), !1241)
  %shl7 = shl nuw nsw i32 %and, %j.0, !dbg !1268
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1269
  %2 = load i8, ptr %arrayidx8, align 1, !dbg !1270
  %3 = trunc nuw i32 %shl7 to i8, !dbg !1270
  %conv10 = or i8 %2, %3, !dbg !1270
  store i8 %conv10, ptr %arrayidx8, align 1, !dbg !1270
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1271
    #dbg_value(i32 %inc, !1253, !DIExpression(), !1241)
  br label %for.cond1, !dbg !1272, !llvm.loop !1273

for.inc11:                                        ; preds = %for.cond1
  %inc12 = add nuw nsw i32 %i.0, 1, !dbg !1275
    #dbg_value(i32 %inc12, !1243, !DIExpression(), !1241)
  br label %for.cond, !dbg !1276, !llvm.loop !1277

for.end13:                                        ; preds = %for.cond
  ret void, !dbg !1279
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_getnoise_eta1(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !1280 {
entry:
  %buf = alloca [128 x i8], align 1
    #dbg_value(ptr %r, !1283, !DIExpression(), !1284)
    #dbg_value(ptr %seed, !1285, !DIExpression(), !1284)
    #dbg_value(i8 %nonce, !1286, !DIExpression(), !1284)
    #dbg_declare(ptr %buf, !1287, !DIExpression(), !1289)
  call void @pqcrystals_kyber768_ref_kyber_shake256_prf(ptr noundef nonnull %buf, i32 noundef 128, ptr noundef %seed, i8 noundef zeroext %nonce) #3, !dbg !1290
  call void @pqcrystals_kyber768_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef nonnull %buf) #3, !dbg !1291
  ret void, !dbg !1292
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_getnoise_eta2(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !1293 {
entry:
  %buf = alloca [128 x i8], align 1
    #dbg_value(ptr %r, !1294, !DIExpression(), !1295)
    #dbg_value(ptr %seed, !1296, !DIExpression(), !1295)
    #dbg_value(i8 %nonce, !1297, !DIExpression(), !1295)
    #dbg_declare(ptr %buf, !1298, !DIExpression(), !1299)
  call void @pqcrystals_kyber768_ref_kyber_shake256_prf(ptr noundef nonnull %buf, i32 noundef 128, ptr noundef %seed, i8 noundef zeroext %nonce) #3, !dbg !1300
  call void @pqcrystals_kyber768_ref_poly_cbd_eta2(ptr noundef %r, ptr noundef nonnull %buf) #3, !dbg !1301
  ret void, !dbg !1302
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1303 {
entry:
    #dbg_value(ptr %r, !1306, !DIExpression(), !1307)
  call void @pqcrystals_kyber768_ref_ntt(ptr noundef %r) #3, !dbg !1308
  call void @pqcrystals_kyber768_ref_poly_reduce(ptr noundef %r) #3, !dbg !1309
  ret void, !dbg !1310
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_reduce(ptr noundef %r) local_unnamed_addr #0 !dbg !1311 {
entry:
    #dbg_value(ptr %r, !1312, !DIExpression(), !1313)
    #dbg_value(i32 0, !1314, !DIExpression(), !1313)
  br label %for.cond, !dbg !1315

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1317
    #dbg_value(i32 %i.0, !1314, !DIExpression(), !1313)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1318
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1320

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1321
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1321
  %call = call signext i16 @pqcrystals_kyber768_ref_barrett_reduce(i16 noundef signext %0) #3, !dbg !1322
  %arrayidx1 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1323
  store i16 %call, ptr %arrayidx1, align 2, !dbg !1324
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1325
    #dbg_value(i32 %inc, !1314, !DIExpression(), !1313)
  br label %for.cond, !dbg !1326, !llvm.loop !1327

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1329
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_invntt_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !1330 {
entry:
    #dbg_value(ptr %r, !1331, !DIExpression(), !1332)
  call void @pqcrystals_kyber768_ref_invntt(ptr noundef %r) #3, !dbg !1333
  ret void, !dbg !1334
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1335 {
entry:
    #dbg_value(ptr %r, !1338, !DIExpression(), !1339)
    #dbg_value(ptr %a, !1340, !DIExpression(), !1339)
    #dbg_value(ptr %b, !1341, !DIExpression(), !1339)
    #dbg_value(i32 0, !1342, !DIExpression(), !1339)
  br label %for.cond, !dbg !1343

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1345
    #dbg_value(i32 %i.0, !1342, !DIExpression(), !1339)
  %exitcond = icmp ne i32 %i.0, 64, !dbg !1346
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1348

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 2, !dbg !1349
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul, !dbg !1351
  %mul1 = shl nuw nsw i32 %i.0, 2, !dbg !1352
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %mul1, !dbg !1353
  %mul3 = shl nuw nsw i32 %i.0, 2, !dbg !1354
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %mul3, !dbg !1355
  %add = or disjoint i32 %i.0, 64, !dbg !1356
  %arrayidx5 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber768_ref_zetas, i32 0, i32 %add, !dbg !1357
  %0 = load i16, ptr %arrayidx5, align 2, !dbg !1357
  call void @pqcrystals_kyber768_ref_basemul(ptr noundef %arrayidx, ptr noundef %arrayidx2, ptr noundef %arrayidx4, i16 noundef signext %0) #3, !dbg !1358
  %mul6 = shl nuw nsw i32 %i.0, 2, !dbg !1359
  %add7 = or disjoint i32 %mul6, 2, !dbg !1360
  %arrayidx8 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add7, !dbg !1361
  %mul9 = shl nuw nsw i32 %i.0, 2, !dbg !1362
  %add10 = or disjoint i32 %mul9, 2, !dbg !1363
  %arrayidx11 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add10, !dbg !1364
  %mul12 = shl nuw nsw i32 %i.0, 2, !dbg !1365
  %add13 = or disjoint i32 %mul12, 2, !dbg !1366
  %arrayidx14 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %add13, !dbg !1367
  %add15 = or disjoint i32 %i.0, 64, !dbg !1368
  %arrayidx16 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber768_ref_zetas, i32 0, i32 %add15, !dbg !1369
  %1 = load i16, ptr %arrayidx16, align 2, !dbg !1369
  %sub = sub i16 0, %1, !dbg !1370
  call void @pqcrystals_kyber768_ref_basemul(ptr noundef nonnull %arrayidx8, ptr noundef nonnull %arrayidx11, ptr noundef nonnull %arrayidx14, i16 noundef signext %sub) #3, !dbg !1371
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1372
    #dbg_value(i32 %inc, !1342, !DIExpression(), !1339)
  br label %for.cond, !dbg !1373, !llvm.loop !1374

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1376
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !1377 {
entry:
    #dbg_value(ptr %r, !1378, !DIExpression(), !1379)
    #dbg_value(i16 1353, !1380, !DIExpression(), !1379)
    #dbg_value(i32 0, !1381, !DIExpression(), !1379)
  br label %for.cond, !dbg !1382

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1384
    #dbg_value(i32 %i.0, !1381, !DIExpression(), !1379)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1385
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1387

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1388
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1388
  %conv = sext i16 %0 to i32, !dbg !1389
  %mul = mul nsw i32 %conv, 1353, !dbg !1390
  %call = call signext i16 @pqcrystals_kyber768_ref_montgomery_reduce(i32 noundef %mul) #3, !dbg !1391
  %arrayidx1 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1392
  store i16 %call, ptr %arrayidx1, align 2, !dbg !1393
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1394
    #dbg_value(i32 %inc, !1381, !DIExpression(), !1379)
  br label %for.cond, !dbg !1395, !llvm.loop !1396

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1398
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1399 {
entry:
    #dbg_value(ptr %r, !1400, !DIExpression(), !1401)
    #dbg_value(ptr %a, !1402, !DIExpression(), !1401)
    #dbg_value(ptr %b, !1403, !DIExpression(), !1401)
    #dbg_value(i32 0, !1404, !DIExpression(), !1401)
  br label %for.cond, !dbg !1405

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1407
    #dbg_value(i32 %i.0, !1404, !DIExpression(), !1401)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1408
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1410

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %i.0, !dbg !1411
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1411
  %arrayidx1 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %i.0, !dbg !1412
  %1 = load i16, ptr %arrayidx1, align 2, !dbg !1412
  %add = add i16 %0, %1, !dbg !1413
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1414
  store i16 %add, ptr %arrayidx4, align 2, !dbg !1415
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1416
    #dbg_value(i32 %inc, !1404, !DIExpression(), !1401)
  br label %for.cond, !dbg !1417, !llvm.loop !1418

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1420
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_sub(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1421 {
entry:
    #dbg_value(ptr %r, !1422, !DIExpression(), !1423)
    #dbg_value(ptr %a, !1424, !DIExpression(), !1423)
    #dbg_value(ptr %b, !1425, !DIExpression(), !1423)
    #dbg_value(i32 0, !1426, !DIExpression(), !1423)
  br label %for.cond, !dbg !1427

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1429
    #dbg_value(i32 %i.0, !1426, !DIExpression(), !1423)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1430
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1432

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %i.0, !dbg !1433
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1433
  %arrayidx1 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %i.0, !dbg !1434
  %1 = load i16, ptr %arrayidx1, align 2, !dbg !1434
  %sub = sub i16 %0, %1, !dbg !1435
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1436
  store i16 %sub, ptr %arrayidx4, align 2, !dbg !1437
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1438
    #dbg_value(i32 %inc, !1426, !DIExpression(), !1423)
  br label %for.cond, !dbg !1439, !llvm.loop !1440

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1442
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1443 {
entry:
    #dbg_value(ptr %r, !1446, !DIExpression(), !1447)
    #dbg_value(i32 1, !1448, !DIExpression(), !1447)
    #dbg_value(i32 128, !1449, !DIExpression(), !1447)
  br label %for.cond, !dbg !1450

for.cond:                                         ; preds = %for.inc24, %entry
  %len.0 = phi i32 [ 128, %entry ], [ %shr, %for.inc24 ], !dbg !1452
  %k.0 = phi i32 [ 1, %entry ], [ %k.1.lcssa, %for.inc24 ], !dbg !1453
    #dbg_value(i32 %k.0, !1448, !DIExpression(), !1447)
    #dbg_value(i32 %len.0, !1449, !DIExpression(), !1447)
  %cmp = icmp samesign ugt i32 %len.0, 1, !dbg !1454
  br i1 %cmp, label %for.cond1.preheader, label %for.end25, !dbg !1456

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1457

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc21
  %start.0 = phi i32 [ %add22, %for.inc21 ], [ 0, %for.cond1.preheader ], !dbg !1460
  %k.1 = phi i32 [ %inc, %for.inc21 ], [ %k.0, %for.cond1.preheader ], !dbg !1447
    #dbg_value(i32 %k.1, !1448, !DIExpression(), !1447)
    #dbg_value(i32 %start.0, !1461, !DIExpression(), !1447)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !1462
  br i1 %cmp2, label %for.body3, label %for.inc24, !dbg !1457

for.body3:                                        ; preds = %for.cond1
    #dbg_value(i32 %inc, !1448, !DIExpression(), !1447)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber768_ref_zetas, i32 0, i32 %k.1, !dbg !1464
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1464
    #dbg_value(i16 %0, !1466, !DIExpression(), !1447)
    #dbg_value(i32 %start.0, !1467, !DIExpression(), !1447)
  br label %for.cond4, !dbg !1468

for.cond4:                                        ; preds = %for.body6, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc20, %for.body6 ], !dbg !1470
    #dbg_value(i32 %j.0, !1467, !DIExpression(), !1447)
  %add = add nuw nsw i32 %start.0, %len.0, !dbg !1471
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !1473
  br i1 %cmp5, label %for.body6, label %for.inc21, !dbg !1474

for.body6:                                        ; preds = %for.cond4
  %1 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1475
  %arrayidx8 = getelementptr i16, ptr %1, i32 %len.0, !dbg !1475
  %2 = load i16, ptr %arrayidx8, align 2, !dbg !1475
  %call = call fastcc signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %2) #3, !dbg !1477
    #dbg_value(i16 %call, !1478, !DIExpression(), !1447)
  %arrayidx9 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1479
  %3 = load i16, ptr %arrayidx9, align 2, !dbg !1479
  %sub = sub i16 %3, %call, !dbg !1480
  %4 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1481
  %arrayidx13 = getelementptr i16, ptr %4, i32 %len.0, !dbg !1481
  store i16 %sub, ptr %arrayidx13, align 2, !dbg !1482
  %arrayidx14 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1483
  %5 = load i16, ptr %arrayidx14, align 2, !dbg !1483
  %add17 = add i16 %5, %call, !dbg !1484
  %arrayidx19 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1485
  store i16 %add17, ptr %arrayidx19, align 2, !dbg !1486
  %inc20 = add nuw i32 %j.0, 1, !dbg !1487
    #dbg_value(i32 %inc20, !1467, !DIExpression(), !1447)
  br label %for.cond4, !dbg !1488, !llvm.loop !1489

for.inc21:                                        ; preds = %for.cond4
  %j.0.lcssa = phi i32 [ %j.0, %for.cond4 ], !dbg !1470
  %inc = add i32 %k.1, 1, !dbg !1491
  %add22 = add i32 %j.0.lcssa, %len.0, !dbg !1492
    #dbg_value(i32 %add22, !1461, !DIExpression(), !1447)
  br label %for.cond1, !dbg !1493, !llvm.loop !1494

for.inc24:                                        ; preds = %for.cond1
  %k.1.lcssa = phi i32 [ %k.1, %for.cond1 ], !dbg !1447
  %shr = lshr i32 %len.0, 1, !dbg !1496
    #dbg_value(i32 %shr, !1449, !DIExpression(), !1447)
  br label %for.cond, !dbg !1497, !llvm.loop !1498

for.end25:                                        ; preds = %for.cond
  ret void, !dbg !1500
}

; Function Attrs: nounwind
define internal fastcc signext i16 @fqmul(i16 noundef signext %a, i16 noundef signext %b) unnamed_addr #0 !dbg !1501 {
entry:
    #dbg_value(i16 %a, !1504, !DIExpression(), !1505)
    #dbg_value(i16 %b, !1506, !DIExpression(), !1505)
  %conv = sext i16 %a to i32, !dbg !1507
  %conv1 = sext i16 %b to i32, !dbg !1508
  %mul = mul nsw i32 %conv, %conv1, !dbg !1509
  %call = call signext i16 @pqcrystals_kyber768_ref_montgomery_reduce(i32 noundef %mul) #3, !dbg !1510
  ret i16 %call, !dbg !1511
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_invntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1512 {
entry:
    #dbg_value(ptr %r, !1513, !DIExpression(), !1514)
    #dbg_value(i16 1441, !1515, !DIExpression(), !1514)
    #dbg_value(i32 127, !1516, !DIExpression(), !1514)
    #dbg_value(i32 2, !1517, !DIExpression(), !1514)
  br label %for.cond, !dbg !1518

for.cond:                                         ; preds = %for.inc29, %entry
  %len.0 = phi i32 [ 2, %entry ], [ %shl, %for.inc29 ], !dbg !1520
  %k.0 = phi i32 [ 127, %entry ], [ %k.1.lcssa, %for.inc29 ], !dbg !1521
    #dbg_value(i32 %k.0, !1516, !DIExpression(), !1514)
    #dbg_value(i32 %len.0, !1517, !DIExpression(), !1514)
  %cmp = icmp ult i32 %len.0, 129, !dbg !1522
  br i1 %cmp, label %for.cond1.preheader, label %for.cond31.preheader, !dbg !1524

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1525

for.cond31.preheader:                             ; preds = %for.cond
  br label %for.cond31, !dbg !1528

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc26
  %start.0 = phi i32 [ %add27, %for.inc26 ], [ 0, %for.cond1.preheader ], !dbg !1530
  %k.1 = phi i32 [ %dec, %for.inc26 ], [ %k.0, %for.cond1.preheader ], !dbg !1514
    #dbg_value(i32 %k.1, !1516, !DIExpression(), !1514)
    #dbg_value(i32 %start.0, !1531, !DIExpression(), !1514)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !1532
  br i1 %cmp2, label %for.body3, label %for.inc29, !dbg !1525

for.body3:                                        ; preds = %for.cond1
    #dbg_value(i32 %dec, !1516, !DIExpression(), !1514)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber768_ref_zetas, i32 0, i32 %k.1, !dbg !1534
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1534
    #dbg_value(i16 %0, !1536, !DIExpression(), !1514)
    #dbg_value(i32 %start.0, !1537, !DIExpression(), !1514)
  br label %for.cond4, !dbg !1538

for.cond4:                                        ; preds = %for.body6, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc, %for.body6 ], !dbg !1540
    #dbg_value(i32 %j.0, !1537, !DIExpression(), !1514)
  %add = add nuw nsw i32 %start.0, %len.0, !dbg !1541
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !1543
  br i1 %cmp5, label %for.body6, label %for.inc26, !dbg !1544

for.body6:                                        ; preds = %for.cond4
  %arrayidx7 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1545
  %1 = load i16, ptr %arrayidx7, align 2, !dbg !1545
    #dbg_value(i16 %1, !1547, !DIExpression(), !1514)
  %2 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1548
  %arrayidx9 = getelementptr i16, ptr %2, i32 %len.0, !dbg !1548
  %3 = load i16, ptr %arrayidx9, align 2, !dbg !1548
  %add11 = add i16 %1, %3, !dbg !1549
  %call = call signext i16 @pqcrystals_kyber768_ref_barrett_reduce(i16 noundef signext %add11) #3, !dbg !1550
  %arrayidx13 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1551
  store i16 %call, ptr %arrayidx13, align 2, !dbg !1552
  %4 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1553
  %arrayidx15 = getelementptr i16, ptr %4, i32 %len.0, !dbg !1553
  %5 = load i16, ptr %arrayidx15, align 2, !dbg !1553
  %sub = sub i16 %5, %1, !dbg !1554
  %6 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1555
  %arrayidx20 = getelementptr i16, ptr %6, i32 %len.0, !dbg !1555
  store i16 %sub, ptr %arrayidx20, align 2, !dbg !1556
  %7 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1557
  %arrayidx22 = getelementptr i16, ptr %7, i32 %len.0, !dbg !1557
  %8 = load i16, ptr %arrayidx22, align 2, !dbg !1557
  %call23 = call fastcc signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %8) #3, !dbg !1558
  %9 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1559
  %arrayidx25 = getelementptr i16, ptr %9, i32 %len.0, !dbg !1559
  store i16 %call23, ptr %arrayidx25, align 2, !dbg !1560
  %inc = add nuw i32 %j.0, 1, !dbg !1561
    #dbg_value(i32 %inc, !1537, !DIExpression(), !1514)
  br label %for.cond4, !dbg !1562, !llvm.loop !1563

for.inc26:                                        ; preds = %for.cond4
  %j.0.lcssa = phi i32 [ %j.0, %for.cond4 ], !dbg !1540
  %dec = add i32 %k.1, -1, !dbg !1565
  %add27 = add i32 %j.0.lcssa, %len.0, !dbg !1566
    #dbg_value(i32 %add27, !1531, !DIExpression(), !1514)
  br label %for.cond1, !dbg !1567, !llvm.loop !1568

for.inc29:                                        ; preds = %for.cond1
  %k.1.lcssa = phi i32 [ %k.1, %for.cond1 ], !dbg !1514
  %shl = shl nuw nsw i32 %len.0, 1, !dbg !1570
    #dbg_value(i32 %shl, !1517, !DIExpression(), !1514)
  br label %for.cond, !dbg !1571, !llvm.loop !1572

for.cond31:                                       ; preds = %for.cond31.preheader, %for.body34
  %j.1 = phi i32 [ %inc39, %for.body34 ], [ 0, %for.cond31.preheader ], !dbg !1574
    #dbg_value(i32 %j.1, !1537, !DIExpression(), !1514)
  %exitcond = icmp ne i32 %j.1, 256, !dbg !1575
  br i1 %exitcond, label %for.body34, label %for.end40, !dbg !1528

for.body34:                                       ; preds = %for.cond31
  %arrayidx35 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !1577
  %10 = load i16, ptr %arrayidx35, align 2, !dbg !1577
  %call36 = call fastcc signext i16 @fqmul(i16 noundef signext %10, i16 noundef signext 1441) #3, !dbg !1578
  %arrayidx37 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !1579
  store i16 %call36, ptr %arrayidx37, align 2, !dbg !1580
  %inc39 = add nuw nsw i32 %j.1, 1, !dbg !1581
    #dbg_value(i32 %inc39, !1537, !DIExpression(), !1514)
  br label %for.cond31, !dbg !1582, !llvm.loop !1583

for.end40:                                        ; preds = %for.cond31
  ret void, !dbg !1585
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_basemul(ptr noundef %r, ptr noundef %a, ptr noundef %b, i16 noundef signext %zeta) local_unnamed_addr #0 !dbg !1586 {
entry:
    #dbg_value(ptr %r, !1590, !DIExpression(), !1591)
    #dbg_value(ptr %a, !1592, !DIExpression(), !1591)
    #dbg_value(ptr %b, !1593, !DIExpression(), !1591)
    #dbg_value(i16 %zeta, !1594, !DIExpression(), !1591)
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 2, !dbg !1595
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1595
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 2, !dbg !1596
  %1 = load i16, ptr %arrayidx1, align 2, !dbg !1596
  %call = call fastcc signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %1) #3, !dbg !1597
  store i16 %call, ptr %r, align 2, !dbg !1598
  %call4 = call fastcc signext i16 @fqmul(i16 noundef signext %call, i16 noundef signext %zeta) #3, !dbg !1599
  store i16 %call4, ptr %r, align 2, !dbg !1600
  %2 = load i16, ptr %a, align 2, !dbg !1601
  %3 = load i16, ptr %b, align 2, !dbg !1602
  %call8 = call fastcc signext i16 @fqmul(i16 noundef signext %2, i16 noundef signext %3) #3, !dbg !1603
  %4 = load i16, ptr %r, align 2, !dbg !1604
  %add = add i16 %4, %call8, !dbg !1604
  store i16 %add, ptr %r, align 2, !dbg !1604
  %5 = load i16, ptr %a, align 2, !dbg !1605
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %b, i32 2, !dbg !1606
  %6 = load i16, ptr %arrayidx13, align 2, !dbg !1606
  %call14 = call fastcc signext i16 @fqmul(i16 noundef signext %5, i16 noundef signext %6) #3, !dbg !1607
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %r, i32 2, !dbg !1608
  store i16 %call14, ptr %arrayidx15, align 2, !dbg !1609
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %a, i32 2, !dbg !1610
  %7 = load i16, ptr %arrayidx16, align 2, !dbg !1610
  %8 = load i16, ptr %b, align 2, !dbg !1611
  %call18 = call fastcc signext i16 @fqmul(i16 noundef signext %7, i16 noundef signext %8) #3, !dbg !1612
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %r, i32 2, !dbg !1613
  %9 = load i16, ptr %arrayidx20, align 2, !dbg !1614
  %add22 = add i16 %9, %call18, !dbg !1614
  store i16 %add22, ptr %arrayidx20, align 2, !dbg !1614
  ret void, !dbg !1615
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef %buf) local_unnamed_addr #0 !dbg !1616 {
entry:
    #dbg_value(ptr %r, !1618, !DIExpression(), !1619)
    #dbg_value(ptr %buf, !1620, !DIExpression(), !1619)
  call fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) #3, !dbg !1621
  ret void, !dbg !1622
}

; Function Attrs: nounwind
define internal fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) unnamed_addr #0 !dbg !1623 {
entry:
    #dbg_value(ptr %r, !1624, !DIExpression(), !1625)
    #dbg_value(ptr %buf, !1626, !DIExpression(), !1625)
    #dbg_value(i32 0, !1627, !DIExpression(), !1625)
  br label %for.cond, !dbg !1628

for.cond:                                         ; preds = %for.inc19, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc20, %for.inc19 ], !dbg !1630
    #dbg_value(i32 %i.0, !1627, !DIExpression(), !1625)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1631
  br i1 %exitcond1, label %for.body, label %for.end21, !dbg !1633

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 2, !dbg !1634
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 %mul, !dbg !1636
  %call = call fastcc i32 @load32_littleendian(ptr noundef %add.ptr) #3, !dbg !1637
    #dbg_value(i32 %call, !1638, !DIExpression(), !1625)
  %and = and i32 %call, 1431655765, !dbg !1639
    #dbg_value(i32 %and, !1640, !DIExpression(), !1625)
  %shr = lshr i32 %call, 1, !dbg !1641
  %and1 = and i32 %shr, 1431655765, !dbg !1642
  %add = add nuw i32 %and, %and1, !dbg !1643
    #dbg_value(i32 %add, !1640, !DIExpression(), !1625)
    #dbg_value(i32 0, !1644, !DIExpression(), !1625)
  br label %for.cond2, !dbg !1645

for.cond2:                                        ; preds = %for.body4, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body4 ], !dbg !1647
    #dbg_value(i32 %j.0, !1644, !DIExpression(), !1625)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1648
  br i1 %exitcond, label %for.body4, label %for.inc19, !dbg !1650

for.body4:                                        ; preds = %for.cond2
  %mul5 = shl nuw nsw i32 %j.0, 2, !dbg !1651
  %shr7 = lshr i32 %add, %mul5, !dbg !1653
  %conv = and i32 %shr7, 3, !dbg !1654
    #dbg_value(i32 %shr7, !1655, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3, DW_OP_and, DW_OP_stack_value), !1625)
  %mul9 = shl nuw nsw i32 %j.0, 2, !dbg !1656
  %add10 = or disjoint i32 %mul9, 2, !dbg !1657
  %shr11 = lshr i32 %add, %add10, !dbg !1658
  %conv13 = and i32 %shr11, 3, !dbg !1659
    #dbg_value(i32 %conv13, !1660, !DIExpression(), !1625)
  %sub = sub nsw i32 %conv, %conv13, !dbg !1661
  %conv16 = trunc nsw i32 %sub to i16, !dbg !1662
  %mul17 = shl nuw nsw i32 %i.0, 3, !dbg !1663
  %add18 = or disjoint i32 %mul17, %j.0, !dbg !1664
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add18, !dbg !1665
  store i16 %conv16, ptr %arrayidx, align 2, !dbg !1666
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1667
    #dbg_value(i32 %inc, !1644, !DIExpression(), !1625)
  br label %for.cond2, !dbg !1668, !llvm.loop !1669

for.inc19:                                        ; preds = %for.cond2
  %inc20 = add nuw nsw i32 %i.0, 1, !dbg !1671
    #dbg_value(i32 %inc20, !1627, !DIExpression(), !1625)
  br label %for.cond, !dbg !1672, !llvm.loop !1673

for.end21:                                        ; preds = %for.cond
  ret void, !dbg !1675
}

; Function Attrs: nounwind
define internal fastcc i32 @load32_littleendian(ptr noundef %x) unnamed_addr #0 !dbg !1676 {
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
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %x, i32 3, !dbg !1692
  %3 = load i8, ptr %arrayidx7, align 1, !dbg !1692
  %conv8 = zext i8 %3 to i32, !dbg !1693
  %shl9 = shl nuw i32 %conv8, 24, !dbg !1694
  %or10 = or disjoint i32 %or6, %shl9, !dbg !1695
    #dbg_value(i32 %or10, !1683, !DIExpression(), !1680)
  ret i32 %or10, !dbg !1696
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_cbd_eta2(ptr noundef %r, ptr noundef %buf) local_unnamed_addr #0 !dbg !1697 {
entry:
    #dbg_value(ptr %r, !1698, !DIExpression(), !1699)
    #dbg_value(ptr %buf, !1700, !DIExpression(), !1699)
  call fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) #3, !dbg !1701
  ret void, !dbg !1702
}

; Function Attrs: nounwind
define dso_local signext i16 @pqcrystals_kyber768_ref_montgomery_reduce(i32 noundef %a) local_unnamed_addr #0 !dbg !1703 {
entry:
    #dbg_value(i32 %a, !1706, !DIExpression(), !1707)
    #dbg_value(i32 %a, !1708, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !1707)
  %sext = mul i32 %a, -218038272, !dbg !1709
  %conv3 = ashr exact i32 %sext, 16, !dbg !1709
  %mul4.neg = mul nsw i32 %conv3, -3329, !dbg !1710
  %sub = add i32 %mul4.neg, %a, !dbg !1711
  %shr = lshr i32 %sub, 16, !dbg !1712
  %conv5 = trunc nuw i32 %shr to i16, !dbg !1713
    #dbg_value(i16 %conv5, !1708, !DIExpression(), !1707)
  ret i16 %conv5, !dbg !1714
}

; Function Attrs: nounwind
define dso_local signext i16 @pqcrystals_kyber768_ref_barrett_reduce(i16 noundef signext %a) local_unnamed_addr #0 !dbg !1715 {
entry:
    #dbg_value(i16 %a, !1718, !DIExpression(), !1719)
    #dbg_value(i16 20159, !1720, !DIExpression(), !1719)
  %conv = sext i16 %a to i32, !dbg !1721
  %mul = mul nsw i32 %conv, 20159, !dbg !1722
  %add = add nsw i32 %mul, 33554432, !dbg !1723
  %shr = ashr i32 %add, 26, !dbg !1724
    #dbg_value(i32 %shr, !1725, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1719)
    #dbg_value(i32 %shr, !1725, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1719)
  %0 = trunc nsw i32 %shr to i16, !dbg !1726
  %1 = mul i16 %0, -3329, !dbg !1726
  %conv7 = add i16 %1, %a, !dbg !1726
  ret i16 %conv7, !dbg !1727
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqcrystals_kyber768_ref_verify(ptr noundef %a, ptr noundef %b, i32 noundef %len) local_unnamed_addr #0 !dbg !1728 {
entry:
    #dbg_value(ptr %a, !1732, !DIExpression(), !1733)
    #dbg_value(ptr %b, !1734, !DIExpression(), !1733)
    #dbg_value(i32 %len, !1735, !DIExpression(), !1733)
    #dbg_value(i8 0, !1736, !DIExpression(), !1733)
    #dbg_value(i32 0, !1737, !DIExpression(), !1733)
  br label %for.cond, !dbg !1738

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1740
  %r.0 = phi i8 [ 0, %entry ], [ %or2, %for.inc ], !dbg !1733
    #dbg_value(i8 %r.0, !1736, !DIExpression(), !1733)
    #dbg_value(i32 %i.0, !1737, !DIExpression(), !1733)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !1741
  br i1 %exitcond, label %for.inc, label %for.end, !dbg !1743

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i8 poison, i8 poison, i8 poison), !1736, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1733)
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %i.0, !dbg !1744
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1744
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 %i.0, !dbg !1745
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !1745
    #dbg_value(!DIArgList(i8 %r.0, i8 %0, i8 %1), !1736, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1733)
  %xor1 = xor i8 %0, %1, !dbg !1746
    #dbg_value(!DIArgList(i8 %r.0, i8 %xor1), !1736, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1733)
  %or2 = or i8 %r.0, %xor1, !dbg !1747
    #dbg_value(i8 %or2, !1736, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1733)
    #dbg_value(i8 %or2, !1736, !DIExpression(), !1733)
  %inc = add i32 %i.0, 1, !dbg !1748
    #dbg_value(i32 %inc, !1737, !DIExpression(), !1733)
  br label %for.cond, !dbg !1749, !llvm.loop !1750

for.end:                                          ; preds = %for.cond
  %r.0.lcssa = phi i8 [ %r.0, %for.cond ], !dbg !1733
  %2 = icmp ne i8 %r.0.lcssa, 0, !dbg !1752
  %conv6 = zext i1 %2 to i32, !dbg !1753
  ret i32 %conv6, !dbg !1754
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_cmov(ptr noundef %r, ptr noundef %x, i32 noundef %len, i8 noundef zeroext %b) local_unnamed_addr #0 !dbg !1755 {
entry:
    #dbg_value(ptr %r, !1758, !DIExpression(), !1759)
    #dbg_value(ptr %x, !1760, !DIExpression(), !1759)
    #dbg_value(i32 %len, !1761, !DIExpression(), !1759)
    #dbg_value(i8 %b, !1762, !DIExpression(), !1759)
  %0 = call i8 asm "", "=r,0"(i8 %b) #5, !dbg !1763, !srcloc !1764
    #dbg_value(i8 %0, !1762, !DIExpression(), !1759)
  %sub = sub i8 0, %0, !dbg !1765
    #dbg_value(i8 %sub, !1762, !DIExpression(), !1759)
    #dbg_value(i32 0, !1766, !DIExpression(), !1759)
  br label %for.cond, !dbg !1767

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1769
    #dbg_value(i32 %i.0, !1766, !DIExpression(), !1759)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !1770
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1772

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !1773
  %1 = load i8, ptr %arrayidx, align 1, !dbg !1773
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !1774
  %2 = load i8, ptr %arrayidx5, align 1, !dbg !1774
  %xor1 = xor i8 %1, %2, !dbg !1775
  %and2 = and i8 %xor1, %sub, !dbg !1776
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !1777
  %xor93 = xor i8 %1, %and2, !dbg !1778
  store i8 %xor93, ptr %arrayidx7, align 1, !dbg !1778
  %inc = add i32 %i.0, 1, !dbg !1779
    #dbg_value(i32 %inc, !1766, !DIExpression(), !1759)
  br label %for.cond, !dbg !1780, !llvm.loop !1781

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1783
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_cmov_int16(ptr noundef %r, i16 noundef signext %v, i16 noundef zeroext %b) local_unnamed_addr #0 !dbg !1784 {
entry:
    #dbg_value(ptr %r, !1787, !DIExpression(), !1788)
    #dbg_value(i16 %v, !1789, !DIExpression(), !1788)
    #dbg_value(i16 %b, !1790, !DIExpression(), !1788)
  %sub = sub i16 0, %b, !dbg !1791
    #dbg_value(i16 %sub, !1790, !DIExpression(), !1788)
  %0 = load i16, ptr %r, align 2, !dbg !1792
  %xor1 = xor i16 %0, %v, !dbg !1793
  %and = and i16 %xor1, %sub, !dbg !1794
  %xor6 = xor i16 %and, %0, !dbg !1795
  store i16 %xor6, ptr %r, align 2, !dbg !1795
  ret void, !dbg !1796
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_init(ptr noundef %state) local_unnamed_addr #0 !dbg !1797 {
entry:
    #dbg_value(ptr %state, !1801, !DIExpression(), !1802)
  call fastcc void @keccak_init(ptr noundef %state) #3, !dbg !1803
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1804
  store i64 0, ptr %arrayidx, align 8, !dbg !1805
  ret void, !dbg !1806
}

; Function Attrs: nounwind
define internal fastcc void @keccak_init(ptr noundef %s) unnamed_addr #0 !dbg !1807 {
entry:
    #dbg_value(ptr %s, !1811, !DIExpression(), !1812)
    #dbg_value(i32 0, !1813, !DIExpression(), !1812)
  br label %for.cond, !dbg !1814

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1816
    #dbg_value(i32 %i.0, !1813, !DIExpression(), !1812)
  %exitcond = icmp ne i32 %i.0, 25, !dbg !1817
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1819

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !1820
  store i64 0, ptr %arrayidx, align 8, !dbg !1821
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1822
    #dbg_value(i32 %inc, !1813, !DIExpression(), !1812)
  br label %for.cond, !dbg !1823, !llvm.loop !1824

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1826
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !1827 {
entry:
    #dbg_value(ptr %state, !1830, !DIExpression(), !1831)
    #dbg_value(ptr %in, !1832, !DIExpression(), !1831)
    #dbg_value(i32 %inlen, !1833, !DIExpression(), !1831)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1834
  %0 = load i64, ptr %arrayidx, align 8, !dbg !1834
  %conv = trunc i64 %0 to i32, !dbg !1834
  %call = call fastcc i32 @keccak_absorb(ptr noundef %state, i32 noundef %conv, i32 noundef 168, ptr noundef %in, i32 noundef %inlen) #3, !dbg !1835
  %conv1 = zext i32 %call to i64, !dbg !1835
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1836
  store i64 %conv1, ptr %arrayidx2, align 8, !dbg !1837
  ret void, !dbg !1838
}

; Function Attrs: nounwind
define internal fastcc i32 @keccak_absorb(ptr noundef %s, i32 noundef %pos, i32 noundef range(i32 136, 169) %r, ptr noundef %in, i32 noundef %inlen) unnamed_addr #0 !dbg !1839 {
entry:
    #dbg_value(ptr %s, !1842, !DIExpression(), !1843)
    #dbg_value(i32 %pos, !1844, !DIExpression(), !1843)
    #dbg_value(i32 %r, !1845, !DIExpression(), !1843)
    #dbg_value(ptr %in, !1846, !DIExpression(), !1843)
    #dbg_value(i32 %inlen, !1847, !DIExpression(), !1843)
  br label %while.cond, !dbg !1848

while.cond:                                       ; preds = %for.end, %entry
  %in.addr.0 = phi ptr [ %in, %entry ], [ %in.addr.1.lcssa, %for.end ]
  %inlen.addr.0 = phi i32 [ %inlen, %entry ], [ %sub2, %for.end ]
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ 0, %for.end ]
    #dbg_value(i32 %pos.addr.0, !1844, !DIExpression(), !1843)
    #dbg_value(i32 %inlen.addr.0, !1847, !DIExpression(), !1843)
    #dbg_value(ptr %in.addr.0, !1846, !DIExpression(), !1843)
  %add = add i32 %pos.addr.0, %inlen.addr.0, !dbg !1849
  %cmp.not = icmp ult i32 %add, %r, !dbg !1850
  br i1 %cmp.not, label %for.cond3.preheader, label %for.cond.preheader, !dbg !1848

for.cond.preheader:                               ; preds = %while.cond
  %umax = call i32 @llvm.umax.i32(i32 %pos.addr.0, i32 %r), !dbg !1851
  br label %for.cond, !dbg !1851

for.cond3.preheader:                              ; preds = %while.cond
  %in.addr.0.lcssa = phi ptr [ %in.addr.0, %while.cond ]
  %inlen.addr.0.lcssa = phi i32 [ %inlen.addr.0, %while.cond ]
  %pos.addr.0.lcssa = phi i32 [ %pos.addr.0, %while.cond ]
  br label %for.cond3, !dbg !1854

for.cond:                                         ; preds = %for.cond.preheader, %for.body
  %in.addr.1 = phi ptr [ %incdec.ptr, %for.body ], [ %in.addr.0, %for.cond.preheader ]
  %i.0 = phi i32 [ %inc, %for.body ], [ %pos.addr.0, %for.cond.preheader ], !dbg !1856
    #dbg_value(i32 %i.0, !1857, !DIExpression(), !1843)
    #dbg_value(ptr %in.addr.1, !1846, !DIExpression(), !1843)
  %exitcond = icmp ne i32 %i.0, %umax, !dbg !1858
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1851

for.body:                                         ; preds = %for.cond
    #dbg_value(ptr %in.addr.1, !1846, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1843)
  %0 = load i8, ptr %in.addr.1, align 1, !dbg !1860
  %conv = zext i8 %0 to i64, !dbg !1861
  %rem = shl nuw nsw i32 %i.0, 3, !dbg !1862
  %mul = and i32 %rem, 56, !dbg !1862
  %sh_prom = zext nneg i32 %mul to i64, !dbg !1863
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !1863
  %div2 = lshr i32 %i.0, 3, !dbg !1864
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div2, !dbg !1865
  %1 = load i64, ptr %arrayidx, align 8, !dbg !1866
  %xor = xor i64 %1, %shl, !dbg !1866
  store i64 %xor, ptr %arrayidx, align 8, !dbg !1866
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %in.addr.1, i32 1, !dbg !1867
    #dbg_value(ptr %incdec.ptr, !1846, !DIExpression(), !1843)
  %inc = add i32 %i.0, 1, !dbg !1868
    #dbg_value(i32 %inc, !1857, !DIExpression(), !1843)
  br label %for.cond, !dbg !1869, !llvm.loop !1870

for.end:                                          ; preds = %for.cond
  %in.addr.1.lcssa = phi ptr [ %in.addr.1, %for.cond ]
  %sub.neg = sub i32 %pos.addr.0, %r, !dbg !1872
  %sub2 = add i32 %sub.neg, %inlen.addr.0, !dbg !1873
    #dbg_value(i32 %sub2, !1847, !DIExpression(), !1843)
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !1874
    #dbg_value(i32 0, !1844, !DIExpression(), !1843)
  br label %while.cond, !dbg !1848, !llvm.loop !1875

for.cond3:                                        ; preds = %for.cond3.preheader, %for.body7
  %in.addr.2 = phi ptr [ %incdec.ptr8, %for.body7 ], [ %in.addr.0.lcssa, %for.cond3.preheader ]
  %i.1 = phi i32 [ %inc18, %for.body7 ], [ %pos.addr.0.lcssa, %for.cond3.preheader ], !dbg !1877
    #dbg_value(i32 %i.1, !1857, !DIExpression(), !1843)
    #dbg_value(ptr %in.addr.2, !1846, !DIExpression(), !1843)
  %add4 = add i32 %pos.addr.0.lcssa, %inlen.addr.0.lcssa, !dbg !1878
  %cmp5 = icmp ult i32 %i.1, %add4, !dbg !1880
  br i1 %cmp5, label %for.body7, label %for.end19, !dbg !1854

for.body7:                                        ; preds = %for.cond3
    #dbg_value(ptr %in.addr.2, !1846, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1843)
  %2 = load i8, ptr %in.addr.2, align 1, !dbg !1881
  %conv9 = zext i8 %2 to i64, !dbg !1882
  %rem10 = shl i32 %i.1, 3, !dbg !1883
  %mul11 = and i32 %rem10, 56, !dbg !1883
  %sh_prom12 = zext nneg i32 %mul11 to i64, !dbg !1884
  %shl13 = shl nuw i64 %conv9, %sh_prom12, !dbg !1884
  %div141 = lshr i32 %i.1, 3, !dbg !1885
  %arrayidx15 = getelementptr inbounds nuw i64, ptr %s, i32 %div141, !dbg !1886
  %3 = load i64, ptr %arrayidx15, align 8, !dbg !1887
  %xor16 = xor i64 %3, %shl13, !dbg !1887
  store i64 %xor16, ptr %arrayidx15, align 8, !dbg !1887
  %incdec.ptr8 = getelementptr inbounds nuw i8, ptr %in.addr.2, i32 1, !dbg !1888
    #dbg_value(ptr %incdec.ptr8, !1846, !DIExpression(), !1843)
  %inc18 = add nuw i32 %i.1, 1, !dbg !1889
    #dbg_value(i32 %inc18, !1857, !DIExpression(), !1843)
  br label %for.cond3, !dbg !1890, !llvm.loop !1891

for.end19:                                        ; preds = %for.cond3
  %i.1.lcssa = phi i32 [ %i.1, %for.cond3 ], !dbg !1877
  ret i32 %i.1.lcssa, !dbg !1893
}

; Function Attrs: nounwind
define internal fastcc void @KeccakF1600_StatePermute(ptr noundef %state) unnamed_addr #0 !dbg !1894 {
entry:
    #dbg_value(ptr %state, !1895, !DIExpression(), !1896)
  %0 = load i64, ptr %state, align 8, !dbg !1897
    #dbg_value(i64 %0, !1898, !DIExpression(), !1896)
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !1899
  %1 = load i64, ptr %arrayidx1, align 8, !dbg !1899
    #dbg_value(i64 %1, !1900, !DIExpression(), !1896)
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !1901
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !1901
    #dbg_value(i64 %2, !1902, !DIExpression(), !1896)
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !1903
  %3 = load i64, ptr %arrayidx3, align 8, !dbg !1903
    #dbg_value(i64 %3, !1904, !DIExpression(), !1896)
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !1905
  %4 = load i64, ptr %arrayidx4, align 8, !dbg !1905
    #dbg_value(i64 %4, !1906, !DIExpression(), !1896)
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !1907
  %5 = load i64, ptr %arrayidx5, align 8, !dbg !1907
    #dbg_value(i64 %5, !1908, !DIExpression(), !1896)
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !1909
  %6 = load i64, ptr %arrayidx6, align 8, !dbg !1909
    #dbg_value(i64 %6, !1910, !DIExpression(), !1896)
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !1911
  %7 = load i64, ptr %arrayidx7, align 8, !dbg !1911
    #dbg_value(i64 %7, !1912, !DIExpression(), !1896)
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !1913
  %8 = load i64, ptr %arrayidx8, align 8, !dbg !1913
    #dbg_value(i64 %8, !1914, !DIExpression(), !1896)
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !1915
  %9 = load i64, ptr %arrayidx9, align 8, !dbg !1915
    #dbg_value(i64 %9, !1916, !DIExpression(), !1896)
  %arrayidx10 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !1917
  %10 = load i64, ptr %arrayidx10, align 8, !dbg !1917
    #dbg_value(i64 %10, !1918, !DIExpression(), !1896)
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !1919
  %11 = load i64, ptr %arrayidx11, align 8, !dbg !1919
    #dbg_value(i64 %11, !1920, !DIExpression(), !1896)
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !1921
  %12 = load i64, ptr %arrayidx12, align 8, !dbg !1921
    #dbg_value(i64 %12, !1922, !DIExpression(), !1896)
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !1923
  %13 = load i64, ptr %arrayidx13, align 8, !dbg !1923
    #dbg_value(i64 %13, !1924, !DIExpression(), !1896)
  %arrayidx14 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !1925
  %14 = load i64, ptr %arrayidx14, align 8, !dbg !1925
    #dbg_value(i64 %14, !1926, !DIExpression(), !1896)
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !1927
  %15 = load i64, ptr %arrayidx15, align 8, !dbg !1927
    #dbg_value(i64 %15, !1928, !DIExpression(), !1896)
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !1929
  %16 = load i64, ptr %arrayidx16, align 8, !dbg !1929
    #dbg_value(i64 %16, !1930, !DIExpression(), !1896)
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !1931
  %17 = load i64, ptr %arrayidx17, align 8, !dbg !1931
    #dbg_value(i64 %17, !1932, !DIExpression(), !1896)
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !1933
  %18 = load i64, ptr %arrayidx18, align 8, !dbg !1933
    #dbg_value(i64 %18, !1934, !DIExpression(), !1896)
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !1935
  %19 = load i64, ptr %arrayidx19, align 8, !dbg !1935
    #dbg_value(i64 %19, !1936, !DIExpression(), !1896)
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !1937
  %20 = load i64, ptr %arrayidx20, align 8, !dbg !1937
    #dbg_value(i64 %20, !1938, !DIExpression(), !1896)
  %arrayidx21 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !1939
  %21 = load i64, ptr %arrayidx21, align 8, !dbg !1939
    #dbg_value(i64 %21, !1940, !DIExpression(), !1896)
  %arrayidx22 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !1941
  %22 = load i64, ptr %arrayidx22, align 8, !dbg !1941
    #dbg_value(i64 %22, !1942, !DIExpression(), !1896)
  %arrayidx23 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !1943
  %23 = load i64, ptr %arrayidx23, align 8, !dbg !1943
    #dbg_value(i64 %23, !1944, !DIExpression(), !1896)
  %arrayidx24 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !1945
  %24 = load i64, ptr %arrayidx24, align 8, !dbg !1945
    #dbg_value(i64 %24, !1946, !DIExpression(), !1896)
    #dbg_value(i32 0, !1947, !DIExpression(), !1896)
  br label %for.cond, !dbg !1948

for.cond:                                         ; preds = %for.inc, %entry
  %Aso.0 = phi i64 [ %23, %entry ], [ %xor444, %for.inc ], !dbg !1896
  %Asi.0 = phi i64 [ %22, %entry ], [ %xor441, %for.inc ], !dbg !1896
  %Ase.0 = phi i64 [ %21, %entry ], [ %xor438, %for.inc ], !dbg !1896
  %Asa.0 = phi i64 [ %20, %entry ], [ %xor435, %for.inc ], !dbg !1896
  %Amu.0 = phi i64 [ %19, %entry ], [ %xor412, %for.inc ], !dbg !1896
  %Amo.0 = phi i64 [ %18, %entry ], [ %xor409, %for.inc ], !dbg !1896
  %Ami.0 = phi i64 [ %17, %entry ], [ %xor406, %for.inc ], !dbg !1896
  %Ame.0 = phi i64 [ %16, %entry ], [ %xor403, %for.inc ], !dbg !1896
  %Ama.0 = phi i64 [ %15, %entry ], [ %xor400, %for.inc ], !dbg !1896
  %Aku.0 = phi i64 [ %14, %entry ], [ %xor377, %for.inc ], !dbg !1896
  %Ako.0 = phi i64 [ %13, %entry ], [ %xor374, %for.inc ], !dbg !1896
  %Aki.0 = phi i64 [ %12, %entry ], [ %xor371, %for.inc ], !dbg !1896
  %Ake.0 = phi i64 [ %11, %entry ], [ %xor368, %for.inc ], !dbg !1896
  %Aka.0 = phi i64 [ %10, %entry ], [ %xor365, %for.inc ], !dbg !1896
  %Agu.0 = phi i64 [ %9, %entry ], [ %xor342, %for.inc ], !dbg !1896
  %Ago.0 = phi i64 [ %8, %entry ], [ %xor339, %for.inc ], !dbg !1896
  %Agi.0 = phi i64 [ %7, %entry ], [ %xor336, %for.inc ], !dbg !1896
  %Age.0 = phi i64 [ %6, %entry ], [ %xor333, %for.inc ], !dbg !1896
  %Aga.0 = phi i64 [ %5, %entry ], [ %xor330, %for.inc ], !dbg !1896
  %Abu.0 = phi i64 [ %4, %entry ], [ %xor307, %for.inc ], !dbg !1896
  %Abo.0 = phi i64 [ %3, %entry ], [ %xor304, %for.inc ], !dbg !1896
  %Abi.0 = phi i64 [ %2, %entry ], [ %xor301, %for.inc ], !dbg !1896
  %Abe.0 = phi i64 [ %1, %entry ], [ %xor298, %for.inc ], !dbg !1896
  %Aba.0 = phi i64 [ %0, %entry ], [ %xor295, %for.inc ], !dbg !1896
  %round.0 = phi i32 [ 0, %entry ], [ %add448, %for.inc ], !dbg !1950
  %Asu.0 = phi i64 [ %24, %entry ], [ %xor447, %for.inc ], !dbg !1896
    #dbg_value(i64 %Asu.0, !1946, !DIExpression(), !1896)
    #dbg_value(i32 %round.0, !1947, !DIExpression(), !1896)
    #dbg_value(i64 %Aba.0, !1898, !DIExpression(), !1896)
    #dbg_value(i64 %Abe.0, !1900, !DIExpression(), !1896)
    #dbg_value(i64 %Abi.0, !1902, !DIExpression(), !1896)
    #dbg_value(i64 %Abo.0, !1904, !DIExpression(), !1896)
    #dbg_value(i64 %Abu.0, !1906, !DIExpression(), !1896)
    #dbg_value(i64 %Aga.0, !1908, !DIExpression(), !1896)
    #dbg_value(i64 %Age.0, !1910, !DIExpression(), !1896)
    #dbg_value(i64 %Agi.0, !1912, !DIExpression(), !1896)
    #dbg_value(i64 %Ago.0, !1914, !DIExpression(), !1896)
    #dbg_value(i64 %Agu.0, !1916, !DIExpression(), !1896)
    #dbg_value(i64 %Aka.0, !1918, !DIExpression(), !1896)
    #dbg_value(i64 %Ake.0, !1920, !DIExpression(), !1896)
    #dbg_value(i64 %Aki.0, !1922, !DIExpression(), !1896)
    #dbg_value(i64 %Ako.0, !1924, !DIExpression(), !1896)
    #dbg_value(i64 %Aku.0, !1926, !DIExpression(), !1896)
    #dbg_value(i64 %Ama.0, !1928, !DIExpression(), !1896)
    #dbg_value(i64 %Ame.0, !1930, !DIExpression(), !1896)
    #dbg_value(i64 %Ami.0, !1932, !DIExpression(), !1896)
    #dbg_value(i64 %Amo.0, !1934, !DIExpression(), !1896)
    #dbg_value(i64 %Amu.0, !1936, !DIExpression(), !1896)
    #dbg_value(i64 %Asa.0, !1938, !DIExpression(), !1896)
    #dbg_value(i64 %Ase.0, !1940, !DIExpression(), !1896)
    #dbg_value(i64 %Asi.0, !1942, !DIExpression(), !1896)
    #dbg_value(i64 %Aso.0, !1944, !DIExpression(), !1896)
  %cmp = icmp samesign ult i32 %round.0, 24, !dbg !1951
  br i1 %cmp, label %for.inc, label %for.end, !dbg !1953

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %Asa.0, i64 %Ama.0, i64 %Aka.0, i64 %Aga.0), !1954, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %Ase.0, i64 %Ame.0, i64 %Ake.0, i64 %Age.0), !1955, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %Asi.0, i64 %Ami.0, i64 %Aki.0, i64 %Agi.0), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %Aso.0, i64 %Amo.0, i64 %Ako.0, i64 %Ago.0), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %Asu.0, i64 %Amu.0, i64 %Aku.0, i64 %Agu.0), !1958, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1959, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1960, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1961, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1962, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1963, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1898, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1954, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1910, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1955, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1922, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1956, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1934, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1957, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1946, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1958, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !1964, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !1964, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1965, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1967, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1968, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1904, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1954, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1916, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1955, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1918, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1956, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1930, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1957, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1942, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1958, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1969, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1970, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1971, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1972, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1973, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1900, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1954, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1912, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1955, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1924, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1956, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1936, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1957, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1938, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1958, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1975, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1976, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1977, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1906, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1954, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1908, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1955, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1920, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1956, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1932, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1957, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1944, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1958, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1979, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1981, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1983, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1902, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1954, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1914, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1955, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1926, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1956, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1928, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1957, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1940, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1958, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1985, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1986, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1987, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1988, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !1954, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1955, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1958, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1959, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1960, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1961, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1962, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1963, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1964, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1954, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1970, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1955, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1976, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1956, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1957, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1988, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1958, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1898, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !1898, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1900, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1902, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1904, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !1906, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1967, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1954, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1973, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1955, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1956, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1957, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1986, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1958, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1908, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1910, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1912, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1914, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1916, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1965, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1954, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1971, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1955, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1977, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1956, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1983, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1957, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1958, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1918, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1920, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1922, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1924, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1926, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1968, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1954, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1969, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1955, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1975, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1956, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1981, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1957, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1987, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1958, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1928, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1930, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1932, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1934, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1936, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1954, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1972, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1955, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1956, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1979, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1957, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1985, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 poison, !1958, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1938, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1940, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1942, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1944, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1946, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor32 = xor i64 %Abi.0, %Agi.0, !dbg !1989
    #dbg_value(!DIArgList(i64 %xor32, i64 %Asi.0, i64 %Ami.0, i64 %Aki.0), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor33 = xor i64 %xor32, %Aki.0, !dbg !1991
    #dbg_value(!DIArgList(i64 %xor33, i64 %Asi.0, i64 %Ami.0), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor34 = xor i64 %xor33, %Ami.0, !dbg !1992
    #dbg_value(!DIArgList(i64 %xor34, i64 %Asi.0), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor35 = xor i64 %xor34, %Asi.0, !dbg !1993
    #dbg_value(i64 %xor35, !1956, !DIExpression(), !1896)
  %xor40 = xor i64 %Abu.0, %Agu.0, !dbg !1994
    #dbg_value(!DIArgList(i64 %xor40, i64 %Asu.0, i64 %Amu.0, i64 %Aku.0), !1958, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor41 = xor i64 %xor40, %Aku.0, !dbg !1995
    #dbg_value(!DIArgList(i64 %xor41, i64 %Asu.0, i64 %Amu.0), !1958, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor42 = xor i64 %xor41, %Amu.0, !dbg !1996
    #dbg_value(!DIArgList(i64 %xor42, i64 %Asu.0), !1958, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor43 = xor i64 %xor42, %Asu.0, !dbg !1997
    #dbg_value(i64 %xor43, !1958, !DIExpression(), !1896)
  %25 = shl i64 %xor43, 1, !dbg !1998
  %26 = lshr i64 %xor43, 63, !dbg !1998
  %27 = or i64 %25, %26, !dbg !1998
    #dbg_value(!DIArgList(i64 %Ago.0, i64 %xor35, i64 %27), !1914, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %xor35, i64 %27), !1904, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Ako.0, i64 %xor35, i64 %27), !1924, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Amo.0, i64 %xor35, i64 %27), !1934, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Aso.0, i64 %xor35, i64 %27), !1944, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor35, i64 %27), !1962, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor57 = xor i64 %xor35, %27, !dbg !1999
    #dbg_value(!DIArgList(i64 %Ago.0, i64 %xor57), !1914, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %xor57), !1904, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Ako.0, i64 %xor57), !1924, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Amo.0, i64 %xor57), !1934, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Aso.0, i64 %xor57), !1944, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 %xor57, !1962, !DIExpression(), !1896)
  %xor203 = xor i64 %Ago.0, %xor57, !dbg !2000
    #dbg_value(i64 %xor203, !1914, !DIExpression(), !1896)
  %28 = shl i64 %xor203, 55, !dbg !2001
  %29 = lshr i64 %xor203, 9, !dbg !2001
  %30 = or i64 %28, %29, !dbg !2001
    #dbg_value(i64 %30, !1955, !DIExpression(), !1896)
  %xor28 = xor i64 %Abe.0, %Age.0, !dbg !2002
    #dbg_value(!DIArgList(i64 %xor28, i64 %Ase.0, i64 %Ame.0, i64 %Ake.0), !1955, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor29 = xor i64 %xor28, %Ake.0, !dbg !2003
    #dbg_value(!DIArgList(i64 %xor29, i64 %Ase.0, i64 %Ame.0), !1955, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor30 = xor i64 %xor29, %Ame.0, !dbg !2004
    #dbg_value(!DIArgList(i64 %xor30, i64 %Ase.0), !1955, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor31 = xor i64 %xor30, %Ase.0, !dbg !2005
    #dbg_value(i64 %xor31, !1955, !DIExpression(), !1896)
  %31 = shl i64 %xor31, 1, !dbg !2006
  %32 = lshr i64 %xor31, 63, !dbg !2006
  %33 = or i64 %31, %32, !dbg !2006
    #dbg_value(!DIArgList(i64 %xor43, i64 %33), !1959, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor43, i64 %33), !1898, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor43, i64 %33), !1954, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Aka.0, i64 %xor43, i64 %33), !1918, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Aga.0, i64 %xor43, i64 %33), !1908, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Asa.0, i64 %xor43, i64 %33), !1938, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Ama.0, i64 %xor43, i64 %33), !1928, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor45 = xor i64 %xor43, %33, !dbg !2007
    #dbg_value(i64 %xor45, !1959, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor45), !1954, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor45), !1898, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Aka.0, i64 %xor45), !1918, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Aga.0, i64 %xor45), !1908, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Asa.0, i64 %xor45), !1938, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Ama.0, i64 %xor45), !1928, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor211 = xor i64 %Ama.0, %xor45, !dbg !2008
    #dbg_value(i64 %xor211, !1928, !DIExpression(), !1896)
  %34 = shl i64 %xor211, 41, !dbg !2009
  %35 = lshr i64 %xor211, 23, !dbg !2009
  %36 = or i64 %34, %35, !dbg !2009
    #dbg_value(i64 %36, !1957, !DIExpression(), !1896)
  %xor36 = xor i64 %Abo.0, %Ago.0, !dbg !2010
    #dbg_value(!DIArgList(i64 %xor36, i64 %Aso.0, i64 %Amo.0, i64 %Ako.0), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor37 = xor i64 %xor36, %Ako.0, !dbg !2011
    #dbg_value(!DIArgList(i64 %xor37, i64 %Aso.0, i64 %Amo.0), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor38 = xor i64 %xor37, %Amo.0, !dbg !2012
    #dbg_value(!DIArgList(i64 %xor38, i64 %Aso.0), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor39 = xor i64 %xor38, %Aso.0, !dbg !2013
    #dbg_value(i64 %xor39, !1957, !DIExpression(), !1896)
  %xor = xor i64 %Aba.0, %Aga.0, !dbg !2014
    #dbg_value(!DIArgList(i64 %xor, i64 %Asa.0, i64 %Ama.0, i64 %Aka.0), !1954, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor25 = xor i64 %xor, %Aka.0, !dbg !2015
    #dbg_value(!DIArgList(i64 %xor25, i64 %Asa.0, i64 %Ama.0), !1954, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor26 = xor i64 %xor25, %Ama.0, !dbg !2016
    #dbg_value(!DIArgList(i64 %xor26, i64 %Asa.0), !1954, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor27 = xor i64 %xor26, %Asa.0, !dbg !2017
    #dbg_value(i64 %xor27, !1954, !DIExpression(), !1896)
  %37 = shl i64 %xor27, 1, !dbg !2018
  %38 = lshr i64 %xor27, 63, !dbg !2018
  %39 = or i64 %37, %38, !dbg !2018
    #dbg_value(!DIArgList(i64 %Agu.0, i64 %xor39, i64 %39), !1916, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %xor39, i64 %39), !1906, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Asu.0, i64 %xor39, i64 %39), !1946, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Amu.0, i64 %xor39, i64 %39), !1936, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor39, i64 %39), !1963, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Aku.0, i64 %xor39, i64 %39), !1926, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor61 = xor i64 %xor39, %39, !dbg !2019
    #dbg_value(!DIArgList(i64 %Agu.0, i64 %xor61), !1916, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %xor61), !1906, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Asu.0, i64 %xor61), !1946, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Amu.0, i64 %xor61), !1936, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 %xor61, !1963, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 %Aku.0, i64 %xor61), !1926, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor207 = xor i64 %Aku.0, %xor61, !dbg !2020
    #dbg_value(i64 %xor207, !1926, !DIExpression(), !1896)
  %40 = shl i64 %xor207, 39, !dbg !2021
  %41 = lshr i64 %xor207, 25, !dbg !2021
  %42 = or i64 %40, %41, !dbg !2021
    #dbg_value(i64 %42, !1956, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 %30, i64 %36, i64 %42), !1985, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %not222 = xor i64 %42, -1, !dbg !2022
    #dbg_value(!DIArgList(i64 %30, i64 %36, i64 %not222), !1985, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %and223 = and i64 %36, %not222, !dbg !2023
    #dbg_value(!DIArgList(i64 %30, i64 %and223), !1985, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor224 = xor i64 %30, %and223, !dbg !2024
    #dbg_value(i64 %xor224, !1985, !DIExpression(), !1896)
  %43 = shl i64 %xor39, 1, !dbg !2025
  %44 = lshr i64 %xor39, 63, !dbg !2025
  %45 = or i64 %43, %44, !dbg !2025
    #dbg_value(!DIArgList(i64 %xor31, i64 %45), !1961, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Aki.0, i64 %xor31, i64 %45), !1922, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Agi.0, i64 %xor31, i64 %45), !1912, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %xor31, i64 %45), !1902, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Asi.0, i64 %xor31, i64 %45), !1942, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Ami.0, i64 %xor31, i64 %45), !1932, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor53 = xor i64 %xor31, %45, !dbg !2026
    #dbg_value(i64 %xor53, !1961, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 %Aki.0, i64 %xor53), !1922, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Agi.0, i64 %xor53), !1912, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %xor53), !1902, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Asi.0, i64 %xor53), !1942, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Ami.0, i64 %xor53), !1932, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor67 = xor i64 %Aki.0, %xor53, !dbg !2027
    #dbg_value(i64 %xor67, !1922, !DIExpression(), !1896)
  %46 = shl i64 %xor67, 43, !dbg !2028
  %47 = lshr i64 %xor67, 21, !dbg !2028
  %48 = or i64 %46, %47, !dbg !2028
    #dbg_value(i64 %48, !1956, !DIExpression(), !1896)
  %49 = shl i64 %xor35, 1, !dbg !2029
  %50 = lshr i64 %xor35, 63, !dbg !2029
  %51 = or i64 %49, %50, !dbg !2029
    #dbg_value(!DIArgList(i64 %xor27, i64 %51), !1960, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Age.0, i64 %xor27, i64 %51), !1910, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %xor27, i64 %51), !1900, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Ake.0, i64 %xor27, i64 %51), !1920, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Ame.0, i64 %xor27, i64 %51), !1930, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Ase.0, i64 %xor27, i64 %51), !1940, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor49 = xor i64 %xor27, %51, !dbg !2030
    #dbg_value(i64 %xor49, !1960, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 %Age.0, i64 %xor49), !1910, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %xor49), !1900, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Ake.0, i64 %xor49), !1920, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Ame.0, i64 %xor49), !1930, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %Ase.0, i64 %xor49), !1940, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor63 = xor i64 %Age.0, %xor49, !dbg !2031
    #dbg_value(i64 %xor63, !1910, !DIExpression(), !1896)
  %52 = shl i64 %xor63, 44, !dbg !2032
  %53 = lshr i64 %xor63, 20, !dbg !2032
  %54 = or i64 %52, %53, !dbg !2032
    #dbg_value(i64 %54, !1955, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %48, i64 %xor45, i64 %54), !1964, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %not = xor i64 %54, -1, !dbg !2033
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %48, i64 %xor45, i64 %not), !1964, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %and = and i64 %48, %not, !dbg !2034
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %and, i64 %xor45), !1964, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %arrayidx80 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %round.0, !dbg !2035
  %55 = load i64, ptr %arrayidx80, align 8, !dbg !2035
    #dbg_value(!DIArgList(i64 %and, i64 %Aba.0, i64 %xor45, i64 %55), !1964, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
  %56 = xor i64 %and, %55, !dbg !2036
    #dbg_value(!DIArgList(i64 %56, i64 %Aba.0, i64 %xor45), !1964, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor62 = xor i64 %Aba.0, %xor45, !dbg !2037
    #dbg_value(i64 %xor62, !1898, !DIExpression(), !1896)
    #dbg_value(i64 %xor62, !1954, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 %56, i64 %xor62), !1964, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor81 = xor i64 %56, %xor62, !dbg !2036
    #dbg_value(i64 %xor81, !1964, !DIExpression(), !1896)
  %xor94 = xor i64 %Abo.0, %xor57, !dbg !2038
    #dbg_value(i64 %xor94, !1904, !DIExpression(), !1896)
  %57 = shl i64 %xor94, 28, !dbg !2039
  %58 = lshr i64 %xor94, 36, !dbg !2039
  %59 = or i64 %57, %58, !dbg !2039
    #dbg_value(i64 %59, !1954, !DIExpression(), !1896)
  %xor102 = xor i64 %Aka.0, %xor45, !dbg !2040
    #dbg_value(i64 %xor102, !1918, !DIExpression(), !1896)
  %60 = shl i64 %xor102, 3, !dbg !2041
  %61 = lshr i64 %xor102, 61, !dbg !2041
  %62 = or i64 %60, %61, !dbg !2041
    #dbg_value(i64 %62, !1956, !DIExpression(), !1896)
  %xor98 = xor i64 %Agu.0, %xor61, !dbg !2042
    #dbg_value(i64 %xor98, !1916, !DIExpression(), !1896)
  %63 = shl i64 %xor98, 20, !dbg !2043
  %64 = lshr i64 %xor98, 44, !dbg !2043
  %65 = or i64 %63, %64, !dbg !2043
    #dbg_value(i64 %65, !1955, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 %59, i64 %62, i64 %65), !1969, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %not114 = xor i64 %65, -1, !dbg !2044
    #dbg_value(!DIArgList(i64 %59, i64 %62, i64 %not114), !1969, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %and115 = and i64 %62, %not114, !dbg !2045
    #dbg_value(!DIArgList(i64 %59, i64 %and115), !1969, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor116 = xor i64 %59, %and115, !dbg !2046
    #dbg_value(i64 %xor116, !1969, !DIExpression(), !1896)
  %xor234 = xor i64 %xor81, %xor116, !dbg !2047
  %xor129 = xor i64 %Abe.0, %xor49, !dbg !2048
    #dbg_value(i64 %xor129, !1900, !DIExpression(), !1896)
  %66 = shl i64 %xor129, 1, !dbg !2049
  %67 = lshr i64 %xor129, 63, !dbg !2049
  %68 = or i64 %66, %67, !dbg !2049
    #dbg_value(i64 %68, !1954, !DIExpression(), !1896)
  %xor137 = xor i64 %Ako.0, %xor57, !dbg !2050
    #dbg_value(i64 %xor137, !1924, !DIExpression(), !1896)
  %69 = shl i64 %xor137, 25, !dbg !2051
  %70 = lshr i64 %xor137, 39, !dbg !2051
  %71 = or i64 %69, %70, !dbg !2051
    #dbg_value(i64 %71, !1956, !DIExpression(), !1896)
  %xor133 = xor i64 %Agi.0, %xor53, !dbg !2052
    #dbg_value(i64 %xor133, !1912, !DIExpression(), !1896)
  %72 = shl i64 %xor133, 6, !dbg !2053
  %73 = lshr i64 %xor133, 58, !dbg !2053
  %74 = or i64 %72, %73, !dbg !2053
    #dbg_value(i64 %74, !1955, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 %68, i64 %71, i64 %74), !1974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %not149 = xor i64 %74, -1, !dbg !2054
    #dbg_value(!DIArgList(i64 %68, i64 %71, i64 %not149), !1974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %and150 = and i64 %71, %not149, !dbg !2055
    #dbg_value(!DIArgList(i64 %68, i64 %and150), !1974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor151 = xor i64 %68, %and150, !dbg !2056
    #dbg_value(i64 %xor151, !1974, !DIExpression(), !1896)
  %xor235 = xor i64 %xor234, %xor151, !dbg !2057
  %xor164 = xor i64 %Abu.0, %xor61, !dbg !2058
    #dbg_value(i64 %xor164, !1906, !DIExpression(), !1896)
  %75 = shl i64 %xor164, 27, !dbg !2059
  %76 = lshr i64 %xor164, 37, !dbg !2059
  %77 = or i64 %75, %76, !dbg !2059
    #dbg_value(i64 %77, !1954, !DIExpression(), !1896)
  %xor172 = xor i64 %Ake.0, %xor49, !dbg !2060
    #dbg_value(i64 %xor172, !1920, !DIExpression(), !1896)
  %78 = shl i64 %xor172, 10, !dbg !2061
  %79 = lshr i64 %xor172, 54, !dbg !2061
  %80 = or i64 %78, %79, !dbg !2061
    #dbg_value(i64 %80, !1956, !DIExpression(), !1896)
  %xor168 = xor i64 %Aga.0, %xor45, !dbg !2062
    #dbg_value(i64 %xor168, !1908, !DIExpression(), !1896)
  %81 = shl i64 %xor168, 36, !dbg !2063
  %82 = lshr i64 %xor168, 28, !dbg !2063
  %83 = or i64 %81, %82, !dbg !2063
    #dbg_value(i64 %83, !1955, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 %77, i64 %80, i64 %83), !1979, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %not184 = xor i64 %83, -1, !dbg !2064
    #dbg_value(!DIArgList(i64 %77, i64 %80, i64 %not184), !1979, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %and185 = and i64 %80, %not184, !dbg !2065
    #dbg_value(!DIArgList(i64 %77, i64 %and185), !1979, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor186 = xor i64 %77, %and185, !dbg !2066
    #dbg_value(i64 %xor186, !1979, !DIExpression(), !1896)
  %xor236 = xor i64 %xor235, %xor186, !dbg !2067
  %xor199 = xor i64 %Abi.0, %xor53, !dbg !2068
    #dbg_value(i64 %xor199, !1902, !DIExpression(), !1896)
  %84 = shl i64 %xor199, 62, !dbg !2069
  %85 = lshr i64 %xor199, 2, !dbg !2069
  %86 = or i64 %84, %85, !dbg !2069
    #dbg_value(!DIArgList(i64 %86, i64 %42, i64 %30), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor236, i64 %86, i64 %42, i64 %30), !1954, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
  %not219 = xor i64 %30, -1, !dbg !2070
    #dbg_value(!DIArgList(i64 %86, i64 %42, i64 %not219), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor236, i64 %86, i64 %42, i64 %not219), !1954, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
  %and220 = and i64 %42, %not219, !dbg !2071
    #dbg_value(!DIArgList(i64 %86, i64 %and220), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor236, i64 %86, i64 %and220), !1954, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor221 = xor i64 %86, %and220, !dbg !2072
    #dbg_value(i64 %xor221, !1984, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor221), !1954, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor237 = xor i64 %xor236, %xor221, !dbg !2073
    #dbg_value(i64 %xor237, !1954, !DIExpression(), !1896)
  %xor75 = xor i64 %Asu.0, %xor61, !dbg !2074
    #dbg_value(i64 %xor75, !1946, !DIExpression(), !1896)
  %87 = shl i64 %xor75, 14, !dbg !2075
  %88 = lshr i64 %xor75, 50, !dbg !2075
  %89 = or i64 %87, %88, !dbg !2075
    #dbg_value(i64 %89, !1958, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 %89, i64 %54, i64 %xor62), !1968, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor71 = xor i64 %Amo.0, %xor57, !dbg !2076
    #dbg_value(i64 %xor71, !1934, !DIExpression(), !1896)
  %90 = shl i64 %xor71, 21, !dbg !2077
  %91 = lshr i64 %xor71, 43, !dbg !2077
  %92 = or i64 %90, %91, !dbg !2077
    #dbg_value(i64 %92, !1957, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 %48, i64 %89, i64 %92), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %54, i64 %92, i64 %48), !1965, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %92, i64 %xor62, i64 %89), !1967, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %not85 = xor i64 %92, -1, !dbg !2078
    #dbg_value(!DIArgList(i64 %48, i64 %89, i64 %not85), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %and86 = and i64 %89, %not85, !dbg !2079
    #dbg_value(!DIArgList(i64 %48, i64 %and86), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor87 = xor i64 %48, %and86, !dbg !2080
    #dbg_value(i64 %xor87, !1966, !DIExpression(), !1896)
  %xor110 = xor i64 %Asi.0, %xor53, !dbg !2081
    #dbg_value(i64 %xor110, !1942, !DIExpression(), !1896)
  %93 = shl i64 %xor110, 61, !dbg !2082
  %94 = lshr i64 %xor110, 3, !dbg !2082
  %95 = or i64 %93, %94, !dbg !2082
    #dbg_value(i64 %95, !1958, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 %95, i64 %65, i64 %59), !1973, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor106 = xor i64 %Ame.0, %xor49, !dbg !2083
    #dbg_value(i64 %xor106, !1930, !DIExpression(), !1896)
  %96 = shl i64 %xor106, 45, !dbg !2084
  %97 = lshr i64 %xor106, 19, !dbg !2084
  %98 = or i64 %96, %97, !dbg !2084
    #dbg_value(i64 %98, !1957, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 %62, i64 %95, i64 %98), !1971, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %98, i64 %59, i64 %95), !1972, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %65, i64 %98, i64 %62), !1970, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %not120 = xor i64 %98, -1, !dbg !2085
    #dbg_value(!DIArgList(i64 %62, i64 %95, i64 %not120), !1971, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %and121 = and i64 %95, %not120, !dbg !2086
    #dbg_value(!DIArgList(i64 %62, i64 %and121), !1971, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor122 = xor i64 %62, %and121, !dbg !2087
    #dbg_value(i64 %xor122, !1971, !DIExpression(), !1896)
  %xor242 = xor i64 %xor87, %xor122, !dbg !2088
  %xor145 = xor i64 %Asa.0, %xor45, !dbg !2089
    #dbg_value(i64 %xor145, !1938, !DIExpression(), !1896)
  %99 = shl i64 %xor145, 18, !dbg !2090
  %100 = lshr i64 %xor145, 46, !dbg !2090
  %101 = or i64 %99, %100, !dbg !2090
    #dbg_value(i64 %101, !1958, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 %101, i64 %74, i64 %68), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor141 = xor i64 %Amu.0, %xor61, !dbg !2091
    #dbg_value(i64 %xor141, !1936, !DIExpression(), !1896)
  %102 = shl i64 %xor141, 8, !dbg !2092
  %103 = lshr i64 %xor141, 56, !dbg !2092
  %104 = or i64 %102, %103, !dbg !2092
    #dbg_value(i64 %104, !1957, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 %71, i64 %101, i64 %104), !1976, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %74, i64 %104, i64 %71), !1975, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %104, i64 %68, i64 %101), !1977, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %not155 = xor i64 %104, -1, !dbg !2093
    #dbg_value(!DIArgList(i64 %71, i64 %101, i64 %not155), !1976, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %and156 = and i64 %101, %not155, !dbg !2094
    #dbg_value(!DIArgList(i64 %71, i64 %and156), !1976, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor157 = xor i64 %71, %and156, !dbg !2095
    #dbg_value(i64 %xor157, !1976, !DIExpression(), !1896)
  %xor243 = xor i64 %xor242, %xor157, !dbg !2096
  %xor180 = xor i64 %Aso.0, %xor57, !dbg !2097
    #dbg_value(i64 %xor180, !1944, !DIExpression(), !1896)
  %105 = shl i64 %xor180, 56, !dbg !2098
  %106 = lshr i64 %xor180, 8, !dbg !2098
  %107 = or i64 %105, %106, !dbg !2098
    #dbg_value(i64 %107, !1958, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 %107, i64 %83, i64 %77), !1983, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor176 = xor i64 %Ami.0, %xor53, !dbg !2099
    #dbg_value(i64 %xor176, !1932, !DIExpression(), !1896)
  %108 = shl i64 %xor176, 15, !dbg !2100
  %109 = lshr i64 %xor176, 49, !dbg !2100
  %110 = or i64 %108, %109, !dbg !2100
    #dbg_value(i64 %110, !1957, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 %80, i64 %107, i64 %110), !1981, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %83, i64 %110, i64 %80), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %110, i64 %77, i64 %107), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %54, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71, i64 %65, i64 %98, i64 %62, i64 %92, i64 %48), !1955, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %not190 = xor i64 %110, -1, !dbg !2101
    #dbg_value(!DIArgList(i64 %80, i64 %107, i64 %not190), !1981, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %and191 = and i64 %107, %not190, !dbg !2102
    #dbg_value(!DIArgList(i64 %80, i64 %and191), !1981, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor192 = xor i64 %80, %and191, !dbg !2103
    #dbg_value(i64 %xor192, !1981, !DIExpression(), !1896)
  %xor244 = xor i64 %xor243, %xor192, !dbg !2104
  %xor215 = xor i64 %Ase.0, %xor49, !dbg !2105
    #dbg_value(i64 %xor215, !1940, !DIExpression(), !1896)
  %111 = shl i64 %xor215, 2, !dbg !2106
  %112 = lshr i64 %xor215, 62, !dbg !2106
  %113 = or i64 %111, %112, !dbg !2106
    #dbg_value(!DIArgList(i64 %42, i64 %113, i64 %36), !1986, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %113, i64 %30, i64 %86), !1988, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %36, i64 %86, i64 %113), !1987, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor244, i64 %42, i64 %113, i64 %36), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %92, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101, i64 %98, i64 %xor62, i64 %89, i64 %59, i64 %95), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %89, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68, i64 %95, i64 %65, i64 %59, i64 %54, i64 %xor62), !1958, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
  %not225 = xor i64 %36, -1, !dbg !2107
    #dbg_value(!DIArgList(i64 %42, i64 %113, i64 %not225), !1986, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor244, i64 %42, i64 %113, i64 %not225), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
  %and226 = and i64 %113, %not225, !dbg !2108
    #dbg_value(!DIArgList(i64 %42, i64 %and226), !1986, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor244, i64 %42, i64 %and226), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor227 = xor i64 %42, %and226, !dbg !2109
    #dbg_value(i64 %xor227, !1986, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor227), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor245 = xor i64 %xor244, %xor227, !dbg !2110
    #dbg_value(i64 %xor245, !1956, !DIExpression(), !1896)
  %114 = shl i64 %xor245, 1, !dbg !2111
  %115 = lshr i64 %xor245, 63, !dbg !2111
  %116 = or i64 %114, %115, !dbg !2111
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor237, i64 %116), !1985, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %54, i64 %xor237, i64 %92, i64 %48, i64 %116), !1965, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %65, i64 %xor237, i64 %98, i64 %62, i64 %116), !1970, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %74, i64 %xor237, i64 %104, i64 %71, i64 %116), !1975, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %83, i64 %xor237, i64 %110, i64 %80, i64 %116), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor237, i64 %116), !1960, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor261 = xor i64 %xor237, %116, !dbg !2112
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor261), !1985, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %54, i64 %xor261, i64 %92, i64 %48), !1965, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %65, i64 %xor261, i64 %98, i64 %62), !1970, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %74, i64 %xor261, i64 %104, i64 %71), !1975, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %83, i64 %xor261, i64 %110, i64 %80), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 %xor261, !1960, !DIExpression(), !1896)
  %xor429 = xor i64 %xor224, %xor261, !dbg !2113
    #dbg_value(i64 %xor429, !1985, !DIExpression(), !1896)
  %117 = shl i64 %xor429, 2, !dbg !2114
  %118 = lshr i64 %xor429, 62, !dbg !2114
  %119 = or i64 %117, %118, !dbg !2114
    #dbg_value(i64 %119, !1958, !DIExpression(), !1896)
  %not123 = xor i64 %95, -1, !dbg !2115
    #dbg_value(!DIArgList(i64 %98, i64 %59, i64 %not123), !1972, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %92, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101, i64 %98, i64 %xor62, i64 %89, i64 %59, i64 %not123), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
  %and124 = and i64 %59, %not123, !dbg !2116
    #dbg_value(!DIArgList(i64 %98, i64 %and124), !1972, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %92, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101, i64 %98, i64 %xor62, i64 %89, i64 %and124), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor125 = xor i64 %98, %and124, !dbg !2117
    #dbg_value(i64 %xor125, !1972, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 %92, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101, i64 %xor125, i64 %xor62, i64 %89), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
  %not91 = xor i64 %xor62, -1, !dbg !2118
    #dbg_value(!DIArgList(i64 %89, i64 %54, i64 %not91), !1968, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %89, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68, i64 %95, i64 %65, i64 %59, i64 %54, i64 %not91), !1958, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
  %and92 = and i64 %54, %not91, !dbg !2119
    #dbg_value(!DIArgList(i64 %89, i64 %and92), !1968, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %89, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68, i64 %95, i64 %65, i64 %59, i64 %and92), !1958, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor93 = xor i64 %89, %and92, !dbg !2120
    #dbg_value(i64 %xor93, !1968, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 %xor93, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68, i64 %95, i64 %65, i64 %59), !1958, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
  %not126 = xor i64 %59, -1, !dbg !2121
    #dbg_value(!DIArgList(i64 %95, i64 %65, i64 %not126), !1973, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor93, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68, i64 %95, i64 %65, i64 %not126), !1958, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
  %and127 = and i64 %65, %not126, !dbg !2122
    #dbg_value(!DIArgList(i64 %95, i64 %and127), !1973, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor93, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68, i64 %95, i64 %and127), !1958, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor128 = xor i64 %95, %and127, !dbg !2123
    #dbg_value(i64 %xor128, !1973, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 %xor93, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68, i64 %xor128), !1958, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor250 = xor i64 %xor93, %xor128, !dbg !2124
    #dbg_value(!DIArgList(i64 %xor250, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68), !1958, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
  %not161 = xor i64 %68, -1, !dbg !2125
    #dbg_value(!DIArgList(i64 %101, i64 %74, i64 %not161), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor250, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %not161), !1958, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
  %and162 = and i64 %74, %not161, !dbg !2126
    #dbg_value(!DIArgList(i64 %101, i64 %and162), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor250, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %and162), !1958, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor163 = xor i64 %101, %and162, !dbg !2127
    #dbg_value(i64 %xor163, !1978, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 %xor250, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %xor163), !1958, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor251 = xor i64 %xor250, %xor163, !dbg !2128
    #dbg_value(!DIArgList(i64 %xor251, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77), !1958, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
  %not196 = xor i64 %77, -1, !dbg !2129
    #dbg_value(!DIArgList(i64 %107, i64 %83, i64 %not196), !1983, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor251, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %not196), !1958, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
  %and197 = and i64 %83, %not196, !dbg !2130
    #dbg_value(!DIArgList(i64 %107, i64 %and197), !1983, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor251, i64 %113, i64 %30, i64 %86, i64 %107, i64 %and197), !1958, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor198 = xor i64 %107, %and197, !dbg !2131
    #dbg_value(i64 %xor198, !1983, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 %xor251, i64 %113, i64 %30, i64 %86, i64 %xor198), !1958, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor252 = xor i64 %xor251, %xor198, !dbg !2132
    #dbg_value(!DIArgList(i64 %xor252, i64 %113, i64 %30, i64 %86), !1958, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
  %not231 = xor i64 %86, -1, !dbg !2133
    #dbg_value(!DIArgList(i64 %113, i64 %30, i64 %not231), !1988, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor252, i64 %113, i64 %30, i64 %not231), !1958, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
  %and232 = and i64 %30, %not231, !dbg !2134
    #dbg_value(!DIArgList(i64 %113, i64 %and232), !1988, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor252, i64 %113, i64 %and232), !1958, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor233 = xor i64 %113, %and232, !dbg !2135
    #dbg_value(i64 %xor233, !1988, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor233), !1958, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor253 = xor i64 %xor252, %xor233, !dbg !2136
    #dbg_value(i64 %xor253, !1958, !DIExpression(), !1896)
  %120 = shl i64 %xor253, 1, !dbg !2137
  %121 = lshr i64 %xor253, 63, !dbg !2137
  %122 = or i64 %120, %121, !dbg !2137
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor245, i64 %122), !1972, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %92, i64 %xor245, i64 %xor62, i64 %89, i64 %122), !1967, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %104, i64 %xor245, i64 %68, i64 %101, i64 %122), !1977, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %110, i64 %xor245, i64 %77, i64 %107, i64 %122), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %36, i64 %xor245, i64 %86, i64 %113, i64 %122), !1987, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor245, i64 %122), !1962, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor269 = xor i64 %xor245, %122, !dbg !2138
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor269), !1972, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %92, i64 %xor269, i64 %xor62, i64 %89), !1967, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %104, i64 %xor269, i64 %68, i64 %101), !1977, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %110, i64 %xor269, i64 %77, i64 %107), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %36, i64 %xor269, i64 %86, i64 %113), !1987, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 %xor269, !1962, !DIExpression(), !1896)
  %xor417 = xor i64 %xor125, %xor269, !dbg !2139
    #dbg_value(i64 %xor417, !1972, !DIExpression(), !1896)
  %123 = shl i64 %xor417, 55, !dbg !2140
  %124 = lshr i64 %xor417, 9, !dbg !2140
  %125 = or i64 %123, %124, !dbg !2140
    #dbg_value(i64 %125, !1955, !DIExpression(), !1896)
  %not82 = xor i64 %48, -1, !dbg !2141
    #dbg_value(!DIArgList(i64 %54, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71, i64 %65, i64 %98, i64 %62, i64 %92, i64 %not82), !1955, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %54, i64 %xor261, i64 %92, i64 %not82), !1965, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %and83 = and i64 %92, %not82, !dbg !2142
    #dbg_value(!DIArgList(i64 %54, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71, i64 %65, i64 %98, i64 %62, i64 %and83), !1955, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %54, i64 %xor261, i64 %and83), !1965, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor84 = xor i64 %54, %and83, !dbg !2143
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71, i64 %65, i64 %98, i64 %62), !1955, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor261), !1965, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %not117 = xor i64 %62, -1, !dbg !2144
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71, i64 %65, i64 %98, i64 %not117), !1955, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %65, i64 %xor261, i64 %98, i64 %not117), !1970, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %and118 = and i64 %98, %not117, !dbg !2145
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71, i64 %65, i64 %and118), !1955, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %65, i64 %xor261, i64 %and118), !1970, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor119 = xor i64 %65, %and118, !dbg !2146
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71, i64 %xor119), !1955, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor119, i64 %xor261), !1970, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor238 = xor i64 %xor84, %xor119, !dbg !2147
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71), !1955, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %not152 = xor i64 %71, -1, !dbg !2148
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %not152), !1955, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %74, i64 %xor261, i64 %104, i64 %not152), !1975, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %and153 = and i64 %104, %not152, !dbg !2149
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %and153), !1955, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %74, i64 %xor261, i64 %and153), !1975, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor154 = xor i64 %74, %and153, !dbg !2150
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %xor154), !1955, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor154, i64 %xor261), !1975, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor239 = xor i64 %xor238, %xor154, !dbg !2151
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %83, i64 %110, i64 %80), !1955, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %not187 = xor i64 %80, -1, !dbg !2152
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %83, i64 %110, i64 %not187), !1955, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %83, i64 %xor261, i64 %110, i64 %not187), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %and188 = and i64 %110, %not187, !dbg !2153
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %83, i64 %and188), !1955, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %83, i64 %xor261, i64 %and188), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor189 = xor i64 %83, %and188, !dbg !2154
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor189), !1955, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor189, i64 %xor261), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor240 = xor i64 %xor239, %xor189, !dbg !2155
    #dbg_value(!DIArgList(i64 %xor240, i64 %xor224), !1955, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor241 = xor i64 %xor240, %xor224, !dbg !2156
    #dbg_value(i64 %xor241, !1955, !DIExpression(), !1896)
  %not88 = xor i64 %89, -1, !dbg !2157
    #dbg_value(!DIArgList(i64 %92, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101, i64 %xor125, i64 %xor62, i64 %not88), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %92, i64 %xor269, i64 %xor62, i64 %not88), !1967, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %and89 = and i64 %xor62, %not88, !dbg !2158
    #dbg_value(!DIArgList(i64 %92, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101, i64 %xor125, i64 %and89), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %92, i64 %xor269, i64 %and89), !1967, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor90 = xor i64 %92, %and89, !dbg !2159
    #dbg_value(!DIArgList(i64 %xor90, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101, i64 %xor125), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor90, i64 %xor269), !1967, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor246 = xor i64 %xor90, %xor125, !dbg !2160
    #dbg_value(!DIArgList(i64 %xor246, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
  %not158 = xor i64 %101, -1, !dbg !2161
    #dbg_value(!DIArgList(i64 %xor246, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %not158), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %104, i64 %xor269, i64 %68, i64 %not158), !1977, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %and159 = and i64 %68, %not158, !dbg !2162
    #dbg_value(!DIArgList(i64 %xor246, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %and159), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %104, i64 %xor269, i64 %and159), !1977, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor160 = xor i64 %104, %and159, !dbg !2163
    #dbg_value(!DIArgList(i64 %xor246, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %xor160), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor160, i64 %xor269), !1977, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor247 = xor i64 %xor246, %xor160, !dbg !2164
    #dbg_value(!DIArgList(i64 %xor247, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
  %not193 = xor i64 %107, -1, !dbg !2165
    #dbg_value(!DIArgList(i64 %xor247, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %not193), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %110, i64 %xor269, i64 %77, i64 %not193), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %and194 = and i64 %77, %not193, !dbg !2166
    #dbg_value(!DIArgList(i64 %xor247, i64 %36, i64 %86, i64 %113, i64 %110, i64 %and194), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %110, i64 %xor269, i64 %and194), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor195 = xor i64 %110, %and194, !dbg !2167
    #dbg_value(!DIArgList(i64 %xor247, i64 %36, i64 %86, i64 %113, i64 %xor195), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor195, i64 %xor269), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor248 = xor i64 %xor247, %xor195, !dbg !2168
    #dbg_value(!DIArgList(i64 %xor248, i64 %36, i64 %86, i64 %113), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
  %not228 = xor i64 %113, -1, !dbg !2169
    #dbg_value(!DIArgList(i64 %xor248, i64 %36, i64 %86, i64 %not228), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %36, i64 %xor269, i64 %86, i64 %not228), !1987, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %and229 = and i64 %86, %not228, !dbg !2170
    #dbg_value(!DIArgList(i64 %xor248, i64 %36, i64 %and229), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %36, i64 %xor269, i64 %and229), !1987, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor230 = xor i64 %36, %and229, !dbg !2171
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor230), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor230, i64 %xor269), !1987, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor249 = xor i64 %xor248, %xor230, !dbg !2172
    #dbg_value(i64 %xor249, !1957, !DIExpression(), !1896)
  %126 = shl i64 %xor249, 1, !dbg !2173
  %127 = lshr i64 %xor249, 63, !dbg !2173
  %128 = or i64 %126, %127, !dbg !2173
    #dbg_value(!DIArgList(i64 %xor241, i64 %128), !1961, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor241, i64 %128), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor241, i64 %128), !1981, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor241, i64 %128), !1971, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor241, i64 %128), !1986, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor241, i64 %128), !1976, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor265 = xor i64 %xor241, %128, !dbg !2174
    #dbg_value(i64 %xor265, !1961, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor265), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor265), !1981, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor265), !1971, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor265), !1986, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor265), !1976, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor413 = xor i64 %xor87, %xor265, !dbg !2175
    #dbg_value(i64 %xor413, !1966, !DIExpression(), !1896)
  %129 = shl i64 %xor413, 62, !dbg !2176
  %130 = lshr i64 %xor413, 2, !dbg !2176
  %131 = or i64 %129, %130, !dbg !2176
    #dbg_value(i64 %131, !1954, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 %119, i64 %125, i64 %131), !1946, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %not445 = xor i64 %131, -1, !dbg !2177
    #dbg_value(!DIArgList(i64 %119, i64 %125, i64 %not445), !1946, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %and446 = and i64 %125, %not445, !dbg !2178
    #dbg_value(!DIArgList(i64 %119, i64 %and446), !1946, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor447 = xor i64 %119, %and446, !dbg !2179
    #dbg_value(i64 %xor447, !1946, !DIExpression(), !1896)
  %132 = shl i64 %xor241, 1, !dbg !2180
  %133 = lshr i64 %xor241, 63, !dbg !2180
  %134 = or i64 %132, %133, !dbg !2180
    #dbg_value(!DIArgList(i64 %xor253, i64 %134), !1959, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor253, i64 %134), !1969, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor253, i64 %134), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor253, i64 %134), !1974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %134), !1964, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %134), !1954, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor253, i64 %134), !1979, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor257 = xor i64 %xor253, %134, !dbg !2181
    #dbg_value(i64 %xor257, !1959, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor257), !1969, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor257), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor257), !1974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !1954, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !1964, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor257), !1979, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor425 = xor i64 %xor186, %xor257, !dbg !2182
    #dbg_value(i64 %xor425, !1979, !DIExpression(), !1896)
  %135 = shl i64 %xor425, 41, !dbg !2183
  %136 = lshr i64 %xor425, 23, !dbg !2183
  %137 = or i64 %135, %136, !dbg !2183
    #dbg_value(i64 %137, !1957, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 %137, i64 %131, i64 %119), !1944, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %not442 = xor i64 %119, -1, !dbg !2184
    #dbg_value(!DIArgList(i64 %137, i64 %131, i64 %not442), !1944, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %and443 = and i64 %131, %not442, !dbg !2185
    #dbg_value(!DIArgList(i64 %137, i64 %and443), !1944, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor444 = xor i64 %137, %and443, !dbg !2186
    #dbg_value(i64 %xor444, !1944, !DIExpression(), !1896)
  %138 = shl i64 %xor237, 1, !dbg !2187
  %139 = lshr i64 %xor237, 63, !dbg !2187
  %140 = or i64 %138, %139, !dbg !2187
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor249, i64 %140), !1968, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor249, i64 %140), !1983, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor249, i64 %140), !1973, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor249, i64 %140), !1988, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor249, i64 %140), !1963, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor249, i64 %140), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor273 = xor i64 %xor249, %140, !dbg !2188
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor273), !1968, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor273), !1983, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor273), !1973, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor273), !1988, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(i64 %xor273, !1963, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor273), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor421 = xor i64 %xor163, %xor273, !dbg !2189
    #dbg_value(i64 %xor421, !1978, !DIExpression(), !1896)
  %141 = shl i64 %xor421, 39, !dbg !2190
  %142 = lshr i64 %xor421, 25, !dbg !2190
  %143 = or i64 %141, %142, !dbg !2190
    #dbg_value(i64 %143, !1956, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 %143, i64 %119, i64 %137), !1942, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %125, i64 %137, i64 %143), !1940, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %131, i64 %143, i64 %125), !1938, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %not439 = xor i64 %137, -1, !dbg !2191
    #dbg_value(!DIArgList(i64 %143, i64 %119, i64 %not439), !1942, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %and440 = and i64 %119, %not439, !dbg !2192
    #dbg_value(!DIArgList(i64 %143, i64 %and440), !1942, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor441 = xor i64 %143, %and440, !dbg !2193
    #dbg_value(i64 %xor441, !1942, !DIExpression(), !1896)
  %not436 = xor i64 %143, -1, !dbg !2194
    #dbg_value(!DIArgList(i64 %125, i64 %137, i64 %not436), !1940, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %and437 = and i64 %137, %not436, !dbg !2195
    #dbg_value(!DIArgList(i64 %125, i64 %and437), !1940, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor438 = xor i64 %125, %and437, !dbg !2196
    #dbg_value(i64 %xor438, !1940, !DIExpression(), !1896)
  %not433 = xor i64 %125, -1, !dbg !2197
    #dbg_value(!DIArgList(i64 %131, i64 %143, i64 %not433), !1938, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %and434 = and i64 %143, %not433, !dbg !2198
    #dbg_value(!DIArgList(i64 %131, i64 %and434), !1938, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor435 = xor i64 %131, %and434, !dbg !2199
    #dbg_value(i64 %xor435, !1938, !DIExpression(), !1896)
  %xor394 = xor i64 %xor230, %xor269, !dbg !2200
    #dbg_value(i64 %xor394, !1987, !DIExpression(), !1896)
  %144 = shl i64 %xor394, 56, !dbg !2201
  %145 = lshr i64 %xor394, 8, !dbg !2201
  %146 = or i64 %144, %145, !dbg !2201
    #dbg_value(i64 %146, !1958, !DIExpression(), !1896)
  %xor382 = xor i64 %xor116, %xor257, !dbg !2202
    #dbg_value(i64 %xor382, !1969, !DIExpression(), !1896)
  %147 = shl i64 %xor382, 36, !dbg !2203
  %148 = lshr i64 %xor382, 28, !dbg !2203
  %149 = or i64 %147, %148, !dbg !2203
    #dbg_value(i64 %149, !1955, !DIExpression(), !1896)
  %xor378 = xor i64 %xor93, %xor273, !dbg !2204
    #dbg_value(i64 %xor378, !1968, !DIExpression(), !1896)
  %150 = shl i64 %xor378, 27, !dbg !2205
  %151 = lshr i64 %xor378, 37, !dbg !2205
  %152 = or i64 %150, %151, !dbg !2205
    #dbg_value(i64 %152, !1954, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 %146, i64 %149, i64 %152), !1936, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %not410 = xor i64 %152, -1, !dbg !2206
    #dbg_value(!DIArgList(i64 %146, i64 %149, i64 %not410), !1936, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %and411 = and i64 %149, %not410, !dbg !2207
    #dbg_value(!DIArgList(i64 %146, i64 %and411), !1936, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor412 = xor i64 %146, %and411, !dbg !2208
    #dbg_value(i64 %xor412, !1936, !DIExpression(), !1896)
  %xor390 = xor i64 %xor192, %xor265, !dbg !2209
    #dbg_value(i64 %xor390, !1981, !DIExpression(), !1896)
  %153 = shl i64 %xor390, 15, !dbg !2210
  %154 = lshr i64 %xor390, 49, !dbg !2210
  %155 = or i64 %153, %154, !dbg !2210
    #dbg_value(i64 %155, !1957, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 %155, i64 %152, i64 %146), !1934, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %not407 = xor i64 %146, -1, !dbg !2211
    #dbg_value(!DIArgList(i64 %155, i64 %152, i64 %not407), !1934, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %and408 = and i64 %152, %not407, !dbg !2212
    #dbg_value(!DIArgList(i64 %155, i64 %and408), !1934, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor409 = xor i64 %155, %and408, !dbg !2213
    #dbg_value(i64 %xor409, !1934, !DIExpression(), !1896)
  %xor386 = xor i64 %xor154, %xor261, !dbg !2214
    #dbg_value(i64 %xor386, !1975, !DIExpression(), !1896)
  %156 = shl i64 %xor386, 10, !dbg !2215
  %157 = lshr i64 %xor386, 54, !dbg !2215
  %158 = or i64 %156, %157, !dbg !2215
    #dbg_value(i64 %158, !1956, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 %158, i64 %146, i64 %155), !1932, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %149, i64 %155, i64 %158), !1930, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %152, i64 %158, i64 %149), !1928, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %not404 = xor i64 %155, -1, !dbg !2216
    #dbg_value(!DIArgList(i64 %158, i64 %146, i64 %not404), !1932, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %and405 = and i64 %146, %not404, !dbg !2217
    #dbg_value(!DIArgList(i64 %158, i64 %and405), !1932, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor406 = xor i64 %158, %and405, !dbg !2218
    #dbg_value(i64 %xor406, !1932, !DIExpression(), !1896)
  %not401 = xor i64 %158, -1, !dbg !2219
    #dbg_value(!DIArgList(i64 %149, i64 %155, i64 %not401), !1930, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %and402 = and i64 %155, %not401, !dbg !2220
    #dbg_value(!DIArgList(i64 %149, i64 %and402), !1930, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor403 = xor i64 %149, %and402, !dbg !2221
    #dbg_value(i64 %xor403, !1930, !DIExpression(), !1896)
  %not398 = xor i64 %149, -1, !dbg !2222
    #dbg_value(!DIArgList(i64 %152, i64 %158, i64 %not398), !1928, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %and399 = and i64 %158, %not398, !dbg !2223
    #dbg_value(!DIArgList(i64 %152, i64 %and399), !1928, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor400 = xor i64 %152, %and399, !dbg !2224
    #dbg_value(i64 %xor400, !1928, !DIExpression(), !1896)
  %xor359 = xor i64 %xor221, %xor257, !dbg !2225
    #dbg_value(i64 %xor359, !1984, !DIExpression(), !1896)
  %159 = shl i64 %xor359, 18, !dbg !2226
  %160 = lshr i64 %xor359, 46, !dbg !2226
  %161 = or i64 %159, %160, !dbg !2226
    #dbg_value(i64 %161, !1958, !DIExpression(), !1896)
  %xor347 = xor i64 %xor122, %xor265, !dbg !2227
    #dbg_value(i64 %xor347, !1971, !DIExpression(), !1896)
  %162 = shl i64 %xor347, 6, !dbg !2228
  %163 = lshr i64 %xor347, 58, !dbg !2228
  %164 = or i64 %162, %163, !dbg !2228
    #dbg_value(i64 %164, !1955, !DIExpression(), !1896)
  %xor343 = xor i64 %xor84, %xor261, !dbg !2229
    #dbg_value(i64 %xor343, !1965, !DIExpression(), !1896)
  %165 = shl i64 %xor343, 1, !dbg !2230
  %166 = lshr i64 %xor343, 63, !dbg !2230
  %167 = or i64 %165, %166, !dbg !2230
    #dbg_value(i64 %167, !1954, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 %161, i64 %164, i64 %167), !1926, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %not375 = xor i64 %167, -1, !dbg !2231
    #dbg_value(!DIArgList(i64 %161, i64 %164, i64 %not375), !1926, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %and376 = and i64 %164, %not375, !dbg !2232
    #dbg_value(!DIArgList(i64 %161, i64 %and376), !1926, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor377 = xor i64 %161, %and376, !dbg !2233
    #dbg_value(i64 %xor377, !1926, !DIExpression(), !1896)
  %xor355 = xor i64 %xor198, %xor273, !dbg !2234
    #dbg_value(i64 %xor355, !1983, !DIExpression(), !1896)
  %168 = shl i64 %xor355, 8, !dbg !2235
  %169 = lshr i64 %xor355, 56, !dbg !2235
  %170 = or i64 %168, %169, !dbg !2235
    #dbg_value(i64 %170, !1957, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 %170, i64 %167, i64 %161), !1924, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %not372 = xor i64 %161, -1, !dbg !2236
    #dbg_value(!DIArgList(i64 %170, i64 %167, i64 %not372), !1924, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %and373 = and i64 %167, %not372, !dbg !2237
    #dbg_value(!DIArgList(i64 %170, i64 %and373), !1924, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor374 = xor i64 %170, %and373, !dbg !2238
    #dbg_value(i64 %xor374, !1924, !DIExpression(), !1896)
  %xor351 = xor i64 %xor160, %xor269, !dbg !2239
    #dbg_value(i64 %xor351, !1977, !DIExpression(), !1896)
  %171 = shl i64 %xor351, 25, !dbg !2240
  %172 = lshr i64 %xor351, 39, !dbg !2240
  %173 = or i64 %171, %172, !dbg !2240
    #dbg_value(i64 %173, !1956, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 %173, i64 %161, i64 %170), !1922, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %164, i64 %170, i64 %173), !1920, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %167, i64 %173, i64 %164), !1918, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %not369 = xor i64 %170, -1, !dbg !2241
    #dbg_value(!DIArgList(i64 %173, i64 %161, i64 %not369), !1922, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %and370 = and i64 %161, %not369, !dbg !2242
    #dbg_value(!DIArgList(i64 %173, i64 %and370), !1922, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor371 = xor i64 %173, %and370, !dbg !2243
    #dbg_value(i64 %xor371, !1922, !DIExpression(), !1896)
  %not366 = xor i64 %173, -1, !dbg !2244
    #dbg_value(!DIArgList(i64 %164, i64 %170, i64 %not366), !1920, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %and367 = and i64 %170, %not366, !dbg !2245
    #dbg_value(!DIArgList(i64 %164, i64 %and367), !1920, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor368 = xor i64 %164, %and367, !dbg !2246
    #dbg_value(i64 %xor368, !1920, !DIExpression(), !1896)
  %not363 = xor i64 %164, -1, !dbg !2247
    #dbg_value(!DIArgList(i64 %167, i64 %173, i64 %not363), !1918, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %and364 = and i64 %173, %not363, !dbg !2248
    #dbg_value(!DIArgList(i64 %167, i64 %and364), !1918, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor365 = xor i64 %167, %and364, !dbg !2249
    #dbg_value(i64 %xor365, !1918, !DIExpression(), !1896)
  %xor324 = xor i64 %xor227, %xor265, !dbg !2250
    #dbg_value(i64 %xor324, !1986, !DIExpression(), !1896)
  %174 = shl i64 %xor324, 61, !dbg !2251
  %175 = lshr i64 %xor324, 3, !dbg !2251
  %176 = or i64 %174, %175, !dbg !2251
    #dbg_value(i64 %176, !1958, !DIExpression(), !1896)
  %xor312 = xor i64 %xor128, %xor273, !dbg !2252
    #dbg_value(i64 %xor312, !1973, !DIExpression(), !1896)
  %177 = shl i64 %xor312, 20, !dbg !2253
  %178 = lshr i64 %xor312, 44, !dbg !2253
  %179 = or i64 %177, %178, !dbg !2253
    #dbg_value(i64 %179, !1955, !DIExpression(), !1896)
  %xor308 = xor i64 %xor90, %xor269, !dbg !2254
    #dbg_value(i64 %xor308, !1967, !DIExpression(), !1896)
  %180 = shl i64 %xor308, 28, !dbg !2255
  %181 = lshr i64 %xor308, 36, !dbg !2255
  %182 = or i64 %180, %181, !dbg !2255
    #dbg_value(i64 %182, !1954, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 %176, i64 %179, i64 %182), !1916, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %not340 = xor i64 %182, -1, !dbg !2256
    #dbg_value(!DIArgList(i64 %176, i64 %179, i64 %not340), !1916, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %and341 = and i64 %179, %not340, !dbg !2257
    #dbg_value(!DIArgList(i64 %176, i64 %and341), !1916, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor342 = xor i64 %176, %and341, !dbg !2258
    #dbg_value(i64 %xor342, !1916, !DIExpression(), !1896)
  %xor320 = xor i64 %xor189, %xor261, !dbg !2259
    #dbg_value(i64 %xor320, !1980, !DIExpression(), !1896)
  %183 = shl i64 %xor320, 45, !dbg !2260
  %184 = lshr i64 %xor320, 19, !dbg !2260
  %185 = or i64 %183, %184, !dbg !2260
    #dbg_value(i64 %185, !1957, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 %185, i64 %182, i64 %176), !1914, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %not337 = xor i64 %176, -1, !dbg !2261
    #dbg_value(!DIArgList(i64 %185, i64 %182, i64 %not337), !1914, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %and338 = and i64 %182, %not337, !dbg !2262
    #dbg_value(!DIArgList(i64 %185, i64 %and338), !1914, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor339 = xor i64 %185, %and338, !dbg !2263
    #dbg_value(i64 %xor339, !1914, !DIExpression(), !1896)
  %xor316 = xor i64 %xor151, %xor257, !dbg !2264
    #dbg_value(i64 %xor316, !1974, !DIExpression(), !1896)
  %186 = shl i64 %xor316, 3, !dbg !2265
  %187 = lshr i64 %xor316, 61, !dbg !2265
  %188 = or i64 %186, %187, !dbg !2265
    #dbg_value(i64 %188, !1956, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 %188, i64 %176, i64 %185), !1912, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %179, i64 %185, i64 %188), !1910, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %182, i64 %188, i64 %179), !1908, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %not334 = xor i64 %185, -1, !dbg !2266
    #dbg_value(!DIArgList(i64 %188, i64 %176, i64 %not334), !1912, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %and335 = and i64 %176, %not334, !dbg !2267
    #dbg_value(!DIArgList(i64 %188, i64 %and335), !1912, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor336 = xor i64 %188, %and335, !dbg !2268
    #dbg_value(i64 %xor336, !1912, !DIExpression(), !1896)
  %not331 = xor i64 %188, -1, !dbg !2269
    #dbg_value(!DIArgList(i64 %179, i64 %185, i64 %not331), !1910, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %and332 = and i64 %185, %not331, !dbg !2270
    #dbg_value(!DIArgList(i64 %179, i64 %and332), !1910, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor333 = xor i64 %179, %and332, !dbg !2271
    #dbg_value(i64 %xor333, !1910, !DIExpression(), !1896)
  %not328 = xor i64 %179, -1, !dbg !2272
    #dbg_value(!DIArgList(i64 %182, i64 %188, i64 %not328), !1908, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %and329 = and i64 %188, %not328, !dbg !2273
    #dbg_value(!DIArgList(i64 %182, i64 %and329), !1908, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor330 = xor i64 %182, %and329, !dbg !2274
    #dbg_value(i64 %xor330, !1908, !DIExpression(), !1896)
  %xor287 = xor i64 %xor233, %xor273, !dbg !2275
    #dbg_value(i64 %xor287, !1988, !DIExpression(), !1896)
  %189 = shl i64 %xor287, 14, !dbg !2276
  %190 = lshr i64 %xor287, 50, !dbg !2276
  %191 = or i64 %189, %190, !dbg !2276
    #dbg_value(i64 %191, !1958, !DIExpression(), !1896)
  %xor275 = xor i64 %xor119, %xor261, !dbg !2277
    #dbg_value(i64 %xor275, !1970, !DIExpression(), !1896)
  %192 = shl i64 %xor275, 44, !dbg !2278
  %193 = lshr i64 %xor275, 20, !dbg !2278
  %194 = or i64 %192, %193, !dbg !2278
    #dbg_value(i64 %194, !1955, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 %191, i64 %194, i64 %xor81, i64 %xor257), !1906, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor274 = xor i64 %xor81, %xor257, !dbg !2279
    #dbg_value(i64 %xor274, !1964, !DIExpression(), !1896)
    #dbg_value(i64 %xor274, !1954, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 %191, i64 %194, i64 %xor274), !1906, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %not305 = xor i64 %xor274, -1, !dbg !2280
    #dbg_value(!DIArgList(i64 %191, i64 %194, i64 %not305), !1906, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %and306 = and i64 %194, %not305, !dbg !2281
    #dbg_value(!DIArgList(i64 %191, i64 %and306), !1906, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor307 = xor i64 %191, %and306, !dbg !2282
    #dbg_value(i64 %xor307, !1906, !DIExpression(), !1896)
  %xor283 = xor i64 %xor195, %xor269, !dbg !2283
    #dbg_value(i64 %xor283, !1982, !DIExpression(), !1896)
  %195 = shl i64 %xor283, 21, !dbg !2284
  %196 = lshr i64 %xor283, 43, !dbg !2284
  %197 = or i64 %195, %196, !dbg !2284
    #dbg_value(i64 %197, !1957, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 %197, i64 %xor274, i64 %191), !1904, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %not302 = xor i64 %191, -1, !dbg !2285
    #dbg_value(!DIArgList(i64 %197, i64 %xor274, i64 %not302), !1904, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %and303 = and i64 %xor274, %not302, !dbg !2286
    #dbg_value(!DIArgList(i64 %197, i64 %and303), !1904, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor304 = xor i64 %197, %and303, !dbg !2287
    #dbg_value(i64 %xor304, !1904, !DIExpression(), !1896)
  %xor279 = xor i64 %xor157, %xor265, !dbg !2288
    #dbg_value(i64 %xor279, !1976, !DIExpression(), !1896)
  %198 = shl i64 %xor279, 43, !dbg !2289
  %199 = lshr i64 %xor279, 21, !dbg !2289
  %200 = or i64 %198, %199, !dbg !2289
    #dbg_value(i64 %200, !1956, !DIExpression(), !1896)
    #dbg_value(!DIArgList(i64 %200, i64 %191, i64 %197), !1902, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %194, i64 %197, i64 %200), !1900, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
    #dbg_value(!DIArgList(i64 %xor274, i64 %200, i64 %194), !1898, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %not299 = xor i64 %197, -1, !dbg !2290
    #dbg_value(!DIArgList(i64 %200, i64 %191, i64 %not299), !1902, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %and300 = and i64 %191, %not299, !dbg !2291
    #dbg_value(!DIArgList(i64 %200, i64 %and300), !1902, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor301 = xor i64 %200, %and300, !dbg !2292
    #dbg_value(i64 %xor301, !1902, !DIExpression(), !1896)
  %not296 = xor i64 %200, -1, !dbg !2293
    #dbg_value(!DIArgList(i64 %194, i64 %197, i64 %not296), !1900, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1896)
  %and297 = and i64 %197, %not296, !dbg !2294
    #dbg_value(!DIArgList(i64 %194, i64 %and297), !1900, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %xor298 = xor i64 %194, %and297, !dbg !2295
    #dbg_value(i64 %xor298, !1900, !DIExpression(), !1896)
  %add = or disjoint i32 %round.0, 1, !dbg !2296
  %arrayidx294 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %add, !dbg !2297
  %201 = load i64, ptr %arrayidx294, align 8, !dbg !2297
    #dbg_value(!DIArgList(i64 %xor274, i64 %201, i64 %200, i64 %194), !1898, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %not291 = xor i64 %194, -1, !dbg !2298
    #dbg_value(!DIArgList(i64 %xor274, i64 %201, i64 %200, i64 %not291), !1898, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %and292 = and i64 %200, %not291, !dbg !2299
    #dbg_value(!DIArgList(i64 %xor274, i64 %201, i64 %and292), !1898, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1896)
  %202 = xor i64 %and292, %201, !dbg !2300
  %xor295 = xor i64 %202, %xor274, !dbg !2300
    #dbg_value(i64 %xor295, !1898, !DIExpression(), !1896)
  %add448 = add nuw nsw i32 %round.0, 2, !dbg !2301
    #dbg_value(i32 %add448, !1947, !DIExpression(), !1896)
  br label %for.cond, !dbg !2302, !llvm.loop !2303

for.end:                                          ; preds = %for.cond
  %Aso.0.lcssa = phi i64 [ %Aso.0, %for.cond ], !dbg !1896
  %Asi.0.lcssa = phi i64 [ %Asi.0, %for.cond ], !dbg !1896
  %Ase.0.lcssa = phi i64 [ %Ase.0, %for.cond ], !dbg !1896
  %Asa.0.lcssa = phi i64 [ %Asa.0, %for.cond ], !dbg !1896
  %Amu.0.lcssa = phi i64 [ %Amu.0, %for.cond ], !dbg !1896
  %Amo.0.lcssa = phi i64 [ %Amo.0, %for.cond ], !dbg !1896
  %Ami.0.lcssa = phi i64 [ %Ami.0, %for.cond ], !dbg !1896
  %Ame.0.lcssa = phi i64 [ %Ame.0, %for.cond ], !dbg !1896
  %Ama.0.lcssa = phi i64 [ %Ama.0, %for.cond ], !dbg !1896
  %Aku.0.lcssa = phi i64 [ %Aku.0, %for.cond ], !dbg !1896
  %Ako.0.lcssa = phi i64 [ %Ako.0, %for.cond ], !dbg !1896
  %Aki.0.lcssa = phi i64 [ %Aki.0, %for.cond ], !dbg !1896
  %Ake.0.lcssa = phi i64 [ %Ake.0, %for.cond ], !dbg !1896
  %Aka.0.lcssa = phi i64 [ %Aka.0, %for.cond ], !dbg !1896
  %Agu.0.lcssa = phi i64 [ %Agu.0, %for.cond ], !dbg !1896
  %Ago.0.lcssa = phi i64 [ %Ago.0, %for.cond ], !dbg !1896
  %Agi.0.lcssa = phi i64 [ %Agi.0, %for.cond ], !dbg !1896
  %Age.0.lcssa = phi i64 [ %Age.0, %for.cond ], !dbg !1896
  %Aga.0.lcssa = phi i64 [ %Aga.0, %for.cond ], !dbg !1896
  %Abu.0.lcssa = phi i64 [ %Abu.0, %for.cond ], !dbg !1896
  %Abo.0.lcssa = phi i64 [ %Abo.0, %for.cond ], !dbg !1896
  %Abi.0.lcssa = phi i64 [ %Abi.0, %for.cond ], !dbg !1896
  %Abe.0.lcssa = phi i64 [ %Abe.0, %for.cond ], !dbg !1896
  %Aba.0.lcssa = phi i64 [ %Aba.0, %for.cond ], !dbg !1896
  %Asu.0.lcssa = phi i64 [ %Asu.0, %for.cond ], !dbg !1896
  store i64 %Aba.0.lcssa, ptr %state, align 8, !dbg !2305
  %arrayidx450 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !2306
  store i64 %Abe.0.lcssa, ptr %arrayidx450, align 8, !dbg !2307
  %arrayidx451 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !2308
  store i64 %Abi.0.lcssa, ptr %arrayidx451, align 8, !dbg !2309
  %arrayidx452 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !2310
  store i64 %Abo.0.lcssa, ptr %arrayidx452, align 8, !dbg !2311
  %arrayidx453 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !2312
  store i64 %Abu.0.lcssa, ptr %arrayidx453, align 8, !dbg !2313
  %arrayidx454 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !2314
  store i64 %Aga.0.lcssa, ptr %arrayidx454, align 8, !dbg !2315
  %arrayidx455 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !2316
  store i64 %Age.0.lcssa, ptr %arrayidx455, align 8, !dbg !2317
  %arrayidx456 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !2318
  store i64 %Agi.0.lcssa, ptr %arrayidx456, align 8, !dbg !2319
  %arrayidx457 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !2320
  store i64 %Ago.0.lcssa, ptr %arrayidx457, align 8, !dbg !2321
  %arrayidx458 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !2322
  store i64 %Agu.0.lcssa, ptr %arrayidx458, align 8, !dbg !2323
  %arrayidx459 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !2324
  store i64 %Aka.0.lcssa, ptr %arrayidx459, align 8, !dbg !2325
  %arrayidx460 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !2326
  store i64 %Ake.0.lcssa, ptr %arrayidx460, align 8, !dbg !2327
  %arrayidx461 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !2328
  store i64 %Aki.0.lcssa, ptr %arrayidx461, align 8, !dbg !2329
  %arrayidx462 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !2330
  store i64 %Ako.0.lcssa, ptr %arrayidx462, align 8, !dbg !2331
  %arrayidx463 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !2332
  store i64 %Aku.0.lcssa, ptr %arrayidx463, align 8, !dbg !2333
  %arrayidx464 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !2334
  store i64 %Ama.0.lcssa, ptr %arrayidx464, align 8, !dbg !2335
  %arrayidx465 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !2336
  store i64 %Ame.0.lcssa, ptr %arrayidx465, align 8, !dbg !2337
  %arrayidx466 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !2338
  store i64 %Ami.0.lcssa, ptr %arrayidx466, align 8, !dbg !2339
  %arrayidx467 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !2340
  store i64 %Amo.0.lcssa, ptr %arrayidx467, align 8, !dbg !2341
  %arrayidx468 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !2342
  store i64 %Amu.0.lcssa, ptr %arrayidx468, align 8, !dbg !2343
  %arrayidx469 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !2344
  store i64 %Asa.0.lcssa, ptr %arrayidx469, align 8, !dbg !2345
  %arrayidx470 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !2346
  store i64 %Ase.0.lcssa, ptr %arrayidx470, align 8, !dbg !2347
  %arrayidx471 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !2348
  store i64 %Asi.0.lcssa, ptr %arrayidx471, align 8, !dbg !2349
  %arrayidx472 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !2350
  store i64 %Aso.0.lcssa, ptr %arrayidx472, align 8, !dbg !2351
  %arrayidx473 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !2352
  store i64 %Asu.0.lcssa, ptr %arrayidx473, align 8, !dbg !2353
  ret void, !dbg !2354
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_finalize(ptr noundef %state) local_unnamed_addr #0 !dbg !2355 {
entry:
    #dbg_value(ptr %state, !2356, !DIExpression(), !2357)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2358
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2358
  %conv = trunc i64 %0 to i32, !dbg !2358
  call fastcc void @keccak_finalize(ptr noundef %state, i32 noundef %conv, i32 noundef 168, i8 noundef zeroext 31) #3, !dbg !2359
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2360
  store i64 168, ptr %arrayidx1, align 8, !dbg !2361
  ret void, !dbg !2362
}

; Function Attrs: nounwind
define internal fastcc void @keccak_finalize(ptr noundef %s, i32 noundef %pos, i32 noundef range(i32 136, 169) %r, i8 noundef zeroext %p) unnamed_addr #0 !dbg !2363 {
entry:
    #dbg_value(ptr %s, !2366, !DIExpression(), !2367)
    #dbg_value(i32 %pos, !2368, !DIExpression(), !2367)
    #dbg_value(i32 %r, !2369, !DIExpression(), !2367)
    #dbg_value(i8 31, !2370, !DIExpression(), !2367)
  %rem = shl i32 %pos, 3, !dbg !2371
  %mul = and i32 %rem, 56, !dbg !2371
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2372
  %shl = shl nuw nsw i64 31, %sh_prom, !dbg !2372
  %div2 = lshr i32 %pos, 3, !dbg !2373
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div2, !dbg !2374
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2375
  %xor = xor i64 %0, %shl, !dbg !2375
  store i64 %xor, ptr %arrayidx, align 8, !dbg !2375
  %div13 = lshr i32 %r, 3, !dbg !2376
  %1 = getelementptr i64, ptr %s, i32 %div13, !dbg !2377
  %arrayidx2 = getelementptr i8, ptr %1, i32 -8, !dbg !2377
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !2378
  %xor3 = xor i64 %2, -9223372036854775808, !dbg !2378
  store i64 %xor3, ptr %arrayidx2, align 8, !dbg !2378
  ret void, !dbg !2379
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) local_unnamed_addr #0 !dbg !2380 {
entry:
    #dbg_value(ptr %out, !2383, !DIExpression(), !2384)
    #dbg_value(i32 %outlen, !2385, !DIExpression(), !2384)
    #dbg_value(ptr %state, !2386, !DIExpression(), !2384)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2387
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2387
  %conv = trunc i64 %0 to i32, !dbg !2387
  %call = call fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state, i32 noundef %conv, i32 noundef 168) #3, !dbg !2388
  %conv1 = zext i32 %call to i64, !dbg !2388
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2389
  store i64 %conv1, ptr %arrayidx2, align 8, !dbg !2390
  ret void, !dbg !2391
}

; Function Attrs: nounwind
define internal fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %s, i32 noundef %pos, i32 noundef range(i32 136, 169) %r) unnamed_addr #0 !dbg !2392 {
entry:
    #dbg_value(ptr %out, !2395, !DIExpression(), !2396)
    #dbg_value(i32 %outlen, !2397, !DIExpression(), !2396)
    #dbg_value(ptr %s, !2398, !DIExpression(), !2396)
    #dbg_value(i32 %pos, !2399, !DIExpression(), !2396)
    #dbg_value(i32 %r, !2400, !DIExpression(), !2396)
  br label %while.cond, !dbg !2401

while.cond:                                       ; preds = %for.end, %entry
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ %i.0.lcssa, %for.end ]
  %outlen.addr.0 = phi i32 [ %outlen, %entry ], [ %sub3, %for.end ]
  %out.addr.0 = phi ptr [ %out, %entry ], [ %out.addr.1.lcssa, %for.end ]
    #dbg_value(ptr %out.addr.0, !2395, !DIExpression(), !2396)
    #dbg_value(i32 %outlen.addr.0, !2397, !DIExpression(), !2396)
    #dbg_value(i32 %pos.addr.0, !2399, !DIExpression(), !2396)
  %tobool.not = icmp eq i32 %outlen.addr.0, 0, !dbg !2401
  br i1 %tobool.not, label %while.end, label %while.body, !dbg !2401

while.body:                                       ; preds = %while.cond
  %cmp = icmp eq i32 %pos.addr.0, %r, !dbg !2402
  br i1 %cmp, label %if.then, label %if.end, !dbg !2402

if.then:                                          ; preds = %while.body
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2405
    #dbg_value(i32 0, !2399, !DIExpression(), !2396)
  br label %if.end, !dbg !2407

if.end:                                           ; preds = %if.then, %while.body
  %pos.addr.1 = phi i32 [ 0, %if.then ], [ %pos.addr.0, %while.body ]
    #dbg_value(i32 %pos.addr.1, !2399, !DIExpression(), !2396)
    #dbg_value(i32 %pos.addr.1, !2408, !DIExpression(), !2396)
  br label %for.cond, !dbg !2409

for.cond:                                         ; preds = %for.body, %if.end
  %i.0 = phi i32 [ %pos.addr.1, %if.end ], [ %inc, %for.body ], !dbg !2411
  %out.addr.1 = phi ptr [ %out.addr.0, %if.end ], [ %incdec.ptr, %for.body ]
    #dbg_value(ptr %out.addr.1, !2395, !DIExpression(), !2396)
    #dbg_value(i32 %i.0, !2408, !DIExpression(), !2396)
  %cmp1 = icmp ult i32 %i.0, %r, !dbg !2412
  %add = add i32 %pos.addr.1, %outlen.addr.0, !dbg !2414
  %cmp2 = icmp ult i32 %i.0, %add, !dbg !2414
  %0 = and i1 %cmp1, %cmp2, !dbg !2414
  br i1 %0, label %for.body, label %for.end, !dbg !2415

for.body:                                         ; preds = %for.cond
  %div1 = lshr i32 %i.0, 3, !dbg !2416
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div1, !dbg !2417
  %1 = load i64, ptr %arrayidx, align 8, !dbg !2417
  %rem = shl nuw nsw i32 %i.0, 3, !dbg !2418
  %mul = and i32 %rem, 56, !dbg !2418
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2419
  %shr = lshr i64 %1, %sh_prom, !dbg !2419
  %conv = trunc i64 %shr to i8, !dbg !2417
    #dbg_value(ptr %out.addr.1, !2395, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2396)
  store i8 %conv, ptr %out.addr.1, align 1, !dbg !2420
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %out.addr.1, i32 1, !dbg !2421
    #dbg_value(ptr %incdec.ptr, !2395, !DIExpression(), !2396)
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2422
    #dbg_value(i32 %inc, !2408, !DIExpression(), !2396)
  br label %for.cond, !dbg !2423, !llvm.loop !2424

for.end:                                          ; preds = %for.cond
  %i.0.lcssa = phi i32 [ %i.0, %for.cond ], !dbg !2411
  %out.addr.1.lcssa = phi ptr [ %out.addr.1, %for.cond ]
  %sub.neg = sub i32 %pos.addr.1, %i.0.lcssa, !dbg !2426
  %sub3 = add i32 %sub.neg, %outlen.addr.0, !dbg !2427
    #dbg_value(i32 %sub3, !2397, !DIExpression(), !2396)
    #dbg_value(i32 %i.0.lcssa, !2399, !DIExpression(), !2396)
  br label %while.cond, !dbg !2401, !llvm.loop !2428

while.end:                                        ; preds = %while.cond
  %pos.addr.0.lcssa = phi i32 [ %pos.addr.0, %while.cond ]
  ret i32 %pos.addr.0.lcssa, !dbg !2430
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2431 {
entry:
    #dbg_value(ptr %state, !2432, !DIExpression(), !2433)
    #dbg_value(ptr %in, !2434, !DIExpression(), !2433)
    #dbg_value(i32 %inlen, !2435, !DIExpression(), !2433)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 168, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #3, !dbg !2436
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2437
  store i64 168, ptr %arrayidx, align 8, !dbg !2438
  ret void, !dbg !2439
}

; Function Attrs: nounwind
define internal fastcc void @keccak_absorb_once(ptr noundef %s, i32 noundef range(i32 72, 169) %r, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext range(i8 6, 32) %p) unnamed_addr #0 !dbg !2440 {
entry:
    #dbg_value(ptr %s, !2443, !DIExpression(), !2444)
    #dbg_value(i32 %r, !2445, !DIExpression(), !2444)
    #dbg_value(ptr %in, !2446, !DIExpression(), !2444)
    #dbg_value(i32 %inlen, !2447, !DIExpression(), !2444)
    #dbg_value(i8 %p, !2448, !DIExpression(), !2444)
    #dbg_value(i32 0, !2449, !DIExpression(), !2444)
  br label %for.cond, !dbg !2450

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2452
    #dbg_value(i32 %i.0, !2449, !DIExpression(), !2444)
  %exitcond = icmp ne i32 %i.0, 25, !dbg !2453
  br i1 %exitcond, label %for.body, label %while.cond.preheader, !dbg !2455

while.cond.preheader:                             ; preds = %for.cond
  %0 = lshr i32 %r, 3, !dbg !2456
  br label %while.cond, !dbg !2456

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !2457
  store i64 0, ptr %arrayidx, align 8, !dbg !2458
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2459
    #dbg_value(i32 %inc, !2449, !DIExpression(), !2444)
  br label %for.cond, !dbg !2460, !llvm.loop !2461

while.cond:                                       ; preds = %while.cond.preheader, %for.end8
  %in.addr.0 = phi ptr [ %add.ptr9, %for.end8 ], [ %in, %while.cond.preheader ]
  %inlen.addr.0 = phi i32 [ %sub, %for.end8 ], [ %inlen, %while.cond.preheader ]
    #dbg_value(i32 %inlen.addr.0, !2447, !DIExpression(), !2444)
    #dbg_value(ptr %in.addr.0, !2446, !DIExpression(), !2444)
  %cmp1.not = icmp ult i32 %inlen.addr.0, %r, !dbg !2463
  br i1 %cmp1.not, label %for.cond10.preheader, label %for.cond2.preheader, !dbg !2456

for.cond2.preheader:                              ; preds = %while.cond
  br label %for.cond2, !dbg !2464

for.cond10.preheader:                             ; preds = %while.cond
  %inlen.addr.0.lcssa6 = phi i32 [ %inlen.addr.0, %while.cond ]
  %in.addr.0.lcssa = phi ptr [ %in.addr.0, %while.cond ]
  br label %for.cond10, !dbg !2467

for.cond2:                                        ; preds = %for.cond2.preheader, %for.body4
  %i.1 = phi i32 [ %inc7, %for.body4 ], [ 0, %for.cond2.preheader ], !dbg !2469
    #dbg_value(i32 %i.1, !2449, !DIExpression(), !2444)
  %exitcond5 = icmp ne i32 %i.1, %0, !dbg !2470
  br i1 %exitcond5, label %for.body4, label %for.end8, !dbg !2464

for.body4:                                        ; preds = %for.cond2
  %mul = shl nuw nsw i32 %i.1, 3, !dbg !2472
  %add.ptr = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %mul, !dbg !2473
  %call = call fastcc i64 @load64(ptr noundef %add.ptr) #3, !dbg !2474
  %arrayidx5 = getelementptr inbounds nuw i64, ptr %s, i32 %i.1, !dbg !2475
  %1 = load i64, ptr %arrayidx5, align 8, !dbg !2476
  %xor = xor i64 %1, %call, !dbg !2476
  store i64 %xor, ptr %arrayidx5, align 8, !dbg !2476
  %inc7 = add nuw nsw i32 %i.1, 1, !dbg !2477
    #dbg_value(i32 %inc7, !2449, !DIExpression(), !2444)
  br label %for.cond2, !dbg !2478, !llvm.loop !2479

for.end8:                                         ; preds = %for.cond2
  %add.ptr9 = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %r, !dbg !2481
    #dbg_value(ptr %add.ptr9, !2446, !DIExpression(), !2444)
  %sub = sub i32 %inlen.addr.0, %r, !dbg !2482
    #dbg_value(i32 %sub, !2447, !DIExpression(), !2444)
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2483
  br label %while.cond, !dbg !2456, !llvm.loop !2484

for.cond10:                                       ; preds = %for.cond10.preheader, %for.body12
  %i.2 = phi i32 [ %inc19, %for.body12 ], [ 0, %for.cond10.preheader ], !dbg !2486
    #dbg_value(i32 %i.2, !2449, !DIExpression(), !2444)
  %exitcond7 = icmp ne i32 %i.2, %inlen.addr.0.lcssa6, !dbg !2487
  br i1 %exitcond7, label %for.body12, label %for.end20, !dbg !2467

for.body12:                                       ; preds = %for.cond10
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %in.addr.0.lcssa, i32 %i.2, !dbg !2489
  %2 = load i8, ptr %arrayidx13, align 1, !dbg !2489
  %conv = zext i8 %2 to i64, !dbg !2490
  %rem = shl i32 %i.2, 3, !dbg !2491
  %mul14 = and i32 %rem, 56, !dbg !2491
  %sh_prom = zext nneg i32 %mul14 to i64, !dbg !2492
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !2492
  %div153 = lshr i32 %i.2, 3, !dbg !2493
  %arrayidx16 = getelementptr inbounds nuw i64, ptr %s, i32 %div153, !dbg !2494
  %3 = load i64, ptr %arrayidx16, align 8, !dbg !2495
  %xor17 = xor i64 %3, %shl, !dbg !2495
  store i64 %xor17, ptr %arrayidx16, align 8, !dbg !2495
  %inc19 = add i32 %i.2, 1, !dbg !2496
    #dbg_value(i32 %inc19, !2449, !DIExpression(), !2444)
  br label %for.cond10, !dbg !2497, !llvm.loop !2498

for.end20:                                        ; preds = %for.cond10
  %i.2.lcssa = phi i32 [ %i.2, %for.cond10 ], !dbg !2486
  %conv21 = zext nneg i8 %p to i64, !dbg !2500
  %rem22 = shl i32 %i.2.lcssa, 3, !dbg !2501
  %mul23 = and i32 %rem22, 56, !dbg !2501
  %sh_prom24 = zext nneg i32 %mul23 to i64, !dbg !2502
  %shl25 = shl nuw nsw i64 %conv21, %sh_prom24, !dbg !2502
  %div261 = lshr i32 %i.2.lcssa, 3, !dbg !2503
  %arrayidx27 = getelementptr inbounds nuw i64, ptr %s, i32 %div261, !dbg !2504
  %4 = load i64, ptr %arrayidx27, align 8, !dbg !2505
  %xor28 = xor i64 %4, %shl25, !dbg !2505
  store i64 %xor28, ptr %arrayidx27, align 8, !dbg !2505
  %sub29 = add nsw i32 %r, -1, !dbg !2506
  %div302 = lshr i32 %sub29, 3, !dbg !2507
  %arrayidx31 = getelementptr inbounds nuw i64, ptr %s, i32 %div302, !dbg !2508
  %5 = load i64, ptr %arrayidx31, align 8, !dbg !2509
  %xor32 = xor i64 %5, -9223372036854775808, !dbg !2509
  store i64 %xor32, ptr %arrayidx31, align 8, !dbg !2509
  ret void, !dbg !2510
}

; Function Attrs: nounwind
define internal fastcc i64 @load64(ptr noundef %x) unnamed_addr #0 !dbg !2511 {
entry:
    #dbg_value(ptr %x, !2514, !DIExpression(), !2515)
    #dbg_value(i64 0, !2516, !DIExpression(), !2515)
    #dbg_value(i32 0, !2517, !DIExpression(), !2515)
  br label %for.cond, !dbg !2518

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !2520
  %r.0 = phi i64 [ 0, %entry ], [ %or, %for.inc ], !dbg !2515
    #dbg_value(i64 %r.0, !2516, !DIExpression(), !2515)
    #dbg_value(i32 %i.0, !2517, !DIExpression(), !2515)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !2521
  br i1 %exitcond, label %for.inc, label %for.end, !dbg !2523

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i64 poison, i8 poison, i32 poison), !2516, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2515)
  %arrayidx = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2524
  %0 = load i8, ptr %arrayidx, align 1, !dbg !2524
    #dbg_value(!DIArgList(i64 %r.0, i8 %0, i32 %i.0), !2516, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2515)
  %conv = zext i8 %0 to i64, !dbg !2525
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i32 %i.0), !2516, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2515)
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2526
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i32 %mul), !2516, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2515)
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2527
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i64 %sh_prom), !2516, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2515)
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !2527
    #dbg_value(!DIArgList(i64 %r.0, i64 %shl), !2516, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value), !2515)
  %or = or i64 %r.0, %shl, !dbg !2528
    #dbg_value(i64 %or, !2516, !DIExpression(), !2515)
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2529
    #dbg_value(i32 %inc, !2517, !DIExpression(), !2515)
  br label %for.cond, !dbg !2530, !llvm.loop !2531

for.end:                                          ; preds = %for.cond
  %r.0.lcssa = phi i64 [ %r.0, %for.cond ], !dbg !2515
  ret i64 %r.0.lcssa, !dbg !2533
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #0 !dbg !2534 {
entry:
    #dbg_value(ptr %out, !2535, !DIExpression(), !2536)
    #dbg_value(i32 %nblocks, !2537, !DIExpression(), !2536)
    #dbg_value(ptr %state, !2538, !DIExpression(), !2536)
  call fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state, i32 noundef 168) #3, !dbg !2539
  ret void, !dbg !2540
}

; Function Attrs: nounwind
define internal fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %s, i32 noundef range(i32 136, 169) %r) unnamed_addr #0 !dbg !2541 {
entry:
    #dbg_value(ptr %out, !2544, !DIExpression(), !2545)
    #dbg_value(i32 %nblocks, !2546, !DIExpression(), !2545)
    #dbg_value(ptr %s, !2547, !DIExpression(), !2545)
    #dbg_value(i32 %r, !2548, !DIExpression(), !2545)
  %0 = lshr i32 %r, 3, !dbg !2549
  br label %while.cond, !dbg !2549

while.cond:                                       ; preds = %for.end, %entry
  %nblocks.addr.0 = phi i32 [ %nblocks, %entry ], [ %sub, %for.end ]
  %out.addr.0 = phi ptr [ %out, %entry ], [ %add.ptr1, %for.end ]
    #dbg_value(ptr %out.addr.0, !2544, !DIExpression(), !2545)
    #dbg_value(i32 %nblocks.addr.0, !2546, !DIExpression(), !2545)
  %tobool.not = icmp eq i32 %nblocks.addr.0, 0, !dbg !2549
  br i1 %tobool.not, label %while.end, label %while.body, !dbg !2549

while.body:                                       ; preds = %while.cond
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2550
    #dbg_value(i32 0, !2552, !DIExpression(), !2545)
  br label %for.cond, !dbg !2553

for.cond:                                         ; preds = %for.body, %while.body
  %i.0 = phi i32 [ 0, %while.body ], [ %inc, %for.body ], !dbg !2555
    #dbg_value(i32 %i.0, !2552, !DIExpression(), !2545)
  %exitcond = icmp ne i32 %i.0, %0, !dbg !2556
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2558

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2559
  %add.ptr = getelementptr inbounds nuw i8, ptr %out.addr.0, i32 %mul, !dbg !2560
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !2561
  %1 = load i64, ptr %arrayidx, align 8, !dbg !2561
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %1) #3, !dbg !2562
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2563
    #dbg_value(i32 %inc, !2552, !DIExpression(), !2545)
  br label %for.cond, !dbg !2564, !llvm.loop !2565

for.end:                                          ; preds = %for.cond
  %add.ptr1 = getelementptr inbounds nuw i8, ptr %out.addr.0, i32 %r, !dbg !2567
    #dbg_value(ptr %add.ptr1, !2544, !DIExpression(), !2545)
  %sub = add i32 %nblocks.addr.0, -1, !dbg !2568
    #dbg_value(i32 %sub, !2546, !DIExpression(), !2545)
  br label %while.cond, !dbg !2549, !llvm.loop !2569

while.end:                                        ; preds = %while.cond
  ret void, !dbg !2571
}

; Function Attrs: nounwind
define internal fastcc void @store64(ptr noundef %x, i64 noundef %u) unnamed_addr #0 !dbg !2572 {
entry:
    #dbg_value(ptr %x, !2575, !DIExpression(), !2576)
    #dbg_value(i64 %u, !2577, !DIExpression(), !2576)
    #dbg_value(i32 0, !2578, !DIExpression(), !2576)
  br label %for.cond, !dbg !2579

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2581
    #dbg_value(i32 %i.0, !2578, !DIExpression(), !2576)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !2582
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2584

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2585
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2586
  %shr = lshr i64 %u, %sh_prom, !dbg !2586
  %conv = trunc i64 %shr to i8, !dbg !2587
  %arrayidx = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2588
  store i8 %conv, ptr %arrayidx, align 1, !dbg !2589
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2590
    #dbg_value(i32 %inc, !2578, !DIExpression(), !2576)
  br label %for.cond, !dbg !2591, !llvm.loop !2592

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2594
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef %state) local_unnamed_addr #0 !dbg !2595 {
entry:
    #dbg_value(ptr %state, !2596, !DIExpression(), !2597)
  call fastcc void @keccak_init(ptr noundef %state) #3, !dbg !2598
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2599
  store i64 0, ptr %arrayidx, align 8, !dbg !2600
  ret void, !dbg !2601
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2602 {
entry:
    #dbg_value(ptr %state, !2603, !DIExpression(), !2604)
    #dbg_value(ptr %in, !2605, !DIExpression(), !2604)
    #dbg_value(i32 %inlen, !2606, !DIExpression(), !2604)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2607
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2607
  %conv = trunc i64 %0 to i32, !dbg !2607
  %call = call fastcc i32 @keccak_absorb(ptr noundef %state, i32 noundef %conv, i32 noundef 136, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2608
  %conv1 = zext i32 %call to i64, !dbg !2608
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2609
  store i64 %conv1, ptr %arrayidx2, align 8, !dbg !2610
  ret void, !dbg !2611
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef %state) local_unnamed_addr #0 !dbg !2612 {
entry:
    #dbg_value(ptr %state, !2613, !DIExpression(), !2614)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2615
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2615
  %conv = trunc i64 %0 to i32, !dbg !2615
  call fastcc void @keccak_finalize(ptr noundef %state, i32 noundef %conv, i32 noundef 136, i8 noundef zeroext 31) #3, !dbg !2616
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2617
  store i64 136, ptr %arrayidx1, align 8, !dbg !2618
  ret void, !dbg !2619
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) local_unnamed_addr #0 !dbg !2620 {
entry:
    #dbg_value(ptr %out, !2621, !DIExpression(), !2622)
    #dbg_value(i32 %outlen, !2623, !DIExpression(), !2622)
    #dbg_value(ptr %state, !2624, !DIExpression(), !2622)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2625
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2625
  %conv = trunc i64 %0 to i32, !dbg !2625
  %call = call fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state, i32 noundef %conv, i32 noundef 136) #3, !dbg !2626
  %conv1 = zext i32 %call to i64, !dbg !2626
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2627
  store i64 %conv1, ptr %arrayidx2, align 8, !dbg !2628
  ret void, !dbg !2629
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2630 {
entry:
    #dbg_value(ptr %state, !2631, !DIExpression(), !2632)
    #dbg_value(ptr %in, !2633, !DIExpression(), !2632)
    #dbg_value(i32 %inlen, !2634, !DIExpression(), !2632)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #3, !dbg !2635
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2636
  store i64 136, ptr %arrayidx, align 8, !dbg !2637
  ret void, !dbg !2638
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #0 !dbg !2639 {
entry:
    #dbg_value(ptr %out, !2640, !DIExpression(), !2641)
    #dbg_value(i32 %nblocks, !2642, !DIExpression(), !2641)
    #dbg_value(ptr %state, !2643, !DIExpression(), !2641)
  call fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state, i32 noundef 136) #3, !dbg !2644
  ret void, !dbg !2645
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2646 {
entry:
  %state = alloca [26 x i64], align 8
    #dbg_value(ptr %out, !2649, !DIExpression(), !2650)
    #dbg_value(i32 %outlen, !2651, !DIExpression(), !2650)
    #dbg_value(ptr %in, !2652, !DIExpression(), !2650)
    #dbg_value(i32 %inlen, !2653, !DIExpression(), !2650)
    #dbg_declare(ptr %state, !2654, !DIExpression(), !2655)
  call void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef nonnull %state, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2656
  %div = udiv i32 %outlen, 168, !dbg !2657
    #dbg_value(i32 %div, !2658, !DIExpression(), !2650)
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %div, ptr noundef nonnull %state) #3, !dbg !2659
  %mul.neg = mul i32 %div, -168, !dbg !2660
  %sub = add i32 %mul.neg, %outlen, !dbg !2661
    #dbg_value(i32 %sub, !2651, !DIExpression(), !2650)
  %mul1 = mul nuw i32 %div, 168, !dbg !2662
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !2663
    #dbg_value(ptr %add.ptr, !2649, !DIExpression(), !2650)
  call void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef nonnull %state) #3, !dbg !2664
  ret void, !dbg !2665
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2666 {
entry:
  %state = alloca [26 x i64], align 8
    #dbg_value(ptr %out, !2667, !DIExpression(), !2668)
    #dbg_value(i32 %outlen, !2669, !DIExpression(), !2668)
    #dbg_value(ptr %in, !2670, !DIExpression(), !2668)
    #dbg_value(i32 %inlen, !2671, !DIExpression(), !2668)
    #dbg_declare(ptr %state, !2672, !DIExpression(), !2673)
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef nonnull %state, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2674
  %div = udiv i32 %outlen, 136, !dbg !2675
    #dbg_value(i32 %div, !2676, !DIExpression(), !2668)
  call void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %div, ptr noundef nonnull %state) #3, !dbg !2677
  %mul.neg = mul i32 %div, -136, !dbg !2678
  %sub = add i32 %mul.neg, %outlen, !dbg !2679
    #dbg_value(i32 %sub, !2669, !DIExpression(), !2668)
  %mul1 = mul nuw i32 %div, 136, !dbg !2680
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !2681
    #dbg_value(ptr %add.ptr, !2667, !DIExpression(), !2668)
  call void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef nonnull %state) #3, !dbg !2682
  ret void, !dbg !2683
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2684 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !2687, !DIExpression(), !2688)
    #dbg_value(ptr %in, !2689, !DIExpression(), !2688)
    #dbg_value(i32 %inlen, !2690, !DIExpression(), !2688)
    #dbg_declare(ptr %s, !2691, !DIExpression(), !2695)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %s, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #3, !dbg !2696
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #3, !dbg !2697
    #dbg_value(i32 0, !2698, !DIExpression(), !2688)
  br label %for.cond, !dbg !2699

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2701
    #dbg_value(i32 %i.0, !2698, !DIExpression(), !2688)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !2702
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2704

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2705
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !2706
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !2707
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2707
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %0) #3, !dbg !2708
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2709
    #dbg_value(i32 %inc, !2698, !DIExpression(), !2688)
  br label %for.cond, !dbg !2710, !llvm.loop !2711

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2713
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2714 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !2715, !DIExpression(), !2716)
    #dbg_value(ptr %in, !2717, !DIExpression(), !2716)
    #dbg_value(i32 %inlen, !2718, !DIExpression(), !2716)
    #dbg_declare(ptr %s, !2719, !DIExpression(), !2720)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %s, i32 noundef 72, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #3, !dbg !2721
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #3, !dbg !2722
    #dbg_value(i32 0, !2723, !DIExpression(), !2716)
  br label %for.cond, !dbg !2724

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2726
    #dbg_value(i32 %i.0, !2723, !DIExpression(), !2716)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !2727
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2729

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2730
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !2731
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !2732
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2732
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %0) #3, !dbg !2733
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2734
    #dbg_value(i32 %inc, !2723, !DIExpression(), !2716)
  br label %for.cond, !dbg !2735, !llvm.loop !2736

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2738
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_kyber_shake128_absorb(ptr noundef %state, ptr noundef %seed, i8 noundef zeroext %x, i8 noundef zeroext %y) local_unnamed_addr #0 !dbg !2739 {
entry:
  %extseed = alloca [34 x i8], align 1
    #dbg_value(ptr %state, !2743, !DIExpression(), !2744)
    #dbg_value(ptr %seed, !2745, !DIExpression(), !2744)
    #dbg_value(i8 %x, !2746, !DIExpression(), !2744)
    #dbg_value(i8 %y, !2747, !DIExpression(), !2744)
    #dbg_declare(ptr %extseed, !2748, !DIExpression(), !2752)
  %call = call ptr @memcpy(ptr noundef nonnull %extseed, ptr noundef %seed, i32 noundef 32) #4, !dbg !2753
  %arrayidx = getelementptr inbounds nuw i8, ptr %extseed, i32 32, !dbg !2754
  store i8 %x, ptr %arrayidx, align 1, !dbg !2755
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %extseed, i32 33, !dbg !2756
  store i8 %y, ptr %arrayidx1, align 1, !dbg !2757
  call void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef nonnull %extseed, i32 noundef 34) #3, !dbg !2758
  ret void, !dbg !2759
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_kyber_shake256_prf(ptr noundef %out, i32 noundef %outlen, ptr noundef %key, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !2760 {
entry:
  %extkey = alloca [33 x i8], align 1
    #dbg_value(ptr %out, !2763, !DIExpression(), !2764)
    #dbg_value(i32 %outlen, !2765, !DIExpression(), !2764)
    #dbg_value(ptr %key, !2766, !DIExpression(), !2764)
    #dbg_value(i8 %nonce, !2767, !DIExpression(), !2764)
    #dbg_declare(ptr %extkey, !2768, !DIExpression(), !2772)
  %call = call ptr @memcpy(ptr noundef nonnull %extkey, ptr noundef %key, i32 noundef 32) #4, !dbg !2773
  %arrayidx = getelementptr inbounds nuw i8, ptr %extkey, i32 32, !dbg !2774
  store i8 %nonce, ptr %arrayidx, align 1, !dbg !2775
  call void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef nonnull %extkey, i32 noundef 33) #3, !dbg !2776
  ret void, !dbg !2777
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_kyber_shake256_rkprf(ptr noundef %out, ptr noundef %key, ptr noundef %input) local_unnamed_addr #0 !dbg !2778 {
entry:
  %s = alloca [26 x i64], align 8
    #dbg_value(ptr %out, !2779, !DIExpression(), !2780)
    #dbg_value(ptr %key, !2781, !DIExpression(), !2780)
    #dbg_value(ptr %input, !2782, !DIExpression(), !2780)
    #dbg_declare(ptr %s, !2783, !DIExpression(), !2784)
  call void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef nonnull %s) #3, !dbg !2785
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef nonnull %s, ptr noundef %key, i32 noundef 32) #3, !dbg !2786
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef nonnull %s, ptr noundef %input, i32 noundef 1088) #3, !dbg !2787
  call void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef nonnull %s) #3, !dbg !2788
  call void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef 32, ptr noundef nonnull %s) #3, !dbg !2789
  ret void, !dbg !2790
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umax.i32(i32, i32) #2

attributes #0 = { nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+thumb-mode,+vfp2sp,+vfp3d16sp,+vfp4d16sp" }
attributes #1 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+thumb-mode,+vfp2sp,+vfp3d16sp,+vfp4d16sp" }
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
!3 = !DIFile(filename: "../../../ref/randombytes.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
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
!15 = distinct !DICompileUnit(language: DW_LANG_C11, file: !16, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !17, splitDebugInlining: false, nameTableKind: None)
!16 = !DIFile(filename: "../../../ref/<stdin>", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
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
!27 = distinct !DIGlobalVariable(name: "pqcrystals_kyber768_ref_zetas", scope: !28, file: !33, line: 39, type: !34, isLocal: false, isDefinition: true)
!28 = distinct !DICompileUnit(language: DW_LANG_C11, file: !16, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !29, globals: !32, splitDebugInlining: false, nameTableKind: None)
!29 = !{!30}
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !8, line: 44, baseType: !31)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !10, line: 77, baseType: !25)
!32 = !{!26}
!33 = !DIFile(filename: "../../../ref/ntt.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !35, size: 2048, elements: !39)
!35 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !36)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !8, line: 32, baseType: !37)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !10, line: 55, baseType: !38)
!38 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!39 = !{!40}
!40 = !DISubrange(count: 128)
!41 = !DIGlobalVariableExpression(var: !42, expr: !DIExpression())
!42 = distinct !DIGlobalVariable(name: "KeccakF_RoundConstants", scope: !43, file: !49, line: 49, type: !50, isLocal: true, isDefinition: true)
!43 = distinct !DICompileUnit(language: DW_LANG_C11, file: !16, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !44, globals: !48, splitDebugInlining: false, nameTableKind: None)
!44 = !{!45}
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !8, line: 60, baseType: !46)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !10, line: 105, baseType: !47)
!47 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!48 = !{!41}
!49 = !DIFile(filename: "../../../ref/fips202.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 1536, elements: !52)
!51 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !45)
!52 = !{!53}
!53 = !DISubrange(count: 24)
!54 = distinct !DICompileUnit(language: DW_LANG_C11, file: !55, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !56, splitDebugInlining: false, nameTableKind: None)
!55 = !DIFile(filename: "../../../ref/test/<stdin>", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!56 = !{!6}
!57 = distinct !DICompileUnit(language: DW_LANG_C11, file: !16, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!58 = distinct !DICompileUnit(language: DW_LANG_C11, file: !16, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !59, splitDebugInlining: false, nameTableKind: None)
!59 = !{!60}
!60 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !8, line: 36, baseType: !61)
!61 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !10, line: 57, baseType: !62)
!62 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!63 = distinct !DICompileUnit(language: DW_LANG_C11, file: !16, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !64, splitDebugInlining: false, nameTableKind: None)
!64 = !{!36, !60, !65}
!65 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !8, line: 48, baseType: !66)
!66 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !10, line: 79, baseType: !14)
!67 = distinct !DICompileUnit(language: DW_LANG_C11, file: !16, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !68, splitDebugInlining: false, nameTableKind: None)
!68 = !{!60, !36, !30}
!69 = distinct !DICompileUnit(language: DW_LANG_C11, file: !16, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !70, splitDebugInlining: false, nameTableKind: None)
!70 = !{!65}
!71 = distinct !DICompileUnit(language: DW_LANG_C11, file: !16, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !72, splitDebugInlining: false, nameTableKind: None)
!72 = !{!36, !30}
!73 = distinct !DICompileUnit(language: DW_LANG_C11, file: !16, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !44, splitDebugInlining: false, nameTableKind: None)
!74 = distinct !DICompileUnit(language: DW_LANG_C11, file: !16, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!75 = !{!"Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)"}
!76 = !{i32 2, !"Debug Info Version", i32 3}
!77 = !{i32 1, !"wchar_size", i32 4}
!78 = !{i32 1, !"min_enum_size", i32 4}
!79 = !{i32 1, !"Code Model", i32 1}
!80 = distinct !DISubprogram(name: "main", scope: !81, file: !81, line: 97, type: !82, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !54, retainedNodes: !24)
!81 = !DIFile(filename: "../../../ref/test/test_kyber.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
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
!109 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 9472, elements: !110)
!110 = !{!111}
!111 = !DISubrange(count: 1184)
!112 = !DILocation(line: 11, column: 11, scope: !107)
!113 = !DILocalVariable(name: "sk", scope: !107, file: !81, line: 12, type: !114)
!114 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 19200, elements: !115)
!115 = !{!116}
!116 = !DISubrange(count: 2400)
!117 = !DILocation(line: 12, column: 11, scope: !107)
!118 = !DILocalVariable(name: "ct", scope: !107, file: !81, line: 13, type: !119)
!119 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 8704, elements: !120)
!120 = !{!121}
!121 = !DISubrange(count: 1088)
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
!231 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_keypair_derand", scope: !232, file: !232, line: 25, type: !233, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !24)
!232 = !DIFile(filename: "../../../ref/kem.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
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
!249 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_keypair", scope: !232, file: !232, line: 50, type: !250, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !24)
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
!263 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_enc_derand", scope: !232, file: !232, line: 76, type: !264, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !24)
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
!282 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_enc", scope: !232, file: !232, line: 113, type: !233, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !24)
!283 = !DILocalVariable(name: "ct", arg: 1, scope: !282, file: !232, line: 113, type: !6)
!284 = !DILocation(line: 0, scope: !282)
!285 = !DILocalVariable(name: "ss", arg: 2, scope: !282, file: !232, line: 114, type: !6)
!286 = !DILocalVariable(name: "pk", arg: 3, scope: !282, file: !232, line: 115, type: !235)
!287 = !DILocalVariable(name: "coins", scope: !282, file: !232, line: 117, type: !124)
!288 = !DILocation(line: 117, column: 11, scope: !282)
!289 = !DILocation(line: 118, column: 3, scope: !282)
!290 = !DILocation(line: 119, column: 3, scope: !282)
!291 = !DILocation(line: 120, column: 3, scope: !282)
!292 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_dec", scope: !232, file: !232, line: 140, type: !293, scopeLine: 143, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !24)
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
!320 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_gen_matrix", scope: !321, file: !321, line: 165, type: !322, scopeLine: 166, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !58, retainedNodes: !24)
!321 = !DIFile(filename: "../../../ref/indcpa.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!322 = !DISubroutineType(types: !323)
!323 = !{null, !324, !235, !25}
!324 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !325, size: 32)
!325 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyvec", file: !326, line: 8, baseType: !327)
!326 = !DIFile(filename: "../../../ref/polyvec.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!327 = !DICompositeType(tag: DW_TAG_array_type, baseType: !328, size: 12288, elements: !333)
!328 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !329, line: 11, baseType: !330)
!329 = !DIFile(filename: "../../../ref/poly.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!330 = !DICompositeType(tag: DW_TAG_array_type, baseType: !36, size: 4096, elements: !331)
!331 = !{!332}
!332 = !DISubrange(count: 256)
!333 = !{!334}
!334 = !DISubrange(count: 3)
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
!346 = !DIFile(filename: "../../../ref/symmetric.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!347 = !DIDerivedType(tag: DW_TAG_typedef, name: "keccak_state", file: !348, line: 14, baseType: !349)
!348 = !DIFile(filename: "../../../ref/fips202.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
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
!442 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_indcpa_keypair_derand", scope: !321, file: !321, line: 205, type: !443, scopeLine: 207, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !58, retainedNodes: !24)
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
!456 = !DICompositeType(tag: DW_TAG_array_type, baseType: !325, size: 36864, elements: !333)
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
!537 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_indcpa_enc", scope: !321, file: !321, line: 257, type: !538, scopeLine: 260, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !58, retainedNodes: !24)
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
!641 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_indcpa_dec", scope: !321, file: !321, line: 310, type: !642, scopeLine: 312, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !58, retainedNodes: !24)
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
!684 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_compress", scope: !685, file: !685, line: 15, type: !686, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!685 = !DIFile(filename: "../../../ref/polyvec.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
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
!776 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_decompress", scope: !685, file: !685, line: 91, type: !677, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
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
!858 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_tobytes", scope: !685, file: !685, line: 141, type: !686, scopeLine: 141, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
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
!878 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_frombytes", scope: !685, file: !685, line: 157, type: !677, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
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
!898 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_ntt", scope: !685, file: !685, line: 170, type: !899, scopeLine: 170, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
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
!917 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_invntt_tomont", scope: !685, file: !685, line: 184, type: !899, scopeLine: 184, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
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
!934 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery", scope: !685, file: !685, line: 200, type: !935, scopeLine: 201, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
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
!945 = !DILocation(line: 206, column: 8, scope: !946)
!946 = distinct !DILexicalBlock(scope: !934, file: !685, line: 206, column: 3)
!947 = !DILocation(line: 206, scope: !946)
!948 = !DILocation(line: 206, column: 17, scope: !949)
!949 = distinct !DILexicalBlock(scope: !946, file: !685, line: 206, column: 3)
!950 = !DILocation(line: 206, column: 3, scope: !946)
!951 = !DILocation(line: 207, column: 34, scope: !952)
!952 = distinct !DILexicalBlock(scope: !949, file: !685, line: 206, column: 33)
!953 = !DILocation(line: 207, column: 44, scope: !952)
!954 = !DILocation(line: 207, column: 5, scope: !952)
!955 = !DILocation(line: 208, column: 5, scope: !952)
!956 = !DILocation(line: 206, column: 29, scope: !949)
!957 = !DILocation(line: 206, column: 3, scope: !949)
!958 = distinct !{!958, !950, !959, !105}
!959 = !DILocation(line: 209, column: 3, scope: !946)
!960 = !DILocation(line: 211, column: 3, scope: !934)
!961 = !DILocation(line: 212, column: 1, scope: !934)
!962 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_reduce", scope: !685, file: !685, line: 223, type: !899, scopeLine: 223, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!963 = !DILocalVariable(name: "r", arg: 1, scope: !962, file: !685, line: 223, type: !324)
!964 = !DILocation(line: 0, scope: !962)
!965 = !DILocalVariable(name: "i", scope: !962, file: !685, line: 224, type: !14)
!966 = !DILocation(line: 225, column: 8, scope: !967)
!967 = distinct !DILexicalBlock(scope: !962, file: !685, line: 225, column: 3)
!968 = !DILocation(line: 225, scope: !967)
!969 = !DILocation(line: 225, column: 17, scope: !970)
!970 = distinct !DILexicalBlock(scope: !967, file: !685, line: 225, column: 3)
!971 = !DILocation(line: 225, column: 3, scope: !967)
!972 = !DILocation(line: 226, column: 18, scope: !970)
!973 = !DILocation(line: 226, column: 5, scope: !970)
!974 = !DILocation(line: 225, column: 29, scope: !970)
!975 = !DILocation(line: 225, column: 3, scope: !970)
!976 = distinct !{!976, !971, !977, !105}
!977 = !DILocation(line: 226, column: 25, scope: !967)
!978 = !DILocation(line: 227, column: 1, scope: !962)
!979 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_add", scope: !685, file: !685, line: 238, type: !980, scopeLine: 238, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!980 = !DISubroutineType(types: !981)
!981 = !{null, !324, !688, !688}
!982 = !DILocalVariable(name: "r", arg: 1, scope: !979, file: !685, line: 238, type: !324)
!983 = !DILocation(line: 0, scope: !979)
!984 = !DILocalVariable(name: "a", arg: 2, scope: !979, file: !685, line: 238, type: !688)
!985 = !DILocalVariable(name: "b", arg: 3, scope: !979, file: !685, line: 238, type: !688)
!986 = !DILocalVariable(name: "i", scope: !979, file: !685, line: 239, type: !14)
!987 = !DILocation(line: 240, column: 8, scope: !988)
!988 = distinct !DILexicalBlock(scope: !979, file: !685, line: 240, column: 3)
!989 = !DILocation(line: 240, scope: !988)
!990 = !DILocation(line: 240, column: 17, scope: !991)
!991 = distinct !DILexicalBlock(scope: !988, file: !685, line: 240, column: 3)
!992 = !DILocation(line: 240, column: 3, scope: !988)
!993 = !DILocation(line: 241, column: 15, scope: !991)
!994 = !DILocation(line: 241, column: 25, scope: !991)
!995 = !DILocation(line: 241, column: 35, scope: !991)
!996 = !DILocation(line: 241, column: 5, scope: !991)
!997 = !DILocation(line: 240, column: 29, scope: !991)
!998 = !DILocation(line: 240, column: 3, scope: !991)
!999 = distinct !{!999, !992, !1000, !105}
!1000 = !DILocation(line: 241, column: 42, scope: !988)
!1001 = !DILocation(line: 242, column: 1, scope: !979)
!1002 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_compress", scope: !1003, file: !1003, line: 19, type: !1004, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1003 = !DIFile(filename: "../../../ref/poly.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!1004 = !DISubroutineType(types: !1005)
!1005 = !{null, !6, !1006}
!1006 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1007, size: 32)
!1007 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !328)
!1008 = !DILocalVariable(name: "r", arg: 1, scope: !1002, file: !1003, line: 19, type: !6)
!1009 = !DILocation(line: 0, scope: !1002)
!1010 = !DILocalVariable(name: "a", arg: 2, scope: !1002, file: !1003, line: 19, type: !1006)
!1011 = !DILocalVariable(name: "t", scope: !1002, file: !1003, line: 23, type: !1012)
!1012 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 64, elements: !1013)
!1013 = !{!1014}
!1014 = !DISubrange(count: 8)
!1015 = !DILocation(line: 23, column: 11, scope: !1002)
!1016 = !DILocalVariable(name: "i", scope: !1002, file: !1003, line: 20, type: !14)
!1017 = !DILocation(line: 27, column: 8, scope: !1018)
!1018 = distinct !DILexicalBlock(scope: !1002, file: !1003, line: 27, column: 3)
!1019 = !DILocation(line: 27, scope: !1018)
!1020 = !DILocation(line: 27, column: 17, scope: !1021)
!1021 = distinct !DILexicalBlock(scope: !1018, file: !1003, line: 27, column: 3)
!1022 = !DILocation(line: 27, column: 3, scope: !1018)
!1023 = !DILocation(line: 28, column: 5, scope: !1024)
!1024 = distinct !DILexicalBlock(scope: !1025, file: !1003, line: 28, column: 5)
!1025 = distinct !DILexicalBlock(scope: !1021, file: !1003, line: 27, column: 37)
!1026 = !DILocation(line: 28, scope: !1024)
!1027 = !DILocalVariable(name: "j", scope: !1002, file: !1003, line: 20, type: !14)
!1028 = !DILocation(line: 28, column: 19, scope: !1029)
!1029 = distinct !DILexicalBlock(scope: !1024, file: !1003, line: 28, column: 5)
!1030 = !DILocation(line: 30, column: 18, scope: !1031)
!1031 = distinct !DILexicalBlock(scope: !1029, file: !1003, line: 28, column: 29)
!1032 = !DILocation(line: 30, column: 22, scope: !1031)
!1033 = !DILocation(line: 30, column: 11, scope: !1031)
!1034 = !DILocalVariable(name: "u", scope: !1002, file: !1003, line: 21, type: !36)
!1035 = !DILocation(line: 31, column: 22, scope: !1031)
!1036 = !DILocation(line: 31, column: 9, scope: !1031)
!1037 = !DILocation(line: 33, column: 12, scope: !1031)
!1038 = !DILocalVariable(name: "d0", scope: !1002, file: !1003, line: 22, type: !65)
!1039 = !DILocation(line: 35, column: 10, scope: !1031)
!1040 = !DILocation(line: 36, column: 10, scope: !1031)
!1041 = !DILocation(line: 37, column: 14, scope: !1031)
!1042 = !DILocation(line: 37, column: 7, scope: !1031)
!1043 = !DILocation(line: 37, column: 12, scope: !1031)
!1044 = !DILocation(line: 28, column: 25, scope: !1029)
!1045 = !DILocation(line: 28, column: 5, scope: !1029)
!1046 = distinct !{!1046, !1023, !1047, !105}
!1047 = !DILocation(line: 38, column: 5, scope: !1024)
!1048 = !DILocation(line: 40, column: 12, scope: !1025)
!1049 = !DILocation(line: 40, column: 20, scope: !1025)
!1050 = !DILocation(line: 40, column: 25, scope: !1025)
!1051 = !DILocation(line: 40, column: 17, scope: !1025)
!1052 = !DILocation(line: 40, column: 10, scope: !1025)
!1053 = !DILocation(line: 41, column: 12, scope: !1025)
!1054 = !DILocation(line: 41, column: 20, scope: !1025)
!1055 = !DILocation(line: 41, column: 25, scope: !1025)
!1056 = !DILocation(line: 41, column: 17, scope: !1025)
!1057 = !DILocation(line: 41, column: 5, scope: !1025)
!1058 = !DILocation(line: 41, column: 10, scope: !1025)
!1059 = !DILocation(line: 42, column: 12, scope: !1025)
!1060 = !DILocation(line: 42, column: 20, scope: !1025)
!1061 = !DILocation(line: 42, column: 25, scope: !1025)
!1062 = !DILocation(line: 42, column: 17, scope: !1025)
!1063 = !DILocation(line: 42, column: 5, scope: !1025)
!1064 = !DILocation(line: 42, column: 10, scope: !1025)
!1065 = !DILocation(line: 43, column: 12, scope: !1025)
!1066 = !DILocation(line: 43, column: 20, scope: !1025)
!1067 = !DILocation(line: 43, column: 25, scope: !1025)
!1068 = !DILocation(line: 43, column: 17, scope: !1025)
!1069 = !DILocation(line: 43, column: 5, scope: !1025)
!1070 = !DILocation(line: 43, column: 10, scope: !1025)
!1071 = !DILocation(line: 44, column: 7, scope: !1025)
!1072 = !DILocation(line: 27, column: 33, scope: !1021)
!1073 = !DILocation(line: 27, column: 3, scope: !1021)
!1074 = distinct !{!1074, !1022, !1075, !105}
!1075 = !DILocation(line: 45, column: 3, scope: !1018)
!1076 = !DILocation(line: 70, column: 1, scope: !1002)
!1077 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_decompress", scope: !1003, file: !1003, line: 82, type: !1078, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1078 = !DISubroutineType(types: !1079)
!1079 = !{null, !632, !235}
!1080 = !DILocalVariable(name: "r", arg: 1, scope: !1077, file: !1003, line: 82, type: !632)
!1081 = !DILocation(line: 0, scope: !1077)
!1082 = !DILocalVariable(name: "a", arg: 2, scope: !1077, file: !1003, line: 82, type: !235)
!1083 = !DILocalVariable(name: "i", scope: !1077, file: !1003, line: 83, type: !14)
!1084 = !DILocation(line: 86, column: 8, scope: !1085)
!1085 = distinct !DILexicalBlock(scope: !1077, file: !1003, line: 86, column: 3)
!1086 = !DILocation(line: 86, scope: !1085)
!1087 = !DILocation(line: 86, column: 17, scope: !1088)
!1088 = distinct !DILexicalBlock(scope: !1085, file: !1003, line: 86, column: 3)
!1089 = !DILocation(line: 86, column: 3, scope: !1085)
!1090 = !DILocation(line: 87, column: 36, scope: !1091)
!1091 = distinct !DILexicalBlock(scope: !1088, file: !1003, line: 86, column: 37)
!1092 = !DILocation(line: 87, column: 41, scope: !1091)
!1093 = !DILocation(line: 87, column: 25, scope: !1091)
!1094 = !DILocation(line: 87, column: 47, scope: !1091)
!1095 = !DILocation(line: 87, column: 58, scope: !1091)
!1096 = !DILocation(line: 87, column: 63, scope: !1091)
!1097 = !DILocation(line: 87, column: 23, scope: !1091)
!1098 = !DILocation(line: 87, column: 12, scope: !1091)
!1099 = !DILocation(line: 87, column: 5, scope: !1091)
!1100 = !DILocation(line: 87, column: 21, scope: !1091)
!1101 = !DILocation(line: 88, column: 36, scope: !1091)
!1102 = !DILocation(line: 88, column: 41, scope: !1091)
!1103 = !DILocation(line: 88, column: 25, scope: !1091)
!1104 = !DILocation(line: 88, column: 47, scope: !1091)
!1105 = !DILocation(line: 88, column: 58, scope: !1091)
!1106 = !DILocation(line: 88, column: 63, scope: !1091)
!1107 = !DILocation(line: 88, column: 23, scope: !1091)
!1108 = !DILocation(line: 88, column: 12, scope: !1091)
!1109 = !DILocation(line: 88, column: 16, scope: !1091)
!1110 = !DILocation(line: 88, column: 5, scope: !1091)
!1111 = !DILocation(line: 88, column: 21, scope: !1091)
!1112 = !DILocation(line: 89, column: 7, scope: !1091)
!1113 = !DILocation(line: 86, column: 33, scope: !1088)
!1114 = !DILocation(line: 86, column: 3, scope: !1088)
!1115 = distinct !{!1115, !1089, !1116, !105}
!1116 = !DILocation(line: 90, column: 3, scope: !1085)
!1117 = !DILocation(line: 111, column: 1, scope: !1077)
!1118 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_tobytes", scope: !1003, file: !1003, line: 122, type: !1004, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1119 = !DILocalVariable(name: "r", arg: 1, scope: !1118, file: !1003, line: 122, type: !6)
!1120 = !DILocation(line: 0, scope: !1118)
!1121 = !DILocalVariable(name: "a", arg: 2, scope: !1118, file: !1003, line: 122, type: !1006)
!1122 = !DILocalVariable(name: "i", scope: !1118, file: !1003, line: 123, type: !14)
!1123 = !DILocation(line: 126, column: 8, scope: !1124)
!1124 = distinct !DILexicalBlock(scope: !1118, file: !1003, line: 126, column: 3)
!1125 = !DILocation(line: 126, scope: !1124)
!1126 = !DILocation(line: 126, column: 17, scope: !1127)
!1127 = distinct !DILexicalBlock(scope: !1124, file: !1003, line: 126, column: 3)
!1128 = !DILocation(line: 126, column: 3, scope: !1124)
!1129 = !DILocation(line: 128, column: 17, scope: !1130)
!1130 = distinct !DILexicalBlock(scope: !1127, file: !1003, line: 126, column: 37)
!1131 = !DILocation(line: 128, column: 10, scope: !1130)
!1132 = !DILocalVariable(name: "t0", scope: !1118, file: !1003, line: 124, type: !60)
!1133 = !DILocation(line: 129, column: 31, scope: !1130)
!1134 = !DILocation(line: 129, column: 8, scope: !1130)
!1135 = !DILocation(line: 130, column: 17, scope: !1130)
!1136 = !DILocation(line: 130, column: 21, scope: !1130)
!1137 = !DILocation(line: 130, column: 10, scope: !1130)
!1138 = !DILocalVariable(name: "t1", scope: !1118, file: !1003, line: 124, type: !60)
!1139 = !DILocation(line: 131, column: 31, scope: !1130)
!1140 = !DILocation(line: 131, column: 8, scope: !1130)
!1141 = !DILocation(line: 132, column: 20, scope: !1130)
!1142 = !DILocation(line: 132, column: 9, scope: !1130)
!1143 = !DILocation(line: 132, column: 5, scope: !1130)
!1144 = !DILocation(line: 132, column: 18, scope: !1130)
!1145 = !DILocation(line: 133, column: 24, scope: !1130)
!1146 = !DILocation(line: 133, column: 33, scope: !1130)
!1147 = !DILocation(line: 133, column: 36, scope: !1130)
!1148 = !DILocation(line: 133, column: 30, scope: !1130)
!1149 = !DILocation(line: 133, column: 9, scope: !1130)
!1150 = !DILocation(line: 133, column: 5, scope: !1130)
!1151 = !DILocation(line: 133, column: 18, scope: !1130)
!1152 = !DILocation(line: 134, column: 24, scope: !1130)
!1153 = !DILocation(line: 134, column: 20, scope: !1130)
!1154 = !DILocation(line: 134, column: 9, scope: !1130)
!1155 = !DILocation(line: 134, column: 5, scope: !1130)
!1156 = !DILocation(line: 134, column: 18, scope: !1130)
!1157 = !DILocation(line: 126, column: 33, scope: !1127)
!1158 = !DILocation(line: 126, column: 3, scope: !1127)
!1159 = distinct !{!1159, !1128, !1160, !105}
!1160 = !DILocation(line: 135, column: 3, scope: !1124)
!1161 = !DILocation(line: 136, column: 1, scope: !1118)
!1162 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_frombytes", scope: !1003, file: !1003, line: 148, type: !1078, scopeLine: 148, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1163 = !DILocalVariable(name: "r", arg: 1, scope: !1162, file: !1003, line: 148, type: !632)
!1164 = !DILocation(line: 0, scope: !1162)
!1165 = !DILocalVariable(name: "a", arg: 2, scope: !1162, file: !1003, line: 148, type: !235)
!1166 = !DILocalVariable(name: "i", scope: !1162, file: !1003, line: 149, type: !14)
!1167 = !DILocation(line: 150, column: 8, scope: !1168)
!1168 = distinct !DILexicalBlock(scope: !1162, file: !1003, line: 150, column: 3)
!1169 = !DILocation(line: 150, scope: !1168)
!1170 = !DILocation(line: 150, column: 17, scope: !1171)
!1171 = distinct !DILexicalBlock(scope: !1168, file: !1003, line: 150, column: 3)
!1172 = !DILocation(line: 150, column: 3, scope: !1168)
!1173 = !DILocation(line: 151, column: 25, scope: !1174)
!1174 = distinct !DILexicalBlock(scope: !1171, file: !1003, line: 150, column: 37)
!1175 = !DILocation(line: 151, column: 21, scope: !1174)
!1176 = !DILocation(line: 151, column: 57, scope: !1174)
!1177 = !DILocation(line: 151, column: 53, scope: !1174)
!1178 = !DILocation(line: 151, column: 43, scope: !1174)
!1179 = !DILocation(line: 151, column: 66, scope: !1174)
!1180 = !DILocation(line: 151, column: 73, scope: !1174)
!1181 = !DILocation(line: 151, column: 12, scope: !1174)
!1182 = !DILocation(line: 151, column: 5, scope: !1174)
!1183 = !DILocation(line: 151, column: 17, scope: !1174)
!1184 = !DILocation(line: 153, column: 15, scope: !1174)
!1185 = !DILocation(line: 153, column: 11, scope: !1174)
!1186 = !DILocation(line: 153, column: 24, scope: !1174)
!1187 = !DILocation(line: 153, column: 47, scope: !1174)
!1188 = !DILocation(line: 153, column: 43, scope: !1174)
!1189 = !DILocation(line: 153, column: 33, scope: !1174)
!1190 = !DILocation(line: 153, column: 56, scope: !1174)
!1191 = !DILocation(line: 153, column: 30, scope: !1174)
!1192 = !DILocation(line: 152, column: 12, scope: !1174)
!1193 = !DILocation(line: 152, column: 16, scope: !1174)
!1194 = !DILocation(line: 152, column: 5, scope: !1174)
!1195 = !DILocation(line: 152, column: 21, scope: !1174)
!1196 = !DILocation(line: 150, column: 33, scope: !1171)
!1197 = !DILocation(line: 150, column: 3, scope: !1171)
!1198 = distinct !{!1198, !1172, !1199, !105}
!1199 = !DILocation(line: 154, column: 3, scope: !1168)
!1200 = !DILocation(line: 155, column: 1, scope: !1162)
!1201 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_frommsg", scope: !1003, file: !1003, line: 165, type: !1078, scopeLine: 165, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1202 = !DILocalVariable(name: "r", arg: 1, scope: !1201, file: !1003, line: 165, type: !632)
!1203 = !DILocation(line: 0, scope: !1201)
!1204 = !DILocalVariable(name: "msg", arg: 2, scope: !1201, file: !1003, line: 165, type: !235)
!1205 = !DILocalVariable(name: "i", scope: !1201, file: !1003, line: 166, type: !14)
!1206 = !DILocation(line: 172, column: 8, scope: !1207)
!1207 = distinct !DILexicalBlock(scope: !1201, file: !1003, line: 172, column: 3)
!1208 = !DILocation(line: 172, scope: !1207)
!1209 = !DILocation(line: 172, column: 17, scope: !1210)
!1210 = distinct !DILexicalBlock(scope: !1207, file: !1003, line: 172, column: 3)
!1211 = !DILocation(line: 172, column: 3, scope: !1207)
!1212 = !DILocation(line: 173, column: 5, scope: !1213)
!1213 = distinct !DILexicalBlock(scope: !1214, file: !1003, line: 173, column: 5)
!1214 = distinct !DILexicalBlock(scope: !1210, file: !1003, line: 172, column: 37)
!1215 = !DILocation(line: 173, scope: !1213)
!1216 = !DILocalVariable(name: "j", scope: !1201, file: !1003, line: 166, type: !14)
!1217 = !DILocation(line: 173, column: 19, scope: !1218)
!1218 = distinct !DILexicalBlock(scope: !1213, file: !1003, line: 173, column: 5)
!1219 = !DILocation(line: 174, column: 14, scope: !1220)
!1220 = distinct !DILexicalBlock(scope: !1218, file: !1003, line: 173, column: 29)
!1221 = !DILocation(line: 174, column: 18, scope: !1220)
!1222 = !DILocation(line: 174, column: 7, scope: !1220)
!1223 = !DILocation(line: 174, column: 23, scope: !1220)
!1224 = !DILocation(line: 175, column: 23, scope: !1220)
!1225 = !DILocation(line: 175, column: 31, scope: !1220)
!1226 = !DILocation(line: 175, column: 58, scope: !1220)
!1227 = !DILocation(line: 175, column: 65, scope: !1220)
!1228 = !DILocation(line: 175, column: 57, scope: !1220)
!1229 = !DILocation(line: 175, column: 7, scope: !1220)
!1230 = !DILocation(line: 173, column: 25, scope: !1218)
!1231 = !DILocation(line: 173, column: 5, scope: !1218)
!1232 = distinct !{!1232, !1212, !1233, !105}
!1233 = !DILocation(line: 176, column: 5, scope: !1213)
!1234 = !DILocation(line: 172, column: 33, scope: !1210)
!1235 = !DILocation(line: 172, column: 3, scope: !1210)
!1236 = distinct !{!1236, !1211, !1237, !105}
!1237 = !DILocation(line: 177, column: 3, scope: !1207)
!1238 = !DILocation(line: 178, column: 1, scope: !1201)
!1239 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_tomsg", scope: !1003, file: !1003, line: 188, type: !1004, scopeLine: 188, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1240 = !DILocalVariable(name: "msg", arg: 1, scope: !1239, file: !1003, line: 188, type: !6)
!1241 = !DILocation(line: 0, scope: !1239)
!1242 = !DILocalVariable(name: "a", arg: 2, scope: !1239, file: !1003, line: 188, type: !1006)
!1243 = !DILocalVariable(name: "i", scope: !1239, file: !1003, line: 189, type: !14)
!1244 = !DILocation(line: 192, column: 8, scope: !1245)
!1245 = distinct !DILexicalBlock(scope: !1239, file: !1003, line: 192, column: 3)
!1246 = !DILocation(line: 192, scope: !1245)
!1247 = !DILocation(line: 192, column: 17, scope: !1248)
!1248 = distinct !DILexicalBlock(scope: !1245, file: !1003, line: 192, column: 3)
!1249 = !DILocation(line: 192, column: 3, scope: !1245)
!1250 = !DILocation(line: 193, column: 5, scope: !1251)
!1251 = distinct !DILexicalBlock(scope: !1248, file: !1003, line: 192, column: 37)
!1252 = !DILocation(line: 193, column: 12, scope: !1251)
!1253 = !DILocalVariable(name: "j", scope: !1239, file: !1003, line: 189, type: !14)
!1254 = !DILocation(line: 194, column: 10, scope: !1255)
!1255 = distinct !DILexicalBlock(scope: !1251, file: !1003, line: 194, column: 5)
!1256 = !DILocation(line: 194, scope: !1255)
!1257 = !DILocation(line: 194, column: 19, scope: !1258)
!1258 = distinct !DILexicalBlock(scope: !1255, file: !1003, line: 194, column: 5)
!1259 = !DILocation(line: 194, column: 5, scope: !1255)
!1260 = !DILocation(line: 195, column: 18, scope: !1261)
!1261 = distinct !DILexicalBlock(scope: !1258, file: !1003, line: 194, column: 29)
!1262 = !DILocation(line: 195, column: 22, scope: !1261)
!1263 = !DILocation(line: 195, column: 11, scope: !1261)
!1264 = !DILocalVariable(name: "t", scope: !1239, file: !1003, line: 190, type: !65)
!1265 = !DILocation(line: 200, column: 9, scope: !1261)
!1266 = !DILocation(line: 201, column: 9, scope: !1261)
!1267 = !DILocation(line: 202, column: 9, scope: !1261)
!1268 = !DILocation(line: 203, column: 19, scope: !1261)
!1269 = !DILocation(line: 203, column: 7, scope: !1261)
!1270 = !DILocation(line: 203, column: 14, scope: !1261)
!1271 = !DILocation(line: 194, column: 25, scope: !1258)
!1272 = !DILocation(line: 194, column: 5, scope: !1258)
!1273 = distinct !{!1273, !1259, !1274, !105}
!1274 = !DILocation(line: 204, column: 5, scope: !1255)
!1275 = !DILocation(line: 192, column: 33, scope: !1248)
!1276 = !DILocation(line: 192, column: 3, scope: !1248)
!1277 = distinct !{!1277, !1249, !1278, !105}
!1278 = !DILocation(line: 205, column: 3, scope: !1245)
!1279 = !DILocation(line: 206, column: 1, scope: !1239)
!1280 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_getnoise_eta1", scope: !1003, file: !1003, line: 220, type: !1281, scopeLine: 221, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1281 = !DISubroutineType(types: !1282)
!1282 = !{null, !632, !235, !7}
!1283 = !DILocalVariable(name: "r", arg: 1, scope: !1280, file: !1003, line: 220, type: !632)
!1284 = !DILocation(line: 0, scope: !1280)
!1285 = !DILocalVariable(name: "seed", arg: 2, scope: !1280, file: !1003, line: 220, type: !235)
!1286 = !DILocalVariable(name: "nonce", arg: 3, scope: !1280, file: !1003, line: 221, type: !7)
!1287 = !DILocalVariable(name: "buf", scope: !1280, file: !1003, line: 222, type: !1288)
!1288 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1024, elements: !39)
!1289 = !DILocation(line: 222, column: 11, scope: !1280)
!1290 = !DILocation(line: 223, column: 3, scope: !1280)
!1291 = !DILocation(line: 224, column: 3, scope: !1280)
!1292 = !DILocation(line: 225, column: 1, scope: !1280)
!1293 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_getnoise_eta2", scope: !1003, file: !1003, line: 239, type: !1281, scopeLine: 240, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1294 = !DILocalVariable(name: "r", arg: 1, scope: !1293, file: !1003, line: 239, type: !632)
!1295 = !DILocation(line: 0, scope: !1293)
!1296 = !DILocalVariable(name: "seed", arg: 2, scope: !1293, file: !1003, line: 239, type: !235)
!1297 = !DILocalVariable(name: "nonce", arg: 3, scope: !1293, file: !1003, line: 240, type: !7)
!1298 = !DILocalVariable(name: "buf", scope: !1293, file: !1003, line: 241, type: !1288)
!1299 = !DILocation(line: 241, column: 11, scope: !1293)
!1300 = !DILocation(line: 242, column: 3, scope: !1293)
!1301 = !DILocation(line: 243, column: 3, scope: !1293)
!1302 = !DILocation(line: 244, column: 1, scope: !1293)
!1303 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_ntt", scope: !1003, file: !1003, line: 256, type: !1304, scopeLine: 256, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1304 = !DISubroutineType(types: !1305)
!1305 = !{null, !632}
!1306 = !DILocalVariable(name: "r", arg: 1, scope: !1303, file: !1003, line: 256, type: !632)
!1307 = !DILocation(line: 0, scope: !1303)
!1308 = !DILocation(line: 257, column: 3, scope: !1303)
!1309 = !DILocation(line: 258, column: 3, scope: !1303)
!1310 = !DILocation(line: 259, column: 1, scope: !1303)
!1311 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_reduce", scope: !1003, file: !1003, line: 314, type: !1304, scopeLine: 314, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1312 = !DILocalVariable(name: "r", arg: 1, scope: !1311, file: !1003, line: 314, type: !632)
!1313 = !DILocation(line: 0, scope: !1311)
!1314 = !DILocalVariable(name: "i", scope: !1311, file: !1003, line: 315, type: !14)
!1315 = !DILocation(line: 316, column: 8, scope: !1316)
!1316 = distinct !DILexicalBlock(scope: !1311, file: !1003, line: 316, column: 3)
!1317 = !DILocation(line: 316, scope: !1316)
!1318 = !DILocation(line: 316, column: 17, scope: !1319)
!1319 = distinct !DILexicalBlock(scope: !1316, file: !1003, line: 316, column: 3)
!1320 = !DILocation(line: 316, column: 3, scope: !1316)
!1321 = !DILocation(line: 317, column: 30, scope: !1319)
!1322 = !DILocation(line: 317, column: 15, scope: !1319)
!1323 = !DILocation(line: 317, column: 5, scope: !1319)
!1324 = !DILocation(line: 317, column: 13, scope: !1319)
!1325 = !DILocation(line: 316, column: 29, scope: !1319)
!1326 = !DILocation(line: 316, column: 3, scope: !1319)
!1327 = distinct !{!1327, !1320, !1328, !105}
!1328 = !DILocation(line: 317, column: 37, scope: !1316)
!1329 = !DILocation(line: 318, column: 1, scope: !1311)
!1330 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_invntt_tomont", scope: !1003, file: !1003, line: 271, type: !1304, scopeLine: 271, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1331 = !DILocalVariable(name: "r", arg: 1, scope: !1330, file: !1003, line: 271, type: !632)
!1332 = !DILocation(line: 0, scope: !1330)
!1333 = !DILocation(line: 271, column: 36, scope: !1330)
!1334 = !DILocation(line: 271, column: 48, scope: !1330)
!1335 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_basemul_montgomery", scope: !1003, file: !1003, line: 282, type: !1336, scopeLine: 282, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1336 = !DISubroutineType(types: !1337)
!1337 = !{null, !632, !1006, !1006}
!1338 = !DILocalVariable(name: "r", arg: 1, scope: !1335, file: !1003, line: 282, type: !632)
!1339 = !DILocation(line: 0, scope: !1335)
!1340 = !DILocalVariable(name: "a", arg: 2, scope: !1335, file: !1003, line: 282, type: !1006)
!1341 = !DILocalVariable(name: "b", arg: 3, scope: !1335, file: !1003, line: 282, type: !1006)
!1342 = !DILocalVariable(name: "i", scope: !1335, file: !1003, line: 283, type: !14)
!1343 = !DILocation(line: 284, column: 8, scope: !1344)
!1344 = distinct !DILexicalBlock(scope: !1335, file: !1003, line: 284, column: 3)
!1345 = !DILocation(line: 284, scope: !1344)
!1346 = !DILocation(line: 284, column: 17, scope: !1347)
!1347 = distinct !DILexicalBlock(scope: !1344, file: !1003, line: 284, column: 3)
!1348 = !DILocation(line: 284, column: 3, scope: !1344)
!1349 = !DILocation(line: 285, column: 21, scope: !1350)
!1350 = distinct !DILexicalBlock(scope: !1347, file: !1003, line: 284, column: 37)
!1351 = !DILocation(line: 285, column: 14, scope: !1350)
!1352 = !DILocation(line: 285, column: 35, scope: !1350)
!1353 = !DILocation(line: 285, column: 28, scope: !1350)
!1354 = !DILocation(line: 285, column: 49, scope: !1350)
!1355 = !DILocation(line: 285, column: 42, scope: !1350)
!1356 = !DILocation(line: 285, column: 64, scope: !1350)
!1357 = !DILocation(line: 285, column: 55, scope: !1350)
!1358 = !DILocation(line: 285, column: 5, scope: !1350)
!1359 = !DILocation(line: 286, column: 21, scope: !1350)
!1360 = !DILocation(line: 286, column: 25, scope: !1350)
!1361 = !DILocation(line: 286, column: 14, scope: !1350)
!1362 = !DILocation(line: 286, column: 39, scope: !1350)
!1363 = !DILocation(line: 286, column: 43, scope: !1350)
!1364 = !DILocation(line: 286, column: 32, scope: !1350)
!1365 = !DILocation(line: 286, column: 57, scope: !1350)
!1366 = !DILocation(line: 286, column: 61, scope: !1350)
!1367 = !DILocation(line: 286, column: 50, scope: !1350)
!1368 = !DILocation(line: 287, column: 23, scope: !1350)
!1369 = !DILocation(line: 287, column: 14, scope: !1350)
!1370 = !DILocation(line: 287, column: 13, scope: !1350)
!1371 = !DILocation(line: 286, column: 5, scope: !1350)
!1372 = !DILocation(line: 284, column: 33, scope: !1347)
!1373 = !DILocation(line: 284, column: 3, scope: !1347)
!1374 = distinct !{!1374, !1348, !1375, !105}
!1375 = !DILocation(line: 288, column: 3, scope: !1344)
!1376 = !DILocation(line: 289, column: 1, scope: !1335)
!1377 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_tomont", scope: !1003, file: !1003, line: 299, type: !1304, scopeLine: 299, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1378 = !DILocalVariable(name: "r", arg: 1, scope: !1377, file: !1003, line: 299, type: !632)
!1379 = !DILocation(line: 0, scope: !1377)
!1380 = !DILocalVariable(name: "f", scope: !1377, file: !1003, line: 301, type: !35)
!1381 = !DILocalVariable(name: "i", scope: !1377, file: !1003, line: 300, type: !14)
!1382 = !DILocation(line: 302, column: 8, scope: !1383)
!1383 = distinct !DILexicalBlock(scope: !1377, file: !1003, line: 302, column: 3)
!1384 = !DILocation(line: 302, scope: !1383)
!1385 = !DILocation(line: 302, column: 17, scope: !1386)
!1386 = distinct !DILexicalBlock(scope: !1383, file: !1003, line: 302, column: 3)
!1387 = !DILocation(line: 302, column: 3, scope: !1383)
!1388 = !DILocation(line: 303, column: 42, scope: !1386)
!1389 = !DILocation(line: 303, column: 33, scope: !1386)
!1390 = !DILocation(line: 303, column: 50, scope: !1386)
!1391 = !DILocation(line: 303, column: 15, scope: !1386)
!1392 = !DILocation(line: 303, column: 5, scope: !1386)
!1393 = !DILocation(line: 303, column: 13, scope: !1386)
!1394 = !DILocation(line: 302, column: 29, scope: !1386)
!1395 = !DILocation(line: 302, column: 3, scope: !1386)
!1396 = distinct !{!1396, !1387, !1397, !105}
!1397 = !DILocation(line: 303, column: 53, scope: !1383)
!1398 = !DILocation(line: 304, column: 1, scope: !1377)
!1399 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_add", scope: !1003, file: !1003, line: 329, type: !1336, scopeLine: 329, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1400 = !DILocalVariable(name: "r", arg: 1, scope: !1399, file: !1003, line: 329, type: !632)
!1401 = !DILocation(line: 0, scope: !1399)
!1402 = !DILocalVariable(name: "a", arg: 2, scope: !1399, file: !1003, line: 329, type: !1006)
!1403 = !DILocalVariable(name: "b", arg: 3, scope: !1399, file: !1003, line: 329, type: !1006)
!1404 = !DILocalVariable(name: "i", scope: !1399, file: !1003, line: 330, type: !14)
!1405 = !DILocation(line: 331, column: 8, scope: !1406)
!1406 = distinct !DILexicalBlock(scope: !1399, file: !1003, line: 331, column: 3)
!1407 = !DILocation(line: 331, scope: !1406)
!1408 = !DILocation(line: 331, column: 17, scope: !1409)
!1409 = distinct !DILexicalBlock(scope: !1406, file: !1003, line: 331, column: 3)
!1410 = !DILocation(line: 331, column: 3, scope: !1406)
!1411 = !DILocation(line: 332, column: 15, scope: !1409)
!1412 = !DILocation(line: 332, column: 25, scope: !1409)
!1413 = !DILocation(line: 332, column: 23, scope: !1409)
!1414 = !DILocation(line: 332, column: 5, scope: !1409)
!1415 = !DILocation(line: 332, column: 13, scope: !1409)
!1416 = !DILocation(line: 331, column: 29, scope: !1409)
!1417 = !DILocation(line: 331, column: 3, scope: !1409)
!1418 = distinct !{!1418, !1410, !1419, !105}
!1419 = !DILocation(line: 332, column: 31, scope: !1406)
!1420 = !DILocation(line: 333, column: 1, scope: !1399)
!1421 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_sub", scope: !1003, file: !1003, line: 344, type: !1336, scopeLine: 344, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1422 = !DILocalVariable(name: "r", arg: 1, scope: !1421, file: !1003, line: 344, type: !632)
!1423 = !DILocation(line: 0, scope: !1421)
!1424 = !DILocalVariable(name: "a", arg: 2, scope: !1421, file: !1003, line: 344, type: !1006)
!1425 = !DILocalVariable(name: "b", arg: 3, scope: !1421, file: !1003, line: 344, type: !1006)
!1426 = !DILocalVariable(name: "i", scope: !1421, file: !1003, line: 345, type: !14)
!1427 = !DILocation(line: 346, column: 8, scope: !1428)
!1428 = distinct !DILexicalBlock(scope: !1421, file: !1003, line: 346, column: 3)
!1429 = !DILocation(line: 346, scope: !1428)
!1430 = !DILocation(line: 346, column: 17, scope: !1431)
!1431 = distinct !DILexicalBlock(scope: !1428, file: !1003, line: 346, column: 3)
!1432 = !DILocation(line: 346, column: 3, scope: !1428)
!1433 = !DILocation(line: 347, column: 15, scope: !1431)
!1434 = !DILocation(line: 347, column: 25, scope: !1431)
!1435 = !DILocation(line: 347, column: 23, scope: !1431)
!1436 = !DILocation(line: 347, column: 5, scope: !1431)
!1437 = !DILocation(line: 347, column: 13, scope: !1431)
!1438 = !DILocation(line: 346, column: 29, scope: !1431)
!1439 = !DILocation(line: 346, column: 3, scope: !1431)
!1440 = distinct !{!1440, !1432, !1441, !105}
!1441 = !DILocation(line: 347, column: 31, scope: !1428)
!1442 = !DILocation(line: 348, column: 1, scope: !1421)
!1443 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_ntt", scope: !33, file: !33, line: 80, type: !1444, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, retainedNodes: !24)
!1444 = !DISubroutineType(types: !1445)
!1445 = !{null, !401}
!1446 = !DILocalVariable(name: "r", arg: 1, scope: !1443, file: !33, line: 80, type: !401)
!1447 = !DILocation(line: 0, scope: !1443)
!1448 = !DILocalVariable(name: "k", scope: !1443, file: !33, line: 81, type: !14)
!1449 = !DILocalVariable(name: "len", scope: !1443, file: !33, line: 81, type: !14)
!1450 = !DILocation(line: 85, column: 7, scope: !1451)
!1451 = distinct !DILexicalBlock(scope: !1443, file: !33, line: 85, column: 3)
!1452 = !DILocation(line: 85, scope: !1451)
!1453 = !DILocation(line: 84, column: 5, scope: !1443)
!1454 = !DILocation(line: 85, column: 22, scope: !1455)
!1455 = distinct !DILexicalBlock(scope: !1451, file: !33, line: 85, column: 3)
!1456 = !DILocation(line: 85, column: 3, scope: !1451)
!1457 = !DILocation(line: 86, column: 5, scope: !1458)
!1458 = distinct !DILexicalBlock(scope: !1459, file: !33, line: 86, column: 5)
!1459 = distinct !DILexicalBlock(scope: !1455, file: !33, line: 85, column: 39)
!1460 = !DILocation(line: 86, scope: !1458)
!1461 = !DILocalVariable(name: "start", scope: !1443, file: !33, line: 81, type: !14)
!1462 = !DILocation(line: 86, column: 26, scope: !1463)
!1463 = distinct !DILexicalBlock(scope: !1458, file: !33, line: 86, column: 5)
!1464 = !DILocation(line: 87, column: 14, scope: !1465)
!1465 = distinct !DILexicalBlock(scope: !1463, file: !33, line: 86, column: 50)
!1466 = !DILocalVariable(name: "zeta", scope: !1443, file: !33, line: 82, type: !36)
!1467 = !DILocalVariable(name: "j", scope: !1443, file: !33, line: 81, type: !14)
!1468 = !DILocation(line: 88, column: 11, scope: !1469)
!1469 = distinct !DILexicalBlock(scope: !1465, file: !33, line: 88, column: 7)
!1470 = !DILocation(line: 88, scope: !1469)
!1471 = !DILocation(line: 88, column: 32, scope: !1472)
!1472 = distinct !DILexicalBlock(scope: !1469, file: !33, line: 88, column: 7)
!1473 = !DILocation(line: 88, column: 24, scope: !1472)
!1474 = !DILocation(line: 88, column: 7, scope: !1469)
!1475 = !DILocation(line: 89, column: 25, scope: !1476)
!1476 = distinct !DILexicalBlock(scope: !1472, file: !33, line: 88, column: 44)
!1477 = !DILocation(line: 89, column: 13, scope: !1476)
!1478 = !DILocalVariable(name: "t", scope: !1443, file: !33, line: 82, type: !36)
!1479 = !DILocation(line: 90, column: 22, scope: !1476)
!1480 = !DILocation(line: 90, column: 27, scope: !1476)
!1481 = !DILocation(line: 90, column: 9, scope: !1476)
!1482 = !DILocation(line: 90, column: 20, scope: !1476)
!1483 = !DILocation(line: 91, column: 16, scope: !1476)
!1484 = !DILocation(line: 91, column: 21, scope: !1476)
!1485 = !DILocation(line: 91, column: 9, scope: !1476)
!1486 = !DILocation(line: 91, column: 14, scope: !1476)
!1487 = !DILocation(line: 88, column: 40, scope: !1472)
!1488 = !DILocation(line: 88, column: 7, scope: !1472)
!1489 = distinct !{!1489, !1474, !1490, !105}
!1490 = !DILocation(line: 92, column: 7, scope: !1469)
!1491 = !DILocation(line: 87, column: 21, scope: !1465)
!1492 = !DILocation(line: 86, column: 43, scope: !1463)
!1493 = !DILocation(line: 86, column: 5, scope: !1463)
!1494 = distinct !{!1494, !1457, !1495, !105}
!1495 = !DILocation(line: 93, column: 5, scope: !1458)
!1496 = !DILocation(line: 85, column: 32, scope: !1455)
!1497 = !DILocation(line: 85, column: 3, scope: !1455)
!1498 = distinct !{!1498, !1456, !1499, !105}
!1499 = !DILocation(line: 94, column: 3, scope: !1451)
!1500 = !DILocation(line: 95, column: 1, scope: !1443)
!1501 = distinct !DISubprogram(name: "fqmul", scope: !33, file: !33, line: 68, type: !1502, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !28, retainedNodes: !24)
!1502 = !DISubroutineType(types: !1503)
!1503 = !{!36, !36, !36}
!1504 = !DILocalVariable(name: "a", arg: 1, scope: !1501, file: !33, line: 68, type: !36)
!1505 = !DILocation(line: 0, scope: !1501)
!1506 = !DILocalVariable(name: "b", arg: 2, scope: !1501, file: !33, line: 68, type: !36)
!1507 = !DILocation(line: 69, column: 28, scope: !1501)
!1508 = !DILocation(line: 69, column: 39, scope: !1501)
!1509 = !DILocation(line: 69, column: 38, scope: !1501)
!1510 = !DILocation(line: 69, column: 10, scope: !1501)
!1511 = !DILocation(line: 69, column: 3, scope: !1501)
!1512 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_invntt", scope: !33, file: !33, line: 106, type: !1444, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, retainedNodes: !24)
!1513 = !DILocalVariable(name: "r", arg: 1, scope: !1512, file: !33, line: 106, type: !401)
!1514 = !DILocation(line: 0, scope: !1512)
!1515 = !DILocalVariable(name: "f", scope: !1512, file: !33, line: 109, type: !35)
!1516 = !DILocalVariable(name: "k", scope: !1512, file: !33, line: 107, type: !14)
!1517 = !DILocalVariable(name: "len", scope: !1512, file: !33, line: 107, type: !14)
!1518 = !DILocation(line: 112, column: 7, scope: !1519)
!1519 = distinct !DILexicalBlock(scope: !1512, file: !33, line: 112, column: 3)
!1520 = !DILocation(line: 112, scope: !1519)
!1521 = !DILocation(line: 111, column: 5, scope: !1512)
!1522 = !DILocation(line: 112, column: 20, scope: !1523)
!1523 = distinct !DILexicalBlock(scope: !1519, file: !33, line: 112, column: 3)
!1524 = !DILocation(line: 112, column: 3, scope: !1519)
!1525 = !DILocation(line: 113, column: 5, scope: !1526)
!1526 = distinct !DILexicalBlock(scope: !1527, file: !33, line: 113, column: 5)
!1527 = distinct !DILexicalBlock(scope: !1523, file: !33, line: 112, column: 39)
!1528 = !DILocation(line: 124, column: 3, scope: !1529)
!1529 = distinct !DILexicalBlock(scope: !1512, file: !33, line: 124, column: 3)
!1530 = !DILocation(line: 113, scope: !1526)
!1531 = !DILocalVariable(name: "start", scope: !1512, file: !33, line: 107, type: !14)
!1532 = !DILocation(line: 113, column: 26, scope: !1533)
!1533 = distinct !DILexicalBlock(scope: !1526, file: !33, line: 113, column: 5)
!1534 = !DILocation(line: 114, column: 14, scope: !1535)
!1535 = distinct !DILexicalBlock(scope: !1533, file: !33, line: 113, column: 50)
!1536 = !DILocalVariable(name: "zeta", scope: !1512, file: !33, line: 108, type: !36)
!1537 = !DILocalVariable(name: "j", scope: !1512, file: !33, line: 107, type: !14)
!1538 = !DILocation(line: 115, column: 11, scope: !1539)
!1539 = distinct !DILexicalBlock(scope: !1535, file: !33, line: 115, column: 7)
!1540 = !DILocation(line: 115, scope: !1539)
!1541 = !DILocation(line: 115, column: 32, scope: !1542)
!1542 = distinct !DILexicalBlock(scope: !1539, file: !33, line: 115, column: 7)
!1543 = !DILocation(line: 115, column: 24, scope: !1542)
!1544 = !DILocation(line: 115, column: 7, scope: !1539)
!1545 = !DILocation(line: 116, column: 13, scope: !1546)
!1546 = distinct !DILexicalBlock(scope: !1542, file: !33, line: 115, column: 44)
!1547 = !DILocalVariable(name: "t", scope: !1512, file: !33, line: 108, type: !36)
!1548 = !DILocation(line: 117, column: 35, scope: !1546)
!1549 = !DILocation(line: 117, column: 33, scope: !1546)
!1550 = !DILocation(line: 117, column: 16, scope: !1546)
!1551 = !DILocation(line: 117, column: 9, scope: !1546)
!1552 = !DILocation(line: 117, column: 14, scope: !1546)
!1553 = !DILocation(line: 118, column: 22, scope: !1546)
!1554 = !DILocation(line: 118, column: 33, scope: !1546)
!1555 = !DILocation(line: 118, column: 9, scope: !1546)
!1556 = !DILocation(line: 118, column: 20, scope: !1546)
!1557 = !DILocation(line: 119, column: 34, scope: !1546)
!1558 = !DILocation(line: 119, column: 22, scope: !1546)
!1559 = !DILocation(line: 119, column: 9, scope: !1546)
!1560 = !DILocation(line: 119, column: 20, scope: !1546)
!1561 = !DILocation(line: 115, column: 40, scope: !1542)
!1562 = !DILocation(line: 115, column: 7, scope: !1542)
!1563 = distinct !{!1563, !1544, !1564, !105}
!1564 = !DILocation(line: 120, column: 7, scope: !1539)
!1565 = !DILocation(line: 114, column: 21, scope: !1535)
!1566 = !DILocation(line: 113, column: 43, scope: !1533)
!1567 = !DILocation(line: 113, column: 5, scope: !1533)
!1568 = distinct !{!1568, !1525, !1569, !105}
!1569 = !DILocation(line: 121, column: 5, scope: !1526)
!1570 = !DILocation(line: 112, column: 32, scope: !1523)
!1571 = !DILocation(line: 112, column: 3, scope: !1523)
!1572 = distinct !{!1572, !1524, !1573, !105}
!1573 = !DILocation(line: 122, column: 3, scope: !1519)
!1574 = !DILocation(line: 124, scope: !1529)
!1575 = !DILocation(line: 124, column: 16, scope: !1576)
!1576 = distinct !DILexicalBlock(scope: !1529, file: !33, line: 124, column: 3)
!1577 = !DILocation(line: 125, column: 18, scope: !1576)
!1578 = !DILocation(line: 125, column: 12, scope: !1576)
!1579 = !DILocation(line: 125, column: 5, scope: !1576)
!1580 = !DILocation(line: 125, column: 10, scope: !1576)
!1581 = !DILocation(line: 124, column: 24, scope: !1576)
!1582 = !DILocation(line: 124, column: 3, scope: !1576)
!1583 = distinct !{!1583, !1528, !1584, !105}
!1584 = !DILocation(line: 125, column: 25, scope: !1529)
!1585 = !DILocation(line: 126, column: 1, scope: !1512)
!1586 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_basemul", scope: !33, file: !33, line: 139, type: !1587, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, retainedNodes: !24)
!1587 = !DISubroutineType(types: !1588)
!1588 = !{null, !401, !1589, !1589, !36}
!1589 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 32)
!1590 = !DILocalVariable(name: "r", arg: 1, scope: !1586, file: !33, line: 139, type: !401)
!1591 = !DILocation(line: 0, scope: !1586)
!1592 = !DILocalVariable(name: "a", arg: 2, scope: !1586, file: !33, line: 139, type: !1589)
!1593 = !DILocalVariable(name: "b", arg: 3, scope: !1586, file: !33, line: 139, type: !1589)
!1594 = !DILocalVariable(name: "zeta", arg: 4, scope: !1586, file: !33, line: 139, type: !36)
!1595 = !DILocation(line: 141, column: 17, scope: !1586)
!1596 = !DILocation(line: 141, column: 23, scope: !1586)
!1597 = !DILocation(line: 141, column: 11, scope: !1586)
!1598 = !DILocation(line: 141, column: 9, scope: !1586)
!1599 = !DILocation(line: 142, column: 11, scope: !1586)
!1600 = !DILocation(line: 142, column: 9, scope: !1586)
!1601 = !DILocation(line: 143, column: 17, scope: !1586)
!1602 = !DILocation(line: 143, column: 23, scope: !1586)
!1603 = !DILocation(line: 143, column: 11, scope: !1586)
!1604 = !DILocation(line: 143, column: 8, scope: !1586)
!1605 = !DILocation(line: 144, column: 17, scope: !1586)
!1606 = !DILocation(line: 144, column: 23, scope: !1586)
!1607 = !DILocation(line: 144, column: 11, scope: !1586)
!1608 = !DILocation(line: 144, column: 3, scope: !1586)
!1609 = !DILocation(line: 144, column: 9, scope: !1586)
!1610 = !DILocation(line: 145, column: 17, scope: !1586)
!1611 = !DILocation(line: 145, column: 23, scope: !1586)
!1612 = !DILocation(line: 145, column: 11, scope: !1586)
!1613 = !DILocation(line: 145, column: 3, scope: !1586)
!1614 = !DILocation(line: 145, column: 8, scope: !1586)
!1615 = !DILocation(line: 146, column: 1, scope: !1586)
!1616 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_cbd_eta1", scope: !1617, file: !1617, line: 105, type: !1078, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !69, retainedNodes: !24)
!1617 = !DIFile(filename: "../../../ref/cbd.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!1618 = !DILocalVariable(name: "r", arg: 1, scope: !1616, file: !1617, line: 105, type: !632)
!1619 = !DILocation(line: 0, scope: !1616)
!1620 = !DILocalVariable(name: "buf", arg: 2, scope: !1616, file: !1617, line: 105, type: !235)
!1621 = !DILocation(line: 107, column: 3, scope: !1616)
!1622 = !DILocation(line: 113, column: 1, scope: !1616)
!1623 = distinct !DISubprogram(name: "cbd2", scope: !1617, file: !1617, line: 55, type: !1078, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !69, retainedNodes: !24)
!1624 = !DILocalVariable(name: "r", arg: 1, scope: !1623, file: !1617, line: 55, type: !632)
!1625 = !DILocation(line: 0, scope: !1623)
!1626 = !DILocalVariable(name: "buf", arg: 2, scope: !1623, file: !1617, line: 55, type: !235)
!1627 = !DILocalVariable(name: "i", scope: !1623, file: !1617, line: 56, type: !14)
!1628 = !DILocation(line: 60, column: 8, scope: !1629)
!1629 = distinct !DILexicalBlock(scope: !1623, file: !1617, line: 60, column: 3)
!1630 = !DILocation(line: 60, scope: !1629)
!1631 = !DILocation(line: 60, column: 17, scope: !1632)
!1632 = distinct !DILexicalBlock(scope: !1629, file: !1617, line: 60, column: 3)
!1633 = !DILocation(line: 60, column: 3, scope: !1629)
!1634 = !DILocation(line: 61, column: 37, scope: !1635)
!1635 = distinct !DILexicalBlock(scope: !1632, file: !1617, line: 60, column: 37)
!1636 = !DILocation(line: 61, column: 33, scope: !1635)
!1637 = !DILocation(line: 61, column: 9, scope: !1635)
!1638 = !DILocalVariable(name: "t", scope: !1623, file: !1617, line: 57, type: !65)
!1639 = !DILocation(line: 62, column: 11, scope: !1635)
!1640 = !DILocalVariable(name: "d", scope: !1623, file: !1617, line: 57, type: !65)
!1641 = !DILocation(line: 63, column: 13, scope: !1635)
!1642 = !DILocation(line: 63, column: 19, scope: !1635)
!1643 = !DILocation(line: 63, column: 7, scope: !1635)
!1644 = !DILocalVariable(name: "j", scope: !1623, file: !1617, line: 56, type: !14)
!1645 = !DILocation(line: 65, column: 10, scope: !1646)
!1646 = distinct !DILexicalBlock(scope: !1635, file: !1617, line: 65, column: 5)
!1647 = !DILocation(line: 65, scope: !1646)
!1648 = !DILocation(line: 65, column: 19, scope: !1649)
!1649 = distinct !DILexicalBlock(scope: !1646, file: !1617, line: 65, column: 5)
!1650 = !DILocation(line: 65, column: 5, scope: !1646)
!1651 = !DILocation(line: 66, column: 20, scope: !1652)
!1652 = distinct !DILexicalBlock(scope: !1649, file: !1617, line: 65, column: 29)
!1653 = !DILocation(line: 66, column: 14, scope: !1652)
!1654 = !DILocation(line: 66, column: 11, scope: !1652)
!1655 = !DILocalVariable(name: "a", scope: !1623, file: !1617, line: 58, type: !36)
!1656 = !DILocation(line: 67, column: 20, scope: !1652)
!1657 = !DILocation(line: 67, column: 24, scope: !1652)
!1658 = !DILocation(line: 67, column: 14, scope: !1652)
!1659 = !DILocation(line: 67, column: 11, scope: !1652)
!1660 = !DILocalVariable(name: "b", scope: !1623, file: !1617, line: 58, type: !36)
!1661 = !DILocation(line: 68, column: 27, scope: !1652)
!1662 = !DILocation(line: 68, column: 25, scope: !1652)
!1663 = !DILocation(line: 68, column: 14, scope: !1652)
!1664 = !DILocation(line: 68, column: 18, scope: !1652)
!1665 = !DILocation(line: 68, column: 7, scope: !1652)
!1666 = !DILocation(line: 68, column: 23, scope: !1652)
!1667 = !DILocation(line: 65, column: 25, scope: !1649)
!1668 = !DILocation(line: 65, column: 5, scope: !1649)
!1669 = distinct !{!1669, !1650, !1670, !105}
!1670 = !DILocation(line: 69, column: 5, scope: !1646)
!1671 = !DILocation(line: 60, column: 33, scope: !1632)
!1672 = !DILocation(line: 60, column: 3, scope: !1632)
!1673 = distinct !{!1673, !1633, !1674, !105}
!1674 = !DILocation(line: 70, column: 3, scope: !1629)
!1675 = !DILocation(line: 71, column: 1, scope: !1623)
!1676 = distinct !DISubprogram(name: "load32_littleendian", scope: !1617, file: !1617, line: 15, type: !1677, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !69, retainedNodes: !24)
!1677 = !DISubroutineType(types: !1678)
!1678 = !{!65, !235}
!1679 = !DILocalVariable(name: "x", arg: 1, scope: !1676, file: !1617, line: 15, type: !235)
!1680 = !DILocation(line: 0, scope: !1676)
!1681 = !DILocation(line: 17, column: 17, scope: !1676)
!1682 = !DILocation(line: 17, column: 7, scope: !1676)
!1683 = !DILocalVariable(name: "r", scope: !1676, file: !1617, line: 16, type: !65)
!1684 = !DILocation(line: 18, column: 18, scope: !1676)
!1685 = !DILocation(line: 18, column: 8, scope: !1676)
!1686 = !DILocation(line: 18, column: 23, scope: !1676)
!1687 = !DILocation(line: 18, column: 5, scope: !1676)
!1688 = !DILocation(line: 19, column: 18, scope: !1676)
!1689 = !DILocation(line: 19, column: 8, scope: !1676)
!1690 = !DILocation(line: 19, column: 23, scope: !1676)
!1691 = !DILocation(line: 19, column: 5, scope: !1676)
!1692 = !DILocation(line: 20, column: 18, scope: !1676)
!1693 = !DILocation(line: 20, column: 8, scope: !1676)
!1694 = !DILocation(line: 20, column: 23, scope: !1676)
!1695 = !DILocation(line: 20, column: 5, scope: !1676)
!1696 = !DILocation(line: 21, column: 3, scope: !1676)
!1697 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_cbd_eta2", scope: !1617, file: !1617, line: 115, type: !1078, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !69, retainedNodes: !24)
!1698 = !DILocalVariable(name: "r", arg: 1, scope: !1697, file: !1617, line: 115, type: !632)
!1699 = !DILocation(line: 0, scope: !1697)
!1700 = !DILocalVariable(name: "buf", arg: 2, scope: !1697, file: !1617, line: 115, type: !235)
!1701 = !DILocation(line: 117, column: 3, scope: !1697)
!1702 = !DILocation(line: 121, column: 1, scope: !1697)
!1703 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_montgomery_reduce", scope: !1704, file: !1704, line: 16, type: !1705, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !71, retainedNodes: !24)
!1704 = !DIFile(filename: "../../../ref/reduce.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!1705 = !DISubroutineType(types: !72)
!1706 = !DILocalVariable(name: "a", arg: 1, scope: !1703, file: !1704, line: 16, type: !30)
!1707 = !DILocation(line: 0, scope: !1703)
!1708 = !DILocalVariable(name: "t", scope: !1703, file: !1704, line: 18, type: !36)
!1709 = !DILocation(line: 21, column: 12, scope: !1703)
!1710 = !DILocation(line: 21, column: 22, scope: !1703)
!1711 = !DILocation(line: 21, column: 10, scope: !1703)
!1712 = !DILocation(line: 21, column: 32, scope: !1703)
!1713 = !DILocation(line: 21, column: 7, scope: !1703)
!1714 = !DILocation(line: 22, column: 3, scope: !1703)
!1715 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_barrett_reduce", scope: !1704, file: !1704, line: 35, type: !1716, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !71, retainedNodes: !24)
!1716 = !DISubroutineType(types: !1717)
!1717 = !{!36, !36}
!1718 = !DILocalVariable(name: "a", arg: 1, scope: !1715, file: !1704, line: 35, type: !36)
!1719 = !DILocation(line: 0, scope: !1715)
!1720 = !DILocalVariable(name: "v", scope: !1715, file: !1704, line: 37, type: !35)
!1721 = !DILocation(line: 39, column: 20, scope: !1715)
!1722 = !DILocation(line: 39, column: 19, scope: !1715)
!1723 = !DILocation(line: 39, column: 22, scope: !1715)
!1724 = !DILocation(line: 39, column: 33, scope: !1715)
!1725 = !DILocalVariable(name: "t", scope: !1715, file: !1704, line: 36, type: !36)
!1726 = !DILocation(line: 41, column: 10, scope: !1715)
!1727 = !DILocation(line: 41, column: 3, scope: !1715)
!1728 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_verify", scope: !1729, file: !1729, line: 16, type: !1730, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !73, retainedNodes: !24)
!1729 = !DIFile(filename: "../../../ref/verify.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!1730 = !DISubroutineType(types: !1731)
!1731 = !{!25, !235, !235, !12}
!1732 = !DILocalVariable(name: "a", arg: 1, scope: !1728, file: !1729, line: 16, type: !235)
!1733 = !DILocation(line: 0, scope: !1728)
!1734 = !DILocalVariable(name: "b", arg: 2, scope: !1728, file: !1729, line: 16, type: !235)
!1735 = !DILocalVariable(name: "len", arg: 3, scope: !1728, file: !1729, line: 16, type: !12)
!1736 = !DILocalVariable(name: "r", scope: !1728, file: !1729, line: 19, type: !7)
!1737 = !DILocalVariable(name: "i", scope: !1728, file: !1729, line: 18, type: !12)
!1738 = !DILocation(line: 21, column: 7, scope: !1739)
!1739 = distinct !DILexicalBlock(scope: !1728, file: !1729, line: 21, column: 3)
!1740 = !DILocation(line: 21, scope: !1739)
!1741 = !DILocation(line: 21, column: 12, scope: !1742)
!1742 = distinct !DILexicalBlock(scope: !1739, file: !1729, line: 21, column: 3)
!1743 = !DILocation(line: 21, column: 3, scope: !1739)
!1744 = !DILocation(line: 22, column: 10, scope: !1742)
!1745 = !DILocation(line: 22, column: 17, scope: !1742)
!1746 = !DILocation(line: 22, column: 15, scope: !1742)
!1747 = !DILocation(line: 22, column: 7, scope: !1742)
!1748 = !DILocation(line: 21, column: 18, scope: !1742)
!1749 = !DILocation(line: 21, column: 3, scope: !1742)
!1750 = distinct !{!1750, !1743, !1751, !105}
!1751 = !DILocation(line: 22, column: 20, scope: !1739)
!1752 = !DILocation(line: 24, column: 25, scope: !1728)
!1753 = !DILocation(line: 24, column: 10, scope: !1728)
!1754 = !DILocation(line: 24, column: 3, scope: !1728)
!1755 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_cmov", scope: !1729, file: !1729, line: 40, type: !1756, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !73, retainedNodes: !24)
!1756 = !DISubroutineType(types: !1757)
!1757 = !{null, !6, !235, !12, !7}
!1758 = !DILocalVariable(name: "r", arg: 1, scope: !1755, file: !1729, line: 40, type: !6)
!1759 = !DILocation(line: 0, scope: !1755)
!1760 = !DILocalVariable(name: "x", arg: 2, scope: !1755, file: !1729, line: 40, type: !235)
!1761 = !DILocalVariable(name: "len", arg: 3, scope: !1755, file: !1729, line: 40, type: !12)
!1762 = !DILocalVariable(name: "b", arg: 4, scope: !1755, file: !1729, line: 40, type: !7)
!1763 = !DILocation(line: 51, column: 3, scope: !1755)
!1764 = !{i64 1722}
!1765 = !DILocation(line: 54, column: 7, scope: !1755)
!1766 = !DILocalVariable(name: "i", scope: !1755, file: !1729, line: 42, type: !12)
!1767 = !DILocation(line: 55, column: 7, scope: !1768)
!1768 = distinct !DILexicalBlock(scope: !1755, file: !1729, line: 55, column: 3)
!1769 = !DILocation(line: 55, scope: !1768)
!1770 = !DILocation(line: 55, column: 12, scope: !1771)
!1771 = distinct !DILexicalBlock(scope: !1768, file: !1729, line: 55, column: 3)
!1772 = !DILocation(line: 55, column: 3, scope: !1768)
!1773 = !DILocation(line: 56, column: 18, scope: !1771)
!1774 = !DILocation(line: 56, column: 25, scope: !1771)
!1775 = !DILocation(line: 56, column: 23, scope: !1771)
!1776 = !DILocation(line: 56, column: 15, scope: !1771)
!1777 = !DILocation(line: 56, column: 5, scope: !1771)
!1778 = !DILocation(line: 56, column: 10, scope: !1771)
!1779 = !DILocation(line: 55, column: 18, scope: !1771)
!1780 = !DILocation(line: 55, column: 3, scope: !1771)
!1781 = distinct !{!1781, !1772, !1782, !105}
!1782 = !DILocation(line: 56, column: 29, scope: !1768)
!1783 = !DILocation(line: 57, column: 1, scope: !1755)
!1784 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_cmov_int16", scope: !1729, file: !1729, line: 71, type: !1785, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !73, retainedNodes: !24)
!1785 = !DISubroutineType(types: !1786)
!1786 = !{null, !401, !36, !60}
!1787 = !DILocalVariable(name: "r", arg: 1, scope: !1784, file: !1729, line: 71, type: !401)
!1788 = !DILocation(line: 0, scope: !1784)
!1789 = !DILocalVariable(name: "v", arg: 2, scope: !1784, file: !1729, line: 71, type: !36)
!1790 = !DILocalVariable(name: "b", arg: 3, scope: !1784, file: !1729, line: 71, type: !60)
!1791 = !DILocation(line: 73, column: 7, scope: !1784)
!1792 = !DILocation(line: 74, column: 15, scope: !1784)
!1793 = !DILocation(line: 74, column: 19, scope: !1784)
!1794 = !DILocation(line: 74, column: 11, scope: !1784)
!1795 = !DILocation(line: 74, column: 6, scope: !1784)
!1796 = !DILocation(line: 75, column: 1, scope: !1784)
!1797 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_init", scope: !49, file: !49, line: 497, type: !1798, scopeLine: 497, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!1798 = !DISubroutineType(types: !1799)
!1799 = !{null, !1800}
!1800 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !347, size: 32)
!1801 = !DILocalVariable(name: "state", arg: 1, scope: !1797, file: !49, line: 497, type: !1800)
!1802 = !DILocation(line: 0, scope: !1797)
!1803 = !DILocation(line: 498, column: 3, scope: !1797)
!1804 = !DILocation(line: 499, column: 3, scope: !1797)
!1805 = !DILocation(line: 499, column: 29, scope: !1797)
!1806 = !DILocation(line: 500, column: 1, scope: !1797)
!1807 = distinct !DISubprogram(name: "keccak_init", scope: !49, file: !49, line: 340, type: !1808, scopeLine: 340, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!1808 = !DISubroutineType(types: !1809)
!1809 = !{null, !1810}
!1810 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 32)
!1811 = !DILocalVariable(name: "s", arg: 1, scope: !1807, file: !49, line: 340, type: !1810)
!1812 = !DILocation(line: 0, scope: !1807)
!1813 = !DILocalVariable(name: "i", scope: !1807, file: !49, line: 341, type: !14)
!1814 = !DILocation(line: 342, column: 8, scope: !1815)
!1815 = distinct !DILexicalBlock(scope: !1807, file: !49, line: 342, column: 3)
!1816 = !DILocation(line: 342, scope: !1815)
!1817 = !DILocation(line: 342, column: 17, scope: !1818)
!1818 = distinct !DILexicalBlock(scope: !1815, file: !49, line: 342, column: 3)
!1819 = !DILocation(line: 342, column: 3, scope: !1815)
!1820 = !DILocation(line: 343, column: 5, scope: !1818)
!1821 = !DILocation(line: 343, column: 10, scope: !1818)
!1822 = !DILocation(line: 342, column: 24, scope: !1818)
!1823 = !DILocation(line: 342, column: 3, scope: !1818)
!1824 = distinct !{!1824, !1819, !1825, !105}
!1825 = !DILocation(line: 343, column: 12, scope: !1815)
!1826 = !DILocation(line: 344, column: 1, scope: !1807)
!1827 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb", scope: !49, file: !49, line: 512, type: !1828, scopeLine: 512, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!1828 = !DISubroutineType(types: !1829)
!1829 = !{null, !1800, !235, !12}
!1830 = !DILocalVariable(name: "state", arg: 1, scope: !1827, file: !49, line: 512, type: !1800)
!1831 = !DILocation(line: 0, scope: !1827)
!1832 = !DILocalVariable(name: "in", arg: 2, scope: !1827, file: !49, line: 512, type: !235)
!1833 = !DILocalVariable(name: "inlen", arg: 3, scope: !1827, file: !49, line: 512, type: !12)
!1834 = !DILocation(line: 513, column: 53, scope: !1827)
!1835 = !DILocation(line: 513, column: 31, scope: !1827)
!1836 = !DILocation(line: 513, column: 3, scope: !1827)
!1837 = !DILocation(line: 513, column: 29, scope: !1827)
!1838 = !DILocation(line: 515, column: 1, scope: !1827)
!1839 = distinct !DISubprogram(name: "keccak_absorb", scope: !49, file: !49, line: 359, type: !1840, scopeLine: 361, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!1840 = !DISubroutineType(types: !1841)
!1841 = !{!14, !1810, !14, !14, !235, !12}
!1842 = !DILocalVariable(name: "s", arg: 1, scope: !1839, file: !49, line: 359, type: !1810)
!1843 = !DILocation(line: 0, scope: !1839)
!1844 = !DILocalVariable(name: "pos", arg: 2, scope: !1839, file: !49, line: 359, type: !14)
!1845 = !DILocalVariable(name: "r", arg: 3, scope: !1839, file: !49, line: 360, type: !14)
!1846 = !DILocalVariable(name: "in", arg: 4, scope: !1839, file: !49, line: 360, type: !235)
!1847 = !DILocalVariable(name: "inlen", arg: 5, scope: !1839, file: !49, line: 361, type: !12)
!1848 = !DILocation(line: 364, column: 3, scope: !1839)
!1849 = !DILocation(line: 364, column: 14, scope: !1839)
!1850 = !DILocation(line: 364, column: 22, scope: !1839)
!1851 = !DILocation(line: 365, column: 5, scope: !1852)
!1852 = distinct !DILexicalBlock(scope: !1853, file: !49, line: 365, column: 5)
!1853 = distinct !DILexicalBlock(scope: !1839, file: !49, line: 364, column: 28)
!1854 = !DILocation(line: 372, column: 3, scope: !1855)
!1855 = distinct !DILexicalBlock(scope: !1839, file: !49, line: 372, column: 3)
!1856 = !DILocation(line: 365, scope: !1852)
!1857 = !DILocalVariable(name: "i", scope: !1839, file: !49, line: 362, type: !14)
!1858 = !DILocation(line: 365, column: 21, scope: !1859)
!1859 = distinct !DILexicalBlock(scope: !1852, file: !49, line: 365, column: 5)
!1860 = !DILocation(line: 366, column: 29, scope: !1859)
!1861 = !DILocation(line: 366, column: 19, scope: !1859)
!1862 = !DILocation(line: 366, column: 40, scope: !1859)
!1863 = !DILocation(line: 366, column: 35, scope: !1859)
!1864 = !DILocation(line: 366, column: 11, scope: !1859)
!1865 = !DILocation(line: 366, column: 7, scope: !1859)
!1866 = !DILocation(line: 366, column: 16, scope: !1859)
!1867 = !DILocation(line: 366, column: 32, scope: !1859)
!1868 = !DILocation(line: 365, column: 27, scope: !1859)
!1869 = !DILocation(line: 365, column: 5, scope: !1859)
!1870 = distinct !{!1870, !1851, !1871, !105}
!1871 = !DILocation(line: 366, column: 48, scope: !1852)
!1872 = !DILocation(line: 367, column: 16, scope: !1853)
!1873 = !DILocation(line: 367, column: 11, scope: !1853)
!1874 = !DILocation(line: 368, column: 5, scope: !1853)
!1875 = distinct !{!1875, !1848, !1876, !105}
!1876 = !DILocation(line: 370, column: 3, scope: !1839)
!1877 = !DILocation(line: 372, scope: !1855)
!1878 = !DILocation(line: 372, column: 25, scope: !1879)
!1879 = distinct !DILexicalBlock(scope: !1855, file: !49, line: 372, column: 3)
!1880 = !DILocation(line: 372, column: 19, scope: !1879)
!1881 = !DILocation(line: 373, column: 27, scope: !1879)
!1882 = !DILocation(line: 373, column: 17, scope: !1879)
!1883 = !DILocation(line: 373, column: 38, scope: !1879)
!1884 = !DILocation(line: 373, column: 33, scope: !1879)
!1885 = !DILocation(line: 373, column: 9, scope: !1879)
!1886 = !DILocation(line: 373, column: 5, scope: !1879)
!1887 = !DILocation(line: 373, column: 14, scope: !1879)
!1888 = !DILocation(line: 373, column: 30, scope: !1879)
!1889 = !DILocation(line: 372, column: 35, scope: !1879)
!1890 = !DILocation(line: 372, column: 3, scope: !1879)
!1891 = distinct !{!1891, !1854, !1892, !105}
!1892 = !DILocation(line: 373, column: 46, scope: !1855)
!1893 = !DILocation(line: 375, column: 3, scope: !1839)
!1894 = distinct !DISubprogram(name: "KeccakF1600_StatePermute", scope: !49, file: !49, line: 70, type: !1808, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!1895 = !DILocalVariable(name: "state", arg: 1, scope: !1894, file: !49, line: 70, type: !1810)
!1896 = !DILocation(line: 0, scope: !1894)
!1897 = !DILocation(line: 87, column: 9, scope: !1894)
!1898 = !DILocalVariable(name: "Aba", scope: !1894, file: !49, line: 73, type: !45)
!1899 = !DILocation(line: 88, column: 9, scope: !1894)
!1900 = !DILocalVariable(name: "Abe", scope: !1894, file: !49, line: 73, type: !45)
!1901 = !DILocation(line: 89, column: 9, scope: !1894)
!1902 = !DILocalVariable(name: "Abi", scope: !1894, file: !49, line: 73, type: !45)
!1903 = !DILocation(line: 90, column: 9, scope: !1894)
!1904 = !DILocalVariable(name: "Abo", scope: !1894, file: !49, line: 73, type: !45)
!1905 = !DILocation(line: 91, column: 9, scope: !1894)
!1906 = !DILocalVariable(name: "Abu", scope: !1894, file: !49, line: 73, type: !45)
!1907 = !DILocation(line: 92, column: 9, scope: !1894)
!1908 = !DILocalVariable(name: "Aga", scope: !1894, file: !49, line: 74, type: !45)
!1909 = !DILocation(line: 93, column: 9, scope: !1894)
!1910 = !DILocalVariable(name: "Age", scope: !1894, file: !49, line: 74, type: !45)
!1911 = !DILocation(line: 94, column: 9, scope: !1894)
!1912 = !DILocalVariable(name: "Agi", scope: !1894, file: !49, line: 74, type: !45)
!1913 = !DILocation(line: 95, column: 9, scope: !1894)
!1914 = !DILocalVariable(name: "Ago", scope: !1894, file: !49, line: 74, type: !45)
!1915 = !DILocation(line: 96, column: 9, scope: !1894)
!1916 = !DILocalVariable(name: "Agu", scope: !1894, file: !49, line: 74, type: !45)
!1917 = !DILocation(line: 97, column: 9, scope: !1894)
!1918 = !DILocalVariable(name: "Aka", scope: !1894, file: !49, line: 75, type: !45)
!1919 = !DILocation(line: 98, column: 9, scope: !1894)
!1920 = !DILocalVariable(name: "Ake", scope: !1894, file: !49, line: 75, type: !45)
!1921 = !DILocation(line: 99, column: 9, scope: !1894)
!1922 = !DILocalVariable(name: "Aki", scope: !1894, file: !49, line: 75, type: !45)
!1923 = !DILocation(line: 100, column: 9, scope: !1894)
!1924 = !DILocalVariable(name: "Ako", scope: !1894, file: !49, line: 75, type: !45)
!1925 = !DILocation(line: 101, column: 9, scope: !1894)
!1926 = !DILocalVariable(name: "Aku", scope: !1894, file: !49, line: 75, type: !45)
!1927 = !DILocation(line: 102, column: 9, scope: !1894)
!1928 = !DILocalVariable(name: "Ama", scope: !1894, file: !49, line: 76, type: !45)
!1929 = !DILocation(line: 103, column: 9, scope: !1894)
!1930 = !DILocalVariable(name: "Ame", scope: !1894, file: !49, line: 76, type: !45)
!1931 = !DILocation(line: 104, column: 9, scope: !1894)
!1932 = !DILocalVariable(name: "Ami", scope: !1894, file: !49, line: 76, type: !45)
!1933 = !DILocation(line: 105, column: 9, scope: !1894)
!1934 = !DILocalVariable(name: "Amo", scope: !1894, file: !49, line: 76, type: !45)
!1935 = !DILocation(line: 106, column: 9, scope: !1894)
!1936 = !DILocalVariable(name: "Amu", scope: !1894, file: !49, line: 76, type: !45)
!1937 = !DILocation(line: 107, column: 9, scope: !1894)
!1938 = !DILocalVariable(name: "Asa", scope: !1894, file: !49, line: 77, type: !45)
!1939 = !DILocation(line: 108, column: 9, scope: !1894)
!1940 = !DILocalVariable(name: "Ase", scope: !1894, file: !49, line: 77, type: !45)
!1941 = !DILocation(line: 109, column: 9, scope: !1894)
!1942 = !DILocalVariable(name: "Asi", scope: !1894, file: !49, line: 77, type: !45)
!1943 = !DILocation(line: 110, column: 9, scope: !1894)
!1944 = !DILocalVariable(name: "Aso", scope: !1894, file: !49, line: 77, type: !45)
!1945 = !DILocation(line: 111, column: 9, scope: !1894)
!1946 = !DILocalVariable(name: "Asu", scope: !1894, file: !49, line: 77, type: !45)
!1947 = !DILocalVariable(name: "round", scope: !1894, file: !49, line: 71, type: !25)
!1948 = !DILocation(line: 113, column: 8, scope: !1949)
!1949 = distinct !DILexicalBlock(scope: !1894, file: !49, line: 113, column: 3)
!1950 = !DILocation(line: 113, scope: !1949)
!1951 = !DILocation(line: 113, column: 25, scope: !1952)
!1952 = distinct !DILexicalBlock(scope: !1949, file: !49, line: 113, column: 3)
!1953 = !DILocation(line: 113, column: 3, scope: !1949)
!1954 = !DILocalVariable(name: "BCa", scope: !1894, file: !49, line: 78, type: !45)
!1955 = !DILocalVariable(name: "BCe", scope: !1894, file: !49, line: 78, type: !45)
!1956 = !DILocalVariable(name: "BCi", scope: !1894, file: !49, line: 78, type: !45)
!1957 = !DILocalVariable(name: "BCo", scope: !1894, file: !49, line: 78, type: !45)
!1958 = !DILocalVariable(name: "BCu", scope: !1894, file: !49, line: 78, type: !45)
!1959 = !DILocalVariable(name: "Da", scope: !1894, file: !49, line: 79, type: !45)
!1960 = !DILocalVariable(name: "De", scope: !1894, file: !49, line: 79, type: !45)
!1961 = !DILocalVariable(name: "Di", scope: !1894, file: !49, line: 79, type: !45)
!1962 = !DILocalVariable(name: "Do", scope: !1894, file: !49, line: 79, type: !45)
!1963 = !DILocalVariable(name: "Du", scope: !1894, file: !49, line: 79, type: !45)
!1964 = !DILocalVariable(name: "Eba", scope: !1894, file: !49, line: 80, type: !45)
!1965 = !DILocalVariable(name: "Ebe", scope: !1894, file: !49, line: 80, type: !45)
!1966 = !DILocalVariable(name: "Ebi", scope: !1894, file: !49, line: 80, type: !45)
!1967 = !DILocalVariable(name: "Ebo", scope: !1894, file: !49, line: 80, type: !45)
!1968 = !DILocalVariable(name: "Ebu", scope: !1894, file: !49, line: 80, type: !45)
!1969 = !DILocalVariable(name: "Ega", scope: !1894, file: !49, line: 81, type: !45)
!1970 = !DILocalVariable(name: "Ege", scope: !1894, file: !49, line: 81, type: !45)
!1971 = !DILocalVariable(name: "Egi", scope: !1894, file: !49, line: 81, type: !45)
!1972 = !DILocalVariable(name: "Ego", scope: !1894, file: !49, line: 81, type: !45)
!1973 = !DILocalVariable(name: "Egu", scope: !1894, file: !49, line: 81, type: !45)
!1974 = !DILocalVariable(name: "Eka", scope: !1894, file: !49, line: 82, type: !45)
!1975 = !DILocalVariable(name: "Eke", scope: !1894, file: !49, line: 82, type: !45)
!1976 = !DILocalVariable(name: "Eki", scope: !1894, file: !49, line: 82, type: !45)
!1977 = !DILocalVariable(name: "Eko", scope: !1894, file: !49, line: 82, type: !45)
!1978 = !DILocalVariable(name: "Eku", scope: !1894, file: !49, line: 82, type: !45)
!1979 = !DILocalVariable(name: "Ema", scope: !1894, file: !49, line: 83, type: !45)
!1980 = !DILocalVariable(name: "Eme", scope: !1894, file: !49, line: 83, type: !45)
!1981 = !DILocalVariable(name: "Emi", scope: !1894, file: !49, line: 83, type: !45)
!1982 = !DILocalVariable(name: "Emo", scope: !1894, file: !49, line: 83, type: !45)
!1983 = !DILocalVariable(name: "Emu", scope: !1894, file: !49, line: 83, type: !45)
!1984 = !DILocalVariable(name: "Esa", scope: !1894, file: !49, line: 84, type: !45)
!1985 = !DILocalVariable(name: "Ese", scope: !1894, file: !49, line: 84, type: !45)
!1986 = !DILocalVariable(name: "Esi", scope: !1894, file: !49, line: 84, type: !45)
!1987 = !DILocalVariable(name: "Eso", scope: !1894, file: !49, line: 84, type: !45)
!1988 = !DILocalVariable(name: "Esu", scope: !1894, file: !49, line: 84, type: !45)
!1989 = !DILocation(line: 117, column: 15, scope: !1990)
!1990 = distinct !DILexicalBlock(scope: !1952, file: !49, line: 113, column: 48)
!1991 = !DILocation(line: 117, column: 21, scope: !1990)
!1992 = !DILocation(line: 117, column: 27, scope: !1990)
!1993 = !DILocation(line: 117, column: 33, scope: !1990)
!1994 = !DILocation(line: 119, column: 15, scope: !1990)
!1995 = !DILocation(line: 119, column: 21, scope: !1990)
!1996 = !DILocation(line: 119, column: 27, scope: !1990)
!1997 = !DILocation(line: 119, column: 33, scope: !1990)
!1998 = !DILocation(line: 125, column: 16, scope: !1990)
!1999 = !DILocation(line: 125, column: 14, scope: !1990)
!2000 = !DILocation(line: 195, column: 9, scope: !1990)
!2001 = !DILocation(line: 196, column: 11, scope: !1990)
!2002 = !DILocation(line: 116, column: 15, scope: !1990)
!2003 = !DILocation(line: 116, column: 21, scope: !1990)
!2004 = !DILocation(line: 116, column: 27, scope: !1990)
!2005 = !DILocation(line: 116, column: 33, scope: !1990)
!2006 = !DILocation(line: 122, column: 16, scope: !1990)
!2007 = !DILocation(line: 122, column: 14, scope: !1990)
!2008 = !DILocation(line: 199, column: 9, scope: !1990)
!2009 = !DILocation(line: 200, column: 11, scope: !1990)
!2010 = !DILocation(line: 118, column: 15, scope: !1990)
!2011 = !DILocation(line: 118, column: 21, scope: !1990)
!2012 = !DILocation(line: 118, column: 27, scope: !1990)
!2013 = !DILocation(line: 118, column: 33, scope: !1990)
!2014 = !DILocation(line: 115, column: 15, scope: !1990)
!2015 = !DILocation(line: 115, column: 21, scope: !1990)
!2016 = !DILocation(line: 115, column: 27, scope: !1990)
!2017 = !DILocation(line: 115, column: 33, scope: !1990)
!2018 = !DILocation(line: 126, column: 16, scope: !1990)
!2019 = !DILocation(line: 126, column: 14, scope: !1990)
!2020 = !DILocation(line: 197, column: 9, scope: !1990)
!2021 = !DILocation(line: 198, column: 11, scope: !1990)
!2022 = !DILocation(line: 204, column: 19, scope: !1990)
!2023 = !DILocation(line: 204, column: 25, scope: !1990)
!2024 = !DILocation(line: 204, column: 15, scope: !1990)
!2025 = !DILocation(line: 124, column: 16, scope: !1990)
!2026 = !DILocation(line: 124, column: 14, scope: !1990)
!2027 = !DILocation(line: 132, column: 9, scope: !1990)
!2028 = !DILocation(line: 133, column: 11, scope: !1990)
!2029 = !DILocation(line: 123, column: 16, scope: !1990)
!2030 = !DILocation(line: 123, column: 14, scope: !1990)
!2031 = !DILocation(line: 130, column: 9, scope: !1990)
!2032 = !DILocation(line: 131, column: 11, scope: !1990)
!2033 = !DILocation(line: 138, column: 19, scope: !1990)
!2034 = !DILocation(line: 138, column: 25, scope: !1990)
!2035 = !DILocation(line: 139, column: 22, scope: !1990)
!2036 = !DILocation(line: 139, column: 9, scope: !1990)
!2037 = !DILocation(line: 128, column: 9, scope: !1990)
!2038 = !DILocation(line: 145, column: 9, scope: !1990)
!2039 = !DILocation(line: 146, column: 11, scope: !1990)
!2040 = !DILocation(line: 149, column: 9, scope: !1990)
!2041 = !DILocation(line: 150, column: 11, scope: !1990)
!2042 = !DILocation(line: 147, column: 9, scope: !1990)
!2043 = !DILocation(line: 148, column: 11, scope: !1990)
!2044 = !DILocation(line: 155, column: 19, scope: !1990)
!2045 = !DILocation(line: 155, column: 25, scope: !1990)
!2046 = !DILocation(line: 155, column: 15, scope: !1990)
!2047 = !DILocation(line: 210, column: 15, scope: !1990)
!2048 = !DILocation(line: 161, column: 9, scope: !1990)
!2049 = !DILocation(line: 162, column: 11, scope: !1990)
!2050 = !DILocation(line: 165, column: 9, scope: !1990)
!2051 = !DILocation(line: 166, column: 11, scope: !1990)
!2052 = !DILocation(line: 163, column: 9, scope: !1990)
!2053 = !DILocation(line: 164, column: 11, scope: !1990)
!2054 = !DILocation(line: 171, column: 19, scope: !1990)
!2055 = !DILocation(line: 171, column: 25, scope: !1990)
!2056 = !DILocation(line: 171, column: 15, scope: !1990)
!2057 = !DILocation(line: 210, column: 21, scope: !1990)
!2058 = !DILocation(line: 177, column: 9, scope: !1990)
!2059 = !DILocation(line: 178, column: 11, scope: !1990)
!2060 = !DILocation(line: 181, column: 9, scope: !1990)
!2061 = !DILocation(line: 182, column: 11, scope: !1990)
!2062 = !DILocation(line: 179, column: 9, scope: !1990)
!2063 = !DILocation(line: 180, column: 11, scope: !1990)
!2064 = !DILocation(line: 187, column: 19, scope: !1990)
!2065 = !DILocation(line: 187, column: 25, scope: !1990)
!2066 = !DILocation(line: 187, column: 15, scope: !1990)
!2067 = !DILocation(line: 210, column: 27, scope: !1990)
!2068 = !DILocation(line: 193, column: 9, scope: !1990)
!2069 = !DILocation(line: 194, column: 11, scope: !1990)
!2070 = !DILocation(line: 203, column: 19, scope: !1990)
!2071 = !DILocation(line: 203, column: 25, scope: !1990)
!2072 = !DILocation(line: 203, column: 15, scope: !1990)
!2073 = !DILocation(line: 210, column: 33, scope: !1990)
!2074 = !DILocation(line: 136, column: 9, scope: !1990)
!2075 = !DILocation(line: 137, column: 11, scope: !1990)
!2076 = !DILocation(line: 134, column: 9, scope: !1990)
!2077 = !DILocation(line: 135, column: 11, scope: !1990)
!2078 = !DILocation(line: 141, column: 19, scope: !1990)
!2079 = !DILocation(line: 141, column: 25, scope: !1990)
!2080 = !DILocation(line: 141, column: 15, scope: !1990)
!2081 = !DILocation(line: 153, column: 9, scope: !1990)
!2082 = !DILocation(line: 154, column: 11, scope: !1990)
!2083 = !DILocation(line: 151, column: 9, scope: !1990)
!2084 = !DILocation(line: 152, column: 11, scope: !1990)
!2085 = !DILocation(line: 157, column: 19, scope: !1990)
!2086 = !DILocation(line: 157, column: 25, scope: !1990)
!2087 = !DILocation(line: 157, column: 15, scope: !1990)
!2088 = !DILocation(line: 212, column: 15, scope: !1990)
!2089 = !DILocation(line: 169, column: 9, scope: !1990)
!2090 = !DILocation(line: 170, column: 11, scope: !1990)
!2091 = !DILocation(line: 167, column: 9, scope: !1990)
!2092 = !DILocation(line: 168, column: 11, scope: !1990)
!2093 = !DILocation(line: 173, column: 19, scope: !1990)
!2094 = !DILocation(line: 173, column: 25, scope: !1990)
!2095 = !DILocation(line: 173, column: 15, scope: !1990)
!2096 = !DILocation(line: 212, column: 21, scope: !1990)
!2097 = !DILocation(line: 185, column: 9, scope: !1990)
!2098 = !DILocation(line: 186, column: 11, scope: !1990)
!2099 = !DILocation(line: 183, column: 9, scope: !1990)
!2100 = !DILocation(line: 184, column: 11, scope: !1990)
!2101 = !DILocation(line: 189, column: 19, scope: !1990)
!2102 = !DILocation(line: 189, column: 25, scope: !1990)
!2103 = !DILocation(line: 189, column: 15, scope: !1990)
!2104 = !DILocation(line: 212, column: 27, scope: !1990)
!2105 = !DILocation(line: 201, column: 9, scope: !1990)
!2106 = !DILocation(line: 202, column: 11, scope: !1990)
!2107 = !DILocation(line: 205, column: 19, scope: !1990)
!2108 = !DILocation(line: 205, column: 25, scope: !1990)
!2109 = !DILocation(line: 205, column: 15, scope: !1990)
!2110 = !DILocation(line: 212, column: 33, scope: !1990)
!2111 = !DILocation(line: 218, column: 16, scope: !1990)
!2112 = !DILocation(line: 218, column: 14, scope: !1990)
!2113 = !DILocation(line: 296, column: 9, scope: !1990)
!2114 = !DILocation(line: 297, column: 11, scope: !1990)
!2115 = !DILocation(line: 158, column: 19, scope: !1990)
!2116 = !DILocation(line: 158, column: 25, scope: !1990)
!2117 = !DILocation(line: 158, column: 15, scope: !1990)
!2118 = !DILocation(line: 143, column: 19, scope: !1990)
!2119 = !DILocation(line: 143, column: 25, scope: !1990)
!2120 = !DILocation(line: 143, column: 15, scope: !1990)
!2121 = !DILocation(line: 159, column: 19, scope: !1990)
!2122 = !DILocation(line: 159, column: 25, scope: !1990)
!2123 = !DILocation(line: 159, column: 15, scope: !1990)
!2124 = !DILocation(line: 214, column: 15, scope: !1990)
!2125 = !DILocation(line: 175, column: 19, scope: !1990)
!2126 = !DILocation(line: 175, column: 25, scope: !1990)
!2127 = !DILocation(line: 175, column: 15, scope: !1990)
!2128 = !DILocation(line: 214, column: 21, scope: !1990)
!2129 = !DILocation(line: 191, column: 19, scope: !1990)
!2130 = !DILocation(line: 191, column: 25, scope: !1990)
!2131 = !DILocation(line: 191, column: 15, scope: !1990)
!2132 = !DILocation(line: 214, column: 27, scope: !1990)
!2133 = !DILocation(line: 207, column: 19, scope: !1990)
!2134 = !DILocation(line: 207, column: 25, scope: !1990)
!2135 = !DILocation(line: 207, column: 15, scope: !1990)
!2136 = !DILocation(line: 214, column: 33, scope: !1990)
!2137 = !DILocation(line: 220, column: 16, scope: !1990)
!2138 = !DILocation(line: 220, column: 14, scope: !1990)
!2139 = !DILocation(line: 290, column: 9, scope: !1990)
!2140 = !DILocation(line: 291, column: 11, scope: !1990)
!2141 = !DILocation(line: 140, column: 19, scope: !1990)
!2142 = !DILocation(line: 140, column: 25, scope: !1990)
!2143 = !DILocation(line: 140, column: 15, scope: !1990)
!2144 = !DILocation(line: 156, column: 19, scope: !1990)
!2145 = !DILocation(line: 156, column: 25, scope: !1990)
!2146 = !DILocation(line: 156, column: 15, scope: !1990)
!2147 = !DILocation(line: 211, column: 15, scope: !1990)
!2148 = !DILocation(line: 172, column: 19, scope: !1990)
!2149 = !DILocation(line: 172, column: 25, scope: !1990)
!2150 = !DILocation(line: 172, column: 15, scope: !1990)
!2151 = !DILocation(line: 211, column: 21, scope: !1990)
!2152 = !DILocation(line: 188, column: 19, scope: !1990)
!2153 = !DILocation(line: 188, column: 25, scope: !1990)
!2154 = !DILocation(line: 188, column: 15, scope: !1990)
!2155 = !DILocation(line: 211, column: 27, scope: !1990)
!2156 = !DILocation(line: 211, column: 33, scope: !1990)
!2157 = !DILocation(line: 142, column: 19, scope: !1990)
!2158 = !DILocation(line: 142, column: 25, scope: !1990)
!2159 = !DILocation(line: 142, column: 15, scope: !1990)
!2160 = !DILocation(line: 213, column: 15, scope: !1990)
!2161 = !DILocation(line: 174, column: 19, scope: !1990)
!2162 = !DILocation(line: 174, column: 25, scope: !1990)
!2163 = !DILocation(line: 174, column: 15, scope: !1990)
!2164 = !DILocation(line: 213, column: 21, scope: !1990)
!2165 = !DILocation(line: 190, column: 19, scope: !1990)
!2166 = !DILocation(line: 190, column: 25, scope: !1990)
!2167 = !DILocation(line: 190, column: 15, scope: !1990)
!2168 = !DILocation(line: 213, column: 27, scope: !1990)
!2169 = !DILocation(line: 206, column: 19, scope: !1990)
!2170 = !DILocation(line: 206, column: 25, scope: !1990)
!2171 = !DILocation(line: 206, column: 15, scope: !1990)
!2172 = !DILocation(line: 213, column: 33, scope: !1990)
!2173 = !DILocation(line: 219, column: 16, scope: !1990)
!2174 = !DILocation(line: 219, column: 14, scope: !1990)
!2175 = !DILocation(line: 288, column: 9, scope: !1990)
!2176 = !DILocation(line: 289, column: 11, scope: !1990)
!2177 = !DILocation(line: 302, column: 19, scope: !1990)
!2178 = !DILocation(line: 302, column: 25, scope: !1990)
!2179 = !DILocation(line: 302, column: 15, scope: !1990)
!2180 = !DILocation(line: 217, column: 16, scope: !1990)
!2181 = !DILocation(line: 217, column: 14, scope: !1990)
!2182 = !DILocation(line: 294, column: 9, scope: !1990)
!2183 = !DILocation(line: 295, column: 11, scope: !1990)
!2184 = !DILocation(line: 301, column: 19, scope: !1990)
!2185 = !DILocation(line: 301, column: 25, scope: !1990)
!2186 = !DILocation(line: 301, column: 15, scope: !1990)
!2187 = !DILocation(line: 221, column: 16, scope: !1990)
!2188 = !DILocation(line: 221, column: 14, scope: !1990)
!2189 = !DILocation(line: 292, column: 9, scope: !1990)
!2190 = !DILocation(line: 293, column: 11, scope: !1990)
!2191 = !DILocation(line: 300, column: 19, scope: !1990)
!2192 = !DILocation(line: 300, column: 25, scope: !1990)
!2193 = !DILocation(line: 300, column: 15, scope: !1990)
!2194 = !DILocation(line: 299, column: 19, scope: !1990)
!2195 = !DILocation(line: 299, column: 25, scope: !1990)
!2196 = !DILocation(line: 299, column: 15, scope: !1990)
!2197 = !DILocation(line: 298, column: 19, scope: !1990)
!2198 = !DILocation(line: 298, column: 25, scope: !1990)
!2199 = !DILocation(line: 298, column: 15, scope: !1990)
!2200 = !DILocation(line: 280, column: 9, scope: !1990)
!2201 = !DILocation(line: 281, column: 11, scope: !1990)
!2202 = !DILocation(line: 274, column: 9, scope: !1990)
!2203 = !DILocation(line: 275, column: 11, scope: !1990)
!2204 = !DILocation(line: 272, column: 9, scope: !1990)
!2205 = !DILocation(line: 273, column: 11, scope: !1990)
!2206 = !DILocation(line: 286, column: 19, scope: !1990)
!2207 = !DILocation(line: 286, column: 25, scope: !1990)
!2208 = !DILocation(line: 286, column: 15, scope: !1990)
!2209 = !DILocation(line: 278, column: 9, scope: !1990)
!2210 = !DILocation(line: 279, column: 11, scope: !1990)
!2211 = !DILocation(line: 285, column: 19, scope: !1990)
!2212 = !DILocation(line: 285, column: 25, scope: !1990)
!2213 = !DILocation(line: 285, column: 15, scope: !1990)
!2214 = !DILocation(line: 276, column: 9, scope: !1990)
!2215 = !DILocation(line: 277, column: 11, scope: !1990)
!2216 = !DILocation(line: 284, column: 19, scope: !1990)
!2217 = !DILocation(line: 284, column: 25, scope: !1990)
!2218 = !DILocation(line: 284, column: 15, scope: !1990)
!2219 = !DILocation(line: 283, column: 19, scope: !1990)
!2220 = !DILocation(line: 283, column: 25, scope: !1990)
!2221 = !DILocation(line: 283, column: 15, scope: !1990)
!2222 = !DILocation(line: 282, column: 19, scope: !1990)
!2223 = !DILocation(line: 282, column: 25, scope: !1990)
!2224 = !DILocation(line: 282, column: 15, scope: !1990)
!2225 = !DILocation(line: 264, column: 9, scope: !1990)
!2226 = !DILocation(line: 265, column: 11, scope: !1990)
!2227 = !DILocation(line: 258, column: 9, scope: !1990)
!2228 = !DILocation(line: 259, column: 11, scope: !1990)
!2229 = !DILocation(line: 256, column: 9, scope: !1990)
!2230 = !DILocation(line: 257, column: 11, scope: !1990)
!2231 = !DILocation(line: 270, column: 19, scope: !1990)
!2232 = !DILocation(line: 270, column: 25, scope: !1990)
!2233 = !DILocation(line: 270, column: 15, scope: !1990)
!2234 = !DILocation(line: 262, column: 9, scope: !1990)
!2235 = !DILocation(line: 263, column: 11, scope: !1990)
!2236 = !DILocation(line: 269, column: 19, scope: !1990)
!2237 = !DILocation(line: 269, column: 25, scope: !1990)
!2238 = !DILocation(line: 269, column: 15, scope: !1990)
!2239 = !DILocation(line: 260, column: 9, scope: !1990)
!2240 = !DILocation(line: 261, column: 11, scope: !1990)
!2241 = !DILocation(line: 268, column: 19, scope: !1990)
!2242 = !DILocation(line: 268, column: 25, scope: !1990)
!2243 = !DILocation(line: 268, column: 15, scope: !1990)
!2244 = !DILocation(line: 267, column: 19, scope: !1990)
!2245 = !DILocation(line: 267, column: 25, scope: !1990)
!2246 = !DILocation(line: 267, column: 15, scope: !1990)
!2247 = !DILocation(line: 266, column: 19, scope: !1990)
!2248 = !DILocation(line: 266, column: 25, scope: !1990)
!2249 = !DILocation(line: 266, column: 15, scope: !1990)
!2250 = !DILocation(line: 248, column: 9, scope: !1990)
!2251 = !DILocation(line: 249, column: 11, scope: !1990)
!2252 = !DILocation(line: 242, column: 9, scope: !1990)
!2253 = !DILocation(line: 243, column: 11, scope: !1990)
!2254 = !DILocation(line: 240, column: 9, scope: !1990)
!2255 = !DILocation(line: 241, column: 11, scope: !1990)
!2256 = !DILocation(line: 254, column: 19, scope: !1990)
!2257 = !DILocation(line: 254, column: 25, scope: !1990)
!2258 = !DILocation(line: 254, column: 15, scope: !1990)
!2259 = !DILocation(line: 246, column: 9, scope: !1990)
!2260 = !DILocation(line: 247, column: 11, scope: !1990)
!2261 = !DILocation(line: 253, column: 19, scope: !1990)
!2262 = !DILocation(line: 253, column: 25, scope: !1990)
!2263 = !DILocation(line: 253, column: 15, scope: !1990)
!2264 = !DILocation(line: 244, column: 9, scope: !1990)
!2265 = !DILocation(line: 245, column: 11, scope: !1990)
!2266 = !DILocation(line: 252, column: 19, scope: !1990)
!2267 = !DILocation(line: 252, column: 25, scope: !1990)
!2268 = !DILocation(line: 252, column: 15, scope: !1990)
!2269 = !DILocation(line: 251, column: 19, scope: !1990)
!2270 = !DILocation(line: 251, column: 25, scope: !1990)
!2271 = !DILocation(line: 251, column: 15, scope: !1990)
!2272 = !DILocation(line: 250, column: 19, scope: !1990)
!2273 = !DILocation(line: 250, column: 25, scope: !1990)
!2274 = !DILocation(line: 250, column: 15, scope: !1990)
!2275 = !DILocation(line: 231, column: 9, scope: !1990)
!2276 = !DILocation(line: 232, column: 11, scope: !1990)
!2277 = !DILocation(line: 225, column: 9, scope: !1990)
!2278 = !DILocation(line: 226, column: 11, scope: !1990)
!2279 = !DILocation(line: 223, column: 9, scope: !1990)
!2280 = !DILocation(line: 238, column: 19, scope: !1990)
!2281 = !DILocation(line: 238, column: 25, scope: !1990)
!2282 = !DILocation(line: 238, column: 15, scope: !1990)
!2283 = !DILocation(line: 229, column: 9, scope: !1990)
!2284 = !DILocation(line: 230, column: 11, scope: !1990)
!2285 = !DILocation(line: 237, column: 19, scope: !1990)
!2286 = !DILocation(line: 237, column: 25, scope: !1990)
!2287 = !DILocation(line: 237, column: 15, scope: !1990)
!2288 = !DILocation(line: 227, column: 9, scope: !1990)
!2289 = !DILocation(line: 228, column: 11, scope: !1990)
!2290 = !DILocation(line: 236, column: 19, scope: !1990)
!2291 = !DILocation(line: 236, column: 25, scope: !1990)
!2292 = !DILocation(line: 236, column: 15, scope: !1990)
!2293 = !DILocation(line: 235, column: 19, scope: !1990)
!2294 = !DILocation(line: 235, column: 25, scope: !1990)
!2295 = !DILocation(line: 235, column: 15, scope: !1990)
!2296 = !DILocation(line: 234, column: 51, scope: !1990)
!2297 = !DILocation(line: 234, column: 22, scope: !1990)
!2298 = !DILocation(line: 233, column: 19, scope: !1990)
!2299 = !DILocation(line: 233, column: 25, scope: !1990)
!2300 = !DILocation(line: 234, column: 9, scope: !1990)
!2301 = !DILocation(line: 113, column: 42, scope: !1952)
!2302 = !DILocation(line: 113, column: 3, scope: !1952)
!2303 = distinct !{!2303, !1953, !2304, !105}
!2304 = !DILocation(line: 303, column: 3, scope: !1949)
!2305 = !DILocation(line: 306, column: 12, scope: !1894)
!2306 = !DILocation(line: 307, column: 3, scope: !1894)
!2307 = !DILocation(line: 307, column: 12, scope: !1894)
!2308 = !DILocation(line: 308, column: 3, scope: !1894)
!2309 = !DILocation(line: 308, column: 12, scope: !1894)
!2310 = !DILocation(line: 309, column: 3, scope: !1894)
!2311 = !DILocation(line: 309, column: 12, scope: !1894)
!2312 = !DILocation(line: 310, column: 3, scope: !1894)
!2313 = !DILocation(line: 310, column: 12, scope: !1894)
!2314 = !DILocation(line: 311, column: 3, scope: !1894)
!2315 = !DILocation(line: 311, column: 12, scope: !1894)
!2316 = !DILocation(line: 312, column: 3, scope: !1894)
!2317 = !DILocation(line: 312, column: 12, scope: !1894)
!2318 = !DILocation(line: 313, column: 3, scope: !1894)
!2319 = !DILocation(line: 313, column: 12, scope: !1894)
!2320 = !DILocation(line: 314, column: 3, scope: !1894)
!2321 = !DILocation(line: 314, column: 12, scope: !1894)
!2322 = !DILocation(line: 315, column: 3, scope: !1894)
!2323 = !DILocation(line: 315, column: 12, scope: !1894)
!2324 = !DILocation(line: 316, column: 3, scope: !1894)
!2325 = !DILocation(line: 316, column: 13, scope: !1894)
!2326 = !DILocation(line: 317, column: 3, scope: !1894)
!2327 = !DILocation(line: 317, column: 13, scope: !1894)
!2328 = !DILocation(line: 318, column: 3, scope: !1894)
!2329 = !DILocation(line: 318, column: 13, scope: !1894)
!2330 = !DILocation(line: 319, column: 3, scope: !1894)
!2331 = !DILocation(line: 319, column: 13, scope: !1894)
!2332 = !DILocation(line: 320, column: 3, scope: !1894)
!2333 = !DILocation(line: 320, column: 13, scope: !1894)
!2334 = !DILocation(line: 321, column: 3, scope: !1894)
!2335 = !DILocation(line: 321, column: 13, scope: !1894)
!2336 = !DILocation(line: 322, column: 3, scope: !1894)
!2337 = !DILocation(line: 322, column: 13, scope: !1894)
!2338 = !DILocation(line: 323, column: 3, scope: !1894)
!2339 = !DILocation(line: 323, column: 13, scope: !1894)
!2340 = !DILocation(line: 324, column: 3, scope: !1894)
!2341 = !DILocation(line: 324, column: 13, scope: !1894)
!2342 = !DILocation(line: 325, column: 3, scope: !1894)
!2343 = !DILocation(line: 325, column: 13, scope: !1894)
!2344 = !DILocation(line: 326, column: 3, scope: !1894)
!2345 = !DILocation(line: 326, column: 13, scope: !1894)
!2346 = !DILocation(line: 327, column: 3, scope: !1894)
!2347 = !DILocation(line: 327, column: 13, scope: !1894)
!2348 = !DILocation(line: 328, column: 3, scope: !1894)
!2349 = !DILocation(line: 328, column: 13, scope: !1894)
!2350 = !DILocation(line: 329, column: 3, scope: !1894)
!2351 = !DILocation(line: 329, column: 13, scope: !1894)
!2352 = !DILocation(line: 330, column: 3, scope: !1894)
!2353 = !DILocation(line: 330, column: 13, scope: !1894)
!2354 = !DILocation(line: 331, column: 1, scope: !1894)
!2355 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_finalize", scope: !49, file: !49, line: 524, type: !1798, scopeLine: 524, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2356 = !DILocalVariable(name: "state", arg: 1, scope: !2355, file: !49, line: 524, type: !1800)
!2357 = !DILocation(line: 0, scope: !2355)
!2358 = !DILocation(line: 525, column: 27, scope: !2355)
!2359 = !DILocation(line: 525, column: 3, scope: !2355)
!2360 = !DILocation(line: 526, column: 3, scope: !2355)
!2361 = !DILocation(line: 526, column: 29, scope: !2355)
!2362 = !DILocation(line: 527, column: 1, scope: !2355)
!2363 = distinct !DISubprogram(name: "keccak_finalize", scope: !49, file: !49, line: 388, type: !2364, scopeLine: 389, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2364 = !DISubroutineType(types: !2365)
!2365 = !{null, !1810, !14, !14, !7}
!2366 = !DILocalVariable(name: "s", arg: 1, scope: !2363, file: !49, line: 388, type: !1810)
!2367 = !DILocation(line: 0, scope: !2363)
!2368 = !DILocalVariable(name: "pos", arg: 2, scope: !2363, file: !49, line: 388, type: !14)
!2369 = !DILocalVariable(name: "r", arg: 3, scope: !2363, file: !49, line: 388, type: !14)
!2370 = !DILocalVariable(name: "p", arg: 4, scope: !2363, file: !49, line: 389, type: !7)
!2371 = !DILocation(line: 390, column: 34, scope: !2363)
!2372 = !DILocation(line: 390, column: 29, scope: !2363)
!2373 = !DILocation(line: 390, column: 9, scope: !2363)
!2374 = !DILocation(line: 390, column: 3, scope: !2363)
!2375 = !DILocation(line: 390, column: 14, scope: !2363)
!2376 = !DILocation(line: 391, column: 7, scope: !2363)
!2377 = !DILocation(line: 391, column: 3, scope: !2363)
!2378 = !DILocation(line: 391, column: 16, scope: !2363)
!2379 = !DILocation(line: 392, column: 1, scope: !2363)
!2380 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeeze", scope: !49, file: !49, line: 540, type: !2381, scopeLine: 540, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2381 = !DISubroutineType(types: !2382)
!2382 = !{null, !6, !12, !1800}
!2383 = !DILocalVariable(name: "out", arg: 1, scope: !2380, file: !49, line: 540, type: !6)
!2384 = !DILocation(line: 0, scope: !2380)
!2385 = !DILocalVariable(name: "outlen", arg: 2, scope: !2380, file: !49, line: 540, type: !12)
!2386 = !DILocalVariable(name: "state", arg: 3, scope: !2380, file: !49, line: 540, type: !1800)
!2387 = !DILocation(line: 542, column: 28, scope: !2380)
!2388 = !DILocation(line: 541, column: 31, scope: !2380)
!2389 = !DILocation(line: 541, column: 3, scope: !2380)
!2390 = !DILocation(line: 541, column: 29, scope: !2380)
!2391 = !DILocation(line: 543, column: 1, scope: !2380)
!2392 = distinct !DISubprogram(name: "keccak_squeeze", scope: !49, file: !49, line: 410, type: !2393, scopeLine: 411, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2393 = !DISubroutineType(types: !2394)
!2394 = !{!14, !6, !12, !1810, !14, !14}
!2395 = !DILocalVariable(name: "out", arg: 1, scope: !2392, file: !49, line: 410, type: !6)
!2396 = !DILocation(line: 0, scope: !2392)
!2397 = !DILocalVariable(name: "outlen", arg: 2, scope: !2392, file: !49, line: 410, type: !12)
!2398 = !DILocalVariable(name: "s", arg: 3, scope: !2392, file: !49, line: 410, type: !1810)
!2399 = !DILocalVariable(name: "pos", arg: 4, scope: !2392, file: !49, line: 411, type: !14)
!2400 = !DILocalVariable(name: "r", arg: 5, scope: !2392, file: !49, line: 411, type: !14)
!2401 = !DILocation(line: 414, column: 3, scope: !2392)
!2402 = !DILocation(line: 415, column: 13, scope: !2403)
!2403 = distinct !DILexicalBlock(scope: !2404, file: !49, line: 415, column: 9)
!2404 = distinct !DILexicalBlock(scope: !2392, file: !49, line: 414, column: 18)
!2405 = !DILocation(line: 416, column: 7, scope: !2406)
!2406 = distinct !DILexicalBlock(scope: !2403, file: !49, line: 415, column: 19)
!2407 = !DILocation(line: 418, column: 5, scope: !2406)
!2408 = !DILocalVariable(name: "i", scope: !2392, file: !49, line: 412, type: !14)
!2409 = !DILocation(line: 419, column: 10, scope: !2410)
!2410 = distinct !DILexicalBlock(scope: !2404, file: !49, line: 419, column: 5)
!2411 = !DILocation(line: 419, scope: !2410)
!2412 = !DILocation(line: 419, column: 21, scope: !2413)
!2413 = distinct !DILexicalBlock(scope: !2410, file: !49, line: 419, column: 5)
!2414 = !DILocation(line: 419, column: 25, scope: !2413)
!2415 = !DILocation(line: 419, column: 5, scope: !2410)
!2416 = !DILocation(line: 420, column: 20, scope: !2413)
!2417 = !DILocation(line: 420, column: 16, scope: !2413)
!2418 = !DILocation(line: 420, column: 30, scope: !2413)
!2419 = !DILocation(line: 420, column: 25, scope: !2413)
!2420 = !DILocation(line: 420, column: 14, scope: !2413)
!2421 = !DILocation(line: 420, column: 11, scope: !2413)
!2422 = !DILocation(line: 419, column: 47, scope: !2413)
!2423 = !DILocation(line: 419, column: 5, scope: !2413)
!2424 = distinct !{!2424, !2415, !2425, !105}
!2425 = !DILocation(line: 420, column: 38, scope: !2410)
!2426 = !DILocation(line: 421, column: 17, scope: !2404)
!2427 = !DILocation(line: 421, column: 12, scope: !2404)
!2428 = distinct !{!2428, !2401, !2429, !105}
!2429 = !DILocation(line: 423, column: 3, scope: !2392)
!2430 = !DILocation(line: 425, column: 3, scope: !2392)
!2431 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb_once", scope: !49, file: !49, line: 556, type: !1828, scopeLine: 557, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2432 = !DILocalVariable(name: "state", arg: 1, scope: !2431, file: !49, line: 556, type: !1800)
!2433 = !DILocation(line: 0, scope: !2431)
!2434 = !DILocalVariable(name: "in", arg: 2, scope: !2431, file: !49, line: 556, type: !235)
!2435 = !DILocalVariable(name: "inlen", arg: 3, scope: !2431, file: !49, line: 557, type: !12)
!2436 = !DILocation(line: 558, column: 3, scope: !2431)
!2437 = !DILocation(line: 559, column: 3, scope: !2431)
!2438 = !DILocation(line: 559, column: 29, scope: !2431)
!2439 = !DILocation(line: 560, column: 1, scope: !2431)
!2440 = distinct !DISubprogram(name: "keccak_absorb_once", scope: !49, file: !49, line: 441, type: !2441, scopeLine: 442, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2441 = !DISubroutineType(types: !2442)
!2442 = !{null, !1810, !14, !235, !12, !7}
!2443 = !DILocalVariable(name: "s", arg: 1, scope: !2440, file: !49, line: 441, type: !1810)
!2444 = !DILocation(line: 0, scope: !2440)
!2445 = !DILocalVariable(name: "r", arg: 2, scope: !2440, file: !49, line: 441, type: !14)
!2446 = !DILocalVariable(name: "in", arg: 3, scope: !2440, file: !49, line: 442, type: !235)
!2447 = !DILocalVariable(name: "inlen", arg: 4, scope: !2440, file: !49, line: 442, type: !12)
!2448 = !DILocalVariable(name: "p", arg: 5, scope: !2440, file: !49, line: 442, type: !7)
!2449 = !DILocalVariable(name: "i", scope: !2440, file: !49, line: 443, type: !14)
!2450 = !DILocation(line: 445, column: 8, scope: !2451)
!2451 = distinct !DILexicalBlock(scope: !2440, file: !49, line: 445, column: 3)
!2452 = !DILocation(line: 445, scope: !2451)
!2453 = !DILocation(line: 445, column: 17, scope: !2454)
!2454 = distinct !DILexicalBlock(scope: !2451, file: !49, line: 445, column: 3)
!2455 = !DILocation(line: 445, column: 3, scope: !2451)
!2456 = !DILocation(line: 448, column: 3, scope: !2440)
!2457 = !DILocation(line: 446, column: 5, scope: !2454)
!2458 = !DILocation(line: 446, column: 10, scope: !2454)
!2459 = !DILocation(line: 445, column: 24, scope: !2454)
!2460 = !DILocation(line: 445, column: 3, scope: !2454)
!2461 = distinct !{!2461, !2455, !2462, !105}
!2462 = !DILocation(line: 446, column: 12, scope: !2451)
!2463 = !DILocation(line: 448, column: 16, scope: !2440)
!2464 = !DILocation(line: 449, column: 5, scope: !2465)
!2465 = distinct !DILexicalBlock(scope: !2466, file: !49, line: 449, column: 5)
!2466 = distinct !DILexicalBlock(scope: !2440, file: !49, line: 448, column: 22)
!2467 = !DILocation(line: 456, column: 3, scope: !2468)
!2468 = distinct !DILexicalBlock(scope: !2440, file: !49, line: 456, column: 3)
!2469 = !DILocation(line: 449, scope: !2465)
!2470 = !DILocation(line: 449, column: 19, scope: !2471)
!2471 = distinct !DILexicalBlock(scope: !2465, file: !49, line: 449, column: 5)
!2472 = !DILocation(line: 450, column: 29, scope: !2471)
!2473 = !DILocation(line: 450, column: 25, scope: !2471)
!2474 = !DILocation(line: 450, column: 15, scope: !2471)
!2475 = !DILocation(line: 450, column: 7, scope: !2471)
!2476 = !DILocation(line: 450, column: 12, scope: !2471)
!2477 = !DILocation(line: 449, column: 29, scope: !2471)
!2478 = !DILocation(line: 449, column: 5, scope: !2471)
!2479 = distinct !{!2479, !2464, !2480, !105}
!2480 = !DILocation(line: 450, column: 32, scope: !2465)
!2481 = !DILocation(line: 451, column: 8, scope: !2466)
!2482 = !DILocation(line: 452, column: 11, scope: !2466)
!2483 = !DILocation(line: 453, column: 5, scope: !2466)
!2484 = distinct !{!2484, !2456, !2485, !105}
!2485 = !DILocation(line: 454, column: 3, scope: !2440)
!2486 = !DILocation(line: 456, scope: !2468)
!2487 = !DILocation(line: 456, column: 17, scope: !2488)
!2488 = distinct !DILexicalBlock(scope: !2468, file: !49, line: 456, column: 3)
!2489 = !DILocation(line: 457, column: 27, scope: !2488)
!2490 = !DILocation(line: 457, column: 17, scope: !2488)
!2491 = !DILocation(line: 457, column: 38, scope: !2488)
!2492 = !DILocation(line: 457, column: 33, scope: !2488)
!2493 = !DILocation(line: 457, column: 9, scope: !2488)
!2494 = !DILocation(line: 457, column: 5, scope: !2488)
!2495 = !DILocation(line: 457, column: 14, scope: !2488)
!2496 = !DILocation(line: 456, column: 27, scope: !2488)
!2497 = !DILocation(line: 456, column: 3, scope: !2488)
!2498 = distinct !{!2498, !2467, !2499, !105}
!2499 = !DILocation(line: 457, column: 46, scope: !2468)
!2500 = !DILocation(line: 459, column: 15, scope: !2440)
!2501 = !DILocation(line: 459, column: 32, scope: !2440)
!2502 = !DILocation(line: 459, column: 27, scope: !2440)
!2503 = !DILocation(line: 459, column: 7, scope: !2440)
!2504 = !DILocation(line: 459, column: 3, scope: !2440)
!2505 = !DILocation(line: 459, column: 12, scope: !2440)
!2506 = !DILocation(line: 460, column: 8, scope: !2440)
!2507 = !DILocation(line: 460, column: 13, scope: !2440)
!2508 = !DILocation(line: 460, column: 3, scope: !2440)
!2509 = !DILocation(line: 460, column: 18, scope: !2440)
!2510 = !DILocation(line: 461, column: 1, scope: !2440)
!2511 = distinct !DISubprogram(name: "load64", scope: !49, file: !49, line: 22, type: !2512, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2512 = !DISubroutineType(types: !2513)
!2513 = !{!45, !235}
!2514 = !DILocalVariable(name: "x", arg: 1, scope: !2511, file: !49, line: 22, type: !235)
!2515 = !DILocation(line: 0, scope: !2511)
!2516 = !DILocalVariable(name: "r", scope: !2511, file: !49, line: 24, type: !45)
!2517 = !DILocalVariable(name: "i", scope: !2511, file: !49, line: 23, type: !14)
!2518 = !DILocation(line: 26, column: 8, scope: !2519)
!2519 = distinct !DILexicalBlock(scope: !2511, file: !49, line: 26, column: 3)
!2520 = !DILocation(line: 26, scope: !2519)
!2521 = !DILocation(line: 26, column: 17, scope: !2522)
!2522 = distinct !DILexicalBlock(scope: !2519, file: !49, line: 26, column: 3)
!2523 = !DILocation(line: 26, column: 3, scope: !2519)
!2524 = !DILocation(line: 27, column: 20, scope: !2522)
!2525 = !DILocation(line: 27, column: 10, scope: !2522)
!2526 = !DILocation(line: 27, column: 30, scope: !2522)
!2527 = !DILocation(line: 27, column: 25, scope: !2522)
!2528 = !DILocation(line: 27, column: 7, scope: !2522)
!2529 = !DILocation(line: 26, column: 23, scope: !2522)
!2530 = !DILocation(line: 26, column: 3, scope: !2522)
!2531 = distinct !{!2531, !2523, !2532, !105}
!2532 = !DILocation(line: 27, column: 32, scope: !2519)
!2533 = !DILocation(line: 29, column: 3, scope: !2511)
!2534 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeezeblocks", scope: !49, file: !49, line: 575, type: !2381, scopeLine: 575, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2535 = !DILocalVariable(name: "out", arg: 1, scope: !2534, file: !49, line: 575, type: !6)
!2536 = !DILocation(line: 0, scope: !2534)
!2537 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2534, file: !49, line: 575, type: !12)
!2538 = !DILocalVariable(name: "state", arg: 3, scope: !2534, file: !49, line: 575, type: !1800)
!2539 = !DILocation(line: 576, column: 3, scope: !2534)
!2540 = !DILocation(line: 577, column: 1, scope: !2534)
!2541 = distinct !DISubprogram(name: "keccak_squeezeblocks", scope: !49, file: !49, line: 477, type: !2542, scopeLine: 478, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2542 = !DISubroutineType(types: !2543)
!2543 = !{null, !6, !12, !1810, !14}
!2544 = !DILocalVariable(name: "out", arg: 1, scope: !2541, file: !49, line: 477, type: !6)
!2545 = !DILocation(line: 0, scope: !2541)
!2546 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2541, file: !49, line: 477, type: !12)
!2547 = !DILocalVariable(name: "s", arg: 3, scope: !2541, file: !49, line: 477, type: !1810)
!2548 = !DILocalVariable(name: "r", arg: 4, scope: !2541, file: !49, line: 478, type: !14)
!2549 = !DILocation(line: 481, column: 3, scope: !2541)
!2550 = !DILocation(line: 482, column: 5, scope: !2551)
!2551 = distinct !DILexicalBlock(scope: !2541, file: !49, line: 481, column: 19)
!2552 = !DILocalVariable(name: "i", scope: !2541, file: !49, line: 479, type: !14)
!2553 = !DILocation(line: 483, column: 10, scope: !2554)
!2554 = distinct !DILexicalBlock(scope: !2551, file: !49, line: 483, column: 5)
!2555 = !DILocation(line: 483, scope: !2554)
!2556 = !DILocation(line: 483, column: 19, scope: !2557)
!2557 = distinct !DILexicalBlock(scope: !2554, file: !49, line: 483, column: 5)
!2558 = !DILocation(line: 483, column: 5, scope: !2554)
!2559 = !DILocation(line: 484, column: 23, scope: !2557)
!2560 = !DILocation(line: 484, column: 19, scope: !2557)
!2561 = !DILocation(line: 484, column: 28, scope: !2557)
!2562 = !DILocation(line: 484, column: 7, scope: !2557)
!2563 = !DILocation(line: 483, column: 29, scope: !2557)
!2564 = !DILocation(line: 483, column: 5, scope: !2557)
!2565 = distinct !{!2565, !2558, !2566, !105}
!2566 = !DILocation(line: 484, column: 32, scope: !2554)
!2567 = !DILocation(line: 485, column: 9, scope: !2551)
!2568 = !DILocation(line: 486, column: 13, scope: !2551)
!2569 = distinct !{!2569, !2549, !2570, !105}
!2570 = !DILocation(line: 487, column: 3, scope: !2541)
!2571 = !DILocation(line: 488, column: 1, scope: !2541)
!2572 = distinct !DISubprogram(name: "store64", scope: !49, file: !49, line: 41, type: !2573, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2573 = !DISubroutineType(types: !2574)
!2574 = !{null, !6, !45}
!2575 = !DILocalVariable(name: "x", arg: 1, scope: !2572, file: !49, line: 41, type: !6)
!2576 = !DILocation(line: 0, scope: !2572)
!2577 = !DILocalVariable(name: "u", arg: 2, scope: !2572, file: !49, line: 41, type: !45)
!2578 = !DILocalVariable(name: "i", scope: !2572, file: !49, line: 42, type: !14)
!2579 = !DILocation(line: 44, column: 8, scope: !2580)
!2580 = distinct !DILexicalBlock(scope: !2572, file: !49, line: 44, column: 3)
!2581 = !DILocation(line: 44, scope: !2580)
!2582 = !DILocation(line: 44, column: 17, scope: !2583)
!2583 = distinct !DILexicalBlock(scope: !2580, file: !49, line: 44, column: 3)
!2584 = !DILocation(line: 44, column: 3, scope: !2580)
!2585 = !DILocation(line: 45, column: 19, scope: !2583)
!2586 = !DILocation(line: 45, column: 14, scope: !2583)
!2587 = !DILocation(line: 45, column: 12, scope: !2583)
!2588 = !DILocation(line: 45, column: 5, scope: !2583)
!2589 = !DILocation(line: 45, column: 10, scope: !2583)
!2590 = !DILocation(line: 44, column: 23, scope: !2583)
!2591 = !DILocation(line: 44, column: 3, scope: !2583)
!2592 = distinct !{!2592, !2584, !2593, !105}
!2593 = !DILocation(line: 45, column: 21, scope: !2580)
!2594 = !DILocation(line: 46, column: 1, scope: !2572)
!2595 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_init", scope: !49, file: !49, line: 586, type: !1798, scopeLine: 586, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2596 = !DILocalVariable(name: "state", arg: 1, scope: !2595, file: !49, line: 586, type: !1800)
!2597 = !DILocation(line: 0, scope: !2595)
!2598 = !DILocation(line: 587, column: 3, scope: !2595)
!2599 = !DILocation(line: 588, column: 3, scope: !2595)
!2600 = !DILocation(line: 588, column: 29, scope: !2595)
!2601 = !DILocation(line: 589, column: 1, scope: !2595)
!2602 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb", scope: !49, file: !49, line: 601, type: !1828, scopeLine: 601, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2603 = !DILocalVariable(name: "state", arg: 1, scope: !2602, file: !49, line: 601, type: !1800)
!2604 = !DILocation(line: 0, scope: !2602)
!2605 = !DILocalVariable(name: "in", arg: 2, scope: !2602, file: !49, line: 601, type: !235)
!2606 = !DILocalVariable(name: "inlen", arg: 3, scope: !2602, file: !49, line: 601, type: !12)
!2607 = !DILocation(line: 602, column: 53, scope: !2602)
!2608 = !DILocation(line: 602, column: 31, scope: !2602)
!2609 = !DILocation(line: 602, column: 3, scope: !2602)
!2610 = !DILocation(line: 602, column: 29, scope: !2602)
!2611 = !DILocation(line: 604, column: 1, scope: !2602)
!2612 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_finalize", scope: !49, file: !49, line: 613, type: !1798, scopeLine: 613, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2613 = !DILocalVariable(name: "state", arg: 1, scope: !2612, file: !49, line: 613, type: !1800)
!2614 = !DILocation(line: 0, scope: !2612)
!2615 = !DILocation(line: 614, column: 27, scope: !2612)
!2616 = !DILocation(line: 614, column: 3, scope: !2612)
!2617 = !DILocation(line: 615, column: 3, scope: !2612)
!2618 = !DILocation(line: 615, column: 29, scope: !2612)
!2619 = !DILocation(line: 616, column: 1, scope: !2612)
!2620 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeeze", scope: !49, file: !49, line: 629, type: !2381, scopeLine: 629, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2621 = !DILocalVariable(name: "out", arg: 1, scope: !2620, file: !49, line: 629, type: !6)
!2622 = !DILocation(line: 0, scope: !2620)
!2623 = !DILocalVariable(name: "outlen", arg: 2, scope: !2620, file: !49, line: 629, type: !12)
!2624 = !DILocalVariable(name: "state", arg: 3, scope: !2620, file: !49, line: 629, type: !1800)
!2625 = !DILocation(line: 631, column: 28, scope: !2620)
!2626 = !DILocation(line: 630, column: 31, scope: !2620)
!2627 = !DILocation(line: 630, column: 3, scope: !2620)
!2628 = !DILocation(line: 630, column: 29, scope: !2620)
!2629 = !DILocation(line: 632, column: 1, scope: !2620)
!2630 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb_once", scope: !49, file: !49, line: 645, type: !1828, scopeLine: 646, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2631 = !DILocalVariable(name: "state", arg: 1, scope: !2630, file: !49, line: 645, type: !1800)
!2632 = !DILocation(line: 0, scope: !2630)
!2633 = !DILocalVariable(name: "in", arg: 2, scope: !2630, file: !49, line: 645, type: !235)
!2634 = !DILocalVariable(name: "inlen", arg: 3, scope: !2630, file: !49, line: 646, type: !12)
!2635 = !DILocation(line: 647, column: 3, scope: !2630)
!2636 = !DILocation(line: 648, column: 3, scope: !2630)
!2637 = !DILocation(line: 648, column: 29, scope: !2630)
!2638 = !DILocation(line: 649, column: 1, scope: !2630)
!2639 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeezeblocks", scope: !49, file: !49, line: 664, type: !2381, scopeLine: 664, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2640 = !DILocalVariable(name: "out", arg: 1, scope: !2639, file: !49, line: 664, type: !6)
!2641 = !DILocation(line: 0, scope: !2639)
!2642 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2639, file: !49, line: 664, type: !12)
!2643 = !DILocalVariable(name: "state", arg: 3, scope: !2639, file: !49, line: 664, type: !1800)
!2644 = !DILocation(line: 665, column: 3, scope: !2639)
!2645 = !DILocation(line: 666, column: 1, scope: !2639)
!2646 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128", scope: !49, file: !49, line: 678, type: !2647, scopeLine: 678, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2647 = !DISubroutineType(types: !2648)
!2648 = !{null, !6, !12, !235, !12}
!2649 = !DILocalVariable(name: "out", arg: 1, scope: !2646, file: !49, line: 678, type: !6)
!2650 = !DILocation(line: 0, scope: !2646)
!2651 = !DILocalVariable(name: "outlen", arg: 2, scope: !2646, file: !49, line: 678, type: !12)
!2652 = !DILocalVariable(name: "in", arg: 3, scope: !2646, file: !49, line: 678, type: !235)
!2653 = !DILocalVariable(name: "inlen", arg: 4, scope: !2646, file: !49, line: 678, type: !12)
!2654 = !DILocalVariable(name: "state", scope: !2646, file: !49, line: 680, type: !347)
!2655 = !DILocation(line: 680, column: 16, scope: !2646)
!2656 = !DILocation(line: 682, column: 3, scope: !2646)
!2657 = !DILocation(line: 683, column: 20, scope: !2646)
!2658 = !DILocalVariable(name: "nblocks", scope: !2646, file: !49, line: 679, type: !12)
!2659 = !DILocation(line: 684, column: 3, scope: !2646)
!2660 = !DILocation(line: 685, column: 21, scope: !2646)
!2661 = !DILocation(line: 685, column: 10, scope: !2646)
!2662 = !DILocation(line: 686, column: 18, scope: !2646)
!2663 = !DILocation(line: 686, column: 7, scope: !2646)
!2664 = !DILocation(line: 687, column: 3, scope: !2646)
!2665 = !DILocation(line: 688, column: 1, scope: !2646)
!2666 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256", scope: !49, file: !49, line: 700, type: !2647, scopeLine: 700, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2667 = !DILocalVariable(name: "out", arg: 1, scope: !2666, file: !49, line: 700, type: !6)
!2668 = !DILocation(line: 0, scope: !2666)
!2669 = !DILocalVariable(name: "outlen", arg: 2, scope: !2666, file: !49, line: 700, type: !12)
!2670 = !DILocalVariable(name: "in", arg: 3, scope: !2666, file: !49, line: 700, type: !235)
!2671 = !DILocalVariable(name: "inlen", arg: 4, scope: !2666, file: !49, line: 700, type: !12)
!2672 = !DILocalVariable(name: "state", scope: !2666, file: !49, line: 702, type: !347)
!2673 = !DILocation(line: 702, column: 16, scope: !2666)
!2674 = !DILocation(line: 704, column: 3, scope: !2666)
!2675 = !DILocation(line: 705, column: 20, scope: !2666)
!2676 = !DILocalVariable(name: "nblocks", scope: !2666, file: !49, line: 701, type: !12)
!2677 = !DILocation(line: 706, column: 3, scope: !2666)
!2678 = !DILocation(line: 707, column: 21, scope: !2666)
!2679 = !DILocation(line: 707, column: 10, scope: !2666)
!2680 = !DILocation(line: 708, column: 18, scope: !2666)
!2681 = !DILocation(line: 708, column: 7, scope: !2666)
!2682 = !DILocation(line: 709, column: 3, scope: !2666)
!2683 = !DILocation(line: 710, column: 1, scope: !2666)
!2684 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_256", scope: !49, file: !49, line: 721, type: !2685, scopeLine: 721, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2685 = !DISubroutineType(types: !2686)
!2686 = !{null, !6, !235, !12}
!2687 = !DILocalVariable(name: "h", arg: 1, scope: !2684, file: !49, line: 721, type: !6)
!2688 = !DILocation(line: 0, scope: !2684)
!2689 = !DILocalVariable(name: "in", arg: 2, scope: !2684, file: !49, line: 721, type: !235)
!2690 = !DILocalVariable(name: "inlen", arg: 3, scope: !2684, file: !49, line: 721, type: !12)
!2691 = !DILocalVariable(name: "s", scope: !2684, file: !49, line: 723, type: !2692)
!2692 = !DICompositeType(tag: DW_TAG_array_type, baseType: !45, size: 1600, elements: !2693)
!2693 = !{!2694}
!2694 = !DISubrange(count: 25)
!2695 = !DILocation(line: 723, column: 12, scope: !2684)
!2696 = !DILocation(line: 725, column: 3, scope: !2684)
!2697 = !DILocation(line: 726, column: 3, scope: !2684)
!2698 = !DILocalVariable(name: "i", scope: !2684, file: !49, line: 722, type: !14)
!2699 = !DILocation(line: 727, column: 8, scope: !2700)
!2700 = distinct !DILexicalBlock(scope: !2684, file: !49, line: 727, column: 3)
!2701 = !DILocation(line: 727, scope: !2700)
!2702 = !DILocation(line: 727, column: 17, scope: !2703)
!2703 = distinct !DILexicalBlock(scope: !2700, file: !49, line: 727, column: 3)
!2704 = !DILocation(line: 727, column: 3, scope: !2700)
!2705 = !DILocation(line: 728, column: 19, scope: !2703)
!2706 = !DILocation(line: 728, column: 15, scope: !2703)
!2707 = !DILocation(line: 728, column: 24, scope: !2703)
!2708 = !DILocation(line: 728, column: 5, scope: !2703)
!2709 = !DILocation(line: 727, column: 23, scope: !2703)
!2710 = !DILocation(line: 727, column: 3, scope: !2703)
!2711 = distinct !{!2711, !2704, !2712, !105}
!2712 = !DILocation(line: 728, column: 28, scope: !2700)
!2713 = !DILocation(line: 729, column: 1, scope: !2684)
!2714 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_512", scope: !49, file: !49, line: 740, type: !2685, scopeLine: 740, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2715 = !DILocalVariable(name: "h", arg: 1, scope: !2714, file: !49, line: 740, type: !6)
!2716 = !DILocation(line: 0, scope: !2714)
!2717 = !DILocalVariable(name: "in", arg: 2, scope: !2714, file: !49, line: 740, type: !235)
!2718 = !DILocalVariable(name: "inlen", arg: 3, scope: !2714, file: !49, line: 740, type: !12)
!2719 = !DILocalVariable(name: "s", scope: !2714, file: !49, line: 742, type: !2692)
!2720 = !DILocation(line: 742, column: 12, scope: !2714)
!2721 = !DILocation(line: 744, column: 3, scope: !2714)
!2722 = !DILocation(line: 745, column: 3, scope: !2714)
!2723 = !DILocalVariable(name: "i", scope: !2714, file: !49, line: 741, type: !14)
!2724 = !DILocation(line: 746, column: 8, scope: !2725)
!2725 = distinct !DILexicalBlock(scope: !2714, file: !49, line: 746, column: 3)
!2726 = !DILocation(line: 746, scope: !2725)
!2727 = !DILocation(line: 746, column: 17, scope: !2728)
!2728 = distinct !DILexicalBlock(scope: !2725, file: !49, line: 746, column: 3)
!2729 = !DILocation(line: 746, column: 3, scope: !2725)
!2730 = !DILocation(line: 747, column: 19, scope: !2728)
!2731 = !DILocation(line: 747, column: 15, scope: !2728)
!2732 = !DILocation(line: 747, column: 24, scope: !2728)
!2733 = !DILocation(line: 747, column: 5, scope: !2728)
!2734 = !DILocation(line: 746, column: 23, scope: !2728)
!2735 = !DILocation(line: 746, column: 3, scope: !2728)
!2736 = distinct !{!2736, !2729, !2737, !105}
!2737 = !DILocation(line: 747, column: 28, scope: !2725)
!2738 = !DILocation(line: 748, column: 1, scope: !2714)
!2739 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_kyber_shake128_absorb", scope: !2740, file: !2740, line: 18, type: !2741, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !74, retainedNodes: !24)
!2740 = !DIFile(filename: "../../../ref/symmetric-shake.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!2741 = !DISubroutineType(types: !2742)
!2742 = !{null, !1800, !235, !7, !7}
!2743 = !DILocalVariable(name: "state", arg: 1, scope: !2739, file: !2740, line: 18, type: !1800)
!2744 = !DILocation(line: 0, scope: !2739)
!2745 = !DILocalVariable(name: "seed", arg: 2, scope: !2739, file: !2740, line: 19, type: !235)
!2746 = !DILocalVariable(name: "x", arg: 3, scope: !2739, file: !2740, line: 20, type: !7)
!2747 = !DILocalVariable(name: "y", arg: 4, scope: !2739, file: !2740, line: 21, type: !7)
!2748 = !DILocalVariable(name: "extseed", scope: !2739, file: !2740, line: 23, type: !2749)
!2749 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 272, elements: !2750)
!2750 = !{!2751}
!2751 = !DISubrange(count: 34)
!2752 = !DILocation(line: 23, column: 11, scope: !2739)
!2753 = !DILocation(line: 25, column: 3, scope: !2739)
!2754 = !DILocation(line: 26, column: 3, scope: !2739)
!2755 = !DILocation(line: 26, column: 29, scope: !2739)
!2756 = !DILocation(line: 27, column: 3, scope: !2739)
!2757 = !DILocation(line: 27, column: 29, scope: !2739)
!2758 = !DILocation(line: 29, column: 3, scope: !2739)
!2759 = !DILocation(line: 30, column: 1, scope: !2739)
!2760 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_kyber_shake256_prf", scope: !2740, file: !2740, line: 43, type: !2761, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !74, retainedNodes: !24)
!2761 = !DISubroutineType(types: !2762)
!2762 = !{null, !6, !12, !235, !7}
!2763 = !DILocalVariable(name: "out", arg: 1, scope: !2760, file: !2740, line: 43, type: !6)
!2764 = !DILocation(line: 0, scope: !2760)
!2765 = !DILocalVariable(name: "outlen", arg: 2, scope: !2760, file: !2740, line: 43, type: !12)
!2766 = !DILocalVariable(name: "key", arg: 3, scope: !2760, file: !2740, line: 43, type: !235)
!2767 = !DILocalVariable(name: "nonce", arg: 4, scope: !2760, file: !2740, line: 43, type: !7)
!2768 = !DILocalVariable(name: "extkey", scope: !2760, file: !2740, line: 45, type: !2769)
!2769 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 264, elements: !2770)
!2770 = !{!2771}
!2771 = !DISubrange(count: 33)
!2772 = !DILocation(line: 45, column: 11, scope: !2760)
!2773 = !DILocation(line: 47, column: 3, scope: !2760)
!2774 = !DILocation(line: 48, column: 3, scope: !2760)
!2775 = !DILocation(line: 48, column: 26, scope: !2760)
!2776 = !DILocation(line: 50, column: 3, scope: !2760)
!2777 = !DILocation(line: 51, column: 1, scope: !2760)
!2778 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_kyber_shake256_rkprf", scope: !2740, file: !2740, line: 64, type: !642, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !74, retainedNodes: !24)
!2779 = !DILocalVariable(name: "out", arg: 1, scope: !2778, file: !2740, line: 64, type: !6)
!2780 = !DILocation(line: 0, scope: !2778)
!2781 = !DILocalVariable(name: "key", arg: 2, scope: !2778, file: !2740, line: 64, type: !235)
!2782 = !DILocalVariable(name: "input", arg: 3, scope: !2778, file: !2740, line: 64, type: !235)
!2783 = !DILocalVariable(name: "s", scope: !2778, file: !2740, line: 66, type: !347)
!2784 = !DILocation(line: 66, column: 16, scope: !2778)
!2785 = !DILocation(line: 68, column: 3, scope: !2778)
!2786 = !DILocation(line: 69, column: 3, scope: !2778)
!2787 = !DILocation(line: 70, column: 3, scope: !2778)
!2788 = !DILocation(line: 71, column: 3, scope: !2778)
!2789 = !DILocation(line: 72, column: 3, scope: !2778)
!2790 = !DILocation(line: 73, column: 1, scope: !2778)
