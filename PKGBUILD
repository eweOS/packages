# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=openal-soft
pkgver=1.24.1
pkgrel=1
pkgdesc='A software implementation of the OpenAL 3D audio API'
url='https://openal-soft.org'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD GPL2)
depends=(alsa-lib pipewire zlib-ng)
makedepends=(cmake ninja)
provides=(openal libopenal.so)
source=("https://github.com/kcat/openal-soft/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e1b6ec960e00bfed3d480330274b0f102dc10e4ae0dbb70fd9db80d6978165b1')

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
