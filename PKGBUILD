# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=tftp-hpa
pkgver=5.3
pkgrel=2
pkgdesc='TFTP server ported to Linux'
url='https://git.kernel.org/pub/scm/network/tftp/tftp-hpa.git'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-3-Clause)
depends=(musl readline)
backup=(etc/conf.d/tftpd.conf)
# 0001: Downstream, check socklen_t in sys/socket.h in addtion to sys/types.h,
#	where the former is specified by POSIX.
#
#	This is already fixed in upstream in commit fefaa2cc5c2a ("autoconf:
#	modernize and modularize"), but there hasn't been a release yet.
source=("https://git.kernel.org/pub/scm/network/tftp/tftp-hpa.git/snapshot/tftp-hpa-$pkgver.tar.gz"
	"tftpd.service"
	"tftpd.tmpfiles"
	"tftpd.conf"
	0001-configure.ac-check-socklen_t-in-socket.h.patch)
sha256sums=('6064caa87435040181e4493b82a19fef5aa918f0e25d28ad2c3344c38e0d5a26'
            '3ca9451f963f3f570ac0e63a8f9bb3e927d4df063779b39a31a4c06f7b163d23'
            '7d252c4680f8929807a18aac57db4ab45c8fb6ce5f8a733b5dc1ad3600fec26b'
            'c84efa2fc0b3f86cf7b00e2d1740432a37b6c8c6e7800e28bcfea2a05a471492'
            '93184805e3fa25301dcc15f1bcb92eb4a292d0ef6fdc5cd93eec7bad3d8bd5f2')

prepare() {
	_patch_ "$pkgname-$pkgver"
}

build () {
	cd "$pkgname-$pkgver"

	./autogen.sh
	./configure --prefix=/usr \
		--sbindir=/usr/bin
	make
}

# No checks

package() {
	cd "$pkgname-$pkgver"

	make install INSTALLROOT="$pkgdir"

	_dinit_install_services_ "$srcdir"/tftpd.service
	install -Dm644 "$srcdir"/tftpd.tmpfiles \
		"$pkgdir"/usr/lib/tmpfiles.d/tftpd.conf
	install -Dm644 "$srcdir"/tftpd.conf "$pkgdir"/etc/conf.d/tftpd.conf
}
