# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=wlroots
pkgver=0.17.3
pkgrel=1
license=('MIT')
pkgdesc='Modular Wayland compositor library'
url='https://gitlab.freedesktop.org/wlroots/wlroots'
arch=(x86_64 aarch64 riscv64)
depends=('libdrm' 'libinput' 'seatd' 'libudev-zero' 'libxkbcommon' 'libgles' 'libegl' 'pixman' 'wayland' 'libdisplay-info')
makedepends=('flex' 'linux-headers' 'meson' 'wayland-protocols' 'hwdata')
provides=('libwlroots.so')
source=("$pkgname-$pkgver.tar.gz::$url/-/releases/$pkgver/downloads/wlroots-$pkgver.tar.gz")
sha256sums=('04d31521bd2b737541b9680098e55ebaaf956e68d692f80479f4ee1236606d98')

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

