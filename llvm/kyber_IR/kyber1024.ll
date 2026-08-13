; ModuleID = 'kyber_composite'
source_filename = "kyber_composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "thumbv7em-unknown-none-eabihf"

@randombytes.fd = internal unnamed_addr global i32 -1, align 4, !dbg !0
@.str = private unnamed_addr constant [13 x i8] c"/dev/urandom\00", align 1, !dbg !18
@pqcrystals_kyber1024_ref_zetas = dso_local local_unnamed_addr constant [128 x i16] [i16 -1044, i16 -758, i16 -359, i16 -1517, i16 1493, i16 1422, i16 287, i16 202, i16 -171, i16 622, i16 1577, i16 182, i16 962, i16 -1202, i16 -1474, i16 1468, i16 573, i16 -1325, i16 264, i16 383, i16 -829, i16 1458, i16 -1602, i16 -130, i16 -681, i16 1017, i16 732, i16 608, i16 -1542, i16 411, i16 -205, i16 -1571, i16 1223, i16 652, i16 -552, i16 1015, i16 -1293, i16 1491, i16 -282, i16 -1544, i16 516, i16 -8, i16 -320, i16 -666, i16 -1618, i16 -1162, i16 126, i16 1469, i16 -853, i16 -90, i16 -271, i16 830, i16 107, i16 -1421, i16 -247, i16 -951, i16 -398, i16 961, i16 -1508, i16 -725, i16 448, i16 -1065, i16 677, i16 -1275, i16 -1103, i16 430, i16 555, i16 843, i16 -1251, i16 871, i16 1550, i16 105, i16 422, i16 587, i16 177, i16 -235, i16 -291, i16 -460, i16 1574, i16 1653, i16 -246, i16 778, i16 1159, i16 -147, i16 -777, i16 1483, i16 -602, i16 1119, i16 -1590, i16 644, i16 -872, i16 349, i16 418, i16 329, i16 -156, i16 -75, i16 817, i16 1097, i16 603, i16 610, i16 1322, i16 -1285, i16 -1465, i16 384, i16 -1215, i16 -136, i16 1218, i16 -1335, i16 -874, i16 220, i16 -1187, i16 -1659, i16 -1185, i16 -1530, i16 -1278, i16 794, i16 -1510, i16 -854, i16 -870, i16 478, i16 -108, i16 -308, i16 996, i16 991, i16 958, i16 -1460, i16 1522, i16 1628], align 2, !dbg !26
@KeccakF_RoundConstants = internal unnamed_addr constant [24 x i64] [i64 1, i64 32898, i64 -9223372036854742902, i64 -9223372034707259392, i64 32907, i64 2147483649, i64 -9223372034707259263, i64 -9223372036854743031, i64 138, i64 136, i64 2147516425, i64 2147483658, i64 2147516555, i64 -9223372036854775669, i64 -9223372036854742903, i64 -9223372036854743037, i64 -9223372036854743038, i64 -9223372036854775680, i64 32778, i64 -9223372034707292150, i64 -9223372034707259263, i64 -9223372036854742912, i64 2147483649, i64 -9223372034707259384], align 8, !dbg !41

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @main() local_unnamed_addr #0 !dbg !82 {
entry:
    #dbg_value(i32 0, !86, !DIExpression(), !87)
  br label %for.cond, !dbg !88

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !90
    #dbg_value(i32 %i.0, !86, !DIExpression(), !87)
  %exitcond = icmp ne i32 %i.0, 1000, !dbg !91
  br i1 %exitcond, label %for.body, label %return, !dbg !93

for.body:                                         ; preds = %for.cond
  %call = call fastcc i32 @test_keys() #3, !dbg !94
    #dbg_value(i32 %call, !96, !DIExpression(), !87)
  %call1 = call fastcc i32 @test_invalid_sk_a() #3, !dbg !97
  %or = or i32 %call, %call1, !dbg !98
    #dbg_value(i32 %or, !96, !DIExpression(), !87)
  %call2 = call fastcc i32 @test_invalid_ciphertext() #3, !dbg !99
  %or3 = or i32 %or, %call2, !dbg !100
    #dbg_value(i32 %or3, !96, !DIExpression(), !87)
  %tobool.not = icmp eq i32 %or3, 0, !dbg !101
  br i1 %tobool.not, label %for.inc, label %return, !dbg !101

for.inc:                                          ; preds = %for.body
  %inc = add nuw nsw i32 %i.0, 1, !dbg !103
    #dbg_value(i32 %inc, !86, !DIExpression(), !87)
  br label %for.cond, !dbg !104, !llvm.loop !105

return:                                           ; preds = %for.cond, %for.body
  %retval.0 = phi i32 [ 1, %for.body ], [ 0, %for.cond ], !dbg !87
  ret i32 %retval.0, !dbg !108
}

; Function Attrs: nounwind
define internal fastcc range(i32 0, 2) i32 @test_keys() unnamed_addr #0 !dbg !109 {
entry:
  %pk = alloca [1568 x i8], align 1
  %sk = alloca [3168 x i8], align 1
  %ct = alloca [1568 x i8], align 1
  %key_a = alloca [32 x i8], align 1
  %key_b = alloca [32 x i8], align 1
    #dbg_declare(ptr %pk, !110, !DIExpression(), !114)
    #dbg_declare(ptr %sk, !115, !DIExpression(), !119)
    #dbg_declare(ptr %ct, !120, !DIExpression(), !121)
    #dbg_declare(ptr %key_a, !122, !DIExpression(), !126)
    #dbg_declare(ptr %key_b, !127, !DIExpression(), !128)
  %call = call i32 @pqcrystals_kyber1024_ref_keypair(ptr noundef nonnull %pk, ptr noundef nonnull %sk) #3, !dbg !129
  %call5 = call i32 @pqcrystals_kyber1024_ref_enc(ptr noundef nonnull %ct, ptr noundef nonnull %key_b, ptr noundef nonnull %pk) #3, !dbg !130
  %call9 = call i32 @pqcrystals_kyber1024_ref_dec(ptr noundef nonnull %key_a, ptr noundef nonnull %ct, ptr noundef nonnull %sk) #3, !dbg !131
  %call12 = call i32 @memcmp(ptr noundef nonnull %key_a, ptr noundef nonnull %key_b, i32 noundef 32) #4, !dbg !132
  %tobool.not = icmp ne i32 %call12, 0, !dbg !132
  %. = zext i1 %tobool.not to i32, !dbg !134
  ret i32 %., !dbg !135
}

; Function Attrs: nounwind
define internal fastcc range(i32 0, 2) i32 @test_invalid_sk_a() unnamed_addr #0 !dbg !136 {
entry:
  %pk = alloca [1568 x i8], align 1
  %sk = alloca [3168 x i8], align 1
  %ct = alloca [1568 x i8], align 1
  %key_a = alloca [32 x i8], align 1
  %key_b = alloca [32 x i8], align 1
    #dbg_declare(ptr %pk, !137, !DIExpression(), !138)
    #dbg_declare(ptr %sk, !139, !DIExpression(), !140)
    #dbg_declare(ptr %ct, !141, !DIExpression(), !142)
    #dbg_declare(ptr %key_a, !143, !DIExpression(), !144)
    #dbg_declare(ptr %key_b, !145, !DIExpression(), !146)
  %call = call i32 @pqcrystals_kyber1024_ref_keypair(ptr noundef nonnull %pk, ptr noundef nonnull %sk) #3, !dbg !147
  %call5 = call i32 @pqcrystals_kyber1024_ref_enc(ptr noundef nonnull %ct, ptr noundef nonnull %key_b, ptr noundef nonnull %pk) #3, !dbg !148
  call void @randombytes(ptr noundef nonnull %sk, i32 noundef 3168) #3, !dbg !149
  %call10 = call i32 @pqcrystals_kyber1024_ref_dec(ptr noundef nonnull %key_a, ptr noundef nonnull %ct, ptr noundef nonnull %sk) #3, !dbg !150
  %call13 = call i32 @memcmp(ptr noundef nonnull %key_a, ptr noundef nonnull %key_b, i32 noundef 32) #4, !dbg !151
  %tobool.not = icmp eq i32 %call13, 0, !dbg !151
  %. = zext i1 %tobool.not to i32, !dbg !153
  ret i32 %., !dbg !154
}

; Function Attrs: nounwind
define internal fastcc range(i32 0, 2) i32 @test_invalid_ciphertext() unnamed_addr #0 !dbg !155 {
entry:
  %pk = alloca [1568 x i8], align 1
  %sk = alloca [3168 x i8], align 1
  %ct = alloca [1568 x i8], align 1
  %key_a = alloca [32 x i8], align 1
  %key_b = alloca [32 x i8], align 1
  %b = alloca i8, align 1
  %pos = alloca i32, align 4
    #dbg_declare(ptr %pk, !156, !DIExpression(), !157)
    #dbg_declare(ptr %sk, !158, !DIExpression(), !159)
    #dbg_declare(ptr %ct, !160, !DIExpression(), !161)
    #dbg_declare(ptr %key_a, !162, !DIExpression(), !163)
    #dbg_declare(ptr %key_b, !164, !DIExpression(), !165)
  br label %do.body, !dbg !166

do.body:                                          ; preds = %do.body, %entry
    #dbg_value(ptr %b, !167, !DIExpression(DW_OP_deref), !168)
  call void @randombytes(ptr noundef nonnull %b, i32 noundef 1) #3, !dbg !169
  %0 = load i8, ptr %b, align 1, !dbg !171
    #dbg_value(i8 %0, !167, !DIExpression(), !168)
  %tobool.not = icmp eq i8 %0, 0, !dbg !172
  br i1 %tobool.not, label %do.body, label %do.end, !dbg !173, !llvm.loop !174

do.end:                                           ; preds = %do.body
    #dbg_value(ptr %pos, !176, !DIExpression(DW_OP_deref), !168)
  call void @randombytes(ptr noundef nonnull %pos, i32 noundef 4) #3, !dbg !177
  %call = call i32 @pqcrystals_kyber1024_ref_keypair(ptr noundef nonnull %pk, ptr noundef nonnull %sk) #3, !dbg !178
  %call5 = call i32 @pqcrystals_kyber1024_ref_enc(ptr noundef nonnull %ct, ptr noundef nonnull %key_b, ptr noundef nonnull %pk) #3, !dbg !179
  %1 = load i8, ptr %b, align 1, !dbg !180
    #dbg_value(i8 %1, !167, !DIExpression(), !168)
  %2 = load i32, ptr %pos, align 4, !dbg !181
    #dbg_value(i32 %2, !176, !DIExpression(), !168)
  %rem = urem i32 %2, 1568, !dbg !182
  %arrayidx = getelementptr inbounds nuw [1568 x i8], ptr %ct, i32 0, i32 %rem, !dbg !183
  %3 = load i8, ptr %arrayidx, align 1, !dbg !184
  %xor1 = xor i8 %3, %1, !dbg !184
  store i8 %xor1, ptr %arrayidx, align 1, !dbg !184
  %call11 = call i32 @pqcrystals_kyber1024_ref_dec(ptr noundef nonnull %key_a, ptr noundef nonnull %ct, ptr noundef nonnull %sk) #3, !dbg !185
  %call14 = call i32 @memcmp(ptr noundef nonnull %key_a, ptr noundef nonnull %key_b, i32 noundef 32) #4, !dbg !186
  %tobool15.not = icmp eq i32 %call14, 0, !dbg !186
  %. = zext i1 %tobool15.not to i32, !dbg !168
  ret i32 %., !dbg !188
}

declare dso_local i32 @memcmp(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local void @randombytes(ptr noundef %out, i32 noundef %outlen) local_unnamed_addr #0 !dbg !2 {
entry:
    #dbg_value(ptr %out, !189, !DIExpression(), !190)
    #dbg_value(i32 %outlen, !191, !DIExpression(), !190)
  br label %while.cond, !dbg !192

while.cond:                                       ; preds = %while.cond.backedge, %entry
  %0 = load i32, ptr @randombytes.fd, align 4, !dbg !193
  %cmp = icmp eq i32 %0, -1, !dbg !194
  br i1 %cmp, label %while.body, label %while.cond7.preheader, !dbg !192

while.cond7.preheader:                            ; preds = %while.cond
  br label %while.cond7.outer, !dbg !195

while.body:                                       ; preds = %while.cond
  %call = call i32 (ptr, i32, ...) @open(ptr noundef nonnull @.str, i32 noundef 0) #4, !dbg !196
  store i32 %call, ptr @randombytes.fd, align 4, !dbg !198
  %cmp1 = icmp eq i32 %call, -1, !dbg !199
  br i1 %cmp1, label %land.lhs.true, label %if.else, !dbg !201

land.lhs.true:                                    ; preds = %while.body
  %call2 = call ptr @__errno() #4, !dbg !202
  %1 = load i32, ptr %call2, align 4, !dbg !202
  %cmp3 = icmp eq i32 %1, 4, !dbg !203
  br i1 %cmp3, label %while.cond.backedge, label %if.else, !dbg !201

if.else:                                          ; preds = %land.lhs.true, %while.body
  %2 = load i32, ptr @randombytes.fd, align 4, !dbg !204
  %cmp4 = icmp eq i32 %2, -1, !dbg !206
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !206

if.then5:                                         ; preds = %if.else
  call void @abort() #4, !dbg !207
  br label %if.end6, !dbg !207

if.end6:                                          ; preds = %if.else, %if.then5
  br label %while.cond.backedge, !dbg !192

while.cond.backedge:                              ; preds = %if.end6, %land.lhs.true
  br label %while.cond, !dbg !193, !llvm.loop !208

while.cond7:                                      ; preds = %while.cond7.outer, %land.lhs.true12
    #dbg_value(ptr %out.addr.0.ph, !189, !DIExpression(), !190)
    #dbg_value(i32 %outlen.addr.0.ph, !191, !DIExpression(), !190)
  %cmp8.not = icmp eq i32 %outlen.addr.0.ph, 0, !dbg !210
  br i1 %cmp8.not, label %while.end21, label %while.body9, !dbg !195

while.body9:                                      ; preds = %while.cond7
  %3 = load i32, ptr @randombytes.fd, align 4, !dbg !211
  %call10 = call i32 @read(i32 noundef %3, ptr noundef %out.addr.0.ph, i32 noundef %outlen.addr.0.ph) #4, !dbg !213
    #dbg_value(i32 %call10, !214, !DIExpression(), !190)
  %cond = icmp eq i32 %call10, -1, !dbg !219
  br i1 %cond, label %land.lhs.true12, label %if.end20.loopexit, !dbg !219

land.lhs.true12:                                  ; preds = %while.body9
  %call13 = call ptr @__errno() #4, !dbg !221
  %4 = load i32, ptr %call13, align 4, !dbg !221
  %cmp14 = icmp eq i32 %4, 4, !dbg !222
  br i1 %cmp14, label %while.cond7, label %if.then18, !dbg !219, !llvm.loop !223

if.then18:                                        ; preds = %land.lhs.true12
  %call10.lcssa1 = phi i32 [ %call10, %land.lhs.true12 ], !dbg !213
  call void @abort() #4, !dbg !225
  br label %if.end20, !dbg !225

if.end20.loopexit:                                ; preds = %while.body9
  %call10.lcssa = phi i32 [ %call10, %while.body9 ], !dbg !213
  br label %if.end20, !dbg !227

if.end20:                                         ; preds = %if.end20.loopexit, %if.then18
  %call102 = phi i32 [ %call10.lcssa, %if.end20.loopexit ], [ %call10.lcssa1, %if.then18 ]
  %add.ptr = getelementptr inbounds i8, ptr %out.addr.0.ph, i32 %call102, !dbg !227
    #dbg_value(ptr %add.ptr, !189, !DIExpression(), !190)
  %sub = sub i32 %outlen.addr.0.ph, %call102, !dbg !228
    #dbg_value(i32 %sub, !191, !DIExpression(), !190)
  br label %while.cond7.outer, !dbg !195, !llvm.loop !223

while.cond7.outer:                                ; preds = %while.cond7.preheader, %if.end20
  %outlen.addr.0.ph = phi i32 [ %outlen, %while.cond7.preheader ], [ %sub, %if.end20 ]
  %out.addr.0.ph = phi ptr [ %out, %while.cond7.preheader ], [ %add.ptr, %if.end20 ]
  br label %while.cond7, !dbg !195

while.end21:                                      ; preds = %while.cond7
  ret void, !dbg !229
}

declare dso_local i32 @open(ptr noundef, i32 noundef, ...) local_unnamed_addr #1

declare dso_local ptr @__errno() local_unnamed_addr #1

declare dso_local void @abort() local_unnamed_addr #1

declare dso_local i32 @read(i32 noundef, ptr noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber1024_ref_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) local_unnamed_addr #0 !dbg !230 {
entry:
    #dbg_value(ptr %pk, !236, !DIExpression(), !237)
    #dbg_value(ptr %sk, !238, !DIExpression(), !237)
    #dbg_value(ptr %coins, !239, !DIExpression(), !237)
  call void @pqcrystals_kyber1024_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) #3, !dbg !240
  %add.ptr = getelementptr inbounds nuw i8, ptr %sk, i32 1536, !dbg !241
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr, ptr noundef %pk, i32 noundef 1568) #4, !dbg !242
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %sk, i32 3104, !dbg !243
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr2, ptr noundef %pk, i32 noundef 1568) #3, !dbg !243
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %sk, i32 3136, !dbg !244
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %coins, i32 32, !dbg !245
  %call6 = call ptr @memcpy(ptr noundef nonnull %add.ptr4, ptr noundef nonnull %add.ptr5, i32 noundef 32) #4, !dbg !246
  ret i32 0, !dbg !247
}

declare dso_local ptr @memcpy(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber1024_ref_keypair(ptr noundef %pk, ptr noundef %sk) local_unnamed_addr #0 !dbg !248 {
entry:
  %coins = alloca [64 x i8], align 1
    #dbg_value(ptr %pk, !251, !DIExpression(), !252)
    #dbg_value(ptr %sk, !253, !DIExpression(), !252)
    #dbg_declare(ptr %coins, !254, !DIExpression(), !258)
  call void @randombytes(ptr noundef nonnull %coins, i32 noundef 64) #3, !dbg !259
  %call = call i32 @pqcrystals_kyber1024_ref_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef nonnull %coins) #3, !dbg !260
  ret i32 0, !dbg !261
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber1024_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef %coins) local_unnamed_addr #0 !dbg !262 {
entry:
  %buf = alloca [64 x i8], align 1
  %kr = alloca [64 x i8], align 1
    #dbg_value(ptr %ct, !265, !DIExpression(), !266)
    #dbg_value(ptr %ss, !267, !DIExpression(), !266)
    #dbg_value(ptr %pk, !268, !DIExpression(), !266)
    #dbg_value(ptr %coins, !269, !DIExpression(), !266)
    #dbg_declare(ptr %buf, !270, !DIExpression(), !271)
    #dbg_declare(ptr %kr, !272, !DIExpression(), !273)
  %call = call ptr @memcpy(ptr noundef nonnull %buf, ptr noundef %coins, i32 noundef 32) #4, !dbg !274
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !275
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr, ptr noundef %pk, i32 noundef 1568) #3, !dbg !275
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %kr, ptr noundef nonnull %buf, i32 noundef 64) #3, !dbg !276
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %kr, i32 32, !dbg !277
  call void @pqcrystals_kyber1024_ref_indcpa_enc(ptr noundef %ct, ptr noundef nonnull %buf, ptr noundef %pk, ptr noundef nonnull %add.ptr6) #3, !dbg !278
  %call8 = call ptr @memcpy(ptr noundef %ss, ptr noundef nonnull %kr, i32 noundef 32) #4, !dbg !279
  ret i32 0, !dbg !280
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber1024_ref_enc(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk) local_unnamed_addr #0 !dbg !281 {
entry:
  %coins = alloca [32 x i8], align 1
    #dbg_value(ptr %ct, !282, !DIExpression(), !283)
    #dbg_value(ptr %ss, !284, !DIExpression(), !283)
    #dbg_value(ptr %pk, !285, !DIExpression(), !283)
    #dbg_declare(ptr %coins, !286, !DIExpression(), !287)
  call void @randombytes(ptr noundef nonnull %coins, i32 noundef 32) #3, !dbg !288
  %call = call i32 @pqcrystals_kyber1024_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef nonnull %coins) #3, !dbg !289
  ret i32 0, !dbg !290
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber1024_ref_dec(ptr noundef %ss, ptr noundef %ct, ptr noundef %sk) local_unnamed_addr #0 !dbg !291 {
entry:
  %buf = alloca [64 x i8], align 1
  %kr = alloca [64 x i8], align 1
  %cmp = alloca [1568 x i8], align 1
    #dbg_value(ptr %ss, !294, !DIExpression(), !295)
    #dbg_value(ptr %ct, !296, !DIExpression(), !295)
    #dbg_value(ptr %sk, !297, !DIExpression(), !295)
    #dbg_declare(ptr %buf, !298, !DIExpression(), !299)
    #dbg_declare(ptr %kr, !300, !DIExpression(), !301)
    #dbg_declare(ptr %cmp, !302, !DIExpression(), !303)
  %add.ptr = getelementptr inbounds nuw i8, ptr %sk, i32 1536, !dbg !304
    #dbg_value(ptr %add.ptr, !305, !DIExpression(), !295)
  call void @pqcrystals_kyber1024_ref_indcpa_dec(ptr noundef nonnull %buf, ptr noundef %ct, ptr noundef %sk) #3, !dbg !306
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !307
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %sk, i32 3104, !dbg !308
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr2, ptr noundef nonnull %add.ptr4, i32 noundef 32) #4, !dbg !309
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %kr, ptr noundef nonnull %buf, i32 noundef 64) #3, !dbg !310
  %add.ptr10 = getelementptr inbounds nuw i8, ptr %kr, i32 32, !dbg !311
  call void @pqcrystals_kyber1024_ref_indcpa_enc(ptr noundef nonnull %cmp, ptr noundef nonnull %buf, ptr noundef nonnull %add.ptr, ptr noundef nonnull %add.ptr10) #3, !dbg !312
  %call12 = call i32 @pqcrystals_kyber1024_ref_verify(ptr noundef %ct, ptr noundef nonnull %cmp, i32 noundef 1568) #3, !dbg !313
    #dbg_value(i32 %call12, !314, !DIExpression(), !295)
  %add.ptr14 = getelementptr inbounds nuw i8, ptr %sk, i32 3136, !dbg !315
  call void @pqcrystals_kyber1024_ref_kyber_shake256_rkprf(ptr noundef %ss, ptr noundef nonnull %add.ptr14, ptr noundef %ct) #3, !dbg !315
  %0 = trunc nuw nsw i32 %call12 to i8, !dbg !316
  %conv = xor i8 %0, 1, !dbg !316
  call void @pqcrystals_kyber1024_ref_cmov(ptr noundef %ss, ptr noundef nonnull %kr, i32 noundef 32, i8 noundef zeroext %conv) #3, !dbg !317
  ret i32 0, !dbg !318
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_gen_matrix(ptr noundef %a, ptr noundef %seed, i32 noundef %transposed) local_unnamed_addr #0 !dbg !319 {
entry:
  %buf = alloca [504 x i8], align 1
  %state = alloca [26 x i64], align 8
    #dbg_value(ptr %a, !334, !DIExpression(), !335)
    #dbg_value(ptr %seed, !336, !DIExpression(), !335)
    #dbg_value(i32 %transposed, !337, !DIExpression(), !335)
    #dbg_declare(ptr %buf, !338, !DIExpression(), !342)
    #dbg_declare(ptr %state, !343, !DIExpression(), !351)
    #dbg_value(i32 0, !352, !DIExpression(), !335)
  br label %for.cond, !dbg !353

for.cond:                                         ; preds = %for.inc18, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc19, %for.inc18 ], !dbg !355
    #dbg_value(i32 %i.0, !352, !DIExpression(), !335)
  %exitcond1 = icmp ne i32 %i.0, 4, !dbg !356
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end20, !dbg !358

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !359

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc
  %j.0 = phi i32 [ %inc, %for.inc ], [ 0, %for.cond1.preheader ], !dbg !362
    #dbg_value(i32 %j.0, !363, !DIExpression(), !335)
  %exitcond = icmp ne i32 %j.0, 4, !dbg !364
  br i1 %exitcond, label %for.body3, label %for.inc18, !dbg !359

for.body3:                                        ; preds = %for.cond1
  %tobool.not = icmp eq i32 %transposed, 0, !dbg !366
  br i1 %tobool.not, label %if.else, label %if.then, !dbg !366

if.then:                                          ; preds = %for.body3
  %conv = trunc nuw i32 %i.0 to i8, !dbg !369
  %conv4 = trunc nuw nsw i32 %j.0 to i8, !dbg !369
  call void @pqcrystals_kyber1024_ref_kyber_shake128_absorb(ptr noundef nonnull %state, ptr noundef %seed, i8 noundef zeroext %conv, i8 noundef zeroext %conv4) #3, !dbg !369
  br label %if.end, !dbg !369

if.else:                                          ; preds = %for.body3
  %conv5 = trunc nuw nsw i32 %j.0 to i8, !dbg !370
  %conv6 = trunc nuw i32 %i.0 to i8, !dbg !370
  call void @pqcrystals_kyber1024_ref_kyber_shake128_absorb(ptr noundef nonnull %state, ptr noundef %seed, i8 noundef zeroext %conv5, i8 noundef zeroext %conv6) #3, !dbg !370
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef nonnull %buf, i32 noundef 3, ptr noundef nonnull %state) #3, !dbg !371
    #dbg_value(i32 504, !372, !DIExpression(), !335)
  %arrayidx7 = getelementptr inbounds nuw [4 x [256 x i16]], ptr %a, i32 %i.0, i32 %j.0, !dbg !373
  %call = call fastcc i32 @rej_uniform(ptr noundef %arrayidx7, i32 noundef 256, ptr noundef nonnull %buf, i32 noundef 504) #3, !dbg !374
    #dbg_value(i32 %call, !375, !DIExpression(), !335)
  br label %while.cond, !dbg !376

while.cond:                                       ; preds = %while.body, %if.end
  %ctr.0 = phi i32 [ %call, %if.end ], [ %add, %while.body ], !dbg !377
    #dbg_value(i32 %ctr.0, !375, !DIExpression(), !335)
  %cmp10 = icmp ult i32 %ctr.0, 256, !dbg !378
  br i1 %cmp10, label %while.body, label %for.inc, !dbg !376

while.body:                                       ; preds = %while.cond
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef nonnull %buf, i32 noundef 1, ptr noundef nonnull %state) #3, !dbg !379
    #dbg_value(i32 168, !372, !DIExpression(), !335)
  %arrayidx14 = getelementptr inbounds nuw [4 x [256 x i16]], ptr %a, i32 %i.0, i32 %j.0, !dbg !381
  %add.ptr = getelementptr inbounds nuw i16, ptr %arrayidx14, i32 %ctr.0, !dbg !382
  %sub = sub nuw nsw i32 256, %ctr.0, !dbg !383
  %call17 = call fastcc i32 @rej_uniform(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef nonnull %buf, i32 noundef 168) #3, !dbg !384
  %add = add i32 %ctr.0, %call17, !dbg !385
    #dbg_value(i32 %add, !375, !DIExpression(), !335)
  br label %while.cond, !dbg !376, !llvm.loop !386

for.inc:                                          ; preds = %while.cond
  %inc = add nuw nsw i32 %j.0, 1, !dbg !388
    #dbg_value(i32 %inc, !363, !DIExpression(), !335)
  br label %for.cond1, !dbg !389, !llvm.loop !390

for.inc18:                                        ; preds = %for.cond1
  %inc19 = add nuw nsw i32 %i.0, 1, !dbg !392
    #dbg_value(i32 %inc19, !352, !DIExpression(), !335)
  br label %for.cond, !dbg !393, !llvm.loop !394

for.end20:                                        ; preds = %for.cond
  ret void, !dbg !396
}

; Function Attrs: nounwind
define internal fastcc i32 @rej_uniform(ptr noundef %r, i32 noundef range(i32 1, 257) %len, ptr noundef nonnull %buf, i32 noundef range(i32 168, 505) %buflen) unnamed_addr #0 !dbg !397 {
entry:
    #dbg_value(ptr %r, !401, !DIExpression(), !402)
    #dbg_value(i32 %len, !403, !DIExpression(), !402)
    #dbg_value(ptr %buf, !404, !DIExpression(), !402)
    #dbg_value(i32 %buflen, !405, !DIExpression(), !402)
    #dbg_value(i32 0, !406, !DIExpression(), !402)
    #dbg_value(i32 0, !407, !DIExpression(), !402)
  br label %while.cond, !dbg !408

while.cond:                                       ; preds = %if.end33, %entry
  %ctr.0 = phi i32 [ 0, %entry ], [ %ctr.2, %if.end33 ], !dbg !402
  %pos.0 = phi i32 [ 0, %entry ], [ %add20, %if.end33 ], !dbg !402
    #dbg_value(i32 %pos.0, !406, !DIExpression(), !402)
    #dbg_value(i32 %ctr.0, !407, !DIExpression(), !402)
  %cmp = icmp ult i32 %ctr.0, %len, !dbg !409
  %add = add nuw nsw i32 %pos.0, 3, !dbg !410
  %cmp1 = icmp ule i32 %add, %buflen, !dbg !410
  %0 = select i1 %cmp, i1 %cmp1, i1 false, !dbg !410
  br i1 %0, label %while.body, label %while.end, !dbg !408

while.body:                                       ; preds = %while.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %buf, i32 %pos.0, !dbg !411
  %1 = load i8, ptr %arrayidx, align 1, !dbg !411
  %conv = zext i8 %1 to i16, !dbg !411
  %2 = getelementptr i8, ptr %buf, i32 %pos.0, !dbg !413
  %arrayidx4 = getelementptr i8, ptr %2, i32 1, !dbg !413
  %3 = load i8, ptr %arrayidx4, align 1, !dbg !413
  %conv6 = zext i8 %3 to i16, !dbg !414
  %shl = shl nuw i16 %conv6, 8, !dbg !415
  %shl.masked = and i16 %shl, 3840, !dbg !416
  %and = or disjoint i16 %shl.masked, %conv, !dbg !416
    #dbg_value(i16 %and, !417, !DIExpression(), !402)
  %4 = getelementptr i8, ptr %buf, i32 %pos.0, !dbg !418
  %arrayidx9 = getelementptr i8, ptr %4, i32 1, !dbg !418
  %5 = load i8, ptr %arrayidx9, align 1, !dbg !418
  %6 = lshr i8 %5, 4, !dbg !419
  %shr11 = zext nneg i8 %6 to i16, !dbg !419
  %7 = getelementptr i8, ptr %buf, i32 %pos.0, !dbg !420
  %arrayidx13 = getelementptr i8, ptr %7, i32 2, !dbg !420
  %8 = load i8, ptr %arrayidx13, align 1, !dbg !420
  %conv15 = zext i8 %8 to i16, !dbg !421
  %shl16 = shl nuw nsw i16 %conv15, 4, !dbg !422
  %or17 = or disjoint i16 %shl16, %shr11, !dbg !423
    #dbg_value(i16 %or17, !424, !DIExpression(), !402)
  %add20 = add nuw nsw i32 %pos.0, 3, !dbg !425
    #dbg_value(i32 %add20, !406, !DIExpression(), !402)
  %cmp22 = icmp samesign ult i16 %and, 3329, !dbg !426
  br i1 %cmp22, label %if.then, label %if.end, !dbg !426

if.then:                                          ; preds = %while.body
  %inc = add nuw nsw i32 %ctr.0, 1, !dbg !428
    #dbg_value(i32 %inc, !407, !DIExpression(), !402)
  %arrayidx24 = getelementptr inbounds nuw i16, ptr %r, i32 %ctr.0, !dbg !429
  store i16 %and, ptr %arrayidx24, align 2, !dbg !430
  br label %if.end, !dbg !429

if.end:                                           ; preds = %if.then, %while.body
  %ctr.1 = phi i32 [ %inc, %if.then ], [ %ctr.0, %while.body ], !dbg !402
    #dbg_value(i32 %ctr.1, !407, !DIExpression(), !402)
  %cmp25 = icmp ult i32 %ctr.1, %len, !dbg !431
  %cmp28 = icmp samesign ult i16 %or17, 3329
  %or.cond = select i1 %cmp25, i1 %cmp28, i1 false, !dbg !433
  br i1 %or.cond, label %if.then30, label %if.end33, !dbg !433

if.then30:                                        ; preds = %if.end
  %inc31 = add nuw nsw i32 %ctr.1, 1, !dbg !434
    #dbg_value(i32 %inc31, !407, !DIExpression(), !402)
  %arrayidx32 = getelementptr inbounds nuw i16, ptr %r, i32 %ctr.1, !dbg !435
  store i16 %or17, ptr %arrayidx32, align 2, !dbg !436
  br label %if.end33, !dbg !435

if.end33:                                         ; preds = %if.then30, %if.end
  %ctr.2 = phi i32 [ %inc31, %if.then30 ], [ %ctr.1, %if.end ], !dbg !437
    #dbg_value(i32 %ctr.2, !407, !DIExpression(), !402)
  br label %while.cond, !dbg !408, !llvm.loop !438

while.end:                                        ; preds = %while.cond
  %ctr.0.lcssa = phi i32 [ %ctr.0, %while.cond ], !dbg !402
  ret i32 %ctr.0.lcssa, !dbg !440
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) local_unnamed_addr #0 !dbg !441 {
entry:
  %buf = alloca [64 x i8], align 1
  %a = alloca [4 x [4 x [256 x i16]]], align 2
  %e = alloca [4 x [256 x i16]], align 2
  %pkpv = alloca [4 x [256 x i16]], align 2
  %skpv = alloca [4 x [256 x i16]], align 2
    #dbg_value(ptr %pk, !444, !DIExpression(), !445)
    #dbg_value(ptr %sk, !446, !DIExpression(), !445)
    #dbg_value(ptr %coins, !447, !DIExpression(), !445)
    #dbg_declare(ptr %buf, !448, !DIExpression(), !449)
    #dbg_value(ptr %buf, !450, !DIExpression(), !445)
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !451
    #dbg_value(ptr %add.ptr, !452, !DIExpression(), !445)
    #dbg_value(i8 0, !453, !DIExpression(), !445)
    #dbg_declare(ptr %a, !454, !DIExpression(), !456)
    #dbg_declare(ptr %e, !457, !DIExpression(), !458)
    #dbg_declare(ptr %pkpv, !459, !DIExpression(), !460)
    #dbg_declare(ptr %skpv, !461, !DIExpression(), !462)
  %call = call ptr @memcpy(ptr noundef nonnull %buf, ptr noundef %coins, i32 noundef 32) #4, !dbg !463
  %arrayidx = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !464
  store i8 4, ptr %arrayidx, align 1, !dbg !465
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %buf, ptr noundef nonnull %buf, i32 noundef 33) #3, !dbg !466
  call void @pqcrystals_kyber1024_ref_gen_matrix(ptr noundef nonnull %a, ptr noundef nonnull %buf, i32 noundef 0) #3, !dbg !467
    #dbg_value(i32 0, !468, !DIExpression(), !445)
  br label %for.cond, !dbg !469

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc7, %for.body ], !dbg !471
  %nonce.0 = phi i8 [ 0, %entry ], [ %inc, %for.body ], !dbg !445
    #dbg_value(i8 %nonce.0, !453, !DIExpression(), !445)
    #dbg_value(i32 %i.0, !468, !DIExpression(), !445)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !472
  br i1 %exitcond, label %for.body, label %for.cond8.preheader, !dbg !474

for.cond8.preheader:                              ; preds = %for.cond
  br label %for.cond8, !dbg !475

for.body:                                         ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds nuw [4 x [256 x i16]], ptr %skpv, i32 0, i32 %i.0, !dbg !477
    #dbg_value(i8 %nonce.0, !453, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !445)
  call void @pqcrystals_kyber1024_ref_poly_getnoise_eta1(ptr noundef nonnull %arrayidx6, ptr noundef nonnull %add.ptr, i8 noundef zeroext %nonce.0) #3, !dbg !478
  %inc = add nuw nsw i8 %nonce.0, 1, !dbg !479
    #dbg_value(i8 %inc, !453, !DIExpression(), !445)
  %inc7 = add nuw nsw i32 %i.0, 1, !dbg !480
    #dbg_value(i32 %inc7, !468, !DIExpression(), !445)
  br label %for.cond, !dbg !481, !llvm.loop !482

for.cond8:                                        ; preds = %for.cond8.preheader, %for.body10
  %i.1 = phi i32 [ %inc14, %for.body10 ], [ 0, %for.cond8.preheader ], !dbg !484
  %nonce.1 = phi i8 [ %inc12, %for.body10 ], [ 4, %for.cond8.preheader ], !dbg !445
    #dbg_value(i8 %nonce.1, !453, !DIExpression(), !445)
    #dbg_value(i32 %i.1, !468, !DIExpression(), !445)
  %exitcond1 = icmp ne i32 %i.1, 4, !dbg !485
  br i1 %exitcond1, label %for.body10, label %for.end15, !dbg !475

for.body10:                                       ; preds = %for.cond8
  %arrayidx11 = getelementptr inbounds nuw [4 x [256 x i16]], ptr %e, i32 0, i32 %i.1, !dbg !487
    #dbg_value(i8 %nonce.1, !453, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !445)
  call void @pqcrystals_kyber1024_ref_poly_getnoise_eta1(ptr noundef nonnull %arrayidx11, ptr noundef nonnull %add.ptr, i8 noundef zeroext %nonce.1) #3, !dbg !488
  %inc12 = add nuw nsw i8 %nonce.1, 1, !dbg !489
    #dbg_value(i8 %inc12, !453, !DIExpression(), !445)
  %inc14 = add nuw nsw i32 %i.1, 1, !dbg !490
    #dbg_value(i32 %inc14, !468, !DIExpression(), !445)
  br label %for.cond8, !dbg !491, !llvm.loop !492

for.end15:                                        ; preds = %for.cond8
  call void @pqcrystals_kyber1024_ref_polyvec_ntt(ptr noundef nonnull %skpv) #3, !dbg !494
  call void @pqcrystals_kyber1024_ref_polyvec_ntt(ptr noundef nonnull %e) #3, !dbg !495
    #dbg_value(i32 0, !468, !DIExpression(), !445)
  br label %for.cond16, !dbg !496

for.cond16:                                       ; preds = %for.body18, %for.end15
  %i.2 = phi i32 [ 0, %for.end15 ], [ %inc23, %for.body18 ], !dbg !498
    #dbg_value(i32 %i.2, !468, !DIExpression(), !445)
  %exitcond2 = icmp ne i32 %i.2, 4, !dbg !499
  br i1 %exitcond2, label %for.body18, label %for.end24, !dbg !501

for.body18:                                       ; preds = %for.cond16
  %arrayidx19 = getelementptr inbounds nuw [4 x [256 x i16]], ptr %pkpv, i32 0, i32 %i.2, !dbg !502
  %arrayidx20 = getelementptr inbounds nuw [4 x [4 x [256 x i16]]], ptr %a, i32 0, i32 %i.2, !dbg !504
  call void @pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %arrayidx19, ptr noundef nonnull %arrayidx20, ptr noundef nonnull %skpv) #3, !dbg !505
  %arrayidx21 = getelementptr inbounds nuw [4 x [256 x i16]], ptr %pkpv, i32 0, i32 %i.2, !dbg !506
  call void @pqcrystals_kyber1024_ref_poly_tomont(ptr noundef nonnull %arrayidx21) #3, !dbg !507
  %inc23 = add nuw nsw i32 %i.2, 1, !dbg !508
    #dbg_value(i32 %inc23, !468, !DIExpression(), !445)
  br label %for.cond16, !dbg !509, !llvm.loop !510

for.end24:                                        ; preds = %for.cond16
  call void @pqcrystals_kyber1024_ref_polyvec_add(ptr noundef nonnull %pkpv, ptr noundef nonnull %pkpv, ptr noundef nonnull %e) #3, !dbg !512
  call void @pqcrystals_kyber1024_ref_polyvec_reduce(ptr noundef nonnull %pkpv) #3, !dbg !513
  call fastcc void @pack_sk(ptr noundef %sk, ptr noundef nonnull %skpv) #3, !dbg !514
  call fastcc void @pack_pk(ptr noundef %pk, ptr noundef nonnull %pkpv, ptr noundef nonnull %buf) #3, !dbg !515
  ret void, !dbg !516
}

; Function Attrs: nounwind
define internal fastcc void @pack_sk(ptr noundef %r, ptr noundef nonnull %sk) unnamed_addr #0 !dbg !517 {
entry:
    #dbg_value(ptr %r, !520, !DIExpression(), !521)
    #dbg_value(ptr %sk, !522, !DIExpression(), !521)
  call void @pqcrystals_kyber1024_ref_polyvec_tobytes(ptr noundef %r, ptr noundef nonnull %sk) #3, !dbg !523
  ret void, !dbg !524
}

; Function Attrs: nounwind
define internal fastcc void @pack_pk(ptr noundef %r, ptr noundef nonnull %pk, ptr noundef nonnull %seed) unnamed_addr #0 !dbg !525 {
entry:
    #dbg_value(ptr %r, !528, !DIExpression(), !529)
    #dbg_value(ptr %pk, !530, !DIExpression(), !529)
    #dbg_value(ptr %seed, !531, !DIExpression(), !529)
  call void @pqcrystals_kyber1024_ref_polyvec_tobytes(ptr noundef %r, ptr noundef nonnull %pk) #3, !dbg !532
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 1536, !dbg !533
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr, ptr noundef nonnull %seed, i32 noundef 32) #4, !dbg !534
  ret void, !dbg !535
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_indcpa_enc(ptr noundef %c, ptr noundef %m, ptr noundef %pk, ptr noundef %coins) local_unnamed_addr #0 !dbg !536 {
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
    #dbg_value(ptr %c, !539, !DIExpression(), !540)
    #dbg_value(ptr %m, !541, !DIExpression(), !540)
    #dbg_value(ptr %pk, !542, !DIExpression(), !540)
    #dbg_value(ptr %coins, !543, !DIExpression(), !540)
    #dbg_declare(ptr %seed, !544, !DIExpression(), !545)
    #dbg_value(i8 0, !546, !DIExpression(), !540)
    #dbg_declare(ptr %sp, !547, !DIExpression(), !548)
    #dbg_declare(ptr %pkpv, !549, !DIExpression(), !550)
    #dbg_declare(ptr %ep, !551, !DIExpression(), !552)
    #dbg_declare(ptr %at, !553, !DIExpression(), !554)
    #dbg_declare(ptr %b, !555, !DIExpression(), !556)
    #dbg_declare(ptr %v, !557, !DIExpression(), !558)
    #dbg_declare(ptr %k, !559, !DIExpression(), !560)
    #dbg_declare(ptr %epp, !561, !DIExpression(), !562)
  call fastcc void @unpack_pk(ptr noundef nonnull %pkpv, ptr noundef nonnull %seed, ptr noundef %pk) #3, !dbg !563
  call void @pqcrystals_kyber1024_ref_poly_frommsg(ptr noundef nonnull %k, ptr noundef %m) #3, !dbg !564
  call void @pqcrystals_kyber1024_ref_gen_matrix(ptr noundef nonnull %at, ptr noundef nonnull %seed, i32 noundef 1) #3, !dbg !565
    #dbg_value(i32 0, !566, !DIExpression(), !540)
  br label %for.cond, !dbg !567

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc4, %for.body ], !dbg !569
  %nonce.0 = phi i8 [ 0, %entry ], [ %inc, %for.body ], !dbg !540
    #dbg_value(i8 %nonce.0, !546, !DIExpression(), !540)
    #dbg_value(i32 %i.0, !566, !DIExpression(), !540)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !570
  br i1 %exitcond, label %for.body, label %for.cond5.preheader, !dbg !572

for.cond5.preheader:                              ; preds = %for.cond
  br label %for.cond5, !dbg !573

for.body:                                         ; preds = %for.cond
  %add.ptr = getelementptr inbounds nuw [256 x i16], ptr %sp, i32 %i.0, !dbg !575
    #dbg_value(i8 %nonce.0, !546, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !540)
  call void @pqcrystals_kyber1024_ref_poly_getnoise_eta1(ptr noundef nonnull %add.ptr, ptr noundef %coins, i8 noundef zeroext %nonce.0) #3, !dbg !576
  %inc = add nuw nsw i8 %nonce.0, 1, !dbg !577
    #dbg_value(i8 %inc, !546, !DIExpression(), !540)
  %inc4 = add nuw nsw i32 %i.0, 1, !dbg !578
    #dbg_value(i32 %inc4, !566, !DIExpression(), !540)
  br label %for.cond, !dbg !579, !llvm.loop !580

for.cond5:                                        ; preds = %for.cond5.preheader, %for.body7
  %i.1 = phi i32 [ %inc12, %for.body7 ], [ 0, %for.cond5.preheader ], !dbg !582
  %nonce.1 = phi i8 [ %inc10, %for.body7 ], [ 4, %for.cond5.preheader ], !dbg !540
    #dbg_value(i8 %nonce.1, !546, !DIExpression(), !540)
    #dbg_value(i32 %i.1, !566, !DIExpression(), !540)
  %exitcond1 = icmp ne i32 %i.1, 4, !dbg !583
  br i1 %exitcond1, label %for.body7, label %for.end13, !dbg !573

for.body7:                                        ; preds = %for.cond5
  %add.ptr9 = getelementptr inbounds nuw [256 x i16], ptr %ep, i32 %i.1, !dbg !585
    #dbg_value(i8 %nonce.1, !546, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !540)
  call void @pqcrystals_kyber1024_ref_poly_getnoise_eta2(ptr noundef nonnull %add.ptr9, ptr noundef %coins, i8 noundef zeroext %nonce.1) #3, !dbg !586
  %inc10 = add nuw nsw i8 %nonce.1, 1, !dbg !587
    #dbg_value(i8 %inc10, !546, !DIExpression(), !540)
  %inc12 = add nuw nsw i32 %i.1, 1, !dbg !588
    #dbg_value(i32 %inc12, !566, !DIExpression(), !540)
  br label %for.cond5, !dbg !589, !llvm.loop !590

for.end13:                                        ; preds = %for.cond5
    #dbg_value(i8 8, !546, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !540)
  call void @pqcrystals_kyber1024_ref_poly_getnoise_eta2(ptr noundef nonnull %epp, ptr noundef %coins, i8 noundef zeroext 8) #3, !dbg !592
  call void @pqcrystals_kyber1024_ref_polyvec_ntt(ptr noundef nonnull %sp) #3, !dbg !593
    #dbg_value(i32 0, !566, !DIExpression(), !540)
  br label %for.cond15, !dbg !594

for.cond15:                                       ; preds = %for.body17, %for.end13
  %i.2 = phi i32 [ 0, %for.end13 ], [ %inc20, %for.body17 ], !dbg !596
    #dbg_value(i32 %i.2, !566, !DIExpression(), !540)
  %exitcond2 = icmp ne i32 %i.2, 4, !dbg !597
  br i1 %exitcond2, label %for.body17, label %for.end21, !dbg !599

for.body17:                                       ; preds = %for.cond15
  %arrayidx = getelementptr inbounds nuw [4 x [256 x i16]], ptr %b, i32 0, i32 %i.2, !dbg !600
  %arrayidx18 = getelementptr inbounds nuw [4 x [4 x [256 x i16]]], ptr %at, i32 0, i32 %i.2, !dbg !601
  call void @pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %arrayidx, ptr noundef nonnull %arrayidx18, ptr noundef nonnull %sp) #3, !dbg !602
  %inc20 = add nuw nsw i32 %i.2, 1, !dbg !603
    #dbg_value(i32 %inc20, !566, !DIExpression(), !540)
  br label %for.cond15, !dbg !604, !llvm.loop !605

for.end21:                                        ; preds = %for.cond15
  call void @pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %v, ptr noundef nonnull %pkpv, ptr noundef nonnull %sp) #3, !dbg !607
  call void @pqcrystals_kyber1024_ref_polyvec_invntt_tomont(ptr noundef nonnull %b) #3, !dbg !608
  call void @pqcrystals_kyber1024_ref_poly_invntt_tomont(ptr noundef nonnull %v) #3, !dbg !609
  call void @pqcrystals_kyber1024_ref_polyvec_add(ptr noundef nonnull %b, ptr noundef nonnull %b, ptr noundef nonnull %ep) #3, !dbg !610
  call void @pqcrystals_kyber1024_ref_poly_add(ptr noundef nonnull %v, ptr noundef nonnull %v, ptr noundef nonnull %epp) #3, !dbg !611
  call void @pqcrystals_kyber1024_ref_poly_add(ptr noundef nonnull %v, ptr noundef nonnull %v, ptr noundef nonnull %k) #3, !dbg !612
  call void @pqcrystals_kyber1024_ref_polyvec_reduce(ptr noundef nonnull %b) #3, !dbg !613
  call void @pqcrystals_kyber1024_ref_poly_reduce(ptr noundef nonnull %v) #3, !dbg !614
  call fastcc void @pack_ciphertext(ptr noundef %c, ptr noundef nonnull %b, ptr noundef nonnull %v) #3, !dbg !615
  ret void, !dbg !616
}

; Function Attrs: nounwind
define internal fastcc void @unpack_pk(ptr noundef nonnull %pk, ptr noundef nonnull %seed, ptr noundef %packedpk) unnamed_addr #0 !dbg !617 {
entry:
    #dbg_value(ptr %pk, !620, !DIExpression(), !621)
    #dbg_value(ptr %seed, !622, !DIExpression(), !621)
    #dbg_value(ptr %packedpk, !623, !DIExpression(), !621)
  call void @pqcrystals_kyber1024_ref_polyvec_frombytes(ptr noundef nonnull %pk, ptr noundef %packedpk) #3, !dbg !624
  %add.ptr = getelementptr inbounds nuw i8, ptr %packedpk, i32 1536, !dbg !625
  %call = call ptr @memcpy(ptr noundef nonnull %seed, ptr noundef nonnull %add.ptr, i32 noundef 32) #4, !dbg !626
  ret void, !dbg !627
}

; Function Attrs: nounwind
define internal fastcc void @pack_ciphertext(ptr noundef %r, ptr noundef nonnull %b, ptr noundef nonnull %v) unnamed_addr #0 !dbg !628 {
entry:
    #dbg_value(ptr %r, !632, !DIExpression(), !633)
    #dbg_value(ptr %b, !634, !DIExpression(), !633)
    #dbg_value(ptr %v, !635, !DIExpression(), !633)
  call void @pqcrystals_kyber1024_ref_polyvec_compress(ptr noundef %r, ptr noundef nonnull %b) #3, !dbg !636
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 1408, !dbg !637
  call void @pqcrystals_kyber1024_ref_poly_compress(ptr noundef nonnull %add.ptr, ptr noundef nonnull %v) #3, !dbg !638
  ret void, !dbg !639
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_indcpa_dec(ptr noundef %m, ptr noundef %c, ptr noundef %sk) local_unnamed_addr #0 !dbg !640 {
entry:
  %b = alloca [4 x [256 x i16]], align 2
  %skpv = alloca [4 x [256 x i16]], align 2
  %v = alloca [256 x i16], align 2
  %mp = alloca [256 x i16], align 2
    #dbg_value(ptr %m, !643, !DIExpression(), !644)
    #dbg_value(ptr %c, !645, !DIExpression(), !644)
    #dbg_value(ptr %sk, !646, !DIExpression(), !644)
    #dbg_declare(ptr %b, !647, !DIExpression(), !648)
    #dbg_declare(ptr %skpv, !649, !DIExpression(), !650)
    #dbg_declare(ptr %v, !651, !DIExpression(), !652)
    #dbg_declare(ptr %mp, !653, !DIExpression(), !654)
  call fastcc void @unpack_ciphertext(ptr noundef nonnull %b, ptr noundef nonnull %v, ptr noundef %c) #3, !dbg !655
  call fastcc void @unpack_sk(ptr noundef nonnull %skpv, ptr noundef %sk) #3, !dbg !656
  call void @pqcrystals_kyber1024_ref_polyvec_ntt(ptr noundef nonnull %b) #3, !dbg !657
  call void @pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %mp, ptr noundef nonnull %skpv, ptr noundef nonnull %b) #3, !dbg !658
  call void @pqcrystals_kyber1024_ref_poly_invntt_tomont(ptr noundef nonnull %mp) #3, !dbg !659
  call void @pqcrystals_kyber1024_ref_poly_sub(ptr noundef nonnull %mp, ptr noundef nonnull %v, ptr noundef nonnull %mp) #3, !dbg !660
  call void @pqcrystals_kyber1024_ref_poly_reduce(ptr noundef nonnull %mp) #3, !dbg !661
  call void @pqcrystals_kyber1024_ref_poly_tomsg(ptr noundef %m, ptr noundef nonnull %mp) #3, !dbg !662
  ret void, !dbg !663
}

; Function Attrs: nounwind
define internal fastcc void @unpack_ciphertext(ptr noundef nonnull %b, ptr noundef nonnull %v, ptr noundef %c) unnamed_addr #0 !dbg !664 {
entry:
    #dbg_value(ptr %b, !667, !DIExpression(), !668)
    #dbg_value(ptr %v, !669, !DIExpression(), !668)
    #dbg_value(ptr %c, !670, !DIExpression(), !668)
  call void @pqcrystals_kyber1024_ref_polyvec_decompress(ptr noundef nonnull %b, ptr noundef %c) #3, !dbg !671
  %add.ptr = getelementptr inbounds nuw i8, ptr %c, i32 1408, !dbg !672
  call void @pqcrystals_kyber1024_ref_poly_decompress(ptr noundef nonnull %v, ptr noundef nonnull %add.ptr) #3, !dbg !673
  ret void, !dbg !674
}

; Function Attrs: nounwind
define internal fastcc void @unpack_sk(ptr noundef nonnull %sk, ptr noundef %packedsk) unnamed_addr #0 !dbg !675 {
entry:
    #dbg_value(ptr %sk, !678, !DIExpression(), !679)
    #dbg_value(ptr %packedsk, !680, !DIExpression(), !679)
  call void @pqcrystals_kyber1024_ref_polyvec_frombytes(ptr noundef nonnull %sk, ptr noundef %packedsk) #3, !dbg !681
  ret void, !dbg !682
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_compress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !683 {
entry:
  %t = alloca [8 x i16], align 2
    #dbg_value(ptr %r, !689, !DIExpression(), !690)
    #dbg_value(ptr %a, !691, !DIExpression(), !690)
    #dbg_declare(ptr %t, !692, !DIExpression(), !696)
    #dbg_value(i32 0, !697, !DIExpression(), !690)
  br label %for.cond, !dbg !698

for.cond:                                         ; preds = %for.inc107, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc108, %for.inc107 ], !dbg !700
  %r.addr.0 = phi ptr [ %r, %entry ], [ %r.addr.1.lcssa, %for.inc107 ]
    #dbg_value(ptr %r.addr.0, !689, !DIExpression(), !690)
    #dbg_value(i32 %i.0, !697, !DIExpression(), !690)
  %exitcond2 = icmp ne i32 %i.0, 4, !dbg !701
  br i1 %exitcond2, label %for.cond1.preheader, label %for.end109, !dbg !703

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !704

for.cond1:                                        ; preds = %for.cond1.preheader, %for.end
  %j.0 = phi i32 [ %inc105, %for.end ], [ 0, %for.cond1.preheader ], !dbg !707
  %r.addr.1 = phi ptr [ %add.ptr, %for.end ], [ %r.addr.0, %for.cond1.preheader ]
    #dbg_value(ptr %r.addr.1, !689, !DIExpression(), !690)
    #dbg_value(i32 %j.0, !708, !DIExpression(), !690)
  %exitcond1 = icmp ne i32 %j.0, 32, !dbg !709
  br i1 %exitcond1, label %for.cond4.preheader, label %for.inc107, !dbg !704

for.cond4.preheader:                              ; preds = %for.cond1
  br label %for.cond4, !dbg !711

for.cond4:                                        ; preds = %for.cond4.preheader, %for.body6
  %k.0 = phi i32 [ %inc, %for.body6 ], [ 0, %for.cond4.preheader ], !dbg !714
    #dbg_value(i32 %k.0, !715, !DIExpression(), !690)
  %exitcond = icmp ne i32 %k.0, 8, !dbg !716
  br i1 %exitcond, label %for.body6, label %for.end, !dbg !711

for.body6:                                        ; preds = %for.cond4
  %mul = shl nuw nsw i32 %j.0, 3, !dbg !718
  %add = or disjoint i32 %mul, %k.0, !dbg !720
  %arrayidx7 = getelementptr inbounds nuw [4 x [256 x i16]], ptr %a, i32 0, i32 %i.0, i32 %add, !dbg !721
  %0 = load i16, ptr %arrayidx7, align 2, !dbg !721
  %isneg = icmp slt i16 %0, 0, !dbg !722
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !722
  %arrayidx10 = getelementptr inbounds nuw [8 x i16], ptr %t, i32 0, i32 %k.0, !dbg !723
  %add12 = add i16 %and, %0, !dbg !724
  store i16 %add12, ptr %arrayidx10, align 2, !dbg !724
  %conv15 = zext i16 %add12 to i64, !dbg !725
    #dbg_value(i64 %conv15, !726, !DIExpression(), !690)
    #dbg_value(i64 %conv15, !726, !DIExpression(DW_OP_constu, 11, DW_OP_shl, DW_OP_stack_value), !690)
    #dbg_value(i64 %conv15, !726, !DIExpression(DW_OP_constu, 11, DW_OP_shl, DW_OP_constu, 1664, DW_OP_or, DW_OP_stack_value), !690)
  %1 = mul nuw nsw i64 %conv15, 1321132032, !dbg !727
  %mul17 = add nuw nsw i64 %1, 1073419776, !dbg !727
    #dbg_value(i64 %mul17, !726, !DIExpression(), !690)
  %shr18 = lshr i64 %mul17, 31, !dbg !728
    #dbg_value(i64 %shr18, !726, !DIExpression(), !690)
  %2 = trunc nuw i64 %shr18 to i16, !dbg !729
  %conv20 = and i16 %2, 2047, !dbg !729
  %arrayidx21 = getelementptr inbounds nuw [8 x i16], ptr %t, i32 0, i32 %k.0, !dbg !730
  store i16 %conv20, ptr %arrayidx21, align 2, !dbg !731
  %inc = add nuw nsw i32 %k.0, 1, !dbg !732
    #dbg_value(i32 %inc, !715, !DIExpression(), !690)
  br label %for.cond4, !dbg !733, !llvm.loop !734

for.end:                                          ; preds = %for.cond4
  %3 = load i16, ptr %t, align 2, !dbg !736
  %conv25 = trunc i16 %3 to i8, !dbg !737
  store i8 %conv25, ptr %r.addr.1, align 1, !dbg !738
  %4 = load i16, ptr %t, align 2, !dbg !739
  %5 = lshr i16 %4, 8, !dbg !740
  %shr29 = trunc nuw i16 %5 to i8, !dbg !740
  %arrayidx30 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !741
  %6 = load i16, ptr %arrayidx30, align 2, !dbg !741
  %conv31 = trunc i16 %6 to i8, !dbg !741
  %shl32 = shl i8 %conv31, 3, !dbg !742
  %or = or i8 %shl32, %shr29, !dbg !743
  %arrayidx34 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 1, !dbg !744
  store i8 %or, ptr %arrayidx34, align 1, !dbg !745
  %arrayidx35 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !746
  %7 = load i16, ptr %arrayidx35, align 2, !dbg !746
  %8 = lshr i16 %7, 5, !dbg !747
  %shr37 = trunc i16 %8 to i8, !dbg !747
  %arrayidx38 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !748
  %9 = load i16, ptr %arrayidx38, align 2, !dbg !748
  %conv39 = trunc i16 %9 to i8, !dbg !748
  %shl40 = shl i8 %conv39, 6, !dbg !749
  %or41 = or i8 %shl40, %shr37, !dbg !750
  %arrayidx43 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 2, !dbg !751
  store i8 %or41, ptr %arrayidx43, align 1, !dbg !752
  %arrayidx44 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !753
  %10 = load i16, ptr %arrayidx44, align 2, !dbg !753
  %11 = lshr i16 %10, 2, !dbg !754
  %conv47 = trunc i16 %11 to i8, !dbg !755
  %arrayidx48 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 3, !dbg !756
  store i8 %conv47, ptr %arrayidx48, align 1, !dbg !757
  %arrayidx49 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !758
  %12 = load i16, ptr %arrayidx49, align 2, !dbg !758
  %13 = lshr i16 %12, 10, !dbg !759
  %shr51 = trunc nuw nsw i16 %13 to i8, !dbg !759
  %arrayidx52 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !760
  %14 = load i16, ptr %arrayidx52, align 2, !dbg !760
  %conv53 = trunc i16 %14 to i8, !dbg !760
  %shl54 = shl i8 %conv53, 1, !dbg !761
  %or55 = or i8 %shl54, %shr51, !dbg !762
  %arrayidx57 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 4, !dbg !763
  store i8 %or55, ptr %arrayidx57, align 1, !dbg !764
  %arrayidx58 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !765
  %15 = load i16, ptr %arrayidx58, align 2, !dbg !765
  %16 = lshr i16 %15, 7, !dbg !766
  %shr60 = trunc i16 %16 to i8, !dbg !766
  %arrayidx61 = getelementptr inbounds nuw i8, ptr %t, i32 8, !dbg !767
  %17 = load i16, ptr %arrayidx61, align 2, !dbg !767
  %conv62 = trunc i16 %17 to i8, !dbg !767
  %shl63 = shl i8 %conv62, 4, !dbg !768
  %or64 = or i8 %shl63, %shr60, !dbg !769
  %arrayidx66 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 5, !dbg !770
  store i8 %or64, ptr %arrayidx66, align 1, !dbg !771
  %arrayidx67 = getelementptr inbounds nuw i8, ptr %t, i32 8, !dbg !772
  %18 = load i16, ptr %arrayidx67, align 2, !dbg !772
  %19 = lshr i16 %18, 4, !dbg !773
  %shr69 = trunc i16 %19 to i8, !dbg !773
  %arrayidx70 = getelementptr inbounds nuw i8, ptr %t, i32 10, !dbg !774
  %20 = load i16, ptr %arrayidx70, align 2, !dbg !774
  %conv71 = trunc i16 %20 to i8, !dbg !774
  %shl72 = shl i8 %conv71, 7, !dbg !775
  %or73 = or i8 %shl72, %shr69, !dbg !776
  %arrayidx75 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 6, !dbg !777
  store i8 %or73, ptr %arrayidx75, align 1, !dbg !778
  %arrayidx76 = getelementptr inbounds nuw i8, ptr %t, i32 10, !dbg !779
  %21 = load i16, ptr %arrayidx76, align 2, !dbg !779
  %22 = lshr i16 %21, 1, !dbg !780
  %conv79 = trunc i16 %22 to i8, !dbg !781
  %arrayidx80 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 7, !dbg !782
  store i8 %conv79, ptr %arrayidx80, align 1, !dbg !783
  %arrayidx81 = getelementptr inbounds nuw i8, ptr %t, i32 10, !dbg !784
  %23 = load i16, ptr %arrayidx81, align 2, !dbg !784
  %24 = lshr i16 %23, 9, !dbg !785
  %shr83 = trunc nuw nsw i16 %24 to i8, !dbg !785
  %arrayidx84 = getelementptr inbounds nuw i8, ptr %t, i32 12, !dbg !786
  %25 = load i16, ptr %arrayidx84, align 2, !dbg !786
  %conv85 = trunc i16 %25 to i8, !dbg !786
  %shl86 = shl i8 %conv85, 2, !dbg !787
  %or87 = or i8 %shl86, %shr83, !dbg !788
  %arrayidx89 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 8, !dbg !789
  store i8 %or87, ptr %arrayidx89, align 1, !dbg !790
  %arrayidx90 = getelementptr inbounds nuw i8, ptr %t, i32 12, !dbg !791
  %26 = load i16, ptr %arrayidx90, align 2, !dbg !791
  %27 = lshr i16 %26, 6, !dbg !792
  %shr92 = trunc i16 %27 to i8, !dbg !792
  %arrayidx93 = getelementptr inbounds nuw i8, ptr %t, i32 14, !dbg !793
  %28 = load i16, ptr %arrayidx93, align 2, !dbg !793
  %conv94 = trunc i16 %28 to i8, !dbg !793
  %shl95 = shl i8 %conv94, 5, !dbg !794
  %or96 = or i8 %shl95, %shr92, !dbg !795
  %arrayidx98 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 9, !dbg !796
  store i8 %or96, ptr %arrayidx98, align 1, !dbg !797
  %arrayidx99 = getelementptr inbounds nuw i8, ptr %t, i32 14, !dbg !798
  %29 = load i16, ptr %arrayidx99, align 2, !dbg !798
  %30 = lshr i16 %29, 3, !dbg !799
  %conv102 = trunc i16 %30 to i8, !dbg !800
  %arrayidx103 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 10, !dbg !801
  store i8 %conv102, ptr %arrayidx103, align 1, !dbg !802
    #dbg_value(ptr %r.addr.1, !689, !DIExpression(DW_OP_plus_uconst, 11, DW_OP_stack_value), !690)
  %add.ptr = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 11, !dbg !803
    #dbg_value(ptr %add.ptr, !689, !DIExpression(), !690)
  %inc105 = add nuw nsw i32 %j.0, 1, !dbg !804
    #dbg_value(i32 %inc105, !708, !DIExpression(), !690)
  br label %for.cond1, !dbg !805, !llvm.loop !806

for.inc107:                                       ; preds = %for.cond1
  %r.addr.1.lcssa = phi ptr [ %r.addr.1, %for.cond1 ]
  %inc108 = add nuw nsw i32 %i.0, 1, !dbg !808
    #dbg_value(i32 %inc108, !697, !DIExpression(), !690)
  br label %for.cond, !dbg !809, !llvm.loop !810

for.end109:                                       ; preds = %for.cond
  ret void, !dbg !812
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_decompress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !813 {
entry:
  %t = alloca [8 x i16], align 2
    #dbg_value(ptr %r, !814, !DIExpression(), !815)
    #dbg_value(ptr %a, !816, !DIExpression(), !815)
    #dbg_declare(ptr %t, !817, !DIExpression(), !818)
    #dbg_value(i32 0, !819, !DIExpression(), !815)
  br label %for.cond, !dbg !820

for.cond:                                         ; preds = %for.inc104, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc105, %for.inc104 ], !dbg !822
  %a.addr.0 = phi ptr [ %a, %entry ], [ %a.addr.1.lcssa, %for.inc104 ]
    #dbg_value(ptr %a.addr.0, !816, !DIExpression(), !815)
    #dbg_value(i32 %i.0, !819, !DIExpression(), !815)
  %exitcond2 = icmp ne i32 %i.0, 4, !dbg !823
  br i1 %exitcond2, label %for.cond1.preheader, label %for.end106, !dbg !825

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !826

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc101
  %j.0 = phi i32 [ %inc102, %for.inc101 ], [ 0, %for.cond1.preheader ], !dbg !829
  %a.addr.1 = phi ptr [ %add.ptr, %for.inc101 ], [ %a.addr.0, %for.cond1.preheader ]
    #dbg_value(ptr %a.addr.1, !816, !DIExpression(), !815)
    #dbg_value(i32 %j.0, !830, !DIExpression(), !815)
  %exitcond1 = icmp ne i32 %j.0, 32, !dbg !831
  br i1 %exitcond1, label %for.body3, label %for.inc104, !dbg !826

for.body3:                                        ; preds = %for.cond1
  %0 = load i8, ptr %a.addr.1, align 1, !dbg !833
  %conv = zext i8 %0 to i16, !dbg !833
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 1, !dbg !835
  %1 = load i8, ptr %arrayidx4, align 1, !dbg !835
  %conv6 = zext i8 %1 to i16, !dbg !836
  %shl = shl nuw i16 %conv6, 8, !dbg !837
  %or = or disjoint i16 %shl, %conv, !dbg !838
  store i16 %or, ptr %t, align 2, !dbg !839
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 1, !dbg !840
  %2 = load i8, ptr %arrayidx9, align 1, !dbg !840
  %3 = lshr i8 %2, 3, !dbg !841
  %shr11 = zext nneg i8 %3 to i16, !dbg !841
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 2, !dbg !842
  %4 = load i8, ptr %arrayidx12, align 1, !dbg !842
  %conv14 = zext i8 %4 to i16, !dbg !843
  %shl15 = shl nuw nsw i16 %conv14, 5, !dbg !844
  %or16 = or disjoint i16 %shl15, %shr11, !dbg !845
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !846
  store i16 %or16, ptr %arrayidx18, align 2, !dbg !847
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 2, !dbg !848
  %5 = load i8, ptr %arrayidx19, align 1, !dbg !848
  %6 = lshr i8 %5, 6, !dbg !849
  %shr21 = zext nneg i8 %6 to i16, !dbg !849
  %arrayidx22 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 3, !dbg !850
  %7 = load i8, ptr %arrayidx22, align 1, !dbg !850
  %conv24 = zext i8 %7 to i16, !dbg !851
  %shl25 = shl nuw nsw i16 %conv24, 2, !dbg !852
  %or26 = or disjoint i16 %shl25, %shr21, !dbg !853
  %arrayidx27 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 4, !dbg !854
  %8 = load i8, ptr %arrayidx27, align 1, !dbg !854
  %conv29 = zext i8 %8 to i16, !dbg !855
  %shl30 = shl i16 %conv29, 10, !dbg !856
  %or31 = or disjoint i16 %or26, %shl30, !dbg !857
  %arrayidx33 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !858
  store i16 %or31, ptr %arrayidx33, align 2, !dbg !859
  %arrayidx34 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 4, !dbg !860
  %9 = load i8, ptr %arrayidx34, align 1, !dbg !860
  %10 = lshr i8 %9, 1, !dbg !861
  %shr36 = zext nneg i8 %10 to i16, !dbg !861
  %arrayidx37 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 5, !dbg !862
  %11 = load i8, ptr %arrayidx37, align 1, !dbg !862
  %conv39 = zext i8 %11 to i16, !dbg !863
  %shl40 = shl nuw nsw i16 %conv39, 7, !dbg !864
  %or41 = or disjoint i16 %shl40, %shr36, !dbg !865
  %arrayidx43 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !866
  store i16 %or41, ptr %arrayidx43, align 2, !dbg !867
  %arrayidx44 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 5, !dbg !868
  %12 = load i8, ptr %arrayidx44, align 1, !dbg !868
  %13 = lshr i8 %12, 4, !dbg !869
  %shr46 = zext nneg i8 %13 to i16, !dbg !869
  %arrayidx47 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 6, !dbg !870
  %14 = load i8, ptr %arrayidx47, align 1, !dbg !870
  %conv49 = zext i8 %14 to i16, !dbg !871
  %shl50 = shl nuw nsw i16 %conv49, 4, !dbg !872
  %or51 = or disjoint i16 %shl50, %shr46, !dbg !873
  %arrayidx53 = getelementptr inbounds nuw i8, ptr %t, i32 8, !dbg !874
  store i16 %or51, ptr %arrayidx53, align 2, !dbg !875
  %arrayidx54 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 6, !dbg !876
  %15 = load i8, ptr %arrayidx54, align 1, !dbg !876
  %16 = lshr i8 %15, 7, !dbg !877
  %shr56 = zext nneg i8 %16 to i16, !dbg !877
  %arrayidx57 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 7, !dbg !878
  %17 = load i8, ptr %arrayidx57, align 1, !dbg !878
  %conv59 = zext i8 %17 to i16, !dbg !879
  %shl60 = shl nuw nsw i16 %conv59, 1, !dbg !880
  %or61 = or disjoint i16 %shl60, %shr56, !dbg !881
  %arrayidx62 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 8, !dbg !882
  %18 = load i8, ptr %arrayidx62, align 1, !dbg !882
  %conv64 = zext i8 %18 to i16, !dbg !883
  %shl65 = shl i16 %conv64, 9, !dbg !884
  %or66 = or disjoint i16 %or61, %shl65, !dbg !885
  %arrayidx68 = getelementptr inbounds nuw i8, ptr %t, i32 10, !dbg !886
  store i16 %or66, ptr %arrayidx68, align 2, !dbg !887
  %arrayidx69 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 8, !dbg !888
  %19 = load i8, ptr %arrayidx69, align 1, !dbg !888
  %20 = lshr i8 %19, 2, !dbg !889
  %shr71 = zext nneg i8 %20 to i16, !dbg !889
  %arrayidx72 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 9, !dbg !890
  %21 = load i8, ptr %arrayidx72, align 1, !dbg !890
  %conv74 = zext i8 %21 to i16, !dbg !891
  %shl75 = shl nuw nsw i16 %conv74, 6, !dbg !892
  %or76 = or disjoint i16 %shl75, %shr71, !dbg !893
  %arrayidx78 = getelementptr inbounds nuw i8, ptr %t, i32 12, !dbg !894
  store i16 %or76, ptr %arrayidx78, align 2, !dbg !895
  %arrayidx79 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 9, !dbg !896
  %22 = load i8, ptr %arrayidx79, align 1, !dbg !896
  %23 = lshr i8 %22, 5, !dbg !897
  %shr81 = zext nneg i8 %23 to i16, !dbg !897
  %arrayidx82 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 10, !dbg !898
  %24 = load i8, ptr %arrayidx82, align 1, !dbg !898
  %conv84 = zext i8 %24 to i16, !dbg !899
  %shl85 = shl nuw nsw i16 %conv84, 3, !dbg !900
  %or86 = or disjoint i16 %shl85, %shr81, !dbg !901
  %arrayidx88 = getelementptr inbounds nuw i8, ptr %t, i32 14, !dbg !902
  store i16 %or86, ptr %arrayidx88, align 2, !dbg !903
    #dbg_value(ptr %add.ptr, !816, !DIExpression(), !815)
    #dbg_value(i32 0, !904, !DIExpression(), !815)
  br label %for.cond89, !dbg !905

for.cond89:                                       ; preds = %for.body92, %for.body3
  %k.0 = phi i32 [ 0, %for.body3 ], [ %inc, %for.body92 ], !dbg !907
    #dbg_value(i32 %k.0, !904, !DIExpression(), !815)
  %exitcond = icmp ne i32 %k.0, 8, !dbg !908
  br i1 %exitcond, label %for.body92, label %for.inc101, !dbg !910

for.body92:                                       ; preds = %for.cond89
  %arrayidx93 = getelementptr inbounds nuw [8 x i16], ptr %t, i32 0, i32 %k.0, !dbg !911
  %25 = load i16, ptr %arrayidx93, align 2, !dbg !911
  %26 = and i16 %25, 2047, !dbg !912
  %and = zext nneg i16 %26 to i32, !dbg !912
  %mul = mul nuw nsw i32 %and, 3329, !dbg !913
  %add = add nuw nsw i32 %mul, 1024, !dbg !914
  %shr95 = lshr i32 %add, 11, !dbg !915
  %conv96 = trunc nuw nsw i32 %shr95 to i16, !dbg !916
  %mul98 = shl nuw nsw i32 %j.0, 3, !dbg !917
  %add99 = or disjoint i32 %mul98, %k.0, !dbg !918
  %arrayidx100 = getelementptr inbounds nuw [4 x [256 x i16]], ptr %r, i32 0, i32 %i.0, i32 %add99, !dbg !919
  store i16 %conv96, ptr %arrayidx100, align 2, !dbg !920
  %inc = add nuw nsw i32 %k.0, 1, !dbg !921
    #dbg_value(i32 %inc, !904, !DIExpression(), !815)
  br label %for.cond89, !dbg !922, !llvm.loop !923

for.inc101:                                       ; preds = %for.cond89
  %add.ptr = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 11, !dbg !925
  %inc102 = add nuw nsw i32 %j.0, 1, !dbg !926
    #dbg_value(i32 %inc102, !830, !DIExpression(), !815)
  br label %for.cond1, !dbg !927, !llvm.loop !928

for.inc104:                                       ; preds = %for.cond1
  %a.addr.1.lcssa = phi ptr [ %a.addr.1, %for.cond1 ]
  %inc105 = add nuw nsw i32 %i.0, 1, !dbg !930
    #dbg_value(i32 %inc105, !819, !DIExpression(), !815)
  br label %for.cond, !dbg !931, !llvm.loop !932

for.end106:                                       ; preds = %for.cond
  ret void, !dbg !934
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !935 {
entry:
    #dbg_value(ptr %r, !936, !DIExpression(), !937)
    #dbg_value(ptr %a, !938, !DIExpression(), !937)
    #dbg_value(i32 0, !939, !DIExpression(), !937)
  br label %for.cond, !dbg !940

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !942
    #dbg_value(i32 %i.0, !939, !DIExpression(), !937)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !943
  br i1 %exitcond, label %for.body, label %for.end, !dbg !945

for.body:                                         ; preds = %for.cond
  %mul = mul nuw nsw i32 %i.0, 384, !dbg !946
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 %mul, !dbg !947
  %arrayidx = getelementptr inbounds nuw [4 x [256 x i16]], ptr %a, i32 0, i32 %i.0, !dbg !948
  call void @pqcrystals_kyber1024_ref_poly_tobytes(ptr noundef %add.ptr, ptr noundef %arrayidx) #3, !dbg !949
  %inc = add nuw nsw i32 %i.0, 1, !dbg !950
    #dbg_value(i32 %inc, !939, !DIExpression(), !937)
  br label %for.cond, !dbg !951, !llvm.loop !952

for.end:                                          ; preds = %for.cond
  ret void, !dbg !954
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_frombytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !955 {
entry:
    #dbg_value(ptr %r, !956, !DIExpression(), !957)
    #dbg_value(ptr %a, !958, !DIExpression(), !957)
    #dbg_value(i32 0, !959, !DIExpression(), !957)
  br label %for.cond, !dbg !960

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !962
    #dbg_value(i32 %i.0, !959, !DIExpression(), !957)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !963
  br i1 %exitcond, label %for.body, label %for.end, !dbg !965

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [4 x [256 x i16]], ptr %r, i32 0, i32 %i.0, !dbg !966
  %mul = mul nuw nsw i32 %i.0, 384, !dbg !967
  %add.ptr = getelementptr inbounds nuw i8, ptr %a, i32 %mul, !dbg !968
  call void @pqcrystals_kyber1024_ref_poly_frombytes(ptr noundef %arrayidx, ptr noundef %add.ptr) #3, !dbg !969
  %inc = add nuw nsw i32 %i.0, 1, !dbg !970
    #dbg_value(i32 %inc, !959, !DIExpression(), !957)
  br label %for.cond, !dbg !971, !llvm.loop !972

for.end:                                          ; preds = %for.cond
  ret void, !dbg !974
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !975 {
entry:
    #dbg_value(ptr %r, !978, !DIExpression(), !979)
    #dbg_value(i32 0, !980, !DIExpression(), !979)
  br label %for.cond, !dbg !981

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !983
    #dbg_value(i32 %i.0, !980, !DIExpression(), !979)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !984
  br i1 %exitcond, label %for.body, label %for.end, !dbg !986

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [4 x [256 x i16]], ptr %r, i32 0, i32 %i.0, !dbg !987
  call void @pqcrystals_kyber1024_ref_poly_ntt(ptr noundef %arrayidx) #3, !dbg !988
  %inc = add nuw nsw i32 %i.0, 1, !dbg !989
    #dbg_value(i32 %inc, !980, !DIExpression(), !979)
  br label %for.cond, !dbg !990, !llvm.loop !991

for.end:                                          ; preds = %for.cond
  ret void, !dbg !993
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_invntt_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !994 {
entry:
    #dbg_value(ptr %r, !995, !DIExpression(), !996)
    #dbg_value(i32 0, !997, !DIExpression(), !996)
  br label %for.cond, !dbg !998

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1000
    #dbg_value(i32 %i.0, !997, !DIExpression(), !996)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !1001
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1003

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [4 x [256 x i16]], ptr %r, i32 0, i32 %i.0, !dbg !1004
  call void @pqcrystals_kyber1024_ref_poly_invntt_tomont(ptr noundef %arrayidx) #3, !dbg !1005
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1006
    #dbg_value(i32 %inc, !997, !DIExpression(), !996)
  br label %for.cond, !dbg !1007, !llvm.loop !1008

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1010
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1011 {
entry:
  %t = alloca [256 x i16], align 2
    #dbg_value(ptr %r, !1014, !DIExpression(), !1015)
    #dbg_value(ptr %a, !1016, !DIExpression(), !1015)
    #dbg_value(ptr %b, !1017, !DIExpression(), !1015)
    #dbg_declare(ptr %t, !1018, !DIExpression(), !1019)
  call void @pqcrystals_kyber1024_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) #3, !dbg !1020
    #dbg_value(i32 1, !1021, !DIExpression(), !1015)
  br label %for.cond, !dbg !1022

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 1, %entry ], [ %inc, %for.body ], !dbg !1024
    #dbg_value(i32 %i.0, !1021, !DIExpression(), !1015)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !1025
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1027

for.body:                                         ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds nuw [4 x [256 x i16]], ptr %a, i32 0, i32 %i.0, !dbg !1028
  %arrayidx3 = getelementptr inbounds nuw [4 x [256 x i16]], ptr %b, i32 0, i32 %i.0, !dbg !1030
  call void @pqcrystals_kyber1024_ref_poly_basemul_montgomery(ptr noundef nonnull %t, ptr noundef nonnull %arrayidx2, ptr noundef nonnull %arrayidx3) #3, !dbg !1031
  call void @pqcrystals_kyber1024_ref_poly_add(ptr noundef %r, ptr noundef %r, ptr noundef nonnull %t) #3, !dbg !1032
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1033
    #dbg_value(i32 %inc, !1021, !DIExpression(), !1015)
  br label %for.cond, !dbg !1034, !llvm.loop !1035

for.end:                                          ; preds = %for.cond
  call void @pqcrystals_kyber1024_ref_poly_reduce(ptr noundef %r) #3, !dbg !1037
  ret void, !dbg !1038
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_reduce(ptr noundef %r) local_unnamed_addr #0 !dbg !1039 {
entry:
    #dbg_value(ptr %r, !1040, !DIExpression(), !1041)
    #dbg_value(i32 0, !1042, !DIExpression(), !1041)
  br label %for.cond, !dbg !1043

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1045
    #dbg_value(i32 %i.0, !1042, !DIExpression(), !1041)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !1046
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1048

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [4 x [256 x i16]], ptr %r, i32 0, i32 %i.0, !dbg !1049
  call void @pqcrystals_kyber1024_ref_poly_reduce(ptr noundef %arrayidx) #3, !dbg !1050
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1051
    #dbg_value(i32 %inc, !1042, !DIExpression(), !1041)
  br label %for.cond, !dbg !1052, !llvm.loop !1053

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1055
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1056 {
entry:
    #dbg_value(ptr %r, !1059, !DIExpression(), !1060)
    #dbg_value(ptr %a, !1061, !DIExpression(), !1060)
    #dbg_value(ptr %b, !1062, !DIExpression(), !1060)
    #dbg_value(i32 0, !1063, !DIExpression(), !1060)
  br label %for.cond, !dbg !1064

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1066
    #dbg_value(i32 %i.0, !1063, !DIExpression(), !1060)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !1067
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1069

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [4 x [256 x i16]], ptr %r, i32 0, i32 %i.0, !dbg !1070
  %arrayidx1 = getelementptr inbounds nuw [4 x [256 x i16]], ptr %a, i32 0, i32 %i.0, !dbg !1071
  %arrayidx2 = getelementptr inbounds nuw [4 x [256 x i16]], ptr %b, i32 0, i32 %i.0, !dbg !1072
  call void @pqcrystals_kyber1024_ref_poly_add(ptr noundef %arrayidx, ptr noundef %arrayidx1, ptr noundef %arrayidx2) #3, !dbg !1073
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1074
    #dbg_value(i32 %inc, !1063, !DIExpression(), !1060)
  br label %for.cond, !dbg !1075, !llvm.loop !1076

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1078
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_compress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1079 {
entry:
  %t = alloca [8 x i8], align 1
    #dbg_value(ptr %r, !1085, !DIExpression(), !1086)
    #dbg_value(ptr %a, !1087, !DIExpression(), !1086)
    #dbg_declare(ptr %t, !1088, !DIExpression(), !1090)
    #dbg_value(i32 0, !1091, !DIExpression(), !1086)
  br label %for.cond, !dbg !1092

for.cond:                                         ; preds = %for.end, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc67, %for.end ], !dbg !1094
  %r.addr.0 = phi ptr [ %r, %entry ], [ %add.ptr, %for.end ]
    #dbg_value(ptr %r.addr.0, !1085, !DIExpression(), !1086)
    #dbg_value(i32 %i.0, !1091, !DIExpression(), !1086)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1095
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end68, !dbg !1097

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1098

for.cond1:                                        ; preds = %for.cond1.preheader, %for.body3
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond1.preheader ], !dbg !1101
    #dbg_value(i32 %j.0, !1102, !DIExpression(), !1086)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1103
  br i1 %exitcond, label %for.body3, label %for.end, !dbg !1098

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !1105
  %add = or disjoint i32 %mul, %j.0, !dbg !1107
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add, !dbg !1108
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1108
    #dbg_value(i16 %0, !1109, !DIExpression(), !1086)
  %isneg = icmp slt i16 %0, 0, !dbg !1110
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !1110
  %add5 = add i16 %and, %0, !dbg !1111
    #dbg_value(i16 %add5, !1109, !DIExpression(), !1086)
  %conv7 = sext i16 %add5 to i32, !dbg !1112
    #dbg_value(i32 %conv7, !1113, !DIExpression(DW_OP_constu, 5, DW_OP_shl, DW_OP_stack_value), !1086)
    #dbg_value(i32 %conv7, !1113, !DIExpression(DW_OP_constu, 5, DW_OP_shl, DW_OP_plus_uconst, 1664, DW_OP_stack_value), !1086)
  %1 = mul i32 %conv7, 1290176, !dbg !1114
  %mul9 = add i32 %1, 67089152, !dbg !1114
    #dbg_value(i32 %mul9, !1113, !DIExpression(), !1086)
  %shr10 = lshr i32 %mul9, 27, !dbg !1115
    #dbg_value(i32 %shr10, !1113, !DIExpression(), !1086)
  %conv12 = trunc nuw nsw i32 %shr10 to i8, !dbg !1116
  %arrayidx13 = getelementptr inbounds nuw [8 x i8], ptr %t, i32 0, i32 %j.0, !dbg !1117
  store i8 %conv12, ptr %arrayidx13, align 1, !dbg !1118
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1119
    #dbg_value(i32 %inc, !1102, !DIExpression(), !1086)
  br label %for.cond1, !dbg !1120, !llvm.loop !1121

for.end:                                          ; preds = %for.cond1
  %2 = load i8, ptr %t, align 1, !dbg !1123
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %t, i32 1, !dbg !1124
  %3 = load i8, ptr %arrayidx17, align 1, !dbg !1124
  %shl19 = shl i8 %3, 5, !dbg !1125
  %or = or i8 %shl19, %2, !dbg !1126
  store i8 %or, ptr %r.addr.0, align 1, !dbg !1127
  %4 = lshr i8 %3, 3, !dbg !1128
  %arrayidx25 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !1129
  %5 = load i8, ptr %arrayidx25, align 1, !dbg !1129
  %shl27 = shl i8 %5, 2, !dbg !1130
  %or28 = or i8 %shl27, %4, !dbg !1131
  %arrayidx29 = getelementptr inbounds nuw i8, ptr %t, i32 3, !dbg !1132
  %6 = load i8, ptr %arrayidx29, align 1, !dbg !1132
  %shl31 = shl i8 %6, 7, !dbg !1133
  %or32 = or i8 %or28, %shl31, !dbg !1134
  %arrayidx34 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 1, !dbg !1135
  store i8 %or32, ptr %arrayidx34, align 1, !dbg !1136
  %7 = lshr i8 %6, 1, !dbg !1137
  %arrayidx38 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !1138
  %8 = load i8, ptr %arrayidx38, align 1, !dbg !1138
  %shl40 = shl i8 %8, 4, !dbg !1139
  %or41 = or i8 %shl40, %7, !dbg !1140
  %arrayidx43 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 2, !dbg !1141
  store i8 %or41, ptr %arrayidx43, align 1, !dbg !1142
  %9 = lshr i8 %8, 4, !dbg !1143
  %arrayidx47 = getelementptr inbounds nuw i8, ptr %t, i32 5, !dbg !1144
  %10 = load i8, ptr %arrayidx47, align 1, !dbg !1144
  %shl49 = shl i8 %10, 1, !dbg !1145
  %or50 = or i8 %shl49, %9, !dbg !1146
  %arrayidx51 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !1147
  %11 = load i8, ptr %arrayidx51, align 1, !dbg !1147
  %shl53 = shl i8 %11, 6, !dbg !1148
  %or54 = or i8 %or50, %shl53, !dbg !1149
  %arrayidx56 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 3, !dbg !1150
  store i8 %or54, ptr %arrayidx56, align 1, !dbg !1151
  %12 = lshr i8 %11, 2, !dbg !1152
  %arrayidx60 = getelementptr inbounds nuw i8, ptr %t, i32 7, !dbg !1153
  %13 = load i8, ptr %arrayidx60, align 1, !dbg !1153
  %shl62 = shl i8 %13, 3, !dbg !1154
  %or63 = or i8 %shl62, %12, !dbg !1155
  %arrayidx65 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 4, !dbg !1156
  store i8 %or63, ptr %arrayidx65, align 1, !dbg !1157
    #dbg_value(ptr %r.addr.0, !1085, !DIExpression(DW_OP_plus_uconst, 5, DW_OP_stack_value), !1086)
  %add.ptr = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 5, !dbg !1158
    #dbg_value(ptr %add.ptr, !1085, !DIExpression(), !1086)
  %inc67 = add nuw nsw i32 %i.0, 1, !dbg !1159
    #dbg_value(i32 %inc67, !1091, !DIExpression(), !1086)
  br label %for.cond, !dbg !1160, !llvm.loop !1161

for.end68:                                        ; preds = %for.cond
  ret void, !dbg !1163
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_decompress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1164 {
entry:
  %t = alloca [8 x i8], align 1
    #dbg_value(ptr %r, !1167, !DIExpression(), !1168)
    #dbg_value(ptr %a, !1169, !DIExpression(), !1168)
    #dbg_declare(ptr %t, !1170, !DIExpression(), !1171)
    #dbg_value(i32 0, !1172, !DIExpression(), !1168)
  br label %for.cond, !dbg !1173

for.cond:                                         ; preds = %for.inc63, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc64, %for.inc63 ], !dbg !1175
  %a.addr.0 = phi ptr [ %a, %entry ], [ %add.ptr, %for.inc63 ]
    #dbg_value(ptr %a.addr.0, !1169, !DIExpression(), !1168)
    #dbg_value(i32 %i.0, !1172, !DIExpression(), !1168)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1176
  br i1 %exitcond1, label %for.body, label %for.end65, !dbg !1178

for.body:                                         ; preds = %for.cond
  %0 = load i8, ptr %a.addr.0, align 1, !dbg !1179
  store i8 %0, ptr %t, align 1, !dbg !1181
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 1, !dbg !1182
  %1 = load i8, ptr %arrayidx6, align 1, !dbg !1182
  %2 = shl i8 %1, 3, !dbg !1183
  %3 = lshr i8 %0, 5, !dbg !1183
  %4 = or i8 %2, %3, !dbg !1183
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %t, i32 1, !dbg !1184
  store i8 %4, ptr %arrayidx9, align 1, !dbg !1185
  %5 = lshr i8 %1, 2, !dbg !1186
  %arrayidx14 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !1187
  store i8 %5, ptr %arrayidx14, align 1, !dbg !1188
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 1, !dbg !1189
  %6 = load i8, ptr %arrayidx15, align 1, !dbg !1189
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 2, !dbg !1190
  %7 = load i8, ptr %arrayidx18, align 1, !dbg !1190
  %8 = shl i8 %7, 1, !dbg !1191
  %9 = lshr i8 %6, 7, !dbg !1191
  %10 = or i8 %8, %9, !dbg !1191
  %arrayidx23 = getelementptr inbounds nuw i8, ptr %t, i32 3, !dbg !1192
  store i8 %10, ptr %arrayidx23, align 1, !dbg !1193
  %arrayidx27 = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 3, !dbg !1194
  %11 = load i8, ptr %arrayidx27, align 1, !dbg !1194
  %12 = shl i8 %11, 4, !dbg !1195
  %13 = lshr i8 %7, 4, !dbg !1195
  %14 = or i8 %12, %13, !dbg !1195
  %arrayidx32 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !1196
  store i8 %14, ptr %arrayidx32, align 1, !dbg !1197
  %15 = lshr i8 %11, 1, !dbg !1198
  %arrayidx37 = getelementptr inbounds nuw i8, ptr %t, i32 5, !dbg !1199
  store i8 %15, ptr %arrayidx37, align 1, !dbg !1200
  %arrayidx38 = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 3, !dbg !1201
  %16 = load i8, ptr %arrayidx38, align 1, !dbg !1201
  %arrayidx41 = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 4, !dbg !1202
  %17 = load i8, ptr %arrayidx41, align 1, !dbg !1202
  %18 = shl i8 %17, 2, !dbg !1203
  %19 = lshr i8 %16, 6, !dbg !1203
  %20 = or i8 %18, %19, !dbg !1203
  %arrayidx46 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !1204
  store i8 %20, ptr %arrayidx46, align 1, !dbg !1205
  %21 = lshr i8 %17, 3, !dbg !1206
  %arrayidx51 = getelementptr inbounds nuw i8, ptr %t, i32 7, !dbg !1207
  store i8 %21, ptr %arrayidx51, align 1, !dbg !1208
    #dbg_value(ptr %add.ptr, !1169, !DIExpression(), !1168)
    #dbg_value(i32 0, !1209, !DIExpression(), !1168)
  br label %for.cond52, !dbg !1210

for.cond52:                                       ; preds = %for.body55, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body55 ], !dbg !1212
    #dbg_value(i32 %j.0, !1209, !DIExpression(), !1168)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1213
  br i1 %exitcond, label %for.body55, label %for.inc63, !dbg !1215

for.body55:                                       ; preds = %for.cond52
  %arrayidx56 = getelementptr inbounds nuw [8 x i8], ptr %t, i32 0, i32 %j.0, !dbg !1216
  %22 = load i8, ptr %arrayidx56, align 1, !dbg !1216
  %23 = and i8 %22, 31, !dbg !1217
  %and = zext nneg i8 %23 to i32, !dbg !1217
  %mul = mul nuw nsw i32 %and, 3329, !dbg !1218
  %add = add nuw nsw i32 %mul, 16, !dbg !1219
  %shr58 = lshr i32 %add, 5, !dbg !1220
  %conv59 = trunc nuw nsw i32 %shr58 to i16, !dbg !1221
  %mul60 = shl nuw nsw i32 %i.0, 3, !dbg !1222
  %add61 = or disjoint i32 %mul60, %j.0, !dbg !1223
  %arrayidx62 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add61, !dbg !1224
  store i16 %conv59, ptr %arrayidx62, align 2, !dbg !1225
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1226
    #dbg_value(i32 %inc, !1209, !DIExpression(), !1168)
  br label %for.cond52, !dbg !1227, !llvm.loop !1228

for.inc63:                                        ; preds = %for.cond52
  %add.ptr = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 5, !dbg !1230
  %inc64 = add nuw nsw i32 %i.0, 1, !dbg !1231
    #dbg_value(i32 %inc64, !1172, !DIExpression(), !1168)
  br label %for.cond, !dbg !1232, !llvm.loop !1233

for.end65:                                        ; preds = %for.cond
  ret void, !dbg !1235
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_tobytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1236 {
entry:
    #dbg_value(ptr %r, !1237, !DIExpression(), !1238)
    #dbg_value(ptr %a, !1239, !DIExpression(), !1238)
    #dbg_value(i32 0, !1240, !DIExpression(), !1238)
  br label %for.cond, !dbg !1241

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1243
    #dbg_value(i32 %i.0, !1240, !DIExpression(), !1238)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !1244
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1246

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 1, !dbg !1247
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %mul, !dbg !1249
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1249
    #dbg_value(i16 %0, !1250, !DIExpression(), !1238)
  %isneg = icmp slt i16 %0, 0, !dbg !1251
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !1251
  %add = add i16 %and, %0, !dbg !1252
    #dbg_value(i16 %add, !1250, !DIExpression(), !1238)
  %mul3 = shl nuw nsw i32 %i.0, 1, !dbg !1253
  %add4 = or disjoint i32 %mul3, 1, !dbg !1254
  %arrayidx5 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add4, !dbg !1255
  %1 = load i16, ptr %arrayidx5, align 2, !dbg !1255
    #dbg_value(i16 %1, !1256, !DIExpression(), !1238)
  %isneg1 = icmp slt i16 %1, 0, !dbg !1257
  %and8 = select i1 %isneg1, i16 3329, i16 0, !dbg !1257
  %add10 = add i16 %and8, %1, !dbg !1258
    #dbg_value(i16 %add10, !1256, !DIExpression(), !1238)
  %conv14 = trunc i16 %add to i8, !dbg !1259
  %mul15 = mul nuw nsw i32 %i.0, 3, !dbg !1260
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %r, i32 %mul15, !dbg !1261
  store i8 %conv14, ptr %arrayidx17, align 1, !dbg !1262
  %2 = lshr i16 %add, 8, !dbg !1263
  %shr19 = trunc nuw i16 %2 to i8, !dbg !1263
  %conv20 = trunc i16 %add10 to i8, !dbg !1264
  %shl = shl i8 %conv20, 4, !dbg !1265
  %or = or i8 %shl, %shr19, !dbg !1266
  %mul22 = mul nuw nsw i32 %i.0, 3, !dbg !1267
  %3 = getelementptr inbounds nuw i8, ptr %r, i32 %mul22, !dbg !1268
  %arrayidx24 = getelementptr inbounds nuw i8, ptr %3, i32 1, !dbg !1268
  store i8 %or, ptr %arrayidx24, align 1, !dbg !1269
  %4 = lshr i16 %add10, 4, !dbg !1270
  %conv27 = trunc i16 %4 to i8, !dbg !1271
  %mul28 = mul nuw nsw i32 %i.0, 3, !dbg !1272
  %5 = getelementptr inbounds nuw i8, ptr %r, i32 %mul28, !dbg !1273
  %arrayidx30 = getelementptr inbounds nuw i8, ptr %5, i32 2, !dbg !1273
  store i8 %conv27, ptr %arrayidx30, align 1, !dbg !1274
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1275
    #dbg_value(i32 %inc, !1240, !DIExpression(), !1238)
  br label %for.cond, !dbg !1276, !llvm.loop !1277

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1279
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_frombytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1280 {
entry:
    #dbg_value(ptr %r, !1281, !DIExpression(), !1282)
    #dbg_value(ptr %a, !1283, !DIExpression(), !1282)
    #dbg_value(i32 0, !1284, !DIExpression(), !1282)
  br label %for.cond, !dbg !1285

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1287
    #dbg_value(i32 %i.0, !1284, !DIExpression(), !1282)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !1288
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1290

for.body:                                         ; preds = %for.cond
  %mul = mul nuw nsw i32 %i.0, 3, !dbg !1291
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %mul, !dbg !1293
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1293
  %conv = zext i8 %0 to i16, !dbg !1293
  %mul1 = mul nuw nsw i32 %i.0, 3, !dbg !1294
  %1 = getelementptr inbounds nuw i8, ptr %a, i32 %mul1, !dbg !1295
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %1, i32 1, !dbg !1295
  %2 = load i8, ptr %arrayidx3, align 1, !dbg !1295
  %conv5 = zext i8 %2 to i16, !dbg !1296
  %shl = shl nuw i16 %conv5, 8, !dbg !1297
  %shl.masked = and i16 %shl, 3840, !dbg !1298
  %and = or disjoint i16 %shl.masked, %conv, !dbg !1298
  %mul7 = shl nuw nsw i32 %i.0, 1, !dbg !1299
  %arrayidx8 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul7, !dbg !1300
  store i16 %and, ptr %arrayidx8, align 2, !dbg !1301
  %mul9 = mul nuw nsw i32 %i.0, 3, !dbg !1302
  %3 = getelementptr inbounds nuw i8, ptr %a, i32 %mul9, !dbg !1303
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %3, i32 1, !dbg !1303
  %4 = load i8, ptr %arrayidx11, align 1, !dbg !1303
  %5 = lshr i8 %4, 4, !dbg !1304
  %shr13 = zext nneg i8 %5 to i16, !dbg !1304
  %mul14 = mul nuw nsw i32 %i.0, 3, !dbg !1305
  %6 = getelementptr inbounds nuw i8, ptr %a, i32 %mul14, !dbg !1306
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %6, i32 2, !dbg !1306
  %7 = load i8, ptr %arrayidx16, align 1, !dbg !1306
  %conv18 = zext i8 %7 to i16, !dbg !1307
  %shl19 = shl nuw nsw i16 %conv18, 4, !dbg !1308
  %or20 = or disjoint i16 %shl19, %shr13, !dbg !1309
  %mul23 = shl nuw nsw i32 %i.0, 1, !dbg !1310
  %add24 = or disjoint i32 %mul23, 1, !dbg !1311
  %arrayidx25 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add24, !dbg !1312
  store i16 %or20, ptr %arrayidx25, align 2, !dbg !1313
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1314
    #dbg_value(i32 %inc, !1284, !DIExpression(), !1282)
  br label %for.cond, !dbg !1315, !llvm.loop !1316

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1318
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_frommsg(ptr noundef %r, ptr noundef %msg) local_unnamed_addr #0 !dbg !1319 {
entry:
    #dbg_value(ptr %r, !1320, !DIExpression(), !1321)
    #dbg_value(ptr %msg, !1322, !DIExpression(), !1321)
    #dbg_value(i32 0, !1323, !DIExpression(), !1321)
  br label %for.cond, !dbg !1324

for.cond:                                         ; preds = %for.inc8, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc9, %for.inc8 ], !dbg !1326
    #dbg_value(i32 %i.0, !1323, !DIExpression(), !1321)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1327
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end10, !dbg !1329

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1330

for.cond1:                                        ; preds = %for.cond1.preheader, %for.body3
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond1.preheader ], !dbg !1333
    #dbg_value(i32 %j.0, !1334, !DIExpression(), !1321)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1335
  br i1 %exitcond, label %for.body3, label %for.inc8, !dbg !1330

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !1337
  %add = or disjoint i32 %mul, %j.0, !dbg !1339
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add, !dbg !1340
  store i16 0, ptr %arrayidx, align 2, !dbg !1341
  %add.ptr.idx = shl nuw nsw i32 %i.0, 4, !dbg !1342
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 %add.ptr.idx, !dbg !1342
  %add.ptr5 = getelementptr inbounds nuw i16, ptr %add.ptr, i32 %j.0, !dbg !1343
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1344
  %0 = load i8, ptr %arrayidx6, align 1, !dbg !1344
  %conv = zext i8 %0 to i32, !dbg !1344
  %shr = lshr i32 %conv, %j.0, !dbg !1345
  %1 = trunc nuw nsw i32 %shr to i16, !dbg !1346
  %conv7 = and i16 %1, 1, !dbg !1346
  call void @pqcrystals_kyber1024_ref_cmov_int16(ptr noundef %add.ptr5, i16 noundef signext 1665, i16 noundef zeroext %conv7) #3, !dbg !1347
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1348
    #dbg_value(i32 %inc, !1334, !DIExpression(), !1321)
  br label %for.cond1, !dbg !1349, !llvm.loop !1350

for.inc8:                                         ; preds = %for.cond1
  %inc9 = add nuw nsw i32 %i.0, 1, !dbg !1352
    #dbg_value(i32 %inc9, !1323, !DIExpression(), !1321)
  br label %for.cond, !dbg !1353, !llvm.loop !1354

for.end10:                                        ; preds = %for.cond
  ret void, !dbg !1356
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_tomsg(ptr noundef %msg, ptr noundef %a) local_unnamed_addr #0 !dbg !1357 {
entry:
    #dbg_value(ptr %msg, !1358, !DIExpression(), !1359)
    #dbg_value(ptr %a, !1360, !DIExpression(), !1359)
    #dbg_value(i32 0, !1361, !DIExpression(), !1359)
  br label %for.cond, !dbg !1362

for.cond:                                         ; preds = %for.inc11, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc12, %for.inc11 ], !dbg !1364
    #dbg_value(i32 %i.0, !1361, !DIExpression(), !1359)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1365
  br i1 %exitcond1, label %for.body, label %for.end13, !dbg !1367

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1368
  store i8 0, ptr %arrayidx, align 1, !dbg !1370
    #dbg_value(i32 0, !1371, !DIExpression(), !1359)
  br label %for.cond1, !dbg !1372

for.cond1:                                        ; preds = %for.body3, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body3 ], !dbg !1374
    #dbg_value(i32 %j.0, !1371, !DIExpression(), !1359)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1375
  br i1 %exitcond, label %for.body3, label %for.inc11, !dbg !1377

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !1378
  %add = or disjoint i32 %mul, %j.0, !dbg !1380
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add, !dbg !1381
  %0 = load i16, ptr %arrayidx4, align 2, !dbg !1381
  %conv = sext i16 %0 to i32, !dbg !1381
    #dbg_value(i32 %conv, !1382, !DIExpression(), !1359)
    #dbg_value(i32 %conv, !1382, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_stack_value), !1359)
    #dbg_value(i32 %conv, !1382, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !1359)
  %1 = mul i32 %conv, 161270, !dbg !1383
  %mul6 = add i32 %1, 134257275, !dbg !1383
    #dbg_value(i32 %mul6, !1382, !DIExpression(), !1359)
  %shr = lshr i32 %mul6, 28, !dbg !1384
    #dbg_value(i32 %shr, !1382, !DIExpression(), !1359)
  %and = and i32 %shr, 1, !dbg !1385
    #dbg_value(i32 %and, !1382, !DIExpression(), !1359)
  %shl7 = shl nuw nsw i32 %and, %j.0, !dbg !1386
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1387
  %2 = load i8, ptr %arrayidx8, align 1, !dbg !1388
  %3 = trunc nuw i32 %shl7 to i8, !dbg !1388
  %conv10 = or i8 %2, %3, !dbg !1388
  store i8 %conv10, ptr %arrayidx8, align 1, !dbg !1388
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1389
    #dbg_value(i32 %inc, !1371, !DIExpression(), !1359)
  br label %for.cond1, !dbg !1390, !llvm.loop !1391

for.inc11:                                        ; preds = %for.cond1
  %inc12 = add nuw nsw i32 %i.0, 1, !dbg !1393
    #dbg_value(i32 %inc12, !1361, !DIExpression(), !1359)
  br label %for.cond, !dbg !1394, !llvm.loop !1395

for.end13:                                        ; preds = %for.cond
  ret void, !dbg !1397
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_getnoise_eta1(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !1398 {
entry:
  %buf = alloca [128 x i8], align 1
    #dbg_value(ptr %r, !1401, !DIExpression(), !1402)
    #dbg_value(ptr %seed, !1403, !DIExpression(), !1402)
    #dbg_value(i8 %nonce, !1404, !DIExpression(), !1402)
    #dbg_declare(ptr %buf, !1405, !DIExpression(), !1407)
  call void @pqcrystals_kyber1024_ref_kyber_shake256_prf(ptr noundef nonnull %buf, i32 noundef 128, ptr noundef %seed, i8 noundef zeroext %nonce) #3, !dbg !1408
  call void @pqcrystals_kyber1024_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef nonnull %buf) #3, !dbg !1409
  ret void, !dbg !1410
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_getnoise_eta2(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !1411 {
entry:
  %buf = alloca [128 x i8], align 1
    #dbg_value(ptr %r, !1412, !DIExpression(), !1413)
    #dbg_value(ptr %seed, !1414, !DIExpression(), !1413)
    #dbg_value(i8 %nonce, !1415, !DIExpression(), !1413)
    #dbg_declare(ptr %buf, !1416, !DIExpression(), !1417)
  call void @pqcrystals_kyber1024_ref_kyber_shake256_prf(ptr noundef nonnull %buf, i32 noundef 128, ptr noundef %seed, i8 noundef zeroext %nonce) #3, !dbg !1418
  call void @pqcrystals_kyber1024_ref_poly_cbd_eta2(ptr noundef %r, ptr noundef nonnull %buf) #3, !dbg !1419
  ret void, !dbg !1420
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1421 {
entry:
    #dbg_value(ptr %r, !1424, !DIExpression(), !1425)
  call void @pqcrystals_kyber1024_ref_ntt(ptr noundef %r) #3, !dbg !1426
  call void @pqcrystals_kyber1024_ref_poly_reduce(ptr noundef %r) #3, !dbg !1427
  ret void, !dbg !1428
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_reduce(ptr noundef %r) local_unnamed_addr #0 !dbg !1429 {
entry:
    #dbg_value(ptr %r, !1430, !DIExpression(), !1431)
    #dbg_value(i32 0, !1432, !DIExpression(), !1431)
  br label %for.cond, !dbg !1433

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1435
    #dbg_value(i32 %i.0, !1432, !DIExpression(), !1431)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1436
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1438

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1439
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1439
  %call = call signext i16 @pqcrystals_kyber1024_ref_barrett_reduce(i16 noundef signext %0) #3, !dbg !1440
  %arrayidx1 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1441
  store i16 %call, ptr %arrayidx1, align 2, !dbg !1442
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1443
    #dbg_value(i32 %inc, !1432, !DIExpression(), !1431)
  br label %for.cond, !dbg !1444, !llvm.loop !1445

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1447
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_invntt_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !1448 {
entry:
    #dbg_value(ptr %r, !1449, !DIExpression(), !1450)
  call void @pqcrystals_kyber1024_ref_invntt(ptr noundef %r) #3, !dbg !1451
  ret void, !dbg !1452
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1453 {
entry:
    #dbg_value(ptr %r, !1456, !DIExpression(), !1457)
    #dbg_value(ptr %a, !1458, !DIExpression(), !1457)
    #dbg_value(ptr %b, !1459, !DIExpression(), !1457)
    #dbg_value(i32 0, !1460, !DIExpression(), !1457)
  br label %for.cond, !dbg !1461

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1463
    #dbg_value(i32 %i.0, !1460, !DIExpression(), !1457)
  %exitcond = icmp ne i32 %i.0, 64, !dbg !1464
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1466

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 2, !dbg !1467
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul, !dbg !1469
  %mul1 = shl nuw nsw i32 %i.0, 2, !dbg !1470
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %mul1, !dbg !1471
  %mul3 = shl nuw nsw i32 %i.0, 2, !dbg !1472
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %mul3, !dbg !1473
  %add = or disjoint i32 %i.0, 64, !dbg !1474
  %arrayidx5 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber1024_ref_zetas, i32 0, i32 %add, !dbg !1475
  %0 = load i16, ptr %arrayidx5, align 2, !dbg !1475
  call void @pqcrystals_kyber1024_ref_basemul(ptr noundef %arrayidx, ptr noundef %arrayidx2, ptr noundef %arrayidx4, i16 noundef signext %0) #3, !dbg !1476
  %mul6 = shl nuw nsw i32 %i.0, 2, !dbg !1477
  %add7 = or disjoint i32 %mul6, 2, !dbg !1478
  %arrayidx8 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add7, !dbg !1479
  %mul9 = shl nuw nsw i32 %i.0, 2, !dbg !1480
  %add10 = or disjoint i32 %mul9, 2, !dbg !1481
  %arrayidx11 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add10, !dbg !1482
  %mul12 = shl nuw nsw i32 %i.0, 2, !dbg !1483
  %add13 = or disjoint i32 %mul12, 2, !dbg !1484
  %arrayidx14 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %add13, !dbg !1485
  %add15 = or disjoint i32 %i.0, 64, !dbg !1486
  %arrayidx16 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber1024_ref_zetas, i32 0, i32 %add15, !dbg !1487
  %1 = load i16, ptr %arrayidx16, align 2, !dbg !1487
  %sub = sub i16 0, %1, !dbg !1488
  call void @pqcrystals_kyber1024_ref_basemul(ptr noundef nonnull %arrayidx8, ptr noundef nonnull %arrayidx11, ptr noundef nonnull %arrayidx14, i16 noundef signext %sub) #3, !dbg !1489
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1490
    #dbg_value(i32 %inc, !1460, !DIExpression(), !1457)
  br label %for.cond, !dbg !1491, !llvm.loop !1492

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1494
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !1495 {
entry:
    #dbg_value(ptr %r, !1496, !DIExpression(), !1497)
    #dbg_value(i16 1353, !1498, !DIExpression(), !1497)
    #dbg_value(i32 0, !1499, !DIExpression(), !1497)
  br label %for.cond, !dbg !1500

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1502
    #dbg_value(i32 %i.0, !1499, !DIExpression(), !1497)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1503
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1505

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1506
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1506
  %conv = sext i16 %0 to i32, !dbg !1507
  %mul = mul nsw i32 %conv, 1353, !dbg !1508
  %call = call signext i16 @pqcrystals_kyber1024_ref_montgomery_reduce(i32 noundef %mul) #3, !dbg !1509
  %arrayidx1 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1510
  store i16 %call, ptr %arrayidx1, align 2, !dbg !1511
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1512
    #dbg_value(i32 %inc, !1499, !DIExpression(), !1497)
  br label %for.cond, !dbg !1513, !llvm.loop !1514

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1516
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1517 {
entry:
    #dbg_value(ptr %r, !1518, !DIExpression(), !1519)
    #dbg_value(ptr %a, !1520, !DIExpression(), !1519)
    #dbg_value(ptr %b, !1521, !DIExpression(), !1519)
    #dbg_value(i32 0, !1522, !DIExpression(), !1519)
  br label %for.cond, !dbg !1523

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1525
    #dbg_value(i32 %i.0, !1522, !DIExpression(), !1519)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1526
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1528

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %i.0, !dbg !1529
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1529
  %arrayidx1 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %i.0, !dbg !1530
  %1 = load i16, ptr %arrayidx1, align 2, !dbg !1530
  %add = add i16 %0, %1, !dbg !1531
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1532
  store i16 %add, ptr %arrayidx4, align 2, !dbg !1533
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1534
    #dbg_value(i32 %inc, !1522, !DIExpression(), !1519)
  br label %for.cond, !dbg !1535, !llvm.loop !1536

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1538
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_sub(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1539 {
entry:
    #dbg_value(ptr %r, !1540, !DIExpression(), !1541)
    #dbg_value(ptr %a, !1542, !DIExpression(), !1541)
    #dbg_value(ptr %b, !1543, !DIExpression(), !1541)
    #dbg_value(i32 0, !1544, !DIExpression(), !1541)
  br label %for.cond, !dbg !1545

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1547
    #dbg_value(i32 %i.0, !1544, !DIExpression(), !1541)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1548
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1550

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %i.0, !dbg !1551
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1551
  %arrayidx1 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %i.0, !dbg !1552
  %1 = load i16, ptr %arrayidx1, align 2, !dbg !1552
  %sub = sub i16 %0, %1, !dbg !1553
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1554
  store i16 %sub, ptr %arrayidx4, align 2, !dbg !1555
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1556
    #dbg_value(i32 %inc, !1544, !DIExpression(), !1541)
  br label %for.cond, !dbg !1557, !llvm.loop !1558

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1560
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1561 {
entry:
    #dbg_value(ptr %r, !1564, !DIExpression(), !1565)
    #dbg_value(i32 1, !1566, !DIExpression(), !1565)
    #dbg_value(i32 128, !1567, !DIExpression(), !1565)
  br label %for.cond, !dbg !1568

for.cond:                                         ; preds = %for.inc24, %entry
  %len.0 = phi i32 [ 128, %entry ], [ %shr, %for.inc24 ], !dbg !1570
  %k.0 = phi i32 [ 1, %entry ], [ %k.1.lcssa, %for.inc24 ], !dbg !1571
    #dbg_value(i32 %k.0, !1566, !DIExpression(), !1565)
    #dbg_value(i32 %len.0, !1567, !DIExpression(), !1565)
  %cmp = icmp samesign ugt i32 %len.0, 1, !dbg !1572
  br i1 %cmp, label %for.cond1.preheader, label %for.end25, !dbg !1574

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1575

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc21
  %start.0 = phi i32 [ %add22, %for.inc21 ], [ 0, %for.cond1.preheader ], !dbg !1578
  %k.1 = phi i32 [ %inc, %for.inc21 ], [ %k.0, %for.cond1.preheader ], !dbg !1565
    #dbg_value(i32 %k.1, !1566, !DIExpression(), !1565)
    #dbg_value(i32 %start.0, !1579, !DIExpression(), !1565)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !1580
  br i1 %cmp2, label %for.body3, label %for.inc24, !dbg !1575

for.body3:                                        ; preds = %for.cond1
    #dbg_value(i32 %inc, !1566, !DIExpression(), !1565)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber1024_ref_zetas, i32 0, i32 %k.1, !dbg !1582
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1582
    #dbg_value(i16 %0, !1584, !DIExpression(), !1565)
    #dbg_value(i32 %start.0, !1585, !DIExpression(), !1565)
  br label %for.cond4, !dbg !1586

for.cond4:                                        ; preds = %for.body6, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc20, %for.body6 ], !dbg !1588
    #dbg_value(i32 %j.0, !1585, !DIExpression(), !1565)
  %add = add nuw nsw i32 %start.0, %len.0, !dbg !1589
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !1591
  br i1 %cmp5, label %for.body6, label %for.inc21, !dbg !1592

for.body6:                                        ; preds = %for.cond4
  %1 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1593
  %arrayidx8 = getelementptr i16, ptr %1, i32 %len.0, !dbg !1593
  %2 = load i16, ptr %arrayidx8, align 2, !dbg !1593
  %call = call fastcc signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %2) #3, !dbg !1595
    #dbg_value(i16 %call, !1596, !DIExpression(), !1565)
  %arrayidx9 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1597
  %3 = load i16, ptr %arrayidx9, align 2, !dbg !1597
  %sub = sub i16 %3, %call, !dbg !1598
  %4 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1599
  %arrayidx13 = getelementptr i16, ptr %4, i32 %len.0, !dbg !1599
  store i16 %sub, ptr %arrayidx13, align 2, !dbg !1600
  %arrayidx14 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1601
  %5 = load i16, ptr %arrayidx14, align 2, !dbg !1601
  %add17 = add i16 %5, %call, !dbg !1602
  %arrayidx19 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1603
  store i16 %add17, ptr %arrayidx19, align 2, !dbg !1604
  %inc20 = add nuw i32 %j.0, 1, !dbg !1605
    #dbg_value(i32 %inc20, !1585, !DIExpression(), !1565)
  br label %for.cond4, !dbg !1606, !llvm.loop !1607

for.inc21:                                        ; preds = %for.cond4
  %j.0.lcssa = phi i32 [ %j.0, %for.cond4 ], !dbg !1588
  %inc = add i32 %k.1, 1, !dbg !1609
  %add22 = add i32 %j.0.lcssa, %len.0, !dbg !1610
    #dbg_value(i32 %add22, !1579, !DIExpression(), !1565)
  br label %for.cond1, !dbg !1611, !llvm.loop !1612

for.inc24:                                        ; preds = %for.cond1
  %k.1.lcssa = phi i32 [ %k.1, %for.cond1 ], !dbg !1565
  %shr = lshr i32 %len.0, 1, !dbg !1614
    #dbg_value(i32 %shr, !1567, !DIExpression(), !1565)
  br label %for.cond, !dbg !1615, !llvm.loop !1616

for.end25:                                        ; preds = %for.cond
  ret void, !dbg !1618
}

; Function Attrs: nounwind
define internal fastcc signext i16 @fqmul(i16 noundef signext %a, i16 noundef signext %b) unnamed_addr #0 !dbg !1619 {
entry:
    #dbg_value(i16 %a, !1622, !DIExpression(), !1623)
    #dbg_value(i16 %b, !1624, !DIExpression(), !1623)
  %conv = sext i16 %a to i32, !dbg !1625
  %conv1 = sext i16 %b to i32, !dbg !1626
  %mul = mul nsw i32 %conv, %conv1, !dbg !1627
  %call = call signext i16 @pqcrystals_kyber1024_ref_montgomery_reduce(i32 noundef %mul) #3, !dbg !1628
  ret i16 %call, !dbg !1629
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_invntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1630 {
entry:
    #dbg_value(ptr %r, !1631, !DIExpression(), !1632)
    #dbg_value(i16 1441, !1633, !DIExpression(), !1632)
    #dbg_value(i32 127, !1634, !DIExpression(), !1632)
    #dbg_value(i32 2, !1635, !DIExpression(), !1632)
  br label %for.cond, !dbg !1636

for.cond:                                         ; preds = %for.inc29, %entry
  %len.0 = phi i32 [ 2, %entry ], [ %shl, %for.inc29 ], !dbg !1638
  %k.0 = phi i32 [ 127, %entry ], [ %k.1.lcssa, %for.inc29 ], !dbg !1639
    #dbg_value(i32 %k.0, !1634, !DIExpression(), !1632)
    #dbg_value(i32 %len.0, !1635, !DIExpression(), !1632)
  %cmp = icmp ult i32 %len.0, 129, !dbg !1640
  br i1 %cmp, label %for.cond1.preheader, label %for.cond31.preheader, !dbg !1642

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1643

for.cond31.preheader:                             ; preds = %for.cond
  br label %for.cond31, !dbg !1646

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc26
  %start.0 = phi i32 [ %add27, %for.inc26 ], [ 0, %for.cond1.preheader ], !dbg !1648
  %k.1 = phi i32 [ %dec, %for.inc26 ], [ %k.0, %for.cond1.preheader ], !dbg !1632
    #dbg_value(i32 %k.1, !1634, !DIExpression(), !1632)
    #dbg_value(i32 %start.0, !1649, !DIExpression(), !1632)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !1650
  br i1 %cmp2, label %for.body3, label %for.inc29, !dbg !1643

for.body3:                                        ; preds = %for.cond1
    #dbg_value(i32 %dec, !1634, !DIExpression(), !1632)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber1024_ref_zetas, i32 0, i32 %k.1, !dbg !1652
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1652
    #dbg_value(i16 %0, !1654, !DIExpression(), !1632)
    #dbg_value(i32 %start.0, !1655, !DIExpression(), !1632)
  br label %for.cond4, !dbg !1656

for.cond4:                                        ; preds = %for.body6, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc, %for.body6 ], !dbg !1658
    #dbg_value(i32 %j.0, !1655, !DIExpression(), !1632)
  %add = add nuw nsw i32 %start.0, %len.0, !dbg !1659
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !1661
  br i1 %cmp5, label %for.body6, label %for.inc26, !dbg !1662

for.body6:                                        ; preds = %for.cond4
  %arrayidx7 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1663
  %1 = load i16, ptr %arrayidx7, align 2, !dbg !1663
    #dbg_value(i16 %1, !1665, !DIExpression(), !1632)
  %2 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1666
  %arrayidx9 = getelementptr i16, ptr %2, i32 %len.0, !dbg !1666
  %3 = load i16, ptr %arrayidx9, align 2, !dbg !1666
  %add11 = add i16 %1, %3, !dbg !1667
  %call = call signext i16 @pqcrystals_kyber1024_ref_barrett_reduce(i16 noundef signext %add11) #3, !dbg !1668
  %arrayidx13 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1669
  store i16 %call, ptr %arrayidx13, align 2, !dbg !1670
  %4 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1671
  %arrayidx15 = getelementptr i16, ptr %4, i32 %len.0, !dbg !1671
  %5 = load i16, ptr %arrayidx15, align 2, !dbg !1671
  %sub = sub i16 %5, %1, !dbg !1672
  %6 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1673
  %arrayidx20 = getelementptr i16, ptr %6, i32 %len.0, !dbg !1673
  store i16 %sub, ptr %arrayidx20, align 2, !dbg !1674
  %7 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1675
  %arrayidx22 = getelementptr i16, ptr %7, i32 %len.0, !dbg !1675
  %8 = load i16, ptr %arrayidx22, align 2, !dbg !1675
  %call23 = call fastcc signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %8) #3, !dbg !1676
  %9 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1677
  %arrayidx25 = getelementptr i16, ptr %9, i32 %len.0, !dbg !1677
  store i16 %call23, ptr %arrayidx25, align 2, !dbg !1678
  %inc = add nuw i32 %j.0, 1, !dbg !1679
    #dbg_value(i32 %inc, !1655, !DIExpression(), !1632)
  br label %for.cond4, !dbg !1680, !llvm.loop !1681

for.inc26:                                        ; preds = %for.cond4
  %j.0.lcssa = phi i32 [ %j.0, %for.cond4 ], !dbg !1658
  %dec = add i32 %k.1, -1, !dbg !1683
  %add27 = add i32 %j.0.lcssa, %len.0, !dbg !1684
    #dbg_value(i32 %add27, !1649, !DIExpression(), !1632)
  br label %for.cond1, !dbg !1685, !llvm.loop !1686

for.inc29:                                        ; preds = %for.cond1
  %k.1.lcssa = phi i32 [ %k.1, %for.cond1 ], !dbg !1632
  %shl = shl nuw nsw i32 %len.0, 1, !dbg !1688
    #dbg_value(i32 %shl, !1635, !DIExpression(), !1632)
  br label %for.cond, !dbg !1689, !llvm.loop !1690

for.cond31:                                       ; preds = %for.cond31.preheader, %for.body34
  %j.1 = phi i32 [ %inc39, %for.body34 ], [ 0, %for.cond31.preheader ], !dbg !1692
    #dbg_value(i32 %j.1, !1655, !DIExpression(), !1632)
  %exitcond = icmp ne i32 %j.1, 256, !dbg !1693
  br i1 %exitcond, label %for.body34, label %for.end40, !dbg !1646

for.body34:                                       ; preds = %for.cond31
  %arrayidx35 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !1695
  %10 = load i16, ptr %arrayidx35, align 2, !dbg !1695
  %call36 = call fastcc signext i16 @fqmul(i16 noundef signext %10, i16 noundef signext 1441) #3, !dbg !1696
  %arrayidx37 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !1697
  store i16 %call36, ptr %arrayidx37, align 2, !dbg !1698
  %inc39 = add nuw nsw i32 %j.1, 1, !dbg !1699
    #dbg_value(i32 %inc39, !1655, !DIExpression(), !1632)
  br label %for.cond31, !dbg !1700, !llvm.loop !1701

for.end40:                                        ; preds = %for.cond31
  ret void, !dbg !1703
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_basemul(ptr noundef %r, ptr noundef %a, ptr noundef %b, i16 noundef signext %zeta) local_unnamed_addr #0 !dbg !1704 {
entry:
    #dbg_value(ptr %r, !1708, !DIExpression(), !1709)
    #dbg_value(ptr %a, !1710, !DIExpression(), !1709)
    #dbg_value(ptr %b, !1711, !DIExpression(), !1709)
    #dbg_value(i16 %zeta, !1712, !DIExpression(), !1709)
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 2, !dbg !1713
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1713
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 2, !dbg !1714
  %1 = load i16, ptr %arrayidx1, align 2, !dbg !1714
  %call = call fastcc signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %1) #3, !dbg !1715
  store i16 %call, ptr %r, align 2, !dbg !1716
  %call4 = call fastcc signext i16 @fqmul(i16 noundef signext %call, i16 noundef signext %zeta) #3, !dbg !1717
  store i16 %call4, ptr %r, align 2, !dbg !1718
  %2 = load i16, ptr %a, align 2, !dbg !1719
  %3 = load i16, ptr %b, align 2, !dbg !1720
  %call8 = call fastcc signext i16 @fqmul(i16 noundef signext %2, i16 noundef signext %3) #3, !dbg !1721
  %4 = load i16, ptr %r, align 2, !dbg !1722
  %add = add i16 %4, %call8, !dbg !1722
  store i16 %add, ptr %r, align 2, !dbg !1722
  %5 = load i16, ptr %a, align 2, !dbg !1723
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %b, i32 2, !dbg !1724
  %6 = load i16, ptr %arrayidx13, align 2, !dbg !1724
  %call14 = call fastcc signext i16 @fqmul(i16 noundef signext %5, i16 noundef signext %6) #3, !dbg !1725
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %r, i32 2, !dbg !1726
  store i16 %call14, ptr %arrayidx15, align 2, !dbg !1727
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %a, i32 2, !dbg !1728
  %7 = load i16, ptr %arrayidx16, align 2, !dbg !1728
  %8 = load i16, ptr %b, align 2, !dbg !1729
  %call18 = call fastcc signext i16 @fqmul(i16 noundef signext %7, i16 noundef signext %8) #3, !dbg !1730
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %r, i32 2, !dbg !1731
  %9 = load i16, ptr %arrayidx20, align 2, !dbg !1732
  %add22 = add i16 %9, %call18, !dbg !1732
  store i16 %add22, ptr %arrayidx20, align 2, !dbg !1732
  ret void, !dbg !1733
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef %buf) local_unnamed_addr #0 !dbg !1734 {
entry:
    #dbg_value(ptr %r, !1736, !DIExpression(), !1737)
    #dbg_value(ptr %buf, !1738, !DIExpression(), !1737)
  call fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) #3, !dbg !1739
  ret void, !dbg !1740
}

; Function Attrs: nounwind
define internal fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) unnamed_addr #0 !dbg !1741 {
entry:
    #dbg_value(ptr %r, !1742, !DIExpression(), !1743)
    #dbg_value(ptr %buf, !1744, !DIExpression(), !1743)
    #dbg_value(i32 0, !1745, !DIExpression(), !1743)
  br label %for.cond, !dbg !1746

for.cond:                                         ; preds = %for.inc19, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc20, %for.inc19 ], !dbg !1748
    #dbg_value(i32 %i.0, !1745, !DIExpression(), !1743)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1749
  br i1 %exitcond1, label %for.body, label %for.end21, !dbg !1751

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 2, !dbg !1752
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 %mul, !dbg !1754
  %call = call fastcc i32 @load32_littleendian(ptr noundef %add.ptr) #3, !dbg !1755
    #dbg_value(i32 %call, !1756, !DIExpression(), !1743)
  %and = and i32 %call, 1431655765, !dbg !1757
    #dbg_value(i32 %and, !1758, !DIExpression(), !1743)
  %shr = lshr i32 %call, 1, !dbg !1759
  %and1 = and i32 %shr, 1431655765, !dbg !1760
  %add = add nuw i32 %and, %and1, !dbg !1761
    #dbg_value(i32 %add, !1758, !DIExpression(), !1743)
    #dbg_value(i32 0, !1762, !DIExpression(), !1743)
  br label %for.cond2, !dbg !1763

for.cond2:                                        ; preds = %for.body4, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body4 ], !dbg !1765
    #dbg_value(i32 %j.0, !1762, !DIExpression(), !1743)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1766
  br i1 %exitcond, label %for.body4, label %for.inc19, !dbg !1768

for.body4:                                        ; preds = %for.cond2
  %mul5 = shl nuw nsw i32 %j.0, 2, !dbg !1769
  %shr7 = lshr i32 %add, %mul5, !dbg !1771
  %conv = and i32 %shr7, 3, !dbg !1772
    #dbg_value(i32 %shr7, !1773, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3, DW_OP_and, DW_OP_stack_value), !1743)
  %mul9 = shl nuw nsw i32 %j.0, 2, !dbg !1774
  %add10 = or disjoint i32 %mul9, 2, !dbg !1775
  %shr11 = lshr i32 %add, %add10, !dbg !1776
  %conv13 = and i32 %shr11, 3, !dbg !1777
    #dbg_value(i32 %conv13, !1778, !DIExpression(), !1743)
  %sub = sub nsw i32 %conv, %conv13, !dbg !1779
  %conv16 = trunc nsw i32 %sub to i16, !dbg !1780
  %mul17 = shl nuw nsw i32 %i.0, 3, !dbg !1781
  %add18 = or disjoint i32 %mul17, %j.0, !dbg !1782
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add18, !dbg !1783
  store i16 %conv16, ptr %arrayidx, align 2, !dbg !1784
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1785
    #dbg_value(i32 %inc, !1762, !DIExpression(), !1743)
  br label %for.cond2, !dbg !1786, !llvm.loop !1787

for.inc19:                                        ; preds = %for.cond2
  %inc20 = add nuw nsw i32 %i.0, 1, !dbg !1789
    #dbg_value(i32 %inc20, !1745, !DIExpression(), !1743)
  br label %for.cond, !dbg !1790, !llvm.loop !1791

for.end21:                                        ; preds = %for.cond
  ret void, !dbg !1793
}

; Function Attrs: nounwind
define internal fastcc i32 @load32_littleendian(ptr noundef %x) unnamed_addr #0 !dbg !1794 {
entry:
    #dbg_value(ptr %x, !1797, !DIExpression(), !1798)
  %0 = load i8, ptr %x, align 1, !dbg !1799
  %conv = zext i8 %0 to i32, !dbg !1800
    #dbg_value(i32 %conv, !1801, !DIExpression(), !1798)
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %x, i32 1, !dbg !1802
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !1802
  %conv2 = zext i8 %1 to i32, !dbg !1803
  %shl = shl nuw nsw i32 %conv2, 8, !dbg !1804
  %or = or disjoint i32 %shl, %conv, !dbg !1805
    #dbg_value(i32 %or, !1801, !DIExpression(), !1798)
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %x, i32 2, !dbg !1806
  %2 = load i8, ptr %arrayidx3, align 1, !dbg !1806
  %conv4 = zext i8 %2 to i32, !dbg !1807
  %shl5 = shl nuw nsw i32 %conv4, 16, !dbg !1808
  %or6 = or disjoint i32 %or, %shl5, !dbg !1809
    #dbg_value(i32 %or6, !1801, !DIExpression(), !1798)
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %x, i32 3, !dbg !1810
  %3 = load i8, ptr %arrayidx7, align 1, !dbg !1810
  %conv8 = zext i8 %3 to i32, !dbg !1811
  %shl9 = shl nuw i32 %conv8, 24, !dbg !1812
  %or10 = or disjoint i32 %or6, %shl9, !dbg !1813
    #dbg_value(i32 %or10, !1801, !DIExpression(), !1798)
  ret i32 %or10, !dbg !1814
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_cbd_eta2(ptr noundef %r, ptr noundef %buf) local_unnamed_addr #0 !dbg !1815 {
entry:
    #dbg_value(ptr %r, !1816, !DIExpression(), !1817)
    #dbg_value(ptr %buf, !1818, !DIExpression(), !1817)
  call fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) #3, !dbg !1819
  ret void, !dbg !1820
}

; Function Attrs: nounwind
define dso_local signext i16 @pqcrystals_kyber1024_ref_montgomery_reduce(i32 noundef %a) local_unnamed_addr #0 !dbg !1821 {
entry:
    #dbg_value(i32 %a, !1824, !DIExpression(), !1825)
    #dbg_value(i32 %a, !1826, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !1825)
  %sext = mul i32 %a, -218038272, !dbg !1827
  %conv3 = ashr exact i32 %sext, 16, !dbg !1827
  %mul4.neg = mul nsw i32 %conv3, -3329, !dbg !1828
  %sub = add i32 %mul4.neg, %a, !dbg !1829
  %shr = lshr i32 %sub, 16, !dbg !1830
  %conv5 = trunc nuw i32 %shr to i16, !dbg !1831
    #dbg_value(i16 %conv5, !1826, !DIExpression(), !1825)
  ret i16 %conv5, !dbg !1832
}

; Function Attrs: nounwind
define dso_local signext i16 @pqcrystals_kyber1024_ref_barrett_reduce(i16 noundef signext %a) local_unnamed_addr #0 !dbg !1833 {
entry:
    #dbg_value(i16 %a, !1836, !DIExpression(), !1837)
    #dbg_value(i16 20159, !1838, !DIExpression(), !1837)
  %conv = sext i16 %a to i32, !dbg !1839
  %mul = mul nsw i32 %conv, 20159, !dbg !1840
  %add = add nsw i32 %mul, 33554432, !dbg !1841
  %shr = ashr i32 %add, 26, !dbg !1842
    #dbg_value(i32 %shr, !1843, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1837)
    #dbg_value(i32 %shr, !1843, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1837)
  %0 = trunc nsw i32 %shr to i16, !dbg !1844
  %1 = mul i16 %0, -3329, !dbg !1844
  %conv7 = add i16 %1, %a, !dbg !1844
  ret i16 %conv7, !dbg !1845
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqcrystals_kyber1024_ref_verify(ptr noundef %a, ptr noundef %b, i32 noundef %len) local_unnamed_addr #0 !dbg !1846 {
entry:
    #dbg_value(ptr %a, !1850, !DIExpression(), !1851)
    #dbg_value(ptr %b, !1852, !DIExpression(), !1851)
    #dbg_value(i32 %len, !1853, !DIExpression(), !1851)
    #dbg_value(i8 0, !1854, !DIExpression(), !1851)
    #dbg_value(i32 0, !1855, !DIExpression(), !1851)
  br label %for.cond, !dbg !1856

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1858
  %r.0 = phi i8 [ 0, %entry ], [ %or2, %for.inc ], !dbg !1851
    #dbg_value(i8 %r.0, !1854, !DIExpression(), !1851)
    #dbg_value(i32 %i.0, !1855, !DIExpression(), !1851)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !1859
  br i1 %exitcond, label %for.inc, label %for.end, !dbg !1861

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i8 poison, i8 poison, i8 poison), !1854, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1851)
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %i.0, !dbg !1862
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1862
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 %i.0, !dbg !1863
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !1863
    #dbg_value(!DIArgList(i8 %r.0, i8 %0, i8 %1), !1854, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1851)
  %xor1 = xor i8 %0, %1, !dbg !1864
    #dbg_value(!DIArgList(i8 %r.0, i8 %xor1), !1854, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1851)
  %or2 = or i8 %r.0, %xor1, !dbg !1865
    #dbg_value(i8 %or2, !1854, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1851)
    #dbg_value(i8 %or2, !1854, !DIExpression(), !1851)
  %inc = add i32 %i.0, 1, !dbg !1866
    #dbg_value(i32 %inc, !1855, !DIExpression(), !1851)
  br label %for.cond, !dbg !1867, !llvm.loop !1868

for.end:                                          ; preds = %for.cond
  %r.0.lcssa = phi i8 [ %r.0, %for.cond ], !dbg !1851
  %2 = icmp ne i8 %r.0.lcssa, 0, !dbg !1870
  %conv6 = zext i1 %2 to i32, !dbg !1871
  ret i32 %conv6, !dbg !1872
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_cmov(ptr noundef %r, ptr noundef %x, i32 noundef %len, i8 noundef zeroext %b) local_unnamed_addr #0 !dbg !1873 {
entry:
    #dbg_value(ptr %r, !1876, !DIExpression(), !1877)
    #dbg_value(ptr %x, !1878, !DIExpression(), !1877)
    #dbg_value(i32 %len, !1879, !DIExpression(), !1877)
    #dbg_value(i8 %b, !1880, !DIExpression(), !1877)
  %0 = call i8 asm "", "=r,0"(i8 %b) #5, !dbg !1881, !srcloc !1882
    #dbg_value(i8 %0, !1880, !DIExpression(), !1877)
  %sub = sub i8 0, %0, !dbg !1883
    #dbg_value(i8 %sub, !1880, !DIExpression(), !1877)
    #dbg_value(i32 0, !1884, !DIExpression(), !1877)
  br label %for.cond, !dbg !1885

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1887
    #dbg_value(i32 %i.0, !1884, !DIExpression(), !1877)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !1888
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1890

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !1891
  %1 = load i8, ptr %arrayidx, align 1, !dbg !1891
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !1892
  %2 = load i8, ptr %arrayidx5, align 1, !dbg !1892
  %xor1 = xor i8 %1, %2, !dbg !1893
  %and2 = and i8 %xor1, %sub, !dbg !1894
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !1895
  %xor93 = xor i8 %1, %and2, !dbg !1896
  store i8 %xor93, ptr %arrayidx7, align 1, !dbg !1896
  %inc = add i32 %i.0, 1, !dbg !1897
    #dbg_value(i32 %inc, !1884, !DIExpression(), !1877)
  br label %for.cond, !dbg !1898, !llvm.loop !1899

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1901
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_cmov_int16(ptr noundef %r, i16 noundef signext %v, i16 noundef zeroext %b) local_unnamed_addr #0 !dbg !1902 {
entry:
    #dbg_value(ptr %r, !1905, !DIExpression(), !1906)
    #dbg_value(i16 %v, !1907, !DIExpression(), !1906)
    #dbg_value(i16 %b, !1908, !DIExpression(), !1906)
  %sub = sub i16 0, %b, !dbg !1909
    #dbg_value(i16 %sub, !1908, !DIExpression(), !1906)
  %0 = load i16, ptr %r, align 2, !dbg !1910
  %xor1 = xor i16 %0, %v, !dbg !1911
  %and = and i16 %xor1, %sub, !dbg !1912
  %xor6 = xor i16 %and, %0, !dbg !1913
  store i16 %xor6, ptr %r, align 2, !dbg !1913
  ret void, !dbg !1914
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_init(ptr noundef %state) local_unnamed_addr #0 !dbg !1915 {
entry:
    #dbg_value(ptr %state, !1919, !DIExpression(), !1920)
  call fastcc void @keccak_init(ptr noundef %state) #3, !dbg !1921
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1922
  store i64 0, ptr %arrayidx, align 8, !dbg !1923
  ret void, !dbg !1924
}

; Function Attrs: nounwind
define internal fastcc void @keccak_init(ptr noundef %s) unnamed_addr #0 !dbg !1925 {
entry:
    #dbg_value(ptr %s, !1929, !DIExpression(), !1930)
    #dbg_value(i32 0, !1931, !DIExpression(), !1930)
  br label %for.cond, !dbg !1932

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1934
    #dbg_value(i32 %i.0, !1931, !DIExpression(), !1930)
  %exitcond = icmp ne i32 %i.0, 25, !dbg !1935
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1937

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !1938
  store i64 0, ptr %arrayidx, align 8, !dbg !1939
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1940
    #dbg_value(i32 %inc, !1931, !DIExpression(), !1930)
  br label %for.cond, !dbg !1941, !llvm.loop !1942

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1944
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !1945 {
entry:
    #dbg_value(ptr %state, !1948, !DIExpression(), !1949)
    #dbg_value(ptr %in, !1950, !DIExpression(), !1949)
    #dbg_value(i32 %inlen, !1951, !DIExpression(), !1949)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1952
  %0 = load i64, ptr %arrayidx, align 8, !dbg !1952
  %conv = trunc i64 %0 to i32, !dbg !1952
  %call = call fastcc i32 @keccak_absorb(ptr noundef %state, i32 noundef %conv, i32 noundef 168, ptr noundef %in, i32 noundef %inlen) #3, !dbg !1953
  %conv1 = zext i32 %call to i64, !dbg !1953
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1954
  store i64 %conv1, ptr %arrayidx2, align 8, !dbg !1955
  ret void, !dbg !1956
}

; Function Attrs: nounwind
define internal fastcc i32 @keccak_absorb(ptr noundef %s, i32 noundef %pos, i32 noundef range(i32 136, 169) %r, ptr noundef %in, i32 noundef %inlen) unnamed_addr #0 !dbg !1957 {
entry:
    #dbg_value(ptr %s, !1960, !DIExpression(), !1961)
    #dbg_value(i32 %pos, !1962, !DIExpression(), !1961)
    #dbg_value(i32 %r, !1963, !DIExpression(), !1961)
    #dbg_value(ptr %in, !1964, !DIExpression(), !1961)
    #dbg_value(i32 %inlen, !1965, !DIExpression(), !1961)
  br label %while.cond, !dbg !1966

while.cond:                                       ; preds = %for.end, %entry
  %in.addr.0 = phi ptr [ %in, %entry ], [ %in.addr.1.lcssa, %for.end ]
  %inlen.addr.0 = phi i32 [ %inlen, %entry ], [ %sub2, %for.end ]
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ 0, %for.end ]
    #dbg_value(i32 %pos.addr.0, !1962, !DIExpression(), !1961)
    #dbg_value(i32 %inlen.addr.0, !1965, !DIExpression(), !1961)
    #dbg_value(ptr %in.addr.0, !1964, !DIExpression(), !1961)
  %add = add i32 %pos.addr.0, %inlen.addr.0, !dbg !1967
  %cmp.not = icmp ult i32 %add, %r, !dbg !1968
  br i1 %cmp.not, label %for.cond3.preheader, label %for.cond.preheader, !dbg !1966

for.cond.preheader:                               ; preds = %while.cond
  %umax = call i32 @llvm.umax.i32(i32 %pos.addr.0, i32 %r), !dbg !1969
  br label %for.cond, !dbg !1969

for.cond3.preheader:                              ; preds = %while.cond
  %in.addr.0.lcssa = phi ptr [ %in.addr.0, %while.cond ]
  %inlen.addr.0.lcssa = phi i32 [ %inlen.addr.0, %while.cond ]
  %pos.addr.0.lcssa = phi i32 [ %pos.addr.0, %while.cond ]
  br label %for.cond3, !dbg !1972

for.cond:                                         ; preds = %for.cond.preheader, %for.body
  %in.addr.1 = phi ptr [ %incdec.ptr, %for.body ], [ %in.addr.0, %for.cond.preheader ]
  %i.0 = phi i32 [ %inc, %for.body ], [ %pos.addr.0, %for.cond.preheader ], !dbg !1974
    #dbg_value(i32 %i.0, !1975, !DIExpression(), !1961)
    #dbg_value(ptr %in.addr.1, !1964, !DIExpression(), !1961)
  %exitcond = icmp ne i32 %i.0, %umax, !dbg !1976
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1969

for.body:                                         ; preds = %for.cond
    #dbg_value(ptr %in.addr.1, !1964, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1961)
  %0 = load i8, ptr %in.addr.1, align 1, !dbg !1978
  %conv = zext i8 %0 to i64, !dbg !1979
  %rem = shl nuw nsw i32 %i.0, 3, !dbg !1980
  %mul = and i32 %rem, 56, !dbg !1980
  %sh_prom = zext nneg i32 %mul to i64, !dbg !1981
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !1981
  %div2 = lshr i32 %i.0, 3, !dbg !1982
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div2, !dbg !1983
  %1 = load i64, ptr %arrayidx, align 8, !dbg !1984
  %xor = xor i64 %1, %shl, !dbg !1984
  store i64 %xor, ptr %arrayidx, align 8, !dbg !1984
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %in.addr.1, i32 1, !dbg !1985
    #dbg_value(ptr %incdec.ptr, !1964, !DIExpression(), !1961)
  %inc = add i32 %i.0, 1, !dbg !1986
    #dbg_value(i32 %inc, !1975, !DIExpression(), !1961)
  br label %for.cond, !dbg !1987, !llvm.loop !1988

for.end:                                          ; preds = %for.cond
  %in.addr.1.lcssa = phi ptr [ %in.addr.1, %for.cond ]
  %sub.neg = sub i32 %pos.addr.0, %r, !dbg !1990
  %sub2 = add i32 %sub.neg, %inlen.addr.0, !dbg !1991
    #dbg_value(i32 %sub2, !1965, !DIExpression(), !1961)
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !1992
    #dbg_value(i32 0, !1962, !DIExpression(), !1961)
  br label %while.cond, !dbg !1966, !llvm.loop !1993

for.cond3:                                        ; preds = %for.cond3.preheader, %for.body7
  %in.addr.2 = phi ptr [ %incdec.ptr8, %for.body7 ], [ %in.addr.0.lcssa, %for.cond3.preheader ]
  %i.1 = phi i32 [ %inc18, %for.body7 ], [ %pos.addr.0.lcssa, %for.cond3.preheader ], !dbg !1995
    #dbg_value(i32 %i.1, !1975, !DIExpression(), !1961)
    #dbg_value(ptr %in.addr.2, !1964, !DIExpression(), !1961)
  %add4 = add i32 %pos.addr.0.lcssa, %inlen.addr.0.lcssa, !dbg !1996
  %cmp5 = icmp ult i32 %i.1, %add4, !dbg !1998
  br i1 %cmp5, label %for.body7, label %for.end19, !dbg !1972

for.body7:                                        ; preds = %for.cond3
    #dbg_value(ptr %in.addr.2, !1964, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1961)
  %2 = load i8, ptr %in.addr.2, align 1, !dbg !1999
  %conv9 = zext i8 %2 to i64, !dbg !2000
  %rem10 = shl i32 %i.1, 3, !dbg !2001
  %mul11 = and i32 %rem10, 56, !dbg !2001
  %sh_prom12 = zext nneg i32 %mul11 to i64, !dbg !2002
  %shl13 = shl nuw i64 %conv9, %sh_prom12, !dbg !2002
  %div141 = lshr i32 %i.1, 3, !dbg !2003
  %arrayidx15 = getelementptr inbounds nuw i64, ptr %s, i32 %div141, !dbg !2004
  %3 = load i64, ptr %arrayidx15, align 8, !dbg !2005
  %xor16 = xor i64 %3, %shl13, !dbg !2005
  store i64 %xor16, ptr %arrayidx15, align 8, !dbg !2005
  %incdec.ptr8 = getelementptr inbounds nuw i8, ptr %in.addr.2, i32 1, !dbg !2006
    #dbg_value(ptr %incdec.ptr8, !1964, !DIExpression(), !1961)
  %inc18 = add nuw i32 %i.1, 1, !dbg !2007
    #dbg_value(i32 %inc18, !1975, !DIExpression(), !1961)
  br label %for.cond3, !dbg !2008, !llvm.loop !2009

for.end19:                                        ; preds = %for.cond3
  %i.1.lcssa = phi i32 [ %i.1, %for.cond3 ], !dbg !1995
  ret i32 %i.1.lcssa, !dbg !2011
}

; Function Attrs: nounwind
define internal fastcc void @KeccakF1600_StatePermute(ptr noundef %state) unnamed_addr #0 !dbg !2012 {
entry:
    #dbg_value(ptr %state, !2013, !DIExpression(), !2014)
  %0 = load i64, ptr %state, align 8, !dbg !2015
    #dbg_value(i64 %0, !2016, !DIExpression(), !2014)
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !2017
  %1 = load i64, ptr %arrayidx1, align 8, !dbg !2017
    #dbg_value(i64 %1, !2018, !DIExpression(), !2014)
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !2019
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !2019
    #dbg_value(i64 %2, !2020, !DIExpression(), !2014)
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !2021
  %3 = load i64, ptr %arrayidx3, align 8, !dbg !2021
    #dbg_value(i64 %3, !2022, !DIExpression(), !2014)
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !2023
  %4 = load i64, ptr %arrayidx4, align 8, !dbg !2023
    #dbg_value(i64 %4, !2024, !DIExpression(), !2014)
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !2025
  %5 = load i64, ptr %arrayidx5, align 8, !dbg !2025
    #dbg_value(i64 %5, !2026, !DIExpression(), !2014)
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !2027
  %6 = load i64, ptr %arrayidx6, align 8, !dbg !2027
    #dbg_value(i64 %6, !2028, !DIExpression(), !2014)
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !2029
  %7 = load i64, ptr %arrayidx7, align 8, !dbg !2029
    #dbg_value(i64 %7, !2030, !DIExpression(), !2014)
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !2031
  %8 = load i64, ptr %arrayidx8, align 8, !dbg !2031
    #dbg_value(i64 %8, !2032, !DIExpression(), !2014)
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !2033
  %9 = load i64, ptr %arrayidx9, align 8, !dbg !2033
    #dbg_value(i64 %9, !2034, !DIExpression(), !2014)
  %arrayidx10 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !2035
  %10 = load i64, ptr %arrayidx10, align 8, !dbg !2035
    #dbg_value(i64 %10, !2036, !DIExpression(), !2014)
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !2037
  %11 = load i64, ptr %arrayidx11, align 8, !dbg !2037
    #dbg_value(i64 %11, !2038, !DIExpression(), !2014)
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !2039
  %12 = load i64, ptr %arrayidx12, align 8, !dbg !2039
    #dbg_value(i64 %12, !2040, !DIExpression(), !2014)
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !2041
  %13 = load i64, ptr %arrayidx13, align 8, !dbg !2041
    #dbg_value(i64 %13, !2042, !DIExpression(), !2014)
  %arrayidx14 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !2043
  %14 = load i64, ptr %arrayidx14, align 8, !dbg !2043
    #dbg_value(i64 %14, !2044, !DIExpression(), !2014)
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !2045
  %15 = load i64, ptr %arrayidx15, align 8, !dbg !2045
    #dbg_value(i64 %15, !2046, !DIExpression(), !2014)
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !2047
  %16 = load i64, ptr %arrayidx16, align 8, !dbg !2047
    #dbg_value(i64 %16, !2048, !DIExpression(), !2014)
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !2049
  %17 = load i64, ptr %arrayidx17, align 8, !dbg !2049
    #dbg_value(i64 %17, !2050, !DIExpression(), !2014)
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !2051
  %18 = load i64, ptr %arrayidx18, align 8, !dbg !2051
    #dbg_value(i64 %18, !2052, !DIExpression(), !2014)
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !2053
  %19 = load i64, ptr %arrayidx19, align 8, !dbg !2053
    #dbg_value(i64 %19, !2054, !DIExpression(), !2014)
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !2055
  %20 = load i64, ptr %arrayidx20, align 8, !dbg !2055
    #dbg_value(i64 %20, !2056, !DIExpression(), !2014)
  %arrayidx21 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !2057
  %21 = load i64, ptr %arrayidx21, align 8, !dbg !2057
    #dbg_value(i64 %21, !2058, !DIExpression(), !2014)
  %arrayidx22 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !2059
  %22 = load i64, ptr %arrayidx22, align 8, !dbg !2059
    #dbg_value(i64 %22, !2060, !DIExpression(), !2014)
  %arrayidx23 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !2061
  %23 = load i64, ptr %arrayidx23, align 8, !dbg !2061
    #dbg_value(i64 %23, !2062, !DIExpression(), !2014)
  %arrayidx24 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !2063
  %24 = load i64, ptr %arrayidx24, align 8, !dbg !2063
    #dbg_value(i64 %24, !2064, !DIExpression(), !2014)
    #dbg_value(i32 0, !2065, !DIExpression(), !2014)
  br label %for.cond, !dbg !2066

for.cond:                                         ; preds = %for.inc, %entry
  %Aso.0 = phi i64 [ %23, %entry ], [ %xor444, %for.inc ], !dbg !2014
  %Asi.0 = phi i64 [ %22, %entry ], [ %xor441, %for.inc ], !dbg !2014
  %Ase.0 = phi i64 [ %21, %entry ], [ %xor438, %for.inc ], !dbg !2014
  %Asa.0 = phi i64 [ %20, %entry ], [ %xor435, %for.inc ], !dbg !2014
  %Amu.0 = phi i64 [ %19, %entry ], [ %xor412, %for.inc ], !dbg !2014
  %Amo.0 = phi i64 [ %18, %entry ], [ %xor409, %for.inc ], !dbg !2014
  %Ami.0 = phi i64 [ %17, %entry ], [ %xor406, %for.inc ], !dbg !2014
  %Ame.0 = phi i64 [ %16, %entry ], [ %xor403, %for.inc ], !dbg !2014
  %Ama.0 = phi i64 [ %15, %entry ], [ %xor400, %for.inc ], !dbg !2014
  %Aku.0 = phi i64 [ %14, %entry ], [ %xor377, %for.inc ], !dbg !2014
  %Ako.0 = phi i64 [ %13, %entry ], [ %xor374, %for.inc ], !dbg !2014
  %Aki.0 = phi i64 [ %12, %entry ], [ %xor371, %for.inc ], !dbg !2014
  %Ake.0 = phi i64 [ %11, %entry ], [ %xor368, %for.inc ], !dbg !2014
  %Aka.0 = phi i64 [ %10, %entry ], [ %xor365, %for.inc ], !dbg !2014
  %Agu.0 = phi i64 [ %9, %entry ], [ %xor342, %for.inc ], !dbg !2014
  %Ago.0 = phi i64 [ %8, %entry ], [ %xor339, %for.inc ], !dbg !2014
  %Agi.0 = phi i64 [ %7, %entry ], [ %xor336, %for.inc ], !dbg !2014
  %Age.0 = phi i64 [ %6, %entry ], [ %xor333, %for.inc ], !dbg !2014
  %Aga.0 = phi i64 [ %5, %entry ], [ %xor330, %for.inc ], !dbg !2014
  %Abu.0 = phi i64 [ %4, %entry ], [ %xor307, %for.inc ], !dbg !2014
  %Abo.0 = phi i64 [ %3, %entry ], [ %xor304, %for.inc ], !dbg !2014
  %Abi.0 = phi i64 [ %2, %entry ], [ %xor301, %for.inc ], !dbg !2014
  %Abe.0 = phi i64 [ %1, %entry ], [ %xor298, %for.inc ], !dbg !2014
  %Aba.0 = phi i64 [ %0, %entry ], [ %xor295, %for.inc ], !dbg !2014
  %round.0 = phi i32 [ 0, %entry ], [ %add448, %for.inc ], !dbg !2068
  %Asu.0 = phi i64 [ %24, %entry ], [ %xor447, %for.inc ], !dbg !2014
    #dbg_value(i64 %Asu.0, !2064, !DIExpression(), !2014)
    #dbg_value(i32 %round.0, !2065, !DIExpression(), !2014)
    #dbg_value(i64 %Aba.0, !2016, !DIExpression(), !2014)
    #dbg_value(i64 %Abe.0, !2018, !DIExpression(), !2014)
    #dbg_value(i64 %Abi.0, !2020, !DIExpression(), !2014)
    #dbg_value(i64 %Abo.0, !2022, !DIExpression(), !2014)
    #dbg_value(i64 %Abu.0, !2024, !DIExpression(), !2014)
    #dbg_value(i64 %Aga.0, !2026, !DIExpression(), !2014)
    #dbg_value(i64 %Age.0, !2028, !DIExpression(), !2014)
    #dbg_value(i64 %Agi.0, !2030, !DIExpression(), !2014)
    #dbg_value(i64 %Ago.0, !2032, !DIExpression(), !2014)
    #dbg_value(i64 %Agu.0, !2034, !DIExpression(), !2014)
    #dbg_value(i64 %Aka.0, !2036, !DIExpression(), !2014)
    #dbg_value(i64 %Ake.0, !2038, !DIExpression(), !2014)
    #dbg_value(i64 %Aki.0, !2040, !DIExpression(), !2014)
    #dbg_value(i64 %Ako.0, !2042, !DIExpression(), !2014)
    #dbg_value(i64 %Aku.0, !2044, !DIExpression(), !2014)
    #dbg_value(i64 %Ama.0, !2046, !DIExpression(), !2014)
    #dbg_value(i64 %Ame.0, !2048, !DIExpression(), !2014)
    #dbg_value(i64 %Ami.0, !2050, !DIExpression(), !2014)
    #dbg_value(i64 %Amo.0, !2052, !DIExpression(), !2014)
    #dbg_value(i64 %Amu.0, !2054, !DIExpression(), !2014)
    #dbg_value(i64 %Asa.0, !2056, !DIExpression(), !2014)
    #dbg_value(i64 %Ase.0, !2058, !DIExpression(), !2014)
    #dbg_value(i64 %Asi.0, !2060, !DIExpression(), !2014)
    #dbg_value(i64 %Aso.0, !2062, !DIExpression(), !2014)
  %cmp = icmp samesign ult i32 %round.0, 24, !dbg !2069
  br i1 %cmp, label %for.inc, label %for.end, !dbg !2071

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %Asa.0, i64 %Ama.0, i64 %Aka.0, i64 %Aga.0), !2072, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %Ase.0, i64 %Ame.0, i64 %Ake.0, i64 %Age.0), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %Asi.0, i64 %Ami.0, i64 %Aki.0, i64 %Agi.0), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %Aso.0, i64 %Amo.0, i64 %Ako.0, i64 %Ago.0), !2075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %Asu.0, i64 %Amu.0, i64 %Aku.0, i64 %Agu.0), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2078, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2079, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2080, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2081, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2016, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2072, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2028, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2073, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2040, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2074, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2052, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2075, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2064, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2076, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2082, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2082, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2083, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2084, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2085, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2086, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2072, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2073, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2036, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2074, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2048, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2075, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2060, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2076, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2087, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2088, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2089, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2090, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2091, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2018, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2072, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2030, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2073, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2042, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2074, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2054, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2075, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2056, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2076, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2092, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2093, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2094, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2095, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2096, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2072, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2073, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2074, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2050, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2075, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2076, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2097, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2098, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2099, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2100, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2101, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2072, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2032, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2073, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2074, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2046, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2075, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2058, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2076, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2102, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2103, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2104, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2105, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2106, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2072, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2078, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2079, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2080, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2081, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2082, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2072, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2088, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2073, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2094, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2074, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2100, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2075, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2106, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2076, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2016, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2016, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2018, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2085, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2072, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2091, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2073, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2092, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2074, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2098, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2075, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2104, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2076, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2028, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2030, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2032, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2083, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2072, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2089, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2073, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2095, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2074, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2101, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2075, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2102, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2076, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2036, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2040, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2042, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2086, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2072, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2087, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2073, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2093, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2074, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2099, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2075, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2105, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2076, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2046, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2048, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2050, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2052, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2054, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2084, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2072, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2090, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2073, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2096, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2074, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2097, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2075, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2103, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 poison, !2076, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2056, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2058, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2060, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2064, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor32 = xor i64 %Abi.0, %Agi.0, !dbg !2107
    #dbg_value(!DIArgList(i64 %xor32, i64 %Asi.0, i64 %Ami.0, i64 %Aki.0), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor33 = xor i64 %xor32, %Aki.0, !dbg !2109
    #dbg_value(!DIArgList(i64 %xor33, i64 %Asi.0, i64 %Ami.0), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor34 = xor i64 %xor33, %Ami.0, !dbg !2110
    #dbg_value(!DIArgList(i64 %xor34, i64 %Asi.0), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor35 = xor i64 %xor34, %Asi.0, !dbg !2111
    #dbg_value(i64 %xor35, !2074, !DIExpression(), !2014)
  %xor40 = xor i64 %Abu.0, %Agu.0, !dbg !2112
    #dbg_value(!DIArgList(i64 %xor40, i64 %Asu.0, i64 %Amu.0, i64 %Aku.0), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor41 = xor i64 %xor40, %Aku.0, !dbg !2113
    #dbg_value(!DIArgList(i64 %xor41, i64 %Asu.0, i64 %Amu.0), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor42 = xor i64 %xor41, %Amu.0, !dbg !2114
    #dbg_value(!DIArgList(i64 %xor42, i64 %Asu.0), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor43 = xor i64 %xor42, %Asu.0, !dbg !2115
    #dbg_value(i64 %xor43, !2076, !DIExpression(), !2014)
  %25 = shl i64 %xor43, 1, !dbg !2116
  %26 = lshr i64 %xor43, 63, !dbg !2116
  %27 = or i64 %25, %26, !dbg !2116
    #dbg_value(!DIArgList(i64 %Ago.0, i64 %xor35, i64 %27), !2032, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %xor35, i64 %27), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Ako.0, i64 %xor35, i64 %27), !2042, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Amo.0, i64 %xor35, i64 %27), !2052, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Aso.0, i64 %xor35, i64 %27), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor35, i64 %27), !2080, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor57 = xor i64 %xor35, %27, !dbg !2117
    #dbg_value(!DIArgList(i64 %Ago.0, i64 %xor57), !2032, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %xor57), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Ako.0, i64 %xor57), !2042, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Amo.0, i64 %xor57), !2052, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Aso.0, i64 %xor57), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 %xor57, !2080, !DIExpression(), !2014)
  %xor203 = xor i64 %Ago.0, %xor57, !dbg !2118
    #dbg_value(i64 %xor203, !2032, !DIExpression(), !2014)
  %28 = shl i64 %xor203, 55, !dbg !2119
  %29 = lshr i64 %xor203, 9, !dbg !2119
  %30 = or i64 %28, %29, !dbg !2119
    #dbg_value(i64 %30, !2073, !DIExpression(), !2014)
  %xor28 = xor i64 %Abe.0, %Age.0, !dbg !2120
    #dbg_value(!DIArgList(i64 %xor28, i64 %Ase.0, i64 %Ame.0, i64 %Ake.0), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor29 = xor i64 %xor28, %Ake.0, !dbg !2121
    #dbg_value(!DIArgList(i64 %xor29, i64 %Ase.0, i64 %Ame.0), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor30 = xor i64 %xor29, %Ame.0, !dbg !2122
    #dbg_value(!DIArgList(i64 %xor30, i64 %Ase.0), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor31 = xor i64 %xor30, %Ase.0, !dbg !2123
    #dbg_value(i64 %xor31, !2073, !DIExpression(), !2014)
  %31 = shl i64 %xor31, 1, !dbg !2124
  %32 = lshr i64 %xor31, 63, !dbg !2124
  %33 = or i64 %31, %32, !dbg !2124
    #dbg_value(!DIArgList(i64 %xor43, i64 %33), !2077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor43, i64 %33), !2016, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor43, i64 %33), !2072, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Aka.0, i64 %xor43, i64 %33), !2036, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Aga.0, i64 %xor43, i64 %33), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Asa.0, i64 %xor43, i64 %33), !2056, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Ama.0, i64 %xor43, i64 %33), !2046, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor45 = xor i64 %xor43, %33, !dbg !2125
    #dbg_value(i64 %xor45, !2077, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor45), !2072, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor45), !2016, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Aka.0, i64 %xor45), !2036, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Aga.0, i64 %xor45), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Asa.0, i64 %xor45), !2056, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Ama.0, i64 %xor45), !2046, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor211 = xor i64 %Ama.0, %xor45, !dbg !2126
    #dbg_value(i64 %xor211, !2046, !DIExpression(), !2014)
  %34 = shl i64 %xor211, 41, !dbg !2127
  %35 = lshr i64 %xor211, 23, !dbg !2127
  %36 = or i64 %34, %35, !dbg !2127
    #dbg_value(i64 %36, !2075, !DIExpression(), !2014)
  %xor36 = xor i64 %Abo.0, %Ago.0, !dbg !2128
    #dbg_value(!DIArgList(i64 %xor36, i64 %Aso.0, i64 %Amo.0, i64 %Ako.0), !2075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor37 = xor i64 %xor36, %Ako.0, !dbg !2129
    #dbg_value(!DIArgList(i64 %xor37, i64 %Aso.0, i64 %Amo.0), !2075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor38 = xor i64 %xor37, %Amo.0, !dbg !2130
    #dbg_value(!DIArgList(i64 %xor38, i64 %Aso.0), !2075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor39 = xor i64 %xor38, %Aso.0, !dbg !2131
    #dbg_value(i64 %xor39, !2075, !DIExpression(), !2014)
  %xor = xor i64 %Aba.0, %Aga.0, !dbg !2132
    #dbg_value(!DIArgList(i64 %xor, i64 %Asa.0, i64 %Ama.0, i64 %Aka.0), !2072, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor25 = xor i64 %xor, %Aka.0, !dbg !2133
    #dbg_value(!DIArgList(i64 %xor25, i64 %Asa.0, i64 %Ama.0), !2072, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor26 = xor i64 %xor25, %Ama.0, !dbg !2134
    #dbg_value(!DIArgList(i64 %xor26, i64 %Asa.0), !2072, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor27 = xor i64 %xor26, %Asa.0, !dbg !2135
    #dbg_value(i64 %xor27, !2072, !DIExpression(), !2014)
  %37 = shl i64 %xor27, 1, !dbg !2136
  %38 = lshr i64 %xor27, 63, !dbg !2136
  %39 = or i64 %37, %38, !dbg !2136
    #dbg_value(!DIArgList(i64 %Agu.0, i64 %xor39, i64 %39), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %xor39, i64 %39), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Asu.0, i64 %xor39, i64 %39), !2064, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Amu.0, i64 %xor39, i64 %39), !2054, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor39, i64 %39), !2081, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Aku.0, i64 %xor39, i64 %39), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor61 = xor i64 %xor39, %39, !dbg !2137
    #dbg_value(!DIArgList(i64 %Agu.0, i64 %xor61), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %xor61), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Asu.0, i64 %xor61), !2064, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Amu.0, i64 %xor61), !2054, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 %xor61, !2081, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 %Aku.0, i64 %xor61), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor207 = xor i64 %Aku.0, %xor61, !dbg !2138
    #dbg_value(i64 %xor207, !2044, !DIExpression(), !2014)
  %40 = shl i64 %xor207, 39, !dbg !2139
  %41 = lshr i64 %xor207, 25, !dbg !2139
  %42 = or i64 %40, %41, !dbg !2139
    #dbg_value(i64 %42, !2074, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 %30, i64 %36, i64 %42), !2103, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %not222 = xor i64 %42, -1, !dbg !2140
    #dbg_value(!DIArgList(i64 %30, i64 %36, i64 %not222), !2103, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %and223 = and i64 %36, %not222, !dbg !2141
    #dbg_value(!DIArgList(i64 %30, i64 %and223), !2103, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor224 = xor i64 %30, %and223, !dbg !2142
    #dbg_value(i64 %xor224, !2103, !DIExpression(), !2014)
  %43 = shl i64 %xor39, 1, !dbg !2143
  %44 = lshr i64 %xor39, 63, !dbg !2143
  %45 = or i64 %43, %44, !dbg !2143
    #dbg_value(!DIArgList(i64 %xor31, i64 %45), !2079, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Aki.0, i64 %xor31, i64 %45), !2040, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Agi.0, i64 %xor31, i64 %45), !2030, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %xor31, i64 %45), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Asi.0, i64 %xor31, i64 %45), !2060, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Ami.0, i64 %xor31, i64 %45), !2050, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor53 = xor i64 %xor31, %45, !dbg !2144
    #dbg_value(i64 %xor53, !2079, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 %Aki.0, i64 %xor53), !2040, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Agi.0, i64 %xor53), !2030, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %xor53), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Asi.0, i64 %xor53), !2060, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Ami.0, i64 %xor53), !2050, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor67 = xor i64 %Aki.0, %xor53, !dbg !2145
    #dbg_value(i64 %xor67, !2040, !DIExpression(), !2014)
  %46 = shl i64 %xor67, 43, !dbg !2146
  %47 = lshr i64 %xor67, 21, !dbg !2146
  %48 = or i64 %46, %47, !dbg !2146
    #dbg_value(i64 %48, !2074, !DIExpression(), !2014)
  %49 = shl i64 %xor35, 1, !dbg !2147
  %50 = lshr i64 %xor35, 63, !dbg !2147
  %51 = or i64 %49, %50, !dbg !2147
    #dbg_value(!DIArgList(i64 %xor27, i64 %51), !2078, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Age.0, i64 %xor27, i64 %51), !2028, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %xor27, i64 %51), !2018, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Ake.0, i64 %xor27, i64 %51), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Ame.0, i64 %xor27, i64 %51), !2048, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Ase.0, i64 %xor27, i64 %51), !2058, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor49 = xor i64 %xor27, %51, !dbg !2148
    #dbg_value(i64 %xor49, !2078, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 %Age.0, i64 %xor49), !2028, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %xor49), !2018, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Ake.0, i64 %xor49), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Ame.0, i64 %xor49), !2048, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %Ase.0, i64 %xor49), !2058, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor63 = xor i64 %Age.0, %xor49, !dbg !2149
    #dbg_value(i64 %xor63, !2028, !DIExpression(), !2014)
  %52 = shl i64 %xor63, 44, !dbg !2150
  %53 = lshr i64 %xor63, 20, !dbg !2150
  %54 = or i64 %52, %53, !dbg !2150
    #dbg_value(i64 %54, !2073, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %48, i64 %xor45, i64 %54), !2082, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %not = xor i64 %54, -1, !dbg !2151
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %48, i64 %xor45, i64 %not), !2082, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %and = and i64 %48, %not, !dbg !2152
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %and, i64 %xor45), !2082, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %arrayidx80 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %round.0, !dbg !2153
  %55 = load i64, ptr %arrayidx80, align 8, !dbg !2153
    #dbg_value(!DIArgList(i64 %and, i64 %Aba.0, i64 %xor45, i64 %55), !2082, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
  %56 = xor i64 %and, %55, !dbg !2154
    #dbg_value(!DIArgList(i64 %56, i64 %Aba.0, i64 %xor45), !2082, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor62 = xor i64 %Aba.0, %xor45, !dbg !2155
    #dbg_value(i64 %xor62, !2016, !DIExpression(), !2014)
    #dbg_value(i64 %xor62, !2072, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 %56, i64 %xor62), !2082, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor81 = xor i64 %56, %xor62, !dbg !2154
    #dbg_value(i64 %xor81, !2082, !DIExpression(), !2014)
  %xor94 = xor i64 %Abo.0, %xor57, !dbg !2156
    #dbg_value(i64 %xor94, !2022, !DIExpression(), !2014)
  %57 = shl i64 %xor94, 28, !dbg !2157
  %58 = lshr i64 %xor94, 36, !dbg !2157
  %59 = or i64 %57, %58, !dbg !2157
    #dbg_value(i64 %59, !2072, !DIExpression(), !2014)
  %xor102 = xor i64 %Aka.0, %xor45, !dbg !2158
    #dbg_value(i64 %xor102, !2036, !DIExpression(), !2014)
  %60 = shl i64 %xor102, 3, !dbg !2159
  %61 = lshr i64 %xor102, 61, !dbg !2159
  %62 = or i64 %60, %61, !dbg !2159
    #dbg_value(i64 %62, !2074, !DIExpression(), !2014)
  %xor98 = xor i64 %Agu.0, %xor61, !dbg !2160
    #dbg_value(i64 %xor98, !2034, !DIExpression(), !2014)
  %63 = shl i64 %xor98, 20, !dbg !2161
  %64 = lshr i64 %xor98, 44, !dbg !2161
  %65 = or i64 %63, %64, !dbg !2161
    #dbg_value(i64 %65, !2073, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 %59, i64 %62, i64 %65), !2087, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %not114 = xor i64 %65, -1, !dbg !2162
    #dbg_value(!DIArgList(i64 %59, i64 %62, i64 %not114), !2087, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %and115 = and i64 %62, %not114, !dbg !2163
    #dbg_value(!DIArgList(i64 %59, i64 %and115), !2087, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor116 = xor i64 %59, %and115, !dbg !2164
    #dbg_value(i64 %xor116, !2087, !DIExpression(), !2014)
  %xor234 = xor i64 %xor81, %xor116, !dbg !2165
  %xor129 = xor i64 %Abe.0, %xor49, !dbg !2166
    #dbg_value(i64 %xor129, !2018, !DIExpression(), !2014)
  %66 = shl i64 %xor129, 1, !dbg !2167
  %67 = lshr i64 %xor129, 63, !dbg !2167
  %68 = or i64 %66, %67, !dbg !2167
    #dbg_value(i64 %68, !2072, !DIExpression(), !2014)
  %xor137 = xor i64 %Ako.0, %xor57, !dbg !2168
    #dbg_value(i64 %xor137, !2042, !DIExpression(), !2014)
  %69 = shl i64 %xor137, 25, !dbg !2169
  %70 = lshr i64 %xor137, 39, !dbg !2169
  %71 = or i64 %69, %70, !dbg !2169
    #dbg_value(i64 %71, !2074, !DIExpression(), !2014)
  %xor133 = xor i64 %Agi.0, %xor53, !dbg !2170
    #dbg_value(i64 %xor133, !2030, !DIExpression(), !2014)
  %72 = shl i64 %xor133, 6, !dbg !2171
  %73 = lshr i64 %xor133, 58, !dbg !2171
  %74 = or i64 %72, %73, !dbg !2171
    #dbg_value(i64 %74, !2073, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 %68, i64 %71, i64 %74), !2092, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %not149 = xor i64 %74, -1, !dbg !2172
    #dbg_value(!DIArgList(i64 %68, i64 %71, i64 %not149), !2092, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %and150 = and i64 %71, %not149, !dbg !2173
    #dbg_value(!DIArgList(i64 %68, i64 %and150), !2092, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor151 = xor i64 %68, %and150, !dbg !2174
    #dbg_value(i64 %xor151, !2092, !DIExpression(), !2014)
  %xor235 = xor i64 %xor234, %xor151, !dbg !2175
  %xor164 = xor i64 %Abu.0, %xor61, !dbg !2176
    #dbg_value(i64 %xor164, !2024, !DIExpression(), !2014)
  %75 = shl i64 %xor164, 27, !dbg !2177
  %76 = lshr i64 %xor164, 37, !dbg !2177
  %77 = or i64 %75, %76, !dbg !2177
    #dbg_value(i64 %77, !2072, !DIExpression(), !2014)
  %xor172 = xor i64 %Ake.0, %xor49, !dbg !2178
    #dbg_value(i64 %xor172, !2038, !DIExpression(), !2014)
  %78 = shl i64 %xor172, 10, !dbg !2179
  %79 = lshr i64 %xor172, 54, !dbg !2179
  %80 = or i64 %78, %79, !dbg !2179
    #dbg_value(i64 %80, !2074, !DIExpression(), !2014)
  %xor168 = xor i64 %Aga.0, %xor45, !dbg !2180
    #dbg_value(i64 %xor168, !2026, !DIExpression(), !2014)
  %81 = shl i64 %xor168, 36, !dbg !2181
  %82 = lshr i64 %xor168, 28, !dbg !2181
  %83 = or i64 %81, %82, !dbg !2181
    #dbg_value(i64 %83, !2073, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 %77, i64 %80, i64 %83), !2097, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %not184 = xor i64 %83, -1, !dbg !2182
    #dbg_value(!DIArgList(i64 %77, i64 %80, i64 %not184), !2097, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %and185 = and i64 %80, %not184, !dbg !2183
    #dbg_value(!DIArgList(i64 %77, i64 %and185), !2097, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor186 = xor i64 %77, %and185, !dbg !2184
    #dbg_value(i64 %xor186, !2097, !DIExpression(), !2014)
  %xor236 = xor i64 %xor235, %xor186, !dbg !2185
  %xor199 = xor i64 %Abi.0, %xor53, !dbg !2186
    #dbg_value(i64 %xor199, !2020, !DIExpression(), !2014)
  %84 = shl i64 %xor199, 62, !dbg !2187
  %85 = lshr i64 %xor199, 2, !dbg !2187
  %86 = or i64 %84, %85, !dbg !2187
    #dbg_value(!DIArgList(i64 %86, i64 %42, i64 %30), !2102, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor236, i64 %86, i64 %42, i64 %30), !2072, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
  %not219 = xor i64 %30, -1, !dbg !2188
    #dbg_value(!DIArgList(i64 %86, i64 %42, i64 %not219), !2102, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor236, i64 %86, i64 %42, i64 %not219), !2072, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
  %and220 = and i64 %42, %not219, !dbg !2189
    #dbg_value(!DIArgList(i64 %86, i64 %and220), !2102, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor236, i64 %86, i64 %and220), !2072, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor221 = xor i64 %86, %and220, !dbg !2190
    #dbg_value(i64 %xor221, !2102, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor221), !2072, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor237 = xor i64 %xor236, %xor221, !dbg !2191
    #dbg_value(i64 %xor237, !2072, !DIExpression(), !2014)
  %xor75 = xor i64 %Asu.0, %xor61, !dbg !2192
    #dbg_value(i64 %xor75, !2064, !DIExpression(), !2014)
  %87 = shl i64 %xor75, 14, !dbg !2193
  %88 = lshr i64 %xor75, 50, !dbg !2193
  %89 = or i64 %87, %88, !dbg !2193
    #dbg_value(i64 %89, !2076, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 %89, i64 %54, i64 %xor62), !2086, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor71 = xor i64 %Amo.0, %xor57, !dbg !2194
    #dbg_value(i64 %xor71, !2052, !DIExpression(), !2014)
  %90 = shl i64 %xor71, 21, !dbg !2195
  %91 = lshr i64 %xor71, 43, !dbg !2195
  %92 = or i64 %90, %91, !dbg !2195
    #dbg_value(i64 %92, !2075, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 %48, i64 %89, i64 %92), !2084, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %54, i64 %92, i64 %48), !2083, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %92, i64 %xor62, i64 %89), !2085, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %not85 = xor i64 %92, -1, !dbg !2196
    #dbg_value(!DIArgList(i64 %48, i64 %89, i64 %not85), !2084, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %and86 = and i64 %89, %not85, !dbg !2197
    #dbg_value(!DIArgList(i64 %48, i64 %and86), !2084, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor87 = xor i64 %48, %and86, !dbg !2198
    #dbg_value(i64 %xor87, !2084, !DIExpression(), !2014)
  %xor110 = xor i64 %Asi.0, %xor53, !dbg !2199
    #dbg_value(i64 %xor110, !2060, !DIExpression(), !2014)
  %93 = shl i64 %xor110, 61, !dbg !2200
  %94 = lshr i64 %xor110, 3, !dbg !2200
  %95 = or i64 %93, %94, !dbg !2200
    #dbg_value(i64 %95, !2076, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 %95, i64 %65, i64 %59), !2091, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor106 = xor i64 %Ame.0, %xor49, !dbg !2201
    #dbg_value(i64 %xor106, !2048, !DIExpression(), !2014)
  %96 = shl i64 %xor106, 45, !dbg !2202
  %97 = lshr i64 %xor106, 19, !dbg !2202
  %98 = or i64 %96, %97, !dbg !2202
    #dbg_value(i64 %98, !2075, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 %62, i64 %95, i64 %98), !2089, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %98, i64 %59, i64 %95), !2090, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %65, i64 %98, i64 %62), !2088, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %not120 = xor i64 %98, -1, !dbg !2203
    #dbg_value(!DIArgList(i64 %62, i64 %95, i64 %not120), !2089, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %and121 = and i64 %95, %not120, !dbg !2204
    #dbg_value(!DIArgList(i64 %62, i64 %and121), !2089, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor122 = xor i64 %62, %and121, !dbg !2205
    #dbg_value(i64 %xor122, !2089, !DIExpression(), !2014)
  %xor242 = xor i64 %xor87, %xor122, !dbg !2206
  %xor145 = xor i64 %Asa.0, %xor45, !dbg !2207
    #dbg_value(i64 %xor145, !2056, !DIExpression(), !2014)
  %99 = shl i64 %xor145, 18, !dbg !2208
  %100 = lshr i64 %xor145, 46, !dbg !2208
  %101 = or i64 %99, %100, !dbg !2208
    #dbg_value(i64 %101, !2076, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 %101, i64 %74, i64 %68), !2096, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor141 = xor i64 %Amu.0, %xor61, !dbg !2209
    #dbg_value(i64 %xor141, !2054, !DIExpression(), !2014)
  %102 = shl i64 %xor141, 8, !dbg !2210
  %103 = lshr i64 %xor141, 56, !dbg !2210
  %104 = or i64 %102, %103, !dbg !2210
    #dbg_value(i64 %104, !2075, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 %71, i64 %101, i64 %104), !2094, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %74, i64 %104, i64 %71), !2093, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %104, i64 %68, i64 %101), !2095, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %not155 = xor i64 %104, -1, !dbg !2211
    #dbg_value(!DIArgList(i64 %71, i64 %101, i64 %not155), !2094, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %and156 = and i64 %101, %not155, !dbg !2212
    #dbg_value(!DIArgList(i64 %71, i64 %and156), !2094, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor157 = xor i64 %71, %and156, !dbg !2213
    #dbg_value(i64 %xor157, !2094, !DIExpression(), !2014)
  %xor243 = xor i64 %xor242, %xor157, !dbg !2214
  %xor180 = xor i64 %Aso.0, %xor57, !dbg !2215
    #dbg_value(i64 %xor180, !2062, !DIExpression(), !2014)
  %105 = shl i64 %xor180, 56, !dbg !2216
  %106 = lshr i64 %xor180, 8, !dbg !2216
  %107 = or i64 %105, %106, !dbg !2216
    #dbg_value(i64 %107, !2076, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 %107, i64 %83, i64 %77), !2101, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor176 = xor i64 %Ami.0, %xor53, !dbg !2217
    #dbg_value(i64 %xor176, !2050, !DIExpression(), !2014)
  %108 = shl i64 %xor176, 15, !dbg !2218
  %109 = lshr i64 %xor176, 49, !dbg !2218
  %110 = or i64 %108, %109, !dbg !2218
    #dbg_value(i64 %110, !2075, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 %80, i64 %107, i64 %110), !2099, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %83, i64 %110, i64 %80), !2098, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %110, i64 %77, i64 %107), !2100, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %54, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71, i64 %65, i64 %98, i64 %62, i64 %92, i64 %48), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %not190 = xor i64 %110, -1, !dbg !2219
    #dbg_value(!DIArgList(i64 %80, i64 %107, i64 %not190), !2099, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %and191 = and i64 %107, %not190, !dbg !2220
    #dbg_value(!DIArgList(i64 %80, i64 %and191), !2099, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor192 = xor i64 %80, %and191, !dbg !2221
    #dbg_value(i64 %xor192, !2099, !DIExpression(), !2014)
  %xor244 = xor i64 %xor243, %xor192, !dbg !2222
  %xor215 = xor i64 %Ase.0, %xor49, !dbg !2223
    #dbg_value(i64 %xor215, !2058, !DIExpression(), !2014)
  %111 = shl i64 %xor215, 2, !dbg !2224
  %112 = lshr i64 %xor215, 62, !dbg !2224
  %113 = or i64 %111, %112, !dbg !2224
    #dbg_value(!DIArgList(i64 %42, i64 %113, i64 %36), !2104, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %113, i64 %30, i64 %86), !2106, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %36, i64 %86, i64 %113), !2105, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor244, i64 %42, i64 %113, i64 %36), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %92, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101, i64 %98, i64 %xor62, i64 %89, i64 %59, i64 %95), !2075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %89, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68, i64 %95, i64 %65, i64 %59, i64 %54, i64 %xor62), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
  %not225 = xor i64 %36, -1, !dbg !2225
    #dbg_value(!DIArgList(i64 %42, i64 %113, i64 %not225), !2104, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor244, i64 %42, i64 %113, i64 %not225), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
  %and226 = and i64 %113, %not225, !dbg !2226
    #dbg_value(!DIArgList(i64 %42, i64 %and226), !2104, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor244, i64 %42, i64 %and226), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor227 = xor i64 %42, %and226, !dbg !2227
    #dbg_value(i64 %xor227, !2104, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor227), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor245 = xor i64 %xor244, %xor227, !dbg !2228
    #dbg_value(i64 %xor245, !2074, !DIExpression(), !2014)
  %114 = shl i64 %xor245, 1, !dbg !2229
  %115 = lshr i64 %xor245, 63, !dbg !2229
  %116 = or i64 %114, %115, !dbg !2229
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor237, i64 %116), !2103, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %54, i64 %xor237, i64 %92, i64 %48, i64 %116), !2083, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %65, i64 %xor237, i64 %98, i64 %62, i64 %116), !2088, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %74, i64 %xor237, i64 %104, i64 %71, i64 %116), !2093, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %83, i64 %xor237, i64 %110, i64 %80, i64 %116), !2098, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor237, i64 %116), !2078, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor261 = xor i64 %xor237, %116, !dbg !2230
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor261), !2103, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %54, i64 %xor261, i64 %92, i64 %48), !2083, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %65, i64 %xor261, i64 %98, i64 %62), !2088, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %74, i64 %xor261, i64 %104, i64 %71), !2093, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %83, i64 %xor261, i64 %110, i64 %80), !2098, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 %xor261, !2078, !DIExpression(), !2014)
  %xor429 = xor i64 %xor224, %xor261, !dbg !2231
    #dbg_value(i64 %xor429, !2103, !DIExpression(), !2014)
  %117 = shl i64 %xor429, 2, !dbg !2232
  %118 = lshr i64 %xor429, 62, !dbg !2232
  %119 = or i64 %117, %118, !dbg !2232
    #dbg_value(i64 %119, !2076, !DIExpression(), !2014)
  %not123 = xor i64 %95, -1, !dbg !2233
    #dbg_value(!DIArgList(i64 %98, i64 %59, i64 %not123), !2090, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %92, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101, i64 %98, i64 %xor62, i64 %89, i64 %59, i64 %not123), !2075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
  %and124 = and i64 %59, %not123, !dbg !2234
    #dbg_value(!DIArgList(i64 %98, i64 %and124), !2090, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %92, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101, i64 %98, i64 %xor62, i64 %89, i64 %and124), !2075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor125 = xor i64 %98, %and124, !dbg !2235
    #dbg_value(i64 %xor125, !2090, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 %92, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101, i64 %xor125, i64 %xor62, i64 %89), !2075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
  %not91 = xor i64 %xor62, -1, !dbg !2236
    #dbg_value(!DIArgList(i64 %89, i64 %54, i64 %not91), !2086, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %89, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68, i64 %95, i64 %65, i64 %59, i64 %54, i64 %not91), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
  %and92 = and i64 %54, %not91, !dbg !2237
    #dbg_value(!DIArgList(i64 %89, i64 %and92), !2086, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %89, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68, i64 %95, i64 %65, i64 %59, i64 %and92), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor93 = xor i64 %89, %and92, !dbg !2238
    #dbg_value(i64 %xor93, !2086, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 %xor93, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68, i64 %95, i64 %65, i64 %59), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
  %not126 = xor i64 %59, -1, !dbg !2239
    #dbg_value(!DIArgList(i64 %95, i64 %65, i64 %not126), !2091, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor93, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68, i64 %95, i64 %65, i64 %not126), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
  %and127 = and i64 %65, %not126, !dbg !2240
    #dbg_value(!DIArgList(i64 %95, i64 %and127), !2091, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor93, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68, i64 %95, i64 %and127), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor128 = xor i64 %95, %and127, !dbg !2241
    #dbg_value(i64 %xor128, !2091, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 %xor93, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68, i64 %xor128), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor250 = xor i64 %xor93, %xor128, !dbg !2242
    #dbg_value(!DIArgList(i64 %xor250, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
  %not161 = xor i64 %68, -1, !dbg !2243
    #dbg_value(!DIArgList(i64 %101, i64 %74, i64 %not161), !2096, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor250, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %not161), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
  %and162 = and i64 %74, %not161, !dbg !2244
    #dbg_value(!DIArgList(i64 %101, i64 %and162), !2096, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor250, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %and162), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor163 = xor i64 %101, %and162, !dbg !2245
    #dbg_value(i64 %xor163, !2096, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 %xor250, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %xor163), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor251 = xor i64 %xor250, %xor163, !dbg !2246
    #dbg_value(!DIArgList(i64 %xor251, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
  %not196 = xor i64 %77, -1, !dbg !2247
    #dbg_value(!DIArgList(i64 %107, i64 %83, i64 %not196), !2101, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor251, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %not196), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
  %and197 = and i64 %83, %not196, !dbg !2248
    #dbg_value(!DIArgList(i64 %107, i64 %and197), !2101, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor251, i64 %113, i64 %30, i64 %86, i64 %107, i64 %and197), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor198 = xor i64 %107, %and197, !dbg !2249
    #dbg_value(i64 %xor198, !2101, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 %xor251, i64 %113, i64 %30, i64 %86, i64 %xor198), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor252 = xor i64 %xor251, %xor198, !dbg !2250
    #dbg_value(!DIArgList(i64 %xor252, i64 %113, i64 %30, i64 %86), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
  %not231 = xor i64 %86, -1, !dbg !2251
    #dbg_value(!DIArgList(i64 %113, i64 %30, i64 %not231), !2106, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor252, i64 %113, i64 %30, i64 %not231), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
  %and232 = and i64 %30, %not231, !dbg !2252
    #dbg_value(!DIArgList(i64 %113, i64 %and232), !2106, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor252, i64 %113, i64 %and232), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor233 = xor i64 %113, %and232, !dbg !2253
    #dbg_value(i64 %xor233, !2106, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor233), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor253 = xor i64 %xor252, %xor233, !dbg !2254
    #dbg_value(i64 %xor253, !2076, !DIExpression(), !2014)
  %120 = shl i64 %xor253, 1, !dbg !2255
  %121 = lshr i64 %xor253, 63, !dbg !2255
  %122 = or i64 %120, %121, !dbg !2255
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor245, i64 %122), !2090, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %92, i64 %xor245, i64 %xor62, i64 %89, i64 %122), !2085, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %104, i64 %xor245, i64 %68, i64 %101, i64 %122), !2095, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %110, i64 %xor245, i64 %77, i64 %107, i64 %122), !2100, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %36, i64 %xor245, i64 %86, i64 %113, i64 %122), !2105, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor245, i64 %122), !2080, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor269 = xor i64 %xor245, %122, !dbg !2256
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor269), !2090, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %92, i64 %xor269, i64 %xor62, i64 %89), !2085, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %104, i64 %xor269, i64 %68, i64 %101), !2095, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %110, i64 %xor269, i64 %77, i64 %107), !2100, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %36, i64 %xor269, i64 %86, i64 %113), !2105, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 %xor269, !2080, !DIExpression(), !2014)
  %xor417 = xor i64 %xor125, %xor269, !dbg !2257
    #dbg_value(i64 %xor417, !2090, !DIExpression(), !2014)
  %123 = shl i64 %xor417, 55, !dbg !2258
  %124 = lshr i64 %xor417, 9, !dbg !2258
  %125 = or i64 %123, %124, !dbg !2258
    #dbg_value(i64 %125, !2073, !DIExpression(), !2014)
  %not82 = xor i64 %48, -1, !dbg !2259
    #dbg_value(!DIArgList(i64 %54, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71, i64 %65, i64 %98, i64 %62, i64 %92, i64 %not82), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %54, i64 %xor261, i64 %92, i64 %not82), !2083, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %and83 = and i64 %92, %not82, !dbg !2260
    #dbg_value(!DIArgList(i64 %54, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71, i64 %65, i64 %98, i64 %62, i64 %and83), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %54, i64 %xor261, i64 %and83), !2083, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor84 = xor i64 %54, %and83, !dbg !2261
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71, i64 %65, i64 %98, i64 %62), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor261), !2083, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %not117 = xor i64 %62, -1, !dbg !2262
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71, i64 %65, i64 %98, i64 %not117), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %65, i64 %xor261, i64 %98, i64 %not117), !2088, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %and118 = and i64 %98, %not117, !dbg !2263
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71, i64 %65, i64 %and118), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %65, i64 %xor261, i64 %and118), !2088, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor119 = xor i64 %65, %and118, !dbg !2264
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71, i64 %xor119), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor119, i64 %xor261), !2088, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor238 = xor i64 %xor84, %xor119, !dbg !2265
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %not152 = xor i64 %71, -1, !dbg !2266
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %not152), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %74, i64 %xor261, i64 %104, i64 %not152), !2093, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %and153 = and i64 %104, %not152, !dbg !2267
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %and153), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %74, i64 %xor261, i64 %and153), !2093, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor154 = xor i64 %74, %and153, !dbg !2268
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %xor154), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor154, i64 %xor261), !2093, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor239 = xor i64 %xor238, %xor154, !dbg !2269
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %83, i64 %110, i64 %80), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %not187 = xor i64 %80, -1, !dbg !2270
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %83, i64 %110, i64 %not187), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %83, i64 %xor261, i64 %110, i64 %not187), !2098, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %and188 = and i64 %110, %not187, !dbg !2271
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %83, i64 %and188), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %83, i64 %xor261, i64 %and188), !2098, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor189 = xor i64 %83, %and188, !dbg !2272
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor189), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor189, i64 %xor261), !2098, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor240 = xor i64 %xor239, %xor189, !dbg !2273
    #dbg_value(!DIArgList(i64 %xor240, i64 %xor224), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor241 = xor i64 %xor240, %xor224, !dbg !2274
    #dbg_value(i64 %xor241, !2073, !DIExpression(), !2014)
  %not88 = xor i64 %89, -1, !dbg !2275
    #dbg_value(!DIArgList(i64 %92, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101, i64 %xor125, i64 %xor62, i64 %not88), !2075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %92, i64 %xor269, i64 %xor62, i64 %not88), !2085, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %and89 = and i64 %xor62, %not88, !dbg !2276
    #dbg_value(!DIArgList(i64 %92, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101, i64 %xor125, i64 %and89), !2075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %92, i64 %xor269, i64 %and89), !2085, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor90 = xor i64 %92, %and89, !dbg !2277
    #dbg_value(!DIArgList(i64 %xor90, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101, i64 %xor125), !2075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor90, i64 %xor269), !2085, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor246 = xor i64 %xor90, %xor125, !dbg !2278
    #dbg_value(!DIArgList(i64 %xor246, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101), !2075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
  %not158 = xor i64 %101, -1, !dbg !2279
    #dbg_value(!DIArgList(i64 %xor246, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %not158), !2075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %104, i64 %xor269, i64 %68, i64 %not158), !2095, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %and159 = and i64 %68, %not158, !dbg !2280
    #dbg_value(!DIArgList(i64 %xor246, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %and159), !2075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %104, i64 %xor269, i64 %and159), !2095, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor160 = xor i64 %104, %and159, !dbg !2281
    #dbg_value(!DIArgList(i64 %xor246, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %xor160), !2075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor160, i64 %xor269), !2095, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor247 = xor i64 %xor246, %xor160, !dbg !2282
    #dbg_value(!DIArgList(i64 %xor247, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107), !2075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
  %not193 = xor i64 %107, -1, !dbg !2283
    #dbg_value(!DIArgList(i64 %xor247, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %not193), !2075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %110, i64 %xor269, i64 %77, i64 %not193), !2100, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %and194 = and i64 %77, %not193, !dbg !2284
    #dbg_value(!DIArgList(i64 %xor247, i64 %36, i64 %86, i64 %113, i64 %110, i64 %and194), !2075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %110, i64 %xor269, i64 %and194), !2100, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor195 = xor i64 %110, %and194, !dbg !2285
    #dbg_value(!DIArgList(i64 %xor247, i64 %36, i64 %86, i64 %113, i64 %xor195), !2075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor195, i64 %xor269), !2100, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor248 = xor i64 %xor247, %xor195, !dbg !2286
    #dbg_value(!DIArgList(i64 %xor248, i64 %36, i64 %86, i64 %113), !2075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
  %not228 = xor i64 %113, -1, !dbg !2287
    #dbg_value(!DIArgList(i64 %xor248, i64 %36, i64 %86, i64 %not228), !2075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %36, i64 %xor269, i64 %86, i64 %not228), !2105, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %and229 = and i64 %86, %not228, !dbg !2288
    #dbg_value(!DIArgList(i64 %xor248, i64 %36, i64 %and229), !2075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %36, i64 %xor269, i64 %and229), !2105, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor230 = xor i64 %36, %and229, !dbg !2289
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor230), !2075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor230, i64 %xor269), !2105, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor249 = xor i64 %xor248, %xor230, !dbg !2290
    #dbg_value(i64 %xor249, !2075, !DIExpression(), !2014)
  %126 = shl i64 %xor249, 1, !dbg !2291
  %127 = lshr i64 %xor249, 63, !dbg !2291
  %128 = or i64 %126, %127, !dbg !2291
    #dbg_value(!DIArgList(i64 %xor241, i64 %128), !2079, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor241, i64 %128), !2084, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor241, i64 %128), !2099, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor241, i64 %128), !2089, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor241, i64 %128), !2104, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor241, i64 %128), !2094, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor265 = xor i64 %xor241, %128, !dbg !2292
    #dbg_value(i64 %xor265, !2079, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor265), !2084, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor265), !2099, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor265), !2089, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor265), !2104, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor265), !2094, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor413 = xor i64 %xor87, %xor265, !dbg !2293
    #dbg_value(i64 %xor413, !2084, !DIExpression(), !2014)
  %129 = shl i64 %xor413, 62, !dbg !2294
  %130 = lshr i64 %xor413, 2, !dbg !2294
  %131 = or i64 %129, %130, !dbg !2294
    #dbg_value(i64 %131, !2072, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 %119, i64 %125, i64 %131), !2064, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %not445 = xor i64 %131, -1, !dbg !2295
    #dbg_value(!DIArgList(i64 %119, i64 %125, i64 %not445), !2064, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %and446 = and i64 %125, %not445, !dbg !2296
    #dbg_value(!DIArgList(i64 %119, i64 %and446), !2064, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor447 = xor i64 %119, %and446, !dbg !2297
    #dbg_value(i64 %xor447, !2064, !DIExpression(), !2014)
  %132 = shl i64 %xor241, 1, !dbg !2298
  %133 = lshr i64 %xor241, 63, !dbg !2298
  %134 = or i64 %132, %133, !dbg !2298
    #dbg_value(!DIArgList(i64 %xor253, i64 %134), !2077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor253, i64 %134), !2087, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor253, i64 %134), !2102, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor253, i64 %134), !2092, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %134), !2082, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %134), !2072, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor253, i64 %134), !2097, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor257 = xor i64 %xor253, %134, !dbg !2299
    #dbg_value(i64 %xor257, !2077, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor257), !2087, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor257), !2102, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor257), !2092, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !2072, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !2082, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor257), !2097, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor425 = xor i64 %xor186, %xor257, !dbg !2300
    #dbg_value(i64 %xor425, !2097, !DIExpression(), !2014)
  %135 = shl i64 %xor425, 41, !dbg !2301
  %136 = lshr i64 %xor425, 23, !dbg !2301
  %137 = or i64 %135, %136, !dbg !2301
    #dbg_value(i64 %137, !2075, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 %137, i64 %131, i64 %119), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %not442 = xor i64 %119, -1, !dbg !2302
    #dbg_value(!DIArgList(i64 %137, i64 %131, i64 %not442), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %and443 = and i64 %131, %not442, !dbg !2303
    #dbg_value(!DIArgList(i64 %137, i64 %and443), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor444 = xor i64 %137, %and443, !dbg !2304
    #dbg_value(i64 %xor444, !2062, !DIExpression(), !2014)
  %138 = shl i64 %xor237, 1, !dbg !2305
  %139 = lshr i64 %xor237, 63, !dbg !2305
  %140 = or i64 %138, %139, !dbg !2305
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor249, i64 %140), !2086, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor249, i64 %140), !2101, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor249, i64 %140), !2091, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor249, i64 %140), !2106, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor249, i64 %140), !2081, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor249, i64 %140), !2096, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor273 = xor i64 %xor249, %140, !dbg !2306
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor273), !2086, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor273), !2101, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor273), !2091, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor273), !2106, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(i64 %xor273, !2081, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor273), !2096, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor421 = xor i64 %xor163, %xor273, !dbg !2307
    #dbg_value(i64 %xor421, !2096, !DIExpression(), !2014)
  %141 = shl i64 %xor421, 39, !dbg !2308
  %142 = lshr i64 %xor421, 25, !dbg !2308
  %143 = or i64 %141, %142, !dbg !2308
    #dbg_value(i64 %143, !2074, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 %143, i64 %119, i64 %137), !2060, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %125, i64 %137, i64 %143), !2058, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %131, i64 %143, i64 %125), !2056, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %not439 = xor i64 %137, -1, !dbg !2309
    #dbg_value(!DIArgList(i64 %143, i64 %119, i64 %not439), !2060, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %and440 = and i64 %119, %not439, !dbg !2310
    #dbg_value(!DIArgList(i64 %143, i64 %and440), !2060, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor441 = xor i64 %143, %and440, !dbg !2311
    #dbg_value(i64 %xor441, !2060, !DIExpression(), !2014)
  %not436 = xor i64 %143, -1, !dbg !2312
    #dbg_value(!DIArgList(i64 %125, i64 %137, i64 %not436), !2058, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %and437 = and i64 %137, %not436, !dbg !2313
    #dbg_value(!DIArgList(i64 %125, i64 %and437), !2058, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor438 = xor i64 %125, %and437, !dbg !2314
    #dbg_value(i64 %xor438, !2058, !DIExpression(), !2014)
  %not433 = xor i64 %125, -1, !dbg !2315
    #dbg_value(!DIArgList(i64 %131, i64 %143, i64 %not433), !2056, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %and434 = and i64 %143, %not433, !dbg !2316
    #dbg_value(!DIArgList(i64 %131, i64 %and434), !2056, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor435 = xor i64 %131, %and434, !dbg !2317
    #dbg_value(i64 %xor435, !2056, !DIExpression(), !2014)
  %xor394 = xor i64 %xor230, %xor269, !dbg !2318
    #dbg_value(i64 %xor394, !2105, !DIExpression(), !2014)
  %144 = shl i64 %xor394, 56, !dbg !2319
  %145 = lshr i64 %xor394, 8, !dbg !2319
  %146 = or i64 %144, %145, !dbg !2319
    #dbg_value(i64 %146, !2076, !DIExpression(), !2014)
  %xor382 = xor i64 %xor116, %xor257, !dbg !2320
    #dbg_value(i64 %xor382, !2087, !DIExpression(), !2014)
  %147 = shl i64 %xor382, 36, !dbg !2321
  %148 = lshr i64 %xor382, 28, !dbg !2321
  %149 = or i64 %147, %148, !dbg !2321
    #dbg_value(i64 %149, !2073, !DIExpression(), !2014)
  %xor378 = xor i64 %xor93, %xor273, !dbg !2322
    #dbg_value(i64 %xor378, !2086, !DIExpression(), !2014)
  %150 = shl i64 %xor378, 27, !dbg !2323
  %151 = lshr i64 %xor378, 37, !dbg !2323
  %152 = or i64 %150, %151, !dbg !2323
    #dbg_value(i64 %152, !2072, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 %146, i64 %149, i64 %152), !2054, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %not410 = xor i64 %152, -1, !dbg !2324
    #dbg_value(!DIArgList(i64 %146, i64 %149, i64 %not410), !2054, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %and411 = and i64 %149, %not410, !dbg !2325
    #dbg_value(!DIArgList(i64 %146, i64 %and411), !2054, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor412 = xor i64 %146, %and411, !dbg !2326
    #dbg_value(i64 %xor412, !2054, !DIExpression(), !2014)
  %xor390 = xor i64 %xor192, %xor265, !dbg !2327
    #dbg_value(i64 %xor390, !2099, !DIExpression(), !2014)
  %153 = shl i64 %xor390, 15, !dbg !2328
  %154 = lshr i64 %xor390, 49, !dbg !2328
  %155 = or i64 %153, %154, !dbg !2328
    #dbg_value(i64 %155, !2075, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 %155, i64 %152, i64 %146), !2052, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %not407 = xor i64 %146, -1, !dbg !2329
    #dbg_value(!DIArgList(i64 %155, i64 %152, i64 %not407), !2052, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %and408 = and i64 %152, %not407, !dbg !2330
    #dbg_value(!DIArgList(i64 %155, i64 %and408), !2052, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor409 = xor i64 %155, %and408, !dbg !2331
    #dbg_value(i64 %xor409, !2052, !DIExpression(), !2014)
  %xor386 = xor i64 %xor154, %xor261, !dbg !2332
    #dbg_value(i64 %xor386, !2093, !DIExpression(), !2014)
  %156 = shl i64 %xor386, 10, !dbg !2333
  %157 = lshr i64 %xor386, 54, !dbg !2333
  %158 = or i64 %156, %157, !dbg !2333
    #dbg_value(i64 %158, !2074, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 %158, i64 %146, i64 %155), !2050, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %149, i64 %155, i64 %158), !2048, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %152, i64 %158, i64 %149), !2046, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %not404 = xor i64 %155, -1, !dbg !2334
    #dbg_value(!DIArgList(i64 %158, i64 %146, i64 %not404), !2050, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %and405 = and i64 %146, %not404, !dbg !2335
    #dbg_value(!DIArgList(i64 %158, i64 %and405), !2050, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor406 = xor i64 %158, %and405, !dbg !2336
    #dbg_value(i64 %xor406, !2050, !DIExpression(), !2014)
  %not401 = xor i64 %158, -1, !dbg !2337
    #dbg_value(!DIArgList(i64 %149, i64 %155, i64 %not401), !2048, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %and402 = and i64 %155, %not401, !dbg !2338
    #dbg_value(!DIArgList(i64 %149, i64 %and402), !2048, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor403 = xor i64 %149, %and402, !dbg !2339
    #dbg_value(i64 %xor403, !2048, !DIExpression(), !2014)
  %not398 = xor i64 %149, -1, !dbg !2340
    #dbg_value(!DIArgList(i64 %152, i64 %158, i64 %not398), !2046, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %and399 = and i64 %158, %not398, !dbg !2341
    #dbg_value(!DIArgList(i64 %152, i64 %and399), !2046, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor400 = xor i64 %152, %and399, !dbg !2342
    #dbg_value(i64 %xor400, !2046, !DIExpression(), !2014)
  %xor359 = xor i64 %xor221, %xor257, !dbg !2343
    #dbg_value(i64 %xor359, !2102, !DIExpression(), !2014)
  %159 = shl i64 %xor359, 18, !dbg !2344
  %160 = lshr i64 %xor359, 46, !dbg !2344
  %161 = or i64 %159, %160, !dbg !2344
    #dbg_value(i64 %161, !2076, !DIExpression(), !2014)
  %xor347 = xor i64 %xor122, %xor265, !dbg !2345
    #dbg_value(i64 %xor347, !2089, !DIExpression(), !2014)
  %162 = shl i64 %xor347, 6, !dbg !2346
  %163 = lshr i64 %xor347, 58, !dbg !2346
  %164 = or i64 %162, %163, !dbg !2346
    #dbg_value(i64 %164, !2073, !DIExpression(), !2014)
  %xor343 = xor i64 %xor84, %xor261, !dbg !2347
    #dbg_value(i64 %xor343, !2083, !DIExpression(), !2014)
  %165 = shl i64 %xor343, 1, !dbg !2348
  %166 = lshr i64 %xor343, 63, !dbg !2348
  %167 = or i64 %165, %166, !dbg !2348
    #dbg_value(i64 %167, !2072, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 %161, i64 %164, i64 %167), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %not375 = xor i64 %167, -1, !dbg !2349
    #dbg_value(!DIArgList(i64 %161, i64 %164, i64 %not375), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %and376 = and i64 %164, %not375, !dbg !2350
    #dbg_value(!DIArgList(i64 %161, i64 %and376), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor377 = xor i64 %161, %and376, !dbg !2351
    #dbg_value(i64 %xor377, !2044, !DIExpression(), !2014)
  %xor355 = xor i64 %xor198, %xor273, !dbg !2352
    #dbg_value(i64 %xor355, !2101, !DIExpression(), !2014)
  %168 = shl i64 %xor355, 8, !dbg !2353
  %169 = lshr i64 %xor355, 56, !dbg !2353
  %170 = or i64 %168, %169, !dbg !2353
    #dbg_value(i64 %170, !2075, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 %170, i64 %167, i64 %161), !2042, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %not372 = xor i64 %161, -1, !dbg !2354
    #dbg_value(!DIArgList(i64 %170, i64 %167, i64 %not372), !2042, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %and373 = and i64 %167, %not372, !dbg !2355
    #dbg_value(!DIArgList(i64 %170, i64 %and373), !2042, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor374 = xor i64 %170, %and373, !dbg !2356
    #dbg_value(i64 %xor374, !2042, !DIExpression(), !2014)
  %xor351 = xor i64 %xor160, %xor269, !dbg !2357
    #dbg_value(i64 %xor351, !2095, !DIExpression(), !2014)
  %171 = shl i64 %xor351, 25, !dbg !2358
  %172 = lshr i64 %xor351, 39, !dbg !2358
  %173 = or i64 %171, %172, !dbg !2358
    #dbg_value(i64 %173, !2074, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 %173, i64 %161, i64 %170), !2040, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %164, i64 %170, i64 %173), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %167, i64 %173, i64 %164), !2036, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %not369 = xor i64 %170, -1, !dbg !2359
    #dbg_value(!DIArgList(i64 %173, i64 %161, i64 %not369), !2040, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %and370 = and i64 %161, %not369, !dbg !2360
    #dbg_value(!DIArgList(i64 %173, i64 %and370), !2040, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor371 = xor i64 %173, %and370, !dbg !2361
    #dbg_value(i64 %xor371, !2040, !DIExpression(), !2014)
  %not366 = xor i64 %173, -1, !dbg !2362
    #dbg_value(!DIArgList(i64 %164, i64 %170, i64 %not366), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %and367 = and i64 %170, %not366, !dbg !2363
    #dbg_value(!DIArgList(i64 %164, i64 %and367), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor368 = xor i64 %164, %and367, !dbg !2364
    #dbg_value(i64 %xor368, !2038, !DIExpression(), !2014)
  %not363 = xor i64 %164, -1, !dbg !2365
    #dbg_value(!DIArgList(i64 %167, i64 %173, i64 %not363), !2036, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %and364 = and i64 %173, %not363, !dbg !2366
    #dbg_value(!DIArgList(i64 %167, i64 %and364), !2036, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor365 = xor i64 %167, %and364, !dbg !2367
    #dbg_value(i64 %xor365, !2036, !DIExpression(), !2014)
  %xor324 = xor i64 %xor227, %xor265, !dbg !2368
    #dbg_value(i64 %xor324, !2104, !DIExpression(), !2014)
  %174 = shl i64 %xor324, 61, !dbg !2369
  %175 = lshr i64 %xor324, 3, !dbg !2369
  %176 = or i64 %174, %175, !dbg !2369
    #dbg_value(i64 %176, !2076, !DIExpression(), !2014)
  %xor312 = xor i64 %xor128, %xor273, !dbg !2370
    #dbg_value(i64 %xor312, !2091, !DIExpression(), !2014)
  %177 = shl i64 %xor312, 20, !dbg !2371
  %178 = lshr i64 %xor312, 44, !dbg !2371
  %179 = or i64 %177, %178, !dbg !2371
    #dbg_value(i64 %179, !2073, !DIExpression(), !2014)
  %xor308 = xor i64 %xor90, %xor269, !dbg !2372
    #dbg_value(i64 %xor308, !2085, !DIExpression(), !2014)
  %180 = shl i64 %xor308, 28, !dbg !2373
  %181 = lshr i64 %xor308, 36, !dbg !2373
  %182 = or i64 %180, %181, !dbg !2373
    #dbg_value(i64 %182, !2072, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 %176, i64 %179, i64 %182), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %not340 = xor i64 %182, -1, !dbg !2374
    #dbg_value(!DIArgList(i64 %176, i64 %179, i64 %not340), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %and341 = and i64 %179, %not340, !dbg !2375
    #dbg_value(!DIArgList(i64 %176, i64 %and341), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor342 = xor i64 %176, %and341, !dbg !2376
    #dbg_value(i64 %xor342, !2034, !DIExpression(), !2014)
  %xor320 = xor i64 %xor189, %xor261, !dbg !2377
    #dbg_value(i64 %xor320, !2098, !DIExpression(), !2014)
  %183 = shl i64 %xor320, 45, !dbg !2378
  %184 = lshr i64 %xor320, 19, !dbg !2378
  %185 = or i64 %183, %184, !dbg !2378
    #dbg_value(i64 %185, !2075, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 %185, i64 %182, i64 %176), !2032, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %not337 = xor i64 %176, -1, !dbg !2379
    #dbg_value(!DIArgList(i64 %185, i64 %182, i64 %not337), !2032, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %and338 = and i64 %182, %not337, !dbg !2380
    #dbg_value(!DIArgList(i64 %185, i64 %and338), !2032, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor339 = xor i64 %185, %and338, !dbg !2381
    #dbg_value(i64 %xor339, !2032, !DIExpression(), !2014)
  %xor316 = xor i64 %xor151, %xor257, !dbg !2382
    #dbg_value(i64 %xor316, !2092, !DIExpression(), !2014)
  %186 = shl i64 %xor316, 3, !dbg !2383
  %187 = lshr i64 %xor316, 61, !dbg !2383
  %188 = or i64 %186, %187, !dbg !2383
    #dbg_value(i64 %188, !2074, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 %188, i64 %176, i64 %185), !2030, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %179, i64 %185, i64 %188), !2028, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %182, i64 %188, i64 %179), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %not334 = xor i64 %185, -1, !dbg !2384
    #dbg_value(!DIArgList(i64 %188, i64 %176, i64 %not334), !2030, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %and335 = and i64 %176, %not334, !dbg !2385
    #dbg_value(!DIArgList(i64 %188, i64 %and335), !2030, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor336 = xor i64 %188, %and335, !dbg !2386
    #dbg_value(i64 %xor336, !2030, !DIExpression(), !2014)
  %not331 = xor i64 %188, -1, !dbg !2387
    #dbg_value(!DIArgList(i64 %179, i64 %185, i64 %not331), !2028, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %and332 = and i64 %185, %not331, !dbg !2388
    #dbg_value(!DIArgList(i64 %179, i64 %and332), !2028, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor333 = xor i64 %179, %and332, !dbg !2389
    #dbg_value(i64 %xor333, !2028, !DIExpression(), !2014)
  %not328 = xor i64 %179, -1, !dbg !2390
    #dbg_value(!DIArgList(i64 %182, i64 %188, i64 %not328), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %and329 = and i64 %188, %not328, !dbg !2391
    #dbg_value(!DIArgList(i64 %182, i64 %and329), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor330 = xor i64 %182, %and329, !dbg !2392
    #dbg_value(i64 %xor330, !2026, !DIExpression(), !2014)
  %xor287 = xor i64 %xor233, %xor273, !dbg !2393
    #dbg_value(i64 %xor287, !2106, !DIExpression(), !2014)
  %189 = shl i64 %xor287, 14, !dbg !2394
  %190 = lshr i64 %xor287, 50, !dbg !2394
  %191 = or i64 %189, %190, !dbg !2394
    #dbg_value(i64 %191, !2076, !DIExpression(), !2014)
  %xor275 = xor i64 %xor119, %xor261, !dbg !2395
    #dbg_value(i64 %xor275, !2088, !DIExpression(), !2014)
  %192 = shl i64 %xor275, 44, !dbg !2396
  %193 = lshr i64 %xor275, 20, !dbg !2396
  %194 = or i64 %192, %193, !dbg !2396
    #dbg_value(i64 %194, !2073, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 %191, i64 %194, i64 %xor81, i64 %xor257), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor274 = xor i64 %xor81, %xor257, !dbg !2397
    #dbg_value(i64 %xor274, !2082, !DIExpression(), !2014)
    #dbg_value(i64 %xor274, !2072, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 %191, i64 %194, i64 %xor274), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %not305 = xor i64 %xor274, -1, !dbg !2398
    #dbg_value(!DIArgList(i64 %191, i64 %194, i64 %not305), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %and306 = and i64 %194, %not305, !dbg !2399
    #dbg_value(!DIArgList(i64 %191, i64 %and306), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor307 = xor i64 %191, %and306, !dbg !2400
    #dbg_value(i64 %xor307, !2024, !DIExpression(), !2014)
  %xor283 = xor i64 %xor195, %xor269, !dbg !2401
    #dbg_value(i64 %xor283, !2100, !DIExpression(), !2014)
  %195 = shl i64 %xor283, 21, !dbg !2402
  %196 = lshr i64 %xor283, 43, !dbg !2402
  %197 = or i64 %195, %196, !dbg !2402
    #dbg_value(i64 %197, !2075, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 %197, i64 %xor274, i64 %191), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %not302 = xor i64 %191, -1, !dbg !2403
    #dbg_value(!DIArgList(i64 %197, i64 %xor274, i64 %not302), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %and303 = and i64 %xor274, %not302, !dbg !2404
    #dbg_value(!DIArgList(i64 %197, i64 %and303), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor304 = xor i64 %197, %and303, !dbg !2405
    #dbg_value(i64 %xor304, !2022, !DIExpression(), !2014)
  %xor279 = xor i64 %xor157, %xor265, !dbg !2406
    #dbg_value(i64 %xor279, !2094, !DIExpression(), !2014)
  %198 = shl i64 %xor279, 43, !dbg !2407
  %199 = lshr i64 %xor279, 21, !dbg !2407
  %200 = or i64 %198, %199, !dbg !2407
    #dbg_value(i64 %200, !2074, !DIExpression(), !2014)
    #dbg_value(!DIArgList(i64 %200, i64 %191, i64 %197), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %194, i64 %197, i64 %200), !2018, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
    #dbg_value(!DIArgList(i64 %xor274, i64 %200, i64 %194), !2016, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %not299 = xor i64 %197, -1, !dbg !2408
    #dbg_value(!DIArgList(i64 %200, i64 %191, i64 %not299), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %and300 = and i64 %191, %not299, !dbg !2409
    #dbg_value(!DIArgList(i64 %200, i64 %and300), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor301 = xor i64 %200, %and300, !dbg !2410
    #dbg_value(i64 %xor301, !2020, !DIExpression(), !2014)
  %not296 = xor i64 %200, -1, !dbg !2411
    #dbg_value(!DIArgList(i64 %194, i64 %197, i64 %not296), !2018, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2014)
  %and297 = and i64 %197, %not296, !dbg !2412
    #dbg_value(!DIArgList(i64 %194, i64 %and297), !2018, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %xor298 = xor i64 %194, %and297, !dbg !2413
    #dbg_value(i64 %xor298, !2018, !DIExpression(), !2014)
  %add = or disjoint i32 %round.0, 1, !dbg !2414
  %arrayidx294 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %add, !dbg !2415
  %201 = load i64, ptr %arrayidx294, align 8, !dbg !2415
    #dbg_value(!DIArgList(i64 %xor274, i64 %201, i64 %200, i64 %194), !2016, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %not291 = xor i64 %194, -1, !dbg !2416
    #dbg_value(!DIArgList(i64 %xor274, i64 %201, i64 %200, i64 %not291), !2016, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %and292 = and i64 %200, %not291, !dbg !2417
    #dbg_value(!DIArgList(i64 %xor274, i64 %201, i64 %and292), !2016, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2014)
  %202 = xor i64 %and292, %201, !dbg !2418
  %xor295 = xor i64 %202, %xor274, !dbg !2418
    #dbg_value(i64 %xor295, !2016, !DIExpression(), !2014)
  %add448 = add nuw nsw i32 %round.0, 2, !dbg !2419
    #dbg_value(i32 %add448, !2065, !DIExpression(), !2014)
  br label %for.cond, !dbg !2420, !llvm.loop !2421

for.end:                                          ; preds = %for.cond
  %Aso.0.lcssa = phi i64 [ %Aso.0, %for.cond ], !dbg !2014
  %Asi.0.lcssa = phi i64 [ %Asi.0, %for.cond ], !dbg !2014
  %Ase.0.lcssa = phi i64 [ %Ase.0, %for.cond ], !dbg !2014
  %Asa.0.lcssa = phi i64 [ %Asa.0, %for.cond ], !dbg !2014
  %Amu.0.lcssa = phi i64 [ %Amu.0, %for.cond ], !dbg !2014
  %Amo.0.lcssa = phi i64 [ %Amo.0, %for.cond ], !dbg !2014
  %Ami.0.lcssa = phi i64 [ %Ami.0, %for.cond ], !dbg !2014
  %Ame.0.lcssa = phi i64 [ %Ame.0, %for.cond ], !dbg !2014
  %Ama.0.lcssa = phi i64 [ %Ama.0, %for.cond ], !dbg !2014
  %Aku.0.lcssa = phi i64 [ %Aku.0, %for.cond ], !dbg !2014
  %Ako.0.lcssa = phi i64 [ %Ako.0, %for.cond ], !dbg !2014
  %Aki.0.lcssa = phi i64 [ %Aki.0, %for.cond ], !dbg !2014
  %Ake.0.lcssa = phi i64 [ %Ake.0, %for.cond ], !dbg !2014
  %Aka.0.lcssa = phi i64 [ %Aka.0, %for.cond ], !dbg !2014
  %Agu.0.lcssa = phi i64 [ %Agu.0, %for.cond ], !dbg !2014
  %Ago.0.lcssa = phi i64 [ %Ago.0, %for.cond ], !dbg !2014
  %Agi.0.lcssa = phi i64 [ %Agi.0, %for.cond ], !dbg !2014
  %Age.0.lcssa = phi i64 [ %Age.0, %for.cond ], !dbg !2014
  %Aga.0.lcssa = phi i64 [ %Aga.0, %for.cond ], !dbg !2014
  %Abu.0.lcssa = phi i64 [ %Abu.0, %for.cond ], !dbg !2014
  %Abo.0.lcssa = phi i64 [ %Abo.0, %for.cond ], !dbg !2014
  %Abi.0.lcssa = phi i64 [ %Abi.0, %for.cond ], !dbg !2014
  %Abe.0.lcssa = phi i64 [ %Abe.0, %for.cond ], !dbg !2014
  %Aba.0.lcssa = phi i64 [ %Aba.0, %for.cond ], !dbg !2014
  %Asu.0.lcssa = phi i64 [ %Asu.0, %for.cond ], !dbg !2014
  store i64 %Aba.0.lcssa, ptr %state, align 8, !dbg !2423
  %arrayidx450 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !2424
  store i64 %Abe.0.lcssa, ptr %arrayidx450, align 8, !dbg !2425
  %arrayidx451 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !2426
  store i64 %Abi.0.lcssa, ptr %arrayidx451, align 8, !dbg !2427
  %arrayidx452 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !2428
  store i64 %Abo.0.lcssa, ptr %arrayidx452, align 8, !dbg !2429
  %arrayidx453 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !2430
  store i64 %Abu.0.lcssa, ptr %arrayidx453, align 8, !dbg !2431
  %arrayidx454 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !2432
  store i64 %Aga.0.lcssa, ptr %arrayidx454, align 8, !dbg !2433
  %arrayidx455 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !2434
  store i64 %Age.0.lcssa, ptr %arrayidx455, align 8, !dbg !2435
  %arrayidx456 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !2436
  store i64 %Agi.0.lcssa, ptr %arrayidx456, align 8, !dbg !2437
  %arrayidx457 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !2438
  store i64 %Ago.0.lcssa, ptr %arrayidx457, align 8, !dbg !2439
  %arrayidx458 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !2440
  store i64 %Agu.0.lcssa, ptr %arrayidx458, align 8, !dbg !2441
  %arrayidx459 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !2442
  store i64 %Aka.0.lcssa, ptr %arrayidx459, align 8, !dbg !2443
  %arrayidx460 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !2444
  store i64 %Ake.0.lcssa, ptr %arrayidx460, align 8, !dbg !2445
  %arrayidx461 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !2446
  store i64 %Aki.0.lcssa, ptr %arrayidx461, align 8, !dbg !2447
  %arrayidx462 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !2448
  store i64 %Ako.0.lcssa, ptr %arrayidx462, align 8, !dbg !2449
  %arrayidx463 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !2450
  store i64 %Aku.0.lcssa, ptr %arrayidx463, align 8, !dbg !2451
  %arrayidx464 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !2452
  store i64 %Ama.0.lcssa, ptr %arrayidx464, align 8, !dbg !2453
  %arrayidx465 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !2454
  store i64 %Ame.0.lcssa, ptr %arrayidx465, align 8, !dbg !2455
  %arrayidx466 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !2456
  store i64 %Ami.0.lcssa, ptr %arrayidx466, align 8, !dbg !2457
  %arrayidx467 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !2458
  store i64 %Amo.0.lcssa, ptr %arrayidx467, align 8, !dbg !2459
  %arrayidx468 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !2460
  store i64 %Amu.0.lcssa, ptr %arrayidx468, align 8, !dbg !2461
  %arrayidx469 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !2462
  store i64 %Asa.0.lcssa, ptr %arrayidx469, align 8, !dbg !2463
  %arrayidx470 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !2464
  store i64 %Ase.0.lcssa, ptr %arrayidx470, align 8, !dbg !2465
  %arrayidx471 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !2466
  store i64 %Asi.0.lcssa, ptr %arrayidx471, align 8, !dbg !2467
  %arrayidx472 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !2468
  store i64 %Aso.0.lcssa, ptr %arrayidx472, align 8, !dbg !2469
  %arrayidx473 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !2470
  store i64 %Asu.0.lcssa, ptr %arrayidx473, align 8, !dbg !2471
  ret void, !dbg !2472
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_finalize(ptr noundef %state) local_unnamed_addr #0 !dbg !2473 {
entry:
    #dbg_value(ptr %state, !2474, !DIExpression(), !2475)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2476
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2476
  %conv = trunc i64 %0 to i32, !dbg !2476
  call fastcc void @keccak_finalize(ptr noundef %state, i32 noundef %conv, i32 noundef 168, i8 noundef zeroext 31) #3, !dbg !2477
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2478
  store i64 168, ptr %arrayidx1, align 8, !dbg !2479
  ret void, !dbg !2480
}

; Function Attrs: nounwind
define internal fastcc void @keccak_finalize(ptr noundef %s, i32 noundef %pos, i32 noundef range(i32 136, 169) %r, i8 noundef zeroext %p) unnamed_addr #0 !dbg !2481 {
entry:
    #dbg_value(ptr %s, !2484, !DIExpression(), !2485)
    #dbg_value(i32 %pos, !2486, !DIExpression(), !2485)
    #dbg_value(i32 %r, !2487, !DIExpression(), !2485)
    #dbg_value(i8 31, !2488, !DIExpression(), !2485)
  %rem = shl i32 %pos, 3, !dbg !2489
  %mul = and i32 %rem, 56, !dbg !2489
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2490
  %shl = shl nuw nsw i64 31, %sh_prom, !dbg !2490
  %div2 = lshr i32 %pos, 3, !dbg !2491
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div2, !dbg !2492
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2493
  %xor = xor i64 %0, %shl, !dbg !2493
  store i64 %xor, ptr %arrayidx, align 8, !dbg !2493
  %div13 = lshr i32 %r, 3, !dbg !2494
  %1 = getelementptr i64, ptr %s, i32 %div13, !dbg !2495
  %arrayidx2 = getelementptr i8, ptr %1, i32 -8, !dbg !2495
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !2496
  %xor3 = xor i64 %2, -9223372036854775808, !dbg !2496
  store i64 %xor3, ptr %arrayidx2, align 8, !dbg !2496
  ret void, !dbg !2497
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) local_unnamed_addr #0 !dbg !2498 {
entry:
    #dbg_value(ptr %out, !2501, !DIExpression(), !2502)
    #dbg_value(i32 %outlen, !2503, !DIExpression(), !2502)
    #dbg_value(ptr %state, !2504, !DIExpression(), !2502)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2505
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2505
  %conv = trunc i64 %0 to i32, !dbg !2505
  %call = call fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state, i32 noundef %conv, i32 noundef 168) #3, !dbg !2506
  %conv1 = zext i32 %call to i64, !dbg !2506
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2507
  store i64 %conv1, ptr %arrayidx2, align 8, !dbg !2508
  ret void, !dbg !2509
}

; Function Attrs: nounwind
define internal fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %s, i32 noundef %pos, i32 noundef range(i32 136, 169) %r) unnamed_addr #0 !dbg !2510 {
entry:
    #dbg_value(ptr %out, !2513, !DIExpression(), !2514)
    #dbg_value(i32 %outlen, !2515, !DIExpression(), !2514)
    #dbg_value(ptr %s, !2516, !DIExpression(), !2514)
    #dbg_value(i32 %pos, !2517, !DIExpression(), !2514)
    #dbg_value(i32 %r, !2518, !DIExpression(), !2514)
  br label %while.cond, !dbg !2519

while.cond:                                       ; preds = %for.end, %entry
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ %i.0.lcssa, %for.end ]
  %outlen.addr.0 = phi i32 [ %outlen, %entry ], [ %sub3, %for.end ]
  %out.addr.0 = phi ptr [ %out, %entry ], [ %out.addr.1.lcssa, %for.end ]
    #dbg_value(ptr %out.addr.0, !2513, !DIExpression(), !2514)
    #dbg_value(i32 %outlen.addr.0, !2515, !DIExpression(), !2514)
    #dbg_value(i32 %pos.addr.0, !2517, !DIExpression(), !2514)
  %tobool.not = icmp eq i32 %outlen.addr.0, 0, !dbg !2519
  br i1 %tobool.not, label %while.end, label %while.body, !dbg !2519

while.body:                                       ; preds = %while.cond
  %cmp = icmp eq i32 %pos.addr.0, %r, !dbg !2520
  br i1 %cmp, label %if.then, label %if.end, !dbg !2520

if.then:                                          ; preds = %while.body
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2523
    #dbg_value(i32 0, !2517, !DIExpression(), !2514)
  br label %if.end, !dbg !2525

if.end:                                           ; preds = %if.then, %while.body
  %pos.addr.1 = phi i32 [ 0, %if.then ], [ %pos.addr.0, %while.body ]
    #dbg_value(i32 %pos.addr.1, !2517, !DIExpression(), !2514)
    #dbg_value(i32 %pos.addr.1, !2526, !DIExpression(), !2514)
  br label %for.cond, !dbg !2527

for.cond:                                         ; preds = %for.body, %if.end
  %i.0 = phi i32 [ %pos.addr.1, %if.end ], [ %inc, %for.body ], !dbg !2529
  %out.addr.1 = phi ptr [ %out.addr.0, %if.end ], [ %incdec.ptr, %for.body ]
    #dbg_value(ptr %out.addr.1, !2513, !DIExpression(), !2514)
    #dbg_value(i32 %i.0, !2526, !DIExpression(), !2514)
  %cmp1 = icmp ult i32 %i.0, %r, !dbg !2530
  %add = add i32 %pos.addr.1, %outlen.addr.0, !dbg !2532
  %cmp2 = icmp ult i32 %i.0, %add, !dbg !2532
  %0 = and i1 %cmp1, %cmp2, !dbg !2532
  br i1 %0, label %for.body, label %for.end, !dbg !2533

for.body:                                         ; preds = %for.cond
  %div1 = lshr i32 %i.0, 3, !dbg !2534
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div1, !dbg !2535
  %1 = load i64, ptr %arrayidx, align 8, !dbg !2535
  %rem = shl nuw nsw i32 %i.0, 3, !dbg !2536
  %mul = and i32 %rem, 56, !dbg !2536
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2537
  %shr = lshr i64 %1, %sh_prom, !dbg !2537
  %conv = trunc i64 %shr to i8, !dbg !2535
    #dbg_value(ptr %out.addr.1, !2513, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2514)
  store i8 %conv, ptr %out.addr.1, align 1, !dbg !2538
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %out.addr.1, i32 1, !dbg !2539
    #dbg_value(ptr %incdec.ptr, !2513, !DIExpression(), !2514)
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2540
    #dbg_value(i32 %inc, !2526, !DIExpression(), !2514)
  br label %for.cond, !dbg !2541, !llvm.loop !2542

for.end:                                          ; preds = %for.cond
  %i.0.lcssa = phi i32 [ %i.0, %for.cond ], !dbg !2529
  %out.addr.1.lcssa = phi ptr [ %out.addr.1, %for.cond ]
  %sub.neg = sub i32 %pos.addr.1, %i.0.lcssa, !dbg !2544
  %sub3 = add i32 %sub.neg, %outlen.addr.0, !dbg !2545
    #dbg_value(i32 %sub3, !2515, !DIExpression(), !2514)
    #dbg_value(i32 %i.0.lcssa, !2517, !DIExpression(), !2514)
  br label %while.cond, !dbg !2519, !llvm.loop !2546

while.end:                                        ; preds = %while.cond
  %pos.addr.0.lcssa = phi i32 [ %pos.addr.0, %while.cond ]
  ret i32 %pos.addr.0.lcssa, !dbg !2548
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2549 {
entry:
    #dbg_value(ptr %state, !2550, !DIExpression(), !2551)
    #dbg_value(ptr %in, !2552, !DIExpression(), !2551)
    #dbg_value(i32 %inlen, !2553, !DIExpression(), !2551)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 168, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #3, !dbg !2554
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2555
  store i64 168, ptr %arrayidx, align 8, !dbg !2556
  ret void, !dbg !2557
}

; Function Attrs: nounwind
define internal fastcc void @keccak_absorb_once(ptr noundef %s, i32 noundef range(i32 72, 169) %r, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext range(i8 6, 32) %p) unnamed_addr #0 !dbg !2558 {
entry:
    #dbg_value(ptr %s, !2561, !DIExpression(), !2562)
    #dbg_value(i32 %r, !2563, !DIExpression(), !2562)
    #dbg_value(ptr %in, !2564, !DIExpression(), !2562)
    #dbg_value(i32 %inlen, !2565, !DIExpression(), !2562)
    #dbg_value(i8 %p, !2566, !DIExpression(), !2562)
    #dbg_value(i32 0, !2567, !DIExpression(), !2562)
  br label %for.cond, !dbg !2568

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2570
    #dbg_value(i32 %i.0, !2567, !DIExpression(), !2562)
  %exitcond = icmp ne i32 %i.0, 25, !dbg !2571
  br i1 %exitcond, label %for.body, label %while.cond.preheader, !dbg !2573

while.cond.preheader:                             ; preds = %for.cond
  %0 = lshr i32 %r, 3, !dbg !2574
  br label %while.cond, !dbg !2574

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !2575
  store i64 0, ptr %arrayidx, align 8, !dbg !2576
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2577
    #dbg_value(i32 %inc, !2567, !DIExpression(), !2562)
  br label %for.cond, !dbg !2578, !llvm.loop !2579

while.cond:                                       ; preds = %while.cond.preheader, %for.end8
  %in.addr.0 = phi ptr [ %add.ptr9, %for.end8 ], [ %in, %while.cond.preheader ]
  %inlen.addr.0 = phi i32 [ %sub, %for.end8 ], [ %inlen, %while.cond.preheader ]
    #dbg_value(i32 %inlen.addr.0, !2565, !DIExpression(), !2562)
    #dbg_value(ptr %in.addr.0, !2564, !DIExpression(), !2562)
  %cmp1.not = icmp ult i32 %inlen.addr.0, %r, !dbg !2581
  br i1 %cmp1.not, label %for.cond10.preheader, label %for.cond2.preheader, !dbg !2574

for.cond2.preheader:                              ; preds = %while.cond
  br label %for.cond2, !dbg !2582

for.cond10.preheader:                             ; preds = %while.cond
  %inlen.addr.0.lcssa6 = phi i32 [ %inlen.addr.0, %while.cond ]
  %in.addr.0.lcssa = phi ptr [ %in.addr.0, %while.cond ]
  br label %for.cond10, !dbg !2585

for.cond2:                                        ; preds = %for.cond2.preheader, %for.body4
  %i.1 = phi i32 [ %inc7, %for.body4 ], [ 0, %for.cond2.preheader ], !dbg !2587
    #dbg_value(i32 %i.1, !2567, !DIExpression(), !2562)
  %exitcond5 = icmp ne i32 %i.1, %0, !dbg !2588
  br i1 %exitcond5, label %for.body4, label %for.end8, !dbg !2582

for.body4:                                        ; preds = %for.cond2
  %mul = shl nuw nsw i32 %i.1, 3, !dbg !2590
  %add.ptr = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %mul, !dbg !2591
  %call = call fastcc i64 @load64(ptr noundef %add.ptr) #3, !dbg !2592
  %arrayidx5 = getelementptr inbounds nuw i64, ptr %s, i32 %i.1, !dbg !2593
  %1 = load i64, ptr %arrayidx5, align 8, !dbg !2594
  %xor = xor i64 %1, %call, !dbg !2594
  store i64 %xor, ptr %arrayidx5, align 8, !dbg !2594
  %inc7 = add nuw nsw i32 %i.1, 1, !dbg !2595
    #dbg_value(i32 %inc7, !2567, !DIExpression(), !2562)
  br label %for.cond2, !dbg !2596, !llvm.loop !2597

for.end8:                                         ; preds = %for.cond2
  %add.ptr9 = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %r, !dbg !2599
    #dbg_value(ptr %add.ptr9, !2564, !DIExpression(), !2562)
  %sub = sub i32 %inlen.addr.0, %r, !dbg !2600
    #dbg_value(i32 %sub, !2565, !DIExpression(), !2562)
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2601
  br label %while.cond, !dbg !2574, !llvm.loop !2602

for.cond10:                                       ; preds = %for.cond10.preheader, %for.body12
  %i.2 = phi i32 [ %inc19, %for.body12 ], [ 0, %for.cond10.preheader ], !dbg !2604
    #dbg_value(i32 %i.2, !2567, !DIExpression(), !2562)
  %exitcond7 = icmp ne i32 %i.2, %inlen.addr.0.lcssa6, !dbg !2605
  br i1 %exitcond7, label %for.body12, label %for.end20, !dbg !2585

for.body12:                                       ; preds = %for.cond10
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %in.addr.0.lcssa, i32 %i.2, !dbg !2607
  %2 = load i8, ptr %arrayidx13, align 1, !dbg !2607
  %conv = zext i8 %2 to i64, !dbg !2608
  %rem = shl i32 %i.2, 3, !dbg !2609
  %mul14 = and i32 %rem, 56, !dbg !2609
  %sh_prom = zext nneg i32 %mul14 to i64, !dbg !2610
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !2610
  %div153 = lshr i32 %i.2, 3, !dbg !2611
  %arrayidx16 = getelementptr inbounds nuw i64, ptr %s, i32 %div153, !dbg !2612
  %3 = load i64, ptr %arrayidx16, align 8, !dbg !2613
  %xor17 = xor i64 %3, %shl, !dbg !2613
  store i64 %xor17, ptr %arrayidx16, align 8, !dbg !2613
  %inc19 = add i32 %i.2, 1, !dbg !2614
    #dbg_value(i32 %inc19, !2567, !DIExpression(), !2562)
  br label %for.cond10, !dbg !2615, !llvm.loop !2616

for.end20:                                        ; preds = %for.cond10
  %i.2.lcssa = phi i32 [ %i.2, %for.cond10 ], !dbg !2604
  %conv21 = zext nneg i8 %p to i64, !dbg !2618
  %rem22 = shl i32 %i.2.lcssa, 3, !dbg !2619
  %mul23 = and i32 %rem22, 56, !dbg !2619
  %sh_prom24 = zext nneg i32 %mul23 to i64, !dbg !2620
  %shl25 = shl nuw nsw i64 %conv21, %sh_prom24, !dbg !2620
  %div261 = lshr i32 %i.2.lcssa, 3, !dbg !2621
  %arrayidx27 = getelementptr inbounds nuw i64, ptr %s, i32 %div261, !dbg !2622
  %4 = load i64, ptr %arrayidx27, align 8, !dbg !2623
  %xor28 = xor i64 %4, %shl25, !dbg !2623
  store i64 %xor28, ptr %arrayidx27, align 8, !dbg !2623
  %sub29 = add nsw i32 %r, -1, !dbg !2624
  %div302 = lshr i32 %sub29, 3, !dbg !2625
  %arrayidx31 = getelementptr inbounds nuw i64, ptr %s, i32 %div302, !dbg !2626
  %5 = load i64, ptr %arrayidx31, align 8, !dbg !2627
  %xor32 = xor i64 %5, -9223372036854775808, !dbg !2627
  store i64 %xor32, ptr %arrayidx31, align 8, !dbg !2627
  ret void, !dbg !2628
}

; Function Attrs: nounwind
define internal fastcc i64 @load64(ptr noundef %x) unnamed_addr #0 !dbg !2629 {
entry:
    #dbg_value(ptr %x, !2632, !DIExpression(), !2633)
    #dbg_value(i64 0, !2634, !DIExpression(), !2633)
    #dbg_value(i32 0, !2635, !DIExpression(), !2633)
  br label %for.cond, !dbg !2636

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !2638
  %r.0 = phi i64 [ 0, %entry ], [ %or, %for.inc ], !dbg !2633
    #dbg_value(i64 %r.0, !2634, !DIExpression(), !2633)
    #dbg_value(i32 %i.0, !2635, !DIExpression(), !2633)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !2639
  br i1 %exitcond, label %for.inc, label %for.end, !dbg !2641

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i64 poison, i8 poison, i32 poison), !2634, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2633)
  %arrayidx = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2642
  %0 = load i8, ptr %arrayidx, align 1, !dbg !2642
    #dbg_value(!DIArgList(i64 %r.0, i8 %0, i32 %i.0), !2634, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2633)
  %conv = zext i8 %0 to i64, !dbg !2643
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i32 %i.0), !2634, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2633)
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2644
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i32 %mul), !2634, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2633)
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2645
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i64 %sh_prom), !2634, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2633)
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !2645
    #dbg_value(!DIArgList(i64 %r.0, i64 %shl), !2634, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value), !2633)
  %or = or i64 %r.0, %shl, !dbg !2646
    #dbg_value(i64 %or, !2634, !DIExpression(), !2633)
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2647
    #dbg_value(i32 %inc, !2635, !DIExpression(), !2633)
  br label %for.cond, !dbg !2648, !llvm.loop !2649

for.end:                                          ; preds = %for.cond
  %r.0.lcssa = phi i64 [ %r.0, %for.cond ], !dbg !2633
  ret i64 %r.0.lcssa, !dbg !2651
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #0 !dbg !2652 {
entry:
    #dbg_value(ptr %out, !2653, !DIExpression(), !2654)
    #dbg_value(i32 %nblocks, !2655, !DIExpression(), !2654)
    #dbg_value(ptr %state, !2656, !DIExpression(), !2654)
  call fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state, i32 noundef 168) #3, !dbg !2657
  ret void, !dbg !2658
}

; Function Attrs: nounwind
define internal fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %s, i32 noundef range(i32 136, 169) %r) unnamed_addr #0 !dbg !2659 {
entry:
    #dbg_value(ptr %out, !2662, !DIExpression(), !2663)
    #dbg_value(i32 %nblocks, !2664, !DIExpression(), !2663)
    #dbg_value(ptr %s, !2665, !DIExpression(), !2663)
    #dbg_value(i32 %r, !2666, !DIExpression(), !2663)
  %0 = lshr i32 %r, 3, !dbg !2667
  br label %while.cond, !dbg !2667

while.cond:                                       ; preds = %for.end, %entry
  %nblocks.addr.0 = phi i32 [ %nblocks, %entry ], [ %sub, %for.end ]
  %out.addr.0 = phi ptr [ %out, %entry ], [ %add.ptr1, %for.end ]
    #dbg_value(ptr %out.addr.0, !2662, !DIExpression(), !2663)
    #dbg_value(i32 %nblocks.addr.0, !2664, !DIExpression(), !2663)
  %tobool.not = icmp eq i32 %nblocks.addr.0, 0, !dbg !2667
  br i1 %tobool.not, label %while.end, label %while.body, !dbg !2667

while.body:                                       ; preds = %while.cond
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2668
    #dbg_value(i32 0, !2670, !DIExpression(), !2663)
  br label %for.cond, !dbg !2671

for.cond:                                         ; preds = %for.body, %while.body
  %i.0 = phi i32 [ 0, %while.body ], [ %inc, %for.body ], !dbg !2673
    #dbg_value(i32 %i.0, !2670, !DIExpression(), !2663)
  %exitcond = icmp ne i32 %i.0, %0, !dbg !2674
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2676

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2677
  %add.ptr = getelementptr inbounds nuw i8, ptr %out.addr.0, i32 %mul, !dbg !2678
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !2679
  %1 = load i64, ptr %arrayidx, align 8, !dbg !2679
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %1) #3, !dbg !2680
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2681
    #dbg_value(i32 %inc, !2670, !DIExpression(), !2663)
  br label %for.cond, !dbg !2682, !llvm.loop !2683

for.end:                                          ; preds = %for.cond
  %add.ptr1 = getelementptr inbounds nuw i8, ptr %out.addr.0, i32 %r, !dbg !2685
    #dbg_value(ptr %add.ptr1, !2662, !DIExpression(), !2663)
  %sub = add i32 %nblocks.addr.0, -1, !dbg !2686
    #dbg_value(i32 %sub, !2664, !DIExpression(), !2663)
  br label %while.cond, !dbg !2667, !llvm.loop !2687

while.end:                                        ; preds = %while.cond
  ret void, !dbg !2689
}

; Function Attrs: nounwind
define internal fastcc void @store64(ptr noundef %x, i64 noundef %u) unnamed_addr #0 !dbg !2690 {
entry:
    #dbg_value(ptr %x, !2693, !DIExpression(), !2694)
    #dbg_value(i64 %u, !2695, !DIExpression(), !2694)
    #dbg_value(i32 0, !2696, !DIExpression(), !2694)
  br label %for.cond, !dbg !2697

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2699
    #dbg_value(i32 %i.0, !2696, !DIExpression(), !2694)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !2700
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2702

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2703
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2704
  %shr = lshr i64 %u, %sh_prom, !dbg !2704
  %conv = trunc i64 %shr to i8, !dbg !2705
  %arrayidx = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2706
  store i8 %conv, ptr %arrayidx, align 1, !dbg !2707
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2708
    #dbg_value(i32 %inc, !2696, !DIExpression(), !2694)
  br label %for.cond, !dbg !2709, !llvm.loop !2710

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2712
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef %state) local_unnamed_addr #0 !dbg !2713 {
entry:
    #dbg_value(ptr %state, !2714, !DIExpression(), !2715)
  call fastcc void @keccak_init(ptr noundef %state) #3, !dbg !2716
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2717
  store i64 0, ptr %arrayidx, align 8, !dbg !2718
  ret void, !dbg !2719
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2720 {
entry:
    #dbg_value(ptr %state, !2721, !DIExpression(), !2722)
    #dbg_value(ptr %in, !2723, !DIExpression(), !2722)
    #dbg_value(i32 %inlen, !2724, !DIExpression(), !2722)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2725
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2725
  %conv = trunc i64 %0 to i32, !dbg !2725
  %call = call fastcc i32 @keccak_absorb(ptr noundef %state, i32 noundef %conv, i32 noundef 136, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2726
  %conv1 = zext i32 %call to i64, !dbg !2726
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2727
  store i64 %conv1, ptr %arrayidx2, align 8, !dbg !2728
  ret void, !dbg !2729
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef %state) local_unnamed_addr #0 !dbg !2730 {
entry:
    #dbg_value(ptr %state, !2731, !DIExpression(), !2732)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2733
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2733
  %conv = trunc i64 %0 to i32, !dbg !2733
  call fastcc void @keccak_finalize(ptr noundef %state, i32 noundef %conv, i32 noundef 136, i8 noundef zeroext 31) #3, !dbg !2734
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2735
  store i64 136, ptr %arrayidx1, align 8, !dbg !2736
  ret void, !dbg !2737
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) local_unnamed_addr #0 !dbg !2738 {
entry:
    #dbg_value(ptr %out, !2739, !DIExpression(), !2740)
    #dbg_value(i32 %outlen, !2741, !DIExpression(), !2740)
    #dbg_value(ptr %state, !2742, !DIExpression(), !2740)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2743
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2743
  %conv = trunc i64 %0 to i32, !dbg !2743
  %call = call fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state, i32 noundef %conv, i32 noundef 136) #3, !dbg !2744
  %conv1 = zext i32 %call to i64, !dbg !2744
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2745
  store i64 %conv1, ptr %arrayidx2, align 8, !dbg !2746
  ret void, !dbg !2747
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2748 {
entry:
    #dbg_value(ptr %state, !2749, !DIExpression(), !2750)
    #dbg_value(ptr %in, !2751, !DIExpression(), !2750)
    #dbg_value(i32 %inlen, !2752, !DIExpression(), !2750)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #3, !dbg !2753
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2754
  store i64 136, ptr %arrayidx, align 8, !dbg !2755
  ret void, !dbg !2756
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #0 !dbg !2757 {
entry:
    #dbg_value(ptr %out, !2758, !DIExpression(), !2759)
    #dbg_value(i32 %nblocks, !2760, !DIExpression(), !2759)
    #dbg_value(ptr %state, !2761, !DIExpression(), !2759)
  call fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state, i32 noundef 136) #3, !dbg !2762
  ret void, !dbg !2763
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2764 {
entry:
  %state = alloca [26 x i64], align 8
    #dbg_value(ptr %out, !2767, !DIExpression(), !2768)
    #dbg_value(i32 %outlen, !2769, !DIExpression(), !2768)
    #dbg_value(ptr %in, !2770, !DIExpression(), !2768)
    #dbg_value(i32 %inlen, !2771, !DIExpression(), !2768)
    #dbg_declare(ptr %state, !2772, !DIExpression(), !2773)
  call void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef nonnull %state, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2774
  %div = udiv i32 %outlen, 168, !dbg !2775
    #dbg_value(i32 %div, !2776, !DIExpression(), !2768)
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %div, ptr noundef nonnull %state) #3, !dbg !2777
  %mul.neg = mul i32 %div, -168, !dbg !2778
  %sub = add i32 %mul.neg, %outlen, !dbg !2779
    #dbg_value(i32 %sub, !2769, !DIExpression(), !2768)
  %mul1 = mul nuw i32 %div, 168, !dbg !2780
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !2781
    #dbg_value(ptr %add.ptr, !2767, !DIExpression(), !2768)
  call void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef nonnull %state) #3, !dbg !2782
  ret void, !dbg !2783
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2784 {
entry:
  %state = alloca [26 x i64], align 8
    #dbg_value(ptr %out, !2785, !DIExpression(), !2786)
    #dbg_value(i32 %outlen, !2787, !DIExpression(), !2786)
    #dbg_value(ptr %in, !2788, !DIExpression(), !2786)
    #dbg_value(i32 %inlen, !2789, !DIExpression(), !2786)
    #dbg_declare(ptr %state, !2790, !DIExpression(), !2791)
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef nonnull %state, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2792
  %div = udiv i32 %outlen, 136, !dbg !2793
    #dbg_value(i32 %div, !2794, !DIExpression(), !2786)
  call void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %div, ptr noundef nonnull %state) #3, !dbg !2795
  %mul.neg = mul i32 %div, -136, !dbg !2796
  %sub = add i32 %mul.neg, %outlen, !dbg !2797
    #dbg_value(i32 %sub, !2787, !DIExpression(), !2786)
  %mul1 = mul nuw i32 %div, 136, !dbg !2798
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !2799
    #dbg_value(ptr %add.ptr, !2785, !DIExpression(), !2786)
  call void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef nonnull %state) #3, !dbg !2800
  ret void, !dbg !2801
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2802 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !2805, !DIExpression(), !2806)
    #dbg_value(ptr %in, !2807, !DIExpression(), !2806)
    #dbg_value(i32 %inlen, !2808, !DIExpression(), !2806)
    #dbg_declare(ptr %s, !2809, !DIExpression(), !2813)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %s, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #3, !dbg !2814
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #3, !dbg !2815
    #dbg_value(i32 0, !2816, !DIExpression(), !2806)
  br label %for.cond, !dbg !2817

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2819
    #dbg_value(i32 %i.0, !2816, !DIExpression(), !2806)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !2820
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2822

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2823
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !2824
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !2825
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2825
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %0) #3, !dbg !2826
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2827
    #dbg_value(i32 %inc, !2816, !DIExpression(), !2806)
  br label %for.cond, !dbg !2828, !llvm.loop !2829

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2831
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2832 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !2833, !DIExpression(), !2834)
    #dbg_value(ptr %in, !2835, !DIExpression(), !2834)
    #dbg_value(i32 %inlen, !2836, !DIExpression(), !2834)
    #dbg_declare(ptr %s, !2837, !DIExpression(), !2838)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %s, i32 noundef 72, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #3, !dbg !2839
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #3, !dbg !2840
    #dbg_value(i32 0, !2841, !DIExpression(), !2834)
  br label %for.cond, !dbg !2842

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2844
    #dbg_value(i32 %i.0, !2841, !DIExpression(), !2834)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !2845
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2847

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2848
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !2849
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !2850
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2850
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %0) #3, !dbg !2851
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2852
    #dbg_value(i32 %inc, !2841, !DIExpression(), !2834)
  br label %for.cond, !dbg !2853, !llvm.loop !2854

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2856
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_kyber_shake128_absorb(ptr noundef %state, ptr noundef %seed, i8 noundef zeroext %x, i8 noundef zeroext %y) local_unnamed_addr #0 !dbg !2857 {
entry:
  %extseed = alloca [34 x i8], align 1
    #dbg_value(ptr %state, !2861, !DIExpression(), !2862)
    #dbg_value(ptr %seed, !2863, !DIExpression(), !2862)
    #dbg_value(i8 %x, !2864, !DIExpression(), !2862)
    #dbg_value(i8 %y, !2865, !DIExpression(), !2862)
    #dbg_declare(ptr %extseed, !2866, !DIExpression(), !2870)
  %call = call ptr @memcpy(ptr noundef nonnull %extseed, ptr noundef %seed, i32 noundef 32) #4, !dbg !2871
  %arrayidx = getelementptr inbounds nuw i8, ptr %extseed, i32 32, !dbg !2872
  store i8 %x, ptr %arrayidx, align 1, !dbg !2873
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %extseed, i32 33, !dbg !2874
  store i8 %y, ptr %arrayidx1, align 1, !dbg !2875
  call void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef nonnull %extseed, i32 noundef 34) #3, !dbg !2876
  ret void, !dbg !2877
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_kyber_shake256_prf(ptr noundef %out, i32 noundef %outlen, ptr noundef %key, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !2878 {
entry:
  %extkey = alloca [33 x i8], align 1
    #dbg_value(ptr %out, !2881, !DIExpression(), !2882)
    #dbg_value(i32 %outlen, !2883, !DIExpression(), !2882)
    #dbg_value(ptr %key, !2884, !DIExpression(), !2882)
    #dbg_value(i8 %nonce, !2885, !DIExpression(), !2882)
    #dbg_declare(ptr %extkey, !2886, !DIExpression(), !2890)
  %call = call ptr @memcpy(ptr noundef nonnull %extkey, ptr noundef %key, i32 noundef 32) #4, !dbg !2891
  %arrayidx = getelementptr inbounds nuw i8, ptr %extkey, i32 32, !dbg !2892
  store i8 %nonce, ptr %arrayidx, align 1, !dbg !2893
  call void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef nonnull %extkey, i32 noundef 33) #3, !dbg !2894
  ret void, !dbg !2895
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_kyber_shake256_rkprf(ptr noundef %out, ptr noundef %key, ptr noundef %input) local_unnamed_addr #0 !dbg !2896 {
entry:
  %s = alloca [26 x i64], align 8
    #dbg_value(ptr %out, !2897, !DIExpression(), !2898)
    #dbg_value(ptr %key, !2899, !DIExpression(), !2898)
    #dbg_value(ptr %input, !2900, !DIExpression(), !2898)
    #dbg_declare(ptr %s, !2901, !DIExpression(), !2902)
  call void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef nonnull %s) #3, !dbg !2903
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef nonnull %s, ptr noundef %key, i32 noundef 32) #3, !dbg !2904
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef nonnull %s, ptr noundef %input, i32 noundef 1568) #3, !dbg !2905
  call void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef nonnull %s) #3, !dbg !2906
  call void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef 32, ptr noundef nonnull %s) #3, !dbg !2907
  ret void, !dbg !2908
}

; Function Attrs: nounwind
define dso_local void @kyber_memset(ptr noundef %dst, i8 noundef zeroext %val, i32 noundef %len) local_unnamed_addr #0 !dbg !2909 {
entry:
    #dbg_value(ptr %dst, !2914, !DIExpression(), !2915)
    #dbg_value(i8 %val, !2916, !DIExpression(), !2915)
    #dbg_value(i32 %len, !2917, !DIExpression(), !2915)
    #dbg_value(ptr %dst, !2918, !DIExpression(), !2915)
    #dbg_value(i32 0, !2919, !DIExpression(), !2921)
  br label %for.cond, !dbg !2922

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2923
    #dbg_value(i32 %i.0, !2919, !DIExpression(), !2921)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !2924
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2926

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %dst, i32 %i.0, !dbg !2927
  store i8 %val, ptr %arrayidx, align 1, !dbg !2928
  %inc = add i32 %i.0, 1, !dbg !2929
    #dbg_value(i32 %inc, !2919, !DIExpression(), !2921)
  br label %for.cond, !dbg !2930, !llvm.loop !2931

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2933
}

; Function Attrs: nounwind
define dso_local void @kyber_memcpy(ptr noundef %dst, ptr noundef %src, i32 noundef %len) local_unnamed_addr #0 !dbg !2934 {
entry:
    #dbg_value(ptr %dst, !2939, !DIExpression(), !2940)
    #dbg_value(ptr %src, !2941, !DIExpression(), !2940)
    #dbg_value(i32 %len, !2942, !DIExpression(), !2940)
    #dbg_value(ptr %dst, !2943, !DIExpression(), !2940)
    #dbg_value(ptr %src, !2944, !DIExpression(), !2940)
    #dbg_value(i32 0, !2945, !DIExpression(), !2947)
  br label %for.cond, !dbg !2948

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2949
    #dbg_value(i32 %i.0, !2945, !DIExpression(), !2947)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !2950
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2952

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %src, i32 %i.0, !dbg !2953
  %0 = load i8, ptr %arrayidx, align 1, !dbg !2953
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %dst, i32 %i.0, !dbg !2954
  store i8 %0, ptr %arrayidx1, align 1, !dbg !2955
  %inc = add i32 %i.0, 1, !dbg !2956
    #dbg_value(i32 %inc, !2945, !DIExpression(), !2947)
  br label %for.cond, !dbg !2957, !llvm.loop !2958

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2960
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umax.i32(i32, i32) #2

attributes #0 = { nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+thumb-mode,+vfp2sp,+vfp3d16sp,+vfp4d16sp" }
attributes #1 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+thumb-mode,+vfp2sp,+vfp3d16sp,+vfp4d16sp" }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nobuiltin "no-builtins" }
attributes #4 = { nobuiltin nounwind "no-builtins" }
attributes #5 = { nounwind memory(none) }

!llvm.dbg.cu = !{!54, !15, !57, !58, !63, !67, !28, !69, !71, !73, !43, !74, !75}
!llvm.ident = !{!77, !77, !77, !77, !77, !77, !77, !77, !77, !77, !77, !77, !77}
!llvm.module.flags = !{!78, !79, !80, !81}

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
!27 = distinct !DIGlobalVariable(name: "pqcrystals_kyber1024_ref_zetas", scope: !28, file: !33, line: 39, type: !34, isLocal: false, isDefinition: true)
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
!68 = !{!65, !36, !60, !30}
!69 = distinct !DICompileUnit(language: DW_LANG_C11, file: !16, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !70, splitDebugInlining: false, nameTableKind: None)
!70 = !{!65}
!71 = distinct !DICompileUnit(language: DW_LANG_C11, file: !16, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !72, splitDebugInlining: false, nameTableKind: None)
!72 = !{!36, !30}
!73 = distinct !DICompileUnit(language: DW_LANG_C11, file: !16, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !44, splitDebugInlining: false, nameTableKind: None)
!74 = distinct !DICompileUnit(language: DW_LANG_C11, file: !16, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!75 = distinct !DICompileUnit(language: DW_LANG_C11, file: !76, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!76 = !DIFile(filename: "../<stdin>", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!77 = !{!"Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)"}
!78 = !{i32 2, !"Debug Info Version", i32 3}
!79 = !{i32 1, !"wchar_size", i32 4}
!80 = !{i32 1, !"min_enum_size", i32 4}
!81 = !{i32 1, !"Code Model", i32 1}
!82 = distinct !DISubprogram(name: "main", scope: !83, file: !83, line: 97, type: !84, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !54, retainedNodes: !24)
!83 = !DIFile(filename: "../../../ref/test/test_kyber.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!84 = !DISubroutineType(types: !85)
!85 = !{!25}
!86 = !DILocalVariable(name: "i", scope: !82, file: !83, line: 99, type: !14)
!87 = !DILocation(line: 0, scope: !82)
!88 = !DILocation(line: 102, column: 7, scope: !89)
!89 = distinct !DILexicalBlock(scope: !82, file: !83, line: 102, column: 3)
!90 = !DILocation(line: 102, scope: !89)
!91 = !DILocation(line: 102, column: 12, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !83, line: 102, column: 3)
!93 = !DILocation(line: 102, column: 3, scope: !89)
!94 = !DILocation(line: 103, column: 10, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !83, line: 102, column: 25)
!96 = !DILocalVariable(name: "r", scope: !82, file: !83, line: 100, type: !25)
!97 = !DILocation(line: 104, column: 10, scope: !95)
!98 = !DILocation(line: 104, column: 7, scope: !95)
!99 = !DILocation(line: 105, column: 10, scope: !95)
!100 = !DILocation(line: 105, column: 7, scope: !95)
!101 = !DILocation(line: 106, column: 8, scope: !102)
!102 = distinct !DILexicalBlock(scope: !95, file: !83, line: 106, column: 8)
!103 = !DILocation(line: 102, column: 21, scope: !92)
!104 = !DILocation(line: 102, column: 3, scope: !92)
!105 = distinct !{!105, !93, !106, !107}
!106 = !DILocation(line: 108, column: 3, scope: !89)
!107 = !{!"llvm.loop.mustprogress"}
!108 = !DILocation(line: 115, column: 1, scope: !82)
!109 = distinct !DISubprogram(name: "test_keys", scope: !83, file: !83, line: 9, type: !84, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !54, retainedNodes: !24)
!110 = !DILocalVariable(name: "pk", scope: !109, file: !83, line: 11, type: !111)
!111 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 12544, elements: !112)
!112 = !{!113}
!113 = !DISubrange(count: 1568)
!114 = !DILocation(line: 11, column: 11, scope: !109)
!115 = !DILocalVariable(name: "sk", scope: !109, file: !83, line: 12, type: !116)
!116 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 25344, elements: !117)
!117 = !{!118}
!118 = !DISubrange(count: 3168)
!119 = !DILocation(line: 12, column: 11, scope: !109)
!120 = !DILocalVariable(name: "ct", scope: !109, file: !83, line: 13, type: !111)
!121 = !DILocation(line: 13, column: 11, scope: !109)
!122 = !DILocalVariable(name: "key_a", scope: !109, file: !83, line: 14, type: !123)
!123 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 256, elements: !124)
!124 = !{!125}
!125 = !DISubrange(count: 32)
!126 = !DILocation(line: 14, column: 11, scope: !109)
!127 = !DILocalVariable(name: "key_b", scope: !109, file: !83, line: 15, type: !123)
!128 = !DILocation(line: 15, column: 11, scope: !109)
!129 = !DILocation(line: 18, column: 3, scope: !109)
!130 = !DILocation(line: 21, column: 3, scope: !109)
!131 = !DILocation(line: 24, column: 3, scope: !109)
!132 = !DILocation(line: 26, column: 6, scope: !133)
!133 = distinct !DILexicalBlock(scope: !109, file: !83, line: 26, column: 6)
!134 = !DILocation(line: 0, scope: !109)
!135 = !DILocation(line: 32, column: 1, scope: !109)
!136 = distinct !DISubprogram(name: "test_invalid_sk_a", scope: !83, file: !83, line: 34, type: !84, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !54, retainedNodes: !24)
!137 = !DILocalVariable(name: "pk", scope: !136, file: !83, line: 36, type: !111)
!138 = !DILocation(line: 36, column: 11, scope: !136)
!139 = !DILocalVariable(name: "sk", scope: !136, file: !83, line: 37, type: !116)
!140 = !DILocation(line: 37, column: 11, scope: !136)
!141 = !DILocalVariable(name: "ct", scope: !136, file: !83, line: 38, type: !111)
!142 = !DILocation(line: 38, column: 11, scope: !136)
!143 = !DILocalVariable(name: "key_a", scope: !136, file: !83, line: 39, type: !123)
!144 = !DILocation(line: 39, column: 11, scope: !136)
!145 = !DILocalVariable(name: "key_b", scope: !136, file: !83, line: 40, type: !123)
!146 = !DILocation(line: 40, column: 11, scope: !136)
!147 = !DILocation(line: 43, column: 3, scope: !136)
!148 = !DILocation(line: 46, column: 3, scope: !136)
!149 = !DILocation(line: 49, column: 3, scope: !136)
!150 = !DILocation(line: 52, column: 3, scope: !136)
!151 = !DILocation(line: 54, column: 7, scope: !152)
!152 = distinct !DILexicalBlock(scope: !136, file: !83, line: 54, column: 6)
!153 = !DILocation(line: 0, scope: !136)
!154 = !DILocation(line: 60, column: 1, scope: !136)
!155 = distinct !DISubprogram(name: "test_invalid_ciphertext", scope: !83, file: !83, line: 62, type: !84, scopeLine: 63, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !54, retainedNodes: !24)
!156 = !DILocalVariable(name: "pk", scope: !155, file: !83, line: 64, type: !111)
!157 = !DILocation(line: 64, column: 11, scope: !155)
!158 = !DILocalVariable(name: "sk", scope: !155, file: !83, line: 65, type: !116)
!159 = !DILocation(line: 65, column: 11, scope: !155)
!160 = !DILocalVariable(name: "ct", scope: !155, file: !83, line: 66, type: !111)
!161 = !DILocation(line: 66, column: 11, scope: !155)
!162 = !DILocalVariable(name: "key_a", scope: !155, file: !83, line: 67, type: !123)
!163 = !DILocation(line: 67, column: 11, scope: !155)
!164 = !DILocalVariable(name: "key_b", scope: !155, file: !83, line: 68, type: !123)
!165 = !DILocation(line: 68, column: 11, scope: !155)
!166 = !DILocation(line: 72, column: 3, scope: !155)
!167 = !DILocalVariable(name: "b", scope: !155, file: !83, line: 69, type: !7)
!168 = !DILocation(line: 0, scope: !155)
!169 = !DILocation(line: 73, column: 5, scope: !170)
!170 = distinct !DILexicalBlock(scope: !155, file: !83, line: 72, column: 6)
!171 = !DILocation(line: 74, column: 12, scope: !155)
!172 = !DILocation(line: 74, column: 11, scope: !155)
!173 = !DILocation(line: 74, column: 3, scope: !170)
!174 = distinct !{!174, !166, !175, !107}
!175 = !DILocation(line: 74, column: 13, scope: !155)
!176 = !DILocalVariable(name: "pos", scope: !155, file: !83, line: 70, type: !12)
!177 = !DILocation(line: 75, column: 3, scope: !155)
!178 = !DILocation(line: 78, column: 3, scope: !155)
!179 = !DILocation(line: 81, column: 3, scope: !155)
!180 = !DILocation(line: 84, column: 39, scope: !155)
!181 = !DILocation(line: 84, column: 6, scope: !155)
!182 = !DILocation(line: 84, column: 10, scope: !155)
!183 = !DILocation(line: 84, column: 3, scope: !155)
!184 = !DILocation(line: 84, column: 36, scope: !155)
!185 = !DILocation(line: 87, column: 3, scope: !155)
!186 = !DILocation(line: 89, column: 7, scope: !187)
!187 = distinct !DILexicalBlock(scope: !155, file: !83, line: 89, column: 6)
!188 = !DILocation(line: 95, column: 1, scope: !155)
!189 = !DILocalVariable(name: "out", arg: 1, scope: !2, file: !3, line: 74, type: !6)
!190 = !DILocation(line: 0, scope: !2)
!191 = !DILocalVariable(name: "outlen", arg: 2, scope: !2, file: !3, line: 74, type: !12)
!192 = !DILocation(line: 78, column: 3, scope: !2)
!193 = !DILocation(line: 78, column: 9, scope: !2)
!194 = !DILocation(line: 78, column: 12, scope: !2)
!195 = !DILocation(line: 86, column: 3, scope: !2)
!196 = !DILocation(line: 79, column: 10, scope: !197)
!197 = distinct !DILexicalBlock(scope: !2, file: !3, line: 78, column: 19)
!198 = !DILocation(line: 79, column: 8, scope: !197)
!199 = !DILocation(line: 80, column: 11, scope: !200)
!200 = distinct !DILexicalBlock(scope: !197, file: !3, line: 80, column: 8)
!201 = !DILocation(line: 80, column: 17, scope: !200)
!202 = !DILocation(line: 80, column: 20, scope: !200)
!203 = !DILocation(line: 80, column: 26, scope: !200)
!204 = !DILocation(line: 82, column: 13, scope: !205)
!205 = distinct !DILexicalBlock(scope: !200, file: !3, line: 82, column: 13)
!206 = !DILocation(line: 82, column: 16, scope: !205)
!207 = !DILocation(line: 83, column: 7, scope: !205)
!208 = distinct !{!208, !192, !209, !107}
!209 = !DILocation(line: 84, column: 3, scope: !2)
!210 = !DILocation(line: 86, column: 16, scope: !2)
!211 = !DILocation(line: 87, column: 16, scope: !212)
!212 = distinct !DILexicalBlock(scope: !2, file: !3, line: 86, column: 21)
!213 = !DILocation(line: 87, column: 11, scope: !212)
!214 = !DILocalVariable(name: "ret", scope: !2, file: !3, line: 76, type: !215)
!215 = !DIDerivedType(tag: DW_TAG_typedef, name: "ssize_t", file: !216, line: 182, baseType: !217)
!216 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/sys/types.h", directory: "")
!217 = !DIDerivedType(tag: DW_TAG_typedef, name: "_ssize_t", file: !218, line: 147, baseType: !25)
!218 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/sys/_types.h", directory: "")
!219 = !DILocation(line: 88, column: 18, scope: !220)
!220 = distinct !DILexicalBlock(scope: !212, file: !3, line: 88, column: 8)
!221 = !DILocation(line: 88, column: 21, scope: !220)
!222 = !DILocation(line: 88, column: 27, scope: !220)
!223 = distinct !{!223, !195, !224, !107}
!224 = !DILocation(line: 95, column: 3, scope: !2)
!225 = !DILocation(line: 91, column: 7, scope: !226)
!226 = distinct !DILexicalBlock(scope: !220, file: !3, line: 90, column: 13)
!227 = !DILocation(line: 93, column: 9, scope: !212)
!228 = !DILocation(line: 94, column: 12, scope: !212)
!229 = !DILocation(line: 96, column: 1, scope: !2)
!230 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_keypair_derand", scope: !231, file: !231, line: 25, type: !232, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !24)
!231 = !DIFile(filename: "../../../ref/kem.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!232 = !DISubroutineType(types: !233)
!233 = !{!25, !6, !6, !234}
!234 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !235, size: 32)
!235 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !7)
!236 = !DILocalVariable(name: "pk", arg: 1, scope: !230, file: !231, line: 25, type: !6)
!237 = !DILocation(line: 0, scope: !230)
!238 = !DILocalVariable(name: "sk", arg: 2, scope: !230, file: !231, line: 26, type: !6)
!239 = !DILocalVariable(name: "coins", arg: 3, scope: !230, file: !231, line: 27, type: !234)
!240 = !DILocation(line: 29, column: 3, scope: !230)
!241 = !DILocation(line: 30, column: 12, scope: !230)
!242 = !DILocation(line: 30, column: 3, scope: !230)
!243 = !DILocation(line: 31, column: 3, scope: !230)
!244 = !DILocation(line: 33, column: 33, scope: !230)
!245 = !DILocation(line: 33, column: 55, scope: !230)
!246 = !DILocation(line: 33, column: 3, scope: !230)
!247 = !DILocation(line: 34, column: 3, scope: !230)
!248 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_keypair", scope: !231, file: !231, line: 50, type: !249, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !24)
!249 = !DISubroutineType(types: !250)
!250 = !{!25, !6, !6}
!251 = !DILocalVariable(name: "pk", arg: 1, scope: !248, file: !231, line: 50, type: !6)
!252 = !DILocation(line: 0, scope: !248)
!253 = !DILocalVariable(name: "sk", arg: 2, scope: !248, file: !231, line: 51, type: !6)
!254 = !DILocalVariable(name: "coins", scope: !248, file: !231, line: 53, type: !255)
!255 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 512, elements: !256)
!256 = !{!257}
!257 = !DISubrange(count: 64)
!258 = !DILocation(line: 53, column: 11, scope: !248)
!259 = !DILocation(line: 54, column: 3, scope: !248)
!260 = !DILocation(line: 55, column: 3, scope: !248)
!261 = !DILocation(line: 56, column: 3, scope: !248)
!262 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_enc_derand", scope: !231, file: !231, line: 76, type: !263, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !24)
!263 = !DISubroutineType(types: !264)
!264 = !{!25, !6, !6, !234, !234}
!265 = !DILocalVariable(name: "ct", arg: 1, scope: !262, file: !231, line: 76, type: !6)
!266 = !DILocation(line: 0, scope: !262)
!267 = !DILocalVariable(name: "ss", arg: 2, scope: !262, file: !231, line: 77, type: !6)
!268 = !DILocalVariable(name: "pk", arg: 3, scope: !262, file: !231, line: 78, type: !234)
!269 = !DILocalVariable(name: "coins", arg: 4, scope: !262, file: !231, line: 79, type: !234)
!270 = !DILocalVariable(name: "buf", scope: !262, file: !231, line: 81, type: !255)
!271 = !DILocation(line: 81, column: 11, scope: !262)
!272 = !DILocalVariable(name: "kr", scope: !262, file: !231, line: 83, type: !255)
!273 = !DILocation(line: 83, column: 11, scope: !262)
!274 = !DILocation(line: 85, column: 3, scope: !262)
!275 = !DILocation(line: 88, column: 3, scope: !262)
!276 = !DILocation(line: 89, column: 3, scope: !262)
!277 = !DILocation(line: 92, column: 29, scope: !262)
!278 = !DILocation(line: 92, column: 3, scope: !262)
!279 = !DILocation(line: 94, column: 3, scope: !262)
!280 = !DILocation(line: 95, column: 3, scope: !262)
!281 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_enc", scope: !231, file: !231, line: 113, type: !232, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !24)
!282 = !DILocalVariable(name: "ct", arg: 1, scope: !281, file: !231, line: 113, type: !6)
!283 = !DILocation(line: 0, scope: !281)
!284 = !DILocalVariable(name: "ss", arg: 2, scope: !281, file: !231, line: 114, type: !6)
!285 = !DILocalVariable(name: "pk", arg: 3, scope: !281, file: !231, line: 115, type: !234)
!286 = !DILocalVariable(name: "coins", scope: !281, file: !231, line: 117, type: !123)
!287 = !DILocation(line: 117, column: 11, scope: !281)
!288 = !DILocation(line: 118, column: 3, scope: !281)
!289 = !DILocation(line: 119, column: 3, scope: !281)
!290 = !DILocation(line: 120, column: 3, scope: !281)
!291 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_dec", scope: !231, file: !231, line: 140, type: !292, scopeLine: 143, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !24)
!292 = !DISubroutineType(types: !293)
!293 = !{!25, !6, !234, !234}
!294 = !DILocalVariable(name: "ss", arg: 1, scope: !291, file: !231, line: 140, type: !6)
!295 = !DILocation(line: 0, scope: !291)
!296 = !DILocalVariable(name: "ct", arg: 2, scope: !291, file: !231, line: 141, type: !234)
!297 = !DILocalVariable(name: "sk", arg: 3, scope: !291, file: !231, line: 142, type: !234)
!298 = !DILocalVariable(name: "buf", scope: !291, file: !231, line: 145, type: !255)
!299 = !DILocation(line: 145, column: 11, scope: !291)
!300 = !DILocalVariable(name: "kr", scope: !291, file: !231, line: 147, type: !255)
!301 = !DILocation(line: 147, column: 11, scope: !291)
!302 = !DILocalVariable(name: "cmp", scope: !291, file: !231, line: 149, type: !111)
!303 = !DILocation(line: 149, column: 11, scope: !291)
!304 = !DILocation(line: 150, column: 25, scope: !291)
!305 = !DILocalVariable(name: "pk", scope: !291, file: !231, line: 150, type: !234)
!306 = !DILocation(line: 152, column: 3, scope: !291)
!307 = !DILocation(line: 155, column: 13, scope: !291)
!308 = !DILocation(line: 155, column: 53, scope: !291)
!309 = !DILocation(line: 155, column: 3, scope: !291)
!310 = !DILocation(line: 156, column: 3, scope: !291)
!311 = !DILocation(line: 159, column: 30, scope: !291)
!312 = !DILocation(line: 159, column: 3, scope: !291)
!313 = !DILocation(line: 161, column: 10, scope: !291)
!314 = !DILocalVariable(name: "fail", scope: !291, file: !231, line: 144, type: !25)
!315 = !DILocation(line: 164, column: 3, scope: !291)
!316 = !DILocation(line: 167, column: 29, scope: !291)
!317 = !DILocation(line: 167, column: 3, scope: !291)
!318 = !DILocation(line: 169, column: 3, scope: !291)
!319 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_gen_matrix", scope: !320, file: !320, line: 165, type: !321, scopeLine: 166, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !58, retainedNodes: !24)
!320 = !DIFile(filename: "../../../ref/indcpa.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!321 = !DISubroutineType(types: !322)
!322 = !{null, !323, !234, !25}
!323 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !324, size: 32)
!324 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyvec", file: !325, line: 8, baseType: !326)
!325 = !DIFile(filename: "../../../ref/polyvec.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!326 = !DICompositeType(tag: DW_TAG_array_type, baseType: !327, size: 16384, elements: !332)
!327 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !328, line: 11, baseType: !329)
!328 = !DIFile(filename: "../../../ref/poly.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!329 = !DICompositeType(tag: DW_TAG_array_type, baseType: !36, size: 4096, elements: !330)
!330 = !{!331}
!331 = !DISubrange(count: 256)
!332 = !{!333}
!333 = !DISubrange(count: 4)
!334 = !DILocalVariable(name: "a", arg: 1, scope: !319, file: !320, line: 165, type: !323)
!335 = !DILocation(line: 0, scope: !319)
!336 = !DILocalVariable(name: "seed", arg: 2, scope: !319, file: !320, line: 165, type: !234)
!337 = !DILocalVariable(name: "transposed", arg: 3, scope: !319, file: !320, line: 166, type: !25)
!338 = !DILocalVariable(name: "buf", scope: !319, file: !320, line: 169, type: !339)
!339 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 4032, elements: !340)
!340 = !{!341}
!341 = !DISubrange(count: 504)
!342 = !DILocation(line: 169, column: 11, scope: !319)
!343 = !DILocalVariable(name: "state", scope: !319, file: !320, line: 170, type: !344)
!344 = !DIDerivedType(tag: DW_TAG_typedef, name: "xof_state", file: !345, line: 10, baseType: !346)
!345 = !DIFile(filename: "../../../ref/symmetric.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!346 = !DIDerivedType(tag: DW_TAG_typedef, name: "keccak_state", file: !347, line: 14, baseType: !348)
!347 = !DIFile(filename: "../../../ref/fips202.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!348 = !DICompositeType(tag: DW_TAG_array_type, baseType: !45, size: 1664, elements: !349)
!349 = !{!350}
!350 = !DISubrange(count: 26)
!351 = !DILocation(line: 170, column: 13, scope: !319)
!352 = !DILocalVariable(name: "i", scope: !319, file: !320, line: 167, type: !14)
!353 = !DILocation(line: 172, column: 8, scope: !354)
!354 = distinct !DILexicalBlock(scope: !319, file: !320, line: 172, column: 3)
!355 = !DILocation(line: 172, scope: !354)
!356 = !DILocation(line: 172, column: 17, scope: !357)
!357 = distinct !DILexicalBlock(scope: !354, file: !320, line: 172, column: 3)
!358 = !DILocation(line: 172, column: 3, scope: !354)
!359 = !DILocation(line: 173, column: 5, scope: !360)
!360 = distinct !DILexicalBlock(scope: !361, file: !320, line: 173, column: 5)
!361 = distinct !DILexicalBlock(scope: !357, file: !320, line: 172, column: 33)
!362 = !DILocation(line: 173, scope: !360)
!363 = !DILocalVariable(name: "j", scope: !319, file: !320, line: 167, type: !14)
!364 = !DILocation(line: 173, column: 19, scope: !365)
!365 = distinct !DILexicalBlock(scope: !360, file: !320, line: 173, column: 5)
!366 = !DILocation(line: 174, column: 11, scope: !367)
!367 = distinct !DILexicalBlock(scope: !368, file: !320, line: 174, column: 11)
!368 = distinct !DILexicalBlock(scope: !365, file: !320, line: 173, column: 35)
!369 = !DILocation(line: 175, column: 9, scope: !367)
!370 = !DILocation(line: 177, column: 9, scope: !367)
!371 = !DILocation(line: 179, column: 7, scope: !368)
!372 = !DILocalVariable(name: "buflen", scope: !319, file: !320, line: 168, type: !14)
!373 = !DILocation(line: 181, column: 25, scope: !368)
!374 = !DILocation(line: 181, column: 13, scope: !368)
!375 = !DILocalVariable(name: "ctr", scope: !319, file: !320, line: 167, type: !14)
!376 = !DILocation(line: 183, column: 7, scope: !368)
!377 = !DILocation(line: 0, scope: !368)
!378 = !DILocation(line: 183, column: 18, scope: !368)
!379 = !DILocation(line: 184, column: 9, scope: !380)
!380 = distinct !DILexicalBlock(scope: !368, file: !320, line: 183, column: 29)
!381 = !DILocation(line: 186, column: 28, scope: !380)
!382 = !DILocation(line: 186, column: 36, scope: !380)
!383 = !DILocation(line: 186, column: 51, scope: !380)
!384 = !DILocation(line: 186, column: 16, scope: !380)
!385 = !DILocation(line: 186, column: 13, scope: !380)
!386 = distinct !{!386, !376, !387, !107}
!387 = !DILocation(line: 187, column: 7, scope: !368)
!388 = !DILocation(line: 173, column: 31, scope: !365)
!389 = !DILocation(line: 173, column: 5, scope: !365)
!390 = distinct !{!390, !359, !391, !107}
!391 = !DILocation(line: 188, column: 5, scope: !360)
!392 = !DILocation(line: 172, column: 29, scope: !357)
!393 = !DILocation(line: 172, column: 3, scope: !357)
!394 = distinct !{!394, !358, !395, !107}
!395 = !DILocation(line: 189, column: 3, scope: !354)
!396 = !DILocation(line: 190, column: 1, scope: !319)
!397 = distinct !DISubprogram(name: "rej_uniform", scope: !320, file: !320, line: 122, type: !398, scopeLine: 123, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !58, retainedNodes: !24)
!398 = !DISubroutineType(types: !399)
!399 = !{!14, !400, !14, !234, !14}
!400 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 32)
!401 = !DILocalVariable(name: "r", arg: 1, scope: !397, file: !320, line: 122, type: !400)
!402 = !DILocation(line: 0, scope: !397)
!403 = !DILocalVariable(name: "len", arg: 2, scope: !397, file: !320, line: 122, type: !14)
!404 = !DILocalVariable(name: "buf", arg: 3, scope: !397, file: !320, line: 123, type: !234)
!405 = !DILocalVariable(name: "buflen", arg: 4, scope: !397, file: !320, line: 123, type: !14)
!406 = !DILocalVariable(name: "pos", scope: !397, file: !320, line: 124, type: !14)
!407 = !DILocalVariable(name: "ctr", scope: !397, file: !320, line: 124, type: !14)
!408 = !DILocation(line: 128, column: 3, scope: !397)
!409 = !DILocation(line: 128, column: 14, scope: !397)
!410 = !DILocation(line: 128, column: 20, scope: !397)
!411 = !DILocation(line: 129, column: 14, scope: !412)
!412 = distinct !DILexicalBlock(scope: !397, file: !320, line: 128, column: 42)
!413 = !DILocation(line: 129, column: 46, scope: !412)
!414 = !DILocation(line: 129, column: 36, scope: !412)
!415 = !DILocation(line: 129, column: 59, scope: !412)
!416 = !DILocation(line: 129, column: 66, scope: !412)
!417 = !DILocalVariable(name: "val0", scope: !397, file: !320, line: 125, type: !60)
!418 = !DILocation(line: 130, column: 14, scope: !412)
!419 = !DILocation(line: 130, column: 27, scope: !412)
!420 = !DILocation(line: 130, column: 46, scope: !412)
!421 = !DILocation(line: 130, column: 36, scope: !412)
!422 = !DILocation(line: 130, column: 59, scope: !412)
!423 = !DILocation(line: 130, column: 33, scope: !412)
!424 = !DILocalVariable(name: "val1", scope: !397, file: !320, line: 125, type: !60)
!425 = !DILocation(line: 131, column: 9, scope: !412)
!426 = !DILocation(line: 133, column: 14, scope: !427)
!427 = distinct !DILexicalBlock(scope: !412, file: !320, line: 133, column: 9)
!428 = !DILocation(line: 134, column: 12, scope: !427)
!429 = !DILocation(line: 134, column: 7, scope: !427)
!430 = !DILocation(line: 134, column: 16, scope: !427)
!431 = !DILocation(line: 135, column: 13, scope: !432)
!432 = distinct !DILexicalBlock(scope: !412, file: !320, line: 135, column: 9)
!433 = !DILocation(line: 135, column: 19, scope: !432)
!434 = !DILocation(line: 136, column: 12, scope: !432)
!435 = !DILocation(line: 136, column: 7, scope: !432)
!436 = !DILocation(line: 136, column: 16, scope: !432)
!437 = !DILocation(line: 0, scope: !412)
!438 = distinct !{!438, !408, !439, !107}
!439 = !DILocation(line: 137, column: 3, scope: !397)
!440 = !DILocation(line: 139, column: 3, scope: !397)
!441 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_indcpa_keypair_derand", scope: !320, file: !320, line: 205, type: !442, scopeLine: 207, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !58, retainedNodes: !24)
!442 = !DISubroutineType(types: !443)
!443 = !{null, !6, !6, !234}
!444 = !DILocalVariable(name: "pk", arg: 1, scope: !441, file: !320, line: 205, type: !6)
!445 = !DILocation(line: 0, scope: !441)
!446 = !DILocalVariable(name: "sk", arg: 2, scope: !441, file: !320, line: 206, type: !6)
!447 = !DILocalVariable(name: "coins", arg: 3, scope: !441, file: !320, line: 207, type: !234)
!448 = !DILocalVariable(name: "buf", scope: !441, file: !320, line: 209, type: !255)
!449 = !DILocation(line: 209, column: 11, scope: !441)
!450 = !DILocalVariable(name: "publicseed", scope: !441, file: !320, line: 210, type: !234)
!451 = !DILocation(line: 211, column: 34, scope: !441)
!452 = !DILocalVariable(name: "noiseseed", scope: !441, file: !320, line: 211, type: !234)
!453 = !DILocalVariable(name: "nonce", scope: !441, file: !320, line: 212, type: !7)
!454 = !DILocalVariable(name: "a", scope: !441, file: !320, line: 213, type: !455)
!455 = !DICompositeType(tag: DW_TAG_array_type, baseType: !324, size: 65536, elements: !332)
!456 = !DILocation(line: 213, column: 11, scope: !441)
!457 = !DILocalVariable(name: "e", scope: !441, file: !320, line: 213, type: !324)
!458 = !DILocation(line: 213, column: 23, scope: !441)
!459 = !DILocalVariable(name: "pkpv", scope: !441, file: !320, line: 213, type: !324)
!460 = !DILocation(line: 213, column: 26, scope: !441)
!461 = !DILocalVariable(name: "skpv", scope: !441, file: !320, line: 213, type: !324)
!462 = !DILocation(line: 213, column: 32, scope: !441)
!463 = !DILocation(line: 215, column: 3, scope: !441)
!464 = !DILocation(line: 216, column: 3, scope: !441)
!465 = !DILocation(line: 216, column: 23, scope: !441)
!466 = !DILocation(line: 217, column: 3, scope: !441)
!467 = !DILocation(line: 219, column: 3, scope: !441)
!468 = !DILocalVariable(name: "i", scope: !441, file: !320, line: 208, type: !14)
!469 = !DILocation(line: 221, column: 8, scope: !470)
!470 = distinct !DILexicalBlock(scope: !441, file: !320, line: 221, column: 3)
!471 = !DILocation(line: 221, scope: !470)
!472 = !DILocation(line: 221, column: 17, scope: !473)
!473 = distinct !DILexicalBlock(scope: !470, file: !320, line: 221, column: 3)
!474 = !DILocation(line: 221, column: 3, scope: !470)
!475 = !DILocation(line: 223, column: 3, scope: !476)
!476 = distinct !DILexicalBlock(scope: !441, file: !320, line: 223, column: 3)
!477 = !DILocation(line: 222, column: 25, scope: !473)
!478 = !DILocation(line: 222, column: 5, scope: !473)
!479 = !DILocation(line: 222, column: 50, scope: !473)
!480 = !DILocation(line: 221, column: 29, scope: !473)
!481 = !DILocation(line: 221, column: 3, scope: !473)
!482 = distinct !{!482, !474, !483, !107}
!483 = !DILocation(line: 222, column: 52, scope: !470)
!484 = !DILocation(line: 223, scope: !476)
!485 = !DILocation(line: 223, column: 17, scope: !486)
!486 = distinct !DILexicalBlock(scope: !476, file: !320, line: 223, column: 3)
!487 = !DILocation(line: 224, column: 25, scope: !486)
!488 = !DILocation(line: 224, column: 5, scope: !486)
!489 = !DILocation(line: 224, column: 47, scope: !486)
!490 = !DILocation(line: 223, column: 29, scope: !486)
!491 = !DILocation(line: 223, column: 3, scope: !486)
!492 = distinct !{!492, !475, !493, !107}
!493 = !DILocation(line: 224, column: 49, scope: !476)
!494 = !DILocation(line: 226, column: 3, scope: !441)
!495 = !DILocation(line: 227, column: 3, scope: !441)
!496 = !DILocation(line: 230, column: 8, scope: !497)
!497 = distinct !DILexicalBlock(scope: !441, file: !320, line: 230, column: 3)
!498 = !DILocation(line: 230, scope: !497)
!499 = !DILocation(line: 230, column: 17, scope: !500)
!500 = distinct !DILexicalBlock(scope: !497, file: !320, line: 230, column: 3)
!501 = !DILocation(line: 230, column: 3, scope: !497)
!502 = !DILocation(line: 231, column: 37, scope: !503)
!503 = distinct !DILexicalBlock(scope: !500, file: !320, line: 230, column: 33)
!504 = !DILocation(line: 231, column: 47, scope: !503)
!505 = !DILocation(line: 231, column: 5, scope: !503)
!506 = !DILocation(line: 232, column: 18, scope: !503)
!507 = !DILocation(line: 232, column: 5, scope: !503)
!508 = !DILocation(line: 230, column: 29, scope: !500)
!509 = !DILocation(line: 230, column: 3, scope: !500)
!510 = distinct !{!510, !501, !511, !107}
!511 = !DILocation(line: 233, column: 3, scope: !497)
!512 = !DILocation(line: 235, column: 3, scope: !441)
!513 = !DILocation(line: 236, column: 3, scope: !441)
!514 = !DILocation(line: 238, column: 3, scope: !441)
!515 = !DILocation(line: 239, column: 3, scope: !441)
!516 = !DILocation(line: 240, column: 1, scope: !441)
!517 = distinct !DISubprogram(name: "pack_sk", scope: !320, file: !320, line: 55, type: !518, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !58, retainedNodes: !24)
!518 = !DISubroutineType(types: !519)
!519 = !{null, !6, !323}
!520 = !DILocalVariable(name: "r", arg: 1, scope: !517, file: !320, line: 55, type: !6)
!521 = !DILocation(line: 0, scope: !517)
!522 = !DILocalVariable(name: "sk", arg: 2, scope: !517, file: !320, line: 55, type: !323)
!523 = !DILocation(line: 56, column: 3, scope: !517)
!524 = !DILocation(line: 57, column: 1, scope: !517)
!525 = distinct !DISubprogram(name: "pack_pk", scope: !320, file: !320, line: 23, type: !526, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !58, retainedNodes: !24)
!526 = !DISubroutineType(types: !527)
!527 = !{null, !6, !323, !234}
!528 = !DILocalVariable(name: "r", arg: 1, scope: !525, file: !320, line: 23, type: !6)
!529 = !DILocation(line: 0, scope: !525)
!530 = !DILocalVariable(name: "pk", arg: 2, scope: !525, file: !320, line: 23, type: !323)
!531 = !DILocalVariable(name: "seed", arg: 3, scope: !525, file: !320, line: 24, type: !234)
!532 = !DILocation(line: 25, column: 3, scope: !525)
!533 = !DILocation(line: 26, column: 12, scope: !525)
!534 = !DILocation(line: 26, column: 3, scope: !525)
!535 = !DILocation(line: 27, column: 1, scope: !525)
!536 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_indcpa_enc", scope: !320, file: !320, line: 257, type: !537, scopeLine: 260, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !58, retainedNodes: !24)
!537 = !DISubroutineType(types: !538)
!538 = !{null, !6, !234, !234, !234}
!539 = !DILocalVariable(name: "c", arg: 1, scope: !536, file: !320, line: 257, type: !6)
!540 = !DILocation(line: 0, scope: !536)
!541 = !DILocalVariable(name: "m", arg: 2, scope: !536, file: !320, line: 258, type: !234)
!542 = !DILocalVariable(name: "pk", arg: 3, scope: !536, file: !320, line: 259, type: !234)
!543 = !DILocalVariable(name: "coins", arg: 4, scope: !536, file: !320, line: 260, type: !234)
!544 = !DILocalVariable(name: "seed", scope: !536, file: !320, line: 262, type: !123)
!545 = !DILocation(line: 262, column: 11, scope: !536)
!546 = !DILocalVariable(name: "nonce", scope: !536, file: !320, line: 263, type: !7)
!547 = !DILocalVariable(name: "sp", scope: !536, file: !320, line: 264, type: !324)
!548 = !DILocation(line: 264, column: 11, scope: !536)
!549 = !DILocalVariable(name: "pkpv", scope: !536, file: !320, line: 264, type: !324)
!550 = !DILocation(line: 264, column: 15, scope: !536)
!551 = !DILocalVariable(name: "ep", scope: !536, file: !320, line: 264, type: !324)
!552 = !DILocation(line: 264, column: 21, scope: !536)
!553 = !DILocalVariable(name: "at", scope: !536, file: !320, line: 264, type: !455)
!554 = !DILocation(line: 264, column: 25, scope: !536)
!555 = !DILocalVariable(name: "b", scope: !536, file: !320, line: 264, type: !324)
!556 = !DILocation(line: 264, column: 38, scope: !536)
!557 = !DILocalVariable(name: "v", scope: !536, file: !320, line: 265, type: !327)
!558 = !DILocation(line: 265, column: 8, scope: !536)
!559 = !DILocalVariable(name: "k", scope: !536, file: !320, line: 265, type: !327)
!560 = !DILocation(line: 265, column: 11, scope: !536)
!561 = !DILocalVariable(name: "epp", scope: !536, file: !320, line: 265, type: !327)
!562 = !DILocation(line: 265, column: 14, scope: !536)
!563 = !DILocation(line: 267, column: 3, scope: !536)
!564 = !DILocation(line: 268, column: 3, scope: !536)
!565 = !DILocation(line: 269, column: 3, scope: !536)
!566 = !DILocalVariable(name: "i", scope: !536, file: !320, line: 261, type: !14)
!567 = !DILocation(line: 271, column: 8, scope: !568)
!568 = distinct !DILexicalBlock(scope: !536, file: !320, line: 271, column: 3)
!569 = !DILocation(line: 271, scope: !568)
!570 = !DILocation(line: 271, column: 17, scope: !571)
!571 = distinct !DILexicalBlock(scope: !568, file: !320, line: 271, column: 3)
!572 = !DILocation(line: 271, column: 3, scope: !568)
!573 = !DILocation(line: 273, column: 3, scope: !574)
!574 = distinct !DILexicalBlock(scope: !536, file: !320, line: 273, column: 3)
!575 = !DILocation(line: 272, column: 27, scope: !571)
!576 = !DILocation(line: 272, column: 5, scope: !571)
!577 = !DILocation(line: 272, column: 44, scope: !571)
!578 = !DILocation(line: 271, column: 29, scope: !571)
!579 = !DILocation(line: 271, column: 3, scope: !571)
!580 = distinct !{!580, !572, !581, !107}
!581 = !DILocation(line: 272, column: 46, scope: !568)
!582 = !DILocation(line: 273, scope: !574)
!583 = !DILocation(line: 273, column: 17, scope: !584)
!584 = distinct !DILexicalBlock(scope: !574, file: !320, line: 273, column: 3)
!585 = !DILocation(line: 274, column: 27, scope: !584)
!586 = !DILocation(line: 274, column: 5, scope: !584)
!587 = !DILocation(line: 274, column: 44, scope: !584)
!588 = !DILocation(line: 273, column: 29, scope: !584)
!589 = !DILocation(line: 273, column: 3, scope: !584)
!590 = distinct !{!590, !573, !591, !107}
!591 = !DILocation(line: 274, column: 46, scope: !574)
!592 = !DILocation(line: 275, column: 3, scope: !536)
!593 = !DILocation(line: 277, column: 3, scope: !536)
!594 = !DILocation(line: 280, column: 8, scope: !595)
!595 = distinct !DILexicalBlock(scope: !536, file: !320, line: 280, column: 3)
!596 = !DILocation(line: 280, scope: !595)
!597 = !DILocation(line: 280, column: 17, scope: !598)
!598 = distinct !DILexicalBlock(scope: !595, file: !320, line: 280, column: 3)
!599 = !DILocation(line: 280, column: 3, scope: !595)
!600 = !DILocation(line: 281, column: 37, scope: !598)
!601 = !DILocation(line: 281, column: 44, scope: !598)
!602 = !DILocation(line: 281, column: 5, scope: !598)
!603 = !DILocation(line: 280, column: 29, scope: !598)
!604 = !DILocation(line: 280, column: 3, scope: !598)
!605 = distinct !{!605, !599, !606, !107}
!606 = !DILocation(line: 281, column: 54, scope: !595)
!607 = !DILocation(line: 283, column: 3, scope: !536)
!608 = !DILocation(line: 285, column: 3, scope: !536)
!609 = !DILocation(line: 286, column: 3, scope: !536)
!610 = !DILocation(line: 288, column: 3, scope: !536)
!611 = !DILocation(line: 289, column: 3, scope: !536)
!612 = !DILocation(line: 290, column: 3, scope: !536)
!613 = !DILocation(line: 291, column: 3, scope: !536)
!614 = !DILocation(line: 292, column: 3, scope: !536)
!615 = !DILocation(line: 294, column: 3, scope: !536)
!616 = !DILocation(line: 295, column: 1, scope: !536)
!617 = distinct !DISubprogram(name: "unpack_pk", scope: !320, file: !320, line: 40, type: !618, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !58, retainedNodes: !24)
!618 = !DISubroutineType(types: !619)
!619 = !{null, !323, !6, !234}
!620 = !DILocalVariable(name: "pk", arg: 1, scope: !617, file: !320, line: 40, type: !323)
!621 = !DILocation(line: 0, scope: !617)
!622 = !DILocalVariable(name: "seed", arg: 2, scope: !617, file: !320, line: 40, type: !6)
!623 = !DILocalVariable(name: "packedpk", arg: 3, scope: !617, file: !320, line: 41, type: !234)
!624 = !DILocation(line: 42, column: 3, scope: !617)
!625 = !DILocation(line: 43, column: 25, scope: !617)
!626 = !DILocation(line: 43, column: 3, scope: !617)
!627 = !DILocation(line: 44, column: 1, scope: !617)
!628 = distinct !DISubprogram(name: "pack_ciphertext", scope: !320, file: !320, line: 85, type: !629, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !58, retainedNodes: !24)
!629 = !DISubroutineType(types: !630)
!630 = !{null, !6, !323, !631}
!631 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !327, size: 32)
!632 = !DILocalVariable(name: "r", arg: 1, scope: !628, file: !320, line: 85, type: !6)
!633 = !DILocation(line: 0, scope: !628)
!634 = !DILocalVariable(name: "b", arg: 2, scope: !628, file: !320, line: 85, type: !323)
!635 = !DILocalVariable(name: "v", arg: 3, scope: !628, file: !320, line: 86, type: !631)
!636 = !DILocation(line: 87, column: 3, scope: !628)
!637 = !DILocation(line: 88, column: 19, scope: !628)
!638 = !DILocation(line: 88, column: 3, scope: !628)
!639 = !DILocation(line: 89, column: 1, scope: !628)
!640 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_indcpa_dec", scope: !320, file: !320, line: 310, type: !641, scopeLine: 312, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !58, retainedNodes: !24)
!641 = !DISubroutineType(types: !642)
!642 = !{null, !6, !234, !234}
!643 = !DILocalVariable(name: "m", arg: 1, scope: !640, file: !320, line: 310, type: !6)
!644 = !DILocation(line: 0, scope: !640)
!645 = !DILocalVariable(name: "c", arg: 2, scope: !640, file: !320, line: 311, type: !234)
!646 = !DILocalVariable(name: "sk", arg: 3, scope: !640, file: !320, line: 312, type: !234)
!647 = !DILocalVariable(name: "b", scope: !640, file: !320, line: 313, type: !324)
!648 = !DILocation(line: 313, column: 11, scope: !640)
!649 = !DILocalVariable(name: "skpv", scope: !640, file: !320, line: 313, type: !324)
!650 = !DILocation(line: 313, column: 14, scope: !640)
!651 = !DILocalVariable(name: "v", scope: !640, file: !320, line: 314, type: !327)
!652 = !DILocation(line: 314, column: 8, scope: !640)
!653 = !DILocalVariable(name: "mp", scope: !640, file: !320, line: 314, type: !327)
!654 = !DILocation(line: 314, column: 11, scope: !640)
!655 = !DILocation(line: 316, column: 3, scope: !640)
!656 = !DILocation(line: 317, column: 3, scope: !640)
!657 = !DILocation(line: 319, column: 3, scope: !640)
!658 = !DILocation(line: 320, column: 3, scope: !640)
!659 = !DILocation(line: 321, column: 3, scope: !640)
!660 = !DILocation(line: 323, column: 3, scope: !640)
!661 = !DILocation(line: 324, column: 3, scope: !640)
!662 = !DILocation(line: 326, column: 3, scope: !640)
!663 = !DILocation(line: 327, column: 1, scope: !640)
!664 = distinct !DISubprogram(name: "unpack_ciphertext", scope: !320, file: !320, line: 101, type: !665, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !58, retainedNodes: !24)
!665 = !DISubroutineType(types: !666)
!666 = !{null, !323, !631, !234}
!667 = !DILocalVariable(name: "b", arg: 1, scope: !664, file: !320, line: 101, type: !323)
!668 = !DILocation(line: 0, scope: !664)
!669 = !DILocalVariable(name: "v", arg: 2, scope: !664, file: !320, line: 101, type: !631)
!670 = !DILocalVariable(name: "c", arg: 3, scope: !664, file: !320, line: 102, type: !234)
!671 = !DILocation(line: 103, column: 3, scope: !664)
!672 = !DILocation(line: 104, column: 24, scope: !664)
!673 = !DILocation(line: 104, column: 3, scope: !664)
!674 = !DILocation(line: 105, column: 1, scope: !664)
!675 = distinct !DISubprogram(name: "unpack_sk", scope: !320, file: !320, line: 69, type: !676, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !58, retainedNodes: !24)
!676 = !DISubroutineType(types: !677)
!677 = !{null, !323, !234}
!678 = !DILocalVariable(name: "sk", arg: 1, scope: !675, file: !320, line: 69, type: !323)
!679 = !DILocation(line: 0, scope: !675)
!680 = !DILocalVariable(name: "packedsk", arg: 2, scope: !675, file: !320, line: 70, type: !234)
!681 = !DILocation(line: 71, column: 3, scope: !675)
!682 = !DILocation(line: 72, column: 1, scope: !675)
!683 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_compress", scope: !684, file: !684, line: 15, type: !685, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!684 = !DIFile(filename: "../../../ref/polyvec.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!685 = !DISubroutineType(types: !686)
!686 = !{null, !6, !687}
!687 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !688, size: 32)
!688 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !324)
!689 = !DILocalVariable(name: "r", arg: 1, scope: !683, file: !684, line: 15, type: !6)
!690 = !DILocation(line: 0, scope: !683)
!691 = !DILocalVariable(name: "a", arg: 2, scope: !683, file: !684, line: 16, type: !687)
!692 = !DILocalVariable(name: "t", scope: !683, file: !684, line: 21, type: !693)
!693 = !DICompositeType(tag: DW_TAG_array_type, baseType: !60, size: 128, elements: !694)
!694 = !{!695}
!695 = !DISubrange(count: 8)
!696 = !DILocation(line: 21, column: 12, scope: !683)
!697 = !DILocalVariable(name: "i", scope: !683, file: !684, line: 17, type: !14)
!698 = !DILocation(line: 22, column: 8, scope: !699)
!699 = distinct !DILexicalBlock(scope: !683, file: !684, line: 22, column: 3)
!700 = !DILocation(line: 22, scope: !699)
!701 = !DILocation(line: 22, column: 17, scope: !702)
!702 = distinct !DILexicalBlock(scope: !699, file: !684, line: 22, column: 3)
!703 = !DILocation(line: 22, column: 3, scope: !699)
!704 = !DILocation(line: 23, column: 5, scope: !705)
!705 = distinct !DILexicalBlock(scope: !706, file: !684, line: 23, column: 5)
!706 = distinct !DILexicalBlock(scope: !702, file: !684, line: 22, column: 33)
!707 = !DILocation(line: 23, scope: !705)
!708 = !DILocalVariable(name: "j", scope: !683, file: !684, line: 17, type: !14)
!709 = !DILocation(line: 23, column: 19, scope: !710)
!710 = distinct !DILexicalBlock(scope: !705, file: !684, line: 23, column: 5)
!711 = !DILocation(line: 24, column: 7, scope: !712)
!712 = distinct !DILexicalBlock(scope: !713, file: !684, line: 24, column: 7)
!713 = distinct !DILexicalBlock(scope: !710, file: !684, line: 23, column: 39)
!714 = !DILocation(line: 24, scope: !712)
!715 = !DILocalVariable(name: "k", scope: !683, file: !684, line: 17, type: !14)
!716 = !DILocation(line: 24, column: 21, scope: !717)
!717 = distinct !DILexicalBlock(scope: !712, file: !684, line: 24, column: 7)
!718 = !DILocation(line: 25, column: 26, scope: !719)
!719 = distinct !DILexicalBlock(scope: !717, file: !684, line: 24, column: 31)
!720 = !DILocation(line: 25, column: 30, scope: !719)
!721 = !DILocation(line: 25, column: 16, scope: !719)
!722 = !DILocation(line: 26, column: 39, scope: !719)
!723 = !DILocation(line: 26, column: 9, scope: !719)
!724 = !DILocation(line: 26, column: 14, scope: !719)
!725 = !DILocation(line: 29, column: 14, scope: !719)
!726 = !DILocalVariable(name: "d0", scope: !683, file: !684, line: 18, type: !45)
!727 = !DILocation(line: 32, column: 12, scope: !719)
!728 = !DILocation(line: 33, column: 12, scope: !719)
!729 = !DILocation(line: 34, column: 16, scope: !719)
!730 = !DILocation(line: 34, column: 9, scope: !719)
!731 = !DILocation(line: 34, column: 14, scope: !719)
!732 = !DILocation(line: 24, column: 27, scope: !717)
!733 = !DILocation(line: 24, column: 7, scope: !717)
!734 = distinct !{!734, !711, !735, !107}
!735 = !DILocation(line: 35, column: 7, scope: !712)
!736 = !DILocation(line: 37, column: 15, scope: !713)
!737 = !DILocation(line: 37, column: 14, scope: !713)
!738 = !DILocation(line: 37, column: 12, scope: !713)
!739 = !DILocation(line: 38, column: 15, scope: !713)
!740 = !DILocation(line: 38, column: 20, scope: !713)
!741 = !DILocation(line: 38, column: 29, scope: !713)
!742 = !DILocation(line: 38, column: 34, scope: !713)
!743 = !DILocation(line: 38, column: 26, scope: !713)
!744 = !DILocation(line: 38, column: 7, scope: !713)
!745 = !DILocation(line: 38, column: 12, scope: !713)
!746 = !DILocation(line: 39, column: 15, scope: !713)
!747 = !DILocation(line: 39, column: 20, scope: !713)
!748 = !DILocation(line: 39, column: 29, scope: !713)
!749 = !DILocation(line: 39, column: 34, scope: !713)
!750 = !DILocation(line: 39, column: 26, scope: !713)
!751 = !DILocation(line: 39, column: 7, scope: !713)
!752 = !DILocation(line: 39, column: 12, scope: !713)
!753 = !DILocation(line: 40, column: 15, scope: !713)
!754 = !DILocation(line: 40, column: 20, scope: !713)
!755 = !DILocation(line: 40, column: 14, scope: !713)
!756 = !DILocation(line: 40, column: 7, scope: !713)
!757 = !DILocation(line: 40, column: 12, scope: !713)
!758 = !DILocation(line: 41, column: 15, scope: !713)
!759 = !DILocation(line: 41, column: 20, scope: !713)
!760 = !DILocation(line: 41, column: 30, scope: !713)
!761 = !DILocation(line: 41, column: 35, scope: !713)
!762 = !DILocation(line: 41, column: 27, scope: !713)
!763 = !DILocation(line: 41, column: 7, scope: !713)
!764 = !DILocation(line: 41, column: 12, scope: !713)
!765 = !DILocation(line: 42, column: 15, scope: !713)
!766 = !DILocation(line: 42, column: 20, scope: !713)
!767 = !DILocation(line: 42, column: 29, scope: !713)
!768 = !DILocation(line: 42, column: 34, scope: !713)
!769 = !DILocation(line: 42, column: 26, scope: !713)
!770 = !DILocation(line: 42, column: 7, scope: !713)
!771 = !DILocation(line: 42, column: 12, scope: !713)
!772 = !DILocation(line: 43, column: 15, scope: !713)
!773 = !DILocation(line: 43, column: 20, scope: !713)
!774 = !DILocation(line: 43, column: 29, scope: !713)
!775 = !DILocation(line: 43, column: 34, scope: !713)
!776 = !DILocation(line: 43, column: 26, scope: !713)
!777 = !DILocation(line: 43, column: 7, scope: !713)
!778 = !DILocation(line: 43, column: 12, scope: !713)
!779 = !DILocation(line: 44, column: 15, scope: !713)
!780 = !DILocation(line: 44, column: 20, scope: !713)
!781 = !DILocation(line: 44, column: 14, scope: !713)
!782 = !DILocation(line: 44, column: 7, scope: !713)
!783 = !DILocation(line: 44, column: 12, scope: !713)
!784 = !DILocation(line: 45, column: 15, scope: !713)
!785 = !DILocation(line: 45, column: 20, scope: !713)
!786 = !DILocation(line: 45, column: 29, scope: !713)
!787 = !DILocation(line: 45, column: 34, scope: !713)
!788 = !DILocation(line: 45, column: 26, scope: !713)
!789 = !DILocation(line: 45, column: 7, scope: !713)
!790 = !DILocation(line: 45, column: 12, scope: !713)
!791 = !DILocation(line: 46, column: 15, scope: !713)
!792 = !DILocation(line: 46, column: 20, scope: !713)
!793 = !DILocation(line: 46, column: 29, scope: !713)
!794 = !DILocation(line: 46, column: 34, scope: !713)
!795 = !DILocation(line: 46, column: 26, scope: !713)
!796 = !DILocation(line: 46, column: 7, scope: !713)
!797 = !DILocation(line: 46, column: 12, scope: !713)
!798 = !DILocation(line: 47, column: 16, scope: !713)
!799 = !DILocation(line: 47, column: 21, scope: !713)
!800 = !DILocation(line: 47, column: 15, scope: !713)
!801 = !DILocation(line: 47, column: 7, scope: !713)
!802 = !DILocation(line: 47, column: 13, scope: !713)
!803 = !DILocation(line: 48, column: 9, scope: !713)
!804 = !DILocation(line: 23, column: 35, scope: !710)
!805 = !DILocation(line: 23, column: 5, scope: !710)
!806 = distinct !{!806, !704, !807, !107}
!807 = !DILocation(line: 49, column: 5, scope: !705)
!808 = !DILocation(line: 22, column: 29, scope: !702)
!809 = !DILocation(line: 22, column: 3, scope: !702)
!810 = distinct !{!810, !703, !811, !107}
!811 = !DILocation(line: 50, column: 3, scope: !699)
!812 = !DILocation(line: 79, column: 1, scope: !683)
!813 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_decompress", scope: !684, file: !684, line: 91, type: !676, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!814 = !DILocalVariable(name: "r", arg: 1, scope: !813, file: !684, line: 91, type: !323)
!815 = !DILocation(line: 0, scope: !813)
!816 = !DILocalVariable(name: "a", arg: 2, scope: !813, file: !684, line: 92, type: !234)
!817 = !DILocalVariable(name: "t", scope: !813, file: !684, line: 96, type: !693)
!818 = !DILocation(line: 96, column: 12, scope: !813)
!819 = !DILocalVariable(name: "i", scope: !813, file: !684, line: 93, type: !14)
!820 = !DILocation(line: 97, column: 8, scope: !821)
!821 = distinct !DILexicalBlock(scope: !813, file: !684, line: 97, column: 3)
!822 = !DILocation(line: 97, scope: !821)
!823 = !DILocation(line: 97, column: 17, scope: !824)
!824 = distinct !DILexicalBlock(scope: !821, file: !684, line: 97, column: 3)
!825 = !DILocation(line: 97, column: 3, scope: !821)
!826 = !DILocation(line: 98, column: 5, scope: !827)
!827 = distinct !DILexicalBlock(scope: !828, file: !684, line: 98, column: 5)
!828 = distinct !DILexicalBlock(scope: !824, file: !684, line: 97, column: 33)
!829 = !DILocation(line: 98, scope: !827)
!830 = !DILocalVariable(name: "j", scope: !813, file: !684, line: 93, type: !14)
!831 = !DILocation(line: 98, column: 19, scope: !832)
!832 = distinct !DILexicalBlock(scope: !827, file: !684, line: 98, column: 5)
!833 = !DILocation(line: 99, column: 15, scope: !834)
!834 = distinct !DILexicalBlock(scope: !832, file: !684, line: 98, column: 39)
!835 = !DILocation(line: 99, column: 39, scope: !834)
!836 = !DILocation(line: 99, column: 29, scope: !834)
!837 = !DILocation(line: 99, column: 44, scope: !834)
!838 = !DILocation(line: 99, column: 26, scope: !834)
!839 = !DILocation(line: 99, column: 12, scope: !834)
!840 = !DILocation(line: 100, column: 15, scope: !834)
!841 = !DILocation(line: 100, column: 20, scope: !834)
!842 = !DILocation(line: 100, column: 39, scope: !834)
!843 = !DILocation(line: 100, column: 29, scope: !834)
!844 = !DILocation(line: 100, column: 44, scope: !834)
!845 = !DILocation(line: 100, column: 26, scope: !834)
!846 = !DILocation(line: 100, column: 7, scope: !834)
!847 = !DILocation(line: 100, column: 12, scope: !834)
!848 = !DILocation(line: 101, column: 15, scope: !834)
!849 = !DILocation(line: 101, column: 20, scope: !834)
!850 = !DILocation(line: 101, column: 39, scope: !834)
!851 = !DILocation(line: 101, column: 29, scope: !834)
!852 = !DILocation(line: 101, column: 44, scope: !834)
!853 = !DILocation(line: 101, column: 26, scope: !834)
!854 = !DILocation(line: 101, column: 63, scope: !834)
!855 = !DILocation(line: 101, column: 53, scope: !834)
!856 = !DILocation(line: 101, column: 68, scope: !834)
!857 = !DILocation(line: 101, column: 50, scope: !834)
!858 = !DILocation(line: 101, column: 7, scope: !834)
!859 = !DILocation(line: 101, column: 12, scope: !834)
!860 = !DILocation(line: 102, column: 15, scope: !834)
!861 = !DILocation(line: 102, column: 20, scope: !834)
!862 = !DILocation(line: 102, column: 39, scope: !834)
!863 = !DILocation(line: 102, column: 29, scope: !834)
!864 = !DILocation(line: 102, column: 44, scope: !834)
!865 = !DILocation(line: 102, column: 26, scope: !834)
!866 = !DILocation(line: 102, column: 7, scope: !834)
!867 = !DILocation(line: 102, column: 12, scope: !834)
!868 = !DILocation(line: 103, column: 15, scope: !834)
!869 = !DILocation(line: 103, column: 20, scope: !834)
!870 = !DILocation(line: 103, column: 39, scope: !834)
!871 = !DILocation(line: 103, column: 29, scope: !834)
!872 = !DILocation(line: 103, column: 44, scope: !834)
!873 = !DILocation(line: 103, column: 26, scope: !834)
!874 = !DILocation(line: 103, column: 7, scope: !834)
!875 = !DILocation(line: 103, column: 12, scope: !834)
!876 = !DILocation(line: 104, column: 15, scope: !834)
!877 = !DILocation(line: 104, column: 20, scope: !834)
!878 = !DILocation(line: 104, column: 39, scope: !834)
!879 = !DILocation(line: 104, column: 29, scope: !834)
!880 = !DILocation(line: 104, column: 44, scope: !834)
!881 = !DILocation(line: 104, column: 26, scope: !834)
!882 = !DILocation(line: 104, column: 63, scope: !834)
!883 = !DILocation(line: 104, column: 53, scope: !834)
!884 = !DILocation(line: 104, column: 68, scope: !834)
!885 = !DILocation(line: 104, column: 50, scope: !834)
!886 = !DILocation(line: 104, column: 7, scope: !834)
!887 = !DILocation(line: 104, column: 12, scope: !834)
!888 = !DILocation(line: 105, column: 15, scope: !834)
!889 = !DILocation(line: 105, column: 20, scope: !834)
!890 = !DILocation(line: 105, column: 39, scope: !834)
!891 = !DILocation(line: 105, column: 29, scope: !834)
!892 = !DILocation(line: 105, column: 44, scope: !834)
!893 = !DILocation(line: 105, column: 26, scope: !834)
!894 = !DILocation(line: 105, column: 7, scope: !834)
!895 = !DILocation(line: 105, column: 12, scope: !834)
!896 = !DILocation(line: 106, column: 15, scope: !834)
!897 = !DILocation(line: 106, column: 20, scope: !834)
!898 = !DILocation(line: 106, column: 39, scope: !834)
!899 = !DILocation(line: 106, column: 29, scope: !834)
!900 = !DILocation(line: 106, column: 45, scope: !834)
!901 = !DILocation(line: 106, column: 26, scope: !834)
!902 = !DILocation(line: 106, column: 7, scope: !834)
!903 = !DILocation(line: 106, column: 12, scope: !834)
!904 = !DILocalVariable(name: "k", scope: !813, file: !684, line: 93, type: !14)
!905 = !DILocation(line: 109, column: 12, scope: !906)
!906 = distinct !DILexicalBlock(scope: !834, file: !684, line: 109, column: 7)
!907 = !DILocation(line: 109, scope: !906)
!908 = !DILocation(line: 109, column: 21, scope: !909)
!909 = distinct !DILexicalBlock(scope: !906, file: !684, line: 109, column: 7)
!910 = !DILocation(line: 109, column: 7, scope: !906)
!911 = !DILocation(line: 110, column: 42, scope: !909)
!912 = !DILocation(line: 110, column: 47, scope: !909)
!913 = !DILocation(line: 110, column: 56, scope: !909)
!914 = !DILocation(line: 110, column: 66, scope: !909)
!915 = !DILocation(line: 110, column: 74, scope: !909)
!916 = !DILocation(line: 110, column: 30, scope: !909)
!917 = !DILocation(line: 110, column: 19, scope: !909)
!918 = !DILocation(line: 110, column: 23, scope: !909)
!919 = !DILocation(line: 110, column: 9, scope: !909)
!920 = !DILocation(line: 110, column: 28, scope: !909)
!921 = !DILocation(line: 109, column: 27, scope: !909)
!922 = !DILocation(line: 109, column: 7, scope: !909)
!923 = distinct !{!923, !910, !924, !107}
!924 = !DILocation(line: 110, column: 77, scope: !906)
!925 = !DILocation(line: 107, column: 9, scope: !834)
!926 = !DILocation(line: 98, column: 35, scope: !832)
!927 = !DILocation(line: 98, column: 5, scope: !832)
!928 = distinct !{!928, !826, !929, !107}
!929 = !DILocation(line: 111, column: 5, scope: !827)
!930 = !DILocation(line: 97, column: 29, scope: !824)
!931 = !DILocation(line: 97, column: 3, scope: !824)
!932 = distinct !{!932, !825, !933, !107}
!933 = !DILocation(line: 112, column: 3, scope: !821)
!934 = !DILocation(line: 130, column: 1, scope: !813)
!935 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_tobytes", scope: !684, file: !684, line: 141, type: !685, scopeLine: 141, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!936 = !DILocalVariable(name: "r", arg: 1, scope: !935, file: !684, line: 141, type: !6)
!937 = !DILocation(line: 0, scope: !935)
!938 = !DILocalVariable(name: "a", arg: 2, scope: !935, file: !684, line: 141, type: !687)
!939 = !DILocalVariable(name: "i", scope: !935, file: !684, line: 142, type: !14)
!940 = !DILocation(line: 143, column: 8, scope: !941)
!941 = distinct !DILexicalBlock(scope: !935, file: !684, line: 143, column: 3)
!942 = !DILocation(line: 143, scope: !941)
!943 = !DILocation(line: 143, column: 17, scope: !944)
!944 = distinct !DILexicalBlock(scope: !941, file: !684, line: 143, column: 3)
!945 = !DILocation(line: 143, column: 3, scope: !941)
!946 = !DILocation(line: 144, column: 24, scope: !944)
!947 = !DILocation(line: 144, column: 20, scope: !944)
!948 = !DILocation(line: 144, column: 44, scope: !944)
!949 = !DILocation(line: 144, column: 5, scope: !944)
!950 = !DILocation(line: 143, column: 29, scope: !944)
!951 = !DILocation(line: 143, column: 3, scope: !944)
!952 = distinct !{!952, !945, !953, !107}
!953 = !DILocation(line: 144, column: 51, scope: !941)
!954 = !DILocation(line: 145, column: 1, scope: !935)
!955 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_frombytes", scope: !684, file: !684, line: 157, type: !676, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!956 = !DILocalVariable(name: "r", arg: 1, scope: !955, file: !684, line: 157, type: !323)
!957 = !DILocation(line: 0, scope: !955)
!958 = !DILocalVariable(name: "a", arg: 2, scope: !955, file: !684, line: 157, type: !234)
!959 = !DILocalVariable(name: "i", scope: !955, file: !684, line: 158, type: !14)
!960 = !DILocation(line: 159, column: 8, scope: !961)
!961 = distinct !DILexicalBlock(scope: !955, file: !684, line: 159, column: 3)
!962 = !DILocation(line: 159, scope: !961)
!963 = !DILocation(line: 159, column: 17, scope: !964)
!964 = distinct !DILexicalBlock(scope: !961, file: !684, line: 159, column: 3)
!965 = !DILocation(line: 159, column: 3, scope: !961)
!966 = !DILocation(line: 160, column: 21, scope: !964)
!967 = !DILocation(line: 160, column: 36, scope: !964)
!968 = !DILocation(line: 160, column: 32, scope: !964)
!969 = !DILocation(line: 160, column: 5, scope: !964)
!970 = !DILocation(line: 159, column: 29, scope: !964)
!971 = !DILocation(line: 159, column: 3, scope: !964)
!972 = distinct !{!972, !965, !973, !107}
!973 = !DILocation(line: 160, column: 53, scope: !961)
!974 = !DILocation(line: 161, column: 1, scope: !955)
!975 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_ntt", scope: !684, file: !684, line: 170, type: !976, scopeLine: 170, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!976 = !DISubroutineType(types: !977)
!977 = !{null, !323}
!978 = !DILocalVariable(name: "r", arg: 1, scope: !975, file: !684, line: 170, type: !323)
!979 = !DILocation(line: 0, scope: !975)
!980 = !DILocalVariable(name: "i", scope: !975, file: !684, line: 171, type: !14)
!981 = !DILocation(line: 172, column: 8, scope: !982)
!982 = distinct !DILexicalBlock(scope: !975, file: !684, line: 172, column: 3)
!983 = !DILocation(line: 172, scope: !982)
!984 = !DILocation(line: 172, column: 17, scope: !985)
!985 = distinct !DILexicalBlock(scope: !982, file: !684, line: 172, column: 3)
!986 = !DILocation(line: 172, column: 3, scope: !982)
!987 = !DILocation(line: 173, column: 15, scope: !985)
!988 = !DILocation(line: 173, column: 5, scope: !985)
!989 = !DILocation(line: 172, column: 29, scope: !985)
!990 = !DILocation(line: 172, column: 3, scope: !985)
!991 = distinct !{!991, !986, !992, !107}
!992 = !DILocation(line: 173, column: 22, scope: !982)
!993 = !DILocation(line: 174, column: 1, scope: !975)
!994 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_invntt_tomont", scope: !684, file: !684, line: 184, type: !976, scopeLine: 184, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!995 = !DILocalVariable(name: "r", arg: 1, scope: !994, file: !684, line: 184, type: !323)
!996 = !DILocation(line: 0, scope: !994)
!997 = !DILocalVariable(name: "i", scope: !994, file: !684, line: 185, type: !14)
!998 = !DILocation(line: 186, column: 8, scope: !999)
!999 = distinct !DILexicalBlock(scope: !994, file: !684, line: 186, column: 3)
!1000 = !DILocation(line: 186, scope: !999)
!1001 = !DILocation(line: 186, column: 17, scope: !1002)
!1002 = distinct !DILexicalBlock(scope: !999, file: !684, line: 186, column: 3)
!1003 = !DILocation(line: 186, column: 3, scope: !999)
!1004 = !DILocation(line: 187, column: 25, scope: !1002)
!1005 = !DILocation(line: 187, column: 5, scope: !1002)
!1006 = !DILocation(line: 186, column: 29, scope: !1002)
!1007 = !DILocation(line: 186, column: 3, scope: !1002)
!1008 = distinct !{!1008, !1003, !1009, !107}
!1009 = !DILocation(line: 187, column: 32, scope: !999)
!1010 = !DILocation(line: 188, column: 1, scope: !994)
!1011 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery", scope: !684, file: !684, line: 200, type: !1012, scopeLine: 201, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!1012 = !DISubroutineType(types: !1013)
!1013 = !{null, !631, !687, !687}
!1014 = !DILocalVariable(name: "r", arg: 1, scope: !1011, file: !684, line: 200, type: !631)
!1015 = !DILocation(line: 0, scope: !1011)
!1016 = !DILocalVariable(name: "a", arg: 2, scope: !1011, file: !684, line: 200, type: !687)
!1017 = !DILocalVariable(name: "b", arg: 3, scope: !1011, file: !684, line: 201, type: !687)
!1018 = !DILocalVariable(name: "t", scope: !1011, file: !684, line: 203, type: !327)
!1019 = !DILocation(line: 203, column: 8, scope: !1011)
!1020 = !DILocation(line: 205, column: 3, scope: !1011)
!1021 = !DILocalVariable(name: "i", scope: !1011, file: !684, line: 202, type: !14)
!1022 = !DILocation(line: 206, column: 8, scope: !1023)
!1023 = distinct !DILexicalBlock(scope: !1011, file: !684, line: 206, column: 3)
!1024 = !DILocation(line: 206, scope: !1023)
!1025 = !DILocation(line: 206, column: 17, scope: !1026)
!1026 = distinct !DILexicalBlock(scope: !1023, file: !684, line: 206, column: 3)
!1027 = !DILocation(line: 206, column: 3, scope: !1023)
!1028 = !DILocation(line: 207, column: 34, scope: !1029)
!1029 = distinct !DILexicalBlock(scope: !1026, file: !684, line: 206, column: 33)
!1030 = !DILocation(line: 207, column: 44, scope: !1029)
!1031 = !DILocation(line: 207, column: 5, scope: !1029)
!1032 = !DILocation(line: 208, column: 5, scope: !1029)
!1033 = !DILocation(line: 206, column: 29, scope: !1026)
!1034 = !DILocation(line: 206, column: 3, scope: !1026)
!1035 = distinct !{!1035, !1027, !1036, !107}
!1036 = !DILocation(line: 209, column: 3, scope: !1023)
!1037 = !DILocation(line: 211, column: 3, scope: !1011)
!1038 = !DILocation(line: 212, column: 1, scope: !1011)
!1039 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_reduce", scope: !684, file: !684, line: 223, type: !976, scopeLine: 223, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!1040 = !DILocalVariable(name: "r", arg: 1, scope: !1039, file: !684, line: 223, type: !323)
!1041 = !DILocation(line: 0, scope: !1039)
!1042 = !DILocalVariable(name: "i", scope: !1039, file: !684, line: 224, type: !14)
!1043 = !DILocation(line: 225, column: 8, scope: !1044)
!1044 = distinct !DILexicalBlock(scope: !1039, file: !684, line: 225, column: 3)
!1045 = !DILocation(line: 225, scope: !1044)
!1046 = !DILocation(line: 225, column: 17, scope: !1047)
!1047 = distinct !DILexicalBlock(scope: !1044, file: !684, line: 225, column: 3)
!1048 = !DILocation(line: 225, column: 3, scope: !1044)
!1049 = !DILocation(line: 226, column: 18, scope: !1047)
!1050 = !DILocation(line: 226, column: 5, scope: !1047)
!1051 = !DILocation(line: 225, column: 29, scope: !1047)
!1052 = !DILocation(line: 225, column: 3, scope: !1047)
!1053 = distinct !{!1053, !1048, !1054, !107}
!1054 = !DILocation(line: 226, column: 25, scope: !1044)
!1055 = !DILocation(line: 227, column: 1, scope: !1039)
!1056 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_add", scope: !684, file: !684, line: 238, type: !1057, scopeLine: 238, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!1057 = !DISubroutineType(types: !1058)
!1058 = !{null, !323, !687, !687}
!1059 = !DILocalVariable(name: "r", arg: 1, scope: !1056, file: !684, line: 238, type: !323)
!1060 = !DILocation(line: 0, scope: !1056)
!1061 = !DILocalVariable(name: "a", arg: 2, scope: !1056, file: !684, line: 238, type: !687)
!1062 = !DILocalVariable(name: "b", arg: 3, scope: !1056, file: !684, line: 238, type: !687)
!1063 = !DILocalVariable(name: "i", scope: !1056, file: !684, line: 239, type: !14)
!1064 = !DILocation(line: 240, column: 8, scope: !1065)
!1065 = distinct !DILexicalBlock(scope: !1056, file: !684, line: 240, column: 3)
!1066 = !DILocation(line: 240, scope: !1065)
!1067 = !DILocation(line: 240, column: 17, scope: !1068)
!1068 = distinct !DILexicalBlock(scope: !1065, file: !684, line: 240, column: 3)
!1069 = !DILocation(line: 240, column: 3, scope: !1065)
!1070 = !DILocation(line: 241, column: 15, scope: !1068)
!1071 = !DILocation(line: 241, column: 25, scope: !1068)
!1072 = !DILocation(line: 241, column: 35, scope: !1068)
!1073 = !DILocation(line: 241, column: 5, scope: !1068)
!1074 = !DILocation(line: 240, column: 29, scope: !1068)
!1075 = !DILocation(line: 240, column: 3, scope: !1068)
!1076 = distinct !{!1076, !1069, !1077, !107}
!1077 = !DILocation(line: 241, column: 42, scope: !1065)
!1078 = !DILocation(line: 242, column: 1, scope: !1056)
!1079 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_compress", scope: !1080, file: !1080, line: 19, type: !1081, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1080 = !DIFile(filename: "../../../ref/poly.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!1081 = !DISubroutineType(types: !1082)
!1082 = !{null, !6, !1083}
!1083 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1084, size: 32)
!1084 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !327)
!1085 = !DILocalVariable(name: "r", arg: 1, scope: !1079, file: !1080, line: 19, type: !6)
!1086 = !DILocation(line: 0, scope: !1079)
!1087 = !DILocalVariable(name: "a", arg: 2, scope: !1079, file: !1080, line: 19, type: !1083)
!1088 = !DILocalVariable(name: "t", scope: !1079, file: !1080, line: 23, type: !1089)
!1089 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 64, elements: !694)
!1090 = !DILocation(line: 23, column: 11, scope: !1079)
!1091 = !DILocalVariable(name: "i", scope: !1079, file: !1080, line: 20, type: !14)
!1092 = !DILocation(line: 47, column: 8, scope: !1093)
!1093 = distinct !DILexicalBlock(scope: !1079, file: !1080, line: 47, column: 3)
!1094 = !DILocation(line: 47, scope: !1093)
!1095 = !DILocation(line: 47, column: 17, scope: !1096)
!1096 = distinct !DILexicalBlock(scope: !1093, file: !1080, line: 47, column: 3)
!1097 = !DILocation(line: 47, column: 3, scope: !1093)
!1098 = !DILocation(line: 48, column: 5, scope: !1099)
!1099 = distinct !DILexicalBlock(scope: !1100, file: !1080, line: 48, column: 5)
!1100 = distinct !DILexicalBlock(scope: !1096, file: !1080, line: 47, column: 37)
!1101 = !DILocation(line: 48, scope: !1099)
!1102 = !DILocalVariable(name: "j", scope: !1079, file: !1080, line: 20, type: !14)
!1103 = !DILocation(line: 48, column: 19, scope: !1104)
!1104 = distinct !DILexicalBlock(scope: !1099, file: !1080, line: 48, column: 5)
!1105 = !DILocation(line: 50, column: 18, scope: !1106)
!1106 = distinct !DILexicalBlock(scope: !1104, file: !1080, line: 48, column: 29)
!1107 = !DILocation(line: 50, column: 22, scope: !1106)
!1108 = !DILocation(line: 50, column: 11, scope: !1106)
!1109 = !DILocalVariable(name: "u", scope: !1079, file: !1080, line: 21, type: !36)
!1110 = !DILocation(line: 51, column: 22, scope: !1106)
!1111 = !DILocation(line: 51, column: 9, scope: !1106)
!1112 = !DILocation(line: 53, column: 12, scope: !1106)
!1113 = !DILocalVariable(name: "d0", scope: !1079, file: !1080, line: 22, type: !65)
!1114 = !DILocation(line: 55, column: 10, scope: !1106)
!1115 = !DILocation(line: 56, column: 10, scope: !1106)
!1116 = !DILocation(line: 57, column: 14, scope: !1106)
!1117 = !DILocation(line: 57, column: 7, scope: !1106)
!1118 = !DILocation(line: 57, column: 12, scope: !1106)
!1119 = !DILocation(line: 48, column: 25, scope: !1104)
!1120 = !DILocation(line: 48, column: 5, scope: !1104)
!1121 = distinct !{!1121, !1098, !1122, !107}
!1122 = !DILocation(line: 58, column: 5, scope: !1099)
!1123 = !DILocation(line: 60, column: 13, scope: !1100)
!1124 = !DILocation(line: 60, column: 27, scope: !1100)
!1125 = !DILocation(line: 60, column: 32, scope: !1100)
!1126 = !DILocation(line: 60, column: 24, scope: !1100)
!1127 = !DILocation(line: 60, column: 10, scope: !1100)
!1128 = !DILocation(line: 61, column: 18, scope: !1100)
!1129 = !DILocation(line: 61, column: 27, scope: !1100)
!1130 = !DILocation(line: 61, column: 32, scope: !1100)
!1131 = !DILocation(line: 61, column: 24, scope: !1100)
!1132 = !DILocation(line: 61, column: 41, scope: !1100)
!1133 = !DILocation(line: 61, column: 46, scope: !1100)
!1134 = !DILocation(line: 61, column: 38, scope: !1100)
!1135 = !DILocation(line: 61, column: 5, scope: !1100)
!1136 = !DILocation(line: 61, column: 10, scope: !1100)
!1137 = !DILocation(line: 62, column: 18, scope: !1100)
!1138 = !DILocation(line: 62, column: 27, scope: !1100)
!1139 = !DILocation(line: 62, column: 32, scope: !1100)
!1140 = !DILocation(line: 62, column: 24, scope: !1100)
!1141 = !DILocation(line: 62, column: 5, scope: !1100)
!1142 = !DILocation(line: 62, column: 10, scope: !1100)
!1143 = !DILocation(line: 63, column: 18, scope: !1100)
!1144 = !DILocation(line: 63, column: 27, scope: !1100)
!1145 = !DILocation(line: 63, column: 32, scope: !1100)
!1146 = !DILocation(line: 63, column: 24, scope: !1100)
!1147 = !DILocation(line: 63, column: 41, scope: !1100)
!1148 = !DILocation(line: 63, column: 46, scope: !1100)
!1149 = !DILocation(line: 63, column: 38, scope: !1100)
!1150 = !DILocation(line: 63, column: 5, scope: !1100)
!1151 = !DILocation(line: 63, column: 10, scope: !1100)
!1152 = !DILocation(line: 64, column: 18, scope: !1100)
!1153 = !DILocation(line: 64, column: 27, scope: !1100)
!1154 = !DILocation(line: 64, column: 32, scope: !1100)
!1155 = !DILocation(line: 64, column: 24, scope: !1100)
!1156 = !DILocation(line: 64, column: 5, scope: !1100)
!1157 = !DILocation(line: 64, column: 10, scope: !1100)
!1158 = !DILocation(line: 65, column: 7, scope: !1100)
!1159 = !DILocation(line: 47, column: 33, scope: !1096)
!1160 = !DILocation(line: 47, column: 3, scope: !1096)
!1161 = distinct !{!1161, !1097, !1162, !107}
!1162 = !DILocation(line: 66, column: 3, scope: !1093)
!1163 = !DILocation(line: 70, column: 1, scope: !1079)
!1164 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_decompress", scope: !1080, file: !1080, line: 82, type: !1165, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1165 = !DISubroutineType(types: !1166)
!1166 = !{null, !631, !234}
!1167 = !DILocalVariable(name: "r", arg: 1, scope: !1164, file: !1080, line: 82, type: !631)
!1168 = !DILocation(line: 0, scope: !1164)
!1169 = !DILocalVariable(name: "a", arg: 2, scope: !1164, file: !1080, line: 82, type: !234)
!1170 = !DILocalVariable(name: "t", scope: !1164, file: !1080, line: 93, type: !1089)
!1171 = !DILocation(line: 93, column: 11, scope: !1164)
!1172 = !DILocalVariable(name: "i", scope: !1164, file: !1080, line: 83, type: !14)
!1173 = !DILocation(line: 94, column: 8, scope: !1174)
!1174 = distinct !DILexicalBlock(scope: !1164, file: !1080, line: 94, column: 3)
!1175 = !DILocation(line: 94, scope: !1174)
!1176 = !DILocation(line: 94, column: 17, scope: !1177)
!1177 = distinct !DILexicalBlock(scope: !1174, file: !1080, line: 94, column: 3)
!1178 = !DILocation(line: 94, column: 3, scope: !1174)
!1179 = !DILocation(line: 95, column: 13, scope: !1180)
!1180 = distinct !DILexicalBlock(scope: !1177, file: !1080, line: 94, column: 37)
!1181 = !DILocation(line: 95, column: 10, scope: !1180)
!1182 = !DILocation(line: 96, column: 27, scope: !1180)
!1183 = !DILocation(line: 96, column: 24, scope: !1180)
!1184 = !DILocation(line: 96, column: 5, scope: !1180)
!1185 = !DILocation(line: 96, column: 10, scope: !1180)
!1186 = !DILocation(line: 97, column: 18, scope: !1180)
!1187 = !DILocation(line: 97, column: 5, scope: !1180)
!1188 = !DILocation(line: 97, column: 10, scope: !1180)
!1189 = !DILocation(line: 98, column: 13, scope: !1180)
!1190 = !DILocation(line: 98, column: 27, scope: !1180)
!1191 = !DILocation(line: 98, column: 24, scope: !1180)
!1192 = !DILocation(line: 98, column: 5, scope: !1180)
!1193 = !DILocation(line: 98, column: 10, scope: !1180)
!1194 = !DILocation(line: 99, column: 27, scope: !1180)
!1195 = !DILocation(line: 99, column: 24, scope: !1180)
!1196 = !DILocation(line: 99, column: 5, scope: !1180)
!1197 = !DILocation(line: 99, column: 10, scope: !1180)
!1198 = !DILocation(line: 100, column: 18, scope: !1180)
!1199 = !DILocation(line: 100, column: 5, scope: !1180)
!1200 = !DILocation(line: 100, column: 10, scope: !1180)
!1201 = !DILocation(line: 101, column: 13, scope: !1180)
!1202 = !DILocation(line: 101, column: 27, scope: !1180)
!1203 = !DILocation(line: 101, column: 24, scope: !1180)
!1204 = !DILocation(line: 101, column: 5, scope: !1180)
!1205 = !DILocation(line: 101, column: 10, scope: !1180)
!1206 = !DILocation(line: 102, column: 18, scope: !1180)
!1207 = !DILocation(line: 102, column: 5, scope: !1180)
!1208 = !DILocation(line: 102, column: 10, scope: !1180)
!1209 = !DILocalVariable(name: "j", scope: !1164, file: !1080, line: 92, type: !14)
!1210 = !DILocation(line: 105, column: 10, scope: !1211)
!1211 = distinct !DILexicalBlock(scope: !1180, file: !1080, line: 105, column: 5)
!1212 = !DILocation(line: 105, scope: !1211)
!1213 = !DILocation(line: 105, column: 19, scope: !1214)
!1214 = distinct !DILexicalBlock(scope: !1211, file: !1080, line: 105, column: 5)
!1215 = !DILocation(line: 105, column: 5, scope: !1211)
!1216 = !DILocation(line: 106, column: 37, scope: !1214)
!1217 = !DILocation(line: 106, column: 42, scope: !1214)
!1218 = !DILocation(line: 106, column: 48, scope: !1214)
!1219 = !DILocation(line: 106, column: 58, scope: !1214)
!1220 = !DILocation(line: 106, column: 64, scope: !1214)
!1221 = !DILocation(line: 106, column: 25, scope: !1214)
!1222 = !DILocation(line: 106, column: 14, scope: !1214)
!1223 = !DILocation(line: 106, column: 18, scope: !1214)
!1224 = !DILocation(line: 106, column: 7, scope: !1214)
!1225 = !DILocation(line: 106, column: 23, scope: !1214)
!1226 = !DILocation(line: 105, column: 25, scope: !1214)
!1227 = !DILocation(line: 105, column: 5, scope: !1214)
!1228 = distinct !{!1228, !1215, !1229, !107}
!1229 = !DILocation(line: 106, column: 67, scope: !1211)
!1230 = !DILocation(line: 103, column: 7, scope: !1180)
!1231 = !DILocation(line: 94, column: 33, scope: !1177)
!1232 = !DILocation(line: 94, column: 3, scope: !1177)
!1233 = distinct !{!1233, !1178, !1234, !107}
!1234 = !DILocation(line: 107, column: 3, scope: !1174)
!1235 = !DILocation(line: 111, column: 1, scope: !1164)
!1236 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_tobytes", scope: !1080, file: !1080, line: 122, type: !1081, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1237 = !DILocalVariable(name: "r", arg: 1, scope: !1236, file: !1080, line: 122, type: !6)
!1238 = !DILocation(line: 0, scope: !1236)
!1239 = !DILocalVariable(name: "a", arg: 2, scope: !1236, file: !1080, line: 122, type: !1083)
!1240 = !DILocalVariable(name: "i", scope: !1236, file: !1080, line: 123, type: !14)
!1241 = !DILocation(line: 126, column: 8, scope: !1242)
!1242 = distinct !DILexicalBlock(scope: !1236, file: !1080, line: 126, column: 3)
!1243 = !DILocation(line: 126, scope: !1242)
!1244 = !DILocation(line: 126, column: 17, scope: !1245)
!1245 = distinct !DILexicalBlock(scope: !1242, file: !1080, line: 126, column: 3)
!1246 = !DILocation(line: 126, column: 3, scope: !1242)
!1247 = !DILocation(line: 128, column: 17, scope: !1248)
!1248 = distinct !DILexicalBlock(scope: !1245, file: !1080, line: 126, column: 37)
!1249 = !DILocation(line: 128, column: 10, scope: !1248)
!1250 = !DILocalVariable(name: "t0", scope: !1236, file: !1080, line: 124, type: !60)
!1251 = !DILocation(line: 129, column: 31, scope: !1248)
!1252 = !DILocation(line: 129, column: 8, scope: !1248)
!1253 = !DILocation(line: 130, column: 17, scope: !1248)
!1254 = !DILocation(line: 130, column: 21, scope: !1248)
!1255 = !DILocation(line: 130, column: 10, scope: !1248)
!1256 = !DILocalVariable(name: "t1", scope: !1236, file: !1080, line: 124, type: !60)
!1257 = !DILocation(line: 131, column: 31, scope: !1248)
!1258 = !DILocation(line: 131, column: 8, scope: !1248)
!1259 = !DILocation(line: 132, column: 20, scope: !1248)
!1260 = !DILocation(line: 132, column: 9, scope: !1248)
!1261 = !DILocation(line: 132, column: 5, scope: !1248)
!1262 = !DILocation(line: 132, column: 18, scope: !1248)
!1263 = !DILocation(line: 133, column: 24, scope: !1248)
!1264 = !DILocation(line: 133, column: 33, scope: !1248)
!1265 = !DILocation(line: 133, column: 36, scope: !1248)
!1266 = !DILocation(line: 133, column: 30, scope: !1248)
!1267 = !DILocation(line: 133, column: 9, scope: !1248)
!1268 = !DILocation(line: 133, column: 5, scope: !1248)
!1269 = !DILocation(line: 133, column: 18, scope: !1248)
!1270 = !DILocation(line: 134, column: 24, scope: !1248)
!1271 = !DILocation(line: 134, column: 20, scope: !1248)
!1272 = !DILocation(line: 134, column: 9, scope: !1248)
!1273 = !DILocation(line: 134, column: 5, scope: !1248)
!1274 = !DILocation(line: 134, column: 18, scope: !1248)
!1275 = !DILocation(line: 126, column: 33, scope: !1245)
!1276 = !DILocation(line: 126, column: 3, scope: !1245)
!1277 = distinct !{!1277, !1246, !1278, !107}
!1278 = !DILocation(line: 135, column: 3, scope: !1242)
!1279 = !DILocation(line: 136, column: 1, scope: !1236)
!1280 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_frombytes", scope: !1080, file: !1080, line: 148, type: !1165, scopeLine: 148, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1281 = !DILocalVariable(name: "r", arg: 1, scope: !1280, file: !1080, line: 148, type: !631)
!1282 = !DILocation(line: 0, scope: !1280)
!1283 = !DILocalVariable(name: "a", arg: 2, scope: !1280, file: !1080, line: 148, type: !234)
!1284 = !DILocalVariable(name: "i", scope: !1280, file: !1080, line: 149, type: !14)
!1285 = !DILocation(line: 150, column: 8, scope: !1286)
!1286 = distinct !DILexicalBlock(scope: !1280, file: !1080, line: 150, column: 3)
!1287 = !DILocation(line: 150, scope: !1286)
!1288 = !DILocation(line: 150, column: 17, scope: !1289)
!1289 = distinct !DILexicalBlock(scope: !1286, file: !1080, line: 150, column: 3)
!1290 = !DILocation(line: 150, column: 3, scope: !1286)
!1291 = !DILocation(line: 151, column: 25, scope: !1292)
!1292 = distinct !DILexicalBlock(scope: !1289, file: !1080, line: 150, column: 37)
!1293 = !DILocation(line: 151, column: 21, scope: !1292)
!1294 = !DILocation(line: 151, column: 57, scope: !1292)
!1295 = !DILocation(line: 151, column: 53, scope: !1292)
!1296 = !DILocation(line: 151, column: 43, scope: !1292)
!1297 = !DILocation(line: 151, column: 66, scope: !1292)
!1298 = !DILocation(line: 151, column: 73, scope: !1292)
!1299 = !DILocation(line: 151, column: 12, scope: !1292)
!1300 = !DILocation(line: 151, column: 5, scope: !1292)
!1301 = !DILocation(line: 151, column: 17, scope: !1292)
!1302 = !DILocation(line: 153, column: 15, scope: !1292)
!1303 = !DILocation(line: 153, column: 11, scope: !1292)
!1304 = !DILocation(line: 153, column: 24, scope: !1292)
!1305 = !DILocation(line: 153, column: 47, scope: !1292)
!1306 = !DILocation(line: 153, column: 43, scope: !1292)
!1307 = !DILocation(line: 153, column: 33, scope: !1292)
!1308 = !DILocation(line: 153, column: 56, scope: !1292)
!1309 = !DILocation(line: 153, column: 30, scope: !1292)
!1310 = !DILocation(line: 152, column: 12, scope: !1292)
!1311 = !DILocation(line: 152, column: 16, scope: !1292)
!1312 = !DILocation(line: 152, column: 5, scope: !1292)
!1313 = !DILocation(line: 152, column: 21, scope: !1292)
!1314 = !DILocation(line: 150, column: 33, scope: !1289)
!1315 = !DILocation(line: 150, column: 3, scope: !1289)
!1316 = distinct !{!1316, !1290, !1317, !107}
!1317 = !DILocation(line: 154, column: 3, scope: !1286)
!1318 = !DILocation(line: 155, column: 1, scope: !1280)
!1319 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_frommsg", scope: !1080, file: !1080, line: 165, type: !1165, scopeLine: 165, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1320 = !DILocalVariable(name: "r", arg: 1, scope: !1319, file: !1080, line: 165, type: !631)
!1321 = !DILocation(line: 0, scope: !1319)
!1322 = !DILocalVariable(name: "msg", arg: 2, scope: !1319, file: !1080, line: 165, type: !234)
!1323 = !DILocalVariable(name: "i", scope: !1319, file: !1080, line: 166, type: !14)
!1324 = !DILocation(line: 172, column: 8, scope: !1325)
!1325 = distinct !DILexicalBlock(scope: !1319, file: !1080, line: 172, column: 3)
!1326 = !DILocation(line: 172, scope: !1325)
!1327 = !DILocation(line: 172, column: 17, scope: !1328)
!1328 = distinct !DILexicalBlock(scope: !1325, file: !1080, line: 172, column: 3)
!1329 = !DILocation(line: 172, column: 3, scope: !1325)
!1330 = !DILocation(line: 173, column: 5, scope: !1331)
!1331 = distinct !DILexicalBlock(scope: !1332, file: !1080, line: 173, column: 5)
!1332 = distinct !DILexicalBlock(scope: !1328, file: !1080, line: 172, column: 37)
!1333 = !DILocation(line: 173, scope: !1331)
!1334 = !DILocalVariable(name: "j", scope: !1319, file: !1080, line: 166, type: !14)
!1335 = !DILocation(line: 173, column: 19, scope: !1336)
!1336 = distinct !DILexicalBlock(scope: !1331, file: !1080, line: 173, column: 5)
!1337 = !DILocation(line: 174, column: 14, scope: !1338)
!1338 = distinct !DILexicalBlock(scope: !1336, file: !1080, line: 173, column: 29)
!1339 = !DILocation(line: 174, column: 18, scope: !1338)
!1340 = !DILocation(line: 174, column: 7, scope: !1338)
!1341 = !DILocation(line: 174, column: 23, scope: !1338)
!1342 = !DILocation(line: 175, column: 23, scope: !1338)
!1343 = !DILocation(line: 175, column: 31, scope: !1338)
!1344 = !DILocation(line: 175, column: 58, scope: !1338)
!1345 = !DILocation(line: 175, column: 65, scope: !1338)
!1346 = !DILocation(line: 175, column: 57, scope: !1338)
!1347 = !DILocation(line: 175, column: 7, scope: !1338)
!1348 = !DILocation(line: 173, column: 25, scope: !1336)
!1349 = !DILocation(line: 173, column: 5, scope: !1336)
!1350 = distinct !{!1350, !1330, !1351, !107}
!1351 = !DILocation(line: 176, column: 5, scope: !1331)
!1352 = !DILocation(line: 172, column: 33, scope: !1328)
!1353 = !DILocation(line: 172, column: 3, scope: !1328)
!1354 = distinct !{!1354, !1329, !1355, !107}
!1355 = !DILocation(line: 177, column: 3, scope: !1325)
!1356 = !DILocation(line: 178, column: 1, scope: !1319)
!1357 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_tomsg", scope: !1080, file: !1080, line: 188, type: !1081, scopeLine: 188, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1358 = !DILocalVariable(name: "msg", arg: 1, scope: !1357, file: !1080, line: 188, type: !6)
!1359 = !DILocation(line: 0, scope: !1357)
!1360 = !DILocalVariable(name: "a", arg: 2, scope: !1357, file: !1080, line: 188, type: !1083)
!1361 = !DILocalVariable(name: "i", scope: !1357, file: !1080, line: 189, type: !14)
!1362 = !DILocation(line: 192, column: 8, scope: !1363)
!1363 = distinct !DILexicalBlock(scope: !1357, file: !1080, line: 192, column: 3)
!1364 = !DILocation(line: 192, scope: !1363)
!1365 = !DILocation(line: 192, column: 17, scope: !1366)
!1366 = distinct !DILexicalBlock(scope: !1363, file: !1080, line: 192, column: 3)
!1367 = !DILocation(line: 192, column: 3, scope: !1363)
!1368 = !DILocation(line: 193, column: 5, scope: !1369)
!1369 = distinct !DILexicalBlock(scope: !1366, file: !1080, line: 192, column: 37)
!1370 = !DILocation(line: 193, column: 12, scope: !1369)
!1371 = !DILocalVariable(name: "j", scope: !1357, file: !1080, line: 189, type: !14)
!1372 = !DILocation(line: 194, column: 10, scope: !1373)
!1373 = distinct !DILexicalBlock(scope: !1369, file: !1080, line: 194, column: 5)
!1374 = !DILocation(line: 194, scope: !1373)
!1375 = !DILocation(line: 194, column: 19, scope: !1376)
!1376 = distinct !DILexicalBlock(scope: !1373, file: !1080, line: 194, column: 5)
!1377 = !DILocation(line: 194, column: 5, scope: !1373)
!1378 = !DILocation(line: 195, column: 18, scope: !1379)
!1379 = distinct !DILexicalBlock(scope: !1376, file: !1080, line: 194, column: 29)
!1380 = !DILocation(line: 195, column: 22, scope: !1379)
!1381 = !DILocation(line: 195, column: 11, scope: !1379)
!1382 = !DILocalVariable(name: "t", scope: !1357, file: !1080, line: 190, type: !65)
!1383 = !DILocation(line: 200, column: 9, scope: !1379)
!1384 = !DILocation(line: 201, column: 9, scope: !1379)
!1385 = !DILocation(line: 202, column: 9, scope: !1379)
!1386 = !DILocation(line: 203, column: 19, scope: !1379)
!1387 = !DILocation(line: 203, column: 7, scope: !1379)
!1388 = !DILocation(line: 203, column: 14, scope: !1379)
!1389 = !DILocation(line: 194, column: 25, scope: !1376)
!1390 = !DILocation(line: 194, column: 5, scope: !1376)
!1391 = distinct !{!1391, !1377, !1392, !107}
!1392 = !DILocation(line: 204, column: 5, scope: !1373)
!1393 = !DILocation(line: 192, column: 33, scope: !1366)
!1394 = !DILocation(line: 192, column: 3, scope: !1366)
!1395 = distinct !{!1395, !1367, !1396, !107}
!1396 = !DILocation(line: 205, column: 3, scope: !1363)
!1397 = !DILocation(line: 206, column: 1, scope: !1357)
!1398 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_getnoise_eta1", scope: !1080, file: !1080, line: 220, type: !1399, scopeLine: 221, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1399 = !DISubroutineType(types: !1400)
!1400 = !{null, !631, !234, !7}
!1401 = !DILocalVariable(name: "r", arg: 1, scope: !1398, file: !1080, line: 220, type: !631)
!1402 = !DILocation(line: 0, scope: !1398)
!1403 = !DILocalVariable(name: "seed", arg: 2, scope: !1398, file: !1080, line: 220, type: !234)
!1404 = !DILocalVariable(name: "nonce", arg: 3, scope: !1398, file: !1080, line: 221, type: !7)
!1405 = !DILocalVariable(name: "buf", scope: !1398, file: !1080, line: 222, type: !1406)
!1406 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1024, elements: !39)
!1407 = !DILocation(line: 222, column: 11, scope: !1398)
!1408 = !DILocation(line: 223, column: 3, scope: !1398)
!1409 = !DILocation(line: 224, column: 3, scope: !1398)
!1410 = !DILocation(line: 225, column: 1, scope: !1398)
!1411 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_getnoise_eta2", scope: !1080, file: !1080, line: 239, type: !1399, scopeLine: 240, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1412 = !DILocalVariable(name: "r", arg: 1, scope: !1411, file: !1080, line: 239, type: !631)
!1413 = !DILocation(line: 0, scope: !1411)
!1414 = !DILocalVariable(name: "seed", arg: 2, scope: !1411, file: !1080, line: 239, type: !234)
!1415 = !DILocalVariable(name: "nonce", arg: 3, scope: !1411, file: !1080, line: 240, type: !7)
!1416 = !DILocalVariable(name: "buf", scope: !1411, file: !1080, line: 241, type: !1406)
!1417 = !DILocation(line: 241, column: 11, scope: !1411)
!1418 = !DILocation(line: 242, column: 3, scope: !1411)
!1419 = !DILocation(line: 243, column: 3, scope: !1411)
!1420 = !DILocation(line: 244, column: 1, scope: !1411)
!1421 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_ntt", scope: !1080, file: !1080, line: 256, type: !1422, scopeLine: 256, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1422 = !DISubroutineType(types: !1423)
!1423 = !{null, !631}
!1424 = !DILocalVariable(name: "r", arg: 1, scope: !1421, file: !1080, line: 256, type: !631)
!1425 = !DILocation(line: 0, scope: !1421)
!1426 = !DILocation(line: 257, column: 3, scope: !1421)
!1427 = !DILocation(line: 258, column: 3, scope: !1421)
!1428 = !DILocation(line: 259, column: 1, scope: !1421)
!1429 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_reduce", scope: !1080, file: !1080, line: 314, type: !1422, scopeLine: 314, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1430 = !DILocalVariable(name: "r", arg: 1, scope: !1429, file: !1080, line: 314, type: !631)
!1431 = !DILocation(line: 0, scope: !1429)
!1432 = !DILocalVariable(name: "i", scope: !1429, file: !1080, line: 315, type: !14)
!1433 = !DILocation(line: 316, column: 8, scope: !1434)
!1434 = distinct !DILexicalBlock(scope: !1429, file: !1080, line: 316, column: 3)
!1435 = !DILocation(line: 316, scope: !1434)
!1436 = !DILocation(line: 316, column: 17, scope: !1437)
!1437 = distinct !DILexicalBlock(scope: !1434, file: !1080, line: 316, column: 3)
!1438 = !DILocation(line: 316, column: 3, scope: !1434)
!1439 = !DILocation(line: 317, column: 30, scope: !1437)
!1440 = !DILocation(line: 317, column: 15, scope: !1437)
!1441 = !DILocation(line: 317, column: 5, scope: !1437)
!1442 = !DILocation(line: 317, column: 13, scope: !1437)
!1443 = !DILocation(line: 316, column: 29, scope: !1437)
!1444 = !DILocation(line: 316, column: 3, scope: !1437)
!1445 = distinct !{!1445, !1438, !1446, !107}
!1446 = !DILocation(line: 317, column: 37, scope: !1434)
!1447 = !DILocation(line: 318, column: 1, scope: !1429)
!1448 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_invntt_tomont", scope: !1080, file: !1080, line: 271, type: !1422, scopeLine: 271, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1449 = !DILocalVariable(name: "r", arg: 1, scope: !1448, file: !1080, line: 271, type: !631)
!1450 = !DILocation(line: 0, scope: !1448)
!1451 = !DILocation(line: 271, column: 36, scope: !1448)
!1452 = !DILocation(line: 271, column: 48, scope: !1448)
!1453 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_basemul_montgomery", scope: !1080, file: !1080, line: 282, type: !1454, scopeLine: 282, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1454 = !DISubroutineType(types: !1455)
!1455 = !{null, !631, !1083, !1083}
!1456 = !DILocalVariable(name: "r", arg: 1, scope: !1453, file: !1080, line: 282, type: !631)
!1457 = !DILocation(line: 0, scope: !1453)
!1458 = !DILocalVariable(name: "a", arg: 2, scope: !1453, file: !1080, line: 282, type: !1083)
!1459 = !DILocalVariable(name: "b", arg: 3, scope: !1453, file: !1080, line: 282, type: !1083)
!1460 = !DILocalVariable(name: "i", scope: !1453, file: !1080, line: 283, type: !14)
!1461 = !DILocation(line: 284, column: 8, scope: !1462)
!1462 = distinct !DILexicalBlock(scope: !1453, file: !1080, line: 284, column: 3)
!1463 = !DILocation(line: 284, scope: !1462)
!1464 = !DILocation(line: 284, column: 17, scope: !1465)
!1465 = distinct !DILexicalBlock(scope: !1462, file: !1080, line: 284, column: 3)
!1466 = !DILocation(line: 284, column: 3, scope: !1462)
!1467 = !DILocation(line: 285, column: 21, scope: !1468)
!1468 = distinct !DILexicalBlock(scope: !1465, file: !1080, line: 284, column: 37)
!1469 = !DILocation(line: 285, column: 14, scope: !1468)
!1470 = !DILocation(line: 285, column: 35, scope: !1468)
!1471 = !DILocation(line: 285, column: 28, scope: !1468)
!1472 = !DILocation(line: 285, column: 49, scope: !1468)
!1473 = !DILocation(line: 285, column: 42, scope: !1468)
!1474 = !DILocation(line: 285, column: 64, scope: !1468)
!1475 = !DILocation(line: 285, column: 55, scope: !1468)
!1476 = !DILocation(line: 285, column: 5, scope: !1468)
!1477 = !DILocation(line: 286, column: 21, scope: !1468)
!1478 = !DILocation(line: 286, column: 25, scope: !1468)
!1479 = !DILocation(line: 286, column: 14, scope: !1468)
!1480 = !DILocation(line: 286, column: 39, scope: !1468)
!1481 = !DILocation(line: 286, column: 43, scope: !1468)
!1482 = !DILocation(line: 286, column: 32, scope: !1468)
!1483 = !DILocation(line: 286, column: 57, scope: !1468)
!1484 = !DILocation(line: 286, column: 61, scope: !1468)
!1485 = !DILocation(line: 286, column: 50, scope: !1468)
!1486 = !DILocation(line: 287, column: 23, scope: !1468)
!1487 = !DILocation(line: 287, column: 14, scope: !1468)
!1488 = !DILocation(line: 287, column: 13, scope: !1468)
!1489 = !DILocation(line: 286, column: 5, scope: !1468)
!1490 = !DILocation(line: 284, column: 33, scope: !1465)
!1491 = !DILocation(line: 284, column: 3, scope: !1465)
!1492 = distinct !{!1492, !1466, !1493, !107}
!1493 = !DILocation(line: 288, column: 3, scope: !1462)
!1494 = !DILocation(line: 289, column: 1, scope: !1453)
!1495 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_tomont", scope: !1080, file: !1080, line: 299, type: !1422, scopeLine: 299, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1496 = !DILocalVariable(name: "r", arg: 1, scope: !1495, file: !1080, line: 299, type: !631)
!1497 = !DILocation(line: 0, scope: !1495)
!1498 = !DILocalVariable(name: "f", scope: !1495, file: !1080, line: 301, type: !35)
!1499 = !DILocalVariable(name: "i", scope: !1495, file: !1080, line: 300, type: !14)
!1500 = !DILocation(line: 302, column: 8, scope: !1501)
!1501 = distinct !DILexicalBlock(scope: !1495, file: !1080, line: 302, column: 3)
!1502 = !DILocation(line: 302, scope: !1501)
!1503 = !DILocation(line: 302, column: 17, scope: !1504)
!1504 = distinct !DILexicalBlock(scope: !1501, file: !1080, line: 302, column: 3)
!1505 = !DILocation(line: 302, column: 3, scope: !1501)
!1506 = !DILocation(line: 303, column: 42, scope: !1504)
!1507 = !DILocation(line: 303, column: 33, scope: !1504)
!1508 = !DILocation(line: 303, column: 50, scope: !1504)
!1509 = !DILocation(line: 303, column: 15, scope: !1504)
!1510 = !DILocation(line: 303, column: 5, scope: !1504)
!1511 = !DILocation(line: 303, column: 13, scope: !1504)
!1512 = !DILocation(line: 302, column: 29, scope: !1504)
!1513 = !DILocation(line: 302, column: 3, scope: !1504)
!1514 = distinct !{!1514, !1505, !1515, !107}
!1515 = !DILocation(line: 303, column: 53, scope: !1501)
!1516 = !DILocation(line: 304, column: 1, scope: !1495)
!1517 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_add", scope: !1080, file: !1080, line: 329, type: !1454, scopeLine: 329, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1518 = !DILocalVariable(name: "r", arg: 1, scope: !1517, file: !1080, line: 329, type: !631)
!1519 = !DILocation(line: 0, scope: !1517)
!1520 = !DILocalVariable(name: "a", arg: 2, scope: !1517, file: !1080, line: 329, type: !1083)
!1521 = !DILocalVariable(name: "b", arg: 3, scope: !1517, file: !1080, line: 329, type: !1083)
!1522 = !DILocalVariable(name: "i", scope: !1517, file: !1080, line: 330, type: !14)
!1523 = !DILocation(line: 331, column: 8, scope: !1524)
!1524 = distinct !DILexicalBlock(scope: !1517, file: !1080, line: 331, column: 3)
!1525 = !DILocation(line: 331, scope: !1524)
!1526 = !DILocation(line: 331, column: 17, scope: !1527)
!1527 = distinct !DILexicalBlock(scope: !1524, file: !1080, line: 331, column: 3)
!1528 = !DILocation(line: 331, column: 3, scope: !1524)
!1529 = !DILocation(line: 332, column: 15, scope: !1527)
!1530 = !DILocation(line: 332, column: 25, scope: !1527)
!1531 = !DILocation(line: 332, column: 23, scope: !1527)
!1532 = !DILocation(line: 332, column: 5, scope: !1527)
!1533 = !DILocation(line: 332, column: 13, scope: !1527)
!1534 = !DILocation(line: 331, column: 29, scope: !1527)
!1535 = !DILocation(line: 331, column: 3, scope: !1527)
!1536 = distinct !{!1536, !1528, !1537, !107}
!1537 = !DILocation(line: 332, column: 31, scope: !1524)
!1538 = !DILocation(line: 333, column: 1, scope: !1517)
!1539 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_sub", scope: !1080, file: !1080, line: 344, type: !1454, scopeLine: 344, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1540 = !DILocalVariable(name: "r", arg: 1, scope: !1539, file: !1080, line: 344, type: !631)
!1541 = !DILocation(line: 0, scope: !1539)
!1542 = !DILocalVariable(name: "a", arg: 2, scope: !1539, file: !1080, line: 344, type: !1083)
!1543 = !DILocalVariable(name: "b", arg: 3, scope: !1539, file: !1080, line: 344, type: !1083)
!1544 = !DILocalVariable(name: "i", scope: !1539, file: !1080, line: 345, type: !14)
!1545 = !DILocation(line: 346, column: 8, scope: !1546)
!1546 = distinct !DILexicalBlock(scope: !1539, file: !1080, line: 346, column: 3)
!1547 = !DILocation(line: 346, scope: !1546)
!1548 = !DILocation(line: 346, column: 17, scope: !1549)
!1549 = distinct !DILexicalBlock(scope: !1546, file: !1080, line: 346, column: 3)
!1550 = !DILocation(line: 346, column: 3, scope: !1546)
!1551 = !DILocation(line: 347, column: 15, scope: !1549)
!1552 = !DILocation(line: 347, column: 25, scope: !1549)
!1553 = !DILocation(line: 347, column: 23, scope: !1549)
!1554 = !DILocation(line: 347, column: 5, scope: !1549)
!1555 = !DILocation(line: 347, column: 13, scope: !1549)
!1556 = !DILocation(line: 346, column: 29, scope: !1549)
!1557 = !DILocation(line: 346, column: 3, scope: !1549)
!1558 = distinct !{!1558, !1550, !1559, !107}
!1559 = !DILocation(line: 347, column: 31, scope: !1546)
!1560 = !DILocation(line: 348, column: 1, scope: !1539)
!1561 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_ntt", scope: !33, file: !33, line: 80, type: !1562, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, retainedNodes: !24)
!1562 = !DISubroutineType(types: !1563)
!1563 = !{null, !400}
!1564 = !DILocalVariable(name: "r", arg: 1, scope: !1561, file: !33, line: 80, type: !400)
!1565 = !DILocation(line: 0, scope: !1561)
!1566 = !DILocalVariable(name: "k", scope: !1561, file: !33, line: 81, type: !14)
!1567 = !DILocalVariable(name: "len", scope: !1561, file: !33, line: 81, type: !14)
!1568 = !DILocation(line: 85, column: 7, scope: !1569)
!1569 = distinct !DILexicalBlock(scope: !1561, file: !33, line: 85, column: 3)
!1570 = !DILocation(line: 85, scope: !1569)
!1571 = !DILocation(line: 84, column: 5, scope: !1561)
!1572 = !DILocation(line: 85, column: 22, scope: !1573)
!1573 = distinct !DILexicalBlock(scope: !1569, file: !33, line: 85, column: 3)
!1574 = !DILocation(line: 85, column: 3, scope: !1569)
!1575 = !DILocation(line: 86, column: 5, scope: !1576)
!1576 = distinct !DILexicalBlock(scope: !1577, file: !33, line: 86, column: 5)
!1577 = distinct !DILexicalBlock(scope: !1573, file: !33, line: 85, column: 39)
!1578 = !DILocation(line: 86, scope: !1576)
!1579 = !DILocalVariable(name: "start", scope: !1561, file: !33, line: 81, type: !14)
!1580 = !DILocation(line: 86, column: 26, scope: !1581)
!1581 = distinct !DILexicalBlock(scope: !1576, file: !33, line: 86, column: 5)
!1582 = !DILocation(line: 87, column: 14, scope: !1583)
!1583 = distinct !DILexicalBlock(scope: !1581, file: !33, line: 86, column: 50)
!1584 = !DILocalVariable(name: "zeta", scope: !1561, file: !33, line: 82, type: !36)
!1585 = !DILocalVariable(name: "j", scope: !1561, file: !33, line: 81, type: !14)
!1586 = !DILocation(line: 88, column: 11, scope: !1587)
!1587 = distinct !DILexicalBlock(scope: !1583, file: !33, line: 88, column: 7)
!1588 = !DILocation(line: 88, scope: !1587)
!1589 = !DILocation(line: 88, column: 32, scope: !1590)
!1590 = distinct !DILexicalBlock(scope: !1587, file: !33, line: 88, column: 7)
!1591 = !DILocation(line: 88, column: 24, scope: !1590)
!1592 = !DILocation(line: 88, column: 7, scope: !1587)
!1593 = !DILocation(line: 89, column: 25, scope: !1594)
!1594 = distinct !DILexicalBlock(scope: !1590, file: !33, line: 88, column: 44)
!1595 = !DILocation(line: 89, column: 13, scope: !1594)
!1596 = !DILocalVariable(name: "t", scope: !1561, file: !33, line: 82, type: !36)
!1597 = !DILocation(line: 90, column: 22, scope: !1594)
!1598 = !DILocation(line: 90, column: 27, scope: !1594)
!1599 = !DILocation(line: 90, column: 9, scope: !1594)
!1600 = !DILocation(line: 90, column: 20, scope: !1594)
!1601 = !DILocation(line: 91, column: 16, scope: !1594)
!1602 = !DILocation(line: 91, column: 21, scope: !1594)
!1603 = !DILocation(line: 91, column: 9, scope: !1594)
!1604 = !DILocation(line: 91, column: 14, scope: !1594)
!1605 = !DILocation(line: 88, column: 40, scope: !1590)
!1606 = !DILocation(line: 88, column: 7, scope: !1590)
!1607 = distinct !{!1607, !1592, !1608, !107}
!1608 = !DILocation(line: 92, column: 7, scope: !1587)
!1609 = !DILocation(line: 87, column: 21, scope: !1583)
!1610 = !DILocation(line: 86, column: 43, scope: !1581)
!1611 = !DILocation(line: 86, column: 5, scope: !1581)
!1612 = distinct !{!1612, !1575, !1613, !107}
!1613 = !DILocation(line: 93, column: 5, scope: !1576)
!1614 = !DILocation(line: 85, column: 32, scope: !1573)
!1615 = !DILocation(line: 85, column: 3, scope: !1573)
!1616 = distinct !{!1616, !1574, !1617, !107}
!1617 = !DILocation(line: 94, column: 3, scope: !1569)
!1618 = !DILocation(line: 95, column: 1, scope: !1561)
!1619 = distinct !DISubprogram(name: "fqmul", scope: !33, file: !33, line: 68, type: !1620, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !28, retainedNodes: !24)
!1620 = !DISubroutineType(types: !1621)
!1621 = !{!36, !36, !36}
!1622 = !DILocalVariable(name: "a", arg: 1, scope: !1619, file: !33, line: 68, type: !36)
!1623 = !DILocation(line: 0, scope: !1619)
!1624 = !DILocalVariable(name: "b", arg: 2, scope: !1619, file: !33, line: 68, type: !36)
!1625 = !DILocation(line: 69, column: 28, scope: !1619)
!1626 = !DILocation(line: 69, column: 39, scope: !1619)
!1627 = !DILocation(line: 69, column: 38, scope: !1619)
!1628 = !DILocation(line: 69, column: 10, scope: !1619)
!1629 = !DILocation(line: 69, column: 3, scope: !1619)
!1630 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_invntt", scope: !33, file: !33, line: 106, type: !1562, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, retainedNodes: !24)
!1631 = !DILocalVariable(name: "r", arg: 1, scope: !1630, file: !33, line: 106, type: !400)
!1632 = !DILocation(line: 0, scope: !1630)
!1633 = !DILocalVariable(name: "f", scope: !1630, file: !33, line: 109, type: !35)
!1634 = !DILocalVariable(name: "k", scope: !1630, file: !33, line: 107, type: !14)
!1635 = !DILocalVariable(name: "len", scope: !1630, file: !33, line: 107, type: !14)
!1636 = !DILocation(line: 112, column: 7, scope: !1637)
!1637 = distinct !DILexicalBlock(scope: !1630, file: !33, line: 112, column: 3)
!1638 = !DILocation(line: 112, scope: !1637)
!1639 = !DILocation(line: 111, column: 5, scope: !1630)
!1640 = !DILocation(line: 112, column: 20, scope: !1641)
!1641 = distinct !DILexicalBlock(scope: !1637, file: !33, line: 112, column: 3)
!1642 = !DILocation(line: 112, column: 3, scope: !1637)
!1643 = !DILocation(line: 113, column: 5, scope: !1644)
!1644 = distinct !DILexicalBlock(scope: !1645, file: !33, line: 113, column: 5)
!1645 = distinct !DILexicalBlock(scope: !1641, file: !33, line: 112, column: 39)
!1646 = !DILocation(line: 124, column: 3, scope: !1647)
!1647 = distinct !DILexicalBlock(scope: !1630, file: !33, line: 124, column: 3)
!1648 = !DILocation(line: 113, scope: !1644)
!1649 = !DILocalVariable(name: "start", scope: !1630, file: !33, line: 107, type: !14)
!1650 = !DILocation(line: 113, column: 26, scope: !1651)
!1651 = distinct !DILexicalBlock(scope: !1644, file: !33, line: 113, column: 5)
!1652 = !DILocation(line: 114, column: 14, scope: !1653)
!1653 = distinct !DILexicalBlock(scope: !1651, file: !33, line: 113, column: 50)
!1654 = !DILocalVariable(name: "zeta", scope: !1630, file: !33, line: 108, type: !36)
!1655 = !DILocalVariable(name: "j", scope: !1630, file: !33, line: 107, type: !14)
!1656 = !DILocation(line: 115, column: 11, scope: !1657)
!1657 = distinct !DILexicalBlock(scope: !1653, file: !33, line: 115, column: 7)
!1658 = !DILocation(line: 115, scope: !1657)
!1659 = !DILocation(line: 115, column: 32, scope: !1660)
!1660 = distinct !DILexicalBlock(scope: !1657, file: !33, line: 115, column: 7)
!1661 = !DILocation(line: 115, column: 24, scope: !1660)
!1662 = !DILocation(line: 115, column: 7, scope: !1657)
!1663 = !DILocation(line: 116, column: 13, scope: !1664)
!1664 = distinct !DILexicalBlock(scope: !1660, file: !33, line: 115, column: 44)
!1665 = !DILocalVariable(name: "t", scope: !1630, file: !33, line: 108, type: !36)
!1666 = !DILocation(line: 117, column: 35, scope: !1664)
!1667 = !DILocation(line: 117, column: 33, scope: !1664)
!1668 = !DILocation(line: 117, column: 16, scope: !1664)
!1669 = !DILocation(line: 117, column: 9, scope: !1664)
!1670 = !DILocation(line: 117, column: 14, scope: !1664)
!1671 = !DILocation(line: 118, column: 22, scope: !1664)
!1672 = !DILocation(line: 118, column: 33, scope: !1664)
!1673 = !DILocation(line: 118, column: 9, scope: !1664)
!1674 = !DILocation(line: 118, column: 20, scope: !1664)
!1675 = !DILocation(line: 119, column: 34, scope: !1664)
!1676 = !DILocation(line: 119, column: 22, scope: !1664)
!1677 = !DILocation(line: 119, column: 9, scope: !1664)
!1678 = !DILocation(line: 119, column: 20, scope: !1664)
!1679 = !DILocation(line: 115, column: 40, scope: !1660)
!1680 = !DILocation(line: 115, column: 7, scope: !1660)
!1681 = distinct !{!1681, !1662, !1682, !107}
!1682 = !DILocation(line: 120, column: 7, scope: !1657)
!1683 = !DILocation(line: 114, column: 21, scope: !1653)
!1684 = !DILocation(line: 113, column: 43, scope: !1651)
!1685 = !DILocation(line: 113, column: 5, scope: !1651)
!1686 = distinct !{!1686, !1643, !1687, !107}
!1687 = !DILocation(line: 121, column: 5, scope: !1644)
!1688 = !DILocation(line: 112, column: 32, scope: !1641)
!1689 = !DILocation(line: 112, column: 3, scope: !1641)
!1690 = distinct !{!1690, !1642, !1691, !107}
!1691 = !DILocation(line: 122, column: 3, scope: !1637)
!1692 = !DILocation(line: 124, scope: !1647)
!1693 = !DILocation(line: 124, column: 16, scope: !1694)
!1694 = distinct !DILexicalBlock(scope: !1647, file: !33, line: 124, column: 3)
!1695 = !DILocation(line: 125, column: 18, scope: !1694)
!1696 = !DILocation(line: 125, column: 12, scope: !1694)
!1697 = !DILocation(line: 125, column: 5, scope: !1694)
!1698 = !DILocation(line: 125, column: 10, scope: !1694)
!1699 = !DILocation(line: 124, column: 24, scope: !1694)
!1700 = !DILocation(line: 124, column: 3, scope: !1694)
!1701 = distinct !{!1701, !1646, !1702, !107}
!1702 = !DILocation(line: 125, column: 25, scope: !1647)
!1703 = !DILocation(line: 126, column: 1, scope: !1630)
!1704 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_basemul", scope: !33, file: !33, line: 139, type: !1705, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, retainedNodes: !24)
!1705 = !DISubroutineType(types: !1706)
!1706 = !{null, !400, !1707, !1707, !36}
!1707 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 32)
!1708 = !DILocalVariable(name: "r", arg: 1, scope: !1704, file: !33, line: 139, type: !400)
!1709 = !DILocation(line: 0, scope: !1704)
!1710 = !DILocalVariable(name: "a", arg: 2, scope: !1704, file: !33, line: 139, type: !1707)
!1711 = !DILocalVariable(name: "b", arg: 3, scope: !1704, file: !33, line: 139, type: !1707)
!1712 = !DILocalVariable(name: "zeta", arg: 4, scope: !1704, file: !33, line: 139, type: !36)
!1713 = !DILocation(line: 141, column: 17, scope: !1704)
!1714 = !DILocation(line: 141, column: 23, scope: !1704)
!1715 = !DILocation(line: 141, column: 11, scope: !1704)
!1716 = !DILocation(line: 141, column: 9, scope: !1704)
!1717 = !DILocation(line: 142, column: 11, scope: !1704)
!1718 = !DILocation(line: 142, column: 9, scope: !1704)
!1719 = !DILocation(line: 143, column: 17, scope: !1704)
!1720 = !DILocation(line: 143, column: 23, scope: !1704)
!1721 = !DILocation(line: 143, column: 11, scope: !1704)
!1722 = !DILocation(line: 143, column: 8, scope: !1704)
!1723 = !DILocation(line: 144, column: 17, scope: !1704)
!1724 = !DILocation(line: 144, column: 23, scope: !1704)
!1725 = !DILocation(line: 144, column: 11, scope: !1704)
!1726 = !DILocation(line: 144, column: 3, scope: !1704)
!1727 = !DILocation(line: 144, column: 9, scope: !1704)
!1728 = !DILocation(line: 145, column: 17, scope: !1704)
!1729 = !DILocation(line: 145, column: 23, scope: !1704)
!1730 = !DILocation(line: 145, column: 11, scope: !1704)
!1731 = !DILocation(line: 145, column: 3, scope: !1704)
!1732 = !DILocation(line: 145, column: 8, scope: !1704)
!1733 = !DILocation(line: 146, column: 1, scope: !1704)
!1734 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_cbd_eta1", scope: !1735, file: !1735, line: 105, type: !1165, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !69, retainedNodes: !24)
!1735 = !DIFile(filename: "../../../ref/cbd.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!1736 = !DILocalVariable(name: "r", arg: 1, scope: !1734, file: !1735, line: 105, type: !631)
!1737 = !DILocation(line: 0, scope: !1734)
!1738 = !DILocalVariable(name: "buf", arg: 2, scope: !1734, file: !1735, line: 105, type: !234)
!1739 = !DILocation(line: 107, column: 3, scope: !1734)
!1740 = !DILocation(line: 113, column: 1, scope: !1734)
!1741 = distinct !DISubprogram(name: "cbd2", scope: !1735, file: !1735, line: 55, type: !1165, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !69, retainedNodes: !24)
!1742 = !DILocalVariable(name: "r", arg: 1, scope: !1741, file: !1735, line: 55, type: !631)
!1743 = !DILocation(line: 0, scope: !1741)
!1744 = !DILocalVariable(name: "buf", arg: 2, scope: !1741, file: !1735, line: 55, type: !234)
!1745 = !DILocalVariable(name: "i", scope: !1741, file: !1735, line: 56, type: !14)
!1746 = !DILocation(line: 60, column: 8, scope: !1747)
!1747 = distinct !DILexicalBlock(scope: !1741, file: !1735, line: 60, column: 3)
!1748 = !DILocation(line: 60, scope: !1747)
!1749 = !DILocation(line: 60, column: 17, scope: !1750)
!1750 = distinct !DILexicalBlock(scope: !1747, file: !1735, line: 60, column: 3)
!1751 = !DILocation(line: 60, column: 3, scope: !1747)
!1752 = !DILocation(line: 61, column: 37, scope: !1753)
!1753 = distinct !DILexicalBlock(scope: !1750, file: !1735, line: 60, column: 37)
!1754 = !DILocation(line: 61, column: 33, scope: !1753)
!1755 = !DILocation(line: 61, column: 9, scope: !1753)
!1756 = !DILocalVariable(name: "t", scope: !1741, file: !1735, line: 57, type: !65)
!1757 = !DILocation(line: 62, column: 11, scope: !1753)
!1758 = !DILocalVariable(name: "d", scope: !1741, file: !1735, line: 57, type: !65)
!1759 = !DILocation(line: 63, column: 13, scope: !1753)
!1760 = !DILocation(line: 63, column: 19, scope: !1753)
!1761 = !DILocation(line: 63, column: 7, scope: !1753)
!1762 = !DILocalVariable(name: "j", scope: !1741, file: !1735, line: 56, type: !14)
!1763 = !DILocation(line: 65, column: 10, scope: !1764)
!1764 = distinct !DILexicalBlock(scope: !1753, file: !1735, line: 65, column: 5)
!1765 = !DILocation(line: 65, scope: !1764)
!1766 = !DILocation(line: 65, column: 19, scope: !1767)
!1767 = distinct !DILexicalBlock(scope: !1764, file: !1735, line: 65, column: 5)
!1768 = !DILocation(line: 65, column: 5, scope: !1764)
!1769 = !DILocation(line: 66, column: 20, scope: !1770)
!1770 = distinct !DILexicalBlock(scope: !1767, file: !1735, line: 65, column: 29)
!1771 = !DILocation(line: 66, column: 14, scope: !1770)
!1772 = !DILocation(line: 66, column: 11, scope: !1770)
!1773 = !DILocalVariable(name: "a", scope: !1741, file: !1735, line: 58, type: !36)
!1774 = !DILocation(line: 67, column: 20, scope: !1770)
!1775 = !DILocation(line: 67, column: 24, scope: !1770)
!1776 = !DILocation(line: 67, column: 14, scope: !1770)
!1777 = !DILocation(line: 67, column: 11, scope: !1770)
!1778 = !DILocalVariable(name: "b", scope: !1741, file: !1735, line: 58, type: !36)
!1779 = !DILocation(line: 68, column: 27, scope: !1770)
!1780 = !DILocation(line: 68, column: 25, scope: !1770)
!1781 = !DILocation(line: 68, column: 14, scope: !1770)
!1782 = !DILocation(line: 68, column: 18, scope: !1770)
!1783 = !DILocation(line: 68, column: 7, scope: !1770)
!1784 = !DILocation(line: 68, column: 23, scope: !1770)
!1785 = !DILocation(line: 65, column: 25, scope: !1767)
!1786 = !DILocation(line: 65, column: 5, scope: !1767)
!1787 = distinct !{!1787, !1768, !1788, !107}
!1788 = !DILocation(line: 69, column: 5, scope: !1764)
!1789 = !DILocation(line: 60, column: 33, scope: !1750)
!1790 = !DILocation(line: 60, column: 3, scope: !1750)
!1791 = distinct !{!1791, !1751, !1792, !107}
!1792 = !DILocation(line: 70, column: 3, scope: !1747)
!1793 = !DILocation(line: 71, column: 1, scope: !1741)
!1794 = distinct !DISubprogram(name: "load32_littleendian", scope: !1735, file: !1735, line: 15, type: !1795, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !69, retainedNodes: !24)
!1795 = !DISubroutineType(types: !1796)
!1796 = !{!65, !234}
!1797 = !DILocalVariable(name: "x", arg: 1, scope: !1794, file: !1735, line: 15, type: !234)
!1798 = !DILocation(line: 0, scope: !1794)
!1799 = !DILocation(line: 17, column: 17, scope: !1794)
!1800 = !DILocation(line: 17, column: 7, scope: !1794)
!1801 = !DILocalVariable(name: "r", scope: !1794, file: !1735, line: 16, type: !65)
!1802 = !DILocation(line: 18, column: 18, scope: !1794)
!1803 = !DILocation(line: 18, column: 8, scope: !1794)
!1804 = !DILocation(line: 18, column: 23, scope: !1794)
!1805 = !DILocation(line: 18, column: 5, scope: !1794)
!1806 = !DILocation(line: 19, column: 18, scope: !1794)
!1807 = !DILocation(line: 19, column: 8, scope: !1794)
!1808 = !DILocation(line: 19, column: 23, scope: !1794)
!1809 = !DILocation(line: 19, column: 5, scope: !1794)
!1810 = !DILocation(line: 20, column: 18, scope: !1794)
!1811 = !DILocation(line: 20, column: 8, scope: !1794)
!1812 = !DILocation(line: 20, column: 23, scope: !1794)
!1813 = !DILocation(line: 20, column: 5, scope: !1794)
!1814 = !DILocation(line: 21, column: 3, scope: !1794)
!1815 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_cbd_eta2", scope: !1735, file: !1735, line: 115, type: !1165, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !69, retainedNodes: !24)
!1816 = !DILocalVariable(name: "r", arg: 1, scope: !1815, file: !1735, line: 115, type: !631)
!1817 = !DILocation(line: 0, scope: !1815)
!1818 = !DILocalVariable(name: "buf", arg: 2, scope: !1815, file: !1735, line: 115, type: !234)
!1819 = !DILocation(line: 117, column: 3, scope: !1815)
!1820 = !DILocation(line: 121, column: 1, scope: !1815)
!1821 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_montgomery_reduce", scope: !1822, file: !1822, line: 16, type: !1823, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !71, retainedNodes: !24)
!1822 = !DIFile(filename: "../../../ref/reduce.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!1823 = !DISubroutineType(types: !72)
!1824 = !DILocalVariable(name: "a", arg: 1, scope: !1821, file: !1822, line: 16, type: !30)
!1825 = !DILocation(line: 0, scope: !1821)
!1826 = !DILocalVariable(name: "t", scope: !1821, file: !1822, line: 18, type: !36)
!1827 = !DILocation(line: 21, column: 12, scope: !1821)
!1828 = !DILocation(line: 21, column: 22, scope: !1821)
!1829 = !DILocation(line: 21, column: 10, scope: !1821)
!1830 = !DILocation(line: 21, column: 32, scope: !1821)
!1831 = !DILocation(line: 21, column: 7, scope: !1821)
!1832 = !DILocation(line: 22, column: 3, scope: !1821)
!1833 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_barrett_reduce", scope: !1822, file: !1822, line: 35, type: !1834, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !71, retainedNodes: !24)
!1834 = !DISubroutineType(types: !1835)
!1835 = !{!36, !36}
!1836 = !DILocalVariable(name: "a", arg: 1, scope: !1833, file: !1822, line: 35, type: !36)
!1837 = !DILocation(line: 0, scope: !1833)
!1838 = !DILocalVariable(name: "v", scope: !1833, file: !1822, line: 37, type: !35)
!1839 = !DILocation(line: 39, column: 20, scope: !1833)
!1840 = !DILocation(line: 39, column: 19, scope: !1833)
!1841 = !DILocation(line: 39, column: 22, scope: !1833)
!1842 = !DILocation(line: 39, column: 33, scope: !1833)
!1843 = !DILocalVariable(name: "t", scope: !1833, file: !1822, line: 36, type: !36)
!1844 = !DILocation(line: 41, column: 10, scope: !1833)
!1845 = !DILocation(line: 41, column: 3, scope: !1833)
!1846 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_verify", scope: !1847, file: !1847, line: 16, type: !1848, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !73, retainedNodes: !24)
!1847 = !DIFile(filename: "../../../ref/verify.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!1848 = !DISubroutineType(types: !1849)
!1849 = !{!25, !234, !234, !12}
!1850 = !DILocalVariable(name: "a", arg: 1, scope: !1846, file: !1847, line: 16, type: !234)
!1851 = !DILocation(line: 0, scope: !1846)
!1852 = !DILocalVariable(name: "b", arg: 2, scope: !1846, file: !1847, line: 16, type: !234)
!1853 = !DILocalVariable(name: "len", arg: 3, scope: !1846, file: !1847, line: 16, type: !12)
!1854 = !DILocalVariable(name: "r", scope: !1846, file: !1847, line: 19, type: !7)
!1855 = !DILocalVariable(name: "i", scope: !1846, file: !1847, line: 18, type: !12)
!1856 = !DILocation(line: 21, column: 7, scope: !1857)
!1857 = distinct !DILexicalBlock(scope: !1846, file: !1847, line: 21, column: 3)
!1858 = !DILocation(line: 21, scope: !1857)
!1859 = !DILocation(line: 21, column: 12, scope: !1860)
!1860 = distinct !DILexicalBlock(scope: !1857, file: !1847, line: 21, column: 3)
!1861 = !DILocation(line: 21, column: 3, scope: !1857)
!1862 = !DILocation(line: 22, column: 10, scope: !1860)
!1863 = !DILocation(line: 22, column: 17, scope: !1860)
!1864 = !DILocation(line: 22, column: 15, scope: !1860)
!1865 = !DILocation(line: 22, column: 7, scope: !1860)
!1866 = !DILocation(line: 21, column: 18, scope: !1860)
!1867 = !DILocation(line: 21, column: 3, scope: !1860)
!1868 = distinct !{!1868, !1861, !1869, !107}
!1869 = !DILocation(line: 22, column: 20, scope: !1857)
!1870 = !DILocation(line: 24, column: 25, scope: !1846)
!1871 = !DILocation(line: 24, column: 10, scope: !1846)
!1872 = !DILocation(line: 24, column: 3, scope: !1846)
!1873 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_cmov", scope: !1847, file: !1847, line: 40, type: !1874, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !73, retainedNodes: !24)
!1874 = !DISubroutineType(types: !1875)
!1875 = !{null, !6, !234, !12, !7}
!1876 = !DILocalVariable(name: "r", arg: 1, scope: !1873, file: !1847, line: 40, type: !6)
!1877 = !DILocation(line: 0, scope: !1873)
!1878 = !DILocalVariable(name: "x", arg: 2, scope: !1873, file: !1847, line: 40, type: !234)
!1879 = !DILocalVariable(name: "len", arg: 3, scope: !1873, file: !1847, line: 40, type: !12)
!1880 = !DILocalVariable(name: "b", arg: 4, scope: !1873, file: !1847, line: 40, type: !7)
!1881 = !DILocation(line: 51, column: 3, scope: !1873)
!1882 = !{i64 1722}
!1883 = !DILocation(line: 54, column: 7, scope: !1873)
!1884 = !DILocalVariable(name: "i", scope: !1873, file: !1847, line: 42, type: !12)
!1885 = !DILocation(line: 55, column: 7, scope: !1886)
!1886 = distinct !DILexicalBlock(scope: !1873, file: !1847, line: 55, column: 3)
!1887 = !DILocation(line: 55, scope: !1886)
!1888 = !DILocation(line: 55, column: 12, scope: !1889)
!1889 = distinct !DILexicalBlock(scope: !1886, file: !1847, line: 55, column: 3)
!1890 = !DILocation(line: 55, column: 3, scope: !1886)
!1891 = !DILocation(line: 56, column: 18, scope: !1889)
!1892 = !DILocation(line: 56, column: 25, scope: !1889)
!1893 = !DILocation(line: 56, column: 23, scope: !1889)
!1894 = !DILocation(line: 56, column: 15, scope: !1889)
!1895 = !DILocation(line: 56, column: 5, scope: !1889)
!1896 = !DILocation(line: 56, column: 10, scope: !1889)
!1897 = !DILocation(line: 55, column: 18, scope: !1889)
!1898 = !DILocation(line: 55, column: 3, scope: !1889)
!1899 = distinct !{!1899, !1890, !1900, !107}
!1900 = !DILocation(line: 56, column: 29, scope: !1886)
!1901 = !DILocation(line: 57, column: 1, scope: !1873)
!1902 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_cmov_int16", scope: !1847, file: !1847, line: 71, type: !1903, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !73, retainedNodes: !24)
!1903 = !DISubroutineType(types: !1904)
!1904 = !{null, !400, !36, !60}
!1905 = !DILocalVariable(name: "r", arg: 1, scope: !1902, file: !1847, line: 71, type: !400)
!1906 = !DILocation(line: 0, scope: !1902)
!1907 = !DILocalVariable(name: "v", arg: 2, scope: !1902, file: !1847, line: 71, type: !36)
!1908 = !DILocalVariable(name: "b", arg: 3, scope: !1902, file: !1847, line: 71, type: !60)
!1909 = !DILocation(line: 73, column: 7, scope: !1902)
!1910 = !DILocation(line: 74, column: 15, scope: !1902)
!1911 = !DILocation(line: 74, column: 19, scope: !1902)
!1912 = !DILocation(line: 74, column: 11, scope: !1902)
!1913 = !DILocation(line: 74, column: 6, scope: !1902)
!1914 = !DILocation(line: 75, column: 1, scope: !1902)
!1915 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_init", scope: !49, file: !49, line: 497, type: !1916, scopeLine: 497, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!1916 = !DISubroutineType(types: !1917)
!1917 = !{null, !1918}
!1918 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !346, size: 32)
!1919 = !DILocalVariable(name: "state", arg: 1, scope: !1915, file: !49, line: 497, type: !1918)
!1920 = !DILocation(line: 0, scope: !1915)
!1921 = !DILocation(line: 498, column: 3, scope: !1915)
!1922 = !DILocation(line: 499, column: 3, scope: !1915)
!1923 = !DILocation(line: 499, column: 29, scope: !1915)
!1924 = !DILocation(line: 500, column: 1, scope: !1915)
!1925 = distinct !DISubprogram(name: "keccak_init", scope: !49, file: !49, line: 340, type: !1926, scopeLine: 340, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!1926 = !DISubroutineType(types: !1927)
!1927 = !{null, !1928}
!1928 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 32)
!1929 = !DILocalVariable(name: "s", arg: 1, scope: !1925, file: !49, line: 340, type: !1928)
!1930 = !DILocation(line: 0, scope: !1925)
!1931 = !DILocalVariable(name: "i", scope: !1925, file: !49, line: 341, type: !14)
!1932 = !DILocation(line: 342, column: 8, scope: !1933)
!1933 = distinct !DILexicalBlock(scope: !1925, file: !49, line: 342, column: 3)
!1934 = !DILocation(line: 342, scope: !1933)
!1935 = !DILocation(line: 342, column: 17, scope: !1936)
!1936 = distinct !DILexicalBlock(scope: !1933, file: !49, line: 342, column: 3)
!1937 = !DILocation(line: 342, column: 3, scope: !1933)
!1938 = !DILocation(line: 343, column: 5, scope: !1936)
!1939 = !DILocation(line: 343, column: 10, scope: !1936)
!1940 = !DILocation(line: 342, column: 24, scope: !1936)
!1941 = !DILocation(line: 342, column: 3, scope: !1936)
!1942 = distinct !{!1942, !1937, !1943, !107}
!1943 = !DILocation(line: 343, column: 12, scope: !1933)
!1944 = !DILocation(line: 344, column: 1, scope: !1925)
!1945 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb", scope: !49, file: !49, line: 512, type: !1946, scopeLine: 512, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!1946 = !DISubroutineType(types: !1947)
!1947 = !{null, !1918, !234, !12}
!1948 = !DILocalVariable(name: "state", arg: 1, scope: !1945, file: !49, line: 512, type: !1918)
!1949 = !DILocation(line: 0, scope: !1945)
!1950 = !DILocalVariable(name: "in", arg: 2, scope: !1945, file: !49, line: 512, type: !234)
!1951 = !DILocalVariable(name: "inlen", arg: 3, scope: !1945, file: !49, line: 512, type: !12)
!1952 = !DILocation(line: 513, column: 53, scope: !1945)
!1953 = !DILocation(line: 513, column: 31, scope: !1945)
!1954 = !DILocation(line: 513, column: 3, scope: !1945)
!1955 = !DILocation(line: 513, column: 29, scope: !1945)
!1956 = !DILocation(line: 515, column: 1, scope: !1945)
!1957 = distinct !DISubprogram(name: "keccak_absorb", scope: !49, file: !49, line: 359, type: !1958, scopeLine: 361, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!1958 = !DISubroutineType(types: !1959)
!1959 = !{!14, !1928, !14, !14, !234, !12}
!1960 = !DILocalVariable(name: "s", arg: 1, scope: !1957, file: !49, line: 359, type: !1928)
!1961 = !DILocation(line: 0, scope: !1957)
!1962 = !DILocalVariable(name: "pos", arg: 2, scope: !1957, file: !49, line: 359, type: !14)
!1963 = !DILocalVariable(name: "r", arg: 3, scope: !1957, file: !49, line: 360, type: !14)
!1964 = !DILocalVariable(name: "in", arg: 4, scope: !1957, file: !49, line: 360, type: !234)
!1965 = !DILocalVariable(name: "inlen", arg: 5, scope: !1957, file: !49, line: 361, type: !12)
!1966 = !DILocation(line: 364, column: 3, scope: !1957)
!1967 = !DILocation(line: 364, column: 14, scope: !1957)
!1968 = !DILocation(line: 364, column: 22, scope: !1957)
!1969 = !DILocation(line: 365, column: 5, scope: !1970)
!1970 = distinct !DILexicalBlock(scope: !1971, file: !49, line: 365, column: 5)
!1971 = distinct !DILexicalBlock(scope: !1957, file: !49, line: 364, column: 28)
!1972 = !DILocation(line: 372, column: 3, scope: !1973)
!1973 = distinct !DILexicalBlock(scope: !1957, file: !49, line: 372, column: 3)
!1974 = !DILocation(line: 365, scope: !1970)
!1975 = !DILocalVariable(name: "i", scope: !1957, file: !49, line: 362, type: !14)
!1976 = !DILocation(line: 365, column: 21, scope: !1977)
!1977 = distinct !DILexicalBlock(scope: !1970, file: !49, line: 365, column: 5)
!1978 = !DILocation(line: 366, column: 29, scope: !1977)
!1979 = !DILocation(line: 366, column: 19, scope: !1977)
!1980 = !DILocation(line: 366, column: 40, scope: !1977)
!1981 = !DILocation(line: 366, column: 35, scope: !1977)
!1982 = !DILocation(line: 366, column: 11, scope: !1977)
!1983 = !DILocation(line: 366, column: 7, scope: !1977)
!1984 = !DILocation(line: 366, column: 16, scope: !1977)
!1985 = !DILocation(line: 366, column: 32, scope: !1977)
!1986 = !DILocation(line: 365, column: 27, scope: !1977)
!1987 = !DILocation(line: 365, column: 5, scope: !1977)
!1988 = distinct !{!1988, !1969, !1989, !107}
!1989 = !DILocation(line: 366, column: 48, scope: !1970)
!1990 = !DILocation(line: 367, column: 16, scope: !1971)
!1991 = !DILocation(line: 367, column: 11, scope: !1971)
!1992 = !DILocation(line: 368, column: 5, scope: !1971)
!1993 = distinct !{!1993, !1966, !1994, !107}
!1994 = !DILocation(line: 370, column: 3, scope: !1957)
!1995 = !DILocation(line: 372, scope: !1973)
!1996 = !DILocation(line: 372, column: 25, scope: !1997)
!1997 = distinct !DILexicalBlock(scope: !1973, file: !49, line: 372, column: 3)
!1998 = !DILocation(line: 372, column: 19, scope: !1997)
!1999 = !DILocation(line: 373, column: 27, scope: !1997)
!2000 = !DILocation(line: 373, column: 17, scope: !1997)
!2001 = !DILocation(line: 373, column: 38, scope: !1997)
!2002 = !DILocation(line: 373, column: 33, scope: !1997)
!2003 = !DILocation(line: 373, column: 9, scope: !1997)
!2004 = !DILocation(line: 373, column: 5, scope: !1997)
!2005 = !DILocation(line: 373, column: 14, scope: !1997)
!2006 = !DILocation(line: 373, column: 30, scope: !1997)
!2007 = !DILocation(line: 372, column: 35, scope: !1997)
!2008 = !DILocation(line: 372, column: 3, scope: !1997)
!2009 = distinct !{!2009, !1972, !2010, !107}
!2010 = !DILocation(line: 373, column: 46, scope: !1973)
!2011 = !DILocation(line: 375, column: 3, scope: !1957)
!2012 = distinct !DISubprogram(name: "KeccakF1600_StatePermute", scope: !49, file: !49, line: 70, type: !1926, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2013 = !DILocalVariable(name: "state", arg: 1, scope: !2012, file: !49, line: 70, type: !1928)
!2014 = !DILocation(line: 0, scope: !2012)
!2015 = !DILocation(line: 87, column: 9, scope: !2012)
!2016 = !DILocalVariable(name: "Aba", scope: !2012, file: !49, line: 73, type: !45)
!2017 = !DILocation(line: 88, column: 9, scope: !2012)
!2018 = !DILocalVariable(name: "Abe", scope: !2012, file: !49, line: 73, type: !45)
!2019 = !DILocation(line: 89, column: 9, scope: !2012)
!2020 = !DILocalVariable(name: "Abi", scope: !2012, file: !49, line: 73, type: !45)
!2021 = !DILocation(line: 90, column: 9, scope: !2012)
!2022 = !DILocalVariable(name: "Abo", scope: !2012, file: !49, line: 73, type: !45)
!2023 = !DILocation(line: 91, column: 9, scope: !2012)
!2024 = !DILocalVariable(name: "Abu", scope: !2012, file: !49, line: 73, type: !45)
!2025 = !DILocation(line: 92, column: 9, scope: !2012)
!2026 = !DILocalVariable(name: "Aga", scope: !2012, file: !49, line: 74, type: !45)
!2027 = !DILocation(line: 93, column: 9, scope: !2012)
!2028 = !DILocalVariable(name: "Age", scope: !2012, file: !49, line: 74, type: !45)
!2029 = !DILocation(line: 94, column: 9, scope: !2012)
!2030 = !DILocalVariable(name: "Agi", scope: !2012, file: !49, line: 74, type: !45)
!2031 = !DILocation(line: 95, column: 9, scope: !2012)
!2032 = !DILocalVariable(name: "Ago", scope: !2012, file: !49, line: 74, type: !45)
!2033 = !DILocation(line: 96, column: 9, scope: !2012)
!2034 = !DILocalVariable(name: "Agu", scope: !2012, file: !49, line: 74, type: !45)
!2035 = !DILocation(line: 97, column: 9, scope: !2012)
!2036 = !DILocalVariable(name: "Aka", scope: !2012, file: !49, line: 75, type: !45)
!2037 = !DILocation(line: 98, column: 9, scope: !2012)
!2038 = !DILocalVariable(name: "Ake", scope: !2012, file: !49, line: 75, type: !45)
!2039 = !DILocation(line: 99, column: 9, scope: !2012)
!2040 = !DILocalVariable(name: "Aki", scope: !2012, file: !49, line: 75, type: !45)
!2041 = !DILocation(line: 100, column: 9, scope: !2012)
!2042 = !DILocalVariable(name: "Ako", scope: !2012, file: !49, line: 75, type: !45)
!2043 = !DILocation(line: 101, column: 9, scope: !2012)
!2044 = !DILocalVariable(name: "Aku", scope: !2012, file: !49, line: 75, type: !45)
!2045 = !DILocation(line: 102, column: 9, scope: !2012)
!2046 = !DILocalVariable(name: "Ama", scope: !2012, file: !49, line: 76, type: !45)
!2047 = !DILocation(line: 103, column: 9, scope: !2012)
!2048 = !DILocalVariable(name: "Ame", scope: !2012, file: !49, line: 76, type: !45)
!2049 = !DILocation(line: 104, column: 9, scope: !2012)
!2050 = !DILocalVariable(name: "Ami", scope: !2012, file: !49, line: 76, type: !45)
!2051 = !DILocation(line: 105, column: 9, scope: !2012)
!2052 = !DILocalVariable(name: "Amo", scope: !2012, file: !49, line: 76, type: !45)
!2053 = !DILocation(line: 106, column: 9, scope: !2012)
!2054 = !DILocalVariable(name: "Amu", scope: !2012, file: !49, line: 76, type: !45)
!2055 = !DILocation(line: 107, column: 9, scope: !2012)
!2056 = !DILocalVariable(name: "Asa", scope: !2012, file: !49, line: 77, type: !45)
!2057 = !DILocation(line: 108, column: 9, scope: !2012)
!2058 = !DILocalVariable(name: "Ase", scope: !2012, file: !49, line: 77, type: !45)
!2059 = !DILocation(line: 109, column: 9, scope: !2012)
!2060 = !DILocalVariable(name: "Asi", scope: !2012, file: !49, line: 77, type: !45)
!2061 = !DILocation(line: 110, column: 9, scope: !2012)
!2062 = !DILocalVariable(name: "Aso", scope: !2012, file: !49, line: 77, type: !45)
!2063 = !DILocation(line: 111, column: 9, scope: !2012)
!2064 = !DILocalVariable(name: "Asu", scope: !2012, file: !49, line: 77, type: !45)
!2065 = !DILocalVariable(name: "round", scope: !2012, file: !49, line: 71, type: !25)
!2066 = !DILocation(line: 113, column: 8, scope: !2067)
!2067 = distinct !DILexicalBlock(scope: !2012, file: !49, line: 113, column: 3)
!2068 = !DILocation(line: 113, scope: !2067)
!2069 = !DILocation(line: 113, column: 25, scope: !2070)
!2070 = distinct !DILexicalBlock(scope: !2067, file: !49, line: 113, column: 3)
!2071 = !DILocation(line: 113, column: 3, scope: !2067)
!2072 = !DILocalVariable(name: "BCa", scope: !2012, file: !49, line: 78, type: !45)
!2073 = !DILocalVariable(name: "BCe", scope: !2012, file: !49, line: 78, type: !45)
!2074 = !DILocalVariable(name: "BCi", scope: !2012, file: !49, line: 78, type: !45)
!2075 = !DILocalVariable(name: "BCo", scope: !2012, file: !49, line: 78, type: !45)
!2076 = !DILocalVariable(name: "BCu", scope: !2012, file: !49, line: 78, type: !45)
!2077 = !DILocalVariable(name: "Da", scope: !2012, file: !49, line: 79, type: !45)
!2078 = !DILocalVariable(name: "De", scope: !2012, file: !49, line: 79, type: !45)
!2079 = !DILocalVariable(name: "Di", scope: !2012, file: !49, line: 79, type: !45)
!2080 = !DILocalVariable(name: "Do", scope: !2012, file: !49, line: 79, type: !45)
!2081 = !DILocalVariable(name: "Du", scope: !2012, file: !49, line: 79, type: !45)
!2082 = !DILocalVariable(name: "Eba", scope: !2012, file: !49, line: 80, type: !45)
!2083 = !DILocalVariable(name: "Ebe", scope: !2012, file: !49, line: 80, type: !45)
!2084 = !DILocalVariable(name: "Ebi", scope: !2012, file: !49, line: 80, type: !45)
!2085 = !DILocalVariable(name: "Ebo", scope: !2012, file: !49, line: 80, type: !45)
!2086 = !DILocalVariable(name: "Ebu", scope: !2012, file: !49, line: 80, type: !45)
!2087 = !DILocalVariable(name: "Ega", scope: !2012, file: !49, line: 81, type: !45)
!2088 = !DILocalVariable(name: "Ege", scope: !2012, file: !49, line: 81, type: !45)
!2089 = !DILocalVariable(name: "Egi", scope: !2012, file: !49, line: 81, type: !45)
!2090 = !DILocalVariable(name: "Ego", scope: !2012, file: !49, line: 81, type: !45)
!2091 = !DILocalVariable(name: "Egu", scope: !2012, file: !49, line: 81, type: !45)
!2092 = !DILocalVariable(name: "Eka", scope: !2012, file: !49, line: 82, type: !45)
!2093 = !DILocalVariable(name: "Eke", scope: !2012, file: !49, line: 82, type: !45)
!2094 = !DILocalVariable(name: "Eki", scope: !2012, file: !49, line: 82, type: !45)
!2095 = !DILocalVariable(name: "Eko", scope: !2012, file: !49, line: 82, type: !45)
!2096 = !DILocalVariable(name: "Eku", scope: !2012, file: !49, line: 82, type: !45)
!2097 = !DILocalVariable(name: "Ema", scope: !2012, file: !49, line: 83, type: !45)
!2098 = !DILocalVariable(name: "Eme", scope: !2012, file: !49, line: 83, type: !45)
!2099 = !DILocalVariable(name: "Emi", scope: !2012, file: !49, line: 83, type: !45)
!2100 = !DILocalVariable(name: "Emo", scope: !2012, file: !49, line: 83, type: !45)
!2101 = !DILocalVariable(name: "Emu", scope: !2012, file: !49, line: 83, type: !45)
!2102 = !DILocalVariable(name: "Esa", scope: !2012, file: !49, line: 84, type: !45)
!2103 = !DILocalVariable(name: "Ese", scope: !2012, file: !49, line: 84, type: !45)
!2104 = !DILocalVariable(name: "Esi", scope: !2012, file: !49, line: 84, type: !45)
!2105 = !DILocalVariable(name: "Eso", scope: !2012, file: !49, line: 84, type: !45)
!2106 = !DILocalVariable(name: "Esu", scope: !2012, file: !49, line: 84, type: !45)
!2107 = !DILocation(line: 117, column: 15, scope: !2108)
!2108 = distinct !DILexicalBlock(scope: !2070, file: !49, line: 113, column: 48)
!2109 = !DILocation(line: 117, column: 21, scope: !2108)
!2110 = !DILocation(line: 117, column: 27, scope: !2108)
!2111 = !DILocation(line: 117, column: 33, scope: !2108)
!2112 = !DILocation(line: 119, column: 15, scope: !2108)
!2113 = !DILocation(line: 119, column: 21, scope: !2108)
!2114 = !DILocation(line: 119, column: 27, scope: !2108)
!2115 = !DILocation(line: 119, column: 33, scope: !2108)
!2116 = !DILocation(line: 125, column: 16, scope: !2108)
!2117 = !DILocation(line: 125, column: 14, scope: !2108)
!2118 = !DILocation(line: 195, column: 9, scope: !2108)
!2119 = !DILocation(line: 196, column: 11, scope: !2108)
!2120 = !DILocation(line: 116, column: 15, scope: !2108)
!2121 = !DILocation(line: 116, column: 21, scope: !2108)
!2122 = !DILocation(line: 116, column: 27, scope: !2108)
!2123 = !DILocation(line: 116, column: 33, scope: !2108)
!2124 = !DILocation(line: 122, column: 16, scope: !2108)
!2125 = !DILocation(line: 122, column: 14, scope: !2108)
!2126 = !DILocation(line: 199, column: 9, scope: !2108)
!2127 = !DILocation(line: 200, column: 11, scope: !2108)
!2128 = !DILocation(line: 118, column: 15, scope: !2108)
!2129 = !DILocation(line: 118, column: 21, scope: !2108)
!2130 = !DILocation(line: 118, column: 27, scope: !2108)
!2131 = !DILocation(line: 118, column: 33, scope: !2108)
!2132 = !DILocation(line: 115, column: 15, scope: !2108)
!2133 = !DILocation(line: 115, column: 21, scope: !2108)
!2134 = !DILocation(line: 115, column: 27, scope: !2108)
!2135 = !DILocation(line: 115, column: 33, scope: !2108)
!2136 = !DILocation(line: 126, column: 16, scope: !2108)
!2137 = !DILocation(line: 126, column: 14, scope: !2108)
!2138 = !DILocation(line: 197, column: 9, scope: !2108)
!2139 = !DILocation(line: 198, column: 11, scope: !2108)
!2140 = !DILocation(line: 204, column: 19, scope: !2108)
!2141 = !DILocation(line: 204, column: 25, scope: !2108)
!2142 = !DILocation(line: 204, column: 15, scope: !2108)
!2143 = !DILocation(line: 124, column: 16, scope: !2108)
!2144 = !DILocation(line: 124, column: 14, scope: !2108)
!2145 = !DILocation(line: 132, column: 9, scope: !2108)
!2146 = !DILocation(line: 133, column: 11, scope: !2108)
!2147 = !DILocation(line: 123, column: 16, scope: !2108)
!2148 = !DILocation(line: 123, column: 14, scope: !2108)
!2149 = !DILocation(line: 130, column: 9, scope: !2108)
!2150 = !DILocation(line: 131, column: 11, scope: !2108)
!2151 = !DILocation(line: 138, column: 19, scope: !2108)
!2152 = !DILocation(line: 138, column: 25, scope: !2108)
!2153 = !DILocation(line: 139, column: 22, scope: !2108)
!2154 = !DILocation(line: 139, column: 9, scope: !2108)
!2155 = !DILocation(line: 128, column: 9, scope: !2108)
!2156 = !DILocation(line: 145, column: 9, scope: !2108)
!2157 = !DILocation(line: 146, column: 11, scope: !2108)
!2158 = !DILocation(line: 149, column: 9, scope: !2108)
!2159 = !DILocation(line: 150, column: 11, scope: !2108)
!2160 = !DILocation(line: 147, column: 9, scope: !2108)
!2161 = !DILocation(line: 148, column: 11, scope: !2108)
!2162 = !DILocation(line: 155, column: 19, scope: !2108)
!2163 = !DILocation(line: 155, column: 25, scope: !2108)
!2164 = !DILocation(line: 155, column: 15, scope: !2108)
!2165 = !DILocation(line: 210, column: 15, scope: !2108)
!2166 = !DILocation(line: 161, column: 9, scope: !2108)
!2167 = !DILocation(line: 162, column: 11, scope: !2108)
!2168 = !DILocation(line: 165, column: 9, scope: !2108)
!2169 = !DILocation(line: 166, column: 11, scope: !2108)
!2170 = !DILocation(line: 163, column: 9, scope: !2108)
!2171 = !DILocation(line: 164, column: 11, scope: !2108)
!2172 = !DILocation(line: 171, column: 19, scope: !2108)
!2173 = !DILocation(line: 171, column: 25, scope: !2108)
!2174 = !DILocation(line: 171, column: 15, scope: !2108)
!2175 = !DILocation(line: 210, column: 21, scope: !2108)
!2176 = !DILocation(line: 177, column: 9, scope: !2108)
!2177 = !DILocation(line: 178, column: 11, scope: !2108)
!2178 = !DILocation(line: 181, column: 9, scope: !2108)
!2179 = !DILocation(line: 182, column: 11, scope: !2108)
!2180 = !DILocation(line: 179, column: 9, scope: !2108)
!2181 = !DILocation(line: 180, column: 11, scope: !2108)
!2182 = !DILocation(line: 187, column: 19, scope: !2108)
!2183 = !DILocation(line: 187, column: 25, scope: !2108)
!2184 = !DILocation(line: 187, column: 15, scope: !2108)
!2185 = !DILocation(line: 210, column: 27, scope: !2108)
!2186 = !DILocation(line: 193, column: 9, scope: !2108)
!2187 = !DILocation(line: 194, column: 11, scope: !2108)
!2188 = !DILocation(line: 203, column: 19, scope: !2108)
!2189 = !DILocation(line: 203, column: 25, scope: !2108)
!2190 = !DILocation(line: 203, column: 15, scope: !2108)
!2191 = !DILocation(line: 210, column: 33, scope: !2108)
!2192 = !DILocation(line: 136, column: 9, scope: !2108)
!2193 = !DILocation(line: 137, column: 11, scope: !2108)
!2194 = !DILocation(line: 134, column: 9, scope: !2108)
!2195 = !DILocation(line: 135, column: 11, scope: !2108)
!2196 = !DILocation(line: 141, column: 19, scope: !2108)
!2197 = !DILocation(line: 141, column: 25, scope: !2108)
!2198 = !DILocation(line: 141, column: 15, scope: !2108)
!2199 = !DILocation(line: 153, column: 9, scope: !2108)
!2200 = !DILocation(line: 154, column: 11, scope: !2108)
!2201 = !DILocation(line: 151, column: 9, scope: !2108)
!2202 = !DILocation(line: 152, column: 11, scope: !2108)
!2203 = !DILocation(line: 157, column: 19, scope: !2108)
!2204 = !DILocation(line: 157, column: 25, scope: !2108)
!2205 = !DILocation(line: 157, column: 15, scope: !2108)
!2206 = !DILocation(line: 212, column: 15, scope: !2108)
!2207 = !DILocation(line: 169, column: 9, scope: !2108)
!2208 = !DILocation(line: 170, column: 11, scope: !2108)
!2209 = !DILocation(line: 167, column: 9, scope: !2108)
!2210 = !DILocation(line: 168, column: 11, scope: !2108)
!2211 = !DILocation(line: 173, column: 19, scope: !2108)
!2212 = !DILocation(line: 173, column: 25, scope: !2108)
!2213 = !DILocation(line: 173, column: 15, scope: !2108)
!2214 = !DILocation(line: 212, column: 21, scope: !2108)
!2215 = !DILocation(line: 185, column: 9, scope: !2108)
!2216 = !DILocation(line: 186, column: 11, scope: !2108)
!2217 = !DILocation(line: 183, column: 9, scope: !2108)
!2218 = !DILocation(line: 184, column: 11, scope: !2108)
!2219 = !DILocation(line: 189, column: 19, scope: !2108)
!2220 = !DILocation(line: 189, column: 25, scope: !2108)
!2221 = !DILocation(line: 189, column: 15, scope: !2108)
!2222 = !DILocation(line: 212, column: 27, scope: !2108)
!2223 = !DILocation(line: 201, column: 9, scope: !2108)
!2224 = !DILocation(line: 202, column: 11, scope: !2108)
!2225 = !DILocation(line: 205, column: 19, scope: !2108)
!2226 = !DILocation(line: 205, column: 25, scope: !2108)
!2227 = !DILocation(line: 205, column: 15, scope: !2108)
!2228 = !DILocation(line: 212, column: 33, scope: !2108)
!2229 = !DILocation(line: 218, column: 16, scope: !2108)
!2230 = !DILocation(line: 218, column: 14, scope: !2108)
!2231 = !DILocation(line: 296, column: 9, scope: !2108)
!2232 = !DILocation(line: 297, column: 11, scope: !2108)
!2233 = !DILocation(line: 158, column: 19, scope: !2108)
!2234 = !DILocation(line: 158, column: 25, scope: !2108)
!2235 = !DILocation(line: 158, column: 15, scope: !2108)
!2236 = !DILocation(line: 143, column: 19, scope: !2108)
!2237 = !DILocation(line: 143, column: 25, scope: !2108)
!2238 = !DILocation(line: 143, column: 15, scope: !2108)
!2239 = !DILocation(line: 159, column: 19, scope: !2108)
!2240 = !DILocation(line: 159, column: 25, scope: !2108)
!2241 = !DILocation(line: 159, column: 15, scope: !2108)
!2242 = !DILocation(line: 214, column: 15, scope: !2108)
!2243 = !DILocation(line: 175, column: 19, scope: !2108)
!2244 = !DILocation(line: 175, column: 25, scope: !2108)
!2245 = !DILocation(line: 175, column: 15, scope: !2108)
!2246 = !DILocation(line: 214, column: 21, scope: !2108)
!2247 = !DILocation(line: 191, column: 19, scope: !2108)
!2248 = !DILocation(line: 191, column: 25, scope: !2108)
!2249 = !DILocation(line: 191, column: 15, scope: !2108)
!2250 = !DILocation(line: 214, column: 27, scope: !2108)
!2251 = !DILocation(line: 207, column: 19, scope: !2108)
!2252 = !DILocation(line: 207, column: 25, scope: !2108)
!2253 = !DILocation(line: 207, column: 15, scope: !2108)
!2254 = !DILocation(line: 214, column: 33, scope: !2108)
!2255 = !DILocation(line: 220, column: 16, scope: !2108)
!2256 = !DILocation(line: 220, column: 14, scope: !2108)
!2257 = !DILocation(line: 290, column: 9, scope: !2108)
!2258 = !DILocation(line: 291, column: 11, scope: !2108)
!2259 = !DILocation(line: 140, column: 19, scope: !2108)
!2260 = !DILocation(line: 140, column: 25, scope: !2108)
!2261 = !DILocation(line: 140, column: 15, scope: !2108)
!2262 = !DILocation(line: 156, column: 19, scope: !2108)
!2263 = !DILocation(line: 156, column: 25, scope: !2108)
!2264 = !DILocation(line: 156, column: 15, scope: !2108)
!2265 = !DILocation(line: 211, column: 15, scope: !2108)
!2266 = !DILocation(line: 172, column: 19, scope: !2108)
!2267 = !DILocation(line: 172, column: 25, scope: !2108)
!2268 = !DILocation(line: 172, column: 15, scope: !2108)
!2269 = !DILocation(line: 211, column: 21, scope: !2108)
!2270 = !DILocation(line: 188, column: 19, scope: !2108)
!2271 = !DILocation(line: 188, column: 25, scope: !2108)
!2272 = !DILocation(line: 188, column: 15, scope: !2108)
!2273 = !DILocation(line: 211, column: 27, scope: !2108)
!2274 = !DILocation(line: 211, column: 33, scope: !2108)
!2275 = !DILocation(line: 142, column: 19, scope: !2108)
!2276 = !DILocation(line: 142, column: 25, scope: !2108)
!2277 = !DILocation(line: 142, column: 15, scope: !2108)
!2278 = !DILocation(line: 213, column: 15, scope: !2108)
!2279 = !DILocation(line: 174, column: 19, scope: !2108)
!2280 = !DILocation(line: 174, column: 25, scope: !2108)
!2281 = !DILocation(line: 174, column: 15, scope: !2108)
!2282 = !DILocation(line: 213, column: 21, scope: !2108)
!2283 = !DILocation(line: 190, column: 19, scope: !2108)
!2284 = !DILocation(line: 190, column: 25, scope: !2108)
!2285 = !DILocation(line: 190, column: 15, scope: !2108)
!2286 = !DILocation(line: 213, column: 27, scope: !2108)
!2287 = !DILocation(line: 206, column: 19, scope: !2108)
!2288 = !DILocation(line: 206, column: 25, scope: !2108)
!2289 = !DILocation(line: 206, column: 15, scope: !2108)
!2290 = !DILocation(line: 213, column: 33, scope: !2108)
!2291 = !DILocation(line: 219, column: 16, scope: !2108)
!2292 = !DILocation(line: 219, column: 14, scope: !2108)
!2293 = !DILocation(line: 288, column: 9, scope: !2108)
!2294 = !DILocation(line: 289, column: 11, scope: !2108)
!2295 = !DILocation(line: 302, column: 19, scope: !2108)
!2296 = !DILocation(line: 302, column: 25, scope: !2108)
!2297 = !DILocation(line: 302, column: 15, scope: !2108)
!2298 = !DILocation(line: 217, column: 16, scope: !2108)
!2299 = !DILocation(line: 217, column: 14, scope: !2108)
!2300 = !DILocation(line: 294, column: 9, scope: !2108)
!2301 = !DILocation(line: 295, column: 11, scope: !2108)
!2302 = !DILocation(line: 301, column: 19, scope: !2108)
!2303 = !DILocation(line: 301, column: 25, scope: !2108)
!2304 = !DILocation(line: 301, column: 15, scope: !2108)
!2305 = !DILocation(line: 221, column: 16, scope: !2108)
!2306 = !DILocation(line: 221, column: 14, scope: !2108)
!2307 = !DILocation(line: 292, column: 9, scope: !2108)
!2308 = !DILocation(line: 293, column: 11, scope: !2108)
!2309 = !DILocation(line: 300, column: 19, scope: !2108)
!2310 = !DILocation(line: 300, column: 25, scope: !2108)
!2311 = !DILocation(line: 300, column: 15, scope: !2108)
!2312 = !DILocation(line: 299, column: 19, scope: !2108)
!2313 = !DILocation(line: 299, column: 25, scope: !2108)
!2314 = !DILocation(line: 299, column: 15, scope: !2108)
!2315 = !DILocation(line: 298, column: 19, scope: !2108)
!2316 = !DILocation(line: 298, column: 25, scope: !2108)
!2317 = !DILocation(line: 298, column: 15, scope: !2108)
!2318 = !DILocation(line: 280, column: 9, scope: !2108)
!2319 = !DILocation(line: 281, column: 11, scope: !2108)
!2320 = !DILocation(line: 274, column: 9, scope: !2108)
!2321 = !DILocation(line: 275, column: 11, scope: !2108)
!2322 = !DILocation(line: 272, column: 9, scope: !2108)
!2323 = !DILocation(line: 273, column: 11, scope: !2108)
!2324 = !DILocation(line: 286, column: 19, scope: !2108)
!2325 = !DILocation(line: 286, column: 25, scope: !2108)
!2326 = !DILocation(line: 286, column: 15, scope: !2108)
!2327 = !DILocation(line: 278, column: 9, scope: !2108)
!2328 = !DILocation(line: 279, column: 11, scope: !2108)
!2329 = !DILocation(line: 285, column: 19, scope: !2108)
!2330 = !DILocation(line: 285, column: 25, scope: !2108)
!2331 = !DILocation(line: 285, column: 15, scope: !2108)
!2332 = !DILocation(line: 276, column: 9, scope: !2108)
!2333 = !DILocation(line: 277, column: 11, scope: !2108)
!2334 = !DILocation(line: 284, column: 19, scope: !2108)
!2335 = !DILocation(line: 284, column: 25, scope: !2108)
!2336 = !DILocation(line: 284, column: 15, scope: !2108)
!2337 = !DILocation(line: 283, column: 19, scope: !2108)
!2338 = !DILocation(line: 283, column: 25, scope: !2108)
!2339 = !DILocation(line: 283, column: 15, scope: !2108)
!2340 = !DILocation(line: 282, column: 19, scope: !2108)
!2341 = !DILocation(line: 282, column: 25, scope: !2108)
!2342 = !DILocation(line: 282, column: 15, scope: !2108)
!2343 = !DILocation(line: 264, column: 9, scope: !2108)
!2344 = !DILocation(line: 265, column: 11, scope: !2108)
!2345 = !DILocation(line: 258, column: 9, scope: !2108)
!2346 = !DILocation(line: 259, column: 11, scope: !2108)
!2347 = !DILocation(line: 256, column: 9, scope: !2108)
!2348 = !DILocation(line: 257, column: 11, scope: !2108)
!2349 = !DILocation(line: 270, column: 19, scope: !2108)
!2350 = !DILocation(line: 270, column: 25, scope: !2108)
!2351 = !DILocation(line: 270, column: 15, scope: !2108)
!2352 = !DILocation(line: 262, column: 9, scope: !2108)
!2353 = !DILocation(line: 263, column: 11, scope: !2108)
!2354 = !DILocation(line: 269, column: 19, scope: !2108)
!2355 = !DILocation(line: 269, column: 25, scope: !2108)
!2356 = !DILocation(line: 269, column: 15, scope: !2108)
!2357 = !DILocation(line: 260, column: 9, scope: !2108)
!2358 = !DILocation(line: 261, column: 11, scope: !2108)
!2359 = !DILocation(line: 268, column: 19, scope: !2108)
!2360 = !DILocation(line: 268, column: 25, scope: !2108)
!2361 = !DILocation(line: 268, column: 15, scope: !2108)
!2362 = !DILocation(line: 267, column: 19, scope: !2108)
!2363 = !DILocation(line: 267, column: 25, scope: !2108)
!2364 = !DILocation(line: 267, column: 15, scope: !2108)
!2365 = !DILocation(line: 266, column: 19, scope: !2108)
!2366 = !DILocation(line: 266, column: 25, scope: !2108)
!2367 = !DILocation(line: 266, column: 15, scope: !2108)
!2368 = !DILocation(line: 248, column: 9, scope: !2108)
!2369 = !DILocation(line: 249, column: 11, scope: !2108)
!2370 = !DILocation(line: 242, column: 9, scope: !2108)
!2371 = !DILocation(line: 243, column: 11, scope: !2108)
!2372 = !DILocation(line: 240, column: 9, scope: !2108)
!2373 = !DILocation(line: 241, column: 11, scope: !2108)
!2374 = !DILocation(line: 254, column: 19, scope: !2108)
!2375 = !DILocation(line: 254, column: 25, scope: !2108)
!2376 = !DILocation(line: 254, column: 15, scope: !2108)
!2377 = !DILocation(line: 246, column: 9, scope: !2108)
!2378 = !DILocation(line: 247, column: 11, scope: !2108)
!2379 = !DILocation(line: 253, column: 19, scope: !2108)
!2380 = !DILocation(line: 253, column: 25, scope: !2108)
!2381 = !DILocation(line: 253, column: 15, scope: !2108)
!2382 = !DILocation(line: 244, column: 9, scope: !2108)
!2383 = !DILocation(line: 245, column: 11, scope: !2108)
!2384 = !DILocation(line: 252, column: 19, scope: !2108)
!2385 = !DILocation(line: 252, column: 25, scope: !2108)
!2386 = !DILocation(line: 252, column: 15, scope: !2108)
!2387 = !DILocation(line: 251, column: 19, scope: !2108)
!2388 = !DILocation(line: 251, column: 25, scope: !2108)
!2389 = !DILocation(line: 251, column: 15, scope: !2108)
!2390 = !DILocation(line: 250, column: 19, scope: !2108)
!2391 = !DILocation(line: 250, column: 25, scope: !2108)
!2392 = !DILocation(line: 250, column: 15, scope: !2108)
!2393 = !DILocation(line: 231, column: 9, scope: !2108)
!2394 = !DILocation(line: 232, column: 11, scope: !2108)
!2395 = !DILocation(line: 225, column: 9, scope: !2108)
!2396 = !DILocation(line: 226, column: 11, scope: !2108)
!2397 = !DILocation(line: 223, column: 9, scope: !2108)
!2398 = !DILocation(line: 238, column: 19, scope: !2108)
!2399 = !DILocation(line: 238, column: 25, scope: !2108)
!2400 = !DILocation(line: 238, column: 15, scope: !2108)
!2401 = !DILocation(line: 229, column: 9, scope: !2108)
!2402 = !DILocation(line: 230, column: 11, scope: !2108)
!2403 = !DILocation(line: 237, column: 19, scope: !2108)
!2404 = !DILocation(line: 237, column: 25, scope: !2108)
!2405 = !DILocation(line: 237, column: 15, scope: !2108)
!2406 = !DILocation(line: 227, column: 9, scope: !2108)
!2407 = !DILocation(line: 228, column: 11, scope: !2108)
!2408 = !DILocation(line: 236, column: 19, scope: !2108)
!2409 = !DILocation(line: 236, column: 25, scope: !2108)
!2410 = !DILocation(line: 236, column: 15, scope: !2108)
!2411 = !DILocation(line: 235, column: 19, scope: !2108)
!2412 = !DILocation(line: 235, column: 25, scope: !2108)
!2413 = !DILocation(line: 235, column: 15, scope: !2108)
!2414 = !DILocation(line: 234, column: 51, scope: !2108)
!2415 = !DILocation(line: 234, column: 22, scope: !2108)
!2416 = !DILocation(line: 233, column: 19, scope: !2108)
!2417 = !DILocation(line: 233, column: 25, scope: !2108)
!2418 = !DILocation(line: 234, column: 9, scope: !2108)
!2419 = !DILocation(line: 113, column: 42, scope: !2070)
!2420 = !DILocation(line: 113, column: 3, scope: !2070)
!2421 = distinct !{!2421, !2071, !2422, !107}
!2422 = !DILocation(line: 303, column: 3, scope: !2067)
!2423 = !DILocation(line: 306, column: 12, scope: !2012)
!2424 = !DILocation(line: 307, column: 3, scope: !2012)
!2425 = !DILocation(line: 307, column: 12, scope: !2012)
!2426 = !DILocation(line: 308, column: 3, scope: !2012)
!2427 = !DILocation(line: 308, column: 12, scope: !2012)
!2428 = !DILocation(line: 309, column: 3, scope: !2012)
!2429 = !DILocation(line: 309, column: 12, scope: !2012)
!2430 = !DILocation(line: 310, column: 3, scope: !2012)
!2431 = !DILocation(line: 310, column: 12, scope: !2012)
!2432 = !DILocation(line: 311, column: 3, scope: !2012)
!2433 = !DILocation(line: 311, column: 12, scope: !2012)
!2434 = !DILocation(line: 312, column: 3, scope: !2012)
!2435 = !DILocation(line: 312, column: 12, scope: !2012)
!2436 = !DILocation(line: 313, column: 3, scope: !2012)
!2437 = !DILocation(line: 313, column: 12, scope: !2012)
!2438 = !DILocation(line: 314, column: 3, scope: !2012)
!2439 = !DILocation(line: 314, column: 12, scope: !2012)
!2440 = !DILocation(line: 315, column: 3, scope: !2012)
!2441 = !DILocation(line: 315, column: 12, scope: !2012)
!2442 = !DILocation(line: 316, column: 3, scope: !2012)
!2443 = !DILocation(line: 316, column: 13, scope: !2012)
!2444 = !DILocation(line: 317, column: 3, scope: !2012)
!2445 = !DILocation(line: 317, column: 13, scope: !2012)
!2446 = !DILocation(line: 318, column: 3, scope: !2012)
!2447 = !DILocation(line: 318, column: 13, scope: !2012)
!2448 = !DILocation(line: 319, column: 3, scope: !2012)
!2449 = !DILocation(line: 319, column: 13, scope: !2012)
!2450 = !DILocation(line: 320, column: 3, scope: !2012)
!2451 = !DILocation(line: 320, column: 13, scope: !2012)
!2452 = !DILocation(line: 321, column: 3, scope: !2012)
!2453 = !DILocation(line: 321, column: 13, scope: !2012)
!2454 = !DILocation(line: 322, column: 3, scope: !2012)
!2455 = !DILocation(line: 322, column: 13, scope: !2012)
!2456 = !DILocation(line: 323, column: 3, scope: !2012)
!2457 = !DILocation(line: 323, column: 13, scope: !2012)
!2458 = !DILocation(line: 324, column: 3, scope: !2012)
!2459 = !DILocation(line: 324, column: 13, scope: !2012)
!2460 = !DILocation(line: 325, column: 3, scope: !2012)
!2461 = !DILocation(line: 325, column: 13, scope: !2012)
!2462 = !DILocation(line: 326, column: 3, scope: !2012)
!2463 = !DILocation(line: 326, column: 13, scope: !2012)
!2464 = !DILocation(line: 327, column: 3, scope: !2012)
!2465 = !DILocation(line: 327, column: 13, scope: !2012)
!2466 = !DILocation(line: 328, column: 3, scope: !2012)
!2467 = !DILocation(line: 328, column: 13, scope: !2012)
!2468 = !DILocation(line: 329, column: 3, scope: !2012)
!2469 = !DILocation(line: 329, column: 13, scope: !2012)
!2470 = !DILocation(line: 330, column: 3, scope: !2012)
!2471 = !DILocation(line: 330, column: 13, scope: !2012)
!2472 = !DILocation(line: 331, column: 1, scope: !2012)
!2473 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_finalize", scope: !49, file: !49, line: 524, type: !1916, scopeLine: 524, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2474 = !DILocalVariable(name: "state", arg: 1, scope: !2473, file: !49, line: 524, type: !1918)
!2475 = !DILocation(line: 0, scope: !2473)
!2476 = !DILocation(line: 525, column: 27, scope: !2473)
!2477 = !DILocation(line: 525, column: 3, scope: !2473)
!2478 = !DILocation(line: 526, column: 3, scope: !2473)
!2479 = !DILocation(line: 526, column: 29, scope: !2473)
!2480 = !DILocation(line: 527, column: 1, scope: !2473)
!2481 = distinct !DISubprogram(name: "keccak_finalize", scope: !49, file: !49, line: 388, type: !2482, scopeLine: 389, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2482 = !DISubroutineType(types: !2483)
!2483 = !{null, !1928, !14, !14, !7}
!2484 = !DILocalVariable(name: "s", arg: 1, scope: !2481, file: !49, line: 388, type: !1928)
!2485 = !DILocation(line: 0, scope: !2481)
!2486 = !DILocalVariable(name: "pos", arg: 2, scope: !2481, file: !49, line: 388, type: !14)
!2487 = !DILocalVariable(name: "r", arg: 3, scope: !2481, file: !49, line: 388, type: !14)
!2488 = !DILocalVariable(name: "p", arg: 4, scope: !2481, file: !49, line: 389, type: !7)
!2489 = !DILocation(line: 390, column: 34, scope: !2481)
!2490 = !DILocation(line: 390, column: 29, scope: !2481)
!2491 = !DILocation(line: 390, column: 9, scope: !2481)
!2492 = !DILocation(line: 390, column: 3, scope: !2481)
!2493 = !DILocation(line: 390, column: 14, scope: !2481)
!2494 = !DILocation(line: 391, column: 7, scope: !2481)
!2495 = !DILocation(line: 391, column: 3, scope: !2481)
!2496 = !DILocation(line: 391, column: 16, scope: !2481)
!2497 = !DILocation(line: 392, column: 1, scope: !2481)
!2498 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeeze", scope: !49, file: !49, line: 540, type: !2499, scopeLine: 540, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2499 = !DISubroutineType(types: !2500)
!2500 = !{null, !6, !12, !1918}
!2501 = !DILocalVariable(name: "out", arg: 1, scope: !2498, file: !49, line: 540, type: !6)
!2502 = !DILocation(line: 0, scope: !2498)
!2503 = !DILocalVariable(name: "outlen", arg: 2, scope: !2498, file: !49, line: 540, type: !12)
!2504 = !DILocalVariable(name: "state", arg: 3, scope: !2498, file: !49, line: 540, type: !1918)
!2505 = !DILocation(line: 542, column: 28, scope: !2498)
!2506 = !DILocation(line: 541, column: 31, scope: !2498)
!2507 = !DILocation(line: 541, column: 3, scope: !2498)
!2508 = !DILocation(line: 541, column: 29, scope: !2498)
!2509 = !DILocation(line: 543, column: 1, scope: !2498)
!2510 = distinct !DISubprogram(name: "keccak_squeeze", scope: !49, file: !49, line: 410, type: !2511, scopeLine: 411, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2511 = !DISubroutineType(types: !2512)
!2512 = !{!14, !6, !12, !1928, !14, !14}
!2513 = !DILocalVariable(name: "out", arg: 1, scope: !2510, file: !49, line: 410, type: !6)
!2514 = !DILocation(line: 0, scope: !2510)
!2515 = !DILocalVariable(name: "outlen", arg: 2, scope: !2510, file: !49, line: 410, type: !12)
!2516 = !DILocalVariable(name: "s", arg: 3, scope: !2510, file: !49, line: 410, type: !1928)
!2517 = !DILocalVariable(name: "pos", arg: 4, scope: !2510, file: !49, line: 411, type: !14)
!2518 = !DILocalVariable(name: "r", arg: 5, scope: !2510, file: !49, line: 411, type: !14)
!2519 = !DILocation(line: 414, column: 3, scope: !2510)
!2520 = !DILocation(line: 415, column: 13, scope: !2521)
!2521 = distinct !DILexicalBlock(scope: !2522, file: !49, line: 415, column: 9)
!2522 = distinct !DILexicalBlock(scope: !2510, file: !49, line: 414, column: 18)
!2523 = !DILocation(line: 416, column: 7, scope: !2524)
!2524 = distinct !DILexicalBlock(scope: !2521, file: !49, line: 415, column: 19)
!2525 = !DILocation(line: 418, column: 5, scope: !2524)
!2526 = !DILocalVariable(name: "i", scope: !2510, file: !49, line: 412, type: !14)
!2527 = !DILocation(line: 419, column: 10, scope: !2528)
!2528 = distinct !DILexicalBlock(scope: !2522, file: !49, line: 419, column: 5)
!2529 = !DILocation(line: 419, scope: !2528)
!2530 = !DILocation(line: 419, column: 21, scope: !2531)
!2531 = distinct !DILexicalBlock(scope: !2528, file: !49, line: 419, column: 5)
!2532 = !DILocation(line: 419, column: 25, scope: !2531)
!2533 = !DILocation(line: 419, column: 5, scope: !2528)
!2534 = !DILocation(line: 420, column: 20, scope: !2531)
!2535 = !DILocation(line: 420, column: 16, scope: !2531)
!2536 = !DILocation(line: 420, column: 30, scope: !2531)
!2537 = !DILocation(line: 420, column: 25, scope: !2531)
!2538 = !DILocation(line: 420, column: 14, scope: !2531)
!2539 = !DILocation(line: 420, column: 11, scope: !2531)
!2540 = !DILocation(line: 419, column: 47, scope: !2531)
!2541 = !DILocation(line: 419, column: 5, scope: !2531)
!2542 = distinct !{!2542, !2533, !2543, !107}
!2543 = !DILocation(line: 420, column: 38, scope: !2528)
!2544 = !DILocation(line: 421, column: 17, scope: !2522)
!2545 = !DILocation(line: 421, column: 12, scope: !2522)
!2546 = distinct !{!2546, !2519, !2547, !107}
!2547 = !DILocation(line: 423, column: 3, scope: !2510)
!2548 = !DILocation(line: 425, column: 3, scope: !2510)
!2549 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb_once", scope: !49, file: !49, line: 556, type: !1946, scopeLine: 557, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2550 = !DILocalVariable(name: "state", arg: 1, scope: !2549, file: !49, line: 556, type: !1918)
!2551 = !DILocation(line: 0, scope: !2549)
!2552 = !DILocalVariable(name: "in", arg: 2, scope: !2549, file: !49, line: 556, type: !234)
!2553 = !DILocalVariable(name: "inlen", arg: 3, scope: !2549, file: !49, line: 557, type: !12)
!2554 = !DILocation(line: 558, column: 3, scope: !2549)
!2555 = !DILocation(line: 559, column: 3, scope: !2549)
!2556 = !DILocation(line: 559, column: 29, scope: !2549)
!2557 = !DILocation(line: 560, column: 1, scope: !2549)
!2558 = distinct !DISubprogram(name: "keccak_absorb_once", scope: !49, file: !49, line: 441, type: !2559, scopeLine: 442, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2559 = !DISubroutineType(types: !2560)
!2560 = !{null, !1928, !14, !234, !12, !7}
!2561 = !DILocalVariable(name: "s", arg: 1, scope: !2558, file: !49, line: 441, type: !1928)
!2562 = !DILocation(line: 0, scope: !2558)
!2563 = !DILocalVariable(name: "r", arg: 2, scope: !2558, file: !49, line: 441, type: !14)
!2564 = !DILocalVariable(name: "in", arg: 3, scope: !2558, file: !49, line: 442, type: !234)
!2565 = !DILocalVariable(name: "inlen", arg: 4, scope: !2558, file: !49, line: 442, type: !12)
!2566 = !DILocalVariable(name: "p", arg: 5, scope: !2558, file: !49, line: 442, type: !7)
!2567 = !DILocalVariable(name: "i", scope: !2558, file: !49, line: 443, type: !14)
!2568 = !DILocation(line: 445, column: 8, scope: !2569)
!2569 = distinct !DILexicalBlock(scope: !2558, file: !49, line: 445, column: 3)
!2570 = !DILocation(line: 445, scope: !2569)
!2571 = !DILocation(line: 445, column: 17, scope: !2572)
!2572 = distinct !DILexicalBlock(scope: !2569, file: !49, line: 445, column: 3)
!2573 = !DILocation(line: 445, column: 3, scope: !2569)
!2574 = !DILocation(line: 448, column: 3, scope: !2558)
!2575 = !DILocation(line: 446, column: 5, scope: !2572)
!2576 = !DILocation(line: 446, column: 10, scope: !2572)
!2577 = !DILocation(line: 445, column: 24, scope: !2572)
!2578 = !DILocation(line: 445, column: 3, scope: !2572)
!2579 = distinct !{!2579, !2573, !2580, !107}
!2580 = !DILocation(line: 446, column: 12, scope: !2569)
!2581 = !DILocation(line: 448, column: 16, scope: !2558)
!2582 = !DILocation(line: 449, column: 5, scope: !2583)
!2583 = distinct !DILexicalBlock(scope: !2584, file: !49, line: 449, column: 5)
!2584 = distinct !DILexicalBlock(scope: !2558, file: !49, line: 448, column: 22)
!2585 = !DILocation(line: 456, column: 3, scope: !2586)
!2586 = distinct !DILexicalBlock(scope: !2558, file: !49, line: 456, column: 3)
!2587 = !DILocation(line: 449, scope: !2583)
!2588 = !DILocation(line: 449, column: 19, scope: !2589)
!2589 = distinct !DILexicalBlock(scope: !2583, file: !49, line: 449, column: 5)
!2590 = !DILocation(line: 450, column: 29, scope: !2589)
!2591 = !DILocation(line: 450, column: 25, scope: !2589)
!2592 = !DILocation(line: 450, column: 15, scope: !2589)
!2593 = !DILocation(line: 450, column: 7, scope: !2589)
!2594 = !DILocation(line: 450, column: 12, scope: !2589)
!2595 = !DILocation(line: 449, column: 29, scope: !2589)
!2596 = !DILocation(line: 449, column: 5, scope: !2589)
!2597 = distinct !{!2597, !2582, !2598, !107}
!2598 = !DILocation(line: 450, column: 32, scope: !2583)
!2599 = !DILocation(line: 451, column: 8, scope: !2584)
!2600 = !DILocation(line: 452, column: 11, scope: !2584)
!2601 = !DILocation(line: 453, column: 5, scope: !2584)
!2602 = distinct !{!2602, !2574, !2603, !107}
!2603 = !DILocation(line: 454, column: 3, scope: !2558)
!2604 = !DILocation(line: 456, scope: !2586)
!2605 = !DILocation(line: 456, column: 17, scope: !2606)
!2606 = distinct !DILexicalBlock(scope: !2586, file: !49, line: 456, column: 3)
!2607 = !DILocation(line: 457, column: 27, scope: !2606)
!2608 = !DILocation(line: 457, column: 17, scope: !2606)
!2609 = !DILocation(line: 457, column: 38, scope: !2606)
!2610 = !DILocation(line: 457, column: 33, scope: !2606)
!2611 = !DILocation(line: 457, column: 9, scope: !2606)
!2612 = !DILocation(line: 457, column: 5, scope: !2606)
!2613 = !DILocation(line: 457, column: 14, scope: !2606)
!2614 = !DILocation(line: 456, column: 27, scope: !2606)
!2615 = !DILocation(line: 456, column: 3, scope: !2606)
!2616 = distinct !{!2616, !2585, !2617, !107}
!2617 = !DILocation(line: 457, column: 46, scope: !2586)
!2618 = !DILocation(line: 459, column: 15, scope: !2558)
!2619 = !DILocation(line: 459, column: 32, scope: !2558)
!2620 = !DILocation(line: 459, column: 27, scope: !2558)
!2621 = !DILocation(line: 459, column: 7, scope: !2558)
!2622 = !DILocation(line: 459, column: 3, scope: !2558)
!2623 = !DILocation(line: 459, column: 12, scope: !2558)
!2624 = !DILocation(line: 460, column: 8, scope: !2558)
!2625 = !DILocation(line: 460, column: 13, scope: !2558)
!2626 = !DILocation(line: 460, column: 3, scope: !2558)
!2627 = !DILocation(line: 460, column: 18, scope: !2558)
!2628 = !DILocation(line: 461, column: 1, scope: !2558)
!2629 = distinct !DISubprogram(name: "load64", scope: !49, file: !49, line: 22, type: !2630, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2630 = !DISubroutineType(types: !2631)
!2631 = !{!45, !234}
!2632 = !DILocalVariable(name: "x", arg: 1, scope: !2629, file: !49, line: 22, type: !234)
!2633 = !DILocation(line: 0, scope: !2629)
!2634 = !DILocalVariable(name: "r", scope: !2629, file: !49, line: 24, type: !45)
!2635 = !DILocalVariable(name: "i", scope: !2629, file: !49, line: 23, type: !14)
!2636 = !DILocation(line: 26, column: 8, scope: !2637)
!2637 = distinct !DILexicalBlock(scope: !2629, file: !49, line: 26, column: 3)
!2638 = !DILocation(line: 26, scope: !2637)
!2639 = !DILocation(line: 26, column: 17, scope: !2640)
!2640 = distinct !DILexicalBlock(scope: !2637, file: !49, line: 26, column: 3)
!2641 = !DILocation(line: 26, column: 3, scope: !2637)
!2642 = !DILocation(line: 27, column: 20, scope: !2640)
!2643 = !DILocation(line: 27, column: 10, scope: !2640)
!2644 = !DILocation(line: 27, column: 30, scope: !2640)
!2645 = !DILocation(line: 27, column: 25, scope: !2640)
!2646 = !DILocation(line: 27, column: 7, scope: !2640)
!2647 = !DILocation(line: 26, column: 23, scope: !2640)
!2648 = !DILocation(line: 26, column: 3, scope: !2640)
!2649 = distinct !{!2649, !2641, !2650, !107}
!2650 = !DILocation(line: 27, column: 32, scope: !2637)
!2651 = !DILocation(line: 29, column: 3, scope: !2629)
!2652 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeezeblocks", scope: !49, file: !49, line: 575, type: !2499, scopeLine: 575, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2653 = !DILocalVariable(name: "out", arg: 1, scope: !2652, file: !49, line: 575, type: !6)
!2654 = !DILocation(line: 0, scope: !2652)
!2655 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2652, file: !49, line: 575, type: !12)
!2656 = !DILocalVariable(name: "state", arg: 3, scope: !2652, file: !49, line: 575, type: !1918)
!2657 = !DILocation(line: 576, column: 3, scope: !2652)
!2658 = !DILocation(line: 577, column: 1, scope: !2652)
!2659 = distinct !DISubprogram(name: "keccak_squeezeblocks", scope: !49, file: !49, line: 477, type: !2660, scopeLine: 478, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2660 = !DISubroutineType(types: !2661)
!2661 = !{null, !6, !12, !1928, !14}
!2662 = !DILocalVariable(name: "out", arg: 1, scope: !2659, file: !49, line: 477, type: !6)
!2663 = !DILocation(line: 0, scope: !2659)
!2664 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2659, file: !49, line: 477, type: !12)
!2665 = !DILocalVariable(name: "s", arg: 3, scope: !2659, file: !49, line: 477, type: !1928)
!2666 = !DILocalVariable(name: "r", arg: 4, scope: !2659, file: !49, line: 478, type: !14)
!2667 = !DILocation(line: 481, column: 3, scope: !2659)
!2668 = !DILocation(line: 482, column: 5, scope: !2669)
!2669 = distinct !DILexicalBlock(scope: !2659, file: !49, line: 481, column: 19)
!2670 = !DILocalVariable(name: "i", scope: !2659, file: !49, line: 479, type: !14)
!2671 = !DILocation(line: 483, column: 10, scope: !2672)
!2672 = distinct !DILexicalBlock(scope: !2669, file: !49, line: 483, column: 5)
!2673 = !DILocation(line: 483, scope: !2672)
!2674 = !DILocation(line: 483, column: 19, scope: !2675)
!2675 = distinct !DILexicalBlock(scope: !2672, file: !49, line: 483, column: 5)
!2676 = !DILocation(line: 483, column: 5, scope: !2672)
!2677 = !DILocation(line: 484, column: 23, scope: !2675)
!2678 = !DILocation(line: 484, column: 19, scope: !2675)
!2679 = !DILocation(line: 484, column: 28, scope: !2675)
!2680 = !DILocation(line: 484, column: 7, scope: !2675)
!2681 = !DILocation(line: 483, column: 29, scope: !2675)
!2682 = !DILocation(line: 483, column: 5, scope: !2675)
!2683 = distinct !{!2683, !2676, !2684, !107}
!2684 = !DILocation(line: 484, column: 32, scope: !2672)
!2685 = !DILocation(line: 485, column: 9, scope: !2669)
!2686 = !DILocation(line: 486, column: 13, scope: !2669)
!2687 = distinct !{!2687, !2667, !2688, !107}
!2688 = !DILocation(line: 487, column: 3, scope: !2659)
!2689 = !DILocation(line: 488, column: 1, scope: !2659)
!2690 = distinct !DISubprogram(name: "store64", scope: !49, file: !49, line: 41, type: !2691, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2691 = !DISubroutineType(types: !2692)
!2692 = !{null, !6, !45}
!2693 = !DILocalVariable(name: "x", arg: 1, scope: !2690, file: !49, line: 41, type: !6)
!2694 = !DILocation(line: 0, scope: !2690)
!2695 = !DILocalVariable(name: "u", arg: 2, scope: !2690, file: !49, line: 41, type: !45)
!2696 = !DILocalVariable(name: "i", scope: !2690, file: !49, line: 42, type: !14)
!2697 = !DILocation(line: 44, column: 8, scope: !2698)
!2698 = distinct !DILexicalBlock(scope: !2690, file: !49, line: 44, column: 3)
!2699 = !DILocation(line: 44, scope: !2698)
!2700 = !DILocation(line: 44, column: 17, scope: !2701)
!2701 = distinct !DILexicalBlock(scope: !2698, file: !49, line: 44, column: 3)
!2702 = !DILocation(line: 44, column: 3, scope: !2698)
!2703 = !DILocation(line: 45, column: 19, scope: !2701)
!2704 = !DILocation(line: 45, column: 14, scope: !2701)
!2705 = !DILocation(line: 45, column: 12, scope: !2701)
!2706 = !DILocation(line: 45, column: 5, scope: !2701)
!2707 = !DILocation(line: 45, column: 10, scope: !2701)
!2708 = !DILocation(line: 44, column: 23, scope: !2701)
!2709 = !DILocation(line: 44, column: 3, scope: !2701)
!2710 = distinct !{!2710, !2702, !2711, !107}
!2711 = !DILocation(line: 45, column: 21, scope: !2698)
!2712 = !DILocation(line: 46, column: 1, scope: !2690)
!2713 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_init", scope: !49, file: !49, line: 586, type: !1916, scopeLine: 586, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2714 = !DILocalVariable(name: "state", arg: 1, scope: !2713, file: !49, line: 586, type: !1918)
!2715 = !DILocation(line: 0, scope: !2713)
!2716 = !DILocation(line: 587, column: 3, scope: !2713)
!2717 = !DILocation(line: 588, column: 3, scope: !2713)
!2718 = !DILocation(line: 588, column: 29, scope: !2713)
!2719 = !DILocation(line: 589, column: 1, scope: !2713)
!2720 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb", scope: !49, file: !49, line: 601, type: !1946, scopeLine: 601, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2721 = !DILocalVariable(name: "state", arg: 1, scope: !2720, file: !49, line: 601, type: !1918)
!2722 = !DILocation(line: 0, scope: !2720)
!2723 = !DILocalVariable(name: "in", arg: 2, scope: !2720, file: !49, line: 601, type: !234)
!2724 = !DILocalVariable(name: "inlen", arg: 3, scope: !2720, file: !49, line: 601, type: !12)
!2725 = !DILocation(line: 602, column: 53, scope: !2720)
!2726 = !DILocation(line: 602, column: 31, scope: !2720)
!2727 = !DILocation(line: 602, column: 3, scope: !2720)
!2728 = !DILocation(line: 602, column: 29, scope: !2720)
!2729 = !DILocation(line: 604, column: 1, scope: !2720)
!2730 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_finalize", scope: !49, file: !49, line: 613, type: !1916, scopeLine: 613, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2731 = !DILocalVariable(name: "state", arg: 1, scope: !2730, file: !49, line: 613, type: !1918)
!2732 = !DILocation(line: 0, scope: !2730)
!2733 = !DILocation(line: 614, column: 27, scope: !2730)
!2734 = !DILocation(line: 614, column: 3, scope: !2730)
!2735 = !DILocation(line: 615, column: 3, scope: !2730)
!2736 = !DILocation(line: 615, column: 29, scope: !2730)
!2737 = !DILocation(line: 616, column: 1, scope: !2730)
!2738 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeeze", scope: !49, file: !49, line: 629, type: !2499, scopeLine: 629, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2739 = !DILocalVariable(name: "out", arg: 1, scope: !2738, file: !49, line: 629, type: !6)
!2740 = !DILocation(line: 0, scope: !2738)
!2741 = !DILocalVariable(name: "outlen", arg: 2, scope: !2738, file: !49, line: 629, type: !12)
!2742 = !DILocalVariable(name: "state", arg: 3, scope: !2738, file: !49, line: 629, type: !1918)
!2743 = !DILocation(line: 631, column: 28, scope: !2738)
!2744 = !DILocation(line: 630, column: 31, scope: !2738)
!2745 = !DILocation(line: 630, column: 3, scope: !2738)
!2746 = !DILocation(line: 630, column: 29, scope: !2738)
!2747 = !DILocation(line: 632, column: 1, scope: !2738)
!2748 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb_once", scope: !49, file: !49, line: 645, type: !1946, scopeLine: 646, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2749 = !DILocalVariable(name: "state", arg: 1, scope: !2748, file: !49, line: 645, type: !1918)
!2750 = !DILocation(line: 0, scope: !2748)
!2751 = !DILocalVariable(name: "in", arg: 2, scope: !2748, file: !49, line: 645, type: !234)
!2752 = !DILocalVariable(name: "inlen", arg: 3, scope: !2748, file: !49, line: 646, type: !12)
!2753 = !DILocation(line: 647, column: 3, scope: !2748)
!2754 = !DILocation(line: 648, column: 3, scope: !2748)
!2755 = !DILocation(line: 648, column: 29, scope: !2748)
!2756 = !DILocation(line: 649, column: 1, scope: !2748)
!2757 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeezeblocks", scope: !49, file: !49, line: 664, type: !2499, scopeLine: 664, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2758 = !DILocalVariable(name: "out", arg: 1, scope: !2757, file: !49, line: 664, type: !6)
!2759 = !DILocation(line: 0, scope: !2757)
!2760 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2757, file: !49, line: 664, type: !12)
!2761 = !DILocalVariable(name: "state", arg: 3, scope: !2757, file: !49, line: 664, type: !1918)
!2762 = !DILocation(line: 665, column: 3, scope: !2757)
!2763 = !DILocation(line: 666, column: 1, scope: !2757)
!2764 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128", scope: !49, file: !49, line: 678, type: !2765, scopeLine: 678, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2765 = !DISubroutineType(types: !2766)
!2766 = !{null, !6, !12, !234, !12}
!2767 = !DILocalVariable(name: "out", arg: 1, scope: !2764, file: !49, line: 678, type: !6)
!2768 = !DILocation(line: 0, scope: !2764)
!2769 = !DILocalVariable(name: "outlen", arg: 2, scope: !2764, file: !49, line: 678, type: !12)
!2770 = !DILocalVariable(name: "in", arg: 3, scope: !2764, file: !49, line: 678, type: !234)
!2771 = !DILocalVariable(name: "inlen", arg: 4, scope: !2764, file: !49, line: 678, type: !12)
!2772 = !DILocalVariable(name: "state", scope: !2764, file: !49, line: 680, type: !346)
!2773 = !DILocation(line: 680, column: 16, scope: !2764)
!2774 = !DILocation(line: 682, column: 3, scope: !2764)
!2775 = !DILocation(line: 683, column: 20, scope: !2764)
!2776 = !DILocalVariable(name: "nblocks", scope: !2764, file: !49, line: 679, type: !12)
!2777 = !DILocation(line: 684, column: 3, scope: !2764)
!2778 = !DILocation(line: 685, column: 21, scope: !2764)
!2779 = !DILocation(line: 685, column: 10, scope: !2764)
!2780 = !DILocation(line: 686, column: 18, scope: !2764)
!2781 = !DILocation(line: 686, column: 7, scope: !2764)
!2782 = !DILocation(line: 687, column: 3, scope: !2764)
!2783 = !DILocation(line: 688, column: 1, scope: !2764)
!2784 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256", scope: !49, file: !49, line: 700, type: !2765, scopeLine: 700, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2785 = !DILocalVariable(name: "out", arg: 1, scope: !2784, file: !49, line: 700, type: !6)
!2786 = !DILocation(line: 0, scope: !2784)
!2787 = !DILocalVariable(name: "outlen", arg: 2, scope: !2784, file: !49, line: 700, type: !12)
!2788 = !DILocalVariable(name: "in", arg: 3, scope: !2784, file: !49, line: 700, type: !234)
!2789 = !DILocalVariable(name: "inlen", arg: 4, scope: !2784, file: !49, line: 700, type: !12)
!2790 = !DILocalVariable(name: "state", scope: !2784, file: !49, line: 702, type: !346)
!2791 = !DILocation(line: 702, column: 16, scope: !2784)
!2792 = !DILocation(line: 704, column: 3, scope: !2784)
!2793 = !DILocation(line: 705, column: 20, scope: !2784)
!2794 = !DILocalVariable(name: "nblocks", scope: !2784, file: !49, line: 701, type: !12)
!2795 = !DILocation(line: 706, column: 3, scope: !2784)
!2796 = !DILocation(line: 707, column: 21, scope: !2784)
!2797 = !DILocation(line: 707, column: 10, scope: !2784)
!2798 = !DILocation(line: 708, column: 18, scope: !2784)
!2799 = !DILocation(line: 708, column: 7, scope: !2784)
!2800 = !DILocation(line: 709, column: 3, scope: !2784)
!2801 = !DILocation(line: 710, column: 1, scope: !2784)
!2802 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_256", scope: !49, file: !49, line: 721, type: !2803, scopeLine: 721, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2803 = !DISubroutineType(types: !2804)
!2804 = !{null, !6, !234, !12}
!2805 = !DILocalVariable(name: "h", arg: 1, scope: !2802, file: !49, line: 721, type: !6)
!2806 = !DILocation(line: 0, scope: !2802)
!2807 = !DILocalVariable(name: "in", arg: 2, scope: !2802, file: !49, line: 721, type: !234)
!2808 = !DILocalVariable(name: "inlen", arg: 3, scope: !2802, file: !49, line: 721, type: !12)
!2809 = !DILocalVariable(name: "s", scope: !2802, file: !49, line: 723, type: !2810)
!2810 = !DICompositeType(tag: DW_TAG_array_type, baseType: !45, size: 1600, elements: !2811)
!2811 = !{!2812}
!2812 = !DISubrange(count: 25)
!2813 = !DILocation(line: 723, column: 12, scope: !2802)
!2814 = !DILocation(line: 725, column: 3, scope: !2802)
!2815 = !DILocation(line: 726, column: 3, scope: !2802)
!2816 = !DILocalVariable(name: "i", scope: !2802, file: !49, line: 722, type: !14)
!2817 = !DILocation(line: 727, column: 8, scope: !2818)
!2818 = distinct !DILexicalBlock(scope: !2802, file: !49, line: 727, column: 3)
!2819 = !DILocation(line: 727, scope: !2818)
!2820 = !DILocation(line: 727, column: 17, scope: !2821)
!2821 = distinct !DILexicalBlock(scope: !2818, file: !49, line: 727, column: 3)
!2822 = !DILocation(line: 727, column: 3, scope: !2818)
!2823 = !DILocation(line: 728, column: 19, scope: !2821)
!2824 = !DILocation(line: 728, column: 15, scope: !2821)
!2825 = !DILocation(line: 728, column: 24, scope: !2821)
!2826 = !DILocation(line: 728, column: 5, scope: !2821)
!2827 = !DILocation(line: 727, column: 23, scope: !2821)
!2828 = !DILocation(line: 727, column: 3, scope: !2821)
!2829 = distinct !{!2829, !2822, !2830, !107}
!2830 = !DILocation(line: 728, column: 28, scope: !2818)
!2831 = !DILocation(line: 729, column: 1, scope: !2802)
!2832 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_512", scope: !49, file: !49, line: 740, type: !2803, scopeLine: 740, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2833 = !DILocalVariable(name: "h", arg: 1, scope: !2832, file: !49, line: 740, type: !6)
!2834 = !DILocation(line: 0, scope: !2832)
!2835 = !DILocalVariable(name: "in", arg: 2, scope: !2832, file: !49, line: 740, type: !234)
!2836 = !DILocalVariable(name: "inlen", arg: 3, scope: !2832, file: !49, line: 740, type: !12)
!2837 = !DILocalVariable(name: "s", scope: !2832, file: !49, line: 742, type: !2810)
!2838 = !DILocation(line: 742, column: 12, scope: !2832)
!2839 = !DILocation(line: 744, column: 3, scope: !2832)
!2840 = !DILocation(line: 745, column: 3, scope: !2832)
!2841 = !DILocalVariable(name: "i", scope: !2832, file: !49, line: 741, type: !14)
!2842 = !DILocation(line: 746, column: 8, scope: !2843)
!2843 = distinct !DILexicalBlock(scope: !2832, file: !49, line: 746, column: 3)
!2844 = !DILocation(line: 746, scope: !2843)
!2845 = !DILocation(line: 746, column: 17, scope: !2846)
!2846 = distinct !DILexicalBlock(scope: !2843, file: !49, line: 746, column: 3)
!2847 = !DILocation(line: 746, column: 3, scope: !2843)
!2848 = !DILocation(line: 747, column: 19, scope: !2846)
!2849 = !DILocation(line: 747, column: 15, scope: !2846)
!2850 = !DILocation(line: 747, column: 24, scope: !2846)
!2851 = !DILocation(line: 747, column: 5, scope: !2846)
!2852 = !DILocation(line: 746, column: 23, scope: !2846)
!2853 = !DILocation(line: 746, column: 3, scope: !2846)
!2854 = distinct !{!2854, !2847, !2855, !107}
!2855 = !DILocation(line: 747, column: 28, scope: !2843)
!2856 = !DILocation(line: 748, column: 1, scope: !2832)
!2857 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_kyber_shake128_absorb", scope: !2858, file: !2858, line: 18, type: !2859, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !74, retainedNodes: !24)
!2858 = !DIFile(filename: "../../../ref/symmetric-shake.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!2859 = !DISubroutineType(types: !2860)
!2860 = !{null, !1918, !234, !7, !7}
!2861 = !DILocalVariable(name: "state", arg: 1, scope: !2857, file: !2858, line: 18, type: !1918)
!2862 = !DILocation(line: 0, scope: !2857)
!2863 = !DILocalVariable(name: "seed", arg: 2, scope: !2857, file: !2858, line: 19, type: !234)
!2864 = !DILocalVariable(name: "x", arg: 3, scope: !2857, file: !2858, line: 20, type: !7)
!2865 = !DILocalVariable(name: "y", arg: 4, scope: !2857, file: !2858, line: 21, type: !7)
!2866 = !DILocalVariable(name: "extseed", scope: !2857, file: !2858, line: 23, type: !2867)
!2867 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 272, elements: !2868)
!2868 = !{!2869}
!2869 = !DISubrange(count: 34)
!2870 = !DILocation(line: 23, column: 11, scope: !2857)
!2871 = !DILocation(line: 25, column: 3, scope: !2857)
!2872 = !DILocation(line: 26, column: 3, scope: !2857)
!2873 = !DILocation(line: 26, column: 29, scope: !2857)
!2874 = !DILocation(line: 27, column: 3, scope: !2857)
!2875 = !DILocation(line: 27, column: 29, scope: !2857)
!2876 = !DILocation(line: 29, column: 3, scope: !2857)
!2877 = !DILocation(line: 30, column: 1, scope: !2857)
!2878 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_kyber_shake256_prf", scope: !2858, file: !2858, line: 43, type: !2879, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !74, retainedNodes: !24)
!2879 = !DISubroutineType(types: !2880)
!2880 = !{null, !6, !12, !234, !7}
!2881 = !DILocalVariable(name: "out", arg: 1, scope: !2878, file: !2858, line: 43, type: !6)
!2882 = !DILocation(line: 0, scope: !2878)
!2883 = !DILocalVariable(name: "outlen", arg: 2, scope: !2878, file: !2858, line: 43, type: !12)
!2884 = !DILocalVariable(name: "key", arg: 3, scope: !2878, file: !2858, line: 43, type: !234)
!2885 = !DILocalVariable(name: "nonce", arg: 4, scope: !2878, file: !2858, line: 43, type: !7)
!2886 = !DILocalVariable(name: "extkey", scope: !2878, file: !2858, line: 45, type: !2887)
!2887 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 264, elements: !2888)
!2888 = !{!2889}
!2889 = !DISubrange(count: 33)
!2890 = !DILocation(line: 45, column: 11, scope: !2878)
!2891 = !DILocation(line: 47, column: 3, scope: !2878)
!2892 = !DILocation(line: 48, column: 3, scope: !2878)
!2893 = !DILocation(line: 48, column: 26, scope: !2878)
!2894 = !DILocation(line: 50, column: 3, scope: !2878)
!2895 = !DILocation(line: 51, column: 1, scope: !2878)
!2896 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_kyber_shake256_rkprf", scope: !2858, file: !2858, line: 64, type: !641, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !74, retainedNodes: !24)
!2897 = !DILocalVariable(name: "out", arg: 1, scope: !2896, file: !2858, line: 64, type: !6)
!2898 = !DILocation(line: 0, scope: !2896)
!2899 = !DILocalVariable(name: "key", arg: 2, scope: !2896, file: !2858, line: 64, type: !234)
!2900 = !DILocalVariable(name: "input", arg: 3, scope: !2896, file: !2858, line: 64, type: !234)
!2901 = !DILocalVariable(name: "s", scope: !2896, file: !2858, line: 66, type: !346)
!2902 = !DILocation(line: 66, column: 16, scope: !2896)
!2903 = !DILocation(line: 68, column: 3, scope: !2896)
!2904 = !DILocation(line: 69, column: 3, scope: !2896)
!2905 = !DILocation(line: 70, column: 3, scope: !2896)
!2906 = !DILocation(line: 71, column: 3, scope: !2896)
!2907 = !DILocation(line: 72, column: 3, scope: !2896)
!2908 = !DILocation(line: 73, column: 1, scope: !2896)
!2909 = distinct !DISubprogram(name: "kyber_memset", scope: !2910, file: !2910, line: 3, type: !2911, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !75, retainedNodes: !24)
!2910 = !DIFile(filename: "../mem.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!2911 = !DISubroutineType(types: !2912)
!2912 = !{null, !2913, !7, !65}
!2913 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 32)
!2914 = !DILocalVariable(name: "dst", arg: 1, scope: !2909, file: !2910, line: 3, type: !2913)
!2915 = !DILocation(line: 0, scope: !2909)
!2916 = !DILocalVariable(name: "val", arg: 2, scope: !2909, file: !2910, line: 3, type: !7)
!2917 = !DILocalVariable(name: "len", arg: 3, scope: !2909, file: !2910, line: 3, type: !65)
!2918 = !DILocalVariable(name: "d", scope: !2909, file: !2910, line: 5, type: !6)
!2919 = !DILocalVariable(name: "i", scope: !2920, file: !2910, line: 7, type: !65)
!2920 = distinct !DILexicalBlock(scope: !2909, file: !2910, line: 7, column: 5)
!2921 = !DILocation(line: 0, scope: !2920)
!2922 = !DILocation(line: 7, column: 10, scope: !2920)
!2923 = !DILocation(line: 7, scope: !2920)
!2924 = !DILocation(line: 7, column: 28, scope: !2925)
!2925 = distinct !DILexicalBlock(scope: !2920, file: !2910, line: 7, column: 5)
!2926 = !DILocation(line: 7, column: 5, scope: !2920)
!2927 = !DILocation(line: 8, column: 9, scope: !2925)
!2928 = !DILocation(line: 8, column: 14, scope: !2925)
!2929 = !DILocation(line: 7, column: 36, scope: !2925)
!2930 = !DILocation(line: 7, column: 5, scope: !2925)
!2931 = distinct !{!2931, !2926, !2932, !107}
!2932 = !DILocation(line: 8, column: 16, scope: !2920)
!2933 = !DILocation(line: 9, column: 1, scope: !2909)
!2934 = distinct !DISubprogram(name: "kyber_memcpy", scope: !2910, file: !2910, line: 11, type: !2935, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !75, retainedNodes: !24)
!2935 = !DISubroutineType(types: !2936)
!2936 = !{null, !2913, !2937, !65}
!2937 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2938, size: 32)
!2938 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!2939 = !DILocalVariable(name: "dst", arg: 1, scope: !2934, file: !2910, line: 11, type: !2913)
!2940 = !DILocation(line: 0, scope: !2934)
!2941 = !DILocalVariable(name: "src", arg: 2, scope: !2934, file: !2910, line: 11, type: !2937)
!2942 = !DILocalVariable(name: "len", arg: 3, scope: !2934, file: !2910, line: 11, type: !65)
!2943 = !DILocalVariable(name: "d", scope: !2934, file: !2910, line: 13, type: !6)
!2944 = !DILocalVariable(name: "s", scope: !2934, file: !2910, line: 14, type: !234)
!2945 = !DILocalVariable(name: "i", scope: !2946, file: !2910, line: 16, type: !65)
!2946 = distinct !DILexicalBlock(scope: !2934, file: !2910, line: 16, column: 5)
!2947 = !DILocation(line: 0, scope: !2946)
!2948 = !DILocation(line: 16, column: 10, scope: !2946)
!2949 = !DILocation(line: 16, scope: !2946)
!2950 = !DILocation(line: 16, column: 28, scope: !2951)
!2951 = distinct !DILexicalBlock(scope: !2946, file: !2910, line: 16, column: 5)
!2952 = !DILocation(line: 16, column: 5, scope: !2946)
!2953 = !DILocation(line: 17, column: 16, scope: !2951)
!2954 = !DILocation(line: 17, column: 9, scope: !2951)
!2955 = !DILocation(line: 17, column: 14, scope: !2951)
!2956 = !DILocation(line: 16, column: 36, scope: !2951)
!2957 = !DILocation(line: 16, column: 5, scope: !2951)
!2958 = distinct !{!2958, !2952, !2959, !107}
!2959 = !DILocation(line: 17, column: 19, scope: !2946)
!2960 = !DILocation(line: 18, column: 1, scope: !2934)
