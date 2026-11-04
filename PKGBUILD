# Maintainer: Weiji Wang <nebclllo0444@gmail.com>

pkgname=('libgpiod' 'python-gpiod')
pkgbase='libgpiod'
pkgver=2.3.2
pkgrel=1
pkgdesc='C library and tools for interacting with the linux GPIO character device'
url='https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git'
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
license=('LGPL-2.1-or-later')
depends=('musl')
makedepends=('meson' 'ninja' 'help2man' 'python' 'linux-headers')
source=("https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/snapshot/libgpiod-$pkgver.tar.gz")
sha256sums=('ca9bf015b809bd2b368557fa6401527f4be139fa4b23028b4214bf364139cafd')

build() {
	cd "$pkgname-$pkgver"
	ewe-meson build \
		-Dtools=enabled \
		-Dgpioset-interactive=disabled \
		-Dtests=disabled \
		-Dexamples=disabled \
		-Dbindings-cxx=enabled \
		-Dbindings-python=enabled \
		-Dbindings-rust=disabled \
		-Dbindings-glib=disabled \
		-Ddbus=disabled \
		-Dintrospection=disabled \
		-Dsystemd=disabled
	meson compile -C build
}

package_libgpiod() {
	depends=("musl")
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir" meson install -C build
	cd "$pkgdir"
	_pick_ python-gpiod usr/lib/python*
}

package_python-gpiod() {
	depends=("libgpiod=$pkgver" 'python')
	mv -v "$srcdir/pkgs/python-gpiod"/* "$pkgdir"
}
