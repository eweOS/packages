# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=xfce4-dev-tools
pkgver=4.19.4
pkgrel=1
pkgdesc='a collection of tools and macros for Xfce'
url='https://docs.xfce.org/xfce/xfce4-dev-tools/start'
arch=(x86_64 aarch64 riscv64)
license=(GPL-2.0-or-later)
depends=(musl glib meson)
makedepends=(libxslt)
source=("https://archive.xfce.org/src/xfce/xfce4-dev-tools/${pkgver%.*}/xfce4-dev-tools-$pkgver.tar.bz2")
sha256sums=('18cd68b2b077b8fa4443d7111c54657f67c6f131b226322a809b27f4327cb9ca')

build () {
	cd xfce4-dev-tools-$pkgver
	./configure --prefix=/usr
	make
}

check() {
	cd xfce4-dev-tools-$pkgver
	make check
}

package() {
	cd xfce4-dev-tools-$pkgver
	make install DESTDIR=$pkgdir
}
