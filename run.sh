sudo ip link add link ens160 name macvtap10 type macvtap mode bridge
sudo ip link set macvtap10 up
sudo chmod 777 /dev/tap$(cat /sys/class/net/macvtap10/ifindex)
qemu-system-x86_64 \
-enable-kvm -cpu host \
-m 4096 -overcommit mem-lock=off -smp 6,sockets=6,cores=1,threads=1 \
-drive file=disk.qcow2,index=0,cache=none,aio=threads,if=virtio \
-net nic,model=virtio,macaddr=$(cat /sys/class/net/macvtap10/address) \
-net tap,fd=4 4<>/dev/tap$(cat /sys/class/net/macvtap10/ifindex) \
-drive driver=raw,file=seed.iso,if=virtio \
#-boot order=n,splash=/home/ubuntu/qemucloudinit/truenasr.jpeg,splash-time=5000,strict=on \
#-bios /usr/share/OVMF/OVMF_CODE.fd \
