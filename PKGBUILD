# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=caddy
pkgver=2.8.1
pkgrel=1
pkgdesc='Fast and extensible HTTP/1-2-3 webserver'
url='https://caddyserver.com'
arch=(x86_64 aarch64 riscv64)
license=(Apache-2.0)
depends=(musl)
makedepends=(go)
source=("https://github.com/caddyserver/caddy/archive/refs/tags/v$pkgver.tar.gz"
	"caddy.sysusers"
	"caddy.service")
sha256sums=('1efd6aad92210288a89b76c1e639da7ba0009f2ab3ae7c78b5818b67257f732c'
            '8adfdc224669a82380315c292e010aeb6e3ab26719ccf4e6c66cd5fdbcf3b541'
            'a2367b92e5e8a907caf6340446eaab916c3535c8fcf242278b4fa1ca229b7817')

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

