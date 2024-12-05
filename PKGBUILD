# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gigolo
pkgver=0.5.3
pkgrel=1
pkgdesc="Remote filesystem management frontend"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://docs.xfce.org/apps/gigolo/start"
license=('GPL-2.0-or-later')
depends=('gtk3' 'gvfs')
group=('xfce4-goodies')
makedepends=('git' 'xfce4-dev-tools' 'intltool')
source=("git+https://gitlab.xfce.org/apps/gigolo.git#tag=$pkgname-$pkgver")
sha256sums=('863afd04ccdbe638a840847eeeeb8ec2775c2ce79d97b0c416b77b40abb77faa')

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
