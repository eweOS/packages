# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=musl-locales
pkgver=0.1.0
pkgrel=1
arch=(x86_64 aarch64 riscv64)
url="https://git.adelielinux.org/adelie/musl-locales/-/wikis/home"
pkgdesc="Locales support for musl"
license=(LGPL-3.0-only)
makedepends=(cmake gettext ninja)
source=(
	https://git.adelielinux.org/adelie/musl-locales/-/archive/$pkgver/musl-locales-$pkgver.tar.bz2
	add-all-available-locales.patch
)

sha256sums=('92462fba981f05ecbd6cf4816645cb3b91011383a0a6b71a6b0b2718c18d017b'
            'cf08d0c743e96d5a51d841c19149666cd3281d39353dbafc61652c60919fdc47')

build() {
  cd $pkgname-$pkgver
  cmake -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" cmake --install build
}
