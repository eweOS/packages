# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=debugedit
pkgver=5.4
pkgrel=1
pkgdesc='Tool to mangle source locations in .debug files'
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url='https://sourceware.org/debugedit/'
license=('GPL-3.0-or-later' 'GPL-2.0-or-later' 'LGPL-2.0-or-later')
depends=('libelf' 'xxhash')
makedepends=('help2man')
source=(
  "https://sourceware.org/ftp/debugedit/${pkgver}/debugedit-${pkgver}.tar.xz"
  error-h.patch
)
sha512sums=('a5813796779f7a09c4845b4d995296692d88ab8fe889c7c97b1f868dec4b6f9c426bcb18dd051a6f49e2275d553374103460c1b700e78c4db7dc7eafd4c55342'
            'c0835aab95971bef0dd5ab2747b43dfdd53b42fe93e5c0ef2d7f748f94b94d21f06101337d519fe9092c3b2e31ca628289ebd155d31f29d9de3140f65ae2b274')

prepare() {
    _patch_ "debugedit-${pkgver}"
    cd "debugedit-${pkgver}"
    autoreconf -fiv
}

build() {
    cd "debugedit-${pkgver}"
    ./configure --prefix=/usr
    make
}

package() {
    cd "debugedit-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
