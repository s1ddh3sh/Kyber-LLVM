; ModuleID = 'kyber_composite'
source_filename = "kyber_composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "arm-unknown-none-eabi"

%struct.keccak_state = type { [25 x i64], i32 }
%struct.polyvec = type { [2 x %struct.poly] }
%struct.poly = type { [256 x i16] }

@.str = private unnamed_addr constant [28 x i8] c"CRYPTO_SECRETKEYBYTES:  %d\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [28 x i8] c"CRYPTO_PUBLICKEYBYTES:  %d\0A\00", align 1, !dbg !7
@.str.2 = private unnamed_addr constant [28 x i8] c"CRYPTO_CIPHERTEXTBYTES: %d\0A\00", align 1, !dbg !9
@.str.3 = private unnamed_addr constant [12 x i8] c"ERROR keys\0A\00", align 1, !dbg !11
@.str.4 = private unnamed_addr constant [18 x i8] c"ERROR invalid sk\0A\00", align 1, !dbg !16
@.str.5 = private unnamed_addr constant [26 x i8] c"ERROR invalid ciphertext\0A\00", align 1, !dbg !21
@randombytes.fd = internal global i32 -1, align 4, !dbg !26
@.str.6 = private unnamed_addr constant [13 x i8] c"/dev/urandom\00", align 1, !dbg !44
@pqcrystals_kyber512_ref_zetas = dso_local constant [128 x i16] [i16 -1044, i16 -758, i16 -359, i16 -1517, i16 1493, i16 1422, i16 287, i16 202, i16 -171, i16 622, i16 1577, i16 182, i16 962, i16 -1202, i16 -1474, i16 1468, i16 573, i16 -1325, i16 264, i16 383, i16 -829, i16 1458, i16 -1602, i16 -130, i16 -681, i16 1017, i16 732, i16 608, i16 -1542, i16 411, i16 -205, i16 -1571, i16 1223, i16 652, i16 -552, i16 1015, i16 -1293, i16 1491, i16 -282, i16 -1544, i16 516, i16 -8, i16 -320, i16 -666, i16 -1618, i16 -1162, i16 126, i16 1469, i16 -853, i16 -90, i16 -271, i16 830, i16 107, i16 -1421, i16 -247, i16 -951, i16 -398, i16 961, i16 -1508, i16 -725, i16 448, i16 -1065, i16 677, i16 -1275, i16 -1103, i16 430, i16 555, i16 843, i16 -1251, i16 871, i16 1550, i16 105, i16 422, i16 587, i16 177, i16 -235, i16 -291, i16 -460, i16 1574, i16 1653, i16 -246, i16 778, i16 1159, i16 -147, i16 -777, i16 1483, i16 -602, i16 1119, i16 -1590, i16 644, i16 -872, i16 349, i16 418, i16 329, i16 -156, i16 -75, i16 817, i16 1097, i16 603, i16 610, i16 1322, i16 -1285, i16 -1465, i16 384, i16 -1215, i16 -136, i16 1218, i16 -1335, i16 -874, i16 220, i16 -1187, i16 -1659, i16 -1185, i16 -1530, i16 -1278, i16 794, i16 -1510, i16 -854, i16 -870, i16 478, i16 -108, i16 -308, i16 996, i16 991, i16 958, i16 -1460, i16 1522, i16 1628], align 2, !dbg !51
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
  %call4 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef 1632) #2, !dbg !133
  %call5 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef 800) #2, !dbg !134
  %call6 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 768) #2, !dbg !135
  br label %return, !dbg !136

return:                                           ; preds = %for.end, %if.then
  %retval.0 = phi i32 [ 1, %if.then ], [ 0, %for.end ], !dbg !110
  ret i32 %retval.0, !dbg !137
}

; Function Attrs: noinline nounwind optnone
define internal i32 @test_keys() #0 !dbg !138 {
entry:
  %pk = alloca [800 x i8], align 1
  %sk = alloca [1632 x i8], align 1
  %ct = alloca [768 x i8], align 1
  %key_a = alloca [32 x i8], align 1
  %key_b = alloca [32 x i8], align 1
    #dbg_declare(ptr %pk, !139, !DIExpression(), !143)
    #dbg_declare(ptr %sk, !144, !DIExpression(), !148)
    #dbg_declare(ptr %ct, !149, !DIExpression(), !153)
    #dbg_declare(ptr %key_a, !154, !DIExpression(), !158)
    #dbg_declare(ptr %key_b, !159, !DIExpression(), !160)
  %arraydecay = getelementptr inbounds [800 x i8], ptr %pk, i32 0, i32 0, !dbg !161
  %arraydecay1 = getelementptr inbounds [1632 x i8], ptr %sk, i32 0, i32 0, !dbg !162
  %call = call i32 @pqcrystals_kyber512_ref_keypair(ptr noundef %arraydecay, ptr noundef %arraydecay1) #2, !dbg !163
  %arraydecay2 = getelementptr inbounds [768 x i8], ptr %ct, i32 0, i32 0, !dbg !164
  %arraydecay3 = getelementptr inbounds [32 x i8], ptr %key_b, i32 0, i32 0, !dbg !165
  %arraydecay4 = getelementptr inbounds [800 x i8], ptr %pk, i32 0, i32 0, !dbg !166
  %call5 = call i32 @pqcrystals_kyber512_ref_enc(ptr noundef %arraydecay2, ptr noundef %arraydecay3, ptr noundef %arraydecay4) #2, !dbg !167
  %arraydecay6 = getelementptr inbounds [32 x i8], ptr %key_a, i32 0, i32 0, !dbg !168
  %arraydecay7 = getelementptr inbounds [768 x i8], ptr %ct, i32 0, i32 0, !dbg !169
  %arraydecay8 = getelementptr inbounds [1632 x i8], ptr %sk, i32 0, i32 0, !dbg !170
  %call9 = call i32 @pqcrystals_kyber512_ref_dec(ptr noundef %arraydecay6, ptr noundef %arraydecay7, ptr noundef %arraydecay8) #2, !dbg !171
  %arraydecay10 = getelementptr inbounds [32 x i8], ptr %key_a, i32 0, i32 0, !dbg !172
  %arraydecay11 = getelementptr inbounds [32 x i8], ptr %key_b, i32 0, i32 0, !dbg !174
  %call12 = call i32 @memcmp(ptr noundef %arraydecay10, ptr noundef %arraydecay11, i32 noundef 32) #2, !dbg !175
  %tobool = icmp ne i32 %call12, 0, !dbg !175
  br i1 %tobool, label %if.then, label %if.end, !dbg !175

if.then:                                          ; preds = %entry
  %call13 = call i32 (ptr, ...) @printf(ptr noundef @.str.3) #2, !dbg !176
  br label %return, !dbg !178

if.end:                                           ; preds = %entry
  br label %return, !dbg !179

return:                                           ; preds = %if.end, %if.then
  %retval.0 = phi i32 [ 1, %if.then ], [ 0, %if.end ], !dbg !180
  ret i32 %retval.0, !dbg !181
}

; Function Attrs: noinline nounwind optnone
define internal i32 @test_invalid_sk_a() #0 !dbg !182 {
entry:
  %pk = alloca [800 x i8], align 1
  %sk = alloca [1632 x i8], align 1
  %ct = alloca [768 x i8], align 1
  %key_a = alloca [32 x i8], align 1
  %key_b = alloca [32 x i8], align 1
    #dbg_declare(ptr %pk, !183, !DIExpression(), !184)
    #dbg_declare(ptr %sk, !185, !DIExpression(), !186)
    #dbg_declare(ptr %ct, !187, !DIExpression(), !188)
    #dbg_declare(ptr %key_a, !189, !DIExpression(), !190)
    #dbg_declare(ptr %key_b, !191, !DIExpression(), !192)
  %arraydecay = getelementptr inbounds [800 x i8], ptr %pk, i32 0, i32 0, !dbg !193
  %arraydecay1 = getelementptr inbounds [1632 x i8], ptr %sk, i32 0, i32 0, !dbg !194
  %call = call i32 @pqcrystals_kyber512_ref_keypair(ptr noundef %arraydecay, ptr noundef %arraydecay1) #2, !dbg !195
  %arraydecay2 = getelementptr inbounds [768 x i8], ptr %ct, i32 0, i32 0, !dbg !196
  %arraydecay3 = getelementptr inbounds [32 x i8], ptr %key_b, i32 0, i32 0, !dbg !197
  %arraydecay4 = getelementptr inbounds [800 x i8], ptr %pk, i32 0, i32 0, !dbg !198
  %call5 = call i32 @pqcrystals_kyber512_ref_enc(ptr noundef %arraydecay2, ptr noundef %arraydecay3, ptr noundef %arraydecay4) #2, !dbg !199
  %arraydecay6 = getelementptr inbounds [1632 x i8], ptr %sk, i32 0, i32 0, !dbg !200
  call void @randombytes(ptr noundef %arraydecay6, i32 noundef 1632) #2, !dbg !201
  %arraydecay7 = getelementptr inbounds [32 x i8], ptr %key_a, i32 0, i32 0, !dbg !202
  %arraydecay8 = getelementptr inbounds [768 x i8], ptr %ct, i32 0, i32 0, !dbg !203
  %arraydecay9 = getelementptr inbounds [1632 x i8], ptr %sk, i32 0, i32 0, !dbg !204
  %call10 = call i32 @pqcrystals_kyber512_ref_dec(ptr noundef %arraydecay7, ptr noundef %arraydecay8, ptr noundef %arraydecay9) #2, !dbg !205
  %arraydecay11 = getelementptr inbounds [32 x i8], ptr %key_a, i32 0, i32 0, !dbg !206
  %arraydecay12 = getelementptr inbounds [32 x i8], ptr %key_b, i32 0, i32 0, !dbg !208
  %call13 = call i32 @memcmp(ptr noundef %arraydecay11, ptr noundef %arraydecay12, i32 noundef 32) #2, !dbg !209
  %tobool = icmp ne i32 %call13, 0, !dbg !209
  br i1 %tobool, label %if.end, label %if.then, !dbg !210

if.then:                                          ; preds = %entry
  %call14 = call i32 (ptr, ...) @printf(ptr noundef @.str.4) #2, !dbg !211
  br label %return, !dbg !213

if.end:                                           ; preds = %entry
  br label %return, !dbg !214

return:                                           ; preds = %if.end, %if.then
  %retval.0 = phi i32 [ 0, %if.end ], [ 1, %if.then ], !dbg !215
  ret i32 %retval.0, !dbg !216
}

; Function Attrs: noinline nounwind optnone
define internal i32 @test_invalid_ciphertext() #0 !dbg !217 {
entry:
  %pk = alloca [800 x i8], align 1
  %sk = alloca [1632 x i8], align 1
  %ct = alloca [768 x i8], align 1
  %key_a = alloca [32 x i8], align 1
  %key_b = alloca [32 x i8], align 1
  %b = alloca i8, align 1
  %pos = alloca i32, align 4
    #dbg_declare(ptr %pk, !218, !DIExpression(), !219)
    #dbg_declare(ptr %sk, !220, !DIExpression(), !221)
    #dbg_declare(ptr %ct, !222, !DIExpression(), !223)
    #dbg_declare(ptr %key_a, !224, !DIExpression(), !225)
    #dbg_declare(ptr %key_b, !226, !DIExpression(), !227)
    #dbg_declare(ptr %b, !228, !DIExpression(), !229)
    #dbg_declare(ptr %pos, !230, !DIExpression(), !231)
  br label %do.body, !dbg !232

do.body:                                          ; preds = %do.cond, %entry
  call void @randombytes(ptr noundef %b, i32 noundef 1) #2, !dbg !233
  br label %do.cond, !dbg !235

do.cond:                                          ; preds = %do.body
  %0 = load i8, ptr %b, align 1, !dbg !236
  %tobool = icmp ne i8 %0, 0, !dbg !237
  %lnot = xor i1 %tobool, true, !dbg !237
  br i1 %lnot, label %do.body, label %do.end, !dbg !235, !llvm.loop !238

do.end:                                           ; preds = %do.cond
  call void @randombytes(ptr noundef %pos, i32 noundef 4) #2, !dbg !240
  %arraydecay = getelementptr inbounds [800 x i8], ptr %pk, i32 0, i32 0, !dbg !241
  %arraydecay1 = getelementptr inbounds [1632 x i8], ptr %sk, i32 0, i32 0, !dbg !242
  %call = call i32 @pqcrystals_kyber512_ref_keypair(ptr noundef %arraydecay, ptr noundef %arraydecay1) #2, !dbg !243
  %arraydecay2 = getelementptr inbounds [768 x i8], ptr %ct, i32 0, i32 0, !dbg !244
  %arraydecay3 = getelementptr inbounds [32 x i8], ptr %key_b, i32 0, i32 0, !dbg !245
  %arraydecay4 = getelementptr inbounds [800 x i8], ptr %pk, i32 0, i32 0, !dbg !246
  %call5 = call i32 @pqcrystals_kyber512_ref_enc(ptr noundef %arraydecay2, ptr noundef %arraydecay3, ptr noundef %arraydecay4) #2, !dbg !247
  %1 = load i8, ptr %b, align 1, !dbg !248
  %conv = zext i8 %1 to i32, !dbg !248
  %2 = load i32, ptr %pos, align 4, !dbg !249
  %rem = urem i32 %2, 768, !dbg !250
  %arrayidx = getelementptr inbounds nuw [768 x i8], ptr %ct, i32 0, i32 %rem, !dbg !251
  %3 = load i8, ptr %arrayidx, align 1, !dbg !252
  %conv6 = zext i8 %3 to i32, !dbg !252
  %xor = xor i32 %conv6, %conv, !dbg !252
  %conv7 = trunc i32 %xor to i8, !dbg !252
  store i8 %conv7, ptr %arrayidx, align 1, !dbg !252
  %arraydecay8 = getelementptr inbounds [32 x i8], ptr %key_a, i32 0, i32 0, !dbg !253
  %arraydecay9 = getelementptr inbounds [768 x i8], ptr %ct, i32 0, i32 0, !dbg !254
  %arraydecay10 = getelementptr inbounds [1632 x i8], ptr %sk, i32 0, i32 0, !dbg !255
  %call11 = call i32 @pqcrystals_kyber512_ref_dec(ptr noundef %arraydecay8, ptr noundef %arraydecay9, ptr noundef %arraydecay10) #2, !dbg !256
  %arraydecay12 = getelementptr inbounds [32 x i8], ptr %key_a, i32 0, i32 0, !dbg !257
  %arraydecay13 = getelementptr inbounds [32 x i8], ptr %key_b, i32 0, i32 0, !dbg !259
  %call14 = call i32 @memcmp(ptr noundef %arraydecay12, ptr noundef %arraydecay13, i32 noundef 32) #2, !dbg !260
  %tobool15 = icmp ne i32 %call14, 0, !dbg !260
  br i1 %tobool15, label %if.end, label %if.then, !dbg !261

if.then:                                          ; preds = %do.end
  %call16 = call i32 (ptr, ...) @printf(ptr noundef @.str.5) #2, !dbg !262
  br label %return, !dbg !264

if.end:                                           ; preds = %do.end
  br label %return, !dbg !265

return:                                           ; preds = %if.end, %if.then
  %retval.0 = phi i32 [ 0, %if.end ], [ 1, %if.then ], !dbg !266
  ret i32 %retval.0, !dbg !267
}

declare dso_local i32 @printf(ptr noundef, ...) #1

declare dso_local i32 @memcmp(ptr noundef, ptr noundef, i32 noundef) #1

; Function Attrs: noinline nounwind optnone
define dso_local void @randombytes(ptr noundef %out, i32 noundef %outlen) #0 !dbg !28 {
entry:
    #dbg_value(ptr %out, !268, !DIExpression(), !269)
    #dbg_value(i32 %outlen, !270, !DIExpression(), !269)
  br label %while.cond, !dbg !271

while.cond:                                       ; preds = %if.end6, %if.then, %entry
  %0 = load i32, ptr @randombytes.fd, align 4, !dbg !272
  %cmp = icmp eq i32 %0, -1, !dbg !273
  br i1 %cmp, label %while.body, label %while.end, !dbg !271

while.body:                                       ; preds = %while.cond
  %call = call i32 (ptr, i32, ...) @open(ptr noundef @.str.6, i32 noundef 0) #2, !dbg !274
  store i32 %call, ptr @randombytes.fd, align 4, !dbg !276
  %1 = load i32, ptr @randombytes.fd, align 4, !dbg !277
  %cmp1 = icmp eq i32 %1, -1, !dbg !279
  br i1 %cmp1, label %land.lhs.true, label %if.else, !dbg !280

land.lhs.true:                                    ; preds = %while.body
  %call2 = call ptr @__errno() #2, !dbg !281
  %2 = load i32, ptr %call2, align 4, !dbg !281
  %cmp3 = icmp eq i32 %2, 4, !dbg !282
  br i1 %cmp3, label %if.then, label %if.else, !dbg !280

if.then:                                          ; preds = %land.lhs.true
  br label %while.cond, !dbg !283, !llvm.loop !284

if.else:                                          ; preds = %land.lhs.true, %while.body
  %3 = load i32, ptr @randombytes.fd, align 4, !dbg !286
  %cmp4 = icmp eq i32 %3, -1, !dbg !288
  br i1 %cmp4, label %if.then5, label %if.end, !dbg !288

if.then5:                                         ; preds = %if.else
  call void @abort() #2, !dbg !289
  br label %if.end, !dbg !289

if.end:                                           ; preds = %if.then5, %if.else
  br label %if.end6

if.end6:                                          ; preds = %if.end
  br label %while.cond, !dbg !271, !llvm.loop !284

while.end:                                        ; preds = %while.cond
  br label %while.cond7, !dbg !290

while.cond7:                                      ; preds = %if.end20, %if.then15, %while.end
  %outlen.addr.0 = phi i32 [ %outlen, %while.end ], [ %outlen.addr.0, %if.then15 ], [ %sub, %if.end20 ]
  %out.addr.0 = phi ptr [ %out, %while.end ], [ %out.addr.0, %if.then15 ], [ %add.ptr, %if.end20 ]
    #dbg_value(ptr %out.addr.0, !268, !DIExpression(), !269)
    #dbg_value(i32 %outlen.addr.0, !270, !DIExpression(), !269)
  %cmp8 = icmp ugt i32 %outlen.addr.0, 0, !dbg !291
  br i1 %cmp8, label %while.body9, label %while.end21, !dbg !290

while.body9:                                      ; preds = %while.cond7
  %4 = load i32, ptr @randombytes.fd, align 4, !dbg !292
  %call10 = call i32 @read(i32 noundef %4, ptr noundef %out.addr.0, i32 noundef %outlen.addr.0) #2, !dbg !294
    #dbg_value(i32 %call10, !295, !DIExpression(), !269)
  %cmp11 = icmp eq i32 %call10, -1, !dbg !300
  br i1 %cmp11, label %land.lhs.true12, label %if.else16, !dbg !302

land.lhs.true12:                                  ; preds = %while.body9
  %call13 = call ptr @__errno() #2, !dbg !303
  %5 = load i32, ptr %call13, align 4, !dbg !303
  %cmp14 = icmp eq i32 %5, 4, !dbg !304
  br i1 %cmp14, label %if.then15, label %if.else16, !dbg !302

if.then15:                                        ; preds = %land.lhs.true12
  br label %while.cond7, !dbg !305, !llvm.loop !306

if.else16:                                        ; preds = %land.lhs.true12, %while.body9
  %cmp17 = icmp eq i32 %call10, -1, !dbg !308
  br i1 %cmp17, label %if.then18, label %if.end19, !dbg !308

if.then18:                                        ; preds = %if.else16
  call void @abort() #2, !dbg !310
  br label %if.end19, !dbg !310

if.end19:                                         ; preds = %if.then18, %if.else16
  br label %if.end20

if.end20:                                         ; preds = %if.end19
  %add.ptr = getelementptr inbounds i8, ptr %out.addr.0, i32 %call10, !dbg !311
    #dbg_value(ptr %add.ptr, !268, !DIExpression(), !269)
  %sub = sub i32 %outlen.addr.0, %call10, !dbg !312
    #dbg_value(i32 %sub, !270, !DIExpression(), !269)
  br label %while.cond7, !dbg !290, !llvm.loop !306

while.end21:                                      ; preds = %while.cond7
  ret void, !dbg !313
}

declare dso_local i32 @open(ptr noundef, i32 noundef, ...) #1

declare dso_local ptr @__errno() #1

declare dso_local void @abort() #1

declare dso_local i32 @read(i32 noundef, ptr noundef, i32 noundef) #1

; Function Attrs: noinline nounwind optnone
define dso_local i32 @pqcrystals_kyber512_ref_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) #0 !dbg !314 {
entry:
    #dbg_value(ptr %pk, !320, !DIExpression(), !321)
    #dbg_value(ptr %sk, !322, !DIExpression(), !321)
    #dbg_value(ptr %coins, !323, !DIExpression(), !321)
  call void @pqcrystals_kyber512_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) #2, !dbg !324
  %add.ptr = getelementptr inbounds i8, ptr %sk, i32 768, !dbg !325
  %call = call ptr @memcpy(ptr noundef %add.ptr, ptr noundef %pk, i32 noundef 800) #2, !dbg !326
  %add.ptr1 = getelementptr inbounds i8, ptr %sk, i32 1632, !dbg !327
  %add.ptr2 = getelementptr inbounds i8, ptr %add.ptr1, i32 -64, !dbg !327
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef %add.ptr2, ptr noundef %pk, i32 noundef 800) #2, !dbg !327
  %add.ptr3 = getelementptr inbounds i8, ptr %sk, i32 1632, !dbg !328
  %add.ptr4 = getelementptr inbounds i8, ptr %add.ptr3, i32 -32, !dbg !329
  %add.ptr5 = getelementptr inbounds i8, ptr %coins, i32 32, !dbg !330
  %call6 = call ptr @memcpy(ptr noundef %add.ptr4, ptr noundef %add.ptr5, i32 noundef 32) #2, !dbg !331
  ret i32 0, !dbg !332
}

declare dso_local ptr @memcpy(ptr noundef, ptr noundef, i32 noundef) #1

; Function Attrs: noinline nounwind optnone
define dso_local i32 @pqcrystals_kyber512_ref_keypair(ptr noundef %pk, ptr noundef %sk) #0 !dbg !333 {
entry:
  %coins = alloca [64 x i8], align 1
    #dbg_value(ptr %pk, !336, !DIExpression(), !337)
    #dbg_value(ptr %sk, !338, !DIExpression(), !337)
    #dbg_declare(ptr %coins, !339, !DIExpression(), !343)
  %arraydecay = getelementptr inbounds [64 x i8], ptr %coins, i32 0, i32 0, !dbg !344
  call void @randombytes(ptr noundef %arraydecay, i32 noundef 64) #2, !dbg !345
  %arraydecay1 = getelementptr inbounds [64 x i8], ptr %coins, i32 0, i32 0, !dbg !346
  %call = call i32 @pqcrystals_kyber512_ref_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %arraydecay1) #2, !dbg !347
  ret i32 0, !dbg !348
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @pqcrystals_kyber512_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef %coins) #0 !dbg !349 {
entry:
  %buf = alloca [64 x i8], align 1
  %kr = alloca [64 x i8], align 1
    #dbg_value(ptr %ct, !352, !DIExpression(), !353)
    #dbg_value(ptr %ss, !354, !DIExpression(), !353)
    #dbg_value(ptr %pk, !355, !DIExpression(), !353)
    #dbg_value(ptr %coins, !356, !DIExpression(), !353)
    #dbg_declare(ptr %buf, !357, !DIExpression(), !358)
    #dbg_declare(ptr %kr, !359, !DIExpression(), !360)
  %arraydecay = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !361
  %call = call ptr @memcpy(ptr noundef %arraydecay, ptr noundef %coins, i32 noundef 32) #2, !dbg !362
  %arraydecay1 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !363
  %add.ptr = getelementptr inbounds i8, ptr %arraydecay1, i32 32, !dbg !363
  call void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef %add.ptr, ptr noundef %pk, i32 noundef 800) #2, !dbg !363
  %arraydecay2 = getelementptr inbounds [64 x i8], ptr %kr, i32 0, i32 0, !dbg !364
  %arraydecay3 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !364
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef %arraydecay2, ptr noundef %arraydecay3, i32 noundef 64) #2, !dbg !364
  %arraydecay4 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !365
  %arraydecay5 = getelementptr inbounds [64 x i8], ptr %kr, i32 0, i32 0, !dbg !366
  %add.ptr6 = getelementptr inbounds i8, ptr %arraydecay5, i32 32, !dbg !367
  call void @pqcrystals_kyber512_ref_indcpa_enc(ptr noundef %ct, ptr noundef %arraydecay4, ptr noundef %pk, ptr noundef %add.ptr6) #2, !dbg !368
  %arraydecay7 = getelementptr inbounds [64 x i8], ptr %kr, i32 0, i32 0, !dbg !369
  %call8 = call ptr @memcpy(ptr noundef %ss, ptr noundef %arraydecay7, i32 noundef 32) #2, !dbg !370
  ret i32 0, !dbg !371
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @pqcrystals_kyber512_ref_enc(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk) #0 !dbg !372 {
entry:
  %coins = alloca [32 x i8], align 1
    #dbg_value(ptr %ct, !373, !DIExpression(), !374)
    #dbg_value(ptr %ss, !375, !DIExpression(), !374)
    #dbg_value(ptr %pk, !376, !DIExpression(), !374)
    #dbg_declare(ptr %coins, !377, !DIExpression(), !378)
  %arraydecay = getelementptr inbounds [32 x i8], ptr %coins, i32 0, i32 0, !dbg !379
  call void @randombytes(ptr noundef %arraydecay, i32 noundef 32) #2, !dbg !380
  %arraydecay1 = getelementptr inbounds [32 x i8], ptr %coins, i32 0, i32 0, !dbg !381
  %call = call i32 @pqcrystals_kyber512_ref_enc_derand(ptr noundef %ct, ptr noundef %ss, ptr noundef %pk, ptr noundef %arraydecay1) #2, !dbg !382
  ret i32 0, !dbg !383
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @pqcrystals_kyber512_ref_dec(ptr noundef %ss, ptr noundef %ct, ptr noundef %sk) #0 !dbg !384 {
entry:
  %buf = alloca [64 x i8], align 1
  %kr = alloca [64 x i8], align 1
  %cmp = alloca [768 x i8], align 1
    #dbg_value(ptr %ss, !387, !DIExpression(), !388)
    #dbg_value(ptr %ct, !389, !DIExpression(), !388)
    #dbg_value(ptr %sk, !390, !DIExpression(), !388)
    #dbg_declare(ptr %buf, !391, !DIExpression(), !392)
    #dbg_declare(ptr %kr, !393, !DIExpression(), !394)
    #dbg_declare(ptr %cmp, !395, !DIExpression(), !396)
  %add.ptr = getelementptr inbounds i8, ptr %sk, i32 768, !dbg !397
    #dbg_value(ptr %add.ptr, !398, !DIExpression(), !388)
  %arraydecay = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !399
  call void @pqcrystals_kyber512_ref_indcpa_dec(ptr noundef %arraydecay, ptr noundef %ct, ptr noundef %sk) #2, !dbg !400
  %arraydecay1 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !401
  %add.ptr2 = getelementptr inbounds i8, ptr %arraydecay1, i32 32, !dbg !402
  %add.ptr3 = getelementptr inbounds i8, ptr %sk, i32 1632, !dbg !403
  %add.ptr4 = getelementptr inbounds i8, ptr %add.ptr3, i32 -64, !dbg !404
  %call = call ptr @memcpy(ptr noundef %add.ptr2, ptr noundef %add.ptr4, i32 noundef 32) #2, !dbg !405
  %arraydecay5 = getelementptr inbounds [64 x i8], ptr %kr, i32 0, i32 0, !dbg !406
  %arraydecay6 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !406
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef %arraydecay5, ptr noundef %arraydecay6, i32 noundef 64) #2, !dbg !406
  %arraydecay7 = getelementptr inbounds [768 x i8], ptr %cmp, i32 0, i32 0, !dbg !407
  %arraydecay8 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !408
  %arraydecay9 = getelementptr inbounds [64 x i8], ptr %kr, i32 0, i32 0, !dbg !409
  %add.ptr10 = getelementptr inbounds i8, ptr %arraydecay9, i32 32, !dbg !410
  call void @pqcrystals_kyber512_ref_indcpa_enc(ptr noundef %arraydecay7, ptr noundef %arraydecay8, ptr noundef %add.ptr, ptr noundef %add.ptr10) #2, !dbg !411
  %arraydecay11 = getelementptr inbounds [768 x i8], ptr %cmp, i32 0, i32 0, !dbg !412
  %call12 = call i32 @pqcrystals_kyber512_ref_verify(ptr noundef %ct, ptr noundef %arraydecay11, i32 noundef 768) #2, !dbg !413
    #dbg_value(i32 %call12, !414, !DIExpression(), !388)
  %add.ptr13 = getelementptr inbounds i8, ptr %sk, i32 1632, !dbg !415
  %add.ptr14 = getelementptr inbounds i8, ptr %add.ptr13, i32 -32, !dbg !415
  call void @pqcrystals_kyber512_ref_kyber_shake256_rkprf(ptr noundef %ss, ptr noundef %add.ptr14, ptr noundef %ct) #2, !dbg !415
  %arraydecay15 = getelementptr inbounds [64 x i8], ptr %kr, i32 0, i32 0, !dbg !416
  %tobool = icmp ne i32 %call12, 0, !dbg !417
  %lnot = xor i1 %tobool, true, !dbg !417
  %lnot.ext = zext i1 %lnot to i32, !dbg !417
  %conv = trunc i32 %lnot.ext to i8, !dbg !417
  call void @pqcrystals_kyber512_ref_cmov(ptr noundef %ss, ptr noundef %arraydecay15, i32 noundef 32, i8 noundef zeroext %conv) #2, !dbg !418
  ret i32 0, !dbg !419
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_gen_matrix(ptr noundef %a, ptr noundef %seed, i32 noundef %transposed) #0 !dbg !420 {
entry:
  %buf = alloca [504 x i8], align 1
  %state = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %a, !441, !DIExpression(), !442)
    #dbg_value(ptr %seed, !443, !DIExpression(), !442)
    #dbg_value(i32 %transposed, !444, !DIExpression(), !442)
    #dbg_declare(ptr %buf, !445, !DIExpression(), !449)
    #dbg_declare(ptr %state, !450, !DIExpression(), !462)
    #dbg_value(i32 0, !463, !DIExpression(), !442)
  br label %for.cond, !dbg !464

for.cond:                                         ; preds = %for.inc20, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc21, %for.inc20 ], !dbg !466
    #dbg_value(i32 %i.0, !463, !DIExpression(), !442)
  %cmp = icmp ult i32 %i.0, 2, !dbg !467
  br i1 %cmp, label %for.body, label %for.end22, !dbg !469

for.body:                                         ; preds = %for.cond
    #dbg_value(i32 0, !470, !DIExpression(), !442)
  br label %for.cond1, !dbg !471

for.cond1:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ], !dbg !474
    #dbg_value(i32 %j.0, !470, !DIExpression(), !442)
  %cmp2 = icmp ult i32 %j.0, 2, !dbg !475
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !477

for.body3:                                        ; preds = %for.cond1
  %tobool = icmp ne i32 %transposed, 0, !dbg !478
  br i1 %tobool, label %if.then, label %if.else, !dbg !478

if.then:                                          ; preds = %for.body3
  %conv = trunc i32 %i.0 to i8, !dbg !481
  %conv4 = trunc i32 %j.0 to i8, !dbg !481
  call void @pqcrystals_kyber512_ref_kyber_shake128_absorb(ptr noundef %state, ptr noundef %seed, i8 noundef zeroext %conv, i8 noundef zeroext %conv4) #2, !dbg !481
  br label %if.end, !dbg !481

if.else:                                          ; preds = %for.body3
  %conv5 = trunc i32 %j.0 to i8, !dbg !482
  %conv6 = trunc i32 %i.0 to i8, !dbg !482
  call void @pqcrystals_kyber512_ref_kyber_shake128_absorb(ptr noundef %state, ptr noundef %seed, i8 noundef zeroext %conv5, i8 noundef zeroext %conv6) #2, !dbg !482
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %arraydecay = getelementptr inbounds [504 x i8], ptr %buf, i32 0, i32 0, !dbg !483
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %arraydecay, i32 noundef 3, ptr noundef %state) #2, !dbg !483
    #dbg_value(i32 504, !484, !DIExpression(), !442)
  %arrayidx = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 %i.0, !dbg !485
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %arrayidx, i32 0, i32 0, !dbg !486
  %arrayidx7 = getelementptr inbounds nuw [2 x %struct.poly], ptr %vec, i32 0, i32 %j.0, !dbg !485
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %arrayidx7, i32 0, i32 0, !dbg !487
  %arraydecay8 = getelementptr inbounds [256 x i16], ptr %coeffs, i32 0, i32 0, !dbg !485
  %arraydecay9 = getelementptr inbounds [504 x i8], ptr %buf, i32 0, i32 0, !dbg !488
  %call = call i32 @rej_uniform(ptr noundef %arraydecay8, i32 noundef 256, ptr noundef %arraydecay9, i32 noundef 504) #2, !dbg !489
    #dbg_value(i32 %call, !490, !DIExpression(), !442)
  br label %while.cond, !dbg !491

while.cond:                                       ; preds = %while.body, %if.end
  %ctr.0 = phi i32 [ %call, %if.end ], [ %add, %while.body ], !dbg !492
    #dbg_value(i32 %ctr.0, !490, !DIExpression(), !442)
  %cmp10 = icmp ult i32 %ctr.0, 256, !dbg !493
  br i1 %cmp10, label %while.body, label %while.end, !dbg !491

while.body:                                       ; preds = %while.cond
  %arraydecay12 = getelementptr inbounds [504 x i8], ptr %buf, i32 0, i32 0, !dbg !494
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %arraydecay12, i32 noundef 1, ptr noundef %state) #2, !dbg !494
    #dbg_value(i32 168, !484, !DIExpression(), !442)
  %arrayidx13 = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 %i.0, !dbg !496
  %vec14 = getelementptr inbounds nuw %struct.polyvec, ptr %arrayidx13, i32 0, i32 0, !dbg !497
  %arrayidx15 = getelementptr inbounds nuw [2 x %struct.poly], ptr %vec14, i32 0, i32 %j.0, !dbg !496
  %coeffs16 = getelementptr inbounds nuw %struct.poly, ptr %arrayidx15, i32 0, i32 0, !dbg !498
  %arraydecay17 = getelementptr inbounds [256 x i16], ptr %coeffs16, i32 0, i32 0, !dbg !496
  %add.ptr = getelementptr inbounds nuw i16, ptr %arraydecay17, i32 %ctr.0, !dbg !499
  %sub = sub i32 256, %ctr.0, !dbg !500
  %arraydecay18 = getelementptr inbounds [504 x i8], ptr %buf, i32 0, i32 0, !dbg !501
  %call19 = call i32 @rej_uniform(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef %arraydecay18, i32 noundef 168) #2, !dbg !502
  %add = add i32 %ctr.0, %call19, !dbg !503
    #dbg_value(i32 %add, !490, !DIExpression(), !442)
  br label %while.cond, !dbg !491, !llvm.loop !504

while.end:                                        ; preds = %while.cond
  br label %for.inc, !dbg !506

for.inc:                                          ; preds = %while.end
  %inc = add i32 %j.0, 1, !dbg !507
    #dbg_value(i32 %inc, !470, !DIExpression(), !442)
  br label %for.cond1, !dbg !508, !llvm.loop !509

for.end:                                          ; preds = %for.cond1
  br label %for.inc20, !dbg !511

for.inc20:                                        ; preds = %for.end
  %inc21 = add i32 %i.0, 1, !dbg !512
    #dbg_value(i32 %inc21, !463, !DIExpression(), !442)
  br label %for.cond, !dbg !513, !llvm.loop !514

for.end22:                                        ; preds = %for.cond
  ret void, !dbg !516
}

; Function Attrs: noinline nounwind optnone
define internal i32 @rej_uniform(ptr noundef %r, i32 noundef %len, ptr noundef %buf, i32 noundef %buflen) #0 !dbg !517 {
entry:
    #dbg_value(ptr %r, !521, !DIExpression(), !522)
    #dbg_value(i32 %len, !523, !DIExpression(), !522)
    #dbg_value(ptr %buf, !524, !DIExpression(), !522)
    #dbg_value(i32 %buflen, !525, !DIExpression(), !522)
    #dbg_value(i32 0, !526, !DIExpression(), !522)
    #dbg_value(i32 0, !527, !DIExpression(), !522)
  br label %while.cond, !dbg !528

while.cond:                                       ; preds = %if.end33, %entry
  %ctr.0 = phi i32 [ 0, %entry ], [ %ctr.2, %if.end33 ], !dbg !522
  %pos.0 = phi i32 [ 0, %entry ], [ %add20, %if.end33 ], !dbg !522
    #dbg_value(i32 %pos.0, !526, !DIExpression(), !522)
    #dbg_value(i32 %ctr.0, !527, !DIExpression(), !522)
  %cmp = icmp ult i32 %ctr.0, %len, !dbg !529
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !530

land.rhs:                                         ; preds = %while.cond
  %add = add i32 %pos.0, 3, !dbg !531
  %cmp1 = icmp ule i32 %add, %buflen, !dbg !532
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %0 = phi i1 [ false, %while.cond ], [ %cmp1, %land.rhs ], !dbg !522
  br i1 %0, label %while.body, label %while.end, !dbg !528

while.body:                                       ; preds = %land.end
  %add2 = add i32 %pos.0, 0, !dbg !533
  %arrayidx = getelementptr inbounds nuw i8, ptr %buf, i32 %add2, !dbg !535
  %1 = load i8, ptr %arrayidx, align 1, !dbg !535
  %conv = zext i8 %1 to i32, !dbg !535
  %shr = ashr i32 %conv, 0, !dbg !536
  %add3 = add i32 %pos.0, 1, !dbg !537
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %buf, i32 %add3, !dbg !538
  %2 = load i8, ptr %arrayidx4, align 1, !dbg !538
  %conv5 = zext i8 %2 to i16, !dbg !539
  %conv6 = zext i16 %conv5 to i32, !dbg !539
  %shl = shl i32 %conv6, 8, !dbg !540
  %or = or i32 %shr, %shl, !dbg !541
  %and = and i32 %or, 4095, !dbg !542
  %conv7 = trunc i32 %and to i16, !dbg !543
    #dbg_value(i16 %conv7, !544, !DIExpression(), !522)
  %add8 = add i32 %pos.0, 1, !dbg !545
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %buf, i32 %add8, !dbg !546
  %3 = load i8, ptr %arrayidx9, align 1, !dbg !546
  %conv10 = zext i8 %3 to i32, !dbg !546
  %shr11 = ashr i32 %conv10, 4, !dbg !547
  %add12 = add i32 %pos.0, 2, !dbg !548
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %buf, i32 %add12, !dbg !549
  %4 = load i8, ptr %arrayidx13, align 1, !dbg !549
  %conv14 = zext i8 %4 to i16, !dbg !550
  %conv15 = zext i16 %conv14 to i32, !dbg !550
  %shl16 = shl i32 %conv15, 4, !dbg !551
  %or17 = or i32 %shr11, %shl16, !dbg !552
  %and18 = and i32 %or17, 4095, !dbg !553
  %conv19 = trunc i32 %and18 to i16, !dbg !554
    #dbg_value(i16 %conv19, !555, !DIExpression(), !522)
  %add20 = add i32 %pos.0, 3, !dbg !556
    #dbg_value(i32 %add20, !526, !DIExpression(), !522)
  %conv21 = zext i16 %conv7 to i32, !dbg !557
  %cmp22 = icmp slt i32 %conv21, 3329, !dbg !559
  br i1 %cmp22, label %if.then, label %if.end, !dbg !559

if.then:                                          ; preds = %while.body
  %inc = add i32 %ctr.0, 1, !dbg !560
    #dbg_value(i32 %inc, !527, !DIExpression(), !522)
  %arrayidx24 = getelementptr inbounds nuw i16, ptr %r, i32 %ctr.0, !dbg !561
  store i16 %conv7, ptr %arrayidx24, align 2, !dbg !562
  br label %if.end, !dbg !561

if.end:                                           ; preds = %if.then, %while.body
  %ctr.1 = phi i32 [ %inc, %if.then ], [ %ctr.0, %while.body ], !dbg !522
    #dbg_value(i32 %ctr.1, !527, !DIExpression(), !522)
  %cmp25 = icmp ult i32 %ctr.1, %len, !dbg !563
  br i1 %cmp25, label %land.lhs.true, label %if.end33, !dbg !565

land.lhs.true:                                    ; preds = %if.end
  %conv27 = zext i16 %conv19 to i32, !dbg !566
  %cmp28 = icmp slt i32 %conv27, 3329, !dbg !567
  br i1 %cmp28, label %if.then30, label %if.end33, !dbg !565

if.then30:                                        ; preds = %land.lhs.true
  %inc31 = add i32 %ctr.1, 1, !dbg !568
    #dbg_value(i32 %inc31, !527, !DIExpression(), !522)
  %arrayidx32 = getelementptr inbounds nuw i16, ptr %r, i32 %ctr.1, !dbg !569
  store i16 %conv19, ptr %arrayidx32, align 2, !dbg !570
  br label %if.end33, !dbg !569

if.end33:                                         ; preds = %if.then30, %land.lhs.true, %if.end
  %ctr.2 = phi i32 [ %inc31, %if.then30 ], [ %ctr.1, %land.lhs.true ], [ %ctr.1, %if.end ], !dbg !571
    #dbg_value(i32 %ctr.2, !527, !DIExpression(), !522)
  br label %while.cond, !dbg !528, !llvm.loop !572

while.end:                                        ; preds = %land.end
  ret i32 %ctr.0, !dbg !574
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_indcpa_keypair_derand(ptr noundef %pk, ptr noundef %sk, ptr noundef %coins) #0 !dbg !575 {
entry:
  %buf = alloca [64 x i8], align 1
  %a = alloca [2 x %struct.polyvec], align 2
  %e = alloca %struct.polyvec, align 2
  %pkpv = alloca %struct.polyvec, align 2
  %skpv = alloca %struct.polyvec, align 2
    #dbg_value(ptr %pk, !578, !DIExpression(), !579)
    #dbg_value(ptr %sk, !580, !DIExpression(), !579)
    #dbg_value(ptr %coins, !581, !DIExpression(), !579)
    #dbg_declare(ptr %buf, !582, !DIExpression(), !583)
  %arraydecay = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !584
    #dbg_value(ptr %arraydecay, !585, !DIExpression(), !579)
  %arraydecay1 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !586
  %add.ptr = getelementptr inbounds i8, ptr %arraydecay1, i32 32, !dbg !587
    #dbg_value(ptr %add.ptr, !588, !DIExpression(), !579)
    #dbg_value(i8 0, !589, !DIExpression(), !579)
    #dbg_declare(ptr %a, !590, !DIExpression(), !592)
    #dbg_declare(ptr %e, !593, !DIExpression(), !594)
    #dbg_declare(ptr %pkpv, !595, !DIExpression(), !596)
    #dbg_declare(ptr %skpv, !597, !DIExpression(), !598)
  %arraydecay2 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !599
  %call = call ptr @memcpy(ptr noundef %arraydecay2, ptr noundef %coins, i32 noundef 32) #2, !dbg !600
  %arrayidx = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 32, !dbg !601
  store i8 2, ptr %arrayidx, align 1, !dbg !602
  %arraydecay3 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !603
  %arraydecay4 = getelementptr inbounds [64 x i8], ptr %buf, i32 0, i32 0, !dbg !603
  call void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef %arraydecay3, ptr noundef %arraydecay4, i32 noundef 33) #2, !dbg !603
  %arraydecay5 = getelementptr inbounds [2 x %struct.polyvec], ptr %a, i32 0, i32 0, !dbg !604
  call void @pqcrystals_kyber512_ref_gen_matrix(ptr noundef %arraydecay5, ptr noundef %arraydecay, i32 noundef 0) #2, !dbg !604
    #dbg_value(i32 0, !605, !DIExpression(), !579)
  br label %for.cond, !dbg !606

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc7, %for.inc ], !dbg !608
  %nonce.0 = phi i8 [ 0, %entry ], [ %inc, %for.inc ], !dbg !579
    #dbg_value(i8 %nonce.0, !589, !DIExpression(), !579)
    #dbg_value(i32 %i.0, !605, !DIExpression(), !579)
  %cmp = icmp ult i32 %i.0, 2, !dbg !609
  br i1 %cmp, label %for.body, label %for.end, !dbg !611

for.body:                                         ; preds = %for.cond
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %skpv, i32 0, i32 0, !dbg !612
  %arrayidx6 = getelementptr inbounds nuw [2 x %struct.poly], ptr %vec, i32 0, i32 %i.0, !dbg !613
  %inc = add i8 %nonce.0, 1, !dbg !614
    #dbg_value(i8 %inc, !589, !DIExpression(), !579)
  call void @pqcrystals_kyber512_ref_poly_getnoise_eta1(ptr noundef %arrayidx6, ptr noundef %add.ptr, i8 noundef zeroext %nonce.0) #2, !dbg !615
  br label %for.inc, !dbg !615

for.inc:                                          ; preds = %for.body
  %inc7 = add i32 %i.0, 1, !dbg !616
    #dbg_value(i32 %inc7, !605, !DIExpression(), !579)
  br label %for.cond, !dbg !617, !llvm.loop !618

for.end:                                          ; preds = %for.cond
    #dbg_value(i32 0, !605, !DIExpression(), !579)
  br label %for.cond8, !dbg !620

for.cond8:                                        ; preds = %for.inc14, %for.end
  %i.1 = phi i32 [ 0, %for.end ], [ %inc15, %for.inc14 ], !dbg !622
  %nonce.1 = phi i8 [ %nonce.0, %for.end ], [ %inc13, %for.inc14 ], !dbg !579
    #dbg_value(i8 %nonce.1, !589, !DIExpression(), !579)
    #dbg_value(i32 %i.1, !605, !DIExpression(), !579)
  %cmp9 = icmp ult i32 %i.1, 2, !dbg !623
  br i1 %cmp9, label %for.body10, label %for.end16, !dbg !625

for.body10:                                       ; preds = %for.cond8
  %vec11 = getelementptr inbounds nuw %struct.polyvec, ptr %e, i32 0, i32 0, !dbg !626
  %arrayidx12 = getelementptr inbounds nuw [2 x %struct.poly], ptr %vec11, i32 0, i32 %i.1, !dbg !627
  %inc13 = add i8 %nonce.1, 1, !dbg !628
    #dbg_value(i8 %inc13, !589, !DIExpression(), !579)
  call void @pqcrystals_kyber512_ref_poly_getnoise_eta1(ptr noundef %arrayidx12, ptr noundef %add.ptr, i8 noundef zeroext %nonce.1) #2, !dbg !629
  br label %for.inc14, !dbg !629

for.inc14:                                        ; preds = %for.body10
  %inc15 = add i32 %i.1, 1, !dbg !630
    #dbg_value(i32 %inc15, !605, !DIExpression(), !579)
  br label %for.cond8, !dbg !631, !llvm.loop !632

for.end16:                                        ; preds = %for.cond8
  call void @pqcrystals_kyber512_ref_polyvec_ntt(ptr noundef %skpv) #2, !dbg !634
  call void @pqcrystals_kyber512_ref_polyvec_ntt(ptr noundef %e) #2, !dbg !635
    #dbg_value(i32 0, !605, !DIExpression(), !579)
  br label %for.cond17, !dbg !636

for.cond17:                                       ; preds = %for.inc25, %for.end16
  %i.2 = phi i32 [ 0, %for.end16 ], [ %inc26, %for.inc25 ], !dbg !638
    #dbg_value(i32 %i.2, !605, !DIExpression(), !579)
  %cmp18 = icmp ult i32 %i.2, 2, !dbg !639
  br i1 %cmp18, label %for.body19, label %for.end27, !dbg !641

for.body19:                                       ; preds = %for.cond17
  %vec20 = getelementptr inbounds nuw %struct.polyvec, ptr %pkpv, i32 0, i32 0, !dbg !642
  %arrayidx21 = getelementptr inbounds nuw [2 x %struct.poly], ptr %vec20, i32 0, i32 %i.2, !dbg !644
  %arrayidx22 = getelementptr inbounds nuw [2 x %struct.polyvec], ptr %a, i32 0, i32 %i.2, !dbg !645
  call void @pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery(ptr noundef %arrayidx21, ptr noundef %arrayidx22, ptr noundef %skpv) #2, !dbg !646
  %vec23 = getelementptr inbounds nuw %struct.polyvec, ptr %pkpv, i32 0, i32 0, !dbg !647
  %arrayidx24 = getelementptr inbounds nuw [2 x %struct.poly], ptr %vec23, i32 0, i32 %i.2, !dbg !648
  call void @pqcrystals_kyber512_ref_poly_tomont(ptr noundef %arrayidx24) #2, !dbg !649
  br label %for.inc25, !dbg !650

for.inc25:                                        ; preds = %for.body19
  %inc26 = add i32 %i.2, 1, !dbg !651
    #dbg_value(i32 %inc26, !605, !DIExpression(), !579)
  br label %for.cond17, !dbg !652, !llvm.loop !653

for.end27:                                        ; preds = %for.cond17
  call void @pqcrystals_kyber512_ref_polyvec_add(ptr noundef %pkpv, ptr noundef %pkpv, ptr noundef %e) #2, !dbg !655
  call void @pqcrystals_kyber512_ref_polyvec_reduce(ptr noundef %pkpv) #2, !dbg !656
  call void @pack_sk(ptr noundef %sk, ptr noundef %skpv) #2, !dbg !657
  call void @pack_pk(ptr noundef %pk, ptr noundef %pkpv, ptr noundef %arraydecay) #2, !dbg !658
  ret void, !dbg !659
}

; Function Attrs: noinline nounwind optnone
define internal void @pack_sk(ptr noundef %r, ptr noundef %sk) #0 !dbg !660 {
entry:
    #dbg_value(ptr %r, !663, !DIExpression(), !664)
    #dbg_value(ptr %sk, !665, !DIExpression(), !664)
  call void @pqcrystals_kyber512_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %sk) #2, !dbg !666
  ret void, !dbg !667
}

; Function Attrs: noinline nounwind optnone
define internal void @pack_pk(ptr noundef %r, ptr noundef %pk, ptr noundef %seed) #0 !dbg !668 {
entry:
    #dbg_value(ptr %r, !671, !DIExpression(), !672)
    #dbg_value(ptr %pk, !673, !DIExpression(), !672)
    #dbg_value(ptr %seed, !674, !DIExpression(), !672)
  call void @pqcrystals_kyber512_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %pk) #2, !dbg !675
  %add.ptr = getelementptr inbounds i8, ptr %r, i32 768, !dbg !676
  %call = call ptr @memcpy(ptr noundef %add.ptr, ptr noundef %seed, i32 noundef 32) #2, !dbg !677
  ret void, !dbg !678
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_indcpa_enc(ptr noundef %c, ptr noundef %m, ptr noundef %pk, ptr noundef %coins) #0 !dbg !679 {
entry:
  %seed = alloca [32 x i8], align 1
  %sp = alloca %struct.polyvec, align 2
  %pkpv = alloca %struct.polyvec, align 2
  %ep = alloca %struct.polyvec, align 2
  %at = alloca [2 x %struct.polyvec], align 2
  %b = alloca %struct.polyvec, align 2
  %v = alloca %struct.poly, align 2
  %k = alloca %struct.poly, align 2
  %epp = alloca %struct.poly, align 2
    #dbg_value(ptr %c, !682, !DIExpression(), !683)
    #dbg_value(ptr %m, !684, !DIExpression(), !683)
    #dbg_value(ptr %pk, !685, !DIExpression(), !683)
    #dbg_value(ptr %coins, !686, !DIExpression(), !683)
    #dbg_declare(ptr %seed, !687, !DIExpression(), !688)
    #dbg_value(i8 0, !689, !DIExpression(), !683)
    #dbg_declare(ptr %sp, !690, !DIExpression(), !691)
    #dbg_declare(ptr %pkpv, !692, !DIExpression(), !693)
    #dbg_declare(ptr %ep, !694, !DIExpression(), !695)
    #dbg_declare(ptr %at, !696, !DIExpression(), !697)
    #dbg_declare(ptr %b, !698, !DIExpression(), !699)
    #dbg_declare(ptr %v, !700, !DIExpression(), !701)
    #dbg_declare(ptr %k, !702, !DIExpression(), !703)
    #dbg_declare(ptr %epp, !704, !DIExpression(), !705)
  %arraydecay = getelementptr inbounds [32 x i8], ptr %seed, i32 0, i32 0, !dbg !706
  call void @unpack_pk(ptr noundef %pkpv, ptr noundef %arraydecay, ptr noundef %pk) #2, !dbg !707
  call void @pqcrystals_kyber512_ref_poly_frommsg(ptr noundef %k, ptr noundef %m) #2, !dbg !708
  %arraydecay1 = getelementptr inbounds [2 x %struct.polyvec], ptr %at, i32 0, i32 0, !dbg !709
  %arraydecay2 = getelementptr inbounds [32 x i8], ptr %seed, i32 0, i32 0, !dbg !709
  call void @pqcrystals_kyber512_ref_gen_matrix(ptr noundef %arraydecay1, ptr noundef %arraydecay2, i32 noundef 1) #2, !dbg !709
    #dbg_value(i32 0, !710, !DIExpression(), !683)
  br label %for.cond, !dbg !711

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc4, %for.inc ], !dbg !713
  %nonce.0 = phi i8 [ 0, %entry ], [ %inc, %for.inc ], !dbg !683
    #dbg_value(i8 %nonce.0, !689, !DIExpression(), !683)
    #dbg_value(i32 %i.0, !710, !DIExpression(), !683)
  %cmp = icmp ult i32 %i.0, 2, !dbg !714
  br i1 %cmp, label %for.body, label %for.end, !dbg !716

for.body:                                         ; preds = %for.cond
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %sp, i32 0, i32 0, !dbg !717
  %arraydecay3 = getelementptr inbounds [2 x %struct.poly], ptr %vec, i32 0, i32 0, !dbg !718
  %add.ptr = getelementptr inbounds nuw %struct.poly, ptr %arraydecay3, i32 %i.0, !dbg !719
  %inc = add i8 %nonce.0, 1, !dbg !720
    #dbg_value(i8 %inc, !689, !DIExpression(), !683)
  call void @pqcrystals_kyber512_ref_poly_getnoise_eta1(ptr noundef %add.ptr, ptr noundef %coins, i8 noundef zeroext %nonce.0) #2, !dbg !721
  br label %for.inc, !dbg !721

for.inc:                                          ; preds = %for.body
  %inc4 = add i32 %i.0, 1, !dbg !722
    #dbg_value(i32 %inc4, !710, !DIExpression(), !683)
  br label %for.cond, !dbg !723, !llvm.loop !724

for.end:                                          ; preds = %for.cond
    #dbg_value(i32 0, !710, !DIExpression(), !683)
  br label %for.cond5, !dbg !726

for.cond5:                                        ; preds = %for.inc12, %for.end
  %i.1 = phi i32 [ 0, %for.end ], [ %inc13, %for.inc12 ], !dbg !728
  %nonce.1 = phi i8 [ %nonce.0, %for.end ], [ %inc11, %for.inc12 ], !dbg !683
    #dbg_value(i8 %nonce.1, !689, !DIExpression(), !683)
    #dbg_value(i32 %i.1, !710, !DIExpression(), !683)
  %cmp6 = icmp ult i32 %i.1, 2, !dbg !729
  br i1 %cmp6, label %for.body7, label %for.end14, !dbg !731

for.body7:                                        ; preds = %for.cond5
  %vec8 = getelementptr inbounds nuw %struct.polyvec, ptr %ep, i32 0, i32 0, !dbg !732
  %arraydecay9 = getelementptr inbounds [2 x %struct.poly], ptr %vec8, i32 0, i32 0, !dbg !733
  %add.ptr10 = getelementptr inbounds nuw %struct.poly, ptr %arraydecay9, i32 %i.1, !dbg !734
  %inc11 = add i8 %nonce.1, 1, !dbg !735
    #dbg_value(i8 %inc11, !689, !DIExpression(), !683)
  call void @pqcrystals_kyber512_ref_poly_getnoise_eta2(ptr noundef %add.ptr10, ptr noundef %coins, i8 noundef zeroext %nonce.1) #2, !dbg !736
  br label %for.inc12, !dbg !736

for.inc12:                                        ; preds = %for.body7
  %inc13 = add i32 %i.1, 1, !dbg !737
    #dbg_value(i32 %inc13, !710, !DIExpression(), !683)
  br label %for.cond5, !dbg !738, !llvm.loop !739

for.end14:                                        ; preds = %for.cond5
  %inc15 = add i8 %nonce.1, 1, !dbg !741
    #dbg_value(i8 %inc15, !689, !DIExpression(), !683)
  call void @pqcrystals_kyber512_ref_poly_getnoise_eta2(ptr noundef %epp, ptr noundef %coins, i8 noundef zeroext %nonce.1) #2, !dbg !742
  call void @pqcrystals_kyber512_ref_polyvec_ntt(ptr noundef %sp) #2, !dbg !743
    #dbg_value(i32 0, !710, !DIExpression(), !683)
  br label %for.cond16, !dbg !744

for.cond16:                                       ; preds = %for.inc21, %for.end14
  %i.2 = phi i32 [ 0, %for.end14 ], [ %inc22, %for.inc21 ], !dbg !746
    #dbg_value(i32 %i.2, !710, !DIExpression(), !683)
  %cmp17 = icmp ult i32 %i.2, 2, !dbg !747
  br i1 %cmp17, label %for.body18, label %for.end23, !dbg !749

for.body18:                                       ; preds = %for.cond16
  %vec19 = getelementptr inbounds nuw %struct.polyvec, ptr %b, i32 0, i32 0, !dbg !750
  %arrayidx = getelementptr inbounds nuw [2 x %struct.poly], ptr %vec19, i32 0, i32 %i.2, !dbg !751
  %arrayidx20 = getelementptr inbounds nuw [2 x %struct.polyvec], ptr %at, i32 0, i32 %i.2, !dbg !752
  call void @pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery(ptr noundef %arrayidx, ptr noundef %arrayidx20, ptr noundef %sp) #2, !dbg !753
  br label %for.inc21, !dbg !753

for.inc21:                                        ; preds = %for.body18
  %inc22 = add i32 %i.2, 1, !dbg !754
    #dbg_value(i32 %inc22, !710, !DIExpression(), !683)
  br label %for.cond16, !dbg !755, !llvm.loop !756

for.end23:                                        ; preds = %for.cond16
  call void @pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery(ptr noundef %v, ptr noundef %pkpv, ptr noundef %sp) #2, !dbg !758
  call void @pqcrystals_kyber512_ref_polyvec_invntt_tomont(ptr noundef %b) #2, !dbg !759
  call void @pqcrystals_kyber512_ref_poly_invntt_tomont(ptr noundef %v) #2, !dbg !760
  call void @pqcrystals_kyber512_ref_polyvec_add(ptr noundef %b, ptr noundef %b, ptr noundef %ep) #2, !dbg !761
  call void @pqcrystals_kyber512_ref_poly_add(ptr noundef %v, ptr noundef %v, ptr noundef %epp) #2, !dbg !762
  call void @pqcrystals_kyber512_ref_poly_add(ptr noundef %v, ptr noundef %v, ptr noundef %k) #2, !dbg !763
  call void @pqcrystals_kyber512_ref_polyvec_reduce(ptr noundef %b) #2, !dbg !764
  call void @pqcrystals_kyber512_ref_poly_reduce(ptr noundef %v) #2, !dbg !765
  call void @pack_ciphertext(ptr noundef %c, ptr noundef %b, ptr noundef %v) #2, !dbg !766
  ret void, !dbg !767
}

; Function Attrs: noinline nounwind optnone
define internal void @unpack_pk(ptr noundef %pk, ptr noundef %seed, ptr noundef %packedpk) #0 !dbg !768 {
entry:
    #dbg_value(ptr %pk, !771, !DIExpression(), !772)
    #dbg_value(ptr %seed, !773, !DIExpression(), !772)
    #dbg_value(ptr %packedpk, !774, !DIExpression(), !772)
  call void @pqcrystals_kyber512_ref_polyvec_frombytes(ptr noundef %pk, ptr noundef %packedpk) #2, !dbg !775
  %add.ptr = getelementptr inbounds i8, ptr %packedpk, i32 768, !dbg !776
  %call = call ptr @memcpy(ptr noundef %seed, ptr noundef %add.ptr, i32 noundef 32) #2, !dbg !777
  ret void, !dbg !778
}

; Function Attrs: noinline nounwind optnone
define internal void @pack_ciphertext(ptr noundef %r, ptr noundef %b, ptr noundef %v) #0 !dbg !779 {
entry:
    #dbg_value(ptr %r, !783, !DIExpression(), !784)
    #dbg_value(ptr %b, !785, !DIExpression(), !784)
    #dbg_value(ptr %v, !786, !DIExpression(), !784)
  call void @pqcrystals_kyber512_ref_polyvec_compress(ptr noundef %r, ptr noundef %b) #2, !dbg !787
  %add.ptr = getelementptr inbounds i8, ptr %r, i32 640, !dbg !788
  call void @pqcrystals_kyber512_ref_poly_compress(ptr noundef %add.ptr, ptr noundef %v) #2, !dbg !789
  ret void, !dbg !790
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_indcpa_dec(ptr noundef %m, ptr noundef %c, ptr noundef %sk) #0 !dbg !791 {
entry:
  %b = alloca %struct.polyvec, align 2
  %skpv = alloca %struct.polyvec, align 2
  %v = alloca %struct.poly, align 2
  %mp = alloca %struct.poly, align 2
    #dbg_value(ptr %m, !794, !DIExpression(), !795)
    #dbg_value(ptr %c, !796, !DIExpression(), !795)
    #dbg_value(ptr %sk, !797, !DIExpression(), !795)
    #dbg_declare(ptr %b, !798, !DIExpression(), !799)
    #dbg_declare(ptr %skpv, !800, !DIExpression(), !801)
    #dbg_declare(ptr %v, !802, !DIExpression(), !803)
    #dbg_declare(ptr %mp, !804, !DIExpression(), !805)
  call void @unpack_ciphertext(ptr noundef %b, ptr noundef %v, ptr noundef %c) #2, !dbg !806
  call void @unpack_sk(ptr noundef %skpv, ptr noundef %sk) #2, !dbg !807
  call void @pqcrystals_kyber512_ref_polyvec_ntt(ptr noundef %b) #2, !dbg !808
  call void @pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery(ptr noundef %mp, ptr noundef %skpv, ptr noundef %b) #2, !dbg !809
  call void @pqcrystals_kyber512_ref_poly_invntt_tomont(ptr noundef %mp) #2, !dbg !810
  call void @pqcrystals_kyber512_ref_poly_sub(ptr noundef %mp, ptr noundef %v, ptr noundef %mp) #2, !dbg !811
  call void @pqcrystals_kyber512_ref_poly_reduce(ptr noundef %mp) #2, !dbg !812
  call void @pqcrystals_kyber512_ref_poly_tomsg(ptr noundef %m, ptr noundef %mp) #2, !dbg !813
  ret void, !dbg !814
}

; Function Attrs: noinline nounwind optnone
define internal void @unpack_ciphertext(ptr noundef %b, ptr noundef %v, ptr noundef %c) #0 !dbg !815 {
entry:
    #dbg_value(ptr %b, !818, !DIExpression(), !819)
    #dbg_value(ptr %v, !820, !DIExpression(), !819)
    #dbg_value(ptr %c, !821, !DIExpression(), !819)
  call void @pqcrystals_kyber512_ref_polyvec_decompress(ptr noundef %b, ptr noundef %c) #2, !dbg !822
  %add.ptr = getelementptr inbounds i8, ptr %c, i32 640, !dbg !823
  call void @pqcrystals_kyber512_ref_poly_decompress(ptr noundef %v, ptr noundef %add.ptr) #2, !dbg !824
  ret void, !dbg !825
}

; Function Attrs: noinline nounwind optnone
define internal void @unpack_sk(ptr noundef %sk, ptr noundef %packedsk) #0 !dbg !826 {
entry:
    #dbg_value(ptr %sk, !829, !DIExpression(), !830)
    #dbg_value(ptr %packedsk, !831, !DIExpression(), !830)
  call void @pqcrystals_kyber512_ref_polyvec_frombytes(ptr noundef %sk, ptr noundef %packedsk) #2, !dbg !832
  ret void, !dbg !833
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_polyvec_compress(ptr noundef %r, ptr noundef %a) #0 !dbg !834 {
entry:
  %t = alloca [4 x i16], align 2
    #dbg_value(ptr %r, !849, !DIExpression(), !850)
    #dbg_value(ptr %a, !851, !DIExpression(), !850)
    #dbg_declare(ptr %t, !852, !DIExpression(), !856)
    #dbg_value(i32 0, !857, !DIExpression(), !850)
  br label %for.cond, !dbg !858

for.cond:                                         ; preds = %for.inc61, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc62, %for.inc61 ], !dbg !860
  %r.addr.0 = phi ptr [ %r, %entry ], [ %r.addr.1, %for.inc61 ]
    #dbg_value(ptr %r.addr.0, !849, !DIExpression(), !850)
    #dbg_value(i32 %i.0, !857, !DIExpression(), !850)
  %cmp = icmp ult i32 %i.0, 2, !dbg !861
  br i1 %cmp, label %for.body, label %for.end63, !dbg !863

for.body:                                         ; preds = %for.cond
    #dbg_value(i32 0, !864, !DIExpression(), !850)
  br label %for.cond1, !dbg !865

for.cond1:                                        ; preds = %for.inc58, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc59, %for.inc58 ], !dbg !868
  %r.addr.1 = phi ptr [ %r.addr.0, %for.body ], [ %add.ptr, %for.inc58 ]
    #dbg_value(ptr %r.addr.1, !849, !DIExpression(), !850)
    #dbg_value(i32 %j.0, !864, !DIExpression(), !850)
  %cmp2 = icmp ult i32 %j.0, 64, !dbg !869
  br i1 %cmp2, label %for.body3, label %for.end60, !dbg !871

for.body3:                                        ; preds = %for.cond1
    #dbg_value(i32 0, !872, !DIExpression(), !850)
  br label %for.cond4, !dbg !873

for.cond4:                                        ; preds = %for.inc, %for.body3
  %k.0 = phi i32 [ 0, %for.body3 ], [ %inc, %for.inc ], !dbg !876
    #dbg_value(i32 %k.0, !872, !DIExpression(), !850)
  %cmp5 = icmp ult i32 %k.0, 4, !dbg !877
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !879

for.body6:                                        ; preds = %for.cond4
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 0, i32 0, !dbg !880
  %arrayidx = getelementptr inbounds nuw [2 x %struct.poly], ptr %vec, i32 0, i32 %i.0, !dbg !882
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %arrayidx, i32 0, i32 0, !dbg !883
  %mul = mul i32 4, %j.0, !dbg !884
  %add = add i32 %mul, %k.0, !dbg !885
  %arrayidx7 = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %add, !dbg !882
  %0 = load i16, ptr %arrayidx7, align 2, !dbg !882
  %arrayidx8 = getelementptr inbounds nuw [4 x i16], ptr %t, i32 0, i32 %k.0, !dbg !886
  store i16 %0, ptr %arrayidx8, align 2, !dbg !887
  %arrayidx9 = getelementptr inbounds nuw [4 x i16], ptr %t, i32 0, i32 %k.0, !dbg !888
  %1 = load i16, ptr %arrayidx9, align 2, !dbg !888
  %conv = sext i16 %1 to i32, !dbg !889
  %shr = ashr i32 %conv, 15, !dbg !890
  %and = and i32 %shr, 3329, !dbg !891
  %arrayidx10 = getelementptr inbounds nuw [4 x i16], ptr %t, i32 0, i32 %k.0, !dbg !892
  %2 = load i16, ptr %arrayidx10, align 2, !dbg !893
  %conv11 = zext i16 %2 to i32, !dbg !893
  %add12 = add nsw i32 %conv11, %and, !dbg !893
  %conv13 = trunc i32 %add12 to i16, !dbg !893
  store i16 %conv13, ptr %arrayidx10, align 2, !dbg !893
  %arrayidx14 = getelementptr inbounds nuw [4 x i16], ptr %t, i32 0, i32 %k.0, !dbg !894
  %3 = load i16, ptr %arrayidx14, align 2, !dbg !894
  %conv15 = zext i16 %3 to i64, !dbg !894
    #dbg_value(i64 %conv15, !895, !DIExpression(), !850)
  %shl = shl i64 %conv15, 10, !dbg !896
    #dbg_value(i64 %shl, !895, !DIExpression(), !850)
  %add16 = add i64 %shl, 1665, !dbg !897
    #dbg_value(i64 %add16, !895, !DIExpression(), !850)
  %mul17 = mul i64 %add16, 1290167, !dbg !898
    #dbg_value(i64 %mul17, !895, !DIExpression(), !850)
  %shr18 = lshr i64 %mul17, 32, !dbg !899
    #dbg_value(i64 %shr18, !895, !DIExpression(), !850)
  %and19 = and i64 %shr18, 1023, !dbg !900
  %conv20 = trunc i64 %and19 to i16, !dbg !901
  %arrayidx21 = getelementptr inbounds nuw [4 x i16], ptr %t, i32 0, i32 %k.0, !dbg !902
  store i16 %conv20, ptr %arrayidx21, align 2, !dbg !903
  br label %for.inc, !dbg !904

for.inc:                                          ; preds = %for.body6
  %inc = add i32 %k.0, 1, !dbg !905
    #dbg_value(i32 %inc, !872, !DIExpression(), !850)
  br label %for.cond4, !dbg !906, !llvm.loop !907

for.end:                                          ; preds = %for.cond4
  %arrayidx22 = getelementptr inbounds [4 x i16], ptr %t, i32 0, i32 0, !dbg !909
  %4 = load i16, ptr %arrayidx22, align 2, !dbg !909
  %conv23 = zext i16 %4 to i32, !dbg !909
  %shr24 = ashr i32 %conv23, 0, !dbg !910
  %conv25 = trunc i32 %shr24 to i8, !dbg !911
  %arrayidx26 = getelementptr inbounds i8, ptr %r.addr.1, i32 0, !dbg !912
  store i8 %conv25, ptr %arrayidx26, align 1, !dbg !913
  %arrayidx27 = getelementptr inbounds [4 x i16], ptr %t, i32 0, i32 0, !dbg !914
  %5 = load i16, ptr %arrayidx27, align 2, !dbg !914
  %conv28 = zext i16 %5 to i32, !dbg !914
  %shr29 = ashr i32 %conv28, 8, !dbg !915
  %arrayidx30 = getelementptr inbounds [4 x i16], ptr %t, i32 0, i32 1, !dbg !916
  %6 = load i16, ptr %arrayidx30, align 2, !dbg !916
  %conv31 = zext i16 %6 to i32, !dbg !916
  %shl32 = shl i32 %conv31, 2, !dbg !917
  %or = or i32 %shr29, %shl32, !dbg !918
  %conv33 = trunc i32 %or to i8, !dbg !919
  %arrayidx34 = getelementptr inbounds i8, ptr %r.addr.1, i32 1, !dbg !920
  store i8 %conv33, ptr %arrayidx34, align 1, !dbg !921
  %arrayidx35 = getelementptr inbounds [4 x i16], ptr %t, i32 0, i32 1, !dbg !922
  %7 = load i16, ptr %arrayidx35, align 2, !dbg !922
  %conv36 = zext i16 %7 to i32, !dbg !922
  %shr37 = ashr i32 %conv36, 6, !dbg !923
  %arrayidx38 = getelementptr inbounds [4 x i16], ptr %t, i32 0, i32 2, !dbg !924
  %8 = load i16, ptr %arrayidx38, align 2, !dbg !924
  %conv39 = zext i16 %8 to i32, !dbg !924
  %shl40 = shl i32 %conv39, 4, !dbg !925
  %or41 = or i32 %shr37, %shl40, !dbg !926
  %conv42 = trunc i32 %or41 to i8, !dbg !927
  %arrayidx43 = getelementptr inbounds i8, ptr %r.addr.1, i32 2, !dbg !928
  store i8 %conv42, ptr %arrayidx43, align 1, !dbg !929
  %arrayidx44 = getelementptr inbounds [4 x i16], ptr %t, i32 0, i32 2, !dbg !930
  %9 = load i16, ptr %arrayidx44, align 2, !dbg !930
  %conv45 = zext i16 %9 to i32, !dbg !930
  %shr46 = ashr i32 %conv45, 4, !dbg !931
  %arrayidx47 = getelementptr inbounds [4 x i16], ptr %t, i32 0, i32 3, !dbg !932
  %10 = load i16, ptr %arrayidx47, align 2, !dbg !932
  %conv48 = zext i16 %10 to i32, !dbg !932
  %shl49 = shl i32 %conv48, 6, !dbg !933
  %or50 = or i32 %shr46, %shl49, !dbg !934
  %conv51 = trunc i32 %or50 to i8, !dbg !935
  %arrayidx52 = getelementptr inbounds i8, ptr %r.addr.1, i32 3, !dbg !936
  store i8 %conv51, ptr %arrayidx52, align 1, !dbg !937
  %arrayidx53 = getelementptr inbounds [4 x i16], ptr %t, i32 0, i32 3, !dbg !938
  %11 = load i16, ptr %arrayidx53, align 2, !dbg !938
  %conv54 = zext i16 %11 to i32, !dbg !938
  %shr55 = ashr i32 %conv54, 2, !dbg !939
  %conv56 = trunc i32 %shr55 to i8, !dbg !940
  %arrayidx57 = getelementptr inbounds i8, ptr %r.addr.1, i32 4, !dbg !941
  store i8 %conv56, ptr %arrayidx57, align 1, !dbg !942
  %add.ptr = getelementptr inbounds i8, ptr %r.addr.1, i32 5, !dbg !943
    #dbg_value(ptr %add.ptr, !849, !DIExpression(), !850)
  br label %for.inc58, !dbg !944

for.inc58:                                        ; preds = %for.end
  %inc59 = add i32 %j.0, 1, !dbg !945
    #dbg_value(i32 %inc59, !864, !DIExpression(), !850)
  br label %for.cond1, !dbg !946, !llvm.loop !947

for.end60:                                        ; preds = %for.cond1
  br label %for.inc61, !dbg !949

for.inc61:                                        ; preds = %for.end60
  %inc62 = add i32 %i.0, 1, !dbg !950
    #dbg_value(i32 %inc62, !857, !DIExpression(), !850)
  br label %for.cond, !dbg !951, !llvm.loop !952

for.end63:                                        ; preds = %for.cond
  ret void, !dbg !954
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_polyvec_decompress(ptr noundef %r, ptr noundef %a) #0 !dbg !955 {
entry:
  %t = alloca [4 x i16], align 2
    #dbg_value(ptr %r, !959, !DIExpression(), !960)
    #dbg_value(ptr %a, !961, !DIExpression(), !960)
    #dbg_declare(ptr %t, !962, !DIExpression(), !963)
    #dbg_value(i32 0, !964, !DIExpression(), !960)
  br label %for.cond, !dbg !965

for.cond:                                         ; preds = %for.inc54, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc55, %for.inc54 ], !dbg !967
  %a.addr.0 = phi ptr [ %a, %entry ], [ %a.addr.1, %for.inc54 ]
    #dbg_value(ptr %a.addr.0, !961, !DIExpression(), !960)
    #dbg_value(i32 %i.0, !964, !DIExpression(), !960)
  %cmp = icmp ult i32 %i.0, 2, !dbg !968
  br i1 %cmp, label %for.body, label %for.end56, !dbg !970

for.body:                                         ; preds = %for.cond
    #dbg_value(i32 0, !971, !DIExpression(), !960)
  br label %for.cond1, !dbg !972

for.cond1:                                        ; preds = %for.inc51, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc52, %for.inc51 ], !dbg !975
  %a.addr.1 = phi ptr [ %a.addr.0, %for.body ], [ %add.ptr, %for.inc51 ]
    #dbg_value(ptr %a.addr.1, !961, !DIExpression(), !960)
    #dbg_value(i32 %j.0, !971, !DIExpression(), !960)
  %cmp2 = icmp ult i32 %j.0, 64, !dbg !976
  br i1 %cmp2, label %for.body3, label %for.end53, !dbg !978

for.body3:                                        ; preds = %for.cond1
  %arrayidx = getelementptr inbounds i8, ptr %a.addr.1, i32 0, !dbg !979
  %0 = load i8, ptr %arrayidx, align 1, !dbg !979
  %conv = zext i8 %0 to i32, !dbg !979
  %shr = ashr i32 %conv, 0, !dbg !981
  %arrayidx4 = getelementptr inbounds i8, ptr %a.addr.1, i32 1, !dbg !982
  %1 = load i8, ptr %arrayidx4, align 1, !dbg !982
  %conv5 = zext i8 %1 to i16, !dbg !983
  %conv6 = zext i16 %conv5 to i32, !dbg !983
  %shl = shl i32 %conv6, 8, !dbg !984
  %or = or i32 %shr, %shl, !dbg !985
  %conv7 = trunc i32 %or to i16, !dbg !986
  %arrayidx8 = getelementptr inbounds [4 x i16], ptr %t, i32 0, i32 0, !dbg !987
  store i16 %conv7, ptr %arrayidx8, align 2, !dbg !988
  %arrayidx9 = getelementptr inbounds i8, ptr %a.addr.1, i32 1, !dbg !989
  %2 = load i8, ptr %arrayidx9, align 1, !dbg !989
  %conv10 = zext i8 %2 to i32, !dbg !989
  %shr11 = ashr i32 %conv10, 2, !dbg !990
  %arrayidx12 = getelementptr inbounds i8, ptr %a.addr.1, i32 2, !dbg !991
  %3 = load i8, ptr %arrayidx12, align 1, !dbg !991
  %conv13 = zext i8 %3 to i16, !dbg !992
  %conv14 = zext i16 %conv13 to i32, !dbg !992
  %shl15 = shl i32 %conv14, 6, !dbg !993
  %or16 = or i32 %shr11, %shl15, !dbg !994
  %conv17 = trunc i32 %or16 to i16, !dbg !995
  %arrayidx18 = getelementptr inbounds [4 x i16], ptr %t, i32 0, i32 1, !dbg !996
  store i16 %conv17, ptr %arrayidx18, align 2, !dbg !997
  %arrayidx19 = getelementptr inbounds i8, ptr %a.addr.1, i32 2, !dbg !998
  %4 = load i8, ptr %arrayidx19, align 1, !dbg !998
  %conv20 = zext i8 %4 to i32, !dbg !998
  %shr21 = ashr i32 %conv20, 4, !dbg !999
  %arrayidx22 = getelementptr inbounds i8, ptr %a.addr.1, i32 3, !dbg !1000
  %5 = load i8, ptr %arrayidx22, align 1, !dbg !1000
  %conv23 = zext i8 %5 to i16, !dbg !1001
  %conv24 = zext i16 %conv23 to i32, !dbg !1001
  %shl25 = shl i32 %conv24, 4, !dbg !1002
  %or26 = or i32 %shr21, %shl25, !dbg !1003
  %conv27 = trunc i32 %or26 to i16, !dbg !1004
  %arrayidx28 = getelementptr inbounds [4 x i16], ptr %t, i32 0, i32 2, !dbg !1005
  store i16 %conv27, ptr %arrayidx28, align 2, !dbg !1006
  %arrayidx29 = getelementptr inbounds i8, ptr %a.addr.1, i32 3, !dbg !1007
  %6 = load i8, ptr %arrayidx29, align 1, !dbg !1007
  %conv30 = zext i8 %6 to i32, !dbg !1007
  %shr31 = ashr i32 %conv30, 6, !dbg !1008
  %arrayidx32 = getelementptr inbounds i8, ptr %a.addr.1, i32 4, !dbg !1009
  %7 = load i8, ptr %arrayidx32, align 1, !dbg !1009
  %conv33 = zext i8 %7 to i16, !dbg !1010
  %conv34 = zext i16 %conv33 to i32, !dbg !1010
  %shl35 = shl i32 %conv34, 2, !dbg !1011
  %or36 = or i32 %shr31, %shl35, !dbg !1012
  %conv37 = trunc i32 %or36 to i16, !dbg !1013
  %arrayidx38 = getelementptr inbounds [4 x i16], ptr %t, i32 0, i32 3, !dbg !1014
  store i16 %conv37, ptr %arrayidx38, align 2, !dbg !1015
  %add.ptr = getelementptr inbounds i8, ptr %a.addr.1, i32 5, !dbg !1016
    #dbg_value(ptr %add.ptr, !961, !DIExpression(), !960)
    #dbg_value(i32 0, !1017, !DIExpression(), !960)
  br label %for.cond39, !dbg !1018

for.cond39:                                       ; preds = %for.inc, %for.body3
  %k.0 = phi i32 [ 0, %for.body3 ], [ %inc, %for.inc ], !dbg !1020
    #dbg_value(i32 %k.0, !1017, !DIExpression(), !960)
  %cmp40 = icmp ult i32 %k.0, 4, !dbg !1021
  br i1 %cmp40, label %for.body42, label %for.end, !dbg !1023

for.body42:                                       ; preds = %for.cond39
  %arrayidx43 = getelementptr inbounds nuw [4 x i16], ptr %t, i32 0, i32 %k.0, !dbg !1024
  %8 = load i16, ptr %arrayidx43, align 2, !dbg !1024
  %conv44 = zext i16 %8 to i32, !dbg !1024
  %and = and i32 %conv44, 1023, !dbg !1025
  %mul = mul i32 %and, 3329, !dbg !1026
  %add = add i32 %mul, 512, !dbg !1027
  %shr45 = lshr i32 %add, 10, !dbg !1028
  %conv46 = trunc i32 %shr45 to i16, !dbg !1029
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %r, i32 0, i32 0, !dbg !1030
  %arrayidx47 = getelementptr inbounds nuw [2 x %struct.poly], ptr %vec, i32 0, i32 %i.0, !dbg !1031
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %arrayidx47, i32 0, i32 0, !dbg !1032
  %mul48 = mul i32 4, %j.0, !dbg !1033
  %add49 = add i32 %mul48, %k.0, !dbg !1034
  %arrayidx50 = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %add49, !dbg !1031
  store i16 %conv46, ptr %arrayidx50, align 2, !dbg !1035
  br label %for.inc, !dbg !1031

for.inc:                                          ; preds = %for.body42
  %inc = add i32 %k.0, 1, !dbg !1036
    #dbg_value(i32 %inc, !1017, !DIExpression(), !960)
  br label %for.cond39, !dbg !1037, !llvm.loop !1038

for.end:                                          ; preds = %for.cond39
  br label %for.inc51, !dbg !1040

for.inc51:                                        ; preds = %for.end
  %inc52 = add i32 %j.0, 1, !dbg !1041
    #dbg_value(i32 %inc52, !971, !DIExpression(), !960)
  br label %for.cond1, !dbg !1042, !llvm.loop !1043

for.end53:                                        ; preds = %for.cond1
  br label %for.inc54, !dbg !1045

for.inc54:                                        ; preds = %for.end53
  %inc55 = add i32 %i.0, 1, !dbg !1046
    #dbg_value(i32 %inc55, !964, !DIExpression(), !960)
  br label %for.cond, !dbg !1047, !llvm.loop !1048

for.end56:                                        ; preds = %for.cond
  ret void, !dbg !1050
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_polyvec_tobytes(ptr noundef %r, ptr noundef %a) #0 !dbg !1051 {
entry:
    #dbg_value(ptr %r, !1052, !DIExpression(), !1053)
    #dbg_value(ptr %a, !1054, !DIExpression(), !1053)
    #dbg_value(i32 0, !1055, !DIExpression(), !1053)
  br label %for.cond, !dbg !1056

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1058
    #dbg_value(i32 %i.0, !1055, !DIExpression(), !1053)
  %cmp = icmp ult i32 %i.0, 2, !dbg !1059
  br i1 %cmp, label %for.body, label %for.end, !dbg !1061

for.body:                                         ; preds = %for.cond
  %mul = mul i32 %i.0, 384, !dbg !1062
  %add.ptr = getelementptr inbounds nuw i8, ptr %r, i32 %mul, !dbg !1063
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 0, i32 0, !dbg !1064
  %arrayidx = getelementptr inbounds nuw [2 x %struct.poly], ptr %vec, i32 0, i32 %i.0, !dbg !1065
  call void @pqcrystals_kyber512_ref_poly_tobytes(ptr noundef %add.ptr, ptr noundef %arrayidx) #2, !dbg !1066
  br label %for.inc, !dbg !1066

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1067
    #dbg_value(i32 %inc, !1055, !DIExpression(), !1053)
  br label %for.cond, !dbg !1068, !llvm.loop !1069

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1071
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_polyvec_frombytes(ptr noundef %r, ptr noundef %a) #0 !dbg !1072 {
entry:
    #dbg_value(ptr %r, !1073, !DIExpression(), !1074)
    #dbg_value(ptr %a, !1075, !DIExpression(), !1074)
    #dbg_value(i32 0, !1076, !DIExpression(), !1074)
  br label %for.cond, !dbg !1077

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1079
    #dbg_value(i32 %i.0, !1076, !DIExpression(), !1074)
  %cmp = icmp ult i32 %i.0, 2, !dbg !1080
  br i1 %cmp, label %for.body, label %for.end, !dbg !1082

for.body:                                         ; preds = %for.cond
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %r, i32 0, i32 0, !dbg !1083
  %arrayidx = getelementptr inbounds nuw [2 x %struct.poly], ptr %vec, i32 0, i32 %i.0, !dbg !1084
  %mul = mul i32 %i.0, 384, !dbg !1085
  %add.ptr = getelementptr inbounds nuw i8, ptr %a, i32 %mul, !dbg !1086
  call void @pqcrystals_kyber512_ref_poly_frombytes(ptr noundef %arrayidx, ptr noundef %add.ptr) #2, !dbg !1087
  br label %for.inc, !dbg !1087

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1088
    #dbg_value(i32 %inc, !1076, !DIExpression(), !1074)
  br label %for.cond, !dbg !1089, !llvm.loop !1090

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1092
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_polyvec_ntt(ptr noundef %r) #0 !dbg !1093 {
entry:
    #dbg_value(ptr %r, !1096, !DIExpression(), !1097)
    #dbg_value(i32 0, !1098, !DIExpression(), !1097)
  br label %for.cond, !dbg !1099

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1101
    #dbg_value(i32 %i.0, !1098, !DIExpression(), !1097)
  %cmp = icmp ult i32 %i.0, 2, !dbg !1102
  br i1 %cmp, label %for.body, label %for.end, !dbg !1104

for.body:                                         ; preds = %for.cond
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %r, i32 0, i32 0, !dbg !1105
  %arrayidx = getelementptr inbounds nuw [2 x %struct.poly], ptr %vec, i32 0, i32 %i.0, !dbg !1106
  call void @pqcrystals_kyber512_ref_poly_ntt(ptr noundef %arrayidx) #2, !dbg !1107
  br label %for.inc, !dbg !1107

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1108
    #dbg_value(i32 %inc, !1098, !DIExpression(), !1097)
  br label %for.cond, !dbg !1109, !llvm.loop !1110

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1112
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_polyvec_invntt_tomont(ptr noundef %r) #0 !dbg !1113 {
entry:
    #dbg_value(ptr %r, !1114, !DIExpression(), !1115)
    #dbg_value(i32 0, !1116, !DIExpression(), !1115)
  br label %for.cond, !dbg !1117

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1119
    #dbg_value(i32 %i.0, !1116, !DIExpression(), !1115)
  %cmp = icmp ult i32 %i.0, 2, !dbg !1120
  br i1 %cmp, label %for.body, label %for.end, !dbg !1122

for.body:                                         ; preds = %for.cond
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %r, i32 0, i32 0, !dbg !1123
  %arrayidx = getelementptr inbounds nuw [2 x %struct.poly], ptr %vec, i32 0, i32 %i.0, !dbg !1124
  call void @pqcrystals_kyber512_ref_poly_invntt_tomont(ptr noundef %arrayidx) #2, !dbg !1125
  br label %for.inc, !dbg !1125

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1126
    #dbg_value(i32 %inc, !1116, !DIExpression(), !1115)
  br label %for.cond, !dbg !1127, !llvm.loop !1128

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1130
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) #0 !dbg !1131 {
entry:
  %t = alloca %struct.poly, align 2
    #dbg_value(ptr %r, !1135, !DIExpression(), !1136)
    #dbg_value(ptr %a, !1137, !DIExpression(), !1136)
    #dbg_value(ptr %b, !1138, !DIExpression(), !1136)
    #dbg_declare(ptr %t, !1139, !DIExpression(), !1140)
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 0, i32 0, !dbg !1141
  %arrayidx = getelementptr inbounds [2 x %struct.poly], ptr %vec, i32 0, i32 0, !dbg !1142
  %vec1 = getelementptr inbounds nuw %struct.polyvec, ptr %b, i32 0, i32 0, !dbg !1143
  %arrayidx2 = getelementptr inbounds [2 x %struct.poly], ptr %vec1, i32 0, i32 0, !dbg !1144
  call void @pqcrystals_kyber512_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %arrayidx, ptr noundef %arrayidx2) #2, !dbg !1145
    #dbg_value(i32 1, !1146, !DIExpression(), !1136)
  br label %for.cond, !dbg !1147

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 1, %entry ], [ %inc, %for.inc ], !dbg !1149
    #dbg_value(i32 %i.0, !1146, !DIExpression(), !1136)
  %cmp = icmp ult i32 %i.0, 2, !dbg !1150
  br i1 %cmp, label %for.body, label %for.end, !dbg !1152

for.body:                                         ; preds = %for.cond
  %vec3 = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 0, i32 0, !dbg !1153
  %arrayidx4 = getelementptr inbounds nuw [2 x %struct.poly], ptr %vec3, i32 0, i32 %i.0, !dbg !1155
  %vec5 = getelementptr inbounds nuw %struct.polyvec, ptr %b, i32 0, i32 0, !dbg !1156
  %arrayidx6 = getelementptr inbounds nuw [2 x %struct.poly], ptr %vec5, i32 0, i32 %i.0, !dbg !1157
  call void @pqcrystals_kyber512_ref_poly_basemul_montgomery(ptr noundef %t, ptr noundef %arrayidx4, ptr noundef %arrayidx6) #2, !dbg !1158
  call void @pqcrystals_kyber512_ref_poly_add(ptr noundef %r, ptr noundef %r, ptr noundef %t) #2, !dbg !1159
  br label %for.inc, !dbg !1160

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1161
    #dbg_value(i32 %inc, !1146, !DIExpression(), !1136)
  br label %for.cond, !dbg !1162, !llvm.loop !1163

for.end:                                          ; preds = %for.cond
  call void @pqcrystals_kyber512_ref_poly_reduce(ptr noundef %r) #2, !dbg !1165
  ret void, !dbg !1166
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_polyvec_reduce(ptr noundef %r) #0 !dbg !1167 {
entry:
    #dbg_value(ptr %r, !1168, !DIExpression(), !1169)
    #dbg_value(i32 0, !1170, !DIExpression(), !1169)
  br label %for.cond, !dbg !1171

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1173
    #dbg_value(i32 %i.0, !1170, !DIExpression(), !1169)
  %cmp = icmp ult i32 %i.0, 2, !dbg !1174
  br i1 %cmp, label %for.body, label %for.end, !dbg !1176

for.body:                                         ; preds = %for.cond
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %r, i32 0, i32 0, !dbg !1177
  %arrayidx = getelementptr inbounds nuw [2 x %struct.poly], ptr %vec, i32 0, i32 %i.0, !dbg !1178
  call void @pqcrystals_kyber512_ref_poly_reduce(ptr noundef %arrayidx) #2, !dbg !1179
  br label %for.inc, !dbg !1179

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1180
    #dbg_value(i32 %inc, !1170, !DIExpression(), !1169)
  br label %for.cond, !dbg !1181, !llvm.loop !1182

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1184
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_polyvec_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) #0 !dbg !1185 {
entry:
    #dbg_value(ptr %r, !1188, !DIExpression(), !1189)
    #dbg_value(ptr %a, !1190, !DIExpression(), !1189)
    #dbg_value(ptr %b, !1191, !DIExpression(), !1189)
    #dbg_value(i32 0, !1192, !DIExpression(), !1189)
  br label %for.cond, !dbg !1193

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1195
    #dbg_value(i32 %i.0, !1192, !DIExpression(), !1189)
  %cmp = icmp ult i32 %i.0, 2, !dbg !1196
  br i1 %cmp, label %for.body, label %for.end, !dbg !1198

for.body:                                         ; preds = %for.cond
  %vec = getelementptr inbounds nuw %struct.polyvec, ptr %r, i32 0, i32 0, !dbg !1199
  %arrayidx = getelementptr inbounds nuw [2 x %struct.poly], ptr %vec, i32 0, i32 %i.0, !dbg !1200
  %vec1 = getelementptr inbounds nuw %struct.polyvec, ptr %a, i32 0, i32 0, !dbg !1201
  %arrayidx2 = getelementptr inbounds nuw [2 x %struct.poly], ptr %vec1, i32 0, i32 %i.0, !dbg !1202
  %vec3 = getelementptr inbounds nuw %struct.polyvec, ptr %b, i32 0, i32 0, !dbg !1203
  %arrayidx4 = getelementptr inbounds nuw [2 x %struct.poly], ptr %vec3, i32 0, i32 %i.0, !dbg !1204
  call void @pqcrystals_kyber512_ref_poly_add(ptr noundef %arrayidx, ptr noundef %arrayidx2, ptr noundef %arrayidx4) #2, !dbg !1205
  br label %for.inc, !dbg !1205

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1206
    #dbg_value(i32 %inc, !1192, !DIExpression(), !1189)
  br label %for.cond, !dbg !1207, !llvm.loop !1208

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1210
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_poly_compress(ptr noundef %r, ptr noundef %a) #0 !dbg !1211 {
entry:
  %t = alloca [8 x i8], align 1
    #dbg_value(ptr %r, !1221, !DIExpression(), !1222)
    #dbg_value(ptr %a, !1223, !DIExpression(), !1222)
    #dbg_declare(ptr %t, !1224, !DIExpression(), !1228)
    #dbg_value(i32 0, !1229, !DIExpression(), !1222)
  br label %for.cond, !dbg !1230

for.cond:                                         ; preds = %for.inc45, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc46, %for.inc45 ], !dbg !1232
  %r.addr.0 = phi ptr [ %r, %entry ], [ %add.ptr, %for.inc45 ]
    #dbg_value(ptr %r.addr.0, !1221, !DIExpression(), !1222)
    #dbg_value(i32 %i.0, !1229, !DIExpression(), !1222)
  %cmp = icmp ult i32 %i.0, 32, !dbg !1233
  br i1 %cmp, label %for.body, label %for.end47, !dbg !1235

for.body:                                         ; preds = %for.cond
    #dbg_value(i32 0, !1236, !DIExpression(), !1222)
  br label %for.cond1, !dbg !1237

for.cond1:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ], !dbg !1240
    #dbg_value(i32 %j.0, !1236, !DIExpression(), !1222)
  %cmp2 = icmp ult i32 %j.0, 8, !dbg !1241
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !1243

for.body3:                                        ; preds = %for.cond1
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %a, i32 0, i32 0, !dbg !1244
  %mul = mul i32 8, %i.0, !dbg !1246
  %add = add i32 %mul, %j.0, !dbg !1247
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %add, !dbg !1248
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1248
    #dbg_value(i16 %0, !1249, !DIExpression(), !1222)
  %conv = sext i16 %0 to i32, !dbg !1250
  %shr = ashr i32 %conv, 15, !dbg !1251
  %and = and i32 %shr, 3329, !dbg !1252
  %conv4 = sext i16 %0 to i32, !dbg !1253
  %add5 = add nsw i32 %conv4, %and, !dbg !1253
  %conv6 = trunc i32 %add5 to i16, !dbg !1253
    #dbg_value(i16 %conv6, !1249, !DIExpression(), !1222)
  %conv7 = sext i16 %conv6 to i32, !dbg !1254
  %shl = shl i32 %conv7, 4, !dbg !1255
    #dbg_value(i32 %shl, !1256, !DIExpression(), !1222)
  %add8 = add i32 %shl, 1665, !dbg !1257
    #dbg_value(i32 %add8, !1256, !DIExpression(), !1222)
  %mul9 = mul i32 %add8, 80635, !dbg !1258
    #dbg_value(i32 %mul9, !1256, !DIExpression(), !1222)
  %shr10 = lshr i32 %mul9, 28, !dbg !1259
    #dbg_value(i32 %shr10, !1256, !DIExpression(), !1222)
  %and11 = and i32 %shr10, 15, !dbg !1260
  %conv12 = trunc i32 %and11 to i8, !dbg !1261
  %arrayidx13 = getelementptr inbounds nuw [8 x i8], ptr %t, i32 0, i32 %j.0, !dbg !1262
  store i8 %conv12, ptr %arrayidx13, align 1, !dbg !1263
  br label %for.inc, !dbg !1264

for.inc:                                          ; preds = %for.body3
  %inc = add i32 %j.0, 1, !dbg !1265
    #dbg_value(i32 %inc, !1236, !DIExpression(), !1222)
  br label %for.cond1, !dbg !1266, !llvm.loop !1267

for.end:                                          ; preds = %for.cond1
  %arrayidx14 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 0, !dbg !1269
  %1 = load i8, ptr %arrayidx14, align 1, !dbg !1269
  %conv15 = zext i8 %1 to i32, !dbg !1269
  %arrayidx16 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 1, !dbg !1270
  %2 = load i8, ptr %arrayidx16, align 1, !dbg !1270
  %conv17 = zext i8 %2 to i32, !dbg !1270
  %shl18 = shl i32 %conv17, 4, !dbg !1271
  %or = or i32 %conv15, %shl18, !dbg !1272
  %conv19 = trunc i32 %or to i8, !dbg !1269
  %arrayidx20 = getelementptr inbounds i8, ptr %r.addr.0, i32 0, !dbg !1273
  store i8 %conv19, ptr %arrayidx20, align 1, !dbg !1274
  %arrayidx21 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 2, !dbg !1275
  %3 = load i8, ptr %arrayidx21, align 1, !dbg !1275
  %conv22 = zext i8 %3 to i32, !dbg !1275
  %arrayidx23 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 3, !dbg !1276
  %4 = load i8, ptr %arrayidx23, align 1, !dbg !1276
  %conv24 = zext i8 %4 to i32, !dbg !1276
  %shl25 = shl i32 %conv24, 4, !dbg !1277
  %or26 = or i32 %conv22, %shl25, !dbg !1278
  %conv27 = trunc i32 %or26 to i8, !dbg !1275
  %arrayidx28 = getelementptr inbounds i8, ptr %r.addr.0, i32 1, !dbg !1279
  store i8 %conv27, ptr %arrayidx28, align 1, !dbg !1280
  %arrayidx29 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 4, !dbg !1281
  %5 = load i8, ptr %arrayidx29, align 1, !dbg !1281
  %conv30 = zext i8 %5 to i32, !dbg !1281
  %arrayidx31 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 5, !dbg !1282
  %6 = load i8, ptr %arrayidx31, align 1, !dbg !1282
  %conv32 = zext i8 %6 to i32, !dbg !1282
  %shl33 = shl i32 %conv32, 4, !dbg !1283
  %or34 = or i32 %conv30, %shl33, !dbg !1284
  %conv35 = trunc i32 %or34 to i8, !dbg !1281
  %arrayidx36 = getelementptr inbounds i8, ptr %r.addr.0, i32 2, !dbg !1285
  store i8 %conv35, ptr %arrayidx36, align 1, !dbg !1286
  %arrayidx37 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 6, !dbg !1287
  %7 = load i8, ptr %arrayidx37, align 1, !dbg !1287
  %conv38 = zext i8 %7 to i32, !dbg !1287
  %arrayidx39 = getelementptr inbounds [8 x i8], ptr %t, i32 0, i32 7, !dbg !1288
  %8 = load i8, ptr %arrayidx39, align 1, !dbg !1288
  %conv40 = zext i8 %8 to i32, !dbg !1288
  %shl41 = shl i32 %conv40, 4, !dbg !1289
  %or42 = or i32 %conv38, %shl41, !dbg !1290
  %conv43 = trunc i32 %or42 to i8, !dbg !1287
  %arrayidx44 = getelementptr inbounds i8, ptr %r.addr.0, i32 3, !dbg !1291
  store i8 %conv43, ptr %arrayidx44, align 1, !dbg !1292
  %add.ptr = getelementptr inbounds i8, ptr %r.addr.0, i32 4, !dbg !1293
    #dbg_value(ptr %add.ptr, !1221, !DIExpression(), !1222)
  br label %for.inc45, !dbg !1294

for.inc45:                                        ; preds = %for.end
  %inc46 = add i32 %i.0, 1, !dbg !1295
    #dbg_value(i32 %inc46, !1229, !DIExpression(), !1222)
  br label %for.cond, !dbg !1296, !llvm.loop !1297

for.end47:                                        ; preds = %for.cond
  ret void, !dbg !1299
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_poly_decompress(ptr noundef %r, ptr noundef %a) #0 !dbg !1300 {
entry:
    #dbg_value(ptr %r, !1304, !DIExpression(), !1305)
    #dbg_value(ptr %a, !1306, !DIExpression(), !1305)
    #dbg_value(i32 0, !1307, !DIExpression(), !1305)
  br label %for.cond, !dbg !1308

for.cond:                                         ; preds = %for.inc, %entry
  %a.addr.0 = phi ptr [ %a, %entry ], [ %add.ptr, %for.inc ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1310
    #dbg_value(i32 %i.0, !1307, !DIExpression(), !1305)
    #dbg_value(ptr %a.addr.0, !1306, !DIExpression(), !1305)
  %cmp = icmp ult i32 %i.0, 128, !dbg !1311
  br i1 %cmp, label %for.body, label %for.end, !dbg !1313

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds i8, ptr %a.addr.0, i32 0, !dbg !1314
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1314
  %conv = zext i8 %0 to i32, !dbg !1314
  %and = and i32 %conv, 15, !dbg !1316
  %conv1 = trunc i32 %and to i16, !dbg !1317
  %conv2 = zext i16 %conv1 to i32, !dbg !1317
  %mul = mul nsw i32 %conv2, 3329, !dbg !1318
  %add = add nsw i32 %mul, 8, !dbg !1319
  %shr = ashr i32 %add, 4, !dbg !1320
  %conv3 = trunc i32 %shr to i16, !dbg !1321
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1322
  %mul4 = mul i32 2, %i.0, !dbg !1323
  %add5 = add i32 %mul4, 0, !dbg !1324
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %add5, !dbg !1325
  store i16 %conv3, ptr %arrayidx6, align 2, !dbg !1326
  %arrayidx7 = getelementptr inbounds i8, ptr %a.addr.0, i32 0, !dbg !1327
  %1 = load i8, ptr %arrayidx7, align 1, !dbg !1327
  %conv8 = zext i8 %1 to i32, !dbg !1327
  %shr9 = ashr i32 %conv8, 4, !dbg !1328
  %conv10 = trunc i32 %shr9 to i16, !dbg !1329
  %conv11 = zext i16 %conv10 to i32, !dbg !1329
  %mul12 = mul nsw i32 %conv11, 3329, !dbg !1330
  %add13 = add nsw i32 %mul12, 8, !dbg !1331
  %shr14 = ashr i32 %add13, 4, !dbg !1332
  %conv15 = trunc i32 %shr14 to i16, !dbg !1333
  %coeffs16 = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1334
  %mul17 = mul i32 2, %i.0, !dbg !1335
  %add18 = add i32 %mul17, 1, !dbg !1336
  %arrayidx19 = getelementptr inbounds nuw [256 x i16], ptr %coeffs16, i32 0, i32 %add18, !dbg !1337
  store i16 %conv15, ptr %arrayidx19, align 2, !dbg !1338
  %add.ptr = getelementptr inbounds i8, ptr %a.addr.0, i32 1, !dbg !1339
    #dbg_value(ptr %add.ptr, !1306, !DIExpression(), !1305)
  br label %for.inc, !dbg !1340

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1341
    #dbg_value(i32 %inc, !1307, !DIExpression(), !1305)
  br label %for.cond, !dbg !1342, !llvm.loop !1343

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1345
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_poly_tobytes(ptr noundef %r, ptr noundef %a) #0 !dbg !1346 {
entry:
    #dbg_value(ptr %r, !1347, !DIExpression(), !1348)
    #dbg_value(ptr %a, !1349, !DIExpression(), !1348)
    #dbg_value(i32 0, !1350, !DIExpression(), !1348)
  br label %for.cond, !dbg !1351

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1353
    #dbg_value(i32 %i.0, !1350, !DIExpression(), !1348)
  %cmp = icmp ult i32 %i.0, 128, !dbg !1354
  br i1 %cmp, label %for.body, label %for.end, !dbg !1356

for.body:                                         ; preds = %for.cond
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %a, i32 0, i32 0, !dbg !1357
  %mul = mul i32 2, %i.0, !dbg !1359
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %mul, !dbg !1360
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1360
    #dbg_value(i16 %0, !1361, !DIExpression(), !1348)
  %conv = sext i16 %0 to i32, !dbg !1362
  %shr = ashr i32 %conv, 15, !dbg !1363
  %and = and i32 %shr, 3329, !dbg !1364
  %conv1 = zext i16 %0 to i32, !dbg !1365
  %add = add nsw i32 %conv1, %and, !dbg !1365
  %conv2 = trunc i32 %add to i16, !dbg !1365
    #dbg_value(i16 %conv2, !1361, !DIExpression(), !1348)
  %coeffs3 = getelementptr inbounds nuw %struct.poly, ptr %a, i32 0, i32 0, !dbg !1366
  %mul4 = mul i32 2, %i.0, !dbg !1367
  %add5 = add i32 %mul4, 1, !dbg !1368
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %coeffs3, i32 0, i32 %add5, !dbg !1369
  %1 = load i16, ptr %arrayidx6, align 2, !dbg !1369
    #dbg_value(i16 %1, !1370, !DIExpression(), !1348)
  %conv7 = sext i16 %1 to i32, !dbg !1371
  %shr8 = ashr i32 %conv7, 15, !dbg !1372
  %and9 = and i32 %shr8, 3329, !dbg !1373
  %conv10 = zext i16 %1 to i32, !dbg !1374
  %add11 = add nsw i32 %conv10, %and9, !dbg !1374
  %conv12 = trunc i32 %add11 to i16, !dbg !1374
    #dbg_value(i16 %conv12, !1370, !DIExpression(), !1348)
  %conv13 = zext i16 %conv2 to i32, !dbg !1375
  %shr14 = ashr i32 %conv13, 0, !dbg !1376
  %conv15 = trunc i32 %shr14 to i8, !dbg !1377
  %mul16 = mul i32 3, %i.0, !dbg !1378
  %add17 = add i32 %mul16, 0, !dbg !1379
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %r, i32 %add17, !dbg !1380
  store i8 %conv15, ptr %arrayidx18, align 1, !dbg !1381
  %conv19 = zext i16 %conv2 to i32, !dbg !1382
  %shr20 = ashr i32 %conv19, 8, !dbg !1383
  %conv21 = zext i16 %conv12 to i32, !dbg !1384
  %shl = shl i32 %conv21, 4, !dbg !1385
  %or = or i32 %shr20, %shl, !dbg !1386
  %conv22 = trunc i32 %or to i8, !dbg !1387
  %mul23 = mul i32 3, %i.0, !dbg !1388
  %add24 = add i32 %mul23, 1, !dbg !1389
  %arrayidx25 = getelementptr inbounds nuw i8, ptr %r, i32 %add24, !dbg !1390
  store i8 %conv22, ptr %arrayidx25, align 1, !dbg !1391
  %conv26 = zext i16 %conv12 to i32, !dbg !1392
  %shr27 = ashr i32 %conv26, 4, !dbg !1393
  %conv28 = trunc i32 %shr27 to i8, !dbg !1394
  %mul29 = mul i32 3, %i.0, !dbg !1395
  %add30 = add i32 %mul29, 2, !dbg !1396
  %arrayidx31 = getelementptr inbounds nuw i8, ptr %r, i32 %add30, !dbg !1397
  store i8 %conv28, ptr %arrayidx31, align 1, !dbg !1398
  br label %for.inc, !dbg !1399

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1400
    #dbg_value(i32 %inc, !1350, !DIExpression(), !1348)
  br label %for.cond, !dbg !1401, !llvm.loop !1402

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1404
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_poly_frombytes(ptr noundef %r, ptr noundef %a) #0 !dbg !1405 {
entry:
    #dbg_value(ptr %r, !1406, !DIExpression(), !1407)
    #dbg_value(ptr %a, !1408, !DIExpression(), !1407)
    #dbg_value(i32 0, !1409, !DIExpression(), !1407)
  br label %for.cond, !dbg !1410

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1412
    #dbg_value(i32 %i.0, !1409, !DIExpression(), !1407)
  %cmp = icmp ult i32 %i.0, 128, !dbg !1413
  br i1 %cmp, label %for.body, label %for.end, !dbg !1415

for.body:                                         ; preds = %for.cond
  %mul = mul i32 3, %i.0, !dbg !1416
  %add = add i32 %mul, 0, !dbg !1418
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %add, !dbg !1419
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1419
  %conv = zext i8 %0 to i32, !dbg !1419
  %shr = ashr i32 %conv, 0, !dbg !1420
  %mul1 = mul i32 3, %i.0, !dbg !1421
  %add2 = add i32 %mul1, 1, !dbg !1422
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %a, i32 %add2, !dbg !1423
  %1 = load i8, ptr %arrayidx3, align 1, !dbg !1423
  %conv4 = zext i8 %1 to i16, !dbg !1424
  %conv5 = zext i16 %conv4 to i32, !dbg !1424
  %shl = shl i32 %conv5, 8, !dbg !1425
  %or = or i32 %shr, %shl, !dbg !1426
  %and = and i32 %or, 4095, !dbg !1427
  %conv6 = trunc i32 %and to i16, !dbg !1428
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1429
  %mul7 = mul i32 2, %i.0, !dbg !1430
  %arrayidx8 = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %mul7, !dbg !1431
  store i16 %conv6, ptr %arrayidx8, align 2, !dbg !1432
  %mul9 = mul i32 3, %i.0, !dbg !1433
  %add10 = add i32 %mul9, 1, !dbg !1434
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %a, i32 %add10, !dbg !1435
  %2 = load i8, ptr %arrayidx11, align 1, !dbg !1435
  %conv12 = zext i8 %2 to i32, !dbg !1435
  %shr13 = ashr i32 %conv12, 4, !dbg !1436
  %mul14 = mul i32 3, %i.0, !dbg !1437
  %add15 = add i32 %mul14, 2, !dbg !1438
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %a, i32 %add15, !dbg !1439
  %3 = load i8, ptr %arrayidx16, align 1, !dbg !1439
  %conv17 = zext i8 %3 to i16, !dbg !1440
  %conv18 = zext i16 %conv17 to i32, !dbg !1440
  %shl19 = shl i32 %conv18, 4, !dbg !1441
  %or20 = or i32 %shr13, %shl19, !dbg !1442
  %and21 = and i32 %or20, 4095, !dbg !1443
  %conv22 = trunc i32 %and21 to i16, !dbg !1444
  %coeffs23 = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1445
  %mul24 = mul i32 2, %i.0, !dbg !1446
  %add25 = add i32 %mul24, 1, !dbg !1447
  %arrayidx26 = getelementptr inbounds nuw [256 x i16], ptr %coeffs23, i32 0, i32 %add25, !dbg !1448
  store i16 %conv22, ptr %arrayidx26, align 2, !dbg !1449
  br label %for.inc, !dbg !1450

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1451
    #dbg_value(i32 %inc, !1409, !DIExpression(), !1407)
  br label %for.cond, !dbg !1452, !llvm.loop !1453

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1455
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_poly_frommsg(ptr noundef %r, ptr noundef %msg) #0 !dbg !1456 {
entry:
    #dbg_value(ptr %r, !1457, !DIExpression(), !1458)
    #dbg_value(ptr %msg, !1459, !DIExpression(), !1458)
    #dbg_value(i32 0, !1460, !DIExpression(), !1458)
  br label %for.cond, !dbg !1461

for.cond:                                         ; preds = %for.inc9, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc10, %for.inc9 ], !dbg !1463
    #dbg_value(i32 %i.0, !1460, !DIExpression(), !1458)
  %cmp = icmp ult i32 %i.0, 32, !dbg !1464
  br i1 %cmp, label %for.body, label %for.end11, !dbg !1466

for.body:                                         ; preds = %for.cond
    #dbg_value(i32 0, !1467, !DIExpression(), !1458)
  br label %for.cond1, !dbg !1468

for.cond1:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ], !dbg !1471
    #dbg_value(i32 %j.0, !1467, !DIExpression(), !1458)
  %cmp2 = icmp ult i32 %j.0, 8, !dbg !1472
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !1474

for.body3:                                        ; preds = %for.cond1
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1475
  %mul = mul i32 8, %i.0, !dbg !1477
  %add = add i32 %mul, %j.0, !dbg !1478
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %add, !dbg !1479
  store i16 0, ptr %arrayidx, align 2, !dbg !1480
  %coeffs4 = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1481
  %arraydecay = getelementptr inbounds [256 x i16], ptr %coeffs4, i32 0, i32 0, !dbg !1482
  %mul5 = mul i32 8, %i.0, !dbg !1483
  %add.ptr = getelementptr inbounds nuw i16, ptr %arraydecay, i32 %mul5, !dbg !1484
  %add.ptr6 = getelementptr inbounds nuw i16, ptr %add.ptr, i32 %j.0, !dbg !1485
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1486
  %0 = load i8, ptr %arrayidx7, align 1, !dbg !1486
  %conv = zext i8 %0 to i32, !dbg !1486
  %shr = ashr i32 %conv, %j.0, !dbg !1487
  %and = and i32 %shr, 1, !dbg !1488
  %conv8 = trunc i32 %and to i16, !dbg !1489
  call void @pqcrystals_kyber512_ref_cmov_int16(ptr noundef %add.ptr6, i16 noundef signext 1665, i16 noundef zeroext %conv8) #2, !dbg !1490
  br label %for.inc, !dbg !1491

for.inc:                                          ; preds = %for.body3
  %inc = add i32 %j.0, 1, !dbg !1492
    #dbg_value(i32 %inc, !1467, !DIExpression(), !1458)
  br label %for.cond1, !dbg !1493, !llvm.loop !1494

for.end:                                          ; preds = %for.cond1
  br label %for.inc9, !dbg !1496

for.inc9:                                         ; preds = %for.end
  %inc10 = add i32 %i.0, 1, !dbg !1497
    #dbg_value(i32 %inc10, !1460, !DIExpression(), !1458)
  br label %for.cond, !dbg !1498, !llvm.loop !1499

for.end11:                                        ; preds = %for.cond
  ret void, !dbg !1501
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_poly_tomsg(ptr noundef %msg, ptr noundef %a) #0 !dbg !1502 {
entry:
    #dbg_value(ptr %msg, !1503, !DIExpression(), !1504)
    #dbg_value(ptr %a, !1505, !DIExpression(), !1504)
    #dbg_value(i32 0, !1506, !DIExpression(), !1504)
  br label %for.cond, !dbg !1507

for.cond:                                         ; preds = %for.inc11, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc12, %for.inc11 ], !dbg !1509
    #dbg_value(i32 %i.0, !1506, !DIExpression(), !1504)
  %cmp = icmp ult i32 %i.0, 32, !dbg !1510
  br i1 %cmp, label %for.body, label %for.end13, !dbg !1512

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1513
  store i8 0, ptr %arrayidx, align 1, !dbg !1515
    #dbg_value(i32 0, !1516, !DIExpression(), !1504)
  br label %for.cond1, !dbg !1517

for.cond1:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ], !dbg !1519
    #dbg_value(i32 %j.0, !1516, !DIExpression(), !1504)
  %cmp2 = icmp ult i32 %j.0, 8, !dbg !1520
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !1522

for.body3:                                        ; preds = %for.cond1
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %a, i32 0, i32 0, !dbg !1523
  %mul = mul i32 8, %i.0, !dbg !1525
  %add = add i32 %mul, %j.0, !dbg !1526
  %arrayidx4 = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %add, !dbg !1527
  %0 = load i16, ptr %arrayidx4, align 2, !dbg !1527
  %conv = sext i16 %0 to i32, !dbg !1527
    #dbg_value(i32 %conv, !1528, !DIExpression(), !1504)
  %shl = shl i32 %conv, 1, !dbg !1529
    #dbg_value(i32 %shl, !1528, !DIExpression(), !1504)
  %add5 = add i32 %shl, 1665, !dbg !1530
    #dbg_value(i32 %add5, !1528, !DIExpression(), !1504)
  %mul6 = mul i32 %add5, 80635, !dbg !1531
    #dbg_value(i32 %mul6, !1528, !DIExpression(), !1504)
  %shr = lshr i32 %mul6, 28, !dbg !1532
    #dbg_value(i32 %shr, !1528, !DIExpression(), !1504)
  %and = and i32 %shr, 1, !dbg !1533
    #dbg_value(i32 %and, !1528, !DIExpression(), !1504)
  %shl7 = shl i32 %and, %j.0, !dbg !1534
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %msg, i32 %i.0, !dbg !1535
  %1 = load i8, ptr %arrayidx8, align 1, !dbg !1536
  %conv9 = zext i8 %1 to i32, !dbg !1536
  %or = or i32 %conv9, %shl7, !dbg !1536
  %conv10 = trunc i32 %or to i8, !dbg !1536
  store i8 %conv10, ptr %arrayidx8, align 1, !dbg !1536
  br label %for.inc, !dbg !1537

for.inc:                                          ; preds = %for.body3
  %inc = add i32 %j.0, 1, !dbg !1538
    #dbg_value(i32 %inc, !1516, !DIExpression(), !1504)
  br label %for.cond1, !dbg !1539, !llvm.loop !1540

for.end:                                          ; preds = %for.cond1
  br label %for.inc11, !dbg !1542

for.inc11:                                        ; preds = %for.end
  %inc12 = add i32 %i.0, 1, !dbg !1543
    #dbg_value(i32 %inc12, !1506, !DIExpression(), !1504)
  br label %for.cond, !dbg !1544, !llvm.loop !1545

for.end13:                                        ; preds = %for.cond
  ret void, !dbg !1547
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_poly_getnoise_eta1(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) #0 !dbg !1548 {
entry:
  %buf = alloca [192 x i8], align 1
    #dbg_value(ptr %r, !1551, !DIExpression(), !1552)
    #dbg_value(ptr %seed, !1553, !DIExpression(), !1552)
    #dbg_value(i8 %nonce, !1554, !DIExpression(), !1552)
    #dbg_declare(ptr %buf, !1555, !DIExpression(), !1559)
  %arraydecay = getelementptr inbounds [192 x i8], ptr %buf, i32 0, i32 0, !dbg !1560
  call void @pqcrystals_kyber512_ref_kyber_shake256_prf(ptr noundef %arraydecay, i32 noundef 192, ptr noundef %seed, i8 noundef zeroext %nonce) #2, !dbg !1560
  %arraydecay1 = getelementptr inbounds [192 x i8], ptr %buf, i32 0, i32 0, !dbg !1561
  call void @pqcrystals_kyber512_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef %arraydecay1) #2, !dbg !1562
  ret void, !dbg !1563
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_poly_getnoise_eta2(ptr noundef %r, ptr noundef %seed, i8 noundef zeroext %nonce) #0 !dbg !1564 {
entry:
  %buf = alloca [128 x i8], align 1
    #dbg_value(ptr %r, !1565, !DIExpression(), !1566)
    #dbg_value(ptr %seed, !1567, !DIExpression(), !1566)
    #dbg_value(i8 %nonce, !1568, !DIExpression(), !1566)
    #dbg_declare(ptr %buf, !1569, !DIExpression(), !1571)
  %arraydecay = getelementptr inbounds [128 x i8], ptr %buf, i32 0, i32 0, !dbg !1572
  call void @pqcrystals_kyber512_ref_kyber_shake256_prf(ptr noundef %arraydecay, i32 noundef 128, ptr noundef %seed, i8 noundef zeroext %nonce) #2, !dbg !1572
  %arraydecay1 = getelementptr inbounds [128 x i8], ptr %buf, i32 0, i32 0, !dbg !1573
  call void @pqcrystals_kyber512_ref_poly_cbd_eta2(ptr noundef %r, ptr noundef %arraydecay1) #2, !dbg !1574
  ret void, !dbg !1575
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_poly_ntt(ptr noundef %r) #0 !dbg !1576 {
entry:
    #dbg_value(ptr %r, !1579, !DIExpression(), !1580)
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1581
  %arraydecay = getelementptr inbounds [256 x i16], ptr %coeffs, i32 0, i32 0, !dbg !1582
  call void @pqcrystals_kyber512_ref_ntt(ptr noundef %arraydecay) #2, !dbg !1583
  call void @pqcrystals_kyber512_ref_poly_reduce(ptr noundef %r) #2, !dbg !1584
  ret void, !dbg !1585
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_poly_reduce(ptr noundef %r) #0 !dbg !1586 {
entry:
    #dbg_value(ptr %r, !1587, !DIExpression(), !1588)
    #dbg_value(i32 0, !1589, !DIExpression(), !1588)
  br label %for.cond, !dbg !1590

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1592
    #dbg_value(i32 %i.0, !1589, !DIExpression(), !1588)
  %cmp = icmp ult i32 %i.0, 256, !dbg !1593
  br i1 %cmp, label %for.body, label %for.end, !dbg !1595

for.body:                                         ; preds = %for.cond
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1596
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %i.0, !dbg !1597
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1597
  %call = call signext i16 @pqcrystals_kyber512_ref_barrett_reduce(i16 noundef signext %0) #2, !dbg !1598
  %coeffs1 = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1599
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %coeffs1, i32 0, i32 %i.0, !dbg !1600
  store i16 %call, ptr %arrayidx2, align 2, !dbg !1601
  br label %for.inc, !dbg !1600

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1602
    #dbg_value(i32 %inc, !1589, !DIExpression(), !1588)
  br label %for.cond, !dbg !1603, !llvm.loop !1604

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1606
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_poly_invntt_tomont(ptr noundef %r) #0 !dbg !1607 {
entry:
    #dbg_value(ptr %r, !1608, !DIExpression(), !1609)
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1610
  %arraydecay = getelementptr inbounds [256 x i16], ptr %coeffs, i32 0, i32 0, !dbg !1611
  call void @pqcrystals_kyber512_ref_invntt(ptr noundef %arraydecay) #2, !dbg !1612
  ret void, !dbg !1613
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_poly_basemul_montgomery(ptr noundef %r, ptr noundef %a, ptr noundef %b) #0 !dbg !1614 {
entry:
    #dbg_value(ptr %r, !1617, !DIExpression(), !1618)
    #dbg_value(ptr %a, !1619, !DIExpression(), !1618)
    #dbg_value(ptr %b, !1620, !DIExpression(), !1618)
    #dbg_value(i32 0, !1621, !DIExpression(), !1618)
  br label %for.cond, !dbg !1622

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1624
    #dbg_value(i32 %i.0, !1621, !DIExpression(), !1618)
  %cmp = icmp ult i32 %i.0, 64, !dbg !1625
  br i1 %cmp, label %for.body, label %for.end, !dbg !1627

for.body:                                         ; preds = %for.cond
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1628
  %mul = mul i32 4, %i.0, !dbg !1630
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %mul, !dbg !1631
  %coeffs1 = getelementptr inbounds nuw %struct.poly, ptr %a, i32 0, i32 0, !dbg !1632
  %mul2 = mul i32 4, %i.0, !dbg !1633
  %arrayidx3 = getelementptr inbounds nuw [256 x i16], ptr %coeffs1, i32 0, i32 %mul2, !dbg !1634
  %coeffs4 = getelementptr inbounds nuw %struct.poly, ptr %b, i32 0, i32 0, !dbg !1635
  %mul5 = mul i32 4, %i.0, !dbg !1636
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %coeffs4, i32 0, i32 %mul5, !dbg !1637
  %add = add i32 64, %i.0, !dbg !1638
  %arrayidx7 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber512_ref_zetas, i32 0, i32 %add, !dbg !1639
  %0 = load i16, ptr %arrayidx7, align 2, !dbg !1639
  call void @pqcrystals_kyber512_ref_basemul(ptr noundef %arrayidx, ptr noundef %arrayidx3, ptr noundef %arrayidx6, i16 noundef signext %0) #2, !dbg !1640
  %coeffs8 = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1641
  %mul9 = mul i32 4, %i.0, !dbg !1642
  %add10 = add i32 %mul9, 2, !dbg !1643
  %arrayidx11 = getelementptr inbounds nuw [256 x i16], ptr %coeffs8, i32 0, i32 %add10, !dbg !1644
  %coeffs12 = getelementptr inbounds nuw %struct.poly, ptr %a, i32 0, i32 0, !dbg !1645
  %mul13 = mul i32 4, %i.0, !dbg !1646
  %add14 = add i32 %mul13, 2, !dbg !1647
  %arrayidx15 = getelementptr inbounds nuw [256 x i16], ptr %coeffs12, i32 0, i32 %add14, !dbg !1648
  %coeffs16 = getelementptr inbounds nuw %struct.poly, ptr %b, i32 0, i32 0, !dbg !1649
  %mul17 = mul i32 4, %i.0, !dbg !1650
  %add18 = add i32 %mul17, 2, !dbg !1651
  %arrayidx19 = getelementptr inbounds nuw [256 x i16], ptr %coeffs16, i32 0, i32 %add18, !dbg !1652
  %add20 = add i32 64, %i.0, !dbg !1653
  %arrayidx21 = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber512_ref_zetas, i32 0, i32 %add20, !dbg !1654
  %1 = load i16, ptr %arrayidx21, align 2, !dbg !1654
  %conv = sext i16 %1 to i32, !dbg !1654
  %sub = sub nsw i32 0, %conv, !dbg !1655
  %conv22 = trunc i32 %sub to i16, !dbg !1655
  call void @pqcrystals_kyber512_ref_basemul(ptr noundef %arrayidx11, ptr noundef %arrayidx15, ptr noundef %arrayidx19, i16 noundef signext %conv22) #2, !dbg !1656
  br label %for.inc, !dbg !1657

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1658
    #dbg_value(i32 %inc, !1621, !DIExpression(), !1618)
  br label %for.cond, !dbg !1659, !llvm.loop !1660

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1662
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_poly_tomont(ptr noundef %r) #0 !dbg !1663 {
entry:
    #dbg_value(ptr %r, !1664, !DIExpression(), !1665)
    #dbg_value(i16 1353, !1666, !DIExpression(), !1665)
    #dbg_value(i32 0, !1667, !DIExpression(), !1665)
  br label %for.cond, !dbg !1668

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1670
    #dbg_value(i32 %i.0, !1667, !DIExpression(), !1665)
  %cmp = icmp ult i32 %i.0, 256, !dbg !1671
  br i1 %cmp, label %for.body, label %for.end, !dbg !1673

for.body:                                         ; preds = %for.cond
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1674
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %i.0, !dbg !1675
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1675
  %conv = sext i16 %0 to i32, !dbg !1676
  %mul = mul nsw i32 %conv, 1353, !dbg !1677
  %call = call signext i16 @pqcrystals_kyber512_ref_montgomery_reduce(i32 noundef %mul) #2, !dbg !1678
  %coeffs1 = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1679
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %coeffs1, i32 0, i32 %i.0, !dbg !1680
  store i16 %call, ptr %arrayidx2, align 2, !dbg !1681
  br label %for.inc, !dbg !1680

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1682
    #dbg_value(i32 %inc, !1667, !DIExpression(), !1665)
  br label %for.cond, !dbg !1683, !llvm.loop !1684

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1686
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_poly_add(ptr noundef %r, ptr noundef %a, ptr noundef %b) #0 !dbg !1687 {
entry:
    #dbg_value(ptr %r, !1688, !DIExpression(), !1689)
    #dbg_value(ptr %a, !1690, !DIExpression(), !1689)
    #dbg_value(ptr %b, !1691, !DIExpression(), !1689)
    #dbg_value(i32 0, !1692, !DIExpression(), !1689)
  br label %for.cond, !dbg !1693

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1695
    #dbg_value(i32 %i.0, !1692, !DIExpression(), !1689)
  %cmp = icmp ult i32 %i.0, 256, !dbg !1696
  br i1 %cmp, label %for.body, label %for.end, !dbg !1698

for.body:                                         ; preds = %for.cond
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %a, i32 0, i32 0, !dbg !1699
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %i.0, !dbg !1700
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1700
  %conv = sext i16 %0 to i32, !dbg !1700
  %coeffs1 = getelementptr inbounds nuw %struct.poly, ptr %b, i32 0, i32 0, !dbg !1701
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %coeffs1, i32 0, i32 %i.0, !dbg !1702
  %1 = load i16, ptr %arrayidx2, align 2, !dbg !1702
  %conv3 = sext i16 %1 to i32, !dbg !1702
  %add = add nsw i32 %conv, %conv3, !dbg !1703
  %conv4 = trunc i32 %add to i16, !dbg !1700
  %coeffs5 = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1704
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %coeffs5, i32 0, i32 %i.0, !dbg !1705
  store i16 %conv4, ptr %arrayidx6, align 2, !dbg !1706
  br label %for.inc, !dbg !1705

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1707
    #dbg_value(i32 %inc, !1692, !DIExpression(), !1689)
  br label %for.cond, !dbg !1708, !llvm.loop !1709

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1711
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_poly_sub(ptr noundef %r, ptr noundef %a, ptr noundef %b) #0 !dbg !1712 {
entry:
    #dbg_value(ptr %r, !1713, !DIExpression(), !1714)
    #dbg_value(ptr %a, !1715, !DIExpression(), !1714)
    #dbg_value(ptr %b, !1716, !DIExpression(), !1714)
    #dbg_value(i32 0, !1717, !DIExpression(), !1714)
  br label %for.cond, !dbg !1718

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !1720
    #dbg_value(i32 %i.0, !1717, !DIExpression(), !1714)
  %cmp = icmp ult i32 %i.0, 256, !dbg !1721
  br i1 %cmp, label %for.body, label %for.end, !dbg !1723

for.body:                                         ; preds = %for.cond
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %a, i32 0, i32 0, !dbg !1724
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %i.0, !dbg !1725
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1725
  %conv = sext i16 %0 to i32, !dbg !1725
  %coeffs1 = getelementptr inbounds nuw %struct.poly, ptr %b, i32 0, i32 0, !dbg !1726
  %arrayidx2 = getelementptr inbounds nuw [256 x i16], ptr %coeffs1, i32 0, i32 %i.0, !dbg !1727
  %1 = load i16, ptr %arrayidx2, align 2, !dbg !1727
  %conv3 = sext i16 %1 to i32, !dbg !1727
  %sub = sub nsw i32 %conv, %conv3, !dbg !1728
  %conv4 = trunc i32 %sub to i16, !dbg !1725
  %coeffs5 = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1729
  %arrayidx6 = getelementptr inbounds nuw [256 x i16], ptr %coeffs5, i32 0, i32 %i.0, !dbg !1730
  store i16 %conv4, ptr %arrayidx6, align 2, !dbg !1731
  br label %for.inc, !dbg !1730

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !1732
    #dbg_value(i32 %inc, !1717, !DIExpression(), !1714)
  br label %for.cond, !dbg !1733, !llvm.loop !1734

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1736
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_ntt(ptr noundef %r) #0 !dbg !1737 {
entry:
    #dbg_value(ptr %r, !1740, !DIExpression(), !1741)
    #dbg_value(i32 1, !1742, !DIExpression(), !1741)
    #dbg_value(i32 128, !1743, !DIExpression(), !1741)
  br label %for.cond, !dbg !1744

for.cond:                                         ; preds = %for.inc24, %entry
  %len.0 = phi i32 [ 128, %entry ], [ %shr, %for.inc24 ], !dbg !1746
  %k.0 = phi i32 [ 1, %entry ], [ %k.1, %for.inc24 ], !dbg !1747
    #dbg_value(i32 %k.0, !1742, !DIExpression(), !1741)
    #dbg_value(i32 %len.0, !1743, !DIExpression(), !1741)
  %cmp = icmp uge i32 %len.0, 2, !dbg !1748
  br i1 %cmp, label %for.body, label %for.end25, !dbg !1750

for.body:                                         ; preds = %for.cond
    #dbg_value(i32 0, !1751, !DIExpression(), !1741)
  br label %for.cond1, !dbg !1752

for.cond1:                                        ; preds = %for.inc21, %for.body
  %start.0 = phi i32 [ 0, %for.body ], [ %add22, %for.inc21 ], !dbg !1755
  %k.1 = phi i32 [ %k.0, %for.body ], [ %inc, %for.inc21 ], !dbg !1741
    #dbg_value(i32 %k.1, !1742, !DIExpression(), !1741)
    #dbg_value(i32 %start.0, !1751, !DIExpression(), !1741)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !1756
  br i1 %cmp2, label %for.body3, label %for.end23, !dbg !1758

for.body3:                                        ; preds = %for.cond1
  %inc = add i32 %k.1, 1, !dbg !1759
    #dbg_value(i32 %inc, !1742, !DIExpression(), !1741)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber512_ref_zetas, i32 0, i32 %k.1, !dbg !1761
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1761
    #dbg_value(i16 %0, !1762, !DIExpression(), !1741)
    #dbg_value(i32 %start.0, !1763, !DIExpression(), !1741)
  br label %for.cond4, !dbg !1764

for.cond4:                                        ; preds = %for.inc, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc20, %for.inc ], !dbg !1766
    #dbg_value(i32 %j.0, !1763, !DIExpression(), !1741)
  %add = add i32 %start.0, %len.0, !dbg !1767
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !1769
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !1770

for.body6:                                        ; preds = %for.cond4
  %add7 = add i32 %j.0, %len.0, !dbg !1771
  %arrayidx8 = getelementptr inbounds nuw i16, ptr %r, i32 %add7, !dbg !1773
  %1 = load i16, ptr %arrayidx8, align 2, !dbg !1773
  %call = call signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %1) #2, !dbg !1774
    #dbg_value(i16 %call, !1775, !DIExpression(), !1741)
  %arrayidx9 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1776
  %2 = load i16, ptr %arrayidx9, align 2, !dbg !1776
  %conv = sext i16 %2 to i32, !dbg !1776
  %conv10 = sext i16 %call to i32, !dbg !1777
  %sub = sub nsw i32 %conv, %conv10, !dbg !1778
  %conv11 = trunc i32 %sub to i16, !dbg !1776
  %add12 = add i32 %j.0, %len.0, !dbg !1779
  %arrayidx13 = getelementptr inbounds nuw i16, ptr %r, i32 %add12, !dbg !1780
  store i16 %conv11, ptr %arrayidx13, align 2, !dbg !1781
  %arrayidx14 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1782
  %3 = load i16, ptr %arrayidx14, align 2, !dbg !1782
  %conv15 = sext i16 %3 to i32, !dbg !1782
  %conv16 = sext i16 %call to i32, !dbg !1783
  %add17 = add nsw i32 %conv15, %conv16, !dbg !1784
  %conv18 = trunc i32 %add17 to i16, !dbg !1782
  %arrayidx19 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1785
  store i16 %conv18, ptr %arrayidx19, align 2, !dbg !1786
  br label %for.inc, !dbg !1787

for.inc:                                          ; preds = %for.body6
  %inc20 = add i32 %j.0, 1, !dbg !1788
    #dbg_value(i32 %inc20, !1763, !DIExpression(), !1741)
  br label %for.cond4, !dbg !1789, !llvm.loop !1790

for.end:                                          ; preds = %for.cond4
  br label %for.inc21, !dbg !1792

for.inc21:                                        ; preds = %for.end
  %add22 = add i32 %j.0, %len.0, !dbg !1793
    #dbg_value(i32 %add22, !1751, !DIExpression(), !1741)
  br label %for.cond1, !dbg !1794, !llvm.loop !1795

for.end23:                                        ; preds = %for.cond1
  br label %for.inc24, !dbg !1797

for.inc24:                                        ; preds = %for.end23
  %shr = lshr i32 %len.0, 1, !dbg !1798
    #dbg_value(i32 %shr, !1743, !DIExpression(), !1741)
  br label %for.cond, !dbg !1799, !llvm.loop !1800

for.end25:                                        ; preds = %for.cond
  ret void, !dbg !1802
}

; Function Attrs: noinline nounwind optnone
define internal signext i16 @fqmul(i16 noundef signext %a, i16 noundef signext %b) #0 !dbg !1803 {
entry:
    #dbg_value(i16 %a, !1806, !DIExpression(), !1807)
    #dbg_value(i16 %b, !1808, !DIExpression(), !1807)
  %conv = sext i16 %a to i32, !dbg !1809
  %conv1 = sext i16 %b to i32, !dbg !1810
  %mul = mul nsw i32 %conv, %conv1, !dbg !1811
  %call = call signext i16 @pqcrystals_kyber512_ref_montgomery_reduce(i32 noundef %mul) #2, !dbg !1812
  ret i16 %call, !dbg !1813
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_invntt(ptr noundef %r) #0 !dbg !1814 {
entry:
    #dbg_value(ptr %r, !1815, !DIExpression(), !1816)
    #dbg_value(i16 1441, !1817, !DIExpression(), !1816)
    #dbg_value(i32 127, !1818, !DIExpression(), !1816)
    #dbg_value(i32 2, !1819, !DIExpression(), !1816)
  br label %for.cond, !dbg !1820

for.cond:                                         ; preds = %for.inc29, %entry
  %len.0 = phi i32 [ 2, %entry ], [ %shl, %for.inc29 ], !dbg !1822
  %k.0 = phi i32 [ 127, %entry ], [ %k.1, %for.inc29 ], !dbg !1823
    #dbg_value(i32 %k.0, !1818, !DIExpression(), !1816)
    #dbg_value(i32 %len.0, !1819, !DIExpression(), !1816)
  %cmp = icmp ule i32 %len.0, 128, !dbg !1824
  br i1 %cmp, label %for.body, label %for.end30, !dbg !1826

for.body:                                         ; preds = %for.cond
    #dbg_value(i32 0, !1827, !DIExpression(), !1816)
  br label %for.cond1, !dbg !1828

for.cond1:                                        ; preds = %for.inc26, %for.body
  %start.0 = phi i32 [ 0, %for.body ], [ %add27, %for.inc26 ], !dbg !1831
  %k.1 = phi i32 [ %k.0, %for.body ], [ %dec, %for.inc26 ], !dbg !1816
    #dbg_value(i32 %k.1, !1818, !DIExpression(), !1816)
    #dbg_value(i32 %start.0, !1827, !DIExpression(), !1816)
  %cmp2 = icmp ult i32 %start.0, 256, !dbg !1832
  br i1 %cmp2, label %for.body3, label %for.end28, !dbg !1834

for.body3:                                        ; preds = %for.cond1
  %dec = add i32 %k.1, -1, !dbg !1835
    #dbg_value(i32 %dec, !1818, !DIExpression(), !1816)
  %arrayidx = getelementptr inbounds nuw [128 x i16], ptr @pqcrystals_kyber512_ref_zetas, i32 0, i32 %k.1, !dbg !1837
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1837
    #dbg_value(i16 %0, !1838, !DIExpression(), !1816)
    #dbg_value(i32 %start.0, !1839, !DIExpression(), !1816)
  br label %for.cond4, !dbg !1840

for.cond4:                                        ; preds = %for.inc, %for.body3
  %j.0 = phi i32 [ %start.0, %for.body3 ], [ %inc, %for.inc ], !dbg !1842
    #dbg_value(i32 %j.0, !1839, !DIExpression(), !1816)
  %add = add i32 %start.0, %len.0, !dbg !1843
  %cmp5 = icmp ult i32 %j.0, %add, !dbg !1845
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !1846

for.body6:                                        ; preds = %for.cond4
  %arrayidx7 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1847
  %1 = load i16, ptr %arrayidx7, align 2, !dbg !1847
    #dbg_value(i16 %1, !1849, !DIExpression(), !1816)
  %conv = sext i16 %1 to i32, !dbg !1850
  %add8 = add i32 %j.0, %len.0, !dbg !1851
  %arrayidx9 = getelementptr inbounds nuw i16, ptr %r, i32 %add8, !dbg !1852
  %2 = load i16, ptr %arrayidx9, align 2, !dbg !1852
  %conv10 = sext i16 %2 to i32, !dbg !1852
  %add11 = add nsw i32 %conv, %conv10, !dbg !1853
  %conv12 = trunc i32 %add11 to i16, !dbg !1850
  %call = call signext i16 @pqcrystals_kyber512_ref_barrett_reduce(i16 noundef signext %conv12) #2, !dbg !1854
  %arrayidx13 = getelementptr inbounds nuw i16, ptr %r, i32 %j.0, !dbg !1855
  store i16 %call, ptr %arrayidx13, align 2, !dbg !1856
  %add14 = add i32 %j.0, %len.0, !dbg !1857
  %arrayidx15 = getelementptr inbounds nuw i16, ptr %r, i32 %add14, !dbg !1858
  %3 = load i16, ptr %arrayidx15, align 2, !dbg !1858
  %conv16 = sext i16 %3 to i32, !dbg !1858
  %conv17 = sext i16 %1 to i32, !dbg !1859
  %sub = sub nsw i32 %conv16, %conv17, !dbg !1860
  %conv18 = trunc i32 %sub to i16, !dbg !1858
  %add19 = add i32 %j.0, %len.0, !dbg !1861
  %arrayidx20 = getelementptr inbounds nuw i16, ptr %r, i32 %add19, !dbg !1862
  store i16 %conv18, ptr %arrayidx20, align 2, !dbg !1863
  %add21 = add i32 %j.0, %len.0, !dbg !1864
  %arrayidx22 = getelementptr inbounds nuw i16, ptr %r, i32 %add21, !dbg !1865
  %4 = load i16, ptr %arrayidx22, align 2, !dbg !1865
  %call23 = call signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %4) #2, !dbg !1866
  %add24 = add i32 %j.0, %len.0, !dbg !1867
  %arrayidx25 = getelementptr inbounds nuw i16, ptr %r, i32 %add24, !dbg !1868
  store i16 %call23, ptr %arrayidx25, align 2, !dbg !1869
  br label %for.inc, !dbg !1870

for.inc:                                          ; preds = %for.body6
  %inc = add i32 %j.0, 1, !dbg !1871
    #dbg_value(i32 %inc, !1839, !DIExpression(), !1816)
  br label %for.cond4, !dbg !1872, !llvm.loop !1873

for.end:                                          ; preds = %for.cond4
  br label %for.inc26, !dbg !1875

for.inc26:                                        ; preds = %for.end
  %add27 = add i32 %j.0, %len.0, !dbg !1876
    #dbg_value(i32 %add27, !1827, !DIExpression(), !1816)
  br label %for.cond1, !dbg !1877, !llvm.loop !1878

for.end28:                                        ; preds = %for.cond1
  br label %for.inc29, !dbg !1880

for.inc29:                                        ; preds = %for.end28
  %shl = shl i32 %len.0, 1, !dbg !1881
    #dbg_value(i32 %shl, !1819, !DIExpression(), !1816)
  br label %for.cond, !dbg !1882, !llvm.loop !1883

for.end30:                                        ; preds = %for.cond
    #dbg_value(i32 0, !1839, !DIExpression(), !1816)
  br label %for.cond31, !dbg !1885

for.cond31:                                       ; preds = %for.inc38, %for.end30
  %j.1 = phi i32 [ 0, %for.end30 ], [ %inc39, %for.inc38 ], !dbg !1887
    #dbg_value(i32 %j.1, !1839, !DIExpression(), !1816)
  %cmp32 = icmp ult i32 %j.1, 256, !dbg !1888
  br i1 %cmp32, label %for.body34, label %for.end40, !dbg !1890

for.body34:                                       ; preds = %for.cond31
  %arrayidx35 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !1891
  %5 = load i16, ptr %arrayidx35, align 2, !dbg !1891
  %call36 = call signext i16 @fqmul(i16 noundef signext %5, i16 noundef signext 1441) #2, !dbg !1892
  %arrayidx37 = getelementptr inbounds nuw i16, ptr %r, i32 %j.1, !dbg !1893
  store i16 %call36, ptr %arrayidx37, align 2, !dbg !1894
  br label %for.inc38, !dbg !1893

for.inc38:                                        ; preds = %for.body34
  %inc39 = add i32 %j.1, 1, !dbg !1895
    #dbg_value(i32 %inc39, !1839, !DIExpression(), !1816)
  br label %for.cond31, !dbg !1896, !llvm.loop !1897

for.end40:                                        ; preds = %for.cond31
  ret void, !dbg !1899
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_basemul(ptr noundef %r, ptr noundef %a, ptr noundef %b, i16 noundef signext %zeta) #0 !dbg !1900 {
entry:
    #dbg_value(ptr %r, !1904, !DIExpression(), !1905)
    #dbg_value(ptr %a, !1906, !DIExpression(), !1905)
    #dbg_value(ptr %b, !1907, !DIExpression(), !1905)
    #dbg_value(i16 %zeta, !1908, !DIExpression(), !1905)
  %arrayidx = getelementptr inbounds i16, ptr %a, i32 1, !dbg !1909
  %0 = load i16, ptr %arrayidx, align 2, !dbg !1909
  %arrayidx1 = getelementptr inbounds i16, ptr %b, i32 1, !dbg !1910
  %1 = load i16, ptr %arrayidx1, align 2, !dbg !1910
  %call = call signext i16 @fqmul(i16 noundef signext %0, i16 noundef signext %1) #2, !dbg !1911
  %arrayidx2 = getelementptr inbounds i16, ptr %r, i32 0, !dbg !1912
  store i16 %call, ptr %arrayidx2, align 2, !dbg !1913
  %arrayidx3 = getelementptr inbounds i16, ptr %r, i32 0, !dbg !1914
  %2 = load i16, ptr %arrayidx3, align 2, !dbg !1914
  %call4 = call signext i16 @fqmul(i16 noundef signext %2, i16 noundef signext %zeta) #2, !dbg !1915
  %arrayidx5 = getelementptr inbounds i16, ptr %r, i32 0, !dbg !1916
  store i16 %call4, ptr %arrayidx5, align 2, !dbg !1917
  %arrayidx6 = getelementptr inbounds i16, ptr %a, i32 0, !dbg !1918
  %3 = load i16, ptr %arrayidx6, align 2, !dbg !1918
  %arrayidx7 = getelementptr inbounds i16, ptr %b, i32 0, !dbg !1919
  %4 = load i16, ptr %arrayidx7, align 2, !dbg !1919
  %call8 = call signext i16 @fqmul(i16 noundef signext %3, i16 noundef signext %4) #2, !dbg !1920
  %conv = sext i16 %call8 to i32, !dbg !1920
  %arrayidx9 = getelementptr inbounds i16, ptr %r, i32 0, !dbg !1921
  %5 = load i16, ptr %arrayidx9, align 2, !dbg !1922
  %conv10 = sext i16 %5 to i32, !dbg !1922
  %add = add nsw i32 %conv10, %conv, !dbg !1922
  %conv11 = trunc i32 %add to i16, !dbg !1922
  store i16 %conv11, ptr %arrayidx9, align 2, !dbg !1922
  %arrayidx12 = getelementptr inbounds i16, ptr %a, i32 0, !dbg !1923
  %6 = load i16, ptr %arrayidx12, align 2, !dbg !1923
  %arrayidx13 = getelementptr inbounds i16, ptr %b, i32 1, !dbg !1924
  %7 = load i16, ptr %arrayidx13, align 2, !dbg !1924
  %call14 = call signext i16 @fqmul(i16 noundef signext %6, i16 noundef signext %7) #2, !dbg !1925
  %arrayidx15 = getelementptr inbounds i16, ptr %r, i32 1, !dbg !1926
  store i16 %call14, ptr %arrayidx15, align 2, !dbg !1927
  %arrayidx16 = getelementptr inbounds i16, ptr %a, i32 1, !dbg !1928
  %8 = load i16, ptr %arrayidx16, align 2, !dbg !1928
  %arrayidx17 = getelementptr inbounds i16, ptr %b, i32 0, !dbg !1929
  %9 = load i16, ptr %arrayidx17, align 2, !dbg !1929
  %call18 = call signext i16 @fqmul(i16 noundef signext %8, i16 noundef signext %9) #2, !dbg !1930
  %conv19 = sext i16 %call18 to i32, !dbg !1930
  %arrayidx20 = getelementptr inbounds i16, ptr %r, i32 1, !dbg !1931
  %10 = load i16, ptr %arrayidx20, align 2, !dbg !1932
  %conv21 = sext i16 %10 to i32, !dbg !1932
  %add22 = add nsw i32 %conv21, %conv19, !dbg !1932
  %conv23 = trunc i32 %add22 to i16, !dbg !1932
  store i16 %conv23, ptr %arrayidx20, align 2, !dbg !1932
  ret void, !dbg !1933
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_poly_cbd_eta1(ptr noundef %r, ptr noundef %buf) #0 !dbg !1934 {
entry:
    #dbg_value(ptr %r, !1943, !DIExpression(), !1944)
    #dbg_value(ptr %buf, !1945, !DIExpression(), !1944)
  call void @cbd3(ptr noundef %r, ptr noundef %buf) #2, !dbg !1946
  ret void, !dbg !1947
}

; Function Attrs: noinline nounwind optnone
define internal void @cbd3(ptr noundef %r, ptr noundef %buf) #0 !dbg !1948 {
entry:
    #dbg_value(ptr %r, !1949, !DIExpression(), !1950)
    #dbg_value(ptr %buf, !1951, !DIExpression(), !1950)
    #dbg_value(i32 0, !1952, !DIExpression(), !1950)
  br label %for.cond, !dbg !1953

for.cond:                                         ; preds = %for.inc22, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc23, %for.inc22 ], !dbg !1955
    #dbg_value(i32 %i.0, !1952, !DIExpression(), !1950)
  %cmp = icmp ult i32 %i.0, 64, !dbg !1956
  br i1 %cmp, label %for.body, label %for.end24, !dbg !1958

for.body:                                         ; preds = %for.cond
  %mul = mul i32 3, %i.0, !dbg !1959
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 %mul, !dbg !1961
  %call = call i32 @load24_littleendian(ptr noundef %add.ptr) #2, !dbg !1962
    #dbg_value(i32 %call, !1963, !DIExpression(), !1950)
  %and = and i32 %call, 2396745, !dbg !1964
    #dbg_value(i32 %and, !1965, !DIExpression(), !1950)
  %shr = lshr i32 %call, 1, !dbg !1966
  %and1 = and i32 %shr, 2396745, !dbg !1967
  %add = add i32 %and, %and1, !dbg !1968
    #dbg_value(i32 %add, !1965, !DIExpression(), !1950)
  %shr2 = lshr i32 %call, 2, !dbg !1969
  %and3 = and i32 %shr2, 2396745, !dbg !1970
  %add4 = add i32 %add, %and3, !dbg !1971
    #dbg_value(i32 %add4, !1965, !DIExpression(), !1950)
    #dbg_value(i32 0, !1972, !DIExpression(), !1950)
  br label %for.cond5, !dbg !1973

for.cond5:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ], !dbg !1975
    #dbg_value(i32 %j.0, !1972, !DIExpression(), !1950)
  %cmp6 = icmp ult i32 %j.0, 4, !dbg !1976
  br i1 %cmp6, label %for.body7, label %for.end, !dbg !1978

for.body7:                                        ; preds = %for.cond5
  %mul8 = mul i32 6, %j.0, !dbg !1979
  %add9 = add i32 %mul8, 0, !dbg !1981
  %shr10 = lshr i32 %add4, %add9, !dbg !1982
  %and11 = and i32 %shr10, 7, !dbg !1983
  %conv = trunc i32 %and11 to i16, !dbg !1984
    #dbg_value(i16 %conv, !1985, !DIExpression(), !1950)
  %mul12 = mul i32 6, %j.0, !dbg !1986
  %add13 = add i32 %mul12, 3, !dbg !1987
  %shr14 = lshr i32 %add4, %add13, !dbg !1988
  %and15 = and i32 %shr14, 7, !dbg !1989
  %conv16 = trunc i32 %and15 to i16, !dbg !1990
    #dbg_value(i16 %conv16, !1991, !DIExpression(), !1950)
  %conv17 = sext i16 %conv to i32, !dbg !1992
  %conv18 = sext i16 %conv16 to i32, !dbg !1993
  %sub = sub nsw i32 %conv17, %conv18, !dbg !1994
  %conv19 = trunc i32 %sub to i16, !dbg !1992
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !1995
  %mul20 = mul i32 4, %i.0, !dbg !1996
  %add21 = add i32 %mul20, %j.0, !dbg !1997
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %add21, !dbg !1998
  store i16 %conv19, ptr %arrayidx, align 2, !dbg !1999
  br label %for.inc, !dbg !2000

for.inc:                                          ; preds = %for.body7
  %inc = add i32 %j.0, 1, !dbg !2001
    #dbg_value(i32 %inc, !1972, !DIExpression(), !1950)
  br label %for.cond5, !dbg !2002, !llvm.loop !2003

for.end:                                          ; preds = %for.cond5
  br label %for.inc22, !dbg !2005

for.inc22:                                        ; preds = %for.end
  %inc23 = add i32 %i.0, 1, !dbg !2006
    #dbg_value(i32 %inc23, !1952, !DIExpression(), !1950)
  br label %for.cond, !dbg !2007, !llvm.loop !2008

for.end24:                                        ; preds = %for.cond
  ret void, !dbg !2010
}

; Function Attrs: noinline nounwind optnone
define internal i32 @load24_littleendian(ptr noundef %x) #0 !dbg !2011 {
entry:
    #dbg_value(ptr %x, !2014, !DIExpression(), !2015)
  %arrayidx = getelementptr inbounds i8, ptr %x, i32 0, !dbg !2016
  %0 = load i8, ptr %arrayidx, align 1, !dbg !2016
  %conv = zext i8 %0 to i32, !dbg !2017
    #dbg_value(i32 %conv, !2018, !DIExpression(), !2015)
  %arrayidx1 = getelementptr inbounds i8, ptr %x, i32 1, !dbg !2019
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !2019
  %conv2 = zext i8 %1 to i32, !dbg !2020
  %shl = shl i32 %conv2, 8, !dbg !2021
  %or = or i32 %conv, %shl, !dbg !2022
    #dbg_value(i32 %or, !2018, !DIExpression(), !2015)
  %arrayidx3 = getelementptr inbounds i8, ptr %x, i32 2, !dbg !2023
  %2 = load i8, ptr %arrayidx3, align 1, !dbg !2023
  %conv4 = zext i8 %2 to i32, !dbg !2024
  %shl5 = shl i32 %conv4, 16, !dbg !2025
  %or6 = or i32 %or, %shl5, !dbg !2026
    #dbg_value(i32 %or6, !2018, !DIExpression(), !2015)
  ret i32 %or6, !dbg !2027
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_poly_cbd_eta2(ptr noundef %r, ptr noundef %buf) #0 !dbg !2028 {
entry:
    #dbg_value(ptr %r, !2029, !DIExpression(), !2030)
    #dbg_value(ptr %buf, !2031, !DIExpression(), !2030)
  call void @cbd2(ptr noundef %r, ptr noundef %buf) #2, !dbg !2032
  ret void, !dbg !2033
}

; Function Attrs: noinline nounwind optnone
define internal void @cbd2(ptr noundef %r, ptr noundef %buf) #0 !dbg !2034 {
entry:
    #dbg_value(ptr %r, !2035, !DIExpression(), !2036)
    #dbg_value(ptr %buf, !2037, !DIExpression(), !2036)
    #dbg_value(i32 0, !2038, !DIExpression(), !2036)
  br label %for.cond, !dbg !2039

for.cond:                                         ; preds = %for.inc19, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc20, %for.inc19 ], !dbg !2041
    #dbg_value(i32 %i.0, !2038, !DIExpression(), !2036)
  %cmp = icmp ult i32 %i.0, 32, !dbg !2042
  br i1 %cmp, label %for.body, label %for.end21, !dbg !2044

for.body:                                         ; preds = %for.cond
  %mul = mul i32 4, %i.0, !dbg !2045
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf, i32 %mul, !dbg !2047
  %call = call i32 @load32_littleendian(ptr noundef %add.ptr) #2, !dbg !2048
    #dbg_value(i32 %call, !2049, !DIExpression(), !2036)
  %and = and i32 %call, 1431655765, !dbg !2050
    #dbg_value(i32 %and, !2051, !DIExpression(), !2036)
  %shr = lshr i32 %call, 1, !dbg !2052
  %and1 = and i32 %shr, 1431655765, !dbg !2053
  %add = add i32 %and, %and1, !dbg !2054
    #dbg_value(i32 %add, !2051, !DIExpression(), !2036)
    #dbg_value(i32 0, !2055, !DIExpression(), !2036)
  br label %for.cond2, !dbg !2056

for.cond2:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ], !dbg !2058
    #dbg_value(i32 %j.0, !2055, !DIExpression(), !2036)
  %cmp3 = icmp ult i32 %j.0, 8, !dbg !2059
  br i1 %cmp3, label %for.body4, label %for.end, !dbg !2061

for.body4:                                        ; preds = %for.cond2
  %mul5 = mul i32 4, %j.0, !dbg !2062
  %add6 = add i32 %mul5, 0, !dbg !2064
  %shr7 = lshr i32 %add, %add6, !dbg !2065
  %and8 = and i32 %shr7, 3, !dbg !2066
  %conv = trunc i32 %and8 to i16, !dbg !2067
    #dbg_value(i16 %conv, !2068, !DIExpression(), !2036)
  %mul9 = mul i32 4, %j.0, !dbg !2069
  %add10 = add i32 %mul9, 2, !dbg !2070
  %shr11 = lshr i32 %add, %add10, !dbg !2071
  %and12 = and i32 %shr11, 3, !dbg !2072
  %conv13 = trunc i32 %and12 to i16, !dbg !2073
    #dbg_value(i16 %conv13, !2074, !DIExpression(), !2036)
  %conv14 = sext i16 %conv to i32, !dbg !2075
  %conv15 = sext i16 %conv13 to i32, !dbg !2076
  %sub = sub nsw i32 %conv14, %conv15, !dbg !2077
  %conv16 = trunc i32 %sub to i16, !dbg !2075
  %coeffs = getelementptr inbounds nuw %struct.poly, ptr %r, i32 0, i32 0, !dbg !2078
  %mul17 = mul i32 8, %i.0, !dbg !2079
  %add18 = add i32 %mul17, %j.0, !dbg !2080
  %arrayidx = getelementptr inbounds nuw [256 x i16], ptr %coeffs, i32 0, i32 %add18, !dbg !2081
  store i16 %conv16, ptr %arrayidx, align 2, !dbg !2082
  br label %for.inc, !dbg !2083

for.inc:                                          ; preds = %for.body4
  %inc = add i32 %j.0, 1, !dbg !2084
    #dbg_value(i32 %inc, !2055, !DIExpression(), !2036)
  br label %for.cond2, !dbg !2085, !llvm.loop !2086

for.end:                                          ; preds = %for.cond2
  br label %for.inc19, !dbg !2088

for.inc19:                                        ; preds = %for.end
  %inc20 = add i32 %i.0, 1, !dbg !2089
    #dbg_value(i32 %inc20, !2038, !DIExpression(), !2036)
  br label %for.cond, !dbg !2090, !llvm.loop !2091

for.end21:                                        ; preds = %for.cond
  ret void, !dbg !2093
}

; Function Attrs: noinline nounwind optnone
define internal i32 @load32_littleendian(ptr noundef %x) #0 !dbg !2094 {
entry:
    #dbg_value(ptr %x, !2095, !DIExpression(), !2096)
  %arrayidx = getelementptr inbounds i8, ptr %x, i32 0, !dbg !2097
  %0 = load i8, ptr %arrayidx, align 1, !dbg !2097
  %conv = zext i8 %0 to i32, !dbg !2098
    #dbg_value(i32 %conv, !2099, !DIExpression(), !2096)
  %arrayidx1 = getelementptr inbounds i8, ptr %x, i32 1, !dbg !2100
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !2100
  %conv2 = zext i8 %1 to i32, !dbg !2101
  %shl = shl i32 %conv2, 8, !dbg !2102
  %or = or i32 %conv, %shl, !dbg !2103
    #dbg_value(i32 %or, !2099, !DIExpression(), !2096)
  %arrayidx3 = getelementptr inbounds i8, ptr %x, i32 2, !dbg !2104
  %2 = load i8, ptr %arrayidx3, align 1, !dbg !2104
  %conv4 = zext i8 %2 to i32, !dbg !2105
  %shl5 = shl i32 %conv4, 16, !dbg !2106
  %or6 = or i32 %or, %shl5, !dbg !2107
    #dbg_value(i32 %or6, !2099, !DIExpression(), !2096)
  %arrayidx7 = getelementptr inbounds i8, ptr %x, i32 3, !dbg !2108
  %3 = load i8, ptr %arrayidx7, align 1, !dbg !2108
  %conv8 = zext i8 %3 to i32, !dbg !2109
  %shl9 = shl i32 %conv8, 24, !dbg !2110
  %or10 = or i32 %or6, %shl9, !dbg !2111
    #dbg_value(i32 %or10, !2099, !DIExpression(), !2096)
  ret i32 %or10, !dbg !2112
}

; Function Attrs: noinline nounwind optnone
define dso_local signext i16 @pqcrystals_kyber512_ref_montgomery_reduce(i32 noundef %a) #0 !dbg !2113 {
entry:
    #dbg_value(i32 %a, !2116, !DIExpression(), !2117)
  %conv = trunc i32 %a to i16, !dbg !2118
  %conv1 = sext i16 %conv to i32, !dbg !2118
  %mul = mul nsw i32 %conv1, -3327, !dbg !2119
  %conv2 = trunc i32 %mul to i16, !dbg !2118
    #dbg_value(i16 %conv2, !2120, !DIExpression(), !2117)
  %conv3 = sext i16 %conv2 to i32, !dbg !2121
  %mul4 = mul nsw i32 %conv3, 3329, !dbg !2122
  %sub = sub nsw i32 %a, %mul4, !dbg !2123
  %shr = ashr i32 %sub, 16, !dbg !2124
  %conv5 = trunc i32 %shr to i16, !dbg !2125
    #dbg_value(i16 %conv5, !2120, !DIExpression(), !2117)
  ret i16 %conv5, !dbg !2126
}

; Function Attrs: noinline nounwind optnone
define dso_local signext i16 @pqcrystals_kyber512_ref_barrett_reduce(i16 noundef signext %a) #0 !dbg !2127 {
entry:
    #dbg_value(i16 %a, !2130, !DIExpression(), !2131)
    #dbg_value(i16 20159, !2132, !DIExpression(), !2131)
  %conv = sext i16 %a to i32, !dbg !2133
  %mul = mul nsw i32 20159, %conv, !dbg !2134
  %add = add nsw i32 %mul, 33554432, !dbg !2135
  %shr = ashr i32 %add, 26, !dbg !2136
  %conv1 = trunc i32 %shr to i16, !dbg !2137
    #dbg_value(i16 %conv1, !2138, !DIExpression(), !2131)
  %conv2 = sext i16 %conv1 to i32, !dbg !2139
  %mul3 = mul nsw i32 %conv2, 3329, !dbg !2139
  %conv4 = trunc i32 %mul3 to i16, !dbg !2139
    #dbg_value(i16 %conv4, !2138, !DIExpression(), !2131)
  %conv5 = sext i16 %a to i32, !dbg !2140
  %conv6 = sext i16 %conv4 to i32, !dbg !2141
  %sub = sub nsw i32 %conv5, %conv6, !dbg !2142
  %conv7 = trunc i32 %sub to i16, !dbg !2140
  ret i16 %conv7, !dbg !2143
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @pqcrystals_kyber512_ref_verify(ptr noundef %a, ptr noundef %b, i32 noundef %len) #0 !dbg !2144 {
entry:
    #dbg_value(ptr %a, !2148, !DIExpression(), !2149)
    #dbg_value(ptr %b, !2150, !DIExpression(), !2149)
    #dbg_value(i32 %len, !2151, !DIExpression(), !2149)
    #dbg_value(i8 0, !2152, !DIExpression(), !2149)
    #dbg_value(i32 0, !2153, !DIExpression(), !2149)
  br label %for.cond, !dbg !2154

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !2156
  %r.0 = phi i8 [ 0, %entry ], [ %conv4, %for.inc ], !dbg !2149
    #dbg_value(i8 %r.0, !2152, !DIExpression(), !2149)
    #dbg_value(i32 %i.0, !2153, !DIExpression(), !2149)
  %cmp = icmp ult i32 %i.0, %len, !dbg !2157
  br i1 %cmp, label %for.body, label %for.end, !dbg !2159

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %i.0, !dbg !2160
  %0 = load i8, ptr %arrayidx, align 1, !dbg !2160
  %conv = zext i8 %0 to i32, !dbg !2160
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %b, i32 %i.0, !dbg !2161
  %1 = load i8, ptr %arrayidx1, align 1, !dbg !2161
  %conv2 = zext i8 %1 to i32, !dbg !2161
  %xor = xor i32 %conv, %conv2, !dbg !2162
  %conv3 = zext i8 %r.0 to i32, !dbg !2163
  %or = or i32 %conv3, %xor, !dbg !2163
  %conv4 = trunc i32 %or to i8, !dbg !2163
    #dbg_value(i8 %conv4, !2152, !DIExpression(), !2149)
  br label %for.inc, !dbg !2164

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !2165
    #dbg_value(i32 %inc, !2153, !DIExpression(), !2149)
  br label %for.cond, !dbg !2166, !llvm.loop !2167

for.end:                                          ; preds = %for.cond
  %conv5 = zext i8 %r.0 to i64, !dbg !2169
  %sub = sub i64 0, %conv5, !dbg !2170
  %shr = lshr i64 %sub, 63, !dbg !2171
  %conv6 = trunc i64 %shr to i32, !dbg !2172
  ret i32 %conv6, !dbg !2173
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_cmov(ptr noundef %r, ptr noundef %x, i32 noundef %len, i8 noundef zeroext %b) #0 !dbg !2174 {
entry:
    #dbg_value(ptr %r, !2177, !DIExpression(), !2178)
    #dbg_value(ptr %x, !2179, !DIExpression(), !2178)
    #dbg_value(i32 %len, !2180, !DIExpression(), !2178)
    #dbg_value(i8 %b, !2181, !DIExpression(), !2178)
  %0 = call i8 asm "", "=r,0"(i8 %b) #3, !dbg !2182, !srcloc !2183
    #dbg_value(i8 %0, !2181, !DIExpression(), !2178)
  %conv = zext i8 %0 to i32, !dbg !2184
  %sub = sub nsw i32 0, %conv, !dbg !2185
  %conv1 = trunc i32 %sub to i8, !dbg !2185
    #dbg_value(i8 %conv1, !2181, !DIExpression(), !2178)
    #dbg_value(i32 0, !2186, !DIExpression(), !2178)
  br label %for.cond, !dbg !2187

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !2189
    #dbg_value(i32 %i.0, !2186, !DIExpression(), !2178)
  %cmp = icmp ult i32 %i.0, %len, !dbg !2190
  br i1 %cmp, label %for.body, label %for.end, !dbg !2192

for.body:                                         ; preds = %for.cond
  %conv3 = zext i8 %conv1 to i32, !dbg !2193
  %arrayidx = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !2194
  %1 = load i8, ptr %arrayidx, align 1, !dbg !2194
  %conv4 = zext i8 %1 to i32, !dbg !2194
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2195
  %2 = load i8, ptr %arrayidx5, align 1, !dbg !2195
  %conv6 = zext i8 %2 to i32, !dbg !2195
  %xor = xor i32 %conv4, %conv6, !dbg !2196
  %and = and i32 %conv3, %xor, !dbg !2197
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !2198
  %3 = load i8, ptr %arrayidx7, align 1, !dbg !2199
  %conv8 = zext i8 %3 to i32, !dbg !2199
  %xor9 = xor i32 %conv8, %and, !dbg !2199
  %conv10 = trunc i32 %xor9 to i8, !dbg !2199
  store i8 %conv10, ptr %arrayidx7, align 1, !dbg !2199
  br label %for.inc, !dbg !2198

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !2200
    #dbg_value(i32 %inc, !2186, !DIExpression(), !2178)
  br label %for.cond, !dbg !2201, !llvm.loop !2202

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2204
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_cmov_int16(ptr noundef %r, i16 noundef signext %v, i16 noundef zeroext %b) #0 !dbg !2205 {
entry:
    #dbg_value(ptr %r, !2208, !DIExpression(), !2209)
    #dbg_value(i16 %v, !2210, !DIExpression(), !2209)
    #dbg_value(i16 %b, !2211, !DIExpression(), !2209)
  %conv = zext i16 %b to i32, !dbg !2212
  %sub = sub nsw i32 0, %conv, !dbg !2213
  %conv1 = trunc i32 %sub to i16, !dbg !2213
    #dbg_value(i16 %conv1, !2211, !DIExpression(), !2209)
  %conv2 = zext i16 %conv1 to i32, !dbg !2214
  %0 = load i16, ptr %r, align 2, !dbg !2215
  %conv3 = sext i16 %0 to i32, !dbg !2216
  %conv4 = sext i16 %v to i32, !dbg !2217
  %xor = xor i32 %conv3, %conv4, !dbg !2218
  %and = and i32 %conv2, %xor, !dbg !2219
  %1 = load i16, ptr %r, align 2, !dbg !2220
  %conv5 = sext i16 %1 to i32, !dbg !2220
  %xor6 = xor i32 %conv5, %and, !dbg !2220
  %conv7 = trunc i32 %xor6 to i16, !dbg !2220
  store i16 %conv7, ptr %r, align 2, !dbg !2220
  ret void, !dbg !2221
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_init(ptr noundef %state) #0 !dbg !2222 {
entry:
    #dbg_value(ptr %state, !2231, !DIExpression(), !2232)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !2233
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2234
  call void @keccak_init(ptr noundef %arraydecay) #2, !dbg !2235
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2236
  store i32 0, ptr %pos, align 8, !dbg !2237
  ret void, !dbg !2238
}

; Function Attrs: noinline nounwind optnone
define internal void @keccak_init(ptr noundef %s) #0 !dbg !2239 {
entry:
    #dbg_value(ptr %s, !2243, !DIExpression(), !2244)
    #dbg_value(i32 0, !2245, !DIExpression(), !2244)
  br label %for.cond, !dbg !2246

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !2248
    #dbg_value(i32 %i.0, !2245, !DIExpression(), !2244)
  %cmp = icmp ult i32 %i.0, 25, !dbg !2249
  br i1 %cmp, label %for.body, label %for.end, !dbg !2251

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !2252
  store i64 0, ptr %arrayidx, align 8, !dbg !2253
  br label %for.inc, !dbg !2252

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !2254
    #dbg_value(i32 %inc, !2245, !DIExpression(), !2244)
  br label %for.cond, !dbg !2255, !llvm.loop !2256

for.end:                                          ; preds = %for.cond
  ret void, !dbg !2258
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) #0 !dbg !2259 {
entry:
    #dbg_value(ptr %state, !2262, !DIExpression(), !2263)
    #dbg_value(ptr %in, !2264, !DIExpression(), !2263)
    #dbg_value(i32 %inlen, !2265, !DIExpression(), !2263)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !2266
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2267
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2268
  %0 = load i32, ptr %pos, align 8, !dbg !2268
  %call = call i32 @keccak_absorb(ptr noundef %arraydecay, i32 noundef %0, i32 noundef 168, ptr noundef %in, i32 noundef %inlen) #2, !dbg !2269
  %pos1 = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2270
  store i32 %call, ptr %pos1, align 8, !dbg !2271
  ret void, !dbg !2272
}

; Function Attrs: noinline nounwind optnone
define internal i32 @keccak_absorb(ptr noundef %s, i32 noundef %pos, i32 noundef %r, ptr noundef %in, i32 noundef %inlen) #0 !dbg !2273 {
entry:
    #dbg_value(ptr %s, !2276, !DIExpression(), !2277)
    #dbg_value(i32 %pos, !2278, !DIExpression(), !2277)
    #dbg_value(i32 %r, !2279, !DIExpression(), !2277)
    #dbg_value(ptr %in, !2280, !DIExpression(), !2277)
    #dbg_value(i32 %inlen, !2281, !DIExpression(), !2277)
  br label %while.cond, !dbg !2282

while.cond:                                       ; preds = %for.end, %entry
  %in.addr.0 = phi ptr [ %in, %entry ], [ %in.addr.1, %for.end ]
  %inlen.addr.0 = phi i32 [ %inlen, %entry ], [ %sub2, %for.end ]
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ 0, %for.end ]
    #dbg_value(i32 %pos.addr.0, !2278, !DIExpression(), !2277)
    #dbg_value(i32 %inlen.addr.0, !2281, !DIExpression(), !2277)
    #dbg_value(ptr %in.addr.0, !2280, !DIExpression(), !2277)
  %add = add i32 %pos.addr.0, %inlen.addr.0, !dbg !2283
  %cmp = icmp uge i32 %add, %r, !dbg !2284
  br i1 %cmp, label %while.body, label %while.end, !dbg !2282

while.body:                                       ; preds = %while.cond
    #dbg_value(i32 %pos.addr.0, !2285, !DIExpression(), !2277)
  br label %for.cond, !dbg !2286

for.cond:                                         ; preds = %for.inc, %while.body
  %in.addr.1 = phi ptr [ %in.addr.0, %while.body ], [ %incdec.ptr, %for.inc ]
  %i.0 = phi i32 [ %pos.addr.0, %while.body ], [ %inc, %for.inc ], !dbg !2289
    #dbg_value(i32 %i.0, !2285, !DIExpression(), !2277)
    #dbg_value(ptr %in.addr.1, !2280, !DIExpression(), !2277)
  %cmp1 = icmp ult i32 %i.0, %r, !dbg !2290
  br i1 %cmp1, label %for.body, label %for.end, !dbg !2292

for.body:                                         ; preds = %for.cond
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %in.addr.1, i32 1, !dbg !2293
    #dbg_value(ptr %incdec.ptr, !2280, !DIExpression(), !2277)
  %0 = load i8, ptr %in.addr.1, align 1, !dbg !2294
  %conv = zext i8 %0 to i64, !dbg !2295
  %rem = urem i32 %i.0, 8, !dbg !2296
  %mul = mul i32 8, %rem, !dbg !2297
  %sh_prom = zext i32 %mul to i64, !dbg !2298
  %shl = shl i64 %conv, %sh_prom, !dbg !2298
  %div = udiv i32 %i.0, 8, !dbg !2299
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div, !dbg !2300
  %1 = load i64, ptr %arrayidx, align 8, !dbg !2301
  %xor = xor i64 %1, %shl, !dbg !2301
  store i64 %xor, ptr %arrayidx, align 8, !dbg !2301
  br label %for.inc, !dbg !2300

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !2302
    #dbg_value(i32 %inc, !2285, !DIExpression(), !2277)
  br label %for.cond, !dbg !2303, !llvm.loop !2304

for.end:                                          ; preds = %for.cond
  %sub = sub i32 %r, %pos.addr.0, !dbg !2306
  %sub2 = sub i32 %inlen.addr.0, %sub, !dbg !2307
    #dbg_value(i32 %sub2, !2281, !DIExpression(), !2277)
  call void @KeccakF1600_StatePermute(ptr noundef %s) #2, !dbg !2308
    #dbg_value(i32 0, !2278, !DIExpression(), !2277)
  br label %while.cond, !dbg !2282, !llvm.loop !2309

while.end:                                        ; preds = %while.cond
    #dbg_value(i32 %pos.addr.0, !2285, !DIExpression(), !2277)
  br label %for.cond3, !dbg !2311

for.cond3:                                        ; preds = %for.inc17, %while.end
  %in.addr.2 = phi ptr [ %in.addr.0, %while.end ], [ %incdec.ptr8, %for.inc17 ]
  %i.1 = phi i32 [ %pos.addr.0, %while.end ], [ %inc18, %for.inc17 ], !dbg !2313
    #dbg_value(i32 %i.1, !2285, !DIExpression(), !2277)
    #dbg_value(ptr %in.addr.2, !2280, !DIExpression(), !2277)
  %add4 = add i32 %pos.addr.0, %inlen.addr.0, !dbg !2314
  %cmp5 = icmp ult i32 %i.1, %add4, !dbg !2316
  br i1 %cmp5, label %for.body7, label %for.end19, !dbg !2317

for.body7:                                        ; preds = %for.cond3
  %incdec.ptr8 = getelementptr inbounds nuw i8, ptr %in.addr.2, i32 1, !dbg !2318
    #dbg_value(ptr %incdec.ptr8, !2280, !DIExpression(), !2277)
  %2 = load i8, ptr %in.addr.2, align 1, !dbg !2319
  %conv9 = zext i8 %2 to i64, !dbg !2320
  %rem10 = urem i32 %i.1, 8, !dbg !2321
  %mul11 = mul i32 8, %rem10, !dbg !2322
  %sh_prom12 = zext i32 %mul11 to i64, !dbg !2323
  %shl13 = shl i64 %conv9, %sh_prom12, !dbg !2323
  %div14 = udiv i32 %i.1, 8, !dbg !2324
  %arrayidx15 = getelementptr inbounds nuw i64, ptr %s, i32 %div14, !dbg !2325
  %3 = load i64, ptr %arrayidx15, align 8, !dbg !2326
  %xor16 = xor i64 %3, %shl13, !dbg !2326
  store i64 %xor16, ptr %arrayidx15, align 8, !dbg !2326
  br label %for.inc17, !dbg !2325

for.inc17:                                        ; preds = %for.body7
  %inc18 = add i32 %i.1, 1, !dbg !2327
    #dbg_value(i32 %inc18, !2285, !DIExpression(), !2277)
  br label %for.cond3, !dbg !2328, !llvm.loop !2329

for.end19:                                        ; preds = %for.cond3
  ret i32 %i.1, !dbg !2331
}

; Function Attrs: noinline nounwind optnone
define internal void @KeccakF1600_StatePermute(ptr noundef %state) #0 !dbg !2332 {
entry:
    #dbg_value(ptr %state, !2333, !DIExpression(), !2334)
  %arrayidx = getelementptr inbounds i64, ptr %state, i32 0, !dbg !2335
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2335
    #dbg_value(i64 %0, !2336, !DIExpression(), !2334)
  %arrayidx1 = getelementptr inbounds i64, ptr %state, i32 1, !dbg !2337
  %1 = load i64, ptr %arrayidx1, align 8, !dbg !2337
    #dbg_value(i64 %1, !2338, !DIExpression(), !2334)
  %arrayidx2 = getelementptr inbounds i64, ptr %state, i32 2, !dbg !2339
  %2 = load i64, ptr %arrayidx2, align 8, !dbg !2339
    #dbg_value(i64 %2, !2340, !DIExpression(), !2334)
  %arrayidx3 = getelementptr inbounds i64, ptr %state, i32 3, !dbg !2341
  %3 = load i64, ptr %arrayidx3, align 8, !dbg !2341
    #dbg_value(i64 %3, !2342, !DIExpression(), !2334)
  %arrayidx4 = getelementptr inbounds i64, ptr %state, i32 4, !dbg !2343
  %4 = load i64, ptr %arrayidx4, align 8, !dbg !2343
    #dbg_value(i64 %4, !2344, !DIExpression(), !2334)
  %arrayidx5 = getelementptr inbounds i64, ptr %state, i32 5, !dbg !2345
  %5 = load i64, ptr %arrayidx5, align 8, !dbg !2345
    #dbg_value(i64 %5, !2346, !DIExpression(), !2334)
  %arrayidx6 = getelementptr inbounds i64, ptr %state, i32 6, !dbg !2347
  %6 = load i64, ptr %arrayidx6, align 8, !dbg !2347
    #dbg_value(i64 %6, !2348, !DIExpression(), !2334)
  %arrayidx7 = getelementptr inbounds i64, ptr %state, i32 7, !dbg !2349
  %7 = load i64, ptr %arrayidx7, align 8, !dbg !2349
    #dbg_value(i64 %7, !2350, !DIExpression(), !2334)
  %arrayidx8 = getelementptr inbounds i64, ptr %state, i32 8, !dbg !2351
  %8 = load i64, ptr %arrayidx8, align 8, !dbg !2351
    #dbg_value(i64 %8, !2352, !DIExpression(), !2334)
  %arrayidx9 = getelementptr inbounds i64, ptr %state, i32 9, !dbg !2353
  %9 = load i64, ptr %arrayidx9, align 8, !dbg !2353
    #dbg_value(i64 %9, !2354, !DIExpression(), !2334)
  %arrayidx10 = getelementptr inbounds i64, ptr %state, i32 10, !dbg !2355
  %10 = load i64, ptr %arrayidx10, align 8, !dbg !2355
    #dbg_value(i64 %10, !2356, !DIExpression(), !2334)
  %arrayidx11 = getelementptr inbounds i64, ptr %state, i32 11, !dbg !2357
  %11 = load i64, ptr %arrayidx11, align 8, !dbg !2357
    #dbg_value(i64 %11, !2358, !DIExpression(), !2334)
  %arrayidx12 = getelementptr inbounds i64, ptr %state, i32 12, !dbg !2359
  %12 = load i64, ptr %arrayidx12, align 8, !dbg !2359
    #dbg_value(i64 %12, !2360, !DIExpression(), !2334)
  %arrayidx13 = getelementptr inbounds i64, ptr %state, i32 13, !dbg !2361
  %13 = load i64, ptr %arrayidx13, align 8, !dbg !2361
    #dbg_value(i64 %13, !2362, !DIExpression(), !2334)
  %arrayidx14 = getelementptr inbounds i64, ptr %state, i32 14, !dbg !2363
  %14 = load i64, ptr %arrayidx14, align 8, !dbg !2363
    #dbg_value(i64 %14, !2364, !DIExpression(), !2334)
  %arrayidx15 = getelementptr inbounds i64, ptr %state, i32 15, !dbg !2365
  %15 = load i64, ptr %arrayidx15, align 8, !dbg !2365
    #dbg_value(i64 %15, !2366, !DIExpression(), !2334)
  %arrayidx16 = getelementptr inbounds i64, ptr %state, i32 16, !dbg !2367
  %16 = load i64, ptr %arrayidx16, align 8, !dbg !2367
    #dbg_value(i64 %16, !2368, !DIExpression(), !2334)
  %arrayidx17 = getelementptr inbounds i64, ptr %state, i32 17, !dbg !2369
  %17 = load i64, ptr %arrayidx17, align 8, !dbg !2369
    #dbg_value(i64 %17, !2370, !DIExpression(), !2334)
  %arrayidx18 = getelementptr inbounds i64, ptr %state, i32 18, !dbg !2371
  %18 = load i64, ptr %arrayidx18, align 8, !dbg !2371
    #dbg_value(i64 %18, !2372, !DIExpression(), !2334)
  %arrayidx19 = getelementptr inbounds i64, ptr %state, i32 19, !dbg !2373
  %19 = load i64, ptr %arrayidx19, align 8, !dbg !2373
    #dbg_value(i64 %19, !2374, !DIExpression(), !2334)
  %arrayidx20 = getelementptr inbounds i64, ptr %state, i32 20, !dbg !2375
  %20 = load i64, ptr %arrayidx20, align 8, !dbg !2375
    #dbg_value(i64 %20, !2376, !DIExpression(), !2334)
  %arrayidx21 = getelementptr inbounds i64, ptr %state, i32 21, !dbg !2377
  %21 = load i64, ptr %arrayidx21, align 8, !dbg !2377
    #dbg_value(i64 %21, !2378, !DIExpression(), !2334)
  %arrayidx22 = getelementptr inbounds i64, ptr %state, i32 22, !dbg !2379
  %22 = load i64, ptr %arrayidx22, align 8, !dbg !2379
    #dbg_value(i64 %22, !2380, !DIExpression(), !2334)
  %arrayidx23 = getelementptr inbounds i64, ptr %state, i32 23, !dbg !2381
  %23 = load i64, ptr %arrayidx23, align 8, !dbg !2381
    #dbg_value(i64 %23, !2382, !DIExpression(), !2334)
  %arrayidx24 = getelementptr inbounds i64, ptr %state, i32 24, !dbg !2383
  %24 = load i64, ptr %arrayidx24, align 8, !dbg !2383
    #dbg_value(i64 %24, !2384, !DIExpression(), !2334)
    #dbg_value(i32 0, !2385, !DIExpression(), !2334)
  br label %for.cond, !dbg !2386

for.cond:                                         ; preds = %for.inc, %entry
  %Aso.0 = phi i64 [ %23, %entry ], [ %xor444, %for.inc ], !dbg !2334
  %Asi.0 = phi i64 [ %22, %entry ], [ %xor441, %for.inc ], !dbg !2334
  %Ase.0 = phi i64 [ %21, %entry ], [ %xor438, %for.inc ], !dbg !2334
  %Asa.0 = phi i64 [ %20, %entry ], [ %xor435, %for.inc ], !dbg !2334
  %Amu.0 = phi i64 [ %19, %entry ], [ %xor412, %for.inc ], !dbg !2334
  %Amo.0 = phi i64 [ %18, %entry ], [ %xor409, %for.inc ], !dbg !2334
  %Ami.0 = phi i64 [ %17, %entry ], [ %xor406, %for.inc ], !dbg !2334
  %Ame.0 = phi i64 [ %16, %entry ], [ %xor403, %for.inc ], !dbg !2334
  %Ama.0 = phi i64 [ %15, %entry ], [ %xor400, %for.inc ], !dbg !2334
  %Aku.0 = phi i64 [ %14, %entry ], [ %xor377, %for.inc ], !dbg !2334
  %Ako.0 = phi i64 [ %13, %entry ], [ %xor374, %for.inc ], !dbg !2334
  %Aki.0 = phi i64 [ %12, %entry ], [ %xor371, %for.inc ], !dbg !2334
  %Ake.0 = phi i64 [ %11, %entry ], [ %xor368, %for.inc ], !dbg !2334
  %Aka.0 = phi i64 [ %10, %entry ], [ %xor365, %for.inc ], !dbg !2334
  %Agu.0 = phi i64 [ %9, %entry ], [ %xor342, %for.inc ], !dbg !2334
  %Ago.0 = phi i64 [ %8, %entry ], [ %xor339, %for.inc ], !dbg !2334
  %Agi.0 = phi i64 [ %7, %entry ], [ %xor336, %for.inc ], !dbg !2334
  %Age.0 = phi i64 [ %6, %entry ], [ %xor333, %for.inc ], !dbg !2334
  %Aga.0 = phi i64 [ %5, %entry ], [ %xor330, %for.inc ], !dbg !2334
  %Abu.0 = phi i64 [ %4, %entry ], [ %xor307, %for.inc ], !dbg !2334
  %Abo.0 = phi i64 [ %3, %entry ], [ %xor304, %for.inc ], !dbg !2334
  %Abi.0 = phi i64 [ %2, %entry ], [ %xor301, %for.inc ], !dbg !2334
  %Abe.0 = phi i64 [ %1, %entry ], [ %xor298, %for.inc ], !dbg !2334
  %Aba.0 = phi i64 [ %0, %entry ], [ %xor295, %for.inc ], !dbg !2334
  %round.0 = phi i32 [ 0, %entry ], [ %add448, %for.inc ], !dbg !2388
  %Asu.0 = phi i64 [ %24, %entry ], [ %xor447, %for.inc ], !dbg !2334
    #dbg_value(i64 %Asu.0, !2384, !DIExpression(), !2334)
    #dbg_value(i32 %round.0, !2385, !DIExpression(), !2334)
    #dbg_value(i64 %Aba.0, !2336, !DIExpression(), !2334)
    #dbg_value(i64 %Abe.0, !2338, !DIExpression(), !2334)
    #dbg_value(i64 %Abi.0, !2340, !DIExpression(), !2334)
    #dbg_value(i64 %Abo.0, !2342, !DIExpression(), !2334)
    #dbg_value(i64 %Abu.0, !2344, !DIExpression(), !2334)
    #dbg_value(i64 %Aga.0, !2346, !DIExpression(), !2334)
    #dbg_value(i64 %Age.0, !2348, !DIExpression(), !2334)
    #dbg_value(i64 %Agi.0, !2350, !DIExpression(), !2334)
    #dbg_value(i64 %Ago.0, !2352, !DIExpression(), !2334)
    #dbg_value(i64 %Agu.0, !2354, !DIExpression(), !2334)
    #dbg_value(i64 %Aka.0, !2356, !DIExpression(), !2334)
    #dbg_value(i64 %Ake.0, !2358, !DIExpression(), !2334)
    #dbg_value(i64 %Aki.0, !2360, !DIExpression(), !2334)
    #dbg_value(i64 %Ako.0, !2362, !DIExpression(), !2334)
    #dbg_value(i64 %Aku.0, !2364, !DIExpression(), !2334)
    #dbg_value(i64 %Ama.0, !2366, !DIExpression(), !2334)
    #dbg_value(i64 %Ame.0, !2368, !DIExpression(), !2334)
    #dbg_value(i64 %Ami.0, !2370, !DIExpression(), !2334)
    #dbg_value(i64 %Amo.0, !2372, !DIExpression(), !2334)
    #dbg_value(i64 %Amu.0, !2374, !DIExpression(), !2334)
    #dbg_value(i64 %Asa.0, !2376, !DIExpression(), !2334)
    #dbg_value(i64 %Ase.0, !2378, !DIExpression(), !2334)
    #dbg_value(i64 %Asi.0, !2380, !DIExpression(), !2334)
    #dbg_value(i64 %Aso.0, !2382, !DIExpression(), !2334)
  %cmp = icmp slt i32 %round.0, 24, !dbg !2389
  br i1 %cmp, label %for.body, label %for.end, !dbg !2391

for.body:                                         ; preds = %for.cond
  %xor = xor i64 %Aba.0, %Aga.0, !dbg !2392
  %xor25 = xor i64 %xor, %Aka.0, !dbg !2394
  %xor26 = xor i64 %xor25, %Ama.0, !dbg !2395
  %xor27 = xor i64 %xor26, %Asa.0, !dbg !2396
    #dbg_value(i64 %xor27, !2397, !DIExpression(), !2334)
  %xor28 = xor i64 %Abe.0, %Age.0, !dbg !2398
  %xor29 = xor i64 %xor28, %Ake.0, !dbg !2399
  %xor30 = xor i64 %xor29, %Ame.0, !dbg !2400
  %xor31 = xor i64 %xor30, %Ase.0, !dbg !2401
    #dbg_value(i64 %xor31, !2402, !DIExpression(), !2334)
  %xor32 = xor i64 %Abi.0, %Agi.0, !dbg !2403
  %xor33 = xor i64 %xor32, %Aki.0, !dbg !2404
  %xor34 = xor i64 %xor33, %Ami.0, !dbg !2405
  %xor35 = xor i64 %xor34, %Asi.0, !dbg !2406
    #dbg_value(i64 %xor35, !2407, !DIExpression(), !2334)
  %xor36 = xor i64 %Abo.0, %Ago.0, !dbg !2408
  %xor37 = xor i64 %xor36, %Ako.0, !dbg !2409
  %xor38 = xor i64 %xor37, %Amo.0, !dbg !2410
  %xor39 = xor i64 %xor38, %Aso.0, !dbg !2411
    #dbg_value(i64 %xor39, !2412, !DIExpression(), !2334)
  %xor40 = xor i64 %Abu.0, %Agu.0, !dbg !2413
  %xor41 = xor i64 %xor40, %Aku.0, !dbg !2414
  %xor42 = xor i64 %xor41, %Amu.0, !dbg !2415
  %xor43 = xor i64 %xor42, %Asu.0, !dbg !2416
    #dbg_value(i64 %xor43, !2417, !DIExpression(), !2334)
  %shl = shl i64 %xor31, 1, !dbg !2418
  %shr = lshr i64 %xor31, 63, !dbg !2418
  %xor44 = xor i64 %shl, %shr, !dbg !2418
  %xor45 = xor i64 %xor43, %xor44, !dbg !2419
    #dbg_value(i64 %xor45, !2420, !DIExpression(), !2334)
  %shl46 = shl i64 %xor35, 1, !dbg !2421
  %shr47 = lshr i64 %xor35, 63, !dbg !2421
  %xor48 = xor i64 %shl46, %shr47, !dbg !2421
  %xor49 = xor i64 %xor27, %xor48, !dbg !2422
    #dbg_value(i64 %xor49, !2423, !DIExpression(), !2334)
  %shl50 = shl i64 %xor39, 1, !dbg !2424
  %shr51 = lshr i64 %xor39, 63, !dbg !2424
  %xor52 = xor i64 %shl50, %shr51, !dbg !2424
  %xor53 = xor i64 %xor31, %xor52, !dbg !2425
    #dbg_value(i64 %xor53, !2426, !DIExpression(), !2334)
  %shl54 = shl i64 %xor43, 1, !dbg !2427
  %shr55 = lshr i64 %xor43, 63, !dbg !2427
  %xor56 = xor i64 %shl54, %shr55, !dbg !2427
  %xor57 = xor i64 %xor35, %xor56, !dbg !2428
    #dbg_value(i64 %xor57, !2429, !DIExpression(), !2334)
  %shl58 = shl i64 %xor27, 1, !dbg !2430
  %shr59 = lshr i64 %xor27, 63, !dbg !2430
  %xor60 = xor i64 %shl58, %shr59, !dbg !2430
  %xor61 = xor i64 %xor39, %xor60, !dbg !2431
    #dbg_value(i64 %xor61, !2432, !DIExpression(), !2334)
  %xor62 = xor i64 %Aba.0, %xor45, !dbg !2433
    #dbg_value(i64 %xor62, !2336, !DIExpression(), !2334)
    #dbg_value(i64 %xor62, !2397, !DIExpression(), !2334)
  %xor63 = xor i64 %Age.0, %xor49, !dbg !2434
    #dbg_value(i64 %xor63, !2348, !DIExpression(), !2334)
  %shl64 = shl i64 %xor63, 44, !dbg !2435
  %shr65 = lshr i64 %xor63, 20, !dbg !2435
  %xor66 = xor i64 %shl64, %shr65, !dbg !2435
    #dbg_value(i64 %xor66, !2402, !DIExpression(), !2334)
  %xor67 = xor i64 %Aki.0, %xor53, !dbg !2436
    #dbg_value(i64 %xor67, !2360, !DIExpression(), !2334)
  %shl68 = shl i64 %xor67, 43, !dbg !2437
  %shr69 = lshr i64 %xor67, 21, !dbg !2437
  %xor70 = xor i64 %shl68, %shr69, !dbg !2437
    #dbg_value(i64 %xor70, !2407, !DIExpression(), !2334)
  %xor71 = xor i64 %Amo.0, %xor57, !dbg !2438
    #dbg_value(i64 %xor71, !2372, !DIExpression(), !2334)
  %shl72 = shl i64 %xor71, 21, !dbg !2439
  %shr73 = lshr i64 %xor71, 43, !dbg !2439
  %xor74 = xor i64 %shl72, %shr73, !dbg !2439
    #dbg_value(i64 %xor74, !2412, !DIExpression(), !2334)
  %xor75 = xor i64 %Asu.0, %xor61, !dbg !2440
    #dbg_value(i64 %xor75, !2384, !DIExpression(), !2334)
  %shl76 = shl i64 %xor75, 14, !dbg !2441
  %shr77 = lshr i64 %xor75, 50, !dbg !2441
  %xor78 = xor i64 %shl76, %shr77, !dbg !2441
    #dbg_value(i64 %xor78, !2417, !DIExpression(), !2334)
  %not = xor i64 %xor66, -1, !dbg !2442
  %and = and i64 %not, %xor70, !dbg !2443
  %xor79 = xor i64 %xor62, %and, !dbg !2444
    #dbg_value(i64 %xor79, !2445, !DIExpression(), !2334)
  %arrayidx80 = getelementptr inbounds [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %round.0, !dbg !2446
  %25 = load i64, ptr %arrayidx80, align 8, !dbg !2446
  %xor81 = xor i64 %xor79, %25, !dbg !2447
    #dbg_value(i64 %xor81, !2445, !DIExpression(), !2334)
  %not82 = xor i64 %xor70, -1, !dbg !2448
  %and83 = and i64 %not82, %xor74, !dbg !2449
  %xor84 = xor i64 %xor66, %and83, !dbg !2450
    #dbg_value(i64 %xor84, !2451, !DIExpression(), !2334)
  %not85 = xor i64 %xor74, -1, !dbg !2452
  %and86 = and i64 %not85, %xor78, !dbg !2453
  %xor87 = xor i64 %xor70, %and86, !dbg !2454
    #dbg_value(i64 %xor87, !2455, !DIExpression(), !2334)
  %not88 = xor i64 %xor78, -1, !dbg !2456
  %and89 = and i64 %not88, %xor62, !dbg !2457
  %xor90 = xor i64 %xor74, %and89, !dbg !2458
    #dbg_value(i64 %xor90, !2459, !DIExpression(), !2334)
  %not91 = xor i64 %xor62, -1, !dbg !2460
  %and92 = and i64 %not91, %xor66, !dbg !2461
  %xor93 = xor i64 %xor78, %and92, !dbg !2462
    #dbg_value(i64 %xor93, !2463, !DIExpression(), !2334)
  %xor94 = xor i64 %Abo.0, %xor57, !dbg !2464
    #dbg_value(i64 %xor94, !2342, !DIExpression(), !2334)
  %shl95 = shl i64 %xor94, 28, !dbg !2465
  %shr96 = lshr i64 %xor94, 36, !dbg !2465
  %xor97 = xor i64 %shl95, %shr96, !dbg !2465
    #dbg_value(i64 %xor97, !2397, !DIExpression(), !2334)
  %xor98 = xor i64 %Agu.0, %xor61, !dbg !2466
    #dbg_value(i64 %xor98, !2354, !DIExpression(), !2334)
  %shl99 = shl i64 %xor98, 20, !dbg !2467
  %shr100 = lshr i64 %xor98, 44, !dbg !2467
  %xor101 = xor i64 %shl99, %shr100, !dbg !2467
    #dbg_value(i64 %xor101, !2402, !DIExpression(), !2334)
  %xor102 = xor i64 %Aka.0, %xor45, !dbg !2468
    #dbg_value(i64 %xor102, !2356, !DIExpression(), !2334)
  %shl103 = shl i64 %xor102, 3, !dbg !2469
  %shr104 = lshr i64 %xor102, 61, !dbg !2469
  %xor105 = xor i64 %shl103, %shr104, !dbg !2469
    #dbg_value(i64 %xor105, !2407, !DIExpression(), !2334)
  %xor106 = xor i64 %Ame.0, %xor49, !dbg !2470
    #dbg_value(i64 %xor106, !2368, !DIExpression(), !2334)
  %shl107 = shl i64 %xor106, 45, !dbg !2471
  %shr108 = lshr i64 %xor106, 19, !dbg !2471
  %xor109 = xor i64 %shl107, %shr108, !dbg !2471
    #dbg_value(i64 %xor109, !2412, !DIExpression(), !2334)
  %xor110 = xor i64 %Asi.0, %xor53, !dbg !2472
    #dbg_value(i64 %xor110, !2380, !DIExpression(), !2334)
  %shl111 = shl i64 %xor110, 61, !dbg !2473
  %shr112 = lshr i64 %xor110, 3, !dbg !2473
  %xor113 = xor i64 %shl111, %shr112, !dbg !2473
    #dbg_value(i64 %xor113, !2417, !DIExpression(), !2334)
  %not114 = xor i64 %xor101, -1, !dbg !2474
  %and115 = and i64 %not114, %xor105, !dbg !2475
  %xor116 = xor i64 %xor97, %and115, !dbg !2476
    #dbg_value(i64 %xor116, !2477, !DIExpression(), !2334)
  %not117 = xor i64 %xor105, -1, !dbg !2478
  %and118 = and i64 %not117, %xor109, !dbg !2479
  %xor119 = xor i64 %xor101, %and118, !dbg !2480
    #dbg_value(i64 %xor119, !2481, !DIExpression(), !2334)
  %not120 = xor i64 %xor109, -1, !dbg !2482
  %and121 = and i64 %not120, %xor113, !dbg !2483
  %xor122 = xor i64 %xor105, %and121, !dbg !2484
    #dbg_value(i64 %xor122, !2485, !DIExpression(), !2334)
  %not123 = xor i64 %xor113, -1, !dbg !2486
  %and124 = and i64 %not123, %xor97, !dbg !2487
  %xor125 = xor i64 %xor109, %and124, !dbg !2488
    #dbg_value(i64 %xor125, !2489, !DIExpression(), !2334)
  %not126 = xor i64 %xor97, -1, !dbg !2490
  %and127 = and i64 %not126, %xor101, !dbg !2491
  %xor128 = xor i64 %xor113, %and127, !dbg !2492
    #dbg_value(i64 %xor128, !2493, !DIExpression(), !2334)
  %xor129 = xor i64 %Abe.0, %xor49, !dbg !2494
    #dbg_value(i64 %xor129, !2338, !DIExpression(), !2334)
  %shl130 = shl i64 %xor129, 1, !dbg !2495
  %shr131 = lshr i64 %xor129, 63, !dbg !2495
  %xor132 = xor i64 %shl130, %shr131, !dbg !2495
    #dbg_value(i64 %xor132, !2397, !DIExpression(), !2334)
  %xor133 = xor i64 %Agi.0, %xor53, !dbg !2496
    #dbg_value(i64 %xor133, !2350, !DIExpression(), !2334)
  %shl134 = shl i64 %xor133, 6, !dbg !2497
  %shr135 = lshr i64 %xor133, 58, !dbg !2497
  %xor136 = xor i64 %shl134, %shr135, !dbg !2497
    #dbg_value(i64 %xor136, !2402, !DIExpression(), !2334)
  %xor137 = xor i64 %Ako.0, %xor57, !dbg !2498
    #dbg_value(i64 %xor137, !2362, !DIExpression(), !2334)
  %shl138 = shl i64 %xor137, 25, !dbg !2499
  %shr139 = lshr i64 %xor137, 39, !dbg !2499
  %xor140 = xor i64 %shl138, %shr139, !dbg !2499
    #dbg_value(i64 %xor140, !2407, !DIExpression(), !2334)
  %xor141 = xor i64 %Amu.0, %xor61, !dbg !2500
    #dbg_value(i64 %xor141, !2374, !DIExpression(), !2334)
  %shl142 = shl i64 %xor141, 8, !dbg !2501
  %shr143 = lshr i64 %xor141, 56, !dbg !2501
  %xor144 = xor i64 %shl142, %shr143, !dbg !2501
    #dbg_value(i64 %xor144, !2412, !DIExpression(), !2334)
  %xor145 = xor i64 %Asa.0, %xor45, !dbg !2502
    #dbg_value(i64 %xor145, !2376, !DIExpression(), !2334)
  %shl146 = shl i64 %xor145, 18, !dbg !2503
  %shr147 = lshr i64 %xor145, 46, !dbg !2503
  %xor148 = xor i64 %shl146, %shr147, !dbg !2503
    #dbg_value(i64 %xor148, !2417, !DIExpression(), !2334)
  %not149 = xor i64 %xor136, -1, !dbg !2504
  %and150 = and i64 %not149, %xor140, !dbg !2505
  %xor151 = xor i64 %xor132, %and150, !dbg !2506
    #dbg_value(i64 %xor151, !2507, !DIExpression(), !2334)
  %not152 = xor i64 %xor140, -1, !dbg !2508
  %and153 = and i64 %not152, %xor144, !dbg !2509
  %xor154 = xor i64 %xor136, %and153, !dbg !2510
    #dbg_value(i64 %xor154, !2511, !DIExpression(), !2334)
  %not155 = xor i64 %xor144, -1, !dbg !2512
  %and156 = and i64 %not155, %xor148, !dbg !2513
  %xor157 = xor i64 %xor140, %and156, !dbg !2514
    #dbg_value(i64 %xor157, !2515, !DIExpression(), !2334)
  %not158 = xor i64 %xor148, -1, !dbg !2516
  %and159 = and i64 %not158, %xor132, !dbg !2517
  %xor160 = xor i64 %xor144, %and159, !dbg !2518
    #dbg_value(i64 %xor160, !2519, !DIExpression(), !2334)
  %not161 = xor i64 %xor132, -1, !dbg !2520
  %and162 = and i64 %not161, %xor136, !dbg !2521
  %xor163 = xor i64 %xor148, %and162, !dbg !2522
    #dbg_value(i64 %xor163, !2523, !DIExpression(), !2334)
  %xor164 = xor i64 %Abu.0, %xor61, !dbg !2524
    #dbg_value(i64 %xor164, !2344, !DIExpression(), !2334)
  %shl165 = shl i64 %xor164, 27, !dbg !2525
  %shr166 = lshr i64 %xor164, 37, !dbg !2525
  %xor167 = xor i64 %shl165, %shr166, !dbg !2525
    #dbg_value(i64 %xor167, !2397, !DIExpression(), !2334)
  %xor168 = xor i64 %Aga.0, %xor45, !dbg !2526
    #dbg_value(i64 %xor168, !2346, !DIExpression(), !2334)
  %shl169 = shl i64 %xor168, 36, !dbg !2527
  %shr170 = lshr i64 %xor168, 28, !dbg !2527
  %xor171 = xor i64 %shl169, %shr170, !dbg !2527
    #dbg_value(i64 %xor171, !2402, !DIExpression(), !2334)
  %xor172 = xor i64 %Ake.0, %xor49, !dbg !2528
    #dbg_value(i64 %xor172, !2358, !DIExpression(), !2334)
  %shl173 = shl i64 %xor172, 10, !dbg !2529
  %shr174 = lshr i64 %xor172, 54, !dbg !2529
  %xor175 = xor i64 %shl173, %shr174, !dbg !2529
    #dbg_value(i64 %xor175, !2407, !DIExpression(), !2334)
  %xor176 = xor i64 %Ami.0, %xor53, !dbg !2530
    #dbg_value(i64 %xor176, !2370, !DIExpression(), !2334)
  %shl177 = shl i64 %xor176, 15, !dbg !2531
  %shr178 = lshr i64 %xor176, 49, !dbg !2531
  %xor179 = xor i64 %shl177, %shr178, !dbg !2531
    #dbg_value(i64 %xor179, !2412, !DIExpression(), !2334)
  %xor180 = xor i64 %Aso.0, %xor57, !dbg !2532
    #dbg_value(i64 %xor180, !2382, !DIExpression(), !2334)
  %shl181 = shl i64 %xor180, 56, !dbg !2533
  %shr182 = lshr i64 %xor180, 8, !dbg !2533
  %xor183 = xor i64 %shl181, %shr182, !dbg !2533
    #dbg_value(i64 %xor183, !2417, !DIExpression(), !2334)
  %not184 = xor i64 %xor171, -1, !dbg !2534
  %and185 = and i64 %not184, %xor175, !dbg !2535
  %xor186 = xor i64 %xor167, %and185, !dbg !2536
    #dbg_value(i64 %xor186, !2537, !DIExpression(), !2334)
  %not187 = xor i64 %xor175, -1, !dbg !2538
  %and188 = and i64 %not187, %xor179, !dbg !2539
  %xor189 = xor i64 %xor171, %and188, !dbg !2540
    #dbg_value(i64 %xor189, !2541, !DIExpression(), !2334)
  %not190 = xor i64 %xor179, -1, !dbg !2542
  %and191 = and i64 %not190, %xor183, !dbg !2543
  %xor192 = xor i64 %xor175, %and191, !dbg !2544
    #dbg_value(i64 %xor192, !2545, !DIExpression(), !2334)
  %not193 = xor i64 %xor183, -1, !dbg !2546
  %and194 = and i64 %not193, %xor167, !dbg !2547
  %xor195 = xor i64 %xor179, %and194, !dbg !2548
    #dbg_value(i64 %xor195, !2549, !DIExpression(), !2334)
  %not196 = xor i64 %xor167, -1, !dbg !2550
  %and197 = and i64 %not196, %xor171, !dbg !2551
  %xor198 = xor i64 %xor183, %and197, !dbg !2552
    #dbg_value(i64 %xor198, !2553, !DIExpression(), !2334)
  %xor199 = xor i64 %Abi.0, %xor53, !dbg !2554
    #dbg_value(i64 %xor199, !2340, !DIExpression(), !2334)
  %shl200 = shl i64 %xor199, 62, !dbg !2555
  %shr201 = lshr i64 %xor199, 2, !dbg !2555
  %xor202 = xor i64 %shl200, %shr201, !dbg !2555
    #dbg_value(i64 %xor202, !2397, !DIExpression(), !2334)
  %xor203 = xor i64 %Ago.0, %xor57, !dbg !2556
    #dbg_value(i64 %xor203, !2352, !DIExpression(), !2334)
  %shl204 = shl i64 %xor203, 55, !dbg !2557
  %shr205 = lshr i64 %xor203, 9, !dbg !2557
  %xor206 = xor i64 %shl204, %shr205, !dbg !2557
    #dbg_value(i64 %xor206, !2402, !DIExpression(), !2334)
  %xor207 = xor i64 %Aku.0, %xor61, !dbg !2558
    #dbg_value(i64 %xor207, !2364, !DIExpression(), !2334)
  %shl208 = shl i64 %xor207, 39, !dbg !2559
  %shr209 = lshr i64 %xor207, 25, !dbg !2559
  %xor210 = xor i64 %shl208, %shr209, !dbg !2559
    #dbg_value(i64 %xor210, !2407, !DIExpression(), !2334)
  %xor211 = xor i64 %Ama.0, %xor45, !dbg !2560
    #dbg_value(i64 %xor211, !2366, !DIExpression(), !2334)
  %shl212 = shl i64 %xor211, 41, !dbg !2561
  %shr213 = lshr i64 %xor211, 23, !dbg !2561
  %xor214 = xor i64 %shl212, %shr213, !dbg !2561
    #dbg_value(i64 %xor214, !2412, !DIExpression(), !2334)
  %xor215 = xor i64 %Ase.0, %xor49, !dbg !2562
    #dbg_value(i64 %xor215, !2378, !DIExpression(), !2334)
  %shl216 = shl i64 %xor215, 2, !dbg !2563
  %shr217 = lshr i64 %xor215, 62, !dbg !2563
  %xor218 = xor i64 %shl216, %shr217, !dbg !2563
    #dbg_value(i64 %xor218, !2417, !DIExpression(), !2334)
  %not219 = xor i64 %xor206, -1, !dbg !2564
  %and220 = and i64 %not219, %xor210, !dbg !2565
  %xor221 = xor i64 %xor202, %and220, !dbg !2566
    #dbg_value(i64 %xor221, !2567, !DIExpression(), !2334)
  %not222 = xor i64 %xor210, -1, !dbg !2568
  %and223 = and i64 %not222, %xor214, !dbg !2569
  %xor224 = xor i64 %xor206, %and223, !dbg !2570
    #dbg_value(i64 %xor224, !2571, !DIExpression(), !2334)
  %not225 = xor i64 %xor214, -1, !dbg !2572
  %and226 = and i64 %not225, %xor218, !dbg !2573
  %xor227 = xor i64 %xor210, %and226, !dbg !2574
    #dbg_value(i64 %xor227, !2575, !DIExpression(), !2334)
  %not228 = xor i64 %xor218, -1, !dbg !2576
  %and229 = and i64 %not228, %xor202, !dbg !2577
  %xor230 = xor i64 %xor214, %and229, !dbg !2578
    #dbg_value(i64 %xor230, !2579, !DIExpression(), !2334)
  %not231 = xor i64 %xor202, -1, !dbg !2580
  %and232 = and i64 %not231, %xor206, !dbg !2581
  %xor233 = xor i64 %xor218, %and232, !dbg !2582
    #dbg_value(i64 %xor233, !2583, !DIExpression(), !2334)
  %xor234 = xor i64 %xor81, %xor116, !dbg !2584
  %xor235 = xor i64 %xor234, %xor151, !dbg !2585
  %xor236 = xor i64 %xor235, %xor186, !dbg !2586
  %xor237 = xor i64 %xor236, %xor221, !dbg !2587
    #dbg_value(i64 %xor237, !2397, !DIExpression(), !2334)
  %xor238 = xor i64 %xor84, %xor119, !dbg !2588
  %xor239 = xor i64 %xor238, %xor154, !dbg !2589
  %xor240 = xor i64 %xor239, %xor189, !dbg !2590
  %xor241 = xor i64 %xor240, %xor224, !dbg !2591
    #dbg_value(i64 %xor241, !2402, !DIExpression(), !2334)
  %xor242 = xor i64 %xor87, %xor122, !dbg !2592
  %xor243 = xor i64 %xor242, %xor157, !dbg !2593
  %xor244 = xor i64 %xor243, %xor192, !dbg !2594
  %xor245 = xor i64 %xor244, %xor227, !dbg !2595
    #dbg_value(i64 %xor245, !2407, !DIExpression(), !2334)
  %xor246 = xor i64 %xor90, %xor125, !dbg !2596
  %xor247 = xor i64 %xor246, %xor160, !dbg !2597
  %xor248 = xor i64 %xor247, %xor195, !dbg !2598
  %xor249 = xor i64 %xor248, %xor230, !dbg !2599
    #dbg_value(i64 %xor249, !2412, !DIExpression(), !2334)
  %xor250 = xor i64 %xor93, %xor128, !dbg !2600
  %xor251 = xor i64 %xor250, %xor163, !dbg !2601
  %xor252 = xor i64 %xor251, %xor198, !dbg !2602
  %xor253 = xor i64 %xor252, %xor233, !dbg !2603
    #dbg_value(i64 %xor253, !2417, !DIExpression(), !2334)
  %shl254 = shl i64 %xor241, 1, !dbg !2604
  %shr255 = lshr i64 %xor241, 63, !dbg !2604
  %xor256 = xor i64 %shl254, %shr255, !dbg !2604
  %xor257 = xor i64 %xor253, %xor256, !dbg !2605
    #dbg_value(i64 %xor257, !2420, !DIExpression(), !2334)
  %shl258 = shl i64 %xor245, 1, !dbg !2606
  %shr259 = lshr i64 %xor245, 63, !dbg !2606
  %xor260 = xor i64 %shl258, %shr259, !dbg !2606
  %xor261 = xor i64 %xor237, %xor260, !dbg !2607
    #dbg_value(i64 %xor261, !2423, !DIExpression(), !2334)
  %shl262 = shl i64 %xor249, 1, !dbg !2608
  %shr263 = lshr i64 %xor249, 63, !dbg !2608
  %xor264 = xor i64 %shl262, %shr263, !dbg !2608
  %xor265 = xor i64 %xor241, %xor264, !dbg !2609
    #dbg_value(i64 %xor265, !2426, !DIExpression(), !2334)
  %shl266 = shl i64 %xor253, 1, !dbg !2610
  %shr267 = lshr i64 %xor253, 63, !dbg !2610
  %xor268 = xor i64 %shl266, %shr267, !dbg !2610
  %xor269 = xor i64 %xor245, %xor268, !dbg !2611
    #dbg_value(i64 %xor269, !2429, !DIExpression(), !2334)
  %shl270 = shl i64 %xor237, 1, !dbg !2612
  %shr271 = lshr i64 %xor237, 63, !dbg !2612
  %xor272 = xor i64 %shl270, %shr271, !dbg !2612
  %xor273 = xor i64 %xor249, %xor272, !dbg !2613
    #dbg_value(i64 %xor273, !2432, !DIExpression(), !2334)
  %xor274 = xor i64 %xor81, %xor257, !dbg !2614
    #dbg_value(i64 %xor274, !2445, !DIExpression(), !2334)
    #dbg_value(i64 %xor274, !2397, !DIExpression(), !2334)
  %xor275 = xor i64 %xor119, %xor261, !dbg !2615
    #dbg_value(i64 %xor275, !2481, !DIExpression(), !2334)
  %shl276 = shl i64 %xor275, 44, !dbg !2616
  %shr277 = lshr i64 %xor275, 20, !dbg !2616
  %xor278 = xor i64 %shl276, %shr277, !dbg !2616
    #dbg_value(i64 %xor278, !2402, !DIExpression(), !2334)
  %xor279 = xor i64 %xor157, %xor265, !dbg !2617
    #dbg_value(i64 %xor279, !2515, !DIExpression(), !2334)
  %shl280 = shl i64 %xor279, 43, !dbg !2618
  %shr281 = lshr i64 %xor279, 21, !dbg !2618
  %xor282 = xor i64 %shl280, %shr281, !dbg !2618
    #dbg_value(i64 %xor282, !2407, !DIExpression(), !2334)
  %xor283 = xor i64 %xor195, %xor269, !dbg !2619
    #dbg_value(i64 %xor283, !2549, !DIExpression(), !2334)
  %shl284 = shl i64 %xor283, 21, !dbg !2620
  %shr285 = lshr i64 %xor283, 43, !dbg !2620
  %xor286 = xor i64 %shl284, %shr285, !dbg !2620
    #dbg_value(i64 %xor286, !2412, !DIExpression(), !2334)
  %xor287 = xor i64 %xor233, %xor273, !dbg !2621
    #dbg_value(i64 %xor287, !2583, !DIExpression(), !2334)
  %shl288 = shl i64 %xor287, 14, !dbg !2622
  %shr289 = lshr i64 %xor287, 50, !dbg !2622
  %xor290 = xor i64 %shl288, %shr289, !dbg !2622
    #dbg_value(i64 %xor290, !2417, !DIExpression(), !2334)
  %not291 = xor i64 %xor278, -1, !dbg !2623
  %and292 = and i64 %not291, %xor282, !dbg !2624
  %xor293 = xor i64 %xor274, %and292, !dbg !2625
    #dbg_value(i64 %xor293, !2336, !DIExpression(), !2334)
  %add = add nsw i32 %round.0, 1, !dbg !2626
  %arrayidx294 = getelementptr inbounds [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %add, !dbg !2627
  %26 = load i64, ptr %arrayidx294, align 8, !dbg !2627
  %xor295 = xor i64 %xor293, %26, !dbg !2628
    #dbg_value(i64 %xor295, !2336, !DIExpression(), !2334)
  %not296 = xor i64 %xor282, -1, !dbg !2629
  %and297 = and i64 %not296, %xor286, !dbg !2630
  %xor298 = xor i64 %xor278, %and297, !dbg !2631
    #dbg_value(i64 %xor298, !2338, !DIExpression(), !2334)
  %not299 = xor i64 %xor286, -1, !dbg !2632
  %and300 = and i64 %not299, %xor290, !dbg !2633
  %xor301 = xor i64 %xor282, %and300, !dbg !2634
    #dbg_value(i64 %xor301, !2340, !DIExpression(), !2334)
  %not302 = xor i64 %xor290, -1, !dbg !2635
  %and303 = and i64 %not302, %xor274, !dbg !2636
  %xor304 = xor i64 %xor286, %and303, !dbg !2637
    #dbg_value(i64 %xor304, !2342, !DIExpression(), !2334)
  %not305 = xor i64 %xor274, -1, !dbg !2638
  %and306 = and i64 %not305, %xor278, !dbg !2639
  %xor307 = xor i64 %xor290, %and306, !dbg !2640
    #dbg_value(i64 %xor307, !2344, !DIExpression(), !2334)
  %xor308 = xor i64 %xor90, %xor269, !dbg !2641
    #dbg_value(i64 %xor308, !2459, !DIExpression(), !2334)
  %shl309 = shl i64 %xor308, 28, !dbg !2642
  %shr310 = lshr i64 %xor308, 36, !dbg !2642
  %xor311 = xor i64 %shl309, %shr310, !dbg !2642
    #dbg_value(i64 %xor311, !2397, !DIExpression(), !2334)
  %xor312 = xor i64 %xor128, %xor273, !dbg !2643
    #dbg_value(i64 %xor312, !2493, !DIExpression(), !2334)
  %shl313 = shl i64 %xor312, 20, !dbg !2644
  %shr314 = lshr i64 %xor312, 44, !dbg !2644
  %xor315 = xor i64 %shl313, %shr314, !dbg !2644
    #dbg_value(i64 %xor315, !2402, !DIExpression(), !2334)
  %xor316 = xor i64 %xor151, %xor257, !dbg !2645
    #dbg_value(i64 %xor316, !2507, !DIExpression(), !2334)
  %shl317 = shl i64 %xor316, 3, !dbg !2646
  %shr318 = lshr i64 %xor316, 61, !dbg !2646
  %xor319 = xor i64 %shl317, %shr318, !dbg !2646
    #dbg_value(i64 %xor319, !2407, !DIExpression(), !2334)
  %xor320 = xor i64 %xor189, %xor261, !dbg !2647
    #dbg_value(i64 %xor320, !2541, !DIExpression(), !2334)
  %shl321 = shl i64 %xor320, 45, !dbg !2648
  %shr322 = lshr i64 %xor320, 19, !dbg !2648
  %xor323 = xor i64 %shl321, %shr322, !dbg !2648
    #dbg_value(i64 %xor323, !2412, !DIExpression(), !2334)
  %xor324 = xor i64 %xor227, %xor265, !dbg !2649
    #dbg_value(i64 %xor324, !2575, !DIExpression(), !2334)
  %shl325 = shl i64 %xor324, 61, !dbg !2650
  %shr326 = lshr i64 %xor324, 3, !dbg !2650
  %xor327 = xor i64 %shl325, %shr326, !dbg !2650
    #dbg_value(i64 %xor327, !2417, !DIExpression(), !2334)
  %not328 = xor i64 %xor315, -1, !dbg !2651
  %and329 = and i64 %not328, %xor319, !dbg !2652
  %xor330 = xor i64 %xor311, %and329, !dbg !2653
    #dbg_value(i64 %xor330, !2346, !DIExpression(), !2334)
  %not331 = xor i64 %xor319, -1, !dbg !2654
  %and332 = and i64 %not331, %xor323, !dbg !2655
  %xor333 = xor i64 %xor315, %and332, !dbg !2656
    #dbg_value(i64 %xor333, !2348, !DIExpression(), !2334)
  %not334 = xor i64 %xor323, -1, !dbg !2657
  %and335 = and i64 %not334, %xor327, !dbg !2658
  %xor336 = xor i64 %xor319, %and335, !dbg !2659
    #dbg_value(i64 %xor336, !2350, !DIExpression(), !2334)
  %not337 = xor i64 %xor327, -1, !dbg !2660
  %and338 = and i64 %not337, %xor311, !dbg !2661
  %xor339 = xor i64 %xor323, %and338, !dbg !2662
    #dbg_value(i64 %xor339, !2352, !DIExpression(), !2334)
  %not340 = xor i64 %xor311, -1, !dbg !2663
  %and341 = and i64 %not340, %xor315, !dbg !2664
  %xor342 = xor i64 %xor327, %and341, !dbg !2665
    #dbg_value(i64 %xor342, !2354, !DIExpression(), !2334)
  %xor343 = xor i64 %xor84, %xor261, !dbg !2666
    #dbg_value(i64 %xor343, !2451, !DIExpression(), !2334)
  %shl344 = shl i64 %xor343, 1, !dbg !2667
  %shr345 = lshr i64 %xor343, 63, !dbg !2667
  %xor346 = xor i64 %shl344, %shr345, !dbg !2667
    #dbg_value(i64 %xor346, !2397, !DIExpression(), !2334)
  %xor347 = xor i64 %xor122, %xor265, !dbg !2668
    #dbg_value(i64 %xor347, !2485, !DIExpression(), !2334)
  %shl348 = shl i64 %xor347, 6, !dbg !2669
  %shr349 = lshr i64 %xor347, 58, !dbg !2669
  %xor350 = xor i64 %shl348, %shr349, !dbg !2669
    #dbg_value(i64 %xor350, !2402, !DIExpression(), !2334)
  %xor351 = xor i64 %xor160, %xor269, !dbg !2670
    #dbg_value(i64 %xor351, !2519, !DIExpression(), !2334)
  %shl352 = shl i64 %xor351, 25, !dbg !2671
  %shr353 = lshr i64 %xor351, 39, !dbg !2671
  %xor354 = xor i64 %shl352, %shr353, !dbg !2671
    #dbg_value(i64 %xor354, !2407, !DIExpression(), !2334)
  %xor355 = xor i64 %xor198, %xor273, !dbg !2672
    #dbg_value(i64 %xor355, !2553, !DIExpression(), !2334)
  %shl356 = shl i64 %xor355, 8, !dbg !2673
  %shr357 = lshr i64 %xor355, 56, !dbg !2673
  %xor358 = xor i64 %shl356, %shr357, !dbg !2673
    #dbg_value(i64 %xor358, !2412, !DIExpression(), !2334)
  %xor359 = xor i64 %xor221, %xor257, !dbg !2674
    #dbg_value(i64 %xor359, !2567, !DIExpression(), !2334)
  %shl360 = shl i64 %xor359, 18, !dbg !2675
  %shr361 = lshr i64 %xor359, 46, !dbg !2675
  %xor362 = xor i64 %shl360, %shr361, !dbg !2675
    #dbg_value(i64 %xor362, !2417, !DIExpression(), !2334)
  %not363 = xor i64 %xor350, -1, !dbg !2676
  %and364 = and i64 %not363, %xor354, !dbg !2677
  %xor365 = xor i64 %xor346, %and364, !dbg !2678
    #dbg_value(i64 %xor365, !2356, !DIExpression(), !2334)
  %not366 = xor i64 %xor354, -1, !dbg !2679
  %and367 = and i64 %not366, %xor358, !dbg !2680
  %xor368 = xor i64 %xor350, %and367, !dbg !2681
    #dbg_value(i64 %xor368, !2358, !DIExpression(), !2334)
  %not369 = xor i64 %xor358, -1, !dbg !2682
  %and370 = and i64 %not369, %xor362, !dbg !2683
  %xor371 = xor i64 %xor354, %and370, !dbg !2684
    #dbg_value(i64 %xor371, !2360, !DIExpression(), !2334)
  %not372 = xor i64 %xor362, -1, !dbg !2685
  %and373 = and i64 %not372, %xor346, !dbg !2686
  %xor374 = xor i64 %xor358, %and373, !dbg !2687
    #dbg_value(i64 %xor374, !2362, !DIExpression(), !2334)
  %not375 = xor i64 %xor346, -1, !dbg !2688
  %and376 = and i64 %not375, %xor350, !dbg !2689
  %xor377 = xor i64 %xor362, %and376, !dbg !2690
    #dbg_value(i64 %xor377, !2364, !DIExpression(), !2334)
  %xor378 = xor i64 %xor93, %xor273, !dbg !2691
    #dbg_value(i64 %xor378, !2463, !DIExpression(), !2334)
  %shl379 = shl i64 %xor378, 27, !dbg !2692
  %shr380 = lshr i64 %xor378, 37, !dbg !2692
  %xor381 = xor i64 %shl379, %shr380, !dbg !2692
    #dbg_value(i64 %xor381, !2397, !DIExpression(), !2334)
  %xor382 = xor i64 %xor116, %xor257, !dbg !2693
    #dbg_value(i64 %xor382, !2477, !DIExpression(), !2334)
  %shl383 = shl i64 %xor382, 36, !dbg !2694
  %shr384 = lshr i64 %xor382, 28, !dbg !2694
  %xor385 = xor i64 %shl383, %shr384, !dbg !2694
    #dbg_value(i64 %xor385, !2402, !DIExpression(), !2334)
  %xor386 = xor i64 %xor154, %xor261, !dbg !2695
    #dbg_value(i64 %xor386, !2511, !DIExpression(), !2334)
  %shl387 = shl i64 %xor386, 10, !dbg !2696
  %shr388 = lshr i64 %xor386, 54, !dbg !2696
  %xor389 = xor i64 %shl387, %shr388, !dbg !2696
    #dbg_value(i64 %xor389, !2407, !DIExpression(), !2334)
  %xor390 = xor i64 %xor192, %xor265, !dbg !2697
    #dbg_value(i64 %xor390, !2545, !DIExpression(), !2334)
  %shl391 = shl i64 %xor390, 15, !dbg !2698
  %shr392 = lshr i64 %xor390, 49, !dbg !2698
  %xor393 = xor i64 %shl391, %shr392, !dbg !2698
    #dbg_value(i64 %xor393, !2412, !DIExpression(), !2334)
  %xor394 = xor i64 %xor230, %xor269, !dbg !2699
    #dbg_value(i64 %xor394, !2579, !DIExpression(), !2334)
  %shl395 = shl i64 %xor394, 56, !dbg !2700
  %shr396 = lshr i64 %xor394, 8, !dbg !2700
  %xor397 = xor i64 %shl395, %shr396, !dbg !2700
    #dbg_value(i64 %xor397, !2417, !DIExpression(), !2334)
  %not398 = xor i64 %xor385, -1, !dbg !2701
  %and399 = and i64 %not398, %xor389, !dbg !2702
  %xor400 = xor i64 %xor381, %and399, !dbg !2703
    #dbg_value(i64 %xor400, !2366, !DIExpression(), !2334)
  %not401 = xor i64 %xor389, -1, !dbg !2704
  %and402 = and i64 %not401, %xor393, !dbg !2705
  %xor403 = xor i64 %xor385, %and402, !dbg !2706
    #dbg_value(i64 %xor403, !2368, !DIExpression(), !2334)
  %not404 = xor i64 %xor393, -1, !dbg !2707
  %and405 = and i64 %not404, %xor397, !dbg !2708
  %xor406 = xor i64 %xor389, %and405, !dbg !2709
    #dbg_value(i64 %xor406, !2370, !DIExpression(), !2334)
  %not407 = xor i64 %xor397, -1, !dbg !2710
  %and408 = and i64 %not407, %xor381, !dbg !2711
  %xor409 = xor i64 %xor393, %and408, !dbg !2712
    #dbg_value(i64 %xor409, !2372, !DIExpression(), !2334)
  %not410 = xor i64 %xor381, -1, !dbg !2713
  %and411 = and i64 %not410, %xor385, !dbg !2714
  %xor412 = xor i64 %xor397, %and411, !dbg !2715
    #dbg_value(i64 %xor412, !2374, !DIExpression(), !2334)
  %xor413 = xor i64 %xor87, %xor265, !dbg !2716
    #dbg_value(i64 %xor413, !2455, !DIExpression(), !2334)
  %shl414 = shl i64 %xor413, 62, !dbg !2717
  %shr415 = lshr i64 %xor413, 2, !dbg !2717
  %xor416 = xor i64 %shl414, %shr415, !dbg !2717
    #dbg_value(i64 %xor416, !2397, !DIExpression(), !2334)
  %xor417 = xor i64 %xor125, %xor269, !dbg !2718
    #dbg_value(i64 %xor417, !2489, !DIExpression(), !2334)
  %shl418 = shl i64 %xor417, 55, !dbg !2719
  %shr419 = lshr i64 %xor417, 9, !dbg !2719
  %xor420 = xor i64 %shl418, %shr419, !dbg !2719
    #dbg_value(i64 %xor420, !2402, !DIExpression(), !2334)
  %xor421 = xor i64 %xor163, %xor273, !dbg !2720
    #dbg_value(i64 %xor421, !2523, !DIExpression(), !2334)
  %shl422 = shl i64 %xor421, 39, !dbg !2721
  %shr423 = lshr i64 %xor421, 25, !dbg !2721
  %xor424 = xor i64 %shl422, %shr423, !dbg !2721
    #dbg_value(i64 %xor424, !2407, !DIExpression(), !2334)
  %xor425 = xor i64 %xor186, %xor257, !dbg !2722
    #dbg_value(i64 %xor425, !2537, !DIExpression(), !2334)
  %shl426 = shl i64 %xor425, 41, !dbg !2723
  %shr427 = lshr i64 %xor425, 23, !dbg !2723
  %xor428 = xor i64 %shl426, %shr427, !dbg !2723
    #dbg_value(i64 %xor428, !2412, !DIExpression(), !2334)
  %xor429 = xor i64 %xor224, %xor261, !dbg !2724
    #dbg_value(i64 %xor429, !2571, !DIExpression(), !2334)
  %shl430 = shl i64 %xor429, 2, !dbg !2725
  %shr431 = lshr i64 %xor429, 62, !dbg !2725
  %xor432 = xor i64 %shl430, %shr431, !dbg !2725
    #dbg_value(i64 %xor432, !2417, !DIExpression(), !2334)
  %not433 = xor i64 %xor420, -1, !dbg !2726
  %and434 = and i64 %not433, %xor424, !dbg !2727
  %xor435 = xor i64 %xor416, %and434, !dbg !2728
    #dbg_value(i64 %xor435, !2376, !DIExpression(), !2334)
  %not436 = xor i64 %xor424, -1, !dbg !2729
  %and437 = and i64 %not436, %xor428, !dbg !2730
  %xor438 = xor i64 %xor420, %and437, !dbg !2731
    #dbg_value(i64 %xor438, !2378, !DIExpression(), !2334)
  %not439 = xor i64 %xor428, -1, !dbg !2732
  %and440 = and i64 %not439, %xor432, !dbg !2733
  %xor441 = xor i64 %xor424, %and440, !dbg !2734
    #dbg_value(i64 %xor441, !2380, !DIExpression(), !2334)
  %not442 = xor i64 %xor432, -1, !dbg !2735
  %and443 = and i64 %not442, %xor416, !dbg !2736
  %xor444 = xor i64 %xor428, %and443, !dbg !2737
    #dbg_value(i64 %xor444, !2382, !DIExpression(), !2334)
  %not445 = xor i64 %xor416, -1, !dbg !2738
  %and446 = and i64 %not445, %xor420, !dbg !2739
  %xor447 = xor i64 %xor432, %and446, !dbg !2740
    #dbg_value(i64 %xor447, !2384, !DIExpression(), !2334)
  br label %for.inc, !dbg !2741

for.inc:                                          ; preds = %for.body
  %add448 = add nsw i32 %round.0, 2, !dbg !2742
    #dbg_value(i32 %add448, !2385, !DIExpression(), !2334)
  br label %for.cond, !dbg !2743, !llvm.loop !2744

for.end:                                          ; preds = %for.cond
  %arrayidx449 = getelementptr inbounds i64, ptr %state, i32 0, !dbg !2746
  store i64 %Aba.0, ptr %arrayidx449, align 8, !dbg !2747
  %arrayidx450 = getelementptr inbounds i64, ptr %state, i32 1, !dbg !2748
  store i64 %Abe.0, ptr %arrayidx450, align 8, !dbg !2749
  %arrayidx451 = getelementptr inbounds i64, ptr %state, i32 2, !dbg !2750
  store i64 %Abi.0, ptr %arrayidx451, align 8, !dbg !2751
  %arrayidx452 = getelementptr inbounds i64, ptr %state, i32 3, !dbg !2752
  store i64 %Abo.0, ptr %arrayidx452, align 8, !dbg !2753
  %arrayidx453 = getelementptr inbounds i64, ptr %state, i32 4, !dbg !2754
  store i64 %Abu.0, ptr %arrayidx453, align 8, !dbg !2755
  %arrayidx454 = getelementptr inbounds i64, ptr %state, i32 5, !dbg !2756
  store i64 %Aga.0, ptr %arrayidx454, align 8, !dbg !2757
  %arrayidx455 = getelementptr inbounds i64, ptr %state, i32 6, !dbg !2758
  store i64 %Age.0, ptr %arrayidx455, align 8, !dbg !2759
  %arrayidx456 = getelementptr inbounds i64, ptr %state, i32 7, !dbg !2760
  store i64 %Agi.0, ptr %arrayidx456, align 8, !dbg !2761
  %arrayidx457 = getelementptr inbounds i64, ptr %state, i32 8, !dbg !2762
  store i64 %Ago.0, ptr %arrayidx457, align 8, !dbg !2763
  %arrayidx458 = getelementptr inbounds i64, ptr %state, i32 9, !dbg !2764
  store i64 %Agu.0, ptr %arrayidx458, align 8, !dbg !2765
  %arrayidx459 = getelementptr inbounds i64, ptr %state, i32 10, !dbg !2766
  store i64 %Aka.0, ptr %arrayidx459, align 8, !dbg !2767
  %arrayidx460 = getelementptr inbounds i64, ptr %state, i32 11, !dbg !2768
  store i64 %Ake.0, ptr %arrayidx460, align 8, !dbg !2769
  %arrayidx461 = getelementptr inbounds i64, ptr %state, i32 12, !dbg !2770
  store i64 %Aki.0, ptr %arrayidx461, align 8, !dbg !2771
  %arrayidx462 = getelementptr inbounds i64, ptr %state, i32 13, !dbg !2772
  store i64 %Ako.0, ptr %arrayidx462, align 8, !dbg !2773
  %arrayidx463 = getelementptr inbounds i64, ptr %state, i32 14, !dbg !2774
  store i64 %Aku.0, ptr %arrayidx463, align 8, !dbg !2775
  %arrayidx464 = getelementptr inbounds i64, ptr %state, i32 15, !dbg !2776
  store i64 %Ama.0, ptr %arrayidx464, align 8, !dbg !2777
  %arrayidx465 = getelementptr inbounds i64, ptr %state, i32 16, !dbg !2778
  store i64 %Ame.0, ptr %arrayidx465, align 8, !dbg !2779
  %arrayidx466 = getelementptr inbounds i64, ptr %state, i32 17, !dbg !2780
  store i64 %Ami.0, ptr %arrayidx466, align 8, !dbg !2781
  %arrayidx467 = getelementptr inbounds i64, ptr %state, i32 18, !dbg !2782
  store i64 %Amo.0, ptr %arrayidx467, align 8, !dbg !2783
  %arrayidx468 = getelementptr inbounds i64, ptr %state, i32 19, !dbg !2784
  store i64 %Amu.0, ptr %arrayidx468, align 8, !dbg !2785
  %arrayidx469 = getelementptr inbounds i64, ptr %state, i32 20, !dbg !2786
  store i64 %Asa.0, ptr %arrayidx469, align 8, !dbg !2787
  %arrayidx470 = getelementptr inbounds i64, ptr %state, i32 21, !dbg !2788
  store i64 %Ase.0, ptr %arrayidx470, align 8, !dbg !2789
  %arrayidx471 = getelementptr inbounds i64, ptr %state, i32 22, !dbg !2790
  store i64 %Asi.0, ptr %arrayidx471, align 8, !dbg !2791
  %arrayidx472 = getelementptr inbounds i64, ptr %state, i32 23, !dbg !2792
  store i64 %Aso.0, ptr %arrayidx472, align 8, !dbg !2793
  %arrayidx473 = getelementptr inbounds i64, ptr %state, i32 24, !dbg !2794
  store i64 %Asu.0, ptr %arrayidx473, align 8, !dbg !2795
  ret void, !dbg !2796
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_finalize(ptr noundef %state) #0 !dbg !2797 {
entry:
    #dbg_value(ptr %state, !2798, !DIExpression(), !2799)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !2800
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2801
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2802
  %0 = load i32, ptr %pos, align 8, !dbg !2802
  call void @keccak_finalize(ptr noundef %arraydecay, i32 noundef %0, i32 noundef 168, i8 noundef zeroext 31) #2, !dbg !2803
  %pos1 = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2804
  store i32 168, ptr %pos1, align 8, !dbg !2805
  ret void, !dbg !2806
}

; Function Attrs: noinline nounwind optnone
define internal void @keccak_finalize(ptr noundef %s, i32 noundef %pos, i32 noundef %r, i8 noundef zeroext %p) #0 !dbg !2807 {
entry:
    #dbg_value(ptr %s, !2810, !DIExpression(), !2811)
    #dbg_value(i32 %pos, !2812, !DIExpression(), !2811)
    #dbg_value(i32 %r, !2813, !DIExpression(), !2811)
    #dbg_value(i8 %p, !2814, !DIExpression(), !2811)
  %conv = zext i8 %p to i64, !dbg !2815
  %rem = urem i32 %pos, 8, !dbg !2816
  %mul = mul i32 8, %rem, !dbg !2817
  %sh_prom = zext i32 %mul to i64, !dbg !2818
  %shl = shl i64 %conv, %sh_prom, !dbg !2818
  %div = udiv i32 %pos, 8, !dbg !2819
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div, !dbg !2820
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2821
  %xor = xor i64 %0, %shl, !dbg !2821
  store i64 %xor, ptr %arrayidx, align 8, !dbg !2821
  %div1 = udiv i32 %r, 8, !dbg !2822
  %sub = sub i32 %div1, 1, !dbg !2823
  %arrayidx2 = getelementptr inbounds nuw i64, ptr %s, i32 %sub, !dbg !2824
  %1 = load i64, ptr %arrayidx2, align 8, !dbg !2825
  %xor3 = xor i64 %1, -9223372036854775808, !dbg !2825
  store i64 %xor3, ptr %arrayidx2, align 8, !dbg !2825
  ret void, !dbg !2826
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) #0 !dbg !2827 {
entry:
    #dbg_value(ptr %out, !2830, !DIExpression(), !2831)
    #dbg_value(i32 %outlen, !2832, !DIExpression(), !2831)
    #dbg_value(ptr %state, !2833, !DIExpression(), !2831)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !2834
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2835
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2836
  %0 = load i32, ptr %pos, align 8, !dbg !2836
  %call = call i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %arraydecay, i32 noundef %0, i32 noundef 168) #2, !dbg !2837
  %pos1 = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2838
  store i32 %call, ptr %pos1, align 8, !dbg !2839
  ret void, !dbg !2840
}

; Function Attrs: noinline nounwind optnone
define internal i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %s, i32 noundef %pos, i32 noundef %r) #0 !dbg !2841 {
entry:
    #dbg_value(ptr %out, !2844, !DIExpression(), !2845)
    #dbg_value(i32 %outlen, !2846, !DIExpression(), !2845)
    #dbg_value(ptr %s, !2847, !DIExpression(), !2845)
    #dbg_value(i32 %pos, !2848, !DIExpression(), !2845)
    #dbg_value(i32 %r, !2849, !DIExpression(), !2845)
  br label %while.cond, !dbg !2850

while.cond:                                       ; preds = %for.end, %entry
  %pos.addr.0 = phi i32 [ %pos, %entry ], [ %i.0, %for.end ]
  %outlen.addr.0 = phi i32 [ %outlen, %entry ], [ %sub3, %for.end ]
  %out.addr.0 = phi ptr [ %out, %entry ], [ %out.addr.1, %for.end ]
    #dbg_value(ptr %out.addr.0, !2844, !DIExpression(), !2845)
    #dbg_value(i32 %outlen.addr.0, !2846, !DIExpression(), !2845)
    #dbg_value(i32 %pos.addr.0, !2848, !DIExpression(), !2845)
  %tobool = icmp ne i32 %outlen.addr.0, 0, !dbg !2850
  br i1 %tobool, label %while.body, label %while.end, !dbg !2850

while.body:                                       ; preds = %while.cond
  %cmp = icmp eq i32 %pos.addr.0, %r, !dbg !2851
  br i1 %cmp, label %if.then, label %if.end, !dbg !2851

if.then:                                          ; preds = %while.body
  call void @KeccakF1600_StatePermute(ptr noundef %s) #2, !dbg !2854
    #dbg_value(i32 0, !2848, !DIExpression(), !2845)
  br label %if.end, !dbg !2856

if.end:                                           ; preds = %if.then, %while.body
  %pos.addr.1 = phi i32 [ 0, %if.then ], [ %pos.addr.0, %while.body ]
    #dbg_value(i32 %pos.addr.1, !2848, !DIExpression(), !2845)
    #dbg_value(i32 %pos.addr.1, !2857, !DIExpression(), !2845)
  br label %for.cond, !dbg !2858

for.cond:                                         ; preds = %for.inc, %if.end
  %i.0 = phi i32 [ %pos.addr.1, %if.end ], [ %inc, %for.inc ], !dbg !2860
  %out.addr.1 = phi ptr [ %out.addr.0, %if.end ], [ %incdec.ptr, %for.inc ]
    #dbg_value(ptr %out.addr.1, !2844, !DIExpression(), !2845)
    #dbg_value(i32 %i.0, !2857, !DIExpression(), !2845)
  %cmp1 = icmp ult i32 %i.0, %r, !dbg !2861
  br i1 %cmp1, label %land.rhs, label %land.end, !dbg !2863

land.rhs:                                         ; preds = %for.cond
  %add = add i32 %pos.addr.1, %outlen.addr.0, !dbg !2864
  %cmp2 = icmp ult i32 %i.0, %add, !dbg !2865
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %0 = phi i1 [ false, %for.cond ], [ %cmp2, %land.rhs ], !dbg !2866
  br i1 %0, label %for.body, label %for.end, !dbg !2867

for.body:                                         ; preds = %land.end
  %div = udiv i32 %i.0, 8, !dbg !2868
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %div, !dbg !2869
  %1 = load i64, ptr %arrayidx, align 8, !dbg !2869
  %rem = urem i32 %i.0, 8, !dbg !2870
  %mul = mul i32 8, %rem, !dbg !2871
  %sh_prom = zext i32 %mul to i64, !dbg !2872
  %shr = lshr i64 %1, %sh_prom, !dbg !2872
  %conv = trunc i64 %shr to i8, !dbg !2869
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %out.addr.1, i32 1, !dbg !2873
    #dbg_value(ptr %incdec.ptr, !2844, !DIExpression(), !2845)
  store i8 %conv, ptr %out.addr.1, align 1, !dbg !2874
  br label %for.inc, !dbg !2875

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !2876
    #dbg_value(i32 %inc, !2857, !DIExpression(), !2845)
  br label %for.cond, !dbg !2877, !llvm.loop !2878

for.end:                                          ; preds = %land.end
  %sub = sub i32 %i.0, %pos.addr.1, !dbg !2880
  %sub3 = sub i32 %outlen.addr.0, %sub, !dbg !2881
    #dbg_value(i32 %sub3, !2846, !DIExpression(), !2845)
    #dbg_value(i32 %i.0, !2848, !DIExpression(), !2845)
  br label %while.cond, !dbg !2850, !llvm.loop !2882

while.end:                                        ; preds = %while.cond
  ret i32 %pos.addr.0, !dbg !2884
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) #0 !dbg !2885 {
entry:
    #dbg_value(ptr %state, !2886, !DIExpression(), !2887)
    #dbg_value(ptr %in, !2888, !DIExpression(), !2887)
    #dbg_value(i32 %inlen, !2889, !DIExpression(), !2887)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !2890
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !2891
  call void @keccak_absorb_once(ptr noundef %arraydecay, i32 noundef 168, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #2, !dbg !2892
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !2893
  store i32 168, ptr %pos, align 8, !dbg !2894
  ret void, !dbg !2895
}

; Function Attrs: noinline nounwind optnone
define internal void @keccak_absorb_once(ptr noundef %s, i32 noundef %r, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext %p) #0 !dbg !2896 {
entry:
    #dbg_value(ptr %s, !2899, !DIExpression(), !2900)
    #dbg_value(i32 %r, !2901, !DIExpression(), !2900)
    #dbg_value(ptr %in, !2902, !DIExpression(), !2900)
    #dbg_value(i32 %inlen, !2903, !DIExpression(), !2900)
    #dbg_value(i8 %p, !2904, !DIExpression(), !2900)
    #dbg_value(i32 0, !2905, !DIExpression(), !2900)
  br label %for.cond, !dbg !2906

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !2908
    #dbg_value(i32 %i.0, !2905, !DIExpression(), !2900)
  %cmp = icmp ult i32 %i.0, 25, !dbg !2909
  br i1 %cmp, label %for.body, label %for.end, !dbg !2911

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !2912
  store i64 0, ptr %arrayidx, align 8, !dbg !2913
  br label %for.inc, !dbg !2912

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !2914
    #dbg_value(i32 %inc, !2905, !DIExpression(), !2900)
  br label %for.cond, !dbg !2915, !llvm.loop !2916

for.end:                                          ; preds = %for.cond
  br label %while.cond, !dbg !2918

while.cond:                                       ; preds = %for.end8, %for.end
  %in.addr.0 = phi ptr [ %in, %for.end ], [ %add.ptr9, %for.end8 ]
  %inlen.addr.0 = phi i32 [ %inlen, %for.end ], [ %sub, %for.end8 ]
    #dbg_value(i32 %inlen.addr.0, !2903, !DIExpression(), !2900)
    #dbg_value(ptr %in.addr.0, !2902, !DIExpression(), !2900)
  %cmp1 = icmp uge i32 %inlen.addr.0, %r, !dbg !2919
  br i1 %cmp1, label %while.body, label %while.end, !dbg !2918

while.body:                                       ; preds = %while.cond
    #dbg_value(i32 0, !2905, !DIExpression(), !2900)
  br label %for.cond2, !dbg !2920

for.cond2:                                        ; preds = %for.inc6, %while.body
  %i.1 = phi i32 [ 0, %while.body ], [ %inc7, %for.inc6 ], !dbg !2923
    #dbg_value(i32 %i.1, !2905, !DIExpression(), !2900)
  %div = udiv i32 %r, 8, !dbg !2924
  %cmp3 = icmp ult i32 %i.1, %div, !dbg !2926
  br i1 %cmp3, label %for.body4, label %for.end8, !dbg !2927

for.body4:                                        ; preds = %for.cond2
  %mul = mul i32 8, %i.1, !dbg !2928
  %add.ptr = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %mul, !dbg !2929
  %call = call i64 @load64(ptr noundef %add.ptr) #2, !dbg !2930
  %arrayidx5 = getelementptr inbounds nuw i64, ptr %s, i32 %i.1, !dbg !2931
  %0 = load i64, ptr %arrayidx5, align 8, !dbg !2932
  %xor = xor i64 %0, %call, !dbg !2932
  store i64 %xor, ptr %arrayidx5, align 8, !dbg !2932
  br label %for.inc6, !dbg !2931

for.inc6:                                         ; preds = %for.body4
  %inc7 = add i32 %i.1, 1, !dbg !2933
    #dbg_value(i32 %inc7, !2905, !DIExpression(), !2900)
  br label %for.cond2, !dbg !2934, !llvm.loop !2935

for.end8:                                         ; preds = %for.cond2
  %add.ptr9 = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %r, !dbg !2937
    #dbg_value(ptr %add.ptr9, !2902, !DIExpression(), !2900)
  %sub = sub i32 %inlen.addr.0, %r, !dbg !2938
    #dbg_value(i32 %sub, !2903, !DIExpression(), !2900)
  call void @KeccakF1600_StatePermute(ptr noundef %s) #2, !dbg !2939
  br label %while.cond, !dbg !2918, !llvm.loop !2940

while.end:                                        ; preds = %while.cond
    #dbg_value(i32 0, !2905, !DIExpression(), !2900)
  br label %for.cond10, !dbg !2942

for.cond10:                                       ; preds = %for.inc18, %while.end
  %i.2 = phi i32 [ 0, %while.end ], [ %inc19, %for.inc18 ], !dbg !2944
    #dbg_value(i32 %i.2, !2905, !DIExpression(), !2900)
  %cmp11 = icmp ult i32 %i.2, %inlen.addr.0, !dbg !2945
  br i1 %cmp11, label %for.body12, label %for.end20, !dbg !2947

for.body12:                                       ; preds = %for.cond10
  %arrayidx13 = getelementptr inbounds nuw i8, ptr %in.addr.0, i32 %i.2, !dbg !2948
  %1 = load i8, ptr %arrayidx13, align 1, !dbg !2948
  %conv = zext i8 %1 to i64, !dbg !2949
  %rem = urem i32 %i.2, 8, !dbg !2950
  %mul14 = mul i32 8, %rem, !dbg !2951
  %sh_prom = zext i32 %mul14 to i64, !dbg !2952
  %shl = shl i64 %conv, %sh_prom, !dbg !2952
  %div15 = udiv i32 %i.2, 8, !dbg !2953
  %arrayidx16 = getelementptr inbounds nuw i64, ptr %s, i32 %div15, !dbg !2954
  %2 = load i64, ptr %arrayidx16, align 8, !dbg !2955
  %xor17 = xor i64 %2, %shl, !dbg !2955
  store i64 %xor17, ptr %arrayidx16, align 8, !dbg !2955
  br label %for.inc18, !dbg !2954

for.inc18:                                        ; preds = %for.body12
  %inc19 = add i32 %i.2, 1, !dbg !2956
    #dbg_value(i32 %inc19, !2905, !DIExpression(), !2900)
  br label %for.cond10, !dbg !2957, !llvm.loop !2958

for.end20:                                        ; preds = %for.cond10
  %conv21 = zext i8 %p to i64, !dbg !2960
  %rem22 = urem i32 %i.2, 8, !dbg !2961
  %mul23 = mul i32 8, %rem22, !dbg !2962
  %sh_prom24 = zext i32 %mul23 to i64, !dbg !2963
  %shl25 = shl i64 %conv21, %sh_prom24, !dbg !2963
  %div26 = udiv i32 %i.2, 8, !dbg !2964
  %arrayidx27 = getelementptr inbounds nuw i64, ptr %s, i32 %div26, !dbg !2965
  %3 = load i64, ptr %arrayidx27, align 8, !dbg !2966
  %xor28 = xor i64 %3, %shl25, !dbg !2966
  store i64 %xor28, ptr %arrayidx27, align 8, !dbg !2966
  %sub29 = sub i32 %r, 1, !dbg !2967
  %div30 = udiv i32 %sub29, 8, !dbg !2968
  %arrayidx31 = getelementptr inbounds nuw i64, ptr %s, i32 %div30, !dbg !2969
  %4 = load i64, ptr %arrayidx31, align 8, !dbg !2970
  %xor32 = xor i64 %4, -9223372036854775808, !dbg !2970
  store i64 %xor32, ptr %arrayidx31, align 8, !dbg !2970
  ret void, !dbg !2971
}

; Function Attrs: noinline nounwind optnone
define internal i64 @load64(ptr noundef %x) #0 !dbg !2972 {
entry:
    #dbg_value(ptr %x, !2975, !DIExpression(), !2976)
    #dbg_value(i64 0, !2977, !DIExpression(), !2976)
    #dbg_value(i32 0, !2978, !DIExpression(), !2976)
  br label %for.cond, !dbg !2979

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !2981
  %r.0 = phi i64 [ 0, %entry ], [ %or, %for.inc ], !dbg !2976
    #dbg_value(i64 %r.0, !2977, !DIExpression(), !2976)
    #dbg_value(i32 %i.0, !2978, !DIExpression(), !2976)
  %cmp = icmp ult i32 %i.0, 8, !dbg !2982
  br i1 %cmp, label %for.body, label %for.end, !dbg !2984

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2985
  %0 = load i8, ptr %arrayidx, align 1, !dbg !2985
  %conv = zext i8 %0 to i64, !dbg !2986
  %mul = mul i32 8, %i.0, !dbg !2987
  %sh_prom = zext i32 %mul to i64, !dbg !2988
  %shl = shl i64 %conv, %sh_prom, !dbg !2988
  %or = or i64 %r.0, %shl, !dbg !2989
    #dbg_value(i64 %or, !2977, !DIExpression(), !2976)
  br label %for.inc, !dbg !2990

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !2991
    #dbg_value(i32 %inc, !2978, !DIExpression(), !2976)
  br label %for.cond, !dbg !2992, !llvm.loop !2993

for.end:                                          ; preds = %for.cond
  ret i64 %r.0, !dbg !2995
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) #0 !dbg !2996 {
entry:
    #dbg_value(ptr %out, !2997, !DIExpression(), !2998)
    #dbg_value(i32 %nblocks, !2999, !DIExpression(), !2998)
    #dbg_value(ptr %state, !3000, !DIExpression(), !2998)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !3001
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !3002
  call void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %arraydecay, i32 noundef 168) #2, !dbg !3003
  ret void, !dbg !3004
}

; Function Attrs: noinline nounwind optnone
define internal void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %s, i32 noundef %r) #0 !dbg !3005 {
entry:
    #dbg_value(ptr %out, !3008, !DIExpression(), !3009)
    #dbg_value(i32 %nblocks, !3010, !DIExpression(), !3009)
    #dbg_value(ptr %s, !3011, !DIExpression(), !3009)
    #dbg_value(i32 %r, !3012, !DIExpression(), !3009)
  br label %while.cond, !dbg !3013

while.cond:                                       ; preds = %for.end, %entry
  %nblocks.addr.0 = phi i32 [ %nblocks, %entry ], [ %sub, %for.end ]
  %out.addr.0 = phi ptr [ %out, %entry ], [ %add.ptr1, %for.end ]
    #dbg_value(ptr %out.addr.0, !3008, !DIExpression(), !3009)
    #dbg_value(i32 %nblocks.addr.0, !3010, !DIExpression(), !3009)
  %tobool = icmp ne i32 %nblocks.addr.0, 0, !dbg !3013
  br i1 %tobool, label %while.body, label %while.end, !dbg !3013

while.body:                                       ; preds = %while.cond
  call void @KeccakF1600_StatePermute(ptr noundef %s) #2, !dbg !3014
    #dbg_value(i32 0, !3016, !DIExpression(), !3009)
  br label %for.cond, !dbg !3017

for.cond:                                         ; preds = %for.inc, %while.body
  %i.0 = phi i32 [ 0, %while.body ], [ %inc, %for.inc ], !dbg !3019
    #dbg_value(i32 %i.0, !3016, !DIExpression(), !3009)
  %div = udiv i32 %r, 8, !dbg !3020
  %cmp = icmp ult i32 %i.0, %div, !dbg !3022
  br i1 %cmp, label %for.body, label %for.end, !dbg !3023

for.body:                                         ; preds = %for.cond
  %mul = mul i32 8, %i.0, !dbg !3024
  %add.ptr = getelementptr inbounds nuw i8, ptr %out.addr.0, i32 %mul, !dbg !3025
  %arrayidx = getelementptr inbounds nuw i64, ptr %s, i32 %i.0, !dbg !3026
  %0 = load i64, ptr %arrayidx, align 8, !dbg !3026
  call void @store64(ptr noundef %add.ptr, i64 noundef %0) #2, !dbg !3027
  br label %for.inc, !dbg !3027

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !3028
    #dbg_value(i32 %inc, !3016, !DIExpression(), !3009)
  br label %for.cond, !dbg !3029, !llvm.loop !3030

for.end:                                          ; preds = %for.cond
  %add.ptr1 = getelementptr inbounds nuw i8, ptr %out.addr.0, i32 %r, !dbg !3032
    #dbg_value(ptr %add.ptr1, !3008, !DIExpression(), !3009)
  %sub = sub i32 %nblocks.addr.0, 1, !dbg !3033
    #dbg_value(i32 %sub, !3010, !DIExpression(), !3009)
  br label %while.cond, !dbg !3013, !llvm.loop !3034

while.end:                                        ; preds = %while.cond
  ret void, !dbg !3036
}

; Function Attrs: noinline nounwind optnone
define internal void @store64(ptr noundef %x, i64 noundef %u) #0 !dbg !3037 {
entry:
    #dbg_value(ptr %x, !3040, !DIExpression(), !3041)
    #dbg_value(i64 %u, !3042, !DIExpression(), !3041)
    #dbg_value(i32 0, !3043, !DIExpression(), !3041)
  br label %for.cond, !dbg !3044

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !3046
    #dbg_value(i32 %i.0, !3043, !DIExpression(), !3041)
  %cmp = icmp ult i32 %i.0, 8, !dbg !3047
  br i1 %cmp, label %for.body, label %for.end, !dbg !3049

for.body:                                         ; preds = %for.cond
  %mul = mul i32 8, %i.0, !dbg !3050
  %sh_prom = zext i32 %mul to i64, !dbg !3051
  %shr = lshr i64 %u, %sh_prom, !dbg !3051
  %conv = trunc i64 %shr to i8, !dbg !3052
  %arrayidx = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !3053
  store i8 %conv, ptr %arrayidx, align 1, !dbg !3054
  br label %for.inc, !dbg !3053

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !3055
    #dbg_value(i32 %inc, !3043, !DIExpression(), !3041)
  br label %for.cond, !dbg !3056, !llvm.loop !3057

for.end:                                          ; preds = %for.cond
  ret void, !dbg !3059
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef %state) #0 !dbg !3060 {
entry:
    #dbg_value(ptr %state, !3061, !DIExpression(), !3062)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !3063
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !3064
  call void @keccak_init(ptr noundef %arraydecay) #2, !dbg !3065
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !3066
  store i32 0, ptr %pos, align 8, !dbg !3067
  ret void, !dbg !3068
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) #0 !dbg !3069 {
entry:
    #dbg_value(ptr %state, !3070, !DIExpression(), !3071)
    #dbg_value(ptr %in, !3072, !DIExpression(), !3071)
    #dbg_value(i32 %inlen, !3073, !DIExpression(), !3071)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !3074
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !3075
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !3076
  %0 = load i32, ptr %pos, align 8, !dbg !3076
  %call = call i32 @keccak_absorb(ptr noundef %arraydecay, i32 noundef %0, i32 noundef 136, ptr noundef %in, i32 noundef %inlen) #2, !dbg !3077
  %pos1 = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !3078
  store i32 %call, ptr %pos1, align 8, !dbg !3079
  ret void, !dbg !3080
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef %state) #0 !dbg !3081 {
entry:
    #dbg_value(ptr %state, !3082, !DIExpression(), !3083)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !3084
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !3085
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !3086
  %0 = load i32, ptr %pos, align 8, !dbg !3086
  call void @keccak_finalize(ptr noundef %arraydecay, i32 noundef %0, i32 noundef 136, i8 noundef zeroext 31) #2, !dbg !3087
  %pos1 = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !3088
  store i32 136, ptr %pos1, align 8, !dbg !3089
  ret void, !dbg !3090
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %state) #0 !dbg !3091 {
entry:
    #dbg_value(ptr %out, !3092, !DIExpression(), !3093)
    #dbg_value(i32 %outlen, !3094, !DIExpression(), !3093)
    #dbg_value(ptr %state, !3095, !DIExpression(), !3093)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !3096
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !3097
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !3098
  %0 = load i32, ptr %pos, align 8, !dbg !3098
  %call = call i32 @keccak_squeeze(ptr noundef %out, i32 noundef %outlen, ptr noundef %arraydecay, i32 noundef %0, i32 noundef 136) #2, !dbg !3099
  %pos1 = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !3100
  store i32 %call, ptr %pos1, align 8, !dbg !3101
  ret void, !dbg !3102
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) #0 !dbg !3103 {
entry:
    #dbg_value(ptr %state, !3104, !DIExpression(), !3105)
    #dbg_value(ptr %in, !3106, !DIExpression(), !3105)
    #dbg_value(i32 %inlen, !3107, !DIExpression(), !3105)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !3108
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !3109
  call void @keccak_absorb_once(ptr noundef %arraydecay, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 31) #2, !dbg !3110
  %pos = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 1, !dbg !3111
  store i32 136, ptr %pos, align 8, !dbg !3112
  ret void, !dbg !3113
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %state) #0 !dbg !3114 {
entry:
    #dbg_value(ptr %out, !3115, !DIExpression(), !3116)
    #dbg_value(i32 %nblocks, !3117, !DIExpression(), !3116)
    #dbg_value(ptr %state, !3118, !DIExpression(), !3116)
  %s = getelementptr inbounds nuw %struct.keccak_state, ptr %state, i32 0, i32 0, !dbg !3119
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !3120
  call void @keccak_squeezeblocks(ptr noundef %out, i32 noundef %nblocks, ptr noundef %arraydecay, i32 noundef 136) #2, !dbg !3121
  ret void, !dbg !3122
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake128(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) #0 !dbg !3123 {
entry:
  %state = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !3126, !DIExpression(), !3127)
    #dbg_value(i32 %outlen, !3128, !DIExpression(), !3127)
    #dbg_value(ptr %in, !3129, !DIExpression(), !3127)
    #dbg_value(i32 %inlen, !3130, !DIExpression(), !3127)
    #dbg_declare(ptr %state, !3131, !DIExpression(), !3132)
  call void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) #2, !dbg !3133
  %div = udiv i32 %outlen, 168, !dbg !3134
    #dbg_value(i32 %div, !3135, !DIExpression(), !3127)
  call void @pqcrystals_kyber_fips202_ref_shake128_squeezeblocks(ptr noundef %out, i32 noundef %div, ptr noundef %state) #2, !dbg !3136
  %mul = mul i32 %div, 168, !dbg !3137
  %sub = sub i32 %outlen, %mul, !dbg !3138
    #dbg_value(i32 %sub, !3128, !DIExpression(), !3127)
  %mul1 = mul i32 %div, 168, !dbg !3139
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !3140
    #dbg_value(ptr %add.ptr, !3126, !DIExpression(), !3127)
  call void @pqcrystals_kyber_fips202_ref_shake128_squeeze(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef %state) #2, !dbg !3141
  ret void, !dbg !3142
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef %in, i32 noundef %inlen) #0 !dbg !3143 {
entry:
  %state = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !3144, !DIExpression(), !3145)
    #dbg_value(i32 %outlen, !3146, !DIExpression(), !3145)
    #dbg_value(ptr %in, !3147, !DIExpression(), !3145)
    #dbg_value(i32 %inlen, !3148, !DIExpression(), !3145)
    #dbg_declare(ptr %state, !3149, !DIExpression(), !3150)
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb_once(ptr noundef %state, ptr noundef %in, i32 noundef %inlen) #2, !dbg !3151
  %div = udiv i32 %outlen, 136, !dbg !3152
    #dbg_value(i32 %div, !3153, !DIExpression(), !3145)
  call void @pqcrystals_kyber_fips202_ref_shake256_squeezeblocks(ptr noundef %out, i32 noundef %div, ptr noundef %state) #2, !dbg !3154
  %mul = mul i32 %div, 136, !dbg !3155
  %sub = sub i32 %outlen, %mul, !dbg !3156
    #dbg_value(i32 %sub, !3146, !DIExpression(), !3145)
  %mul1 = mul i32 %div, 136, !dbg !3157
  %add.ptr = getelementptr inbounds nuw i8, ptr %out, i32 %mul1, !dbg !3158
    #dbg_value(ptr %add.ptr, !3144, !DIExpression(), !3145)
  call void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %add.ptr, i32 noundef %sub, ptr noundef %state) #2, !dbg !3159
  ret void, !dbg !3160
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_256(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) #0 !dbg !3161 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !3164, !DIExpression(), !3165)
    #dbg_value(ptr %in, !3166, !DIExpression(), !3165)
    #dbg_value(i32 %inlen, !3167, !DIExpression(), !3165)
    #dbg_declare(ptr %s, !3168, !DIExpression(), !3169)
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !3170
  call void @keccak_absorb_once(ptr noundef %arraydecay, i32 noundef 136, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #2, !dbg !3171
  %arraydecay1 = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !3172
  call void @KeccakF1600_StatePermute(ptr noundef %arraydecay1) #2, !dbg !3173
    #dbg_value(i32 0, !3174, !DIExpression(), !3165)
  br label %for.cond, !dbg !3175

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !3177
    #dbg_value(i32 %i.0, !3174, !DIExpression(), !3165)
  %cmp = icmp ult i32 %i.0, 4, !dbg !3178
  br i1 %cmp, label %for.body, label %for.end, !dbg !3180

for.body:                                         ; preds = %for.cond
  %mul = mul i32 8, %i.0, !dbg !3181
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !3182
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !3183
  %0 = load i64, ptr %arrayidx, align 8, !dbg !3183
  call void @store64(ptr noundef %add.ptr, i64 noundef %0) #2, !dbg !3184
  br label %for.inc, !dbg !3184

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !3185
    #dbg_value(i32 %inc, !3174, !DIExpression(), !3165)
  br label %for.cond, !dbg !3186, !llvm.loop !3187

for.end:                                          ; preds = %for.cond
  ret void, !dbg !3189
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber_fips202_ref_sha3_512(ptr noundef %h, ptr noundef %in, i32 noundef %inlen) #0 !dbg !3190 {
entry:
  %s = alloca [25 x i64], align 8
    #dbg_value(ptr %h, !3191, !DIExpression(), !3192)
    #dbg_value(ptr %in, !3193, !DIExpression(), !3192)
    #dbg_value(i32 %inlen, !3194, !DIExpression(), !3192)
    #dbg_declare(ptr %s, !3195, !DIExpression(), !3196)
  %arraydecay = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !3197
  call void @keccak_absorb_once(ptr noundef %arraydecay, i32 noundef 72, ptr noundef %in, i32 noundef %inlen, i8 noundef zeroext 6) #2, !dbg !3198
  %arraydecay1 = getelementptr inbounds [25 x i64], ptr %s, i32 0, i32 0, !dbg !3199
  call void @KeccakF1600_StatePermute(ptr noundef %arraydecay1) #2, !dbg !3200
    #dbg_value(i32 0, !3201, !DIExpression(), !3192)
  br label %for.cond, !dbg !3202

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !3204
    #dbg_value(i32 %i.0, !3201, !DIExpression(), !3192)
  %cmp = icmp ult i32 %i.0, 8, !dbg !3205
  br i1 %cmp, label %for.body, label %for.end, !dbg !3207

for.body:                                         ; preds = %for.cond
  %mul = mul i32 8, %i.0, !dbg !3208
  %add.ptr = getelementptr inbounds nuw i8, ptr %h, i32 %mul, !dbg !3209
  %arrayidx = getelementptr inbounds nuw [25 x i64], ptr %s, i32 0, i32 %i.0, !dbg !3210
  %0 = load i64, ptr %arrayidx, align 8, !dbg !3210
  call void @store64(ptr noundef %add.ptr, i64 noundef %0) #2, !dbg !3211
  br label %for.inc, !dbg !3211

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1, !dbg !3212
    #dbg_value(i32 %inc, !3201, !DIExpression(), !3192)
  br label %for.cond, !dbg !3213, !llvm.loop !3214

for.end:                                          ; preds = %for.cond
  ret void, !dbg !3216
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_kyber_shake128_absorb(ptr noundef %state, ptr noundef %seed, i8 noundef zeroext %x, i8 noundef zeroext %y) #0 !dbg !3217 {
entry:
  %extseed = alloca [34 x i8], align 1
    #dbg_value(ptr %state, !3227, !DIExpression(), !3228)
    #dbg_value(ptr %seed, !3229, !DIExpression(), !3228)
    #dbg_value(i8 %x, !3230, !DIExpression(), !3228)
    #dbg_value(i8 %y, !3231, !DIExpression(), !3228)
    #dbg_declare(ptr %extseed, !3232, !DIExpression(), !3236)
  %arraydecay = getelementptr inbounds [34 x i8], ptr %extseed, i32 0, i32 0, !dbg !3237
  %call = call ptr @memcpy(ptr noundef %arraydecay, ptr noundef %seed, i32 noundef 32) #2, !dbg !3238
  %arrayidx = getelementptr inbounds [34 x i8], ptr %extseed, i32 0, i32 32, !dbg !3239
  store i8 %x, ptr %arrayidx, align 1, !dbg !3240
  %arrayidx1 = getelementptr inbounds [34 x i8], ptr %extseed, i32 0, i32 33, !dbg !3241
  store i8 %y, ptr %arrayidx1, align 1, !dbg !3242
  %arraydecay2 = getelementptr inbounds [34 x i8], ptr %extseed, i32 0, i32 0, !dbg !3243
  call void @pqcrystals_kyber_fips202_ref_shake128_absorb_once(ptr noundef %state, ptr noundef %arraydecay2, i32 noundef 34) #2, !dbg !3244
  ret void, !dbg !3245
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_kyber_shake256_prf(ptr noundef %out, i32 noundef %outlen, ptr noundef %key, i8 noundef zeroext %nonce) #0 !dbg !3246 {
entry:
  %extkey = alloca [33 x i8], align 1
    #dbg_value(ptr %out, !3249, !DIExpression(), !3250)
    #dbg_value(i32 %outlen, !3251, !DIExpression(), !3250)
    #dbg_value(ptr %key, !3252, !DIExpression(), !3250)
    #dbg_value(i8 %nonce, !3253, !DIExpression(), !3250)
    #dbg_declare(ptr %extkey, !3254, !DIExpression(), !3258)
  %arraydecay = getelementptr inbounds [33 x i8], ptr %extkey, i32 0, i32 0, !dbg !3259
  %call = call ptr @memcpy(ptr noundef %arraydecay, ptr noundef %key, i32 noundef 32) #2, !dbg !3260
  %arrayidx = getelementptr inbounds [33 x i8], ptr %extkey, i32 0, i32 32, !dbg !3261
  store i8 %nonce, ptr %arrayidx, align 1, !dbg !3262
  %arraydecay1 = getelementptr inbounds [33 x i8], ptr %extkey, i32 0, i32 0, !dbg !3263
  call void @pqcrystals_kyber_fips202_ref_shake256(ptr noundef %out, i32 noundef %outlen, ptr noundef %arraydecay1, i32 noundef 33) #2, !dbg !3264
  ret void, !dbg !3265
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pqcrystals_kyber512_ref_kyber_shake256_rkprf(ptr noundef %out, ptr noundef %key, ptr noundef %input) #0 !dbg !3266 {
entry:
  %s = alloca %struct.keccak_state, align 8
    #dbg_value(ptr %out, !3267, !DIExpression(), !3268)
    #dbg_value(ptr %key, !3269, !DIExpression(), !3268)
    #dbg_value(ptr %input, !3270, !DIExpression(), !3268)
    #dbg_declare(ptr %s, !3271, !DIExpression(), !3272)
  call void @pqcrystals_kyber_fips202_ref_shake256_init(ptr noundef %s) #2, !dbg !3273
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef %s, ptr noundef %key, i32 noundef 32) #2, !dbg !3274
  call void @pqcrystals_kyber_fips202_ref_shake256_absorb(ptr noundef %s, ptr noundef %input, i32 noundef 768) #2, !dbg !3275
  call void @pqcrystals_kyber_fips202_ref_shake256_finalize(ptr noundef %s) #2, !dbg !3276
  call void @pqcrystals_kyber_fips202_ref_shake256_squeeze(ptr noundef %out, i32 noundef 32, ptr noundef %s) #2, !dbg !3277
  ret void, !dbg !3278
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
!52 = distinct !DIGlobalVariable(name: "pqcrystals_kyber512_ref_zetas", scope: !53, file: !58, line: 39, type: !59, isLocal: false, isDefinition: true)
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
!94 = !{!86, !61, !55}
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
!140 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 6400, elements: !141)
!141 = !{!142}
!142 = !DISubrange(count: 800)
!143 = !DILocation(line: 11, column: 11, scope: !138)
!144 = !DILocalVariable(name: "sk", scope: !138, file: !2, line: 12, type: !145)
!145 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 13056, elements: !146)
!146 = !{!147}
!147 = !DISubrange(count: 1632)
!148 = !DILocation(line: 12, column: 11, scope: !138)
!149 = !DILocalVariable(name: "ct", scope: !138, file: !2, line: 13, type: !150)
!150 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 6144, elements: !151)
!151 = !{!152}
!152 = !DISubrange(count: 768)
!153 = !DILocation(line: 13, column: 11, scope: !138)
!154 = !DILocalVariable(name: "key_a", scope: !138, file: !2, line: 14, type: !155)
!155 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 256, elements: !156)
!156 = !{!157}
!157 = !DISubrange(count: 32)
!158 = !DILocation(line: 14, column: 11, scope: !138)
!159 = !DILocalVariable(name: "key_b", scope: !138, file: !2, line: 15, type: !155)
!160 = !DILocation(line: 15, column: 11, scope: !138)
!161 = !DILocation(line: 18, column: 22, scope: !138)
!162 = !DILocation(line: 18, column: 26, scope: !138)
!163 = !DILocation(line: 18, column: 3, scope: !138)
!164 = !DILocation(line: 21, column: 18, scope: !138)
!165 = !DILocation(line: 21, column: 22, scope: !138)
!166 = !DILocation(line: 21, column: 29, scope: !138)
!167 = !DILocation(line: 21, column: 3, scope: !138)
!168 = !DILocation(line: 24, column: 18, scope: !138)
!169 = !DILocation(line: 24, column: 25, scope: !138)
!170 = !DILocation(line: 24, column: 29, scope: !138)
!171 = !DILocation(line: 24, column: 3, scope: !138)
!172 = !DILocation(line: 26, column: 13, scope: !173)
!173 = distinct !DILexicalBlock(scope: !138, file: !2, line: 26, column: 6)
!174 = !DILocation(line: 26, column: 20, scope: !173)
!175 = !DILocation(line: 26, column: 6, scope: !173)
!176 = !DILocation(line: 27, column: 5, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !2, line: 26, column: 42)
!178 = !DILocation(line: 28, column: 5, scope: !177)
!179 = !DILocation(line: 31, column: 3, scope: !138)
!180 = !DILocation(line: 0, scope: !138)
!181 = !DILocation(line: 32, column: 1, scope: !138)
!182 = distinct !DISubprogram(name: "test_invalid_sk_a", scope: !2, file: !2, line: 34, type: !107, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !49)
!183 = !DILocalVariable(name: "pk", scope: !182, file: !2, line: 36, type: !140)
!184 = !DILocation(line: 36, column: 11, scope: !182)
!185 = !DILocalVariable(name: "sk", scope: !182, file: !2, line: 37, type: !145)
!186 = !DILocation(line: 37, column: 11, scope: !182)
!187 = !DILocalVariable(name: "ct", scope: !182, file: !2, line: 38, type: !150)
!188 = !DILocation(line: 38, column: 11, scope: !182)
!189 = !DILocalVariable(name: "key_a", scope: !182, file: !2, line: 39, type: !155)
!190 = !DILocation(line: 39, column: 11, scope: !182)
!191 = !DILocalVariable(name: "key_b", scope: !182, file: !2, line: 40, type: !155)
!192 = !DILocation(line: 40, column: 11, scope: !182)
!193 = !DILocation(line: 43, column: 22, scope: !182)
!194 = !DILocation(line: 43, column: 26, scope: !182)
!195 = !DILocation(line: 43, column: 3, scope: !182)
!196 = !DILocation(line: 46, column: 18, scope: !182)
!197 = !DILocation(line: 46, column: 22, scope: !182)
!198 = !DILocation(line: 46, column: 29, scope: !182)
!199 = !DILocation(line: 46, column: 3, scope: !182)
!200 = !DILocation(line: 49, column: 15, scope: !182)
!201 = !DILocation(line: 49, column: 3, scope: !182)
!202 = !DILocation(line: 52, column: 18, scope: !182)
!203 = !DILocation(line: 52, column: 25, scope: !182)
!204 = !DILocation(line: 52, column: 29, scope: !182)
!205 = !DILocation(line: 52, column: 3, scope: !182)
!206 = !DILocation(line: 54, column: 14, scope: !207)
!207 = distinct !DILexicalBlock(scope: !182, file: !2, line: 54, column: 6)
!208 = !DILocation(line: 54, column: 21, scope: !207)
!209 = !DILocation(line: 54, column: 7, scope: !207)
!210 = !DILocation(line: 54, column: 6, scope: !207)
!211 = !DILocation(line: 55, column: 5, scope: !212)
!212 = distinct !DILexicalBlock(scope: !207, file: !2, line: 54, column: 43)
!213 = !DILocation(line: 56, column: 5, scope: !212)
!214 = !DILocation(line: 59, column: 3, scope: !182)
!215 = !DILocation(line: 0, scope: !182)
!216 = !DILocation(line: 60, column: 1, scope: !182)
!217 = distinct !DISubprogram(name: "test_invalid_ciphertext", scope: !2, file: !2, line: 62, type: !107, scopeLine: 63, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !49)
!218 = !DILocalVariable(name: "pk", scope: !217, file: !2, line: 64, type: !140)
!219 = !DILocation(line: 64, column: 11, scope: !217)
!220 = !DILocalVariable(name: "sk", scope: !217, file: !2, line: 65, type: !145)
!221 = !DILocation(line: 65, column: 11, scope: !217)
!222 = !DILocalVariable(name: "ct", scope: !217, file: !2, line: 66, type: !150)
!223 = !DILocation(line: 66, column: 11, scope: !217)
!224 = !DILocalVariable(name: "key_a", scope: !217, file: !2, line: 67, type: !155)
!225 = !DILocation(line: 67, column: 11, scope: !217)
!226 = !DILocalVariable(name: "key_b", scope: !217, file: !2, line: 68, type: !155)
!227 = !DILocation(line: 68, column: 11, scope: !217)
!228 = !DILocalVariable(name: "b", scope: !217, file: !2, line: 69, type: !33)
!229 = !DILocation(line: 69, column: 11, scope: !217)
!230 = !DILocalVariable(name: "pos", scope: !217, file: !2, line: 70, type: !38)
!231 = !DILocation(line: 70, column: 10, scope: !217)
!232 = !DILocation(line: 72, column: 3, scope: !217)
!233 = !DILocation(line: 73, column: 5, scope: !234)
!234 = distinct !DILexicalBlock(scope: !217, file: !2, line: 72, column: 6)
!235 = !DILocation(line: 74, column: 3, scope: !234)
!236 = !DILocation(line: 74, column: 12, scope: !217)
!237 = !DILocation(line: 74, column: 11, scope: !217)
!238 = distinct !{!238, !232, !239, !132}
!239 = !DILocation(line: 74, column: 13, scope: !217)
!240 = !DILocation(line: 75, column: 3, scope: !217)
!241 = !DILocation(line: 78, column: 22, scope: !217)
!242 = !DILocation(line: 78, column: 26, scope: !217)
!243 = !DILocation(line: 78, column: 3, scope: !217)
!244 = !DILocation(line: 81, column: 18, scope: !217)
!245 = !DILocation(line: 81, column: 22, scope: !217)
!246 = !DILocation(line: 81, column: 29, scope: !217)
!247 = !DILocation(line: 81, column: 3, scope: !217)
!248 = !DILocation(line: 84, column: 39, scope: !217)
!249 = !DILocation(line: 84, column: 6, scope: !217)
!250 = !DILocation(line: 84, column: 10, scope: !217)
!251 = !DILocation(line: 84, column: 3, scope: !217)
!252 = !DILocation(line: 84, column: 36, scope: !217)
!253 = !DILocation(line: 87, column: 18, scope: !217)
!254 = !DILocation(line: 87, column: 25, scope: !217)
!255 = !DILocation(line: 87, column: 29, scope: !217)
!256 = !DILocation(line: 87, column: 3, scope: !217)
!257 = !DILocation(line: 89, column: 14, scope: !258)
!258 = distinct !DILexicalBlock(scope: !217, file: !2, line: 89, column: 6)
!259 = !DILocation(line: 89, column: 21, scope: !258)
!260 = !DILocation(line: 89, column: 7, scope: !258)
!261 = !DILocation(line: 89, column: 6, scope: !258)
!262 = !DILocation(line: 90, column: 5, scope: !263)
!263 = distinct !DILexicalBlock(scope: !258, file: !2, line: 89, column: 43)
!264 = !DILocation(line: 91, column: 5, scope: !263)
!265 = !DILocation(line: 94, column: 3, scope: !217)
!266 = !DILocation(line: 0, scope: !217)
!267 = !DILocation(line: 95, column: 1, scope: !217)
!268 = !DILocalVariable(name: "out", arg: 1, scope: !28, file: !29, line: 74, type: !32)
!269 = !DILocation(line: 0, scope: !28)
!270 = !DILocalVariable(name: "outlen", arg: 2, scope: !28, file: !29, line: 74, type: !38)
!271 = !DILocation(line: 78, column: 3, scope: !28)
!272 = !DILocation(line: 78, column: 9, scope: !28)
!273 = !DILocation(line: 78, column: 12, scope: !28)
!274 = !DILocation(line: 79, column: 10, scope: !275)
!275 = distinct !DILexicalBlock(scope: !28, file: !29, line: 78, column: 19)
!276 = !DILocation(line: 79, column: 8, scope: !275)
!277 = !DILocation(line: 80, column: 8, scope: !278)
!278 = distinct !DILexicalBlock(scope: !275, file: !29, line: 80, column: 8)
!279 = !DILocation(line: 80, column: 11, scope: !278)
!280 = !DILocation(line: 80, column: 17, scope: !278)
!281 = !DILocation(line: 80, column: 20, scope: !278)
!282 = !DILocation(line: 80, column: 26, scope: !278)
!283 = !DILocation(line: 81, column: 7, scope: !278)
!284 = distinct !{!284, !271, !285, !132}
!285 = !DILocation(line: 84, column: 3, scope: !28)
!286 = !DILocation(line: 82, column: 13, scope: !287)
!287 = distinct !DILexicalBlock(scope: !278, file: !29, line: 82, column: 13)
!288 = !DILocation(line: 82, column: 16, scope: !287)
!289 = !DILocation(line: 83, column: 7, scope: !287)
!290 = !DILocation(line: 86, column: 3, scope: !28)
!291 = !DILocation(line: 86, column: 16, scope: !28)
!292 = !DILocation(line: 87, column: 16, scope: !293)
!293 = distinct !DILexicalBlock(scope: !28, file: !29, line: 86, column: 21)
!294 = !DILocation(line: 87, column: 11, scope: !293)
!295 = !DILocalVariable(name: "ret", scope: !28, file: !29, line: 76, type: !296)
!296 = !DIDerivedType(tag: DW_TAG_typedef, name: "ssize_t", file: !297, line: 182, baseType: !298)
!297 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/sys/types.h", directory: "")
!298 = !DIDerivedType(tag: DW_TAG_typedef, name: "_ssize_t", file: !299, line: 147, baseType: !50)
!299 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/sys/_types.h", directory: "")
!300 = !DILocation(line: 88, column: 12, scope: !301)
!301 = distinct !DILexicalBlock(scope: !293, file: !29, line: 88, column: 8)
!302 = !DILocation(line: 88, column: 18, scope: !301)
!303 = !DILocation(line: 88, column: 21, scope: !301)
!304 = !DILocation(line: 88, column: 27, scope: !301)
!305 = !DILocation(line: 89, column: 7, scope: !301)
!306 = distinct !{!306, !290, !307, !132}
!307 = !DILocation(line: 95, column: 3, scope: !28)
!308 = !DILocation(line: 90, column: 17, scope: !309)
!309 = distinct !DILexicalBlock(scope: !301, file: !29, line: 90, column: 13)
!310 = !DILocation(line: 91, column: 7, scope: !309)
!311 = !DILocation(line: 93, column: 9, scope: !293)
!312 = !DILocation(line: 94, column: 12, scope: !293)
!313 = !DILocation(line: 96, column: 1, scope: !28)
!314 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_keypair_derand", scope: !315, file: !315, line: 25, type: !316, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !83, retainedNodes: !49)
!315 = !DIFile(filename: "../../ref/kem.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!316 = !DISubroutineType(types: !317)
!317 = !{!50, !32, !32, !318}
!318 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !319, size: 32)
!319 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !33)
!320 = !DILocalVariable(name: "pk", arg: 1, scope: !314, file: !315, line: 25, type: !32)
!321 = !DILocation(line: 0, scope: !314)
!322 = !DILocalVariable(name: "sk", arg: 2, scope: !314, file: !315, line: 26, type: !32)
!323 = !DILocalVariable(name: "coins", arg: 3, scope: !314, file: !315, line: 27, type: !318)
!324 = !DILocation(line: 29, column: 3, scope: !314)
!325 = !DILocation(line: 30, column: 12, scope: !314)
!326 = !DILocation(line: 30, column: 3, scope: !314)
!327 = !DILocation(line: 31, column: 3, scope: !314)
!328 = !DILocation(line: 33, column: 12, scope: !314)
!329 = !DILocation(line: 33, column: 33, scope: !314)
!330 = !DILocation(line: 33, column: 55, scope: !314)
!331 = !DILocation(line: 33, column: 3, scope: !314)
!332 = !DILocation(line: 34, column: 3, scope: !314)
!333 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_keypair", scope: !315, file: !315, line: 50, type: !334, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !83, retainedNodes: !49)
!334 = !DISubroutineType(types: !335)
!335 = !{!50, !32, !32}
!336 = !DILocalVariable(name: "pk", arg: 1, scope: !333, file: !315, line: 50, type: !32)
!337 = !DILocation(line: 0, scope: !333)
!338 = !DILocalVariable(name: "sk", arg: 2, scope: !333, file: !315, line: 51, type: !32)
!339 = !DILocalVariable(name: "coins", scope: !333, file: !315, line: 53, type: !340)
!340 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 512, elements: !341)
!341 = !{!342}
!342 = !DISubrange(count: 64)
!343 = !DILocation(line: 53, column: 11, scope: !333)
!344 = !DILocation(line: 54, column: 15, scope: !333)
!345 = !DILocation(line: 54, column: 3, scope: !333)
!346 = !DILocation(line: 55, column: 37, scope: !333)
!347 = !DILocation(line: 55, column: 3, scope: !333)
!348 = !DILocation(line: 56, column: 3, scope: !333)
!349 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_enc_derand", scope: !315, file: !315, line: 76, type: !350, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !83, retainedNodes: !49)
!350 = !DISubroutineType(types: !351)
!351 = !{!50, !32, !32, !318, !318}
!352 = !DILocalVariable(name: "ct", arg: 1, scope: !349, file: !315, line: 76, type: !32)
!353 = !DILocation(line: 0, scope: !349)
!354 = !DILocalVariable(name: "ss", arg: 2, scope: !349, file: !315, line: 77, type: !32)
!355 = !DILocalVariable(name: "pk", arg: 3, scope: !349, file: !315, line: 78, type: !318)
!356 = !DILocalVariable(name: "coins", arg: 4, scope: !349, file: !315, line: 79, type: !318)
!357 = !DILocalVariable(name: "buf", scope: !349, file: !315, line: 81, type: !340)
!358 = !DILocation(line: 81, column: 11, scope: !349)
!359 = !DILocalVariable(name: "kr", scope: !349, file: !315, line: 83, type: !340)
!360 = !DILocation(line: 83, column: 11, scope: !349)
!361 = !DILocation(line: 85, column: 10, scope: !349)
!362 = !DILocation(line: 85, column: 3, scope: !349)
!363 = !DILocation(line: 88, column: 3, scope: !349)
!364 = !DILocation(line: 89, column: 3, scope: !349)
!365 = !DILocation(line: 92, column: 18, scope: !349)
!366 = !DILocation(line: 92, column: 27, scope: !349)
!367 = !DILocation(line: 92, column: 29, scope: !349)
!368 = !DILocation(line: 92, column: 3, scope: !349)
!369 = !DILocation(line: 94, column: 13, scope: !349)
!370 = !DILocation(line: 94, column: 3, scope: !349)
!371 = !DILocation(line: 95, column: 3, scope: !349)
!372 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_enc", scope: !315, file: !315, line: 113, type: !316, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !83, retainedNodes: !49)
!373 = !DILocalVariable(name: "ct", arg: 1, scope: !372, file: !315, line: 113, type: !32)
!374 = !DILocation(line: 0, scope: !372)
!375 = !DILocalVariable(name: "ss", arg: 2, scope: !372, file: !315, line: 114, type: !32)
!376 = !DILocalVariable(name: "pk", arg: 3, scope: !372, file: !315, line: 115, type: !318)
!377 = !DILocalVariable(name: "coins", scope: !372, file: !315, line: 117, type: !155)
!378 = !DILocation(line: 117, column: 11, scope: !372)
!379 = !DILocation(line: 118, column: 15, scope: !372)
!380 = !DILocation(line: 118, column: 3, scope: !372)
!381 = !DILocation(line: 119, column: 37, scope: !372)
!382 = !DILocation(line: 119, column: 3, scope: !372)
!383 = !DILocation(line: 120, column: 3, scope: !372)
!384 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_dec", scope: !315, file: !315, line: 140, type: !385, scopeLine: 143, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !83, retainedNodes: !49)
!385 = !DISubroutineType(types: !386)
!386 = !{!50, !32, !318, !318}
!387 = !DILocalVariable(name: "ss", arg: 1, scope: !384, file: !315, line: 140, type: !32)
!388 = !DILocation(line: 0, scope: !384)
!389 = !DILocalVariable(name: "ct", arg: 2, scope: !384, file: !315, line: 141, type: !318)
!390 = !DILocalVariable(name: "sk", arg: 3, scope: !384, file: !315, line: 142, type: !318)
!391 = !DILocalVariable(name: "buf", scope: !384, file: !315, line: 145, type: !340)
!392 = !DILocation(line: 145, column: 11, scope: !384)
!393 = !DILocalVariable(name: "kr", scope: !384, file: !315, line: 147, type: !340)
!394 = !DILocation(line: 147, column: 11, scope: !384)
!395 = !DILocalVariable(name: "cmp", scope: !384, file: !315, line: 149, type: !150)
!396 = !DILocation(line: 149, column: 11, scope: !384)
!397 = !DILocation(line: 150, column: 25, scope: !384)
!398 = !DILocalVariable(name: "pk", scope: !384, file: !315, line: 150, type: !318)
!399 = !DILocation(line: 152, column: 14, scope: !384)
!400 = !DILocation(line: 152, column: 3, scope: !384)
!401 = !DILocation(line: 155, column: 10, scope: !384)
!402 = !DILocation(line: 155, column: 13, scope: !384)
!403 = !DILocation(line: 155, column: 32, scope: !384)
!404 = !DILocation(line: 155, column: 53, scope: !384)
!405 = !DILocation(line: 155, column: 3, scope: !384)
!406 = !DILocation(line: 156, column: 3, scope: !384)
!407 = !DILocation(line: 159, column: 14, scope: !384)
!408 = !DILocation(line: 159, column: 19, scope: !384)
!409 = !DILocation(line: 159, column: 28, scope: !384)
!410 = !DILocation(line: 159, column: 30, scope: !384)
!411 = !DILocation(line: 159, column: 3, scope: !384)
!412 = !DILocation(line: 161, column: 21, scope: !384)
!413 = !DILocation(line: 161, column: 10, scope: !384)
!414 = !DILocalVariable(name: "fail", scope: !384, file: !315, line: 144, type: !50)
!415 = !DILocation(line: 164, column: 3, scope: !384)
!416 = !DILocation(line: 167, column: 11, scope: !384)
!417 = !DILocation(line: 167, column: 29, scope: !384)
!418 = !DILocation(line: 167, column: 3, scope: !384)
!419 = !DILocation(line: 169, column: 3, scope: !384)
!420 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_gen_matrix", scope: !421, file: !421, line: 165, type: !422, scopeLine: 166, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !49)
!421 = !DIFile(filename: "../../ref/indcpa.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!422 = !DISubroutineType(types: !423)
!423 = !{null, !424, !318, !50}
!424 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !425, size: 32)
!425 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyvec", file: !426, line: 10, baseType: !427)
!426 = !DIFile(filename: "../../ref/polyvec.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!427 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !426, line: 8, size: 8192, elements: !428)
!428 = !{!429}
!429 = !DIDerivedType(tag: DW_TAG_member, name: "vec", scope: !427, file: !426, line: 9, baseType: !430, size: 8192)
!430 = !DICompositeType(tag: DW_TAG_array_type, baseType: !431, size: 8192, elements: !439)
!431 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !432, line: 13, baseType: !433)
!432 = !DIFile(filename: "../../ref/poly.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!433 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !432, line: 11, size: 4096, elements: !434)
!434 = !{!435}
!435 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !433, file: !432, line: 12, baseType: !436, size: 4096)
!436 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 4096, elements: !437)
!437 = !{!438}
!438 = !DISubrange(count: 256)
!439 = !{!440}
!440 = !DISubrange(count: 2)
!441 = !DILocalVariable(name: "a", arg: 1, scope: !420, file: !421, line: 165, type: !424)
!442 = !DILocation(line: 0, scope: !420)
!443 = !DILocalVariable(name: "seed", arg: 2, scope: !420, file: !421, line: 165, type: !318)
!444 = !DILocalVariable(name: "transposed", arg: 3, scope: !420, file: !421, line: 165, type: !50)
!445 = !DILocalVariable(name: "buf", scope: !420, file: !421, line: 169, type: !446)
!446 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 4032, elements: !447)
!447 = !{!448}
!448 = !DISubrange(count: 504)
!449 = !DILocation(line: 169, column: 11, scope: !420)
!450 = !DILocalVariable(name: "state", scope: !420, file: !421, line: 170, type: !451)
!451 = !DIDerivedType(tag: DW_TAG_typedef, name: "xof_state", file: !452, line: 10, baseType: !453)
!452 = !DIFile(filename: "../../ref/symmetric.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!453 = !DIDerivedType(tag: DW_TAG_typedef, name: "keccak_state", file: !454, line: 17, baseType: !455)
!454 = !DIFile(filename: "../../ref/fips202.h", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!455 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !454, line: 14, size: 1664, elements: !456)
!456 = !{!457, !461}
!457 = !DIDerivedType(tag: DW_TAG_member, name: "s", scope: !455, file: !454, line: 15, baseType: !458, size: 1600)
!458 = !DICompositeType(tag: DW_TAG_array_type, baseType: !70, size: 1600, elements: !459)
!459 = !{!460}
!460 = !DISubrange(count: 25)
!461 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !455, file: !454, line: 16, baseType: !40, size: 32, offset: 1600)
!462 = !DILocation(line: 170, column: 13, scope: !420)
!463 = !DILocalVariable(name: "i", scope: !420, file: !421, line: 167, type: !40)
!464 = !DILocation(line: 172, column: 7, scope: !465)
!465 = distinct !DILexicalBlock(scope: !420, file: !421, line: 172, column: 3)
!466 = !DILocation(line: 172, scope: !465)
!467 = !DILocation(line: 172, column: 12, scope: !468)
!468 = distinct !DILexicalBlock(scope: !465, file: !421, line: 172, column: 3)
!469 = !DILocation(line: 172, column: 3, scope: !465)
!470 = !DILocalVariable(name: "j", scope: !420, file: !421, line: 167, type: !40)
!471 = !DILocation(line: 173, column: 9, scope: !472)
!472 = distinct !DILexicalBlock(scope: !473, file: !421, line: 173, column: 5)
!473 = distinct !DILexicalBlock(scope: !468, file: !421, line: 172, column: 26)
!474 = !DILocation(line: 173, scope: !472)
!475 = !DILocation(line: 173, column: 14, scope: !476)
!476 = distinct !DILexicalBlock(scope: !472, file: !421, line: 173, column: 5)
!477 = !DILocation(line: 173, column: 5, scope: !472)
!478 = !DILocation(line: 174, column: 10, scope: !479)
!479 = distinct !DILexicalBlock(scope: !480, file: !421, line: 174, column: 10)
!480 = distinct !DILexicalBlock(scope: !476, file: !421, line: 173, column: 28)
!481 = !DILocation(line: 175, column: 9, scope: !479)
!482 = !DILocation(line: 177, column: 9, scope: !479)
!483 = !DILocation(line: 179, column: 7, scope: !480)
!484 = !DILocalVariable(name: "buflen", scope: !420, file: !421, line: 168, type: !40)
!485 = !DILocation(line: 181, column: 25, scope: !480)
!486 = !DILocation(line: 181, column: 30, scope: !480)
!487 = !DILocation(line: 181, column: 37, scope: !480)
!488 = !DILocation(line: 181, column: 54, scope: !480)
!489 = !DILocation(line: 181, column: 13, scope: !480)
!490 = !DILocalVariable(name: "ctr", scope: !420, file: !421, line: 167, type: !40)
!491 = !DILocation(line: 183, column: 7, scope: !480)
!492 = !DILocation(line: 0, scope: !480)
!493 = !DILocation(line: 183, column: 17, scope: !480)
!494 = !DILocation(line: 184, column: 9, scope: !495)
!495 = distinct !DILexicalBlock(scope: !480, file: !421, line: 183, column: 28)
!496 = !DILocation(line: 186, column: 28, scope: !495)
!497 = !DILocation(line: 186, column: 33, scope: !495)
!498 = !DILocation(line: 186, column: 40, scope: !495)
!499 = !DILocation(line: 186, column: 47, scope: !495)
!500 = !DILocation(line: 186, column: 62, scope: !495)
!501 = !DILocation(line: 186, column: 69, scope: !495)
!502 = !DILocation(line: 186, column: 16, scope: !495)
!503 = !DILocation(line: 186, column: 13, scope: !495)
!504 = distinct !{!504, !491, !505, !132}
!505 = !DILocation(line: 187, column: 7, scope: !480)
!506 = !DILocation(line: 188, column: 5, scope: !480)
!507 = !DILocation(line: 173, column: 24, scope: !476)
!508 = !DILocation(line: 173, column: 5, scope: !476)
!509 = distinct !{!509, !477, !510, !132}
!510 = !DILocation(line: 188, column: 5, scope: !472)
!511 = !DILocation(line: 189, column: 3, scope: !473)
!512 = !DILocation(line: 172, column: 22, scope: !468)
!513 = !DILocation(line: 172, column: 3, scope: !468)
!514 = distinct !{!514, !469, !515, !132}
!515 = !DILocation(line: 189, column: 3, scope: !465)
!516 = !DILocation(line: 190, column: 1, scope: !420)
!517 = distinct !DISubprogram(name: "rej_uniform", scope: !421, file: !421, line: 121, type: !518, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!518 = !DISubroutineType(types: !519)
!519 = !{!40, !520, !40, !318, !40}
!520 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 32)
!521 = !DILocalVariable(name: "r", arg: 1, scope: !517, file: !421, line: 121, type: !520)
!522 = !DILocation(line: 0, scope: !517)
!523 = !DILocalVariable(name: "len", arg: 2, scope: !517, file: !421, line: 122, type: !40)
!524 = !DILocalVariable(name: "buf", arg: 3, scope: !517, file: !421, line: 123, type: !318)
!525 = !DILocalVariable(name: "buflen", arg: 4, scope: !517, file: !421, line: 124, type: !40)
!526 = !DILocalVariable(name: "pos", scope: !517, file: !421, line: 126, type: !40)
!527 = !DILocalVariable(name: "ctr", scope: !517, file: !421, line: 126, type: !40)
!528 = !DILocation(line: 130, column: 3, scope: !517)
!529 = !DILocation(line: 130, column: 13, scope: !517)
!530 = !DILocation(line: 130, column: 19, scope: !517)
!531 = !DILocation(line: 130, column: 26, scope: !517)
!532 = !DILocation(line: 130, column: 30, scope: !517)
!533 = !DILocation(line: 131, column: 21, scope: !534)
!534 = distinct !DILexicalBlock(scope: !517, file: !421, line: 130, column: 41)
!535 = !DILocation(line: 131, column: 14, scope: !534)
!536 = !DILocation(line: 131, column: 25, scope: !534)
!537 = !DILocation(line: 131, column: 51, scope: !534)
!538 = !DILocation(line: 131, column: 44, scope: !534)
!539 = !DILocation(line: 131, column: 34, scope: !534)
!540 = !DILocation(line: 131, column: 55, scope: !534)
!541 = !DILocation(line: 131, column: 31, scope: !534)
!542 = !DILocation(line: 131, column: 62, scope: !534)
!543 = !DILocation(line: 131, column: 12, scope: !534)
!544 = !DILocalVariable(name: "val0", scope: !517, file: !421, line: 127, type: !86)
!545 = !DILocation(line: 132, column: 21, scope: !534)
!546 = !DILocation(line: 132, column: 14, scope: !534)
!547 = !DILocation(line: 132, column: 25, scope: !534)
!548 = !DILocation(line: 132, column: 51, scope: !534)
!549 = !DILocation(line: 132, column: 44, scope: !534)
!550 = !DILocation(line: 132, column: 34, scope: !534)
!551 = !DILocation(line: 132, column: 55, scope: !534)
!552 = !DILocation(line: 132, column: 31, scope: !534)
!553 = !DILocation(line: 132, column: 62, scope: !534)
!554 = !DILocation(line: 132, column: 12, scope: !534)
!555 = !DILocalVariable(name: "val1", scope: !517, file: !421, line: 127, type: !86)
!556 = !DILocation(line: 133, column: 9, scope: !534)
!557 = !DILocation(line: 135, column: 8, scope: !558)
!558 = distinct !DILexicalBlock(scope: !534, file: !421, line: 135, column: 8)
!559 = !DILocation(line: 135, column: 13, scope: !558)
!560 = !DILocation(line: 136, column: 12, scope: !558)
!561 = !DILocation(line: 136, column: 7, scope: !558)
!562 = !DILocation(line: 136, column: 16, scope: !558)
!563 = !DILocation(line: 137, column: 12, scope: !564)
!564 = distinct !DILexicalBlock(scope: !534, file: !421, line: 137, column: 8)
!565 = !DILocation(line: 137, column: 18, scope: !564)
!566 = !DILocation(line: 137, column: 21, scope: !564)
!567 = !DILocation(line: 137, column: 26, scope: !564)
!568 = !DILocation(line: 138, column: 12, scope: !564)
!569 = !DILocation(line: 138, column: 7, scope: !564)
!570 = !DILocation(line: 138, column: 16, scope: !564)
!571 = !DILocation(line: 0, scope: !534)
!572 = distinct !{!572, !528, !573, !132}
!573 = !DILocation(line: 139, column: 3, scope: !517)
!574 = !DILocation(line: 141, column: 3, scope: !517)
!575 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_indcpa_keypair_derand", scope: !421, file: !421, line: 205, type: !576, scopeLine: 208, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !49)
!576 = !DISubroutineType(types: !577)
!577 = !{null, !32, !32, !318}
!578 = !DILocalVariable(name: "pk", arg: 1, scope: !575, file: !421, line: 205, type: !32)
!579 = !DILocation(line: 0, scope: !575)
!580 = !DILocalVariable(name: "sk", arg: 2, scope: !575, file: !421, line: 206, type: !32)
!581 = !DILocalVariable(name: "coins", arg: 3, scope: !575, file: !421, line: 207, type: !318)
!582 = !DILocalVariable(name: "buf", scope: !575, file: !421, line: 210, type: !340)
!583 = !DILocation(line: 210, column: 11, scope: !575)
!584 = !DILocation(line: 211, column: 31, scope: !575)
!585 = !DILocalVariable(name: "publicseed", scope: !575, file: !421, line: 211, type: !318)
!586 = !DILocation(line: 212, column: 30, scope: !575)
!587 = !DILocation(line: 212, column: 33, scope: !575)
!588 = !DILocalVariable(name: "noiseseed", scope: !575, file: !421, line: 212, type: !318)
!589 = !DILocalVariable(name: "nonce", scope: !575, file: !421, line: 213, type: !33)
!590 = !DILocalVariable(name: "a", scope: !575, file: !421, line: 214, type: !591)
!591 = !DICompositeType(tag: DW_TAG_array_type, baseType: !425, size: 16384, elements: !439)
!592 = !DILocation(line: 214, column: 11, scope: !575)
!593 = !DILocalVariable(name: "e", scope: !575, file: !421, line: 214, type: !425)
!594 = !DILocation(line: 214, column: 23, scope: !575)
!595 = !DILocalVariable(name: "pkpv", scope: !575, file: !421, line: 214, type: !425)
!596 = !DILocation(line: 214, column: 26, scope: !575)
!597 = !DILocalVariable(name: "skpv", scope: !575, file: !421, line: 214, type: !425)
!598 = !DILocation(line: 214, column: 32, scope: !575)
!599 = !DILocation(line: 216, column: 10, scope: !575)
!600 = !DILocation(line: 216, column: 3, scope: !575)
!601 = !DILocation(line: 217, column: 3, scope: !575)
!602 = !DILocation(line: 217, column: 23, scope: !575)
!603 = !DILocation(line: 218, column: 3, scope: !575)
!604 = !DILocation(line: 220, column: 3, scope: !575)
!605 = !DILocalVariable(name: "i", scope: !575, file: !421, line: 209, type: !40)
!606 = !DILocation(line: 222, column: 7, scope: !607)
!607 = distinct !DILexicalBlock(scope: !575, file: !421, line: 222, column: 3)
!608 = !DILocation(line: 222, scope: !607)
!609 = !DILocation(line: 222, column: 12, scope: !610)
!610 = distinct !DILexicalBlock(scope: !607, file: !421, line: 222, column: 3)
!611 = !DILocation(line: 222, column: 3, scope: !607)
!612 = !DILocation(line: 223, column: 30, scope: !610)
!613 = !DILocation(line: 223, column: 25, scope: !610)
!614 = !DILocation(line: 223, column: 54, scope: !610)
!615 = !DILocation(line: 223, column: 5, scope: !610)
!616 = !DILocation(line: 222, column: 22, scope: !610)
!617 = !DILocation(line: 222, column: 3, scope: !610)
!618 = distinct !{!618, !611, !619, !132}
!619 = !DILocation(line: 223, column: 56, scope: !607)
!620 = !DILocation(line: 224, column: 7, scope: !621)
!621 = distinct !DILexicalBlock(scope: !575, file: !421, line: 224, column: 3)
!622 = !DILocation(line: 224, scope: !621)
!623 = !DILocation(line: 224, column: 12, scope: !624)
!624 = distinct !DILexicalBlock(scope: !621, file: !421, line: 224, column: 3)
!625 = !DILocation(line: 224, column: 3, scope: !621)
!626 = !DILocation(line: 225, column: 27, scope: !624)
!627 = !DILocation(line: 225, column: 25, scope: !624)
!628 = !DILocation(line: 225, column: 51, scope: !624)
!629 = !DILocation(line: 225, column: 5, scope: !624)
!630 = !DILocation(line: 224, column: 22, scope: !624)
!631 = !DILocation(line: 224, column: 3, scope: !624)
!632 = distinct !{!632, !625, !633, !132}
!633 = !DILocation(line: 225, column: 53, scope: !621)
!634 = !DILocation(line: 227, column: 3, scope: !575)
!635 = !DILocation(line: 228, column: 3, scope: !575)
!636 = !DILocation(line: 231, column: 7, scope: !637)
!637 = distinct !DILexicalBlock(scope: !575, file: !421, line: 231, column: 3)
!638 = !DILocation(line: 231, scope: !637)
!639 = !DILocation(line: 231, column: 12, scope: !640)
!640 = distinct !DILexicalBlock(scope: !637, file: !421, line: 231, column: 3)
!641 = !DILocation(line: 231, column: 3, scope: !637)
!642 = !DILocation(line: 232, column: 42, scope: !643)
!643 = distinct !DILexicalBlock(scope: !640, file: !421, line: 231, column: 26)
!644 = !DILocation(line: 232, column: 37, scope: !643)
!645 = !DILocation(line: 232, column: 51, scope: !643)
!646 = !DILocation(line: 232, column: 5, scope: !643)
!647 = !DILocation(line: 233, column: 23, scope: !643)
!648 = !DILocation(line: 233, column: 18, scope: !643)
!649 = !DILocation(line: 233, column: 5, scope: !643)
!650 = !DILocation(line: 234, column: 3, scope: !643)
!651 = !DILocation(line: 231, column: 22, scope: !640)
!652 = !DILocation(line: 231, column: 3, scope: !640)
!653 = distinct !{!653, !641, !654, !132}
!654 = !DILocation(line: 234, column: 3, scope: !637)
!655 = !DILocation(line: 236, column: 3, scope: !575)
!656 = !DILocation(line: 237, column: 3, scope: !575)
!657 = !DILocation(line: 239, column: 3, scope: !575)
!658 = !DILocation(line: 240, column: 3, scope: !575)
!659 = !DILocation(line: 241, column: 1, scope: !575)
!660 = distinct !DISubprogram(name: "pack_sk", scope: !421, file: !421, line: 57, type: !661, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!661 = !DISubroutineType(types: !662)
!662 = !{null, !32, !424}
!663 = !DILocalVariable(name: "r", arg: 1, scope: !660, file: !421, line: 57, type: !32)
!664 = !DILocation(line: 0, scope: !660)
!665 = !DILocalVariable(name: "sk", arg: 2, scope: !660, file: !421, line: 57, type: !424)
!666 = !DILocation(line: 59, column: 3, scope: !660)
!667 = !DILocation(line: 60, column: 1, scope: !660)
!668 = distinct !DISubprogram(name: "pack_pk", scope: !421, file: !421, line: 23, type: !669, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!669 = !DISubroutineType(types: !670)
!670 = !{null, !32, !424, !318}
!671 = !DILocalVariable(name: "r", arg: 1, scope: !668, file: !421, line: 23, type: !32)
!672 = !DILocation(line: 0, scope: !668)
!673 = !DILocalVariable(name: "pk", arg: 2, scope: !668, file: !421, line: 24, type: !424)
!674 = !DILocalVariable(name: "seed", arg: 3, scope: !668, file: !421, line: 25, type: !318)
!675 = !DILocation(line: 27, column: 3, scope: !668)
!676 = !DILocation(line: 28, column: 11, scope: !668)
!677 = !DILocation(line: 28, column: 3, scope: !668)
!678 = !DILocation(line: 29, column: 1, scope: !668)
!679 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_indcpa_enc", scope: !421, file: !421, line: 260, type: !680, scopeLine: 264, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !49)
!680 = !DISubroutineType(types: !681)
!681 = !{null, !32, !318, !318, !318}
!682 = !DILocalVariable(name: "c", arg: 1, scope: !679, file: !421, line: 260, type: !32)
!683 = !DILocation(line: 0, scope: !679)
!684 = !DILocalVariable(name: "m", arg: 2, scope: !679, file: !421, line: 261, type: !318)
!685 = !DILocalVariable(name: "pk", arg: 3, scope: !679, file: !421, line: 262, type: !318)
!686 = !DILocalVariable(name: "coins", arg: 4, scope: !679, file: !421, line: 263, type: !318)
!687 = !DILocalVariable(name: "seed", scope: !679, file: !421, line: 266, type: !155)
!688 = !DILocation(line: 266, column: 11, scope: !679)
!689 = !DILocalVariable(name: "nonce", scope: !679, file: !421, line: 267, type: !33)
!690 = !DILocalVariable(name: "sp", scope: !679, file: !421, line: 268, type: !425)
!691 = !DILocation(line: 268, column: 11, scope: !679)
!692 = !DILocalVariable(name: "pkpv", scope: !679, file: !421, line: 268, type: !425)
!693 = !DILocation(line: 268, column: 15, scope: !679)
!694 = !DILocalVariable(name: "ep", scope: !679, file: !421, line: 268, type: !425)
!695 = !DILocation(line: 268, column: 21, scope: !679)
!696 = !DILocalVariable(name: "at", scope: !679, file: !421, line: 268, type: !591)
!697 = !DILocation(line: 268, column: 25, scope: !679)
!698 = !DILocalVariable(name: "b", scope: !679, file: !421, line: 268, type: !425)
!699 = !DILocation(line: 268, column: 38, scope: !679)
!700 = !DILocalVariable(name: "v", scope: !679, file: !421, line: 269, type: !431)
!701 = !DILocation(line: 269, column: 8, scope: !679)
!702 = !DILocalVariable(name: "k", scope: !679, file: !421, line: 269, type: !431)
!703 = !DILocation(line: 269, column: 11, scope: !679)
!704 = !DILocalVariable(name: "epp", scope: !679, file: !421, line: 269, type: !431)
!705 = !DILocation(line: 269, column: 14, scope: !679)
!706 = !DILocation(line: 271, column: 20, scope: !679)
!707 = !DILocation(line: 271, column: 3, scope: !679)
!708 = !DILocation(line: 272, column: 3, scope: !679)
!709 = !DILocation(line: 273, column: 3, scope: !679)
!710 = !DILocalVariable(name: "i", scope: !679, file: !421, line: 265, type: !40)
!711 = !DILocation(line: 275, column: 7, scope: !712)
!712 = distinct !DILexicalBlock(scope: !679, file: !421, line: 275, column: 3)
!713 = !DILocation(line: 275, scope: !712)
!714 = !DILocation(line: 275, column: 12, scope: !715)
!715 = distinct !DILexicalBlock(scope: !712, file: !421, line: 275, column: 3)
!716 = !DILocation(line: 275, column: 3, scope: !712)
!717 = !DILocation(line: 276, column: 27, scope: !715)
!718 = !DILocation(line: 276, column: 24, scope: !715)
!719 = !DILocation(line: 276, column: 30, scope: !715)
!720 = !DILocation(line: 276, column: 46, scope: !715)
!721 = !DILocation(line: 276, column: 5, scope: !715)
!722 = !DILocation(line: 275, column: 22, scope: !715)
!723 = !DILocation(line: 275, column: 3, scope: !715)
!724 = distinct !{!724, !716, !725, !132}
!725 = !DILocation(line: 276, column: 48, scope: !712)
!726 = !DILocation(line: 277, column: 7, scope: !727)
!727 = distinct !DILexicalBlock(scope: !679, file: !421, line: 277, column: 3)
!728 = !DILocation(line: 277, scope: !727)
!729 = !DILocation(line: 277, column: 12, scope: !730)
!730 = distinct !DILexicalBlock(scope: !727, file: !421, line: 277, column: 3)
!731 = !DILocation(line: 277, column: 3, scope: !727)
!732 = !DILocation(line: 278, column: 27, scope: !730)
!733 = !DILocation(line: 278, column: 24, scope: !730)
!734 = !DILocation(line: 278, column: 30, scope: !730)
!735 = !DILocation(line: 278, column: 46, scope: !730)
!736 = !DILocation(line: 278, column: 5, scope: !730)
!737 = !DILocation(line: 277, column: 22, scope: !730)
!738 = !DILocation(line: 277, column: 3, scope: !730)
!739 = distinct !{!739, !731, !740, !132}
!740 = !DILocation(line: 278, column: 48, scope: !727)
!741 = !DILocation(line: 279, column: 40, scope: !679)
!742 = !DILocation(line: 279, column: 3, scope: !679)
!743 = !DILocation(line: 281, column: 3, scope: !679)
!744 = !DILocation(line: 284, column: 7, scope: !745)
!745 = distinct !DILexicalBlock(scope: !679, file: !421, line: 284, column: 3)
!746 = !DILocation(line: 284, scope: !745)
!747 = !DILocation(line: 284, column: 12, scope: !748)
!748 = distinct !DILexicalBlock(scope: !745, file: !421, line: 284, column: 3)
!749 = !DILocation(line: 284, column: 3, scope: !745)
!750 = !DILocation(line: 285, column: 39, scope: !748)
!751 = !DILocation(line: 285, column: 37, scope: !748)
!752 = !DILocation(line: 285, column: 48, scope: !748)
!753 = !DILocation(line: 285, column: 5, scope: !748)
!754 = !DILocation(line: 284, column: 22, scope: !748)
!755 = !DILocation(line: 284, column: 3, scope: !748)
!756 = distinct !{!756, !749, !757, !132}
!757 = !DILocation(line: 285, column: 58, scope: !745)
!758 = !DILocation(line: 287, column: 3, scope: !679)
!759 = !DILocation(line: 289, column: 3, scope: !679)
!760 = !DILocation(line: 290, column: 3, scope: !679)
!761 = !DILocation(line: 292, column: 3, scope: !679)
!762 = !DILocation(line: 293, column: 3, scope: !679)
!763 = !DILocation(line: 294, column: 3, scope: !679)
!764 = !DILocation(line: 295, column: 3, scope: !679)
!765 = !DILocation(line: 296, column: 3, scope: !679)
!766 = !DILocation(line: 298, column: 3, scope: !679)
!767 = !DILocation(line: 299, column: 1, scope: !679)
!768 = distinct !DISubprogram(name: "unpack_pk", scope: !421, file: !421, line: 41, type: !769, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!769 = !DISubroutineType(types: !770)
!770 = !{null, !424, !32, !318}
!771 = !DILocalVariable(name: "pk", arg: 1, scope: !768, file: !421, line: 41, type: !424)
!772 = !DILocation(line: 0, scope: !768)
!773 = !DILocalVariable(name: "seed", arg: 2, scope: !768, file: !421, line: 42, type: !32)
!774 = !DILocalVariable(name: "packedpk", arg: 3, scope: !768, file: !421, line: 43, type: !318)
!775 = !DILocation(line: 45, column: 3, scope: !768)
!776 = !DILocation(line: 46, column: 24, scope: !768)
!777 = !DILocation(line: 46, column: 3, scope: !768)
!778 = !DILocation(line: 47, column: 1, scope: !768)
!779 = distinct !DISubprogram(name: "pack_ciphertext", scope: !421, file: !421, line: 86, type: !780, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!780 = !DISubroutineType(types: !781)
!781 = !{null, !32, !424, !782}
!782 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !431, size: 32)
!783 = !DILocalVariable(name: "r", arg: 1, scope: !779, file: !421, line: 86, type: !32)
!784 = !DILocation(line: 0, scope: !779)
!785 = !DILocalVariable(name: "b", arg: 2, scope: !779, file: !421, line: 86, type: !424)
!786 = !DILocalVariable(name: "v", arg: 3, scope: !779, file: !421, line: 86, type: !782)
!787 = !DILocation(line: 88, column: 3, scope: !779)
!788 = !DILocation(line: 89, column: 18, scope: !779)
!789 = !DILocation(line: 89, column: 3, scope: !779)
!790 = !DILocation(line: 90, column: 1, scope: !779)
!791 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_indcpa_dec", scope: !421, file: !421, line: 314, type: !792, scopeLine: 317, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !49)
!792 = !DISubroutineType(types: !793)
!793 = !{null, !32, !318, !318}
!794 = !DILocalVariable(name: "m", arg: 1, scope: !791, file: !421, line: 314, type: !32)
!795 = !DILocation(line: 0, scope: !791)
!796 = !DILocalVariable(name: "c", arg: 2, scope: !791, file: !421, line: 315, type: !318)
!797 = !DILocalVariable(name: "sk", arg: 3, scope: !791, file: !421, line: 316, type: !318)
!798 = !DILocalVariable(name: "b", scope: !791, file: !421, line: 318, type: !425)
!799 = !DILocation(line: 318, column: 11, scope: !791)
!800 = !DILocalVariable(name: "skpv", scope: !791, file: !421, line: 318, type: !425)
!801 = !DILocation(line: 318, column: 14, scope: !791)
!802 = !DILocalVariable(name: "v", scope: !791, file: !421, line: 319, type: !431)
!803 = !DILocation(line: 319, column: 8, scope: !791)
!804 = !DILocalVariable(name: "mp", scope: !791, file: !421, line: 319, type: !431)
!805 = !DILocation(line: 319, column: 11, scope: !791)
!806 = !DILocation(line: 321, column: 3, scope: !791)
!807 = !DILocation(line: 322, column: 3, scope: !791)
!808 = !DILocation(line: 324, column: 3, scope: !791)
!809 = !DILocation(line: 325, column: 3, scope: !791)
!810 = !DILocation(line: 326, column: 3, scope: !791)
!811 = !DILocation(line: 328, column: 3, scope: !791)
!812 = !DILocation(line: 329, column: 3, scope: !791)
!813 = !DILocation(line: 331, column: 3, scope: !791)
!814 = !DILocation(line: 332, column: 1, scope: !791)
!815 = distinct !DISubprogram(name: "unpack_ciphertext", scope: !421, file: !421, line: 102, type: !816, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!816 = !DISubroutineType(types: !817)
!817 = !{null, !424, !782, !318}
!818 = !DILocalVariable(name: "b", arg: 1, scope: !815, file: !421, line: 102, type: !424)
!819 = !DILocation(line: 0, scope: !815)
!820 = !DILocalVariable(name: "v", arg: 2, scope: !815, file: !421, line: 102, type: !782)
!821 = !DILocalVariable(name: "c", arg: 3, scope: !815, file: !421, line: 102, type: !318)
!822 = !DILocation(line: 104, column: 3, scope: !815)
!823 = !DILocation(line: 105, column: 23, scope: !815)
!824 = !DILocation(line: 105, column: 3, scope: !815)
!825 = !DILocation(line: 106, column: 1, scope: !815)
!826 = distinct !DISubprogram(name: "unpack_sk", scope: !421, file: !421, line: 70, type: !827, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !49)
!827 = !DISubroutineType(types: !828)
!828 = !{null, !424, !318}
!829 = !DILocalVariable(name: "sk", arg: 1, scope: !826, file: !421, line: 70, type: !424)
!830 = !DILocation(line: 0, scope: !826)
!831 = !DILocalVariable(name: "packedsk", arg: 2, scope: !826, file: !421, line: 70, type: !318)
!832 = !DILocation(line: 72, column: 3, scope: !826)
!833 = !DILocation(line: 73, column: 1, scope: !826)
!834 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_compress", scope: !835, file: !835, line: 15, type: !836, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!835 = !DIFile(filename: "../../ref/polyvec.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!836 = !DISubroutineType(types: !837)
!837 = !{null, !32, !838}
!838 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !839, size: 32)
!839 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !840)
!840 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyvec", file: !426, line: 10, baseType: !841)
!841 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !426, line: 8, size: 8192, elements: !842)
!842 = !{!843}
!843 = !DIDerivedType(tag: DW_TAG_member, name: "vec", scope: !841, file: !426, line: 9, baseType: !844, size: 8192)
!844 = !DICompositeType(tag: DW_TAG_array_type, baseType: !845, size: 8192, elements: !439)
!845 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !432, line: 13, baseType: !846)
!846 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !432, line: 11, size: 4096, elements: !847)
!847 = !{!848}
!848 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !846, file: !432, line: 12, baseType: !436, size: 4096)
!849 = !DILocalVariable(name: "r", arg: 1, scope: !834, file: !835, line: 15, type: !32)
!850 = !DILocation(line: 0, scope: !834)
!851 = !DILocalVariable(name: "a", arg: 2, scope: !834, file: !835, line: 15, type: !838)
!852 = !DILocalVariable(name: "t", scope: !834, file: !835, line: 51, type: !853)
!853 = !DICompositeType(tag: DW_TAG_array_type, baseType: !86, size: 64, elements: !854)
!854 = !{!855}
!855 = !DISubrange(count: 4)
!856 = !DILocation(line: 51, column: 12, scope: !834)
!857 = !DILocalVariable(name: "i", scope: !834, file: !835, line: 17, type: !40)
!858 = !DILocation(line: 52, column: 7, scope: !859)
!859 = distinct !DILexicalBlock(scope: !834, file: !835, line: 52, column: 3)
!860 = !DILocation(line: 52, scope: !859)
!861 = !DILocation(line: 52, column: 12, scope: !862)
!862 = distinct !DILexicalBlock(scope: !859, file: !835, line: 52, column: 3)
!863 = !DILocation(line: 52, column: 3, scope: !859)
!864 = !DILocalVariable(name: "j", scope: !834, file: !835, line: 17, type: !40)
!865 = !DILocation(line: 53, column: 9, scope: !866)
!866 = distinct !DILexicalBlock(scope: !867, file: !835, line: 53, column: 5)
!867 = distinct !DILexicalBlock(scope: !862, file: !835, line: 52, column: 26)
!868 = !DILocation(line: 53, scope: !866)
!869 = !DILocation(line: 53, column: 14, scope: !870)
!870 = distinct !DILexicalBlock(scope: !866, file: !835, line: 53, column: 5)
!871 = !DILocation(line: 53, column: 5, scope: !866)
!872 = !DILocalVariable(name: "k", scope: !834, file: !835, line: 17, type: !40)
!873 = !DILocation(line: 54, column: 11, scope: !874)
!874 = distinct !DILexicalBlock(scope: !875, file: !835, line: 54, column: 7)
!875 = distinct !DILexicalBlock(scope: !870, file: !835, line: 53, column: 30)
!876 = !DILocation(line: 54, scope: !874)
!877 = !DILocation(line: 54, column: 16, scope: !878)
!878 = distinct !DILexicalBlock(scope: !874, file: !835, line: 54, column: 7)
!879 = !DILocation(line: 54, column: 7, scope: !874)
!880 = !DILocation(line: 55, column: 20, scope: !881)
!881 = distinct !DILexicalBlock(scope: !878, file: !835, line: 54, column: 24)
!882 = !DILocation(line: 55, column: 17, scope: !881)
!883 = !DILocation(line: 55, column: 27, scope: !881)
!884 = !DILocation(line: 55, column: 35, scope: !881)
!885 = !DILocation(line: 55, column: 37, scope: !881)
!886 = !DILocation(line: 55, column: 9, scope: !881)
!887 = !DILocation(line: 55, column: 15, scope: !881)
!888 = !DILocation(line: 56, column: 27, scope: !881)
!889 = !DILocation(line: 56, column: 18, scope: !881)
!890 = !DILocation(line: 56, column: 32, scope: !881)
!891 = !DILocation(line: 56, column: 39, scope: !881)
!892 = !DILocation(line: 56, column: 9, scope: !881)
!893 = !DILocation(line: 56, column: 14, scope: !881)
!894 = !DILocation(line: 58, column: 14, scope: !881)
!895 = !DILocalVariable(name: "d0", scope: !834, file: !835, line: 18, type: !70)
!896 = !DILocation(line: 59, column: 12, scope: !881)
!897 = !DILocation(line: 60, column: 12, scope: !881)
!898 = !DILocation(line: 61, column: 12, scope: !881)
!899 = !DILocation(line: 62, column: 12, scope: !881)
!900 = !DILocation(line: 63, column: 19, scope: !881)
!901 = !DILocation(line: 63, column: 16, scope: !881)
!902 = !DILocation(line: 63, column: 9, scope: !881)
!903 = !DILocation(line: 63, column: 14, scope: !881)
!904 = !DILocation(line: 64, column: 7, scope: !881)
!905 = !DILocation(line: 54, column: 20, scope: !878)
!906 = !DILocation(line: 54, column: 7, scope: !878)
!907 = distinct !{!907, !879, !908, !132}
!908 = !DILocation(line: 64, column: 7, scope: !874)
!909 = !DILocation(line: 66, column: 15, scope: !875)
!910 = !DILocation(line: 66, column: 20, scope: !875)
!911 = !DILocation(line: 66, column: 14, scope: !875)
!912 = !DILocation(line: 66, column: 7, scope: !875)
!913 = !DILocation(line: 66, column: 12, scope: !875)
!914 = !DILocation(line: 67, column: 15, scope: !875)
!915 = !DILocation(line: 67, column: 20, scope: !875)
!916 = !DILocation(line: 67, column: 29, scope: !875)
!917 = !DILocation(line: 67, column: 34, scope: !875)
!918 = !DILocation(line: 67, column: 26, scope: !875)
!919 = !DILocation(line: 67, column: 14, scope: !875)
!920 = !DILocation(line: 67, column: 7, scope: !875)
!921 = !DILocation(line: 67, column: 12, scope: !875)
!922 = !DILocation(line: 68, column: 15, scope: !875)
!923 = !DILocation(line: 68, column: 20, scope: !875)
!924 = !DILocation(line: 68, column: 29, scope: !875)
!925 = !DILocation(line: 68, column: 34, scope: !875)
!926 = !DILocation(line: 68, column: 26, scope: !875)
!927 = !DILocation(line: 68, column: 14, scope: !875)
!928 = !DILocation(line: 68, column: 7, scope: !875)
!929 = !DILocation(line: 68, column: 12, scope: !875)
!930 = !DILocation(line: 69, column: 15, scope: !875)
!931 = !DILocation(line: 69, column: 20, scope: !875)
!932 = !DILocation(line: 69, column: 29, scope: !875)
!933 = !DILocation(line: 69, column: 34, scope: !875)
!934 = !DILocation(line: 69, column: 26, scope: !875)
!935 = !DILocation(line: 69, column: 14, scope: !875)
!936 = !DILocation(line: 69, column: 7, scope: !875)
!937 = !DILocation(line: 69, column: 12, scope: !875)
!938 = !DILocation(line: 70, column: 15, scope: !875)
!939 = !DILocation(line: 70, column: 20, scope: !875)
!940 = !DILocation(line: 70, column: 14, scope: !875)
!941 = !DILocation(line: 70, column: 7, scope: !875)
!942 = !DILocation(line: 70, column: 12, scope: !875)
!943 = !DILocation(line: 71, column: 9, scope: !875)
!944 = !DILocation(line: 72, column: 5, scope: !875)
!945 = !DILocation(line: 53, column: 26, scope: !870)
!946 = !DILocation(line: 53, column: 5, scope: !870)
!947 = distinct !{!947, !871, !948, !132}
!948 = !DILocation(line: 72, column: 5, scope: !866)
!949 = !DILocation(line: 73, column: 3, scope: !867)
!950 = !DILocation(line: 52, column: 22, scope: !862)
!951 = !DILocation(line: 52, column: 3, scope: !862)
!952 = distinct !{!952, !863, !953, !132}
!953 = !DILocation(line: 73, column: 3, scope: !859)
!954 = !DILocation(line: 77, column: 1, scope: !834)
!955 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_decompress", scope: !835, file: !835, line: 89, type: !956, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!956 = !DISubroutineType(types: !957)
!957 = !{null, !958, !318}
!958 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !840, size: 32)
!959 = !DILocalVariable(name: "r", arg: 1, scope: !955, file: !835, line: 89, type: !958)
!960 = !DILocation(line: 0, scope: !955)
!961 = !DILocalVariable(name: "a", arg: 2, scope: !955, file: !835, line: 89, type: !318)
!962 = !DILocalVariable(name: "t", scope: !955, file: !835, line: 112, type: !853)
!963 = !DILocation(line: 112, column: 12, scope: !955)
!964 = !DILocalVariable(name: "i", scope: !955, file: !835, line: 91, type: !40)
!965 = !DILocation(line: 113, column: 7, scope: !966)
!966 = distinct !DILexicalBlock(scope: !955, file: !835, line: 113, column: 3)
!967 = !DILocation(line: 113, scope: !966)
!968 = !DILocation(line: 113, column: 12, scope: !969)
!969 = distinct !DILexicalBlock(scope: !966, file: !835, line: 113, column: 3)
!970 = !DILocation(line: 113, column: 3, scope: !966)
!971 = !DILocalVariable(name: "j", scope: !955, file: !835, line: 91, type: !40)
!972 = !DILocation(line: 114, column: 9, scope: !973)
!973 = distinct !DILexicalBlock(scope: !974, file: !835, line: 114, column: 5)
!974 = distinct !DILexicalBlock(scope: !969, file: !835, line: 113, column: 26)
!975 = !DILocation(line: 114, scope: !973)
!976 = !DILocation(line: 114, column: 14, scope: !977)
!977 = distinct !DILexicalBlock(scope: !973, file: !835, line: 114, column: 5)
!978 = !DILocation(line: 114, column: 5, scope: !973)
!979 = !DILocation(line: 115, column: 15, scope: !980)
!980 = distinct !DILexicalBlock(scope: !977, file: !835, line: 114, column: 30)
!981 = !DILocation(line: 115, column: 20, scope: !980)
!982 = !DILocation(line: 115, column: 39, scope: !980)
!983 = !DILocation(line: 115, column: 29, scope: !980)
!984 = !DILocation(line: 115, column: 44, scope: !980)
!985 = !DILocation(line: 115, column: 26, scope: !980)
!986 = !DILocation(line: 115, column: 14, scope: !980)
!987 = !DILocation(line: 115, column: 7, scope: !980)
!988 = !DILocation(line: 115, column: 12, scope: !980)
!989 = !DILocation(line: 116, column: 15, scope: !980)
!990 = !DILocation(line: 116, column: 20, scope: !980)
!991 = !DILocation(line: 116, column: 39, scope: !980)
!992 = !DILocation(line: 116, column: 29, scope: !980)
!993 = !DILocation(line: 116, column: 44, scope: !980)
!994 = !DILocation(line: 116, column: 26, scope: !980)
!995 = !DILocation(line: 116, column: 14, scope: !980)
!996 = !DILocation(line: 116, column: 7, scope: !980)
!997 = !DILocation(line: 116, column: 12, scope: !980)
!998 = !DILocation(line: 117, column: 15, scope: !980)
!999 = !DILocation(line: 117, column: 20, scope: !980)
!1000 = !DILocation(line: 117, column: 39, scope: !980)
!1001 = !DILocation(line: 117, column: 29, scope: !980)
!1002 = !DILocation(line: 117, column: 44, scope: !980)
!1003 = !DILocation(line: 117, column: 26, scope: !980)
!1004 = !DILocation(line: 117, column: 14, scope: !980)
!1005 = !DILocation(line: 117, column: 7, scope: !980)
!1006 = !DILocation(line: 117, column: 12, scope: !980)
!1007 = !DILocation(line: 118, column: 15, scope: !980)
!1008 = !DILocation(line: 118, column: 20, scope: !980)
!1009 = !DILocation(line: 118, column: 39, scope: !980)
!1010 = !DILocation(line: 118, column: 29, scope: !980)
!1011 = !DILocation(line: 118, column: 44, scope: !980)
!1012 = !DILocation(line: 118, column: 26, scope: !980)
!1013 = !DILocation(line: 118, column: 14, scope: !980)
!1014 = !DILocation(line: 118, column: 7, scope: !980)
!1015 = !DILocation(line: 118, column: 12, scope: !980)
!1016 = !DILocation(line: 119, column: 9, scope: !980)
!1017 = !DILocalVariable(name: "k", scope: !955, file: !835, line: 91, type: !40)
!1018 = !DILocation(line: 121, column: 11, scope: !1019)
!1019 = distinct !DILexicalBlock(scope: !980, file: !835, line: 121, column: 7)
!1020 = !DILocation(line: 121, scope: !1019)
!1021 = !DILocation(line: 121, column: 16, scope: !1022)
!1022 = distinct !DILexicalBlock(scope: !1019, file: !835, line: 121, column: 7)
!1023 = !DILocation(line: 121, column: 7, scope: !1019)
!1024 = !DILocation(line: 122, column: 47, scope: !1022)
!1025 = !DILocation(line: 122, column: 52, scope: !1022)
!1026 = !DILocation(line: 122, column: 60, scope: !1022)
!1027 = !DILocation(line: 122, column: 69, scope: !1022)
!1028 = !DILocation(line: 122, column: 76, scope: !1022)
!1029 = !DILocation(line: 122, column: 35, scope: !1022)
!1030 = !DILocation(line: 122, column: 12, scope: !1022)
!1031 = !DILocation(line: 122, column: 9, scope: !1022)
!1032 = !DILocation(line: 122, column: 19, scope: !1022)
!1033 = !DILocation(line: 122, column: 27, scope: !1022)
!1034 = !DILocation(line: 122, column: 29, scope: !1022)
!1035 = !DILocation(line: 122, column: 33, scope: !1022)
!1036 = !DILocation(line: 121, column: 20, scope: !1022)
!1037 = !DILocation(line: 121, column: 7, scope: !1022)
!1038 = distinct !{!1038, !1023, !1039, !132}
!1039 = !DILocation(line: 122, column: 79, scope: !1019)
!1040 = !DILocation(line: 123, column: 5, scope: !980)
!1041 = !DILocation(line: 114, column: 26, scope: !977)
!1042 = !DILocation(line: 114, column: 5, scope: !977)
!1043 = distinct !{!1043, !978, !1044, !132}
!1044 = !DILocation(line: 123, column: 5, scope: !973)
!1045 = !DILocation(line: 124, column: 3, scope: !974)
!1046 = !DILocation(line: 113, column: 22, scope: !969)
!1047 = !DILocation(line: 113, column: 3, scope: !969)
!1048 = distinct !{!1048, !970, !1049, !132}
!1049 = !DILocation(line: 124, column: 3, scope: !966)
!1050 = !DILocation(line: 128, column: 1, scope: !955)
!1051 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_tobytes", scope: !835, file: !835, line: 139, type: !836, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1052 = !DILocalVariable(name: "r", arg: 1, scope: !1051, file: !835, line: 139, type: !32)
!1053 = !DILocation(line: 0, scope: !1051)
!1054 = !DILocalVariable(name: "a", arg: 2, scope: !1051, file: !835, line: 139, type: !838)
!1055 = !DILocalVariable(name: "i", scope: !1051, file: !835, line: 141, type: !40)
!1056 = !DILocation(line: 142, column: 7, scope: !1057)
!1057 = distinct !DILexicalBlock(scope: !1051, file: !835, line: 142, column: 3)
!1058 = !DILocation(line: 142, scope: !1057)
!1059 = !DILocation(line: 142, column: 12, scope: !1060)
!1060 = distinct !DILexicalBlock(scope: !1057, file: !835, line: 142, column: 3)
!1061 = !DILocation(line: 142, column: 3, scope: !1057)
!1062 = !DILocation(line: 143, column: 21, scope: !1060)
!1063 = !DILocation(line: 143, column: 19, scope: !1060)
!1064 = !DILocation(line: 143, column: 43, scope: !1060)
!1065 = !DILocation(line: 143, column: 40, scope: !1060)
!1066 = !DILocation(line: 143, column: 5, scope: !1060)
!1067 = !DILocation(line: 142, column: 22, scope: !1060)
!1068 = !DILocation(line: 142, column: 3, scope: !1060)
!1069 = distinct !{!1069, !1061, !1070, !132}
!1070 = !DILocation(line: 143, column: 49, scope: !1057)
!1071 = !DILocation(line: 144, column: 1, scope: !1051)
!1072 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_frombytes", scope: !835, file: !835, line: 156, type: !956, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1073 = !DILocalVariable(name: "r", arg: 1, scope: !1072, file: !835, line: 156, type: !958)
!1074 = !DILocation(line: 0, scope: !1072)
!1075 = !DILocalVariable(name: "a", arg: 2, scope: !1072, file: !835, line: 156, type: !318)
!1076 = !DILocalVariable(name: "i", scope: !1072, file: !835, line: 158, type: !40)
!1077 = !DILocation(line: 159, column: 7, scope: !1078)
!1078 = distinct !DILexicalBlock(scope: !1072, file: !835, line: 159, column: 3)
!1079 = !DILocation(line: 159, scope: !1078)
!1080 = !DILocation(line: 159, column: 12, scope: !1081)
!1081 = distinct !DILexicalBlock(scope: !1078, file: !835, line: 159, column: 3)
!1082 = !DILocation(line: 159, column: 3, scope: !1078)
!1083 = !DILocation(line: 160, column: 24, scope: !1081)
!1084 = !DILocation(line: 160, column: 21, scope: !1081)
!1085 = !DILocation(line: 160, column: 35, scope: !1081)
!1086 = !DILocation(line: 160, column: 33, scope: !1081)
!1087 = !DILocation(line: 160, column: 5, scope: !1081)
!1088 = !DILocation(line: 159, column: 22, scope: !1081)
!1089 = !DILocation(line: 159, column: 3, scope: !1081)
!1090 = distinct !{!1090, !1082, !1091, !132}
!1091 = !DILocation(line: 160, column: 51, scope: !1078)
!1092 = !DILocation(line: 161, column: 1, scope: !1072)
!1093 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_ntt", scope: !835, file: !835, line: 170, type: !1094, scopeLine: 171, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1094 = !DISubroutineType(types: !1095)
!1095 = !{null, !958}
!1096 = !DILocalVariable(name: "r", arg: 1, scope: !1093, file: !835, line: 170, type: !958)
!1097 = !DILocation(line: 0, scope: !1093)
!1098 = !DILocalVariable(name: "i", scope: !1093, file: !835, line: 172, type: !40)
!1099 = !DILocation(line: 173, column: 7, scope: !1100)
!1100 = distinct !DILexicalBlock(scope: !1093, file: !835, line: 173, column: 3)
!1101 = !DILocation(line: 173, scope: !1100)
!1102 = !DILocation(line: 173, column: 12, scope: !1103)
!1103 = distinct !DILexicalBlock(scope: !1100, file: !835, line: 173, column: 3)
!1104 = !DILocation(line: 173, column: 3, scope: !1100)
!1105 = !DILocation(line: 174, column: 18, scope: !1103)
!1106 = !DILocation(line: 174, column: 15, scope: !1103)
!1107 = !DILocation(line: 174, column: 5, scope: !1103)
!1108 = !DILocation(line: 173, column: 22, scope: !1103)
!1109 = !DILocation(line: 173, column: 3, scope: !1103)
!1110 = distinct !{!1110, !1104, !1111, !132}
!1111 = !DILocation(line: 174, column: 24, scope: !1100)
!1112 = !DILocation(line: 175, column: 1, scope: !1093)
!1113 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_invntt_tomont", scope: !835, file: !835, line: 185, type: !1094, scopeLine: 186, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1114 = !DILocalVariable(name: "r", arg: 1, scope: !1113, file: !835, line: 185, type: !958)
!1115 = !DILocation(line: 0, scope: !1113)
!1116 = !DILocalVariable(name: "i", scope: !1113, file: !835, line: 187, type: !40)
!1117 = !DILocation(line: 188, column: 7, scope: !1118)
!1118 = distinct !DILexicalBlock(scope: !1113, file: !835, line: 188, column: 3)
!1119 = !DILocation(line: 188, scope: !1118)
!1120 = !DILocation(line: 188, column: 12, scope: !1121)
!1121 = distinct !DILexicalBlock(scope: !1118, file: !835, line: 188, column: 3)
!1122 = !DILocation(line: 188, column: 3, scope: !1118)
!1123 = !DILocation(line: 189, column: 28, scope: !1121)
!1124 = !DILocation(line: 189, column: 25, scope: !1121)
!1125 = !DILocation(line: 189, column: 5, scope: !1121)
!1126 = !DILocation(line: 188, column: 22, scope: !1121)
!1127 = !DILocation(line: 188, column: 3, scope: !1121)
!1128 = distinct !{!1128, !1122, !1129, !132}
!1129 = !DILocation(line: 189, column: 34, scope: !1118)
!1130 = !DILocation(line: 190, column: 1, scope: !1113)
!1131 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_basemul_acc_montgomery", scope: !835, file: !835, line: 202, type: !1132, scopeLine: 203, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1132 = !DISubroutineType(types: !1133)
!1133 = !{null, !1134, !838, !838}
!1134 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !845, size: 32)
!1135 = !DILocalVariable(name: "r", arg: 1, scope: !1131, file: !835, line: 202, type: !1134)
!1136 = !DILocation(line: 0, scope: !1131)
!1137 = !DILocalVariable(name: "a", arg: 2, scope: !1131, file: !835, line: 202, type: !838)
!1138 = !DILocalVariable(name: "b", arg: 3, scope: !1131, file: !835, line: 202, type: !838)
!1139 = !DILocalVariable(name: "t", scope: !1131, file: !835, line: 205, type: !845)
!1140 = !DILocation(line: 205, column: 8, scope: !1131)
!1141 = !DILocation(line: 207, column: 34, scope: !1131)
!1142 = !DILocation(line: 207, column: 31, scope: !1131)
!1143 = !DILocation(line: 207, column: 46, scope: !1131)
!1144 = !DILocation(line: 207, column: 43, scope: !1131)
!1145 = !DILocation(line: 207, column: 3, scope: !1131)
!1146 = !DILocalVariable(name: "i", scope: !1131, file: !835, line: 204, type: !40)
!1147 = !DILocation(line: 208, column: 7, scope: !1148)
!1148 = distinct !DILexicalBlock(scope: !1131, file: !835, line: 208, column: 3)
!1149 = !DILocation(line: 208, scope: !1148)
!1150 = !DILocation(line: 208, column: 12, scope: !1151)
!1151 = distinct !DILexicalBlock(scope: !1148, file: !835, line: 208, column: 3)
!1152 = !DILocation(line: 208, column: 3, scope: !1148)
!1153 = !DILocation(line: 209, column: 37, scope: !1154)
!1154 = distinct !DILexicalBlock(scope: !1151, file: !835, line: 208, column: 26)
!1155 = !DILocation(line: 209, column: 34, scope: !1154)
!1156 = !DILocation(line: 209, column: 49, scope: !1154)
!1157 = !DILocation(line: 209, column: 46, scope: !1154)
!1158 = !DILocation(line: 209, column: 5, scope: !1154)
!1159 = !DILocation(line: 210, column: 5, scope: !1154)
!1160 = !DILocation(line: 211, column: 3, scope: !1154)
!1161 = !DILocation(line: 208, column: 22, scope: !1151)
!1162 = !DILocation(line: 208, column: 3, scope: !1151)
!1163 = distinct !{!1163, !1152, !1164, !132}
!1164 = !DILocation(line: 211, column: 3, scope: !1148)
!1165 = !DILocation(line: 213, column: 3, scope: !1131)
!1166 = !DILocation(line: 214, column: 1, scope: !1131)
!1167 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_reduce", scope: !835, file: !835, line: 225, type: !1094, scopeLine: 226, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1168 = !DILocalVariable(name: "r", arg: 1, scope: !1167, file: !835, line: 225, type: !958)
!1169 = !DILocation(line: 0, scope: !1167)
!1170 = !DILocalVariable(name: "i", scope: !1167, file: !835, line: 227, type: !40)
!1171 = !DILocation(line: 228, column: 7, scope: !1172)
!1172 = distinct !DILexicalBlock(scope: !1167, file: !835, line: 228, column: 3)
!1173 = !DILocation(line: 228, scope: !1172)
!1174 = !DILocation(line: 228, column: 12, scope: !1175)
!1175 = distinct !DILexicalBlock(scope: !1172, file: !835, line: 228, column: 3)
!1176 = !DILocation(line: 228, column: 3, scope: !1172)
!1177 = !DILocation(line: 229, column: 21, scope: !1175)
!1178 = !DILocation(line: 229, column: 18, scope: !1175)
!1179 = !DILocation(line: 229, column: 5, scope: !1175)
!1180 = !DILocation(line: 228, column: 22, scope: !1175)
!1181 = !DILocation(line: 228, column: 3, scope: !1175)
!1182 = distinct !{!1182, !1176, !1183, !132}
!1183 = !DILocation(line: 229, column: 27, scope: !1172)
!1184 = !DILocation(line: 230, column: 1, scope: !1167)
!1185 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_polyvec_add", scope: !835, file: !835, line: 241, type: !1186, scopeLine: 242, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !89, retainedNodes: !49)
!1186 = !DISubroutineType(types: !1187)
!1187 = !{null, !958, !838, !838}
!1188 = !DILocalVariable(name: "r", arg: 1, scope: !1185, file: !835, line: 241, type: !958)
!1189 = !DILocation(line: 0, scope: !1185)
!1190 = !DILocalVariable(name: "a", arg: 2, scope: !1185, file: !835, line: 241, type: !838)
!1191 = !DILocalVariable(name: "b", arg: 3, scope: !1185, file: !835, line: 241, type: !838)
!1192 = !DILocalVariable(name: "i", scope: !1185, file: !835, line: 243, type: !40)
!1193 = !DILocation(line: 244, column: 7, scope: !1194)
!1194 = distinct !DILexicalBlock(scope: !1185, file: !835, line: 244, column: 3)
!1195 = !DILocation(line: 244, scope: !1194)
!1196 = !DILocation(line: 244, column: 12, scope: !1197)
!1197 = distinct !DILexicalBlock(scope: !1194, file: !835, line: 244, column: 3)
!1198 = !DILocation(line: 244, column: 3, scope: !1194)
!1199 = !DILocation(line: 245, column: 18, scope: !1197)
!1200 = !DILocation(line: 245, column: 15, scope: !1197)
!1201 = !DILocation(line: 245, column: 30, scope: !1197)
!1202 = !DILocation(line: 245, column: 27, scope: !1197)
!1203 = !DILocation(line: 245, column: 42, scope: !1197)
!1204 = !DILocation(line: 245, column: 39, scope: !1197)
!1205 = !DILocation(line: 245, column: 5, scope: !1197)
!1206 = !DILocation(line: 244, column: 22, scope: !1197)
!1207 = !DILocation(line: 244, column: 3, scope: !1197)
!1208 = distinct !{!1208, !1198, !1209, !132}
!1209 = !DILocation(line: 245, column: 48, scope: !1194)
!1210 = !DILocation(line: 246, column: 1, scope: !1185)
!1211 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_compress", scope: !1212, file: !1212, line: 19, type: !1213, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1212 = !DIFile(filename: "../../ref/poly.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!1213 = !DISubroutineType(types: !1214)
!1214 = !{null, !32, !1215}
!1215 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1216, size: 32)
!1216 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1217)
!1217 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !432, line: 13, baseType: !1218)
!1218 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !432, line: 11, size: 4096, elements: !1219)
!1219 = !{!1220}
!1220 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !1218, file: !432, line: 12, baseType: !436, size: 4096)
!1221 = !DILocalVariable(name: "r", arg: 1, scope: !1211, file: !1212, line: 19, type: !32)
!1222 = !DILocation(line: 0, scope: !1211)
!1223 = !DILocalVariable(name: "a", arg: 2, scope: !1211, file: !1212, line: 19, type: !1215)
!1224 = !DILocalVariable(name: "t", scope: !1211, file: !1212, line: 24, type: !1225)
!1225 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 64, elements: !1226)
!1226 = !{!1227}
!1227 = !DISubrange(count: 8)
!1228 = !DILocation(line: 24, column: 11, scope: !1211)
!1229 = !DILocalVariable(name: "i", scope: !1211, file: !1212, line: 21, type: !40)
!1230 = !DILocation(line: 28, column: 7, scope: !1231)
!1231 = distinct !DILexicalBlock(scope: !1211, file: !1212, line: 28, column: 3)
!1232 = !DILocation(line: 28, scope: !1231)
!1233 = !DILocation(line: 28, column: 12, scope: !1234)
!1234 = distinct !DILexicalBlock(scope: !1231, file: !1212, line: 28, column: 3)
!1235 = !DILocation(line: 28, column: 3, scope: !1231)
!1236 = !DILocalVariable(name: "j", scope: !1211, file: !1212, line: 21, type: !40)
!1237 = !DILocation(line: 29, column: 9, scope: !1238)
!1238 = distinct !DILexicalBlock(scope: !1239, file: !1212, line: 29, column: 5)
!1239 = distinct !DILexicalBlock(scope: !1234, file: !1212, line: 28, column: 28)
!1240 = !DILocation(line: 29, scope: !1238)
!1241 = !DILocation(line: 29, column: 14, scope: !1242)
!1242 = distinct !DILexicalBlock(scope: !1238, file: !1212, line: 29, column: 5)
!1243 = !DILocation(line: 29, column: 5, scope: !1238)
!1244 = !DILocation(line: 31, column: 15, scope: !1245)
!1245 = distinct !DILexicalBlock(scope: !1242, file: !1212, line: 29, column: 22)
!1246 = !DILocation(line: 31, column: 23, scope: !1245)
!1247 = !DILocation(line: 31, column: 25, scope: !1245)
!1248 = !DILocation(line: 31, column: 12, scope: !1245)
!1249 = !DILocalVariable(name: "u", scope: !1211, file: !1212, line: 22, type: !61)
!1250 = !DILocation(line: 32, column: 13, scope: !1245)
!1251 = !DILocation(line: 32, column: 15, scope: !1245)
!1252 = !DILocation(line: 32, column: 22, scope: !1245)
!1253 = !DILocation(line: 32, column: 9, scope: !1245)
!1254 = !DILocation(line: 34, column: 12, scope: !1245)
!1255 = !DILocation(line: 34, column: 14, scope: !1245)
!1256 = !DILocalVariable(name: "d0", scope: !1211, file: !1212, line: 23, type: !91)
!1257 = !DILocation(line: 35, column: 10, scope: !1245)
!1258 = !DILocation(line: 36, column: 10, scope: !1245)
!1259 = !DILocation(line: 37, column: 10, scope: !1245)
!1260 = !DILocation(line: 38, column: 17, scope: !1245)
!1261 = !DILocation(line: 38, column: 14, scope: !1245)
!1262 = !DILocation(line: 38, column: 7, scope: !1245)
!1263 = !DILocation(line: 38, column: 12, scope: !1245)
!1264 = !DILocation(line: 39, column: 5, scope: !1245)
!1265 = !DILocation(line: 29, column: 18, scope: !1242)
!1266 = !DILocation(line: 29, column: 5, scope: !1242)
!1267 = distinct !{!1267, !1243, !1268, !132}
!1268 = !DILocation(line: 39, column: 5, scope: !1238)
!1269 = !DILocation(line: 41, column: 12, scope: !1239)
!1270 = !DILocation(line: 41, column: 20, scope: !1239)
!1271 = !DILocation(line: 41, column: 25, scope: !1239)
!1272 = !DILocation(line: 41, column: 17, scope: !1239)
!1273 = !DILocation(line: 41, column: 5, scope: !1239)
!1274 = !DILocation(line: 41, column: 10, scope: !1239)
!1275 = !DILocation(line: 42, column: 12, scope: !1239)
!1276 = !DILocation(line: 42, column: 20, scope: !1239)
!1277 = !DILocation(line: 42, column: 25, scope: !1239)
!1278 = !DILocation(line: 42, column: 17, scope: !1239)
!1279 = !DILocation(line: 42, column: 5, scope: !1239)
!1280 = !DILocation(line: 42, column: 10, scope: !1239)
!1281 = !DILocation(line: 43, column: 12, scope: !1239)
!1282 = !DILocation(line: 43, column: 20, scope: !1239)
!1283 = !DILocation(line: 43, column: 25, scope: !1239)
!1284 = !DILocation(line: 43, column: 17, scope: !1239)
!1285 = !DILocation(line: 43, column: 5, scope: !1239)
!1286 = !DILocation(line: 43, column: 10, scope: !1239)
!1287 = !DILocation(line: 44, column: 12, scope: !1239)
!1288 = !DILocation(line: 44, column: 20, scope: !1239)
!1289 = !DILocation(line: 44, column: 25, scope: !1239)
!1290 = !DILocation(line: 44, column: 17, scope: !1239)
!1291 = !DILocation(line: 44, column: 5, scope: !1239)
!1292 = !DILocation(line: 44, column: 10, scope: !1239)
!1293 = !DILocation(line: 45, column: 7, scope: !1239)
!1294 = !DILocation(line: 46, column: 3, scope: !1239)
!1295 = !DILocation(line: 28, column: 24, scope: !1234)
!1296 = !DILocation(line: 28, column: 3, scope: !1234)
!1297 = distinct !{!1297, !1235, !1298, !132}
!1298 = !DILocation(line: 46, column: 3, scope: !1231)
!1299 = !DILocation(line: 71, column: 1, scope: !1211)
!1300 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_decompress", scope: !1212, file: !1212, line: 83, type: !1301, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1301 = !DISubroutineType(types: !1302)
!1302 = !{null, !1303, !318}
!1303 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1217, size: 32)
!1304 = !DILocalVariable(name: "r", arg: 1, scope: !1300, file: !1212, line: 83, type: !1303)
!1305 = !DILocation(line: 0, scope: !1300)
!1306 = !DILocalVariable(name: "a", arg: 2, scope: !1300, file: !1212, line: 83, type: !318)
!1307 = !DILocalVariable(name: "i", scope: !1300, file: !1212, line: 85, type: !40)
!1308 = !DILocation(line: 88, column: 7, scope: !1309)
!1309 = distinct !DILexicalBlock(scope: !1300, file: !1212, line: 88, column: 3)
!1310 = !DILocation(line: 88, scope: !1309)
!1311 = !DILocation(line: 88, column: 12, scope: !1312)
!1312 = distinct !DILexicalBlock(scope: !1309, file: !1212, line: 88, column: 3)
!1313 = !DILocation(line: 88, column: 3, scope: !1309)
!1314 = !DILocation(line: 89, column: 37, scope: !1315)
!1315 = distinct !DILexicalBlock(scope: !1312, file: !1212, line: 88, column: 28)
!1316 = !DILocation(line: 89, column: 42, scope: !1315)
!1317 = !DILocation(line: 89, column: 26, scope: !1315)
!1318 = !DILocation(line: 89, column: 47, scope: !1315)
!1319 = !DILocation(line: 89, column: 57, scope: !1315)
!1320 = !DILocation(line: 89, column: 62, scope: !1315)
!1321 = !DILocation(line: 89, column: 24, scope: !1315)
!1322 = !DILocation(line: 89, column: 8, scope: !1315)
!1323 = !DILocation(line: 89, column: 16, scope: !1315)
!1324 = !DILocation(line: 89, column: 18, scope: !1315)
!1325 = !DILocation(line: 89, column: 5, scope: !1315)
!1326 = !DILocation(line: 89, column: 22, scope: !1315)
!1327 = !DILocation(line: 90, column: 37, scope: !1315)
!1328 = !DILocation(line: 90, column: 42, scope: !1315)
!1329 = !DILocation(line: 90, column: 26, scope: !1315)
!1330 = !DILocation(line: 90, column: 47, scope: !1315)
!1331 = !DILocation(line: 90, column: 57, scope: !1315)
!1332 = !DILocation(line: 90, column: 62, scope: !1315)
!1333 = !DILocation(line: 90, column: 24, scope: !1315)
!1334 = !DILocation(line: 90, column: 8, scope: !1315)
!1335 = !DILocation(line: 90, column: 16, scope: !1315)
!1336 = !DILocation(line: 90, column: 18, scope: !1315)
!1337 = !DILocation(line: 90, column: 5, scope: !1315)
!1338 = !DILocation(line: 90, column: 22, scope: !1315)
!1339 = !DILocation(line: 91, column: 7, scope: !1315)
!1340 = !DILocation(line: 92, column: 3, scope: !1315)
!1341 = !DILocation(line: 88, column: 24, scope: !1312)
!1342 = !DILocation(line: 88, column: 3, scope: !1312)
!1343 = distinct !{!1343, !1313, !1344, !132}
!1344 = !DILocation(line: 92, column: 3, scope: !1309)
!1345 = !DILocation(line: 113, column: 1, scope: !1300)
!1346 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_tobytes", scope: !1212, file: !1212, line: 124, type: !1213, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1347 = !DILocalVariable(name: "r", arg: 1, scope: !1346, file: !1212, line: 124, type: !32)
!1348 = !DILocation(line: 0, scope: !1346)
!1349 = !DILocalVariable(name: "a", arg: 2, scope: !1346, file: !1212, line: 124, type: !1215)
!1350 = !DILocalVariable(name: "i", scope: !1346, file: !1212, line: 126, type: !40)
!1351 = !DILocation(line: 129, column: 7, scope: !1352)
!1352 = distinct !DILexicalBlock(scope: !1346, file: !1212, line: 129, column: 3)
!1353 = !DILocation(line: 129, scope: !1352)
!1354 = !DILocation(line: 129, column: 12, scope: !1355)
!1355 = distinct !DILexicalBlock(scope: !1352, file: !1212, line: 129, column: 3)
!1356 = !DILocation(line: 129, column: 3, scope: !1352)
!1357 = !DILocation(line: 131, column: 14, scope: !1358)
!1358 = distinct !DILexicalBlock(scope: !1355, file: !1212, line: 129, column: 28)
!1359 = !DILocation(line: 131, column: 22, scope: !1358)
!1360 = !DILocation(line: 131, column: 11, scope: !1358)
!1361 = !DILocalVariable(name: "t0", scope: !1346, file: !1212, line: 127, type: !86)
!1362 = !DILocation(line: 132, column: 12, scope: !1358)
!1363 = !DILocation(line: 132, column: 24, scope: !1358)
!1364 = !DILocation(line: 132, column: 31, scope: !1358)
!1365 = !DILocation(line: 132, column: 8, scope: !1358)
!1366 = !DILocation(line: 133, column: 13, scope: !1358)
!1367 = !DILocation(line: 133, column: 21, scope: !1358)
!1368 = !DILocation(line: 133, column: 23, scope: !1358)
!1369 = !DILocation(line: 133, column: 10, scope: !1358)
!1370 = !DILocalVariable(name: "t1", scope: !1346, file: !1212, line: 127, type: !86)
!1371 = !DILocation(line: 134, column: 12, scope: !1358)
!1372 = !DILocation(line: 134, column: 24, scope: !1358)
!1373 = !DILocation(line: 134, column: 31, scope: !1358)
!1374 = !DILocation(line: 134, column: 8, scope: !1358)
!1375 = !DILocation(line: 135, column: 17, scope: !1358)
!1376 = !DILocation(line: 135, column: 20, scope: !1358)
!1377 = !DILocation(line: 135, column: 16, scope: !1358)
!1378 = !DILocation(line: 135, column: 8, scope: !1358)
!1379 = !DILocation(line: 135, column: 10, scope: !1358)
!1380 = !DILocation(line: 135, column: 5, scope: !1358)
!1381 = !DILocation(line: 135, column: 14, scope: !1358)
!1382 = !DILocation(line: 136, column: 17, scope: !1358)
!1383 = !DILocation(line: 136, column: 20, scope: !1358)
!1384 = !DILocation(line: 136, column: 29, scope: !1358)
!1385 = !DILocation(line: 136, column: 32, scope: !1358)
!1386 = !DILocation(line: 136, column: 26, scope: !1358)
!1387 = !DILocation(line: 136, column: 16, scope: !1358)
!1388 = !DILocation(line: 136, column: 8, scope: !1358)
!1389 = !DILocation(line: 136, column: 10, scope: !1358)
!1390 = !DILocation(line: 136, column: 5, scope: !1358)
!1391 = !DILocation(line: 136, column: 14, scope: !1358)
!1392 = !DILocation(line: 137, column: 17, scope: !1358)
!1393 = !DILocation(line: 137, column: 20, scope: !1358)
!1394 = !DILocation(line: 137, column: 16, scope: !1358)
!1395 = !DILocation(line: 137, column: 8, scope: !1358)
!1396 = !DILocation(line: 137, column: 10, scope: !1358)
!1397 = !DILocation(line: 137, column: 5, scope: !1358)
!1398 = !DILocation(line: 137, column: 14, scope: !1358)
!1399 = !DILocation(line: 138, column: 3, scope: !1358)
!1400 = !DILocation(line: 129, column: 24, scope: !1355)
!1401 = !DILocation(line: 129, column: 3, scope: !1355)
!1402 = distinct !{!1402, !1356, !1403, !132}
!1403 = !DILocation(line: 138, column: 3, scope: !1352)
!1404 = !DILocation(line: 139, column: 1, scope: !1346)
!1405 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_frombytes", scope: !1212, file: !1212, line: 151, type: !1301, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1406 = !DILocalVariable(name: "r", arg: 1, scope: !1405, file: !1212, line: 151, type: !1303)
!1407 = !DILocation(line: 0, scope: !1405)
!1408 = !DILocalVariable(name: "a", arg: 2, scope: !1405, file: !1212, line: 151, type: !318)
!1409 = !DILocalVariable(name: "i", scope: !1405, file: !1212, line: 153, type: !40)
!1410 = !DILocation(line: 154, column: 7, scope: !1411)
!1411 = distinct !DILexicalBlock(scope: !1405, file: !1212, line: 154, column: 3)
!1412 = !DILocation(line: 154, scope: !1411)
!1413 = !DILocation(line: 154, column: 12, scope: !1414)
!1414 = distinct !DILexicalBlock(scope: !1411, file: !1212, line: 154, column: 3)
!1415 = !DILocation(line: 154, column: 3, scope: !1411)
!1416 = !DILocation(line: 155, column: 29, scope: !1417)
!1417 = distinct !DILexicalBlock(scope: !1414, file: !1212, line: 154, column: 28)
!1418 = !DILocation(line: 155, column: 31, scope: !1417)
!1419 = !DILocation(line: 155, column: 26, scope: !1417)
!1420 = !DILocation(line: 155, column: 35, scope: !1417)
!1421 = !DILocation(line: 155, column: 57, scope: !1417)
!1422 = !DILocation(line: 155, column: 59, scope: !1417)
!1423 = !DILocation(line: 155, column: 54, scope: !1417)
!1424 = !DILocation(line: 155, column: 44, scope: !1417)
!1425 = !DILocation(line: 155, column: 63, scope: !1417)
!1426 = !DILocation(line: 155, column: 41, scope: !1417)
!1427 = !DILocation(line: 155, column: 70, scope: !1417)
!1428 = !DILocation(line: 155, column: 24, scope: !1417)
!1429 = !DILocation(line: 155, column: 8, scope: !1417)
!1430 = !DILocation(line: 155, column: 16, scope: !1417)
!1431 = !DILocation(line: 155, column: 5, scope: !1417)
!1432 = !DILocation(line: 155, column: 22, scope: !1417)
!1433 = !DILocation(line: 156, column: 29, scope: !1417)
!1434 = !DILocation(line: 156, column: 31, scope: !1417)
!1435 = !DILocation(line: 156, column: 26, scope: !1417)
!1436 = !DILocation(line: 156, column: 35, scope: !1417)
!1437 = !DILocation(line: 156, column: 57, scope: !1417)
!1438 = !DILocation(line: 156, column: 59, scope: !1417)
!1439 = !DILocation(line: 156, column: 54, scope: !1417)
!1440 = !DILocation(line: 156, column: 44, scope: !1417)
!1441 = !DILocation(line: 156, column: 63, scope: !1417)
!1442 = !DILocation(line: 156, column: 41, scope: !1417)
!1443 = !DILocation(line: 156, column: 70, scope: !1417)
!1444 = !DILocation(line: 156, column: 24, scope: !1417)
!1445 = !DILocation(line: 156, column: 8, scope: !1417)
!1446 = !DILocation(line: 156, column: 16, scope: !1417)
!1447 = !DILocation(line: 156, column: 18, scope: !1417)
!1448 = !DILocation(line: 156, column: 5, scope: !1417)
!1449 = !DILocation(line: 156, column: 22, scope: !1417)
!1450 = !DILocation(line: 157, column: 3, scope: !1417)
!1451 = !DILocation(line: 154, column: 24, scope: !1414)
!1452 = !DILocation(line: 154, column: 3, scope: !1414)
!1453 = distinct !{!1453, !1415, !1454, !132}
!1454 = !DILocation(line: 157, column: 3, scope: !1411)
!1455 = !DILocation(line: 158, column: 1, scope: !1405)
!1456 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_frommsg", scope: !1212, file: !1212, line: 168, type: !1301, scopeLine: 169, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1457 = !DILocalVariable(name: "r", arg: 1, scope: !1456, file: !1212, line: 168, type: !1303)
!1458 = !DILocation(line: 0, scope: !1456)
!1459 = !DILocalVariable(name: "msg", arg: 2, scope: !1456, file: !1212, line: 168, type: !318)
!1460 = !DILocalVariable(name: "i", scope: !1456, file: !1212, line: 170, type: !40)
!1461 = !DILocation(line: 176, column: 7, scope: !1462)
!1462 = distinct !DILexicalBlock(scope: !1456, file: !1212, line: 176, column: 3)
!1463 = !DILocation(line: 176, scope: !1462)
!1464 = !DILocation(line: 176, column: 12, scope: !1465)
!1465 = distinct !DILexicalBlock(scope: !1462, file: !1212, line: 176, column: 3)
!1466 = !DILocation(line: 176, column: 3, scope: !1462)
!1467 = !DILocalVariable(name: "j", scope: !1456, file: !1212, line: 170, type: !40)
!1468 = !DILocation(line: 177, column: 9, scope: !1469)
!1469 = distinct !DILexicalBlock(scope: !1470, file: !1212, line: 177, column: 5)
!1470 = distinct !DILexicalBlock(scope: !1465, file: !1212, line: 176, column: 28)
!1471 = !DILocation(line: 177, scope: !1469)
!1472 = !DILocation(line: 177, column: 14, scope: !1473)
!1473 = distinct !DILexicalBlock(scope: !1469, file: !1212, line: 177, column: 5)
!1474 = !DILocation(line: 177, column: 5, scope: !1469)
!1475 = !DILocation(line: 178, column: 10, scope: !1476)
!1476 = distinct !DILexicalBlock(scope: !1473, file: !1212, line: 177, column: 22)
!1477 = !DILocation(line: 178, column: 18, scope: !1476)
!1478 = !DILocation(line: 178, column: 20, scope: !1476)
!1479 = !DILocation(line: 178, column: 7, scope: !1476)
!1480 = !DILocation(line: 178, column: 24, scope: !1476)
!1481 = !DILocation(line: 179, column: 21, scope: !1476)
!1482 = !DILocation(line: 179, column: 18, scope: !1476)
!1483 = !DILocation(line: 179, column: 29, scope: !1476)
!1484 = !DILocation(line: 179, column: 27, scope: !1476)
!1485 = !DILocation(line: 179, column: 31, scope: !1476)
!1486 = !DILocation(line: 179, column: 53, scope: !1476)
!1487 = !DILocation(line: 179, column: 60, scope: !1476)
!1488 = !DILocation(line: 179, column: 65, scope: !1476)
!1489 = !DILocation(line: 179, column: 52, scope: !1476)
!1490 = !DILocation(line: 179, column: 7, scope: !1476)
!1491 = !DILocation(line: 180, column: 5, scope: !1476)
!1492 = !DILocation(line: 177, column: 18, scope: !1473)
!1493 = !DILocation(line: 177, column: 5, scope: !1473)
!1494 = distinct !{!1494, !1474, !1495, !132}
!1495 = !DILocation(line: 180, column: 5, scope: !1469)
!1496 = !DILocation(line: 181, column: 3, scope: !1470)
!1497 = !DILocation(line: 176, column: 24, scope: !1465)
!1498 = !DILocation(line: 176, column: 3, scope: !1465)
!1499 = distinct !{!1499, !1466, !1500, !132}
!1500 = !DILocation(line: 181, column: 3, scope: !1462)
!1501 = !DILocation(line: 182, column: 1, scope: !1456)
!1502 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_tomsg", scope: !1212, file: !1212, line: 192, type: !1213, scopeLine: 193, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1503 = !DILocalVariable(name: "msg", arg: 1, scope: !1502, file: !1212, line: 192, type: !32)
!1504 = !DILocation(line: 0, scope: !1502)
!1505 = !DILocalVariable(name: "a", arg: 2, scope: !1502, file: !1212, line: 192, type: !1215)
!1506 = !DILocalVariable(name: "i", scope: !1502, file: !1212, line: 194, type: !40)
!1507 = !DILocation(line: 197, column: 7, scope: !1508)
!1508 = distinct !DILexicalBlock(scope: !1502, file: !1212, line: 197, column: 3)
!1509 = !DILocation(line: 197, scope: !1508)
!1510 = !DILocation(line: 197, column: 12, scope: !1511)
!1511 = distinct !DILexicalBlock(scope: !1508, file: !1212, line: 197, column: 3)
!1512 = !DILocation(line: 197, column: 3, scope: !1508)
!1513 = !DILocation(line: 198, column: 5, scope: !1514)
!1514 = distinct !DILexicalBlock(scope: !1511, file: !1212, line: 197, column: 28)
!1515 = !DILocation(line: 198, column: 12, scope: !1514)
!1516 = !DILocalVariable(name: "j", scope: !1502, file: !1212, line: 194, type: !40)
!1517 = !DILocation(line: 199, column: 9, scope: !1518)
!1518 = distinct !DILexicalBlock(scope: !1514, file: !1212, line: 199, column: 5)
!1519 = !DILocation(line: 199, scope: !1518)
!1520 = !DILocation(line: 199, column: 14, scope: !1521)
!1521 = distinct !DILexicalBlock(scope: !1518, file: !1212, line: 199, column: 5)
!1522 = !DILocation(line: 199, column: 5, scope: !1518)
!1523 = !DILocation(line: 200, column: 15, scope: !1524)
!1524 = distinct !DILexicalBlock(scope: !1521, file: !1212, line: 199, column: 22)
!1525 = !DILocation(line: 200, column: 23, scope: !1524)
!1526 = !DILocation(line: 200, column: 25, scope: !1524)
!1527 = !DILocation(line: 200, column: 12, scope: !1524)
!1528 = !DILocalVariable(name: "t", scope: !1502, file: !1212, line: 195, type: !91)
!1529 = !DILocation(line: 203, column: 9, scope: !1524)
!1530 = !DILocation(line: 204, column: 9, scope: !1524)
!1531 = !DILocation(line: 205, column: 9, scope: !1524)
!1532 = !DILocation(line: 206, column: 9, scope: !1524)
!1533 = !DILocation(line: 207, column: 9, scope: !1524)
!1534 = !DILocation(line: 208, column: 19, scope: !1524)
!1535 = !DILocation(line: 208, column: 7, scope: !1524)
!1536 = !DILocation(line: 208, column: 14, scope: !1524)
!1537 = !DILocation(line: 209, column: 5, scope: !1524)
!1538 = !DILocation(line: 199, column: 18, scope: !1521)
!1539 = !DILocation(line: 199, column: 5, scope: !1521)
!1540 = distinct !{!1540, !1522, !1541, !132}
!1541 = !DILocation(line: 209, column: 5, scope: !1518)
!1542 = !DILocation(line: 210, column: 3, scope: !1514)
!1543 = !DILocation(line: 197, column: 24, scope: !1511)
!1544 = !DILocation(line: 197, column: 3, scope: !1511)
!1545 = distinct !{!1545, !1512, !1546, !132}
!1546 = !DILocation(line: 210, column: 3, scope: !1508)
!1547 = !DILocation(line: 211, column: 1, scope: !1502)
!1548 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_getnoise_eta1", scope: !1212, file: !1212, line: 225, type: !1549, scopeLine: 226, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1549 = !DISubroutineType(types: !1550)
!1550 = !{null, !1303, !318, !33}
!1551 = !DILocalVariable(name: "r", arg: 1, scope: !1548, file: !1212, line: 225, type: !1303)
!1552 = !DILocation(line: 0, scope: !1548)
!1553 = !DILocalVariable(name: "seed", arg: 2, scope: !1548, file: !1212, line: 225, type: !318)
!1554 = !DILocalVariable(name: "nonce", arg: 3, scope: !1548, file: !1212, line: 225, type: !33)
!1555 = !DILocalVariable(name: "buf", scope: !1548, file: !1212, line: 227, type: !1556)
!1556 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 1536, elements: !1557)
!1557 = !{!1558}
!1558 = !DISubrange(count: 192)
!1559 = !DILocation(line: 227, column: 11, scope: !1548)
!1560 = !DILocation(line: 228, column: 3, scope: !1548)
!1561 = !DILocation(line: 229, column: 20, scope: !1548)
!1562 = !DILocation(line: 229, column: 3, scope: !1548)
!1563 = !DILocation(line: 230, column: 1, scope: !1548)
!1564 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_getnoise_eta2", scope: !1212, file: !1212, line: 244, type: !1549, scopeLine: 245, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1565 = !DILocalVariable(name: "r", arg: 1, scope: !1564, file: !1212, line: 244, type: !1303)
!1566 = !DILocation(line: 0, scope: !1564)
!1567 = !DILocalVariable(name: "seed", arg: 2, scope: !1564, file: !1212, line: 244, type: !318)
!1568 = !DILocalVariable(name: "nonce", arg: 3, scope: !1564, file: !1212, line: 244, type: !33)
!1569 = !DILocalVariable(name: "buf", scope: !1564, file: !1212, line: 246, type: !1570)
!1570 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 1024, elements: !64)
!1571 = !DILocation(line: 246, column: 11, scope: !1564)
!1572 = !DILocation(line: 247, column: 3, scope: !1564)
!1573 = !DILocation(line: 248, column: 20, scope: !1564)
!1574 = !DILocation(line: 248, column: 3, scope: !1564)
!1575 = !DILocation(line: 249, column: 1, scope: !1564)
!1576 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_ntt", scope: !1212, file: !1212, line: 261, type: !1577, scopeLine: 262, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1577 = !DISubroutineType(types: !1578)
!1578 = !{null, !1303}
!1579 = !DILocalVariable(name: "r", arg: 1, scope: !1576, file: !1212, line: 261, type: !1303)
!1580 = !DILocation(line: 0, scope: !1576)
!1581 = !DILocation(line: 263, column: 10, scope: !1576)
!1582 = !DILocation(line: 263, column: 7, scope: !1576)
!1583 = !DILocation(line: 263, column: 3, scope: !1576)
!1584 = !DILocation(line: 264, column: 3, scope: !1576)
!1585 = !DILocation(line: 265, column: 1, scope: !1576)
!1586 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_reduce", scope: !1212, file: !1212, line: 323, type: !1577, scopeLine: 324, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1587 = !DILocalVariable(name: "r", arg: 1, scope: !1586, file: !1212, line: 323, type: !1303)
!1588 = !DILocation(line: 0, scope: !1586)
!1589 = !DILocalVariable(name: "i", scope: !1586, file: !1212, line: 325, type: !40)
!1590 = !DILocation(line: 326, column: 7, scope: !1591)
!1591 = distinct !DILexicalBlock(scope: !1586, file: !1212, line: 326, column: 3)
!1592 = !DILocation(line: 326, scope: !1591)
!1593 = !DILocation(line: 326, column: 12, scope: !1594)
!1594 = distinct !DILexicalBlock(scope: !1591, file: !1212, line: 326, column: 3)
!1595 = !DILocation(line: 326, column: 3, scope: !1591)
!1596 = !DILocation(line: 327, column: 38, scope: !1594)
!1597 = !DILocation(line: 327, column: 35, scope: !1594)
!1598 = !DILocation(line: 327, column: 20, scope: !1594)
!1599 = !DILocation(line: 327, column: 8, scope: !1594)
!1600 = !DILocation(line: 327, column: 5, scope: !1594)
!1601 = !DILocation(line: 327, column: 18, scope: !1594)
!1602 = !DILocation(line: 326, column: 22, scope: !1594)
!1603 = !DILocation(line: 326, column: 3, scope: !1594)
!1604 = distinct !{!1604, !1595, !1605, !132}
!1605 = !DILocation(line: 327, column: 47, scope: !1591)
!1606 = !DILocation(line: 328, column: 1, scope: !1586)
!1607 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_invntt_tomont", scope: !1212, file: !1212, line: 276, type: !1577, scopeLine: 277, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1608 = !DILocalVariable(name: "r", arg: 1, scope: !1607, file: !1212, line: 276, type: !1303)
!1609 = !DILocation(line: 0, scope: !1607)
!1610 = !DILocation(line: 278, column: 13, scope: !1607)
!1611 = !DILocation(line: 278, column: 10, scope: !1607)
!1612 = !DILocation(line: 278, column: 3, scope: !1607)
!1613 = !DILocation(line: 279, column: 1, scope: !1607)
!1614 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_basemul_montgomery", scope: !1212, file: !1212, line: 290, type: !1615, scopeLine: 291, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1615 = !DISubroutineType(types: !1616)
!1616 = !{null, !1303, !1215, !1215}
!1617 = !DILocalVariable(name: "r", arg: 1, scope: !1614, file: !1212, line: 290, type: !1303)
!1618 = !DILocation(line: 0, scope: !1614)
!1619 = !DILocalVariable(name: "a", arg: 2, scope: !1614, file: !1212, line: 290, type: !1215)
!1620 = !DILocalVariable(name: "b", arg: 3, scope: !1614, file: !1212, line: 290, type: !1215)
!1621 = !DILocalVariable(name: "i", scope: !1614, file: !1212, line: 292, type: !40)
!1622 = !DILocation(line: 293, column: 7, scope: !1623)
!1623 = distinct !DILexicalBlock(scope: !1614, file: !1212, line: 293, column: 3)
!1624 = !DILocation(line: 293, scope: !1623)
!1625 = !DILocation(line: 293, column: 12, scope: !1626)
!1626 = distinct !DILexicalBlock(scope: !1623, file: !1212, line: 293, column: 3)
!1627 = !DILocation(line: 293, column: 3, scope: !1623)
!1628 = !DILocation(line: 294, column: 17, scope: !1629)
!1629 = distinct !DILexicalBlock(scope: !1626, file: !1212, line: 293, column: 28)
!1630 = !DILocation(line: 294, column: 25, scope: !1629)
!1631 = !DILocation(line: 294, column: 14, scope: !1629)
!1632 = !DILocation(line: 294, column: 34, scope: !1629)
!1633 = !DILocation(line: 294, column: 42, scope: !1629)
!1634 = !DILocation(line: 294, column: 31, scope: !1629)
!1635 = !DILocation(line: 294, column: 51, scope: !1629)
!1636 = !DILocation(line: 294, column: 59, scope: !1629)
!1637 = !DILocation(line: 294, column: 48, scope: !1629)
!1638 = !DILocation(line: 294, column: 72, scope: !1629)
!1639 = !DILocation(line: 294, column: 64, scope: !1629)
!1640 = !DILocation(line: 294, column: 5, scope: !1629)
!1641 = !DILocation(line: 295, column: 17, scope: !1629)
!1642 = !DILocation(line: 295, column: 25, scope: !1629)
!1643 = !DILocation(line: 295, column: 27, scope: !1629)
!1644 = !DILocation(line: 295, column: 14, scope: !1629)
!1645 = !DILocation(line: 295, column: 36, scope: !1629)
!1646 = !DILocation(line: 295, column: 44, scope: !1629)
!1647 = !DILocation(line: 295, column: 46, scope: !1629)
!1648 = !DILocation(line: 295, column: 33, scope: !1629)
!1649 = !DILocation(line: 295, column: 55, scope: !1629)
!1650 = !DILocation(line: 295, column: 63, scope: !1629)
!1651 = !DILocation(line: 295, column: 65, scope: !1629)
!1652 = !DILocation(line: 295, column: 52, scope: !1629)
!1653 = !DILocation(line: 295, column: 79, scope: !1629)
!1654 = !DILocation(line: 295, column: 71, scope: !1629)
!1655 = !DILocation(line: 295, column: 70, scope: !1629)
!1656 = !DILocation(line: 295, column: 5, scope: !1629)
!1657 = !DILocation(line: 296, column: 3, scope: !1629)
!1658 = !DILocation(line: 293, column: 24, scope: !1626)
!1659 = !DILocation(line: 293, column: 3, scope: !1626)
!1660 = distinct !{!1660, !1627, !1661, !132}
!1661 = !DILocation(line: 296, column: 3, scope: !1623)
!1662 = !DILocation(line: 297, column: 1, scope: !1614)
!1663 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_tomont", scope: !1212, file: !1212, line: 307, type: !1577, scopeLine: 308, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1664 = !DILocalVariable(name: "r", arg: 1, scope: !1663, file: !1212, line: 307, type: !1303)
!1665 = !DILocation(line: 0, scope: !1663)
!1666 = !DILocalVariable(name: "f", scope: !1663, file: !1212, line: 310, type: !60)
!1667 = !DILocalVariable(name: "i", scope: !1663, file: !1212, line: 309, type: !40)
!1668 = !DILocation(line: 311, column: 7, scope: !1669)
!1669 = distinct !DILexicalBlock(scope: !1663, file: !1212, line: 311, column: 3)
!1670 = !DILocation(line: 311, scope: !1669)
!1671 = !DILocation(line: 311, column: 12, scope: !1672)
!1672 = distinct !DILexicalBlock(scope: !1669, file: !1212, line: 311, column: 3)
!1673 = !DILocation(line: 311, column: 3, scope: !1669)
!1674 = !DILocation(line: 312, column: 50, scope: !1672)
!1675 = !DILocation(line: 312, column: 47, scope: !1672)
!1676 = !DILocation(line: 312, column: 38, scope: !1672)
!1677 = !DILocation(line: 312, column: 59, scope: !1672)
!1678 = !DILocation(line: 312, column: 20, scope: !1672)
!1679 = !DILocation(line: 312, column: 8, scope: !1672)
!1680 = !DILocation(line: 312, column: 5, scope: !1672)
!1681 = !DILocation(line: 312, column: 18, scope: !1672)
!1682 = !DILocation(line: 311, column: 22, scope: !1672)
!1683 = !DILocation(line: 311, column: 3, scope: !1672)
!1684 = distinct !{!1684, !1673, !1685, !132}
!1685 = !DILocation(line: 312, column: 61, scope: !1669)
!1686 = !DILocation(line: 313, column: 1, scope: !1663)
!1687 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_add", scope: !1212, file: !1212, line: 339, type: !1615, scopeLine: 340, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1688 = !DILocalVariable(name: "r", arg: 1, scope: !1687, file: !1212, line: 339, type: !1303)
!1689 = !DILocation(line: 0, scope: !1687)
!1690 = !DILocalVariable(name: "a", arg: 2, scope: !1687, file: !1212, line: 339, type: !1215)
!1691 = !DILocalVariable(name: "b", arg: 3, scope: !1687, file: !1212, line: 339, type: !1215)
!1692 = !DILocalVariable(name: "i", scope: !1687, file: !1212, line: 341, type: !40)
!1693 = !DILocation(line: 342, column: 7, scope: !1694)
!1694 = distinct !DILexicalBlock(scope: !1687, file: !1212, line: 342, column: 3)
!1695 = !DILocation(line: 342, scope: !1694)
!1696 = !DILocation(line: 342, column: 12, scope: !1697)
!1697 = distinct !DILexicalBlock(scope: !1694, file: !1212, line: 342, column: 3)
!1698 = !DILocation(line: 342, column: 3, scope: !1694)
!1699 = !DILocation(line: 343, column: 23, scope: !1697)
!1700 = !DILocation(line: 343, column: 20, scope: !1697)
!1701 = !DILocation(line: 343, column: 38, scope: !1697)
!1702 = !DILocation(line: 343, column: 35, scope: !1697)
!1703 = !DILocation(line: 343, column: 33, scope: !1697)
!1704 = !DILocation(line: 343, column: 8, scope: !1697)
!1705 = !DILocation(line: 343, column: 5, scope: !1697)
!1706 = !DILocation(line: 343, column: 18, scope: !1697)
!1707 = !DILocation(line: 342, column: 22, scope: !1697)
!1708 = !DILocation(line: 342, column: 3, scope: !1697)
!1709 = distinct !{!1709, !1698, !1710, !132}
!1710 = !DILocation(line: 343, column: 46, scope: !1694)
!1711 = !DILocation(line: 344, column: 1, scope: !1687)
!1712 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_sub", scope: !1212, file: !1212, line: 355, type: !1615, scopeLine: 356, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !93, retainedNodes: !49)
!1713 = !DILocalVariable(name: "r", arg: 1, scope: !1712, file: !1212, line: 355, type: !1303)
!1714 = !DILocation(line: 0, scope: !1712)
!1715 = !DILocalVariable(name: "a", arg: 2, scope: !1712, file: !1212, line: 355, type: !1215)
!1716 = !DILocalVariable(name: "b", arg: 3, scope: !1712, file: !1212, line: 355, type: !1215)
!1717 = !DILocalVariable(name: "i", scope: !1712, file: !1212, line: 357, type: !40)
!1718 = !DILocation(line: 358, column: 7, scope: !1719)
!1719 = distinct !DILexicalBlock(scope: !1712, file: !1212, line: 358, column: 3)
!1720 = !DILocation(line: 358, scope: !1719)
!1721 = !DILocation(line: 358, column: 12, scope: !1722)
!1722 = distinct !DILexicalBlock(scope: !1719, file: !1212, line: 358, column: 3)
!1723 = !DILocation(line: 358, column: 3, scope: !1719)
!1724 = !DILocation(line: 359, column: 23, scope: !1722)
!1725 = !DILocation(line: 359, column: 20, scope: !1722)
!1726 = !DILocation(line: 359, column: 38, scope: !1722)
!1727 = !DILocation(line: 359, column: 35, scope: !1722)
!1728 = !DILocation(line: 359, column: 33, scope: !1722)
!1729 = !DILocation(line: 359, column: 8, scope: !1722)
!1730 = !DILocation(line: 359, column: 5, scope: !1722)
!1731 = !DILocation(line: 359, column: 18, scope: !1722)
!1732 = !DILocation(line: 358, column: 22, scope: !1722)
!1733 = !DILocation(line: 358, column: 3, scope: !1722)
!1734 = distinct !{!1734, !1723, !1735, !132}
!1735 = !DILocation(line: 359, column: 46, scope: !1719)
!1736 = !DILocation(line: 360, column: 1, scope: !1712)
!1737 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_ntt", scope: !58, file: !58, line: 80, type: !1738, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !53, retainedNodes: !49)
!1738 = !DISubroutineType(types: !1739)
!1739 = !{null, !520}
!1740 = !DILocalVariable(name: "r", arg: 1, scope: !1737, file: !58, line: 80, type: !520)
!1741 = !DILocation(line: 0, scope: !1737)
!1742 = !DILocalVariable(name: "k", scope: !1737, file: !58, line: 81, type: !40)
!1743 = !DILocalVariable(name: "len", scope: !1737, file: !58, line: 81, type: !40)
!1744 = !DILocation(line: 85, column: 7, scope: !1745)
!1745 = distinct !DILexicalBlock(scope: !1737, file: !58, line: 85, column: 3)
!1746 = !DILocation(line: 85, scope: !1745)
!1747 = !DILocation(line: 84, column: 5, scope: !1737)
!1748 = !DILocation(line: 85, column: 22, scope: !1749)
!1749 = distinct !DILexicalBlock(scope: !1745, file: !58, line: 85, column: 3)
!1750 = !DILocation(line: 85, column: 3, scope: !1745)
!1751 = !DILocalVariable(name: "start", scope: !1737, file: !58, line: 81, type: !40)
!1752 = !DILocation(line: 86, column: 9, scope: !1753)
!1753 = distinct !DILexicalBlock(scope: !1754, file: !58, line: 86, column: 5)
!1754 = distinct !DILexicalBlock(scope: !1749, file: !58, line: 85, column: 39)
!1755 = !DILocation(line: 86, scope: !1753)
!1756 = !DILocation(line: 86, column: 26, scope: !1757)
!1757 = distinct !DILexicalBlock(scope: !1753, file: !58, line: 86, column: 5)
!1758 = !DILocation(line: 86, column: 5, scope: !1753)
!1759 = !DILocation(line: 87, column: 21, scope: !1760)
!1760 = distinct !DILexicalBlock(scope: !1757, file: !58, line: 86, column: 50)
!1761 = !DILocation(line: 87, column: 14, scope: !1760)
!1762 = !DILocalVariable(name: "zeta", scope: !1737, file: !58, line: 82, type: !61)
!1763 = !DILocalVariable(name: "j", scope: !1737, file: !58, line: 81, type: !40)
!1764 = !DILocation(line: 88, column: 11, scope: !1765)
!1765 = distinct !DILexicalBlock(scope: !1760, file: !58, line: 88, column: 7)
!1766 = !DILocation(line: 88, scope: !1765)
!1767 = !DILocation(line: 88, column: 32, scope: !1768)
!1768 = distinct !DILexicalBlock(scope: !1765, file: !58, line: 88, column: 7)
!1769 = !DILocation(line: 88, column: 24, scope: !1768)
!1770 = !DILocation(line: 88, column: 7, scope: !1765)
!1771 = !DILocation(line: 89, column: 29, scope: !1772)
!1772 = distinct !DILexicalBlock(scope: !1768, file: !58, line: 88, column: 44)
!1773 = !DILocation(line: 89, column: 25, scope: !1772)
!1774 = !DILocation(line: 89, column: 13, scope: !1772)
!1775 = !DILocalVariable(name: "t", scope: !1737, file: !58, line: 82, type: !61)
!1776 = !DILocation(line: 90, column: 22, scope: !1772)
!1777 = !DILocation(line: 90, column: 29, scope: !1772)
!1778 = !DILocation(line: 90, column: 27, scope: !1772)
!1779 = !DILocation(line: 90, column: 13, scope: !1772)
!1780 = !DILocation(line: 90, column: 9, scope: !1772)
!1781 = !DILocation(line: 90, column: 20, scope: !1772)
!1782 = !DILocation(line: 91, column: 16, scope: !1772)
!1783 = !DILocation(line: 91, column: 23, scope: !1772)
!1784 = !DILocation(line: 91, column: 21, scope: !1772)
!1785 = !DILocation(line: 91, column: 9, scope: !1772)
!1786 = !DILocation(line: 91, column: 14, scope: !1772)
!1787 = !DILocation(line: 92, column: 7, scope: !1772)
!1788 = !DILocation(line: 88, column: 40, scope: !1768)
!1789 = !DILocation(line: 88, column: 7, scope: !1768)
!1790 = distinct !{!1790, !1770, !1791, !132}
!1791 = !DILocation(line: 92, column: 7, scope: !1765)
!1792 = !DILocation(line: 93, column: 5, scope: !1760)
!1793 = !DILocation(line: 86, column: 43, scope: !1757)
!1794 = !DILocation(line: 86, column: 5, scope: !1757)
!1795 = distinct !{!1795, !1758, !1796, !132}
!1796 = !DILocation(line: 93, column: 5, scope: !1753)
!1797 = !DILocation(line: 94, column: 3, scope: !1754)
!1798 = !DILocation(line: 85, column: 32, scope: !1749)
!1799 = !DILocation(line: 85, column: 3, scope: !1749)
!1800 = distinct !{!1800, !1750, !1801, !132}
!1801 = !DILocation(line: 94, column: 3, scope: !1745)
!1802 = !DILocation(line: 95, column: 1, scope: !1737)
!1803 = distinct !DISubprogram(name: "fqmul", scope: !58, file: !58, line: 68, type: !1804, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !53, retainedNodes: !49)
!1804 = !DISubroutineType(types: !1805)
!1805 = !{!61, !61, !61}
!1806 = !DILocalVariable(name: "a", arg: 1, scope: !1803, file: !58, line: 68, type: !61)
!1807 = !DILocation(line: 0, scope: !1803)
!1808 = !DILocalVariable(name: "b", arg: 2, scope: !1803, file: !58, line: 68, type: !61)
!1809 = !DILocation(line: 69, column: 28, scope: !1803)
!1810 = !DILocation(line: 69, column: 39, scope: !1803)
!1811 = !DILocation(line: 69, column: 38, scope: !1803)
!1812 = !DILocation(line: 69, column: 10, scope: !1803)
!1813 = !DILocation(line: 69, column: 3, scope: !1803)
!1814 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_invntt", scope: !58, file: !58, line: 106, type: !1738, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !53, retainedNodes: !49)
!1815 = !DILocalVariable(name: "r", arg: 1, scope: !1814, file: !58, line: 106, type: !520)
!1816 = !DILocation(line: 0, scope: !1814)
!1817 = !DILocalVariable(name: "f", scope: !1814, file: !58, line: 109, type: !60)
!1818 = !DILocalVariable(name: "k", scope: !1814, file: !58, line: 107, type: !40)
!1819 = !DILocalVariable(name: "len", scope: !1814, file: !58, line: 107, type: !40)
!1820 = !DILocation(line: 112, column: 7, scope: !1821)
!1821 = distinct !DILexicalBlock(scope: !1814, file: !58, line: 112, column: 3)
!1822 = !DILocation(line: 112, scope: !1821)
!1823 = !DILocation(line: 111, column: 5, scope: !1814)
!1824 = !DILocation(line: 112, column: 20, scope: !1825)
!1825 = distinct !DILexicalBlock(scope: !1821, file: !58, line: 112, column: 3)
!1826 = !DILocation(line: 112, column: 3, scope: !1821)
!1827 = !DILocalVariable(name: "start", scope: !1814, file: !58, line: 107, type: !40)
!1828 = !DILocation(line: 113, column: 9, scope: !1829)
!1829 = distinct !DILexicalBlock(scope: !1830, file: !58, line: 113, column: 5)
!1830 = distinct !DILexicalBlock(scope: !1825, file: !58, line: 112, column: 39)
!1831 = !DILocation(line: 113, scope: !1829)
!1832 = !DILocation(line: 113, column: 26, scope: !1833)
!1833 = distinct !DILexicalBlock(scope: !1829, file: !58, line: 113, column: 5)
!1834 = !DILocation(line: 113, column: 5, scope: !1829)
!1835 = !DILocation(line: 114, column: 21, scope: !1836)
!1836 = distinct !DILexicalBlock(scope: !1833, file: !58, line: 113, column: 50)
!1837 = !DILocation(line: 114, column: 14, scope: !1836)
!1838 = !DILocalVariable(name: "zeta", scope: !1814, file: !58, line: 108, type: !61)
!1839 = !DILocalVariable(name: "j", scope: !1814, file: !58, line: 107, type: !40)
!1840 = !DILocation(line: 115, column: 11, scope: !1841)
!1841 = distinct !DILexicalBlock(scope: !1836, file: !58, line: 115, column: 7)
!1842 = !DILocation(line: 115, scope: !1841)
!1843 = !DILocation(line: 115, column: 32, scope: !1844)
!1844 = distinct !DILexicalBlock(scope: !1841, file: !58, line: 115, column: 7)
!1845 = !DILocation(line: 115, column: 24, scope: !1844)
!1846 = !DILocation(line: 115, column: 7, scope: !1841)
!1847 = !DILocation(line: 116, column: 13, scope: !1848)
!1848 = distinct !DILexicalBlock(scope: !1844, file: !58, line: 115, column: 44)
!1849 = !DILocalVariable(name: "t", scope: !1814, file: !58, line: 108, type: !61)
!1850 = !DILocation(line: 117, column: 31, scope: !1848)
!1851 = !DILocation(line: 117, column: 39, scope: !1848)
!1852 = !DILocation(line: 117, column: 35, scope: !1848)
!1853 = !DILocation(line: 117, column: 33, scope: !1848)
!1854 = !DILocation(line: 117, column: 16, scope: !1848)
!1855 = !DILocation(line: 117, column: 9, scope: !1848)
!1856 = !DILocation(line: 117, column: 14, scope: !1848)
!1857 = !DILocation(line: 118, column: 26, scope: !1848)
!1858 = !DILocation(line: 118, column: 22, scope: !1848)
!1859 = !DILocation(line: 118, column: 35, scope: !1848)
!1860 = !DILocation(line: 118, column: 33, scope: !1848)
!1861 = !DILocation(line: 118, column: 13, scope: !1848)
!1862 = !DILocation(line: 118, column: 9, scope: !1848)
!1863 = !DILocation(line: 118, column: 20, scope: !1848)
!1864 = !DILocation(line: 119, column: 38, scope: !1848)
!1865 = !DILocation(line: 119, column: 34, scope: !1848)
!1866 = !DILocation(line: 119, column: 22, scope: !1848)
!1867 = !DILocation(line: 119, column: 13, scope: !1848)
!1868 = !DILocation(line: 119, column: 9, scope: !1848)
!1869 = !DILocation(line: 119, column: 20, scope: !1848)
!1870 = !DILocation(line: 120, column: 7, scope: !1848)
!1871 = !DILocation(line: 115, column: 40, scope: !1844)
!1872 = !DILocation(line: 115, column: 7, scope: !1844)
!1873 = distinct !{!1873, !1846, !1874, !132}
!1874 = !DILocation(line: 120, column: 7, scope: !1841)
!1875 = !DILocation(line: 121, column: 5, scope: !1836)
!1876 = !DILocation(line: 113, column: 43, scope: !1833)
!1877 = !DILocation(line: 113, column: 5, scope: !1833)
!1878 = distinct !{!1878, !1834, !1879, !132}
!1879 = !DILocation(line: 121, column: 5, scope: !1829)
!1880 = !DILocation(line: 122, column: 3, scope: !1830)
!1881 = !DILocation(line: 112, column: 32, scope: !1825)
!1882 = !DILocation(line: 112, column: 3, scope: !1825)
!1883 = distinct !{!1883, !1826, !1884, !132}
!1884 = !DILocation(line: 122, column: 3, scope: !1821)
!1885 = !DILocation(line: 124, column: 7, scope: !1886)
!1886 = distinct !DILexicalBlock(scope: !1814, file: !58, line: 124, column: 3)
!1887 = !DILocation(line: 124, scope: !1886)
!1888 = !DILocation(line: 124, column: 16, scope: !1889)
!1889 = distinct !DILexicalBlock(scope: !1886, file: !58, line: 124, column: 3)
!1890 = !DILocation(line: 124, column: 3, scope: !1886)
!1891 = !DILocation(line: 125, column: 18, scope: !1889)
!1892 = !DILocation(line: 125, column: 12, scope: !1889)
!1893 = !DILocation(line: 125, column: 5, scope: !1889)
!1894 = !DILocation(line: 125, column: 10, scope: !1889)
!1895 = !DILocation(line: 124, column: 24, scope: !1889)
!1896 = !DILocation(line: 124, column: 3, scope: !1889)
!1897 = distinct !{!1897, !1890, !1898, !132}
!1898 = !DILocation(line: 125, column: 25, scope: !1886)
!1899 = !DILocation(line: 126, column: 1, scope: !1814)
!1900 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_basemul", scope: !58, file: !58, line: 139, type: !1901, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !53, retainedNodes: !49)
!1901 = !DISubroutineType(types: !1902)
!1902 = !{null, !520, !1903, !1903, !61}
!1903 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 32)
!1904 = !DILocalVariable(name: "r", arg: 1, scope: !1900, file: !58, line: 139, type: !520)
!1905 = !DILocation(line: 0, scope: !1900)
!1906 = !DILocalVariable(name: "a", arg: 2, scope: !1900, file: !58, line: 139, type: !1903)
!1907 = !DILocalVariable(name: "b", arg: 3, scope: !1900, file: !58, line: 139, type: !1903)
!1908 = !DILocalVariable(name: "zeta", arg: 4, scope: !1900, file: !58, line: 139, type: !61)
!1909 = !DILocation(line: 141, column: 17, scope: !1900)
!1910 = !DILocation(line: 141, column: 23, scope: !1900)
!1911 = !DILocation(line: 141, column: 11, scope: !1900)
!1912 = !DILocation(line: 141, column: 3, scope: !1900)
!1913 = !DILocation(line: 141, column: 9, scope: !1900)
!1914 = !DILocation(line: 142, column: 17, scope: !1900)
!1915 = !DILocation(line: 142, column: 11, scope: !1900)
!1916 = !DILocation(line: 142, column: 3, scope: !1900)
!1917 = !DILocation(line: 142, column: 9, scope: !1900)
!1918 = !DILocation(line: 143, column: 17, scope: !1900)
!1919 = !DILocation(line: 143, column: 23, scope: !1900)
!1920 = !DILocation(line: 143, column: 11, scope: !1900)
!1921 = !DILocation(line: 143, column: 3, scope: !1900)
!1922 = !DILocation(line: 143, column: 8, scope: !1900)
!1923 = !DILocation(line: 144, column: 17, scope: !1900)
!1924 = !DILocation(line: 144, column: 23, scope: !1900)
!1925 = !DILocation(line: 144, column: 11, scope: !1900)
!1926 = !DILocation(line: 144, column: 3, scope: !1900)
!1927 = !DILocation(line: 144, column: 9, scope: !1900)
!1928 = !DILocation(line: 145, column: 17, scope: !1900)
!1929 = !DILocation(line: 145, column: 23, scope: !1900)
!1930 = !DILocation(line: 145, column: 11, scope: !1900)
!1931 = !DILocation(line: 145, column: 3, scope: !1900)
!1932 = !DILocation(line: 145, column: 8, scope: !1900)
!1933 = !DILocation(line: 146, column: 1, scope: !1900)
!1934 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_cbd_eta1", scope: !1935, file: !1935, line: 110, type: !1936, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !95, retainedNodes: !49)
!1935 = !DIFile(filename: "../../ref/cbd.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!1936 = !DISubroutineType(types: !1937)
!1937 = !{null, !1938, !318}
!1938 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1939, size: 32)
!1939 = !DIDerivedType(tag: DW_TAG_typedef, name: "poly", file: !432, line: 13, baseType: !1940)
!1940 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !432, line: 11, size: 4096, elements: !1941)
!1941 = !{!1942}
!1942 = !DIDerivedType(tag: DW_TAG_member, name: "coeffs", scope: !1940, file: !432, line: 12, baseType: !436, size: 4096)
!1943 = !DILocalVariable(name: "r", arg: 1, scope: !1934, file: !1935, line: 110, type: !1938)
!1944 = !DILocation(line: 0, scope: !1934)
!1945 = !DILocalVariable(name: "buf", arg: 2, scope: !1934, file: !1935, line: 110, type: !318)
!1946 = !DILocation(line: 115, column: 3, scope: !1934)
!1947 = !DILocation(line: 119, column: 1, scope: !1934)
!1948 = distinct !DISubprogram(name: "cbd3", scope: !1935, file: !1935, line: 89, type: !1936, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !95, retainedNodes: !49)
!1949 = !DILocalVariable(name: "r", arg: 1, scope: !1948, file: !1935, line: 89, type: !1938)
!1950 = !DILocation(line: 0, scope: !1948)
!1951 = !DILocalVariable(name: "buf", arg: 2, scope: !1948, file: !1935, line: 89, type: !318)
!1952 = !DILocalVariable(name: "i", scope: !1948, file: !1935, line: 91, type: !40)
!1953 = !DILocation(line: 95, column: 7, scope: !1954)
!1954 = distinct !DILexicalBlock(scope: !1948, file: !1935, line: 95, column: 3)
!1955 = !DILocation(line: 95, scope: !1954)
!1956 = !DILocation(line: 95, column: 12, scope: !1957)
!1957 = distinct !DILexicalBlock(scope: !1954, file: !1935, line: 95, column: 3)
!1958 = !DILocation(line: 95, column: 3, scope: !1954)
!1959 = !DILocation(line: 96, column: 35, scope: !1960)
!1960 = distinct !DILexicalBlock(scope: !1957, file: !1935, line: 95, column: 28)
!1961 = !DILocation(line: 96, column: 33, scope: !1960)
!1962 = !DILocation(line: 96, column: 10, scope: !1960)
!1963 = !DILocalVariable(name: "t", scope: !1948, file: !1935, line: 92, type: !91)
!1964 = !DILocation(line: 97, column: 12, scope: !1960)
!1965 = !DILocalVariable(name: "d", scope: !1948, file: !1935, line: 92, type: !91)
!1966 = !DILocation(line: 98, column: 12, scope: !1960)
!1967 = !DILocation(line: 98, column: 17, scope: !1960)
!1968 = !DILocation(line: 98, column: 7, scope: !1960)
!1969 = !DILocation(line: 99, column: 12, scope: !1960)
!1970 = !DILocation(line: 99, column: 17, scope: !1960)
!1971 = !DILocation(line: 99, column: 7, scope: !1960)
!1972 = !DILocalVariable(name: "j", scope: !1948, file: !1935, line: 91, type: !40)
!1973 = !DILocation(line: 101, column: 9, scope: !1974)
!1974 = distinct !DILexicalBlock(scope: !1960, file: !1935, line: 101, column: 5)
!1975 = !DILocation(line: 101, scope: !1974)
!1976 = !DILocation(line: 101, column: 14, scope: !1977)
!1977 = distinct !DILexicalBlock(scope: !1974, file: !1935, line: 101, column: 5)
!1978 = !DILocation(line: 101, column: 5, scope: !1974)
!1979 = !DILocation(line: 102, column: 19, scope: !1980)
!1980 = distinct !DILexicalBlock(scope: !1977, file: !1935, line: 101, column: 22)
!1981 = !DILocation(line: 102, column: 21, scope: !1980)
!1982 = !DILocation(line: 102, column: 14, scope: !1980)
!1983 = !DILocation(line: 102, column: 26, scope: !1980)
!1984 = !DILocation(line: 102, column: 11, scope: !1980)
!1985 = !DILocalVariable(name: "a", scope: !1948, file: !1935, line: 93, type: !61)
!1986 = !DILocation(line: 103, column: 19, scope: !1980)
!1987 = !DILocation(line: 103, column: 21, scope: !1980)
!1988 = !DILocation(line: 103, column: 14, scope: !1980)
!1989 = !DILocation(line: 103, column: 26, scope: !1980)
!1990 = !DILocation(line: 103, column: 11, scope: !1980)
!1991 = !DILocalVariable(name: "b", scope: !1948, file: !1935, line: 93, type: !61)
!1992 = !DILocation(line: 104, column: 26, scope: !1980)
!1993 = !DILocation(line: 104, column: 30, scope: !1980)
!1994 = !DILocation(line: 104, column: 28, scope: !1980)
!1995 = !DILocation(line: 104, column: 10, scope: !1980)
!1996 = !DILocation(line: 104, column: 18, scope: !1980)
!1997 = !DILocation(line: 104, column: 20, scope: !1980)
!1998 = !DILocation(line: 104, column: 7, scope: !1980)
!1999 = !DILocation(line: 104, column: 24, scope: !1980)
!2000 = !DILocation(line: 105, column: 5, scope: !1980)
!2001 = !DILocation(line: 101, column: 18, scope: !1977)
!2002 = !DILocation(line: 101, column: 5, scope: !1977)
!2003 = distinct !{!2003, !1978, !2004, !132}
!2004 = !DILocation(line: 105, column: 5, scope: !1974)
!2005 = !DILocation(line: 106, column: 3, scope: !1960)
!2006 = !DILocation(line: 95, column: 24, scope: !1957)
!2007 = !DILocation(line: 95, column: 3, scope: !1957)
!2008 = distinct !{!2008, !1958, !2009, !132}
!2009 = !DILocation(line: 106, column: 3, scope: !1954)
!2010 = !DILocation(line: 107, column: 1, scope: !1948)
!2011 = distinct !DISubprogram(name: "load24_littleendian", scope: !1935, file: !1935, line: 37, type: !2012, scopeLine: 38, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !95, retainedNodes: !49)
!2012 = !DISubroutineType(types: !2013)
!2013 = !{!91, !318}
!2014 = !DILocalVariable(name: "x", arg: 1, scope: !2011, file: !1935, line: 37, type: !318)
!2015 = !DILocation(line: 0, scope: !2011)
!2016 = !DILocation(line: 40, column: 18, scope: !2011)
!2017 = !DILocation(line: 40, column: 8, scope: !2011)
!2018 = !DILocalVariable(name: "r", scope: !2011, file: !1935, line: 39, type: !91)
!2019 = !DILocation(line: 41, column: 18, scope: !2011)
!2020 = !DILocation(line: 41, column: 8, scope: !2011)
!2021 = !DILocation(line: 41, column: 23, scope: !2011)
!2022 = !DILocation(line: 41, column: 5, scope: !2011)
!2023 = !DILocation(line: 42, column: 18, scope: !2011)
!2024 = !DILocation(line: 42, column: 8, scope: !2011)
!2025 = !DILocation(line: 42, column: 23, scope: !2011)
!2026 = !DILocation(line: 42, column: 5, scope: !2011)
!2027 = !DILocation(line: 43, column: 3, scope: !2011)
!2028 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_poly_cbd_eta2", scope: !1935, file: !1935, line: 121, type: !1936, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !95, retainedNodes: !49)
!2029 = !DILocalVariable(name: "r", arg: 1, scope: !2028, file: !1935, line: 121, type: !1938)
!2030 = !DILocation(line: 0, scope: !2028)
!2031 = !DILocalVariable(name: "buf", arg: 2, scope: !2028, file: !1935, line: 121, type: !318)
!2032 = !DILocation(line: 124, column: 3, scope: !2028)
!2033 = !DILocation(line: 128, column: 1, scope: !2028)
!2034 = distinct !DISubprogram(name: "cbd2", scope: !1935, file: !1935, line: 58, type: !1936, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !95, retainedNodes: !49)
!2035 = !DILocalVariable(name: "r", arg: 1, scope: !2034, file: !1935, line: 58, type: !1938)
!2036 = !DILocation(line: 0, scope: !2034)
!2037 = !DILocalVariable(name: "buf", arg: 2, scope: !2034, file: !1935, line: 58, type: !318)
!2038 = !DILocalVariable(name: "i", scope: !2034, file: !1935, line: 60, type: !40)
!2039 = !DILocation(line: 64, column: 7, scope: !2040)
!2040 = distinct !DILexicalBlock(scope: !2034, file: !1935, line: 64, column: 3)
!2041 = !DILocation(line: 64, scope: !2040)
!2042 = !DILocation(line: 64, column: 12, scope: !2043)
!2043 = distinct !DILexicalBlock(scope: !2040, file: !1935, line: 64, column: 3)
!2044 = !DILocation(line: 64, column: 3, scope: !2040)
!2045 = !DILocation(line: 65, column: 35, scope: !2046)
!2046 = distinct !DILexicalBlock(scope: !2043, file: !1935, line: 64, column: 28)
!2047 = !DILocation(line: 65, column: 33, scope: !2046)
!2048 = !DILocation(line: 65, column: 10, scope: !2046)
!2049 = !DILocalVariable(name: "t", scope: !2034, file: !1935, line: 61, type: !91)
!2050 = !DILocation(line: 66, column: 12, scope: !2046)
!2051 = !DILocalVariable(name: "d", scope: !2034, file: !1935, line: 61, type: !91)
!2052 = !DILocation(line: 67, column: 12, scope: !2046)
!2053 = !DILocation(line: 67, column: 17, scope: !2046)
!2054 = !DILocation(line: 67, column: 7, scope: !2046)
!2055 = !DILocalVariable(name: "j", scope: !2034, file: !1935, line: 60, type: !40)
!2056 = !DILocation(line: 69, column: 9, scope: !2057)
!2057 = distinct !DILexicalBlock(scope: !2046, file: !1935, line: 69, column: 5)
!2058 = !DILocation(line: 69, scope: !2057)
!2059 = !DILocation(line: 69, column: 14, scope: !2060)
!2060 = distinct !DILexicalBlock(scope: !2057, file: !1935, line: 69, column: 5)
!2061 = !DILocation(line: 69, column: 5, scope: !2057)
!2062 = !DILocation(line: 70, column: 19, scope: !2063)
!2063 = distinct !DILexicalBlock(scope: !2060, file: !1935, line: 69, column: 22)
!2064 = !DILocation(line: 70, column: 21, scope: !2063)
!2065 = !DILocation(line: 70, column: 14, scope: !2063)
!2066 = !DILocation(line: 70, column: 26, scope: !2063)
!2067 = !DILocation(line: 70, column: 11, scope: !2063)
!2068 = !DILocalVariable(name: "a", scope: !2034, file: !1935, line: 62, type: !61)
!2069 = !DILocation(line: 71, column: 19, scope: !2063)
!2070 = !DILocation(line: 71, column: 21, scope: !2063)
!2071 = !DILocation(line: 71, column: 14, scope: !2063)
!2072 = !DILocation(line: 71, column: 26, scope: !2063)
!2073 = !DILocation(line: 71, column: 11, scope: !2063)
!2074 = !DILocalVariable(name: "b", scope: !2034, file: !1935, line: 62, type: !61)
!2075 = !DILocation(line: 72, column: 26, scope: !2063)
!2076 = !DILocation(line: 72, column: 30, scope: !2063)
!2077 = !DILocation(line: 72, column: 28, scope: !2063)
!2078 = !DILocation(line: 72, column: 10, scope: !2063)
!2079 = !DILocation(line: 72, column: 18, scope: !2063)
!2080 = !DILocation(line: 72, column: 20, scope: !2063)
!2081 = !DILocation(line: 72, column: 7, scope: !2063)
!2082 = !DILocation(line: 72, column: 24, scope: !2063)
!2083 = !DILocation(line: 73, column: 5, scope: !2063)
!2084 = !DILocation(line: 69, column: 18, scope: !2060)
!2085 = !DILocation(line: 69, column: 5, scope: !2060)
!2086 = distinct !{!2086, !2061, !2087, !132}
!2087 = !DILocation(line: 73, column: 5, scope: !2057)
!2088 = !DILocation(line: 74, column: 3, scope: !2046)
!2089 = !DILocation(line: 64, column: 24, scope: !2043)
!2090 = !DILocation(line: 64, column: 3, scope: !2043)
!2091 = distinct !{!2091, !2044, !2092, !132}
!2092 = !DILocation(line: 74, column: 3, scope: !2040)
!2093 = !DILocation(line: 75, column: 1, scope: !2034)
!2094 = distinct !DISubprogram(name: "load32_littleendian", scope: !1935, file: !1935, line: 15, type: !2012, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !95, retainedNodes: !49)
!2095 = !DILocalVariable(name: "x", arg: 1, scope: !2094, file: !1935, line: 15, type: !318)
!2096 = !DILocation(line: 0, scope: !2094)
!2097 = !DILocation(line: 18, column: 18, scope: !2094)
!2098 = !DILocation(line: 18, column: 8, scope: !2094)
!2099 = !DILocalVariable(name: "r", scope: !2094, file: !1935, line: 17, type: !91)
!2100 = !DILocation(line: 19, column: 18, scope: !2094)
!2101 = !DILocation(line: 19, column: 8, scope: !2094)
!2102 = !DILocation(line: 19, column: 23, scope: !2094)
!2103 = !DILocation(line: 19, column: 5, scope: !2094)
!2104 = !DILocation(line: 20, column: 18, scope: !2094)
!2105 = !DILocation(line: 20, column: 8, scope: !2094)
!2106 = !DILocation(line: 20, column: 23, scope: !2094)
!2107 = !DILocation(line: 20, column: 5, scope: !2094)
!2108 = !DILocation(line: 21, column: 18, scope: !2094)
!2109 = !DILocation(line: 21, column: 8, scope: !2094)
!2110 = !DILocation(line: 21, column: 23, scope: !2094)
!2111 = !DILocation(line: 21, column: 5, scope: !2094)
!2112 = !DILocation(line: 22, column: 3, scope: !2094)
!2113 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_montgomery_reduce", scope: !2114, file: !2114, line: 16, type: !2115, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !97, retainedNodes: !49)
!2114 = !DIFile(filename: "../../ref/reduce.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!2115 = !DISubroutineType(types: !98)
!2116 = !DILocalVariable(name: "a", arg: 1, scope: !2113, file: !2114, line: 16, type: !55)
!2117 = !DILocation(line: 0, scope: !2113)
!2118 = !DILocation(line: 20, column: 7, scope: !2113)
!2119 = !DILocation(line: 20, column: 17, scope: !2113)
!2120 = !DILocalVariable(name: "t", scope: !2113, file: !2114, line: 18, type: !61)
!2121 = !DILocation(line: 21, column: 12, scope: !2113)
!2122 = !DILocation(line: 21, column: 22, scope: !2113)
!2123 = !DILocation(line: 21, column: 10, scope: !2113)
!2124 = !DILocation(line: 21, column: 32, scope: !2113)
!2125 = !DILocation(line: 21, column: 7, scope: !2113)
!2126 = !DILocation(line: 22, column: 3, scope: !2113)
!2127 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_barrett_reduce", scope: !2114, file: !2114, line: 35, type: !2128, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !97, retainedNodes: !49)
!2128 = !DISubroutineType(types: !2129)
!2129 = !{!61, !61}
!2130 = !DILocalVariable(name: "a", arg: 1, scope: !2127, file: !2114, line: 35, type: !61)
!2131 = !DILocation(line: 0, scope: !2127)
!2132 = !DILocalVariable(name: "v", scope: !2127, file: !2114, line: 37, type: !60)
!2133 = !DILocation(line: 39, column: 20, scope: !2127)
!2134 = !DILocation(line: 39, column: 19, scope: !2127)
!2135 = !DILocation(line: 39, column: 22, scope: !2127)
!2136 = !DILocation(line: 39, column: 33, scope: !2127)
!2137 = !DILocation(line: 39, column: 8, scope: !2127)
!2138 = !DILocalVariable(name: "t", scope: !2127, file: !2114, line: 36, type: !61)
!2139 = !DILocation(line: 40, column: 5, scope: !2127)
!2140 = !DILocation(line: 41, column: 10, scope: !2127)
!2141 = !DILocation(line: 41, column: 14, scope: !2127)
!2142 = !DILocation(line: 41, column: 12, scope: !2127)
!2143 = !DILocation(line: 41, column: 3, scope: !2127)
!2144 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_verify", scope: !2145, file: !2145, line: 16, type: !2146, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !99, retainedNodes: !49)
!2145 = !DIFile(filename: "../../ref/verify.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!2146 = !DISubroutineType(types: !2147)
!2147 = !{!50, !318, !318, !38}
!2148 = !DILocalVariable(name: "a", arg: 1, scope: !2144, file: !2145, line: 16, type: !318)
!2149 = !DILocation(line: 0, scope: !2144)
!2150 = !DILocalVariable(name: "b", arg: 2, scope: !2144, file: !2145, line: 16, type: !318)
!2151 = !DILocalVariable(name: "len", arg: 3, scope: !2144, file: !2145, line: 16, type: !38)
!2152 = !DILocalVariable(name: "r", scope: !2144, file: !2145, line: 19, type: !33)
!2153 = !DILocalVariable(name: "i", scope: !2144, file: !2145, line: 18, type: !38)
!2154 = !DILocation(line: 21, column: 7, scope: !2155)
!2155 = distinct !DILexicalBlock(scope: !2144, file: !2145, line: 21, column: 3)
!2156 = !DILocation(line: 21, scope: !2155)
!2157 = !DILocation(line: 21, column: 12, scope: !2158)
!2158 = distinct !DILexicalBlock(scope: !2155, file: !2145, line: 21, column: 3)
!2159 = !DILocation(line: 21, column: 3, scope: !2155)
!2160 = !DILocation(line: 22, column: 10, scope: !2158)
!2161 = !DILocation(line: 22, column: 17, scope: !2158)
!2162 = !DILocation(line: 22, column: 15, scope: !2158)
!2163 = !DILocation(line: 22, column: 7, scope: !2158)
!2164 = !DILocation(line: 22, column: 5, scope: !2158)
!2165 = !DILocation(line: 21, column: 18, scope: !2158)
!2166 = !DILocation(line: 21, column: 3, scope: !2158)
!2167 = distinct !{!2167, !2159, !2168, !132}
!2168 = !DILocation(line: 22, column: 20, scope: !2155)
!2169 = !DILocation(line: 24, column: 12, scope: !2144)
!2170 = !DILocation(line: 24, column: 11, scope: !2144)
!2171 = !DILocation(line: 24, column: 25, scope: !2144)
!2172 = !DILocation(line: 24, column: 10, scope: !2144)
!2173 = !DILocation(line: 24, column: 3, scope: !2144)
!2174 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_cmov", scope: !2145, file: !2145, line: 40, type: !2175, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !99, retainedNodes: !49)
!2175 = !DISubroutineType(types: !2176)
!2176 = !{null, !32, !318, !38, !33}
!2177 = !DILocalVariable(name: "r", arg: 1, scope: !2174, file: !2145, line: 40, type: !32)
!2178 = !DILocation(line: 0, scope: !2174)
!2179 = !DILocalVariable(name: "x", arg: 2, scope: !2174, file: !2145, line: 40, type: !318)
!2180 = !DILocalVariable(name: "len", arg: 3, scope: !2174, file: !2145, line: 40, type: !38)
!2181 = !DILocalVariable(name: "b", arg: 4, scope: !2174, file: !2145, line: 40, type: !33)
!2182 = !DILocation(line: 51, column: 3, scope: !2174)
!2183 = !{i64 1722}
!2184 = !DILocation(line: 54, column: 8, scope: !2174)
!2185 = !DILocation(line: 54, column: 7, scope: !2174)
!2186 = !DILocalVariable(name: "i", scope: !2174, file: !2145, line: 42, type: !38)
!2187 = !DILocation(line: 55, column: 7, scope: !2188)
!2188 = distinct !DILexicalBlock(scope: !2174, file: !2145, line: 55, column: 3)
!2189 = !DILocation(line: 55, scope: !2188)
!2190 = !DILocation(line: 55, column: 12, scope: !2191)
!2191 = distinct !DILexicalBlock(scope: !2188, file: !2145, line: 55, column: 3)
!2192 = !DILocation(line: 55, column: 3, scope: !2188)
!2193 = !DILocation(line: 56, column: 13, scope: !2191)
!2194 = !DILocation(line: 56, column: 18, scope: !2191)
!2195 = !DILocation(line: 56, column: 25, scope: !2191)
!2196 = !DILocation(line: 56, column: 23, scope: !2191)
!2197 = !DILocation(line: 56, column: 15, scope: !2191)
!2198 = !DILocation(line: 56, column: 5, scope: !2191)
!2199 = !DILocation(line: 56, column: 10, scope: !2191)
!2200 = !DILocation(line: 55, column: 18, scope: !2191)
!2201 = !DILocation(line: 55, column: 3, scope: !2191)
!2202 = distinct !{!2202, !2192, !2203, !132}
!2203 = !DILocation(line: 56, column: 29, scope: !2188)
!2204 = !DILocation(line: 57, column: 1, scope: !2174)
!2205 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_cmov_int16", scope: !2145, file: !2145, line: 71, type: !2206, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !99, retainedNodes: !49)
!2206 = !DISubroutineType(types: !2207)
!2207 = !{null, !520, !61, !86}
!2208 = !DILocalVariable(name: "r", arg: 1, scope: !2205, file: !2145, line: 71, type: !520)
!2209 = !DILocation(line: 0, scope: !2205)
!2210 = !DILocalVariable(name: "v", arg: 2, scope: !2205, file: !2145, line: 71, type: !61)
!2211 = !DILocalVariable(name: "b", arg: 3, scope: !2205, file: !2145, line: 71, type: !86)
!2212 = !DILocation(line: 73, column: 8, scope: !2205)
!2213 = !DILocation(line: 73, column: 7, scope: !2205)
!2214 = !DILocation(line: 74, column: 9, scope: !2205)
!2215 = !DILocation(line: 74, column: 15, scope: !2205)
!2216 = !DILocation(line: 74, column: 14, scope: !2205)
!2217 = !DILocation(line: 74, column: 21, scope: !2205)
!2218 = !DILocation(line: 74, column: 19, scope: !2205)
!2219 = !DILocation(line: 74, column: 11, scope: !2205)
!2220 = !DILocation(line: 74, column: 6, scope: !2205)
!2221 = !DILocation(line: 75, column: 1, scope: !2205)
!2222 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_init", scope: !74, file: !74, line: 523, type: !2223, scopeLine: 524, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2223 = !DISubroutineType(types: !2224)
!2224 = !{null, !2225}
!2225 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2226, size: 32)
!2226 = !DIDerivedType(tag: DW_TAG_typedef, name: "keccak_state", file: !454, line: 17, baseType: !2227)
!2227 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !454, line: 14, size: 1664, elements: !2228)
!2228 = !{!2229, !2230}
!2229 = !DIDerivedType(tag: DW_TAG_member, name: "s", scope: !2227, file: !454, line: 15, baseType: !458, size: 1600)
!2230 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !2227, file: !454, line: 16, baseType: !40, size: 32, offset: 1600)
!2231 = !DILocalVariable(name: "state", arg: 1, scope: !2222, file: !74, line: 523, type: !2225)
!2232 = !DILocation(line: 0, scope: !2222)
!2233 = !DILocation(line: 525, column: 22, scope: !2222)
!2234 = !DILocation(line: 525, column: 15, scope: !2222)
!2235 = !DILocation(line: 525, column: 3, scope: !2222)
!2236 = !DILocation(line: 526, column: 10, scope: !2222)
!2237 = !DILocation(line: 526, column: 14, scope: !2222)
!2238 = !DILocation(line: 527, column: 1, scope: !2222)
!2239 = distinct !DISubprogram(name: "keccak_init", scope: !74, file: !74, line: 353, type: !2240, scopeLine: 354, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2240 = !DISubroutineType(types: !2241)
!2241 = !{null, !2242}
!2242 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 32)
!2243 = !DILocalVariable(name: "s", arg: 1, scope: !2239, file: !74, line: 353, type: !2242)
!2244 = !DILocation(line: 0, scope: !2239)
!2245 = !DILocalVariable(name: "i", scope: !2239, file: !74, line: 355, type: !40)
!2246 = !DILocation(line: 356, column: 7, scope: !2247)
!2247 = distinct !DILexicalBlock(scope: !2239, file: !74, line: 356, column: 3)
!2248 = !DILocation(line: 356, scope: !2247)
!2249 = !DILocation(line: 356, column: 12, scope: !2250)
!2250 = distinct !DILexicalBlock(scope: !2247, file: !74, line: 356, column: 3)
!2251 = !DILocation(line: 356, column: 3, scope: !2247)
!2252 = !DILocation(line: 357, column: 5, scope: !2250)
!2253 = !DILocation(line: 357, column: 10, scope: !2250)
!2254 = !DILocation(line: 356, column: 17, scope: !2250)
!2255 = !DILocation(line: 356, column: 3, scope: !2250)
!2256 = distinct !{!2256, !2251, !2257, !132}
!2257 = !DILocation(line: 357, column: 12, scope: !2247)
!2258 = !DILocation(line: 358, column: 1, scope: !2239)
!2259 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb", scope: !74, file: !74, line: 538, type: !2260, scopeLine: 539, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2260 = !DISubroutineType(types: !2261)
!2261 = !{null, !2225, !318, !38}
!2262 = !DILocalVariable(name: "state", arg: 1, scope: !2259, file: !74, line: 538, type: !2225)
!2263 = !DILocation(line: 0, scope: !2259)
!2264 = !DILocalVariable(name: "in", arg: 2, scope: !2259, file: !74, line: 538, type: !318)
!2265 = !DILocalVariable(name: "inlen", arg: 3, scope: !2259, file: !74, line: 538, type: !38)
!2266 = !DILocation(line: 540, column: 37, scope: !2259)
!2267 = !DILocation(line: 540, column: 30, scope: !2259)
!2268 = !DILocation(line: 540, column: 47, scope: !2259)
!2269 = !DILocation(line: 540, column: 16, scope: !2259)
!2270 = !DILocation(line: 540, column: 10, scope: !2259)
!2271 = !DILocation(line: 540, column: 14, scope: !2259)
!2272 = !DILocation(line: 541, column: 1, scope: !2259)
!2273 = distinct !DISubprogram(name: "keccak_absorb", scope: !74, file: !74, line: 373, type: !2274, scopeLine: 378, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2274 = !DISubroutineType(types: !2275)
!2275 = !{!40, !2242, !40, !40, !318, !38}
!2276 = !DILocalVariable(name: "s", arg: 1, scope: !2273, file: !74, line: 373, type: !2242)
!2277 = !DILocation(line: 0, scope: !2273)
!2278 = !DILocalVariable(name: "pos", arg: 2, scope: !2273, file: !74, line: 374, type: !40)
!2279 = !DILocalVariable(name: "r", arg: 3, scope: !2273, file: !74, line: 375, type: !40)
!2280 = !DILocalVariable(name: "in", arg: 4, scope: !2273, file: !74, line: 376, type: !318)
!2281 = !DILocalVariable(name: "inlen", arg: 5, scope: !2273, file: !74, line: 377, type: !38)
!2282 = !DILocation(line: 381, column: 3, scope: !2273)
!2283 = !DILocation(line: 381, column: 12, scope: !2273)
!2284 = !DILocation(line: 381, column: 19, scope: !2273)
!2285 = !DILocalVariable(name: "i", scope: !2273, file: !74, line: 379, type: !40)
!2286 = !DILocation(line: 382, column: 9, scope: !2287)
!2287 = distinct !DILexicalBlock(scope: !2288, file: !74, line: 382, column: 5)
!2288 = distinct !DILexicalBlock(scope: !2273, file: !74, line: 381, column: 25)
!2289 = !DILocation(line: 382, scope: !2287)
!2290 = !DILocation(line: 382, column: 16, scope: !2291)
!2291 = distinct !DILexicalBlock(scope: !2287, file: !74, line: 382, column: 5)
!2292 = !DILocation(line: 382, column: 5, scope: !2287)
!2293 = !DILocation(line: 383, column: 30, scope: !2291)
!2294 = !DILocation(line: 383, column: 27, scope: !2291)
!2295 = !DILocation(line: 383, column: 17, scope: !2291)
!2296 = !DILocation(line: 383, column: 40, scope: !2291)
!2297 = !DILocation(line: 383, column: 37, scope: !2291)
!2298 = !DILocation(line: 383, column: 33, scope: !2291)
!2299 = !DILocation(line: 383, column: 10, scope: !2291)
!2300 = !DILocation(line: 383, column: 7, scope: !2291)
!2301 = !DILocation(line: 383, column: 14, scope: !2291)
!2302 = !DILocation(line: 382, column: 20, scope: !2291)
!2303 = !DILocation(line: 382, column: 5, scope: !2291)
!2304 = distinct !{!2304, !2292, !2305, !132}
!2305 = !DILocation(line: 383, column: 42, scope: !2287)
!2306 = !DILocation(line: 384, column: 15, scope: !2288)
!2307 = !DILocation(line: 384, column: 11, scope: !2288)
!2308 = !DILocation(line: 385, column: 5, scope: !2288)
!2309 = distinct !{!2309, !2282, !2310, !132}
!2310 = !DILocation(line: 387, column: 3, scope: !2273)
!2311 = !DILocation(line: 389, column: 7, scope: !2312)
!2312 = distinct !DILexicalBlock(scope: !2273, file: !74, line: 389, column: 3)
!2313 = !DILocation(line: 389, scope: !2312)
!2314 = !DILocation(line: 389, column: 18, scope: !2315)
!2315 = distinct !DILexicalBlock(scope: !2312, file: !74, line: 389, column: 3)
!2316 = !DILocation(line: 389, column: 14, scope: !2315)
!2317 = !DILocation(line: 389, column: 3, scope: !2312)
!2318 = !DILocation(line: 390, column: 28, scope: !2315)
!2319 = !DILocation(line: 390, column: 25, scope: !2315)
!2320 = !DILocation(line: 390, column: 15, scope: !2315)
!2321 = !DILocation(line: 390, column: 38, scope: !2315)
!2322 = !DILocation(line: 390, column: 35, scope: !2315)
!2323 = !DILocation(line: 390, column: 31, scope: !2315)
!2324 = !DILocation(line: 390, column: 8, scope: !2315)
!2325 = !DILocation(line: 390, column: 5, scope: !2315)
!2326 = !DILocation(line: 390, column: 12, scope: !2315)
!2327 = !DILocation(line: 389, column: 26, scope: !2315)
!2328 = !DILocation(line: 389, column: 3, scope: !2315)
!2329 = distinct !{!2329, !2317, !2330, !132}
!2330 = !DILocation(line: 390, column: 40, scope: !2312)
!2331 = !DILocation(line: 392, column: 3, scope: !2273)
!2332 = distinct !DISubprogram(name: "KeccakF1600_StatePermute", scope: !74, file: !74, line: 82, type: !2240, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2333 = !DILocalVariable(name: "state", arg: 1, scope: !2332, file: !74, line: 82, type: !2242)
!2334 = !DILocation(line: 0, scope: !2332)
!2335 = !DILocation(line: 100, column: 15, scope: !2332)
!2336 = !DILocalVariable(name: "Aba", scope: !2332, file: !74, line: 86, type: !70)
!2337 = !DILocation(line: 101, column: 15, scope: !2332)
!2338 = !DILocalVariable(name: "Abe", scope: !2332, file: !74, line: 86, type: !70)
!2339 = !DILocation(line: 102, column: 15, scope: !2332)
!2340 = !DILocalVariable(name: "Abi", scope: !2332, file: !74, line: 86, type: !70)
!2341 = !DILocation(line: 103, column: 15, scope: !2332)
!2342 = !DILocalVariable(name: "Abo", scope: !2332, file: !74, line: 86, type: !70)
!2343 = !DILocation(line: 104, column: 15, scope: !2332)
!2344 = !DILocalVariable(name: "Abu", scope: !2332, file: !74, line: 86, type: !70)
!2345 = !DILocation(line: 105, column: 15, scope: !2332)
!2346 = !DILocalVariable(name: "Aga", scope: !2332, file: !74, line: 87, type: !70)
!2347 = !DILocation(line: 106, column: 15, scope: !2332)
!2348 = !DILocalVariable(name: "Age", scope: !2332, file: !74, line: 87, type: !70)
!2349 = !DILocation(line: 107, column: 15, scope: !2332)
!2350 = !DILocalVariable(name: "Agi", scope: !2332, file: !74, line: 87, type: !70)
!2351 = !DILocation(line: 108, column: 15, scope: !2332)
!2352 = !DILocalVariable(name: "Ago", scope: !2332, file: !74, line: 87, type: !70)
!2353 = !DILocation(line: 109, column: 15, scope: !2332)
!2354 = !DILocalVariable(name: "Agu", scope: !2332, file: !74, line: 87, type: !70)
!2355 = !DILocation(line: 110, column: 15, scope: !2332)
!2356 = !DILocalVariable(name: "Aka", scope: !2332, file: !74, line: 88, type: !70)
!2357 = !DILocation(line: 111, column: 15, scope: !2332)
!2358 = !DILocalVariable(name: "Ake", scope: !2332, file: !74, line: 88, type: !70)
!2359 = !DILocation(line: 112, column: 15, scope: !2332)
!2360 = !DILocalVariable(name: "Aki", scope: !2332, file: !74, line: 88, type: !70)
!2361 = !DILocation(line: 113, column: 15, scope: !2332)
!2362 = !DILocalVariable(name: "Ako", scope: !2332, file: !74, line: 88, type: !70)
!2363 = !DILocation(line: 114, column: 15, scope: !2332)
!2364 = !DILocalVariable(name: "Aku", scope: !2332, file: !74, line: 88, type: !70)
!2365 = !DILocation(line: 115, column: 15, scope: !2332)
!2366 = !DILocalVariable(name: "Ama", scope: !2332, file: !74, line: 89, type: !70)
!2367 = !DILocation(line: 116, column: 15, scope: !2332)
!2368 = !DILocalVariable(name: "Ame", scope: !2332, file: !74, line: 89, type: !70)
!2369 = !DILocation(line: 117, column: 15, scope: !2332)
!2370 = !DILocalVariable(name: "Ami", scope: !2332, file: !74, line: 89, type: !70)
!2371 = !DILocation(line: 118, column: 15, scope: !2332)
!2372 = !DILocalVariable(name: "Amo", scope: !2332, file: !74, line: 89, type: !70)
!2373 = !DILocation(line: 119, column: 15, scope: !2332)
!2374 = !DILocalVariable(name: "Amu", scope: !2332, file: !74, line: 89, type: !70)
!2375 = !DILocation(line: 120, column: 15, scope: !2332)
!2376 = !DILocalVariable(name: "Asa", scope: !2332, file: !74, line: 90, type: !70)
!2377 = !DILocation(line: 121, column: 15, scope: !2332)
!2378 = !DILocalVariable(name: "Ase", scope: !2332, file: !74, line: 90, type: !70)
!2379 = !DILocation(line: 122, column: 15, scope: !2332)
!2380 = !DILocalVariable(name: "Asi", scope: !2332, file: !74, line: 90, type: !70)
!2381 = !DILocation(line: 123, column: 15, scope: !2332)
!2382 = !DILocalVariable(name: "Aso", scope: !2332, file: !74, line: 90, type: !70)
!2383 = !DILocation(line: 124, column: 15, scope: !2332)
!2384 = !DILocalVariable(name: "Asu", scope: !2332, file: !74, line: 90, type: !70)
!2385 = !DILocalVariable(name: "round", scope: !2332, file: !74, line: 84, type: !50)
!2386 = !DILocation(line: 126, column: 13, scope: !2387)
!2387 = distinct !DILexicalBlock(scope: !2332, file: !74, line: 126, column: 9)
!2388 = !DILocation(line: 126, scope: !2387)
!2389 = !DILocation(line: 126, column: 30, scope: !2390)
!2390 = distinct !DILexicalBlock(scope: !2387, file: !74, line: 126, column: 9)
!2391 = !DILocation(line: 126, column: 9, scope: !2387)
!2392 = !DILocation(line: 128, column: 22, scope: !2393)
!2393 = distinct !DILexicalBlock(scope: !2390, file: !74, line: 126, column: 53)
!2394 = !DILocation(line: 128, column: 26, scope: !2393)
!2395 = !DILocation(line: 128, column: 30, scope: !2393)
!2396 = !DILocation(line: 128, column: 34, scope: !2393)
!2397 = !DILocalVariable(name: "BCa", scope: !2332, file: !74, line: 91, type: !70)
!2398 = !DILocation(line: 129, column: 22, scope: !2393)
!2399 = !DILocation(line: 129, column: 26, scope: !2393)
!2400 = !DILocation(line: 129, column: 30, scope: !2393)
!2401 = !DILocation(line: 129, column: 34, scope: !2393)
!2402 = !DILocalVariable(name: "BCe", scope: !2332, file: !74, line: 91, type: !70)
!2403 = !DILocation(line: 130, column: 22, scope: !2393)
!2404 = !DILocation(line: 130, column: 26, scope: !2393)
!2405 = !DILocation(line: 130, column: 30, scope: !2393)
!2406 = !DILocation(line: 130, column: 34, scope: !2393)
!2407 = !DILocalVariable(name: "BCi", scope: !2332, file: !74, line: 91, type: !70)
!2408 = !DILocation(line: 131, column: 22, scope: !2393)
!2409 = !DILocation(line: 131, column: 26, scope: !2393)
!2410 = !DILocation(line: 131, column: 30, scope: !2393)
!2411 = !DILocation(line: 131, column: 34, scope: !2393)
!2412 = !DILocalVariable(name: "BCo", scope: !2332, file: !74, line: 91, type: !70)
!2413 = !DILocation(line: 132, column: 22, scope: !2393)
!2414 = !DILocation(line: 132, column: 26, scope: !2393)
!2415 = !DILocation(line: 132, column: 30, scope: !2393)
!2416 = !DILocation(line: 132, column: 34, scope: !2393)
!2417 = !DILocalVariable(name: "BCu", scope: !2332, file: !74, line: 91, type: !70)
!2418 = !DILocation(line: 135, column: 22, scope: !2393)
!2419 = !DILocation(line: 135, column: 21, scope: !2393)
!2420 = !DILocalVariable(name: "Da", scope: !2332, file: !74, line: 92, type: !70)
!2421 = !DILocation(line: 136, column: 22, scope: !2393)
!2422 = !DILocation(line: 136, column: 21, scope: !2393)
!2423 = !DILocalVariable(name: "De", scope: !2332, file: !74, line: 92, type: !70)
!2424 = !DILocation(line: 137, column: 22, scope: !2393)
!2425 = !DILocation(line: 137, column: 21, scope: !2393)
!2426 = !DILocalVariable(name: "Di", scope: !2332, file: !74, line: 92, type: !70)
!2427 = !DILocation(line: 138, column: 22, scope: !2393)
!2428 = !DILocation(line: 138, column: 21, scope: !2393)
!2429 = !DILocalVariable(name: "Do", scope: !2332, file: !74, line: 92, type: !70)
!2430 = !DILocation(line: 139, column: 22, scope: !2393)
!2431 = !DILocation(line: 139, column: 21, scope: !2393)
!2432 = !DILocalVariable(name: "Du", scope: !2332, file: !74, line: 92, type: !70)
!2433 = !DILocation(line: 141, column: 17, scope: !2393)
!2434 = !DILocation(line: 143, column: 17, scope: !2393)
!2435 = !DILocation(line: 144, column: 19, scope: !2393)
!2436 = !DILocation(line: 145, column: 17, scope: !2393)
!2437 = !DILocation(line: 146, column: 19, scope: !2393)
!2438 = !DILocation(line: 147, column: 17, scope: !2393)
!2439 = !DILocation(line: 148, column: 19, scope: !2393)
!2440 = !DILocation(line: 149, column: 17, scope: !2393)
!2441 = !DILocation(line: 150, column: 19, scope: !2393)
!2442 = !DILocation(line: 151, column: 28, scope: !2393)
!2443 = !DILocation(line: 151, column: 33, scope: !2393)
!2444 = !DILocation(line: 151, column: 25, scope: !2393)
!2445 = !DILocalVariable(name: "Eba", scope: !2332, file: !74, line: 93, type: !70)
!2446 = !DILocation(line: 152, column: 30, scope: !2393)
!2447 = !DILocation(line: 152, column: 17, scope: !2393)
!2448 = !DILocation(line: 153, column: 28, scope: !2393)
!2449 = !DILocation(line: 153, column: 33, scope: !2393)
!2450 = !DILocation(line: 153, column: 25, scope: !2393)
!2451 = !DILocalVariable(name: "Ebe", scope: !2332, file: !74, line: 93, type: !70)
!2452 = !DILocation(line: 154, column: 28, scope: !2393)
!2453 = !DILocation(line: 154, column: 33, scope: !2393)
!2454 = !DILocation(line: 154, column: 25, scope: !2393)
!2455 = !DILocalVariable(name: "Ebi", scope: !2332, file: !74, line: 93, type: !70)
!2456 = !DILocation(line: 155, column: 28, scope: !2393)
!2457 = !DILocation(line: 155, column: 33, scope: !2393)
!2458 = !DILocation(line: 155, column: 25, scope: !2393)
!2459 = !DILocalVariable(name: "Ebo", scope: !2332, file: !74, line: 93, type: !70)
!2460 = !DILocation(line: 156, column: 28, scope: !2393)
!2461 = !DILocation(line: 156, column: 33, scope: !2393)
!2462 = !DILocation(line: 156, column: 25, scope: !2393)
!2463 = !DILocalVariable(name: "Ebu", scope: !2332, file: !74, line: 93, type: !70)
!2464 = !DILocation(line: 158, column: 17, scope: !2393)
!2465 = !DILocation(line: 159, column: 19, scope: !2393)
!2466 = !DILocation(line: 160, column: 17, scope: !2393)
!2467 = !DILocation(line: 161, column: 19, scope: !2393)
!2468 = !DILocation(line: 162, column: 17, scope: !2393)
!2469 = !DILocation(line: 163, column: 19, scope: !2393)
!2470 = !DILocation(line: 164, column: 17, scope: !2393)
!2471 = !DILocation(line: 165, column: 19, scope: !2393)
!2472 = !DILocation(line: 166, column: 17, scope: !2393)
!2473 = !DILocation(line: 167, column: 19, scope: !2393)
!2474 = !DILocation(line: 168, column: 28, scope: !2393)
!2475 = !DILocation(line: 168, column: 33, scope: !2393)
!2476 = !DILocation(line: 168, column: 25, scope: !2393)
!2477 = !DILocalVariable(name: "Ega", scope: !2332, file: !74, line: 94, type: !70)
!2478 = !DILocation(line: 169, column: 28, scope: !2393)
!2479 = !DILocation(line: 169, column: 33, scope: !2393)
!2480 = !DILocation(line: 169, column: 25, scope: !2393)
!2481 = !DILocalVariable(name: "Ege", scope: !2332, file: !74, line: 94, type: !70)
!2482 = !DILocation(line: 170, column: 28, scope: !2393)
!2483 = !DILocation(line: 170, column: 33, scope: !2393)
!2484 = !DILocation(line: 170, column: 25, scope: !2393)
!2485 = !DILocalVariable(name: "Egi", scope: !2332, file: !74, line: 94, type: !70)
!2486 = !DILocation(line: 171, column: 28, scope: !2393)
!2487 = !DILocation(line: 171, column: 33, scope: !2393)
!2488 = !DILocation(line: 171, column: 25, scope: !2393)
!2489 = !DILocalVariable(name: "Ego", scope: !2332, file: !74, line: 94, type: !70)
!2490 = !DILocation(line: 172, column: 28, scope: !2393)
!2491 = !DILocation(line: 172, column: 33, scope: !2393)
!2492 = !DILocation(line: 172, column: 25, scope: !2393)
!2493 = !DILocalVariable(name: "Egu", scope: !2332, file: !74, line: 94, type: !70)
!2494 = !DILocation(line: 174, column: 17, scope: !2393)
!2495 = !DILocation(line: 175, column: 19, scope: !2393)
!2496 = !DILocation(line: 176, column: 17, scope: !2393)
!2497 = !DILocation(line: 177, column: 19, scope: !2393)
!2498 = !DILocation(line: 178, column: 17, scope: !2393)
!2499 = !DILocation(line: 179, column: 19, scope: !2393)
!2500 = !DILocation(line: 180, column: 17, scope: !2393)
!2501 = !DILocation(line: 181, column: 19, scope: !2393)
!2502 = !DILocation(line: 182, column: 17, scope: !2393)
!2503 = !DILocation(line: 183, column: 19, scope: !2393)
!2504 = !DILocation(line: 184, column: 28, scope: !2393)
!2505 = !DILocation(line: 184, column: 33, scope: !2393)
!2506 = !DILocation(line: 184, column: 25, scope: !2393)
!2507 = !DILocalVariable(name: "Eka", scope: !2332, file: !74, line: 95, type: !70)
!2508 = !DILocation(line: 185, column: 28, scope: !2393)
!2509 = !DILocation(line: 185, column: 33, scope: !2393)
!2510 = !DILocation(line: 185, column: 25, scope: !2393)
!2511 = !DILocalVariable(name: "Eke", scope: !2332, file: !74, line: 95, type: !70)
!2512 = !DILocation(line: 186, column: 28, scope: !2393)
!2513 = !DILocation(line: 186, column: 33, scope: !2393)
!2514 = !DILocation(line: 186, column: 25, scope: !2393)
!2515 = !DILocalVariable(name: "Eki", scope: !2332, file: !74, line: 95, type: !70)
!2516 = !DILocation(line: 187, column: 28, scope: !2393)
!2517 = !DILocation(line: 187, column: 33, scope: !2393)
!2518 = !DILocation(line: 187, column: 25, scope: !2393)
!2519 = !DILocalVariable(name: "Eko", scope: !2332, file: !74, line: 95, type: !70)
!2520 = !DILocation(line: 188, column: 28, scope: !2393)
!2521 = !DILocation(line: 188, column: 33, scope: !2393)
!2522 = !DILocation(line: 188, column: 25, scope: !2393)
!2523 = !DILocalVariable(name: "Eku", scope: !2332, file: !74, line: 95, type: !70)
!2524 = !DILocation(line: 190, column: 17, scope: !2393)
!2525 = !DILocation(line: 191, column: 19, scope: !2393)
!2526 = !DILocation(line: 192, column: 17, scope: !2393)
!2527 = !DILocation(line: 193, column: 19, scope: !2393)
!2528 = !DILocation(line: 194, column: 17, scope: !2393)
!2529 = !DILocation(line: 195, column: 19, scope: !2393)
!2530 = !DILocation(line: 196, column: 17, scope: !2393)
!2531 = !DILocation(line: 197, column: 19, scope: !2393)
!2532 = !DILocation(line: 198, column: 17, scope: !2393)
!2533 = !DILocation(line: 199, column: 19, scope: !2393)
!2534 = !DILocation(line: 200, column: 28, scope: !2393)
!2535 = !DILocation(line: 200, column: 33, scope: !2393)
!2536 = !DILocation(line: 200, column: 25, scope: !2393)
!2537 = !DILocalVariable(name: "Ema", scope: !2332, file: !74, line: 96, type: !70)
!2538 = !DILocation(line: 201, column: 28, scope: !2393)
!2539 = !DILocation(line: 201, column: 33, scope: !2393)
!2540 = !DILocation(line: 201, column: 25, scope: !2393)
!2541 = !DILocalVariable(name: "Eme", scope: !2332, file: !74, line: 96, type: !70)
!2542 = !DILocation(line: 202, column: 28, scope: !2393)
!2543 = !DILocation(line: 202, column: 33, scope: !2393)
!2544 = !DILocation(line: 202, column: 25, scope: !2393)
!2545 = !DILocalVariable(name: "Emi", scope: !2332, file: !74, line: 96, type: !70)
!2546 = !DILocation(line: 203, column: 28, scope: !2393)
!2547 = !DILocation(line: 203, column: 33, scope: !2393)
!2548 = !DILocation(line: 203, column: 25, scope: !2393)
!2549 = !DILocalVariable(name: "Emo", scope: !2332, file: !74, line: 96, type: !70)
!2550 = !DILocation(line: 204, column: 28, scope: !2393)
!2551 = !DILocation(line: 204, column: 33, scope: !2393)
!2552 = !DILocation(line: 204, column: 25, scope: !2393)
!2553 = !DILocalVariable(name: "Emu", scope: !2332, file: !74, line: 96, type: !70)
!2554 = !DILocation(line: 206, column: 17, scope: !2393)
!2555 = !DILocation(line: 207, column: 19, scope: !2393)
!2556 = !DILocation(line: 208, column: 17, scope: !2393)
!2557 = !DILocation(line: 209, column: 19, scope: !2393)
!2558 = !DILocation(line: 210, column: 17, scope: !2393)
!2559 = !DILocation(line: 211, column: 19, scope: !2393)
!2560 = !DILocation(line: 212, column: 17, scope: !2393)
!2561 = !DILocation(line: 213, column: 19, scope: !2393)
!2562 = !DILocation(line: 214, column: 17, scope: !2393)
!2563 = !DILocation(line: 215, column: 19, scope: !2393)
!2564 = !DILocation(line: 216, column: 28, scope: !2393)
!2565 = !DILocation(line: 216, column: 33, scope: !2393)
!2566 = !DILocation(line: 216, column: 25, scope: !2393)
!2567 = !DILocalVariable(name: "Esa", scope: !2332, file: !74, line: 97, type: !70)
!2568 = !DILocation(line: 217, column: 28, scope: !2393)
!2569 = !DILocation(line: 217, column: 33, scope: !2393)
!2570 = !DILocation(line: 217, column: 25, scope: !2393)
!2571 = !DILocalVariable(name: "Ese", scope: !2332, file: !74, line: 97, type: !70)
!2572 = !DILocation(line: 218, column: 28, scope: !2393)
!2573 = !DILocation(line: 218, column: 33, scope: !2393)
!2574 = !DILocation(line: 218, column: 25, scope: !2393)
!2575 = !DILocalVariable(name: "Esi", scope: !2332, file: !74, line: 97, type: !70)
!2576 = !DILocation(line: 219, column: 28, scope: !2393)
!2577 = !DILocation(line: 219, column: 33, scope: !2393)
!2578 = !DILocation(line: 219, column: 25, scope: !2393)
!2579 = !DILocalVariable(name: "Eso", scope: !2332, file: !74, line: 97, type: !70)
!2580 = !DILocation(line: 220, column: 28, scope: !2393)
!2581 = !DILocation(line: 220, column: 33, scope: !2393)
!2582 = !DILocation(line: 220, column: 25, scope: !2393)
!2583 = !DILocalVariable(name: "Esu", scope: !2332, file: !74, line: 97, type: !70)
!2584 = !DILocation(line: 223, column: 22, scope: !2393)
!2585 = !DILocation(line: 223, column: 26, scope: !2393)
!2586 = !DILocation(line: 223, column: 30, scope: !2393)
!2587 = !DILocation(line: 223, column: 34, scope: !2393)
!2588 = !DILocation(line: 224, column: 22, scope: !2393)
!2589 = !DILocation(line: 224, column: 26, scope: !2393)
!2590 = !DILocation(line: 224, column: 30, scope: !2393)
!2591 = !DILocation(line: 224, column: 34, scope: !2393)
!2592 = !DILocation(line: 225, column: 22, scope: !2393)
!2593 = !DILocation(line: 225, column: 26, scope: !2393)
!2594 = !DILocation(line: 225, column: 30, scope: !2393)
!2595 = !DILocation(line: 225, column: 34, scope: !2393)
!2596 = !DILocation(line: 226, column: 22, scope: !2393)
!2597 = !DILocation(line: 226, column: 26, scope: !2393)
!2598 = !DILocation(line: 226, column: 30, scope: !2393)
!2599 = !DILocation(line: 226, column: 34, scope: !2393)
!2600 = !DILocation(line: 227, column: 22, scope: !2393)
!2601 = !DILocation(line: 227, column: 26, scope: !2393)
!2602 = !DILocation(line: 227, column: 30, scope: !2393)
!2603 = !DILocation(line: 227, column: 34, scope: !2393)
!2604 = !DILocation(line: 230, column: 22, scope: !2393)
!2605 = !DILocation(line: 230, column: 21, scope: !2393)
!2606 = !DILocation(line: 231, column: 22, scope: !2393)
!2607 = !DILocation(line: 231, column: 21, scope: !2393)
!2608 = !DILocation(line: 232, column: 22, scope: !2393)
!2609 = !DILocation(line: 232, column: 21, scope: !2393)
!2610 = !DILocation(line: 233, column: 22, scope: !2393)
!2611 = !DILocation(line: 233, column: 21, scope: !2393)
!2612 = !DILocation(line: 234, column: 22, scope: !2393)
!2613 = !DILocation(line: 234, column: 21, scope: !2393)
!2614 = !DILocation(line: 236, column: 17, scope: !2393)
!2615 = !DILocation(line: 238, column: 17, scope: !2393)
!2616 = !DILocation(line: 239, column: 19, scope: !2393)
!2617 = !DILocation(line: 240, column: 17, scope: !2393)
!2618 = !DILocation(line: 241, column: 19, scope: !2393)
!2619 = !DILocation(line: 242, column: 17, scope: !2393)
!2620 = !DILocation(line: 243, column: 19, scope: !2393)
!2621 = !DILocation(line: 244, column: 17, scope: !2393)
!2622 = !DILocation(line: 245, column: 19, scope: !2393)
!2623 = !DILocation(line: 246, column: 28, scope: !2393)
!2624 = !DILocation(line: 246, column: 33, scope: !2393)
!2625 = !DILocation(line: 246, column: 25, scope: !2393)
!2626 = !DILocation(line: 247, column: 58, scope: !2393)
!2627 = !DILocation(line: 247, column: 30, scope: !2393)
!2628 = !DILocation(line: 247, column: 17, scope: !2393)
!2629 = !DILocation(line: 248, column: 28, scope: !2393)
!2630 = !DILocation(line: 248, column: 33, scope: !2393)
!2631 = !DILocation(line: 248, column: 25, scope: !2393)
!2632 = !DILocation(line: 249, column: 28, scope: !2393)
!2633 = !DILocation(line: 249, column: 33, scope: !2393)
!2634 = !DILocation(line: 249, column: 25, scope: !2393)
!2635 = !DILocation(line: 250, column: 28, scope: !2393)
!2636 = !DILocation(line: 250, column: 33, scope: !2393)
!2637 = !DILocation(line: 250, column: 25, scope: !2393)
!2638 = !DILocation(line: 251, column: 28, scope: !2393)
!2639 = !DILocation(line: 251, column: 33, scope: !2393)
!2640 = !DILocation(line: 251, column: 25, scope: !2393)
!2641 = !DILocation(line: 253, column: 17, scope: !2393)
!2642 = !DILocation(line: 254, column: 19, scope: !2393)
!2643 = !DILocation(line: 255, column: 17, scope: !2393)
!2644 = !DILocation(line: 256, column: 19, scope: !2393)
!2645 = !DILocation(line: 257, column: 17, scope: !2393)
!2646 = !DILocation(line: 258, column: 19, scope: !2393)
!2647 = !DILocation(line: 259, column: 17, scope: !2393)
!2648 = !DILocation(line: 260, column: 19, scope: !2393)
!2649 = !DILocation(line: 261, column: 17, scope: !2393)
!2650 = !DILocation(line: 262, column: 19, scope: !2393)
!2651 = !DILocation(line: 263, column: 28, scope: !2393)
!2652 = !DILocation(line: 263, column: 33, scope: !2393)
!2653 = !DILocation(line: 263, column: 25, scope: !2393)
!2654 = !DILocation(line: 264, column: 28, scope: !2393)
!2655 = !DILocation(line: 264, column: 33, scope: !2393)
!2656 = !DILocation(line: 264, column: 25, scope: !2393)
!2657 = !DILocation(line: 265, column: 28, scope: !2393)
!2658 = !DILocation(line: 265, column: 33, scope: !2393)
!2659 = !DILocation(line: 265, column: 25, scope: !2393)
!2660 = !DILocation(line: 266, column: 28, scope: !2393)
!2661 = !DILocation(line: 266, column: 33, scope: !2393)
!2662 = !DILocation(line: 266, column: 25, scope: !2393)
!2663 = !DILocation(line: 267, column: 28, scope: !2393)
!2664 = !DILocation(line: 267, column: 33, scope: !2393)
!2665 = !DILocation(line: 267, column: 25, scope: !2393)
!2666 = !DILocation(line: 269, column: 17, scope: !2393)
!2667 = !DILocation(line: 270, column: 19, scope: !2393)
!2668 = !DILocation(line: 271, column: 17, scope: !2393)
!2669 = !DILocation(line: 272, column: 19, scope: !2393)
!2670 = !DILocation(line: 273, column: 17, scope: !2393)
!2671 = !DILocation(line: 274, column: 19, scope: !2393)
!2672 = !DILocation(line: 275, column: 17, scope: !2393)
!2673 = !DILocation(line: 276, column: 19, scope: !2393)
!2674 = !DILocation(line: 277, column: 17, scope: !2393)
!2675 = !DILocation(line: 278, column: 19, scope: !2393)
!2676 = !DILocation(line: 279, column: 28, scope: !2393)
!2677 = !DILocation(line: 279, column: 33, scope: !2393)
!2678 = !DILocation(line: 279, column: 25, scope: !2393)
!2679 = !DILocation(line: 280, column: 28, scope: !2393)
!2680 = !DILocation(line: 280, column: 33, scope: !2393)
!2681 = !DILocation(line: 280, column: 25, scope: !2393)
!2682 = !DILocation(line: 281, column: 28, scope: !2393)
!2683 = !DILocation(line: 281, column: 33, scope: !2393)
!2684 = !DILocation(line: 281, column: 25, scope: !2393)
!2685 = !DILocation(line: 282, column: 28, scope: !2393)
!2686 = !DILocation(line: 282, column: 33, scope: !2393)
!2687 = !DILocation(line: 282, column: 25, scope: !2393)
!2688 = !DILocation(line: 283, column: 28, scope: !2393)
!2689 = !DILocation(line: 283, column: 33, scope: !2393)
!2690 = !DILocation(line: 283, column: 25, scope: !2393)
!2691 = !DILocation(line: 285, column: 17, scope: !2393)
!2692 = !DILocation(line: 286, column: 19, scope: !2393)
!2693 = !DILocation(line: 287, column: 17, scope: !2393)
!2694 = !DILocation(line: 288, column: 19, scope: !2393)
!2695 = !DILocation(line: 289, column: 17, scope: !2393)
!2696 = !DILocation(line: 290, column: 19, scope: !2393)
!2697 = !DILocation(line: 291, column: 17, scope: !2393)
!2698 = !DILocation(line: 292, column: 19, scope: !2393)
!2699 = !DILocation(line: 293, column: 17, scope: !2393)
!2700 = !DILocation(line: 294, column: 19, scope: !2393)
!2701 = !DILocation(line: 295, column: 28, scope: !2393)
!2702 = !DILocation(line: 295, column: 33, scope: !2393)
!2703 = !DILocation(line: 295, column: 25, scope: !2393)
!2704 = !DILocation(line: 296, column: 28, scope: !2393)
!2705 = !DILocation(line: 296, column: 33, scope: !2393)
!2706 = !DILocation(line: 296, column: 25, scope: !2393)
!2707 = !DILocation(line: 297, column: 28, scope: !2393)
!2708 = !DILocation(line: 297, column: 33, scope: !2393)
!2709 = !DILocation(line: 297, column: 25, scope: !2393)
!2710 = !DILocation(line: 298, column: 28, scope: !2393)
!2711 = !DILocation(line: 298, column: 33, scope: !2393)
!2712 = !DILocation(line: 298, column: 25, scope: !2393)
!2713 = !DILocation(line: 299, column: 28, scope: !2393)
!2714 = !DILocation(line: 299, column: 33, scope: !2393)
!2715 = !DILocation(line: 299, column: 25, scope: !2393)
!2716 = !DILocation(line: 301, column: 17, scope: !2393)
!2717 = !DILocation(line: 302, column: 19, scope: !2393)
!2718 = !DILocation(line: 303, column: 17, scope: !2393)
!2719 = !DILocation(line: 304, column: 19, scope: !2393)
!2720 = !DILocation(line: 305, column: 17, scope: !2393)
!2721 = !DILocation(line: 306, column: 19, scope: !2393)
!2722 = !DILocation(line: 307, column: 17, scope: !2393)
!2723 = !DILocation(line: 308, column: 19, scope: !2393)
!2724 = !DILocation(line: 309, column: 17, scope: !2393)
!2725 = !DILocation(line: 310, column: 19, scope: !2393)
!2726 = !DILocation(line: 311, column: 28, scope: !2393)
!2727 = !DILocation(line: 311, column: 33, scope: !2393)
!2728 = !DILocation(line: 311, column: 25, scope: !2393)
!2729 = !DILocation(line: 312, column: 28, scope: !2393)
!2730 = !DILocation(line: 312, column: 33, scope: !2393)
!2731 = !DILocation(line: 312, column: 25, scope: !2393)
!2732 = !DILocation(line: 313, column: 28, scope: !2393)
!2733 = !DILocation(line: 313, column: 33, scope: !2393)
!2734 = !DILocation(line: 313, column: 25, scope: !2393)
!2735 = !DILocation(line: 314, column: 28, scope: !2393)
!2736 = !DILocation(line: 314, column: 33, scope: !2393)
!2737 = !DILocation(line: 314, column: 25, scope: !2393)
!2738 = !DILocation(line: 315, column: 28, scope: !2393)
!2739 = !DILocation(line: 315, column: 33, scope: !2393)
!2740 = !DILocation(line: 315, column: 25, scope: !2393)
!2741 = !DILocation(line: 316, column: 9, scope: !2393)
!2742 = !DILocation(line: 126, column: 47, scope: !2390)
!2743 = !DILocation(line: 126, column: 9, scope: !2390)
!2744 = distinct !{!2744, !2391, !2745, !132}
!2745 = !DILocation(line: 316, column: 9, scope: !2387)
!2746 = !DILocation(line: 319, column: 9, scope: !2332)
!2747 = !DILocation(line: 319, column: 19, scope: !2332)
!2748 = !DILocation(line: 320, column: 9, scope: !2332)
!2749 = !DILocation(line: 320, column: 19, scope: !2332)
!2750 = !DILocation(line: 321, column: 9, scope: !2332)
!2751 = !DILocation(line: 321, column: 19, scope: !2332)
!2752 = !DILocation(line: 322, column: 9, scope: !2332)
!2753 = !DILocation(line: 322, column: 19, scope: !2332)
!2754 = !DILocation(line: 323, column: 9, scope: !2332)
!2755 = !DILocation(line: 323, column: 19, scope: !2332)
!2756 = !DILocation(line: 324, column: 9, scope: !2332)
!2757 = !DILocation(line: 324, column: 19, scope: !2332)
!2758 = !DILocation(line: 325, column: 9, scope: !2332)
!2759 = !DILocation(line: 325, column: 19, scope: !2332)
!2760 = !DILocation(line: 326, column: 9, scope: !2332)
!2761 = !DILocation(line: 326, column: 19, scope: !2332)
!2762 = !DILocation(line: 327, column: 9, scope: !2332)
!2763 = !DILocation(line: 327, column: 19, scope: !2332)
!2764 = !DILocation(line: 328, column: 9, scope: !2332)
!2765 = !DILocation(line: 328, column: 19, scope: !2332)
!2766 = !DILocation(line: 329, column: 9, scope: !2332)
!2767 = !DILocation(line: 329, column: 19, scope: !2332)
!2768 = !DILocation(line: 330, column: 9, scope: !2332)
!2769 = !DILocation(line: 330, column: 19, scope: !2332)
!2770 = !DILocation(line: 331, column: 9, scope: !2332)
!2771 = !DILocation(line: 331, column: 19, scope: !2332)
!2772 = !DILocation(line: 332, column: 9, scope: !2332)
!2773 = !DILocation(line: 332, column: 19, scope: !2332)
!2774 = !DILocation(line: 333, column: 9, scope: !2332)
!2775 = !DILocation(line: 333, column: 19, scope: !2332)
!2776 = !DILocation(line: 334, column: 9, scope: !2332)
!2777 = !DILocation(line: 334, column: 19, scope: !2332)
!2778 = !DILocation(line: 335, column: 9, scope: !2332)
!2779 = !DILocation(line: 335, column: 19, scope: !2332)
!2780 = !DILocation(line: 336, column: 9, scope: !2332)
!2781 = !DILocation(line: 336, column: 19, scope: !2332)
!2782 = !DILocation(line: 337, column: 9, scope: !2332)
!2783 = !DILocation(line: 337, column: 19, scope: !2332)
!2784 = !DILocation(line: 338, column: 9, scope: !2332)
!2785 = !DILocation(line: 338, column: 19, scope: !2332)
!2786 = !DILocation(line: 339, column: 9, scope: !2332)
!2787 = !DILocation(line: 339, column: 19, scope: !2332)
!2788 = !DILocation(line: 340, column: 9, scope: !2332)
!2789 = !DILocation(line: 340, column: 19, scope: !2332)
!2790 = !DILocation(line: 341, column: 9, scope: !2332)
!2791 = !DILocation(line: 341, column: 19, scope: !2332)
!2792 = !DILocation(line: 342, column: 9, scope: !2332)
!2793 = !DILocation(line: 342, column: 19, scope: !2332)
!2794 = !DILocation(line: 343, column: 9, scope: !2332)
!2795 = !DILocation(line: 343, column: 19, scope: !2332)
!2796 = !DILocation(line: 344, column: 1, scope: !2332)
!2797 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_finalize", scope: !74, file: !74, line: 550, type: !2223, scopeLine: 551, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2798 = !DILocalVariable(name: "state", arg: 1, scope: !2797, file: !74, line: 550, type: !2225)
!2799 = !DILocation(line: 0, scope: !2797)
!2800 = !DILocation(line: 552, column: 26, scope: !2797)
!2801 = !DILocation(line: 552, column: 19, scope: !2797)
!2802 = !DILocation(line: 552, column: 36, scope: !2797)
!2803 = !DILocation(line: 552, column: 3, scope: !2797)
!2804 = !DILocation(line: 553, column: 10, scope: !2797)
!2805 = !DILocation(line: 553, column: 14, scope: !2797)
!2806 = !DILocation(line: 554, column: 1, scope: !2797)
!2807 = distinct !DISubprogram(name: "keccak_finalize", scope: !74, file: !74, line: 405, type: !2808, scopeLine: 406, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2808 = !DISubroutineType(types: !2809)
!2809 = !{null, !2242, !40, !40, !33}
!2810 = !DILocalVariable(name: "s", arg: 1, scope: !2807, file: !74, line: 405, type: !2242)
!2811 = !DILocation(line: 0, scope: !2807)
!2812 = !DILocalVariable(name: "pos", arg: 2, scope: !2807, file: !74, line: 405, type: !40)
!2813 = !DILocalVariable(name: "r", arg: 3, scope: !2807, file: !74, line: 405, type: !40)
!2814 = !DILocalVariable(name: "p", arg: 4, scope: !2807, file: !74, line: 405, type: !33)
!2815 = !DILocation(line: 407, column: 15, scope: !2807)
!2816 = !DILocation(line: 407, column: 36, scope: !2807)
!2817 = !DILocation(line: 407, column: 31, scope: !2807)
!2818 = !DILocation(line: 407, column: 27, scope: !2807)
!2819 = !DILocation(line: 407, column: 8, scope: !2807)
!2820 = !DILocation(line: 407, column: 3, scope: !2807)
!2821 = !DILocation(line: 407, column: 12, scope: !2807)
!2822 = !DILocation(line: 408, column: 6, scope: !2807)
!2823 = !DILocation(line: 408, column: 8, scope: !2807)
!2824 = !DILocation(line: 408, column: 3, scope: !2807)
!2825 = !DILocation(line: 408, column: 12, scope: !2807)
!2826 = !DILocation(line: 409, column: 1, scope: !2807)
!2827 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeeze", scope: !74, file: !74, line: 566, type: !2828, scopeLine: 567, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2828 = !DISubroutineType(types: !2829)
!2829 = !{null, !32, !38, !2225}
!2830 = !DILocalVariable(name: "out", arg: 1, scope: !2827, file: !74, line: 566, type: !32)
!2831 = !DILocation(line: 0, scope: !2827)
!2832 = !DILocalVariable(name: "outlen", arg: 2, scope: !2827, file: !74, line: 566, type: !38)
!2833 = !DILocalVariable(name: "state", arg: 3, scope: !2827, file: !74, line: 566, type: !2225)
!2834 = !DILocation(line: 568, column: 51, scope: !2827)
!2835 = !DILocation(line: 568, column: 44, scope: !2827)
!2836 = !DILocation(line: 568, column: 61, scope: !2827)
!2837 = !DILocation(line: 568, column: 16, scope: !2827)
!2838 = !DILocation(line: 568, column: 10, scope: !2827)
!2839 = !DILocation(line: 568, column: 14, scope: !2827)
!2840 = !DILocation(line: 569, column: 1, scope: !2827)
!2841 = distinct !DISubprogram(name: "keccak_squeeze", scope: !74, file: !74, line: 426, type: !2842, scopeLine: 431, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2842 = !DISubroutineType(types: !2843)
!2843 = !{!40, !32, !38, !2242, !40, !40}
!2844 = !DILocalVariable(name: "out", arg: 1, scope: !2841, file: !74, line: 426, type: !32)
!2845 = !DILocation(line: 0, scope: !2841)
!2846 = !DILocalVariable(name: "outlen", arg: 2, scope: !2841, file: !74, line: 427, type: !38)
!2847 = !DILocalVariable(name: "s", arg: 3, scope: !2841, file: !74, line: 428, type: !2242)
!2848 = !DILocalVariable(name: "pos", arg: 4, scope: !2841, file: !74, line: 429, type: !40)
!2849 = !DILocalVariable(name: "r", arg: 5, scope: !2841, file: !74, line: 430, type: !40)
!2850 = !DILocation(line: 434, column: 3, scope: !2841)
!2851 = !DILocation(line: 435, column: 12, scope: !2852)
!2852 = distinct !DILexicalBlock(scope: !2853, file: !74, line: 435, column: 8)
!2853 = distinct !DILexicalBlock(scope: !2841, file: !74, line: 434, column: 17)
!2854 = !DILocation(line: 436, column: 7, scope: !2855)
!2855 = distinct !DILexicalBlock(scope: !2852, file: !74, line: 435, column: 18)
!2856 = !DILocation(line: 438, column: 5, scope: !2855)
!2857 = !DILocalVariable(name: "i", scope: !2841, file: !74, line: 432, type: !40)
!2858 = !DILocation(line: 439, column: 9, scope: !2859)
!2859 = distinct !DILexicalBlock(scope: !2853, file: !74, line: 439, column: 5)
!2860 = !DILocation(line: 439, scope: !2859)
!2861 = !DILocation(line: 439, column: 17, scope: !2862)
!2862 = distinct !DILexicalBlock(scope: !2859, file: !74, line: 439, column: 5)
!2863 = !DILocation(line: 439, column: 21, scope: !2862)
!2864 = !DILocation(line: 439, column: 31, scope: !2862)
!2865 = !DILocation(line: 439, column: 26, scope: !2862)
!2866 = !DILocation(line: 0, scope: !2862)
!2867 = !DILocation(line: 439, column: 5, scope: !2859)
!2868 = !DILocation(line: 440, column: 19, scope: !2862)
!2869 = !DILocation(line: 440, column: 16, scope: !2862)
!2870 = !DILocation(line: 440, column: 30, scope: !2862)
!2871 = !DILocation(line: 440, column: 27, scope: !2862)
!2872 = !DILocation(line: 440, column: 23, scope: !2862)
!2873 = !DILocation(line: 440, column: 11, scope: !2862)
!2874 = !DILocation(line: 440, column: 14, scope: !2862)
!2875 = !DILocation(line: 440, column: 7, scope: !2862)
!2876 = !DILocation(line: 439, column: 41, scope: !2862)
!2877 = !DILocation(line: 439, column: 5, scope: !2862)
!2878 = distinct !{!2878, !2867, !2879, !132}
!2879 = !DILocation(line: 440, column: 32, scope: !2859)
!2880 = !DILocation(line: 441, column: 16, scope: !2853)
!2881 = !DILocation(line: 441, column: 12, scope: !2853)
!2882 = distinct !{!2882, !2850, !2883, !132}
!2883 = !DILocation(line: 443, column: 3, scope: !2841)
!2884 = !DILocation(line: 445, column: 3, scope: !2841)
!2885 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_absorb_once", scope: !74, file: !74, line: 580, type: !2260, scopeLine: 581, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2886 = !DILocalVariable(name: "state", arg: 1, scope: !2885, file: !74, line: 580, type: !2225)
!2887 = !DILocation(line: 0, scope: !2885)
!2888 = !DILocalVariable(name: "in", arg: 2, scope: !2885, file: !74, line: 580, type: !318)
!2889 = !DILocalVariable(name: "inlen", arg: 3, scope: !2885, file: !74, line: 580, type: !38)
!2890 = !DILocation(line: 582, column: 29, scope: !2885)
!2891 = !DILocation(line: 582, column: 22, scope: !2885)
!2892 = !DILocation(line: 582, column: 3, scope: !2885)
!2893 = !DILocation(line: 583, column: 10, scope: !2885)
!2894 = !DILocation(line: 583, column: 14, scope: !2885)
!2895 = !DILocation(line: 584, column: 1, scope: !2885)
!2896 = distinct !DISubprogram(name: "keccak_absorb_once", scope: !74, file: !74, line: 461, type: !2897, scopeLine: 466, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2897 = !DISubroutineType(types: !2898)
!2898 = !{null, !2242, !40, !318, !38, !33}
!2899 = !DILocalVariable(name: "s", arg: 1, scope: !2896, file: !74, line: 461, type: !2242)
!2900 = !DILocation(line: 0, scope: !2896)
!2901 = !DILocalVariable(name: "r", arg: 2, scope: !2896, file: !74, line: 462, type: !40)
!2902 = !DILocalVariable(name: "in", arg: 3, scope: !2896, file: !74, line: 463, type: !318)
!2903 = !DILocalVariable(name: "inlen", arg: 4, scope: !2896, file: !74, line: 464, type: !38)
!2904 = !DILocalVariable(name: "p", arg: 5, scope: !2896, file: !74, line: 465, type: !33)
!2905 = !DILocalVariable(name: "i", scope: !2896, file: !74, line: 467, type: !40)
!2906 = !DILocation(line: 469, column: 7, scope: !2907)
!2907 = distinct !DILexicalBlock(scope: !2896, file: !74, line: 469, column: 3)
!2908 = !DILocation(line: 469, scope: !2907)
!2909 = !DILocation(line: 469, column: 12, scope: !2910)
!2910 = distinct !DILexicalBlock(scope: !2907, file: !74, line: 469, column: 3)
!2911 = !DILocation(line: 469, column: 3, scope: !2907)
!2912 = !DILocation(line: 470, column: 5, scope: !2910)
!2913 = !DILocation(line: 470, column: 10, scope: !2910)
!2914 = !DILocation(line: 469, column: 17, scope: !2910)
!2915 = !DILocation(line: 469, column: 3, scope: !2910)
!2916 = distinct !{!2916, !2911, !2917, !132}
!2917 = !DILocation(line: 470, column: 12, scope: !2907)
!2918 = !DILocation(line: 472, column: 3, scope: !2896)
!2919 = !DILocation(line: 472, column: 15, scope: !2896)
!2920 = !DILocation(line: 473, column: 9, scope: !2921)
!2921 = distinct !DILexicalBlock(scope: !2922, file: !74, line: 473, column: 5)
!2922 = distinct !DILexicalBlock(scope: !2896, file: !74, line: 472, column: 21)
!2923 = !DILocation(line: 473, scope: !2921)
!2924 = !DILocation(line: 473, column: 16, scope: !2925)
!2925 = distinct !DILexicalBlock(scope: !2921, file: !74, line: 473, column: 5)
!2926 = !DILocation(line: 473, column: 14, scope: !2925)
!2927 = !DILocation(line: 473, column: 5, scope: !2921)
!2928 = !DILocation(line: 474, column: 26, scope: !2925)
!2929 = !DILocation(line: 474, column: 24, scope: !2925)
!2930 = !DILocation(line: 474, column: 15, scope: !2925)
!2931 = !DILocation(line: 474, column: 7, scope: !2925)
!2932 = !DILocation(line: 474, column: 12, scope: !2925)
!2933 = !DILocation(line: 473, column: 20, scope: !2925)
!2934 = !DILocation(line: 473, column: 5, scope: !2925)
!2935 = distinct !{!2935, !2927, !2936, !132}
!2936 = !DILocation(line: 474, column: 28, scope: !2921)
!2937 = !DILocation(line: 475, column: 8, scope: !2922)
!2938 = !DILocation(line: 476, column: 11, scope: !2922)
!2939 = !DILocation(line: 477, column: 5, scope: !2922)
!2940 = distinct !{!2940, !2918, !2941, !132}
!2941 = !DILocation(line: 478, column: 3, scope: !2896)
!2942 = !DILocation(line: 480, column: 7, scope: !2943)
!2943 = distinct !DILexicalBlock(scope: !2896, file: !74, line: 480, column: 3)
!2944 = !DILocation(line: 480, scope: !2943)
!2945 = !DILocation(line: 480, column: 12, scope: !2946)
!2946 = distinct !DILexicalBlock(scope: !2943, file: !74, line: 480, column: 3)
!2947 = !DILocation(line: 480, column: 3, scope: !2943)
!2948 = !DILocation(line: 481, column: 25, scope: !2946)
!2949 = !DILocation(line: 481, column: 15, scope: !2946)
!2950 = !DILocation(line: 481, column: 38, scope: !2946)
!2951 = !DILocation(line: 481, column: 35, scope: !2946)
!2952 = !DILocation(line: 481, column: 31, scope: !2946)
!2953 = !DILocation(line: 481, column: 8, scope: !2946)
!2954 = !DILocation(line: 481, column: 5, scope: !2946)
!2955 = !DILocation(line: 481, column: 12, scope: !2946)
!2956 = !DILocation(line: 480, column: 20, scope: !2946)
!2957 = !DILocation(line: 480, column: 3, scope: !2946)
!2958 = distinct !{!2958, !2947, !2959, !132}
!2959 = !DILocation(line: 481, column: 40, scope: !2943)
!2960 = !DILocation(line: 483, column: 13, scope: !2896)
!2961 = !DILocation(line: 483, column: 32, scope: !2896)
!2962 = !DILocation(line: 483, column: 29, scope: !2896)
!2963 = !DILocation(line: 483, column: 25, scope: !2896)
!2964 = !DILocation(line: 483, column: 6, scope: !2896)
!2965 = !DILocation(line: 483, column: 3, scope: !2896)
!2966 = !DILocation(line: 483, column: 10, scope: !2896)
!2967 = !DILocation(line: 484, column: 7, scope: !2896)
!2968 = !DILocation(line: 484, column: 10, scope: !2896)
!2969 = !DILocation(line: 484, column: 3, scope: !2896)
!2970 = !DILocation(line: 484, column: 14, scope: !2896)
!2971 = !DILocation(line: 485, column: 1, scope: !2896)
!2972 = distinct !DISubprogram(name: "load64", scope: !74, file: !74, line: 22, type: !2973, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2973 = !DISubroutineType(types: !2974)
!2974 = !{!70, !318}
!2975 = !DILocalVariable(name: "x", arg: 1, scope: !2972, file: !74, line: 22, type: !318)
!2976 = !DILocation(line: 0, scope: !2972)
!2977 = !DILocalVariable(name: "r", scope: !2972, file: !74, line: 24, type: !70)
!2978 = !DILocalVariable(name: "i", scope: !2972, file: !74, line: 23, type: !40)
!2979 = !DILocation(line: 26, column: 7, scope: !2980)
!2980 = distinct !DILexicalBlock(scope: !2972, file: !74, line: 26, column: 3)
!2981 = !DILocation(line: 26, scope: !2980)
!2982 = !DILocation(line: 26, column: 12, scope: !2983)
!2983 = distinct !DILexicalBlock(scope: !2980, file: !74, line: 26, column: 3)
!2984 = !DILocation(line: 26, column: 3, scope: !2980)
!2985 = !DILocation(line: 27, column: 20, scope: !2983)
!2986 = !DILocation(line: 27, column: 10, scope: !2983)
!2987 = !DILocation(line: 27, column: 29, scope: !2983)
!2988 = !DILocation(line: 27, column: 25, scope: !2983)
!2989 = !DILocation(line: 27, column: 7, scope: !2983)
!2990 = !DILocation(line: 27, column: 5, scope: !2983)
!2991 = !DILocation(line: 26, column: 16, scope: !2983)
!2992 = !DILocation(line: 26, column: 3, scope: !2983)
!2993 = distinct !{!2993, !2984, !2994, !132}
!2994 = !DILocation(line: 27, column: 30, scope: !2980)
!2995 = !DILocation(line: 29, column: 3, scope: !2972)
!2996 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128_squeezeblocks", scope: !74, file: !74, line: 598, type: !2828, scopeLine: 599, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!2997 = !DILocalVariable(name: "out", arg: 1, scope: !2996, file: !74, line: 598, type: !32)
!2998 = !DILocation(line: 0, scope: !2996)
!2999 = !DILocalVariable(name: "nblocks", arg: 2, scope: !2996, file: !74, line: 598, type: !38)
!3000 = !DILocalVariable(name: "state", arg: 3, scope: !2996, file: !74, line: 598, type: !2225)
!3001 = !DILocation(line: 600, column: 45, scope: !2996)
!3002 = !DILocation(line: 600, column: 38, scope: !2996)
!3003 = !DILocation(line: 600, column: 3, scope: !2996)
!3004 = !DILocation(line: 601, column: 1, scope: !2996)
!3005 = distinct !DISubprogram(name: "keccak_squeezeblocks", scope: !74, file: !74, line: 500, type: !3006, scopeLine: 504, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3006 = !DISubroutineType(types: !3007)
!3007 = !{null, !32, !38, !2242, !40}
!3008 = !DILocalVariable(name: "out", arg: 1, scope: !3005, file: !74, line: 500, type: !32)
!3009 = !DILocation(line: 0, scope: !3005)
!3010 = !DILocalVariable(name: "nblocks", arg: 2, scope: !3005, file: !74, line: 501, type: !38)
!3011 = !DILocalVariable(name: "s", arg: 3, scope: !3005, file: !74, line: 502, type: !2242)
!3012 = !DILocalVariable(name: "r", arg: 4, scope: !3005, file: !74, line: 503, type: !40)
!3013 = !DILocation(line: 507, column: 3, scope: !3005)
!3014 = !DILocation(line: 508, column: 5, scope: !3015)
!3015 = distinct !DILexicalBlock(scope: !3005, file: !74, line: 507, column: 18)
!3016 = !DILocalVariable(name: "i", scope: !3005, file: !74, line: 505, type: !40)
!3017 = !DILocation(line: 509, column: 9, scope: !3018)
!3018 = distinct !DILexicalBlock(scope: !3015, file: !74, line: 509, column: 5)
!3019 = !DILocation(line: 509, scope: !3018)
!3020 = !DILocation(line: 509, column: 16, scope: !3021)
!3021 = distinct !DILexicalBlock(scope: !3018, file: !74, line: 509, column: 5)
!3022 = !DILocation(line: 509, column: 14, scope: !3021)
!3023 = !DILocation(line: 509, column: 5, scope: !3018)
!3024 = !DILocation(line: 510, column: 20, scope: !3021)
!3025 = !DILocation(line: 510, column: 18, scope: !3021)
!3026 = !DILocation(line: 510, column: 24, scope: !3021)
!3027 = !DILocation(line: 510, column: 7, scope: !3021)
!3028 = !DILocation(line: 509, column: 20, scope: !3021)
!3029 = !DILocation(line: 509, column: 5, scope: !3021)
!3030 = distinct !{!3030, !3023, !3031, !132}
!3031 = !DILocation(line: 510, column: 28, scope: !3018)
!3032 = !DILocation(line: 511, column: 9, scope: !3015)
!3033 = !DILocation(line: 512, column: 13, scope: !3015)
!3034 = distinct !{!3034, !3013, !3035, !132}
!3035 = !DILocation(line: 513, column: 3, scope: !3005)
!3036 = !DILocation(line: 514, column: 1, scope: !3005)
!3037 = distinct !DISubprogram(name: "store64", scope: !74, file: !74, line: 40, type: !3038, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3038 = !DISubroutineType(types: !3039)
!3039 = !{null, !32, !70}
!3040 = !DILocalVariable(name: "x", arg: 1, scope: !3037, file: !74, line: 40, type: !32)
!3041 = !DILocation(line: 0, scope: !3037)
!3042 = !DILocalVariable(name: "u", arg: 2, scope: !3037, file: !74, line: 40, type: !70)
!3043 = !DILocalVariable(name: "i", scope: !3037, file: !74, line: 41, type: !40)
!3044 = !DILocation(line: 43, column: 7, scope: !3045)
!3045 = distinct !DILexicalBlock(scope: !3037, file: !74, line: 43, column: 3)
!3046 = !DILocation(line: 43, scope: !3045)
!3047 = !DILocation(line: 43, column: 12, scope: !3048)
!3048 = distinct !DILexicalBlock(scope: !3045, file: !74, line: 43, column: 3)
!3049 = !DILocation(line: 43, column: 3, scope: !3045)
!3050 = !DILocation(line: 44, column: 18, scope: !3048)
!3051 = !DILocation(line: 44, column: 14, scope: !3048)
!3052 = !DILocation(line: 44, column: 12, scope: !3048)
!3053 = !DILocation(line: 44, column: 5, scope: !3048)
!3054 = !DILocation(line: 44, column: 10, scope: !3048)
!3055 = !DILocation(line: 43, column: 16, scope: !3048)
!3056 = !DILocation(line: 43, column: 3, scope: !3048)
!3057 = distinct !{!3057, !3049, !3058, !132}
!3058 = !DILocation(line: 44, column: 19, scope: !3045)
!3059 = !DILocation(line: 45, column: 1, scope: !3037)
!3060 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_init", scope: !74, file: !74, line: 610, type: !2223, scopeLine: 611, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3061 = !DILocalVariable(name: "state", arg: 1, scope: !3060, file: !74, line: 610, type: !2225)
!3062 = !DILocation(line: 0, scope: !3060)
!3063 = !DILocation(line: 612, column: 22, scope: !3060)
!3064 = !DILocation(line: 612, column: 15, scope: !3060)
!3065 = !DILocation(line: 612, column: 3, scope: !3060)
!3066 = !DILocation(line: 613, column: 10, scope: !3060)
!3067 = !DILocation(line: 613, column: 14, scope: !3060)
!3068 = !DILocation(line: 614, column: 1, scope: !3060)
!3069 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb", scope: !74, file: !74, line: 625, type: !2260, scopeLine: 626, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3070 = !DILocalVariable(name: "state", arg: 1, scope: !3069, file: !74, line: 625, type: !2225)
!3071 = !DILocation(line: 0, scope: !3069)
!3072 = !DILocalVariable(name: "in", arg: 2, scope: !3069, file: !74, line: 625, type: !318)
!3073 = !DILocalVariable(name: "inlen", arg: 3, scope: !3069, file: !74, line: 625, type: !38)
!3074 = !DILocation(line: 627, column: 37, scope: !3069)
!3075 = !DILocation(line: 627, column: 30, scope: !3069)
!3076 = !DILocation(line: 627, column: 47, scope: !3069)
!3077 = !DILocation(line: 627, column: 16, scope: !3069)
!3078 = !DILocation(line: 627, column: 10, scope: !3069)
!3079 = !DILocation(line: 627, column: 14, scope: !3069)
!3080 = !DILocation(line: 628, column: 1, scope: !3069)
!3081 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_finalize", scope: !74, file: !74, line: 637, type: !2223, scopeLine: 638, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3082 = !DILocalVariable(name: "state", arg: 1, scope: !3081, file: !74, line: 637, type: !2225)
!3083 = !DILocation(line: 0, scope: !3081)
!3084 = !DILocation(line: 639, column: 26, scope: !3081)
!3085 = !DILocation(line: 639, column: 19, scope: !3081)
!3086 = !DILocation(line: 639, column: 36, scope: !3081)
!3087 = !DILocation(line: 639, column: 3, scope: !3081)
!3088 = !DILocation(line: 640, column: 10, scope: !3081)
!3089 = !DILocation(line: 640, column: 14, scope: !3081)
!3090 = !DILocation(line: 641, column: 1, scope: !3081)
!3091 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeeze", scope: !74, file: !74, line: 653, type: !2828, scopeLine: 654, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3092 = !DILocalVariable(name: "out", arg: 1, scope: !3091, file: !74, line: 653, type: !32)
!3093 = !DILocation(line: 0, scope: !3091)
!3094 = !DILocalVariable(name: "outlen", arg: 2, scope: !3091, file: !74, line: 653, type: !38)
!3095 = !DILocalVariable(name: "state", arg: 3, scope: !3091, file: !74, line: 653, type: !2225)
!3096 = !DILocation(line: 655, column: 51, scope: !3091)
!3097 = !DILocation(line: 655, column: 44, scope: !3091)
!3098 = !DILocation(line: 655, column: 61, scope: !3091)
!3099 = !DILocation(line: 655, column: 16, scope: !3091)
!3100 = !DILocation(line: 655, column: 10, scope: !3091)
!3101 = !DILocation(line: 655, column: 14, scope: !3091)
!3102 = !DILocation(line: 656, column: 1, scope: !3091)
!3103 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_absorb_once", scope: !74, file: !74, line: 667, type: !2260, scopeLine: 668, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3104 = !DILocalVariable(name: "state", arg: 1, scope: !3103, file: !74, line: 667, type: !2225)
!3105 = !DILocation(line: 0, scope: !3103)
!3106 = !DILocalVariable(name: "in", arg: 2, scope: !3103, file: !74, line: 667, type: !318)
!3107 = !DILocalVariable(name: "inlen", arg: 3, scope: !3103, file: !74, line: 667, type: !38)
!3108 = !DILocation(line: 669, column: 29, scope: !3103)
!3109 = !DILocation(line: 669, column: 22, scope: !3103)
!3110 = !DILocation(line: 669, column: 3, scope: !3103)
!3111 = !DILocation(line: 670, column: 10, scope: !3103)
!3112 = !DILocation(line: 670, column: 14, scope: !3103)
!3113 = !DILocation(line: 671, column: 1, scope: !3103)
!3114 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256_squeezeblocks", scope: !74, file: !74, line: 685, type: !2828, scopeLine: 686, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3115 = !DILocalVariable(name: "out", arg: 1, scope: !3114, file: !74, line: 685, type: !32)
!3116 = !DILocation(line: 0, scope: !3114)
!3117 = !DILocalVariable(name: "nblocks", arg: 2, scope: !3114, file: !74, line: 685, type: !38)
!3118 = !DILocalVariable(name: "state", arg: 3, scope: !3114, file: !74, line: 685, type: !2225)
!3119 = !DILocation(line: 687, column: 45, scope: !3114)
!3120 = !DILocation(line: 687, column: 38, scope: !3114)
!3121 = !DILocation(line: 687, column: 3, scope: !3114)
!3122 = !DILocation(line: 688, column: 1, scope: !3114)
!3123 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake128", scope: !74, file: !74, line: 700, type: !3124, scopeLine: 701, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3124 = !DISubroutineType(types: !3125)
!3125 = !{null, !32, !38, !318, !38}
!3126 = !DILocalVariable(name: "out", arg: 1, scope: !3123, file: !74, line: 700, type: !32)
!3127 = !DILocation(line: 0, scope: !3123)
!3128 = !DILocalVariable(name: "outlen", arg: 2, scope: !3123, file: !74, line: 700, type: !38)
!3129 = !DILocalVariable(name: "in", arg: 3, scope: !3123, file: !74, line: 700, type: !318)
!3130 = !DILocalVariable(name: "inlen", arg: 4, scope: !3123, file: !74, line: 700, type: !38)
!3131 = !DILocalVariable(name: "state", scope: !3123, file: !74, line: 703, type: !2226)
!3132 = !DILocation(line: 703, column: 16, scope: !3123)
!3133 = !DILocation(line: 705, column: 3, scope: !3123)
!3134 = !DILocation(line: 706, column: 19, scope: !3123)
!3135 = !DILocalVariable(name: "nblocks", scope: !3123, file: !74, line: 702, type: !38)
!3136 = !DILocation(line: 707, column: 3, scope: !3123)
!3137 = !DILocation(line: 708, column: 20, scope: !3123)
!3138 = !DILocation(line: 708, column: 10, scope: !3123)
!3139 = !DILocation(line: 709, column: 17, scope: !3123)
!3140 = !DILocation(line: 709, column: 7, scope: !3123)
!3141 = !DILocation(line: 710, column: 3, scope: !3123)
!3142 = !DILocation(line: 711, column: 1, scope: !3123)
!3143 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_shake256", scope: !74, file: !74, line: 723, type: !3124, scopeLine: 724, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3144 = !DILocalVariable(name: "out", arg: 1, scope: !3143, file: !74, line: 723, type: !32)
!3145 = !DILocation(line: 0, scope: !3143)
!3146 = !DILocalVariable(name: "outlen", arg: 2, scope: !3143, file: !74, line: 723, type: !38)
!3147 = !DILocalVariable(name: "in", arg: 3, scope: !3143, file: !74, line: 723, type: !318)
!3148 = !DILocalVariable(name: "inlen", arg: 4, scope: !3143, file: !74, line: 723, type: !38)
!3149 = !DILocalVariable(name: "state", scope: !3143, file: !74, line: 726, type: !2226)
!3150 = !DILocation(line: 726, column: 16, scope: !3143)
!3151 = !DILocation(line: 728, column: 3, scope: !3143)
!3152 = !DILocation(line: 729, column: 19, scope: !3143)
!3153 = !DILocalVariable(name: "nblocks", scope: !3143, file: !74, line: 725, type: !38)
!3154 = !DILocation(line: 730, column: 3, scope: !3143)
!3155 = !DILocation(line: 731, column: 20, scope: !3143)
!3156 = !DILocation(line: 731, column: 10, scope: !3143)
!3157 = !DILocation(line: 732, column: 17, scope: !3143)
!3158 = !DILocation(line: 732, column: 7, scope: !3143)
!3159 = !DILocation(line: 733, column: 3, scope: !3143)
!3160 = !DILocation(line: 734, column: 1, scope: !3143)
!3161 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_256", scope: !74, file: !74, line: 745, type: !3162, scopeLine: 746, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3162 = !DISubroutineType(types: !3163)
!3163 = !{null, !32, !318, !38}
!3164 = !DILocalVariable(name: "h", arg: 1, scope: !3161, file: !74, line: 745, type: !32)
!3165 = !DILocation(line: 0, scope: !3161)
!3166 = !DILocalVariable(name: "in", arg: 2, scope: !3161, file: !74, line: 745, type: !318)
!3167 = !DILocalVariable(name: "inlen", arg: 3, scope: !3161, file: !74, line: 745, type: !38)
!3168 = !DILocalVariable(name: "s", scope: !3161, file: !74, line: 748, type: !458)
!3169 = !DILocation(line: 748, column: 12, scope: !3161)
!3170 = !DILocation(line: 750, column: 22, scope: !3161)
!3171 = !DILocation(line: 750, column: 3, scope: !3161)
!3172 = !DILocation(line: 751, column: 28, scope: !3161)
!3173 = !DILocation(line: 751, column: 3, scope: !3161)
!3174 = !DILocalVariable(name: "i", scope: !3161, file: !74, line: 747, type: !40)
!3175 = !DILocation(line: 752, column: 7, scope: !3176)
!3176 = distinct !DILexicalBlock(scope: !3161, file: !74, line: 752, column: 3)
!3177 = !DILocation(line: 752, scope: !3176)
!3178 = !DILocation(line: 752, column: 12, scope: !3179)
!3179 = distinct !DILexicalBlock(scope: !3176, file: !74, line: 752, column: 3)
!3180 = !DILocation(line: 752, column: 3, scope: !3176)
!3181 = !DILocation(line: 753, column: 16, scope: !3179)
!3182 = !DILocation(line: 753, column: 14, scope: !3179)
!3183 = !DILocation(line: 753, column: 19, scope: !3179)
!3184 = !DILocation(line: 753, column: 5, scope: !3179)
!3185 = !DILocation(line: 752, column: 16, scope: !3179)
!3186 = !DILocation(line: 752, column: 3, scope: !3179)
!3187 = distinct !{!3187, !3180, !3188, !132}
!3188 = !DILocation(line: 753, column: 23, scope: !3176)
!3189 = !DILocation(line: 754, column: 1, scope: !3161)
!3190 = distinct !DISubprogram(name: "pqcrystals_kyber_fips202_ref_sha3_512", scope: !74, file: !74, line: 765, type: !3162, scopeLine: 766, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !68, retainedNodes: !49)
!3191 = !DILocalVariable(name: "h", arg: 1, scope: !3190, file: !74, line: 765, type: !32)
!3192 = !DILocation(line: 0, scope: !3190)
!3193 = !DILocalVariable(name: "in", arg: 2, scope: !3190, file: !74, line: 765, type: !318)
!3194 = !DILocalVariable(name: "inlen", arg: 3, scope: !3190, file: !74, line: 765, type: !38)
!3195 = !DILocalVariable(name: "s", scope: !3190, file: !74, line: 768, type: !458)
!3196 = !DILocation(line: 768, column: 12, scope: !3190)
!3197 = !DILocation(line: 770, column: 22, scope: !3190)
!3198 = !DILocation(line: 770, column: 3, scope: !3190)
!3199 = !DILocation(line: 771, column: 28, scope: !3190)
!3200 = !DILocation(line: 771, column: 3, scope: !3190)
!3201 = !DILocalVariable(name: "i", scope: !3190, file: !74, line: 767, type: !40)
!3202 = !DILocation(line: 772, column: 7, scope: !3203)
!3203 = distinct !DILexicalBlock(scope: !3190, file: !74, line: 772, column: 3)
!3204 = !DILocation(line: 772, scope: !3203)
!3205 = !DILocation(line: 772, column: 12, scope: !3206)
!3206 = distinct !DILexicalBlock(scope: !3203, file: !74, line: 772, column: 3)
!3207 = !DILocation(line: 772, column: 3, scope: !3203)
!3208 = !DILocation(line: 773, column: 16, scope: !3206)
!3209 = !DILocation(line: 773, column: 14, scope: !3206)
!3210 = !DILocation(line: 773, column: 19, scope: !3206)
!3211 = !DILocation(line: 773, column: 5, scope: !3206)
!3212 = !DILocation(line: 772, column: 16, scope: !3206)
!3213 = !DILocation(line: 772, column: 3, scope: !3206)
!3214 = distinct !{!3214, !3207, !3215, !132}
!3215 = !DILocation(line: 773, column: 23, scope: !3203)
!3216 = !DILocation(line: 774, column: 1, scope: !3190)
!3217 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_kyber_shake128_absorb", scope: !3218, file: !3218, line: 18, type: !3219, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !100, retainedNodes: !49)
!3218 = !DIFile(filename: "../../ref/symmetric-shake.c", directory: "/home/siddhesh/Desktop/Kyber-LLVM/llvm-ir/build")
!3219 = !DISubroutineType(types: !3220)
!3220 = !{null, !3221, !318, !33, !33}
!3221 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3222, size: 32)
!3222 = !DIDerivedType(tag: DW_TAG_typedef, name: "keccak_state", file: !454, line: 17, baseType: !3223)
!3223 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !454, line: 14, size: 1664, elements: !3224)
!3224 = !{!3225, !3226}
!3225 = !DIDerivedType(tag: DW_TAG_member, name: "s", scope: !3223, file: !454, line: 15, baseType: !458, size: 1600)
!3226 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !3223, file: !454, line: 16, baseType: !40, size: 32, offset: 1600)
!3227 = !DILocalVariable(name: "state", arg: 1, scope: !3217, file: !3218, line: 18, type: !3221)
!3228 = !DILocation(line: 0, scope: !3217)
!3229 = !DILocalVariable(name: "seed", arg: 2, scope: !3217, file: !3218, line: 19, type: !318)
!3230 = !DILocalVariable(name: "x", arg: 3, scope: !3217, file: !3218, line: 20, type: !33)
!3231 = !DILocalVariable(name: "y", arg: 4, scope: !3217, file: !3218, line: 21, type: !33)
!3232 = !DILocalVariable(name: "extseed", scope: !3217, file: !3218, line: 23, type: !3233)
!3233 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 272, elements: !3234)
!3234 = !{!3235}
!3235 = !DISubrange(count: 34)
!3236 = !DILocation(line: 23, column: 11, scope: !3217)
!3237 = !DILocation(line: 25, column: 10, scope: !3217)
!3238 = !DILocation(line: 25, column: 3, scope: !3217)
!3239 = !DILocation(line: 26, column: 3, scope: !3217)
!3240 = !DILocation(line: 26, column: 29, scope: !3217)
!3241 = !DILocation(line: 27, column: 3, scope: !3217)
!3242 = !DILocation(line: 27, column: 29, scope: !3217)
!3243 = !DILocation(line: 29, column: 31, scope: !3217)
!3244 = !DILocation(line: 29, column: 3, scope: !3217)
!3245 = !DILocation(line: 30, column: 1, scope: !3217)
!3246 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_kyber_shake256_prf", scope: !3218, file: !3218, line: 43, type: !3247, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !100, retainedNodes: !49)
!3247 = !DISubroutineType(types: !3248)
!3248 = !{null, !32, !38, !318, !33}
!3249 = !DILocalVariable(name: "out", arg: 1, scope: !3246, file: !3218, line: 43, type: !32)
!3250 = !DILocation(line: 0, scope: !3246)
!3251 = !DILocalVariable(name: "outlen", arg: 2, scope: !3246, file: !3218, line: 43, type: !38)
!3252 = !DILocalVariable(name: "key", arg: 3, scope: !3246, file: !3218, line: 43, type: !318)
!3253 = !DILocalVariable(name: "nonce", arg: 4, scope: !3246, file: !3218, line: 43, type: !33)
!3254 = !DILocalVariable(name: "extkey", scope: !3246, file: !3218, line: 45, type: !3255)
!3255 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 264, elements: !3256)
!3256 = !{!3257}
!3257 = !DISubrange(count: 33)
!3258 = !DILocation(line: 45, column: 11, scope: !3246)
!3259 = !DILocation(line: 47, column: 10, scope: !3246)
!3260 = !DILocation(line: 47, column: 3, scope: !3246)
!3261 = !DILocation(line: 48, column: 3, scope: !3246)
!3262 = !DILocation(line: 48, column: 26, scope: !3246)
!3263 = !DILocation(line: 50, column: 25, scope: !3246)
!3264 = !DILocation(line: 50, column: 3, scope: !3246)
!3265 = !DILocation(line: 51, column: 1, scope: !3246)
!3266 = distinct !DISubprogram(name: "pqcrystals_kyber512_ref_kyber_shake256_rkprf", scope: !3218, file: !3218, line: 64, type: !792, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !100, retainedNodes: !49)
!3267 = !DILocalVariable(name: "out", arg: 1, scope: !3266, file: !3218, line: 64, type: !32)
!3268 = !DILocation(line: 0, scope: !3266)
!3269 = !DILocalVariable(name: "key", arg: 2, scope: !3266, file: !3218, line: 64, type: !318)
!3270 = !DILocalVariable(name: "input", arg: 3, scope: !3266, file: !3218, line: 64, type: !318)
!3271 = !DILocalVariable(name: "s", scope: !3266, file: !3218, line: 66, type: !3222)
!3272 = !DILocation(line: 66, column: 16, scope: !3266)
!3273 = !DILocation(line: 68, column: 3, scope: !3266)
!3274 = !DILocation(line: 69, column: 3, scope: !3266)
!3275 = !DILocation(line: 70, column: 3, scope: !3266)
!3276 = !DILocation(line: 71, column: 3, scope: !3266)
!3277 = !DILocation(line: 72, column: 3, scope: !3266)
!3278 = !DILocation(line: 73, column: 1, scope: !3266)
