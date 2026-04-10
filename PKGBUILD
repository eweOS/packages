# Maintainer: Yao Zi <ziyao@disroot.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=libfyaml
pkgver=0.9.6
pkgrel=1
pkgdesc='Fully feature complete YAML parser and emitter'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://pantoniou.github.io/libfyaml/'
license=(MIT)
depends=(musl)
makedepends=(git linux-headers)
checkdepends=(check)
provides=(libfyaml.so)
# CMakeLists.txt fetches specific commit of yaml-test-suite and JSONTestSuite
# 0001: Downstream, look for shared target Check::checkShared instead of the
#	static Check::check during configuration, since eweOS doesn't ship the
#	static version.
source=("git+https://github.com/pantoniou/libfyaml#tag=v$pkgver"
	"git+https://github.com/yaml/yaml-test-suite"
	"git+https://github.com/nst/JSONTestSuite"
	0001-Look-for-shared-check-library.patch)
sha256sums=('6e3066fc231e83fe7899c3ccd8ed8931cb46461ffb25e73fcab89a35affaeccd'
            'SKIP'
            'SKIP'
            '2c902bb72243928f2978fe14e4809608a485d3306afe0b3e6ead406442ec63b3')

prepare() {
  _patch_ $pkgname
}

build() {
  cmake -S $pkgname -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -DENABLE_LIBCLANG=OFF \
    -DBUILD_TESTING=ON \
    -DTESTSUITEURL="$srcdir/yaml-test-suite" \
    -DJSONTESTSUITEURL="$srcdir/JSONTestSuite"
  cmake --build build
}

check() {
  ctest --test-dir build -j"$JOBS" --verbose
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  _install_license_ $pkgname/LICENSE
}
