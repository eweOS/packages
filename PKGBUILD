# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=hwdata
pkgver=0.389
pkgrel=1
pkgdesc="hardware identification and configuration databases."
url=https://github.com/vcrhonek/hwdata
license=('GPL2')
arch=('any')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('34813e6821a5dab0f663a363026e4d17e880e5f5f2ed49244c42263b226ff98a')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --disable-blacklist
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
