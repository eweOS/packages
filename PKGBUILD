# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=libtraceevent
pkgver=1.9.0
pkgrel=2
pkgdesc='Library to parse raw trace event formats'
url='Library'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL-2.1-only)
depends=(musl)
makedepends=(meson ninja asciidoc doxygen xmlto git linux-uapi-headers)
provides=(libtraceevent.so)
source=("git+https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git#tag=libtraceevent-$pkgver")
sha256sums=('c2773d20de7c08275afa56cf9b96fc2b4191b2dbd287190a4f87832c0bc67af3')

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
