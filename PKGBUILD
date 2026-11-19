# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=pdfio
pkgver=1.6.6
pkgrel=1
pkgdesc='C library for reading and writing PDF files'
url='4a6255f269916ae7ad3fc2706b0935e7621396b8'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(Apache-2.0)
depends=(musl libpng zlib-ng)
source=("https://github.com/michaelrsweet/pdfio/releases/download/v$pkgver/pdfio-$pkgver.tar.gz")
sha256sums=('be9790ff2e9f0b7052fca8e96f2fdb6ebac903910e7ed8e2d1de4b1e55a40a23')

build() {
	cd "$pkgname-$pkgver"

	./configure --prefix=/usr \
		--enable-libpng		\
		--enable-shared
	make
}

check() {
	cd "$pkgname-$pkgver"

	make test
}

package() {
	cd "$pkgname-$pkgver"

	make install DESTDIR="$pkgdir"
	_install_license_ LICENSE
}
