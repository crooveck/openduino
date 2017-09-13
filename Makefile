BUILD_DIR=$(shell pwd)/build
# arduino tools
ARDUINO_HOME=/opt/arduino-1.8.4
CC=$(ARDUINO_HOME)/hardware/tools/avr/bin/avr-gcc
CPP=$(ARDUINO_HOME)/hardware/tools/avr/bin/avr-g++
AR=$(ARDUINO_HOME)/hardware/tools/avr/bin/avr-gcc-ar
OBJCOPY=$(ARDUINO_HOME)/hardware/tools/avr/bin/avr-objcopy
AVRDUDE=$(ARDUINO_HOME)/hardware/tools/avr/bin/avrdude

.PHONY: arduino sketch all clean

arduino:
	cd ./arduino && make all;
		
sketch:
	$(CC) -w -Os -g -flto -fuse-linker-plugin -Wl,--gc-sections -mmcu=atmega328p -o $(BUILD_DIR)/sketch.cpp.elf -I$(PWD)/arduino/core -I$(PWD)/arduino/libraries -I$(PWD)/arduino/variants/standard $(PWD)/sketch.cpp  $(PWD)/arduino/build/libarduino.a  -lm
	$(OBJCOPY) -O ihex -j .eeprom --set-section-flags=.eeprom=alloc,load --no-change-warnings --change-section-lma .eeprom=0  $(BUILD_DIR)/sketch.cpp.elf $(BUILD_DIR)/sketch.cpp.eep
	$(OBJCOPY) -O ihex -R .eeprom  $(BUILD_DIR)/sketch.cpp.elf $(BUILD_DIR)/sketch.cpp.hex
	
all: arduino sketch
	
flash:
	$(AVRDUDE) -C$(ARDUINO_HOME)/hardware/tools/avr/etc/avrdude.conf -v -patmega328p -carduino -P/dev/ttyACM0 -b115200 -D -Uflash:w:$(BUILD_DIR)/sketch.cpp.hex:i 
	
clean:
	cd ./arduino && make clean;
	rm -rf $(BUILD_DIR)/*