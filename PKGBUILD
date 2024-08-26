# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=yelp-xsl
pkgver=42.1
pkgrel=1
pkgdesc="Document transformations from Yelp"
url="https://gitlab.gnome.org/GNOME/yelp-xsl"
arch=(any)
license=(GPL)
makedepends=(itstool git)
source=("git+https://gitlab.gnome.org/GNOME/yelp-xsl.git#tag=$pkgver")
sha256sums=('c30d71413363a5ed91d96ef0bb667f2e22ef805c161961a61b77e7c10e1b77ad')

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
