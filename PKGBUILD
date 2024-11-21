# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=menu-cache
pkgver=1.1.0
pkgrel=1
pkgdesc='Caching mechanism for freedesktop.org compliant menus'
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
license=('GPL2')
url='https://lxde.org/'
depends=('libfm-extra')
makedepends=('gtk-doc')
source=(https://downloads.sourceforge.net/lxde/$pkgname-$pkgver.tar.xz)
sha256sums=('ed02eb459dcb398f69b9fa5bf4dd813020405afc84331115469cdf7be9273ec7')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --enable-gtk-doc
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
