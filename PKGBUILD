# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=nanosvg
_commit=ea6a6aca009422bba0dbad4c80df6e6ba0c82183
pkgver="20241219.${_commit:0:7}"
pkgrel=2
pkgdesc='Simple stupid SVG parser library'
url='https://github.com/memononen/nanosvg'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(Zlib)
depends=(musl)
makedepends=(cmake git)
source=("git+https://github.com/memononen/nanosvg.git#commit=$_commit")
sha256sums=('ebe0fa119da63f28e1e4df8194da732aa1071e378c1d95c2f3c49d9b2d995bb6')

build() {
	cmake -S "$pkgname" -B build \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo	\
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DBUILD_SHARED_LIBS=ON

	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
