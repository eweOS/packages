# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=archversion
pkgver=2013.12.17
pkgrel=1
pkgdesc='Archlinux Version Controller'
arch=('any')
url='https://github.com/seblu/archversion'
license=('GPL2')
depends=('python' 'pyalpm' 'python-xdg')
makedepends=('git')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  date +%Y.%m.%d
}

build() {
  cd $pkgname
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname
  make install DESTDIR="$pkgdir"
}

