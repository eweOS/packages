# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=graphviz
pkgver=12.0.0
pkgrel=1
pkgdesc='Open source graph visualization software.'
url='https://graphviz.org/'
arch=(x86_64 aarch64 riscv64)
license=(non)
depends=(musl expat libjpeg librsvg libwebp libpng freetype2 pango cairo glib libltdl)
makedepends=(lua54 swig flex bison)
source=("https://gitlab.com/api/v4/projects/4207231/packages/generic/graphviz-releases/$pkgver/graphviz-$pkgver.tar.gz")
sha256sums=('4f61f3097c0a7c518780d072dd358361fc555317b4599c1e561267f0d6eb3ac6')

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
