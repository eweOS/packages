# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=flatpak-xdg-utils
pkgver=1.0.6
pkgrel=1
pkgdesc="Utilities for containerized apps to launch programs outside the container"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/flatpak/flatpak-xdg-utils"
license=('GPL')
depends=(glib)
optdepends=('flatpak: interface support' 'flatpak-builder: interface support for building flatpaks')
makedepends=('ninja' 'meson')
source=("https://github.com/flatpak/flatpak-xdg-utils/releases/download/${pkgver}/flatpak-xdg-utils-${pkgver}.tar.xz")
sha256sums=('53705e4cfe81460d8cf6be6ce1b1f6a79c9d12b27b6fd6c6b8d48f6a863a17ff')

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
