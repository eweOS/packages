# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libsfdo
pkgver=0.1.3
pkgrel=1
pkgdesc='A collection of libraries which implement some of the freedesktop.org specifications'
url='https://gitlab.freedesktop.org/vyivel/libsfdo'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-2-Clause)
depends=(musl)
makedepends=(meson ninja)
source=("https://gitlab.freedesktop.org/vyivel/libsfdo/-/archive/v$pkgver/libsfdo-v$pkgver.tar.gz")
sha256sums=('d1f2d8b5edec827fd386c22d6f9151377ec7c194dca4d293e3abad9df9974209')

build() {
	ewe-meson "$pkgname-v$pkgver" build
	meson compile -C build
}

check() {
	meson test -C build
}

package() {
	meson install -C build --destdir="$pkgdir"
	_install_license_ "$pkgname-v$pkgver/LICENSE"
}
