# Maintainer: Yao Zi <ziyao@disroot.org>

pkgbase=wxwidgets
pkgname=(wxwidgets-gtk3)	# TODO: package the QT variant
pkgver=3.3.1
pkgrel=1
pkgdesc='Cross-Platform C++ GUI Library'
url='Cross-Platform'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL-2.0-or-later WITH WxWindows-exception-3.1)
depends=(musl gtk3 libjpeg libpng libtiff libwebp zlib-ng expat libsecret
	 sdl2 libnotify gstreamer pcre2 nanosvg)
makedepends=(gstreamer-devel gst-plugins-bad cmake samurai)
# 0001: Taken from Alpine Linux, define macro wrappers to provide _l variants
#	for string functions.
#	https://git.alpinelinux.org/aports/diff/community/wxwidgets/musl-locale-l.patch?id=cc5b7b05c04630cc1cb3f396604630c98d3b3141
# 0002: Should be upstreamed, allow OpenGL to be used without GLX
source=("https://github.com/wxWidgets/wxWidgets/releases/download/v$pkgver/wxWidgets-$pkgver.tar.bz2"
	0001-Adapt-musl-locale-l.patch
	0002-build-cmake-Check-for-OpenGL_OpenGL_FOUND-when-searc.patch)
sha256sums=('f936c8d694f9c49a367a376f99c751467150a4ed7cbf8f4723ef19b2d2d9998d'
            '69f2dc1a98fbddf338e301f5d45fdd0a84d3692ec48a83b8f29c39b9ecee9d82'
            'f4632886317624003b2c776a24ade28b83489a24dae284fb5e133c9e8f3ce3bd')
_srcdir="wxWidgets-$pkgver"

prepare() {
	_patch_ "$_srcdir"
}

build() {
	# TODO: Enable Webview
	#	Enable spellcheck (require gspell)
	cmake -S "$_srcdir" -B build -G Ninja \
		-DCMAKE_BUILD_TYPE=Release	\
		-DCMAKE_INSTALL_PREFIX=/usr	\
		-DwxUSE_SYS_LIBS=ON		\
		-DwxUSE_WEBVIEW=OFF		\
		-DwxUSE_SPELLCHECK=OFF		\
		-DwxUSE_NANOSVG="sys"
	cmake --build build
}

package_wxwidgets-gtk3() {
	DESTDIR="$pkgdir" cmake --install build
	_install_license_ "$_srcdir"/docs/licence.txt
}
