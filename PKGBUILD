# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=wlroots
pkgver=0.17.4
pkgrel=1
license=('MIT')
pkgdesc='Modular Wayland compositor library'
url='https://gitlab.freedesktop.org/wlroots/wlroots'
arch=(x86_64 aarch64 riscv64)
depends=('libdrm' 'libinput' 'seatd' 'libudev-zero' 'libxkbcommon' 'libgles' 'libegl' 'pixman' 'wayland' 'libdisplay-info')
makedepends=('flex' 'linux-headers' 'meson' 'wayland-protocols' 'hwdata')
provides=('libwlroots.so')
source=("$pkgname-$pkgver.tar.gz::$url/-/releases/$pkgver/downloads/wlroots-$pkgver.tar.gz")
sha256sums=('d3190d19d03446955e68a92c77d4c74af78384b0db39a85a0b1582adc80f36d1')

build() {
    ewe-meson "$pkgname-$pkgver" build \
        -Ddefault_library=shared \
        -Dbackends=drm,libinput \
        -Drenderers=gles2 \
        -Dexamples=false \
        -Dxwayland=disabled \
        -Dxcb-errors=disabled
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
    install -Dm644 "$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}

