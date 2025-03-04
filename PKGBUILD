# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=thunar-media-tags-plugin
pkgver=0.5.0
pkgrel=1
pkgdesc="Adds special features for media files to the Thunar File Manager"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
license=('GPL-2.0-or-later')
url="https://docs.xfce.org/xfce/thunar/media-tags"
groups=('xfce4-goodies')
depends=('taglib' 'thunar')
makedepends=('git' 'intltool' 'xfce4-dev-tools')
source=("git+https://gitlab.xfce.org/thunar-plugins/thunar-media-tags-plugin.git#tag=$pkgname-$pkgver")
sha256sums=('cb218d2ae845f61b043fed6e260b582e676dcad3980f5414ac6c430cae1fee6e')

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-debug
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
