# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=libpfm
pkgver=4.13.0
pkgrel=2
pkgdesc='Linux perf_events setup helper'
url='https://perfmon2.sourceforge.net/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(musl)
makedepends=(linux-uapi-headers)
provides=(libpfm.so)
source=("https://sourceforge.net/projects/perfmon2/files/libpfm4/libpfm-$pkgver.tar.gz")
sha256sums=('d18b97764c755528c1051d376e33545d0eb60c6ebf85680436813fa5b04cc3d1')

_makeargs=(
	PREFIX=/usr
	# Disable -Werror provided in config.mk by, Clang emits warnings about
	# unused variables, which are lift to errors.
	DBG="-g -Wall -Wextra"
)

build() {
	cd "$pkgname-$pkgver"

	make "${_makeargs[@]}"
}

package() {
	cd "$pkgname-$pkgver"

	make "${_makeargs[@]}" install DESTDIR="$pkgdir"
}
