# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=font-unifont
pkgname=(ttf-unifont otf-unifont)
pkgver=16.0.04
pkgrel=1
pkgdesc="TrueType version of the GNU Unifont"
url="https://unifoundry.com/unifont.html"
arch=(any)
makedepends=(fontforge perl)
license=("GPL-2.0-or-later OR OFL-1.1")
source=("https://ftpmirror.gnu.org/gnu/unifont/unifont-$pkgver/unifont-$pkgver.tar.gz"
	"0001-only-build-ttf-and-otf.patch")
sha256sums=('2bd4e4679757126f48e1bf2c1be40b09aa92162bfedda4683ce5fbc70a2a5972'
            'ee98c898aee980462b483ed8ffcae822c6e539d0fd9ed71cf4d9a8e2ba999853')

prepare() {
	_patch_ unifont-"$pkgver"
}

build() {
	cd unifont-"$pkgver"

	# Unifont cannot be built in parallel, ahhh...
	make BUILDFONT=1 -j1
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
