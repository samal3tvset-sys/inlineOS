CC = aarch64-linux-gnu-gcc
AS = aarch64-linux-gnu-as
LD = aarch64-linux-gnu-ld
OBJCOPY = aarch64-linux-gnu-objcopy

CFLAGS = -ffreestanding -O2 -nostdlib -Wall -Wextra
LDFLAGS = -nostdlib -Ttext 0x40000000

OBJS = bootloader.o kernelboot.o touchscreen.o screen.o sound.o graphic.o hello.o

all: os.img

bootloader.o: boot/bootloader.asm
	$(AS) $< -o $@

kernelboot.o: boot/kernelboot.asm
	$(AS) $< -o $@

touchscreen.o: vendor/touchscreen.c
	$(CC) $(CFLAGS) -c $< -o $@

screen.o: vendor/screen.c
	$(CC) $(CFLAGS) -c $< -o $@

sound.o: vendor/sound.c
	$(CC) $(CFLAGS) -c $< -o $@

graphic.o: system/graphic.c
	$(CC) $(CFLAGS) -c $< -o $@

hello.o: system/hello.c
	$(CC) $(CFLAGS) -c $< -o $@

os.img: $(OBJS)
	$(LD) $(LDFLAGS) $(OBJS) -o kernel.elf
	$(OBJCOPY) -O binary kernel.elf os.img

clean:
	rm -f *.o *.elf os.img
