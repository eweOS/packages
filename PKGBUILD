# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=xfsprogs
pkgver=7.1.0
pkgrel=1
pkgdesc='Utilities for managing XFS filesystem'
url='https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-only LGPL-2.1-only)
depends=(musl icu libinih liburcu)
makedepends=(linux-headers)
source=("https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/snapshot/xfsprogs-dev-$pkgver.tar.gz")
sha256sums=('fdd8465d55d56f01ea5148a24f126f745627e9e430897a1186f15b7bb14f5a99')
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
