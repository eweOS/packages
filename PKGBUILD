# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=ifupdown-ng
pkgver=0.13.0
pkgrel=1
pkgdesc='Flexible ifup/ifdown implementation'
url='https://github.com/ifupdown-ng/ifupdown-ng'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(ISC)
depends=(musl libmnl)
makedepends=(scdoc musl-static)
options=(!lto emptydirs)
source=("https://github.com/ifupdown-ng/ifupdown-ng/archive/refs/tags/ifupdown-ng-$pkgver.tar.gz"
	"ifupdown-ng.service")
sha256sums=('9efc4c47d0baa9611fccfc428862d7da94a96ac7769efc4a7935a106ac5d3896'
            '3e3321263a2214bb365aeabef6e06865a461a98b2b19a11884bd69b64e507b03')

# TODO: enable checks (need Kyua)

prepare () {
	_patch_ ifupdown-ng-ifupdown-ng-$pkgver
}

build () {
	cd ifupdown-ng-ifupdown-ng-$pkgver
	make EXECUTOR_PATH=/usr/lib/ifupdown-ng
	make docs
}

package() {
	_dinit_install_services_ ifupdown-ng.service
	cd ifupdown-ng-ifupdown-ng-$pkgver
	make install DESTDIR=$pkgdir SBINDIR=/usr/bin EXECUTOR_PATH=/usr/lib/ifupdown-ng
	make install_docs DESTDIR=$pkgdir
	_install_license_ COPYING
	rm $pkgdir/etc/network/ifupdown-ng.conf.example
}
