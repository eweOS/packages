# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fcitx5-lua
pkgver=5.0.15
pkgrel=1
pkgdesc="Lua support for Fcitx 5"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/fcitx/fcitx5-lua"
license=('GPL')
depends=('fcitx5' 'lua')
makedepends=('git' 'extra-cmake-modules' 'ninja')
source=("git+https://github.com/fcitx/fcitx5-lua.git#tag=$pkgver" fix-luapath.patch)
sha512sums=('604c645a14f54e515a865bc976572fe48218edf2c54a7b6d30f21894531a38f676026e12e180a122ef31c6f929616e7bed9cb62a176c6ea5ab32ed0792154090'
            '8617ee26953d006cfa0d98608eaf91c1f577388c7500e6466b06de64317d2f6ef1a3fe23aede0e90ccfd5d568cc19f863d868e27fc65d9a8d7179286f3e7c19a')

prepare() {
  _patch_ $pkgname
}

build() {
  cd $pkgname
  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib .
  ninja
}

check() {
  cd $pkgname
  ninja test
}

package() {
  cd $pkgname
  DESTDIR="$pkgdir" ninja install
}
