# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xfce4-settings
pkgver=4.20.2
pkgrel=1
pkgdesc="Xfce's Configuration System"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://docs.xfce.org/xfce/xfce4-settings/start"
license=('GPL-2.0-or-later')
groups=('xfce4')
depends=('exo' 'garcon' 'libxfce4ui' 'xfconf' 'libnotify' 'libcanberra' 'gtk-layer-shell')
makedepends=('git' 'intltool' 'xfce4-dev-tools')
optdepends=('python: xfce4-compose-mail -- "mailto:" URI handling'
            'xiccd: for displays support in xfce4-color-settings'
            'cups: for printers support in xfce4-color-settings'
            'sane: for scanners support in xfce4-color-settings')
source=(
  "git+https://gitlab.xfce.org/xfce/xfce4-settings.git#tag=$pkgname-$pkgver"
  "git+https://gitlab.freedesktop.org/wlroots/wlr-protocols.git"
)
sha256sums=('222180d81c2a6d009d97084fc12be9c6e1d5d238d5a6401ef32ea43e13b24d7b'
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
    --enable-libnotify \
    --enable-pluggable-dialogs \
    --enable-sound-settings \
    --disable-debug \
    --enable-maintainer-mode
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
