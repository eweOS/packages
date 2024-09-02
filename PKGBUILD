# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=minicom
pkgver=2.9
pkgrel=1
pkgdesc='A serial communication program'
arch=('x86_64' 'aarch64' 'riscv64')
url='https://salsa.debian.org/minicom-team/minicom'
license=('GPL-2.0-or-later')
depends=('bash')
makedepends=('linux-headers')
optdepends=('lrzsz: for xmodem, ymodem and zmodem file transfer protocols')
backup=('etc/minirc.dfl')
source=("${pkgname}-${pkgver}.tar.gz::https://salsa.debian.org/minicom-team/minicom/-/archive/${pkgver}/minicom-${pkgver}.tar.gz"
        "minicom-2.9-lrzsz-rename.patch")
sha256sums=('21e609d1b58c5de06400f6e36ed3a5060711847a63bc984b6e994d9ad1641d37'
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
