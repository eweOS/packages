# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=glew
pkgver=2.2.0
pkgrel=1
pkgdesc='OpenGL extension loading library for C/C++'
url='https://github.com/nigels-com/glew'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-3-Clause)
depends=(musl libglvnd)
provides=(libGLEW.so)
# 0001: Backport, link OpenGL instead of GLX
#	https://github.com/nigels-com/glew/commit/8e2e31e69bb655717bea6c81a2d36b3228acdae5
# 0002: Downstream, define GLEW_NO_X11 to disable X11 codepath.
# 0003: Downstream, install libraries to lib instead of lib64
# 0001, 0002 Should be removed when GLEW makes a new release.
source=("https://github.com/nigels-com/glew/releases/download/glew-$pkgver/glew-$pkgver.tgz"
	0001-Add-support-for-building-against-vendor-neutral.patch
	0002-disable-x11-for-glvnd.patch
	0003-dont-install-to-lib64.patch)
sha256sums=('d4fc82893cfb00109578d0a1a2337fb8ca335b3ceccf97b97e5cc7f08e4353e1'
            '27bfa5fd5047603d179ef0fe46601eb10fb3fb522b9736a5f10fc33ea9b5ec04'
            '8df8ebd333921fff2909b64ffdd36615b128f757b3cd5d1ef16ee044c5973663'
            '8df4e1f2e132bfe73168c8b8b8e46a0d128395567ebbc76c0bbc2b1b3cafb5df')
_srcdir="glew-$pkgver"

prepare() {
	_patch_ "$_srcdir"
}

build() {
	cd "$_srcdir"

	make SYSTEM=linux-egl-glvnd STRIP=
}

package() {
	cd "$_srcdir"

	make install SYSTEM=linux-egl-glvnd DESTDIR="$pkgdir"
	_install_license_ LICENSE.txt

	# glew 2.2.0 doesn't automatically install eglew.h
	install -Dm644 include/GL/eglew.h \
		-t "$pkgdir/usr/include/GL/"
}
