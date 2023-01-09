# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=(linux linux-headers)
_basename=linux
pkgver=6.1.4
pkgrel=1
arch=(x86_64 aarch64)
url='http://www.kernel.org'
license=(GPL2)
makedepends=(bison flex perl python libelf linux-headers rsync lld)
source=(
  "https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-$pkgver.tar.xz"
  linux-config.arm64
  linux-config.x86_64
  busybox-find-compat.patch
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

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
  cd ${_basename}-${pkgver}
  case $CARCH in
    x86_64)
      export build_arch=x86_64
      ;;
    aarch64)
      export build_arch=arm64
      ;;
  esac
  cp "${srcdir}/linux-config.${build_arch}" .config
  make LLVM=1 LLVM_IAS=1 ARCH=${build_arch}
}

package_linux()
{
  pkgdesc="The $pkgdesc kernel and modules"
  cd ${_basename}-${pkgver}

  local modulesdir="$pkgdir/usr/lib/modules/$pkgver"
  install -Dm644 "$(make -s image_name ARCH=${build_arch})" "$modulesdir/vmlinuz"

  make LLVM=1 LLVM_IAS=1 ARCH=${build_arch} \
    INSTALL_MOD_PATH="$pkgdir/usr" \
    modules_install

  rm -f "$modulesdir/build"
  rm -f "$modulesdir/source"
}

package_linux-headers()
{
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
  cd ${_basename}-${pkgver}
  make LLVM=1 LLVM_IAS=1 ARCH=${build_arch} INSTALL_HDR_PATH=$pkgdir/usr headers_install
}
