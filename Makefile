PICO_TOOLCHAIN_PATH?=/usr
CPP=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-cpp
CC=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-gcc
AS=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-as

%.i: %.c
	$(CPP) $< > $@

%.s: %.i
	$(CC) -S $<

%.o: %.s
	$(AS) $< -o $@

.PHONY: clean
clean:
	rm -f *.i *.s *.o hello.txt

hello.txt:
	echo "hello world!" > hello.txt