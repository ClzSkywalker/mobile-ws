@echo  off
echo=

go build -buildmode=c-shared -o .\backend\bin\windows\libAdd.dll .\backend\src\client\main.go
echo "Build libadd.dll success"

SET CGO_ENABLED=0
SET GOOS=linux
SET GOARCH=amd64
go build -buildmode=c-shared -o .\bin\linux\libadd.dll .\backend\src\client\main.go
echo "Build linux libadd.so success"

pause