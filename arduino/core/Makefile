HOME=$(shell pwd)
BUILD_PATH=$(HOME)/build
VARIANTS_PATH=$(HOME)/../variants/standard

CC=/opt/arduino-1.8.4/hardware/tools/avr/bin/avr-gcc
CCPP=/opt/arduino-1.8.4/hardware/tools/avr/bin/avr-g++
CAR=/opt/arduino-1.8.4/hardware/tools/avr/bin/avr-gcc-ar

all:
	mkdir -p $(BUILD_PATH)/core
	#ASM:
	$(CC) -c -g -x assembler-with-cpp -flto -MMD -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10804 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR -I$(HOME) -I$(VARIANTS_PATH) $(HOME)/wiring_pulse.S -o $(BUILD_PATH)/core/wiring_pulse.S.o
	#C:
	$(CC) -c -g -Os -w -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto -fno-fat-lto-objects -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10804 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR -I$(HOME) -I$(VARIANTS_PATH) $(HOME)/WInterrupts.c -o $(BUILD_PATH)/core/WInterrupts.c.o
	$(CC) -c -g -Os -w -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto -fno-fat-lto-objects -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10804 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR -I$(HOME) -I$(VARIANTS_PATH) $(HOME)/hooks.c -o $(BUILD_PATH)/core/hooks.c.o
	$(CC) -c -g -Os -w -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto -fno-fat-lto-objects -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10804 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR -I$(HOME) -I$(VARIANTS_PATH) $(HOME)/wiring.c -o $(BUILD_PATH)/core/wiring.c.o
	$(CC) -c -g -Os -w -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto -fno-fat-lto-objects -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10804 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR -I$(HOME) -I$(VARIANTS_PATH) $(HOME)/wiring_analog.c -o $(BUILD_PATH)/core/wiring_analog.c.o
	$(CC) -c -g -Os -w -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto -fno-fat-lto-objects -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10804 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR -I$(HOME) -I$(VARIANTS_PATH) $(HOME)/wiring_digital.c -o $(BUILD_PATH)/core/wiring_digital.c.o
	$(CC) -c -g -Os -w -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto -fno-fat-lto-objects -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10804 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR -I$(HOME) -I$(VARIANTS_PATH) $(HOME)/wiring_pulse.c -o $(BUILD_PATH)/core/wiring_pulse.c.o
	$(CC) -c -g -Os -w -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto -fno-fat-lto-objects -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10804 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR -I$(HOME) -I$(VARIANTS_PATH) $(HOME)/wiring_shift.c -o $(BUILD_PATH)/core/wiring_shift.c.o
	#C++:
	$(CCPP) -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10804 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR -I$(HOME) -I$(VARIANTS_PATH) $(HOME)/CDC.cpp -o $(BUILD_PATH)/core/CDC.cpp.o
	$(CCPP) -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10804 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR -I$(HOME) -I$(VARIANTS_PATH) $(HOME)/HardwareSerial.cpp -o $(BUILD_PATH)/core/HardwareSerial.cpp.o
	$(CCPP) -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10804 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR -I$(HOME) -I$(VARIANTS_PATH) $(HOME)/HardwareSerial0.cpp -o $(BUILD_PATH)/core/HardwareSerial0.cpp.o
	$(CCPP) -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10804 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR -I$(HOME) -I$(VARIANTS_PATH) $(HOME)/HardwareSerial1.cpp -o $(BUILD_PATH)/core/HardwareSerial1.cpp.o
	$(CCPP) -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10804 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR -I$(HOME) -I$(VARIANTS_PATH) $(HOME)/HardwareSerial2.cpp -o $(BUILD_PATH)/core/HardwareSerial2.cpp.o
	$(CCPP) -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10804 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR -I$(HOME) -I$(VARIANTS_PATH) $(HOME)/HardwareSerial3.cpp -o $(BUILD_PATH)/core/HardwareSerial3.cpp.o
	$(CCPP) -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10804 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR -I$(HOME) -I$(VARIANTS_PATH) $(HOME)/IPAddress.cpp -o $(BUILD_PATH)/core/IPAddress.cpp.o
	$(CCPP) -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10804 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR -I$(HOME) -I$(VARIANTS_PATH) $(HOME)/PluggableUSB.cpp -o $(BUILD_PATH)/core/PluggableUSB.cpp.o
	$(CCPP) -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10804 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR -I$(HOME) -I$(VARIANTS_PATH) $(HOME)/Print.cpp -o $(BUILD_PATH)/core/Print.cpp.o
	$(CCPP) -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10804 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR -I$(HOME) -I$(VARIANTS_PATH) $(HOME)/Stream.cpp -o $(BUILD_PATH)/core/Stream.cpp.o
	$(CCPP) -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10804 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR -I$(HOME) -I$(VARIANTS_PATH) $(HOME)/Tone.cpp -o $(BUILD_PATH)/core/Tone.cpp.o
	$(CCPP) -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10804 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR -I$(HOME) -I$(VARIANTS_PATH) $(HOME)/USBCore.cpp -o $(BUILD_PATH)/core/USBCore.cpp.o
	$(CCPP) -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10804 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR -I$(HOME) -I$(VARIANTS_PATH) $(HOME)/WMath.cpp -o $(BUILD_PATH)/core/WMath.cpp.o
	$(CCPP) -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10804 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR -I$(HOME) -I$(VARIANTS_PATH) $(HOME)/WString.cpp -o $(BUILD_PATH)/core/WString.cpp.o
	$(CCPP) -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10804 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR -I$(HOME) -I$(VARIANTS_PATH) $(HOME)/abi.cpp -o $(BUILD_PATH)/core/abi.cpp.o
	$(CCPP) -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10804 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR -I$(HOME) -I$(VARIANTS_PATH) $(HOME)/main.cpp -o $(BUILD_PATH)/core/main.cpp.o
	$(CCPP) -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10804 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR -I$(HOME) -I$(VARIANTS_PATH) $(HOME)/new.cpp -o $(BUILD_PATH)/core/new.cpp.o
	#static lib:
	$(CAR) rcs $(BUILD_PATH)/libcore.a $(BUILD_PATH)/core/wiring_pulse.S.o
	$(CAR) rcs $(BUILD_PATH)/libcore.a $(BUILD_PATH)/core/WInterrupts.c.o
	$(CAR) rcs $(BUILD_PATH)/libcore.a $(BUILD_PATH)/core/hooks.c.o
	$(CAR) rcs $(BUILD_PATH)/libcore.a $(BUILD_PATH)/core/wiring.c.o
	$(CAR) rcs $(BUILD_PATH)/libcore.a $(BUILD_PATH)/core/wiring_analog.c.o
	$(CAR) rcs $(BUILD_PATH)/libcore.a $(BUILD_PATH)/core/wiring_digital.c.o
	$(CAR) rcs $(BUILD_PATH)/libcore.a $(BUILD_PATH)/core/wiring_pulse.c.o
	$(CAR) rcs $(BUILD_PATH)/libcore.a $(BUILD_PATH)/core/wiring_shift.c.o
	$(CAR) rcs $(BUILD_PATH)/libcore.a $(BUILD_PATH)/core/CDC.cpp.o
	$(CAR) rcs $(BUILD_PATH)/libcore.a $(BUILD_PATH)/core/HardwareSerial.cpp.o
	$(CAR) rcs $(BUILD_PATH)/libcore.a $(BUILD_PATH)/core/HardwareSerial0.cpp.o
	$(CAR) rcs $(BUILD_PATH)/libcore.a $(BUILD_PATH)/core/HardwareSerial1.cpp.o
	$(CAR) rcs $(BUILD_PATH)/libcore.a $(BUILD_PATH)/core/HardwareSerial2.cpp.o
	$(CAR) rcs $(BUILD_PATH)/libcore.a $(BUILD_PATH)/core/HardwareSerial3.cpp.o
	$(CAR) rcs $(BUILD_PATH)/libcore.a $(BUILD_PATH)/core/IPAddress.cpp.o
	$(CAR) rcs $(BUILD_PATH)/libcore.a $(BUILD_PATH)/core/PluggableUSB.cpp.o
	$(CAR) rcs $(BUILD_PATH)/libcore.a $(BUILD_PATH)/core/Print.cpp.o
	$(CAR) rcs $(BUILD_PATH)/libcore.a $(BUILD_PATH)/core/Stream.cpp.o
	$(CAR) rcs $(BUILD_PATH)/libcore.a $(BUILD_PATH)/core/Tone.cpp.o
	$(CAR) rcs $(BUILD_PATH)/libcore.a $(BUILD_PATH)/core/USBCore.cpp.o
	$(CAR) rcs $(BUILD_PATH)/libcore.a $(BUILD_PATH)/core/WMath.cpp.o
	$(CAR) rcs $(BUILD_PATH)/libcore.a $(BUILD_PATH)/core/WString.cpp.o
	$(CAR) rcs $(BUILD_PATH)/libcore.a $(BUILD_PATH)/core/abi.cpp.o
	$(CAR) rcs $(BUILD_PATH)/libcore.a $(BUILD_PATH)/core/main.cpp.o
	$(CAR) rcs $(BUILD_PATH)/libcore.a $(BUILD_PATH)/core/new.cpp.o

clean:
	rm -rf $(BUILD_PATH)