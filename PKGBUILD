# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=libtraceevent
pkgver=1.9.1
pkgrel=1
pkgdesc='Library to parse raw trace event formats'
url='Library'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL-2.1-only)
depends=(musl)
makedepends=(meson ninja asciidoc doxygen xmlto git linux-uapi-headers)
provides=(libtraceevent.so)
source=("git+https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git#tag=libtraceevent-$pkgver")
sha256sums=('1dabb399d7cdb3055cb873ad5d616da95275ba2d6f9e29861b57eed78c92472d')

build() {
	ewe-meson "$pkgname" build
	meson compile -C build
}

check() {
	meson test -C build
}

package() {
	meson install -C build --destdir="$pkgdir"
}
