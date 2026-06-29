# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=font-unifont
pkgname=(ttf-unifont otf-unifont)
pkgver=17.0.05
pkgrel=1
pkgdesc="TrueType version of the GNU Unifont"
url="https://unifoundry.com/unifont.html"
arch=(any)
makedepends=(fontforge perl)
license=("GPL-2.0-or-later OR OFL-1.1")
# 0001: Should be upstreamed, don't remove copied bdf files in font/ttfsrc
#	since font/Makefile has the deletion logic as well.
source=("https://ftpmirror.gnu.org/gnu/unifont/unifont-$pkgver/unifont-$pkgver.tar.gz"
	0001-ttfsrc-Do-not-delete-bdf-file-after-sbit.patch)
sha256sums=('f287cffb26e22723aa36e6684869b0f3ff3bfb822c4b01008bd847911ec1b631'
            'f0e2ab54792e85484295a57e52b083c6f1bd4ce7d282e41b3eb63459debe2a29')

prepare() {
	_patch_ unifont-"$pkgver"
}

build() {
	cd unifont-"$pkgver"/font
	make bdf
	make opentype truetype
}

package_ttf-unifont() {
	install -d "$pkgdir/usr/share/fonts/unifont/"

	cd "unifont-$pkgver"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" \
		COPYING OFL-1.1.txt

	cd font/compiled

	for _type in "" "_jp" "_upper" "_csur"; do
		install -m644 "unifont$_type-$pkgver.ttf" \
			"$pkgdir/usr/share/fonts/unifont/unifont$_type.ttf"
	done
}

package_otf-unifont() {
	install -d "$pkgdir/usr/share/fonts/unifont/"

	cd "unifont-$pkgver"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" \
		COPYING OFL-1.1.txt

	cd font/compiled

	for _type in "" "_jp" "_upper" "_csur"; do
		install -m644 "unifont$_type-$pkgver.otf" \
			"$pkgdir/usr/share/fonts/unifont/unifont$_type.otf"
	done
}
