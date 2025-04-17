# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gigolo
pkgver=0.5.4
pkgrel=1
pkgdesc="Remote filesystem management frontend"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://docs.xfce.org/apps/gigolo/start"
license=('GPL-2.0-or-later')
depends=('gtk3' 'gvfs')
group=('xfce4-goodies')
makedepends=('git' 'xfce4-dev-tools' 'intltool')
source=("git+https://gitlab.xfce.org/apps/gigolo.git#tag=$pkgname-$pkgver")
sha256sums=('1bd8ea7d475ca3a7a10310716c0efd4128d616051106f82ba8de8359ef8a5cc5')

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
