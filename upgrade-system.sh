#!/bin/sh
mount /dev/sda8 /mnt/
cd /mnt/arch/
btrfs subvolume delete archroot1-backup-last/
btrfs subvolume snapshot archroot1 archroot1-backup-last
echo "Backed up archroot1."
echo "start upgrade System..."
pacman -Syu
cp /boot/efi/EFI/Arch/initramfs-linux.img  /boot/efi/EFI/Arch/initramfs-linux-old.img
cp /boot/efi/EFI/Arch/vmlinuz-linux /boot/efi/EFI/Arch/vmlinuz-linux-old
echo "Backed up initramfs and vmlinuz"
cp /boot/initramfs-linux.img /boot/efi/EFI/Arch/initramfs-linux.img
cp /boot/vmlinuz-linux /boot/efi/EFI/Arch/vmlinuz-linux
echo "You have updated initramfs-linux.img and vmlinuz-linux"
umount /mnt
echo "Finished upgrade System."
