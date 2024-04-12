# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-text-diff
pkgver=1.45
pkgrel=1
pkgdesc='Perform diffs on files and record sets'
url='https://metacpan.org/dist/Text-Diff'
arch=(any)
license=(PerlArtistic GPL)
depends=(perl perl-algorithm-diff)
source=("https://cpan.metacpan.org/authors/id/N/NE/NEILB/Text-Diff-$pkgver.tar.gz")
sha256sums=('e8baa07b1b3f53e00af3636898bbf73aec9a0ff38f94536ede1dbe96ef086f04')

build () {
	cd Text-Diff-$pkgver
	perl Makefile.PL
	make
}

check() {
	cd Text-Diff-$pkgver
	make test
}

package() {
	cd Text-Diff-$pkgver
	make install DESTDIR=$pkgdir INSTALLDIRS=vendor
}
