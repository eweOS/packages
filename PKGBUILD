# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=waycheck
pkgver=1.6.0
pkgrel=1
pkgdesc="Simple GUI that displays the protocols implemented by a Wayland compositor"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://gitlab.freedesktop.org/serebit/$pkgname"
license=("Apache-2.0")
depends=("hicolor-icon-theme" "qt6-base" "qt6-wayland" "wayland")
makedepends=("meson")
checkdepends=("appstream")
source=("$url/-/archive/v$pkgver/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('cfa03c03738b303cae066639870c702af4c955fcf816176f30b993f1a8e1a829')

build() {
  ewe-meson "$pkgname-v$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
