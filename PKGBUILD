# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=wlroots
pkgver=0.16.1
pkgrel=3
license=('MIT')
pkgdesc='Modular Wayland compositor library'
url='https://gitlab.freedesktop.org/wlroots/wlroots'
arch=(x86_64 aarch64 riscv64)
depends=('libdrm' 'libinput' 'seatd' 'libudev-zero' 'libxkbcommon' 'libgles' 'libegl' 'pixman' 'wayland')
makedepends=('flex' 'linux-headers' 'meson' 'wayland-protocols' 'hwdata')
provides=('libwlroots.so')
source=("$pkgname-$pkgver.tar.gz::$url/-/releases/$pkgver/downloads/wlroots-$pkgver.tar.gz")
sha256sums=('130a1a86f6f8c4fa162ba4db82aaa70850273c5d01313b242baa0144e3d6d253')

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

