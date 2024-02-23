# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=itstool
pkgver=2.0.7
pkgrel=1
pkgdesc="XML to PO and back again"
arch=(any)
url="http://itstool.org/"
license=(GPL3)
depends=(python libxml2)
makedepends=(git)
source=("git+https://github.com/itstool/itstool#tag=$pkgver"
        0001-Fix-the-crash-from-912099.patch)
sha256sums=('SKIP'
            'b43cea38118aaefa6724136d142dcc7099cd6de04cf2e226f53d4310dfe207cc')

prepare() {
  cd $pkgname

  # https://src.fedoraproject.org/rpms/itstool/blob/rawhide/f/itstool-2.0.5-fix-crash-wrong-encoding.patch
  git apply -3 ../0001-Fix-the-crash-from-912099.patch

  autoreconf -fvi
}

build() {
  cd $pkgname
  ./configure --prefix=/usr
  make
}

check() {
  cd $pkgname
  make check
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
