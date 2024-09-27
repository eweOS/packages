# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=slang
pkgver=2.3.3
pkgrel=1
pkgdesc="S-Lang is a powerful interpreted language"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://www.jedsoft.org/slang/"
license=('GPL-2.0-or-later')
depends=('pcre')
backup=('etc/slsh.rc')
source=("https://www.jedsoft.org/releases/slang/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('f9145054ae131973c61208ea82486d5dd10e3c5cdad23b7c4a0617743c8f5a18')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

check() {
  cd "${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install-all
}
