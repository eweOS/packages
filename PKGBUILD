# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=waybar
pkgver=0.9.20
pkgrel=1
pkgdesc='Highly customizable Wayland bar for Sway and Wlroots based compositors'
arch=(x86_64 aarch64 riscv64)
url="https://github.com/Alexays/Waybar/"
license=('MIT')
depends=(
    'gtkmm3'
    'libsigc++2'
    'wayland'
    'gtk-layer-shell'
    'libevdev'
    'libinput'
    'libnl'
    'libxkbcommon'
    'jsoncpp'
    'fmt'
    'spdlog'
)
makedepends=(
    'cmake'
    'meson'
    'wayland-protocols'
)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('e300183defece4799b6dfb7aea72400492ec6e330217c22158a334f35532d014')

build() {
    cd "Waybar-$pkgver"
    meson --prefix=/usr \
          -Dtests=disabled \
          --wrap-mode=nodownload \
          build
    ninja -C build
}

package() {
    cd "Waybar-$pkgver"
    DESTDIR="$pkgdir" ninja -C build install
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
