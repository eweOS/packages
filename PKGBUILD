# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xfce4-clipman-plugin
pkgver=1.7.0
pkgrel=1
pkgdesc="A clipboard plugin for the Xfce4 panel"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
license=('GPL-2.0-or-later')
url="https://docs.xfce.org/panel-plugins/xfce4-clipman-plugin/start"
groups=('xfce4-goodies')
depends=('xfce4-panel' 'qrencode')
makedepends=('git' 'intltool' 'xfce4-dev-tools')
source=("git+https://gitlab.xfce.org/panel-plugins/xfce4-clipman-plugin.git#tag=$pkgname-$pkgver"
        git+https://gitlab.freedesktop.org/wlroots/wlr-protocols.git)
sha256sums=('ab9e5ffa5f6922af60c4fb9ad4a08b0bf507f0e34f2ad1120a46eaefca8f73b3'
            'SKIP')

prepare() {
  cd $pkgname
  git submodule init
  git config submodule.mate-submodules.url "$srcdir/protocols/wlr-protocols"
  git -c protocol.file.allow=always submodule update
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-debug \
    --enable-maintainer-mode
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
