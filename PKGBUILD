# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=sing-box
pkgver=1.10.6
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
sha256sums=('bb3ca59c848f1509d0e183c54c91716993ce77ab0c9c48a0de0bcd4cc1f0e021'
            'd91869e4f5916a58312c9d2702561ee951336fe3d70066273b511f3ee75d98b6'
            '34c05361f1153fa624c23cec20aa5d9cb78d60a52250dab64081c4e926bbdd42')

build () {
	cd sing-box-$pkgver
	go build -v -trimpath \
		-buildvcs=false \
		-tags with_gvisor,with_dhcp,with_wireguard	\
		-tags with_reality_server,with_clash_api,with_quic,with_utls	\
		./cmd/sing-box
}

package() {
	_dinit_install_services_ sing-box.service
	install -Dm644 sing-box.sysusers $pkgdir/usr/lib/sysusers.d/sing-box.conf

	cd sing-box-$pkgver
	install -Dm755 sing-box $pkgdir/usr/bin/sing-box
	_install_license_ LICENSE
}
