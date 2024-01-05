# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=(linux linux-headers)
_basename=linux
_pkgver=6.6.7
pkgver=6.6.7
pkgrel=2
arch=(x86_64 aarch64 riscv64)
url='http://www.kernel.org'
license=(GPL2)
makedepends=(bison flex perl python libelf linux-headers rsync lld)
source=(
  "https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-$_pkgver.tar.xz"
  "kernel-config::git+https://github.com/eweOS/kernel-config.git"
  busybox-find-compat.patch
  0_max98388-correct-includes.patch
)
sha256sums=('0ce68ec6019019140043263520955ecd04839e55a1baab2fa9155b42bb6fd841'
            'SKIP'
            'b8be8b83838595142586e54ee2f0f6b4942dca351663d5b9ded7e869aa9850cd'
            '61312a177624ba6f94da170c1ada48f2bd65d59172ab99bbe90f625855931f3b')

prepare()
{
  cd ${_basename}-${_pkgver}
  sed -i \
    -e '/^CC/s@gcc@cc@g' \
    -e '/^HOSTCC/s@gcc@cc@g' Makefile
  patch -Np1 -i "${srcdir}/busybox-find-compat.patch"
  patch -p1 < $srcdir/0_max98388-correct-includes.patch
}

build()
{
  touch $srcdir/kernelconfig
  cd kernel-config
  for conf in *.config $CARCH/*.config; do
	 cat $conf >> $srcdir/kernelconfig
  done

  cd $srcdir/${_basename}-${_pkgver}
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
  make LLVM=1 LLVM_IAS=1 ARCH=${build_arch}
}

package_linux()
{
  pkgdesc="The $pkgdesc kernel and modules"
  cd ${_basename}-${_pkgver}

  local modulesdir="$pkgdir/usr/lib/modules/$pkgver"
  install -Dm644 "$(make -s image_name ARCH=${build_arch})" "$modulesdir/vmlinuz"

  make LLVM=1 LLVM_IAS=1 ARCH=${build_arch} \
    INSTALL_MOD_PATH="$pkgdir/usr" \
    modules_install

  rm -f "$modulesdir/build"
  rm -f "$modulesdir/source"

  # Used by tinyramfs to name the kernel
  echo "$_basename" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"
}

package_linux-headers()
{
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
  cd ${_basename}-${_pkgver}
  make LLVM=1 LLVM_IAS=1 ARCH=${build_arch} INSTALL_HDR_PATH=$pkgdir/usr headers_install
}
