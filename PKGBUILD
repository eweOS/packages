# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=libfreeaptx
pkgver=0.2.2
pkgrel=1
pkgdesc='Free implementation of Audio Processing Technology codec (aptX)'
url='https://github.com/regularhunter/libfreeaptx'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL-2.1-or-later)
depends=(musl)
provides=(libfreeaptx.so)
source=("https://github.com/regularhunter/libfreeaptx/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('5ab5ebddf3f2eb7ce47a505b87460b00fc1ede99c70010796d3575ab31ea80bf')

_makeflags=(
	PREFIX=/usr
)

build() {
	cd "$pkgname-$pkgver"

	make "${_makeflags[@]}"
}

package() {
	cd "$pkgname-$pkgver"

	make "${_makeflags[@]}" install DESTDIR="$pkgdir"
}
