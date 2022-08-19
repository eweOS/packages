# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=busybox
pkgver=1.35.0
pkgrel=1
pkgdesc="Utilities for rescue and embedded systems"
arch=("x86_64")
url="https://www.busybox.net"
license=('GPL')
makedepends=("ncurses" "musl" "skalibs" "utmps")
source=("$url/downloads/$pkgname-$pkgver.tar.bz2"
        "config")
sha256sums=('SKIP' 'SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    sed "/CONFIG_PREFIX/s@=.*@=\"${pkgdir}/usr/\"@" \
        "${srcdir}/config" >.config
    make HOSTCC=clang CC=clang
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make HOSTCC=clang CC=clang install
    chmod u+s ${pkgdir}/usr/bin/busybox
}
