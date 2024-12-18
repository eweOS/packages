# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=thunar-vcs-plugin
pkgver=0.2.0
pkgrel=1
pkgdesc="SVN and GIT integration for Thunar"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://docs.xfce.org/xfce/thunar/thunar-vcs-plugin"
license=('GPL-2.0-or-later')
depends=('thunar' 'git')
makedepends=('intltool' 'xfce4-dev-tools')
groups=('xfce4-goodies')
source=("git+https://gitlab.xfce.org/thunar-plugins/thunar-vcs-plugin.git#tag=$pkgname-$pkgver")
sha256sums=('86511d7433eade7f4f9867b37bd57d7d2133f05d678b48b78f71a40dc45014d7')

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/xfce4
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
