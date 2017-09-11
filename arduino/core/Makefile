HOME=$(shell pwd)
BUILD_PATH=./build
VARIANTS_PATH=$(HOME)/../variants/standard

CC=/opt/arduino-1.8.4/hardware/tools/avr/bin/avr-gcc
CCPP=/opt/arduino-1.8.4/hardware/tools/avr/bin/avr-g++
CAR=/opt/arduino-1.8.4/hardware/tools/avr/bin/avr-gcc-ar

ASMFILES=$(wildcard *.S)    # szukam plików assemblerowych
CFILES=$(wildcard *.c)	    # szukam plików C
CPPFILES=$(wildcard *.cpp)  # szukam plików C++
OBJFILES=$(addprefix $(BUILD_PATH)/, $(ASMFILES:.S=.S.o) $(CFILES:.c=.c.o) $(CPPFILES:.cpp=.cpp.o))	# dodaje jako prefiks scieżkę do listy plików wynikowych *.o

$(BUILD_PATH)/%.S.o: %.S
	$(CC) -c -g -x assembler-with-cpp -flto -MMD -mmcu=atmega328p -DF_CPU=16000000L \
	-DARDUINO=10804 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR -I$(HOME) -I$(VARIANTS_PATH) $< -o $@

$(BUILD_PATH)/%.cpp.o: %.cpp
	$(CCPP) -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections \
	-fdata-sections -fno-threadsafe-statics -MMD -flto -mmcu=atmega328p -DF_CPU=16000000L \
	-DARDUINO=10804 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR -I$(HOME) -I$(VARIANTS_PATH) $< -o $@
	
$(BUILD_PATH)/%.c.o: %.c
	$(CC) -c -g -Os -w -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto \
	-fno-fat-lto-objects -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10804 \
	-DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR -I$(HOME) -I$(VARIANTS_PATH) $< -o $@
	
all: $(OBJFILES)
	$(CAR) rcs $(BUILD_PATH)/libcore.a $(OBJFILES)
	
clean:
	rm -rf $(BUILD_PATH)/*