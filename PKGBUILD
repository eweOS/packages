# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=parted
pkgver=3.7
pkgrel=1
pkgdesc='A program for creating, destroying, resizing, checking and copying partitions'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('GPL3')
url='https://www.gnu.org/software/parted/parted.html'
depends=('util-linux-libs')
makedepends=('pkgconf' 'linux-headers')
source=("https://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('008de57561a4f3c25a0648e66ed11e7b30be493889b64334a6d70f2c1951ef7b')

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
