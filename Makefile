all: init build

.PHONY: init
init:
	git submodule update --init

.PHONY: build
build:
	@mkdir -p build
	cmake -S . -B build
	cmake --build build
