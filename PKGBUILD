# Maintainer: Yao Zi <ziyao@disroot.org>

pkgbase=wlroots0.20
pkgname=(wlroots0.20-devel wlroots0.20)
pkgver=0.20.2
pkgrel=2
pkgdesc='Modular Wayland compositor library'
license=('MIT')
url='https://gitlab.freedesktop.org/wlroots/wlroots'
arch=(x86_64 aarch64 riscv64 loongarch64)
makedepends=('flex' 'linux-headers' 'meson' 'wayland-protocols' 'hwdata'
	     'libinput' 'seatd' 'libudev-zero' 'libxkbcommon' 'libgles' 'mesa'
	     'libegl' 'pixman' 'wayland' 'libdisplay-info' 'lcms2' 'libliftoff'
	     'libdrm')
source=("$url/-/releases/$pkgver/downloads/wlroots-$pkgver.tar.gz")
sha256sums=('80c567d2ed4efb2cfa6b077f22c7a710d9c78ba4e185a75e8694001114af0733')

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

package_wlroots0.20-devel() {
    depends=("wlroots0.20=$pkgver")
    pkgdesc='Modular Wayland compositor library (development package)'

    DESTDIR="$pkgdir" ninja -C build install
    cd "$pkgdir"
    _pick_ libs usr/lib/libwlroots-0.20.so

    _install_license_ "$srcdir/wlroots-$pkgver/LICENSE"
}

package_wlroots0.20() {
    provides=('libwlroots-0.20.so')
    pkgdesc='Modular Wayland compositor library'
    depends=('libdrm' 'libinput' 'seatd' 'libudev-zero' 'libxkbcommon' 'libgles' 'mesa'
             'libegl' 'pixman' 'wayland' 'libdisplay-info' 'lcms2' 'libliftoff')

    mv "$srcdir"/pkgs/libs/* "$pkgdir"
    _install_license_ "wlroots-$pkgver/LICENSE"
}
