# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libnvme
pkgver=1.16.1
pkgrel=1
pkgdesc="C Library for NVM Express on Linux"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/linux-nvme/libnvme"
license=('LGPL-2.1-only')
makedepends=(
  'asciidoc'
  'meson'
  'python'
  'swig'
  'linux-headers'
)
depends=(
  'dbus'
  'llvm-libs'
  'musl'
  'json-c'
  'keyutils'
  'openssl'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/linux-nvme/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('ce1d9d393feb84c4e82ca096db2bdb7dd4a5fd1997d711cc1904796944f2c579')

build() {
  cd "$pkgname-$pkgver"
  ewe-meson \
    -Dlibdbus=auto \
    -Ddocs-build=true \
    .build
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" meson install -C .build
}
