# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mm-common
pkgver=1.0.5
pkgrel=1
pkgdesc="Common build files of the C++ bindings"
url="https://www.gtkmm.org/"
arch=(any)
makedepends=(meson)
license=(GPL2)
source=(
  "https://gitlab.gnome.org/GNOME/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2"
  "https://gcc.gnu.org/onlinedocs/libstdc++/latest-doxygen/libstdc++.tag"
)
sha256sums=('SKIP' 'SKIP')

prepare()
{
  cd $pkgname-$pkgver
  # WIP: however, we do not need libstdc++ tags
  cp ../libstdc++.tag doctags
}

build()
{
  ewe-meson $pkgname-$pkgver build
  meson compile -C build
}

package()
{
  meson install -C build --destdir "$pkgdir"
}
