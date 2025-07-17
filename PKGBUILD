# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gigolo
pkgver=0.6.0
pkgrel=1
pkgdesc="Remote filesystem management frontend"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://docs.xfce.org/apps/gigolo/start"
license=('GPL-2.0-or-later')
depends=('gtk3' 'gvfs')
group=('xfce4-goodies')
makedepends=('git' 'xfce4-dev-tools' 'intltool')
source=("git+https://gitlab.xfce.org/apps/gigolo.git#tag=$pkgname-$pkgver")
sha256sums=('47e7aa9e55f6d6825e6300b6fe01387ae61793f1217926cd93dcee683db620b8')

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --enable-maintainer-mode
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
