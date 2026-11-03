# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=xfel
pkgver=1.4.0
pkgrel=1
pkgdesc='Tiny FEL tools for Allwinner SOC'
url='https://xboot.org/xfel/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(musl libusb)
source=("https://github.com/xboot/xfel/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('23f60f1690a9702183ddbcd616aaeb12ba94a6f63b9aa4a0737519e2a989c824')

build() {
	cd "$pkgname-$pkgver"

	make
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 xfel "$pkgdir"/usr/bin/xfel
	_install_license_ LICENSE
}
