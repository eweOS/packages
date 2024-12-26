# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=debugedit
pkgver=5.1
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
sha512sums=('72f4dcc0fba223a85d261aa38400e229f04c7c96adafe455919a8f702d3d7d9cdfb991b403d53f2ac4948ca19eeb43d3d49c0ea2616065657c120647a30575d3'
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
