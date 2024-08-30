# Maintainer: Yao Zi <ziyao@disroot.org>
# Contributor: Tim Rühsen <tim.ruehsen@gmx.de>

pkgname=libpsl
pkgver=0.21.5
pkgrel=2
pkgdesc='Public Suffix List library'
url='https://github.com/rockdaboot/libpsl'
arch=(x86_64 aarch64 riscv64)
license=(MIT)
depends=(musl libidn2 libunistring)
makedepends=(libidn2 libunistring meson)
source=("https://github.com/rockdaboot/libpsl/releases/download/$pkgver/libpsl-$pkgver.tar.gz")
sha256sums=('1dcc9ceae8b128f3c0b3f654decd0e1e891afc6ff81098f227ef260449dae208')

build () {
	cd libpsl-$pkgver
	meson setup --prefix=/usr	\
		--default-library=both	\
		. output
	meson compile -C output
}

check() {
	cd libpsl-$pkgver
	meson test --no-rebuild --print-errorlogs -C output
}

package() {
	cd libpsl-$pkgver
	DESTDIR="$pkgdir" meson install --no-rebuild -C output
}
