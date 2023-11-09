# test_context_switch

This is a simple test application to test the new opensbi domain context switch feature
```
git clone https://github.com/yli147/qemu.git -b dev-standalonemm-rpmi
export WORKDIR=`pwd`
cd qemu
./configure --target-list=riscv64-softmmu
make -j $(nproc)

cd $WORKDIR
git clone https://github.com/Penglai-Enclave/opensbi.git -b dev-standalonemm-rpmi
cd opensbi
CROSS_COMPILE=riscv64-linux-gnu- make FW_PIC=n PLATFORM=generic
cp build/platform/generic/firmware/fw_dynamic.elf $WORKDIR

cd $WORKDIR
git clone https://github.com/yli147/test_context_switch.git
cd test_context_switch
./build.sh

cd $WORKDIR
./qemu/build/qemu-system-riscv64 -nographic -machine virt -bios ./fw_dynamic.elf -kernel build/nsdomain/hello -device loader,file=build/sdomain/hello.bin,addr=0x80C00000
```
