# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=graphviz
pkgver=9.0.0
pkgrel=2
pkgdesc='Open source graph visualization software.'
url='https://graphviz.org/'
arch=(x86_64 aarch64 riscv64)
license=(non)
depends=(musl expat libjpeg librsvg libwebp libpng freetype2 pango cairo glib libltdl)
makedepends=(lua54 swig flex bison)
source=("https://gitlab.com/api/v4/projects/4207231/packages/generic/graphviz-releases/$pkgver/graphviz-$pkgver.tar.gz")
sha256sums=('3547d90dc80f0ac4cd900ec1a824c319a479c1e8f43883451de1aff293d7a07b')

build () {
	cd graphviz-$pkgver
	./configure --prefix=/usr	\
		--sysconfdir=/etc	\
		--disable-man-pdfs	\
		--enable-libltdl	\
		--enable-swig		\
		--enable-sharp=no	\
		--enable-d=no		\
		--enable-go=no		\
		--enable-guilde=no	\
		--enable-java=no	\
		--enable-javascript=no	\
		--enable-lua=yes	\
		--enable-ocaml=no	\
		--enable-perl=yes	\
		--enable-php=no		\
		--enable-python=no	\
		--enable-python3=no	\
		--enable-r=no		\
		--enable-r=no		\
		--enable-tcl=no		\
		--with-gdk=no		\
		--with-gtk=no		\
		--with-x=no
	make
}

check() {
	cd graphviz-$pkgver
	make check
}

package() {
	cd graphviz-$pkgver
	make install DESTDIR=$pkgdir
}
