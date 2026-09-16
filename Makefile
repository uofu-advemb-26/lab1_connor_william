PICO_TOOLCHAIN_PATH?=/usr
CPP=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-cpp
CC=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-gcc
AS=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-as
LD=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-ld
SRC=main.c second.c
OBJS=$(patsubst %.c,%.o,$(SRC))

MAKEFLAGS += -r

all: firmware.elf

firmware.elf: $(OBJS)
	$(LD) -o $@ $^

%.i: %.c
	$(CPP) $< > $@

%.s: %.i
	$(CC) -S $<

%.o: %.s
	$(AS) $< -o $@

clean:
	rm -f *.i *.s *.o hello.txt

hello.txt:
	echo "hello world!" > hello.txt

.PHONY: clean all