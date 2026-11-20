# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=tftp-hpa
pkgver=7.2
pkgrel=1
pkgdesc='TFTP server ported to Linux'
url='https://git.kernel.org/pub/scm/network/tftp/tftp-hpa.git'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-3-Clause)
depends=(musl readline libcap)
backup=(etc/conf.d/tftpd.conf)
source=("https://git.kernel.org/pub/scm/network/tftp/tftp-hpa.git/snapshot/tftp-hpa-$pkgver.tar.gz"
	"tftpd.service"
	"tftpd.tmpfiles"
	"tftpd.conf")
sha256sums=('95665b6c60066c848272285e3fdf17c9bf1e31a36fe51aceeb2211fa8478b535'
            '3ca9451f963f3f570ac0e63a8f9bb3e927d4df063779b39a31a4c06f7b163d23'
            '7d252c4680f8929807a18aac57db4ab45c8fb6ce5f8a733b5dc1ad3600fec26b'
            'c84efa2fc0b3f86cf7b00e2d1740432a37b6c8c6e7800e28bcfea2a05a471492')

build () {
	cd "$pkgname-$pkgver"

	./autogen.sh
	./configure --prefix=/usr \
		--sbindir=/usr/bin
	make
}

# Upstream transfer tests require --jail, which needs an openat2() libc wrapper.

package() {
	cd "$pkgname-$pkgver"

	make install INSTALLROOT="$pkgdir"

	_dinit_install_services_ "$srcdir"/tftpd.service
	install -Dm644 "$srcdir"/tftpd.tmpfiles \
		"$pkgdir"/usr/lib/tmpfiles.d/tftpd.conf
	install -Dm644 "$srcdir"/tftpd.conf "$pkgdir"/etc/conf.d/tftpd.conf
}
