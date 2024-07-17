# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=valgrind
pkgver=3.23.0
pkgrel=1
pkgdesc='An instrumentation framework for building dynamic analysis tools.'
url='https://valgrind.org/'
arch=(x86_64 aarch64)
license=(GPL-2.0-or-later)
depends=(musl)
makedepends=(lld)
options=(!strip)
source=("https://sourceware.org/pub/valgrind/valgrind-$pkgver.tar.bz2"
	"remove-libgcc.patch")
sha256sums=('c5c34a3380457b9b75606df890102e7df2c702b9420c2ebef9540f8b5d56264d'
            'c2b346698755d9d2ea4f2b46c1a569bacf6ca82bdc14105f7057745150160a21')

prepare() {
	_patch_ valgrind-$pkgver

	cd valgrind-$pkgver
	autoreconf -iv
}

build () {
	cd valgrind-$pkgver
	export LDFLAGS="$LDFLAGS -fuse-ld=lld"
	./configure --prefix=/usr \
		--libexecdir=/usr/lib
	make
}

# check currently fails to build
# check() {
#	cd valgrind-$pkgver
#	make check
# }

package() {
	cd valgrind-$pkgver
	make install DESTDIR=$pkgdir

	if check_option debug n; then
		find $pkgdir/usr/lib/valgrind -type f -executable \
			-exec strip {} \;
	fi
}
