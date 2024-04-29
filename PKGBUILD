# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=sing-box
pkgver=1.8.12
pkgrel=1
pkgdesc='The universal proxy platform'
url='https://sing-box.sagernet.org/'
arch=(x86_64 aarch64 riscv64)
license=(custom)
depends=(musl)
makedepends=(go)
source=("https://github.com/SagerNet/sing-box/archive/refs/tags/v$pkgver.tar.gz"
	"sing-box.service")
sha256sums=('802eb5e202ac1dd846b1f529b3df9e5d69452182fd5d70f7c8f2a819c9e86162'
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
