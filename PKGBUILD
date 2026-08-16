# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=perl-cpan-requirements-dynamic
pkgver=0.003
pkgrel=1
pkgdesc='Dynamic prerequisites in meta files.'
url='https://metacpan.org/pod/CPAN::Requirements::Dynamic'
arch=(any)
license=(GPL PerlArtistic)
depends=(perl)
makedepends=(perl-extutils-config perl-extutils-hascompiler)
source=("https://cpan.metacpan.org/authors/id/L/LE/LEONT/CPAN-Requirements-Dynamic-$pkgver.tar.gz")
sha256sums=('0731694542ec57aead9f20259ba678f74e5602e655b1833eef3e9336f47298e8')

build () {
	cd CPAN-Requirements-Dynamic-$pkgver
	perl Makefile.PL
	make
}

check() {
	cd CPAN-Requirements-Dynamic-$pkgver
	make test
}

package() {
	cd CPAN-Requirements-Dynamic-$pkgver
	make install DESTDIR=$pkgdir INSTALLDIRS=vendor
}
