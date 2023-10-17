# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=gtkgreet
pkgname=greetd-gtk
pkgver=0.7
pkgrel=1
pkgdesc='GTK based greeter for greetd'
url="https://git.sr.ht/~kennylevinsen/$pkgbase"
license=(GPL3)
arch=(x86_64 aarch64 riscv64)
depends=(greetd gtk3 json-c gtk-layer-shell)
makedepends=(meson ninja scdoc)
source=("$url/archive/${pkgver}.tar.gz")
sha256sums=('eb4ba0e1e4f9cf888ce7b932b923f97521c2277032628cfc06bb86fecbad9373')

prepare() {
  cd $pkgbase-$pkgver/$pkgbase
  sed -i 's:G_APPLICATION_FLAGS_NONE:G_APPLICATION_DEFAULT_FLAGS:g' gtkgreet.c
  sed -i "/subdir('gtkgreet')/i add_project_arguments('-Wno-missing-field-initializers', language: 'c')" ../meson.build
}

build() {
  mkdir -p build
  ewe-meson $pkgbase-$pkgver build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
