# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=menu-cache
pkgver=1.1.0
pkgrel=2
pkgdesc='Caching mechanism for freedesktop.org compliant menus'
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
license=('GPL2')
url='https://lxde.org/'
depends=('libfm-extra')
# use lto to drop duplicate symbols
options=(lto)
makedepends=('gtk-doc' 'autoconf' 'git')
source=("git+https://github.com/lxde/$pkgname#tag=$pkgver")
sha256sums=('c7192fc5e699f5cb1b1fb6a4be67f2add77077782c9d13eb4a4780c55da05720')

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
