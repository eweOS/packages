# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=fdk-aac
pkgver=2.0.3
pkgrel=1
pkgdesc='Standalone library of the Fraunhofer FDK AAC code from Android'
url='https://sourceforge.net/projects/opencore-amr/files/fdk-aac/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(FDK-AAC)
depends=(musl llvm-libs)
makedepends=(cmake)
provides=(libfdk-aac.so)
source=("https://sourceforge.net/projects/opencore-amr/files/fdk-aac/fdk-aac-$pkgver.tar.gz")
sha256sums=('829b6b89eef382409cda6857fd82af84fabb63417b08ede9ea7a553f811cb79e')

build() {
	cmake -S "$pkgname-$pkgver" -B build \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo	\
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DBUILD_SHARED_LIBS=ON			\
		-DBUILD_PROGRAMS=ON

	cmake --build build
}

check() {
	ctest --test-dir build
}

package() {
	DESTDIR="$pkgdir" cmake --install build

	cd "$pkgname-$pkgver"
	_install_license_ NOTICE
}
