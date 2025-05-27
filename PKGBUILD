# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xfmpc
pkgver=0.4.0
pkgrel=1
pkgdesc='A graphical GTK+ MPD client focusing on low footprint'
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url='https://docs.xfce.org/apps/xfmpc/start'
license=('GPL-2.0-or-later')
depends=('libxfce4ui' 'libmpd')
makedepends=('git' 'vala' 'xfce4-dev-tools' 'intltool')
source=("git+https://gitlab.xfce.org/apps/xfmpc.git#tag=$pkgname-$pkgver")
sha256sums=('f05024c95f639c337e37eac76127fe597d47215cb526d4d31536d33cc480fcfd')

prepare() {
  cd $pkgname
  
  sed -i '/X11/d' configure.ac
  sed -i '/X11/d' src/Makefile.am

  autoreconf -fiv  
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
