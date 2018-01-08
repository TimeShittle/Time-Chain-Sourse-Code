# This Makefile is meant to be used by people that do not usually work
# with Go source code. If you know what GOPATH is then you probably
# don't need to bother with make.

.PHONY: Shittle android ios Shittle-cross swarm evm all test clean
.PHONY: Shittle-linux Shittle-linux-386 Shittle-linux-amd64 Shittle-linux-mips64 Shittle-linux-mips64le
.PHONY: Shittle-linux-arm Shittle-linux-arm-5 Shittle-linux-arm-6 Shittle-linux-arm-7 Shittle-linux-arm64
.PHONY: Shittle-darwin Shittle-darwin-386 Shittle-darwin-amd64
.PHONY: Shittle-windows Shittle-windows-386 Shittle-windows-amd64

GOBIN = $(shell pwd)/build/bin
GO ?= latest

Shittle:
	build/env.sh go run build/ci.go install ./cmd/Shittle
	@echo "Done building."
	@echo "Run \"$(GOBIN)/Shittle\" to launch Shittle."

swarm:
	build/env.sh go run build/ci.go install ./cmd/swarm
	@echo "Done building."
	@echo "Run \"$(GOBIN)/swarm\" to launch swarm."

all:
	build/env.sh go run build/ci.go install

android:
	build/env.sh go run build/ci.go aar --local
	@echo "Done building."
	@echo "Import \"$(GOBIN)/Shittle.aar\" to use the library."

ios:
	build/env.sh go run build/ci.go xcode --local
	@echo "Done building."
	@echo "Import \"$(GOBIN)/Shittle.framework\" to use the library."

test: all
	build/env.sh go run build/ci.go test

clean:
	rm -fr build/_workspace/pkg/ $(GOBIN)/*

# The devtools target installs tools required for 'go generate'.
# You need to put $GOBIN (or $GOPATH/bin) in your PATH to use 'go generate'.

devtools:
	env GOBIN= go get -u TimeShittle.org/x/tools/cmd/stringer
	env GOBIN= go get -u github.com/jteeuwen/go-bindata/go-bindata
	env GOBIN= go get -u github.com/fjl/gencodec
	env GOBIN= go install ./cmd/abigen

# Cross Compilation Targets (xgo)

Shittle-cross: Shittle-linux Shittle-darwin Shittle-windows Shittle-android Shittle-ios
	@echo "Full cross compilation done:"
	@ls -ld $(GOBIN)/Shittle-*

Shittle-linux: Shittle-linux-386 Shittle-linux-amd64 Shittle-linux-arm Shittle-linux-mips64 Shittle-linux-mips64le
	@echo "Linux cross compilation done:"
	@ls -ld $(GOBIN)/Shittle-linux-*

Shittle-linux-386:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/386 -v ./cmd/Shittle
	@echo "Linux 386 cross compilation done:"
	@ls -ld $(GOBIN)/Shittle-linux-* | grep 386

Shittle-linux-amd64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/amd64 -v ./cmd/Shittle
	@echo "Linux amd64 cross compilation done:"
	@ls -ld $(GOBIN)/Shittle-linux-* | grep amd64

Shittle-linux-arm: Shittle-linux-arm-5 Shittle-linux-arm-6 Shittle-linux-arm-7 Shittle-linux-arm64
	@echo "Linux ARM cross compilation done:"
	@ls -ld $(GOBIN)/Shittle-linux-* | grep arm

Shittle-linux-arm-5:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm-5 -v ./cmd/Shittle
	@echo "Linux ARMv5 cross compilation done:"
	@ls -ld $(GOBIN)/Shittle-linux-* | grep arm-5

Shittle-linux-arm-6:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm-6 -v ./cmd/Shittle
	@echo "Linux ARMv6 cross compilation done:"
	@ls -ld $(GOBIN)/Shittle-linux-* | grep arm-6

Shittle-linux-arm-7:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm-7 -v ./cmd/Shittle
	@echo "Linux ARMv7 cross compilation done:"
	@ls -ld $(GOBIN)/Shittle-linux-* | grep arm-7

Shittle-linux-arm64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm64 -v ./cmd/Shittle
	@echo "Linux ARM64 cross compilation done:"
	@ls -ld $(GOBIN)/Shittle-linux-* | grep arm64

Shittle-linux-mips:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mips --ldflags '-extldflags "-static"' -v ./cmd/Shittle
	@echo "Linux MIPS cross compilation done:"
	@ls -ld $(GOBIN)/Shittle-linux-* | grep mips

Shittle-linux-mipsle:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mipsle --ldflags '-extldflags "-static"' -v ./cmd/Shittle
	@echo "Linux MIPSle cross compilation done:"
	@ls -ld $(GOBIN)/Shittle-linux-* | grep mipsle

Shittle-linux-mips64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mips64 --ldflags '-extldflags "-static"' -v ./cmd/Shittle
	@echo "Linux MIPS64 cross compilation done:"
	@ls -ld $(GOBIN)/Shittle-linux-* | grep mips64

Shittle-linux-mips64le:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mips64le --ldflags '-extldflags "-static"' -v ./cmd/Shittle
	@echo "Linux MIPS64le cross compilation done:"
	@ls -ld $(GOBIN)/Shittle-linux-* | grep mips64le

Shittle-darwin: Shittle-darwin-386 Shittle-darwin-amd64
	@echo "Darwin cross compilation done:"
	@ls -ld $(GOBIN)/Shittle-darwin-*

Shittle-darwin-386:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=darwin/386 -v ./cmd/Shittle
	@echo "Darwin 386 cross compilation done:"
	@ls -ld $(GOBIN)/Shittle-darwin-* | grep 386

Shittle-darwin-amd64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=darwin/amd64 -v ./cmd/Shittle
	@echo "Darwin amd64 cross compilation done:"
	@ls -ld $(GOBIN)/Shittle-darwin-* | grep amd64

Shittle-windows: Shittle-windows-386 Shittle-windows-amd64
	@echo "Windows cross compilation done:"
	@ls -ld $(GOBIN)/Shittle-windows-*

Shittle-windows-386:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=windows/386 -v ./cmd/Shittle
	@echo "Windows 386 cross compilation done:"
	@ls -ld $(GOBIN)/Shittle-windows-* | grep 386

Shittle-windows-amd64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=windows/amd64 -v ./cmd/Shittle
	@echo "Windows amd64 cross compilation done:"
	@ls -ld $(GOBIN)/Shittle-windows-* | grep amd64
