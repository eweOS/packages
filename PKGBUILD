# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=openal-soft
pkgver=1.23.1
pkgrel=2
pkgdesc='A software implementation of the OpenAL 3D audio API'
url='https://openal-soft.org'
arch=(x86_64 aarch64 riscv64)
license=(BSD GPL2)
depends=(alsa-lib pipewire zlib-ng)
makedepends=(cmake ninja)
provides=(openal)
source=("https://github.com/kcat/openal-soft/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('dfddf3a1f61059853c625b7bb03de8433b455f2f79f89548cbcbd5edca3d4a4a')

build () {
	cmake openal-soft-$pkgver -B build -G Ninja \
		-DCMAKE_BUILD_TYPE=Release		\
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DCMAKE_INSTALL_LIBDIR=lib		\
		-DALSOFT_BACKEND_OSS=OFF		\
		-DALSOFT_REQUIRE_ALSA=ON		\
		-DALSOFT_BACKEND_JACK=OFF		\
		-DALSOFT_BACKEND_SDL2=OFF		\
		-DALSOFT_BACKEND_WAVE=ON		\
		-DALSOFT_REQUIRE_PIPEWIRE=ON		\
		-DALSOFT_BACKEND_PULSEAUDIO=OFF		\
		-DALSOFT_EXAMPLES=OFF			\
		-DALSOFT_INSTALL_EXAMPLES=OFF
	cmake --build build
}

# no check

package() {
	DESTDIR=$pkgdir cmake --install build
	cd openal-soft-$pkgver
	_install_license_ BSD-3Clause BSD
	_install_license_ COPYING GPL2
}
