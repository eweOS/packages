# Maintainer: Yao Zi <me@ziyao.cc>

pkgbase=webkit2gtk
# For the version (ABI?) suffix:
#	Soup2 + GTK3:		4.0
#	Soup3 + GTK3:		4.1
#	Soup3 + GTK4:		6.0
# We must build at least two separate passes for 4.1 and 6.0 ABI.
# Split HTML documentation since it takes over 40MiB (25% of the binary
# package size).
pkgname=(webkit2gtk-4.1 webkit2gtk-6.0
	 webkit2gtk-4.1-docs webkit2gtk-6.0-docs)
pkgver=2.53.2
pkgrel=1
pkgdesc='GTK port of the WebKit rendering engine'
url='https://webkitgtk.org/releases/webkitgtk-2.53.2.tar.xz'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-2-Clause  LGPL-2.0-or-later)
depends=(musl llvm-libs xdg-dbus-proxy gstreamer glib icu zlib-ng
	 at-spi2-core libavif cairo libdrm libepoxy expat flite fontconfig
	 freetype2 mesa libgcrypt gdk-pixbuf libgpg-error gstreamer
	 gst-plugins-base harfbuzz harfbuzz-icu hyphen libjpeg libjxl
	 pango libpng libseccomp libsecret libsoup3 libtasn1 wayland libwebp
	 woff2 libxml2 libxslt lcms2 bubblewrap)
makedepends=(cmake ruby unifdef ninja gstreamer-devel gobject-introspection
	     gtk3 gtk4 gi-docgen gperf wayland-protocols)
# 0001: Downstream, Use system allocator instead of bmalloc on all
#	architectures.
# 0002: Should be upstreamed, add missing include of system_error header to fix
#	build with libc++.
# 0003: backport
#       fix error: no member named 'pageSize' in namespace 'WTF'
#       https://github.com/WebKit/WebKit/pull/64367
source=("https://webkitgtk.org/releases/webkitgtk-$pkgver.tar.xz"
	0001-Turn-on-system-malloc.patch
	0002-contextextensions-add-missing-system_error-include.patch
        0003-fix-no-member-pagesize.patch)
sha256sums=('79f03692f65149685c32c64c66c6f4696c91e652a2abfab0614532da323b8bb9'
            '24bcf3e2eaa9b5bd00b56b24eb856551d2e39d4d552b81c455972e95a216b215'
            '1dafcb39ebba7cb663e79bc7447ceb723b98bb04d7e08ea76c06fef1b38f9bd3'
            '54b07b6f6efbf0f59fcb4dc62fd37aed6c0899b758610bc0d16f8b76e00750cd')

prepare() {
	_patch_ "webkitgtk-$pkgver"
}

build() {
	# TODO:
	#	ENABLE_GAMEPAD: Missing libmanette
	#	ENABLE_SPELLCHECK: Missing enchant
	#	USE_SYSTEM_SYSPROF_CAPTURE: Is it possible to devendor?
	#	USE_GSTREAMER_WEBRTC: Missing gstreamer webrtcbin
	local _args=(
		-DCMAKE_BUILD_TYPE=Release
		-DCMAKE_INSTALL_PREFIX=/usr
		-DCMAKE_INSTALL_LIBEXECDIR=lib
		-DUSE_OPENMP=OFF
		-DPORT=GTK
		-DUSE_APPLE_ICU=OFF
		-DUSE_LD_LLD=OFF
		-DENABLE_DOCUMENTATION=ON
		-DENABLE_INTROSPECTION=ON
		-DENABLE_JOURNALD_LOG=OFF
		-DENABLE_QUARTZ_TARGET=OFF
		-DENABLE_WAYLAND_TARGET=ON
		-DENABLE_X11_TARGET=OFF
		-DUSE_LIBBACKTRACE=OFF
		-DENABLE_SPELLCHECK=OFF
		-DENABLE_GAMEPAD=OFF
		-DUSE_SYSTEM_SYSPROF_CAPTURE=NO
		-DENABLE_SPEECH_SYNTHESIS=ON
		-DUSE_GSTREAMER_WEBRTC=OFF
	)

	msg2 "Building GTK3 variant"
	cmake -S "webkitgtk-$pkgver" -B build-gtk3 -G Ninja \
		-DUSE_GTK4=OFF		\
		"${_args[@]}"

	cmake --build build-gtk3 -j"$JOBS"

	msg2 "Building GTK4 variant"
	cmake -S "webkitgtk-$pkgver" -B build-gtk4 -G Ninja \
		-DUSE_GTK4=ON		\
		"${_args[@]}"
	cmake --build build-gtk4 -j"$JOBS"
}

do_install_license() {
	cd "webkitgtk-$pkgver"/Source

	_install_license_ WebCore/LICENSE-LGPL-2	WebCore-LGPL-2
	_install_license_ WebCore/LICENSE-LGPL-2.1	WebCore-LGPL-2.1
	_install_license_ WebCore/LICENSE-APPLE		WebCore-APPLE
	_install_license_ JavaScriptCore/COPYING.LIB	JSCore-LIB
}

package_webkit2gtk-4.1() {
	depends+=(gtk3)
	provides=(libjavascriptcoregtk-4.1.so libwebkit2gtk-4.1.so)
	pkgdesc+=' (GTK 3 and Soup 3 variant)'

	DESTDIR="$pkgdir" cmake --install build-gtk3

	do_install_license

	mv "$pkgdir"/usr/share/doc "$srcdir/$pkgname-docs"
}

package_webkit2gtk-6.0() {
	depends+=(gtk4)
	provides=(libjavascriptcoregtk-6.0.so libwebkitgtk-4.1.so)
	pkgdesc+=' (GTK 4 and Soup 3 variant)'

	DESTDIR="$pkgdir" cmake --install build-gtk4
	do_install_license

	# Avoid conflict with webkit2gtk-4.1
	mv "$pkgdir"/usr/bin/{WebKitWebDriver,WebKitWebDriver-6.0}

	mv "$pkgdir"/usr/share/doc "$srcdir/$pkgname-docs"
}

package_webkit2gtk-4.1-docs() {
	pkgdesc+=' (documentation for GTK 3 and Soup 3 variant)'
	depends=()

	mkdir -p "$pkgdir/usr/share"
	mv "$srcdir/$pkgname" "$pkgdir/usr/share/doc"
}

package_webkit2gtk-6.0-docs() {
	pkgdesc+=' (documentation for GTK 4 and Soup 3 variant)'
	depends=()

	mkdir -p "$pkgdir/usr/share"
	mv "$srcdir/$pkgname" "$pkgdir/usr/share/doc"
}
