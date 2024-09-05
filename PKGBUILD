# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mpvpaper
pkgver=1.7
pkgrel=1
pkgdesc="video wallpaper program for wlroots based wayland compositors"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/GhostNaN/$pkgname"
license=('GPL3')
depends=('mpv' 'wayland')
makedepends=('meson' 'ninja' 'wayland-protocols')
optdepends=('socat: control via sockets')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/GhostNaN/mpvpaper/archive/${pkgver}.tar.gz)
sha256sums=('52b32c9a25fd6c77d3fa12f1f6ef2505a656ca2eef4ebdc7ef48764205632803')

build() {
  ewe-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -vDm644 "$pkgname-$pkgver"/mpvpaper.man "$pkgdir"/usr/share/man/man1/${pkgname}.1
}

