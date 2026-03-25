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
@randombytes.fd = internal global i32 -1, align 4, !dbg !26
@.str.6 = private unnamed_addr constant [13 x i8] c"/dev/urandom\00", align 1, !dbg !44
@pqcrystals_kyber1024_ref_zetas = dso_local constant [128 x i16] [i16 -1044, i16 -758, i16 -359, i16 -1517, i16 1493, i16 1422, i16 287, i16 202, i16 -171, i16 622, i16 1577, i16 182, i16 962, i16 -1202, i16 -1474, i16 1468, i16 573, i16 -1325, i16 264, i16 383, i16 -829, i16 1458, i16 -1602, i16 -130, i16 -681, i16 1017, i16 732, i16 608, i16 -1542, i16 411, i16 -205, i16 -1571, i16 1223, i16 652, i16 -552, i16 1015, i16 -1293, i16 1491, i16 -282, i16 -1544, i16 516, i16 -8, i16 -320, i16 -666, i16 -1618, i16 -1162, i16 126, i16 1469, i16 -853, i16 -90, i16 -271, i16 830, i16 107, i16 -1421, i16 -247, i16 -951, i16 -398, i16 961, i16 -1508, i16 -725, i16 448, i16 -1065, i16 677, i16 -1275, i16 -1103, i16 430, i16 555, i16 843, i16 -1251, i16 871, i16 1550, i16 105, i16 422, i16 587, i16 177, i16 -235, i16 -291, i16 -460, i16 1574, i16 1653, i16 -246, i16 778, i16 1159, i16 -147, i16 -777, i16 1483, i16 -602, i16 1119, i16 -1590, i16 644, i16 -872, i16 349, i16 418, i16 329, i16 -156, i16 -75, i16 817, i16 1097, i16 603, i16 610, i16 1322, i16 -1285, i16 -1465, i16 384, i16 -1215, i16 -136, i16 1218, i16 -1335, i16 -874, i16 220, i16 -1187, i16 -1659, i16 -1185, i16 -1530, i16 -1278, i16 794, i16 -1510, i16 -854, i16 -870, i16 478, i16 -108, i16 -308, i16 996, i16 991, i16 958, i16 -1460, i16 1522, i16 1628], align 2, !dbg !51
@KeccakF_RoundConstants = internal constant [24 x i64] [i64 1, i64 32898, i64 -9223372036854742902, i64 -9223372034707259392, i64 32907, i64 2147483649, i64 -9223372034707259263, i64 -9223372036854743031, i64 138, i64 136, i64 2147516425, i64 2147483658, i64 2147516555, i64 -9223372036854775669, i64 -9223372036854742903, i64 -9223372036854743037, i64 -9223372036854743038, i64 -9223372036854775680, i64 32778, i64 -9223372034707292150, i64 -9223372034707259263, i64 -9223372036854742912, i64 2147483649, i64 -9223372034707259384], align 8, !dbg !66

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 !dbg !106 {
entry:
    #dbg_value(i32 0, !109, !DIExpression(), !110)
  br label %for.cond, !dbg !111

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !113
    #dbg_value(i32 %i.0, !109, !DIExpression(), !110)
  %cmp = icmp ult i32 %i.0, 1000, !dbg !114
  br i1 %cmp, label %for.body, label %for.end, !dbg !116

for.body:                                         ; preds = %for.cond
  %call = call i32 @test_keys() #2, !dbg !117
    #dbg_value(i32 %call, !119, !DIExpression(), !110)
  %call1 = call i32 @test_invalid_sk_a() #2, !dbg !120
  %or = or i32 %call, %call1, !dbg !121
    #dbg_value(i32 %or, !119, !DIExpression(), !110)
  %call2 = call i32 @test_invalid_ciphertext() #2, !dbg !122
  %or3 = or i32 %or, %call2, !dbg !123
    #dbg_value(i32 %or3, !119, !DIExpression(), !110)
  %tobool = icmp ne i32 %or3, 0, !dbg !124
  br i1 %tobool, label %if.then, label %if.end, !dbg !124

if.then:                                          ; preds = %for.body
  br label %return, !dbg !126

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !127

for.inc:                                          ; preds = %if.end
  %inc = add i32 %i.0, 1, !dbg !128
    #dbg_value(i32 %inc, !109, !DIExpression(), !110)
  br label %for.cond, !dbg !129, !llvm.loop !130

for.end:                                          ; preds = %for.cond
  %call4 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef 3168) #2, !dbg !133
  %call5 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef 1568) #2, !dbg !134
  %call6 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 1568) #2, !dbg !135
  br label %return, !dbg !136

return:                                           ; preds = %for.end, %if.then
  %retval.0 = phi i32 [ 1, %if.then ], [ 0, %for.end ], !dbg !110
  ret i32 %retval.0, !dbg !137
}

; Function Attrs: noinline nounwind optnone
define internal i32 @test_keys() #0 !dbg !138 {
entry:
  %pk = alloca [1568 x i8], align 1
  %sk = alloca [3168 x i8], align 1
  %ct = alloca [1568 x i8], align 1
  %key_a = alloca [32 x i8], align 1
  %key_b = alloca [32 x i8], align 1
    #dbg_declare(ptr %pk, !139, !DIExpression(), !143)
    #dbg_declare(ptr %sk, !144, !DIExpression(), !148)
    #dbg_declare(ptr %ct, !149, !DIExpression(), !150)
    #dbg_declare(ptr %key_a, !151, !DIExpression(), !155)
    #dbg_declare(ptr %key_b, !156, !DIExpression(), !157)
  %arraydecay = getelementptr inbounds [1568 x i8], ptr %pk, i32 0, i32 0, !dbg !158
  %arraydecay1 = getelementptr inbounds [3168 x i8], ptr %sk, i32 0, i32 0, !dbg !159
  %call = call i32 @pqcrystals_kyber1024_ref_keypair(ptr noundef %arraydecay, ptr noundef %arraydecay1) #2, !dbg !160
  %arraydecay2 = getelementptr inbounds [1568 x i8], ptr %ct, i32 0, i32 0, !dbg !161
  %arraydecay3 = getelementptr inbounds [32 x i8], ptr %key_b, i32 0, i32 0, !dbg !162
  %arraydecay4 = getelementptr inbounds [1568 x i8], ptr %pk, i32 0, i32 0, !dbg !163
  %call5 = call i32 @pqcrystals_kyber1024_ref_enc(ptr noundef %arraydecay2, ptr noundef %arraydecay3, ptr noundef %arraydecay4) #2, !dbg !164
  %arraydecay6 = getelementptr inbounds [32 x i8], ptr %key_a, i32 0, i32 0, !dbg !165
  %arraydecay7 = getelementptr inbounds [1568 x i8], ptr %ct, i32 0, i32 0, !dbg !166
  %arraydecay8 = getelementptr inbounds [3168 x i8], ptr %sk, i32 0, i32 0, !dbg !167
  %call9 = call i32 @pqcrystals_kyber1024_ref_dec(ptr noundef %arraydecay6, ptr noundef %arraydecay7, ptr noundef %arraydecay8) #2, !dbg !168
  %arraydecay10 = getelementptr inbounds [32 x i8], ptr %key_a, i32 0, i32 0, !dbg !169
  %arraydecay11 = getelementptr inbounds [32 x i8], ptr %key_b, i32 0, i32 0, !dbg !171
  %call12 = call i32 @memcmp(ptr noundef %arraydecay10, ptr noundef %arraydecay11, i32 noundef 32) #2, !dbg !172
  %tobool = icmp ne i32 %call12, 0, !dbg !172
  br i1 %tobool, label %if.then, label %if.end, !dbg !172

if.then:                                          ; preds = %entry
  %call13 = call i32 (ptr, ...) @printf(ptr noundef @.str.3) #2, !dbg !173
  br label %return, !dbg !175

if.end:                                           ; preds = %entry
  br label %return, !dbg !176

return:                                           ; preds = %if.end, %if.then
  %retval.0 = phi i32 [ 1, %if.then ], [ 0, %if.end ], !dbg !177
  ret i32 %retval.0, !dbg !178
}

; Function Attrs: noinline nounwind optnone
define internal i32 @test_invalid_sk_a() #0 !dbg !179 {
entry:
  %pk = alloca [1568 x i8], align 1
  %sk = alloca [3168 x i8], align 1
  %ct = alloca [1568 x i8], align 1
  %key_a = alloca [32 x i8], align 1
  %key_b = alloca [32 x i8], align 1
    #dbg_declare(ptr %pk, !180, !DIExpression(), !181)
    #dbg_declare(ptr %sk, !182, !DIExpression(), !183)
    #dbg_declare(ptr %ct, !184, !DIExpression(), !185)
    #dbg_declare(ptr %key_a, !186, !DIExpression(), !187)
    #dbg_declare(ptr %key_b, !188, !DIExpression(), !189)
  %arraydecay = getelementptr inbounds [1568 x i8], ptr %pk, i32 0, i32 0, !dbg !190
  %arraydecay1 = getelementptr inbounds [3168 x i8], ptr %sk, i32 0, i32 0, !dbg !191
  %call = call i32 @pqcrystals_kyber1024_ref_keypair(ptr noundef %arraydecay, ptr noundef %arraydecay1) #2, !dbg !192
  %arraydecay2 = getelementptr inbounds [1568 x i8], ptr %ct, i32 0, i32 0, !dbg !193
  %arraydecay3 = getelementptr inbounds [32 x i8], ptr %key_b, i32 0, i32 0, !dbg !194
  %arraydecay4 = getelementptr inbounds [1568 x i8], ptr %pk, i32 0, i32 0, !dbg !195
  %call5 = call i32 @pqcrystals_kyber1024_ref_enc(ptr noundef %arraydecay2, ptr noundef %arraydecay3, ptr noundef %arraydecay4) #2, !dbg !196
  %arraydecay6 = getelementptr inbounds [3168 x i8], ptr %sk, i32 0, i32 0, !dbg !197
  call void @randombytes(ptr noundef %arraydecay6, i32 noundef 3168) #2, !dbg !198
  %arraydecay7 = getelementptr inbounds [32 x i8], ptr %key_a, i32 0, i32 0, !dbg !199
  %arraydecay8 = getelementptr inbounds [1568 x i8], ptr %ct, i32 0, i32 0, !dbg !200
  %arraydecay9 = getelementptr inbounds [3168 x i8], ptr %sk, i32 0, i32 0, !dbg !201
  %call10 = call i32 @pqcrystals_kyber1024_ref_dec(ptr noundef %arraydecay7, ptr noundef %arraydecay8, ptr noundef %arraydecay9) #2, !dbg !202
  %arraydecay11 = getelementptr inbounds [32 x i8], ptr %key_a, i32 0, i32 0, !dbg !203
  %arraydecay12 = getelementptr inbounds [32 x i8], ptr %key_b, i32 0, i32 0, !dbg !205
  %call13 = call i32 @memcmp(ptr noundef %arraydecay11, ptr noundef %arraydecay12, i32 noundef 32) #2, !dbg !206
  %tobool = icmp ne i32 %call13, 0, !dbg !206
  br i1 %tobool, label %if.end, label %if.then, !dbg !207

if.then:                                          ; preds = %entry
  %call14 = call i32 (ptr, ...) @printf(ptr noundef @.str.4) #2, !dbg !208
  br label %return, !dbg !210

if.end:                                           ; preds = %entry
  br label %return, !dbg !211

return:                                           ; preds = %if.end, %if.then
  %retval.0 = phi i32 [ 0, %if.end ], [ 1, %if.then ], !dbg !212
  ret i32 %retval.0, !dbg !213
}

; Function Attrs: noinline nounwind optnone
define internal i32 @test_invalid_ciphertext() #0 !dbg !214 {
entry:
  %pk = alloca [1568 x i8], align 1
  %sk = alloca [3168 x i8], align 1
  %ct = alloca [1568 x i8], align 1
  %key_a = alloca [32 x i8], align 1
  %key_b = alloca [32 x i8], align 1
  %b = alloca i8, align 1
  %pos = alloca i32, align 4
    #dbg_declare(ptr %pk, !215, !DIExpression(), !216)
    #dbg_declare(ptr %sk, !217, !DIExpression(), !218)
    #dbg_declare(ptr %ct, !219, !DIExpression(), !220)
    #dbg_declare(ptr %key_a, !221, !DIExpression(), !222)
    #dbg_declare(ptr %key_b, !223, !DIExpression(), !224)
    #dbg_declare(ptr %b, !225, !DIExpression(), !226)
    #dbg_declare(ptr %pos, !227, !DIExpression(), !228)
  br label %do.body, !dbg !229

do.body:                                          ; preds = %do.cond, %entry
  call void @randombytes(ptr noundef %b, i32 noundef 1) #2, !dbg !230
  br label %do.cond, !dbg !232

do.cond:                                          ; preds = %do.body
  %0 = load i8, ptr %b, align 1, !dbg !233
  %tobool = icmp ne i8 %0, 0, !dbg !234
  %lnot = xor i1 %tobool, true, !dbg !234
  br i1 %lnot, label %do.body, label %do.end, !dbg !232, !llvm.loop !235

do.end:                                           ; preds = %do.cond
  call void @randombytes(ptr noundef %pos, i32 noundef 4) #2, !dbg !237
  %arraydecay = getelementptr inbounds [1568 x i8], ptr %pk, i32 0, i32 0, !dbg !238
  %arraydecay1 = getelementptr inbounds [3168 x i8], ptr %sk, i32 0, i32 0, !dbg !239
  %call = call i32 @pqcrystals_kyber1024_ref_keypair(ptr noundef %arraydecay, ptr noundef %arraydecay1) #2, !dbg !240
  %arraydecay2 = getelementptr inbounds [1568 x i8], ptr %ct, i32 0, i32 0, !dbg !241
  %arraydecay3 = getelementptr inbounds [32 x i8], ptr %key_b, i32 0, i32 0, !dbg !242
  %arraydecay4 = getelementptr inbounds [1568 x i8], ptr %pk, i32 0, i32 0, !dbg !243
  %call5 = call i32 @pqcrystals_kyber1024_ref_enc(ptr noundef %arraydecay2, ptr noundef %arraydecay3, ptr noundef %arraydecay4) #2, !dbg !244
  %1 = load i8, ptr %b, align 1, !dbg !245
  %conv = zext i8 %1 to i32, !dbg !245
  %2 = load i32, ptr %pos, align 4, !dbg !246
  %rem = urem i32 %2, 1568, !dbg !247
  %arrayidx = getelementptr inbounds nuw [1568 x i8], ptr %ct, i32 0, i32 %rem, !dbg !248
  %3 = load i8, ptr %arrayidx, align 1, !dbg !249
  %conv6 = zext i8 %3 to i32, !dbg !249
  %xor = xor i32 %conv6, %conv, !dbg !249
  %conv7 = trunc i32 %xor to i8, !dbg !249
  store i8 %conv7, ptr %arrayidx, align 1, !dbg !249
  %arraydecay8 = getelementptr inbounds [32 x i8], ptr %key_a, i32 0, i32 0, !dbg !250
  %arraydecay9 = getelementptr inbounds [1568 x i8], ptr %ct, i32 0, i32 0, !dbg !251
  %arraydecay10 = getelementptr inbounds [3168 x i8], ptr %sk, i32 0, i32 0, !dbg !252
  %call11 = call i32 @pqcrystals_kyber1024_ref_dec(ptr noundef %arraydecay8, ptr noundef %arraydecay9, ptr noundef %arraydecay10) #2, !dbg !253
  %arraydecay12 = getelementptr inbounds [32 x i8], ptr %key_a, i32 0, i32 0, !dbg !254
  %arraydecay13 = getelementptr inbounds [32 x i8], ptr %key_b, i32 0, i32 0, !dbg !256
  %call14 = call i32 @memcmp(ptr noundef %arraydecay12, ptr noundef %arraydecay13, i32 noundef 32) #2, !dbg !257
  %tobool15 = icmp ne i32 %call14, 0, !dbg !257
  br i1 %tobool15, label %if.end, label %if.then, !dbg !258

if.then:                                          ; preds = %do.end
  %call16 = call i32 (ptr, ...) @printf(ptr noundef @.str.5) #2, !dbg !259
  br label %return, !dbg !261

if.end:                                           ; preds = %do.end
  br label %return, !dbg !262

return:                                           ; preds = %if.end, %if.then
  %retval.0 = phi i32 [ 0, %if.end ], [ 1, %if.then ], !dbg !263
  ret i32 %retval.0, !dbg !264
}

declare dso_local i32 @printf(ptr noundef, ...) #1

declare dso_local i32 @memcmp(ptr noundef, ptr noundef, i32 noundef) #1

; Function Attrs: noinline nounwind optnone
define dso_local void @randombytes(ptr noundef %out, i32 noundef %outlen) #0 !dbg !28 {
entry:
    #dbg_value(ptr %out, !265, !DIExpression(), !266)
    #dbg_value(i32 %outlen, !267, !DIExpression(), !266)
  br label %while.cond, !dbg !268

while.cond:                                       ; preds = %if.end6, %if.then, %entry
  %0 = load i32, ptr @randombytes.fd, align 4, !dbg !269
  %cmp = icmp eq i32 %0, -1, !dbg !270
  br i1 %cmp, label %while.body, label %while.end, !dbg !268

while.body:                                       ; preds = %while.cond
  %call = call i32 (ptr, i32, ...) @open(ptr noundef @.str.6, i32 noundef 0) #2, !dbg !271
  store i32 %call, ptr @randombytes.fd, align 4, !dbg !273
  %1 = load i32, ptr @randombytes.fd, align 4, !dbg !274
  %cmp1 = icmp eq i32 %1, -1, !dbg !276
  br i1 %cmp1, label %land.lhs.true, label %if.else, !dbg !277

land.lhs.true:                                    ; preds = %while.body
  %call2 = call ptr @__errno() #2, !dbg !278
  %2 = load i32, ptr %call2, align 4, !dbg !278
  %cmp3 = icmp eq i32 %2, 4, !dbg !279
  br i1 %cmp3, label %if.then, label %if.else, !dbg !277

if.then:                                          ; preds = %land.lhs.true
  br label %while.cond, !dbg !280, !llvm.loop !281

if.else:                                          ; preds = %land.lhs.true, %while.body
  %3 = load i32, ptr @randombytes.fd, align 4, !dbg !283
  %cmp4 = icmp eq i32 %3, -1, !dbg !285
  br i1 %cmp4, label %if.then5, label %if.end, !dbg !285

if.then5:                                         ; preds = %if.else
  call void @abort() #2, !dbg !286
  br label %if.end, !dbg !286

if.end:                                           ; preds = %if.then5, %if.else
  br label %if.end6

if.end6:                                          ; preds = %if.end
  br label %while.cond, !dbg !268, !llvm.loop !281

while.end:                                        ; preds = %while.cond
  br label %while.cond7, !dbg !287

while.cond7:                                      ; preds = %if.end20, %if.then15, %while.end
  %outlen.addr.0 = phi i32 [ %outlen, %while.end ], [ %outlen.addr.0, %if.then15 ], [ %sub, %if.end20 ]
  %out.addr.0 = phi ptr [ %out, %while.end ], [ %out.addr.0, %if.then15 ], [ %add.ptr, %if.end20 ]
    #dbg_value(ptr %out.addr.0, !265, !DIExpression(), !266)
    #dbg_value(i32 %outlen.addr.0, !267, !DIExpression(), !266)
  %cmp8 = icmp ugt i32 %outlen.addr.0, 0, !dbg !288
  br i1 %cmp8, label %while.body9, label %while.end21, !dbg !287

while.body9:                                      ; preds = %while.cond7
  %4 = load i32, ptr @randombytes.fd, align 4, !dbg !289
  %call10 = call i32 @read(i32 noundef %4, ptr noundef %out.addr.0, i32 noundef %outlen.addr.0) #2, !dbg !291
    #dbg_value(i32 %call10, !292, !DIExpression(), !266)
  %cmp11 = icmp eq i32 %call10, -1, !dbg !297
  br i1 %cmp11, label %land.lhs.true12, label %if.else16, !dbg !299

land.lhs.true12:                                  ; preds = %while.body9
  %call13 = call ptr @__errno() #2, !dbg !300
  %5 = load i32, ptr %call13, align 4, !dbg !300
  %cmp14 = icmp eq i32 %5, 4, !dbg !301
  br i1 %cmp14, label %if.then15, label %if.else16, !dbg !299

if.then15:                                        ; preds = %land.lhs.true12
  br label %while.cond7, !dbg !302, !llvm.loop !303

if.else16:                                        ; preds = %land.lhs.true12, %while.body9
  %cmp17 = icmp eq i32 %call10, -1, !dbg !305
  br i1 %cmp17, label %if.then18, label %if.end19, !dbg !305

if.then18:                                        ; preds = %if.else16
  call void @abort() #2, !dbg !307
  br label %if.end19, !dbg !307

if.end19:                                         ; preds = %if.then18, %if.else16
  br label %if.end20

if.end20:                                         ; preds = %if.end19
  %add.ptr = getelementptr inbounds i8, ptr %out.addr.0, i32 %call10, !dbg !308
    #dbg_value(ptr %add.ptr, !265, !DIExpression(), !266)
  %sub = sub i32 %outlen.addr.0, %call10, !dbg !309
    #dbg_value(i32 %sub, !267, !DIExpression(), !266)
  br label %while.cond7, !dbg !287, !llvm.loop !303

while.end21:                                      ; preds = %while.cond7
  ret void, !dbg !310
}

declare dso_local i32 @open(ptr noundef, i32 noundef, ...) #1

declare dso_local ptr @__errno() #1

declare dso_local void @abort() #1

declare dso_local i32 @read(i32 noundef, ptr noundef, i32 noundef) #1

; Function Attrs: noinline nounwind optnone
define dso_local i32 @pqcrystals_kyber1024_ref_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) #0 !dbg !311 {
entry:
    #dbg_value(ptr %pk, !317, !DIExpression(), !318)
    #dbg_value(ptr %sk, !319, !DIExpression(), !318)
    #dbg_value(ptr %coins, !320, !DIExpression(), !318)
  call void @pqcrystals_kyber1024_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) #2, !dbg !321
  %add.ptr = getelementptr inbounds i8, ptr %sk, i32 1536, !dbg !322
  %call = call ptr @memcpy(ptr noundef %add.ptr, ptr noundef %pk, i32 noundef 1568) #2, !dbg !323
  %add.ptr1 = getelementptr inbounds i8, ptr %sk, i32 3168, !dbg !324
  %add.ptr2 = getelementptr inbounds i8, ptr %add.ptr1, i32 -64, !dbg !324
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef %add.ptr2, ptr noundef %pk, i32 noundef 1568) #2, !dbg !324
  %add.ptr3 = getelementptr inbounds i8, ptr %sk, i32 3168, !dbg !325
  %add.ptr4 = getelementptr inbounds i8, ptr %add.ptr3, i32 -32, !dbg !326
  %add.ptr5 = getelementptr inbounds i8, ptr %coins, i32 32, !dbg !327
  %call6 = call ptr @memcpy(ptr noundef %add.ptr4, ptr noundef %add.ptr5, i32 noundef 32) #2, !dbg !328
  ret i32 0, !dbg !329
}

declare dso_local ptr @memcpy(ptr noundef, ptr noundef, i32 noundef) #1

; Function Attrs: noinline nounwind optnone
define dso_local i32 @pqcrystals_kyber1024_ref_keypair(ptr noundef %pk, ptr noundef %sk) #0 !dbg !330 {
entry:
  %coins = alloca [64 x i8], align 1
    #dbg_value(ptr %pk, !333, !DIExpression(), !334)
    #dbg_value(ptr %sk, !335, !DIExpression(), !334)
    #dbg_declare(ptr %coins, !336, !DIExpression(), !340)
  %arraydecay = getelementptr inbounds [64 x i8], ptr %coins, i32 0, i32 0, !dbg !341
  call void @randombytes(ptr noundef %arraydecay, i32 noundef 64) #2, !dbg !342
  %arraydecay1 = getelementptr inbounds [64 x i8], ptr %coins, i32 0, i32 0, !dbg !343
  %call = call i32 @pqcrystals_kyber1024_ref_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %arraydecay1) #2, !dbg !344
  ret i32 0, !dbg !345
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @pqcrystals_kyber1024_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef %coins) #0 !dbg !346 {
entry:
  %buf = alloca [64 x i8], align 1
  %kr = alloca [64 x i8], align 1
    #dbg_value(ptr %ct, !349, !DIExpression(), !350)
    #dbg_value(ptr %ss, !351, !DIExpression(), !350)
    #dbg_value(ptr %pk, !352, !DIExpression(), !350)
    #dbg_value(ptr %coins, !353, !DIExpression(), !350)
    #dbg_declare(ptr %buf, !354, !DIExpression(), !355)
    #dbg_declare(ptr %kr, !356, !DIExpression(), !357)
  %arraydecay = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !358
  %call = call ptr @memcpy(ptr noundef %arraydecay, ptr noundef %coins, i32 noundef 32) #2, !dbg !359
  %arraydecay1 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !360
  %add.ptr = getelementptr inbounds i8, ptr %arraydecay1, i32 32, !dbg !360
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef %add.ptr, ptr noundef %pk, i32 noundef 1568) #2, !dbg !360
  %arraydecay2 = getelementptr inbounds [64 x i8], ptr %kr, i32 0, i32 0, !dbg !361
  %arraydecay3 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !361
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef %arraydecay2, ptr noundef %arraydecay3, i32 noundef 64) #2, !dbg !361
  %arraydecay4 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !362
  %arraydecay5 = getelementptr inbounds [64 x i8], ptr %kr, i32 0, i32 0, !dbg !363
  %add.ptr6 = getelementptr inbounds i8, ptr %arraydecay5, i32 32, !dbg !364
  call void @pqcrystals_kyber1024_ref_indcpa_enc(ptr noundef %ct, ptr noundef %arraydecay4, ptr noundef %pk, ptr noundef %add.ptr6) #2, !dbg !365
  %arraydecay7 = getelementptr inbounds [64 x i8], ptr %kr, i32 0, i32 0, !dbg !366
  %call8 = call ptr @memcpy(ptr noundef %ss, ptr noundef %arraydecay7, i32 noundef 32) #2, !dbg !367
  ret i32 0, !dbg !368
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @pqcrystals_kyber1024_ref_enc(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk) #0 !dbg !369 {
entry:
  %coins = alloca [32 x i8], align 1
    #dbg_value(ptr %ct, !370, !DIExpression(), !371)
    #dbg_value(ptr %ss, !372, !DIExpression(), !371)
    #dbg_value(ptr %pk, !373, !DIExpression(), !371)
    #dbg_declare(ptr %coins, !374, !DIExpression(), !375)
  %arraydecay = getelementptr inbounds [32 x i8], ptr %coins, i32 0, i32 0, !dbg !376
  call void @randombytes(ptr noundef %arraydecay, i32 noundef 32) #2, !dbg !377
  %arraydecay1 = getelementptr inbounds [32 x i8], ptr %coins, i32 0, i32 0, !dbg !378
  %call = call i32 @pqcrystals_kyber1024_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef %arraydecay1) #2, !dbg !379
  ret i32 0, !dbg !380
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @pqcrystals_kyber1024_ref_dec(ptr noundef %ss, ptr noundef %ct, ptr noundef %sk) #0 !dbg !381 {
entry:
  %buf = alloca [64 x i8], align 1
  %kr = alloca [64 x i8], align 1
  %cmp = alloca [1568 x i8], align 1
    #dbg_value(ptr %ss, !384, !DIExpression(), !385)
    #dbg_value(ptr %ct, !386, !DIExpression(), !385)
    #dbg_value(ptr %sk, !387, !DIExpression(), !385)
    #dbg_declare(ptr %buf, !388, !DIExpression(), !389)
    #dbg_declare(ptr %kr, !390, !DIExpression(), !391)
    #dbg_declare(ptr %cmp, !392, !DIExpression(), !393)
  %add.ptr = getelementptr inbounds i8, ptr %sk, i32 1536, !dbg !394
    #dbg_value(ptr %add.ptr, !395, !DIExpression(), !385)
  %arraydecay = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !396
  call void @pqcrystals_kyber1024_ref_indcpa_dec(ptr noundef %arraydecay, ptr noundef %ct, ptr noundef %sk) #2, !dbg !397
  %arraydecay1 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !398
  %add.ptr2 = getelementptr inbounds i8, ptr %arraydecay1, i32 32, !dbg !399
  %add.ptr3 = getelementptr inbounds i8, ptr %sk, i32 3168, !dbg !400
  %add.ptr4 = getelementptr inbounds i8, ptr %add.ptr3, i32 -64, !dbg !401
  %call = call ptr @memcpy(ptr noundef %add.ptr2, ptr noundef %add.ptr4, i32 noundef 32) #2, !dbg !402
  %arraydecay5 = getelementptr inbounds [64 x i8], ptr %kr, i32 0, i32 0, !dbg !403
  %arraydecay6 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !403
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef %arraydecay5, ptr noundef %arraydecay6, i32 noundef 64) #2, !dbg !403
  %arraydecay7 = getelementptr inbounds [1568 x i8], ptr %cmp, i32 0, i32 0, !dbg !404
  %arraydecay8 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !405
  %arraydecay9 = getelementptr inbounds [64 x i8], ptr %kr, i32 0, i32 0, !dbg !406
  %add.ptr10 = getelementptr inbounds i8, ptr %arraydecay9, i32 32, !dbg !407
  call void @pqcrystals_kyber1024_ref_indcpa_enc(ptr noundef %arraydecay7, ptr noundef %arraydecay8, ptr noundef %add.ptr, ptr noundef %add.ptr10) #2, !dbg !408
  %arraydecay11 = getelementptr inbounds [1568 x i8], ptr %cmp, i32 0, i32 0, !dbg !409
  %call12 = call i32 @pqcrystals_kyber1024_ref_verify(ptr noundef %ct, ptr noundef %arraydecay11, i32 noundef 1568) #2, !dbg !410
    #dbg_value(i32 %call12, !411, !DIExpression(), !385)
  %add.ptr13 = getelementptr inbounds i8, ptr %sk, i32 3168, !dbg !412
  %add.ptr14 = getelementptr inbounds i8, ptr %add.ptr13, i32 -32, !dbg !412
  call void @pqcrystals_kyber1024_ref_kyber_shake256_rkprf(ptr noundef %ss, ptr noundef %add.ptr14, ptr noundef %ct) #2, !dbg !412
  %arraydecay15 = getelementptr inbounds [64 x i8], ptr %kr, i32 0, i32 0, !dbg !413
  %tobool = icmp ne i32 %call12, 0, !dbg !414
  %lnot = xor i1 %tobool, true, !dbg !414
  %lnot.ext = zext i1 %lnot to i32, !dbg !414
  %conv = trunc i32 %lnot.ext to i8, !dbg !414
  call void @pqcrystals_kyber1024_ref_cmov(ptr noundef %ss, ptr noundef %arraydecay15, i32 noundef 32, i8 noundef zeroext %conv) #2, !dbg !415
  ret i32 0, !dbg !416
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_gen_matrix(ptr noundef %a, ptr noundef %seed, i32 noundef %transposed) #0 !dbg !417 {
entry:
  %buf = alloca [504 x i8], align 1
  %state = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %a, !438, !DIExpression(), !439)
    #dbg_value(ptr %seed, !440, !DIExpression(), !439)
    #dbg_value(i32 %transposed, !441, !DIExpression(), !439)
    #dbg_declare(ptr %buf, !442, !DIExpression(), !446)
    #dbg_declare(ptr %state, !447, !DIExpression(), !459)
    #dbg_value(i32 0, !460, !DIExpression(), !439)
  br label %for.cond, !dbg !461

for.cond:                                         ; preds = %for.inc20, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc21, %for.inc20 ], !dbg !463
    #dbg_value(i32 %i.0, !460, !DIExpression(), !439)
  %cmp = icmp ult i32 %i.0, 4, !dbg !464
  br i1 %cmp, label %for.body, label %for.end22, !dbg !466

for.body:                                         ; preds = %for.cond
    #dbg_value(i32 0, !467, !DIExpression(), !439)
  br label %for.cond1, !dbg !468

for.cond1:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ], !dbg !471
    #dbg_value(i32 %j.0, !467, !DIExpression(), !439)
  %cmp2 = icmp ult i32 %j.0, 4, !dbg !472
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !474

for.body3:                                        ; preds = %for.cond1
  %tobool = icmp ne i32 %transposed, 0, !dbg !475
  br i1 %tobool, label %if.then, label %if.else, !dbg !475

if.then:                                          ; preds = %for.body3
  %conv = trunc i32 %i.0 to i8, !dbg !478
  %conv4 = trunc i32 %j.0 to i8, !dbg !478
  call void @pqcrystals_kyber1024_ref_kyber_shake128_absorb(ptr noundef %state, ptr noundef %seed, i8 noundef zeroext %conv, i8 noundef zeroext %conv4) #2, !dbg !478
  br label %if.end, !dbg !478

if.else:                                          ; preds = %for.body3
  %conv5 = trunc i32 %j.0 to i8, !dbg !479
  %conv6 = trunc i32 %i.0 to i8, !dbg !479
  call void @pqcrystals_kyber1024_ref_kyber_shake128_absorb(ptr noundef %state, ptr noundef %seed, i8 noundef zeroext %conv5, i8 noundef zeroext %conv6) #2, !dbg !479
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %arraydecay = getelementptr inbounds [504 x i8], ptr %buf, i32 0, i32 0, !dbg !480
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %arraydecay, i32 noundef 3, ptr noundef %state) #2, !dbg !480
    #dbg_value(i32 504, !481, !DIExpression(), !439)
  %arrayidx = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 %i.0, !dbg !482
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %arrayidx, i32 0, i32 0, !dbg !483
  %arrayidx7 = getelementptr inbounds nuw [4 x %struct.poly], ptr %vec, i32 0, i32 %j.0, !dbg !482
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %arrayidx7, i32 0, i32 0, !dbg !484
  %arraydecay8 = getelementptr inbounds [256 x i16], ptr %coeffs, i32 0, i32 0, !dbg !482
  %arraydecay9 = getelementptr inbounds [504 x i8], ptr %buf, i32 0, i32 0, !dbg !485
  %call = call i32 @rej_uniform(ptr noundef %arraydecay8, i32 noundef 256, ptr noundef %arraydecay9, i32 noundef 504) #2, !dbg !486
    #dbg_value(i32 %call, !487, !DIExpression(), !439)
  br label %while.cond, !dbg !488

while.cond:                                       ; preds = %while.body, %if.end
  %ctr.0 = phi i32 [ %call, %if.end ], [ %add, %while.body ], !dbg !489
    #dbg_value(i32 %ctr.0, !487, !DIExpression(), !439)
  %cmp10 = icmp ult i32 %ctr.0, 256, !dbg !490
  br i1 %cmp10, label %while.body, label %while.end, !dbg !488

while.body:                                       ; preds = %while.cond
  %arraydecay12 = getelementptr inbounds [504 x i8], ptr %buf, i32 0, i32 0, !dbg !491
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %arraydecay12, i32 noundef 1, ptr noundef %state) #2, !dbg !491
    #dbg_value(i32 168, !481, !DIExpression(), !439)
  %arrayidx13 = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 %i.0, !dbg !493
  %vec14 = getelementptr inbounds nuw %struct.polyvec, ptr %arrayidx13, i32 0, i32 0, !dbg !494
  %arrayidx15 = getelementptr inbounds nuw [4 x %struct.poly], ptr %vec14, i32 0, i32 %j.0, !dbg !493
  %coeffs16 = getelementptr inbounds nuw %struct.poly, ptr %arrayidx15, i32 0, i32 0, !dbg !495
  %arraydecay17 = getelementptr inbounds [256 x i16], ptr %coeffs16, i32 0, i32 0, !dbg !493
  %add.ptr = getelementptr inbounds nuw i16, ptr %arraydecay17, i32 %ctr.0, !dbg !496
  %sub = sub i32 256, %ctr.0, !dbg !497
  %arraydecay18 = getelementptr inbounds [504 x i8], ptr %buf, i32 0, i32 0, !dbg !498
  %call19 = call i32 @rej_uniform(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef %arraydecay18, i32 noundef 168) #2, !dbg !499
  %add = add i32 %ctr.0, %call19, !dbg !500
    #dbg_value(i32 %add, !487, !DIExpression(), !439)
  br label %while.cond, !dbg !488, !llvm.loop !501

while.end:                                        ; preds = %while.cond
  br label %for.inc, !dbg !503

for.inc:                                          ; preds = %while.end
  %inc = add i32 %j.0, 1, !dbg !504
    #dbg_value(i32 %inc, !467, !DIExpression(), !439)
  br label %for.cond1, !dbg !505, !llvm.loop !506

for.end:                                          ; preds = %for.cond1
  br label %for.inc20, !dbg !508

for.inc20:                                        ; preds = %for.end
  %inc21 = add i32 %i.0, 1, !dbg !509
    #dbg_value(i32 %inc21, !460, !DIExpression(), !439)
  br label %for.cond, !dbg !510, !llvm.loop !511

for.end22:                                        ; preds = %for.cond
  ret void, !dbg !513
}

; Function Attrs: noinline nounwind optnone
define internal i32 @rej_uniform(ptr noundef %r, i32 noundef %len, ptr noundef %buf, i32 noundef %buflen) #0 !dbg !514 {
entry:
    #dbg_value(ptr %r, !518, !DIExpression(), !519)
    #dbg_value(i32 %len, !520, !DIExpression(), !519)
    #dbg_value(ptr %buf, !521, !DIExpression(), !519)
    #dbg_value(i32 %buflen, !522, !DIExpression(), !519)
    #dbg_value(i32 0, !523, !DIExpression(), !519)
    #dbg_value(i32 0, !524, !DIExpression(), !519)
  br label %while.cond, !dbg !525

while.cond:                                       ; preds = %if.end33, %entry
  %ctr.0 = phi i32 [ 0, %entry ], [ %ctr.2, %if.end33 ], !dbg !519
  %pos.0 = phi i32 [ 0, %entry ], [ %add20, %if.end33 ], !dbg !519
    #dbg_value(i32 %pos.0, !523, !DIExpression(), !519)
    #dbg_value(i32 %ctr.0, !524, !DIExpression(), !519)
  %cmp = icmp ult i32 %ctr.0, %len, !dbg !526
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !527

land.rhs:                                         ; preds = %while.cond
  %add = add i32 %pos.0, 3, !dbg !528
  %cmp1 = icmp ule i32 %add, %buflen, !dbg !529
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %0 = phi i1 [ false, %while.cond ], [ %cmp1, %land.rhs ], !dbg !519
  br i1 %0, label %while.body, label %while.end, !dbg !525

while.body:                                       ; preds = %land.end
  %add2 = add i32 %pos.0, 0, !dbg !530
  %arrayidx = getelementptr inbounds nuw i8, ptr %buf, i32 %add2, !dbg !532
  %1 = load i8, ptr %arrayidx, align 1, !dbg !532
  %conv = zext i8 %1 to i32, !dbg !532
  %shr = ashr i32 %conv, 0, !dbg !533
  %add3 = add i32 %pos.0, 1, !dbg !534
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %buf, i32 %add3, !dbg !535
  %2 = load i8, ptr %arrayidx4, align 1, !dbg !535
  %conv5 = zext i8 %2 to i16, !dbg !536
  %conv6 = zext i16 %conv5 to i32, !dbg !536
  %shl = shl i32 %conv6, 8, !dbg !537
  %or = or i32 %shr, %shl, !dbg !538
  %and = and i32 %or, 4095, !dbg !539
  %conv7 = trunc i32 %and to i16, !dbg !540
    #dbg_value(i16 %conv7, !541, !DIExpression(), !519)
  %add8 = add i32 %pos.0, 1, !dbg !542
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %buf, i32 %add8, !dbg !543
  %3 = load i8, ptr %arrayidx9, align 1, !dbg !543
  %conv10 = zext i8 %3 to i32, !dbg !543
  %shr11 = ashr i32 %conv10, 4, !dbg !544
  %add12 = add i32 %pos.0, 2, !dbg !545
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %buf, i32 %add12, !dbg !546
  %4 = load i8, ptr %arrayidx13, align 1, !dbg !546
  %conv14 = zext i8 %4 to i16, !dbg !547
  %conv15 = zext i16 %conv14 to i32, !dbg !547
  %shl16 = shl i32 %conv15, 4, !dbg !548
  %or17 = or i32 %shr11, %shl16, !dbg !549
  %and18 = and i32 %or17, 4095, !dbg !550
  %conv19 = trunc i32 %and18 to i16, !dbg !551
    #dbg_value(i16 %conv19, !552, !DIExpression(), !519)
  %add20 = add i32 %pos.0, 3, !dbg !553
    #dbg_value(i32 %add20, !523, !DIExpression(), !519)
  %conv21 = zext i16 %conv7 to i32, !dbg !554
  %cmp22 = icmp slt i32 %conv21, 3329, !dbg !556
  br i1 %cmp22, label %if.then, label %if.end, !dbg !556

if.then:                                          ; preds = %while.body
  %inc = add i32 %ctr.0, 1, !dbg !557
    #dbg_value(i32 %inc, !524, !DIExpression(), !519)
  %arrayidx24 = getelementptr inbounds nuw i16, ptr %r, i32 %ctr.0, !dbg !558
  store i16 %conv7, ptr %arrayidx24, align 2, !dbg !559
  br label %if.end, !dbg !558

if.end:                                           ; preds = %if.then, %while.body
  %ctr.1 = phi i32 [ %inc, %if.then ], [ %ctr.0, %while.body ], !dbg !519
    #dbg_value(i32 %ctr.1, !524, !DIExpression(), !519)
  %cmp25 = icmp ult i32 %ctr.1, %len, !dbg !560
  br i1 %cmp25, label %land.lhs.true, label %if.end33, !dbg !562

land.lhs.true:                                    ; preds = %if.end
  %conv27 = zext i16 %conv19 to i32, !dbg !563
  %cmp28 = icmp slt i32 %conv27, 3329, !dbg !564
  br i1 %cmp28, label %if.then30, label %if.end33, !dbg !562

if.then30:                                        ; preds = %land.lhs.true
  %inc31 = add i32 %ctr.1, 1, !dbg !565
    #dbg_value(i32 %inc31, !524, !DIExpression(), !519)
  %arrayidx32 = getelementptr inbounds nuw i16, ptr %r, i32 %ctr.1, !dbg !566
  store i16 %conv19, ptr %arrayidx32, align 2, !dbg !567
  br label %if.end33, !dbg !566

if.end33:                                         ; preds = %if.then30, %land.lhs.true, %if.end
  %ctr.2 = phi i32 [ %inc31, %if.then30 ], [ %ctr.1, %land.lhs.true ], [ %ctr.1, %if.end ], !dbg !568
    #dbg_value(i32 %ctr.2, !524, !DIExpression(), !519)
  br label %while.cond, !dbg !525, !llvm.loop !569

while.end:                                        ; preds = %land.end
  ret i32 %ctr.0, !dbg !571
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) #0 !dbg !572 {
entry:
  %buf = alloca [64 x i8], align 1
  %a = alloca [4 x %struct.polyvec], align 2
  %e = alloca %struct.polyvec, align 2
  %pkpv = alloca %struct.polyvec, align 2
  %skpv = alloca %struct.polyvec, align 2
    #dbg_value(ptr %pk, !575, !DIExpression(), !576)
    #dbg_value(ptr %sk, !577, !DIExpression(), !576)
    #dbg_value(ptr %coins, !578, !DIExpression(), !576)
    #dbg_declare(ptr %buf, !579, !DIExpression(), !580)
  %arraydecay = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !581
    #dbg_value(ptr %arraydecay, !582, !DIExpression(), !576)
  %arraydecay1 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !583
  %add.ptr = getelementptr inbounds i8, ptr %arraydecay1, i32 32, !dbg !584
    #dbg_value(ptr %add.ptr, !585, !DIExpression(), !576)
    #dbg_value(i8 0, !586, !DIExpression(), !576)
    #dbg_declare(ptr %a, !587, !DIExpression(), !589)
    #dbg_declare(ptr %e, !590, !DIExpression(), !591)
    #dbg_declare(ptr %pkpv, !592, !DIExpression(), !593)
    #dbg_declare(ptr %skpv, !594, !DIExpression(), !595)
  %arraydecay2 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !596
  %call = call ptr @memcpy(ptr noundef %arraydecay2, ptr noundef %coins, i32 noundef 32) #2, !dbg !597
  %arrayidx = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 32, !dbg !598
  store i8 4, ptr %arrayidx, align 1, !dbg !599
  %arraydecay3 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !600
  %arraydecay4 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !600
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef %arraydecay3, ptr noundef %arraydecay4, i32 noundef 33) #2, !dbg !600
  %arraydecay5 = getelementptr inbounds [4 x %struct.polyvec], ptr %a, i32 0, i32 0, !dbg !601
  call void @pqcrystals_kyber1024_ref_gen_matrix(ptr noundef %arraydecay5, ptr noundef %arraydecay, i32 noundef 0) #2, !dbg !601
    #dbg_value(i32 0, !602, !DIExpression(), !576)
  br label %for.cond, !dbg !603

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc7, %for.inc ], !dbg !605
  %nonce.0 = phi i8 [ 0, %entry ], [ %inc, %for.inc ], !dbg !576
    #dbg_value(i8 %nonce.0, !586, !DIExpression(), !576)
    #dbg_value(i32 %i.0, !602, !DIExpression(), !576)
  %cmp = icmp ult i32 %i.0, 4, !dbg !606
  br i1 %cmp, label %for.body, label %for.end, !dbg !608

for.body:                                         ; preds = %for.cond
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %skpv, i32 0, i32 0, !dbg !609
  %arrayidx6 = getelementptr inbounds nuw [4 x %struct.poly], ptr %vec, i32 0, i32 %i.0, !dbg !610
  %inc = add i8 %nonce.0, 1, !dbg !611
    #dbg_value(i8 %inc, !586, !DIExpression(), !576)
  call void @pqcrystals_kyber1024_ref_poly_getnoise_eta1(ptr noundef %arrayidx6, ptr noundef %add.ptr, i8 noundef zeroext %nonce.0) #2, !dbg !612
  br label %for.inc, !dbg !612

for.inc:                                          ; preds = %for.body
  %inc7 = add i32 %i.0, 1, !dbg !613
    #dbg_value(i32 %inc7, !602, !DIExpression(), !576)
  br label %for.cond, !dbg !614, !llvm.loop !615

for.end:                                          ; preds = %for.cond
    #dbg_value(i32 0, !602, !DIExpression(), !576)
  br label %for.cond8, !dbg !617

for.cond8:                                        ; preds = %for.inc14, %for.end
  %i.1 = phi i32 [ 0, %for.end ], [ %inc15, %for.inc14 ], !dbg !619
  %nonce.1 = phi i8 [ %nonce.0, %for.end ], [ %inc13, %for.inc14 ], !dbg !576
    #dbg_value(i8 %nonce.1, !586, !DIExpression(), !576)
    #dbg_value(i32 %i.1, !602, !DIExpression(), !576)
  %cmp9 = icmp ult i32 %i.1, 4, !dbg !620
  br i1 %cmp9, label %for.body10, label %for.end16, !dbg !622

for.body10:                                       ; preds = %for.cond8
  %vec11 = getelementptr inbounds nuw %struct.polyvec, ptr %e, i32 0, i32 0, !dbg !623
  %arrayidx12 = getelementptr inbounds nuw [4 x %struct.poly], ptr %vec11, i32 0, i32 %i.1, !dbg !624
  %inc13 = add i8 %nonce.1, 1, !dbg !625
    #dbg_value(i8 %inc13, !586, !DIExpression(), !576)
  call void @pqcrystals_kyber1024_ref_poly_getnoise_eta1(ptr noundef %arrayidx12, ptr noundef %add.ptr, i8 noundef zeroext %nonce.1) #2, !dbg !626
  br label %for.inc14, !dbg !626

for.inc14:                                        ; preds = %for.body10
  %inc15 = add i32 %i.1, 1, !dbg !627
    #dbg_value(i32 %inc15, !602, !DIExpression(), !576)
  br label %for.cond8, !dbg !628, !llvm.loop !629

for.end16:                                        ; preds = %for.cond8
  call void @pqcrystals_kyber1024_ref_polyvec_ntt(ptr noundef %skpv) #2, !dbg !631
  call void @pqcrystals_kyber1024_ref_polyvec_ntt(ptr noundef %e) #2, !dbg !632
    #dbg_value(i32 0, !602, !DIExpression(), !576)
  br label %for.cond17, !dbg !633

for.cond17:                                       ; preds = %for.inc25, %for.end16
  %i.2 = phi i32 [ 0, %for.end16 ], [ %inc26, %for.inc25 ], !dbg !635
    #dbg_value(i32 %i.2, !602, !DIExpression(), !576)
  %cmp18 = icmp ult i32 %i.2, 4, !dbg !636
  br i1 %cmp18, label %for.body19, label %for.end27, !dbg !638

for.body19:                                       ; preds = %for.cond17
  %vec20 = getelementptr inbounds nuw %struct.polyvec, ptr %pkpv, i32 0, i32 0, !dbg !639
  %arrayidx21 = getelementptr inbounds nuw [4 x %struct.poly], ptr %vec20, i32 0, i32 %i.2, !dbg !641
  %arrayidx22 = getelementptr inbounds nuw [4 x %struct.polyvec], ptr %a, i32 0, i32 %i.2, !dbg !642
  call void @pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery(ptr noundef %arrayidx21, ptr noundef %arrayidx22, ptr noundef %skpv) #2, !dbg !643
  %vec23 = getelementptr inbounds nuw %struct.polyvec, ptr %pkpv, i32 0, i32 0, !dbg !644
  %arrayidx24 = getelementptr inbounds nuw [4 x %struct.poly], ptr %vec23, i32 0, i32 %i.2, !dbg !645
  call void @pqcrystals_kyber1024_ref_poly_tomont(ptr noundef %arrayidx24) #2, !dbg !646
  br label %for.inc25, !dbg !647

for.inc25:                                        ; preds = %for.body19
  %inc26 = add i32 %i.2, 1, !dbg !648
    #dbg_value(i32 %inc26, !602, !DIExpression(), !576)
  br label %for.cond17, !dbg !649, !llvm.loop !650

for.end27:                                        ; preds = %for.cond17
  call void @pqcrystals_kyber1024_ref_polyvec_add(ptr noundef %pkpv, ptr noundef %pkpv, ptr noundef %e) #2, !dbg !652
  call void @pqcrystals_kyber1024_ref_polyvec_reduce(ptr noundef %pkpv) #2, !dbg !653
  call void @pack_sk(ptr noundef %sk, ptr noundef %skpv) #2, !dbg !654
  call void @pack_pk(ptr noundef %pk, ptr noundef %pkpv, ptr noundef %arraydecay) #2, !dbg !655
  ret void, !dbg !656
}

; Function Attrs: noinline nounwind optnone
define internal void @pack_sk(ptr noundef %r, ptr noundef %sk) #0 !dbg !657 {
entry:
    #dbg_value(ptr %r, !660, !DIExpression(), !661)
    #dbg_value(ptr %sk, !662, !DIExpression(), !661)
  call void @pqcrystals_kyber1024_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %sk) #2, !dbg !663
  ret void, !dbg !664
}

; Function Attrs: noinline nounwind optnone
define internal void @pack_pk(ptr noundef %r, ptr noundef %pk, ptr noundef %seed) #0 !dbg !665 {
entry:
    #dbg_value(ptr %r, !668, !DIExpression(), !669)
    #dbg_value(ptr %pk, !670, !DIExpression(), !669)
    #dbg_value(ptr %seed, !671, !DIExpression(), !669)
  call void @pqcrystals_kyber1024_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %pk) #2, !dbg !672
  %add.ptr = getelementptr inbounds i8, ptr %r, i32 1536, !dbg !673
  %call = call ptr @memcpy(ptr noundef %add.ptr, ptr noundef %seed, i32 noundef 32) #2, !dbg !674
  ret void, !dbg !675
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_indcpa_enc(ptr noundef %c, ptr noundef %m, ptr noundef %pk, ptr noundef %coins) #0 !dbg !676 {
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
    #dbg_value(ptr %c, !679, !DIExpression(), !680)
    #dbg_value(ptr %m, !681, !DIExpression(), !680)
    #dbg_value(ptr %pk, !682, !DIExpression(), !680)
    #dbg_value(ptr %coins, !683, !DIExpression(), !680)
    #dbg_declare(ptr %seed, !684, !DIExpression(), !685)
    #dbg_value(i8 0, !686, !DIExpression(), !680)
    #dbg_declare(ptr %sp, !687, !DIExpression(), !688)
    #dbg_declare(ptr %pkpv, !689, !DIExpression(), !690)
    #dbg_declare(ptr %ep, !691, !DIExpression(), !692)
    #dbg_declare(ptr %at, !693, !DIExpression(), !694)
    #dbg_declare(ptr %b, !695, !DIExpression(), !696)
    #dbg_declare(ptr %v, !697, !DIExpression(), !698)
    #dbg_declare(ptr %k, !699, !DIExpression(), !700)
    #dbg_declare(ptr %epp, !701, !DIExpression(), !702)
  %arraydecay = getelementptr inbounds [32 x i8], ptr %seed, i32 0, i32 0, !dbg !703
  call void @unpack_pk(ptr noundef %pkpv, ptr noundef %arraydecay, ptr noundef %pk) #2, !dbg !704
  call void @pqcrystals_kyber1024_ref_poly_frommsg(ptr noundef %k, ptr noundef %m) #2, !dbg !705
  %arraydecay1 = getelementptr inbounds [4 x %struct.polyvec], ptr %at, i32 0, i32 0, !dbg !706
  %arraydecay2 = getelementptr inbounds [32 x i8], ptr %seed, i32 0, i32 0, !dbg !706
  call void @pqcrystals_kyber1024_ref_gen_matrix(ptr noundef %arraydecay1, ptr noundef %arraydecay2, i32 noundef 1) #2, !dbg !706
    #dbg_value(i32 0, !707, !DIExpression(), !680)
  br label %for.cond, !dbg !708

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc4, %for.inc ], !dbg !710
  %nonce.0 = phi i8 [ 0, %entry ], [ %inc, %for.inc ], !dbg !680
    #dbg_value(i8 %nonce.0, !686, !DIExpression(), !680)
    #dbg_value(i32 %i.0, !707, !DIExpression(), !680)
  %cmp = icmp ult i32 %i.0, 4, !dbg !711
  br i1 %cmp, label %for.body, label %for.end, !dbg !713

for.body:                                         ; preds = %for.cond
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %sp, i32 0, i32 0, !dbg !714
  %arraydecay3 = getelementptr inbounds [4 x %struct.poly], ptr %vec, i32 0, i32 0, !dbg !715
  %add.ptr = getelementptr inbounds nuw %struct.poly, ptr %arraydecay3, i32 %i.0, !dbg !716
  %inc = add i8 %nonce.0, 1, !dbg !717
    #dbg_value(i8 %inc, !686, !DIExpression(), !680)
  call void @pqcrystals_kyber1024_ref_poly_getnoise_eta1(ptr noundef %add.ptr, ptr noundef %coins, i8 noundef zeroext %nonce.0) #2, !dbg !718
  br label %for.inc, !dbg !718

for.inc:                                          ; preds = %for.body
  %inc4 = add i32 %i.0, 1, !dbg !719
    #dbg_value(i32 %inc4, !707, !DIExpression(), !680)
  br label %for.cond, !dbg !720, !llvm.loop !721

for.end:                                          ; preds = %for.cond
    #dbg_value(i32 0, !707, !DIExpression(), !680)
  br label %for.cond5, !dbg !723

for.cond5:                                        ; preds = %for.inc12, %for.end
  %i.1 = phi i32 [ 0, %for.end ], [ %inc13, %for.inc12 ], !dbg !725
  %nonce.1 = phi i8 [ %nonce.0, %for.end ], [ %inc11, %for.inc12 ], !dbg !680
    #dbg_value(i8 %nonce.1, !686, !DIExpression(), !680)
    #dbg_value(i32 %i.1, !707, !DIExpression(), !680)
  %cmp6 = icmp ult i32 %i.1, 4, !dbg !726
  br i1 %cmp6, label %for.body7, label %for.end14, !dbg !728

for.body7:                                        ; preds = %for.cond5
  %vec8 = getelementptr inbounds nuw %struct.polyvec, ptr %ep, i32 0, i32 0, !dbg !729
  %arraydecay9 = getelementptr inbounds [4 x %struct.poly], ptr %vec8, i32 0, i32 0, !dbg !730
  %add.ptr10 = getelementptr inbounds nuw %struct.poly, ptr %arraydecay9, i32 %i.1, !dbg !731
  %inc11 = add i8 %nonce.1, 1, !dbg !732
    #dbg_value(i8 %inc11, !686, !DIExpression(), !680)
  call void @pqcrystals_kyber1024_ref_poly_getnoise_eta2(ptr noundef %add.ptr10, ptr noundef %coins, i8 noundef zeroext %nonce.1) #2, !dbg !733
  br label %for.inc12, !dbg !733

for.inc12:                                        ; preds = %for.body7
  %inc13 = add i32 %i.1, 1, !dbg !734
    #dbg_value(i32 %inc13, !707, !DIExpression(), !680)
  br label %for.cond5, !dbg !735, !llvm.loop !736

for.end14:                                        ; preds = %for.cond5
  %inc15 = add i8 %nonce.1, 1, !dbg !738
    #dbg_value(i8 %inc15, !686, !DIExpression(), !680)
  call void @pqcrystals_kyber1024_ref_poly_getnoise_eta2(ptr noundef %epp, ptr noundef %coins, i8 noundef zeroext %nonce.1) #2, !dbg !739
  call void @pqcrystals_kyber1024_ref_polyvec_ntt(ptr noundef %sp) #2, !dbg !740
    #dbg_value(i32 0, !707, !DIExpression(), !680)
  br label %for.cond16, !dbg !741

for.cond16:                                       ; preds = %for.inc21, %for.end14
  %i.2 = phi i32 [ 0, %for.end14 ], [ %inc22, %for.inc21 ], !dbg !743
    #dbg_value(i32 %i.2, !707, !DIExpression(), !680)
  %cmp17 = icmp ult i32 %i.2, 4, !dbg !744
  br i1 %cmp17, label %for.body18, label %for.end23, !dbg !746

for.body18:                                       ; preds = %for.cond16
  %vec19 = getelementptr inbounds nuw %struct.polyvec, ptr %b, i32 0, i32 0, !dbg !747
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %vec19, i32 0, i32 %i.2, !dbg !748
  %arrayidx20 = getelementptr inbounds nuw [4 x %struct.polyvec], ptr %at, i32 0, i32 %i.2, !dbg !749
  call void @pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery(ptr noundef %arrayidx, ptr noundef %arrayidx20, ptr noundef %sp) #2, !dbg !750
  br label %for.inc21, !dbg !750

for.inc21:                                        ; preds = %for.body18
  %inc22 = add i32 %i.2, 1, !dbg !751
    #dbg_value(i32 %inc22, !707, !DIExpression(), !680)
  br label %for.cond16, !dbg !752, !llvm.loop !753

for.end23:                                        ; preds = %for.cond16
  call void @pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery(ptr noundef %v, ptr noundef %pkpv, ptr noundef %sp) #2, !dbg !755
  call void @pqcrystals_kyber1024_ref_polyvec_invntt_tomont(ptr noundef %b) #2, !dbg !756
  call void @pqcrystals_kyber1024_ref_poly_invntt_tomont(ptr noundef %v) #2, !dbg !757
  call void @pqcrystals_kyber1024_ref_polyvec_add(ptr noundef %b, ptr noundef %b, ptr noundef %ep) #2, !dbg !758
  call void @pqcrystals_kyber1024_ref_poly_add(ptr noundef %v, ptr noundef %v, ptr noundef %epp) #2, !dbg !759
  call void @pqcrystals_kyber1024_ref_poly_add(ptr noundef %v, ptr noundef %v, ptr noundef %k) #2, !dbg !760
  call void @pqcrystals_kyber1024_ref_polyvec_reduce(ptr noundef %b) #2, !dbg !761
  call void @pqcrystals_kyber1024_ref_poly_reduce(ptr noundef %v) #2, !dbg !762
  call void @pack_ciphertext(ptr noundef %c, ptr noundef %b, ptr noundef %v) #2, !dbg !763
  ret void, !dbg !764
}

; Function Attrs: noinline nounwind optnone
define internal void @unpack_pk(ptr noundef %pk, ptr noundef %seed, ptr noundef %packedpk) #0 !dbg !765 {
entry:
    #dbg_value(ptr %pk, !768, !DIExpression(), !769)
    #dbg_value(ptr %seed, !770, !DIExpression(), !769)
    #dbg_value(ptr %packedpk, !771, !DIExpression(), !769)
  call void @pqcrystals_kyber1024_ref_polyvec_frombytes(ptr noundef %pk, ptr noundef %packedpk) #2, !dbg !772
  %add.ptr = getelementptr inbounds i8, ptr %packedpk, i32 1536, !dbg !773
  %call = call ptr @memcpy(ptr noundef %seed, ptr noundef %add.ptr, i32 noundef 32) #2, !dbg !774
  ret void, !dbg !775
}

; Function Attrs: noinline nounwind optnone
define internal void @pack_ciphertext(ptr noundef %r, ptr noundef %b, ptr noundef %v) #0 !dbg !776 {
entry:
    #dbg_value(ptr %r, !780, !DIExpression(), !781)
    #dbg_value(ptr %b, !782, !DIExpression(), !781)
    #dbg_value(ptr %v, !783, !DIExpression(), !781)
  call void @pqcrystals_kyber1024_ref_polyvec_compress(ptr noundef %r, ptr noundef %b) #2, !dbg !784
  %add.ptr = getelementptr inbounds i8, ptr %r, i32 1408, !dbg !785
  call void @pqcrystals_kyber1024_ref_poly_compress(ptr noundef %add.ptr, ptr noundef %v) #2, !dbg !786
  ret void, !dbg !787
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_indcpa_dec(ptr noundef %m, ptr noundef %c, ptr noundef %sk) #0 !dbg !788 {
entry:
  %b = alloca %struct.polyvec, align 2
  %skpv = alloca %struct.polyvec, align 2
  %v = alloca %struct.poly, align 2
  %mp = alloca %struct.poly, align 2
    #dbg_value(ptr %m, !791, !DIExpression(), !792)
    #dbg_value(ptr %c, !793, !DIExpression(), !792)
    #dbg_value(ptr %sk, !794, !DIExpression(), !792)
    #dbg_declare(ptr %b, !795, !DIExpression(), !796)
    #dbg_declare(ptr %skpv, !797, !DIExpression(), !798)
    #dbg_declare(ptr %v, !799, !DIExpression(), !800)
    #dbg_declare(ptr %mp, !801, !DIExpression(), !802)
  call void @unpack_ciphertext(ptr noundef %b, ptr noundef %v, ptr noundef %c) #2, !dbg !803
  call void @unpack_sk(ptr noundef %skpv, ptr noundef %sk) #2, !dbg !804
  call void @pqcrystals_kyber1024_ref_polyvec_ntt(ptr noundef %b) #2, !dbg !805
  call void @pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery(ptr noundef %mp, ptr noundef %skpv, ptr noundef %b) #2, !dbg !806
  call void @pqcrystals_kyber1024_ref_poly_invntt_tomont(ptr noundef %mp) #2, !dbg !807
  call void @pqcrystals_kyber1024_ref_poly_sub(ptr noundef %mp, ptr noundef %v, ptr noundef %mp) #2, !dbg !808
  call void @pqcrystals_kyber1024_ref_poly_reduce(ptr noundef %mp) #2, !dbg !809
  call void @pqcrystals_kyber1024_ref_poly_tomsg(ptr noundef %m, ptr noundef %mp) #2, !dbg !810
  ret void, !dbg !811
}

; Function Attrs: noinline nounwind optnone
define internal void @unpack_ciphertext(ptr noundef %b, ptr noundef %v, ptr noundef %c) #0 !dbg !812 {
entry:
    #dbg_value(ptr %b, !815, !DIExpression(), !816)
    #dbg_value(ptr %v, !817, !DIExpression(), !816)
    #dbg_value(ptr %c, !818, !DIExpression(), !816)
  call void @pqcrystals_kyber1024_ref_polyvec_decompress(ptr noundef %b, ptr noundef %c) #2, !dbg !819
  %add.ptr = getelementptr inbounds i8, ptr %c, i32 1408, !dbg !820
  call void @pqcrystals_kyber1024_ref_poly_decompress(ptr noundef %v, ptr noundef %add.ptr) #2, !dbg !821
  ret void, !dbg !822
}

; Function Attrs: noinline nounwind optnone
define internal void @unpack_sk(ptr noundef %sk, ptr noundef %packedsk) #0 !dbg !823 {
entry:
    #dbg_value(ptr %sk, !826, !DIExpression(), !827)
    #dbg_value(ptr %packedsk, !828, !DIExpression(), !827)
  call void @pqcrystals_kyber1024_ref_polyvec_frombytes(ptr noundef %sk, ptr noundef %packedsk) #2, !dbg !829
  ret void, !dbg !830
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_polyvec_compress(ptr noundef %r, ptr noundef %a) #0 !dbg !831 {
entry:
  %t = alloca [8 x i16], align 2
    #dbg_value(ptr %r, !846, !DIExpression(), !847)
    #dbg_value(ptr %a, !848, !DIExpression(), !847)
    #dbg_declare(ptr %t, !849, !DIExpression(), !853)
    #dbg_value(i32 0, !854, !DIExpression(), !847)
  br label %for.cond, !dbg !855

for.cond:                                         ; preds = %for.inc107, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc108, %for.inc107 ], !dbg !857
  %r.addr.0 = phi ptr [ %r, %entry ], [ %r.addr.1, %for.inc107 ]
    #dbg_value(ptr %r.addr.0, !846, !DIExpression(), !847)
    #dbg_value(i32 %i.0, !854, !DIExpression(), !847)
  %cmp = icmp ult i32 %i.0, 4, !dbg !858
  br i1 %cmp, label %for.body, label %for.end109, !dbg !860

for.body:                                         ; preds = %for.cond
    #dbg_value(i32 0, !861, !DIExpression(), !847)
  br label %for.cond1, !dbg !862

for.cond1:                                        ; preds = %for.inc104, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc105, %for.inc104 ], !dbg !865
  %r.addr.1 = phi ptr [ %r.addr.0, %for.body ], [ %add.ptr, %for.inc104 ]
    #dbg_value(ptr %r.addr.1, !846, !DIExpression(), !847)
    #dbg_value(i32 %j.0, !861, !DIExpression(), !847)
  %cmp2 = icmp ult i32 %j.0, 32, !dbg !866
  br i1 %cmp2, label %for.body3, label %for.end106, !dbg !868

for.body3:                                        ; preds = %for.cond1
    #dbg_value(i32 0, !869, !DIExpression(), !847)
  br label %for.cond4, !dbg !870

for.cond4:                                        ; preds = %for.inc, %for.body3
  %k.0 = phi i32 [ 0, %for.body3 ], [ %inc, %for.inc ], !dbg !873
    #dbg_value(i32 %k.0, !869, !DIExpression(), !847)
  %cmp5 = icmp ult i32 %k.0, 8, !dbg !874
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !876

for.body6:                                        ; preds = %for.cond4
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 0, i32 0, !dbg !877
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %vec, i32 0, i32 %i.0, !dbg !879
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %arrayidx, i32 0, i32 0, !dbg !880
  %mul = mul i32 8, %j.0, !dbg !881
  %add = add i32 %mul, %k.0, !dbg !882
  %arrayidx7 = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %add, !dbg !879
  %0 = load i16, ptr %arrayidx7, align 2, !dbg !879
  %arrayidx8 = getelementptr inbounds nuw [8 x i16], ptr %t, i32 0, i32 %k.0, !dbg !883
  store i16 %0, ptr %arrayidx8, align 2, !dbg !884
  %arrayidx9 = getelementptr inbounds nuw [8 x i16], ptr %t, i32 0, i32 %k.0, !dbg !885
  %1 = load i16, ptr %arrayidx9, align 2, !dbg !885
  %conv = sext i16 %1 to i32, !dbg !886
  %shr = ashr i32 %conv, 15, !dbg !887
  %and = and i32 %shr, 3329, !dbg !888
  %arrayidx10 = getelementptr inbounds nuw [8 x i16], ptr %t, i32 0, i32 %k.0, !dbg !889
  %2 = load i16, ptr %arrayidx10, align 2, !dbg !890
  %conv11 = zext i16 %2 to i32, !dbg !890
  %add12 = add nsw i32 %conv11, %and, !dbg !890
  %conv13 = trunc i32 %add12 to i16, !dbg !890
  store i16 %conv13, ptr %arrayidx10, align 2, !dbg !890
  %arrayidx14 = getelementptr inbounds nuw [8 x i16], ptr %t, i32 0, i32 %k.0, !dbg !891
  %3 = load i16, ptr %arrayidx14, align 2, !dbg !891
  %conv15 = zext i16 %3 to i64, !dbg !891
    #dbg_value(i64 %conv15, !892, !DIExpression(), !847)
  %shl = shl i64 %conv15, 11, !dbg !893
    #dbg_value(i64 %shl, !892, !DIExpression(), !847)
  %add16 = add i64 %shl, 1664, !dbg !894
    #dbg_value(i64 %add16, !892, !DIExpression(), !847)
  %mul17 = mul i64 %add16, 645084, !dbg !895
    #dbg_value(i64 %mul17, !892, !DIExpression(), !847)
  %shr18 = lshr i64 %mul17, 31, !dbg !896
    #dbg_value(i64 %shr18, !892, !DIExpression(), !847)
  %and19 = and i64 %shr18, 2047, !dbg !897
  %conv20 = trunc i64 %and19 to i16, !dbg !898
  %arrayidx21 = getelementptr inbounds nuw [8 x i16], ptr %t, i32 0, i32 %k.0, !dbg !899
  store i16 %conv20, ptr %arrayidx21, align 2, !dbg !900
  br label %for.inc, !dbg !901

for.inc:                                          ; preds = %for.body6
  %inc = add i32 %k.0, 1, !dbg !902
    #dbg_value(i32 %inc, !869, !DIExpression(), !847)
  br label %for.cond4, !dbg !903, !llvm.loop !904

for.end:                                          ; preds = %for.cond4
  %arrayidx22 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 0, !dbg !906
  %4 = load i16, ptr %arrayidx22, align 2, !dbg !906
  %conv23 = zext i16 %4 to i32, !dbg !906
  %shr24 = ashr i32 %conv23, 0, !dbg !907
  %conv25 = trunc i32 %shr24 to i8, !dbg !908
  %arrayidx26 = getelementptr inbounds i8, ptr %r.addr.1, i32 0, !dbg !909
  store i8 %conv25, ptr %arrayidx26, align 1, !dbg !910
  %arrayidx27 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 0, !dbg !911
  %5 = load i16, ptr %arrayidx27, align 2, !dbg !911
  %conv28 = zext i16 %5 to i32, !dbg !911
  %shr29 = ashr i32 %conv28, 8, !dbg !912
  %arrayidx30 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 1, !dbg !913
  %6 = load i16, ptr %arrayidx30, align 2, !dbg !913
  %conv31 = zext i16 %6 to i32, !dbg !913
  %shl32 = shl i32 %conv31, 3, !dbg !914
  %or = or i32 %shr29, %shl32, !dbg !915
  %conv33 = trunc i32 %or to i8, !dbg !916
  %arrayidx34 = getelementptr inbounds i8, ptr %r.addr.1, i32 1, !dbg !917
  store i8 %conv33, ptr %arrayidx34, align 1, !dbg !918
  %arrayidx35 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 1, !dbg !919
  %7 = load i16, ptr %arrayidx35, align 2, !dbg !919
  %conv36 = zext i16 %7 to i32, !dbg !919
  %shr37 = ashr i32 %conv36, 5, !dbg !920
  %arrayidx38 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 2, !dbg !921
  %8 = load i16, ptr %arrayidx38, align 2, !dbg !921
  %conv39 = zext i16 %8 to i32, !dbg !921
  %shl40 = shl i32 %conv39, 6, !dbg !922
  %or41 = or i32 %shr37, %shl40, !dbg !923
  %conv42 = trunc i32 %or41 to i8, !dbg !924
  %arrayidx43 = getelementptr inbounds i8, ptr %r.addr.1, i32 2, !dbg !925
  store i8 %conv42, ptr %arrayidx43, align 1, !dbg !926
  %arrayidx44 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 2, !dbg !927
  %9 = load i16, ptr %arrayidx44, align 2, !dbg !927
  %conv45 = zext i16 %9 to i32, !dbg !927
  %shr46 = ashr i32 %conv45, 2, !dbg !928
  %conv47 = trunc i32 %shr46 to i8, !dbg !929
  %arrayidx48 = getelementptr inbounds i8, ptr %r.addr.1, i32 3, !dbg !930
  store i8 %conv47, ptr %arrayidx48, align 1, !dbg !931
  %arrayidx49 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 2, !dbg !932
  %10 = load i16, ptr %arrayidx49, align 2, !dbg !932
  %conv50 = zext i16 %10 to i32, !dbg !932
  %shr51 = ashr i32 %conv50, 10, !dbg !933
  %arrayidx52 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 3, !dbg !934
  %11 = load i16, ptr %arrayidx52, align 2, !dbg !934
  %conv53 = zext i16 %11 to i32, !dbg !934
  %shl54 = shl i32 %conv53, 1, !dbg !935
  %or55 = or i32 %shr51, %shl54, !dbg !936
  %conv56 = trunc i32 %or55 to i8, !dbg !937
  %arrayidx57 = getelementptr inbounds i8, ptr %r.addr.1, i32 4, !dbg !938
  store i8 %conv56, ptr %arrayidx57, align 1, !dbg !939
  %arrayidx58 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 3, !dbg !940
  %12 = load i16, ptr %arrayidx58, align 2, !dbg !940
  %conv59 = zext i16 %12 to i32, !dbg !940
  %shr60 = ashr i32 %conv59, 7, !dbg !941
  %arrayidx61 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 4, !dbg !942
  %13 = load i16, ptr %arrayidx61, align 2, !dbg !942
  %conv62 = zext i16 %13 to i32, !dbg !942
  %shl63 = shl i32 %conv62, 4, !dbg !943
  %or64 = or i32 %shr60, %shl63, !dbg !944
  %conv65 = trunc i32 %or64 to i8, !dbg !945
  %arrayidx66 = getelementptr inbounds i8, ptr %r.addr.1, i32 5, !dbg !946
  store i8 %conv65, ptr %arrayidx66, align 1, !dbg !947
  %arrayidx67 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 4, !dbg !948
  %14 = load i16, ptr %arrayidx67, align 2, !dbg !948
  %conv68 = zext i16 %14 to i32, !dbg !948
  %shr69 = ashr i32 %conv68, 4, !dbg !949
  %arrayidx70 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 5, !dbg !950
  %15 = load i16, ptr %arrayidx70, align 2, !dbg !950
  %conv71 = zext i16 %15 to i32, !dbg !950
  %shl72 = shl i32 %conv71, 7, !dbg !951
  %or73 = or i32 %shr69, %shl72, !dbg !952
  %conv74 = trunc i32 %or73 to i8, !dbg !953
  %arrayidx75 = getelementptr inbounds i8, ptr %r.addr.1, i32 6, !dbg !954
  store i8 %conv74, ptr %arrayidx75, align 1, !dbg !955
  %arrayidx76 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 5, !dbg !956
  %16 = load i16, ptr %arrayidx76, align 2, !dbg !956
  %conv77 = zext i16 %16 to i32, !dbg !956
  %shr78 = ashr i32 %conv77, 1, !dbg !957
  %conv79 = trunc i32 %shr78 to i8, !dbg !958
  %arrayidx80 = getelementptr inbounds i8, ptr %r.addr.1, i32 7, !dbg !959
  store i8 %conv79, ptr %arrayidx80, align 1, !dbg !960
  %arrayidx81 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 5, !dbg !961
  %17 = load i16, ptr %arrayidx81, align 2, !dbg !961
  %conv82 = zext i16 %17 to i32, !dbg !961
  %shr83 = ashr i32 %conv82, 9, !dbg !962
  %arrayidx84 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 6, !dbg !963
  %18 = load i16, ptr %arrayidx84, align 2, !dbg !963
  %conv85 = zext i16 %18 to i32, !dbg !963
  %shl86 = shl i32 %conv85, 2, !dbg !964
  %or87 = or i32 %shr83, %shl86, !dbg !965
  %conv88 = trunc i32 %or87 to i8, !dbg !966
  %arrayidx89 = getelementptr inbounds i8, ptr %r.addr.1, i32 8, !dbg !967
  store i8 %conv88, ptr %arrayidx89, align 1, !dbg !968
  %arrayidx90 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 6, !dbg !969
  %19 = load i16, ptr %arrayidx90, align 2, !dbg !969
  %conv91 = zext i16 %19 to i32, !dbg !969
  %shr92 = ashr i32 %conv91, 6, !dbg !970
  %arrayidx93 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 7, !dbg !971
  %20 = load i16, ptr %arrayidx93, align 2, !dbg !971
  %conv94 = zext i16 %20 to i32, !dbg !971
  %shl95 = shl i32 %conv94, 5, !dbg !972
  %or96 = or i32 %shr92, %shl95, !dbg !973
  %conv97 = trunc i32 %or96 to i8, !dbg !974
  %arrayidx98 = getelementptr inbounds i8, ptr %r.addr.1, i32 9, !dbg !975
  store i8 %conv97, ptr %arrayidx98, align 1, !dbg !976
  %arrayidx99 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 7, !dbg !977
  %21 = load i16, ptr %arrayidx99, align 2, !dbg !977
  %conv100 = zext i16 %21 to i32, !dbg !977
  %shr101 = ashr i32 %conv100, 3, !dbg !978
  %conv102 = trunc i32 %shr101 to i8, !dbg !979
  %arrayidx103 = getelementptr inbounds i8, ptr %r.addr.1, i32 10, !dbg !980
  store i8 %conv102, ptr %arrayidx103, align 1, !dbg !981
  %add.ptr = getelementptr inbounds i8, ptr %r.addr.1, i32 11, !dbg !982
    #dbg_value(ptr %add.ptr, !846, !DIExpression(), !847)
  br label %for.inc104, !dbg !983

for.inc104:                                       ; preds = %for.end
  %inc105 = add i32 %j.0, 1, !dbg !984
    #dbg_value(i32 %inc105, !861, !DIExpression(), !847)
  br label %for.cond1, !dbg !985, !llvm.loop !986

for.end106:                                       ; preds = %for.cond1
  br label %for.inc107, !dbg !988

for.inc107:                                       ; preds = %for.end106
  %inc108 = add i32 %i.0, 1, !dbg !989
    #dbg_value(i32 %inc108, !854, !DIExpression(), !847)
  br label %for.cond, !dbg !990, !llvm.loop !991

for.end109:                                       ; preds = %for.cond
  ret void, !dbg !993
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_polyvec_decompress(ptr noundef %r, ptr noundef %a) #0 !dbg !994 {
entry:
  %t = alloca [8 x i16], align 2
    #dbg_value(ptr %r, !998, !DIExpression(), !999)
    #dbg_value(ptr %a, !1000, !DIExpression(), !999)
    #dbg_declare(ptr %t, !1001, !DIExpression(), !1002)
    #dbg_value(i32 0, !1003, !DIExpression(), !999)
  br label %for.cond, !dbg !1004

for.cond:                                         ; preds = %for.inc104, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc105, %for.inc104 ], !dbg !1006
  %a.addr.0 = phi ptr [ %a, %entry ], [ %a.addr.1, %for.inc104 ]
    #dbg_value(ptr %a.addr.0, !1000, !DIExpression(), !999)
    #dbg_value(i32 %i.0, !1003, !DIExpression(), !999)
  %cmp = icmp ult i32 %i.0, 4, !dbg !1007
  br i1 %cmp, label %for.body, label %for.end106, !dbg !1009

for.body:                                         ; preds = %for.cond
    #dbg_value(i32 0, !1010, !DIExpression(), !999)
  br label %for.cond1, !dbg !1011

for.cond1:                                        ; preds = %for.inc101, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc102, %for.inc101 ], !dbg !1014
  %a.addr.1 = phi ptr [ %a.addr.0, %for.body ], [ %add.ptr, %for.inc101 ]
    #dbg_value(ptr %a.addr.1, !1000, !DIExpression(), !999)
    #dbg_value(i32 %j.0, !1010, !DIExpression(), !999)
  %cmp2 = icmp ult i32 %j.0, 32, !dbg !1015
  br i1 %cmp2, label %for.body3, label %for.end103, !dbg !1017

for.body3:                                        ; preds = %for.cond1
  %arrayidx = getelementptr inbounds i8, ptr %a.addr.1, i32 0, !dbg !1018
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1018
  %conv = zext i8 %0 to i32, !dbg !1018
  %shr = ashr i32 %conv, 0, !dbg !1020
  %arrayidx4 = getelementptr inbounds i8, ptr %a.addr.1, i32 1, !dbg !1021
  %1 = load i8, ptr %arrayidx4, align 1, !dbg !1021
  %conv5 = zext i8 %1 to i16, !dbg !1022
  %conv6 = zext i16 %conv5 to i32, !dbg !1022
  %shl = shl i32 %conv6, 8, !dbg !1023
  %or = or i32 %shr, %shl, !dbg !1024
  %conv7 = trunc i32 %or to i16, !dbg !1025
  %arrayidx8 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 0, !dbg !1026
  store i16 %conv7, ptr %arrayidx8, align 2, !dbg !1027
  %arrayidx9 = getelementptr inbounds i8, ptr %a.addr.1, i32 1, !dbg !1028
  %2 = load i8, ptr %arrayidx9, align 1, !dbg !1028
  %conv10 = zext i8 %2 to i32, !dbg !1028
  %shr11 = ashr i32 %conv10, 3, !dbg !1029
  %arrayidx12 = getelementptr inbounds i8, ptr %a.addr.1, i32 2, !dbg !1030
  %3 = load i8, ptr %arrayidx12, align 1, !dbg !1030
  %conv13 = zext i8 %3 to i16, !dbg !1031
  %conv14 = zext i16 %conv13 to i32, !dbg !1031
  %shl15 = shl i32 %conv14, 5, !dbg !1032
  %or16 = or i32 %shr11, %shl15, !dbg !1033
  %conv17 = trunc i32 %or16 to i16, !dbg !1034
  %arrayidx18 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 1, !dbg !1035
  store i16 %conv17, ptr %arrayidx18, align 2, !dbg !1036
  %arrayidx19 = getelementptr inbounds i8, ptr %a.addr.1, i32 2, !dbg !1037
  %4 = load i8, ptr %arrayidx19, align 1, !dbg !1037
  %conv20 = zext i8 %4 to i32, !dbg !1037
  %shr21 = ashr i32 %conv20, 6, !dbg !1038
  %arrayidx22 = getelementptr inbounds i8, ptr %a.addr.1, i32 3, !dbg !1039
  %5 = load i8, ptr %arrayidx22, align 1, !dbg !1039
  %conv23 = zext i8 %5 to i16, !dbg !1040
  %conv24 = zext i16 %conv23 to i32, !dbg !1040
  %shl25 = shl i32 %conv24, 2, !dbg !1041
  %or26 = or i32 %shr21, %shl25, !dbg !1042
  %arrayidx27 = getelementptr inbounds i8, ptr %a.addr.1, i32 4, !dbg !1043
  %6 = load i8, ptr %arrayidx27, align 1, !dbg !1043
  %conv28 = zext i8 %6 to i16, !dbg !1044
  %conv29 = zext i16 %conv28 to i32, !dbg !1044
  %shl30 = shl i32 %conv29, 10, !dbg !1045
  %or31 = or i32 %or26, %shl30, !dbg !1046
  %conv32 = trunc i32 %or31 to i16, !dbg !1047
  %arrayidx33 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 2, !dbg !1048
  store i16 %conv32, ptr %arrayidx33, align 2, !dbg !1049
  %arrayidx34 = getelementptr inbounds i8, ptr %a.addr.1, i32 4, !dbg !1050
  %7 = load i8, ptr %arrayidx34, align 1, !dbg !1050
  %conv35 = zext i8 %7 to i32, !dbg !1050
  %shr36 = ashr i32 %conv35, 1, !dbg !1051
  %arrayidx37 = getelementptr inbounds i8, ptr %a.addr.1, i32 5, !dbg !1052
  %8 = load i8, ptr %arrayidx37, align 1, !dbg !1052
  %conv38 = zext i8 %8 to i16, !dbg !1053
  %conv39 = zext i16 %conv38 to i32, !dbg !1053
  %shl40 = shl i32 %conv39, 7, !dbg !1054
  %or41 = or i32 %shr36, %shl40, !dbg !1055
  %conv42 = trunc i32 %or41 to i16, !dbg !1056
  %arrayidx43 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 3, !dbg !1057
  store i16 %conv42, ptr %arrayidx43, align 2, !dbg !1058
  %arrayidx44 = getelementptr inbounds i8, ptr %a.addr.1, i32 5, !dbg !1059
  %9 = load i8, ptr %arrayidx44, align 1, !dbg !1059
  %conv45 = zext i8 %9 to i32, !dbg !1059
  %shr46 = ashr i32 %conv45, 4, !dbg !1060
  %arrayidx47 = getelementptr inbounds i8, ptr %a.addr.1, i32 6, !dbg !1061
  %10 = load i8, ptr %arrayidx47, align 1, !dbg !1061
  %conv48 = zext i8 %10 to i16, !dbg !1062
  %conv49 = zext i16 %conv48 to i32, !dbg !1062
  %shl50 = shl i32 %conv49, 4, !dbg !1063
  %or51 = or i32 %shr46, %shl50, !dbg !1064
  %conv52 = trunc i32 %or51 to i16, !dbg !1065
  %arrayidx53 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 4, !dbg !1066
  store i16 %conv52, ptr %arrayidx53, align 2, !dbg !1067
  %arrayidx54 = getelementptr inbounds i8, ptr %a.addr.1, i32 6, !dbg !1068
  %11 = load i8, ptr %arrayidx54, align 1, !dbg !1068
  %conv55 = zext i8 %11 to i32, !dbg !1068
  %shr56 = ashr i32 %conv55, 7, !dbg !1069
  %arrayidx57 = getelementptr inbounds i8, ptr %a.addr.1, i32 7, !dbg !1070
  %12 = load i8, ptr %arrayidx57, align 1, !dbg !1070
  %conv58 = zext i8 %12 to i16, !dbg !1071
  %conv59 = zext i16 %conv58 to i32, !dbg !1071
  %shl60 = shl i32 %conv59, 1, !dbg !1072
  %or61 = or i32 %shr56, %shl60, !dbg !1073
  %arrayidx62 = getelementptr inbounds i8, ptr %a.addr.1, i32 8, !dbg !1074
  %13 = load i8, ptr %arrayidx62, align 1, !dbg !1074
  %conv63 = zext i8 %13 to i16, !dbg !1075
  %conv64 = zext i16 %conv63 to i32, !dbg !1075
  %shl65 = shl i32 %conv64, 9, !dbg !1076
  %or66 = or i32 %or61, %shl65, !dbg !1077
  %conv67 = trunc i32 %or66 to i16, !dbg !1078
  %arrayidx68 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 5, !dbg !1079
  store i16 %conv67, ptr %arrayidx68, align 2, !dbg !1080
  %arrayidx69 = getelementptr inbounds i8, ptr %a.addr.1, i32 8, !dbg !1081
  %14 = load i8, ptr %arrayidx69, align 1, !dbg !1081
  %conv70 = zext i8 %14 to i32, !dbg !1081
  %shr71 = ashr i32 %conv70, 2, !dbg !1082
  %arrayidx72 = getelementptr inbounds i8, ptr %a.addr.1, i32 9, !dbg !1083
  %15 = load i8, ptr %arrayidx72, align 1, !dbg !1083
  %conv73 = zext i8 %15 to i16, !dbg !1084
  %conv74 = zext i16 %conv73 to i32, !dbg !1084
  %shl75 = shl i32 %conv74, 6, !dbg !1085
  %or76 = or i32 %shr71, %shl75, !dbg !1086
  %conv77 = trunc i32 %or76 to i16, !dbg !1087
  %arrayidx78 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 6, !dbg !1088
  store i16 %conv77, ptr %arrayidx78, align 2, !dbg !1089
  %arrayidx79 = getelementptr inbounds i8, ptr %a.addr.1, i32 9, !dbg !1090
  %16 = load i8, ptr %arrayidx79, align 1, !dbg !1090
  %conv80 = zext i8 %16 to i32, !dbg !1090
  %shr81 = ashr i32 %conv80, 5, !dbg !1091
  %arrayidx82 = getelementptr inbounds i8, ptr %a.addr.1, i32 10, !dbg !1092
  %17 = load i8, ptr %arrayidx82, align 1, !dbg !1092
  %conv83 = zext i8 %17 to i16, !dbg !1093
  %conv84 = zext i16 %conv83 to i32, !dbg !1093
  %shl85 = shl i32 %conv84, 3, !dbg !1094
  %or86 = or i32 %shr81, %shl85, !dbg !1095
  %conv87 = trunc i32 %or86 to i16, !dbg !1096
  %arrayidx88 = getelementptr inbounds [8 x i16], ptr %t, i32 0, i32 7, !dbg !1097
  store i16 %conv87, ptr %arrayidx88, align 2, !dbg !1098
  %add.ptr = getelementptr inbounds i8, ptr %a.addr.1, i32 11, !dbg !1099
    #dbg_value(ptr %add.ptr, !1000, !DIExpression(), !999)
    #dbg_value(i32 0, !1100, !DIExpression(), !999)
  br label %for.cond89, !dbg !1101

for.cond89:                                       ; preds = %for.inc, %for.body3
  %k.0 = phi i32 [ 0, %for.body3 ], [ %inc, %for.inc ], !dbg !1103
    #dbg_value(i32 %k.0, !1100, !DIExpression(), !999)
  %cmp90 = icmp ult i32 %k.0, 8, !dbg !1104
  br i1 %cmp90, label %for.body92, label %for.end, !dbg !1106

for.body92:                                       ; preds = %for.cond89
  %arrayidx93 = getelementptr inbounds nuw [8 x i16], ptr %t, i32 0, i32 %k.0, !dbg !1107
  %18 = load i16, ptr %arrayidx93, align 2, !dbg !1107
  %conv94 = zext i16 %18 to i32, !dbg !1107
  %and = and i32 %conv94, 2047, !dbg !1108
  %mul = mul i32 %and, 3329, !dbg !1109
  %add = add i32 %mul, 1024, !dbg !1110
  %shr95 = lshr i32 %add, 11, !dbg !1111
  %conv96 = trunc i32 %shr95 to i16, !dbg !1112
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %r, i32 0, i32 0, !dbg !1113
  %arrayidx97 = getelementptr inbounds nuw [4 x %struct.poly], ptr %vec, i32 0, i32 %i.0, !dbg !1114
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %arrayidx97, i32 0, i32 0, !dbg !1115
  %mul98 = mul i32 8, %j.0, !dbg !1116
  %add99 = add i32 %mul98, %k.0, !dbg !1117
  %arrayidx100 = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %add99, !dbg !1114
  store i16 %conv96, ptr %arrayidx100, align 2, !dbg !1118
  br label %for.inc, !dbg !1114

for.inc:                                          ; preds = %for.body92
  %inc = add i32 %k.0, 1, !dbg !1119
    #dbg_value(i32 %inc, !1100, !DIExpression(), !999)
  br label %for.cond89, !dbg !1120, !llvm.loop !1121

for.end:                                          ; preds = %for.cond89
  br label %for.inc101, !dbg !1123

for.inc101:                                       ; preds = %for.end
  %inc102 = add i32 %j.0, 1, !dbg !1124
    #dbg_value(i32 %inc102, !1010, !DIExpression(), !999)
  br label %for.cond1, !dbg !1125, !llvm.loop !1126

for.end103:                                       ; preds = %for.cond1
  br label %for.inc104, !dbg !1128

for.inc104:                                       ; preds = %for.end103
  %inc105 = add i32 %i.0, 1, !dbg !1129
    #dbg_value(i32 %inc105, !1003, !DIExpression(), !999)
  br label %for.cond, !dbg !1130, !llvm.loop !1131

for.end106:                                       ; preds = %for.cond
  ret void, !dbg !1133
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %a) #0 !dbg !1134 {
entry:
    #dbg_value(ptr %r, !1135, !DIExpression(), !1136)
    #dbg_value(ptr %a, !1137, !DIExpression(), !1136)
    #dbg_value(i32 0, !1138, !DIExpression(), !1136)
  br label %for.cond, !dbg !1139

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1141
    #dbg_value(i32 %i.0, !1138, !DIExpression(), !1136)
  %cmp = icmp ult i32 %i.0, 4, !dbg !1142
  br i1 %cmp, label %for.body, label %for.end, !dbg !1144

for.body:                                         ; preds = %for.cond
  %mul = mul i32 %i.0, 384, !dbg !1145
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 %mul, !dbg !1146
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 0, i32 0, !dbg !1147
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %vec, i32 0, i32 %i.0, !dbg !1148
  call void @pqcrystals_kyber1024_ref_poly_tobytes(ptr noundef %add.ptr, ptr noundef %arrayidx) #2, !dbg !1149
  br label %for.inc, !dbg !1149

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1150
    #dbg_value(i32 %inc, !1138, !DIExpression(), !1136)
  br label %for.cond, !dbg !1151, !llvm.loop !1152

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1154
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_polyvec_frombytes(ptr noundef %r, ptr noundef %a) #0 !dbg !1155 {
entry:
    #dbg_value(ptr %r, !1156, !DIExpression(), !1157)
    #dbg_value(ptr %a, !1158, !DIExpression(), !1157)
    #dbg_value(i32 0, !1159, !DIExpression(), !1157)
  br label %for.cond, !dbg !1160

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1162
    #dbg_value(i32 %i.0, !1159, !DIExpression(), !1157)
  %cmp = icmp ult i32 %i.0, 4, !dbg !1163
  br i1 %cmp, label %for.body, label %for.end, !dbg !1165

for.body:                                         ; preds = %for.cond
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %r, i32 0, i32 0, !dbg !1166
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %vec, i32 0, i32 %i.0, !dbg !1167
  %mul = mul i32 %i.0, 384, !dbg !1168
  %add.ptr = getelementptr inbounds nuw i8, ptr %a, i32 %mul, !dbg !1169
  call void @pqcrystals_kyber1024_ref_poly_frombytes(ptr noundef %arrayidx, ptr noundef %add.ptr) #2, !dbg !1170
  br label %for.inc, !dbg !1170

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1171
    #dbg_value(i32 %inc, !1159, !DIExpression(), !1157)
  br label %for.cond, !dbg !1172, !llvm.loop !1173

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1175
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_polyvec_ntt(ptr noundef %r) #0 !dbg !1176 {
entry:
    #dbg_value(ptr %r, !1179, !DIExpression(), !1180)
    #dbg_value(i32 0, !1181, !DIExpression(), !1180)
  br label %for.cond, !dbg !1182

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1184
    #dbg_value(i32 %i.0, !1181, !DIExpression(), !1180)
  %cmp = icmp ult i32 %i.0, 4, !dbg !1185
  br i1 %cmp, label %for.body, label %for.end, !dbg !1187

for.body:                                         ; preds = %for.cond
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %r, i32 0, i32 0, !dbg !1188
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %vec, i32 0, i32 %i.0, !dbg !1189
  call void @pqcrystals_kyber1024_ref_poly_ntt(ptr noundef %arrayidx) #2, !dbg !1190
  br label %for.inc, !dbg !1190

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1191
    #dbg_value(i32 %inc, !1181, !DIExpression(), !1180)
  br label %for.cond, !dbg !1192, !llvm.loop !1193

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1195
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_polyvec_invntt_tomont(ptr noundef %r) #0 !dbg !1196 {
entry:
    #dbg_value(ptr %r, !1197, !DIExpression(), !1198)
    #dbg_value(i32 0, !1199, !DIExpression(), !1198)
  br label %for.cond, !dbg !1200

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1202
    #dbg_value(i32 %i.0, !1199, !DIExpression(), !1198)
  %cmp = icmp ult i32 %i.0, 4, !dbg !1203
  br i1 %cmp, label %for.body, label %for.end, !dbg !1205

for.body:                                         ; preds = %for.cond
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %r, i32 0, i32 0, !dbg !1206
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %vec, i32 0, i32 %i.0, !dbg !1207
  call void @pqcrystals_kyber1024_ref_poly_invntt_tomont(ptr noundef %arrayidx) #2, !dbg !1208
  br label %for.inc, !dbg !1208

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1209
    #dbg_value(i32 %inc, !1199, !DIExpression(), !1198)
  br label %for.cond, !dbg !1210, !llvm.loop !1211

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1213
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) #0 !dbg !1214 {
entry:
  %t = alloca %struct.poly, align 2
    #dbg_value(ptr %r, !1218, !DIExpression(), !1219)
    #dbg_value(ptr %a, !1220, !DIExpression(), !1219)
    #dbg_value(ptr %b, !1221, !DIExpression(), !1219)
    #dbg_declare(ptr %t, !1222, !DIExpression(), !1223)
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 0, i32 0, !dbg !1224
  %arrayidx = getelementptr inbounds [4 x %struct.poly], ptr %vec, i32 0, i32 0, !dbg !1225
  %vec1 = getelementptr inbounds nuw %struct.polyvec, ptr %b, i32 0, i32 0, !dbg !1226
  %arrayidx2 = getelementptr inbounds [4 x %struct.poly], ptr %vec1, i32 0, i32 0, !dbg !1227
  call void @pqcrystals_kyber1024_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %arrayidx, ptr noundef %arrayidx2) #2, !dbg !1228
    #dbg_value(i32 1, !1229, !DIExpression(), !1219)
  br label %for.cond, !dbg !1230

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 1, %entry ], [ %inc, %for.inc ], !dbg !1232
    #dbg_value(i32 %i.0, !1229, !DIExpression(), !1219)
  %cmp = icmp ult i32 %i.0, 4, !dbg !1233
  br i1 %cmp, label %for.body, label %for.end, !dbg !1235

for.body:                                         ; preds = %for.cond
  %vec3 = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 0, i32 0, !dbg !1236
  %arrayidx4 = getelementptr inbounds nuw [4 x %struct.poly], ptr %vec3, i32 0, i32 %i.0, !dbg !1238
  %vec5 = getelementptr inbounds nuw %struct.polyvec, ptr %b, i32 0, i32 0, !dbg !1239
  %arrayidx6 = getelementptr inbounds nuw [4 x %struct.poly], ptr %vec5, i32 0, i32 %i.0, !dbg !1240
  call void @pqcrystals_kyber1024_ref_poly_basemul_montgomery(ptr noundef %t, ptr noundef %arrayidx4, ptr noundef %arrayidx6) #2, !dbg !1241
  call void @pqcrystals_kyber1024_ref_poly_add(ptr noundef %r, ptr noundef %r, ptr noundef %t) #2, !dbg !1242
  br label %for.inc, !dbg !1243

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1244
    #dbg_value(i32 %inc, !1229, !DIExpression(), !1219)
  br label %for.cond, !dbg !1245, !llvm.loop !1246

for.end:                                          ; preds = %for.cond
  call void @pqcrystals_kyber1024_ref_poly_reduce(ptr noundef %r) #2, !dbg !1248
  ret void, !dbg !1249
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_polyvec_reduce(ptr noundef %r) #0 !dbg !1250 {
entry:
    #dbg_value(ptr %r, !1251, !DIExpression(), !1252)
    #dbg_value(i32 0, !1253, !DIExpression(), !1252)
  br label %for.cond, !dbg !1254

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1256
    #dbg_value(i32 %i.0, !1253, !DIExpression(), !1252)
  %cmp = icmp ult i32 %i.0, 4, !dbg !1257
  br i1 %cmp, label %for.body, label %for.end, !dbg !1259

for.body:                                         ; preds = %for.cond
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %r, i32 0, i32 0, !dbg !1260
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %vec, i32 0, i32 %i.0, !dbg !1261
  call void @pqcrystals_kyber1024_ref_poly_reduce(ptr noundef %arrayidx) #2, !dbg !1262
  br label %for.inc, !dbg !1262

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1263
    #dbg_value(i32 %inc, !1253, !DIExpression(), !1252)
  br label %for.cond, !dbg !1264, !llvm.loop !1265

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1267
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_polyvec_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) #0 !dbg !1268 {
entry:
    #dbg_value(ptr %r, !1271, !DIExpression(), !1272)
    #dbg_value(ptr %a, !1273, !DIExpression(), !1272)
    #dbg_value(ptr %b, !1274, !DIExpression(), !1272)
    #dbg_value(i32 0, !1275, !DIExpression(), !1272)
  br label %for.cond, !dbg !1276

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1278
    #dbg_value(i32 %i.0, !1275, !DIExpression(), !1272)
  %cmp = icmp ult i32 %i.0, 4, !dbg !1279
  br i1 %cmp, label %for.body, label %for.end, !dbg !1281

for.body:                                         ; preds = %for.cond
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %r, i32 0, i32 0, !dbg !1282
  %arrayidx = getelementptr inbounds nuw [4 x %struct.poly], ptr %vec, i32 0, i32 %i.0, !dbg !1283
  %vec1 = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 0, i32 0, !dbg !1284
  %arrayidx2 = getelementptr inbounds nuw [4 x %struct.poly], ptr %vec1, i32 0, i32 %i.0, !dbg !1285
  %vec3 = getelementptr inbounds nuw %struct.polyvec, ptr %b, i32 0, i32 0, !dbg !1286
  %arrayidx4 = getelementptr inbounds nuw [4 x %struct.poly], ptr %vec3, i32 0, i32 %i.0, !dbg !1287
  call void @pqcrystals_kyber1024_ref_poly_add(ptr noundef %arrayidx, ptr noundef %arrayidx2, ptr noundef %arrayidx4) #2, !dbg !1288
  br label %for.inc, !dbg !1288

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1289
    #dbg_value(i32 %inc, !1275, !DIExpression(), !1272)
  br label %for.cond, !dbg !1290, !llvm.loop !1291

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1293
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_poly_compress(ptr noundef %r, ptr noundef %a) #0 !dbg !1294 {
entry:
  %t = alloca [8 x i8], align 1
    #dbg_value(ptr %r, !1304, !DIExpression(), !1305)
    #dbg_value(ptr %a, !1306, !DIExpression(), !1305)
    #dbg_declare(ptr %t, !1307, !DIExpression(), !1309)
    #dbg_value(i32 0, !1310, !DIExpression(), !1305)
  br label %for.cond, !dbg !1311

for.cond:                                         ; preds = %for.inc66, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc67, %for.inc66 ], !dbg !1313
  %r.addr.0 = phi ptr [ %r, %entry ], [ %add.ptr, %for.inc66 ]
    #dbg_value(ptr %r.addr.0, !1304, !DIExpression(), !1305)
    #dbg_value(i32 %i.0, !1310, !DIExpression(), !1305)
  %cmp = icmp ult i32 %i.0, 32, !dbg !1314
  br i1 %cmp, label %for.body, label %for.end68, !dbg !1316

for.body:                                         ; preds = %for.cond
    #dbg_value(i32 0, !1317, !DIExpression(), !1305)
  br label %for.cond1, !dbg !1318

for.cond1:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ], !dbg !1321
    #dbg_value(i32 %j.0, !1317, !DIExpression(), !1305)
  %cmp2 = icmp ult i32 %j.0, 8, !dbg !1322
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !1324

for.body3:                                        ; preds = %for.cond1
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %a, i32 0, i32 0, !dbg !1325
  %mul = mul i32 8, %i.0, !dbg !1327
  %add = add i32 %mul, %j.0, !dbg !1328
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %add, !dbg !1329
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1329
    #dbg_value(i16 %0, !1330, !DIExpression(), !1305)
  %conv = sext i16 %0 to i32, !dbg !1331
  %shr = ashr i32 %conv, 15, !dbg !1332
  %and = and i32 %shr, 3329, !dbg !1333
  %conv4 = sext i16 %0 to i32, !dbg !1334
  %add5 = add nsw i32 %conv4, %and, !dbg !1334
  %conv6 = trunc i32 %add5 to i16, !dbg !1334
    #dbg_value(i16 %conv6, !1330, !DIExpression(), !1305)
  %conv7 = sext i16 %conv6 to i32, !dbg !1335
  %shl = shl i32 %conv7, 5, !dbg !1336
    #dbg_value(i32 %shl, !1337, !DIExpression(), !1305)
  %add8 = add i32 %shl, 1664, !dbg !1338
    #dbg_value(i32 %add8, !1337, !DIExpression(), !1305)
  %mul9 = mul i32 %add8, 40318, !dbg !1339
    #dbg_value(i32 %mul9, !1337, !DIExpression(), !1305)
  %shr10 = lshr i32 %mul9, 27, !dbg !1340
    #dbg_value(i32 %shr10, !1337, !DIExpression(), !1305)
  %and11 = and i32 %shr10, 31, !dbg !1341
  %conv12 = trunc i32 %and11 to i8, !dbg !1342
  %arrayidx13 = getelementptr inbounds nuw [8 x i8], ptr %t, i32 0, i32 %j.0, !dbg !1343
  store i8 %conv12, ptr %arrayidx13, align 1, !dbg !1344
  br label %for.inc, !dbg !1345

for.inc:                                          ; preds = %for.body3
  %inc = add i32 %j.0, 1, !dbg !1346
    #dbg_value(i32 %inc, !1317, !DIExpression(), !1305)
  br label %for.cond1, !dbg !1347, !llvm.loop !1348

for.end:                                          ; preds = %for.cond1
  %arrayidx14 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 0, !dbg !1350
  %1 = load i8, ptr %arrayidx14, align 1, !dbg !1350
  %conv15 = zext i8 %1 to i32, !dbg !1350
  %shr16 = ashr i32 %conv15, 0, !dbg !1351
  %arrayidx17 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 1, !dbg !1352
  %2 = load i8, ptr %arrayidx17, align 1, !dbg !1352
  %conv18 = zext i8 %2 to i32, !dbg !1352
  %shl19 = shl i32 %conv18, 5, !dbg !1353
  %or = or i32 %shr16, %shl19, !dbg !1354
  %conv20 = trunc i32 %or to i8, !dbg !1355
  %arrayidx21 = getelementptr inbounds i8, ptr %r.addr.0, i32 0, !dbg !1356
  store i8 %conv20, ptr %arrayidx21, align 1, !dbg !1357
  %arrayidx22 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 1, !dbg !1358
  %3 = load i8, ptr %arrayidx22, align 1, !dbg !1358
  %conv23 = zext i8 %3 to i32, !dbg !1358
  %shr24 = ashr i32 %conv23, 3, !dbg !1359
  %arrayidx25 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 2, !dbg !1360
  %4 = load i8, ptr %arrayidx25, align 1, !dbg !1360
  %conv26 = zext i8 %4 to i32, !dbg !1360
  %shl27 = shl i32 %conv26, 2, !dbg !1361
  %or28 = or i32 %shr24, %shl27, !dbg !1362
  %arrayidx29 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 3, !dbg !1363
  %5 = load i8, ptr %arrayidx29, align 1, !dbg !1363
  %conv30 = zext i8 %5 to i32, !dbg !1363
  %shl31 = shl i32 %conv30, 7, !dbg !1364
  %or32 = or i32 %or28, %shl31, !dbg !1365
  %conv33 = trunc i32 %or32 to i8, !dbg !1366
  %arrayidx34 = getelementptr inbounds i8, ptr %r.addr.0, i32 1, !dbg !1367
  store i8 %conv33, ptr %arrayidx34, align 1, !dbg !1368
  %arrayidx35 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 3, !dbg !1369
  %6 = load i8, ptr %arrayidx35, align 1, !dbg !1369
  %conv36 = zext i8 %6 to i32, !dbg !1369
  %shr37 = ashr i32 %conv36, 1, !dbg !1370
  %arrayidx38 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 4, !dbg !1371
  %7 = load i8, ptr %arrayidx38, align 1, !dbg !1371
  %conv39 = zext i8 %7 to i32, !dbg !1371
  %shl40 = shl i32 %conv39, 4, !dbg !1372
  %or41 = or i32 %shr37, %shl40, !dbg !1373
  %conv42 = trunc i32 %or41 to i8, !dbg !1374
  %arrayidx43 = getelementptr inbounds i8, ptr %r.addr.0, i32 2, !dbg !1375
  store i8 %conv42, ptr %arrayidx43, align 1, !dbg !1376
  %arrayidx44 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 4, !dbg !1377
  %8 = load i8, ptr %arrayidx44, align 1, !dbg !1377
  %conv45 = zext i8 %8 to i32, !dbg !1377
  %shr46 = ashr i32 %conv45, 4, !dbg !1378
  %arrayidx47 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 5, !dbg !1379
  %9 = load i8, ptr %arrayidx47, align 1, !dbg !1379
  %conv48 = zext i8 %9 to i32, !dbg !1379
  %shl49 = shl i32 %conv48, 1, !dbg !1380
  %or50 = or i32 %shr46, %shl49, !dbg !1381
  %arrayidx51 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 6, !dbg !1382
  %10 = load i8, ptr %arrayidx51, align 1, !dbg !1382
  %conv52 = zext i8 %10 to i32, !dbg !1382
  %shl53 = shl i32 %conv52, 6, !dbg !1383
  %or54 = or i32 %or50, %shl53, !dbg !1384
  %conv55 = trunc i32 %or54 to i8, !dbg !1385
  %arrayidx56 = getelementptr inbounds i8, ptr %r.addr.0, i32 3, !dbg !1386
  store i8 %conv55, ptr %arrayidx56, align 1, !dbg !1387
  %arrayidx57 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 6, !dbg !1388
  %11 = load i8, ptr %arrayidx57, align 1, !dbg !1388
  %conv58 = zext i8 %11 to i32, !dbg !1388
  %shr59 = ashr i32 %conv58, 2, !dbg !1389
  %arrayidx60 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 7, !dbg !1390
  %12 = load i8, ptr %arrayidx60, align 1, !dbg !1390
  %conv61 = zext i8 %12 to i32, !dbg !1390
  %shl62 = shl i32 %conv61, 3, !dbg !1391
  %or63 = or i32 %shr59, %shl62, !dbg !1392
  %conv64 = trunc i32 %or63 to i8, !dbg !1393
  %arrayidx65 = getelementptr inbounds i8, ptr %r.addr.0, i32 4, !dbg !1394
  store i8 %conv64, ptr %arrayidx65, align 1, !dbg !1395
  %add.ptr = getelementptr inbounds i8, ptr %r.addr.0, i32 5, !dbg !1396
    #dbg_value(ptr %add.ptr, !1304, !DIExpression(), !1305)
  br label %for.inc66, !dbg !1397

for.inc66:                                        ; preds = %for.end
  %inc67 = add i32 %i.0, 1, !dbg !1398
    #dbg_value(i32 %inc67, !1310, !DIExpression(), !1305)
  br label %for.cond, !dbg !1399, !llvm.loop !1400

for.end68:                                        ; preds = %for.cond
  ret void, !dbg !1402
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_poly_decompress(ptr noundef %r, ptr noundef %a) #0 !dbg !1403 {
entry:
  %t = alloca [8 x i8], align 1
    #dbg_value(ptr %r, !1407, !DIExpression(), !1408)
    #dbg_value(ptr %a, !1409, !DIExpression(), !1408)
    #dbg_declare(ptr %t, !1410, !DIExpression(), !1411)
    #dbg_value(i32 0, !1412, !DIExpression(), !1408)
  br label %for.cond, !dbg !1413

for.cond:                                         ; preds = %for.inc63, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc64, %for.inc63 ], !dbg !1415
  %a.addr.0 = phi ptr [ %a, %entry ], [ %add.ptr, %for.inc63 ]
    #dbg_value(ptr %a.addr.0, !1409, !DIExpression(), !1408)
    #dbg_value(i32 %i.0, !1412, !DIExpression(), !1408)
  %cmp = icmp ult i32 %i.0, 32, !dbg !1416
  br i1 %cmp, label %for.body, label %for.end65, !dbg !1418

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds i8, ptr %a.addr.0, i32 0, !dbg !1419
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1419
  %conv = zext i8 %0 to i32, !dbg !1419
  %shr = ashr i32 %conv, 0, !dbg !1421
  %conv1 = trunc i32 %shr to i8, !dbg !1422
  %arrayidx2 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 0, !dbg !1423
  store i8 %conv1, ptr %arrayidx2, align 1, !dbg !1424
  %arrayidx3 = getelementptr inbounds i8, ptr %a.addr.0, i32 0, !dbg !1425
  %1 = load i8, ptr %arrayidx3, align 1, !dbg !1425
  %conv4 = zext i8 %1 to i32, !dbg !1425
  %shr5 = ashr i32 %conv4, 5, !dbg !1426
  %arrayidx6 = getelementptr inbounds i8, ptr %a.addr.0, i32 1, !dbg !1427
  %2 = load i8, ptr %arrayidx6, align 1, !dbg !1427
  %conv7 = zext i8 %2 to i32, !dbg !1427
  %shl = shl i32 %conv7, 3, !dbg !1428
  %or = or i32 %shr5, %shl, !dbg !1429
  %conv8 = trunc i32 %or to i8, !dbg !1430
  %arrayidx9 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 1, !dbg !1431
  store i8 %conv8, ptr %arrayidx9, align 1, !dbg !1432
  %arrayidx10 = getelementptr inbounds i8, ptr %a.addr.0, i32 1, !dbg !1433
  %3 = load i8, ptr %arrayidx10, align 1, !dbg !1433
  %conv11 = zext i8 %3 to i32, !dbg !1433
  %shr12 = ashr i32 %conv11, 2, !dbg !1434
  %conv13 = trunc i32 %shr12 to i8, !dbg !1435
  %arrayidx14 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 2, !dbg !1436
  store i8 %conv13, ptr %arrayidx14, align 1, !dbg !1437
  %arrayidx15 = getelementptr inbounds i8, ptr %a.addr.0, i32 1, !dbg !1438
  %4 = load i8, ptr %arrayidx15, align 1, !dbg !1438
  %conv16 = zext i8 %4 to i32, !dbg !1438
  %shr17 = ashr i32 %conv16, 7, !dbg !1439
  %arrayidx18 = getelementptr inbounds i8, ptr %a.addr.0, i32 2, !dbg !1440
  %5 = load i8, ptr %arrayidx18, align 1, !dbg !1440
  %conv19 = zext i8 %5 to i32, !dbg !1440
  %shl20 = shl i32 %conv19, 1, !dbg !1441
  %or21 = or i32 %shr17, %shl20, !dbg !1442
  %conv22 = trunc i32 %or21 to i8, !dbg !1443
  %arrayidx23 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 3, !dbg !1444
  store i8 %conv22, ptr %arrayidx23, align 1, !dbg !1445
  %arrayidx24 = getelementptr inbounds i8, ptr %a.addr.0, i32 2, !dbg !1446
  %6 = load i8, ptr %arrayidx24, align 1, !dbg !1446
  %conv25 = zext i8 %6 to i32, !dbg !1446
  %shr26 = ashr i32 %conv25, 4, !dbg !1447
  %arrayidx27 = getelementptr inbounds i8, ptr %a.addr.0, i32 3, !dbg !1448
  %7 = load i8, ptr %arrayidx27, align 1, !dbg !1448
  %conv28 = zext i8 %7 to i32, !dbg !1448
  %shl29 = shl i32 %conv28, 4, !dbg !1449
  %or30 = or i32 %shr26, %shl29, !dbg !1450
  %conv31 = trunc i32 %or30 to i8, !dbg !1451
  %arrayidx32 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 4, !dbg !1452
  store i8 %conv31, ptr %arrayidx32, align 1, !dbg !1453
  %arrayidx33 = getelementptr inbounds i8, ptr %a.addr.0, i32 3, !dbg !1454
  %8 = load i8, ptr %arrayidx33, align 1, !dbg !1454
  %conv34 = zext i8 %8 to i32, !dbg !1454
  %shr35 = ashr i32 %conv34, 1, !dbg !1455
  %conv36 = trunc i32 %shr35 to i8, !dbg !1456
  %arrayidx37 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 5, !dbg !1457
  store i8 %conv36, ptr %arrayidx37, align 1, !dbg !1458
  %arrayidx38 = getelementptr inbounds i8, ptr %a.addr.0, i32 3, !dbg !1459
  %9 = load i8, ptr %arrayidx38, align 1, !dbg !1459
  %conv39 = zext i8 %9 to i32, !dbg !1459
  %shr40 = ashr i32 %conv39, 6, !dbg !1460
  %arrayidx41 = getelementptr inbounds i8, ptr %a.addr.0, i32 4, !dbg !1461
  %10 = load i8, ptr %arrayidx41, align 1, !dbg !1461
  %conv42 = zext i8 %10 to i32, !dbg !1461
  %shl43 = shl i32 %conv42, 2, !dbg !1462
  %or44 = or i32 %shr40, %shl43, !dbg !1463
  %conv45 = trunc i32 %or44 to i8, !dbg !1464
  %arrayidx46 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 6, !dbg !1465
  store i8 %conv45, ptr %arrayidx46, align 1, !dbg !1466
  %arrayidx47 = getelementptr inbounds i8, ptr %a.addr.0, i32 4, !dbg !1467
  %11 = load i8, ptr %arrayidx47, align 1, !dbg !1467
  %conv48 = zext i8 %11 to i32, !dbg !1467
  %shr49 = ashr i32 %conv48, 3, !dbg !1468
  %conv50 = trunc i32 %shr49 to i8, !dbg !1469
  %arrayidx51 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 7, !dbg !1470
  store i8 %conv50, ptr %arrayidx51, align 1, !dbg !1471
  %add.ptr = getelementptr inbounds i8, ptr %a.addr.0, i32 5, !dbg !1472
    #dbg_value(ptr %add.ptr, !1409, !DIExpression(), !1408)
    #dbg_value(i32 0, !1473, !DIExpression(), !1408)
  br label %for.cond52, !dbg !1474

for.cond52:                                       ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ], !dbg !1476
    #dbg_value(i32 %j.0, !1473, !DIExpression(), !1408)
  %cmp53 = icmp ult i32 %j.0, 8, !dbg !1477
  br i1 %cmp53, label %for.body55, label %for.end, !dbg !1479

for.body55:                                       ; preds = %for.cond52
  %arrayidx56 = getelementptr inbounds nuw [8 x i8], ptr %t, i32 0, i32 %j.0, !dbg !1480
  %12 = load i8, ptr %arrayidx56, align 1, !dbg !1480
  %conv57 = zext i8 %12 to i32, !dbg !1480
  %and = and i32 %conv57, 31, !dbg !1481
  %mul = mul i32 %and, 3329, !dbg !1482
  %add = add i32 %mul, 16, !dbg !1483
  %shr58 = lshr i32 %add, 5, !dbg !1484
  %conv59 = trunc i32 %shr58 to i16, !dbg !1485
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1486
  %mul60 = mul i32 8, %i.0, !dbg !1487
  %add61 = add i32 %mul60, %j.0, !dbg !1488
  %arrayidx62 = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %add61, !dbg !1489
  store i16 %conv59, ptr %arrayidx62, align 2, !dbg !1490
  br label %for.inc, !dbg !1489

for.inc:                                          ; preds = %for.body55
  %inc = add i32 %j.0, 1, !dbg !1491
    #dbg_value(i32 %inc, !1473, !DIExpression(), !1408)
  br label %for.cond52, !dbg !1492, !llvm.loop !1493

for.end:                                          ; preds = %for.cond52
  br label %for.inc63, !dbg !1495

for.inc63:                                        ; preds = %for.end
  %inc64 = add i32 %i.0, 1, !dbg !1496
    #dbg_value(i32 %inc64, !1412, !DIExpression(), !1408)
  br label %for.cond, !dbg !1497, !llvm.loop !1498

for.end65:                                        ; preds = %for.cond
  ret void, !dbg !1500
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_poly_tobytes(ptr noundef %r, ptr noundef %a) #0 !dbg !1501 {
entry:
    #dbg_value(ptr %r, !1502, !DIExpression(), !1503)
    #dbg_value(ptr %a, !1504, !DIExpression(), !1503)
    #dbg_value(i32 0, !1505, !DIExpression(), !1503)
  br label %for.cond, !dbg !1506

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1508
    #dbg_value(i32 %i.0, !1505, !DIExpression(), !1503)
  %cmp = icmp ult i32 %i.0, 128, !dbg !1509
  br i1 %cmp, label %for.body, label %for.end, !dbg !1511

for.body:                                         ; preds = %for.cond
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %a, i32 0, i32 0, !dbg !1512
  %mul = mul i32 2, %i.0, !dbg !1514
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %mul, !dbg !1515
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1515
    #dbg_value(i16 %0, !1516, !DIExpression(), !1503)
  %conv = sext i16 %0 to i32, !dbg !1517
  %shr = ashr i32 %conv, 15, !dbg !1518
  %and = and i32 %shr, 3329, !dbg !1519
  %conv1 = zext i16 %0 to i32, !dbg !1520
  %add = add nsw i32 %conv1, %and, !dbg !1520
  %conv2 = trunc i32 %add to i16, !dbg !1520
    #dbg_value(i16 %conv2, !1516, !DIExpression(), !1503)
  %coeffs3 = getelementptr inbounds nuw %struct.poly, ptr %a, i32 0, i32 0, !dbg !1521
  %mul4 = mul i32 2, %i.0, !dbg !1522
  %add5 = add i32 %mul4, 1, !dbg !1523
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %coeffs3, i32 0, i32 %add5, !dbg !1524
  %1 = load i16, ptr %arrayidx6, align 2, !dbg !1524
    #dbg_value(i16 %1, !1525, !DIExpression(), !1503)
  %conv7 = sext i16 %1 to i32, !dbg !1526
  %shr8 = ashr i32 %conv7, 15, !dbg !1527
  %and9 = and i32 %shr8, 3329, !dbg !1528
  %conv10 = zext i16 %1 to i32, !dbg !1529
  %add11 = add nsw i32 %conv10, %and9, !dbg !1529
  %conv12 = trunc i32 %add11 to i16, !dbg !1529
    #dbg_value(i16 %conv12, !1525, !DIExpression(), !1503)
  %conv13 = zext i16 %conv2 to i32, !dbg !1530
  %shr14 = ashr i32 %conv13, 0, !dbg !1531
  %conv15 = trunc i32 %shr14 to i8, !dbg !1532
  %mul16 = mul i32 3, %i.0, !dbg !1533
  %add17 = add i32 %mul16, 0, !dbg !1534
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %r, i32 %add17, !dbg !1535
  store i8 %conv15, ptr %arrayidx18, align 1, !dbg !1536
  %conv19 = zext i16 %conv2 to i32, !dbg !1537
  %shr20 = ashr i32 %conv19, 8, !dbg !1538
  %conv21 = zext i16 %conv12 to i32, !dbg !1539
  %shl = shl i32 %conv21, 4, !dbg !1540
  %or = or i32 %shr20, %shl, !dbg !1541
  %conv22 = trunc i32 %or to i8, !dbg !1542
  %mul23 = mul i32 3, %i.0, !dbg !1543
  %add24 = add i32 %mul23, 1, !dbg !1544
  %arrayidx25 = getelementptr inbounds nuw i8, ptr %r, i32 %add24, !dbg !1545
  store i8 %conv22, ptr %arrayidx25, align 1, !dbg !1546
  %conv26 = zext i16 %conv12 to i32, !dbg !1547
  %shr27 = ashr i32 %conv26, 4, !dbg !1548
  %conv28 = trunc i32 %shr27 to i8, !dbg !1549
  %mul29 = mul i32 3, %i.0, !dbg !1550
  %add30 = add i32 %mul29, 2, !dbg !1551
  %arrayidx31 = getelementptr inbounds nuw i8, ptr %r, i32 %add30, !dbg !1552
  store i8 %conv28, ptr %arrayidx31, align 1, !dbg !1553
  br label %for.inc, !dbg !1554

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1555
    #dbg_value(i32 %inc, !1505, !DIExpression(), !1503)
  br label %for.cond, !dbg !1556, !llvm.loop !1557

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1559
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_poly_frombytes(ptr noundef %r, ptr noundef %a) #0 !dbg !1560 {
entry:
    #dbg_value(ptr %r, !1561, !DIExpression(), !1562)
    #dbg_value(ptr %a, !1563, !DIExpression(), !1562)
    #dbg_value(i32 0, !1564, !DIExpression(), !1562)
  br label %for.cond, !dbg !1565

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1567
    #dbg_value(i32 %i.0, !1564, !DIExpression(), !1562)
  %cmp = icmp ult i32 %i.0, 128, !dbg !1568
  br i1 %cmp, label %for.body, label %for.end, !dbg !1570

for.body:                                         ; preds = %for.cond
  %mul = mul i32 3, %i.0, !dbg !1571
  %add = add i32 %mul, 0, !dbg !1573
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %add, !dbg !1574
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1574
  %conv = zext i8 %0 to i32, !dbg !1574
  %shr = ashr i32 %conv, 0, !dbg !1575
  %mul1 = mul i32 3, %i.0, !dbg !1576
  %add2 = add i32 %mul1, 1, !dbg !1577
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %a, i32 %add2, !dbg !1578
  %1 = load i8, ptr %arrayidx3, align 1, !dbg !1578
  %conv4 = zext i8 %1 to i16, !dbg !1579
  %conv5 = zext i16 %conv4 to i32, !dbg !1579
  %shl = shl i32 %conv5, 8, !dbg !1580
  %or = or i32 %shr, %shl, !dbg !1581
  %and = and i32 %or, 4095, !dbg !1582
  %conv6 = trunc i32 %and to i16, !dbg !1583
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1584
  %mul7 = mul i32 2, %i.0, !dbg !1585
  %arrayidx8 = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %mul7, !dbg !1586
  store i16 %conv6, ptr %arrayidx8, align 2, !dbg !1587
  %mul9 = mul i32 3, %i.0, !dbg !1588
  %add10 = add i32 %mul9, 1, !dbg !1589
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %a, i32 %add10, !dbg !1590
  %2 = load i8, ptr %arrayidx11, align 1, !dbg !1590
  %conv12 = zext i8 %2 to i32, !dbg !1590
  %shr13 = ashr i32 %conv12, 4, !dbg !1591
  %mul14 = mul i32 3, %i.0, !dbg !1592
  %add15 = add i32 %mul14, 2, !dbg !1593
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %a, i32 %add15, !dbg !1594
  %3 = load i8, ptr %arrayidx16, align 1, !dbg !1594
  %conv17 = zext i8 %3 to i16, !dbg !1595
  %conv18 = zext i16 %conv17 to i32, !dbg !1595
  %shl19 = shl i32 %conv18, 4, !dbg !1596
  %or20 = or i32 %shr13, %shl19, !dbg !1597
  %and21 = and i32 %or20, 4095, !dbg !1598
  %conv22 = trunc i32 %and21 to i16, !dbg !1599
  %coeffs23 = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1600
  %mul24 = mul i32 2, %i.0, !dbg !1601
  %add25 = add i32 %mul24, 1, !dbg !1602
  %arrayidx26 = getelementptr inbounds nuw [256 x i16], ptr %coeffs23, i32 0, i32 %add25, !dbg !1603
  store i16 %conv22, ptr %arrayidx26, align 2, !dbg !1604
  br label %for.inc, !dbg !1605

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1606
    #dbg_value(i32 %inc, !1564, !DIExpression(), !1562)
  br label %for.cond, !dbg !1607, !llvm.loop !1608

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1610
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_poly_frommsg(ptr noundef %r, ptr noundef %msg) #0 !dbg !1611 {
entry:
    #dbg_value(ptr %r, !1612, !DIExpression(), !1613)
    #dbg_value(ptr %msg, !1614, !DIExpression(), !1613)
    #dbg_value(i32 0, !1615, !DIExpression(), !1613)
  br label %for.cond, !dbg !1616

for.cond:                                         ; preds = %for.inc9, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc10, %for.inc9 ], !dbg !1618
    #dbg_value(i32 %i.0, !1615, !DIExpression(), !1613)
  %cmp = icmp ult i32 %i.0, 32, !dbg !1619
  br i1 %cmp, label %for.body, label %for.end11, !dbg !1621

for.body:                                         ; preds = %for.cond
    #dbg_value(i32 0, !1622, !DIExpression(), !1613)
  br label %for.cond1, !dbg !1623

for.cond1:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ], !dbg !1626
    #dbg_value(i32 %j.0, !1622, !DIExpression(), !1613)
  %cmp2 = icmp ult i32 %j.0, 8, !dbg !1627
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !1629

for.body3:                                        ; preds = %for.cond1
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1630
  %mul = mul i32 8, %i.0, !dbg !1632
  %add = add i32 %mul, %j.0, !dbg !1633
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %add, !dbg !1634
  store i16 0, ptr %arrayidx, align 2, !dbg !1635
  %coeffs4 = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1636
  %arraydecay = getelementptr inbounds [256 x i16], ptr %coeffs4, i32 0, i32 0, !dbg !1637
  %mul5 = mul i32 8, %i.0, !dbg !1638
  %add.ptr = getelementptr inbounds nuw i16, ptr %arraydecay, i32 %mul5, !dbg !1639
  %add.ptr6 = getelementptr inbounds nuw i16, ptr %add.ptr, i32 %j.0, !dbg !1640
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1641
  %0 = load i8, ptr %arrayidx7, align 1, !dbg !1641
  %conv = zext i8 %0 to i32, !dbg !1641
  %shr = ashr i32 %conv, %j.0, !dbg !1642
  %and = and i32 %shr, 1, !dbg !1643
  %conv8 = trunc i32 %and to i16, !dbg !1644
  call void @pqcrystals_kyber1024_ref_cmov_int16(ptr noundef %add.ptr6, i16 noundef signext 1665, i16 noundef zeroext %conv8) #2, !dbg !1645
  br label %for.inc, !dbg !1646

for.inc:                                          ; preds = %for.body3
  %inc = add i32 %j.0, 1, !dbg !1647
    #dbg_value(i32 %inc, !1622, !DIExpression(), !1613)
  br label %for.cond1, !dbg !1648, !llvm.loop !1649

for.end:                                          ; preds = %for.cond1
  br label %for.inc9, !dbg !1651

for.inc9:                                         ; preds = %for.end
  %inc10 = add i32 %i.0, 1, !dbg !1652
    #dbg_value(i32 %inc10, !1615, !DIExpression(), !1613)
  br label %for.cond, !dbg !1653, !llvm.loop !1654

for.end11:                                        ; preds = %for.cond
  ret void, !dbg !1656
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_poly_tomsg(ptr noundef %msg, ptr noundef %a) #0 !dbg !1657 {
entry:
    #dbg_value(ptr %msg, !1658, !DIExpression(), !1659)
    #dbg_value(ptr %a, !1660, !DIExpression(), !1659)
    #dbg_value(i32 0, !1661, !DIExpression(), !1659)
  br label %for.cond, !dbg !1662

for.cond:                                         ; preds = %for.inc11, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc12, %for.inc11 ], !dbg !1664
    #dbg_value(i32 %i.0, !1661, !DIExpression(), !1659)
  %cmp = icmp ult i32 %i.0, 32, !dbg !1665
  br i1 %cmp, label %for.body, label %for.end13, !dbg !1667

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1668
  store i8 0, ptr %arrayidx, align 1, !dbg !1670
    #dbg_value(i32 0, !1671, !DIExpression(), !1659)
  br label %for.cond1, !dbg !1672

for.cond1:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ], !dbg !1674
    #dbg_value(i32 %j.0, !1671, !DIExpression(), !1659)
  %cmp2 = icmp ult i32 %j.0, 8, !dbg !1675
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !1677

for.body3:                                        ; preds = %for.cond1
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %a, i32 0, i32 0, !dbg !1678
  %mul = mul i32 8, %i.0, !dbg !1680
  %add = add i32 %mul, %j.0, !dbg !1681
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %add, !dbg !1682
  %0 = load i16, ptr %arrayidx4, align 2, !dbg !1682
  %conv = sext i16 %0 to i32, !dbg !1682
    #dbg_value(i32 %conv, !1683, !DIExpression(), !1659)
  %shl = shl i32 %conv, 1, !dbg !1684
    #dbg_value(i32 %shl, !1683, !DIExpression(), !1659)
  %add5 = add i32 %shl, 1665, !dbg !1685
    #dbg_value(i32 %add5, !1683, !DIExpression(), !1659)
  %mul6 = mul i32 %add5, 80635, !dbg !1686
    #dbg_value(i32 %mul6, !1683, !DIExpression(), !1659)
  %shr = lshr i32 %mul6, 28, !dbg !1687
    #dbg_value(i32 %shr, !1683, !DIExpression(), !1659)
  %and = and i32 %shr, 1, !dbg !1688
    #dbg_value(i32 %and, !1683, !DIExpression(), !1659)
  %shl7 = shl i32 %and, %j.0, !dbg !1689
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1690
  %1 = load i8, ptr %arrayidx8, align 1, !dbg !1691
  %conv9 = zext i8 %1 to i32, !dbg !1691
  %or = or i32 %conv9, %shl7, !dbg !1691
  %conv10 = trunc i32 %or to i8, !dbg !1691
  store i8 %conv10, ptr %arrayidx8, align 1, !dbg !1691
  br label %for.inc, !dbg !1692

for.inc:                                          ; preds = %for.body3
  %inc = add i32 %j.0, 1, !dbg !1693
    #dbg_value(i32 %inc, !1671, !DIExpression(), !1659)
  br label %for.cond1, !dbg !1694, !llvm.loop !1695

for.end:                                          ; preds = %for.cond1
  br label %for.inc11, !dbg !1697

for.inc11:                                        ; preds = %for.end
  %inc12 = add i32 %i.0, 1, !dbg !1698
    #dbg_value(i32 %inc12, !1661, !DIExpression(), !1659)
  br label %for.cond, !dbg !1699, !llvm.loop !1700

for.end13:                                        ; preds = %for.cond
  ret void, !dbg !1702
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_poly_getnoise_eta1(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) #0 !dbg !1703 {
entry:
  %buf = alloca [128 x i8], align 1
    #dbg_value(ptr %r, !1706, !DIExpression(), !1707)
    #dbg_value(ptr %seed, !1708, !DIExpression(), !1707)
    #dbg_value(i8 %nonce, !1709, !DIExpression(), !1707)
    #dbg_declare(ptr %buf, !1710, !DIExpression(), !1712)
  %arraydecay = getelementptr inbounds [128 x i8], ptr %buf, i32 0, i32 0, !dbg !1713
  call void @pqcrystals_kyber1024_ref_kyber_shake256_prf(ptr noundef %arraydecay, i32 noundef 128, ptr noundef %seed, i8 noundef zeroext %nonce) #2, !dbg !1713
  %arraydecay1 = getelementptr inbounds [128 x i8], ptr %buf, i32 0, i32 0, !dbg !1714
  call void @pqcrystals_kyber1024_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef %arraydecay1) #2, !dbg !1715
  ret void, !dbg !1716
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_poly_getnoise_eta2(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) #0 !dbg !1717 {
entry:
  %buf = alloca [128 x i8], align 1
    #dbg_value(ptr %r, !1718, !DIExpression(), !1719)
    #dbg_value(ptr %seed, !1720, !DIExpression(), !1719)
    #dbg_value(i8 %nonce, !1721, !DIExpression(), !1719)
    #dbg_declare(ptr %buf, !1722, !DIExpression(), !1723)
  %arraydecay = getelementptr inbounds [128 x i8], ptr %buf, i32 0, i32 0, !dbg !1724
  call void @pqcrystals_kyber1024_ref_kyber_shake256_prf(ptr noundef %arraydecay, i32 noundef 128, ptr noundef %seed, i8 noundef zeroext %nonce) #2, !dbg !1724
  %arraydecay1 = getelementptr inbounds [128 x i8], ptr %buf, i32 0, i32 0, !dbg !1725
  call void @pqcrystals_kyber1024_ref_poly_cbd_eta2(ptr noundef %r, ptr noundef %arraydecay1) #2, !dbg !1726
  ret void, !dbg !1727
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_poly_ntt(ptr noundef %r) #0 !dbg !1728 {
entry:
    #dbg_value(ptr %r, !1731, !DIExpression(), !1732)
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1733
  %arraydecay = getelementptr inbounds [256 x i16], ptr %coeffs, i32 0, i32 0, !dbg !1734
  call void @pqcrystals_kyber1024_ref_ntt(ptr noundef %arraydecay) #2, !dbg !1735
  call void @pqcrystals_kyber1024_ref_poly_reduce(ptr noundef %r) #2, !dbg !1736
  ret void, !dbg !1737
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_poly_reduce(ptr noundef %r) #0 !dbg !1738 {
entry:
    #dbg_value(ptr %r, !1739, !DIExpression(), !1740)
    #dbg_value(i32 0, !1741, !DIExpression(), !1740)
  br label %for.cond, !dbg !1742

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1744
    #dbg_value(i32 %i.0, !1741, !DIExpression(), !1740)
  %cmp = icmp ult i32 %i.0, 256, !dbg !1745
  br i1 %cmp, label %for.body, label %for.end, !dbg !1747

for.body:                                         ; preds = %for.cond
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1748
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %i.0, !dbg !1749
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1749
  %call = call signext i16 @pqcrystals_kyber1024_ref_barrett_reduce(i16 noundef signext %0) #2, !dbg !1750
  %coeffs1 = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1751
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %coeffs1, i32 0, i32 %i.0, !dbg !1752
  store i16 %call, ptr %arrayidx2, align 2, !dbg !1753
  br label %for.inc, !dbg !1752

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1754
    #dbg_value(i32 %inc, !1741, !DIExpression(), !1740)
  br label %for.cond, !dbg !1755, !llvm.loop !1756

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1758
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_poly_invntt_tomont(ptr noundef %r) #0 !dbg !1759 {
entry:
    #dbg_value(ptr %r, !1760, !DIExpression(), !1761)
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1762
  %arraydecay = getelementptr inbounds [256 x i16], ptr %coeffs, i32 0, i32 0, !dbg !1763
  call void @pqcrystals_kyber1024_ref_invntt(ptr noundef %arraydecay) #2, !dbg !1764
  ret void, !dbg !1765
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) #0 !dbg !1766 {
entry:
    #dbg_value(ptr %r, !1769, !DIExpression(), !1770)
    #dbg_value(ptr %a, !1771, !DIExpression(), !1770)
    #dbg_value(ptr %b, !1772, !DIExpression(), !1770)
    #dbg_value(i32 0, !1773, !DIExpression(), !1770)
  br label %for.cond, !dbg !1774

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1776
    #dbg_value(i32 %i.0, !1773, !DIExpression(), !1770)
  %cmp = icmp ult i32 %i.0, 64, !dbg !1777
  br i1 %cmp, label %for.body, label %for.end, !dbg !1779

for.body:                                         ; preds = %for.cond
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1780
  %mul = mul i32 4, %i.0, !dbg !1782
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %mul, !dbg !1783
  %coeffs1 = getelementptr inbounds nuw %struct.poly, ptr %a, i32 0, i32 0, !dbg !1784
  %mul2 = mul i32 4, %i.0, !dbg !1785
  %arrayidx3 = getelementptr inbounds nuw [256 x i16], ptr %coeffs1, i32 0, i32 %mul2, !dbg !1786
  %coeffs4 = getelementptr inbounds nuw %struct.poly, ptr %b, i32 0, i32 0, !dbg !1787
  %mul5 = mul i32 4, %i.0, !dbg !1788
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %coeffs4, i32 0, i32 %mul5, !dbg !1789
  %add = add i32 64, %i.0, !dbg !1790
  %arrayidx7 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber1024_ref_zetas, i32 0, i32 %add, !dbg !1791
  %0 = load i16, ptr %arrayidx7, align 2, !dbg !1791
  call void @pqcrystals_kyber1024_ref_basemul(ptr noundef %arrayidx, ptr noundef %arrayidx3, ptr noundef %arrayidx6, i16 noundef signext %0) #2, !dbg !1792
  %coeffs8 = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1793
  %mul9 = mul i32 4, %i.0, !dbg !1794
  %add10 = add i32 %mul9, 2, !dbg !1795
  %arrayidx11 = getelementptr inbounds nuw [256 x i16], ptr %coeffs8, i32 0, i32 %add10, !dbg !1796
  %coeffs12 = getelementptr inbounds nuw %struct.poly, ptr %a, i32 0, i32 0, !dbg !1797
  %mul13 = mul i32 4, %i.0, !dbg !1798
  %add14 = add i32 %mul13, 2, !dbg !1799
  %arrayidx15 = getelementptr inbounds nuw [256 x i16], ptr %coeffs12, i32 0, i32 %add14, !dbg !1800
  %coeffs16 = getelementptr inbounds nuw %struct.poly, ptr %b, i32 0, i32 0, !dbg !1801
  %mul17 = mul i32 4, %i.0, !dbg !1802
  %add18 = add i32 %mul17, 2, !dbg !1803
  %arrayidx19 = getelementptr inbounds nuw [256 x i16], ptr %coeffs16, i32 0, i32 %add18, !dbg !1804
  %add20 = add i32 64, %i.0, !dbg !1805
  %arrayidx21 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber1024_ref_zetas, i32 0, i32 %add20, !dbg !1806
  %1 = load i16, ptr %arrayidx21, align 2, !dbg !1806
  %conv = sext i16 %1 to i32, !dbg !1806
  %sub = sub nsw i32 0, %conv, !dbg !1807
  %conv22 = trunc i32 %sub to i16, !dbg !1807
  call void @pqcrystals_kyber1024_ref_basemul(ptr noundef %arrayidx11, ptr noundef %arrayidx15, ptr noundef %arrayidx19, i16 noundef signext %conv22) #2, !dbg !1808
  br label %for.inc, !dbg !1809

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1810
    #dbg_value(i32 %inc, !1773, !DIExpression(), !1770)
  br label %for.cond, !dbg !1811, !llvm.loop !1812

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1814
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_poly_tomont(ptr noundef %r) #0 !dbg !1815 {
entry:
    #dbg_value(ptr %r, !1816, !DIExpression(), !1817)
    #dbg_value(i16 1353, !1818, !DIExpression(), !1817)
    #dbg_value(i32 0, !1819, !DIExpression(), !1817)
  br label %for.cond, !dbg !1820

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1822
    #dbg_value(i32 %i.0, !1819, !DIExpression(), !1817)
  %cmp = icmp ult i32 %i.0, 256, !dbg !1823
  br i1 %cmp, label %for.body, label %for.end, !dbg !1825

for.body:                                         ; preds = %for.cond
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1826
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %i.0, !dbg !1827
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1827
  %conv = sext i16 %0 to i32, !dbg !1828
  %mul = mul nsw i32 %conv, 1353, !dbg !1829
  %call = call signext i16 @pqcrystals_kyber1024_ref_montgomery_reduce(i32 noundef %mul) #2, !dbg !1830
  %coeffs1 = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1831
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %coeffs1, i32 0, i32 %i.0, !dbg !1832
  store i16 %call, ptr %arrayidx2, align 2, !dbg !1833
  br label %for.inc, !dbg !1832

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1834
    #dbg_value(i32 %inc, !1819, !DIExpression(), !1817)
  br label %for.cond, !dbg !1835, !llvm.loop !1836

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1838
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_poly_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) #0 !dbg !1839 {
entry:
    #dbg_value(ptr %r, !1840, !DIExpression(), !1841)
    #dbg_value(ptr %a, !1842, !DIExpression(), !1841)
    #dbg_value(ptr %b, !1843, !DIExpression(), !1841)
    #dbg_value(i32 0, !1844, !DIExpression(), !1841)
  br label %for.cond, !dbg !1845

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1847
    #dbg_value(i32 %i.0, !1844, !DIExpression(), !1841)
  %cmp = icmp ult i32 %i.0, 256, !dbg !1848
  br i1 %cmp, label %for.body, label %for.end, !dbg !1850

for.body:                                         ; preds = %for.cond
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %a, i32 0, i32 0, !dbg !1851
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %i.0, !dbg !1852
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1852
  %conv = sext i16 %0 to i32, !dbg !1852
  %coeffs1 = getelementptr inbounds nuw %struct.poly, ptr %b, i32 0, i32 0, !dbg !1853
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %coeffs1, i32 0, i32 %i.0, !dbg !1854
  %1 = load i16, ptr %arrayidx2, align 2, !dbg !1854
  %conv3 = sext i16 %1 to i32, !dbg !1854
  %add = add nsw i32 %conv, %conv3, !dbg !1855
  %conv4 = trunc i32 %add to i16, !dbg !1852
  %coeffs5 = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1856
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %coeffs5, i32 0, i32 %i.0, !dbg !1857
  store i16 %conv4, ptr %arrayidx6, align 2, !dbg !1858
  br label %for.inc, !dbg !1857

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1859
    #dbg_value(i32 %inc, !1844, !DIExpression(), !1841)
  br label %for.cond, !dbg !1860, !llvm.loop !1861

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1863
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_poly_sub(ptr noundef %r, ptr noundef %a, ptr noundef %b) #0 !dbg !1864 {
entry:
    #dbg_value(ptr %r, !1865, !DIExpression(), !1866)
    #dbg_value(ptr %a, !1867, !DIExpression(), !1866)
    #dbg_value(ptr %b, !1868, !DIExpression(), !1866)
    #dbg_value(i32 0, !1869, !DIExpression(), !1866)
  br label %for.cond, !dbg !1870

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1872
    #dbg_value(i32 %i.0, !1869, !DIExpression(), !1866)
  %cmp = icmp ult i32 %i.0, 256, !dbg !1873
  br i1 %cmp, label %for.body, label %for.end, !dbg !1875

for.body:                                         ; preds = %for.cond
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %a, i32 0, i32 0, !dbg !1876
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %i.0, !dbg !1877
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1877
  %conv = sext i16 %0 to i32, !dbg !1877
  %coeffs1 = getelementptr inbounds nuw %struct.poly, ptr %b, i32 0, i32 0, !dbg !1878
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %coeffs1, i32 0, i32 %i.0, !dbg !1879
  %1 = load i16, ptr %arrayidx2, align 2, !dbg !1879
  %conv3 = sext i16 %1 to i32, !dbg !1879
  %sub = sub nsw i32 %conv, %conv3, !dbg !1880
  %conv4 = trunc i32 %sub to i16, !dbg !1877
  %coeffs5 = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1881
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %coeffs5, i32 0, i32 %i.0, !dbg !1882
  store i16 %conv4, ptr %arrayidx6, align 2, !dbg !1883
  br label %for.inc, !dbg !1882

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1884
    #dbg_value(i32 %inc, !1869, !DIExpression(), !1866)
  br label %for.cond, !dbg !1885, !llvm.loop !1886

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1888
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_ntt(ptr noundef %r) #0 !dbg !1889 {
entry:
    #dbg_value(ptr %r, !1892, !DIExpression(), !1893)
    #dbg_value(i32 1, !1894, !DIExpression(), !1893)
    #dbg_value(i32 128, !1895, !DIExpression(), !1893)
  br label %for.cond, !dbg !1896

for.cond:                                         ; preds = %for.inc24, %entry
  %len.0 = phi i32 [ 128, %entry ], [ %shr, %for.inc24 ], !dbg !1898
  %k.0 = phi i32 [ 1, %entry ], [ %k.1, %for.inc24 ], !dbg !1899
    #dbg_value(i32 %k.0, !1894, !DIExpression(), !1893)
    #dbg_value(i32 %len.0, !1895, !DIExpression(), !1893)
  %cmp = icmp uge i32 %len.0, 2, !dbg !1900
  br i1 %cmp, label %for.body, label %for.end25, !dbg !1902

for.body:                                         ; preds = %for.cond
    #dbg_value(i32 0, !1903, !DIExpression(), !1893)
  br label %for.cond1, !dbg !1904

for.cond1:                                        ; preds = %for.inc21, %for.body
  %start.0 = phi i32 [ 0, %for.body ], [ %add22, %for.inc21 ], !dbg !1907
  %k.1 = phi i32 [ %k.0, %for.body ], [ %inc, %for.inc21 ], !dbg !1893
    #dbg_value(i32 %k.1, !1894, !DIExpression(), !1893)
    #dbg_value(i32 %start.0, !1903, !DIExpression(), !1893)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !1908
  br i1 %cmp2, label %for.body3, label %for.end23, !dbg !1910

for.body3:                                        ; preds = %for.cond1
  %inc = add i32 %k.1, 1, !dbg !1911
    #dbg_value(i32 %inc, !1894, !DIExpression(), !1893)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber1024_ref_zetas, i32 0, i32 %k.1, !dbg !1913
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1913
    #dbg_value(i16 %0, !1914, !DIExpression(), !1893)
    #dbg_value(i32 %start.0, !1915, !DIExpression(), !1893)
  br label %for.cond4, !dbg !1916

for.cond4:                                        ; preds = %for.inc, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc20, %for.inc ], !dbg !1918
    #dbg_value(i32 %j.0, !1915, !DIExpression(), !1893)
  %add = add i32 %start.0, %len.0, !dbg !1919
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !1921
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !1922

for.body6:                                        ; preds = %for.cond4
  %add7 = add i32 %j.0, %len.0, !dbg !1923
  %arrayidx8 = getelementptr inbounds nuw i16, ptr %r, i32 %add7, !dbg !1925
  %1 = load i16, ptr %arrayidx8, align 2, !dbg !1925
  %call = call signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %1) #2, !dbg !1926
    #dbg_value(i16 %call, !1927, !DIExpression(), !1893)
  %arrayidx9 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1928
  %2 = load i16, ptr %arrayidx9, align 2, !dbg !1928
  %conv = sext i16 %2 to i32, !dbg !1928
  %conv10 = sext i16 %call to i32, !dbg !1929
  %sub = sub nsw i32 %conv, %conv10, !dbg !1930
  %conv11 = trunc i32 %sub to i16, !dbg !1928
  %add12 = add i32 %j.0, %len.0, !dbg !1931
  %arrayidx13 = getelementptr inbounds nuw i16, ptr %r, i32 %add12, !dbg !1932
  store i16 %conv11, ptr %arrayidx13, align 2, !dbg !1933
  %arrayidx14 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1934
  %3 = load i16, ptr %arrayidx14, align 2, !dbg !1934
  %conv15 = sext i16 %3 to i32, !dbg !1934
  %conv16 = sext i16 %call to i32, !dbg !1935
  %add17 = add nsw i32 %conv15, %conv16, !dbg !1936
  %conv18 = trunc i32 %add17 to i16, !dbg !1934
  %arrayidx19 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1937
  store i16 %conv18, ptr %arrayidx19, align 2, !dbg !1938
  br label %for.inc, !dbg !1939

for.inc:                                          ; preds = %for.body6
  %inc20 = add i32 %j.0, 1, !dbg !1940
    #dbg_value(i32 %inc20, !1915, !DIExpression(), !1893)
  br label %for.cond4, !dbg !1941, !llvm.loop !1942

for.end:                                          ; preds = %for.cond4
  br label %for.inc21, !dbg !1944

for.inc21:                                        ; preds = %for.end
  %add22 = add i32 %j.0, %len.0, !dbg !1945
    #dbg_value(i32 %add22, !1903, !DIExpression(), !1893)
  br label %for.cond1, !dbg !1946, !llvm.loop !1947

for.end23:                                        ; preds = %for.cond1
  br label %for.inc24, !dbg !1949

for.inc24:                                        ; preds = %for.end23
  %shr = lshr i32 %len.0, 1, !dbg !1950
    #dbg_value(i32 %shr, !1895, !DIExpression(), !1893)
  br label %for.cond, !dbg !1951, !llvm.loop !1952

for.end25:                                        ; preds = %for.cond
  ret void, !dbg !1954
}

; Function Attrs: noinline nounwind optnone
define internal signext i16 @fqmul(i16 noundef signext %a, i16 noundef signext %b) #0 !dbg !1955 {
entry:
    #dbg_value(i16 %a, !1958, !DIExpression(), !1959)
    #dbg_value(i16 %b, !1960, !DIExpression(), !1959)
  %conv = sext i16 %a to i32, !dbg !1961
  %conv1 = sext i16 %b to i32, !dbg !1962
  %mul = mul nsw i32 %conv, %conv1, !dbg !1963
  %call = call signext i16 @pqcrystals_kyber1024_ref_montgomery_reduce(i32 noundef %mul) #2, !dbg !1964
  ret i16 %call, !dbg !1965
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_invntt(ptr noundef %r) #0 !dbg !1966 {
entry:
    #dbg_value(ptr %r, !1967, !DIExpression(), !1968)
    #dbg_value(i16 1441, !1969, !DIExpression(), !1968)
    #dbg_value(i32 127, !1970, !DIExpression(), !1968)
    #dbg_value(i32 2, !1971, !DIExpression(), !1968)
  br label %for.cond, !dbg !1972

for.cond:                                         ; preds = %for.inc29, %entry
  %len.0 = phi i32 [ 2, %entry ], [ %shl, %for.inc29 ], !dbg !1974
  %k.0 = phi i32 [ 127, %entry ], [ %k.1, %for.inc29 ], !dbg !1975
    #dbg_value(i32 %k.0, !1970, !DIExpression(), !1968)
    #dbg_value(i32 %len.0, !1971, !DIExpression(), !1968)
  %cmp = icmp ule i32 %len.0, 128, !dbg !1976
  br i1 %cmp, label %for.body, label %for.end30, !dbg !1978

for.body:                                         ; preds = %for.cond
    #dbg_value(i32 0, !1979, !DIExpression(), !1968)
  br label %for.cond1, !dbg !1980

for.cond1:                                        ; preds = %for.inc26, %for.body
  %start.0 = phi i32 [ 0, %for.body ], [ %add27, %for.inc26 ], !dbg !1983
  %k.1 = phi i32 [ %k.0, %for.body ], [ %dec, %for.inc26 ], !dbg !1968
    #dbg_value(i32 %k.1, !1970, !DIExpression(), !1968)
    #dbg_value(i32 %start.0, !1979, !DIExpression(), !1968)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !1984
  br i1 %cmp2, label %for.body3, label %for.end28, !dbg !1986

for.body3:                                        ; preds = %for.cond1
  %dec = add i32 %k.1, -1, !dbg !1987
    #dbg_value(i32 %dec, !1970, !DIExpression(), !1968)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber1024_ref_zetas, i32 0, i32 %k.1, !dbg !1989
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1989
    #dbg_value(i16 %0, !1990, !DIExpression(), !1968)
    #dbg_value(i32 %start.0, !1991, !DIExpression(), !1968)
  br label %for.cond4, !dbg !1992

for.cond4:                                        ; preds = %for.inc, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc, %for.inc ], !dbg !1994
    #dbg_value(i32 %j.0, !1991, !DIExpression(), !1968)
  %add = add i32 %start.0, %len.0, !dbg !1995
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !1997
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !1998

for.body6:                                        ; preds = %for.cond4
  %arrayidx7 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1999
  %1 = load i16, ptr %arrayidx7, align 2, !dbg !1999
    #dbg_value(i16 %1, !2001, !DIExpression(), !1968)
  %conv = sext i16 %1 to i32, !dbg !2002
  %add8 = add i32 %j.0, %len.0, !dbg !2003
  %arrayidx9 = getelementptr inbounds nuw i16, ptr %r, i32 %add8, !dbg !2004
  %2 = load i16, ptr %arrayidx9, align 2, !dbg !2004
  %conv10 = sext i16 %2 to i32, !dbg !2004
  %add11 = add nsw i32 %conv, %conv10, !dbg !2005
  %conv12 = trunc i32 %add11 to i16, !dbg !2002
  %call = call signext i16 @pqcrystals_kyber1024_ref_barrett_reduce(i16 noundef signext %conv12) #2, !dbg !2006
  %arrayidx13 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !2007
  store i16 %call, ptr %arrayidx13, align 2, !dbg !2008
  %add14 = add i32 %j.0, %len.0, !dbg !2009
  %arrayidx15 = getelementptr inbounds nuw i16, ptr %r, i32 %add14, !dbg !2010
  %3 = load i16, ptr %arrayidx15, align 2, !dbg !2010
  %conv16 = sext i16 %3 to i32, !dbg !2010
  %conv17 = sext i16 %1 to i32, !dbg !2011
  %sub = sub nsw i32 %conv16, %conv17, !dbg !2012
  %conv18 = trunc i32 %sub to i16, !dbg !2010
  %add19 = add i32 %j.0, %len.0, !dbg !2013
  %arrayidx20 = getelementptr inbounds nuw i16, ptr %r, i32 %add19, !dbg !2014
  store i16 %conv18, ptr %arrayidx20, align 2, !dbg !2015
  %add21 = add i32 %j.0, %len.0, !dbg !2016
  %arrayidx22 = getelementptr inbounds nuw i16, ptr %r, i32 %add21, !dbg !2017
  %4 = load i16, ptr %arrayidx22, align 2, !dbg !2017
  %call23 = call signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %4) #2, !dbg !2018
  %add24 = add i32 %j.0, %len.0, !dbg !2019
  %arrayidx25 = getelementptr inbounds nuw i16, ptr %r, i32 %add24, !dbg !2020
  store i16 %call23, ptr %arrayidx25, align 2, !dbg !2021
  br label %for.inc, !dbg !2022

for.inc:                                          ; preds = %for.body6
  %inc = add i32 %j.0, 1, !dbg !2023
    #dbg_value(i32 %inc, !1991, !DIExpression(), !1968)
  br label %for.cond4, !dbg !2024, !llvm.loop !2025

for.end:                                          ; preds = %for.cond4
  br label %for.inc26, !dbg !2027

for.inc26:                                        ; preds = %for.end
  %add27 = add i32 %j.0, %len.0, !dbg !2028
    #dbg_value(i32 %add27, !1979, !DIExpression(), !1968)
  br label %for.cond1, !dbg !2029, !llvm.loop !2030

for.end28:                                        ; preds = %for.cond1
  br label %for.inc29, !dbg !2032

for.inc29:                                        ; preds = %for.end28
  %shl = shl i32 %len.0, 1, !dbg !2033
    #dbg_value(i32 %shl, !1971, !DIExpression(), !1968)
  br label %for.cond, !dbg !2034, !llvm.loop !2035

for.end30:                                        ; preds = %for.cond
    #dbg_value(i32 0, !1991, !DIExpression(), !1968)
  br label %for.cond31, !dbg !2037

for.cond31:                                       ; preds = %for.inc38, %for.end30
  %j.1 = phi i32 [ 0, %for.end30 ], [ %inc39, %for.inc38 ], !dbg !2039
    #dbg_value(i32 %j.1, !1991, !DIExpression(), !1968)
  %cmp32 = icmp ult i32 %j.1, 256, !dbg !2040
  br i1 %cmp32, label %for.body34, label %for.end40, !dbg !2042

for.body34:                                       ; preds = %for.cond31
  %arrayidx35 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !2043
  %5 = load i16, ptr %arrayidx35, align 2, !dbg !2043
  %call36 = call signext i16 @fqmul(i16 noundef signext %5, i16 noundef signext 1441) #2, !dbg !2044
  %arrayidx37 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !2045
  store i16 %call36, ptr %arrayidx37, align 2, !dbg !2046
  br label %for.inc38, !dbg !2045

for.inc38:                                        ; preds = %for.body34
  %inc39 = add i32 %j.1, 1, !dbg !2047
    #dbg_value(i32 %inc39, !1991, !DIExpression(), !1968)
  br label %for.cond31, !dbg !2048, !llvm.loop !2049

for.end40:                                        ; preds = %for.cond31
  ret void, !dbg !2051
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_basemul(ptr noundef %r, ptr noundef %a, ptr noundef %b, i16 noundef signext %zeta) #0 !dbg !2052 {
entry:
    #dbg_value(ptr %r, !2056, !DIExpression(), !2057)
    #dbg_value(ptr %a, !2058, !DIExpression(), !2057)
    #dbg_value(ptr %b, !2059, !DIExpression(), !2057)
    #dbg_value(i16 %zeta, !2060, !DIExpression(), !2057)
  %arrayidx = getelementptr inbounds i16, ptr %a, i32 1, !dbg !2061
  %0 = load i16, ptr %arrayidx, align 2, !dbg !2061
  %arrayidx1 = getelementptr inbounds i16, ptr %b, i32 1, !dbg !2062
  %1 = load i16, ptr %arrayidx1, align 2, !dbg !2062
  %call = call signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %1) #2, !dbg !2063
  %arrayidx2 = getelementptr inbounds i16, ptr %r, i32 0, !dbg !2064
  store i16 %call, ptr %arrayidx2, align 2, !dbg !2065
  %arrayidx3 = getelementptr inbounds i16, ptr %r, i32 0, !dbg !2066
  %2 = load i16, ptr %arrayidx3, align 2, !dbg !2066
  %call4 = call signext i16 @fqmul(i16 noundef signext %2, i16 noundef signext %zeta) #2, !dbg !2067
  %arrayidx5 = getelementptr inbounds i16, ptr %r, i32 0, !dbg !2068
  store i16 %call4, ptr %arrayidx5, align 2, !dbg !2069
  %arrayidx6 = getelementptr inbounds i16, ptr %a, i32 0, !dbg !2070
  %3 = load i16, ptr %arrayidx6, align 2, !dbg !2070
  %arrayidx7 = getelementptr inbounds i16, ptr %b, i32 0, !dbg !2071
  %4 = load i16, ptr %arrayidx7, align 2, !dbg !2071
  %call8 = call signext i16 @fqmul(i16 noundef signext %3, i16 noundef signext %4) #2, !dbg !2072
  %conv = sext i16 %call8 to i32, !dbg !2072
  %arrayidx9 = getelementptr inbounds i16, ptr %r, i32 0, !dbg !2073
  %5 = load i16, ptr %arrayidx9, align 2, !dbg !2074
  %conv10 = sext i16 %5 to i32, !dbg !2074
  %add = add nsw i32 %conv10, %conv, !dbg !2074
  %conv11 = trunc i32 %add to i16, !dbg !2074
  store i16 %conv11, ptr %arrayidx9, align 2, !dbg !2074
  %arrayidx12 = getelementptr inbounds i16, ptr %a, i32 0, !dbg !2075
  %6 = load i16, ptr %arrayidx12, align 2, !dbg !2075
  %arrayidx13 = getelementptr inbounds i16, ptr %b, i32 1, !dbg !2076
  %7 = load i16, ptr %arrayidx13, align 2, !dbg !2076
  %call14 = call signext i16 @fqmul(i16 noundef signext %6, i16 noundef signext %7) #2, !dbg !2077
  %arrayidx15 = getelementptr inbounds i16, ptr %r, i32 1, !dbg !2078
  store i16 %call14, ptr %arrayidx15, align 2, !dbg !2079
  %arrayidx16 = getelementptr inbounds i16, ptr %a, i32 1, !dbg !2080
  %8 = load i16, ptr %arrayidx16, align 2, !dbg !2080
  %arrayidx17 = getelementptr inbounds i16, ptr %b, i32 0, !dbg !2081
  %9 = load i16, ptr %arrayidx17, align 2, !dbg !2081
  %call18 = call signext i16 @fqmul(i16 noundef signext %8, i16 noundef signext %9) #2, !dbg !2082
  %conv19 = sext i16 %call18 to i32, !dbg !2082
  %arrayidx20 = getelementptr inbounds i16, ptr %r, i32 1, !dbg !2083
  %10 = load i16, ptr %arrayidx20, align 2, !dbg !2084
  %conv21 = sext i16 %10 to i32, !dbg !2084
  %add22 = add nsw i32 %conv21, %conv19, !dbg !2084
  %conv23 = trunc i32 %add22 to i16, !dbg !2084
  store i16 %conv23, ptr %arrayidx20, align 2, !dbg !2084
  ret void, !dbg !2085
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef %buf) #0 !dbg !2086 {
entry:
    #dbg_value(ptr %r, !2095, !DIExpression(), !2096)
    #dbg_value(ptr %buf, !2097, !DIExpression(), !2096)
  call void @cbd2(ptr noundef %r, ptr noundef %buf) #2, !dbg !2098
  ret void, !dbg !2099
}

; Function Attrs: noinline nounwind optnone
define internal void @cbd2(ptr noundef %r, ptr noundef %buf) #0 !dbg !2100 {
entry:
    #dbg_value(ptr %r, !2101, !DIExpression(), !2102)
    #dbg_value(ptr %buf, !2103, !DIExpression(), !2102)
    #dbg_value(i32 0, !2104, !DIExpression(), !2102)
  br label %for.cond, !dbg !2105

for.cond:                                         ; preds = %for.inc19, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc20, %for.inc19 ], !dbg !2107
    #dbg_value(i32 %i.0, !2104, !DIExpression(), !2102)
  %cmp = icmp ult i32 %i.0, 32, !dbg !2108
  br i1 %cmp, label %for.body, label %for.end21, !dbg !2110

for.body:                                         ; preds = %for.cond
  %mul = mul i32 4, %i.0, !dbg !2111
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 %mul, !dbg !2113
  %call = call i32 @load32_littleendian(ptr noundef %add.ptr) #2, !dbg !2114
    #dbg_value(i32 %call, !2115, !DIExpression(), !2102)
  %and = and i32 %call, 1431655765, !dbg !2116
    #dbg_value(i32 %and, !2117, !DIExpression(), !2102)
  %shr = lshr i32 %call, 1, !dbg !2118
  %and1 = and i32 %shr, 1431655765, !dbg !2119
  %add = add i32 %and, %and1, !dbg !2120
    #dbg_value(i32 %add, !2117, !DIExpression(), !2102)
    #dbg_value(i32 0, !2121, !DIExpression(), !2102)
  br label %for.cond2, !dbg !2122

for.cond2:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ], !dbg !2124
    #dbg_value(i32 %j.0, !2121, !DIExpression(), !2102)
  %cmp3 = icmp ult i32 %j.0, 8, !dbg !2125
  br i1 %cmp3, label %for.body4, label %for.end, !dbg !2127

for.body4:                                        ; preds = %for.cond2
  %mul5 = mul i32 4, %j.0, !dbg !2128
  %add6 = add i32 %mul5, 0, !dbg !2130
  %shr7 = lshr i32 %add, %add6, !dbg !2131
  %and8 = and i32 %shr7, 3, !dbg !2132
  %conv = trunc i32 %and8 to i16, !dbg !2133
    #dbg_value(i16 %conv, !2134, !DIExpression(), !2102)
  %mul9 = mul i32 4, %j.0, !dbg !2135
  %add10 = add i32 %mul9, 2, !dbg !2136
  %shr11 = lshr i32 %add, %add10, !dbg !2137
  %and12 = and i32 %shr11, 3, !dbg !2138
  %conv13 = trunc i32 %and12 to i16, !dbg !2139
    #dbg_value(i16 %conv13, !2140, !DIExpression(), !2102)
  %conv14 = sext i16 %conv to i32, !dbg !2141
  %conv15 = sext i16 %conv13 to i32, !dbg !2142
  %sub = sub nsw i32 %conv14, %conv15, !dbg !2143
  %conv16 = trunc i32 %sub to i16, !dbg !2141
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !2144
  %mul17 = mul i32 8, %i.0, !dbg !2145
  %add18 = add i32 %mul17, %j.0, !dbg !2146
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %add18, !dbg !2147
  store i16 %conv16, ptr %arrayidx, align 2, !dbg !2148
  br label %for.inc, !dbg !2149

for.inc:                                          ; preds = %for.body4
  %inc = add i32 %j.0, 1, !dbg !2150
    #dbg_value(i32 %inc, !2121, !DIExpression(), !2102)
  br label %for.cond2, !dbg !2151, !llvm.loop !2152

for.end:                                          ; preds = %for.cond2
  br label %for.inc19, !dbg !2154

for.inc19:                                        ; preds = %for.end
  %inc20 = add i32 %i.0, 1, !dbg !2155
    #dbg_value(i32 %inc20, !2104, !DIExpression(), !2102)
  br label %for.cond, !dbg !2156, !llvm.loop !2157

for.end21:                                        ; preds = %for.cond
  ret void, !dbg !2159
}

; Function Attrs: noinline nounwind optnone
define internal i32 @load32_littleendian(ptr noundef %x) #0 !dbg !2160 {
entry:
    #dbg_value(ptr %x, !2163, !DIExpression(), !2164)
  %arrayidx = getelementptr inbounds i8, ptr %x, i32 0, !dbg !2165
  %0 = load i8, ptr %arrayidx, align 1, !dbg !2165
  %conv = zext i8 %0 to i32, !dbg !2166
    #dbg_value(i32 %conv, !2167, !DIExpression(), !2164)
  %arrayidx1 = getelementptr inbounds i8, ptr %x, i32 1, !dbg !2168
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !2168
  %conv2 = zext i8 %1 to i32, !dbg !2169
  %shl = shl i32 %conv2, 8, !dbg !2170
  %or = or i32 %conv, %shl, !dbg !2171
    #dbg_value(i32 %or, !2167, !DIExpression(), !2164)
  %arrayidx3 = getelementptr inbounds i8, ptr %x, i32 2, !dbg !2172
  %2 = load i8, ptr %arrayidx3, align 1, !dbg !2172
  %conv4 = zext i8 %2 to i32, !dbg !2173
  %shl5 = shl i32 %conv4, 16, !dbg !2174
  %or6 = or i32 %or, %shl5, !dbg !2175
    #dbg_value(i32 %or6, !2167, !DIExpression(), !2164)
  %arrayidx7 = getelementptr inbounds i8, ptr %x, i32 3, !dbg !2176
  %3 = load i8, ptr %arrayidx7, align 1, !dbg !2176
  %conv8 = zext i8 %3 to i32, !dbg !2177
  %shl9 = shl i32 %conv8, 24, !dbg !2178
  %or10 = or i32 %or6, %shl9, !dbg !2179
    #dbg_value(i32 %or10, !2167, !DIExpression(), !2164)
  ret i32 %or10, !dbg !2180
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_poly_cbd_eta2(ptr noundef %r, ptr noundef %buf) #0 !dbg !2181 {
entry:
    #dbg_value(ptr %r, !2182, !DIExpression(), !2183)
    #dbg_value(ptr %buf, !2184, !DIExpression(), !2183)
  call void @cbd2(ptr noundef %r, ptr noundef %buf) #2, !dbg !2185
  ret void, !dbg !2186
}

; Function Attrs: noinline nounwind optnone
define dso_local signext i16 @pqcrystals_kyber1024_ref_montgomery_reduce(i32 noundef %a) #0 !dbg !2187 {
entry:
    #dbg_value(i32 %a, !2190, !DIExpression(), !2191)
  %conv = trunc i32 %a to i16, !dbg !2192
  %conv1 = sext i16 %conv to i32, !dbg !2192
  %mul = mul nsw i32 %conv1, -3327, !dbg !2193
  %conv2 = trunc i32 %mul to i16, !dbg !2192
    #dbg_value(i16 %conv2, !2194, !DIExpression(), !2191)
  %conv3 = sext i16 %conv2 to i32, !dbg !2195
  %mul4 = mul nsw i32 %conv3, 3329, !dbg !2196
  %sub = sub nsw i32 %a, %mul4, !dbg !2197
  %shr = ashr i32 %sub, 16, !dbg !2198
  %conv5 = trunc i32 %shr to i16, !dbg !2199
    #dbg_value(i16 %conv5, !2194, !DIExpression(), !2191)
  ret i16 %conv5, !dbg !2200
}

; Function Attrs: noinline nounwind optnone
define dso_local signext i16 @pqcrystals_kyber1024_ref_barrett_reduce(i16 noundef signext %a) #0 !dbg !2201 {
entry:
    #dbg_value(i16 %a, !2204, !DIExpression(), !2205)
    #dbg_value(i16 20159, !2206, !DIExpression(), !2205)
  %conv = sext i16 %a to i32, !dbg !2207
  %mul = mul nsw i32 20159, %conv, !dbg !2208
  %add = add nsw i32 %mul, 33554432, !dbg !2209
  %shr = ashr i32 %add, 26, !dbg !2210
  %conv1 = trunc i32 %shr to i16, !dbg !2211
    #dbg_value(i16 %conv1, !2212, !DIExpression(), !2205)
  %conv2 = sext i16 %conv1 to i32, !dbg !2213
  %mul3 = mul nsw i32 %conv2, 3329, !dbg !2213
  %conv4 = trunc i32 %mul3 to i16, !dbg !2213
    #dbg_value(i16 %conv4, !2212, !DIExpression(), !2205)
  %conv5 = sext i16 %a to i32, !dbg !2214
  %conv6 = sext i16 %conv4 to i32, !dbg !2215
  %sub = sub nsw i32 %conv5, %conv6, !dbg !2216
  %conv7 = trunc i32 %sub to i16, !dbg !2214
  ret i16 %conv7, !dbg !2217
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @pqcrystals_kyber1024_ref_verify(ptr noundef %a, ptr noundef %b, i32 noundef %len) #0 !dbg !2218 {
entry:
    #dbg_value(ptr %a, !2222, !DIExpression(), !2223)
    #dbg_value(ptr %b, !2224, !DIExpression(), !2223)
    #dbg_value(i32 %len, !2225, !DIExpression(), !2223)
    #dbg_value(i8 0, !2226, !DIExpression(), !2223)
    #dbg_value(i32 0, !2227, !DIExpression(), !2223)
  br label %for.cond, !dbg !2228

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !2230
  %r.0 = phi i8 [ 0, %entry ], [ %conv4, %for.inc ], !dbg !2223
    #dbg_value(i8 %r.0, !2226, !DIExpression(), !2223)
    #dbg_value(i32 %i.0, !2227, !DIExpression(), !2223)
  %cmp = icmp ult i32 %i.0, %len, !dbg !2231
  br i1 %cmp, label %for.body, label %for.end, !dbg !2233

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %i.0, !dbg !2234
  %0 = load i8, ptr %arrayidx, align 1, !dbg !2234
  %conv = zext i8 %0 to i32, !dbg !2234
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 %i.0, !dbg !2235
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !2235
  %conv2 = zext i8 %1 to i32, !dbg !2235
  %xor = xor i32 %conv, %conv2, !dbg !2236
  %conv3 = zext i8 %r.0 to i32, !dbg !2237
  %or = or i32 %conv3, %xor, !dbg !2237
  %conv4 = trunc i32 %or to i8, !dbg !2237
    #dbg_value(i8 %conv4, !2226, !DIExpression(), !2223)
  br label %for.inc, !dbg !2238

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !2239
    #dbg_value(i32 %inc, !2227, !DIExpression(), !2223)
  br label %for.cond, !dbg !2240, !llvm.loop !2241

for.end:                                          ; preds = %for.cond
  %conv5 = zext i8 %r.0 to i64, !dbg !2243
  %sub = sub i64 0, %conv5, !dbg !2244
  %shr = lshr i64 %sub, 63, !dbg !2245
  %conv6 = trunc i64 %shr to i32, !dbg !2246
  ret i32 %conv6, !dbg !2247
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_cmov(ptr noundef %r, ptr noundef %x, i32 noundef %len, i8 noundef zeroext %b) #0 !dbg !2248 {
entry:
    #dbg_value(ptr %r, !2251, !DIExpression(), !2252)
    #dbg_value(ptr %x, !2253, !DIExpression(), !2252)
    #dbg_value(i32 %len, !2254, !DIExpression(), !2252)
    #dbg_value(i8 %b, !2255, !DIExpression(), !2252)
  %0 = call i8 asm "", "=r,0"(i8 %b) #3, !dbg !2256, !srcloc !2257
    #dbg_value(i8 %0, !2255, !DIExpression(), !2252)
  %conv = zext i8 %0 to i32, !dbg !2258
  %sub = sub nsw i32 0, %conv, !dbg !2259
  %conv1 = trunc i32 %sub to i8, !dbg !2259
    #dbg_value(i8 %conv1, !2255, !DIExpression(), !2252)
    #dbg_value(i32 0, !2260, !DIExpression(), !2252)
  br label %for.cond, !dbg !2261

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !2263
    #dbg_value(i32 %i.0, !2260, !DIExpression(), !2252)
  %cmp = icmp ult i32 %i.0, %len, !dbg !2264
  br i1 %cmp, label %for.body, label %for.end, !dbg !2266

for.body:                                         ; preds = %for.cond
  %conv3 = zext i8 %conv1 to i32, !dbg !2267
  %arrayidx = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !2268
  %1 = load i8, ptr %arrayidx, align 1, !dbg !2268
  %conv4 = zext i8 %1 to i32, !dbg !2268
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2269
  %2 = load i8, ptr %arrayidx5, align 1, !dbg !2269
  %conv6 = zext i8 %2 to i32, !dbg !2269
  %xor = xor i32 %conv4, %conv6, !dbg !2270
  %and = and i32 %conv3, %xor, !dbg !2271
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !2272
  %3 = load i8, ptr %arrayidx7, align 1, !dbg !2273
  %conv8 = zext i8 %3 to i32, !dbg !2273
  %xor9 = xor i32 %conv8, %and, !dbg !2273
  %conv10 = trunc i32 %xor9 to i8, !dbg !2273
  store i8 %conv10, ptr %arrayidx7, align 1, !dbg !2273
  br label %for.inc, !dbg !2272

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !2274
    #dbg_value(i32 %inc, !2260, !DIExpression(), !2252)
  br label %for.cond, !dbg !2275, !llvm.loop !2276

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2278
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_cmov_int16(ptr noundef %r, i16 noundef signext %v, i16 noundef zeroext %b) #0 !dbg !2279 {
entry:
    #dbg_value(ptr %r, !2282, !DIExpression(), !2283)
    #dbg_value(i16 %v, !2284, !DIExpression(), !2283)
    #dbg_value(i16 %b, !2285, !DIExpression(), !2283)
  %conv = zext i16 %b to i32, !dbg !2286
  %sub = sub nsw i32 0, %conv, !dbg !2287
  %conv1 = trunc i32 %sub to i16, !dbg !2287
    #dbg_value(i16 %conv1, !2285, !DIExpression(), !2283)
  %conv2 = zext i16 %conv1 to i32, !dbg !2288
  %0 = load i16, ptr %r, align 2, !dbg !2289
  %conv3 = sext i16 %0 to i32, !dbg !2290
  %conv4 = sext i16 %v to i32, !dbg !2291
  %xor = xor i32 %conv3, %conv4, !dbg !2292
  %and = and i32 %conv2, %xor, !dbg !2293
  %1 = load i16, ptr %r, align 2, !dbg !2294
  %conv5 = sext i16 %1 to i32, !dbg !2294
  %xor6 = xor i32 %conv5, %and, !dbg !2294
  %conv7 = trunc i32 %xor6 to i16, !dbg !2294
  store i16 %conv7, ptr %r, align 2, !dbg !2294
  ret void, !dbg !2295
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_init(ptr noundef %state) #0 !dbg !2296 {
entry:
    #dbg_value(ptr %state, !2305, !DIExpression(), !2306)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !2307
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2308
  call void @keccak_init(ptr noundef %arraydecay) #2, !dbg !2309
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2310
  store i32 0, ptr %pos, align 8, !dbg !2311
  ret void, !dbg !2312
}

; Function Attrs: noinline nounwind optnone
define internal void @keccak_init(ptr noundef %s) #0 !dbg !2313 {
entry:
    #dbg_value(ptr %s, !2317, !DIExpression(), !2318)
    #dbg_value(i32 0, !2319, !DIExpression(), !2318)
  br label %for.cond, !dbg !2320

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !2322
    #dbg_value(i32 %i.0, !2319, !DIExpression(), !2318)
  %cmp = icmp ult i32 %i.0, 25, !dbg !2323
  br i1 %cmp, label %for.body, label %for.end, !dbg !2325

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !2326
  store i64 0, ptr %arrayidx, align 8, !dbg !2327
  br label %for.inc, !dbg !2326

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !2328
    #dbg_value(i32 %inc, !2319, !DIExpression(), !2318)
  br label %for.cond, !dbg !2329, !llvm.loop !2330

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2332
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) #0 !dbg !2333 {
entry:
    #dbg_value(ptr %state, !2336, !DIExpression(), !2337)
    #dbg_value(ptr %in, !2338, !DIExpression(), !2337)
    #dbg_value(i32 %inlen, !2339, !DIExpression(), !2337)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !2340
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2341
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2342
  %0 = load i32, ptr %pos, align 8, !dbg !2342
  %call = call i32 @keccak_absorb(ptr noundef %arraydecay, i32 noundef %0, i32 noundef 168, ptr noundef %in, i32 noundef %inlen) #2, !dbg !2343
  %pos1 = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2344
  store i32 %call, ptr %pos1, align 8, !dbg !2345
  ret void, !dbg !2346
}

; Function Attrs: noinline nounwind optnone
define internal i32 @keccak_absorb(ptr noundef %s, i32 noundef %pos, i32 noundef %r, ptr noundef %in, i32 noundef %inlen) #0 !dbg !2347 {
entry:
    #dbg_value(ptr %s, !2350, !DIExpression(), !2351)
    #dbg_value(i32 %pos, !2352, !DIExpression(), !2351)
    #dbg_value(i32 %r, !2353, !DIExpression(), !2351)
    #dbg_value(ptr %in, !2354, !DIExpression(), !2351)
    #dbg_value(i32 %inlen, !2355, !DIExpression(), !2351)
  br label %while.cond, !dbg !2356

while.cond:                                       ; preds = %for.end, %entry
  %in.addr.0 = phi ptr [ %in, %entry ], [ %in.addr.1, %for.end ]
  %inlen.addr.0 = phi i32 [ %inlen, %entry ], [ %sub2, %for.end ]
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ 0, %for.end ]
    #dbg_value(i32 %pos.addr.0, !2352, !DIExpression(), !2351)
    #dbg_value(i32 %inlen.addr.0, !2355, !DIExpression(), !2351)
    #dbg_value(ptr %in.addr.0, !2354, !DIExpression(), !2351)
  %add = add i32 %pos.addr.0, %inlen.addr.0, !dbg !2357
  %cmp = icmp uge i32 %add, %r, !dbg !2358
  br i1 %cmp, label %while.body, label %while.end, !dbg !2356

while.body:                                       ; preds = %while.cond
    #dbg_value(i32 %pos.addr.0, !2359, !DIExpression(), !2351)
  br label %for.cond, !dbg !2360

for.cond:                                         ; preds = %for.inc, %while.body
  %in.addr.1 = phi ptr [ %in.addr.0, %while.body ], [ %incdec.ptr, %for.inc ]
  %i.0 = phi i32 [ %pos.addr.0, %while.body ], [ %inc, %for.inc ], !dbg !2363
    #dbg_value(i32 %i.0, !2359, !DIExpression(), !2351)
    #dbg_value(ptr %in.addr.1, !2354, !DIExpression(), !2351)
  %cmp1 = icmp ult i32 %i.0, %r, !dbg !2364
  br i1 %cmp1, label %for.body, label %for.end, !dbg !2366

for.body:                                         ; preds = %for.cond
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %in.addr.1, i32 1, !dbg !2367
    #dbg_value(ptr %incdec.ptr, !2354, !DIExpression(), !2351)
  %0 = load i8, ptr %in.addr.1, align 1, !dbg !2368
  %conv = zext i8 %0 to i64, !dbg !2369
  %rem = urem i32 %i.0, 8, !dbg !2370
  %mul = mul i32 8, %rem, !dbg !2371
  %sh_prom = zext i32 %mul to i64, !dbg !2372
  %shl = shl i64 %conv, %sh_prom, !dbg !2372
  %div = udiv i32 %i.0, 8, !dbg !2373
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div, !dbg !2374
  %1 = load i64, ptr %arrayidx, align 8, !dbg !2375
  %xor = xor i64 %1, %shl, !dbg !2375
  store i64 %xor, ptr %arrayidx, align 8, !dbg !2375
  br label %for.inc, !dbg !2374

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !2376
    #dbg_value(i32 %inc, !2359, !DIExpression(), !2351)
  br label %for.cond, !dbg !2377, !llvm.loop !2378

for.end:                                          ; preds = %for.cond
  %sub = sub i32 %r, %pos.addr.0, !dbg !2380
  %sub2 = sub i32 %inlen.addr.0, %sub, !dbg !2381
    #dbg_value(i32 %sub2, !2355, !DIExpression(), !2351)
  call void @KeccakF1600_StatePermute(ptr noundef %s) #2, !dbg !2382
    #dbg_value(i32 0, !2352, !DIExpression(), !2351)
  br label %while.cond, !dbg !2356, !llvm.loop !2383

while.end:                                        ; preds = %while.cond
    #dbg_value(i32 %pos.addr.0, !2359, !DIExpression(), !2351)
  br label %for.cond3, !dbg !2385

for.cond3:                                        ; preds = %for.inc17, %while.end
  %in.addr.2 = phi ptr [ %in.addr.0, %while.end ], [ %incdec.ptr8, %for.inc17 ]
  %i.1 = phi i32 [ %pos.addr.0, %while.end ], [ %inc18, %for.inc17 ], !dbg !2387
    #dbg_value(i32 %i.1, !2359, !DIExpression(), !2351)
    #dbg_value(ptr %in.addr.2, !2354, !DIExpression(), !2351)
  %add4 = add i32 %pos.addr.0, %inlen.addr.0, !dbg !2388
  %cmp5 = icmp ult i32 %i.1, %add4, !dbg !2390
  br i1 %cmp5, label %for.body7, label %for.end19, !dbg !2391

for.body7:                                        ; preds = %for.cond3
  %incdec.ptr8 = getelementptr inbounds nuw i8, ptr %in.addr.2, i32 1, !dbg !2392
    #dbg_value(ptr %incdec.ptr8, !2354, !DIExpression(), !2351)
  %2 = load i8, ptr %in.addr.2, align 1, !dbg !2393
  %conv9 = zext i8 %2 to i64, !dbg !2394
  %rem10 = urem i32 %i.1, 8, !dbg !2395
  %mul11 = mul i32 8, %rem10, !dbg !2396
  %sh_prom12 = zext i32 %mul11 to i64, !dbg !2397
  %shl13 = shl i64 %conv9, %sh_prom12, !dbg !2397
  %div14 = udiv i32 %i.1, 8, !dbg !2398
  %arrayidx15 = getelementptr inbounds nuw i64, ptr %s, i32 %div14, !dbg !2399
  %3 = load i64, ptr %arrayidx15, align 8, !dbg !2400
  %xor16 = xor i64 %3, %shl13, !dbg !2400
  store i64 %xor16, ptr %arrayidx15, align 8, !dbg !2400
  br label %for.inc17, !dbg !2399

for.inc17:                                        ; preds = %for.body7
  %inc18 = add i32 %i.1, 1, !dbg !2401
    #dbg_value(i32 %inc18, !2359, !DIExpression(), !2351)
  br label %for.cond3, !dbg !2402, !llvm.loop !2403

for.end19:                                        ; preds = %for.cond3
  ret i32 %i.1, !dbg !2405
}

; Function Attrs: noinline nounwind optnone
define internal void @KeccakF1600_StatePermute(ptr noundef %state) #0 !dbg !2406 {
entry:
    #dbg_value(ptr %state, !2407, !DIExpression(), !2408)
  %arrayidx = getelementptr inbounds i64, ptr %state, i32 0, !dbg !2409
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2409
    #dbg_value(i64 %0, !2410, !DIExpression(), !2408)
  %arrayidx1 = getelementptr inbounds i64, ptr %state, i32 1, !dbg !2411
  %1 = load i64, ptr %arrayidx1, align 8, !dbg !2411
    #dbg_value(i64 %1, !2412, !DIExpression(), !2408)
  %arrayidx2 = getelementptr inbounds i64, ptr %state, i32 2, !dbg !2413
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !2413
    #dbg_value(i64 %2, !2414, !DIExpression(), !2408)
  %arrayidx3 = getelementptr inbounds i64, ptr %state, i32 3, !dbg !2415
  %3 = load i64, ptr %arrayidx3, align 8, !dbg !2415
    #dbg_value(i64 %3, !2416, !DIExpression(), !2408)
  %arrayidx4 = getelementptr inbounds i64, ptr %state, i32 4, !dbg !2417
  %4 = load i64, ptr %arrayidx4, align 8, !dbg !2417
    #dbg_value(i64 %4, !2418, !DIExpression(), !2408)
  %arrayidx5 = getelementptr inbounds i64, ptr %state, i32 5, !dbg !2419
  %5 = load i64, ptr %arrayidx5, align 8, !dbg !2419
    #dbg_value(i64 %5, !2420, !DIExpression(), !2408)
  %arrayidx6 = getelementptr inbounds i64, ptr %state, i32 6, !dbg !2421
  %6 = load i64, ptr %arrayidx6, align 8, !dbg !2421
    #dbg_value(i64 %6, !2422, !DIExpression(), !2408)
  %arrayidx7 = getelementptr inbounds i64, ptr %state, i32 7, !dbg !2423
  %7 = load i64, ptr %arrayidx7, align 8, !dbg !2423
    #dbg_value(i64 %7, !2424, !DIExpression(), !2408)
  %arrayidx8 = getelementptr inbounds i64, ptr %state, i32 8, !dbg !2425
  %8 = load i64, ptr %arrayidx8, align 8, !dbg !2425
    #dbg_value(i64 %8, !2426, !DIExpression(), !2408)
  %arrayidx9 = getelementptr inbounds i64, ptr %state, i32 9, !dbg !2427
  %9 = load i64, ptr %arrayidx9, align 8, !dbg !2427
    #dbg_value(i64 %9, !2428, !DIExpression(), !2408)
  %arrayidx10 = getelementptr inbounds i64, ptr %state, i32 10, !dbg !2429
  %10 = load i64, ptr %arrayidx10, align 8, !dbg !2429
    #dbg_value(i64 %10, !2430, !DIExpression(), !2408)
  %arrayidx11 = getelementptr inbounds i64, ptr %state, i32 11, !dbg !2431
  %11 = load i64, ptr %arrayidx11, align 8, !dbg !2431
    #dbg_value(i64 %11, !2432, !DIExpression(), !2408)
  %arrayidx12 = getelementptr inbounds i64, ptr %state, i32 12, !dbg !2433
  %12 = load i64, ptr %arrayidx12, align 8, !dbg !2433
    #dbg_value(i64 %12, !2434, !DIExpression(), !2408)
  %arrayidx13 = getelementptr inbounds i64, ptr %state, i32 13, !dbg !2435
  %13 = load i64, ptr %arrayidx13, align 8, !dbg !2435
    #dbg_value(i64 %13, !2436, !DIExpression(), !2408)
  %arrayidx14 = getelementptr inbounds i64, ptr %state, i32 14, !dbg !2437
  %14 = load i64, ptr %arrayidx14, align 8, !dbg !2437
    #dbg_value(i64 %14, !2438, !DIExpression(), !2408)
  %arrayidx15 = getelementptr inbounds i64, ptr %state, i32 15, !dbg !2439
  %15 = load i64, ptr %arrayidx15, align 8, !dbg !2439
    #dbg_value(i64 %15, !2440, !DIExpression(), !2408)
  %arrayidx16 = getelementptr inbounds i64, ptr %state, i32 16, !dbg !2441
  %16 = load i64, ptr %arrayidx16, align 8, !dbg !2441
    #dbg_value(i64 %16, !2442, !DIExpression(), !2408)
  %arrayidx17 = getelementptr inbounds i64, ptr %state, i32 17, !dbg !2443
  %17 = load i64, ptr %arrayidx17, align 8, !dbg !2443
    #dbg_value(i64 %17, !2444, !DIExpression(), !2408)
  %arrayidx18 = getelementptr inbounds i64, ptr %state, i32 18, !dbg !2445
  %18 = load i64, ptr %arrayidx18, align 8, !dbg !2445
    #dbg_value(i64 %18, !2446, !DIExpression(), !2408)
  %arrayidx19 = getelementptr inbounds i64, ptr %state, i32 19, !dbg !2447
  %19 = load i64, ptr %arrayidx19, align 8, !dbg !2447
    #dbg_value(i64 %19, !2448, !DIExpression(), !2408)
  %arrayidx20 = getelementptr inbounds i64, ptr %state, i32 20, !dbg !2449
  %20 = load i64, ptr %arrayidx20, align 8, !dbg !2449
    #dbg_value(i64 %20, !2450, !DIExpression(), !2408)
  %arrayidx21 = getelementptr inbounds i64, ptr %state, i32 21, !dbg !2451
  %21 = load i64, ptr %arrayidx21, align 8, !dbg !2451
    #dbg_value(i64 %21, !2452, !DIExpression(), !2408)
  %arrayidx22 = getelementptr inbounds i64, ptr %state, i32 22, !dbg !2453
  %22 = load i64, ptr %arrayidx22, align 8, !dbg !2453
    #dbg_value(i64 %22, !2454, !DIExpression(), !2408)
  %arrayidx23 = getelementptr inbounds i64, ptr %state, i32 23, !dbg !2455
  %23 = load i64, ptr %arrayidx23, align 8, !dbg !2455
    #dbg_value(i64 %23, !2456, !DIExpression(), !2408)
  %arrayidx24 = getelementptr inbounds i64, ptr %state, i32 24, !dbg !2457
  %24 = load i64, ptr %arrayidx24, align 8, !dbg !2457
    #dbg_value(i64 %24, !2458, !DIExpression(), !2408)
    #dbg_value(i32 0, !2459, !DIExpression(), !2408)
  br label %for.cond, !dbg !2460

for.cond:                                         ; preds = %for.inc, %entry
  %Aso.0 = phi i64 [ %23, %entry ], [ %xor444, %for.inc ], !dbg !2408
  %Asi.0 = phi i64 [ %22, %entry ], [ %xor441, %for.inc ], !dbg !2408
  %Ase.0 = phi i64 [ %21, %entry ], [ %xor438, %for.inc ], !dbg !2408
  %Asa.0 = phi i64 [ %20, %entry ], [ %xor435, %for.inc ], !dbg !2408
  %Amu.0 = phi i64 [ %19, %entry ], [ %xor412, %for.inc ], !dbg !2408
  %Amo.0 = phi i64 [ %18, %entry ], [ %xor409, %for.inc ], !dbg !2408
  %Ami.0 = phi i64 [ %17, %entry ], [ %xor406, %for.inc ], !dbg !2408
  %Ame.0 = phi i64 [ %16, %entry ], [ %xor403, %for.inc ], !dbg !2408
  %Ama.0 = phi i64 [ %15, %entry ], [ %xor400, %for.inc ], !dbg !2408
  %Aku.0 = phi i64 [ %14, %entry ], [ %xor377, %for.inc ], !dbg !2408
  %Ako.0 = phi i64 [ %13, %entry ], [ %xor374, %for.inc ], !dbg !2408
  %Aki.0 = phi i64 [ %12, %entry ], [ %xor371, %for.inc ], !dbg !2408
  %Ake.0 = phi i64 [ %11, %entry ], [ %xor368, %for.inc ], !dbg !2408
  %Aka.0 = phi i64 [ %10, %entry ], [ %xor365, %for.inc ], !dbg !2408
  %Agu.0 = phi i64 [ %9, %entry ], [ %xor342, %for.inc ], !dbg !2408
  %Ago.0 = phi i64 [ %8, %entry ], [ %xor339, %for.inc ], !dbg !2408
  %Agi.0 = phi i64 [ %7, %entry ], [ %xor336, %for.inc ], !dbg !2408
  %Age.0 = phi i64 [ %6, %entry ], [ %xor333, %for.inc ], !dbg !2408
  %Aga.0 = phi i64 [ %5, %entry ], [ %xor330, %for.inc ], !dbg !2408
  %Abu.0 = phi i64 [ %4, %entry ], [ %xor307, %for.inc ], !dbg !2408
  %Abo.0 = phi i64 [ %3, %entry ], [ %xor304, %for.inc ], !dbg !2408
  %Abi.0 = phi i64 [ %2, %entry ], [ %xor301, %for.inc ], !dbg !2408
  %Abe.0 = phi i64 [ %1, %entry ], [ %xor298, %for.inc ], !dbg !2408
  %Aba.0 = phi i64 [ %0, %entry ], [ %xor295, %for.inc ], !dbg !2408
  %round.0 = phi i32 [ 0, %entry ], [ %add448, %for.inc ], !dbg !2462
  %Asu.0 = phi i64 [ %24, %entry ], [ %xor447, %for.inc ], !dbg !2408
    #dbg_value(i64 %Asu.0, !2458, !DIExpression(), !2408)
    #dbg_value(i32 %round.0, !2459, !DIExpression(), !2408)
    #dbg_value(i64 %Aba.0, !2410, !DIExpression(), !2408)
    #dbg_value(i64 %Abe.0, !2412, !DIExpression(), !2408)
    #dbg_value(i64 %Abi.0, !2414, !DIExpression(), !2408)
    #dbg_value(i64 %Abo.0, !2416, !DIExpression(), !2408)
    #dbg_value(i64 %Abu.0, !2418, !DIExpression(), !2408)
    #dbg_value(i64 %Aga.0, !2420, !DIExpression(), !2408)
    #dbg_value(i64 %Age.0, !2422, !DIExpression(), !2408)
    #dbg_value(i64 %Agi.0, !2424, !DIExpression(), !2408)
    #dbg_value(i64 %Ago.0, !2426, !DIExpression(), !2408)
    #dbg_value(i64 %Agu.0, !2428, !DIExpression(), !2408)
    #dbg_value(i64 %Aka.0, !2430, !DIExpression(), !2408)
    #dbg_value(i64 %Ake.0, !2432, !DIExpression(), !2408)
    #dbg_value(i64 %Aki.0, !2434, !DIExpression(), !2408)
    #dbg_value(i64 %Ako.0, !2436, !DIExpression(), !2408)
    #dbg_value(i64 %Aku.0, !2438, !DIExpression(), !2408)
    #dbg_value(i64 %Ama.0, !2440, !DIExpression(), !2408)
    #dbg_value(i64 %Ame.0, !2442, !DIExpression(), !2408)
    #dbg_value(i64 %Ami.0, !2444, !DIExpression(), !2408)
    #dbg_value(i64 %Amo.0, !2446, !DIExpression(), !2408)
    #dbg_value(i64 %Amu.0, !2448, !DIExpression(), !2408)
    #dbg_value(i64 %Asa.0, !2450, !DIExpression(), !2408)
    #dbg_value(i64 %Ase.0, !2452, !DIExpression(), !2408)
    #dbg_value(i64 %Asi.0, !2454, !DIExpression(), !2408)
    #dbg_value(i64 %Aso.0, !2456, !DIExpression(), !2408)
  %cmp = icmp slt i32 %round.0, 24, !dbg !2463
  br i1 %cmp, label %for.body, label %for.end, !dbg !2465

for.body:                                         ; preds = %for.cond
  %xor = xor i64 %Aba.0, %Aga.0, !dbg !2466
  %xor25 = xor i64 %xor, %Aka.0, !dbg !2468
  %xor26 = xor i64 %xor25, %Ama.0, !dbg !2469
  %xor27 = xor i64 %xor26, %Asa.0, !dbg !2470
    #dbg_value(i64 %xor27, !2471, !DIExpression(), !2408)
  %xor28 = xor i64 %Abe.0, %Age.0, !dbg !2472
  %xor29 = xor i64 %xor28, %Ake.0, !dbg !2473
  %xor30 = xor i64 %xor29, %Ame.0, !dbg !2474
  %xor31 = xor i64 %xor30, %Ase.0, !dbg !2475
    #dbg_value(i64 %xor31, !2476, !DIExpression(), !2408)
  %xor32 = xor i64 %Abi.0, %Agi.0, !dbg !2477
  %xor33 = xor i64 %xor32, %Aki.0, !dbg !2478
  %xor34 = xor i64 %xor33, %Ami.0, !dbg !2479
  %xor35 = xor i64 %xor34, %Asi.0, !dbg !2480
    #dbg_value(i64 %xor35, !2481, !DIExpression(), !2408)
  %xor36 = xor i64 %Abo.0, %Ago.0, !dbg !2482
  %xor37 = xor i64 %xor36, %Ako.0, !dbg !2483
  %xor38 = xor i64 %xor37, %Amo.0, !dbg !2484
  %xor39 = xor i64 %xor38, %Aso.0, !dbg !2485
    #dbg_value(i64 %xor39, !2486, !DIExpression(), !2408)
  %xor40 = xor i64 %Abu.0, %Agu.0, !dbg !2487
  %xor41 = xor i64 %xor40, %Aku.0, !dbg !2488
  %xor42 = xor i64 %xor41, %Amu.0, !dbg !2489
  %xor43 = xor i64 %xor42, %Asu.0, !dbg !2490
    #dbg_value(i64 %xor43, !2491, !DIExpression(), !2408)
  %shl = shl i64 %xor31, 1, !dbg !2492
  %shr = lshr i64 %xor31, 63, !dbg !2492
  %xor44 = xor i64 %shl, %shr, !dbg !2492
  %xor45 = xor i64 %xor43, %xor44, !dbg !2493
    #dbg_value(i64 %xor45, !2494, !DIExpression(), !2408)
  %shl46 = shl i64 %xor35, 1, !dbg !2495
  %shr47 = lshr i64 %xor35, 63, !dbg !2495
  %xor48 = xor i64 %shl46, %shr47, !dbg !2495
  %xor49 = xor i64 %xor27, %xor48, !dbg !2496
    #dbg_value(i64 %xor49, !2497, !DIExpression(), !2408)
  %shl50 = shl i64 %xor39, 1, !dbg !2498
  %shr51 = lshr i64 %xor39, 63, !dbg !2498
  %xor52 = xor i64 %shl50, %shr51, !dbg !2498
  %xor53 = xor i64 %xor31, %xor52, !dbg !2499
    #dbg_value(i64 %xor53, !2500, !DIExpression(), !2408)
  %shl54 = shl i64 %xor43, 1, !dbg !2501
  %shr55 = lshr i64 %xor43, 63, !dbg !2501
  %xor56 = xor i64 %shl54, %shr55, !dbg !2501
  %xor57 = xor i64 %xor35, %xor56, !dbg !2502
    #dbg_value(i64 %xor57, !2503, !DIExpression(), !2408)
  %shl58 = shl i64 %xor27, 1, !dbg !2504
  %shr59 = lshr i64 %xor27, 63, !dbg !2504
  %xor60 = xor i64 %shl58, %shr59, !dbg !2504
  %xor61 = xor i64 %xor39, %xor60, !dbg !2505
    #dbg_value(i64 %xor61, !2506, !DIExpression(), !2408)
  %xor62 = xor i64 %Aba.0, %xor45, !dbg !2507
    #dbg_value(i64 %xor62, !2410, !DIExpression(), !2408)
    #dbg_value(i64 %xor62, !2471, !DIExpression(), !2408)
  %xor63 = xor i64 %Age.0, %xor49, !dbg !2508
    #dbg_value(i64 %xor63, !2422, !DIExpression(), !2408)
  %shl64 = shl i64 %xor63, 44, !dbg !2509
  %shr65 = lshr i64 %xor63, 20, !dbg !2509
  %xor66 = xor i64 %shl64, %shr65, !dbg !2509
    #dbg_value(i64 %xor66, !2476, !DIExpression(), !2408)
  %xor67 = xor i64 %Aki.0, %xor53, !dbg !2510
    #dbg_value(i64 %xor67, !2434, !DIExpression(), !2408)
  %shl68 = shl i64 %xor67, 43, !dbg !2511
  %shr69 = lshr i64 %xor67, 21, !dbg !2511
  %xor70 = xor i64 %shl68, %shr69, !dbg !2511
    #dbg_value(i64 %xor70, !2481, !DIExpression(), !2408)
  %xor71 = xor i64 %Amo.0, %xor57, !dbg !2512
    #dbg_value(i64 %xor71, !2446, !DIExpression(), !2408)
  %shl72 = shl i64 %xor71, 21, !dbg !2513
  %shr73 = lshr i64 %xor71, 43, !dbg !2513
  %xor74 = xor i64 %shl72, %shr73, !dbg !2513
    #dbg_value(i64 %xor74, !2486, !DIExpression(), !2408)
  %xor75 = xor i64 %Asu.0, %xor61, !dbg !2514
    #dbg_value(i64 %xor75, !2458, !DIExpression(), !2408)
  %shl76 = shl i64 %xor75, 14, !dbg !2515
  %shr77 = lshr i64 %xor75, 50, !dbg !2515
  %xor78 = xor i64 %shl76, %shr77, !dbg !2515
    #dbg_value(i64 %xor78, !2491, !DIExpression(), !2408)
  %not = xor i64 %xor66, -1, !dbg !2516
  %and = and i64 %not, %xor70, !dbg !2517
  %xor79 = xor i64 %xor62, %and, !dbg !2518
    #dbg_value(i64 %xor79, !2519, !DIExpression(), !2408)
  %arrayidx80 = getelementptr inbounds [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %round.0, !dbg !2520
  %25 = load i64, ptr %arrayidx80, align 8, !dbg !2520
  %xor81 = xor i64 %xor79, %25, !dbg !2521
    #dbg_value(i64 %xor81, !2519, !DIExpression(), !2408)
  %not82 = xor i64 %xor70, -1, !dbg !2522
  %and83 = and i64 %not82, %xor74, !dbg !2523
  %xor84 = xor i64 %xor66, %and83, !dbg !2524
    #dbg_value(i64 %xor84, !2525, !DIExpression(), !2408)
  %not85 = xor i64 %xor74, -1, !dbg !2526
  %and86 = and i64 %not85, %xor78, !dbg !2527
  %xor87 = xor i64 %xor70, %and86, !dbg !2528
    #dbg_value(i64 %xor87, !2529, !DIExpression(), !2408)
  %not88 = xor i64 %xor78, -1, !dbg !2530
  %and89 = and i64 %not88, %xor62, !dbg !2531
  %xor90 = xor i64 %xor74, %and89, !dbg !2532
    #dbg_value(i64 %xor90, !2533, !DIExpression(), !2408)
  %not91 = xor i64 %xor62, -1, !dbg !2534
  %and92 = and i64 %not91, %xor66, !dbg !2535
  %xor93 = xor i64 %xor78, %and92, !dbg !2536
    #dbg_value(i64 %xor93, !2537, !DIExpression(), !2408)
  %xor94 = xor i64 %Abo.0, %xor57, !dbg !2538
    #dbg_value(i64 %xor94, !2416, !DIExpression(), !2408)
  %shl95 = shl i64 %xor94, 28, !dbg !2539
  %shr96 = lshr i64 %xor94, 36, !dbg !2539
  %xor97 = xor i64 %shl95, %shr96, !dbg !2539
    #dbg_value(i64 %xor97, !2471, !DIExpression(), !2408)
  %xor98 = xor i64 %Agu.0, %xor61, !dbg !2540
    #dbg_value(i64 %xor98, !2428, !DIExpression(), !2408)
  %shl99 = shl i64 %xor98, 20, !dbg !2541
  %shr100 = lshr i64 %xor98, 44, !dbg !2541
  %xor101 = xor i64 %shl99, %shr100, !dbg !2541
    #dbg_value(i64 %xor101, !2476, !DIExpression(), !2408)
  %xor102 = xor i64 %Aka.0, %xor45, !dbg !2542
    #dbg_value(i64 %xor102, !2430, !DIExpression(), !2408)
  %shl103 = shl i64 %xor102, 3, !dbg !2543
  %shr104 = lshr i64 %xor102, 61, !dbg !2543
  %xor105 = xor i64 %shl103, %shr104, !dbg !2543
    #dbg_value(i64 %xor105, !2481, !DIExpression(), !2408)
  %xor106 = xor i64 %Ame.0, %xor49, !dbg !2544
    #dbg_value(i64 %xor106, !2442, !DIExpression(), !2408)
  %shl107 = shl i64 %xor106, 45, !dbg !2545
  %shr108 = lshr i64 %xor106, 19, !dbg !2545
  %xor109 = xor i64 %shl107, %shr108, !dbg !2545
    #dbg_value(i64 %xor109, !2486, !DIExpression(), !2408)
  %xor110 = xor i64 %Asi.0, %xor53, !dbg !2546
    #dbg_value(i64 %xor110, !2454, !DIExpression(), !2408)
  %shl111 = shl i64 %xor110, 61, !dbg !2547
  %shr112 = lshr i64 %xor110, 3, !dbg !2547
  %xor113 = xor i64 %shl111, %shr112, !dbg !2547
    #dbg_value(i64 %xor113, !2491, !DIExpression(), !2408)
  %not114 = xor i64 %xor101, -1, !dbg !2548
  %and115 = and i64 %not114, %xor105, !dbg !2549
  %xor116 = xor i64 %xor97, %and115, !dbg !2550
    #dbg_value(i64 %xor116, !2551, !DIExpression(), !2408)
  %not117 = xor i64 %xor105, -1, !dbg !2552
  %and118 = and i64 %not117, %xor109, !dbg !2553
  %xor119 = xor i64 %xor101, %and118, !dbg !2554
    #dbg_value(i64 %xor119, !2555, !DIExpression(), !2408)
  %not120 = xor i64 %xor109, -1, !dbg !2556
  %and121 = and i64 %not120, %xor113, !dbg !2557
  %xor122 = xor i64 %xor105, %and121, !dbg !2558
    #dbg_value(i64 %xor122, !2559, !DIExpression(), !2408)
  %not123 = xor i64 %xor113, -1, !dbg !2560
  %and124 = and i64 %not123, %xor97, !dbg !2561
  %xor125 = xor i64 %xor109, %and124, !dbg !2562
    #dbg_value(i64 %xor125, !2563, !DIExpression(), !2408)
  %not126 = xor i64 %xor97, -1, !dbg !2564
  %and127 = and i64 %not126, %xor101, !dbg !2565
  %xor128 = xor i64 %xor113, %and127, !dbg !2566
    #dbg_value(i64 %xor128, !2567, !DIExpression(), !2408)
  %xor129 = xor i64 %Abe.0, %xor49, !dbg !2568
    #dbg_value(i64 %xor129, !2412, !DIExpression(), !2408)
  %shl130 = shl i64 %xor129, 1, !dbg !2569
  %shr131 = lshr i64 %xor129, 63, !dbg !2569
  %xor132 = xor i64 %shl130, %shr131, !dbg !2569
    #dbg_value(i64 %xor132, !2471, !DIExpression(), !2408)
  %xor133 = xor i64 %Agi.0, %xor53, !dbg !2570
    #dbg_value(i64 %xor133, !2424, !DIExpression(), !2408)
  %shl134 = shl i64 %xor133, 6, !dbg !2571
  %shr135 = lshr i64 %xor133, 58, !dbg !2571
  %xor136 = xor i64 %shl134, %shr135, !dbg !2571
    #dbg_value(i64 %xor136, !2476, !DIExpression(), !2408)
  %xor137 = xor i64 %Ako.0, %xor57, !dbg !2572
    #dbg_value(i64 %xor137, !2436, !DIExpression(), !2408)
  %shl138 = shl i64 %xor137, 25, !dbg !2573
  %shr139 = lshr i64 %xor137, 39, !dbg !2573
  %xor140 = xor i64 %shl138, %shr139, !dbg !2573
    #dbg_value(i64 %xor140, !2481, !DIExpression(), !2408)
  %xor141 = xor i64 %Amu.0, %xor61, !dbg !2574
    #dbg_value(i64 %xor141, !2448, !DIExpression(), !2408)
  %shl142 = shl i64 %xor141, 8, !dbg !2575
  %shr143 = lshr i64 %xor141, 56, !dbg !2575
  %xor144 = xor i64 %shl142, %shr143, !dbg !2575
    #dbg_value(i64 %xor144, !2486, !DIExpression(), !2408)
  %xor145 = xor i64 %Asa.0, %xor45, !dbg !2576
    #dbg_value(i64 %xor145, !2450, !DIExpression(), !2408)
  %shl146 = shl i64 %xor145, 18, !dbg !2577
  %shr147 = lshr i64 %xor145, 46, !dbg !2577
  %xor148 = xor i64 %shl146, %shr147, !dbg !2577
    #dbg_value(i64 %xor148, !2491, !DIExpression(), !2408)
  %not149 = xor i64 %xor136, -1, !dbg !2578
  %and150 = and i64 %not149, %xor140, !dbg !2579
  %xor151 = xor i64 %xor132, %and150, !dbg !2580
    #dbg_value(i64 %xor151, !2581, !DIExpression(), !2408)
  %not152 = xor i64 %xor140, -1, !dbg !2582
  %and153 = and i64 %not152, %xor144, !dbg !2583
  %xor154 = xor i64 %xor136, %and153, !dbg !2584
    #dbg_value(i64 %xor154, !2585, !DIExpression(), !2408)
  %not155 = xor i64 %xor144, -1, !dbg !2586
  %and156 = and i64 %not155, %xor148, !dbg !2587
  %xor157 = xor i64 %xor140, %and156, !dbg !2588
    #dbg_value(i64 %xor157, !2589, !DIExpression(), !2408)
  %not158 = xor i64 %xor148, -1, !dbg !2590
  %and159 = and i64 %not158, %xor132, !dbg !2591
  %xor160 = xor i64 %xor144, %and159, !dbg !2592
    #dbg_value(i64 %xor160, !2593, !DIExpression(), !2408)
  %not161 = xor i64 %xor132, -1, !dbg !2594
  %and162 = and i64 %not161, %xor136, !dbg !2595
  %xor163 = xor i64 %xor148, %and162, !dbg !2596
    #dbg_value(i64 %xor163, !2597, !DIExpression(), !2408)
  %xor164 = xor i64 %Abu.0, %xor61, !dbg !2598
    #dbg_value(i64 %xor164, !2418, !DIExpression(), !2408)
  %shl165 = shl i64 %xor164, 27, !dbg !2599
  %shr166 = lshr i64 %xor164, 37, !dbg !2599
  %xor167 = xor i64 %shl165, %shr166, !dbg !2599
    #dbg_value(i64 %xor167, !2471, !DIExpression(), !2408)
  %xor168 = xor i64 %Aga.0, %xor45, !dbg !2600
    #dbg_value(i64 %xor168, !2420, !DIExpression(), !2408)
  %shl169 = shl i64 %xor168, 36, !dbg !2601
  %shr170 = lshr i64 %xor168, 28, !dbg !2601
  %xor171 = xor i64 %shl169, %shr170, !dbg !2601
    #dbg_value(i64 %xor171, !2476, !DIExpression(), !2408)
  %xor172 = xor i64 %Ake.0, %xor49, !dbg !2602
    #dbg_value(i64 %xor172, !2432, !DIExpression(), !2408)
  %shl173 = shl i64 %xor172, 10, !dbg !2603
  %shr174 = lshr i64 %xor172, 54, !dbg !2603
  %xor175 = xor i64 %shl173, %shr174, !dbg !2603
    #dbg_value(i64 %xor175, !2481, !DIExpression(), !2408)
  %xor176 = xor i64 %Ami.0, %xor53, !dbg !2604
    #dbg_value(i64 %xor176, !2444, !DIExpression(), !2408)
  %shl177 = shl i64 %xor176, 15, !dbg !2605
  %shr178 = lshr i64 %xor176, 49, !dbg !2605
  %xor179 = xor i64 %shl177, %shr178, !dbg !2605
    #dbg_value(i64 %xor179, !2486, !DIExpression(), !2408)
  %xor180 = xor i64 %Aso.0, %xor57, !dbg !2606
    #dbg_value(i64 %xor180, !2456, !DIExpression(), !2408)
  %shl181 = shl i64 %xor180, 56, !dbg !2607
  %shr182 = lshr i64 %xor180, 8, !dbg !2607
  %xor183 = xor i64 %shl181, %shr182, !dbg !2607
    #dbg_value(i64 %xor183, !2491, !DIExpression(), !2408)
  %not184 = xor i64 %xor171, -1, !dbg !2608
  %and185 = and i64 %not184, %xor175, !dbg !2609
  %xor186 = xor i64 %xor167, %and185, !dbg !2610
    #dbg_value(i64 %xor186, !2611, !DIExpression(), !2408)
  %not187 = xor i64 %xor175, -1, !dbg !2612
  %and188 = and i64 %not187, %xor179, !dbg !2613
  %xor189 = xor i64 %xor171, %and188, !dbg !2614
    #dbg_value(i64 %xor189, !2615, !DIExpression(), !2408)
  %not190 = xor i64 %xor179, -1, !dbg !2616
  %and191 = and i64 %not190, %xor183, !dbg !2617
  %xor192 = xor i64 %xor175, %and191, !dbg !2618
    #dbg_value(i64 %xor192, !2619, !DIExpression(), !2408)
  %not193 = xor i64 %xor183, -1, !dbg !2620
  %and194 = and i64 %not193, %xor167, !dbg !2621
  %xor195 = xor i64 %xor179, %and194, !dbg !2622
    #dbg_value(i64 %xor195, !2623, !DIExpression(), !2408)
  %not196 = xor i64 %xor167, -1, !dbg !2624
  %and197 = and i64 %not196, %xor171, !dbg !2625
  %xor198 = xor i64 %xor183, %and197, !dbg !2626
    #dbg_value(i64 %xor198, !2627, !DIExpression(), !2408)
  %xor199 = xor i64 %Abi.0, %xor53, !dbg !2628
    #dbg_value(i64 %xor199, !2414, !DIExpression(), !2408)
  %shl200 = shl i64 %xor199, 62, !dbg !2629
  %shr201 = lshr i64 %xor199, 2, !dbg !2629
  %xor202 = xor i64 %shl200, %shr201, !dbg !2629
    #dbg_value(i64 %xor202, !2471, !DIExpression(), !2408)
  %xor203 = xor i64 %Ago.0, %xor57, !dbg !2630
    #dbg_value(i64 %xor203, !2426, !DIExpression(), !2408)
  %shl204 = shl i64 %xor203, 55, !dbg !2631
  %shr205 = lshr i64 %xor203, 9, !dbg !2631
  %xor206 = xor i64 %shl204, %shr205, !dbg !2631
    #dbg_value(i64 %xor206, !2476, !DIExpression(), !2408)
  %xor207 = xor i64 %Aku.0, %xor61, !dbg !2632
    #dbg_value(i64 %xor207, !2438, !DIExpression(), !2408)
  %shl208 = shl i64 %xor207, 39, !dbg !2633
  %shr209 = lshr i64 %xor207, 25, !dbg !2633
  %xor210 = xor i64 %shl208, %shr209, !dbg !2633
    #dbg_value(i64 %xor210, !2481, !DIExpression(), !2408)
  %xor211 = xor i64 %Ama.0, %xor45, !dbg !2634
    #dbg_value(i64 %xor211, !2440, !DIExpression(), !2408)
  %shl212 = shl i64 %xor211, 41, !dbg !2635
  %shr213 = lshr i64 %xor211, 23, !dbg !2635
  %xor214 = xor i64 %shl212, %shr213, !dbg !2635
    #dbg_value(i64 %xor214, !2486, !DIExpression(), !2408)
  %xor215 = xor i64 %Ase.0, %xor49, !dbg !2636
    #dbg_value(i64 %xor215, !2452, !DIExpression(), !2408)
  %shl216 = shl i64 %xor215, 2, !dbg !2637
  %shr217 = lshr i64 %xor215, 62, !dbg !2637
  %xor218 = xor i64 %shl216, %shr217, !dbg !2637
    #dbg_value(i64 %xor218, !2491, !DIExpression(), !2408)
  %not219 = xor i64 %xor206, -1, !dbg !2638
  %and220 = and i64 %not219, %xor210, !dbg !2639
  %xor221 = xor i64 %xor202, %and220, !dbg !2640
    #dbg_value(i64 %xor221, !2641, !DIExpression(), !2408)
  %not222 = xor i64 %xor210, -1, !dbg !2642
  %and223 = and i64 %not222, %xor214, !dbg !2643
  %xor224 = xor i64 %xor206, %and223, !dbg !2644
    #dbg_value(i64 %xor224, !2645, !DIExpression(), !2408)
  %not225 = xor i64 %xor214, -1, !dbg !2646
  %and226 = and i64 %not225, %xor218, !dbg !2647
  %xor227 = xor i64 %xor210, %and226, !dbg !2648
    #dbg_value(i64 %xor227, !2649, !DIExpression(), !2408)
  %not228 = xor i64 %xor218, -1, !dbg !2650
  %and229 = and i64 %not228, %xor202, !dbg !2651
  %xor230 = xor i64 %xor214, %and229, !dbg !2652
    #dbg_value(i64 %xor230, !2653, !DIExpression(), !2408)
  %not231 = xor i64 %xor202, -1, !dbg !2654
  %and232 = and i64 %not231, %xor206, !dbg !2655
  %xor233 = xor i64 %xor218, %and232, !dbg !2656
    #dbg_value(i64 %xor233, !2657, !DIExpression(), !2408)
  %xor234 = xor i64 %xor81, %xor116, !dbg !2658
  %xor235 = xor i64 %xor234, %xor151, !dbg !2659
  %xor236 = xor i64 %xor235, %xor186, !dbg !2660
  %xor237 = xor i64 %xor236, %xor221, !dbg !2661
    #dbg_value(i64 %xor237, !2471, !DIExpression(), !2408)
  %xor238 = xor i64 %xor84, %xor119, !dbg !2662
  %xor239 = xor i64 %xor238, %xor154, !dbg !2663
  %xor240 = xor i64 %xor239, %xor189, !dbg !2664
  %xor241 = xor i64 %xor240, %xor224, !dbg !2665
    #dbg_value(i64 %xor241, !2476, !DIExpression(), !2408)
  %xor242 = xor i64 %xor87, %xor122, !dbg !2666
  %xor243 = xor i64 %xor242, %xor157, !dbg !2667
  %xor244 = xor i64 %xor243, %xor192, !dbg !2668
  %xor245 = xor i64 %xor244, %xor227, !dbg !2669
    #dbg_value(i64 %xor245, !2481, !DIExpression(), !2408)
  %xor246 = xor i64 %xor90, %xor125, !dbg !2670
  %xor247 = xor i64 %xor246, %xor160, !dbg !2671
  %xor248 = xor i64 %xor247, %xor195, !dbg !2672
  %xor249 = xor i64 %xor248, %xor230, !dbg !2673
    #dbg_value(i64 %xor249, !2486, !DIExpression(), !2408)
  %xor250 = xor i64 %xor93, %xor128, !dbg !2674
  %xor251 = xor i64 %xor250, %xor163, !dbg !2675
  %xor252 = xor i64 %xor251, %xor198, !dbg !2676
  %xor253 = xor i64 %xor252, %xor233, !dbg !2677
    #dbg_value(i64 %xor253, !2491, !DIExpression(), !2408)
  %shl254 = shl i64 %xor241, 1, !dbg !2678
  %shr255 = lshr i64 %xor241, 63, !dbg !2678
  %xor256 = xor i64 %shl254, %shr255, !dbg !2678
  %xor257 = xor i64 %xor253, %xor256, !dbg !2679
    #dbg_value(i64 %xor257, !2494, !DIExpression(), !2408)
  %shl258 = shl i64 %xor245, 1, !dbg !2680
  %shr259 = lshr i64 %xor245, 63, !dbg !2680
  %xor260 = xor i64 %shl258, %shr259, !dbg !2680
  %xor261 = xor i64 %xor237, %xor260, !dbg !2681
    #dbg_value(i64 %xor261, !2497, !DIExpression(), !2408)
  %shl262 = shl i64 %xor249, 1, !dbg !2682
  %shr263 = lshr i64 %xor249, 63, !dbg !2682
  %xor264 = xor i64 %shl262, %shr263, !dbg !2682
  %xor265 = xor i64 %xor241, %xor264, !dbg !2683
    #dbg_value(i64 %xor265, !2500, !DIExpression(), !2408)
  %shl266 = shl i64 %xor253, 1, !dbg !2684
  %shr267 = lshr i64 %xor253, 63, !dbg !2684
  %xor268 = xor i64 %shl266, %shr267, !dbg !2684
  %xor269 = xor i64 %xor245, %xor268, !dbg !2685
    #dbg_value(i64 %xor269, !2503, !DIExpression(), !2408)
  %shl270 = shl i64 %xor237, 1, !dbg !2686
  %shr271 = lshr i64 %xor237, 63, !dbg !2686
  %xor272 = xor i64 %shl270, %shr271, !dbg !2686
  %xor273 = xor i64 %xor249, %xor272, !dbg !2687
    #dbg_value(i64 %xor273, !2506, !DIExpression(), !2408)
  %xor274 = xor i64 %xor81, %xor257, !dbg !2688
    #dbg_value(i64 %xor274, !2519, !DIExpression(), !2408)
    #dbg_value(i64 %xor274, !2471, !DIExpression(), !2408)
  %xor275 = xor i64 %xor119, %xor261, !dbg !2689
    #dbg_value(i64 %xor275, !2555, !DIExpression(), !2408)
  %shl276 = shl i64 %xor275, 44, !dbg !2690
  %shr277 = lshr i64 %xor275, 20, !dbg !2690
  %xor278 = xor i64 %shl276, %shr277, !dbg !2690
    #dbg_value(i64 %xor278, !2476, !DIExpression(), !2408)
  %xor279 = xor i64 %xor157, %xor265, !dbg !2691
    #dbg_value(i64 %xor279, !2589, !DIExpression(), !2408)
  %shl280 = shl i64 %xor279, 43, !dbg !2692
  %shr281 = lshr i64 %xor279, 21, !dbg !2692
  %xor282 = xor i64 %shl280, %shr281, !dbg !2692
    #dbg_value(i64 %xor282, !2481, !DIExpression(), !2408)
  %xor283 = xor i64 %xor195, %xor269, !dbg !2693
    #dbg_value(i64 %xor283, !2623, !DIExpression(), !2408)
  %shl284 = shl i64 %xor283, 21, !dbg !2694
  %shr285 = lshr i64 %xor283, 43, !dbg !2694
  %xor286 = xor i64 %shl284, %shr285, !dbg !2694
    #dbg_value(i64 %xor286, !2486, !DIExpression(), !2408)
  %xor287 = xor i64 %xor233, %xor273, !dbg !2695
    #dbg_value(i64 %xor287, !2657, !DIExpression(), !2408)
  %shl288 = shl i64 %xor287, 14, !dbg !2696
  %shr289 = lshr i64 %xor287, 50, !dbg !2696
  %xor290 = xor i64 %shl288, %shr289, !dbg !2696
    #dbg_value(i64 %xor290, !2491, !DIExpression(), !2408)
  %not291 = xor i64 %xor278, -1, !dbg !2697
  %and292 = and i64 %not291, %xor282, !dbg !2698
  %xor293 = xor i64 %xor274, %and292, !dbg !2699
    #dbg_value(i64 %xor293, !2410, !DIExpression(), !2408)
  %add = add nsw i32 %round.0, 1, !dbg !2700
  %arrayidx294 = getelementptr inbounds [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %add, !dbg !2701
  %26 = load i64, ptr %arrayidx294, align 8, !dbg !2701
  %xor295 = xor i64 %xor293, %26, !dbg !2702
    #dbg_value(i64 %xor295, !2410, !DIExpression(), !2408)
  %not296 = xor i64 %xor282, -1, !dbg !2703
  %and297 = and i64 %not296, %xor286, !dbg !2704
  %xor298 = xor i64 %xor278, %and297, !dbg !2705
    #dbg_value(i64 %xor298, !2412, !DIExpression(), !2408)
  %not299 = xor i64 %xor286, -1, !dbg !2706
  %and300 = and i64 %not299, %xor290, !dbg !2707
  %xor301 = xor i64 %xor282, %and300, !dbg !2708
    #dbg_value(i64 %xor301, !2414, !DIExpression(), !2408)
  %not302 = xor i64 %xor290, -1, !dbg !2709
  %and303 = and i64 %not302, %xor274, !dbg !2710
  %xor304 = xor i64 %xor286, %and303, !dbg !2711
    #dbg_value(i64 %xor304, !2416, !DIExpression(), !2408)
  %not305 = xor i64 %xor274, -1, !dbg !2712
  %and306 = and i64 %not305, %xor278, !dbg !2713
  %xor307 = xor i64 %xor290, %and306, !dbg !2714
    #dbg_value(i64 %xor307, !2418, !DIExpression(), !2408)
  %xor308 = xor i64 %xor90, %xor269, !dbg !2715
    #dbg_value(i64 %xor308, !2533, !DIExpression(), !2408)
  %shl309 = shl i64 %xor308, 28, !dbg !2716
  %shr310 = lshr i64 %xor308, 36, !dbg !2716
  %xor311 = xor i64 %shl309, %shr310, !dbg !2716
    #dbg_value(i64 %xor311, !2471, !DIExpression(), !2408)
  %xor312 = xor i64 %xor128, %xor273, !dbg !2717
    #dbg_value(i64 %xor312, !2567, !DIExpression(), !2408)
  %shl313 = shl i64 %xor312, 20, !dbg !2718
  %shr314 = lshr i64 %xor312, 44, !dbg !2718
  %xor315 = xor i64 %shl313, %shr314, !dbg !2718
    #dbg_value(i64 %xor315, !2476, !DIExpression(), !2408)
  %xor316 = xor i64 %xor151, %xor257, !dbg !2719
    #dbg_value(i64 %xor316, !2581, !DIExpression(), !2408)
  %shl317 = shl i64 %xor316, 3, !dbg !2720
  %shr318 = lshr i64 %xor316, 61, !dbg !2720
  %xor319 = xor i64 %shl317, %shr318, !dbg !2720
    #dbg_value(i64 %xor319, !2481, !DIExpression(), !2408)
  %xor320 = xor i64 %xor189, %xor261, !dbg !2721
    #dbg_value(i64 %xor320, !2615, !DIExpression(), !2408)
  %shl321 = shl i64 %xor320, 45, !dbg !2722
  %shr322 = lshr i64 %xor320, 19, !dbg !2722
  %xor323 = xor i64 %shl321, %shr322, !dbg !2722
    #dbg_value(i64 %xor323, !2486, !DIExpression(), !2408)
  %xor324 = xor i64 %xor227, %xor265, !dbg !2723
    #dbg_value(i64 %xor324, !2649, !DIExpression(), !2408)
  %shl325 = shl i64 %xor324, 61, !dbg !2724
  %shr326 = lshr i64 %xor324, 3, !dbg !2724
  %xor327 = xor i64 %shl325, %shr326, !dbg !2724
    #dbg_value(i64 %xor327, !2491, !DIExpression(), !2408)
  %not328 = xor i64 %xor315, -1, !dbg !2725
  %and329 = and i64 %not328, %xor319, !dbg !2726
  %xor330 = xor i64 %xor311, %and329, !dbg !2727
    #dbg_value(i64 %xor330, !2420, !DIExpression(), !2408)
  %not331 = xor i64 %xor319, -1, !dbg !2728
  %and332 = and i64 %not331, %xor323, !dbg !2729
  %xor333 = xor i64 %xor315, %and332, !dbg !2730
    #dbg_value(i64 %xor333, !2422, !DIExpression(), !2408)
  %not334 = xor i64 %xor323, -1, !dbg !2731
  %and335 = and i64 %not334, %xor327, !dbg !2732
  %xor336 = xor i64 %xor319, %and335, !dbg !2733
    #dbg_value(i64 %xor336, !2424, !DIExpression(), !2408)
  %not337 = xor i64 %xor327, -1, !dbg !2734
  %and338 = and i64 %not337, %xor311, !dbg !2735
  %xor339 = xor i64 %xor323, %and338, !dbg !2736
    #dbg_value(i64 %xor339, !2426, !DIExpression(), !2408)
  %not340 = xor i64 %xor311, -1, !dbg !2737
  %and341 = and i64 %not340, %xor315, !dbg !2738
  %xor342 = xor i64 %xor327, %and341, !dbg !2739
    #dbg_value(i64 %xor342, !2428, !DIExpression(), !2408)
  %xor343 = xor i64 %xor84, %xor261, !dbg !2740
    #dbg_value(i64 %xor343, !2525, !DIExpression(), !2408)
  %shl344 = shl i64 %xor343, 1, !dbg !2741
  %shr345 = lshr i64 %xor343, 63, !dbg !2741
  %xor346 = xor i64 %shl344, %shr345, !dbg !2741
    #dbg_value(i64 %xor346, !2471, !DIExpression(), !2408)
  %xor347 = xor i64 %xor122, %xor265, !dbg !2742
    #dbg_value(i64 %xor347, !2559, !DIExpression(), !2408)
  %shl348 = shl i64 %xor347, 6, !dbg !2743
  %shr349 = lshr i64 %xor347, 58, !dbg !2743
  %xor350 = xor i64 %shl348, %shr349, !dbg !2743
    #dbg_value(i64 %xor350, !2476, !DIExpression(), !2408)
  %xor351 = xor i64 %xor160, %xor269, !dbg !2744
    #dbg_value(i64 %xor351, !2593, !DIExpression(), !2408)
  %shl352 = shl i64 %xor351, 25, !dbg !2745
  %shr353 = lshr i64 %xor351, 39, !dbg !2745
  %xor354 = xor i64 %shl352, %shr353, !dbg !2745
    #dbg_value(i64 %xor354, !2481, !DIExpression(), !2408)
  %xor355 = xor i64 %xor198, %xor273, !dbg !2746
    #dbg_value(i64 %xor355, !2627, !DIExpression(), !2408)
  %shl356 = shl i64 %xor355, 8, !dbg !2747
  %shr357 = lshr i64 %xor355, 56, !dbg !2747
  %xor358 = xor i64 %shl356, %shr357, !dbg !2747
    #dbg_value(i64 %xor358, !2486, !DIExpression(), !2408)
  %xor359 = xor i64 %xor221, %xor257, !dbg !2748
    #dbg_value(i64 %xor359, !2641, !DIExpression(), !2408)
  %shl360 = shl i64 %xor359, 18, !dbg !2749
  %shr361 = lshr i64 %xor359, 46, !dbg !2749
  %xor362 = xor i64 %shl360, %shr361, !dbg !2749
    #dbg_value(i64 %xor362, !2491, !DIExpression(), !2408)
  %not363 = xor i64 %xor350, -1, !dbg !2750
  %and364 = and i64 %not363, %xor354, !dbg !2751
  %xor365 = xor i64 %xor346, %and364, !dbg !2752
    #dbg_value(i64 %xor365, !2430, !DIExpression(), !2408)
  %not366 = xor i64 %xor354, -1, !dbg !2753
  %and367 = and i64 %not366, %xor358, !dbg !2754
  %xor368 = xor i64 %xor350, %and367, !dbg !2755
    #dbg_value(i64 %xor368, !2432, !DIExpression(), !2408)
  %not369 = xor i64 %xor358, -1, !dbg !2756
  %and370 = and i64 %not369, %xor362, !dbg !2757
  %xor371 = xor i64 %xor354, %and370, !dbg !2758
    #dbg_value(i64 %xor371, !2434, !DIExpression(), !2408)
  %not372 = xor i64 %xor362, -1, !dbg !2759
  %and373 = and i64 %not372, %xor346, !dbg !2760
  %xor374 = xor i64 %xor358, %and373, !dbg !2761
    #dbg_value(i64 %xor374, !2436, !DIExpression(), !2408)
  %not375 = xor i64 %xor346, -1, !dbg !2762
  %and376 = and i64 %not375, %xor350, !dbg !2763
  %xor377 = xor i64 %xor362, %and376, !dbg !2764
    #dbg_value(i64 %xor377, !2438, !DIExpression(), !2408)
  %xor378 = xor i64 %xor93, %xor273, !dbg !2765
    #dbg_value(i64 %xor378, !2537, !DIExpression(), !2408)
  %shl379 = shl i64 %xor378, 27, !dbg !2766
  %shr380 = lshr i64 %xor378, 37, !dbg !2766
  %xor381 = xor i64 %shl379, %shr380, !dbg !2766
    #dbg_value(i64 %xor381, !2471, !DIExpression(), !2408)
  %xor382 = xor i64 %xor116, %xor257, !dbg !2767
    #dbg_value(i64 %xor382, !2551, !DIExpression(), !2408)
  %shl383 = shl i64 %xor382, 36, !dbg !2768
  %shr384 = lshr i64 %xor382, 28, !dbg !2768
  %xor385 = xor i64 %shl383, %shr384, !dbg !2768
    #dbg_value(i64 %xor385, !2476, !DIExpression(), !2408)
  %xor386 = xor i64 %xor154, %xor261, !dbg !2769
    #dbg_value(i64 %xor386, !2585, !DIExpression(), !2408)
  %shl387 = shl i64 %xor386, 10, !dbg !2770
  %shr388 = lshr i64 %xor386, 54, !dbg !2770
  %xor389 = xor i64 %shl387, %shr388, !dbg !2770
    #dbg_value(i64 %xor389, !2481, !DIExpression(), !2408)
  %xor390 = xor i64 %xor192, %xor265, !dbg !2771
    #dbg_value(i64 %xor390, !2619, !DIExpression(), !2408)
  %shl391 = shl i64 %xor390, 15, !dbg !2772
  %shr392 = lshr i64 %xor390, 49, !dbg !2772
  %xor393 = xor i64 %shl391, %shr392, !dbg !2772
    #dbg_value(i64 %xor393, !2486, !DIExpression(), !2408)
  %xor394 = xor i64 %xor230, %xor269, !dbg !2773
    #dbg_value(i64 %xor394, !2653, !DIExpression(), !2408)
  %shl395 = shl i64 %xor394, 56, !dbg !2774
  %shr396 = lshr i64 %xor394, 8, !dbg !2774
  %xor397 = xor i64 %shl395, %shr396, !dbg !2774
    #dbg_value(i64 %xor397, !2491, !DIExpression(), !2408)
  %not398 = xor i64 %xor385, -1, !dbg !2775
  %and399 = and i64 %not398, %xor389, !dbg !2776
  %xor400 = xor i64 %xor381, %and399, !dbg !2777
    #dbg_value(i64 %xor400, !2440, !DIExpression(), !2408)
  %not401 = xor i64 %xor389, -1, !dbg !2778
  %and402 = and i64 %not401, %xor393, !dbg !2779
  %xor403 = xor i64 %xor385, %and402, !dbg !2780
    #dbg_value(i64 %xor403, !2442, !DIExpression(), !2408)
  %not404 = xor i64 %xor393, -1, !dbg !2781
  %and405 = and i64 %not404, %xor397, !dbg !2782
  %xor406 = xor i64 %xor389, %and405, !dbg !2783
    #dbg_value(i64 %xor406, !2444, !DIExpression(), !2408)
  %not407 = xor i64 %xor397, -1, !dbg !2784
  %and408 = and i64 %not407, %xor381, !dbg !2785
  %xor409 = xor i64 %xor393, %and408, !dbg !2786
    #dbg_value(i64 %xor409, !2446, !DIExpression(), !2408)
  %not410 = xor i64 %xor381, -1, !dbg !2787
  %and411 = and i64 %not410, %xor385, !dbg !2788
  %xor412 = xor i64 %xor397, %and411, !dbg !2789
    #dbg_value(i64 %xor412, !2448, !DIExpression(), !2408)
  %xor413 = xor i64 %xor87, %xor265, !dbg !2790
    #dbg_value(i64 %xor413, !2529, !DIExpression(), !2408)
  %shl414 = shl i64 %xor413, 62, !dbg !2791
  %shr415 = lshr i64 %xor413, 2, !dbg !2791
  %xor416 = xor i64 %shl414, %shr415, !dbg !2791
    #dbg_value(i64 %xor416, !2471, !DIExpression(), !2408)
  %xor417 = xor i64 %xor125, %xor269, !dbg !2792
    #dbg_value(i64 %xor417, !2563, !DIExpression(), !2408)
  %shl418 = shl i64 %xor417, 55, !dbg !2793
  %shr419 = lshr i64 %xor417, 9, !dbg !2793
  %xor420 = xor i64 %shl418, %shr419, !dbg !2793
    #dbg_value(i64 %xor420, !2476, !DIExpression(), !2408)
  %xor421 = xor i64 %xor163, %xor273, !dbg !2794
    #dbg_value(i64 %xor421, !2597, !DIExpression(), !2408)
  %shl422 = shl i64 %xor421, 39, !dbg !2795
  %shr423 = lshr i64 %xor421, 25, !dbg !2795
  %xor424 = xor i64 %shl422, %shr423, !dbg !2795
    #dbg_value(i64 %xor424, !2481, !DIExpression(), !2408)
  %xor425 = xor i64 %xor186, %xor257, !dbg !2796
    #dbg_value(i64 %xor425, !2611, !DIExpression(), !2408)
  %shl426 = shl i64 %xor425, 41, !dbg !2797
  %shr427 = lshr i64 %xor425, 23, !dbg !2797
  %xor428 = xor i64 %shl426, %shr427, !dbg !2797
    #dbg_value(i64 %xor428, !2486, !DIExpression(), !2408)
  %xor429 = xor i64 %xor224, %xor261, !dbg !2798
    #dbg_value(i64 %xor429, !2645, !DIExpression(), !2408)
  %shl430 = shl i64 %xor429, 2, !dbg !2799
  %shr431 = lshr i64 %xor429, 62, !dbg !2799
  %xor432 = xor i64 %shl430, %shr431, !dbg !2799
    #dbg_value(i64 %xor432, !2491, !DIExpression(), !2408)
  %not433 = xor i64 %xor420, -1, !dbg !2800
  %and434 = and i64 %not433, %xor424, !dbg !2801
  %xor435 = xor i64 %xor416, %and434, !dbg !2802
    #dbg_value(i64 %xor435, !2450, !DIExpression(), !2408)
  %not436 = xor i64 %xor424, -1, !dbg !2803
  %and437 = and i64 %not436, %xor428, !dbg !2804
  %xor438 = xor i64 %xor420, %and437, !dbg !2805
    #dbg_value(i64 %xor438, !2452, !DIExpression(), !2408)
  %not439 = xor i64 %xor428, -1, !dbg !2806
  %and440 = and i64 %not439, %xor432, !dbg !2807
  %xor441 = xor i64 %xor424, %and440, !dbg !2808
    #dbg_value(i64 %xor441, !2454, !DIExpression(), !2408)
  %not442 = xor i64 %xor432, -1, !dbg !2809
  %and443 = and i64 %not442, %xor416, !dbg !2810
  %xor444 = xor i64 %xor428, %and443, !dbg !2811
    #dbg_value(i64 %xor444, !2456, !DIExpression(), !2408)
  %not445 = xor i64 %xor416, -1, !dbg !2812
  %and446 = and i64 %not445, %xor420, !dbg !2813
  %xor447 = xor i64 %xor432, %and446, !dbg !2814
    #dbg_value(i64 %xor447, !2458, !DIExpression(), !2408)
  br label %for.inc, !dbg !2815

for.inc:                                          ; preds = %for.body
  %add448 = add nsw i32 %round.0, 2, !dbg !2816
    #dbg_value(i32 %add448, !2459, !DIExpression(), !2408)
  br label %for.cond, !dbg !2817, !llvm.loop !2818

for.end:                                          ; preds = %for.cond
  %arrayidx449 = getelementptr inbounds i64, ptr %state, i32 0, !dbg !2820
  store i64 %Aba.0, ptr %arrayidx449, align 8, !dbg !2821
  %arrayidx450 = getelementptr inbounds i64, ptr %state, i32 1, !dbg !2822
  store i64 %Abe.0, ptr %arrayidx450, align 8, !dbg !2823
  %arrayidx451 = getelementptr inbounds i64, ptr %state, i32 2, !dbg !2824
  store i64 %Abi.0, ptr %arrayidx451, align 8, !dbg !2825
  %arrayidx452 = getelementptr inbounds i64, ptr %state, i32 3, !dbg !2826
  store i64 %Abo.0, ptr %arrayidx452, align 8, !dbg !2827
  %arrayidx453 = getelementptr inbounds i64, ptr %state, i32 4, !dbg !2828
  store i64 %Abu.0, ptr %arrayidx453, align 8, !dbg !2829
  %arrayidx454 = getelementptr inbounds i64, ptr %state, i32 5, !dbg !2830
  store i64 %Aga.0, ptr %arrayidx454, align 8, !dbg !2831
  %arrayidx455 = getelementptr inbounds i64, ptr %state, i32 6, !dbg !2832
  store i64 %Age.0, ptr %arrayidx455, align 8, !dbg !2833
  %arrayidx456 = getelementptr inbounds i64, ptr %state, i32 7, !dbg !2834
  store i64 %Agi.0, ptr %arrayidx456, align 8, !dbg !2835
  %arrayidx457 = getelementptr inbounds i64, ptr %state, i32 8, !dbg !2836
  store i64 %Ago.0, ptr %arrayidx457, align 8, !dbg !2837
  %arrayidx458 = getelementptr inbounds i64, ptr %state, i32 9, !dbg !2838
  store i64 %Agu.0, ptr %arrayidx458, align 8, !dbg !2839
  %arrayidx459 = getelementptr inbounds i64, ptr %state, i32 10, !dbg !2840
  store i64 %Aka.0, ptr %arrayidx459, align 8, !dbg !2841
  %arrayidx460 = getelementptr inbounds i64, ptr %state, i32 11, !dbg !2842
  store i64 %Ake.0, ptr %arrayidx460, align 8, !dbg !2843
  %arrayidx461 = getelementptr inbounds i64, ptr %state, i32 12, !dbg !2844
  store i64 %Aki.0, ptr %arrayidx461, align 8, !dbg !2845
  %arrayidx462 = getelementptr inbounds i64, ptr %state, i32 13, !dbg !2846
  store i64 %Ako.0, ptr %arrayidx462, align 8, !dbg !2847
  %arrayidx463 = getelementptr inbounds i64, ptr %state, i32 14, !dbg !2848
  store i64 %Aku.0, ptr %arrayidx463, align 8, !dbg !2849
  %arrayidx464 = getelementptr inbounds i64, ptr %state, i32 15, !dbg !2850
  store i64 %Ama.0, ptr %arrayidx464, align 8, !dbg !2851
  %arrayidx465 = getelementptr inbounds i64, ptr %state, i32 16, !dbg !2852
  store i64 %Ame.0, ptr %arrayidx465, align 8, !dbg !2853
  %arrayidx466 = getelementptr inbounds i64, ptr %state, i32 17, !dbg !2854
  store i64 %Ami.0, ptr %arrayidx466, align 8, !dbg !2855
  %arrayidx467 = getelementptr inbounds i64, ptr %state, i32 18, !dbg !2856
  store i64 %Amo.0, ptr %arrayidx467, align 8, !dbg !2857
  %arrayidx468 = getelementptr inbounds i64, ptr %state, i32 19, !dbg !2858
  store i64 %Amu.0, ptr %arrayidx468, align 8, !dbg !2859
  %arrayidx469 = getelementptr inbounds i64, ptr %state, i32 20, !dbg !2860
  store i64 %Asa.0, ptr %arrayidx469, align 8, !dbg !2861
  %arrayidx470 = getelementptr inbounds i64, ptr %state, i32 21, !dbg !2862
  store i64 %Ase.0, ptr %arrayidx470, align 8, !dbg !2863
  %arrayidx471 = getelementptr inbounds i64, ptr %state, i32 22, !dbg !2864
  store i64 %Asi.0, ptr %arrayidx471, align 8, !dbg !2865
  %arrayidx472 = getelementptr inbounds i64, ptr %state, i32 23, !dbg !2866
  store i64 %Aso.0, ptr %arrayidx472, align 8, !dbg !2867
  %arrayidx473 = getelementptr inbounds i64, ptr %state, i32 24, !dbg !2868
  store i64 %Asu.0, ptr %arrayidx473, align 8, !dbg !2869
  ret void, !dbg !2870
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_finalize(ptr noundef %state) #0 !dbg !2871 {
entry:
    #dbg_value(ptr %state, !2872, !DIExpression(), !2873)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !2874
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2875
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2876
  %0 = load i32, ptr %pos, align 8, !dbg !2876
  call void @keccak_finalize(ptr noundef %arraydecay, i32 noundef %0, i32 noundef 168, i8 noundef zeroext 31) #2, !dbg !2877
  %pos1 = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2878
  store i32 168, ptr %pos1, align 8, !dbg !2879
  ret void, !dbg !2880
}

; Function Attrs: noinline nounwind optnone
define internal void @keccak_finalize(ptr noundef %s, i32 noundef %pos, i32 noundef %r, i8 noundef zeroext %p) #0 !dbg !2881 {
entry:
    #dbg_value(ptr %s, !2884, !DIExpression(), !2885)
    #dbg_value(i32 %pos, !2886, !DIExpression(), !2885)
    #dbg_value(i32 %r, !2887, !DIExpression(), !2885)
    #dbg_value(i8 %p, !2888, !DIExpression(), !2885)
  %conv = zext i8 %p to i64, !dbg !2889
  %rem = urem i32 %pos, 8, !dbg !2890
  %mul = mul i32 8, %rem, !dbg !2891
  %sh_prom = zext i32 %mul to i64, !dbg !2892
  %shl = shl i64 %conv, %sh_prom, !dbg !2892
  %div = udiv i32 %pos, 8, !dbg !2893
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div, !dbg !2894
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2895
  %xor = xor i64 %0, %shl, !dbg !2895
  store i64 %xor, ptr %arrayidx, align 8, !dbg !2895
  %div1 = udiv i32 %r, 8, !dbg !2896
  %sub = sub i32 %div1, 1, !dbg !2897
  %arrayidx2 = getelementptr inbounds nuw i64, ptr %s, i32 %sub, !dbg !2898
  %1 = load i64, ptr %arrayidx2, align 8, !dbg !2899
  %xor3 = xor i64 %1, -9223372036854775808, !dbg !2899
  store i64 %xor3, ptr %arrayidx2, align 8, !dbg !2899
  ret void, !dbg !2900
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) #0 !dbg !2901 {
entry:
    #dbg_value(ptr %out, !2904, !DIExpression(), !2905)
    #dbg_value(i32 %outlen, !2906, !DIExpression(), !2905)
    #dbg_value(ptr %state, !2907, !DIExpression(), !2905)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !2908
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2909
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2910
  %0 = load i32, ptr %pos, align 8, !dbg !2910
  %call = call i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %arraydecay, i32 noundef %0, i32 noundef 168) #2, !dbg !2911
  %pos1 = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2912
  store i32 %call, ptr %pos1, align 8, !dbg !2913
  ret void, !dbg !2914
}

; Function Attrs: noinline nounwind optnone
define internal i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %s, i32 noundef %pos, i32 noundef %r) #0 !dbg !2915 {
entry:
    #dbg_value(ptr %out, !2918, !DIExpression(), !2919)
    #dbg_value(i32 %outlen, !2920, !DIExpression(), !2919)
    #dbg_value(ptr %s, !2921, !DIExpression(), !2919)
    #dbg_value(i32 %pos, !2922, !DIExpression(), !2919)
    #dbg_value(i32 %r, !2923, !DIExpression(), !2919)
  br label %while.cond, !dbg !2924

while.cond:                                       ; preds = %for.end, %entry
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ %i.0, %for.end ]
  %outlen.addr.0 = phi i32 [ %outlen, %entry ], [ %sub3, %for.end ]
  %out.addr.0 = phi ptr [ %out, %entry ], [ %out.addr.1, %for.end ]
    #dbg_value(ptr %out.addr.0, !2918, !DIExpression(), !2919)
    #dbg_value(i32 %outlen.addr.0, !2920, !DIExpression(), !2919)
    #dbg_value(i32 %pos.addr.0, !2922, !DIExpression(), !2919)
  %tobool = icmp ne i32 %outlen.addr.0, 0, !dbg !2924
  br i1 %tobool, label %while.body, label %while.end, !dbg !2924

while.body:                                       ; preds = %while.cond
  %cmp = icmp eq i32 %pos.addr.0, %r, !dbg !2925
  br i1 %cmp, label %if.then, label %if.end, !dbg !2925

if.then:                                          ; preds = %while.body
  call void @KeccakF1600_StatePermute(ptr noundef %s) #2, !dbg !2928
    #dbg_value(i32 0, !2922, !DIExpression(), !2919)
  br label %if.end, !dbg !2930

if.end:                                           ; preds = %if.then, %while.body
  %pos.addr.1 = phi i32 [ 0, %if.then ], [ %pos.addr.0, %while.body ]
    #dbg_value(i32 %pos.addr.1, !2922, !DIExpression(), !2919)
    #dbg_value(i32 %pos.addr.1, !2931, !DIExpression(), !2919)
  br label %for.cond, !dbg !2932

for.cond:                                         ; preds = %for.inc, %if.end
  %i.0 = phi i32 [ %pos.addr.1, %if.end ], [ %inc, %for.inc ], !dbg !2934
  %out.addr.1 = phi ptr [ %out.addr.0, %if.end ], [ %incdec.ptr, %for.inc ]
    #dbg_value(ptr %out.addr.1, !2918, !DIExpression(), !2919)
    #dbg_value(i32 %i.0, !2931, !DIExpression(), !2919)
  %cmp1 = icmp ult i32 %i.0, %r, !dbg !2935
  br i1 %cmp1, label %land.rhs, label %land.end, !dbg !2937

land.rhs:                                         ; preds = %for.cond
  %add = add i32 %pos.addr.1, %outlen.addr.0, !dbg !2938
  %cmp2 = icmp ult i32 %i.0, %add, !dbg !2939
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %0 = phi i1 [ false, %for.cond ], [ %cmp2, %land.rhs ], !dbg !2940
  br i1 %0, label %for.body, label %for.end, !dbg !2941

for.body:                                         ; preds = %land.end
  %div = udiv i32 %i.0, 8, !dbg !2942
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div, !dbg !2943
  %1 = load i64, ptr %arrayidx, align 8, !dbg !2943
  %rem = urem i32 %i.0, 8, !dbg !2944
  %mul = mul i32 8, %rem, !dbg !2945
  %sh_prom = zext i32 %mul to i64, !dbg !2946
  %shr = lshr i64 %1, %sh_prom, !dbg !2946
  %conv = trunc i64 %shr to i8, !dbg !2943
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %out.addr.1, i32 1, !dbg !2947
    #dbg_value(ptr %incdec.ptr, !2918, !DIExpression(), !2919)
  store i8 %conv, ptr %out.addr.1, align 1, !dbg !2948
  br label %for.inc, !dbg !2949

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !2950
    #dbg_value(i32 %inc, !2931, !DIExpression(), !2919)
  br label %for.cond, !dbg !2951, !llvm.loop !2952

for.end:                                          ; preds = %land.end
  %sub = sub i32 %i.0, %pos.addr.1, !dbg !2954
  %sub3 = sub i32 %outlen.addr.0, %sub, !dbg !2955
    #dbg_value(i32 %sub3, !2920, !DIExpression(), !2919)
    #dbg_value(i32 %i.0, !2922, !DIExpression(), !2919)
  br label %while.cond, !dbg !2924, !llvm.loop !2956

while.end:                                        ; preds = %while.cond
  ret i32 %pos.addr.0, !dbg !2958
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) #0 !dbg !2959 {
entry:
    #dbg_value(ptr %state, !2960, !DIExpression(), !2961)
    #dbg_value(ptr %in, !2962, !DIExpression(), !2961)
    #dbg_value(i32 %inlen, !2963, !DIExpression(), !2961)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !2964
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2965
  call void @keccak_absorb_once(ptr noundef %arraydecay, i32 noundef 168, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #2, !dbg !2966
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2967
  store i32 168, ptr %pos, align 8, !dbg !2968
  ret void, !dbg !2969
}

; Function Attrs: noinline nounwind optnone
define internal void @keccak_absorb_once(ptr noundef %s, i32 noundef %r, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext %p) #0 !dbg !2970 {
entry:
    #dbg_value(ptr %s, !2973, !DIExpression(), !2974)
    #dbg_value(i32 %r, !2975, !DIExpression(), !2974)
    #dbg_value(ptr %in, !2976, !DIExpression(), !2974)
    #dbg_value(i32 %inlen, !2977, !DIExpression(), !2974)
    #dbg_value(i8 %p, !2978, !DIExpression(), !2974)
    #dbg_value(i32 0, !2979, !DIExpression(), !2974)
  br label %for.cond, !dbg !2980

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !2982
    #dbg_value(i32 %i.0, !2979, !DIExpression(), !2974)
  %cmp = icmp ult i32 %i.0, 25, !dbg !2983
  br i1 %cmp, label %for.body, label %for.end, !dbg !2985

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !2986
  store i64 0, ptr %arrayidx, align 8, !dbg !2987
  br label %for.inc, !dbg !2986

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !2988
    #dbg_value(i32 %inc, !2979, !DIExpression(), !2974)
  br label %for.cond, !dbg !2989, !llvm.loop !2990

for.end:                                          ; preds = %for.cond
  br label %while.cond, !dbg !2992

while.cond:                                       ; preds = %for.end8, %for.end
  %in.addr.0 = phi ptr [ %in, %for.end ], [ %add.ptr9, %for.end8 ]
  %inlen.addr.0 = phi i32 [ %inlen, %for.end ], [ %sub, %for.end8 ]
    #dbg_value(i32 %inlen.addr.0, !2977, !DIExpression(), !2974)
    #dbg_value(ptr %in.addr.0, !2976, !DIExpression(), !2974)
  %cmp1 = icmp uge i32 %inlen.addr.0, %r, !dbg !2993
  br i1 %cmp1, label %while.body, label %while.end, !dbg !2992

while.body:                                       ; preds = %while.cond
    #dbg_value(i32 0, !2979, !DIExpression(), !2974)
  br label %for.cond2, !dbg !2994

for.cond2:                                        ; preds = %for.inc6, %while.body
  %i.1 = phi i32 [ 0, %while.body ], [ %inc7, %for.inc6 ], !dbg !2997
    #dbg_value(i32 %i.1, !2979, !DIExpression(), !2974)
  %div = udiv i32 %r, 8, !dbg !2998
  %cmp3 = icmp ult i32 %i.1, %div, !dbg !3000
  br i1 %cmp3, label %for.body4, label %for.end8, !dbg !3001

for.body4:                                        ; preds = %for.cond2
  %mul = mul i32 8, %i.1, !dbg !3002
  %add.ptr = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %mul, !dbg !3003
  %call = call i64 @load64(ptr noundef %add.ptr) #2, !dbg !3004
  %arrayidx5 = getelementptr inbounds nuw i64, ptr %s, i32 %i.1, !dbg !3005
  %0 = load i64, ptr %arrayidx5, align 8, !dbg !3006
  %xor = xor i64 %0, %call, !dbg !3006
  store i64 %xor, ptr %arrayidx5, align 8, !dbg !3006
  br label %for.inc6, !dbg !3005

for.inc6:                                         ; preds = %for.body4
  %inc7 = add i32 %i.1, 1, !dbg !3007
    #dbg_value(i32 %inc7, !2979, !DIExpression(), !2974)
  br label %for.cond2, !dbg !3008, !llvm.loop !3009

for.end8:                                         ; preds = %for.cond2
  %add.ptr9 = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %r, !dbg !3011
    #dbg_value(ptr %add.ptr9, !2976, !DIExpression(), !2974)
  %sub = sub i32 %inlen.addr.0, %r, !dbg !3012
    #dbg_value(i32 %sub, !2977, !DIExpression(), !2974)
  call void @KeccakF1600_StatePermute(ptr noundef %s) #2, !dbg !3013
  br label %while.cond, !dbg !2992, !llvm.loop !3014

while.end:                                        ; preds = %while.cond
    #dbg_value(i32 0, !2979, !DIExpression(), !2974)
  br label %for.cond10, !dbg !3016

for.cond10:                                       ; preds = %for.inc18, %while.end
  %i.2 = phi i32 [ 0, %while.end ], [ %inc19, %for.inc18 ], !dbg !3018
    #dbg_value(i32 %i.2, !2979, !DIExpression(), !2974)
  %cmp11 = icmp ult i32 %i.2, %inlen.addr.0, !dbg !3019
  br i1 %cmp11, label %for.body12, label %for.end20, !dbg !3021

for.body12:                                       ; preds = %for.cond10
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %i.2, !dbg !3022
  %1 = load i8, ptr %arrayidx13, align 1, !dbg !3022
  %conv = zext i8 %1 to i64, !dbg !3023
  %rem = urem i32 %i.2, 8, !dbg !3024
  %mul14 = mul i32 8, %rem, !dbg !3025
  %sh_prom = zext i32 %mul14 to i64, !dbg !3026
  %shl = shl i64 %conv, %sh_prom, !dbg !3026
  %div15 = udiv i32 %i.2, 8, !dbg !3027
  %arrayidx16 = getelementptr inbounds nuw i64, ptr %s, i32 %div15, !dbg !3028
  %2 = load i64, ptr %arrayidx16, align 8, !dbg !3029
  %xor17 = xor i64 %2, %shl, !dbg !3029
  store i64 %xor17, ptr %arrayidx16, align 8, !dbg !3029
  br label %for.inc18, !dbg !3028

for.inc18:                                        ; preds = %for.body12
  %inc19 = add i32 %i.2, 1, !dbg !3030
    #dbg_value(i32 %inc19, !2979, !DIExpression(), !2974)
  br label %for.cond10, !dbg !3031, !llvm.loop !3032

for.end20:                                        ; preds = %for.cond10
  %conv21 = zext i8 %p to i64, !dbg !3034
  %rem22 = urem i32 %i.2, 8, !dbg !3035
  %mul23 = mul i32 8, %rem22, !dbg !3036
  %sh_prom24 = zext i32 %mul23 to i64, !dbg !3037
  %shl25 = shl i64 %conv21, %sh_prom24, !dbg !3037
  %div26 = udiv i32 %i.2, 8, !dbg !3038
  %arrayidx27 = getelementptr inbounds nuw i64, ptr %s, i32 %div26, !dbg !3039
  %3 = load i64, ptr %arrayidx27, align 8, !dbg !3040
  %xor28 = xor i64 %3, %shl25, !dbg !3040
  store i64 %xor28, ptr %arrayidx27, align 8, !dbg !3040
  %sub29 = sub i32 %r, 1, !dbg !3041
  %div30 = udiv i32 %sub29, 8, !dbg !3042
  %arrayidx31 = getelementptr inbounds nuw i64, ptr %s, i32 %div30, !dbg !3043
  %4 = load i64, ptr %arrayidx31, align 8, !dbg !3044
  %xor32 = xor i64 %4, -9223372036854775808, !dbg !3044
  store i64 %xor32, ptr %arrayidx31, align 8, !dbg !3044
  ret void, !dbg !3045
}

; Function Attrs: noinline nounwind optnone
define internal i64 @load64(ptr noundef %x) #0 !dbg !3046 {
entry:
    #dbg_value(ptr %x, !3049, !DIExpression(), !3050)
    #dbg_value(i64 0, !3051, !DIExpression(), !3050)
    #dbg_value(i32 0, !3052, !DIExpression(), !3050)
  br label %for.cond, !dbg !3053

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !3055
  %r.0 = phi i64 [ 0, %entry ], [ %or, %for.inc ], !dbg !3050
    #dbg_value(i64 %r.0, !3051, !DIExpression(), !3050)
    #dbg_value(i32 %i.0, !3052, !DIExpression(), !3050)
  %cmp = icmp ult i32 %i.0, 8, !dbg !3056
  br i1 %cmp, label %for.body, label %for.end, !dbg !3058

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !3059
  %0 = load i8, ptr %arrayidx, align 1, !dbg !3059
  %conv = zext i8 %0 to i64, !dbg !3060
  %mul = mul i32 8, %i.0, !dbg !3061
  %sh_prom = zext i32 %mul to i64, !dbg !3062
  %shl = shl i64 %conv, %sh_prom, !dbg !3062
  %or = or i64 %r.0, %shl, !dbg !3063
    #dbg_value(i64 %or, !3051, !DIExpression(), !3050)
  br label %for.inc, !dbg !3064

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !3065
    #dbg_value(i32 %inc, !3052, !DIExpression(), !3050)
  br label %for.cond, !dbg !3066, !llvm.loop !3067

for.end:                                          ; preds = %for.cond
  ret i64 %r.0, !dbg !3069
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) #0 !dbg !3070 {
entry:
    #dbg_value(ptr %out, !3071, !DIExpression(), !3072)
    #dbg_value(i32 %nblocks, !3073, !DIExpression(), !3072)
    #dbg_value(ptr %state, !3074, !DIExpression(), !3072)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !3075
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !3076
  call void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %arraydecay, i32 noundef 168) #2, !dbg !3077
  ret void, !dbg !3078
}

; Function Attrs: noinline nounwind optnone
define internal void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %s, i32 noundef %r) #0 !dbg !3079 {
entry:
    #dbg_value(ptr %out, !3082, !DIExpression(), !3083)
    #dbg_value(i32 %nblocks, !3084, !DIExpression(), !3083)
    #dbg_value(ptr %s, !3085, !DIExpression(), !3083)
    #dbg_value(i32 %r, !3086, !DIExpression(), !3083)
  br label %while.cond, !dbg !3087

while.cond:                                       ; preds = %for.end, %entry
  %nblocks.addr.0 = phi i32 [ %nblocks, %entry ], [ %sub, %for.end ]
  %out.addr.0 = phi ptr [ %out, %entry ], [ %add.ptr1, %for.end ]
    #dbg_value(ptr %out.addr.0, !3082, !DIExpression(), !3083)
    #dbg_value(i32 %nblocks.addr.0, !3084, !DIExpression(), !3083)
  %tobool = icmp ne i32 %nblocks.addr.0, 0, !dbg !3087
  br i1 %tobool, label %while.body, label %while.end, !dbg !3087

while.body:                                       ; preds = %while.cond
  call void @KeccakF1600_StatePermute(ptr noundef %s) #2, !dbg !3088
    #dbg_value(i32 0, !3090, !DIExpression(), !3083)
  br label %for.cond, !dbg !3091

for.cond:                                         ; preds = %for.inc, %while.body
  %i.0 = phi i32 [ 0, %while.body ], [ %inc, %for.inc ], !dbg !3093
    #dbg_value(i32 %i.0, !3090, !DIExpression(), !3083)
  %div = udiv i32 %r, 8, !dbg !3094
  %cmp = icmp ult i32 %i.0, %div, !dbg !3096
  br i1 %cmp, label %for.body, label %for.end, !dbg !3097

for.body:                                         ; preds = %for.cond
  %mul = mul i32 8, %i.0, !dbg !3098
  %add.ptr = getelementptr inbounds nuw i8, ptr %out.addr.0, i32 %mul, !dbg !3099
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !3100
  %0 = load i64, ptr %arrayidx, align 8, !dbg !3100
  call void @store64(ptr noundef %add.ptr, i64 noundef %0) #2, !dbg !3101
  br label %for.inc, !dbg !3101

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !3102
    #dbg_value(i32 %inc, !3090, !DIExpression(), !3083)
  br label %for.cond, !dbg !3103, !llvm.loop !3104

for.end:                                          ; preds = %for.cond
  %add.ptr1 = getelementptr inbounds nuw i8, ptr %out.addr.0, i32 %r, !dbg !3106
    #dbg_value(ptr %add.ptr1, !3082, !DIExpression(), !3083)
  %sub = sub i32 %nblocks.addr.0, 1, !dbg !3107
    #dbg_value(i32 %sub, !3084, !DIExpression(), !3083)
  br label %while.cond, !dbg !3087, !llvm.loop !3108

while.end:                                        ; preds = %while.cond
  ret void, !dbg !3110
}

; Function Attrs: noinline nounwind optnone
define internal void @store64(ptr noundef %x, i64 noundef %u) #0 !dbg !3111 {
entry:
    #dbg_value(ptr %x, !3114, !DIExpression(), !3115)
    #dbg_value(i64 %u, !3116, !DIExpression(), !3115)
    #dbg_value(i32 0, !3117, !DIExpression(), !3115)
  br label %for.cond, !dbg !3118

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !3120
    #dbg_value(i32 %i.0, !3117, !DIExpression(), !3115)
  %cmp = icmp ult i32 %i.0, 8, !dbg !3121
  br i1 %cmp, label %for.body, label %for.end, !dbg !3123

for.body:                                         ; preds = %for.cond
  %mul = mul i32 8, %i.0, !dbg !3124
  %sh_prom = zext i32 %mul to i64, !dbg !3125
  %shr = lshr i64 %u, %sh_prom, !dbg !3125
  %conv = trunc i64 %shr to i8, !dbg !3126
  %arrayidx = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !3127
  store i8 %conv, ptr %arrayidx, align 1, !dbg !3128
  br label %for.inc, !dbg !3127

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !3129
    #dbg_value(i32 %inc, !3117, !DIExpression(), !3115)
  br label %for.cond, !dbg !3130, !llvm.loop !3131

for.end:                                          ; preds = %for.cond
  ret void, !dbg !3133
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef %state) #0 !dbg !3134 {
entry:
    #dbg_value(ptr %state, !3135, !DIExpression(), !3136)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !3137
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !3138
  call void @keccak_init(ptr noundef %arraydecay) #2, !dbg !3139
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !3140
  store i32 0, ptr %pos, align 8, !dbg !3141
  ret void, !dbg !3142
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) #0 !dbg !3143 {
entry:
    #dbg_value(ptr %state, !3144, !DIExpression(), !3145)
    #dbg_value(ptr %in, !3146, !DIExpression(), !3145)
    #dbg_value(i32 %inlen, !3147, !DIExpression(), !3145)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !3148
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !3149
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !3150
  %0 = load i32, ptr %pos, align 8, !dbg !3150
  %call = call i32 @keccak_absorb(ptr noundef %arraydecay, i32 noundef %0, i32 noundef 136, ptr noundef %in, i32 noundef %inlen) #2, !dbg !3151
  %pos1 = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !3152
  store i32 %call, ptr %pos1, align 8, !dbg !3153
  ret void, !dbg !3154
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef %state) #0 !dbg !3155 {
entry:
    #dbg_value(ptr %state, !3156, !DIExpression(), !3157)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !3158
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !3159
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !3160
  %0 = load i32, ptr %pos, align 8, !dbg !3160
  call void @keccak_finalize(ptr noundef %arraydecay, i32 noundef %0, i32 noundef 136, i8 noundef zeroext 31) #2, !dbg !3161
  %pos1 = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !3162
  store i32 136, ptr %pos1, align 8, !dbg !3163
  ret void, !dbg !3164
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) #0 !dbg !3165 {
entry:
    #dbg_value(ptr %out, !3166, !DIExpression(), !3167)
    #dbg_value(i32 %outlen, !3168, !DIExpression(), !3167)
    #dbg_value(ptr %state, !3169, !DIExpression(), !3167)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !3170
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !3171
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !3172
  %0 = load i32, ptr %pos, align 8, !dbg !3172
  %call = call i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %arraydecay, i32 noundef %0, i32 noundef 136) #2, !dbg !3173
  %pos1 = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !3174
  store i32 %call, ptr %pos1, align 8, !dbg !3175
  ret void, !dbg !3176
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) #0 !dbg !3177 {
entry:
    #dbg_value(ptr %state, !3178, !DIExpression(), !3179)
    #dbg_value(ptr %in, !3180, !DIExpression(), !3179)
    #dbg_value(i32 %inlen, !3181, !DIExpression(), !3179)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !3182
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !3183
  call void @keccak_absorb_once(ptr noundef %arraydecay, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #2, !dbg !3184
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !3185
  store i32 136, ptr %pos, align 8, !dbg !3186
  ret void, !dbg !3187
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) #0 !dbg !3188 {
entry:
    #dbg_value(ptr %out, !3189, !DIExpression(), !3190)
    #dbg_value(i32 %nblocks, !3191, !DIExpression(), !3190)
    #dbg_value(ptr %state, !3192, !DIExpression(), !3190)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !3193
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !3194
  call void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %arraydecay, i32 noundef 136) #2, !dbg !3195
  ret void, !dbg !3196
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake128(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) #0 !dbg !3197 {
entry:
  %state = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !3200, !DIExpression(), !3201)
    #dbg_value(i32 %outlen, !3202, !DIExpression(), !3201)
    #dbg_value(ptr %in, !3203, !DIExpression(), !3201)
    #dbg_value(i32 %inlen, !3204, !DIExpression(), !3201)
    #dbg_declare(ptr %state, !3205, !DIExpression(), !3206)
  call void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) #2, !dbg !3207
  %div = udiv i32 %outlen, 168, !dbg !3208
    #dbg_value(i32 %div, !3209, !DIExpression(), !3201)
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %div, ptr noundef %state) #2, !dbg !3210
  %mul = mul i32 %div, 168, !dbg !3211
  %sub = sub i32 %outlen, %mul, !dbg !3212
    #dbg_value(i32 %sub, !3202, !DIExpression(), !3201)
  %mul1 = mul i32 %div, 168, !dbg !3213
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !3214
    #dbg_value(ptr %add.ptr, !3200, !DIExpression(), !3201)
  call void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef %state) #2, !dbg !3215
  ret void, !dbg !3216
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) #0 !dbg !3217 {
entry:
  %state = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !3218, !DIExpression(), !3219)
    #dbg_value(i32 %outlen, !3220, !DIExpression(), !3219)
    #dbg_value(ptr %in, !3221, !DIExpression(), !3219)
    #dbg_value(i32 %inlen, !3222, !DIExpression(), !3219)
    #dbg_declare(ptr %state, !3223, !DIExpression(), !3224)
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) #2, !dbg !3225
  %div = udiv i32 %outlen, 136, !dbg !3226
    #dbg_value(i32 %div, !3227, !DIExpression(), !3219)
  call void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %div, ptr noundef %state) #2, !dbg !3228
  %mul = mul i32 %div, 136, !dbg !3229
  %sub = sub i32 %outlen, %mul, !dbg !3230
    #dbg_value(i32 %sub, !3220, !DIExpression(), !3219)
  %mul1 = mul i32 %div, 136, !dbg !3231
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !3232
    #dbg_value(ptr %add.ptr, !3218, !DIExpression(), !3219)
  call void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef %state) #2, !dbg !3233
  ret void, !dbg !3234
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) #0 !dbg !3235 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !3238, !DIExpression(), !3239)
    #dbg_value(ptr %in, !3240, !DIExpression(), !3239)
    #dbg_value(i32 %inlen, !3241, !DIExpression(), !3239)
    #dbg_declare(ptr %s, !3242, !DIExpression(), !3243)
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !3244
  call void @keccak_absorb_once(ptr noundef %arraydecay, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #2, !dbg !3245
  %arraydecay1 = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !3246
  call void @KeccakF1600_StatePermute(ptr noundef %arraydecay1) #2, !dbg !3247
    #dbg_value(i32 0, !3248, !DIExpression(), !3239)
  br label %for.cond, !dbg !3249

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !3251
    #dbg_value(i32 %i.0, !3248, !DIExpression(), !3239)
  %cmp = icmp ult i32 %i.0, 4, !dbg !3252
  br i1 %cmp, label %for.body, label %for.end, !dbg !3254

for.body:                                         ; preds = %for.cond
  %mul = mul i32 8, %i.0, !dbg !3255
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !3256
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !3257
  %0 = load i64, ptr %arrayidx, align 8, !dbg !3257
  call void @store64(ptr noundef %add.ptr, i64 noundef %0) #2, !dbg !3258
  br label %for.inc, !dbg !3258

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !3259
    #dbg_value(i32 %inc, !3248, !DIExpression(), !3239)
  br label %for.cond, !dbg !3260, !llvm.loop !3261

for.end:                                          ; preds = %for.cond
  ret void, !dbg !3263
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) #0 !dbg !3264 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !3265, !DIExpression(), !3266)
    #dbg_value(ptr %in, !3267, !DIExpression(), !3266)
    #dbg_value(i32 %inlen, !3268, !DIExpression(), !3266)
    #dbg_declare(ptr %s, !3269, !DIExpression(), !3270)
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !3271
  call void @keccak_absorb_once(ptr noundef %arraydecay, i32 noundef 72, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #2, !dbg !3272
  %arraydecay1 = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !3273
  call void @KeccakF1600_StatePermute(ptr noundef %arraydecay1) #2, !dbg !3274
    #dbg_value(i32 0, !3275, !DIExpression(), !3266)
  br label %for.cond, !dbg !3276

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !3278
    #dbg_value(i32 %i.0, !3275, !DIExpression(), !3266)
  %cmp = icmp ult i32 %i.0, 8, !dbg !3279
  br i1 %cmp, label %for.body, label %for.end, !dbg !3281

for.body:                                         ; preds = %for.cond
  %mul = mul i32 8, %i.0, !dbg !3282
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !3283
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !3284
  %0 = load i64, ptr %arrayidx, align 8, !dbg !3284
  call void @store64(ptr noundef %add.ptr, i64 noundef %0) #2, !dbg !3285
  br label %for.inc, !dbg !3285

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !3286
    #dbg_value(i32 %inc, !3275, !DIExpression(), !3266)
  br label %for.cond, !dbg !3287, !llvm.loop !3288

for.end:                                          ; preds = %for.cond
  ret void, !dbg !3290
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_kyber_shake128_absorb(ptr noundef %state, ptr noundef %seed, i8 noundef zeroext %x, i8 noundef zeroext %y) #0 !dbg !3291 {
entry:
  %extseed = alloca [34 x i8], align 1
    #dbg_value(ptr %state, !3301, !DIExpression(), !3302)
    #dbg_value(ptr %seed, !3303, !DIExpression(), !3302)
    #dbg_value(i8 %x, !3304, !DIExpression(), !3302)
    #dbg_value(i8 %y, !3305, !DIExpression(), !3302)
    #dbg_declare(ptr %extseed, !3306, !DIExpression(), !3310)
  %arraydecay = getelementptr inbounds [34 x i8], ptr %extseed, i32 0, i32 0, !dbg !3311
  %call = call ptr @memcpy(ptr noundef %arraydecay, ptr noundef %seed, i32 noundef 32) #2, !dbg !3312
  %arrayidx = getelementptr inbounds [34 x i8], ptr %extseed, i32 0, i32 32, !dbg !3313
  store i8 %x, ptr %arrayidx, align 1, !dbg !3314
  %arrayidx1 = getelementptr inbounds [34 x i8], ptr %extseed, i32 0, i32 33, !dbg !3315
  store i8 %y, ptr %arrayidx1, align 1, !dbg !3316
  %arraydecay2 = getelementptr inbounds [34 x i8], ptr %extseed, i32 0, i32 0, !dbg !3317
  call void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef %arraydecay2, i32 noundef 34) #2, !dbg !3318
  ret void, !dbg !3319
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_kyber_shake256_prf(ptr noundef %out, i32 noundef %outlen, ptr noundef %key, i8 noundef zeroext %nonce) #0 !dbg !3320 {
entry:
  %extkey = alloca [33 x i8], align 1
    #dbg_value(ptr %out, !3323, !DIExpression(), !3324)
    #dbg_value(i32 %outlen, !3325, !DIExpression(), !3324)
    #dbg_value(ptr %key, !3326, !DIExpression(), !3324)
    #dbg_value(i8 %nonce, !3327, !DIExpression(), !3324)
    #dbg_declare(ptr %extkey, !3328, !DIExpression(), !3332)
  %arraydecay = getelementptr inbounds [33 x i8], ptr %extkey, i32 0, i32 0, !dbg !3333
  %call = call ptr @memcpy(ptr noundef %arraydecay, ptr noundef %key, i32 noundef 32) #2, !dbg !3334
  %arrayidx = getelementptr inbounds [33 x i8], ptr %extkey, i32 0, i32 32, !dbg !3335
  store i8 %nonce, ptr %arrayidx, align 1, !dbg !3336
  %arraydecay1 = getelementptr inbounds [33 x i8], ptr %extkey, i32 0, i32 0, !dbg !3337
  call void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef %arraydecay1, i32 noundef 33) #2, !dbg !3338
  ret void, !dbg !3339
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber1024_ref_kyber_shake256_rkprf(ptr noundef %out, ptr noundef %key, ptr noundef %input) #0 !dbg !3340 {
entry:
  %s = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !3341, !DIExpression(), !3342)
    #dbg_value(ptr %key, !3343, !DIExpression(), !3342)
    #dbg_value(ptr %input, !3344, !DIExpression(), !3342)
    #dbg_declare(ptr %s, !3345, !DIExpression(), !3346)
  call void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef %s) #2, !dbg !3347
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef %s, ptr noundef %key, i32 noundef 32) #2, !dbg !3348
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef %s, ptr noundef %input, i32 noundef 1568) #2, !dbg !3349
  call void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef %s) #2, !dbg !3350
  call void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef 32, ptr noundef %s) #2, !dbg !3351
  ret void, !dbg !3352
}

attributes #0 = { noinline nounwind optnone "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-thumb-mode" }
attributes #1 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-thumb-mode" }
attributes #2 = { nobuiltin "no-builtins" }
attributes #3 = { nounwind memory(none) }

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
!126 = !DILocation(line: 107, column: 7, scope: !125)
!127 = !DILocation(line: 108, column: 3, scope: !118)
!128 = !DILocation(line: 102, column: 21, scope: !115)
!129 = !DILocation(line: 102, column: 3, scope: !115)
!130 = distinct !{!130, !116, !131, !132}
!131 = !DILocation(line: 108, column: 3, scope: !112)
!132 = !{!"llvm.loop.mustprogress"}
!133 = !DILocation(line: 110, column: 3, scope: !106)
!134 = !DILocation(line: 111, column: 3, scope: !106)
!135 = !DILocation(line: 112, column: 3, scope: !106)
!136 = !DILocation(line: 114, column: 3, scope: !106)
!137 = !DILocation(line: 115, column: 1, scope: !106)
!138 = distinct !DISubprogram(name: "test_keys", scope: !2, file: !2, line: 9, type: !107, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !49)
!139 = !DILocalVariable(name: "pk", scope: !138, file: !2, line: 11, type: !140)
!140 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 12544, elements: !141)
!141 = !{!142}
!142 = !DISubrange(count: 1568)
!143 = !DILocation(line: 11, column: 11, scope: !138)
!144 = !DILocalVariable(name: "sk", scope: !138, file: !2, line: 12, type: !145)
!145 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 25344, elements: !146)
!146 = !{!147}
!147 = !DISubrange(count: 3168)
!148 = !DILocation(line: 12, column: 11, scope: !138)
!149 = !DILocalVariable(name: "ct", scope: !138, file: !2, line: 13, type: !140)
!150 = !DILocation(line: 13, column: 11, scope: !138)
!151 = !DILocalVariable(name: "key_a", scope: !138, file: !2, line: 14, type: !152)
!152 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 256, elements: !153)
!153 = !{!154}
!154 = !DISubrange(count: 32)
!155 = !DILocation(line: 14, column: 11, scope: !138)
!156 = !DILocalVariable(name: "key_b", scope: !138, file: !2, line: 15, type: !152)
!157 = !DILocation(line: 15, column: 11, scope: !138)
!158 = !DILocation(line: 18, column: 22, scope: !138)
!159 = !DILocation(line: 18, column: 26, scope: !138)
!160 = !DILocation(line: 18, column: 3, scope: !138)
!161 = !DILocation(line: 21, column: 18, scope: !138)
!162 = !DILocation(line: 21, column: 22, scope: !138)
!163 = !DILocation(line: 21, column: 29, scope: !138)
!164 = !DILocation(line: 21, column: 3, scope: !138)
!165 = !DILocation(line: 24, column: 18, scope: !138)
!166 = !DILocation(line: 24, column: 25, scope: !138)
!167 = !DILocation(line: 24, column: 29, scope: !138)
!168 = !DILocation(line: 24, column: 3, scope: !138)
!169 = !DILocation(line: 26, column: 13, scope: !170)
!170 = distinct !DILexicalBlock(scope: !138, file: !2, line: 26, column: 6)
!171 = !DILocation(line: 26, column: 20, scope: !170)
!172 = !DILocation(line: 26, column: 6, scope: !170)
!173 = !DILocation(line: 27, column: 5, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !2, line: 26, column: 42)
!175 = !DILocation(line: 28, column: 5, scope: !174)
!176 = !DILocation(line: 31, column: 3, scope: !138)
!177 = !DILocation(line: 0, scope: !138)
!178 = !DILocation(line: 32, column: 1, scope: !138)
!179 = distinct !DISubprogram(name: "test_invalid_sk_a", scope: !2, file: !2, line: 34, type: !107, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !49)
!180 = !DILocalVariable(name: "pk", scope: !179, file: !2, line: 36, type: !140)
!181 = !DILocation(line: 36, column: 11, scope: !179)
!182 = !DILocalVariable(name: "sk", scope: !179, file: !2, line: 37, type: !145)
!183 = !DILocation(line: 37, column: 11, scope: !179)
!184 = !DILocalVariable(name: "ct", scope: !179, file: !2, line: 38, type: !140)
!185 = !DILocation(line: 38, column: 11, scope: !179)
!186 = !DILocalVariable(name: "key_a", scope: !179, file: !2, line: 39, type: !152)
!187 = !DILocation(line: 39, column: 11, scope: !179)
!188 = !DILocalVariable(name: "key_b", scope: !179, file: !2, line: 40, type: !152)
!189 = !DILocation(line: 40, column: 11, scope: !179)
!190 = !DILocation(line: 43, column: 22, scope: !179)
!191 = !DILocation(line: 43, column: 26, scope: !179)
!192 = !DILocation(line: 43, column: 3, scope: !179)
!193 = !DILocation(line: 46, column: 18, scope: !179)
!194 = !DILocation(line: 46, column: 22, scope: !179)
!195 = !DILocation(line: 46, column: 29, scope: !179)
!196 = !DILocation(line: 46, column: 3, scope: !179)
!197 = !DILocation(line: 49, column: 15, scope: !179)
!198 = !DILocation(line: 49, column: 3, scope: !179)
!199 = !DILocation(line: 52, column: 18, scope: !179)
!200 = !DILocation(line: 52, column: 25, scope: !179)
!201 = !DILocation(line: 52, column: 29, scope: !179)
!202 = !DILocation(line: 52, column: 3, scope: !179)
!203 = !DILocation(line: 54, column: 14, scope: !204)
!204 = distinct !DILexicalBlock(scope: !179, file: !2, line: 54, column: 6)
!205 = !DILocation(line: 54, column: 21, scope: !204)
!206 = !DILocation(line: 54, column: 7, scope: !204)
!207 = !DILocation(line: 54, column: 6, scope: !204)
!208 = !DILocation(line: 55, column: 5, scope: !209)
!209 = distinct !DILexicalBlock(scope: !204, file: !2, line: 54, column: 43)
!210 = !DILocation(line: 56, column: 5, scope: !209)
!211 = !DILocation(line: 59, column: 3, scope: !179)
!212 = !DILocation(line: 0, scope: !179)
!213 = !DILocation(line: 60, column: 1, scope: !179)
!214 = distinct !DISubprogram(name: "test_invalid_ciphertext", scope: !2, file: !2, line: 62, type: !107, scopeLine: 63, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !49)
!215 = !DILocalVariable(name: "pk", scope: !214, file: !2, line: 64, type: !140)
!216 = !DILocation(line: 64, column: 11, scope: !214)
!217 = !DILocalVariable(name: "sk", scope: !214, file: !2, line: 65, type: !145)
!218 = !DILocation(line: 65, column: 11, scope: !214)
!219 = !DILocalVariable(name: "ct", scope: !214, file: !2, line: 66, type: !140)
!220 = !DILocation(line: 66, column: 11, scope: !214)
!221 = !DILocalVariable(name: "key_a", scope: !214, file: !2, line: 67, type: !152)
!222 = !DILocation(line: 67, column: 11, scope: !214)
!223 = !DILocalVariable(name: "key_b", scope: !214, file: !2, line: 68, type: !152)
!224 = !DILocation(line: 68, column: 11, scope: !214)
!225 = !DILocalVariable(name: "b", scope: !214, file: !2, line: 69, type: !33)
!226 = !DILocation(line: 69, column: 11, scope: !214)
!227 = !DILocalVariable(name: "pos", scope: !214, file: !2, line: 70, type: !38)
!228 = !DILocation(line: 70, column: 10, scope: !214)
!229 = !DILocation(line: 72, column: 3, scope: !214)
!230 = !DILocation(line: 73, column: 5, scope: !231)
!231 = distinct !DILexicalBlock(scope: !214, file: !2, line: 72, column: 6)
!232 = !DILocation(line: 74, column: 3, scope: !231)
!233 = !DILocation(line: 74, column: 12, scope: !214)
!234 = !DILocation(line: 74, column: 11, scope: !214)
!235 = distinct !{!235, !229, !236, !132}
!236 = !DILocation(line: 74, column: 13, scope: !214)
!237 = !DILocation(line: 75, column: 3, scope: !214)
!238 = !DILocation(line: 78, column: 22, scope: !214)
!239 = !DILocation(line: 78, column: 26, scope: !214)
!240 = !DILocation(line: 78, column: 3, scope: !214)
!241 = !DILocation(line: 81, column: 18, scope: !214)
!242 = !DILocation(line: 81, column: 22, scope: !214)
!243 = !DILocation(line: 81, column: 29, scope: !214)
!244 = !DILocation(line: 81, column: 3, scope: !214)
!245 = !DILocation(line: 84, column: 39, scope: !214)
!246 = !DILocation(line: 84, column: 6, scope: !214)
!247 = !DILocation(line: 84, column: 10, scope: !214)
!248 = !DILocation(line: 84, column: 3, scope: !214)
!249 = !DILocation(line: 84, column: 36, scope: !214)
!250 = !DILocation(line: 87, column: 18, scope: !214)
!251 = !DILocation(line: 87, column: 25, scope: !214)
!252 = !DILocation(line: 87, column: 29, scope: !214)
!253 = !DILocation(line: 87, column: 3, scope: !214)
!254 = !DILocation(line: 89, column: 14, scope: !255)
!255 = distinct !DILexicalBlock(scope: !214, file: !2, line: 89, column: 6)
!256 = !DILocation(line: 89, column: 21, scope: !255)
!257 = !DILocation(line: 89, column: 7, scope: !255)
!258 = !DILocation(line: 89, column: 6, scope: !255)
!259 = !DILocation(line: 90, column: 5, scope: !260)
!260 = distinct !DILexicalBlock(scope: !255, file: !2, line: 89, column: 43)
!261 = !DILocation(line: 91, column: 5, scope: !260)
!262 = !DILocation(line: 94, column: 3, scope: !214)
!263 = !DILocation(line: 0, scope: !214)
!264 = !DILocation(line: 95, column: 1, scope: !214)
!265 = !DILocalVariable(name: "out", arg: 1, scope: !28, file: !29, line: 74, type: !32)
!266 = !DILocation(line: 0, scope: !28)
!267 = !DILocalVariable(name: "outlen", arg: 2, scope: !28, file: !29, line: 74, type: !38)
!268 = !DILocation(line: 78, column: 3, scope: !28)
!269 = !DILocation(line: 78, column: 9, scope: !28)
!270 = !DILocation(line: 78, column: 12, scope: !28)
!271 = !DILocation(line: 79, column: 10, scope: !272)
!272 = distinct !DILexicalBlock(scope: !28, file: !29, line: 78, column: 19)
!273 = !DILocation(line: 79, column: 8, scope: !272)
!274 = !DILocation(line: 80, column: 8, scope: !275)
!275 = distinct !DILexicalBlock(scope: !272, file: !29, line: 80, column: 8)
!276 = !DILocation(line: 80, column: 11, scope: !275)
!277 = !DILocation(line: 80, column: 17, scope: !275)
!278 = !DILocation(line: 80, column: 20, scope: !275)
!279 = !DILocation(line: 80, column: 26, scope: !275)
!280 = !DILocation(line: 81, column: 7, scope: !275)
!281 = distinct !{!281, !268, !282, !132}
!282 = !DILocation(line: 84, column: 3, scope: !28)
!283 = !DILocation(line: 82, column: 13, scope: !284)
!284 = distinct !DILexicalBlock(scope: !275, file: !29, line: 82, column: 13)
!285 = !DILocation(line: 82, column: 16, scope: !284)
!286 = !DILocation(line: 83, column: 7, scope: !284)
!287 = !DILocation(line: 86, column: 3, scope: !28)
!288 = !DILocation(line: 86, column: 16, scope: !28)
!289 = !DILocation(line: 87, column: 16, scope: !290)
!290 = distinct !DILexicalBlock(scope: !28, file: !29, line: 86, column: 21)
!291 = !DILocation(line: 87, column: 11, scope: !290)
!292 = !DILocalVariable(name: "ret", scope: !28, file: !29, line: 76, type: !293)
!293 = !DIDerivedType(tag: DW_TAG_typedef, name: "ssize_t", file: !294, line: 182, baseType: !295)
!294 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/sys/types.h", directory: "")
!295 = !DIDerivedType(tag: DW_TAG_typedef, name: "_ssize_t", file: !296, line: 147, baseType: !50)
!296 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/sys/_types.h", directory: "")
!297 = !DILocation(line: 88, column: 12, scope: !298)
!298 = distinct !DILexicalBlock(scope: !290, file: !29, line: 88, column: 8)
!299 = !DILocation(line: 88, column: 18, scope: !298)
!300 = !DILocation(line: 88, column: 21, scope: !298)
!301 = !DILocation(line: 88, column: 27, scope: !298)
!302 = !DILocation(line: 89, column: 7, scope: !298)
!303 = distinct !{!303, !287, !304, !132}
!304 = !DILocation(line: 95, column: 3, scope: !28)
!305 = !DILocation(line: 90, column: 17, scope: !306)
!306 = distinct !DILexicalBlock(scope: !298, file: !29, line: 90, column: 13)
!307 = !DILocation(line: 91, column: 7, scope: !306)
!308 = !DILocation(line: 93, column: 9, scope: !290)
!309 = !DILocation(line: 94, column: 12, scope: !290)
!310 = !DILocation(line: 96, column: 1, scope: !28)
!311 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_keypair_derand", scope: !312, file: !312, line: 25, type: !313, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !83, retainedNodes: !49)
!312 = !DIFile(filename: "../../ref/kem.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!313 = !DISubroutineType(types: !314)
!314 = !{!50, !32, !32, !315}
!315 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !316, size: 32)
!316 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !33)
!317 = !DILocalVariable(name: "pk", arg: 1, scope: !311, file: !312, line: 25, type: !32)
!318 = !DILocation(line: 0, scope: !311)
!319 = !DILocalVariable(name: "sk", arg: 2, scope: !311, file: !312, line: 26, type: !32)
!320 = !DILocalVariable(name: "coins", arg: 3, scope: !311, file: !312, line: 27, type: !315)
!321 = !DILocation(line: 29, column: 3, scope: !311)
!322 = !DILocation(line: 30, column: 12, scope: !311)
!323 = !DILocation(line: 30, column: 3, scope: !311)
!324 = !DILocation(line: 31, column: 3, scope: !311)
!325 = !DILocation(line: 33, column: 12, scope: !311)
!326 = !DILocation(line: 33, column: 33, scope: !311)
!327 = !DILocation(line: 33, column: 55, scope: !311)
!328 = !DILocation(line: 33, column: 3, scope: !311)
!329 = !DILocation(line: 34, column: 3, scope: !311)
!330 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_keypair", scope: !312, file: !312, line: 50, type: !331, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !83, retainedNodes: !49)
!331 = !DISubroutineType(types: !332)
!332 = !{!50, !32, !32}
!333 = !DILocalVariable(name: "pk", arg: 1, scope: !330, file: !312, line: 50, type: !32)
!334 = !DILocation(line: 0, scope: !330)
!335 = !DILocalVariable(name: "sk", arg: 2, scope: !330, file: !312, line: 51, type: !32)
!336 = !DILocalVariable(name: "coins", scope: !330, file: !312, line: 53, type: !337)
!337 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 512, elements: !338)
!338 = !{!339}
!339 = !DISubrange(count: 64)
!340 = !DILocation(line: 53, column: 11, scope: !330)
!341 = !DILocation(line: 54, column: 15, scope: !330)
!342 = !DILocation(line: 54, column: 3, scope: !330)
!343 = !DILocation(line: 55, column: 37, scope: !330)
!344 = !DILocation(line: 55, column: 3, scope: !330)
!345 = !DILocation(line: 56, column: 3, scope: !330)
!346 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_enc_derand", scope: !312, file: !312, line: 76, type: !347, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !83, retainedNodes: !49)
!347 = !DISubroutineType(types: !348)
!348 = !{!50, !32, !32, !315, !315}
!349 = !DILocalVariable(name: "ct", arg: 1, scope: !346, file: !312, line: 76, type: !32)
!350 = !DILocation(line: 0, scope: !346)
!351 = !DILocalVariable(name: "ss", arg: 2, scope: !346, file: !312, line: 77, type: !32)
!352 = !DILocalVariable(name: "pk", arg: 3, scope: !346, file: !312, line: 78, type: !315)
!353 = !DILocalVariable(name: "coins", arg: 4, scope: !346, file: !312, line: 79, type: !315)
!354 = !DILocalVariable(name: "buf", scope: !346, file: !312, line: 81, type: !337)
!355 = !DILocation(line: 81, column: 11, scope: !346)
!356 = !DILocalVariable(name: "kr", scope: !346, file: !312, line: 83, type: !337)
!357 = !DILocation(line: 83, column: 11, scope: !346)
!358 = !DILocation(line: 85, column: 10, scope: !346)
!359 = !DILocation(line: 85, column: 3, scope: !346)
!360 = !DILocation(line: 88, column: 3, scope: !346)
!361 = !DILocation(line: 89, column: 3, scope: !346)
!362 = !DILocation(line: 92, column: 18, scope: !346)
!363 = !DILocation(line: 92, column: 27, scope: !346)
!364 = !DILocation(line: 92, column: 29, scope: !346)
!365 = !DILocation(line: 92, column: 3, scope: !346)
!366 = !DILocation(line: 94, column: 13, scope: !346)
!367 = !DILocation(line: 94, column: 3, scope: !346)
!368 = !DILocation(line: 95, column: 3, scope: !346)
!369 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_enc", scope: !312, file: !312, line: 113, type: !313, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !83, retainedNodes: !49)
!370 = !DILocalVariable(name: "ct", arg: 1, scope: !369, file: !312, line: 113, type: !32)
!371 = !DILocation(line: 0, scope: !369)
!372 = !DILocalVariable(name: "ss", arg: 2, scope: !369, file: !312, line: 114, type: !32)
!373 = !DILocalVariable(name: "pk", arg: 3, scope: !369, file: !312, line: 115, type: !315)
!374 = !DILocalVariable(name: "coins", scope: !369, file: !312, line: 117, type: !152)
!375 = !DILocation(line: 117, column: 11, scope: !369)
!376 = !DILocation(line: 118, column: 15, scope: !369)
!377 = !DILocation(line: 118, column: 3, scope: !369)
!378 = !DILocation(line: 119, column: 37, scope: !369)
!379 = !DILocation(line: 119, column: 3, scope: !369)
!380 = !DILocation(line: 120, column: 3, scope: !369)
!381 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_dec", scope: !312, file: !312, line: 140, type: !382, scopeLine: 143, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !83, retainedNodes: !49)
!382 = !DISubroutineType(types: !383)
!383 = !{!50, !32, !315, !315}
!384 = !DILocalVariable(name: "ss", arg: 1, scope: !381, file: !312, line: 140, type: !32)
!385 = !DILocation(line: 0, scope: !381)
!386 = !DILocalVariable(name: "ct", arg: 2, scope: !381, file: !312, line: 141, type: !315)
!387 = !DILocalVariable(name: "sk", arg: 3, scope: !381, file: !312, line: 142, type: !315)
!388 = !DILocalVariable(name: "buf", scope: !381, file: !312, line: 145, type: !337)
!389 = !DILocation(line: 145, column: 11, scope: !381)
!390 = !DILocalVariable(name: "kr", scope: !381, file: !312, line: 147, type: !337)
!391 = !DILocation(line: 147, column: 11, scope: !381)
!392 = !DILocalVariable(name: "cmp", scope: !381, file: !312, line: 149, type: !140)
!393 = !DILocation(line: 149, column: 11, scope: !381)
!394 = !DILocation(line: 150, column: 25, scope: !381)
!395 = !DILocalVariable(name: "pk", scope: !381, file: !312, line: 150, type: !315)
!396 = !DILocation(line: 152, column: 14, scope: !381)
!397 = !DILocation(line: 152, column: 3, scope: !381)
!398 = !DILocation(line: 155, column: 10, scope: !381)
!399 = !DILocation(line: 155, column: 13, scope: !381)
!400 = !DILocation(line: 155, column: 32, scope: !381)
!401 = !DILocation(line: 155, column: 53, scope: !381)
!402 = !DILocation(line: 155, column: 3, scope: !381)
!403 = !DILocation(line: 156, column: 3, scope: !381)
!404 = !DILocation(line: 159, column: 14, scope: !381)
!405 = !DILocation(line: 159, column: 19, scope: !381)
!406 = !DILocation(line: 159, column: 28, scope: !381)
!407 = !DILocation(line: 159, column: 30, scope: !381)
!408 = !DILocation(line: 159, column: 3, scope: !381)
!409 = !DILocation(line: 161, column: 21, scope: !381)
!410 = !DILocation(line: 161, column: 10, scope: !381)
!411 = !DILocalVariable(name: "fail", scope: !381, file: !312, line: 144, type: !50)
!412 = !DILocation(line: 164, column: 3, scope: !381)
!413 = !DILocation(line: 167, column: 11, scope: !381)
!414 = !DILocation(line: 167, column: 29, scope: !381)
!415 = !DILocation(line: 167, column: 3, scope: !381)
!416 = !DILocation(line: 169, column: 3, scope: !381)
!417 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_gen_matrix", scope: !418, file: !418, line: 165, type: !419, scopeLine: 166, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !49)
!418 = !DIFile(filename: "../../ref/indcpa.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!419 = !DISubroutineType(types: !420)
!420 = !{null, !421, !315, !50}
!421 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !422, size: 32)
!422 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyvec", file: !423, line: 10, baseType: !424)
!423 = !DIFile(filename: "../../ref/polyvec.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!424 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !423, line: 8, size: 16384, elements: !425)
!425 = !{!426}
!426 = !DIDerivedType(tag: DW_TAG_member, name: "vec", scope: !424, file: !423, line: 9, baseType: !427, size: 16384)
!427 = !DICompositeType(tag: DW_TAG_array_type, baseType: !428, size: 16384, elements: !436)
!428 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !429, line: 13, baseType: !430)
!429 = !DIFile(filename: "../../ref/poly.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!430 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !429, line: 11, size: 4096, elements: !431)
!431 = !{!432}
!432 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !430, file: !429, line: 12, baseType: !433, size: 4096)
!433 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 4096, elements: !434)
!434 = !{!435}
!435 = !DISubrange(count: 256)
!436 = !{!437}
!437 = !DISubrange(count: 4)
!438 = !DILocalVariable(name: "a", arg: 1, scope: !417, file: !418, line: 165, type: !421)
!439 = !DILocation(line: 0, scope: !417)
!440 = !DILocalVariable(name: "seed", arg: 2, scope: !417, file: !418, line: 165, type: !315)
!441 = !DILocalVariable(name: "transposed", arg: 3, scope: !417, file: !418, line: 165, type: !50)
!442 = !DILocalVariable(name: "buf", scope: !417, file: !418, line: 169, type: !443)
!443 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 4032, elements: !444)
!444 = !{!445}
!445 = !DISubrange(count: 504)
!446 = !DILocation(line: 169, column: 11, scope: !417)
!447 = !DILocalVariable(name: "state", scope: !417, file: !418, line: 170, type: !448)
!448 = !DIDerivedType(tag: DW_TAG_typedef, name: "xof_state", file: !449, line: 10, baseType: !450)
!449 = !DIFile(filename: "../../ref/symmetric.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!450 = !DIDerivedType(tag: DW_TAG_typedef, name: "keccak_state", file: !451, line: 17, baseType: !452)
!451 = !DIFile(filename: "../../ref/fips202.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!452 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !451, line: 14, size: 1664, elements: !453)
!453 = !{!454, !458}
!454 = !DIDerivedType(tag: DW_TAG_member, name: "s", scope: !452, file: !451, line: 15, baseType: !455, size: 1600)
!455 = !DICompositeType(tag: DW_TAG_array_type, baseType: !70, size: 1600, elements: !456)
!456 = !{!457}
!457 = !DISubrange(count: 25)
!458 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !452, file: !451, line: 16, baseType: !40, size: 32, offset: 1600)
!459 = !DILocation(line: 170, column: 13, scope: !417)
!460 = !DILocalVariable(name: "i", scope: !417, file: !418, line: 167, type: !40)
!461 = !DILocation(line: 172, column: 7, scope: !462)
!462 = distinct !DILexicalBlock(scope: !417, file: !418, line: 172, column: 3)
!463 = !DILocation(line: 172, scope: !462)
!464 = !DILocation(line: 172, column: 12, scope: !465)
!465 = distinct !DILexicalBlock(scope: !462, file: !418, line: 172, column: 3)
!466 = !DILocation(line: 172, column: 3, scope: !462)
!467 = !DILocalVariable(name: "j", scope: !417, file: !418, line: 167, type: !40)
!468 = !DILocation(line: 173, column: 9, scope: !469)
!469 = distinct !DILexicalBlock(scope: !470, file: !418, line: 173, column: 5)
!470 = distinct !DILexicalBlock(scope: !465, file: !418, line: 172, column: 26)
!471 = !DILocation(line: 173, scope: !469)
!472 = !DILocation(line: 173, column: 14, scope: !473)
!473 = distinct !DILexicalBlock(scope: !469, file: !418, line: 173, column: 5)
!474 = !DILocation(line: 173, column: 5, scope: !469)
!475 = !DILocation(line: 174, column: 10, scope: !476)
!476 = distinct !DILexicalBlock(scope: !477, file: !418, line: 174, column: 10)
!477 = distinct !DILexicalBlock(scope: !473, file: !418, line: 173, column: 28)
!478 = !DILocation(line: 175, column: 9, scope: !476)
!479 = !DILocation(line: 177, column: 9, scope: !476)
!480 = !DILocation(line: 179, column: 7, scope: !477)
!481 = !DILocalVariable(name: "buflen", scope: !417, file: !418, line: 168, type: !40)
!482 = !DILocation(line: 181, column: 25, scope: !477)
!483 = !DILocation(line: 181, column: 30, scope: !477)
!484 = !DILocation(line: 181, column: 37, scope: !477)
!485 = !DILocation(line: 181, column: 54, scope: !477)
!486 = !DILocation(line: 181, column: 13, scope: !477)
!487 = !DILocalVariable(name: "ctr", scope: !417, file: !418, line: 167, type: !40)
!488 = !DILocation(line: 183, column: 7, scope: !477)
!489 = !DILocation(line: 0, scope: !477)
!490 = !DILocation(line: 183, column: 17, scope: !477)
!491 = !DILocation(line: 184, column: 9, scope: !492)
!492 = distinct !DILexicalBlock(scope: !477, file: !418, line: 183, column: 28)
!493 = !DILocation(line: 186, column: 28, scope: !492)
!494 = !DILocation(line: 186, column: 33, scope: !492)
!495 = !DILocation(line: 186, column: 40, scope: !492)
!496 = !DILocation(line: 186, column: 47, scope: !492)
!497 = !DILocation(line: 186, column: 62, scope: !492)
!498 = !DILocation(line: 186, column: 69, scope: !492)
!499 = !DILocation(line: 186, column: 16, scope: !492)
!500 = !DILocation(line: 186, column: 13, scope: !492)
!501 = distinct !{!501, !488, !502, !132}
!502 = !DILocation(line: 187, column: 7, scope: !477)
!503 = !DILocation(line: 188, column: 5, scope: !477)
!504 = !DILocation(line: 173, column: 24, scope: !473)
!505 = !DILocation(line: 173, column: 5, scope: !473)
!506 = distinct !{!506, !474, !507, !132}
!507 = !DILocation(line: 188, column: 5, scope: !469)
!508 = !DILocation(line: 189, column: 3, scope: !470)
!509 = !DILocation(line: 172, column: 22, scope: !465)
!510 = !DILocation(line: 172, column: 3, scope: !465)
!511 = distinct !{!511, !466, !512, !132}
!512 = !DILocation(line: 189, column: 3, scope: !462)
!513 = !DILocation(line: 190, column: 1, scope: !417)
!514 = distinct !DISubprogram(name: "rej_uniform", scope: !418, file: !418, line: 121, type: !515, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!515 = !DISubroutineType(types: !516)
!516 = !{!40, !517, !40, !315, !40}
!517 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 32)
!518 = !DILocalVariable(name: "r", arg: 1, scope: !514, file: !418, line: 121, type: !517)
!519 = !DILocation(line: 0, scope: !514)
!520 = !DILocalVariable(name: "len", arg: 2, scope: !514, file: !418, line: 122, type: !40)
!521 = !DILocalVariable(name: "buf", arg: 3, scope: !514, file: !418, line: 123, type: !315)
!522 = !DILocalVariable(name: "buflen", arg: 4, scope: !514, file: !418, line: 124, type: !40)
!523 = !DILocalVariable(name: "pos", scope: !514, file: !418, line: 126, type: !40)
!524 = !DILocalVariable(name: "ctr", scope: !514, file: !418, line: 126, type: !40)
!525 = !DILocation(line: 130, column: 3, scope: !514)
!526 = !DILocation(line: 130, column: 13, scope: !514)
!527 = !DILocation(line: 130, column: 19, scope: !514)
!528 = !DILocation(line: 130, column: 26, scope: !514)
!529 = !DILocation(line: 130, column: 30, scope: !514)
!530 = !DILocation(line: 131, column: 21, scope: !531)
!531 = distinct !DILexicalBlock(scope: !514, file: !418, line: 130, column: 41)
!532 = !DILocation(line: 131, column: 14, scope: !531)
!533 = !DILocation(line: 131, column: 25, scope: !531)
!534 = !DILocation(line: 131, column: 51, scope: !531)
!535 = !DILocation(line: 131, column: 44, scope: !531)
!536 = !DILocation(line: 131, column: 34, scope: !531)
!537 = !DILocation(line: 131, column: 55, scope: !531)
!538 = !DILocation(line: 131, column: 31, scope: !531)
!539 = !DILocation(line: 131, column: 62, scope: !531)
!540 = !DILocation(line: 131, column: 12, scope: !531)
!541 = !DILocalVariable(name: "val0", scope: !514, file: !418, line: 127, type: !86)
!542 = !DILocation(line: 132, column: 21, scope: !531)
!543 = !DILocation(line: 132, column: 14, scope: !531)
!544 = !DILocation(line: 132, column: 25, scope: !531)
!545 = !DILocation(line: 132, column: 51, scope: !531)
!546 = !DILocation(line: 132, column: 44, scope: !531)
!547 = !DILocation(line: 132, column: 34, scope: !531)
!548 = !DILocation(line: 132, column: 55, scope: !531)
!549 = !DILocation(line: 132, column: 31, scope: !531)
!550 = !DILocation(line: 132, column: 62, scope: !531)
!551 = !DILocation(line: 132, column: 12, scope: !531)
!552 = !DILocalVariable(name: "val1", scope: !514, file: !418, line: 127, type: !86)
!553 = !DILocation(line: 133, column: 9, scope: !531)
!554 = !DILocation(line: 135, column: 8, scope: !555)
!555 = distinct !DILexicalBlock(scope: !531, file: !418, line: 135, column: 8)
!556 = !DILocation(line: 135, column: 13, scope: !555)
!557 = !DILocation(line: 136, column: 12, scope: !555)
!558 = !DILocation(line: 136, column: 7, scope: !555)
!559 = !DILocation(line: 136, column: 16, scope: !555)
!560 = !DILocation(line: 137, column: 12, scope: !561)
!561 = distinct !DILexicalBlock(scope: !531, file: !418, line: 137, column: 8)
!562 = !DILocation(line: 137, column: 18, scope: !561)
!563 = !DILocation(line: 137, column: 21, scope: !561)
!564 = !DILocation(line: 137, column: 26, scope: !561)
!565 = !DILocation(line: 138, column: 12, scope: !561)
!566 = !DILocation(line: 138, column: 7, scope: !561)
!567 = !DILocation(line: 138, column: 16, scope: !561)
!568 = !DILocation(line: 0, scope: !531)
!569 = distinct !{!569, !525, !570, !132}
!570 = !DILocation(line: 139, column: 3, scope: !514)
!571 = !DILocation(line: 141, column: 3, scope: !514)
!572 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_indcpa_keypair_derand", scope: !418, file: !418, line: 205, type: !573, scopeLine: 208, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !49)
!573 = !DISubroutineType(types: !574)
!574 = !{null, !32, !32, !315}
!575 = !DILocalVariable(name: "pk", arg: 1, scope: !572, file: !418, line: 205, type: !32)
!576 = !DILocation(line: 0, scope: !572)
!577 = !DILocalVariable(name: "sk", arg: 2, scope: !572, file: !418, line: 206, type: !32)
!578 = !DILocalVariable(name: "coins", arg: 3, scope: !572, file: !418, line: 207, type: !315)
!579 = !DILocalVariable(name: "buf", scope: !572, file: !418, line: 210, type: !337)
!580 = !DILocation(line: 210, column: 11, scope: !572)
!581 = !DILocation(line: 211, column: 31, scope: !572)
!582 = !DILocalVariable(name: "publicseed", scope: !572, file: !418, line: 211, type: !315)
!583 = !DILocation(line: 212, column: 30, scope: !572)
!584 = !DILocation(line: 212, column: 33, scope: !572)
!585 = !DILocalVariable(name: "noiseseed", scope: !572, file: !418, line: 212, type: !315)
!586 = !DILocalVariable(name: "nonce", scope: !572, file: !418, line: 213, type: !33)
!587 = !DILocalVariable(name: "a", scope: !572, file: !418, line: 214, type: !588)
!588 = !DICompositeType(tag: DW_TAG_array_type, baseType: !422, size: 65536, elements: !436)
!589 = !DILocation(line: 214, column: 11, scope: !572)
!590 = !DILocalVariable(name: "e", scope: !572, file: !418, line: 214, type: !422)
!591 = !DILocation(line: 214, column: 23, scope: !572)
!592 = !DILocalVariable(name: "pkpv", scope: !572, file: !418, line: 214, type: !422)
!593 = !DILocation(line: 214, column: 26, scope: !572)
!594 = !DILocalVariable(name: "skpv", scope: !572, file: !418, line: 214, type: !422)
!595 = !DILocation(line: 214, column: 32, scope: !572)
!596 = !DILocation(line: 216, column: 10, scope: !572)
!597 = !DILocation(line: 216, column: 3, scope: !572)
!598 = !DILocation(line: 217, column: 3, scope: !572)
!599 = !DILocation(line: 217, column: 23, scope: !572)
!600 = !DILocation(line: 218, column: 3, scope: !572)
!601 = !DILocation(line: 220, column: 3, scope: !572)
!602 = !DILocalVariable(name: "i", scope: !572, file: !418, line: 209, type: !40)
!603 = !DILocation(line: 222, column: 7, scope: !604)
!604 = distinct !DILexicalBlock(scope: !572, file: !418, line: 222, column: 3)
!605 = !DILocation(line: 222, scope: !604)
!606 = !DILocation(line: 222, column: 12, scope: !607)
!607 = distinct !DILexicalBlock(scope: !604, file: !418, line: 222, column: 3)
!608 = !DILocation(line: 222, column: 3, scope: !604)
!609 = !DILocation(line: 223, column: 30, scope: !607)
!610 = !DILocation(line: 223, column: 25, scope: !607)
!611 = !DILocation(line: 223, column: 54, scope: !607)
!612 = !DILocation(line: 223, column: 5, scope: !607)
!613 = !DILocation(line: 222, column: 22, scope: !607)
!614 = !DILocation(line: 222, column: 3, scope: !607)
!615 = distinct !{!615, !608, !616, !132}
!616 = !DILocation(line: 223, column: 56, scope: !604)
!617 = !DILocation(line: 224, column: 7, scope: !618)
!618 = distinct !DILexicalBlock(scope: !572, file: !418, line: 224, column: 3)
!619 = !DILocation(line: 224, scope: !618)
!620 = !DILocation(line: 224, column: 12, scope: !621)
!621 = distinct !DILexicalBlock(scope: !618, file: !418, line: 224, column: 3)
!622 = !DILocation(line: 224, column: 3, scope: !618)
!623 = !DILocation(line: 225, column: 27, scope: !621)
!624 = !DILocation(line: 225, column: 25, scope: !621)
!625 = !DILocation(line: 225, column: 51, scope: !621)
!626 = !DILocation(line: 225, column: 5, scope: !621)
!627 = !DILocation(line: 224, column: 22, scope: !621)
!628 = !DILocation(line: 224, column: 3, scope: !621)
!629 = distinct !{!629, !622, !630, !132}
!630 = !DILocation(line: 225, column: 53, scope: !618)
!631 = !DILocation(line: 227, column: 3, scope: !572)
!632 = !DILocation(line: 228, column: 3, scope: !572)
!633 = !DILocation(line: 231, column: 7, scope: !634)
!634 = distinct !DILexicalBlock(scope: !572, file: !418, line: 231, column: 3)
!635 = !DILocation(line: 231, scope: !634)
!636 = !DILocation(line: 231, column: 12, scope: !637)
!637 = distinct !DILexicalBlock(scope: !634, file: !418, line: 231, column: 3)
!638 = !DILocation(line: 231, column: 3, scope: !634)
!639 = !DILocation(line: 232, column: 42, scope: !640)
!640 = distinct !DILexicalBlock(scope: !637, file: !418, line: 231, column: 26)
!641 = !DILocation(line: 232, column: 37, scope: !640)
!642 = !DILocation(line: 232, column: 51, scope: !640)
!643 = !DILocation(line: 232, column: 5, scope: !640)
!644 = !DILocation(line: 233, column: 23, scope: !640)
!645 = !DILocation(line: 233, column: 18, scope: !640)
!646 = !DILocation(line: 233, column: 5, scope: !640)
!647 = !DILocation(line: 234, column: 3, scope: !640)
!648 = !DILocation(line: 231, column: 22, scope: !637)
!649 = !DILocation(line: 231, column: 3, scope: !637)
!650 = distinct !{!650, !638, !651, !132}
!651 = !DILocation(line: 234, column: 3, scope: !634)
!652 = !DILocation(line: 236, column: 3, scope: !572)
!653 = !DILocation(line: 237, column: 3, scope: !572)
!654 = !DILocation(line: 239, column: 3, scope: !572)
!655 = !DILocation(line: 240, column: 3, scope: !572)
!656 = !DILocation(line: 241, column: 1, scope: !572)
!657 = distinct !DISubprogram(name: "pack_sk", scope: !418, file: !418, line: 57, type: !658, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!658 = !DISubroutineType(types: !659)
!659 = !{null, !32, !421}
!660 = !DILocalVariable(name: "r", arg: 1, scope: !657, file: !418, line: 57, type: !32)
!661 = !DILocation(line: 0, scope: !657)
!662 = !DILocalVariable(name: "sk", arg: 2, scope: !657, file: !418, line: 57, type: !421)
!663 = !DILocation(line: 59, column: 3, scope: !657)
!664 = !DILocation(line: 60, column: 1, scope: !657)
!665 = distinct !DISubprogram(name: "pack_pk", scope: !418, file: !418, line: 23, type: !666, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!666 = !DISubroutineType(types: !667)
!667 = !{null, !32, !421, !315}
!668 = !DILocalVariable(name: "r", arg: 1, scope: !665, file: !418, line: 23, type: !32)
!669 = !DILocation(line: 0, scope: !665)
!670 = !DILocalVariable(name: "pk", arg: 2, scope: !665, file: !418, line: 24, type: !421)
!671 = !DILocalVariable(name: "seed", arg: 3, scope: !665, file: !418, line: 25, type: !315)
!672 = !DILocation(line: 27, column: 3, scope: !665)
!673 = !DILocation(line: 28, column: 11, scope: !665)
!674 = !DILocation(line: 28, column: 3, scope: !665)
!675 = !DILocation(line: 29, column: 1, scope: !665)
!676 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_indcpa_enc", scope: !418, file: !418, line: 260, type: !677, scopeLine: 264, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !49)
!677 = !DISubroutineType(types: !678)
!678 = !{null, !32, !315, !315, !315}
!679 = !DILocalVariable(name: "c", arg: 1, scope: !676, file: !418, line: 260, type: !32)
!680 = !DILocation(line: 0, scope: !676)
!681 = !DILocalVariable(name: "m", arg: 2, scope: !676, file: !418, line: 261, type: !315)
!682 = !DILocalVariable(name: "pk", arg: 3, scope: !676, file: !418, line: 262, type: !315)
!683 = !DILocalVariable(name: "coins", arg: 4, scope: !676, file: !418, line: 263, type: !315)
!684 = !DILocalVariable(name: "seed", scope: !676, file: !418, line: 266, type: !152)
!685 = !DILocation(line: 266, column: 11, scope: !676)
!686 = !DILocalVariable(name: "nonce", scope: !676, file: !418, line: 267, type: !33)
!687 = !DILocalVariable(name: "sp", scope: !676, file: !418, line: 268, type: !422)
!688 = !DILocation(line: 268, column: 11, scope: !676)
!689 = !DILocalVariable(name: "pkpv", scope: !676, file: !418, line: 268, type: !422)
!690 = !DILocation(line: 268, column: 15, scope: !676)
!691 = !DILocalVariable(name: "ep", scope: !676, file: !418, line: 268, type: !422)
!692 = !DILocation(line: 268, column: 21, scope: !676)
!693 = !DILocalVariable(name: "at", scope: !676, file: !418, line: 268, type: !588)
!694 = !DILocation(line: 268, column: 25, scope: !676)
!695 = !DILocalVariable(name: "b", scope: !676, file: !418, line: 268, type: !422)
!696 = !DILocation(line: 268, column: 38, scope: !676)
!697 = !DILocalVariable(name: "v", scope: !676, file: !418, line: 269, type: !428)
!698 = !DILocation(line: 269, column: 8, scope: !676)
!699 = !DILocalVariable(name: "k", scope: !676, file: !418, line: 269, type: !428)
!700 = !DILocation(line: 269, column: 11, scope: !676)
!701 = !DILocalVariable(name: "epp", scope: !676, file: !418, line: 269, type: !428)
!702 = !DILocation(line: 269, column: 14, scope: !676)
!703 = !DILocation(line: 271, column: 20, scope: !676)
!704 = !DILocation(line: 271, column: 3, scope: !676)
!705 = !DILocation(line: 272, column: 3, scope: !676)
!706 = !DILocation(line: 273, column: 3, scope: !676)
!707 = !DILocalVariable(name: "i", scope: !676, file: !418, line: 265, type: !40)
!708 = !DILocation(line: 275, column: 7, scope: !709)
!709 = distinct !DILexicalBlock(scope: !676, file: !418, line: 275, column: 3)
!710 = !DILocation(line: 275, scope: !709)
!711 = !DILocation(line: 275, column: 12, scope: !712)
!712 = distinct !DILexicalBlock(scope: !709, file: !418, line: 275, column: 3)
!713 = !DILocation(line: 275, column: 3, scope: !709)
!714 = !DILocation(line: 276, column: 27, scope: !712)
!715 = !DILocation(line: 276, column: 24, scope: !712)
!716 = !DILocation(line: 276, column: 30, scope: !712)
!717 = !DILocation(line: 276, column: 46, scope: !712)
!718 = !DILocation(line: 276, column: 5, scope: !712)
!719 = !DILocation(line: 275, column: 22, scope: !712)
!720 = !DILocation(line: 275, column: 3, scope: !712)
!721 = distinct !{!721, !713, !722, !132}
!722 = !DILocation(line: 276, column: 48, scope: !709)
!723 = !DILocation(line: 277, column: 7, scope: !724)
!724 = distinct !DILexicalBlock(scope: !676, file: !418, line: 277, column: 3)
!725 = !DILocation(line: 277, scope: !724)
!726 = !DILocation(line: 277, column: 12, scope: !727)
!727 = distinct !DILexicalBlock(scope: !724, file: !418, line: 277, column: 3)
!728 = !DILocation(line: 277, column: 3, scope: !724)
!729 = !DILocation(line: 278, column: 27, scope: !727)
!730 = !DILocation(line: 278, column: 24, scope: !727)
!731 = !DILocation(line: 278, column: 30, scope: !727)
!732 = !DILocation(line: 278, column: 46, scope: !727)
!733 = !DILocation(line: 278, column: 5, scope: !727)
!734 = !DILocation(line: 277, column: 22, scope: !727)
!735 = !DILocation(line: 277, column: 3, scope: !727)
!736 = distinct !{!736, !728, !737, !132}
!737 = !DILocation(line: 278, column: 48, scope: !724)
!738 = !DILocation(line: 279, column: 40, scope: !676)
!739 = !DILocation(line: 279, column: 3, scope: !676)
!740 = !DILocation(line: 281, column: 3, scope: !676)
!741 = !DILocation(line: 284, column: 7, scope: !742)
!742 = distinct !DILexicalBlock(scope: !676, file: !418, line: 284, column: 3)
!743 = !DILocation(line: 284, scope: !742)
!744 = !DILocation(line: 284, column: 12, scope: !745)
!745 = distinct !DILexicalBlock(scope: !742, file: !418, line: 284, column: 3)
!746 = !DILocation(line: 284, column: 3, scope: !742)
!747 = !DILocation(line: 285, column: 39, scope: !745)
!748 = !DILocation(line: 285, column: 37, scope: !745)
!749 = !DILocation(line: 285, column: 48, scope: !745)
!750 = !DILocation(line: 285, column: 5, scope: !745)
!751 = !DILocation(line: 284, column: 22, scope: !745)
!752 = !DILocation(line: 284, column: 3, scope: !745)
!753 = distinct !{!753, !746, !754, !132}
!754 = !DILocation(line: 285, column: 58, scope: !742)
!755 = !DILocation(line: 287, column: 3, scope: !676)
!756 = !DILocation(line: 289, column: 3, scope: !676)
!757 = !DILocation(line: 290, column: 3, scope: !676)
!758 = !DILocation(line: 292, column: 3, scope: !676)
!759 = !DILocation(line: 293, column: 3, scope: !676)
!760 = !DILocation(line: 294, column: 3, scope: !676)
!761 = !DILocation(line: 295, column: 3, scope: !676)
!762 = !DILocation(line: 296, column: 3, scope: !676)
!763 = !DILocation(line: 298, column: 3, scope: !676)
!764 = !DILocation(line: 299, column: 1, scope: !676)
!765 = distinct !DISubprogram(name: "unpack_pk", scope: !418, file: !418, line: 41, type: !766, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!766 = !DISubroutineType(types: !767)
!767 = !{null, !421, !32, !315}
!768 = !DILocalVariable(name: "pk", arg: 1, scope: !765, file: !418, line: 41, type: !421)
!769 = !DILocation(line: 0, scope: !765)
!770 = !DILocalVariable(name: "seed", arg: 2, scope: !765, file: !418, line: 42, type: !32)
!771 = !DILocalVariable(name: "packedpk", arg: 3, scope: !765, file: !418, line: 43, type: !315)
!772 = !DILocation(line: 45, column: 3, scope: !765)
!773 = !DILocation(line: 46, column: 24, scope: !765)
!774 = !DILocation(line: 46, column: 3, scope: !765)
!775 = !DILocation(line: 47, column: 1, scope: !765)
!776 = distinct !DISubprogram(name: "pack_ciphertext", scope: !418, file: !418, line: 86, type: !777, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!777 = !DISubroutineType(types: !778)
!778 = !{null, !32, !421, !779}
!779 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !428, size: 32)
!780 = !DILocalVariable(name: "r", arg: 1, scope: !776, file: !418, line: 86, type: !32)
!781 = !DILocation(line: 0, scope: !776)
!782 = !DILocalVariable(name: "b", arg: 2, scope: !776, file: !418, line: 86, type: !421)
!783 = !DILocalVariable(name: "v", arg: 3, scope: !776, file: !418, line: 86, type: !779)
!784 = !DILocation(line: 88, column: 3, scope: !776)
!785 = !DILocation(line: 89, column: 18, scope: !776)
!786 = !DILocation(line: 89, column: 3, scope: !776)
!787 = !DILocation(line: 90, column: 1, scope: !776)
!788 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_indcpa_dec", scope: !418, file: !418, line: 314, type: !789, scopeLine: 317, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !49)
!789 = !DISubroutineType(types: !790)
!790 = !{null, !32, !315, !315}
!791 = !DILocalVariable(name: "m", arg: 1, scope: !788, file: !418, line: 314, type: !32)
!792 = !DILocation(line: 0, scope: !788)
!793 = !DILocalVariable(name: "c", arg: 2, scope: !788, file: !418, line: 315, type: !315)
!794 = !DILocalVariable(name: "sk", arg: 3, scope: !788, file: !418, line: 316, type: !315)
!795 = !DILocalVariable(name: "b", scope: !788, file: !418, line: 318, type: !422)
!796 = !DILocation(line: 318, column: 11, scope: !788)
!797 = !DILocalVariable(name: "skpv", scope: !788, file: !418, line: 318, type: !422)
!798 = !DILocation(line: 318, column: 14, scope: !788)
!799 = !DILocalVariable(name: "v", scope: !788, file: !418, line: 319, type: !428)
!800 = !DILocation(line: 319, column: 8, scope: !788)
!801 = !DILocalVariable(name: "mp", scope: !788, file: !418, line: 319, type: !428)
!802 = !DILocation(line: 319, column: 11, scope: !788)
!803 = !DILocation(line: 321, column: 3, scope: !788)
!804 = !DILocation(line: 322, column: 3, scope: !788)
!805 = !DILocation(line: 324, column: 3, scope: !788)
!806 = !DILocation(line: 325, column: 3, scope: !788)
!807 = !DILocation(line: 326, column: 3, scope: !788)
!808 = !DILocation(line: 328, column: 3, scope: !788)
!809 = !DILocation(line: 329, column: 3, scope: !788)
!810 = !DILocation(line: 331, column: 3, scope: !788)
!811 = !DILocation(line: 332, column: 1, scope: !788)
!812 = distinct !DISubprogram(name: "unpack_ciphertext", scope: !418, file: !418, line: 102, type: !813, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!813 = !DISubroutineType(types: !814)
!814 = !{null, !421, !779, !315}
!815 = !DILocalVariable(name: "b", arg: 1, scope: !812, file: !418, line: 102, type: !421)
!816 = !DILocation(line: 0, scope: !812)
!817 = !DILocalVariable(name: "v", arg: 2, scope: !812, file: !418, line: 102, type: !779)
!818 = !DILocalVariable(name: "c", arg: 3, scope: !812, file: !418, line: 102, type: !315)
!819 = !DILocation(line: 104, column: 3, scope: !812)
!820 = !DILocation(line: 105, column: 23, scope: !812)
!821 = !DILocation(line: 105, column: 3, scope: !812)
!822 = !DILocation(line: 106, column: 1, scope: !812)
!823 = distinct !DISubprogram(name: "unpack_sk", scope: !418, file: !418, line: 70, type: !824, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!824 = !DISubroutineType(types: !825)
!825 = !{null, !421, !315}
!826 = !DILocalVariable(name: "sk", arg: 1, scope: !823, file: !418, line: 70, type: !421)
!827 = !DILocation(line: 0, scope: !823)
!828 = !DILocalVariable(name: "packedsk", arg: 2, scope: !823, file: !418, line: 70, type: !315)
!829 = !DILocation(line: 72, column: 3, scope: !823)
!830 = !DILocation(line: 73, column: 1, scope: !823)
!831 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_compress", scope: !832, file: !832, line: 15, type: !833, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!832 = !DIFile(filename: "../../ref/polyvec.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!833 = !DISubroutineType(types: !834)
!834 = !{null, !32, !835}
!835 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !836, size: 32)
!836 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !837)
!837 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyvec", file: !423, line: 10, baseType: !838)
!838 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !423, line: 8, size: 16384, elements: !839)
!839 = !{!840}
!840 = !DIDerivedType(tag: DW_TAG_member, name: "vec", scope: !838, file: !423, line: 9, baseType: !841, size: 16384)
!841 = !DICompositeType(tag: DW_TAG_array_type, baseType: !842, size: 16384, elements: !436)
!842 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !429, line: 13, baseType: !843)
!843 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !429, line: 11, size: 4096, elements: !844)
!844 = !{!845}
!845 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !843, file: !429, line: 12, baseType: !433, size: 4096)
!846 = !DILocalVariable(name: "r", arg: 1, scope: !831, file: !832, line: 15, type: !32)
!847 = !DILocation(line: 0, scope: !831)
!848 = !DILocalVariable(name: "a", arg: 2, scope: !831, file: !832, line: 15, type: !835)
!849 = !DILocalVariable(name: "t", scope: !831, file: !832, line: 21, type: !850)
!850 = !DICompositeType(tag: DW_TAG_array_type, baseType: !86, size: 128, elements: !851)
!851 = !{!852}
!852 = !DISubrange(count: 8)
!853 = !DILocation(line: 21, column: 12, scope: !831)
!854 = !DILocalVariable(name: "i", scope: !831, file: !832, line: 17, type: !40)
!855 = !DILocation(line: 22, column: 7, scope: !856)
!856 = distinct !DILexicalBlock(scope: !831, file: !832, line: 22, column: 3)
!857 = !DILocation(line: 22, scope: !856)
!858 = !DILocation(line: 22, column: 12, scope: !859)
!859 = distinct !DILexicalBlock(scope: !856, file: !832, line: 22, column: 3)
!860 = !DILocation(line: 22, column: 3, scope: !856)
!861 = !DILocalVariable(name: "j", scope: !831, file: !832, line: 17, type: !40)
!862 = !DILocation(line: 23, column: 9, scope: !863)
!863 = distinct !DILexicalBlock(scope: !864, file: !832, line: 23, column: 5)
!864 = distinct !DILexicalBlock(scope: !859, file: !832, line: 22, column: 26)
!865 = !DILocation(line: 23, scope: !863)
!866 = !DILocation(line: 23, column: 14, scope: !867)
!867 = distinct !DILexicalBlock(scope: !863, file: !832, line: 23, column: 5)
!868 = !DILocation(line: 23, column: 5, scope: !863)
!869 = !DILocalVariable(name: "k", scope: !831, file: !832, line: 17, type: !40)
!870 = !DILocation(line: 24, column: 11, scope: !871)
!871 = distinct !DILexicalBlock(scope: !872, file: !832, line: 24, column: 7)
!872 = distinct !DILexicalBlock(scope: !867, file: !832, line: 23, column: 30)
!873 = !DILocation(line: 24, scope: !871)
!874 = !DILocation(line: 24, column: 16, scope: !875)
!875 = distinct !DILexicalBlock(scope: !871, file: !832, line: 24, column: 7)
!876 = !DILocation(line: 24, column: 7, scope: !871)
!877 = !DILocation(line: 25, column: 20, scope: !878)
!878 = distinct !DILexicalBlock(scope: !875, file: !832, line: 24, column: 24)
!879 = !DILocation(line: 25, column: 17, scope: !878)
!880 = !DILocation(line: 25, column: 27, scope: !878)
!881 = !DILocation(line: 25, column: 35, scope: !878)
!882 = !DILocation(line: 25, column: 37, scope: !878)
!883 = !DILocation(line: 25, column: 9, scope: !878)
!884 = !DILocation(line: 25, column: 15, scope: !878)
!885 = !DILocation(line: 26, column: 27, scope: !878)
!886 = !DILocation(line: 26, column: 18, scope: !878)
!887 = !DILocation(line: 26, column: 32, scope: !878)
!888 = !DILocation(line: 26, column: 39, scope: !878)
!889 = !DILocation(line: 26, column: 9, scope: !878)
!890 = !DILocation(line: 26, column: 14, scope: !878)
!891 = !DILocation(line: 28, column: 14, scope: !878)
!892 = !DILocalVariable(name: "d0", scope: !831, file: !832, line: 18, type: !70)
!893 = !DILocation(line: 29, column: 12, scope: !878)
!894 = !DILocation(line: 30, column: 12, scope: !878)
!895 = !DILocation(line: 31, column: 12, scope: !878)
!896 = !DILocation(line: 32, column: 12, scope: !878)
!897 = !DILocation(line: 33, column: 19, scope: !878)
!898 = !DILocation(line: 33, column: 16, scope: !878)
!899 = !DILocation(line: 33, column: 9, scope: !878)
!900 = !DILocation(line: 33, column: 14, scope: !878)
!901 = !DILocation(line: 34, column: 7, scope: !878)
!902 = !DILocation(line: 24, column: 20, scope: !875)
!903 = !DILocation(line: 24, column: 7, scope: !875)
!904 = distinct !{!904, !876, !905, !132}
!905 = !DILocation(line: 34, column: 7, scope: !871)
!906 = !DILocation(line: 36, column: 16, scope: !872)
!907 = !DILocation(line: 36, column: 21, scope: !872)
!908 = !DILocation(line: 36, column: 15, scope: !872)
!909 = !DILocation(line: 36, column: 7, scope: !872)
!910 = !DILocation(line: 36, column: 13, scope: !872)
!911 = !DILocation(line: 37, column: 16, scope: !872)
!912 = !DILocation(line: 37, column: 21, scope: !872)
!913 = !DILocation(line: 37, column: 31, scope: !872)
!914 = !DILocation(line: 37, column: 36, scope: !872)
!915 = !DILocation(line: 37, column: 28, scope: !872)
!916 = !DILocation(line: 37, column: 15, scope: !872)
!917 = !DILocation(line: 37, column: 7, scope: !872)
!918 = !DILocation(line: 37, column: 13, scope: !872)
!919 = !DILocation(line: 38, column: 16, scope: !872)
!920 = !DILocation(line: 38, column: 21, scope: !872)
!921 = !DILocation(line: 38, column: 31, scope: !872)
!922 = !DILocation(line: 38, column: 36, scope: !872)
!923 = !DILocation(line: 38, column: 28, scope: !872)
!924 = !DILocation(line: 38, column: 15, scope: !872)
!925 = !DILocation(line: 38, column: 7, scope: !872)
!926 = !DILocation(line: 38, column: 13, scope: !872)
!927 = !DILocation(line: 39, column: 16, scope: !872)
!928 = !DILocation(line: 39, column: 21, scope: !872)
!929 = !DILocation(line: 39, column: 15, scope: !872)
!930 = !DILocation(line: 39, column: 7, scope: !872)
!931 = !DILocation(line: 39, column: 13, scope: !872)
!932 = !DILocation(line: 40, column: 16, scope: !872)
!933 = !DILocation(line: 40, column: 21, scope: !872)
!934 = !DILocation(line: 40, column: 31, scope: !872)
!935 = !DILocation(line: 40, column: 36, scope: !872)
!936 = !DILocation(line: 40, column: 28, scope: !872)
!937 = !DILocation(line: 40, column: 15, scope: !872)
!938 = !DILocation(line: 40, column: 7, scope: !872)
!939 = !DILocation(line: 40, column: 13, scope: !872)
!940 = !DILocation(line: 41, column: 16, scope: !872)
!941 = !DILocation(line: 41, column: 21, scope: !872)
!942 = !DILocation(line: 41, column: 31, scope: !872)
!943 = !DILocation(line: 41, column: 36, scope: !872)
!944 = !DILocation(line: 41, column: 28, scope: !872)
!945 = !DILocation(line: 41, column: 15, scope: !872)
!946 = !DILocation(line: 41, column: 7, scope: !872)
!947 = !DILocation(line: 41, column: 13, scope: !872)
!948 = !DILocation(line: 42, column: 16, scope: !872)
!949 = !DILocation(line: 42, column: 21, scope: !872)
!950 = !DILocation(line: 42, column: 31, scope: !872)
!951 = !DILocation(line: 42, column: 36, scope: !872)
!952 = !DILocation(line: 42, column: 28, scope: !872)
!953 = !DILocation(line: 42, column: 15, scope: !872)
!954 = !DILocation(line: 42, column: 7, scope: !872)
!955 = !DILocation(line: 42, column: 13, scope: !872)
!956 = !DILocation(line: 43, column: 16, scope: !872)
!957 = !DILocation(line: 43, column: 21, scope: !872)
!958 = !DILocation(line: 43, column: 15, scope: !872)
!959 = !DILocation(line: 43, column: 7, scope: !872)
!960 = !DILocation(line: 43, column: 13, scope: !872)
!961 = !DILocation(line: 44, column: 16, scope: !872)
!962 = !DILocation(line: 44, column: 21, scope: !872)
!963 = !DILocation(line: 44, column: 31, scope: !872)
!964 = !DILocation(line: 44, column: 36, scope: !872)
!965 = !DILocation(line: 44, column: 28, scope: !872)
!966 = !DILocation(line: 44, column: 15, scope: !872)
!967 = !DILocation(line: 44, column: 7, scope: !872)
!968 = !DILocation(line: 44, column: 13, scope: !872)
!969 = !DILocation(line: 45, column: 16, scope: !872)
!970 = !DILocation(line: 45, column: 21, scope: !872)
!971 = !DILocation(line: 45, column: 31, scope: !872)
!972 = !DILocation(line: 45, column: 36, scope: !872)
!973 = !DILocation(line: 45, column: 28, scope: !872)
!974 = !DILocation(line: 45, column: 15, scope: !872)
!975 = !DILocation(line: 45, column: 7, scope: !872)
!976 = !DILocation(line: 45, column: 13, scope: !872)
!977 = !DILocation(line: 46, column: 16, scope: !872)
!978 = !DILocation(line: 46, column: 21, scope: !872)
!979 = !DILocation(line: 46, column: 15, scope: !872)
!980 = !DILocation(line: 46, column: 7, scope: !872)
!981 = !DILocation(line: 46, column: 13, scope: !872)
!982 = !DILocation(line: 47, column: 9, scope: !872)
!983 = !DILocation(line: 48, column: 5, scope: !872)
!984 = !DILocation(line: 23, column: 26, scope: !867)
!985 = !DILocation(line: 23, column: 5, scope: !867)
!986 = distinct !{!986, !868, !987, !132}
!987 = !DILocation(line: 48, column: 5, scope: !863)
!988 = !DILocation(line: 49, column: 3, scope: !864)
!989 = !DILocation(line: 22, column: 22, scope: !859)
!990 = !DILocation(line: 22, column: 3, scope: !859)
!991 = distinct !{!991, !860, !992, !132}
!992 = !DILocation(line: 49, column: 3, scope: !856)
!993 = !DILocation(line: 77, column: 1, scope: !831)
!994 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_decompress", scope: !832, file: !832, line: 89, type: !995, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!995 = !DISubroutineType(types: !996)
!996 = !{null, !997, !315}
!997 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !837, size: 32)
!998 = !DILocalVariable(name: "r", arg: 1, scope: !994, file: !832, line: 89, type: !997)
!999 = !DILocation(line: 0, scope: !994)
!1000 = !DILocalVariable(name: "a", arg: 2, scope: !994, file: !832, line: 89, type: !315)
!1001 = !DILocalVariable(name: "t", scope: !994, file: !832, line: 94, type: !850)
!1002 = !DILocation(line: 94, column: 12, scope: !994)
!1003 = !DILocalVariable(name: "i", scope: !994, file: !832, line: 91, type: !40)
!1004 = !DILocation(line: 95, column: 7, scope: !1005)
!1005 = distinct !DILexicalBlock(scope: !994, file: !832, line: 95, column: 3)
!1006 = !DILocation(line: 95, scope: !1005)
!1007 = !DILocation(line: 95, column: 12, scope: !1008)
!1008 = distinct !DILexicalBlock(scope: !1005, file: !832, line: 95, column: 3)
!1009 = !DILocation(line: 95, column: 3, scope: !1005)
!1010 = !DILocalVariable(name: "j", scope: !994, file: !832, line: 91, type: !40)
!1011 = !DILocation(line: 96, column: 9, scope: !1012)
!1012 = distinct !DILexicalBlock(scope: !1013, file: !832, line: 96, column: 5)
!1013 = distinct !DILexicalBlock(scope: !1008, file: !832, line: 95, column: 26)
!1014 = !DILocation(line: 96, scope: !1012)
!1015 = !DILocation(line: 96, column: 14, scope: !1016)
!1016 = distinct !DILexicalBlock(scope: !1012, file: !832, line: 96, column: 5)
!1017 = !DILocation(line: 96, column: 5, scope: !1012)
!1018 = !DILocation(line: 97, column: 15, scope: !1019)
!1019 = distinct !DILexicalBlock(scope: !1016, file: !832, line: 96, column: 30)
!1020 = !DILocation(line: 97, column: 20, scope: !1019)
!1021 = !DILocation(line: 97, column: 39, scope: !1019)
!1022 = !DILocation(line: 97, column: 29, scope: !1019)
!1023 = !DILocation(line: 97, column: 45, scope: !1019)
!1024 = !DILocation(line: 97, column: 26, scope: !1019)
!1025 = !DILocation(line: 97, column: 14, scope: !1019)
!1026 = !DILocation(line: 97, column: 7, scope: !1019)
!1027 = !DILocation(line: 97, column: 12, scope: !1019)
!1028 = !DILocation(line: 98, column: 15, scope: !1019)
!1029 = !DILocation(line: 98, column: 20, scope: !1019)
!1030 = !DILocation(line: 98, column: 39, scope: !1019)
!1031 = !DILocation(line: 98, column: 29, scope: !1019)
!1032 = !DILocation(line: 98, column: 45, scope: !1019)
!1033 = !DILocation(line: 98, column: 26, scope: !1019)
!1034 = !DILocation(line: 98, column: 14, scope: !1019)
!1035 = !DILocation(line: 98, column: 7, scope: !1019)
!1036 = !DILocation(line: 98, column: 12, scope: !1019)
!1037 = !DILocation(line: 99, column: 15, scope: !1019)
!1038 = !DILocation(line: 99, column: 20, scope: !1019)
!1039 = !DILocation(line: 99, column: 39, scope: !1019)
!1040 = !DILocation(line: 99, column: 29, scope: !1019)
!1041 = !DILocation(line: 99, column: 45, scope: !1019)
!1042 = !DILocation(line: 99, column: 26, scope: !1019)
!1043 = !DILocation(line: 99, column: 64, scope: !1019)
!1044 = !DILocation(line: 99, column: 54, scope: !1019)
!1045 = !DILocation(line: 99, column: 69, scope: !1019)
!1046 = !DILocation(line: 99, column: 51, scope: !1019)
!1047 = !DILocation(line: 99, column: 14, scope: !1019)
!1048 = !DILocation(line: 99, column: 7, scope: !1019)
!1049 = !DILocation(line: 99, column: 12, scope: !1019)
!1050 = !DILocation(line: 100, column: 15, scope: !1019)
!1051 = !DILocation(line: 100, column: 20, scope: !1019)
!1052 = !DILocation(line: 100, column: 39, scope: !1019)
!1053 = !DILocation(line: 100, column: 29, scope: !1019)
!1054 = !DILocation(line: 100, column: 45, scope: !1019)
!1055 = !DILocation(line: 100, column: 26, scope: !1019)
!1056 = !DILocation(line: 100, column: 14, scope: !1019)
!1057 = !DILocation(line: 100, column: 7, scope: !1019)
!1058 = !DILocation(line: 100, column: 12, scope: !1019)
!1059 = !DILocation(line: 101, column: 15, scope: !1019)
!1060 = !DILocation(line: 101, column: 20, scope: !1019)
!1061 = !DILocation(line: 101, column: 39, scope: !1019)
!1062 = !DILocation(line: 101, column: 29, scope: !1019)
!1063 = !DILocation(line: 101, column: 45, scope: !1019)
!1064 = !DILocation(line: 101, column: 26, scope: !1019)
!1065 = !DILocation(line: 101, column: 14, scope: !1019)
!1066 = !DILocation(line: 101, column: 7, scope: !1019)
!1067 = !DILocation(line: 101, column: 12, scope: !1019)
!1068 = !DILocation(line: 102, column: 15, scope: !1019)
!1069 = !DILocation(line: 102, column: 20, scope: !1019)
!1070 = !DILocation(line: 102, column: 39, scope: !1019)
!1071 = !DILocation(line: 102, column: 29, scope: !1019)
!1072 = !DILocation(line: 102, column: 45, scope: !1019)
!1073 = !DILocation(line: 102, column: 26, scope: !1019)
!1074 = !DILocation(line: 102, column: 64, scope: !1019)
!1075 = !DILocation(line: 102, column: 54, scope: !1019)
!1076 = !DILocation(line: 102, column: 69, scope: !1019)
!1077 = !DILocation(line: 102, column: 51, scope: !1019)
!1078 = !DILocation(line: 102, column: 14, scope: !1019)
!1079 = !DILocation(line: 102, column: 7, scope: !1019)
!1080 = !DILocation(line: 102, column: 12, scope: !1019)
!1081 = !DILocation(line: 103, column: 15, scope: !1019)
!1082 = !DILocation(line: 103, column: 20, scope: !1019)
!1083 = !DILocation(line: 103, column: 39, scope: !1019)
!1084 = !DILocation(line: 103, column: 29, scope: !1019)
!1085 = !DILocation(line: 103, column: 45, scope: !1019)
!1086 = !DILocation(line: 103, column: 26, scope: !1019)
!1087 = !DILocation(line: 103, column: 14, scope: !1019)
!1088 = !DILocation(line: 103, column: 7, scope: !1019)
!1089 = !DILocation(line: 103, column: 12, scope: !1019)
!1090 = !DILocation(line: 104, column: 15, scope: !1019)
!1091 = !DILocation(line: 104, column: 20, scope: !1019)
!1092 = !DILocation(line: 104, column: 39, scope: !1019)
!1093 = !DILocation(line: 104, column: 29, scope: !1019)
!1094 = !DILocation(line: 104, column: 45, scope: !1019)
!1095 = !DILocation(line: 104, column: 26, scope: !1019)
!1096 = !DILocation(line: 104, column: 14, scope: !1019)
!1097 = !DILocation(line: 104, column: 7, scope: !1019)
!1098 = !DILocation(line: 104, column: 12, scope: !1019)
!1099 = !DILocation(line: 105, column: 9, scope: !1019)
!1100 = !DILocalVariable(name: "k", scope: !994, file: !832, line: 91, type: !40)
!1101 = !DILocation(line: 107, column: 11, scope: !1102)
!1102 = distinct !DILexicalBlock(scope: !1019, file: !832, line: 107, column: 7)
!1103 = !DILocation(line: 107, scope: !1102)
!1104 = !DILocation(line: 107, column: 16, scope: !1105)
!1105 = distinct !DILexicalBlock(scope: !1102, file: !832, line: 107, column: 7)
!1106 = !DILocation(line: 107, column: 7, scope: !1102)
!1107 = !DILocation(line: 108, column: 47, scope: !1105)
!1108 = !DILocation(line: 108, column: 52, scope: !1105)
!1109 = !DILocation(line: 108, column: 60, scope: !1105)
!1110 = !DILocation(line: 108, column: 69, scope: !1105)
!1111 = !DILocation(line: 108, column: 77, scope: !1105)
!1112 = !DILocation(line: 108, column: 35, scope: !1105)
!1113 = !DILocation(line: 108, column: 12, scope: !1105)
!1114 = !DILocation(line: 108, column: 9, scope: !1105)
!1115 = !DILocation(line: 108, column: 19, scope: !1105)
!1116 = !DILocation(line: 108, column: 27, scope: !1105)
!1117 = !DILocation(line: 108, column: 29, scope: !1105)
!1118 = !DILocation(line: 108, column: 33, scope: !1105)
!1119 = !DILocation(line: 107, column: 20, scope: !1105)
!1120 = !DILocation(line: 107, column: 7, scope: !1105)
!1121 = distinct !{!1121, !1106, !1122, !132}
!1122 = !DILocation(line: 108, column: 80, scope: !1102)
!1123 = !DILocation(line: 109, column: 5, scope: !1019)
!1124 = !DILocation(line: 96, column: 26, scope: !1016)
!1125 = !DILocation(line: 96, column: 5, scope: !1016)
!1126 = distinct !{!1126, !1017, !1127, !132}
!1127 = !DILocation(line: 109, column: 5, scope: !1012)
!1128 = !DILocation(line: 110, column: 3, scope: !1013)
!1129 = !DILocation(line: 95, column: 22, scope: !1008)
!1130 = !DILocation(line: 95, column: 3, scope: !1008)
!1131 = distinct !{!1131, !1009, !1132, !132}
!1132 = !DILocation(line: 110, column: 3, scope: !1005)
!1133 = !DILocation(line: 128, column: 1, scope: !994)
!1134 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_tobytes", scope: !832, file: !832, line: 139, type: !833, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1135 = !DILocalVariable(name: "r", arg: 1, scope: !1134, file: !832, line: 139, type: !32)
!1136 = !DILocation(line: 0, scope: !1134)
!1137 = !DILocalVariable(name: "a", arg: 2, scope: !1134, file: !832, line: 139, type: !835)
!1138 = !DILocalVariable(name: "i", scope: !1134, file: !832, line: 141, type: !40)
!1139 = !DILocation(line: 142, column: 7, scope: !1140)
!1140 = distinct !DILexicalBlock(scope: !1134, file: !832, line: 142, column: 3)
!1141 = !DILocation(line: 142, scope: !1140)
!1142 = !DILocation(line: 142, column: 12, scope: !1143)
!1143 = distinct !DILexicalBlock(scope: !1140, file: !832, line: 142, column: 3)
!1144 = !DILocation(line: 142, column: 3, scope: !1140)
!1145 = !DILocation(line: 143, column: 21, scope: !1143)
!1146 = !DILocation(line: 143, column: 19, scope: !1143)
!1147 = !DILocation(line: 143, column: 43, scope: !1143)
!1148 = !DILocation(line: 143, column: 40, scope: !1143)
!1149 = !DILocation(line: 143, column: 5, scope: !1143)
!1150 = !DILocation(line: 142, column: 22, scope: !1143)
!1151 = !DILocation(line: 142, column: 3, scope: !1143)
!1152 = distinct !{!1152, !1144, !1153, !132}
!1153 = !DILocation(line: 143, column: 49, scope: !1140)
!1154 = !DILocation(line: 144, column: 1, scope: !1134)
!1155 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_frombytes", scope: !832, file: !832, line: 156, type: !995, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1156 = !DILocalVariable(name: "r", arg: 1, scope: !1155, file: !832, line: 156, type: !997)
!1157 = !DILocation(line: 0, scope: !1155)
!1158 = !DILocalVariable(name: "a", arg: 2, scope: !1155, file: !832, line: 156, type: !315)
!1159 = !DILocalVariable(name: "i", scope: !1155, file: !832, line: 158, type: !40)
!1160 = !DILocation(line: 159, column: 7, scope: !1161)
!1161 = distinct !DILexicalBlock(scope: !1155, file: !832, line: 159, column: 3)
!1162 = !DILocation(line: 159, scope: !1161)
!1163 = !DILocation(line: 159, column: 12, scope: !1164)
!1164 = distinct !DILexicalBlock(scope: !1161, file: !832, line: 159, column: 3)
!1165 = !DILocation(line: 159, column: 3, scope: !1161)
!1166 = !DILocation(line: 160, column: 24, scope: !1164)
!1167 = !DILocation(line: 160, column: 21, scope: !1164)
!1168 = !DILocation(line: 160, column: 35, scope: !1164)
!1169 = !DILocation(line: 160, column: 33, scope: !1164)
!1170 = !DILocation(line: 160, column: 5, scope: !1164)
!1171 = !DILocation(line: 159, column: 22, scope: !1164)
!1172 = !DILocation(line: 159, column: 3, scope: !1164)
!1173 = distinct !{!1173, !1165, !1174, !132}
!1174 = !DILocation(line: 160, column: 51, scope: !1161)
!1175 = !DILocation(line: 161, column: 1, scope: !1155)
!1176 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_ntt", scope: !832, file: !832, line: 170, type: !1177, scopeLine: 171, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1177 = !DISubroutineType(types: !1178)
!1178 = !{null, !997}
!1179 = !DILocalVariable(name: "r", arg: 1, scope: !1176, file: !832, line: 170, type: !997)
!1180 = !DILocation(line: 0, scope: !1176)
!1181 = !DILocalVariable(name: "i", scope: !1176, file: !832, line: 172, type: !40)
!1182 = !DILocation(line: 173, column: 7, scope: !1183)
!1183 = distinct !DILexicalBlock(scope: !1176, file: !832, line: 173, column: 3)
!1184 = !DILocation(line: 173, scope: !1183)
!1185 = !DILocation(line: 173, column: 12, scope: !1186)
!1186 = distinct !DILexicalBlock(scope: !1183, file: !832, line: 173, column: 3)
!1187 = !DILocation(line: 173, column: 3, scope: !1183)
!1188 = !DILocation(line: 174, column: 18, scope: !1186)
!1189 = !DILocation(line: 174, column: 15, scope: !1186)
!1190 = !DILocation(line: 174, column: 5, scope: !1186)
!1191 = !DILocation(line: 173, column: 22, scope: !1186)
!1192 = !DILocation(line: 173, column: 3, scope: !1186)
!1193 = distinct !{!1193, !1187, !1194, !132}
!1194 = !DILocation(line: 174, column: 24, scope: !1183)
!1195 = !DILocation(line: 175, column: 1, scope: !1176)
!1196 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_invntt_tomont", scope: !832, file: !832, line: 185, type: !1177, scopeLine: 186, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1197 = !DILocalVariable(name: "r", arg: 1, scope: !1196, file: !832, line: 185, type: !997)
!1198 = !DILocation(line: 0, scope: !1196)
!1199 = !DILocalVariable(name: "i", scope: !1196, file: !832, line: 187, type: !40)
!1200 = !DILocation(line: 188, column: 7, scope: !1201)
!1201 = distinct !DILexicalBlock(scope: !1196, file: !832, line: 188, column: 3)
!1202 = !DILocation(line: 188, scope: !1201)
!1203 = !DILocation(line: 188, column: 12, scope: !1204)
!1204 = distinct !DILexicalBlock(scope: !1201, file: !832, line: 188, column: 3)
!1205 = !DILocation(line: 188, column: 3, scope: !1201)
!1206 = !DILocation(line: 189, column: 28, scope: !1204)
!1207 = !DILocation(line: 189, column: 25, scope: !1204)
!1208 = !DILocation(line: 189, column: 5, scope: !1204)
!1209 = !DILocation(line: 188, column: 22, scope: !1204)
!1210 = !DILocation(line: 188, column: 3, scope: !1204)
!1211 = distinct !{!1211, !1205, !1212, !132}
!1212 = !DILocation(line: 189, column: 34, scope: !1201)
!1213 = !DILocation(line: 190, column: 1, scope: !1196)
!1214 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_basemul_acc_montgomery", scope: !832, file: !832, line: 202, type: !1215, scopeLine: 203, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1215 = !DISubroutineType(types: !1216)
!1216 = !{null, !1217, !835, !835}
!1217 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !842, size: 32)
!1218 = !DILocalVariable(name: "r", arg: 1, scope: !1214, file: !832, line: 202, type: !1217)
!1219 = !DILocation(line: 0, scope: !1214)
!1220 = !DILocalVariable(name: "a", arg: 2, scope: !1214, file: !832, line: 202, type: !835)
!1221 = !DILocalVariable(name: "b", arg: 3, scope: !1214, file: !832, line: 202, type: !835)
!1222 = !DILocalVariable(name: "t", scope: !1214, file: !832, line: 205, type: !842)
!1223 = !DILocation(line: 205, column: 8, scope: !1214)
!1224 = !DILocation(line: 207, column: 34, scope: !1214)
!1225 = !DILocation(line: 207, column: 31, scope: !1214)
!1226 = !DILocation(line: 207, column: 46, scope: !1214)
!1227 = !DILocation(line: 207, column: 43, scope: !1214)
!1228 = !DILocation(line: 207, column: 3, scope: !1214)
!1229 = !DILocalVariable(name: "i", scope: !1214, file: !832, line: 204, type: !40)
!1230 = !DILocation(line: 208, column: 7, scope: !1231)
!1231 = distinct !DILexicalBlock(scope: !1214, file: !832, line: 208, column: 3)
!1232 = !DILocation(line: 208, scope: !1231)
!1233 = !DILocation(line: 208, column: 12, scope: !1234)
!1234 = distinct !DILexicalBlock(scope: !1231, file: !832, line: 208, column: 3)
!1235 = !DILocation(line: 208, column: 3, scope: !1231)
!1236 = !DILocation(line: 209, column: 37, scope: !1237)
!1237 = distinct !DILexicalBlock(scope: !1234, file: !832, line: 208, column: 26)
!1238 = !DILocation(line: 209, column: 34, scope: !1237)
!1239 = !DILocation(line: 209, column: 49, scope: !1237)
!1240 = !DILocation(line: 209, column: 46, scope: !1237)
!1241 = !DILocation(line: 209, column: 5, scope: !1237)
!1242 = !DILocation(line: 210, column: 5, scope: !1237)
!1243 = !DILocation(line: 211, column: 3, scope: !1237)
!1244 = !DILocation(line: 208, column: 22, scope: !1234)
!1245 = !DILocation(line: 208, column: 3, scope: !1234)
!1246 = distinct !{!1246, !1235, !1247, !132}
!1247 = !DILocation(line: 211, column: 3, scope: !1231)
!1248 = !DILocation(line: 213, column: 3, scope: !1214)
!1249 = !DILocation(line: 214, column: 1, scope: !1214)
!1250 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_reduce", scope: !832, file: !832, line: 225, type: !1177, scopeLine: 226, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1251 = !DILocalVariable(name: "r", arg: 1, scope: !1250, file: !832, line: 225, type: !997)
!1252 = !DILocation(line: 0, scope: !1250)
!1253 = !DILocalVariable(name: "i", scope: !1250, file: !832, line: 227, type: !40)
!1254 = !DILocation(line: 228, column: 7, scope: !1255)
!1255 = distinct !DILexicalBlock(scope: !1250, file: !832, line: 228, column: 3)
!1256 = !DILocation(line: 228, scope: !1255)
!1257 = !DILocation(line: 228, column: 12, scope: !1258)
!1258 = distinct !DILexicalBlock(scope: !1255, file: !832, line: 228, column: 3)
!1259 = !DILocation(line: 228, column: 3, scope: !1255)
!1260 = !DILocation(line: 229, column: 21, scope: !1258)
!1261 = !DILocation(line: 229, column: 18, scope: !1258)
!1262 = !DILocation(line: 229, column: 5, scope: !1258)
!1263 = !DILocation(line: 228, column: 22, scope: !1258)
!1264 = !DILocation(line: 228, column: 3, scope: !1258)
!1265 = distinct !{!1265, !1259, !1266, !132}
!1266 = !DILocation(line: 229, column: 27, scope: !1255)
!1267 = !DILocation(line: 230, column: 1, scope: !1250)
!1268 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_polyvec_add", scope: !832, file: !832, line: 241, type: !1269, scopeLine: 242, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1269 = !DISubroutineType(types: !1270)
!1270 = !{null, !997, !835, !835}
!1271 = !DILocalVariable(name: "r", arg: 1, scope: !1268, file: !832, line: 241, type: !997)
!1272 = !DILocation(line: 0, scope: !1268)
!1273 = !DILocalVariable(name: "a", arg: 2, scope: !1268, file: !832, line: 241, type: !835)
!1274 = !DILocalVariable(name: "b", arg: 3, scope: !1268, file: !832, line: 241, type: !835)
!1275 = !DILocalVariable(name: "i", scope: !1268, file: !832, line: 243, type: !40)
!1276 = !DILocation(line: 244, column: 7, scope: !1277)
!1277 = distinct !DILexicalBlock(scope: !1268, file: !832, line: 244, column: 3)
!1278 = !DILocation(line: 244, scope: !1277)
!1279 = !DILocation(line: 244, column: 12, scope: !1280)
!1280 = distinct !DILexicalBlock(scope: !1277, file: !832, line: 244, column: 3)
!1281 = !DILocation(line: 244, column: 3, scope: !1277)
!1282 = !DILocation(line: 245, column: 18, scope: !1280)
!1283 = !DILocation(line: 245, column: 15, scope: !1280)
!1284 = !DILocation(line: 245, column: 30, scope: !1280)
!1285 = !DILocation(line: 245, column: 27, scope: !1280)
!1286 = !DILocation(line: 245, column: 42, scope: !1280)
!1287 = !DILocation(line: 245, column: 39, scope: !1280)
!1288 = !DILocation(line: 245, column: 5, scope: !1280)
!1289 = !DILocation(line: 244, column: 22, scope: !1280)
!1290 = !DILocation(line: 244, column: 3, scope: !1280)
!1291 = distinct !{!1291, !1281, !1292, !132}
!1292 = !DILocation(line: 245, column: 48, scope: !1277)
!1293 = !DILocation(line: 246, column: 1, scope: !1268)
!1294 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_compress", scope: !1295, file: !1295, line: 19, type: !1296, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1295 = !DIFile(filename: "../../ref/poly.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!1296 = !DISubroutineType(types: !1297)
!1297 = !{null, !32, !1298}
!1298 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1299, size: 32)
!1299 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1300)
!1300 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !429, line: 13, baseType: !1301)
!1301 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !429, line: 11, size: 4096, elements: !1302)
!1302 = !{!1303}
!1303 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !1301, file: !429, line: 12, baseType: !433, size: 4096)
!1304 = !DILocalVariable(name: "r", arg: 1, scope: !1294, file: !1295, line: 19, type: !32)
!1305 = !DILocation(line: 0, scope: !1294)
!1306 = !DILocalVariable(name: "a", arg: 2, scope: !1294, file: !1295, line: 19, type: !1298)
!1307 = !DILocalVariable(name: "t", scope: !1294, file: !1295, line: 24, type: !1308)
!1308 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 64, elements: !851)
!1309 = !DILocation(line: 24, column: 11, scope: !1294)
!1310 = !DILocalVariable(name: "i", scope: !1294, file: !1295, line: 21, type: !40)
!1311 = !DILocation(line: 48, column: 7, scope: !1312)
!1312 = distinct !DILexicalBlock(scope: !1294, file: !1295, line: 48, column: 3)
!1313 = !DILocation(line: 48, scope: !1312)
!1314 = !DILocation(line: 48, column: 12, scope: !1315)
!1315 = distinct !DILexicalBlock(scope: !1312, file: !1295, line: 48, column: 3)
!1316 = !DILocation(line: 48, column: 3, scope: !1312)
!1317 = !DILocalVariable(name: "j", scope: !1294, file: !1295, line: 21, type: !40)
!1318 = !DILocation(line: 49, column: 9, scope: !1319)
!1319 = distinct !DILexicalBlock(scope: !1320, file: !1295, line: 49, column: 5)
!1320 = distinct !DILexicalBlock(scope: !1315, file: !1295, line: 48, column: 28)
!1321 = !DILocation(line: 49, scope: !1319)
!1322 = !DILocation(line: 49, column: 14, scope: !1323)
!1323 = distinct !DILexicalBlock(scope: !1319, file: !1295, line: 49, column: 5)
!1324 = !DILocation(line: 49, column: 5, scope: !1319)
!1325 = !DILocation(line: 51, column: 15, scope: !1326)
!1326 = distinct !DILexicalBlock(scope: !1323, file: !1295, line: 49, column: 22)
!1327 = !DILocation(line: 51, column: 23, scope: !1326)
!1328 = !DILocation(line: 51, column: 25, scope: !1326)
!1329 = !DILocation(line: 51, column: 12, scope: !1326)
!1330 = !DILocalVariable(name: "u", scope: !1294, file: !1295, line: 22, type: !61)
!1331 = !DILocation(line: 52, column: 13, scope: !1326)
!1332 = !DILocation(line: 52, column: 15, scope: !1326)
!1333 = !DILocation(line: 52, column: 22, scope: !1326)
!1334 = !DILocation(line: 52, column: 9, scope: !1326)
!1335 = !DILocation(line: 54, column: 12, scope: !1326)
!1336 = !DILocation(line: 54, column: 14, scope: !1326)
!1337 = !DILocalVariable(name: "d0", scope: !1294, file: !1295, line: 23, type: !91)
!1338 = !DILocation(line: 55, column: 10, scope: !1326)
!1339 = !DILocation(line: 56, column: 10, scope: !1326)
!1340 = !DILocation(line: 57, column: 10, scope: !1326)
!1341 = !DILocation(line: 58, column: 17, scope: !1326)
!1342 = !DILocation(line: 58, column: 14, scope: !1326)
!1343 = !DILocation(line: 58, column: 7, scope: !1326)
!1344 = !DILocation(line: 58, column: 12, scope: !1326)
!1345 = !DILocation(line: 59, column: 5, scope: !1326)
!1346 = !DILocation(line: 49, column: 18, scope: !1323)
!1347 = !DILocation(line: 49, column: 5, scope: !1323)
!1348 = distinct !{!1348, !1324, !1349, !132}
!1349 = !DILocation(line: 59, column: 5, scope: !1319)
!1350 = !DILocation(line: 61, column: 13, scope: !1320)
!1351 = !DILocation(line: 61, column: 18, scope: !1320)
!1352 = !DILocation(line: 61, column: 27, scope: !1320)
!1353 = !DILocation(line: 61, column: 32, scope: !1320)
!1354 = !DILocation(line: 61, column: 24, scope: !1320)
!1355 = !DILocation(line: 61, column: 12, scope: !1320)
!1356 = !DILocation(line: 61, column: 5, scope: !1320)
!1357 = !DILocation(line: 61, column: 10, scope: !1320)
!1358 = !DILocation(line: 62, column: 13, scope: !1320)
!1359 = !DILocation(line: 62, column: 18, scope: !1320)
!1360 = !DILocation(line: 62, column: 27, scope: !1320)
!1361 = !DILocation(line: 62, column: 32, scope: !1320)
!1362 = !DILocation(line: 62, column: 24, scope: !1320)
!1363 = !DILocation(line: 62, column: 41, scope: !1320)
!1364 = !DILocation(line: 62, column: 46, scope: !1320)
!1365 = !DILocation(line: 62, column: 38, scope: !1320)
!1366 = !DILocation(line: 62, column: 12, scope: !1320)
!1367 = !DILocation(line: 62, column: 5, scope: !1320)
!1368 = !DILocation(line: 62, column: 10, scope: !1320)
!1369 = !DILocation(line: 63, column: 13, scope: !1320)
!1370 = !DILocation(line: 63, column: 18, scope: !1320)
!1371 = !DILocation(line: 63, column: 27, scope: !1320)
!1372 = !DILocation(line: 63, column: 32, scope: !1320)
!1373 = !DILocation(line: 63, column: 24, scope: !1320)
!1374 = !DILocation(line: 63, column: 12, scope: !1320)
!1375 = !DILocation(line: 63, column: 5, scope: !1320)
!1376 = !DILocation(line: 63, column: 10, scope: !1320)
!1377 = !DILocation(line: 64, column: 13, scope: !1320)
!1378 = !DILocation(line: 64, column: 18, scope: !1320)
!1379 = !DILocation(line: 64, column: 27, scope: !1320)
!1380 = !DILocation(line: 64, column: 32, scope: !1320)
!1381 = !DILocation(line: 64, column: 24, scope: !1320)
!1382 = !DILocation(line: 64, column: 41, scope: !1320)
!1383 = !DILocation(line: 64, column: 46, scope: !1320)
!1384 = !DILocation(line: 64, column: 38, scope: !1320)
!1385 = !DILocation(line: 64, column: 12, scope: !1320)
!1386 = !DILocation(line: 64, column: 5, scope: !1320)
!1387 = !DILocation(line: 64, column: 10, scope: !1320)
!1388 = !DILocation(line: 65, column: 13, scope: !1320)
!1389 = !DILocation(line: 65, column: 18, scope: !1320)
!1390 = !DILocation(line: 65, column: 27, scope: !1320)
!1391 = !DILocation(line: 65, column: 32, scope: !1320)
!1392 = !DILocation(line: 65, column: 24, scope: !1320)
!1393 = !DILocation(line: 65, column: 12, scope: !1320)
!1394 = !DILocation(line: 65, column: 5, scope: !1320)
!1395 = !DILocation(line: 65, column: 10, scope: !1320)
!1396 = !DILocation(line: 66, column: 7, scope: !1320)
!1397 = !DILocation(line: 67, column: 3, scope: !1320)
!1398 = !DILocation(line: 48, column: 24, scope: !1315)
!1399 = !DILocation(line: 48, column: 3, scope: !1315)
!1400 = distinct !{!1400, !1316, !1401, !132}
!1401 = !DILocation(line: 67, column: 3, scope: !1312)
!1402 = !DILocation(line: 71, column: 1, scope: !1294)
!1403 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_decompress", scope: !1295, file: !1295, line: 83, type: !1404, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1404 = !DISubroutineType(types: !1405)
!1405 = !{null, !1406, !315}
!1406 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1300, size: 32)
!1407 = !DILocalVariable(name: "r", arg: 1, scope: !1403, file: !1295, line: 83, type: !1406)
!1408 = !DILocation(line: 0, scope: !1403)
!1409 = !DILocalVariable(name: "a", arg: 2, scope: !1403, file: !1295, line: 83, type: !315)
!1410 = !DILocalVariable(name: "t", scope: !1403, file: !1295, line: 95, type: !1308)
!1411 = !DILocation(line: 95, column: 11, scope: !1403)
!1412 = !DILocalVariable(name: "i", scope: !1403, file: !1295, line: 85, type: !40)
!1413 = !DILocation(line: 96, column: 7, scope: !1414)
!1414 = distinct !DILexicalBlock(scope: !1403, file: !1295, line: 96, column: 3)
!1415 = !DILocation(line: 96, scope: !1414)
!1416 = !DILocation(line: 96, column: 12, scope: !1417)
!1417 = distinct !DILexicalBlock(scope: !1414, file: !1295, line: 96, column: 3)
!1418 = !DILocation(line: 96, column: 3, scope: !1414)
!1419 = !DILocation(line: 97, column: 13, scope: !1420)
!1420 = distinct !DILexicalBlock(scope: !1417, file: !1295, line: 96, column: 28)
!1421 = !DILocation(line: 97, column: 18, scope: !1420)
!1422 = !DILocation(line: 97, column: 12, scope: !1420)
!1423 = !DILocation(line: 97, column: 5, scope: !1420)
!1424 = !DILocation(line: 97, column: 10, scope: !1420)
!1425 = !DILocation(line: 98, column: 13, scope: !1420)
!1426 = !DILocation(line: 98, column: 18, scope: !1420)
!1427 = !DILocation(line: 98, column: 27, scope: !1420)
!1428 = !DILocation(line: 98, column: 32, scope: !1420)
!1429 = !DILocation(line: 98, column: 24, scope: !1420)
!1430 = !DILocation(line: 98, column: 12, scope: !1420)
!1431 = !DILocation(line: 98, column: 5, scope: !1420)
!1432 = !DILocation(line: 98, column: 10, scope: !1420)
!1433 = !DILocation(line: 99, column: 13, scope: !1420)
!1434 = !DILocation(line: 99, column: 18, scope: !1420)
!1435 = !DILocation(line: 99, column: 12, scope: !1420)
!1436 = !DILocation(line: 99, column: 5, scope: !1420)
!1437 = !DILocation(line: 99, column: 10, scope: !1420)
!1438 = !DILocation(line: 100, column: 13, scope: !1420)
!1439 = !DILocation(line: 100, column: 18, scope: !1420)
!1440 = !DILocation(line: 100, column: 27, scope: !1420)
!1441 = !DILocation(line: 100, column: 32, scope: !1420)
!1442 = !DILocation(line: 100, column: 24, scope: !1420)
!1443 = !DILocation(line: 100, column: 12, scope: !1420)
!1444 = !DILocation(line: 100, column: 5, scope: !1420)
!1445 = !DILocation(line: 100, column: 10, scope: !1420)
!1446 = !DILocation(line: 101, column: 13, scope: !1420)
!1447 = !DILocation(line: 101, column: 18, scope: !1420)
!1448 = !DILocation(line: 101, column: 27, scope: !1420)
!1449 = !DILocation(line: 101, column: 32, scope: !1420)
!1450 = !DILocation(line: 101, column: 24, scope: !1420)
!1451 = !DILocation(line: 101, column: 12, scope: !1420)
!1452 = !DILocation(line: 101, column: 5, scope: !1420)
!1453 = !DILocation(line: 101, column: 10, scope: !1420)
!1454 = !DILocation(line: 102, column: 13, scope: !1420)
!1455 = !DILocation(line: 102, column: 18, scope: !1420)
!1456 = !DILocation(line: 102, column: 12, scope: !1420)
!1457 = !DILocation(line: 102, column: 5, scope: !1420)
!1458 = !DILocation(line: 102, column: 10, scope: !1420)
!1459 = !DILocation(line: 103, column: 13, scope: !1420)
!1460 = !DILocation(line: 103, column: 18, scope: !1420)
!1461 = !DILocation(line: 103, column: 27, scope: !1420)
!1462 = !DILocation(line: 103, column: 32, scope: !1420)
!1463 = !DILocation(line: 103, column: 24, scope: !1420)
!1464 = !DILocation(line: 103, column: 12, scope: !1420)
!1465 = !DILocation(line: 103, column: 5, scope: !1420)
!1466 = !DILocation(line: 103, column: 10, scope: !1420)
!1467 = !DILocation(line: 104, column: 13, scope: !1420)
!1468 = !DILocation(line: 104, column: 18, scope: !1420)
!1469 = !DILocation(line: 104, column: 12, scope: !1420)
!1470 = !DILocation(line: 104, column: 5, scope: !1420)
!1471 = !DILocation(line: 104, column: 10, scope: !1420)
!1472 = !DILocation(line: 105, column: 7, scope: !1420)
!1473 = !DILocalVariable(name: "j", scope: !1403, file: !1295, line: 94, type: !40)
!1474 = !DILocation(line: 107, column: 9, scope: !1475)
!1475 = distinct !DILexicalBlock(scope: !1420, file: !1295, line: 107, column: 5)
!1476 = !DILocation(line: 107, scope: !1475)
!1477 = !DILocation(line: 107, column: 14, scope: !1478)
!1478 = distinct !DILexicalBlock(scope: !1475, file: !1295, line: 107, column: 5)
!1479 = !DILocation(line: 107, column: 5, scope: !1475)
!1480 = !DILocation(line: 108, column: 38, scope: !1478)
!1481 = !DILocation(line: 108, column: 43, scope: !1478)
!1482 = !DILocation(line: 108, column: 48, scope: !1478)
!1483 = !DILocation(line: 108, column: 57, scope: !1478)
!1484 = !DILocation(line: 108, column: 63, scope: !1478)
!1485 = !DILocation(line: 108, column: 26, scope: !1478)
!1486 = !DILocation(line: 108, column: 10, scope: !1478)
!1487 = !DILocation(line: 108, column: 18, scope: !1478)
!1488 = !DILocation(line: 108, column: 20, scope: !1478)
!1489 = !DILocation(line: 108, column: 7, scope: !1478)
!1490 = !DILocation(line: 108, column: 24, scope: !1478)
!1491 = !DILocation(line: 107, column: 18, scope: !1478)
!1492 = !DILocation(line: 107, column: 5, scope: !1478)
!1493 = distinct !{!1493, !1479, !1494, !132}
!1494 = !DILocation(line: 108, column: 66, scope: !1475)
!1495 = !DILocation(line: 109, column: 3, scope: !1420)
!1496 = !DILocation(line: 96, column: 24, scope: !1417)
!1497 = !DILocation(line: 96, column: 3, scope: !1417)
!1498 = distinct !{!1498, !1418, !1499, !132}
!1499 = !DILocation(line: 109, column: 3, scope: !1414)
!1500 = !DILocation(line: 113, column: 1, scope: !1403)
!1501 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_tobytes", scope: !1295, file: !1295, line: 124, type: !1296, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1502 = !DILocalVariable(name: "r", arg: 1, scope: !1501, file: !1295, line: 124, type: !32)
!1503 = !DILocation(line: 0, scope: !1501)
!1504 = !DILocalVariable(name: "a", arg: 2, scope: !1501, file: !1295, line: 124, type: !1298)
!1505 = !DILocalVariable(name: "i", scope: !1501, file: !1295, line: 126, type: !40)
!1506 = !DILocation(line: 129, column: 7, scope: !1507)
!1507 = distinct !DILexicalBlock(scope: !1501, file: !1295, line: 129, column: 3)
!1508 = !DILocation(line: 129, scope: !1507)
!1509 = !DILocation(line: 129, column: 12, scope: !1510)
!1510 = distinct !DILexicalBlock(scope: !1507, file: !1295, line: 129, column: 3)
!1511 = !DILocation(line: 129, column: 3, scope: !1507)
!1512 = !DILocation(line: 131, column: 14, scope: !1513)
!1513 = distinct !DILexicalBlock(scope: !1510, file: !1295, line: 129, column: 28)
!1514 = !DILocation(line: 131, column: 22, scope: !1513)
!1515 = !DILocation(line: 131, column: 11, scope: !1513)
!1516 = !DILocalVariable(name: "t0", scope: !1501, file: !1295, line: 127, type: !86)
!1517 = !DILocation(line: 132, column: 12, scope: !1513)
!1518 = !DILocation(line: 132, column: 24, scope: !1513)
!1519 = !DILocation(line: 132, column: 31, scope: !1513)
!1520 = !DILocation(line: 132, column: 8, scope: !1513)
!1521 = !DILocation(line: 133, column: 13, scope: !1513)
!1522 = !DILocation(line: 133, column: 21, scope: !1513)
!1523 = !DILocation(line: 133, column: 23, scope: !1513)
!1524 = !DILocation(line: 133, column: 10, scope: !1513)
!1525 = !DILocalVariable(name: "t1", scope: !1501, file: !1295, line: 127, type: !86)
!1526 = !DILocation(line: 134, column: 12, scope: !1513)
!1527 = !DILocation(line: 134, column: 24, scope: !1513)
!1528 = !DILocation(line: 134, column: 31, scope: !1513)
!1529 = !DILocation(line: 134, column: 8, scope: !1513)
!1530 = !DILocation(line: 135, column: 17, scope: !1513)
!1531 = !DILocation(line: 135, column: 20, scope: !1513)
!1532 = !DILocation(line: 135, column: 16, scope: !1513)
!1533 = !DILocation(line: 135, column: 8, scope: !1513)
!1534 = !DILocation(line: 135, column: 10, scope: !1513)
!1535 = !DILocation(line: 135, column: 5, scope: !1513)
!1536 = !DILocation(line: 135, column: 14, scope: !1513)
!1537 = !DILocation(line: 136, column: 17, scope: !1513)
!1538 = !DILocation(line: 136, column: 20, scope: !1513)
!1539 = !DILocation(line: 136, column: 29, scope: !1513)
!1540 = !DILocation(line: 136, column: 32, scope: !1513)
!1541 = !DILocation(line: 136, column: 26, scope: !1513)
!1542 = !DILocation(line: 136, column: 16, scope: !1513)
!1543 = !DILocation(line: 136, column: 8, scope: !1513)
!1544 = !DILocation(line: 136, column: 10, scope: !1513)
!1545 = !DILocation(line: 136, column: 5, scope: !1513)
!1546 = !DILocation(line: 136, column: 14, scope: !1513)
!1547 = !DILocation(line: 137, column: 17, scope: !1513)
!1548 = !DILocation(line: 137, column: 20, scope: !1513)
!1549 = !DILocation(line: 137, column: 16, scope: !1513)
!1550 = !DILocation(line: 137, column: 8, scope: !1513)
!1551 = !DILocation(line: 137, column: 10, scope: !1513)
!1552 = !DILocation(line: 137, column: 5, scope: !1513)
!1553 = !DILocation(line: 137, column: 14, scope: !1513)
!1554 = !DILocation(line: 138, column: 3, scope: !1513)
!1555 = !DILocation(line: 129, column: 24, scope: !1510)
!1556 = !DILocation(line: 129, column: 3, scope: !1510)
!1557 = distinct !{!1557, !1511, !1558, !132}
!1558 = !DILocation(line: 138, column: 3, scope: !1507)
!1559 = !DILocation(line: 139, column: 1, scope: !1501)
!1560 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_frombytes", scope: !1295, file: !1295, line: 151, type: !1404, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1561 = !DILocalVariable(name: "r", arg: 1, scope: !1560, file: !1295, line: 151, type: !1406)
!1562 = !DILocation(line: 0, scope: !1560)
!1563 = !DILocalVariable(name: "a", arg: 2, scope: !1560, file: !1295, line: 151, type: !315)
!1564 = !DILocalVariable(name: "i", scope: !1560, file: !1295, line: 153, type: !40)
!1565 = !DILocation(line: 154, column: 7, scope: !1566)
!1566 = distinct !DILexicalBlock(scope: !1560, file: !1295, line: 154, column: 3)
!1567 = !DILocation(line: 154, scope: !1566)
!1568 = !DILocation(line: 154, column: 12, scope: !1569)
!1569 = distinct !DILexicalBlock(scope: !1566, file: !1295, line: 154, column: 3)
!1570 = !DILocation(line: 154, column: 3, scope: !1566)
!1571 = !DILocation(line: 155, column: 29, scope: !1572)
!1572 = distinct !DILexicalBlock(scope: !1569, file: !1295, line: 154, column: 28)
!1573 = !DILocation(line: 155, column: 31, scope: !1572)
!1574 = !DILocation(line: 155, column: 26, scope: !1572)
!1575 = !DILocation(line: 155, column: 35, scope: !1572)
!1576 = !DILocation(line: 155, column: 57, scope: !1572)
!1577 = !DILocation(line: 155, column: 59, scope: !1572)
!1578 = !DILocation(line: 155, column: 54, scope: !1572)
!1579 = !DILocation(line: 155, column: 44, scope: !1572)
!1580 = !DILocation(line: 155, column: 63, scope: !1572)
!1581 = !DILocation(line: 155, column: 41, scope: !1572)
!1582 = !DILocation(line: 155, column: 70, scope: !1572)
!1583 = !DILocation(line: 155, column: 24, scope: !1572)
!1584 = !DILocation(line: 155, column: 8, scope: !1572)
!1585 = !DILocation(line: 155, column: 16, scope: !1572)
!1586 = !DILocation(line: 155, column: 5, scope: !1572)
!1587 = !DILocation(line: 155, column: 22, scope: !1572)
!1588 = !DILocation(line: 156, column: 29, scope: !1572)
!1589 = !DILocation(line: 156, column: 31, scope: !1572)
!1590 = !DILocation(line: 156, column: 26, scope: !1572)
!1591 = !DILocation(line: 156, column: 35, scope: !1572)
!1592 = !DILocation(line: 156, column: 57, scope: !1572)
!1593 = !DILocation(line: 156, column: 59, scope: !1572)
!1594 = !DILocation(line: 156, column: 54, scope: !1572)
!1595 = !DILocation(line: 156, column: 44, scope: !1572)
!1596 = !DILocation(line: 156, column: 63, scope: !1572)
!1597 = !DILocation(line: 156, column: 41, scope: !1572)
!1598 = !DILocation(line: 156, column: 70, scope: !1572)
!1599 = !DILocation(line: 156, column: 24, scope: !1572)
!1600 = !DILocation(line: 156, column: 8, scope: !1572)
!1601 = !DILocation(line: 156, column: 16, scope: !1572)
!1602 = !DILocation(line: 156, column: 18, scope: !1572)
!1603 = !DILocation(line: 156, column: 5, scope: !1572)
!1604 = !DILocation(line: 156, column: 22, scope: !1572)
!1605 = !DILocation(line: 157, column: 3, scope: !1572)
!1606 = !DILocation(line: 154, column: 24, scope: !1569)
!1607 = !DILocation(line: 154, column: 3, scope: !1569)
!1608 = distinct !{!1608, !1570, !1609, !132}
!1609 = !DILocation(line: 157, column: 3, scope: !1566)
!1610 = !DILocation(line: 158, column: 1, scope: !1560)
!1611 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_frommsg", scope: !1295, file: !1295, line: 168, type: !1404, scopeLine: 169, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1612 = !DILocalVariable(name: "r", arg: 1, scope: !1611, file: !1295, line: 168, type: !1406)
!1613 = !DILocation(line: 0, scope: !1611)
!1614 = !DILocalVariable(name: "msg", arg: 2, scope: !1611, file: !1295, line: 168, type: !315)
!1615 = !DILocalVariable(name: "i", scope: !1611, file: !1295, line: 170, type: !40)
!1616 = !DILocation(line: 176, column: 7, scope: !1617)
!1617 = distinct !DILexicalBlock(scope: !1611, file: !1295, line: 176, column: 3)
!1618 = !DILocation(line: 176, scope: !1617)
!1619 = !DILocation(line: 176, column: 12, scope: !1620)
!1620 = distinct !DILexicalBlock(scope: !1617, file: !1295, line: 176, column: 3)
!1621 = !DILocation(line: 176, column: 3, scope: !1617)
!1622 = !DILocalVariable(name: "j", scope: !1611, file: !1295, line: 170, type: !40)
!1623 = !DILocation(line: 177, column: 9, scope: !1624)
!1624 = distinct !DILexicalBlock(scope: !1625, file: !1295, line: 177, column: 5)
!1625 = distinct !DILexicalBlock(scope: !1620, file: !1295, line: 176, column: 28)
!1626 = !DILocation(line: 177, scope: !1624)
!1627 = !DILocation(line: 177, column: 14, scope: !1628)
!1628 = distinct !DILexicalBlock(scope: !1624, file: !1295, line: 177, column: 5)
!1629 = !DILocation(line: 177, column: 5, scope: !1624)
!1630 = !DILocation(line: 178, column: 10, scope: !1631)
!1631 = distinct !DILexicalBlock(scope: !1628, file: !1295, line: 177, column: 22)
!1632 = !DILocation(line: 178, column: 18, scope: !1631)
!1633 = !DILocation(line: 178, column: 20, scope: !1631)
!1634 = !DILocation(line: 178, column: 7, scope: !1631)
!1635 = !DILocation(line: 178, column: 24, scope: !1631)
!1636 = !DILocation(line: 179, column: 21, scope: !1631)
!1637 = !DILocation(line: 179, column: 18, scope: !1631)
!1638 = !DILocation(line: 179, column: 29, scope: !1631)
!1639 = !DILocation(line: 179, column: 27, scope: !1631)
!1640 = !DILocation(line: 179, column: 31, scope: !1631)
!1641 = !DILocation(line: 179, column: 53, scope: !1631)
!1642 = !DILocation(line: 179, column: 60, scope: !1631)
!1643 = !DILocation(line: 179, column: 65, scope: !1631)
!1644 = !DILocation(line: 179, column: 52, scope: !1631)
!1645 = !DILocation(line: 179, column: 7, scope: !1631)
!1646 = !DILocation(line: 180, column: 5, scope: !1631)
!1647 = !DILocation(line: 177, column: 18, scope: !1628)
!1648 = !DILocation(line: 177, column: 5, scope: !1628)
!1649 = distinct !{!1649, !1629, !1650, !132}
!1650 = !DILocation(line: 180, column: 5, scope: !1624)
!1651 = !DILocation(line: 181, column: 3, scope: !1625)
!1652 = !DILocation(line: 176, column: 24, scope: !1620)
!1653 = !DILocation(line: 176, column: 3, scope: !1620)
!1654 = distinct !{!1654, !1621, !1655, !132}
!1655 = !DILocation(line: 181, column: 3, scope: !1617)
!1656 = !DILocation(line: 182, column: 1, scope: !1611)
!1657 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_tomsg", scope: !1295, file: !1295, line: 192, type: !1296, scopeLine: 193, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1658 = !DILocalVariable(name: "msg", arg: 1, scope: !1657, file: !1295, line: 192, type: !32)
!1659 = !DILocation(line: 0, scope: !1657)
!1660 = !DILocalVariable(name: "a", arg: 2, scope: !1657, file: !1295, line: 192, type: !1298)
!1661 = !DILocalVariable(name: "i", scope: !1657, file: !1295, line: 194, type: !40)
!1662 = !DILocation(line: 197, column: 7, scope: !1663)
!1663 = distinct !DILexicalBlock(scope: !1657, file: !1295, line: 197, column: 3)
!1664 = !DILocation(line: 197, scope: !1663)
!1665 = !DILocation(line: 197, column: 12, scope: !1666)
!1666 = distinct !DILexicalBlock(scope: !1663, file: !1295, line: 197, column: 3)
!1667 = !DILocation(line: 197, column: 3, scope: !1663)
!1668 = !DILocation(line: 198, column: 5, scope: !1669)
!1669 = distinct !DILexicalBlock(scope: !1666, file: !1295, line: 197, column: 28)
!1670 = !DILocation(line: 198, column: 12, scope: !1669)
!1671 = !DILocalVariable(name: "j", scope: !1657, file: !1295, line: 194, type: !40)
!1672 = !DILocation(line: 199, column: 9, scope: !1673)
!1673 = distinct !DILexicalBlock(scope: !1669, file: !1295, line: 199, column: 5)
!1674 = !DILocation(line: 199, scope: !1673)
!1675 = !DILocation(line: 199, column: 14, scope: !1676)
!1676 = distinct !DILexicalBlock(scope: !1673, file: !1295, line: 199, column: 5)
!1677 = !DILocation(line: 199, column: 5, scope: !1673)
!1678 = !DILocation(line: 200, column: 15, scope: !1679)
!1679 = distinct !DILexicalBlock(scope: !1676, file: !1295, line: 199, column: 22)
!1680 = !DILocation(line: 200, column: 23, scope: !1679)
!1681 = !DILocation(line: 200, column: 25, scope: !1679)
!1682 = !DILocation(line: 200, column: 12, scope: !1679)
!1683 = !DILocalVariable(name: "t", scope: !1657, file: !1295, line: 195, type: !91)
!1684 = !DILocation(line: 203, column: 9, scope: !1679)
!1685 = !DILocation(line: 204, column: 9, scope: !1679)
!1686 = !DILocation(line: 205, column: 9, scope: !1679)
!1687 = !DILocation(line: 206, column: 9, scope: !1679)
!1688 = !DILocation(line: 207, column: 9, scope: !1679)
!1689 = !DILocation(line: 208, column: 19, scope: !1679)
!1690 = !DILocation(line: 208, column: 7, scope: !1679)
!1691 = !DILocation(line: 208, column: 14, scope: !1679)
!1692 = !DILocation(line: 209, column: 5, scope: !1679)
!1693 = !DILocation(line: 199, column: 18, scope: !1676)
!1694 = !DILocation(line: 199, column: 5, scope: !1676)
!1695 = distinct !{!1695, !1677, !1696, !132}
!1696 = !DILocation(line: 209, column: 5, scope: !1673)
!1697 = !DILocation(line: 210, column: 3, scope: !1669)
!1698 = !DILocation(line: 197, column: 24, scope: !1666)
!1699 = !DILocation(line: 197, column: 3, scope: !1666)
!1700 = distinct !{!1700, !1667, !1701, !132}
!1701 = !DILocation(line: 210, column: 3, scope: !1663)
!1702 = !DILocation(line: 211, column: 1, scope: !1657)
!1703 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_getnoise_eta1", scope: !1295, file: !1295, line: 225, type: !1704, scopeLine: 226, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1704 = !DISubroutineType(types: !1705)
!1705 = !{null, !1406, !315, !33}
!1706 = !DILocalVariable(name: "r", arg: 1, scope: !1703, file: !1295, line: 225, type: !1406)
!1707 = !DILocation(line: 0, scope: !1703)
!1708 = !DILocalVariable(name: "seed", arg: 2, scope: !1703, file: !1295, line: 225, type: !315)
!1709 = !DILocalVariable(name: "nonce", arg: 3, scope: !1703, file: !1295, line: 225, type: !33)
!1710 = !DILocalVariable(name: "buf", scope: !1703, file: !1295, line: 227, type: !1711)
!1711 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 1024, elements: !64)
!1712 = !DILocation(line: 227, column: 11, scope: !1703)
!1713 = !DILocation(line: 228, column: 3, scope: !1703)
!1714 = !DILocation(line: 229, column: 20, scope: !1703)
!1715 = !DILocation(line: 229, column: 3, scope: !1703)
!1716 = !DILocation(line: 230, column: 1, scope: !1703)
!1717 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_getnoise_eta2", scope: !1295, file: !1295, line: 244, type: !1704, scopeLine: 245, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1718 = !DILocalVariable(name: "r", arg: 1, scope: !1717, file: !1295, line: 244, type: !1406)
!1719 = !DILocation(line: 0, scope: !1717)
!1720 = !DILocalVariable(name: "seed", arg: 2, scope: !1717, file: !1295, line: 244, type: !315)
!1721 = !DILocalVariable(name: "nonce", arg: 3, scope: !1717, file: !1295, line: 244, type: !33)
!1722 = !DILocalVariable(name: "buf", scope: !1717, file: !1295, line: 246, type: !1711)
!1723 = !DILocation(line: 246, column: 11, scope: !1717)
!1724 = !DILocation(line: 247, column: 3, scope: !1717)
!1725 = !DILocation(line: 248, column: 20, scope: !1717)
!1726 = !DILocation(line: 248, column: 3, scope: !1717)
!1727 = !DILocation(line: 249, column: 1, scope: !1717)
!1728 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_ntt", scope: !1295, file: !1295, line: 261, type: !1729, scopeLine: 262, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1729 = !DISubroutineType(types: !1730)
!1730 = !{null, !1406}
!1731 = !DILocalVariable(name: "r", arg: 1, scope: !1728, file: !1295, line: 261, type: !1406)
!1732 = !DILocation(line: 0, scope: !1728)
!1733 = !DILocation(line: 263, column: 10, scope: !1728)
!1734 = !DILocation(line: 263, column: 7, scope: !1728)
!1735 = !DILocation(line: 263, column: 3, scope: !1728)
!1736 = !DILocation(line: 264, column: 3, scope: !1728)
!1737 = !DILocation(line: 265, column: 1, scope: !1728)
!1738 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_reduce", scope: !1295, file: !1295, line: 323, type: !1729, scopeLine: 324, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1739 = !DILocalVariable(name: "r", arg: 1, scope: !1738, file: !1295, line: 323, type: !1406)
!1740 = !DILocation(line: 0, scope: !1738)
!1741 = !DILocalVariable(name: "i", scope: !1738, file: !1295, line: 325, type: !40)
!1742 = !DILocation(line: 326, column: 7, scope: !1743)
!1743 = distinct !DILexicalBlock(scope: !1738, file: !1295, line: 326, column: 3)
!1744 = !DILocation(line: 326, scope: !1743)
!1745 = !DILocation(line: 326, column: 12, scope: !1746)
!1746 = distinct !DILexicalBlock(scope: !1743, file: !1295, line: 326, column: 3)
!1747 = !DILocation(line: 326, column: 3, scope: !1743)
!1748 = !DILocation(line: 327, column: 38, scope: !1746)
!1749 = !DILocation(line: 327, column: 35, scope: !1746)
!1750 = !DILocation(line: 327, column: 20, scope: !1746)
!1751 = !DILocation(line: 327, column: 8, scope: !1746)
!1752 = !DILocation(line: 327, column: 5, scope: !1746)
!1753 = !DILocation(line: 327, column: 18, scope: !1746)
!1754 = !DILocation(line: 326, column: 22, scope: !1746)
!1755 = !DILocation(line: 326, column: 3, scope: !1746)
!1756 = distinct !{!1756, !1747, !1757, !132}
!1757 = !DILocation(line: 327, column: 47, scope: !1743)
!1758 = !DILocation(line: 328, column: 1, scope: !1738)
!1759 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_invntt_tomont", scope: !1295, file: !1295, line: 276, type: !1729, scopeLine: 277, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1760 = !DILocalVariable(name: "r", arg: 1, scope: !1759, file: !1295, line: 276, type: !1406)
!1761 = !DILocation(line: 0, scope: !1759)
!1762 = !DILocation(line: 278, column: 13, scope: !1759)
!1763 = !DILocation(line: 278, column: 10, scope: !1759)
!1764 = !DILocation(line: 278, column: 3, scope: !1759)
!1765 = !DILocation(line: 279, column: 1, scope: !1759)
!1766 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_basemul_montgomery", scope: !1295, file: !1295, line: 290, type: !1767, scopeLine: 291, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1767 = !DISubroutineType(types: !1768)
!1768 = !{null, !1406, !1298, !1298}
!1769 = !DILocalVariable(name: "r", arg: 1, scope: !1766, file: !1295, line: 290, type: !1406)
!1770 = !DILocation(line: 0, scope: !1766)
!1771 = !DILocalVariable(name: "a", arg: 2, scope: !1766, file: !1295, line: 290, type: !1298)
!1772 = !DILocalVariable(name: "b", arg: 3, scope: !1766, file: !1295, line: 290, type: !1298)
!1773 = !DILocalVariable(name: "i", scope: !1766, file: !1295, line: 292, type: !40)
!1774 = !DILocation(line: 293, column: 7, scope: !1775)
!1775 = distinct !DILexicalBlock(scope: !1766, file: !1295, line: 293, column: 3)
!1776 = !DILocation(line: 293, scope: !1775)
!1777 = !DILocation(line: 293, column: 12, scope: !1778)
!1778 = distinct !DILexicalBlock(scope: !1775, file: !1295, line: 293, column: 3)
!1779 = !DILocation(line: 293, column: 3, scope: !1775)
!1780 = !DILocation(line: 294, column: 17, scope: !1781)
!1781 = distinct !DILexicalBlock(scope: !1778, file: !1295, line: 293, column: 28)
!1782 = !DILocation(line: 294, column: 25, scope: !1781)
!1783 = !DILocation(line: 294, column: 14, scope: !1781)
!1784 = !DILocation(line: 294, column: 34, scope: !1781)
!1785 = !DILocation(line: 294, column: 42, scope: !1781)
!1786 = !DILocation(line: 294, column: 31, scope: !1781)
!1787 = !DILocation(line: 294, column: 51, scope: !1781)
!1788 = !DILocation(line: 294, column: 59, scope: !1781)
!1789 = !DILocation(line: 294, column: 48, scope: !1781)
!1790 = !DILocation(line: 294, column: 72, scope: !1781)
!1791 = !DILocation(line: 294, column: 64, scope: !1781)
!1792 = !DILocation(line: 294, column: 5, scope: !1781)
!1793 = !DILocation(line: 295, column: 17, scope: !1781)
!1794 = !DILocation(line: 295, column: 25, scope: !1781)
!1795 = !DILocation(line: 295, column: 27, scope: !1781)
!1796 = !DILocation(line: 295, column: 14, scope: !1781)
!1797 = !DILocation(line: 295, column: 36, scope: !1781)
!1798 = !DILocation(line: 295, column: 44, scope: !1781)
!1799 = !DILocation(line: 295, column: 46, scope: !1781)
!1800 = !DILocation(line: 295, column: 33, scope: !1781)
!1801 = !DILocation(line: 295, column: 55, scope: !1781)
!1802 = !DILocation(line: 295, column: 63, scope: !1781)
!1803 = !DILocation(line: 295, column: 65, scope: !1781)
!1804 = !DILocation(line: 295, column: 52, scope: !1781)
!1805 = !DILocation(line: 295, column: 79, scope: !1781)
!1806 = !DILocation(line: 295, column: 71, scope: !1781)
!1807 = !DILocation(line: 295, column: 70, scope: !1781)
!1808 = !DILocation(line: 295, column: 5, scope: !1781)
!1809 = !DILocation(line: 296, column: 3, scope: !1781)
!1810 = !DILocation(line: 293, column: 24, scope: !1778)
!1811 = !DILocation(line: 293, column: 3, scope: !1778)
!1812 = distinct !{!1812, !1779, !1813, !132}
!1813 = !DILocation(line: 296, column: 3, scope: !1775)
!1814 = !DILocation(line: 297, column: 1, scope: !1766)
!1815 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_tomont", scope: !1295, file: !1295, line: 307, type: !1729, scopeLine: 308, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1816 = !DILocalVariable(name: "r", arg: 1, scope: !1815, file: !1295, line: 307, type: !1406)
!1817 = !DILocation(line: 0, scope: !1815)
!1818 = !DILocalVariable(name: "f", scope: !1815, file: !1295, line: 310, type: !60)
!1819 = !DILocalVariable(name: "i", scope: !1815, file: !1295, line: 309, type: !40)
!1820 = !DILocation(line: 311, column: 7, scope: !1821)
!1821 = distinct !DILexicalBlock(scope: !1815, file: !1295, line: 311, column: 3)
!1822 = !DILocation(line: 311, scope: !1821)
!1823 = !DILocation(line: 311, column: 12, scope: !1824)
!1824 = distinct !DILexicalBlock(scope: !1821, file: !1295, line: 311, column: 3)
!1825 = !DILocation(line: 311, column: 3, scope: !1821)
!1826 = !DILocation(line: 312, column: 50, scope: !1824)
!1827 = !DILocation(line: 312, column: 47, scope: !1824)
!1828 = !DILocation(line: 312, column: 38, scope: !1824)
!1829 = !DILocation(line: 312, column: 59, scope: !1824)
!1830 = !DILocation(line: 312, column: 20, scope: !1824)
!1831 = !DILocation(line: 312, column: 8, scope: !1824)
!1832 = !DILocation(line: 312, column: 5, scope: !1824)
!1833 = !DILocation(line: 312, column: 18, scope: !1824)
!1834 = !DILocation(line: 311, column: 22, scope: !1824)
!1835 = !DILocation(line: 311, column: 3, scope: !1824)
!1836 = distinct !{!1836, !1825, !1837, !132}
!1837 = !DILocation(line: 312, column: 61, scope: !1821)
!1838 = !DILocation(line: 313, column: 1, scope: !1815)
!1839 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_add", scope: !1295, file: !1295, line: 339, type: !1767, scopeLine: 340, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1840 = !DILocalVariable(name: "r", arg: 1, scope: !1839, file: !1295, line: 339, type: !1406)
!1841 = !DILocation(line: 0, scope: !1839)
!1842 = !DILocalVariable(name: "a", arg: 2, scope: !1839, file: !1295, line: 339, type: !1298)
!1843 = !DILocalVariable(name: "b", arg: 3, scope: !1839, file: !1295, line: 339, type: !1298)
!1844 = !DILocalVariable(name: "i", scope: !1839, file: !1295, line: 341, type: !40)
!1845 = !DILocation(line: 342, column: 7, scope: !1846)
!1846 = distinct !DILexicalBlock(scope: !1839, file: !1295, line: 342, column: 3)
!1847 = !DILocation(line: 342, scope: !1846)
!1848 = !DILocation(line: 342, column: 12, scope: !1849)
!1849 = distinct !DILexicalBlock(scope: !1846, file: !1295, line: 342, column: 3)
!1850 = !DILocation(line: 342, column: 3, scope: !1846)
!1851 = !DILocation(line: 343, column: 23, scope: !1849)
!1852 = !DILocation(line: 343, column: 20, scope: !1849)
!1853 = !DILocation(line: 343, column: 38, scope: !1849)
!1854 = !DILocation(line: 343, column: 35, scope: !1849)
!1855 = !DILocation(line: 343, column: 33, scope: !1849)
!1856 = !DILocation(line: 343, column: 8, scope: !1849)
!1857 = !DILocation(line: 343, column: 5, scope: !1849)
!1858 = !DILocation(line: 343, column: 18, scope: !1849)
!1859 = !DILocation(line: 342, column: 22, scope: !1849)
!1860 = !DILocation(line: 342, column: 3, scope: !1849)
!1861 = distinct !{!1861, !1850, !1862, !132}
!1862 = !DILocation(line: 343, column: 46, scope: !1846)
!1863 = !DILocation(line: 344, column: 1, scope: !1839)
!1864 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_sub", scope: !1295, file: !1295, line: 355, type: !1767, scopeLine: 356, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1865 = !DILocalVariable(name: "r", arg: 1, scope: !1864, file: !1295, line: 355, type: !1406)
!1866 = !DILocation(line: 0, scope: !1864)
!1867 = !DILocalVariable(name: "a", arg: 2, scope: !1864, file: !1295, line: 355, type: !1298)
!1868 = !DILocalVariable(name: "b", arg: 3, scope: !1864, file: !1295, line: 355, type: !1298)
!1869 = !DILocalVariable(name: "i", scope: !1864, file: !1295, line: 357, type: !40)
!1870 = !DILocation(line: 358, column: 7, scope: !1871)
!1871 = distinct !DILexicalBlock(scope: !1864, file: !1295, line: 358, column: 3)
!1872 = !DILocation(line: 358, scope: !1871)
!1873 = !DILocation(line: 358, column: 12, scope: !1874)
!1874 = distinct !DILexicalBlock(scope: !1871, file: !1295, line: 358, column: 3)
!1875 = !DILocation(line: 358, column: 3, scope: !1871)
!1876 = !DILocation(line: 359, column: 23, scope: !1874)
!1877 = !DILocation(line: 359, column: 20, scope: !1874)
!1878 = !DILocation(line: 359, column: 38, scope: !1874)
!1879 = !DILocation(line: 359, column: 35, scope: !1874)
!1880 = !DILocation(line: 359, column: 33, scope: !1874)
!1881 = !DILocation(line: 359, column: 8, scope: !1874)
!1882 = !DILocation(line: 359, column: 5, scope: !1874)
!1883 = !DILocation(line: 359, column: 18, scope: !1874)
!1884 = !DILocation(line: 358, column: 22, scope: !1874)
!1885 = !DILocation(line: 358, column: 3, scope: !1874)
!1886 = distinct !{!1886, !1875, !1887, !132}
!1887 = !DILocation(line: 359, column: 46, scope: !1871)
!1888 = !DILocation(line: 360, column: 1, scope: !1864)
!1889 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_ntt", scope: !58, file: !58, line: 80, type: !1890, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !53, retainedNodes: !49)
!1890 = !DISubroutineType(types: !1891)
!1891 = !{null, !517}
!1892 = !DILocalVariable(name: "r", arg: 1, scope: !1889, file: !58, line: 80, type: !517)
!1893 = !DILocation(line: 0, scope: !1889)
!1894 = !DILocalVariable(name: "k", scope: !1889, file: !58, line: 81, type: !40)
!1895 = !DILocalVariable(name: "len", scope: !1889, file: !58, line: 81, type: !40)
!1896 = !DILocation(line: 85, column: 7, scope: !1897)
!1897 = distinct !DILexicalBlock(scope: !1889, file: !58, line: 85, column: 3)
!1898 = !DILocation(line: 85, scope: !1897)
!1899 = !DILocation(line: 84, column: 5, scope: !1889)
!1900 = !DILocation(line: 85, column: 22, scope: !1901)
!1901 = distinct !DILexicalBlock(scope: !1897, file: !58, line: 85, column: 3)
!1902 = !DILocation(line: 85, column: 3, scope: !1897)
!1903 = !DILocalVariable(name: "start", scope: !1889, file: !58, line: 81, type: !40)
!1904 = !DILocation(line: 86, column: 9, scope: !1905)
!1905 = distinct !DILexicalBlock(scope: !1906, file: !58, line: 86, column: 5)
!1906 = distinct !DILexicalBlock(scope: !1901, file: !58, line: 85, column: 39)
!1907 = !DILocation(line: 86, scope: !1905)
!1908 = !DILocation(line: 86, column: 26, scope: !1909)
!1909 = distinct !DILexicalBlock(scope: !1905, file: !58, line: 86, column: 5)
!1910 = !DILocation(line: 86, column: 5, scope: !1905)
!1911 = !DILocation(line: 87, column: 21, scope: !1912)
!1912 = distinct !DILexicalBlock(scope: !1909, file: !58, line: 86, column: 50)
!1913 = !DILocation(line: 87, column: 14, scope: !1912)
!1914 = !DILocalVariable(name: "zeta", scope: !1889, file: !58, line: 82, type: !61)
!1915 = !DILocalVariable(name: "j", scope: !1889, file: !58, line: 81, type: !40)
!1916 = !DILocation(line: 88, column: 11, scope: !1917)
!1917 = distinct !DILexicalBlock(scope: !1912, file: !58, line: 88, column: 7)
!1918 = !DILocation(line: 88, scope: !1917)
!1919 = !DILocation(line: 88, column: 32, scope: !1920)
!1920 = distinct !DILexicalBlock(scope: !1917, file: !58, line: 88, column: 7)
!1921 = !DILocation(line: 88, column: 24, scope: !1920)
!1922 = !DILocation(line: 88, column: 7, scope: !1917)
!1923 = !DILocation(line: 89, column: 29, scope: !1924)
!1924 = distinct !DILexicalBlock(scope: !1920, file: !58, line: 88, column: 44)
!1925 = !DILocation(line: 89, column: 25, scope: !1924)
!1926 = !DILocation(line: 89, column: 13, scope: !1924)
!1927 = !DILocalVariable(name: "t", scope: !1889, file: !58, line: 82, type: !61)
!1928 = !DILocation(line: 90, column: 22, scope: !1924)
!1929 = !DILocation(line: 90, column: 29, scope: !1924)
!1930 = !DILocation(line: 90, column: 27, scope: !1924)
!1931 = !DILocation(line: 90, column: 13, scope: !1924)
!1932 = !DILocation(line: 90, column: 9, scope: !1924)
!1933 = !DILocation(line: 90, column: 20, scope: !1924)
!1934 = !DILocation(line: 91, column: 16, scope: !1924)
!1935 = !DILocation(line: 91, column: 23, scope: !1924)
!1936 = !DILocation(line: 91, column: 21, scope: !1924)
!1937 = !DILocation(line: 91, column: 9, scope: !1924)
!1938 = !DILocation(line: 91, column: 14, scope: !1924)
!1939 = !DILocation(line: 92, column: 7, scope: !1924)
!1940 = !DILocation(line: 88, column: 40, scope: !1920)
!1941 = !DILocation(line: 88, column: 7, scope: !1920)
!1942 = distinct !{!1942, !1922, !1943, !132}
!1943 = !DILocation(line: 92, column: 7, scope: !1917)
!1944 = !DILocation(line: 93, column: 5, scope: !1912)
!1945 = !DILocation(line: 86, column: 43, scope: !1909)
!1946 = !DILocation(line: 86, column: 5, scope: !1909)
!1947 = distinct !{!1947, !1910, !1948, !132}
!1948 = !DILocation(line: 93, column: 5, scope: !1905)
!1949 = !DILocation(line: 94, column: 3, scope: !1906)
!1950 = !DILocation(line: 85, column: 32, scope: !1901)
!1951 = !DILocation(line: 85, column: 3, scope: !1901)
!1952 = distinct !{!1952, !1902, !1953, !132}
!1953 = !DILocation(line: 94, column: 3, scope: !1897)
!1954 = !DILocation(line: 95, column: 1, scope: !1889)
!1955 = distinct !DISubprogram(name: "fqmul", scope: !58, file: !58, line: 68, type: !1956, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !53, retainedNodes: !49)
!1956 = !DISubroutineType(types: !1957)
!1957 = !{!61, !61, !61}
!1958 = !DILocalVariable(name: "a", arg: 1, scope: !1955, file: !58, line: 68, type: !61)
!1959 = !DILocation(line: 0, scope: !1955)
!1960 = !DILocalVariable(name: "b", arg: 2, scope: !1955, file: !58, line: 68, type: !61)
!1961 = !DILocation(line: 69, column: 28, scope: !1955)
!1962 = !DILocation(line: 69, column: 39, scope: !1955)
!1963 = !DILocation(line: 69, column: 38, scope: !1955)
!1964 = !DILocation(line: 69, column: 10, scope: !1955)
!1965 = !DILocation(line: 69, column: 3, scope: !1955)
!1966 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_invntt", scope: !58, file: !58, line: 106, type: !1890, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !53, retainedNodes: !49)
!1967 = !DILocalVariable(name: "r", arg: 1, scope: !1966, file: !58, line: 106, type: !517)
!1968 = !DILocation(line: 0, scope: !1966)
!1969 = !DILocalVariable(name: "f", scope: !1966, file: !58, line: 109, type: !60)
!1970 = !DILocalVariable(name: "k", scope: !1966, file: !58, line: 107, type: !40)
!1971 = !DILocalVariable(name: "len", scope: !1966, file: !58, line: 107, type: !40)
!1972 = !DILocation(line: 112, column: 7, scope: !1973)
!1973 = distinct !DILexicalBlock(scope: !1966, file: !58, line: 112, column: 3)
!1974 = !DILocation(line: 112, scope: !1973)
!1975 = !DILocation(line: 111, column: 5, scope: !1966)
!1976 = !DILocation(line: 112, column: 20, scope: !1977)
!1977 = distinct !DILexicalBlock(scope: !1973, file: !58, line: 112, column: 3)
!1978 = !DILocation(line: 112, column: 3, scope: !1973)
!1979 = !DILocalVariable(name: "start", scope: !1966, file: !58, line: 107, type: !40)
!1980 = !DILocation(line: 113, column: 9, scope: !1981)
!1981 = distinct !DILexicalBlock(scope: !1982, file: !58, line: 113, column: 5)
!1982 = distinct !DILexicalBlock(scope: !1977, file: !58, line: 112, column: 39)
!1983 = !DILocation(line: 113, scope: !1981)
!1984 = !DILocation(line: 113, column: 26, scope: !1985)
!1985 = distinct !DILexicalBlock(scope: !1981, file: !58, line: 113, column: 5)
!1986 = !DILocation(line: 113, column: 5, scope: !1981)
!1987 = !DILocation(line: 114, column: 21, scope: !1988)
!1988 = distinct !DILexicalBlock(scope: !1985, file: !58, line: 113, column: 50)
!1989 = !DILocation(line: 114, column: 14, scope: !1988)
!1990 = !DILocalVariable(name: "zeta", scope: !1966, file: !58, line: 108, type: !61)
!1991 = !DILocalVariable(name: "j", scope: !1966, file: !58, line: 107, type: !40)
!1992 = !DILocation(line: 115, column: 11, scope: !1993)
!1993 = distinct !DILexicalBlock(scope: !1988, file: !58, line: 115, column: 7)
!1994 = !DILocation(line: 115, scope: !1993)
!1995 = !DILocation(line: 115, column: 32, scope: !1996)
!1996 = distinct !DILexicalBlock(scope: !1993, file: !58, line: 115, column: 7)
!1997 = !DILocation(line: 115, column: 24, scope: !1996)
!1998 = !DILocation(line: 115, column: 7, scope: !1993)
!1999 = !DILocation(line: 116, column: 13, scope: !2000)
!2000 = distinct !DILexicalBlock(scope: !1996, file: !58, line: 115, column: 44)
!2001 = !DILocalVariable(name: "t", scope: !1966, file: !58, line: 108, type: !61)
!2002 = !DILocation(line: 117, column: 31, scope: !2000)
!2003 = !DILocation(line: 117, column: 39, scope: !2000)
!2004 = !DILocation(line: 117, column: 35, scope: !2000)
!2005 = !DILocation(line: 117, column: 33, scope: !2000)
!2006 = !DILocation(line: 117, column: 16, scope: !2000)
!2007 = !DILocation(line: 117, column: 9, scope: !2000)
!2008 = !DILocation(line: 117, column: 14, scope: !2000)
!2009 = !DILocation(line: 118, column: 26, scope: !2000)
!2010 = !DILocation(line: 118, column: 22, scope: !2000)
!2011 = !DILocation(line: 118, column: 35, scope: !2000)
!2012 = !DILocation(line: 118, column: 33, scope: !2000)
!2013 = !DILocation(line: 118, column: 13, scope: !2000)
!2014 = !DILocation(line: 118, column: 9, scope: !2000)
!2015 = !DILocation(line: 118, column: 20, scope: !2000)
!2016 = !DILocation(line: 119, column: 38, scope: !2000)
!2017 = !DILocation(line: 119, column: 34, scope: !2000)
!2018 = !DILocation(line: 119, column: 22, scope: !2000)
!2019 = !DILocation(line: 119, column: 13, scope: !2000)
!2020 = !DILocation(line: 119, column: 9, scope: !2000)
!2021 = !DILocation(line: 119, column: 20, scope: !2000)
!2022 = !DILocation(line: 120, column: 7, scope: !2000)
!2023 = !DILocation(line: 115, column: 40, scope: !1996)
!2024 = !DILocation(line: 115, column: 7, scope: !1996)
!2025 = distinct !{!2025, !1998, !2026, !132}
!2026 = !DILocation(line: 120, column: 7, scope: !1993)
!2027 = !DILocation(line: 121, column: 5, scope: !1988)
!2028 = !DILocation(line: 113, column: 43, scope: !1985)
!2029 = !DILocation(line: 113, column: 5, scope: !1985)
!2030 = distinct !{!2030, !1986, !2031, !132}
!2031 = !DILocation(line: 121, column: 5, scope: !1981)
!2032 = !DILocation(line: 122, column: 3, scope: !1982)
!2033 = !DILocation(line: 112, column: 32, scope: !1977)
!2034 = !DILocation(line: 112, column: 3, scope: !1977)
!2035 = distinct !{!2035, !1978, !2036, !132}
!2036 = !DILocation(line: 122, column: 3, scope: !1973)
!2037 = !DILocation(line: 124, column: 7, scope: !2038)
!2038 = distinct !DILexicalBlock(scope: !1966, file: !58, line: 124, column: 3)
!2039 = !DILocation(line: 124, scope: !2038)
!2040 = !DILocation(line: 124, column: 16, scope: !2041)
!2041 = distinct !DILexicalBlock(scope: !2038, file: !58, line: 124, column: 3)
!2042 = !DILocation(line: 124, column: 3, scope: !2038)
!2043 = !DILocation(line: 125, column: 18, scope: !2041)
!2044 = !DILocation(line: 125, column: 12, scope: !2041)
!2045 = !DILocation(line: 125, column: 5, scope: !2041)
!2046 = !DILocation(line: 125, column: 10, scope: !2041)
!2047 = !DILocation(line: 124, column: 24, scope: !2041)
!2048 = !DILocation(line: 124, column: 3, scope: !2041)
!2049 = distinct !{!2049, !2042, !2050, !132}
!2050 = !DILocation(line: 125, column: 25, scope: !2038)
!2051 = !DILocation(line: 126, column: 1, scope: !1966)
!2052 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_basemul", scope: !58, file: !58, line: 139, type: !2053, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !53, retainedNodes: !49)
!2053 = !DISubroutineType(types: !2054)
!2054 = !{null, !517, !2055, !2055, !61}
!2055 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 32)
!2056 = !DILocalVariable(name: "r", arg: 1, scope: !2052, file: !58, line: 139, type: !517)
!2057 = !DILocation(line: 0, scope: !2052)
!2058 = !DILocalVariable(name: "a", arg: 2, scope: !2052, file: !58, line: 139, type: !2055)
!2059 = !DILocalVariable(name: "b", arg: 3, scope: !2052, file: !58, line: 139, type: !2055)
!2060 = !DILocalVariable(name: "zeta", arg: 4, scope: !2052, file: !58, line: 139, type: !61)
!2061 = !DILocation(line: 141, column: 17, scope: !2052)
!2062 = !DILocation(line: 141, column: 23, scope: !2052)
!2063 = !DILocation(line: 141, column: 11, scope: !2052)
!2064 = !DILocation(line: 141, column: 3, scope: !2052)
!2065 = !DILocation(line: 141, column: 9, scope: !2052)
!2066 = !DILocation(line: 142, column: 17, scope: !2052)
!2067 = !DILocation(line: 142, column: 11, scope: !2052)
!2068 = !DILocation(line: 142, column: 3, scope: !2052)
!2069 = !DILocation(line: 142, column: 9, scope: !2052)
!2070 = !DILocation(line: 143, column: 17, scope: !2052)
!2071 = !DILocation(line: 143, column: 23, scope: !2052)
!2072 = !DILocation(line: 143, column: 11, scope: !2052)
!2073 = !DILocation(line: 143, column: 3, scope: !2052)
!2074 = !DILocation(line: 143, column: 8, scope: !2052)
!2075 = !DILocation(line: 144, column: 17, scope: !2052)
!2076 = !DILocation(line: 144, column: 23, scope: !2052)
!2077 = !DILocation(line: 144, column: 11, scope: !2052)
!2078 = !DILocation(line: 144, column: 3, scope: !2052)
!2079 = !DILocation(line: 144, column: 9, scope: !2052)
!2080 = !DILocation(line: 145, column: 17, scope: !2052)
!2081 = !DILocation(line: 145, column: 23, scope: !2052)
!2082 = !DILocation(line: 145, column: 11, scope: !2052)
!2083 = !DILocation(line: 145, column: 3, scope: !2052)
!2084 = !DILocation(line: 145, column: 8, scope: !2052)
!2085 = !DILocation(line: 146, column: 1, scope: !2052)
!2086 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_cbd_eta1", scope: !2087, file: !2087, line: 110, type: !2088, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !95, retainedNodes: !49)
!2087 = !DIFile(filename: "../../ref/cbd.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!2088 = !DISubroutineType(types: !2089)
!2089 = !{null, !2090, !315}
!2090 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2091, size: 32)
!2091 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !429, line: 13, baseType: !2092)
!2092 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !429, line: 11, size: 4096, elements: !2093)
!2093 = !{!2094}
!2094 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !2092, file: !429, line: 12, baseType: !433, size: 4096)
!2095 = !DILocalVariable(name: "r", arg: 1, scope: !2086, file: !2087, line: 110, type: !2090)
!2096 = !DILocation(line: 0, scope: !2086)
!2097 = !DILocalVariable(name: "buf", arg: 2, scope: !2086, file: !2087, line: 110, type: !315)
!2098 = !DILocation(line: 113, column: 3, scope: !2086)
!2099 = !DILocation(line: 119, column: 1, scope: !2086)
!2100 = distinct !DISubprogram(name: "cbd2", scope: !2087, file: !2087, line: 58, type: !2088, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !95, retainedNodes: !49)
!2101 = !DILocalVariable(name: "r", arg: 1, scope: !2100, file: !2087, line: 58, type: !2090)
!2102 = !DILocation(line: 0, scope: !2100)
!2103 = !DILocalVariable(name: "buf", arg: 2, scope: !2100, file: !2087, line: 58, type: !315)
!2104 = !DILocalVariable(name: "i", scope: !2100, file: !2087, line: 60, type: !40)
!2105 = !DILocation(line: 64, column: 7, scope: !2106)
!2106 = distinct !DILexicalBlock(scope: !2100, file: !2087, line: 64, column: 3)
!2107 = !DILocation(line: 64, scope: !2106)
!2108 = !DILocation(line: 64, column: 12, scope: !2109)
!2109 = distinct !DILexicalBlock(scope: !2106, file: !2087, line: 64, column: 3)
!2110 = !DILocation(line: 64, column: 3, scope: !2106)
!2111 = !DILocation(line: 65, column: 35, scope: !2112)
!2112 = distinct !DILexicalBlock(scope: !2109, file: !2087, line: 64, column: 28)
!2113 = !DILocation(line: 65, column: 33, scope: !2112)
!2114 = !DILocation(line: 65, column: 10, scope: !2112)
!2115 = !DILocalVariable(name: "t", scope: !2100, file: !2087, line: 61, type: !91)
!2116 = !DILocation(line: 66, column: 12, scope: !2112)
!2117 = !DILocalVariable(name: "d", scope: !2100, file: !2087, line: 61, type: !91)
!2118 = !DILocation(line: 67, column: 12, scope: !2112)
!2119 = !DILocation(line: 67, column: 17, scope: !2112)
!2120 = !DILocation(line: 67, column: 7, scope: !2112)
!2121 = !DILocalVariable(name: "j", scope: !2100, file: !2087, line: 60, type: !40)
!2122 = !DILocation(line: 69, column: 9, scope: !2123)
!2123 = distinct !DILexicalBlock(scope: !2112, file: !2087, line: 69, column: 5)
!2124 = !DILocation(line: 69, scope: !2123)
!2125 = !DILocation(line: 69, column: 14, scope: !2126)
!2126 = distinct !DILexicalBlock(scope: !2123, file: !2087, line: 69, column: 5)
!2127 = !DILocation(line: 69, column: 5, scope: !2123)
!2128 = !DILocation(line: 70, column: 19, scope: !2129)
!2129 = distinct !DILexicalBlock(scope: !2126, file: !2087, line: 69, column: 22)
!2130 = !DILocation(line: 70, column: 21, scope: !2129)
!2131 = !DILocation(line: 70, column: 14, scope: !2129)
!2132 = !DILocation(line: 70, column: 26, scope: !2129)
!2133 = !DILocation(line: 70, column: 11, scope: !2129)
!2134 = !DILocalVariable(name: "a", scope: !2100, file: !2087, line: 62, type: !61)
!2135 = !DILocation(line: 71, column: 19, scope: !2129)
!2136 = !DILocation(line: 71, column: 21, scope: !2129)
!2137 = !DILocation(line: 71, column: 14, scope: !2129)
!2138 = !DILocation(line: 71, column: 26, scope: !2129)
!2139 = !DILocation(line: 71, column: 11, scope: !2129)
!2140 = !DILocalVariable(name: "b", scope: !2100, file: !2087, line: 62, type: !61)
!2141 = !DILocation(line: 72, column: 26, scope: !2129)
!2142 = !DILocation(line: 72, column: 30, scope: !2129)
!2143 = !DILocation(line: 72, column: 28, scope: !2129)
!2144 = !DILocation(line: 72, column: 10, scope: !2129)
!2145 = !DILocation(line: 72, column: 18, scope: !2129)
!2146 = !DILocation(line: 72, column: 20, scope: !2129)
!2147 = !DILocation(line: 72, column: 7, scope: !2129)
!2148 = !DILocation(line: 72, column: 24, scope: !2129)
!2149 = !DILocation(line: 73, column: 5, scope: !2129)
!2150 = !DILocation(line: 69, column: 18, scope: !2126)
!2151 = !DILocation(line: 69, column: 5, scope: !2126)
!2152 = distinct !{!2152, !2127, !2153, !132}
!2153 = !DILocation(line: 73, column: 5, scope: !2123)
!2154 = !DILocation(line: 74, column: 3, scope: !2112)
!2155 = !DILocation(line: 64, column: 24, scope: !2109)
!2156 = !DILocation(line: 64, column: 3, scope: !2109)
!2157 = distinct !{!2157, !2110, !2158, !132}
!2158 = !DILocation(line: 74, column: 3, scope: !2106)
!2159 = !DILocation(line: 75, column: 1, scope: !2100)
!2160 = distinct !DISubprogram(name: "load32_littleendian", scope: !2087, file: !2087, line: 15, type: !2161, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !95, retainedNodes: !49)
!2161 = !DISubroutineType(types: !2162)
!2162 = !{!91, !315}
!2163 = !DILocalVariable(name: "x", arg: 1, scope: !2160, file: !2087, line: 15, type: !315)
!2164 = !DILocation(line: 0, scope: !2160)
!2165 = !DILocation(line: 18, column: 18, scope: !2160)
!2166 = !DILocation(line: 18, column: 8, scope: !2160)
!2167 = !DILocalVariable(name: "r", scope: !2160, file: !2087, line: 17, type: !91)
!2168 = !DILocation(line: 19, column: 18, scope: !2160)
!2169 = !DILocation(line: 19, column: 8, scope: !2160)
!2170 = !DILocation(line: 19, column: 23, scope: !2160)
!2171 = !DILocation(line: 19, column: 5, scope: !2160)
!2172 = !DILocation(line: 20, column: 18, scope: !2160)
!2173 = !DILocation(line: 20, column: 8, scope: !2160)
!2174 = !DILocation(line: 20, column: 23, scope: !2160)
!2175 = !DILocation(line: 20, column: 5, scope: !2160)
!2176 = !DILocation(line: 21, column: 18, scope: !2160)
!2177 = !DILocation(line: 21, column: 8, scope: !2160)
!2178 = !DILocation(line: 21, column: 23, scope: !2160)
!2179 = !DILocation(line: 21, column: 5, scope: !2160)
!2180 = !DILocation(line: 22, column: 3, scope: !2160)
!2181 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_poly_cbd_eta2", scope: !2087, file: !2087, line: 121, type: !2088, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !95, retainedNodes: !49)
!2182 = !DILocalVariable(name: "r", arg: 1, scope: !2181, file: !2087, line: 121, type: !2090)
!2183 = !DILocation(line: 0, scope: !2181)
!2184 = !DILocalVariable(name: "buf", arg: 2, scope: !2181, file: !2087, line: 121, type: !315)
!2185 = !DILocation(line: 124, column: 3, scope: !2181)
!2186 = !DILocation(line: 128, column: 1, scope: !2181)
!2187 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_montgomery_reduce", scope: !2188, file: !2188, line: 16, type: !2189, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !97, retainedNodes: !49)
!2188 = !DIFile(filename: "../../ref/reduce.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!2189 = !DISubroutineType(types: !98)
!2190 = !DILocalVariable(name: "a", arg: 1, scope: !2187, file: !2188, line: 16, type: !55)
!2191 = !DILocation(line: 0, scope: !2187)
!2192 = !DILocation(line: 20, column: 7, scope: !2187)
!2193 = !DILocation(line: 20, column: 17, scope: !2187)
!2194 = !DILocalVariable(name: "t", scope: !2187, file: !2188, line: 18, type: !61)
!2195 = !DILocation(line: 21, column: 12, scope: !2187)
!2196 = !DILocation(line: 21, column: 22, scope: !2187)
!2197 = !DILocation(line: 21, column: 10, scope: !2187)
!2198 = !DILocation(line: 21, column: 32, scope: !2187)
!2199 = !DILocation(line: 21, column: 7, scope: !2187)
!2200 = !DILocation(line: 22, column: 3, scope: !2187)
!2201 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_barrett_reduce", scope: !2188, file: !2188, line: 35, type: !2202, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !97, retainedNodes: !49)
!2202 = !DISubroutineType(types: !2203)
!2203 = !{!61, !61}
!2204 = !DILocalVariable(name: "a", arg: 1, scope: !2201, file: !2188, line: 35, type: !61)
!2205 = !DILocation(line: 0, scope: !2201)
!2206 = !DILocalVariable(name: "v", scope: !2201, file: !2188, line: 37, type: !60)
!2207 = !DILocation(line: 39, column: 20, scope: !2201)
!2208 = !DILocation(line: 39, column: 19, scope: !2201)
!2209 = !DILocation(line: 39, column: 22, scope: !2201)
!2210 = !DILocation(line: 39, column: 33, scope: !2201)
!2211 = !DILocation(line: 39, column: 8, scope: !2201)
!2212 = !DILocalVariable(name: "t", scope: !2201, file: !2188, line: 36, type: !61)
!2213 = !DILocation(line: 40, column: 5, scope: !2201)
!2214 = !DILocation(line: 41, column: 10, scope: !2201)
!2215 = !DILocation(line: 41, column: 14, scope: !2201)
!2216 = !DILocation(line: 41, column: 12, scope: !2201)
!2217 = !DILocation(line: 41, column: 3, scope: !2201)
!2218 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_verify", scope: !2219, file: !2219, line: 16, type: !2220, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !99, retainedNodes: !49)
!2219 = !DIFile(filename: "../../ref/verify.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!2220 = !DISubroutineType(types: !2221)
!2221 = !{!50, !315, !315, !38}
!2222 = !DILocalVariable(name: "a", arg: 1, scope: !2218, file: !2219, line: 16, type: !315)
!2223 = !DILocation(line: 0, scope: !2218)
!2224 = !DILocalVariable(name: "b", arg: 2, scope: !2218, file: !2219, line: 16, type: !315)
!2225 = !DILocalVariable(name: "len", arg: 3, scope: !2218, file: !2219, line: 16, type: !38)
!2226 = !DILocalVariable(name: "r", scope: !2218, file: !2219, line: 19, type: !33)
!2227 = !DILocalVariable(name: "i", scope: !2218, file: !2219, line: 18, type: !38)
!2228 = !DILocation(line: 21, column: 7, scope: !2229)
!2229 = distinct !DILexicalBlock(scope: !2218, file: !2219, line: 21, column: 3)
!2230 = !DILocation(line: 21, scope: !2229)
!2231 = !DILocation(line: 21, column: 12, scope: !2232)
!2232 = distinct !DILexicalBlock(scope: !2229, file: !2219, line: 21, column: 3)
!2233 = !DILocation(line: 21, column: 3, scope: !2229)
!2234 = !DILocation(line: 22, column: 10, scope: !2232)
!2235 = !DILocation(line: 22, column: 17, scope: !2232)
!2236 = !DILocation(line: 22, column: 15, scope: !2232)
!2237 = !DILocation(line: 22, column: 7, scope: !2232)
!2238 = !DILocation(line: 22, column: 5, scope: !2232)
!2239 = !DILocation(line: 21, column: 18, scope: !2232)
!2240 = !DILocation(line: 21, column: 3, scope: !2232)
!2241 = distinct !{!2241, !2233, !2242, !132}
!2242 = !DILocation(line: 22, column: 20, scope: !2229)
!2243 = !DILocation(line: 24, column: 12, scope: !2218)
!2244 = !DILocation(line: 24, column: 11, scope: !2218)
!2245 = !DILocation(line: 24, column: 25, scope: !2218)
!2246 = !DILocation(line: 24, column: 10, scope: !2218)
!2247 = !DILocation(line: 24, column: 3, scope: !2218)
!2248 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_cmov", scope: !2219, file: !2219, line: 40, type: !2249, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !99, retainedNodes: !49)
!2249 = !DISubroutineType(types: !2250)
!2250 = !{null, !32, !315, !38, !33}
!2251 = !DILocalVariable(name: "r", arg: 1, scope: !2248, file: !2219, line: 40, type: !32)
!2252 = !DILocation(line: 0, scope: !2248)
!2253 = !DILocalVariable(name: "x", arg: 2, scope: !2248, file: !2219, line: 40, type: !315)
!2254 = !DILocalVariable(name: "len", arg: 3, scope: !2248, file: !2219, line: 40, type: !38)
!2255 = !DILocalVariable(name: "b", arg: 4, scope: !2248, file: !2219, line: 40, type: !33)
!2256 = !DILocation(line: 51, column: 3, scope: !2248)
!2257 = !{i64 1722}
!2258 = !DILocation(line: 54, column: 8, scope: !2248)
!2259 = !DILocation(line: 54, column: 7, scope: !2248)
!2260 = !DILocalVariable(name: "i", scope: !2248, file: !2219, line: 42, type: !38)
!2261 = !DILocation(line: 55, column: 7, scope: !2262)
!2262 = distinct !DILexicalBlock(scope: !2248, file: !2219, line: 55, column: 3)
!2263 = !DILocation(line: 55, scope: !2262)
!2264 = !DILocation(line: 55, column: 12, scope: !2265)
!2265 = distinct !DILexicalBlock(scope: !2262, file: !2219, line: 55, column: 3)
!2266 = !DILocation(line: 55, column: 3, scope: !2262)
!2267 = !DILocation(line: 56, column: 13, scope: !2265)
!2268 = !DILocation(line: 56, column: 18, scope: !2265)
!2269 = !DILocation(line: 56, column: 25, scope: !2265)
!2270 = !DILocation(line: 56, column: 23, scope: !2265)
!2271 = !DILocation(line: 56, column: 15, scope: !2265)
!2272 = !DILocation(line: 56, column: 5, scope: !2265)
!2273 = !DILocation(line: 56, column: 10, scope: !2265)
!2274 = !DILocation(line: 55, column: 18, scope: !2265)
!2275 = !DILocation(line: 55, column: 3, scope: !2265)
!2276 = distinct !{!2276, !2266, !2277, !132}
!2277 = !DILocation(line: 56, column: 29, scope: !2262)
!2278 = !DILocation(line: 57, column: 1, scope: !2248)
!2279 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_cmov_int16", scope: !2219, file: !2219, line: 71, type: !2280, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !99, retainedNodes: !49)
!2280 = !DISubroutineType(types: !2281)
!2281 = !{null, !517, !61, !86}
!2282 = !DILocalVariable(name: "r", arg: 1, scope: !2279, file: !2219, line: 71, type: !517)
!2283 = !DILocation(line: 0, scope: !2279)
!2284 = !DILocalVariable(name: "v", arg: 2, scope: !2279, file: !2219, line: 71, type: !61)
!2285 = !DILocalVariable(name: "b", arg: 3, scope: !2279, file: !2219, line: 71, type: !86)
!2286 = !DILocation(line: 73, column: 8, scope: !2279)
!2287 = !DILocation(line: 73, column: 7, scope: !2279)
!2288 = !DILocation(line: 74, column: 9, scope: !2279)
!2289 = !DILocation(line: 74, column: 15, scope: !2279)
!2290 = !DILocation(line: 74, column: 14, scope: !2279)
!2291 = !DILocation(line: 74, column: 21, scope: !2279)
!2292 = !DILocation(line: 74, column: 19, scope: !2279)
!2293 = !DILocation(line: 74, column: 11, scope: !2279)
!2294 = !DILocation(line: 74, column: 6, scope: !2279)
!2295 = !DILocation(line: 75, column: 1, scope: !2279)
!2296 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_init", scope: !74, file: !74, line: 523, type: !2297, scopeLine: 524, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2297 = !DISubroutineType(types: !2298)
!2298 = !{null, !2299}
!2299 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2300, size: 32)
!2300 = !DIDerivedType(tag: DW_TAG_typedef, name: "keccak_state", file: !451, line: 17, baseType: !2301)
!2301 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !451, line: 14, size: 1664, elements: !2302)
!2302 = !{!2303, !2304}
!2303 = !DIDerivedType(tag: DW_TAG_member, name: "s", scope: !2301, file: !451, line: 15, baseType: !455, size: 1600)
!2304 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !2301, file: !451, line: 16, baseType: !40, size: 32, offset: 1600)
!2305 = !DILocalVariable(name: "state", arg: 1, scope: !2296, file: !74, line: 523, type: !2299)
!2306 = !DILocation(line: 0, scope: !2296)
!2307 = !DILocation(line: 525, column: 22, scope: !2296)
!2308 = !DILocation(line: 525, column: 15, scope: !2296)
!2309 = !DILocation(line: 525, column: 3, scope: !2296)
!2310 = !DILocation(line: 526, column: 10, scope: !2296)
!2311 = !DILocation(line: 526, column: 14, scope: !2296)
!2312 = !DILocation(line: 527, column: 1, scope: !2296)
!2313 = distinct !DISubprogram(name: "keccak_init", scope: !74, file: !74, line: 353, type: !2314, scopeLine: 354, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2314 = !DISubroutineType(types: !2315)
!2315 = !{null, !2316}
!2316 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 32)
!2317 = !DILocalVariable(name: "s", arg: 1, scope: !2313, file: !74, line: 353, type: !2316)
!2318 = !DILocation(line: 0, scope: !2313)
!2319 = !DILocalVariable(name: "i", scope: !2313, file: !74, line: 355, type: !40)
!2320 = !DILocation(line: 356, column: 7, scope: !2321)
!2321 = distinct !DILexicalBlock(scope: !2313, file: !74, line: 356, column: 3)
!2322 = !DILocation(line: 356, scope: !2321)
!2323 = !DILocation(line: 356, column: 12, scope: !2324)
!2324 = distinct !DILexicalBlock(scope: !2321, file: !74, line: 356, column: 3)
!2325 = !DILocation(line: 356, column: 3, scope: !2321)
!2326 = !DILocation(line: 357, column: 5, scope: !2324)
!2327 = !DILocation(line: 357, column: 10, scope: !2324)
!2328 = !DILocation(line: 356, column: 17, scope: !2324)
!2329 = !DILocation(line: 356, column: 3, scope: !2324)
!2330 = distinct !{!2330, !2325, !2331, !132}
!2331 = !DILocation(line: 357, column: 12, scope: !2321)
!2332 = !DILocation(line: 358, column: 1, scope: !2313)
!2333 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb", scope: !74, file: !74, line: 538, type: !2334, scopeLine: 539, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2334 = !DISubroutineType(types: !2335)
!2335 = !{null, !2299, !315, !38}
!2336 = !DILocalVariable(name: "state", arg: 1, scope: !2333, file: !74, line: 538, type: !2299)
!2337 = !DILocation(line: 0, scope: !2333)
!2338 = !DILocalVariable(name: "in", arg: 2, scope: !2333, file: !74, line: 538, type: !315)
!2339 = !DILocalVariable(name: "inlen", arg: 3, scope: !2333, file: !74, line: 538, type: !38)
!2340 = !DILocation(line: 540, column: 37, scope: !2333)
!2341 = !DILocation(line: 540, column: 30, scope: !2333)
!2342 = !DILocation(line: 540, column: 47, scope: !2333)
!2343 = !DILocation(line: 540, column: 16, scope: !2333)
!2344 = !DILocation(line: 540, column: 10, scope: !2333)
!2345 = !DILocation(line: 540, column: 14, scope: !2333)
!2346 = !DILocation(line: 541, column: 1, scope: !2333)
!2347 = distinct !DISubprogram(name: "keccak_absorb", scope: !74, file: !74, line: 373, type: !2348, scopeLine: 378, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2348 = !DISubroutineType(types: !2349)
!2349 = !{!40, !2316, !40, !40, !315, !38}
!2350 = !DILocalVariable(name: "s", arg: 1, scope: !2347, file: !74, line: 373, type: !2316)
!2351 = !DILocation(line: 0, scope: !2347)
!2352 = !DILocalVariable(name: "pos", arg: 2, scope: !2347, file: !74, line: 374, type: !40)
!2353 = !DILocalVariable(name: "r", arg: 3, scope: !2347, file: !74, line: 375, type: !40)
!2354 = !DILocalVariable(name: "in", arg: 4, scope: !2347, file: !74, line: 376, type: !315)
!2355 = !DILocalVariable(name: "inlen", arg: 5, scope: !2347, file: !74, line: 377, type: !38)
!2356 = !DILocation(line: 381, column: 3, scope: !2347)
!2357 = !DILocation(line: 381, column: 12, scope: !2347)
!2358 = !DILocation(line: 381, column: 19, scope: !2347)
!2359 = !DILocalVariable(name: "i", scope: !2347, file: !74, line: 379, type: !40)
!2360 = !DILocation(line: 382, column: 9, scope: !2361)
!2361 = distinct !DILexicalBlock(scope: !2362, file: !74, line: 382, column: 5)
!2362 = distinct !DILexicalBlock(scope: !2347, file: !74, line: 381, column: 25)
!2363 = !DILocation(line: 382, scope: !2361)
!2364 = !DILocation(line: 382, column: 16, scope: !2365)
!2365 = distinct !DILexicalBlock(scope: !2361, file: !74, line: 382, column: 5)
!2366 = !DILocation(line: 382, column: 5, scope: !2361)
!2367 = !DILocation(line: 383, column: 30, scope: !2365)
!2368 = !DILocation(line: 383, column: 27, scope: !2365)
!2369 = !DILocation(line: 383, column: 17, scope: !2365)
!2370 = !DILocation(line: 383, column: 40, scope: !2365)
!2371 = !DILocation(line: 383, column: 37, scope: !2365)
!2372 = !DILocation(line: 383, column: 33, scope: !2365)
!2373 = !DILocation(line: 383, column: 10, scope: !2365)
!2374 = !DILocation(line: 383, column: 7, scope: !2365)
!2375 = !DILocation(line: 383, column: 14, scope: !2365)
!2376 = !DILocation(line: 382, column: 20, scope: !2365)
!2377 = !DILocation(line: 382, column: 5, scope: !2365)
!2378 = distinct !{!2378, !2366, !2379, !132}
!2379 = !DILocation(line: 383, column: 42, scope: !2361)
!2380 = !DILocation(line: 384, column: 15, scope: !2362)
!2381 = !DILocation(line: 384, column: 11, scope: !2362)
!2382 = !DILocation(line: 385, column: 5, scope: !2362)
!2383 = distinct !{!2383, !2356, !2384, !132}
!2384 = !DILocation(line: 387, column: 3, scope: !2347)
!2385 = !DILocation(line: 389, column: 7, scope: !2386)
!2386 = distinct !DILexicalBlock(scope: !2347, file: !74, line: 389, column: 3)
!2387 = !DILocation(line: 389, scope: !2386)
!2388 = !DILocation(line: 389, column: 18, scope: !2389)
!2389 = distinct !DILexicalBlock(scope: !2386, file: !74, line: 389, column: 3)
!2390 = !DILocation(line: 389, column: 14, scope: !2389)
!2391 = !DILocation(line: 389, column: 3, scope: !2386)
!2392 = !DILocation(line: 390, column: 28, scope: !2389)
!2393 = !DILocation(line: 390, column: 25, scope: !2389)
!2394 = !DILocation(line: 390, column: 15, scope: !2389)
!2395 = !DILocation(line: 390, column: 38, scope: !2389)
!2396 = !DILocation(line: 390, column: 35, scope: !2389)
!2397 = !DILocation(line: 390, column: 31, scope: !2389)
!2398 = !DILocation(line: 390, column: 8, scope: !2389)
!2399 = !DILocation(line: 390, column: 5, scope: !2389)
!2400 = !DILocation(line: 390, column: 12, scope: !2389)
!2401 = !DILocation(line: 389, column: 26, scope: !2389)
!2402 = !DILocation(line: 389, column: 3, scope: !2389)
!2403 = distinct !{!2403, !2391, !2404, !132}
!2404 = !DILocation(line: 390, column: 40, scope: !2386)
!2405 = !DILocation(line: 392, column: 3, scope: !2347)
!2406 = distinct !DISubprogram(name: "KeccakF1600_StatePermute", scope: !74, file: !74, line: 82, type: !2314, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2407 = !DILocalVariable(name: "state", arg: 1, scope: !2406, file: !74, line: 82, type: !2316)
!2408 = !DILocation(line: 0, scope: !2406)
!2409 = !DILocation(line: 100, column: 15, scope: !2406)
!2410 = !DILocalVariable(name: "Aba", scope: !2406, file: !74, line: 86, type: !70)
!2411 = !DILocation(line: 101, column: 15, scope: !2406)
!2412 = !DILocalVariable(name: "Abe", scope: !2406, file: !74, line: 86, type: !70)
!2413 = !DILocation(line: 102, column: 15, scope: !2406)
!2414 = !DILocalVariable(name: "Abi", scope: !2406, file: !74, line: 86, type: !70)
!2415 = !DILocation(line: 103, column: 15, scope: !2406)
!2416 = !DILocalVariable(name: "Abo", scope: !2406, file: !74, line: 86, type: !70)
!2417 = !DILocation(line: 104, column: 15, scope: !2406)
!2418 = !DILocalVariable(name: "Abu", scope: !2406, file: !74, line: 86, type: !70)
!2419 = !DILocation(line: 105, column: 15, scope: !2406)
!2420 = !DILocalVariable(name: "Aga", scope: !2406, file: !74, line: 87, type: !70)
!2421 = !DILocation(line: 106, column: 15, scope: !2406)
!2422 = !DILocalVariable(name: "Age", scope: !2406, file: !74, line: 87, type: !70)
!2423 = !DILocation(line: 107, column: 15, scope: !2406)
!2424 = !DILocalVariable(name: "Agi", scope: !2406, file: !74, line: 87, type: !70)
!2425 = !DILocation(line: 108, column: 15, scope: !2406)
!2426 = !DILocalVariable(name: "Ago", scope: !2406, file: !74, line: 87, type: !70)
!2427 = !DILocation(line: 109, column: 15, scope: !2406)
!2428 = !DILocalVariable(name: "Agu", scope: !2406, file: !74, line: 87, type: !70)
!2429 = !DILocation(line: 110, column: 15, scope: !2406)
!2430 = !DILocalVariable(name: "Aka", scope: !2406, file: !74, line: 88, type: !70)
!2431 = !DILocation(line: 111, column: 15, scope: !2406)
!2432 = !DILocalVariable(name: "Ake", scope: !2406, file: !74, line: 88, type: !70)
!2433 = !DILocation(line: 112, column: 15, scope: !2406)
!2434 = !DILocalVariable(name: "Aki", scope: !2406, file: !74, line: 88, type: !70)
!2435 = !DILocation(line: 113, column: 15, scope: !2406)
!2436 = !DILocalVariable(name: "Ako", scope: !2406, file: !74, line: 88, type: !70)
!2437 = !DILocation(line: 114, column: 15, scope: !2406)
!2438 = !DILocalVariable(name: "Aku", scope: !2406, file: !74, line: 88, type: !70)
!2439 = !DILocation(line: 115, column: 15, scope: !2406)
!2440 = !DILocalVariable(name: "Ama", scope: !2406, file: !74, line: 89, type: !70)
!2441 = !DILocation(line: 116, column: 15, scope: !2406)
!2442 = !DILocalVariable(name: "Ame", scope: !2406, file: !74, line: 89, type: !70)
!2443 = !DILocation(line: 117, column: 15, scope: !2406)
!2444 = !DILocalVariable(name: "Ami", scope: !2406, file: !74, line: 89, type: !70)
!2445 = !DILocation(line: 118, column: 15, scope: !2406)
!2446 = !DILocalVariable(name: "Amo", scope: !2406, file: !74, line: 89, type: !70)
!2447 = !DILocation(line: 119, column: 15, scope: !2406)
!2448 = !DILocalVariable(name: "Amu", scope: !2406, file: !74, line: 89, type: !70)
!2449 = !DILocation(line: 120, column: 15, scope: !2406)
!2450 = !DILocalVariable(name: "Asa", scope: !2406, file: !74, line: 90, type: !70)
!2451 = !DILocation(line: 121, column: 15, scope: !2406)
!2452 = !DILocalVariable(name: "Ase", scope: !2406, file: !74, line: 90, type: !70)
!2453 = !DILocation(line: 122, column: 15, scope: !2406)
!2454 = !DILocalVariable(name: "Asi", scope: !2406, file: !74, line: 90, type: !70)
!2455 = !DILocation(line: 123, column: 15, scope: !2406)
!2456 = !DILocalVariable(name: "Aso", scope: !2406, file: !74, line: 90, type: !70)
!2457 = !DILocation(line: 124, column: 15, scope: !2406)
!2458 = !DILocalVariable(name: "Asu", scope: !2406, file: !74, line: 90, type: !70)
!2459 = !DILocalVariable(name: "round", scope: !2406, file: !74, line: 84, type: !50)
!2460 = !DILocation(line: 126, column: 13, scope: !2461)
!2461 = distinct !DILexicalBlock(scope: !2406, file: !74, line: 126, column: 9)
!2462 = !DILocation(line: 126, scope: !2461)
!2463 = !DILocation(line: 126, column: 30, scope: !2464)
!2464 = distinct !DILexicalBlock(scope: !2461, file: !74, line: 126, column: 9)
!2465 = !DILocation(line: 126, column: 9, scope: !2461)
!2466 = !DILocation(line: 128, column: 22, scope: !2467)
!2467 = distinct !DILexicalBlock(scope: !2464, file: !74, line: 126, column: 53)
!2468 = !DILocation(line: 128, column: 26, scope: !2467)
!2469 = !DILocation(line: 128, column: 30, scope: !2467)
!2470 = !DILocation(line: 128, column: 34, scope: !2467)
!2471 = !DILocalVariable(name: "BCa", scope: !2406, file: !74, line: 91, type: !70)
!2472 = !DILocation(line: 129, column: 22, scope: !2467)
!2473 = !DILocation(line: 129, column: 26, scope: !2467)
!2474 = !DILocation(line: 129, column: 30, scope: !2467)
!2475 = !DILocation(line: 129, column: 34, scope: !2467)
!2476 = !DILocalVariable(name: "BCe", scope: !2406, file: !74, line: 91, type: !70)
!2477 = !DILocation(line: 130, column: 22, scope: !2467)
!2478 = !DILocation(line: 130, column: 26, scope: !2467)
!2479 = !DILocation(line: 130, column: 30, scope: !2467)
!2480 = !DILocation(line: 130, column: 34, scope: !2467)
!2481 = !DILocalVariable(name: "BCi", scope: !2406, file: !74, line: 91, type: !70)
!2482 = !DILocation(line: 131, column: 22, scope: !2467)
!2483 = !DILocation(line: 131, column: 26, scope: !2467)
!2484 = !DILocation(line: 131, column: 30, scope: !2467)
!2485 = !DILocation(line: 131, column: 34, scope: !2467)
!2486 = !DILocalVariable(name: "BCo", scope: !2406, file: !74, line: 91, type: !70)
!2487 = !DILocation(line: 132, column: 22, scope: !2467)
!2488 = !DILocation(line: 132, column: 26, scope: !2467)
!2489 = !DILocation(line: 132, column: 30, scope: !2467)
!2490 = !DILocation(line: 132, column: 34, scope: !2467)
!2491 = !DILocalVariable(name: "BCu", scope: !2406, file: !74, line: 91, type: !70)
!2492 = !DILocation(line: 135, column: 22, scope: !2467)
!2493 = !DILocation(line: 135, column: 21, scope: !2467)
!2494 = !DILocalVariable(name: "Da", scope: !2406, file: !74, line: 92, type: !70)
!2495 = !DILocation(line: 136, column: 22, scope: !2467)
!2496 = !DILocation(line: 136, column: 21, scope: !2467)
!2497 = !DILocalVariable(name: "De", scope: !2406, file: !74, line: 92, type: !70)
!2498 = !DILocation(line: 137, column: 22, scope: !2467)
!2499 = !DILocation(line: 137, column: 21, scope: !2467)
!2500 = !DILocalVariable(name: "Di", scope: !2406, file: !74, line: 92, type: !70)
!2501 = !DILocation(line: 138, column: 22, scope: !2467)
!2502 = !DILocation(line: 138, column: 21, scope: !2467)
!2503 = !DILocalVariable(name: "Do", scope: !2406, file: !74, line: 92, type: !70)
!2504 = !DILocation(line: 139, column: 22, scope: !2467)
!2505 = !DILocation(line: 139, column: 21, scope: !2467)
!2506 = !DILocalVariable(name: "Du", scope: !2406, file: !74, line: 92, type: !70)
!2507 = !DILocation(line: 141, column: 17, scope: !2467)
!2508 = !DILocation(line: 143, column: 17, scope: !2467)
!2509 = !DILocation(line: 144, column: 19, scope: !2467)
!2510 = !DILocation(line: 145, column: 17, scope: !2467)
!2511 = !DILocation(line: 146, column: 19, scope: !2467)
!2512 = !DILocation(line: 147, column: 17, scope: !2467)
!2513 = !DILocation(line: 148, column: 19, scope: !2467)
!2514 = !DILocation(line: 149, column: 17, scope: !2467)
!2515 = !DILocation(line: 150, column: 19, scope: !2467)
!2516 = !DILocation(line: 151, column: 28, scope: !2467)
!2517 = !DILocation(line: 151, column: 33, scope: !2467)
!2518 = !DILocation(line: 151, column: 25, scope: !2467)
!2519 = !DILocalVariable(name: "Eba", scope: !2406, file: !74, line: 93, type: !70)
!2520 = !DILocation(line: 152, column: 30, scope: !2467)
!2521 = !DILocation(line: 152, column: 17, scope: !2467)
!2522 = !DILocation(line: 153, column: 28, scope: !2467)
!2523 = !DILocation(line: 153, column: 33, scope: !2467)
!2524 = !DILocation(line: 153, column: 25, scope: !2467)
!2525 = !DILocalVariable(name: "Ebe", scope: !2406, file: !74, line: 93, type: !70)
!2526 = !DILocation(line: 154, column: 28, scope: !2467)
!2527 = !DILocation(line: 154, column: 33, scope: !2467)
!2528 = !DILocation(line: 154, column: 25, scope: !2467)
!2529 = !DILocalVariable(name: "Ebi", scope: !2406, file: !74, line: 93, type: !70)
!2530 = !DILocation(line: 155, column: 28, scope: !2467)
!2531 = !DILocation(line: 155, column: 33, scope: !2467)
!2532 = !DILocation(line: 155, column: 25, scope: !2467)
!2533 = !DILocalVariable(name: "Ebo", scope: !2406, file: !74, line: 93, type: !70)
!2534 = !DILocation(line: 156, column: 28, scope: !2467)
!2535 = !DILocation(line: 156, column: 33, scope: !2467)
!2536 = !DILocation(line: 156, column: 25, scope: !2467)
!2537 = !DILocalVariable(name: "Ebu", scope: !2406, file: !74, line: 93, type: !70)
!2538 = !DILocation(line: 158, column: 17, scope: !2467)
!2539 = !DILocation(line: 159, column: 19, scope: !2467)
!2540 = !DILocation(line: 160, column: 17, scope: !2467)
!2541 = !DILocation(line: 161, column: 19, scope: !2467)
!2542 = !DILocation(line: 162, column: 17, scope: !2467)
!2543 = !DILocation(line: 163, column: 19, scope: !2467)
!2544 = !DILocation(line: 164, column: 17, scope: !2467)
!2545 = !DILocation(line: 165, column: 19, scope: !2467)
!2546 = !DILocation(line: 166, column: 17, scope: !2467)
!2547 = !DILocation(line: 167, column: 19, scope: !2467)
!2548 = !DILocation(line: 168, column: 28, scope: !2467)
!2549 = !DILocation(line: 168, column: 33, scope: !2467)
!2550 = !DILocation(line: 168, column: 25, scope: !2467)
!2551 = !DILocalVariable(name: "Ega", scope: !2406, file: !74, line: 94, type: !70)
!2552 = !DILocation(line: 169, column: 28, scope: !2467)
!2553 = !DILocation(line: 169, column: 33, scope: !2467)
!2554 = !DILocation(line: 169, column: 25, scope: !2467)
!2555 = !DILocalVariable(name: "Ege", scope: !2406, file: !74, line: 94, type: !70)
!2556 = !DILocation(line: 170, column: 28, scope: !2467)
!2557 = !DILocation(line: 170, column: 33, scope: !2467)
!2558 = !DILocation(line: 170, column: 25, scope: !2467)
!2559 = !DILocalVariable(name: "Egi", scope: !2406, file: !74, line: 94, type: !70)
!2560 = !DILocation(line: 171, column: 28, scope: !2467)
!2561 = !DILocation(line: 171, column: 33, scope: !2467)
!2562 = !DILocation(line: 171, column: 25, scope: !2467)
!2563 = !DILocalVariable(name: "Ego", scope: !2406, file: !74, line: 94, type: !70)
!2564 = !DILocation(line: 172, column: 28, scope: !2467)
!2565 = !DILocation(line: 172, column: 33, scope: !2467)
!2566 = !DILocation(line: 172, column: 25, scope: !2467)
!2567 = !DILocalVariable(name: "Egu", scope: !2406, file: !74, line: 94, type: !70)
!2568 = !DILocation(line: 174, column: 17, scope: !2467)
!2569 = !DILocation(line: 175, column: 19, scope: !2467)
!2570 = !DILocation(line: 176, column: 17, scope: !2467)
!2571 = !DILocation(line: 177, column: 19, scope: !2467)
!2572 = !DILocation(line: 178, column: 17, scope: !2467)
!2573 = !DILocation(line: 179, column: 19, scope: !2467)
!2574 = !DILocation(line: 180, column: 17, scope: !2467)
!2575 = !DILocation(line: 181, column: 19, scope: !2467)
!2576 = !DILocation(line: 182, column: 17, scope: !2467)
!2577 = !DILocation(line: 183, column: 19, scope: !2467)
!2578 = !DILocation(line: 184, column: 28, scope: !2467)
!2579 = !DILocation(line: 184, column: 33, scope: !2467)
!2580 = !DILocation(line: 184, column: 25, scope: !2467)
!2581 = !DILocalVariable(name: "Eka", scope: !2406, file: !74, line: 95, type: !70)
!2582 = !DILocation(line: 185, column: 28, scope: !2467)
!2583 = !DILocation(line: 185, column: 33, scope: !2467)
!2584 = !DILocation(line: 185, column: 25, scope: !2467)
!2585 = !DILocalVariable(name: "Eke", scope: !2406, file: !74, line: 95, type: !70)
!2586 = !DILocation(line: 186, column: 28, scope: !2467)
!2587 = !DILocation(line: 186, column: 33, scope: !2467)
!2588 = !DILocation(line: 186, column: 25, scope: !2467)
!2589 = !DILocalVariable(name: "Eki", scope: !2406, file: !74, line: 95, type: !70)
!2590 = !DILocation(line: 187, column: 28, scope: !2467)
!2591 = !DILocation(line: 187, column: 33, scope: !2467)
!2592 = !DILocation(line: 187, column: 25, scope: !2467)
!2593 = !DILocalVariable(name: "Eko", scope: !2406, file: !74, line: 95, type: !70)
!2594 = !DILocation(line: 188, column: 28, scope: !2467)
!2595 = !DILocation(line: 188, column: 33, scope: !2467)
!2596 = !DILocation(line: 188, column: 25, scope: !2467)
!2597 = !DILocalVariable(name: "Eku", scope: !2406, file: !74, line: 95, type: !70)
!2598 = !DILocation(line: 190, column: 17, scope: !2467)
!2599 = !DILocation(line: 191, column: 19, scope: !2467)
!2600 = !DILocation(line: 192, column: 17, scope: !2467)
!2601 = !DILocation(line: 193, column: 19, scope: !2467)
!2602 = !DILocation(line: 194, column: 17, scope: !2467)
!2603 = !DILocation(line: 195, column: 19, scope: !2467)
!2604 = !DILocation(line: 196, column: 17, scope: !2467)
!2605 = !DILocation(line: 197, column: 19, scope: !2467)
!2606 = !DILocation(line: 198, column: 17, scope: !2467)
!2607 = !DILocation(line: 199, column: 19, scope: !2467)
!2608 = !DILocation(line: 200, column: 28, scope: !2467)
!2609 = !DILocation(line: 200, column: 33, scope: !2467)
!2610 = !DILocation(line: 200, column: 25, scope: !2467)
!2611 = !DILocalVariable(name: "Ema", scope: !2406, file: !74, line: 96, type: !70)
!2612 = !DILocation(line: 201, column: 28, scope: !2467)
!2613 = !DILocation(line: 201, column: 33, scope: !2467)
!2614 = !DILocation(line: 201, column: 25, scope: !2467)
!2615 = !DILocalVariable(name: "Eme", scope: !2406, file: !74, line: 96, type: !70)
!2616 = !DILocation(line: 202, column: 28, scope: !2467)
!2617 = !DILocation(line: 202, column: 33, scope: !2467)
!2618 = !DILocation(line: 202, column: 25, scope: !2467)
!2619 = !DILocalVariable(name: "Emi", scope: !2406, file: !74, line: 96, type: !70)
!2620 = !DILocation(line: 203, column: 28, scope: !2467)
!2621 = !DILocation(line: 203, column: 33, scope: !2467)
!2622 = !DILocation(line: 203, column: 25, scope: !2467)
!2623 = !DILocalVariable(name: "Emo", scope: !2406, file: !74, line: 96, type: !70)
!2624 = !DILocation(line: 204, column: 28, scope: !2467)
!2625 = !DILocation(line: 204, column: 33, scope: !2467)
!2626 = !DILocation(line: 204, column: 25, scope: !2467)
!2627 = !DILocalVariable(name: "Emu", scope: !2406, file: !74, line: 96, type: !70)
!2628 = !DILocation(line: 206, column: 17, scope: !2467)
!2629 = !DILocation(line: 207, column: 19, scope: !2467)
!2630 = !DILocation(line: 208, column: 17, scope: !2467)
!2631 = !DILocation(line: 209, column: 19, scope: !2467)
!2632 = !DILocation(line: 210, column: 17, scope: !2467)
!2633 = !DILocation(line: 211, column: 19, scope: !2467)
!2634 = !DILocation(line: 212, column: 17, scope: !2467)
!2635 = !DILocation(line: 213, column: 19, scope: !2467)
!2636 = !DILocation(line: 214, column: 17, scope: !2467)
!2637 = !DILocation(line: 215, column: 19, scope: !2467)
!2638 = !DILocation(line: 216, column: 28, scope: !2467)
!2639 = !DILocation(line: 216, column: 33, scope: !2467)
!2640 = !DILocation(line: 216, column: 25, scope: !2467)
!2641 = !DILocalVariable(name: "Esa", scope: !2406, file: !74, line: 97, type: !70)
!2642 = !DILocation(line: 217, column: 28, scope: !2467)
!2643 = !DILocation(line: 217, column: 33, scope: !2467)
!2644 = !DILocation(line: 217, column: 25, scope: !2467)
!2645 = !DILocalVariable(name: "Ese", scope: !2406, file: !74, line: 97, type: !70)
!2646 = !DILocation(line: 218, column: 28, scope: !2467)
!2647 = !DILocation(line: 218, column: 33, scope: !2467)
!2648 = !DILocation(line: 218, column: 25, scope: !2467)
!2649 = !DILocalVariable(name: "Esi", scope: !2406, file: !74, line: 97, type: !70)
!2650 = !DILocation(line: 219, column: 28, scope: !2467)
!2651 = !DILocation(line: 219, column: 33, scope: !2467)
!2652 = !DILocation(line: 219, column: 25, scope: !2467)
!2653 = !DILocalVariable(name: "Eso", scope: !2406, file: !74, line: 97, type: !70)
!2654 = !DILocation(line: 220, column: 28, scope: !2467)
!2655 = !DILocation(line: 220, column: 33, scope: !2467)
!2656 = !DILocation(line: 220, column: 25, scope: !2467)
!2657 = !DILocalVariable(name: "Esu", scope: !2406, file: !74, line: 97, type: !70)
!2658 = !DILocation(line: 223, column: 22, scope: !2467)
!2659 = !DILocation(line: 223, column: 26, scope: !2467)
!2660 = !DILocation(line: 223, column: 30, scope: !2467)
!2661 = !DILocation(line: 223, column: 34, scope: !2467)
!2662 = !DILocation(line: 224, column: 22, scope: !2467)
!2663 = !DILocation(line: 224, column: 26, scope: !2467)
!2664 = !DILocation(line: 224, column: 30, scope: !2467)
!2665 = !DILocation(line: 224, column: 34, scope: !2467)
!2666 = !DILocation(line: 225, column: 22, scope: !2467)
!2667 = !DILocation(line: 225, column: 26, scope: !2467)
!2668 = !DILocation(line: 225, column: 30, scope: !2467)
!2669 = !DILocation(line: 225, column: 34, scope: !2467)
!2670 = !DILocation(line: 226, column: 22, scope: !2467)
!2671 = !DILocation(line: 226, column: 26, scope: !2467)
!2672 = !DILocation(line: 226, column: 30, scope: !2467)
!2673 = !DILocation(line: 226, column: 34, scope: !2467)
!2674 = !DILocation(line: 227, column: 22, scope: !2467)
!2675 = !DILocation(line: 227, column: 26, scope: !2467)
!2676 = !DILocation(line: 227, column: 30, scope: !2467)
!2677 = !DILocation(line: 227, column: 34, scope: !2467)
!2678 = !DILocation(line: 230, column: 22, scope: !2467)
!2679 = !DILocation(line: 230, column: 21, scope: !2467)
!2680 = !DILocation(line: 231, column: 22, scope: !2467)
!2681 = !DILocation(line: 231, column: 21, scope: !2467)
!2682 = !DILocation(line: 232, column: 22, scope: !2467)
!2683 = !DILocation(line: 232, column: 21, scope: !2467)
!2684 = !DILocation(line: 233, column: 22, scope: !2467)
!2685 = !DILocation(line: 233, column: 21, scope: !2467)
!2686 = !DILocation(line: 234, column: 22, scope: !2467)
!2687 = !DILocation(line: 234, column: 21, scope: !2467)
!2688 = !DILocation(line: 236, column: 17, scope: !2467)
!2689 = !DILocation(line: 238, column: 17, scope: !2467)
!2690 = !DILocation(line: 239, column: 19, scope: !2467)
!2691 = !DILocation(line: 240, column: 17, scope: !2467)
!2692 = !DILocation(line: 241, column: 19, scope: !2467)
!2693 = !DILocation(line: 242, column: 17, scope: !2467)
!2694 = !DILocation(line: 243, column: 19, scope: !2467)
!2695 = !DILocation(line: 244, column: 17, scope: !2467)
!2696 = !DILocation(line: 245, column: 19, scope: !2467)
!2697 = !DILocation(line: 246, column: 28, scope: !2467)
!2698 = !DILocation(line: 246, column: 33, scope: !2467)
!2699 = !DILocation(line: 246, column: 25, scope: !2467)
!2700 = !DILocation(line: 247, column: 58, scope: !2467)
!2701 = !DILocation(line: 247, column: 30, scope: !2467)
!2702 = !DILocation(line: 247, column: 17, scope: !2467)
!2703 = !DILocation(line: 248, column: 28, scope: !2467)
!2704 = !DILocation(line: 248, column: 33, scope: !2467)
!2705 = !DILocation(line: 248, column: 25, scope: !2467)
!2706 = !DILocation(line: 249, column: 28, scope: !2467)
!2707 = !DILocation(line: 249, column: 33, scope: !2467)
!2708 = !DILocation(line: 249, column: 25, scope: !2467)
!2709 = !DILocation(line: 250, column: 28, scope: !2467)
!2710 = !DILocation(line: 250, column: 33, scope: !2467)
!2711 = !DILocation(line: 250, column: 25, scope: !2467)
!2712 = !DILocation(line: 251, column: 28, scope: !2467)
!2713 = !DILocation(line: 251, column: 33, scope: !2467)
!2714 = !DILocation(line: 251, column: 25, scope: !2467)
!2715 = !DILocation(line: 253, column: 17, scope: !2467)
!2716 = !DILocation(line: 254, column: 19, scope: !2467)
!2717 = !DILocation(line: 255, column: 17, scope: !2467)
!2718 = !DILocation(line: 256, column: 19, scope: !2467)
!2719 = !DILocation(line: 257, column: 17, scope: !2467)
!2720 = !DILocation(line: 258, column: 19, scope: !2467)
!2721 = !DILocation(line: 259, column: 17, scope: !2467)
!2722 = !DILocation(line: 260, column: 19, scope: !2467)
!2723 = !DILocation(line: 261, column: 17, scope: !2467)
!2724 = !DILocation(line: 262, column: 19, scope: !2467)
!2725 = !DILocation(line: 263, column: 28, scope: !2467)
!2726 = !DILocation(line: 263, column: 33, scope: !2467)
!2727 = !DILocation(line: 263, column: 25, scope: !2467)
!2728 = !DILocation(line: 264, column: 28, scope: !2467)
!2729 = !DILocation(line: 264, column: 33, scope: !2467)
!2730 = !DILocation(line: 264, column: 25, scope: !2467)
!2731 = !DILocation(line: 265, column: 28, scope: !2467)
!2732 = !DILocation(line: 265, column: 33, scope: !2467)
!2733 = !DILocation(line: 265, column: 25, scope: !2467)
!2734 = !DILocation(line: 266, column: 28, scope: !2467)
!2735 = !DILocation(line: 266, column: 33, scope: !2467)
!2736 = !DILocation(line: 266, column: 25, scope: !2467)
!2737 = !DILocation(line: 267, column: 28, scope: !2467)
!2738 = !DILocation(line: 267, column: 33, scope: !2467)
!2739 = !DILocation(line: 267, column: 25, scope: !2467)
!2740 = !DILocation(line: 269, column: 17, scope: !2467)
!2741 = !DILocation(line: 270, column: 19, scope: !2467)
!2742 = !DILocation(line: 271, column: 17, scope: !2467)
!2743 = !DILocation(line: 272, column: 19, scope: !2467)
!2744 = !DILocation(line: 273, column: 17, scope: !2467)
!2745 = !DILocation(line: 274, column: 19, scope: !2467)
!2746 = !DILocation(line: 275, column: 17, scope: !2467)
!2747 = !DILocation(line: 276, column: 19, scope: !2467)
!2748 = !DILocation(line: 277, column: 17, scope: !2467)
!2749 = !DILocation(line: 278, column: 19, scope: !2467)
!2750 = !DILocation(line: 279, column: 28, scope: !2467)
!2751 = !DILocation(line: 279, column: 33, scope: !2467)
!2752 = !DILocation(line: 279, column: 25, scope: !2467)
!2753 = !DILocation(line: 280, column: 28, scope: !2467)
!2754 = !DILocation(line: 280, column: 33, scope: !2467)
!2755 = !DILocation(line: 280, column: 25, scope: !2467)
!2756 = !DILocation(line: 281, column: 28, scope: !2467)
!2757 = !DILocation(line: 281, column: 33, scope: !2467)
!2758 = !DILocation(line: 281, column: 25, scope: !2467)
!2759 = !DILocation(line: 282, column: 28, scope: !2467)
!2760 = !DILocation(line: 282, column: 33, scope: !2467)
!2761 = !DILocation(line: 282, column: 25, scope: !2467)
!2762 = !DILocation(line: 283, column: 28, scope: !2467)
!2763 = !DILocation(line: 283, column: 33, scope: !2467)
!2764 = !DILocation(line: 283, column: 25, scope: !2467)
!2765 = !DILocation(line: 285, column: 17, scope: !2467)
!2766 = !DILocation(line: 286, column: 19, scope: !2467)
!2767 = !DILocation(line: 287, column: 17, scope: !2467)
!2768 = !DILocation(line: 288, column: 19, scope: !2467)
!2769 = !DILocation(line: 289, column: 17, scope: !2467)
!2770 = !DILocation(line: 290, column: 19, scope: !2467)
!2771 = !DILocation(line: 291, column: 17, scope: !2467)
!2772 = !DILocation(line: 292, column: 19, scope: !2467)
!2773 = !DILocation(line: 293, column: 17, scope: !2467)
!2774 = !DILocation(line: 294, column: 19, scope: !2467)
!2775 = !DILocation(line: 295, column: 28, scope: !2467)
!2776 = !DILocation(line: 295, column: 33, scope: !2467)
!2777 = !DILocation(line: 295, column: 25, scope: !2467)
!2778 = !DILocation(line: 296, column: 28, scope: !2467)
!2779 = !DILocation(line: 296, column: 33, scope: !2467)
!2780 = !DILocation(line: 296, column: 25, scope: !2467)
!2781 = !DILocation(line: 297, column: 28, scope: !2467)
!2782 = !DILocation(line: 297, column: 33, scope: !2467)
!2783 = !DILocation(line: 297, column: 25, scope: !2467)
!2784 = !DILocation(line: 298, column: 28, scope: !2467)
!2785 = !DILocation(line: 298, column: 33, scope: !2467)
!2786 = !DILocation(line: 298, column: 25, scope: !2467)
!2787 = !DILocation(line: 299, column: 28, scope: !2467)
!2788 = !DILocation(line: 299, column: 33, scope: !2467)
!2789 = !DILocation(line: 299, column: 25, scope: !2467)
!2790 = !DILocation(line: 301, column: 17, scope: !2467)
!2791 = !DILocation(line: 302, column: 19, scope: !2467)
!2792 = !DILocation(line: 303, column: 17, scope: !2467)
!2793 = !DILocation(line: 304, column: 19, scope: !2467)
!2794 = !DILocation(line: 305, column: 17, scope: !2467)
!2795 = !DILocation(line: 306, column: 19, scope: !2467)
!2796 = !DILocation(line: 307, column: 17, scope: !2467)
!2797 = !DILocation(line: 308, column: 19, scope: !2467)
!2798 = !DILocation(line: 309, column: 17, scope: !2467)
!2799 = !DILocation(line: 310, column: 19, scope: !2467)
!2800 = !DILocation(line: 311, column: 28, scope: !2467)
!2801 = !DILocation(line: 311, column: 33, scope: !2467)
!2802 = !DILocation(line: 311, column: 25, scope: !2467)
!2803 = !DILocation(line: 312, column: 28, scope: !2467)
!2804 = !DILocation(line: 312, column: 33, scope: !2467)
!2805 = !DILocation(line: 312, column: 25, scope: !2467)
!2806 = !DILocation(line: 313, column: 28, scope: !2467)
!2807 = !DILocation(line: 313, column: 33, scope: !2467)
!2808 = !DILocation(line: 313, column: 25, scope: !2467)
!2809 = !DILocation(line: 314, column: 28, scope: !2467)
!2810 = !DILocation(line: 314, column: 33, scope: !2467)
!2811 = !DILocation(line: 314, column: 25, scope: !2467)
!2812 = !DILocation(line: 315, column: 28, scope: !2467)
!2813 = !DILocation(line: 315, column: 33, scope: !2467)
!2814 = !DILocation(line: 315, column: 25, scope: !2467)
!2815 = !DILocation(line: 316, column: 9, scope: !2467)
!2816 = !DILocation(line: 126, column: 47, scope: !2464)
!2817 = !DILocation(line: 126, column: 9, scope: !2464)
!2818 = distinct !{!2818, !2465, !2819, !132}
!2819 = !DILocation(line: 316, column: 9, scope: !2461)
!2820 = !DILocation(line: 319, column: 9, scope: !2406)
!2821 = !DILocation(line: 319, column: 19, scope: !2406)
!2822 = !DILocation(line: 320, column: 9, scope: !2406)
!2823 = !DILocation(line: 320, column: 19, scope: !2406)
!2824 = !DILocation(line: 321, column: 9, scope: !2406)
!2825 = !DILocation(line: 321, column: 19, scope: !2406)
!2826 = !DILocation(line: 322, column: 9, scope: !2406)
!2827 = !DILocation(line: 322, column: 19, scope: !2406)
!2828 = !DILocation(line: 323, column: 9, scope: !2406)
!2829 = !DILocation(line: 323, column: 19, scope: !2406)
!2830 = !DILocation(line: 324, column: 9, scope: !2406)
!2831 = !DILocation(line: 324, column: 19, scope: !2406)
!2832 = !DILocation(line: 325, column: 9, scope: !2406)
!2833 = !DILocation(line: 325, column: 19, scope: !2406)
!2834 = !DILocation(line: 326, column: 9, scope: !2406)
!2835 = !DILocation(line: 326, column: 19, scope: !2406)
!2836 = !DILocation(line: 327, column: 9, scope: !2406)
!2837 = !DILocation(line: 327, column: 19, scope: !2406)
!2838 = !DILocation(line: 328, column: 9, scope: !2406)
!2839 = !DILocation(line: 328, column: 19, scope: !2406)
!2840 = !DILocation(line: 329, column: 9, scope: !2406)
!2841 = !DILocation(line: 329, column: 19, scope: !2406)
!2842 = !DILocation(line: 330, column: 9, scope: !2406)
!2843 = !DILocation(line: 330, column: 19, scope: !2406)
!2844 = !DILocation(line: 331, column: 9, scope: !2406)
!2845 = !DILocation(line: 331, column: 19, scope: !2406)
!2846 = !DILocation(line: 332, column: 9, scope: !2406)
!2847 = !DILocation(line: 332, column: 19, scope: !2406)
!2848 = !DILocation(line: 333, column: 9, scope: !2406)
!2849 = !DILocation(line: 333, column: 19, scope: !2406)
!2850 = !DILocation(line: 334, column: 9, scope: !2406)
!2851 = !DILocation(line: 334, column: 19, scope: !2406)
!2852 = !DILocation(line: 335, column: 9, scope: !2406)
!2853 = !DILocation(line: 335, column: 19, scope: !2406)
!2854 = !DILocation(line: 336, column: 9, scope: !2406)
!2855 = !DILocation(line: 336, column: 19, scope: !2406)
!2856 = !DILocation(line: 337, column: 9, scope: !2406)
!2857 = !DILocation(line: 337, column: 19, scope: !2406)
!2858 = !DILocation(line: 338, column: 9, scope: !2406)
!2859 = !DILocation(line: 338, column: 19, scope: !2406)
!2860 = !DILocation(line: 339, column: 9, scope: !2406)
!2861 = !DILocation(line: 339, column: 19, scope: !2406)
!2862 = !DILocation(line: 340, column: 9, scope: !2406)
!2863 = !DILocation(line: 340, column: 19, scope: !2406)
!2864 = !DILocation(line: 341, column: 9, scope: !2406)
!2865 = !DILocation(line: 341, column: 19, scope: !2406)
!2866 = !DILocation(line: 342, column: 9, scope: !2406)
!2867 = !DILocation(line: 342, column: 19, scope: !2406)
!2868 = !DILocation(line: 343, column: 9, scope: !2406)
!2869 = !DILocation(line: 343, column: 19, scope: !2406)
!2870 = !DILocation(line: 344, column: 1, scope: !2406)
!2871 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_finalize", scope: !74, file: !74, line: 550, type: !2297, scopeLine: 551, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2872 = !DILocalVariable(name: "state", arg: 1, scope: !2871, file: !74, line: 550, type: !2299)
!2873 = !DILocation(line: 0, scope: !2871)
!2874 = !DILocation(line: 552, column: 26, scope: !2871)
!2875 = !DILocation(line: 552, column: 19, scope: !2871)
!2876 = !DILocation(line: 552, column: 36, scope: !2871)
!2877 = !DILocation(line: 552, column: 3, scope: !2871)
!2878 = !DILocation(line: 553, column: 10, scope: !2871)
!2879 = !DILocation(line: 553, column: 14, scope: !2871)
!2880 = !DILocation(line: 554, column: 1, scope: !2871)
!2881 = distinct !DISubprogram(name: "keccak_finalize", scope: !74, file: !74, line: 405, type: !2882, scopeLine: 406, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2882 = !DISubroutineType(types: !2883)
!2883 = !{null, !2316, !40, !40, !33}
!2884 = !DILocalVariable(name: "s", arg: 1, scope: !2881, file: !74, line: 405, type: !2316)
!2885 = !DILocation(line: 0, scope: !2881)
!2886 = !DILocalVariable(name: "pos", arg: 2, scope: !2881, file: !74, line: 405, type: !40)
!2887 = !DILocalVariable(name: "r", arg: 3, scope: !2881, file: !74, line: 405, type: !40)
!2888 = !DILocalVariable(name: "p", arg: 4, scope: !2881, file: !74, line: 405, type: !33)
!2889 = !DILocation(line: 407, column: 15, scope: !2881)
!2890 = !DILocation(line: 407, column: 36, scope: !2881)
!2891 = !DILocation(line: 407, column: 31, scope: !2881)
!2892 = !DILocation(line: 407, column: 27, scope: !2881)
!2893 = !DILocation(line: 407, column: 8, scope: !2881)
!2894 = !DILocation(line: 407, column: 3, scope: !2881)
!2895 = !DILocation(line: 407, column: 12, scope: !2881)
!2896 = !DILocation(line: 408, column: 6, scope: !2881)
!2897 = !DILocation(line: 408, column: 8, scope: !2881)
!2898 = !DILocation(line: 408, column: 3, scope: !2881)
!2899 = !DILocation(line: 408, column: 12, scope: !2881)
!2900 = !DILocation(line: 409, column: 1, scope: !2881)
!2901 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeeze", scope: !74, file: !74, line: 566, type: !2902, scopeLine: 567, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2902 = !DISubroutineType(types: !2903)
!2903 = !{null, !32, !38, !2299}
!2904 = !DILocalVariable(name: "out", arg: 1, scope: !2901, file: !74, line: 566, type: !32)
!2905 = !DILocation(line: 0, scope: !2901)
!2906 = !DILocalVariable(name: "outlen", arg: 2, scope: !2901, file: !74, line: 566, type: !38)
!2907 = !DILocalVariable(name: "state", arg: 3, scope: !2901, file: !74, line: 566, type: !2299)
!2908 = !DILocation(line: 568, column: 51, scope: !2901)
!2909 = !DILocation(line: 568, column: 44, scope: !2901)
!2910 = !DILocation(line: 568, column: 61, scope: !2901)
!2911 = !DILocation(line: 568, column: 16, scope: !2901)
!2912 = !DILocation(line: 568, column: 10, scope: !2901)
!2913 = !DILocation(line: 568, column: 14, scope: !2901)
!2914 = !DILocation(line: 569, column: 1, scope: !2901)
!2915 = distinct !DISubprogram(name: "keccak_squeeze", scope: !74, file: !74, line: 426, type: !2916, scopeLine: 431, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2916 = !DISubroutineType(types: !2917)
!2917 = !{!40, !32, !38, !2316, !40, !40}
!2918 = !DILocalVariable(name: "out", arg: 1, scope: !2915, file: !74, line: 426, type: !32)
!2919 = !DILocation(line: 0, scope: !2915)
!2920 = !DILocalVariable(name: "outlen", arg: 2, scope: !2915, file: !74, line: 427, type: !38)
!2921 = !DILocalVariable(name: "s", arg: 3, scope: !2915, file: !74, line: 428, type: !2316)
!2922 = !DILocalVariable(name: "pos", arg: 4, scope: !2915, file: !74, line: 429, type: !40)
!2923 = !DILocalVariable(name: "r", arg: 5, scope: !2915, file: !74, line: 430, type: !40)
!2924 = !DILocation(line: 434, column: 3, scope: !2915)
!2925 = !DILocation(line: 435, column: 12, scope: !2926)
!2926 = distinct !DILexicalBlock(scope: !2927, file: !74, line: 435, column: 8)
!2927 = distinct !DILexicalBlock(scope: !2915, file: !74, line: 434, column: 17)
!2928 = !DILocation(line: 436, column: 7, scope: !2929)
!2929 = distinct !DILexicalBlock(scope: !2926, file: !74, line: 435, column: 18)
!2930 = !DILocation(line: 438, column: 5, scope: !2929)
!2931 = !DILocalVariable(name: "i", scope: !2915, file: !74, line: 432, type: !40)
!2932 = !DILocation(line: 439, column: 9, scope: !2933)
!2933 = distinct !DILexicalBlock(scope: !2927, file: !74, line: 439, column: 5)
!2934 = !DILocation(line: 439, scope: !2933)
!2935 = !DILocation(line: 439, column: 17, scope: !2936)
!2936 = distinct !DILexicalBlock(scope: !2933, file: !74, line: 439, column: 5)
!2937 = !DILocation(line: 439, column: 21, scope: !2936)
!2938 = !DILocation(line: 439, column: 31, scope: !2936)
!2939 = !DILocation(line: 439, column: 26, scope: !2936)
!2940 = !DILocation(line: 0, scope: !2936)
!2941 = !DILocation(line: 439, column: 5, scope: !2933)
!2942 = !DILocation(line: 440, column: 19, scope: !2936)
!2943 = !DILocation(line: 440, column: 16, scope: !2936)
!2944 = !DILocation(line: 440, column: 30, scope: !2936)
!2945 = !DILocation(line: 440, column: 27, scope: !2936)
!2946 = !DILocation(line: 440, column: 23, scope: !2936)
!2947 = !DILocation(line: 440, column: 11, scope: !2936)
!2948 = !DILocation(line: 440, column: 14, scope: !2936)
!2949 = !DILocation(line: 440, column: 7, scope: !2936)
!2950 = !DILocation(line: 439, column: 41, scope: !2936)
!2951 = !DILocation(line: 439, column: 5, scope: !2936)
!2952 = distinct !{!2952, !2941, !2953, !132}
!2953 = !DILocation(line: 440, column: 32, scope: !2933)
!2954 = !DILocation(line: 441, column: 16, scope: !2927)
!2955 = !DILocation(line: 441, column: 12, scope: !2927)
!2956 = distinct !{!2956, !2924, !2957, !132}
!2957 = !DILocation(line: 443, column: 3, scope: !2915)
!2958 = !DILocation(line: 445, column: 3, scope: !2915)
!2959 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb_once", scope: !74, file: !74, line: 580, type: !2334, scopeLine: 581, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2960 = !DILocalVariable(name: "state", arg: 1, scope: !2959, file: !74, line: 580, type: !2299)
!2961 = !DILocation(line: 0, scope: !2959)
!2962 = !DILocalVariable(name: "in", arg: 2, scope: !2959, file: !74, line: 580, type: !315)
!2963 = !DILocalVariable(name: "inlen", arg: 3, scope: !2959, file: !74, line: 580, type: !38)
!2964 = !DILocation(line: 582, column: 29, scope: !2959)
!2965 = !DILocation(line: 582, column: 22, scope: !2959)
!2966 = !DILocation(line: 582, column: 3, scope: !2959)
!2967 = !DILocation(line: 583, column: 10, scope: !2959)
!2968 = !DILocation(line: 583, column: 14, scope: !2959)
!2969 = !DILocation(line: 584, column: 1, scope: !2959)
!2970 = distinct !DISubprogram(name: "keccak_absorb_once", scope: !74, file: !74, line: 461, type: !2971, scopeLine: 466, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2971 = !DISubroutineType(types: !2972)
!2972 = !{null, !2316, !40, !315, !38, !33}
!2973 = !DILocalVariable(name: "s", arg: 1, scope: !2970, file: !74, line: 461, type: !2316)
!2974 = !DILocation(line: 0, scope: !2970)
!2975 = !DILocalVariable(name: "r", arg: 2, scope: !2970, file: !74, line: 462, type: !40)
!2976 = !DILocalVariable(name: "in", arg: 3, scope: !2970, file: !74, line: 463, type: !315)
!2977 = !DILocalVariable(name: "inlen", arg: 4, scope: !2970, file: !74, line: 464, type: !38)
!2978 = !DILocalVariable(name: "p", arg: 5, scope: !2970, file: !74, line: 465, type: !33)
!2979 = !DILocalVariable(name: "i", scope: !2970, file: !74, line: 467, type: !40)
!2980 = !DILocation(line: 469, column: 7, scope: !2981)
!2981 = distinct !DILexicalBlock(scope: !2970, file: !74, line: 469, column: 3)
!2982 = !DILocation(line: 469, scope: !2981)
!2983 = !DILocation(line: 469, column: 12, scope: !2984)
!2984 = distinct !DILexicalBlock(scope: !2981, file: !74, line: 469, column: 3)
!2985 = !DILocation(line: 469, column: 3, scope: !2981)
!2986 = !DILocation(line: 470, column: 5, scope: !2984)
!2987 = !DILocation(line: 470, column: 10, scope: !2984)
!2988 = !DILocation(line: 469, column: 17, scope: !2984)
!2989 = !DILocation(line: 469, column: 3, scope: !2984)
!2990 = distinct !{!2990, !2985, !2991, !132}
!2991 = !DILocation(line: 470, column: 12, scope: !2981)
!2992 = !DILocation(line: 472, column: 3, scope: !2970)
!2993 = !DILocation(line: 472, column: 15, scope: !2970)
!2994 = !DILocation(line: 473, column: 9, scope: !2995)
!2995 = distinct !DILexicalBlock(scope: !2996, file: !74, line: 473, column: 5)
!2996 = distinct !DILexicalBlock(scope: !2970, file: !74, line: 472, column: 21)
!2997 = !DILocation(line: 473, scope: !2995)
!2998 = !DILocation(line: 473, column: 16, scope: !2999)
!2999 = distinct !DILexicalBlock(scope: !2995, file: !74, line: 473, column: 5)
!3000 = !DILocation(line: 473, column: 14, scope: !2999)
!3001 = !DILocation(line: 473, column: 5, scope: !2995)
!3002 = !DILocation(line: 474, column: 26, scope: !2999)
!3003 = !DILocation(line: 474, column: 24, scope: !2999)
!3004 = !DILocation(line: 474, column: 15, scope: !2999)
!3005 = !DILocation(line: 474, column: 7, scope: !2999)
!3006 = !DILocation(line: 474, column: 12, scope: !2999)
!3007 = !DILocation(line: 473, column: 20, scope: !2999)
!3008 = !DILocation(line: 473, column: 5, scope: !2999)
!3009 = distinct !{!3009, !3001, !3010, !132}
!3010 = !DILocation(line: 474, column: 28, scope: !2995)
!3011 = !DILocation(line: 475, column: 8, scope: !2996)
!3012 = !DILocation(line: 476, column: 11, scope: !2996)
!3013 = !DILocation(line: 477, column: 5, scope: !2996)
!3014 = distinct !{!3014, !2992, !3015, !132}
!3015 = !DILocation(line: 478, column: 3, scope: !2970)
!3016 = !DILocation(line: 480, column: 7, scope: !3017)
!3017 = distinct !DILexicalBlock(scope: !2970, file: !74, line: 480, column: 3)
!3018 = !DILocation(line: 480, scope: !3017)
!3019 = !DILocation(line: 480, column: 12, scope: !3020)
!3020 = distinct !DILexicalBlock(scope: !3017, file: !74, line: 480, column: 3)
!3021 = !DILocation(line: 480, column: 3, scope: !3017)
!3022 = !DILocation(line: 481, column: 25, scope: !3020)
!3023 = !DILocation(line: 481, column: 15, scope: !3020)
!3024 = !DILocation(line: 481, column: 38, scope: !3020)
!3025 = !DILocation(line: 481, column: 35, scope: !3020)
!3026 = !DILocation(line: 481, column: 31, scope: !3020)
!3027 = !DILocation(line: 481, column: 8, scope: !3020)
!3028 = !DILocation(line: 481, column: 5, scope: !3020)
!3029 = !DILocation(line: 481, column: 12, scope: !3020)
!3030 = !DILocation(line: 480, column: 20, scope: !3020)
!3031 = !DILocation(line: 480, column: 3, scope: !3020)
!3032 = distinct !{!3032, !3021, !3033, !132}
!3033 = !DILocation(line: 481, column: 40, scope: !3017)
!3034 = !DILocation(line: 483, column: 13, scope: !2970)
!3035 = !DILocation(line: 483, column: 32, scope: !2970)
!3036 = !DILocation(line: 483, column: 29, scope: !2970)
!3037 = !DILocation(line: 483, column: 25, scope: !2970)
!3038 = !DILocation(line: 483, column: 6, scope: !2970)
!3039 = !DILocation(line: 483, column: 3, scope: !2970)
!3040 = !DILocation(line: 483, column: 10, scope: !2970)
!3041 = !DILocation(line: 484, column: 7, scope: !2970)
!3042 = !DILocation(line: 484, column: 10, scope: !2970)
!3043 = !DILocation(line: 484, column: 3, scope: !2970)
!3044 = !DILocation(line: 484, column: 14, scope: !2970)
!3045 = !DILocation(line: 485, column: 1, scope: !2970)
!3046 = distinct !DISubprogram(name: "load64", scope: !74, file: !74, line: 22, type: !3047, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3047 = !DISubroutineType(types: !3048)
!3048 = !{!70, !315}
!3049 = !DILocalVariable(name: "x", arg: 1, scope: !3046, file: !74, line: 22, type: !315)
!3050 = !DILocation(line: 0, scope: !3046)
!3051 = !DILocalVariable(name: "r", scope: !3046, file: !74, line: 24, type: !70)
!3052 = !DILocalVariable(name: "i", scope: !3046, file: !74, line: 23, type: !40)
!3053 = !DILocation(line: 26, column: 7, scope: !3054)
!3054 = distinct !DILexicalBlock(scope: !3046, file: !74, line: 26, column: 3)
!3055 = !DILocation(line: 26, scope: !3054)
!3056 = !DILocation(line: 26, column: 12, scope: !3057)
!3057 = distinct !DILexicalBlock(scope: !3054, file: !74, line: 26, column: 3)
!3058 = !DILocation(line: 26, column: 3, scope: !3054)
!3059 = !DILocation(line: 27, column: 20, scope: !3057)
!3060 = !DILocation(line: 27, column: 10, scope: !3057)
!3061 = !DILocation(line: 27, column: 29, scope: !3057)
!3062 = !DILocation(line: 27, column: 25, scope: !3057)
!3063 = !DILocation(line: 27, column: 7, scope: !3057)
!3064 = !DILocation(line: 27, column: 5, scope: !3057)
!3065 = !DILocation(line: 26, column: 16, scope: !3057)
!3066 = !DILocation(line: 26, column: 3, scope: !3057)
!3067 = distinct !{!3067, !3058, !3068, !132}
!3068 = !DILocation(line: 27, column: 30, scope: !3054)
!3069 = !DILocation(line: 29, column: 3, scope: !3046)
!3070 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeezeblocks", scope: !74, file: !74, line: 598, type: !2902, scopeLine: 599, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3071 = !DILocalVariable(name: "out", arg: 1, scope: !3070, file: !74, line: 598, type: !32)
!3072 = !DILocation(line: 0, scope: !3070)
!3073 = !DILocalVariable(name: "nblocks", arg: 2, scope: !3070, file: !74, line: 598, type: !38)
!3074 = !DILocalVariable(name: "state", arg: 3, scope: !3070, file: !74, line: 598, type: !2299)
!3075 = !DILocation(line: 600, column: 45, scope: !3070)
!3076 = !DILocation(line: 600, column: 38, scope: !3070)
!3077 = !DILocation(line: 600, column: 3, scope: !3070)
!3078 = !DILocation(line: 601, column: 1, scope: !3070)
!3079 = distinct !DISubprogram(name: "keccak_squeezeblocks", scope: !74, file: !74, line: 500, type: !3080, scopeLine: 504, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3080 = !DISubroutineType(types: !3081)
!3081 = !{null, !32, !38, !2316, !40}
!3082 = !DILocalVariable(name: "out", arg: 1, scope: !3079, file: !74, line: 500, type: !32)
!3083 = !DILocation(line: 0, scope: !3079)
!3084 = !DILocalVariable(name: "nblocks", arg: 2, scope: !3079, file: !74, line: 501, type: !38)
!3085 = !DILocalVariable(name: "s", arg: 3, scope: !3079, file: !74, line: 502, type: !2316)
!3086 = !DILocalVariable(name: "r", arg: 4, scope: !3079, file: !74, line: 503, type: !40)
!3087 = !DILocation(line: 507, column: 3, scope: !3079)
!3088 = !DILocation(line: 508, column: 5, scope: !3089)
!3089 = distinct !DILexicalBlock(scope: !3079, file: !74, line: 507, column: 18)
!3090 = !DILocalVariable(name: "i", scope: !3079, file: !74, line: 505, type: !40)
!3091 = !DILocation(line: 509, column: 9, scope: !3092)
!3092 = distinct !DILexicalBlock(scope: !3089, file: !74, line: 509, column: 5)
!3093 = !DILocation(line: 509, scope: !3092)
!3094 = !DILocation(line: 509, column: 16, scope: !3095)
!3095 = distinct !DILexicalBlock(scope: !3092, file: !74, line: 509, column: 5)
!3096 = !DILocation(line: 509, column: 14, scope: !3095)
!3097 = !DILocation(line: 509, column: 5, scope: !3092)
!3098 = !DILocation(line: 510, column: 20, scope: !3095)
!3099 = !DILocation(line: 510, column: 18, scope: !3095)
!3100 = !DILocation(line: 510, column: 24, scope: !3095)
!3101 = !DILocation(line: 510, column: 7, scope: !3095)
!3102 = !DILocation(line: 509, column: 20, scope: !3095)
!3103 = !DILocation(line: 509, column: 5, scope: !3095)
!3104 = distinct !{!3104, !3097, !3105, !132}
!3105 = !DILocation(line: 510, column: 28, scope: !3092)
!3106 = !DILocation(line: 511, column: 9, scope: !3089)
!3107 = !DILocation(line: 512, column: 13, scope: !3089)
!3108 = distinct !{!3108, !3087, !3109, !132}
!3109 = !DILocation(line: 513, column: 3, scope: !3079)
!3110 = !DILocation(line: 514, column: 1, scope: !3079)
!3111 = distinct !DISubprogram(name: "store64", scope: !74, file: !74, line: 40, type: !3112, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3112 = !DISubroutineType(types: !3113)
!3113 = !{null, !32, !70}
!3114 = !DILocalVariable(name: "x", arg: 1, scope: !3111, file: !74, line: 40, type: !32)
!3115 = !DILocation(line: 0, scope: !3111)
!3116 = !DILocalVariable(name: "u", arg: 2, scope: !3111, file: !74, line: 40, type: !70)
!3117 = !DILocalVariable(name: "i", scope: !3111, file: !74, line: 41, type: !40)
!3118 = !DILocation(line: 43, column: 7, scope: !3119)
!3119 = distinct !DILexicalBlock(scope: !3111, file: !74, line: 43, column: 3)
!3120 = !DILocation(line: 43, scope: !3119)
!3121 = !DILocation(line: 43, column: 12, scope: !3122)
!3122 = distinct !DILexicalBlock(scope: !3119, file: !74, line: 43, column: 3)
!3123 = !DILocation(line: 43, column: 3, scope: !3119)
!3124 = !DILocation(line: 44, column: 18, scope: !3122)
!3125 = !DILocation(line: 44, column: 14, scope: !3122)
!3126 = !DILocation(line: 44, column: 12, scope: !3122)
!3127 = !DILocation(line: 44, column: 5, scope: !3122)
!3128 = !DILocation(line: 44, column: 10, scope: !3122)
!3129 = !DILocation(line: 43, column: 16, scope: !3122)
!3130 = !DILocation(line: 43, column: 3, scope: !3122)
!3131 = distinct !{!3131, !3123, !3132, !132}
!3132 = !DILocation(line: 44, column: 19, scope: !3119)
!3133 = !DILocation(line: 45, column: 1, scope: !3111)
!3134 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_init", scope: !74, file: !74, line: 610, type: !2297, scopeLine: 611, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3135 = !DILocalVariable(name: "state", arg: 1, scope: !3134, file: !74, line: 610, type: !2299)
!3136 = !DILocation(line: 0, scope: !3134)
!3137 = !DILocation(line: 612, column: 22, scope: !3134)
!3138 = !DILocation(line: 612, column: 15, scope: !3134)
!3139 = !DILocation(line: 612, column: 3, scope: !3134)
!3140 = !DILocation(line: 613, column: 10, scope: !3134)
!3141 = !DILocation(line: 613, column: 14, scope: !3134)
!3142 = !DILocation(line: 614, column: 1, scope: !3134)
!3143 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb", scope: !74, file: !74, line: 625, type: !2334, scopeLine: 626, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3144 = !DILocalVariable(name: "state", arg: 1, scope: !3143, file: !74, line: 625, type: !2299)
!3145 = !DILocation(line: 0, scope: !3143)
!3146 = !DILocalVariable(name: "in", arg: 2, scope: !3143, file: !74, line: 625, type: !315)
!3147 = !DILocalVariable(name: "inlen", arg: 3, scope: !3143, file: !74, line: 625, type: !38)
!3148 = !DILocation(line: 627, column: 37, scope: !3143)
!3149 = !DILocation(line: 627, column: 30, scope: !3143)
!3150 = !DILocation(line: 627, column: 47, scope: !3143)
!3151 = !DILocation(line: 627, column: 16, scope: !3143)
!3152 = !DILocation(line: 627, column: 10, scope: !3143)
!3153 = !DILocation(line: 627, column: 14, scope: !3143)
!3154 = !DILocation(line: 628, column: 1, scope: !3143)
!3155 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_finalize", scope: !74, file: !74, line: 637, type: !2297, scopeLine: 638, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3156 = !DILocalVariable(name: "state", arg: 1, scope: !3155, file: !74, line: 637, type: !2299)
!3157 = !DILocation(line: 0, scope: !3155)
!3158 = !DILocation(line: 639, column: 26, scope: !3155)
!3159 = !DILocation(line: 639, column: 19, scope: !3155)
!3160 = !DILocation(line: 639, column: 36, scope: !3155)
!3161 = !DILocation(line: 639, column: 3, scope: !3155)
!3162 = !DILocation(line: 640, column: 10, scope: !3155)
!3163 = !DILocation(line: 640, column: 14, scope: !3155)
!3164 = !DILocation(line: 641, column: 1, scope: !3155)
!3165 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeeze", scope: !74, file: !74, line: 653, type: !2902, scopeLine: 654, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3166 = !DILocalVariable(name: "out", arg: 1, scope: !3165, file: !74, line: 653, type: !32)
!3167 = !DILocation(line: 0, scope: !3165)
!3168 = !DILocalVariable(name: "outlen", arg: 2, scope: !3165, file: !74, line: 653, type: !38)
!3169 = !DILocalVariable(name: "state", arg: 3, scope: !3165, file: !74, line: 653, type: !2299)
!3170 = !DILocation(line: 655, column: 51, scope: !3165)
!3171 = !DILocation(line: 655, column: 44, scope: !3165)
!3172 = !DILocation(line: 655, column: 61, scope: !3165)
!3173 = !DILocation(line: 655, column: 16, scope: !3165)
!3174 = !DILocation(line: 655, column: 10, scope: !3165)
!3175 = !DILocation(line: 655, column: 14, scope: !3165)
!3176 = !DILocation(line: 656, column: 1, scope: !3165)
!3177 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb_once", scope: !74, file: !74, line: 667, type: !2334, scopeLine: 668, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3178 = !DILocalVariable(name: "state", arg: 1, scope: !3177, file: !74, line: 667, type: !2299)
!3179 = !DILocation(line: 0, scope: !3177)
!3180 = !DILocalVariable(name: "in", arg: 2, scope: !3177, file: !74, line: 667, type: !315)
!3181 = !DILocalVariable(name: "inlen", arg: 3, scope: !3177, file: !74, line: 667, type: !38)
!3182 = !DILocation(line: 669, column: 29, scope: !3177)
!3183 = !DILocation(line: 669, column: 22, scope: !3177)
!3184 = !DILocation(line: 669, column: 3, scope: !3177)
!3185 = !DILocation(line: 670, column: 10, scope: !3177)
!3186 = !DILocation(line: 670, column: 14, scope: !3177)
!3187 = !DILocation(line: 671, column: 1, scope: !3177)
!3188 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeezeblocks", scope: !74, file: !74, line: 685, type: !2902, scopeLine: 686, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3189 = !DILocalVariable(name: "out", arg: 1, scope: !3188, file: !74, line: 685, type: !32)
!3190 = !DILocation(line: 0, scope: !3188)
!3191 = !DILocalVariable(name: "nblocks", arg: 2, scope: !3188, file: !74, line: 685, type: !38)
!3192 = !DILocalVariable(name: "state", arg: 3, scope: !3188, file: !74, line: 685, type: !2299)
!3193 = !DILocation(line: 687, column: 45, scope: !3188)
!3194 = !DILocation(line: 687, column: 38, scope: !3188)
!3195 = !DILocation(line: 687, column: 3, scope: !3188)
!3196 = !DILocation(line: 688, column: 1, scope: !3188)
!3197 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128", scope: !74, file: !74, line: 700, type: !3198, scopeLine: 701, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3198 = !DISubroutineType(types: !3199)
!3199 = !{null, !32, !38, !315, !38}
!3200 = !DILocalVariable(name: "out", arg: 1, scope: !3197, file: !74, line: 700, type: !32)
!3201 = !DILocation(line: 0, scope: !3197)
!3202 = !DILocalVariable(name: "outlen", arg: 2, scope: !3197, file: !74, line: 700, type: !38)
!3203 = !DILocalVariable(name: "in", arg: 3, scope: !3197, file: !74, line: 700, type: !315)
!3204 = !DILocalVariable(name: "inlen", arg: 4, scope: !3197, file: !74, line: 700, type: !38)
!3205 = !DILocalVariable(name: "state", scope: !3197, file: !74, line: 703, type: !2300)
!3206 = !DILocation(line: 703, column: 16, scope: !3197)
!3207 = !DILocation(line: 705, column: 3, scope: !3197)
!3208 = !DILocation(line: 706, column: 19, scope: !3197)
!3209 = !DILocalVariable(name: "nblocks", scope: !3197, file: !74, line: 702, type: !38)
!3210 = !DILocation(line: 707, column: 3, scope: !3197)
!3211 = !DILocation(line: 708, column: 20, scope: !3197)
!3212 = !DILocation(line: 708, column: 10, scope: !3197)
!3213 = !DILocation(line: 709, column: 17, scope: !3197)
!3214 = !DILocation(line: 709, column: 7, scope: !3197)
!3215 = !DILocation(line: 710, column: 3, scope: !3197)
!3216 = !DILocation(line: 711, column: 1, scope: !3197)
!3217 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256", scope: !74, file: !74, line: 723, type: !3198, scopeLine: 724, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3218 = !DILocalVariable(name: "out", arg: 1, scope: !3217, file: !74, line: 723, type: !32)
!3219 = !DILocation(line: 0, scope: !3217)
!3220 = !DILocalVariable(name: "outlen", arg: 2, scope: !3217, file: !74, line: 723, type: !38)
!3221 = !DILocalVariable(name: "in", arg: 3, scope: !3217, file: !74, line: 723, type: !315)
!3222 = !DILocalVariable(name: "inlen", arg: 4, scope: !3217, file: !74, line: 723, type: !38)
!3223 = !DILocalVariable(name: "state", scope: !3217, file: !74, line: 726, type: !2300)
!3224 = !DILocation(line: 726, column: 16, scope: !3217)
!3225 = !DILocation(line: 728, column: 3, scope: !3217)
!3226 = !DILocation(line: 729, column: 19, scope: !3217)
!3227 = !DILocalVariable(name: "nblocks", scope: !3217, file: !74, line: 725, type: !38)
!3228 = !DILocation(line: 730, column: 3, scope: !3217)
!3229 = !DILocation(line: 731, column: 20, scope: !3217)
!3230 = !DILocation(line: 731, column: 10, scope: !3217)
!3231 = !DILocation(line: 732, column: 17, scope: !3217)
!3232 = !DILocation(line: 732, column: 7, scope: !3217)
!3233 = !DILocation(line: 733, column: 3, scope: !3217)
!3234 = !DILocation(line: 734, column: 1, scope: !3217)
!3235 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_256", scope: !74, file: !74, line: 745, type: !3236, scopeLine: 746, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3236 = !DISubroutineType(types: !3237)
!3237 = !{null, !32, !315, !38}
!3238 = !DILocalVariable(name: "h", arg: 1, scope: !3235, file: !74, line: 745, type: !32)
!3239 = !DILocation(line: 0, scope: !3235)
!3240 = !DILocalVariable(name: "in", arg: 2, scope: !3235, file: !74, line: 745, type: !315)
!3241 = !DILocalVariable(name: "inlen", arg: 3, scope: !3235, file: !74, line: 745, type: !38)
!3242 = !DILocalVariable(name: "s", scope: !3235, file: !74, line: 748, type: !455)
!3243 = !DILocation(line: 748, column: 12, scope: !3235)
!3244 = !DILocation(line: 750, column: 22, scope: !3235)
!3245 = !DILocation(line: 750, column: 3, scope: !3235)
!3246 = !DILocation(line: 751, column: 28, scope: !3235)
!3247 = !DILocation(line: 751, column: 3, scope: !3235)
!3248 = !DILocalVariable(name: "i", scope: !3235, file: !74, line: 747, type: !40)
!3249 = !DILocation(line: 752, column: 7, scope: !3250)
!3250 = distinct !DILexicalBlock(scope: !3235, file: !74, line: 752, column: 3)
!3251 = !DILocation(line: 752, scope: !3250)
!3252 = !DILocation(line: 752, column: 12, scope: !3253)
!3253 = distinct !DILexicalBlock(scope: !3250, file: !74, line: 752, column: 3)
!3254 = !DILocation(line: 752, column: 3, scope: !3250)
!3255 = !DILocation(line: 753, column: 16, scope: !3253)
!3256 = !DILocation(line: 753, column: 14, scope: !3253)
!3257 = !DILocation(line: 753, column: 19, scope: !3253)
!3258 = !DILocation(line: 753, column: 5, scope: !3253)
!3259 = !DILocation(line: 752, column: 16, scope: !3253)
!3260 = !DILocation(line: 752, column: 3, scope: !3253)
!3261 = distinct !{!3261, !3254, !3262, !132}
!3262 = !DILocation(line: 753, column: 23, scope: !3250)
!3263 = !DILocation(line: 754, column: 1, scope: !3235)
!3264 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_512", scope: !74, file: !74, line: 765, type: !3236, scopeLine: 766, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3265 = !DILocalVariable(name: "h", arg: 1, scope: !3264, file: !74, line: 765, type: !32)
!3266 = !DILocation(line: 0, scope: !3264)
!3267 = !DILocalVariable(name: "in", arg: 2, scope: !3264, file: !74, line: 765, type: !315)
!3268 = !DILocalVariable(name: "inlen", arg: 3, scope: !3264, file: !74, line: 765, type: !38)
!3269 = !DILocalVariable(name: "s", scope: !3264, file: !74, line: 768, type: !455)
!3270 = !DILocation(line: 768, column: 12, scope: !3264)
!3271 = !DILocation(line: 770, column: 22, scope: !3264)
!3272 = !DILocation(line: 770, column: 3, scope: !3264)
!3273 = !DILocation(line: 771, column: 28, scope: !3264)
!3274 = !DILocation(line: 771, column: 3, scope: !3264)
!3275 = !DILocalVariable(name: "i", scope: !3264, file: !74, line: 767, type: !40)
!3276 = !DILocation(line: 772, column: 7, scope: !3277)
!3277 = distinct !DILexicalBlock(scope: !3264, file: !74, line: 772, column: 3)
!3278 = !DILocation(line: 772, scope: !3277)
!3279 = !DILocation(line: 772, column: 12, scope: !3280)
!3280 = distinct !DILexicalBlock(scope: !3277, file: !74, line: 772, column: 3)
!3281 = !DILocation(line: 772, column: 3, scope: !3277)
!3282 = !DILocation(line: 773, column: 16, scope: !3280)
!3283 = !DILocation(line: 773, column: 14, scope: !3280)
!3284 = !DILocation(line: 773, column: 19, scope: !3280)
!3285 = !DILocation(line: 773, column: 5, scope: !3280)
!3286 = !DILocation(line: 772, column: 16, scope: !3280)
!3287 = !DILocation(line: 772, column: 3, scope: !3280)
!3288 = distinct !{!3288, !3281, !3289, !132}
!3289 = !DILocation(line: 773, column: 23, scope: !3277)
!3290 = !DILocation(line: 774, column: 1, scope: !3264)
!3291 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_kyber_shake128_absorb", scope: !3292, file: !3292, line: 18, type: !3293, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !100, retainedNodes: !49)
!3292 = !DIFile(filename: "../../ref/symmetric-shake.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!3293 = !DISubroutineType(types: !3294)
!3294 = !{null, !3295, !315, !33, !33}
!3295 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3296, size: 32)
!3296 = !DIDerivedType(tag: DW_TAG_typedef, name: "keccak_state", file: !451, line: 17, baseType: !3297)
!3297 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !451, line: 14, size: 1664, elements: !3298)
!3298 = !{!3299, !3300}
!3299 = !DIDerivedType(tag: DW_TAG_member, name: "s", scope: !3297, file: !451, line: 15, baseType: !455, size: 1600)
!3300 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !3297, file: !451, line: 16, baseType: !40, size: 32, offset: 1600)
!3301 = !DILocalVariable(name: "state", arg: 1, scope: !3291, file: !3292, line: 18, type: !3295)
!3302 = !DILocation(line: 0, scope: !3291)
!3303 = !DILocalVariable(name: "seed", arg: 2, scope: !3291, file: !3292, line: 19, type: !315)
!3304 = !DILocalVariable(name: "x", arg: 3, scope: !3291, file: !3292, line: 20, type: !33)
!3305 = !DILocalVariable(name: "y", arg: 4, scope: !3291, file: !3292, line: 21, type: !33)
!3306 = !DILocalVariable(name: "extseed", scope: !3291, file: !3292, line: 23, type: !3307)
!3307 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 272, elements: !3308)
!3308 = !{!3309}
!3309 = !DISubrange(count: 34)
!3310 = !DILocation(line: 23, column: 11, scope: !3291)
!3311 = !DILocation(line: 25, column: 10, scope: !3291)
!3312 = !DILocation(line: 25, column: 3, scope: !3291)
!3313 = !DILocation(line: 26, column: 3, scope: !3291)
!3314 = !DILocation(line: 26, column: 29, scope: !3291)
!3315 = !DILocation(line: 27, column: 3, scope: !3291)
!3316 = !DILocation(line: 27, column: 29, scope: !3291)
!3317 = !DILocation(line: 29, column: 31, scope: !3291)
!3318 = !DILocation(line: 29, column: 3, scope: !3291)
!3319 = !DILocation(line: 30, column: 1, scope: !3291)
!3320 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_kyber_shake256_prf", scope: !3292, file: !3292, line: 43, type: !3321, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !100, retainedNodes: !49)
!3321 = !DISubroutineType(types: !3322)
!3322 = !{null, !32, !38, !315, !33}
!3323 = !DILocalVariable(name: "out", arg: 1, scope: !3320, file: !3292, line: 43, type: !32)
!3324 = !DILocation(line: 0, scope: !3320)
!3325 = !DILocalVariable(name: "outlen", arg: 2, scope: !3320, file: !3292, line: 43, type: !38)
!3326 = !DILocalVariable(name: "key", arg: 3, scope: !3320, file: !3292, line: 43, type: !315)
!3327 = !DILocalVariable(name: "nonce", arg: 4, scope: !3320, file: !3292, line: 43, type: !33)
!3328 = !DILocalVariable(name: "extkey", scope: !3320, file: !3292, line: 45, type: !3329)
!3329 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 264, elements: !3330)
!3330 = !{!3331}
!3331 = !DISubrange(count: 33)
!3332 = !DILocation(line: 45, column: 11, scope: !3320)
!3333 = !DILocation(line: 47, column: 10, scope: !3320)
!3334 = !DILocation(line: 47, column: 3, scope: !3320)
!3335 = !DILocation(line: 48, column: 3, scope: !3320)
!3336 = !DILocation(line: 48, column: 26, scope: !3320)
!3337 = !DILocation(line: 50, column: 25, scope: !3320)
!3338 = !DILocation(line: 50, column: 3, scope: !3320)
!3339 = !DILocation(line: 51, column: 1, scope: !3320)
!3340 = distinct !DISubprogram(name: "pqcrystals_kyber1024_ref_kyber_shake256_rkprf", scope: !3292, file: !3292, line: 64, type: !789, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !100, retainedNodes: !49)
!3341 = !DILocalVariable(name: "out", arg: 1, scope: !3340, file: !3292, line: 64, type: !32)
!3342 = !DILocation(line: 0, scope: !3340)
!3343 = !DILocalVariable(name: "key", arg: 2, scope: !3340, file: !3292, line: 64, type: !315)
!3344 = !DILocalVariable(name: "input", arg: 3, scope: !3340, file: !3292, line: 64, type: !315)
!3345 = !DILocalVariable(name: "s", scope: !3340, file: !3292, line: 66, type: !3296)
!3346 = !DILocation(line: 66, column: 16, scope: !3340)
!3347 = !DILocation(line: 68, column: 3, scope: !3340)
!3348 = !DILocation(line: 69, column: 3, scope: !3340)
!3349 = !DILocation(line: 70, column: 3, scope: !3340)
!3350 = !DILocation(line: 71, column: 3, scope: !3340)
!3351 = !DILocation(line: 72, column: 3, scope: !3340)
!3352 = !DILocation(line: 73, column: 1, scope: !3340)
