# Maintainer: Yukari Chiba <i@0x7f.cc>
 
pkgname=graphene
pkgver=1.10.8
pkgrel=1
pkgdesc="A thin layer of graphic data types"
url="https://ebassi.github.io/graphene/"
arch=(x86_64 aarch64)
license=(MIT)
depends=(glib)
makedepends=(gobject-introspection meson glib)
source=("https://github.com/ebassi/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('922dc109d2dc5dc56617a29bd716c79dd84db31721a8493a13a5f79109a4a4ed')

build() {
  ewe-meson $pkgname-$pkgver build \
    -D tests=false \
    -D installed_tests=false
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
