# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=lxqt-themes
pkgver=2.5.0
pkgrel=1
pkgdesc="LXQt themes, graphics and icons."
arch=("any")
groups=("lxqt")
url="https://github.com/lxqt/$pkgname"
# https://github.com/lxqt/lxqt-themes/blob/2.0.0/AUTHORS#L9
license=("LGPL-2.1-or-later")
depends=("hicolor-icon-theme")
makedepends=("git" "lxqt-build-tools")
replaces=("lxqt-common")
source=(
	"git+https://github.com/lxqt/$pkgname.git#tag=$pkgver"
)
sha256sums=('ce83f222073c99c49b7deccd20b6ffa46d6ee2c5d3f9096c26fbab3997dfc20c')

build() {
	mkdir -p build
	cd build
	cmake "$srcdir/$pkgname" \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
