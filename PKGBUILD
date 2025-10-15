# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=xfsprogs
pkgver=6.15.0
pkgrel=2
pkgdesc='Utilities for managing XFS filesystem'
url='https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-only LGPL-2.1-only)
depends=(musl icu libinih liburcu)
makedepends=(linux-headers)
source=("https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/snapshot/xfsprogs-dev-$pkgver.tar.gz")
sha256sums=('80c46be152feb49c45cc7936af959c0f7e1e7fd8e7aef4ca1bad1479c1b81af5')
_srcdir="$pkgname-dev-$pkgver"

prepare() {
	cd "$_srcdir"

	make configure
	cp /usr/share/autoconf/build-aux/config.{guess,sub} .
}

build() {
	cd "$_srcdir"

	export CFLAGS="$CFLAGS -DOVERRIDE_SYSTEM_STATX -DSTATX__RESERVED=0x80000000U"
	./configure --prefix=/usr \
		--enable-shared=yes	\
		--enable-editline=no	\
		--enable-scrub=yes	\
		--enable-libicu=yes	\
		--sbindir=/usr/bin	\
		--enable-lib64=no
	make NEED_INTERNAL_STATX=yes
}

package() {
	cd "$_srcdir"

	make install DESTDIR="$pkgdir" PKG_USER=root PKG_GROUP=root
}
