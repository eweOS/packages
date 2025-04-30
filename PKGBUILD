# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=valgrind
pkgver=3.25.0
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
sha256sums=('295f60291d6b64c0d90c1ce645634bdc5361d39b0c50ecf9de6385ee77586ecc'
            'c2b346698755d9d2ea4f2b46c1a569bacf6ca82bdc14105f7057745150160a21')

prepare() {
	_patch_ valgrind-$pkgver

	cd valgrind-$pkgver
	autoreconf -iv
}

build () {
	cd valgrind-$pkgver

	case $CARCH in
		aarch64)	CFLAGS="$CFLAGS -mno-outline-atomics" ;;
		*)		;;
	esac

	export CFLAGS LDFLAGS="$LDFLAGS -fuse-ld=lld"
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
