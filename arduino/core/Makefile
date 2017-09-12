HOME=$(shell pwd)
BUILD_PATH=./build
VARIANTS_PATH=$(HOME)/../variants/standard

CC=/opt/arduino-1.8.4/hardware/tools/avr/bin/avr-gcc
CXX=/opt/arduino-1.8.4/hardware/tools/avr/bin/avr-g++
CAR=/opt/arduino-1.8.4/hardware/tools/avr/bin/avr-gcc-ar

ASM_SRC=$(shell find ./ -name *.S)		# lista plików assemblerowych
ASM_OBJ=$(ASM_SRC:.S=.S.o)	# lista plików asm. obj.
C_SRC=$(shell find ./ -name *.c)		# lista plików C
C_OBJ=$(C_SRC:.c=.c.o)		# lista plików C obj.
CPP_SRC=$(shell find ./ -name *.cpp)	# lista plików C++

CPP_OBJ=$(CPP_SRC:.cpp=.cpp.o)	# lista plików C++ obj.
OBJ_FILES=$(ASM_OBJ) $(C_OBJ) $(CPP_OBJ)

list:
	@echo h: $(shell find ./ -name *.h)
	@echo c: $(shell find `pwd` -name *.c)
	@echo cpp: $(shell find `pwd` -name *.cpp)
	
%.S.o: %.S
	$(CC) -c -g -x assembler-with-cpp -flto -MMD -mmcu=atmega328p -DF_CPU=16000000L \
	-DARDUINO=10804 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR -I$(HOME) -I$(VARIANTS_PATH) $< -o $(BUILD_PATH)/$@

%.cpp.o: %.cpp
	$(CXX) -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections \
	-fdata-sections -fno-threadsafe-statics -MMD -flto -mmcu=atmega328p -DF_CPU=16000000L \
	-DARDUINO=10804 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR -I$(HOME) -I$(VARIANTS_PATH) $< -o $(BUILD_PATH)/$@
	
%.c.o: %.c
	$(CC) -c -g -Os -w -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto \
	-fno-fat-lto-objects -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10804 \
	-DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR -I$(HOME) -I$(VARIANTS_PATH) $< -o $(BUILD_PATH)/$@
	
all: $(OBJ_FILES)
	$(CAR) rcs $(BUILD_PATH)/libcore.a $(OBJ_FILES)
	
clean:
	rm -rf $(BUILD_PATH)/*