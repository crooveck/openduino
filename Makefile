HOME=$(shell pwd)
BUILD_PATH=$(HOME)/build
ARDUINO_HOME=/opt/arduino
CC=$(ARDUINO_HOME)/hardware/tools/avr/bin/avr-gcc

.PHONY: arduino sketch all clean

arduino:
	make all -C ./arduino
		
sketch:
	$(CC) -w -Os -g -flto -fuse-linker-plugin -Wl,--gc-sections -mmcu=atmega328p -o $(BUILD_PATH)/sketch.cpp.elf -I$(HOME)/arduino/core -I$(HOME)/arduino/variants/standard $(HOME)/sketch.cpp  $(HOME)/arduino/core/build/libcore.a  -lm
	avr-objcopy -O ihex -j .eeprom --set-section-flags=.eeprom=alloc,load --no-change-warnings --change-section-lma .eeprom=0  $(BUILD_PATH)/sketch.cpp.elf $(BUILD_PATH)/sketch.cpp.eep
	avr-objcopy -O ihex -R .eeprom  $(BUILD_PATH)/sketch.cpp.elf $(BUILD_PATH)/sketch.cpp.hex
	
all: arduino sketch
	
flash: all
	/opt/arduino-1.8.4/hardware/tools/avr/bin/avrdude -C/opt/arduino-1.8.4/hardware/tools/avr/etc/avrdude.conf -v -patmega328p -carduino -P/dev/ttyACM0 -b115200 -D -Uflash:w:$(BUILD_PATH)/sketch.cpp.hex:i 
	
clean:
	make clean -C ./arduino
	rm -rf $(BUILD_PATH)/*