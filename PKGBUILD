# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=podofo
pkgver=1.0.1
pkgrel=1
pkgdesc='A C++ library to work with the PDF file format'
arch=(x86_64 aarch64 riscv64 loongarch64)
url="http://$pkgname.sourceforge.net"
_url="https://github.com/$pkgname/$pkgname"
license=(LGPL-2.1-only)
depends=(musl
	 llvm-libs
	 fontconfig
         freetype2
         libidn
         libjpeg-turbo
         libpng
         libtiff
         libxml2
         lua
         openssl
         zlib)
makedepends=(cmake git)
_resource_commit=a5d78b823e9b902d89b06b2d4d81a2e801cd96c4
provides=(libpodofo.so)
# 0001: under review, fix compatibility with LLVM 20
#	https://github.com/podofo/podofo/pull/269
source=("git+$_url.git#tag=$pkgver"
	"0001-private-charconv-Don-t-define-from_chars-for-libc-20.patch"
	"git+https://github.com/podofo/podofo-resources.git#commit=$_resource_commit")
sha256sums=('a03e170dea9d269c635b023927ba9350eaedad64d346ef6e0a044ed97850a93c'
            'ef0d491729e5c2b86288920a3556a2a5cc77b691cc7b1a58b04c275f0b341b66'
            '123ae670e936a5fdb18ad653a3576da23e6cced2e188d36f65f98a07c1a56e00')

prepare() {
	_patch_ "$pkgname"

	cd "$pkgname"
	git config submodule.extern/resources.url "$srcdir/podofo-resources"
	git -c protocol.file.allow=always submodule update --init --recursive \
		extern/resources
}

build() {
	cmake -B build -S "$pkgname" \
		-D CMAKE_INSTALL_PREFIX=/usr \
		-D PODOFO_HAVE_JPEG_LIB=True \
		-D PODOFO_HAVE_PNG_LIB=True \
		-D PODOFO_HAVE_TIFF_LIB=True
	cmake --build build
}

# TODO: Enable tests (some of them currently fail)

package() {
	DESTDIR="$pkgdir" cmake --install build
}
