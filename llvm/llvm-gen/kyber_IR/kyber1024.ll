; ModuleID = 'kyber_composite'
source_filename = "kyber_composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "thumbv7em-unknown-none-eabihf"

@randombytes.fd = internal unnamed_addr global i32 -1, align 4, !dbg !0
@.str = private unnamed_addr constant [13 x i8] c"/dev/urandom\00", align 1, !dbg !18
@pqcrystals_kyber1024_ref_zetas = dso_local local_unnamed_addr constant [128 x i16] [i16 -1044, i16 -758, i16 -359, i16 -1517, i16 1493, i16 1422, i16 287, i16 202, i16 -171, i16 622, i16 1577, i16 182, i16 962, i16 -1202, i16 -1474, i16 1468, i16 573, i16 -1325, i16 264, i16 383, i16 -829, i16 1458, i16 -1602, i16 -130, i16 -681, i16 1017, i16 732, i16 608, i16 -1542, i16 411, i16 -205, i16 -1571, i16 1223, i16 652, i16 -552, i16 1015, i16 -1293, i16 1491, i16 -282, i16 -1544, i16 516, i16 -8, i16 -320, i16 -666, i16 -1618, i16 -1162, i16 126, i16 1469, i16 -853, i16 -90, i16 -271, i16 830, i16 107, i16 -1421, i16 -247, i16 -951, i16 -398, i16 961, i16 -1508, i16 -725, i16 448, i16 -1065, i16 677, i16 -1275, i16 -1103, i16 430, i16 555, i16 843, i16 -1251, i16 871, i16 1550, i16 105, i16 422, i16 587, i16 177, i16 -235, i16 -291, i16 -460, i16 1574, i16 1653, i16 -246, i16 778, i16 1159, i16 -147, i16 -777, i16 1483, i16 -602, i16 1119, i16 -1590, i16 644, i16 -872, i16 349, i16 418, i16 329, i16 -156, i16 -75, i16 817, i16 1097, i16 603, i16 610, i16 1322, i16 -1285, i16 -1465, i16 384, i16 -1215, i16 -136, i16 1218, i16 -1335, i16 -874, i16 220, i16 -1187, i16 -1659, i16 -1185, i16 -1530, i16 -1278, i16 794, i16 -1510, i16 -854, i16 -870, i16 478, i16 -108, i16 -308, i16 996, i16 991, i16 958, i16 -1460, i16 1522, i16 1628], align 2, !dbg !26
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
  %pk = alloca [1568 x i8], align 1
  %sk = alloca [3168 x i8], align 1
  %ct = alloca [1568 x i8], align 1
  %key_a = alloca [32 x i8], align 1
  %key_b = alloca [32 x i8], align 1
    #dbg_declare(ptr %pk, !108, !DIExpression(), !112)
    #dbg_declare(ptr %sk, !113, !DIExpression(), !117)
    #dbg_declare(ptr %ct, !118, !DIExpression(), !119)
    #dbg_declare(ptr %key_a, !120, !DIExpression(), !124)
    #dbg_declare(ptr %key_b, !125, !DIExpression(), !126)
  %call = call i32 @pqcrystals_kyber1024_ref_keypair(ptr noundef nonnull %pk, ptr noundef nonnull %sk) #3, !dbg !127
  %call5 = call i32 @pqcrystals_kyber1024_ref_enc(ptr noundef nonnull %ct, ptr noundef nonnull %key_b, ptr noundef nonnull %pk) #3, !dbg !128
  %call9 = call i32 @pqcrystals_kyber1024_ref_dec(ptr noundef nonnull %key_a, ptr noundef nonnull %ct, ptr noundef nonnull %sk) #3, !dbg !129
  %call12 = call i32 @memcmp(ptr noundef nonnull %key_a, ptr noundef nonnull %key_b, i32 noundef 32) #4, !dbg !130
  %tobool.not = icmp ne i32 %call12, 0, !dbg !130
  %. = zext i1 %tobool.not to i32, !dbg !132
  ret i32 %., !dbg !133
}

; Function Attrs: nounwind
define internal fastcc range(i32 0, 2) i32 @test_invalid_sk_a() unnamed_addr #0 !dbg !134 {
entry:
  %pk = alloca [1568 x i8], align 1
  %sk = alloca [3168 x i8], align 1
  %ct = alloca [1568 x i8], align 1
  %key_a = alloca [32 x i8], align 1
  %key_b = alloca [32 x i8], align 1
    #dbg_declare(ptr %pk, !135, !DIExpression(), !136)
    #dbg_declare(ptr %sk, !137, !DIExpression(), !138)
    #dbg_declare(ptr %ct, !139, !DIExpression(), !140)
    #dbg_declare(ptr %key_a, !141, !DIExpression(), !142)
    #dbg_declare(ptr %key_b, !143, !DIExpression(), !144)
  %call = call i32 @pqcrystals_kyber1024_ref_keypair(ptr noundef nonnull %pk, ptr noundef nonnull %sk) #3, !dbg !145
  %call5 = call i32 @pqcrystals_kyber1024_ref_enc(ptr noundef nonnull %ct, ptr noundef nonnull %key_b, ptr noundef nonnull %pk) #3, !dbg !146
  call void @randombytes(ptr noundef nonnull %sk, i32 noundef 3168) #3, !dbg !147
  %call10 = call i32 @pqcrystals_kyber1024_ref_dec(ptr noundef nonnull %key_a, ptr noundef nonnull %ct, ptr noundef nonnull %sk) #3, !dbg !148
  %call13 = call i32 @memcmp(ptr noundef nonnull %key_a, ptr noundef nonnull %key_b, i32 noundef 32) #4, !dbg !149
  %tobool.not = icmp eq i32 %call13, 0, !dbg !149
  %. = zext i1 %tobool.not to i32, !dbg !151
  ret i32 %., !dbg !152
}

; Function Attrs: nounwind
define internal fastcc range(i32 0, 2) i32 @test_invalid_ciphertext() unnamed_addr #0 !dbg !153 {
entry:
  %pk = alloca [1568 x i8], align 1
  %sk = alloca [3168 x i8], align 1
  %ct = alloca [1568 x i8], align 1
  %key_a = alloca [32 x i8], align 1
  %key_b = alloca [32 x i8], align 1
  %b = alloca i8, align 1
  %pos = alloca i32, align 4
    #dbg_declare(ptr %pk, !154, !DIExpression(), !155)
    #dbg_declare(ptr %sk, !156, !DIExpression(), !157)
    #dbg_declare(ptr %ct, !158, !DIExpression(), !159)
    #dbg_declare(ptr %key_a, !160, !DIExpression(), !161)
    #dbg_declare(ptr %key_b, !162, !DIExpression(), !163)
  br label %do.body, !dbg !164

do.body:                                          ; preds = %do.body, %entry
    #dbg_value(ptr %b, !165, !DIExpression(DW_OP_deref), !166)
  call void @randombytes(ptr noundef nonnull %b, i32 noundef 1) #3, !dbg !167
  %0 = load i8, ptr %b, align 1, !dbg !169
    #dbg_value(i8 %0, !165, !DIExpression(), !166)
  %tobool.not = icmp eq i8 %0, 0, !dbg !170
  br i1 %tobool.not, label %do.body, label %do.end, !dbg !171, !llvm.loop !172

do.end:                                           ; preds = %do.body
    #dbg_value(ptr %pos, !174, !DIExpression(DW_OP_deref), !166)
  call void @randombytes(ptr noundef nonnull %pos, i32 noundef 4) #3, !dbg !175
  %call = call i32 @pqcrystals_kyber1024_ref_keypair(ptr noundef nonnull %pk, ptr noundef nonnull %sk) #3, !dbg !176
  %call5 = call i32 @pqcrystals_kyber1024_ref_enc(ptr noundef nonnull %ct, ptr noundef nonnull %key_b, ptr noundef nonnull %pk) #3, !dbg !177
  %1 = load i8, ptr %b, align 1, !dbg !178
    #dbg_value(i8 %1, !165, !DIExpression(), !166)
  %2 = load i32, ptr %pos, align 4, !dbg !179
    #dbg_value(i32 %2, !174, !DIExpression(), !166)
  %rem = urem i32 %2, 1568, !dbg !180
  %arrayidx = getelementptr inbounds nuw [1568 x i8], ptr %ct, i32 0, i32 %rem, !dbg !181
  %3 = load i8, ptr %arrayidx, align 1, !dbg !182
  %xor1 = xor i8 %3, %1, !dbg !182
  store i8 %xor1, ptr %arrayidx, align 1, !dbg !182
  %call11 = call i32 @pqcrystals_kyber1024_ref_dec(ptr noundef nonnull %key_a, ptr noundef nonnull %ct, ptr noundef nonnull %sk) #3, !dbg !183
  %call14 = call i32 @memcmp(ptr noundef nonnull %key_a, ptr noundef nonnull %key_b, i32 noundef 32) #4, !dbg !184
  %tobool15.not = icmp eq i32 %call14, 0, !dbg !184
  %. = zext i1 %tobool15.not to i32, !dbg !166
  ret i32 %., !dbg !186
}

declare dso_local i32 @memcmp(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local void @randombytes(ptr noundef %out, i32 noundef %outlen) local_unnamed_addr #0 !dbg !2 {
entry:
    #dbg_value(ptr %out, !187, !DIExpression(), !188)
    #dbg_value(i32 %outlen, !189, !DIExpression(), !188)
  br label %while.cond, !dbg !190

while.cond:                                       ; preds = %while.cond.backedge, %entry
  %0 = load i32, ptr @randombytes.fd, align 4, !dbg !191
  %cmp = icmp eq i32 %0, -1, !dbg !192
  br i1 %cmp, label %while.body, label %while.cond7.preheader, !dbg !190

while.cond7.preheader:                            ; preds = %while.cond
  br label %while.cond7.outer, !dbg !193

while.body:                                       ; preds = %while.cond
  %call = call i32 (ptr, i32, ...) @open(ptr noundef nonnull @.str, i32 noundef 0) #4, !dbg !194
  store i32 %call, ptr @randombytes.fd, align 4, !dbg !196
  %cmp1 = icmp eq i32 %call, -1, !dbg !197
  br i1 %cmp1, label %land.lhs.true, label %if.else, !dbg !199

land.lhs.true:                                    ; preds = %while.body
  %call2 = call ptr @__errno() #4, !dbg !200
  %1 = load i32, ptr %call2, align 4, !dbg !200
  %cmp3 = icmp eq i32 %1, 4, !dbg !201
  br i1 %cmp3, label %while.cond.backedge, label %if.else, !dbg !199

if.else:                                          ; preds = %land.lhs.true, %while.body
  %2 = load i32, ptr @randombytes.fd, align 4, !dbg !202
  %cmp4 = icmp eq i32 %2, -1, !dbg !204
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !204

if.then5:                                         ; preds = %if.else
  call void @abort() #4, !dbg !205
  br label %if.end6, !dbg !205

if.end6:                                          ; preds = %if.else, %if.then5
  br label %while.cond.backedge, !dbg !190

while.cond.backedge:                              ; preds = %if.end6, %land.lhs.true
  br label %while.cond, !dbg !191, !llvm.loop !206

while.cond7:                                      ; preds = %while.cond7.outer, %land.lhs.true12
    #dbg_value(ptr %out.addr.0.ph, !187, !DIExpression(), !188)
    #dbg_value(i32 %outlen.addr.0.ph, !189, !DIExpression(), !188)
  %cmp8.not = icmp eq i32 %outlen.addr.0.ph, 0, !dbg !208
  br i1 %cmp8.not, label %while.end21, label %while.body9, !dbg !193

while.body9:                                      ; preds = %while.cond7
  %3 = load i32, ptr @randombytes.fd, align 4, !dbg !209
  %call10 = call i32 @read(i32 noundef %3, ptr noundef %out.addr.0.ph, i32 noundef %outlen.addr.0.ph) #4, !dbg !211
    #dbg_value(i32 %call10, !212, !DIExpression(), !188)
  %cond = icmp eq i32 %call10, -1, !dbg !217
  br i1 %cond, label %land.lhs.true12, label %if.end20.loopexit, !dbg !217

land.lhs.true12:                                  ; preds = %while.body9
  %call13 = call ptr @__errno() #4, !dbg !219
  %4 = load i32, ptr %call13, align 4, !dbg !219
  %cmp14 = icmp eq i32 %4, 4, !dbg !220
  br i1 %cmp14, label %while.cond7, label %if.then18, !dbg !217, !llvm.loop !221

if.then18:                                        ; preds = %land.lhs.true12
  %call10.lcssa1 = phi i32 [ %call10, %land.lhs.true12 ], !dbg !211
  call void @abort() #4, !dbg !223
  br label %if.end20, !dbg !223

if.end20.loopexit:                                ; preds = %while.body9
  %call10.lcssa = phi i32 [ %call10, %while.body9 ], !dbg !211
  br label %if.end20, !dbg !225

if.end20:                                         ; preds = %if.end20.loopexit, %if.then18
  %call102 = phi i32 [ %call10.lcssa, %if.end20.loopexit ], [ %call10.lcssa1, %if.then18 ]
  %add.ptr = getelementptr inbounds i8, ptr %out.addr.0.ph, i32 %call102, !dbg !225
    #dbg_value(ptr %add.ptr, !187, !DIExpression(), !188)
  %sub = sub i32 %outlen.addr.0.ph, %call102, !dbg !226
    #dbg_value(i32 %sub, !189, !DIExpression(), !188)
  br label %while.cond7.outer, !dbg !193, !llvm.loop !221

while.cond7.outer:                                ; preds = %while.cond7.preheader, %if.end20
  %outlen.addr.0.ph = phi i32 [ %outlen, %while.cond7.preheader ], [ %sub, %if.end20 ]
  %out.addr.0.ph = phi ptr [ %out, %while.cond7.preheader ], [ %add.ptr, %if.end20 ]
  br label %while.cond7, !dbg !193

while.end21:                                      ; preds = %while.cond7
  ret void, !dbg !227
}

declare dso_local i32 @open(ptr noundef, i32 noundef, ...) local_unnamed_addr #1

declare dso_local ptr @__errno() local_unnamed_addr #1

declare dso_local void @abort() local_unnamed_addr #1

declare dso_local i32 @read(i32 noundef, ptr noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber1024_ref_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) local_unnamed_addr #0 !dbg !228 {
entry:
    #dbg_value(ptr %pk, !234, !DIExpression(), !235)
    #dbg_value(ptr %sk, !236, !DIExpression(), !235)
    #dbg_value(ptr %coins, !237, !DIExpression(), !235)
  call void @pqcrystals_kyber1024_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) #3, !dbg !238
  %add.ptr = getelementptr inbounds nuw i8, ptr %sk, i32 1536, !dbg !239
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr, ptr noundef %pk, i32 noundef 1568) #4, !dbg !240
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %sk, i32 3104, !dbg !241
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr2, ptr noundef %pk, i32 noundef 1568) #3, !dbg !241
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %sk, i32 3136, !dbg !242
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %coins, i32 32, !dbg !243
  %call6 = call ptr @memcpy(ptr noundef nonnull %add.ptr4, ptr noundef nonnull %add.ptr5, i32 noundef 32) #4, !dbg !244
  ret i32 0, !dbg !245
}

declare dso_local ptr @memcpy(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber1024_ref_keypair(ptr noundef %pk, ptr noundef %sk) local_unnamed_addr #0 !dbg !246 {
entry:
  %coins = alloca [64 x i8], align 1
    #dbg_value(ptr %pk, !249, !DIExpression(), !250)
    #dbg_value(ptr %sk, !251, !DIExpression(), !250)
    #dbg_declare(ptr %coins, !252, !DIExpression(), !256)
  call void @randombytes(ptr noundef nonnull %coins, i32 noundef 64) #3, !dbg !257
  %call = call i32 @pqcrystals_kyber1024_ref_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef nonnull %coins) #3, !dbg !258
  ret i32 0, !dbg !259
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber1024_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef %coins) local_unnamed_addr #0 !dbg !260 {
entry:
  %buf = alloca [64 x i8], align 1
  %kr = alloca [64 x i8], align 1
    #dbg_value(ptr %ct, !263, !DIExpression(), !264)
    #dbg_value(ptr %ss, !265, !DIExpression(), !264)
    #dbg_value(ptr %pk, !266, !DIExpression(), !264)
    #dbg_value(ptr %coins, !267, !DIExpression(), !264)
    #dbg_declare(ptr %buf, !268, !DIExpression(), !269)
    #dbg_declare(ptr %kr, !270, !DIExpression(), !271)
  %call = call ptr @memcpy(ptr noundef nonnull %buf, ptr noundef %coins, i32 noundef 32) #4, !dbg !272
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !273
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr, ptr noundef %pk, i32 noundef 1568) #3, !dbg !273
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %kr, ptr noundef nonnull %buf, i32 noundef 64) #3, !dbg !274
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %kr, i32 32, !dbg !275
  call void @pqcrystals_kyber1024_ref_indcpa_enc(ptr noundef %ct, ptr noundef nonnull %buf, ptr noundef %pk, ptr noundef nonnull %add.ptr6) #3, !dbg !276
  %call8 = call ptr @memcpy(ptr noundef %ss, ptr noundef nonnull %kr, i32 noundef 32) #4, !dbg !277
  ret i32 0, !dbg !278
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber1024_ref_enc(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk) local_unnamed_addr #0 !dbg !279 {
entry:
  %coins = alloca [32 x i8], align 1
    #dbg_value(ptr %ct, !280, !DIExpression(), !281)
    #dbg_value(ptr %ss, !282, !DIExpression(), !281)
    #dbg_value(ptr %pk, !283, !DIExpression(), !281)
    #dbg_declare(ptr %coins, !284, !DIExpression(), !285)
  call void @randombytes(ptr noundef nonnull %coins, i32 noundef 32) #3, !dbg !286
  %call = call i32 @pqcrystals_kyber1024_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef nonnull %coins) #3, !dbg !287
  ret i32 0, !dbg !288
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber1024_ref_dec(ptr noundef %ss, ptr noundef %ct, ptr noundef %sk) local_unnamed_addr #0 !dbg !289 {
entry:
  %buf = alloca [64 x i8], align 1
  %kr = alloca [64 x i8], align 1
  %cmp = alloca [1568 x i8], align 1
    #dbg_value(ptr %ss, !292, !DIExpression(), !293)
    #dbg_value(ptr %ct, !294, !DIExpression(), !293)
    #dbg_value(ptr %sk, !295, !DIExpression(), !293)
    #dbg_declare(ptr %buf, !296, !DIExpression(), !297)
    #dbg_declare(ptr %kr, !298, !DIExpression(), !299)
    #dbg_declare(ptr %cmp, !300, !DIExpression(), !301)
  %add.ptr = getelementptr inbounds nuw i8, ptr %sk, i32 1536, !dbg !302
    #dbg_value(ptr %add.ptr, !303, !DIExpression(), !293)
  call void @pqcrystals_kyber1024_ref_indcpa_dec(ptr noundef nonnull %buf, ptr noundef %ct, ptr noundef %sk) #3, !dbg !304
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !305
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %sk, i32 3104, !dbg !306
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr2, ptr noundef nonnull %add.ptr4, i32 noundef 32) #4, !dbg !307
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %kr, ptr noundef nonnull %buf, i32 noundef 64) #3, !dbg !308
  %add.ptr10 = getelementptr inbounds nuw i8, ptr %kr, i32 32, !dbg !309
  call void @pqcrystals_kyber1024_ref_indcpa_enc(ptr noundef nonnull %cmp, ptr noundef nonnull %buf, ptr noundef nonnull %add.ptr, ptr noundef nonnull %add.ptr10) #3, !dbg !310
  %call12 = call i32 @pqcrystals_kyber1024_ref_verify(ptr noundef %ct, ptr noundef nonnull %cmp, i32 noundef 1568) #3, !dbg !311
    #dbg_value(i32 %call12, !312, !DIExpression(), !293)
  %add.ptr14 = getelementptr inbounds nuw i8, ptr %sk, i32 3136, !dbg !313
  call void @pqcrystals_kyber1024_ref_kyber_shake256_rkprf(ptr noundef %ss, ptr noundef nonnull %add.ptr14, ptr noundef %ct) #3, !dbg !313
  %0 = trunc nuw nsw i32 %call12 to i8, !dbg !314
  %conv = xor i8 %0, 1, !dbg !314
  call void @pqcrystals_kyber1024_ref_cmov(ptr noundef %ss, ptr noundef nonnull %kr, i32 noundef 32, i8 noundef zeroext %conv) #3, !dbg !315
  ret i32 0, !dbg !316
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_gen_matrix(ptr noundef %a, ptr noundef %seed, i32 noundef %transposed) local_unnamed_addr #0 !dbg !317 {
entry:
  %buf = alloca [504 x i8], align 1
  %state = alloca [26 x i64], align 8
    #dbg_value(ptr %a, !332, !DIExpression(), !333)
    #dbg_value(ptr %seed, !334, !DIExpression(), !333)
    #dbg_value(i32 %transposed, !335, !DIExpression(), !333)
    #dbg_declare(ptr %buf, !336, !DIExpression(), !340)
    #dbg_declare(ptr %state, !341, !DIExpression(), !349)
    #dbg_value(i32 0, !350, !DIExpression(), !333)
  br label %for.cond, !dbg !351

for.cond:                                         ; preds = %for.inc18, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc19, %for.inc18 ], !dbg !353
    #dbg_value(i32 %i.0, !350, !DIExpression(), !333)
  %exitcond1 = icmp ne i32 %i.0, 4, !dbg !354
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end20, !dbg !356

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !357

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc
  %j.0 = phi i32 [ %inc, %for.inc ], [ 0, %for.cond1.preheader ], !dbg !360
    #dbg_value(i32 %j.0, !361, !DIExpression(), !333)
  %exitcond = icmp ne i32 %j.0, 4, !dbg !362
  br i1 %exitcond, label %for.body3, label %for.inc18, !dbg !357

for.body3:                                        ; preds = %for.cond1
  %tobool.not = icmp eq i32 %transposed, 0, !dbg !364
  br i1 %tobool.not, label %if.else, label %if.then, !dbg !364

if.then:                                          ; preds = %for.body3
  %conv = trunc nuw i32 %i.0 to i8, !dbg !367
  %conv4 = trunc nuw nsw i32 %j.0 to i8, !dbg !367
  call void @pqcrystals_kyber1024_ref_kyber_shake128_absorb(ptr noundef nonnull %state, ptr noundef %seed, i8 noundef zeroext %conv, i8 noundef zeroext %conv4) #3, !dbg !367
  br label %if.end, !dbg !367

if.else:                                          ; preds = %for.body3
  %conv5 = trunc nuw nsw i32 %j.0 to i8, !dbg !368
  %conv6 = trunc nuw i32 %i.0 to i8, !dbg !368
  call void @pqcrystals_kyber1024_ref_kyber_shake128_absorb(ptr noundef nonnull %state, ptr noundef %seed, i8 noundef zeroext %conv5, i8 noundef zeroext %conv6) #3, !dbg !368
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef nonnull %buf, i32 noundef 3, ptr noundef nonnull %state) #3, !dbg !369
    #dbg_value(i32 504, !370, !DIExpression(), !333)
  %arrayidx7 = getelementptr inbounds nuw [4 x [256 x i16]], ptr %a, i32 %i.0, i32 %j.0, !dbg !371
  %call = call fastcc i32 @rej_uniform(ptr noundef %arrayidx7, i32 noundef 256, ptr noundef nonnull %buf, i32 noundef 504) #3, !dbg !372
    #dbg_value(i32 %call, !373, !DIExpression(), !333)
  br label %while.cond, !dbg !374

while.cond:                                       ; preds = %while.body, %if.end
  %ctr.0 = phi i32 [ %call, %if.end ], [ %add, %while.body ], !dbg !375
    #dbg_value(i32 %ctr.0, !373, !DIExpression(), !333)
  %cmp10 = icmp ult i32 %ctr.0, 256, !dbg !376
  br i1 %cmp10, label %while.body, label %for.inc, !dbg !374

while.body:                                       ; preds = %while.cond
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef nonnull %buf, i32 noundef 1, ptr noundef nonnull %state) #3, !dbg !377
    #dbg_value(i32 168, !370, !DIExpression(), !333)
  %arrayidx14 = getelementptr inbounds nuw [4 x [256 x i16]], ptr %a, i32 %i.0, i32 %j.0, !dbg !379
  %add.ptr = getelementptr inbounds nuw i16, ptr %arrayidx14, i32 %ctr.0, !dbg !380
  %sub = sub nuw nsw i32 256, %ctr.0, !dbg !381
  %call17 = call fastcc i32 @rej_uniform(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef nonnull %buf, i32 noundef 168) #3, !dbg !382
  %add = add i32 %ctr.0, %call17, !dbg !383
    #dbg_value(i32 %add, !373, !DIExpression(), !333)
  br label %while.cond, !dbg !374, !llvm.loop !384

for.inc:                                          ; preds = %while.cond
  %inc = add nuw nsw i32 %j.0, 1, !dbg !386
    #dbg_value(i32 %inc, !361, !DIExpression(), !333)
  br label %for.cond1, !dbg !387, !llvm.loop !388

for.inc18:                                        ; preds = %for.cond1
  %inc19 = add nuw nsw i32 %i.0, 1, !dbg !390
    #dbg_value(i32 %inc19, !350, !DIExpression(), !333)
  br label %for.cond, !dbg !391, !llvm.loop !392

for.end20:                                        ; preds = %for.cond
  ret void, !dbg !394
}

; Function Attrs: nounwind
define internal fastcc i32 @rej_uniform(ptr noundef %r, i32 noundef range(i32 1, 257) %len, ptr noundef nonnull %buf, i32 noundef range(i32 168, 505) %buflen) unnamed_addr #0 !dbg !395 {
entry:
    #dbg_value(ptr %r, !399, !DIExpression(), !400)
    #dbg_value(i32 %len, !401, !DIExpression(), !400)
    #dbg_value(ptr %buf, !402, !DIExpression(), !400)
    #dbg_value(i32 %buflen, !403, !DIExpression(), !400)
    #dbg_value(i32 0, !404, !DIExpression(), !400)
    #dbg_value(i32 0, !405, !DIExpression(), !400)
  br label %while.cond, !dbg !406

while.cond:                                       ; preds = %if.end33, %entry
  %ctr.0 = phi i32 [ 0, %entry ], [ %ctr.2, %if.end33 ], !dbg !400
  %pos.0 = phi i32 [ 0, %entry ], [ %add20, %if.end33 ], !dbg !400
    #dbg_value(i32 %pos.0, !404, !DIExpression(), !400)
    #dbg_value(i32 %ctr.0, !405, !DIExpression(), !400)
  %cmp = icmp ult i32 %ctr.0, %len, !dbg !407
  %add = add nuw nsw i32 %pos.0, 3, !dbg !408
  %cmp1 = icmp ule i32 %add, %buflen, !dbg !408
  %0 = select i1 %cmp, i1 %cmp1, i1 false, !dbg !408
  br i1 %0, label %while.body, label %while.end, !dbg !406

while.body:                                       ; preds = %while.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %buf, i32 %pos.0, !dbg !409
  %1 = load i8, ptr %arrayidx, align 1, !dbg !409
  %conv = zext i8 %1 to i16, !dbg !409
  %2 = getelementptr i8, ptr %buf, i32 %pos.0, !dbg !411
  %arrayidx4 = getelementptr i8, ptr %2, i32 1, !dbg !411
  %3 = load i8, ptr %arrayidx4, align 1, !dbg !411
  %conv6 = zext i8 %3 to i16, !dbg !412
  %shl = shl nuw i16 %conv6, 8, !dbg !413
  %shl.masked = and i16 %shl, 3840, !dbg !414
  %and = or disjoint i16 %shl.masked, %conv, !dbg !414
    #dbg_value(i16 %and, !415, !DIExpression(), !400)
  %4 = getelementptr i8, ptr %buf, i32 %pos.0, !dbg !416
  %arrayidx9 = getelementptr i8, ptr %4, i32 1, !dbg !416
  %5 = load i8, ptr %arrayidx9, align 1, !dbg !416
  %6 = lshr i8 %5, 4, !dbg !417
  %shr11 = zext nneg i8 %6 to i16, !dbg !417
  %7 = getelementptr i8, ptr %buf, i32 %pos.0, !dbg !418
  %arrayidx13 = getelementptr i8, ptr %7, i32 2, !dbg !418
  %8 = load i8, ptr %arrayidx13, align 1, !dbg !418
  %conv15 = zext i8 %8 to i16, !dbg !419
  %shl16 = shl nuw nsw i16 %conv15, 4, !dbg !420
  %or17 = or disjoint i16 %shl16, %shr11, !dbg !421
    #dbg_value(i16 %or17, !422, !DIExpression(), !400)
  %add20 = add nuw nsw i32 %pos.0, 3, !dbg !423
    #dbg_value(i32 %add20, !404, !DIExpression(), !400)
  %cmp22 = icmp samesign ult i16 %and, 3329, !dbg !424
  br i1 %cmp22, label %if.then, label %if.end, !dbg !424

if.then:                                          ; preds = %while.body
  %inc = add nuw nsw i32 %ctr.0, 1, !dbg !426
    #dbg_value(i32 %inc, !405, !DIExpression(), !400)
  %arrayidx24 = getelementptr inbounds nuw i16, ptr %r, i32 %ctr.0, !dbg !427
  store i16 %and, ptr %arrayidx24, align 2, !dbg !428
  br label %if.end, !dbg !427

if.end:                                           ; preds = %if.then, %while.body
  %ctr.1 = phi i32 [ %inc, %if.then ], [ %ctr.0, %while.body ], !dbg !400
    #dbg_value(i32 %ctr.1, !405, !DIExpression(), !400)
  %cmp25 = icmp ult i32 %ctr.1, %len, !dbg !429
  %cmp28 = icmp samesign ult i16 %or17, 3329
  %or.cond = select i1 %cmp25, i1 %cmp28, i1 false, !dbg !431
  br i1 %or.cond, label %if.then30, label %if.end33, !dbg !431

if.then30:                                        ; preds = %if.end
  %inc31 = add nuw nsw i32 %ctr.1, 1, !dbg !432
    #dbg_value(i32 %inc31, !405, !DIExpression(), !400)
  %arrayidx32 = getelementptr inbounds nuw i16, ptr %r, i32 %ctr.1, !dbg !433
  store i16 %or17, ptr %arrayidx32, align 2, !dbg !434
  br label %if.end33, !dbg !433

if.end33:                                         ; preds = %if.then30, %if.end
  %ctr.2 = phi i32 [ %inc31, %if.then30 ], [ %ctr.1, %if.end ], !dbg !435
    #dbg_value(i32 %ctr.2, !405, !DIExpression(), !400)
  br label %while.cond, !dbg !406, !llvm.loop !436

while.end:                                        ; preds = %while.cond
  %ctr.0.lcssa = phi i32 [ %ctr.0, %while.cond ], !dbg !400
  ret i32 %ctr.0.lcssa, !dbg !438
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) local_unnamed_addr #0 !dbg !439 {
entry:
  %buf = alloca [64 x i8], align 1
  %a = alloca [4 x [4 x [256 x i16]]], align 2
  %e = alloca [4 x [256 x i16]], align 2
  %pkpv = alloca [4 x [256 x i16]], align 2
  %skpv = alloca [4 x [256 x i16]], align 2
    #dbg_value(ptr %pk, !442, !DIExpression(), !443)
    #dbg_value(ptr %sk, !444, !DIExpression(), !443)
    #dbg_value(ptr %coins, !445, !DIExpression(), !443)
    #dbg_declare(ptr %buf, !446, !DIExpression(), !447)
    #dbg_value(ptr %buf, !448, !DIExpression(), !443)
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !449
    #dbg_value(ptr %add.ptr, !450, !DIExpression(), !443)
    #dbg_value(i8 0, !451, !DIExpression(), !443)
    #dbg_declare(ptr %a, !452, !DIExpression(), !454)
    #dbg_declare(ptr %e, !455, !DIExpression(), !456)
    #dbg_declare(ptr %pkpv, !457, !DIExpression(), !458)
    #dbg_declare(ptr %skpv, !459, !DIExpression(), !460)
  %call = call ptr @memcpy(ptr noundef nonnull %buf, ptr noundef %coins, i32 noundef 32) #4, !dbg !461
  %arrayidx = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !462
  store i8 4, ptr %arrayidx, align 1, !dbg !463
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %buf, ptr noundef nonnull %buf, i32 noundef 33) #3, !dbg !464
  call void @pqcrystals_kyber1024_ref_gen_matrix(ptr noundef nonnull %a, ptr noundef nonnull %buf, i32 noundef 0) #3, !dbg !465
    #dbg_value(i32 0, !466, !DIExpression(), !443)
  br label %for.cond, !dbg !467

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc7, %for.body ], !dbg !469
  %nonce.0 = phi i8 [ 0, %entry ], [ %inc, %for.body ], !dbg !443
    #dbg_value(i8 %nonce.0, !451, !DIExpression(), !443)
    #dbg_value(i32 %i.0, !466, !DIExpression(), !443)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !470
  br i1 %exitcond, label %for.body, label %for.cond8.preheader, !dbg !472

for.cond8.preheader:                              ; preds = %for.cond
  br label %for.cond8, !dbg !473

for.body:                                         ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds nuw [4 x [256 x i16]], ptr %skpv, i32 0, i32 %i.0, !dbg !475
    #dbg_value(i8 %nonce.0, !451, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !443)
  call void @pqcrystals_kyber1024_ref_poly_getnoise_eta1(ptr noundef nonnull %arrayidx6, ptr noundef nonnull %add.ptr, i8 noundef zeroext %nonce.0) #3, !dbg !476
  %inc = add nuw nsw i8 %nonce.0, 1, !dbg !477
    #dbg_value(i8 %inc, !451, !DIExpression(), !443)
  %inc7 = add nuw nsw i32 %i.0, 1, !dbg !478
    #dbg_value(i32 %inc7, !466, !DIExpression(), !443)
  br label %for.cond, !dbg !479, !llvm.loop !480

for.cond8:                                        ; preds = %for.cond8.preheader, %for.body10
  %i.1 = phi i32 [ %inc14, %for.body10 ], [ 0, %for.cond8.preheader ], !dbg !482
  %nonce.1 = phi i8 [ %inc12, %for.body10 ], [ 4, %for.cond8.preheader ], !dbg !443
    #dbg_value(i8 %nonce.1, !451, !DIExpression(), !443)
    #dbg_value(i32 %i.1, !466, !DIExpression(), !443)
  %exitcond1 = icmp ne i32 %i.1, 4, !dbg !483
  br i1 %exitcond1, label %for.body10, label %for.end15, !dbg !473

for.body10:                                       ; preds = %for.cond8
  %arrayidx11 = getelementptr inbounds nuw [4 x [256 x i16]], ptr %e, i32 0, i32 %i.1, !dbg !485
    #dbg_value(i8 %nonce.1, !451, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !443)
  call void @pqcrystals_kyber1024_ref_poly_getnoise_eta1(ptr noundef nonnull %arrayidx11, ptr noundef nonnull %add.ptr, i8 noundef zeroext %nonce.1) #3, !dbg !486
  %inc12 = add nuw nsw i8 %nonce.1, 1, !dbg !487
    #dbg_value(i8 %inc12, !451, !DIExpression(), !443)
  %inc14 = add nuw nsw i32 %i.1, 1, !dbg !488
    #dbg_value(i32 %inc14, !466, !DIExpression(), !443)
  br label %for.cond8, !dbg !489, !llvm.loop !490

for.end15:                                        ; preds = %for.cond8
  call void @pqcrystals_kyber1024_ref_polyvec_ntt(ptr noundef nonnull %skpv) #3, !dbg !492
  call void @pqcrystals_kyber1024_ref_polyvec_ntt(ptr noundef nonnull %e) #3, !dbg !493
    #dbg_value(i32 0, !466, !DIExpression(), !443)
  br label %for.cond16, !dbg !494

for.cond16:                                       ; preds = %for.body18, %for.end15
  %i.2 = phi i32 [ 0, %for.end15 ], [ %inc23, %for.body18 ], !dbg !496
    #dbg_value(i32 %i.2, !466, !DIExpression(), !443)
  %exitcond2 = icmp ne i32 %i.2, 4, !dbg !497
  br i1 %exitcond2, label %for.body18, label %for.end24, !dbg !499

for.body18:                                       ; preds = %for.cond16
  %arrayidx19 = getelementptr inbounds nuw [4 x [256 x i16]], ptr %pkpv, i32 0, i32 %i.2, !dbg !500
  %arrayidx20 = getelementptr inbounds nuw [4 x [4 x [256 x i16]]], ptr %a, i32 0, i32 %i.2, !dbg !502
  call void @pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %arrayidx19, ptr noundef nonnull %arrayidx20, ptr noundef nonnull %skpv) #3, !dbg !503
  %arrayidx21 = getelementptr inbounds nuw [4 x [256 x i16]], ptr %pkpv, i32 0, i32 %i.2, !dbg !504
  call void @pqcrystals_kyber1024_ref_poly_tomont(ptr noundef nonnull %arrayidx21) #3, !dbg !505
  %inc23 = add nuw nsw i32 %i.2, 1, !dbg !506
    #dbg_value(i32 %inc23, !466, !DIExpression(), !443)
  br label %for.cond16, !dbg !507, !llvm.loop !508

for.end24:                                        ; preds = %for.cond16
  call void @pqcrystals_kyber1024_ref_polyvec_add(ptr noundef nonnull %pkpv, ptr noundef nonnull %pkpv, ptr noundef nonnull %e) #3, !dbg !510
  call void @pqcrystals_kyber1024_ref_polyvec_reduce(ptr noundef nonnull %pkpv) #3, !dbg !511
  call fastcc void @pack_sk(ptr noundef %sk, ptr noundef nonnull %skpv) #3, !dbg !512
  call fastcc void @pack_pk(ptr noundef %pk, ptr noundef nonnull %pkpv, ptr noundef nonnull %buf) #3, !dbg !513
  ret void, !dbg !514
}

; Function Attrs: nounwind
define internal fastcc void @pack_sk(ptr noundef %r, ptr noundef nonnull %sk) unnamed_addr #0 !dbg !515 {
entry:
    #dbg_value(ptr %r, !518, !DIExpression(), !519)
    #dbg_value(ptr %sk, !520, !DIExpression(), !519)
  call void @pqcrystals_kyber1024_ref_polyvec_tobytes(ptr noundef %r, ptr noundef nonnull %sk) #3, !dbg !521
  ret void, !dbg !522
}

; Function Attrs: nounwind
define internal fastcc void @pack_pk(ptr noundef %r, ptr noundef nonnull %pk, ptr noundef nonnull %seed) unnamed_addr #0 !dbg !523 {
entry:
    #dbg_value(ptr %r, !526, !DIExpression(), !527)
    #dbg_value(ptr %pk, !528, !DIExpression(), !527)
    #dbg_value(ptr %seed, !529, !DIExpression(), !527)
  call void @pqcrystals_kyber1024_ref_polyvec_tobytes(ptr noundef %r, ptr noundef nonnull %pk) #3, !dbg !530
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 1536, !dbg !531
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr, ptr noundef nonnull %seed, i32 noundef 32) #4, !dbg !532
  ret void, !dbg !533
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_indcpa_enc(ptr noundef %c, ptr noundef %m, ptr noundef %pk, ptr noundef %coins) local_unnamed_addr #0 !dbg !534 {
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
    #dbg_value(ptr %c, !537, !DIExpression(), !538)
    #dbg_value(ptr %m, !539, !DIExpression(), !538)
    #dbg_value(ptr %pk, !540, !DIExpression(), !538)
    #dbg_value(ptr %coins, !541, !DIExpression(), !538)
    #dbg_declare(ptr %seed, !542, !DIExpression(), !543)
    #dbg_value(i8 0, !544, !DIExpression(), !538)
    #dbg_declare(ptr %sp, !545, !DIExpression(), !546)
    #dbg_declare(ptr %pkpv, !547, !DIExpression(), !548)
    #dbg_declare(ptr %ep, !549, !DIExpression(), !550)
    #dbg_declare(ptr %at, !551, !DIExpression(), !552)
    #dbg_declare(ptr %b, !553, !DIExpression(), !554)
    #dbg_declare(ptr %v, !555, !DIExpression(), !556)
    #dbg_declare(ptr %k, !557, !DIExpression(), !558)
    #dbg_declare(ptr %epp, !559, !DIExpression(), !560)
  call fastcc void @unpack_pk(ptr noundef nonnull %pkpv, ptr noundef nonnull %seed, ptr noundef %pk) #3, !dbg !561
  call void @pqcrystals_kyber1024_ref_poly_frommsg(ptr noundef nonnull %k, ptr noundef %m) #3, !dbg !562
  call void @pqcrystals_kyber1024_ref_gen_matrix(ptr noundef nonnull %at, ptr noundef nonnull %seed, i32 noundef 1) #3, !dbg !563
    #dbg_value(i32 0, !564, !DIExpression(), !538)
  br label %for.cond, !dbg !565

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc4, %for.body ], !dbg !567
  %nonce.0 = phi i8 [ 0, %entry ], [ %inc, %for.body ], !dbg !538
    #dbg_value(i8 %nonce.0, !544, !DIExpression(), !538)
    #dbg_value(i32 %i.0, !564, !DIExpression(), !538)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !568
  br i1 %exitcond, label %for.body, label %for.cond5.preheader, !dbg !570

for.cond5.preheader:                              ; preds = %for.cond
  br label %for.cond5, !dbg !571

for.body:                                         ; preds = %for.cond
  %add.ptr = getelementptr inbounds nuw [256 x i16], ptr %sp, i32 %i.0, !dbg !573
    #dbg_value(i8 %nonce.0, !544, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !538)
  call void @pqcrystals_kyber1024_ref_poly_getnoise_eta1(ptr noundef nonnull %add.ptr, ptr noundef %coins, i8 noundef zeroext %nonce.0) #3, !dbg !574
  %inc = add nuw nsw i8 %nonce.0, 1, !dbg !575
    #dbg_value(i8 %inc, !544, !DIExpression(), !538)
  %inc4 = add nuw nsw i32 %i.0, 1, !dbg !576
    #dbg_value(i32 %inc4, !564, !DIExpression(), !538)
  br label %for.cond, !dbg !577, !llvm.loop !578

for.cond5:                                        ; preds = %for.cond5.preheader, %for.body7
  %i.1 = phi i32 [ %inc12, %for.body7 ], [ 0, %for.cond5.preheader ], !dbg !580
  %nonce.1 = phi i8 [ %inc10, %for.body7 ], [ 4, %for.cond5.preheader ], !dbg !538
    #dbg_value(i8 %nonce.1, !544, !DIExpression(), !538)
    #dbg_value(i32 %i.1, !564, !DIExpression(), !538)
  %exitcond1 = icmp ne i32 %i.1, 4, !dbg !581
  br i1 %exitcond1, label %for.body7, label %for.end13, !dbg !571

for.body7:                                        ; preds = %for.cond5
  %add.ptr9 = getelementptr inbounds nuw [256 x i16], ptr %ep, i32 %i.1, !dbg !583
    #dbg_value(i8 %nonce.1, !544, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !538)
  call void @pqcrystals_kyber1024_ref_poly_getnoise_eta2(ptr noundef nonnull %add.ptr9, ptr noundef %coins, i8 noundef zeroext %nonce.1) #3, !dbg !584
  %inc10 = add nuw nsw i8 %nonce.1, 1, !dbg !585
    #dbg_value(i8 %inc10, !544, !DIExpression(), !538)
  %inc12 = add nuw nsw i32 %i.1, 1, !dbg !586
    #dbg_value(i32 %inc12, !564, !DIExpression(), !538)
  br label %for.cond5, !dbg !587, !llvm.loop !588

for.end13:                                        ; preds = %for.cond5
    #dbg_value(i8 8, !544, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !538)
  call void @pqcrystals_kyber1024_ref_poly_getnoise_eta2(ptr noundef nonnull %epp, ptr noundef %coins, i8 noundef zeroext 8) #3, !dbg !590
  call void @pqcrystals_kyber1024_ref_polyvec_ntt(ptr noundef nonnull %sp) #3, !dbg !591
    #dbg_value(i32 0, !564, !DIExpression(), !538)
  br label %for.cond15, !dbg !592

for.cond15:                                       ; preds = %for.body17, %for.end13
  %i.2 = phi i32 [ 0, %for.end13 ], [ %inc20, %for.body17 ], !dbg !594
    #dbg_value(i32 %i.2, !564, !DIExpression(), !538)
  %exitcond2 = icmp ne i32 %i.2, 4, !dbg !595
  br i1 %exitcond2, label %for.body17, label %for.end21, !dbg !597

for.body17:                                       ; preds = %for.cond15
  %arrayidx = getelementptr inbounds nuw [4 x [256 x i16]], ptr %b, i32 0, i32 %i.2, !dbg !598
  %arrayidx18 = getelementptr inbounds nuw [4 x [4 x [256 x i16]]], ptr %at, i32 0, i32 %i.2, !dbg !599
  call void @pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %arrayidx, ptr noundef nonnull %arrayidx18, ptr noundef nonnull %sp) #3, !dbg !600
  %inc20 = add nuw nsw i32 %i.2, 1, !dbg !601
    #dbg_value(i32 %inc20, !564, !DIExpression(), !538)
  br label %for.cond15, !dbg !602, !llvm.loop !603

for.end21:                                        ; preds = %for.cond15
  call void @pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %v, ptr noundef nonnull %pkpv, ptr noundef nonnull %sp) #3, !dbg !605
  call void @pqcrystals_kyber1024_ref_polyvec_invntt_tomont(ptr noundef nonnull %b) #3, !dbg !606
  call void @pqcrystals_kyber1024_ref_poly_invntt_tomont(ptr noundef nonnull %v) #3, !dbg !607
  call void @pqcrystals_kyber1024_ref_polyvec_add(ptr noundef nonnull %b, ptr noundef nonnull %b, ptr noundef nonnull %ep) #3, !dbg !608
  call void @pqcrystals_kyber1024_ref_poly_add(ptr noundef nonnull %v, ptr noundef nonnull %v, ptr noundef nonnull %epp) #3, !dbg !609
  call void @pqcrystals_kyber1024_ref_poly_add(ptr noundef nonnull %v, ptr noundef nonnull %v, ptr noundef nonnull %k) #3, !dbg !610
  call void @pqcrystals_kyber1024_ref_polyvec_reduce(ptr noundef nonnull %b) #3, !dbg !611
  call void @pqcrystals_kyber1024_ref_poly_reduce(ptr noundef nonnull %v) #3, !dbg !612
  call fastcc void @pack_ciphertext(ptr noundef %c, ptr noundef nonnull %b, ptr noundef nonnull %v) #3, !dbg !613
  ret void, !dbg !614
}

; Function Attrs: nounwind
define internal fastcc void @unpack_pk(ptr noundef nonnull %pk, ptr noundef nonnull %seed, ptr noundef %packedpk) unnamed_addr #0 !dbg !615 {
entry:
    #dbg_value(ptr %pk, !618, !DIExpression(), !619)
    #dbg_value(ptr %seed, !620, !DIExpression(), !619)
    #dbg_value(ptr %packedpk, !621, !DIExpression(), !619)
  call void @pqcrystals_kyber1024_ref_polyvec_frombytes(ptr noundef nonnull %pk, ptr noundef %packedpk) #3, !dbg !622
  %add.ptr = getelementptr inbounds nuw i8, ptr %packedpk, i32 1536, !dbg !623
  %call = call ptr @memcpy(ptr noundef nonnull %seed, ptr noundef nonnull %add.ptr, i32 noundef 32) #4, !dbg !624
  ret void, !dbg !625
}

; Function Attrs: nounwind
define internal fastcc void @pack_ciphertext(ptr noundef %r, ptr noundef nonnull %b, ptr noundef nonnull %v) unnamed_addr #0 !dbg !626 {
entry:
    #dbg_value(ptr %r, !630, !DIExpression(), !631)
    #dbg_value(ptr %b, !632, !DIExpression(), !631)
    #dbg_value(ptr %v, !633, !DIExpression(), !631)
  call void @pqcrystals_kyber1024_ref_polyvec_compress(ptr noundef %r, ptr noundef nonnull %b) #3, !dbg !634
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 1408, !dbg !635
  call void @pqcrystals_kyber1024_ref_poly_compress(ptr noundef nonnull %add.ptr, ptr noundef nonnull %v) #3, !dbg !636
  ret void, !dbg !637
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_indcpa_dec(ptr noundef %m, ptr noundef %c, ptr noundef %sk) local_unnamed_addr #0 !dbg !638 {
entry:
  %b = alloca [4 x [256 x i16]], align 2
  %skpv = alloca [4 x [256 x i16]], align 2
  %v = alloca [256 x i16], align 2
  %mp = alloca [256 x i16], align 2
    #dbg_value(ptr %m, !641, !DIExpression(), !642)
    #dbg_value(ptr %c, !643, !DIExpression(), !642)
    #dbg_value(ptr %sk, !644, !DIExpression(), !642)
    #dbg_declare(ptr %b, !645, !DIExpression(), !646)
    #dbg_declare(ptr %skpv, !647, !DIExpression(), !648)
    #dbg_declare(ptr %v, !649, !DIExpression(), !650)
    #dbg_declare(ptr %mp, !651, !DIExpression(), !652)
  call fastcc void @unpack_ciphertext(ptr noundef nonnull %b, ptr noundef nonnull %v, ptr noundef %c) #3, !dbg !653
  call fastcc void @unpack_sk(ptr noundef nonnull %skpv, ptr noundef %sk) #3, !dbg !654
  call void @pqcrystals_kyber1024_ref_polyvec_ntt(ptr noundef nonnull %b) #3, !dbg !655
  call void @pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %mp, ptr noundef nonnull %skpv, ptr noundef nonnull %b) #3, !dbg !656
  call void @pqcrystals_kyber1024_ref_poly_invntt_tomont(ptr noundef nonnull %mp) #3, !dbg !657
  call void @pqcrystals_kyber1024_ref_poly_sub(ptr noundef nonnull %mp, ptr noundef nonnull %v, ptr noundef nonnull %mp) #3, !dbg !658
  call void @pqcrystals_kyber1024_ref_poly_reduce(ptr noundef nonnull %mp) #3, !dbg !659
  call void @pqcrystals_kyber1024_ref_poly_tomsg(ptr noundef %m, ptr noundef nonnull %mp) #3, !dbg !660
  ret void, !dbg !661
}

; Function Attrs: nounwind
define internal fastcc void @unpack_ciphertext(ptr noundef nonnull %b, ptr noundef nonnull %v, ptr noundef %c) unnamed_addr #0 !dbg !662 {
entry:
    #dbg_value(ptr %b, !665, !DIExpression(), !666)
    #dbg_value(ptr %v, !667, !DIExpression(), !666)
    #dbg_value(ptr %c, !668, !DIExpression(), !666)
  call void @pqcrystals_kyber1024_ref_polyvec_decompress(ptr noundef nonnull %b, ptr noundef %c) #3, !dbg !669
  %add.ptr = getelementptr inbounds nuw i8, ptr %c, i32 1408, !dbg !670
  call void @pqcrystals_kyber1024_ref_poly_decompress(ptr noundef nonnull %v, ptr noundef nonnull %add.ptr) #3, !dbg !671
  ret void, !dbg !672
}

; Function Attrs: nounwind
define internal fastcc void @unpack_sk(ptr noundef nonnull %sk, ptr noundef %packedsk) unnamed_addr #0 !dbg !673 {
entry:
    #dbg_value(ptr %sk, !676, !DIExpression(), !677)
    #dbg_value(ptr %packedsk, !678, !DIExpression(), !677)
  call void @pqcrystals_kyber1024_ref_polyvec_frombytes(ptr noundef nonnull %sk, ptr noundef %packedsk) #3, !dbg !679
  ret void, !dbg !680
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_compress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !681 {
entry:
  %t = alloca [8 x i16], align 2
    #dbg_value(ptr %r, !687, !DIExpression(), !688)
    #dbg_value(ptr %a, !689, !DIExpression(), !688)
    #dbg_declare(ptr %t, !690, !DIExpression(), !694)
    #dbg_value(i32 0, !695, !DIExpression(), !688)
  br label %for.cond, !dbg !696

for.cond:                                         ; preds = %for.inc107, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc108, %for.inc107 ], !dbg !698
  %r.addr.0 = phi ptr [ %r, %entry ], [ %r.addr.1.lcssa, %for.inc107 ]
    #dbg_value(ptr %r.addr.0, !687, !DIExpression(), !688)
    #dbg_value(i32 %i.0, !695, !DIExpression(), !688)
  %exitcond2 = icmp ne i32 %i.0, 4, !dbg !699
  br i1 %exitcond2, label %for.cond1.preheader, label %for.end109, !dbg !701

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !702

for.cond1:                                        ; preds = %for.cond1.preheader, %for.end
  %j.0 = phi i32 [ %inc105, %for.end ], [ 0, %for.cond1.preheader ], !dbg !705
  %r.addr.1 = phi ptr [ %add.ptr, %for.end ], [ %r.addr.0, %for.cond1.preheader ]
    #dbg_value(ptr %r.addr.1, !687, !DIExpression(), !688)
    #dbg_value(i32 %j.0, !706, !DIExpression(), !688)
  %exitcond1 = icmp ne i32 %j.0, 32, !dbg !707
  br i1 %exitcond1, label %for.cond4.preheader, label %for.inc107, !dbg !702

for.cond4.preheader:                              ; preds = %for.cond1
  br label %for.cond4, !dbg !709

for.cond4:                                        ; preds = %for.cond4.preheader, %for.body6
  %k.0 = phi i32 [ %inc, %for.body6 ], [ 0, %for.cond4.preheader ], !dbg !712
    #dbg_value(i32 %k.0, !713, !DIExpression(), !688)
  %exitcond = icmp ne i32 %k.0, 8, !dbg !714
  br i1 %exitcond, label %for.body6, label %for.end, !dbg !709

for.body6:                                        ; preds = %for.cond4
  %mul = shl nuw nsw i32 %j.0, 3, !dbg !716
  %add = or disjoint i32 %mul, %k.0, !dbg !718
  %arrayidx7 = getelementptr inbounds nuw [4 x [256 x i16]], ptr %a, i32 0, i32 %i.0, i32 %add, !dbg !719
  %0 = load i16, ptr %arrayidx7, align 2, !dbg !719
  %isneg = icmp slt i16 %0, 0, !dbg !720
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !720
  %arrayidx10 = getelementptr inbounds nuw [8 x i16], ptr %t, i32 0, i32 %k.0, !dbg !721
  %add12 = add i16 %and, %0, !dbg !722
  store i16 %add12, ptr %arrayidx10, align 2, !dbg !722
  %conv15 = zext i16 %add12 to i64, !dbg !723
    #dbg_value(i64 %conv15, !724, !DIExpression(), !688)
    #dbg_value(i64 %conv15, !724, !DIExpression(DW_OP_constu, 11, DW_OP_shl, DW_OP_stack_value), !688)
    #dbg_value(i64 %conv15, !724, !DIExpression(DW_OP_constu, 11, DW_OP_shl, DW_OP_constu, 1664, DW_OP_or, DW_OP_stack_value), !688)
  %1 = mul nuw nsw i64 %conv15, 1321132032, !dbg !725
  %mul17 = add nuw nsw i64 %1, 1073419776, !dbg !725
    #dbg_value(i64 %mul17, !724, !DIExpression(), !688)
  %shr18 = lshr i64 %mul17, 31, !dbg !726
    #dbg_value(i64 %shr18, !724, !DIExpression(), !688)
  %2 = trunc nuw i64 %shr18 to i16, !dbg !727
  %conv20 = and i16 %2, 2047, !dbg !727
  %arrayidx21 = getelementptr inbounds nuw [8 x i16], ptr %t, i32 0, i32 %k.0, !dbg !728
  store i16 %conv20, ptr %arrayidx21, align 2, !dbg !729
  %inc = add nuw nsw i32 %k.0, 1, !dbg !730
    #dbg_value(i32 %inc, !713, !DIExpression(), !688)
  br label %for.cond4, !dbg !731, !llvm.loop !732

for.end:                                          ; preds = %for.cond4
  %3 = load i16, ptr %t, align 2, !dbg !734
  %conv25 = trunc i16 %3 to i8, !dbg !735
  store i8 %conv25, ptr %r.addr.1, align 1, !dbg !736
  %4 = load i16, ptr %t, align 2, !dbg !737
  %5 = lshr i16 %4, 8, !dbg !738
  %shr29 = trunc nuw i16 %5 to i8, !dbg !738
  %arrayidx30 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !739
  %6 = load i16, ptr %arrayidx30, align 2, !dbg !739
  %conv31 = trunc i16 %6 to i8, !dbg !739
  %shl32 = shl i8 %conv31, 3, !dbg !740
  %or = or i8 %shl32, %shr29, !dbg !741
  %arrayidx34 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 1, !dbg !742
  store i8 %or, ptr %arrayidx34, align 1, !dbg !743
  %arrayidx35 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !744
  %7 = load i16, ptr %arrayidx35, align 2, !dbg !744
  %8 = lshr i16 %7, 5, !dbg !745
  %shr37 = trunc i16 %8 to i8, !dbg !745
  %arrayidx38 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !746
  %9 = load i16, ptr %arrayidx38, align 2, !dbg !746
  %conv39 = trunc i16 %9 to i8, !dbg !746
  %shl40 = shl i8 %conv39, 6, !dbg !747
  %or41 = or i8 %shl40, %shr37, !dbg !748
  %arrayidx43 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 2, !dbg !749
  store i8 %or41, ptr %arrayidx43, align 1, !dbg !750
  %arrayidx44 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !751
  %10 = load i16, ptr %arrayidx44, align 2, !dbg !751
  %11 = lshr i16 %10, 2, !dbg !752
  %conv47 = trunc i16 %11 to i8, !dbg !753
  %arrayidx48 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 3, !dbg !754
  store i8 %conv47, ptr %arrayidx48, align 1, !dbg !755
  %arrayidx49 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !756
  %12 = load i16, ptr %arrayidx49, align 2, !dbg !756
  %13 = lshr i16 %12, 10, !dbg !757
  %shr51 = trunc nuw nsw i16 %13 to i8, !dbg !757
  %arrayidx52 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !758
  %14 = load i16, ptr %arrayidx52, align 2, !dbg !758
  %conv53 = trunc i16 %14 to i8, !dbg !758
  %shl54 = shl i8 %conv53, 1, !dbg !759
  %or55 = or i8 %shl54, %shr51, !dbg !760
  %arrayidx57 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 4, !dbg !761
  store i8 %or55, ptr %arrayidx57, align 1, !dbg !762
  %arrayidx58 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !763
  %15 = load i16, ptr %arrayidx58, align 2, !dbg !763
  %16 = lshr i16 %15, 7, !dbg !764
  %shr60 = trunc i16 %16 to i8, !dbg !764
  %arrayidx61 = getelementptr inbounds nuw i8, ptr %t, i32 8, !dbg !765
  %17 = load i16, ptr %arrayidx61, align 2, !dbg !765
  %conv62 = trunc i16 %17 to i8, !dbg !765
  %shl63 = shl i8 %conv62, 4, !dbg !766
  %or64 = or i8 %shl63, %shr60, !dbg !767
  %arrayidx66 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 5, !dbg !768
  store i8 %or64, ptr %arrayidx66, align 1, !dbg !769
  %arrayidx67 = getelementptr inbounds nuw i8, ptr %t, i32 8, !dbg !770
  %18 = load i16, ptr %arrayidx67, align 2, !dbg !770
  %19 = lshr i16 %18, 4, !dbg !771
  %shr69 = trunc i16 %19 to i8, !dbg !771
  %arrayidx70 = getelementptr inbounds nuw i8, ptr %t, i32 10, !dbg !772
  %20 = load i16, ptr %arrayidx70, align 2, !dbg !772
  %conv71 = trunc i16 %20 to i8, !dbg !772
  %shl72 = shl i8 %conv71, 7, !dbg !773
  %or73 = or i8 %shl72, %shr69, !dbg !774
  %arrayidx75 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 6, !dbg !775
  store i8 %or73, ptr %arrayidx75, align 1, !dbg !776
  %arrayidx76 = getelementptr inbounds nuw i8, ptr %t, i32 10, !dbg !777
  %21 = load i16, ptr %arrayidx76, align 2, !dbg !777
  %22 = lshr i16 %21, 1, !dbg !778
  %conv79 = trunc i16 %22 to i8, !dbg !779
  %arrayidx80 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 7, !dbg !780
  store i8 %conv79, ptr %arrayidx80, align 1, !dbg !781
  %arrayidx81 = getelementptr inbounds nuw i8, ptr %t, i32 10, !dbg !782
  %23 = load i16, ptr %arrayidx81, align 2, !dbg !782
  %24 = lshr i16 %23, 9, !dbg !783
  %shr83 = trunc nuw nsw i16 %24 to i8, !dbg !783
  %arrayidx84 = getelementptr inbounds nuw i8, ptr %t, i32 12, !dbg !784
  %25 = load i16, ptr %arrayidx84, align 2, !dbg !784
  %conv85 = trunc i16 %25 to i8, !dbg !784
  %shl86 = shl i8 %conv85, 2, !dbg !785
  %or87 = or i8 %shl86, %shr83, !dbg !786
  %arrayidx89 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 8, !dbg !787
  store i8 %or87, ptr %arrayidx89, align 1, !dbg !788
  %arrayidx90 = getelementptr inbounds nuw i8, ptr %t, i32 12, !dbg !789
  %26 = load i16, ptr %arrayidx90, align 2, !dbg !789
  %27 = lshr i16 %26, 6, !dbg !790
  %shr92 = trunc i16 %27 to i8, !dbg !790
  %arrayidx93 = getelementptr inbounds nuw i8, ptr %t, i32 14, !dbg !791
  %28 = load i16, ptr %arrayidx93, align 2, !dbg !791
  %conv94 = trunc i16 %28 to i8, !dbg !791
  %shl95 = shl i8 %conv94, 5, !dbg !792
  %or96 = or i8 %shl95, %shr92, !dbg !793
  %arrayidx98 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 9, !dbg !794
  store i8 %or96, ptr %arrayidx98, align 1, !dbg !795
  %arrayidx99 = getelementptr inbounds nuw i8, ptr %t, i32 14, !dbg !796
  %29 = load i16, ptr %arrayidx99, align 2, !dbg !796
  %30 = lshr i16 %29, 3, !dbg !797
  %conv102 = trunc i16 %30 to i8, !dbg !798
  %arrayidx103 = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 10, !dbg !799
  store i8 %conv102, ptr %arrayidx103, align 1, !dbg !800
    #dbg_value(ptr %r.addr.1, !687, !DIExpression(DW_OP_plus_uconst, 11, DW_OP_stack_value), !688)
  %add.ptr = getelementptr inbounds nuw i8, ptr %r.addr.1, i32 11, !dbg !801
    #dbg_value(ptr %add.ptr, !687, !DIExpression(), !688)
  %inc105 = add nuw nsw i32 %j.0, 1, !dbg !802
    #dbg_value(i32 %inc105, !706, !DIExpression(), !688)
  br label %for.cond1, !dbg !803, !llvm.loop !804

for.inc107:                                       ; preds = %for.cond1
  %r.addr.1.lcssa = phi ptr [ %r.addr.1, %for.cond1 ]
  %inc108 = add nuw nsw i32 %i.0, 1, !dbg !806
    #dbg_value(i32 %inc108, !695, !DIExpression(), !688)
  br label %for.cond, !dbg !807, !llvm.loop !808

for.end109:                                       ; preds = %for.cond
  ret void, !dbg !810
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_decompress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !811 {
entry:
  %t = alloca [8 x i16], align 2
    #dbg_value(ptr %r, !812, !DIExpression(), !813)
    #dbg_value(ptr %a, !814, !DIExpression(), !813)
    #dbg_declare(ptr %t, !815, !DIExpression(), !816)
    #dbg_value(i32 0, !817, !DIExpression(), !813)
  br label %for.cond, !dbg !818

for.cond:                                         ; preds = %for.inc104, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc105, %for.inc104 ], !dbg !820
  %a.addr.0 = phi ptr [ %a, %entry ], [ %a.addr.1.lcssa, %for.inc104 ]
    #dbg_value(ptr %a.addr.0, !814, !DIExpression(), !813)
    #dbg_value(i32 %i.0, !817, !DIExpression(), !813)
  %exitcond2 = icmp ne i32 %i.0, 4, !dbg !821
  br i1 %exitcond2, label %for.cond1.preheader, label %for.end106, !dbg !823

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !824

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc101
  %j.0 = phi i32 [ %inc102, %for.inc101 ], [ 0, %for.cond1.preheader ], !dbg !827
  %a.addr.1 = phi ptr [ %add.ptr, %for.inc101 ], [ %a.addr.0, %for.cond1.preheader ]
    #dbg_value(ptr %a.addr.1, !814, !DIExpression(), !813)
    #dbg_value(i32 %j.0, !828, !DIExpression(), !813)
  %exitcond1 = icmp ne i32 %j.0, 32, !dbg !829
  br i1 %exitcond1, label %for.body3, label %for.inc104, !dbg !824

for.body3:                                        ; preds = %for.cond1
  %0 = load i8, ptr %a.addr.1, align 1, !dbg !831
  %conv = zext i8 %0 to i16, !dbg !831
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 1, !dbg !833
  %1 = load i8, ptr %arrayidx4, align 1, !dbg !833
  %conv6 = zext i8 %1 to i16, !dbg !834
  %shl = shl nuw i16 %conv6, 8, !dbg !835
  %or = or disjoint i16 %shl, %conv, !dbg !836
  store i16 %or, ptr %t, align 2, !dbg !837
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 1, !dbg !838
  %2 = load i8, ptr %arrayidx9, align 1, !dbg !838
  %3 = lshr i8 %2, 3, !dbg !839
  %shr11 = zext nneg i8 %3 to i16, !dbg !839
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 2, !dbg !840
  %4 = load i8, ptr %arrayidx12, align 1, !dbg !840
  %conv14 = zext i8 %4 to i16, !dbg !841
  %shl15 = shl nuw nsw i16 %conv14, 5, !dbg !842
  %or16 = or disjoint i16 %shl15, %shr11, !dbg !843
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !844
  store i16 %or16, ptr %arrayidx18, align 2, !dbg !845
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 2, !dbg !846
  %5 = load i8, ptr %arrayidx19, align 1, !dbg !846
  %6 = lshr i8 %5, 6, !dbg !847
  %shr21 = zext nneg i8 %6 to i16, !dbg !847
  %arrayidx22 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 3, !dbg !848
  %7 = load i8, ptr %arrayidx22, align 1, !dbg !848
  %conv24 = zext i8 %7 to i16, !dbg !849
  %shl25 = shl nuw nsw i16 %conv24, 2, !dbg !850
  %or26 = or disjoint i16 %shl25, %shr21, !dbg !851
  %arrayidx27 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 4, !dbg !852
  %8 = load i8, ptr %arrayidx27, align 1, !dbg !852
  %conv29 = zext i8 %8 to i16, !dbg !853
  %shl30 = shl i16 %conv29, 10, !dbg !854
  %or31 = or disjoint i16 %or26, %shl30, !dbg !855
  %arrayidx33 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !856
  store i16 %or31, ptr %arrayidx33, align 2, !dbg !857
  %arrayidx34 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 4, !dbg !858
  %9 = load i8, ptr %arrayidx34, align 1, !dbg !858
  %10 = lshr i8 %9, 1, !dbg !859
  %shr36 = zext nneg i8 %10 to i16, !dbg !859
  %arrayidx37 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 5, !dbg !860
  %11 = load i8, ptr %arrayidx37, align 1, !dbg !860
  %conv39 = zext i8 %11 to i16, !dbg !861
  %shl40 = shl nuw nsw i16 %conv39, 7, !dbg !862
  %or41 = or disjoint i16 %shl40, %shr36, !dbg !863
  %arrayidx43 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !864
  store i16 %or41, ptr %arrayidx43, align 2, !dbg !865
  %arrayidx44 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 5, !dbg !866
  %12 = load i8, ptr %arrayidx44, align 1, !dbg !866
  %13 = lshr i8 %12, 4, !dbg !867
  %shr46 = zext nneg i8 %13 to i16, !dbg !867
  %arrayidx47 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 6, !dbg !868
  %14 = load i8, ptr %arrayidx47, align 1, !dbg !868
  %conv49 = zext i8 %14 to i16, !dbg !869
  %shl50 = shl nuw nsw i16 %conv49, 4, !dbg !870
  %or51 = or disjoint i16 %shl50, %shr46, !dbg !871
  %arrayidx53 = getelementptr inbounds nuw i8, ptr %t, i32 8, !dbg !872
  store i16 %or51, ptr %arrayidx53, align 2, !dbg !873
  %arrayidx54 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 6, !dbg !874
  %15 = load i8, ptr %arrayidx54, align 1, !dbg !874
  %16 = lshr i8 %15, 7, !dbg !875
  %shr56 = zext nneg i8 %16 to i16, !dbg !875
  %arrayidx57 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 7, !dbg !876
  %17 = load i8, ptr %arrayidx57, align 1, !dbg !876
  %conv59 = zext i8 %17 to i16, !dbg !877
  %shl60 = shl nuw nsw i16 %conv59, 1, !dbg !878
  %or61 = or disjoint i16 %shl60, %shr56, !dbg !879
  %arrayidx62 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 8, !dbg !880
  %18 = load i8, ptr %arrayidx62, align 1, !dbg !880
  %conv64 = zext i8 %18 to i16, !dbg !881
  %shl65 = shl i16 %conv64, 9, !dbg !882
  %or66 = or disjoint i16 %or61, %shl65, !dbg !883
  %arrayidx68 = getelementptr inbounds nuw i8, ptr %t, i32 10, !dbg !884
  store i16 %or66, ptr %arrayidx68, align 2, !dbg !885
  %arrayidx69 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 8, !dbg !886
  %19 = load i8, ptr %arrayidx69, align 1, !dbg !886
  %20 = lshr i8 %19, 2, !dbg !887
  %shr71 = zext nneg i8 %20 to i16, !dbg !887
  %arrayidx72 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 9, !dbg !888
  %21 = load i8, ptr %arrayidx72, align 1, !dbg !888
  %conv74 = zext i8 %21 to i16, !dbg !889
  %shl75 = shl nuw nsw i16 %conv74, 6, !dbg !890
  %or76 = or disjoint i16 %shl75, %shr71, !dbg !891
  %arrayidx78 = getelementptr inbounds nuw i8, ptr %t, i32 12, !dbg !892
  store i16 %or76, ptr %arrayidx78, align 2, !dbg !893
  %arrayidx79 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 9, !dbg !894
  %22 = load i8, ptr %arrayidx79, align 1, !dbg !894
  %23 = lshr i8 %22, 5, !dbg !895
  %shr81 = zext nneg i8 %23 to i16, !dbg !895
  %arrayidx82 = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 10, !dbg !896
  %24 = load i8, ptr %arrayidx82, align 1, !dbg !896
  %conv84 = zext i8 %24 to i16, !dbg !897
  %shl85 = shl nuw nsw i16 %conv84, 3, !dbg !898
  %or86 = or disjoint i16 %shl85, %shr81, !dbg !899
  %arrayidx88 = getelementptr inbounds nuw i8, ptr %t, i32 14, !dbg !900
  store i16 %or86, ptr %arrayidx88, align 2, !dbg !901
    #dbg_value(ptr %add.ptr, !814, !DIExpression(), !813)
    #dbg_value(i32 0, !902, !DIExpression(), !813)
  br label %for.cond89, !dbg !903

for.cond89:                                       ; preds = %for.body92, %for.body3
  %k.0 = phi i32 [ 0, %for.body3 ], [ %inc, %for.body92 ], !dbg !905
    #dbg_value(i32 %k.0, !902, !DIExpression(), !813)
  %exitcond = icmp ne i32 %k.0, 8, !dbg !906
  br i1 %exitcond, label %for.body92, label %for.inc101, !dbg !908

for.body92:                                       ; preds = %for.cond89
  %arrayidx93 = getelementptr inbounds nuw [8 x i16], ptr %t, i32 0, i32 %k.0, !dbg !909
  %25 = load i16, ptr %arrayidx93, align 2, !dbg !909
  %26 = and i16 %25, 2047, !dbg !910
  %and = zext nneg i16 %26 to i32, !dbg !910
  %mul = mul nuw nsw i32 %and, 3329, !dbg !911
  %add = add nuw nsw i32 %mul, 1024, !dbg !912
  %shr95 = lshr i32 %add, 11, !dbg !913
  %conv96 = trunc nuw nsw i32 %shr95 to i16, !dbg !914
  %mul98 = shl nuw nsw i32 %j.0, 3, !dbg !915
  %add99 = or disjoint i32 %mul98, %k.0, !dbg !916
  %arrayidx100 = getelementptr inbounds nuw [4 x [256 x i16]], ptr %r, i32 0, i32 %i.0, i32 %add99, !dbg !917
  store i16 %conv96, ptr %arrayidx100, align 2, !dbg !918
  %inc = add nuw nsw i32 %k.0, 1, !dbg !919
    #dbg_value(i32 %inc, !902, !DIExpression(), !813)
  br label %for.cond89, !dbg !920, !llvm.loop !921

for.inc101:                                       ; preds = %for.cond89
  %add.ptr = getelementptr inbounds nuw i8, ptr %a.addr.1, i32 11, !dbg !923
  %inc102 = add nuw nsw i32 %j.0, 1, !dbg !924
    #dbg_value(i32 %inc102, !828, !DIExpression(), !813)
  br label %for.cond1, !dbg !925, !llvm.loop !926

for.inc104:                                       ; preds = %for.cond1
  %a.addr.1.lcssa = phi ptr [ %a.addr.1, %for.cond1 ]
  %inc105 = add nuw nsw i32 %i.0, 1, !dbg !928
    #dbg_value(i32 %inc105, !817, !DIExpression(), !813)
  br label %for.cond, !dbg !929, !llvm.loop !930

for.end106:                                       ; preds = %for.cond
  ret void, !dbg !932
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !933 {
entry:
    #dbg_value(ptr %r, !934, !DIExpression(), !935)
    #dbg_value(ptr %a, !936, !DIExpression(), !935)
    #dbg_value(i32 0, !937, !DIExpression(), !935)
  br label %for.cond, !dbg !938

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !940
    #dbg_value(i32 %i.0, !937, !DIExpression(), !935)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !941
  br i1 %exitcond, label %for.body, label %for.end, !dbg !943

for.body:                                         ; preds = %for.cond
  %mul = mul nuw nsw i32 %i.0, 384, !dbg !944
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 %mul, !dbg !945
  %arrayidx = getelementptr inbounds nuw [4 x [256 x i16]], ptr %a, i32 0, i32 %i.0, !dbg !946
  call void @pqcrystals_kyber1024_ref_poly_tobytes(ptr noundef %add.ptr, ptr noundef %arrayidx) #3, !dbg !947
  %inc = add nuw nsw i32 %i.0, 1, !dbg !948
    #dbg_value(i32 %inc, !937, !DIExpression(), !935)
  br label %for.cond, !dbg !949, !llvm.loop !950

for.end:                                          ; preds = %for.cond
  ret void, !dbg !952
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_frombytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !953 {
entry:
    #dbg_value(ptr %r, !954, !DIExpression(), !955)
    #dbg_value(ptr %a, !956, !DIExpression(), !955)
    #dbg_value(i32 0, !957, !DIExpression(), !955)
  br label %for.cond, !dbg !958

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !960
    #dbg_value(i32 %i.0, !957, !DIExpression(), !955)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !961
  br i1 %exitcond, label %for.body, label %for.end, !dbg !963

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [4 x [256 x i16]], ptr %r, i32 0, i32 %i.0, !dbg !964
  %mul = mul nuw nsw i32 %i.0, 384, !dbg !965
  %add.ptr = getelementptr inbounds nuw i8, ptr %a, i32 %mul, !dbg !966
  call void @pqcrystals_kyber1024_ref_poly_frombytes(ptr noundef %arrayidx, ptr noundef %add.ptr) #3, !dbg !967
  %inc = add nuw nsw i32 %i.0, 1, !dbg !968
    #dbg_value(i32 %inc, !957, !DIExpression(), !955)
  br label %for.cond, !dbg !969, !llvm.loop !970

for.end:                                          ; preds = %for.cond
  ret void, !dbg !972
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !973 {
entry:
    #dbg_value(ptr %r, !976, !DIExpression(), !977)
    #dbg_value(i32 0, !978, !DIExpression(), !977)
  br label %for.cond, !dbg !979

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !981
    #dbg_value(i32 %i.0, !978, !DIExpression(), !977)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !982
  br i1 %exitcond, label %for.body, label %for.end, !dbg !984

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [4 x [256 x i16]], ptr %r, i32 0, i32 %i.0, !dbg !985
  call void @pqcrystals_kyber1024_ref_poly_ntt(ptr noundef %arrayidx) #3, !dbg !986
  %inc = add nuw nsw i32 %i.0, 1, !dbg !987
    #dbg_value(i32 %inc, !978, !DIExpression(), !977)
  br label %for.cond, !dbg !988, !llvm.loop !989

for.end:                                          ; preds = %for.cond
  ret void, !dbg !991
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_invntt_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !992 {
entry:
    #dbg_value(ptr %r, !993, !DIExpression(), !994)
    #dbg_value(i32 0, !995, !DIExpression(), !994)
  br label %for.cond, !dbg !996

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !998
    #dbg_value(i32 %i.0, !995, !DIExpression(), !994)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !999
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1001

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [4 x [256 x i16]], ptr %r, i32 0, i32 %i.0, !dbg !1002
  call void @pqcrystals_kyber1024_ref_poly_invntt_tomont(ptr noundef %arrayidx) #3, !dbg !1003
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1004
    #dbg_value(i32 %inc, !995, !DIExpression(), !994)
  br label %for.cond, !dbg !1005, !llvm.loop !1006

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1008
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1009 {
entry:
  %t = alloca [256 x i16], align 2
    #dbg_value(ptr %r, !1012, !DIExpression(), !1013)
    #dbg_value(ptr %a, !1014, !DIExpression(), !1013)
    #dbg_value(ptr %b, !1015, !DIExpression(), !1013)
    #dbg_declare(ptr %t, !1016, !DIExpression(), !1017)
  call void @pqcrystals_kyber1024_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) #3, !dbg !1018
    #dbg_value(i32 1, !1019, !DIExpression(), !1013)
  br label %for.cond, !dbg !1020

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 1, %entry ], [ %inc, %for.body ], !dbg !1022
    #dbg_value(i32 %i.0, !1019, !DIExpression(), !1013)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !1023
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1025

for.body:                                         ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds nuw [4 x [256 x i16]], ptr %a, i32 0, i32 %i.0, !dbg !1026
  %arrayidx3 = getelementptr inbounds nuw [4 x [256 x i16]], ptr %b, i32 0, i32 %i.0, !dbg !1028
  call void @pqcrystals_kyber1024_ref_poly_basemul_montgomery(ptr noundef nonnull %t, ptr noundef nonnull %arrayidx2, ptr noundef nonnull %arrayidx3) #3, !dbg !1029
  call void @pqcrystals_kyber1024_ref_poly_add(ptr noundef %r, ptr noundef %r, ptr noundef nonnull %t) #3, !dbg !1030
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1031
    #dbg_value(i32 %inc, !1019, !DIExpression(), !1013)
  br label %for.cond, !dbg !1032, !llvm.loop !1033

for.end:                                          ; preds = %for.cond
  call void @pqcrystals_kyber1024_ref_poly_reduce(ptr noundef %r) #3, !dbg !1035
  ret void, !dbg !1036
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_reduce(ptr noundef %r) local_unnamed_addr #0 !dbg !1037 {
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
  %arrayidx = getelementptr inbounds nuw [4 x [256 x i16]], ptr %r, i32 0, i32 %i.0, !dbg !1047
  call void @pqcrystals_kyber1024_ref_poly_reduce(ptr noundef %arrayidx) #3, !dbg !1048
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1049
    #dbg_value(i32 %inc, !1040, !DIExpression(), !1039)
  br label %for.cond, !dbg !1050, !llvm.loop !1051

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1053
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_polyvec_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1054 {
entry:
    #dbg_value(ptr %r, !1057, !DIExpression(), !1058)
    #dbg_value(ptr %a, !1059, !DIExpression(), !1058)
    #dbg_value(ptr %b, !1060, !DIExpression(), !1058)
    #dbg_value(i32 0, !1061, !DIExpression(), !1058)
  br label %for.cond, !dbg !1062

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1064
    #dbg_value(i32 %i.0, !1061, !DIExpression(), !1058)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !1065
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1067

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [4 x [256 x i16]], ptr %r, i32 0, i32 %i.0, !dbg !1068
  %arrayidx1 = getelementptr inbounds nuw [4 x [256 x i16]], ptr %a, i32 0, i32 %i.0, !dbg !1069
  %arrayidx2 = getelementptr inbounds nuw [4 x [256 x i16]], ptr %b, i32 0, i32 %i.0, !dbg !1070
  call void @pqcrystals_kyber1024_ref_poly_add(ptr noundef %arrayidx, ptr noundef %arrayidx1, ptr noundef %arrayidx2) #3, !dbg !1071
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1072
    #dbg_value(i32 %inc, !1061, !DIExpression(), !1058)
  br label %for.cond, !dbg !1073, !llvm.loop !1074

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1076
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_compress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1077 {
entry:
  %t = alloca [8 x i8], align 1
    #dbg_value(ptr %r, !1083, !DIExpression(), !1084)
    #dbg_value(ptr %a, !1085, !DIExpression(), !1084)
    #dbg_declare(ptr %t, !1086, !DIExpression(), !1088)
    #dbg_value(i32 0, !1089, !DIExpression(), !1084)
  br label %for.cond, !dbg !1090

for.cond:                                         ; preds = %for.end, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc67, %for.end ], !dbg !1092
  %r.addr.0 = phi ptr [ %r, %entry ], [ %add.ptr, %for.end ]
    #dbg_value(ptr %r.addr.0, !1083, !DIExpression(), !1084)
    #dbg_value(i32 %i.0, !1089, !DIExpression(), !1084)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1093
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end68, !dbg !1095

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1096

for.cond1:                                        ; preds = %for.cond1.preheader, %for.body3
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond1.preheader ], !dbg !1099
    #dbg_value(i32 %j.0, !1100, !DIExpression(), !1084)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1101
  br i1 %exitcond, label %for.body3, label %for.end, !dbg !1096

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !1103
  %add = or disjoint i32 %mul, %j.0, !dbg !1105
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add, !dbg !1106
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1106
    #dbg_value(i16 %0, !1107, !DIExpression(), !1084)
  %isneg = icmp slt i16 %0, 0, !dbg !1108
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !1108
  %add5 = add i16 %and, %0, !dbg !1109
    #dbg_value(i16 %add5, !1107, !DIExpression(), !1084)
  %conv7 = sext i16 %add5 to i32, !dbg !1110
    #dbg_value(i32 %conv7, !1111, !DIExpression(DW_OP_constu, 5, DW_OP_shl, DW_OP_stack_value), !1084)
    #dbg_value(i32 %conv7, !1111, !DIExpression(DW_OP_constu, 5, DW_OP_shl, DW_OP_plus_uconst, 1664, DW_OP_stack_value), !1084)
  %1 = mul i32 %conv7, 1290176, !dbg !1112
  %mul9 = add i32 %1, 67089152, !dbg !1112
    #dbg_value(i32 %mul9, !1111, !DIExpression(), !1084)
  %shr10 = lshr i32 %mul9, 27, !dbg !1113
    #dbg_value(i32 %shr10, !1111, !DIExpression(), !1084)
  %conv12 = trunc nuw nsw i32 %shr10 to i8, !dbg !1114
  %arrayidx13 = getelementptr inbounds nuw [8 x i8], ptr %t, i32 0, i32 %j.0, !dbg !1115
  store i8 %conv12, ptr %arrayidx13, align 1, !dbg !1116
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1117
    #dbg_value(i32 %inc, !1100, !DIExpression(), !1084)
  br label %for.cond1, !dbg !1118, !llvm.loop !1119

for.end:                                          ; preds = %for.cond1
  %2 = load i8, ptr %t, align 1, !dbg !1121
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %t, i32 1, !dbg !1122
  %3 = load i8, ptr %arrayidx17, align 1, !dbg !1122
  %shl19 = shl i8 %3, 5, !dbg !1123
  %or = or i8 %shl19, %2, !dbg !1124
  store i8 %or, ptr %r.addr.0, align 1, !dbg !1125
  %4 = lshr i8 %3, 3, !dbg !1126
  %arrayidx25 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !1127
  %5 = load i8, ptr %arrayidx25, align 1, !dbg !1127
  %shl27 = shl i8 %5, 2, !dbg !1128
  %or28 = or i8 %shl27, %4, !dbg !1129
  %arrayidx29 = getelementptr inbounds nuw i8, ptr %t, i32 3, !dbg !1130
  %6 = load i8, ptr %arrayidx29, align 1, !dbg !1130
  %shl31 = shl i8 %6, 7, !dbg !1131
  %or32 = or i8 %or28, %shl31, !dbg !1132
  %arrayidx34 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 1, !dbg !1133
  store i8 %or32, ptr %arrayidx34, align 1, !dbg !1134
  %7 = lshr i8 %6, 1, !dbg !1135
  %arrayidx38 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !1136
  %8 = load i8, ptr %arrayidx38, align 1, !dbg !1136
  %shl40 = shl i8 %8, 4, !dbg !1137
  %or41 = or i8 %shl40, %7, !dbg !1138
  %arrayidx43 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 2, !dbg !1139
  store i8 %or41, ptr %arrayidx43, align 1, !dbg !1140
  %9 = lshr i8 %8, 4, !dbg !1141
  %arrayidx47 = getelementptr inbounds nuw i8, ptr %t, i32 5, !dbg !1142
  %10 = load i8, ptr %arrayidx47, align 1, !dbg !1142
  %shl49 = shl i8 %10, 1, !dbg !1143
  %or50 = or i8 %shl49, %9, !dbg !1144
  %arrayidx51 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !1145
  %11 = load i8, ptr %arrayidx51, align 1, !dbg !1145
  %shl53 = shl i8 %11, 6, !dbg !1146
  %or54 = or i8 %or50, %shl53, !dbg !1147
  %arrayidx56 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 3, !dbg !1148
  store i8 %or54, ptr %arrayidx56, align 1, !dbg !1149
  %12 = lshr i8 %11, 2, !dbg !1150
  %arrayidx60 = getelementptr inbounds nuw i8, ptr %t, i32 7, !dbg !1151
  %13 = load i8, ptr %arrayidx60, align 1, !dbg !1151
  %shl62 = shl i8 %13, 3, !dbg !1152
  %or63 = or i8 %shl62, %12, !dbg !1153
  %arrayidx65 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 4, !dbg !1154
  store i8 %or63, ptr %arrayidx65, align 1, !dbg !1155
    #dbg_value(ptr %r.addr.0, !1083, !DIExpression(DW_OP_plus_uconst, 5, DW_OP_stack_value), !1084)
  %add.ptr = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 5, !dbg !1156
    #dbg_value(ptr %add.ptr, !1083, !DIExpression(), !1084)
  %inc67 = add nuw nsw i32 %i.0, 1, !dbg !1157
    #dbg_value(i32 %inc67, !1089, !DIExpression(), !1084)
  br label %for.cond, !dbg !1158, !llvm.loop !1159

for.end68:                                        ; preds = %for.cond
  ret void, !dbg !1161
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_decompress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1162 {
entry:
  %t = alloca [8 x i8], align 1
    #dbg_value(ptr %r, !1165, !DIExpression(), !1166)
    #dbg_value(ptr %a, !1167, !DIExpression(), !1166)
    #dbg_declare(ptr %t, !1168, !DIExpression(), !1169)
    #dbg_value(i32 0, !1170, !DIExpression(), !1166)
  br label %for.cond, !dbg !1171

for.cond:                                         ; preds = %for.inc63, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc64, %for.inc63 ], !dbg !1173
  %a.addr.0 = phi ptr [ %a, %entry ], [ %add.ptr, %for.inc63 ]
    #dbg_value(ptr %a.addr.0, !1167, !DIExpression(), !1166)
    #dbg_value(i32 %i.0, !1170, !DIExpression(), !1166)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1174
  br i1 %exitcond1, label %for.body, label %for.end65, !dbg !1176

for.body:                                         ; preds = %for.cond
  %0 = load i8, ptr %a.addr.0, align 1, !dbg !1177
  store i8 %0, ptr %t, align 1, !dbg !1179
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 1, !dbg !1180
  %1 = load i8, ptr %arrayidx6, align 1, !dbg !1180
  %2 = shl i8 %1, 3, !dbg !1181
  %3 = lshr i8 %0, 5, !dbg !1181
  %4 = or i8 %2, %3, !dbg !1181
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %t, i32 1, !dbg !1182
  store i8 %4, ptr %arrayidx9, align 1, !dbg !1183
  %5 = lshr i8 %1, 2, !dbg !1184
  %arrayidx14 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !1185
  store i8 %5, ptr %arrayidx14, align 1, !dbg !1186
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 1, !dbg !1187
  %6 = load i8, ptr %arrayidx15, align 1, !dbg !1187
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 2, !dbg !1188
  %7 = load i8, ptr %arrayidx18, align 1, !dbg !1188
  %8 = shl i8 %7, 1, !dbg !1189
  %9 = lshr i8 %6, 7, !dbg !1189
  %10 = or i8 %8, %9, !dbg !1189
  %arrayidx23 = getelementptr inbounds nuw i8, ptr %t, i32 3, !dbg !1190
  store i8 %10, ptr %arrayidx23, align 1, !dbg !1191
  %arrayidx27 = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 3, !dbg !1192
  %11 = load i8, ptr %arrayidx27, align 1, !dbg !1192
  %12 = shl i8 %11, 4, !dbg !1193
  %13 = lshr i8 %7, 4, !dbg !1193
  %14 = or i8 %12, %13, !dbg !1193
  %arrayidx32 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !1194
  store i8 %14, ptr %arrayidx32, align 1, !dbg !1195
  %15 = lshr i8 %11, 1, !dbg !1196
  %arrayidx37 = getelementptr inbounds nuw i8, ptr %t, i32 5, !dbg !1197
  store i8 %15, ptr %arrayidx37, align 1, !dbg !1198
  %arrayidx38 = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 3, !dbg !1199
  %16 = load i8, ptr %arrayidx38, align 1, !dbg !1199
  %arrayidx41 = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 4, !dbg !1200
  %17 = load i8, ptr %arrayidx41, align 1, !dbg !1200
  %18 = shl i8 %17, 2, !dbg !1201
  %19 = lshr i8 %16, 6, !dbg !1201
  %20 = or i8 %18, %19, !dbg !1201
  %arrayidx46 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !1202
  store i8 %20, ptr %arrayidx46, align 1, !dbg !1203
  %21 = lshr i8 %17, 3, !dbg !1204
  %arrayidx51 = getelementptr inbounds nuw i8, ptr %t, i32 7, !dbg !1205
  store i8 %21, ptr %arrayidx51, align 1, !dbg !1206
    #dbg_value(ptr %add.ptr, !1167, !DIExpression(), !1166)
    #dbg_value(i32 0, !1207, !DIExpression(), !1166)
  br label %for.cond52, !dbg !1208

for.cond52:                                       ; preds = %for.body55, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body55 ], !dbg !1210
    #dbg_value(i32 %j.0, !1207, !DIExpression(), !1166)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1211
  br i1 %exitcond, label %for.body55, label %for.inc63, !dbg !1213

for.body55:                                       ; preds = %for.cond52
  %arrayidx56 = getelementptr inbounds nuw [8 x i8], ptr %t, i32 0, i32 %j.0, !dbg !1214
  %22 = load i8, ptr %arrayidx56, align 1, !dbg !1214
  %23 = and i8 %22, 31, !dbg !1215
  %and = zext nneg i8 %23 to i32, !dbg !1215
  %mul = mul nuw nsw i32 %and, 3329, !dbg !1216
  %add = add nuw nsw i32 %mul, 16, !dbg !1217
  %shr58 = lshr i32 %add, 5, !dbg !1218
  %conv59 = trunc nuw nsw i32 %shr58 to i16, !dbg !1219
  %mul60 = shl nuw nsw i32 %i.0, 3, !dbg !1220
  %add61 = or disjoint i32 %mul60, %j.0, !dbg !1221
  %arrayidx62 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add61, !dbg !1222
  store i16 %conv59, ptr %arrayidx62, align 2, !dbg !1223
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1224
    #dbg_value(i32 %inc, !1207, !DIExpression(), !1166)
  br label %for.cond52, !dbg !1225, !llvm.loop !1226

for.inc63:                                        ; preds = %for.cond52
  %add.ptr = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 5, !dbg !1228
  %inc64 = add nuw nsw i32 %i.0, 1, !dbg !1229
    #dbg_value(i32 %inc64, !1170, !DIExpression(), !1166)
  br label %for.cond, !dbg !1230, !llvm.loop !1231

for.end65:                                        ; preds = %for.cond
  ret void, !dbg !1233
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_tobytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1234 {
entry:
    #dbg_value(ptr %r, !1235, !DIExpression(), !1236)
    #dbg_value(ptr %a, !1237, !DIExpression(), !1236)
    #dbg_value(i32 0, !1238, !DIExpression(), !1236)
  br label %for.cond, !dbg !1239

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1241
    #dbg_value(i32 %i.0, !1238, !DIExpression(), !1236)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !1242
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1244

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 1, !dbg !1245
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %mul, !dbg !1247
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1247
    #dbg_value(i16 %0, !1248, !DIExpression(), !1236)
  %isneg = icmp slt i16 %0, 0, !dbg !1249
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !1249
  %add = add i16 %and, %0, !dbg !1250
    #dbg_value(i16 %add, !1248, !DIExpression(), !1236)
  %mul3 = shl nuw nsw i32 %i.0, 1, !dbg !1251
  %add4 = or disjoint i32 %mul3, 1, !dbg !1252
  %arrayidx5 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add4, !dbg !1253
  %1 = load i16, ptr %arrayidx5, align 2, !dbg !1253
    #dbg_value(i16 %1, !1254, !DIExpression(), !1236)
  %isneg1 = icmp slt i16 %1, 0, !dbg !1255
  %and8 = select i1 %isneg1, i16 3329, i16 0, !dbg !1255
  %add10 = add i16 %and8, %1, !dbg !1256
    #dbg_value(i16 %add10, !1254, !DIExpression(), !1236)
  %conv14 = trunc i16 %add to i8, !dbg !1257
  %mul15 = mul nuw nsw i32 %i.0, 3, !dbg !1258
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %r, i32 %mul15, !dbg !1259
  store i8 %conv14, ptr %arrayidx17, align 1, !dbg !1260
  %2 = lshr i16 %add, 8, !dbg !1261
  %shr19 = trunc nuw i16 %2 to i8, !dbg !1261
  %conv20 = trunc i16 %add10 to i8, !dbg !1262
  %shl = shl i8 %conv20, 4, !dbg !1263
  %or = or i8 %shl, %shr19, !dbg !1264
  %mul22 = mul nuw nsw i32 %i.0, 3, !dbg !1265
  %3 = getelementptr inbounds nuw i8, ptr %r, i32 %mul22, !dbg !1266
  %arrayidx24 = getelementptr inbounds nuw i8, ptr %3, i32 1, !dbg !1266
  store i8 %or, ptr %arrayidx24, align 1, !dbg !1267
  %4 = lshr i16 %add10, 4, !dbg !1268
  %conv27 = trunc i16 %4 to i8, !dbg !1269
  %mul28 = mul nuw nsw i32 %i.0, 3, !dbg !1270
  %5 = getelementptr inbounds nuw i8, ptr %r, i32 %mul28, !dbg !1271
  %arrayidx30 = getelementptr inbounds nuw i8, ptr %5, i32 2, !dbg !1271
  store i8 %conv27, ptr %arrayidx30, align 1, !dbg !1272
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1273
    #dbg_value(i32 %inc, !1238, !DIExpression(), !1236)
  br label %for.cond, !dbg !1274, !llvm.loop !1275

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1277
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_frombytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1278 {
entry:
    #dbg_value(ptr %r, !1279, !DIExpression(), !1280)
    #dbg_value(ptr %a, !1281, !DIExpression(), !1280)
    #dbg_value(i32 0, !1282, !DIExpression(), !1280)
  br label %for.cond, !dbg !1283

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1285
    #dbg_value(i32 %i.0, !1282, !DIExpression(), !1280)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !1286
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1288

for.body:                                         ; preds = %for.cond
  %mul = mul nuw nsw i32 %i.0, 3, !dbg !1289
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %mul, !dbg !1291
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1291
  %conv = zext i8 %0 to i16, !dbg !1291
  %mul1 = mul nuw nsw i32 %i.0, 3, !dbg !1292
  %1 = getelementptr inbounds nuw i8, ptr %a, i32 %mul1, !dbg !1293
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %1, i32 1, !dbg !1293
  %2 = load i8, ptr %arrayidx3, align 1, !dbg !1293
  %conv5 = zext i8 %2 to i16, !dbg !1294
  %shl = shl nuw i16 %conv5, 8, !dbg !1295
  %shl.masked = and i16 %shl, 3840, !dbg !1296
  %and = or disjoint i16 %shl.masked, %conv, !dbg !1296
  %mul7 = shl nuw nsw i32 %i.0, 1, !dbg !1297
  %arrayidx8 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul7, !dbg !1298
  store i16 %and, ptr %arrayidx8, align 2, !dbg !1299
  %mul9 = mul nuw nsw i32 %i.0, 3, !dbg !1300
  %3 = getelementptr inbounds nuw i8, ptr %a, i32 %mul9, !dbg !1301
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %3, i32 1, !dbg !1301
  %4 = load i8, ptr %arrayidx11, align 1, !dbg !1301
  %5 = lshr i8 %4, 4, !dbg !1302
  %shr13 = zext nneg i8 %5 to i16, !dbg !1302
  %mul14 = mul nuw nsw i32 %i.0, 3, !dbg !1303
  %6 = getelementptr inbounds nuw i8, ptr %a, i32 %mul14, !dbg !1304
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %6, i32 2, !dbg !1304
  %7 = load i8, ptr %arrayidx16, align 1, !dbg !1304
  %conv18 = zext i8 %7 to i16, !dbg !1305
  %shl19 = shl nuw nsw i16 %conv18, 4, !dbg !1306
  %or20 = or disjoint i16 %shl19, %shr13, !dbg !1307
  %mul23 = shl nuw nsw i32 %i.0, 1, !dbg !1308
  %add24 = or disjoint i32 %mul23, 1, !dbg !1309
  %arrayidx25 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add24, !dbg !1310
  store i16 %or20, ptr %arrayidx25, align 2, !dbg !1311
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1312
    #dbg_value(i32 %inc, !1282, !DIExpression(), !1280)
  br label %for.cond, !dbg !1313, !llvm.loop !1314

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1316
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_frommsg(ptr noundef %r, ptr noundef %msg) local_unnamed_addr #0 !dbg !1317 {
entry:
    #dbg_value(ptr %r, !1318, !DIExpression(), !1319)
    #dbg_value(ptr %msg, !1320, !DIExpression(), !1319)
    #dbg_value(i32 0, !1321, !DIExpression(), !1319)
  br label %for.cond, !dbg !1322

for.cond:                                         ; preds = %for.inc8, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc9, %for.inc8 ], !dbg !1324
    #dbg_value(i32 %i.0, !1321, !DIExpression(), !1319)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1325
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end10, !dbg !1327

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1328

for.cond1:                                        ; preds = %for.cond1.preheader, %for.body3
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond1.preheader ], !dbg !1331
    #dbg_value(i32 %j.0, !1332, !DIExpression(), !1319)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1333
  br i1 %exitcond, label %for.body3, label %for.inc8, !dbg !1328

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !1335
  %add = or disjoint i32 %mul, %j.0, !dbg !1337
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add, !dbg !1338
  store i16 0, ptr %arrayidx, align 2, !dbg !1339
  %add.ptr.idx = shl nuw nsw i32 %i.0, 4, !dbg !1340
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 %add.ptr.idx, !dbg !1340
  %add.ptr5 = getelementptr inbounds nuw i16, ptr %add.ptr, i32 %j.0, !dbg !1341
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1342
  %0 = load i8, ptr %arrayidx6, align 1, !dbg !1342
  %conv = zext i8 %0 to i32, !dbg !1342
  %shr = lshr i32 %conv, %j.0, !dbg !1343
  %1 = trunc nuw nsw i32 %shr to i16, !dbg !1344
  %conv7 = and i16 %1, 1, !dbg !1344
  call void @pqcrystals_kyber1024_ref_cmov_int16(ptr noundef %add.ptr5, i16 noundef signext 1665, i16 noundef zeroext %conv7) #3, !dbg !1345
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1346
    #dbg_value(i32 %inc, !1332, !DIExpression(), !1319)
  br label %for.cond1, !dbg !1347, !llvm.loop !1348

for.inc8:                                         ; preds = %for.cond1
  %inc9 = add nuw nsw i32 %i.0, 1, !dbg !1350
    #dbg_value(i32 %inc9, !1321, !DIExpression(), !1319)
  br label %for.cond, !dbg !1351, !llvm.loop !1352

for.end10:                                        ; preds = %for.cond
  ret void, !dbg !1354
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_tomsg(ptr noundef %msg, ptr noundef %a) local_unnamed_addr #0 !dbg !1355 {
entry:
    #dbg_value(ptr %msg, !1356, !DIExpression(), !1357)
    #dbg_value(ptr %a, !1358, !DIExpression(), !1357)
    #dbg_value(i32 0, !1359, !DIExpression(), !1357)
  br label %for.cond, !dbg !1360

for.cond:                                         ; preds = %for.inc11, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc12, %for.inc11 ], !dbg !1362
    #dbg_value(i32 %i.0, !1359, !DIExpression(), !1357)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1363
  br i1 %exitcond1, label %for.body, label %for.end13, !dbg !1365

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1366
  store i8 0, ptr %arrayidx, align 1, !dbg !1368
    #dbg_value(i32 0, !1369, !DIExpression(), !1357)
  br label %for.cond1, !dbg !1370

for.cond1:                                        ; preds = %for.body3, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body3 ], !dbg !1372
    #dbg_value(i32 %j.0, !1369, !DIExpression(), !1357)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1373
  br i1 %exitcond, label %for.body3, label %for.inc11, !dbg !1375

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !1376
  %add = or disjoint i32 %mul, %j.0, !dbg !1378
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add, !dbg !1379
  %0 = load i16, ptr %arrayidx4, align 2, !dbg !1379
  %conv = sext i16 %0 to i32, !dbg !1379
    #dbg_value(i32 %conv, !1380, !DIExpression(), !1357)
    #dbg_value(i32 %conv, !1380, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_stack_value), !1357)
    #dbg_value(i32 %conv, !1380, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !1357)
  %1 = mul i32 %conv, 161270, !dbg !1381
  %mul6 = add i32 %1, 134257275, !dbg !1381
    #dbg_value(i32 %mul6, !1380, !DIExpression(), !1357)
  %shr = lshr i32 %mul6, 28, !dbg !1382
    #dbg_value(i32 %shr, !1380, !DIExpression(), !1357)
  %and = and i32 %shr, 1, !dbg !1383
    #dbg_value(i32 %and, !1380, !DIExpression(), !1357)
  %shl7 = shl nuw nsw i32 %and, %j.0, !dbg !1384
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1385
  %2 = load i8, ptr %arrayidx8, align 1, !dbg !1386
  %3 = trunc nuw i32 %shl7 to i8, !dbg !1386
  %conv10 = or i8 %2, %3, !dbg !1386
  store i8 %conv10, ptr %arrayidx8, align 1, !dbg !1386
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1387
    #dbg_value(i32 %inc, !1369, !DIExpression(), !1357)
  br label %for.cond1, !dbg !1388, !llvm.loop !1389

for.inc11:                                        ; preds = %for.cond1
  %inc12 = add nuw nsw i32 %i.0, 1, !dbg !1391
    #dbg_value(i32 %inc12, !1359, !DIExpression(), !1357)
  br label %for.cond, !dbg !1392, !llvm.loop !1393

for.end13:                                        ; preds = %for.cond
  ret void, !dbg !1395
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_getnoise_eta1(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !1396 {
entry:
  %buf = alloca [128 x i8], align 1
    #dbg_value(ptr %r, !1399, !DIExpression(), !1400)
    #dbg_value(ptr %seed, !1401, !DIExpression(), !1400)
    #dbg_value(i8 %nonce, !1402, !DIExpression(), !1400)
    #dbg_declare(ptr %buf, !1403, !DIExpression(), !1405)
  call void @pqcrystals_kyber1024_ref_kyber_shake256_prf(ptr noundef nonnull %buf, i32 noundef 128, ptr noundef %seed, i8 noundef zeroext %nonce) #3, !dbg !1406
  call void @pqcrystals_kyber1024_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef nonnull %buf) #3, !dbg !1407
  ret void, !dbg !1408
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_getnoise_eta2(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !1409 {
entry:
  %buf = alloca [128 x i8], align 1
    #dbg_value(ptr %r, !1410, !DIExpression(), !1411)
    #dbg_value(ptr %seed, !1412, !DIExpression(), !1411)
    #dbg_value(i8 %nonce, !1413, !DIExpression(), !1411)
    #dbg_declare(ptr %buf, !1414, !DIExpression(), !1415)
  call void @pqcrystals_kyber1024_ref_kyber_shake256_prf(ptr noundef nonnull %buf, i32 noundef 128, ptr noundef %seed, i8 noundef zeroext %nonce) #3, !dbg !1416
  call void @pqcrystals_kyber1024_ref_poly_cbd_eta2(ptr noundef %r, ptr noundef nonnull %buf) #3, !dbg !1417
  ret void, !dbg !1418
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1419 {
entry:
    #dbg_value(ptr %r, !1422, !DIExpression(), !1423)
  call void @pqcrystals_kyber1024_ref_ntt(ptr noundef %r) #3, !dbg !1424
  call void @pqcrystals_kyber1024_ref_poly_reduce(ptr noundef %r) #3, !dbg !1425
  ret void, !dbg !1426
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_reduce(ptr noundef %r) local_unnamed_addr #0 !dbg !1427 {
entry:
    #dbg_value(ptr %r, !1428, !DIExpression(), !1429)
    #dbg_value(i32 0, !1430, !DIExpression(), !1429)
  br label %for.cond, !dbg !1431

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1433
    #dbg_value(i32 %i.0, !1430, !DIExpression(), !1429)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1434
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1436

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1437
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1437
  %call = call signext i16 @pqcrystals_kyber1024_ref_barrett_reduce(i16 noundef signext %0) #3, !dbg !1438
  %arrayidx1 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1439
  store i16 %call, ptr %arrayidx1, align 2, !dbg !1440
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1441
    #dbg_value(i32 %inc, !1430, !DIExpression(), !1429)
  br label %for.cond, !dbg !1442, !llvm.loop !1443

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1445
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_invntt_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !1446 {
entry:
    #dbg_value(ptr %r, !1447, !DIExpression(), !1448)
  call void @pqcrystals_kyber1024_ref_invntt(ptr noundef %r) #3, !dbg !1449
  ret void, !dbg !1450
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1451 {
entry:
    #dbg_value(ptr %r, !1454, !DIExpression(), !1455)
    #dbg_value(ptr %a, !1456, !DIExpression(), !1455)
    #dbg_value(ptr %b, !1457, !DIExpression(), !1455)
    #dbg_value(i32 0, !1458, !DIExpression(), !1455)
  br label %for.cond, !dbg !1459

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1461
    #dbg_value(i32 %i.0, !1458, !DIExpression(), !1455)
  %exitcond = icmp ne i32 %i.0, 64, !dbg !1462
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1464

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 2, !dbg !1465
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul, !dbg !1467
  %mul1 = shl nuw nsw i32 %i.0, 2, !dbg !1468
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %mul1, !dbg !1469
  %mul3 = shl nuw nsw i32 %i.0, 2, !dbg !1470
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %mul3, !dbg !1471
  %add = or disjoint i32 %i.0, 64, !dbg !1472
  %arrayidx5 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber1024_ref_zetas, i32 0, i32 %add, !dbg !1473
  %0 = load i16, ptr %arrayidx5, align 2, !dbg !1473
  call void @pqcrystals_kyber1024_ref_basemul(ptr noundef %arrayidx, ptr noundef %arrayidx2, ptr noundef %arrayidx4, i16 noundef signext %0) #3, !dbg !1474
  %mul6 = shl nuw nsw i32 %i.0, 2, !dbg !1475
  %add7 = or disjoint i32 %mul6, 2, !dbg !1476
  %arrayidx8 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add7, !dbg !1477
  %mul9 = shl nuw nsw i32 %i.0, 2, !dbg !1478
  %add10 = or disjoint i32 %mul9, 2, !dbg !1479
  %arrayidx11 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add10, !dbg !1480
  %mul12 = shl nuw nsw i32 %i.0, 2, !dbg !1481
  %add13 = or disjoint i32 %mul12, 2, !dbg !1482
  %arrayidx14 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %add13, !dbg !1483
  %add15 = or disjoint i32 %i.0, 64, !dbg !1484
  %arrayidx16 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber1024_ref_zetas, i32 0, i32 %add15, !dbg !1485
  %1 = load i16, ptr %arrayidx16, align 2, !dbg !1485
  %sub = sub i16 0, %1, !dbg !1486
  call void @pqcrystals_kyber1024_ref_basemul(ptr noundef nonnull %arrayidx8, ptr noundef nonnull %arrayidx11, ptr noundef nonnull %arrayidx14, i16 noundef signext %sub) #3, !dbg !1487
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1488
    #dbg_value(i32 %inc, !1458, !DIExpression(), !1455)
  br label %for.cond, !dbg !1489, !llvm.loop !1490

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1492
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !1493 {
entry:
    #dbg_value(ptr %r, !1494, !DIExpression(), !1495)
    #dbg_value(i16 1353, !1496, !DIExpression(), !1495)
    #dbg_value(i32 0, !1497, !DIExpression(), !1495)
  br label %for.cond, !dbg !1498

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1500
    #dbg_value(i32 %i.0, !1497, !DIExpression(), !1495)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1501
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1503

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1504
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1504
  %conv = sext i16 %0 to i32, !dbg !1505
  %mul = mul nsw i32 %conv, 1353, !dbg !1506
  %call = call signext i16 @pqcrystals_kyber1024_ref_montgomery_reduce(i32 noundef %mul) #3, !dbg !1507
  %arrayidx1 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1508
  store i16 %call, ptr %arrayidx1, align 2, !dbg !1509
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1510
    #dbg_value(i32 %inc, !1497, !DIExpression(), !1495)
  br label %for.cond, !dbg !1511, !llvm.loop !1512

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1514
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1515 {
entry:
    #dbg_value(ptr %r, !1516, !DIExpression(), !1517)
    #dbg_value(ptr %a, !1518, !DIExpression(), !1517)
    #dbg_value(ptr %b, !1519, !DIExpression(), !1517)
    #dbg_value(i32 0, !1520, !DIExpression(), !1517)
  br label %for.cond, !dbg !1521

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1523
    #dbg_value(i32 %i.0, !1520, !DIExpression(), !1517)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1524
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1526

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %i.0, !dbg !1527
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1527
  %arrayidx1 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %i.0, !dbg !1528
  %1 = load i16, ptr %arrayidx1, align 2, !dbg !1528
  %add = add i16 %0, %1, !dbg !1529
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1530
  store i16 %add, ptr %arrayidx4, align 2, !dbg !1531
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1532
    #dbg_value(i32 %inc, !1520, !DIExpression(), !1517)
  br label %for.cond, !dbg !1533, !llvm.loop !1534

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1536
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_sub(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1537 {
entry:
    #dbg_value(ptr %r, !1538, !DIExpression(), !1539)
    #dbg_value(ptr %a, !1540, !DIExpression(), !1539)
    #dbg_value(ptr %b, !1541, !DIExpression(), !1539)
    #dbg_value(i32 0, !1542, !DIExpression(), !1539)
  br label %for.cond, !dbg !1543

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1545
    #dbg_value(i32 %i.0, !1542, !DIExpression(), !1539)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1546
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1548

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %i.0, !dbg !1549
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1549
  %arrayidx1 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %i.0, !dbg !1550
  %1 = load i16, ptr %arrayidx1, align 2, !dbg !1550
  %sub = sub i16 %0, %1, !dbg !1551
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1552
  store i16 %sub, ptr %arrayidx4, align 2, !dbg !1553
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1554
    #dbg_value(i32 %inc, !1542, !DIExpression(), !1539)
  br label %for.cond, !dbg !1555, !llvm.loop !1556

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1558
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1559 {
entry:
    #dbg_value(ptr %r, !1562, !DIExpression(), !1563)
    #dbg_value(i32 1, !1564, !DIExpression(), !1563)
    #dbg_value(i32 128, !1565, !DIExpression(), !1563)
  br label %for.cond, !dbg !1566

for.cond:                                         ; preds = %for.inc24, %entry
  %len.0 = phi i32 [ 128, %entry ], [ %shr, %for.inc24 ], !dbg !1568
  %k.0 = phi i32 [ 1, %entry ], [ %k.1.lcssa, %for.inc24 ], !dbg !1569
    #dbg_value(i32 %k.0, !1564, !DIExpression(), !1563)
    #dbg_value(i32 %len.0, !1565, !DIExpression(), !1563)
  %cmp = icmp samesign ugt i32 %len.0, 1, !dbg !1570
  br i1 %cmp, label %for.cond1.preheader, label %for.end25, !dbg !1572

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1573

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc21
  %start.0 = phi i32 [ %add22, %for.inc21 ], [ 0, %for.cond1.preheader ], !dbg !1576
  %k.1 = phi i32 [ %inc, %for.inc21 ], [ %k.0, %for.cond1.preheader ], !dbg !1563
    #dbg_value(i32 %k.1, !1564, !DIExpression(), !1563)
    #dbg_value(i32 %start.0, !1577, !DIExpression(), !1563)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !1578
  br i1 %cmp2, label %for.body3, label %for.inc24, !dbg !1573

for.body3:                                        ; preds = %for.cond1
    #dbg_value(i32 %inc, !1564, !DIExpression(), !1563)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber1024_ref_zetas, i32 0, i32 %k.1, !dbg !1580
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1580
    #dbg_value(i16 %0, !1582, !DIExpression(), !1563)
    #dbg_value(i32 %start.0, !1583, !DIExpression(), !1563)
  br label %for.cond4, !dbg !1584

for.cond4:                                        ; preds = %for.body6, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc20, %for.body6 ], !dbg !1586
    #dbg_value(i32 %j.0, !1583, !DIExpression(), !1563)
  %add = add nuw nsw i32 %start.0, %len.0, !dbg !1587
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !1589
  br i1 %cmp5, label %for.body6, label %for.inc21, !dbg !1590

for.body6:                                        ; preds = %for.cond4
  %1 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1591
  %arrayidx8 = getelementptr i16, ptr %1, i32 %len.0, !dbg !1591
  %2 = load i16, ptr %arrayidx8, align 2, !dbg !1591
  %call = call fastcc signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %2) #3, !dbg !1593
    #dbg_value(i16 %call, !1594, !DIExpression(), !1563)
  %arrayidx9 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1595
  %3 = load i16, ptr %arrayidx9, align 2, !dbg !1595
  %sub = sub i16 %3, %call, !dbg !1596
  %4 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1597
  %arrayidx13 = getelementptr i16, ptr %4, i32 %len.0, !dbg !1597
  store i16 %sub, ptr %arrayidx13, align 2, !dbg !1598
  %arrayidx14 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1599
  %5 = load i16, ptr %arrayidx14, align 2, !dbg !1599
  %add17 = add i16 %5, %call, !dbg !1600
  %arrayidx19 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1601
  store i16 %add17, ptr %arrayidx19, align 2, !dbg !1602
  %inc20 = add nuw i32 %j.0, 1, !dbg !1603
    #dbg_value(i32 %inc20, !1583, !DIExpression(), !1563)
  br label %for.cond4, !dbg !1604, !llvm.loop !1605

for.inc21:                                        ; preds = %for.cond4
  %j.0.lcssa = phi i32 [ %j.0, %for.cond4 ], !dbg !1586
  %inc = add i32 %k.1, 1, !dbg !1607
  %add22 = add i32 %j.0.lcssa, %len.0, !dbg !1608
    #dbg_value(i32 %add22, !1577, !DIExpression(), !1563)
  br label %for.cond1, !dbg !1609, !llvm.loop !1610

for.inc24:                                        ; preds = %for.cond1
  %k.1.lcssa = phi i32 [ %k.1, %for.cond1 ], !dbg !1563
  %shr = lshr i32 %len.0, 1, !dbg !1612
    #dbg_value(i32 %shr, !1565, !DIExpression(), !1563)
  br label %for.cond, !dbg !1613, !llvm.loop !1614

for.end25:                                        ; preds = %for.cond
  ret void, !dbg !1616
}

; Function Attrs: nounwind
define internal fastcc signext i16 @fqmul(i16 noundef signext %a, i16 noundef signext %b) unnamed_addr #0 !dbg !1617 {
entry:
    #dbg_value(i16 %a, !1620, !DIExpression(), !1621)
    #dbg_value(i16 %b, !1622, !DIExpression(), !1621)
  %conv = sext i16 %a to i32, !dbg !1623
  %conv1 = sext i16 %b to i32, !dbg !1624
  %mul = mul nsw i32 %conv, %conv1, !dbg !1625
  %call = call signext i16 @pqcrystals_kyber1024_ref_montgomery_reduce(i32 noundef %mul) #3, !dbg !1626
  ret i16 %call, !dbg !1627
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_invntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1628 {
entry:
    #dbg_value(ptr %r, !1629, !DIExpression(), !1630)
    #dbg_value(i16 1441, !1631, !DIExpression(), !1630)
    #dbg_value(i32 127, !1632, !DIExpression(), !1630)
    #dbg_value(i32 2, !1633, !DIExpression(), !1630)
  br label %for.cond, !dbg !1634

for.cond:                                         ; preds = %for.inc29, %entry
  %len.0 = phi i32 [ 2, %entry ], [ %shl, %for.inc29 ], !dbg !1636
  %k.0 = phi i32 [ 127, %entry ], [ %k.1.lcssa, %for.inc29 ], !dbg !1637
    #dbg_value(i32 %k.0, !1632, !DIExpression(), !1630)
    #dbg_value(i32 %len.0, !1633, !DIExpression(), !1630)
  %cmp = icmp ult i32 %len.0, 129, !dbg !1638
  br i1 %cmp, label %for.cond1.preheader, label %for.cond31.preheader, !dbg !1640

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1641

for.cond31.preheader:                             ; preds = %for.cond
  br label %for.cond31, !dbg !1644

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc26
  %start.0 = phi i32 [ %add27, %for.inc26 ], [ 0, %for.cond1.preheader ], !dbg !1646
  %k.1 = phi i32 [ %dec, %for.inc26 ], [ %k.0, %for.cond1.preheader ], !dbg !1630
    #dbg_value(i32 %k.1, !1632, !DIExpression(), !1630)
    #dbg_value(i32 %start.0, !1647, !DIExpression(), !1630)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !1648
  br i1 %cmp2, label %for.body3, label %for.inc29, !dbg !1641

for.body3:                                        ; preds = %for.cond1
    #dbg_value(i32 %dec, !1632, !DIExpression(), !1630)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber1024_ref_zetas, i32 0, i32 %k.1, !dbg !1650
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1650
    #dbg_value(i16 %0, !1652, !DIExpression(), !1630)
    #dbg_value(i32 %start.0, !1653, !DIExpression(), !1630)
  br label %for.cond4, !dbg !1654

for.cond4:                                        ; preds = %for.body6, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc, %for.body6 ], !dbg !1656
    #dbg_value(i32 %j.0, !1653, !DIExpression(), !1630)
  %add = add nuw nsw i32 %start.0, %len.0, !dbg !1657
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !1659
  br i1 %cmp5, label %for.body6, label %for.inc26, !dbg !1660

for.body6:                                        ; preds = %for.cond4
  %arrayidx7 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1661
  %1 = load i16, ptr %arrayidx7, align 2, !dbg !1661
    #dbg_value(i16 %1, !1663, !DIExpression(), !1630)
  %2 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1664
  %arrayidx9 = getelementptr i16, ptr %2, i32 %len.0, !dbg !1664
  %3 = load i16, ptr %arrayidx9, align 2, !dbg !1664
  %add11 = add i16 %1, %3, !dbg !1665
  %call = call signext i16 @pqcrystals_kyber1024_ref_barrett_reduce(i16 noundef signext %add11) #3, !dbg !1666
  %arrayidx13 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1667
  store i16 %call, ptr %arrayidx13, align 2, !dbg !1668
  %4 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1669
  %arrayidx15 = getelementptr i16, ptr %4, i32 %len.0, !dbg !1669
  %5 = load i16, ptr %arrayidx15, align 2, !dbg !1669
  %sub = sub i16 %5, %1, !dbg !1670
  %6 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1671
  %arrayidx20 = getelementptr i16, ptr %6, i32 %len.0, !dbg !1671
  store i16 %sub, ptr %arrayidx20, align 2, !dbg !1672
  %7 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1673
  %arrayidx22 = getelementptr i16, ptr %7, i32 %len.0, !dbg !1673
  %8 = load i16, ptr %arrayidx22, align 2, !dbg !1673
  %call23 = call fastcc signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %8) #3, !dbg !1674
  %9 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1675
  %arrayidx25 = getelementptr i16, ptr %9, i32 %len.0, !dbg !1675
  store i16 %call23, ptr %arrayidx25, align 2, !dbg !1676
  %inc = add nuw i32 %j.0, 1, !dbg !1677
    #dbg_value(i32 %inc, !1653, !DIExpression(), !1630)
  br label %for.cond4, !dbg !1678, !llvm.loop !1679

for.inc26:                                        ; preds = %for.cond4
  %j.0.lcssa = phi i32 [ %j.0, %for.cond4 ], !dbg !1656
  %dec = add i32 %k.1, -1, !dbg !1681
  %add27 = add i32 %j.0.lcssa, %len.0, !dbg !1682
    #dbg_value(i32 %add27, !1647, !DIExpression(), !1630)
  br label %for.cond1, !dbg !1683, !llvm.loop !1684

for.inc29:                                        ; preds = %for.cond1
  %k.1.lcssa = phi i32 [ %k.1, %for.cond1 ], !dbg !1630
  %shl = shl nuw nsw i32 %len.0, 1, !dbg !1686
    #dbg_value(i32 %shl, !1633, !DIExpression(), !1630)
  br label %for.cond, !dbg !1687, !llvm.loop !1688

for.cond31:                                       ; preds = %for.cond31.preheader, %for.body34
  %j.1 = phi i32 [ %inc39, %for.body34 ], [ 0, %for.cond31.preheader ], !dbg !1690
    #dbg_value(i32 %j.1, !1653, !DIExpression(), !1630)
  %exitcond = icmp ne i32 %j.1, 256, !dbg !1691
  br i1 %exitcond, label %for.body34, label %for.end40, !dbg !1644

for.body34:                                       ; preds = %for.cond31
  %arrayidx35 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !1693
  %10 = load i16, ptr %arrayidx35, align 2, !dbg !1693
  %call36 = call fastcc signext i16 @fqmul(i16 noundef signext %10, i16 noundef signext 1441) #3, !dbg !1694
  %arrayidx37 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !1695
  store i16 %call36, ptr %arrayidx37, align 2, !dbg !1696
  %inc39 = add nuw nsw i32 %j.1, 1, !dbg !1697
    #dbg_value(i32 %inc39, !1653, !DIExpression(), !1630)
  br label %for.cond31, !dbg !1698, !llvm.loop !1699

for.end40:                                        ; preds = %for.cond31
  ret void, !dbg !1701
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_basemul(ptr noundef %r, ptr noundef %a, ptr noundef %b, i16 noundef signext %zeta) local_unnamed_addr #0 !dbg !1702 {
entry:
    #dbg_value(ptr %r, !1706, !DIExpression(), !1707)
    #dbg_value(ptr %a, !1708, !DIExpression(), !1707)
    #dbg_value(ptr %b, !1709, !DIExpression(), !1707)
    #dbg_value(i16 %zeta, !1710, !DIExpression(), !1707)
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 2, !dbg !1711
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1711
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 2, !dbg !1712
  %1 = load i16, ptr %arrayidx1, align 2, !dbg !1712
  %call = call fastcc signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %1) #3, !dbg !1713
  store i16 %call, ptr %r, align 2, !dbg !1714
  %call4 = call fastcc signext i16 @fqmul(i16 noundef signext %call, i16 noundef signext %zeta) #3, !dbg !1715
  store i16 %call4, ptr %r, align 2, !dbg !1716
  %2 = load i16, ptr %a, align 2, !dbg !1717
  %3 = load i16, ptr %b, align 2, !dbg !1718
  %call8 = call fastcc signext i16 @fqmul(i16 noundef signext %2, i16 noundef signext %3) #3, !dbg !1719
  %4 = load i16, ptr %r, align 2, !dbg !1720
  %add = add i16 %4, %call8, !dbg !1720
  store i16 %add, ptr %r, align 2, !dbg !1720
  %5 = load i16, ptr %a, align 2, !dbg !1721
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %b, i32 2, !dbg !1722
  %6 = load i16, ptr %arrayidx13, align 2, !dbg !1722
  %call14 = call fastcc signext i16 @fqmul(i16 noundef signext %5, i16 noundef signext %6) #3, !dbg !1723
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %r, i32 2, !dbg !1724
  store i16 %call14, ptr %arrayidx15, align 2, !dbg !1725
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %a, i32 2, !dbg !1726
  %7 = load i16, ptr %arrayidx16, align 2, !dbg !1726
  %8 = load i16, ptr %b, align 2, !dbg !1727
  %call18 = call fastcc signext i16 @fqmul(i16 noundef signext %7, i16 noundef signext %8) #3, !dbg !1728
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %r, i32 2, !dbg !1729
  %9 = load i16, ptr %arrayidx20, align 2, !dbg !1730
  %add22 = add i16 %9, %call18, !dbg !1730
  store i16 %add22, ptr %arrayidx20, align 2, !dbg !1730
  ret void, !dbg !1731
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef %buf) local_unnamed_addr #0 !dbg !1732 {
entry:
    #dbg_value(ptr %r, !1734, !DIExpression(), !1735)
    #dbg_value(ptr %buf, !1736, !DIExpression(), !1735)
  call fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) #3, !dbg !1737
  ret void, !dbg !1738
}

; Function Attrs: nounwind
define internal fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) unnamed_addr #0 !dbg !1739 {
entry:
    #dbg_value(ptr %r, !1740, !DIExpression(), !1741)
    #dbg_value(ptr %buf, !1742, !DIExpression(), !1741)
    #dbg_value(i32 0, !1743, !DIExpression(), !1741)
  br label %for.cond, !dbg !1744

for.cond:                                         ; preds = %for.inc19, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc20, %for.inc19 ], !dbg !1746
    #dbg_value(i32 %i.0, !1743, !DIExpression(), !1741)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1747
  br i1 %exitcond1, label %for.body, label %for.end21, !dbg !1749

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 2, !dbg !1750
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 %mul, !dbg !1752
  %call = call fastcc i32 @load32_littleendian(ptr noundef %add.ptr) #3, !dbg !1753
    #dbg_value(i32 %call, !1754, !DIExpression(), !1741)
  %and = and i32 %call, 1431655765, !dbg !1755
    #dbg_value(i32 %and, !1756, !DIExpression(), !1741)
  %shr = lshr i32 %call, 1, !dbg !1757
  %and1 = and i32 %shr, 1431655765, !dbg !1758
  %add = add nuw i32 %and, %and1, !dbg !1759
    #dbg_value(i32 %add, !1756, !DIExpression(), !1741)
    #dbg_value(i32 0, !1760, !DIExpression(), !1741)
  br label %for.cond2, !dbg !1761

for.cond2:                                        ; preds = %for.body4, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body4 ], !dbg !1763
    #dbg_value(i32 %j.0, !1760, !DIExpression(), !1741)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1764
  br i1 %exitcond, label %for.body4, label %for.inc19, !dbg !1766

for.body4:                                        ; preds = %for.cond2
  %mul5 = shl nuw nsw i32 %j.0, 2, !dbg !1767
  %shr7 = lshr i32 %add, %mul5, !dbg !1769
  %conv = and i32 %shr7, 3, !dbg !1770
    #dbg_value(i32 %shr7, !1771, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3, DW_OP_and, DW_OP_stack_value), !1741)
  %mul9 = shl nuw nsw i32 %j.0, 2, !dbg !1772
  %add10 = or disjoint i32 %mul9, 2, !dbg !1773
  %shr11 = lshr i32 %add, %add10, !dbg !1774
  %conv13 = and i32 %shr11, 3, !dbg !1775
    #dbg_value(i32 %conv13, !1776, !DIExpression(), !1741)
  %sub = sub nsw i32 %conv, %conv13, !dbg !1777
  %conv16 = trunc nsw i32 %sub to i16, !dbg !1778
  %mul17 = shl nuw nsw i32 %i.0, 3, !dbg !1779
  %add18 = or disjoint i32 %mul17, %j.0, !dbg !1780
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add18, !dbg !1781
  store i16 %conv16, ptr %arrayidx, align 2, !dbg !1782
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1783
    #dbg_value(i32 %inc, !1760, !DIExpression(), !1741)
  br label %for.cond2, !dbg !1784, !llvm.loop !1785

for.inc19:                                        ; preds = %for.cond2
  %inc20 = add nuw nsw i32 %i.0, 1, !dbg !1787
    #dbg_value(i32 %inc20, !1743, !DIExpression(), !1741)
  br label %for.cond, !dbg !1788, !llvm.loop !1789

for.end21:                                        ; preds = %for.cond
  ret void, !dbg !1791
}

; Function Attrs: nounwind
define internal fastcc i32 @load32_littleendian(ptr noundef %x) unnamed_addr #0 !dbg !1792 {
entry:
    #dbg_value(ptr %x, !1795, !DIExpression(), !1796)
  %0 = load i8, ptr %x, align 1, !dbg !1797
  %conv = zext i8 %0 to i32, !dbg !1798
    #dbg_value(i32 %conv, !1799, !DIExpression(), !1796)
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %x, i32 1, !dbg !1800
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !1800
  %conv2 = zext i8 %1 to i32, !dbg !1801
  %shl = shl nuw nsw i32 %conv2, 8, !dbg !1802
  %or = or disjoint i32 %shl, %conv, !dbg !1803
    #dbg_value(i32 %or, !1799, !DIExpression(), !1796)
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %x, i32 2, !dbg !1804
  %2 = load i8, ptr %arrayidx3, align 1, !dbg !1804
  %conv4 = zext i8 %2 to i32, !dbg !1805
  %shl5 = shl nuw nsw i32 %conv4, 16, !dbg !1806
  %or6 = or disjoint i32 %or, %shl5, !dbg !1807
    #dbg_value(i32 %or6, !1799, !DIExpression(), !1796)
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %x, i32 3, !dbg !1808
  %3 = load i8, ptr %arrayidx7, align 1, !dbg !1808
  %conv8 = zext i8 %3 to i32, !dbg !1809
  %shl9 = shl nuw i32 %conv8, 24, !dbg !1810
  %or10 = or disjoint i32 %or6, %shl9, !dbg !1811
    #dbg_value(i32 %or10, !1799, !DIExpression(), !1796)
  ret i32 %or10, !dbg !1812
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_poly_cbd_eta2(ptr noundef %r, ptr noundef %buf) local_unnamed_addr #0 !dbg !1813 {
entry:
    #dbg_value(ptr %r, !1814, !DIExpression(), !1815)
    #dbg_value(ptr %buf, !1816, !DIExpression(), !1815)
  call fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) #3, !dbg !1817
  ret void, !dbg !1818
}

; Function Attrs: nounwind
define dso_local signext i16 @pqcrystals_kyber1024_ref_montgomery_reduce(i32 noundef %a) local_unnamed_addr #0 !dbg !1819 {
entry:
    #dbg_value(i32 %a, !1822, !DIExpression(), !1823)
    #dbg_value(i32 %a, !1824, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !1823)
  %sext = mul i32 %a, -218038272, !dbg !1825
  %conv3 = ashr exact i32 %sext, 16, !dbg !1825
  %mul4.neg = mul nsw i32 %conv3, -3329, !dbg !1826
  %sub = add i32 %mul4.neg, %a, !dbg !1827
  %shr = lshr i32 %sub, 16, !dbg !1828
  %conv5 = trunc nuw i32 %shr to i16, !dbg !1829
    #dbg_value(i16 %conv5, !1824, !DIExpression(), !1823)
  ret i16 %conv5, !dbg !1830
}

; Function Attrs: nounwind
define dso_local signext i16 @pqcrystals_kyber1024_ref_barrett_reduce(i16 noundef signext %a) local_unnamed_addr #0 !dbg !1831 {
entry:
    #dbg_value(i16 %a, !1834, !DIExpression(), !1835)
    #dbg_value(i16 20159, !1836, !DIExpression(), !1835)
  %conv = sext i16 %a to i32, !dbg !1837
  %mul = mul nsw i32 %conv, 20159, !dbg !1838
  %add = add nsw i32 %mul, 33554432, !dbg !1839
  %shr = ashr i32 %add, 26, !dbg !1840
    #dbg_value(i32 %shr, !1841, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1835)
    #dbg_value(i32 %shr, !1841, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1835)
  %0 = trunc nsw i32 %shr to i16, !dbg !1842
  %1 = mul i16 %0, -3329, !dbg !1842
  %conv7 = add i16 %1, %a, !dbg !1842
  ret i16 %conv7, !dbg !1843
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqcrystals_kyber1024_ref_verify(ptr noundef %a, ptr noundef %b, i32 noundef %len) local_unnamed_addr #0 !dbg !1844 {
entry:
    #dbg_value(ptr %a, !1848, !DIExpression(), !1849)
    #dbg_value(ptr %b, !1850, !DIExpression(), !1849)
    #dbg_value(i32 %len, !1851, !DIExpression(), !1849)
    #dbg_value(i8 0, !1852, !DIExpression(), !1849)
    #dbg_value(i32 0, !1853, !DIExpression(), !1849)
  br label %for.cond, !dbg !1854

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1856
  %r.0 = phi i8 [ 0, %entry ], [ %or2, %for.inc ], !dbg !1849
    #dbg_value(i8 %r.0, !1852, !DIExpression(), !1849)
    #dbg_value(i32 %i.0, !1853, !DIExpression(), !1849)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !1857
  br i1 %exitcond, label %for.inc, label %for.end, !dbg !1859

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i8 poison, i8 poison, i8 poison), !1852, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1849)
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %i.0, !dbg !1860
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1860
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 %i.0, !dbg !1861
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !1861
    #dbg_value(!DIArgList(i8 %r.0, i8 %0, i8 %1), !1852, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1849)
  %xor1 = xor i8 %0, %1, !dbg !1862
    #dbg_value(!DIArgList(i8 %r.0, i8 %xor1), !1852, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1849)
  %or2 = or i8 %r.0, %xor1, !dbg !1863
    #dbg_value(i8 %or2, !1852, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1849)
    #dbg_value(i8 %or2, !1852, !DIExpression(), !1849)
  %inc = add i32 %i.0, 1, !dbg !1864
    #dbg_value(i32 %inc, !1853, !DIExpression(), !1849)
  br label %for.cond, !dbg !1865, !llvm.loop !1866

for.end:                                          ; preds = %for.cond
  %r.0.lcssa = phi i8 [ %r.0, %for.cond ], !dbg !1849
  %2 = icmp ne i8 %r.0.lcssa, 0, !dbg !1868
  %conv6 = zext i1 %2 to i32, !dbg !1869
  ret i32 %conv6, !dbg !1870
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_cmov(ptr noundef %r, ptr noundef %x, i32 noundef %len, i8 noundef zeroext %b) local_unnamed_addr #0 !dbg !1871 {
entry:
    #dbg_value(ptr %r, !1874, !DIExpression(), !1875)
    #dbg_value(ptr %x, !1876, !DIExpression(), !1875)
    #dbg_value(i32 %len, !1877, !DIExpression(), !1875)
    #dbg_value(i8 %b, !1878, !DIExpression(), !1875)
  %0 = call i8 asm "", "=r,0"(i8 %b) #5, !dbg !1879, !srcloc !1880
    #dbg_value(i8 %0, !1878, !DIExpression(), !1875)
  %sub = sub i8 0, %0, !dbg !1881
    #dbg_value(i8 %sub, !1878, !DIExpression(), !1875)
    #dbg_value(i32 0, !1882, !DIExpression(), !1875)
  br label %for.cond, !dbg !1883

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1885
    #dbg_value(i32 %i.0, !1882, !DIExpression(), !1875)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !1886
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1888

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !1889
  %1 = load i8, ptr %arrayidx, align 1, !dbg !1889
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !1890
  %2 = load i8, ptr %arrayidx5, align 1, !dbg !1890
  %xor1 = xor i8 %1, %2, !dbg !1891
  %and2 = and i8 %xor1, %sub, !dbg !1892
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !1893
  %xor93 = xor i8 %1, %and2, !dbg !1894
  store i8 %xor93, ptr %arrayidx7, align 1, !dbg !1894
  %inc = add i32 %i.0, 1, !dbg !1895
    #dbg_value(i32 %inc, !1882, !DIExpression(), !1875)
  br label %for.cond, !dbg !1896, !llvm.loop !1897

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1899
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_cmov_int16(ptr noundef %r, i16 noundef signext %v, i16 noundef zeroext %b) local_unnamed_addr #0 !dbg !1900 {
entry:
    #dbg_value(ptr %r, !1903, !DIExpression(), !1904)
    #dbg_value(i16 %v, !1905, !DIExpression(), !1904)
    #dbg_value(i16 %b, !1906, !DIExpression(), !1904)
  %sub = sub i16 0, %b, !dbg !1907
    #dbg_value(i16 %sub, !1906, !DIExpression(), !1904)
  %0 = load i16, ptr %r, align 2, !dbg !1908
  %xor1 = xor i16 %0, %v, !dbg !1909
  %and = and i16 %xor1, %sub, !dbg !1910
  %xor6 = xor i16 %and, %0, !dbg !1911
  store i16 %xor6, ptr %r, align 2, !dbg !1911
  ret void, !dbg !1912
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_init(ptr noundef %state) local_unnamed_addr #0 !dbg !1913 {
entry:
    #dbg_value(ptr %state, !1917, !DIExpression(), !1918)
  call fastcc void @keccak_init(ptr noundef %state) #3, !dbg !1919
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1920
  store i64 0, ptr %arrayidx, align 8, !dbg !1921
  ret void, !dbg !1922
}

; Function Attrs: nounwind
define internal fastcc void @keccak_init(ptr noundef %s) unnamed_addr #0 !dbg !1923 {
entry:
    #dbg_value(ptr %s, !1927, !DIExpression(), !1928)
    #dbg_value(i32 0, !1929, !DIExpression(), !1928)
  br label %for.cond, !dbg !1930

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1932
    #dbg_value(i32 %i.0, !1929, !DIExpression(), !1928)
  %exitcond = icmp ne i32 %i.0, 25, !dbg !1933
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1935

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !1936
  store i64 0, ptr %arrayidx, align 8, !dbg !1937
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1938
    #dbg_value(i32 %inc, !1929, !DIExpression(), !1928)
  br label %for.cond, !dbg !1939, !llvm.loop !1940

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1942
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !1943 {
entry:
    #dbg_value(ptr %state, !1946, !DIExpression(), !1947)
    #dbg_value(ptr %in, !1948, !DIExpression(), !1947)
    #dbg_value(i32 %inlen, !1949, !DIExpression(), !1947)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1950
  %0 = load i64, ptr %arrayidx, align 8, !dbg !1950
  %conv = trunc i64 %0 to i32, !dbg !1950
  %call = call fastcc i32 @keccak_absorb(ptr noundef %state, i32 noundef %conv, i32 noundef 168, ptr noundef %in, i32 noundef %inlen) #3, !dbg !1951
  %conv1 = zext i32 %call to i64, !dbg !1951
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1952
  store i64 %conv1, ptr %arrayidx2, align 8, !dbg !1953
  ret void, !dbg !1954
}

; Function Attrs: nounwind
define internal fastcc i32 @keccak_absorb(ptr noundef %s, i32 noundef %pos, i32 noundef range(i32 136, 169) %r, ptr noundef %in, i32 noundef %inlen) unnamed_addr #0 !dbg !1955 {
entry:
    #dbg_value(ptr %s, !1958, !DIExpression(), !1959)
    #dbg_value(i32 %pos, !1960, !DIExpression(), !1959)
    #dbg_value(i32 %r, !1961, !DIExpression(), !1959)
    #dbg_value(ptr %in, !1962, !DIExpression(), !1959)
    #dbg_value(i32 %inlen, !1963, !DIExpression(), !1959)
  br label %while.cond, !dbg !1964

while.cond:                                       ; preds = %for.end, %entry
  %in.addr.0 = phi ptr [ %in, %entry ], [ %in.addr.1.lcssa, %for.end ]
  %inlen.addr.0 = phi i32 [ %inlen, %entry ], [ %sub2, %for.end ]
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ 0, %for.end ]
    #dbg_value(i32 %pos.addr.0, !1960, !DIExpression(), !1959)
    #dbg_value(i32 %inlen.addr.0, !1963, !DIExpression(), !1959)
    #dbg_value(ptr %in.addr.0, !1962, !DIExpression(), !1959)
  %add = add i32 %pos.addr.0, %inlen.addr.0, !dbg !1965
  %cmp.not = icmp ult i32 %add, %r, !dbg !1966
  br i1 %cmp.not, label %for.cond3.preheader, label %for.cond.preheader, !dbg !1964

for.cond.preheader:                               ; preds = %while.cond
  %umax = call i32 @llvm.umax.i32(i32 %pos.addr.0, i32 %r), !dbg !1967
  br label %for.cond, !dbg !1967

for.cond3.preheader:                              ; preds = %while.cond
  %in.addr.0.lcssa = phi ptr [ %in.addr.0, %while.cond ]
  %inlen.addr.0.lcssa = phi i32 [ %inlen.addr.0, %while.cond ]
  %pos.addr.0.lcssa = phi i32 [ %pos.addr.0, %while.cond ]
  br label %for.cond3, !dbg !1970

for.cond:                                         ; preds = %for.cond.preheader, %for.body
  %in.addr.1 = phi ptr [ %incdec.ptr, %for.body ], [ %in.addr.0, %for.cond.preheader ]
  %i.0 = phi i32 [ %inc, %for.body ], [ %pos.addr.0, %for.cond.preheader ], !dbg !1972
    #dbg_value(i32 %i.0, !1973, !DIExpression(), !1959)
    #dbg_value(ptr %in.addr.1, !1962, !DIExpression(), !1959)
  %exitcond = icmp ne i32 %i.0, %umax, !dbg !1974
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1967

for.body:                                         ; preds = %for.cond
    #dbg_value(ptr %in.addr.1, !1962, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1959)
  %0 = load i8, ptr %in.addr.1, align 1, !dbg !1976
  %conv = zext i8 %0 to i64, !dbg !1977
  %rem = shl nuw nsw i32 %i.0, 3, !dbg !1978
  %mul = and i32 %rem, 56, !dbg !1978
  %sh_prom = zext nneg i32 %mul to i64, !dbg !1979
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !1979
  %div2 = lshr i32 %i.0, 3, !dbg !1980
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div2, !dbg !1981
  %1 = load i64, ptr %arrayidx, align 8, !dbg !1982
  %xor = xor i64 %1, %shl, !dbg !1982
  store i64 %xor, ptr %arrayidx, align 8, !dbg !1982
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %in.addr.1, i32 1, !dbg !1983
    #dbg_value(ptr %incdec.ptr, !1962, !DIExpression(), !1959)
  %inc = add i32 %i.0, 1, !dbg !1984
    #dbg_value(i32 %inc, !1973, !DIExpression(), !1959)
  br label %for.cond, !dbg !1985, !llvm.loop !1986

for.end:                                          ; preds = %for.cond
  %in.addr.1.lcssa = phi ptr [ %in.addr.1, %for.cond ]
  %sub.neg = sub i32 %pos.addr.0, %r, !dbg !1988
  %sub2 = add i32 %sub.neg, %inlen.addr.0, !dbg !1989
    #dbg_value(i32 %sub2, !1963, !DIExpression(), !1959)
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !1990
    #dbg_value(i32 0, !1960, !DIExpression(), !1959)
  br label %while.cond, !dbg !1964, !llvm.loop !1991

for.cond3:                                        ; preds = %for.cond3.preheader, %for.body7
  %in.addr.2 = phi ptr [ %incdec.ptr8, %for.body7 ], [ %in.addr.0.lcssa, %for.cond3.preheader ]
  %i.1 = phi i32 [ %inc18, %for.body7 ], [ %pos.addr.0.lcssa, %for.cond3.preheader ], !dbg !1993
    #dbg_value(i32 %i.1, !1973, !DIExpression(), !1959)
    #dbg_value(ptr %in.addr.2, !1962, !DIExpression(), !1959)
  %add4 = add i32 %pos.addr.0.lcssa, %inlen.addr.0.lcssa, !dbg !1994
  %cmp5 = icmp ult i32 %i.1, %add4, !dbg !1996
  br i1 %cmp5, label %for.body7, label %for.end19, !dbg !1970

for.body7:                                        ; preds = %for.cond3
    #dbg_value(ptr %in.addr.2, !1962, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1959)
  %2 = load i8, ptr %in.addr.2, align 1, !dbg !1997
  %conv9 = zext i8 %2 to i64, !dbg !1998
  %rem10 = shl i32 %i.1, 3, !dbg !1999
  %mul11 = and i32 %rem10, 56, !dbg !1999
  %sh_prom12 = zext nneg i32 %mul11 to i64, !dbg !2000
  %shl13 = shl nuw i64 %conv9, %sh_prom12, !dbg !2000
  %div141 = lshr i32 %i.1, 3, !dbg !2001
  %arrayidx15 = getelementptr inbounds nuw i64, ptr %s, i32 %div141, !dbg !2002
  %3 = load i64, ptr %arrayidx15, align 8, !dbg !2003
  %xor16 = xor i64 %3, %shl13, !dbg !2003
  store i64 %xor16, ptr %arrayidx15, align 8, !dbg !2003
  %incdec.ptr8 = getelementptr inbounds nuw i8, ptr %in.addr.2, i32 1, !dbg !2004
    #dbg_value(ptr %incdec.ptr8, !1962, !DIExpression(), !1959)
  %inc18 = add nuw i32 %i.1, 1, !dbg !2005
    #dbg_value(i32 %inc18, !1973, !DIExpression(), !1959)
  br label %for.cond3, !dbg !2006, !llvm.loop !2007

for.end19:                                        ; preds = %for.cond3
  %i.1.lcssa = phi i32 [ %i.1, %for.cond3 ], !dbg !1993
  ret i32 %i.1.lcssa, !dbg !2009
}

; Function Attrs: nounwind
define internal fastcc void @KeccakF1600_StatePermute(ptr noundef %state) unnamed_addr #0 !dbg !2010 {
entry:
    #dbg_value(ptr %state, !2011, !DIExpression(), !2012)
  %0 = load i64, ptr %state, align 8, !dbg !2013
    #dbg_value(i64 %0, !2014, !DIExpression(), !2012)
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !2015
  %1 = load i64, ptr %arrayidx1, align 8, !dbg !2015
    #dbg_value(i64 %1, !2016, !DIExpression(), !2012)
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !2017
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !2017
    #dbg_value(i64 %2, !2018, !DIExpression(), !2012)
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !2019
  %3 = load i64, ptr %arrayidx3, align 8, !dbg !2019
    #dbg_value(i64 %3, !2020, !DIExpression(), !2012)
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !2021
  %4 = load i64, ptr %arrayidx4, align 8, !dbg !2021
    #dbg_value(i64 %4, !2022, !DIExpression(), !2012)
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !2023
  %5 = load i64, ptr %arrayidx5, align 8, !dbg !2023
    #dbg_value(i64 %5, !2024, !DIExpression(), !2012)
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !2025
  %6 = load i64, ptr %arrayidx6, align 8, !dbg !2025
    #dbg_value(i64 %6, !2026, !DIExpression(), !2012)
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !2027
  %7 = load i64, ptr %arrayidx7, align 8, !dbg !2027
    #dbg_value(i64 %7, !2028, !DIExpression(), !2012)
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !2029
  %8 = load i64, ptr %arrayidx8, align 8, !dbg !2029
    #dbg_value(i64 %8, !2030, !DIExpression(), !2012)
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !2031
  %9 = load i64, ptr %arrayidx9, align 8, !dbg !2031
    #dbg_value(i64 %9, !2032, !DIExpression(), !2012)
  %arrayidx10 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !2033
  %10 = load i64, ptr %arrayidx10, align 8, !dbg !2033
    #dbg_value(i64 %10, !2034, !DIExpression(), !2012)
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !2035
  %11 = load i64, ptr %arrayidx11, align 8, !dbg !2035
    #dbg_value(i64 %11, !2036, !DIExpression(), !2012)
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !2037
  %12 = load i64, ptr %arrayidx12, align 8, !dbg !2037
    #dbg_value(i64 %12, !2038, !DIExpression(), !2012)
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !2039
  %13 = load i64, ptr %arrayidx13, align 8, !dbg !2039
    #dbg_value(i64 %13, !2040, !DIExpression(), !2012)
  %arrayidx14 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !2041
  %14 = load i64, ptr %arrayidx14, align 8, !dbg !2041
    #dbg_value(i64 %14, !2042, !DIExpression(), !2012)
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !2043
  %15 = load i64, ptr %arrayidx15, align 8, !dbg !2043
    #dbg_value(i64 %15, !2044, !DIExpression(), !2012)
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !2045
  %16 = load i64, ptr %arrayidx16, align 8, !dbg !2045
    #dbg_value(i64 %16, !2046, !DIExpression(), !2012)
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !2047
  %17 = load i64, ptr %arrayidx17, align 8, !dbg !2047
    #dbg_value(i64 %17, !2048, !DIExpression(), !2012)
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !2049
  %18 = load i64, ptr %arrayidx18, align 8, !dbg !2049
    #dbg_value(i64 %18, !2050, !DIExpression(), !2012)
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !2051
  %19 = load i64, ptr %arrayidx19, align 8, !dbg !2051
    #dbg_value(i64 %19, !2052, !DIExpression(), !2012)
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !2053
  %20 = load i64, ptr %arrayidx20, align 8, !dbg !2053
    #dbg_value(i64 %20, !2054, !DIExpression(), !2012)
  %arrayidx21 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !2055
  %21 = load i64, ptr %arrayidx21, align 8, !dbg !2055
    #dbg_value(i64 %21, !2056, !DIExpression(), !2012)
  %arrayidx22 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !2057
  %22 = load i64, ptr %arrayidx22, align 8, !dbg !2057
    #dbg_value(i64 %22, !2058, !DIExpression(), !2012)
  %arrayidx23 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !2059
  %23 = load i64, ptr %arrayidx23, align 8, !dbg !2059
    #dbg_value(i64 %23, !2060, !DIExpression(), !2012)
  %arrayidx24 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !2061
  %24 = load i64, ptr %arrayidx24, align 8, !dbg !2061
    #dbg_value(i64 %24, !2062, !DIExpression(), !2012)
    #dbg_value(i32 0, !2063, !DIExpression(), !2012)
  br label %for.cond, !dbg !2064

for.cond:                                         ; preds = %for.inc, %entry
  %Aso.0 = phi i64 [ %23, %entry ], [ %xor444, %for.inc ], !dbg !2012
  %Asi.0 = phi i64 [ %22, %entry ], [ %xor441, %for.inc ], !dbg !2012
  %Ase.0 = phi i64 [ %21, %entry ], [ %xor438, %for.inc ], !dbg !2012
  %Asa.0 = phi i64 [ %20, %entry ], [ %xor435, %for.inc ], !dbg !2012
  %Amu.0 = phi i64 [ %19, %entry ], [ %xor412, %for.inc ], !dbg !2012
  %Amo.0 = phi i64 [ %18, %entry ], [ %xor409, %for.inc ], !dbg !2012
  %Ami.0 = phi i64 [ %17, %entry ], [ %xor406, %for.inc ], !dbg !2012
  %Ame.0 = phi i64 [ %16, %entry ], [ %xor403, %for.inc ], !dbg !2012
  %Ama.0 = phi i64 [ %15, %entry ], [ %xor400, %for.inc ], !dbg !2012
  %Aku.0 = phi i64 [ %14, %entry ], [ %xor377, %for.inc ], !dbg !2012
  %Ako.0 = phi i64 [ %13, %entry ], [ %xor374, %for.inc ], !dbg !2012
  %Aki.0 = phi i64 [ %12, %entry ], [ %xor371, %for.inc ], !dbg !2012
  %Ake.0 = phi i64 [ %11, %entry ], [ %xor368, %for.inc ], !dbg !2012
  %Aka.0 = phi i64 [ %10, %entry ], [ %xor365, %for.inc ], !dbg !2012
  %Agu.0 = phi i64 [ %9, %entry ], [ %xor342, %for.inc ], !dbg !2012
  %Ago.0 = phi i64 [ %8, %entry ], [ %xor339, %for.inc ], !dbg !2012
  %Agi.0 = phi i64 [ %7, %entry ], [ %xor336, %for.inc ], !dbg !2012
  %Age.0 = phi i64 [ %6, %entry ], [ %xor333, %for.inc ], !dbg !2012
  %Aga.0 = phi i64 [ %5, %entry ], [ %xor330, %for.inc ], !dbg !2012
  %Abu.0 = phi i64 [ %4, %entry ], [ %xor307, %for.inc ], !dbg !2012
  %Abo.0 = phi i64 [ %3, %entry ], [ %xor304, %for.inc ], !dbg !2012
  %Abi.0 = phi i64 [ %2, %entry ], [ %xor301, %for.inc ], !dbg !2012
  %Abe.0 = phi i64 [ %1, %entry ], [ %xor298, %for.inc ], !dbg !2012
  %Aba.0 = phi i64 [ %0, %entry ], [ %xor295, %for.inc ], !dbg !2012
  %round.0 = phi i32 [ 0, %entry ], [ %add448, %for.inc ], !dbg !2066
  %Asu.0 = phi i64 [ %24, %entry ], [ %xor447, %for.inc ], !dbg !2012
    #dbg_value(i64 %Asu.0, !2062, !DIExpression(), !2012)
    #dbg_value(i32 %round.0, !2063, !DIExpression(), !2012)
    #dbg_value(i64 %Aba.0, !2014, !DIExpression(), !2012)
    #dbg_value(i64 %Abe.0, !2016, !DIExpression(), !2012)
    #dbg_value(i64 %Abi.0, !2018, !DIExpression(), !2012)
    #dbg_value(i64 %Abo.0, !2020, !DIExpression(), !2012)
    #dbg_value(i64 %Abu.0, !2022, !DIExpression(), !2012)
    #dbg_value(i64 %Aga.0, !2024, !DIExpression(), !2012)
    #dbg_value(i64 %Age.0, !2026, !DIExpression(), !2012)
    #dbg_value(i64 %Agi.0, !2028, !DIExpression(), !2012)
    #dbg_value(i64 %Ago.0, !2030, !DIExpression(), !2012)
    #dbg_value(i64 %Agu.0, !2032, !DIExpression(), !2012)
    #dbg_value(i64 %Aka.0, !2034, !DIExpression(), !2012)
    #dbg_value(i64 %Ake.0, !2036, !DIExpression(), !2012)
    #dbg_value(i64 %Aki.0, !2038, !DIExpression(), !2012)
    #dbg_value(i64 %Ako.0, !2040, !DIExpression(), !2012)
    #dbg_value(i64 %Aku.0, !2042, !DIExpression(), !2012)
    #dbg_value(i64 %Ama.0, !2044, !DIExpression(), !2012)
    #dbg_value(i64 %Ame.0, !2046, !DIExpression(), !2012)
    #dbg_value(i64 %Ami.0, !2048, !DIExpression(), !2012)
    #dbg_value(i64 %Amo.0, !2050, !DIExpression(), !2012)
    #dbg_value(i64 %Amu.0, !2052, !DIExpression(), !2012)
    #dbg_value(i64 %Asa.0, !2054, !DIExpression(), !2012)
    #dbg_value(i64 %Ase.0, !2056, !DIExpression(), !2012)
    #dbg_value(i64 %Asi.0, !2058, !DIExpression(), !2012)
    #dbg_value(i64 %Aso.0, !2060, !DIExpression(), !2012)
  %cmp = icmp samesign ult i32 %round.0, 24, !dbg !2067
  br i1 %cmp, label %for.inc, label %for.end, !dbg !2069

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %Asa.0, i64 %Ama.0, i64 %Aka.0, i64 %Aga.0), !2070, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %Ase.0, i64 %Ame.0, i64 %Ake.0, i64 %Age.0), !2071, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %Asi.0, i64 %Ami.0, i64 %Aki.0, i64 %Agi.0), !2072, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %Aso.0, i64 %Amo.0, i64 %Ako.0, i64 %Ago.0), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %Asu.0, i64 %Amu.0, i64 %Aku.0, i64 %Agu.0), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2078, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2079, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2014, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2070, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2071, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2072, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2050, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2073, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2074, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2080, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2080, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2081, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2082, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2083, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2084, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2070, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2032, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2071, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2072, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2046, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2073, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2058, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2074, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2085, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2086, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2087, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2088, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2089, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2016, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2070, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2028, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2071, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2040, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2072, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2052, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2073, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2054, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2074, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2090, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2091, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2092, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2093, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2094, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2070, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2071, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2036, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2072, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2048, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2073, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2060, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2074, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2095, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2096, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2097, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2098, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2099, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2018, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2070, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2030, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2071, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2042, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2072, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2073, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2056, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2074, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2100, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2101, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2102, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2103, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2104, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2070, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2071, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2072, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2078, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !2079, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2080, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2070, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2086, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2071, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2092, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2072, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2098, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2073, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2104, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2074, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2014, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2014, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2016, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2018, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2083, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2070, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2089, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2071, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2090, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2072, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2096, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2073, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2102, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2074, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2028, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2030, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2032, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2081, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2070, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2087, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2071, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2093, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2072, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2099, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2073, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2100, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2074, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2036, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2040, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2042, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2084, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2070, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2085, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2071, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2091, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2072, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2097, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2073, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !2103, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2074, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2046, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2048, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2050, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2052, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2082, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2070, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2088, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2071, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2094, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2072, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2095, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2073, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2101, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 poison, !2074, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2054, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2056, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2058, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2060, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor32 = xor i64 %Abi.0, %Agi.0, !dbg !2105
    #dbg_value(!DIArgList(i64 %xor32, i64 %Asi.0, i64 %Ami.0, i64 %Aki.0), !2072, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor33 = xor i64 %xor32, %Aki.0, !dbg !2107
    #dbg_value(!DIArgList(i64 %xor33, i64 %Asi.0, i64 %Ami.0), !2072, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor34 = xor i64 %xor33, %Ami.0, !dbg !2108
    #dbg_value(!DIArgList(i64 %xor34, i64 %Asi.0), !2072, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor35 = xor i64 %xor34, %Asi.0, !dbg !2109
    #dbg_value(i64 %xor35, !2072, !DIExpression(), !2012)
  %xor40 = xor i64 %Abu.0, %Agu.0, !dbg !2110
    #dbg_value(!DIArgList(i64 %xor40, i64 %Asu.0, i64 %Amu.0, i64 %Aku.0), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor41 = xor i64 %xor40, %Aku.0, !dbg !2111
    #dbg_value(!DIArgList(i64 %xor41, i64 %Asu.0, i64 %Amu.0), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor42 = xor i64 %xor41, %Amu.0, !dbg !2112
    #dbg_value(!DIArgList(i64 %xor42, i64 %Asu.0), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor43 = xor i64 %xor42, %Asu.0, !dbg !2113
    #dbg_value(i64 %xor43, !2074, !DIExpression(), !2012)
  %25 = shl i64 %xor43, 1, !dbg !2114
  %26 = lshr i64 %xor43, 63, !dbg !2114
  %27 = or i64 %25, %26, !dbg !2114
    #dbg_value(!DIArgList(i64 %Ago.0, i64 %xor35, i64 %27), !2030, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %xor35, i64 %27), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Ako.0, i64 %xor35, i64 %27), !2040, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Amo.0, i64 %xor35, i64 %27), !2050, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Aso.0, i64 %xor35, i64 %27), !2060, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor35, i64 %27), !2078, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor57 = xor i64 %xor35, %27, !dbg !2115
    #dbg_value(!DIArgList(i64 %Ago.0, i64 %xor57), !2030, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %xor57), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Ako.0, i64 %xor57), !2040, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Amo.0, i64 %xor57), !2050, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Aso.0, i64 %xor57), !2060, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 %xor57, !2078, !DIExpression(), !2012)
  %xor203 = xor i64 %Ago.0, %xor57, !dbg !2116
    #dbg_value(i64 %xor203, !2030, !DIExpression(), !2012)
  %28 = shl i64 %xor203, 55, !dbg !2117
  %29 = lshr i64 %xor203, 9, !dbg !2117
  %30 = or i64 %28, %29, !dbg !2117
    #dbg_value(i64 %30, !2071, !DIExpression(), !2012)
  %xor28 = xor i64 %Abe.0, %Age.0, !dbg !2118
    #dbg_value(!DIArgList(i64 %xor28, i64 %Ase.0, i64 %Ame.0, i64 %Ake.0), !2071, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor29 = xor i64 %xor28, %Ake.0, !dbg !2119
    #dbg_value(!DIArgList(i64 %xor29, i64 %Ase.0, i64 %Ame.0), !2071, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor30 = xor i64 %xor29, %Ame.0, !dbg !2120
    #dbg_value(!DIArgList(i64 %xor30, i64 %Ase.0), !2071, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor31 = xor i64 %xor30, %Ase.0, !dbg !2121
    #dbg_value(i64 %xor31, !2071, !DIExpression(), !2012)
  %31 = shl i64 %xor31, 1, !dbg !2122
  %32 = lshr i64 %xor31, 63, !dbg !2122
  %33 = or i64 %31, %32, !dbg !2122
    #dbg_value(!DIArgList(i64 %xor43, i64 %33), !2075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor43, i64 %33), !2014, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor43, i64 %33), !2070, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Aka.0, i64 %xor43, i64 %33), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Aga.0, i64 %xor43, i64 %33), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Asa.0, i64 %xor43, i64 %33), !2054, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Ama.0, i64 %xor43, i64 %33), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor45 = xor i64 %xor43, %33, !dbg !2123
    #dbg_value(i64 %xor45, !2075, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor45), !2070, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor45), !2014, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Aka.0, i64 %xor45), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Aga.0, i64 %xor45), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Asa.0, i64 %xor45), !2054, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Ama.0, i64 %xor45), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor211 = xor i64 %Ama.0, %xor45, !dbg !2124
    #dbg_value(i64 %xor211, !2044, !DIExpression(), !2012)
  %34 = shl i64 %xor211, 41, !dbg !2125
  %35 = lshr i64 %xor211, 23, !dbg !2125
  %36 = or i64 %34, %35, !dbg !2125
    #dbg_value(i64 %36, !2073, !DIExpression(), !2012)
  %xor36 = xor i64 %Abo.0, %Ago.0, !dbg !2126
    #dbg_value(!DIArgList(i64 %xor36, i64 %Aso.0, i64 %Amo.0, i64 %Ako.0), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor37 = xor i64 %xor36, %Ako.0, !dbg !2127
    #dbg_value(!DIArgList(i64 %xor37, i64 %Aso.0, i64 %Amo.0), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor38 = xor i64 %xor37, %Amo.0, !dbg !2128
    #dbg_value(!DIArgList(i64 %xor38, i64 %Aso.0), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor39 = xor i64 %xor38, %Aso.0, !dbg !2129
    #dbg_value(i64 %xor39, !2073, !DIExpression(), !2012)
  %xor = xor i64 %Aba.0, %Aga.0, !dbg !2130
    #dbg_value(!DIArgList(i64 %xor, i64 %Asa.0, i64 %Ama.0, i64 %Aka.0), !2070, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor25 = xor i64 %xor, %Aka.0, !dbg !2131
    #dbg_value(!DIArgList(i64 %xor25, i64 %Asa.0, i64 %Ama.0), !2070, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor26 = xor i64 %xor25, %Ama.0, !dbg !2132
    #dbg_value(!DIArgList(i64 %xor26, i64 %Asa.0), !2070, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor27 = xor i64 %xor26, %Asa.0, !dbg !2133
    #dbg_value(i64 %xor27, !2070, !DIExpression(), !2012)
  %37 = shl i64 %xor27, 1, !dbg !2134
  %38 = lshr i64 %xor27, 63, !dbg !2134
  %39 = or i64 %37, %38, !dbg !2134
    #dbg_value(!DIArgList(i64 %Agu.0, i64 %xor39, i64 %39), !2032, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %xor39, i64 %39), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Asu.0, i64 %xor39, i64 %39), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Amu.0, i64 %xor39, i64 %39), !2052, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor39, i64 %39), !2079, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Aku.0, i64 %xor39, i64 %39), !2042, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor61 = xor i64 %xor39, %39, !dbg !2135
    #dbg_value(!DIArgList(i64 %Agu.0, i64 %xor61), !2032, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %xor61), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Asu.0, i64 %xor61), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Amu.0, i64 %xor61), !2052, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 %xor61, !2079, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 %Aku.0, i64 %xor61), !2042, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor207 = xor i64 %Aku.0, %xor61, !dbg !2136
    #dbg_value(i64 %xor207, !2042, !DIExpression(), !2012)
  %40 = shl i64 %xor207, 39, !dbg !2137
  %41 = lshr i64 %xor207, 25, !dbg !2137
  %42 = or i64 %40, %41, !dbg !2137
    #dbg_value(i64 %42, !2072, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 %30, i64 %36, i64 %42), !2101, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %not222 = xor i64 %42, -1, !dbg !2138
    #dbg_value(!DIArgList(i64 %30, i64 %36, i64 %not222), !2101, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %and223 = and i64 %36, %not222, !dbg !2139
    #dbg_value(!DIArgList(i64 %30, i64 %and223), !2101, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor224 = xor i64 %30, %and223, !dbg !2140
    #dbg_value(i64 %xor224, !2101, !DIExpression(), !2012)
  %43 = shl i64 %xor39, 1, !dbg !2141
  %44 = lshr i64 %xor39, 63, !dbg !2141
  %45 = or i64 %43, %44, !dbg !2141
    #dbg_value(!DIArgList(i64 %xor31, i64 %45), !2077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Aki.0, i64 %xor31, i64 %45), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Agi.0, i64 %xor31, i64 %45), !2028, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %xor31, i64 %45), !2018, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Asi.0, i64 %xor31, i64 %45), !2058, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Ami.0, i64 %xor31, i64 %45), !2048, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor53 = xor i64 %xor31, %45, !dbg !2142
    #dbg_value(i64 %xor53, !2077, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 %Aki.0, i64 %xor53), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Agi.0, i64 %xor53), !2028, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %xor53), !2018, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Asi.0, i64 %xor53), !2058, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Ami.0, i64 %xor53), !2048, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor67 = xor i64 %Aki.0, %xor53, !dbg !2143
    #dbg_value(i64 %xor67, !2038, !DIExpression(), !2012)
  %46 = shl i64 %xor67, 43, !dbg !2144
  %47 = lshr i64 %xor67, 21, !dbg !2144
  %48 = or i64 %46, %47, !dbg !2144
    #dbg_value(i64 %48, !2072, !DIExpression(), !2012)
  %49 = shl i64 %xor35, 1, !dbg !2145
  %50 = lshr i64 %xor35, 63, !dbg !2145
  %51 = or i64 %49, %50, !dbg !2145
    #dbg_value(!DIArgList(i64 %xor27, i64 %51), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Age.0, i64 %xor27, i64 %51), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %xor27, i64 %51), !2016, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Ake.0, i64 %xor27, i64 %51), !2036, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Ame.0, i64 %xor27, i64 %51), !2046, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Ase.0, i64 %xor27, i64 %51), !2056, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor49 = xor i64 %xor27, %51, !dbg !2146
    #dbg_value(i64 %xor49, !2076, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 %Age.0, i64 %xor49), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %xor49), !2016, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Ake.0, i64 %xor49), !2036, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Ame.0, i64 %xor49), !2046, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %Ase.0, i64 %xor49), !2056, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor63 = xor i64 %Age.0, %xor49, !dbg !2147
    #dbg_value(i64 %xor63, !2026, !DIExpression(), !2012)
  %52 = shl i64 %xor63, 44, !dbg !2148
  %53 = lshr i64 %xor63, 20, !dbg !2148
  %54 = or i64 %52, %53, !dbg !2148
    #dbg_value(i64 %54, !2071, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %48, i64 %xor45, i64 %54), !2080, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %not = xor i64 %54, -1, !dbg !2149
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %48, i64 %xor45, i64 %not), !2080, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %and = and i64 %48, %not, !dbg !2150
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %and, i64 %xor45), !2080, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %arrayidx80 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %round.0, !dbg !2151
  %55 = load i64, ptr %arrayidx80, align 8, !dbg !2151
    #dbg_value(!DIArgList(i64 %and, i64 %Aba.0, i64 %xor45, i64 %55), !2080, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
  %56 = xor i64 %and, %55, !dbg !2152
    #dbg_value(!DIArgList(i64 %56, i64 %Aba.0, i64 %xor45), !2080, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor62 = xor i64 %Aba.0, %xor45, !dbg !2153
    #dbg_value(i64 %xor62, !2014, !DIExpression(), !2012)
    #dbg_value(i64 %xor62, !2070, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 %56, i64 %xor62), !2080, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor81 = xor i64 %56, %xor62, !dbg !2152
    #dbg_value(i64 %xor81, !2080, !DIExpression(), !2012)
  %xor94 = xor i64 %Abo.0, %xor57, !dbg !2154
    #dbg_value(i64 %xor94, !2020, !DIExpression(), !2012)
  %57 = shl i64 %xor94, 28, !dbg !2155
  %58 = lshr i64 %xor94, 36, !dbg !2155
  %59 = or i64 %57, %58, !dbg !2155
    #dbg_value(i64 %59, !2070, !DIExpression(), !2012)
  %xor102 = xor i64 %Aka.0, %xor45, !dbg !2156
    #dbg_value(i64 %xor102, !2034, !DIExpression(), !2012)
  %60 = shl i64 %xor102, 3, !dbg !2157
  %61 = lshr i64 %xor102, 61, !dbg !2157
  %62 = or i64 %60, %61, !dbg !2157
    #dbg_value(i64 %62, !2072, !DIExpression(), !2012)
  %xor98 = xor i64 %Agu.0, %xor61, !dbg !2158
    #dbg_value(i64 %xor98, !2032, !DIExpression(), !2012)
  %63 = shl i64 %xor98, 20, !dbg !2159
  %64 = lshr i64 %xor98, 44, !dbg !2159
  %65 = or i64 %63, %64, !dbg !2159
    #dbg_value(i64 %65, !2071, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 %59, i64 %62, i64 %65), !2085, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %not114 = xor i64 %65, -1, !dbg !2160
    #dbg_value(!DIArgList(i64 %59, i64 %62, i64 %not114), !2085, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %and115 = and i64 %62, %not114, !dbg !2161
    #dbg_value(!DIArgList(i64 %59, i64 %and115), !2085, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor116 = xor i64 %59, %and115, !dbg !2162
    #dbg_value(i64 %xor116, !2085, !DIExpression(), !2012)
  %xor234 = xor i64 %xor81, %xor116, !dbg !2163
  %xor129 = xor i64 %Abe.0, %xor49, !dbg !2164
    #dbg_value(i64 %xor129, !2016, !DIExpression(), !2012)
  %66 = shl i64 %xor129, 1, !dbg !2165
  %67 = lshr i64 %xor129, 63, !dbg !2165
  %68 = or i64 %66, %67, !dbg !2165
    #dbg_value(i64 %68, !2070, !DIExpression(), !2012)
  %xor137 = xor i64 %Ako.0, %xor57, !dbg !2166
    #dbg_value(i64 %xor137, !2040, !DIExpression(), !2012)
  %69 = shl i64 %xor137, 25, !dbg !2167
  %70 = lshr i64 %xor137, 39, !dbg !2167
  %71 = or i64 %69, %70, !dbg !2167
    #dbg_value(i64 %71, !2072, !DIExpression(), !2012)
  %xor133 = xor i64 %Agi.0, %xor53, !dbg !2168
    #dbg_value(i64 %xor133, !2028, !DIExpression(), !2012)
  %72 = shl i64 %xor133, 6, !dbg !2169
  %73 = lshr i64 %xor133, 58, !dbg !2169
  %74 = or i64 %72, %73, !dbg !2169
    #dbg_value(i64 %74, !2071, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 %68, i64 %71, i64 %74), !2090, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %not149 = xor i64 %74, -1, !dbg !2170
    #dbg_value(!DIArgList(i64 %68, i64 %71, i64 %not149), !2090, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %and150 = and i64 %71, %not149, !dbg !2171
    #dbg_value(!DIArgList(i64 %68, i64 %and150), !2090, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor151 = xor i64 %68, %and150, !dbg !2172
    #dbg_value(i64 %xor151, !2090, !DIExpression(), !2012)
  %xor235 = xor i64 %xor234, %xor151, !dbg !2173
  %xor164 = xor i64 %Abu.0, %xor61, !dbg !2174
    #dbg_value(i64 %xor164, !2022, !DIExpression(), !2012)
  %75 = shl i64 %xor164, 27, !dbg !2175
  %76 = lshr i64 %xor164, 37, !dbg !2175
  %77 = or i64 %75, %76, !dbg !2175
    #dbg_value(i64 %77, !2070, !DIExpression(), !2012)
  %xor172 = xor i64 %Ake.0, %xor49, !dbg !2176
    #dbg_value(i64 %xor172, !2036, !DIExpression(), !2012)
  %78 = shl i64 %xor172, 10, !dbg !2177
  %79 = lshr i64 %xor172, 54, !dbg !2177
  %80 = or i64 %78, %79, !dbg !2177
    #dbg_value(i64 %80, !2072, !DIExpression(), !2012)
  %xor168 = xor i64 %Aga.0, %xor45, !dbg !2178
    #dbg_value(i64 %xor168, !2024, !DIExpression(), !2012)
  %81 = shl i64 %xor168, 36, !dbg !2179
  %82 = lshr i64 %xor168, 28, !dbg !2179
  %83 = or i64 %81, %82, !dbg !2179
    #dbg_value(i64 %83, !2071, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 %77, i64 %80, i64 %83), !2095, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %not184 = xor i64 %83, -1, !dbg !2180
    #dbg_value(!DIArgList(i64 %77, i64 %80, i64 %not184), !2095, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %and185 = and i64 %80, %not184, !dbg !2181
    #dbg_value(!DIArgList(i64 %77, i64 %and185), !2095, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor186 = xor i64 %77, %and185, !dbg !2182
    #dbg_value(i64 %xor186, !2095, !DIExpression(), !2012)
  %xor236 = xor i64 %xor235, %xor186, !dbg !2183
  %xor199 = xor i64 %Abi.0, %xor53, !dbg !2184
    #dbg_value(i64 %xor199, !2018, !DIExpression(), !2012)
  %84 = shl i64 %xor199, 62, !dbg !2185
  %85 = lshr i64 %xor199, 2, !dbg !2185
  %86 = or i64 %84, %85, !dbg !2185
    #dbg_value(!DIArgList(i64 %86, i64 %42, i64 %30), !2100, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor236, i64 %86, i64 %42, i64 %30), !2070, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
  %not219 = xor i64 %30, -1, !dbg !2186
    #dbg_value(!DIArgList(i64 %86, i64 %42, i64 %not219), !2100, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor236, i64 %86, i64 %42, i64 %not219), !2070, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
  %and220 = and i64 %42, %not219, !dbg !2187
    #dbg_value(!DIArgList(i64 %86, i64 %and220), !2100, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor236, i64 %86, i64 %and220), !2070, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor221 = xor i64 %86, %and220, !dbg !2188
    #dbg_value(i64 %xor221, !2100, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor221), !2070, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor237 = xor i64 %xor236, %xor221, !dbg !2189
    #dbg_value(i64 %xor237, !2070, !DIExpression(), !2012)
  %xor75 = xor i64 %Asu.0, %xor61, !dbg !2190
    #dbg_value(i64 %xor75, !2062, !DIExpression(), !2012)
  %87 = shl i64 %xor75, 14, !dbg !2191
  %88 = lshr i64 %xor75, 50, !dbg !2191
  %89 = or i64 %87, %88, !dbg !2191
    #dbg_value(i64 %89, !2074, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 %89, i64 %54, i64 %xor62), !2084, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor71 = xor i64 %Amo.0, %xor57, !dbg !2192
    #dbg_value(i64 %xor71, !2050, !DIExpression(), !2012)
  %90 = shl i64 %xor71, 21, !dbg !2193
  %91 = lshr i64 %xor71, 43, !dbg !2193
  %92 = or i64 %90, %91, !dbg !2193
    #dbg_value(i64 %92, !2073, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 %48, i64 %89, i64 %92), !2082, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %54, i64 %92, i64 %48), !2081, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %92, i64 %xor62, i64 %89), !2083, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %not85 = xor i64 %92, -1, !dbg !2194
    #dbg_value(!DIArgList(i64 %48, i64 %89, i64 %not85), !2082, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %and86 = and i64 %89, %not85, !dbg !2195
    #dbg_value(!DIArgList(i64 %48, i64 %and86), !2082, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor87 = xor i64 %48, %and86, !dbg !2196
    #dbg_value(i64 %xor87, !2082, !DIExpression(), !2012)
  %xor110 = xor i64 %Asi.0, %xor53, !dbg !2197
    #dbg_value(i64 %xor110, !2058, !DIExpression(), !2012)
  %93 = shl i64 %xor110, 61, !dbg !2198
  %94 = lshr i64 %xor110, 3, !dbg !2198
  %95 = or i64 %93, %94, !dbg !2198
    #dbg_value(i64 %95, !2074, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 %95, i64 %65, i64 %59), !2089, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor106 = xor i64 %Ame.0, %xor49, !dbg !2199
    #dbg_value(i64 %xor106, !2046, !DIExpression(), !2012)
  %96 = shl i64 %xor106, 45, !dbg !2200
  %97 = lshr i64 %xor106, 19, !dbg !2200
  %98 = or i64 %96, %97, !dbg !2200
    #dbg_value(i64 %98, !2073, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 %62, i64 %95, i64 %98), !2087, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %98, i64 %59, i64 %95), !2088, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %65, i64 %98, i64 %62), !2086, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %not120 = xor i64 %98, -1, !dbg !2201
    #dbg_value(!DIArgList(i64 %62, i64 %95, i64 %not120), !2087, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %and121 = and i64 %95, %not120, !dbg !2202
    #dbg_value(!DIArgList(i64 %62, i64 %and121), !2087, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor122 = xor i64 %62, %and121, !dbg !2203
    #dbg_value(i64 %xor122, !2087, !DIExpression(), !2012)
  %xor242 = xor i64 %xor87, %xor122, !dbg !2204
  %xor145 = xor i64 %Asa.0, %xor45, !dbg !2205
    #dbg_value(i64 %xor145, !2054, !DIExpression(), !2012)
  %99 = shl i64 %xor145, 18, !dbg !2206
  %100 = lshr i64 %xor145, 46, !dbg !2206
  %101 = or i64 %99, %100, !dbg !2206
    #dbg_value(i64 %101, !2074, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 %101, i64 %74, i64 %68), !2094, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor141 = xor i64 %Amu.0, %xor61, !dbg !2207
    #dbg_value(i64 %xor141, !2052, !DIExpression(), !2012)
  %102 = shl i64 %xor141, 8, !dbg !2208
  %103 = lshr i64 %xor141, 56, !dbg !2208
  %104 = or i64 %102, %103, !dbg !2208
    #dbg_value(i64 %104, !2073, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 %71, i64 %101, i64 %104), !2092, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %74, i64 %104, i64 %71), !2091, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %104, i64 %68, i64 %101), !2093, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %not155 = xor i64 %104, -1, !dbg !2209
    #dbg_value(!DIArgList(i64 %71, i64 %101, i64 %not155), !2092, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %and156 = and i64 %101, %not155, !dbg !2210
    #dbg_value(!DIArgList(i64 %71, i64 %and156), !2092, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor157 = xor i64 %71, %and156, !dbg !2211
    #dbg_value(i64 %xor157, !2092, !DIExpression(), !2012)
  %xor243 = xor i64 %xor242, %xor157, !dbg !2212
  %xor180 = xor i64 %Aso.0, %xor57, !dbg !2213
    #dbg_value(i64 %xor180, !2060, !DIExpression(), !2012)
  %105 = shl i64 %xor180, 56, !dbg !2214
  %106 = lshr i64 %xor180, 8, !dbg !2214
  %107 = or i64 %105, %106, !dbg !2214
    #dbg_value(i64 %107, !2074, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 %107, i64 %83, i64 %77), !2099, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor176 = xor i64 %Ami.0, %xor53, !dbg !2215
    #dbg_value(i64 %xor176, !2048, !DIExpression(), !2012)
  %108 = shl i64 %xor176, 15, !dbg !2216
  %109 = lshr i64 %xor176, 49, !dbg !2216
  %110 = or i64 %108, %109, !dbg !2216
    #dbg_value(i64 %110, !2073, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 %80, i64 %107, i64 %110), !2097, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %83, i64 %110, i64 %80), !2096, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %110, i64 %77, i64 %107), !2098, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %54, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71, i64 %65, i64 %98, i64 %62, i64 %92, i64 %48), !2071, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %not190 = xor i64 %110, -1, !dbg !2217
    #dbg_value(!DIArgList(i64 %80, i64 %107, i64 %not190), !2097, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %and191 = and i64 %107, %not190, !dbg !2218
    #dbg_value(!DIArgList(i64 %80, i64 %and191), !2097, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor192 = xor i64 %80, %and191, !dbg !2219
    #dbg_value(i64 %xor192, !2097, !DIExpression(), !2012)
  %xor244 = xor i64 %xor243, %xor192, !dbg !2220
  %xor215 = xor i64 %Ase.0, %xor49, !dbg !2221
    #dbg_value(i64 %xor215, !2056, !DIExpression(), !2012)
  %111 = shl i64 %xor215, 2, !dbg !2222
  %112 = lshr i64 %xor215, 62, !dbg !2222
  %113 = or i64 %111, %112, !dbg !2222
    #dbg_value(!DIArgList(i64 %42, i64 %113, i64 %36), !2102, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %113, i64 %30, i64 %86), !2104, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %36, i64 %86, i64 %113), !2103, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor244, i64 %42, i64 %113, i64 %36), !2072, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %92, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101, i64 %98, i64 %xor62, i64 %89, i64 %59, i64 %95), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %89, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68, i64 %95, i64 %65, i64 %59, i64 %54, i64 %xor62), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
  %not225 = xor i64 %36, -1, !dbg !2223
    #dbg_value(!DIArgList(i64 %42, i64 %113, i64 %not225), !2102, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor244, i64 %42, i64 %113, i64 %not225), !2072, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
  %and226 = and i64 %113, %not225, !dbg !2224
    #dbg_value(!DIArgList(i64 %42, i64 %and226), !2102, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor244, i64 %42, i64 %and226), !2072, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor227 = xor i64 %42, %and226, !dbg !2225
    #dbg_value(i64 %xor227, !2102, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor227), !2072, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor245 = xor i64 %xor244, %xor227, !dbg !2226
    #dbg_value(i64 %xor245, !2072, !DIExpression(), !2012)
  %114 = shl i64 %xor245, 1, !dbg !2227
  %115 = lshr i64 %xor245, 63, !dbg !2227
  %116 = or i64 %114, %115, !dbg !2227
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor237, i64 %116), !2101, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %54, i64 %xor237, i64 %92, i64 %48, i64 %116), !2081, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %65, i64 %xor237, i64 %98, i64 %62, i64 %116), !2086, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %74, i64 %xor237, i64 %104, i64 %71, i64 %116), !2091, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %83, i64 %xor237, i64 %110, i64 %80, i64 %116), !2096, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor237, i64 %116), !2076, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor261 = xor i64 %xor237, %116, !dbg !2228
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor261), !2101, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %54, i64 %xor261, i64 %92, i64 %48), !2081, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %65, i64 %xor261, i64 %98, i64 %62), !2086, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %74, i64 %xor261, i64 %104, i64 %71), !2091, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %83, i64 %xor261, i64 %110, i64 %80), !2096, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 %xor261, !2076, !DIExpression(), !2012)
  %xor429 = xor i64 %xor224, %xor261, !dbg !2229
    #dbg_value(i64 %xor429, !2101, !DIExpression(), !2012)
  %117 = shl i64 %xor429, 2, !dbg !2230
  %118 = lshr i64 %xor429, 62, !dbg !2230
  %119 = or i64 %117, %118, !dbg !2230
    #dbg_value(i64 %119, !2074, !DIExpression(), !2012)
  %not123 = xor i64 %95, -1, !dbg !2231
    #dbg_value(!DIArgList(i64 %98, i64 %59, i64 %not123), !2088, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %92, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101, i64 %98, i64 %xor62, i64 %89, i64 %59, i64 %not123), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
  %and124 = and i64 %59, %not123, !dbg !2232
    #dbg_value(!DIArgList(i64 %98, i64 %and124), !2088, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %92, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101, i64 %98, i64 %xor62, i64 %89, i64 %and124), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor125 = xor i64 %98, %and124, !dbg !2233
    #dbg_value(i64 %xor125, !2088, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 %92, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101, i64 %xor125, i64 %xor62, i64 %89), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
  %not91 = xor i64 %xor62, -1, !dbg !2234
    #dbg_value(!DIArgList(i64 %89, i64 %54, i64 %not91), !2084, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %89, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68, i64 %95, i64 %65, i64 %59, i64 %54, i64 %not91), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
  %and92 = and i64 %54, %not91, !dbg !2235
    #dbg_value(!DIArgList(i64 %89, i64 %and92), !2084, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %89, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68, i64 %95, i64 %65, i64 %59, i64 %and92), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor93 = xor i64 %89, %and92, !dbg !2236
    #dbg_value(i64 %xor93, !2084, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 %xor93, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68, i64 %95, i64 %65, i64 %59), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
  %not126 = xor i64 %59, -1, !dbg !2237
    #dbg_value(!DIArgList(i64 %95, i64 %65, i64 %not126), !2089, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor93, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68, i64 %95, i64 %65, i64 %not126), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
  %and127 = and i64 %65, %not126, !dbg !2238
    #dbg_value(!DIArgList(i64 %95, i64 %and127), !2089, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor93, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68, i64 %95, i64 %and127), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor128 = xor i64 %95, %and127, !dbg !2239
    #dbg_value(i64 %xor128, !2089, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 %xor93, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68, i64 %xor128), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor250 = xor i64 %xor93, %xor128, !dbg !2240
    #dbg_value(!DIArgList(i64 %xor250, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
  %not161 = xor i64 %68, -1, !dbg !2241
    #dbg_value(!DIArgList(i64 %101, i64 %74, i64 %not161), !2094, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor250, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %not161), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
  %and162 = and i64 %74, %not161, !dbg !2242
    #dbg_value(!DIArgList(i64 %101, i64 %and162), !2094, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor250, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %and162), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor163 = xor i64 %101, %and162, !dbg !2243
    #dbg_value(i64 %xor163, !2094, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 %xor250, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %xor163), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor251 = xor i64 %xor250, %xor163, !dbg !2244
    #dbg_value(!DIArgList(i64 %xor251, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
  %not196 = xor i64 %77, -1, !dbg !2245
    #dbg_value(!DIArgList(i64 %107, i64 %83, i64 %not196), !2099, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor251, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %not196), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
  %and197 = and i64 %83, %not196, !dbg !2246
    #dbg_value(!DIArgList(i64 %107, i64 %and197), !2099, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor251, i64 %113, i64 %30, i64 %86, i64 %107, i64 %and197), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor198 = xor i64 %107, %and197, !dbg !2247
    #dbg_value(i64 %xor198, !2099, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 %xor251, i64 %113, i64 %30, i64 %86, i64 %xor198), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor252 = xor i64 %xor251, %xor198, !dbg !2248
    #dbg_value(!DIArgList(i64 %xor252, i64 %113, i64 %30, i64 %86), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
  %not231 = xor i64 %86, -1, !dbg !2249
    #dbg_value(!DIArgList(i64 %113, i64 %30, i64 %not231), !2104, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor252, i64 %113, i64 %30, i64 %not231), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
  %and232 = and i64 %30, %not231, !dbg !2250
    #dbg_value(!DIArgList(i64 %113, i64 %and232), !2104, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor252, i64 %113, i64 %and232), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor233 = xor i64 %113, %and232, !dbg !2251
    #dbg_value(i64 %xor233, !2104, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor233), !2074, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor253 = xor i64 %xor252, %xor233, !dbg !2252
    #dbg_value(i64 %xor253, !2074, !DIExpression(), !2012)
  %120 = shl i64 %xor253, 1, !dbg !2253
  %121 = lshr i64 %xor253, 63, !dbg !2253
  %122 = or i64 %120, %121, !dbg !2253
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor245, i64 %122), !2088, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %92, i64 %xor245, i64 %xor62, i64 %89, i64 %122), !2083, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %104, i64 %xor245, i64 %68, i64 %101, i64 %122), !2093, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %110, i64 %xor245, i64 %77, i64 %107, i64 %122), !2098, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %36, i64 %xor245, i64 %86, i64 %113, i64 %122), !2103, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor245, i64 %122), !2078, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor269 = xor i64 %xor245, %122, !dbg !2254
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor269), !2088, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %92, i64 %xor269, i64 %xor62, i64 %89), !2083, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %104, i64 %xor269, i64 %68, i64 %101), !2093, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %110, i64 %xor269, i64 %77, i64 %107), !2098, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %36, i64 %xor269, i64 %86, i64 %113), !2103, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 %xor269, !2078, !DIExpression(), !2012)
  %xor417 = xor i64 %xor125, %xor269, !dbg !2255
    #dbg_value(i64 %xor417, !2088, !DIExpression(), !2012)
  %123 = shl i64 %xor417, 55, !dbg !2256
  %124 = lshr i64 %xor417, 9, !dbg !2256
  %125 = or i64 %123, %124, !dbg !2256
    #dbg_value(i64 %125, !2071, !DIExpression(), !2012)
  %not82 = xor i64 %48, -1, !dbg !2257
    #dbg_value(!DIArgList(i64 %54, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71, i64 %65, i64 %98, i64 %62, i64 %92, i64 %not82), !2071, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %54, i64 %xor261, i64 %92, i64 %not82), !2081, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %and83 = and i64 %92, %not82, !dbg !2258
    #dbg_value(!DIArgList(i64 %54, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71, i64 %65, i64 %98, i64 %62, i64 %and83), !2071, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %54, i64 %xor261, i64 %and83), !2081, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor84 = xor i64 %54, %and83, !dbg !2259
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71, i64 %65, i64 %98, i64 %62), !2071, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor261), !2081, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %not117 = xor i64 %62, -1, !dbg !2260
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71, i64 %65, i64 %98, i64 %not117), !2071, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %65, i64 %xor261, i64 %98, i64 %not117), !2086, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %and118 = and i64 %98, %not117, !dbg !2261
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71, i64 %65, i64 %and118), !2071, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %65, i64 %xor261, i64 %and118), !2086, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor119 = xor i64 %65, %and118, !dbg !2262
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71, i64 %xor119), !2071, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor119, i64 %xor261), !2086, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor238 = xor i64 %xor84, %xor119, !dbg !2263
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71), !2071, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %not152 = xor i64 %71, -1, !dbg !2264
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %not152), !2071, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %74, i64 %xor261, i64 %104, i64 %not152), !2091, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %and153 = and i64 %104, %not152, !dbg !2265
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %and153), !2071, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %74, i64 %xor261, i64 %and153), !2091, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor154 = xor i64 %74, %and153, !dbg !2266
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %xor154), !2071, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor154, i64 %xor261), !2091, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor239 = xor i64 %xor238, %xor154, !dbg !2267
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %83, i64 %110, i64 %80), !2071, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %not187 = xor i64 %80, -1, !dbg !2268
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %83, i64 %110, i64 %not187), !2071, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %83, i64 %xor261, i64 %110, i64 %not187), !2096, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %and188 = and i64 %110, %not187, !dbg !2269
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %83, i64 %and188), !2071, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %83, i64 %xor261, i64 %and188), !2096, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor189 = xor i64 %83, %and188, !dbg !2270
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor189), !2071, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor189, i64 %xor261), !2096, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor240 = xor i64 %xor239, %xor189, !dbg !2271
    #dbg_value(!DIArgList(i64 %xor240, i64 %xor224), !2071, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor241 = xor i64 %xor240, %xor224, !dbg !2272
    #dbg_value(i64 %xor241, !2071, !DIExpression(), !2012)
  %not88 = xor i64 %89, -1, !dbg !2273
    #dbg_value(!DIArgList(i64 %92, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101, i64 %xor125, i64 %xor62, i64 %not88), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %92, i64 %xor269, i64 %xor62, i64 %not88), !2083, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %and89 = and i64 %xor62, %not88, !dbg !2274
    #dbg_value(!DIArgList(i64 %92, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101, i64 %xor125, i64 %and89), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %92, i64 %xor269, i64 %and89), !2083, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor90 = xor i64 %92, %and89, !dbg !2275
    #dbg_value(!DIArgList(i64 %xor90, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101, i64 %xor125), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor90, i64 %xor269), !2083, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor246 = xor i64 %xor90, %xor125, !dbg !2276
    #dbg_value(!DIArgList(i64 %xor246, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
  %not158 = xor i64 %101, -1, !dbg !2277
    #dbg_value(!DIArgList(i64 %xor246, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %not158), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %104, i64 %xor269, i64 %68, i64 %not158), !2093, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %and159 = and i64 %68, %not158, !dbg !2278
    #dbg_value(!DIArgList(i64 %xor246, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %and159), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %104, i64 %xor269, i64 %and159), !2093, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor160 = xor i64 %104, %and159, !dbg !2279
    #dbg_value(!DIArgList(i64 %xor246, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %xor160), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor160, i64 %xor269), !2093, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor247 = xor i64 %xor246, %xor160, !dbg !2280
    #dbg_value(!DIArgList(i64 %xor247, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
  %not193 = xor i64 %107, -1, !dbg !2281
    #dbg_value(!DIArgList(i64 %xor247, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %not193), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %110, i64 %xor269, i64 %77, i64 %not193), !2098, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %and194 = and i64 %77, %not193, !dbg !2282
    #dbg_value(!DIArgList(i64 %xor247, i64 %36, i64 %86, i64 %113, i64 %110, i64 %and194), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %110, i64 %xor269, i64 %and194), !2098, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor195 = xor i64 %110, %and194, !dbg !2283
    #dbg_value(!DIArgList(i64 %xor247, i64 %36, i64 %86, i64 %113, i64 %xor195), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor195, i64 %xor269), !2098, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor248 = xor i64 %xor247, %xor195, !dbg !2284
    #dbg_value(!DIArgList(i64 %xor248, i64 %36, i64 %86, i64 %113), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
  %not228 = xor i64 %113, -1, !dbg !2285
    #dbg_value(!DIArgList(i64 %xor248, i64 %36, i64 %86, i64 %not228), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %36, i64 %xor269, i64 %86, i64 %not228), !2103, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %and229 = and i64 %86, %not228, !dbg !2286
    #dbg_value(!DIArgList(i64 %xor248, i64 %36, i64 %and229), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %36, i64 %xor269, i64 %and229), !2103, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor230 = xor i64 %36, %and229, !dbg !2287
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor230), !2073, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor230, i64 %xor269), !2103, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor249 = xor i64 %xor248, %xor230, !dbg !2288
    #dbg_value(i64 %xor249, !2073, !DIExpression(), !2012)
  %126 = shl i64 %xor249, 1, !dbg !2289
  %127 = lshr i64 %xor249, 63, !dbg !2289
  %128 = or i64 %126, %127, !dbg !2289
    #dbg_value(!DIArgList(i64 %xor241, i64 %128), !2077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor241, i64 %128), !2082, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor241, i64 %128), !2097, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor241, i64 %128), !2087, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor241, i64 %128), !2102, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor241, i64 %128), !2092, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor265 = xor i64 %xor241, %128, !dbg !2290
    #dbg_value(i64 %xor265, !2077, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor265), !2082, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor265), !2097, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor265), !2087, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor265), !2102, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor265), !2092, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor413 = xor i64 %xor87, %xor265, !dbg !2291
    #dbg_value(i64 %xor413, !2082, !DIExpression(), !2012)
  %129 = shl i64 %xor413, 62, !dbg !2292
  %130 = lshr i64 %xor413, 2, !dbg !2292
  %131 = or i64 %129, %130, !dbg !2292
    #dbg_value(i64 %131, !2070, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 %119, i64 %125, i64 %131), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %not445 = xor i64 %131, -1, !dbg !2293
    #dbg_value(!DIArgList(i64 %119, i64 %125, i64 %not445), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %and446 = and i64 %125, %not445, !dbg !2294
    #dbg_value(!DIArgList(i64 %119, i64 %and446), !2062, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor447 = xor i64 %119, %and446, !dbg !2295
    #dbg_value(i64 %xor447, !2062, !DIExpression(), !2012)
  %132 = shl i64 %xor241, 1, !dbg !2296
  %133 = lshr i64 %xor241, 63, !dbg !2296
  %134 = or i64 %132, %133, !dbg !2296
    #dbg_value(!DIArgList(i64 %xor253, i64 %134), !2075, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor253, i64 %134), !2085, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor253, i64 %134), !2100, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor253, i64 %134), !2090, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %134), !2080, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %134), !2070, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor253, i64 %134), !2095, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor257 = xor i64 %xor253, %134, !dbg !2297
    #dbg_value(i64 %xor257, !2075, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor257), !2085, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor257), !2100, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor257), !2090, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !2070, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !2080, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor257), !2095, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor425 = xor i64 %xor186, %xor257, !dbg !2298
    #dbg_value(i64 %xor425, !2095, !DIExpression(), !2012)
  %135 = shl i64 %xor425, 41, !dbg !2299
  %136 = lshr i64 %xor425, 23, !dbg !2299
  %137 = or i64 %135, %136, !dbg !2299
    #dbg_value(i64 %137, !2073, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 %137, i64 %131, i64 %119), !2060, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %not442 = xor i64 %119, -1, !dbg !2300
    #dbg_value(!DIArgList(i64 %137, i64 %131, i64 %not442), !2060, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %and443 = and i64 %131, %not442, !dbg !2301
    #dbg_value(!DIArgList(i64 %137, i64 %and443), !2060, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor444 = xor i64 %137, %and443, !dbg !2302
    #dbg_value(i64 %xor444, !2060, !DIExpression(), !2012)
  %138 = shl i64 %xor237, 1, !dbg !2303
  %139 = lshr i64 %xor237, 63, !dbg !2303
  %140 = or i64 %138, %139, !dbg !2303
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor249, i64 %140), !2084, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor249, i64 %140), !2099, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor249, i64 %140), !2089, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor249, i64 %140), !2104, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor249, i64 %140), !2079, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor249, i64 %140), !2094, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor273 = xor i64 %xor249, %140, !dbg !2304
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor273), !2084, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor273), !2099, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor273), !2089, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor273), !2104, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(i64 %xor273, !2079, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor273), !2094, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor421 = xor i64 %xor163, %xor273, !dbg !2305
    #dbg_value(i64 %xor421, !2094, !DIExpression(), !2012)
  %141 = shl i64 %xor421, 39, !dbg !2306
  %142 = lshr i64 %xor421, 25, !dbg !2306
  %143 = or i64 %141, %142, !dbg !2306
    #dbg_value(i64 %143, !2072, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 %143, i64 %119, i64 %137), !2058, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %125, i64 %137, i64 %143), !2056, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %131, i64 %143, i64 %125), !2054, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %not439 = xor i64 %137, -1, !dbg !2307
    #dbg_value(!DIArgList(i64 %143, i64 %119, i64 %not439), !2058, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %and440 = and i64 %119, %not439, !dbg !2308
    #dbg_value(!DIArgList(i64 %143, i64 %and440), !2058, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor441 = xor i64 %143, %and440, !dbg !2309
    #dbg_value(i64 %xor441, !2058, !DIExpression(), !2012)
  %not436 = xor i64 %143, -1, !dbg !2310
    #dbg_value(!DIArgList(i64 %125, i64 %137, i64 %not436), !2056, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %and437 = and i64 %137, %not436, !dbg !2311
    #dbg_value(!DIArgList(i64 %125, i64 %and437), !2056, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor438 = xor i64 %125, %and437, !dbg !2312
    #dbg_value(i64 %xor438, !2056, !DIExpression(), !2012)
  %not433 = xor i64 %125, -1, !dbg !2313
    #dbg_value(!DIArgList(i64 %131, i64 %143, i64 %not433), !2054, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %and434 = and i64 %143, %not433, !dbg !2314
    #dbg_value(!DIArgList(i64 %131, i64 %and434), !2054, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor435 = xor i64 %131, %and434, !dbg !2315
    #dbg_value(i64 %xor435, !2054, !DIExpression(), !2012)
  %xor394 = xor i64 %xor230, %xor269, !dbg !2316
    #dbg_value(i64 %xor394, !2103, !DIExpression(), !2012)
  %144 = shl i64 %xor394, 56, !dbg !2317
  %145 = lshr i64 %xor394, 8, !dbg !2317
  %146 = or i64 %144, %145, !dbg !2317
    #dbg_value(i64 %146, !2074, !DIExpression(), !2012)
  %xor382 = xor i64 %xor116, %xor257, !dbg !2318
    #dbg_value(i64 %xor382, !2085, !DIExpression(), !2012)
  %147 = shl i64 %xor382, 36, !dbg !2319
  %148 = lshr i64 %xor382, 28, !dbg !2319
  %149 = or i64 %147, %148, !dbg !2319
    #dbg_value(i64 %149, !2071, !DIExpression(), !2012)
  %xor378 = xor i64 %xor93, %xor273, !dbg !2320
    #dbg_value(i64 %xor378, !2084, !DIExpression(), !2012)
  %150 = shl i64 %xor378, 27, !dbg !2321
  %151 = lshr i64 %xor378, 37, !dbg !2321
  %152 = or i64 %150, %151, !dbg !2321
    #dbg_value(i64 %152, !2070, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 %146, i64 %149, i64 %152), !2052, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %not410 = xor i64 %152, -1, !dbg !2322
    #dbg_value(!DIArgList(i64 %146, i64 %149, i64 %not410), !2052, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %and411 = and i64 %149, %not410, !dbg !2323
    #dbg_value(!DIArgList(i64 %146, i64 %and411), !2052, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor412 = xor i64 %146, %and411, !dbg !2324
    #dbg_value(i64 %xor412, !2052, !DIExpression(), !2012)
  %xor390 = xor i64 %xor192, %xor265, !dbg !2325
    #dbg_value(i64 %xor390, !2097, !DIExpression(), !2012)
  %153 = shl i64 %xor390, 15, !dbg !2326
  %154 = lshr i64 %xor390, 49, !dbg !2326
  %155 = or i64 %153, %154, !dbg !2326
    #dbg_value(i64 %155, !2073, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 %155, i64 %152, i64 %146), !2050, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %not407 = xor i64 %146, -1, !dbg !2327
    #dbg_value(!DIArgList(i64 %155, i64 %152, i64 %not407), !2050, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %and408 = and i64 %152, %not407, !dbg !2328
    #dbg_value(!DIArgList(i64 %155, i64 %and408), !2050, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor409 = xor i64 %155, %and408, !dbg !2329
    #dbg_value(i64 %xor409, !2050, !DIExpression(), !2012)
  %xor386 = xor i64 %xor154, %xor261, !dbg !2330
    #dbg_value(i64 %xor386, !2091, !DIExpression(), !2012)
  %156 = shl i64 %xor386, 10, !dbg !2331
  %157 = lshr i64 %xor386, 54, !dbg !2331
  %158 = or i64 %156, %157, !dbg !2331
    #dbg_value(i64 %158, !2072, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 %158, i64 %146, i64 %155), !2048, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %149, i64 %155, i64 %158), !2046, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %152, i64 %158, i64 %149), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %not404 = xor i64 %155, -1, !dbg !2332
    #dbg_value(!DIArgList(i64 %158, i64 %146, i64 %not404), !2048, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %and405 = and i64 %146, %not404, !dbg !2333
    #dbg_value(!DIArgList(i64 %158, i64 %and405), !2048, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor406 = xor i64 %158, %and405, !dbg !2334
    #dbg_value(i64 %xor406, !2048, !DIExpression(), !2012)
  %not401 = xor i64 %158, -1, !dbg !2335
    #dbg_value(!DIArgList(i64 %149, i64 %155, i64 %not401), !2046, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %and402 = and i64 %155, %not401, !dbg !2336
    #dbg_value(!DIArgList(i64 %149, i64 %and402), !2046, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor403 = xor i64 %149, %and402, !dbg !2337
    #dbg_value(i64 %xor403, !2046, !DIExpression(), !2012)
  %not398 = xor i64 %149, -1, !dbg !2338
    #dbg_value(!DIArgList(i64 %152, i64 %158, i64 %not398), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %and399 = and i64 %158, %not398, !dbg !2339
    #dbg_value(!DIArgList(i64 %152, i64 %and399), !2044, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor400 = xor i64 %152, %and399, !dbg !2340
    #dbg_value(i64 %xor400, !2044, !DIExpression(), !2012)
  %xor359 = xor i64 %xor221, %xor257, !dbg !2341
    #dbg_value(i64 %xor359, !2100, !DIExpression(), !2012)
  %159 = shl i64 %xor359, 18, !dbg !2342
  %160 = lshr i64 %xor359, 46, !dbg !2342
  %161 = or i64 %159, %160, !dbg !2342
    #dbg_value(i64 %161, !2074, !DIExpression(), !2012)
  %xor347 = xor i64 %xor122, %xor265, !dbg !2343
    #dbg_value(i64 %xor347, !2087, !DIExpression(), !2012)
  %162 = shl i64 %xor347, 6, !dbg !2344
  %163 = lshr i64 %xor347, 58, !dbg !2344
  %164 = or i64 %162, %163, !dbg !2344
    #dbg_value(i64 %164, !2071, !DIExpression(), !2012)
  %xor343 = xor i64 %xor84, %xor261, !dbg !2345
    #dbg_value(i64 %xor343, !2081, !DIExpression(), !2012)
  %165 = shl i64 %xor343, 1, !dbg !2346
  %166 = lshr i64 %xor343, 63, !dbg !2346
  %167 = or i64 %165, %166, !dbg !2346
    #dbg_value(i64 %167, !2070, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 %161, i64 %164, i64 %167), !2042, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %not375 = xor i64 %167, -1, !dbg !2347
    #dbg_value(!DIArgList(i64 %161, i64 %164, i64 %not375), !2042, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %and376 = and i64 %164, %not375, !dbg !2348
    #dbg_value(!DIArgList(i64 %161, i64 %and376), !2042, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor377 = xor i64 %161, %and376, !dbg !2349
    #dbg_value(i64 %xor377, !2042, !DIExpression(), !2012)
  %xor355 = xor i64 %xor198, %xor273, !dbg !2350
    #dbg_value(i64 %xor355, !2099, !DIExpression(), !2012)
  %168 = shl i64 %xor355, 8, !dbg !2351
  %169 = lshr i64 %xor355, 56, !dbg !2351
  %170 = or i64 %168, %169, !dbg !2351
    #dbg_value(i64 %170, !2073, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 %170, i64 %167, i64 %161), !2040, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %not372 = xor i64 %161, -1, !dbg !2352
    #dbg_value(!DIArgList(i64 %170, i64 %167, i64 %not372), !2040, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %and373 = and i64 %167, %not372, !dbg !2353
    #dbg_value(!DIArgList(i64 %170, i64 %and373), !2040, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor374 = xor i64 %170, %and373, !dbg !2354
    #dbg_value(i64 %xor374, !2040, !DIExpression(), !2012)
  %xor351 = xor i64 %xor160, %xor269, !dbg !2355
    #dbg_value(i64 %xor351, !2093, !DIExpression(), !2012)
  %171 = shl i64 %xor351, 25, !dbg !2356
  %172 = lshr i64 %xor351, 39, !dbg !2356
  %173 = or i64 %171, %172, !dbg !2356
    #dbg_value(i64 %173, !2072, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 %173, i64 %161, i64 %170), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %164, i64 %170, i64 %173), !2036, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %167, i64 %173, i64 %164), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %not369 = xor i64 %170, -1, !dbg !2357
    #dbg_value(!DIArgList(i64 %173, i64 %161, i64 %not369), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %and370 = and i64 %161, %not369, !dbg !2358
    #dbg_value(!DIArgList(i64 %173, i64 %and370), !2038, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor371 = xor i64 %173, %and370, !dbg !2359
    #dbg_value(i64 %xor371, !2038, !DIExpression(), !2012)
  %not366 = xor i64 %173, -1, !dbg !2360
    #dbg_value(!DIArgList(i64 %164, i64 %170, i64 %not366), !2036, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %and367 = and i64 %170, %not366, !dbg !2361
    #dbg_value(!DIArgList(i64 %164, i64 %and367), !2036, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor368 = xor i64 %164, %and367, !dbg !2362
    #dbg_value(i64 %xor368, !2036, !DIExpression(), !2012)
  %not363 = xor i64 %164, -1, !dbg !2363
    #dbg_value(!DIArgList(i64 %167, i64 %173, i64 %not363), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %and364 = and i64 %173, %not363, !dbg !2364
    #dbg_value(!DIArgList(i64 %167, i64 %and364), !2034, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor365 = xor i64 %167, %and364, !dbg !2365
    #dbg_value(i64 %xor365, !2034, !DIExpression(), !2012)
  %xor324 = xor i64 %xor227, %xor265, !dbg !2366
    #dbg_value(i64 %xor324, !2102, !DIExpression(), !2012)
  %174 = shl i64 %xor324, 61, !dbg !2367
  %175 = lshr i64 %xor324, 3, !dbg !2367
  %176 = or i64 %174, %175, !dbg !2367
    #dbg_value(i64 %176, !2074, !DIExpression(), !2012)
  %xor312 = xor i64 %xor128, %xor273, !dbg !2368
    #dbg_value(i64 %xor312, !2089, !DIExpression(), !2012)
  %177 = shl i64 %xor312, 20, !dbg !2369
  %178 = lshr i64 %xor312, 44, !dbg !2369
  %179 = or i64 %177, %178, !dbg !2369
    #dbg_value(i64 %179, !2071, !DIExpression(), !2012)
  %xor308 = xor i64 %xor90, %xor269, !dbg !2370
    #dbg_value(i64 %xor308, !2083, !DIExpression(), !2012)
  %180 = shl i64 %xor308, 28, !dbg !2371
  %181 = lshr i64 %xor308, 36, !dbg !2371
  %182 = or i64 %180, %181, !dbg !2371
    #dbg_value(i64 %182, !2070, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 %176, i64 %179, i64 %182), !2032, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %not340 = xor i64 %182, -1, !dbg !2372
    #dbg_value(!DIArgList(i64 %176, i64 %179, i64 %not340), !2032, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %and341 = and i64 %179, %not340, !dbg !2373
    #dbg_value(!DIArgList(i64 %176, i64 %and341), !2032, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor342 = xor i64 %176, %and341, !dbg !2374
    #dbg_value(i64 %xor342, !2032, !DIExpression(), !2012)
  %xor320 = xor i64 %xor189, %xor261, !dbg !2375
    #dbg_value(i64 %xor320, !2096, !DIExpression(), !2012)
  %183 = shl i64 %xor320, 45, !dbg !2376
  %184 = lshr i64 %xor320, 19, !dbg !2376
  %185 = or i64 %183, %184, !dbg !2376
    #dbg_value(i64 %185, !2073, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 %185, i64 %182, i64 %176), !2030, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %not337 = xor i64 %176, -1, !dbg !2377
    #dbg_value(!DIArgList(i64 %185, i64 %182, i64 %not337), !2030, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %and338 = and i64 %182, %not337, !dbg !2378
    #dbg_value(!DIArgList(i64 %185, i64 %and338), !2030, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor339 = xor i64 %185, %and338, !dbg !2379
    #dbg_value(i64 %xor339, !2030, !DIExpression(), !2012)
  %xor316 = xor i64 %xor151, %xor257, !dbg !2380
    #dbg_value(i64 %xor316, !2090, !DIExpression(), !2012)
  %186 = shl i64 %xor316, 3, !dbg !2381
  %187 = lshr i64 %xor316, 61, !dbg !2381
  %188 = or i64 %186, %187, !dbg !2381
    #dbg_value(i64 %188, !2072, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 %188, i64 %176, i64 %185), !2028, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %179, i64 %185, i64 %188), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %182, i64 %188, i64 %179), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %not334 = xor i64 %185, -1, !dbg !2382
    #dbg_value(!DIArgList(i64 %188, i64 %176, i64 %not334), !2028, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %and335 = and i64 %176, %not334, !dbg !2383
    #dbg_value(!DIArgList(i64 %188, i64 %and335), !2028, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor336 = xor i64 %188, %and335, !dbg !2384
    #dbg_value(i64 %xor336, !2028, !DIExpression(), !2012)
  %not331 = xor i64 %188, -1, !dbg !2385
    #dbg_value(!DIArgList(i64 %179, i64 %185, i64 %not331), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %and332 = and i64 %185, %not331, !dbg !2386
    #dbg_value(!DIArgList(i64 %179, i64 %and332), !2026, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor333 = xor i64 %179, %and332, !dbg !2387
    #dbg_value(i64 %xor333, !2026, !DIExpression(), !2012)
  %not328 = xor i64 %179, -1, !dbg !2388
    #dbg_value(!DIArgList(i64 %182, i64 %188, i64 %not328), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %and329 = and i64 %188, %not328, !dbg !2389
    #dbg_value(!DIArgList(i64 %182, i64 %and329), !2024, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor330 = xor i64 %182, %and329, !dbg !2390
    #dbg_value(i64 %xor330, !2024, !DIExpression(), !2012)
  %xor287 = xor i64 %xor233, %xor273, !dbg !2391
    #dbg_value(i64 %xor287, !2104, !DIExpression(), !2012)
  %189 = shl i64 %xor287, 14, !dbg !2392
  %190 = lshr i64 %xor287, 50, !dbg !2392
  %191 = or i64 %189, %190, !dbg !2392
    #dbg_value(i64 %191, !2074, !DIExpression(), !2012)
  %xor275 = xor i64 %xor119, %xor261, !dbg !2393
    #dbg_value(i64 %xor275, !2086, !DIExpression(), !2012)
  %192 = shl i64 %xor275, 44, !dbg !2394
  %193 = lshr i64 %xor275, 20, !dbg !2394
  %194 = or i64 %192, %193, !dbg !2394
    #dbg_value(i64 %194, !2071, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 %191, i64 %194, i64 %xor81, i64 %xor257), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor274 = xor i64 %xor81, %xor257, !dbg !2395
    #dbg_value(i64 %xor274, !2080, !DIExpression(), !2012)
    #dbg_value(i64 %xor274, !2070, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 %191, i64 %194, i64 %xor274), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %not305 = xor i64 %xor274, -1, !dbg !2396
    #dbg_value(!DIArgList(i64 %191, i64 %194, i64 %not305), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %and306 = and i64 %194, %not305, !dbg !2397
    #dbg_value(!DIArgList(i64 %191, i64 %and306), !2022, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor307 = xor i64 %191, %and306, !dbg !2398
    #dbg_value(i64 %xor307, !2022, !DIExpression(), !2012)
  %xor283 = xor i64 %xor195, %xor269, !dbg !2399
    #dbg_value(i64 %xor283, !2098, !DIExpression(), !2012)
  %195 = shl i64 %xor283, 21, !dbg !2400
  %196 = lshr i64 %xor283, 43, !dbg !2400
  %197 = or i64 %195, %196, !dbg !2400
    #dbg_value(i64 %197, !2073, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 %197, i64 %xor274, i64 %191), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %not302 = xor i64 %191, -1, !dbg !2401
    #dbg_value(!DIArgList(i64 %197, i64 %xor274, i64 %not302), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %and303 = and i64 %xor274, %not302, !dbg !2402
    #dbg_value(!DIArgList(i64 %197, i64 %and303), !2020, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor304 = xor i64 %197, %and303, !dbg !2403
    #dbg_value(i64 %xor304, !2020, !DIExpression(), !2012)
  %xor279 = xor i64 %xor157, %xor265, !dbg !2404
    #dbg_value(i64 %xor279, !2092, !DIExpression(), !2012)
  %198 = shl i64 %xor279, 43, !dbg !2405
  %199 = lshr i64 %xor279, 21, !dbg !2405
  %200 = or i64 %198, %199, !dbg !2405
    #dbg_value(i64 %200, !2072, !DIExpression(), !2012)
    #dbg_value(!DIArgList(i64 %200, i64 %191, i64 %197), !2018, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %194, i64 %197, i64 %200), !2016, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
    #dbg_value(!DIArgList(i64 %xor274, i64 %200, i64 %194), !2014, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %not299 = xor i64 %197, -1, !dbg !2406
    #dbg_value(!DIArgList(i64 %200, i64 %191, i64 %not299), !2018, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %and300 = and i64 %191, %not299, !dbg !2407
    #dbg_value(!DIArgList(i64 %200, i64 %and300), !2018, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor301 = xor i64 %200, %and300, !dbg !2408
    #dbg_value(i64 %xor301, !2018, !DIExpression(), !2012)
  %not296 = xor i64 %200, -1, !dbg !2409
    #dbg_value(!DIArgList(i64 %194, i64 %197, i64 %not296), !2016, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !2012)
  %and297 = and i64 %197, %not296, !dbg !2410
    #dbg_value(!DIArgList(i64 %194, i64 %and297), !2016, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %xor298 = xor i64 %194, %and297, !dbg !2411
    #dbg_value(i64 %xor298, !2016, !DIExpression(), !2012)
  %add = or disjoint i32 %round.0, 1, !dbg !2412
  %arrayidx294 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %add, !dbg !2413
  %201 = load i64, ptr %arrayidx294, align 8, !dbg !2413
    #dbg_value(!DIArgList(i64 %xor274, i64 %201, i64 %200, i64 %194), !2014, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %not291 = xor i64 %194, -1, !dbg !2414
    #dbg_value(!DIArgList(i64 %xor274, i64 %201, i64 %200, i64 %not291), !2014, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %and292 = and i64 %200, %not291, !dbg !2415
    #dbg_value(!DIArgList(i64 %xor274, i64 %201, i64 %and292), !2014, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !2012)
  %202 = xor i64 %and292, %201, !dbg !2416
  %xor295 = xor i64 %202, %xor274, !dbg !2416
    #dbg_value(i64 %xor295, !2014, !DIExpression(), !2012)
  %add448 = add nuw nsw i32 %round.0, 2, !dbg !2417
    #dbg_value(i32 %add448, !2063, !DIExpression(), !2012)
  br label %for.cond, !dbg !2418, !llvm.loop !2419

for.end:                                          ; preds = %for.cond
  %Aso.0.lcssa = phi i64 [ %Aso.0, %for.cond ], !dbg !2012
  %Asi.0.lcssa = phi i64 [ %Asi.0, %for.cond ], !dbg !2012
  %Ase.0.lcssa = phi i64 [ %Ase.0, %for.cond ], !dbg !2012
  %Asa.0.lcssa = phi i64 [ %Asa.0, %for.cond ], !dbg !2012
  %Amu.0.lcssa = phi i64 [ %Amu.0, %for.cond ], !dbg !2012
  %Amo.0.lcssa = phi i64 [ %Amo.0, %for.cond ], !dbg !2012
  %Ami.0.lcssa = phi i64 [ %Ami.0, %for.cond ], !dbg !2012
  %Ame.0.lcssa = phi i64 [ %Ame.0, %for.cond ], !dbg !2012
  %Ama.0.lcssa = phi i64 [ %Ama.0, %for.cond ], !dbg !2012
  %Aku.0.lcssa = phi i64 [ %Aku.0, %for.cond ], !dbg !2012
  %Ako.0.lcssa = phi i64 [ %Ako.0, %for.cond ], !dbg !2012
  %Aki.0.lcssa = phi i64 [ %Aki.0, %for.cond ], !dbg !2012
  %Ake.0.lcssa = phi i64 [ %Ake.0, %for.cond ], !dbg !2012
  %Aka.0.lcssa = phi i64 [ %Aka.0, %for.cond ], !dbg !2012
  %Agu.0.lcssa = phi i64 [ %Agu.0, %for.cond ], !dbg !2012
  %Ago.0.lcssa = phi i64 [ %Ago.0, %for.cond ], !dbg !2012
  %Agi.0.lcssa = phi i64 [ %Agi.0, %for.cond ], !dbg !2012
  %Age.0.lcssa = phi i64 [ %Age.0, %for.cond ], !dbg !2012
  %Aga.0.lcssa = phi i64 [ %Aga.0, %for.cond ], !dbg !2012
  %Abu.0.lcssa = phi i64 [ %Abu.0, %for.cond ], !dbg !2012
  %Abo.0.lcssa = phi i64 [ %Abo.0, %for.cond ], !dbg !2012
  %Abi.0.lcssa = phi i64 [ %Abi.0, %for.cond ], !dbg !2012
  %Abe.0.lcssa = phi i64 [ %Abe.0, %for.cond ], !dbg !2012
  %Aba.0.lcssa = phi i64 [ %Aba.0, %for.cond ], !dbg !2012
  %Asu.0.lcssa = phi i64 [ %Asu.0, %for.cond ], !dbg !2012
  store i64 %Aba.0.lcssa, ptr %state, align 8, !dbg !2421
  %arrayidx450 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !2422
  store i64 %Abe.0.lcssa, ptr %arrayidx450, align 8, !dbg !2423
  %arrayidx451 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !2424
  store i64 %Abi.0.lcssa, ptr %arrayidx451, align 8, !dbg !2425
  %arrayidx452 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !2426
  store i64 %Abo.0.lcssa, ptr %arrayidx452, align 8, !dbg !2427
  %arrayidx453 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !2428
  store i64 %Abu.0.lcssa, ptr %arrayidx453, align 8, !dbg !2429
  %arrayidx454 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !2430
  store i64 %Aga.0.lcssa, ptr %arrayidx454, align 8, !dbg !2431
  %arrayidx455 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !2432
  store i64 %Age.0.lcssa, ptr %arrayidx455, align 8, !dbg !2433
  %arrayidx456 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !2434
  store i64 %Agi.0.lcssa, ptr %arrayidx456, align 8, !dbg !2435
  %arrayidx457 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !2436
  store i64 %Ago.0.lcssa, ptr %arrayidx457, align 8, !dbg !2437
  %arrayidx458 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !2438
  store i64 %Agu.0.lcssa, ptr %arrayidx458, align 8, !dbg !2439
  %arrayidx459 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !2440
  store i64 %Aka.0.lcssa, ptr %arrayidx459, align 8, !dbg !2441
  %arrayidx460 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !2442
  store i64 %Ake.0.lcssa, ptr %arrayidx460, align 8, !dbg !2443
  %arrayidx461 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !2444
  store i64 %Aki.0.lcssa, ptr %arrayidx461, align 8, !dbg !2445
  %arrayidx462 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !2446
  store i64 %Ako.0.lcssa, ptr %arrayidx462, align 8, !dbg !2447
  %arrayidx463 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !2448
  store i64 %Aku.0.lcssa, ptr %arrayidx463, align 8, !dbg !2449
  %arrayidx464 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !2450
  store i64 %Ama.0.lcssa, ptr %arrayidx464, align 8, !dbg !2451
  %arrayidx465 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !2452
  store i64 %Ame.0.lcssa, ptr %arrayidx465, align 8, !dbg !2453
  %arrayidx466 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !2454
  store i64 %Ami.0.lcssa, ptr %arrayidx466, align 8, !dbg !2455
  %arrayidx467 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !2456
  store i64 %Amo.0.lcssa, ptr %arrayidx467, align 8, !dbg !2457
  %arrayidx468 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !2458
  store i64 %Amu.0.lcssa, ptr %arrayidx468, align 8, !dbg !2459
  %arrayidx469 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !2460
  store i64 %Asa.0.lcssa, ptr %arrayidx469, align 8, !dbg !2461
  %arrayidx470 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !2462
  store i64 %Ase.0.lcssa, ptr %arrayidx470, align 8, !dbg !2463
  %arrayidx471 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !2464
  store i64 %Asi.0.lcssa, ptr %arrayidx471, align 8, !dbg !2465
  %arrayidx472 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !2466
  store i64 %Aso.0.lcssa, ptr %arrayidx472, align 8, !dbg !2467
  %arrayidx473 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !2468
  store i64 %Asu.0.lcssa, ptr %arrayidx473, align 8, !dbg !2469
  ret void, !dbg !2470
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_finalize(ptr noundef %state) local_unnamed_addr #0 !dbg !2471 {
entry:
    #dbg_value(ptr %state, !2472, !DIExpression(), !2473)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2474
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2474
  %conv = trunc i64 %0 to i32, !dbg !2474
  call fastcc void @keccak_finalize(ptr noundef %state, i32 noundef %conv, i32 noundef 168, i8 noundef zeroext 31) #3, !dbg !2475
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2476
  store i64 168, ptr %arrayidx1, align 8, !dbg !2477
  ret void, !dbg !2478
}

; Function Attrs: nounwind
define internal fastcc void @keccak_finalize(ptr noundef %s, i32 noundef %pos, i32 noundef range(i32 136, 169) %r, i8 noundef zeroext %p) unnamed_addr #0 !dbg !2479 {
entry:
    #dbg_value(ptr %s, !2482, !DIExpression(), !2483)
    #dbg_value(i32 %pos, !2484, !DIExpression(), !2483)
    #dbg_value(i32 %r, !2485, !DIExpression(), !2483)
    #dbg_value(i8 31, !2486, !DIExpression(), !2483)
  %rem = shl i32 %pos, 3, !dbg !2487
  %mul = and i32 %rem, 56, !dbg !2487
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2488
  %shl = shl nuw nsw i64 31, %sh_prom, !dbg !2488
  %div2 = lshr i32 %pos, 3, !dbg !2489
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div2, !dbg !2490
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2491
  %xor = xor i64 %0, %shl, !dbg !2491
  store i64 %xor, ptr %arrayidx, align 8, !dbg !2491
  %div13 = lshr i32 %r, 3, !dbg !2492
  %1 = getelementptr i64, ptr %s, i32 %div13, !dbg !2493
  %arrayidx2 = getelementptr i8, ptr %1, i32 -8, !dbg !2493
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !2494
  %xor3 = xor i64 %2, -9223372036854775808, !dbg !2494
  store i64 %xor3, ptr %arrayidx2, align 8, !dbg !2494
  ret void, !dbg !2495
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) local_unnamed_addr #0 !dbg !2496 {
entry:
    #dbg_value(ptr %out, !2499, !DIExpression(), !2500)
    #dbg_value(i32 %outlen, !2501, !DIExpression(), !2500)
    #dbg_value(ptr %state, !2502, !DIExpression(), !2500)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2503
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2503
  %conv = trunc i64 %0 to i32, !dbg !2503
  %call = call fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state, i32 noundef %conv, i32 noundef 168) #3, !dbg !2504
  %conv1 = zext i32 %call to i64, !dbg !2504
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2505
  store i64 %conv1, ptr %arrayidx2, align 8, !dbg !2506
  ret void, !dbg !2507
}

; Function Attrs: nounwind
define internal fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %s, i32 noundef %pos, i32 noundef range(i32 136, 169) %r) unnamed_addr #0 !dbg !2508 {
entry:
    #dbg_value(ptr %out, !2511, !DIExpression(), !2512)
    #dbg_value(i32 %outlen, !2513, !DIExpression(), !2512)
    #dbg_value(ptr %s, !2514, !DIExpression(), !2512)
    #dbg_value(i32 %pos, !2515, !DIExpression(), !2512)
    #dbg_value(i32 %r, !2516, !DIExpression(), !2512)
  br label %while.cond, !dbg !2517

while.cond:                                       ; preds = %for.end, %entry
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ %i.0.lcssa, %for.end ]
  %outlen.addr.0 = phi i32 [ %outlen, %entry ], [ %sub3, %for.end ]
  %out.addr.0 = phi ptr [ %out, %entry ], [ %out.addr.1.lcssa, %for.end ]
    #dbg_value(ptr %out.addr.0, !2511, !DIExpression(), !2512)
    #dbg_value(i32 %outlen.addr.0, !2513, !DIExpression(), !2512)
    #dbg_value(i32 %pos.addr.0, !2515, !DIExpression(), !2512)
  %tobool.not = icmp eq i32 %outlen.addr.0, 0, !dbg !2517
  br i1 %tobool.not, label %while.end, label %while.body, !dbg !2517

while.body:                                       ; preds = %while.cond
  %cmp = icmp eq i32 %pos.addr.0, %r, !dbg !2518
  br i1 %cmp, label %if.then, label %if.end, !dbg !2518

if.then:                                          ; preds = %while.body
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2521
    #dbg_value(i32 0, !2515, !DIExpression(), !2512)
  br label %if.end, !dbg !2523

if.end:                                           ; preds = %if.then, %while.body
  %pos.addr.1 = phi i32 [ 0, %if.then ], [ %pos.addr.0, %while.body ]
    #dbg_value(i32 %pos.addr.1, !2515, !DIExpression(), !2512)
    #dbg_value(i32 %pos.addr.1, !2524, !DIExpression(), !2512)
  br label %for.cond, !dbg !2525

for.cond:                                         ; preds = %for.body, %if.end
  %i.0 = phi i32 [ %pos.addr.1, %if.end ], [ %inc, %for.body ], !dbg !2527
  %out.addr.1 = phi ptr [ %out.addr.0, %if.end ], [ %incdec.ptr, %for.body ]
    #dbg_value(ptr %out.addr.1, !2511, !DIExpression(), !2512)
    #dbg_value(i32 %i.0, !2524, !DIExpression(), !2512)
  %cmp1 = icmp ult i32 %i.0, %r, !dbg !2528
  %add = add i32 %pos.addr.1, %outlen.addr.0, !dbg !2530
  %cmp2 = icmp ult i32 %i.0, %add, !dbg !2530
  %0 = and i1 %cmp1, %cmp2, !dbg !2530
  br i1 %0, label %for.body, label %for.end, !dbg !2531

for.body:                                         ; preds = %for.cond
  %div1 = lshr i32 %i.0, 3, !dbg !2532
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div1, !dbg !2533
  %1 = load i64, ptr %arrayidx, align 8, !dbg !2533
  %rem = shl nuw nsw i32 %i.0, 3, !dbg !2534
  %mul = and i32 %rem, 56, !dbg !2534
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2535
  %shr = lshr i64 %1, %sh_prom, !dbg !2535
  %conv = trunc i64 %shr to i8, !dbg !2533
    #dbg_value(ptr %out.addr.1, !2511, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2512)
  store i8 %conv, ptr %out.addr.1, align 1, !dbg !2536
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %out.addr.1, i32 1, !dbg !2537
    #dbg_value(ptr %incdec.ptr, !2511, !DIExpression(), !2512)
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2538
    #dbg_value(i32 %inc, !2524, !DIExpression(), !2512)
  br label %for.cond, !dbg !2539, !llvm.loop !2540

for.end:                                          ; preds = %for.cond
  %i.0.lcssa = phi i32 [ %i.0, %for.cond ], !dbg !2527
  %out.addr.1.lcssa = phi ptr [ %out.addr.1, %for.cond ]
  %sub.neg = sub i32 %pos.addr.1, %i.0.lcssa, !dbg !2542
  %sub3 = add i32 %sub.neg, %outlen.addr.0, !dbg !2543
    #dbg_value(i32 %sub3, !2513, !DIExpression(), !2512)
    #dbg_value(i32 %i.0.lcssa, !2515, !DIExpression(), !2512)
  br label %while.cond, !dbg !2517, !llvm.loop !2544

while.end:                                        ; preds = %while.cond
  %pos.addr.0.lcssa = phi i32 [ %pos.addr.0, %while.cond ]
  ret i32 %pos.addr.0.lcssa, !dbg !2546
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2547 {
entry:
    #dbg_value(ptr %state, !2548, !DIExpression(), !2549)
    #dbg_value(ptr %in, !2550, !DIExpression(), !2549)
    #dbg_value(i32 %inlen, !2551, !DIExpression(), !2549)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 168, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #3, !dbg !2552
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2553
  store i64 168, ptr %arrayidx, align 8, !dbg !2554
  ret void, !dbg !2555
}

; Function Attrs: nounwind
define internal fastcc void @keccak_absorb_once(ptr noundef %s, i32 noundef range(i32 72, 169) %r, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext range(i8 6, 32) %p) unnamed_addr #0 !dbg !2556 {
entry:
    #dbg_value(ptr %s, !2559, !DIExpression(), !2560)
    #dbg_value(i32 %r, !2561, !DIExpression(), !2560)
    #dbg_value(ptr %in, !2562, !DIExpression(), !2560)
    #dbg_value(i32 %inlen, !2563, !DIExpression(), !2560)
    #dbg_value(i8 %p, !2564, !DIExpression(), !2560)
    #dbg_value(i32 0, !2565, !DIExpression(), !2560)
  br label %for.cond, !dbg !2566

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2568
    #dbg_value(i32 %i.0, !2565, !DIExpression(), !2560)
  %exitcond = icmp ne i32 %i.0, 25, !dbg !2569
  br i1 %exitcond, label %for.body, label %while.cond.preheader, !dbg !2571

while.cond.preheader:                             ; preds = %for.cond
  %0 = lshr i32 %r, 3, !dbg !2572
  br label %while.cond, !dbg !2572

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !2573
  store i64 0, ptr %arrayidx, align 8, !dbg !2574
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2575
    #dbg_value(i32 %inc, !2565, !DIExpression(), !2560)
  br label %for.cond, !dbg !2576, !llvm.loop !2577

while.cond:                                       ; preds = %while.cond.preheader, %for.end8
  %in.addr.0 = phi ptr [ %add.ptr9, %for.end8 ], [ %in, %while.cond.preheader ]
  %inlen.addr.0 = phi i32 [ %sub, %for.end8 ], [ %inlen, %while.cond.preheader ]
    #dbg_value(i32 %inlen.addr.0, !2563, !DIExpression(), !2560)
    #dbg_value(ptr %in.addr.0, !2562, !DIExpression(), !2560)
  %cmp1.not = icmp ult i32 %inlen.addr.0, %r, !dbg !2579
  br i1 %cmp1.not, label %for.cond10.preheader, label %for.cond2.preheader, !dbg !2572

for.cond2.preheader:                              ; preds = %while.cond
  br label %for.cond2, !dbg !2580

for.cond10.preheader:                             ; preds = %while.cond
  %inlen.addr.0.lcssa6 = phi i32 [ %inlen.addr.0, %while.cond ]
  %in.addr.0.lcssa = phi ptr [ %in.addr.0, %while.cond ]
  br label %for.cond10, !dbg !2583

for.cond2:                                        ; preds = %for.cond2.preheader, %for.body4
  %i.1 = phi i32 [ %inc7, %for.body4 ], [ 0, %for.cond2.preheader ], !dbg !2585
    #dbg_value(i32 %i.1, !2565, !DIExpression(), !2560)
  %exitcond5 = icmp ne i32 %i.1, %0, !dbg !2586
  br i1 %exitcond5, label %for.body4, label %for.end8, !dbg !2580

for.body4:                                        ; preds = %for.cond2
  %mul = shl nuw nsw i32 %i.1, 3, !dbg !2588
  %add.ptr = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %mul, !dbg !2589
  %call = call fastcc i64 @load64(ptr noundef %add.ptr) #3, !dbg !2590
  %arrayidx5 = getelementptr inbounds nuw i64, ptr %s, i32 %i.1, !dbg !2591
  %1 = load i64, ptr %arrayidx5, align 8, !dbg !2592
  %xor = xor i64 %1, %call, !dbg !2592
  store i64 %xor, ptr %arrayidx5, align 8, !dbg !2592
  %inc7 = add nuw nsw i32 %i.1, 1, !dbg !2593
    #dbg_value(i32 %inc7, !2565, !DIExpression(), !2560)
  br label %for.cond2, !dbg !2594, !llvm.loop !2595

for.end8:                                         ; preds = %for.cond2
  %add.ptr9 = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %r, !dbg !2597
    #dbg_value(ptr %add.ptr9, !2562, !DIExpression(), !2560)
  %sub = sub i32 %inlen.addr.0, %r, !dbg !2598
    #dbg_value(i32 %sub, !2563, !DIExpression(), !2560)
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2599
  br label %while.cond, !dbg !2572, !llvm.loop !2600

for.cond10:                                       ; preds = %for.cond10.preheader, %for.body12
  %i.2 = phi i32 [ %inc19, %for.body12 ], [ 0, %for.cond10.preheader ], !dbg !2602
    #dbg_value(i32 %i.2, !2565, !DIExpression(), !2560)
  %exitcond7 = icmp ne i32 %i.2, %inlen.addr.0.lcssa6, !dbg !2603
  br i1 %exitcond7, label %for.body12, label %for.end20, !dbg !2583

for.body12:                                       ; preds = %for.cond10
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %in.addr.0.lcssa, i32 %i.2, !dbg !2605
  %2 = load i8, ptr %arrayidx13, align 1, !dbg !2605
  %conv = zext i8 %2 to i64, !dbg !2606
  %rem = shl i32 %i.2, 3, !dbg !2607
  %mul14 = and i32 %rem, 56, !dbg !2607
  %sh_prom = zext nneg i32 %mul14 to i64, !dbg !2608
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !2608
  %div153 = lshr i32 %i.2, 3, !dbg !2609
  %arrayidx16 = getelementptr inbounds nuw i64, ptr %s, i32 %div153, !dbg !2610
  %3 = load i64, ptr %arrayidx16, align 8, !dbg !2611
  %xor17 = xor i64 %3, %shl, !dbg !2611
  store i64 %xor17, ptr %arrayidx16, align 8, !dbg !2611
  %inc19 = add i32 %i.2, 1, !dbg !2612
    #dbg_value(i32 %inc19, !2565, !DIExpression(), !2560)
  br label %for.cond10, !dbg !2613, !llvm.loop !2614

for.end20:                                        ; preds = %for.cond10
  %i.2.lcssa = phi i32 [ %i.2, %for.cond10 ], !dbg !2602
  %conv21 = zext nneg i8 %p to i64, !dbg !2616
  %rem22 = shl i32 %i.2.lcssa, 3, !dbg !2617
  %mul23 = and i32 %rem22, 56, !dbg !2617
  %sh_prom24 = zext nneg i32 %mul23 to i64, !dbg !2618
  %shl25 = shl nuw nsw i64 %conv21, %sh_prom24, !dbg !2618
  %div261 = lshr i32 %i.2.lcssa, 3, !dbg !2619
  %arrayidx27 = getelementptr inbounds nuw i64, ptr %s, i32 %div261, !dbg !2620
  %4 = load i64, ptr %arrayidx27, align 8, !dbg !2621
  %xor28 = xor i64 %4, %shl25, !dbg !2621
  store i64 %xor28, ptr %arrayidx27, align 8, !dbg !2621
  %sub29 = add nsw i32 %r, -1, !dbg !2622
  %div302 = lshr i32 %sub29, 3, !dbg !2623
  %arrayidx31 = getelementptr inbounds nuw i64, ptr %s, i32 %div302, !dbg !2624
  %5 = load i64, ptr %arrayidx31, align 8, !dbg !2625
  %xor32 = xor i64 %5, -9223372036854775808, !dbg !2625
  store i64 %xor32, ptr %arrayidx31, align 8, !dbg !2625
  ret void, !dbg !2626
}

; Function Attrs: nounwind
define internal fastcc i64 @load64(ptr noundef %x) unnamed_addr #0 !dbg !2627 {
entry:
    #dbg_value(ptr %x, !2630, !DIExpression(), !2631)
    #dbg_value(i64 0, !2632, !DIExpression(), !2631)
    #dbg_value(i32 0, !2633, !DIExpression(), !2631)
  br label %for.cond, !dbg !2634

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !2636
  %r.0 = phi i64 [ 0, %entry ], [ %or, %for.inc ], !dbg !2631
    #dbg_value(i64 %r.0, !2632, !DIExpression(), !2631)
    #dbg_value(i32 %i.0, !2633, !DIExpression(), !2631)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !2637
  br i1 %exitcond, label %for.inc, label %for.end, !dbg !2639

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i64 poison, i8 poison, i32 poison), !2632, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2631)
  %arrayidx = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2640
  %0 = load i8, ptr %arrayidx, align 1, !dbg !2640
    #dbg_value(!DIArgList(i64 %r.0, i8 %0, i32 %i.0), !2632, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2631)
  %conv = zext i8 %0 to i64, !dbg !2641
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i32 %i.0), !2632, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2631)
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2642
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i32 %mul), !2632, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2631)
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2643
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i64 %sh_prom), !2632, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2631)
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !2643
    #dbg_value(!DIArgList(i64 %r.0, i64 %shl), !2632, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value), !2631)
  %or = or i64 %r.0, %shl, !dbg !2644
    #dbg_value(i64 %or, !2632, !DIExpression(), !2631)
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2645
    #dbg_value(i32 %inc, !2633, !DIExpression(), !2631)
  br label %for.cond, !dbg !2646, !llvm.loop !2647

for.end:                                          ; preds = %for.cond
  %r.0.lcssa = phi i64 [ %r.0, %for.cond ], !dbg !2631
  ret i64 %r.0.lcssa, !dbg !2649
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #0 !dbg !2650 {
entry:
    #dbg_value(ptr %out, !2651, !DIExpression(), !2652)
    #dbg_value(i32 %nblocks, !2653, !DIExpression(), !2652)
    #dbg_value(ptr %state, !2654, !DIExpression(), !2652)
  call fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state, i32 noundef 168) #3, !dbg !2655
  ret void, !dbg !2656
}

; Function Attrs: nounwind
define internal fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %s, i32 noundef range(i32 136, 169) %r) unnamed_addr #0 !dbg !2657 {
entry:
    #dbg_value(ptr %out, !2660, !DIExpression(), !2661)
    #dbg_value(i32 %nblocks, !2662, !DIExpression(), !2661)
    #dbg_value(ptr %s, !2663, !DIExpression(), !2661)
    #dbg_value(i32 %r, !2664, !DIExpression(), !2661)
  %0 = lshr i32 %r, 3, !dbg !2665
  br label %while.cond, !dbg !2665

while.cond:                                       ; preds = %for.end, %entry
  %nblocks.addr.0 = phi i32 [ %nblocks, %entry ], [ %sub, %for.end ]
  %out.addr.0 = phi ptr [ %out, %entry ], [ %add.ptr1, %for.end ]
    #dbg_value(ptr %out.addr.0, !2660, !DIExpression(), !2661)
    #dbg_value(i32 %nblocks.addr.0, !2662, !DIExpression(), !2661)
  %tobool.not = icmp eq i32 %nblocks.addr.0, 0, !dbg !2665
  br i1 %tobool.not, label %while.end, label %while.body, !dbg !2665

while.body:                                       ; preds = %while.cond
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2666
    #dbg_value(i32 0, !2668, !DIExpression(), !2661)
  br label %for.cond, !dbg !2669

for.cond:                                         ; preds = %for.body, %while.body
  %i.0 = phi i32 [ 0, %while.body ], [ %inc, %for.body ], !dbg !2671
    #dbg_value(i32 %i.0, !2668, !DIExpression(), !2661)
  %exitcond = icmp ne i32 %i.0, %0, !dbg !2672
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2674

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2675
  %add.ptr = getelementptr inbounds nuw i8, ptr %out.addr.0, i32 %mul, !dbg !2676
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !2677
  %1 = load i64, ptr %arrayidx, align 8, !dbg !2677
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %1) #3, !dbg !2678
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2679
    #dbg_value(i32 %inc, !2668, !DIExpression(), !2661)
  br label %for.cond, !dbg !2680, !llvm.loop !2681

for.end:                                          ; preds = %for.cond
  %add.ptr1 = getelementptr inbounds nuw i8, ptr %out.addr.0, i32 %r, !dbg !2683
    #dbg_value(ptr %add.ptr1, !2660, !DIExpression(), !2661)
  %sub = add i32 %nblocks.addr.0, -1, !dbg !2684
    #dbg_value(i32 %sub, !2662, !DIExpression(), !2661)
  br label %while.cond, !dbg !2665, !llvm.loop !2685

while.end:                                        ; preds = %while.cond
  ret void, !dbg !2687
}

; Function Attrs: nounwind
define internal fastcc void @store64(ptr noundef %x, i64 noundef %u) unnamed_addr #0 !dbg !2688 {
entry:
    #dbg_value(ptr %x, !2691, !DIExpression(), !2692)
    #dbg_value(i64 %u, !2693, !DIExpression(), !2692)
    #dbg_value(i32 0, !2694, !DIExpression(), !2692)
  br label %for.cond, !dbg !2695

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2697
    #dbg_value(i32 %i.0, !2694, !DIExpression(), !2692)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !2698
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2700

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2701
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2702
  %shr = lshr i64 %u, %sh_prom, !dbg !2702
  %conv = trunc i64 %shr to i8, !dbg !2703
  %arrayidx = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2704
  store i8 %conv, ptr %arrayidx, align 1, !dbg !2705
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2706
    #dbg_value(i32 %inc, !2694, !DIExpression(), !2692)
  br label %for.cond, !dbg !2707, !llvm.loop !2708

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2710
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef %state) local_unnamed_addr #0 !dbg !2711 {
entry:
    #dbg_value(ptr %state, !2712, !DIExpression(), !2713)
  call fastcc void @keccak_init(ptr noundef %state) #3, !dbg !2714
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2715
  store i64 0, ptr %arrayidx, align 8, !dbg !2716
  ret void, !dbg !2717
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2718 {
entry:
    #dbg_value(ptr %state, !2719, !DIExpression(), !2720)
    #dbg_value(ptr %in, !2721, !DIExpression(), !2720)
    #dbg_value(i32 %inlen, !2722, !DIExpression(), !2720)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2723
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2723
  %conv = trunc i64 %0 to i32, !dbg !2723
  %call = call fastcc i32 @keccak_absorb(ptr noundef %state, i32 noundef %conv, i32 noundef 136, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2724
  %conv1 = zext i32 %call to i64, !dbg !2724
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2725
  store i64 %conv1, ptr %arrayidx2, align 8, !dbg !2726
  ret void, !dbg !2727
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef %state) local_unnamed_addr #0 !dbg !2728 {
entry:
    #dbg_value(ptr %state, !2729, !DIExpression(), !2730)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2731
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2731
  %conv = trunc i64 %0 to i32, !dbg !2731
  call fastcc void @keccak_finalize(ptr noundef %state, i32 noundef %conv, i32 noundef 136, i8 noundef zeroext 31) #3, !dbg !2732
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2733
  store i64 136, ptr %arrayidx1, align 8, !dbg !2734
  ret void, !dbg !2735
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) local_unnamed_addr #0 !dbg !2736 {
entry:
    #dbg_value(ptr %out, !2737, !DIExpression(), !2738)
    #dbg_value(i32 %outlen, !2739, !DIExpression(), !2738)
    #dbg_value(ptr %state, !2740, !DIExpression(), !2738)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2741
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2741
  %conv = trunc i64 %0 to i32, !dbg !2741
  %call = call fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state, i32 noundef %conv, i32 noundef 136) #3, !dbg !2742
  %conv1 = zext i32 %call to i64, !dbg !2742
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2743
  store i64 %conv1, ptr %arrayidx2, align 8, !dbg !2744
  ret void, !dbg !2745
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2746 {
entry:
    #dbg_value(ptr %state, !2747, !DIExpression(), !2748)
    #dbg_value(ptr %in, !2749, !DIExpression(), !2748)
    #dbg_value(i32 %inlen, !2750, !DIExpression(), !2748)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #3, !dbg !2751
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2752
  store i64 136, ptr %arrayidx, align 8, !dbg !2753
  ret void, !dbg !2754
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #0 !dbg !2755 {
entry:
    #dbg_value(ptr %out, !2756, !DIExpression(), !2757)
    #dbg_value(i32 %nblocks, !2758, !DIExpression(), !2757)
    #dbg_value(ptr %state, !2759, !DIExpression(), !2757)
  call fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state, i32 noundef 136) #3, !dbg !2760
  ret void, !dbg !2761
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2762 {
entry:
  %state = alloca [26 x i64], align 8
    #dbg_value(ptr %out, !2765, !DIExpression(), !2766)
    #dbg_value(i32 %outlen, !2767, !DIExpression(), !2766)
    #dbg_value(ptr %in, !2768, !DIExpression(), !2766)
    #dbg_value(i32 %inlen, !2769, !DIExpression(), !2766)
    #dbg_declare(ptr %state, !2770, !DIExpression(), !2771)
  call void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef nonnull %state, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2772
  %div = udiv i32 %outlen, 168, !dbg !2773
    #dbg_value(i32 %div, !2774, !DIExpression(), !2766)
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %div, ptr noundef nonnull %state) #3, !dbg !2775
  %mul.neg = mul i32 %div, -168, !dbg !2776
  %sub = add i32 %mul.neg, %outlen, !dbg !2777
    #dbg_value(i32 %sub, !2767, !DIExpression(), !2766)
  %mul1 = mul nuw i32 %div, 168, !dbg !2778
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !2779
    #dbg_value(ptr %add.ptr, !2765, !DIExpression(), !2766)
  call void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef nonnull %state) #3, !dbg !2780
  ret void, !dbg !2781
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2782 {
entry:
  %state = alloca [26 x i64], align 8
    #dbg_value(ptr %out, !2783, !DIExpression(), !2784)
    #dbg_value(i32 %outlen, !2785, !DIExpression(), !2784)
    #dbg_value(ptr %in, !2786, !DIExpression(), !2784)
    #dbg_value(i32 %inlen, !2787, !DIExpression(), !2784)
    #dbg_declare(ptr %state, !2788, !DIExpression(), !2789)
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef nonnull %state, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2790
  %div = udiv i32 %outlen, 136, !dbg !2791
    #dbg_value(i32 %div, !2792, !DIExpression(), !2784)
  call void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %div, ptr noundef nonnull %state) #3, !dbg !2793
  %mul.neg = mul i32 %div, -136, !dbg !2794
  %sub = add i32 %mul.neg, %outlen, !dbg !2795
    #dbg_value(i32 %sub, !2785, !DIExpression(), !2784)
  %mul1 = mul nuw i32 %div, 136, !dbg !2796
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !2797
    #dbg_value(ptr %add.ptr, !2783, !DIExpression(), !2784)
  call void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef nonnull %state) #3, !dbg !2798
  ret void, !dbg !2799
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2800 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !2803, !DIExpression(), !2804)
    #dbg_value(ptr %in, !2805, !DIExpression(), !2804)
    #dbg_value(i32 %inlen, !2806, !DIExpression(), !2804)
    #dbg_declare(ptr %s, !2807, !DIExpression(), !2811)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %s, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #3, !dbg !2812
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #3, !dbg !2813
    #dbg_value(i32 0, !2814, !DIExpression(), !2804)
  br label %for.cond, !dbg !2815

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2817
    #dbg_value(i32 %i.0, !2814, !DIExpression(), !2804)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !2818
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2820

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2821
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !2822
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !2823
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2823
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %0) #3, !dbg !2824
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2825
    #dbg_value(i32 %inc, !2814, !DIExpression(), !2804)
  br label %for.cond, !dbg !2826, !llvm.loop !2827

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2829
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2830 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !2831, !DIExpression(), !2832)
    #dbg_value(ptr %in, !2833, !DIExpression(), !2832)
    #dbg_value(i32 %inlen, !2834, !DIExpression(), !2832)
    #dbg_declare(ptr %s, !2835, !DIExpression(), !2836)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %s, i32 noundef 72, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #3, !dbg !2837
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #3, !dbg !2838
    #dbg_value(i32 0, !2839, !DIExpression(), !2832)
  br label %for.cond, !dbg !2840

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2842
    #dbg_value(i32 %i.0, !2839, !DIExpression(), !2832)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !2843
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2845

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2846
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !2847
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !2848
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2848
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %0) #3, !dbg !2849
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2850
    #dbg_value(i32 %inc, !2839, !DIExpression(), !2832)
  br label %for.cond, !dbg !2851, !llvm.loop !2852

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2854
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_kyber_shake128_absorb(ptr noundef %state, ptr noundef %seed, i8 noundef zeroext %x, i8 noundef zeroext %y) local_unnamed_addr #0 !dbg !2855 {
entry:
  %extseed = alloca [34 x i8], align 1
    #dbg_value(ptr %state, !2859, !DIExpression(), !2860)
    #dbg_value(ptr %seed, !2861, !DIExpression(), !2860)
    #dbg_value(i8 %x, !2862, !DIExpression(), !2860)
    #dbg_value(i8 %y, !2863, !DIExpression(), !2860)
    #dbg_declare(ptr %extseed, !2864, !DIExpression(), !2868)
  %call = call ptr @memcpy(ptr noundef nonnull %extseed, ptr noundef %seed, i32 noundef 32) #4, !dbg !2869
  %arrayidx = getelementptr inbounds nuw i8, ptr %extseed, i32 32, !dbg !2870
  store i8 %x, ptr %arrayidx, align 1, !dbg !2871
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %extseed, i32 33, !dbg !2872
  store i8 %y, ptr %arrayidx1, align 1, !dbg !2873
  call void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef nonnull %extseed, i32 noundef 34) #3, !dbg !2874
  ret void, !dbg !2875
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_kyber_shake256_prf(ptr noundef %out, i32 noundef %outlen, ptr noundef %key, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !2876 {
entry:
  %extkey = alloca [33 x i8], align 1
    #dbg_value(ptr %out, !2879, !DIExpression(), !2880)
    #dbg_value(i32 %outlen, !2881, !DIExpression(), !2880)
    #dbg_value(ptr %key, !2882, !DIExpression(), !2880)
    #dbg_value(i8 %nonce, !2883, !DIExpression(), !2880)
    #dbg_declare(ptr %extkey, !2884, !DIExpression(), !2888)
  %call = call ptr @memcpy(ptr noundef nonnull %extkey, ptr noundef %key, i32 noundef 32) #4, !dbg !2889
  %arrayidx = getelementptr inbounds nuw i8, ptr %extkey, i32 32, !dbg !2890
  store i8 %nonce, ptr %arrayidx, align 1, !dbg !2891
  call void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef nonnull %extkey, i32 noundef 33) #3, !dbg !2892
  ret void, !dbg !2893
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber1024_ref_kyber_shake256_rkprf(ptr noundef %out, ptr noundef %key, ptr noundef %input) local_unnamed_addr #0 !dbg !2894 {
entry:
  %s = alloca [26 x i64], align 8
    #dbg_value(ptr %out, !2895, !DIExpression(), !2896)
    #dbg_value(ptr %key, !2897, !DIExpression(), !2896)
    #dbg_value(ptr %input, !2898, !DIExpression(), !2896)
    #dbg_declare(ptr %s, !2899, !DIExpression(), !2900)
  call void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef nonnull %s) #3, !dbg !2901
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef nonnull %s, ptr noundef %key, i32 noundef 32) #3, !dbg !2902
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef nonnull %s, ptr noundef %input, i32 noundef 1568) #3, !dbg !2903
  call void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef nonnull %s) #3, !dbg !2904
  call void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef 32, ptr noundef nonnull %s) #3, !dbg !2905
  ret void, !dbg !2906
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
!109 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 12544, elements: !110)
!110 = !{!111}
!111 = !DISubrange(count: 1568)
!112 = !DILocation(line: 11, column: 11, scope: !107)
!113 = !DILocalVariable(name: "sk", scope: !107, file: !81, line: 12, type: !114)
!114 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 25344, elements: !115)
!115 = !{!116}
!116 = !DISubrange(count: 3168)
!117 = !DILocation(line: 12, column: 11, scope: !107)
!118 = !DILocalVariable(name: "ct", scope: !107, file: !81, line: 13, type: !109)
!119 = !DILocation(line: 13, column: 11, scope: !107)
!120 = !DILocalVariable(name: "key_a", scope: !107, file: !81, line: 14, type: !121)
!121 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 256, elements: !122)
!122 = !{!123}
!123 = !DISubrange(count: 32)
!124 = !DILocation(line: 14, column: 11, scope: !107)
!125 = !DILocalVariable(name: "key_b", scope: !107, file: !81, line: 15, type: !121)
!126 = !DILocation(line: 15, column: 11, scope: !107)
!127 = !DILocation(line: 18, column: 3, scope: !107)
!128 = !DILocation(line: 21, column: 3, scope: !107)
!129 = !DILocation(line: 24, column: 3, scope: !107)
!130 = !DILocation(line: 26, column: 6, scope: !131)
!131 = distinct !DILexicalBlock(scope: !107, file: !81, line: 26, column: 6)
!132 = !DILocation(line: 0, scope: !107)
!133 = !DILocation(line: 32, column: 1, scope: !107)
!134 = distinct !DISubprogram(name: "test_invalid_sk_a", scope: !81, file: !81, line: 34, type: !82, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !54, retainedNodes: !24)
!135 = !DILocalVariable(name: "pk", scope: !134, file: !81, line: 36, type: !109)
!136 = !DILocation(line: 36, column: 11, scope: !134)
!137 = !DILocalVariable(name: "sk", scope: !134, file: !81, line: 37, type: !114)
!138 = !DILocation(line: 37, column: 11, scope: !134)
!139 = !DILocalVariable(name: "ct", scope: !134, file: !81, line: 38, type: !109)
!140 = !DILocation(line: 38, column: 11, scope: !134)
!141 = !DILocalVariable(name: "key_a", scope: !134, file: !81, line: 39, type: !121)
!142 = !DILocation(line: 39, column: 11, scope: !134)
!143 = !DILocalVariable(name: "key_b", scope: !134, file: !81, line: 40, type: !121)
!144 = !DILocation(line: 40, column: 11, scope: !134)
!145 = !DILocation(line: 43, column: 3, scope: !134)
!146 = !DILocation(line: 46, column: 3, scope: !134)
!147 = !DILocation(line: 49, column: 3, scope: !134)
!148 = !DILocation(line: 52, column: 3, scope: !134)
!149 = !DILocation(line: 54, column: 7, scope: !150)
!150 = distinct !DILexicalBlock(scope: !134, file: !81, line: 54, column: 6)
!151 = !DILocation(line: 0, scope: !134)
!152 = !DILocation(line: 60, column: 1, scope: !134)
!153 = distinct !DISubprogram(name: "test_invalid_ciphertext", scope: !81, file: !81, line: 62, type: !82, scopeLine: 63, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !54, retainedNodes: !24)
!154 = !DILocalVariable(name: "pk", scope: !153, file: !81, line: 64, type: !109)
!155 = !DILocation(line: 64, column: 11, scope: !153)
!156 = !DILocalVariable(name: "sk", scope: !153, file: !81, line: 65, type: !114)
!157 = !DILocation(line: 65, column: 11, scope: !153)
!158 = !DILocalVariable(name: "ct", scope: !153, file: !81, line: 66, type: !109)
!159 = !DILocation(line: 66, column: 11, scope: !153)
!160 = !DILocalVariable(name: "key_a", scope: !153, file: !81, line: 67, type: !121)
!161 = !DILocation(line: 67, column: 11, scope: !153)
!162 = !DILocalVariable(name: "key_b", scope: !153, file: !81, line: 68, type: !121)
!163 = !DILocation(line: 68, column: 11, scope: !153)
!164 = !DILocation(line: 72, column: 3, scope: !153)
!165 = !DILocalVariable(name: "b", scope: !153, file: !81, line: 69, type: !7)
!166 = !DILocation(line: 0, scope: !153)
!167 = !DILocation(line: 73, column: 5, scope: !168)
!168 = distinct !DILexicalBlock(scope: !153, file: !81, line: 72, column: 6)
!169 = !DILocation(line: 74, column: 12, scope: !153)
!170 = !DILocation(line: 74, column: 11, scope: !153)
!171 = !DILocation(line: 74, column: 3, scope: !168)
!172 = distinct !{!172, !164, !173, !105}
!173 = !DILocation(line: 74, column: 13, scope: !153)
!174 = !DILocalVariable(name: "pos", scope: !153, file: !81, line: 70, type: !12)
!175 = !DILocation(line: 75, column: 3, scope: !153)
!176 = !DILocation(line: 78, column: 3, scope: !153)
!177 = !DILocation(line: 81, column: 3, scope: !153)
!178 = !DILocation(line: 84, column: 39, scope: !153)
!179 = !DILocation(line: 84, column: 6, scope: !153)
!180 = !DILocation(line: 84, column: 10, scope: !153)
!181 = !DILocation(line: 84, column: 3, scope: !153)
!182 = !DILocation(line: 84, column: 36, scope: !153)
!183 = !DILocation(line: 87, column: 3, scope: !153)
!184 = !DILocation(line: 89, column: 7, scope: !185)
!185 = distinct !DILexicalBlock(scope: !153, file: !81, line: 89, column: 6)
!186 = !DILocation(line: 95, column: 1, scope: !153)
!187 = !DILocalVariable(name: "out", arg: 1, scope: !2, file: !3, line: 74, type: !6)
!188 = !DILocation(line: 0, scope: !2)
!189 = !DILocalVariable(name: "outlen", arg: 2, scope: !2, file: !3, line: 74, type: !12)
!190 = !DILocation(line: 78, column: 3, scope: !2)
!191 = !DILocation(line: 78, column: 9, scope: !2)
!192 = !DILocation(line: 78, column: 12, scope: !2)
!193 = !DILocation(line: 86, column: 3, scope: !2)
!194 = !DILocation(line: 79, column: 10, scope: !195)
!195 = distinct !DILexicalBlock(scope: !2, file: !3, line: 78, column: 19)
!196 = !DILocation(line: 79, column: 8, scope: !195)
!197 = !DILocation(line: 80, column: 11, scope: !198)
!198 = distinct !DILexicalBlock(scope: !195, file: !3, line: 80, column: 8)
!199 = !DILocation(line: 80, column: 17, scope: !198)
!200 = !DILocation(line: 80, column: 20, scope: !198)
!201 = !DILocation(line: 80, column: 26, scope: !198)
!202 = !DILocation(line: 82, column: 13, scope: !203)
!203 = distinct !DILexicalBlock(scope: !198, file: !3, line: 82, column: 13)
!204 = !DILocation(line: 82, column: 16, scope: !203)
!205 = !DILocation(line: 83, column: 7, scope: !203)
!206 = distinct !{!206, !190, !207, !105}
!207 = !DILocation(line: 84, column: 3, scope: !2)
!208 = !DILocation(line: 86, column: 16, scope: !2)
!209 = !DILocation(line: 87, column: 16, scope: !210)
!210 = distinct !DILexicalBlock(scope: !2, file: !3, line: 86, column: 21)
!211 = !DILocation(line: 87, column: 11, scope: !210)
!212 = !DILocalVariable(name: "ret", scope: !2, file: !3, line: 76, type: !213)
!213 = !DIDerivedType(tag: DW_TAG_typedef, name: "ssize_t", file: !214, line: 182, baseType: !215)
!214 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/sys/types.h", directory: "")
!215 = !DIDerivedType(tag: DW_TAG_typedef, name: "_ssize_t", file: !216, line: 147, baseType: !25)
!216 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/sys/_types.h", directory: "")
!217 = !DILocation(line: 88, column: 18, scope: !218)
!218 = distinct !DILexicalBlock(scope: !210, file: !3, line: 88, column: 8)
!219 = !DILocation(line: 88, column: 21, scope: !218)
!220 = !DILocation(line: 88, column: 27, scope: !218)
!221 = distinct !{!221, !193, !222, !105}
!222 = !DILocation(line: 95, column: 3, scope: !2)
!223 = !DILocation(line: 91, column: 7, scope: !224)
!224 = distinct !DILexicalBlock(scope: !218, file: !3, line: 90, column: 13)
!225 = !DILocation(line: 93, column: 9, scope: !210)
!226 = !DILocation(line: 94, column: 12, scope: !210)
!227 = !DILocation(line: 96, column: 1, scope: !2)
!228 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_keypair_derand", scope: !229, file: !229, line: 25, type: !230, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !24)
!229 = !DIFile(filename: "../../../ref/kem.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!230 = !DISubroutineType(types: !231)
!231 = !{!25, !6, !6, !232}
!232 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !233, size: 32)
!233 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !7)
!234 = !DILocalVariable(name: "pk", arg: 1, scope: !228, file: !229, line: 25, type: !6)
!235 = !DILocation(line: 0, scope: !228)
!236 = !DILocalVariable(name: "sk", arg: 2, scope: !228, file: !229, line: 26, type: !6)
!237 = !DILocalVariable(name: "coins", arg: 3, scope: !228, file: !229, line: 27, type: !232)
!238 = !DILocation(line: 29, column: 3, scope: !228)
!239 = !DILocation(line: 30, column: 12, scope: !228)
!240 = !DILocation(line: 30, column: 3, scope: !228)
!241 = !DILocation(line: 31, column: 3, scope: !228)
!242 = !DILocation(line: 33, column: 33, scope: !228)
!243 = !DILocation(line: 33, column: 55, scope: !228)
!244 = !DILocation(line: 33, column: 3, scope: !228)
!245 = !DILocation(line: 34, column: 3, scope: !228)
!246 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_keypair", scope: !229, file: !229, line: 50, type: !247, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !24)
!247 = !DISubroutineType(types: !248)
!248 = !{!25, !6, !6}
!249 = !DILocalVariable(name: "pk", arg: 1, scope: !246, file: !229, line: 50, type: !6)
!250 = !DILocation(line: 0, scope: !246)
!251 = !DILocalVariable(name: "sk", arg: 2, scope: !246, file: !229, line: 51, type: !6)
!252 = !DILocalVariable(name: "coins", scope: !246, file: !229, line: 53, type: !253)
!253 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 512, elements: !254)
!254 = !{!255}
!255 = !DISubrange(count: 64)
!256 = !DILocation(line: 53, column: 11, scope: !246)
!257 = !DILocation(line: 54, column: 3, scope: !246)
!258 = !DILocation(line: 55, column: 3, scope: !246)
!259 = !DILocation(line: 56, column: 3, scope: !246)
!260 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_enc_derand", scope: !229, file: !229, line: 76, type: !261, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !24)
!261 = !DISubroutineType(types: !262)
!262 = !{!25, !6, !6, !232, !232}
!263 = !DILocalVariable(name: "ct", arg: 1, scope: !260, file: !229, line: 76, type: !6)
!264 = !DILocation(line: 0, scope: !260)
!265 = !DILocalVariable(name: "ss", arg: 2, scope: !260, file: !229, line: 77, type: !6)
!266 = !DILocalVariable(name: "pk", arg: 3, scope: !260, file: !229, line: 78, type: !232)
!267 = !DILocalVariable(name: "coins", arg: 4, scope: !260, file: !229, line: 79, type: !232)
!268 = !DILocalVariable(name: "buf", scope: !260, file: !229, line: 81, type: !253)
!269 = !DILocation(line: 81, column: 11, scope: !260)
!270 = !DILocalVariable(name: "kr", scope: !260, file: !229, line: 83, type: !253)
!271 = !DILocation(line: 83, column: 11, scope: !260)
!272 = !DILocation(line: 85, column: 3, scope: !260)
!273 = !DILocation(line: 88, column: 3, scope: !260)
!274 = !DILocation(line: 89, column: 3, scope: !260)
!275 = !DILocation(line: 92, column: 29, scope: !260)
!276 = !DILocation(line: 92, column: 3, scope: !260)
!277 = !DILocation(line: 94, column: 3, scope: !260)
!278 = !DILocation(line: 95, column: 3, scope: !260)
!279 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_enc", scope: !229, file: !229, line: 113, type: !230, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !24)
!280 = !DILocalVariable(name: "ct", arg: 1, scope: !279, file: !229, line: 113, type: !6)
!281 = !DILocation(line: 0, scope: !279)
!282 = !DILocalVariable(name: "ss", arg: 2, scope: !279, file: !229, line: 114, type: !6)
!283 = !DILocalVariable(name: "pk", arg: 3, scope: !279, file: !229, line: 115, type: !232)
!284 = !DILocalVariable(name: "coins", scope: !279, file: !229, line: 117, type: !121)
!285 = !DILocation(line: 117, column: 11, scope: !279)
!286 = !DILocation(line: 118, column: 3, scope: !279)
!287 = !DILocation(line: 119, column: 3, scope: !279)
!288 = !DILocation(line: 120, column: 3, scope: !279)
!289 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_dec", scope: !229, file: !229, line: 140, type: !290, scopeLine: 143, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !24)
!290 = !DISubroutineType(types: !291)
!291 = !{!25, !6, !232, !232}
!292 = !DILocalVariable(name: "ss", arg: 1, scope: !289, file: !229, line: 140, type: !6)
!293 = !DILocation(line: 0, scope: !289)
!294 = !DILocalVariable(name: "ct", arg: 2, scope: !289, file: !229, line: 141, type: !232)
!295 = !DILocalVariable(name: "sk", arg: 3, scope: !289, file: !229, line: 142, type: !232)
!296 = !DILocalVariable(name: "buf", scope: !289, file: !229, line: 145, type: !253)
!297 = !DILocation(line: 145, column: 11, scope: !289)
!298 = !DILocalVariable(name: "kr", scope: !289, file: !229, line: 147, type: !253)
!299 = !DILocation(line: 147, column: 11, scope: !289)
!300 = !DILocalVariable(name: "cmp", scope: !289, file: !229, line: 149, type: !109)
!301 = !DILocation(line: 149, column: 11, scope: !289)
!302 = !DILocation(line: 150, column: 25, scope: !289)
!303 = !DILocalVariable(name: "pk", scope: !289, file: !229, line: 150, type: !232)
!304 = !DILocation(line: 152, column: 3, scope: !289)
!305 = !DILocation(line: 155, column: 13, scope: !289)
!306 = !DILocation(line: 155, column: 53, scope: !289)
!307 = !DILocation(line: 155, column: 3, scope: !289)
!308 = !DILocation(line: 156, column: 3, scope: !289)
!309 = !DILocation(line: 159, column: 30, scope: !289)
!310 = !DILocation(line: 159, column: 3, scope: !289)
!311 = !DILocation(line: 161, column: 10, scope: !289)
!312 = !DILocalVariable(name: "fail", scope: !289, file: !229, line: 144, type: !25)
!313 = !DILocation(line: 164, column: 3, scope: !289)
!314 = !DILocation(line: 167, column: 29, scope: !289)
!315 = !DILocation(line: 167, column: 3, scope: !289)
!316 = !DILocation(line: 169, column: 3, scope: !289)
!317 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_gen_matrix", scope: !318, file: !318, line: 165, type: !319, scopeLine: 166, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !58, retainedNodes: !24)
!318 = !DIFile(filename: "../../../ref/indcpa.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!319 = !DISubroutineType(types: !320)
!320 = !{null, !321, !232, !25}
!321 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !322, size: 32)
!322 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyvec", file: !323, line: 8, baseType: !324)
!323 = !DIFile(filename: "../../../ref/polyvec.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!324 = !DICompositeType(tag: DW_TAG_array_type, baseType: !325, size: 16384, elements: !330)
!325 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !326, line: 11, baseType: !327)
!326 = !DIFile(filename: "../../../ref/poly.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!327 = !DICompositeType(tag: DW_TAG_array_type, baseType: !36, size: 4096, elements: !328)
!328 = !{!329}
!329 = !DISubrange(count: 256)
!330 = !{!331}
!331 = !DISubrange(count: 4)
!332 = !DILocalVariable(name: "a", arg: 1, scope: !317, file: !318, line: 165, type: !321)
!333 = !DILocation(line: 0, scope: !317)
!334 = !DILocalVariable(name: "seed", arg: 2, scope: !317, file: !318, line: 165, type: !232)
!335 = !DILocalVariable(name: "transposed", arg: 3, scope: !317, file: !318, line: 166, type: !25)
!336 = !DILocalVariable(name: "buf", scope: !317, file: !318, line: 169, type: !337)
!337 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 4032, elements: !338)
!338 = !{!339}
!339 = !DISubrange(count: 504)
!340 = !DILocation(line: 169, column: 11, scope: !317)
!341 = !DILocalVariable(name: "state", scope: !317, file: !318, line: 170, type: !342)
!342 = !DIDerivedType(tag: DW_TAG_typedef, name: "xof_state", file: !343, line: 10, baseType: !344)
!343 = !DIFile(filename: "../../../ref/symmetric.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!344 = !DIDerivedType(tag: DW_TAG_typedef, name: "keccak_state", file: !345, line: 14, baseType: !346)
!345 = !DIFile(filename: "../../../ref/fips202.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!346 = !DICompositeType(tag: DW_TAG_array_type, baseType: !45, size: 1664, elements: !347)
!347 = !{!348}
!348 = !DISubrange(count: 26)
!349 = !DILocation(line: 170, column: 13, scope: !317)
!350 = !DILocalVariable(name: "i", scope: !317, file: !318, line: 167, type: !14)
!351 = !DILocation(line: 172, column: 8, scope: !352)
!352 = distinct !DILexicalBlock(scope: !317, file: !318, line: 172, column: 3)
!353 = !DILocation(line: 172, scope: !352)
!354 = !DILocation(line: 172, column: 17, scope: !355)
!355 = distinct !DILexicalBlock(scope: !352, file: !318, line: 172, column: 3)
!356 = !DILocation(line: 172, column: 3, scope: !352)
!357 = !DILocation(line: 173, column: 5, scope: !358)
!358 = distinct !DILexicalBlock(scope: !359, file: !318, line: 173, column: 5)
!359 = distinct !DILexicalBlock(scope: !355, file: !318, line: 172, column: 33)
!360 = !DILocation(line: 173, scope: !358)
!361 = !DILocalVariable(name: "j", scope: !317, file: !318, line: 167, type: !14)
!362 = !DILocation(line: 173, column: 19, scope: !363)
!363 = distinct !DILexicalBlock(scope: !358, file: !318, line: 173, column: 5)
!364 = !DILocation(line: 174, column: 11, scope: !365)
!365 = distinct !DILexicalBlock(scope: !366, file: !318, line: 174, column: 11)
!366 = distinct !DILexicalBlock(scope: !363, file: !318, line: 173, column: 35)
!367 = !DILocation(line: 175, column: 9, scope: !365)
!368 = !DILocation(line: 177, column: 9, scope: !365)
!369 = !DILocation(line: 179, column: 7, scope: !366)
!370 = !DILocalVariable(name: "buflen", scope: !317, file: !318, line: 168, type: !14)
!371 = !DILocation(line: 181, column: 25, scope: !366)
!372 = !DILocation(line: 181, column: 13, scope: !366)
!373 = !DILocalVariable(name: "ctr", scope: !317, file: !318, line: 167, type: !14)
!374 = !DILocation(line: 183, column: 7, scope: !366)
!375 = !DILocation(line: 0, scope: !366)
!376 = !DILocation(line: 183, column: 18, scope: !366)
!377 = !DILocation(line: 184, column: 9, scope: !378)
!378 = distinct !DILexicalBlock(scope: !366, file: !318, line: 183, column: 29)
!379 = !DILocation(line: 186, column: 28, scope: !378)
!380 = !DILocation(line: 186, column: 36, scope: !378)
!381 = !DILocation(line: 186, column: 51, scope: !378)
!382 = !DILocation(line: 186, column: 16, scope: !378)
!383 = !DILocation(line: 186, column: 13, scope: !378)
!384 = distinct !{!384, !374, !385, !105}
!385 = !DILocation(line: 187, column: 7, scope: !366)
!386 = !DILocation(line: 173, column: 31, scope: !363)
!387 = !DILocation(line: 173, column: 5, scope: !363)
!388 = distinct !{!388, !357, !389, !105}
!389 = !DILocation(line: 188, column: 5, scope: !358)
!390 = !DILocation(line: 172, column: 29, scope: !355)
!391 = !DILocation(line: 172, column: 3, scope: !355)
!392 = distinct !{!392, !356, !393, !105}
!393 = !DILocation(line: 189, column: 3, scope: !352)
!394 = !DILocation(line: 190, column: 1, scope: !317)
!395 = distinct !DISubprogram(name: "rej_uniform", scope: !318, file: !318, line: 122, type: !396, scopeLine: 123, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !58, retainedNodes: !24)
!396 = !DISubroutineType(types: !397)
!397 = !{!14, !398, !14, !232, !14}
!398 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 32)
!399 = !DILocalVariable(name: "r", arg: 1, scope: !395, file: !318, line: 122, type: !398)
!400 = !DILocation(line: 0, scope: !395)
!401 = !DILocalVariable(name: "len", arg: 2, scope: !395, file: !318, line: 122, type: !14)
!402 = !DILocalVariable(name: "buf", arg: 3, scope: !395, file: !318, line: 123, type: !232)
!403 = !DILocalVariable(name: "buflen", arg: 4, scope: !395, file: !318, line: 123, type: !14)
!404 = !DILocalVariable(name: "pos", scope: !395, file: !318, line: 124, type: !14)
!405 = !DILocalVariable(name: "ctr", scope: !395, file: !318, line: 124, type: !14)
!406 = !DILocation(line: 128, column: 3, scope: !395)
!407 = !DILocation(line: 128, column: 14, scope: !395)
!408 = !DILocation(line: 128, column: 20, scope: !395)
!409 = !DILocation(line: 129, column: 14, scope: !410)
!410 = distinct !DILexicalBlock(scope: !395, file: !318, line: 128, column: 42)
!411 = !DILocation(line: 129, column: 46, scope: !410)
!412 = !DILocation(line: 129, column: 36, scope: !410)
!413 = !DILocation(line: 129, column: 59, scope: !410)
!414 = !DILocation(line: 129, column: 66, scope: !410)
!415 = !DILocalVariable(name: "val0", scope: !395, file: !318, line: 125, type: !60)
!416 = !DILocation(line: 130, column: 14, scope: !410)
!417 = !DILocation(line: 130, column: 27, scope: !410)
!418 = !DILocation(line: 130, column: 46, scope: !410)
!419 = !DILocation(line: 130, column: 36, scope: !410)
!420 = !DILocation(line: 130, column: 59, scope: !410)
!421 = !DILocation(line: 130, column: 33, scope: !410)
!422 = !DILocalVariable(name: "val1", scope: !395, file: !318, line: 125, type: !60)
!423 = !DILocation(line: 131, column: 9, scope: !410)
!424 = !DILocation(line: 133, column: 14, scope: !425)
!425 = distinct !DILexicalBlock(scope: !410, file: !318, line: 133, column: 9)
!426 = !DILocation(line: 134, column: 12, scope: !425)
!427 = !DILocation(line: 134, column: 7, scope: !425)
!428 = !DILocation(line: 134, column: 16, scope: !425)
!429 = !DILocation(line: 135, column: 13, scope: !430)
!430 = distinct !DILexicalBlock(scope: !410, file: !318, line: 135, column: 9)
!431 = !DILocation(line: 135, column: 19, scope: !430)
!432 = !DILocation(line: 136, column: 12, scope: !430)
!433 = !DILocation(line: 136, column: 7, scope: !430)
!434 = !DILocation(line: 136, column: 16, scope: !430)
!435 = !DILocation(line: 0, scope: !410)
!436 = distinct !{!436, !406, !437, !105}
!437 = !DILocation(line: 137, column: 3, scope: !395)
!438 = !DILocation(line: 139, column: 3, scope: !395)
!439 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_indcpa_keypair_derand", scope: !318, file: !318, line: 205, type: !440, scopeLine: 207, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !58, retainedNodes: !24)
!440 = !DISubroutineType(types: !441)
!441 = !{null, !6, !6, !232}
!442 = !DILocalVariable(name: "pk", arg: 1, scope: !439, file: !318, line: 205, type: !6)
!443 = !DILocation(line: 0, scope: !439)
!444 = !DILocalVariable(name: "sk", arg: 2, scope: !439, file: !318, line: 206, type: !6)
!445 = !DILocalVariable(name: "coins", arg: 3, scope: !439, file: !318, line: 207, type: !232)
!446 = !DILocalVariable(name: "buf", scope: !439, file: !318, line: 209, type: !253)
!447 = !DILocation(line: 209, column: 11, scope: !439)
!448 = !DILocalVariable(name: "publicseed", scope: !439, file: !318, line: 210, type: !232)
!449 = !DILocation(line: 211, column: 34, scope: !439)
!450 = !DILocalVariable(name: "noiseseed", scope: !439, file: !318, line: 211, type: !232)
!451 = !DILocalVariable(name: "nonce", scope: !439, file: !318, line: 212, type: !7)
!452 = !DILocalVariable(name: "a", scope: !439, file: !318, line: 213, type: !453)
!453 = !DICompositeType(tag: DW_TAG_array_type, baseType: !322, size: 65536, elements: !330)
!454 = !DILocation(line: 213, column: 11, scope: !439)
!455 = !DILocalVariable(name: "e", scope: !439, file: !318, line: 213, type: !322)
!456 = !DILocation(line: 213, column: 23, scope: !439)
!457 = !DILocalVariable(name: "pkpv", scope: !439, file: !318, line: 213, type: !322)
!458 = !DILocation(line: 213, column: 26, scope: !439)
!459 = !DILocalVariable(name: "skpv", scope: !439, file: !318, line: 213, type: !322)
!460 = !DILocation(line: 213, column: 32, scope: !439)
!461 = !DILocation(line: 215, column: 3, scope: !439)
!462 = !DILocation(line: 216, column: 3, scope: !439)
!463 = !DILocation(line: 216, column: 23, scope: !439)
!464 = !DILocation(line: 217, column: 3, scope: !439)
!465 = !DILocation(line: 219, column: 3, scope: !439)
!466 = !DILocalVariable(name: "i", scope: !439, file: !318, line: 208, type: !14)
!467 = !DILocation(line: 221, column: 8, scope: !468)
!468 = distinct !DILexicalBlock(scope: !439, file: !318, line: 221, column: 3)
!469 = !DILocation(line: 221, scope: !468)
!470 = !DILocation(line: 221, column: 17, scope: !471)
!471 = distinct !DILexicalBlock(scope: !468, file: !318, line: 221, column: 3)
!472 = !DILocation(line: 221, column: 3, scope: !468)
!473 = !DILocation(line: 223, column: 3, scope: !474)
!474 = distinct !DILexicalBlock(scope: !439, file: !318, line: 223, column: 3)
!475 = !DILocation(line: 222, column: 25, scope: !471)
!476 = !DILocation(line: 222, column: 5, scope: !471)
!477 = !DILocation(line: 222, column: 50, scope: !471)
!478 = !DILocation(line: 221, column: 29, scope: !471)
!479 = !DILocation(line: 221, column: 3, scope: !471)
!480 = distinct !{!480, !472, !481, !105}
!481 = !DILocation(line: 222, column: 52, scope: !468)
!482 = !DILocation(line: 223, scope: !474)
!483 = !DILocation(line: 223, column: 17, scope: !484)
!484 = distinct !DILexicalBlock(scope: !474, file: !318, line: 223, column: 3)
!485 = !DILocation(line: 224, column: 25, scope: !484)
!486 = !DILocation(line: 224, column: 5, scope: !484)
!487 = !DILocation(line: 224, column: 47, scope: !484)
!488 = !DILocation(line: 223, column: 29, scope: !484)
!489 = !DILocation(line: 223, column: 3, scope: !484)
!490 = distinct !{!490, !473, !491, !105}
!491 = !DILocation(line: 224, column: 49, scope: !474)
!492 = !DILocation(line: 226, column: 3, scope: !439)
!493 = !DILocation(line: 227, column: 3, scope: !439)
!494 = !DILocation(line: 230, column: 8, scope: !495)
!495 = distinct !DILexicalBlock(scope: !439, file: !318, line: 230, column: 3)
!496 = !DILocation(line: 230, scope: !495)
!497 = !DILocation(line: 230, column: 17, scope: !498)
!498 = distinct !DILexicalBlock(scope: !495, file: !318, line: 230, column: 3)
!499 = !DILocation(line: 230, column: 3, scope: !495)
!500 = !DILocation(line: 231, column: 37, scope: !501)
!501 = distinct !DILexicalBlock(scope: !498, file: !318, line: 230, column: 33)
!502 = !DILocation(line: 231, column: 47, scope: !501)
!503 = !DILocation(line: 231, column: 5, scope: !501)
!504 = !DILocation(line: 232, column: 18, scope: !501)
!505 = !DILocation(line: 232, column: 5, scope: !501)
!506 = !DILocation(line: 230, column: 29, scope: !498)
!507 = !DILocation(line: 230, column: 3, scope: !498)
!508 = distinct !{!508, !499, !509, !105}
!509 = !DILocation(line: 233, column: 3, scope: !495)
!510 = !DILocation(line: 235, column: 3, scope: !439)
!511 = !DILocation(line: 236, column: 3, scope: !439)
!512 = !DILocation(line: 238, column: 3, scope: !439)
!513 = !DILocation(line: 239, column: 3, scope: !439)
!514 = !DILocation(line: 240, column: 1, scope: !439)
!515 = distinct !DISubprogram(name: "pack_sk", scope: !318, file: !318, line: 55, type: !516, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !58, retainedNodes: !24)
!516 = !DISubroutineType(types: !517)
!517 = !{null, !6, !321}
!518 = !DILocalVariable(name: "r", arg: 1, scope: !515, file: !318, line: 55, type: !6)
!519 = !DILocation(line: 0, scope: !515)
!520 = !DILocalVariable(name: "sk", arg: 2, scope: !515, file: !318, line: 55, type: !321)
!521 = !DILocation(line: 56, column: 3, scope: !515)
!522 = !DILocation(line: 57, column: 1, scope: !515)
!523 = distinct !DISubprogram(name: "pack_pk", scope: !318, file: !318, line: 23, type: !524, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !58, retainedNodes: !24)
!524 = !DISubroutineType(types: !525)
!525 = !{null, !6, !321, !232}
!526 = !DILocalVariable(name: "r", arg: 1, scope: !523, file: !318, line: 23, type: !6)
!527 = !DILocation(line: 0, scope: !523)
!528 = !DILocalVariable(name: "pk", arg: 2, scope: !523, file: !318, line: 23, type: !321)
!529 = !DILocalVariable(name: "seed", arg: 3, scope: !523, file: !318, line: 24, type: !232)
!530 = !DILocation(line: 25, column: 3, scope: !523)
!531 = !DILocation(line: 26, column: 12, scope: !523)
!532 = !DILocation(line: 26, column: 3, scope: !523)
!533 = !DILocation(line: 27, column: 1, scope: !523)
!534 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_indcpa_enc", scope: !318, file: !318, line: 257, type: !535, scopeLine: 260, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !58, retainedNodes: !24)
!535 = !DISubroutineType(types: !536)
!536 = !{null, !6, !232, !232, !232}
!537 = !DILocalVariable(name: "c", arg: 1, scope: !534, file: !318, line: 257, type: !6)
!538 = !DILocation(line: 0, scope: !534)
!539 = !DILocalVariable(name: "m", arg: 2, scope: !534, file: !318, line: 258, type: !232)
!540 = !DILocalVariable(name: "pk", arg: 3, scope: !534, file: !318, line: 259, type: !232)
!541 = !DILocalVariable(name: "coins", arg: 4, scope: !534, file: !318, line: 260, type: !232)
!542 = !DILocalVariable(name: "seed", scope: !534, file: !318, line: 262, type: !121)
!543 = !DILocation(line: 262, column: 11, scope: !534)
!544 = !DILocalVariable(name: "nonce", scope: !534, file: !318, line: 263, type: !7)
!545 = !DILocalVariable(name: "sp", scope: !534, file: !318, line: 264, type: !322)
!546 = !DILocation(line: 264, column: 11, scope: !534)
!547 = !DILocalVariable(name: "pkpv", scope: !534, file: !318, line: 264, type: !322)
!548 = !DILocation(line: 264, column: 15, scope: !534)
!549 = !DILocalVariable(name: "ep", scope: !534, file: !318, line: 264, type: !322)
!550 = !DILocation(line: 264, column: 21, scope: !534)
!551 = !DILocalVariable(name: "at", scope: !534, file: !318, line: 264, type: !453)
!552 = !DILocation(line: 264, column: 25, scope: !534)
!553 = !DILocalVariable(name: "b", scope: !534, file: !318, line: 264, type: !322)
!554 = !DILocation(line: 264, column: 38, scope: !534)
!555 = !DILocalVariable(name: "v", scope: !534, file: !318, line: 265, type: !325)
!556 = !DILocation(line: 265, column: 8, scope: !534)
!557 = !DILocalVariable(name: "k", scope: !534, file: !318, line: 265, type: !325)
!558 = !DILocation(line: 265, column: 11, scope: !534)
!559 = !DILocalVariable(name: "epp", scope: !534, file: !318, line: 265, type: !325)
!560 = !DILocation(line: 265, column: 14, scope: !534)
!561 = !DILocation(line: 267, column: 3, scope: !534)
!562 = !DILocation(line: 268, column: 3, scope: !534)
!563 = !DILocation(line: 269, column: 3, scope: !534)
!564 = !DILocalVariable(name: "i", scope: !534, file: !318, line: 261, type: !14)
!565 = !DILocation(line: 271, column: 8, scope: !566)
!566 = distinct !DILexicalBlock(scope: !534, file: !318, line: 271, column: 3)
!567 = !DILocation(line: 271, scope: !566)
!568 = !DILocation(line: 271, column: 17, scope: !569)
!569 = distinct !DILexicalBlock(scope: !566, file: !318, line: 271, column: 3)
!570 = !DILocation(line: 271, column: 3, scope: !566)
!571 = !DILocation(line: 273, column: 3, scope: !572)
!572 = distinct !DILexicalBlock(scope: !534, file: !318, line: 273, column: 3)
!573 = !DILocation(line: 272, column: 27, scope: !569)
!574 = !DILocation(line: 272, column: 5, scope: !569)
!575 = !DILocation(line: 272, column: 44, scope: !569)
!576 = !DILocation(line: 271, column: 29, scope: !569)
!577 = !DILocation(line: 271, column: 3, scope: !569)
!578 = distinct !{!578, !570, !579, !105}
!579 = !DILocation(line: 272, column: 46, scope: !566)
!580 = !DILocation(line: 273, scope: !572)
!581 = !DILocation(line: 273, column: 17, scope: !582)
!582 = distinct !DILexicalBlock(scope: !572, file: !318, line: 273, column: 3)
!583 = !DILocation(line: 274, column: 27, scope: !582)
!584 = !DILocation(line: 274, column: 5, scope: !582)
!585 = !DILocation(line: 274, column: 44, scope: !582)
!586 = !DILocation(line: 273, column: 29, scope: !582)
!587 = !DILocation(line: 273, column: 3, scope: !582)
!588 = distinct !{!588, !571, !589, !105}
!589 = !DILocation(line: 274, column: 46, scope: !572)
!590 = !DILocation(line: 275, column: 3, scope: !534)
!591 = !DILocation(line: 277, column: 3, scope: !534)
!592 = !DILocation(line: 280, column: 8, scope: !593)
!593 = distinct !DILexicalBlock(scope: !534, file: !318, line: 280, column: 3)
!594 = !DILocation(line: 280, scope: !593)
!595 = !DILocation(line: 280, column: 17, scope: !596)
!596 = distinct !DILexicalBlock(scope: !593, file: !318, line: 280, column: 3)
!597 = !DILocation(line: 280, column: 3, scope: !593)
!598 = !DILocation(line: 281, column: 37, scope: !596)
!599 = !DILocation(line: 281, column: 44, scope: !596)
!600 = !DILocation(line: 281, column: 5, scope: !596)
!601 = !DILocation(line: 280, column: 29, scope: !596)
!602 = !DILocation(line: 280, column: 3, scope: !596)
!603 = distinct !{!603, !597, !604, !105}
!604 = !DILocation(line: 281, column: 54, scope: !593)
!605 = !DILocation(line: 283, column: 3, scope: !534)
!606 = !DILocation(line: 285, column: 3, scope: !534)
!607 = !DILocation(line: 286, column: 3, scope: !534)
!608 = !DILocation(line: 288, column: 3, scope: !534)
!609 = !DILocation(line: 289, column: 3, scope: !534)
!610 = !DILocation(line: 290, column: 3, scope: !534)
!611 = !DILocation(line: 291, column: 3, scope: !534)
!612 = !DILocation(line: 292, column: 3, scope: !534)
!613 = !DILocation(line: 294, column: 3, scope: !534)
!614 = !DILocation(line: 295, column: 1, scope: !534)
!615 = distinct !DISubprogram(name: "unpack_pk", scope: !318, file: !318, line: 40, type: !616, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !58, retainedNodes: !24)
!616 = !DISubroutineType(types: !617)
!617 = !{null, !321, !6, !232}
!618 = !DILocalVariable(name: "pk", arg: 1, scope: !615, file: !318, line: 40, type: !321)
!619 = !DILocation(line: 0, scope: !615)
!620 = !DILocalVariable(name: "seed", arg: 2, scope: !615, file: !318, line: 40, type: !6)
!621 = !DILocalVariable(name: "packedpk", arg: 3, scope: !615, file: !318, line: 41, type: !232)
!622 = !DILocation(line: 42, column: 3, scope: !615)
!623 = !DILocation(line: 43, column: 25, scope: !615)
!624 = !DILocation(line: 43, column: 3, scope: !615)
!625 = !DILocation(line: 44, column: 1, scope: !615)
!626 = distinct !DISubprogram(name: "pack_ciphertext", scope: !318, file: !318, line: 85, type: !627, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !58, retainedNodes: !24)
!627 = !DISubroutineType(types: !628)
!628 = !{null, !6, !321, !629}
!629 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !325, size: 32)
!630 = !DILocalVariable(name: "r", arg: 1, scope: !626, file: !318, line: 85, type: !6)
!631 = !DILocation(line: 0, scope: !626)
!632 = !DILocalVariable(name: "b", arg: 2, scope: !626, file: !318, line: 85, type: !321)
!633 = !DILocalVariable(name: "v", arg: 3, scope: !626, file: !318, line: 86, type: !629)
!634 = !DILocation(line: 87, column: 3, scope: !626)
!635 = !DILocation(line: 88, column: 19, scope: !626)
!636 = !DILocation(line: 88, column: 3, scope: !626)
!637 = !DILocation(line: 89, column: 1, scope: !626)
!638 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_indcpa_dec", scope: !318, file: !318, line: 310, type: !639, scopeLine: 312, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !58, retainedNodes: !24)
!639 = !DISubroutineType(types: !640)
!640 = !{null, !6, !232, !232}
!641 = !DILocalVariable(name: "m", arg: 1, scope: !638, file: !318, line: 310, type: !6)
!642 = !DILocation(line: 0, scope: !638)
!643 = !DILocalVariable(name: "c", arg: 2, scope: !638, file: !318, line: 311, type: !232)
!644 = !DILocalVariable(name: "sk", arg: 3, scope: !638, file: !318, line: 312, type: !232)
!645 = !DILocalVariable(name: "b", scope: !638, file: !318, line: 313, type: !322)
!646 = !DILocation(line: 313, column: 11, scope: !638)
!647 = !DILocalVariable(name: "skpv", scope: !638, file: !318, line: 313, type: !322)
!648 = !DILocation(line: 313, column: 14, scope: !638)
!649 = !DILocalVariable(name: "v", scope: !638, file: !318, line: 314, type: !325)
!650 = !DILocation(line: 314, column: 8, scope: !638)
!651 = !DILocalVariable(name: "mp", scope: !638, file: !318, line: 314, type: !325)
!652 = !DILocation(line: 314, column: 11, scope: !638)
!653 = !DILocation(line: 316, column: 3, scope: !638)
!654 = !DILocation(line: 317, column: 3, scope: !638)
!655 = !DILocation(line: 319, column: 3, scope: !638)
!656 = !DILocation(line: 320, column: 3, scope: !638)
!657 = !DILocation(line: 321, column: 3, scope: !638)
!658 = !DILocation(line: 323, column: 3, scope: !638)
!659 = !DILocation(line: 324, column: 3, scope: !638)
!660 = !DILocation(line: 326, column: 3, scope: !638)
!661 = !DILocation(line: 327, column: 1, scope: !638)
!662 = distinct !DISubprogram(name: "unpack_ciphertext", scope: !318, file: !318, line: 101, type: !663, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !58, retainedNodes: !24)
!663 = !DISubroutineType(types: !664)
!664 = !{null, !321, !629, !232}
!665 = !DILocalVariable(name: "b", arg: 1, scope: !662, file: !318, line: 101, type: !321)
!666 = !DILocation(line: 0, scope: !662)
!667 = !DILocalVariable(name: "v", arg: 2, scope: !662, file: !318, line: 101, type: !629)
!668 = !DILocalVariable(name: "c", arg: 3, scope: !662, file: !318, line: 102, type: !232)
!669 = !DILocation(line: 103, column: 3, scope: !662)
!670 = !DILocation(line: 104, column: 24, scope: !662)
!671 = !DILocation(line: 104, column: 3, scope: !662)
!672 = !DILocation(line: 105, column: 1, scope: !662)
!673 = distinct !DISubprogram(name: "unpack_sk", scope: !318, file: !318, line: 69, type: !674, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !58, retainedNodes: !24)
!674 = !DISubroutineType(types: !675)
!675 = !{null, !321, !232}
!676 = !DILocalVariable(name: "sk", arg: 1, scope: !673, file: !318, line: 69, type: !321)
!677 = !DILocation(line: 0, scope: !673)
!678 = !DILocalVariable(name: "packedsk", arg: 2, scope: !673, file: !318, line: 70, type: !232)
!679 = !DILocation(line: 71, column: 3, scope: !673)
!680 = !DILocation(line: 72, column: 1, scope: !673)
!681 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_compress", scope: !682, file: !682, line: 15, type: !683, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!682 = !DIFile(filename: "../../../ref/polyvec.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!683 = !DISubroutineType(types: !684)
!684 = !{null, !6, !685}
!685 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !686, size: 32)
!686 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !322)
!687 = !DILocalVariable(name: "r", arg: 1, scope: !681, file: !682, line: 15, type: !6)
!688 = !DILocation(line: 0, scope: !681)
!689 = !DILocalVariable(name: "a", arg: 2, scope: !681, file: !682, line: 16, type: !685)
!690 = !DILocalVariable(name: "t", scope: !681, file: !682, line: 21, type: !691)
!691 = !DICompositeType(tag: DW_TAG_array_type, baseType: !60, size: 128, elements: !692)
!692 = !{!693}
!693 = !DISubrange(count: 8)
!694 = !DILocation(line: 21, column: 12, scope: !681)
!695 = !DILocalVariable(name: "i", scope: !681, file: !682, line: 17, type: !14)
!696 = !DILocation(line: 22, column: 8, scope: !697)
!697 = distinct !DILexicalBlock(scope: !681, file: !682, line: 22, column: 3)
!698 = !DILocation(line: 22, scope: !697)
!699 = !DILocation(line: 22, column: 17, scope: !700)
!700 = distinct !DILexicalBlock(scope: !697, file: !682, line: 22, column: 3)
!701 = !DILocation(line: 22, column: 3, scope: !697)
!702 = !DILocation(line: 23, column: 5, scope: !703)
!703 = distinct !DILexicalBlock(scope: !704, file: !682, line: 23, column: 5)
!704 = distinct !DILexicalBlock(scope: !700, file: !682, line: 22, column: 33)
!705 = !DILocation(line: 23, scope: !703)
!706 = !DILocalVariable(name: "j", scope: !681, file: !682, line: 17, type: !14)
!707 = !DILocation(line: 23, column: 19, scope: !708)
!708 = distinct !DILexicalBlock(scope: !703, file: !682, line: 23, column: 5)
!709 = !DILocation(line: 24, column: 7, scope: !710)
!710 = distinct !DILexicalBlock(scope: !711, file: !682, line: 24, column: 7)
!711 = distinct !DILexicalBlock(scope: !708, file: !682, line: 23, column: 39)
!712 = !DILocation(line: 24, scope: !710)
!713 = !DILocalVariable(name: "k", scope: !681, file: !682, line: 17, type: !14)
!714 = !DILocation(line: 24, column: 21, scope: !715)
!715 = distinct !DILexicalBlock(scope: !710, file: !682, line: 24, column: 7)
!716 = !DILocation(line: 25, column: 26, scope: !717)
!717 = distinct !DILexicalBlock(scope: !715, file: !682, line: 24, column: 31)
!718 = !DILocation(line: 25, column: 30, scope: !717)
!719 = !DILocation(line: 25, column: 16, scope: !717)
!720 = !DILocation(line: 26, column: 39, scope: !717)
!721 = !DILocation(line: 26, column: 9, scope: !717)
!722 = !DILocation(line: 26, column: 14, scope: !717)
!723 = !DILocation(line: 29, column: 14, scope: !717)
!724 = !DILocalVariable(name: "d0", scope: !681, file: !682, line: 18, type: !45)
!725 = !DILocation(line: 32, column: 12, scope: !717)
!726 = !DILocation(line: 33, column: 12, scope: !717)
!727 = !DILocation(line: 34, column: 16, scope: !717)
!728 = !DILocation(line: 34, column: 9, scope: !717)
!729 = !DILocation(line: 34, column: 14, scope: !717)
!730 = !DILocation(line: 24, column: 27, scope: !715)
!731 = !DILocation(line: 24, column: 7, scope: !715)
!732 = distinct !{!732, !709, !733, !105}
!733 = !DILocation(line: 35, column: 7, scope: !710)
!734 = !DILocation(line: 37, column: 15, scope: !711)
!735 = !DILocation(line: 37, column: 14, scope: !711)
!736 = !DILocation(line: 37, column: 12, scope: !711)
!737 = !DILocation(line: 38, column: 15, scope: !711)
!738 = !DILocation(line: 38, column: 20, scope: !711)
!739 = !DILocation(line: 38, column: 29, scope: !711)
!740 = !DILocation(line: 38, column: 34, scope: !711)
!741 = !DILocation(line: 38, column: 26, scope: !711)
!742 = !DILocation(line: 38, column: 7, scope: !711)
!743 = !DILocation(line: 38, column: 12, scope: !711)
!744 = !DILocation(line: 39, column: 15, scope: !711)
!745 = !DILocation(line: 39, column: 20, scope: !711)
!746 = !DILocation(line: 39, column: 29, scope: !711)
!747 = !DILocation(line: 39, column: 34, scope: !711)
!748 = !DILocation(line: 39, column: 26, scope: !711)
!749 = !DILocation(line: 39, column: 7, scope: !711)
!750 = !DILocation(line: 39, column: 12, scope: !711)
!751 = !DILocation(line: 40, column: 15, scope: !711)
!752 = !DILocation(line: 40, column: 20, scope: !711)
!753 = !DILocation(line: 40, column: 14, scope: !711)
!754 = !DILocation(line: 40, column: 7, scope: !711)
!755 = !DILocation(line: 40, column: 12, scope: !711)
!756 = !DILocation(line: 41, column: 15, scope: !711)
!757 = !DILocation(line: 41, column: 20, scope: !711)
!758 = !DILocation(line: 41, column: 30, scope: !711)
!759 = !DILocation(line: 41, column: 35, scope: !711)
!760 = !DILocation(line: 41, column: 27, scope: !711)
!761 = !DILocation(line: 41, column: 7, scope: !711)
!762 = !DILocation(line: 41, column: 12, scope: !711)
!763 = !DILocation(line: 42, column: 15, scope: !711)
!764 = !DILocation(line: 42, column: 20, scope: !711)
!765 = !DILocation(line: 42, column: 29, scope: !711)
!766 = !DILocation(line: 42, column: 34, scope: !711)
!767 = !DILocation(line: 42, column: 26, scope: !711)
!768 = !DILocation(line: 42, column: 7, scope: !711)
!769 = !DILocation(line: 42, column: 12, scope: !711)
!770 = !DILocation(line: 43, column: 15, scope: !711)
!771 = !DILocation(line: 43, column: 20, scope: !711)
!772 = !DILocation(line: 43, column: 29, scope: !711)
!773 = !DILocation(line: 43, column: 34, scope: !711)
!774 = !DILocation(line: 43, column: 26, scope: !711)
!775 = !DILocation(line: 43, column: 7, scope: !711)
!776 = !DILocation(line: 43, column: 12, scope: !711)
!777 = !DILocation(line: 44, column: 15, scope: !711)
!778 = !DILocation(line: 44, column: 20, scope: !711)
!779 = !DILocation(line: 44, column: 14, scope: !711)
!780 = !DILocation(line: 44, column: 7, scope: !711)
!781 = !DILocation(line: 44, column: 12, scope: !711)
!782 = !DILocation(line: 45, column: 15, scope: !711)
!783 = !DILocation(line: 45, column: 20, scope: !711)
!784 = !DILocation(line: 45, column: 29, scope: !711)
!785 = !DILocation(line: 45, column: 34, scope: !711)
!786 = !DILocation(line: 45, column: 26, scope: !711)
!787 = !DILocation(line: 45, column: 7, scope: !711)
!788 = !DILocation(line: 45, column: 12, scope: !711)
!789 = !DILocation(line: 46, column: 15, scope: !711)
!790 = !DILocation(line: 46, column: 20, scope: !711)
!791 = !DILocation(line: 46, column: 29, scope: !711)
!792 = !DILocation(line: 46, column: 34, scope: !711)
!793 = !DILocation(line: 46, column: 26, scope: !711)
!794 = !DILocation(line: 46, column: 7, scope: !711)
!795 = !DILocation(line: 46, column: 12, scope: !711)
!796 = !DILocation(line: 47, column: 16, scope: !711)
!797 = !DILocation(line: 47, column: 21, scope: !711)
!798 = !DILocation(line: 47, column: 15, scope: !711)
!799 = !DILocation(line: 47, column: 7, scope: !711)
!800 = !DILocation(line: 47, column: 13, scope: !711)
!801 = !DILocation(line: 48, column: 9, scope: !711)
!802 = !DILocation(line: 23, column: 35, scope: !708)
!803 = !DILocation(line: 23, column: 5, scope: !708)
!804 = distinct !{!804, !702, !805, !105}
!805 = !DILocation(line: 49, column: 5, scope: !703)
!806 = !DILocation(line: 22, column: 29, scope: !700)
!807 = !DILocation(line: 22, column: 3, scope: !700)
!808 = distinct !{!808, !701, !809, !105}
!809 = !DILocation(line: 50, column: 3, scope: !697)
!810 = !DILocation(line: 79, column: 1, scope: !681)
!811 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_decompress", scope: !682, file: !682, line: 91, type: !674, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!812 = !DILocalVariable(name: "r", arg: 1, scope: !811, file: !682, line: 91, type: !321)
!813 = !DILocation(line: 0, scope: !811)
!814 = !DILocalVariable(name: "a", arg: 2, scope: !811, file: !682, line: 92, type: !232)
!815 = !DILocalVariable(name: "t", scope: !811, file: !682, line: 96, type: !691)
!816 = !DILocation(line: 96, column: 12, scope: !811)
!817 = !DILocalVariable(name: "i", scope: !811, file: !682, line: 93, type: !14)
!818 = !DILocation(line: 97, column: 8, scope: !819)
!819 = distinct !DILexicalBlock(scope: !811, file: !682, line: 97, column: 3)
!820 = !DILocation(line: 97, scope: !819)
!821 = !DILocation(line: 97, column: 17, scope: !822)
!822 = distinct !DILexicalBlock(scope: !819, file: !682, line: 97, column: 3)
!823 = !DILocation(line: 97, column: 3, scope: !819)
!824 = !DILocation(line: 98, column: 5, scope: !825)
!825 = distinct !DILexicalBlock(scope: !826, file: !682, line: 98, column: 5)
!826 = distinct !DILexicalBlock(scope: !822, file: !682, line: 97, column: 33)
!827 = !DILocation(line: 98, scope: !825)
!828 = !DILocalVariable(name: "j", scope: !811, file: !682, line: 93, type: !14)
!829 = !DILocation(line: 98, column: 19, scope: !830)
!830 = distinct !DILexicalBlock(scope: !825, file: !682, line: 98, column: 5)
!831 = !DILocation(line: 99, column: 15, scope: !832)
!832 = distinct !DILexicalBlock(scope: !830, file: !682, line: 98, column: 39)
!833 = !DILocation(line: 99, column: 39, scope: !832)
!834 = !DILocation(line: 99, column: 29, scope: !832)
!835 = !DILocation(line: 99, column: 44, scope: !832)
!836 = !DILocation(line: 99, column: 26, scope: !832)
!837 = !DILocation(line: 99, column: 12, scope: !832)
!838 = !DILocation(line: 100, column: 15, scope: !832)
!839 = !DILocation(line: 100, column: 20, scope: !832)
!840 = !DILocation(line: 100, column: 39, scope: !832)
!841 = !DILocation(line: 100, column: 29, scope: !832)
!842 = !DILocation(line: 100, column: 44, scope: !832)
!843 = !DILocation(line: 100, column: 26, scope: !832)
!844 = !DILocation(line: 100, column: 7, scope: !832)
!845 = !DILocation(line: 100, column: 12, scope: !832)
!846 = !DILocation(line: 101, column: 15, scope: !832)
!847 = !DILocation(line: 101, column: 20, scope: !832)
!848 = !DILocation(line: 101, column: 39, scope: !832)
!849 = !DILocation(line: 101, column: 29, scope: !832)
!850 = !DILocation(line: 101, column: 44, scope: !832)
!851 = !DILocation(line: 101, column: 26, scope: !832)
!852 = !DILocation(line: 101, column: 63, scope: !832)
!853 = !DILocation(line: 101, column: 53, scope: !832)
!854 = !DILocation(line: 101, column: 68, scope: !832)
!855 = !DILocation(line: 101, column: 50, scope: !832)
!856 = !DILocation(line: 101, column: 7, scope: !832)
!857 = !DILocation(line: 101, column: 12, scope: !832)
!858 = !DILocation(line: 102, column: 15, scope: !832)
!859 = !DILocation(line: 102, column: 20, scope: !832)
!860 = !DILocation(line: 102, column: 39, scope: !832)
!861 = !DILocation(line: 102, column: 29, scope: !832)
!862 = !DILocation(line: 102, column: 44, scope: !832)
!863 = !DILocation(line: 102, column: 26, scope: !832)
!864 = !DILocation(line: 102, column: 7, scope: !832)
!865 = !DILocation(line: 102, column: 12, scope: !832)
!866 = !DILocation(line: 103, column: 15, scope: !832)
!867 = !DILocation(line: 103, column: 20, scope: !832)
!868 = !DILocation(line: 103, column: 39, scope: !832)
!869 = !DILocation(line: 103, column: 29, scope: !832)
!870 = !DILocation(line: 103, column: 44, scope: !832)
!871 = !DILocation(line: 103, column: 26, scope: !832)
!872 = !DILocation(line: 103, column: 7, scope: !832)
!873 = !DILocation(line: 103, column: 12, scope: !832)
!874 = !DILocation(line: 104, column: 15, scope: !832)
!875 = !DILocation(line: 104, column: 20, scope: !832)
!876 = !DILocation(line: 104, column: 39, scope: !832)
!877 = !DILocation(line: 104, column: 29, scope: !832)
!878 = !DILocation(line: 104, column: 44, scope: !832)
!879 = !DILocation(line: 104, column: 26, scope: !832)
!880 = !DILocation(line: 104, column: 63, scope: !832)
!881 = !DILocation(line: 104, column: 53, scope: !832)
!882 = !DILocation(line: 104, column: 68, scope: !832)
!883 = !DILocation(line: 104, column: 50, scope: !832)
!884 = !DILocation(line: 104, column: 7, scope: !832)
!885 = !DILocation(line: 104, column: 12, scope: !832)
!886 = !DILocation(line: 105, column: 15, scope: !832)
!887 = !DILocation(line: 105, column: 20, scope: !832)
!888 = !DILocation(line: 105, column: 39, scope: !832)
!889 = !DILocation(line: 105, column: 29, scope: !832)
!890 = !DILocation(line: 105, column: 44, scope: !832)
!891 = !DILocation(line: 105, column: 26, scope: !832)
!892 = !DILocation(line: 105, column: 7, scope: !832)
!893 = !DILocation(line: 105, column: 12, scope: !832)
!894 = !DILocation(line: 106, column: 15, scope: !832)
!895 = !DILocation(line: 106, column: 20, scope: !832)
!896 = !DILocation(line: 106, column: 39, scope: !832)
!897 = !DILocation(line: 106, column: 29, scope: !832)
!898 = !DILocation(line: 106, column: 45, scope: !832)
!899 = !DILocation(line: 106, column: 26, scope: !832)
!900 = !DILocation(line: 106, column: 7, scope: !832)
!901 = !DILocation(line: 106, column: 12, scope: !832)
!902 = !DILocalVariable(name: "k", scope: !811, file: !682, line: 93, type: !14)
!903 = !DILocation(line: 109, column: 12, scope: !904)
!904 = distinct !DILexicalBlock(scope: !832, file: !682, line: 109, column: 7)
!905 = !DILocation(line: 109, scope: !904)
!906 = !DILocation(line: 109, column: 21, scope: !907)
!907 = distinct !DILexicalBlock(scope: !904, file: !682, line: 109, column: 7)
!908 = !DILocation(line: 109, column: 7, scope: !904)
!909 = !DILocation(line: 110, column: 42, scope: !907)
!910 = !DILocation(line: 110, column: 47, scope: !907)
!911 = !DILocation(line: 110, column: 56, scope: !907)
!912 = !DILocation(line: 110, column: 66, scope: !907)
!913 = !DILocation(line: 110, column: 74, scope: !907)
!914 = !DILocation(line: 110, column: 30, scope: !907)
!915 = !DILocation(line: 110, column: 19, scope: !907)
!916 = !DILocation(line: 110, column: 23, scope: !907)
!917 = !DILocation(line: 110, column: 9, scope: !907)
!918 = !DILocation(line: 110, column: 28, scope: !907)
!919 = !DILocation(line: 109, column: 27, scope: !907)
!920 = !DILocation(line: 109, column: 7, scope: !907)
!921 = distinct !{!921, !908, !922, !105}
!922 = !DILocation(line: 110, column: 77, scope: !904)
!923 = !DILocation(line: 107, column: 9, scope: !832)
!924 = !DILocation(line: 98, column: 35, scope: !830)
!925 = !DILocation(line: 98, column: 5, scope: !830)
!926 = distinct !{!926, !824, !927, !105}
!927 = !DILocation(line: 111, column: 5, scope: !825)
!928 = !DILocation(line: 97, column: 29, scope: !822)
!929 = !DILocation(line: 97, column: 3, scope: !822)
!930 = distinct !{!930, !823, !931, !105}
!931 = !DILocation(line: 112, column: 3, scope: !819)
!932 = !DILocation(line: 130, column: 1, scope: !811)
!933 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_tobytes", scope: !682, file: !682, line: 141, type: !683, scopeLine: 141, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!934 = !DILocalVariable(name: "r", arg: 1, scope: !933, file: !682, line: 141, type: !6)
!935 = !DILocation(line: 0, scope: !933)
!936 = !DILocalVariable(name: "a", arg: 2, scope: !933, file: !682, line: 141, type: !685)
!937 = !DILocalVariable(name: "i", scope: !933, file: !682, line: 142, type: !14)
!938 = !DILocation(line: 143, column: 8, scope: !939)
!939 = distinct !DILexicalBlock(scope: !933, file: !682, line: 143, column: 3)
!940 = !DILocation(line: 143, scope: !939)
!941 = !DILocation(line: 143, column: 17, scope: !942)
!942 = distinct !DILexicalBlock(scope: !939, file: !682, line: 143, column: 3)
!943 = !DILocation(line: 143, column: 3, scope: !939)
!944 = !DILocation(line: 144, column: 24, scope: !942)
!945 = !DILocation(line: 144, column: 20, scope: !942)
!946 = !DILocation(line: 144, column: 44, scope: !942)
!947 = !DILocation(line: 144, column: 5, scope: !942)
!948 = !DILocation(line: 143, column: 29, scope: !942)
!949 = !DILocation(line: 143, column: 3, scope: !942)
!950 = distinct !{!950, !943, !951, !105}
!951 = !DILocation(line: 144, column: 51, scope: !939)
!952 = !DILocation(line: 145, column: 1, scope: !933)
!953 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_frombytes", scope: !682, file: !682, line: 157, type: !674, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!954 = !DILocalVariable(name: "r", arg: 1, scope: !953, file: !682, line: 157, type: !321)
!955 = !DILocation(line: 0, scope: !953)
!956 = !DILocalVariable(name: "a", arg: 2, scope: !953, file: !682, line: 157, type: !232)
!957 = !DILocalVariable(name: "i", scope: !953, file: !682, line: 158, type: !14)
!958 = !DILocation(line: 159, column: 8, scope: !959)
!959 = distinct !DILexicalBlock(scope: !953, file: !682, line: 159, column: 3)
!960 = !DILocation(line: 159, scope: !959)
!961 = !DILocation(line: 159, column: 17, scope: !962)
!962 = distinct !DILexicalBlock(scope: !959, file: !682, line: 159, column: 3)
!963 = !DILocation(line: 159, column: 3, scope: !959)
!964 = !DILocation(line: 160, column: 21, scope: !962)
!965 = !DILocation(line: 160, column: 36, scope: !962)
!966 = !DILocation(line: 160, column: 32, scope: !962)
!967 = !DILocation(line: 160, column: 5, scope: !962)
!968 = !DILocation(line: 159, column: 29, scope: !962)
!969 = !DILocation(line: 159, column: 3, scope: !962)
!970 = distinct !{!970, !963, !971, !105}
!971 = !DILocation(line: 160, column: 53, scope: !959)
!972 = !DILocation(line: 161, column: 1, scope: !953)
!973 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_ntt", scope: !682, file: !682, line: 170, type: !974, scopeLine: 170, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!974 = !DISubroutineType(types: !975)
!975 = !{null, !321}
!976 = !DILocalVariable(name: "r", arg: 1, scope: !973, file: !682, line: 170, type: !321)
!977 = !DILocation(line: 0, scope: !973)
!978 = !DILocalVariable(name: "i", scope: !973, file: !682, line: 171, type: !14)
!979 = !DILocation(line: 172, column: 8, scope: !980)
!980 = distinct !DILexicalBlock(scope: !973, file: !682, line: 172, column: 3)
!981 = !DILocation(line: 172, scope: !980)
!982 = !DILocation(line: 172, column: 17, scope: !983)
!983 = distinct !DILexicalBlock(scope: !980, file: !682, line: 172, column: 3)
!984 = !DILocation(line: 172, column: 3, scope: !980)
!985 = !DILocation(line: 173, column: 15, scope: !983)
!986 = !DILocation(line: 173, column: 5, scope: !983)
!987 = !DILocation(line: 172, column: 29, scope: !983)
!988 = !DILocation(line: 172, column: 3, scope: !983)
!989 = distinct !{!989, !984, !990, !105}
!990 = !DILocation(line: 173, column: 22, scope: !980)
!991 = !DILocation(line: 174, column: 1, scope: !973)
!992 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_invntt_tomont", scope: !682, file: !682, line: 184, type: !974, scopeLine: 184, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!993 = !DILocalVariable(name: "r", arg: 1, scope: !992, file: !682, line: 184, type: !321)
!994 = !DILocation(line: 0, scope: !992)
!995 = !DILocalVariable(name: "i", scope: !992, file: !682, line: 185, type: !14)
!996 = !DILocation(line: 186, column: 8, scope: !997)
!997 = distinct !DILexicalBlock(scope: !992, file: !682, line: 186, column: 3)
!998 = !DILocation(line: 186, scope: !997)
!999 = !DILocation(line: 186, column: 17, scope: !1000)
!1000 = distinct !DILexicalBlock(scope: !997, file: !682, line: 186, column: 3)
!1001 = !DILocation(line: 186, column: 3, scope: !997)
!1002 = !DILocation(line: 187, column: 25, scope: !1000)
!1003 = !DILocation(line: 187, column: 5, scope: !1000)
!1004 = !DILocation(line: 186, column: 29, scope: !1000)
!1005 = !DILocation(line: 186, column: 3, scope: !1000)
!1006 = distinct !{!1006, !1001, !1007, !105}
!1007 = !DILocation(line: 187, column: 32, scope: !997)
!1008 = !DILocation(line: 188, column: 1, scope: !992)
!1009 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery", scope: !682, file: !682, line: 200, type: !1010, scopeLine: 201, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!1010 = !DISubroutineType(types: !1011)
!1011 = !{null, !629, !685, !685}
!1012 = !DILocalVariable(name: "r", arg: 1, scope: !1009, file: !682, line: 200, type: !629)
!1013 = !DILocation(line: 0, scope: !1009)
!1014 = !DILocalVariable(name: "a", arg: 2, scope: !1009, file: !682, line: 200, type: !685)
!1015 = !DILocalVariable(name: "b", arg: 3, scope: !1009, file: !682, line: 201, type: !685)
!1016 = !DILocalVariable(name: "t", scope: !1009, file: !682, line: 203, type: !325)
!1017 = !DILocation(line: 203, column: 8, scope: !1009)
!1018 = !DILocation(line: 205, column: 3, scope: !1009)
!1019 = !DILocalVariable(name: "i", scope: !1009, file: !682, line: 202, type: !14)
!1020 = !DILocation(line: 206, column: 8, scope: !1021)
!1021 = distinct !DILexicalBlock(scope: !1009, file: !682, line: 206, column: 3)
!1022 = !DILocation(line: 206, scope: !1021)
!1023 = !DILocation(line: 206, column: 17, scope: !1024)
!1024 = distinct !DILexicalBlock(scope: !1021, file: !682, line: 206, column: 3)
!1025 = !DILocation(line: 206, column: 3, scope: !1021)
!1026 = !DILocation(line: 207, column: 34, scope: !1027)
!1027 = distinct !DILexicalBlock(scope: !1024, file: !682, line: 206, column: 33)
!1028 = !DILocation(line: 207, column: 44, scope: !1027)
!1029 = !DILocation(line: 207, column: 5, scope: !1027)
!1030 = !DILocation(line: 208, column: 5, scope: !1027)
!1031 = !DILocation(line: 206, column: 29, scope: !1024)
!1032 = !DILocation(line: 206, column: 3, scope: !1024)
!1033 = distinct !{!1033, !1025, !1034, !105}
!1034 = !DILocation(line: 209, column: 3, scope: !1021)
!1035 = !DILocation(line: 211, column: 3, scope: !1009)
!1036 = !DILocation(line: 212, column: 1, scope: !1009)
!1037 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_reduce", scope: !682, file: !682, line: 223, type: !974, scopeLine: 223, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!1038 = !DILocalVariable(name: "r", arg: 1, scope: !1037, file: !682, line: 223, type: !321)
!1039 = !DILocation(line: 0, scope: !1037)
!1040 = !DILocalVariable(name: "i", scope: !1037, file: !682, line: 224, type: !14)
!1041 = !DILocation(line: 225, column: 8, scope: !1042)
!1042 = distinct !DILexicalBlock(scope: !1037, file: !682, line: 225, column: 3)
!1043 = !DILocation(line: 225, scope: !1042)
!1044 = !DILocation(line: 225, column: 17, scope: !1045)
!1045 = distinct !DILexicalBlock(scope: !1042, file: !682, line: 225, column: 3)
!1046 = !DILocation(line: 225, column: 3, scope: !1042)
!1047 = !DILocation(line: 226, column: 18, scope: !1045)
!1048 = !DILocation(line: 226, column: 5, scope: !1045)
!1049 = !DILocation(line: 225, column: 29, scope: !1045)
!1050 = !DILocation(line: 225, column: 3, scope: !1045)
!1051 = distinct !{!1051, !1046, !1052, !105}
!1052 = !DILocation(line: 226, column: 25, scope: !1042)
!1053 = !DILocation(line: 227, column: 1, scope: !1037)
!1054 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_add", scope: !682, file: !682, line: 238, type: !1055, scopeLine: 238, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!1055 = !DISubroutineType(types: !1056)
!1056 = !{null, !321, !685, !685}
!1057 = !DILocalVariable(name: "r", arg: 1, scope: !1054, file: !682, line: 238, type: !321)
!1058 = !DILocation(line: 0, scope: !1054)
!1059 = !DILocalVariable(name: "a", arg: 2, scope: !1054, file: !682, line: 238, type: !685)
!1060 = !DILocalVariable(name: "b", arg: 3, scope: !1054, file: !682, line: 238, type: !685)
!1061 = !DILocalVariable(name: "i", scope: !1054, file: !682, line: 239, type: !14)
!1062 = !DILocation(line: 240, column: 8, scope: !1063)
!1063 = distinct !DILexicalBlock(scope: !1054, file: !682, line: 240, column: 3)
!1064 = !DILocation(line: 240, scope: !1063)
!1065 = !DILocation(line: 240, column: 17, scope: !1066)
!1066 = distinct !DILexicalBlock(scope: !1063, file: !682, line: 240, column: 3)
!1067 = !DILocation(line: 240, column: 3, scope: !1063)
!1068 = !DILocation(line: 241, column: 15, scope: !1066)
!1069 = !DILocation(line: 241, column: 25, scope: !1066)
!1070 = !DILocation(line: 241, column: 35, scope: !1066)
!1071 = !DILocation(line: 241, column: 5, scope: !1066)
!1072 = !DILocation(line: 240, column: 29, scope: !1066)
!1073 = !DILocation(line: 240, column: 3, scope: !1066)
!1074 = distinct !{!1074, !1067, !1075, !105}
!1075 = !DILocation(line: 241, column: 42, scope: !1063)
!1076 = !DILocation(line: 242, column: 1, scope: !1054)
!1077 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_compress", scope: !1078, file: !1078, line: 19, type: !1079, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1078 = !DIFile(filename: "../../../ref/poly.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!1079 = !DISubroutineType(types: !1080)
!1080 = !{null, !6, !1081}
!1081 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1082, size: 32)
!1082 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !325)
!1083 = !DILocalVariable(name: "r", arg: 1, scope: !1077, file: !1078, line: 19, type: !6)
!1084 = !DILocation(line: 0, scope: !1077)
!1085 = !DILocalVariable(name: "a", arg: 2, scope: !1077, file: !1078, line: 19, type: !1081)
!1086 = !DILocalVariable(name: "t", scope: !1077, file: !1078, line: 23, type: !1087)
!1087 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 64, elements: !692)
!1088 = !DILocation(line: 23, column: 11, scope: !1077)
!1089 = !DILocalVariable(name: "i", scope: !1077, file: !1078, line: 20, type: !14)
!1090 = !DILocation(line: 47, column: 8, scope: !1091)
!1091 = distinct !DILexicalBlock(scope: !1077, file: !1078, line: 47, column: 3)
!1092 = !DILocation(line: 47, scope: !1091)
!1093 = !DILocation(line: 47, column: 17, scope: !1094)
!1094 = distinct !DILexicalBlock(scope: !1091, file: !1078, line: 47, column: 3)
!1095 = !DILocation(line: 47, column: 3, scope: !1091)
!1096 = !DILocation(line: 48, column: 5, scope: !1097)
!1097 = distinct !DILexicalBlock(scope: !1098, file: !1078, line: 48, column: 5)
!1098 = distinct !DILexicalBlock(scope: !1094, file: !1078, line: 47, column: 37)
!1099 = !DILocation(line: 48, scope: !1097)
!1100 = !DILocalVariable(name: "j", scope: !1077, file: !1078, line: 20, type: !14)
!1101 = !DILocation(line: 48, column: 19, scope: !1102)
!1102 = distinct !DILexicalBlock(scope: !1097, file: !1078, line: 48, column: 5)
!1103 = !DILocation(line: 50, column: 18, scope: !1104)
!1104 = distinct !DILexicalBlock(scope: !1102, file: !1078, line: 48, column: 29)
!1105 = !DILocation(line: 50, column: 22, scope: !1104)
!1106 = !DILocation(line: 50, column: 11, scope: !1104)
!1107 = !DILocalVariable(name: "u", scope: !1077, file: !1078, line: 21, type: !36)
!1108 = !DILocation(line: 51, column: 22, scope: !1104)
!1109 = !DILocation(line: 51, column: 9, scope: !1104)
!1110 = !DILocation(line: 53, column: 12, scope: !1104)
!1111 = !DILocalVariable(name: "d0", scope: !1077, file: !1078, line: 22, type: !65)
!1112 = !DILocation(line: 55, column: 10, scope: !1104)
!1113 = !DILocation(line: 56, column: 10, scope: !1104)
!1114 = !DILocation(line: 57, column: 14, scope: !1104)
!1115 = !DILocation(line: 57, column: 7, scope: !1104)
!1116 = !DILocation(line: 57, column: 12, scope: !1104)
!1117 = !DILocation(line: 48, column: 25, scope: !1102)
!1118 = !DILocation(line: 48, column: 5, scope: !1102)
!1119 = distinct !{!1119, !1096, !1120, !105}
!1120 = !DILocation(line: 58, column: 5, scope: !1097)
!1121 = !DILocation(line: 60, column: 13, scope: !1098)
!1122 = !DILocation(line: 60, column: 27, scope: !1098)
!1123 = !DILocation(line: 60, column: 32, scope: !1098)
!1124 = !DILocation(line: 60, column: 24, scope: !1098)
!1125 = !DILocation(line: 60, column: 10, scope: !1098)
!1126 = !DILocation(line: 61, column: 18, scope: !1098)
!1127 = !DILocation(line: 61, column: 27, scope: !1098)
!1128 = !DILocation(line: 61, column: 32, scope: !1098)
!1129 = !DILocation(line: 61, column: 24, scope: !1098)
!1130 = !DILocation(line: 61, column: 41, scope: !1098)
!1131 = !DILocation(line: 61, column: 46, scope: !1098)
!1132 = !DILocation(line: 61, column: 38, scope: !1098)
!1133 = !DILocation(line: 61, column: 5, scope: !1098)
!1134 = !DILocation(line: 61, column: 10, scope: !1098)
!1135 = !DILocation(line: 62, column: 18, scope: !1098)
!1136 = !DILocation(line: 62, column: 27, scope: !1098)
!1137 = !DILocation(line: 62, column: 32, scope: !1098)
!1138 = !DILocation(line: 62, column: 24, scope: !1098)
!1139 = !DILocation(line: 62, column: 5, scope: !1098)
!1140 = !DILocation(line: 62, column: 10, scope: !1098)
!1141 = !DILocation(line: 63, column: 18, scope: !1098)
!1142 = !DILocation(line: 63, column: 27, scope: !1098)
!1143 = !DILocation(line: 63, column: 32, scope: !1098)
!1144 = !DILocation(line: 63, column: 24, scope: !1098)
!1145 = !DILocation(line: 63, column: 41, scope: !1098)
!1146 = !DILocation(line: 63, column: 46, scope: !1098)
!1147 = !DILocation(line: 63, column: 38, scope: !1098)
!1148 = !DILocation(line: 63, column: 5, scope: !1098)
!1149 = !DILocation(line: 63, column: 10, scope: !1098)
!1150 = !DILocation(line: 64, column: 18, scope: !1098)
!1151 = !DILocation(line: 64, column: 27, scope: !1098)
!1152 = !DILocation(line: 64, column: 32, scope: !1098)
!1153 = !DILocation(line: 64, column: 24, scope: !1098)
!1154 = !DILocation(line: 64, column: 5, scope: !1098)
!1155 = !DILocation(line: 64, column: 10, scope: !1098)
!1156 = !DILocation(line: 65, column: 7, scope: !1098)
!1157 = !DILocation(line: 47, column: 33, scope: !1094)
!1158 = !DILocation(line: 47, column: 3, scope: !1094)
!1159 = distinct !{!1159, !1095, !1160, !105}
!1160 = !DILocation(line: 66, column: 3, scope: !1091)
!1161 = !DILocation(line: 70, column: 1, scope: !1077)
!1162 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_decompress", scope: !1078, file: !1078, line: 82, type: !1163, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1163 = !DISubroutineType(types: !1164)
!1164 = !{null, !629, !232}
!1165 = !DILocalVariable(name: "r", arg: 1, scope: !1162, file: !1078, line: 82, type: !629)
!1166 = !DILocation(line: 0, scope: !1162)
!1167 = !DILocalVariable(name: "a", arg: 2, scope: !1162, file: !1078, line: 82, type: !232)
!1168 = !DILocalVariable(name: "t", scope: !1162, file: !1078, line: 93, type: !1087)
!1169 = !DILocation(line: 93, column: 11, scope: !1162)
!1170 = !DILocalVariable(name: "i", scope: !1162, file: !1078, line: 83, type: !14)
!1171 = !DILocation(line: 94, column: 8, scope: !1172)
!1172 = distinct !DILexicalBlock(scope: !1162, file: !1078, line: 94, column: 3)
!1173 = !DILocation(line: 94, scope: !1172)
!1174 = !DILocation(line: 94, column: 17, scope: !1175)
!1175 = distinct !DILexicalBlock(scope: !1172, file: !1078, line: 94, column: 3)
!1176 = !DILocation(line: 94, column: 3, scope: !1172)
!1177 = !DILocation(line: 95, column: 13, scope: !1178)
!1178 = distinct !DILexicalBlock(scope: !1175, file: !1078, line: 94, column: 37)
!1179 = !DILocation(line: 95, column: 10, scope: !1178)
!1180 = !DILocation(line: 96, column: 27, scope: !1178)
!1181 = !DILocation(line: 96, column: 24, scope: !1178)
!1182 = !DILocation(line: 96, column: 5, scope: !1178)
!1183 = !DILocation(line: 96, column: 10, scope: !1178)
!1184 = !DILocation(line: 97, column: 18, scope: !1178)
!1185 = !DILocation(line: 97, column: 5, scope: !1178)
!1186 = !DILocation(line: 97, column: 10, scope: !1178)
!1187 = !DILocation(line: 98, column: 13, scope: !1178)
!1188 = !DILocation(line: 98, column: 27, scope: !1178)
!1189 = !DILocation(line: 98, column: 24, scope: !1178)
!1190 = !DILocation(line: 98, column: 5, scope: !1178)
!1191 = !DILocation(line: 98, column: 10, scope: !1178)
!1192 = !DILocation(line: 99, column: 27, scope: !1178)
!1193 = !DILocation(line: 99, column: 24, scope: !1178)
!1194 = !DILocation(line: 99, column: 5, scope: !1178)
!1195 = !DILocation(line: 99, column: 10, scope: !1178)
!1196 = !DILocation(line: 100, column: 18, scope: !1178)
!1197 = !DILocation(line: 100, column: 5, scope: !1178)
!1198 = !DILocation(line: 100, column: 10, scope: !1178)
!1199 = !DILocation(line: 101, column: 13, scope: !1178)
!1200 = !DILocation(line: 101, column: 27, scope: !1178)
!1201 = !DILocation(line: 101, column: 24, scope: !1178)
!1202 = !DILocation(line: 101, column: 5, scope: !1178)
!1203 = !DILocation(line: 101, column: 10, scope: !1178)
!1204 = !DILocation(line: 102, column: 18, scope: !1178)
!1205 = !DILocation(line: 102, column: 5, scope: !1178)
!1206 = !DILocation(line: 102, column: 10, scope: !1178)
!1207 = !DILocalVariable(name: "j", scope: !1162, file: !1078, line: 92, type: !14)
!1208 = !DILocation(line: 105, column: 10, scope: !1209)
!1209 = distinct !DILexicalBlock(scope: !1178, file: !1078, line: 105, column: 5)
!1210 = !DILocation(line: 105, scope: !1209)
!1211 = !DILocation(line: 105, column: 19, scope: !1212)
!1212 = distinct !DILexicalBlock(scope: !1209, file: !1078, line: 105, column: 5)
!1213 = !DILocation(line: 105, column: 5, scope: !1209)
!1214 = !DILocation(line: 106, column: 37, scope: !1212)
!1215 = !DILocation(line: 106, column: 42, scope: !1212)
!1216 = !DILocation(line: 106, column: 48, scope: !1212)
!1217 = !DILocation(line: 106, column: 58, scope: !1212)
!1218 = !DILocation(line: 106, column: 64, scope: !1212)
!1219 = !DILocation(line: 106, column: 25, scope: !1212)
!1220 = !DILocation(line: 106, column: 14, scope: !1212)
!1221 = !DILocation(line: 106, column: 18, scope: !1212)
!1222 = !DILocation(line: 106, column: 7, scope: !1212)
!1223 = !DILocation(line: 106, column: 23, scope: !1212)
!1224 = !DILocation(line: 105, column: 25, scope: !1212)
!1225 = !DILocation(line: 105, column: 5, scope: !1212)
!1226 = distinct !{!1226, !1213, !1227, !105}
!1227 = !DILocation(line: 106, column: 67, scope: !1209)
!1228 = !DILocation(line: 103, column: 7, scope: !1178)
!1229 = !DILocation(line: 94, column: 33, scope: !1175)
!1230 = !DILocation(line: 94, column: 3, scope: !1175)
!1231 = distinct !{!1231, !1176, !1232, !105}
!1232 = !DILocation(line: 107, column: 3, scope: !1172)
!1233 = !DILocation(line: 111, column: 1, scope: !1162)
!1234 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_tobytes", scope: !1078, file: !1078, line: 122, type: !1079, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1235 = !DILocalVariable(name: "r", arg: 1, scope: !1234, file: !1078, line: 122, type: !6)
!1236 = !DILocation(line: 0, scope: !1234)
!1237 = !DILocalVariable(name: "a", arg: 2, scope: !1234, file: !1078, line: 122, type: !1081)
!1238 = !DILocalVariable(name: "i", scope: !1234, file: !1078, line: 123, type: !14)
!1239 = !DILocation(line: 126, column: 8, scope: !1240)
!1240 = distinct !DILexicalBlock(scope: !1234, file: !1078, line: 126, column: 3)
!1241 = !DILocation(line: 126, scope: !1240)
!1242 = !DILocation(line: 126, column: 17, scope: !1243)
!1243 = distinct !DILexicalBlock(scope: !1240, file: !1078, line: 126, column: 3)
!1244 = !DILocation(line: 126, column: 3, scope: !1240)
!1245 = !DILocation(line: 128, column: 17, scope: !1246)
!1246 = distinct !DILexicalBlock(scope: !1243, file: !1078, line: 126, column: 37)
!1247 = !DILocation(line: 128, column: 10, scope: !1246)
!1248 = !DILocalVariable(name: "t0", scope: !1234, file: !1078, line: 124, type: !60)
!1249 = !DILocation(line: 129, column: 31, scope: !1246)
!1250 = !DILocation(line: 129, column: 8, scope: !1246)
!1251 = !DILocation(line: 130, column: 17, scope: !1246)
!1252 = !DILocation(line: 130, column: 21, scope: !1246)
!1253 = !DILocation(line: 130, column: 10, scope: !1246)
!1254 = !DILocalVariable(name: "t1", scope: !1234, file: !1078, line: 124, type: !60)
!1255 = !DILocation(line: 131, column: 31, scope: !1246)
!1256 = !DILocation(line: 131, column: 8, scope: !1246)
!1257 = !DILocation(line: 132, column: 20, scope: !1246)
!1258 = !DILocation(line: 132, column: 9, scope: !1246)
!1259 = !DILocation(line: 132, column: 5, scope: !1246)
!1260 = !DILocation(line: 132, column: 18, scope: !1246)
!1261 = !DILocation(line: 133, column: 24, scope: !1246)
!1262 = !DILocation(line: 133, column: 33, scope: !1246)
!1263 = !DILocation(line: 133, column: 36, scope: !1246)
!1264 = !DILocation(line: 133, column: 30, scope: !1246)
!1265 = !DILocation(line: 133, column: 9, scope: !1246)
!1266 = !DILocation(line: 133, column: 5, scope: !1246)
!1267 = !DILocation(line: 133, column: 18, scope: !1246)
!1268 = !DILocation(line: 134, column: 24, scope: !1246)
!1269 = !DILocation(line: 134, column: 20, scope: !1246)
!1270 = !DILocation(line: 134, column: 9, scope: !1246)
!1271 = !DILocation(line: 134, column: 5, scope: !1246)
!1272 = !DILocation(line: 134, column: 18, scope: !1246)
!1273 = !DILocation(line: 126, column: 33, scope: !1243)
!1274 = !DILocation(line: 126, column: 3, scope: !1243)
!1275 = distinct !{!1275, !1244, !1276, !105}
!1276 = !DILocation(line: 135, column: 3, scope: !1240)
!1277 = !DILocation(line: 136, column: 1, scope: !1234)
!1278 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_frombytes", scope: !1078, file: !1078, line: 148, type: !1163, scopeLine: 148, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1279 = !DILocalVariable(name: "r", arg: 1, scope: !1278, file: !1078, line: 148, type: !629)
!1280 = !DILocation(line: 0, scope: !1278)
!1281 = !DILocalVariable(name: "a", arg: 2, scope: !1278, file: !1078, line: 148, type: !232)
!1282 = !DILocalVariable(name: "i", scope: !1278, file: !1078, line: 149, type: !14)
!1283 = !DILocation(line: 150, column: 8, scope: !1284)
!1284 = distinct !DILexicalBlock(scope: !1278, file: !1078, line: 150, column: 3)
!1285 = !DILocation(line: 150, scope: !1284)
!1286 = !DILocation(line: 150, column: 17, scope: !1287)
!1287 = distinct !DILexicalBlock(scope: !1284, file: !1078, line: 150, column: 3)
!1288 = !DILocation(line: 150, column: 3, scope: !1284)
!1289 = !DILocation(line: 151, column: 25, scope: !1290)
!1290 = distinct !DILexicalBlock(scope: !1287, file: !1078, line: 150, column: 37)
!1291 = !DILocation(line: 151, column: 21, scope: !1290)
!1292 = !DILocation(line: 151, column: 57, scope: !1290)
!1293 = !DILocation(line: 151, column: 53, scope: !1290)
!1294 = !DILocation(line: 151, column: 43, scope: !1290)
!1295 = !DILocation(line: 151, column: 66, scope: !1290)
!1296 = !DILocation(line: 151, column: 73, scope: !1290)
!1297 = !DILocation(line: 151, column: 12, scope: !1290)
!1298 = !DILocation(line: 151, column: 5, scope: !1290)
!1299 = !DILocation(line: 151, column: 17, scope: !1290)
!1300 = !DILocation(line: 153, column: 15, scope: !1290)
!1301 = !DILocation(line: 153, column: 11, scope: !1290)
!1302 = !DILocation(line: 153, column: 24, scope: !1290)
!1303 = !DILocation(line: 153, column: 47, scope: !1290)
!1304 = !DILocation(line: 153, column: 43, scope: !1290)
!1305 = !DILocation(line: 153, column: 33, scope: !1290)
!1306 = !DILocation(line: 153, column: 56, scope: !1290)
!1307 = !DILocation(line: 153, column: 30, scope: !1290)
!1308 = !DILocation(line: 152, column: 12, scope: !1290)
!1309 = !DILocation(line: 152, column: 16, scope: !1290)
!1310 = !DILocation(line: 152, column: 5, scope: !1290)
!1311 = !DILocation(line: 152, column: 21, scope: !1290)
!1312 = !DILocation(line: 150, column: 33, scope: !1287)
!1313 = !DILocation(line: 150, column: 3, scope: !1287)
!1314 = distinct !{!1314, !1288, !1315, !105}
!1315 = !DILocation(line: 154, column: 3, scope: !1284)
!1316 = !DILocation(line: 155, column: 1, scope: !1278)
!1317 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_frommsg", scope: !1078, file: !1078, line: 165, type: !1163, scopeLine: 165, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1318 = !DILocalVariable(name: "r", arg: 1, scope: !1317, file: !1078, line: 165, type: !629)
!1319 = !DILocation(line: 0, scope: !1317)
!1320 = !DILocalVariable(name: "msg", arg: 2, scope: !1317, file: !1078, line: 165, type: !232)
!1321 = !DILocalVariable(name: "i", scope: !1317, file: !1078, line: 166, type: !14)
!1322 = !DILocation(line: 172, column: 8, scope: !1323)
!1323 = distinct !DILexicalBlock(scope: !1317, file: !1078, line: 172, column: 3)
!1324 = !DILocation(line: 172, scope: !1323)
!1325 = !DILocation(line: 172, column: 17, scope: !1326)
!1326 = distinct !DILexicalBlock(scope: !1323, file: !1078, line: 172, column: 3)
!1327 = !DILocation(line: 172, column: 3, scope: !1323)
!1328 = !DILocation(line: 173, column: 5, scope: !1329)
!1329 = distinct !DILexicalBlock(scope: !1330, file: !1078, line: 173, column: 5)
!1330 = distinct !DILexicalBlock(scope: !1326, file: !1078, line: 172, column: 37)
!1331 = !DILocation(line: 173, scope: !1329)
!1332 = !DILocalVariable(name: "j", scope: !1317, file: !1078, line: 166, type: !14)
!1333 = !DILocation(line: 173, column: 19, scope: !1334)
!1334 = distinct !DILexicalBlock(scope: !1329, file: !1078, line: 173, column: 5)
!1335 = !DILocation(line: 174, column: 14, scope: !1336)
!1336 = distinct !DILexicalBlock(scope: !1334, file: !1078, line: 173, column: 29)
!1337 = !DILocation(line: 174, column: 18, scope: !1336)
!1338 = !DILocation(line: 174, column: 7, scope: !1336)
!1339 = !DILocation(line: 174, column: 23, scope: !1336)
!1340 = !DILocation(line: 175, column: 23, scope: !1336)
!1341 = !DILocation(line: 175, column: 31, scope: !1336)
!1342 = !DILocation(line: 175, column: 58, scope: !1336)
!1343 = !DILocation(line: 175, column: 65, scope: !1336)
!1344 = !DILocation(line: 175, column: 57, scope: !1336)
!1345 = !DILocation(line: 175, column: 7, scope: !1336)
!1346 = !DILocation(line: 173, column: 25, scope: !1334)
!1347 = !DILocation(line: 173, column: 5, scope: !1334)
!1348 = distinct !{!1348, !1328, !1349, !105}
!1349 = !DILocation(line: 176, column: 5, scope: !1329)
!1350 = !DILocation(line: 172, column: 33, scope: !1326)
!1351 = !DILocation(line: 172, column: 3, scope: !1326)
!1352 = distinct !{!1352, !1327, !1353, !105}
!1353 = !DILocation(line: 177, column: 3, scope: !1323)
!1354 = !DILocation(line: 178, column: 1, scope: !1317)
!1355 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_tomsg", scope: !1078, file: !1078, line: 188, type: !1079, scopeLine: 188, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1356 = !DILocalVariable(name: "msg", arg: 1, scope: !1355, file: !1078, line: 188, type: !6)
!1357 = !DILocation(line: 0, scope: !1355)
!1358 = !DILocalVariable(name: "a", arg: 2, scope: !1355, file: !1078, line: 188, type: !1081)
!1359 = !DILocalVariable(name: "i", scope: !1355, file: !1078, line: 189, type: !14)
!1360 = !DILocation(line: 192, column: 8, scope: !1361)
!1361 = distinct !DILexicalBlock(scope: !1355, file: !1078, line: 192, column: 3)
!1362 = !DILocation(line: 192, scope: !1361)
!1363 = !DILocation(line: 192, column: 17, scope: !1364)
!1364 = distinct !DILexicalBlock(scope: !1361, file: !1078, line: 192, column: 3)
!1365 = !DILocation(line: 192, column: 3, scope: !1361)
!1366 = !DILocation(line: 193, column: 5, scope: !1367)
!1367 = distinct !DILexicalBlock(scope: !1364, file: !1078, line: 192, column: 37)
!1368 = !DILocation(line: 193, column: 12, scope: !1367)
!1369 = !DILocalVariable(name: "j", scope: !1355, file: !1078, line: 189, type: !14)
!1370 = !DILocation(line: 194, column: 10, scope: !1371)
!1371 = distinct !DILexicalBlock(scope: !1367, file: !1078, line: 194, column: 5)
!1372 = !DILocation(line: 194, scope: !1371)
!1373 = !DILocation(line: 194, column: 19, scope: !1374)
!1374 = distinct !DILexicalBlock(scope: !1371, file: !1078, line: 194, column: 5)
!1375 = !DILocation(line: 194, column: 5, scope: !1371)
!1376 = !DILocation(line: 195, column: 18, scope: !1377)
!1377 = distinct !DILexicalBlock(scope: !1374, file: !1078, line: 194, column: 29)
!1378 = !DILocation(line: 195, column: 22, scope: !1377)
!1379 = !DILocation(line: 195, column: 11, scope: !1377)
!1380 = !DILocalVariable(name: "t", scope: !1355, file: !1078, line: 190, type: !65)
!1381 = !DILocation(line: 200, column: 9, scope: !1377)
!1382 = !DILocation(line: 201, column: 9, scope: !1377)
!1383 = !DILocation(line: 202, column: 9, scope: !1377)
!1384 = !DILocation(line: 203, column: 19, scope: !1377)
!1385 = !DILocation(line: 203, column: 7, scope: !1377)
!1386 = !DILocation(line: 203, column: 14, scope: !1377)
!1387 = !DILocation(line: 194, column: 25, scope: !1374)
!1388 = !DILocation(line: 194, column: 5, scope: !1374)
!1389 = distinct !{!1389, !1375, !1390, !105}
!1390 = !DILocation(line: 204, column: 5, scope: !1371)
!1391 = !DILocation(line: 192, column: 33, scope: !1364)
!1392 = !DILocation(line: 192, column: 3, scope: !1364)
!1393 = distinct !{!1393, !1365, !1394, !105}
!1394 = !DILocation(line: 205, column: 3, scope: !1361)
!1395 = !DILocation(line: 206, column: 1, scope: !1355)
!1396 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_getnoise_eta1", scope: !1078, file: !1078, line: 220, type: !1397, scopeLine: 221, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1397 = !DISubroutineType(types: !1398)
!1398 = !{null, !629, !232, !7}
!1399 = !DILocalVariable(name: "r", arg: 1, scope: !1396, file: !1078, line: 220, type: !629)
!1400 = !DILocation(line: 0, scope: !1396)
!1401 = !DILocalVariable(name: "seed", arg: 2, scope: !1396, file: !1078, line: 220, type: !232)
!1402 = !DILocalVariable(name: "nonce", arg: 3, scope: !1396, file: !1078, line: 221, type: !7)
!1403 = !DILocalVariable(name: "buf", scope: !1396, file: !1078, line: 222, type: !1404)
!1404 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1024, elements: !39)
!1405 = !DILocation(line: 222, column: 11, scope: !1396)
!1406 = !DILocation(line: 223, column: 3, scope: !1396)
!1407 = !DILocation(line: 224, column: 3, scope: !1396)
!1408 = !DILocation(line: 225, column: 1, scope: !1396)
!1409 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_getnoise_eta2", scope: !1078, file: !1078, line: 239, type: !1397, scopeLine: 240, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1410 = !DILocalVariable(name: "r", arg: 1, scope: !1409, file: !1078, line: 239, type: !629)
!1411 = !DILocation(line: 0, scope: !1409)
!1412 = !DILocalVariable(name: "seed", arg: 2, scope: !1409, file: !1078, line: 239, type: !232)
!1413 = !DILocalVariable(name: "nonce", arg: 3, scope: !1409, file: !1078, line: 240, type: !7)
!1414 = !DILocalVariable(name: "buf", scope: !1409, file: !1078, line: 241, type: !1404)
!1415 = !DILocation(line: 241, column: 11, scope: !1409)
!1416 = !DILocation(line: 242, column: 3, scope: !1409)
!1417 = !DILocation(line: 243, column: 3, scope: !1409)
!1418 = !DILocation(line: 244, column: 1, scope: !1409)
!1419 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_ntt", scope: !1078, file: !1078, line: 256, type: !1420, scopeLine: 256, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1420 = !DISubroutineType(types: !1421)
!1421 = !{null, !629}
!1422 = !DILocalVariable(name: "r", arg: 1, scope: !1419, file: !1078, line: 256, type: !629)
!1423 = !DILocation(line: 0, scope: !1419)
!1424 = !DILocation(line: 257, column: 3, scope: !1419)
!1425 = !DILocation(line: 258, column: 3, scope: !1419)
!1426 = !DILocation(line: 259, column: 1, scope: !1419)
!1427 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_reduce", scope: !1078, file: !1078, line: 314, type: !1420, scopeLine: 314, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1428 = !DILocalVariable(name: "r", arg: 1, scope: !1427, file: !1078, line: 314, type: !629)
!1429 = !DILocation(line: 0, scope: !1427)
!1430 = !DILocalVariable(name: "i", scope: !1427, file: !1078, line: 315, type: !14)
!1431 = !DILocation(line: 316, column: 8, scope: !1432)
!1432 = distinct !DILexicalBlock(scope: !1427, file: !1078, line: 316, column: 3)
!1433 = !DILocation(line: 316, scope: !1432)
!1434 = !DILocation(line: 316, column: 17, scope: !1435)
!1435 = distinct !DILexicalBlock(scope: !1432, file: !1078, line: 316, column: 3)
!1436 = !DILocation(line: 316, column: 3, scope: !1432)
!1437 = !DILocation(line: 317, column: 30, scope: !1435)
!1438 = !DILocation(line: 317, column: 15, scope: !1435)
!1439 = !DILocation(line: 317, column: 5, scope: !1435)
!1440 = !DILocation(line: 317, column: 13, scope: !1435)
!1441 = !DILocation(line: 316, column: 29, scope: !1435)
!1442 = !DILocation(line: 316, column: 3, scope: !1435)
!1443 = distinct !{!1443, !1436, !1444, !105}
!1444 = !DILocation(line: 317, column: 37, scope: !1432)
!1445 = !DILocation(line: 318, column: 1, scope: !1427)
!1446 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_invntt_tomont", scope: !1078, file: !1078, line: 271, type: !1420, scopeLine: 271, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1447 = !DILocalVariable(name: "r", arg: 1, scope: !1446, file: !1078, line: 271, type: !629)
!1448 = !DILocation(line: 0, scope: !1446)
!1449 = !DILocation(line: 271, column: 36, scope: !1446)
!1450 = !DILocation(line: 271, column: 48, scope: !1446)
!1451 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_basemul_montgomery", scope: !1078, file: !1078, line: 282, type: !1452, scopeLine: 282, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1452 = !DISubroutineType(types: !1453)
!1453 = !{null, !629, !1081, !1081}
!1454 = !DILocalVariable(name: "r", arg: 1, scope: !1451, file: !1078, line: 282, type: !629)
!1455 = !DILocation(line: 0, scope: !1451)
!1456 = !DILocalVariable(name: "a", arg: 2, scope: !1451, file: !1078, line: 282, type: !1081)
!1457 = !DILocalVariable(name: "b", arg: 3, scope: !1451, file: !1078, line: 282, type: !1081)
!1458 = !DILocalVariable(name: "i", scope: !1451, file: !1078, line: 283, type: !14)
!1459 = !DILocation(line: 284, column: 8, scope: !1460)
!1460 = distinct !DILexicalBlock(scope: !1451, file: !1078, line: 284, column: 3)
!1461 = !DILocation(line: 284, scope: !1460)
!1462 = !DILocation(line: 284, column: 17, scope: !1463)
!1463 = distinct !DILexicalBlock(scope: !1460, file: !1078, line: 284, column: 3)
!1464 = !DILocation(line: 284, column: 3, scope: !1460)
!1465 = !DILocation(line: 285, column: 21, scope: !1466)
!1466 = distinct !DILexicalBlock(scope: !1463, file: !1078, line: 284, column: 37)
!1467 = !DILocation(line: 285, column: 14, scope: !1466)
!1468 = !DILocation(line: 285, column: 35, scope: !1466)
!1469 = !DILocation(line: 285, column: 28, scope: !1466)
!1470 = !DILocation(line: 285, column: 49, scope: !1466)
!1471 = !DILocation(line: 285, column: 42, scope: !1466)
!1472 = !DILocation(line: 285, column: 64, scope: !1466)
!1473 = !DILocation(line: 285, column: 55, scope: !1466)
!1474 = !DILocation(line: 285, column: 5, scope: !1466)
!1475 = !DILocation(line: 286, column: 21, scope: !1466)
!1476 = !DILocation(line: 286, column: 25, scope: !1466)
!1477 = !DILocation(line: 286, column: 14, scope: !1466)
!1478 = !DILocation(line: 286, column: 39, scope: !1466)
!1479 = !DILocation(line: 286, column: 43, scope: !1466)
!1480 = !DILocation(line: 286, column: 32, scope: !1466)
!1481 = !DILocation(line: 286, column: 57, scope: !1466)
!1482 = !DILocation(line: 286, column: 61, scope: !1466)
!1483 = !DILocation(line: 286, column: 50, scope: !1466)
!1484 = !DILocation(line: 287, column: 23, scope: !1466)
!1485 = !DILocation(line: 287, column: 14, scope: !1466)
!1486 = !DILocation(line: 287, column: 13, scope: !1466)
!1487 = !DILocation(line: 286, column: 5, scope: !1466)
!1488 = !DILocation(line: 284, column: 33, scope: !1463)
!1489 = !DILocation(line: 284, column: 3, scope: !1463)
!1490 = distinct !{!1490, !1464, !1491, !105}
!1491 = !DILocation(line: 288, column: 3, scope: !1460)
!1492 = !DILocation(line: 289, column: 1, scope: !1451)
!1493 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_tomont", scope: !1078, file: !1078, line: 299, type: !1420, scopeLine: 299, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1494 = !DILocalVariable(name: "r", arg: 1, scope: !1493, file: !1078, line: 299, type: !629)
!1495 = !DILocation(line: 0, scope: !1493)
!1496 = !DILocalVariable(name: "f", scope: !1493, file: !1078, line: 301, type: !35)
!1497 = !DILocalVariable(name: "i", scope: !1493, file: !1078, line: 300, type: !14)
!1498 = !DILocation(line: 302, column: 8, scope: !1499)
!1499 = distinct !DILexicalBlock(scope: !1493, file: !1078, line: 302, column: 3)
!1500 = !DILocation(line: 302, scope: !1499)
!1501 = !DILocation(line: 302, column: 17, scope: !1502)
!1502 = distinct !DILexicalBlock(scope: !1499, file: !1078, line: 302, column: 3)
!1503 = !DILocation(line: 302, column: 3, scope: !1499)
!1504 = !DILocation(line: 303, column: 42, scope: !1502)
!1505 = !DILocation(line: 303, column: 33, scope: !1502)
!1506 = !DILocation(line: 303, column: 50, scope: !1502)
!1507 = !DILocation(line: 303, column: 15, scope: !1502)
!1508 = !DILocation(line: 303, column: 5, scope: !1502)
!1509 = !DILocation(line: 303, column: 13, scope: !1502)
!1510 = !DILocation(line: 302, column: 29, scope: !1502)
!1511 = !DILocation(line: 302, column: 3, scope: !1502)
!1512 = distinct !{!1512, !1503, !1513, !105}
!1513 = !DILocation(line: 303, column: 53, scope: !1499)
!1514 = !DILocation(line: 304, column: 1, scope: !1493)
!1515 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_add", scope: !1078, file: !1078, line: 329, type: !1452, scopeLine: 329, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1516 = !DILocalVariable(name: "r", arg: 1, scope: !1515, file: !1078, line: 329, type: !629)
!1517 = !DILocation(line: 0, scope: !1515)
!1518 = !DILocalVariable(name: "a", arg: 2, scope: !1515, file: !1078, line: 329, type: !1081)
!1519 = !DILocalVariable(name: "b", arg: 3, scope: !1515, file: !1078, line: 329, type: !1081)
!1520 = !DILocalVariable(name: "i", scope: !1515, file: !1078, line: 330, type: !14)
!1521 = !DILocation(line: 331, column: 8, scope: !1522)
!1522 = distinct !DILexicalBlock(scope: !1515, file: !1078, line: 331, column: 3)
!1523 = !DILocation(line: 331, scope: !1522)
!1524 = !DILocation(line: 331, column: 17, scope: !1525)
!1525 = distinct !DILexicalBlock(scope: !1522, file: !1078, line: 331, column: 3)
!1526 = !DILocation(line: 331, column: 3, scope: !1522)
!1527 = !DILocation(line: 332, column: 15, scope: !1525)
!1528 = !DILocation(line: 332, column: 25, scope: !1525)
!1529 = !DILocation(line: 332, column: 23, scope: !1525)
!1530 = !DILocation(line: 332, column: 5, scope: !1525)
!1531 = !DILocation(line: 332, column: 13, scope: !1525)
!1532 = !DILocation(line: 331, column: 29, scope: !1525)
!1533 = !DILocation(line: 331, column: 3, scope: !1525)
!1534 = distinct !{!1534, !1526, !1535, !105}
!1535 = !DILocation(line: 332, column: 31, scope: !1522)
!1536 = !DILocation(line: 333, column: 1, scope: !1515)
!1537 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_sub", scope: !1078, file: !1078, line: 344, type: !1452, scopeLine: 344, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1538 = !DILocalVariable(name: "r", arg: 1, scope: !1537, file: !1078, line: 344, type: !629)
!1539 = !DILocation(line: 0, scope: !1537)
!1540 = !DILocalVariable(name: "a", arg: 2, scope: !1537, file: !1078, line: 344, type: !1081)
!1541 = !DILocalVariable(name: "b", arg: 3, scope: !1537, file: !1078, line: 344, type: !1081)
!1542 = !DILocalVariable(name: "i", scope: !1537, file: !1078, line: 345, type: !14)
!1543 = !DILocation(line: 346, column: 8, scope: !1544)
!1544 = distinct !DILexicalBlock(scope: !1537, file: !1078, line: 346, column: 3)
!1545 = !DILocation(line: 346, scope: !1544)
!1546 = !DILocation(line: 346, column: 17, scope: !1547)
!1547 = distinct !DILexicalBlock(scope: !1544, file: !1078, line: 346, column: 3)
!1548 = !DILocation(line: 346, column: 3, scope: !1544)
!1549 = !DILocation(line: 347, column: 15, scope: !1547)
!1550 = !DILocation(line: 347, column: 25, scope: !1547)
!1551 = !DILocation(line: 347, column: 23, scope: !1547)
!1552 = !DILocation(line: 347, column: 5, scope: !1547)
!1553 = !DILocation(line: 347, column: 13, scope: !1547)
!1554 = !DILocation(line: 346, column: 29, scope: !1547)
!1555 = !DILocation(line: 346, column: 3, scope: !1547)
!1556 = distinct !{!1556, !1548, !1557, !105}
!1557 = !DILocation(line: 347, column: 31, scope: !1544)
!1558 = !DILocation(line: 348, column: 1, scope: !1537)
!1559 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_ntt", scope: !33, file: !33, line: 80, type: !1560, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, retainedNodes: !24)
!1560 = !DISubroutineType(types: !1561)
!1561 = !{null, !398}
!1562 = !DILocalVariable(name: "r", arg: 1, scope: !1559, file: !33, line: 80, type: !398)
!1563 = !DILocation(line: 0, scope: !1559)
!1564 = !DILocalVariable(name: "k", scope: !1559, file: !33, line: 81, type: !14)
!1565 = !DILocalVariable(name: "len", scope: !1559, file: !33, line: 81, type: !14)
!1566 = !DILocation(line: 85, column: 7, scope: !1567)
!1567 = distinct !DILexicalBlock(scope: !1559, file: !33, line: 85, column: 3)
!1568 = !DILocation(line: 85, scope: !1567)
!1569 = !DILocation(line: 84, column: 5, scope: !1559)
!1570 = !DILocation(line: 85, column: 22, scope: !1571)
!1571 = distinct !DILexicalBlock(scope: !1567, file: !33, line: 85, column: 3)
!1572 = !DILocation(line: 85, column: 3, scope: !1567)
!1573 = !DILocation(line: 86, column: 5, scope: !1574)
!1574 = distinct !DILexicalBlock(scope: !1575, file: !33, line: 86, column: 5)
!1575 = distinct !DILexicalBlock(scope: !1571, file: !33, line: 85, column: 39)
!1576 = !DILocation(line: 86, scope: !1574)
!1577 = !DILocalVariable(name: "start", scope: !1559, file: !33, line: 81, type: !14)
!1578 = !DILocation(line: 86, column: 26, scope: !1579)
!1579 = distinct !DILexicalBlock(scope: !1574, file: !33, line: 86, column: 5)
!1580 = !DILocation(line: 87, column: 14, scope: !1581)
!1581 = distinct !DILexicalBlock(scope: !1579, file: !33, line: 86, column: 50)
!1582 = !DILocalVariable(name: "zeta", scope: !1559, file: !33, line: 82, type: !36)
!1583 = !DILocalVariable(name: "j", scope: !1559, file: !33, line: 81, type: !14)
!1584 = !DILocation(line: 88, column: 11, scope: !1585)
!1585 = distinct !DILexicalBlock(scope: !1581, file: !33, line: 88, column: 7)
!1586 = !DILocation(line: 88, scope: !1585)
!1587 = !DILocation(line: 88, column: 32, scope: !1588)
!1588 = distinct !DILexicalBlock(scope: !1585, file: !33, line: 88, column: 7)
!1589 = !DILocation(line: 88, column: 24, scope: !1588)
!1590 = !DILocation(line: 88, column: 7, scope: !1585)
!1591 = !DILocation(line: 89, column: 25, scope: !1592)
!1592 = distinct !DILexicalBlock(scope: !1588, file: !33, line: 88, column: 44)
!1593 = !DILocation(line: 89, column: 13, scope: !1592)
!1594 = !DILocalVariable(name: "t", scope: !1559, file: !33, line: 82, type: !36)
!1595 = !DILocation(line: 90, column: 22, scope: !1592)
!1596 = !DILocation(line: 90, column: 27, scope: !1592)
!1597 = !DILocation(line: 90, column: 9, scope: !1592)
!1598 = !DILocation(line: 90, column: 20, scope: !1592)
!1599 = !DILocation(line: 91, column: 16, scope: !1592)
!1600 = !DILocation(line: 91, column: 21, scope: !1592)
!1601 = !DILocation(line: 91, column: 9, scope: !1592)
!1602 = !DILocation(line: 91, column: 14, scope: !1592)
!1603 = !DILocation(line: 88, column: 40, scope: !1588)
!1604 = !DILocation(line: 88, column: 7, scope: !1588)
!1605 = distinct !{!1605, !1590, !1606, !105}
!1606 = !DILocation(line: 92, column: 7, scope: !1585)
!1607 = !DILocation(line: 87, column: 21, scope: !1581)
!1608 = !DILocation(line: 86, column: 43, scope: !1579)
!1609 = !DILocation(line: 86, column: 5, scope: !1579)
!1610 = distinct !{!1610, !1573, !1611, !105}
!1611 = !DILocation(line: 93, column: 5, scope: !1574)
!1612 = !DILocation(line: 85, column: 32, scope: !1571)
!1613 = !DILocation(line: 85, column: 3, scope: !1571)
!1614 = distinct !{!1614, !1572, !1615, !105}
!1615 = !DILocation(line: 94, column: 3, scope: !1567)
!1616 = !DILocation(line: 95, column: 1, scope: !1559)
!1617 = distinct !DISubprogram(name: "fqmul", scope: !33, file: !33, line: 68, type: !1618, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !28, retainedNodes: !24)
!1618 = !DISubroutineType(types: !1619)
!1619 = !{!36, !36, !36}
!1620 = !DILocalVariable(name: "a", arg: 1, scope: !1617, file: !33, line: 68, type: !36)
!1621 = !DILocation(line: 0, scope: !1617)
!1622 = !DILocalVariable(name: "b", arg: 2, scope: !1617, file: !33, line: 68, type: !36)
!1623 = !DILocation(line: 69, column: 28, scope: !1617)
!1624 = !DILocation(line: 69, column: 39, scope: !1617)
!1625 = !DILocation(line: 69, column: 38, scope: !1617)
!1626 = !DILocation(line: 69, column: 10, scope: !1617)
!1627 = !DILocation(line: 69, column: 3, scope: !1617)
!1628 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_invntt", scope: !33, file: !33, line: 106, type: !1560, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, retainedNodes: !24)
!1629 = !DILocalVariable(name: "r", arg: 1, scope: !1628, file: !33, line: 106, type: !398)
!1630 = !DILocation(line: 0, scope: !1628)
!1631 = !DILocalVariable(name: "f", scope: !1628, file: !33, line: 109, type: !35)
!1632 = !DILocalVariable(name: "k", scope: !1628, file: !33, line: 107, type: !14)
!1633 = !DILocalVariable(name: "len", scope: !1628, file: !33, line: 107, type: !14)
!1634 = !DILocation(line: 112, column: 7, scope: !1635)
!1635 = distinct !DILexicalBlock(scope: !1628, file: !33, line: 112, column: 3)
!1636 = !DILocation(line: 112, scope: !1635)
!1637 = !DILocation(line: 111, column: 5, scope: !1628)
!1638 = !DILocation(line: 112, column: 20, scope: !1639)
!1639 = distinct !DILexicalBlock(scope: !1635, file: !33, line: 112, column: 3)
!1640 = !DILocation(line: 112, column: 3, scope: !1635)
!1641 = !DILocation(line: 113, column: 5, scope: !1642)
!1642 = distinct !DILexicalBlock(scope: !1643, file: !33, line: 113, column: 5)
!1643 = distinct !DILexicalBlock(scope: !1639, file: !33, line: 112, column: 39)
!1644 = !DILocation(line: 124, column: 3, scope: !1645)
!1645 = distinct !DILexicalBlock(scope: !1628, file: !33, line: 124, column: 3)
!1646 = !DILocation(line: 113, scope: !1642)
!1647 = !DILocalVariable(name: "start", scope: !1628, file: !33, line: 107, type: !14)
!1648 = !DILocation(line: 113, column: 26, scope: !1649)
!1649 = distinct !DILexicalBlock(scope: !1642, file: !33, line: 113, column: 5)
!1650 = !DILocation(line: 114, column: 14, scope: !1651)
!1651 = distinct !DILexicalBlock(scope: !1649, file: !33, line: 113, column: 50)
!1652 = !DILocalVariable(name: "zeta", scope: !1628, file: !33, line: 108, type: !36)
!1653 = !DILocalVariable(name: "j", scope: !1628, file: !33, line: 107, type: !14)
!1654 = !DILocation(line: 115, column: 11, scope: !1655)
!1655 = distinct !DILexicalBlock(scope: !1651, file: !33, line: 115, column: 7)
!1656 = !DILocation(line: 115, scope: !1655)
!1657 = !DILocation(line: 115, column: 32, scope: !1658)
!1658 = distinct !DILexicalBlock(scope: !1655, file: !33, line: 115, column: 7)
!1659 = !DILocation(line: 115, column: 24, scope: !1658)
!1660 = !DILocation(line: 115, column: 7, scope: !1655)
!1661 = !DILocation(line: 116, column: 13, scope: !1662)
!1662 = distinct !DILexicalBlock(scope: !1658, file: !33, line: 115, column: 44)
!1663 = !DILocalVariable(name: "t", scope: !1628, file: !33, line: 108, type: !36)
!1664 = !DILocation(line: 117, column: 35, scope: !1662)
!1665 = !DILocation(line: 117, column: 33, scope: !1662)
!1666 = !DILocation(line: 117, column: 16, scope: !1662)
!1667 = !DILocation(line: 117, column: 9, scope: !1662)
!1668 = !DILocation(line: 117, column: 14, scope: !1662)
!1669 = !DILocation(line: 118, column: 22, scope: !1662)
!1670 = !DILocation(line: 118, column: 33, scope: !1662)
!1671 = !DILocation(line: 118, column: 9, scope: !1662)
!1672 = !DILocation(line: 118, column: 20, scope: !1662)
!1673 = !DILocation(line: 119, column: 34, scope: !1662)
!1674 = !DILocation(line: 119, column: 22, scope: !1662)
!1675 = !DILocation(line: 119, column: 9, scope: !1662)
!1676 = !DILocation(line: 119, column: 20, scope: !1662)
!1677 = !DILocation(line: 115, column: 40, scope: !1658)
!1678 = !DILocation(line: 115, column: 7, scope: !1658)
!1679 = distinct !{!1679, !1660, !1680, !105}
!1680 = !DILocation(line: 120, column: 7, scope: !1655)
!1681 = !DILocation(line: 114, column: 21, scope: !1651)
!1682 = !DILocation(line: 113, column: 43, scope: !1649)
!1683 = !DILocation(line: 113, column: 5, scope: !1649)
!1684 = distinct !{!1684, !1641, !1685, !105}
!1685 = !DILocation(line: 121, column: 5, scope: !1642)
!1686 = !DILocation(line: 112, column: 32, scope: !1639)
!1687 = !DILocation(line: 112, column: 3, scope: !1639)
!1688 = distinct !{!1688, !1640, !1689, !105}
!1689 = !DILocation(line: 122, column: 3, scope: !1635)
!1690 = !DILocation(line: 124, scope: !1645)
!1691 = !DILocation(line: 124, column: 16, scope: !1692)
!1692 = distinct !DILexicalBlock(scope: !1645, file: !33, line: 124, column: 3)
!1693 = !DILocation(line: 125, column: 18, scope: !1692)
!1694 = !DILocation(line: 125, column: 12, scope: !1692)
!1695 = !DILocation(line: 125, column: 5, scope: !1692)
!1696 = !DILocation(line: 125, column: 10, scope: !1692)
!1697 = !DILocation(line: 124, column: 24, scope: !1692)
!1698 = !DILocation(line: 124, column: 3, scope: !1692)
!1699 = distinct !{!1699, !1644, !1700, !105}
!1700 = !DILocation(line: 125, column: 25, scope: !1645)
!1701 = !DILocation(line: 126, column: 1, scope: !1628)
!1702 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_basemul", scope: !33, file: !33, line: 139, type: !1703, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, retainedNodes: !24)
!1703 = !DISubroutineType(types: !1704)
!1704 = !{null, !398, !1705, !1705, !36}
!1705 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 32)
!1706 = !DILocalVariable(name: "r", arg: 1, scope: !1702, file: !33, line: 139, type: !398)
!1707 = !DILocation(line: 0, scope: !1702)
!1708 = !DILocalVariable(name: "a", arg: 2, scope: !1702, file: !33, line: 139, type: !1705)
!1709 = !DILocalVariable(name: "b", arg: 3, scope: !1702, file: !33, line: 139, type: !1705)
!1710 = !DILocalVariable(name: "zeta", arg: 4, scope: !1702, file: !33, line: 139, type: !36)
!1711 = !DILocation(line: 141, column: 17, scope: !1702)
!1712 = !DILocation(line: 141, column: 23, scope: !1702)
!1713 = !DILocation(line: 141, column: 11, scope: !1702)
!1714 = !DILocation(line: 141, column: 9, scope: !1702)
!1715 = !DILocation(line: 142, column: 11, scope: !1702)
!1716 = !DILocation(line: 142, column: 9, scope: !1702)
!1717 = !DILocation(line: 143, column: 17, scope: !1702)
!1718 = !DILocation(line: 143, column: 23, scope: !1702)
!1719 = !DILocation(line: 143, column: 11, scope: !1702)
!1720 = !DILocation(line: 143, column: 8, scope: !1702)
!1721 = !DILocation(line: 144, column: 17, scope: !1702)
!1722 = !DILocation(line: 144, column: 23, scope: !1702)
!1723 = !DILocation(line: 144, column: 11, scope: !1702)
!1724 = !DILocation(line: 144, column: 3, scope: !1702)
!1725 = !DILocation(line: 144, column: 9, scope: !1702)
!1726 = !DILocation(line: 145, column: 17, scope: !1702)
!1727 = !DILocation(line: 145, column: 23, scope: !1702)
!1728 = !DILocation(line: 145, column: 11, scope: !1702)
!1729 = !DILocation(line: 145, column: 3, scope: !1702)
!1730 = !DILocation(line: 145, column: 8, scope: !1702)
!1731 = !DILocation(line: 146, column: 1, scope: !1702)
!1732 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_cbd_eta1", scope: !1733, file: !1733, line: 105, type: !1163, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !69, retainedNodes: !24)
!1733 = !DIFile(filename: "../../../ref/cbd.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!1734 = !DILocalVariable(name: "r", arg: 1, scope: !1732, file: !1733, line: 105, type: !629)
!1735 = !DILocation(line: 0, scope: !1732)
!1736 = !DILocalVariable(name: "buf", arg: 2, scope: !1732, file: !1733, line: 105, type: !232)
!1737 = !DILocation(line: 107, column: 3, scope: !1732)
!1738 = !DILocation(line: 113, column: 1, scope: !1732)
!1739 = distinct !DISubprogram(name: "cbd2", scope: !1733, file: !1733, line: 55, type: !1163, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !69, retainedNodes: !24)
!1740 = !DILocalVariable(name: "r", arg: 1, scope: !1739, file: !1733, line: 55, type: !629)
!1741 = !DILocation(line: 0, scope: !1739)
!1742 = !DILocalVariable(name: "buf", arg: 2, scope: !1739, file: !1733, line: 55, type: !232)
!1743 = !DILocalVariable(name: "i", scope: !1739, file: !1733, line: 56, type: !14)
!1744 = !DILocation(line: 60, column: 8, scope: !1745)
!1745 = distinct !DILexicalBlock(scope: !1739, file: !1733, line: 60, column: 3)
!1746 = !DILocation(line: 60, scope: !1745)
!1747 = !DILocation(line: 60, column: 17, scope: !1748)
!1748 = distinct !DILexicalBlock(scope: !1745, file: !1733, line: 60, column: 3)
!1749 = !DILocation(line: 60, column: 3, scope: !1745)
!1750 = !DILocation(line: 61, column: 37, scope: !1751)
!1751 = distinct !DILexicalBlock(scope: !1748, file: !1733, line: 60, column: 37)
!1752 = !DILocation(line: 61, column: 33, scope: !1751)
!1753 = !DILocation(line: 61, column: 9, scope: !1751)
!1754 = !DILocalVariable(name: "t", scope: !1739, file: !1733, line: 57, type: !65)
!1755 = !DILocation(line: 62, column: 11, scope: !1751)
!1756 = !DILocalVariable(name: "d", scope: !1739, file: !1733, line: 57, type: !65)
!1757 = !DILocation(line: 63, column: 13, scope: !1751)
!1758 = !DILocation(line: 63, column: 19, scope: !1751)
!1759 = !DILocation(line: 63, column: 7, scope: !1751)
!1760 = !DILocalVariable(name: "j", scope: !1739, file: !1733, line: 56, type: !14)
!1761 = !DILocation(line: 65, column: 10, scope: !1762)
!1762 = distinct !DILexicalBlock(scope: !1751, file: !1733, line: 65, column: 5)
!1763 = !DILocation(line: 65, scope: !1762)
!1764 = !DILocation(line: 65, column: 19, scope: !1765)
!1765 = distinct !DILexicalBlock(scope: !1762, file: !1733, line: 65, column: 5)
!1766 = !DILocation(line: 65, column: 5, scope: !1762)
!1767 = !DILocation(line: 66, column: 20, scope: !1768)
!1768 = distinct !DILexicalBlock(scope: !1765, file: !1733, line: 65, column: 29)
!1769 = !DILocation(line: 66, column: 14, scope: !1768)
!1770 = !DILocation(line: 66, column: 11, scope: !1768)
!1771 = !DILocalVariable(name: "a", scope: !1739, file: !1733, line: 58, type: !36)
!1772 = !DILocation(line: 67, column: 20, scope: !1768)
!1773 = !DILocation(line: 67, column: 24, scope: !1768)
!1774 = !DILocation(line: 67, column: 14, scope: !1768)
!1775 = !DILocation(line: 67, column: 11, scope: !1768)
!1776 = !DILocalVariable(name: "b", scope: !1739, file: !1733, line: 58, type: !36)
!1777 = !DILocation(line: 68, column: 27, scope: !1768)
!1778 = !DILocation(line: 68, column: 25, scope: !1768)
!1779 = !DILocation(line: 68, column: 14, scope: !1768)
!1780 = !DILocation(line: 68, column: 18, scope: !1768)
!1781 = !DILocation(line: 68, column: 7, scope: !1768)
!1782 = !DILocation(line: 68, column: 23, scope: !1768)
!1783 = !DILocation(line: 65, column: 25, scope: !1765)
!1784 = !DILocation(line: 65, column: 5, scope: !1765)
!1785 = distinct !{!1785, !1766, !1786, !105}
!1786 = !DILocation(line: 69, column: 5, scope: !1762)
!1787 = !DILocation(line: 60, column: 33, scope: !1748)
!1788 = !DILocation(line: 60, column: 3, scope: !1748)
!1789 = distinct !{!1789, !1749, !1790, !105}
!1790 = !DILocation(line: 70, column: 3, scope: !1745)
!1791 = !DILocation(line: 71, column: 1, scope: !1739)
!1792 = distinct !DISubprogram(name: "load32_littleendian", scope: !1733, file: !1733, line: 15, type: !1793, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !69, retainedNodes: !24)
!1793 = !DISubroutineType(types: !1794)
!1794 = !{!65, !232}
!1795 = !DILocalVariable(name: "x", arg: 1, scope: !1792, file: !1733, line: 15, type: !232)
!1796 = !DILocation(line: 0, scope: !1792)
!1797 = !DILocation(line: 17, column: 17, scope: !1792)
!1798 = !DILocation(line: 17, column: 7, scope: !1792)
!1799 = !DILocalVariable(name: "r", scope: !1792, file: !1733, line: 16, type: !65)
!1800 = !DILocation(line: 18, column: 18, scope: !1792)
!1801 = !DILocation(line: 18, column: 8, scope: !1792)
!1802 = !DILocation(line: 18, column: 23, scope: !1792)
!1803 = !DILocation(line: 18, column: 5, scope: !1792)
!1804 = !DILocation(line: 19, column: 18, scope: !1792)
!1805 = !DILocation(line: 19, column: 8, scope: !1792)
!1806 = !DILocation(line: 19, column: 23, scope: !1792)
!1807 = !DILocation(line: 19, column: 5, scope: !1792)
!1808 = !DILocation(line: 20, column: 18, scope: !1792)
!1809 = !DILocation(line: 20, column: 8, scope: !1792)
!1810 = !DILocation(line: 20, column: 23, scope: !1792)
!1811 = !DILocation(line: 20, column: 5, scope: !1792)
!1812 = !DILocation(line: 21, column: 3, scope: !1792)
!1813 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_cbd_eta2", scope: !1733, file: !1733, line: 115, type: !1163, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !69, retainedNodes: !24)
!1814 = !DILocalVariable(name: "r", arg: 1, scope: !1813, file: !1733, line: 115, type: !629)
!1815 = !DILocation(line: 0, scope: !1813)
!1816 = !DILocalVariable(name: "buf", arg: 2, scope: !1813, file: !1733, line: 115, type: !232)
!1817 = !DILocation(line: 117, column: 3, scope: !1813)
!1818 = !DILocation(line: 121, column: 1, scope: !1813)
!1819 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_montgomery_reduce", scope: !1820, file: !1820, line: 16, type: !1821, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !71, retainedNodes: !24)
!1820 = !DIFile(filename: "../../../ref/reduce.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!1821 = !DISubroutineType(types: !72)
!1822 = !DILocalVariable(name: "a", arg: 1, scope: !1819, file: !1820, line: 16, type: !30)
!1823 = !DILocation(line: 0, scope: !1819)
!1824 = !DILocalVariable(name: "t", scope: !1819, file: !1820, line: 18, type: !36)
!1825 = !DILocation(line: 21, column: 12, scope: !1819)
!1826 = !DILocation(line: 21, column: 22, scope: !1819)
!1827 = !DILocation(line: 21, column: 10, scope: !1819)
!1828 = !DILocation(line: 21, column: 32, scope: !1819)
!1829 = !DILocation(line: 21, column: 7, scope: !1819)
!1830 = !DILocation(line: 22, column: 3, scope: !1819)
!1831 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_barrett_reduce", scope: !1820, file: !1820, line: 35, type: !1832, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !71, retainedNodes: !24)
!1832 = !DISubroutineType(types: !1833)
!1833 = !{!36, !36}
!1834 = !DILocalVariable(name: "a", arg: 1, scope: !1831, file: !1820, line: 35, type: !36)
!1835 = !DILocation(line: 0, scope: !1831)
!1836 = !DILocalVariable(name: "v", scope: !1831, file: !1820, line: 37, type: !35)
!1837 = !DILocation(line: 39, column: 20, scope: !1831)
!1838 = !DILocation(line: 39, column: 19, scope: !1831)
!1839 = !DILocation(line: 39, column: 22, scope: !1831)
!1840 = !DILocation(line: 39, column: 33, scope: !1831)
!1841 = !DILocalVariable(name: "t", scope: !1831, file: !1820, line: 36, type: !36)
!1842 = !DILocation(line: 41, column: 10, scope: !1831)
!1843 = !DILocation(line: 41, column: 3, scope: !1831)
!1844 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_verify", scope: !1845, file: !1845, line: 16, type: !1846, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !73, retainedNodes: !24)
!1845 = !DIFile(filename: "../../../ref/verify.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!1846 = !DISubroutineType(types: !1847)
!1847 = !{!25, !232, !232, !12}
!1848 = !DILocalVariable(name: "a", arg: 1, scope: !1844, file: !1845, line: 16, type: !232)
!1849 = !DILocation(line: 0, scope: !1844)
!1850 = !DILocalVariable(name: "b", arg: 2, scope: !1844, file: !1845, line: 16, type: !232)
!1851 = !DILocalVariable(name: "len", arg: 3, scope: !1844, file: !1845, line: 16, type: !12)
!1852 = !DILocalVariable(name: "r", scope: !1844, file: !1845, line: 19, type: !7)
!1853 = !DILocalVariable(name: "i", scope: !1844, file: !1845, line: 18, type: !12)
!1854 = !DILocation(line: 21, column: 7, scope: !1855)
!1855 = distinct !DILexicalBlock(scope: !1844, file: !1845, line: 21, column: 3)
!1856 = !DILocation(line: 21, scope: !1855)
!1857 = !DILocation(line: 21, column: 12, scope: !1858)
!1858 = distinct !DILexicalBlock(scope: !1855, file: !1845, line: 21, column: 3)
!1859 = !DILocation(line: 21, column: 3, scope: !1855)
!1860 = !DILocation(line: 22, column: 10, scope: !1858)
!1861 = !DILocation(line: 22, column: 17, scope: !1858)
!1862 = !DILocation(line: 22, column: 15, scope: !1858)
!1863 = !DILocation(line: 22, column: 7, scope: !1858)
!1864 = !DILocation(line: 21, column: 18, scope: !1858)
!1865 = !DILocation(line: 21, column: 3, scope: !1858)
!1866 = distinct !{!1866, !1859, !1867, !105}
!1867 = !DILocation(line: 22, column: 20, scope: !1855)
!1868 = !DILocation(line: 24, column: 25, scope: !1844)
!1869 = !DILocation(line: 24, column: 10, scope: !1844)
!1870 = !DILocation(line: 24, column: 3, scope: !1844)
!1871 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_cmov", scope: !1845, file: !1845, line: 40, type: !1872, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !73, retainedNodes: !24)
!1872 = !DISubroutineType(types: !1873)
!1873 = !{null, !6, !232, !12, !7}
!1874 = !DILocalVariable(name: "r", arg: 1, scope: !1871, file: !1845, line: 40, type: !6)
!1875 = !DILocation(line: 0, scope: !1871)
!1876 = !DILocalVariable(name: "x", arg: 2, scope: !1871, file: !1845, line: 40, type: !232)
!1877 = !DILocalVariable(name: "len", arg: 3, scope: !1871, file: !1845, line: 40, type: !12)
!1878 = !DILocalVariable(name: "b", arg: 4, scope: !1871, file: !1845, line: 40, type: !7)
!1879 = !DILocation(line: 51, column: 3, scope: !1871)
!1880 = !{i64 1722}
!1881 = !DILocation(line: 54, column: 7, scope: !1871)
!1882 = !DILocalVariable(name: "i", scope: !1871, file: !1845, line: 42, type: !12)
!1883 = !DILocation(line: 55, column: 7, scope: !1884)
!1884 = distinct !DILexicalBlock(scope: !1871, file: !1845, line: 55, column: 3)
!1885 = !DILocation(line: 55, scope: !1884)
!1886 = !DILocation(line: 55, column: 12, scope: !1887)
!1887 = distinct !DILexicalBlock(scope: !1884, file: !1845, line: 55, column: 3)
!1888 = !DILocation(line: 55, column: 3, scope: !1884)
!1889 = !DILocation(line: 56, column: 18, scope: !1887)
!1890 = !DILocation(line: 56, column: 25, scope: !1887)
!1891 = !DILocation(line: 56, column: 23, scope: !1887)
!1892 = !DILocation(line: 56, column: 15, scope: !1887)
!1893 = !DILocation(line: 56, column: 5, scope: !1887)
!1894 = !DILocation(line: 56, column: 10, scope: !1887)
!1895 = !DILocation(line: 55, column: 18, scope: !1887)
!1896 = !DILocation(line: 55, column: 3, scope: !1887)
!1897 = distinct !{!1897, !1888, !1898, !105}
!1898 = !DILocation(line: 56, column: 29, scope: !1884)
!1899 = !DILocation(line: 57, column: 1, scope: !1871)
!1900 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_cmov_int16", scope: !1845, file: !1845, line: 71, type: !1901, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !73, retainedNodes: !24)
!1901 = !DISubroutineType(types: !1902)
!1902 = !{null, !398, !36, !60}
!1903 = !DILocalVariable(name: "r", arg: 1, scope: !1900, file: !1845, line: 71, type: !398)
!1904 = !DILocation(line: 0, scope: !1900)
!1905 = !DILocalVariable(name: "v", arg: 2, scope: !1900, file: !1845, line: 71, type: !36)
!1906 = !DILocalVariable(name: "b", arg: 3, scope: !1900, file: !1845, line: 71, type: !60)
!1907 = !DILocation(line: 73, column: 7, scope: !1900)
!1908 = !DILocation(line: 74, column: 15, scope: !1900)
!1909 = !DILocation(line: 74, column: 19, scope: !1900)
!1910 = !DILocation(line: 74, column: 11, scope: !1900)
!1911 = !DILocation(line: 74, column: 6, scope: !1900)
!1912 = !DILocation(line: 75, column: 1, scope: !1900)
!1913 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_init", scope: !49, file: !49, line: 497, type: !1914, scopeLine: 497, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!1914 = !DISubroutineType(types: !1915)
!1915 = !{null, !1916}
!1916 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !344, size: 32)
!1917 = !DILocalVariable(name: "state", arg: 1, scope: !1913, file: !49, line: 497, type: !1916)
!1918 = !DILocation(line: 0, scope: !1913)
!1919 = !DILocation(line: 498, column: 3, scope: !1913)
!1920 = !DILocation(line: 499, column: 3, scope: !1913)
!1921 = !DILocation(line: 499, column: 29, scope: !1913)
!1922 = !DILocation(line: 500, column: 1, scope: !1913)
!1923 = distinct !DISubprogram(name: "keccak_init", scope: !49, file: !49, line: 340, type: !1924, scopeLine: 340, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!1924 = !DISubroutineType(types: !1925)
!1925 = !{null, !1926}
!1926 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 32)
!1927 = !DILocalVariable(name: "s", arg: 1, scope: !1923, file: !49, line: 340, type: !1926)
!1928 = !DILocation(line: 0, scope: !1923)
!1929 = !DILocalVariable(name: "i", scope: !1923, file: !49, line: 341, type: !14)
!1930 = !DILocation(line: 342, column: 8, scope: !1931)
!1931 = distinct !DILexicalBlock(scope: !1923, file: !49, line: 342, column: 3)
!1932 = !DILocation(line: 342, scope: !1931)
!1933 = !DILocation(line: 342, column: 17, scope: !1934)
!1934 = distinct !DILexicalBlock(scope: !1931, file: !49, line: 342, column: 3)
!1935 = !DILocation(line: 342, column: 3, scope: !1931)
!1936 = !DILocation(line: 343, column: 5, scope: !1934)
!1937 = !DILocation(line: 343, column: 10, scope: !1934)
!1938 = !DILocation(line: 342, column: 24, scope: !1934)
!1939 = !DILocation(line: 342, column: 3, scope: !1934)
!1940 = distinct !{!1940, !1935, !1941, !105}
!1941 = !DILocation(line: 343, column: 12, scope: !1931)
!1942 = !DILocation(line: 344, column: 1, scope: !1923)
!1943 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb", scope: !49, file: !49, line: 512, type: !1944, scopeLine: 512, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!1944 = !DISubroutineType(types: !1945)
!1945 = !{null, !1916, !232, !12}
!1946 = !DILocalVariable(name: "state", arg: 1, scope: !1943, file: !49, line: 512, type: !1916)
!1947 = !DILocation(line: 0, scope: !1943)
!1948 = !DILocalVariable(name: "in", arg: 2, scope: !1943, file: !49, line: 512, type: !232)
!1949 = !DILocalVariable(name: "inlen", arg: 3, scope: !1943, file: !49, line: 512, type: !12)
!1950 = !DILocation(line: 513, column: 53, scope: !1943)
!1951 = !DILocation(line: 513, column: 31, scope: !1943)
!1952 = !DILocation(line: 513, column: 3, scope: !1943)
!1953 = !DILocation(line: 513, column: 29, scope: !1943)
!1954 = !DILocation(line: 515, column: 1, scope: !1943)
!1955 = distinct !DISubprogram(name: "keccak_absorb", scope: !49, file: !49, line: 359, type: !1956, scopeLine: 361, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!1956 = !DISubroutineType(types: !1957)
!1957 = !{!14, !1926, !14, !14, !232, !12}
!1958 = !DILocalVariable(name: "s", arg: 1, scope: !1955, file: !49, line: 359, type: !1926)
!1959 = !DILocation(line: 0, scope: !1955)
!1960 = !DILocalVariable(name: "pos", arg: 2, scope: !1955, file: !49, line: 359, type: !14)
!1961 = !DILocalVariable(name: "r", arg: 3, scope: !1955, file: !49, line: 360, type: !14)
!1962 = !DILocalVariable(name: "in", arg: 4, scope: !1955, file: !49, line: 360, type: !232)
!1963 = !DILocalVariable(name: "inlen", arg: 5, scope: !1955, file: !49, line: 361, type: !12)
!1964 = !DILocation(line: 364, column: 3, scope: !1955)
!1965 = !DILocation(line: 364, column: 14, scope: !1955)
!1966 = !DILocation(line: 364, column: 22, scope: !1955)
!1967 = !DILocation(line: 365, column: 5, scope: !1968)
!1968 = distinct !DILexicalBlock(scope: !1969, file: !49, line: 365, column: 5)
!1969 = distinct !DILexicalBlock(scope: !1955, file: !49, line: 364, column: 28)
!1970 = !DILocation(line: 372, column: 3, scope: !1971)
!1971 = distinct !DILexicalBlock(scope: !1955, file: !49, line: 372, column: 3)
!1972 = !DILocation(line: 365, scope: !1968)
!1973 = !DILocalVariable(name: "i", scope: !1955, file: !49, line: 362, type: !14)
!1974 = !DILocation(line: 365, column: 21, scope: !1975)
!1975 = distinct !DILexicalBlock(scope: !1968, file: !49, line: 365, column: 5)
!1976 = !DILocation(line: 366, column: 29, scope: !1975)
!1977 = !DILocation(line: 366, column: 19, scope: !1975)
!1978 = !DILocation(line: 366, column: 40, scope: !1975)
!1979 = !DILocation(line: 366, column: 35, scope: !1975)
!1980 = !DILocation(line: 366, column: 11, scope: !1975)
!1981 = !DILocation(line: 366, column: 7, scope: !1975)
!1982 = !DILocation(line: 366, column: 16, scope: !1975)
!1983 = !DILocation(line: 366, column: 32, scope: !1975)
!1984 = !DILocation(line: 365, column: 27, scope: !1975)
!1985 = !DILocation(line: 365, column: 5, scope: !1975)
!1986 = distinct !{!1986, !1967, !1987, !105}
!1987 = !DILocation(line: 366, column: 48, scope: !1968)
!1988 = !DILocation(line: 367, column: 16, scope: !1969)
!1989 = !DILocation(line: 367, column: 11, scope: !1969)
!1990 = !DILocation(line: 368, column: 5, scope: !1969)
!1991 = distinct !{!1991, !1964, !1992, !105}
!1992 = !DILocation(line: 370, column: 3, scope: !1955)
!1993 = !DILocation(line: 372, scope: !1971)
!1994 = !DILocation(line: 372, column: 25, scope: !1995)
!1995 = distinct !DILexicalBlock(scope: !1971, file: !49, line: 372, column: 3)
!1996 = !DILocation(line: 372, column: 19, scope: !1995)
!1997 = !DILocation(line: 373, column: 27, scope: !1995)
!1998 = !DILocation(line: 373, column: 17, scope: !1995)
!1999 = !DILocation(line: 373, column: 38, scope: !1995)
!2000 = !DILocation(line: 373, column: 33, scope: !1995)
!2001 = !DILocation(line: 373, column: 9, scope: !1995)
!2002 = !DILocation(line: 373, column: 5, scope: !1995)
!2003 = !DILocation(line: 373, column: 14, scope: !1995)
!2004 = !DILocation(line: 373, column: 30, scope: !1995)
!2005 = !DILocation(line: 372, column: 35, scope: !1995)
!2006 = !DILocation(line: 372, column: 3, scope: !1995)
!2007 = distinct !{!2007, !1970, !2008, !105}
!2008 = !DILocation(line: 373, column: 46, scope: !1971)
!2009 = !DILocation(line: 375, column: 3, scope: !1955)
!2010 = distinct !DISubprogram(name: "KeccakF1600_StatePermute", scope: !49, file: !49, line: 70, type: !1924, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2011 = !DILocalVariable(name: "state", arg: 1, scope: !2010, file: !49, line: 70, type: !1926)
!2012 = !DILocation(line: 0, scope: !2010)
!2013 = !DILocation(line: 87, column: 9, scope: !2010)
!2014 = !DILocalVariable(name: "Aba", scope: !2010, file: !49, line: 73, type: !45)
!2015 = !DILocation(line: 88, column: 9, scope: !2010)
!2016 = !DILocalVariable(name: "Abe", scope: !2010, file: !49, line: 73, type: !45)
!2017 = !DILocation(line: 89, column: 9, scope: !2010)
!2018 = !DILocalVariable(name: "Abi", scope: !2010, file: !49, line: 73, type: !45)
!2019 = !DILocation(line: 90, column: 9, scope: !2010)
!2020 = !DILocalVariable(name: "Abo", scope: !2010, file: !49, line: 73, type: !45)
!2021 = !DILocation(line: 91, column: 9, scope: !2010)
!2022 = !DILocalVariable(name: "Abu", scope: !2010, file: !49, line: 73, type: !45)
!2023 = !DILocation(line: 92, column: 9, scope: !2010)
!2024 = !DILocalVariable(name: "Aga", scope: !2010, file: !49, line: 74, type: !45)
!2025 = !DILocation(line: 93, column: 9, scope: !2010)
!2026 = !DILocalVariable(name: "Age", scope: !2010, file: !49, line: 74, type: !45)
!2027 = !DILocation(line: 94, column: 9, scope: !2010)
!2028 = !DILocalVariable(name: "Agi", scope: !2010, file: !49, line: 74, type: !45)
!2029 = !DILocation(line: 95, column: 9, scope: !2010)
!2030 = !DILocalVariable(name: "Ago", scope: !2010, file: !49, line: 74, type: !45)
!2031 = !DILocation(line: 96, column: 9, scope: !2010)
!2032 = !DILocalVariable(name: "Agu", scope: !2010, file: !49, line: 74, type: !45)
!2033 = !DILocation(line: 97, column: 9, scope: !2010)
!2034 = !DILocalVariable(name: "Aka", scope: !2010, file: !49, line: 75, type: !45)
!2035 = !DILocation(line: 98, column: 9, scope: !2010)
!2036 = !DILocalVariable(name: "Ake", scope: !2010, file: !49, line: 75, type: !45)
!2037 = !DILocation(line: 99, column: 9, scope: !2010)
!2038 = !DILocalVariable(name: "Aki", scope: !2010, file: !49, line: 75, type: !45)
!2039 = !DILocation(line: 100, column: 9, scope: !2010)
!2040 = !DILocalVariable(name: "Ako", scope: !2010, file: !49, line: 75, type: !45)
!2041 = !DILocation(line: 101, column: 9, scope: !2010)
!2042 = !DILocalVariable(name: "Aku", scope: !2010, file: !49, line: 75, type: !45)
!2043 = !DILocation(line: 102, column: 9, scope: !2010)
!2044 = !DILocalVariable(name: "Ama", scope: !2010, file: !49, line: 76, type: !45)
!2045 = !DILocation(line: 103, column: 9, scope: !2010)
!2046 = !DILocalVariable(name: "Ame", scope: !2010, file: !49, line: 76, type: !45)
!2047 = !DILocation(line: 104, column: 9, scope: !2010)
!2048 = !DILocalVariable(name: "Ami", scope: !2010, file: !49, line: 76, type: !45)
!2049 = !DILocation(line: 105, column: 9, scope: !2010)
!2050 = !DILocalVariable(name: "Amo", scope: !2010, file: !49, line: 76, type: !45)
!2051 = !DILocation(line: 106, column: 9, scope: !2010)
!2052 = !DILocalVariable(name: "Amu", scope: !2010, file: !49, line: 76, type: !45)
!2053 = !DILocation(line: 107, column: 9, scope: !2010)
!2054 = !DILocalVariable(name: "Asa", scope: !2010, file: !49, line: 77, type: !45)
!2055 = !DILocation(line: 108, column: 9, scope: !2010)
!2056 = !DILocalVariable(name: "Ase", scope: !2010, file: !49, line: 77, type: !45)
!2057 = !DILocation(line: 109, column: 9, scope: !2010)
!2058 = !DILocalVariable(name: "Asi", scope: !2010, file: !49, line: 77, type: !45)
!2059 = !DILocation(line: 110, column: 9, scope: !2010)
!2060 = !DILocalVariable(name: "Aso", scope: !2010, file: !49, line: 77, type: !45)
!2061 = !DILocation(line: 111, column: 9, scope: !2010)
!2062 = !DILocalVariable(name: "Asu", scope: !2010, file: !49, line: 77, type: !45)
!2063 = !DILocalVariable(name: "round", scope: !2010, file: !49, line: 71, type: !25)
!2064 = !DILocation(line: 113, column: 8, scope: !2065)
!2065 = distinct !DILexicalBlock(scope: !2010, file: !49, line: 113, column: 3)
!2066 = !DILocation(line: 113, scope: !2065)
!2067 = !DILocation(line: 113, column: 25, scope: !2068)
!2068 = distinct !DILexicalBlock(scope: !2065, file: !49, line: 113, column: 3)
!2069 = !DILocation(line: 113, column: 3, scope: !2065)
!2070 = !DILocalVariable(name: "BCa", scope: !2010, file: !49, line: 78, type: !45)
!2071 = !DILocalVariable(name: "BCe", scope: !2010, file: !49, line: 78, type: !45)
!2072 = !DILocalVariable(name: "BCi", scope: !2010, file: !49, line: 78, type: !45)
!2073 = !DILocalVariable(name: "BCo", scope: !2010, file: !49, line: 78, type: !45)
!2074 = !DILocalVariable(name: "BCu", scope: !2010, file: !49, line: 78, type: !45)
!2075 = !DILocalVariable(name: "Da", scope: !2010, file: !49, line: 79, type: !45)
!2076 = !DILocalVariable(name: "De", scope: !2010, file: !49, line: 79, type: !45)
!2077 = !DILocalVariable(name: "Di", scope: !2010, file: !49, line: 79, type: !45)
!2078 = !DILocalVariable(name: "Do", scope: !2010, file: !49, line: 79, type: !45)
!2079 = !DILocalVariable(name: "Du", scope: !2010, file: !49, line: 79, type: !45)
!2080 = !DILocalVariable(name: "Eba", scope: !2010, file: !49, line: 80, type: !45)
!2081 = !DILocalVariable(name: "Ebe", scope: !2010, file: !49, line: 80, type: !45)
!2082 = !DILocalVariable(name: "Ebi", scope: !2010, file: !49, line: 80, type: !45)
!2083 = !DILocalVariable(name: "Ebo", scope: !2010, file: !49, line: 80, type: !45)
!2084 = !DILocalVariable(name: "Ebu", scope: !2010, file: !49, line: 80, type: !45)
!2085 = !DILocalVariable(name: "Ega", scope: !2010, file: !49, line: 81, type: !45)
!2086 = !DILocalVariable(name: "Ege", scope: !2010, file: !49, line: 81, type: !45)
!2087 = !DILocalVariable(name: "Egi", scope: !2010, file: !49, line: 81, type: !45)
!2088 = !DILocalVariable(name: "Ego", scope: !2010, file: !49, line: 81, type: !45)
!2089 = !DILocalVariable(name: "Egu", scope: !2010, file: !49, line: 81, type: !45)
!2090 = !DILocalVariable(name: "Eka", scope: !2010, file: !49, line: 82, type: !45)
!2091 = !DILocalVariable(name: "Eke", scope: !2010, file: !49, line: 82, type: !45)
!2092 = !DILocalVariable(name: "Eki", scope: !2010, file: !49, line: 82, type: !45)
!2093 = !DILocalVariable(name: "Eko", scope: !2010, file: !49, line: 82, type: !45)
!2094 = !DILocalVariable(name: "Eku", scope: !2010, file: !49, line: 82, type: !45)
!2095 = !DILocalVariable(name: "Ema", scope: !2010, file: !49, line: 83, type: !45)
!2096 = !DILocalVariable(name: "Eme", scope: !2010, file: !49, line: 83, type: !45)
!2097 = !DILocalVariable(name: "Emi", scope: !2010, file: !49, line: 83, type: !45)
!2098 = !DILocalVariable(name: "Emo", scope: !2010, file: !49, line: 83, type: !45)
!2099 = !DILocalVariable(name: "Emu", scope: !2010, file: !49, line: 83, type: !45)
!2100 = !DILocalVariable(name: "Esa", scope: !2010, file: !49, line: 84, type: !45)
!2101 = !DILocalVariable(name: "Ese", scope: !2010, file: !49, line: 84, type: !45)
!2102 = !DILocalVariable(name: "Esi", scope: !2010, file: !49, line: 84, type: !45)
!2103 = !DILocalVariable(name: "Eso", scope: !2010, file: !49, line: 84, type: !45)
!2104 = !DILocalVariable(name: "Esu", scope: !2010, file: !49, line: 84, type: !45)
!2105 = !DILocation(line: 117, column: 15, scope: !2106)
!2106 = distinct !DILexicalBlock(scope: !2068, file: !49, line: 113, column: 48)
!2107 = !DILocation(line: 117, column: 21, scope: !2106)
!2108 = !DILocation(line: 117, column: 27, scope: !2106)
!2109 = !DILocation(line: 117, column: 33, scope: !2106)
!2110 = !DILocation(line: 119, column: 15, scope: !2106)
!2111 = !DILocation(line: 119, column: 21, scope: !2106)
!2112 = !DILocation(line: 119, column: 27, scope: !2106)
!2113 = !DILocation(line: 119, column: 33, scope: !2106)
!2114 = !DILocation(line: 125, column: 16, scope: !2106)
!2115 = !DILocation(line: 125, column: 14, scope: !2106)
!2116 = !DILocation(line: 195, column: 9, scope: !2106)
!2117 = !DILocation(line: 196, column: 11, scope: !2106)
!2118 = !DILocation(line: 116, column: 15, scope: !2106)
!2119 = !DILocation(line: 116, column: 21, scope: !2106)
!2120 = !DILocation(line: 116, column: 27, scope: !2106)
!2121 = !DILocation(line: 116, column: 33, scope: !2106)
!2122 = !DILocation(line: 122, column: 16, scope: !2106)
!2123 = !DILocation(line: 122, column: 14, scope: !2106)
!2124 = !DILocation(line: 199, column: 9, scope: !2106)
!2125 = !DILocation(line: 200, column: 11, scope: !2106)
!2126 = !DILocation(line: 118, column: 15, scope: !2106)
!2127 = !DILocation(line: 118, column: 21, scope: !2106)
!2128 = !DILocation(line: 118, column: 27, scope: !2106)
!2129 = !DILocation(line: 118, column: 33, scope: !2106)
!2130 = !DILocation(line: 115, column: 15, scope: !2106)
!2131 = !DILocation(line: 115, column: 21, scope: !2106)
!2132 = !DILocation(line: 115, column: 27, scope: !2106)
!2133 = !DILocation(line: 115, column: 33, scope: !2106)
!2134 = !DILocation(line: 126, column: 16, scope: !2106)
!2135 = !DILocation(line: 126, column: 14, scope: !2106)
!2136 = !DILocation(line: 197, column: 9, scope: !2106)
!2137 = !DILocation(line: 198, column: 11, scope: !2106)
!2138 = !DILocation(line: 204, column: 19, scope: !2106)
!2139 = !DILocation(line: 204, column: 25, scope: !2106)
!2140 = !DILocation(line: 204, column: 15, scope: !2106)
!2141 = !DILocation(line: 124, column: 16, scope: !2106)
!2142 = !DILocation(line: 124, column: 14, scope: !2106)
!2143 = !DILocation(line: 132, column: 9, scope: !2106)
!2144 = !DILocation(line: 133, column: 11, scope: !2106)
!2145 = !DILocation(line: 123, column: 16, scope: !2106)
!2146 = !DILocation(line: 123, column: 14, scope: !2106)
!2147 = !DILocation(line: 130, column: 9, scope: !2106)
!2148 = !DILocation(line: 131, column: 11, scope: !2106)
!2149 = !DILocation(line: 138, column: 19, scope: !2106)
!2150 = !DILocation(line: 138, column: 25, scope: !2106)
!2151 = !DILocation(line: 139, column: 22, scope: !2106)
!2152 = !DILocation(line: 139, column: 9, scope: !2106)
!2153 = !DILocation(line: 128, column: 9, scope: !2106)
!2154 = !DILocation(line: 145, column: 9, scope: !2106)
!2155 = !DILocation(line: 146, column: 11, scope: !2106)
!2156 = !DILocation(line: 149, column: 9, scope: !2106)
!2157 = !DILocation(line: 150, column: 11, scope: !2106)
!2158 = !DILocation(line: 147, column: 9, scope: !2106)
!2159 = !DILocation(line: 148, column: 11, scope: !2106)
!2160 = !DILocation(line: 155, column: 19, scope: !2106)
!2161 = !DILocation(line: 155, column: 25, scope: !2106)
!2162 = !DILocation(line: 155, column: 15, scope: !2106)
!2163 = !DILocation(line: 210, column: 15, scope: !2106)
!2164 = !DILocation(line: 161, column: 9, scope: !2106)
!2165 = !DILocation(line: 162, column: 11, scope: !2106)
!2166 = !DILocation(line: 165, column: 9, scope: !2106)
!2167 = !DILocation(line: 166, column: 11, scope: !2106)
!2168 = !DILocation(line: 163, column: 9, scope: !2106)
!2169 = !DILocation(line: 164, column: 11, scope: !2106)
!2170 = !DILocation(line: 171, column: 19, scope: !2106)
!2171 = !DILocation(line: 171, column: 25, scope: !2106)
!2172 = !DILocation(line: 171, column: 15, scope: !2106)
!2173 = !DILocation(line: 210, column: 21, scope: !2106)
!2174 = !DILocation(line: 177, column: 9, scope: !2106)
!2175 = !DILocation(line: 178, column: 11, scope: !2106)
!2176 = !DILocation(line: 181, column: 9, scope: !2106)
!2177 = !DILocation(line: 182, column: 11, scope: !2106)
!2178 = !DILocation(line: 179, column: 9, scope: !2106)
!2179 = !DILocation(line: 180, column: 11, scope: !2106)
!2180 = !DILocation(line: 187, column: 19, scope: !2106)
!2181 = !DILocation(line: 187, column: 25, scope: !2106)
!2182 = !DILocation(line: 187, column: 15, scope: !2106)
!2183 = !DILocation(line: 210, column: 27, scope: !2106)
!2184 = !DILocation(line: 193, column: 9, scope: !2106)
!2185 = !DILocation(line: 194, column: 11, scope: !2106)
!2186 = !DILocation(line: 203, column: 19, scope: !2106)
!2187 = !DILocation(line: 203, column: 25, scope: !2106)
!2188 = !DILocation(line: 203, column: 15, scope: !2106)
!2189 = !DILocation(line: 210, column: 33, scope: !2106)
!2190 = !DILocation(line: 136, column: 9, scope: !2106)
!2191 = !DILocation(line: 137, column: 11, scope: !2106)
!2192 = !DILocation(line: 134, column: 9, scope: !2106)
!2193 = !DILocation(line: 135, column: 11, scope: !2106)
!2194 = !DILocation(line: 141, column: 19, scope: !2106)
!2195 = !DILocation(line: 141, column: 25, scope: !2106)
!2196 = !DILocation(line: 141, column: 15, scope: !2106)
!2197 = !DILocation(line: 153, column: 9, scope: !2106)
!2198 = !DILocation(line: 154, column: 11, scope: !2106)
!2199 = !DILocation(line: 151, column: 9, scope: !2106)
!2200 = !DILocation(line: 152, column: 11, scope: !2106)
!2201 = !DILocation(line: 157, column: 19, scope: !2106)
!2202 = !DILocation(line: 157, column: 25, scope: !2106)
!2203 = !DILocation(line: 157, column: 15, scope: !2106)
!2204 = !DILocation(line: 212, column: 15, scope: !2106)
!2205 = !DILocation(line: 169, column: 9, scope: !2106)
!2206 = !DILocation(line: 170, column: 11, scope: !2106)
!2207 = !DILocation(line: 167, column: 9, scope: !2106)
!2208 = !DILocation(line: 168, column: 11, scope: !2106)
!2209 = !DILocation(line: 173, column: 19, scope: !2106)
!2210 = !DILocation(line: 173, column: 25, scope: !2106)
!2211 = !DILocation(line: 173, column: 15, scope: !2106)
!2212 = !DILocation(line: 212, column: 21, scope: !2106)
!2213 = !DILocation(line: 185, column: 9, scope: !2106)
!2214 = !DILocation(line: 186, column: 11, scope: !2106)
!2215 = !DILocation(line: 183, column: 9, scope: !2106)
!2216 = !DILocation(line: 184, column: 11, scope: !2106)
!2217 = !DILocation(line: 189, column: 19, scope: !2106)
!2218 = !DILocation(line: 189, column: 25, scope: !2106)
!2219 = !DILocation(line: 189, column: 15, scope: !2106)
!2220 = !DILocation(line: 212, column: 27, scope: !2106)
!2221 = !DILocation(line: 201, column: 9, scope: !2106)
!2222 = !DILocation(line: 202, column: 11, scope: !2106)
!2223 = !DILocation(line: 205, column: 19, scope: !2106)
!2224 = !DILocation(line: 205, column: 25, scope: !2106)
!2225 = !DILocation(line: 205, column: 15, scope: !2106)
!2226 = !DILocation(line: 212, column: 33, scope: !2106)
!2227 = !DILocation(line: 218, column: 16, scope: !2106)
!2228 = !DILocation(line: 218, column: 14, scope: !2106)
!2229 = !DILocation(line: 296, column: 9, scope: !2106)
!2230 = !DILocation(line: 297, column: 11, scope: !2106)
!2231 = !DILocation(line: 158, column: 19, scope: !2106)
!2232 = !DILocation(line: 158, column: 25, scope: !2106)
!2233 = !DILocation(line: 158, column: 15, scope: !2106)
!2234 = !DILocation(line: 143, column: 19, scope: !2106)
!2235 = !DILocation(line: 143, column: 25, scope: !2106)
!2236 = !DILocation(line: 143, column: 15, scope: !2106)
!2237 = !DILocation(line: 159, column: 19, scope: !2106)
!2238 = !DILocation(line: 159, column: 25, scope: !2106)
!2239 = !DILocation(line: 159, column: 15, scope: !2106)
!2240 = !DILocation(line: 214, column: 15, scope: !2106)
!2241 = !DILocation(line: 175, column: 19, scope: !2106)
!2242 = !DILocation(line: 175, column: 25, scope: !2106)
!2243 = !DILocation(line: 175, column: 15, scope: !2106)
!2244 = !DILocation(line: 214, column: 21, scope: !2106)
!2245 = !DILocation(line: 191, column: 19, scope: !2106)
!2246 = !DILocation(line: 191, column: 25, scope: !2106)
!2247 = !DILocation(line: 191, column: 15, scope: !2106)
!2248 = !DILocation(line: 214, column: 27, scope: !2106)
!2249 = !DILocation(line: 207, column: 19, scope: !2106)
!2250 = !DILocation(line: 207, column: 25, scope: !2106)
!2251 = !DILocation(line: 207, column: 15, scope: !2106)
!2252 = !DILocation(line: 214, column: 33, scope: !2106)
!2253 = !DILocation(line: 220, column: 16, scope: !2106)
!2254 = !DILocation(line: 220, column: 14, scope: !2106)
!2255 = !DILocation(line: 290, column: 9, scope: !2106)
!2256 = !DILocation(line: 291, column: 11, scope: !2106)
!2257 = !DILocation(line: 140, column: 19, scope: !2106)
!2258 = !DILocation(line: 140, column: 25, scope: !2106)
!2259 = !DILocation(line: 140, column: 15, scope: !2106)
!2260 = !DILocation(line: 156, column: 19, scope: !2106)
!2261 = !DILocation(line: 156, column: 25, scope: !2106)
!2262 = !DILocation(line: 156, column: 15, scope: !2106)
!2263 = !DILocation(line: 211, column: 15, scope: !2106)
!2264 = !DILocation(line: 172, column: 19, scope: !2106)
!2265 = !DILocation(line: 172, column: 25, scope: !2106)
!2266 = !DILocation(line: 172, column: 15, scope: !2106)
!2267 = !DILocation(line: 211, column: 21, scope: !2106)
!2268 = !DILocation(line: 188, column: 19, scope: !2106)
!2269 = !DILocation(line: 188, column: 25, scope: !2106)
!2270 = !DILocation(line: 188, column: 15, scope: !2106)
!2271 = !DILocation(line: 211, column: 27, scope: !2106)
!2272 = !DILocation(line: 211, column: 33, scope: !2106)
!2273 = !DILocation(line: 142, column: 19, scope: !2106)
!2274 = !DILocation(line: 142, column: 25, scope: !2106)
!2275 = !DILocation(line: 142, column: 15, scope: !2106)
!2276 = !DILocation(line: 213, column: 15, scope: !2106)
!2277 = !DILocation(line: 174, column: 19, scope: !2106)
!2278 = !DILocation(line: 174, column: 25, scope: !2106)
!2279 = !DILocation(line: 174, column: 15, scope: !2106)
!2280 = !DILocation(line: 213, column: 21, scope: !2106)
!2281 = !DILocation(line: 190, column: 19, scope: !2106)
!2282 = !DILocation(line: 190, column: 25, scope: !2106)
!2283 = !DILocation(line: 190, column: 15, scope: !2106)
!2284 = !DILocation(line: 213, column: 27, scope: !2106)
!2285 = !DILocation(line: 206, column: 19, scope: !2106)
!2286 = !DILocation(line: 206, column: 25, scope: !2106)
!2287 = !DILocation(line: 206, column: 15, scope: !2106)
!2288 = !DILocation(line: 213, column: 33, scope: !2106)
!2289 = !DILocation(line: 219, column: 16, scope: !2106)
!2290 = !DILocation(line: 219, column: 14, scope: !2106)
!2291 = !DILocation(line: 288, column: 9, scope: !2106)
!2292 = !DILocation(line: 289, column: 11, scope: !2106)
!2293 = !DILocation(line: 302, column: 19, scope: !2106)
!2294 = !DILocation(line: 302, column: 25, scope: !2106)
!2295 = !DILocation(line: 302, column: 15, scope: !2106)
!2296 = !DILocation(line: 217, column: 16, scope: !2106)
!2297 = !DILocation(line: 217, column: 14, scope: !2106)
!2298 = !DILocation(line: 294, column: 9, scope: !2106)
!2299 = !DILocation(line: 295, column: 11, scope: !2106)
!2300 = !DILocation(line: 301, column: 19, scope: !2106)
!2301 = !DILocation(line: 301, column: 25, scope: !2106)
!2302 = !DILocation(line: 301, column: 15, scope: !2106)
!2303 = !DILocation(line: 221, column: 16, scope: !2106)
!2304 = !DILocation(line: 221, column: 14, scope: !2106)
!2305 = !DILocation(line: 292, column: 9, scope: !2106)
!2306 = !DILocation(line: 293, column: 11, scope: !2106)
!2307 = !DILocation(line: 300, column: 19, scope: !2106)
!2308 = !DILocation(line: 300, column: 25, scope: !2106)
!2309 = !DILocation(line: 300, column: 15, scope: !2106)
!2310 = !DILocation(line: 299, column: 19, scope: !2106)
!2311 = !DILocation(line: 299, column: 25, scope: !2106)
!2312 = !DILocation(line: 299, column: 15, scope: !2106)
!2313 = !DILocation(line: 298, column: 19, scope: !2106)
!2314 = !DILocation(line: 298, column: 25, scope: !2106)
!2315 = !DILocation(line: 298, column: 15, scope: !2106)
!2316 = !DILocation(line: 280, column: 9, scope: !2106)
!2317 = !DILocation(line: 281, column: 11, scope: !2106)
!2318 = !DILocation(line: 274, column: 9, scope: !2106)
!2319 = !DILocation(line: 275, column: 11, scope: !2106)
!2320 = !DILocation(line: 272, column: 9, scope: !2106)
!2321 = !DILocation(line: 273, column: 11, scope: !2106)
!2322 = !DILocation(line: 286, column: 19, scope: !2106)
!2323 = !DILocation(line: 286, column: 25, scope: !2106)
!2324 = !DILocation(line: 286, column: 15, scope: !2106)
!2325 = !DILocation(line: 278, column: 9, scope: !2106)
!2326 = !DILocation(line: 279, column: 11, scope: !2106)
!2327 = !DILocation(line: 285, column: 19, scope: !2106)
!2328 = !DILocation(line: 285, column: 25, scope: !2106)
!2329 = !DILocation(line: 285, column: 15, scope: !2106)
!2330 = !DILocation(line: 276, column: 9, scope: !2106)
!2331 = !DILocation(line: 277, column: 11, scope: !2106)
!2332 = !DILocation(line: 284, column: 19, scope: !2106)
!2333 = !DILocation(line: 284, column: 25, scope: !2106)
!2334 = !DILocation(line: 284, column: 15, scope: !2106)
!2335 = !DILocation(line: 283, column: 19, scope: !2106)
!2336 = !DILocation(line: 283, column: 25, scope: !2106)
!2337 = !DILocation(line: 283, column: 15, scope: !2106)
!2338 = !DILocation(line: 282, column: 19, scope: !2106)
!2339 = !DILocation(line: 282, column: 25, scope: !2106)
!2340 = !DILocation(line: 282, column: 15, scope: !2106)
!2341 = !DILocation(line: 264, column: 9, scope: !2106)
!2342 = !DILocation(line: 265, column: 11, scope: !2106)
!2343 = !DILocation(line: 258, column: 9, scope: !2106)
!2344 = !DILocation(line: 259, column: 11, scope: !2106)
!2345 = !DILocation(line: 256, column: 9, scope: !2106)
!2346 = !DILocation(line: 257, column: 11, scope: !2106)
!2347 = !DILocation(line: 270, column: 19, scope: !2106)
!2348 = !DILocation(line: 270, column: 25, scope: !2106)
!2349 = !DILocation(line: 270, column: 15, scope: !2106)
!2350 = !DILocation(line: 262, column: 9, scope: !2106)
!2351 = !DILocation(line: 263, column: 11, scope: !2106)
!2352 = !DILocation(line: 269, column: 19, scope: !2106)
!2353 = !DILocation(line: 269, column: 25, scope: !2106)
!2354 = !DILocation(line: 269, column: 15, scope: !2106)
!2355 = !DILocation(line: 260, column: 9, scope: !2106)
!2356 = !DILocation(line: 261, column: 11, scope: !2106)
!2357 = !DILocation(line: 268, column: 19, scope: !2106)
!2358 = !DILocation(line: 268, column: 25, scope: !2106)
!2359 = !DILocation(line: 268, column: 15, scope: !2106)
!2360 = !DILocation(line: 267, column: 19, scope: !2106)
!2361 = !DILocation(line: 267, column: 25, scope: !2106)
!2362 = !DILocation(line: 267, column: 15, scope: !2106)
!2363 = !DILocation(line: 266, column: 19, scope: !2106)
!2364 = !DILocation(line: 266, column: 25, scope: !2106)
!2365 = !DILocation(line: 266, column: 15, scope: !2106)
!2366 = !DILocation(line: 248, column: 9, scope: !2106)
!2367 = !DILocation(line: 249, column: 11, scope: !2106)
!2368 = !DILocation(line: 242, column: 9, scope: !2106)
!2369 = !DILocation(line: 243, column: 11, scope: !2106)
!2370 = !DILocation(line: 240, column: 9, scope: !2106)
!2371 = !DILocation(line: 241, column: 11, scope: !2106)
!2372 = !DILocation(line: 254, column: 19, scope: !2106)
!2373 = !DILocation(line: 254, column: 25, scope: !2106)
!2374 = !DILocation(line: 254, column: 15, scope: !2106)
!2375 = !DILocation(line: 246, column: 9, scope: !2106)
!2376 = !DILocation(line: 247, column: 11, scope: !2106)
!2377 = !DILocation(line: 253, column: 19, scope: !2106)
!2378 = !DILocation(line: 253, column: 25, scope: !2106)
!2379 = !DILocation(line: 253, column: 15, scope: !2106)
!2380 = !DILocation(line: 244, column: 9, scope: !2106)
!2381 = !DILocation(line: 245, column: 11, scope: !2106)
!2382 = !DILocation(line: 252, column: 19, scope: !2106)
!2383 = !DILocation(line: 252, column: 25, scope: !2106)
!2384 = !DILocation(line: 252, column: 15, scope: !2106)
!2385 = !DILocation(line: 251, column: 19, scope: !2106)
!2386 = !DILocation(line: 251, column: 25, scope: !2106)
!2387 = !DILocation(line: 251, column: 15, scope: !2106)
!2388 = !DILocation(line: 250, column: 19, scope: !2106)
!2389 = !DILocation(line: 250, column: 25, scope: !2106)
!2390 = !DILocation(line: 250, column: 15, scope: !2106)
!2391 = !DILocation(line: 231, column: 9, scope: !2106)
!2392 = !DILocation(line: 232, column: 11, scope: !2106)
!2393 = !DILocation(line: 225, column: 9, scope: !2106)
!2394 = !DILocation(line: 226, column: 11, scope: !2106)
!2395 = !DILocation(line: 223, column: 9, scope: !2106)
!2396 = !DILocation(line: 238, column: 19, scope: !2106)
!2397 = !DILocation(line: 238, column: 25, scope: !2106)
!2398 = !DILocation(line: 238, column: 15, scope: !2106)
!2399 = !DILocation(line: 229, column: 9, scope: !2106)
!2400 = !DILocation(line: 230, column: 11, scope: !2106)
!2401 = !DILocation(line: 237, column: 19, scope: !2106)
!2402 = !DILocation(line: 237, column: 25, scope: !2106)
!2403 = !DILocation(line: 237, column: 15, scope: !2106)
!2404 = !DILocation(line: 227, column: 9, scope: !2106)
!2405 = !DILocation(line: 228, column: 11, scope: !2106)
!2406 = !DILocation(line: 236, column: 19, scope: !2106)
!2407 = !DILocation(line: 236, column: 25, scope: !2106)
!2408 = !DILocation(line: 236, column: 15, scope: !2106)
!2409 = !DILocation(line: 235, column: 19, scope: !2106)
!2410 = !DILocation(line: 235, column: 25, scope: !2106)
!2411 = !DILocation(line: 235, column: 15, scope: !2106)
!2412 = !DILocation(line: 234, column: 51, scope: !2106)
!2413 = !DILocation(line: 234, column: 22, scope: !2106)
!2414 = !DILocation(line: 233, column: 19, scope: !2106)
!2415 = !DILocation(line: 233, column: 25, scope: !2106)
!2416 = !DILocation(line: 234, column: 9, scope: !2106)
!2417 = !DILocation(line: 113, column: 42, scope: !2068)
!2418 = !DILocation(line: 113, column: 3, scope: !2068)
!2419 = distinct !{!2419, !2069, !2420, !105}
!2420 = !DILocation(line: 303, column: 3, scope: !2065)
!2421 = !DILocation(line: 306, column: 12, scope: !2010)
!2422 = !DILocation(line: 307, column: 3, scope: !2010)
!2423 = !DILocation(line: 307, column: 12, scope: !2010)
!2424 = !DILocation(line: 308, column: 3, scope: !2010)
!2425 = !DILocation(line: 308, column: 12, scope: !2010)
!2426 = !DILocation(line: 309, column: 3, scope: !2010)
!2427 = !DILocation(line: 309, column: 12, scope: !2010)
!2428 = !DILocation(line: 310, column: 3, scope: !2010)
!2429 = !DILocation(line: 310, column: 12, scope: !2010)
!2430 = !DILocation(line: 311, column: 3, scope: !2010)
!2431 = !DILocation(line: 311, column: 12, scope: !2010)
!2432 = !DILocation(line: 312, column: 3, scope: !2010)
!2433 = !DILocation(line: 312, column: 12, scope: !2010)
!2434 = !DILocation(line: 313, column: 3, scope: !2010)
!2435 = !DILocation(line: 313, column: 12, scope: !2010)
!2436 = !DILocation(line: 314, column: 3, scope: !2010)
!2437 = !DILocation(line: 314, column: 12, scope: !2010)
!2438 = !DILocation(line: 315, column: 3, scope: !2010)
!2439 = !DILocation(line: 315, column: 12, scope: !2010)
!2440 = !DILocation(line: 316, column: 3, scope: !2010)
!2441 = !DILocation(line: 316, column: 13, scope: !2010)
!2442 = !DILocation(line: 317, column: 3, scope: !2010)
!2443 = !DILocation(line: 317, column: 13, scope: !2010)
!2444 = !DILocation(line: 318, column: 3, scope: !2010)
!2445 = !DILocation(line: 318, column: 13, scope: !2010)
!2446 = !DILocation(line: 319, column: 3, scope: !2010)
!2447 = !DILocation(line: 319, column: 13, scope: !2010)
!2448 = !DILocation(line: 320, column: 3, scope: !2010)
!2449 = !DILocation(line: 320, column: 13, scope: !2010)
!2450 = !DILocation(line: 321, column: 3, scope: !2010)
!2451 = !DILocation(line: 321, column: 13, scope: !2010)
!2452 = !DILocation(line: 322, column: 3, scope: !2010)
!2453 = !DILocation(line: 322, column: 13, scope: !2010)
!2454 = !DILocation(line: 323, column: 3, scope: !2010)
!2455 = !DILocation(line: 323, column: 13, scope: !2010)
!2456 = !DILocation(line: 324, column: 3, scope: !2010)
!2457 = !DILocation(line: 324, column: 13, scope: !2010)
!2458 = !DILocation(line: 325, column: 3, scope: !2010)
!2459 = !DILocation(line: 325, column: 13, scope: !2010)
!2460 = !DILocation(line: 326, column: 3, scope: !2010)
!2461 = !DILocation(line: 326, column: 13, scope: !2010)
!2462 = !DILocation(line: 327, column: 3, scope: !2010)
!2463 = !DILocation(line: 327, column: 13, scope: !2010)
!2464 = !DILocation(line: 328, column: 3, scope: !2010)
!2465 = !DILocation(line: 328, column: 13, scope: !2010)
!2466 = !DILocation(line: 329, column: 3, scope: !2010)
!2467 = !DILocation(line: 329, column: 13, scope: !2010)
!2468 = !DILocation(line: 330, column: 3, scope: !2010)
!2469 = !DILocation(line: 330, column: 13, scope: !2010)
!2470 = !DILocation(line: 331, column: 1, scope: !2010)
!2471 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_finalize", scope: !49, file: !49, line: 524, type: !1914, scopeLine: 524, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2472 = !DILocalVariable(name: "state", arg: 1, scope: !2471, file: !49, line: 524, type: !1916)
!2473 = !DILocation(line: 0, scope: !2471)
!2474 = !DILocation(line: 525, column: 27, scope: !2471)
!2475 = !DILocation(line: 525, column: 3, scope: !2471)
!2476 = !DILocation(line: 526, column: 3, scope: !2471)
!2477 = !DILocation(line: 526, column: 29, scope: !2471)
!2478 = !DILocation(line: 527, column: 1, scope: !2471)
!2479 = distinct !DISubprogram(name: "keccak_finalize", scope: !49, file: !49, line: 388, type: !2480, scopeLine: 389, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2480 = !DISubroutineType(types: !2481)
!2481 = !{null, !1926, !14, !14, !7}
!2482 = !DILocalVariable(name: "s", arg: 1, scope: !2479, file: !49, line: 388, type: !1926)
!2483 = !DILocation(line: 0, scope: !2479)
!2484 = !DILocalVariable(name: "pos", arg: 2, scope: !2479, file: !49, line: 388, type: !14)
!2485 = !DILocalVariable(name: "r", arg: 3, scope: !2479, file: !49, line: 388, type: !14)
!2486 = !DILocalVariable(name: "p", arg: 4, scope: !2479, file: !49, line: 389, type: !7)
!2487 = !DILocation(line: 390, column: 34, scope: !2479)
!2488 = !DILocation(line: 390, column: 29, scope: !2479)
!2489 = !DILocation(line: 390, column: 9, scope: !2479)
!2490 = !DILocation(line: 390, column: 3, scope: !2479)
!2491 = !DILocation(line: 390, column: 14, scope: !2479)
!2492 = !DILocation(line: 391, column: 7, scope: !2479)
!2493 = !DILocation(line: 391, column: 3, scope: !2479)
!2494 = !DILocation(line: 391, column: 16, scope: !2479)
!2495 = !DILocation(line: 392, column: 1, scope: !2479)
!2496 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeeze", scope: !49, file: !49, line: 540, type: !2497, scopeLine: 540, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2497 = !DISubroutineType(types: !2498)
!2498 = !{null, !6, !12, !1916}
!2499 = !DILocalVariable(name: "out", arg: 1, scope: !2496, file: !49, line: 540, type: !6)
!2500 = !DILocation(line: 0, scope: !2496)
!2501 = !DILocalVariable(name: "outlen", arg: 2, scope: !2496, file: !49, line: 540, type: !12)
!2502 = !DILocalVariable(name: "state", arg: 3, scope: !2496, file: !49, line: 540, type: !1916)
!2503 = !DILocation(line: 542, column: 28, scope: !2496)
!2504 = !DILocation(line: 541, column: 31, scope: !2496)
!2505 = !DILocation(line: 541, column: 3, scope: !2496)
!2506 = !DILocation(line: 541, column: 29, scope: !2496)
!2507 = !DILocation(line: 543, column: 1, scope: !2496)
!2508 = distinct !DISubprogram(name: "keccak_squeeze", scope: !49, file: !49, line: 410, type: !2509, scopeLine: 411, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2509 = !DISubroutineType(types: !2510)
!2510 = !{!14, !6, !12, !1926, !14, !14}
!2511 = !DILocalVariable(name: "out", arg: 1, scope: !2508, file: !49, line: 410, type: !6)
!2512 = !DILocation(line: 0, scope: !2508)
!2513 = !DILocalVariable(name: "outlen", arg: 2, scope: !2508, file: !49, line: 410, type: !12)
!2514 = !DILocalVariable(name: "s", arg: 3, scope: !2508, file: !49, line: 410, type: !1926)
!2515 = !DILocalVariable(name: "pos", arg: 4, scope: !2508, file: !49, line: 411, type: !14)
!2516 = !DILocalVariable(name: "r", arg: 5, scope: !2508, file: !49, line: 411, type: !14)
!2517 = !DILocation(line: 414, column: 3, scope: !2508)
!2518 = !DILocation(line: 415, column: 13, scope: !2519)
!2519 = distinct !DILexicalBlock(scope: !2520, file: !49, line: 415, column: 9)
!2520 = distinct !DILexicalBlock(scope: !2508, file: !49, line: 414, column: 18)
!2521 = !DILocation(line: 416, column: 7, scope: !2522)
!2522 = distinct !DILexicalBlock(scope: !2519, file: !49, line: 415, column: 19)
!2523 = !DILocation(line: 418, column: 5, scope: !2522)
!2524 = !DILocalVariable(name: "i", scope: !2508, file: !49, line: 412, type: !14)
!2525 = !DILocation(line: 419, column: 10, scope: !2526)
!2526 = distinct !DILexicalBlock(scope: !2520, file: !49, line: 419, column: 5)
!2527 = !DILocation(line: 419, scope: !2526)
!2528 = !DILocation(line: 419, column: 21, scope: !2529)
!2529 = distinct !DILexicalBlock(scope: !2526, file: !49, line: 419, column: 5)
!2530 = !DILocation(line: 419, column: 25, scope: !2529)
!2531 = !DILocation(line: 419, column: 5, scope: !2526)
!2532 = !DILocation(line: 420, column: 20, scope: !2529)
!2533 = !DILocation(line: 420, column: 16, scope: !2529)
!2534 = !DILocation(line: 420, column: 30, scope: !2529)
!2535 = !DILocation(line: 420, column: 25, scope: !2529)
!2536 = !DILocation(line: 420, column: 14, scope: !2529)
!2537 = !DILocation(line: 420, column: 11, scope: !2529)
!2538 = !DILocation(line: 419, column: 47, scope: !2529)
!2539 = !DILocation(line: 419, column: 5, scope: !2529)
!2540 = distinct !{!2540, !2531, !2541, !105}
!2541 = !DILocation(line: 420, column: 38, scope: !2526)
!2542 = !DILocation(line: 421, column: 17, scope: !2520)
!2543 = !DILocation(line: 421, column: 12, scope: !2520)
!2544 = distinct !{!2544, !2517, !2545, !105}
!2545 = !DILocation(line: 423, column: 3, scope: !2508)
!2546 = !DILocation(line: 425, column: 3, scope: !2508)
!2547 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb_once", scope: !49, file: !49, line: 556, type: !1944, scopeLine: 557, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2548 = !DILocalVariable(name: "state", arg: 1, scope: !2547, file: !49, line: 556, type: !1916)
!2549 = !DILocation(line: 0, scope: !2547)
!2550 = !DILocalVariable(name: "in", arg: 2, scope: !2547, file: !49, line: 556, type: !232)
!2551 = !DILocalVariable(name: "inlen", arg: 3, scope: !2547, file: !49, line: 557, type: !12)
!2552 = !DILocation(line: 558, column: 3, scope: !2547)
!2553 = !DILocation(line: 559, column: 3, scope: !2547)
!2554 = !DILocation(line: 559, column: 29, scope: !2547)
!2555 = !DILocation(line: 560, column: 1, scope: !2547)
!2556 = distinct !DISubprogram(name: "keccak_absorb_once", scope: !49, file: !49, line: 441, type: !2557, scopeLine: 442, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2557 = !DISubroutineType(types: !2558)
!2558 = !{null, !1926, !14, !232, !12, !7}
!2559 = !DILocalVariable(name: "s", arg: 1, scope: !2556, file: !49, line: 441, type: !1926)
!2560 = !DILocation(line: 0, scope: !2556)
!2561 = !DILocalVariable(name: "r", arg: 2, scope: !2556, file: !49, line: 441, type: !14)
!2562 = !DILocalVariable(name: "in", arg: 3, scope: !2556, file: !49, line: 442, type: !232)
!2563 = !DILocalVariable(name: "inlen", arg: 4, scope: !2556, file: !49, line: 442, type: !12)
!2564 = !DILocalVariable(name: "p", arg: 5, scope: !2556, file: !49, line: 442, type: !7)
!2565 = !DILocalVariable(name: "i", scope: !2556, file: !49, line: 443, type: !14)
!2566 = !DILocation(line: 445, column: 8, scope: !2567)
!2567 = distinct !DILexicalBlock(scope: !2556, file: !49, line: 445, column: 3)
!2568 = !DILocation(line: 445, scope: !2567)
!2569 = !DILocation(line: 445, column: 17, scope: !2570)
!2570 = distinct !DILexicalBlock(scope: !2567, file: !49, line: 445, column: 3)
!2571 = !DILocation(line: 445, column: 3, scope: !2567)
!2572 = !DILocation(line: 448, column: 3, scope: !2556)
!2573 = !DILocation(line: 446, column: 5, scope: !2570)
!2574 = !DILocation(line: 446, column: 10, scope: !2570)
!2575 = !DILocation(line: 445, column: 24, scope: !2570)
!2576 = !DILocation(line: 445, column: 3, scope: !2570)
!2577 = distinct !{!2577, !2571, !2578, !105}
!2578 = !DILocation(line: 446, column: 12, scope: !2567)
!2579 = !DILocation(line: 448, column: 16, scope: !2556)
!2580 = !DILocation(line: 449, column: 5, scope: !2581)
!2581 = distinct !DILexicalBlock(scope: !2582, file: !49, line: 449, column: 5)
!2582 = distinct !DILexicalBlock(scope: !2556, file: !49, line: 448, column: 22)
!2583 = !DILocation(line: 456, column: 3, scope: !2584)
!2584 = distinct !DILexicalBlock(scope: !2556, file: !49, line: 456, column: 3)
!2585 = !DILocation(line: 449, scope: !2581)
!2586 = !DILocation(line: 449, column: 19, scope: !2587)
!2587 = distinct !DILexicalBlock(scope: !2581, file: !49, line: 449, column: 5)
!2588 = !DILocation(line: 450, column: 29, scope: !2587)
!2589 = !DILocation(line: 450, column: 25, scope: !2587)
!2590 = !DILocation(line: 450, column: 15, scope: !2587)
!2591 = !DILocation(line: 450, column: 7, scope: !2587)
!2592 = !DILocation(line: 450, column: 12, scope: !2587)
!2593 = !DILocation(line: 449, column: 29, scope: !2587)
!2594 = !DILocation(line: 449, column: 5, scope: !2587)
!2595 = distinct !{!2595, !2580, !2596, !105}
!2596 = !DILocation(line: 450, column: 32, scope: !2581)
!2597 = !DILocation(line: 451, column: 8, scope: !2582)
!2598 = !DILocation(line: 452, column: 11, scope: !2582)
!2599 = !DILocation(line: 453, column: 5, scope: !2582)
!2600 = distinct !{!2600, !2572, !2601, !105}
!2601 = !DILocation(line: 454, column: 3, scope: !2556)
!2602 = !DILocation(line: 456, scope: !2584)
!2603 = !DILocation(line: 456, column: 17, scope: !2604)
!2604 = distinct !DILexicalBlock(scope: !2584, file: !49, line: 456, column: 3)
!2605 = !DILocation(line: 457, column: 27, scope: !2604)
!2606 = !DILocation(line: 457, column: 17, scope: !2604)
!2607 = !DILocation(line: 457, column: 38, scope: !2604)
!2608 = !DILocation(line: 457, column: 33, scope: !2604)
!2609 = !DILocation(line: 457, column: 9, scope: !2604)
!2610 = !DILocation(line: 457, column: 5, scope: !2604)
!2611 = !DILocation(line: 457, column: 14, scope: !2604)
!2612 = !DILocation(line: 456, column: 27, scope: !2604)
!2613 = !DILocation(line: 456, column: 3, scope: !2604)
!2614 = distinct !{!2614, !2583, !2615, !105}
!2615 = !DILocation(line: 457, column: 46, scope: !2584)
!2616 = !DILocation(line: 459, column: 15, scope: !2556)
!2617 = !DILocation(line: 459, column: 32, scope: !2556)
!2618 = !DILocation(line: 459, column: 27, scope: !2556)
!2619 = !DILocation(line: 459, column: 7, scope: !2556)
!2620 = !DILocation(line: 459, column: 3, scope: !2556)
!2621 = !DILocation(line: 459, column: 12, scope: !2556)
!2622 = !DILocation(line: 460, column: 8, scope: !2556)
!2623 = !DILocation(line: 460, column: 13, scope: !2556)
!2624 = !DILocation(line: 460, column: 3, scope: !2556)
!2625 = !DILocation(line: 460, column: 18, scope: !2556)
!2626 = !DILocation(line: 461, column: 1, scope: !2556)
!2627 = distinct !DISubprogram(name: "load64", scope: !49, file: !49, line: 22, type: !2628, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2628 = !DISubroutineType(types: !2629)
!2629 = !{!45, !232}
!2630 = !DILocalVariable(name: "x", arg: 1, scope: !2627, file: !49, line: 22, type: !232)
!2631 = !DILocation(line: 0, scope: !2627)
!2632 = !DILocalVariable(name: "r", scope: !2627, file: !49, line: 24, type: !45)
!2633 = !DILocalVariable(name: "i", scope: !2627, file: !49, line: 23, type: !14)
!2634 = !DILocation(line: 26, column: 8, scope: !2635)
!2635 = distinct !DILexicalBlock(scope: !2627, file: !49, line: 26, column: 3)
!2636 = !DILocation(line: 26, scope: !2635)
!2637 = !DILocation(line: 26, column: 17, scope: !2638)
!2638 = distinct !DILexicalBlock(scope: !2635, file: !49, line: 26, column: 3)
!2639 = !DILocation(line: 26, column: 3, scope: !2635)
!2640 = !DILocation(line: 27, column: 20, scope: !2638)
!2641 = !DILocation(line: 27, column: 10, scope: !2638)
!2642 = !DILocation(line: 27, column: 30, scope: !2638)
!2643 = !DILocation(line: 27, column: 25, scope: !2638)
!2644 = !DILocation(line: 27, column: 7, scope: !2638)
!2645 = !DILocation(line: 26, column: 23, scope: !2638)
!2646 = !DILocation(line: 26, column: 3, scope: !2638)
!2647 = distinct !{!2647, !2639, !2648, !105}
!2648 = !DILocation(line: 27, column: 32, scope: !2635)
!2649 = !DILocation(line: 29, column: 3, scope: !2627)
!2650 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeezeblocks", scope: !49, file: !49, line: 575, type: !2497, scopeLine: 575, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2651 = !DILocalVariable(name: "out", arg: 1, scope: !2650, file: !49, line: 575, type: !6)
!2652 = !DILocation(line: 0, scope: !2650)
!2653 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2650, file: !49, line: 575, type: !12)
!2654 = !DILocalVariable(name: "state", arg: 3, scope: !2650, file: !49, line: 575, type: !1916)
!2655 = !DILocation(line: 576, column: 3, scope: !2650)
!2656 = !DILocation(line: 577, column: 1, scope: !2650)
!2657 = distinct !DISubprogram(name: "keccak_squeezeblocks", scope: !49, file: !49, line: 477, type: !2658, scopeLine: 478, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2658 = !DISubroutineType(types: !2659)
!2659 = !{null, !6, !12, !1926, !14}
!2660 = !DILocalVariable(name: "out", arg: 1, scope: !2657, file: !49, line: 477, type: !6)
!2661 = !DILocation(line: 0, scope: !2657)
!2662 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2657, file: !49, line: 477, type: !12)
!2663 = !DILocalVariable(name: "s", arg: 3, scope: !2657, file: !49, line: 477, type: !1926)
!2664 = !DILocalVariable(name: "r", arg: 4, scope: !2657, file: !49, line: 478, type: !14)
!2665 = !DILocation(line: 481, column: 3, scope: !2657)
!2666 = !DILocation(line: 482, column: 5, scope: !2667)
!2667 = distinct !DILexicalBlock(scope: !2657, file: !49, line: 481, column: 19)
!2668 = !DILocalVariable(name: "i", scope: !2657, file: !49, line: 479, type: !14)
!2669 = !DILocation(line: 483, column: 10, scope: !2670)
!2670 = distinct !DILexicalBlock(scope: !2667, file: !49, line: 483, column: 5)
!2671 = !DILocation(line: 483, scope: !2670)
!2672 = !DILocation(line: 483, column: 19, scope: !2673)
!2673 = distinct !DILexicalBlock(scope: !2670, file: !49, line: 483, column: 5)
!2674 = !DILocation(line: 483, column: 5, scope: !2670)
!2675 = !DILocation(line: 484, column: 23, scope: !2673)
!2676 = !DILocation(line: 484, column: 19, scope: !2673)
!2677 = !DILocation(line: 484, column: 28, scope: !2673)
!2678 = !DILocation(line: 484, column: 7, scope: !2673)
!2679 = !DILocation(line: 483, column: 29, scope: !2673)
!2680 = !DILocation(line: 483, column: 5, scope: !2673)
!2681 = distinct !{!2681, !2674, !2682, !105}
!2682 = !DILocation(line: 484, column: 32, scope: !2670)
!2683 = !DILocation(line: 485, column: 9, scope: !2667)
!2684 = !DILocation(line: 486, column: 13, scope: !2667)
!2685 = distinct !{!2685, !2665, !2686, !105}
!2686 = !DILocation(line: 487, column: 3, scope: !2657)
!2687 = !DILocation(line: 488, column: 1, scope: !2657)
!2688 = distinct !DISubprogram(name: "store64", scope: !49, file: !49, line: 41, type: !2689, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2689 = !DISubroutineType(types: !2690)
!2690 = !{null, !6, !45}
!2691 = !DILocalVariable(name: "x", arg: 1, scope: !2688, file: !49, line: 41, type: !6)
!2692 = !DILocation(line: 0, scope: !2688)
!2693 = !DILocalVariable(name: "u", arg: 2, scope: !2688, file: !49, line: 41, type: !45)
!2694 = !DILocalVariable(name: "i", scope: !2688, file: !49, line: 42, type: !14)
!2695 = !DILocation(line: 44, column: 8, scope: !2696)
!2696 = distinct !DILexicalBlock(scope: !2688, file: !49, line: 44, column: 3)
!2697 = !DILocation(line: 44, scope: !2696)
!2698 = !DILocation(line: 44, column: 17, scope: !2699)
!2699 = distinct !DILexicalBlock(scope: !2696, file: !49, line: 44, column: 3)
!2700 = !DILocation(line: 44, column: 3, scope: !2696)
!2701 = !DILocation(line: 45, column: 19, scope: !2699)
!2702 = !DILocation(line: 45, column: 14, scope: !2699)
!2703 = !DILocation(line: 45, column: 12, scope: !2699)
!2704 = !DILocation(line: 45, column: 5, scope: !2699)
!2705 = !DILocation(line: 45, column: 10, scope: !2699)
!2706 = !DILocation(line: 44, column: 23, scope: !2699)
!2707 = !DILocation(line: 44, column: 3, scope: !2699)
!2708 = distinct !{!2708, !2700, !2709, !105}
!2709 = !DILocation(line: 45, column: 21, scope: !2696)
!2710 = !DILocation(line: 46, column: 1, scope: !2688)
!2711 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_init", scope: !49, file: !49, line: 586, type: !1914, scopeLine: 586, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2712 = !DILocalVariable(name: "state", arg: 1, scope: !2711, file: !49, line: 586, type: !1916)
!2713 = !DILocation(line: 0, scope: !2711)
!2714 = !DILocation(line: 587, column: 3, scope: !2711)
!2715 = !DILocation(line: 588, column: 3, scope: !2711)
!2716 = !DILocation(line: 588, column: 29, scope: !2711)
!2717 = !DILocation(line: 589, column: 1, scope: !2711)
!2718 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb", scope: !49, file: !49, line: 601, type: !1944, scopeLine: 601, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2719 = !DILocalVariable(name: "state", arg: 1, scope: !2718, file: !49, line: 601, type: !1916)
!2720 = !DILocation(line: 0, scope: !2718)
!2721 = !DILocalVariable(name: "in", arg: 2, scope: !2718, file: !49, line: 601, type: !232)
!2722 = !DILocalVariable(name: "inlen", arg: 3, scope: !2718, file: !49, line: 601, type: !12)
!2723 = !DILocation(line: 602, column: 53, scope: !2718)
!2724 = !DILocation(line: 602, column: 31, scope: !2718)
!2725 = !DILocation(line: 602, column: 3, scope: !2718)
!2726 = !DILocation(line: 602, column: 29, scope: !2718)
!2727 = !DILocation(line: 604, column: 1, scope: !2718)
!2728 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_finalize", scope: !49, file: !49, line: 613, type: !1914, scopeLine: 613, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2729 = !DILocalVariable(name: "state", arg: 1, scope: !2728, file: !49, line: 613, type: !1916)
!2730 = !DILocation(line: 0, scope: !2728)
!2731 = !DILocation(line: 614, column: 27, scope: !2728)
!2732 = !DILocation(line: 614, column: 3, scope: !2728)
!2733 = !DILocation(line: 615, column: 3, scope: !2728)
!2734 = !DILocation(line: 615, column: 29, scope: !2728)
!2735 = !DILocation(line: 616, column: 1, scope: !2728)
!2736 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeeze", scope: !49, file: !49, line: 629, type: !2497, scopeLine: 629, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2737 = !DILocalVariable(name: "out", arg: 1, scope: !2736, file: !49, line: 629, type: !6)
!2738 = !DILocation(line: 0, scope: !2736)
!2739 = !DILocalVariable(name: "outlen", arg: 2, scope: !2736, file: !49, line: 629, type: !12)
!2740 = !DILocalVariable(name: "state", arg: 3, scope: !2736, file: !49, line: 629, type: !1916)
!2741 = !DILocation(line: 631, column: 28, scope: !2736)
!2742 = !DILocation(line: 630, column: 31, scope: !2736)
!2743 = !DILocation(line: 630, column: 3, scope: !2736)
!2744 = !DILocation(line: 630, column: 29, scope: !2736)
!2745 = !DILocation(line: 632, column: 1, scope: !2736)
!2746 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb_once", scope: !49, file: !49, line: 645, type: !1944, scopeLine: 646, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2747 = !DILocalVariable(name: "state", arg: 1, scope: !2746, file: !49, line: 645, type: !1916)
!2748 = !DILocation(line: 0, scope: !2746)
!2749 = !DILocalVariable(name: "in", arg: 2, scope: !2746, file: !49, line: 645, type: !232)
!2750 = !DILocalVariable(name: "inlen", arg: 3, scope: !2746, file: !49, line: 646, type: !12)
!2751 = !DILocation(line: 647, column: 3, scope: !2746)
!2752 = !DILocation(line: 648, column: 3, scope: !2746)
!2753 = !DILocation(line: 648, column: 29, scope: !2746)
!2754 = !DILocation(line: 649, column: 1, scope: !2746)
!2755 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeezeblocks", scope: !49, file: !49, line: 664, type: !2497, scopeLine: 664, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2756 = !DILocalVariable(name: "out", arg: 1, scope: !2755, file: !49, line: 664, type: !6)
!2757 = !DILocation(line: 0, scope: !2755)
!2758 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2755, file: !49, line: 664, type: !12)
!2759 = !DILocalVariable(name: "state", arg: 3, scope: !2755, file: !49, line: 664, type: !1916)
!2760 = !DILocation(line: 665, column: 3, scope: !2755)
!2761 = !DILocation(line: 666, column: 1, scope: !2755)
!2762 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128", scope: !49, file: !49, line: 678, type: !2763, scopeLine: 678, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2763 = !DISubroutineType(types: !2764)
!2764 = !{null, !6, !12, !232, !12}
!2765 = !DILocalVariable(name: "out", arg: 1, scope: !2762, file: !49, line: 678, type: !6)
!2766 = !DILocation(line: 0, scope: !2762)
!2767 = !DILocalVariable(name: "outlen", arg: 2, scope: !2762, file: !49, line: 678, type: !12)
!2768 = !DILocalVariable(name: "in", arg: 3, scope: !2762, file: !49, line: 678, type: !232)
!2769 = !DILocalVariable(name: "inlen", arg: 4, scope: !2762, file: !49, line: 678, type: !12)
!2770 = !DILocalVariable(name: "state", scope: !2762, file: !49, line: 680, type: !344)
!2771 = !DILocation(line: 680, column: 16, scope: !2762)
!2772 = !DILocation(line: 682, column: 3, scope: !2762)
!2773 = !DILocation(line: 683, column: 20, scope: !2762)
!2774 = !DILocalVariable(name: "nblocks", scope: !2762, file: !49, line: 679, type: !12)
!2775 = !DILocation(line: 684, column: 3, scope: !2762)
!2776 = !DILocation(line: 685, column: 21, scope: !2762)
!2777 = !DILocation(line: 685, column: 10, scope: !2762)
!2778 = !DILocation(line: 686, column: 18, scope: !2762)
!2779 = !DILocation(line: 686, column: 7, scope: !2762)
!2780 = !DILocation(line: 687, column: 3, scope: !2762)
!2781 = !DILocation(line: 688, column: 1, scope: !2762)
!2782 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256", scope: !49, file: !49, line: 700, type: !2763, scopeLine: 700, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2783 = !DILocalVariable(name: "out", arg: 1, scope: !2782, file: !49, line: 700, type: !6)
!2784 = !DILocation(line: 0, scope: !2782)
!2785 = !DILocalVariable(name: "outlen", arg: 2, scope: !2782, file: !49, line: 700, type: !12)
!2786 = !DILocalVariable(name: "in", arg: 3, scope: !2782, file: !49, line: 700, type: !232)
!2787 = !DILocalVariable(name: "inlen", arg: 4, scope: !2782, file: !49, line: 700, type: !12)
!2788 = !DILocalVariable(name: "state", scope: !2782, file: !49, line: 702, type: !344)
!2789 = !DILocation(line: 702, column: 16, scope: !2782)
!2790 = !DILocation(line: 704, column: 3, scope: !2782)
!2791 = !DILocation(line: 705, column: 20, scope: !2782)
!2792 = !DILocalVariable(name: "nblocks", scope: !2782, file: !49, line: 701, type: !12)
!2793 = !DILocation(line: 706, column: 3, scope: !2782)
!2794 = !DILocation(line: 707, column: 21, scope: !2782)
!2795 = !DILocation(line: 707, column: 10, scope: !2782)
!2796 = !DILocation(line: 708, column: 18, scope: !2782)
!2797 = !DILocation(line: 708, column: 7, scope: !2782)
!2798 = !DILocation(line: 709, column: 3, scope: !2782)
!2799 = !DILocation(line: 710, column: 1, scope: !2782)
!2800 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_256", scope: !49, file: !49, line: 721, type: !2801, scopeLine: 721, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2801 = !DISubroutineType(types: !2802)
!2802 = !{null, !6, !232, !12}
!2803 = !DILocalVariable(name: "h", arg: 1, scope: !2800, file: !49, line: 721, type: !6)
!2804 = !DILocation(line: 0, scope: !2800)
!2805 = !DILocalVariable(name: "in", arg: 2, scope: !2800, file: !49, line: 721, type: !232)
!2806 = !DILocalVariable(name: "inlen", arg: 3, scope: !2800, file: !49, line: 721, type: !12)
!2807 = !DILocalVariable(name: "s", scope: !2800, file: !49, line: 723, type: !2808)
!2808 = !DICompositeType(tag: DW_TAG_array_type, baseType: !45, size: 1600, elements: !2809)
!2809 = !{!2810}
!2810 = !DISubrange(count: 25)
!2811 = !DILocation(line: 723, column: 12, scope: !2800)
!2812 = !DILocation(line: 725, column: 3, scope: !2800)
!2813 = !DILocation(line: 726, column: 3, scope: !2800)
!2814 = !DILocalVariable(name: "i", scope: !2800, file: !49, line: 722, type: !14)
!2815 = !DILocation(line: 727, column: 8, scope: !2816)
!2816 = distinct !DILexicalBlock(scope: !2800, file: !49, line: 727, column: 3)
!2817 = !DILocation(line: 727, scope: !2816)
!2818 = !DILocation(line: 727, column: 17, scope: !2819)
!2819 = distinct !DILexicalBlock(scope: !2816, file: !49, line: 727, column: 3)
!2820 = !DILocation(line: 727, column: 3, scope: !2816)
!2821 = !DILocation(line: 728, column: 19, scope: !2819)
!2822 = !DILocation(line: 728, column: 15, scope: !2819)
!2823 = !DILocation(line: 728, column: 24, scope: !2819)
!2824 = !DILocation(line: 728, column: 5, scope: !2819)
!2825 = !DILocation(line: 727, column: 23, scope: !2819)
!2826 = !DILocation(line: 727, column: 3, scope: !2819)
!2827 = distinct !{!2827, !2820, !2828, !105}
!2828 = !DILocation(line: 728, column: 28, scope: !2816)
!2829 = !DILocation(line: 729, column: 1, scope: !2800)
!2830 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_512", scope: !49, file: !49, line: 740, type: !2801, scopeLine: 740, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2831 = !DILocalVariable(name: "h", arg: 1, scope: !2830, file: !49, line: 740, type: !6)
!2832 = !DILocation(line: 0, scope: !2830)
!2833 = !DILocalVariable(name: "in", arg: 2, scope: !2830, file: !49, line: 740, type: !232)
!2834 = !DILocalVariable(name: "inlen", arg: 3, scope: !2830, file: !49, line: 740, type: !12)
!2835 = !DILocalVariable(name: "s", scope: !2830, file: !49, line: 742, type: !2808)
!2836 = !DILocation(line: 742, column: 12, scope: !2830)
!2837 = !DILocation(line: 744, column: 3, scope: !2830)
!2838 = !DILocation(line: 745, column: 3, scope: !2830)
!2839 = !DILocalVariable(name: "i", scope: !2830, file: !49, line: 741, type: !14)
!2840 = !DILocation(line: 746, column: 8, scope: !2841)
!2841 = distinct !DILexicalBlock(scope: !2830, file: !49, line: 746, column: 3)
!2842 = !DILocation(line: 746, scope: !2841)
!2843 = !DILocation(line: 746, column: 17, scope: !2844)
!2844 = distinct !DILexicalBlock(scope: !2841, file: !49, line: 746, column: 3)
!2845 = !DILocation(line: 746, column: 3, scope: !2841)
!2846 = !DILocation(line: 747, column: 19, scope: !2844)
!2847 = !DILocation(line: 747, column: 15, scope: !2844)
!2848 = !DILocation(line: 747, column: 24, scope: !2844)
!2849 = !DILocation(line: 747, column: 5, scope: !2844)
!2850 = !DILocation(line: 746, column: 23, scope: !2844)
!2851 = !DILocation(line: 746, column: 3, scope: !2844)
!2852 = distinct !{!2852, !2845, !2853, !105}
!2853 = !DILocation(line: 747, column: 28, scope: !2841)
!2854 = !DILocation(line: 748, column: 1, scope: !2830)
!2855 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_kyber_shake128_absorb", scope: !2856, file: !2856, line: 18, type: !2857, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !74, retainedNodes: !24)
!2856 = !DIFile(filename: "../../../ref/symmetric-shake.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!2857 = !DISubroutineType(types: !2858)
!2858 = !{null, !1916, !232, !7, !7}
!2859 = !DILocalVariable(name: "state", arg: 1, scope: !2855, file: !2856, line: 18, type: !1916)
!2860 = !DILocation(line: 0, scope: !2855)
!2861 = !DILocalVariable(name: "seed", arg: 2, scope: !2855, file: !2856, line: 19, type: !232)
!2862 = !DILocalVariable(name: "x", arg: 3, scope: !2855, file: !2856, line: 20, type: !7)
!2863 = !DILocalVariable(name: "y", arg: 4, scope: !2855, file: !2856, line: 21, type: !7)
!2864 = !DILocalVariable(name: "extseed", scope: !2855, file: !2856, line: 23, type: !2865)
!2865 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 272, elements: !2866)
!2866 = !{!2867}
!2867 = !DISubrange(count: 34)
!2868 = !DILocation(line: 23, column: 11, scope: !2855)
!2869 = !DILocation(line: 25, column: 3, scope: !2855)
!2870 = !DILocation(line: 26, column: 3, scope: !2855)
!2871 = !DILocation(line: 26, column: 29, scope: !2855)
!2872 = !DILocation(line: 27, column: 3, scope: !2855)
!2873 = !DILocation(line: 27, column: 29, scope: !2855)
!2874 = !DILocation(line: 29, column: 3, scope: !2855)
!2875 = !DILocation(line: 30, column: 1, scope: !2855)
!2876 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_kyber_shake256_prf", scope: !2856, file: !2856, line: 43, type: !2877, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !74, retainedNodes: !24)
!2877 = !DISubroutineType(types: !2878)
!2878 = !{null, !6, !12, !232, !7}
!2879 = !DILocalVariable(name: "out", arg: 1, scope: !2876, file: !2856, line: 43, type: !6)
!2880 = !DILocation(line: 0, scope: !2876)
!2881 = !DILocalVariable(name: "outlen", arg: 2, scope: !2876, file: !2856, line: 43, type: !12)
!2882 = !DILocalVariable(name: "key", arg: 3, scope: !2876, file: !2856, line: 43, type: !232)
!2883 = !DILocalVariable(name: "nonce", arg: 4, scope: !2876, file: !2856, line: 43, type: !7)
!2884 = !DILocalVariable(name: "extkey", scope: !2876, file: !2856, line: 45, type: !2885)
!2885 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 264, elements: !2886)
!2886 = !{!2887}
!2887 = !DISubrange(count: 33)
!2888 = !DILocation(line: 45, column: 11, scope: !2876)
!2889 = !DILocation(line: 47, column: 3, scope: !2876)
!2890 = !DILocation(line: 48, column: 3, scope: !2876)
!2891 = !DILocation(line: 48, column: 26, scope: !2876)
!2892 = !DILocation(line: 50, column: 3, scope: !2876)
!2893 = !DILocation(line: 51, column: 1, scope: !2876)
!2894 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_kyber_shake256_rkprf", scope: !2856, file: !2856, line: 64, type: !639, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !74, retainedNodes: !24)
!2895 = !DILocalVariable(name: "out", arg: 1, scope: !2894, file: !2856, line: 64, type: !6)
!2896 = !DILocation(line: 0, scope: !2894)
!2897 = !DILocalVariable(name: "key", arg: 2, scope: !2894, file: !2856, line: 64, type: !232)
!2898 = !DILocalVariable(name: "input", arg: 3, scope: !2894, file: !2856, line: 64, type: !232)
!2899 = !DILocalVariable(name: "s", scope: !2894, file: !2856, line: 66, type: !344)
!2900 = !DILocation(line: 66, column: 16, scope: !2894)
!2901 = !DILocation(line: 68, column: 3, scope: !2894)
!2902 = !DILocation(line: 69, column: 3, scope: !2894)
!2903 = !DILocation(line: 70, column: 3, scope: !2894)
!2904 = !DILocation(line: 71, column: 3, scope: !2894)
!2905 = !DILocation(line: 72, column: 3, scope: !2894)
!2906 = !DILocation(line: 73, column: 1, scope: !2894)
