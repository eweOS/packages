# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=havoc
pkgver=0.4.0
pkgrel=1
pkgdesc='minimal terminal emulator for Wayland on Linux'
arch=(x86_64)
url='https://github.com/ii8/havoc'
license=('MIT')
depends=('wayland')
makedepends=('wayland-protocols')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/ii8/havoc/archive/${pkgver}.tar.gz)
sha256sums=('SKIP')


build() {
  cd ${pkgname}-${pkgver}
  make PREFIX=/usr
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}
