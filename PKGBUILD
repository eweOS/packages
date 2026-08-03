# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

pkgname=river-classic
pkgver=0.3.17
pkgrel=1
pkgdesc='A dynamic tiling wayland compositor with flexible runtime configuration'
arch=(x86_64 aarch64 riscv64 loongarch64)
url=https://codeberg.org/river/river-classic
license=(GPL-3.0-or-later)
depends=(libevdev libinput libxkbcommon musl pixman wayland wlroots0.20)
makedepends=(scdoc wayland-protocols wlroots0.20-devel zig)
conflicts=(river)
source=($url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=(ecd5e632a417b1d79e23180bf0073c8d8f849180ebb9138e5fa71ec8bfe15fdd)
_zig_options=(
  -Dtarget=$CARCH-linux-musl
  -Dcpu=baseline
  -Doptimize=ReleaseSafe
  -Dstrip
  -Dpie
  -Dllvm
  -Dman-pages
  --search-prefix /usr
)

build() {
  cd $pkgname-$pkgver
  DESTDIR=build zig build ${_zig_options[@]}
}

check() {
  cd $pkgname-$pkgver
  zig build test ${_zig_options[@]}
}

package() {
  cd $pkgname-$pkgver
  cp -r build/usr "$pkgdir"
  install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname README.md
  install -Dm644 -t "$pkgdir"/usr/share/wayland-sessions contrib/river.desktop
  install -Dt "$pkgdir"/usr/share/$pkgname/example example/init
  _install_license_ LICENSE
}
