# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=glew
pkgver=2.3.1
pkgrel=1
pkgdesc='OpenGL extension loading library for C/C++'
url='https://github.com/nigels-com/glew'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-3-Clause)
depends=(musl libglvnd)
provides=(libGLEW.so)
# 0002: Downstream, define GLEW_NO_X11 to disable X11 codepath.
# 0003: Downstream, install libraries to lib instead of lib64
# 0001, 0002 Should be removed when GLEW makes a new release.
source=("https://github.com/nigels-com/glew/releases/download/glew-$pkgver/glew-$pkgver.tgz"
	0002-disable-x11-for-glvnd.patch
	0003-dont-install-to-lib64.patch)
sha256sums=('b64790f94b926acd7e8f84c5d6000a86cb43967bd1e688b03089079799c9e889'
            '4be38c39486f4252902de16b0d7aa6c52d70e197ecbaa2509fc9724ef7d02ab7'
            '8df4e1f2e132bfe73168c8b8b8e46a0d128395567ebbc76c0bbc2b1b3cafb5df')
_srcdir="glew-$pkgver"

prepare() {
	_patch_ "$_srcdir"
}

build() {
	cd "$_srcdir"

	make SYSTEM=linux-egl-glvnd STRIP= GLEW_PREFIX=/usr GLEW_DEST=/usr
}

package() {
	cd "$_srcdir"

	make install SYSTEM=linux-egl-glvnd DESTDIR="$pkgdir" GLEW_PREFIX=/usr GLEW_DEST=/usr
	_install_license_ LICENSE.txt

	# glew 2.2.0 doesn't automatically install eglew.h
	install -Dm644 include/GL/eglew.h \
		-t "$pkgdir/usr/include/GL/"
}
