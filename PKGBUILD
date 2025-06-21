# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=yelp-xsl
pkgver=42.4
pkgrel=1
pkgdesc="Document transformations from Yelp"
url="https://gitlab.gnome.org/GNOME/yelp-xsl"
arch=(any)
license=(GPL)
makedepends=(itstool git)
source=("git+https://gitlab.gnome.org/GNOME/yelp-xsl.git#tag=$pkgver")
sha256sums=('2df20fce55630fe403946f67c67c4b712ffd810fde0d7ca39c2c7e21297b6d15')

prepare() {
  cd yelp-xsl
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd yelp-xsl
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd yelp-xsl
  make DESTDIR="$pkgdir" install
}
