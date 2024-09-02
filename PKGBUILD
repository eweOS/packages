# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=graphviz
pkgver=12.1.0
pkgrel=1
pkgdesc='Open source graph visualization software.'
url='https://graphviz.org/'
arch=(x86_64 aarch64 riscv64)
license=(EPL-1.0)
depends=(musl expat libjpeg librsvg libwebp libpng freetype2 pango cairo glib
	 libltdl)
makedepends=(lua54 swig flex bison)
install=install
source=("https://gitlab.com/api/v4/projects/4207231/packages/generic/graphviz-releases/$pkgver/graphviz-$pkgver.tar.gz"
	"graphviz-update-config.hook")
sha256sums=('c14c48c1e014b35bc2d8d5312ad59436a01056d0f2922461e097997614d127cb'
            '0bcd6093bb981eb85df76fe2b34237782cf4f54ad24def4b0feb8ad1e1263bcd')

build () {
	cd graphviz-"$pkgver"
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
	cd graphviz-"$pkgver"
	make check
}

package() {
	install -Dm644 graphviz-update-config.hook \
		"$pkgdir"/usr/share/libalpm/hooks/graphviz-update-config.hook
	cd graphviz-"$pkgver"
	make install DESTDIR="$pkgdir"
}
