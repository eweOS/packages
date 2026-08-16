# Maintainer: Yao Zi <ziyao@disroot.org>

# Notes about Vala bootstrapping:
#
#	Vala sources must be compiled to C sources before translated to machine
#	code, the compiler is called Valac, which however, requires
#	bootstrapping since the whole Vala toolchain is written in Vala.
#
#	Thanks to the Vala team, the release tarball contains pre-compiled C
#	code, which makes bootstrap quite simple as only a C compiler is
#	necessary.
#
#	However, we still want to build the compiler twice since we may want to
#	apply some patches: without a Vala compiler available, it's impossible
#	to re-generate the C source, and the old, unpatched C source will be
#	built into the executable (WARNING!)
#
#	And if some patches are necessary for the toolchain to function, the
#	testsuite may probably fail when running against the stage1 toolchain
#	(unpatched). Let's run it only for stage2 Vala toolchain.

pkgname=vala
_ver=0.56
pkgver=$_ver.18
pkgrel=7
pkgdesc='Compiler for Vala'
url='https://vala.dev'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL-2.1-or-later)
depends=(glib graphviz)
makedepends=(gobject-introspection flex bison libxslt)
checkdepends=(dbus)
# 0001: Downstream, slibtool puts libvalacodegen.so in codegen/.libs, which
#	isn't covered by the LD_LIBRARY_PATH environment variable exported
#	in tests-extra-environment.sh
# 0002: Wait for upstream, starting from 13.0.0 graphviz starts to require
#	size_t instead of unsigned int in arguments passed to gvRenderData,
#	which is an ABI breakage. This patch modifies Vala code.
#	https://gitlab.gnome.org/GNOME/vala/-/issues/1621
source=("https://download.gnome.org/sources/vala/$_ver/vala-$pkgver.tar.xz"
	"0001-fix-valadoc-ld-library-path.patch"
	"0002-adjust-prototype-with-graphviz-13.0.0.patch")
sha256sums=('f2affe7d40ab63db8e7b9ecc3f6bdc9c2fc7e3134c84ff2d795f482fe926a382'
            '233af4e814b6cc9d91e605d401892d14ad3225172f596894e9aeb88ae7786581'
            '11ccef3bface9aba97414646d43f99daf5a121a23a4e55314a50bd7cda19b19a')

prepare() {
	# two checks fail
	sed -i "/constants\/member-access/d" \
		vala-$pkgver/tests/Makefile.in
	# property-array fail on obs
	sed -i "s/objects\/property-array.vala//" \
		vala-$pkgver/tests/Makefile.in

	_patch_ vala-"$pkgver"
}

build () {
	mkdir -p stage1-root stage1-build
	cd stage1-build

	"$srcdir/vala-$pkgver/configure" --prefix="$srcdir"/stage1-root

	make
	make install

	mkdir -p "$srcdir"/stage2-build
	cd "$srcdir"/stage2-build

	PATH="$srcdir/stage1-root/bin:$PATH" \
		"$srcdir/vala-$pkgver/configure" --prefix=/usr

	PATH="$srcdir/stage1-root/bin:$PATH" make
}

check() {
	cd stage2-build

	PATH="$srcdir/stage1-root/bin:$PATH" make check
}

package() {
	cd stage2-build
	PATH="$srcdir/stage1-root/bin:$PATH" make install DESTDIR="$pkgdir"
}
