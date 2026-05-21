# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=ifupdown-ng
pkgver=0.12.1
pkgrel=6
pkgdesc='Flexible ifup/ifdown implementation'
url='https://github.com/ifupdown-ng/ifupdown-ng'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(ISC)
depends=(musl)
makedepends=(scdoc)
options=(!lto emptydirs)
source=("https://github.com/ifupdown-ng/ifupdown-ng/archive/refs/tags/ifupdown-ng-$pkgver.tar.gz"
	"ifupdown-ng.service")
sha256sums=('d42c8c18222efbce0087b92a14ea206de4e865d5c9dde6c0864dcbb2b45f2d85'
            '3e3321263a2214bb365aeabef6e06865a461a98b2b19a11884bd69b64e507b03')

# TODO: enable checks (need Kyua)

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
