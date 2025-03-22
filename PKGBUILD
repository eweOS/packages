# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=font-unifont
pkgname=ttf-unifont
pkgver=16.0.02
pkgrel=1
pkgdesc="TrueType version of the GNU Unifont"
url="https://unifoundry.com/unifont.html"
arch=('any')
license=('GPL')
source=("https://ftpmirror.gnu.org/gnu/unifont/unifont-$pkgver/unifont-$pkgver.tar.gz")
sha256sums=('f128ec8763f2264cd1fa069f3195631c0b1365366a689de07b1cb82387aba52d')

package() {
	install -d "$pkgdir/usr/share/fonts/unifont/"
    for INSTFONT in "" "_jp" "_Upper" "_CSUR"; do
	    install -m644 \
            "unifont-$pkgver/font/precompiled/unifont${INSTFONT,,}-$pkgver.ttf" \
            "$pkgdir/usr/share/fonts/unifont/unifont${INSTFONT}.ttf"
    done
}
