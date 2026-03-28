# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=caddy
pkgver=2.11.2
pkgrel=1
pkgdesc='Fast and extensible HTTP/1-2-3 webserver'
url='https://caddyserver.com'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(Apache-2.0)
depends=(musl)
makedepends=(go)
source=("https://github.com/caddyserver/caddy/archive/refs/tags/v$pkgver.tar.gz"
	"caddy.sysusers"
	"caddy.service")
sha256sums=('ee12f7b5f97308708de5067deebb3d3322fc24f6d54f906a47a0a4e8db799122'
            '8adfdc224669a82380315c292e010aeb6e3ab26719ccf4e6c66cd5fdbcf3b541'
            'd518436e724a5434785c0a0da3478c293e0ccc0e22642f0b500c36e6e7e09d94')

build () {
	cd caddy-$pkgver
	go build -v ./cmd/caddy
}

check() {
	cd caddy-$pkgver
	go test -v
}

package() {
	_dinit_install_services_ caddy.service
	install -Dm644 caddy.sysusers $pkgdir/usr/lib/sysusers.d/caddy.conf

	cd caddy-$pkgver
	install -Dm755 caddy $pkgdir/usr/bin/caddy
	_install_license_ LICENSE
}

