# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=parted
pkgver=3.6
pkgrel=1
pkgdesc='A program for creating, destroying, resizing, checking and copying partitions'
arch=('x86_64' 'aarch64' 'riscv64')
license=('GPL3')
url='https://www.gnu.org/software/parted/parted.html'
depends=('util-linux-libs')
makedepends=('pkgconf' 'linux-headers')
source=("https://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('3b43dbe33cca0f9a18601ebab56b7852b128ec1a3df3a9b30ccde5e73359e612')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Do *not* add --disable-debug, it prevents building fatresize
  # https://github.com/ya-mouse/fatresize/issues/9
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --disable-rpath \
    --disable-device-mapper
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
