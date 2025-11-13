# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xfce4-screenshooter
pkgver=1.11.3
pkgrel=1
pkgdesc="An application to take screenshots"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://docs.xfce.org/apps/xfce4-screenshooter/start"
license=('GPL-2.0-or-later')
groups=('xfce4-goodies')
depends=('xfce4-panel' 'hicolor-icon-theme')
makedepends=('git' 'xfce4-dev-tools' 'wayland-protocols')
optdepends=(
  'curl: upload screenshots to Imgur'
  'jq: upload screenshots to Imgur'
  'xclip: upload screenshots to Imgur' 
  'zenity: upload screenshots to Imgur'
)
source=("git+https://gitlab.xfce.org/apps/xfce4-screenshooter.git#tag=$pkgname-$pkgver"
        git+https://gitlab.freedesktop.org/wlroots/wlr-protocols.git)
sha256sums=('603ee8eae4f8ac982f93bc7c4fe0b951696b2d2362ed038c8df4101936ba3346'
            'SKIP')

prepare() {
  cd $pkgname
  git submodule init
  git config submodule.mate-submodules.url "$srcdir/protocols/wlr-protocols"
  git -c protocol.file.allow=always submodule update
}

build() {
  ewe-meson $pkgname build \
    --localstatedir=/var \
    -D x11=disabled -D xfixes=disabled
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
