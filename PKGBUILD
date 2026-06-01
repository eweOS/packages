# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=simdutf
pkgver=9.0.0
pkgrel=1
pkgdesc='SIMD-accelerated Unicode and Base64 routines'
url='https://simdutf.github.io/simdutf/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('Apache-2.0 OR MIT')
depends=(musl llvm-libs)
makedepends=(cmake python)
provides=(libsimdutf.so)
source=("https://github.com/simdutf/simdutf/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fd2ce975f29809a975a8da8843cfb3a7265af3f71be548f199d23cf65e101764')

build() {
	cmake -S "$pkgname-$pkgver" -B build \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo	\
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DBUILD_SHARED_LIBS=ON			\
		-DSIMDUTF_TESTS=ON			\
		-DSIMDUTF_ATOMIC_BASE64_TESTS=ON	\
		-DSIMDUTF_BENCHMARKS=OFF		\
		-DSIMDUTF_TOOLS=ON			\
		-DSIMDUTF_ICONV=ON			\
		-DSIMDUTF_FUZZERS=OFF			\
		-DSIMDUTF_COVERAGE=OFF			\
		-DSIMDUTF_INTERNAL_TESTS=OFF		\
		-DSIMDUTF_LOGGING=OFF			\
		-DFUZZING_BUILD_MODE_UNSAFE_FOR_PRODUCTION=OFF

	cmake --build build
}

check() {
	ctest --test-dir build -j$(JOBS) --timeout 600
}

package() {
	DESTDIR="$pkgdir" cmake --install build

	install -Dm644 "$pkgname-$pkgver"/LICENSE-{APACHE,MIT} \
		-t "$pkgdir/usr/share/licenses/$pkgname"
}
