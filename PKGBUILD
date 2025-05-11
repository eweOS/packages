# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=menu-cache
pkgver=1.1.1
pkgrel=1
pkgdesc='Caching mechanism for freedesktop.org compliant menus'
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
license=('GPL2')
url='https://lxde.org/'
depends=('libfm-extra')
# use lto to drop duplicate symbols
options=(lto)
makedepends=('gtk-doc' 'autoconf' 'git')
source=("git+https://github.com/lxde/$pkgname#tag=$pkgver")
sha256sums=('f4265cb487d0385385d415e3378580556c4a784cbcb872e36b61bfb9e0104b6c')

prepare() {
  cd $pkgname
  autoreconf -fiv
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --enable-gtk-doc
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
