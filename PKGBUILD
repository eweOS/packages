# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-text-diff
pkgver=1.46
pkgrel=1
pkgdesc='Perform diffs on files and record sets'
url='https://metacpan.org/dist/Text-Diff'
arch=(any)
license=(PerlArtistic GPL)
depends=(perl perl-algorithm-diff)
source=("https://cpan.metacpan.org/authors/id/N/NE/NEILB/Text-Diff-$pkgver.tar.gz")
sha256sums=('3fc983e3140fa2580250bbcf2b52e2acbdbc5abda4374c3be78235905d8ca8eb')

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
