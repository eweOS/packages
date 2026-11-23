# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=libpfm
pkgver=4.14.1
pkgrel=1
pkgdesc='Linux perf_events setup helper'
url='https://perfmon2.sourceforge.net/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(musl)
makedepends=(linux-uapi-headers)
provides=(libpfm.so)
source=("https://sourceforge.net/projects/perfmon2/files/libpfm4/libpfm-$pkgver.tar.gz")
sha256sums=('af518eab2114b0e11dfeacf8dd618b0a1ea04f28cd0b38acad2ec99abff2fd04')

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
