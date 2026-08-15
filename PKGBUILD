# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=gnuplot
pkgver=6.0.5
pkgrel=1
pkgdesc='Command-line driven graphing utility'
url='command-line'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(gnuplot)
depends=(musl llvm-libs cairo gtk3 glib harfbuzz lua51 ncurses pango readline
	 libwebp wxwidgets-gtk3 zlib-ng qt6-base qt6-5compat qt6-svg)
checkdepends=(weston qt6-tools)
source=("https://sourceforge.net/projects/gnuplot/files/gnuplot/$pkgver/gnuplot-$pkgver.tar.gz")
sha256sums=('73237f37f03306d68bfae133a9a50d5e9341384e198d5ab37eeca9ab534deed8')

build() {
	cd "$pkgname-$pkgver"

	# TODO:
	#	Enable libcerf
	./configure --prefix=/usr \
		--libexecdir=/usr/lib
	make
}

check() {
	cd "$pkgname-$pkgver"

	export XDG_RUNTIME_DIR="$srcdir/runtime-dir" WAYLAND_DISPLAY=wayland-114514191980
	mkdir -p -m 700 "$XDG_RUNTIME_DIR"

	weston --backend=headless-backend.so --socket=$WAYLAND_DISPLAY --idle-time=0 &
	_w=$!
	trap "kill $_w; wait" EXIT

	make check
}

package() {
	cd "$pkgname-$pkgver"

	make install DESTDIR="$pkgdir"
	_install_license_ Copyright
}
