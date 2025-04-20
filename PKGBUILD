# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libsfdo
pkgver=0.1.4
pkgrel=1
pkgdesc='A collection of libraries which implement some of the freedesktop.org specifications'
url='https://gitlab.freedesktop.org/vyivel/libsfdo'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-2-Clause)
depends=(musl)
makedepends=(meson ninja)
source=("https://gitlab.freedesktop.org/vyivel/libsfdo/-/archive/v$pkgver/libsfdo-v$pkgver.tar.gz")
sha256sums=('9d74a9bff1f872e38ab662d8e2b5f6ecd404d7f82f84e9c324013f856688fa2d')

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
