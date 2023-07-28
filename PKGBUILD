# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libaom
pkgver=3.6.1
pkgrel=0
pkgdesc='Alliance for Open Media (AOM) AV1 codec SDK.'
url='https://aomedia.googlesource.com/aom/'
arch=(x86_64 aarch64)
license=(BSD)
depends=(musl)
makedepends=(perl cmake)
source=("https://storage.googleapis.com/aom-releases/libaom-$pkgver.tar.gz")

build () {
	cmake   \
		-DCMAKE_INSTALL_PREFIX=/usr			\
		-DCMAKE_INSTALL_LIBDIR=lib			\
		-DBUILD_SHARED_LIBS=True			\
		-DCMAKE_BUILD_TYPE=Release			\
		-DCONFIG_TUNE_VMAF=0				\
		libaom-$pkgver
	make
}

package() {
	make install DESTDIR=$pkgdir
	install -Dm 644 libaom-$pkgver/LICENSE			\
		$pkgdir/usr/share/licenses/libaom/LICENSE
}

sha256sums=('SKIP')
