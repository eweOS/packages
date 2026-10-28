# Maintainer: Yukari Chiba <i@0x7f.cc>

_pkgname=gtkgreet
pkgname=greetd-gtk
pkgver=0.8
pkgrel=4
pkgdesc='GTK based greeter for greetd'
url="https://git.sr.ht/~kennylevinsen/$_pkgname"
license=(GPL3)
arch=(x86_64 aarch64 riscv64 loongarch64)
depends=(greetd gtk3 json-c gtk-layer-shell)
makedepends=(meson ninja scdoc)
source=("$url/archive/${pkgver}.tar.gz")
sha256sums=('e5c70219da191a60e2e009412603e05c36cee15bbbf7657dbbeaa1d21a692873')

prepare() {
  cd $_pkgname-$pkgver/$_pkgname
  sed -i 's:G_APPLICATION_FLAGS_NONE:G_APPLICATION_DEFAULT_FLAGS:g' gtkgreet.c
  sed -i "/subdir('gtkgreet')/i add_project_arguments('-Wno-missing-field-initializers', language: 'c')" ../meson.build
}

build() {
  mkdir -p build
  ewe-meson $_pkgname-$pkgver build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
