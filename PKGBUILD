# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=clipper2
pkgver=2.0.1
pkgrel=1
pkgdesc='Polygon operation library'
url='https://github.com/AngusJohnson/Clipper2'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSL-1.0)
depends=(musl llvm-libs)
makedepends=(cmake googletest)
provides=(libClipper2.so libClipper2Z.so)
source=("https://github.com/AngusJohnson/Clipper2/archive/refs/tags/Clipper2_$pkgver.tar.gz")
sha256sums=('2a3693aceab4aed3e39b743e038d87701acc53cf05ed7b2013aab3e0aec5287e')

_srcdir="Clipper2-Clipper2_$pkgver"

build() {
	cmake -S "$_srcdir"/CPP -B build \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo	\
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DCLIPPER_HI_PRECISION=ON		\
		-DCLIPPER2_UTILS=ON			\
		-DCLIPPER2_EXAMPLES=OFF			\
		-DCLIPPER2_TESTS=ON			\
		-DUSE_EXTERNAL_GTEST=ON			\
		-DBUILD_SHARED_LIBS=ON			\
		-DCLIPPER2_USINGZ=ON

	cmake --build build
}

check() {
	ctest --test-dir build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	_install_license_ "$_srcdir"/LICENSE
}
