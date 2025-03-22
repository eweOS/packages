# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libnfs
pkgver=6.0.2
pkgrel=1
pkgdesc='NFS client library.'
url='https://github.com/sahlberg/libnfs'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-2-Clause LGPL-2.1-or-later GPL-3.0-or-later)
depends=(musl krb5)
provides=(libnfs.so)
# 0001, 0002, 0003: Backport, fixing compiler warnings with -Wcast-align
source=("https://github.com/sahlberg/libnfs/archive/refs/tags/libnfs-$pkgver.tar.gz"
	"0001-socket-use-void-cast-to-allow-compile.patch::https://github.com/sahlberg/libnfs/commit/a01d42a0d9682d3e506d3c78680db8c7d158fe88.patch"
	"0002-change-rpc_pdu-zdr_decode_buf-to-void.patch::https://github.com/sahlberg/libnfs/commit/2849838d0f658e4d2b2104040a64aa61ea0b4c93.patch"
	"0003-Fix-cast-align-for-riscv64.patch::https://github.com/sahlberg/libnfs/pull/522/commits/cabe77af35ced8a5a23d45076bab045c8479b693.patch")
sha256sums=('4e5459cc3e0242447879004e9ad28286d4d27daa42cbdcde423248fad911e747'
            '7987b796590327325fb0afcf3f5121ac339986ddf0069d73e96240a9ded618b0'
            'ade8623b5e1e3a96759e7adfaba8125486dd1e7c59bbeb8113603de17a06d4d3'
            '5a02192b927095812b73773da414c71a37469a08975b6e09c6da4ded37f53101')

prepare() {
	_patch_ "libnfs-libnfs-$pkgver"
}

build () {
	cd "libnfs-libnfs-$pkgver"
	autoreconf -ivf

	./configure --prefix=/usr	\
		--enable-shared		\
		--enable-utils		\
		--disable-examples	\
		--enable-pthread	\
		--enable-year2038

	make
}

check() {
	cd "libnfs-libnfs-$pkgver"
	make check
}

package() {
	cd "libnfs-libnfs-$pkgver"
	make install DESTDIR="$pkgdir"
}
