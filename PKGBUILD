# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=parted
pkgver=3.8
pkgrel=1
pkgdesc='A program for creating, destroying, resizing, checking and copying partitions'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('GPL3')
url='https://www.gnu.org/software/parted/parted.html'
depends=('util-linux-libs')
makedepends=('pkgconf' 'linux-headers')
source=("https://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('a2b7811f47b0ddb1f7b1d0aa456f7c1270da70708ce231c2fe054c7199eafa63')

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
