# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=glibmm-gtk3
_pkgname=glibmm
pkgver=2.66.8
pkgrel=1
pkgdesc="C++ bindings for glib"
url="https://www.gtkmm.org/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL)
depends=(pango glib cairomm libsigc++2)
makedepends=(meson mm-common perl-xml-parser)
options=(!emptydirs)
source=("https://gitlab.gnome.org/GNOME/glibmm/-/archive/$pkgver/$_pkgname-$pkgver.tar.bz2")
sha256sums=('a822304d7aa799f0d55cec2709a2788890ede3b9a023cd96baa38664d2ee2b48')

build() {
  ewe-meson $_pkgname-$pkgver build \
    -D maintainer-mode=true \
    -D build-documentation=false
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
