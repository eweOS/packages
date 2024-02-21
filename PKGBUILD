# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=rofi
pkgver=1.7.5.wayland1.r42.g5d4a3e14
pkgrel=1
pkgdesc='A window switcher, application launcher and dmenu replacement (fork with Wayland support)'
arch=('x86_64' 'aarch64' 'riscv64')
url='https://github.com/lbonn/rofi'
license=(MIT)
depends=('libxkbcommon' 'wayland' 'glib' 'cairo' 'pango' 'gdk-pixbuf')
makedepends=('git' 'meson' 'wayland-protocols')
source=("$pkgname::git+$url.git#branch=wayland"
        "git+https://github.com/sardemff7/libgwater.git"
        "git+https://github.com/sardemff7/libnkutils.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  git -C $pkgname describe --long | sed 's/\([^-]*-g\)/r\1/;s/[-+]/./g'
}

prepare() {
  git -C $pkgname submodule init
  git -C $pkgname config submodule.externals/vendor/libgwater.url "$srcdir/libgwater"
  git -C $pkgname config submodule.externals/vendor/libnkutils.url "$srcdir/libnkutils"
  git -C $pkgname -c protocol.file.allow=always submodule update
}

build() {
  local meson_options=(-Dwayland=enabled -Dcheck=disabled -Dxcb=disabled)

  ewe-meson $pkgname build "${meson_options[@]}"
  meson compile -C build
}

#check() {
#  LC_ALL=C meson test -C build
#}

package() {
  meson install -C build --destdir="$pkgdir"

  install -Dm644 $pkgname/COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm755 $pkgname/Examples/*.sh -t "$pkgdir/usr/share/doc/rofi/examples/"
}

