# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgbase=wlroots0.17
pkgname=(wlroots0.17-devel wlroots0.17)
pkgver=0.17.4
pkgrel=4
license=('MIT')
url='https://gitlab.freedesktop.org/wlroots/wlroots'
arch=(x86_64 aarch64 riscv64)
makedepends=('flex' 'linux-headers' 'meson' 'wayland-protocols' 'hwdata'
	     'libinput' 'seatd' 'libudev-zero' 'libxkbcommon' 'libgles'
	     'libegl' 'pixman' 'wayland' 'libdisplay-info')
source=("$url/-/releases/$pkgver/downloads/wlroots-$pkgver.tar.gz")
sha256sums=('d3190d19d03446955e68a92c77d4c74af78384b0db39a85a0b1582adc80f36d1')

build() {
    ewe-meson "wlroots-$pkgver" build \
        -Ddefault_library=shared \
        -Dbackends=drm,libinput \
        -Drenderers=gles2 \
        -Dexamples=false \
        -Dxwayland=disabled \
        -Dxcb-errors=disabled
    ninja -C build
}

package_wlroots0.17-devel() {
    depends=(wlroots0.17=$pkgver)
    pkgdesc='Modular Wayland compositor library (development package)'

    DESTDIR="$pkgdir" ninja -C build install
    cd $pkgdir
    _pick_ libs usr/lib/libwlroots.so.12
}

package_wlroots0.17() {
    provides=('libwlroots.so.12')
    pkgdesc='Modular Wayland compositor library'
    depends=('libdrm' 'libinput' 'seatd' 'libudev-zero' 'libxkbcommon' 'libgles'
             'libegl' 'pixman' 'wayland' 'libdisplay-info')

    mv $srcdir/pkgs/libs/* $pkgdir
    install -Dm644 "wlroots-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
