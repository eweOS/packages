# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=havoc
pkgver=0.6.0
pkgrel=1
pkgdesc='minimal terminal emulator for Wayland on Linux'
arch=(x86_64 aarch64 riscv64)
url='https://github.com/ii8/havoc'
license=('MIT')
depends=('wayland')
makedepends=('wayland-protocols' 'libxkbcommon')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/ii8/havoc/archive/${pkgver}.tar.gz)
sha256sums=('3f6538eb8a2b5846459f38c283eef2c8152886a4ed079e1038b02d0c31a3247c')


build() {
  cd ${pkgname}-${pkgver}
  make PREFIX=/usr
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}
