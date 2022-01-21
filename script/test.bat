@echo  off
echo=

go build -buildmode=c-shared -o ..\backend\bin\windows\libadd.dll ..\backend\src\test\main.go
echo "Build windows libadd.dll success"


SET CGO_ENABLED=0 
SET GOOS=darwin
SET GOARCH=amd64
go build -buildmode=c-shared -o ..\backend\bin\mac\libadd.dylib ..\backend\src\test\main.go
echo "Build mac libadd.dylib success"

set CGO_ENABLED=0
SET GOOS=linux
SET GOARCH=amd64
go build -buildmode=c-shared -o ..\backend\bin\linux\libadd.so ..\backend\src\test\main.go
echo "Build linux libadd.so success"

:set ANDROID_NDK_HOME=$ANDROID_HOME/ndk/21.0.6113669
set GOARCH=arm
set GOOS=android
set CGO_ENABLED=1
set CC=C:\Software\Toolbox\apps\AndroidStudio\Android\Sdk\ndk\21.0.6113669\toolchains\llvm\prebuilt\windows-x86_64\bin\armv7a-linux-androideabi21-clang

go build -buildmode=c-shared -o ..\backend\bin\armeabi-v7a\libadd.so ..\backend\src\test\main.go
echo "Build android armeabi-v7a.so success"

set GOARCH=arm64
set GOOS=android
set CGO_ENABLED=1
set CC=C:\Software\Toolbox\apps\AndroidStudio\Android\Sdk\ndk\21.0.6113669\toolchains\llvm\prebuilt\windows-x86_64\bin\aarch64-linux-android21-clang
go build -buildmode=c-shared -o ..\backend\bin\arm64-v8a\libadd.so ..\backend\src\test\main.go

echo "Build android arm64-v8a success"

pause