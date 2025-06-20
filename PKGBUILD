# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mm-common
pkgver=1.0.7
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
sha256sums=('7238b7f5333bc94285153784570c516ddf8fe46ff0cb5fd7493fa631f4929d64'
            'cb01f8aebdb7b9874b100d13a006fb688ee25d2e93e02ff294e6c2483606c7a3')

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
