# Maintainer: Yao Zi <me@ziyao.cc>

pkgbase=coin
pkgname=(coin coin-doc)
pkgver=4.0.10
pkgrel=1
pkgdesc='Coin3D core library'
url='https://www.coin3d.org/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-3-Clause)
depends=(musl expat libglvnd llvm-libs)
# boost is a build-time-only dependency.
makedepends=(cmake boost doxygen)
# Coin dlopens the dependencies by default
optdepends=(fontconfig freetype bzip2 openal-soft zlib-ng glu mozjs)
provides=(libCoin.so)
# 0001: Should be upstreamed, link to libOpenGL.so instead of libGL.so, since
#	EGL is supported and we don't need GLX API.
source=("https://github.com/coin3d/coin/releases/download/v$pkgver/coin-$pkgver-src.tar.gz"
	0001-Link-libOpenGL-instead-of-libGL.patch)
sha256sums=('13fe68831292e7e725e7db1c6909d2b4fe5802080474c229fcac14ddf6445188'
            '01deef30598a2c34ef3d8900e45979c056669e063c5fc3338971aaf47592e9ab')

prepare() {
	_patch_ "$pkgbase"
}

build() {
	# The testsuite wrongly checks existence for _*_SOURCE to detect the
	# system type, while musl doesn't define them by default.
	CFLAGS="$CFLAGS -D_POSIX_SOURCE" CXXFLAGS="$CXXFLAGS -D_POSIX_SOURCE" \
	cmake -S "$pkgbase" -B build \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo	\
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DOpenGL_GL_PREFERENCE=GLVND		\
		-DOPENGL_USE_GLES2=ON			\
		-DOPENGL_USE_OPENGL=ON			\
		-DOPENGL_USE_GLX=OFF			\
		-DCOIN_BUILD_SHARED_LIBS=ON		\
		-DCOIN_BUILD_TESTS=ON			\
		-DCOIN_BUILD_DOCUMENTATION=ON		\
		-DCOIN_BUILD_EXAMPLES=OFF		\
		-DCOIN_BUILD_DOCUMENTATION_MAN=ON	\
		-DCOIN_BUILD_DOCUMENTATION_QTHELP=OFF	\
		-DCOIN_BUILD_DOCUMENTATION_CHM=OFF	\
		-DUSE_EXTERNAL_EXPAT=ON			\
		-DUSE_SUPERGLU=OFF			\
		-DCOIN_USE_CPACK=OFF			\
		-DCOIN_BUILD_GLX=OFF			\
		-DCOIN_BUILD_EGL=ON

	cmake --build build

	DESTDIR="$srcdir/tmpinstall" cmake --install build
	cd tmpinstall
	_pick_ coin-doc usr/share/doc
}

check() {
	ctest --test-dir build
}

package_coin() {
	mv tmpinstall/* "$pkgdir"
	_install_license_ "$pkgbase"/COPYING
}

package_coin-doc() {
	depends=()
	optdepends=()
	pkgdesc+=' (Documentation)'

	mv pkgs/coin-doc/* "$pkgdir"
	_install_license_ "$pkgbase"/COPYING
}
