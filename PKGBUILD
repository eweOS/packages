# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=sing-box
pkgver=1.12.12
pkgrel=2
pkgdesc='The universal proxy platform'
url='https://sing-box.sagernet.org/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(custom)
depends=(musl)
makedepends=(go)
source=("https://github.com/SagerNet/sing-box/archive/refs/tags/v$pkgver.tar.gz"
	"sing-box.service"
	"sing-box.sysusers")
sha256sums=('f08add81eab7e4d6091195179bb39fa3f64dbb0326feaa022994566b702d1245'
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
