#arduino tools
ARDUINO_HOME=/opt/arduino-1.8.4
CC=$(ARDUINO_HOME)/hardware/tools/avr/bin/avr-gcc
CPP=$(ARDUINO_HOME)/hardware/tools/avr/bin/avr-g++
AR=$(ARDUINO_HOME)/hardware/tools/avr/bin/avr-gcc-ar
# dirs

BUILD_DIR=$(PWD)/build
VARIANTS_DIR=$(PWD)/variants/standard
CORE_DIR=./core
LIBS_DIR=./libraries
# core files
CORE_ASM=$(shell find $(CORE_DIR) -name *.S)
CORE_ASM_OBJ=$(CORE_ASM:.S=.S.o)
CORE_C=$(shell find $(CORE_DIR) -name *.c)
CORE_C_OBJ=$(CORE_C:.c=.c.o)
CORE_CPP=$(shell find $(CORE_DIR) -name *.cpp)
CORE_CPP_OBJ=$(CORE_CPP:.cpp=.cpp.o)
CORE_OBJ=$(CORE_ASM_OBJ) $(CORE_C_OBJ) $(CORE_CPP_OBJ)
#CORE_OBJ=$(subst core,build,$(CORE_ASM_OBJ)) $(subst core,build,$(CORE_C_OBJ)) $(subst core,build,$(CORE_CPP_OBJ))

# libraries files
LIBS_CPP=$(shell find $(LIBS_DIR) -name *.cpp)
LIBS_CPP_OBJ=$(LIBS_CPP:.cpp=.cpp.o)
LIBS_C=$(shell find $(LIBS_DIR) -name *.c)
LIBS_C_OBJ=$(LIBS_C:.c=.c.o)
LIBS_OBJ=$(LIBS_CPP) $(LIBS_C)
# phony
.PHONY: core libs

# targets
%.S.o: %.S
	$(eval OUTPUT=$(subst core,build,$@))
	$(CC) -c -g -x assembler-with-cpp -flto -MMD -mmcu=atmega328p -DF_CPU=16000000L \
	-DARDUINO=10804 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR -I$(CORE_DIR) -I$(VARIANTS_DIR) $< -o $(OUTPUT)
	
%.c.o: %.c
	$(eval OUTPUT=$(subst core,build,$@))
	$(CC) -c -g -Os -w -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto \
	-fno-fat-lto-objects -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10804 \
	-DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR -I$(CORE_DIR) -I$(VARIANTS_DIR) $< -o $(OUTPUT)
	
%.cpp.o: %.cpp
	$(eval OUTPUT=$(subst core,build,$@))
	$(CPP) -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections \
	-fdata-sections -fno-threadsafe-statics -MMD -flto -mmcu=atmega328p -DF_CPU=16000000L \
	-DARDUINO=10804 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR -I$(CORE_DIR) -I$(VARIANTS_DIR) $< -o $(OUTPUT)
	
core: $(CORE_OBJ)
	$(eval CORE_OBJ=$(subst core,build,$(CORE_OBJ)))
	$(AR) rcs $(BUILD_DIR)/libcore.a $(CORE_OBJ)
#	@echo "PAKUJE DO LIBA:" $(CORE_OBJ)
	
	
libs: $(LIBS_OBJ)
	@echo "KOMPILUJE BIBLIOTEKI"  $(LIBS_OBJ) $(input)
	
	
all: core libs
	
clean:
	rm $(BUILD_DIR)/*
