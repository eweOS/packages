# Maintainer: Yao Zi <ziyao@disroot.org>

pkgbase=wlroots0.19
pkgname=(wlroots0.19-devel wlroots0.19)
pkgver=0.19.0
pkgrel=2
pkgdesc='Modular Wayland compositor library'
license=('MIT')
url='https://gitlab.freedesktop.org/wlroots/wlroots'
arch=(x86_64 aarch64 riscv64 loongarch64)
makedepends=('flex' 'linux-headers' 'meson' 'wayland-protocols' 'hwdata'
	     'libinput' 'seatd' 'libudev-zero' 'libxkbcommon' 'libgles'
	     'libegl' 'pixman' 'wayland' 'libdisplay-info' 'lcms2' 'libliftoff'
	     'libdrm')
source=("$url/-/releases/$pkgver/downloads/wlroots-$pkgver.tar.gz")
sha256sums=('aefb0fe2633b0aad1d66123b2f41afab004fb625e2a7790492cdd39a805cac91')

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

package_wlroots0.19-devel() {
    depends=("wlroots0.19=$pkgver")
    pkgdesc='Modular Wayland compositor library (development package)'

    DESTDIR="$pkgdir" ninja -C build install
    cd "$pkgdir"
    _pick_ libs usr/lib/libwlroots-0.19.so

    _install_license_ "$srcdir/wlroots-$pkgver/LICENSE"
}

package_wlroots0.19() {
    provides=('libwlroots-0.19.so')
    pkgdesc='Modular Wayland compositor library'
    depends=('libdrm' 'libinput' 'seatd' 'libudev-zero' 'libxkbcommon' 'libgles'
             'libegl' 'pixman' 'wayland' 'libdisplay-info' 'lcms2' 'libliftoff')

    mv "$srcdir"/pkgs/libs/* "$pkgdir"
    _install_license_ "wlroots-$pkgver/LICENSE"
}

