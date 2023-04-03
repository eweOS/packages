# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=ttf-dejavu
pkgver=2.37
pkgrel=1
pkgdesc="Font family based on the Bitstream Vera Fonts with a wider range of characters"
arch=('any')
url="https://dejavu-fonts.github.io/"
license=('custom')
makedepends=()
source=(https://github.com/dejavu-fonts/dejavu-fonts/releases/download/version_2_37/dejavu-fonts-ttf-${pkgver}.tar.bz2)
sha256sums=('fa9ca4d13871dd122f61258a80d01751d603b4d3ee14095d65453b4e846e17d7')

package() {
    cd dejavu-fonts-ttf-${pkgver}
    
	install -d "$pkgdir/usr/share/fonts/dejavu/"
    cp ttf/*.ttf "$pkgdir/usr/share/fonts/dejavu/"
    
    install -d "$pkgdir/usr/share/fontconfig/conf.avail"
    cp fontconfig/*.conf "$pkgdir/usr/share/fontconfig/conf.avail"

	install -d "$pkgdir/usr/share/licenses/"
  	install LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}
