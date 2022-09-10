# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wireguard-tools
pkgver=1.0.20210914
pkgrel=1
pkgdesc='next generation secure network tunnel - tools for configuration'
arch=('x86_64')
url='https://www.wireguard.com/'
license=('GPL')
depends=('bash')
source=("https://git.zx2c4.com/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.xz")
sha256sums=('SKIP')

prepare() {
	cd ${pkgname}-${pkgver}/
	find contrib/ -name '.gitignore' -delete
}

build() {
	cd ${pkgname}-${pkgver}/
	make -C src/
}

package() {
	cd ${pkgname}-${pkgver}/
	make -C src/ \
		DESTDIR="${pkgdir}/" \
		WITH_BASHCOMPLETION=yes \
                WITH_WGQUICK=yes \
                install
	install -d -m0755 "${pkgdir}"/usr/share/${pkgname}/
	cp -r contrib/ "${pkgdir}"/usr/share/${pkgname}/examples/
}
