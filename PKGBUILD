# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=sing-box
pkgver=1.13.0
pkgrel=1
pkgdesc='The universal proxy platform'
url='https://sing-box.sagernet.org/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(custom)
depends=(musl)
makedepends=(go)
source=("https://github.com/SagerNet/sing-box/archive/refs/tags/v$pkgver.tar.gz"
	"sing-box.service"
	"sing-box.sysusers")
sha256sums=('6ddc71596dc937873c5aba15a4f2b395c5434265efdc1bd21f4c03d8c5b7f641'
            '630e65ba24dcf7a44d870f0ba98e21f41232cf1c385773c9c215ebed6da75c0a'
            '34c05361f1153fa624c23cec20aa5d9cb78d60a52250dab64081c4e926bbdd42')

build () {
	cd sing-box-$pkgver
	go build -v -trimpath \
		-buildvcs=false \
		-tags with_gvisor,with_dhcp,with_wireguard	\
		-tags with_clash_api,with_quic,with_utls	\
		./cmd/sing-box
}

package() {
	_dinit_install_services_ sing-box.service
	install -Dm644 sing-box.sysusers $pkgdir/usr/lib/sysusers.d/sing-box.conf

	cd sing-box-$pkgver
	install -Dm755 sing-box $pkgdir/usr/bin/sing-box
	_install_license_ LICENSE
}
