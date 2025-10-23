# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=xfel
pkgver=1.3.3
pkgrel=1
pkgdesc='Tiny FEL tools for Allwinner SOC'
url='https://xboot.org/xfel/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(musl libusb)
source=("https://github.com/xboot/xfel/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f4af683caed394ed8a2c4b384a470275cc9c09282800f540de1cf20e7161827d')

build() {
	cd "$pkgname-$pkgver"

	make
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 xfel "$pkgdir"/usr/bin/xfel
	_install_license_ LICENSE
}
