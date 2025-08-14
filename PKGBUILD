# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xfce4-session
pkgver=4.20.3
pkgrel=1
pkgdesc="Xfce's session manager"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://docs.xfce.org/xfce/xfce4-session/start"
license=('GPL-2.0-or-later')
groups=('xfce4')
depends=('libxfce4ui' 'xfconf' 'hicolor-icon-theme' 'libxfce4windowing')
makedepends=('git' 'intltool' 'xfce4-dev-tools')
optdepends=('gnome-keyring: for keyring support when GNOME compatibility is enabled'
            'xfce4-screensaver: for locking screen with xflock4'
            'light-locker: for locking screen with xflock4')
source=("git+https://gitlab.xfce.org/xfce/xfce4-session.git#tag=$pkgname-$pkgver" no-x11.patch)
sha256sums=('02276e99def85723bf2f73c344b4df93eeaf52da18d5f8360028ded6256b820f'
            '8f3465168556341c499a1f17db2a00d573ec2a29feeca6d625a52f9a9a57f4ec')

prepare() {
  _patch_ $pkgname
  cd $pkgname
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
