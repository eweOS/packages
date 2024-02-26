# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mm-common
pkgver=1.0.6
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
sha256sums=('aa9d0b00ac5b673babf699309a88f9e100762c074a1a47eda010869f4d92e44a'
            'dfb6521cb807fc827c34bcd47dbcf2f7564b2fc1b6014ebb13bed349ddf55af0')

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
