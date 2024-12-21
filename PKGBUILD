# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=(linux linux-headers linux-devel linux-docs)
_basename=linux
pkgver=6.12.6
pkgrel=1
arch=(x86_64 aarch64 riscv64 loongarch64)
url='http://www.kernel.org'
license=(GPL-2.0-only)
makedepends=(bison flex perl python libelf linux-headers rsync lld git)
source=(
  "https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-$pkgver.tar.xz"
  "kernel-config::git+https://github.com/eweOS/kernel-config.git"
  busybox-find-compat.patch
  0001-amdgpu-dml2-Increase-max-stack-size.patch
)
options=(!strip)
sha256sums=('d450ab215de4e1f8bb85e0f4216760fa33fd024b4526b144f4ce0d9012b29c9e'
            'SKIP'
            'b8be8b83838595142586e54ee2f0f6b4942dca351663d5b9ded7e869aa9850cd'
            '881a82cdf13ffcc0baa85e9cbde17595c5460646614b313a3c2d46915cb0c45b')

prepare()
{
  _patch_ "$_basename-$pkgver"
  cd ${_basename}-${pkgver}
  sed -i \
    -e '/^CC/s@gcc@cc@g' \
    -e '/^HOSTCC/s@gcc@cc@g' Makefile
}

build()
{
  touch $srcdir/kernelconfig
  cd kernel-config
  for conf in *.config $CARCH/*.config; do
	 cat $conf >> $srcdir/kernelconfig
  done

  cd $srcdir/${_basename}-${pkgver}
  case $CARCH in
    x86_64)
      export build_arch=x86_64
      export dev_arch=x86
      ;;
    aarch64)
      export build_arch=arm64
      export dev_arch=arm64
      ;;
    riscv64)
      export build_arch=riscv
      export dev_arch=riscv
      ;;
    loongarch64)
      export build_arch=loongarch
      export dev_arch=loongarch
      ;;
  esac
  make LLVM=1 LLVM_IAS=1 ARCH=${build_arch} defconfig
  scripts/kconfig/merge_config.sh -m .config $srcdir/kernelconfig
  make LLVM=1 LLVM_IAS=1 ARCH=${build_arch} olddefconfig
  make LLVM=1 LLVM_IAS=1 ARCH=${build_arch}

  export kernelrelease="$(make -s kernelrelease)"
}

package_linux()
{
  pkgdesc="The $pkgdesc kernel and modules"

  cd ${_basename}-${pkgver}

  make LLVM=1 LLVM_IAS=1 ARCH=${build_arch} \
    INSTALL_MOD_PATH="$pkgdir/usr" \
    INSTALL_MOD_STRIP=1 \
    modules_install

  install -Dm644 \
    "$(make -s image_name ARCH=${build_arch} | sed 's/.gz$//')" \
    "$pkgdir/usr/lib/modules/$kernelrelease/vmlinuz"

  # Used by tinyramfs to name the kernel
  echo "$_basename" | install -Dm644 /dev/stdin \
    "$pkgdir/usr/lib/modules/$kernelrelease/pkgbase"

  rm -f $pkgdir/usr/lib/modules/$kernelrelease/{build,source}
}

package_linux-headers()
{
  pkgdesc="Kernel headers sanitized for use in userspace"

  cd ${_basename}-${pkgver}

  make LLVM=1 LLVM_IAS=1 ARCH=${build_arch} INSTALL_HDR_PATH=$pkgdir/usr headers_install
}

package_linux-devel()
{
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"

  cd ${_basename}-${pkgver}
 
  local builddir="$pkgdir/usr/src/$pkgbase"

  echo "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map vmlinux
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/${dev_arch}" -m644 arch/${dev_arch}/Makefile
  cp -t "$builddir" -a scripts

  # required when STACK_VALIDATION is enabled
  grep -q "STACK_VALIDATION=y" .config && \
    install -Dt "$builddir/tools/objtool" tools/objtool/objtool

  echo "Installing headers..."
  cp -t "$builddir" -a include
  cp -t "$builddir/arch/${dev_arch}" -a arch/${dev_arch}/include
  [ -f arch/${dev_arch}/kernel/asm-offsets.s ] && \
    install -Dt "$builddir/arch/${dev_arch}/kernel" -m644 arch/${dev_arch}/kernel/asm-offsets.s

  install -Dt "$builddir/drivers/md" -m644 drivers/md/*.h
  install -Dt "$builddir/net/mac80211" -m644 net/mac80211/*.h

  # https://bugs.archlinux.org/task/13146
  install -Dt "$builddir/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

  # https://bugs.archlinux.org/task/20402
  install -Dt "$builddir/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
  install -Dt "$builddir/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
  install -Dt "$builddir/drivers/media/tuners" -m644 drivers/media/tuners/*.h

  # https://bugs.archlinux.org/task/71392
  install -Dt "$builddir/drivers/iio/common/hid-sensors" -m644 drivers/iio/common/hid-sensors/*.h

  echo "Installing KConfig files..."
  find . -name 'Kconfig*' -exec install -Dm644 {} "$builddir/{}" \;

  echo "Removing unneeded architectures..."
  local arch
  for arch in "$builddir"/arch/*/; do
    [[ $arch = */$dev_arch/ ]] && continue
    echo "Removing $(basename "$arch")"
    rm -r "$arch"
  done

  echo "Removing documentation..."
  rm -r "$builddir/Documentation"

  echo "Removing broken symlinks..."
  find -L "$builddir" -type l | xargs -I @ bash -c "echo Removing @ && rm -f @"

  echo "Removing loose objects..."
  find "$builddir" -type f -name '*.o' | xargs -I @ bash -c "echo Removing @ && rm -f @"

  echo "Stripping build tools..."
  local file
  while read -rd '' file; do
    case "$(file -Sib "$file")" in
      application/x-sharedlib\;*)      # Libraries (.so)
        strip $STRIP_SHARED "$file" ;;
      application/x-archive\;*)        # Libraries (.a)
        strip $STRIP_STATIC "$file" ;;
      application/x-executable\;*)     # Binaries
        strip $STRIP_BINARIES "$file" ;;
      application/x-pie-executable\;*) # Relocatable binaries
        strip $STRIP_SHARED "$file" ;;
    esac
  done < <(find "$builddir" -type f -perm -u+x ! -name vmlinux -print0)

  echo "Stripping vmlinux..."
  strip $STRIP_STATIC "$builddir/vmlinux"

  echo "Adding symlink..."
  mkdir -p "$pkgdir/usr/lib/modules/$kernelrelease"
  ln -s "../../../src/$pkgbase" "$pkgdir/usr/lib/modules/$kernelrelease/build"
}

package_linux-docs() {
  pkgdesc="Documentation for the $pkgdesc kernel"

  cd ${_basename}-${pkgver}

  local builddir="$pkgdir/usr/src/$pkgbase"

  echo "Installing documentation..."
  local src dst
  while read -rd '' src; do
    dst="${src#Documentation/}"
    dst="$builddir/Documentation/${dst#output/}"
    install -Dm644 "$src" "$dst"
  done < <(find Documentation -name '.*' -prune -o ! -type d -print0)

  echo "Adding symlink..."
  mkdir -p "$pkgdir/usr/lib/modules/$kernelrelease/build/Documentation"
  ln -s "../../../share/doc/$pkgbase" "$pkgdir/usr/lib/modules/$kernelrelease/build/Documentation"
}
