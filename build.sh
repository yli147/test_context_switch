mkdir -p build/sdomain
riscv64-unknown-elf-gcc -Os -march=rv64imac -mabi=lp64  -Icommon -mcmodel=medany -ffunction-sections -fdata-sections -c common/crt.s -o build/sdomain/crt.o
riscv64-unknown-elf-gcc -Os -march=rv64imac -mabi=lp64  -Icommon -mcmodel=medany -ffunction-sections -fdata-sections -c sdomain/hello.c -o build/sdomain/hello.o
riscv64-unknown-elf-gcc -Os -march=rv64imac -mabi=lp64  -Icommon -mcmodel=medany -ffunction-sections -fdata-sections -c common/putchar.c -o build/sdomain/putchar.o
riscv64-unknown-elf-gcc -Os -march=rv64imac -mabi=lp64  -Icommon -mcmodel=medany -ffunction-sections -fdata-sections -nostartfiles -nostdlib -nostdinc -static -lgcc -Wl,--nmagic -Wl,--gc-sections -T sdomain/default.lds build/sdomain/crt.o build/sdomain/hello.o build/sdomain/putchar.o -o build/sdomain/hello
riscv64-unknown-elf-objcopy -O binary build/sdomain/hello build/sdomain/hello.bin

mkdir -p build/nsdomain
riscv64-unknown-elf-gcc -Os -march=rv64imac -mabi=lp64  -Icommon -mcmodel=medany -ffunction-sections -fdata-sections -c common/crt.s -o build/nsdomain/crt.o
riscv64-unknown-elf-gcc -Os -march=rv64imac -mabi=lp64  -Icommon -mcmodel=medany -ffunction-sections -fdata-sections -c nsdomain/hello.c -o build/nsdomain/hello.o
riscv64-unknown-elf-gcc -Os -march=rv64imac -mabi=lp64  -Icommon -mcmodel=medany -ffunction-sections -fdata-sections -c common/putchar.c -o build/nsdomain/putchar.o
riscv64-unknown-elf-gcc -Os -march=rv64imac -mabi=lp64  -Icommon -mcmodel=medany -ffunction-sections -fdata-sections -nostartfiles -nostdlib -nostdinc -static -lgcc -Wl,--nmagic -Wl,--gc-sections -T nsdomain/default.lds build/nsdomain/crt.o build/nsdomain/hello.o build/nsdomain/putchar.o -o build/nsdomain/hello
riscv64-unknown-elf-objcopy -O binary build/nsdomain/hello build/nsdomain/hello.bin


