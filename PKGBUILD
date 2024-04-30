# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=flatpak-xdg-utils
pkgver=1.0.5
pkgrel=1
pkgdesc="Utilities for containerized apps to launch programs outside the container"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/flatpak/flatpak-xdg-utils"
license=('GPL')
depends=(glib)
optdepends=('flatpak: interface support' 'flatpak-builder: interface support for building flatpaks')
makedepends=('ninja' 'meson')
source=("https://github.com/flatpak/flatpak-xdg-utils/releases/download/${pkgver}/flatpak-xdg-utils-${pkgver}.tar.xz")
sha256sums=('9dbbebfb71bd99ec439fd00603cf6cbb2bc1e19b8eae75f2e5c11dabf105414b')

build() {
  meson --prefix /usr \
    --buildtype=plain \
    --bindir=/usr/lib/${pkgname} \
    "$srcdir/flatpak-xdg-utils-${pkgver}" build
  ninja -Cbuild
}

package() {
  DESTDIR="$pkgdir" ninja -Cbuild install
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/lib/${pkgname}/flatpak-spawn" "$pkgdir/usr/bin/"
}
