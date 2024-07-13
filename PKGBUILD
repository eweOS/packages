# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-digest-sha
pkgver=6.04
pkgrel=1
pkgdesc='Perl extension for SHA-1/224/256/384/512.'
url='https://metacpan.org/pod/Digest::SHA'
arch=(x86_64 aarch64 riscv64)
license=(PerlArtistic GPL)
depends=(perl)
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/M/MS/MSHELOR/Digest-SHA-$pkgver.tar.gz")
sha256sums=('ee91f8f7db894ee7c6ee003daac10a99056c4948a674ef46acdbb63c81a4abeb')

build () {
	cd Digest-SHA-$pkgver
	perl Makefile.PL
	make
}

check() {
	cd Digest-SHA-$pkgver
	make test
}

package() {
	cd Digest-SHA-$pkgver
	make install DESTDIR=$pkgdir INSTALLDIRS=vendor
}
