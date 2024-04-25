# Maintainer: Yao Zi <ziyao@disroot.org>

pkgbase=tclap
pkgname=(tclap tclap-doc)
pkgver=1.2.5
pkgrel=1
pkgdesc='Templatized C++ Command Line Parser Library'
url='https://tclap.sourceforge.net/'
arch=(x86_64 aarch64 riscv64)
license=(MIT)
depends=(musl)
source=("https://sourceforge.net/projects/tclap/files/tclap-$pkgver.tar.gz")
sha256sums=('bb649f76dae35e8d0dcba4b52acfd4e062d787e6a81b43f7a4b01275153165a6')

build () {
	cd tclap-$pkgver
	./configure --prefix=/usr
	make
	make install DESTDIR=$srcdir/install
	mv $srcdir/install/usr/share/doc $srcdir
}

check() {
	cd tclap-$pkgver
	make check
}

package_tclap() {
	mv $srcdir/install/usr $pkgdir
	_install_license_ $srcdir/tclap-$pkgver/COPYING
}

package_tclap-doc() {
	mkdir -p $pkgdir/usr/share
	mv $srcdir/doc $pkgdir/usr/share
}
