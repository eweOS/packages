# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=ttf-unifont
pkgver=15.0.01
pkgrel=1
pkgdesc="TrueType version of the GNU Unifont"
url="https://unifoundry.com/unifont.html"
arch=('any')
license=('GPL')
source=("https://ftpmirror.gnu.org/gnu/unifont/unifont-$pkgver/unifont-$pkgver.tar.gz")
sha256sums=('7d11a924bf3c63ea7fdf2da2b96d6d4986435bedfd1e6816c8ac2e6db47634d5')

package() {
	install -d "$pkgdir/usr/share/fonts/unifont/"
    for INSTFONT in "" "_jp" "_Upper" "_CSUR"; do
	    install -m644 \
            "unifont-$pkgver/font/precompiled/unifont${INSTFONT,,}-$pkgver.ttf" \
            "$pkgdir/usr/share/fonts/unifont/unifont${INSTFONT}.ttf"
    done
}
