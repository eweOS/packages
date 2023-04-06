#!/bin/bash -e

kernels=()

while read -r line; do
  kernels+=("/${line%/vmlinuz}")
done

for kernel in "${kernels[@]}"; do
  if ! pacman -Qqo "${kernel}" > /dev/null 2>&1; then
    # if pkgbase does not belong to any package then skip this kernel
    continue
  fi
  pkgbase=$(pacman -Qqo "${kernel}" 2>/dev/null)
  tinyramfs -f -k ${kernel##/usr/lib/modules/} /boot/initramfs-${pkgbase}.img &
  install -Dm644 "${kernel}/vmlinuz" "/boot/vmlinuz-${pkgbase}"
done

wait
