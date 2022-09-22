# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=ttf-unifont
pkgver=15.0.01
pkgrel=1
pkgdesc="TrueType version of the GNU Unifont"
url="https://unifoundry.com/unifont.html"
arch=('any')
license=('GPL')
source=("https://ftpmirror.gnu.org/gnu/unifont/unifont-$pkgver/unifont-$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
	install -d "$pkgdir/usr/share/fonts/unifont/"
    for INSTFONT in "" "_jp" "_Upper" "_CSUR"; do
	    install -m644 \
            "unifont-$pkgver/font/precompiled/unifont${INSTFONT,,}-$pkgver.ttf" \
            "$pkgdir/usr/share/fonts/unifont/unifont${INSTFONT}.ttf"
    done
}
