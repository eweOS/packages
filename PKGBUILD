# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=(linux linux-headers)
_basename=linux
pkgver=6.0.9
pkgrel=1
pkgdesc='Linux'
arch=(x86_64)
url='http://www.kernel.org'
license=(GPL2)
makedepends=(bison flex perl python libelf linux-headers rsync lld)
source=(
  "https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-$pkgver.tar.xz"
  linux-config
  busybox-find-compat.patch
  musl-swab.patch
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

prepare() {
  cd ${_basename}-${pkgver}
  sed -i \
    -e '/^CC/s@gcc@cc@g' \
    -e '/^HOSTCC/s@gcc@cc@g' Makefile
  patch -Np1 -i "${srcdir}/busybox-find-compat.patch"
  patch -Np1 -i "${srcdir}/musl-swab.patch"
}

build() {
  cd ${_basename}-${pkgver}
  cp "${srcdir}/linux-config" .config
  make LLVM=1 LLVM_IAS=1
}

package_linux() {
    pkgdesc="The $pkgdesc kernel and modules"
    cd ${_basename}-${pkgver}

    local modulesdir="$pkgdir/usr/lib/modules/$pkgver"
    install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"
    
    make LLVM=1 LLVM_IAS=1 \
      INSTALL_MOD_PATH="$pkgdir/usr" \
      modules_install

    rm -f "$modulesdir/build" 
    rm -f "$modulesdir/source"
}

package_linux-headers() {
    pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
    cd ${_basename}-${pkgver}
    make LLVM=1 LLVM_IAS=1 INSTALL_HDR_PATH=$pkgdir/usr headers_install
}
