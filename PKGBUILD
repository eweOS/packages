# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=minicom
pkgver=2.10
pkgrel=1
pkgdesc='A serial communication program'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://salsa.debian.org/minicom-team/minicom'
license=('GPL-2.0-or-later')
depends=('musl' 'bash')
makedepends=('linux-headers')
optdepends=('lrzsz: for xmodem, ymodem and zmodem file transfer protocols')
backup=('etc/minirc.dfl')
# 0001: Downstream, change names of modem clients
# 0002: DIRTY, disable i18n: msgmerge of gettext-tiny doesn't support update
#	operation
source=("${pkgname}-${pkgver}.tar.gz::https://salsa.debian.org/minicom-team/minicom/-/archive/${pkgver}/minicom-${pkgver}.tar.gz"
        "0001-lrzsz-rename.patch"
	"0002-disable-gettext.patch")
sha256sums=('66ff82661c3cc49ab2e447f8a070ec1a64ba71d64219906d80a49da284a5d43e'
            '941bd2bbe1b805eb625394df13e4cd551fae1359d5b75ac90a93551ea9237803'
            '60774d223e16b56d43b3cdcb3f7be09da0239e77e5f9a59ef4e9d99deb977320')

prepare() {
  _patch_ "$pkgname-$pkgver"

  cd "$pkgname-$pkgver"
  autoreconf -fiv
}

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr \
              --sysconfdir=/etc
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="${pkgdir}/" install
  install -Dm644 doc/minirc.dfl ${pkgdir}/etc/minirc.dfl
}
