# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mpvpaper
pkgver=1.9
pkgrel=1
pkgdesc="video wallpaper program for wlroots based wayland compositors"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/GhostNaN/$pkgname"
license=('GPL3')
depends=('mpv' 'wayland')
makedepends=('meson' 'ninja' 'wayland-protocols')
optdepends=('socat: control via sockets')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/GhostNaN/mpvpaper/archive/${pkgver}.tar.gz)
sha256sums=('6de941b54941cfd5d00bac62d10ef47c1338f237dac4c78a7185d0f8d30cd4d1')

build() {
  ewe-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -vDm644 "$pkgname-$pkgver"/mpvpaper.man "$pkgdir"/usr/share/man/man1/${pkgname}.1
}

