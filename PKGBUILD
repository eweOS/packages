# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=manifold
pkgver=3.4.0
pkgrel=2
pkgdesc='Geometry library for creating and operating on manifold triangle meshes'
url='https://github.com/elalish/manifold'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(Apache-2.0)
depends=(musl llvm-libs onetbb clipper2 assimp)
makedepends=(cmake googletest)
provides=(libmanifold.so libmanifoldc.so)
source=("https://github.com/elalish/manifold/releases/download/v$pkgver/manifold-$pkgver.tar.gz")
sha256sums=('03fb429c2080363cadc6e9a34ecd6ba7948c74d99baffb3df381546effaa6907')

build() {
	# TODO: enable python binding (require nanobind)
	cmake -S "$pkgname-$pkgver" -B build \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo	\
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DBUILD_SHARED_LIBS=ON			\
		-DMANIFOLD_TEST=ON			\
		-DMANIFOLD_PAR=ON			\
		-DMANIFOLD_CBIND=ON			\
		-DMANIFOLD_PYBIND=OFF			\
		-DMANIFOLD_USE_BUILTIN_TBB=OFF		\
		-DMANIFOLD_USE_BUILTIN_CLIPPER2=OFF	\
		-DASSIMP_ENABLE=ON

	cmake --build build
}

check() {
	ctest --test-dir build -j "$JOBS"
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
