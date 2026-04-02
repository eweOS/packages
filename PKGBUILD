# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=debugedit
pkgver=5.3
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
sha512sums=('a02e04f5b91e0ec5d880207658e5b89b28424ffee6aed7374c495c0c49b2f0180eeb2277bdb758a3d245279a2083d5f7b8b4872b8972b92d5c92ef5f1d27d958'
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
