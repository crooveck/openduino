#arduino tools
ARDUINO_HOME=/opt/arduino-1.8.4
CC=$(ARDUINO_HOME)/hardware/tools/avr/bin/avr-gcc
CPP=$(ARDUINO_HOME)/hardware/tools/avr/bin/avr-g++
AR=$(ARDUINO_HOME)/hardware/tools/avr/bin/avr-gcc-ar
# dirs
HOME_DIR=$(shell pwd)
BUILD_DIR=$(HOME_DIR)/build
VARIANTS_DIR=$(HOME_DIR)/variants/standard
CORE_DIR=./core
LIBS_DIR=./libraries
# core files
CORE_CPP=$(shell find $(CORE_DIR) -name *.cpp)
CORE_C=$(shell find $(CORE_DIR) -name *.c)
CORE_ASM=$(shell find $(CORE_DIR) -name *.S)
CORE_OBJ=$(CORE_ASM:.S=.S.o) $(CORE_C:.c=.c.o) $(CORE_CPP:.cpp=.cpp.o)
# libraries files
LIBS_CPP=$(shell find $(LIBS_DIR) -name *.cpp)
LIBS_C=$(shell find $(LIBS_DIR) -name *.c)
LIBS_OBJ=$(LIBS_CPP:.cpp=.cpp.o) $(LIBS_C:.c=.c.o)

# phony
.PHONY: core libs

# targets
%.S.o: %.S
	@echo "ASEMBLER" $@ $<
#	$(CC) -c -g -x assembler-with-cpp -flto -MMD -mmcu=atmega328p -DF_CPU=16000000L \
#	-DARDUINO=10804 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR -I$(CORE_DIR) -I$(VARIANTS_DIR) $< -o $@
	
%.c.o: %.c
	@echo "C" $@ $< 
	
%.cpp.o: %.cpp
	@echo "C++" $@ $<
	
core: $(CORE_OBJ)
	@echo "PAKUJE DO LIBA:" $(CORE_OBJ)
	
libs: $(LIBS_OBJ)
	@echo "KOMPILUJE BIBLIOTEKI"  $(LIBS_OBJ)
	
all: core libs
	
clean:
	rm $(BUILD_DIR)/*
