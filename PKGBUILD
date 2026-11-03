# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=simdutf
pkgver=9.3.3
pkgrel=1
pkgdesc='SIMD-accelerated Unicode and Base64 routines'
url='https://simdutf.github.io/simdutf/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('Apache-2.0 OR MIT')
depends=(musl llvm-libs)
makedepends=(cmake python)
provides=(libsimdutf.so)
source=("https://github.com/simdutf/simdutf/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('441e374e8629bd8469f6d5cde9f0fa17ef3ad158aeb077791606d8aa73b565ef')

build() {
	cmake -S "$pkgname-$pkgver" -B build \
		-DSIMDUTF_CXX_STANDARD=20		\
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
