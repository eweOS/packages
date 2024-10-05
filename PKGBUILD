# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=wlroots0.18
pkgname=(wlroots0.18-devel wlroots0.18)
pkgver=0.18.1
pkgrel=2
pkgdesc='Modular Wayland compositor library'
license=('MIT')
url='https://gitlab.freedesktop.org/wlroots/wlroots'
arch=(x86_64 aarch64 riscv64)
makedepends=('flex' 'linux-headers' 'meson' 'wayland-protocols' 'hwdata'
	     'libinput' 'seatd' 'libudev-zero' 'libxkbcommon' 'libgles'
	     'libegl' 'pixman' 'wayland' 'libdisplay-info' 'lcms2' 'libliftoff'
	     'libdrm')
source=("$url/-/releases/$pkgver/downloads/wlroots-$pkgver.tar.gz")
sha256sums=('b9c4bfef4123fe9f8662280b851e3c5741927457174315826827bfbb70612878')

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

package_wlroots0.18-devel() {
    depends=(wlroots0.18=$pkgver)
    pkgdesc='Modular Wayland compositor library (development package)'

    DESTDIR="$pkgdir" ninja -C build install
    cd $pkgdir
    _pick_ libs usr/lib/libwlroots-0.18.so
}

package_wlroots0.18() {
    provides=('libwlroots-0.18.so')
    pkgdesc='Modular Wayland compositor library'
    depends=('libdrm' 'libinput' 'seatd' 'libudev-zero' 'libxkbcommon' 'libgles'
             'libegl' 'pixman' 'wayland' 'libdisplay-info' 'lcms2' 'libliftoff')

    mv $srcdir/pkgs/libs/* $pkgdir
    install -Dm644 "wlroots-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}

