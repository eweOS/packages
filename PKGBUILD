# Maintainer: Ziyao <ziyao@disroot.org>

pkgname=pinentry
pkgdesc='The standard pinentry collection.'
pkgver=1.3.1
pkgrel=1
url='https://gnupg.org/ftp/gcrypt/pinentry/'
license=('GPL2')
depends=('musl' 'libassuan' 'libgpg-error' 'ncurses')
makedepends=('qt6-base')
optdepends=(
  'qt6-base: Qt6 backend'
)
source=("$url/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('bc72ee27c7239007ab1896c3c2fae53b076e2c9bd2483dc2769a16902bce8c04')
arch=(x86_64 aarch64 riscv64)

build() {
	cd pinentry-${pkgver}
	./configure --prefix=/usr \
          --enable-pinentry-tty \
          --enable-pinentry-curses \
          --enable-pinentry-qt
	make
}

check() {
	cd pinentry-${pkgver}
	make check
}

package() {
	cd pinentry-${pkgver}
	make DESTDIR="${pkgdir}/" install
}

