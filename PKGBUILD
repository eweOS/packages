# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libstatgrab
pkgver=0.92.1
pkgrel=2
pkgdesc="A library that provides cross platform access to statistics about the system on which it's run"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://www.i-scream.org/libstatgrab"
license=('LGPL' 'GPL')
depends=('ncurses' 'perl')
makedepends=('linux-headers' 'autoconf')
options=('!makeflags')
source=(https://www.mirrorservice.org/sites/ftp.i-scream.org/pub/i-scream/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('5688aa4a685547d7174a8a373ea9d8ee927e766e3cc302bdee34523c2c5d6c11')

prepare() {
  cd "${srcdir}/$pkgname-$pkgver"
  autoreconf -fiv
}

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}
