# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=sing-box
pkgver=1.8.14
pkgrel=1
pkgdesc='The universal proxy platform'
url='https://sing-box.sagernet.org/'
arch=(x86_64 aarch64 riscv64)
license=(custom)
depends=(musl)
makedepends=(go)
source=("https://github.com/SagerNet/sing-box/archive/refs/tags/v$pkgver.tar.gz"
	"sing-box.service")
sha256sums=('2ba7cfa097f5963ba304d47606e7a6b61bf881eb86cbed78fa6e4efae44a0a5f'
            'bba7a400c154fd922ee714ca2413ef659e155f65edcf218bf11d864509c598dc')

build () {
	cd sing-box-$pkgver
	go build -v -trimpath \
		-tags with_gvisor,with_dhcp,with_wireguard	\
		-tags with_reality_server,with_clash_api,with_quic,with_utls	\
		./cmd/sing-box
}

package() {
	_dinit_install_services_ sing-box.service
	cd sing-box-$pkgver
	install -Dm755 sing-box $pkgdir/usr/bin/sing-box
	_install_license_ LICENSE
}
