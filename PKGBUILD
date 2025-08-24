# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=opencascade
pkgver=7.9.1
_ver=${pkgver//./_}
pkgrel=1
pkgdesc='Full-scale 3D geometry library'
url='https://dev.opencascade.org/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL-2.1-or-later)
depends=(musl freetype2 libglvnd rapidjson onetbb tcl fontconfig)
makedepends=(cmake eigen)
# 0001: Downstream, drop usage of glibc-specific execinfo.h
source=("https://github.com/Open-Cascade-SAS/OCCT/archive/refs/tags/V$_ver.tar.gz"
	0001-no-execinfo-backtrace.patch
	0002-OpenGL-GraphicsDriver-drop-unnecessary-X11-include.patch
	0003-Link-to-OpenGL-instead-of-GL-when-GLX-disabled.patch)
sha256sums=('de442298cd8860f5580b01007f67f0ecd0b8900cfa4da467fa3c823c2d1a45df'
            'c5c5dd03937a8c060efe06e5487c1b8893eb719b2be1019d00dd0a4647834dd5'
            '6543a3f14bc4145122bb1e7061db306223d82f26e7d8a6d700a92f8a3b0af461'
            'ca5817e8e294719beb0612e4a0d59237b7a44eb8caeb1d70b78bbb1574972704')

prepare() {
	_patch_ "OCCT-$_ver"
}

build() {
	# OpenCascade isn't compatible with FFmpeg 7.0
	cmake -S "OCCT-$_ver" -B build \
		-DCMAKE_BUILD_TYPE=Release		\
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DUSE_MMGR_TYPE=NATIVE			\
		-DBUILD_LIBRARY_TYPE=Shared		\
		-DINSTALL_TEST_CASES=OFF		\
		-DBUILD_RELEASE_DISABLE_EXCEPTIONS=OFF	\
		-DINSTALL_SAMPLES=OFF			\
		-DUSE_TK=OFF				\
		-DUSE_FREETYPE=ON			\
		-DUSE_FREEIMAGE=OFF			\
		-DUSE_FFMPEG=OFF			\
		-DUSE_OPENVR=OFF			\
		-DUSE_RAPIDJSON=ON			\
		-DUSE_DRACO=OFF				\
		-DUSE_TBB=ON				\
		-DUSE_EIGEN=ON				\
		-DUSE_OPENGL=ON				\
		-DUSE_GLES2=ON				\
		-DUSE_XLIB=OFF

	cmake --build build
}

check() {
	ctest --test-dir build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
