# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

pkgname=river
pkgver=0.5.2
pkgrel=1
pkgdesc='A non-monolithic Wayland compositor'
arch=(x86_64 aarch64 riscv64 loongarch64)
url=https://isaacfreund.com/software/river
license=(0BSD CC-BY-SA-4.0 GPL-3.0-only MIT)
depends=(libevdev libinput libxkbcommon musl pixman wayland wlroots0.20)
makedepends=(scdoc wayland-protocols wlroots0.20-devel zig)
conflicts=($pkgname-classic)
source=(https://codeberg.org/$pkgname/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('b9361943a8ed9c0ed98163ce705e5ef8bdcf087383c04eea210dce5ec094fa13')
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
  install -Dm644 -t "$pkgdir"/usr/share/wayland-sessions contrib/$pkgname.desktop

  _install_license_ LICENSES/CC-BY-SA-4.0.txt CC-BY-SA-4.0
  _install_license_ LICENSES/GPL-3.0-only.txt GPL-3.0-only
  _install_license_ LICENSES/MIT.txt MIT
}
