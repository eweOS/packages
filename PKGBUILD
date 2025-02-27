# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=minicom
pkgver=2.10
pkgrel=1
pkgdesc='A serial communication program'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://salsa.debian.org/minicom-team/minicom'
license=('GPL-2.0-or-later')
depends=('bash')
makedepends=('linux-headers')
optdepends=('lrzsz: for xmodem, ymodem and zmodem file transfer protocols')
backup=('etc/minirc.dfl')
source=("${pkgname}-${pkgver}.tar.gz::https://salsa.debian.org/minicom-team/minicom/-/archive/${pkgver}/minicom-${pkgver}.tar.gz"
        "minicom-2.9-lrzsz-rename.patch")
sha256sums=('66ff82661c3cc49ab2e447f8a070ec1a64ba71d64219906d80a49da284a5d43e'
            '941bd2bbe1b805eb625394df13e4cd551fae1359d5b75ac90a93551ea9237803')

prepare() {
  _patch_ "${pkgname}-${pkgver}"
}

build() {
  cd "${pkgname}-${pkgver}"

  ./configure --prefix=/usr \
              --sysconfdir=/etc
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
  install -Dm644 doc/minirc.dfl ${pkgdir}/etc/minirc.dfl
}
