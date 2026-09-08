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
    #dbg_value(i16 %conv7, !1845, !DIExpression(), !1837)
  ret i16 %conv7, !dbg !1846
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqcrystals_kyber1024_ref_verify(ptr noundef %a, ptr noundef %b, i32 noundef %len) local_unnamed_addr #0 !dbg !1847 {
entry:
    #dbg_value(ptr %a, !1851, !DIExpression(), !1852)
    #dbg_value(ptr %b, !1853, !DIExpression(), !1852)
    #dbg_value(i32 %len, !1854, !DIExpression(), !1852)
    #dbg_value(i8 0, !1855, !DIExpression(), !1852)
    #dbg_value(i32 0, !1856, !DIExpression(), !1852)
  br label %for.cond, !dbg !1857

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1859
  %r.0 = phi i8 [ 0, %entry ], [ %or2, %for.inc ], !dbg !1852
    #dbg_value(i8 %r.0, !1855, !DIExpression(), !1852)
    #dbg_value(i32 %i.0, !1856, !DIExpression(), !1852)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !1860
  br i1 %exitcond, label %for.inc, label %for.end, !dbg !1862

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i8 poison, i8 poison, i8 poison), !1855, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1852)
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %i.0, !dbg !1863
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1863
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 %i.0, !dbg !1864
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !1864
    #dbg_value(!DIArgList(i8 %r.0, i8 %0, i8 %1), !1855, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1852)
  %xor1 = xor i8 %0, %1, !dbg !1865
    #dbg_value(!DIArgList(i8 %r.0, i8 %xor1), !1855, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1852)
  %or2 = or i8 %r.0, %xor1, !dbg !1866
    #dbg_value(i8 %or2, !1855, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1852)
    #dbg_value(i8 %or2, !1855, !DIExpression(), !1852)
  %inc = add i32 %i.0, 1, !dbg !1867
    #dbg_value(i32 %inc, !1856, !DIExpression(), !1852)
  br label %for.cond, !dbg !1868, !llvm.loop !1869

for.end:                                          ; preds = %for.cond
  %r.0.lcssa = phi i8 [ %r.0, %for.cond ], !dbg !1852
  %2 = icmp ne i8 %r.0.lcssa, 0, !dbg !1871
  %conv6 = zext i1 %2 to i32, !dbg !1872
  ret i32 %conv6, !dbg !1873
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_cmov(ptr noundef %r, ptr noundef %x, i32 noundef %len, i8 noundef zeroext %b) local_unnamed_addr #0 !dbg !1874 {
entry:
    #dbg_value(ptr %r, !1877, !DIExpression(), !1878)
    #dbg_value(ptr %x, !1879, !DIExpression(), !1878)
    #dbg_value(i32 %len, !1880, !DIExpression(), !1878)
    #dbg_value(i8 %b, !1881, !DIExpression(), !1878)
  %0 = call i8 asm "", "=r,0"(i8 %b) #5, !dbg !1882, !srcloc !1883
    #dbg_value(i8 %0, !1881, !DIExpression(), !1878)
  %sub = sub i8 0, %0, !dbg !1884
    #dbg_value(i8 %sub, !1881, !DIExpression(), !1878)
    #dbg_value(i32 0, !1885, !DIExpression(), !1878)
  br label %for.cond, !dbg !1886

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1888
    #dbg_value(i32 %i.0, !1885, !DIExpression(), !1878)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !1889
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1891

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !1892
  %1 = load i8, ptr %arrayidx, align 1, !dbg !1892
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !1893
  %2 = load i8, ptr %arrayidx5, align 1, !dbg !1893
  %xor1 = xor i8 %1, %2, !dbg !1894
  %and2 = and i8 %xor1, %sub, !dbg !1895
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !1896
  %xor93 = xor i8 %1, %and2, !dbg !1897
  store i8 %xor93, ptr %arrayidx7, align 1, !dbg !1897
  %inc = add i32 %i.0, 1, !dbg !1898
    #dbg_value(i32 %inc, !1885, !DIExpression(), !1878)
  br label %for.cond, !dbg !1899, !llvm.loop !1900

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1902
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_cmov_int16(ptr noundef %r, i16 noundef signext %v, i16 noundef zeroext %b) local_unnamed_addr #0 !dbg !1903 {
entry:
    #dbg_value(ptr %r, !1906, !DIExpression(), !1907)
    #dbg_value(i16 %v, !1908, !DIExpression(), !1907)
    #dbg_value(i16 %b, !1909, !DIExpression(), !1907)
  %sub = sub i16 0, %b, !dbg !1910
    #dbg_value(i16 %sub, !1909, !DIExpression(), !1907)
  %0 = load i16, ptr %r, align 2, !dbg !1911
  %xor1 = xor i16 %0, %v, !dbg !1912
  %and = and i16 %xor1, %sub, !dbg !1913
  %xor6 = xor i16 %and, %0, !dbg !1914
  store i16 %xor6, ptr %r, align 2, !dbg !1914
  ret void, !dbg !1915
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_init(ptr noundef %state) local_unnamed_addr #0 !dbg !1916 {
entry:
    #dbg_value(ptr %state, !1920, !DIExpression(), !1921)
  call fastcc void @keccak_init(ptr noundef %state) #3, !dbg !1922
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1923
  store i64 0, ptr %arrayidx, align 8, !dbg !1924
  ret void, !dbg !1925
}

; Function Attrs: nounwind
define internal fastcc void @keccak_init(ptr noundef %s) unnamed_addr #0 !dbg !1926 {
entry:
    #dbg_value(ptr %s, !1930, !DIExpression(), !1931)
    #dbg_value(i32 0, !1932, !DIExpression(), !1931)
  br label %for.cond, !dbg !1933

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1935
    #dbg_value(i32 %i.0, !1932, !DIExpression(), !1931)
  %exitcond = icmp ne i32 %i.0, 25, !dbg !1936
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1938

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !1939
  store i64 0, ptr %arrayidx, align 8, !dbg !1940
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1941
    #dbg_value(i32 %inc, !1932, !DIExpression(), !1931)
  br label %for.cond, !dbg !1942, !llvm.loop !1943

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1945
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !1946 {
entry:
    #dbg_value(ptr %state, !1949, !DIExpression(), !1950)
    #dbg_value(ptr %in, !1951, !DIExpression(), !1950)
    #dbg_value(i32 %inlen, !1952, !DIExpression(), !1950)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1953
  %0 = load i64, ptr %arrayidx, align 8, !dbg !1953
  %conv = trunc i64 %0 to i32, !dbg !1953
  %call = call fastcc i32 @keccak_absorb(ptr noundef %state, i32 noundef %conv, i32 noundef 168, ptr noundef %in, i32 noundef %inlen) #3, !dbg !1954
  %conv1 = zext i32 %call to i64, !dbg !1954
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1955
  store i64 %conv1, ptr %arrayidx2, align 8, !dbg !1956
  ret void, !dbg !1957
}

; Function Attrs: nounwind
define internal fastcc i32 @keccak_absorb(ptr noundef %s, i32 noundef %pos, i32 noundef range(i32 136, 169) %r, ptr noundef %in, i32 noundef %inlen) unnamed_addr #0 !dbg !1958 {
entry:
    #dbg_value(ptr %s, !1961, !DIExpression(), !1962)
    #dbg_value(i32 %pos, !1963, !DIExpression(), !1962)
    #dbg_value(i32 %r, !1964, !DIExpression(), !1962)
    #dbg_value(ptr %in, !1965, !DIExpression(), !1962)
    #dbg_value(i32 %inlen, !1966, !DIExpression(), !1962)
  br label %while.cond, !dbg !1967

while.cond:                                       ; preds = %for.end, %entry
  %in.addr.0 = phi ptr [ %in, %entry ], [ %in.addr.1.lcssa, %for.end ]
  %inlen.addr.0 = phi i32 [ %inlen, %entry ], [ %sub2, %for.end ]
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ 0, %for.end ]
    #dbg_value(i32 %pos.addr.0, !1963, !DIExpression(), !1962)
    #dbg_value(i32 %inlen.addr.0, !1966, !DIExpression(), !1962)
    #dbg_value(ptr %in.addr.0, !1965, !DIExpression(), !1962)
  %add = add i32 %pos.addr.0, %inlen.addr.0, !dbg !1968
  %cmp.not = icmp ult i32 %add, %r, !dbg !1969
  br i1 %cmp.not, label %for.cond3.preheader, label %for.cond.preheader, !dbg !1967

for.cond.preheader:                               ; preds = %while.cond
  %umax = call i32 @llvm.umax.i32(i32 %pos.addr.0, i32 %r), !dbg !1970
  br label %for.cond, !dbg !1970

for.cond3.preheader:                              ; preds = %while.cond
  %in.addr.0.lcssa = phi ptr [ %in.addr.0, %while.cond ]
  %inlen.addr.0.lcssa = phi i32 [ %inlen.addr.0, %while.cond ]
  %pos.addr.0.lcssa = phi i32 [ %pos.addr.0, %while.cond ]
  br label %for.cond3, !dbg !1973

for.cond:                                         ; preds = %for.cond.preheader, %for.body
  %in.addr.1 = phi ptr [ %incdec.ptr, %for.body ], [ %in.addr.0, %for.cond.preheader ]
  %i.0 = phi i32 [ %inc, %for.body ], [ %pos.addr.0, %for.cond.preheader ], !dbg !1975
    #dbg_value(i32 %i.0, !1976, !DIExpression(), !1962)
    #dbg_value(ptr %in.addr.1, !1965, !DIExpression(), !1962)
  %exitcond = icmp ne i32 %i.0, %umax, !dbg !1977
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1970

for.body:                                         ; preds = %for.cond
    #dbg_value(ptr %in.addr.1, !1965, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1962)
  %0 = load i8, ptr %in.addr.1, align 1, !dbg !1979
  %conv = zext i8 %0 to i64, !dbg !1980
  %rem = shl nuw nsw i32 %i.0, 3, !dbg !1981
  %mul = and i32 %rem, 56, !dbg !1981
  %sh_prom = zext nneg i32 %mul to i64, !dbg !1982
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !1982
  %div2 = lshr i32 %i.0, 3, !dbg !1983
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div2, !dbg !1984
  %1 = load i64, ptr %arrayidx, align 8, !dbg !1985
  %xor = xor i64 %1, %shl, !dbg !1985
  store i64 %xor, ptr %arrayidx, align 8, !dbg !1985
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %in.addr.1, i32 1, !dbg !1986
    #dbg_value(ptr %incdec.ptr, !1965, !DIExpression(), !1962)
  %inc = add i32 %i.0, 1, !dbg !1987
    #dbg_value(i32 %inc, !1976, !DIExpression(), !1962)
  br label %for.cond, !dbg !1988, !llvm.loop !1989

for.end:                                          ; preds = %for.cond
  %in.addr.1.lcssa = phi ptr [ %in.addr.1, %for.cond ]
  %sub.neg = sub i32 %pos.addr.0, %r, !dbg !1991
  %sub2 = add i32 %sub.neg, %inlen.addr.0, !dbg !1992
    #dbg_value(i32 %sub2, !1966, !DIExpression(), !1962)
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !1993
    #dbg_value(i32 0, !1963, !DIExpression(), !1962)
  br label %while.cond, !dbg !1967, !llvm.loop !1994

for.cond3:                                        ; preds = %for.cond3.preheader, %for.body7
  %in.addr.2 = phi ptr [ %incdec.ptr8, %for.body7 ], [ %in.addr.0.lcssa, %for.cond3.preheader ]
  %i.1 = phi i32 [ %inc18, %for.body7 ], [ %pos.addr.0.lcssa, %for.cond3.preheader ], !dbg !1996
    #dbg_value(i32 %i.1, !1976, !DIExpression(), !1962)
    #dbg_value(ptr %in.addr.2, !1965, !DIExpression(), !1962)
  %add4 = add i32 %pos.addr.0.lcssa, %inlen.addr.0.lcssa, !dbg !1997
  %cmp5 = icmp ult i32 %i.1, %add4, !dbg !1999
  br i1 %cmp5, label %for.body7, label %for.end19, !dbg !1973

for.body7:                                        ; preds = %for.cond3
    #dbg_value(ptr %in.addr.2, !1965, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1962)
  %2 = load i8, ptr %in.addr.2, align 1, !dbg !2000
  %conv9 = zext i8 %2 to i64, !dbg !2001
  %rem10 = shl i32 %i.1, 3, !dbg !2002
  %mul11 = and i32 %rem10, 56, !dbg !2002
  %sh_prom12 = zext nneg i32 %mul11 to i64, !dbg !2003
  %shl13 = shl nuw i64 %conv9, %sh_prom12, !dbg !2003
  %div141 = lshr i32 %i.1, 3, !dbg !2004
  %arrayidx15 = getelementptr inbounds nuw i64, ptr %s, i32 %div141, !dbg !2005
  %3 = load i64, ptr %arrayidx15, align 8, !dbg !2006
  %xor16 = xor i64 %3, %shl13, !dbg !2006
  store i64 %xor16, ptr %arrayidx15, align 8, !dbg !2006
  %incdec.ptr8 = getelementptr inbounds nuw i8, ptr %in.addr.2, i32 1, !dbg !2007
    #dbg_value(ptr %incdec.ptr8, !1965, !DIExpression(), !1962)
  %inc18 = add nuw i32 %i.1, 1, !dbg !2008
    #dbg_value(i32 %inc18, !1976, !DIExpression(), !1962)
  br label %for.cond3, !dbg !2009, !llvm.loop !2010

for.end19:                                        ; preds = %for.cond3
  %i.1.lcssa = phi i32 [ %i.1, %for.cond3 ], !dbg !1996
  ret i32 %i.1.lcssa, !dbg !2012
}

; Function Attrs: nounwind
define internal fastcc void @KeccakF1600_StatePermute(ptr noundef %state) unnamed_addr #0 !dbg !2013 {
entry:
    #dbg_value(ptr %state, !2014, !DIExpression(), !2015)
  %0 = load i64, ptr %state, align 8, !dbg !2016
    #dbg_value(i64 %0, !2017, !DIExpression(), !2015)
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !2018
  %1 = load i64, ptr %arrayidx1, align 8, !dbg !2018
    #dbg_value(i64 %1, !2019, !DIExpression(), !2015)
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !2020
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !2020
    #dbg_value(i64 %2, !2021, !DIExpression(), !2015)
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !2022
  %3 = load i64, ptr %arrayidx3, align 8, !dbg !2022
    #dbg_value(i64 %3, !2023, !DIExpression(), !2015)
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !2024
  %4 = load i64, ptr %arrayidx4, align 8, !dbg !2024
    #dbg_value(i64 %4, !2025, !DIExpression(), !2015)
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !2026
  %5 = load i64, ptr %arrayidx5, align 8, !dbg !2026
    #dbg_value(i64 %5, !2027, !DIExpression(), !2015)
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !2028
  %6 = load i64, ptr %arrayidx6, align 8, !dbg !2028
    #dbg_value(i64 %6, !2029, !DIExpression(), !2015)
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !2030
  %7 = load i64, ptr %arrayidx7, align 8, !dbg !2030
    #dbg_value(i64 %7, !2031, !DIExpression(), !2015)
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !2032
  %8 = load i64, ptr %arrayidx8, align 8, !dbg !2032
    #dbg_value(i64 %8, !2033, !DIExpression(), !2015)
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !2034
  %9 = load i64, ptr %arrayidx9, align 8, !dbg !2034
    #dbg_value(i64 %9, !2035, !DIExpression(), !2015)
  %arrayidx10 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !2036
  %10 = load i64, ptr %arrayidx10, align 8, !dbg !2036
    #dbg_value(i64 %10, !2037, !DIExpression(), !2015)
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !2038
  %11 = load i64, ptr %arrayidx11, align 8, !dbg !2038
    #dbg_value(i64 %11, !2039, !DIExpression(), !2015)
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !2040
  %12 = load i64, ptr %arrayidx12, align 8, !dbg !2040
    #dbg_value(i64 %12, !2041, !DIExpression(), !2015)
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !2042
  %13 = load i64, ptr %arrayidx13, align 8, !dbg !2042
    #dbg_value(i64 %13, !2043, !DIExpression(), !2015)
  %arrayidx14 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !2044
  %14 = load i64, ptr %arrayidx14, align 8, !dbg !2044
    #dbg_value(i64 %14, !2045, !DIExpression(), !2015)
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !2046
  %15 = load i64, ptr %arrayidx15, align 8, !dbg !2046
    #dbg_value(i64 %15, !2047, !DIExpression(), !2015)
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !2048
  %16 = load i64, ptr %arrayidx16, align 8, !dbg !2048
    #dbg_value(i64 %16, !2049, !DIExpression(), !2015)
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !2050
  %17 = load i64, ptr %arrayidx17, align 8, !dbg !2050
    #dbg_value(i64 %17, !2051, !DIExpression(), !2015)
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !2052
  %18 = load i64, ptr %arrayidx18, align 8, !dbg !2052
    #dbg_value(i64 %18, !2053, !DIExpression(), !2015)
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !2054
  %19 = load i64, ptr %arrayidx19, align 8, !dbg !2054
    #dbg_value(i64 %19, !2055, !DIExpression(), !2015)
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !2056
  %20 = load i64, ptr %arrayidx20, align 8, !dbg !2056
    #dbg_value(i64 %20, !2057, !DIExpression(), !2015)
  %arrayidx21 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !2058
  %21 = load i64, ptr %arrayidx21, align 8, !dbg !2058
    #dbg_value(i64 %21, !2059, !DIExpression(), !2015)
  %arrayidx22 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !2060
  %22 = load i64, ptr %arrayidx22, align 8, !dbg !2060
    #dbg_value(i64 %22, !2061, !DIExpression(), !2015)
  %arrayidx23 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !2062
  %23 = load i64, ptr %arrayidx23, align 8, !dbg !2062
    #dbg_value(i64 %23, !2063, !DIExpression(), !2015)
  %arrayidx24 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !2064
  %24 = load i64, ptr %arrayidx24, align 8, !dbg !2064
    #dbg_value(i64 %24, !2065, !DIExpression(), !2015)
    #dbg_value(i32 0, !2066, !DIExpression(), !2015)
  br label %for.cond, !dbg !2067

for.cond:                                         ; preds = %for.inc, %entry
  %Aso.0 = phi i64 [ %23, %entry ], [ %xor444, %for.inc ], !dbg !2015
  %Asi.0 = phi i64 [ %22, %entry ], [ %xor441, %for.inc ], !dbg !2015
  %Ase.0 = phi i64 [ %21, %entry ], [ %xor438, %for.inc ], !dbg !2015
  %Asa.0 = phi i64 [ %20, %entry ], [ %xor435, %for.inc ], !dbg !2015
  %Amu.0 = phi i64 [ %19, %entry ], [ %xor412, %for.inc ], !dbg !2015
  %Amo.0 = phi i64 [ %18, %entry ], [ %xor409, %for.inc ], !dbg !2015
  %Ami.0 = phi i64 [ %17, %entry ], [ %xor406, %for.inc ], !dbg !2015
  %Ame.0 = phi i64 [ %16, %entry ], [ %xor403, %for.inc ], !dbg !2015
  %Ama.0 = phi i64 [ %15, %entry ], [ %xor400, %for.inc ], !dbg !2015
  %Aku.0 = phi i64 [ %14, %entry ], [ %xor377, %for.inc ], !dbg !2015
  %Ako.0 = phi i64 [ %13, %entry ], [ %xor374, %for.inc ], !dbg !2015
  %Aki.0 = phi i64 [ %12, %entry ], [ %xor371, %for.inc ], !dbg !2015
  %Ake.0 = phi i64 [ %11, %entry ], [ %xor368, %for.inc ], !dbg !2015
  %Aka.0 = phi i64 [ %10, %entry ], [ %xor365, %for.inc ], !dbg !2015
  %Agu.0 = phi i64 [ %9, %entry ], [ %xor342, %for.inc ], !dbg !2015
  %Ago.0 = phi i64 [ %8, %entry ], [ %xor339, %for.inc ], !dbg !2015
  %Agi.0 = phi i64 [ %7, %entry ], [ %xor336, %for.inc ], !dbg !2015
  %Age.0 = phi i64 [ %6, %entry ], [ %xor333, %for.inc ], !dbg !2015
  %Aga.0 = phi i64 [ %5, %entry ], [ %xor330, %for.inc ], !dbg !2015
  %Abu.0 = phi i64 [ %4, %entry ], [ %xor307, %for.inc ], !dbg !2015
  %Abo.0 = phi i64 [ %3, %entry ], [ %xor304, %for.inc ], !dbg !2015
  %Abi.0 = phi i64 [ %2, %entry ], [ %xor301, %for.inc ], !dbg !2015
  %Abe.0 = phi i64 [ %1, %entry ], [ %xor298, %for.inc ], !dbg !2015
  %Aba.0 = phi i64 [ %0, %entry ], [ %xor295, %for.inc ], !dbg !2015
  %round.0 = phi i32 [ 0, %entry ], [ %add448, %for.inc ], !dbg !2069
  %Asu.0 = phi i64 [ %24, %entry ], [ %xor447, %for.inc ], !dbg !2015
    #dbg_value(i64 %Asu.0, !2065, !DIExpression(), !2015)
    #dbg_value(i32 %round.0, !2066, !DIExpression(), !2015)
    #dbg_value(i64 %Aba.0, !2017, !DIExpression(), !2015)
    #dbg_value(i64 %Abe.0, !2019, !DIExpression(), !2015)
    #dbg_value(i64 %Abi.0, !2021, !DIExpression(), !2015)
    #dbg_value(i64 %Abo.0, !2023, !DIExpression(), !2015)
    #dbg_value(i64 %Abu.0, !2025, !DIExpression(), !2015)
    #dbg_value(i64 %Aga.0, !2027, !DIExpression(), !2015)
    #dbg_value(i64 %Age.0, !2029, !DIExpression(), !2015)
    #dbg_value(i64 %Agi.0, !2031, !DIExpression(), !2015)
    #dbg_value(i64 %Ago.0, !2033, !DIExpression(), !2015)
    #dbg_value(i64 %Agu.0, !2035, !DIExpression(), !2015)
    #dbg_value(i64 %Aka.0, !2037, !DIExpression(), !2015)
    #dbg_value(i64 %Ake.0, !2039, !DIExpression(), !2015)
    #dbg_value(i64 %Aki.0, !2041, !DIExpression(), !2015)
    #dbg_value(i64 %Ako.0, !2043, !DIExpression(), !2015)
    #dbg_value(i64 %Aku.0, !2045, !DIExpression(), !2015)
    #dbg_value(i64 %Ama.0, !2047, !DIExpression(), !2015)
    #dbg_value(i64 %Ame.0, !2049, !DIExpression(), !2015)
    #dbg_value(i64 %Ami.0, !2051, !DIExpression(), !2015)
    #dbg_value(i64 %Amo.0, !2053, !DIExpression(), !2015)
    #dbg_value(i64 %Amu.0, !2055, !DIExpression(), !2015)
    #dbg_value(i64 %Asa.0, !2057, !DIExpression(), !2015)
    #dbg_value(i64 %Ase.0, !2059, !DIExpression(), !2015)
    #dbg_value(i64 %Asi.0, !2061, !DIExpression(), !2015)
    #dbg_value(i64 %Aso.0, !2063, !DIExpression(), !2015)
  %cmp = icmp samesign ult i32 %round.0, 24, !dbg !2070
  br i1 %cmp, label %for.inc, label %for.end, !dbg !2072

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %Asa.0, i64 %Ama.0, i64 %Aka.0, i64 %Aga.0), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %Ase.0, i64 %Ame.0, i64 %Ake.0, i64 %Age.0), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %Asi.0, i64 %Ami.0, i64 %Aki.0, i64 %Agi.0), !2075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %Aso.0, i64 %Amo.0, i64 %Ako.0, i64 %Ago.0), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %Asu.0, i64 %Amu.0, i64 %Aku.0, i64 %Agu.0), !2077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2078, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2079, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2080, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2081, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2082, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2017, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2029, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2074, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2041, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2075, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2053, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2076, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2065, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2077, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2083, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2083, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2084, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2085, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2086, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2087, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2073, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2035, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2074, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2037, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2075, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2049, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2076, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2061, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2077, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2088, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2089, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2090, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2091, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2092, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2019, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2073, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2031, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2074, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2043, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2075, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2055, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2076, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2057, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2077, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2093, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2094, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2095, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2096, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2097, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2025, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2073, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2027, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2074, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2039, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2075, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2051, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2076, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2063, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2077, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2098, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2099, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2100, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2101, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2102, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2021, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2073, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2033, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2074, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2045, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2075, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2047, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2076, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2059, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2077, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2103, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2104, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2105, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2106, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2107, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2078, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2079, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2080, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2081, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2082, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2083, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2089, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2074, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2095, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2075, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2101, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2076, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2107, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2077, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2017, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2017, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2019, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2021, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2025, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2086, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2073, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2092, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2074, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2093, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2075, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2099, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2076, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2105, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2077, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2027, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2029, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2031, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2033, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2035, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2084, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2073, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2090, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2074, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2096, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2075, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2102, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2076, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2103, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2077, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2037, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2039, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2041, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2043, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2045, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2087, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2073, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2088, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2074, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2094, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2075, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2100, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2076, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2106, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2077, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2047, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2049, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2051, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2053, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2055, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2085, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2073, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2091, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2074, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2097, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2075, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2098, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2076, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2104, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 poison, !2077, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2057, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2059, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2061, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2063, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2065, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor32 = xor i64 %Abi.0, %Agi.0, !dbg !2108
    #dbg_value(!DIArgList(i64 %xor32, i64 %Asi.0, i64 %Ami.0, i64 %Aki.0), !2075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor33 = xor i64 %xor32, %Aki.0, !dbg !2110
    #dbg_value(!DIArgList(i64 %xor33, i64 %Asi.0, i64 %Ami.0), !2075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor34 = xor i64 %xor33, %Ami.0, !dbg !2111
    #dbg_value(!DIArgList(i64 %xor34, i64 %Asi.0), !2075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor35 = xor i64 %xor34, %Asi.0, !dbg !2112
    #dbg_value(i64 %xor35, !2075, !DIExpression(), !2015)
  %xor40 = xor i64 %Abu.0, %Agu.0, !dbg !2113
    #dbg_value(!DIArgList(i64 %xor40, i64 %Asu.0, i64 %Amu.0, i64 %Aku.0), !2077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor41 = xor i64 %xor40, %Aku.0, !dbg !2114
    #dbg_value(!DIArgList(i64 %xor41, i64 %Asu.0, i64 %Amu.0), !2077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor42 = xor i64 %xor41, %Amu.0, !dbg !2115
    #dbg_value(!DIArgList(i64 %xor42, i64 %Asu.0), !2077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor43 = xor i64 %xor42, %Asu.0, !dbg !2116
    #dbg_value(i64 %xor43, !2077, !DIExpression(), !2015)
  %25 = shl i64 %xor43, 1, !dbg !2117
  %26 = lshr i64 %xor43, 63, !dbg !2117
  %27 = or i64 %25, %26, !dbg !2117
    #dbg_value(!DIArgList(i64 %Ago.0, i64 %xor35, i64 %27), !2033, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %xor35, i64 %27), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Ako.0, i64 %xor35, i64 %27), !2043, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Amo.0, i64 %xor35, i64 %27), !2053, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Aso.0, i64 %xor35, i64 %27), !2063, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor35, i64 %27), !2081, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor57 = xor i64 %xor35, %27, !dbg !2118
    #dbg_value(!DIArgList(i64 %Ago.0, i64 %xor57), !2033, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %xor57), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Ako.0, i64 %xor57), !2043, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Amo.0, i64 %xor57), !2053, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Aso.0, i64 %xor57), !2063, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 %xor57, !2081, !DIExpression(), !2015)
  %xor203 = xor i64 %Ago.0, %xor57, !dbg !2119
    #dbg_value(i64 %xor203, !2033, !DIExpression(), !2015)
  %28 = shl i64 %xor203, 55, !dbg !2120
  %29 = lshr i64 %xor203, 9, !dbg !2120
  %30 = or i64 %28, %29, !dbg !2120
    #dbg_value(i64 %30, !2074, !DIExpression(), !2015)
  %xor28 = xor i64 %Abe.0, %Age.0, !dbg !2121
    #dbg_value(!DIArgList(i64 %xor28, i64 %Ase.0, i64 %Ame.0, i64 %Ake.0), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor29 = xor i64 %xor28, %Ake.0, !dbg !2122
    #dbg_value(!DIArgList(i64 %xor29, i64 %Ase.0, i64 %Ame.0), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor30 = xor i64 %xor29, %Ame.0, !dbg !2123
    #dbg_value(!DIArgList(i64 %xor30, i64 %Ase.0), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor31 = xor i64 %xor30, %Ase.0, !dbg !2124
    #dbg_value(i64 %xor31, !2074, !DIExpression(), !2015)
  %31 = shl i64 %xor31, 1, !dbg !2125
  %32 = lshr i64 %xor31, 63, !dbg !2125
  %33 = or i64 %31, %32, !dbg !2125
    #dbg_value(!DIArgList(i64 %xor43, i64 %33), !2078, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor43, i64 %33), !2017, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor43, i64 %33), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Aka.0, i64 %xor43, i64 %33), !2037, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Aga.0, i64 %xor43, i64 %33), !2027, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Asa.0, i64 %xor43, i64 %33), !2057, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Ama.0, i64 %xor43, i64 %33), !2047, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor45 = xor i64 %xor43, %33, !dbg !2126
    #dbg_value(i64 %xor45, !2078, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor45), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor45), !2017, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Aka.0, i64 %xor45), !2037, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Aga.0, i64 %xor45), !2027, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Asa.0, i64 %xor45), !2057, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Ama.0, i64 %xor45), !2047, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor211 = xor i64 %Ama.0, %xor45, !dbg !2127
    #dbg_value(i64 %xor211, !2047, !DIExpression(), !2015)
  %34 = shl i64 %xor211, 41, !dbg !2128
  %35 = lshr i64 %xor211, 23, !dbg !2128
  %36 = or i64 %34, %35, !dbg !2128
    #dbg_value(i64 %36, !2076, !DIExpression(), !2015)
  %xor36 = xor i64 %Abo.0, %Ago.0, !dbg !2129
    #dbg_value(!DIArgList(i64 %xor36, i64 %Aso.0, i64 %Amo.0, i64 %Ako.0), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor37 = xor i64 %xor36, %Ako.0, !dbg !2130
    #dbg_value(!DIArgList(i64 %xor37, i64 %Aso.0, i64 %Amo.0), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor38 = xor i64 %xor37, %Amo.0, !dbg !2131
    #dbg_value(!DIArgList(i64 %xor38, i64 %Aso.0), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor39 = xor i64 %xor38, %Aso.0, !dbg !2132
    #dbg_value(i64 %xor39, !2076, !DIExpression(), !2015)
  %xor = xor i64 %Aba.0, %Aga.0, !dbg !2133
    #dbg_value(!DIArgList(i64 %xor, i64 %Asa.0, i64 %Ama.0, i64 %Aka.0), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor25 = xor i64 %xor, %Aka.0, !dbg !2134
    #dbg_value(!DIArgList(i64 %xor25, i64 %Asa.0, i64 %Ama.0), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor26 = xor i64 %xor25, %Ama.0, !dbg !2135
    #dbg_value(!DIArgList(i64 %xor26, i64 %Asa.0), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor27 = xor i64 %xor26, %Asa.0, !dbg !2136
    #dbg_value(i64 %xor27, !2073, !DIExpression(), !2015)
  %37 = shl i64 %xor27, 1, !dbg !2137
  %38 = lshr i64 %xor27, 63, !dbg !2137
  %39 = or i64 %37, %38, !dbg !2137
    #dbg_value(!DIArgList(i64 %Agu.0, i64 %xor39, i64 %39), !2035, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %xor39, i64 %39), !2025, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Asu.0, i64 %xor39, i64 %39), !2065, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Amu.0, i64 %xor39, i64 %39), !2055, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor39, i64 %39), !2082, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Aku.0, i64 %xor39, i64 %39), !2045, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor61 = xor i64 %xor39, %39, !dbg !2138
    #dbg_value(!DIArgList(i64 %Agu.0, i64 %xor61), !2035, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %xor61), !2025, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Asu.0, i64 %xor61), !2065, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Amu.0, i64 %xor61), !2055, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 %xor61, !2082, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 %Aku.0, i64 %xor61), !2045, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor207 = xor i64 %Aku.0, %xor61, !dbg !2139
    #dbg_value(i64 %xor207, !2045, !DIExpression(), !2015)
  %40 = shl i64 %xor207, 39, !dbg !2140
  %41 = lshr i64 %xor207, 25, !dbg !2140
  %42 = or i64 %40, %41, !dbg !2140
    #dbg_value(i64 %42, !2075, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 %30, i64 %36, i64 %42), !2104, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %not222 = xor i64 %42, -1, !dbg !2141
    #dbg_value(!DIArgList(i64 %30, i64 %36, i64 %not222), !2104, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %and223 = and i64 %36, %not222, !dbg !2142
    #dbg_value(!DIArgList(i64 %30, i64 %and223), !2104, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor224 = xor i64 %30, %and223, !dbg !2143
    #dbg_value(i64 %xor224, !2104, !DIExpression(), !2015)
  %43 = shl i64 %xor39, 1, !dbg !2144
  %44 = lshr i64 %xor39, 63, !dbg !2144
  %45 = or i64 %43, %44, !dbg !2144
    #dbg_value(!DIArgList(i64 %xor31, i64 %45), !2080, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Aki.0, i64 %xor31, i64 %45), !2041, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Agi.0, i64 %xor31, i64 %45), !2031, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %xor31, i64 %45), !2021, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Asi.0, i64 %xor31, i64 %45), !2061, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Ami.0, i64 %xor31, i64 %45), !2051, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor53 = xor i64 %xor31, %45, !dbg !2145
    #dbg_value(i64 %xor53, !2080, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 %Aki.0, i64 %xor53), !2041, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Agi.0, i64 %xor53), !2031, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %xor53), !2021, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Asi.0, i64 %xor53), !2061, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Ami.0, i64 %xor53), !2051, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor67 = xor i64 %Aki.0, %xor53, !dbg !2146
    #dbg_value(i64 %xor67, !2041, !DIExpression(), !2015)
  %46 = shl i64 %xor67, 43, !dbg !2147
  %47 = lshr i64 %xor67, 21, !dbg !2147
  %48 = or i64 %46, %47, !dbg !2147
    #dbg_value(i64 %48, !2075, !DIExpression(), !2015)
  %49 = shl i64 %xor35, 1, !dbg !2148
  %50 = lshr i64 %xor35, 63, !dbg !2148
  %51 = or i64 %49, %50, !dbg !2148
    #dbg_value(!DIArgList(i64 %xor27, i64 %51), !2079, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Age.0, i64 %xor27, i64 %51), !2029, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %xor27, i64 %51), !2019, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Ake.0, i64 %xor27, i64 %51), !2039, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Ame.0, i64 %xor27, i64 %51), !2049, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Ase.0, i64 %xor27, i64 %51), !2059, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor49 = xor i64 %xor27, %51, !dbg !2149
    #dbg_value(i64 %xor49, !2079, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 %Age.0, i64 %xor49), !2029, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %xor49), !2019, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Ake.0, i64 %xor49), !2039, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Ame.0, i64 %xor49), !2049, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %Ase.0, i64 %xor49), !2059, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor63 = xor i64 %Age.0, %xor49, !dbg !2150
    #dbg_value(i64 %xor63, !2029, !DIExpression(), !2015)
  %52 = shl i64 %xor63, 44, !dbg !2151
  %53 = lshr i64 %xor63, 20, !dbg !2151
  %54 = or i64 %52, %53, !dbg !2151
    #dbg_value(i64 %54, !2074, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %48, i64 %xor45, i64 %54), !2083, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %not = xor i64 %54, -1, !dbg !2152
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %48, i64 %xor45, i64 %not), !2083, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %and = and i64 %48, %not, !dbg !2153
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %and, i64 %xor45), !2083, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %arrayidx80 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %round.0, !dbg !2154
  %55 = load i64, ptr %arrayidx80, align 8, !dbg !2154
    #dbg_value(!DIArgList(i64 %and, i64 %Aba.0, i64 %xor45, i64 %55), !2083, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
  %56 = xor i64 %and, %55, !dbg !2155
    #dbg_value(!DIArgList(i64 %56, i64 %Aba.0, i64 %xor45), !2083, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor62 = xor i64 %Aba.0, %xor45, !dbg !2156
    #dbg_value(i64 %xor62, !2017, !DIExpression(), !2015)
    #dbg_value(i64 %xor62, !2073, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 %56, i64 %xor62), !2083, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor81 = xor i64 %56, %xor62, !dbg !2155
    #dbg_value(i64 %xor81, !2083, !DIExpression(), !2015)
  %xor94 = xor i64 %Abo.0, %xor57, !dbg !2157
    #dbg_value(i64 %xor94, !2023, !DIExpression(), !2015)
  %57 = shl i64 %xor94, 28, !dbg !2158
  %58 = lshr i64 %xor94, 36, !dbg !2158
  %59 = or i64 %57, %58, !dbg !2158
    #dbg_value(i64 %59, !2073, !DIExpression(), !2015)
  %xor102 = xor i64 %Aka.0, %xor45, !dbg !2159
    #dbg_value(i64 %xor102, !2037, !DIExpression(), !2015)
  %60 = shl i64 %xor102, 3, !dbg !2160
  %61 = lshr i64 %xor102, 61, !dbg !2160
  %62 = or i64 %60, %61, !dbg !2160
    #dbg_value(i64 %62, !2075, !DIExpression(), !2015)
  %xor98 = xor i64 %Agu.0, %xor61, !dbg !2161
    #dbg_value(i64 %xor98, !2035, !DIExpression(), !2015)
  %63 = shl i64 %xor98, 20, !dbg !2162
  %64 = lshr i64 %xor98, 44, !dbg !2162
  %65 = or i64 %63, %64, !dbg !2162
    #dbg_value(i64 %65, !2074, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 %59, i64 %62, i64 %65), !2088, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %not114 = xor i64 %65, -1, !dbg !2163
    #dbg_value(!DIArgList(i64 %59, i64 %62, i64 %not114), !2088, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %and115 = and i64 %62, %not114, !dbg !2164
    #dbg_value(!DIArgList(i64 %59, i64 %and115), !2088, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor116 = xor i64 %59, %and115, !dbg !2165
    #dbg_value(i64 %xor116, !2088, !DIExpression(), !2015)
  %xor234 = xor i64 %xor81, %xor116, !dbg !2166
  %xor129 = xor i64 %Abe.0, %xor49, !dbg !2167
    #dbg_value(i64 %xor129, !2019, !DIExpression(), !2015)
  %66 = shl i64 %xor129, 1, !dbg !2168
  %67 = lshr i64 %xor129, 63, !dbg !2168
  %68 = or i64 %66, %67, !dbg !2168
    #dbg_value(i64 %68, !2073, !DIExpression(), !2015)
  %xor137 = xor i64 %Ako.0, %xor57, !dbg !2169
    #dbg_value(i64 %xor137, !2043, !DIExpression(), !2015)
  %69 = shl i64 %xor137, 25, !dbg !2170
  %70 = lshr i64 %xor137, 39, !dbg !2170
  %71 = or i64 %69, %70, !dbg !2170
    #dbg_value(i64 %71, !2075, !DIExpression(), !2015)
  %xor133 = xor i64 %Agi.0, %xor53, !dbg !2171
    #dbg_value(i64 %xor133, !2031, !DIExpression(), !2015)
  %72 = shl i64 %xor133, 6, !dbg !2172
  %73 = lshr i64 %xor133, 58, !dbg !2172
  %74 = or i64 %72, %73, !dbg !2172
    #dbg_value(i64 %74, !2074, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 %68, i64 %71, i64 %74), !2093, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %not149 = xor i64 %74, -1, !dbg !2173
    #dbg_value(!DIArgList(i64 %68, i64 %71, i64 %not149), !2093, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %and150 = and i64 %71, %not149, !dbg !2174
    #dbg_value(!DIArgList(i64 %68, i64 %and150), !2093, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor151 = xor i64 %68, %and150, !dbg !2175
    #dbg_value(i64 %xor151, !2093, !DIExpression(), !2015)
  %xor235 = xor i64 %xor234, %xor151, !dbg !2176
  %xor164 = xor i64 %Abu.0, %xor61, !dbg !2177
    #dbg_value(i64 %xor164, !2025, !DIExpression(), !2015)
  %75 = shl i64 %xor164, 27, !dbg !2178
  %76 = lshr i64 %xor164, 37, !dbg !2178
  %77 = or i64 %75, %76, !dbg !2178
    #dbg_value(i64 %77, !2073, !DIExpression(), !2015)
  %xor172 = xor i64 %Ake.0, %xor49, !dbg !2179
    #dbg_value(i64 %xor172, !2039, !DIExpression(), !2015)
  %78 = shl i64 %xor172, 10, !dbg !2180
  %79 = lshr i64 %xor172, 54, !dbg !2180
  %80 = or i64 %78, %79, !dbg !2180
    #dbg_value(i64 %80, !2075, !DIExpression(), !2015)
  %xor168 = xor i64 %Aga.0, %xor45, !dbg !2181
    #dbg_value(i64 %xor168, !2027, !DIExpression(), !2015)
  %81 = shl i64 %xor168, 36, !dbg !2182
  %82 = lshr i64 %xor168, 28, !dbg !2182
  %83 = or i64 %81, %82, !dbg !2182
    #dbg_value(i64 %83, !2074, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 %77, i64 %80, i64 %83), !2098, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %not184 = xor i64 %83, -1, !dbg !2183
    #dbg_value(!DIArgList(i64 %77, i64 %80, i64 %not184), !2098, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %and185 = and i64 %80, %not184, !dbg !2184
    #dbg_value(!DIArgList(i64 %77, i64 %and185), !2098, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor186 = xor i64 %77, %and185, !dbg !2185
    #dbg_value(i64 %xor186, !2098, !DIExpression(), !2015)
  %xor236 = xor i64 %xor235, %xor186, !dbg !2186
  %xor199 = xor i64 %Abi.0, %xor53, !dbg !2187
    #dbg_value(i64 %xor199, !2021, !DIExpression(), !2015)
  %84 = shl i64 %xor199, 62, !dbg !2188
  %85 = lshr i64 %xor199, 2, !dbg !2188
  %86 = or i64 %84, %85, !dbg !2188
    #dbg_value(!DIArgList(i64 %86, i64 %42, i64 %30), !2103, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor236, i64 %86, i64 %42, i64 %30), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
  %not219 = xor i64 %30, -1, !dbg !2189
    #dbg_value(!DIArgList(i64 %86, i64 %42, i64 %not219), !2103, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor236, i64 %86, i64 %42, i64 %not219), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
  %and220 = and i64 %42, %not219, !dbg !2190
    #dbg_value(!DIArgList(i64 %86, i64 %and220), !2103, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor236, i64 %86, i64 %and220), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor221 = xor i64 %86, %and220, !dbg !2191
    #dbg_value(i64 %xor221, !2103, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor221), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor237 = xor i64 %xor236, %xor221, !dbg !2192
    #dbg_value(i64 %xor237, !2073, !DIExpression(), !2015)
  %xor75 = xor i64 %Asu.0, %xor61, !dbg !2193
    #dbg_value(i64 %xor75, !2065, !DIExpression(), !2015)
  %87 = shl i64 %xor75, 14, !dbg !2194
  %88 = lshr i64 %xor75, 50, !dbg !2194
  %89 = or i64 %87, %88, !dbg !2194
    #dbg_value(i64 %89, !2077, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 %89, i64 %54, i64 %xor62), !2087, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor71 = xor i64 %Amo.0, %xor57, !dbg !2195
    #dbg_value(i64 %xor71, !2053, !DIExpression(), !2015)
  %90 = shl i64 %xor71, 21, !dbg !2196
  %91 = lshr i64 %xor71, 43, !dbg !2196
  %92 = or i64 %90, %91, !dbg !2196
    #dbg_value(i64 %92, !2076, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 %48, i64 %89, i64 %92), !2085, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %54, i64 %92, i64 %48), !2084, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %92, i64 %xor62, i64 %89), !2086, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %not85 = xor i64 %92, -1, !dbg !2197
    #dbg_value(!DIArgList(i64 %48, i64 %89, i64 %not85), !2085, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %and86 = and i64 %89, %not85, !dbg !2198
    #dbg_value(!DIArgList(i64 %48, i64 %and86), !2085, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor87 = xor i64 %48, %and86, !dbg !2199
    #dbg_value(i64 %xor87, !2085, !DIExpression(), !2015)
  %xor110 = xor i64 %Asi.0, %xor53, !dbg !2200
    #dbg_value(i64 %xor110, !2061, !DIExpression(), !2015)
  %93 = shl i64 %xor110, 61, !dbg !2201
  %94 = lshr i64 %xor110, 3, !dbg !2201
  %95 = or i64 %93, %94, !dbg !2201
    #dbg_value(i64 %95, !2077, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 %95, i64 %65, i64 %59), !2092, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor106 = xor i64 %Ame.0, %xor49, !dbg !2202
    #dbg_value(i64 %xor106, !2049, !DIExpression(), !2015)
  %96 = shl i64 %xor106, 45, !dbg !2203
  %97 = lshr i64 %xor106, 19, !dbg !2203
  %98 = or i64 %96, %97, !dbg !2203
    #dbg_value(i64 %98, !2076, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 %62, i64 %95, i64 %98), !2090, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %98, i64 %59, i64 %95), !2091, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %65, i64 %98, i64 %62), !2089, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %not120 = xor i64 %98, -1, !dbg !2204
    #dbg_value(!DIArgList(i64 %62, i64 %95, i64 %not120), !2090, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %and121 = and i64 %95, %not120, !dbg !2205
    #dbg_value(!DIArgList(i64 %62, i64 %and121), !2090, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor122 = xor i64 %62, %and121, !dbg !2206
    #dbg_value(i64 %xor122, !2090, !DIExpression(), !2015)
  %xor242 = xor i64 %xor87, %xor122, !dbg !2207
  %xor145 = xor i64 %Asa.0, %xor45, !dbg !2208
    #dbg_value(i64 %xor145, !2057, !DIExpression(), !2015)
  %99 = shl i64 %xor145, 18, !dbg !2209
  %100 = lshr i64 %xor145, 46, !dbg !2209
  %101 = or i64 %99, %100, !dbg !2209
    #dbg_value(i64 %101, !2077, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 %101, i64 %74, i64 %68), !2097, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor141 = xor i64 %Amu.0, %xor61, !dbg !2210
    #dbg_value(i64 %xor141, !2055, !DIExpression(), !2015)
  %102 = shl i64 %xor141, 8, !dbg !2211
  %103 = lshr i64 %xor141, 56, !dbg !2211
  %104 = or i64 %102, %103, !dbg !2211
    #dbg_value(i64 %104, !2076, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 %71, i64 %101, i64 %104), !2095, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %74, i64 %104, i64 %71), !2094, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %104, i64 %68, i64 %101), !2096, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %not155 = xor i64 %104, -1, !dbg !2212
    #dbg_value(!DIArgList(i64 %71, i64 %101, i64 %not155), !2095, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %and156 = and i64 %101, %not155, !dbg !2213
    #dbg_value(!DIArgList(i64 %71, i64 %and156), !2095, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor157 = xor i64 %71, %and156, !dbg !2214
    #dbg_value(i64 %xor157, !2095, !DIExpression(), !2015)
  %xor243 = xor i64 %xor242, %xor157, !dbg !2215
  %xor180 = xor i64 %Aso.0, %xor57, !dbg !2216
    #dbg_value(i64 %xor180, !2063, !DIExpression(), !2015)
  %105 = shl i64 %xor180, 56, !dbg !2217
  %106 = lshr i64 %xor180, 8, !dbg !2217
  %107 = or i64 %105, %106, !dbg !2217
    #dbg_value(i64 %107, !2077, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 %107, i64 %83, i64 %77), !2102, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor176 = xor i64 %Ami.0, %xor53, !dbg !2218
    #dbg_value(i64 %xor176, !2051, !DIExpression(), !2015)
  %108 = shl i64 %xor176, 15, !dbg !2219
  %109 = lshr i64 %xor176, 49, !dbg !2219
  %110 = or i64 %108, %109, !dbg !2219
    #dbg_value(i64 %110, !2076, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 %80, i64 %107, i64 %110), !2100, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %83, i64 %110, i64 %80), !2099, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %110, i64 %77, i64 %107), !2101, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %54, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71, i64 %65, i64 %98, i64 %62, i64 %92, i64 %48), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %not190 = xor i64 %110, -1, !dbg !2220
    #dbg_value(!DIArgList(i64 %80, i64 %107, i64 %not190), !2100, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %and191 = and i64 %107, %not190, !dbg !2221
    #dbg_value(!DIArgList(i64 %80, i64 %and191), !2100, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor192 = xor i64 %80, %and191, !dbg !2222
    #dbg_value(i64 %xor192, !2100, !DIExpression(), !2015)
  %xor244 = xor i64 %xor243, %xor192, !dbg !2223
  %xor215 = xor i64 %Ase.0, %xor49, !dbg !2224
    #dbg_value(i64 %xor215, !2059, !DIExpression(), !2015)
  %111 = shl i64 %xor215, 2, !dbg !2225
  %112 = lshr i64 %xor215, 62, !dbg !2225
  %113 = or i64 %111, %112, !dbg !2225
    #dbg_value(!DIArgList(i64 %42, i64 %113, i64 %36), !2105, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %113, i64 %30, i64 %86), !2107, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %36, i64 %86, i64 %113), !2106, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor244, i64 %42, i64 %113, i64 %36), !2075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %92, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101, i64 %98, i64 %xor62, i64 %89, i64 %59, i64 %95), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %89, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68, i64 %95, i64 %65, i64 %59, i64 %54, i64 %xor62), !2077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
  %not225 = xor i64 %36, -1, !dbg !2226
    #dbg_value(!DIArgList(i64 %42, i64 %113, i64 %not225), !2105, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor244, i64 %42, i64 %113, i64 %not225), !2075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
  %and226 = and i64 %113, %not225, !dbg !2227
    #dbg_value(!DIArgList(i64 %42, i64 %and226), !2105, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor244, i64 %42, i64 %and226), !2075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor227 = xor i64 %42, %and226, !dbg !2228
    #dbg_value(i64 %xor227, !2105, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor227), !2075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor245 = xor i64 %xor244, %xor227, !dbg !2229
    #dbg_value(i64 %xor245, !2075, !DIExpression(), !2015)
  %114 = shl i64 %xor245, 1, !dbg !2230
  %115 = lshr i64 %xor245, 63, !dbg !2230
  %116 = or i64 %114, %115, !dbg !2230
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor237, i64 %116), !2104, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %54, i64 %xor237, i64 %92, i64 %48, i64 %116), !2084, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %65, i64 %xor237, i64 %98, i64 %62, i64 %116), !2089, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %74, i64 %xor237, i64 %104, i64 %71, i64 %116), !2094, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %83, i64 %xor237, i64 %110, i64 %80, i64 %116), !2099, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor237, i64 %116), !2079, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor261 = xor i64 %xor237, %116, !dbg !2231
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor261), !2104, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %54, i64 %xor261, i64 %92, i64 %48), !2084, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %65, i64 %xor261, i64 %98, i64 %62), !2089, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %74, i64 %xor261, i64 %104, i64 %71), !2094, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %83, i64 %xor261, i64 %110, i64 %80), !2099, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 %xor261, !2079, !DIExpression(), !2015)
  %xor429 = xor i64 %xor224, %xor261, !dbg !2232
    #dbg_value(i64 %xor429, !2104, !DIExpression(), !2015)
  %117 = shl i64 %xor429, 2, !dbg !2233
  %118 = lshr i64 %xor429, 62, !dbg !2233
  %119 = or i64 %117, %118, !dbg !2233
    #dbg_value(i64 %119, !2077, !DIExpression(), !2015)
  %not123 = xor i64 %95, -1, !dbg !2234
    #dbg_value(!DIArgList(i64 %98, i64 %59, i64 %not123), !2091, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %92, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101, i64 %98, i64 %xor62, i64 %89, i64 %59, i64 %not123), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
  %and124 = and i64 %59, %not123, !dbg !2235
    #dbg_value(!DIArgList(i64 %98, i64 %and124), !2091, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %92, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101, i64 %98, i64 %xor62, i64 %89, i64 %and124), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor125 = xor i64 %98, %and124, !dbg !2236
    #dbg_value(i64 %xor125, !2091, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 %92, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101, i64 %xor125, i64 %xor62, i64 %89), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
  %not91 = xor i64 %xor62, -1, !dbg !2237
    #dbg_value(!DIArgList(i64 %89, i64 %54, i64 %not91), !2087, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %89, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68, i64 %95, i64 %65, i64 %59, i64 %54, i64 %not91), !2077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
  %and92 = and i64 %54, %not91, !dbg !2238
    #dbg_value(!DIArgList(i64 %89, i64 %and92), !2087, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %89, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68, i64 %95, i64 %65, i64 %59, i64 %and92), !2077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor93 = xor i64 %89, %and92, !dbg !2239
    #dbg_value(i64 %xor93, !2087, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 %xor93, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68, i64 %95, i64 %65, i64 %59), !2077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
  %not126 = xor i64 %59, -1, !dbg !2240
    #dbg_value(!DIArgList(i64 %95, i64 %65, i64 %not126), !2092, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor93, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68, i64 %95, i64 %65, i64 %not126), !2077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
  %and127 = and i64 %65, %not126, !dbg !2241
    #dbg_value(!DIArgList(i64 %95, i64 %and127), !2092, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor93, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68, i64 %95, i64 %and127), !2077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor128 = xor i64 %95, %and127, !dbg !2242
    #dbg_value(i64 %xor128, !2092, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 %xor93, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68, i64 %xor128), !2077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor250 = xor i64 %xor93, %xor128, !dbg !2243
    #dbg_value(!DIArgList(i64 %xor250, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68), !2077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
  %not161 = xor i64 %68, -1, !dbg !2244
    #dbg_value(!DIArgList(i64 %101, i64 %74, i64 %not161), !2097, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor250, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %not161), !2077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
  %and162 = and i64 %74, %not161, !dbg !2245
    #dbg_value(!DIArgList(i64 %101, i64 %and162), !2097, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor250, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %and162), !2077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor163 = xor i64 %101, %and162, !dbg !2246
    #dbg_value(i64 %xor163, !2097, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 %xor250, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %xor163), !2077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor251 = xor i64 %xor250, %xor163, !dbg !2247
    #dbg_value(!DIArgList(i64 %xor251, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77), !2077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
  %not196 = xor i64 %77, -1, !dbg !2248
    #dbg_value(!DIArgList(i64 %107, i64 %83, i64 %not196), !2102, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor251, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %not196), !2077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
  %and197 = and i64 %83, %not196, !dbg !2249
    #dbg_value(!DIArgList(i64 %107, i64 %and197), !2102, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor251, i64 %113, i64 %30, i64 %86, i64 %107, i64 %and197), !2077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor198 = xor i64 %107, %and197, !dbg !2250
    #dbg_value(i64 %xor198, !2102, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 %xor251, i64 %113, i64 %30, i64 %86, i64 %xor198), !2077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor252 = xor i64 %xor251, %xor198, !dbg !2251
    #dbg_value(!DIArgList(i64 %xor252, i64 %113, i64 %30, i64 %86), !2077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
  %not231 = xor i64 %86, -1, !dbg !2252
    #dbg_value(!DIArgList(i64 %113, i64 %30, i64 %not231), !2107, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor252, i64 %113, i64 %30, i64 %not231), !2077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
  %and232 = and i64 %30, %not231, !dbg !2253
    #dbg_value(!DIArgList(i64 %113, i64 %and232), !2107, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor252, i64 %113, i64 %and232), !2077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor233 = xor i64 %113, %and232, !dbg !2254
    #dbg_value(i64 %xor233, !2107, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor233), !2077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor253 = xor i64 %xor252, %xor233, !dbg !2255
    #dbg_value(i64 %xor253, !2077, !DIExpression(), !2015)
  %120 = shl i64 %xor253, 1, !dbg !2256
  %121 = lshr i64 %xor253, 63, !dbg !2256
  %122 = or i64 %120, %121, !dbg !2256
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor245, i64 %122), !2091, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %92, i64 %xor245, i64 %xor62, i64 %89, i64 %122), !2086, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %104, i64 %xor245, i64 %68, i64 %101, i64 %122), !2096, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %110, i64 %xor245, i64 %77, i64 %107, i64 %122), !2101, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %36, i64 %xor245, i64 %86, i64 %113, i64 %122), !2106, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor245, i64 %122), !2081, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor269 = xor i64 %xor245, %122, !dbg !2257
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor269), !2091, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %92, i64 %xor269, i64 %xor62, i64 %89), !2086, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %104, i64 %xor269, i64 %68, i64 %101), !2096, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %110, i64 %xor269, i64 %77, i64 %107), !2101, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %36, i64 %xor269, i64 %86, i64 %113), !2106, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 %xor269, !2081, !DIExpression(), !2015)
  %xor417 = xor i64 %xor125, %xor269, !dbg !2258
    #dbg_value(i64 %xor417, !2091, !DIExpression(), !2015)
  %123 = shl i64 %xor417, 55, !dbg !2259
  %124 = lshr i64 %xor417, 9, !dbg !2259
  %125 = or i64 %123, %124, !dbg !2259
    #dbg_value(i64 %125, !2074, !DIExpression(), !2015)
  %not82 = xor i64 %48, -1, !dbg !2260
    #dbg_value(!DIArgList(i64 %54, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71, i64 %65, i64 %98, i64 %62, i64 %92, i64 %not82), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %54, i64 %xor261, i64 %92, i64 %not82), !2084, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %and83 = and i64 %92, %not82, !dbg !2261
    #dbg_value(!DIArgList(i64 %54, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71, i64 %65, i64 %98, i64 %62, i64 %and83), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %54, i64 %xor261, i64 %and83), !2084, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor84 = xor i64 %54, %and83, !dbg !2262
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71, i64 %65, i64 %98, i64 %62), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor261), !2084, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %not117 = xor i64 %62, -1, !dbg !2263
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71, i64 %65, i64 %98, i64 %not117), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %65, i64 %xor261, i64 %98, i64 %not117), !2089, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %and118 = and i64 %98, %not117, !dbg !2264
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71, i64 %65, i64 %and118), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %65, i64 %xor261, i64 %and118), !2089, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor119 = xor i64 %65, %and118, !dbg !2265
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71, i64 %xor119), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor119, i64 %xor261), !2089, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor238 = xor i64 %xor84, %xor119, !dbg !2266
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %not152 = xor i64 %71, -1, !dbg !2267
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %not152), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %74, i64 %xor261, i64 %104, i64 %not152), !2094, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %and153 = and i64 %104, %not152, !dbg !2268
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %and153), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %74, i64 %xor261, i64 %and153), !2094, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor154 = xor i64 %74, %and153, !dbg !2269
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %xor154), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor154, i64 %xor261), !2094, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor239 = xor i64 %xor238, %xor154, !dbg !2270
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %83, i64 %110, i64 %80), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %not187 = xor i64 %80, -1, !dbg !2271
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %83, i64 %110, i64 %not187), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %83, i64 %xor261, i64 %110, i64 %not187), !2099, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %and188 = and i64 %110, %not187, !dbg !2272
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %83, i64 %and188), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %83, i64 %xor261, i64 %and188), !2099, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor189 = xor i64 %83, %and188, !dbg !2273
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor189), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor189, i64 %xor261), !2099, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor240 = xor i64 %xor239, %xor189, !dbg !2274
    #dbg_value(!DIArgList(i64 %xor240, i64 %xor224), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor241 = xor i64 %xor240, %xor224, !dbg !2275
    #dbg_value(i64 %xor241, !2074, !DIExpression(), !2015)
  %not88 = xor i64 %89, -1, !dbg !2276
    #dbg_value(!DIArgList(i64 %92, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101, i64 %xor125, i64 %xor62, i64 %not88), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %92, i64 %xor269, i64 %xor62, i64 %not88), !2086, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %and89 = and i64 %xor62, %not88, !dbg !2277
    #dbg_value(!DIArgList(i64 %92, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101, i64 %xor125, i64 %and89), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %92, i64 %xor269, i64 %and89), !2086, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor90 = xor i64 %92, %and89, !dbg !2278
    #dbg_value(!DIArgList(i64 %xor90, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101, i64 %xor125), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor90, i64 %xor269), !2086, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor246 = xor i64 %xor90, %xor125, !dbg !2279
    #dbg_value(!DIArgList(i64 %xor246, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
  %not158 = xor i64 %101, -1, !dbg !2280
    #dbg_value(!DIArgList(i64 %xor246, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %not158), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %104, i64 %xor269, i64 %68, i64 %not158), !2096, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %and159 = and i64 %68, %not158, !dbg !2281
    #dbg_value(!DIArgList(i64 %xor246, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %and159), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %104, i64 %xor269, i64 %and159), !2096, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor160 = xor i64 %104, %and159, !dbg !2282
    #dbg_value(!DIArgList(i64 %xor246, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %xor160), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor160, i64 %xor269), !2096, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor247 = xor i64 %xor246, %xor160, !dbg !2283
    #dbg_value(!DIArgList(i64 %xor247, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
  %not193 = xor i64 %107, -1, !dbg !2284
    #dbg_value(!DIArgList(i64 %xor247, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %not193), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %110, i64 %xor269, i64 %77, i64 %not193), !2101, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %and194 = and i64 %77, %not193, !dbg !2285
    #dbg_value(!DIArgList(i64 %xor247, i64 %36, i64 %86, i64 %113, i64 %110, i64 %and194), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %110, i64 %xor269, i64 %and194), !2101, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor195 = xor i64 %110, %and194, !dbg !2286
    #dbg_value(!DIArgList(i64 %xor247, i64 %36, i64 %86, i64 %113, i64 %xor195), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor195, i64 %xor269), !2101, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor248 = xor i64 %xor247, %xor195, !dbg !2287
    #dbg_value(!DIArgList(i64 %xor248, i64 %36, i64 %86, i64 %113), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
  %not228 = xor i64 %113, -1, !dbg !2288
    #dbg_value(!DIArgList(i64 %xor248, i64 %36, i64 %86, i64 %not228), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %36, i64 %xor269, i64 %86, i64 %not228), !2106, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %and229 = and i64 %86, %not228, !dbg !2289
    #dbg_value(!DIArgList(i64 %xor248, i64 %36, i64 %and229), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %36, i64 %xor269, i64 %and229), !2106, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor230 = xor i64 %36, %and229, !dbg !2290
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor230), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor230, i64 %xor269), !2106, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor249 = xor i64 %xor248, %xor230, !dbg !2291
    #dbg_value(i64 %xor249, !2076, !DIExpression(), !2015)
  %126 = shl i64 %xor249, 1, !dbg !2292
  %127 = lshr i64 %xor249, 63, !dbg !2292
  %128 = or i64 %126, %127, !dbg !2292
    #dbg_value(!DIArgList(i64 %xor241, i64 %128), !2080, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor241, i64 %128), !2085, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor241, i64 %128), !2100, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor241, i64 %128), !2090, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor241, i64 %128), !2105, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor241, i64 %128), !2095, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor265 = xor i64 %xor241, %128, !dbg !2293
    #dbg_value(i64 %xor265, !2080, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor265), !2085, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor265), !2100, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor265), !2090, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor265), !2105, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor265), !2095, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor413 = xor i64 %xor87, %xor265, !dbg !2294
    #dbg_value(i64 %xor413, !2085, !DIExpression(), !2015)
  %129 = shl i64 %xor413, 62, !dbg !2295
  %130 = lshr i64 %xor413, 2, !dbg !2295
  %131 = or i64 %129, %130, !dbg !2295
    #dbg_value(i64 %131, !2073, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 %119, i64 %125, i64 %131), !2065, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %not445 = xor i64 %131, -1, !dbg !2296
    #dbg_value(!DIArgList(i64 %119, i64 %125, i64 %not445), !2065, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %and446 = and i64 %125, %not445, !dbg !2297
    #dbg_value(!DIArgList(i64 %119, i64 %and446), !2065, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor447 = xor i64 %119, %and446, !dbg !2298
    #dbg_value(i64 %xor447, !2065, !DIExpression(), !2015)
  %132 = shl i64 %xor241, 1, !dbg !2299
  %133 = lshr i64 %xor241, 63, !dbg !2299
  %134 = or i64 %132, %133, !dbg !2299
    #dbg_value(!DIArgList(i64 %xor253, i64 %134), !2078, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor253, i64 %134), !2088, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor253, i64 %134), !2103, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor253, i64 %134), !2093, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %134), !2083, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %134), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor253, i64 %134), !2098, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor257 = xor i64 %xor253, %134, !dbg !2300
    #dbg_value(i64 %xor257, !2078, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor257), !2088, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor257), !2103, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor257), !2093, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !2083, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor257), !2098, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor425 = xor i64 %xor186, %xor257, !dbg !2301
    #dbg_value(i64 %xor425, !2098, !DIExpression(), !2015)
  %135 = shl i64 %xor425, 41, !dbg !2302
  %136 = lshr i64 %xor425, 23, !dbg !2302
  %137 = or i64 %135, %136, !dbg !2302
    #dbg_value(i64 %137, !2076, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 %137, i64 %131, i64 %119), !2063, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %not442 = xor i64 %119, -1, !dbg !2303
    #dbg_value(!DIArgList(i64 %137, i64 %131, i64 %not442), !2063, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %and443 = and i64 %131, %not442, !dbg !2304
    #dbg_value(!DIArgList(i64 %137, i64 %and443), !2063, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor444 = xor i64 %137, %and443, !dbg !2305
    #dbg_value(i64 %xor444, !2063, !DIExpression(), !2015)
  %138 = shl i64 %xor237, 1, !dbg !2306
  %139 = lshr i64 %xor237, 63, !dbg !2306
  %140 = or i64 %138, %139, !dbg !2306
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor249, i64 %140), !2087, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor249, i64 %140), !2102, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor249, i64 %140), !2092, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor249, i64 %140), !2107, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor249, i64 %140), !2082, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor249, i64 %140), !2097, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor273 = xor i64 %xor249, %140, !dbg !2307
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor273), !2087, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor273), !2102, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor273), !2092, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor273), !2107, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(i64 %xor273, !2082, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor273), !2097, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor421 = xor i64 %xor163, %xor273, !dbg !2308
    #dbg_value(i64 %xor421, !2097, !DIExpression(), !2015)
  %141 = shl i64 %xor421, 39, !dbg !2309
  %142 = lshr i64 %xor421, 25, !dbg !2309
  %143 = or i64 %141, %142, !dbg !2309
    #dbg_value(i64 %143, !2075, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 %143, i64 %119, i64 %137), !2061, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %125, i64 %137, i64 %143), !2059, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %131, i64 %143, i64 %125), !2057, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %not439 = xor i64 %137, -1, !dbg !2310
    #dbg_value(!DIArgList(i64 %143, i64 %119, i64 %not439), !2061, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %and440 = and i64 %119, %not439, !dbg !2311
    #dbg_value(!DIArgList(i64 %143, i64 %and440), !2061, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor441 = xor i64 %143, %and440, !dbg !2312
    #dbg_value(i64 %xor441, !2061, !DIExpression(), !2015)
  %not436 = xor i64 %143, -1, !dbg !2313
    #dbg_value(!DIArgList(i64 %125, i64 %137, i64 %not436), !2059, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %and437 = and i64 %137, %not436, !dbg !2314
    #dbg_value(!DIArgList(i64 %125, i64 %and437), !2059, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor438 = xor i64 %125, %and437, !dbg !2315
    #dbg_value(i64 %xor438, !2059, !DIExpression(), !2015)
  %not433 = xor i64 %125, -1, !dbg !2316
    #dbg_value(!DIArgList(i64 %131, i64 %143, i64 %not433), !2057, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %and434 = and i64 %143, %not433, !dbg !2317
    #dbg_value(!DIArgList(i64 %131, i64 %and434), !2057, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor435 = xor i64 %131, %and434, !dbg !2318
    #dbg_value(i64 %xor435, !2057, !DIExpression(), !2015)
  %xor394 = xor i64 %xor230, %xor269, !dbg !2319
    #dbg_value(i64 %xor394, !2106, !DIExpression(), !2015)
  %144 = shl i64 %xor394, 56, !dbg !2320
  %145 = lshr i64 %xor394, 8, !dbg !2320
  %146 = or i64 %144, %145, !dbg !2320
    #dbg_value(i64 %146, !2077, !DIExpression(), !2015)
  %xor382 = xor i64 %xor116, %xor257, !dbg !2321
    #dbg_value(i64 %xor382, !2088, !DIExpression(), !2015)
  %147 = shl i64 %xor382, 36, !dbg !2322
  %148 = lshr i64 %xor382, 28, !dbg !2322
  %149 = or i64 %147, %148, !dbg !2322
    #dbg_value(i64 %149, !2074, !DIExpression(), !2015)
  %xor378 = xor i64 %xor93, %xor273, !dbg !2323
    #dbg_value(i64 %xor378, !2087, !DIExpression(), !2015)
  %150 = shl i64 %xor378, 27, !dbg !2324
  %151 = lshr i64 %xor378, 37, !dbg !2324
  %152 = or i64 %150, %151, !dbg !2324
    #dbg_value(i64 %152, !2073, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 %146, i64 %149, i64 %152), !2055, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %not410 = xor i64 %152, -1, !dbg !2325
    #dbg_value(!DIArgList(i64 %146, i64 %149, i64 %not410), !2055, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %and411 = and i64 %149, %not410, !dbg !2326
    #dbg_value(!DIArgList(i64 %146, i64 %and411), !2055, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor412 = xor i64 %146, %and411, !dbg !2327
    #dbg_value(i64 %xor412, !2055, !DIExpression(), !2015)
  %xor390 = xor i64 %xor192, %xor265, !dbg !2328
    #dbg_value(i64 %xor390, !2100, !DIExpression(), !2015)
  %153 = shl i64 %xor390, 15, !dbg !2329
  %154 = lshr i64 %xor390, 49, !dbg !2329
  %155 = or i64 %153, %154, !dbg !2329
    #dbg_value(i64 %155, !2076, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 %155, i64 %152, i64 %146), !2053, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %not407 = xor i64 %146, -1, !dbg !2330
    #dbg_value(!DIArgList(i64 %155, i64 %152, i64 %not407), !2053, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %and408 = and i64 %152, %not407, !dbg !2331
    #dbg_value(!DIArgList(i64 %155, i64 %and408), !2053, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor409 = xor i64 %155, %and408, !dbg !2332
    #dbg_value(i64 %xor409, !2053, !DIExpression(), !2015)
  %xor386 = xor i64 %xor154, %xor261, !dbg !2333
    #dbg_value(i64 %xor386, !2094, !DIExpression(), !2015)
  %156 = shl i64 %xor386, 10, !dbg !2334
  %157 = lshr i64 %xor386, 54, !dbg !2334
  %158 = or i64 %156, %157, !dbg !2334
    #dbg_value(i64 %158, !2075, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 %158, i64 %146, i64 %155), !2051, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %149, i64 %155, i64 %158), !2049, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %152, i64 %158, i64 %149), !2047, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %not404 = xor i64 %155, -1, !dbg !2335
    #dbg_value(!DIArgList(i64 %158, i64 %146, i64 %not404), !2051, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %and405 = and i64 %146, %not404, !dbg !2336
    #dbg_value(!DIArgList(i64 %158, i64 %and405), !2051, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor406 = xor i64 %158, %and405, !dbg !2337
    #dbg_value(i64 %xor406, !2051, !DIExpression(), !2015)
  %not401 = xor i64 %158, -1, !dbg !2338
    #dbg_value(!DIArgList(i64 %149, i64 %155, i64 %not401), !2049, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %and402 = and i64 %155, %not401, !dbg !2339
    #dbg_value(!DIArgList(i64 %149, i64 %and402), !2049, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor403 = xor i64 %149, %and402, !dbg !2340
    #dbg_value(i64 %xor403, !2049, !DIExpression(), !2015)
  %not398 = xor i64 %149, -1, !dbg !2341
    #dbg_value(!DIArgList(i64 %152, i64 %158, i64 %not398), !2047, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %and399 = and i64 %158, %not398, !dbg !2342
    #dbg_value(!DIArgList(i64 %152, i64 %and399), !2047, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor400 = xor i64 %152, %and399, !dbg !2343
    #dbg_value(i64 %xor400, !2047, !DIExpression(), !2015)
  %xor359 = xor i64 %xor221, %xor257, !dbg !2344
    #dbg_value(i64 %xor359, !2103, !DIExpression(), !2015)
  %159 = shl i64 %xor359, 18, !dbg !2345
  %160 = lshr i64 %xor359, 46, !dbg !2345
  %161 = or i64 %159, %160, !dbg !2345
    #dbg_value(i64 %161, !2077, !DIExpression(), !2015)
  %xor347 = xor i64 %xor122, %xor265, !dbg !2346
    #dbg_value(i64 %xor347, !2090, !DIExpression(), !2015)
  %162 = shl i64 %xor347, 6, !dbg !2347
  %163 = lshr i64 %xor347, 58, !dbg !2347
  %164 = or i64 %162, %163, !dbg !2347
    #dbg_value(i64 %164, !2074, !DIExpression(), !2015)
  %xor343 = xor i64 %xor84, %xor261, !dbg !2348
    #dbg_value(i64 %xor343, !2084, !DIExpression(), !2015)
  %165 = shl i64 %xor343, 1, !dbg !2349
  %166 = lshr i64 %xor343, 63, !dbg !2349
  %167 = or i64 %165, %166, !dbg !2349
    #dbg_value(i64 %167, !2073, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 %161, i64 %164, i64 %167), !2045, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %not375 = xor i64 %167, -1, !dbg !2350
    #dbg_value(!DIArgList(i64 %161, i64 %164, i64 %not375), !2045, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %and376 = and i64 %164, %not375, !dbg !2351
    #dbg_value(!DIArgList(i64 %161, i64 %and376), !2045, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor377 = xor i64 %161, %and376, !dbg !2352
    #dbg_value(i64 %xor377, !2045, !DIExpression(), !2015)
  %xor355 = xor i64 %xor198, %xor273, !dbg !2353
    #dbg_value(i64 %xor355, !2102, !DIExpression(), !2015)
  %168 = shl i64 %xor355, 8, !dbg !2354
  %169 = lshr i64 %xor355, 56, !dbg !2354
  %170 = or i64 %168, %169, !dbg !2354
    #dbg_value(i64 %170, !2076, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 %170, i64 %167, i64 %161), !2043, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %not372 = xor i64 %161, -1, !dbg !2355
    #dbg_value(!DIArgList(i64 %170, i64 %167, i64 %not372), !2043, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %and373 = and i64 %167, %not372, !dbg !2356
    #dbg_value(!DIArgList(i64 %170, i64 %and373), !2043, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor374 = xor i64 %170, %and373, !dbg !2357
    #dbg_value(i64 %xor374, !2043, !DIExpression(), !2015)
  %xor351 = xor i64 %xor160, %xor269, !dbg !2358
    #dbg_value(i64 %xor351, !2096, !DIExpression(), !2015)
  %171 = shl i64 %xor351, 25, !dbg !2359
  %172 = lshr i64 %xor351, 39, !dbg !2359
  %173 = or i64 %171, %172, !dbg !2359
    #dbg_value(i64 %173, !2075, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 %173, i64 %161, i64 %170), !2041, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %164, i64 %170, i64 %173), !2039, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %167, i64 %173, i64 %164), !2037, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %not369 = xor i64 %170, -1, !dbg !2360
    #dbg_value(!DIArgList(i64 %173, i64 %161, i64 %not369), !2041, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %and370 = and i64 %161, %not369, !dbg !2361
    #dbg_value(!DIArgList(i64 %173, i64 %and370), !2041, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor371 = xor i64 %173, %and370, !dbg !2362
    #dbg_value(i64 %xor371, !2041, !DIExpression(), !2015)
  %not366 = xor i64 %173, -1, !dbg !2363
    #dbg_value(!DIArgList(i64 %164, i64 %170, i64 %not366), !2039, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %and367 = and i64 %170, %not366, !dbg !2364
    #dbg_value(!DIArgList(i64 %164, i64 %and367), !2039, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor368 = xor i64 %164, %and367, !dbg !2365
    #dbg_value(i64 %xor368, !2039, !DIExpression(), !2015)
  %not363 = xor i64 %164, -1, !dbg !2366
    #dbg_value(!DIArgList(i64 %167, i64 %173, i64 %not363), !2037, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %and364 = and i64 %173, %not363, !dbg !2367
    #dbg_value(!DIArgList(i64 %167, i64 %and364), !2037, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor365 = xor i64 %167, %and364, !dbg !2368
    #dbg_value(i64 %xor365, !2037, !DIExpression(), !2015)
  %xor324 = xor i64 %xor227, %xor265, !dbg !2369
    #dbg_value(i64 %xor324, !2105, !DIExpression(), !2015)
  %174 = shl i64 %xor324, 61, !dbg !2370
  %175 = lshr i64 %xor324, 3, !dbg !2370
  %176 = or i64 %174, %175, !dbg !2370
    #dbg_value(i64 %176, !2077, !DIExpression(), !2015)
  %xor312 = xor i64 %xor128, %xor273, !dbg !2371
    #dbg_value(i64 %xor312, !2092, !DIExpression(), !2015)
  %177 = shl i64 %xor312, 20, !dbg !2372
  %178 = lshr i64 %xor312, 44, !dbg !2372
  %179 = or i64 %177, %178, !dbg !2372
    #dbg_value(i64 %179, !2074, !DIExpression(), !2015)
  %xor308 = xor i64 %xor90, %xor269, !dbg !2373
    #dbg_value(i64 %xor308, !2086, !DIExpression(), !2015)
  %180 = shl i64 %xor308, 28, !dbg !2374
  %181 = lshr i64 %xor308, 36, !dbg !2374
  %182 = or i64 %180, %181, !dbg !2374
    #dbg_value(i64 %182, !2073, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 %176, i64 %179, i64 %182), !2035, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %not340 = xor i64 %182, -1, !dbg !2375
    #dbg_value(!DIArgList(i64 %176, i64 %179, i64 %not340), !2035, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %and341 = and i64 %179, %not340, !dbg !2376
    #dbg_value(!DIArgList(i64 %176, i64 %and341), !2035, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor342 = xor i64 %176, %and341, !dbg !2377
    #dbg_value(i64 %xor342, !2035, !DIExpression(), !2015)
  %xor320 = xor i64 %xor189, %xor261, !dbg !2378
    #dbg_value(i64 %xor320, !2099, !DIExpression(), !2015)
  %183 = shl i64 %xor320, 45, !dbg !2379
  %184 = lshr i64 %xor320, 19, !dbg !2379
  %185 = or i64 %183, %184, !dbg !2379
    #dbg_value(i64 %185, !2076, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 %185, i64 %182, i64 %176), !2033, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %not337 = xor i64 %176, -1, !dbg !2380
    #dbg_value(!DIArgList(i64 %185, i64 %182, i64 %not337), !2033, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %and338 = and i64 %182, %not337, !dbg !2381
    #dbg_value(!DIArgList(i64 %185, i64 %and338), !2033, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor339 = xor i64 %185, %and338, !dbg !2382
    #dbg_value(i64 %xor339, !2033, !DIExpression(), !2015)
  %xor316 = xor i64 %xor151, %xor257, !dbg !2383
    #dbg_value(i64 %xor316, !2093, !DIExpression(), !2015)
  %186 = shl i64 %xor316, 3, !dbg !2384
  %187 = lshr i64 %xor316, 61, !dbg !2384
  %188 = or i64 %186, %187, !dbg !2384
    #dbg_value(i64 %188, !2075, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 %188, i64 %176, i64 %185), !2031, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %179, i64 %185, i64 %188), !2029, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %182, i64 %188, i64 %179), !2027, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %not334 = xor i64 %185, -1, !dbg !2385
    #dbg_value(!DIArgList(i64 %188, i64 %176, i64 %not334), !2031, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %and335 = and i64 %176, %not334, !dbg !2386
    #dbg_value(!DIArgList(i64 %188, i64 %and335), !2031, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor336 = xor i64 %188, %and335, !dbg !2387
    #dbg_value(i64 %xor336, !2031, !DIExpression(), !2015)
  %not331 = xor i64 %188, -1, !dbg !2388
    #dbg_value(!DIArgList(i64 %179, i64 %185, i64 %not331), !2029, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %and332 = and i64 %185, %not331, !dbg !2389
    #dbg_value(!DIArgList(i64 %179, i64 %and332), !2029, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor333 = xor i64 %179, %and332, !dbg !2390
    #dbg_value(i64 %xor333, !2029, !DIExpression(), !2015)
  %not328 = xor i64 %179, -1, !dbg !2391
    #dbg_value(!DIArgList(i64 %182, i64 %188, i64 %not328), !2027, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %and329 = and i64 %188, %not328, !dbg !2392
    #dbg_value(!DIArgList(i64 %182, i64 %and329), !2027, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor330 = xor i64 %182, %and329, !dbg !2393
    #dbg_value(i64 %xor330, !2027, !DIExpression(), !2015)
  %xor287 = xor i64 %xor233, %xor273, !dbg !2394
    #dbg_value(i64 %xor287, !2107, !DIExpression(), !2015)
  %189 = shl i64 %xor287, 14, !dbg !2395
  %190 = lshr i64 %xor287, 50, !dbg !2395
  %191 = or i64 %189, %190, !dbg !2395
    #dbg_value(i64 %191, !2077, !DIExpression(), !2015)
  %xor275 = xor i64 %xor119, %xor261, !dbg !2396
    #dbg_value(i64 %xor275, !2089, !DIExpression(), !2015)
  %192 = shl i64 %xor275, 44, !dbg !2397
  %193 = lshr i64 %xor275, 20, !dbg !2397
  %194 = or i64 %192, %193, !dbg !2397
    #dbg_value(i64 %194, !2074, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 %191, i64 %194, i64 %xor81, i64 %xor257), !2025, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor274 = xor i64 %xor81, %xor257, !dbg !2398
    #dbg_value(i64 %xor274, !2083, !DIExpression(), !2015)
    #dbg_value(i64 %xor274, !2073, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 %191, i64 %194, i64 %xor274), !2025, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %not305 = xor i64 %xor274, -1, !dbg !2399
    #dbg_value(!DIArgList(i64 %191, i64 %194, i64 %not305), !2025, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %and306 = and i64 %194, %not305, !dbg !2400
    #dbg_value(!DIArgList(i64 %191, i64 %and306), !2025, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor307 = xor i64 %191, %and306, !dbg !2401
    #dbg_value(i64 %xor307, !2025, !DIExpression(), !2015)
  %xor283 = xor i64 %xor195, %xor269, !dbg !2402
    #dbg_value(i64 %xor283, !2101, !DIExpression(), !2015)
  %195 = shl i64 %xor283, 21, !dbg !2403
  %196 = lshr i64 %xor283, 43, !dbg !2403
  %197 = or i64 %195, %196, !dbg !2403
    #dbg_value(i64 %197, !2076, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 %197, i64 %xor274, i64 %191), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %not302 = xor i64 %191, -1, !dbg !2404
    #dbg_value(!DIArgList(i64 %197, i64 %xor274, i64 %not302), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %and303 = and i64 %xor274, %not302, !dbg !2405
    #dbg_value(!DIArgList(i64 %197, i64 %and303), !2023, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor304 = xor i64 %197, %and303, !dbg !2406
    #dbg_value(i64 %xor304, !2023, !DIExpression(), !2015)
  %xor279 = xor i64 %xor157, %xor265, !dbg !2407
    #dbg_value(i64 %xor279, !2095, !DIExpression(), !2015)
  %198 = shl i64 %xor279, 43, !dbg !2408
  %199 = lshr i64 %xor279, 21, !dbg !2408
  %200 = or i64 %198, %199, !dbg !2408
    #dbg_value(i64 %200, !2075, !DIExpression(), !2015)
    #dbg_value(!DIArgList(i64 %200, i64 %191, i64 %197), !2021, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %194, i64 %197, i64 %200), !2019, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
    #dbg_value(!DIArgList(i64 %xor274, i64 %200, i64 %194), !2017, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %not299 = xor i64 %197, -1, !dbg !2409
    #dbg_value(!DIArgList(i64 %200, i64 %191, i64 %not299), !2021, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %and300 = and i64 %191, %not299, !dbg !2410
    #dbg_value(!DIArgList(i64 %200, i64 %and300), !2021, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor301 = xor i64 %200, %and300, !dbg !2411
    #dbg_value(i64 %xor301, !2021, !DIExpression(), !2015)
  %not296 = xor i64 %200, -1, !dbg !2412
    #dbg_value(!DIArgList(i64 %194, i64 %197, i64 %not296), !2019, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2015)
  %and297 = and i64 %197, %not296, !dbg !2413
    #dbg_value(!DIArgList(i64 %194, i64 %and297), !2019, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %xor298 = xor i64 %194, %and297, !dbg !2414
    #dbg_value(i64 %xor298, !2019, !DIExpression(), !2015)
  %add = or disjoint i32 %round.0, 1, !dbg !2415
  %arrayidx294 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %add, !dbg !2416
  %201 = load i64, ptr %arrayidx294, align 8, !dbg !2416
    #dbg_value(!DIArgList(i64 %xor274, i64 %201, i64 %200, i64 %194), !2017, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %not291 = xor i64 %194, -1, !dbg !2417
    #dbg_value(!DIArgList(i64 %xor274, i64 %201, i64 %200, i64 %not291), !2017, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %and292 = and i64 %200, %not291, !dbg !2418
    #dbg_value(!DIArgList(i64 %xor274, i64 %201, i64 %and292), !2017, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2015)
  %202 = xor i64 %and292, %201, !dbg !2419
  %xor295 = xor i64 %202, %xor274, !dbg !2419
    #dbg_value(i64 %xor295, !2017, !DIExpression(), !2015)
  %add448 = add nuw nsw i32 %round.0, 2, !dbg !2420
    #dbg_value(i32 %add448, !2066, !DIExpression(), !2015)
  br label %for.cond, !dbg !2421, !llvm.loop !2422

for.end:                                          ; preds = %for.cond
  %Aso.0.lcssa = phi i64 [ %Aso.0, %for.cond ], !dbg !2015
  %Asi.0.lcssa = phi i64 [ %Asi.0, %for.cond ], !dbg !2015
  %Ase.0.lcssa = phi i64 [ %Ase.0, %for.cond ], !dbg !2015
  %Asa.0.lcssa = phi i64 [ %Asa.0, %for.cond ], !dbg !2015
  %Amu.0.lcssa = phi i64 [ %Amu.0, %for.cond ], !dbg !2015
  %Amo.0.lcssa = phi i64 [ %Amo.0, %for.cond ], !dbg !2015
  %Ami.0.lcssa = phi i64 [ %Ami.0, %for.cond ], !dbg !2015
  %Ame.0.lcssa = phi i64 [ %Ame.0, %for.cond ], !dbg !2015
  %Ama.0.lcssa = phi i64 [ %Ama.0, %for.cond ], !dbg !2015
  %Aku.0.lcssa = phi i64 [ %Aku.0, %for.cond ], !dbg !2015
  %Ako.0.lcssa = phi i64 [ %Ako.0, %for.cond ], !dbg !2015
  %Aki.0.lcssa = phi i64 [ %Aki.0, %for.cond ], !dbg !2015
  %Ake.0.lcssa = phi i64 [ %Ake.0, %for.cond ], !dbg !2015
  %Aka.0.lcssa = phi i64 [ %Aka.0, %for.cond ], !dbg !2015
  %Agu.0.lcssa = phi i64 [ %Agu.0, %for.cond ], !dbg !2015
  %Ago.0.lcssa = phi i64 [ %Ago.0, %for.cond ], !dbg !2015
  %Agi.0.lcssa = phi i64 [ %Agi.0, %for.cond ], !dbg !2015
  %Age.0.lcssa = phi i64 [ %Age.0, %for.cond ], !dbg !2015
  %Aga.0.lcssa = phi i64 [ %Aga.0, %for.cond ], !dbg !2015
  %Abu.0.lcssa = phi i64 [ %Abu.0, %for.cond ], !dbg !2015
  %Abo.0.lcssa = phi i64 [ %Abo.0, %for.cond ], !dbg !2015
  %Abi.0.lcssa = phi i64 [ %Abi.0, %for.cond ], !dbg !2015
  %Abe.0.lcssa = phi i64 [ %Abe.0, %for.cond ], !dbg !2015
  %Aba.0.lcssa = phi i64 [ %Aba.0, %for.cond ], !dbg !2015
  %Asu.0.lcssa = phi i64 [ %Asu.0, %for.cond ], !dbg !2015
  store i64 %Aba.0.lcssa, ptr %state, align 8, !dbg !2424
  %arrayidx450 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !2425
  store i64 %Abe.0.lcssa, ptr %arrayidx450, align 8, !dbg !2426
  %arrayidx451 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !2427
  store i64 %Abi.0.lcssa, ptr %arrayidx451, align 8, !dbg !2428
  %arrayidx452 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !2429
  store i64 %Abo.0.lcssa, ptr %arrayidx452, align 8, !dbg !2430
  %arrayidx453 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !2431
  store i64 %Abu.0.lcssa, ptr %arrayidx453, align 8, !dbg !2432
  %arrayidx454 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !2433
  store i64 %Aga.0.lcssa, ptr %arrayidx454, align 8, !dbg !2434
  %arrayidx455 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !2435
  store i64 %Age.0.lcssa, ptr %arrayidx455, align 8, !dbg !2436
  %arrayidx456 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !2437
  store i64 %Agi.0.lcssa, ptr %arrayidx456, align 8, !dbg !2438
  %arrayidx457 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !2439
  store i64 %Ago.0.lcssa, ptr %arrayidx457, align 8, !dbg !2440
  %arrayidx458 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !2441
  store i64 %Agu.0.lcssa, ptr %arrayidx458, align 8, !dbg !2442
  %arrayidx459 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !2443
  store i64 %Aka.0.lcssa, ptr %arrayidx459, align 8, !dbg !2444
  %arrayidx460 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !2445
  store i64 %Ake.0.lcssa, ptr %arrayidx460, align 8, !dbg !2446
  %arrayidx461 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !2447
  store i64 %Aki.0.lcssa, ptr %arrayidx461, align 8, !dbg !2448
  %arrayidx462 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !2449
  store i64 %Ako.0.lcssa, ptr %arrayidx462, align 8, !dbg !2450
  %arrayidx463 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !2451
  store i64 %Aku.0.lcssa, ptr %arrayidx463, align 8, !dbg !2452
  %arrayidx464 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !2453
  store i64 %Ama.0.lcssa, ptr %arrayidx464, align 8, !dbg !2454
  %arrayidx465 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !2455
  store i64 %Ame.0.lcssa, ptr %arrayidx465, align 8, !dbg !2456
  %arrayidx466 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !2457
  store i64 %Ami.0.lcssa, ptr %arrayidx466, align 8, !dbg !2458
  %arrayidx467 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !2459
  store i64 %Amo.0.lcssa, ptr %arrayidx467, align 8, !dbg !2460
  %arrayidx468 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !2461
  store i64 %Amu.0.lcssa, ptr %arrayidx468, align 8, !dbg !2462
  %arrayidx469 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !2463
  store i64 %Asa.0.lcssa, ptr %arrayidx469, align 8, !dbg !2464
  %arrayidx470 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !2465
  store i64 %Ase.0.lcssa, ptr %arrayidx470, align 8, !dbg !2466
  %arrayidx471 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !2467
  store i64 %Asi.0.lcssa, ptr %arrayidx471, align 8, !dbg !2468
  %arrayidx472 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !2469
  store i64 %Aso.0.lcssa, ptr %arrayidx472, align 8, !dbg !2470
  %arrayidx473 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !2471
  store i64 %Asu.0.lcssa, ptr %arrayidx473, align 8, !dbg !2472
  ret void, !dbg !2473
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_finalize(ptr noundef %state) local_unnamed_addr #0 !dbg !2474 {
entry:
    #dbg_value(ptr %state, !2475, !DIExpression(), !2476)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2477
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2477
  %conv = trunc i64 %0 to i32, !dbg !2477
  call fastcc void @keccak_finalize(ptr noundef %state, i32 noundef %conv, i32 noundef 168, i8 noundef zeroext 31) #3, !dbg !2478
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2479
  store i64 168, ptr %arrayidx1, align 8, !dbg !2480
  ret void, !dbg !2481
}

; Function Attrs: nounwind
define internal fastcc void @keccak_finalize(ptr noundef %s, i32 noundef %pos, i32 noundef range(i32 136, 169) %r, i8 noundef zeroext %p) unnamed_addr #0 !dbg !2482 {
entry:
    #dbg_value(ptr %s, !2485, !DIExpression(), !2486)
    #dbg_value(i32 %pos, !2487, !DIExpression(), !2486)
    #dbg_value(i32 %r, !2488, !DIExpression(), !2486)
    #dbg_value(i8 31, !2489, !DIExpression(), !2486)
  %rem = shl i32 %pos, 3, !dbg !2490
  %mul = and i32 %rem, 56, !dbg !2490
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2491
  %shl = shl nuw nsw i64 31, %sh_prom, !dbg !2491
  %div2 = lshr i32 %pos, 3, !dbg !2492
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div2, !dbg !2493
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2494
  %xor = xor i64 %0, %shl, !dbg !2494
  store i64 %xor, ptr %arrayidx, align 8, !dbg !2494
  %div13 = lshr i32 %r, 3, !dbg !2495
  %1 = getelementptr i64, ptr %s, i32 %div13, !dbg !2496
  %arrayidx2 = getelementptr i8, ptr %1, i32 -8, !dbg !2496
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !2497
  %xor3 = xor i64 %2, -9223372036854775808, !dbg !2497
  store i64 %xor3, ptr %arrayidx2, align 8, !dbg !2497
  ret void, !dbg !2498
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) local_unnamed_addr #0 !dbg !2499 {
entry:
    #dbg_value(ptr %out, !2502, !DIExpression(), !2503)
    #dbg_value(i32 %outlen, !2504, !DIExpression(), !2503)
    #dbg_value(ptr %state, !2505, !DIExpression(), !2503)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2506
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2506
  %conv = trunc i64 %0 to i32, !dbg !2506
  %call = call fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state, i32 noundef %conv, i32 noundef 168) #3, !dbg !2507
  %conv1 = zext i32 %call to i64, !dbg !2507
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2508
  store i64 %conv1, ptr %arrayidx2, align 8, !dbg !2509
  ret void, !dbg !2510
}

; Function Attrs: nounwind
define internal fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %s, i32 noundef %pos, i32 noundef range(i32 136, 169) %r) unnamed_addr #0 !dbg !2511 {
entry:
    #dbg_value(ptr %out, !2514, !DIExpression(), !2515)
    #dbg_value(i32 %outlen, !2516, !DIExpression(), !2515)
    #dbg_value(ptr %s, !2517, !DIExpression(), !2515)
    #dbg_value(i32 %pos, !2518, !DIExpression(), !2515)
    #dbg_value(i32 %r, !2519, !DIExpression(), !2515)
  br label %while.cond, !dbg !2520

while.cond:                                       ; preds = %for.end, %entry
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ %i.0.lcssa, %for.end ]
  %outlen.addr.0 = phi i32 [ %outlen, %entry ], [ %sub3, %for.end ]
  %out.addr.0 = phi ptr [ %out, %entry ], [ %out.addr.1.lcssa, %for.end ]
    #dbg_value(ptr %out.addr.0, !2514, !DIExpression(), !2515)
    #dbg_value(i32 %outlen.addr.0, !2516, !DIExpression(), !2515)
    #dbg_value(i32 %pos.addr.0, !2518, !DIExpression(), !2515)
  %tobool.not = icmp eq i32 %outlen.addr.0, 0, !dbg !2520
  br i1 %tobool.not, label %while.end, label %while.body, !dbg !2520

while.body:                                       ; preds = %while.cond
  %cmp = icmp eq i32 %pos.addr.0, %r, !dbg !2521
  br i1 %cmp, label %if.then, label %if.end, !dbg !2521

if.then:                                          ; preds = %while.body
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2524
    #dbg_value(i32 0, !2518, !DIExpression(), !2515)
  br label %if.end, !dbg !2526

if.end:                                           ; preds = %if.then, %while.body
  %pos.addr.1 = phi i32 [ 0, %if.then ], [ %pos.addr.0, %while.body ]
    #dbg_value(i32 %pos.addr.1, !2518, !DIExpression(), !2515)
    #dbg_value(i32 %pos.addr.1, !2527, !DIExpression(), !2515)
  br label %for.cond, !dbg !2528

for.cond:                                         ; preds = %for.body, %if.end
  %i.0 = phi i32 [ %pos.addr.1, %if.end ], [ %inc, %for.body ], !dbg !2530
  %out.addr.1 = phi ptr [ %out.addr.0, %if.end ], [ %incdec.ptr, %for.body ]
    #dbg_value(ptr %out.addr.1, !2514, !DIExpression(), !2515)
    #dbg_value(i32 %i.0, !2527, !DIExpression(), !2515)
  %cmp1 = icmp ult i32 %i.0, %r, !dbg !2531
  %add = add i32 %pos.addr.1, %outlen.addr.0, !dbg !2533
  %cmp2 = icmp ult i32 %i.0, %add, !dbg !2533
  %0 = and i1 %cmp1, %cmp2, !dbg !2533
  br i1 %0, label %for.body, label %for.end, !dbg !2534

for.body:                                         ; preds = %for.cond
  %div1 = lshr i32 %i.0, 3, !dbg !2535
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div1, !dbg !2536
  %1 = load i64, ptr %arrayidx, align 8, !dbg !2536
  %rem = shl nuw nsw i32 %i.0, 3, !dbg !2537
  %mul = and i32 %rem, 56, !dbg !2537
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2538
  %shr = lshr i64 %1, %sh_prom, !dbg !2538
  %conv = trunc i64 %shr to i8, !dbg !2536
    #dbg_value(ptr %out.addr.1, !2514, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2515)
  store i8 %conv, ptr %out.addr.1, align 1, !dbg !2539
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %out.addr.1, i32 1, !dbg !2540
    #dbg_value(ptr %incdec.ptr, !2514, !DIExpression(), !2515)
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2541
    #dbg_value(i32 %inc, !2527, !DIExpression(), !2515)
  br label %for.cond, !dbg !2542, !llvm.loop !2543

for.end:                                          ; preds = %for.cond
  %i.0.lcssa = phi i32 [ %i.0, %for.cond ], !dbg !2530
  %out.addr.1.lcssa = phi ptr [ %out.addr.1, %for.cond ]
  %sub.neg = sub i32 %pos.addr.1, %i.0.lcssa, !dbg !2545
  %sub3 = add i32 %sub.neg, %outlen.addr.0, !dbg !2546
    #dbg_value(i32 %sub3, !2516, !DIExpression(), !2515)
    #dbg_value(i32 %i.0.lcssa, !2518, !DIExpression(), !2515)
  br label %while.cond, !dbg !2520, !llvm.loop !2547

while.end:                                        ; preds = %while.cond
  %pos.addr.0.lcssa = phi i32 [ %pos.addr.0, %while.cond ]
  ret i32 %pos.addr.0.lcssa, !dbg !2549
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2550 {
entry:
    #dbg_value(ptr %state, !2551, !DIExpression(), !2552)
    #dbg_value(ptr %in, !2553, !DIExpression(), !2552)
    #dbg_value(i32 %inlen, !2554, !DIExpression(), !2552)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 168, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #3, !dbg !2555
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2556
  store i64 168, ptr %arrayidx, align 8, !dbg !2557
  ret void, !dbg !2558
}

; Function Attrs: nounwind
define internal fastcc void @keccak_absorb_once(ptr noundef %s, i32 noundef range(i32 72, 169) %r, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext range(i8 6, 32) %p) unnamed_addr #0 !dbg !2559 {
entry:
    #dbg_value(ptr %s, !2562, !DIExpression(), !2563)
    #dbg_value(i32 %r, !2564, !DIExpression(), !2563)
    #dbg_value(ptr %in, !2565, !DIExpression(), !2563)
    #dbg_value(i32 %inlen, !2566, !DIExpression(), !2563)
    #dbg_value(i8 %p, !2567, !DIExpression(), !2563)
    #dbg_value(i32 0, !2568, !DIExpression(), !2563)
  br label %for.cond, !dbg !2569

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2571
    #dbg_value(i32 %i.0, !2568, !DIExpression(), !2563)
  %exitcond = icmp ne i32 %i.0, 25, !dbg !2572
  br i1 %exitcond, label %for.body, label %while.cond.preheader, !dbg !2574

while.cond.preheader:                             ; preds = %for.cond
  %0 = lshr i32 %r, 3, !dbg !2575
  br label %while.cond, !dbg !2575

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !2576
  store i64 0, ptr %arrayidx, align 8, !dbg !2577
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2578
    #dbg_value(i32 %inc, !2568, !DIExpression(), !2563)
  br label %for.cond, !dbg !2579, !llvm.loop !2580

while.cond:                                       ; preds = %while.cond.preheader, %for.end8
  %in.addr.0 = phi ptr [ %add.ptr9, %for.end8 ], [ %in, %while.cond.preheader ]
  %inlen.addr.0 = phi i32 [ %sub, %for.end8 ], [ %inlen, %while.cond.preheader ]
    #dbg_value(i32 %inlen.addr.0, !2566, !DIExpression(), !2563)
    #dbg_value(ptr %in.addr.0, !2565, !DIExpression(), !2563)
  %cmp1.not = icmp ult i32 %inlen.addr.0, %r, !dbg !2582
  br i1 %cmp1.not, label %for.cond10.preheader, label %for.cond2.preheader, !dbg !2575

for.cond2.preheader:                              ; preds = %while.cond
  br label %for.cond2, !dbg !2583

for.cond10.preheader:                             ; preds = %while.cond
  %inlen.addr.0.lcssa6 = phi i32 [ %inlen.addr.0, %while.cond ]
  %in.addr.0.lcssa = phi ptr [ %in.addr.0, %while.cond ]
  br label %for.cond10, !dbg !2586

for.cond2:                                        ; preds = %for.cond2.preheader, %for.body4
  %i.1 = phi i32 [ %inc7, %for.body4 ], [ 0, %for.cond2.preheader ], !dbg !2588
    #dbg_value(i32 %i.1, !2568, !DIExpression(), !2563)
  %exitcond5 = icmp ne i32 %i.1, %0, !dbg !2589
  br i1 %exitcond5, label %for.body4, label %for.end8, !dbg !2583

for.body4:                                        ; preds = %for.cond2
  %mul = shl nuw nsw i32 %i.1, 3, !dbg !2591
  %add.ptr = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %mul, !dbg !2592
  %call = call fastcc i64 @load64(ptr noundef %add.ptr) #3, !dbg !2593
  %arrayidx5 = getelementptr inbounds nuw i64, ptr %s, i32 %i.1, !dbg !2594
  %1 = load i64, ptr %arrayidx5, align 8, !dbg !2595
  %xor = xor i64 %1, %call, !dbg !2595
  store i64 %xor, ptr %arrayidx5, align 8, !dbg !2595
  %inc7 = add nuw nsw i32 %i.1, 1, !dbg !2596
    #dbg_value(i32 %inc7, !2568, !DIExpression(), !2563)
  br label %for.cond2, !dbg !2597, !llvm.loop !2598

for.end8:                                         ; preds = %for.cond2
  %add.ptr9 = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %r, !dbg !2600
    #dbg_value(ptr %add.ptr9, !2565, !DIExpression(), !2563)
  %sub = sub i32 %inlen.addr.0, %r, !dbg !2601
    #dbg_value(i32 %sub, !2566, !DIExpression(), !2563)
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2602
  br label %while.cond, !dbg !2575, !llvm.loop !2603

for.cond10:                                       ; preds = %for.cond10.preheader, %for.body12
  %i.2 = phi i32 [ %inc19, %for.body12 ], [ 0, %for.cond10.preheader ], !dbg !2605
    #dbg_value(i32 %i.2, !2568, !DIExpression(), !2563)
  %exitcond7 = icmp ne i32 %i.2, %inlen.addr.0.lcssa6, !dbg !2606
  br i1 %exitcond7, label %for.body12, label %for.end20, !dbg !2586

for.body12:                                       ; preds = %for.cond10
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %in.addr.0.lcssa, i32 %i.2, !dbg !2608
  %2 = load i8, ptr %arrayidx13, align 1, !dbg !2608
  %conv = zext i8 %2 to i64, !dbg !2609
  %rem = shl i32 %i.2, 3, !dbg !2610
  %mul14 = and i32 %rem, 56, !dbg !2610
  %sh_prom = zext nneg i32 %mul14 to i64, !dbg !2611
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !2611
  %div153 = lshr i32 %i.2, 3, !dbg !2612
  %arrayidx16 = getelementptr inbounds nuw i64, ptr %s, i32 %div153, !dbg !2613
  %3 = load i64, ptr %arrayidx16, align 8, !dbg !2614
  %xor17 = xor i64 %3, %shl, !dbg !2614
  store i64 %xor17, ptr %arrayidx16, align 8, !dbg !2614
  %inc19 = add i32 %i.2, 1, !dbg !2615
    #dbg_value(i32 %inc19, !2568, !DIExpression(), !2563)
  br label %for.cond10, !dbg !2616, !llvm.loop !2617

for.end20:                                        ; preds = %for.cond10
  %i.2.lcssa = phi i32 [ %i.2, %for.cond10 ], !dbg !2605
  %conv21 = zext nneg i8 %p to i64, !dbg !2619
  %rem22 = shl i32 %i.2.lcssa, 3, !dbg !2620
  %mul23 = and i32 %rem22, 56, !dbg !2620
  %sh_prom24 = zext nneg i32 %mul23 to i64, !dbg !2621
  %shl25 = shl nuw nsw i64 %conv21, %sh_prom24, !dbg !2621
  %div261 = lshr i32 %i.2.lcssa, 3, !dbg !2622
  %arrayidx27 = getelementptr inbounds nuw i64, ptr %s, i32 %div261, !dbg !2623
  %4 = load i64, ptr %arrayidx27, align 8, !dbg !2624
  %xor28 = xor i64 %4, %shl25, !dbg !2624
  store i64 %xor28, ptr %arrayidx27, align 8, !dbg !2624
  %sub29 = add nsw i32 %r, -1, !dbg !2625
  %div302 = lshr i32 %sub29, 3, !dbg !2626
  %arrayidx31 = getelementptr inbounds nuw i64, ptr %s, i32 %div302, !dbg !2627
  %5 = load i64, ptr %arrayidx31, align 8, !dbg !2628
  %xor32 = xor i64 %5, -9223372036854775808, !dbg !2628
  store i64 %xor32, ptr %arrayidx31, align 8, !dbg !2628
  ret void, !dbg !2629
}

; Function Attrs: nounwind
define internal fastcc i64 @load64(ptr noundef %x) unnamed_addr #0 !dbg !2630 {
entry:
    #dbg_value(ptr %x, !2633, !DIExpression(), !2634)
    #dbg_value(i64 0, !2635, !DIExpression(), !2634)
    #dbg_value(i32 0, !2636, !DIExpression(), !2634)
  br label %for.cond, !dbg !2637

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !2639
  %r.0 = phi i64 [ 0, %entry ], [ %or, %for.inc ], !dbg !2634
    #dbg_value(i64 %r.0, !2635, !DIExpression(), !2634)
    #dbg_value(i32 %i.0, !2636, !DIExpression(), !2634)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !2640
  br i1 %exitcond, label %for.inc, label %for.end, !dbg !2642

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i64 poison, i8 poison, i32 poison), !2635, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2634)
  %arrayidx = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2643
  %0 = load i8, ptr %arrayidx, align 1, !dbg !2643
    #dbg_value(!DIArgList(i64 %r.0, i8 %0, i32 %i.0), !2635, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2634)
  %conv = zext i8 %0 to i64, !dbg !2644
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i32 %i.0), !2635, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2634)
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2645
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i32 %mul), !2635, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2634)
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2646
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i64 %sh_prom), !2635, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2634)
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !2646
    #dbg_value(!DIArgList(i64 %r.0, i64 %shl), !2635, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value), !2634)
  %or = or i64 %r.0, %shl, !dbg !2647
    #dbg_value(i64 %or, !2635, !DIExpression(), !2634)
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2648
    #dbg_value(i32 %inc, !2636, !DIExpression(), !2634)
  br label %for.cond, !dbg !2649, !llvm.loop !2650

for.end:                                          ; preds = %for.cond
  %r.0.lcssa = phi i64 [ %r.0, %for.cond ], !dbg !2634
  ret i64 %r.0.lcssa, !dbg !2652
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #0 !dbg !2653 {
entry:
    #dbg_value(ptr %out, !2654, !DIExpression(), !2655)
    #dbg_value(i32 %nblocks, !2656, !DIExpression(), !2655)
    #dbg_value(ptr %state, !2657, !DIExpression(), !2655)
  call fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state, i32 noundef 168) #3, !dbg !2658
  ret void, !dbg !2659
}

; Function Attrs: nounwind
define internal fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %s, i32 noundef range(i32 136, 169) %r) unnamed_addr #0 !dbg !2660 {
entry:
    #dbg_value(ptr %out, !2663, !DIExpression(), !2664)
    #dbg_value(i32 %nblocks, !2665, !DIExpression(), !2664)
    #dbg_value(ptr %s, !2666, !DIExpression(), !2664)
    #dbg_value(i32 %r, !2667, !DIExpression(), !2664)
  %0 = lshr i32 %r, 3, !dbg !2668
  br label %while.cond, !dbg !2668

while.cond:                                       ; preds = %for.end, %entry
  %nblocks.addr.0 = phi i32 [ %nblocks, %entry ], [ %sub, %for.end ]
  %out.addr.0 = phi ptr [ %out, %entry ], [ %add.ptr1, %for.end ]
    #dbg_value(ptr %out.addr.0, !2663, !DIExpression(), !2664)
    #dbg_value(i32 %nblocks.addr.0, !2665, !DIExpression(), !2664)
  %tobool.not = icmp eq i32 %nblocks.addr.0, 0, !dbg !2668
  br i1 %tobool.not, label %while.end, label %while.body, !dbg !2668

while.body:                                       ; preds = %while.cond
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2669
    #dbg_value(i32 0, !2671, !DIExpression(), !2664)
  br label %for.cond, !dbg !2672

for.cond:                                         ; preds = %for.body, %while.body
  %i.0 = phi i32 [ 0, %while.body ], [ %inc, %for.body ], !dbg !2674
    #dbg_value(i32 %i.0, !2671, !DIExpression(), !2664)
  %exitcond = icmp ne i32 %i.0, %0, !dbg !2675
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2677

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2678
  %add.ptr = getelementptr inbounds nuw i8, ptr %out.addr.0, i32 %mul, !dbg !2679
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !2680
  %1 = load i64, ptr %arrayidx, align 8, !dbg !2680
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %1) #3, !dbg !2681
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2682
    #dbg_value(i32 %inc, !2671, !DIExpression(), !2664)
  br label %for.cond, !dbg !2683, !llvm.loop !2684

for.end:                                          ; preds = %for.cond
  %add.ptr1 = getelementptr inbounds nuw i8, ptr %out.addr.0, i32 %r, !dbg !2686
    #dbg_value(ptr %add.ptr1, !2663, !DIExpression(), !2664)
  %sub = add i32 %nblocks.addr.0, -1, !dbg !2687
    #dbg_value(i32 %sub, !2665, !DIExpression(), !2664)
  br label %while.cond, !dbg !2668, !llvm.loop !2688

while.end:                                        ; preds = %while.cond
  ret void, !dbg !2690
}

; Function Attrs: nounwind
define internal fastcc void @store64(ptr noundef %x, i64 noundef %u) unnamed_addr #0 !dbg !2691 {
entry:
    #dbg_value(ptr %x, !2694, !DIExpression(), !2695)
    #dbg_value(i64 %u, !2696, !DIExpression(), !2695)
    #dbg_value(i32 0, !2697, !DIExpression(), !2695)
  br label %for.cond, !dbg !2698

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2700
    #dbg_value(i32 %i.0, !2697, !DIExpression(), !2695)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !2701
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2703

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2704
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2705
  %shr = lshr i64 %u, %sh_prom, !dbg !2705
  %conv = trunc i64 %shr to i8, !dbg !2706
  %arrayidx = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2707
  store i8 %conv, ptr %arrayidx, align 1, !dbg !2708
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2709
    #dbg_value(i32 %inc, !2697, !DIExpression(), !2695)
  br label %for.cond, !dbg !2710, !llvm.loop !2711

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2713
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef %state) local_unnamed_addr #0 !dbg !2714 {
entry:
    #dbg_value(ptr %state, !2715, !DIExpression(), !2716)
  call fastcc void @keccak_init(ptr noundef %state) #3, !dbg !2717
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2718
  store i64 0, ptr %arrayidx, align 8, !dbg !2719
  ret void, !dbg !2720
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2721 {
entry:
    #dbg_value(ptr %state, !2722, !DIExpression(), !2723)
    #dbg_value(ptr %in, !2724, !DIExpression(), !2723)
    #dbg_value(i32 %inlen, !2725, !DIExpression(), !2723)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2726
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2726
  %conv = trunc i64 %0 to i32, !dbg !2726
  %call = call fastcc i32 @keccak_absorb(ptr noundef %state, i32 noundef %conv, i32 noundef 136, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2727
  %conv1 = zext i32 %call to i64, !dbg !2727
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2728
  store i64 %conv1, ptr %arrayidx2, align 8, !dbg !2729
  ret void, !dbg !2730
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef %state) local_unnamed_addr #0 !dbg !2731 {
entry:
    #dbg_value(ptr %state, !2732, !DIExpression(), !2733)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2734
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2734
  %conv = trunc i64 %0 to i32, !dbg !2734
  call fastcc void @keccak_finalize(ptr noundef %state, i32 noundef %conv, i32 noundef 136, i8 noundef zeroext 31) #3, !dbg !2735
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2736
  store i64 136, ptr %arrayidx1, align 8, !dbg !2737
  ret void, !dbg !2738
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) local_unnamed_addr #0 !dbg !2739 {
entry:
    #dbg_value(ptr %out, !2740, !DIExpression(), !2741)
    #dbg_value(i32 %outlen, !2742, !DIExpression(), !2741)
    #dbg_value(ptr %state, !2743, !DIExpression(), !2741)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2744
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2744
  %conv = trunc i64 %0 to i32, !dbg !2744
  %call = call fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state, i32 noundef %conv, i32 noundef 136) #3, !dbg !2745
  %conv1 = zext i32 %call to i64, !dbg !2745
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2746
  store i64 %conv1, ptr %arrayidx2, align 8, !dbg !2747
  ret void, !dbg !2748
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2749 {
entry:
    #dbg_value(ptr %state, !2750, !DIExpression(), !2751)
    #dbg_value(ptr %in, !2752, !DIExpression(), !2751)
    #dbg_value(i32 %inlen, !2753, !DIExpression(), !2751)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #3, !dbg !2754
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2755
  store i64 136, ptr %arrayidx, align 8, !dbg !2756
  ret void, !dbg !2757
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #0 !dbg !2758 {
entry:
    #dbg_value(ptr %out, !2759, !DIExpression(), !2760)
    #dbg_value(i32 %nblocks, !2761, !DIExpression(), !2760)
    #dbg_value(ptr %state, !2762, !DIExpression(), !2760)
  call fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state, i32 noundef 136) #3, !dbg !2763
  ret void, !dbg !2764
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2765 {
entry:
  %state = alloca [26 x i64], align 8
    #dbg_value(ptr %out, !2768, !DIExpression(), !2769)
    #dbg_value(i32 %outlen, !2770, !DIExpression(), !2769)
    #dbg_value(ptr %in, !2771, !DIExpression(), !2769)
    #dbg_value(i32 %inlen, !2772, !DIExpression(), !2769)
    #dbg_declare(ptr %state, !2773, !DIExpression(), !2774)
  call void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef nonnull %state, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2775
  %div = udiv i32 %outlen, 168, !dbg !2776
    #dbg_value(i32 %div, !2777, !DIExpression(), !2769)
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %div, ptr noundef nonnull %state) #3, !dbg !2778
  %mul.neg = mul i32 %div, -168, !dbg !2779
  %sub = add i32 %mul.neg, %outlen, !dbg !2780
    #dbg_value(i32 %sub, !2770, !DIExpression(), !2769)
  %mul1 = mul nuw i32 %div, 168, !dbg !2781
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !2782
    #dbg_value(ptr %add.ptr, !2768, !DIExpression(), !2769)
  call void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef nonnull %state) #3, !dbg !2783
  ret void, !dbg !2784
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2785 {
entry:
  %state = alloca [26 x i64], align 8
    #dbg_value(ptr %out, !2786, !DIExpression(), !2787)
    #dbg_value(i32 %outlen, !2788, !DIExpression(), !2787)
    #dbg_value(ptr %in, !2789, !DIExpression(), !2787)
    #dbg_value(i32 %inlen, !2790, !DIExpression(), !2787)
    #dbg_declare(ptr %state, !2791, !DIExpression(), !2792)
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef nonnull %state, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2793
  %div = udiv i32 %outlen, 136, !dbg !2794
    #dbg_value(i32 %div, !2795, !DIExpression(), !2787)
  call void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %div, ptr noundef nonnull %state) #3, !dbg !2796
  %mul.neg = mul i32 %div, -136, !dbg !2797
  %sub = add i32 %mul.neg, %outlen, !dbg !2798
    #dbg_value(i32 %sub, !2788, !DIExpression(), !2787)
  %mul1 = mul nuw i32 %div, 136, !dbg !2799
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !2800
    #dbg_value(ptr %add.ptr, !2786, !DIExpression(), !2787)
  call void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef nonnull %state) #3, !dbg !2801
  ret void, !dbg !2802
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2803 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !2806, !DIExpression(), !2807)
    #dbg_value(ptr %in, !2808, !DIExpression(), !2807)
    #dbg_value(i32 %inlen, !2809, !DIExpression(), !2807)
    #dbg_declare(ptr %s, !2810, !DIExpression(), !2814)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %s, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #3, !dbg !2815
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #3, !dbg !2816
    #dbg_value(i32 0, !2817, !DIExpression(), !2807)
  br label %for.cond, !dbg !2818

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2820
    #dbg_value(i32 %i.0, !2817, !DIExpression(), !2807)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !2821
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2823

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2824
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !2825
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !2826
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2826
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %0) #3, !dbg !2827
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2828
    #dbg_value(i32 %inc, !2817, !DIExpression(), !2807)
  br label %for.cond, !dbg !2829, !llvm.loop !2830

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2832
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2833 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !2834, !DIExpression(), !2835)
    #dbg_value(ptr %in, !2836, !DIExpression(), !2835)
    #dbg_value(i32 %inlen, !2837, !DIExpression(), !2835)
    #dbg_declare(ptr %s, !2838, !DIExpression(), !2839)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %s, i32 noundef 72, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #3, !dbg !2840
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #3, !dbg !2841
    #dbg_value(i32 0, !2842, !DIExpression(), !2835)
  br label %for.cond, !dbg !2843

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2845
    #dbg_value(i32 %i.0, !2842, !DIExpression(), !2835)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !2846
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2848

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2849
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !2850
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !2851
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2851
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %0) #3, !dbg !2852
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2853
    #dbg_value(i32 %inc, !2842, !DIExpression(), !2835)
  br label %for.cond, !dbg !2854, !llvm.loop !2855

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2857
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_kyber_shake128_absorb(ptr noundef %state, ptr noundef %seed, i8 noundef zeroext %x, i8 noundef zeroext %y) local_unnamed_addr #0 !dbg !2858 {
entry:
  %extseed = alloca [34 x i8], align 1
    #dbg_value(ptr %state, !2862, !DIExpression(), !2863)
    #dbg_value(ptr %seed, !2864, !DIExpression(), !2863)
    #dbg_value(i8 %x, !2865, !DIExpression(), !2863)
    #dbg_value(i8 %y, !2866, !DIExpression(), !2863)
    #dbg_declare(ptr %extseed, !2867, !DIExpression(), !2871)
  %call = call ptr @memcpy(ptr noundef nonnull %extseed, ptr noundef %seed, i32 noundef 32) #4, !dbg !2872
  %arrayidx = getelementptr inbounds nuw i8, ptr %extseed, i32 32, !dbg !2873
  store i8 %x, ptr %arrayidx, align 1, !dbg !2874
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %extseed, i32 33, !dbg !2875
  store i8 %y, ptr %arrayidx1, align 1, !dbg !2876
  call void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef nonnull %extseed, i32 noundef 34) #3, !dbg !2877
  ret void, !dbg !2878
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_kyber_shake256_prf(ptr noundef %out, i32 noundef %outlen, ptr noundef %key, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !2879 {
entry:
  %extkey = alloca [33 x i8], align 1
    #dbg_value(ptr %out, !2882, !DIExpression(), !2883)
    #dbg_value(i32 %outlen, !2884, !DIExpression(), !2883)
    #dbg_value(ptr %key, !2885, !DIExpression(), !2883)
    #dbg_value(i8 %nonce, !2886, !DIExpression(), !2883)
    #dbg_declare(ptr %extkey, !2887, !DIExpression(), !2891)
  %call = call ptr @memcpy(ptr noundef nonnull %extkey, ptr noundef %key, i32 noundef 32) #4, !dbg !2892
  %arrayidx = getelementptr inbounds nuw i8, ptr %extkey, i32 32, !dbg !2893
  store i8 %nonce, ptr %arrayidx, align 1, !dbg !2894
  call void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef nonnull %extkey, i32 noundef 33) #3, !dbg !2895
  ret void, !dbg !2896
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_kyber_shake256_rkprf(ptr noundef %out, ptr noundef %key, ptr noundef %input) local_unnamed_addr #0 !dbg !2897 {
entry:
  %s = alloca [26 x i64], align 8
    #dbg_value(ptr %out, !2898, !DIExpression(), !2899)
    #dbg_value(ptr %key, !2900, !DIExpression(), !2899)
    #dbg_value(ptr %input, !2901, !DIExpression(), !2899)
    #dbg_declare(ptr %s, !2902, !DIExpression(), !2903)
  call void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef nonnull %s) #3, !dbg !2904
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef nonnull %s, ptr noundef %key, i32 noundef 32) #3, !dbg !2905
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef nonnull %s, ptr noundef %input, i32 noundef 1568) #3, !dbg !2906
  call void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef nonnull %s) #3, !dbg !2907
  call void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef 32, ptr noundef nonnull %s) #3, !dbg !2908
  ret void, !dbg !2909
}

; Function Attrs: nounwind
define dso_local void @kyber_memset(ptr noundef %dst, i8 noundef zeroext %val, i32 noundef %len) local_unnamed_addr #0 !dbg !2910 {
entry:
    #dbg_value(ptr %dst, !2915, !DIExpression(), !2916)
    #dbg_value(i8 %val, !2917, !DIExpression(), !2916)
    #dbg_value(i32 %len, !2918, !DIExpression(), !2916)
    #dbg_value(ptr %dst, !2919, !DIExpression(), !2916)
    #dbg_value(i32 0, !2920, !DIExpression(), !2922)
  br label %for.cond, !dbg !2923

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2924
    #dbg_value(i32 %i.0, !2920, !DIExpression(), !2922)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !2925
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2927

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %dst, i32 %i.0, !dbg !2928
  store i8 %val, ptr %arrayidx, align 1, !dbg !2929
  %inc = add i32 %i.0, 1, !dbg !2930
    #dbg_value(i32 %inc, !2920, !DIExpression(), !2922)
  br label %for.cond, !dbg !2931, !llvm.loop !2932

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2934
}

; Function Attrs: nounwind
define dso_local void @kyber_memcpy(ptr noundef %dst, ptr noundef %src, i32 noundef %len) local_unnamed_addr #0 !dbg !2935 {
entry:
    #dbg_value(ptr %dst, !2940, !DIExpression(), !2941)
    #dbg_value(ptr %src, !2942, !DIExpression(), !2941)
    #dbg_value(i32 %len, !2943, !DIExpression(), !2941)
    #dbg_value(ptr %dst, !2944, !DIExpression(), !2941)
    #dbg_value(ptr %src, !2945, !DIExpression(), !2941)
    #dbg_value(i32 0, !2946, !DIExpression(), !2948)
  br label %for.cond, !dbg !2949

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2950
    #dbg_value(i32 %i.0, !2946, !DIExpression(), !2948)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !2951
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2953

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %src, i32 %i.0, !dbg !2954
  %0 = load i8, ptr %arrayidx, align 1, !dbg !2954
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %dst, i32 %i.0, !dbg !2955
  store i8 %0, ptr %arrayidx1, align 1, !dbg !2956
  %inc = add i32 %i.0, 1, !dbg !2957
    #dbg_value(i32 %inc, !2946, !DIExpression(), !2948)
  br label %for.cond, !dbg !2958, !llvm.loop !2959

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2961
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
!1 = distinct !DIGlobalVariable(name: "fd", scope: !2, file: !3, line: 79, type: !25, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "randombytes", scope: !3, file: !3, line: 78, type: !4, scopeLine: 78, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !24)
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
!19 = distinct !DIGlobalVariable(scope: null, file: !3, line: 83, type: !20, isLocal: true, isDefinition: true)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 104, elements: !22)
!21 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!22 = !{!23}
!23 = !DISubrange(count: 13)
!24 = !{}
!25 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!26 = !DIGlobalVariableExpression(var: !27, expr: !DIExpression())
!27 = distinct !DIGlobalVariable(name: "pqcrystals_kyber1024_ref_zetas", scope: !28, file: !33, line: 40, type: !34, isLocal: false, isDefinition: true)
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
!42 = distinct !DIGlobalVariable(name: "KeccakF_RoundConstants", scope: !43, file: !49, line: 52, type: !50, isLocal: true, isDefinition: true)
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
!82 = distinct !DISubprogram(name: "main", scope: !83, file: !83, line: 98, type: !84, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !54, retainedNodes: !24)
!83 = !DIFile(filename: "../../../ref/test/test_kyber.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!84 = !DISubroutineType(types: !85)
!85 = !{!25}
!86 = !DILocalVariable(name: "i", scope: !82, file: !83, line: 99, type: !14)
!87 = !DILocation(line: 0, scope: !82)
!88 = !DILocation(line: 102, column: 8, scope: !89)
!89 = distinct !DILexicalBlock(scope: !82, file: !83, line: 102, column: 3)
!90 = !DILocation(line: 102, scope: !89)
!91 = !DILocation(line: 102, column: 17, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !83, line: 102, column: 3)
!93 = !DILocation(line: 102, column: 3, scope: !89)
!94 = !DILocation(line: 103, column: 9, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !83, line: 102, column: 32)
!96 = !DILocalVariable(name: "r", scope: !82, file: !83, line: 100, type: !25)
!97 = !DILocation(line: 104, column: 10, scope: !95)
!98 = !DILocation(line: 104, column: 7, scope: !95)
!99 = !DILocation(line: 105, column: 10, scope: !95)
!100 = !DILocation(line: 105, column: 7, scope: !95)
!101 = !DILocation(line: 106, column: 9, scope: !102)
!102 = distinct !DILexicalBlock(scope: !95, file: !83, line: 106, column: 9)
!103 = !DILocation(line: 102, column: 28, scope: !92)
!104 = !DILocation(line: 102, column: 3, scope: !92)
!105 = distinct !{!105, !93, !106, !107}
!106 = !DILocation(line: 108, column: 3, scope: !89)
!107 = !{!"llvm.loop.mustprogress"}
!108 = !DILocation(line: 115, column: 1, scope: !82)
!109 = distinct !DISubprogram(name: "test_keys", scope: !83, file: !83, line: 10, type: !84, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !54, retainedNodes: !24)
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
!132 = !DILocation(line: 26, column: 7, scope: !133)
!133 = distinct !DILexicalBlock(scope: !109, file: !83, line: 26, column: 7)
!134 = !DILocation(line: 0, scope: !109)
!135 = !DILocation(line: 33, column: 1, scope: !109)
!136 = distinct !DISubprogram(name: "test_invalid_sk_a", scope: !83, file: !83, line: 35, type: !84, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !54, retainedNodes: !24)
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
!151 = !DILocation(line: 54, column: 8, scope: !152)
!152 = distinct !DILexicalBlock(scope: !136, file: !83, line: 54, column: 7)
!153 = !DILocation(line: 0, scope: !136)
!154 = !DILocation(line: 61, column: 1, scope: !136)
!155 = distinct !DISubprogram(name: "test_invalid_ciphertext", scope: !83, file: !83, line: 63, type: !84, scopeLine: 63, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !54, retainedNodes: !24)
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
!171 = !DILocation(line: 74, column: 13, scope: !155)
!172 = !DILocation(line: 74, column: 12, scope: !155)
!173 = !DILocation(line: 74, column: 3, scope: !170)
!174 = distinct !{!174, !166, !175, !107}
!175 = !DILocation(line: 74, column: 14, scope: !155)
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
!186 = !DILocation(line: 89, column: 8, scope: !187)
!187 = distinct !DILexicalBlock(scope: !155, file: !83, line: 89, column: 7)
!188 = !DILocation(line: 96, column: 1, scope: !155)
!189 = !DILocalVariable(name: "out", arg: 1, scope: !2, file: !3, line: 78, type: !6)
!190 = !DILocation(line: 0, scope: !2)
!191 = !DILocalVariable(name: "outlen", arg: 2, scope: !2, file: !3, line: 78, type: !12)
!192 = !DILocation(line: 82, column: 3, scope: !2)
!193 = !DILocation(line: 82, column: 10, scope: !2)
!194 = !DILocation(line: 82, column: 13, scope: !2)
!195 = !DILocation(line: 90, column: 3, scope: !2)
!196 = !DILocation(line: 83, column: 10, scope: !197)
!197 = distinct !DILexicalBlock(scope: !2, file: !3, line: 82, column: 20)
!198 = !DILocation(line: 83, column: 8, scope: !197)
!199 = !DILocation(line: 84, column: 12, scope: !200)
!200 = distinct !DILexicalBlock(scope: !197, file: !3, line: 84, column: 9)
!201 = !DILocation(line: 84, column: 18, scope: !200)
!202 = !DILocation(line: 84, column: 21, scope: !200)
!203 = !DILocation(line: 84, column: 27, scope: !200)
!204 = !DILocation(line: 86, column: 14, scope: !205)
!205 = distinct !DILexicalBlock(scope: !200, file: !3, line: 86, column: 14)
!206 = !DILocation(line: 86, column: 17, scope: !205)
!207 = !DILocation(line: 87, column: 7, scope: !205)
!208 = distinct !{!208, !192, !209, !107}
!209 = !DILocation(line: 88, column: 3, scope: !2)
!210 = !DILocation(line: 90, column: 17, scope: !2)
!211 = !DILocation(line: 91, column: 16, scope: !212)
!212 = distinct !DILexicalBlock(scope: !2, file: !3, line: 90, column: 22)
!213 = !DILocation(line: 91, column: 11, scope: !212)
!214 = !DILocalVariable(name: "ret", scope: !2, file: !3, line: 80, type: !215)
!215 = !DIDerivedType(tag: DW_TAG_typedef, name: "ssize_t", file: !216, line: 81, baseType: !217)
!216 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/stdio.h", directory: "")
!217 = !DIDerivedType(tag: DW_TAG_typedef, name: "_ssize_t", file: !218, line: 147, baseType: !25)
!218 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/sys/_types.h", directory: "")
!219 = !DILocation(line: 92, column: 19, scope: !220)
!220 = distinct !DILexicalBlock(scope: !212, file: !3, line: 92, column: 9)
!221 = !DILocation(line: 92, column: 22, scope: !220)
!222 = !DILocation(line: 92, column: 28, scope: !220)
!223 = distinct !{!223, !195, !224, !107}
!224 = !DILocation(line: 99, column: 3, scope: !2)
!225 = !DILocation(line: 95, column: 7, scope: !226)
!226 = distinct !DILexicalBlock(scope: !220, file: !3, line: 94, column: 14)
!227 = !DILocation(line: 97, column: 9, scope: !212)
!228 = !DILocation(line: 98, column: 12, scope: !212)
!229 = !DILocation(line: 100, column: 1, scope: !2)
!230 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_keypair_derand", scope: !231, file: !231, line: 27, type: !232, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !24)
!231 = !DIFile(filename: "../../../ref/kem.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!232 = !DISubroutineType(types: !233)
!233 = !{!25, !6, !6, !234}
!234 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !235, size: 32)
!235 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !7)
!236 = !DILocalVariable(name: "pk", arg: 1, scope: !230, file: !231, line: 27, type: !6)
!237 = !DILocation(line: 0, scope: !230)
!238 = !DILocalVariable(name: "sk", arg: 2, scope: !230, file: !231, line: 27, type: !6)
!239 = !DILocalVariable(name: "coins", arg: 3, scope: !230, file: !231, line: 27, type: !234)
!240 = !DILocation(line: 28, column: 3, scope: !230)
!241 = !DILocation(line: 29, column: 13, scope: !230)
!242 = !DILocation(line: 29, column: 3, scope: !230)
!243 = !DILocation(line: 30, column: 3, scope: !230)
!244 = !DILocation(line: 33, column: 36, scope: !230)
!245 = !DILocation(line: 33, column: 60, scope: !230)
!246 = !DILocation(line: 33, column: 3, scope: !230)
!247 = !DILocation(line: 38, column: 3, scope: !230)
!248 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_keypair", scope: !231, file: !231, line: 54, type: !249, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !24)
!249 = !DISubroutineType(types: !250)
!250 = !{!25, !6, !6}
!251 = !DILocalVariable(name: "pk", arg: 1, scope: !248, file: !231, line: 54, type: !6)
!252 = !DILocation(line: 0, scope: !248)
!253 = !DILocalVariable(name: "sk", arg: 2, scope: !248, file: !231, line: 54, type: !6)
!254 = !DILocalVariable(name: "coins", scope: !248, file: !231, line: 55, type: !255)
!255 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 512, elements: !256)
!256 = !{!257}
!257 = !DISubrange(count: 64)
!258 = !DILocation(line: 55, column: 11, scope: !248)
!259 = !DILocation(line: 56, column: 3, scope: !248)
!260 = !DILocation(line: 57, column: 3, scope: !248)
!261 = !DILocation(line: 59, column: 3, scope: !248)
!262 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_enc_derand", scope: !231, file: !231, line: 80, type: !263, scopeLine: 81, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !24)
!263 = !DISubroutineType(types: !264)
!264 = !{!25, !6, !6, !234, !234}
!265 = !DILocalVariable(name: "ct", arg: 1, scope: !262, file: !231, line: 80, type: !6)
!266 = !DILocation(line: 0, scope: !262)
!267 = !DILocalVariable(name: "ss", arg: 2, scope: !262, file: !231, line: 80, type: !6)
!268 = !DILocalVariable(name: "pk", arg: 3, scope: !262, file: !231, line: 80, type: !234)
!269 = !DILocalVariable(name: "coins", arg: 4, scope: !262, file: !231, line: 81, type: !234)
!270 = !DILocalVariable(name: "buf", scope: !262, file: !231, line: 82, type: !255)
!271 = !DILocation(line: 82, column: 11, scope: !262)
!272 = !DILocalVariable(name: "kr", scope: !262, file: !231, line: 84, type: !255)
!273 = !DILocation(line: 84, column: 11, scope: !262)
!274 = !DILocation(line: 86, column: 3, scope: !262)
!275 = !DILocation(line: 89, column: 3, scope: !262)
!276 = !DILocation(line: 90, column: 3, scope: !262)
!277 = !DILocation(line: 93, column: 30, scope: !262)
!278 = !DILocation(line: 93, column: 3, scope: !262)
!279 = !DILocation(line: 95, column: 3, scope: !262)
!280 = !DILocation(line: 99, column: 3, scope: !262)
!281 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_enc", scope: !231, file: !231, line: 117, type: !232, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !24)
!282 = !DILocalVariable(name: "ct", arg: 1, scope: !281, file: !231, line: 117, type: !6)
!283 = !DILocation(line: 0, scope: !281)
!284 = !DILocalVariable(name: "ss", arg: 2, scope: !281, file: !231, line: 117, type: !6)
!285 = !DILocalVariable(name: "pk", arg: 3, scope: !281, file: !231, line: 117, type: !234)
!286 = !DILocalVariable(name: "coins", scope: !281, file: !231, line: 118, type: !123)
!287 = !DILocation(line: 118, column: 11, scope: !281)
!288 = !DILocation(line: 119, column: 3, scope: !281)
!289 = !DILocation(line: 120, column: 3, scope: !281)
!290 = !DILocation(line: 122, column: 3, scope: !281)
!291 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_dec", scope: !231, file: !231, line: 142, type: !292, scopeLine: 142, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !24)
!292 = !DISubroutineType(types: !293)
!293 = !{!25, !6, !234, !234}
!294 = !DILocalVariable(name: "ss", arg: 1, scope: !291, file: !231, line: 142, type: !6)
!295 = !DILocation(line: 0, scope: !291)
!296 = !DILocalVariable(name: "ct", arg: 2, scope: !291, file: !231, line: 142, type: !234)
!297 = !DILocalVariable(name: "sk", arg: 3, scope: !291, file: !231, line: 142, type: !234)
!298 = !DILocalVariable(name: "buf", scope: !291, file: !231, line: 144, type: !255)
!299 = !DILocation(line: 144, column: 11, scope: !291)
!300 = !DILocalVariable(name: "kr", scope: !291, file: !231, line: 146, type: !255)
!301 = !DILocation(line: 146, column: 11, scope: !291)
!302 = !DILocalVariable(name: "cmp", scope: !291, file: !231, line: 148, type: !111)
!303 = !DILocation(line: 148, column: 11, scope: !291)
!304 = !DILocation(line: 149, column: 26, scope: !291)
!305 = !DILocalVariable(name: "pk", scope: !291, file: !231, line: 149, type: !234)
!306 = !DILocation(line: 151, column: 3, scope: !291)
!307 = !DILocation(line: 154, column: 14, scope: !291)
!308 = !DILocation(line: 154, column: 58, scope: !291)
!309 = !DILocation(line: 154, column: 3, scope: !291)
!310 = !DILocation(line: 156, column: 3, scope: !291)
!311 = !DILocation(line: 159, column: 31, scope: !291)
!312 = !DILocation(line: 159, column: 3, scope: !291)
!313 = !DILocation(line: 161, column: 10, scope: !291)
!314 = !DILocalVariable(name: "fail", scope: !291, file: !231, line: 143, type: !25)
!315 = !DILocation(line: 164, column: 3, scope: !291)
!316 = !DILocation(line: 167, column: 32, scope: !291)
!317 = !DILocation(line: 167, column: 3, scope: !291)
!318 = !DILocation(line: 171, column: 3, scope: !291)
!319 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_gen_matrix", scope: !320, file: !320, line: 183, type: !321, scopeLine: 184, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !58, retainedNodes: !24)
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
!334 = !DILocalVariable(name: "a", arg: 1, scope: !319, file: !320, line: 183, type: !323)
!335 = !DILocation(line: 0, scope: !319)
!336 = !DILocalVariable(name: "seed", arg: 2, scope: !319, file: !320, line: 183, type: !234)
!337 = !DILocalVariable(name: "transposed", arg: 3, scope: !319, file: !320, line: 184, type: !25)
!338 = !DILocalVariable(name: "buf", scope: !319, file: !320, line: 187, type: !339)
!339 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 4032, elements: !340)
!340 = !{!341}
!341 = !DISubrange(count: 504)
!342 = !DILocation(line: 187, column: 11, scope: !319)
!343 = !DILocalVariable(name: "state", scope: !319, file: !320, line: 188, type: !344)
!344 = !DIDerivedType(tag: DW_TAG_typedef, name: "xof_state", file: !345, line: 10, baseType: !346)
!345 = !DIFile(filename: "../../../ref/symmetric.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!346 = !DIDerivedType(tag: DW_TAG_typedef, name: "keccak_state", file: !347, line: 14, baseType: !348)
!347 = !DIFile(filename: "../../../ref/fips202.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!348 = !DICompositeType(tag: DW_TAG_array_type, baseType: !45, size: 1664, elements: !349)
!349 = !{!350}
!350 = !DISubrange(count: 26)
!351 = !DILocation(line: 188, column: 13, scope: !319)
!352 = !DILocalVariable(name: "i", scope: !319, file: !320, line: 185, type: !14)
!353 = !DILocation(line: 190, column: 8, scope: !354)
!354 = distinct !DILexicalBlock(scope: !319, file: !320, line: 190, column: 3)
!355 = !DILocation(line: 190, scope: !354)
!356 = !DILocation(line: 190, column: 17, scope: !357)
!357 = distinct !DILexicalBlock(scope: !354, file: !320, line: 190, column: 3)
!358 = !DILocation(line: 190, column: 3, scope: !354)
!359 = !DILocation(line: 191, column: 5, scope: !360)
!360 = distinct !DILexicalBlock(scope: !361, file: !320, line: 191, column: 5)
!361 = distinct !DILexicalBlock(scope: !357, file: !320, line: 190, column: 33)
!362 = !DILocation(line: 191, scope: !360)
!363 = !DILocalVariable(name: "j", scope: !319, file: !320, line: 185, type: !14)
!364 = !DILocation(line: 191, column: 19, scope: !365)
!365 = distinct !DILexicalBlock(scope: !360, file: !320, line: 191, column: 5)
!366 = !DILocation(line: 192, column: 11, scope: !367)
!367 = distinct !DILexicalBlock(scope: !368, file: !320, line: 192, column: 11)
!368 = distinct !DILexicalBlock(scope: !365, file: !320, line: 191, column: 35)
!369 = !DILocation(line: 193, column: 9, scope: !367)
!370 = !DILocation(line: 195, column: 9, scope: !367)
!371 = !DILocation(line: 197, column: 7, scope: !368)
!372 = !DILocalVariable(name: "buflen", scope: !319, file: !320, line: 186, type: !14)
!373 = !DILocation(line: 199, column: 25, scope: !368)
!374 = !DILocation(line: 199, column: 13, scope: !368)
!375 = !DILocalVariable(name: "ctr", scope: !319, file: !320, line: 185, type: !14)
!376 = !DILocation(line: 201, column: 7, scope: !368)
!377 = !DILocation(line: 0, scope: !368)
!378 = !DILocation(line: 201, column: 18, scope: !368)
!379 = !DILocation(line: 202, column: 9, scope: !380)
!380 = distinct !DILexicalBlock(scope: !368, file: !320, line: 201, column: 29)
!381 = !DILocation(line: 204, column: 28, scope: !380)
!382 = !DILocation(line: 204, column: 36, scope: !380)
!383 = !DILocation(line: 204, column: 51, scope: !380)
!384 = !DILocation(line: 204, column: 16, scope: !380)
!385 = !DILocation(line: 204, column: 13, scope: !380)
!386 = distinct !{!386, !376, !387, !107}
!387 = !DILocation(line: 205, column: 7, scope: !368)
!388 = !DILocation(line: 191, column: 31, scope: !365)
!389 = !DILocation(line: 191, column: 5, scope: !365)
!390 = distinct !{!390, !359, !391, !107}
!391 = !DILocation(line: 206, column: 5, scope: !360)
!392 = !DILocation(line: 190, column: 29, scope: !357)
!393 = !DILocation(line: 190, column: 3, scope: !357)
!394 = distinct !{!394, !358, !395, !107}
!395 = !DILocation(line: 207, column: 3, scope: !354)
!396 = !DILocation(line: 210, column: 1, scope: !319)
!397 = distinct !DISubprogram(name: "rej_uniform", scope: !320, file: !320, line: 140, type: !398, scopeLine: 141, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !58, retainedNodes: !24)
!398 = !DISubroutineType(types: !399)
!399 = !{!14, !400, !14, !234, !14}
!400 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 32)
!401 = !DILocalVariable(name: "r", arg: 1, scope: !397, file: !320, line: 140, type: !400)
!402 = !DILocation(line: 0, scope: !397)
!403 = !DILocalVariable(name: "len", arg: 2, scope: !397, file: !320, line: 140, type: !14)
!404 = !DILocalVariable(name: "buf", arg: 3, scope: !397, file: !320, line: 141, type: !234)
!405 = !DILocalVariable(name: "buflen", arg: 4, scope: !397, file: !320, line: 141, type: !14)
!406 = !DILocalVariable(name: "pos", scope: !397, file: !320, line: 142, type: !14)
!407 = !DILocalVariable(name: "ctr", scope: !397, file: !320, line: 142, type: !14)
!408 = !DILocation(line: 146, column: 3, scope: !397)
!409 = !DILocation(line: 146, column: 14, scope: !397)
!410 = !DILocation(line: 146, column: 20, scope: !397)
!411 = !DILocation(line: 147, column: 14, scope: !412)
!412 = distinct !DILexicalBlock(scope: !397, file: !320, line: 146, column: 42)
!413 = !DILocation(line: 147, column: 46, scope: !412)
!414 = !DILocation(line: 147, column: 36, scope: !412)
!415 = !DILocation(line: 147, column: 59, scope: !412)
!416 = !DILocation(line: 147, column: 66, scope: !412)
!417 = !DILocalVariable(name: "val0", scope: !397, file: !320, line: 143, type: !60)
!418 = !DILocation(line: 148, column: 14, scope: !412)
!419 = !DILocation(line: 148, column: 27, scope: !412)
!420 = !DILocation(line: 148, column: 46, scope: !412)
!421 = !DILocation(line: 148, column: 36, scope: !412)
!422 = !DILocation(line: 148, column: 59, scope: !412)
!423 = !DILocation(line: 148, column: 33, scope: !412)
!424 = !DILocalVariable(name: "val1", scope: !397, file: !320, line: 143, type: !60)
!425 = !DILocation(line: 149, column: 9, scope: !412)
!426 = !DILocation(line: 151, column: 14, scope: !427)
!427 = distinct !DILexicalBlock(scope: !412, file: !320, line: 151, column: 9)
!428 = !DILocation(line: 152, column: 12, scope: !427)
!429 = !DILocation(line: 152, column: 7, scope: !427)
!430 = !DILocation(line: 152, column: 16, scope: !427)
!431 = !DILocation(line: 153, column: 13, scope: !432)
!432 = distinct !DILexicalBlock(scope: !412, file: !320, line: 153, column: 9)
!433 = !DILocation(line: 153, column: 19, scope: !432)
!434 = !DILocation(line: 154, column: 12, scope: !432)
!435 = !DILocation(line: 154, column: 7, scope: !432)
!436 = !DILocation(line: 154, column: 16, scope: !432)
!437 = !DILocation(line: 0, scope: !412)
!438 = distinct !{!438, !408, !439, !107}
!439 = !DILocation(line: 155, column: 3, scope: !397)
!440 = !DILocation(line: 157, column: 3, scope: !397)
!441 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_indcpa_keypair_derand", scope: !320, file: !320, line: 225, type: !442, scopeLine: 227, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !58, retainedNodes: !24)
!442 = !DISubroutineType(types: !443)
!443 = !{null, !6, !6, !234}
!444 = !DILocalVariable(name: "pk", arg: 1, scope: !441, file: !320, line: 225, type: !6)
!445 = !DILocation(line: 0, scope: !441)
!446 = !DILocalVariable(name: "sk", arg: 2, scope: !441, file: !320, line: 226, type: !6)
!447 = !DILocalVariable(name: "coins", arg: 3, scope: !441, file: !320, line: 227, type: !234)
!448 = !DILocalVariable(name: "buf", scope: !441, file: !320, line: 229, type: !255)
!449 = !DILocation(line: 229, column: 11, scope: !441)
!450 = !DILocalVariable(name: "publicseed", scope: !441, file: !320, line: 230, type: !234)
!451 = !DILocation(line: 231, column: 34, scope: !441)
!452 = !DILocalVariable(name: "noiseseed", scope: !441, file: !320, line: 231, type: !234)
!453 = !DILocalVariable(name: "nonce", scope: !441, file: !320, line: 232, type: !7)
!454 = !DILocalVariable(name: "a", scope: !441, file: !320, line: 233, type: !455)
!455 = !DICompositeType(tag: DW_TAG_array_type, baseType: !324, size: 65536, elements: !332)
!456 = !DILocation(line: 233, column: 11, scope: !441)
!457 = !DILocalVariable(name: "e", scope: !441, file: !320, line: 233, type: !324)
!458 = !DILocation(line: 233, column: 23, scope: !441)
!459 = !DILocalVariable(name: "pkpv", scope: !441, file: !320, line: 233, type: !324)
!460 = !DILocation(line: 233, column: 26, scope: !441)
!461 = !DILocalVariable(name: "skpv", scope: !441, file: !320, line: 233, type: !324)
!462 = !DILocation(line: 233, column: 32, scope: !441)
!463 = !DILocation(line: 235, column: 3, scope: !441)
!464 = !DILocation(line: 236, column: 3, scope: !441)
!465 = !DILocation(line: 236, column: 23, scope: !441)
!466 = !DILocation(line: 237, column: 3, scope: !441)
!467 = !DILocation(line: 239, column: 3, scope: !441)
!468 = !DILocalVariable(name: "i", scope: !441, file: !320, line: 228, type: !14)
!469 = !DILocation(line: 241, column: 8, scope: !470)
!470 = distinct !DILexicalBlock(scope: !441, file: !320, line: 241, column: 3)
!471 = !DILocation(line: 241, scope: !470)
!472 = !DILocation(line: 241, column: 17, scope: !473)
!473 = distinct !DILexicalBlock(scope: !470, file: !320, line: 241, column: 3)
!474 = !DILocation(line: 241, column: 3, scope: !470)
!475 = !DILocation(line: 243, column: 3, scope: !476)
!476 = distinct !DILexicalBlock(scope: !441, file: !320, line: 243, column: 3)
!477 = !DILocation(line: 242, column: 25, scope: !473)
!478 = !DILocation(line: 242, column: 5, scope: !473)
!479 = !DILocation(line: 242, column: 50, scope: !473)
!480 = !DILocation(line: 241, column: 29, scope: !473)
!481 = !DILocation(line: 241, column: 3, scope: !473)
!482 = distinct !{!482, !474, !483, !107}
!483 = !DILocation(line: 242, column: 52, scope: !470)
!484 = !DILocation(line: 243, scope: !476)
!485 = !DILocation(line: 243, column: 17, scope: !486)
!486 = distinct !DILexicalBlock(scope: !476, file: !320, line: 243, column: 3)
!487 = !DILocation(line: 244, column: 25, scope: !486)
!488 = !DILocation(line: 244, column: 5, scope: !486)
!489 = !DILocation(line: 244, column: 47, scope: !486)
!490 = !DILocation(line: 243, column: 29, scope: !486)
!491 = !DILocation(line: 243, column: 3, scope: !486)
!492 = distinct !{!492, !475, !493, !107}
!493 = !DILocation(line: 244, column: 49, scope: !476)
!494 = !DILocation(line: 246, column: 3, scope: !441)
!495 = !DILocation(line: 247, column: 3, scope: !441)
!496 = !DILocation(line: 250, column: 8, scope: !497)
!497 = distinct !DILexicalBlock(scope: !441, file: !320, line: 250, column: 3)
!498 = !DILocation(line: 250, scope: !497)
!499 = !DILocation(line: 250, column: 17, scope: !500)
!500 = distinct !DILexicalBlock(scope: !497, file: !320, line: 250, column: 3)
!501 = !DILocation(line: 250, column: 3, scope: !497)
!502 = !DILocation(line: 251, column: 37, scope: !503)
!503 = distinct !DILexicalBlock(scope: !500, file: !320, line: 250, column: 33)
!504 = !DILocation(line: 251, column: 47, scope: !503)
!505 = !DILocation(line: 251, column: 5, scope: !503)
!506 = !DILocation(line: 252, column: 18, scope: !503)
!507 = !DILocation(line: 252, column: 5, scope: !503)
!508 = !DILocation(line: 250, column: 29, scope: !500)
!509 = !DILocation(line: 250, column: 3, scope: !500)
!510 = distinct !{!510, !501, !511, !107}
!511 = !DILocation(line: 253, column: 3, scope: !497)
!512 = !DILocation(line: 255, column: 3, scope: !441)
!513 = !DILocation(line: 256, column: 3, scope: !441)
!514 = !DILocation(line: 258, column: 3, scope: !441)
!515 = !DILocation(line: 259, column: 3, scope: !441)
!516 = !DILocation(line: 266, column: 1, scope: !441)
!517 = distinct !DISubprogram(name: "pack_sk", scope: !320, file: !320, line: 61, type: !518, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !58, retainedNodes: !24)
!518 = !DISubroutineType(types: !519)
!519 = !{null, !6, !323}
!520 = !DILocalVariable(name: "r", arg: 1, scope: !517, file: !320, line: 61, type: !6)
!521 = !DILocation(line: 0, scope: !517)
!522 = !DILocalVariable(name: "sk", arg: 2, scope: !517, file: !320, line: 61, type: !323)
!523 = !DILocation(line: 62, column: 3, scope: !517)
!524 = !DILocation(line: 65, column: 1, scope: !517)
!525 = distinct !DISubprogram(name: "pack_pk", scope: !320, file: !320, line: 24, type: !526, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !58, retainedNodes: !24)
!526 = !DISubroutineType(types: !527)
!527 = !{null, !6, !323, !234}
!528 = !DILocalVariable(name: "r", arg: 1, scope: !525, file: !320, line: 24, type: !6)
!529 = !DILocation(line: 0, scope: !525)
!530 = !DILocalVariable(name: "pk", arg: 2, scope: !525, file: !320, line: 24, type: !323)
!531 = !DILocalVariable(name: "seed", arg: 3, scope: !525, file: !320, line: 25, type: !234)
!532 = !DILocation(line: 26, column: 3, scope: !525)
!533 = !DILocation(line: 27, column: 12, scope: !525)
!534 = !DILocation(line: 27, column: 3, scope: !525)
!535 = !DILocation(line: 30, column: 1, scope: !525)
!536 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_indcpa_enc", scope: !320, file: !320, line: 283, type: !537, scopeLine: 286, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !58, retainedNodes: !24)
!537 = !DISubroutineType(types: !538)
!538 = !{null, !6, !234, !234, !234}
!539 = !DILocalVariable(name: "c", arg: 1, scope: !536, file: !320, line: 283, type: !6)
!540 = !DILocation(line: 0, scope: !536)
!541 = !DILocalVariable(name: "m", arg: 2, scope: !536, file: !320, line: 284, type: !234)
!542 = !DILocalVariable(name: "pk", arg: 3, scope: !536, file: !320, line: 285, type: !234)
!543 = !DILocalVariable(name: "coins", arg: 4, scope: !536, file: !320, line: 286, type: !234)
!544 = !DILocalVariable(name: "seed", scope: !536, file: !320, line: 288, type: !123)
!545 = !DILocation(line: 288, column: 11, scope: !536)
!546 = !DILocalVariable(name: "nonce", scope: !536, file: !320, line: 289, type: !7)
!547 = !DILocalVariable(name: "sp", scope: !536, file: !320, line: 290, type: !324)
!548 = !DILocation(line: 290, column: 11, scope: !536)
!549 = !DILocalVariable(name: "pkpv", scope: !536, file: !320, line: 290, type: !324)
!550 = !DILocation(line: 290, column: 15, scope: !536)
!551 = !DILocalVariable(name: "ep", scope: !536, file: !320, line: 290, type: !324)
!552 = !DILocation(line: 290, column: 21, scope: !536)
!553 = !DILocalVariable(name: "at", scope: !536, file: !320, line: 290, type: !455)
!554 = !DILocation(line: 290, column: 25, scope: !536)
!555 = !DILocalVariable(name: "b", scope: !536, file: !320, line: 290, type: !324)
!556 = !DILocation(line: 290, column: 38, scope: !536)
!557 = !DILocalVariable(name: "v", scope: !536, file: !320, line: 291, type: !327)
!558 = !DILocation(line: 291, column: 8, scope: !536)
!559 = !DILocalVariable(name: "k", scope: !536, file: !320, line: 291, type: !327)
!560 = !DILocation(line: 291, column: 11, scope: !536)
!561 = !DILocalVariable(name: "epp", scope: !536, file: !320, line: 291, type: !327)
!562 = !DILocation(line: 291, column: 14, scope: !536)
!563 = !DILocation(line: 293, column: 3, scope: !536)
!564 = !DILocation(line: 294, column: 3, scope: !536)
!565 = !DILocation(line: 295, column: 3, scope: !536)
!566 = !DILocalVariable(name: "i", scope: !536, file: !320, line: 287, type: !14)
!567 = !DILocation(line: 297, column: 8, scope: !568)
!568 = distinct !DILexicalBlock(scope: !536, file: !320, line: 297, column: 3)
!569 = !DILocation(line: 297, scope: !568)
!570 = !DILocation(line: 297, column: 17, scope: !571)
!571 = distinct !DILexicalBlock(scope: !568, file: !320, line: 297, column: 3)
!572 = !DILocation(line: 297, column: 3, scope: !568)
!573 = !DILocation(line: 299, column: 3, scope: !574)
!574 = distinct !DILexicalBlock(scope: !536, file: !320, line: 299, column: 3)
!575 = !DILocation(line: 298, column: 27, scope: !571)
!576 = !DILocation(line: 298, column: 5, scope: !571)
!577 = !DILocation(line: 298, column: 44, scope: !571)
!578 = !DILocation(line: 297, column: 29, scope: !571)
!579 = !DILocation(line: 297, column: 3, scope: !571)
!580 = distinct !{!580, !572, !581, !107}
!581 = !DILocation(line: 298, column: 46, scope: !568)
!582 = !DILocation(line: 299, scope: !574)
!583 = !DILocation(line: 299, column: 17, scope: !584)
!584 = distinct !DILexicalBlock(scope: !574, file: !320, line: 299, column: 3)
!585 = !DILocation(line: 300, column: 27, scope: !584)
!586 = !DILocation(line: 300, column: 5, scope: !584)
!587 = !DILocation(line: 300, column: 44, scope: !584)
!588 = !DILocation(line: 299, column: 29, scope: !584)
!589 = !DILocation(line: 299, column: 3, scope: !584)
!590 = distinct !{!590, !573, !591, !107}
!591 = !DILocation(line: 300, column: 46, scope: !574)
!592 = !DILocation(line: 301, column: 3, scope: !536)
!593 = !DILocation(line: 303, column: 3, scope: !536)
!594 = !DILocation(line: 306, column: 8, scope: !595)
!595 = distinct !DILexicalBlock(scope: !536, file: !320, line: 306, column: 3)
!596 = !DILocation(line: 306, scope: !595)
!597 = !DILocation(line: 306, column: 17, scope: !598)
!598 = distinct !DILexicalBlock(scope: !595, file: !320, line: 306, column: 3)
!599 = !DILocation(line: 306, column: 3, scope: !595)
!600 = !DILocation(line: 307, column: 37, scope: !598)
!601 = !DILocation(line: 307, column: 44, scope: !598)
!602 = !DILocation(line: 307, column: 5, scope: !598)
!603 = !DILocation(line: 306, column: 29, scope: !598)
!604 = !DILocation(line: 306, column: 3, scope: !598)
!605 = distinct !{!605, !599, !606, !107}
!606 = !DILocation(line: 307, column: 54, scope: !595)
!607 = !DILocation(line: 309, column: 3, scope: !536)
!608 = !DILocation(line: 311, column: 3, scope: !536)
!609 = !DILocation(line: 312, column: 3, scope: !536)
!610 = !DILocation(line: 314, column: 3, scope: !536)
!611 = !DILocation(line: 315, column: 3, scope: !536)
!612 = !DILocation(line: 316, column: 3, scope: !536)
!613 = !DILocation(line: 317, column: 3, scope: !536)
!614 = !DILocation(line: 318, column: 3, scope: !536)
!615 = !DILocation(line: 320, column: 3, scope: !536)
!616 = !DILocation(line: 323, column: 1, scope: !536)
!617 = distinct !DISubprogram(name: "unpack_pk", scope: !320, file: !320, line: 43, type: !618, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !58, retainedNodes: !24)
!618 = !DISubroutineType(types: !619)
!619 = !{null, !323, !6, !234}
!620 = !DILocalVariable(name: "pk", arg: 1, scope: !617, file: !320, line: 43, type: !323)
!621 = !DILocation(line: 0, scope: !617)
!622 = !DILocalVariable(name: "seed", arg: 2, scope: !617, file: !320, line: 43, type: !6)
!623 = !DILocalVariable(name: "packedpk", arg: 3, scope: !617, file: !320, line: 44, type: !234)
!624 = !DILocation(line: 45, column: 3, scope: !617)
!625 = !DILocation(line: 46, column: 25, scope: !617)
!626 = !DILocation(line: 46, column: 3, scope: !617)
!627 = !DILocation(line: 50, column: 1, scope: !617)
!628 = distinct !DISubprogram(name: "pack_ciphertext", scope: !320, file: !320, line: 95, type: !629, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !58, retainedNodes: !24)
!629 = !DISubroutineType(types: !630)
!630 = !{null, !6, !323, !631}
!631 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !327, size: 32)
!632 = !DILocalVariable(name: "r", arg: 1, scope: !628, file: !320, line: 95, type: !6)
!633 = !DILocation(line: 0, scope: !628)
!634 = !DILocalVariable(name: "b", arg: 2, scope: !628, file: !320, line: 95, type: !323)
!635 = !DILocalVariable(name: "v", arg: 3, scope: !628, file: !320, line: 96, type: !631)
!636 = !DILocation(line: 97, column: 3, scope: !628)
!637 = !DILocation(line: 98, column: 19, scope: !628)
!638 = !DILocation(line: 98, column: 3, scope: !628)
!639 = !DILocation(line: 102, column: 1, scope: !628)
!640 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_indcpa_dec", scope: !320, file: !320, line: 338, type: !641, scopeLine: 340, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !58, retainedNodes: !24)
!641 = !DISubroutineType(types: !642)
!642 = !{null, !6, !234, !234}
!643 = !DILocalVariable(name: "m", arg: 1, scope: !640, file: !320, line: 338, type: !6)
!644 = !DILocation(line: 0, scope: !640)
!645 = !DILocalVariable(name: "c", arg: 2, scope: !640, file: !320, line: 339, type: !234)
!646 = !DILocalVariable(name: "sk", arg: 3, scope: !640, file: !320, line: 340, type: !234)
!647 = !DILocalVariable(name: "b", scope: !640, file: !320, line: 341, type: !324)
!648 = !DILocation(line: 341, column: 11, scope: !640)
!649 = !DILocalVariable(name: "skpv", scope: !640, file: !320, line: 341, type: !324)
!650 = !DILocation(line: 341, column: 14, scope: !640)
!651 = !DILocalVariable(name: "v", scope: !640, file: !320, line: 342, type: !327)
!652 = !DILocation(line: 342, column: 8, scope: !640)
!653 = !DILocalVariable(name: "mp", scope: !640, file: !320, line: 342, type: !327)
!654 = !DILocation(line: 342, column: 11, scope: !640)
!655 = !DILocation(line: 344, column: 3, scope: !640)
!656 = !DILocation(line: 345, column: 3, scope: !640)
!657 = !DILocation(line: 347, column: 3, scope: !640)
!658 = !DILocation(line: 348, column: 3, scope: !640)
!659 = !DILocation(line: 349, column: 3, scope: !640)
!660 = !DILocation(line: 351, column: 3, scope: !640)
!661 = !DILocation(line: 352, column: 3, scope: !640)
!662 = !DILocation(line: 354, column: 3, scope: !640)
!663 = !DILocation(line: 357, column: 1, scope: !640)
!664 = distinct !DISubprogram(name: "unpack_ciphertext", scope: !320, file: !320, line: 114, type: !665, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !58, retainedNodes: !24)
!665 = !DISubroutineType(types: !666)
!666 = !{null, !323, !631, !234}
!667 = !DILocalVariable(name: "b", arg: 1, scope: !664, file: !320, line: 114, type: !323)
!668 = !DILocation(line: 0, scope: !664)
!669 = !DILocalVariable(name: "v", arg: 2, scope: !664, file: !320, line: 114, type: !631)
!670 = !DILocalVariable(name: "c", arg: 3, scope: !664, file: !320, line: 115, type: !234)
!671 = !DILocation(line: 116, column: 3, scope: !664)
!672 = !DILocation(line: 117, column: 24, scope: !664)
!673 = !DILocation(line: 117, column: 3, scope: !664)
!674 = !DILocation(line: 123, column: 1, scope: !664)
!675 = distinct !DISubprogram(name: "unpack_sk", scope: !320, file: !320, line: 77, type: !676, scopeLine: 78, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !58, retainedNodes: !24)
!676 = !DISubroutineType(types: !677)
!677 = !{null, !323, !234}
!678 = !DILocalVariable(name: "sk", arg: 1, scope: !675, file: !320, line: 77, type: !323)
!679 = !DILocation(line: 0, scope: !675)
!680 = !DILocalVariable(name: "packedsk", arg: 2, scope: !675, file: !320, line: 78, type: !234)
!681 = !DILocation(line: 79, column: 3, scope: !675)
!682 = !DILocation(line: 82, column: 1, scope: !675)
!683 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_compress", scope: !684, file: !684, line: 16, type: !685, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!684 = !DIFile(filename: "../../../ref/polyvec.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!685 = !DISubroutineType(types: !686)
!686 = !{null, !6, !687}
!687 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !688, size: 32)
!688 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !324)
!689 = !DILocalVariable(name: "r", arg: 1, scope: !683, file: !684, line: 16, type: !6)
!690 = !DILocation(line: 0, scope: !683)
!691 = !DILocalVariable(name: "a", arg: 2, scope: !683, file: !684, line: 17, type: !687)
!692 = !DILocalVariable(name: "t", scope: !683, file: !684, line: 22, type: !693)
!693 = !DICompositeType(tag: DW_TAG_array_type, baseType: !60, size: 128, elements: !694)
!694 = !{!695}
!695 = !DISubrange(count: 8)
!696 = !DILocation(line: 22, column: 12, scope: !683)
!697 = !DILocalVariable(name: "i", scope: !683, file: !684, line: 18, type: !14)
!698 = !DILocation(line: 23, column: 8, scope: !699)
!699 = distinct !DILexicalBlock(scope: !683, file: !684, line: 23, column: 3)
!700 = !DILocation(line: 23, scope: !699)
!701 = !DILocation(line: 23, column: 17, scope: !702)
!702 = distinct !DILexicalBlock(scope: !699, file: !684, line: 23, column: 3)
!703 = !DILocation(line: 23, column: 3, scope: !699)
!704 = !DILocation(line: 24, column: 5, scope: !705)
!705 = distinct !DILexicalBlock(scope: !706, file: !684, line: 24, column: 5)
!706 = distinct !DILexicalBlock(scope: !702, file: !684, line: 23, column: 33)
!707 = !DILocation(line: 24, scope: !705)
!708 = !DILocalVariable(name: "j", scope: !683, file: !684, line: 18, type: !14)
!709 = !DILocation(line: 24, column: 19, scope: !710)
!710 = distinct !DILexicalBlock(scope: !705, file: !684, line: 24, column: 5)
!711 = !DILocation(line: 25, column: 7, scope: !712)
!712 = distinct !DILexicalBlock(scope: !713, file: !684, line: 25, column: 7)
!713 = distinct !DILexicalBlock(scope: !710, file: !684, line: 24, column: 39)
!714 = !DILocation(line: 25, scope: !712)
!715 = !DILocalVariable(name: "k", scope: !683, file: !684, line: 18, type: !14)
!716 = !DILocation(line: 25, column: 21, scope: !717)
!717 = distinct !DILexicalBlock(scope: !712, file: !684, line: 25, column: 7)
!718 = !DILocation(line: 26, column: 26, scope: !719)
!719 = distinct !DILexicalBlock(scope: !717, file: !684, line: 25, column: 31)
!720 = !DILocation(line: 26, column: 30, scope: !719)
!721 = !DILocation(line: 26, column: 16, scope: !719)
!722 = !DILocation(line: 27, column: 39, scope: !719)
!723 = !DILocation(line: 27, column: 9, scope: !719)
!724 = !DILocation(line: 27, column: 14, scope: !719)
!725 = !DILocation(line: 30, column: 14, scope: !719)
!726 = !DILocalVariable(name: "d0", scope: !683, file: !684, line: 19, type: !45)
!727 = !DILocation(line: 33, column: 12, scope: !719)
!728 = !DILocation(line: 34, column: 12, scope: !719)
!729 = !DILocation(line: 35, column: 16, scope: !719)
!730 = !DILocation(line: 35, column: 9, scope: !719)
!731 = !DILocation(line: 35, column: 14, scope: !719)
!732 = !DILocation(line: 25, column: 27, scope: !717)
!733 = !DILocation(line: 25, column: 7, scope: !717)
!734 = distinct !{!734, !711, !735, !107}
!735 = !DILocation(line: 36, column: 7, scope: !712)
!736 = !DILocation(line: 38, column: 15, scope: !713)
!737 = !DILocation(line: 38, column: 14, scope: !713)
!738 = !DILocation(line: 38, column: 12, scope: !713)
!739 = !DILocation(line: 39, column: 15, scope: !713)
!740 = !DILocation(line: 39, column: 20, scope: !713)
!741 = !DILocation(line: 39, column: 29, scope: !713)
!742 = !DILocation(line: 39, column: 34, scope: !713)
!743 = !DILocation(line: 39, column: 26, scope: !713)
!744 = !DILocation(line: 39, column: 7, scope: !713)
!745 = !DILocation(line: 39, column: 12, scope: !713)
!746 = !DILocation(line: 40, column: 15, scope: !713)
!747 = !DILocation(line: 40, column: 20, scope: !713)
!748 = !DILocation(line: 40, column: 29, scope: !713)
!749 = !DILocation(line: 40, column: 34, scope: !713)
!750 = !DILocation(line: 40, column: 26, scope: !713)
!751 = !DILocation(line: 40, column: 7, scope: !713)
!752 = !DILocation(line: 40, column: 12, scope: !713)
!753 = !DILocation(line: 41, column: 15, scope: !713)
!754 = !DILocation(line: 41, column: 20, scope: !713)
!755 = !DILocation(line: 41, column: 14, scope: !713)
!756 = !DILocation(line: 41, column: 7, scope: !713)
!757 = !DILocation(line: 41, column: 12, scope: !713)
!758 = !DILocation(line: 42, column: 15, scope: !713)
!759 = !DILocation(line: 42, column: 20, scope: !713)
!760 = !DILocation(line: 42, column: 30, scope: !713)
!761 = !DILocation(line: 42, column: 35, scope: !713)
!762 = !DILocation(line: 42, column: 27, scope: !713)
!763 = !DILocation(line: 42, column: 7, scope: !713)
!764 = !DILocation(line: 42, column: 12, scope: !713)
!765 = !DILocation(line: 43, column: 15, scope: !713)
!766 = !DILocation(line: 43, column: 20, scope: !713)
!767 = !DILocation(line: 43, column: 29, scope: !713)
!768 = !DILocation(line: 43, column: 34, scope: !713)
!769 = !DILocation(line: 43, column: 26, scope: !713)
!770 = !DILocation(line: 43, column: 7, scope: !713)
!771 = !DILocation(line: 43, column: 12, scope: !713)
!772 = !DILocation(line: 44, column: 15, scope: !713)
!773 = !DILocation(line: 44, column: 20, scope: !713)
!774 = !DILocation(line: 44, column: 29, scope: !713)
!775 = !DILocation(line: 44, column: 34, scope: !713)
!776 = !DILocation(line: 44, column: 26, scope: !713)
!777 = !DILocation(line: 44, column: 7, scope: !713)
!778 = !DILocation(line: 44, column: 12, scope: !713)
!779 = !DILocation(line: 45, column: 15, scope: !713)
!780 = !DILocation(line: 45, column: 20, scope: !713)
!781 = !DILocation(line: 45, column: 14, scope: !713)
!782 = !DILocation(line: 45, column: 7, scope: !713)
!783 = !DILocation(line: 45, column: 12, scope: !713)
!784 = !DILocation(line: 46, column: 15, scope: !713)
!785 = !DILocation(line: 46, column: 20, scope: !713)
!786 = !DILocation(line: 46, column: 29, scope: !713)
!787 = !DILocation(line: 46, column: 34, scope: !713)
!788 = !DILocation(line: 46, column: 26, scope: !713)
!789 = !DILocation(line: 46, column: 7, scope: !713)
!790 = !DILocation(line: 46, column: 12, scope: !713)
!791 = !DILocation(line: 47, column: 15, scope: !713)
!792 = !DILocation(line: 47, column: 20, scope: !713)
!793 = !DILocation(line: 47, column: 29, scope: !713)
!794 = !DILocation(line: 47, column: 34, scope: !713)
!795 = !DILocation(line: 47, column: 26, scope: !713)
!796 = !DILocation(line: 47, column: 7, scope: !713)
!797 = !DILocation(line: 47, column: 12, scope: !713)
!798 = !DILocation(line: 48, column: 16, scope: !713)
!799 = !DILocation(line: 48, column: 21, scope: !713)
!800 = !DILocation(line: 48, column: 15, scope: !713)
!801 = !DILocation(line: 48, column: 7, scope: !713)
!802 = !DILocation(line: 48, column: 13, scope: !713)
!803 = !DILocation(line: 49, column: 9, scope: !713)
!804 = !DILocation(line: 24, column: 35, scope: !710)
!805 = !DILocation(line: 24, column: 5, scope: !710)
!806 = distinct !{!806, !704, !807, !107}
!807 = !DILocation(line: 50, column: 5, scope: !705)
!808 = !DILocation(line: 23, column: 29, scope: !702)
!809 = !DILocation(line: 23, column: 3, scope: !702)
!810 = distinct !{!810, !703, !811, !107}
!811 = !DILocation(line: 51, column: 3, scope: !699)
!812 = !DILocation(line: 83, column: 1, scope: !683)
!813 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_decompress", scope: !684, file: !684, line: 95, type: !676, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!814 = !DILocalVariable(name: "r", arg: 1, scope: !813, file: !684, line: 95, type: !323)
!815 = !DILocation(line: 0, scope: !813)
!816 = !DILocalVariable(name: "a", arg: 2, scope: !813, file: !684, line: 96, type: !234)
!817 = !DILocalVariable(name: "t", scope: !813, file: !684, line: 100, type: !693)
!818 = !DILocation(line: 100, column: 12, scope: !813)
!819 = !DILocalVariable(name: "i", scope: !813, file: !684, line: 97, type: !14)
!820 = !DILocation(line: 101, column: 8, scope: !821)
!821 = distinct !DILexicalBlock(scope: !813, file: !684, line: 101, column: 3)
!822 = !DILocation(line: 101, scope: !821)
!823 = !DILocation(line: 101, column: 17, scope: !824)
!824 = distinct !DILexicalBlock(scope: !821, file: !684, line: 101, column: 3)
!825 = !DILocation(line: 101, column: 3, scope: !821)
!826 = !DILocation(line: 102, column: 5, scope: !827)
!827 = distinct !DILexicalBlock(scope: !828, file: !684, line: 102, column: 5)
!828 = distinct !DILexicalBlock(scope: !824, file: !684, line: 101, column: 33)
!829 = !DILocation(line: 102, scope: !827)
!830 = !DILocalVariable(name: "j", scope: !813, file: !684, line: 97, type: !14)
!831 = !DILocation(line: 102, column: 19, scope: !832)
!832 = distinct !DILexicalBlock(scope: !827, file: !684, line: 102, column: 5)
!833 = !DILocation(line: 103, column: 15, scope: !834)
!834 = distinct !DILexicalBlock(scope: !832, file: !684, line: 102, column: 39)
!835 = !DILocation(line: 103, column: 39, scope: !834)
!836 = !DILocation(line: 103, column: 29, scope: !834)
!837 = !DILocation(line: 103, column: 44, scope: !834)
!838 = !DILocation(line: 103, column: 26, scope: !834)
!839 = !DILocation(line: 103, column: 12, scope: !834)
!840 = !DILocation(line: 104, column: 15, scope: !834)
!841 = !DILocation(line: 104, column: 20, scope: !834)
!842 = !DILocation(line: 104, column: 39, scope: !834)
!843 = !DILocation(line: 104, column: 29, scope: !834)
!844 = !DILocation(line: 104, column: 44, scope: !834)
!845 = !DILocation(line: 104, column: 26, scope: !834)
!846 = !DILocation(line: 104, column: 7, scope: !834)
!847 = !DILocation(line: 104, column: 12, scope: !834)
!848 = !DILocation(line: 105, column: 15, scope: !834)
!849 = !DILocation(line: 105, column: 20, scope: !834)
!850 = !DILocation(line: 105, column: 39, scope: !834)
!851 = !DILocation(line: 105, column: 29, scope: !834)
!852 = !DILocation(line: 105, column: 44, scope: !834)
!853 = !DILocation(line: 105, column: 26, scope: !834)
!854 = !DILocation(line: 105, column: 63, scope: !834)
!855 = !DILocation(line: 105, column: 53, scope: !834)
!856 = !DILocation(line: 105, column: 68, scope: !834)
!857 = !DILocation(line: 105, column: 50, scope: !834)
!858 = !DILocation(line: 105, column: 7, scope: !834)
!859 = !DILocation(line: 105, column: 12, scope: !834)
!860 = !DILocation(line: 106, column: 15, scope: !834)
!861 = !DILocation(line: 106, column: 20, scope: !834)
!862 = !DILocation(line: 106, column: 39, scope: !834)
!863 = !DILocation(line: 106, column: 29, scope: !834)
!864 = !DILocation(line: 106, column: 44, scope: !834)
!865 = !DILocation(line: 106, column: 26, scope: !834)
!866 = !DILocation(line: 106, column: 7, scope: !834)
!867 = !DILocation(line: 106, column: 12, scope: !834)
!868 = !DILocation(line: 107, column: 15, scope: !834)
!869 = !DILocation(line: 107, column: 20, scope: !834)
!870 = !DILocation(line: 107, column: 39, scope: !834)
!871 = !DILocation(line: 107, column: 29, scope: !834)
!872 = !DILocation(line: 107, column: 44, scope: !834)
!873 = !DILocation(line: 107, column: 26, scope: !834)
!874 = !DILocation(line: 107, column: 7, scope: !834)
!875 = !DILocation(line: 107, column: 12, scope: !834)
!876 = !DILocation(line: 108, column: 15, scope: !834)
!877 = !DILocation(line: 108, column: 20, scope: !834)
!878 = !DILocation(line: 108, column: 39, scope: !834)
!879 = !DILocation(line: 108, column: 29, scope: !834)
!880 = !DILocation(line: 108, column: 44, scope: !834)
!881 = !DILocation(line: 108, column: 26, scope: !834)
!882 = !DILocation(line: 108, column: 63, scope: !834)
!883 = !DILocation(line: 108, column: 53, scope: !834)
!884 = !DILocation(line: 108, column: 68, scope: !834)
!885 = !DILocation(line: 108, column: 50, scope: !834)
!886 = !DILocation(line: 108, column: 7, scope: !834)
!887 = !DILocation(line: 108, column: 12, scope: !834)
!888 = !DILocation(line: 109, column: 15, scope: !834)
!889 = !DILocation(line: 109, column: 20, scope: !834)
!890 = !DILocation(line: 109, column: 39, scope: !834)
!891 = !DILocation(line: 109, column: 29, scope: !834)
!892 = !DILocation(line: 109, column: 44, scope: !834)
!893 = !DILocation(line: 109, column: 26, scope: !834)
!894 = !DILocation(line: 109, column: 7, scope: !834)
!895 = !DILocation(line: 109, column: 12, scope: !834)
!896 = !DILocation(line: 110, column: 15, scope: !834)
!897 = !DILocation(line: 110, column: 20, scope: !834)
!898 = !DILocation(line: 110, column: 39, scope: !834)
!899 = !DILocation(line: 110, column: 29, scope: !834)
!900 = !DILocation(line: 110, column: 45, scope: !834)
!901 = !DILocation(line: 110, column: 26, scope: !834)
!902 = !DILocation(line: 110, column: 7, scope: !834)
!903 = !DILocation(line: 110, column: 12, scope: !834)
!904 = !DILocalVariable(name: "k", scope: !813, file: !684, line: 97, type: !14)
!905 = !DILocation(line: 113, column: 12, scope: !906)
!906 = distinct !DILexicalBlock(scope: !834, file: !684, line: 113, column: 7)
!907 = !DILocation(line: 113, scope: !906)
!908 = !DILocation(line: 113, column: 21, scope: !909)
!909 = distinct !DILexicalBlock(scope: !906, file: !684, line: 113, column: 7)
!910 = !DILocation(line: 113, column: 7, scope: !906)
!911 = !DILocation(line: 114, column: 42, scope: !909)
!912 = !DILocation(line: 114, column: 47, scope: !909)
!913 = !DILocation(line: 114, column: 56, scope: !909)
!914 = !DILocation(line: 114, column: 66, scope: !909)
!915 = !DILocation(line: 114, column: 74, scope: !909)
!916 = !DILocation(line: 114, column: 30, scope: !909)
!917 = !DILocation(line: 114, column: 19, scope: !909)
!918 = !DILocation(line: 114, column: 23, scope: !909)
!919 = !DILocation(line: 114, column: 9, scope: !909)
!920 = !DILocation(line: 114, column: 28, scope: !909)
!921 = !DILocation(line: 113, column: 27, scope: !909)
!922 = !DILocation(line: 113, column: 7, scope: !909)
!923 = distinct !{!923, !910, !924, !107}
!924 = !DILocation(line: 114, column: 77, scope: !906)
!925 = !DILocation(line: 111, column: 9, scope: !834)
!926 = !DILocation(line: 102, column: 35, scope: !832)
!927 = !DILocation(line: 102, column: 5, scope: !832)
!928 = distinct !{!928, !826, !929, !107}
!929 = !DILocation(line: 115, column: 5, scope: !827)
!930 = !DILocation(line: 101, column: 29, scope: !824)
!931 = !DILocation(line: 101, column: 3, scope: !824)
!932 = distinct !{!932, !825, !933, !107}
!933 = !DILocation(line: 116, column: 3, scope: !821)
!934 = !DILocation(line: 137, column: 1, scope: !813)
!935 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_tobytes", scope: !684, file: !684, line: 148, type: !685, scopeLine: 148, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!936 = !DILocalVariable(name: "r", arg: 1, scope: !935, file: !684, line: 148, type: !6)
!937 = !DILocation(line: 0, scope: !935)
!938 = !DILocalVariable(name: "a", arg: 2, scope: !935, file: !684, line: 148, type: !687)
!939 = !DILocalVariable(name: "i", scope: !935, file: !684, line: 149, type: !14)
!940 = !DILocation(line: 150, column: 8, scope: !941)
!941 = distinct !DILexicalBlock(scope: !935, file: !684, line: 150, column: 3)
!942 = !DILocation(line: 150, scope: !941)
!943 = !DILocation(line: 150, column: 17, scope: !944)
!944 = distinct !DILexicalBlock(scope: !941, file: !684, line: 150, column: 3)
!945 = !DILocation(line: 150, column: 3, scope: !941)
!946 = !DILocation(line: 151, column: 24, scope: !944)
!947 = !DILocation(line: 151, column: 20, scope: !944)
!948 = !DILocation(line: 151, column: 44, scope: !944)
!949 = !DILocation(line: 151, column: 5, scope: !944)
!950 = !DILocation(line: 150, column: 29, scope: !944)
!951 = !DILocation(line: 150, column: 3, scope: !944)
!952 = distinct !{!952, !945, !953, !107}
!953 = !DILocation(line: 151, column: 51, scope: !941)
!954 = !DILocation(line: 154, column: 1, scope: !935)
!955 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_frombytes", scope: !684, file: !684, line: 166, type: !676, scopeLine: 166, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!956 = !DILocalVariable(name: "r", arg: 1, scope: !955, file: !684, line: 166, type: !323)
!957 = !DILocation(line: 0, scope: !955)
!958 = !DILocalVariable(name: "a", arg: 2, scope: !955, file: !684, line: 166, type: !234)
!959 = !DILocalVariable(name: "i", scope: !955, file: !684, line: 167, type: !14)
!960 = !DILocation(line: 168, column: 8, scope: !961)
!961 = distinct !DILexicalBlock(scope: !955, file: !684, line: 168, column: 3)
!962 = !DILocation(line: 168, scope: !961)
!963 = !DILocation(line: 168, column: 17, scope: !964)
!964 = distinct !DILexicalBlock(scope: !961, file: !684, line: 168, column: 3)
!965 = !DILocation(line: 168, column: 3, scope: !961)
!966 = !DILocation(line: 169, column: 21, scope: !964)
!967 = !DILocation(line: 169, column: 36, scope: !964)
!968 = !DILocation(line: 169, column: 32, scope: !964)
!969 = !DILocation(line: 169, column: 5, scope: !964)
!970 = !DILocation(line: 168, column: 29, scope: !964)
!971 = !DILocation(line: 168, column: 3, scope: !964)
!972 = distinct !{!972, !965, !973, !107}
!973 = !DILocation(line: 169, column: 53, scope: !961)
!974 = !DILocation(line: 173, column: 1, scope: !955)
!975 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_ntt", scope: !684, file: !684, line: 182, type: !976, scopeLine: 182, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!976 = !DISubroutineType(types: !977)
!977 = !{null, !323}
!978 = !DILocalVariable(name: "r", arg: 1, scope: !975, file: !684, line: 182, type: !323)
!979 = !DILocation(line: 0, scope: !975)
!980 = !DILocalVariable(name: "i", scope: !975, file: !684, line: 183, type: !14)
!981 = !DILocation(line: 191, column: 27, scope: !982)
!982 = distinct !DILexicalBlock(scope: !975, file: !684, line: 191, column: 22)
!983 = !DILocation(line: 191, scope: !982)
!984 = !DILocation(line: 191, column: 36, scope: !985)
!985 = distinct !DILexicalBlock(scope: !982, file: !684, line: 191, column: 22)
!986 = !DILocation(line: 191, column: 22, scope: !982)
!987 = !DILocation(line: 192, column: 34, scope: !985)
!988 = !DILocation(line: 192, column: 24, scope: !985)
!989 = !DILocation(line: 191, column: 48, scope: !985)
!990 = !DILocation(line: 191, column: 22, scope: !985)
!991 = distinct !{!991, !986, !992, !107}
!992 = !DILocation(line: 192, column: 41, scope: !982)
!993 = !DILocation(line: 195, column: 1, scope: !975)
!994 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_invntt_tomont", scope: !684, file: !684, line: 205, type: !976, scopeLine: 205, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!995 = !DILocalVariable(name: "r", arg: 1, scope: !994, file: !684, line: 205, type: !323)
!996 = !DILocation(line: 0, scope: !994)
!997 = !DILocalVariable(name: "i", scope: !994, file: !684, line: 206, type: !14)
!998 = !DILocation(line: 207, column: 8, scope: !999)
!999 = distinct !DILexicalBlock(scope: !994, file: !684, line: 207, column: 3)
!1000 = !DILocation(line: 207, scope: !999)
!1001 = !DILocation(line: 207, column: 17, scope: !1002)
!1002 = distinct !DILexicalBlock(scope: !999, file: !684, line: 207, column: 3)
!1003 = !DILocation(line: 207, column: 3, scope: !999)
!1004 = !DILocation(line: 208, column: 25, scope: !1002)
!1005 = !DILocation(line: 208, column: 5, scope: !1002)
!1006 = !DILocation(line: 207, column: 29, scope: !1002)
!1007 = !DILocation(line: 207, column: 3, scope: !1002)
!1008 = distinct !{!1008, !1003, !1009, !107}
!1009 = !DILocation(line: 208, column: 32, scope: !999)
!1010 = !DILocation(line: 212, column: 1, scope: !994)
!1011 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery", scope: !684, file: !684, line: 224, type: !1012, scopeLine: 225, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!1012 = !DISubroutineType(types: !1013)
!1013 = !{null, !631, !687, !687}
!1014 = !DILocalVariable(name: "r", arg: 1, scope: !1011, file: !684, line: 224, type: !631)
!1015 = !DILocation(line: 0, scope: !1011)
!1016 = !DILocalVariable(name: "a", arg: 2, scope: !1011, file: !684, line: 224, type: !687)
!1017 = !DILocalVariable(name: "b", arg: 3, scope: !1011, file: !684, line: 225, type: !687)
!1018 = !DILocalVariable(name: "t", scope: !1011, file: !684, line: 227, type: !327)
!1019 = !DILocation(line: 227, column: 8, scope: !1011)
!1020 = !DILocation(line: 229, column: 3, scope: !1011)
!1021 = !DILocalVariable(name: "i", scope: !1011, file: !684, line: 226, type: !14)
!1022 = !DILocation(line: 230, column: 8, scope: !1023)
!1023 = distinct !DILexicalBlock(scope: !1011, file: !684, line: 230, column: 3)
!1024 = !DILocation(line: 230, scope: !1023)
!1025 = !DILocation(line: 230, column: 17, scope: !1026)
!1026 = distinct !DILexicalBlock(scope: !1023, file: !684, line: 230, column: 3)
!1027 = !DILocation(line: 230, column: 3, scope: !1023)
!1028 = !DILocation(line: 231, column: 34, scope: !1029)
!1029 = distinct !DILexicalBlock(scope: !1026, file: !684, line: 230, column: 33)
!1030 = !DILocation(line: 231, column: 44, scope: !1029)
!1031 = !DILocation(line: 231, column: 5, scope: !1029)
!1032 = !DILocation(line: 232, column: 5, scope: !1029)
!1033 = !DILocation(line: 230, column: 29, scope: !1026)
!1034 = !DILocation(line: 230, column: 3, scope: !1026)
!1035 = distinct !{!1035, !1027, !1036, !107}
!1036 = !DILocation(line: 233, column: 3, scope: !1023)
!1037 = !DILocation(line: 235, column: 3, scope: !1011)
!1038 = !DILocation(line: 240, column: 1, scope: !1011)
!1039 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_reduce", scope: !684, file: !684, line: 251, type: !976, scopeLine: 251, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!1040 = !DILocalVariable(name: "r", arg: 1, scope: !1039, file: !684, line: 251, type: !323)
!1041 = !DILocation(line: 0, scope: !1039)
!1042 = !DILocalVariable(name: "i", scope: !1039, file: !684, line: 252, type: !14)
!1043 = !DILocation(line: 253, column: 8, scope: !1044)
!1044 = distinct !DILexicalBlock(scope: !1039, file: !684, line: 253, column: 3)
!1045 = !DILocation(line: 253, scope: !1044)
!1046 = !DILocation(line: 253, column: 17, scope: !1047)
!1047 = distinct !DILexicalBlock(scope: !1044, file: !684, line: 253, column: 3)
!1048 = !DILocation(line: 253, column: 3, scope: !1044)
!1049 = !DILocation(line: 254, column: 18, scope: !1047)
!1050 = !DILocation(line: 254, column: 5, scope: !1047)
!1051 = !DILocation(line: 253, column: 29, scope: !1047)
!1052 = !DILocation(line: 253, column: 3, scope: !1047)
!1053 = distinct !{!1053, !1048, !1054, !107}
!1054 = !DILocation(line: 254, column: 25, scope: !1044)
!1055 = !DILocation(line: 258, column: 1, scope: !1039)
!1056 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_add", scope: !684, file: !684, line: 269, type: !1057, scopeLine: 269, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!1057 = !DISubroutineType(types: !1058)
!1058 = !{null, !323, !687, !687}
!1059 = !DILocalVariable(name: "r", arg: 1, scope: !1056, file: !684, line: 269, type: !323)
!1060 = !DILocation(line: 0, scope: !1056)
!1061 = !DILocalVariable(name: "a", arg: 2, scope: !1056, file: !684, line: 269, type: !687)
!1062 = !DILocalVariable(name: "b", arg: 3, scope: !1056, file: !684, line: 269, type: !687)
!1063 = !DILocalVariable(name: "i", scope: !1056, file: !684, line: 270, type: !14)
!1064 = !DILocation(line: 271, column: 8, scope: !1065)
!1065 = distinct !DILexicalBlock(scope: !1056, file: !684, line: 271, column: 3)
!1066 = !DILocation(line: 271, scope: !1065)
!1067 = !DILocation(line: 271, column: 17, scope: !1068)
!1068 = distinct !DILexicalBlock(scope: !1065, file: !684, line: 271, column: 3)
!1069 = !DILocation(line: 271, column: 3, scope: !1065)
!1070 = !DILocation(line: 272, column: 15, scope: !1068)
!1071 = !DILocation(line: 272, column: 25, scope: !1068)
!1072 = !DILocation(line: 272, column: 35, scope: !1068)
!1073 = !DILocation(line: 272, column: 5, scope: !1068)
!1074 = !DILocation(line: 271, column: 29, scope: !1068)
!1075 = !DILocation(line: 271, column: 3, scope: !1068)
!1076 = distinct !{!1076, !1069, !1077, !107}
!1077 = !DILocation(line: 272, column: 42, scope: !1065)
!1078 = !DILocation(line: 275, column: 1, scope: !1056)
!1079 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_compress", scope: !1080, file: !1080, line: 20, type: !1081, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1080 = !DIFile(filename: "../../../ref/poly.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!1081 = !DISubroutineType(types: !1082)
!1082 = !{null, !6, !1083}
!1083 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1084, size: 32)
!1084 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !327)
!1085 = !DILocalVariable(name: "r", arg: 1, scope: !1079, file: !1080, line: 20, type: !6)
!1086 = !DILocation(line: 0, scope: !1079)
!1087 = !DILocalVariable(name: "a", arg: 2, scope: !1079, file: !1080, line: 20, type: !1083)
!1088 = !DILocalVariable(name: "t", scope: !1079, file: !1080, line: 24, type: !1089)
!1089 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 64, elements: !694)
!1090 = !DILocation(line: 24, column: 11, scope: !1079)
!1091 = !DILocalVariable(name: "i", scope: !1079, file: !1080, line: 21, type: !14)
!1092 = !DILocation(line: 48, column: 8, scope: !1093)
!1093 = distinct !DILexicalBlock(scope: !1079, file: !1080, line: 48, column: 3)
!1094 = !DILocation(line: 48, scope: !1093)
!1095 = !DILocation(line: 48, column: 17, scope: !1096)
!1096 = distinct !DILexicalBlock(scope: !1093, file: !1080, line: 48, column: 3)
!1097 = !DILocation(line: 48, column: 3, scope: !1093)
!1098 = !DILocation(line: 49, column: 5, scope: !1099)
!1099 = distinct !DILexicalBlock(scope: !1100, file: !1080, line: 49, column: 5)
!1100 = distinct !DILexicalBlock(scope: !1096, file: !1080, line: 48, column: 37)
!1101 = !DILocation(line: 49, scope: !1099)
!1102 = !DILocalVariable(name: "j", scope: !1079, file: !1080, line: 21, type: !14)
!1103 = !DILocation(line: 49, column: 19, scope: !1104)
!1104 = distinct !DILexicalBlock(scope: !1099, file: !1080, line: 49, column: 5)
!1105 = !DILocation(line: 51, column: 18, scope: !1106)
!1106 = distinct !DILexicalBlock(scope: !1104, file: !1080, line: 49, column: 29)
!1107 = !DILocation(line: 51, column: 22, scope: !1106)
!1108 = !DILocation(line: 51, column: 11, scope: !1106)
!1109 = !DILocalVariable(name: "u", scope: !1079, file: !1080, line: 22, type: !36)
!1110 = !DILocation(line: 52, column: 22, scope: !1106)
!1111 = !DILocation(line: 52, column: 9, scope: !1106)
!1112 = !DILocation(line: 54, column: 12, scope: !1106)
!1113 = !DILocalVariable(name: "d0", scope: !1079, file: !1080, line: 23, type: !65)
!1114 = !DILocation(line: 56, column: 10, scope: !1106)
!1115 = !DILocation(line: 57, column: 10, scope: !1106)
!1116 = !DILocation(line: 58, column: 14, scope: !1106)
!1117 = !DILocation(line: 58, column: 7, scope: !1106)
!1118 = !DILocation(line: 58, column: 12, scope: !1106)
!1119 = !DILocation(line: 49, column: 25, scope: !1104)
!1120 = !DILocation(line: 49, column: 5, scope: !1104)
!1121 = distinct !{!1121, !1098, !1122, !107}
!1122 = !DILocation(line: 59, column: 5, scope: !1099)
!1123 = !DILocation(line: 61, column: 13, scope: !1100)
!1124 = !DILocation(line: 61, column: 27, scope: !1100)
!1125 = !DILocation(line: 61, column: 32, scope: !1100)
!1126 = !DILocation(line: 61, column: 24, scope: !1100)
!1127 = !DILocation(line: 61, column: 10, scope: !1100)
!1128 = !DILocation(line: 62, column: 18, scope: !1100)
!1129 = !DILocation(line: 62, column: 27, scope: !1100)
!1130 = !DILocation(line: 62, column: 32, scope: !1100)
!1131 = !DILocation(line: 62, column: 24, scope: !1100)
!1132 = !DILocation(line: 62, column: 41, scope: !1100)
!1133 = !DILocation(line: 62, column: 46, scope: !1100)
!1134 = !DILocation(line: 62, column: 38, scope: !1100)
!1135 = !DILocation(line: 62, column: 5, scope: !1100)
!1136 = !DILocation(line: 62, column: 10, scope: !1100)
!1137 = !DILocation(line: 63, column: 18, scope: !1100)
!1138 = !DILocation(line: 63, column: 27, scope: !1100)
!1139 = !DILocation(line: 63, column: 32, scope: !1100)
!1140 = !DILocation(line: 63, column: 24, scope: !1100)
!1141 = !DILocation(line: 63, column: 5, scope: !1100)
!1142 = !DILocation(line: 63, column: 10, scope: !1100)
!1143 = !DILocation(line: 64, column: 18, scope: !1100)
!1144 = !DILocation(line: 64, column: 27, scope: !1100)
!1145 = !DILocation(line: 64, column: 32, scope: !1100)
!1146 = !DILocation(line: 64, column: 24, scope: !1100)
!1147 = !DILocation(line: 64, column: 41, scope: !1100)
!1148 = !DILocation(line: 64, column: 46, scope: !1100)
!1149 = !DILocation(line: 64, column: 38, scope: !1100)
!1150 = !DILocation(line: 64, column: 5, scope: !1100)
!1151 = !DILocation(line: 64, column: 10, scope: !1100)
!1152 = !DILocation(line: 65, column: 18, scope: !1100)
!1153 = !DILocation(line: 65, column: 27, scope: !1100)
!1154 = !DILocation(line: 65, column: 32, scope: !1100)
!1155 = !DILocation(line: 65, column: 24, scope: !1100)
!1156 = !DILocation(line: 65, column: 5, scope: !1100)
!1157 = !DILocation(line: 65, column: 10, scope: !1100)
!1158 = !DILocation(line: 66, column: 7, scope: !1100)
!1159 = !DILocation(line: 48, column: 33, scope: !1096)
!1160 = !DILocation(line: 48, column: 3, scope: !1096)
!1161 = distinct !{!1161, !1097, !1162, !107}
!1162 = !DILocation(line: 67, column: 3, scope: !1093)
!1163 = !DILocation(line: 73, column: 1, scope: !1079)
!1164 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_decompress", scope: !1080, file: !1080, line: 85, type: !1165, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1165 = !DISubroutineType(types: !1166)
!1166 = !{null, !631, !234}
!1167 = !DILocalVariable(name: "r", arg: 1, scope: !1164, file: !1080, line: 85, type: !631)
!1168 = !DILocation(line: 0, scope: !1164)
!1169 = !DILocalVariable(name: "a", arg: 2, scope: !1164, file: !1080, line: 85, type: !234)
!1170 = !DILocalVariable(name: "t", scope: !1164, file: !1080, line: 96, type: !1089)
!1171 = !DILocation(line: 96, column: 11, scope: !1164)
!1172 = !DILocalVariable(name: "i", scope: !1164, file: !1080, line: 86, type: !14)
!1173 = !DILocation(line: 97, column: 8, scope: !1174)
!1174 = distinct !DILexicalBlock(scope: !1164, file: !1080, line: 97, column: 3)
!1175 = !DILocation(line: 97, scope: !1174)
!1176 = !DILocation(line: 97, column: 17, scope: !1177)
!1177 = distinct !DILexicalBlock(scope: !1174, file: !1080, line: 97, column: 3)
!1178 = !DILocation(line: 97, column: 3, scope: !1174)
!1179 = !DILocation(line: 98, column: 13, scope: !1180)
!1180 = distinct !DILexicalBlock(scope: !1177, file: !1080, line: 97, column: 37)
!1181 = !DILocation(line: 98, column: 10, scope: !1180)
!1182 = !DILocation(line: 99, column: 27, scope: !1180)
!1183 = !DILocation(line: 99, column: 24, scope: !1180)
!1184 = !DILocation(line: 99, column: 5, scope: !1180)
!1185 = !DILocation(line: 99, column: 10, scope: !1180)
!1186 = !DILocation(line: 100, column: 18, scope: !1180)
!1187 = !DILocation(line: 100, column: 5, scope: !1180)
!1188 = !DILocation(line: 100, column: 10, scope: !1180)
!1189 = !DILocation(line: 101, column: 13, scope: !1180)
!1190 = !DILocation(line: 101, column: 27, scope: !1180)
!1191 = !DILocation(line: 101, column: 24, scope: !1180)
!1192 = !DILocation(line: 101, column: 5, scope: !1180)
!1193 = !DILocation(line: 101, column: 10, scope: !1180)
!1194 = !DILocation(line: 102, column: 27, scope: !1180)
!1195 = !DILocation(line: 102, column: 24, scope: !1180)
!1196 = !DILocation(line: 102, column: 5, scope: !1180)
!1197 = !DILocation(line: 102, column: 10, scope: !1180)
!1198 = !DILocation(line: 103, column: 18, scope: !1180)
!1199 = !DILocation(line: 103, column: 5, scope: !1180)
!1200 = !DILocation(line: 103, column: 10, scope: !1180)
!1201 = !DILocation(line: 104, column: 13, scope: !1180)
!1202 = !DILocation(line: 104, column: 27, scope: !1180)
!1203 = !DILocation(line: 104, column: 24, scope: !1180)
!1204 = !DILocation(line: 104, column: 5, scope: !1180)
!1205 = !DILocation(line: 104, column: 10, scope: !1180)
!1206 = !DILocation(line: 105, column: 18, scope: !1180)
!1207 = !DILocation(line: 105, column: 5, scope: !1180)
!1208 = !DILocation(line: 105, column: 10, scope: !1180)
!1209 = !DILocalVariable(name: "j", scope: !1164, file: !1080, line: 95, type: !14)
!1210 = !DILocation(line: 108, column: 10, scope: !1211)
!1211 = distinct !DILexicalBlock(scope: !1180, file: !1080, line: 108, column: 5)
!1212 = !DILocation(line: 108, scope: !1211)
!1213 = !DILocation(line: 108, column: 19, scope: !1214)
!1214 = distinct !DILexicalBlock(scope: !1211, file: !1080, line: 108, column: 5)
!1215 = !DILocation(line: 108, column: 5, scope: !1211)
!1216 = !DILocation(line: 109, column: 37, scope: !1214)
!1217 = !DILocation(line: 109, column: 42, scope: !1214)
!1218 = !DILocation(line: 109, column: 48, scope: !1214)
!1219 = !DILocation(line: 109, column: 58, scope: !1214)
!1220 = !DILocation(line: 109, column: 64, scope: !1214)
!1221 = !DILocation(line: 109, column: 25, scope: !1214)
!1222 = !DILocation(line: 109, column: 14, scope: !1214)
!1223 = !DILocation(line: 109, column: 18, scope: !1214)
!1224 = !DILocation(line: 109, column: 7, scope: !1214)
!1225 = !DILocation(line: 109, column: 23, scope: !1214)
!1226 = !DILocation(line: 108, column: 25, scope: !1214)
!1227 = !DILocation(line: 108, column: 5, scope: !1214)
!1228 = distinct !{!1228, !1215, !1229, !107}
!1229 = !DILocation(line: 109, column: 67, scope: !1211)
!1230 = !DILocation(line: 106, column: 7, scope: !1180)
!1231 = !DILocation(line: 97, column: 33, scope: !1177)
!1232 = !DILocation(line: 97, column: 3, scope: !1177)
!1233 = distinct !{!1233, !1178, !1234, !107}
!1234 = !DILocation(line: 110, column: 3, scope: !1174)
!1235 = !DILocation(line: 116, column: 1, scope: !1164)
!1236 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_tobytes", scope: !1080, file: !1080, line: 127, type: !1081, scopeLine: 127, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1237 = !DILocalVariable(name: "r", arg: 1, scope: !1236, file: !1080, line: 127, type: !6)
!1238 = !DILocation(line: 0, scope: !1236)
!1239 = !DILocalVariable(name: "a", arg: 2, scope: !1236, file: !1080, line: 127, type: !1083)
!1240 = !DILocalVariable(name: "i", scope: !1236, file: !1080, line: 128, type: !14)
!1241 = !DILocation(line: 131, column: 8, scope: !1242)
!1242 = distinct !DILexicalBlock(scope: !1236, file: !1080, line: 131, column: 3)
!1243 = !DILocation(line: 131, scope: !1242)
!1244 = !DILocation(line: 131, column: 17, scope: !1245)
!1245 = distinct !DILexicalBlock(scope: !1242, file: !1080, line: 131, column: 3)
!1246 = !DILocation(line: 131, column: 3, scope: !1242)
!1247 = !DILocation(line: 133, column: 17, scope: !1248)
!1248 = distinct !DILexicalBlock(scope: !1245, file: !1080, line: 131, column: 37)
!1249 = !DILocation(line: 133, column: 10, scope: !1248)
!1250 = !DILocalVariable(name: "t0", scope: !1236, file: !1080, line: 129, type: !60)
!1251 = !DILocation(line: 134, column: 31, scope: !1248)
!1252 = !DILocation(line: 134, column: 8, scope: !1248)
!1253 = !DILocation(line: 135, column: 17, scope: !1248)
!1254 = !DILocation(line: 135, column: 21, scope: !1248)
!1255 = !DILocation(line: 135, column: 10, scope: !1248)
!1256 = !DILocalVariable(name: "t1", scope: !1236, file: !1080, line: 129, type: !60)
!1257 = !DILocation(line: 136, column: 31, scope: !1248)
!1258 = !DILocation(line: 136, column: 8, scope: !1248)
!1259 = !DILocation(line: 137, column: 20, scope: !1248)
!1260 = !DILocation(line: 137, column: 9, scope: !1248)
!1261 = !DILocation(line: 137, column: 5, scope: !1248)
!1262 = !DILocation(line: 137, column: 18, scope: !1248)
!1263 = !DILocation(line: 138, column: 24, scope: !1248)
!1264 = !DILocation(line: 138, column: 33, scope: !1248)
!1265 = !DILocation(line: 138, column: 36, scope: !1248)
!1266 = !DILocation(line: 138, column: 30, scope: !1248)
!1267 = !DILocation(line: 138, column: 9, scope: !1248)
!1268 = !DILocation(line: 138, column: 5, scope: !1248)
!1269 = !DILocation(line: 138, column: 18, scope: !1248)
!1270 = !DILocation(line: 139, column: 24, scope: !1248)
!1271 = !DILocation(line: 139, column: 20, scope: !1248)
!1272 = !DILocation(line: 139, column: 9, scope: !1248)
!1273 = !DILocation(line: 139, column: 5, scope: !1248)
!1274 = !DILocation(line: 139, column: 18, scope: !1248)
!1275 = !DILocation(line: 131, column: 33, scope: !1245)
!1276 = !DILocation(line: 131, column: 3, scope: !1245)
!1277 = distinct !{!1277, !1246, !1278, !107}
!1278 = !DILocation(line: 140, column: 3, scope: !1242)
!1279 = !DILocation(line: 143, column: 1, scope: !1236)
!1280 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_frombytes", scope: !1080, file: !1080, line: 155, type: !1165, scopeLine: 155, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1281 = !DILocalVariable(name: "r", arg: 1, scope: !1280, file: !1080, line: 155, type: !631)
!1282 = !DILocation(line: 0, scope: !1280)
!1283 = !DILocalVariable(name: "a", arg: 2, scope: !1280, file: !1080, line: 155, type: !234)
!1284 = !DILocalVariable(name: "i", scope: !1280, file: !1080, line: 156, type: !14)
!1285 = !DILocation(line: 157, column: 8, scope: !1286)
!1286 = distinct !DILexicalBlock(scope: !1280, file: !1080, line: 157, column: 3)
!1287 = !DILocation(line: 157, scope: !1286)
!1288 = !DILocation(line: 157, column: 17, scope: !1289)
!1289 = distinct !DILexicalBlock(scope: !1286, file: !1080, line: 157, column: 3)
!1290 = !DILocation(line: 157, column: 3, scope: !1286)
!1291 = !DILocation(line: 158, column: 25, scope: !1292)
!1292 = distinct !DILexicalBlock(scope: !1289, file: !1080, line: 157, column: 37)
!1293 = !DILocation(line: 158, column: 21, scope: !1292)
!1294 = !DILocation(line: 158, column: 57, scope: !1292)
!1295 = !DILocation(line: 158, column: 53, scope: !1292)
!1296 = !DILocation(line: 158, column: 43, scope: !1292)
!1297 = !DILocation(line: 158, column: 66, scope: !1292)
!1298 = !DILocation(line: 158, column: 73, scope: !1292)
!1299 = !DILocation(line: 158, column: 12, scope: !1292)
!1300 = !DILocation(line: 158, column: 5, scope: !1292)
!1301 = !DILocation(line: 158, column: 17, scope: !1292)
!1302 = !DILocation(line: 160, column: 15, scope: !1292)
!1303 = !DILocation(line: 160, column: 11, scope: !1292)
!1304 = !DILocation(line: 160, column: 24, scope: !1292)
!1305 = !DILocation(line: 160, column: 47, scope: !1292)
!1306 = !DILocation(line: 160, column: 43, scope: !1292)
!1307 = !DILocation(line: 160, column: 33, scope: !1292)
!1308 = !DILocation(line: 160, column: 56, scope: !1292)
!1309 = !DILocation(line: 160, column: 30, scope: !1292)
!1310 = !DILocation(line: 159, column: 12, scope: !1292)
!1311 = !DILocation(line: 159, column: 16, scope: !1292)
!1312 = !DILocation(line: 159, column: 5, scope: !1292)
!1313 = !DILocation(line: 159, column: 21, scope: !1292)
!1314 = !DILocation(line: 157, column: 33, scope: !1289)
!1315 = !DILocation(line: 157, column: 3, scope: !1289)
!1316 = distinct !{!1316, !1290, !1317, !107}
!1317 = !DILocation(line: 161, column: 3, scope: !1286)
!1318 = !DILocation(line: 164, column: 1, scope: !1280)
!1319 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_frommsg", scope: !1080, file: !1080, line: 174, type: !1165, scopeLine: 174, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1320 = !DILocalVariable(name: "r", arg: 1, scope: !1319, file: !1080, line: 174, type: !631)
!1321 = !DILocation(line: 0, scope: !1319)
!1322 = !DILocalVariable(name: "msg", arg: 2, scope: !1319, file: !1080, line: 174, type: !234)
!1323 = !DILocalVariable(name: "i", scope: !1319, file: !1080, line: 175, type: !14)
!1324 = !DILocation(line: 181, column: 8, scope: !1325)
!1325 = distinct !DILexicalBlock(scope: !1319, file: !1080, line: 181, column: 3)
!1326 = !DILocation(line: 181, scope: !1325)
!1327 = !DILocation(line: 181, column: 17, scope: !1328)
!1328 = distinct !DILexicalBlock(scope: !1325, file: !1080, line: 181, column: 3)
!1329 = !DILocation(line: 181, column: 3, scope: !1325)
!1330 = !DILocation(line: 182, column: 5, scope: !1331)
!1331 = distinct !DILexicalBlock(scope: !1332, file: !1080, line: 182, column: 5)
!1332 = distinct !DILexicalBlock(scope: !1328, file: !1080, line: 181, column: 37)
!1333 = !DILocation(line: 182, scope: !1331)
!1334 = !DILocalVariable(name: "j", scope: !1319, file: !1080, line: 175, type: !14)
!1335 = !DILocation(line: 182, column: 19, scope: !1336)
!1336 = distinct !DILexicalBlock(scope: !1331, file: !1080, line: 182, column: 5)
!1337 = !DILocation(line: 183, column: 14, scope: !1338)
!1338 = distinct !DILexicalBlock(scope: !1336, file: !1080, line: 182, column: 29)
!1339 = !DILocation(line: 183, column: 18, scope: !1338)
!1340 = !DILocation(line: 183, column: 7, scope: !1338)
!1341 = !DILocation(line: 183, column: 23, scope: !1338)
!1342 = !DILocation(line: 184, column: 23, scope: !1338)
!1343 = !DILocation(line: 184, column: 31, scope: !1338)
!1344 = !DILocation(line: 184, column: 58, scope: !1338)
!1345 = !DILocation(line: 184, column: 65, scope: !1338)
!1346 = !DILocation(line: 184, column: 57, scope: !1338)
!1347 = !DILocation(line: 184, column: 7, scope: !1338)
!1348 = !DILocation(line: 182, column: 25, scope: !1336)
!1349 = !DILocation(line: 182, column: 5, scope: !1336)
!1350 = distinct !{!1350, !1330, !1351, !107}
!1351 = !DILocation(line: 185, column: 5, scope: !1331)
!1352 = !DILocation(line: 181, column: 33, scope: !1328)
!1353 = !DILocation(line: 181, column: 3, scope: !1328)
!1354 = distinct !{!1354, !1329, !1355, !107}
!1355 = !DILocation(line: 186, column: 3, scope: !1325)
!1356 = !DILocation(line: 190, column: 1, scope: !1319)
!1357 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_tomsg", scope: !1080, file: !1080, line: 200, type: !1081, scopeLine: 200, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1358 = !DILocalVariable(name: "msg", arg: 1, scope: !1357, file: !1080, line: 200, type: !6)
!1359 = !DILocation(line: 0, scope: !1357)
!1360 = !DILocalVariable(name: "a", arg: 2, scope: !1357, file: !1080, line: 200, type: !1083)
!1361 = !DILocalVariable(name: "i", scope: !1357, file: !1080, line: 201, type: !14)
!1362 = !DILocation(line: 204, column: 8, scope: !1363)
!1363 = distinct !DILexicalBlock(scope: !1357, file: !1080, line: 204, column: 3)
!1364 = !DILocation(line: 204, scope: !1363)
!1365 = !DILocation(line: 204, column: 17, scope: !1366)
!1366 = distinct !DILexicalBlock(scope: !1363, file: !1080, line: 204, column: 3)
!1367 = !DILocation(line: 204, column: 3, scope: !1363)
!1368 = !DILocation(line: 205, column: 5, scope: !1369)
!1369 = distinct !DILexicalBlock(scope: !1366, file: !1080, line: 204, column: 37)
!1370 = !DILocation(line: 205, column: 12, scope: !1369)
!1371 = !DILocalVariable(name: "j", scope: !1357, file: !1080, line: 201, type: !14)
!1372 = !DILocation(line: 206, column: 10, scope: !1373)
!1373 = distinct !DILexicalBlock(scope: !1369, file: !1080, line: 206, column: 5)
!1374 = !DILocation(line: 206, scope: !1373)
!1375 = !DILocation(line: 206, column: 19, scope: !1376)
!1376 = distinct !DILexicalBlock(scope: !1373, file: !1080, line: 206, column: 5)
!1377 = !DILocation(line: 206, column: 5, scope: !1373)
!1378 = !DILocation(line: 207, column: 18, scope: !1379)
!1379 = distinct !DILexicalBlock(scope: !1376, file: !1080, line: 206, column: 29)
!1380 = !DILocation(line: 207, column: 22, scope: !1379)
!1381 = !DILocation(line: 207, column: 11, scope: !1379)
!1382 = !DILocalVariable(name: "t", scope: !1357, file: !1080, line: 202, type: !65)
!1383 = !DILocation(line: 212, column: 9, scope: !1379)
!1384 = !DILocation(line: 213, column: 9, scope: !1379)
!1385 = !DILocation(line: 214, column: 9, scope: !1379)
!1386 = !DILocation(line: 215, column: 19, scope: !1379)
!1387 = !DILocation(line: 215, column: 7, scope: !1379)
!1388 = !DILocation(line: 215, column: 14, scope: !1379)
!1389 = !DILocation(line: 206, column: 25, scope: !1376)
!1390 = !DILocation(line: 206, column: 5, scope: !1376)
!1391 = distinct !{!1391, !1377, !1392, !107}
!1392 = !DILocation(line: 216, column: 5, scope: !1373)
!1393 = !DILocation(line: 204, column: 33, scope: !1366)
!1394 = !DILocation(line: 204, column: 3, scope: !1366)
!1395 = distinct !{!1395, !1367, !1396, !107}
!1396 = !DILocation(line: 217, column: 3, scope: !1363)
!1397 = !DILocation(line: 220, column: 1, scope: !1357)
!1398 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_getnoise_eta1", scope: !1080, file: !1080, line: 234, type: !1399, scopeLine: 235, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1399 = !DISubroutineType(types: !1400)
!1400 = !{null, !631, !234, !7}
!1401 = !DILocalVariable(name: "r", arg: 1, scope: !1398, file: !1080, line: 234, type: !631)
!1402 = !DILocation(line: 0, scope: !1398)
!1403 = !DILocalVariable(name: "seed", arg: 2, scope: !1398, file: !1080, line: 234, type: !234)
!1404 = !DILocalVariable(name: "nonce", arg: 3, scope: !1398, file: !1080, line: 235, type: !7)
!1405 = !DILocalVariable(name: "buf", scope: !1398, file: !1080, line: 236, type: !1406)
!1406 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1024, elements: !39)
!1407 = !DILocation(line: 236, column: 11, scope: !1398)
!1408 = !DILocation(line: 237, column: 3, scope: !1398)
!1409 = !DILocation(line: 238, column: 3, scope: !1398)
!1410 = !DILocation(line: 242, column: 1, scope: !1398)
!1411 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_getnoise_eta2", scope: !1080, file: !1080, line: 256, type: !1399, scopeLine: 257, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1412 = !DILocalVariable(name: "r", arg: 1, scope: !1411, file: !1080, line: 256, type: !631)
!1413 = !DILocation(line: 0, scope: !1411)
!1414 = !DILocalVariable(name: "seed", arg: 2, scope: !1411, file: !1080, line: 256, type: !234)
!1415 = !DILocalVariable(name: "nonce", arg: 3, scope: !1411, file: !1080, line: 257, type: !7)
!1416 = !DILocalVariable(name: "buf", scope: !1411, file: !1080, line: 258, type: !1406)
!1417 = !DILocation(line: 258, column: 11, scope: !1411)
!1418 = !DILocation(line: 259, column: 3, scope: !1411)
!1419 = !DILocation(line: 260, column: 3, scope: !1411)
!1420 = !DILocation(line: 264, column: 1, scope: !1411)
!1421 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_ntt", scope: !1080, file: !1080, line: 276, type: !1422, scopeLine: 276, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1422 = !DISubroutineType(types: !1423)
!1423 = !{null, !631}
!1424 = !DILocalVariable(name: "r", arg: 1, scope: !1421, file: !1080, line: 276, type: !631)
!1425 = !DILocation(line: 0, scope: !1421)
!1426 = !DILocation(line: 283, column: 25, scope: !1421)
!1427 = !DILocation(line: 284, column: 25, scope: !1421)
!1428 = !DILocation(line: 287, column: 1, scope: !1421)
!1429 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_reduce", scope: !1080, file: !1080, line: 353, type: !1422, scopeLine: 353, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1430 = !DILocalVariable(name: "r", arg: 1, scope: !1429, file: !1080, line: 353, type: !631)
!1431 = !DILocation(line: 0, scope: !1429)
!1432 = !DILocalVariable(name: "i", scope: !1429, file: !1080, line: 354, type: !14)
!1433 = !DILocation(line: 355, column: 8, scope: !1434)
!1434 = distinct !DILexicalBlock(scope: !1429, file: !1080, line: 355, column: 3)
!1435 = !DILocation(line: 355, scope: !1434)
!1436 = !DILocation(line: 355, column: 17, scope: !1437)
!1437 = distinct !DILexicalBlock(scope: !1434, file: !1080, line: 355, column: 3)
!1438 = !DILocation(line: 355, column: 3, scope: !1434)
!1439 = !DILocation(line: 356, column: 30, scope: !1437)
!1440 = !DILocation(line: 356, column: 15, scope: !1437)
!1441 = !DILocation(line: 356, column: 5, scope: !1437)
!1442 = !DILocation(line: 356, column: 13, scope: !1437)
!1443 = !DILocation(line: 355, column: 29, scope: !1437)
!1444 = !DILocation(line: 355, column: 3, scope: !1437)
!1445 = distinct !{!1445, !1438, !1446, !107}
!1446 = !DILocation(line: 356, column: 37, scope: !1434)
!1447 = !DILocation(line: 360, column: 1, scope: !1429)
!1448 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_invntt_tomont", scope: !1080, file: !1080, line: 299, type: !1422, scopeLine: 299, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1449 = !DILocalVariable(name: "r", arg: 1, scope: !1448, file: !1080, line: 299, type: !631)
!1450 = !DILocation(line: 0, scope: !1448)
!1451 = !DILocation(line: 300, column: 3, scope: !1448)
!1452 = !DILocation(line: 304, column: 1, scope: !1448)
!1453 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_basemul_montgomery", scope: !1080, file: !1080, line: 315, type: !1454, scopeLine: 315, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1454 = !DISubroutineType(types: !1455)
!1455 = !{null, !631, !1083, !1083}
!1456 = !DILocalVariable(name: "r", arg: 1, scope: !1453, file: !1080, line: 315, type: !631)
!1457 = !DILocation(line: 0, scope: !1453)
!1458 = !DILocalVariable(name: "a", arg: 2, scope: !1453, file: !1080, line: 315, type: !1083)
!1459 = !DILocalVariable(name: "b", arg: 3, scope: !1453, file: !1080, line: 315, type: !1083)
!1460 = !DILocalVariable(name: "i", scope: !1453, file: !1080, line: 316, type: !14)
!1461 = !DILocation(line: 317, column: 8, scope: !1462)
!1462 = distinct !DILexicalBlock(scope: !1453, file: !1080, line: 317, column: 3)
!1463 = !DILocation(line: 317, scope: !1462)
!1464 = !DILocation(line: 317, column: 17, scope: !1465)
!1465 = distinct !DILexicalBlock(scope: !1462, file: !1080, line: 317, column: 3)
!1466 = !DILocation(line: 317, column: 3, scope: !1462)
!1467 = !DILocation(line: 318, column: 21, scope: !1468)
!1468 = distinct !DILexicalBlock(scope: !1465, file: !1080, line: 317, column: 37)
!1469 = !DILocation(line: 318, column: 14, scope: !1468)
!1470 = !DILocation(line: 318, column: 35, scope: !1468)
!1471 = !DILocation(line: 318, column: 28, scope: !1468)
!1472 = !DILocation(line: 318, column: 49, scope: !1468)
!1473 = !DILocation(line: 318, column: 42, scope: !1468)
!1474 = !DILocation(line: 318, column: 64, scope: !1468)
!1475 = !DILocation(line: 318, column: 55, scope: !1468)
!1476 = !DILocation(line: 318, column: 5, scope: !1468)
!1477 = !DILocation(line: 319, column: 21, scope: !1468)
!1478 = !DILocation(line: 319, column: 25, scope: !1468)
!1479 = !DILocation(line: 319, column: 14, scope: !1468)
!1480 = !DILocation(line: 319, column: 39, scope: !1468)
!1481 = !DILocation(line: 319, column: 43, scope: !1468)
!1482 = !DILocation(line: 319, column: 32, scope: !1468)
!1483 = !DILocation(line: 319, column: 57, scope: !1468)
!1484 = !DILocation(line: 319, column: 61, scope: !1468)
!1485 = !DILocation(line: 319, column: 50, scope: !1468)
!1486 = !DILocation(line: 320, column: 23, scope: !1468)
!1487 = !DILocation(line: 320, column: 14, scope: !1468)
!1488 = !DILocation(line: 320, column: 13, scope: !1468)
!1489 = !DILocation(line: 319, column: 5, scope: !1468)
!1490 = !DILocation(line: 317, column: 33, scope: !1465)
!1491 = !DILocation(line: 317, column: 3, scope: !1465)
!1492 = distinct !{!1492, !1466, !1493, !107}
!1493 = !DILocation(line: 321, column: 3, scope: !1462)
!1494 = !DILocation(line: 325, column: 1, scope: !1453)
!1495 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_tomont", scope: !1080, file: !1080, line: 335, type: !1422, scopeLine: 335, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1496 = !DILocalVariable(name: "r", arg: 1, scope: !1495, file: !1080, line: 335, type: !631)
!1497 = !DILocation(line: 0, scope: !1495)
!1498 = !DILocalVariable(name: "f", scope: !1495, file: !1080, line: 337, type: !35)
!1499 = !DILocalVariable(name: "i", scope: !1495, file: !1080, line: 336, type: !14)
!1500 = !DILocation(line: 338, column: 8, scope: !1501)
!1501 = distinct !DILexicalBlock(scope: !1495, file: !1080, line: 338, column: 3)
!1502 = !DILocation(line: 338, scope: !1501)
!1503 = !DILocation(line: 338, column: 17, scope: !1504)
!1504 = distinct !DILexicalBlock(scope: !1501, file: !1080, line: 338, column: 3)
!1505 = !DILocation(line: 338, column: 3, scope: !1501)
!1506 = !DILocation(line: 339, column: 42, scope: !1504)
!1507 = !DILocation(line: 339, column: 33, scope: !1504)
!1508 = !DILocation(line: 339, column: 50, scope: !1504)
!1509 = !DILocation(line: 339, column: 15, scope: !1504)
!1510 = !DILocation(line: 339, column: 5, scope: !1504)
!1511 = !DILocation(line: 339, column: 13, scope: !1504)
!1512 = !DILocation(line: 338, column: 29, scope: !1504)
!1513 = !DILocation(line: 338, column: 3, scope: !1504)
!1514 = distinct !{!1514, !1505, !1515, !107}
!1515 = !DILocation(line: 339, column: 53, scope: !1501)
!1516 = !DILocation(line: 343, column: 1, scope: !1495)
!1517 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_add", scope: !1080, file: !1080, line: 371, type: !1454, scopeLine: 371, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1518 = !DILocalVariable(name: "r", arg: 1, scope: !1517, file: !1080, line: 371, type: !631)
!1519 = !DILocation(line: 0, scope: !1517)
!1520 = !DILocalVariable(name: "a", arg: 2, scope: !1517, file: !1080, line: 371, type: !1083)
!1521 = !DILocalVariable(name: "b", arg: 3, scope: !1517, file: !1080, line: 371, type: !1083)
!1522 = !DILocalVariable(name: "i", scope: !1517, file: !1080, line: 372, type: !14)
!1523 = !DILocation(line: 373, column: 8, scope: !1524)
!1524 = distinct !DILexicalBlock(scope: !1517, file: !1080, line: 373, column: 3)
!1525 = !DILocation(line: 373, scope: !1524)
!1526 = !DILocation(line: 373, column: 17, scope: !1527)
!1527 = distinct !DILexicalBlock(scope: !1524, file: !1080, line: 373, column: 3)
!1528 = !DILocation(line: 373, column: 3, scope: !1524)
!1529 = !DILocation(line: 374, column: 15, scope: !1527)
!1530 = !DILocation(line: 374, column: 25, scope: !1527)
!1531 = !DILocation(line: 374, column: 23, scope: !1527)
!1532 = !DILocation(line: 374, column: 5, scope: !1527)
!1533 = !DILocation(line: 374, column: 13, scope: !1527)
!1534 = !DILocation(line: 373, column: 29, scope: !1527)
!1535 = !DILocation(line: 373, column: 3, scope: !1527)
!1536 = distinct !{!1536, !1528, !1537, !107}
!1537 = !DILocation(line: 374, column: 31, scope: !1524)
!1538 = !DILocation(line: 379, column: 1, scope: !1517)
!1539 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_sub", scope: !1080, file: !1080, line: 390, type: !1454, scopeLine: 390, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1540 = !DILocalVariable(name: "r", arg: 1, scope: !1539, file: !1080, line: 390, type: !631)
!1541 = !DILocation(line: 0, scope: !1539)
!1542 = !DILocalVariable(name: "a", arg: 2, scope: !1539, file: !1080, line: 390, type: !1083)
!1543 = !DILocalVariable(name: "b", arg: 3, scope: !1539, file: !1080, line: 390, type: !1083)
!1544 = !DILocalVariable(name: "i", scope: !1539, file: !1080, line: 391, type: !14)
!1545 = !DILocation(line: 392, column: 8, scope: !1546)
!1546 = distinct !DILexicalBlock(scope: !1539, file: !1080, line: 392, column: 3)
!1547 = !DILocation(line: 392, scope: !1546)
!1548 = !DILocation(line: 392, column: 17, scope: !1549)
!1549 = distinct !DILexicalBlock(scope: !1546, file: !1080, line: 392, column: 3)
!1550 = !DILocation(line: 392, column: 3, scope: !1546)
!1551 = !DILocation(line: 393, column: 15, scope: !1549)
!1552 = !DILocation(line: 393, column: 25, scope: !1549)
!1553 = !DILocation(line: 393, column: 23, scope: !1549)
!1554 = !DILocation(line: 393, column: 5, scope: !1549)
!1555 = !DILocation(line: 393, column: 13, scope: !1549)
!1556 = !DILocation(line: 392, column: 29, scope: !1549)
!1557 = !DILocation(line: 392, column: 3, scope: !1549)
!1558 = distinct !{!1558, !1550, !1559, !107}
!1559 = !DILocation(line: 393, column: 31, scope: !1546)
!1560 = !DILocation(line: 396, column: 1, scope: !1539)
!1561 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_ntt", scope: !33, file: !33, line: 77, type: !1562, scopeLine: 77, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, retainedNodes: !24)
!1562 = !DISubroutineType(types: !1563)
!1563 = !{null, !400}
!1564 = !DILocalVariable(name: "r", arg: 1, scope: !1561, file: !33, line: 77, type: !400)
!1565 = !DILocation(line: 0, scope: !1561)
!1566 = !DILocalVariable(name: "k", scope: !1561, file: !33, line: 78, type: !14)
!1567 = !DILocalVariable(name: "len", scope: !1561, file: !33, line: 78, type: !14)
!1568 = !DILocation(line: 82, column: 8, scope: !1569)
!1569 = distinct !DILexicalBlock(scope: !1561, file: !33, line: 82, column: 3)
!1570 = !DILocation(line: 82, scope: !1569)
!1571 = !DILocation(line: 81, column: 5, scope: !1561)
!1572 = !DILocation(line: 82, column: 23, scope: !1573)
!1573 = distinct !DILexicalBlock(scope: !1569, file: !33, line: 82, column: 3)
!1574 = !DILocation(line: 82, column: 3, scope: !1569)
!1575 = !DILocation(line: 83, column: 5, scope: !1576)
!1576 = distinct !DILexicalBlock(scope: !1577, file: !33, line: 83, column: 5)
!1577 = distinct !DILexicalBlock(scope: !1573, file: !33, line: 82, column: 40)
!1578 = !DILocation(line: 83, scope: !1576)
!1579 = !DILocalVariable(name: "start", scope: !1561, file: !33, line: 78, type: !14)
!1580 = !DILocation(line: 83, column: 27, scope: !1581)
!1581 = distinct !DILexicalBlock(scope: !1576, file: !33, line: 83, column: 5)
!1582 = !DILocation(line: 84, column: 14, scope: !1583)
!1583 = distinct !DILexicalBlock(scope: !1581, file: !33, line: 83, column: 51)
!1584 = !DILocalVariable(name: "zeta", scope: !1561, file: !33, line: 79, type: !36)
!1585 = !DILocalVariable(name: "j", scope: !1561, file: !33, line: 78, type: !14)
!1586 = !DILocation(line: 85, column: 12, scope: !1587)
!1587 = distinct !DILexicalBlock(scope: !1583, file: !33, line: 85, column: 7)
!1588 = !DILocation(line: 85, scope: !1587)
!1589 = !DILocation(line: 85, column: 33, scope: !1590)
!1590 = distinct !DILexicalBlock(scope: !1587, file: !33, line: 85, column: 7)
!1591 = !DILocation(line: 85, column: 25, scope: !1590)
!1592 = !DILocation(line: 85, column: 7, scope: !1587)
!1593 = !DILocation(line: 86, column: 25, scope: !1594)
!1594 = distinct !DILexicalBlock(scope: !1590, file: !33, line: 85, column: 45)
!1595 = !DILocation(line: 86, column: 13, scope: !1594)
!1596 = !DILocalVariable(name: "t", scope: !1561, file: !33, line: 79, type: !36)
!1597 = !DILocation(line: 87, column: 22, scope: !1594)
!1598 = !DILocation(line: 87, column: 27, scope: !1594)
!1599 = !DILocation(line: 87, column: 9, scope: !1594)
!1600 = !DILocation(line: 87, column: 20, scope: !1594)
!1601 = !DILocation(line: 88, column: 16, scope: !1594)
!1602 = !DILocation(line: 88, column: 21, scope: !1594)
!1603 = !DILocation(line: 88, column: 9, scope: !1594)
!1604 = !DILocation(line: 88, column: 14, scope: !1594)
!1605 = !DILocation(line: 85, column: 41, scope: !1590)
!1606 = !DILocation(line: 85, column: 7, scope: !1590)
!1607 = distinct !{!1607, !1592, !1608, !107}
!1608 = !DILocation(line: 89, column: 7, scope: !1587)
!1609 = !DILocation(line: 84, column: 21, scope: !1583)
!1610 = !DILocation(line: 83, column: 44, scope: !1581)
!1611 = !DILocation(line: 83, column: 5, scope: !1581)
!1612 = distinct !{!1612, !1575, !1613, !107}
!1613 = !DILocation(line: 90, column: 5, scope: !1576)
!1614 = !DILocation(line: 82, column: 33, scope: !1573)
!1615 = !DILocation(line: 82, column: 3, scope: !1573)
!1616 = distinct !{!1616, !1574, !1617, !107}
!1617 = !DILocation(line: 91, column: 3, scope: !1569)
!1618 = !DILocation(line: 94, column: 1, scope: !1561)
!1619 = distinct !DISubprogram(name: "fqmul", scope: !33, file: !33, line: 64, type: !1620, scopeLine: 64, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !28, retainedNodes: !24)
!1620 = !DISubroutineType(types: !1621)
!1621 = !{!36, !36, !36}
!1622 = !DILocalVariable(name: "a", arg: 1, scope: !1619, file: !33, line: 64, type: !36)
!1623 = !DILocation(line: 0, scope: !1619)
!1624 = !DILocalVariable(name: "b", arg: 2, scope: !1619, file: !33, line: 64, type: !36)
!1625 = !DILocation(line: 65, column: 28, scope: !1619)
!1626 = !DILocation(line: 65, column: 41, scope: !1619)
!1627 = !DILocation(line: 65, column: 39, scope: !1619)
!1628 = !DILocation(line: 65, column: 10, scope: !1619)
!1629 = !DILocation(line: 65, column: 3, scope: !1619)
!1630 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_invntt", scope: !33, file: !33, line: 106, type: !1562, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, retainedNodes: !24)
!1631 = !DILocalVariable(name: "r", arg: 1, scope: !1630, file: !33, line: 106, type: !400)
!1632 = !DILocation(line: 0, scope: !1630)
!1633 = !DILocalVariable(name: "f", scope: !1630, file: !33, line: 109, type: !35)
!1634 = !DILocalVariable(name: "k", scope: !1630, file: !33, line: 107, type: !14)
!1635 = !DILocalVariable(name: "len", scope: !1630, file: !33, line: 107, type: !14)
!1636 = !DILocation(line: 112, column: 8, scope: !1637)
!1637 = distinct !DILexicalBlock(scope: !1630, file: !33, line: 112, column: 3)
!1638 = !DILocation(line: 112, scope: !1637)
!1639 = !DILocation(line: 111, column: 5, scope: !1630)
!1640 = !DILocation(line: 112, column: 21, scope: !1641)
!1641 = distinct !DILexicalBlock(scope: !1637, file: !33, line: 112, column: 3)
!1642 = !DILocation(line: 112, column: 3, scope: !1637)
!1643 = !DILocation(line: 113, column: 5, scope: !1644)
!1644 = distinct !DILexicalBlock(scope: !1645, file: !33, line: 113, column: 5)
!1645 = distinct !DILexicalBlock(scope: !1641, file: !33, line: 112, column: 40)
!1646 = !DILocation(line: 124, column: 3, scope: !1647)
!1647 = distinct !DILexicalBlock(scope: !1630, file: !33, line: 124, column: 3)
!1648 = !DILocation(line: 113, scope: !1644)
!1649 = !DILocalVariable(name: "start", scope: !1630, file: !33, line: 107, type: !14)
!1650 = !DILocation(line: 113, column: 27, scope: !1651)
!1651 = distinct !DILexicalBlock(scope: !1644, file: !33, line: 113, column: 5)
!1652 = !DILocation(line: 114, column: 14, scope: !1653)
!1653 = distinct !DILexicalBlock(scope: !1651, file: !33, line: 113, column: 51)
!1654 = !DILocalVariable(name: "zeta", scope: !1630, file: !33, line: 108, type: !36)
!1655 = !DILocalVariable(name: "j", scope: !1630, file: !33, line: 107, type: !14)
!1656 = !DILocation(line: 115, column: 12, scope: !1657)
!1657 = distinct !DILexicalBlock(scope: !1653, file: !33, line: 115, column: 7)
!1658 = !DILocation(line: 115, scope: !1657)
!1659 = !DILocation(line: 115, column: 33, scope: !1660)
!1660 = distinct !DILexicalBlock(scope: !1657, file: !33, line: 115, column: 7)
!1661 = !DILocation(line: 115, column: 25, scope: !1660)
!1662 = !DILocation(line: 115, column: 7, scope: !1657)
!1663 = !DILocation(line: 116, column: 13, scope: !1664)
!1664 = distinct !DILexicalBlock(scope: !1660, file: !33, line: 115, column: 45)
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
!1679 = !DILocation(line: 115, column: 41, scope: !1660)
!1680 = !DILocation(line: 115, column: 7, scope: !1660)
!1681 = distinct !{!1681, !1662, !1682, !107}
!1682 = !DILocation(line: 120, column: 7, scope: !1657)
!1683 = !DILocation(line: 114, column: 21, scope: !1653)
!1684 = !DILocation(line: 113, column: 44, scope: !1651)
!1685 = !DILocation(line: 113, column: 5, scope: !1651)
!1686 = distinct !{!1686, !1643, !1687, !107}
!1687 = !DILocation(line: 121, column: 5, scope: !1644)
!1688 = !DILocation(line: 112, column: 33, scope: !1641)
!1689 = !DILocation(line: 112, column: 3, scope: !1641)
!1690 = distinct !{!1690, !1642, !1691, !107}
!1691 = !DILocation(line: 122, column: 3, scope: !1637)
!1692 = !DILocation(line: 124, scope: !1647)
!1693 = !DILocation(line: 124, column: 17, scope: !1694)
!1694 = distinct !DILexicalBlock(scope: !1647, file: !33, line: 124, column: 3)
!1695 = !DILocation(line: 125, column: 18, scope: !1694)
!1696 = !DILocation(line: 125, column: 12, scope: !1694)
!1697 = !DILocation(line: 125, column: 5, scope: !1694)
!1698 = !DILocation(line: 125, column: 10, scope: !1694)
!1699 = !DILocation(line: 124, column: 25, scope: !1694)
!1700 = !DILocation(line: 124, column: 3, scope: !1694)
!1701 = distinct !{!1701, !1646, !1702, !107}
!1702 = !DILocation(line: 125, column: 25, scope: !1647)
!1703 = !DILocation(line: 129, column: 1, scope: !1630)
!1704 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_basemul", scope: !33, file: !33, line: 142, type: !1705, scopeLine: 143, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, retainedNodes: !24)
!1705 = !DISubroutineType(types: !1706)
!1706 = !{null, !400, !1707, !1707, !36}
!1707 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 32)
!1708 = !DILocalVariable(name: "r", arg: 1, scope: !1704, file: !33, line: 142, type: !400)
!1709 = !DILocation(line: 0, scope: !1704)
!1710 = !DILocalVariable(name: "a", arg: 2, scope: !1704, file: !33, line: 142, type: !1707)
!1711 = !DILocalVariable(name: "b", arg: 3, scope: !1704, file: !33, line: 142, type: !1707)
!1712 = !DILocalVariable(name: "zeta", arg: 4, scope: !1704, file: !33, line: 143, type: !36)
!1713 = !DILocation(line: 144, column: 16, scope: !1704)
!1714 = !DILocation(line: 144, column: 22, scope: !1704)
!1715 = !DILocation(line: 144, column: 10, scope: !1704)
!1716 = !DILocation(line: 144, column: 8, scope: !1704)
!1717 = !DILocation(line: 145, column: 10, scope: !1704)
!1718 = !DILocation(line: 145, column: 8, scope: !1704)
!1719 = !DILocation(line: 146, column: 17, scope: !1704)
!1720 = !DILocation(line: 146, column: 23, scope: !1704)
!1721 = !DILocation(line: 146, column: 11, scope: !1704)
!1722 = !DILocation(line: 146, column: 8, scope: !1704)
!1723 = !DILocation(line: 147, column: 16, scope: !1704)
!1724 = !DILocation(line: 147, column: 22, scope: !1704)
!1725 = !DILocation(line: 147, column: 10, scope: !1704)
!1726 = !DILocation(line: 147, column: 3, scope: !1704)
!1727 = !DILocation(line: 147, column: 8, scope: !1704)
!1728 = !DILocation(line: 148, column: 17, scope: !1704)
!1729 = !DILocation(line: 148, column: 23, scope: !1704)
!1730 = !DILocation(line: 148, column: 11, scope: !1704)
!1731 = !DILocation(line: 148, column: 3, scope: !1704)
!1732 = !DILocation(line: 148, column: 8, scope: !1704)
!1733 = !DILocation(line: 150, column: 1, scope: !1704)
!1734 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_cbd_eta1", scope: !1735, file: !1735, line: 108, type: !1165, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !69, retainedNodes: !24)
!1735 = !DIFile(filename: "../../../ref/cbd.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!1736 = !DILocalVariable(name: "r", arg: 1, scope: !1734, file: !1735, line: 108, type: !631)
!1737 = !DILocation(line: 0, scope: !1734)
!1738 = !DILocalVariable(name: "buf", arg: 2, scope: !1734, file: !1735, line: 108, type: !234)
!1739 = !DILocation(line: 110, column: 3, scope: !1734)
!1740 = !DILocation(line: 119, column: 1, scope: !1734)
!1741 = distinct !DISubprogram(name: "cbd2", scope: !1735, file: !1735, line: 56, type: !1165, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !69, retainedNodes: !24)
!1742 = !DILocalVariable(name: "r", arg: 1, scope: !1741, file: !1735, line: 56, type: !631)
!1743 = !DILocation(line: 0, scope: !1741)
!1744 = !DILocalVariable(name: "buf", arg: 2, scope: !1741, file: !1735, line: 56, type: !234)
!1745 = !DILocalVariable(name: "i", scope: !1741, file: !1735, line: 57, type: !14)
!1746 = !DILocation(line: 61, column: 8, scope: !1747)
!1747 = distinct !DILexicalBlock(scope: !1741, file: !1735, line: 61, column: 3)
!1748 = !DILocation(line: 61, scope: !1747)
!1749 = !DILocation(line: 61, column: 17, scope: !1750)
!1750 = distinct !DILexicalBlock(scope: !1747, file: !1735, line: 61, column: 3)
!1751 = !DILocation(line: 61, column: 3, scope: !1747)
!1752 = !DILocation(line: 62, column: 37, scope: !1753)
!1753 = distinct !DILexicalBlock(scope: !1750, file: !1735, line: 61, column: 37)
!1754 = !DILocation(line: 62, column: 33, scope: !1753)
!1755 = !DILocation(line: 62, column: 9, scope: !1753)
!1756 = !DILocalVariable(name: "t", scope: !1741, file: !1735, line: 58, type: !65)
!1757 = !DILocation(line: 63, column: 11, scope: !1753)
!1758 = !DILocalVariable(name: "d", scope: !1741, file: !1735, line: 58, type: !65)
!1759 = !DILocation(line: 64, column: 13, scope: !1753)
!1760 = !DILocation(line: 64, column: 19, scope: !1753)
!1761 = !DILocation(line: 64, column: 7, scope: !1753)
!1762 = !DILocalVariable(name: "j", scope: !1741, file: !1735, line: 57, type: !14)
!1763 = !DILocation(line: 66, column: 10, scope: !1764)
!1764 = distinct !DILexicalBlock(scope: !1753, file: !1735, line: 66, column: 5)
!1765 = !DILocation(line: 66, scope: !1764)
!1766 = !DILocation(line: 66, column: 19, scope: !1767)
!1767 = distinct !DILexicalBlock(scope: !1764, file: !1735, line: 66, column: 5)
!1768 = !DILocation(line: 66, column: 5, scope: !1764)
!1769 = !DILocation(line: 67, column: 20, scope: !1770)
!1770 = distinct !DILexicalBlock(scope: !1767, file: !1735, line: 66, column: 29)
!1771 = !DILocation(line: 67, column: 14, scope: !1770)
!1772 = !DILocation(line: 67, column: 11, scope: !1770)
!1773 = !DILocalVariable(name: "a", scope: !1741, file: !1735, line: 59, type: !36)
!1774 = !DILocation(line: 68, column: 20, scope: !1770)
!1775 = !DILocation(line: 68, column: 24, scope: !1770)
!1776 = !DILocation(line: 68, column: 14, scope: !1770)
!1777 = !DILocation(line: 68, column: 11, scope: !1770)
!1778 = !DILocalVariable(name: "b", scope: !1741, file: !1735, line: 59, type: !36)
!1779 = !DILocation(line: 69, column: 27, scope: !1770)
!1780 = !DILocation(line: 69, column: 25, scope: !1770)
!1781 = !DILocation(line: 69, column: 14, scope: !1770)
!1782 = !DILocation(line: 69, column: 18, scope: !1770)
!1783 = !DILocation(line: 69, column: 7, scope: !1770)
!1784 = !DILocation(line: 69, column: 23, scope: !1770)
!1785 = !DILocation(line: 66, column: 25, scope: !1767)
!1786 = !DILocation(line: 66, column: 5, scope: !1767)
!1787 = distinct !{!1787, !1768, !1788, !107}
!1788 = !DILocation(line: 70, column: 5, scope: !1764)
!1789 = !DILocation(line: 61, column: 33, scope: !1750)
!1790 = !DILocation(line: 61, column: 3, scope: !1750)
!1791 = distinct !{!1791, !1751, !1792, !107}
!1792 = !DILocation(line: 71, column: 3, scope: !1747)
!1793 = !DILocation(line: 74, column: 1, scope: !1741)
!1794 = distinct !DISubprogram(name: "load32_littleendian", scope: !1735, file: !1735, line: 16, type: !1795, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !69, retainedNodes: !24)
!1795 = !DISubroutineType(types: !1796)
!1796 = !{!65, !234}
!1797 = !DILocalVariable(name: "x", arg: 1, scope: !1794, file: !1735, line: 16, type: !234)
!1798 = !DILocation(line: 0, scope: !1794)
!1799 = !DILocation(line: 18, column: 17, scope: !1794)
!1800 = !DILocation(line: 18, column: 7, scope: !1794)
!1801 = !DILocalVariable(name: "r", scope: !1794, file: !1735, line: 17, type: !65)
!1802 = !DILocation(line: 19, column: 18, scope: !1794)
!1803 = !DILocation(line: 19, column: 8, scope: !1794)
!1804 = !DILocation(line: 19, column: 23, scope: !1794)
!1805 = !DILocation(line: 19, column: 5, scope: !1794)
!1806 = !DILocation(line: 20, column: 18, scope: !1794)
!1807 = !DILocation(line: 20, column: 8, scope: !1794)
!1808 = !DILocation(line: 20, column: 23, scope: !1794)
!1809 = !DILocation(line: 20, column: 5, scope: !1794)
!1810 = !DILocation(line: 21, column: 18, scope: !1794)
!1811 = !DILocation(line: 21, column: 8, scope: !1794)
!1812 = !DILocation(line: 21, column: 23, scope: !1794)
!1813 = !DILocation(line: 21, column: 5, scope: !1794)
!1814 = !DILocation(line: 22, column: 3, scope: !1794)
!1815 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_cbd_eta2", scope: !1735, file: !1735, line: 121, type: !1165, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !69, retainedNodes: !24)
!1816 = !DILocalVariable(name: "r", arg: 1, scope: !1815, file: !1735, line: 121, type: !631)
!1817 = !DILocation(line: 0, scope: !1815)
!1818 = !DILocalVariable(name: "buf", arg: 2, scope: !1815, file: !1735, line: 121, type: !234)
!1819 = !DILocation(line: 123, column: 3, scope: !1815)
!1820 = !DILocation(line: 130, column: 1, scope: !1815)
!1821 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_montgomery_reduce", scope: !1822, file: !1822, line: 18, type: !1823, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !71, retainedNodes: !24)
!1822 = !DIFile(filename: "../../../ref/reduce.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!1823 = !DISubroutineType(types: !72)
!1824 = !DILocalVariable(name: "a", arg: 1, scope: !1821, file: !1822, line: 18, type: !30)
!1825 = !DILocation(line: 0, scope: !1821)
!1826 = !DILocalVariable(name: "t", scope: !1821, file: !1822, line: 19, type: !36)
!1827 = !DILocation(line: 22, column: 12, scope: !1821)
!1828 = !DILocation(line: 22, column: 23, scope: !1821)
!1829 = !DILocation(line: 22, column: 10, scope: !1821)
!1830 = !DILocation(line: 22, column: 34, scope: !1821)
!1831 = !DILocation(line: 22, column: 7, scope: !1821)
!1832 = !DILocation(line: 23, column: 3, scope: !1821)
!1833 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_barrett_reduce", scope: !1822, file: !1822, line: 37, type: !1834, scopeLine: 37, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !71, retainedNodes: !24)
!1834 = !DISubroutineType(types: !1835)
!1835 = !{!36, !36}
!1836 = !DILocalVariable(name: "a", arg: 1, scope: !1833, file: !1822, line: 37, type: !36)
!1837 = !DILocation(line: 0, scope: !1833)
!1838 = !DILocalVariable(name: "v", scope: !1833, file: !1822, line: 39, type: !35)
!1839 = !DILocation(line: 41, column: 21, scope: !1833)
!1840 = !DILocation(line: 41, column: 19, scope: !1833)
!1841 = !DILocation(line: 41, column: 23, scope: !1833)
!1842 = !DILocation(line: 41, column: 36, scope: !1833)
!1843 = !DILocalVariable(name: "t", scope: !1833, file: !1822, line: 38, type: !36)
!1844 = !DILocation(line: 43, column: 15, scope: !1833)
!1845 = !DILocalVariable(name: "c", scope: !1833, file: !1822, line: 43, type: !36)
!1846 = !DILocation(line: 45, column: 3, scope: !1833)
!1847 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_verify", scope: !1848, file: !1848, line: 17, type: !1849, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !73, retainedNodes: !24)
!1848 = !DIFile(filename: "../../../ref/verify.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!1849 = !DISubroutineType(types: !1850)
!1850 = !{!25, !234, !234, !12}
!1851 = !DILocalVariable(name: "a", arg: 1, scope: !1847, file: !1848, line: 17, type: !234)
!1852 = !DILocation(line: 0, scope: !1847)
!1853 = !DILocalVariable(name: "b", arg: 2, scope: !1847, file: !1848, line: 17, type: !234)
!1854 = !DILocalVariable(name: "len", arg: 3, scope: !1847, file: !1848, line: 17, type: !12)
!1855 = !DILocalVariable(name: "r", scope: !1847, file: !1848, line: 19, type: !7)
!1856 = !DILocalVariable(name: "i", scope: !1847, file: !1848, line: 18, type: !12)
!1857 = !DILocation(line: 21, column: 8, scope: !1858)
!1858 = distinct !DILexicalBlock(scope: !1847, file: !1848, line: 21, column: 3)
!1859 = !DILocation(line: 21, scope: !1858)
!1860 = !DILocation(line: 21, column: 17, scope: !1861)
!1861 = distinct !DILexicalBlock(scope: !1858, file: !1848, line: 21, column: 3)
!1862 = !DILocation(line: 21, column: 3, scope: !1858)
!1863 = !DILocation(line: 22, column: 10, scope: !1861)
!1864 = !DILocation(line: 22, column: 17, scope: !1861)
!1865 = !DILocation(line: 22, column: 15, scope: !1861)
!1866 = !DILocation(line: 22, column: 7, scope: !1861)
!1867 = !DILocation(line: 21, column: 25, scope: !1861)
!1868 = !DILocation(line: 21, column: 3, scope: !1861)
!1869 = distinct !{!1869, !1862, !1870, !107}
!1870 = !DILocation(line: 22, column: 20, scope: !1858)
!1871 = !DILocation(line: 25, column: 25, scope: !1847)
!1872 = !DILocation(line: 25, column: 10, scope: !1847)
!1873 = !DILocation(line: 25, column: 3, scope: !1847)
!1874 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_cmov", scope: !1848, file: !1848, line: 41, type: !1875, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !73, retainedNodes: !24)
!1875 = !DISubroutineType(types: !1876)
!1876 = !{null, !6, !234, !12, !7}
!1877 = !DILocalVariable(name: "r", arg: 1, scope: !1874, file: !1848, line: 41, type: !6)
!1878 = !DILocation(line: 0, scope: !1874)
!1879 = !DILocalVariable(name: "x", arg: 2, scope: !1874, file: !1848, line: 41, type: !234)
!1880 = !DILocalVariable(name: "len", arg: 3, scope: !1874, file: !1848, line: 41, type: !12)
!1881 = !DILocalVariable(name: "b", arg: 4, scope: !1874, file: !1848, line: 41, type: !7)
!1882 = !DILocation(line: 51, column: 3, scope: !1874)
!1883 = !{i64 1821}
!1884 = !DILocation(line: 54, column: 7, scope: !1874)
!1885 = !DILocalVariable(name: "i", scope: !1874, file: !1848, line: 42, type: !12)
!1886 = !DILocation(line: 55, column: 8, scope: !1887)
!1887 = distinct !DILexicalBlock(scope: !1874, file: !1848, line: 55, column: 3)
!1888 = !DILocation(line: 55, scope: !1887)
!1889 = !DILocation(line: 55, column: 17, scope: !1890)
!1890 = distinct !DILexicalBlock(scope: !1887, file: !1848, line: 55, column: 3)
!1891 = !DILocation(line: 55, column: 3, scope: !1887)
!1892 = !DILocation(line: 56, column: 18, scope: !1890)
!1893 = !DILocation(line: 56, column: 25, scope: !1890)
!1894 = !DILocation(line: 56, column: 23, scope: !1890)
!1895 = !DILocation(line: 56, column: 15, scope: !1890)
!1896 = !DILocation(line: 56, column: 5, scope: !1890)
!1897 = !DILocation(line: 56, column: 10, scope: !1890)
!1898 = !DILocation(line: 55, column: 25, scope: !1890)
!1899 = !DILocation(line: 55, column: 3, scope: !1890)
!1900 = distinct !{!1900, !1891, !1901, !107}
!1901 = !DILocation(line: 56, column: 29, scope: !1887)
!1902 = !DILocation(line: 58, column: 1, scope: !1874)
!1903 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_cmov_int16", scope: !1848, file: !1848, line: 71, type: !1904, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !73, retainedNodes: !24)
!1904 = !DISubroutineType(types: !1905)
!1905 = !{null, !400, !36, !60}
!1906 = !DILocalVariable(name: "r", arg: 1, scope: !1903, file: !1848, line: 71, type: !400)
!1907 = !DILocation(line: 0, scope: !1903)
!1908 = !DILocalVariable(name: "v", arg: 2, scope: !1903, file: !1848, line: 71, type: !36)
!1909 = !DILocalVariable(name: "b", arg: 3, scope: !1903, file: !1848, line: 71, type: !60)
!1910 = !DILocation(line: 72, column: 7, scope: !1903)
!1911 = !DILocation(line: 73, column: 15, scope: !1903)
!1912 = !DILocation(line: 73, column: 19, scope: !1903)
!1913 = !DILocation(line: 73, column: 11, scope: !1903)
!1914 = !DILocation(line: 73, column: 6, scope: !1903)
!1915 = !DILocation(line: 74, column: 1, scope: !1903)
!1916 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_init", scope: !49, file: !49, line: 506, type: !1917, scopeLine: 506, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!1917 = !DISubroutineType(types: !1918)
!1918 = !{null, !1919}
!1919 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !346, size: 32)
!1920 = !DILocalVariable(name: "state", arg: 1, scope: !1916, file: !49, line: 506, type: !1919)
!1921 = !DILocation(line: 0, scope: !1916)
!1922 = !DILocation(line: 507, column: 3, scope: !1916)
!1923 = !DILocation(line: 508, column: 3, scope: !1916)
!1924 = !DILocation(line: 508, column: 29, scope: !1916)
!1925 = !DILocation(line: 510, column: 1, scope: !1916)
!1926 = distinct !DISubprogram(name: "keccak_init", scope: !49, file: !49, line: 343, type: !1927, scopeLine: 343, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!1927 = !DISubroutineType(types: !1928)
!1928 = !{null, !1929}
!1929 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 32)
!1930 = !DILocalVariable(name: "s", arg: 1, scope: !1926, file: !49, line: 343, type: !1929)
!1931 = !DILocation(line: 0, scope: !1926)
!1932 = !DILocalVariable(name: "i", scope: !1926, file: !49, line: 344, type: !14)
!1933 = !DILocation(line: 345, column: 8, scope: !1934)
!1934 = distinct !DILexicalBlock(scope: !1926, file: !49, line: 345, column: 3)
!1935 = !DILocation(line: 345, scope: !1934)
!1936 = !DILocation(line: 345, column: 17, scope: !1937)
!1937 = distinct !DILexicalBlock(scope: !1934, file: !49, line: 345, column: 3)
!1938 = !DILocation(line: 345, column: 3, scope: !1934)
!1939 = !DILocation(line: 346, column: 5, scope: !1937)
!1940 = !DILocation(line: 346, column: 10, scope: !1937)
!1941 = !DILocation(line: 345, column: 24, scope: !1937)
!1942 = !DILocation(line: 345, column: 3, scope: !1937)
!1943 = distinct !{!1943, !1938, !1944, !107}
!1944 = !DILocation(line: 346, column: 12, scope: !1934)
!1945 = !DILocation(line: 348, column: 1, scope: !1926)
!1946 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb", scope: !49, file: !49, line: 522, type: !1947, scopeLine: 522, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!1947 = !DISubroutineType(types: !1948)
!1948 = !{null, !1919, !234, !12}
!1949 = !DILocalVariable(name: "state", arg: 1, scope: !1946, file: !49, line: 522, type: !1919)
!1950 = !DILocation(line: 0, scope: !1946)
!1951 = !DILocalVariable(name: "in", arg: 2, scope: !1946, file: !49, line: 522, type: !234)
!1952 = !DILocalVariable(name: "inlen", arg: 3, scope: !1946, file: !49, line: 522, type: !12)
!1953 = !DILocation(line: 523, column: 53, scope: !1946)
!1954 = !DILocation(line: 523, column: 31, scope: !1946)
!1955 = !DILocation(line: 523, column: 3, scope: !1946)
!1956 = !DILocation(line: 523, column: 29, scope: !1946)
!1957 = !DILocation(line: 526, column: 1, scope: !1946)
!1958 = distinct !DISubprogram(name: "keccak_absorb", scope: !49, file: !49, line: 363, type: !1959, scopeLine: 365, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!1959 = !DISubroutineType(types: !1960)
!1960 = !{!14, !1929, !14, !14, !234, !12}
!1961 = !DILocalVariable(name: "s", arg: 1, scope: !1958, file: !49, line: 363, type: !1929)
!1962 = !DILocation(line: 0, scope: !1958)
!1963 = !DILocalVariable(name: "pos", arg: 2, scope: !1958, file: !49, line: 363, type: !14)
!1964 = !DILocalVariable(name: "r", arg: 3, scope: !1958, file: !49, line: 364, type: !14)
!1965 = !DILocalVariable(name: "in", arg: 4, scope: !1958, file: !49, line: 364, type: !234)
!1966 = !DILocalVariable(name: "inlen", arg: 5, scope: !1958, file: !49, line: 365, type: !12)
!1967 = !DILocation(line: 368, column: 3, scope: !1958)
!1968 = !DILocation(line: 368, column: 14, scope: !1958)
!1969 = !DILocation(line: 368, column: 22, scope: !1958)
!1970 = !DILocation(line: 369, column: 5, scope: !1971)
!1971 = distinct !DILexicalBlock(scope: !1972, file: !49, line: 369, column: 5)
!1972 = distinct !DILexicalBlock(scope: !1958, file: !49, line: 368, column: 28)
!1973 = !DILocation(line: 376, column: 3, scope: !1974)
!1974 = distinct !DILexicalBlock(scope: !1958, file: !49, line: 376, column: 3)
!1975 = !DILocation(line: 369, scope: !1971)
!1976 = !DILocalVariable(name: "i", scope: !1958, file: !49, line: 366, type: !14)
!1977 = !DILocation(line: 369, column: 21, scope: !1978)
!1978 = distinct !DILexicalBlock(scope: !1971, file: !49, line: 369, column: 5)
!1979 = !DILocation(line: 370, column: 29, scope: !1978)
!1980 = !DILocation(line: 370, column: 19, scope: !1978)
!1981 = !DILocation(line: 370, column: 40, scope: !1978)
!1982 = !DILocation(line: 370, column: 35, scope: !1978)
!1983 = !DILocation(line: 370, column: 11, scope: !1978)
!1984 = !DILocation(line: 370, column: 7, scope: !1978)
!1985 = !DILocation(line: 370, column: 16, scope: !1978)
!1986 = !DILocation(line: 370, column: 32, scope: !1978)
!1987 = !DILocation(line: 369, column: 27, scope: !1978)
!1988 = !DILocation(line: 369, column: 5, scope: !1978)
!1989 = distinct !{!1989, !1970, !1990, !107}
!1990 = !DILocation(line: 370, column: 48, scope: !1971)
!1991 = !DILocation(line: 371, column: 16, scope: !1972)
!1992 = !DILocation(line: 371, column: 11, scope: !1972)
!1993 = !DILocation(line: 372, column: 5, scope: !1972)
!1994 = distinct !{!1994, !1967, !1995, !107}
!1995 = !DILocation(line: 374, column: 3, scope: !1958)
!1996 = !DILocation(line: 376, scope: !1974)
!1997 = !DILocation(line: 376, column: 25, scope: !1998)
!1998 = distinct !DILexicalBlock(scope: !1974, file: !49, line: 376, column: 3)
!1999 = !DILocation(line: 376, column: 19, scope: !1998)
!2000 = !DILocation(line: 377, column: 27, scope: !1998)
!2001 = !DILocation(line: 377, column: 17, scope: !1998)
!2002 = !DILocation(line: 377, column: 38, scope: !1998)
!2003 = !DILocation(line: 377, column: 33, scope: !1998)
!2004 = !DILocation(line: 377, column: 9, scope: !1998)
!2005 = !DILocation(line: 377, column: 5, scope: !1998)
!2006 = !DILocation(line: 377, column: 14, scope: !1998)
!2007 = !DILocation(line: 377, column: 30, scope: !1998)
!2008 = !DILocation(line: 376, column: 35, scope: !1998)
!2009 = !DILocation(line: 376, column: 3, scope: !1998)
!2010 = distinct !{!2010, !1973, !2011, !107}
!2011 = !DILocation(line: 377, column: 46, scope: !1974)
!2012 = !DILocation(line: 380, column: 3, scope: !1958)
!2013 = distinct !DISubprogram(name: "KeccakF1600_StatePermute", scope: !49, file: !49, line: 73, type: !1927, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2014 = !DILocalVariable(name: "state", arg: 1, scope: !2013, file: !49, line: 73, type: !1929)
!2015 = !DILocation(line: 0, scope: !2013)
!2016 = !DILocation(line: 90, column: 9, scope: !2013)
!2017 = !DILocalVariable(name: "Aba", scope: !2013, file: !49, line: 76, type: !45)
!2018 = !DILocation(line: 91, column: 9, scope: !2013)
!2019 = !DILocalVariable(name: "Abe", scope: !2013, file: !49, line: 76, type: !45)
!2020 = !DILocation(line: 92, column: 9, scope: !2013)
!2021 = !DILocalVariable(name: "Abi", scope: !2013, file: !49, line: 76, type: !45)
!2022 = !DILocation(line: 93, column: 9, scope: !2013)
!2023 = !DILocalVariable(name: "Abo", scope: !2013, file: !49, line: 76, type: !45)
!2024 = !DILocation(line: 94, column: 9, scope: !2013)
!2025 = !DILocalVariable(name: "Abu", scope: !2013, file: !49, line: 76, type: !45)
!2026 = !DILocation(line: 95, column: 9, scope: !2013)
!2027 = !DILocalVariable(name: "Aga", scope: !2013, file: !49, line: 77, type: !45)
!2028 = !DILocation(line: 96, column: 9, scope: !2013)
!2029 = !DILocalVariable(name: "Age", scope: !2013, file: !49, line: 77, type: !45)
!2030 = !DILocation(line: 97, column: 9, scope: !2013)
!2031 = !DILocalVariable(name: "Agi", scope: !2013, file: !49, line: 77, type: !45)
!2032 = !DILocation(line: 98, column: 9, scope: !2013)
!2033 = !DILocalVariable(name: "Ago", scope: !2013, file: !49, line: 77, type: !45)
!2034 = !DILocation(line: 99, column: 9, scope: !2013)
!2035 = !DILocalVariable(name: "Agu", scope: !2013, file: !49, line: 77, type: !45)
!2036 = !DILocation(line: 100, column: 9, scope: !2013)
!2037 = !DILocalVariable(name: "Aka", scope: !2013, file: !49, line: 78, type: !45)
!2038 = !DILocation(line: 101, column: 9, scope: !2013)
!2039 = !DILocalVariable(name: "Ake", scope: !2013, file: !49, line: 78, type: !45)
!2040 = !DILocation(line: 102, column: 9, scope: !2013)
!2041 = !DILocalVariable(name: "Aki", scope: !2013, file: !49, line: 78, type: !45)
!2042 = !DILocation(line: 103, column: 9, scope: !2013)
!2043 = !DILocalVariable(name: "Ako", scope: !2013, file: !49, line: 78, type: !45)
!2044 = !DILocation(line: 104, column: 9, scope: !2013)
!2045 = !DILocalVariable(name: "Aku", scope: !2013, file: !49, line: 78, type: !45)
!2046 = !DILocation(line: 105, column: 9, scope: !2013)
!2047 = !DILocalVariable(name: "Ama", scope: !2013, file: !49, line: 79, type: !45)
!2048 = !DILocation(line: 106, column: 9, scope: !2013)
!2049 = !DILocalVariable(name: "Ame", scope: !2013, file: !49, line: 79, type: !45)
!2050 = !DILocation(line: 107, column: 9, scope: !2013)
!2051 = !DILocalVariable(name: "Ami", scope: !2013, file: !49, line: 79, type: !45)
!2052 = !DILocation(line: 108, column: 9, scope: !2013)
!2053 = !DILocalVariable(name: "Amo", scope: !2013, file: !49, line: 79, type: !45)
!2054 = !DILocation(line: 109, column: 9, scope: !2013)
!2055 = !DILocalVariable(name: "Amu", scope: !2013, file: !49, line: 79, type: !45)
!2056 = !DILocation(line: 110, column: 9, scope: !2013)
!2057 = !DILocalVariable(name: "Asa", scope: !2013, file: !49, line: 80, type: !45)
!2058 = !DILocation(line: 111, column: 9, scope: !2013)
!2059 = !DILocalVariable(name: "Ase", scope: !2013, file: !49, line: 80, type: !45)
!2060 = !DILocation(line: 112, column: 9, scope: !2013)
!2061 = !DILocalVariable(name: "Asi", scope: !2013, file: !49, line: 80, type: !45)
!2062 = !DILocation(line: 113, column: 9, scope: !2013)
!2063 = !DILocalVariable(name: "Aso", scope: !2013, file: !49, line: 80, type: !45)
!2064 = !DILocation(line: 114, column: 9, scope: !2013)
!2065 = !DILocalVariable(name: "Asu", scope: !2013, file: !49, line: 80, type: !45)
!2066 = !DILocalVariable(name: "round", scope: !2013, file: !49, line: 74, type: !25)
!2067 = !DILocation(line: 116, column: 8, scope: !2068)
!2068 = distinct !DILexicalBlock(scope: !2013, file: !49, line: 116, column: 3)
!2069 = !DILocation(line: 116, scope: !2068)
!2070 = !DILocation(line: 116, column: 25, scope: !2071)
!2071 = distinct !DILexicalBlock(scope: !2068, file: !49, line: 116, column: 3)
!2072 = !DILocation(line: 116, column: 3, scope: !2068)
!2073 = !DILocalVariable(name: "BCa", scope: !2013, file: !49, line: 81, type: !45)
!2074 = !DILocalVariable(name: "BCe", scope: !2013, file: !49, line: 81, type: !45)
!2075 = !DILocalVariable(name: "BCi", scope: !2013, file: !49, line: 81, type: !45)
!2076 = !DILocalVariable(name: "BCo", scope: !2013, file: !49, line: 81, type: !45)
!2077 = !DILocalVariable(name: "BCu", scope: !2013, file: !49, line: 81, type: !45)
!2078 = !DILocalVariable(name: "Da", scope: !2013, file: !49, line: 82, type: !45)
!2079 = !DILocalVariable(name: "De", scope: !2013, file: !49, line: 82, type: !45)
!2080 = !DILocalVariable(name: "Di", scope: !2013, file: !49, line: 82, type: !45)
!2081 = !DILocalVariable(name: "Do", scope: !2013, file: !49, line: 82, type: !45)
!2082 = !DILocalVariable(name: "Du", scope: !2013, file: !49, line: 82, type: !45)
!2083 = !DILocalVariable(name: "Eba", scope: !2013, file: !49, line: 83, type: !45)
!2084 = !DILocalVariable(name: "Ebe", scope: !2013, file: !49, line: 83, type: !45)
!2085 = !DILocalVariable(name: "Ebi", scope: !2013, file: !49, line: 83, type: !45)
!2086 = !DILocalVariable(name: "Ebo", scope: !2013, file: !49, line: 83, type: !45)
!2087 = !DILocalVariable(name: "Ebu", scope: !2013, file: !49, line: 83, type: !45)
!2088 = !DILocalVariable(name: "Ega", scope: !2013, file: !49, line: 84, type: !45)
!2089 = !DILocalVariable(name: "Ege", scope: !2013, file: !49, line: 84, type: !45)
!2090 = !DILocalVariable(name: "Egi", scope: !2013, file: !49, line: 84, type: !45)
!2091 = !DILocalVariable(name: "Ego", scope: !2013, file: !49, line: 84, type: !45)
!2092 = !DILocalVariable(name: "Egu", scope: !2013, file: !49, line: 84, type: !45)
!2093 = !DILocalVariable(name: "Eka", scope: !2013, file: !49, line: 85, type: !45)
!2094 = !DILocalVariable(name: "Eke", scope: !2013, file: !49, line: 85, type: !45)
!2095 = !DILocalVariable(name: "Eki", scope: !2013, file: !49, line: 85, type: !45)
!2096 = !DILocalVariable(name: "Eko", scope: !2013, file: !49, line: 85, type: !45)
!2097 = !DILocalVariable(name: "Eku", scope: !2013, file: !49, line: 85, type: !45)
!2098 = !DILocalVariable(name: "Ema", scope: !2013, file: !49, line: 86, type: !45)
!2099 = !DILocalVariable(name: "Eme", scope: !2013, file: !49, line: 86, type: !45)
!2100 = !DILocalVariable(name: "Emi", scope: !2013, file: !49, line: 86, type: !45)
!2101 = !DILocalVariable(name: "Emo", scope: !2013, file: !49, line: 86, type: !45)
!2102 = !DILocalVariable(name: "Emu", scope: !2013, file: !49, line: 86, type: !45)
!2103 = !DILocalVariable(name: "Esa", scope: !2013, file: !49, line: 87, type: !45)
!2104 = !DILocalVariable(name: "Ese", scope: !2013, file: !49, line: 87, type: !45)
!2105 = !DILocalVariable(name: "Esi", scope: !2013, file: !49, line: 87, type: !45)
!2106 = !DILocalVariable(name: "Eso", scope: !2013, file: !49, line: 87, type: !45)
!2107 = !DILocalVariable(name: "Esu", scope: !2013, file: !49, line: 87, type: !45)
!2108 = !DILocation(line: 120, column: 15, scope: !2109)
!2109 = distinct !DILexicalBlock(scope: !2071, file: !49, line: 116, column: 48)
!2110 = !DILocation(line: 120, column: 21, scope: !2109)
!2111 = !DILocation(line: 120, column: 27, scope: !2109)
!2112 = !DILocation(line: 120, column: 33, scope: !2109)
!2113 = !DILocation(line: 122, column: 15, scope: !2109)
!2114 = !DILocation(line: 122, column: 21, scope: !2109)
!2115 = !DILocation(line: 122, column: 27, scope: !2109)
!2116 = !DILocation(line: 122, column: 33, scope: !2109)
!2117 = !DILocation(line: 128, column: 16, scope: !2109)
!2118 = !DILocation(line: 128, column: 14, scope: !2109)
!2119 = !DILocation(line: 198, column: 9, scope: !2109)
!2120 = !DILocation(line: 199, column: 11, scope: !2109)
!2121 = !DILocation(line: 119, column: 15, scope: !2109)
!2122 = !DILocation(line: 119, column: 21, scope: !2109)
!2123 = !DILocation(line: 119, column: 27, scope: !2109)
!2124 = !DILocation(line: 119, column: 33, scope: !2109)
!2125 = !DILocation(line: 125, column: 16, scope: !2109)
!2126 = !DILocation(line: 125, column: 14, scope: !2109)
!2127 = !DILocation(line: 202, column: 9, scope: !2109)
!2128 = !DILocation(line: 203, column: 11, scope: !2109)
!2129 = !DILocation(line: 121, column: 15, scope: !2109)
!2130 = !DILocation(line: 121, column: 21, scope: !2109)
!2131 = !DILocation(line: 121, column: 27, scope: !2109)
!2132 = !DILocation(line: 121, column: 33, scope: !2109)
!2133 = !DILocation(line: 118, column: 15, scope: !2109)
!2134 = !DILocation(line: 118, column: 21, scope: !2109)
!2135 = !DILocation(line: 118, column: 27, scope: !2109)
!2136 = !DILocation(line: 118, column: 33, scope: !2109)
!2137 = !DILocation(line: 129, column: 16, scope: !2109)
!2138 = !DILocation(line: 129, column: 14, scope: !2109)
!2139 = !DILocation(line: 200, column: 9, scope: !2109)
!2140 = !DILocation(line: 201, column: 11, scope: !2109)
!2141 = !DILocation(line: 207, column: 19, scope: !2109)
!2142 = !DILocation(line: 207, column: 25, scope: !2109)
!2143 = !DILocation(line: 207, column: 15, scope: !2109)
!2144 = !DILocation(line: 127, column: 16, scope: !2109)
!2145 = !DILocation(line: 127, column: 14, scope: !2109)
!2146 = !DILocation(line: 135, column: 9, scope: !2109)
!2147 = !DILocation(line: 136, column: 11, scope: !2109)
!2148 = !DILocation(line: 126, column: 16, scope: !2109)
!2149 = !DILocation(line: 126, column: 14, scope: !2109)
!2150 = !DILocation(line: 133, column: 9, scope: !2109)
!2151 = !DILocation(line: 134, column: 11, scope: !2109)
!2152 = !DILocation(line: 141, column: 19, scope: !2109)
!2153 = !DILocation(line: 141, column: 25, scope: !2109)
!2154 = !DILocation(line: 142, column: 22, scope: !2109)
!2155 = !DILocation(line: 142, column: 9, scope: !2109)
!2156 = !DILocation(line: 131, column: 9, scope: !2109)
!2157 = !DILocation(line: 148, column: 9, scope: !2109)
!2158 = !DILocation(line: 149, column: 11, scope: !2109)
!2159 = !DILocation(line: 152, column: 9, scope: !2109)
!2160 = !DILocation(line: 153, column: 11, scope: !2109)
!2161 = !DILocation(line: 150, column: 9, scope: !2109)
!2162 = !DILocation(line: 151, column: 11, scope: !2109)
!2163 = !DILocation(line: 158, column: 19, scope: !2109)
!2164 = !DILocation(line: 158, column: 25, scope: !2109)
!2165 = !DILocation(line: 158, column: 15, scope: !2109)
!2166 = !DILocation(line: 213, column: 15, scope: !2109)
!2167 = !DILocation(line: 164, column: 9, scope: !2109)
!2168 = !DILocation(line: 165, column: 11, scope: !2109)
!2169 = !DILocation(line: 168, column: 9, scope: !2109)
!2170 = !DILocation(line: 169, column: 11, scope: !2109)
!2171 = !DILocation(line: 166, column: 9, scope: !2109)
!2172 = !DILocation(line: 167, column: 11, scope: !2109)
!2173 = !DILocation(line: 174, column: 19, scope: !2109)
!2174 = !DILocation(line: 174, column: 25, scope: !2109)
!2175 = !DILocation(line: 174, column: 15, scope: !2109)
!2176 = !DILocation(line: 213, column: 21, scope: !2109)
!2177 = !DILocation(line: 180, column: 9, scope: !2109)
!2178 = !DILocation(line: 181, column: 11, scope: !2109)
!2179 = !DILocation(line: 184, column: 9, scope: !2109)
!2180 = !DILocation(line: 185, column: 11, scope: !2109)
!2181 = !DILocation(line: 182, column: 9, scope: !2109)
!2182 = !DILocation(line: 183, column: 11, scope: !2109)
!2183 = !DILocation(line: 190, column: 19, scope: !2109)
!2184 = !DILocation(line: 190, column: 25, scope: !2109)
!2185 = !DILocation(line: 190, column: 15, scope: !2109)
!2186 = !DILocation(line: 213, column: 27, scope: !2109)
!2187 = !DILocation(line: 196, column: 9, scope: !2109)
!2188 = !DILocation(line: 197, column: 11, scope: !2109)
!2189 = !DILocation(line: 206, column: 19, scope: !2109)
!2190 = !DILocation(line: 206, column: 25, scope: !2109)
!2191 = !DILocation(line: 206, column: 15, scope: !2109)
!2192 = !DILocation(line: 213, column: 33, scope: !2109)
!2193 = !DILocation(line: 139, column: 9, scope: !2109)
!2194 = !DILocation(line: 140, column: 11, scope: !2109)
!2195 = !DILocation(line: 137, column: 9, scope: !2109)
!2196 = !DILocation(line: 138, column: 11, scope: !2109)
!2197 = !DILocation(line: 144, column: 19, scope: !2109)
!2198 = !DILocation(line: 144, column: 25, scope: !2109)
!2199 = !DILocation(line: 144, column: 15, scope: !2109)
!2200 = !DILocation(line: 156, column: 9, scope: !2109)
!2201 = !DILocation(line: 157, column: 11, scope: !2109)
!2202 = !DILocation(line: 154, column: 9, scope: !2109)
!2203 = !DILocation(line: 155, column: 11, scope: !2109)
!2204 = !DILocation(line: 160, column: 19, scope: !2109)
!2205 = !DILocation(line: 160, column: 25, scope: !2109)
!2206 = !DILocation(line: 160, column: 15, scope: !2109)
!2207 = !DILocation(line: 215, column: 15, scope: !2109)
!2208 = !DILocation(line: 172, column: 9, scope: !2109)
!2209 = !DILocation(line: 173, column: 11, scope: !2109)
!2210 = !DILocation(line: 170, column: 9, scope: !2109)
!2211 = !DILocation(line: 171, column: 11, scope: !2109)
!2212 = !DILocation(line: 176, column: 19, scope: !2109)
!2213 = !DILocation(line: 176, column: 25, scope: !2109)
!2214 = !DILocation(line: 176, column: 15, scope: !2109)
!2215 = !DILocation(line: 215, column: 21, scope: !2109)
!2216 = !DILocation(line: 188, column: 9, scope: !2109)
!2217 = !DILocation(line: 189, column: 11, scope: !2109)
!2218 = !DILocation(line: 186, column: 9, scope: !2109)
!2219 = !DILocation(line: 187, column: 11, scope: !2109)
!2220 = !DILocation(line: 192, column: 19, scope: !2109)
!2221 = !DILocation(line: 192, column: 25, scope: !2109)
!2222 = !DILocation(line: 192, column: 15, scope: !2109)
!2223 = !DILocation(line: 215, column: 27, scope: !2109)
!2224 = !DILocation(line: 204, column: 9, scope: !2109)
!2225 = !DILocation(line: 205, column: 11, scope: !2109)
!2226 = !DILocation(line: 208, column: 19, scope: !2109)
!2227 = !DILocation(line: 208, column: 25, scope: !2109)
!2228 = !DILocation(line: 208, column: 15, scope: !2109)
!2229 = !DILocation(line: 215, column: 33, scope: !2109)
!2230 = !DILocation(line: 221, column: 16, scope: !2109)
!2231 = !DILocation(line: 221, column: 14, scope: !2109)
!2232 = !DILocation(line: 299, column: 9, scope: !2109)
!2233 = !DILocation(line: 300, column: 11, scope: !2109)
!2234 = !DILocation(line: 161, column: 19, scope: !2109)
!2235 = !DILocation(line: 161, column: 25, scope: !2109)
!2236 = !DILocation(line: 161, column: 15, scope: !2109)
!2237 = !DILocation(line: 146, column: 19, scope: !2109)
!2238 = !DILocation(line: 146, column: 25, scope: !2109)
!2239 = !DILocation(line: 146, column: 15, scope: !2109)
!2240 = !DILocation(line: 162, column: 19, scope: !2109)
!2241 = !DILocation(line: 162, column: 25, scope: !2109)
!2242 = !DILocation(line: 162, column: 15, scope: !2109)
!2243 = !DILocation(line: 217, column: 15, scope: !2109)
!2244 = !DILocation(line: 178, column: 19, scope: !2109)
!2245 = !DILocation(line: 178, column: 25, scope: !2109)
!2246 = !DILocation(line: 178, column: 15, scope: !2109)
!2247 = !DILocation(line: 217, column: 21, scope: !2109)
!2248 = !DILocation(line: 194, column: 19, scope: !2109)
!2249 = !DILocation(line: 194, column: 25, scope: !2109)
!2250 = !DILocation(line: 194, column: 15, scope: !2109)
!2251 = !DILocation(line: 217, column: 27, scope: !2109)
!2252 = !DILocation(line: 210, column: 19, scope: !2109)
!2253 = !DILocation(line: 210, column: 25, scope: !2109)
!2254 = !DILocation(line: 210, column: 15, scope: !2109)
!2255 = !DILocation(line: 217, column: 33, scope: !2109)
!2256 = !DILocation(line: 223, column: 16, scope: !2109)
!2257 = !DILocation(line: 223, column: 14, scope: !2109)
!2258 = !DILocation(line: 293, column: 9, scope: !2109)
!2259 = !DILocation(line: 294, column: 11, scope: !2109)
!2260 = !DILocation(line: 143, column: 19, scope: !2109)
!2261 = !DILocation(line: 143, column: 25, scope: !2109)
!2262 = !DILocation(line: 143, column: 15, scope: !2109)
!2263 = !DILocation(line: 159, column: 19, scope: !2109)
!2264 = !DILocation(line: 159, column: 25, scope: !2109)
!2265 = !DILocation(line: 159, column: 15, scope: !2109)
!2266 = !DILocation(line: 214, column: 15, scope: !2109)
!2267 = !DILocation(line: 175, column: 19, scope: !2109)
!2268 = !DILocation(line: 175, column: 25, scope: !2109)
!2269 = !DILocation(line: 175, column: 15, scope: !2109)
!2270 = !DILocation(line: 214, column: 21, scope: !2109)
!2271 = !DILocation(line: 191, column: 19, scope: !2109)
!2272 = !DILocation(line: 191, column: 25, scope: !2109)
!2273 = !DILocation(line: 191, column: 15, scope: !2109)
!2274 = !DILocation(line: 214, column: 27, scope: !2109)
!2275 = !DILocation(line: 214, column: 33, scope: !2109)
!2276 = !DILocation(line: 145, column: 19, scope: !2109)
!2277 = !DILocation(line: 145, column: 25, scope: !2109)
!2278 = !DILocation(line: 145, column: 15, scope: !2109)
!2279 = !DILocation(line: 216, column: 15, scope: !2109)
!2280 = !DILocation(line: 177, column: 19, scope: !2109)
!2281 = !DILocation(line: 177, column: 25, scope: !2109)
!2282 = !DILocation(line: 177, column: 15, scope: !2109)
!2283 = !DILocation(line: 216, column: 21, scope: !2109)
!2284 = !DILocation(line: 193, column: 19, scope: !2109)
!2285 = !DILocation(line: 193, column: 25, scope: !2109)
!2286 = !DILocation(line: 193, column: 15, scope: !2109)
!2287 = !DILocation(line: 216, column: 27, scope: !2109)
!2288 = !DILocation(line: 209, column: 19, scope: !2109)
!2289 = !DILocation(line: 209, column: 25, scope: !2109)
!2290 = !DILocation(line: 209, column: 15, scope: !2109)
!2291 = !DILocation(line: 216, column: 33, scope: !2109)
!2292 = !DILocation(line: 222, column: 16, scope: !2109)
!2293 = !DILocation(line: 222, column: 14, scope: !2109)
!2294 = !DILocation(line: 291, column: 9, scope: !2109)
!2295 = !DILocation(line: 292, column: 11, scope: !2109)
!2296 = !DILocation(line: 305, column: 19, scope: !2109)
!2297 = !DILocation(line: 305, column: 25, scope: !2109)
!2298 = !DILocation(line: 305, column: 15, scope: !2109)
!2299 = !DILocation(line: 220, column: 16, scope: !2109)
!2300 = !DILocation(line: 220, column: 14, scope: !2109)
!2301 = !DILocation(line: 297, column: 9, scope: !2109)
!2302 = !DILocation(line: 298, column: 11, scope: !2109)
!2303 = !DILocation(line: 304, column: 19, scope: !2109)
!2304 = !DILocation(line: 304, column: 25, scope: !2109)
!2305 = !DILocation(line: 304, column: 15, scope: !2109)
!2306 = !DILocation(line: 224, column: 16, scope: !2109)
!2307 = !DILocation(line: 224, column: 14, scope: !2109)
!2308 = !DILocation(line: 295, column: 9, scope: !2109)
!2309 = !DILocation(line: 296, column: 11, scope: !2109)
!2310 = !DILocation(line: 303, column: 19, scope: !2109)
!2311 = !DILocation(line: 303, column: 25, scope: !2109)
!2312 = !DILocation(line: 303, column: 15, scope: !2109)
!2313 = !DILocation(line: 302, column: 19, scope: !2109)
!2314 = !DILocation(line: 302, column: 25, scope: !2109)
!2315 = !DILocation(line: 302, column: 15, scope: !2109)
!2316 = !DILocation(line: 301, column: 19, scope: !2109)
!2317 = !DILocation(line: 301, column: 25, scope: !2109)
!2318 = !DILocation(line: 301, column: 15, scope: !2109)
!2319 = !DILocation(line: 283, column: 9, scope: !2109)
!2320 = !DILocation(line: 284, column: 11, scope: !2109)
!2321 = !DILocation(line: 277, column: 9, scope: !2109)
!2322 = !DILocation(line: 278, column: 11, scope: !2109)
!2323 = !DILocation(line: 275, column: 9, scope: !2109)
!2324 = !DILocation(line: 276, column: 11, scope: !2109)
!2325 = !DILocation(line: 289, column: 19, scope: !2109)
!2326 = !DILocation(line: 289, column: 25, scope: !2109)
!2327 = !DILocation(line: 289, column: 15, scope: !2109)
!2328 = !DILocation(line: 281, column: 9, scope: !2109)
!2329 = !DILocation(line: 282, column: 11, scope: !2109)
!2330 = !DILocation(line: 288, column: 19, scope: !2109)
!2331 = !DILocation(line: 288, column: 25, scope: !2109)
!2332 = !DILocation(line: 288, column: 15, scope: !2109)
!2333 = !DILocation(line: 279, column: 9, scope: !2109)
!2334 = !DILocation(line: 280, column: 11, scope: !2109)
!2335 = !DILocation(line: 287, column: 19, scope: !2109)
!2336 = !DILocation(line: 287, column: 25, scope: !2109)
!2337 = !DILocation(line: 287, column: 15, scope: !2109)
!2338 = !DILocation(line: 286, column: 19, scope: !2109)
!2339 = !DILocation(line: 286, column: 25, scope: !2109)
!2340 = !DILocation(line: 286, column: 15, scope: !2109)
!2341 = !DILocation(line: 285, column: 19, scope: !2109)
!2342 = !DILocation(line: 285, column: 25, scope: !2109)
!2343 = !DILocation(line: 285, column: 15, scope: !2109)
!2344 = !DILocation(line: 267, column: 9, scope: !2109)
!2345 = !DILocation(line: 268, column: 11, scope: !2109)
!2346 = !DILocation(line: 261, column: 9, scope: !2109)
!2347 = !DILocation(line: 262, column: 11, scope: !2109)
!2348 = !DILocation(line: 259, column: 9, scope: !2109)
!2349 = !DILocation(line: 260, column: 11, scope: !2109)
!2350 = !DILocation(line: 273, column: 19, scope: !2109)
!2351 = !DILocation(line: 273, column: 25, scope: !2109)
!2352 = !DILocation(line: 273, column: 15, scope: !2109)
!2353 = !DILocation(line: 265, column: 9, scope: !2109)
!2354 = !DILocation(line: 266, column: 11, scope: !2109)
!2355 = !DILocation(line: 272, column: 19, scope: !2109)
!2356 = !DILocation(line: 272, column: 25, scope: !2109)
!2357 = !DILocation(line: 272, column: 15, scope: !2109)
!2358 = !DILocation(line: 263, column: 9, scope: !2109)
!2359 = !DILocation(line: 264, column: 11, scope: !2109)
!2360 = !DILocation(line: 271, column: 19, scope: !2109)
!2361 = !DILocation(line: 271, column: 25, scope: !2109)
!2362 = !DILocation(line: 271, column: 15, scope: !2109)
!2363 = !DILocation(line: 270, column: 19, scope: !2109)
!2364 = !DILocation(line: 270, column: 25, scope: !2109)
!2365 = !DILocation(line: 270, column: 15, scope: !2109)
!2366 = !DILocation(line: 269, column: 19, scope: !2109)
!2367 = !DILocation(line: 269, column: 25, scope: !2109)
!2368 = !DILocation(line: 269, column: 15, scope: !2109)
!2369 = !DILocation(line: 251, column: 9, scope: !2109)
!2370 = !DILocation(line: 252, column: 11, scope: !2109)
!2371 = !DILocation(line: 245, column: 9, scope: !2109)
!2372 = !DILocation(line: 246, column: 11, scope: !2109)
!2373 = !DILocation(line: 243, column: 9, scope: !2109)
!2374 = !DILocation(line: 244, column: 11, scope: !2109)
!2375 = !DILocation(line: 257, column: 19, scope: !2109)
!2376 = !DILocation(line: 257, column: 25, scope: !2109)
!2377 = !DILocation(line: 257, column: 15, scope: !2109)
!2378 = !DILocation(line: 249, column: 9, scope: !2109)
!2379 = !DILocation(line: 250, column: 11, scope: !2109)
!2380 = !DILocation(line: 256, column: 19, scope: !2109)
!2381 = !DILocation(line: 256, column: 25, scope: !2109)
!2382 = !DILocation(line: 256, column: 15, scope: !2109)
!2383 = !DILocation(line: 247, column: 9, scope: !2109)
!2384 = !DILocation(line: 248, column: 11, scope: !2109)
!2385 = !DILocation(line: 255, column: 19, scope: !2109)
!2386 = !DILocation(line: 255, column: 25, scope: !2109)
!2387 = !DILocation(line: 255, column: 15, scope: !2109)
!2388 = !DILocation(line: 254, column: 19, scope: !2109)
!2389 = !DILocation(line: 254, column: 25, scope: !2109)
!2390 = !DILocation(line: 254, column: 15, scope: !2109)
!2391 = !DILocation(line: 253, column: 19, scope: !2109)
!2392 = !DILocation(line: 253, column: 25, scope: !2109)
!2393 = !DILocation(line: 253, column: 15, scope: !2109)
!2394 = !DILocation(line: 234, column: 9, scope: !2109)
!2395 = !DILocation(line: 235, column: 11, scope: !2109)
!2396 = !DILocation(line: 228, column: 9, scope: !2109)
!2397 = !DILocation(line: 229, column: 11, scope: !2109)
!2398 = !DILocation(line: 226, column: 9, scope: !2109)
!2399 = !DILocation(line: 241, column: 19, scope: !2109)
!2400 = !DILocation(line: 241, column: 25, scope: !2109)
!2401 = !DILocation(line: 241, column: 15, scope: !2109)
!2402 = !DILocation(line: 232, column: 9, scope: !2109)
!2403 = !DILocation(line: 233, column: 11, scope: !2109)
!2404 = !DILocation(line: 240, column: 19, scope: !2109)
!2405 = !DILocation(line: 240, column: 25, scope: !2109)
!2406 = !DILocation(line: 240, column: 15, scope: !2109)
!2407 = !DILocation(line: 230, column: 9, scope: !2109)
!2408 = !DILocation(line: 231, column: 11, scope: !2109)
!2409 = !DILocation(line: 239, column: 19, scope: !2109)
!2410 = !DILocation(line: 239, column: 25, scope: !2109)
!2411 = !DILocation(line: 239, column: 15, scope: !2109)
!2412 = !DILocation(line: 238, column: 19, scope: !2109)
!2413 = !DILocation(line: 238, column: 25, scope: !2109)
!2414 = !DILocation(line: 238, column: 15, scope: !2109)
!2415 = !DILocation(line: 237, column: 51, scope: !2109)
!2416 = !DILocation(line: 237, column: 22, scope: !2109)
!2417 = !DILocation(line: 236, column: 19, scope: !2109)
!2418 = !DILocation(line: 236, column: 25, scope: !2109)
!2419 = !DILocation(line: 237, column: 9, scope: !2109)
!2420 = !DILocation(line: 116, column: 42, scope: !2071)
!2421 = !DILocation(line: 116, column: 3, scope: !2071)
!2422 = distinct !{!2422, !2072, !2423, !107}
!2423 = !DILocation(line: 306, column: 3, scope: !2068)
!2424 = !DILocation(line: 309, column: 12, scope: !2013)
!2425 = !DILocation(line: 310, column: 3, scope: !2013)
!2426 = !DILocation(line: 310, column: 12, scope: !2013)
!2427 = !DILocation(line: 311, column: 3, scope: !2013)
!2428 = !DILocation(line: 311, column: 12, scope: !2013)
!2429 = !DILocation(line: 312, column: 3, scope: !2013)
!2430 = !DILocation(line: 312, column: 12, scope: !2013)
!2431 = !DILocation(line: 313, column: 3, scope: !2013)
!2432 = !DILocation(line: 313, column: 12, scope: !2013)
!2433 = !DILocation(line: 314, column: 3, scope: !2013)
!2434 = !DILocation(line: 314, column: 12, scope: !2013)
!2435 = !DILocation(line: 315, column: 3, scope: !2013)
!2436 = !DILocation(line: 315, column: 12, scope: !2013)
!2437 = !DILocation(line: 316, column: 3, scope: !2013)
!2438 = !DILocation(line: 316, column: 12, scope: !2013)
!2439 = !DILocation(line: 317, column: 3, scope: !2013)
!2440 = !DILocation(line: 317, column: 12, scope: !2013)
!2441 = !DILocation(line: 318, column: 3, scope: !2013)
!2442 = !DILocation(line: 318, column: 12, scope: !2013)
!2443 = !DILocation(line: 319, column: 3, scope: !2013)
!2444 = !DILocation(line: 319, column: 13, scope: !2013)
!2445 = !DILocation(line: 320, column: 3, scope: !2013)
!2446 = !DILocation(line: 320, column: 13, scope: !2013)
!2447 = !DILocation(line: 321, column: 3, scope: !2013)
!2448 = !DILocation(line: 321, column: 13, scope: !2013)
!2449 = !DILocation(line: 322, column: 3, scope: !2013)
!2450 = !DILocation(line: 322, column: 13, scope: !2013)
!2451 = !DILocation(line: 323, column: 3, scope: !2013)
!2452 = !DILocation(line: 323, column: 13, scope: !2013)
!2453 = !DILocation(line: 324, column: 3, scope: !2013)
!2454 = !DILocation(line: 324, column: 13, scope: !2013)
!2455 = !DILocation(line: 325, column: 3, scope: !2013)
!2456 = !DILocation(line: 325, column: 13, scope: !2013)
!2457 = !DILocation(line: 326, column: 3, scope: !2013)
!2458 = !DILocation(line: 326, column: 13, scope: !2013)
!2459 = !DILocation(line: 327, column: 3, scope: !2013)
!2460 = !DILocation(line: 327, column: 13, scope: !2013)
!2461 = !DILocation(line: 328, column: 3, scope: !2013)
!2462 = !DILocation(line: 328, column: 13, scope: !2013)
!2463 = !DILocation(line: 329, column: 3, scope: !2013)
!2464 = !DILocation(line: 329, column: 13, scope: !2013)
!2465 = !DILocation(line: 330, column: 3, scope: !2013)
!2466 = !DILocation(line: 330, column: 13, scope: !2013)
!2467 = !DILocation(line: 331, column: 3, scope: !2013)
!2468 = !DILocation(line: 331, column: 13, scope: !2013)
!2469 = !DILocation(line: 332, column: 3, scope: !2013)
!2470 = !DILocation(line: 332, column: 13, scope: !2013)
!2471 = !DILocation(line: 333, column: 3, scope: !2013)
!2472 = !DILocation(line: 333, column: 13, scope: !2013)
!2473 = !DILocation(line: 334, column: 1, scope: !2013)
!2474 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_finalize", scope: !49, file: !49, line: 535, type: !1917, scopeLine: 535, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2475 = !DILocalVariable(name: "state", arg: 1, scope: !2474, file: !49, line: 535, type: !1919)
!2476 = !DILocation(line: 0, scope: !2474)
!2477 = !DILocation(line: 536, column: 27, scope: !2474)
!2478 = !DILocation(line: 536, column: 3, scope: !2474)
!2479 = !DILocation(line: 537, column: 3, scope: !2474)
!2480 = !DILocation(line: 537, column: 29, scope: !2474)
!2481 = !DILocation(line: 539, column: 1, scope: !2474)
!2482 = distinct !DISubprogram(name: "keccak_finalize", scope: !49, file: !49, line: 393, type: !2483, scopeLine: 394, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2483 = !DISubroutineType(types: !2484)
!2484 = !{null, !1929, !14, !14, !7}
!2485 = !DILocalVariable(name: "s", arg: 1, scope: !2482, file: !49, line: 393, type: !1929)
!2486 = !DILocation(line: 0, scope: !2482)
!2487 = !DILocalVariable(name: "pos", arg: 2, scope: !2482, file: !49, line: 393, type: !14)
!2488 = !DILocalVariable(name: "r", arg: 3, scope: !2482, file: !49, line: 393, type: !14)
!2489 = !DILocalVariable(name: "p", arg: 4, scope: !2482, file: !49, line: 394, type: !7)
!2490 = !DILocation(line: 395, column: 34, scope: !2482)
!2491 = !DILocation(line: 395, column: 29, scope: !2482)
!2492 = !DILocation(line: 395, column: 9, scope: !2482)
!2493 = !DILocation(line: 395, column: 3, scope: !2482)
!2494 = !DILocation(line: 395, column: 14, scope: !2482)
!2495 = !DILocation(line: 396, column: 7, scope: !2482)
!2496 = !DILocation(line: 396, column: 3, scope: !2482)
!2497 = !DILocation(line: 396, column: 16, scope: !2482)
!2498 = !DILocation(line: 398, column: 1, scope: !2482)
!2499 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeeze", scope: !49, file: !49, line: 552, type: !2500, scopeLine: 552, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2500 = !DISubroutineType(types: !2501)
!2501 = !{null, !6, !12, !1919}
!2502 = !DILocalVariable(name: "out", arg: 1, scope: !2499, file: !49, line: 552, type: !6)
!2503 = !DILocation(line: 0, scope: !2499)
!2504 = !DILocalVariable(name: "outlen", arg: 2, scope: !2499, file: !49, line: 552, type: !12)
!2505 = !DILocalVariable(name: "state", arg: 3, scope: !2499, file: !49, line: 552, type: !1919)
!2506 = !DILocation(line: 554, column: 28, scope: !2499)
!2507 = !DILocation(line: 553, column: 31, scope: !2499)
!2508 = !DILocation(line: 553, column: 3, scope: !2499)
!2509 = !DILocation(line: 553, column: 29, scope: !2499)
!2510 = !DILocation(line: 556, column: 1, scope: !2499)
!2511 = distinct !DISubprogram(name: "keccak_squeeze", scope: !49, file: !49, line: 416, type: !2512, scopeLine: 417, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2512 = !DISubroutineType(types: !2513)
!2513 = !{!14, !6, !12, !1929, !14, !14}
!2514 = !DILocalVariable(name: "out", arg: 1, scope: !2511, file: !49, line: 416, type: !6)
!2515 = !DILocation(line: 0, scope: !2511)
!2516 = !DILocalVariable(name: "outlen", arg: 2, scope: !2511, file: !49, line: 416, type: !12)
!2517 = !DILocalVariable(name: "s", arg: 3, scope: !2511, file: !49, line: 416, type: !1929)
!2518 = !DILocalVariable(name: "pos", arg: 4, scope: !2511, file: !49, line: 417, type: !14)
!2519 = !DILocalVariable(name: "r", arg: 5, scope: !2511, file: !49, line: 417, type: !14)
!2520 = !DILocation(line: 420, column: 3, scope: !2511)
!2521 = !DILocation(line: 421, column: 13, scope: !2522)
!2522 = distinct !DILexicalBlock(scope: !2523, file: !49, line: 421, column: 9)
!2523 = distinct !DILexicalBlock(scope: !2511, file: !49, line: 420, column: 18)
!2524 = !DILocation(line: 422, column: 7, scope: !2525)
!2525 = distinct !DILexicalBlock(scope: !2522, file: !49, line: 421, column: 19)
!2526 = !DILocation(line: 424, column: 5, scope: !2525)
!2527 = !DILocalVariable(name: "i", scope: !2511, file: !49, line: 418, type: !14)
!2528 = !DILocation(line: 425, column: 10, scope: !2529)
!2529 = distinct !DILexicalBlock(scope: !2523, file: !49, line: 425, column: 5)
!2530 = !DILocation(line: 425, scope: !2529)
!2531 = !DILocation(line: 425, column: 21, scope: !2532)
!2532 = distinct !DILexicalBlock(scope: !2529, file: !49, line: 425, column: 5)
!2533 = !DILocation(line: 425, column: 25, scope: !2532)
!2534 = !DILocation(line: 425, column: 5, scope: !2529)
!2535 = !DILocation(line: 426, column: 20, scope: !2532)
!2536 = !DILocation(line: 426, column: 16, scope: !2532)
!2537 = !DILocation(line: 426, column: 30, scope: !2532)
!2538 = !DILocation(line: 426, column: 25, scope: !2532)
!2539 = !DILocation(line: 426, column: 14, scope: !2532)
!2540 = !DILocation(line: 426, column: 11, scope: !2532)
!2541 = !DILocation(line: 425, column: 47, scope: !2532)
!2542 = !DILocation(line: 425, column: 5, scope: !2532)
!2543 = distinct !{!2543, !2534, !2544, !107}
!2544 = !DILocation(line: 426, column: 38, scope: !2529)
!2545 = !DILocation(line: 427, column: 17, scope: !2523)
!2546 = !DILocation(line: 427, column: 12, scope: !2523)
!2547 = distinct !{!2547, !2520, !2548, !107}
!2548 = !DILocation(line: 429, column: 3, scope: !2511)
!2549 = !DILocation(line: 432, column: 3, scope: !2511)
!2550 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb_once", scope: !49, file: !49, line: 569, type: !1947, scopeLine: 570, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2551 = !DILocalVariable(name: "state", arg: 1, scope: !2550, file: !49, line: 569, type: !1919)
!2552 = !DILocation(line: 0, scope: !2550)
!2553 = !DILocalVariable(name: "in", arg: 2, scope: !2550, file: !49, line: 569, type: !234)
!2554 = !DILocalVariable(name: "inlen", arg: 3, scope: !2550, file: !49, line: 570, type: !12)
!2555 = !DILocation(line: 571, column: 3, scope: !2550)
!2556 = !DILocation(line: 572, column: 3, scope: !2550)
!2557 = !DILocation(line: 572, column: 29, scope: !2550)
!2558 = !DILocation(line: 574, column: 1, scope: !2550)
!2559 = distinct !DISubprogram(name: "keccak_absorb_once", scope: !49, file: !49, line: 448, type: !2560, scopeLine: 449, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2560 = !DISubroutineType(types: !2561)
!2561 = !{null, !1929, !14, !234, !12, !7}
!2562 = !DILocalVariable(name: "s", arg: 1, scope: !2559, file: !49, line: 448, type: !1929)
!2563 = !DILocation(line: 0, scope: !2559)
!2564 = !DILocalVariable(name: "r", arg: 2, scope: !2559, file: !49, line: 448, type: !14)
!2565 = !DILocalVariable(name: "in", arg: 3, scope: !2559, file: !49, line: 449, type: !234)
!2566 = !DILocalVariable(name: "inlen", arg: 4, scope: !2559, file: !49, line: 449, type: !12)
!2567 = !DILocalVariable(name: "p", arg: 5, scope: !2559, file: !49, line: 449, type: !7)
!2568 = !DILocalVariable(name: "i", scope: !2559, file: !49, line: 450, type: !14)
!2569 = !DILocation(line: 452, column: 8, scope: !2570)
!2570 = distinct !DILexicalBlock(scope: !2559, file: !49, line: 452, column: 3)
!2571 = !DILocation(line: 452, scope: !2570)
!2572 = !DILocation(line: 452, column: 17, scope: !2573)
!2573 = distinct !DILexicalBlock(scope: !2570, file: !49, line: 452, column: 3)
!2574 = !DILocation(line: 452, column: 3, scope: !2570)
!2575 = !DILocation(line: 455, column: 3, scope: !2559)
!2576 = !DILocation(line: 453, column: 5, scope: !2573)
!2577 = !DILocation(line: 453, column: 10, scope: !2573)
!2578 = !DILocation(line: 452, column: 24, scope: !2573)
!2579 = !DILocation(line: 452, column: 3, scope: !2573)
!2580 = distinct !{!2580, !2574, !2581, !107}
!2581 = !DILocation(line: 453, column: 12, scope: !2570)
!2582 = !DILocation(line: 455, column: 16, scope: !2559)
!2583 = !DILocation(line: 456, column: 5, scope: !2584)
!2584 = distinct !DILexicalBlock(scope: !2585, file: !49, line: 456, column: 5)
!2585 = distinct !DILexicalBlock(scope: !2559, file: !49, line: 455, column: 22)
!2586 = !DILocation(line: 463, column: 3, scope: !2587)
!2587 = distinct !DILexicalBlock(scope: !2559, file: !49, line: 463, column: 3)
!2588 = !DILocation(line: 456, scope: !2584)
!2589 = !DILocation(line: 456, column: 19, scope: !2590)
!2590 = distinct !DILexicalBlock(scope: !2584, file: !49, line: 456, column: 5)
!2591 = !DILocation(line: 457, column: 29, scope: !2590)
!2592 = !DILocation(line: 457, column: 25, scope: !2590)
!2593 = !DILocation(line: 457, column: 15, scope: !2590)
!2594 = !DILocation(line: 457, column: 7, scope: !2590)
!2595 = !DILocation(line: 457, column: 12, scope: !2590)
!2596 = !DILocation(line: 456, column: 29, scope: !2590)
!2597 = !DILocation(line: 456, column: 5, scope: !2590)
!2598 = distinct !{!2598, !2583, !2599, !107}
!2599 = !DILocation(line: 457, column: 32, scope: !2584)
!2600 = !DILocation(line: 458, column: 8, scope: !2585)
!2601 = !DILocation(line: 459, column: 11, scope: !2585)
!2602 = !DILocation(line: 460, column: 5, scope: !2585)
!2603 = distinct !{!2603, !2575, !2604, !107}
!2604 = !DILocation(line: 461, column: 3, scope: !2559)
!2605 = !DILocation(line: 463, scope: !2587)
!2606 = !DILocation(line: 463, column: 17, scope: !2607)
!2607 = distinct !DILexicalBlock(scope: !2587, file: !49, line: 463, column: 3)
!2608 = !DILocation(line: 464, column: 27, scope: !2607)
!2609 = !DILocation(line: 464, column: 17, scope: !2607)
!2610 = !DILocation(line: 464, column: 38, scope: !2607)
!2611 = !DILocation(line: 464, column: 33, scope: !2607)
!2612 = !DILocation(line: 464, column: 9, scope: !2607)
!2613 = !DILocation(line: 464, column: 5, scope: !2607)
!2614 = !DILocation(line: 464, column: 14, scope: !2607)
!2615 = !DILocation(line: 463, column: 27, scope: !2607)
!2616 = !DILocation(line: 463, column: 3, scope: !2607)
!2617 = distinct !{!2617, !2586, !2618, !107}
!2618 = !DILocation(line: 464, column: 46, scope: !2587)
!2619 = !DILocation(line: 466, column: 15, scope: !2559)
!2620 = !DILocation(line: 466, column: 32, scope: !2559)
!2621 = !DILocation(line: 466, column: 27, scope: !2559)
!2622 = !DILocation(line: 466, column: 7, scope: !2559)
!2623 = !DILocation(line: 466, column: 3, scope: !2559)
!2624 = !DILocation(line: 466, column: 12, scope: !2559)
!2625 = !DILocation(line: 467, column: 8, scope: !2559)
!2626 = !DILocation(line: 467, column: 13, scope: !2559)
!2627 = !DILocation(line: 467, column: 3, scope: !2559)
!2628 = !DILocation(line: 467, column: 18, scope: !2559)
!2629 = !DILocation(line: 469, column: 1, scope: !2559)
!2630 = distinct !DISubprogram(name: "load64", scope: !49, file: !49, line: 23, type: !2631, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2631 = !DISubroutineType(types: !2632)
!2632 = !{!45, !234}
!2633 = !DILocalVariable(name: "x", arg: 1, scope: !2630, file: !49, line: 23, type: !234)
!2634 = !DILocation(line: 0, scope: !2630)
!2635 = !DILocalVariable(name: "r", scope: !2630, file: !49, line: 25, type: !45)
!2636 = !DILocalVariable(name: "i", scope: !2630, file: !49, line: 24, type: !14)
!2637 = !DILocation(line: 27, column: 8, scope: !2638)
!2638 = distinct !DILexicalBlock(scope: !2630, file: !49, line: 27, column: 3)
!2639 = !DILocation(line: 27, scope: !2638)
!2640 = !DILocation(line: 27, column: 17, scope: !2641)
!2641 = distinct !DILexicalBlock(scope: !2638, file: !49, line: 27, column: 3)
!2642 = !DILocation(line: 27, column: 3, scope: !2638)
!2643 = !DILocation(line: 28, column: 20, scope: !2641)
!2644 = !DILocation(line: 28, column: 10, scope: !2641)
!2645 = !DILocation(line: 28, column: 30, scope: !2641)
!2646 = !DILocation(line: 28, column: 25, scope: !2641)
!2647 = !DILocation(line: 28, column: 7, scope: !2641)
!2648 = !DILocation(line: 27, column: 23, scope: !2641)
!2649 = !DILocation(line: 27, column: 3, scope: !2641)
!2650 = distinct !{!2650, !2642, !2651, !107}
!2651 = !DILocation(line: 28, column: 32, scope: !2638)
!2652 = !DILocation(line: 31, column: 3, scope: !2630)
!2653 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeezeblocks", scope: !49, file: !49, line: 589, type: !2500, scopeLine: 589, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2654 = !DILocalVariable(name: "out", arg: 1, scope: !2653, file: !49, line: 589, type: !6)
!2655 = !DILocation(line: 0, scope: !2653)
!2656 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2653, file: !49, line: 589, type: !12)
!2657 = !DILocalVariable(name: "state", arg: 3, scope: !2653, file: !49, line: 589, type: !1919)
!2658 = !DILocation(line: 590, column: 3, scope: !2653)
!2659 = !DILocation(line: 592, column: 1, scope: !2653)
!2660 = distinct !DISubprogram(name: "keccak_squeezeblocks", scope: !49, file: !49, line: 485, type: !2661, scopeLine: 486, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2661 = !DISubroutineType(types: !2662)
!2662 = !{null, !6, !12, !1929, !14}
!2663 = !DILocalVariable(name: "out", arg: 1, scope: !2660, file: !49, line: 485, type: !6)
!2664 = !DILocation(line: 0, scope: !2660)
!2665 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2660, file: !49, line: 485, type: !12)
!2666 = !DILocalVariable(name: "s", arg: 3, scope: !2660, file: !49, line: 485, type: !1929)
!2667 = !DILocalVariable(name: "r", arg: 4, scope: !2660, file: !49, line: 486, type: !14)
!2668 = !DILocation(line: 489, column: 3, scope: !2660)
!2669 = !DILocation(line: 490, column: 5, scope: !2670)
!2670 = distinct !DILexicalBlock(scope: !2660, file: !49, line: 489, column: 19)
!2671 = !DILocalVariable(name: "i", scope: !2660, file: !49, line: 487, type: !14)
!2672 = !DILocation(line: 491, column: 10, scope: !2673)
!2673 = distinct !DILexicalBlock(scope: !2670, file: !49, line: 491, column: 5)
!2674 = !DILocation(line: 491, scope: !2673)
!2675 = !DILocation(line: 491, column: 19, scope: !2676)
!2676 = distinct !DILexicalBlock(scope: !2673, file: !49, line: 491, column: 5)
!2677 = !DILocation(line: 491, column: 5, scope: !2673)
!2678 = !DILocation(line: 492, column: 23, scope: !2676)
!2679 = !DILocation(line: 492, column: 19, scope: !2676)
!2680 = !DILocation(line: 492, column: 28, scope: !2676)
!2681 = !DILocation(line: 492, column: 7, scope: !2676)
!2682 = !DILocation(line: 491, column: 29, scope: !2676)
!2683 = !DILocation(line: 491, column: 5, scope: !2676)
!2684 = distinct !{!2684, !2677, !2685, !107}
!2685 = !DILocation(line: 492, column: 32, scope: !2673)
!2686 = !DILocation(line: 493, column: 9, scope: !2670)
!2687 = !DILocation(line: 494, column: 13, scope: !2670)
!2688 = distinct !{!2688, !2668, !2689, !107}
!2689 = !DILocation(line: 495, column: 3, scope: !2660)
!2690 = !DILocation(line: 497, column: 1, scope: !2660)
!2691 = distinct !DISubprogram(name: "store64", scope: !49, file: !49, line: 43, type: !2692, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2692 = !DISubroutineType(types: !2693)
!2693 = !{null, !6, !45}
!2694 = !DILocalVariable(name: "x", arg: 1, scope: !2691, file: !49, line: 43, type: !6)
!2695 = !DILocation(line: 0, scope: !2691)
!2696 = !DILocalVariable(name: "u", arg: 2, scope: !2691, file: !49, line: 43, type: !45)
!2697 = !DILocalVariable(name: "i", scope: !2691, file: !49, line: 44, type: !14)
!2698 = !DILocation(line: 46, column: 8, scope: !2699)
!2699 = distinct !DILexicalBlock(scope: !2691, file: !49, line: 46, column: 3)
!2700 = !DILocation(line: 46, scope: !2699)
!2701 = !DILocation(line: 46, column: 17, scope: !2702)
!2702 = distinct !DILexicalBlock(scope: !2699, file: !49, line: 46, column: 3)
!2703 = !DILocation(line: 46, column: 3, scope: !2699)
!2704 = !DILocation(line: 47, column: 19, scope: !2702)
!2705 = !DILocation(line: 47, column: 14, scope: !2702)
!2706 = !DILocation(line: 47, column: 12, scope: !2702)
!2707 = !DILocation(line: 47, column: 5, scope: !2702)
!2708 = !DILocation(line: 47, column: 10, scope: !2702)
!2709 = !DILocation(line: 46, column: 23, scope: !2702)
!2710 = !DILocation(line: 46, column: 3, scope: !2702)
!2711 = distinct !{!2711, !2703, !2712, !107}
!2712 = !DILocation(line: 47, column: 21, scope: !2699)
!2713 = !DILocation(line: 49, column: 1, scope: !2691)
!2714 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_init", scope: !49, file: !49, line: 601, type: !1917, scopeLine: 601, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2715 = !DILocalVariable(name: "state", arg: 1, scope: !2714, file: !49, line: 601, type: !1919)
!2716 = !DILocation(line: 0, scope: !2714)
!2717 = !DILocation(line: 602, column: 3, scope: !2714)
!2718 = !DILocation(line: 603, column: 3, scope: !2714)
!2719 = !DILocation(line: 603, column: 29, scope: !2714)
!2720 = !DILocation(line: 605, column: 1, scope: !2714)
!2721 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb", scope: !49, file: !49, line: 617, type: !1947, scopeLine: 617, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2722 = !DILocalVariable(name: "state", arg: 1, scope: !2721, file: !49, line: 617, type: !1919)
!2723 = !DILocation(line: 0, scope: !2721)
!2724 = !DILocalVariable(name: "in", arg: 2, scope: !2721, file: !49, line: 617, type: !234)
!2725 = !DILocalVariable(name: "inlen", arg: 3, scope: !2721, file: !49, line: 617, type: !12)
!2726 = !DILocation(line: 618, column: 53, scope: !2721)
!2727 = !DILocation(line: 618, column: 31, scope: !2721)
!2728 = !DILocation(line: 618, column: 3, scope: !2721)
!2729 = !DILocation(line: 618, column: 29, scope: !2721)
!2730 = !DILocation(line: 621, column: 1, scope: !2721)
!2731 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_finalize", scope: !49, file: !49, line: 630, type: !1917, scopeLine: 630, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2732 = !DILocalVariable(name: "state", arg: 1, scope: !2731, file: !49, line: 630, type: !1919)
!2733 = !DILocation(line: 0, scope: !2731)
!2734 = !DILocation(line: 631, column: 27, scope: !2731)
!2735 = !DILocation(line: 631, column: 3, scope: !2731)
!2736 = !DILocation(line: 632, column: 3, scope: !2731)
!2737 = !DILocation(line: 632, column: 29, scope: !2731)
!2738 = !DILocation(line: 634, column: 1, scope: !2731)
!2739 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeeze", scope: !49, file: !49, line: 647, type: !2500, scopeLine: 647, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2740 = !DILocalVariable(name: "out", arg: 1, scope: !2739, file: !49, line: 647, type: !6)
!2741 = !DILocation(line: 0, scope: !2739)
!2742 = !DILocalVariable(name: "outlen", arg: 2, scope: !2739, file: !49, line: 647, type: !12)
!2743 = !DILocalVariable(name: "state", arg: 3, scope: !2739, file: !49, line: 647, type: !1919)
!2744 = !DILocation(line: 649, column: 28, scope: !2739)
!2745 = !DILocation(line: 648, column: 31, scope: !2739)
!2746 = !DILocation(line: 648, column: 3, scope: !2739)
!2747 = !DILocation(line: 648, column: 29, scope: !2739)
!2748 = !DILocation(line: 651, column: 1, scope: !2739)
!2749 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb_once", scope: !49, file: !49, line: 664, type: !1947, scopeLine: 665, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2750 = !DILocalVariable(name: "state", arg: 1, scope: !2749, file: !49, line: 664, type: !1919)
!2751 = !DILocation(line: 0, scope: !2749)
!2752 = !DILocalVariable(name: "in", arg: 2, scope: !2749, file: !49, line: 664, type: !234)
!2753 = !DILocalVariable(name: "inlen", arg: 3, scope: !2749, file: !49, line: 665, type: !12)
!2754 = !DILocation(line: 666, column: 3, scope: !2749)
!2755 = !DILocation(line: 667, column: 3, scope: !2749)
!2756 = !DILocation(line: 667, column: 29, scope: !2749)
!2757 = !DILocation(line: 669, column: 1, scope: !2749)
!2758 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeezeblocks", scope: !49, file: !49, line: 684, type: !2500, scopeLine: 684, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2759 = !DILocalVariable(name: "out", arg: 1, scope: !2758, file: !49, line: 684, type: !6)
!2760 = !DILocation(line: 0, scope: !2758)
!2761 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2758, file: !49, line: 684, type: !12)
!2762 = !DILocalVariable(name: "state", arg: 3, scope: !2758, file: !49, line: 684, type: !1919)
!2763 = !DILocation(line: 685, column: 3, scope: !2758)
!2764 = !DILocation(line: 687, column: 1, scope: !2758)
!2765 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128", scope: !49, file: !49, line: 699, type: !2766, scopeLine: 699, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2766 = !DISubroutineType(types: !2767)
!2767 = !{null, !6, !12, !234, !12}
!2768 = !DILocalVariable(name: "out", arg: 1, scope: !2765, file: !49, line: 699, type: !6)
!2769 = !DILocation(line: 0, scope: !2765)
!2770 = !DILocalVariable(name: "outlen", arg: 2, scope: !2765, file: !49, line: 699, type: !12)
!2771 = !DILocalVariable(name: "in", arg: 3, scope: !2765, file: !49, line: 699, type: !234)
!2772 = !DILocalVariable(name: "inlen", arg: 4, scope: !2765, file: !49, line: 699, type: !12)
!2773 = !DILocalVariable(name: "state", scope: !2765, file: !49, line: 701, type: !346)
!2774 = !DILocation(line: 701, column: 16, scope: !2765)
!2775 = !DILocation(line: 703, column: 3, scope: !2765)
!2776 = !DILocation(line: 704, column: 20, scope: !2765)
!2777 = !DILocalVariable(name: "nblocks", scope: !2765, file: !49, line: 700, type: !12)
!2778 = !DILocation(line: 705, column: 3, scope: !2765)
!2779 = !DILocation(line: 706, column: 21, scope: !2765)
!2780 = !DILocation(line: 706, column: 10, scope: !2765)
!2781 = !DILocation(line: 707, column: 18, scope: !2765)
!2782 = !DILocation(line: 707, column: 7, scope: !2765)
!2783 = !DILocation(line: 708, column: 3, scope: !2765)
!2784 = !DILocation(line: 710, column: 1, scope: !2765)
!2785 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256", scope: !49, file: !49, line: 722, type: !2766, scopeLine: 722, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2786 = !DILocalVariable(name: "out", arg: 1, scope: !2785, file: !49, line: 722, type: !6)
!2787 = !DILocation(line: 0, scope: !2785)
!2788 = !DILocalVariable(name: "outlen", arg: 2, scope: !2785, file: !49, line: 722, type: !12)
!2789 = !DILocalVariable(name: "in", arg: 3, scope: !2785, file: !49, line: 722, type: !234)
!2790 = !DILocalVariable(name: "inlen", arg: 4, scope: !2785, file: !49, line: 722, type: !12)
!2791 = !DILocalVariable(name: "state", scope: !2785, file: !49, line: 724, type: !346)
!2792 = !DILocation(line: 724, column: 16, scope: !2785)
!2793 = !DILocation(line: 726, column: 3, scope: !2785)
!2794 = !DILocation(line: 727, column: 20, scope: !2785)
!2795 = !DILocalVariable(name: "nblocks", scope: !2785, file: !49, line: 723, type: !12)
!2796 = !DILocation(line: 728, column: 3, scope: !2785)
!2797 = !DILocation(line: 729, column: 21, scope: !2785)
!2798 = !DILocation(line: 729, column: 10, scope: !2785)
!2799 = !DILocation(line: 730, column: 18, scope: !2785)
!2800 = !DILocation(line: 730, column: 7, scope: !2785)
!2801 = !DILocation(line: 731, column: 3, scope: !2785)
!2802 = !DILocation(line: 733, column: 1, scope: !2785)
!2803 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_256", scope: !49, file: !49, line: 744, type: !2804, scopeLine: 744, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2804 = !DISubroutineType(types: !2805)
!2805 = !{null, !6, !234, !12}
!2806 = !DILocalVariable(name: "h", arg: 1, scope: !2803, file: !49, line: 744, type: !6)
!2807 = !DILocation(line: 0, scope: !2803)
!2808 = !DILocalVariable(name: "in", arg: 2, scope: !2803, file: !49, line: 744, type: !234)
!2809 = !DILocalVariable(name: "inlen", arg: 3, scope: !2803, file: !49, line: 744, type: !12)
!2810 = !DILocalVariable(name: "s", scope: !2803, file: !49, line: 746, type: !2811)
!2811 = !DICompositeType(tag: DW_TAG_array_type, baseType: !45, size: 1600, elements: !2812)
!2812 = !{!2813}
!2813 = !DISubrange(count: 25)
!2814 = !DILocation(line: 746, column: 12, scope: !2803)
!2815 = !DILocation(line: 748, column: 3, scope: !2803)
!2816 = !DILocation(line: 749, column: 3, scope: !2803)
!2817 = !DILocalVariable(name: "i", scope: !2803, file: !49, line: 745, type: !14)
!2818 = !DILocation(line: 750, column: 8, scope: !2819)
!2819 = distinct !DILexicalBlock(scope: !2803, file: !49, line: 750, column: 3)
!2820 = !DILocation(line: 750, scope: !2819)
!2821 = !DILocation(line: 750, column: 17, scope: !2822)
!2822 = distinct !DILexicalBlock(scope: !2819, file: !49, line: 750, column: 3)
!2823 = !DILocation(line: 750, column: 3, scope: !2819)
!2824 = !DILocation(line: 751, column: 19, scope: !2822)
!2825 = !DILocation(line: 751, column: 15, scope: !2822)
!2826 = !DILocation(line: 751, column: 24, scope: !2822)
!2827 = !DILocation(line: 751, column: 5, scope: !2822)
!2828 = !DILocation(line: 750, column: 23, scope: !2822)
!2829 = !DILocation(line: 750, column: 3, scope: !2822)
!2830 = distinct !{!2830, !2823, !2831, !107}
!2831 = !DILocation(line: 751, column: 28, scope: !2819)
!2832 = !DILocation(line: 753, column: 1, scope: !2803)
!2833 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_512", scope: !49, file: !49, line: 764, type: !2804, scopeLine: 764, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2834 = !DILocalVariable(name: "h", arg: 1, scope: !2833, file: !49, line: 764, type: !6)
!2835 = !DILocation(line: 0, scope: !2833)
!2836 = !DILocalVariable(name: "in", arg: 2, scope: !2833, file: !49, line: 764, type: !234)
!2837 = !DILocalVariable(name: "inlen", arg: 3, scope: !2833, file: !49, line: 764, type: !12)
!2838 = !DILocalVariable(name: "s", scope: !2833, file: !49, line: 766, type: !2811)
!2839 = !DILocation(line: 766, column: 12, scope: !2833)
!2840 = !DILocation(line: 768, column: 3, scope: !2833)
!2841 = !DILocation(line: 769, column: 3, scope: !2833)
!2842 = !DILocalVariable(name: "i", scope: !2833, file: !49, line: 765, type: !14)
!2843 = !DILocation(line: 770, column: 8, scope: !2844)
!2844 = distinct !DILexicalBlock(scope: !2833, file: !49, line: 770, column: 3)
!2845 = !DILocation(line: 770, scope: !2844)
!2846 = !DILocation(line: 770, column: 17, scope: !2847)
!2847 = distinct !DILexicalBlock(scope: !2844, file: !49, line: 770, column: 3)
!2848 = !DILocation(line: 770, column: 3, scope: !2844)
!2849 = !DILocation(line: 771, column: 19, scope: !2847)
!2850 = !DILocation(line: 771, column: 15, scope: !2847)
!2851 = !DILocation(line: 771, column: 24, scope: !2847)
!2852 = !DILocation(line: 771, column: 5, scope: !2847)
!2853 = !DILocation(line: 770, column: 23, scope: !2847)
!2854 = !DILocation(line: 770, column: 3, scope: !2847)
!2855 = distinct !{!2855, !2848, !2856, !107}
!2856 = !DILocation(line: 771, column: 28, scope: !2844)
!2857 = !DILocation(line: 773, column: 1, scope: !2833)
!2858 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_kyber_shake128_absorb", scope: !2859, file: !2859, line: 21, type: !2860, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !74, retainedNodes: !24)
!2859 = !DIFile(filename: "../../../ref/symmetric-shake.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!2860 = !DISubroutineType(types: !2861)
!2861 = !{null, !1919, !234, !7, !7}
!2862 = !DILocalVariable(name: "state", arg: 1, scope: !2858, file: !2859, line: 21, type: !1919)
!2863 = !DILocation(line: 0, scope: !2858)
!2864 = !DILocalVariable(name: "seed", arg: 2, scope: !2858, file: !2859, line: 22, type: !234)
!2865 = !DILocalVariable(name: "x", arg: 3, scope: !2858, file: !2859, line: 22, type: !7)
!2866 = !DILocalVariable(name: "y", arg: 4, scope: !2858, file: !2859, line: 23, type: !7)
!2867 = !DILocalVariable(name: "extseed", scope: !2858, file: !2859, line: 24, type: !2868)
!2868 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 272, elements: !2869)
!2869 = !{!2870}
!2870 = !DISubrange(count: 34)
!2871 = !DILocation(line: 24, column: 11, scope: !2858)
!2872 = !DILocation(line: 26, column: 3, scope: !2858)
!2873 = !DILocation(line: 27, column: 3, scope: !2858)
!2874 = !DILocation(line: 27, column: 31, scope: !2858)
!2875 = !DILocation(line: 28, column: 3, scope: !2858)
!2876 = !DILocation(line: 28, column: 31, scope: !2858)
!2877 = !DILocation(line: 30, column: 3, scope: !2858)
!2878 = !DILocation(line: 32, column: 1, scope: !2858)
!2879 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_kyber_shake256_prf", scope: !2859, file: !2859, line: 46, type: !2880, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !74, retainedNodes: !24)
!2880 = !DISubroutineType(types: !2881)
!2881 = !{null, !6, !12, !234, !7}
!2882 = !DILocalVariable(name: "out", arg: 1, scope: !2879, file: !2859, line: 46, type: !6)
!2883 = !DILocation(line: 0, scope: !2879)
!2884 = !DILocalVariable(name: "outlen", arg: 2, scope: !2879, file: !2859, line: 46, type: !12)
!2885 = !DILocalVariable(name: "key", arg: 3, scope: !2879, file: !2859, line: 47, type: !234)
!2886 = !DILocalVariable(name: "nonce", arg: 4, scope: !2879, file: !2859, line: 47, type: !7)
!2887 = !DILocalVariable(name: "extkey", scope: !2879, file: !2859, line: 48, type: !2888)
!2888 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 264, elements: !2889)
!2889 = !{!2890}
!2890 = !DISubrange(count: 33)
!2891 = !DILocation(line: 48, column: 11, scope: !2879)
!2892 = !DILocation(line: 50, column: 3, scope: !2879)
!2893 = !DILocation(line: 51, column: 3, scope: !2879)
!2894 = !DILocation(line: 51, column: 26, scope: !2879)
!2895 = !DILocation(line: 53, column: 3, scope: !2879)
!2896 = !DILocation(line: 55, column: 1, scope: !2879)
!2897 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_kyber_shake256_rkprf", scope: !2859, file: !2859, line: 69, type: !641, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !74, retainedNodes: !24)
!2898 = !DILocalVariable(name: "out", arg: 1, scope: !2897, file: !2859, line: 69, type: !6)
!2899 = !DILocation(line: 0, scope: !2897)
!2900 = !DILocalVariable(name: "key", arg: 2, scope: !2897, file: !2859, line: 70, type: !234)
!2901 = !DILocalVariable(name: "input", arg: 3, scope: !2897, file: !2859, line: 71, type: !234)
!2902 = !DILocalVariable(name: "s", scope: !2897, file: !2859, line: 72, type: !346)
!2903 = !DILocation(line: 72, column: 16, scope: !2897)
!2904 = !DILocation(line: 74, column: 3, scope: !2897)
!2905 = !DILocation(line: 75, column: 3, scope: !2897)
!2906 = !DILocation(line: 76, column: 3, scope: !2897)
!2907 = !DILocation(line: 77, column: 3, scope: !2897)
!2908 = !DILocation(line: 78, column: 3, scope: !2897)
!2909 = !DILocation(line: 80, column: 1, scope: !2897)
!2910 = distinct !DISubprogram(name: "kyber_memset", scope: !2911, file: !2911, line: 3, type: !2912, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !75, retainedNodes: !24)
!2911 = !DIFile(filename: "../mem.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!2912 = !DISubroutineType(types: !2913)
!2913 = !{null, !2914, !7, !65}
!2914 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 32)
!2915 = !DILocalVariable(name: "dst", arg: 1, scope: !2910, file: !2911, line: 3, type: !2914)
!2916 = !DILocation(line: 0, scope: !2910)
!2917 = !DILocalVariable(name: "val", arg: 2, scope: !2910, file: !2911, line: 3, type: !7)
!2918 = !DILocalVariable(name: "len", arg: 3, scope: !2910, file: !2911, line: 3, type: !65)
!2919 = !DILocalVariable(name: "d", scope: !2910, file: !2911, line: 5, type: !6)
!2920 = !DILocalVariable(name: "i", scope: !2921, file: !2911, line: 7, type: !65)
!2921 = distinct !DILexicalBlock(scope: !2910, file: !2911, line: 7, column: 5)
!2922 = !DILocation(line: 0, scope: !2921)
!2923 = !DILocation(line: 7, column: 10, scope: !2921)
!2924 = !DILocation(line: 7, scope: !2921)
!2925 = !DILocation(line: 7, column: 28, scope: !2926)
!2926 = distinct !DILexicalBlock(scope: !2921, file: !2911, line: 7, column: 5)
!2927 = !DILocation(line: 7, column: 5, scope: !2921)
!2928 = !DILocation(line: 8, column: 9, scope: !2926)
!2929 = !DILocation(line: 8, column: 14, scope: !2926)
!2930 = !DILocation(line: 7, column: 36, scope: !2926)
!2931 = !DILocation(line: 7, column: 5, scope: !2926)
!2932 = distinct !{!2932, !2927, !2933, !107}
!2933 = !DILocation(line: 8, column: 16, scope: !2921)
!2934 = !DILocation(line: 9, column: 1, scope: !2910)
!2935 = distinct !DISubprogram(name: "kyber_memcpy", scope: !2911, file: !2911, line: 11, type: !2936, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !75, retainedNodes: !24)
!2936 = !DISubroutineType(types: !2937)
!2937 = !{null, !2914, !2938, !65}
!2938 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2939, size: 32)
!2939 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!2940 = !DILocalVariable(name: "dst", arg: 1, scope: !2935, file: !2911, line: 11, type: !2914)
!2941 = !DILocation(line: 0, scope: !2935)
!2942 = !DILocalVariable(name: "src", arg: 2, scope: !2935, file: !2911, line: 11, type: !2938)
!2943 = !DILocalVariable(name: "len", arg: 3, scope: !2935, file: !2911, line: 11, type: !65)
!2944 = !DILocalVariable(name: "d", scope: !2935, file: !2911, line: 13, type: !6)
!2945 = !DILocalVariable(name: "s", scope: !2935, file: !2911, line: 14, type: !234)
!2946 = !DILocalVariable(name: "i", scope: !2947, file: !2911, line: 16, type: !65)
!2947 = distinct !DILexicalBlock(scope: !2935, file: !2911, line: 16, column: 5)
!2948 = !DILocation(line: 0, scope: !2947)
!2949 = !DILocation(line: 16, column: 10, scope: !2947)
!2950 = !DILocation(line: 16, scope: !2947)
!2951 = !DILocation(line: 16, column: 28, scope: !2952)
!2952 = distinct !DILexicalBlock(scope: !2947, file: !2911, line: 16, column: 5)
!2953 = !DILocation(line: 16, column: 5, scope: !2947)
!2954 = !DILocation(line: 17, column: 16, scope: !2952)
!2955 = !DILocation(line: 17, column: 9, scope: !2952)
!2956 = !DILocation(line: 17, column: 14, scope: !2952)
!2957 = !DILocation(line: 16, column: 36, scope: !2952)
!2958 = !DILocation(line: 16, column: 5, scope: !2952)
!2959 = distinct !{!2959, !2953, !2960, !107}
!2960 = !DILocation(line: 17, column: 19, scope: !2947)
!2961 = !DILocation(line: 18, column: 1, scope: !2935)
