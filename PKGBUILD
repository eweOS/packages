# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=xfel
pkgver=1.3.5
pkgrel=2
pkgdesc='Tiny FEL tools for Allwinner SOC'
url='https://xboot.org/xfel/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(musl libusb)
source=("https://github.com/xboot/xfel/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2bdb9a7b80bdb699536afffb083524ad4efb7c738eb0dd9de03d2f2d00066fbb')

build() {
	cd "$pkgname-$pkgver"

	make
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 xfel "$pkgdir"/usr/bin/xfel
	_install_license_ LICENSE
}
