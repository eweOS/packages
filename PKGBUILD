# Maintainer: Ziyao <ziyao@disroot.org>

pkgname=(libx265 x265)
pkgver=8f18e3a
_partialhash=8f18e3ad3268
_fullhash=8f18e3ad32684eee95e885e718655f93951128c3
pkgrel=0
pkgdesc_libx265="x265/HEVC video coding library"
pkgdesc_x265="video encoder for the H.265/HEVC standard"
url="https://www.videolan.org/developers/x265.html"
arch=(x86_64 aarch64)
license=('GPL2')
depends=('musl')
makedepends=('nasm' 'cmake')
source=("https://bitbucket.org/multicoreware/x265_git/get/${_fullhash}.tar.gz")
sha256sums=('3c660f30f49ecf734252c7b4bc8464ebca0b34609f85a1bf04d5af12b87f7ffd')
provides_libx265=('libx265.so')

build() {
	cd multicoreware-x265_git-$_partialhash/source
	export CC=clang
	cmake -DCMAKE_INSTALL_PREFIX=/usr/ .
	make
	make install DESTDIR=fake
}

package_x265() {
	depends+=('libx265')
	mkdir -p ${pkgdir}/usr/share/licenses/x265
	mv multicoreware-x265_git-$_partialhash/source/fake/usr/bin \
		${pkgdir}/usr
	install -Dm 644 multicoreware-x265_git-$_partialhash/COPYING \
		${pkgdir}/usr/share/licenses/x265/COPYING
}

package_libx265() {

	mkdir -p ${pkgdir}/usr/share/licenses/libx265
	mv multicoreware-x265_git-$_partialhash/source/fake/usr/{lib,include} \
		${pkgdir}/usr
	install -Dm 644 multicoreware-x265_git-$_partialhash/COPYING \
		${pkgdir}/usr/share/licenses/libx265/COPYING
}
