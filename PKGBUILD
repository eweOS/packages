# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libsixel
pkgver=1.10.5
pkgrel=1
pkgdesc='A C language SIXEL encoder/decoder implementation'
url='https://github.com/libsixel/libsixel'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(musl glib gdk-pixbuf2 gd curl libjpeg libpng)
makedepends=(meson ninja)
source=("https://github.com/libsixel/libsixel/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b6654928bd423f92e6da39eb1f40f10000ae2cc6247247fc1882dcff6acbdfc8')

build() {
	# TODO: python binding is broken in upstream
	ewe-meson "$pkgname-$pkgver" build \
		-Dgdk-pixbuf2=enabled		\
		-Dlibcurl=enabled		\
		-Dtests=enabled			\
		-Dpython=disabled

	meson compile -C build
}

check() {
	meson test -C build
}

package() {
	meson install -C build --destdir="$pkgdir"
}
