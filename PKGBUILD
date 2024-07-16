# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=(linux linux-headers)
_basename=linux
pkgver=6.9.9
pkgrel=2
arch=(x86_64 aarch64 riscv64)
url='http://www.kernel.org'
license=(GPL-2.0-only)
makedepends=(bison flex perl python libelf linux-headers rsync lld git)
source=(
  "https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-$pkgver.tar.xz"
  "kernel-config::git+https://github.com/eweOS/kernel-config.git"
  busybox-find-compat.patch
)
sha256sums=('2be05b487eb239a3bf687d628a8f104177d09c310f00bcc2a5e50f1733421eb9'
            'SKIP'
            'b8be8b83838595142586e54ee2f0f6b4942dca351663d5b9ded7e869aa9850cd')

prepare()
{
  cd ${_basename}-${pkgver}
  sed -i \
    -e '/^CC/s@gcc@cc@g' \
    -e '/^HOSTCC/s@gcc@cc@g' Makefile
  patch -Np1 -i "${srcdir}/busybox-find-compat.patch"
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
      ;;
    aarch64)
      export build_arch=arm64
      ;;
    riscv64)
      export build_arch=riscv
      ;;
  esac
  make LLVM=1 LLVM_IAS=1 ARCH=${build_arch} defconfig
  scripts/kconfig/merge_config.sh -m .config $srcdir/kernelconfig
  make LLVM=1 LLVM_IAS=1 ARCH=${build_arch} olddefconfig
  make LLVM=1 LLVM_IAS=1 ARCH=${build_arch}
}

package_linux()
{
  pkgdesc="The $pkgdesc kernel and modules"
  cd ${_basename}-${pkgver}

  make LLVM=1 LLVM_IAS=1 ARCH=${build_arch} \
    INSTALL_MOD_PATH="$pkgdir/usr" \
    INSTALL_MOD_STRIP=1 \
    modules_install

  local modulesdir="`find $pkgdir/usr/lib/modules/ -maxdepth 1 -mindepth 1 | head -n 1`"
  install -Dm644 "$(make -s image_name ARCH=${build_arch})" "$modulesdir/vmlinuz"

  rm -f "$modulesdir/build"
  rm -f "$modulesdir/source"

  # Used by tinyramfs to name the kernel
  echo "$_basename" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"
}

package_linux-headers()
{
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
  cd ${_basename}-${pkgver}
  make LLVM=1 LLVM_IAS=1 ARCH=${build_arch} INSTALL_HDR_PATH=$pkgdir/usr headers_install
}
