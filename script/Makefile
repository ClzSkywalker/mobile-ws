build_so:
    export GOARCH=arm64 && export GOOS=android && export CGO_ENABLED=1 && export CC=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/darwin-x86_64/bin/armv7a-linux-androideabi21-clang && go build -buildmode=c-shared -o ../backend/bin/libadd.so ../backend/src/server/main.go
