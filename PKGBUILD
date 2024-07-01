# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=linux-lts
_pkgbase=linux
pkgname=(linux-lts linux-lts-headers)
_pkgver=6.6.36
pkgver=6.6.36
pkgrel=1
arch=(x86_64 aarch64 riscv64)
url='http://www.kernel.org'
license=(GPL2)
makedepends=(bison flex perl python libelf linux-headers rsync lld git)
source=(
  "https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-$_pkgver.tar.xz"
  "kernel-config::git+https://github.com/eweOS/kernel-config.git"
  busybox-find-compat.patch
)
sha256sums=('b9676828b737e8fb8eaa5198303d35d35e8df019550be153c8a42c99afe0cdd5'
            'SKIP'
            'b8be8b83838595142586e54ee2f0f6b4942dca351663d5b9ded7e869aa9850cd')

prepare()
{
  cd ${_pkgbase}-${_pkgver}
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

  cd $srcdir/${_pkgbase}-${_pkgver}
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

package_linux-lts()
{
  pkgdesc="The $pkgdesc kernel and modules"
  cd ${_pkgbase}-${_pkgver}

  local modulesdir="$pkgdir/usr/lib/modules/$pkgver"
  install -Dm644 "$(make -s image_name ARCH=${build_arch})" "$modulesdir/vmlinuz"

  make LLVM=1 LLVM_IAS=1 ARCH=${build_arch} \
    INSTALL_MOD_PATH="$pkgdir/usr" \
    INSTALL_MOD_STRIP=1 \
    modules_install

  rm -f "$modulesdir/build"
  rm -f "$modulesdir/source"

  # Used by tinyramfs to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"
}

package_linux-lts-headers()
{
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
  cd ${_pkgbase}-${_pkgver}
  make LLVM=1 LLVM_IAS=1 ARCH=${build_arch} INSTALL_HDR_PATH=$pkgdir/usr headers_install
}
