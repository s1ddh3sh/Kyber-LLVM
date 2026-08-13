; ModuleID = 'kyber_composite'
source_filename = "kyber_composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "thumbv7em-unknown-none-eabihf"

@randombytes.fd = internal unnamed_addr global i32 -1, align 4, !dbg !0
@.str = private unnamed_addr constant [13 x i8] c"/dev/urandom\00", align 1, !dbg !18
@pqcrystals_kyber768_ref_zetas = dso_local local_unnamed_addr constant [128 x i16] [i16 -1044, i16 -758, i16 -359, i16 -1517, i16 1493, i16 1422, i16 287, i16 202, i16 -171, i16 622, i16 1577, i16 182, i16 962, i16 -1202, i16 -1474, i16 1468, i16 573, i16 -1325, i16 264, i16 383, i16 -829, i16 1458, i16 -1602, i16 -130, i16 -681, i16 1017, i16 732, i16 608, i16 -1542, i16 411, i16 -205, i16 -1571, i16 1223, i16 652, i16 -552, i16 1015, i16 -1293, i16 1491, i16 -282, i16 -1544, i16 516, i16 -8, i16 -320, i16 -666, i16 -1618, i16 -1162, i16 126, i16 1469, i16 -853, i16 -90, i16 -271, i16 830, i16 107, i16 -1421, i16 -247, i16 -951, i16 -398, i16 961, i16 -1508, i16 -725, i16 448, i16 -1065, i16 677, i16 -1275, i16 -1103, i16 430, i16 555, i16 843, i16 -1251, i16 871, i16 1550, i16 105, i16 422, i16 587, i16 177, i16 -235, i16 -291, i16 -460, i16 1574, i16 1653, i16 -246, i16 778, i16 1159, i16 -147, i16 -777, i16 1483, i16 -602, i16 1119, i16 -1590, i16 644, i16 -872, i16 349, i16 418, i16 329, i16 -156, i16 -75, i16 817, i16 1097, i16 603, i16 610, i16 1322, i16 -1285, i16 -1465, i16 384, i16 -1215, i16 -136, i16 1218, i16 -1335, i16 -874, i16 220, i16 -1187, i16 -1659, i16 -1185, i16 -1530, i16 -1278, i16 794, i16 -1510, i16 -854, i16 -870, i16 478, i16 -108, i16 -308, i16 996, i16 991, i16 958, i16 -1460, i16 1522, i16 1628], align 2, !dbg !26
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
  %pk = alloca [1184 x i8], align 1
  %sk = alloca [2400 x i8], align 1
  %ct = alloca [1088 x i8], align 1
  %key_a = alloca [32 x i8], align 1
  %key_b = alloca [32 x i8], align 1
    #dbg_declare(ptr %pk, !110, !DIExpression(), !114)
    #dbg_declare(ptr %sk, !115, !DIExpression(), !119)
    #dbg_declare(ptr %ct, !120, !DIExpression(), !124)
    #dbg_declare(ptr %key_a, !125, !DIExpression(), !129)
    #dbg_declare(ptr %key_b, !130, !DIExpression(), !131)
  %call = call i32 @pqcrystals_kyber768_ref_keypair(ptr noundef nonnull %pk, ptr noundef nonnull %sk) #3, !dbg !132
  %call5 = call i32 @pqcrystals_kyber768_ref_enc(ptr noundef nonnull %ct, ptr noundef nonnull %key_b, ptr noundef nonnull %pk) #3, !dbg !133
  %call9 = call i32 @pqcrystals_kyber768_ref_dec(ptr noundef nonnull %key_a, ptr noundef nonnull %ct, ptr noundef nonnull %sk) #3, !dbg !134
  %call12 = call i32 @memcmp(ptr noundef nonnull %key_a, ptr noundef nonnull %key_b, i32 noundef 32) #4, !dbg !135
  %tobool.not = icmp ne i32 %call12, 0, !dbg !135
  %. = zext i1 %tobool.not to i32, !dbg !137
  ret i32 %., !dbg !138
}

; Function Attrs: nounwind
define internal fastcc range(i32 0, 2) i32 @test_invalid_sk_a() unnamed_addr #0 !dbg !139 {
entry:
  %pk = alloca [1184 x i8], align 1
  %sk = alloca [2400 x i8], align 1
  %ct = alloca [1088 x i8], align 1
  %key_a = alloca [32 x i8], align 1
  %key_b = alloca [32 x i8], align 1
    #dbg_declare(ptr %pk, !140, !DIExpression(), !141)
    #dbg_declare(ptr %sk, !142, !DIExpression(), !143)
    #dbg_declare(ptr %ct, !144, !DIExpression(), !145)
    #dbg_declare(ptr %key_a, !146, !DIExpression(), !147)
    #dbg_declare(ptr %key_b, !148, !DIExpression(), !149)
  %call = call i32 @pqcrystals_kyber768_ref_keypair(ptr noundef nonnull %pk, ptr noundef nonnull %sk) #3, !dbg !150
  %call5 = call i32 @pqcrystals_kyber768_ref_enc(ptr noundef nonnull %ct, ptr noundef nonnull %key_b, ptr noundef nonnull %pk) #3, !dbg !151
  call void @randombytes(ptr noundef nonnull %sk, i32 noundef 2400) #3, !dbg !152
  %call10 = call i32 @pqcrystals_kyber768_ref_dec(ptr noundef nonnull %key_a, ptr noundef nonnull %ct, ptr noundef nonnull %sk) #3, !dbg !153
  %call13 = call i32 @memcmp(ptr noundef nonnull %key_a, ptr noundef nonnull %key_b, i32 noundef 32) #4, !dbg !154
  %tobool.not = icmp eq i32 %call13, 0, !dbg !154
  %. = zext i1 %tobool.not to i32, !dbg !156
  ret i32 %., !dbg !157
}

; Function Attrs: nounwind
define internal fastcc range(i32 0, 2) i32 @test_invalid_ciphertext() unnamed_addr #0 !dbg !158 {
entry:
  %pk = alloca [1184 x i8], align 1
  %sk = alloca [2400 x i8], align 1
  %ct = alloca [1088 x i8], align 1
  %key_a = alloca [32 x i8], align 1
  %key_b = alloca [32 x i8], align 1
  %b = alloca i8, align 1
  %pos = alloca i32, align 4
    #dbg_declare(ptr %pk, !159, !DIExpression(), !160)
    #dbg_declare(ptr %sk, !161, !DIExpression(), !162)
    #dbg_declare(ptr %ct, !163, !DIExpression(), !164)
    #dbg_declare(ptr %key_a, !165, !DIExpression(), !166)
    #dbg_declare(ptr %key_b, !167, !DIExpression(), !168)
  br label %do.body, !dbg !169

do.body:                                          ; preds = %do.body, %entry
    #dbg_value(ptr %b, !170, !DIExpression(DW_OP_deref), !171)
  call void @randombytes(ptr noundef nonnull %b, i32 noundef 1) #3, !dbg !172
  %0 = load i8, ptr %b, align 1, !dbg !174
    #dbg_value(i8 %0, !170, !DIExpression(), !171)
  %tobool.not = icmp eq i8 %0, 0, !dbg !175
  br i1 %tobool.not, label %do.body, label %do.end, !dbg !176, !llvm.loop !177

do.end:                                           ; preds = %do.body
    #dbg_value(ptr %pos, !179, !DIExpression(DW_OP_deref), !171)
  call void @randombytes(ptr noundef nonnull %pos, i32 noundef 4) #3, !dbg !180
  %call = call i32 @pqcrystals_kyber768_ref_keypair(ptr noundef nonnull %pk, ptr noundef nonnull %sk) #3, !dbg !181
  %call5 = call i32 @pqcrystals_kyber768_ref_enc(ptr noundef nonnull %ct, ptr noundef nonnull %key_b, ptr noundef nonnull %pk) #3, !dbg !182
  %1 = load i8, ptr %b, align 1, !dbg !183
    #dbg_value(i8 %1, !170, !DIExpression(), !171)
  %2 = load i32, ptr %pos, align 4, !dbg !184
    #dbg_value(i32 %2, !179, !DIExpression(), !171)
  %rem = urem i32 %2, 1088, !dbg !185
  %arrayidx = getelementptr inbounds nuw [1088 x i8], ptr %ct, i32 0, i32 %rem, !dbg !186
  %3 = load i8, ptr %arrayidx, align 1, !dbg !187
  %xor1 = xor i8 %3, %1, !dbg !187
  store i8 %xor1, ptr %arrayidx, align 1, !dbg !187
  %call11 = call i32 @pqcrystals_kyber768_ref_dec(ptr noundef nonnull %key_a, ptr noundef nonnull %ct, ptr noundef nonnull %sk) #3, !dbg !188
  %call14 = call i32 @memcmp(ptr noundef nonnull %key_a, ptr noundef nonnull %key_b, i32 noundef 32) #4, !dbg !189
  %tobool15.not = icmp eq i32 %call14, 0, !dbg !189
  %. = zext i1 %tobool15.not to i32, !dbg !171
  ret i32 %., !dbg !191
}

declare dso_local i32 @memcmp(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local void @randombytes(ptr noundef %out, i32 noundef %outlen) local_unnamed_addr #0 !dbg !2 {
entry:
    #dbg_value(ptr %out, !192, !DIExpression(), !193)
    #dbg_value(i32 %outlen, !194, !DIExpression(), !193)
  br label %while.cond, !dbg !195

while.cond:                                       ; preds = %while.cond.backedge, %entry
  %0 = load i32, ptr @randombytes.fd, align 4, !dbg !196
  %cmp = icmp eq i32 %0, -1, !dbg !197
  br i1 %cmp, label %while.body, label %while.cond7.preheader, !dbg !195

while.cond7.preheader:                            ; preds = %while.cond
  br label %while.cond7.outer, !dbg !198

while.body:                                       ; preds = %while.cond
  %call = call i32 (ptr, i32, ...) @open(ptr noundef nonnull @.str, i32 noundef 0) #4, !dbg !199
  store i32 %call, ptr @randombytes.fd, align 4, !dbg !201
  %cmp1 = icmp eq i32 %call, -1, !dbg !202
  br i1 %cmp1, label %land.lhs.true, label %if.else, !dbg !204

land.lhs.true:                                    ; preds = %while.body
  %call2 = call ptr @__errno() #4, !dbg !205
  %1 = load i32, ptr %call2, align 4, !dbg !205
  %cmp3 = icmp eq i32 %1, 4, !dbg !206
  br i1 %cmp3, label %while.cond.backedge, label %if.else, !dbg !204

if.else:                                          ; preds = %land.lhs.true, %while.body
  %2 = load i32, ptr @randombytes.fd, align 4, !dbg !207
  %cmp4 = icmp eq i32 %2, -1, !dbg !209
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !209

if.then5:                                         ; preds = %if.else
  call void @abort() #4, !dbg !210
  br label %if.end6, !dbg !210

if.end6:                                          ; preds = %if.else, %if.then5
  br label %while.cond.backedge, !dbg !195

while.cond.backedge:                              ; preds = %if.end6, %land.lhs.true
  br label %while.cond, !dbg !196, !llvm.loop !211

while.cond7:                                      ; preds = %while.cond7.outer, %land.lhs.true12
    #dbg_value(ptr %out.addr.0.ph, !192, !DIExpression(), !193)
    #dbg_value(i32 %outlen.addr.0.ph, !194, !DIExpression(), !193)
  %cmp8.not = icmp eq i32 %outlen.addr.0.ph, 0, !dbg !213
  br i1 %cmp8.not, label %while.end21, label %while.body9, !dbg !198

while.body9:                                      ; preds = %while.cond7
  %3 = load i32, ptr @randombytes.fd, align 4, !dbg !214
  %call10 = call i32 @read(i32 noundef %3, ptr noundef %out.addr.0.ph, i32 noundef %outlen.addr.0.ph) #4, !dbg !216
    #dbg_value(i32 %call10, !217, !DIExpression(), !193)
  %cond = icmp eq i32 %call10, -1, !dbg !222
  br i1 %cond, label %land.lhs.true12, label %if.end20.loopexit, !dbg !222

land.lhs.true12:                                  ; preds = %while.body9
  %call13 = call ptr @__errno() #4, !dbg !224
  %4 = load i32, ptr %call13, align 4, !dbg !224
  %cmp14 = icmp eq i32 %4, 4, !dbg !225
  br i1 %cmp14, label %while.cond7, label %if.then18, !dbg !222, !llvm.loop !226

if.then18:                                        ; preds = %land.lhs.true12
  %call10.lcssa1 = phi i32 [ %call10, %land.lhs.true12 ], !dbg !216
  call void @abort() #4, !dbg !228
  br label %if.end20, !dbg !228

if.end20.loopexit:                                ; preds = %while.body9
  %call10.lcssa = phi i32 [ %call10, %while.body9 ], !dbg !216
  br label %if.end20, !dbg !230

if.end20:                                         ; preds = %if.end20.loopexit, %if.then18
  %call102 = phi i32 [ %call10.lcssa, %if.end20.loopexit ], [ %call10.lcssa1, %if.then18 ]
  %add.ptr = getelementptr inbounds i8, ptr %out.addr.0.ph, i32 %call102, !dbg !230
    #dbg_value(ptr %add.ptr, !192, !DIExpression(), !193)
  %sub = sub i32 %outlen.addr.0.ph, %call102, !dbg !231
    #dbg_value(i32 %sub, !194, !DIExpression(), !193)
  br label %while.cond7.outer, !dbg !198, !llvm.loop !226

while.cond7.outer:                                ; preds = %while.cond7.preheader, %if.end20
  %outlen.addr.0.ph = phi i32 [ %outlen, %while.cond7.preheader ], [ %sub, %if.end20 ]
  %out.addr.0.ph = phi ptr [ %out, %while.cond7.preheader ], [ %add.ptr, %if.end20 ]
  br label %while.cond7, !dbg !198

while.end21:                                      ; preds = %while.cond7
  ret void, !dbg !232
}

declare dso_local i32 @open(ptr noundef, i32 noundef, ...) local_unnamed_addr #1

declare dso_local ptr @__errno() local_unnamed_addr #1

declare dso_local void @abort() local_unnamed_addr #1

declare dso_local i32 @read(i32 noundef, ptr noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber768_ref_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) local_unnamed_addr #0 !dbg !233 {
entry:
    #dbg_value(ptr %pk, !239, !DIExpression(), !240)
    #dbg_value(ptr %sk, !241, !DIExpression(), !240)
    #dbg_value(ptr %coins, !242, !DIExpression(), !240)
  call void @pqcrystals_kyber768_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) #3, !dbg !243
  %add.ptr = getelementptr inbounds nuw i8, ptr %sk, i32 1152, !dbg !244
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr, ptr noundef %pk, i32 noundef 1184) #4, !dbg !245
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %sk, i32 2336, !dbg !246
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr2, ptr noundef %pk, i32 noundef 1184) #3, !dbg !246
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %sk, i32 2368, !dbg !247
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %coins, i32 32, !dbg !248
  %call6 = call ptr @memcpy(ptr noundef nonnull %add.ptr4, ptr noundef nonnull %add.ptr5, i32 noundef 32) #4, !dbg !249
  ret i32 0, !dbg !250
}

declare dso_local ptr @memcpy(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber768_ref_keypair(ptr noundef %pk, ptr noundef %sk) local_unnamed_addr #0 !dbg !251 {
entry:
  %coins = alloca [64 x i8], align 1
    #dbg_value(ptr %pk, !254, !DIExpression(), !255)
    #dbg_value(ptr %sk, !256, !DIExpression(), !255)
    #dbg_declare(ptr %coins, !257, !DIExpression(), !261)
  call void @randombytes(ptr noundef nonnull %coins, i32 noundef 64) #3, !dbg !262
  %call = call i32 @pqcrystals_kyber768_ref_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef nonnull %coins) #3, !dbg !263
  ret i32 0, !dbg !264
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber768_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef %coins) local_unnamed_addr #0 !dbg !265 {
entry:
  %buf = alloca [64 x i8], align 1
  %kr = alloca [64 x i8], align 1
    #dbg_value(ptr %ct, !268, !DIExpression(), !269)
    #dbg_value(ptr %ss, !270, !DIExpression(), !269)
    #dbg_value(ptr %pk, !271, !DIExpression(), !269)
    #dbg_value(ptr %coins, !272, !DIExpression(), !269)
    #dbg_declare(ptr %buf, !273, !DIExpression(), !274)
    #dbg_declare(ptr %kr, !275, !DIExpression(), !276)
  %call = call ptr @memcpy(ptr noundef nonnull %buf, ptr noundef %coins, i32 noundef 32) #4, !dbg !277
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !278
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef nonnull %add.ptr, ptr noundef %pk, i32 noundef 1184) #3, !dbg !278
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %kr, ptr noundef nonnull %buf, i32 noundef 64) #3, !dbg !279
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %kr, i32 32, !dbg !280
  call void @pqcrystals_kyber768_ref_indcpa_enc(ptr noundef %ct, ptr noundef nonnull %buf, ptr noundef %pk, ptr noundef nonnull %add.ptr6) #3, !dbg !281
  %call8 = call ptr @memcpy(ptr noundef %ss, ptr noundef nonnull %kr, i32 noundef 32) #4, !dbg !282
  ret i32 0, !dbg !283
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber768_ref_enc(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk) local_unnamed_addr #0 !dbg !284 {
entry:
  %coins = alloca [32 x i8], align 1
    #dbg_value(ptr %ct, !285, !DIExpression(), !286)
    #dbg_value(ptr %ss, !287, !DIExpression(), !286)
    #dbg_value(ptr %pk, !288, !DIExpression(), !286)
    #dbg_declare(ptr %coins, !289, !DIExpression(), !290)
  call void @randombytes(ptr noundef nonnull %coins, i32 noundef 32) #3, !dbg !291
  %call = call i32 @pqcrystals_kyber768_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef nonnull %coins) #3, !dbg !292
  ret i32 0, !dbg !293
}

; Function Attrs: nounwind
define dso_local i32 @pqcrystals_kyber768_ref_dec(ptr noundef %ss, ptr noundef %ct, ptr noundef %sk) local_unnamed_addr #0 !dbg !294 {
entry:
  %buf = alloca [64 x i8], align 1
  %kr = alloca [64 x i8], align 1
  %cmp = alloca [1088 x i8], align 1
    #dbg_value(ptr %ss, !297, !DIExpression(), !298)
    #dbg_value(ptr %ct, !299, !DIExpression(), !298)
    #dbg_value(ptr %sk, !300, !DIExpression(), !298)
    #dbg_declare(ptr %buf, !301, !DIExpression(), !302)
    #dbg_declare(ptr %kr, !303, !DIExpression(), !304)
    #dbg_declare(ptr %cmp, !305, !DIExpression(), !306)
  %add.ptr = getelementptr inbounds nuw i8, ptr %sk, i32 1152, !dbg !307
    #dbg_value(ptr %add.ptr, !308, !DIExpression(), !298)
  call void @pqcrystals_kyber768_ref_indcpa_dec(ptr noundef nonnull %buf, ptr noundef %ct, ptr noundef %sk) #3, !dbg !309
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !310
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %sk, i32 2336, !dbg !311
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr2, ptr noundef nonnull %add.ptr4, i32 noundef 32) #4, !dbg !312
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %kr, ptr noundef nonnull %buf, i32 noundef 64) #3, !dbg !313
  %add.ptr10 = getelementptr inbounds nuw i8, ptr %kr, i32 32, !dbg !314
  call void @pqcrystals_kyber768_ref_indcpa_enc(ptr noundef nonnull %cmp, ptr noundef nonnull %buf, ptr noundef nonnull %add.ptr, ptr noundef nonnull %add.ptr10) #3, !dbg !315
  %call12 = call i32 @pqcrystals_kyber768_ref_verify(ptr noundef %ct, ptr noundef nonnull %cmp, i32 noundef 1088) #3, !dbg !316
    #dbg_value(i32 %call12, !317, !DIExpression(), !298)
  %add.ptr14 = getelementptr inbounds nuw i8, ptr %sk, i32 2368, !dbg !318
  call void @pqcrystals_kyber768_ref_kyber_shake256_rkprf(ptr noundef %ss, ptr noundef nonnull %add.ptr14, ptr noundef %ct) #3, !dbg !318
  %0 = trunc nuw nsw i32 %call12 to i8, !dbg !319
  %conv = xor i8 %0, 1, !dbg !319
  call void @pqcrystals_kyber768_ref_cmov(ptr noundef %ss, ptr noundef nonnull %kr, i32 noundef 32, i8 noundef zeroext %conv) #3, !dbg !320
  ret i32 0, !dbg !321
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_gen_matrix(ptr noundef %a, ptr noundef %seed, i32 noundef %transposed) local_unnamed_addr #0 !dbg !322 {
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
  %exitcond1 = icmp ne i32 %i.0, 3, !dbg !359
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end20, !dbg !361

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !362

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc
  %j.0 = phi i32 [ %inc, %for.inc ], [ 0, %for.cond1.preheader ], !dbg !365
    #dbg_value(i32 %j.0, !366, !DIExpression(), !338)
  %exitcond = icmp ne i32 %j.0, 3, !dbg !367
  br i1 %exitcond, label %for.body3, label %for.inc18, !dbg !362

for.body3:                                        ; preds = %for.cond1
  %tobool.not = icmp eq i32 %transposed, 0, !dbg !369
  br i1 %tobool.not, label %if.else, label %if.then, !dbg !369

if.then:                                          ; preds = %for.body3
  %conv = trunc nuw i32 %i.0 to i8, !dbg !372
  %conv4 = trunc nuw nsw i32 %j.0 to i8, !dbg !372
  call void @pqcrystals_kyber768_ref_kyber_shake128_absorb(ptr noundef nonnull %state, ptr noundef %seed, i8 noundef zeroext %conv, i8 noundef zeroext %conv4) #3, !dbg !372
  br label %if.end, !dbg !372

if.else:                                          ; preds = %for.body3
  %conv5 = trunc nuw nsw i32 %j.0 to i8, !dbg !373
  %conv6 = trunc nuw i32 %i.0 to i8, !dbg !373
  call void @pqcrystals_kyber768_ref_kyber_shake128_absorb(ptr noundef nonnull %state, ptr noundef %seed, i8 noundef zeroext %conv5, i8 noundef zeroext %conv6) #3, !dbg !373
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef nonnull %buf, i32 noundef 3, ptr noundef nonnull %state) #3, !dbg !374
    #dbg_value(i32 504, !375, !DIExpression(), !338)
  %arrayidx7 = getelementptr inbounds nuw [3 x [256 x i16]], ptr %a, i32 %i.0, i32 %j.0, !dbg !376
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
  %arrayidx14 = getelementptr inbounds nuw [3 x [256 x i16]], ptr %a, i32 %i.0, i32 %j.0, !dbg !384
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
define dso_local void @pqcrystals_kyber768_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) local_unnamed_addr #0 !dbg !444 {
entry:
  %buf = alloca [64 x i8], align 1
  %a = alloca [3 x [3 x [256 x i16]]], align 2
  %e = alloca [3 x [256 x i16]], align 2
  %pkpv = alloca [3 x [256 x i16]], align 2
  %skpv = alloca [3 x [256 x i16]], align 2
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
  %call = call ptr @memcpy(ptr noundef nonnull %buf, ptr noundef %coins, i32 noundef 32) #4, !dbg !466
  %arrayidx = getelementptr inbounds nuw i8, ptr %buf, i32 32, !dbg !467
  store i8 3, ptr %arrayidx, align 1, !dbg !468
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef nonnull %buf, ptr noundef nonnull %buf, i32 noundef 33) #3, !dbg !469
  call void @pqcrystals_kyber768_ref_gen_matrix(ptr noundef nonnull %a, ptr noundef nonnull %buf, i32 noundef 0) #3, !dbg !470
    #dbg_value(i32 0, !471, !DIExpression(), !448)
  br label %for.cond, !dbg !472

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc7, %for.body ], !dbg !474
  %nonce.0 = phi i8 [ 0, %entry ], [ %inc, %for.body ], !dbg !448
    #dbg_value(i8 %nonce.0, !456, !DIExpression(), !448)
    #dbg_value(i32 %i.0, !471, !DIExpression(), !448)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !475
  br i1 %exitcond, label %for.body, label %for.cond8.preheader, !dbg !477

for.cond8.preheader:                              ; preds = %for.cond
  br label %for.cond8, !dbg !478

for.body:                                         ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds nuw [3 x [256 x i16]], ptr %skpv, i32 0, i32 %i.0, !dbg !480
    #dbg_value(i8 %nonce.0, !456, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !448)
  call void @pqcrystals_kyber768_ref_poly_getnoise_eta1(ptr noundef nonnull %arrayidx6, ptr noundef nonnull %add.ptr, i8 noundef zeroext %nonce.0) #3, !dbg !481
  %inc = add nuw nsw i8 %nonce.0, 1, !dbg !482
    #dbg_value(i8 %inc, !456, !DIExpression(), !448)
  %inc7 = add nuw nsw i32 %i.0, 1, !dbg !483
    #dbg_value(i32 %inc7, !471, !DIExpression(), !448)
  br label %for.cond, !dbg !484, !llvm.loop !485

for.cond8:                                        ; preds = %for.cond8.preheader, %for.body10
  %i.1 = phi i32 [ %inc14, %for.body10 ], [ 0, %for.cond8.preheader ], !dbg !487
  %nonce.1 = phi i8 [ %inc12, %for.body10 ], [ 3, %for.cond8.preheader ], !dbg !448
    #dbg_value(i8 %nonce.1, !456, !DIExpression(), !448)
    #dbg_value(i32 %i.1, !471, !DIExpression(), !448)
  %exitcond1 = icmp ne i32 %i.1, 3, !dbg !488
  br i1 %exitcond1, label %for.body10, label %for.end15, !dbg !478

for.body10:                                       ; preds = %for.cond8
  %arrayidx11 = getelementptr inbounds nuw [3 x [256 x i16]], ptr %e, i32 0, i32 %i.1, !dbg !490
    #dbg_value(i8 %nonce.1, !456, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !448)
  call void @pqcrystals_kyber768_ref_poly_getnoise_eta1(ptr noundef nonnull %arrayidx11, ptr noundef nonnull %add.ptr, i8 noundef zeroext %nonce.1) #3, !dbg !491
  %inc12 = add nuw nsw i8 %nonce.1, 1, !dbg !492
    #dbg_value(i8 %inc12, !456, !DIExpression(), !448)
  %inc14 = add nuw nsw i32 %i.1, 1, !dbg !493
    #dbg_value(i32 %inc14, !471, !DIExpression(), !448)
  br label %for.cond8, !dbg !494, !llvm.loop !495

for.end15:                                        ; preds = %for.cond8
  call void @pqcrystals_kyber768_ref_polyvec_ntt(ptr noundef nonnull %skpv) #3, !dbg !497
  call void @pqcrystals_kyber768_ref_polyvec_ntt(ptr noundef nonnull %e) #3, !dbg !498
    #dbg_value(i32 0, !471, !DIExpression(), !448)
  br label %for.cond16, !dbg !499

for.cond16:                                       ; preds = %for.body18, %for.end15
  %i.2 = phi i32 [ 0, %for.end15 ], [ %inc23, %for.body18 ], !dbg !501
    #dbg_value(i32 %i.2, !471, !DIExpression(), !448)
  %exitcond2 = icmp ne i32 %i.2, 3, !dbg !502
  br i1 %exitcond2, label %for.body18, label %for.end24, !dbg !504

for.body18:                                       ; preds = %for.cond16
  %arrayidx19 = getelementptr inbounds nuw [3 x [256 x i16]], ptr %pkpv, i32 0, i32 %i.2, !dbg !505
  %arrayidx20 = getelementptr inbounds nuw [3 x [3 x [256 x i16]]], ptr %a, i32 0, i32 %i.2, !dbg !507
  call void @pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %arrayidx19, ptr noundef nonnull %arrayidx20, ptr noundef nonnull %skpv) #3, !dbg !508
  %arrayidx21 = getelementptr inbounds nuw [3 x [256 x i16]], ptr %pkpv, i32 0, i32 %i.2, !dbg !509
  call void @pqcrystals_kyber768_ref_poly_tomont(ptr noundef nonnull %arrayidx21) #3, !dbg !510
  %inc23 = add nuw nsw i32 %i.2, 1, !dbg !511
    #dbg_value(i32 %inc23, !471, !DIExpression(), !448)
  br label %for.cond16, !dbg !512, !llvm.loop !513

for.end24:                                        ; preds = %for.cond16
  call void @pqcrystals_kyber768_ref_polyvec_add(ptr noundef nonnull %pkpv, ptr noundef nonnull %pkpv, ptr noundef nonnull %e) #3, !dbg !515
  call void @pqcrystals_kyber768_ref_polyvec_reduce(ptr noundef nonnull %pkpv) #3, !dbg !516
  call fastcc void @pack_sk(ptr noundef %sk, ptr noundef nonnull %skpv) #3, !dbg !517
  call fastcc void @pack_pk(ptr noundef %pk, ptr noundef nonnull %pkpv, ptr noundef nonnull %buf) #3, !dbg !518
  ret void, !dbg !519
}

; Function Attrs: nounwind
define internal fastcc void @pack_sk(ptr noundef %r, ptr noundef nonnull %sk) unnamed_addr #0 !dbg !520 {
entry:
    #dbg_value(ptr %r, !523, !DIExpression(), !524)
    #dbg_value(ptr %sk, !525, !DIExpression(), !524)
  call void @pqcrystals_kyber768_ref_polyvec_tobytes(ptr noundef %r, ptr noundef nonnull %sk) #3, !dbg !526
  ret void, !dbg !527
}

; Function Attrs: nounwind
define internal fastcc void @pack_pk(ptr noundef %r, ptr noundef nonnull %pk, ptr noundef nonnull %seed) unnamed_addr #0 !dbg !528 {
entry:
    #dbg_value(ptr %r, !531, !DIExpression(), !532)
    #dbg_value(ptr %pk, !533, !DIExpression(), !532)
    #dbg_value(ptr %seed, !534, !DIExpression(), !532)
  call void @pqcrystals_kyber768_ref_polyvec_tobytes(ptr noundef %r, ptr noundef nonnull %pk) #3, !dbg !535
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 1152, !dbg !536
  %call = call ptr @memcpy(ptr noundef nonnull %add.ptr, ptr noundef nonnull %seed, i32 noundef 32) #4, !dbg !537
  ret void, !dbg !538
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_indcpa_enc(ptr noundef %c, ptr noundef %m, ptr noundef %pk, ptr noundef %coins) local_unnamed_addr #0 !dbg !539 {
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
  call void @pqcrystals_kyber768_ref_poly_frommsg(ptr noundef nonnull %k, ptr noundef %m) #3, !dbg !567
  call void @pqcrystals_kyber768_ref_gen_matrix(ptr noundef nonnull %at, ptr noundef nonnull %seed, i32 noundef 1) #3, !dbg !568
    #dbg_value(i32 0, !569, !DIExpression(), !543)
  br label %for.cond, !dbg !570

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc4, %for.body ], !dbg !572
  %nonce.0 = phi i8 [ 0, %entry ], [ %inc, %for.body ], !dbg !543
    #dbg_value(i8 %nonce.0, !549, !DIExpression(), !543)
    #dbg_value(i32 %i.0, !569, !DIExpression(), !543)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !573
  br i1 %exitcond, label %for.body, label %for.cond5.preheader, !dbg !575

for.cond5.preheader:                              ; preds = %for.cond
  br label %for.cond5, !dbg !576

for.body:                                         ; preds = %for.cond
  %add.ptr = getelementptr inbounds nuw [256 x i16], ptr %sp, i32 %i.0, !dbg !578
    #dbg_value(i8 %nonce.0, !549, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !543)
  call void @pqcrystals_kyber768_ref_poly_getnoise_eta1(ptr noundef nonnull %add.ptr, ptr noundef %coins, i8 noundef zeroext %nonce.0) #3, !dbg !579
  %inc = add nuw nsw i8 %nonce.0, 1, !dbg !580
    #dbg_value(i8 %inc, !549, !DIExpression(), !543)
  %inc4 = add nuw nsw i32 %i.0, 1, !dbg !581
    #dbg_value(i32 %inc4, !569, !DIExpression(), !543)
  br label %for.cond, !dbg !582, !llvm.loop !583

for.cond5:                                        ; preds = %for.cond5.preheader, %for.body7
  %i.1 = phi i32 [ %inc12, %for.body7 ], [ 0, %for.cond5.preheader ], !dbg !585
  %nonce.1 = phi i8 [ %inc10, %for.body7 ], [ 3, %for.cond5.preheader ], !dbg !543
    #dbg_value(i8 %nonce.1, !549, !DIExpression(), !543)
    #dbg_value(i32 %i.1, !569, !DIExpression(), !543)
  %exitcond1 = icmp ne i32 %i.1, 3, !dbg !586
  br i1 %exitcond1, label %for.body7, label %for.end13, !dbg !576

for.body7:                                        ; preds = %for.cond5
  %add.ptr9 = getelementptr inbounds nuw [256 x i16], ptr %ep, i32 %i.1, !dbg !588
    #dbg_value(i8 %nonce.1, !549, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !543)
  call void @pqcrystals_kyber768_ref_poly_getnoise_eta2(ptr noundef nonnull %add.ptr9, ptr noundef %coins, i8 noundef zeroext %nonce.1) #3, !dbg !589
  %inc10 = add nuw nsw i8 %nonce.1, 1, !dbg !590
    #dbg_value(i8 %inc10, !549, !DIExpression(), !543)
  %inc12 = add nuw nsw i32 %i.1, 1, !dbg !591
    #dbg_value(i32 %inc12, !569, !DIExpression(), !543)
  br label %for.cond5, !dbg !592, !llvm.loop !593

for.end13:                                        ; preds = %for.cond5
    #dbg_value(i8 6, !549, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !543)
  call void @pqcrystals_kyber768_ref_poly_getnoise_eta2(ptr noundef nonnull %epp, ptr noundef %coins, i8 noundef zeroext 6) #3, !dbg !595
  call void @pqcrystals_kyber768_ref_polyvec_ntt(ptr noundef nonnull %sp) #3, !dbg !596
    #dbg_value(i32 0, !569, !DIExpression(), !543)
  br label %for.cond15, !dbg !597

for.cond15:                                       ; preds = %for.body17, %for.end13
  %i.2 = phi i32 [ 0, %for.end13 ], [ %inc20, %for.body17 ], !dbg !599
    #dbg_value(i32 %i.2, !569, !DIExpression(), !543)
  %exitcond2 = icmp ne i32 %i.2, 3, !dbg !600
  br i1 %exitcond2, label %for.body17, label %for.end21, !dbg !602

for.body17:                                       ; preds = %for.cond15
  %arrayidx = getelementptr inbounds nuw [3 x [256 x i16]], ptr %b, i32 0, i32 %i.2, !dbg !603
  %arrayidx18 = getelementptr inbounds nuw [3 x [3 x [256 x i16]]], ptr %at, i32 0, i32 %i.2, !dbg !604
  call void @pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %arrayidx, ptr noundef nonnull %arrayidx18, ptr noundef nonnull %sp) #3, !dbg !605
  %inc20 = add nuw nsw i32 %i.2, 1, !dbg !606
    #dbg_value(i32 %inc20, !569, !DIExpression(), !543)
  br label %for.cond15, !dbg !607, !llvm.loop !608

for.end21:                                        ; preds = %for.cond15
  call void @pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %v, ptr noundef nonnull %pkpv, ptr noundef nonnull %sp) #3, !dbg !610
  call void @pqcrystals_kyber768_ref_polyvec_invntt_tomont(ptr noundef nonnull %b) #3, !dbg !611
  call void @pqcrystals_kyber768_ref_poly_invntt_tomont(ptr noundef nonnull %v) #3, !dbg !612
  call void @pqcrystals_kyber768_ref_polyvec_add(ptr noundef nonnull %b, ptr noundef nonnull %b, ptr noundef nonnull %ep) #3, !dbg !613
  call void @pqcrystals_kyber768_ref_poly_add(ptr noundef nonnull %v, ptr noundef nonnull %v, ptr noundef nonnull %epp) #3, !dbg !614
  call void @pqcrystals_kyber768_ref_poly_add(ptr noundef nonnull %v, ptr noundef nonnull %v, ptr noundef nonnull %k) #3, !dbg !615
  call void @pqcrystals_kyber768_ref_polyvec_reduce(ptr noundef nonnull %b) #3, !dbg !616
  call void @pqcrystals_kyber768_ref_poly_reduce(ptr noundef nonnull %v) #3, !dbg !617
  call fastcc void @pack_ciphertext(ptr noundef %c, ptr noundef nonnull %b, ptr noundef nonnull %v) #3, !dbg !618
  ret void, !dbg !619
}

; Function Attrs: nounwind
define internal fastcc void @unpack_pk(ptr noundef nonnull %pk, ptr noundef nonnull %seed, ptr noundef %packedpk) unnamed_addr #0 !dbg !620 {
entry:
    #dbg_value(ptr %pk, !623, !DIExpression(), !624)
    #dbg_value(ptr %seed, !625, !DIExpression(), !624)
    #dbg_value(ptr %packedpk, !626, !DIExpression(), !624)
  call void @pqcrystals_kyber768_ref_polyvec_frombytes(ptr noundef nonnull %pk, ptr noundef %packedpk) #3, !dbg !627
  %add.ptr = getelementptr inbounds nuw i8, ptr %packedpk, i32 1152, !dbg !628
  %call = call ptr @memcpy(ptr noundef nonnull %seed, ptr noundef nonnull %add.ptr, i32 noundef 32) #4, !dbg !629
  ret void, !dbg !630
}

; Function Attrs: nounwind
define internal fastcc void @pack_ciphertext(ptr noundef %r, ptr noundef nonnull %b, ptr noundef nonnull %v) unnamed_addr #0 !dbg !631 {
entry:
    #dbg_value(ptr %r, !635, !DIExpression(), !636)
    #dbg_value(ptr %b, !637, !DIExpression(), !636)
    #dbg_value(ptr %v, !638, !DIExpression(), !636)
  call void @pqcrystals_kyber768_ref_polyvec_compress(ptr noundef %r, ptr noundef nonnull %b) #3, !dbg !639
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 960, !dbg !640
  call void @pqcrystals_kyber768_ref_poly_compress(ptr noundef nonnull %add.ptr, ptr noundef nonnull %v) #3, !dbg !641
  ret void, !dbg !642
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_indcpa_dec(ptr noundef %m, ptr noundef %c, ptr noundef %sk) local_unnamed_addr #0 !dbg !643 {
entry:
  %b = alloca [3 x [256 x i16]], align 2
  %skpv = alloca [3 x [256 x i16]], align 2
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
  call void @pqcrystals_kyber768_ref_polyvec_ntt(ptr noundef nonnull %b) #3, !dbg !660
  call void @pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery(ptr noundef nonnull %mp, ptr noundef nonnull %skpv, ptr noundef nonnull %b) #3, !dbg !661
  call void @pqcrystals_kyber768_ref_poly_invntt_tomont(ptr noundef nonnull %mp) #3, !dbg !662
  call void @pqcrystals_kyber768_ref_poly_sub(ptr noundef nonnull %mp, ptr noundef nonnull %v, ptr noundef nonnull %mp) #3, !dbg !663
  call void @pqcrystals_kyber768_ref_poly_reduce(ptr noundef nonnull %mp) #3, !dbg !664
  call void @pqcrystals_kyber768_ref_poly_tomsg(ptr noundef %m, ptr noundef nonnull %mp) #3, !dbg !665
  ret void, !dbg !666
}

; Function Attrs: nounwind
define internal fastcc void @unpack_ciphertext(ptr noundef nonnull %b, ptr noundef nonnull %v, ptr noundef %c) unnamed_addr #0 !dbg !667 {
entry:
    #dbg_value(ptr %b, !670, !DIExpression(), !671)
    #dbg_value(ptr %v, !672, !DIExpression(), !671)
    #dbg_value(ptr %c, !673, !DIExpression(), !671)
  call void @pqcrystals_kyber768_ref_polyvec_decompress(ptr noundef nonnull %b, ptr noundef %c) #3, !dbg !674
  %add.ptr = getelementptr inbounds nuw i8, ptr %c, i32 960, !dbg !675
  call void @pqcrystals_kyber768_ref_poly_decompress(ptr noundef nonnull %v, ptr noundef nonnull %add.ptr) #3, !dbg !676
  ret void, !dbg !677
}

; Function Attrs: nounwind
define internal fastcc void @unpack_sk(ptr noundef nonnull %sk, ptr noundef %packedsk) unnamed_addr #0 !dbg !678 {
entry:
    #dbg_value(ptr %sk, !681, !DIExpression(), !682)
    #dbg_value(ptr %packedsk, !683, !DIExpression(), !682)
  call void @pqcrystals_kyber768_ref_polyvec_frombytes(ptr noundef nonnull %sk, ptr noundef %packedsk) #3, !dbg !684
  ret void, !dbg !685
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_compress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !686 {
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
  %exitcond2 = icmp ne i32 %i.0, 3, !dbg !704
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
  %arrayidx7 = getelementptr inbounds nuw [3 x [256 x i16]], ptr %a, i32 0, i32 %i.0, i32 %add, !dbg !724
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
define dso_local void @pqcrystals_kyber768_ref_polyvec_decompress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !778 {
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
  %exitcond2 = icmp ne i32 %i.0, 3, !dbg !788
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
  %arrayidx50 = getelementptr inbounds nuw [3 x [256 x i16]], ptr %r, i32 0, i32 %i.0, i32 %add49, !dbg !844
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
define dso_local void @pqcrystals_kyber768_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !860 {
entry:
    #dbg_value(ptr %r, !861, !DIExpression(), !862)
    #dbg_value(ptr %a, !863, !DIExpression(), !862)
    #dbg_value(i32 0, !864, !DIExpression(), !862)
  br label %for.cond, !dbg !865

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !867
    #dbg_value(i32 %i.0, !864, !DIExpression(), !862)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !868
  br i1 %exitcond, label %for.body, label %for.end, !dbg !870

for.body:                                         ; preds = %for.cond
  %mul = mul nuw nsw i32 %i.0, 384, !dbg !871
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 %mul, !dbg !872
  %arrayidx = getelementptr inbounds nuw [3 x [256 x i16]], ptr %a, i32 0, i32 %i.0, !dbg !873
  call void @pqcrystals_kyber768_ref_poly_tobytes(ptr noundef %add.ptr, ptr noundef %arrayidx) #3, !dbg !874
  %inc = add nuw nsw i32 %i.0, 1, !dbg !875
    #dbg_value(i32 %inc, !864, !DIExpression(), !862)
  br label %for.cond, !dbg !876, !llvm.loop !877

for.end:                                          ; preds = %for.cond
  ret void, !dbg !879
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_frombytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !880 {
entry:
    #dbg_value(ptr %r, !881, !DIExpression(), !882)
    #dbg_value(ptr %a, !883, !DIExpression(), !882)
    #dbg_value(i32 0, !884, !DIExpression(), !882)
  br label %for.cond, !dbg !885

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !887
    #dbg_value(i32 %i.0, !884, !DIExpression(), !882)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !888
  br i1 %exitcond, label %for.body, label %for.end, !dbg !890

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [3 x [256 x i16]], ptr %r, i32 0, i32 %i.0, !dbg !891
  %mul = mul nuw nsw i32 %i.0, 384, !dbg !892
  %add.ptr = getelementptr inbounds nuw i8, ptr %a, i32 %mul, !dbg !893
  call void @pqcrystals_kyber768_ref_poly_frombytes(ptr noundef %arrayidx, ptr noundef %add.ptr) #3, !dbg !894
  %inc = add nuw nsw i32 %i.0, 1, !dbg !895
    #dbg_value(i32 %inc, !884, !DIExpression(), !882)
  br label %for.cond, !dbg !896, !llvm.loop !897

for.end:                                          ; preds = %for.cond
  ret void, !dbg !899
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !900 {
entry:
    #dbg_value(ptr %r, !903, !DIExpression(), !904)
    #dbg_value(i32 0, !905, !DIExpression(), !904)
  br label %for.cond, !dbg !906

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !908
    #dbg_value(i32 %i.0, !905, !DIExpression(), !904)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !909
  br i1 %exitcond, label %for.body, label %for.end, !dbg !911

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [3 x [256 x i16]], ptr %r, i32 0, i32 %i.0, !dbg !912
  call void @pqcrystals_kyber768_ref_poly_ntt(ptr noundef %arrayidx) #3, !dbg !913
  %inc = add nuw nsw i32 %i.0, 1, !dbg !914
    #dbg_value(i32 %inc, !905, !DIExpression(), !904)
  br label %for.cond, !dbg !915, !llvm.loop !916

for.end:                                          ; preds = %for.cond
  ret void, !dbg !918
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_invntt_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !919 {
entry:
    #dbg_value(ptr %r, !920, !DIExpression(), !921)
    #dbg_value(i32 0, !922, !DIExpression(), !921)
  br label %for.cond, !dbg !923

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !925
    #dbg_value(i32 %i.0, !922, !DIExpression(), !921)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !926
  br i1 %exitcond, label %for.body, label %for.end, !dbg !928

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [3 x [256 x i16]], ptr %r, i32 0, i32 %i.0, !dbg !929
  call void @pqcrystals_kyber768_ref_poly_invntt_tomont(ptr noundef %arrayidx) #3, !dbg !930
  %inc = add nuw nsw i32 %i.0, 1, !dbg !931
    #dbg_value(i32 %inc, !922, !DIExpression(), !921)
  br label %for.cond, !dbg !932, !llvm.loop !933

for.end:                                          ; preds = %for.cond
  ret void, !dbg !935
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !936 {
entry:
  %t = alloca [256 x i16], align 2
    #dbg_value(ptr %r, !939, !DIExpression(), !940)
    #dbg_value(ptr %a, !941, !DIExpression(), !940)
    #dbg_value(ptr %b, !942, !DIExpression(), !940)
    #dbg_declare(ptr %t, !943, !DIExpression(), !944)
  call void @pqcrystals_kyber768_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) #3, !dbg !945
    #dbg_value(i32 1, !946, !DIExpression(), !940)
  br label %for.cond, !dbg !947

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 1, %entry ], [ %inc, %for.body ], !dbg !949
    #dbg_value(i32 %i.0, !946, !DIExpression(), !940)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !950
  br i1 %exitcond, label %for.body, label %for.end, !dbg !952

for.body:                                         ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds nuw [3 x [256 x i16]], ptr %a, i32 0, i32 %i.0, !dbg !953
  %arrayidx3 = getelementptr inbounds nuw [3 x [256 x i16]], ptr %b, i32 0, i32 %i.0, !dbg !955
  call void @pqcrystals_kyber768_ref_poly_basemul_montgomery(ptr noundef nonnull %t, ptr noundef nonnull %arrayidx2, ptr noundef nonnull %arrayidx3) #3, !dbg !956
  call void @pqcrystals_kyber768_ref_poly_add(ptr noundef %r, ptr noundef %r, ptr noundef nonnull %t) #3, !dbg !957
  %inc = add nuw nsw i32 %i.0, 1, !dbg !958
    #dbg_value(i32 %inc, !946, !DIExpression(), !940)
  br label %for.cond, !dbg !959, !llvm.loop !960

for.end:                                          ; preds = %for.cond
  call void @pqcrystals_kyber768_ref_poly_reduce(ptr noundef %r) #3, !dbg !962
  ret void, !dbg !963
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_reduce(ptr noundef %r) local_unnamed_addr #0 !dbg !964 {
entry:
    #dbg_value(ptr %r, !965, !DIExpression(), !966)
    #dbg_value(i32 0, !967, !DIExpression(), !966)
  br label %for.cond, !dbg !968

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !970
    #dbg_value(i32 %i.0, !967, !DIExpression(), !966)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !971
  br i1 %exitcond, label %for.body, label %for.end, !dbg !973

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [3 x [256 x i16]], ptr %r, i32 0, i32 %i.0, !dbg !974
  call void @pqcrystals_kyber768_ref_poly_reduce(ptr noundef %arrayidx) #3, !dbg !975
  %inc = add nuw nsw i32 %i.0, 1, !dbg !976
    #dbg_value(i32 %inc, !967, !DIExpression(), !966)
  br label %for.cond, !dbg !977, !llvm.loop !978

for.end:                                          ; preds = %for.cond
  ret void, !dbg !980
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_polyvec_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !981 {
entry:
    #dbg_value(ptr %r, !984, !DIExpression(), !985)
    #dbg_value(ptr %a, !986, !DIExpression(), !985)
    #dbg_value(ptr %b, !987, !DIExpression(), !985)
    #dbg_value(i32 0, !988, !DIExpression(), !985)
  br label %for.cond, !dbg !989

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !991
    #dbg_value(i32 %i.0, !988, !DIExpression(), !985)
  %exitcond = icmp ne i32 %i.0, 3, !dbg !992
  br i1 %exitcond, label %for.body, label %for.end, !dbg !994

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [3 x [256 x i16]], ptr %r, i32 0, i32 %i.0, !dbg !995
  %arrayidx1 = getelementptr inbounds nuw [3 x [256 x i16]], ptr %a, i32 0, i32 %i.0, !dbg !996
  %arrayidx2 = getelementptr inbounds nuw [3 x [256 x i16]], ptr %b, i32 0, i32 %i.0, !dbg !997
  call void @pqcrystals_kyber768_ref_poly_add(ptr noundef %arrayidx, ptr noundef %arrayidx1, ptr noundef %arrayidx2) #3, !dbg !998
  %inc = add nuw nsw i32 %i.0, 1, !dbg !999
    #dbg_value(i32 %inc, !988, !DIExpression(), !985)
  br label %for.cond, !dbg !1000, !llvm.loop !1001

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1003
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_compress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1004 {
entry:
  %t = alloca [8 x i8], align 1
    #dbg_value(ptr %r, !1010, !DIExpression(), !1011)
    #dbg_value(ptr %a, !1012, !DIExpression(), !1011)
    #dbg_declare(ptr %t, !1013, !DIExpression(), !1017)
    #dbg_value(i32 0, !1018, !DIExpression(), !1011)
  br label %for.cond, !dbg !1019

for.cond:                                         ; preds = %for.end, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc46, %for.end ], !dbg !1021
  %r.addr.0 = phi ptr [ %r, %entry ], [ %add.ptr, %for.end ]
    #dbg_value(ptr %r.addr.0, !1010, !DIExpression(), !1011)
    #dbg_value(i32 %i.0, !1018, !DIExpression(), !1011)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1022
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end47, !dbg !1024

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1025

for.cond1:                                        ; preds = %for.cond1.preheader, %for.body3
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond1.preheader ], !dbg !1028
    #dbg_value(i32 %j.0, !1029, !DIExpression(), !1011)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1030
  br i1 %exitcond, label %for.body3, label %for.end, !dbg !1025

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !1032
  %add = or disjoint i32 %mul, %j.0, !dbg !1034
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add, !dbg !1035
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1035
    #dbg_value(i16 %0, !1036, !DIExpression(), !1011)
  %isneg = icmp slt i16 %0, 0, !dbg !1037
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !1037
  %add5 = add i16 %and, %0, !dbg !1038
    #dbg_value(i16 %add5, !1036, !DIExpression(), !1011)
  %conv7 = sext i16 %add5 to i32, !dbg !1039
    #dbg_value(i32 %conv7, !1040, !DIExpression(DW_OP_constu, 4, DW_OP_shl, DW_OP_stack_value), !1011)
    #dbg_value(i32 %conv7, !1040, !DIExpression(DW_OP_constu, 4, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !1011)
  %1 = mul i32 %conv7, 1290160, !dbg !1041
  %mul9 = add i32 %1, 134257275, !dbg !1041
    #dbg_value(i32 %mul9, !1040, !DIExpression(), !1011)
  %shr10 = lshr i32 %mul9, 28, !dbg !1042
    #dbg_value(i32 %shr10, !1040, !DIExpression(), !1011)
  %conv12 = trunc nuw nsw i32 %shr10 to i8, !dbg !1043
  %arrayidx13 = getelementptr inbounds nuw [8 x i8], ptr %t, i32 0, i32 %j.0, !dbg !1044
  store i8 %conv12, ptr %arrayidx13, align 1, !dbg !1045
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1046
    #dbg_value(i32 %inc, !1029, !DIExpression(), !1011)
  br label %for.cond1, !dbg !1047, !llvm.loop !1048

for.end:                                          ; preds = %for.cond1
  %2 = load i8, ptr %t, align 1, !dbg !1050
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %t, i32 1, !dbg !1051
  %3 = load i8, ptr %arrayidx16, align 1, !dbg !1051
  %shl18 = shl i8 %3, 4, !dbg !1052
  %or = or i8 %shl18, %2, !dbg !1053
  store i8 %or, ptr %r.addr.0, align 1, !dbg !1054
  %arrayidx21 = getelementptr inbounds nuw i8, ptr %t, i32 2, !dbg !1055
  %4 = load i8, ptr %arrayidx21, align 1, !dbg !1055
  %arrayidx23 = getelementptr inbounds nuw i8, ptr %t, i32 3, !dbg !1056
  %5 = load i8, ptr %arrayidx23, align 1, !dbg !1056
  %shl25 = shl i8 %5, 4, !dbg !1057
  %or26 = or i8 %shl25, %4, !dbg !1058
  %arrayidx28 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 1, !dbg !1059
  store i8 %or26, ptr %arrayidx28, align 1, !dbg !1060
  %arrayidx29 = getelementptr inbounds nuw i8, ptr %t, i32 4, !dbg !1061
  %6 = load i8, ptr %arrayidx29, align 1, !dbg !1061
  %arrayidx31 = getelementptr inbounds nuw i8, ptr %t, i32 5, !dbg !1062
  %7 = load i8, ptr %arrayidx31, align 1, !dbg !1062
  %shl33 = shl i8 %7, 4, !dbg !1063
  %or34 = or i8 %shl33, %6, !dbg !1064
  %arrayidx36 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 2, !dbg !1065
  store i8 %or34, ptr %arrayidx36, align 1, !dbg !1066
  %arrayidx37 = getelementptr inbounds nuw i8, ptr %t, i32 6, !dbg !1067
  %8 = load i8, ptr %arrayidx37, align 1, !dbg !1067
  %arrayidx39 = getelementptr inbounds nuw i8, ptr %t, i32 7, !dbg !1068
  %9 = load i8, ptr %arrayidx39, align 1, !dbg !1068
  %shl41 = shl i8 %9, 4, !dbg !1069
  %or42 = or i8 %shl41, %8, !dbg !1070
  %arrayidx44 = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 3, !dbg !1071
  store i8 %or42, ptr %arrayidx44, align 1, !dbg !1072
    #dbg_value(ptr %r.addr.0, !1010, !DIExpression(DW_OP_plus_uconst, 4, DW_OP_stack_value), !1011)
  %add.ptr = getelementptr inbounds nuw i8, ptr %r.addr.0, i32 4, !dbg !1073
    #dbg_value(ptr %add.ptr, !1010, !DIExpression(), !1011)
  %inc46 = add nuw nsw i32 %i.0, 1, !dbg !1074
    #dbg_value(i32 %inc46, !1018, !DIExpression(), !1011)
  br label %for.cond, !dbg !1075, !llvm.loop !1076

for.end47:                                        ; preds = %for.cond
  ret void, !dbg !1078
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_decompress(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1079 {
entry:
    #dbg_value(ptr %r, !1082, !DIExpression(), !1083)
    #dbg_value(ptr %a, !1084, !DIExpression(), !1083)
    #dbg_value(i32 0, !1085, !DIExpression(), !1083)
  br label %for.cond, !dbg !1086

for.cond:                                         ; preds = %for.body, %entry
  %a.addr.0 = phi ptr [ %a, %entry ], [ %add.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1088
    #dbg_value(i32 %i.0, !1085, !DIExpression(), !1083)
    #dbg_value(ptr %a.addr.0, !1084, !DIExpression(), !1083)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !1089
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1091

for.body:                                         ; preds = %for.cond
  %0 = load i8, ptr %a.addr.0, align 1, !dbg !1092
  %1 = and i8 %0, 15, !dbg !1094
  %conv2 = zext nneg i8 %1 to i32, !dbg !1095
  %mul = mul nuw nsw i32 %conv2, 3329, !dbg !1096
  %add = add nuw nsw i32 %mul, 8, !dbg !1097
  %shr = lshr i32 %add, 4, !dbg !1098
  %conv3 = trunc nuw nsw i32 %shr to i16, !dbg !1099
  %mul4 = shl nuw nsw i32 %i.0, 1, !dbg !1100
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul4, !dbg !1101
  store i16 %conv3, ptr %arrayidx6, align 2, !dbg !1102
  %2 = load i8, ptr %a.addr.0, align 1, !dbg !1103
  %3 = lshr i8 %2, 4, !dbg !1104
  %conv11 = zext nneg i8 %3 to i32, !dbg !1105
  %mul12 = mul nuw nsw i32 %conv11, 3329, !dbg !1106
  %add13 = add nuw nsw i32 %mul12, 8, !dbg !1107
  %shr14 = lshr i32 %add13, 4, !dbg !1108
  %conv15 = trunc nuw nsw i32 %shr14 to i16, !dbg !1109
  %mul16 = shl nuw nsw i32 %i.0, 1, !dbg !1110
  %add17 = or disjoint i32 %mul16, 1, !dbg !1111
  %arrayidx18 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add17, !dbg !1112
  store i16 %conv15, ptr %arrayidx18, align 2, !dbg !1113
    #dbg_value(ptr %a.addr.0, !1084, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1083)
  %add.ptr = getelementptr inbounds nuw i8, ptr %a.addr.0, i32 1, !dbg !1114
    #dbg_value(ptr %add.ptr, !1084, !DIExpression(), !1083)
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1115
    #dbg_value(i32 %inc, !1085, !DIExpression(), !1083)
  br label %for.cond, !dbg !1116, !llvm.loop !1117

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1119
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_tobytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1120 {
entry:
    #dbg_value(ptr %r, !1121, !DIExpression(), !1122)
    #dbg_value(ptr %a, !1123, !DIExpression(), !1122)
    #dbg_value(i32 0, !1124, !DIExpression(), !1122)
  br label %for.cond, !dbg !1125

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1127
    #dbg_value(i32 %i.0, !1124, !DIExpression(), !1122)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !1128
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1130

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 1, !dbg !1131
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %mul, !dbg !1133
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1133
    #dbg_value(i16 %0, !1134, !DIExpression(), !1122)
  %isneg = icmp slt i16 %0, 0, !dbg !1135
  %and = select i1 %isneg, i16 3329, i16 0, !dbg !1135
  %add = add i16 %and, %0, !dbg !1136
    #dbg_value(i16 %add, !1134, !DIExpression(), !1122)
  %mul3 = shl nuw nsw i32 %i.0, 1, !dbg !1137
  %add4 = or disjoint i32 %mul3, 1, !dbg !1138
  %arrayidx5 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add4, !dbg !1139
  %1 = load i16, ptr %arrayidx5, align 2, !dbg !1139
    #dbg_value(i16 %1, !1140, !DIExpression(), !1122)
  %isneg1 = icmp slt i16 %1, 0, !dbg !1141
  %and8 = select i1 %isneg1, i16 3329, i16 0, !dbg !1141
  %add10 = add i16 %and8, %1, !dbg !1142
    #dbg_value(i16 %add10, !1140, !DIExpression(), !1122)
  %conv14 = trunc i16 %add to i8, !dbg !1143
  %mul15 = mul nuw nsw i32 %i.0, 3, !dbg !1144
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %r, i32 %mul15, !dbg !1145
  store i8 %conv14, ptr %arrayidx17, align 1, !dbg !1146
  %2 = lshr i16 %add, 8, !dbg !1147
  %shr19 = trunc nuw i16 %2 to i8, !dbg !1147
  %conv20 = trunc i16 %add10 to i8, !dbg !1148
  %shl = shl i8 %conv20, 4, !dbg !1149
  %or = or i8 %shl, %shr19, !dbg !1150
  %mul22 = mul nuw nsw i32 %i.0, 3, !dbg !1151
  %3 = getelementptr inbounds nuw i8, ptr %r, i32 %mul22, !dbg !1152
  %arrayidx24 = getelementptr inbounds nuw i8, ptr %3, i32 1, !dbg !1152
  store i8 %or, ptr %arrayidx24, align 1, !dbg !1153
  %4 = lshr i16 %add10, 4, !dbg !1154
  %conv27 = trunc i16 %4 to i8, !dbg !1155
  %mul28 = mul nuw nsw i32 %i.0, 3, !dbg !1156
  %5 = getelementptr inbounds nuw i8, ptr %r, i32 %mul28, !dbg !1157
  %arrayidx30 = getelementptr inbounds nuw i8, ptr %5, i32 2, !dbg !1157
  store i8 %conv27, ptr %arrayidx30, align 1, !dbg !1158
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1159
    #dbg_value(i32 %inc, !1124, !DIExpression(), !1122)
  br label %for.cond, !dbg !1160, !llvm.loop !1161

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1163
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_frombytes(ptr noundef %r, ptr noundef %a) local_unnamed_addr #0 !dbg !1164 {
entry:
    #dbg_value(ptr %r, !1165, !DIExpression(), !1166)
    #dbg_value(ptr %a, !1167, !DIExpression(), !1166)
    #dbg_value(i32 0, !1168, !DIExpression(), !1166)
  br label %for.cond, !dbg !1169

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1171
    #dbg_value(i32 %i.0, !1168, !DIExpression(), !1166)
  %exitcond = icmp ne i32 %i.0, 128, !dbg !1172
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1174

for.body:                                         ; preds = %for.cond
  %mul = mul nuw nsw i32 %i.0, 3, !dbg !1175
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %mul, !dbg !1177
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1177
  %conv = zext i8 %0 to i16, !dbg !1177
  %mul1 = mul nuw nsw i32 %i.0, 3, !dbg !1178
  %1 = getelementptr inbounds nuw i8, ptr %a, i32 %mul1, !dbg !1179
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %1, i32 1, !dbg !1179
  %2 = load i8, ptr %arrayidx3, align 1, !dbg !1179
  %conv5 = zext i8 %2 to i16, !dbg !1180
  %shl = shl nuw i16 %conv5, 8, !dbg !1181
  %shl.masked = and i16 %shl, 3840, !dbg !1182
  %and = or disjoint i16 %shl.masked, %conv, !dbg !1182
  %mul7 = shl nuw nsw i32 %i.0, 1, !dbg !1183
  %arrayidx8 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul7, !dbg !1184
  store i16 %and, ptr %arrayidx8, align 2, !dbg !1185
  %mul9 = mul nuw nsw i32 %i.0, 3, !dbg !1186
  %3 = getelementptr inbounds nuw i8, ptr %a, i32 %mul9, !dbg !1187
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %3, i32 1, !dbg !1187
  %4 = load i8, ptr %arrayidx11, align 1, !dbg !1187
  %5 = lshr i8 %4, 4, !dbg !1188
  %shr13 = zext nneg i8 %5 to i16, !dbg !1188
  %mul14 = mul nuw nsw i32 %i.0, 3, !dbg !1189
  %6 = getelementptr inbounds nuw i8, ptr %a, i32 %mul14, !dbg !1190
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %6, i32 2, !dbg !1190
  %7 = load i8, ptr %arrayidx16, align 1, !dbg !1190
  %conv18 = zext i8 %7 to i16, !dbg !1191
  %shl19 = shl nuw nsw i16 %conv18, 4, !dbg !1192
  %or20 = or disjoint i16 %shl19, %shr13, !dbg !1193
  %mul23 = shl nuw nsw i32 %i.0, 1, !dbg !1194
  %add24 = or disjoint i32 %mul23, 1, !dbg !1195
  %arrayidx25 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add24, !dbg !1196
  store i16 %or20, ptr %arrayidx25, align 2, !dbg !1197
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1198
    #dbg_value(i32 %inc, !1168, !DIExpression(), !1166)
  br label %for.cond, !dbg !1199, !llvm.loop !1200

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1202
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_frommsg(ptr noundef %r, ptr noundef %msg) local_unnamed_addr #0 !dbg !1203 {
entry:
    #dbg_value(ptr %r, !1204, !DIExpression(), !1205)
    #dbg_value(ptr %msg, !1206, !DIExpression(), !1205)
    #dbg_value(i32 0, !1207, !DIExpression(), !1205)
  br label %for.cond, !dbg !1208

for.cond:                                         ; preds = %for.inc8, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc9, %for.inc8 ], !dbg !1210
    #dbg_value(i32 %i.0, !1207, !DIExpression(), !1205)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1211
  br i1 %exitcond1, label %for.cond1.preheader, label %for.end10, !dbg !1213

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1214

for.cond1:                                        ; preds = %for.cond1.preheader, %for.body3
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond1.preheader ], !dbg !1217
    #dbg_value(i32 %j.0, !1218, !DIExpression(), !1205)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1219
  br i1 %exitcond, label %for.body3, label %for.inc8, !dbg !1214

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !1221
  %add = or disjoint i32 %mul, %j.0, !dbg !1223
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add, !dbg !1224
  store i16 0, ptr %arrayidx, align 2, !dbg !1225
  %add.ptr.idx = shl nuw nsw i32 %i.0, 4, !dbg !1226
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 %add.ptr.idx, !dbg !1226
  %add.ptr5 = getelementptr inbounds nuw i16, ptr %add.ptr, i32 %j.0, !dbg !1227
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1228
  %0 = load i8, ptr %arrayidx6, align 1, !dbg !1228
  %conv = zext i8 %0 to i32, !dbg !1228
  %shr = lshr i32 %conv, %j.0, !dbg !1229
  %1 = trunc nuw nsw i32 %shr to i16, !dbg !1230
  %conv7 = and i16 %1, 1, !dbg !1230
  call void @pqcrystals_kyber768_ref_cmov_int16(ptr noundef %add.ptr5, i16 noundef signext 1665, i16 noundef zeroext %conv7) #3, !dbg !1231
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1232
    #dbg_value(i32 %inc, !1218, !DIExpression(), !1205)
  br label %for.cond1, !dbg !1233, !llvm.loop !1234

for.inc8:                                         ; preds = %for.cond1
  %inc9 = add nuw nsw i32 %i.0, 1, !dbg !1236
    #dbg_value(i32 %inc9, !1207, !DIExpression(), !1205)
  br label %for.cond, !dbg !1237, !llvm.loop !1238

for.end10:                                        ; preds = %for.cond
  ret void, !dbg !1240
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_tomsg(ptr noundef %msg, ptr noundef %a) local_unnamed_addr #0 !dbg !1241 {
entry:
    #dbg_value(ptr %msg, !1242, !DIExpression(), !1243)
    #dbg_value(ptr %a, !1244, !DIExpression(), !1243)
    #dbg_value(i32 0, !1245, !DIExpression(), !1243)
  br label %for.cond, !dbg !1246

for.cond:                                         ; preds = %for.inc11, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc12, %for.inc11 ], !dbg !1248
    #dbg_value(i32 %i.0, !1245, !DIExpression(), !1243)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1249
  br i1 %exitcond1, label %for.body, label %for.end13, !dbg !1251

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1252
  store i8 0, ptr %arrayidx, align 1, !dbg !1254
    #dbg_value(i32 0, !1255, !DIExpression(), !1243)
  br label %for.cond1, !dbg !1256

for.cond1:                                        ; preds = %for.body3, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body3 ], !dbg !1258
    #dbg_value(i32 %j.0, !1255, !DIExpression(), !1243)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1259
  br i1 %exitcond, label %for.body3, label %for.inc11, !dbg !1261

for.body3:                                        ; preds = %for.cond1
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !1262
  %add = or disjoint i32 %mul, %j.0, !dbg !1264
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add, !dbg !1265
  %0 = load i16, ptr %arrayidx4, align 2, !dbg !1265
  %conv = sext i16 %0 to i32, !dbg !1265
    #dbg_value(i32 %conv, !1266, !DIExpression(), !1243)
    #dbg_value(i32 %conv, !1266, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_stack_value), !1243)
    #dbg_value(i32 %conv, !1266, !DIExpression(DW_OP_constu, 1, DW_OP_shl, DW_OP_plus_uconst, 1665, DW_OP_stack_value), !1243)
  %1 = mul i32 %conv, 161270, !dbg !1267
  %mul6 = add i32 %1, 134257275, !dbg !1267
    #dbg_value(i32 %mul6, !1266, !DIExpression(), !1243)
  %shr = lshr i32 %mul6, 28, !dbg !1268
    #dbg_value(i32 %shr, !1266, !DIExpression(), !1243)
  %and = and i32 %shr, 1, !dbg !1269
    #dbg_value(i32 %and, !1266, !DIExpression(), !1243)
  %shl7 = shl nuw nsw i32 %and, %j.0, !dbg !1270
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1271
  %2 = load i8, ptr %arrayidx8, align 1, !dbg !1272
  %3 = trunc nuw i32 %shl7 to i8, !dbg !1272
  %conv10 = or i8 %2, %3, !dbg !1272
  store i8 %conv10, ptr %arrayidx8, align 1, !dbg !1272
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1273
    #dbg_value(i32 %inc, !1255, !DIExpression(), !1243)
  br label %for.cond1, !dbg !1274, !llvm.loop !1275

for.inc11:                                        ; preds = %for.cond1
  %inc12 = add nuw nsw i32 %i.0, 1, !dbg !1277
    #dbg_value(i32 %inc12, !1245, !DIExpression(), !1243)
  br label %for.cond, !dbg !1278, !llvm.loop !1279

for.end13:                                        ; preds = %for.cond
  ret void, !dbg !1281
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_getnoise_eta1(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !1282 {
entry:
  %buf = alloca [128 x i8], align 1
    #dbg_value(ptr %r, !1285, !DIExpression(), !1286)
    #dbg_value(ptr %seed, !1287, !DIExpression(), !1286)
    #dbg_value(i8 %nonce, !1288, !DIExpression(), !1286)
    #dbg_declare(ptr %buf, !1289, !DIExpression(), !1291)
  call void @pqcrystals_kyber768_ref_kyber_shake256_prf(ptr noundef nonnull %buf, i32 noundef 128, ptr noundef %seed, i8 noundef zeroext %nonce) #3, !dbg !1292
  call void @pqcrystals_kyber768_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef nonnull %buf) #3, !dbg !1293
  ret void, !dbg !1294
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_getnoise_eta2(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !1295 {
entry:
  %buf = alloca [128 x i8], align 1
    #dbg_value(ptr %r, !1296, !DIExpression(), !1297)
    #dbg_value(ptr %seed, !1298, !DIExpression(), !1297)
    #dbg_value(i8 %nonce, !1299, !DIExpression(), !1297)
    #dbg_declare(ptr %buf, !1300, !DIExpression(), !1301)
  call void @pqcrystals_kyber768_ref_kyber_shake256_prf(ptr noundef nonnull %buf, i32 noundef 128, ptr noundef %seed, i8 noundef zeroext %nonce) #3, !dbg !1302
  call void @pqcrystals_kyber768_ref_poly_cbd_eta2(ptr noundef %r, ptr noundef nonnull %buf) #3, !dbg !1303
  ret void, !dbg !1304
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1305 {
entry:
    #dbg_value(ptr %r, !1308, !DIExpression(), !1309)
  call void @pqcrystals_kyber768_ref_ntt(ptr noundef %r) #3, !dbg !1310
  call void @pqcrystals_kyber768_ref_poly_reduce(ptr noundef %r) #3, !dbg !1311
  ret void, !dbg !1312
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_reduce(ptr noundef %r) local_unnamed_addr #0 !dbg !1313 {
entry:
    #dbg_value(ptr %r, !1314, !DIExpression(), !1315)
    #dbg_value(i32 0, !1316, !DIExpression(), !1315)
  br label %for.cond, !dbg !1317

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1319
    #dbg_value(i32 %i.0, !1316, !DIExpression(), !1315)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1320
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1322

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1323
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1323
  %call = call signext i16 @pqcrystals_kyber768_ref_barrett_reduce(i16 noundef signext %0) #3, !dbg !1324
  %arrayidx1 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1325
  store i16 %call, ptr %arrayidx1, align 2, !dbg !1326
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1327
    #dbg_value(i32 %inc, !1316, !DIExpression(), !1315)
  br label %for.cond, !dbg !1328, !llvm.loop !1329

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1331
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_invntt_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !1332 {
entry:
    #dbg_value(ptr %r, !1333, !DIExpression(), !1334)
  call void @pqcrystals_kyber768_ref_invntt(ptr noundef %r) #3, !dbg !1335
  ret void, !dbg !1336
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1337 {
entry:
    #dbg_value(ptr %r, !1340, !DIExpression(), !1341)
    #dbg_value(ptr %a, !1342, !DIExpression(), !1341)
    #dbg_value(ptr %b, !1343, !DIExpression(), !1341)
    #dbg_value(i32 0, !1344, !DIExpression(), !1341)
  br label %for.cond, !dbg !1345

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1347
    #dbg_value(i32 %i.0, !1344, !DIExpression(), !1341)
  %exitcond = icmp ne i32 %i.0, 64, !dbg !1348
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1350

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 2, !dbg !1351
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %mul, !dbg !1353
  %mul1 = shl nuw nsw i32 %i.0, 2, !dbg !1354
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %mul1, !dbg !1355
  %mul3 = shl nuw nsw i32 %i.0, 2, !dbg !1356
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %mul3, !dbg !1357
  %add = or disjoint i32 %i.0, 64, !dbg !1358
  %arrayidx5 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber768_ref_zetas, i32 0, i32 %add, !dbg !1359
  %0 = load i16, ptr %arrayidx5, align 2, !dbg !1359
  call void @pqcrystals_kyber768_ref_basemul(ptr noundef %arrayidx, ptr noundef %arrayidx2, ptr noundef %arrayidx4, i16 noundef signext %0) #3, !dbg !1360
  %mul6 = shl nuw nsw i32 %i.0, 2, !dbg !1361
  %add7 = or disjoint i32 %mul6, 2, !dbg !1362
  %arrayidx8 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add7, !dbg !1363
  %mul9 = shl nuw nsw i32 %i.0, 2, !dbg !1364
  %add10 = or disjoint i32 %mul9, 2, !dbg !1365
  %arrayidx11 = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %add10, !dbg !1366
  %mul12 = shl nuw nsw i32 %i.0, 2, !dbg !1367
  %add13 = or disjoint i32 %mul12, 2, !dbg !1368
  %arrayidx14 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %add13, !dbg !1369
  %add15 = or disjoint i32 %i.0, 64, !dbg !1370
  %arrayidx16 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber768_ref_zetas, i32 0, i32 %add15, !dbg !1371
  %1 = load i16, ptr %arrayidx16, align 2, !dbg !1371
  %sub = sub i16 0, %1, !dbg !1372
  call void @pqcrystals_kyber768_ref_basemul(ptr noundef nonnull %arrayidx8, ptr noundef nonnull %arrayidx11, ptr noundef nonnull %arrayidx14, i16 noundef signext %sub) #3, !dbg !1373
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1374
    #dbg_value(i32 %inc, !1344, !DIExpression(), !1341)
  br label %for.cond, !dbg !1375, !llvm.loop !1376

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1378
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_tomont(ptr noundef %r) local_unnamed_addr #0 !dbg !1379 {
entry:
    #dbg_value(ptr %r, !1380, !DIExpression(), !1381)
    #dbg_value(i16 1353, !1382, !DIExpression(), !1381)
    #dbg_value(i32 0, !1383, !DIExpression(), !1381)
  br label %for.cond, !dbg !1384

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1386
    #dbg_value(i32 %i.0, !1383, !DIExpression(), !1381)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1387
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1389

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1390
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1390
  %conv = sext i16 %0 to i32, !dbg !1391
  %mul = mul nsw i32 %conv, 1353, !dbg !1392
  %call = call signext i16 @pqcrystals_kyber768_ref_montgomery_reduce(i32 noundef %mul) #3, !dbg !1393
  %arrayidx1 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1394
  store i16 %call, ptr %arrayidx1, align 2, !dbg !1395
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1396
    #dbg_value(i32 %inc, !1383, !DIExpression(), !1381)
  br label %for.cond, !dbg !1397, !llvm.loop !1398

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1400
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1401 {
entry:
    #dbg_value(ptr %r, !1402, !DIExpression(), !1403)
    #dbg_value(ptr %a, !1404, !DIExpression(), !1403)
    #dbg_value(ptr %b, !1405, !DIExpression(), !1403)
    #dbg_value(i32 0, !1406, !DIExpression(), !1403)
  br label %for.cond, !dbg !1407

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1409
    #dbg_value(i32 %i.0, !1406, !DIExpression(), !1403)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1410
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1412

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %i.0, !dbg !1413
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1413
  %arrayidx1 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %i.0, !dbg !1414
  %1 = load i16, ptr %arrayidx1, align 2, !dbg !1414
  %add = add i16 %0, %1, !dbg !1415
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1416
  store i16 %add, ptr %arrayidx4, align 2, !dbg !1417
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1418
    #dbg_value(i32 %inc, !1406, !DIExpression(), !1403)
  br label %for.cond, !dbg !1419, !llvm.loop !1420

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1422
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_sub(ptr noundef %r, ptr noundef %a, ptr noundef %b) local_unnamed_addr #0 !dbg !1423 {
entry:
    #dbg_value(ptr %r, !1424, !DIExpression(), !1425)
    #dbg_value(ptr %a, !1426, !DIExpression(), !1425)
    #dbg_value(ptr %b, !1427, !DIExpression(), !1425)
    #dbg_value(i32 0, !1428, !DIExpression(), !1425)
  br label %for.cond, !dbg !1429

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1431
    #dbg_value(i32 %i.0, !1428, !DIExpression(), !1425)
  %exitcond = icmp ne i32 %i.0, 256, !dbg !1432
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1434

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %a, i32 0, i32 %i.0, !dbg !1435
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1435
  %arrayidx1 = getelementptr inbounds nuw [256 x i16], ptr %b, i32 0, i32 %i.0, !dbg !1436
  %1 = load i16, ptr %arrayidx1, align 2, !dbg !1436
  %sub = sub i16 %0, %1, !dbg !1437
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %i.0, !dbg !1438
  store i16 %sub, ptr %arrayidx4, align 2, !dbg !1439
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1440
    #dbg_value(i32 %inc, !1428, !DIExpression(), !1425)
  br label %for.cond, !dbg !1441, !llvm.loop !1442

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1444
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_ntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1445 {
entry:
    #dbg_value(ptr %r, !1448, !DIExpression(), !1449)
    #dbg_value(i32 1, !1450, !DIExpression(), !1449)
    #dbg_value(i32 128, !1451, !DIExpression(), !1449)
  br label %for.cond, !dbg !1452

for.cond:                                         ; preds = %for.inc24, %entry
  %len.0 = phi i32 [ 128, %entry ], [ %shr, %for.inc24 ], !dbg !1454
  %k.0 = phi i32 [ 1, %entry ], [ %k.1.lcssa, %for.inc24 ], !dbg !1455
    #dbg_value(i32 %k.0, !1450, !DIExpression(), !1449)
    #dbg_value(i32 %len.0, !1451, !DIExpression(), !1449)
  %cmp = icmp samesign ugt i32 %len.0, 1, !dbg !1456
  br i1 %cmp, label %for.cond1.preheader, label %for.end25, !dbg !1458

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1459

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc21
  %start.0 = phi i32 [ %add22, %for.inc21 ], [ 0, %for.cond1.preheader ], !dbg !1462
  %k.1 = phi i32 [ %inc, %for.inc21 ], [ %k.0, %for.cond1.preheader ], !dbg !1449
    #dbg_value(i32 %k.1, !1450, !DIExpression(), !1449)
    #dbg_value(i32 %start.0, !1463, !DIExpression(), !1449)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !1464
  br i1 %cmp2, label %for.body3, label %for.inc24, !dbg !1459

for.body3:                                        ; preds = %for.cond1
    #dbg_value(i32 %inc, !1450, !DIExpression(), !1449)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber768_ref_zetas, i32 0, i32 %k.1, !dbg !1466
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1466
    #dbg_value(i16 %0, !1468, !DIExpression(), !1449)
    #dbg_value(i32 %start.0, !1469, !DIExpression(), !1449)
  br label %for.cond4, !dbg !1470

for.cond4:                                        ; preds = %for.body6, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc20, %for.body6 ], !dbg !1472
    #dbg_value(i32 %j.0, !1469, !DIExpression(), !1449)
  %add = add nuw nsw i32 %start.0, %len.0, !dbg !1473
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !1475
  br i1 %cmp5, label %for.body6, label %for.inc21, !dbg !1476

for.body6:                                        ; preds = %for.cond4
  %1 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1477
  %arrayidx8 = getelementptr i16, ptr %1, i32 %len.0, !dbg !1477
  %2 = load i16, ptr %arrayidx8, align 2, !dbg !1477
  %call = call fastcc signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %2) #3, !dbg !1479
    #dbg_value(i16 %call, !1480, !DIExpression(), !1449)
  %arrayidx9 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1481
  %3 = load i16, ptr %arrayidx9, align 2, !dbg !1481
  %sub = sub i16 %3, %call, !dbg !1482
  %4 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1483
  %arrayidx13 = getelementptr i16, ptr %4, i32 %len.0, !dbg !1483
  store i16 %sub, ptr %arrayidx13, align 2, !dbg !1484
  %arrayidx14 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1485
  %5 = load i16, ptr %arrayidx14, align 2, !dbg !1485
  %add17 = add i16 %5, %call, !dbg !1486
  %arrayidx19 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1487
  store i16 %add17, ptr %arrayidx19, align 2, !dbg !1488
  %inc20 = add nuw i32 %j.0, 1, !dbg !1489
    #dbg_value(i32 %inc20, !1469, !DIExpression(), !1449)
  br label %for.cond4, !dbg !1490, !llvm.loop !1491

for.inc21:                                        ; preds = %for.cond4
  %j.0.lcssa = phi i32 [ %j.0, %for.cond4 ], !dbg !1472
  %inc = add i32 %k.1, 1, !dbg !1493
  %add22 = add i32 %j.0.lcssa, %len.0, !dbg !1494
    #dbg_value(i32 %add22, !1463, !DIExpression(), !1449)
  br label %for.cond1, !dbg !1495, !llvm.loop !1496

for.inc24:                                        ; preds = %for.cond1
  %k.1.lcssa = phi i32 [ %k.1, %for.cond1 ], !dbg !1449
  %shr = lshr i32 %len.0, 1, !dbg !1498
    #dbg_value(i32 %shr, !1451, !DIExpression(), !1449)
  br label %for.cond, !dbg !1499, !llvm.loop !1500

for.end25:                                        ; preds = %for.cond
  ret void, !dbg !1502
}

; Function Attrs: nounwind
define internal fastcc signext i16 @fqmul(i16 noundef signext %a, i16 noundef signext %b) unnamed_addr #0 !dbg !1503 {
entry:
    #dbg_value(i16 %a, !1506, !DIExpression(), !1507)
    #dbg_value(i16 %b, !1508, !DIExpression(), !1507)
  %conv = sext i16 %a to i32, !dbg !1509
  %conv1 = sext i16 %b to i32, !dbg !1510
  %mul = mul nsw i32 %conv, %conv1, !dbg !1511
  %call = call signext i16 @pqcrystals_kyber768_ref_montgomery_reduce(i32 noundef %mul) #3, !dbg !1512
  ret i16 %call, !dbg !1513
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_invntt(ptr noundef %r) local_unnamed_addr #0 !dbg !1514 {
entry:
    #dbg_value(ptr %r, !1515, !DIExpression(), !1516)
    #dbg_value(i16 1441, !1517, !DIExpression(), !1516)
    #dbg_value(i32 127, !1518, !DIExpression(), !1516)
    #dbg_value(i32 2, !1519, !DIExpression(), !1516)
  br label %for.cond, !dbg !1520

for.cond:                                         ; preds = %for.inc29, %entry
  %len.0 = phi i32 [ 2, %entry ], [ %shl, %for.inc29 ], !dbg !1522
  %k.0 = phi i32 [ 127, %entry ], [ %k.1.lcssa, %for.inc29 ], !dbg !1523
    #dbg_value(i32 %k.0, !1518, !DIExpression(), !1516)
    #dbg_value(i32 %len.0, !1519, !DIExpression(), !1516)
  %cmp = icmp ult i32 %len.0, 129, !dbg !1524
  br i1 %cmp, label %for.cond1.preheader, label %for.cond31.preheader, !dbg !1526

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !1527

for.cond31.preheader:                             ; preds = %for.cond
  br label %for.cond31, !dbg !1530

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc26
  %start.0 = phi i32 [ %add27, %for.inc26 ], [ 0, %for.cond1.preheader ], !dbg !1532
  %k.1 = phi i32 [ %dec, %for.inc26 ], [ %k.0, %for.cond1.preheader ], !dbg !1516
    #dbg_value(i32 %k.1, !1518, !DIExpression(), !1516)
    #dbg_value(i32 %start.0, !1533, !DIExpression(), !1516)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !1534
  br i1 %cmp2, label %for.body3, label %for.inc29, !dbg !1527

for.body3:                                        ; preds = %for.cond1
    #dbg_value(i32 %dec, !1518, !DIExpression(), !1516)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber768_ref_zetas, i32 0, i32 %k.1, !dbg !1536
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1536
    #dbg_value(i16 %0, !1538, !DIExpression(), !1516)
    #dbg_value(i32 %start.0, !1539, !DIExpression(), !1516)
  br label %for.cond4, !dbg !1540

for.cond4:                                        ; preds = %for.body6, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc, %for.body6 ], !dbg !1542
    #dbg_value(i32 %j.0, !1539, !DIExpression(), !1516)
  %add = add nuw nsw i32 %start.0, %len.0, !dbg !1543
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !1545
  br i1 %cmp5, label %for.body6, label %for.inc26, !dbg !1546

for.body6:                                        ; preds = %for.cond4
  %arrayidx7 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1547
  %1 = load i16, ptr %arrayidx7, align 2, !dbg !1547
    #dbg_value(i16 %1, !1549, !DIExpression(), !1516)
  %2 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1550
  %arrayidx9 = getelementptr i16, ptr %2, i32 %len.0, !dbg !1550
  %3 = load i16, ptr %arrayidx9, align 2, !dbg !1550
  %add11 = add i16 %1, %3, !dbg !1551
  %call = call signext i16 @pqcrystals_kyber768_ref_barrett_reduce(i16 noundef signext %add11) #3, !dbg !1552
  %arrayidx13 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1553
  store i16 %call, ptr %arrayidx13, align 2, !dbg !1554
  %4 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1555
  %arrayidx15 = getelementptr i16, ptr %4, i32 %len.0, !dbg !1555
  %5 = load i16, ptr %arrayidx15, align 2, !dbg !1555
  %sub = sub i16 %5, %1, !dbg !1556
  %6 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1557
  %arrayidx20 = getelementptr i16, ptr %6, i32 %len.0, !dbg !1557
  store i16 %sub, ptr %arrayidx20, align 2, !dbg !1558
  %7 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1559
  %arrayidx22 = getelementptr i16, ptr %7, i32 %len.0, !dbg !1559
  %8 = load i16, ptr %arrayidx22, align 2, !dbg !1559
  %call23 = call fastcc signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %8) #3, !dbg !1560
  %9 = getelementptr i16, ptr %r, i32 %j.0, !dbg !1561
  %arrayidx25 = getelementptr i16, ptr %9, i32 %len.0, !dbg !1561
  store i16 %call23, ptr %arrayidx25, align 2, !dbg !1562
  %inc = add nuw i32 %j.0, 1, !dbg !1563
    #dbg_value(i32 %inc, !1539, !DIExpression(), !1516)
  br label %for.cond4, !dbg !1564, !llvm.loop !1565

for.inc26:                                        ; preds = %for.cond4
  %j.0.lcssa = phi i32 [ %j.0, %for.cond4 ], !dbg !1542
  %dec = add i32 %k.1, -1, !dbg !1567
  %add27 = add i32 %j.0.lcssa, %len.0, !dbg !1568
    #dbg_value(i32 %add27, !1533, !DIExpression(), !1516)
  br label %for.cond1, !dbg !1569, !llvm.loop !1570

for.inc29:                                        ; preds = %for.cond1
  %k.1.lcssa = phi i32 [ %k.1, %for.cond1 ], !dbg !1516
  %shl = shl nuw nsw i32 %len.0, 1, !dbg !1572
    #dbg_value(i32 %shl, !1519, !DIExpression(), !1516)
  br label %for.cond, !dbg !1573, !llvm.loop !1574

for.cond31:                                       ; preds = %for.cond31.preheader, %for.body34
  %j.1 = phi i32 [ %inc39, %for.body34 ], [ 0, %for.cond31.preheader ], !dbg !1576
    #dbg_value(i32 %j.1, !1539, !DIExpression(), !1516)
  %exitcond = icmp ne i32 %j.1, 256, !dbg !1577
  br i1 %exitcond, label %for.body34, label %for.end40, !dbg !1530

for.body34:                                       ; preds = %for.cond31
  %arrayidx35 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !1579
  %10 = load i16, ptr %arrayidx35, align 2, !dbg !1579
  %call36 = call fastcc signext i16 @fqmul(i16 noundef signext %10, i16 noundef signext 1441) #3, !dbg !1580
  %arrayidx37 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !1581
  store i16 %call36, ptr %arrayidx37, align 2, !dbg !1582
  %inc39 = add nuw nsw i32 %j.1, 1, !dbg !1583
    #dbg_value(i32 %inc39, !1539, !DIExpression(), !1516)
  br label %for.cond31, !dbg !1584, !llvm.loop !1585

for.end40:                                        ; preds = %for.cond31
  ret void, !dbg !1587
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_basemul(ptr noundef %r, ptr noundef %a, ptr noundef %b, i16 noundef signext %zeta) local_unnamed_addr #0 !dbg !1588 {
entry:
    #dbg_value(ptr %r, !1592, !DIExpression(), !1593)
    #dbg_value(ptr %a, !1594, !DIExpression(), !1593)
    #dbg_value(ptr %b, !1595, !DIExpression(), !1593)
    #dbg_value(i16 %zeta, !1596, !DIExpression(), !1593)
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 2, !dbg !1597
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1597
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 2, !dbg !1598
  %1 = load i16, ptr %arrayidx1, align 2, !dbg !1598
  %call = call fastcc signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %1) #3, !dbg !1599
  store i16 %call, ptr %r, align 2, !dbg !1600
  %call4 = call fastcc signext i16 @fqmul(i16 noundef signext %call, i16 noundef signext %zeta) #3, !dbg !1601
  store i16 %call4, ptr %r, align 2, !dbg !1602
  %2 = load i16, ptr %a, align 2, !dbg !1603
  %3 = load i16, ptr %b, align 2, !dbg !1604
  %call8 = call fastcc signext i16 @fqmul(i16 noundef signext %2, i16 noundef signext %3) #3, !dbg !1605
  %4 = load i16, ptr %r, align 2, !dbg !1606
  %add = add i16 %4, %call8, !dbg !1606
  store i16 %add, ptr %r, align 2, !dbg !1606
  %5 = load i16, ptr %a, align 2, !dbg !1607
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %b, i32 2, !dbg !1608
  %6 = load i16, ptr %arrayidx13, align 2, !dbg !1608
  %call14 = call fastcc signext i16 @fqmul(i16 noundef signext %5, i16 noundef signext %6) #3, !dbg !1609
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %r, i32 2, !dbg !1610
  store i16 %call14, ptr %arrayidx15, align 2, !dbg !1611
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %a, i32 2, !dbg !1612
  %7 = load i16, ptr %arrayidx16, align 2, !dbg !1612
  %8 = load i16, ptr %b, align 2, !dbg !1613
  %call18 = call fastcc signext i16 @fqmul(i16 noundef signext %7, i16 noundef signext %8) #3, !dbg !1614
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %r, i32 2, !dbg !1615
  %9 = load i16, ptr %arrayidx20, align 2, !dbg !1616
  %add22 = add i16 %9, %call18, !dbg !1616
  store i16 %add22, ptr %arrayidx20, align 2, !dbg !1616
  ret void, !dbg !1617
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef %buf) local_unnamed_addr #0 !dbg !1618 {
entry:
    #dbg_value(ptr %r, !1620, !DIExpression(), !1621)
    #dbg_value(ptr %buf, !1622, !DIExpression(), !1621)
  call fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) #3, !dbg !1623
  ret void, !dbg !1624
}

; Function Attrs: nounwind
define internal fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) unnamed_addr #0 !dbg !1625 {
entry:
    #dbg_value(ptr %r, !1626, !DIExpression(), !1627)
    #dbg_value(ptr %buf, !1628, !DIExpression(), !1627)
    #dbg_value(i32 0, !1629, !DIExpression(), !1627)
  br label %for.cond, !dbg !1630

for.cond:                                         ; preds = %for.inc19, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc20, %for.inc19 ], !dbg !1632
    #dbg_value(i32 %i.0, !1629, !DIExpression(), !1627)
  %exitcond1 = icmp ne i32 %i.0, 32, !dbg !1633
  br i1 %exitcond1, label %for.body, label %for.end21, !dbg !1635

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 2, !dbg !1636
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 %mul, !dbg !1638
  %call = call fastcc i32 @load32_littleendian(ptr noundef %add.ptr) #3, !dbg !1639
    #dbg_value(i32 %call, !1640, !DIExpression(), !1627)
  %and = and i32 %call, 1431655765, !dbg !1641
    #dbg_value(i32 %and, !1642, !DIExpression(), !1627)
  %shr = lshr i32 %call, 1, !dbg !1643
  %and1 = and i32 %shr, 1431655765, !dbg !1644
  %add = add nuw i32 %and, %and1, !dbg !1645
    #dbg_value(i32 %add, !1642, !DIExpression(), !1627)
    #dbg_value(i32 0, !1646, !DIExpression(), !1627)
  br label %for.cond2, !dbg !1647

for.cond2:                                        ; preds = %for.body4, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body4 ], !dbg !1649
    #dbg_value(i32 %j.0, !1646, !DIExpression(), !1627)
  %exitcond = icmp ne i32 %j.0, 8, !dbg !1650
  br i1 %exitcond, label %for.body4, label %for.inc19, !dbg !1652

for.body4:                                        ; preds = %for.cond2
  %mul5 = shl nuw nsw i32 %j.0, 2, !dbg !1653
  %shr7 = lshr i32 %add, %mul5, !dbg !1655
  %conv = and i32 %shr7, 3, !dbg !1656
    #dbg_value(i32 %shr7, !1657, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3, DW_OP_and, DW_OP_stack_value), !1627)
  %mul9 = shl nuw nsw i32 %j.0, 2, !dbg !1658
  %add10 = or disjoint i32 %mul9, 2, !dbg !1659
  %shr11 = lshr i32 %add, %add10, !dbg !1660
  %conv13 = and i32 %shr11, 3, !dbg !1661
    #dbg_value(i32 %conv13, !1662, !DIExpression(), !1627)
  %sub = sub nsw i32 %conv, %conv13, !dbg !1663
  %conv16 = trunc nsw i32 %sub to i16, !dbg !1664
  %mul17 = shl nuw nsw i32 %i.0, 3, !dbg !1665
  %add18 = or disjoint i32 %mul17, %j.0, !dbg !1666
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %r, i32 0, i32 %add18, !dbg !1667
  store i16 %conv16, ptr %arrayidx, align 2, !dbg !1668
  %inc = add nuw nsw i32 %j.0, 1, !dbg !1669
    #dbg_value(i32 %inc, !1646, !DIExpression(), !1627)
  br label %for.cond2, !dbg !1670, !llvm.loop !1671

for.inc19:                                        ; preds = %for.cond2
  %inc20 = add nuw nsw i32 %i.0, 1, !dbg !1673
    #dbg_value(i32 %inc20, !1629, !DIExpression(), !1627)
  br label %for.cond, !dbg !1674, !llvm.loop !1675

for.end21:                                        ; preds = %for.cond
  ret void, !dbg !1677
}

; Function Attrs: nounwind
define internal fastcc i32 @load32_littleendian(ptr noundef %x) unnamed_addr #0 !dbg !1678 {
entry:
    #dbg_value(ptr %x, !1681, !DIExpression(), !1682)
  %0 = load i8, ptr %x, align 1, !dbg !1683
  %conv = zext i8 %0 to i32, !dbg !1684
    #dbg_value(i32 %conv, !1685, !DIExpression(), !1682)
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %x, i32 1, !dbg !1686
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !1686
  %conv2 = zext i8 %1 to i32, !dbg !1687
  %shl = shl nuw nsw i32 %conv2, 8, !dbg !1688
  %or = or disjoint i32 %shl, %conv, !dbg !1689
    #dbg_value(i32 %or, !1685, !DIExpression(), !1682)
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %x, i32 2, !dbg !1690
  %2 = load i8, ptr %arrayidx3, align 1, !dbg !1690
  %conv4 = zext i8 %2 to i32, !dbg !1691
  %shl5 = shl nuw nsw i32 %conv4, 16, !dbg !1692
  %or6 = or disjoint i32 %or, %shl5, !dbg !1693
    #dbg_value(i32 %or6, !1685, !DIExpression(), !1682)
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %x, i32 3, !dbg !1694
  %3 = load i8, ptr %arrayidx7, align 1, !dbg !1694
  %conv8 = zext i8 %3 to i32, !dbg !1695
  %shl9 = shl nuw i32 %conv8, 24, !dbg !1696
  %or10 = or disjoint i32 %or6, %shl9, !dbg !1697
    #dbg_value(i32 %or10, !1685, !DIExpression(), !1682)
  ret i32 %or10, !dbg !1698
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_poly_cbd_eta2(ptr noundef %r, ptr noundef %buf) local_unnamed_addr #0 !dbg !1699 {
entry:
    #dbg_value(ptr %r, !1700, !DIExpression(), !1701)
    #dbg_value(ptr %buf, !1702, !DIExpression(), !1701)
  call fastcc void @cbd2(ptr noundef %r, ptr noundef %buf) #3, !dbg !1703
  ret void, !dbg !1704
}

; Function Attrs: nounwind
define dso_local signext i16 @pqcrystals_kyber768_ref_montgomery_reduce(i32 noundef %a) local_unnamed_addr #0 !dbg !1705 {
entry:
    #dbg_value(i32 %a, !1708, !DIExpression(), !1709)
    #dbg_value(i32 %a, !1710, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 18446744073709548289, DW_OP_mul, DW_OP_stack_value), !1709)
  %sext = mul i32 %a, -218038272, !dbg !1711
  %conv3 = ashr exact i32 %sext, 16, !dbg !1711
  %mul4.neg = mul nsw i32 %conv3, -3329, !dbg !1712
  %sub = add i32 %mul4.neg, %a, !dbg !1713
  %shr = lshr i32 %sub, 16, !dbg !1714
  %conv5 = trunc nuw i32 %shr to i16, !dbg !1715
    #dbg_value(i16 %conv5, !1710, !DIExpression(), !1709)
  ret i16 %conv5, !dbg !1716
}

; Function Attrs: nounwind
define dso_local signext i16 @pqcrystals_kyber768_ref_barrett_reduce(i16 noundef signext %a) local_unnamed_addr #0 !dbg !1717 {
entry:
    #dbg_value(i16 %a, !1720, !DIExpression(), !1721)
    #dbg_value(i16 20159, !1722, !DIExpression(), !1721)
  %conv = sext i16 %a to i32, !dbg !1723
  %mul = mul nsw i32 %conv, 20159, !dbg !1724
  %add = add nsw i32 %mul, 33554432, !dbg !1725
  %shr = ashr i32 %add, 26, !dbg !1726
    #dbg_value(i32 %shr, !1727, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value), !1721)
    #dbg_value(i32 %shr, !1727, !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_constu, 3329, DW_OP_mul, DW_OP_stack_value), !1721)
  %0 = trunc nsw i32 %shr to i16, !dbg !1728
  %1 = mul i16 %0, -3329, !dbg !1728
  %conv7 = add i16 %1, %a, !dbg !1728
  ret i16 %conv7, !dbg !1729
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqcrystals_kyber768_ref_verify(ptr noundef %a, ptr noundef %b, i32 noundef %len) local_unnamed_addr #0 !dbg !1730 {
entry:
    #dbg_value(ptr %a, !1734, !DIExpression(), !1735)
    #dbg_value(ptr %b, !1736, !DIExpression(), !1735)
    #dbg_value(i32 %len, !1737, !DIExpression(), !1735)
    #dbg_value(i8 0, !1738, !DIExpression(), !1735)
    #dbg_value(i32 0, !1739, !DIExpression(), !1735)
  br label %for.cond, !dbg !1740

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1742
  %r.0 = phi i8 [ 0, %entry ], [ %or2, %for.inc ], !dbg !1735
    #dbg_value(i8 %r.0, !1738, !DIExpression(), !1735)
    #dbg_value(i32 %i.0, !1739, !DIExpression(), !1735)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !1743
  br i1 %exitcond, label %for.inc, label %for.end, !dbg !1745

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i8 poison, i8 poison, i8 poison), !1738, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1735)
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %i.0, !dbg !1746
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1746
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 %i.0, !dbg !1747
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !1747
    #dbg_value(!DIArgList(i8 %r.0, i8 %0, i8 %1), !1738, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1735)
  %xor1 = xor i8 %0, %1, !dbg !1748
    #dbg_value(!DIArgList(i8 %r.0, i8 %xor1), !1738, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1735)
  %or2 = or i8 %r.0, %xor1, !dbg !1749
    #dbg_value(i8 %or2, !1738, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !1735)
    #dbg_value(i8 %or2, !1738, !DIExpression(), !1735)
  %inc = add i32 %i.0, 1, !dbg !1750
    #dbg_value(i32 %inc, !1739, !DIExpression(), !1735)
  br label %for.cond, !dbg !1751, !llvm.loop !1752

for.end:                                          ; preds = %for.cond
  %r.0.lcssa = phi i8 [ %r.0, %for.cond ], !dbg !1735
  %2 = icmp ne i8 %r.0.lcssa, 0, !dbg !1754
  %conv6 = zext i1 %2 to i32, !dbg !1755
  ret i32 %conv6, !dbg !1756
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_cmov(ptr noundef %r, ptr noundef %x, i32 noundef %len, i8 noundef zeroext %b) local_unnamed_addr #0 !dbg !1757 {
entry:
    #dbg_value(ptr %r, !1760, !DIExpression(), !1761)
    #dbg_value(ptr %x, !1762, !DIExpression(), !1761)
    #dbg_value(i32 %len, !1763, !DIExpression(), !1761)
    #dbg_value(i8 %b, !1764, !DIExpression(), !1761)
  %0 = call i8 asm "", "=r,0"(i8 %b) #5, !dbg !1765, !srcloc !1766
    #dbg_value(i8 %0, !1764, !DIExpression(), !1761)
  %sub = sub i8 0, %0, !dbg !1767
    #dbg_value(i8 %sub, !1764, !DIExpression(), !1761)
    #dbg_value(i32 0, !1768, !DIExpression(), !1761)
  br label %for.cond, !dbg !1769

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1771
    #dbg_value(i32 %i.0, !1768, !DIExpression(), !1761)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !1772
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1774

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !1775
  %1 = load i8, ptr %arrayidx, align 1, !dbg !1775
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !1776
  %2 = load i8, ptr %arrayidx5, align 1, !dbg !1776
  %xor1 = xor i8 %1, %2, !dbg !1777
  %and2 = and i8 %xor1, %sub, !dbg !1778
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !1779
  %xor93 = xor i8 %1, %and2, !dbg !1780
  store i8 %xor93, ptr %arrayidx7, align 1, !dbg !1780
  %inc = add i32 %i.0, 1, !dbg !1781
    #dbg_value(i32 %inc, !1768, !DIExpression(), !1761)
  br label %for.cond, !dbg !1782, !llvm.loop !1783

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1785
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_cmov_int16(ptr noundef %r, i16 noundef signext %v, i16 noundef zeroext %b) local_unnamed_addr #0 !dbg !1786 {
entry:
    #dbg_value(ptr %r, !1789, !DIExpression(), !1790)
    #dbg_value(i16 %v, !1791, !DIExpression(), !1790)
    #dbg_value(i16 %b, !1792, !DIExpression(), !1790)
  %sub = sub i16 0, %b, !dbg !1793
    #dbg_value(i16 %sub, !1792, !DIExpression(), !1790)
  %0 = load i16, ptr %r, align 2, !dbg !1794
  %xor1 = xor i16 %0, %v, !dbg !1795
  %and = and i16 %xor1, %sub, !dbg !1796
  %xor6 = xor i16 %and, %0, !dbg !1797
  store i16 %xor6, ptr %r, align 2, !dbg !1797
  ret void, !dbg !1798
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_init(ptr noundef %state) local_unnamed_addr #0 !dbg !1799 {
entry:
    #dbg_value(ptr %state, !1803, !DIExpression(), !1804)
  call fastcc void @keccak_init(ptr noundef %state) #3, !dbg !1805
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1806
  store i64 0, ptr %arrayidx, align 8, !dbg !1807
  ret void, !dbg !1808
}

; Function Attrs: nounwind
define internal fastcc void @keccak_init(ptr noundef %s) unnamed_addr #0 !dbg !1809 {
entry:
    #dbg_value(ptr %s, !1813, !DIExpression(), !1814)
    #dbg_value(i32 0, !1815, !DIExpression(), !1814)
  br label %for.cond, !dbg !1816

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1818
    #dbg_value(i32 %i.0, !1815, !DIExpression(), !1814)
  %exitcond = icmp ne i32 %i.0, 25, !dbg !1819
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1821

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !1822
  store i64 0, ptr %arrayidx, align 8, !dbg !1823
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1824
    #dbg_value(i32 %inc, !1815, !DIExpression(), !1814)
  br label %for.cond, !dbg !1825, !llvm.loop !1826

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1828
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !1829 {
entry:
    #dbg_value(ptr %state, !1832, !DIExpression(), !1833)
    #dbg_value(ptr %in, !1834, !DIExpression(), !1833)
    #dbg_value(i32 %inlen, !1835, !DIExpression(), !1833)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1836
  %0 = load i64, ptr %arrayidx, align 8, !dbg !1836
  %conv = trunc i64 %0 to i32, !dbg !1836
  %call = call fastcc i32 @keccak_absorb(ptr noundef %state, i32 noundef %conv, i32 noundef 168, ptr noundef %in, i32 noundef %inlen) #3, !dbg !1837
  %conv1 = zext i32 %call to i64, !dbg !1837
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !1838
  store i64 %conv1, ptr %arrayidx2, align 8, !dbg !1839
  ret void, !dbg !1840
}

; Function Attrs: nounwind
define internal fastcc i32 @keccak_absorb(ptr noundef %s, i32 noundef %pos, i32 noundef range(i32 136, 169) %r, ptr noundef %in, i32 noundef %inlen) unnamed_addr #0 !dbg !1841 {
entry:
    #dbg_value(ptr %s, !1844, !DIExpression(), !1845)
    #dbg_value(i32 %pos, !1846, !DIExpression(), !1845)
    #dbg_value(i32 %r, !1847, !DIExpression(), !1845)
    #dbg_value(ptr %in, !1848, !DIExpression(), !1845)
    #dbg_value(i32 %inlen, !1849, !DIExpression(), !1845)
  br label %while.cond, !dbg !1850

while.cond:                                       ; preds = %for.end, %entry
  %in.addr.0 = phi ptr [ %in, %entry ], [ %in.addr.1.lcssa, %for.end ]
  %inlen.addr.0 = phi i32 [ %inlen, %entry ], [ %sub2, %for.end ]
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ 0, %for.end ]
    #dbg_value(i32 %pos.addr.0, !1846, !DIExpression(), !1845)
    #dbg_value(i32 %inlen.addr.0, !1849, !DIExpression(), !1845)
    #dbg_value(ptr %in.addr.0, !1848, !DIExpression(), !1845)
  %add = add i32 %pos.addr.0, %inlen.addr.0, !dbg !1851
  %cmp.not = icmp ult i32 %add, %r, !dbg !1852
  br i1 %cmp.not, label %for.cond3.preheader, label %for.cond.preheader, !dbg !1850

for.cond.preheader:                               ; preds = %while.cond
  %umax = call i32 @llvm.umax.i32(i32 %pos.addr.0, i32 %r), !dbg !1853
  br label %for.cond, !dbg !1853

for.cond3.preheader:                              ; preds = %while.cond
  %in.addr.0.lcssa = phi ptr [ %in.addr.0, %while.cond ]
  %inlen.addr.0.lcssa = phi i32 [ %inlen.addr.0, %while.cond ]
  %pos.addr.0.lcssa = phi i32 [ %pos.addr.0, %while.cond ]
  br label %for.cond3, !dbg !1856

for.cond:                                         ; preds = %for.cond.preheader, %for.body
  %in.addr.1 = phi ptr [ %incdec.ptr, %for.body ], [ %in.addr.0, %for.cond.preheader ]
  %i.0 = phi i32 [ %inc, %for.body ], [ %pos.addr.0, %for.cond.preheader ], !dbg !1858
    #dbg_value(i32 %i.0, !1859, !DIExpression(), !1845)
    #dbg_value(ptr %in.addr.1, !1848, !DIExpression(), !1845)
  %exitcond = icmp ne i32 %i.0, %umax, !dbg !1860
  br i1 %exitcond, label %for.body, label %for.end, !dbg !1853

for.body:                                         ; preds = %for.cond
    #dbg_value(ptr %in.addr.1, !1848, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1845)
  %0 = load i8, ptr %in.addr.1, align 1, !dbg !1862
  %conv = zext i8 %0 to i64, !dbg !1863
  %rem = shl nuw nsw i32 %i.0, 3, !dbg !1864
  %mul = and i32 %rem, 56, !dbg !1864
  %sh_prom = zext nneg i32 %mul to i64, !dbg !1865
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !1865
  %div2 = lshr i32 %i.0, 3, !dbg !1866
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div2, !dbg !1867
  %1 = load i64, ptr %arrayidx, align 8, !dbg !1868
  %xor = xor i64 %1, %shl, !dbg !1868
  store i64 %xor, ptr %arrayidx, align 8, !dbg !1868
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %in.addr.1, i32 1, !dbg !1869
    #dbg_value(ptr %incdec.ptr, !1848, !DIExpression(), !1845)
  %inc = add i32 %i.0, 1, !dbg !1870
    #dbg_value(i32 %inc, !1859, !DIExpression(), !1845)
  br label %for.cond, !dbg !1871, !llvm.loop !1872

for.end:                                          ; preds = %for.cond
  %in.addr.1.lcssa = phi ptr [ %in.addr.1, %for.cond ]
  %sub.neg = sub i32 %pos.addr.0, %r, !dbg !1874
  %sub2 = add i32 %sub.neg, %inlen.addr.0, !dbg !1875
    #dbg_value(i32 %sub2, !1849, !DIExpression(), !1845)
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !1876
    #dbg_value(i32 0, !1846, !DIExpression(), !1845)
  br label %while.cond, !dbg !1850, !llvm.loop !1877

for.cond3:                                        ; preds = %for.cond3.preheader, %for.body7
  %in.addr.2 = phi ptr [ %incdec.ptr8, %for.body7 ], [ %in.addr.0.lcssa, %for.cond3.preheader ]
  %i.1 = phi i32 [ %inc18, %for.body7 ], [ %pos.addr.0.lcssa, %for.cond3.preheader ], !dbg !1879
    #dbg_value(i32 %i.1, !1859, !DIExpression(), !1845)
    #dbg_value(ptr %in.addr.2, !1848, !DIExpression(), !1845)
  %add4 = add i32 %pos.addr.0.lcssa, %inlen.addr.0.lcssa, !dbg !1880
  %cmp5 = icmp ult i32 %i.1, %add4, !dbg !1882
  br i1 %cmp5, label %for.body7, label %for.end19, !dbg !1856

for.body7:                                        ; preds = %for.cond3
    #dbg_value(ptr %in.addr.2, !1848, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1845)
  %2 = load i8, ptr %in.addr.2, align 1, !dbg !1883
  %conv9 = zext i8 %2 to i64, !dbg !1884
  %rem10 = shl i32 %i.1, 3, !dbg !1885
  %mul11 = and i32 %rem10, 56, !dbg !1885
  %sh_prom12 = zext nneg i32 %mul11 to i64, !dbg !1886
  %shl13 = shl nuw i64 %conv9, %sh_prom12, !dbg !1886
  %div141 = lshr i32 %i.1, 3, !dbg !1887
  %arrayidx15 = getelementptr inbounds nuw i64, ptr %s, i32 %div141, !dbg !1888
  %3 = load i64, ptr %arrayidx15, align 8, !dbg !1889
  %xor16 = xor i64 %3, %shl13, !dbg !1889
  store i64 %xor16, ptr %arrayidx15, align 8, !dbg !1889
  %incdec.ptr8 = getelementptr inbounds nuw i8, ptr %in.addr.2, i32 1, !dbg !1890
    #dbg_value(ptr %incdec.ptr8, !1848, !DIExpression(), !1845)
  %inc18 = add nuw i32 %i.1, 1, !dbg !1891
    #dbg_value(i32 %inc18, !1859, !DIExpression(), !1845)
  br label %for.cond3, !dbg !1892, !llvm.loop !1893

for.end19:                                        ; preds = %for.cond3
  %i.1.lcssa = phi i32 [ %i.1, %for.cond3 ], !dbg !1879
  ret i32 %i.1.lcssa, !dbg !1895
}

; Function Attrs: nounwind
define internal fastcc void @KeccakF1600_StatePermute(ptr noundef %state) unnamed_addr #0 !dbg !1896 {
entry:
    #dbg_value(ptr %state, !1897, !DIExpression(), !1898)
  %0 = load i64, ptr %state, align 8, !dbg !1899
    #dbg_value(i64 %0, !1900, !DIExpression(), !1898)
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !1901
  %1 = load i64, ptr %arrayidx1, align 8, !dbg !1901
    #dbg_value(i64 %1, !1902, !DIExpression(), !1898)
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !1903
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !1903
    #dbg_value(i64 %2, !1904, !DIExpression(), !1898)
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !1905
  %3 = load i64, ptr %arrayidx3, align 8, !dbg !1905
    #dbg_value(i64 %3, !1906, !DIExpression(), !1898)
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !1907
  %4 = load i64, ptr %arrayidx4, align 8, !dbg !1907
    #dbg_value(i64 %4, !1908, !DIExpression(), !1898)
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !1909
  %5 = load i64, ptr %arrayidx5, align 8, !dbg !1909
    #dbg_value(i64 %5, !1910, !DIExpression(), !1898)
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !1911
  %6 = load i64, ptr %arrayidx6, align 8, !dbg !1911
    #dbg_value(i64 %6, !1912, !DIExpression(), !1898)
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !1913
  %7 = load i64, ptr %arrayidx7, align 8, !dbg !1913
    #dbg_value(i64 %7, !1914, !DIExpression(), !1898)
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !1915
  %8 = load i64, ptr %arrayidx8, align 8, !dbg !1915
    #dbg_value(i64 %8, !1916, !DIExpression(), !1898)
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !1917
  %9 = load i64, ptr %arrayidx9, align 8, !dbg !1917
    #dbg_value(i64 %9, !1918, !DIExpression(), !1898)
  %arrayidx10 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !1919
  %10 = load i64, ptr %arrayidx10, align 8, !dbg !1919
    #dbg_value(i64 %10, !1920, !DIExpression(), !1898)
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !1921
  %11 = load i64, ptr %arrayidx11, align 8, !dbg !1921
    #dbg_value(i64 %11, !1922, !DIExpression(), !1898)
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !1923
  %12 = load i64, ptr %arrayidx12, align 8, !dbg !1923
    #dbg_value(i64 %12, !1924, !DIExpression(), !1898)
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !1925
  %13 = load i64, ptr %arrayidx13, align 8, !dbg !1925
    #dbg_value(i64 %13, !1926, !DIExpression(), !1898)
  %arrayidx14 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !1927
  %14 = load i64, ptr %arrayidx14, align 8, !dbg !1927
    #dbg_value(i64 %14, !1928, !DIExpression(), !1898)
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !1929
  %15 = load i64, ptr %arrayidx15, align 8, !dbg !1929
    #dbg_value(i64 %15, !1930, !DIExpression(), !1898)
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !1931
  %16 = load i64, ptr %arrayidx16, align 8, !dbg !1931
    #dbg_value(i64 %16, !1932, !DIExpression(), !1898)
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !1933
  %17 = load i64, ptr %arrayidx17, align 8, !dbg !1933
    #dbg_value(i64 %17, !1934, !DIExpression(), !1898)
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !1935
  %18 = load i64, ptr %arrayidx18, align 8, !dbg !1935
    #dbg_value(i64 %18, !1936, !DIExpression(), !1898)
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !1937
  %19 = load i64, ptr %arrayidx19, align 8, !dbg !1937
    #dbg_value(i64 %19, !1938, !DIExpression(), !1898)
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !1939
  %20 = load i64, ptr %arrayidx20, align 8, !dbg !1939
    #dbg_value(i64 %20, !1940, !DIExpression(), !1898)
  %arrayidx21 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !1941
  %21 = load i64, ptr %arrayidx21, align 8, !dbg !1941
    #dbg_value(i64 %21, !1942, !DIExpression(), !1898)
  %arrayidx22 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !1943
  %22 = load i64, ptr %arrayidx22, align 8, !dbg !1943
    #dbg_value(i64 %22, !1944, !DIExpression(), !1898)
  %arrayidx23 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !1945
  %23 = load i64, ptr %arrayidx23, align 8, !dbg !1945
    #dbg_value(i64 %23, !1946, !DIExpression(), !1898)
  %arrayidx24 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !1947
  %24 = load i64, ptr %arrayidx24, align 8, !dbg !1947
    #dbg_value(i64 %24, !1948, !DIExpression(), !1898)
    #dbg_value(i32 0, !1949, !DIExpression(), !1898)
  br label %for.cond, !dbg !1950

for.cond:                                         ; preds = %for.inc, %entry
  %Aso.0 = phi i64 [ %23, %entry ], [ %xor444, %for.inc ], !dbg !1898
  %Asi.0 = phi i64 [ %22, %entry ], [ %xor441, %for.inc ], !dbg !1898
  %Ase.0 = phi i64 [ %21, %entry ], [ %xor438, %for.inc ], !dbg !1898
  %Asa.0 = phi i64 [ %20, %entry ], [ %xor435, %for.inc ], !dbg !1898
  %Amu.0 = phi i64 [ %19, %entry ], [ %xor412, %for.inc ], !dbg !1898
  %Amo.0 = phi i64 [ %18, %entry ], [ %xor409, %for.inc ], !dbg !1898
  %Ami.0 = phi i64 [ %17, %entry ], [ %xor406, %for.inc ], !dbg !1898
  %Ame.0 = phi i64 [ %16, %entry ], [ %xor403, %for.inc ], !dbg !1898
  %Ama.0 = phi i64 [ %15, %entry ], [ %xor400, %for.inc ], !dbg !1898
  %Aku.0 = phi i64 [ %14, %entry ], [ %xor377, %for.inc ], !dbg !1898
  %Ako.0 = phi i64 [ %13, %entry ], [ %xor374, %for.inc ], !dbg !1898
  %Aki.0 = phi i64 [ %12, %entry ], [ %xor371, %for.inc ], !dbg !1898
  %Ake.0 = phi i64 [ %11, %entry ], [ %xor368, %for.inc ], !dbg !1898
  %Aka.0 = phi i64 [ %10, %entry ], [ %xor365, %for.inc ], !dbg !1898
  %Agu.0 = phi i64 [ %9, %entry ], [ %xor342, %for.inc ], !dbg !1898
  %Ago.0 = phi i64 [ %8, %entry ], [ %xor339, %for.inc ], !dbg !1898
  %Agi.0 = phi i64 [ %7, %entry ], [ %xor336, %for.inc ], !dbg !1898
  %Age.0 = phi i64 [ %6, %entry ], [ %xor333, %for.inc ], !dbg !1898
  %Aga.0 = phi i64 [ %5, %entry ], [ %xor330, %for.inc ], !dbg !1898
  %Abu.0 = phi i64 [ %4, %entry ], [ %xor307, %for.inc ], !dbg !1898
  %Abo.0 = phi i64 [ %3, %entry ], [ %xor304, %for.inc ], !dbg !1898
  %Abi.0 = phi i64 [ %2, %entry ], [ %xor301, %for.inc ], !dbg !1898
  %Abe.0 = phi i64 [ %1, %entry ], [ %xor298, %for.inc ], !dbg !1898
  %Aba.0 = phi i64 [ %0, %entry ], [ %xor295, %for.inc ], !dbg !1898
  %round.0 = phi i32 [ 0, %entry ], [ %add448, %for.inc ], !dbg !1952
  %Asu.0 = phi i64 [ %24, %entry ], [ %xor447, %for.inc ], !dbg !1898
    #dbg_value(i64 %Asu.0, !1948, !DIExpression(), !1898)
    #dbg_value(i32 %round.0, !1949, !DIExpression(), !1898)
    #dbg_value(i64 %Aba.0, !1900, !DIExpression(), !1898)
    #dbg_value(i64 %Abe.0, !1902, !DIExpression(), !1898)
    #dbg_value(i64 %Abi.0, !1904, !DIExpression(), !1898)
    #dbg_value(i64 %Abo.0, !1906, !DIExpression(), !1898)
    #dbg_value(i64 %Abu.0, !1908, !DIExpression(), !1898)
    #dbg_value(i64 %Aga.0, !1910, !DIExpression(), !1898)
    #dbg_value(i64 %Age.0, !1912, !DIExpression(), !1898)
    #dbg_value(i64 %Agi.0, !1914, !DIExpression(), !1898)
    #dbg_value(i64 %Ago.0, !1916, !DIExpression(), !1898)
    #dbg_value(i64 %Agu.0, !1918, !DIExpression(), !1898)
    #dbg_value(i64 %Aka.0, !1920, !DIExpression(), !1898)
    #dbg_value(i64 %Ake.0, !1922, !DIExpression(), !1898)
    #dbg_value(i64 %Aki.0, !1924, !DIExpression(), !1898)
    #dbg_value(i64 %Ako.0, !1926, !DIExpression(), !1898)
    #dbg_value(i64 %Aku.0, !1928, !DIExpression(), !1898)
    #dbg_value(i64 %Ama.0, !1930, !DIExpression(), !1898)
    #dbg_value(i64 %Ame.0, !1932, !DIExpression(), !1898)
    #dbg_value(i64 %Ami.0, !1934, !DIExpression(), !1898)
    #dbg_value(i64 %Amo.0, !1936, !DIExpression(), !1898)
    #dbg_value(i64 %Amu.0, !1938, !DIExpression(), !1898)
    #dbg_value(i64 %Asa.0, !1940, !DIExpression(), !1898)
    #dbg_value(i64 %Ase.0, !1942, !DIExpression(), !1898)
    #dbg_value(i64 %Asi.0, !1944, !DIExpression(), !1898)
    #dbg_value(i64 %Aso.0, !1946, !DIExpression(), !1898)
  %cmp = icmp samesign ult i32 %round.0, 24, !dbg !1953
  br i1 %cmp, label %for.inc, label %for.end, !dbg !1955

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %Asa.0, i64 %Ama.0, i64 %Aka.0, i64 %Aga.0), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %Ase.0, i64 %Ame.0, i64 %Ake.0, i64 %Age.0), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %Asi.0, i64 %Ami.0, i64 %Aki.0, i64 %Agi.0), !1958, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %Aso.0, i64 %Amo.0, i64 %Ako.0, i64 %Ago.0), !1959, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %Asu.0, i64 %Amu.0, i64 %Aku.0, i64 %Agu.0), !1960, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1961, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1962, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1963, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1964, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1965, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1900, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1912, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1957, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1924, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1958, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1936, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1959, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1948, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1960, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1967, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1968, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1969, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1970, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1906, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1956, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1918, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1957, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1920, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1958, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1932, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1959, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1944, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1960, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1971, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1972, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1973, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1975, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1902, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1956, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1914, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1957, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1926, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1958, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1938, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1959, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1940, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1960, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1976, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1977, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1979, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1908, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1956, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1910, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1957, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1922, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1958, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1934, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1959, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1946, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1960, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1981, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1983, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1985, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1904, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1956, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1916, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1957, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1928, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1958, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1930, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1959, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1942, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1960, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1986, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1987, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1988, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1989, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1990, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !1958, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1959, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1960, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1961, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1962, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1963, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1964, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !1965, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1972, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1957, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1958, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1959, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1990, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1960, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1900, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !1900, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1902, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1904, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1906, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison), !1908, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1969, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1956, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1975, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1957, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1976, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1958, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1959, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1988, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1960, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1910, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1912, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1914, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1916, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1918, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1967, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1956, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1973, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1957, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1979, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1958, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1985, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1959, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1986, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1960, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1920, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1922, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1924, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1926, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1928, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1970, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1956, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1971, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1957, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1977, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1958, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1983, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1959, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison, i64 poison, i64 poison), !1989, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1960, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1930, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1932, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1934, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1936, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1938, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1968, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1956, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1957, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1958, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1981, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1959, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1987, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 poison, !1960, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1940, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1942, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1944, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1946, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 poison, i64 poison, i64 poison), !1948, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor32 = xor i64 %Abi.0, %Agi.0, !dbg !1991
    #dbg_value(!DIArgList(i64 %xor32, i64 %Asi.0, i64 %Ami.0, i64 %Aki.0), !1958, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor33 = xor i64 %xor32, %Aki.0, !dbg !1993
    #dbg_value(!DIArgList(i64 %xor33, i64 %Asi.0, i64 %Ami.0), !1958, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor34 = xor i64 %xor33, %Ami.0, !dbg !1994
    #dbg_value(!DIArgList(i64 %xor34, i64 %Asi.0), !1958, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor35 = xor i64 %xor34, %Asi.0, !dbg !1995
    #dbg_value(i64 %xor35, !1958, !DIExpression(), !1898)
  %xor40 = xor i64 %Abu.0, %Agu.0, !dbg !1996
    #dbg_value(!DIArgList(i64 %xor40, i64 %Asu.0, i64 %Amu.0, i64 %Aku.0), !1960, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor41 = xor i64 %xor40, %Aku.0, !dbg !1997
    #dbg_value(!DIArgList(i64 %xor41, i64 %Asu.0, i64 %Amu.0), !1960, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor42 = xor i64 %xor41, %Amu.0, !dbg !1998
    #dbg_value(!DIArgList(i64 %xor42, i64 %Asu.0), !1960, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor43 = xor i64 %xor42, %Asu.0, !dbg !1999
    #dbg_value(i64 %xor43, !1960, !DIExpression(), !1898)
  %25 = shl i64 %xor43, 1, !dbg !2000
  %26 = lshr i64 %xor43, 63, !dbg !2000
  %27 = or i64 %25, %26, !dbg !2000
    #dbg_value(!DIArgList(i64 %Ago.0, i64 %xor35, i64 %27), !1916, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %xor35, i64 %27), !1906, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Ako.0, i64 %xor35, i64 %27), !1926, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Amo.0, i64 %xor35, i64 %27), !1936, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Aso.0, i64 %xor35, i64 %27), !1946, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor35, i64 %27), !1964, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor57 = xor i64 %xor35, %27, !dbg !2001
    #dbg_value(!DIArgList(i64 %Ago.0, i64 %xor57), !1916, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Abo.0, i64 %xor57), !1906, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Ako.0, i64 %xor57), !1926, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Amo.0, i64 %xor57), !1936, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Aso.0, i64 %xor57), !1946, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 %xor57, !1964, !DIExpression(), !1898)
  %xor203 = xor i64 %Ago.0, %xor57, !dbg !2002
    #dbg_value(i64 %xor203, !1916, !DIExpression(), !1898)
  %28 = shl i64 %xor203, 55, !dbg !2003
  %29 = lshr i64 %xor203, 9, !dbg !2003
  %30 = or i64 %28, %29, !dbg !2003
    #dbg_value(i64 %30, !1957, !DIExpression(), !1898)
  %xor28 = xor i64 %Abe.0, %Age.0, !dbg !2004
    #dbg_value(!DIArgList(i64 %xor28, i64 %Ase.0, i64 %Ame.0, i64 %Ake.0), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor29 = xor i64 %xor28, %Ake.0, !dbg !2005
    #dbg_value(!DIArgList(i64 %xor29, i64 %Ase.0, i64 %Ame.0), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor30 = xor i64 %xor29, %Ame.0, !dbg !2006
    #dbg_value(!DIArgList(i64 %xor30, i64 %Ase.0), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor31 = xor i64 %xor30, %Ase.0, !dbg !2007
    #dbg_value(i64 %xor31, !1957, !DIExpression(), !1898)
  %31 = shl i64 %xor31, 1, !dbg !2008
  %32 = lshr i64 %xor31, 63, !dbg !2008
  %33 = or i64 %31, %32, !dbg !2008
    #dbg_value(!DIArgList(i64 %xor43, i64 %33), !1961, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor43, i64 %33), !1900, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor43, i64 %33), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Aka.0, i64 %xor43, i64 %33), !1920, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Aga.0, i64 %xor43, i64 %33), !1910, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Asa.0, i64 %xor43, i64 %33), !1940, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Ama.0, i64 %xor43, i64 %33), !1930, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor45 = xor i64 %xor43, %33, !dbg !2009
    #dbg_value(i64 %xor45, !1961, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor45), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %xor45), !1900, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Aka.0, i64 %xor45), !1920, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Aga.0, i64 %xor45), !1910, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Asa.0, i64 %xor45), !1940, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Ama.0, i64 %xor45), !1930, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor211 = xor i64 %Ama.0, %xor45, !dbg !2010
    #dbg_value(i64 %xor211, !1930, !DIExpression(), !1898)
  %34 = shl i64 %xor211, 41, !dbg !2011
  %35 = lshr i64 %xor211, 23, !dbg !2011
  %36 = or i64 %34, %35, !dbg !2011
    #dbg_value(i64 %36, !1959, !DIExpression(), !1898)
  %xor36 = xor i64 %Abo.0, %Ago.0, !dbg !2012
    #dbg_value(!DIArgList(i64 %xor36, i64 %Aso.0, i64 %Amo.0, i64 %Ako.0), !1959, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor37 = xor i64 %xor36, %Ako.0, !dbg !2013
    #dbg_value(!DIArgList(i64 %xor37, i64 %Aso.0, i64 %Amo.0), !1959, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor38 = xor i64 %xor37, %Amo.0, !dbg !2014
    #dbg_value(!DIArgList(i64 %xor38, i64 %Aso.0), !1959, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor39 = xor i64 %xor38, %Aso.0, !dbg !2015
    #dbg_value(i64 %xor39, !1959, !DIExpression(), !1898)
  %xor = xor i64 %Aba.0, %Aga.0, !dbg !2016
    #dbg_value(!DIArgList(i64 %xor, i64 %Asa.0, i64 %Ama.0, i64 %Aka.0), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor25 = xor i64 %xor, %Aka.0, !dbg !2017
    #dbg_value(!DIArgList(i64 %xor25, i64 %Asa.0, i64 %Ama.0), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor26 = xor i64 %xor25, %Ama.0, !dbg !2018
    #dbg_value(!DIArgList(i64 %xor26, i64 %Asa.0), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor27 = xor i64 %xor26, %Asa.0, !dbg !2019
    #dbg_value(i64 %xor27, !1956, !DIExpression(), !1898)
  %37 = shl i64 %xor27, 1, !dbg !2020
  %38 = lshr i64 %xor27, 63, !dbg !2020
  %39 = or i64 %37, %38, !dbg !2020
    #dbg_value(!DIArgList(i64 %Agu.0, i64 %xor39, i64 %39), !1918, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %xor39, i64 %39), !1908, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Asu.0, i64 %xor39, i64 %39), !1948, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Amu.0, i64 %xor39, i64 %39), !1938, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor39, i64 %39), !1965, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Aku.0, i64 %xor39, i64 %39), !1928, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor61 = xor i64 %xor39, %39, !dbg !2021
    #dbg_value(!DIArgList(i64 %Agu.0, i64 %xor61), !1918, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Abu.0, i64 %xor61), !1908, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Asu.0, i64 %xor61), !1948, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Amu.0, i64 %xor61), !1938, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 %xor61, !1965, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 %Aku.0, i64 %xor61), !1928, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor207 = xor i64 %Aku.0, %xor61, !dbg !2022
    #dbg_value(i64 %xor207, !1928, !DIExpression(), !1898)
  %40 = shl i64 %xor207, 39, !dbg !2023
  %41 = lshr i64 %xor207, 25, !dbg !2023
  %42 = or i64 %40, %41, !dbg !2023
    #dbg_value(i64 %42, !1958, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 %30, i64 %36, i64 %42), !1987, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %not222 = xor i64 %42, -1, !dbg !2024
    #dbg_value(!DIArgList(i64 %30, i64 %36, i64 %not222), !1987, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %and223 = and i64 %36, %not222, !dbg !2025
    #dbg_value(!DIArgList(i64 %30, i64 %and223), !1987, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor224 = xor i64 %30, %and223, !dbg !2026
    #dbg_value(i64 %xor224, !1987, !DIExpression(), !1898)
  %43 = shl i64 %xor39, 1, !dbg !2027
  %44 = lshr i64 %xor39, 63, !dbg !2027
  %45 = or i64 %43, %44, !dbg !2027
    #dbg_value(!DIArgList(i64 %xor31, i64 %45), !1963, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Aki.0, i64 %xor31, i64 %45), !1924, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Agi.0, i64 %xor31, i64 %45), !1914, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %xor31, i64 %45), !1904, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Asi.0, i64 %xor31, i64 %45), !1944, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Ami.0, i64 %xor31, i64 %45), !1934, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor53 = xor i64 %xor31, %45, !dbg !2028
    #dbg_value(i64 %xor53, !1963, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 %Aki.0, i64 %xor53), !1924, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Agi.0, i64 %xor53), !1914, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Abi.0, i64 %xor53), !1904, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Asi.0, i64 %xor53), !1944, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Ami.0, i64 %xor53), !1934, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor67 = xor i64 %Aki.0, %xor53, !dbg !2029
    #dbg_value(i64 %xor67, !1924, !DIExpression(), !1898)
  %46 = shl i64 %xor67, 43, !dbg !2030
  %47 = lshr i64 %xor67, 21, !dbg !2030
  %48 = or i64 %46, %47, !dbg !2030
    #dbg_value(i64 %48, !1958, !DIExpression(), !1898)
  %49 = shl i64 %xor35, 1, !dbg !2031
  %50 = lshr i64 %xor35, 63, !dbg !2031
  %51 = or i64 %49, %50, !dbg !2031
    #dbg_value(!DIArgList(i64 %xor27, i64 %51), !1962, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Age.0, i64 %xor27, i64 %51), !1912, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %xor27, i64 %51), !1902, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Ake.0, i64 %xor27, i64 %51), !1922, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Ame.0, i64 %xor27, i64 %51), !1932, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Ase.0, i64 %xor27, i64 %51), !1942, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor49 = xor i64 %xor27, %51, !dbg !2032
    #dbg_value(i64 %xor49, !1962, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 %Age.0, i64 %xor49), !1912, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Abe.0, i64 %xor49), !1902, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Ake.0, i64 %xor49), !1922, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Ame.0, i64 %xor49), !1932, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %Ase.0, i64 %xor49), !1942, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor63 = xor i64 %Age.0, %xor49, !dbg !2033
    #dbg_value(i64 %xor63, !1912, !DIExpression(), !1898)
  %52 = shl i64 %xor63, 44, !dbg !2034
  %53 = lshr i64 %xor63, 20, !dbg !2034
  %54 = or i64 %52, %53, !dbg !2034
    #dbg_value(i64 %54, !1957, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %48, i64 %xor45, i64 %54), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %not = xor i64 %54, -1, !dbg !2035
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %48, i64 %xor45, i64 %not), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %and = and i64 %48, %not, !dbg !2036
    #dbg_value(!DIArgList(i64 %Aba.0, i64 %and, i64 %xor45), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %arrayidx80 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %round.0, !dbg !2037
  %55 = load i64, ptr %arrayidx80, align 8, !dbg !2037
    #dbg_value(!DIArgList(i64 %and, i64 %Aba.0, i64 %xor45, i64 %55), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
  %56 = xor i64 %and, %55, !dbg !2038
    #dbg_value(!DIArgList(i64 %56, i64 %Aba.0, i64 %xor45), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor62 = xor i64 %Aba.0, %xor45, !dbg !2039
    #dbg_value(i64 %xor62, !1900, !DIExpression(), !1898)
    #dbg_value(i64 %xor62, !1956, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 %56, i64 %xor62), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor81 = xor i64 %56, %xor62, !dbg !2038
    #dbg_value(i64 %xor81, !1966, !DIExpression(), !1898)
  %xor94 = xor i64 %Abo.0, %xor57, !dbg !2040
    #dbg_value(i64 %xor94, !1906, !DIExpression(), !1898)
  %57 = shl i64 %xor94, 28, !dbg !2041
  %58 = lshr i64 %xor94, 36, !dbg !2041
  %59 = or i64 %57, %58, !dbg !2041
    #dbg_value(i64 %59, !1956, !DIExpression(), !1898)
  %xor102 = xor i64 %Aka.0, %xor45, !dbg !2042
    #dbg_value(i64 %xor102, !1920, !DIExpression(), !1898)
  %60 = shl i64 %xor102, 3, !dbg !2043
  %61 = lshr i64 %xor102, 61, !dbg !2043
  %62 = or i64 %60, %61, !dbg !2043
    #dbg_value(i64 %62, !1958, !DIExpression(), !1898)
  %xor98 = xor i64 %Agu.0, %xor61, !dbg !2044
    #dbg_value(i64 %xor98, !1918, !DIExpression(), !1898)
  %63 = shl i64 %xor98, 20, !dbg !2045
  %64 = lshr i64 %xor98, 44, !dbg !2045
  %65 = or i64 %63, %64, !dbg !2045
    #dbg_value(i64 %65, !1957, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 %59, i64 %62, i64 %65), !1971, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %not114 = xor i64 %65, -1, !dbg !2046
    #dbg_value(!DIArgList(i64 %59, i64 %62, i64 %not114), !1971, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %and115 = and i64 %62, %not114, !dbg !2047
    #dbg_value(!DIArgList(i64 %59, i64 %and115), !1971, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor116 = xor i64 %59, %and115, !dbg !2048
    #dbg_value(i64 %xor116, !1971, !DIExpression(), !1898)
  %xor234 = xor i64 %xor81, %xor116, !dbg !2049
  %xor129 = xor i64 %Abe.0, %xor49, !dbg !2050
    #dbg_value(i64 %xor129, !1902, !DIExpression(), !1898)
  %66 = shl i64 %xor129, 1, !dbg !2051
  %67 = lshr i64 %xor129, 63, !dbg !2051
  %68 = or i64 %66, %67, !dbg !2051
    #dbg_value(i64 %68, !1956, !DIExpression(), !1898)
  %xor137 = xor i64 %Ako.0, %xor57, !dbg !2052
    #dbg_value(i64 %xor137, !1926, !DIExpression(), !1898)
  %69 = shl i64 %xor137, 25, !dbg !2053
  %70 = lshr i64 %xor137, 39, !dbg !2053
  %71 = or i64 %69, %70, !dbg !2053
    #dbg_value(i64 %71, !1958, !DIExpression(), !1898)
  %xor133 = xor i64 %Agi.0, %xor53, !dbg !2054
    #dbg_value(i64 %xor133, !1914, !DIExpression(), !1898)
  %72 = shl i64 %xor133, 6, !dbg !2055
  %73 = lshr i64 %xor133, 58, !dbg !2055
  %74 = or i64 %72, %73, !dbg !2055
    #dbg_value(i64 %74, !1957, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 %68, i64 %71, i64 %74), !1976, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %not149 = xor i64 %74, -1, !dbg !2056
    #dbg_value(!DIArgList(i64 %68, i64 %71, i64 %not149), !1976, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %and150 = and i64 %71, %not149, !dbg !2057
    #dbg_value(!DIArgList(i64 %68, i64 %and150), !1976, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor151 = xor i64 %68, %and150, !dbg !2058
    #dbg_value(i64 %xor151, !1976, !DIExpression(), !1898)
  %xor235 = xor i64 %xor234, %xor151, !dbg !2059
  %xor164 = xor i64 %Abu.0, %xor61, !dbg !2060
    #dbg_value(i64 %xor164, !1908, !DIExpression(), !1898)
  %75 = shl i64 %xor164, 27, !dbg !2061
  %76 = lshr i64 %xor164, 37, !dbg !2061
  %77 = or i64 %75, %76, !dbg !2061
    #dbg_value(i64 %77, !1956, !DIExpression(), !1898)
  %xor172 = xor i64 %Ake.0, %xor49, !dbg !2062
    #dbg_value(i64 %xor172, !1922, !DIExpression(), !1898)
  %78 = shl i64 %xor172, 10, !dbg !2063
  %79 = lshr i64 %xor172, 54, !dbg !2063
  %80 = or i64 %78, %79, !dbg !2063
    #dbg_value(i64 %80, !1958, !DIExpression(), !1898)
  %xor168 = xor i64 %Aga.0, %xor45, !dbg !2064
    #dbg_value(i64 %xor168, !1910, !DIExpression(), !1898)
  %81 = shl i64 %xor168, 36, !dbg !2065
  %82 = lshr i64 %xor168, 28, !dbg !2065
  %83 = or i64 %81, %82, !dbg !2065
    #dbg_value(i64 %83, !1957, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 %77, i64 %80, i64 %83), !1981, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %not184 = xor i64 %83, -1, !dbg !2066
    #dbg_value(!DIArgList(i64 %77, i64 %80, i64 %not184), !1981, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %and185 = and i64 %80, %not184, !dbg !2067
    #dbg_value(!DIArgList(i64 %77, i64 %and185), !1981, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor186 = xor i64 %77, %and185, !dbg !2068
    #dbg_value(i64 %xor186, !1981, !DIExpression(), !1898)
  %xor236 = xor i64 %xor235, %xor186, !dbg !2069
  %xor199 = xor i64 %Abi.0, %xor53, !dbg !2070
    #dbg_value(i64 %xor199, !1904, !DIExpression(), !1898)
  %84 = shl i64 %xor199, 62, !dbg !2071
  %85 = lshr i64 %xor199, 2, !dbg !2071
  %86 = or i64 %84, %85, !dbg !2071
    #dbg_value(!DIArgList(i64 %86, i64 %42, i64 %30), !1986, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor236, i64 %86, i64 %42, i64 %30), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
  %not219 = xor i64 %30, -1, !dbg !2072
    #dbg_value(!DIArgList(i64 %86, i64 %42, i64 %not219), !1986, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor236, i64 %86, i64 %42, i64 %not219), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
  %and220 = and i64 %42, %not219, !dbg !2073
    #dbg_value(!DIArgList(i64 %86, i64 %and220), !1986, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor236, i64 %86, i64 %and220), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor221 = xor i64 %86, %and220, !dbg !2074
    #dbg_value(i64 %xor221, !1986, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 %xor236, i64 %xor221), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor237 = xor i64 %xor236, %xor221, !dbg !2075
    #dbg_value(i64 %xor237, !1956, !DIExpression(), !1898)
  %xor75 = xor i64 %Asu.0, %xor61, !dbg !2076
    #dbg_value(i64 %xor75, !1948, !DIExpression(), !1898)
  %87 = shl i64 %xor75, 14, !dbg !2077
  %88 = lshr i64 %xor75, 50, !dbg !2077
  %89 = or i64 %87, %88, !dbg !2077
    #dbg_value(i64 %89, !1960, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 %89, i64 %54, i64 %xor62), !1970, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor71 = xor i64 %Amo.0, %xor57, !dbg !2078
    #dbg_value(i64 %xor71, !1936, !DIExpression(), !1898)
  %90 = shl i64 %xor71, 21, !dbg !2079
  %91 = lshr i64 %xor71, 43, !dbg !2079
  %92 = or i64 %90, %91, !dbg !2079
    #dbg_value(i64 %92, !1959, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 %48, i64 %89, i64 %92), !1968, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %54, i64 %92, i64 %48), !1967, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %92, i64 %xor62, i64 %89), !1969, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %not85 = xor i64 %92, -1, !dbg !2080
    #dbg_value(!DIArgList(i64 %48, i64 %89, i64 %not85), !1968, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %and86 = and i64 %89, %not85, !dbg !2081
    #dbg_value(!DIArgList(i64 %48, i64 %and86), !1968, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor87 = xor i64 %48, %and86, !dbg !2082
    #dbg_value(i64 %xor87, !1968, !DIExpression(), !1898)
  %xor110 = xor i64 %Asi.0, %xor53, !dbg !2083
    #dbg_value(i64 %xor110, !1944, !DIExpression(), !1898)
  %93 = shl i64 %xor110, 61, !dbg !2084
  %94 = lshr i64 %xor110, 3, !dbg !2084
  %95 = or i64 %93, %94, !dbg !2084
    #dbg_value(i64 %95, !1960, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 %95, i64 %65, i64 %59), !1975, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor106 = xor i64 %Ame.0, %xor49, !dbg !2085
    #dbg_value(i64 %xor106, !1932, !DIExpression(), !1898)
  %96 = shl i64 %xor106, 45, !dbg !2086
  %97 = lshr i64 %xor106, 19, !dbg !2086
  %98 = or i64 %96, %97, !dbg !2086
    #dbg_value(i64 %98, !1959, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 %62, i64 %95, i64 %98), !1973, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %98, i64 %59, i64 %95), !1974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %65, i64 %98, i64 %62), !1972, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %not120 = xor i64 %98, -1, !dbg !2087
    #dbg_value(!DIArgList(i64 %62, i64 %95, i64 %not120), !1973, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %and121 = and i64 %95, %not120, !dbg !2088
    #dbg_value(!DIArgList(i64 %62, i64 %and121), !1973, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor122 = xor i64 %62, %and121, !dbg !2089
    #dbg_value(i64 %xor122, !1973, !DIExpression(), !1898)
  %xor242 = xor i64 %xor87, %xor122, !dbg !2090
  %xor145 = xor i64 %Asa.0, %xor45, !dbg !2091
    #dbg_value(i64 %xor145, !1940, !DIExpression(), !1898)
  %99 = shl i64 %xor145, 18, !dbg !2092
  %100 = lshr i64 %xor145, 46, !dbg !2092
  %101 = or i64 %99, %100, !dbg !2092
    #dbg_value(i64 %101, !1960, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 %101, i64 %74, i64 %68), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor141 = xor i64 %Amu.0, %xor61, !dbg !2093
    #dbg_value(i64 %xor141, !1938, !DIExpression(), !1898)
  %102 = shl i64 %xor141, 8, !dbg !2094
  %103 = lshr i64 %xor141, 56, !dbg !2094
  %104 = or i64 %102, %103, !dbg !2094
    #dbg_value(i64 %104, !1959, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 %71, i64 %101, i64 %104), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %74, i64 %104, i64 %71), !1977, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %104, i64 %68, i64 %101), !1979, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %not155 = xor i64 %104, -1, !dbg !2095
    #dbg_value(!DIArgList(i64 %71, i64 %101, i64 %not155), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %and156 = and i64 %101, %not155, !dbg !2096
    #dbg_value(!DIArgList(i64 %71, i64 %and156), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor157 = xor i64 %71, %and156, !dbg !2097
    #dbg_value(i64 %xor157, !1978, !DIExpression(), !1898)
  %xor243 = xor i64 %xor242, %xor157, !dbg !2098
  %xor180 = xor i64 %Aso.0, %xor57, !dbg !2099
    #dbg_value(i64 %xor180, !1946, !DIExpression(), !1898)
  %105 = shl i64 %xor180, 56, !dbg !2100
  %106 = lshr i64 %xor180, 8, !dbg !2100
  %107 = or i64 %105, %106, !dbg !2100
    #dbg_value(i64 %107, !1960, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 %107, i64 %83, i64 %77), !1985, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor176 = xor i64 %Ami.0, %xor53, !dbg !2101
    #dbg_value(i64 %xor176, !1934, !DIExpression(), !1898)
  %108 = shl i64 %xor176, 15, !dbg !2102
  %109 = lshr i64 %xor176, 49, !dbg !2102
  %110 = or i64 %108, %109, !dbg !2102
    #dbg_value(i64 %110, !1959, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 %80, i64 %107, i64 %110), !1983, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %83, i64 %110, i64 %80), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %110, i64 %77, i64 %107), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %54, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71, i64 %65, i64 %98, i64 %62, i64 %92, i64 %48), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %not190 = xor i64 %110, -1, !dbg !2103
    #dbg_value(!DIArgList(i64 %80, i64 %107, i64 %not190), !1983, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %and191 = and i64 %107, %not190, !dbg !2104
    #dbg_value(!DIArgList(i64 %80, i64 %and191), !1983, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor192 = xor i64 %80, %and191, !dbg !2105
    #dbg_value(i64 %xor192, !1983, !DIExpression(), !1898)
  %xor244 = xor i64 %xor243, %xor192, !dbg !2106
  %xor215 = xor i64 %Ase.0, %xor49, !dbg !2107
    #dbg_value(i64 %xor215, !1942, !DIExpression(), !1898)
  %111 = shl i64 %xor215, 2, !dbg !2108
  %112 = lshr i64 %xor215, 62, !dbg !2108
  %113 = or i64 %111, %112, !dbg !2108
    #dbg_value(!DIArgList(i64 %42, i64 %113, i64 %36), !1988, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %113, i64 %30, i64 %86), !1990, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %36, i64 %86, i64 %113), !1989, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor244, i64 %42, i64 %113, i64 %36), !1958, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %92, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101, i64 %98, i64 %xor62, i64 %89, i64 %59, i64 %95), !1959, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %89, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68, i64 %95, i64 %65, i64 %59, i64 %54, i64 %xor62), !1960, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
  %not225 = xor i64 %36, -1, !dbg !2109
    #dbg_value(!DIArgList(i64 %42, i64 %113, i64 %not225), !1988, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor244, i64 %42, i64 %113, i64 %not225), !1958, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
  %and226 = and i64 %113, %not225, !dbg !2110
    #dbg_value(!DIArgList(i64 %42, i64 %and226), !1988, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor244, i64 %42, i64 %and226), !1958, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor227 = xor i64 %42, %and226, !dbg !2111
    #dbg_value(i64 %xor227, !1988, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 %xor244, i64 %xor227), !1958, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor245 = xor i64 %xor244, %xor227, !dbg !2112
    #dbg_value(i64 %xor245, !1958, !DIExpression(), !1898)
  %114 = shl i64 %xor245, 1, !dbg !2113
  %115 = lshr i64 %xor245, 63, !dbg !2113
  %116 = or i64 %114, %115, !dbg !2113
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor237, i64 %116), !1987, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %54, i64 %xor237, i64 %92, i64 %48, i64 %116), !1967, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %65, i64 %xor237, i64 %98, i64 %62, i64 %116), !1972, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %74, i64 %xor237, i64 %104, i64 %71, i64 %116), !1977, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %83, i64 %xor237, i64 %110, i64 %80, i64 %116), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor237, i64 %116), !1962, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor261 = xor i64 %xor237, %116, !dbg !2114
    #dbg_value(!DIArgList(i64 %xor224, i64 %xor261), !1987, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %54, i64 %xor261, i64 %92, i64 %48), !1967, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %65, i64 %xor261, i64 %98, i64 %62), !1972, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %74, i64 %xor261, i64 %104, i64 %71), !1977, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %83, i64 %xor261, i64 %110, i64 %80), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 %xor261, !1962, !DIExpression(), !1898)
  %xor429 = xor i64 %xor224, %xor261, !dbg !2115
    #dbg_value(i64 %xor429, !1987, !DIExpression(), !1898)
  %117 = shl i64 %xor429, 2, !dbg !2116
  %118 = lshr i64 %xor429, 62, !dbg !2116
  %119 = or i64 %117, %118, !dbg !2116
    #dbg_value(i64 %119, !1960, !DIExpression(), !1898)
  %not123 = xor i64 %95, -1, !dbg !2117
    #dbg_value(!DIArgList(i64 %98, i64 %59, i64 %not123), !1974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %92, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101, i64 %98, i64 %xor62, i64 %89, i64 %59, i64 %not123), !1959, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
  %and124 = and i64 %59, %not123, !dbg !2118
    #dbg_value(!DIArgList(i64 %98, i64 %and124), !1974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %92, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101, i64 %98, i64 %xor62, i64 %89, i64 %and124), !1959, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor125 = xor i64 %98, %and124, !dbg !2119
    #dbg_value(i64 %xor125, !1974, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 %92, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101, i64 %xor125, i64 %xor62, i64 %89), !1959, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
  %not91 = xor i64 %xor62, -1, !dbg !2120
    #dbg_value(!DIArgList(i64 %89, i64 %54, i64 %not91), !1970, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %89, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68, i64 %95, i64 %65, i64 %59, i64 %54, i64 %not91), !1960, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_LLVM_arg, 14, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
  %and92 = and i64 %54, %not91, !dbg !2121
    #dbg_value(!DIArgList(i64 %89, i64 %and92), !1970, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %89, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68, i64 %95, i64 %65, i64 %59, i64 %and92), !1960, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 13, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor93 = xor i64 %89, %and92, !dbg !2122
    #dbg_value(i64 %xor93, !1970, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 %xor93, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68, i64 %95, i64 %65, i64 %59), !1960, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
  %not126 = xor i64 %59, -1, !dbg !2123
    #dbg_value(!DIArgList(i64 %95, i64 %65, i64 %not126), !1975, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor93, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68, i64 %95, i64 %65, i64 %not126), !1960, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
  %and127 = and i64 %65, %not126, !dbg !2124
    #dbg_value(!DIArgList(i64 %95, i64 %and127), !1975, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor93, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68, i64 %95, i64 %and127), !1960, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor128 = xor i64 %95, %and127, !dbg !2125
    #dbg_value(i64 %xor128, !1975, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 %xor93, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68, i64 %xor128), !1960, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor250 = xor i64 %xor93, %xor128, !dbg !2126
    #dbg_value(!DIArgList(i64 %xor250, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %68), !1960, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
  %not161 = xor i64 %68, -1, !dbg !2127
    #dbg_value(!DIArgList(i64 %101, i64 %74, i64 %not161), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor250, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %74, i64 %not161), !1960, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
  %and162 = and i64 %74, %not161, !dbg !2128
    #dbg_value(!DIArgList(i64 %101, i64 %and162), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor250, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %101, i64 %and162), !1960, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor163 = xor i64 %101, %and162, !dbg !2129
    #dbg_value(i64 %xor163, !1980, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 %xor250, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77, i64 %xor163), !1960, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor251 = xor i64 %xor250, %xor163, !dbg !2130
    #dbg_value(!DIArgList(i64 %xor251, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %77), !1960, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
  %not196 = xor i64 %77, -1, !dbg !2131
    #dbg_value(!DIArgList(i64 %107, i64 %83, i64 %not196), !1985, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor251, i64 %113, i64 %30, i64 %86, i64 %107, i64 %83, i64 %not196), !1960, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
  %and197 = and i64 %83, %not196, !dbg !2132
    #dbg_value(!DIArgList(i64 %107, i64 %and197), !1985, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor251, i64 %113, i64 %30, i64 %86, i64 %107, i64 %and197), !1960, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor198 = xor i64 %107, %and197, !dbg !2133
    #dbg_value(i64 %xor198, !1985, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 %xor251, i64 %113, i64 %30, i64 %86, i64 %xor198), !1960, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor252 = xor i64 %xor251, %xor198, !dbg !2134
    #dbg_value(!DIArgList(i64 %xor252, i64 %113, i64 %30, i64 %86), !1960, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
  %not231 = xor i64 %86, -1, !dbg !2135
    #dbg_value(!DIArgList(i64 %113, i64 %30, i64 %not231), !1990, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor252, i64 %113, i64 %30, i64 %not231), !1960, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
  %and232 = and i64 %30, %not231, !dbg !2136
    #dbg_value(!DIArgList(i64 %113, i64 %and232), !1990, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor252, i64 %113, i64 %and232), !1960, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor233 = xor i64 %113, %and232, !dbg !2137
    #dbg_value(i64 %xor233, !1990, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 %xor252, i64 %xor233), !1960, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor253 = xor i64 %xor252, %xor233, !dbg !2138
    #dbg_value(i64 %xor253, !1960, !DIExpression(), !1898)
  %120 = shl i64 %xor253, 1, !dbg !2139
  %121 = lshr i64 %xor253, 63, !dbg !2139
  %122 = or i64 %120, %121, !dbg !2139
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor245, i64 %122), !1974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %92, i64 %xor245, i64 %xor62, i64 %89, i64 %122), !1969, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %104, i64 %xor245, i64 %68, i64 %101, i64 %122), !1979, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %110, i64 %xor245, i64 %77, i64 %107, i64 %122), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %36, i64 %xor245, i64 %86, i64 %113, i64 %122), !1989, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor245, i64 %122), !1964, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor269 = xor i64 %xor245, %122, !dbg !2140
    #dbg_value(!DIArgList(i64 %xor125, i64 %xor269), !1974, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %92, i64 %xor269, i64 %xor62, i64 %89), !1969, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %104, i64 %xor269, i64 %68, i64 %101), !1979, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %110, i64 %xor269, i64 %77, i64 %107), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %36, i64 %xor269, i64 %86, i64 %113), !1989, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 %xor269, !1964, !DIExpression(), !1898)
  %xor417 = xor i64 %xor125, %xor269, !dbg !2141
    #dbg_value(i64 %xor417, !1974, !DIExpression(), !1898)
  %123 = shl i64 %xor417, 55, !dbg !2142
  %124 = lshr i64 %xor417, 9, !dbg !2142
  %125 = or i64 %123, %124, !dbg !2142
    #dbg_value(i64 %125, !1957, !DIExpression(), !1898)
  %not82 = xor i64 %48, -1, !dbg !2143
    #dbg_value(!DIArgList(i64 %54, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71, i64 %65, i64 %98, i64 %62, i64 %92, i64 %not82), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %54, i64 %xor261, i64 %92, i64 %not82), !1967, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %and83 = and i64 %92, %not82, !dbg !2144
    #dbg_value(!DIArgList(i64 %54, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71, i64 %65, i64 %98, i64 %62, i64 %and83), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %54, i64 %xor261, i64 %and83), !1967, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor84 = xor i64 %54, %and83, !dbg !2145
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71, i64 %65, i64 %98, i64 %62), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor261), !1967, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %not117 = xor i64 %62, -1, !dbg !2146
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71, i64 %65, i64 %98, i64 %not117), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_LLVM_arg, 10, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %65, i64 %xor261, i64 %98, i64 %not117), !1972, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %and118 = and i64 %98, %not117, !dbg !2147
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71, i64 %65, i64 %and118), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %65, i64 %xor261, i64 %and118), !1972, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor119 = xor i64 %65, %and118, !dbg !2148
    #dbg_value(!DIArgList(i64 %xor84, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71, i64 %xor119), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor119, i64 %xor261), !1972, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor238 = xor i64 %xor84, %xor119, !dbg !2149
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %71), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %not152 = xor i64 %71, -1, !dbg !2150
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %104, i64 %not152), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_LLVM_arg, 7, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %74, i64 %xor261, i64 %104, i64 %not152), !1977, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %and153 = and i64 %104, %not152, !dbg !2151
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %74, i64 %and153), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %74, i64 %xor261, i64 %and153), !1977, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor154 = xor i64 %74, %and153, !dbg !2152
    #dbg_value(!DIArgList(i64 %xor238, i64 %xor224, i64 %83, i64 %110, i64 %80, i64 %xor154), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor154, i64 %xor261), !1977, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor239 = xor i64 %xor238, %xor154, !dbg !2153
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %83, i64 %110, i64 %80), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %not187 = xor i64 %80, -1, !dbg !2154
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %83, i64 %110, i64 %not187), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_LLVM_arg, 4, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %83, i64 %xor261, i64 %110, i64 %not187), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %and188 = and i64 %110, %not187, !dbg !2155
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %83, i64 %and188), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %83, i64 %xor261, i64 %and188), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor189 = xor i64 %83, %and188, !dbg !2156
    #dbg_value(!DIArgList(i64 %xor239, i64 %xor224, i64 %xor189), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor189, i64 %xor261), !1982, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor240 = xor i64 %xor239, %xor189, !dbg !2157
    #dbg_value(!DIArgList(i64 %xor240, i64 %xor224), !1957, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor241 = xor i64 %xor240, %xor224, !dbg !2158
    #dbg_value(i64 %xor241, !1957, !DIExpression(), !1898)
  %not88 = xor i64 %89, -1, !dbg !2159
    #dbg_value(!DIArgList(i64 %92, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101, i64 %xor125, i64 %xor62, i64 %not88), !1959, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_LLVM_arg, 12, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %92, i64 %xor269, i64 %xor62, i64 %not88), !1969, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %and89 = and i64 %xor62, %not88, !dbg !2160
    #dbg_value(!DIArgList(i64 %92, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101, i64 %xor125, i64 %and89), !1959, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 11, DW_OP_xor, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %92, i64 %xor269, i64 %and89), !1969, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor90 = xor i64 %92, %and89, !dbg !2161
    #dbg_value(!DIArgList(i64 %xor90, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101, i64 %xor125), !1959, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 10, DW_OP_xor, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor90, i64 %xor269), !1969, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor246 = xor i64 %xor90, %xor125, !dbg !2162
    #dbg_value(!DIArgList(i64 %xor246, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %101), !1959, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
  %not158 = xor i64 %101, -1, !dbg !2163
    #dbg_value(!DIArgList(i64 %xor246, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %68, i64 %not158), !1959, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_LLVM_arg, 9, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %104, i64 %xor269, i64 %68, i64 %not158), !1979, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %and159 = and i64 %68, %not158, !dbg !2164
    #dbg_value(!DIArgList(i64 %xor246, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %104, i64 %and159), !1959, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_LLVM_arg, 8, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %104, i64 %xor269, i64 %and159), !1979, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor160 = xor i64 %104, %and159, !dbg !2165
    #dbg_value(!DIArgList(i64 %xor246, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107, i64 %xor160), !1959, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 7, DW_OP_xor, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor160, i64 %xor269), !1979, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor247 = xor i64 %xor246, %xor160, !dbg !2166
    #dbg_value(!DIArgList(i64 %xor247, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %107), !1959, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
  %not193 = xor i64 %107, -1, !dbg !2167
    #dbg_value(!DIArgList(i64 %xor247, i64 %36, i64 %86, i64 %113, i64 %110, i64 %77, i64 %not193), !1959, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_LLVM_arg, 6, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %110, i64 %xor269, i64 %77, i64 %not193), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %and194 = and i64 %77, %not193, !dbg !2168
    #dbg_value(!DIArgList(i64 %xor247, i64 %36, i64 %86, i64 %113, i64 %110, i64 %and194), !1959, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_LLVM_arg, 5, DW_OP_xor, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %110, i64 %xor269, i64 %and194), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor195 = xor i64 %110, %and194, !dbg !2169
    #dbg_value(!DIArgList(i64 %xor247, i64 %36, i64 %86, i64 %113, i64 %xor195), !1959, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 4, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor195, i64 %xor269), !1984, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor248 = xor i64 %xor247, %xor195, !dbg !2170
    #dbg_value(!DIArgList(i64 %xor248, i64 %36, i64 %86, i64 %113), !1959, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
  %not228 = xor i64 %113, -1, !dbg !2171
    #dbg_value(!DIArgList(i64 %xor248, i64 %36, i64 %86, i64 %not228), !1959, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %36, i64 %xor269, i64 %86, i64 %not228), !1989, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %and229 = and i64 %86, %not228, !dbg !2172
    #dbg_value(!DIArgList(i64 %xor248, i64 %36, i64 %and229), !1959, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %36, i64 %xor269, i64 %and229), !1989, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor230 = xor i64 %36, %and229, !dbg !2173
    #dbg_value(!DIArgList(i64 %xor248, i64 %xor230), !1959, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor230, i64 %xor269), !1989, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor249 = xor i64 %xor248, %xor230, !dbg !2174
    #dbg_value(i64 %xor249, !1959, !DIExpression(), !1898)
  %126 = shl i64 %xor249, 1, !dbg !2175
  %127 = lshr i64 %xor249, 63, !dbg !2175
  %128 = or i64 %126, %127, !dbg !2175
    #dbg_value(!DIArgList(i64 %xor241, i64 %128), !1963, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor241, i64 %128), !1968, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor241, i64 %128), !1983, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor241, i64 %128), !1973, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor241, i64 %128), !1988, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor241, i64 %128), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor265 = xor i64 %xor241, %128, !dbg !2176
    #dbg_value(i64 %xor265, !1963, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 %xor87, i64 %xor265), !1968, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor192, i64 %xor265), !1983, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor122, i64 %xor265), !1973, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor227, i64 %xor265), !1988, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor157, i64 %xor265), !1978, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor413 = xor i64 %xor87, %xor265, !dbg !2177
    #dbg_value(i64 %xor413, !1968, !DIExpression(), !1898)
  %129 = shl i64 %xor413, 62, !dbg !2178
  %130 = lshr i64 %xor413, 2, !dbg !2178
  %131 = or i64 %129, %130, !dbg !2178
    #dbg_value(i64 %131, !1956, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 %119, i64 %125, i64 %131), !1948, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %not445 = xor i64 %131, -1, !dbg !2179
    #dbg_value(!DIArgList(i64 %119, i64 %125, i64 %not445), !1948, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %and446 = and i64 %125, %not445, !dbg !2180
    #dbg_value(!DIArgList(i64 %119, i64 %and446), !1948, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor447 = xor i64 %119, %and446, !dbg !2181
    #dbg_value(i64 %xor447, !1948, !DIExpression(), !1898)
  %132 = shl i64 %xor241, 1, !dbg !2182
  %133 = lshr i64 %xor241, 63, !dbg !2182
  %134 = or i64 %132, %133, !dbg !2182
    #dbg_value(!DIArgList(i64 %xor253, i64 %134), !1961, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor253, i64 %134), !1971, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor253, i64 %134), !1986, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor253, i64 %134), !1976, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %134), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor253, i64 %134), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor253, i64 %134), !1981, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor257 = xor i64 %xor253, %134, !dbg !2183
    #dbg_value(i64 %xor257, !1961, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 %xor116, i64 %xor257), !1971, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor221, i64 %xor257), !1986, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor151, i64 %xor257), !1976, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !1956, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor81, i64 %xor257), !1966, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor186, i64 %xor257), !1981, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor425 = xor i64 %xor186, %xor257, !dbg !2184
    #dbg_value(i64 %xor425, !1981, !DIExpression(), !1898)
  %135 = shl i64 %xor425, 41, !dbg !2185
  %136 = lshr i64 %xor425, 23, !dbg !2185
  %137 = or i64 %135, %136, !dbg !2185
    #dbg_value(i64 %137, !1959, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 %137, i64 %131, i64 %119), !1946, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %not442 = xor i64 %119, -1, !dbg !2186
    #dbg_value(!DIArgList(i64 %137, i64 %131, i64 %not442), !1946, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %and443 = and i64 %131, %not442, !dbg !2187
    #dbg_value(!DIArgList(i64 %137, i64 %and443), !1946, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor444 = xor i64 %137, %and443, !dbg !2188
    #dbg_value(i64 %xor444, !1946, !DIExpression(), !1898)
  %138 = shl i64 %xor237, 1, !dbg !2189
  %139 = lshr i64 %xor237, 63, !dbg !2189
  %140 = or i64 %138, %139, !dbg !2189
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor249, i64 %140), !1970, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor249, i64 %140), !1985, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor249, i64 %140), !1975, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor249, i64 %140), !1990, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor249, i64 %140), !1965, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor249, i64 %140), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor273 = xor i64 %xor249, %140, !dbg !2190
    #dbg_value(!DIArgList(i64 %xor93, i64 %xor273), !1970, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor198, i64 %xor273), !1985, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor128, i64 %xor273), !1975, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor233, i64 %xor273), !1990, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(i64 %xor273, !1965, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 %xor163, i64 %xor273), !1980, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor421 = xor i64 %xor163, %xor273, !dbg !2191
    #dbg_value(i64 %xor421, !1980, !DIExpression(), !1898)
  %141 = shl i64 %xor421, 39, !dbg !2192
  %142 = lshr i64 %xor421, 25, !dbg !2192
  %143 = or i64 %141, %142, !dbg !2192
    #dbg_value(i64 %143, !1958, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 %143, i64 %119, i64 %137), !1944, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %125, i64 %137, i64 %143), !1942, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %131, i64 %143, i64 %125), !1940, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %not439 = xor i64 %137, -1, !dbg !2193
    #dbg_value(!DIArgList(i64 %143, i64 %119, i64 %not439), !1944, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %and440 = and i64 %119, %not439, !dbg !2194
    #dbg_value(!DIArgList(i64 %143, i64 %and440), !1944, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor441 = xor i64 %143, %and440, !dbg !2195
    #dbg_value(i64 %xor441, !1944, !DIExpression(), !1898)
  %not436 = xor i64 %143, -1, !dbg !2196
    #dbg_value(!DIArgList(i64 %125, i64 %137, i64 %not436), !1942, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %and437 = and i64 %137, %not436, !dbg !2197
    #dbg_value(!DIArgList(i64 %125, i64 %and437), !1942, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor438 = xor i64 %125, %and437, !dbg !2198
    #dbg_value(i64 %xor438, !1942, !DIExpression(), !1898)
  %not433 = xor i64 %125, -1, !dbg !2199
    #dbg_value(!DIArgList(i64 %131, i64 %143, i64 %not433), !1940, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %and434 = and i64 %143, %not433, !dbg !2200
    #dbg_value(!DIArgList(i64 %131, i64 %and434), !1940, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor435 = xor i64 %131, %and434, !dbg !2201
    #dbg_value(i64 %xor435, !1940, !DIExpression(), !1898)
  %xor394 = xor i64 %xor230, %xor269, !dbg !2202
    #dbg_value(i64 %xor394, !1989, !DIExpression(), !1898)
  %144 = shl i64 %xor394, 56, !dbg !2203
  %145 = lshr i64 %xor394, 8, !dbg !2203
  %146 = or i64 %144, %145, !dbg !2203
    #dbg_value(i64 %146, !1960, !DIExpression(), !1898)
  %xor382 = xor i64 %xor116, %xor257, !dbg !2204
    #dbg_value(i64 %xor382, !1971, !DIExpression(), !1898)
  %147 = shl i64 %xor382, 36, !dbg !2205
  %148 = lshr i64 %xor382, 28, !dbg !2205
  %149 = or i64 %147, %148, !dbg !2205
    #dbg_value(i64 %149, !1957, !DIExpression(), !1898)
  %xor378 = xor i64 %xor93, %xor273, !dbg !2206
    #dbg_value(i64 %xor378, !1970, !DIExpression(), !1898)
  %150 = shl i64 %xor378, 27, !dbg !2207
  %151 = lshr i64 %xor378, 37, !dbg !2207
  %152 = or i64 %150, %151, !dbg !2207
    #dbg_value(i64 %152, !1956, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 %146, i64 %149, i64 %152), !1938, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %not410 = xor i64 %152, -1, !dbg !2208
    #dbg_value(!DIArgList(i64 %146, i64 %149, i64 %not410), !1938, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %and411 = and i64 %149, %not410, !dbg !2209
    #dbg_value(!DIArgList(i64 %146, i64 %and411), !1938, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor412 = xor i64 %146, %and411, !dbg !2210
    #dbg_value(i64 %xor412, !1938, !DIExpression(), !1898)
  %xor390 = xor i64 %xor192, %xor265, !dbg !2211
    #dbg_value(i64 %xor390, !1983, !DIExpression(), !1898)
  %153 = shl i64 %xor390, 15, !dbg !2212
  %154 = lshr i64 %xor390, 49, !dbg !2212
  %155 = or i64 %153, %154, !dbg !2212
    #dbg_value(i64 %155, !1959, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 %155, i64 %152, i64 %146), !1936, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %not407 = xor i64 %146, -1, !dbg !2213
    #dbg_value(!DIArgList(i64 %155, i64 %152, i64 %not407), !1936, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %and408 = and i64 %152, %not407, !dbg !2214
    #dbg_value(!DIArgList(i64 %155, i64 %and408), !1936, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor409 = xor i64 %155, %and408, !dbg !2215
    #dbg_value(i64 %xor409, !1936, !DIExpression(), !1898)
  %xor386 = xor i64 %xor154, %xor261, !dbg !2216
    #dbg_value(i64 %xor386, !1977, !DIExpression(), !1898)
  %156 = shl i64 %xor386, 10, !dbg !2217
  %157 = lshr i64 %xor386, 54, !dbg !2217
  %158 = or i64 %156, %157, !dbg !2217
    #dbg_value(i64 %158, !1958, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 %158, i64 %146, i64 %155), !1934, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %149, i64 %155, i64 %158), !1932, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %152, i64 %158, i64 %149), !1930, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %not404 = xor i64 %155, -1, !dbg !2218
    #dbg_value(!DIArgList(i64 %158, i64 %146, i64 %not404), !1934, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %and405 = and i64 %146, %not404, !dbg !2219
    #dbg_value(!DIArgList(i64 %158, i64 %and405), !1934, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor406 = xor i64 %158, %and405, !dbg !2220
    #dbg_value(i64 %xor406, !1934, !DIExpression(), !1898)
  %not401 = xor i64 %158, -1, !dbg !2221
    #dbg_value(!DIArgList(i64 %149, i64 %155, i64 %not401), !1932, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %and402 = and i64 %155, %not401, !dbg !2222
    #dbg_value(!DIArgList(i64 %149, i64 %and402), !1932, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor403 = xor i64 %149, %and402, !dbg !2223
    #dbg_value(i64 %xor403, !1932, !DIExpression(), !1898)
  %not398 = xor i64 %149, -1, !dbg !2224
    #dbg_value(!DIArgList(i64 %152, i64 %158, i64 %not398), !1930, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %and399 = and i64 %158, %not398, !dbg !2225
    #dbg_value(!DIArgList(i64 %152, i64 %and399), !1930, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor400 = xor i64 %152, %and399, !dbg !2226
    #dbg_value(i64 %xor400, !1930, !DIExpression(), !1898)
  %xor359 = xor i64 %xor221, %xor257, !dbg !2227
    #dbg_value(i64 %xor359, !1986, !DIExpression(), !1898)
  %159 = shl i64 %xor359, 18, !dbg !2228
  %160 = lshr i64 %xor359, 46, !dbg !2228
  %161 = or i64 %159, %160, !dbg !2228
    #dbg_value(i64 %161, !1960, !DIExpression(), !1898)
  %xor347 = xor i64 %xor122, %xor265, !dbg !2229
    #dbg_value(i64 %xor347, !1973, !DIExpression(), !1898)
  %162 = shl i64 %xor347, 6, !dbg !2230
  %163 = lshr i64 %xor347, 58, !dbg !2230
  %164 = or i64 %162, %163, !dbg !2230
    #dbg_value(i64 %164, !1957, !DIExpression(), !1898)
  %xor343 = xor i64 %xor84, %xor261, !dbg !2231
    #dbg_value(i64 %xor343, !1967, !DIExpression(), !1898)
  %165 = shl i64 %xor343, 1, !dbg !2232
  %166 = lshr i64 %xor343, 63, !dbg !2232
  %167 = or i64 %165, %166, !dbg !2232
    #dbg_value(i64 %167, !1956, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 %161, i64 %164, i64 %167), !1928, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %not375 = xor i64 %167, -1, !dbg !2233
    #dbg_value(!DIArgList(i64 %161, i64 %164, i64 %not375), !1928, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %and376 = and i64 %164, %not375, !dbg !2234
    #dbg_value(!DIArgList(i64 %161, i64 %and376), !1928, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor377 = xor i64 %161, %and376, !dbg !2235
    #dbg_value(i64 %xor377, !1928, !DIExpression(), !1898)
  %xor355 = xor i64 %xor198, %xor273, !dbg !2236
    #dbg_value(i64 %xor355, !1985, !DIExpression(), !1898)
  %168 = shl i64 %xor355, 8, !dbg !2237
  %169 = lshr i64 %xor355, 56, !dbg !2237
  %170 = or i64 %168, %169, !dbg !2237
    #dbg_value(i64 %170, !1959, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 %170, i64 %167, i64 %161), !1926, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %not372 = xor i64 %161, -1, !dbg !2238
    #dbg_value(!DIArgList(i64 %170, i64 %167, i64 %not372), !1926, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %and373 = and i64 %167, %not372, !dbg !2239
    #dbg_value(!DIArgList(i64 %170, i64 %and373), !1926, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor374 = xor i64 %170, %and373, !dbg !2240
    #dbg_value(i64 %xor374, !1926, !DIExpression(), !1898)
  %xor351 = xor i64 %xor160, %xor269, !dbg !2241
    #dbg_value(i64 %xor351, !1979, !DIExpression(), !1898)
  %171 = shl i64 %xor351, 25, !dbg !2242
  %172 = lshr i64 %xor351, 39, !dbg !2242
  %173 = or i64 %171, %172, !dbg !2242
    #dbg_value(i64 %173, !1958, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 %173, i64 %161, i64 %170), !1924, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %164, i64 %170, i64 %173), !1922, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %167, i64 %173, i64 %164), !1920, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %not369 = xor i64 %170, -1, !dbg !2243
    #dbg_value(!DIArgList(i64 %173, i64 %161, i64 %not369), !1924, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %and370 = and i64 %161, %not369, !dbg !2244
    #dbg_value(!DIArgList(i64 %173, i64 %and370), !1924, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor371 = xor i64 %173, %and370, !dbg !2245
    #dbg_value(i64 %xor371, !1924, !DIExpression(), !1898)
  %not366 = xor i64 %173, -1, !dbg !2246
    #dbg_value(!DIArgList(i64 %164, i64 %170, i64 %not366), !1922, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %and367 = and i64 %170, %not366, !dbg !2247
    #dbg_value(!DIArgList(i64 %164, i64 %and367), !1922, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor368 = xor i64 %164, %and367, !dbg !2248
    #dbg_value(i64 %xor368, !1922, !DIExpression(), !1898)
  %not363 = xor i64 %164, -1, !dbg !2249
    #dbg_value(!DIArgList(i64 %167, i64 %173, i64 %not363), !1920, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %and364 = and i64 %173, %not363, !dbg !2250
    #dbg_value(!DIArgList(i64 %167, i64 %and364), !1920, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor365 = xor i64 %167, %and364, !dbg !2251
    #dbg_value(i64 %xor365, !1920, !DIExpression(), !1898)
  %xor324 = xor i64 %xor227, %xor265, !dbg !2252
    #dbg_value(i64 %xor324, !1988, !DIExpression(), !1898)
  %174 = shl i64 %xor324, 61, !dbg !2253
  %175 = lshr i64 %xor324, 3, !dbg !2253
  %176 = or i64 %174, %175, !dbg !2253
    #dbg_value(i64 %176, !1960, !DIExpression(), !1898)
  %xor312 = xor i64 %xor128, %xor273, !dbg !2254
    #dbg_value(i64 %xor312, !1975, !DIExpression(), !1898)
  %177 = shl i64 %xor312, 20, !dbg !2255
  %178 = lshr i64 %xor312, 44, !dbg !2255
  %179 = or i64 %177, %178, !dbg !2255
    #dbg_value(i64 %179, !1957, !DIExpression(), !1898)
  %xor308 = xor i64 %xor90, %xor269, !dbg !2256
    #dbg_value(i64 %xor308, !1969, !DIExpression(), !1898)
  %180 = shl i64 %xor308, 28, !dbg !2257
  %181 = lshr i64 %xor308, 36, !dbg !2257
  %182 = or i64 %180, %181, !dbg !2257
    #dbg_value(i64 %182, !1956, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 %176, i64 %179, i64 %182), !1918, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %not340 = xor i64 %182, -1, !dbg !2258
    #dbg_value(!DIArgList(i64 %176, i64 %179, i64 %not340), !1918, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %and341 = and i64 %179, %not340, !dbg !2259
    #dbg_value(!DIArgList(i64 %176, i64 %and341), !1918, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor342 = xor i64 %176, %and341, !dbg !2260
    #dbg_value(i64 %xor342, !1918, !DIExpression(), !1898)
  %xor320 = xor i64 %xor189, %xor261, !dbg !2261
    #dbg_value(i64 %xor320, !1982, !DIExpression(), !1898)
  %183 = shl i64 %xor320, 45, !dbg !2262
  %184 = lshr i64 %xor320, 19, !dbg !2262
  %185 = or i64 %183, %184, !dbg !2262
    #dbg_value(i64 %185, !1959, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 %185, i64 %182, i64 %176), !1916, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %not337 = xor i64 %176, -1, !dbg !2263
    #dbg_value(!DIArgList(i64 %185, i64 %182, i64 %not337), !1916, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %and338 = and i64 %182, %not337, !dbg !2264
    #dbg_value(!DIArgList(i64 %185, i64 %and338), !1916, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor339 = xor i64 %185, %and338, !dbg !2265
    #dbg_value(i64 %xor339, !1916, !DIExpression(), !1898)
  %xor316 = xor i64 %xor151, %xor257, !dbg !2266
    #dbg_value(i64 %xor316, !1976, !DIExpression(), !1898)
  %186 = shl i64 %xor316, 3, !dbg !2267
  %187 = lshr i64 %xor316, 61, !dbg !2267
  %188 = or i64 %186, %187, !dbg !2267
    #dbg_value(i64 %188, !1958, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 %188, i64 %176, i64 %185), !1914, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %179, i64 %185, i64 %188), !1912, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %182, i64 %188, i64 %179), !1910, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %not334 = xor i64 %185, -1, !dbg !2268
    #dbg_value(!DIArgList(i64 %188, i64 %176, i64 %not334), !1914, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %and335 = and i64 %176, %not334, !dbg !2269
    #dbg_value(!DIArgList(i64 %188, i64 %and335), !1914, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor336 = xor i64 %188, %and335, !dbg !2270
    #dbg_value(i64 %xor336, !1914, !DIExpression(), !1898)
  %not331 = xor i64 %188, -1, !dbg !2271
    #dbg_value(!DIArgList(i64 %179, i64 %185, i64 %not331), !1912, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %and332 = and i64 %185, %not331, !dbg !2272
    #dbg_value(!DIArgList(i64 %179, i64 %and332), !1912, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor333 = xor i64 %179, %and332, !dbg !2273
    #dbg_value(i64 %xor333, !1912, !DIExpression(), !1898)
  %not328 = xor i64 %179, -1, !dbg !2274
    #dbg_value(!DIArgList(i64 %182, i64 %188, i64 %not328), !1910, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %and329 = and i64 %188, %not328, !dbg !2275
    #dbg_value(!DIArgList(i64 %182, i64 %and329), !1910, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor330 = xor i64 %182, %and329, !dbg !2276
    #dbg_value(i64 %xor330, !1910, !DIExpression(), !1898)
  %xor287 = xor i64 %xor233, %xor273, !dbg !2277
    #dbg_value(i64 %xor287, !1990, !DIExpression(), !1898)
  %189 = shl i64 %xor287, 14, !dbg !2278
  %190 = lshr i64 %xor287, 50, !dbg !2278
  %191 = or i64 %189, %190, !dbg !2278
    #dbg_value(i64 %191, !1960, !DIExpression(), !1898)
  %xor275 = xor i64 %xor119, %xor261, !dbg !2279
    #dbg_value(i64 %xor275, !1972, !DIExpression(), !1898)
  %192 = shl i64 %xor275, 44, !dbg !2280
  %193 = lshr i64 %xor275, 20, !dbg !2280
  %194 = or i64 %192, %193, !dbg !2280
    #dbg_value(i64 %194, !1957, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 %191, i64 %194, i64 %xor81, i64 %xor257), !1908, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor274 = xor i64 %xor81, %xor257, !dbg !2281
    #dbg_value(i64 %xor274, !1966, !DIExpression(), !1898)
    #dbg_value(i64 %xor274, !1956, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 %191, i64 %194, i64 %xor274), !1908, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %not305 = xor i64 %xor274, -1, !dbg !2282
    #dbg_value(!DIArgList(i64 %191, i64 %194, i64 %not305), !1908, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %and306 = and i64 %194, %not305, !dbg !2283
    #dbg_value(!DIArgList(i64 %191, i64 %and306), !1908, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor307 = xor i64 %191, %and306, !dbg !2284
    #dbg_value(i64 %xor307, !1908, !DIExpression(), !1898)
  %xor283 = xor i64 %xor195, %xor269, !dbg !2285
    #dbg_value(i64 %xor283, !1984, !DIExpression(), !1898)
  %195 = shl i64 %xor283, 21, !dbg !2286
  %196 = lshr i64 %xor283, 43, !dbg !2286
  %197 = or i64 %195, %196, !dbg !2286
    #dbg_value(i64 %197, !1959, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 %197, i64 %xor274, i64 %191), !1906, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %not302 = xor i64 %191, -1, !dbg !2287
    #dbg_value(!DIArgList(i64 %197, i64 %xor274, i64 %not302), !1906, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %and303 = and i64 %xor274, %not302, !dbg !2288
    #dbg_value(!DIArgList(i64 %197, i64 %and303), !1906, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor304 = xor i64 %197, %and303, !dbg !2289
    #dbg_value(i64 %xor304, !1906, !DIExpression(), !1898)
  %xor279 = xor i64 %xor157, %xor265, !dbg !2290
    #dbg_value(i64 %xor279, !1978, !DIExpression(), !1898)
  %198 = shl i64 %xor279, 43, !dbg !2291
  %199 = lshr i64 %xor279, 21, !dbg !2291
  %200 = or i64 %198, %199, !dbg !2291
    #dbg_value(i64 %200, !1958, !DIExpression(), !1898)
    #dbg_value(!DIArgList(i64 %200, i64 %191, i64 %197), !1904, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %194, i64 %197, i64 %200), !1902, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
    #dbg_value(!DIArgList(i64 %xor274, i64 %200, i64 %194), !1900, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %not299 = xor i64 %197, -1, !dbg !2292
    #dbg_value(!DIArgList(i64 %200, i64 %191, i64 %not299), !1904, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %and300 = and i64 %191, %not299, !dbg !2293
    #dbg_value(!DIArgList(i64 %200, i64 %and300), !1904, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor301 = xor i64 %200, %and300, !dbg !2294
    #dbg_value(i64 %xor301, !1904, !DIExpression(), !1898)
  %not296 = xor i64 %200, -1, !dbg !2295
    #dbg_value(!DIArgList(i64 %194, i64 %197, i64 %not296), !1902, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_and, DW_OP_xor, DW_OP_stack_value), !1898)
  %and297 = and i64 %197, %not296, !dbg !2296
    #dbg_value(!DIArgList(i64 %194, i64 %and297), !1902, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %xor298 = xor i64 %194, %and297, !dbg !2297
    #dbg_value(i64 %xor298, !1902, !DIExpression(), !1898)
  %add = or disjoint i32 %round.0, 1, !dbg !2298
  %arrayidx294 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %add, !dbg !2299
  %201 = load i64, ptr %arrayidx294, align 8, !dbg !2299
    #dbg_value(!DIArgList(i64 %xor274, i64 %201, i64 %200, i64 %194), !1900, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %not291 = xor i64 %194, -1, !dbg !2300
    #dbg_value(!DIArgList(i64 %xor274, i64 %201, i64 %200, i64 %not291), !1900, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_and, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %and292 = and i64 %200, %not291, !dbg !2301
    #dbg_value(!DIArgList(i64 %xor274, i64 %201, i64 %and292), !1900, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 2, DW_OP_xor, DW_OP_LLVM_arg, 1, DW_OP_xor, DW_OP_stack_value), !1898)
  %202 = xor i64 %and292, %201, !dbg !2302
  %xor295 = xor i64 %202, %xor274, !dbg !2302
    #dbg_value(i64 %xor295, !1900, !DIExpression(), !1898)
  %add448 = add nuw nsw i32 %round.0, 2, !dbg !2303
    #dbg_value(i32 %add448, !1949, !DIExpression(), !1898)
  br label %for.cond, !dbg !2304, !llvm.loop !2305

for.end:                                          ; preds = %for.cond
  %Aso.0.lcssa = phi i64 [ %Aso.0, %for.cond ], !dbg !1898
  %Asi.0.lcssa = phi i64 [ %Asi.0, %for.cond ], !dbg !1898
  %Ase.0.lcssa = phi i64 [ %Ase.0, %for.cond ], !dbg !1898
  %Asa.0.lcssa = phi i64 [ %Asa.0, %for.cond ], !dbg !1898
  %Amu.0.lcssa = phi i64 [ %Amu.0, %for.cond ], !dbg !1898
  %Amo.0.lcssa = phi i64 [ %Amo.0, %for.cond ], !dbg !1898
  %Ami.0.lcssa = phi i64 [ %Ami.0, %for.cond ], !dbg !1898
  %Ame.0.lcssa = phi i64 [ %Ame.0, %for.cond ], !dbg !1898
  %Ama.0.lcssa = phi i64 [ %Ama.0, %for.cond ], !dbg !1898
  %Aku.0.lcssa = phi i64 [ %Aku.0, %for.cond ], !dbg !1898
  %Ako.0.lcssa = phi i64 [ %Ako.0, %for.cond ], !dbg !1898
  %Aki.0.lcssa = phi i64 [ %Aki.0, %for.cond ], !dbg !1898
  %Ake.0.lcssa = phi i64 [ %Ake.0, %for.cond ], !dbg !1898
  %Aka.0.lcssa = phi i64 [ %Aka.0, %for.cond ], !dbg !1898
  %Agu.0.lcssa = phi i64 [ %Agu.0, %for.cond ], !dbg !1898
  %Ago.0.lcssa = phi i64 [ %Ago.0, %for.cond ], !dbg !1898
  %Agi.0.lcssa = phi i64 [ %Agi.0, %for.cond ], !dbg !1898
  %Age.0.lcssa = phi i64 [ %Age.0, %for.cond ], !dbg !1898
  %Aga.0.lcssa = phi i64 [ %Aga.0, %for.cond ], !dbg !1898
  %Abu.0.lcssa = phi i64 [ %Abu.0, %for.cond ], !dbg !1898
  %Abo.0.lcssa = phi i64 [ %Abo.0, %for.cond ], !dbg !1898
  %Abi.0.lcssa = phi i64 [ %Abi.0, %for.cond ], !dbg !1898
  %Abe.0.lcssa = phi i64 [ %Abe.0, %for.cond ], !dbg !1898
  %Aba.0.lcssa = phi i64 [ %Aba.0, %for.cond ], !dbg !1898
  %Asu.0.lcssa = phi i64 [ %Asu.0, %for.cond ], !dbg !1898
  store i64 %Aba.0.lcssa, ptr %state, align 8, !dbg !2307
  %arrayidx450 = getelementptr inbounds nuw i8, ptr %state, i32 8, !dbg !2308
  store i64 %Abe.0.lcssa, ptr %arrayidx450, align 8, !dbg !2309
  %arrayidx451 = getelementptr inbounds nuw i8, ptr %state, i32 16, !dbg !2310
  store i64 %Abi.0.lcssa, ptr %arrayidx451, align 8, !dbg !2311
  %arrayidx452 = getelementptr inbounds nuw i8, ptr %state, i32 24, !dbg !2312
  store i64 %Abo.0.lcssa, ptr %arrayidx452, align 8, !dbg !2313
  %arrayidx453 = getelementptr inbounds nuw i8, ptr %state, i32 32, !dbg !2314
  store i64 %Abu.0.lcssa, ptr %arrayidx453, align 8, !dbg !2315
  %arrayidx454 = getelementptr inbounds nuw i8, ptr %state, i32 40, !dbg !2316
  store i64 %Aga.0.lcssa, ptr %arrayidx454, align 8, !dbg !2317
  %arrayidx455 = getelementptr inbounds nuw i8, ptr %state, i32 48, !dbg !2318
  store i64 %Age.0.lcssa, ptr %arrayidx455, align 8, !dbg !2319
  %arrayidx456 = getelementptr inbounds nuw i8, ptr %state, i32 56, !dbg !2320
  store i64 %Agi.0.lcssa, ptr %arrayidx456, align 8, !dbg !2321
  %arrayidx457 = getelementptr inbounds nuw i8, ptr %state, i32 64, !dbg !2322
  store i64 %Ago.0.lcssa, ptr %arrayidx457, align 8, !dbg !2323
  %arrayidx458 = getelementptr inbounds nuw i8, ptr %state, i32 72, !dbg !2324
  store i64 %Agu.0.lcssa, ptr %arrayidx458, align 8, !dbg !2325
  %arrayidx459 = getelementptr inbounds nuw i8, ptr %state, i32 80, !dbg !2326
  store i64 %Aka.0.lcssa, ptr %arrayidx459, align 8, !dbg !2327
  %arrayidx460 = getelementptr inbounds nuw i8, ptr %state, i32 88, !dbg !2328
  store i64 %Ake.0.lcssa, ptr %arrayidx460, align 8, !dbg !2329
  %arrayidx461 = getelementptr inbounds nuw i8, ptr %state, i32 96, !dbg !2330
  store i64 %Aki.0.lcssa, ptr %arrayidx461, align 8, !dbg !2331
  %arrayidx462 = getelementptr inbounds nuw i8, ptr %state, i32 104, !dbg !2332
  store i64 %Ako.0.lcssa, ptr %arrayidx462, align 8, !dbg !2333
  %arrayidx463 = getelementptr inbounds nuw i8, ptr %state, i32 112, !dbg !2334
  store i64 %Aku.0.lcssa, ptr %arrayidx463, align 8, !dbg !2335
  %arrayidx464 = getelementptr inbounds nuw i8, ptr %state, i32 120, !dbg !2336
  store i64 %Ama.0.lcssa, ptr %arrayidx464, align 8, !dbg !2337
  %arrayidx465 = getelementptr inbounds nuw i8, ptr %state, i32 128, !dbg !2338
  store i64 %Ame.0.lcssa, ptr %arrayidx465, align 8, !dbg !2339
  %arrayidx466 = getelementptr inbounds nuw i8, ptr %state, i32 136, !dbg !2340
  store i64 %Ami.0.lcssa, ptr %arrayidx466, align 8, !dbg !2341
  %arrayidx467 = getelementptr inbounds nuw i8, ptr %state, i32 144, !dbg !2342
  store i64 %Amo.0.lcssa, ptr %arrayidx467, align 8, !dbg !2343
  %arrayidx468 = getelementptr inbounds nuw i8, ptr %state, i32 152, !dbg !2344
  store i64 %Amu.0.lcssa, ptr %arrayidx468, align 8, !dbg !2345
  %arrayidx469 = getelementptr inbounds nuw i8, ptr %state, i32 160, !dbg !2346
  store i64 %Asa.0.lcssa, ptr %arrayidx469, align 8, !dbg !2347
  %arrayidx470 = getelementptr inbounds nuw i8, ptr %state, i32 168, !dbg !2348
  store i64 %Ase.0.lcssa, ptr %arrayidx470, align 8, !dbg !2349
  %arrayidx471 = getelementptr inbounds nuw i8, ptr %state, i32 176, !dbg !2350
  store i64 %Asi.0.lcssa, ptr %arrayidx471, align 8, !dbg !2351
  %arrayidx472 = getelementptr inbounds nuw i8, ptr %state, i32 184, !dbg !2352
  store i64 %Aso.0.lcssa, ptr %arrayidx472, align 8, !dbg !2353
  %arrayidx473 = getelementptr inbounds nuw i8, ptr %state, i32 192, !dbg !2354
  store i64 %Asu.0.lcssa, ptr %arrayidx473, align 8, !dbg !2355
  ret void, !dbg !2356
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_finalize(ptr noundef %state) local_unnamed_addr #0 !dbg !2357 {
entry:
    #dbg_value(ptr %state, !2358, !DIExpression(), !2359)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2360
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2360
  %conv = trunc i64 %0 to i32, !dbg !2360
  call fastcc void @keccak_finalize(ptr noundef %state, i32 noundef %conv, i32 noundef 168, i8 noundef zeroext 31) #3, !dbg !2361
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2362
  store i64 168, ptr %arrayidx1, align 8, !dbg !2363
  ret void, !dbg !2364
}

; Function Attrs: nounwind
define internal fastcc void @keccak_finalize(ptr noundef %s, i32 noundef %pos, i32 noundef range(i32 136, 169) %r, i8 noundef zeroext %p) unnamed_addr #0 !dbg !2365 {
entry:
    #dbg_value(ptr %s, !2368, !DIExpression(), !2369)
    #dbg_value(i32 %pos, !2370, !DIExpression(), !2369)
    #dbg_value(i32 %r, !2371, !DIExpression(), !2369)
    #dbg_value(i8 31, !2372, !DIExpression(), !2369)
  %rem = shl i32 %pos, 3, !dbg !2373
  %mul = and i32 %rem, 56, !dbg !2373
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2374
  %shl = shl nuw nsw i64 31, %sh_prom, !dbg !2374
  %div2 = lshr i32 %pos, 3, !dbg !2375
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div2, !dbg !2376
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2377
  %xor = xor i64 %0, %shl, !dbg !2377
  store i64 %xor, ptr %arrayidx, align 8, !dbg !2377
  %div13 = lshr i32 %r, 3, !dbg !2378
  %1 = getelementptr i64, ptr %s, i32 %div13, !dbg !2379
  %arrayidx2 = getelementptr i8, ptr %1, i32 -8, !dbg !2379
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !2380
  %xor3 = xor i64 %2, -9223372036854775808, !dbg !2380
  store i64 %xor3, ptr %arrayidx2, align 8, !dbg !2380
  ret void, !dbg !2381
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) local_unnamed_addr #0 !dbg !2382 {
entry:
    #dbg_value(ptr %out, !2385, !DIExpression(), !2386)
    #dbg_value(i32 %outlen, !2387, !DIExpression(), !2386)
    #dbg_value(ptr %state, !2388, !DIExpression(), !2386)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2389
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2389
  %conv = trunc i64 %0 to i32, !dbg !2389
  %call = call fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state, i32 noundef %conv, i32 noundef 168) #3, !dbg !2390
  %conv1 = zext i32 %call to i64, !dbg !2390
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2391
  store i64 %conv1, ptr %arrayidx2, align 8, !dbg !2392
  ret void, !dbg !2393
}

; Function Attrs: nounwind
define internal fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %s, i32 noundef %pos, i32 noundef range(i32 136, 169) %r) unnamed_addr #0 !dbg !2394 {
entry:
    #dbg_value(ptr %out, !2397, !DIExpression(), !2398)
    #dbg_value(i32 %outlen, !2399, !DIExpression(), !2398)
    #dbg_value(ptr %s, !2400, !DIExpression(), !2398)
    #dbg_value(i32 %pos, !2401, !DIExpression(), !2398)
    #dbg_value(i32 %r, !2402, !DIExpression(), !2398)
  br label %while.cond, !dbg !2403

while.cond:                                       ; preds = %for.end, %entry
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ %i.0.lcssa, %for.end ]
  %outlen.addr.0 = phi i32 [ %outlen, %entry ], [ %sub3, %for.end ]
  %out.addr.0 = phi ptr [ %out, %entry ], [ %out.addr.1.lcssa, %for.end ]
    #dbg_value(ptr %out.addr.0, !2397, !DIExpression(), !2398)
    #dbg_value(i32 %outlen.addr.0, !2399, !DIExpression(), !2398)
    #dbg_value(i32 %pos.addr.0, !2401, !DIExpression(), !2398)
  %tobool.not = icmp eq i32 %outlen.addr.0, 0, !dbg !2403
  br i1 %tobool.not, label %while.end, label %while.body, !dbg !2403

while.body:                                       ; preds = %while.cond
  %cmp = icmp eq i32 %pos.addr.0, %r, !dbg !2404
  br i1 %cmp, label %if.then, label %if.end, !dbg !2404

if.then:                                          ; preds = %while.body
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2407
    #dbg_value(i32 0, !2401, !DIExpression(), !2398)
  br label %if.end, !dbg !2409

if.end:                                           ; preds = %if.then, %while.body
  %pos.addr.1 = phi i32 [ 0, %if.then ], [ %pos.addr.0, %while.body ]
    #dbg_value(i32 %pos.addr.1, !2401, !DIExpression(), !2398)
    #dbg_value(i32 %pos.addr.1, !2410, !DIExpression(), !2398)
  br label %for.cond, !dbg !2411

for.cond:                                         ; preds = %for.body, %if.end
  %i.0 = phi i32 [ %pos.addr.1, %if.end ], [ %inc, %for.body ], !dbg !2413
  %out.addr.1 = phi ptr [ %out.addr.0, %if.end ], [ %incdec.ptr, %for.body ]
    #dbg_value(ptr %out.addr.1, !2397, !DIExpression(), !2398)
    #dbg_value(i32 %i.0, !2410, !DIExpression(), !2398)
  %cmp1 = icmp ult i32 %i.0, %r, !dbg !2414
  %add = add i32 %pos.addr.1, %outlen.addr.0, !dbg !2416
  %cmp2 = icmp ult i32 %i.0, %add, !dbg !2416
  %0 = and i1 %cmp1, %cmp2, !dbg !2416
  br i1 %0, label %for.body, label %for.end, !dbg !2417

for.body:                                         ; preds = %for.cond
  %div1 = lshr i32 %i.0, 3, !dbg !2418
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div1, !dbg !2419
  %1 = load i64, ptr %arrayidx, align 8, !dbg !2419
  %rem = shl nuw nsw i32 %i.0, 3, !dbg !2420
  %mul = and i32 %rem, 56, !dbg !2420
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2421
  %shr = lshr i64 %1, %sh_prom, !dbg !2421
  %conv = trunc i64 %shr to i8, !dbg !2419
    #dbg_value(ptr %out.addr.1, !2397, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2398)
  store i8 %conv, ptr %out.addr.1, align 1, !dbg !2422
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %out.addr.1, i32 1, !dbg !2423
    #dbg_value(ptr %incdec.ptr, !2397, !DIExpression(), !2398)
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2424
    #dbg_value(i32 %inc, !2410, !DIExpression(), !2398)
  br label %for.cond, !dbg !2425, !llvm.loop !2426

for.end:                                          ; preds = %for.cond
  %i.0.lcssa = phi i32 [ %i.0, %for.cond ], !dbg !2413
  %out.addr.1.lcssa = phi ptr [ %out.addr.1, %for.cond ]
  %sub.neg = sub i32 %pos.addr.1, %i.0.lcssa, !dbg !2428
  %sub3 = add i32 %sub.neg, %outlen.addr.0, !dbg !2429
    #dbg_value(i32 %sub3, !2399, !DIExpression(), !2398)
    #dbg_value(i32 %i.0.lcssa, !2401, !DIExpression(), !2398)
  br label %while.cond, !dbg !2403, !llvm.loop !2430

while.end:                                        ; preds = %while.cond
  %pos.addr.0.lcssa = phi i32 [ %pos.addr.0, %while.cond ]
  ret i32 %pos.addr.0.lcssa, !dbg !2432
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2433 {
entry:
    #dbg_value(ptr %state, !2434, !DIExpression(), !2435)
    #dbg_value(ptr %in, !2436, !DIExpression(), !2435)
    #dbg_value(i32 %inlen, !2437, !DIExpression(), !2435)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 168, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #3, !dbg !2438
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2439
  store i64 168, ptr %arrayidx, align 8, !dbg !2440
  ret void, !dbg !2441
}

; Function Attrs: nounwind
define internal fastcc void @keccak_absorb_once(ptr noundef %s, i32 noundef range(i32 72, 169) %r, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext range(i8 6, 32) %p) unnamed_addr #0 !dbg !2442 {
entry:
    #dbg_value(ptr %s, !2445, !DIExpression(), !2446)
    #dbg_value(i32 %r, !2447, !DIExpression(), !2446)
    #dbg_value(ptr %in, !2448, !DIExpression(), !2446)
    #dbg_value(i32 %inlen, !2449, !DIExpression(), !2446)
    #dbg_value(i8 %p, !2450, !DIExpression(), !2446)
    #dbg_value(i32 0, !2451, !DIExpression(), !2446)
  br label %for.cond, !dbg !2452

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2454
    #dbg_value(i32 %i.0, !2451, !DIExpression(), !2446)
  %exitcond = icmp ne i32 %i.0, 25, !dbg !2455
  br i1 %exitcond, label %for.body, label %while.cond.preheader, !dbg !2457

while.cond.preheader:                             ; preds = %for.cond
  %0 = lshr i32 %r, 3, !dbg !2458
  br label %while.cond, !dbg !2458

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !2459
  store i64 0, ptr %arrayidx, align 8, !dbg !2460
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2461
    #dbg_value(i32 %inc, !2451, !DIExpression(), !2446)
  br label %for.cond, !dbg !2462, !llvm.loop !2463

while.cond:                                       ; preds = %while.cond.preheader, %for.end8
  %in.addr.0 = phi ptr [ %add.ptr9, %for.end8 ], [ %in, %while.cond.preheader ]
  %inlen.addr.0 = phi i32 [ %sub, %for.end8 ], [ %inlen, %while.cond.preheader ]
    #dbg_value(i32 %inlen.addr.0, !2449, !DIExpression(), !2446)
    #dbg_value(ptr %in.addr.0, !2448, !DIExpression(), !2446)
  %cmp1.not = icmp ult i32 %inlen.addr.0, %r, !dbg !2465
  br i1 %cmp1.not, label %for.cond10.preheader, label %for.cond2.preheader, !dbg !2458

for.cond2.preheader:                              ; preds = %while.cond
  br label %for.cond2, !dbg !2466

for.cond10.preheader:                             ; preds = %while.cond
  %inlen.addr.0.lcssa6 = phi i32 [ %inlen.addr.0, %while.cond ]
  %in.addr.0.lcssa = phi ptr [ %in.addr.0, %while.cond ]
  br label %for.cond10, !dbg !2469

for.cond2:                                        ; preds = %for.cond2.preheader, %for.body4
  %i.1 = phi i32 [ %inc7, %for.body4 ], [ 0, %for.cond2.preheader ], !dbg !2471
    #dbg_value(i32 %i.1, !2451, !DIExpression(), !2446)
  %exitcond5 = icmp ne i32 %i.1, %0, !dbg !2472
  br i1 %exitcond5, label %for.body4, label %for.end8, !dbg !2466

for.body4:                                        ; preds = %for.cond2
  %mul = shl nuw nsw i32 %i.1, 3, !dbg !2474
  %add.ptr = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %mul, !dbg !2475
  %call = call fastcc i64 @load64(ptr noundef %add.ptr) #3, !dbg !2476
  %arrayidx5 = getelementptr inbounds nuw i64, ptr %s, i32 %i.1, !dbg !2477
  %1 = load i64, ptr %arrayidx5, align 8, !dbg !2478
  %xor = xor i64 %1, %call, !dbg !2478
  store i64 %xor, ptr %arrayidx5, align 8, !dbg !2478
  %inc7 = add nuw nsw i32 %i.1, 1, !dbg !2479
    #dbg_value(i32 %inc7, !2451, !DIExpression(), !2446)
  br label %for.cond2, !dbg !2480, !llvm.loop !2481

for.end8:                                         ; preds = %for.cond2
  %add.ptr9 = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %r, !dbg !2483
    #dbg_value(ptr %add.ptr9, !2448, !DIExpression(), !2446)
  %sub = sub i32 %inlen.addr.0, %r, !dbg !2484
    #dbg_value(i32 %sub, !2449, !DIExpression(), !2446)
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2485
  br label %while.cond, !dbg !2458, !llvm.loop !2486

for.cond10:                                       ; preds = %for.cond10.preheader, %for.body12
  %i.2 = phi i32 [ %inc19, %for.body12 ], [ 0, %for.cond10.preheader ], !dbg !2488
    #dbg_value(i32 %i.2, !2451, !DIExpression(), !2446)
  %exitcond7 = icmp ne i32 %i.2, %inlen.addr.0.lcssa6, !dbg !2489
  br i1 %exitcond7, label %for.body12, label %for.end20, !dbg !2469

for.body12:                                       ; preds = %for.cond10
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %in.addr.0.lcssa, i32 %i.2, !dbg !2491
  %2 = load i8, ptr %arrayidx13, align 1, !dbg !2491
  %conv = zext i8 %2 to i64, !dbg !2492
  %rem = shl i32 %i.2, 3, !dbg !2493
  %mul14 = and i32 %rem, 56, !dbg !2493
  %sh_prom = zext nneg i32 %mul14 to i64, !dbg !2494
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !2494
  %div153 = lshr i32 %i.2, 3, !dbg !2495
  %arrayidx16 = getelementptr inbounds nuw i64, ptr %s, i32 %div153, !dbg !2496
  %3 = load i64, ptr %arrayidx16, align 8, !dbg !2497
  %xor17 = xor i64 %3, %shl, !dbg !2497
  store i64 %xor17, ptr %arrayidx16, align 8, !dbg !2497
  %inc19 = add i32 %i.2, 1, !dbg !2498
    #dbg_value(i32 %inc19, !2451, !DIExpression(), !2446)
  br label %for.cond10, !dbg !2499, !llvm.loop !2500

for.end20:                                        ; preds = %for.cond10
  %i.2.lcssa = phi i32 [ %i.2, %for.cond10 ], !dbg !2488
  %conv21 = zext nneg i8 %p to i64, !dbg !2502
  %rem22 = shl i32 %i.2.lcssa, 3, !dbg !2503
  %mul23 = and i32 %rem22, 56, !dbg !2503
  %sh_prom24 = zext nneg i32 %mul23 to i64, !dbg !2504
  %shl25 = shl nuw nsw i64 %conv21, %sh_prom24, !dbg !2504
  %div261 = lshr i32 %i.2.lcssa, 3, !dbg !2505
  %arrayidx27 = getelementptr inbounds nuw i64, ptr %s, i32 %div261, !dbg !2506
  %4 = load i64, ptr %arrayidx27, align 8, !dbg !2507
  %xor28 = xor i64 %4, %shl25, !dbg !2507
  store i64 %xor28, ptr %arrayidx27, align 8, !dbg !2507
  %sub29 = add nsw i32 %r, -1, !dbg !2508
  %div302 = lshr i32 %sub29, 3, !dbg !2509
  %arrayidx31 = getelementptr inbounds nuw i64, ptr %s, i32 %div302, !dbg !2510
  %5 = load i64, ptr %arrayidx31, align 8, !dbg !2511
  %xor32 = xor i64 %5, -9223372036854775808, !dbg !2511
  store i64 %xor32, ptr %arrayidx31, align 8, !dbg !2511
  ret void, !dbg !2512
}

; Function Attrs: nounwind
define internal fastcc i64 @load64(ptr noundef %x) unnamed_addr #0 !dbg !2513 {
entry:
    #dbg_value(ptr %x, !2516, !DIExpression(), !2517)
    #dbg_value(i64 0, !2518, !DIExpression(), !2517)
    #dbg_value(i32 0, !2519, !DIExpression(), !2517)
  br label %for.cond, !dbg !2520

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !2522
  %r.0 = phi i64 [ 0, %entry ], [ %or, %for.inc ], !dbg !2517
    #dbg_value(i64 %r.0, !2518, !DIExpression(), !2517)
    #dbg_value(i32 %i.0, !2519, !DIExpression(), !2517)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !2523
  br i1 %exitcond, label %for.inc, label %for.end, !dbg !2525

for.inc:                                          ; preds = %for.cond
    #dbg_value(!DIArgList(i64 poison, i8 poison, i32 poison), !2518, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2517)
  %arrayidx = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2526
  %0 = load i8, ptr %arrayidx, align 1, !dbg !2526
    #dbg_value(!DIArgList(i64 %r.0, i8 %0, i32 %i.0), !2518, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2517)
  %conv = zext i8 %0 to i64, !dbg !2527
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i32 %i.0), !2518, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_constu, 3, DW_OP_shl, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2517)
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2528
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i32 %mul), !2518, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2517)
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2529
    #dbg_value(!DIArgList(i64 %r.0, i64 %conv, i64 %sh_prom), !2518, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_shl, DW_OP_or, DW_OP_stack_value), !2517)
  %shl = shl nuw i64 %conv, %sh_prom, !dbg !2529
    #dbg_value(!DIArgList(i64 %r.0, i64 %shl), !2518, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value), !2517)
  %or = or i64 %r.0, %shl, !dbg !2530
    #dbg_value(i64 %or, !2518, !DIExpression(), !2517)
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2531
    #dbg_value(i32 %inc, !2519, !DIExpression(), !2517)
  br label %for.cond, !dbg !2532, !llvm.loop !2533

for.end:                                          ; preds = %for.cond
  %r.0.lcssa = phi i64 [ %r.0, %for.cond ], !dbg !2517
  ret i64 %r.0.lcssa, !dbg !2535
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #0 !dbg !2536 {
entry:
    #dbg_value(ptr %out, !2537, !DIExpression(), !2538)
    #dbg_value(i32 %nblocks, !2539, !DIExpression(), !2538)
    #dbg_value(ptr %state, !2540, !DIExpression(), !2538)
  call fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state, i32 noundef 168) #3, !dbg !2541
  ret void, !dbg !2542
}

; Function Attrs: nounwind
define internal fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %s, i32 noundef range(i32 136, 169) %r) unnamed_addr #0 !dbg !2543 {
entry:
    #dbg_value(ptr %out, !2546, !DIExpression(), !2547)
    #dbg_value(i32 %nblocks, !2548, !DIExpression(), !2547)
    #dbg_value(ptr %s, !2549, !DIExpression(), !2547)
    #dbg_value(i32 %r, !2550, !DIExpression(), !2547)
  %0 = lshr i32 %r, 3, !dbg !2551
  br label %while.cond, !dbg !2551

while.cond:                                       ; preds = %for.end, %entry
  %nblocks.addr.0 = phi i32 [ %nblocks, %entry ], [ %sub, %for.end ]
  %out.addr.0 = phi ptr [ %out, %entry ], [ %add.ptr1, %for.end ]
    #dbg_value(ptr %out.addr.0, !2546, !DIExpression(), !2547)
    #dbg_value(i32 %nblocks.addr.0, !2548, !DIExpression(), !2547)
  %tobool.not = icmp eq i32 %nblocks.addr.0, 0, !dbg !2551
  br i1 %tobool.not, label %while.end, label %while.body, !dbg !2551

while.body:                                       ; preds = %while.cond
  call fastcc void @KeccakF1600_StatePermute(ptr noundef %s) #3, !dbg !2552
    #dbg_value(i32 0, !2554, !DIExpression(), !2547)
  br label %for.cond, !dbg !2555

for.cond:                                         ; preds = %for.body, %while.body
  %i.0 = phi i32 [ 0, %while.body ], [ %inc, %for.body ], !dbg !2557
    #dbg_value(i32 %i.0, !2554, !DIExpression(), !2547)
  %exitcond = icmp ne i32 %i.0, %0, !dbg !2558
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2560

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2561
  %add.ptr = getelementptr inbounds nuw i8, ptr %out.addr.0, i32 %mul, !dbg !2562
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !2563
  %1 = load i64, ptr %arrayidx, align 8, !dbg !2563
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %1) #3, !dbg !2564
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2565
    #dbg_value(i32 %inc, !2554, !DIExpression(), !2547)
  br label %for.cond, !dbg !2566, !llvm.loop !2567

for.end:                                          ; preds = %for.cond
  %add.ptr1 = getelementptr inbounds nuw i8, ptr %out.addr.0, i32 %r, !dbg !2569
    #dbg_value(ptr %add.ptr1, !2546, !DIExpression(), !2547)
  %sub = add i32 %nblocks.addr.0, -1, !dbg !2570
    #dbg_value(i32 %sub, !2548, !DIExpression(), !2547)
  br label %while.cond, !dbg !2551, !llvm.loop !2571

while.end:                                        ; preds = %while.cond
  ret void, !dbg !2573
}

; Function Attrs: nounwind
define internal fastcc void @store64(ptr noundef %x, i64 noundef %u) unnamed_addr #0 !dbg !2574 {
entry:
    #dbg_value(ptr %x, !2577, !DIExpression(), !2578)
    #dbg_value(i64 %u, !2579, !DIExpression(), !2578)
    #dbg_value(i32 0, !2580, !DIExpression(), !2578)
  br label %for.cond, !dbg !2581

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2583
    #dbg_value(i32 %i.0, !2580, !DIExpression(), !2578)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !2584
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2586

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2587
  %sh_prom = zext nneg i32 %mul to i64, !dbg !2588
  %shr = lshr i64 %u, %sh_prom, !dbg !2588
  %conv = trunc i64 %shr to i8, !dbg !2589
  %arrayidx = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2590
  store i8 %conv, ptr %arrayidx, align 1, !dbg !2591
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2592
    #dbg_value(i32 %inc, !2580, !DIExpression(), !2578)
  br label %for.cond, !dbg !2593, !llvm.loop !2594

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2596
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef %state) local_unnamed_addr #0 !dbg !2597 {
entry:
    #dbg_value(ptr %state, !2598, !DIExpression(), !2599)
  call fastcc void @keccak_init(ptr noundef %state) #3, !dbg !2600
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2601
  store i64 0, ptr %arrayidx, align 8, !dbg !2602
  ret void, !dbg !2603
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2604 {
entry:
    #dbg_value(ptr %state, !2605, !DIExpression(), !2606)
    #dbg_value(ptr %in, !2607, !DIExpression(), !2606)
    #dbg_value(i32 %inlen, !2608, !DIExpression(), !2606)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2609
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2609
  %conv = trunc i64 %0 to i32, !dbg !2609
  %call = call fastcc i32 @keccak_absorb(ptr noundef %state, i32 noundef %conv, i32 noundef 136, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2610
  %conv1 = zext i32 %call to i64, !dbg !2610
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2611
  store i64 %conv1, ptr %arrayidx2, align 8, !dbg !2612
  ret void, !dbg !2613
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef %state) local_unnamed_addr #0 !dbg !2614 {
entry:
    #dbg_value(ptr %state, !2615, !DIExpression(), !2616)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2617
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2617
  %conv = trunc i64 %0 to i32, !dbg !2617
  call fastcc void @keccak_finalize(ptr noundef %state, i32 noundef %conv, i32 noundef 136, i8 noundef zeroext 31) #3, !dbg !2618
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2619
  store i64 136, ptr %arrayidx1, align 8, !dbg !2620
  ret void, !dbg !2621
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) local_unnamed_addr #0 !dbg !2622 {
entry:
    #dbg_value(ptr %out, !2623, !DIExpression(), !2624)
    #dbg_value(i32 %outlen, !2625, !DIExpression(), !2624)
    #dbg_value(ptr %state, !2626, !DIExpression(), !2624)
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2627
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2627
  %conv = trunc i64 %0 to i32, !dbg !2627
  %call = call fastcc i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state, i32 noundef %conv, i32 noundef 136) #3, !dbg !2628
  %conv1 = zext i32 %call to i64, !dbg !2628
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2629
  store i64 %conv1, ptr %arrayidx2, align 8, !dbg !2630
  ret void, !dbg !2631
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2632 {
entry:
    #dbg_value(ptr %state, !2633, !DIExpression(), !2634)
    #dbg_value(ptr %in, !2635, !DIExpression(), !2634)
    #dbg_value(i32 %inlen, !2636, !DIExpression(), !2634)
  call fastcc void @keccak_absorb_once(ptr noundef %state, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #3, !dbg !2637
  %arrayidx = getelementptr inbounds nuw i8, ptr %state, i32 200, !dbg !2638
  store i64 136, ptr %arrayidx, align 8, !dbg !2639
  ret void, !dbg !2640
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #0 !dbg !2641 {
entry:
    #dbg_value(ptr %out, !2642, !DIExpression(), !2643)
    #dbg_value(i32 %nblocks, !2644, !DIExpression(), !2643)
    #dbg_value(ptr %state, !2645, !DIExpression(), !2643)
  call fastcc void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state, i32 noundef 136) #3, !dbg !2646
  ret void, !dbg !2647
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake128(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2648 {
entry:
  %state = alloca [26 x i64], align 8
    #dbg_value(ptr %out, !2651, !DIExpression(), !2652)
    #dbg_value(i32 %outlen, !2653, !DIExpression(), !2652)
    #dbg_value(ptr %in, !2654, !DIExpression(), !2652)
    #dbg_value(i32 %inlen, !2655, !DIExpression(), !2652)
    #dbg_declare(ptr %state, !2656, !DIExpression(), !2657)
  call void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef nonnull %state, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2658
  %div = udiv i32 %outlen, 168, !dbg !2659
    #dbg_value(i32 %div, !2660, !DIExpression(), !2652)
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %div, ptr noundef nonnull %state) #3, !dbg !2661
  %mul.neg = mul i32 %div, -168, !dbg !2662
  %sub = add i32 %mul.neg, %outlen, !dbg !2663
    #dbg_value(i32 %sub, !2653, !DIExpression(), !2652)
  %mul1 = mul nuw i32 %div, 168, !dbg !2664
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !2665
    #dbg_value(ptr %add.ptr, !2651, !DIExpression(), !2652)
  call void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef nonnull %state) #3, !dbg !2666
  ret void, !dbg !2667
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2668 {
entry:
  %state = alloca [26 x i64], align 8
    #dbg_value(ptr %out, !2669, !DIExpression(), !2670)
    #dbg_value(i32 %outlen, !2671, !DIExpression(), !2670)
    #dbg_value(ptr %in, !2672, !DIExpression(), !2670)
    #dbg_value(i32 %inlen, !2673, !DIExpression(), !2670)
    #dbg_declare(ptr %state, !2674, !DIExpression(), !2675)
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef nonnull %state, ptr noundef %in, i32 noundef %inlen) #3, !dbg !2676
  %div = udiv i32 %outlen, 136, !dbg !2677
    #dbg_value(i32 %div, !2678, !DIExpression(), !2670)
  call void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %div, ptr noundef nonnull %state) #3, !dbg !2679
  %mul.neg = mul i32 %div, -136, !dbg !2680
  %sub = add i32 %mul.neg, %outlen, !dbg !2681
    #dbg_value(i32 %sub, !2671, !DIExpression(), !2670)
  %mul1 = mul nuw i32 %div, 136, !dbg !2682
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !2683
    #dbg_value(ptr %add.ptr, !2669, !DIExpression(), !2670)
  call void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef nonnull %state) #3, !dbg !2684
  ret void, !dbg !2685
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2686 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !2689, !DIExpression(), !2690)
    #dbg_value(ptr %in, !2691, !DIExpression(), !2690)
    #dbg_value(i32 %inlen, !2692, !DIExpression(), !2690)
    #dbg_declare(ptr %s, !2693, !DIExpression(), !2697)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %s, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #3, !dbg !2698
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #3, !dbg !2699
    #dbg_value(i32 0, !2700, !DIExpression(), !2690)
  br label %for.cond, !dbg !2701

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2703
    #dbg_value(i32 %i.0, !2700, !DIExpression(), !2690)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !2704
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2706

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2707
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !2708
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !2709
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2709
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %0) #3, !dbg !2710
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2711
    #dbg_value(i32 %inc, !2700, !DIExpression(), !2690)
  br label %for.cond, !dbg !2712, !llvm.loop !2713

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2715
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) local_unnamed_addr #0 !dbg !2716 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !2717, !DIExpression(), !2718)
    #dbg_value(ptr %in, !2719, !DIExpression(), !2718)
    #dbg_value(i32 %inlen, !2720, !DIExpression(), !2718)
    #dbg_declare(ptr %s, !2721, !DIExpression(), !2722)
  call fastcc void @keccak_absorb_once(ptr noundef nonnull %s, i32 noundef 72, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #3, !dbg !2723
  call fastcc void @KeccakF1600_StatePermute(ptr noundef nonnull %s) #3, !dbg !2724
    #dbg_value(i32 0, !2725, !DIExpression(), !2718)
  br label %for.cond, !dbg !2726

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2728
    #dbg_value(i32 %i.0, !2725, !DIExpression(), !2718)
  %exitcond = icmp ne i32 %i.0, 8, !dbg !2729
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2731

for.body:                                         ; preds = %for.cond
  %mul = shl nuw nsw i32 %i.0, 3, !dbg !2732
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !2733
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !2734
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2734
  call fastcc void @store64(ptr noundef %add.ptr, i64 noundef %0) #3, !dbg !2735
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2736
    #dbg_value(i32 %inc, !2725, !DIExpression(), !2718)
  br label %for.cond, !dbg !2737, !llvm.loop !2738

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2740
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_kyber_shake128_absorb(ptr noundef %state, ptr noundef %seed, i8 noundef zeroext %x, i8 noundef zeroext %y) local_unnamed_addr #0 !dbg !2741 {
entry:
  %extseed = alloca [34 x i8], align 1
    #dbg_value(ptr %state, !2745, !DIExpression(), !2746)
    #dbg_value(ptr %seed, !2747, !DIExpression(), !2746)
    #dbg_value(i8 %x, !2748, !DIExpression(), !2746)
    #dbg_value(i8 %y, !2749, !DIExpression(), !2746)
    #dbg_declare(ptr %extseed, !2750, !DIExpression(), !2754)
  %call = call ptr @memcpy(ptr noundef nonnull %extseed, ptr noundef %seed, i32 noundef 32) #4, !dbg !2755
  %arrayidx = getelementptr inbounds nuw i8, ptr %extseed, i32 32, !dbg !2756
  store i8 %x, ptr %arrayidx, align 1, !dbg !2757
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %extseed, i32 33, !dbg !2758
  store i8 %y, ptr %arrayidx1, align 1, !dbg !2759
  call void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef nonnull %extseed, i32 noundef 34) #3, !dbg !2760
  ret void, !dbg !2761
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_kyber_shake256_prf(ptr noundef %out, i32 noundef %outlen, ptr noundef %key, i8 noundef zeroext %nonce) local_unnamed_addr #0 !dbg !2762 {
entry:
  %extkey = alloca [33 x i8], align 1
    #dbg_value(ptr %out, !2765, !DIExpression(), !2766)
    #dbg_value(i32 %outlen, !2767, !DIExpression(), !2766)
    #dbg_value(ptr %key, !2768, !DIExpression(), !2766)
    #dbg_value(i8 %nonce, !2769, !DIExpression(), !2766)
    #dbg_declare(ptr %extkey, !2770, !DIExpression(), !2774)
  %call = call ptr @memcpy(ptr noundef nonnull %extkey, ptr noundef %key, i32 noundef 32) #4, !dbg !2775
  %arrayidx = getelementptr inbounds nuw i8, ptr %extkey, i32 32, !dbg !2776
  store i8 %nonce, ptr %arrayidx, align 1, !dbg !2777
  call void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef nonnull %extkey, i32 noundef 33) #3, !dbg !2778
  ret void, !dbg !2779
}

; Function Attrs: nounwind
define dso_local void @pqcrystals_kyber768_ref_kyber_shake256_rkprf(ptr noundef %out, ptr noundef %key, ptr noundef %input) local_unnamed_addr #0 !dbg !2780 {
entry:
  %s = alloca [26 x i64], align 8
    #dbg_value(ptr %out, !2781, !DIExpression(), !2782)
    #dbg_value(ptr %key, !2783, !DIExpression(), !2782)
    #dbg_value(ptr %input, !2784, !DIExpression(), !2782)
    #dbg_declare(ptr %s, !2785, !DIExpression(), !2786)
  call void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef nonnull %s) #3, !dbg !2787
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef nonnull %s, ptr noundef %key, i32 noundef 32) #3, !dbg !2788
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef nonnull %s, ptr noundef %input, i32 noundef 1088) #3, !dbg !2789
  call void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef nonnull %s) #3, !dbg !2790
  call void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef 32, ptr noundef nonnull %s) #3, !dbg !2791
  ret void, !dbg !2792
}

; Function Attrs: nounwind
define dso_local void @kyber_memset(ptr noundef %dst, i8 noundef zeroext %val, i32 noundef %len) local_unnamed_addr #0 !dbg !2793 {
entry:
    #dbg_value(ptr %dst, !2798, !DIExpression(), !2799)
    #dbg_value(i8 %val, !2800, !DIExpression(), !2799)
    #dbg_value(i32 %len, !2801, !DIExpression(), !2799)
    #dbg_value(ptr %dst, !2802, !DIExpression(), !2799)
    #dbg_value(i32 0, !2803, !DIExpression(), !2805)
  br label %for.cond, !dbg !2806

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2807
    #dbg_value(i32 %i.0, !2803, !DIExpression(), !2805)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !2808
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2810

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %dst, i32 %i.0, !dbg !2811
  store i8 %val, ptr %arrayidx, align 1, !dbg !2812
  %inc = add i32 %i.0, 1, !dbg !2813
    #dbg_value(i32 %inc, !2803, !DIExpression(), !2805)
  br label %for.cond, !dbg !2814, !llvm.loop !2815

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2817
}

; Function Attrs: nounwind
define dso_local void @kyber_memcpy(ptr noundef %dst, ptr noundef %src, i32 noundef %len) local_unnamed_addr #0 !dbg !2818 {
entry:
    #dbg_value(ptr %dst, !2823, !DIExpression(), !2824)
    #dbg_value(ptr %src, !2825, !DIExpression(), !2824)
    #dbg_value(i32 %len, !2826, !DIExpression(), !2824)
    #dbg_value(ptr %dst, !2827, !DIExpression(), !2824)
    #dbg_value(ptr %src, !2828, !DIExpression(), !2824)
    #dbg_value(i32 0, !2829, !DIExpression(), !2831)
  br label %for.cond, !dbg !2832

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2833
    #dbg_value(i32 %i.0, !2829, !DIExpression(), !2831)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !2834
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2836

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %src, i32 %i.0, !dbg !2837
  %0 = load i8, ptr %arrayidx, align 1, !dbg !2837
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %dst, i32 %i.0, !dbg !2838
  store i8 %0, ptr %arrayidx1, align 1, !dbg !2839
  %inc = add i32 %i.0, 1, !dbg !2840
    #dbg_value(i32 %inc, !2829, !DIExpression(), !2831)
  br label %for.cond, !dbg !2841, !llvm.loop !2842

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2844
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
!111 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 9472, elements: !112)
!112 = !{!113}
!113 = !DISubrange(count: 1184)
!114 = !DILocation(line: 11, column: 11, scope: !109)
!115 = !DILocalVariable(name: "sk", scope: !109, file: !83, line: 12, type: !116)
!116 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 19200, elements: !117)
!117 = !{!118}
!118 = !DISubrange(count: 2400)
!119 = !DILocation(line: 12, column: 11, scope: !109)
!120 = !DILocalVariable(name: "ct", scope: !109, file: !83, line: 13, type: !121)
!121 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 8704, elements: !122)
!122 = !{!123}
!123 = !DISubrange(count: 1088)
!124 = !DILocation(line: 13, column: 11, scope: !109)
!125 = !DILocalVariable(name: "key_a", scope: !109, file: !83, line: 14, type: !126)
!126 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 256, elements: !127)
!127 = !{!128}
!128 = !DISubrange(count: 32)
!129 = !DILocation(line: 14, column: 11, scope: !109)
!130 = !DILocalVariable(name: "key_b", scope: !109, file: !83, line: 15, type: !126)
!131 = !DILocation(line: 15, column: 11, scope: !109)
!132 = !DILocation(line: 18, column: 3, scope: !109)
!133 = !DILocation(line: 21, column: 3, scope: !109)
!134 = !DILocation(line: 24, column: 3, scope: !109)
!135 = !DILocation(line: 26, column: 6, scope: !136)
!136 = distinct !DILexicalBlock(scope: !109, file: !83, line: 26, column: 6)
!137 = !DILocation(line: 0, scope: !109)
!138 = !DILocation(line: 32, column: 1, scope: !109)
!139 = distinct !DISubprogram(name: "test_invalid_sk_a", scope: !83, file: !83, line: 34, type: !84, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !54, retainedNodes: !24)
!140 = !DILocalVariable(name: "pk", scope: !139, file: !83, line: 36, type: !111)
!141 = !DILocation(line: 36, column: 11, scope: !139)
!142 = !DILocalVariable(name: "sk", scope: !139, file: !83, line: 37, type: !116)
!143 = !DILocation(line: 37, column: 11, scope: !139)
!144 = !DILocalVariable(name: "ct", scope: !139, file: !83, line: 38, type: !121)
!145 = !DILocation(line: 38, column: 11, scope: !139)
!146 = !DILocalVariable(name: "key_a", scope: !139, file: !83, line: 39, type: !126)
!147 = !DILocation(line: 39, column: 11, scope: !139)
!148 = !DILocalVariable(name: "key_b", scope: !139, file: !83, line: 40, type: !126)
!149 = !DILocation(line: 40, column: 11, scope: !139)
!150 = !DILocation(line: 43, column: 3, scope: !139)
!151 = !DILocation(line: 46, column: 3, scope: !139)
!152 = !DILocation(line: 49, column: 3, scope: !139)
!153 = !DILocation(line: 52, column: 3, scope: !139)
!154 = !DILocation(line: 54, column: 7, scope: !155)
!155 = distinct !DILexicalBlock(scope: !139, file: !83, line: 54, column: 6)
!156 = !DILocation(line: 0, scope: !139)
!157 = !DILocation(line: 60, column: 1, scope: !139)
!158 = distinct !DISubprogram(name: "test_invalid_ciphertext", scope: !83, file: !83, line: 62, type: !84, scopeLine: 63, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !54, retainedNodes: !24)
!159 = !DILocalVariable(name: "pk", scope: !158, file: !83, line: 64, type: !111)
!160 = !DILocation(line: 64, column: 11, scope: !158)
!161 = !DILocalVariable(name: "sk", scope: !158, file: !83, line: 65, type: !116)
!162 = !DILocation(line: 65, column: 11, scope: !158)
!163 = !DILocalVariable(name: "ct", scope: !158, file: !83, line: 66, type: !121)
!164 = !DILocation(line: 66, column: 11, scope: !158)
!165 = !DILocalVariable(name: "key_a", scope: !158, file: !83, line: 67, type: !126)
!166 = !DILocation(line: 67, column: 11, scope: !158)
!167 = !DILocalVariable(name: "key_b", scope: !158, file: !83, line: 68, type: !126)
!168 = !DILocation(line: 68, column: 11, scope: !158)
!169 = !DILocation(line: 72, column: 3, scope: !158)
!170 = !DILocalVariable(name: "b", scope: !158, file: !83, line: 69, type: !7)
!171 = !DILocation(line: 0, scope: !158)
!172 = !DILocation(line: 73, column: 5, scope: !173)
!173 = distinct !DILexicalBlock(scope: !158, file: !83, line: 72, column: 6)
!174 = !DILocation(line: 74, column: 12, scope: !158)
!175 = !DILocation(line: 74, column: 11, scope: !158)
!176 = !DILocation(line: 74, column: 3, scope: !173)
!177 = distinct !{!177, !169, !178, !107}
!178 = !DILocation(line: 74, column: 13, scope: !158)
!179 = !DILocalVariable(name: "pos", scope: !158, file: !83, line: 70, type: !12)
!180 = !DILocation(line: 75, column: 3, scope: !158)
!181 = !DILocation(line: 78, column: 3, scope: !158)
!182 = !DILocation(line: 81, column: 3, scope: !158)
!183 = !DILocation(line: 84, column: 39, scope: !158)
!184 = !DILocation(line: 84, column: 6, scope: !158)
!185 = !DILocation(line: 84, column: 10, scope: !158)
!186 = !DILocation(line: 84, column: 3, scope: !158)
!187 = !DILocation(line: 84, column: 36, scope: !158)
!188 = !DILocation(line: 87, column: 3, scope: !158)
!189 = !DILocation(line: 89, column: 7, scope: !190)
!190 = distinct !DILexicalBlock(scope: !158, file: !83, line: 89, column: 6)
!191 = !DILocation(line: 95, column: 1, scope: !158)
!192 = !DILocalVariable(name: "out", arg: 1, scope: !2, file: !3, line: 74, type: !6)
!193 = !DILocation(line: 0, scope: !2)
!194 = !DILocalVariable(name: "outlen", arg: 2, scope: !2, file: !3, line: 74, type: !12)
!195 = !DILocation(line: 78, column: 3, scope: !2)
!196 = !DILocation(line: 78, column: 9, scope: !2)
!197 = !DILocation(line: 78, column: 12, scope: !2)
!198 = !DILocation(line: 86, column: 3, scope: !2)
!199 = !DILocation(line: 79, column: 10, scope: !200)
!200 = distinct !DILexicalBlock(scope: !2, file: !3, line: 78, column: 19)
!201 = !DILocation(line: 79, column: 8, scope: !200)
!202 = !DILocation(line: 80, column: 11, scope: !203)
!203 = distinct !DILexicalBlock(scope: !200, file: !3, line: 80, column: 8)
!204 = !DILocation(line: 80, column: 17, scope: !203)
!205 = !DILocation(line: 80, column: 20, scope: !203)
!206 = !DILocation(line: 80, column: 26, scope: !203)
!207 = !DILocation(line: 82, column: 13, scope: !208)
!208 = distinct !DILexicalBlock(scope: !203, file: !3, line: 82, column: 13)
!209 = !DILocation(line: 82, column: 16, scope: !208)
!210 = !DILocation(line: 83, column: 7, scope: !208)
!211 = distinct !{!211, !195, !212, !107}
!212 = !DILocation(line: 84, column: 3, scope: !2)
!213 = !DILocation(line: 86, column: 16, scope: !2)
!214 = !DILocation(line: 87, column: 16, scope: !215)
!215 = distinct !DILexicalBlock(scope: !2, file: !3, line: 86, column: 21)
!216 = !DILocation(line: 87, column: 11, scope: !215)
!217 = !DILocalVariable(name: "ret", scope: !2, file: !3, line: 76, type: !218)
!218 = !DIDerivedType(tag: DW_TAG_typedef, name: "ssize_t", file: !219, line: 182, baseType: !220)
!219 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/sys/types.h", directory: "")
!220 = !DIDerivedType(tag: DW_TAG_typedef, name: "_ssize_t", file: !221, line: 147, baseType: !25)
!221 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/sys/_types.h", directory: "")
!222 = !DILocation(line: 88, column: 18, scope: !223)
!223 = distinct !DILexicalBlock(scope: !215, file: !3, line: 88, column: 8)
!224 = !DILocation(line: 88, column: 21, scope: !223)
!225 = !DILocation(line: 88, column: 27, scope: !223)
!226 = distinct !{!226, !198, !227, !107}
!227 = !DILocation(line: 95, column: 3, scope: !2)
!228 = !DILocation(line: 91, column: 7, scope: !229)
!229 = distinct !DILexicalBlock(scope: !223, file: !3, line: 90, column: 13)
!230 = !DILocation(line: 93, column: 9, scope: !215)
!231 = !DILocation(line: 94, column: 12, scope: !215)
!232 = !DILocation(line: 96, column: 1, scope: !2)
!233 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_keypair_derand", scope: !234, file: !234, line: 25, type: !235, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !24)
!234 = !DIFile(filename: "../../../ref/kem.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!235 = !DISubroutineType(types: !236)
!236 = !{!25, !6, !6, !237}
!237 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !238, size: 32)
!238 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !7)
!239 = !DILocalVariable(name: "pk", arg: 1, scope: !233, file: !234, line: 25, type: !6)
!240 = !DILocation(line: 0, scope: !233)
!241 = !DILocalVariable(name: "sk", arg: 2, scope: !233, file: !234, line: 26, type: !6)
!242 = !DILocalVariable(name: "coins", arg: 3, scope: !233, file: !234, line: 27, type: !237)
!243 = !DILocation(line: 29, column: 3, scope: !233)
!244 = !DILocation(line: 30, column: 12, scope: !233)
!245 = !DILocation(line: 30, column: 3, scope: !233)
!246 = !DILocation(line: 31, column: 3, scope: !233)
!247 = !DILocation(line: 33, column: 33, scope: !233)
!248 = !DILocation(line: 33, column: 55, scope: !233)
!249 = !DILocation(line: 33, column: 3, scope: !233)
!250 = !DILocation(line: 34, column: 3, scope: !233)
!251 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_keypair", scope: !234, file: !234, line: 50, type: !252, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !24)
!252 = !DISubroutineType(types: !253)
!253 = !{!25, !6, !6}
!254 = !DILocalVariable(name: "pk", arg: 1, scope: !251, file: !234, line: 50, type: !6)
!255 = !DILocation(line: 0, scope: !251)
!256 = !DILocalVariable(name: "sk", arg: 2, scope: !251, file: !234, line: 51, type: !6)
!257 = !DILocalVariable(name: "coins", scope: !251, file: !234, line: 53, type: !258)
!258 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 512, elements: !259)
!259 = !{!260}
!260 = !DISubrange(count: 64)
!261 = !DILocation(line: 53, column: 11, scope: !251)
!262 = !DILocation(line: 54, column: 3, scope: !251)
!263 = !DILocation(line: 55, column: 3, scope: !251)
!264 = !DILocation(line: 56, column: 3, scope: !251)
!265 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_enc_derand", scope: !234, file: !234, line: 76, type: !266, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !24)
!266 = !DISubroutineType(types: !267)
!267 = !{!25, !6, !6, !237, !237}
!268 = !DILocalVariable(name: "ct", arg: 1, scope: !265, file: !234, line: 76, type: !6)
!269 = !DILocation(line: 0, scope: !265)
!270 = !DILocalVariable(name: "ss", arg: 2, scope: !265, file: !234, line: 77, type: !6)
!271 = !DILocalVariable(name: "pk", arg: 3, scope: !265, file: !234, line: 78, type: !237)
!272 = !DILocalVariable(name: "coins", arg: 4, scope: !265, file: !234, line: 79, type: !237)
!273 = !DILocalVariable(name: "buf", scope: !265, file: !234, line: 81, type: !258)
!274 = !DILocation(line: 81, column: 11, scope: !265)
!275 = !DILocalVariable(name: "kr", scope: !265, file: !234, line: 83, type: !258)
!276 = !DILocation(line: 83, column: 11, scope: !265)
!277 = !DILocation(line: 85, column: 3, scope: !265)
!278 = !DILocation(line: 88, column: 3, scope: !265)
!279 = !DILocation(line: 89, column: 3, scope: !265)
!280 = !DILocation(line: 92, column: 29, scope: !265)
!281 = !DILocation(line: 92, column: 3, scope: !265)
!282 = !DILocation(line: 94, column: 3, scope: !265)
!283 = !DILocation(line: 95, column: 3, scope: !265)
!284 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_enc", scope: !234, file: !234, line: 113, type: !235, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !24)
!285 = !DILocalVariable(name: "ct", arg: 1, scope: !284, file: !234, line: 113, type: !6)
!286 = !DILocation(line: 0, scope: !284)
!287 = !DILocalVariable(name: "ss", arg: 2, scope: !284, file: !234, line: 114, type: !6)
!288 = !DILocalVariable(name: "pk", arg: 3, scope: !284, file: !234, line: 115, type: !237)
!289 = !DILocalVariable(name: "coins", scope: !284, file: !234, line: 117, type: !126)
!290 = !DILocation(line: 117, column: 11, scope: !284)
!291 = !DILocation(line: 118, column: 3, scope: !284)
!292 = !DILocation(line: 119, column: 3, scope: !284)
!293 = !DILocation(line: 120, column: 3, scope: !284)
!294 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_dec", scope: !234, file: !234, line: 140, type: !295, scopeLine: 143, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !57, retainedNodes: !24)
!295 = !DISubroutineType(types: !296)
!296 = !{!25, !6, !237, !237}
!297 = !DILocalVariable(name: "ss", arg: 1, scope: !294, file: !234, line: 140, type: !6)
!298 = !DILocation(line: 0, scope: !294)
!299 = !DILocalVariable(name: "ct", arg: 2, scope: !294, file: !234, line: 141, type: !237)
!300 = !DILocalVariable(name: "sk", arg: 3, scope: !294, file: !234, line: 142, type: !237)
!301 = !DILocalVariable(name: "buf", scope: !294, file: !234, line: 145, type: !258)
!302 = !DILocation(line: 145, column: 11, scope: !294)
!303 = !DILocalVariable(name: "kr", scope: !294, file: !234, line: 147, type: !258)
!304 = !DILocation(line: 147, column: 11, scope: !294)
!305 = !DILocalVariable(name: "cmp", scope: !294, file: !234, line: 149, type: !121)
!306 = !DILocation(line: 149, column: 11, scope: !294)
!307 = !DILocation(line: 150, column: 25, scope: !294)
!308 = !DILocalVariable(name: "pk", scope: !294, file: !234, line: 150, type: !237)
!309 = !DILocation(line: 152, column: 3, scope: !294)
!310 = !DILocation(line: 155, column: 13, scope: !294)
!311 = !DILocation(line: 155, column: 53, scope: !294)
!312 = !DILocation(line: 155, column: 3, scope: !294)
!313 = !DILocation(line: 156, column: 3, scope: !294)
!314 = !DILocation(line: 159, column: 30, scope: !294)
!315 = !DILocation(line: 159, column: 3, scope: !294)
!316 = !DILocation(line: 161, column: 10, scope: !294)
!317 = !DILocalVariable(name: "fail", scope: !294, file: !234, line: 144, type: !25)
!318 = !DILocation(line: 164, column: 3, scope: !294)
!319 = !DILocation(line: 167, column: 29, scope: !294)
!320 = !DILocation(line: 167, column: 3, scope: !294)
!321 = !DILocation(line: 169, column: 3, scope: !294)
!322 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_gen_matrix", scope: !323, file: !323, line: 165, type: !324, scopeLine: 166, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !58, retainedNodes: !24)
!323 = !DIFile(filename: "../../../ref/indcpa.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!324 = !DISubroutineType(types: !325)
!325 = !{null, !326, !237, !25}
!326 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !327, size: 32)
!327 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyvec", file: !328, line: 8, baseType: !329)
!328 = !DIFile(filename: "../../../ref/polyvec.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!329 = !DICompositeType(tag: DW_TAG_array_type, baseType: !330, size: 12288, elements: !335)
!330 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !331, line: 11, baseType: !332)
!331 = !DIFile(filename: "../../../ref/poly.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!332 = !DICompositeType(tag: DW_TAG_array_type, baseType: !36, size: 4096, elements: !333)
!333 = !{!334}
!334 = !DISubrange(count: 256)
!335 = !{!336}
!336 = !DISubrange(count: 3)
!337 = !DILocalVariable(name: "a", arg: 1, scope: !322, file: !323, line: 165, type: !326)
!338 = !DILocation(line: 0, scope: !322)
!339 = !DILocalVariable(name: "seed", arg: 2, scope: !322, file: !323, line: 165, type: !237)
!340 = !DILocalVariable(name: "transposed", arg: 3, scope: !322, file: !323, line: 166, type: !25)
!341 = !DILocalVariable(name: "buf", scope: !322, file: !323, line: 169, type: !342)
!342 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 4032, elements: !343)
!343 = !{!344}
!344 = !DISubrange(count: 504)
!345 = !DILocation(line: 169, column: 11, scope: !322)
!346 = !DILocalVariable(name: "state", scope: !322, file: !323, line: 170, type: !347)
!347 = !DIDerivedType(tag: DW_TAG_typedef, name: "xof_state", file: !348, line: 10, baseType: !349)
!348 = !DIFile(filename: "../../../ref/symmetric.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!349 = !DIDerivedType(tag: DW_TAG_typedef, name: "keccak_state", file: !350, line: 14, baseType: !351)
!350 = !DIFile(filename: "../../../ref/fips202.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
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
!389 = distinct !{!389, !379, !390, !107}
!390 = !DILocation(line: 187, column: 7, scope: !371)
!391 = !DILocation(line: 173, column: 31, scope: !368)
!392 = !DILocation(line: 173, column: 5, scope: !368)
!393 = distinct !{!393, !362, !394, !107}
!394 = !DILocation(line: 188, column: 5, scope: !363)
!395 = !DILocation(line: 172, column: 29, scope: !360)
!396 = !DILocation(line: 172, column: 3, scope: !360)
!397 = distinct !{!397, !361, !398, !107}
!398 = !DILocation(line: 189, column: 3, scope: !357)
!399 = !DILocation(line: 190, column: 1, scope: !322)
!400 = distinct !DISubprogram(name: "rej_uniform", scope: !323, file: !323, line: 122, type: !401, scopeLine: 123, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !58, retainedNodes: !24)
!401 = !DISubroutineType(types: !402)
!402 = !{!14, !403, !14, !237, !14}
!403 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 32)
!404 = !DILocalVariable(name: "r", arg: 1, scope: !400, file: !323, line: 122, type: !403)
!405 = !DILocation(line: 0, scope: !400)
!406 = !DILocalVariable(name: "len", arg: 2, scope: !400, file: !323, line: 122, type: !14)
!407 = !DILocalVariable(name: "buf", arg: 3, scope: !400, file: !323, line: 123, type: !237)
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
!441 = distinct !{!441, !411, !442, !107}
!442 = !DILocation(line: 137, column: 3, scope: !400)
!443 = !DILocation(line: 139, column: 3, scope: !400)
!444 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_indcpa_keypair_derand", scope: !323, file: !323, line: 205, type: !445, scopeLine: 207, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !58, retainedNodes: !24)
!445 = !DISubroutineType(types: !446)
!446 = !{null, !6, !6, !237}
!447 = !DILocalVariable(name: "pk", arg: 1, scope: !444, file: !323, line: 205, type: !6)
!448 = !DILocation(line: 0, scope: !444)
!449 = !DILocalVariable(name: "sk", arg: 2, scope: !444, file: !323, line: 206, type: !6)
!450 = !DILocalVariable(name: "coins", arg: 3, scope: !444, file: !323, line: 207, type: !237)
!451 = !DILocalVariable(name: "buf", scope: !444, file: !323, line: 209, type: !258)
!452 = !DILocation(line: 209, column: 11, scope: !444)
!453 = !DILocalVariable(name: "publicseed", scope: !444, file: !323, line: 210, type: !237)
!454 = !DILocation(line: 211, column: 34, scope: !444)
!455 = !DILocalVariable(name: "noiseseed", scope: !444, file: !323, line: 211, type: !237)
!456 = !DILocalVariable(name: "nonce", scope: !444, file: !323, line: 212, type: !7)
!457 = !DILocalVariable(name: "a", scope: !444, file: !323, line: 213, type: !458)
!458 = !DICompositeType(tag: DW_TAG_array_type, baseType: !327, size: 36864, elements: !335)
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
!485 = distinct !{!485, !477, !486, !107}
!486 = !DILocation(line: 222, column: 52, scope: !473)
!487 = !DILocation(line: 223, scope: !479)
!488 = !DILocation(line: 223, column: 17, scope: !489)
!489 = distinct !DILexicalBlock(scope: !479, file: !323, line: 223, column: 3)
!490 = !DILocation(line: 224, column: 25, scope: !489)
!491 = !DILocation(line: 224, column: 5, scope: !489)
!492 = !DILocation(line: 224, column: 47, scope: !489)
!493 = !DILocation(line: 223, column: 29, scope: !489)
!494 = !DILocation(line: 223, column: 3, scope: !489)
!495 = distinct !{!495, !478, !496, !107}
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
!513 = distinct !{!513, !504, !514, !107}
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
!530 = !{null, !6, !326, !237}
!531 = !DILocalVariable(name: "r", arg: 1, scope: !528, file: !323, line: 23, type: !6)
!532 = !DILocation(line: 0, scope: !528)
!533 = !DILocalVariable(name: "pk", arg: 2, scope: !528, file: !323, line: 23, type: !326)
!534 = !DILocalVariable(name: "seed", arg: 3, scope: !528, file: !323, line: 24, type: !237)
!535 = !DILocation(line: 25, column: 3, scope: !528)
!536 = !DILocation(line: 26, column: 12, scope: !528)
!537 = !DILocation(line: 26, column: 3, scope: !528)
!538 = !DILocation(line: 27, column: 1, scope: !528)
!539 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_indcpa_enc", scope: !323, file: !323, line: 257, type: !540, scopeLine: 260, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !58, retainedNodes: !24)
!540 = !DISubroutineType(types: !541)
!541 = !{null, !6, !237, !237, !237}
!542 = !DILocalVariable(name: "c", arg: 1, scope: !539, file: !323, line: 257, type: !6)
!543 = !DILocation(line: 0, scope: !539)
!544 = !DILocalVariable(name: "m", arg: 2, scope: !539, file: !323, line: 258, type: !237)
!545 = !DILocalVariable(name: "pk", arg: 3, scope: !539, file: !323, line: 259, type: !237)
!546 = !DILocalVariable(name: "coins", arg: 4, scope: !539, file: !323, line: 260, type: !237)
!547 = !DILocalVariable(name: "seed", scope: !539, file: !323, line: 262, type: !126)
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
!583 = distinct !{!583, !575, !584, !107}
!584 = !DILocation(line: 272, column: 46, scope: !571)
!585 = !DILocation(line: 273, scope: !577)
!586 = !DILocation(line: 273, column: 17, scope: !587)
!587 = distinct !DILexicalBlock(scope: !577, file: !323, line: 273, column: 3)
!588 = !DILocation(line: 274, column: 27, scope: !587)
!589 = !DILocation(line: 274, column: 5, scope: !587)
!590 = !DILocation(line: 274, column: 44, scope: !587)
!591 = !DILocation(line: 273, column: 29, scope: !587)
!592 = !DILocation(line: 273, column: 3, scope: !587)
!593 = distinct !{!593, !576, !594, !107}
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
!608 = distinct !{!608, !602, !609, !107}
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
!622 = !{null, !326, !6, !237}
!623 = !DILocalVariable(name: "pk", arg: 1, scope: !620, file: !323, line: 40, type: !326)
!624 = !DILocation(line: 0, scope: !620)
!625 = !DILocalVariable(name: "seed", arg: 2, scope: !620, file: !323, line: 40, type: !6)
!626 = !DILocalVariable(name: "packedpk", arg: 3, scope: !620, file: !323, line: 41, type: !237)
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
!643 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_indcpa_dec", scope: !323, file: !323, line: 310, type: !644, scopeLine: 312, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !58, retainedNodes: !24)
!644 = !DISubroutineType(types: !645)
!645 = !{null, !6, !237, !237}
!646 = !DILocalVariable(name: "m", arg: 1, scope: !643, file: !323, line: 310, type: !6)
!647 = !DILocation(line: 0, scope: !643)
!648 = !DILocalVariable(name: "c", arg: 2, scope: !643, file: !323, line: 311, type: !237)
!649 = !DILocalVariable(name: "sk", arg: 3, scope: !643, file: !323, line: 312, type: !237)
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
!669 = !{null, !326, !634, !237}
!670 = !DILocalVariable(name: "b", arg: 1, scope: !667, file: !323, line: 101, type: !326)
!671 = !DILocation(line: 0, scope: !667)
!672 = !DILocalVariable(name: "v", arg: 2, scope: !667, file: !323, line: 101, type: !634)
!673 = !DILocalVariable(name: "c", arg: 3, scope: !667, file: !323, line: 102, type: !237)
!674 = !DILocation(line: 103, column: 3, scope: !667)
!675 = !DILocation(line: 104, column: 24, scope: !667)
!676 = !DILocation(line: 104, column: 3, scope: !667)
!677 = !DILocation(line: 105, column: 1, scope: !667)
!678 = distinct !DISubprogram(name: "unpack_sk", scope: !323, file: !323, line: 69, type: !679, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !58, retainedNodes: !24)
!679 = !DISubroutineType(types: !680)
!680 = !{null, !326, !237}
!681 = !DILocalVariable(name: "sk", arg: 1, scope: !678, file: !323, line: 69, type: !326)
!682 = !DILocation(line: 0, scope: !678)
!683 = !DILocalVariable(name: "packedsk", arg: 2, scope: !678, file: !323, line: 70, type: !237)
!684 = !DILocation(line: 71, column: 3, scope: !678)
!685 = !DILocation(line: 72, column: 1, scope: !678)
!686 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_compress", scope: !687, file: !687, line: 15, type: !688, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!687 = !DIFile(filename: "../../../ref/polyvec.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
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
!737 = distinct !{!737, !714, !738, !107}
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
!771 = distinct !{!771, !707, !772, !107}
!772 = !DILocation(line: 74, column: 5, scope: !708)
!773 = !DILocation(line: 53, column: 29, scope: !705)
!774 = !DILocation(line: 53, column: 3, scope: !705)
!775 = distinct !{!775, !706, !776, !107}
!776 = !DILocation(line: 75, column: 3, scope: !702)
!777 = !DILocation(line: 79, column: 1, scope: !686)
!778 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_decompress", scope: !687, file: !687, line: 91, type: !679, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!779 = !DILocalVariable(name: "r", arg: 1, scope: !778, file: !687, line: 91, type: !326)
!780 = !DILocation(line: 0, scope: !778)
!781 = !DILocalVariable(name: "a", arg: 2, scope: !778, file: !687, line: 92, type: !237)
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
!848 = distinct !{!848, !835, !849, !107}
!849 = !DILocation(line: 124, column: 76, scope: !831)
!850 = !DILocation(line: 121, column: 9, scope: !799)
!851 = !DILocation(line: 116, column: 35, scope: !797)
!852 = !DILocation(line: 116, column: 5, scope: !797)
!853 = distinct !{!853, !791, !854, !107}
!854 = !DILocation(line: 125, column: 5, scope: !792)
!855 = !DILocation(line: 115, column: 29, scope: !789)
!856 = !DILocation(line: 115, column: 3, scope: !789)
!857 = distinct !{!857, !790, !858, !107}
!858 = !DILocation(line: 126, column: 3, scope: !786)
!859 = !DILocation(line: 130, column: 1, scope: !778)
!860 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_tobytes", scope: !687, file: !687, line: 141, type: !688, scopeLine: 141, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
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
!877 = distinct !{!877, !870, !878, !107}
!878 = !DILocation(line: 144, column: 51, scope: !866)
!879 = !DILocation(line: 145, column: 1, scope: !860)
!880 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_frombytes", scope: !687, file: !687, line: 157, type: !679, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!881 = !DILocalVariable(name: "r", arg: 1, scope: !880, file: !687, line: 157, type: !326)
!882 = !DILocation(line: 0, scope: !880)
!883 = !DILocalVariable(name: "a", arg: 2, scope: !880, file: !687, line: 157, type: !237)
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
!897 = distinct !{!897, !890, !898, !107}
!898 = !DILocation(line: 160, column: 53, scope: !886)
!899 = !DILocation(line: 161, column: 1, scope: !880)
!900 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_ntt", scope: !687, file: !687, line: 170, type: !901, scopeLine: 170, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
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
!916 = distinct !{!916, !911, !917, !107}
!917 = !DILocation(line: 173, column: 22, scope: !907)
!918 = !DILocation(line: 174, column: 1, scope: !900)
!919 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_invntt_tomont", scope: !687, file: !687, line: 184, type: !901, scopeLine: 184, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
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
!933 = distinct !{!933, !928, !934, !107}
!934 = !DILocation(line: 187, column: 32, scope: !924)
!935 = !DILocation(line: 188, column: 1, scope: !919)
!936 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_basemul_acc_montgomery", scope: !687, file: !687, line: 200, type: !937, scopeLine: 201, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
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
!947 = !DILocation(line: 206, column: 8, scope: !948)
!948 = distinct !DILexicalBlock(scope: !936, file: !687, line: 206, column: 3)
!949 = !DILocation(line: 206, scope: !948)
!950 = !DILocation(line: 206, column: 17, scope: !951)
!951 = distinct !DILexicalBlock(scope: !948, file: !687, line: 206, column: 3)
!952 = !DILocation(line: 206, column: 3, scope: !948)
!953 = !DILocation(line: 207, column: 34, scope: !954)
!954 = distinct !DILexicalBlock(scope: !951, file: !687, line: 206, column: 33)
!955 = !DILocation(line: 207, column: 44, scope: !954)
!956 = !DILocation(line: 207, column: 5, scope: !954)
!957 = !DILocation(line: 208, column: 5, scope: !954)
!958 = !DILocation(line: 206, column: 29, scope: !951)
!959 = !DILocation(line: 206, column: 3, scope: !951)
!960 = distinct !{!960, !952, !961, !107}
!961 = !DILocation(line: 209, column: 3, scope: !948)
!962 = !DILocation(line: 211, column: 3, scope: !936)
!963 = !DILocation(line: 212, column: 1, scope: !936)
!964 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_reduce", scope: !687, file: !687, line: 223, type: !901, scopeLine: 223, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!965 = !DILocalVariable(name: "r", arg: 1, scope: !964, file: !687, line: 223, type: !326)
!966 = !DILocation(line: 0, scope: !964)
!967 = !DILocalVariable(name: "i", scope: !964, file: !687, line: 224, type: !14)
!968 = !DILocation(line: 225, column: 8, scope: !969)
!969 = distinct !DILexicalBlock(scope: !964, file: !687, line: 225, column: 3)
!970 = !DILocation(line: 225, scope: !969)
!971 = !DILocation(line: 225, column: 17, scope: !972)
!972 = distinct !DILexicalBlock(scope: !969, file: !687, line: 225, column: 3)
!973 = !DILocation(line: 225, column: 3, scope: !969)
!974 = !DILocation(line: 226, column: 18, scope: !972)
!975 = !DILocation(line: 226, column: 5, scope: !972)
!976 = !DILocation(line: 225, column: 29, scope: !972)
!977 = !DILocation(line: 225, column: 3, scope: !972)
!978 = distinct !{!978, !973, !979, !107}
!979 = !DILocation(line: 226, column: 25, scope: !969)
!980 = !DILocation(line: 227, column: 1, scope: !964)
!981 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_polyvec_add", scope: !687, file: !687, line: 238, type: !982, scopeLine: 238, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !63, retainedNodes: !24)
!982 = !DISubroutineType(types: !983)
!983 = !{null, !326, !690, !690}
!984 = !DILocalVariable(name: "r", arg: 1, scope: !981, file: !687, line: 238, type: !326)
!985 = !DILocation(line: 0, scope: !981)
!986 = !DILocalVariable(name: "a", arg: 2, scope: !981, file: !687, line: 238, type: !690)
!987 = !DILocalVariable(name: "b", arg: 3, scope: !981, file: !687, line: 238, type: !690)
!988 = !DILocalVariable(name: "i", scope: !981, file: !687, line: 239, type: !14)
!989 = !DILocation(line: 240, column: 8, scope: !990)
!990 = distinct !DILexicalBlock(scope: !981, file: !687, line: 240, column: 3)
!991 = !DILocation(line: 240, scope: !990)
!992 = !DILocation(line: 240, column: 17, scope: !993)
!993 = distinct !DILexicalBlock(scope: !990, file: !687, line: 240, column: 3)
!994 = !DILocation(line: 240, column: 3, scope: !990)
!995 = !DILocation(line: 241, column: 15, scope: !993)
!996 = !DILocation(line: 241, column: 25, scope: !993)
!997 = !DILocation(line: 241, column: 35, scope: !993)
!998 = !DILocation(line: 241, column: 5, scope: !993)
!999 = !DILocation(line: 240, column: 29, scope: !993)
!1000 = !DILocation(line: 240, column: 3, scope: !993)
!1001 = distinct !{!1001, !994, !1002, !107}
!1002 = !DILocation(line: 241, column: 42, scope: !990)
!1003 = !DILocation(line: 242, column: 1, scope: !981)
!1004 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_compress", scope: !1005, file: !1005, line: 19, type: !1006, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1005 = !DIFile(filename: "../../../ref/poly.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!1006 = !DISubroutineType(types: !1007)
!1007 = !{null, !6, !1008}
!1008 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1009, size: 32)
!1009 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !330)
!1010 = !DILocalVariable(name: "r", arg: 1, scope: !1004, file: !1005, line: 19, type: !6)
!1011 = !DILocation(line: 0, scope: !1004)
!1012 = !DILocalVariable(name: "a", arg: 2, scope: !1004, file: !1005, line: 19, type: !1008)
!1013 = !DILocalVariable(name: "t", scope: !1004, file: !1005, line: 23, type: !1014)
!1014 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 64, elements: !1015)
!1015 = !{!1016}
!1016 = !DISubrange(count: 8)
!1017 = !DILocation(line: 23, column: 11, scope: !1004)
!1018 = !DILocalVariable(name: "i", scope: !1004, file: !1005, line: 20, type: !14)
!1019 = !DILocation(line: 27, column: 8, scope: !1020)
!1020 = distinct !DILexicalBlock(scope: !1004, file: !1005, line: 27, column: 3)
!1021 = !DILocation(line: 27, scope: !1020)
!1022 = !DILocation(line: 27, column: 17, scope: !1023)
!1023 = distinct !DILexicalBlock(scope: !1020, file: !1005, line: 27, column: 3)
!1024 = !DILocation(line: 27, column: 3, scope: !1020)
!1025 = !DILocation(line: 28, column: 5, scope: !1026)
!1026 = distinct !DILexicalBlock(scope: !1027, file: !1005, line: 28, column: 5)
!1027 = distinct !DILexicalBlock(scope: !1023, file: !1005, line: 27, column: 37)
!1028 = !DILocation(line: 28, scope: !1026)
!1029 = !DILocalVariable(name: "j", scope: !1004, file: !1005, line: 20, type: !14)
!1030 = !DILocation(line: 28, column: 19, scope: !1031)
!1031 = distinct !DILexicalBlock(scope: !1026, file: !1005, line: 28, column: 5)
!1032 = !DILocation(line: 30, column: 18, scope: !1033)
!1033 = distinct !DILexicalBlock(scope: !1031, file: !1005, line: 28, column: 29)
!1034 = !DILocation(line: 30, column: 22, scope: !1033)
!1035 = !DILocation(line: 30, column: 11, scope: !1033)
!1036 = !DILocalVariable(name: "u", scope: !1004, file: !1005, line: 21, type: !36)
!1037 = !DILocation(line: 31, column: 22, scope: !1033)
!1038 = !DILocation(line: 31, column: 9, scope: !1033)
!1039 = !DILocation(line: 33, column: 12, scope: !1033)
!1040 = !DILocalVariable(name: "d0", scope: !1004, file: !1005, line: 22, type: !65)
!1041 = !DILocation(line: 35, column: 10, scope: !1033)
!1042 = !DILocation(line: 36, column: 10, scope: !1033)
!1043 = !DILocation(line: 37, column: 14, scope: !1033)
!1044 = !DILocation(line: 37, column: 7, scope: !1033)
!1045 = !DILocation(line: 37, column: 12, scope: !1033)
!1046 = !DILocation(line: 28, column: 25, scope: !1031)
!1047 = !DILocation(line: 28, column: 5, scope: !1031)
!1048 = distinct !{!1048, !1025, !1049, !107}
!1049 = !DILocation(line: 38, column: 5, scope: !1026)
!1050 = !DILocation(line: 40, column: 12, scope: !1027)
!1051 = !DILocation(line: 40, column: 20, scope: !1027)
!1052 = !DILocation(line: 40, column: 25, scope: !1027)
!1053 = !DILocation(line: 40, column: 17, scope: !1027)
!1054 = !DILocation(line: 40, column: 10, scope: !1027)
!1055 = !DILocation(line: 41, column: 12, scope: !1027)
!1056 = !DILocation(line: 41, column: 20, scope: !1027)
!1057 = !DILocation(line: 41, column: 25, scope: !1027)
!1058 = !DILocation(line: 41, column: 17, scope: !1027)
!1059 = !DILocation(line: 41, column: 5, scope: !1027)
!1060 = !DILocation(line: 41, column: 10, scope: !1027)
!1061 = !DILocation(line: 42, column: 12, scope: !1027)
!1062 = !DILocation(line: 42, column: 20, scope: !1027)
!1063 = !DILocation(line: 42, column: 25, scope: !1027)
!1064 = !DILocation(line: 42, column: 17, scope: !1027)
!1065 = !DILocation(line: 42, column: 5, scope: !1027)
!1066 = !DILocation(line: 42, column: 10, scope: !1027)
!1067 = !DILocation(line: 43, column: 12, scope: !1027)
!1068 = !DILocation(line: 43, column: 20, scope: !1027)
!1069 = !DILocation(line: 43, column: 25, scope: !1027)
!1070 = !DILocation(line: 43, column: 17, scope: !1027)
!1071 = !DILocation(line: 43, column: 5, scope: !1027)
!1072 = !DILocation(line: 43, column: 10, scope: !1027)
!1073 = !DILocation(line: 44, column: 7, scope: !1027)
!1074 = !DILocation(line: 27, column: 33, scope: !1023)
!1075 = !DILocation(line: 27, column: 3, scope: !1023)
!1076 = distinct !{!1076, !1024, !1077, !107}
!1077 = !DILocation(line: 45, column: 3, scope: !1020)
!1078 = !DILocation(line: 70, column: 1, scope: !1004)
!1079 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_decompress", scope: !1005, file: !1005, line: 82, type: !1080, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1080 = !DISubroutineType(types: !1081)
!1081 = !{null, !634, !237}
!1082 = !DILocalVariable(name: "r", arg: 1, scope: !1079, file: !1005, line: 82, type: !634)
!1083 = !DILocation(line: 0, scope: !1079)
!1084 = !DILocalVariable(name: "a", arg: 2, scope: !1079, file: !1005, line: 82, type: !237)
!1085 = !DILocalVariable(name: "i", scope: !1079, file: !1005, line: 83, type: !14)
!1086 = !DILocation(line: 86, column: 8, scope: !1087)
!1087 = distinct !DILexicalBlock(scope: !1079, file: !1005, line: 86, column: 3)
!1088 = !DILocation(line: 86, scope: !1087)
!1089 = !DILocation(line: 86, column: 17, scope: !1090)
!1090 = distinct !DILexicalBlock(scope: !1087, file: !1005, line: 86, column: 3)
!1091 = !DILocation(line: 86, column: 3, scope: !1087)
!1092 = !DILocation(line: 87, column: 36, scope: !1093)
!1093 = distinct !DILexicalBlock(scope: !1090, file: !1005, line: 86, column: 37)
!1094 = !DILocation(line: 87, column: 41, scope: !1093)
!1095 = !DILocation(line: 87, column: 25, scope: !1093)
!1096 = !DILocation(line: 87, column: 47, scope: !1093)
!1097 = !DILocation(line: 87, column: 58, scope: !1093)
!1098 = !DILocation(line: 87, column: 63, scope: !1093)
!1099 = !DILocation(line: 87, column: 23, scope: !1093)
!1100 = !DILocation(line: 87, column: 12, scope: !1093)
!1101 = !DILocation(line: 87, column: 5, scope: !1093)
!1102 = !DILocation(line: 87, column: 21, scope: !1093)
!1103 = !DILocation(line: 88, column: 36, scope: !1093)
!1104 = !DILocation(line: 88, column: 41, scope: !1093)
!1105 = !DILocation(line: 88, column: 25, scope: !1093)
!1106 = !DILocation(line: 88, column: 47, scope: !1093)
!1107 = !DILocation(line: 88, column: 58, scope: !1093)
!1108 = !DILocation(line: 88, column: 63, scope: !1093)
!1109 = !DILocation(line: 88, column: 23, scope: !1093)
!1110 = !DILocation(line: 88, column: 12, scope: !1093)
!1111 = !DILocation(line: 88, column: 16, scope: !1093)
!1112 = !DILocation(line: 88, column: 5, scope: !1093)
!1113 = !DILocation(line: 88, column: 21, scope: !1093)
!1114 = !DILocation(line: 89, column: 7, scope: !1093)
!1115 = !DILocation(line: 86, column: 33, scope: !1090)
!1116 = !DILocation(line: 86, column: 3, scope: !1090)
!1117 = distinct !{!1117, !1091, !1118, !107}
!1118 = !DILocation(line: 90, column: 3, scope: !1087)
!1119 = !DILocation(line: 111, column: 1, scope: !1079)
!1120 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_tobytes", scope: !1005, file: !1005, line: 122, type: !1006, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1121 = !DILocalVariable(name: "r", arg: 1, scope: !1120, file: !1005, line: 122, type: !6)
!1122 = !DILocation(line: 0, scope: !1120)
!1123 = !DILocalVariable(name: "a", arg: 2, scope: !1120, file: !1005, line: 122, type: !1008)
!1124 = !DILocalVariable(name: "i", scope: !1120, file: !1005, line: 123, type: !14)
!1125 = !DILocation(line: 126, column: 8, scope: !1126)
!1126 = distinct !DILexicalBlock(scope: !1120, file: !1005, line: 126, column: 3)
!1127 = !DILocation(line: 126, scope: !1126)
!1128 = !DILocation(line: 126, column: 17, scope: !1129)
!1129 = distinct !DILexicalBlock(scope: !1126, file: !1005, line: 126, column: 3)
!1130 = !DILocation(line: 126, column: 3, scope: !1126)
!1131 = !DILocation(line: 128, column: 17, scope: !1132)
!1132 = distinct !DILexicalBlock(scope: !1129, file: !1005, line: 126, column: 37)
!1133 = !DILocation(line: 128, column: 10, scope: !1132)
!1134 = !DILocalVariable(name: "t0", scope: !1120, file: !1005, line: 124, type: !60)
!1135 = !DILocation(line: 129, column: 31, scope: !1132)
!1136 = !DILocation(line: 129, column: 8, scope: !1132)
!1137 = !DILocation(line: 130, column: 17, scope: !1132)
!1138 = !DILocation(line: 130, column: 21, scope: !1132)
!1139 = !DILocation(line: 130, column: 10, scope: !1132)
!1140 = !DILocalVariable(name: "t1", scope: !1120, file: !1005, line: 124, type: !60)
!1141 = !DILocation(line: 131, column: 31, scope: !1132)
!1142 = !DILocation(line: 131, column: 8, scope: !1132)
!1143 = !DILocation(line: 132, column: 20, scope: !1132)
!1144 = !DILocation(line: 132, column: 9, scope: !1132)
!1145 = !DILocation(line: 132, column: 5, scope: !1132)
!1146 = !DILocation(line: 132, column: 18, scope: !1132)
!1147 = !DILocation(line: 133, column: 24, scope: !1132)
!1148 = !DILocation(line: 133, column: 33, scope: !1132)
!1149 = !DILocation(line: 133, column: 36, scope: !1132)
!1150 = !DILocation(line: 133, column: 30, scope: !1132)
!1151 = !DILocation(line: 133, column: 9, scope: !1132)
!1152 = !DILocation(line: 133, column: 5, scope: !1132)
!1153 = !DILocation(line: 133, column: 18, scope: !1132)
!1154 = !DILocation(line: 134, column: 24, scope: !1132)
!1155 = !DILocation(line: 134, column: 20, scope: !1132)
!1156 = !DILocation(line: 134, column: 9, scope: !1132)
!1157 = !DILocation(line: 134, column: 5, scope: !1132)
!1158 = !DILocation(line: 134, column: 18, scope: !1132)
!1159 = !DILocation(line: 126, column: 33, scope: !1129)
!1160 = !DILocation(line: 126, column: 3, scope: !1129)
!1161 = distinct !{!1161, !1130, !1162, !107}
!1162 = !DILocation(line: 135, column: 3, scope: !1126)
!1163 = !DILocation(line: 136, column: 1, scope: !1120)
!1164 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_frombytes", scope: !1005, file: !1005, line: 148, type: !1080, scopeLine: 148, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1165 = !DILocalVariable(name: "r", arg: 1, scope: !1164, file: !1005, line: 148, type: !634)
!1166 = !DILocation(line: 0, scope: !1164)
!1167 = !DILocalVariable(name: "a", arg: 2, scope: !1164, file: !1005, line: 148, type: !237)
!1168 = !DILocalVariable(name: "i", scope: !1164, file: !1005, line: 149, type: !14)
!1169 = !DILocation(line: 150, column: 8, scope: !1170)
!1170 = distinct !DILexicalBlock(scope: !1164, file: !1005, line: 150, column: 3)
!1171 = !DILocation(line: 150, scope: !1170)
!1172 = !DILocation(line: 150, column: 17, scope: !1173)
!1173 = distinct !DILexicalBlock(scope: !1170, file: !1005, line: 150, column: 3)
!1174 = !DILocation(line: 150, column: 3, scope: !1170)
!1175 = !DILocation(line: 151, column: 25, scope: !1176)
!1176 = distinct !DILexicalBlock(scope: !1173, file: !1005, line: 150, column: 37)
!1177 = !DILocation(line: 151, column: 21, scope: !1176)
!1178 = !DILocation(line: 151, column: 57, scope: !1176)
!1179 = !DILocation(line: 151, column: 53, scope: !1176)
!1180 = !DILocation(line: 151, column: 43, scope: !1176)
!1181 = !DILocation(line: 151, column: 66, scope: !1176)
!1182 = !DILocation(line: 151, column: 73, scope: !1176)
!1183 = !DILocation(line: 151, column: 12, scope: !1176)
!1184 = !DILocation(line: 151, column: 5, scope: !1176)
!1185 = !DILocation(line: 151, column: 17, scope: !1176)
!1186 = !DILocation(line: 153, column: 15, scope: !1176)
!1187 = !DILocation(line: 153, column: 11, scope: !1176)
!1188 = !DILocation(line: 153, column: 24, scope: !1176)
!1189 = !DILocation(line: 153, column: 47, scope: !1176)
!1190 = !DILocation(line: 153, column: 43, scope: !1176)
!1191 = !DILocation(line: 153, column: 33, scope: !1176)
!1192 = !DILocation(line: 153, column: 56, scope: !1176)
!1193 = !DILocation(line: 153, column: 30, scope: !1176)
!1194 = !DILocation(line: 152, column: 12, scope: !1176)
!1195 = !DILocation(line: 152, column: 16, scope: !1176)
!1196 = !DILocation(line: 152, column: 5, scope: !1176)
!1197 = !DILocation(line: 152, column: 21, scope: !1176)
!1198 = !DILocation(line: 150, column: 33, scope: !1173)
!1199 = !DILocation(line: 150, column: 3, scope: !1173)
!1200 = distinct !{!1200, !1174, !1201, !107}
!1201 = !DILocation(line: 154, column: 3, scope: !1170)
!1202 = !DILocation(line: 155, column: 1, scope: !1164)
!1203 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_frommsg", scope: !1005, file: !1005, line: 165, type: !1080, scopeLine: 165, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1204 = !DILocalVariable(name: "r", arg: 1, scope: !1203, file: !1005, line: 165, type: !634)
!1205 = !DILocation(line: 0, scope: !1203)
!1206 = !DILocalVariable(name: "msg", arg: 2, scope: !1203, file: !1005, line: 165, type: !237)
!1207 = !DILocalVariable(name: "i", scope: !1203, file: !1005, line: 166, type: !14)
!1208 = !DILocation(line: 172, column: 8, scope: !1209)
!1209 = distinct !DILexicalBlock(scope: !1203, file: !1005, line: 172, column: 3)
!1210 = !DILocation(line: 172, scope: !1209)
!1211 = !DILocation(line: 172, column: 17, scope: !1212)
!1212 = distinct !DILexicalBlock(scope: !1209, file: !1005, line: 172, column: 3)
!1213 = !DILocation(line: 172, column: 3, scope: !1209)
!1214 = !DILocation(line: 173, column: 5, scope: !1215)
!1215 = distinct !DILexicalBlock(scope: !1216, file: !1005, line: 173, column: 5)
!1216 = distinct !DILexicalBlock(scope: !1212, file: !1005, line: 172, column: 37)
!1217 = !DILocation(line: 173, scope: !1215)
!1218 = !DILocalVariable(name: "j", scope: !1203, file: !1005, line: 166, type: !14)
!1219 = !DILocation(line: 173, column: 19, scope: !1220)
!1220 = distinct !DILexicalBlock(scope: !1215, file: !1005, line: 173, column: 5)
!1221 = !DILocation(line: 174, column: 14, scope: !1222)
!1222 = distinct !DILexicalBlock(scope: !1220, file: !1005, line: 173, column: 29)
!1223 = !DILocation(line: 174, column: 18, scope: !1222)
!1224 = !DILocation(line: 174, column: 7, scope: !1222)
!1225 = !DILocation(line: 174, column: 23, scope: !1222)
!1226 = !DILocation(line: 175, column: 23, scope: !1222)
!1227 = !DILocation(line: 175, column: 31, scope: !1222)
!1228 = !DILocation(line: 175, column: 58, scope: !1222)
!1229 = !DILocation(line: 175, column: 65, scope: !1222)
!1230 = !DILocation(line: 175, column: 57, scope: !1222)
!1231 = !DILocation(line: 175, column: 7, scope: !1222)
!1232 = !DILocation(line: 173, column: 25, scope: !1220)
!1233 = !DILocation(line: 173, column: 5, scope: !1220)
!1234 = distinct !{!1234, !1214, !1235, !107}
!1235 = !DILocation(line: 176, column: 5, scope: !1215)
!1236 = !DILocation(line: 172, column: 33, scope: !1212)
!1237 = !DILocation(line: 172, column: 3, scope: !1212)
!1238 = distinct !{!1238, !1213, !1239, !107}
!1239 = !DILocation(line: 177, column: 3, scope: !1209)
!1240 = !DILocation(line: 178, column: 1, scope: !1203)
!1241 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_tomsg", scope: !1005, file: !1005, line: 188, type: !1006, scopeLine: 188, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1242 = !DILocalVariable(name: "msg", arg: 1, scope: !1241, file: !1005, line: 188, type: !6)
!1243 = !DILocation(line: 0, scope: !1241)
!1244 = !DILocalVariable(name: "a", arg: 2, scope: !1241, file: !1005, line: 188, type: !1008)
!1245 = !DILocalVariable(name: "i", scope: !1241, file: !1005, line: 189, type: !14)
!1246 = !DILocation(line: 192, column: 8, scope: !1247)
!1247 = distinct !DILexicalBlock(scope: !1241, file: !1005, line: 192, column: 3)
!1248 = !DILocation(line: 192, scope: !1247)
!1249 = !DILocation(line: 192, column: 17, scope: !1250)
!1250 = distinct !DILexicalBlock(scope: !1247, file: !1005, line: 192, column: 3)
!1251 = !DILocation(line: 192, column: 3, scope: !1247)
!1252 = !DILocation(line: 193, column: 5, scope: !1253)
!1253 = distinct !DILexicalBlock(scope: !1250, file: !1005, line: 192, column: 37)
!1254 = !DILocation(line: 193, column: 12, scope: !1253)
!1255 = !DILocalVariable(name: "j", scope: !1241, file: !1005, line: 189, type: !14)
!1256 = !DILocation(line: 194, column: 10, scope: !1257)
!1257 = distinct !DILexicalBlock(scope: !1253, file: !1005, line: 194, column: 5)
!1258 = !DILocation(line: 194, scope: !1257)
!1259 = !DILocation(line: 194, column: 19, scope: !1260)
!1260 = distinct !DILexicalBlock(scope: !1257, file: !1005, line: 194, column: 5)
!1261 = !DILocation(line: 194, column: 5, scope: !1257)
!1262 = !DILocation(line: 195, column: 18, scope: !1263)
!1263 = distinct !DILexicalBlock(scope: !1260, file: !1005, line: 194, column: 29)
!1264 = !DILocation(line: 195, column: 22, scope: !1263)
!1265 = !DILocation(line: 195, column: 11, scope: !1263)
!1266 = !DILocalVariable(name: "t", scope: !1241, file: !1005, line: 190, type: !65)
!1267 = !DILocation(line: 200, column: 9, scope: !1263)
!1268 = !DILocation(line: 201, column: 9, scope: !1263)
!1269 = !DILocation(line: 202, column: 9, scope: !1263)
!1270 = !DILocation(line: 203, column: 19, scope: !1263)
!1271 = !DILocation(line: 203, column: 7, scope: !1263)
!1272 = !DILocation(line: 203, column: 14, scope: !1263)
!1273 = !DILocation(line: 194, column: 25, scope: !1260)
!1274 = !DILocation(line: 194, column: 5, scope: !1260)
!1275 = distinct !{!1275, !1261, !1276, !107}
!1276 = !DILocation(line: 204, column: 5, scope: !1257)
!1277 = !DILocation(line: 192, column: 33, scope: !1250)
!1278 = !DILocation(line: 192, column: 3, scope: !1250)
!1279 = distinct !{!1279, !1251, !1280, !107}
!1280 = !DILocation(line: 205, column: 3, scope: !1247)
!1281 = !DILocation(line: 206, column: 1, scope: !1241)
!1282 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_getnoise_eta1", scope: !1005, file: !1005, line: 220, type: !1283, scopeLine: 221, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1283 = !DISubroutineType(types: !1284)
!1284 = !{null, !634, !237, !7}
!1285 = !DILocalVariable(name: "r", arg: 1, scope: !1282, file: !1005, line: 220, type: !634)
!1286 = !DILocation(line: 0, scope: !1282)
!1287 = !DILocalVariable(name: "seed", arg: 2, scope: !1282, file: !1005, line: 220, type: !237)
!1288 = !DILocalVariable(name: "nonce", arg: 3, scope: !1282, file: !1005, line: 221, type: !7)
!1289 = !DILocalVariable(name: "buf", scope: !1282, file: !1005, line: 222, type: !1290)
!1290 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1024, elements: !39)
!1291 = !DILocation(line: 222, column: 11, scope: !1282)
!1292 = !DILocation(line: 223, column: 3, scope: !1282)
!1293 = !DILocation(line: 224, column: 3, scope: !1282)
!1294 = !DILocation(line: 225, column: 1, scope: !1282)
!1295 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_getnoise_eta2", scope: !1005, file: !1005, line: 239, type: !1283, scopeLine: 240, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1296 = !DILocalVariable(name: "r", arg: 1, scope: !1295, file: !1005, line: 239, type: !634)
!1297 = !DILocation(line: 0, scope: !1295)
!1298 = !DILocalVariable(name: "seed", arg: 2, scope: !1295, file: !1005, line: 239, type: !237)
!1299 = !DILocalVariable(name: "nonce", arg: 3, scope: !1295, file: !1005, line: 240, type: !7)
!1300 = !DILocalVariable(name: "buf", scope: !1295, file: !1005, line: 241, type: !1290)
!1301 = !DILocation(line: 241, column: 11, scope: !1295)
!1302 = !DILocation(line: 242, column: 3, scope: !1295)
!1303 = !DILocation(line: 243, column: 3, scope: !1295)
!1304 = !DILocation(line: 244, column: 1, scope: !1295)
!1305 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_ntt", scope: !1005, file: !1005, line: 256, type: !1306, scopeLine: 256, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1306 = !DISubroutineType(types: !1307)
!1307 = !{null, !634}
!1308 = !DILocalVariable(name: "r", arg: 1, scope: !1305, file: !1005, line: 256, type: !634)
!1309 = !DILocation(line: 0, scope: !1305)
!1310 = !DILocation(line: 257, column: 3, scope: !1305)
!1311 = !DILocation(line: 258, column: 3, scope: !1305)
!1312 = !DILocation(line: 259, column: 1, scope: !1305)
!1313 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_reduce", scope: !1005, file: !1005, line: 314, type: !1306, scopeLine: 314, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1314 = !DILocalVariable(name: "r", arg: 1, scope: !1313, file: !1005, line: 314, type: !634)
!1315 = !DILocation(line: 0, scope: !1313)
!1316 = !DILocalVariable(name: "i", scope: !1313, file: !1005, line: 315, type: !14)
!1317 = !DILocation(line: 316, column: 8, scope: !1318)
!1318 = distinct !DILexicalBlock(scope: !1313, file: !1005, line: 316, column: 3)
!1319 = !DILocation(line: 316, scope: !1318)
!1320 = !DILocation(line: 316, column: 17, scope: !1321)
!1321 = distinct !DILexicalBlock(scope: !1318, file: !1005, line: 316, column: 3)
!1322 = !DILocation(line: 316, column: 3, scope: !1318)
!1323 = !DILocation(line: 317, column: 30, scope: !1321)
!1324 = !DILocation(line: 317, column: 15, scope: !1321)
!1325 = !DILocation(line: 317, column: 5, scope: !1321)
!1326 = !DILocation(line: 317, column: 13, scope: !1321)
!1327 = !DILocation(line: 316, column: 29, scope: !1321)
!1328 = !DILocation(line: 316, column: 3, scope: !1321)
!1329 = distinct !{!1329, !1322, !1330, !107}
!1330 = !DILocation(line: 317, column: 37, scope: !1318)
!1331 = !DILocation(line: 318, column: 1, scope: !1313)
!1332 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_invntt_tomont", scope: !1005, file: !1005, line: 271, type: !1306, scopeLine: 271, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1333 = !DILocalVariable(name: "r", arg: 1, scope: !1332, file: !1005, line: 271, type: !634)
!1334 = !DILocation(line: 0, scope: !1332)
!1335 = !DILocation(line: 271, column: 36, scope: !1332)
!1336 = !DILocation(line: 271, column: 48, scope: !1332)
!1337 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_basemul_montgomery", scope: !1005, file: !1005, line: 282, type: !1338, scopeLine: 282, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1338 = !DISubroutineType(types: !1339)
!1339 = !{null, !634, !1008, !1008}
!1340 = !DILocalVariable(name: "r", arg: 1, scope: !1337, file: !1005, line: 282, type: !634)
!1341 = !DILocation(line: 0, scope: !1337)
!1342 = !DILocalVariable(name: "a", arg: 2, scope: !1337, file: !1005, line: 282, type: !1008)
!1343 = !DILocalVariable(name: "b", arg: 3, scope: !1337, file: !1005, line: 282, type: !1008)
!1344 = !DILocalVariable(name: "i", scope: !1337, file: !1005, line: 283, type: !14)
!1345 = !DILocation(line: 284, column: 8, scope: !1346)
!1346 = distinct !DILexicalBlock(scope: !1337, file: !1005, line: 284, column: 3)
!1347 = !DILocation(line: 284, scope: !1346)
!1348 = !DILocation(line: 284, column: 17, scope: !1349)
!1349 = distinct !DILexicalBlock(scope: !1346, file: !1005, line: 284, column: 3)
!1350 = !DILocation(line: 284, column: 3, scope: !1346)
!1351 = !DILocation(line: 285, column: 21, scope: !1352)
!1352 = distinct !DILexicalBlock(scope: !1349, file: !1005, line: 284, column: 37)
!1353 = !DILocation(line: 285, column: 14, scope: !1352)
!1354 = !DILocation(line: 285, column: 35, scope: !1352)
!1355 = !DILocation(line: 285, column: 28, scope: !1352)
!1356 = !DILocation(line: 285, column: 49, scope: !1352)
!1357 = !DILocation(line: 285, column: 42, scope: !1352)
!1358 = !DILocation(line: 285, column: 64, scope: !1352)
!1359 = !DILocation(line: 285, column: 55, scope: !1352)
!1360 = !DILocation(line: 285, column: 5, scope: !1352)
!1361 = !DILocation(line: 286, column: 21, scope: !1352)
!1362 = !DILocation(line: 286, column: 25, scope: !1352)
!1363 = !DILocation(line: 286, column: 14, scope: !1352)
!1364 = !DILocation(line: 286, column: 39, scope: !1352)
!1365 = !DILocation(line: 286, column: 43, scope: !1352)
!1366 = !DILocation(line: 286, column: 32, scope: !1352)
!1367 = !DILocation(line: 286, column: 57, scope: !1352)
!1368 = !DILocation(line: 286, column: 61, scope: !1352)
!1369 = !DILocation(line: 286, column: 50, scope: !1352)
!1370 = !DILocation(line: 287, column: 23, scope: !1352)
!1371 = !DILocation(line: 287, column: 14, scope: !1352)
!1372 = !DILocation(line: 287, column: 13, scope: !1352)
!1373 = !DILocation(line: 286, column: 5, scope: !1352)
!1374 = !DILocation(line: 284, column: 33, scope: !1349)
!1375 = !DILocation(line: 284, column: 3, scope: !1349)
!1376 = distinct !{!1376, !1350, !1377, !107}
!1377 = !DILocation(line: 288, column: 3, scope: !1346)
!1378 = !DILocation(line: 289, column: 1, scope: !1337)
!1379 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_tomont", scope: !1005, file: !1005, line: 299, type: !1306, scopeLine: 299, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1380 = !DILocalVariable(name: "r", arg: 1, scope: !1379, file: !1005, line: 299, type: !634)
!1381 = !DILocation(line: 0, scope: !1379)
!1382 = !DILocalVariable(name: "f", scope: !1379, file: !1005, line: 301, type: !35)
!1383 = !DILocalVariable(name: "i", scope: !1379, file: !1005, line: 300, type: !14)
!1384 = !DILocation(line: 302, column: 8, scope: !1385)
!1385 = distinct !DILexicalBlock(scope: !1379, file: !1005, line: 302, column: 3)
!1386 = !DILocation(line: 302, scope: !1385)
!1387 = !DILocation(line: 302, column: 17, scope: !1388)
!1388 = distinct !DILexicalBlock(scope: !1385, file: !1005, line: 302, column: 3)
!1389 = !DILocation(line: 302, column: 3, scope: !1385)
!1390 = !DILocation(line: 303, column: 42, scope: !1388)
!1391 = !DILocation(line: 303, column: 33, scope: !1388)
!1392 = !DILocation(line: 303, column: 50, scope: !1388)
!1393 = !DILocation(line: 303, column: 15, scope: !1388)
!1394 = !DILocation(line: 303, column: 5, scope: !1388)
!1395 = !DILocation(line: 303, column: 13, scope: !1388)
!1396 = !DILocation(line: 302, column: 29, scope: !1388)
!1397 = !DILocation(line: 302, column: 3, scope: !1388)
!1398 = distinct !{!1398, !1389, !1399, !107}
!1399 = !DILocation(line: 303, column: 53, scope: !1385)
!1400 = !DILocation(line: 304, column: 1, scope: !1379)
!1401 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_add", scope: !1005, file: !1005, line: 329, type: !1338, scopeLine: 329, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1402 = !DILocalVariable(name: "r", arg: 1, scope: !1401, file: !1005, line: 329, type: !634)
!1403 = !DILocation(line: 0, scope: !1401)
!1404 = !DILocalVariable(name: "a", arg: 2, scope: !1401, file: !1005, line: 329, type: !1008)
!1405 = !DILocalVariable(name: "b", arg: 3, scope: !1401, file: !1005, line: 329, type: !1008)
!1406 = !DILocalVariable(name: "i", scope: !1401, file: !1005, line: 330, type: !14)
!1407 = !DILocation(line: 331, column: 8, scope: !1408)
!1408 = distinct !DILexicalBlock(scope: !1401, file: !1005, line: 331, column: 3)
!1409 = !DILocation(line: 331, scope: !1408)
!1410 = !DILocation(line: 331, column: 17, scope: !1411)
!1411 = distinct !DILexicalBlock(scope: !1408, file: !1005, line: 331, column: 3)
!1412 = !DILocation(line: 331, column: 3, scope: !1408)
!1413 = !DILocation(line: 332, column: 15, scope: !1411)
!1414 = !DILocation(line: 332, column: 25, scope: !1411)
!1415 = !DILocation(line: 332, column: 23, scope: !1411)
!1416 = !DILocation(line: 332, column: 5, scope: !1411)
!1417 = !DILocation(line: 332, column: 13, scope: !1411)
!1418 = !DILocation(line: 331, column: 29, scope: !1411)
!1419 = !DILocation(line: 331, column: 3, scope: !1411)
!1420 = distinct !{!1420, !1412, !1421, !107}
!1421 = !DILocation(line: 332, column: 31, scope: !1408)
!1422 = !DILocation(line: 333, column: 1, scope: !1401)
!1423 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_sub", scope: !1005, file: !1005, line: 344, type: !1338, scopeLine: 344, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !67, retainedNodes: !24)
!1424 = !DILocalVariable(name: "r", arg: 1, scope: !1423, file: !1005, line: 344, type: !634)
!1425 = !DILocation(line: 0, scope: !1423)
!1426 = !DILocalVariable(name: "a", arg: 2, scope: !1423, file: !1005, line: 344, type: !1008)
!1427 = !DILocalVariable(name: "b", arg: 3, scope: !1423, file: !1005, line: 344, type: !1008)
!1428 = !DILocalVariable(name: "i", scope: !1423, file: !1005, line: 345, type: !14)
!1429 = !DILocation(line: 346, column: 8, scope: !1430)
!1430 = distinct !DILexicalBlock(scope: !1423, file: !1005, line: 346, column: 3)
!1431 = !DILocation(line: 346, scope: !1430)
!1432 = !DILocation(line: 346, column: 17, scope: !1433)
!1433 = distinct !DILexicalBlock(scope: !1430, file: !1005, line: 346, column: 3)
!1434 = !DILocation(line: 346, column: 3, scope: !1430)
!1435 = !DILocation(line: 347, column: 15, scope: !1433)
!1436 = !DILocation(line: 347, column: 25, scope: !1433)
!1437 = !DILocation(line: 347, column: 23, scope: !1433)
!1438 = !DILocation(line: 347, column: 5, scope: !1433)
!1439 = !DILocation(line: 347, column: 13, scope: !1433)
!1440 = !DILocation(line: 346, column: 29, scope: !1433)
!1441 = !DILocation(line: 346, column: 3, scope: !1433)
!1442 = distinct !{!1442, !1434, !1443, !107}
!1443 = !DILocation(line: 347, column: 31, scope: !1430)
!1444 = !DILocation(line: 348, column: 1, scope: !1423)
!1445 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_ntt", scope: !33, file: !33, line: 80, type: !1446, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, retainedNodes: !24)
!1446 = !DISubroutineType(types: !1447)
!1447 = !{null, !403}
!1448 = !DILocalVariable(name: "r", arg: 1, scope: !1445, file: !33, line: 80, type: !403)
!1449 = !DILocation(line: 0, scope: !1445)
!1450 = !DILocalVariable(name: "k", scope: !1445, file: !33, line: 81, type: !14)
!1451 = !DILocalVariable(name: "len", scope: !1445, file: !33, line: 81, type: !14)
!1452 = !DILocation(line: 85, column: 7, scope: !1453)
!1453 = distinct !DILexicalBlock(scope: !1445, file: !33, line: 85, column: 3)
!1454 = !DILocation(line: 85, scope: !1453)
!1455 = !DILocation(line: 84, column: 5, scope: !1445)
!1456 = !DILocation(line: 85, column: 22, scope: !1457)
!1457 = distinct !DILexicalBlock(scope: !1453, file: !33, line: 85, column: 3)
!1458 = !DILocation(line: 85, column: 3, scope: !1453)
!1459 = !DILocation(line: 86, column: 5, scope: !1460)
!1460 = distinct !DILexicalBlock(scope: !1461, file: !33, line: 86, column: 5)
!1461 = distinct !DILexicalBlock(scope: !1457, file: !33, line: 85, column: 39)
!1462 = !DILocation(line: 86, scope: !1460)
!1463 = !DILocalVariable(name: "start", scope: !1445, file: !33, line: 81, type: !14)
!1464 = !DILocation(line: 86, column: 26, scope: !1465)
!1465 = distinct !DILexicalBlock(scope: !1460, file: !33, line: 86, column: 5)
!1466 = !DILocation(line: 87, column: 14, scope: !1467)
!1467 = distinct !DILexicalBlock(scope: !1465, file: !33, line: 86, column: 50)
!1468 = !DILocalVariable(name: "zeta", scope: !1445, file: !33, line: 82, type: !36)
!1469 = !DILocalVariable(name: "j", scope: !1445, file: !33, line: 81, type: !14)
!1470 = !DILocation(line: 88, column: 11, scope: !1471)
!1471 = distinct !DILexicalBlock(scope: !1467, file: !33, line: 88, column: 7)
!1472 = !DILocation(line: 88, scope: !1471)
!1473 = !DILocation(line: 88, column: 32, scope: !1474)
!1474 = distinct !DILexicalBlock(scope: !1471, file: !33, line: 88, column: 7)
!1475 = !DILocation(line: 88, column: 24, scope: !1474)
!1476 = !DILocation(line: 88, column: 7, scope: !1471)
!1477 = !DILocation(line: 89, column: 25, scope: !1478)
!1478 = distinct !DILexicalBlock(scope: !1474, file: !33, line: 88, column: 44)
!1479 = !DILocation(line: 89, column: 13, scope: !1478)
!1480 = !DILocalVariable(name: "t", scope: !1445, file: !33, line: 82, type: !36)
!1481 = !DILocation(line: 90, column: 22, scope: !1478)
!1482 = !DILocation(line: 90, column: 27, scope: !1478)
!1483 = !DILocation(line: 90, column: 9, scope: !1478)
!1484 = !DILocation(line: 90, column: 20, scope: !1478)
!1485 = !DILocation(line: 91, column: 16, scope: !1478)
!1486 = !DILocation(line: 91, column: 21, scope: !1478)
!1487 = !DILocation(line: 91, column: 9, scope: !1478)
!1488 = !DILocation(line: 91, column: 14, scope: !1478)
!1489 = !DILocation(line: 88, column: 40, scope: !1474)
!1490 = !DILocation(line: 88, column: 7, scope: !1474)
!1491 = distinct !{!1491, !1476, !1492, !107}
!1492 = !DILocation(line: 92, column: 7, scope: !1471)
!1493 = !DILocation(line: 87, column: 21, scope: !1467)
!1494 = !DILocation(line: 86, column: 43, scope: !1465)
!1495 = !DILocation(line: 86, column: 5, scope: !1465)
!1496 = distinct !{!1496, !1459, !1497, !107}
!1497 = !DILocation(line: 93, column: 5, scope: !1460)
!1498 = !DILocation(line: 85, column: 32, scope: !1457)
!1499 = !DILocation(line: 85, column: 3, scope: !1457)
!1500 = distinct !{!1500, !1458, !1501, !107}
!1501 = !DILocation(line: 94, column: 3, scope: !1453)
!1502 = !DILocation(line: 95, column: 1, scope: !1445)
!1503 = distinct !DISubprogram(name: "fqmul", scope: !33, file: !33, line: 68, type: !1504, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !28, retainedNodes: !24)
!1504 = !DISubroutineType(types: !1505)
!1505 = !{!36, !36, !36}
!1506 = !DILocalVariable(name: "a", arg: 1, scope: !1503, file: !33, line: 68, type: !36)
!1507 = !DILocation(line: 0, scope: !1503)
!1508 = !DILocalVariable(name: "b", arg: 2, scope: !1503, file: !33, line: 68, type: !36)
!1509 = !DILocation(line: 69, column: 28, scope: !1503)
!1510 = !DILocation(line: 69, column: 39, scope: !1503)
!1511 = !DILocation(line: 69, column: 38, scope: !1503)
!1512 = !DILocation(line: 69, column: 10, scope: !1503)
!1513 = !DILocation(line: 69, column: 3, scope: !1503)
!1514 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_invntt", scope: !33, file: !33, line: 106, type: !1446, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, retainedNodes: !24)
!1515 = !DILocalVariable(name: "r", arg: 1, scope: !1514, file: !33, line: 106, type: !403)
!1516 = !DILocation(line: 0, scope: !1514)
!1517 = !DILocalVariable(name: "f", scope: !1514, file: !33, line: 109, type: !35)
!1518 = !DILocalVariable(name: "k", scope: !1514, file: !33, line: 107, type: !14)
!1519 = !DILocalVariable(name: "len", scope: !1514, file: !33, line: 107, type: !14)
!1520 = !DILocation(line: 112, column: 7, scope: !1521)
!1521 = distinct !DILexicalBlock(scope: !1514, file: !33, line: 112, column: 3)
!1522 = !DILocation(line: 112, scope: !1521)
!1523 = !DILocation(line: 111, column: 5, scope: !1514)
!1524 = !DILocation(line: 112, column: 20, scope: !1525)
!1525 = distinct !DILexicalBlock(scope: !1521, file: !33, line: 112, column: 3)
!1526 = !DILocation(line: 112, column: 3, scope: !1521)
!1527 = !DILocation(line: 113, column: 5, scope: !1528)
!1528 = distinct !DILexicalBlock(scope: !1529, file: !33, line: 113, column: 5)
!1529 = distinct !DILexicalBlock(scope: !1525, file: !33, line: 112, column: 39)
!1530 = !DILocation(line: 124, column: 3, scope: !1531)
!1531 = distinct !DILexicalBlock(scope: !1514, file: !33, line: 124, column: 3)
!1532 = !DILocation(line: 113, scope: !1528)
!1533 = !DILocalVariable(name: "start", scope: !1514, file: !33, line: 107, type: !14)
!1534 = !DILocation(line: 113, column: 26, scope: !1535)
!1535 = distinct !DILexicalBlock(scope: !1528, file: !33, line: 113, column: 5)
!1536 = !DILocation(line: 114, column: 14, scope: !1537)
!1537 = distinct !DILexicalBlock(scope: !1535, file: !33, line: 113, column: 50)
!1538 = !DILocalVariable(name: "zeta", scope: !1514, file: !33, line: 108, type: !36)
!1539 = !DILocalVariable(name: "j", scope: !1514, file: !33, line: 107, type: !14)
!1540 = !DILocation(line: 115, column: 11, scope: !1541)
!1541 = distinct !DILexicalBlock(scope: !1537, file: !33, line: 115, column: 7)
!1542 = !DILocation(line: 115, scope: !1541)
!1543 = !DILocation(line: 115, column: 32, scope: !1544)
!1544 = distinct !DILexicalBlock(scope: !1541, file: !33, line: 115, column: 7)
!1545 = !DILocation(line: 115, column: 24, scope: !1544)
!1546 = !DILocation(line: 115, column: 7, scope: !1541)
!1547 = !DILocation(line: 116, column: 13, scope: !1548)
!1548 = distinct !DILexicalBlock(scope: !1544, file: !33, line: 115, column: 44)
!1549 = !DILocalVariable(name: "t", scope: !1514, file: !33, line: 108, type: !36)
!1550 = !DILocation(line: 117, column: 35, scope: !1548)
!1551 = !DILocation(line: 117, column: 33, scope: !1548)
!1552 = !DILocation(line: 117, column: 16, scope: !1548)
!1553 = !DILocation(line: 117, column: 9, scope: !1548)
!1554 = !DILocation(line: 117, column: 14, scope: !1548)
!1555 = !DILocation(line: 118, column: 22, scope: !1548)
!1556 = !DILocation(line: 118, column: 33, scope: !1548)
!1557 = !DILocation(line: 118, column: 9, scope: !1548)
!1558 = !DILocation(line: 118, column: 20, scope: !1548)
!1559 = !DILocation(line: 119, column: 34, scope: !1548)
!1560 = !DILocation(line: 119, column: 22, scope: !1548)
!1561 = !DILocation(line: 119, column: 9, scope: !1548)
!1562 = !DILocation(line: 119, column: 20, scope: !1548)
!1563 = !DILocation(line: 115, column: 40, scope: !1544)
!1564 = !DILocation(line: 115, column: 7, scope: !1544)
!1565 = distinct !{!1565, !1546, !1566, !107}
!1566 = !DILocation(line: 120, column: 7, scope: !1541)
!1567 = !DILocation(line: 114, column: 21, scope: !1537)
!1568 = !DILocation(line: 113, column: 43, scope: !1535)
!1569 = !DILocation(line: 113, column: 5, scope: !1535)
!1570 = distinct !{!1570, !1527, !1571, !107}
!1571 = !DILocation(line: 121, column: 5, scope: !1528)
!1572 = !DILocation(line: 112, column: 32, scope: !1525)
!1573 = !DILocation(line: 112, column: 3, scope: !1525)
!1574 = distinct !{!1574, !1526, !1575, !107}
!1575 = !DILocation(line: 122, column: 3, scope: !1521)
!1576 = !DILocation(line: 124, scope: !1531)
!1577 = !DILocation(line: 124, column: 16, scope: !1578)
!1578 = distinct !DILexicalBlock(scope: !1531, file: !33, line: 124, column: 3)
!1579 = !DILocation(line: 125, column: 18, scope: !1578)
!1580 = !DILocation(line: 125, column: 12, scope: !1578)
!1581 = !DILocation(line: 125, column: 5, scope: !1578)
!1582 = !DILocation(line: 125, column: 10, scope: !1578)
!1583 = !DILocation(line: 124, column: 24, scope: !1578)
!1584 = !DILocation(line: 124, column: 3, scope: !1578)
!1585 = distinct !{!1585, !1530, !1586, !107}
!1586 = !DILocation(line: 125, column: 25, scope: !1531)
!1587 = !DILocation(line: 126, column: 1, scope: !1514)
!1588 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_basemul", scope: !33, file: !33, line: 139, type: !1589, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, retainedNodes: !24)
!1589 = !DISubroutineType(types: !1590)
!1590 = !{null, !403, !1591, !1591, !36}
!1591 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 32)
!1592 = !DILocalVariable(name: "r", arg: 1, scope: !1588, file: !33, line: 139, type: !403)
!1593 = !DILocation(line: 0, scope: !1588)
!1594 = !DILocalVariable(name: "a", arg: 2, scope: !1588, file: !33, line: 139, type: !1591)
!1595 = !DILocalVariable(name: "b", arg: 3, scope: !1588, file: !33, line: 139, type: !1591)
!1596 = !DILocalVariable(name: "zeta", arg: 4, scope: !1588, file: !33, line: 139, type: !36)
!1597 = !DILocation(line: 141, column: 17, scope: !1588)
!1598 = !DILocation(line: 141, column: 23, scope: !1588)
!1599 = !DILocation(line: 141, column: 11, scope: !1588)
!1600 = !DILocation(line: 141, column: 9, scope: !1588)
!1601 = !DILocation(line: 142, column: 11, scope: !1588)
!1602 = !DILocation(line: 142, column: 9, scope: !1588)
!1603 = !DILocation(line: 143, column: 17, scope: !1588)
!1604 = !DILocation(line: 143, column: 23, scope: !1588)
!1605 = !DILocation(line: 143, column: 11, scope: !1588)
!1606 = !DILocation(line: 143, column: 8, scope: !1588)
!1607 = !DILocation(line: 144, column: 17, scope: !1588)
!1608 = !DILocation(line: 144, column: 23, scope: !1588)
!1609 = !DILocation(line: 144, column: 11, scope: !1588)
!1610 = !DILocation(line: 144, column: 3, scope: !1588)
!1611 = !DILocation(line: 144, column: 9, scope: !1588)
!1612 = !DILocation(line: 145, column: 17, scope: !1588)
!1613 = !DILocation(line: 145, column: 23, scope: !1588)
!1614 = !DILocation(line: 145, column: 11, scope: !1588)
!1615 = !DILocation(line: 145, column: 3, scope: !1588)
!1616 = !DILocation(line: 145, column: 8, scope: !1588)
!1617 = !DILocation(line: 146, column: 1, scope: !1588)
!1618 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_cbd_eta1", scope: !1619, file: !1619, line: 105, type: !1080, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !69, retainedNodes: !24)
!1619 = !DIFile(filename: "../../../ref/cbd.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!1620 = !DILocalVariable(name: "r", arg: 1, scope: !1618, file: !1619, line: 105, type: !634)
!1621 = !DILocation(line: 0, scope: !1618)
!1622 = !DILocalVariable(name: "buf", arg: 2, scope: !1618, file: !1619, line: 105, type: !237)
!1623 = !DILocation(line: 107, column: 3, scope: !1618)
!1624 = !DILocation(line: 113, column: 1, scope: !1618)
!1625 = distinct !DISubprogram(name: "cbd2", scope: !1619, file: !1619, line: 55, type: !1080, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !69, retainedNodes: !24)
!1626 = !DILocalVariable(name: "r", arg: 1, scope: !1625, file: !1619, line: 55, type: !634)
!1627 = !DILocation(line: 0, scope: !1625)
!1628 = !DILocalVariable(name: "buf", arg: 2, scope: !1625, file: !1619, line: 55, type: !237)
!1629 = !DILocalVariable(name: "i", scope: !1625, file: !1619, line: 56, type: !14)
!1630 = !DILocation(line: 60, column: 8, scope: !1631)
!1631 = distinct !DILexicalBlock(scope: !1625, file: !1619, line: 60, column: 3)
!1632 = !DILocation(line: 60, scope: !1631)
!1633 = !DILocation(line: 60, column: 17, scope: !1634)
!1634 = distinct !DILexicalBlock(scope: !1631, file: !1619, line: 60, column: 3)
!1635 = !DILocation(line: 60, column: 3, scope: !1631)
!1636 = !DILocation(line: 61, column: 37, scope: !1637)
!1637 = distinct !DILexicalBlock(scope: !1634, file: !1619, line: 60, column: 37)
!1638 = !DILocation(line: 61, column: 33, scope: !1637)
!1639 = !DILocation(line: 61, column: 9, scope: !1637)
!1640 = !DILocalVariable(name: "t", scope: !1625, file: !1619, line: 57, type: !65)
!1641 = !DILocation(line: 62, column: 11, scope: !1637)
!1642 = !DILocalVariable(name: "d", scope: !1625, file: !1619, line: 57, type: !65)
!1643 = !DILocation(line: 63, column: 13, scope: !1637)
!1644 = !DILocation(line: 63, column: 19, scope: !1637)
!1645 = !DILocation(line: 63, column: 7, scope: !1637)
!1646 = !DILocalVariable(name: "j", scope: !1625, file: !1619, line: 56, type: !14)
!1647 = !DILocation(line: 65, column: 10, scope: !1648)
!1648 = distinct !DILexicalBlock(scope: !1637, file: !1619, line: 65, column: 5)
!1649 = !DILocation(line: 65, scope: !1648)
!1650 = !DILocation(line: 65, column: 19, scope: !1651)
!1651 = distinct !DILexicalBlock(scope: !1648, file: !1619, line: 65, column: 5)
!1652 = !DILocation(line: 65, column: 5, scope: !1648)
!1653 = !DILocation(line: 66, column: 20, scope: !1654)
!1654 = distinct !DILexicalBlock(scope: !1651, file: !1619, line: 65, column: 29)
!1655 = !DILocation(line: 66, column: 14, scope: !1654)
!1656 = !DILocation(line: 66, column: 11, scope: !1654)
!1657 = !DILocalVariable(name: "a", scope: !1625, file: !1619, line: 58, type: !36)
!1658 = !DILocation(line: 67, column: 20, scope: !1654)
!1659 = !DILocation(line: 67, column: 24, scope: !1654)
!1660 = !DILocation(line: 67, column: 14, scope: !1654)
!1661 = !DILocation(line: 67, column: 11, scope: !1654)
!1662 = !DILocalVariable(name: "b", scope: !1625, file: !1619, line: 58, type: !36)
!1663 = !DILocation(line: 68, column: 27, scope: !1654)
!1664 = !DILocation(line: 68, column: 25, scope: !1654)
!1665 = !DILocation(line: 68, column: 14, scope: !1654)
!1666 = !DILocation(line: 68, column: 18, scope: !1654)
!1667 = !DILocation(line: 68, column: 7, scope: !1654)
!1668 = !DILocation(line: 68, column: 23, scope: !1654)
!1669 = !DILocation(line: 65, column: 25, scope: !1651)
!1670 = !DILocation(line: 65, column: 5, scope: !1651)
!1671 = distinct !{!1671, !1652, !1672, !107}
!1672 = !DILocation(line: 69, column: 5, scope: !1648)
!1673 = !DILocation(line: 60, column: 33, scope: !1634)
!1674 = !DILocation(line: 60, column: 3, scope: !1634)
!1675 = distinct !{!1675, !1635, !1676, !107}
!1676 = !DILocation(line: 70, column: 3, scope: !1631)
!1677 = !DILocation(line: 71, column: 1, scope: !1625)
!1678 = distinct !DISubprogram(name: "load32_littleendian", scope: !1619, file: !1619, line: 15, type: !1679, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !69, retainedNodes: !24)
!1679 = !DISubroutineType(types: !1680)
!1680 = !{!65, !237}
!1681 = !DILocalVariable(name: "x", arg: 1, scope: !1678, file: !1619, line: 15, type: !237)
!1682 = !DILocation(line: 0, scope: !1678)
!1683 = !DILocation(line: 17, column: 17, scope: !1678)
!1684 = !DILocation(line: 17, column: 7, scope: !1678)
!1685 = !DILocalVariable(name: "r", scope: !1678, file: !1619, line: 16, type: !65)
!1686 = !DILocation(line: 18, column: 18, scope: !1678)
!1687 = !DILocation(line: 18, column: 8, scope: !1678)
!1688 = !DILocation(line: 18, column: 23, scope: !1678)
!1689 = !DILocation(line: 18, column: 5, scope: !1678)
!1690 = !DILocation(line: 19, column: 18, scope: !1678)
!1691 = !DILocation(line: 19, column: 8, scope: !1678)
!1692 = !DILocation(line: 19, column: 23, scope: !1678)
!1693 = !DILocation(line: 19, column: 5, scope: !1678)
!1694 = !DILocation(line: 20, column: 18, scope: !1678)
!1695 = !DILocation(line: 20, column: 8, scope: !1678)
!1696 = !DILocation(line: 20, column: 23, scope: !1678)
!1697 = !DILocation(line: 20, column: 5, scope: !1678)
!1698 = !DILocation(line: 21, column: 3, scope: !1678)
!1699 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_poly_cbd_eta2", scope: !1619, file: !1619, line: 115, type: !1080, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !69, retainedNodes: !24)
!1700 = !DILocalVariable(name: "r", arg: 1, scope: !1699, file: !1619, line: 115, type: !634)
!1701 = !DILocation(line: 0, scope: !1699)
!1702 = !DILocalVariable(name: "buf", arg: 2, scope: !1699, file: !1619, line: 115, type: !237)
!1703 = !DILocation(line: 117, column: 3, scope: !1699)
!1704 = !DILocation(line: 121, column: 1, scope: !1699)
!1705 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_montgomery_reduce", scope: !1706, file: !1706, line: 16, type: !1707, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !71, retainedNodes: !24)
!1706 = !DIFile(filename: "../../../ref/reduce.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!1707 = !DISubroutineType(types: !72)
!1708 = !DILocalVariable(name: "a", arg: 1, scope: !1705, file: !1706, line: 16, type: !30)
!1709 = !DILocation(line: 0, scope: !1705)
!1710 = !DILocalVariable(name: "t", scope: !1705, file: !1706, line: 18, type: !36)
!1711 = !DILocation(line: 21, column: 12, scope: !1705)
!1712 = !DILocation(line: 21, column: 22, scope: !1705)
!1713 = !DILocation(line: 21, column: 10, scope: !1705)
!1714 = !DILocation(line: 21, column: 32, scope: !1705)
!1715 = !DILocation(line: 21, column: 7, scope: !1705)
!1716 = !DILocation(line: 22, column: 3, scope: !1705)
!1717 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_barrett_reduce", scope: !1706, file: !1706, line: 35, type: !1718, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !71, retainedNodes: !24)
!1718 = !DISubroutineType(types: !1719)
!1719 = !{!36, !36}
!1720 = !DILocalVariable(name: "a", arg: 1, scope: !1717, file: !1706, line: 35, type: !36)
!1721 = !DILocation(line: 0, scope: !1717)
!1722 = !DILocalVariable(name: "v", scope: !1717, file: !1706, line: 37, type: !35)
!1723 = !DILocation(line: 39, column: 20, scope: !1717)
!1724 = !DILocation(line: 39, column: 19, scope: !1717)
!1725 = !DILocation(line: 39, column: 22, scope: !1717)
!1726 = !DILocation(line: 39, column: 33, scope: !1717)
!1727 = !DILocalVariable(name: "t", scope: !1717, file: !1706, line: 36, type: !36)
!1728 = !DILocation(line: 41, column: 10, scope: !1717)
!1729 = !DILocation(line: 41, column: 3, scope: !1717)
!1730 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_verify", scope: !1731, file: !1731, line: 16, type: !1732, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !73, retainedNodes: !24)
!1731 = !DIFile(filename: "../../../ref/verify.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!1732 = !DISubroutineType(types: !1733)
!1733 = !{!25, !237, !237, !12}
!1734 = !DILocalVariable(name: "a", arg: 1, scope: !1730, file: !1731, line: 16, type: !237)
!1735 = !DILocation(line: 0, scope: !1730)
!1736 = !DILocalVariable(name: "b", arg: 2, scope: !1730, file: !1731, line: 16, type: !237)
!1737 = !DILocalVariable(name: "len", arg: 3, scope: !1730, file: !1731, line: 16, type: !12)
!1738 = !DILocalVariable(name: "r", scope: !1730, file: !1731, line: 19, type: !7)
!1739 = !DILocalVariable(name: "i", scope: !1730, file: !1731, line: 18, type: !12)
!1740 = !DILocation(line: 21, column: 7, scope: !1741)
!1741 = distinct !DILexicalBlock(scope: !1730, file: !1731, line: 21, column: 3)
!1742 = !DILocation(line: 21, scope: !1741)
!1743 = !DILocation(line: 21, column: 12, scope: !1744)
!1744 = distinct !DILexicalBlock(scope: !1741, file: !1731, line: 21, column: 3)
!1745 = !DILocation(line: 21, column: 3, scope: !1741)
!1746 = !DILocation(line: 22, column: 10, scope: !1744)
!1747 = !DILocation(line: 22, column: 17, scope: !1744)
!1748 = !DILocation(line: 22, column: 15, scope: !1744)
!1749 = !DILocation(line: 22, column: 7, scope: !1744)
!1750 = !DILocation(line: 21, column: 18, scope: !1744)
!1751 = !DILocation(line: 21, column: 3, scope: !1744)
!1752 = distinct !{!1752, !1745, !1753, !107}
!1753 = !DILocation(line: 22, column: 20, scope: !1741)
!1754 = !DILocation(line: 24, column: 25, scope: !1730)
!1755 = !DILocation(line: 24, column: 10, scope: !1730)
!1756 = !DILocation(line: 24, column: 3, scope: !1730)
!1757 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_cmov", scope: !1731, file: !1731, line: 40, type: !1758, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !73, retainedNodes: !24)
!1758 = !DISubroutineType(types: !1759)
!1759 = !{null, !6, !237, !12, !7}
!1760 = !DILocalVariable(name: "r", arg: 1, scope: !1757, file: !1731, line: 40, type: !6)
!1761 = !DILocation(line: 0, scope: !1757)
!1762 = !DILocalVariable(name: "x", arg: 2, scope: !1757, file: !1731, line: 40, type: !237)
!1763 = !DILocalVariable(name: "len", arg: 3, scope: !1757, file: !1731, line: 40, type: !12)
!1764 = !DILocalVariable(name: "b", arg: 4, scope: !1757, file: !1731, line: 40, type: !7)
!1765 = !DILocation(line: 51, column: 3, scope: !1757)
!1766 = !{i64 1722}
!1767 = !DILocation(line: 54, column: 7, scope: !1757)
!1768 = !DILocalVariable(name: "i", scope: !1757, file: !1731, line: 42, type: !12)
!1769 = !DILocation(line: 55, column: 7, scope: !1770)
!1770 = distinct !DILexicalBlock(scope: !1757, file: !1731, line: 55, column: 3)
!1771 = !DILocation(line: 55, scope: !1770)
!1772 = !DILocation(line: 55, column: 12, scope: !1773)
!1773 = distinct !DILexicalBlock(scope: !1770, file: !1731, line: 55, column: 3)
!1774 = !DILocation(line: 55, column: 3, scope: !1770)
!1775 = !DILocation(line: 56, column: 18, scope: !1773)
!1776 = !DILocation(line: 56, column: 25, scope: !1773)
!1777 = !DILocation(line: 56, column: 23, scope: !1773)
!1778 = !DILocation(line: 56, column: 15, scope: !1773)
!1779 = !DILocation(line: 56, column: 5, scope: !1773)
!1780 = !DILocation(line: 56, column: 10, scope: !1773)
!1781 = !DILocation(line: 55, column: 18, scope: !1773)
!1782 = !DILocation(line: 55, column: 3, scope: !1773)
!1783 = distinct !{!1783, !1774, !1784, !107}
!1784 = !DILocation(line: 56, column: 29, scope: !1770)
!1785 = !DILocation(line: 57, column: 1, scope: !1757)
!1786 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_cmov_int16", scope: !1731, file: !1731, line: 71, type: !1787, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !73, retainedNodes: !24)
!1787 = !DISubroutineType(types: !1788)
!1788 = !{null, !403, !36, !60}
!1789 = !DILocalVariable(name: "r", arg: 1, scope: !1786, file: !1731, line: 71, type: !403)
!1790 = !DILocation(line: 0, scope: !1786)
!1791 = !DILocalVariable(name: "v", arg: 2, scope: !1786, file: !1731, line: 71, type: !36)
!1792 = !DILocalVariable(name: "b", arg: 3, scope: !1786, file: !1731, line: 71, type: !60)
!1793 = !DILocation(line: 73, column: 7, scope: !1786)
!1794 = !DILocation(line: 74, column: 15, scope: !1786)
!1795 = !DILocation(line: 74, column: 19, scope: !1786)
!1796 = !DILocation(line: 74, column: 11, scope: !1786)
!1797 = !DILocation(line: 74, column: 6, scope: !1786)
!1798 = !DILocation(line: 75, column: 1, scope: !1786)
!1799 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_init", scope: !49, file: !49, line: 497, type: !1800, scopeLine: 497, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!1800 = !DISubroutineType(types: !1801)
!1801 = !{null, !1802}
!1802 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !349, size: 32)
!1803 = !DILocalVariable(name: "state", arg: 1, scope: !1799, file: !49, line: 497, type: !1802)
!1804 = !DILocation(line: 0, scope: !1799)
!1805 = !DILocation(line: 498, column: 3, scope: !1799)
!1806 = !DILocation(line: 499, column: 3, scope: !1799)
!1807 = !DILocation(line: 499, column: 29, scope: !1799)
!1808 = !DILocation(line: 500, column: 1, scope: !1799)
!1809 = distinct !DISubprogram(name: "keccak_init", scope: !49, file: !49, line: 340, type: !1810, scopeLine: 340, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!1810 = !DISubroutineType(types: !1811)
!1811 = !{null, !1812}
!1812 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 32)
!1813 = !DILocalVariable(name: "s", arg: 1, scope: !1809, file: !49, line: 340, type: !1812)
!1814 = !DILocation(line: 0, scope: !1809)
!1815 = !DILocalVariable(name: "i", scope: !1809, file: !49, line: 341, type: !14)
!1816 = !DILocation(line: 342, column: 8, scope: !1817)
!1817 = distinct !DILexicalBlock(scope: !1809, file: !49, line: 342, column: 3)
!1818 = !DILocation(line: 342, scope: !1817)
!1819 = !DILocation(line: 342, column: 17, scope: !1820)
!1820 = distinct !DILexicalBlock(scope: !1817, file: !49, line: 342, column: 3)
!1821 = !DILocation(line: 342, column: 3, scope: !1817)
!1822 = !DILocation(line: 343, column: 5, scope: !1820)
!1823 = !DILocation(line: 343, column: 10, scope: !1820)
!1824 = !DILocation(line: 342, column: 24, scope: !1820)
!1825 = !DILocation(line: 342, column: 3, scope: !1820)
!1826 = distinct !{!1826, !1821, !1827, !107}
!1827 = !DILocation(line: 343, column: 12, scope: !1817)
!1828 = !DILocation(line: 344, column: 1, scope: !1809)
!1829 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb", scope: !49, file: !49, line: 512, type: !1830, scopeLine: 512, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!1830 = !DISubroutineType(types: !1831)
!1831 = !{null, !1802, !237, !12}
!1832 = !DILocalVariable(name: "state", arg: 1, scope: !1829, file: !49, line: 512, type: !1802)
!1833 = !DILocation(line: 0, scope: !1829)
!1834 = !DILocalVariable(name: "in", arg: 2, scope: !1829, file: !49, line: 512, type: !237)
!1835 = !DILocalVariable(name: "inlen", arg: 3, scope: !1829, file: !49, line: 512, type: !12)
!1836 = !DILocation(line: 513, column: 53, scope: !1829)
!1837 = !DILocation(line: 513, column: 31, scope: !1829)
!1838 = !DILocation(line: 513, column: 3, scope: !1829)
!1839 = !DILocation(line: 513, column: 29, scope: !1829)
!1840 = !DILocation(line: 515, column: 1, scope: !1829)
!1841 = distinct !DISubprogram(name: "keccak_absorb", scope: !49, file: !49, line: 359, type: !1842, scopeLine: 361, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!1842 = !DISubroutineType(types: !1843)
!1843 = !{!14, !1812, !14, !14, !237, !12}
!1844 = !DILocalVariable(name: "s", arg: 1, scope: !1841, file: !49, line: 359, type: !1812)
!1845 = !DILocation(line: 0, scope: !1841)
!1846 = !DILocalVariable(name: "pos", arg: 2, scope: !1841, file: !49, line: 359, type: !14)
!1847 = !DILocalVariable(name: "r", arg: 3, scope: !1841, file: !49, line: 360, type: !14)
!1848 = !DILocalVariable(name: "in", arg: 4, scope: !1841, file: !49, line: 360, type: !237)
!1849 = !DILocalVariable(name: "inlen", arg: 5, scope: !1841, file: !49, line: 361, type: !12)
!1850 = !DILocation(line: 364, column: 3, scope: !1841)
!1851 = !DILocation(line: 364, column: 14, scope: !1841)
!1852 = !DILocation(line: 364, column: 22, scope: !1841)
!1853 = !DILocation(line: 365, column: 5, scope: !1854)
!1854 = distinct !DILexicalBlock(scope: !1855, file: !49, line: 365, column: 5)
!1855 = distinct !DILexicalBlock(scope: !1841, file: !49, line: 364, column: 28)
!1856 = !DILocation(line: 372, column: 3, scope: !1857)
!1857 = distinct !DILexicalBlock(scope: !1841, file: !49, line: 372, column: 3)
!1858 = !DILocation(line: 365, scope: !1854)
!1859 = !DILocalVariable(name: "i", scope: !1841, file: !49, line: 362, type: !14)
!1860 = !DILocation(line: 365, column: 21, scope: !1861)
!1861 = distinct !DILexicalBlock(scope: !1854, file: !49, line: 365, column: 5)
!1862 = !DILocation(line: 366, column: 29, scope: !1861)
!1863 = !DILocation(line: 366, column: 19, scope: !1861)
!1864 = !DILocation(line: 366, column: 40, scope: !1861)
!1865 = !DILocation(line: 366, column: 35, scope: !1861)
!1866 = !DILocation(line: 366, column: 11, scope: !1861)
!1867 = !DILocation(line: 366, column: 7, scope: !1861)
!1868 = !DILocation(line: 366, column: 16, scope: !1861)
!1869 = !DILocation(line: 366, column: 32, scope: !1861)
!1870 = !DILocation(line: 365, column: 27, scope: !1861)
!1871 = !DILocation(line: 365, column: 5, scope: !1861)
!1872 = distinct !{!1872, !1853, !1873, !107}
!1873 = !DILocation(line: 366, column: 48, scope: !1854)
!1874 = !DILocation(line: 367, column: 16, scope: !1855)
!1875 = !DILocation(line: 367, column: 11, scope: !1855)
!1876 = !DILocation(line: 368, column: 5, scope: !1855)
!1877 = distinct !{!1877, !1850, !1878, !107}
!1878 = !DILocation(line: 370, column: 3, scope: !1841)
!1879 = !DILocation(line: 372, scope: !1857)
!1880 = !DILocation(line: 372, column: 25, scope: !1881)
!1881 = distinct !DILexicalBlock(scope: !1857, file: !49, line: 372, column: 3)
!1882 = !DILocation(line: 372, column: 19, scope: !1881)
!1883 = !DILocation(line: 373, column: 27, scope: !1881)
!1884 = !DILocation(line: 373, column: 17, scope: !1881)
!1885 = !DILocation(line: 373, column: 38, scope: !1881)
!1886 = !DILocation(line: 373, column: 33, scope: !1881)
!1887 = !DILocation(line: 373, column: 9, scope: !1881)
!1888 = !DILocation(line: 373, column: 5, scope: !1881)
!1889 = !DILocation(line: 373, column: 14, scope: !1881)
!1890 = !DILocation(line: 373, column: 30, scope: !1881)
!1891 = !DILocation(line: 372, column: 35, scope: !1881)
!1892 = !DILocation(line: 372, column: 3, scope: !1881)
!1893 = distinct !{!1893, !1856, !1894, !107}
!1894 = !DILocation(line: 373, column: 46, scope: !1857)
!1895 = !DILocation(line: 375, column: 3, scope: !1841)
!1896 = distinct !DISubprogram(name: "KeccakF1600_StatePermute", scope: !49, file: !49, line: 70, type: !1810, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!1897 = !DILocalVariable(name: "state", arg: 1, scope: !1896, file: !49, line: 70, type: !1812)
!1898 = !DILocation(line: 0, scope: !1896)
!1899 = !DILocation(line: 87, column: 9, scope: !1896)
!1900 = !DILocalVariable(name: "Aba", scope: !1896, file: !49, line: 73, type: !45)
!1901 = !DILocation(line: 88, column: 9, scope: !1896)
!1902 = !DILocalVariable(name: "Abe", scope: !1896, file: !49, line: 73, type: !45)
!1903 = !DILocation(line: 89, column: 9, scope: !1896)
!1904 = !DILocalVariable(name: "Abi", scope: !1896, file: !49, line: 73, type: !45)
!1905 = !DILocation(line: 90, column: 9, scope: !1896)
!1906 = !DILocalVariable(name: "Abo", scope: !1896, file: !49, line: 73, type: !45)
!1907 = !DILocation(line: 91, column: 9, scope: !1896)
!1908 = !DILocalVariable(name: "Abu", scope: !1896, file: !49, line: 73, type: !45)
!1909 = !DILocation(line: 92, column: 9, scope: !1896)
!1910 = !DILocalVariable(name: "Aga", scope: !1896, file: !49, line: 74, type: !45)
!1911 = !DILocation(line: 93, column: 9, scope: !1896)
!1912 = !DILocalVariable(name: "Age", scope: !1896, file: !49, line: 74, type: !45)
!1913 = !DILocation(line: 94, column: 9, scope: !1896)
!1914 = !DILocalVariable(name: "Agi", scope: !1896, file: !49, line: 74, type: !45)
!1915 = !DILocation(line: 95, column: 9, scope: !1896)
!1916 = !DILocalVariable(name: "Ago", scope: !1896, file: !49, line: 74, type: !45)
!1917 = !DILocation(line: 96, column: 9, scope: !1896)
!1918 = !DILocalVariable(name: "Agu", scope: !1896, file: !49, line: 74, type: !45)
!1919 = !DILocation(line: 97, column: 9, scope: !1896)
!1920 = !DILocalVariable(name: "Aka", scope: !1896, file: !49, line: 75, type: !45)
!1921 = !DILocation(line: 98, column: 9, scope: !1896)
!1922 = !DILocalVariable(name: "Ake", scope: !1896, file: !49, line: 75, type: !45)
!1923 = !DILocation(line: 99, column: 9, scope: !1896)
!1924 = !DILocalVariable(name: "Aki", scope: !1896, file: !49, line: 75, type: !45)
!1925 = !DILocation(line: 100, column: 9, scope: !1896)
!1926 = !DILocalVariable(name: "Ako", scope: !1896, file: !49, line: 75, type: !45)
!1927 = !DILocation(line: 101, column: 9, scope: !1896)
!1928 = !DILocalVariable(name: "Aku", scope: !1896, file: !49, line: 75, type: !45)
!1929 = !DILocation(line: 102, column: 9, scope: !1896)
!1930 = !DILocalVariable(name: "Ama", scope: !1896, file: !49, line: 76, type: !45)
!1931 = !DILocation(line: 103, column: 9, scope: !1896)
!1932 = !DILocalVariable(name: "Ame", scope: !1896, file: !49, line: 76, type: !45)
!1933 = !DILocation(line: 104, column: 9, scope: !1896)
!1934 = !DILocalVariable(name: "Ami", scope: !1896, file: !49, line: 76, type: !45)
!1935 = !DILocation(line: 105, column: 9, scope: !1896)
!1936 = !DILocalVariable(name: "Amo", scope: !1896, file: !49, line: 76, type: !45)
!1937 = !DILocation(line: 106, column: 9, scope: !1896)
!1938 = !DILocalVariable(name: "Amu", scope: !1896, file: !49, line: 76, type: !45)
!1939 = !DILocation(line: 107, column: 9, scope: !1896)
!1940 = !DILocalVariable(name: "Asa", scope: !1896, file: !49, line: 77, type: !45)
!1941 = !DILocation(line: 108, column: 9, scope: !1896)
!1942 = !DILocalVariable(name: "Ase", scope: !1896, file: !49, line: 77, type: !45)
!1943 = !DILocation(line: 109, column: 9, scope: !1896)
!1944 = !DILocalVariable(name: "Asi", scope: !1896, file: !49, line: 77, type: !45)
!1945 = !DILocation(line: 110, column: 9, scope: !1896)
!1946 = !DILocalVariable(name: "Aso", scope: !1896, file: !49, line: 77, type: !45)
!1947 = !DILocation(line: 111, column: 9, scope: !1896)
!1948 = !DILocalVariable(name: "Asu", scope: !1896, file: !49, line: 77, type: !45)
!1949 = !DILocalVariable(name: "round", scope: !1896, file: !49, line: 71, type: !25)
!1950 = !DILocation(line: 113, column: 8, scope: !1951)
!1951 = distinct !DILexicalBlock(scope: !1896, file: !49, line: 113, column: 3)
!1952 = !DILocation(line: 113, scope: !1951)
!1953 = !DILocation(line: 113, column: 25, scope: !1954)
!1954 = distinct !DILexicalBlock(scope: !1951, file: !49, line: 113, column: 3)
!1955 = !DILocation(line: 113, column: 3, scope: !1951)
!1956 = !DILocalVariable(name: "BCa", scope: !1896, file: !49, line: 78, type: !45)
!1957 = !DILocalVariable(name: "BCe", scope: !1896, file: !49, line: 78, type: !45)
!1958 = !DILocalVariable(name: "BCi", scope: !1896, file: !49, line: 78, type: !45)
!1959 = !DILocalVariable(name: "BCo", scope: !1896, file: !49, line: 78, type: !45)
!1960 = !DILocalVariable(name: "BCu", scope: !1896, file: !49, line: 78, type: !45)
!1961 = !DILocalVariable(name: "Da", scope: !1896, file: !49, line: 79, type: !45)
!1962 = !DILocalVariable(name: "De", scope: !1896, file: !49, line: 79, type: !45)
!1963 = !DILocalVariable(name: "Di", scope: !1896, file: !49, line: 79, type: !45)
!1964 = !DILocalVariable(name: "Do", scope: !1896, file: !49, line: 79, type: !45)
!1965 = !DILocalVariable(name: "Du", scope: !1896, file: !49, line: 79, type: !45)
!1966 = !DILocalVariable(name: "Eba", scope: !1896, file: !49, line: 80, type: !45)
!1967 = !DILocalVariable(name: "Ebe", scope: !1896, file: !49, line: 80, type: !45)
!1968 = !DILocalVariable(name: "Ebi", scope: !1896, file: !49, line: 80, type: !45)
!1969 = !DILocalVariable(name: "Ebo", scope: !1896, file: !49, line: 80, type: !45)
!1970 = !DILocalVariable(name: "Ebu", scope: !1896, file: !49, line: 80, type: !45)
!1971 = !DILocalVariable(name: "Ega", scope: !1896, file: !49, line: 81, type: !45)
!1972 = !DILocalVariable(name: "Ege", scope: !1896, file: !49, line: 81, type: !45)
!1973 = !DILocalVariable(name: "Egi", scope: !1896, file: !49, line: 81, type: !45)
!1974 = !DILocalVariable(name: "Ego", scope: !1896, file: !49, line: 81, type: !45)
!1975 = !DILocalVariable(name: "Egu", scope: !1896, file: !49, line: 81, type: !45)
!1976 = !DILocalVariable(name: "Eka", scope: !1896, file: !49, line: 82, type: !45)
!1977 = !DILocalVariable(name: "Eke", scope: !1896, file: !49, line: 82, type: !45)
!1978 = !DILocalVariable(name: "Eki", scope: !1896, file: !49, line: 82, type: !45)
!1979 = !DILocalVariable(name: "Eko", scope: !1896, file: !49, line: 82, type: !45)
!1980 = !DILocalVariable(name: "Eku", scope: !1896, file: !49, line: 82, type: !45)
!1981 = !DILocalVariable(name: "Ema", scope: !1896, file: !49, line: 83, type: !45)
!1982 = !DILocalVariable(name: "Eme", scope: !1896, file: !49, line: 83, type: !45)
!1983 = !DILocalVariable(name: "Emi", scope: !1896, file: !49, line: 83, type: !45)
!1984 = !DILocalVariable(name: "Emo", scope: !1896, file: !49, line: 83, type: !45)
!1985 = !DILocalVariable(name: "Emu", scope: !1896, file: !49, line: 83, type: !45)
!1986 = !DILocalVariable(name: "Esa", scope: !1896, file: !49, line: 84, type: !45)
!1987 = !DILocalVariable(name: "Ese", scope: !1896, file: !49, line: 84, type: !45)
!1988 = !DILocalVariable(name: "Esi", scope: !1896, file: !49, line: 84, type: !45)
!1989 = !DILocalVariable(name: "Eso", scope: !1896, file: !49, line: 84, type: !45)
!1990 = !DILocalVariable(name: "Esu", scope: !1896, file: !49, line: 84, type: !45)
!1991 = !DILocation(line: 117, column: 15, scope: !1992)
!1992 = distinct !DILexicalBlock(scope: !1954, file: !49, line: 113, column: 48)
!1993 = !DILocation(line: 117, column: 21, scope: !1992)
!1994 = !DILocation(line: 117, column: 27, scope: !1992)
!1995 = !DILocation(line: 117, column: 33, scope: !1992)
!1996 = !DILocation(line: 119, column: 15, scope: !1992)
!1997 = !DILocation(line: 119, column: 21, scope: !1992)
!1998 = !DILocation(line: 119, column: 27, scope: !1992)
!1999 = !DILocation(line: 119, column: 33, scope: !1992)
!2000 = !DILocation(line: 125, column: 16, scope: !1992)
!2001 = !DILocation(line: 125, column: 14, scope: !1992)
!2002 = !DILocation(line: 195, column: 9, scope: !1992)
!2003 = !DILocation(line: 196, column: 11, scope: !1992)
!2004 = !DILocation(line: 116, column: 15, scope: !1992)
!2005 = !DILocation(line: 116, column: 21, scope: !1992)
!2006 = !DILocation(line: 116, column: 27, scope: !1992)
!2007 = !DILocation(line: 116, column: 33, scope: !1992)
!2008 = !DILocation(line: 122, column: 16, scope: !1992)
!2009 = !DILocation(line: 122, column: 14, scope: !1992)
!2010 = !DILocation(line: 199, column: 9, scope: !1992)
!2011 = !DILocation(line: 200, column: 11, scope: !1992)
!2012 = !DILocation(line: 118, column: 15, scope: !1992)
!2013 = !DILocation(line: 118, column: 21, scope: !1992)
!2014 = !DILocation(line: 118, column: 27, scope: !1992)
!2015 = !DILocation(line: 118, column: 33, scope: !1992)
!2016 = !DILocation(line: 115, column: 15, scope: !1992)
!2017 = !DILocation(line: 115, column: 21, scope: !1992)
!2018 = !DILocation(line: 115, column: 27, scope: !1992)
!2019 = !DILocation(line: 115, column: 33, scope: !1992)
!2020 = !DILocation(line: 126, column: 16, scope: !1992)
!2021 = !DILocation(line: 126, column: 14, scope: !1992)
!2022 = !DILocation(line: 197, column: 9, scope: !1992)
!2023 = !DILocation(line: 198, column: 11, scope: !1992)
!2024 = !DILocation(line: 204, column: 19, scope: !1992)
!2025 = !DILocation(line: 204, column: 25, scope: !1992)
!2026 = !DILocation(line: 204, column: 15, scope: !1992)
!2027 = !DILocation(line: 124, column: 16, scope: !1992)
!2028 = !DILocation(line: 124, column: 14, scope: !1992)
!2029 = !DILocation(line: 132, column: 9, scope: !1992)
!2030 = !DILocation(line: 133, column: 11, scope: !1992)
!2031 = !DILocation(line: 123, column: 16, scope: !1992)
!2032 = !DILocation(line: 123, column: 14, scope: !1992)
!2033 = !DILocation(line: 130, column: 9, scope: !1992)
!2034 = !DILocation(line: 131, column: 11, scope: !1992)
!2035 = !DILocation(line: 138, column: 19, scope: !1992)
!2036 = !DILocation(line: 138, column: 25, scope: !1992)
!2037 = !DILocation(line: 139, column: 22, scope: !1992)
!2038 = !DILocation(line: 139, column: 9, scope: !1992)
!2039 = !DILocation(line: 128, column: 9, scope: !1992)
!2040 = !DILocation(line: 145, column: 9, scope: !1992)
!2041 = !DILocation(line: 146, column: 11, scope: !1992)
!2042 = !DILocation(line: 149, column: 9, scope: !1992)
!2043 = !DILocation(line: 150, column: 11, scope: !1992)
!2044 = !DILocation(line: 147, column: 9, scope: !1992)
!2045 = !DILocation(line: 148, column: 11, scope: !1992)
!2046 = !DILocation(line: 155, column: 19, scope: !1992)
!2047 = !DILocation(line: 155, column: 25, scope: !1992)
!2048 = !DILocation(line: 155, column: 15, scope: !1992)
!2049 = !DILocation(line: 210, column: 15, scope: !1992)
!2050 = !DILocation(line: 161, column: 9, scope: !1992)
!2051 = !DILocation(line: 162, column: 11, scope: !1992)
!2052 = !DILocation(line: 165, column: 9, scope: !1992)
!2053 = !DILocation(line: 166, column: 11, scope: !1992)
!2054 = !DILocation(line: 163, column: 9, scope: !1992)
!2055 = !DILocation(line: 164, column: 11, scope: !1992)
!2056 = !DILocation(line: 171, column: 19, scope: !1992)
!2057 = !DILocation(line: 171, column: 25, scope: !1992)
!2058 = !DILocation(line: 171, column: 15, scope: !1992)
!2059 = !DILocation(line: 210, column: 21, scope: !1992)
!2060 = !DILocation(line: 177, column: 9, scope: !1992)
!2061 = !DILocation(line: 178, column: 11, scope: !1992)
!2062 = !DILocation(line: 181, column: 9, scope: !1992)
!2063 = !DILocation(line: 182, column: 11, scope: !1992)
!2064 = !DILocation(line: 179, column: 9, scope: !1992)
!2065 = !DILocation(line: 180, column: 11, scope: !1992)
!2066 = !DILocation(line: 187, column: 19, scope: !1992)
!2067 = !DILocation(line: 187, column: 25, scope: !1992)
!2068 = !DILocation(line: 187, column: 15, scope: !1992)
!2069 = !DILocation(line: 210, column: 27, scope: !1992)
!2070 = !DILocation(line: 193, column: 9, scope: !1992)
!2071 = !DILocation(line: 194, column: 11, scope: !1992)
!2072 = !DILocation(line: 203, column: 19, scope: !1992)
!2073 = !DILocation(line: 203, column: 25, scope: !1992)
!2074 = !DILocation(line: 203, column: 15, scope: !1992)
!2075 = !DILocation(line: 210, column: 33, scope: !1992)
!2076 = !DILocation(line: 136, column: 9, scope: !1992)
!2077 = !DILocation(line: 137, column: 11, scope: !1992)
!2078 = !DILocation(line: 134, column: 9, scope: !1992)
!2079 = !DILocation(line: 135, column: 11, scope: !1992)
!2080 = !DILocation(line: 141, column: 19, scope: !1992)
!2081 = !DILocation(line: 141, column: 25, scope: !1992)
!2082 = !DILocation(line: 141, column: 15, scope: !1992)
!2083 = !DILocation(line: 153, column: 9, scope: !1992)
!2084 = !DILocation(line: 154, column: 11, scope: !1992)
!2085 = !DILocation(line: 151, column: 9, scope: !1992)
!2086 = !DILocation(line: 152, column: 11, scope: !1992)
!2087 = !DILocation(line: 157, column: 19, scope: !1992)
!2088 = !DILocation(line: 157, column: 25, scope: !1992)
!2089 = !DILocation(line: 157, column: 15, scope: !1992)
!2090 = !DILocation(line: 212, column: 15, scope: !1992)
!2091 = !DILocation(line: 169, column: 9, scope: !1992)
!2092 = !DILocation(line: 170, column: 11, scope: !1992)
!2093 = !DILocation(line: 167, column: 9, scope: !1992)
!2094 = !DILocation(line: 168, column: 11, scope: !1992)
!2095 = !DILocation(line: 173, column: 19, scope: !1992)
!2096 = !DILocation(line: 173, column: 25, scope: !1992)
!2097 = !DILocation(line: 173, column: 15, scope: !1992)
!2098 = !DILocation(line: 212, column: 21, scope: !1992)
!2099 = !DILocation(line: 185, column: 9, scope: !1992)
!2100 = !DILocation(line: 186, column: 11, scope: !1992)
!2101 = !DILocation(line: 183, column: 9, scope: !1992)
!2102 = !DILocation(line: 184, column: 11, scope: !1992)
!2103 = !DILocation(line: 189, column: 19, scope: !1992)
!2104 = !DILocation(line: 189, column: 25, scope: !1992)
!2105 = !DILocation(line: 189, column: 15, scope: !1992)
!2106 = !DILocation(line: 212, column: 27, scope: !1992)
!2107 = !DILocation(line: 201, column: 9, scope: !1992)
!2108 = !DILocation(line: 202, column: 11, scope: !1992)
!2109 = !DILocation(line: 205, column: 19, scope: !1992)
!2110 = !DILocation(line: 205, column: 25, scope: !1992)
!2111 = !DILocation(line: 205, column: 15, scope: !1992)
!2112 = !DILocation(line: 212, column: 33, scope: !1992)
!2113 = !DILocation(line: 218, column: 16, scope: !1992)
!2114 = !DILocation(line: 218, column: 14, scope: !1992)
!2115 = !DILocation(line: 296, column: 9, scope: !1992)
!2116 = !DILocation(line: 297, column: 11, scope: !1992)
!2117 = !DILocation(line: 158, column: 19, scope: !1992)
!2118 = !DILocation(line: 158, column: 25, scope: !1992)
!2119 = !DILocation(line: 158, column: 15, scope: !1992)
!2120 = !DILocation(line: 143, column: 19, scope: !1992)
!2121 = !DILocation(line: 143, column: 25, scope: !1992)
!2122 = !DILocation(line: 143, column: 15, scope: !1992)
!2123 = !DILocation(line: 159, column: 19, scope: !1992)
!2124 = !DILocation(line: 159, column: 25, scope: !1992)
!2125 = !DILocation(line: 159, column: 15, scope: !1992)
!2126 = !DILocation(line: 214, column: 15, scope: !1992)
!2127 = !DILocation(line: 175, column: 19, scope: !1992)
!2128 = !DILocation(line: 175, column: 25, scope: !1992)
!2129 = !DILocation(line: 175, column: 15, scope: !1992)
!2130 = !DILocation(line: 214, column: 21, scope: !1992)
!2131 = !DILocation(line: 191, column: 19, scope: !1992)
!2132 = !DILocation(line: 191, column: 25, scope: !1992)
!2133 = !DILocation(line: 191, column: 15, scope: !1992)
!2134 = !DILocation(line: 214, column: 27, scope: !1992)
!2135 = !DILocation(line: 207, column: 19, scope: !1992)
!2136 = !DILocation(line: 207, column: 25, scope: !1992)
!2137 = !DILocation(line: 207, column: 15, scope: !1992)
!2138 = !DILocation(line: 214, column: 33, scope: !1992)
!2139 = !DILocation(line: 220, column: 16, scope: !1992)
!2140 = !DILocation(line: 220, column: 14, scope: !1992)
!2141 = !DILocation(line: 290, column: 9, scope: !1992)
!2142 = !DILocation(line: 291, column: 11, scope: !1992)
!2143 = !DILocation(line: 140, column: 19, scope: !1992)
!2144 = !DILocation(line: 140, column: 25, scope: !1992)
!2145 = !DILocation(line: 140, column: 15, scope: !1992)
!2146 = !DILocation(line: 156, column: 19, scope: !1992)
!2147 = !DILocation(line: 156, column: 25, scope: !1992)
!2148 = !DILocation(line: 156, column: 15, scope: !1992)
!2149 = !DILocation(line: 211, column: 15, scope: !1992)
!2150 = !DILocation(line: 172, column: 19, scope: !1992)
!2151 = !DILocation(line: 172, column: 25, scope: !1992)
!2152 = !DILocation(line: 172, column: 15, scope: !1992)
!2153 = !DILocation(line: 211, column: 21, scope: !1992)
!2154 = !DILocation(line: 188, column: 19, scope: !1992)
!2155 = !DILocation(line: 188, column: 25, scope: !1992)
!2156 = !DILocation(line: 188, column: 15, scope: !1992)
!2157 = !DILocation(line: 211, column: 27, scope: !1992)
!2158 = !DILocation(line: 211, column: 33, scope: !1992)
!2159 = !DILocation(line: 142, column: 19, scope: !1992)
!2160 = !DILocation(line: 142, column: 25, scope: !1992)
!2161 = !DILocation(line: 142, column: 15, scope: !1992)
!2162 = !DILocation(line: 213, column: 15, scope: !1992)
!2163 = !DILocation(line: 174, column: 19, scope: !1992)
!2164 = !DILocation(line: 174, column: 25, scope: !1992)
!2165 = !DILocation(line: 174, column: 15, scope: !1992)
!2166 = !DILocation(line: 213, column: 21, scope: !1992)
!2167 = !DILocation(line: 190, column: 19, scope: !1992)
!2168 = !DILocation(line: 190, column: 25, scope: !1992)
!2169 = !DILocation(line: 190, column: 15, scope: !1992)
!2170 = !DILocation(line: 213, column: 27, scope: !1992)
!2171 = !DILocation(line: 206, column: 19, scope: !1992)
!2172 = !DILocation(line: 206, column: 25, scope: !1992)
!2173 = !DILocation(line: 206, column: 15, scope: !1992)
!2174 = !DILocation(line: 213, column: 33, scope: !1992)
!2175 = !DILocation(line: 219, column: 16, scope: !1992)
!2176 = !DILocation(line: 219, column: 14, scope: !1992)
!2177 = !DILocation(line: 288, column: 9, scope: !1992)
!2178 = !DILocation(line: 289, column: 11, scope: !1992)
!2179 = !DILocation(line: 302, column: 19, scope: !1992)
!2180 = !DILocation(line: 302, column: 25, scope: !1992)
!2181 = !DILocation(line: 302, column: 15, scope: !1992)
!2182 = !DILocation(line: 217, column: 16, scope: !1992)
!2183 = !DILocation(line: 217, column: 14, scope: !1992)
!2184 = !DILocation(line: 294, column: 9, scope: !1992)
!2185 = !DILocation(line: 295, column: 11, scope: !1992)
!2186 = !DILocation(line: 301, column: 19, scope: !1992)
!2187 = !DILocation(line: 301, column: 25, scope: !1992)
!2188 = !DILocation(line: 301, column: 15, scope: !1992)
!2189 = !DILocation(line: 221, column: 16, scope: !1992)
!2190 = !DILocation(line: 221, column: 14, scope: !1992)
!2191 = !DILocation(line: 292, column: 9, scope: !1992)
!2192 = !DILocation(line: 293, column: 11, scope: !1992)
!2193 = !DILocation(line: 300, column: 19, scope: !1992)
!2194 = !DILocation(line: 300, column: 25, scope: !1992)
!2195 = !DILocation(line: 300, column: 15, scope: !1992)
!2196 = !DILocation(line: 299, column: 19, scope: !1992)
!2197 = !DILocation(line: 299, column: 25, scope: !1992)
!2198 = !DILocation(line: 299, column: 15, scope: !1992)
!2199 = !DILocation(line: 298, column: 19, scope: !1992)
!2200 = !DILocation(line: 298, column: 25, scope: !1992)
!2201 = !DILocation(line: 298, column: 15, scope: !1992)
!2202 = !DILocation(line: 280, column: 9, scope: !1992)
!2203 = !DILocation(line: 281, column: 11, scope: !1992)
!2204 = !DILocation(line: 274, column: 9, scope: !1992)
!2205 = !DILocation(line: 275, column: 11, scope: !1992)
!2206 = !DILocation(line: 272, column: 9, scope: !1992)
!2207 = !DILocation(line: 273, column: 11, scope: !1992)
!2208 = !DILocation(line: 286, column: 19, scope: !1992)
!2209 = !DILocation(line: 286, column: 25, scope: !1992)
!2210 = !DILocation(line: 286, column: 15, scope: !1992)
!2211 = !DILocation(line: 278, column: 9, scope: !1992)
!2212 = !DILocation(line: 279, column: 11, scope: !1992)
!2213 = !DILocation(line: 285, column: 19, scope: !1992)
!2214 = !DILocation(line: 285, column: 25, scope: !1992)
!2215 = !DILocation(line: 285, column: 15, scope: !1992)
!2216 = !DILocation(line: 276, column: 9, scope: !1992)
!2217 = !DILocation(line: 277, column: 11, scope: !1992)
!2218 = !DILocation(line: 284, column: 19, scope: !1992)
!2219 = !DILocation(line: 284, column: 25, scope: !1992)
!2220 = !DILocation(line: 284, column: 15, scope: !1992)
!2221 = !DILocation(line: 283, column: 19, scope: !1992)
!2222 = !DILocation(line: 283, column: 25, scope: !1992)
!2223 = !DILocation(line: 283, column: 15, scope: !1992)
!2224 = !DILocation(line: 282, column: 19, scope: !1992)
!2225 = !DILocation(line: 282, column: 25, scope: !1992)
!2226 = !DILocation(line: 282, column: 15, scope: !1992)
!2227 = !DILocation(line: 264, column: 9, scope: !1992)
!2228 = !DILocation(line: 265, column: 11, scope: !1992)
!2229 = !DILocation(line: 258, column: 9, scope: !1992)
!2230 = !DILocation(line: 259, column: 11, scope: !1992)
!2231 = !DILocation(line: 256, column: 9, scope: !1992)
!2232 = !DILocation(line: 257, column: 11, scope: !1992)
!2233 = !DILocation(line: 270, column: 19, scope: !1992)
!2234 = !DILocation(line: 270, column: 25, scope: !1992)
!2235 = !DILocation(line: 270, column: 15, scope: !1992)
!2236 = !DILocation(line: 262, column: 9, scope: !1992)
!2237 = !DILocation(line: 263, column: 11, scope: !1992)
!2238 = !DILocation(line: 269, column: 19, scope: !1992)
!2239 = !DILocation(line: 269, column: 25, scope: !1992)
!2240 = !DILocation(line: 269, column: 15, scope: !1992)
!2241 = !DILocation(line: 260, column: 9, scope: !1992)
!2242 = !DILocation(line: 261, column: 11, scope: !1992)
!2243 = !DILocation(line: 268, column: 19, scope: !1992)
!2244 = !DILocation(line: 268, column: 25, scope: !1992)
!2245 = !DILocation(line: 268, column: 15, scope: !1992)
!2246 = !DILocation(line: 267, column: 19, scope: !1992)
!2247 = !DILocation(line: 267, column: 25, scope: !1992)
!2248 = !DILocation(line: 267, column: 15, scope: !1992)
!2249 = !DILocation(line: 266, column: 19, scope: !1992)
!2250 = !DILocation(line: 266, column: 25, scope: !1992)
!2251 = !DILocation(line: 266, column: 15, scope: !1992)
!2252 = !DILocation(line: 248, column: 9, scope: !1992)
!2253 = !DILocation(line: 249, column: 11, scope: !1992)
!2254 = !DILocation(line: 242, column: 9, scope: !1992)
!2255 = !DILocation(line: 243, column: 11, scope: !1992)
!2256 = !DILocation(line: 240, column: 9, scope: !1992)
!2257 = !DILocation(line: 241, column: 11, scope: !1992)
!2258 = !DILocation(line: 254, column: 19, scope: !1992)
!2259 = !DILocation(line: 254, column: 25, scope: !1992)
!2260 = !DILocation(line: 254, column: 15, scope: !1992)
!2261 = !DILocation(line: 246, column: 9, scope: !1992)
!2262 = !DILocation(line: 247, column: 11, scope: !1992)
!2263 = !DILocation(line: 253, column: 19, scope: !1992)
!2264 = !DILocation(line: 253, column: 25, scope: !1992)
!2265 = !DILocation(line: 253, column: 15, scope: !1992)
!2266 = !DILocation(line: 244, column: 9, scope: !1992)
!2267 = !DILocation(line: 245, column: 11, scope: !1992)
!2268 = !DILocation(line: 252, column: 19, scope: !1992)
!2269 = !DILocation(line: 252, column: 25, scope: !1992)
!2270 = !DILocation(line: 252, column: 15, scope: !1992)
!2271 = !DILocation(line: 251, column: 19, scope: !1992)
!2272 = !DILocation(line: 251, column: 25, scope: !1992)
!2273 = !DILocation(line: 251, column: 15, scope: !1992)
!2274 = !DILocation(line: 250, column: 19, scope: !1992)
!2275 = !DILocation(line: 250, column: 25, scope: !1992)
!2276 = !DILocation(line: 250, column: 15, scope: !1992)
!2277 = !DILocation(line: 231, column: 9, scope: !1992)
!2278 = !DILocation(line: 232, column: 11, scope: !1992)
!2279 = !DILocation(line: 225, column: 9, scope: !1992)
!2280 = !DILocation(line: 226, column: 11, scope: !1992)
!2281 = !DILocation(line: 223, column: 9, scope: !1992)
!2282 = !DILocation(line: 238, column: 19, scope: !1992)
!2283 = !DILocation(line: 238, column: 25, scope: !1992)
!2284 = !DILocation(line: 238, column: 15, scope: !1992)
!2285 = !DILocation(line: 229, column: 9, scope: !1992)
!2286 = !DILocation(line: 230, column: 11, scope: !1992)
!2287 = !DILocation(line: 237, column: 19, scope: !1992)
!2288 = !DILocation(line: 237, column: 25, scope: !1992)
!2289 = !DILocation(line: 237, column: 15, scope: !1992)
!2290 = !DILocation(line: 227, column: 9, scope: !1992)
!2291 = !DILocation(line: 228, column: 11, scope: !1992)
!2292 = !DILocation(line: 236, column: 19, scope: !1992)
!2293 = !DILocation(line: 236, column: 25, scope: !1992)
!2294 = !DILocation(line: 236, column: 15, scope: !1992)
!2295 = !DILocation(line: 235, column: 19, scope: !1992)
!2296 = !DILocation(line: 235, column: 25, scope: !1992)
!2297 = !DILocation(line: 235, column: 15, scope: !1992)
!2298 = !DILocation(line: 234, column: 51, scope: !1992)
!2299 = !DILocation(line: 234, column: 22, scope: !1992)
!2300 = !DILocation(line: 233, column: 19, scope: !1992)
!2301 = !DILocation(line: 233, column: 25, scope: !1992)
!2302 = !DILocation(line: 234, column: 9, scope: !1992)
!2303 = !DILocation(line: 113, column: 42, scope: !1954)
!2304 = !DILocation(line: 113, column: 3, scope: !1954)
!2305 = distinct !{!2305, !1955, !2306, !107}
!2306 = !DILocation(line: 303, column: 3, scope: !1951)
!2307 = !DILocation(line: 306, column: 12, scope: !1896)
!2308 = !DILocation(line: 307, column: 3, scope: !1896)
!2309 = !DILocation(line: 307, column: 12, scope: !1896)
!2310 = !DILocation(line: 308, column: 3, scope: !1896)
!2311 = !DILocation(line: 308, column: 12, scope: !1896)
!2312 = !DILocation(line: 309, column: 3, scope: !1896)
!2313 = !DILocation(line: 309, column: 12, scope: !1896)
!2314 = !DILocation(line: 310, column: 3, scope: !1896)
!2315 = !DILocation(line: 310, column: 12, scope: !1896)
!2316 = !DILocation(line: 311, column: 3, scope: !1896)
!2317 = !DILocation(line: 311, column: 12, scope: !1896)
!2318 = !DILocation(line: 312, column: 3, scope: !1896)
!2319 = !DILocation(line: 312, column: 12, scope: !1896)
!2320 = !DILocation(line: 313, column: 3, scope: !1896)
!2321 = !DILocation(line: 313, column: 12, scope: !1896)
!2322 = !DILocation(line: 314, column: 3, scope: !1896)
!2323 = !DILocation(line: 314, column: 12, scope: !1896)
!2324 = !DILocation(line: 315, column: 3, scope: !1896)
!2325 = !DILocation(line: 315, column: 12, scope: !1896)
!2326 = !DILocation(line: 316, column: 3, scope: !1896)
!2327 = !DILocation(line: 316, column: 13, scope: !1896)
!2328 = !DILocation(line: 317, column: 3, scope: !1896)
!2329 = !DILocation(line: 317, column: 13, scope: !1896)
!2330 = !DILocation(line: 318, column: 3, scope: !1896)
!2331 = !DILocation(line: 318, column: 13, scope: !1896)
!2332 = !DILocation(line: 319, column: 3, scope: !1896)
!2333 = !DILocation(line: 319, column: 13, scope: !1896)
!2334 = !DILocation(line: 320, column: 3, scope: !1896)
!2335 = !DILocation(line: 320, column: 13, scope: !1896)
!2336 = !DILocation(line: 321, column: 3, scope: !1896)
!2337 = !DILocation(line: 321, column: 13, scope: !1896)
!2338 = !DILocation(line: 322, column: 3, scope: !1896)
!2339 = !DILocation(line: 322, column: 13, scope: !1896)
!2340 = !DILocation(line: 323, column: 3, scope: !1896)
!2341 = !DILocation(line: 323, column: 13, scope: !1896)
!2342 = !DILocation(line: 324, column: 3, scope: !1896)
!2343 = !DILocation(line: 324, column: 13, scope: !1896)
!2344 = !DILocation(line: 325, column: 3, scope: !1896)
!2345 = !DILocation(line: 325, column: 13, scope: !1896)
!2346 = !DILocation(line: 326, column: 3, scope: !1896)
!2347 = !DILocation(line: 326, column: 13, scope: !1896)
!2348 = !DILocation(line: 327, column: 3, scope: !1896)
!2349 = !DILocation(line: 327, column: 13, scope: !1896)
!2350 = !DILocation(line: 328, column: 3, scope: !1896)
!2351 = !DILocation(line: 328, column: 13, scope: !1896)
!2352 = !DILocation(line: 329, column: 3, scope: !1896)
!2353 = !DILocation(line: 329, column: 13, scope: !1896)
!2354 = !DILocation(line: 330, column: 3, scope: !1896)
!2355 = !DILocation(line: 330, column: 13, scope: !1896)
!2356 = !DILocation(line: 331, column: 1, scope: !1896)
!2357 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_finalize", scope: !49, file: !49, line: 524, type: !1800, scopeLine: 524, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2358 = !DILocalVariable(name: "state", arg: 1, scope: !2357, file: !49, line: 524, type: !1802)
!2359 = !DILocation(line: 0, scope: !2357)
!2360 = !DILocation(line: 525, column: 27, scope: !2357)
!2361 = !DILocation(line: 525, column: 3, scope: !2357)
!2362 = !DILocation(line: 526, column: 3, scope: !2357)
!2363 = !DILocation(line: 526, column: 29, scope: !2357)
!2364 = !DILocation(line: 527, column: 1, scope: !2357)
!2365 = distinct !DISubprogram(name: "keccak_finalize", scope: !49, file: !49, line: 388, type: !2366, scopeLine: 389, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2366 = !DISubroutineType(types: !2367)
!2367 = !{null, !1812, !14, !14, !7}
!2368 = !DILocalVariable(name: "s", arg: 1, scope: !2365, file: !49, line: 388, type: !1812)
!2369 = !DILocation(line: 0, scope: !2365)
!2370 = !DILocalVariable(name: "pos", arg: 2, scope: !2365, file: !49, line: 388, type: !14)
!2371 = !DILocalVariable(name: "r", arg: 3, scope: !2365, file: !49, line: 388, type: !14)
!2372 = !DILocalVariable(name: "p", arg: 4, scope: !2365, file: !49, line: 389, type: !7)
!2373 = !DILocation(line: 390, column: 34, scope: !2365)
!2374 = !DILocation(line: 390, column: 29, scope: !2365)
!2375 = !DILocation(line: 390, column: 9, scope: !2365)
!2376 = !DILocation(line: 390, column: 3, scope: !2365)
!2377 = !DILocation(line: 390, column: 14, scope: !2365)
!2378 = !DILocation(line: 391, column: 7, scope: !2365)
!2379 = !DILocation(line: 391, column: 3, scope: !2365)
!2380 = !DILocation(line: 391, column: 16, scope: !2365)
!2381 = !DILocation(line: 392, column: 1, scope: !2365)
!2382 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeeze", scope: !49, file: !49, line: 540, type: !2383, scopeLine: 540, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2383 = !DISubroutineType(types: !2384)
!2384 = !{null, !6, !12, !1802}
!2385 = !DILocalVariable(name: "out", arg: 1, scope: !2382, file: !49, line: 540, type: !6)
!2386 = !DILocation(line: 0, scope: !2382)
!2387 = !DILocalVariable(name: "outlen", arg: 2, scope: !2382, file: !49, line: 540, type: !12)
!2388 = !DILocalVariable(name: "state", arg: 3, scope: !2382, file: !49, line: 540, type: !1802)
!2389 = !DILocation(line: 542, column: 28, scope: !2382)
!2390 = !DILocation(line: 541, column: 31, scope: !2382)
!2391 = !DILocation(line: 541, column: 3, scope: !2382)
!2392 = !DILocation(line: 541, column: 29, scope: !2382)
!2393 = !DILocation(line: 543, column: 1, scope: !2382)
!2394 = distinct !DISubprogram(name: "keccak_squeeze", scope: !49, file: !49, line: 410, type: !2395, scopeLine: 411, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2395 = !DISubroutineType(types: !2396)
!2396 = !{!14, !6, !12, !1812, !14, !14}
!2397 = !DILocalVariable(name: "out", arg: 1, scope: !2394, file: !49, line: 410, type: !6)
!2398 = !DILocation(line: 0, scope: !2394)
!2399 = !DILocalVariable(name: "outlen", arg: 2, scope: !2394, file: !49, line: 410, type: !12)
!2400 = !DILocalVariable(name: "s", arg: 3, scope: !2394, file: !49, line: 410, type: !1812)
!2401 = !DILocalVariable(name: "pos", arg: 4, scope: !2394, file: !49, line: 411, type: !14)
!2402 = !DILocalVariable(name: "r", arg: 5, scope: !2394, file: !49, line: 411, type: !14)
!2403 = !DILocation(line: 414, column: 3, scope: !2394)
!2404 = !DILocation(line: 415, column: 13, scope: !2405)
!2405 = distinct !DILexicalBlock(scope: !2406, file: !49, line: 415, column: 9)
!2406 = distinct !DILexicalBlock(scope: !2394, file: !49, line: 414, column: 18)
!2407 = !DILocation(line: 416, column: 7, scope: !2408)
!2408 = distinct !DILexicalBlock(scope: !2405, file: !49, line: 415, column: 19)
!2409 = !DILocation(line: 418, column: 5, scope: !2408)
!2410 = !DILocalVariable(name: "i", scope: !2394, file: !49, line: 412, type: !14)
!2411 = !DILocation(line: 419, column: 10, scope: !2412)
!2412 = distinct !DILexicalBlock(scope: !2406, file: !49, line: 419, column: 5)
!2413 = !DILocation(line: 419, scope: !2412)
!2414 = !DILocation(line: 419, column: 21, scope: !2415)
!2415 = distinct !DILexicalBlock(scope: !2412, file: !49, line: 419, column: 5)
!2416 = !DILocation(line: 419, column: 25, scope: !2415)
!2417 = !DILocation(line: 419, column: 5, scope: !2412)
!2418 = !DILocation(line: 420, column: 20, scope: !2415)
!2419 = !DILocation(line: 420, column: 16, scope: !2415)
!2420 = !DILocation(line: 420, column: 30, scope: !2415)
!2421 = !DILocation(line: 420, column: 25, scope: !2415)
!2422 = !DILocation(line: 420, column: 14, scope: !2415)
!2423 = !DILocation(line: 420, column: 11, scope: !2415)
!2424 = !DILocation(line: 419, column: 47, scope: !2415)
!2425 = !DILocation(line: 419, column: 5, scope: !2415)
!2426 = distinct !{!2426, !2417, !2427, !107}
!2427 = !DILocation(line: 420, column: 38, scope: !2412)
!2428 = !DILocation(line: 421, column: 17, scope: !2406)
!2429 = !DILocation(line: 421, column: 12, scope: !2406)
!2430 = distinct !{!2430, !2403, !2431, !107}
!2431 = !DILocation(line: 423, column: 3, scope: !2394)
!2432 = !DILocation(line: 425, column: 3, scope: !2394)
!2433 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb_once", scope: !49, file: !49, line: 556, type: !1830, scopeLine: 557, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2434 = !DILocalVariable(name: "state", arg: 1, scope: !2433, file: !49, line: 556, type: !1802)
!2435 = !DILocation(line: 0, scope: !2433)
!2436 = !DILocalVariable(name: "in", arg: 2, scope: !2433, file: !49, line: 556, type: !237)
!2437 = !DILocalVariable(name: "inlen", arg: 3, scope: !2433, file: !49, line: 557, type: !12)
!2438 = !DILocation(line: 558, column: 3, scope: !2433)
!2439 = !DILocation(line: 559, column: 3, scope: !2433)
!2440 = !DILocation(line: 559, column: 29, scope: !2433)
!2441 = !DILocation(line: 560, column: 1, scope: !2433)
!2442 = distinct !DISubprogram(name: "keccak_absorb_once", scope: !49, file: !49, line: 441, type: !2443, scopeLine: 442, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2443 = !DISubroutineType(types: !2444)
!2444 = !{null, !1812, !14, !237, !12, !7}
!2445 = !DILocalVariable(name: "s", arg: 1, scope: !2442, file: !49, line: 441, type: !1812)
!2446 = !DILocation(line: 0, scope: !2442)
!2447 = !DILocalVariable(name: "r", arg: 2, scope: !2442, file: !49, line: 441, type: !14)
!2448 = !DILocalVariable(name: "in", arg: 3, scope: !2442, file: !49, line: 442, type: !237)
!2449 = !DILocalVariable(name: "inlen", arg: 4, scope: !2442, file: !49, line: 442, type: !12)
!2450 = !DILocalVariable(name: "p", arg: 5, scope: !2442, file: !49, line: 442, type: !7)
!2451 = !DILocalVariable(name: "i", scope: !2442, file: !49, line: 443, type: !14)
!2452 = !DILocation(line: 445, column: 8, scope: !2453)
!2453 = distinct !DILexicalBlock(scope: !2442, file: !49, line: 445, column: 3)
!2454 = !DILocation(line: 445, scope: !2453)
!2455 = !DILocation(line: 445, column: 17, scope: !2456)
!2456 = distinct !DILexicalBlock(scope: !2453, file: !49, line: 445, column: 3)
!2457 = !DILocation(line: 445, column: 3, scope: !2453)
!2458 = !DILocation(line: 448, column: 3, scope: !2442)
!2459 = !DILocation(line: 446, column: 5, scope: !2456)
!2460 = !DILocation(line: 446, column: 10, scope: !2456)
!2461 = !DILocation(line: 445, column: 24, scope: !2456)
!2462 = !DILocation(line: 445, column: 3, scope: !2456)
!2463 = distinct !{!2463, !2457, !2464, !107}
!2464 = !DILocation(line: 446, column: 12, scope: !2453)
!2465 = !DILocation(line: 448, column: 16, scope: !2442)
!2466 = !DILocation(line: 449, column: 5, scope: !2467)
!2467 = distinct !DILexicalBlock(scope: !2468, file: !49, line: 449, column: 5)
!2468 = distinct !DILexicalBlock(scope: !2442, file: !49, line: 448, column: 22)
!2469 = !DILocation(line: 456, column: 3, scope: !2470)
!2470 = distinct !DILexicalBlock(scope: !2442, file: !49, line: 456, column: 3)
!2471 = !DILocation(line: 449, scope: !2467)
!2472 = !DILocation(line: 449, column: 19, scope: !2473)
!2473 = distinct !DILexicalBlock(scope: !2467, file: !49, line: 449, column: 5)
!2474 = !DILocation(line: 450, column: 29, scope: !2473)
!2475 = !DILocation(line: 450, column: 25, scope: !2473)
!2476 = !DILocation(line: 450, column: 15, scope: !2473)
!2477 = !DILocation(line: 450, column: 7, scope: !2473)
!2478 = !DILocation(line: 450, column: 12, scope: !2473)
!2479 = !DILocation(line: 449, column: 29, scope: !2473)
!2480 = !DILocation(line: 449, column: 5, scope: !2473)
!2481 = distinct !{!2481, !2466, !2482, !107}
!2482 = !DILocation(line: 450, column: 32, scope: !2467)
!2483 = !DILocation(line: 451, column: 8, scope: !2468)
!2484 = !DILocation(line: 452, column: 11, scope: !2468)
!2485 = !DILocation(line: 453, column: 5, scope: !2468)
!2486 = distinct !{!2486, !2458, !2487, !107}
!2487 = !DILocation(line: 454, column: 3, scope: !2442)
!2488 = !DILocation(line: 456, scope: !2470)
!2489 = !DILocation(line: 456, column: 17, scope: !2490)
!2490 = distinct !DILexicalBlock(scope: !2470, file: !49, line: 456, column: 3)
!2491 = !DILocation(line: 457, column: 27, scope: !2490)
!2492 = !DILocation(line: 457, column: 17, scope: !2490)
!2493 = !DILocation(line: 457, column: 38, scope: !2490)
!2494 = !DILocation(line: 457, column: 33, scope: !2490)
!2495 = !DILocation(line: 457, column: 9, scope: !2490)
!2496 = !DILocation(line: 457, column: 5, scope: !2490)
!2497 = !DILocation(line: 457, column: 14, scope: !2490)
!2498 = !DILocation(line: 456, column: 27, scope: !2490)
!2499 = !DILocation(line: 456, column: 3, scope: !2490)
!2500 = distinct !{!2500, !2469, !2501, !107}
!2501 = !DILocation(line: 457, column: 46, scope: !2470)
!2502 = !DILocation(line: 459, column: 15, scope: !2442)
!2503 = !DILocation(line: 459, column: 32, scope: !2442)
!2504 = !DILocation(line: 459, column: 27, scope: !2442)
!2505 = !DILocation(line: 459, column: 7, scope: !2442)
!2506 = !DILocation(line: 459, column: 3, scope: !2442)
!2507 = !DILocation(line: 459, column: 12, scope: !2442)
!2508 = !DILocation(line: 460, column: 8, scope: !2442)
!2509 = !DILocation(line: 460, column: 13, scope: !2442)
!2510 = !DILocation(line: 460, column: 3, scope: !2442)
!2511 = !DILocation(line: 460, column: 18, scope: !2442)
!2512 = !DILocation(line: 461, column: 1, scope: !2442)
!2513 = distinct !DISubprogram(name: "load64", scope: !49, file: !49, line: 22, type: !2514, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2514 = !DISubroutineType(types: !2515)
!2515 = !{!45, !237}
!2516 = !DILocalVariable(name: "x", arg: 1, scope: !2513, file: !49, line: 22, type: !237)
!2517 = !DILocation(line: 0, scope: !2513)
!2518 = !DILocalVariable(name: "r", scope: !2513, file: !49, line: 24, type: !45)
!2519 = !DILocalVariable(name: "i", scope: !2513, file: !49, line: 23, type: !14)
!2520 = !DILocation(line: 26, column: 8, scope: !2521)
!2521 = distinct !DILexicalBlock(scope: !2513, file: !49, line: 26, column: 3)
!2522 = !DILocation(line: 26, scope: !2521)
!2523 = !DILocation(line: 26, column: 17, scope: !2524)
!2524 = distinct !DILexicalBlock(scope: !2521, file: !49, line: 26, column: 3)
!2525 = !DILocation(line: 26, column: 3, scope: !2521)
!2526 = !DILocation(line: 27, column: 20, scope: !2524)
!2527 = !DILocation(line: 27, column: 10, scope: !2524)
!2528 = !DILocation(line: 27, column: 30, scope: !2524)
!2529 = !DILocation(line: 27, column: 25, scope: !2524)
!2530 = !DILocation(line: 27, column: 7, scope: !2524)
!2531 = !DILocation(line: 26, column: 23, scope: !2524)
!2532 = !DILocation(line: 26, column: 3, scope: !2524)
!2533 = distinct !{!2533, !2525, !2534, !107}
!2534 = !DILocation(line: 27, column: 32, scope: !2521)
!2535 = !DILocation(line: 29, column: 3, scope: !2513)
!2536 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeezeblocks", scope: !49, file: !49, line: 575, type: !2383, scopeLine: 575, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2537 = !DILocalVariable(name: "out", arg: 1, scope: !2536, file: !49, line: 575, type: !6)
!2538 = !DILocation(line: 0, scope: !2536)
!2539 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2536, file: !49, line: 575, type: !12)
!2540 = !DILocalVariable(name: "state", arg: 3, scope: !2536, file: !49, line: 575, type: !1802)
!2541 = !DILocation(line: 576, column: 3, scope: !2536)
!2542 = !DILocation(line: 577, column: 1, scope: !2536)
!2543 = distinct !DISubprogram(name: "keccak_squeezeblocks", scope: !49, file: !49, line: 477, type: !2544, scopeLine: 478, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2544 = !DISubroutineType(types: !2545)
!2545 = !{null, !6, !12, !1812, !14}
!2546 = !DILocalVariable(name: "out", arg: 1, scope: !2543, file: !49, line: 477, type: !6)
!2547 = !DILocation(line: 0, scope: !2543)
!2548 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2543, file: !49, line: 477, type: !12)
!2549 = !DILocalVariable(name: "s", arg: 3, scope: !2543, file: !49, line: 477, type: !1812)
!2550 = !DILocalVariable(name: "r", arg: 4, scope: !2543, file: !49, line: 478, type: !14)
!2551 = !DILocation(line: 481, column: 3, scope: !2543)
!2552 = !DILocation(line: 482, column: 5, scope: !2553)
!2553 = distinct !DILexicalBlock(scope: !2543, file: !49, line: 481, column: 19)
!2554 = !DILocalVariable(name: "i", scope: !2543, file: !49, line: 479, type: !14)
!2555 = !DILocation(line: 483, column: 10, scope: !2556)
!2556 = distinct !DILexicalBlock(scope: !2553, file: !49, line: 483, column: 5)
!2557 = !DILocation(line: 483, scope: !2556)
!2558 = !DILocation(line: 483, column: 19, scope: !2559)
!2559 = distinct !DILexicalBlock(scope: !2556, file: !49, line: 483, column: 5)
!2560 = !DILocation(line: 483, column: 5, scope: !2556)
!2561 = !DILocation(line: 484, column: 23, scope: !2559)
!2562 = !DILocation(line: 484, column: 19, scope: !2559)
!2563 = !DILocation(line: 484, column: 28, scope: !2559)
!2564 = !DILocation(line: 484, column: 7, scope: !2559)
!2565 = !DILocation(line: 483, column: 29, scope: !2559)
!2566 = !DILocation(line: 483, column: 5, scope: !2559)
!2567 = distinct !{!2567, !2560, !2568, !107}
!2568 = !DILocation(line: 484, column: 32, scope: !2556)
!2569 = !DILocation(line: 485, column: 9, scope: !2553)
!2570 = !DILocation(line: 486, column: 13, scope: !2553)
!2571 = distinct !{!2571, !2551, !2572, !107}
!2572 = !DILocation(line: 487, column: 3, scope: !2543)
!2573 = !DILocation(line: 488, column: 1, scope: !2543)
!2574 = distinct !DISubprogram(name: "store64", scope: !49, file: !49, line: 41, type: !2575, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2575 = !DISubroutineType(types: !2576)
!2576 = !{null, !6, !45}
!2577 = !DILocalVariable(name: "x", arg: 1, scope: !2574, file: !49, line: 41, type: !6)
!2578 = !DILocation(line: 0, scope: !2574)
!2579 = !DILocalVariable(name: "u", arg: 2, scope: !2574, file: !49, line: 41, type: !45)
!2580 = !DILocalVariable(name: "i", scope: !2574, file: !49, line: 42, type: !14)
!2581 = !DILocation(line: 44, column: 8, scope: !2582)
!2582 = distinct !DILexicalBlock(scope: !2574, file: !49, line: 44, column: 3)
!2583 = !DILocation(line: 44, scope: !2582)
!2584 = !DILocation(line: 44, column: 17, scope: !2585)
!2585 = distinct !DILexicalBlock(scope: !2582, file: !49, line: 44, column: 3)
!2586 = !DILocation(line: 44, column: 3, scope: !2582)
!2587 = !DILocation(line: 45, column: 19, scope: !2585)
!2588 = !DILocation(line: 45, column: 14, scope: !2585)
!2589 = !DILocation(line: 45, column: 12, scope: !2585)
!2590 = !DILocation(line: 45, column: 5, scope: !2585)
!2591 = !DILocation(line: 45, column: 10, scope: !2585)
!2592 = !DILocation(line: 44, column: 23, scope: !2585)
!2593 = !DILocation(line: 44, column: 3, scope: !2585)
!2594 = distinct !{!2594, !2586, !2595, !107}
!2595 = !DILocation(line: 45, column: 21, scope: !2582)
!2596 = !DILocation(line: 46, column: 1, scope: !2574)
!2597 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_init", scope: !49, file: !49, line: 586, type: !1800, scopeLine: 586, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2598 = !DILocalVariable(name: "state", arg: 1, scope: !2597, file: !49, line: 586, type: !1802)
!2599 = !DILocation(line: 0, scope: !2597)
!2600 = !DILocation(line: 587, column: 3, scope: !2597)
!2601 = !DILocation(line: 588, column: 3, scope: !2597)
!2602 = !DILocation(line: 588, column: 29, scope: !2597)
!2603 = !DILocation(line: 589, column: 1, scope: !2597)
!2604 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb", scope: !49, file: !49, line: 601, type: !1830, scopeLine: 601, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2605 = !DILocalVariable(name: "state", arg: 1, scope: !2604, file: !49, line: 601, type: !1802)
!2606 = !DILocation(line: 0, scope: !2604)
!2607 = !DILocalVariable(name: "in", arg: 2, scope: !2604, file: !49, line: 601, type: !237)
!2608 = !DILocalVariable(name: "inlen", arg: 3, scope: !2604, file: !49, line: 601, type: !12)
!2609 = !DILocation(line: 602, column: 53, scope: !2604)
!2610 = !DILocation(line: 602, column: 31, scope: !2604)
!2611 = !DILocation(line: 602, column: 3, scope: !2604)
!2612 = !DILocation(line: 602, column: 29, scope: !2604)
!2613 = !DILocation(line: 604, column: 1, scope: !2604)
!2614 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_finalize", scope: !49, file: !49, line: 613, type: !1800, scopeLine: 613, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2615 = !DILocalVariable(name: "state", arg: 1, scope: !2614, file: !49, line: 613, type: !1802)
!2616 = !DILocation(line: 0, scope: !2614)
!2617 = !DILocation(line: 614, column: 27, scope: !2614)
!2618 = !DILocation(line: 614, column: 3, scope: !2614)
!2619 = !DILocation(line: 615, column: 3, scope: !2614)
!2620 = !DILocation(line: 615, column: 29, scope: !2614)
!2621 = !DILocation(line: 616, column: 1, scope: !2614)
!2622 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeeze", scope: !49, file: !49, line: 629, type: !2383, scopeLine: 629, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2623 = !DILocalVariable(name: "out", arg: 1, scope: !2622, file: !49, line: 629, type: !6)
!2624 = !DILocation(line: 0, scope: !2622)
!2625 = !DILocalVariable(name: "outlen", arg: 2, scope: !2622, file: !49, line: 629, type: !12)
!2626 = !DILocalVariable(name: "state", arg: 3, scope: !2622, file: !49, line: 629, type: !1802)
!2627 = !DILocation(line: 631, column: 28, scope: !2622)
!2628 = !DILocation(line: 630, column: 31, scope: !2622)
!2629 = !DILocation(line: 630, column: 3, scope: !2622)
!2630 = !DILocation(line: 630, column: 29, scope: !2622)
!2631 = !DILocation(line: 632, column: 1, scope: !2622)
!2632 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb_once", scope: !49, file: !49, line: 645, type: !1830, scopeLine: 646, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2633 = !DILocalVariable(name: "state", arg: 1, scope: !2632, file: !49, line: 645, type: !1802)
!2634 = !DILocation(line: 0, scope: !2632)
!2635 = !DILocalVariable(name: "in", arg: 2, scope: !2632, file: !49, line: 645, type: !237)
!2636 = !DILocalVariable(name: "inlen", arg: 3, scope: !2632, file: !49, line: 646, type: !12)
!2637 = !DILocation(line: 647, column: 3, scope: !2632)
!2638 = !DILocation(line: 648, column: 3, scope: !2632)
!2639 = !DILocation(line: 648, column: 29, scope: !2632)
!2640 = !DILocation(line: 649, column: 1, scope: !2632)
!2641 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeezeblocks", scope: !49, file: !49, line: 664, type: !2383, scopeLine: 664, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2642 = !DILocalVariable(name: "out", arg: 1, scope: !2641, file: !49, line: 664, type: !6)
!2643 = !DILocation(line: 0, scope: !2641)
!2644 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2641, file: !49, line: 664, type: !12)
!2645 = !DILocalVariable(name: "state", arg: 3, scope: !2641, file: !49, line: 664, type: !1802)
!2646 = !DILocation(line: 665, column: 3, scope: !2641)
!2647 = !DILocation(line: 666, column: 1, scope: !2641)
!2648 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128", scope: !49, file: !49, line: 678, type: !2649, scopeLine: 678, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2649 = !DISubroutineType(types: !2650)
!2650 = !{null, !6, !12, !237, !12}
!2651 = !DILocalVariable(name: "out", arg: 1, scope: !2648, file: !49, line: 678, type: !6)
!2652 = !DILocation(line: 0, scope: !2648)
!2653 = !DILocalVariable(name: "outlen", arg: 2, scope: !2648, file: !49, line: 678, type: !12)
!2654 = !DILocalVariable(name: "in", arg: 3, scope: !2648, file: !49, line: 678, type: !237)
!2655 = !DILocalVariable(name: "inlen", arg: 4, scope: !2648, file: !49, line: 678, type: !12)
!2656 = !DILocalVariable(name: "state", scope: !2648, file: !49, line: 680, type: !349)
!2657 = !DILocation(line: 680, column: 16, scope: !2648)
!2658 = !DILocation(line: 682, column: 3, scope: !2648)
!2659 = !DILocation(line: 683, column: 20, scope: !2648)
!2660 = !DILocalVariable(name: "nblocks", scope: !2648, file: !49, line: 679, type: !12)
!2661 = !DILocation(line: 684, column: 3, scope: !2648)
!2662 = !DILocation(line: 685, column: 21, scope: !2648)
!2663 = !DILocation(line: 685, column: 10, scope: !2648)
!2664 = !DILocation(line: 686, column: 18, scope: !2648)
!2665 = !DILocation(line: 686, column: 7, scope: !2648)
!2666 = !DILocation(line: 687, column: 3, scope: !2648)
!2667 = !DILocation(line: 688, column: 1, scope: !2648)
!2668 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256", scope: !49, file: !49, line: 700, type: !2649, scopeLine: 700, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2669 = !DILocalVariable(name: "out", arg: 1, scope: !2668, file: !49, line: 700, type: !6)
!2670 = !DILocation(line: 0, scope: !2668)
!2671 = !DILocalVariable(name: "outlen", arg: 2, scope: !2668, file: !49, line: 700, type: !12)
!2672 = !DILocalVariable(name: "in", arg: 3, scope: !2668, file: !49, line: 700, type: !237)
!2673 = !DILocalVariable(name: "inlen", arg: 4, scope: !2668, file: !49, line: 700, type: !12)
!2674 = !DILocalVariable(name: "state", scope: !2668, file: !49, line: 702, type: !349)
!2675 = !DILocation(line: 702, column: 16, scope: !2668)
!2676 = !DILocation(line: 704, column: 3, scope: !2668)
!2677 = !DILocation(line: 705, column: 20, scope: !2668)
!2678 = !DILocalVariable(name: "nblocks", scope: !2668, file: !49, line: 701, type: !12)
!2679 = !DILocation(line: 706, column: 3, scope: !2668)
!2680 = !DILocation(line: 707, column: 21, scope: !2668)
!2681 = !DILocation(line: 707, column: 10, scope: !2668)
!2682 = !DILocation(line: 708, column: 18, scope: !2668)
!2683 = !DILocation(line: 708, column: 7, scope: !2668)
!2684 = !DILocation(line: 709, column: 3, scope: !2668)
!2685 = !DILocation(line: 710, column: 1, scope: !2668)
!2686 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_256", scope: !49, file: !49, line: 721, type: !2687, scopeLine: 721, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2687 = !DISubroutineType(types: !2688)
!2688 = !{null, !6, !237, !12}
!2689 = !DILocalVariable(name: "h", arg: 1, scope: !2686, file: !49, line: 721, type: !6)
!2690 = !DILocation(line: 0, scope: !2686)
!2691 = !DILocalVariable(name: "in", arg: 2, scope: !2686, file: !49, line: 721, type: !237)
!2692 = !DILocalVariable(name: "inlen", arg: 3, scope: !2686, file: !49, line: 721, type: !12)
!2693 = !DILocalVariable(name: "s", scope: !2686, file: !49, line: 723, type: !2694)
!2694 = !DICompositeType(tag: DW_TAG_array_type, baseType: !45, size: 1600, elements: !2695)
!2695 = !{!2696}
!2696 = !DISubrange(count: 25)
!2697 = !DILocation(line: 723, column: 12, scope: !2686)
!2698 = !DILocation(line: 725, column: 3, scope: !2686)
!2699 = !DILocation(line: 726, column: 3, scope: !2686)
!2700 = !DILocalVariable(name: "i", scope: !2686, file: !49, line: 722, type: !14)
!2701 = !DILocation(line: 727, column: 8, scope: !2702)
!2702 = distinct !DILexicalBlock(scope: !2686, file: !49, line: 727, column: 3)
!2703 = !DILocation(line: 727, scope: !2702)
!2704 = !DILocation(line: 727, column: 17, scope: !2705)
!2705 = distinct !DILexicalBlock(scope: !2702, file: !49, line: 727, column: 3)
!2706 = !DILocation(line: 727, column: 3, scope: !2702)
!2707 = !DILocation(line: 728, column: 19, scope: !2705)
!2708 = !DILocation(line: 728, column: 15, scope: !2705)
!2709 = !DILocation(line: 728, column: 24, scope: !2705)
!2710 = !DILocation(line: 728, column: 5, scope: !2705)
!2711 = !DILocation(line: 727, column: 23, scope: !2705)
!2712 = !DILocation(line: 727, column: 3, scope: !2705)
!2713 = distinct !{!2713, !2706, !2714, !107}
!2714 = !DILocation(line: 728, column: 28, scope: !2702)
!2715 = !DILocation(line: 729, column: 1, scope: !2686)
!2716 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_512", scope: !49, file: !49, line: 740, type: !2687, scopeLine: 740, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !24)
!2717 = !DILocalVariable(name: "h", arg: 1, scope: !2716, file: !49, line: 740, type: !6)
!2718 = !DILocation(line: 0, scope: !2716)
!2719 = !DILocalVariable(name: "in", arg: 2, scope: !2716, file: !49, line: 740, type: !237)
!2720 = !DILocalVariable(name: "inlen", arg: 3, scope: !2716, file: !49, line: 740, type: !12)
!2721 = !DILocalVariable(name: "s", scope: !2716, file: !49, line: 742, type: !2694)
!2722 = !DILocation(line: 742, column: 12, scope: !2716)
!2723 = !DILocation(line: 744, column: 3, scope: !2716)
!2724 = !DILocation(line: 745, column: 3, scope: !2716)
!2725 = !DILocalVariable(name: "i", scope: !2716, file: !49, line: 741, type: !14)
!2726 = !DILocation(line: 746, column: 8, scope: !2727)
!2727 = distinct !DILexicalBlock(scope: !2716, file: !49, line: 746, column: 3)
!2728 = !DILocation(line: 746, scope: !2727)
!2729 = !DILocation(line: 746, column: 17, scope: !2730)
!2730 = distinct !DILexicalBlock(scope: !2727, file: !49, line: 746, column: 3)
!2731 = !DILocation(line: 746, column: 3, scope: !2727)
!2732 = !DILocation(line: 747, column: 19, scope: !2730)
!2733 = !DILocation(line: 747, column: 15, scope: !2730)
!2734 = !DILocation(line: 747, column: 24, scope: !2730)
!2735 = !DILocation(line: 747, column: 5, scope: !2730)
!2736 = !DILocation(line: 746, column: 23, scope: !2730)
!2737 = !DILocation(line: 746, column: 3, scope: !2730)
!2738 = distinct !{!2738, !2731, !2739, !107}
!2739 = !DILocation(line: 747, column: 28, scope: !2727)
!2740 = !DILocation(line: 748, column: 1, scope: !2716)
!2741 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_kyber_shake128_absorb", scope: !2742, file: !2742, line: 18, type: !2743, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !74, retainedNodes: !24)
!2742 = !DIFile(filename: "../../../ref/symmetric-shake.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!2743 = !DISubroutineType(types: !2744)
!2744 = !{null, !1802, !237, !7, !7}
!2745 = !DILocalVariable(name: "state", arg: 1, scope: !2741, file: !2742, line: 18, type: !1802)
!2746 = !DILocation(line: 0, scope: !2741)
!2747 = !DILocalVariable(name: "seed", arg: 2, scope: !2741, file: !2742, line: 19, type: !237)
!2748 = !DILocalVariable(name: "x", arg: 3, scope: !2741, file: !2742, line: 20, type: !7)
!2749 = !DILocalVariable(name: "y", arg: 4, scope: !2741, file: !2742, line: 21, type: !7)
!2750 = !DILocalVariable(name: "extseed", scope: !2741, file: !2742, line: 23, type: !2751)
!2751 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 272, elements: !2752)
!2752 = !{!2753}
!2753 = !DISubrange(count: 34)
!2754 = !DILocation(line: 23, column: 11, scope: !2741)
!2755 = !DILocation(line: 25, column: 3, scope: !2741)
!2756 = !DILocation(line: 26, column: 3, scope: !2741)
!2757 = !DILocation(line: 26, column: 29, scope: !2741)
!2758 = !DILocation(line: 27, column: 3, scope: !2741)
!2759 = !DILocation(line: 27, column: 29, scope: !2741)
!2760 = !DILocation(line: 29, column: 3, scope: !2741)
!2761 = !DILocation(line: 30, column: 1, scope: !2741)
!2762 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_kyber_shake256_prf", scope: !2742, file: !2742, line: 43, type: !2763, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !74, retainedNodes: !24)
!2763 = !DISubroutineType(types: !2764)
!2764 = !{null, !6, !12, !237, !7}
!2765 = !DILocalVariable(name: "out", arg: 1, scope: !2762, file: !2742, line: 43, type: !6)
!2766 = !DILocation(line: 0, scope: !2762)
!2767 = !DILocalVariable(name: "outlen", arg: 2, scope: !2762, file: !2742, line: 43, type: !12)
!2768 = !DILocalVariable(name: "key", arg: 3, scope: !2762, file: !2742, line: 43, type: !237)
!2769 = !DILocalVariable(name: "nonce", arg: 4, scope: !2762, file: !2742, line: 43, type: !7)
!2770 = !DILocalVariable(name: "extkey", scope: !2762, file: !2742, line: 45, type: !2771)
!2771 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 264, elements: !2772)
!2772 = !{!2773}
!2773 = !DISubrange(count: 33)
!2774 = !DILocation(line: 45, column: 11, scope: !2762)
!2775 = !DILocation(line: 47, column: 3, scope: !2762)
!2776 = !DILocation(line: 48, column: 3, scope: !2762)
!2777 = !DILocation(line: 48, column: 26, scope: !2762)
!2778 = !DILocation(line: 50, column: 3, scope: !2762)
!2779 = !DILocation(line: 51, column: 1, scope: !2762)
!2780 = distinct !DISubprogram(name: "pqcrystals_kyber768_ref_kyber_shake256_rkprf", scope: !2742, file: !2742, line: 64, type: !644, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !74, retainedNodes: !24)
!2781 = !DILocalVariable(name: "out", arg: 1, scope: !2780, file: !2742, line: 64, type: !6)
!2782 = !DILocation(line: 0, scope: !2780)
!2783 = !DILocalVariable(name: "key", arg: 2, scope: !2780, file: !2742, line: 64, type: !237)
!2784 = !DILocalVariable(name: "input", arg: 3, scope: !2780, file: !2742, line: 64, type: !237)
!2785 = !DILocalVariable(name: "s", scope: !2780, file: !2742, line: 66, type: !349)
!2786 = !DILocation(line: 66, column: 16, scope: !2780)
!2787 = !DILocation(line: 68, column: 3, scope: !2780)
!2788 = !DILocation(line: 69, column: 3, scope: !2780)
!2789 = !DILocation(line: 70, column: 3, scope: !2780)
!2790 = !DILocation(line: 71, column: 3, scope: !2780)
!2791 = !DILocation(line: 72, column: 3, scope: !2780)
!2792 = !DILocation(line: 73, column: 1, scope: !2780)
!2793 = distinct !DISubprogram(name: "kyber_memset", scope: !2794, file: !2794, line: 3, type: !2795, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !75, retainedNodes: !24)
!2794 = !DIFile(filename: "../mem.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm/llvm-gen/build")
!2795 = !DISubroutineType(types: !2796)
!2796 = !{null, !2797, !7, !65}
!2797 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 32)
!2798 = !DILocalVariable(name: "dst", arg: 1, scope: !2793, file: !2794, line: 3, type: !2797)
!2799 = !DILocation(line: 0, scope: !2793)
!2800 = !DILocalVariable(name: "val", arg: 2, scope: !2793, file: !2794, line: 3, type: !7)
!2801 = !DILocalVariable(name: "len", arg: 3, scope: !2793, file: !2794, line: 3, type: !65)
!2802 = !DILocalVariable(name: "d", scope: !2793, file: !2794, line: 5, type: !6)
!2803 = !DILocalVariable(name: "i", scope: !2804, file: !2794, line: 7, type: !65)
!2804 = distinct !DILexicalBlock(scope: !2793, file: !2794, line: 7, column: 5)
!2805 = !DILocation(line: 0, scope: !2804)
!2806 = !DILocation(line: 7, column: 10, scope: !2804)
!2807 = !DILocation(line: 7, scope: !2804)
!2808 = !DILocation(line: 7, column: 28, scope: !2809)
!2809 = distinct !DILexicalBlock(scope: !2804, file: !2794, line: 7, column: 5)
!2810 = !DILocation(line: 7, column: 5, scope: !2804)
!2811 = !DILocation(line: 8, column: 9, scope: !2809)
!2812 = !DILocation(line: 8, column: 14, scope: !2809)
!2813 = !DILocation(line: 7, column: 36, scope: !2809)
!2814 = !DILocation(line: 7, column: 5, scope: !2809)
!2815 = distinct !{!2815, !2810, !2816, !107}
!2816 = !DILocation(line: 8, column: 16, scope: !2804)
!2817 = !DILocation(line: 9, column: 1, scope: !2793)
!2818 = distinct !DISubprogram(name: "kyber_memcpy", scope: !2794, file: !2794, line: 11, type: !2819, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !75, retainedNodes: !24)
!2819 = !DISubroutineType(types: !2820)
!2820 = !{null, !2797, !2821, !65}
!2821 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2822, size: 32)
!2822 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!2823 = !DILocalVariable(name: "dst", arg: 1, scope: !2818, file: !2794, line: 11, type: !2797)
!2824 = !DILocation(line: 0, scope: !2818)
!2825 = !DILocalVariable(name: "src", arg: 2, scope: !2818, file: !2794, line: 11, type: !2821)
!2826 = !DILocalVariable(name: "len", arg: 3, scope: !2818, file: !2794, line: 11, type: !65)
!2827 = !DILocalVariable(name: "d", scope: !2818, file: !2794, line: 13, type: !6)
!2828 = !DILocalVariable(name: "s", scope: !2818, file: !2794, line: 14, type: !237)
!2829 = !DILocalVariable(name: "i", scope: !2830, file: !2794, line: 16, type: !65)
!2830 = distinct !DILexicalBlock(scope: !2818, file: !2794, line: 16, column: 5)
!2831 = !DILocation(line: 0, scope: !2830)
!2832 = !DILocation(line: 16, column: 10, scope: !2830)
!2833 = !DILocation(line: 16, scope: !2830)
!2834 = !DILocation(line: 16, column: 28, scope: !2835)
!2835 = distinct !DILexicalBlock(scope: !2830, file: !2794, line: 16, column: 5)
!2836 = !DILocation(line: 16, column: 5, scope: !2830)
!2837 = !DILocation(line: 17, column: 16, scope: !2835)
!2838 = !DILocation(line: 17, column: 9, scope: !2835)
!2839 = !DILocation(line: 17, column: 14, scope: !2835)
!2840 = !DILocation(line: 16, column: 36, scope: !2835)
!2841 = !DILocation(line: 16, column: 5, scope: !2835)
!2842 = distinct !{!2842, !2836, !2843, !107}
!2843 = !DILocation(line: 17, column: 19, scope: !2830)
!2844 = !DILocation(line: 18, column: 1, scope: !2818)
