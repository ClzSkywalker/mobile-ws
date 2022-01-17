@echo  off
echo=

go build -buildmode=c-shared -o .\bin\windows\libadd.dll .\src\server\main.go
echo "Build libadd.dll success"

SET CGO_ENABLED=0
SET GOOS=linux
SET GOARCH=amd64
go build -buildmode=c-shared -o .\bin\linux\libadd.dll .\src\server\main.go
echo "Build linux libadd.so success"

:set ANDROID_NDK_HOME=$ANDROID_HOME/ndk/21.0.6113669
set GOARCH=arm
set GOOS=android
set CGO_ENABLED=1
set CC=C:\Software\Toolbox\apps\AndroidStudio\Android\Sdk\ndk\21.0.6113669\toolchains\llvm\prebuilt\windows-x86_64\bin\armv7a-linux-androideabi21-clang

go build -buildmode=c-shared -o .\bin\armeabi-v7a\libadd.so .\src\server\main.go
:go build -buildmode=c-shared -o .\backend\bin\armeabi-v7a\libadd.so .\backend\src\server\main.go
echo "Build armeabi-v7a success"

set GOARCH=arm64
set GOOS=android
set CGO_ENABLED=1
set CC=C:\Software\Toolbox\apps\AndroidStudio\Android\Sdk\ndk\21.0.6113669\toolchains\llvm\prebuilt\windows-x86_64\bin\aarch64-linux-android21-clang
go build -buildmode=c-shared -o .\bin\arm64-v8a\libadd.so .\src\server\main.go

echo "Build arm64-v8a success"

pause