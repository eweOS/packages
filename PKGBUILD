# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libnvme
pkgver=1.16.2
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
sha256sums=('1d850d5a871559abf641d6e6b63bb86047e4cb26f3ad144597c2c64b3cff7231')

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
