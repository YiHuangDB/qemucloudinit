rm ./disk
qemu-img create -f qcow2 \
                -o backing_file=focal-server-cloudimg-amd64.img \
                disk.qcow2 30G
# echo ubuntu | mkpasswd -m sha-512 -s
# $6$U1hNozHBKz4$QLaPOPN.bnwLalMg15c3rUIZycBzRsyZOfqto8K9R/IRHBVb6xz2XAJfns67fe3gQ0rSSoYc3dPw7v0hsNdM0/                

rm ./seed.iso
genisoimage -output seed.iso -volid cidata -joliet -rock user-data meta-data