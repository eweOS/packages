# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xfce4-screenshooter
pkgver=1.11.2
pkgrel=1
pkgdesc="An application to take screenshots"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://docs.xfce.org/apps/xfce4-screenshooter/start"
license=('GPL-2.0-or-later')
groups=('xfce4-goodies')
depends=('xfce4-panel' 'hicolor-icon-theme')
makedepends=('git' 'xfce4-dev-tools')
optdepends=(
  'curl: upload screenshots to Imgur'
  'jq: upload screenshots to Imgur'
  'xclip: upload screenshots to Imgur' 
  'zenity: upload screenshots to Imgur'
)
source=("git+https://gitlab.xfce.org/apps/xfce4-screenshooter.git#tag=$pkgname-$pkgver"
        git+https://gitlab.freedesktop.org/wlroots/wlr-protocols.git)
sha256sums=('8f12610907e922d615598a0a8be2fe8234f7dc8e5192c26d7d57fe7be1c2291d'
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
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-debug
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
