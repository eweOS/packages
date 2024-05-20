# Maintainer: Yao Zi <ziyao@disroot.org>

pkgbase=font-opensans
pkgname=ttf-opensans
_fullhash=bd7e37632246368c60fdcbd374dbf9bad11969b6
pkgver=20231116.${_fullhash:0:7}
pkgrel=2
pkgdesc='Open Sans Font'
url='https://github.com/googlefonts/opensans'
arch=(any)
license=(custom:OFL)
source=("https://github.com/googlefonts/opensans/archive/$_fullhash.tar.gz")
sha256sums=('a1b16d859522daa826fb093d791ee252a1627274ef1b90f2773d670eb73a2a92')

package() {
	cd opensans-$_fullhash
	_install_license_ OFL.txt
	mkdir -p $pkgdir/usr/share/fonts/TTF
	install -m644 ./fonts/ttf/OpenSans-*.ttf $pkgdir/usr/share/fonts/TTF
}
