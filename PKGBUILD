# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=lxqt-wayland-session
pkgver=0.4.1
pkgrel=1
pkgdesc='Files needed for the LXQt Wayland Session'
arch=('any')
url='https://github.com/lxqt/lxqt-wayland-session'
groups=("lxqt")
depends=(
  'lxqt-session'
  'qtxdg-tools'
  'layer-shell-qt'
)
optdepends=(
  'labwc'
  'wayfire'
  'kwin'
  'hyprland'
  'niri'
  'river'
  'sway'
)
makedepends=('git' 'cmake' 'qt6-tools' 'lxqt-build-tools')
source=("git+https://github.com/lxqt/$pkgname.git#tag=$pkgver")
sha256sums=('e21479b29060dbec0c4b49cf9e1b267b0a949f598a997208c5d8e5ee20a035b2')
# see https://github.com/lxqt/lxqt-wayland-session/blob/master/LICENSE for more details
# place at bottom to satisfy obs
license=(
  'LGPL-2.1-only'       # most files
  'MIT'                 # files adapted from sway and wayfire
  'GPL-2.0-only'        # files adapted from labwc https://github.com/labwc/labwc/blob/0.8.0/meson.build#L5
  'GPL-3.0-only'        # files adapted from river (https://codeberg.org/river/river/src/tag/v0.3.5#licensing) and labwc-themes
  'GPL-3.0-or-later'    # files adopted from niri (https://github.com/YaLTeR/niri/blob/v0.1.9/Cargo.toml#L8)
  'BSD-3-Clause'        # files adapted from hyprland
  'CC-BY-SA-4.0'        # wallpapers
)

build() {
  cmake -B build -S "$srcdir/$pkgname" \
    -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install

  install -Dm644 $pkgname/{COPYING.LESSER,COPYING,LICENSE.MIT,LICENSE.GPLv2,LICENSE.BSD} -t "$pkgdir"/usr/share/licenses/$pkgname
}
