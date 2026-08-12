# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Eric Long <i@hack3r.moe>

pkgname=(linux linux-devel linux-docs)
_basename=linux
pkgver=7.1.8
pkgrel=1
pkgdesc='Linux kernel'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='http://www.kernel.org'
license=(GPL-2.0-only)
# xxhash is required by objtool
makedepends=(bison flex perl python libelf linux-headers rsync lld git pahole
	     xxhash)
options=(!strip)
_kconfig_commit=9ae88fc01b174714b084d83573de0fa50eb539a4
source=("https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-$pkgver.tar.xz"
        "git+https://github.com/eweOS/kernel-config.git#commit=$_kconfig_commit"
        busybox-find-compat.patch)
sha256sums=('ff01dcb449279d5b4cfccdb01fee639cf5ff1803f1749a77844dd33915422c49'
            'eaa53fcfd50d6057e31493a6a2a1f67b8ed97b3700cd4ba60e669d3f7fbb2332'
            'b8be8b83838595142586e54ee2f0f6b4942dca351663d5b9ded7e869aa9850cd')

case $CARCH in
x86_64)
  _build_arch=x86_64
  _dev_arch=x86
  ;;
aarch64)
  _build_arch=arm64
  _dev_arch=arm64
  ;;
riscv64)
  _build_arch=riscv
  _dev_arch=riscv
  ;;
loongarch64)
  _build_arch=loongarch
  _dev_arch=loongarch
  ;;
esac

prepare() {
  _patch_ "$_basename-$pkgver"

  touch kernelconfig
  cd kernel-config
  for _conf in *.config $CARCH/*.config; do
    cat $_conf >> "$srcdir/kernelconfig"
  done

  cd "$srcdir/$_basename-$pkgver"
  sed -i \
    -e '/^CC/s@gcc@cc@g' \
    -e '/^HOSTCC/s@gcc@cc@g' Makefile
  make LLVM=1 LLVM_IAS=1 ARCH=$_build_arch defconfig
  scripts/kconfig/merge_config.sh -m .config "$srcdir/kernelconfig"
  make LLVM=1 LLVM_IAS=1 ARCH=$_build_arch olddefconfig

  scripts/config --set-str CONFIG_LOCALVERSION "-$pkgrel-ewe"
}

build() {
  cd "$_basename-$pkgver"
  make LLVM=1 LLVM_IAS=1 ARCH=$_build_arch

  # Generate vmlinux.h used in eBPF
  make LLVM=1 LLVM_IAS=1 ARCH=$_build_arch \
    -C tools/bpf/bpftool vmlinux.h \
    feature-clang-bpf-co-re=1 feature-llvm=1

  export _kernelrelease="$(make -s kernelrelease)"
}

package_linux() {
  pkgdesc="The $pkgdesc and modules"

  cd "$_basename-$pkgver"

  make LLVM=1 LLVM_IAS=1 ARCH=$_build_arch \
    INSTALL_MOD_PATH="$pkgdir/usr" \
    INSTALL_MOD_STRIP=1 \
    modules_install

  if [ -d "arch/$_build_arch/boot/dts" ]; then
    make LLVM=1 LLVM_IAS=1 \
      INSTALL_DTBS_PATH="$pkgdir/usr/share/dtbs/$_kernelrelease" \
      dtbs_install
  fi

  install -Dm644 \
    "$(make -s image_name ARCH=$_build_arch | sed 's/.gz$//')" \
    "$pkgdir/usr/lib/modules/$_kernelrelease/vmlinuz"

  # Used by tinyramfs to name the kernel
  echo "$_basename" | install -Dm644 /dev/stdin \
    "$pkgdir/usr/lib/modules/$_kernelrelease/pkgbase"

  rm -f "$pkgdir/usr/lib/modules/$_kernelrelease/"{build,source}
}

package_linux-devel() {
  pkgdesc="Headers and scripts for building modules for the $pkgdesc"
  # Pahole is required if BTF is enabled, xxhash is required if objtool is
  # enabled.
  depends=(pahole xxhash)

  cd "$_basename-$pkgver"
  local _builddir="$pkgdir/usr/src/$pkgbase"

  echo "Installing build files..."
  install -Dt "$_builddir" -m644 .config Makefile Module.symvers System.map vmlinux tools/bpf/bpftool/vmlinux.h
  install -Dt "$_builddir/kernel" -m644 kernel/Makefile
  install -Dt "$_builddir/arch/$_dev_arch" -m644 arch/$_dev_arch/Makefile
  cp -t "$_builddir" -a scripts

  # required when STACK_VALIDATION is enabled
  grep -q "STACK_VALIDATION=y" .config &&
    install -Dt "$_builddir/tools/objtool" tools/objtool/objtool

  # required when DEBUG_INFO_BTF_MODULES is enabled
  install -Dt "$_builddir/tools/bpf/resolve_btfids" tools/bpf/resolve_btfids/resolve_btfids

  echo "Installing headers..."
  cp -t "$_builddir" -a include
  cp -t "$_builddir/arch/$_dev_arch" -a arch/$_dev_arch/include
  [ -f arch/$_dev_arch/kernel/asm-offsets.s ] &&
    install -Dt "$_builddir/arch/$_dev_arch/kernel" -m644 arch/$_dev_arch/kernel/asm-offsets.s

  install -Dt "$_builddir/drivers/md" -m644 drivers/md/*.h
  install -Dt "$_builddir/net/mac80211" -m644 net/mac80211/*.h

  # https://bugs.archlinux.org/task/13146
  install -Dt "$_builddir/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

  # https://bugs.archlinux.org/task/20402
  install -Dt "$_builddir/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
  install -Dt "$_builddir/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
  install -Dt "$_builddir/drivers/media/tuners" -m644 drivers/media/tuners/*.h

  # https://bugs.archlinux.org/task/71392
  install -Dt "$_builddir/drivers/iio/common/hid-sensors" -m644 drivers/iio/common/hid-sensors/*.h

  echo "Installing KConfig files..."
  find . -name 'Kconfig*' -exec install -Dm644 {} "$_builddir/{}" \;

  echo "Removing unneeded architectures..."
  local _arch
  for _arch in "$_builddir"/arch/*/; do
    [[ $_arch = */$_dev_arch/ ]] && continue
    echo "Removing $(basename "$_arch")"
    rm -r "$_arch"
  done

  echo "Removing documentation..."
  rm -r "$_builddir/Documentation"

  echo "Removing broken symlinks..."
  find -L "$_builddir" -type l | xargs -I @ bash -c "echo Removing @ && rm -f @"

  echo "Removing loose objects..."
  find "$_builddir" -type f -name '*.o' | xargs -I @ bash -c "echo Removing @ && rm -f @"

  echo "Stripping build tools..."
  local _file
  while read -rd '' file; do
    case "$(file -Sib "$_file")" in
    application/x-sharedlib\;*) # Libraries (.so)
      strip $STRIP_SHARED "$_file" ;;
    application/x-archive\;*) # Libraries (.a)
      strip $STRIP_STATIC "$_file" ;;
    application/x-executable\;*) # Binaries
      strip $STRIP_BINARIES "$_file" ;;
    application/x-pie-executable\;*) # Relocatable binaries
      strip $STRIP_SHARED "$_file" ;;
    esac
  done < <(find "$_builddir" -type f -perm -u+x ! -name vmlinux -print0)

  echo "Stripping vmlinux..."
  strip $STRIP_STATIC "$_builddir/vmlinux"

  echo "Adding symlink..."
  mkdir -p "$pkgdir/usr/lib/modules/$_kernelrelease"
  ln -s "../../../src/$pkgbase" "$pkgdir/usr/lib/modules/$_kernelrelease/build"
}

package_linux-docs() {
  pkgdesc="Documentation for the $pkgdesc"

  cd $_basename-$pkgver
  local _builddir="$pkgdir/usr/src/$pkgbase"

  echo "Installing documentation..."
  local _src _dst
  while read -rd '' _src; do
    _dst="${_src#Documentation/}"
    _dst="$_builddir/Documentation/${_dst#output/}"
    install -Dm644 "$_src" "$_dst"
  done < <(find Documentation -name '.*' -prune -o ! -type d -print0)

  echo "Adding symlink..."
  mkdir -p "$pkgdir/usr/lib/modules/$_kernelrelease/build/Documentation"
  ln -s "../../../share/doc/$pkgbase" "$pkgdir/usr/lib/modules/$_kernelrelease/build/Documentation"
}
