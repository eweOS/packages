# Maintainer: Yao Zi <ziyao@disroot.org>

pkgbase=libxcurcommon
pkgname=(libxcurcommon libxcurcommon-compat)
_pkgname=xcurcommon
pkgver=0.0.3
pkgrel=1
pkgdesc='Common implementation of xcursor data format'
url='https://github.com/eweOS/xcurcommon'
arch=(x86_64 aarch64 riscv64)
license=(HPND-sell-variant)
depends=(musl)
source=("https://github.com/eweOS/xcurcommon/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('27dbefc0b7084f27d388699ba0e55d91e26224225a18e2815ec9180a43b8a5fa')

build () {
	cd "$_pkgname-$pkgver"

	export CCLDFLAGS="$LDFLAGS"
	make
}

package_libxcurcommon() {
	cd "$_pkgname-$pkgver"

	make install DESTDIR="$pkgdir"
}

package_libxcurcommon-compat() {
	depends=(musl libxcurcommon)

	cd "$_pkgname-$pkgver"

	make install-compatible DESTDIR="$pkgdir"
}
