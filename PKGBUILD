# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=graphviz
pkgver=15.1.0
pkgrel=1
pkgdesc='Open source graph visualization software.'
url='https://graphviz.org/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(EPL-1.0)
depends=(musl expat gd libjpeg librsvg libwebp libpng freetype2 pango cairo glib
	 libltdl libxml2)
makedepends=(lua54 swig perl python qt6-base)
optdepends=('lua: lua bindings'
            'perl: perl bindings'
            'python: python bindings'
            'tcl: tcl bindings'
            'qt6-base: gvedit')
install=install
source=("https://gitlab.com/api/v4/projects/4207231/packages/generic/graphviz-releases/$pkgver/graphviz-$pkgver.tar.gz"
	"graphviz-update-config.hook")
sha256sums=('7aee43f186d6d72d32cbdb243baaa98880d4e709a2937c1ccf0dcc61abd79ec2'
            '0bcd6093bb981eb85df76fe2b34237782cf4f54ad24def4b0feb8ad1e1263bcd')

prepare () {
    cd graphviz-"$pkgver"
    cp /usr/share/autoconf/build-aux/{config.guess,config.sub,install-sh} ./config/
}

build () {
	cd graphviz-"$pkgver"
	./configure --prefix=/usr	\
		--sysconfdir=/etc	\
		--disable-man-pdfs	\
		--enable-libltdl	\
		--enable-swig		\
		--enable-sharp=no	\
		--enable-d=no		\
		--enable-go=yes		\
		--enable-guilde=no	\
		--enable-java=no	\
		--enable-javascript=no	\
		--enable-lua=yes	\
		--enable-ocaml=no	\
		--enable-perl=yes	\
		--enable-php=no		\
		--enable-python=no	\
		--enable-python3=yes	\
		--enable-r=no		\
		--enable-r=no		\
		--enable-tcl=yes	\
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
