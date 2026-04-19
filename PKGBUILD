# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=cloc
pkgver=2.08
_submodule_test_commit=f647093e8be3
pkgrel=1
pkgdesc='Code lines counter for multiple programming languages'
url='https://github.com/AlDanial/cloc'
arch=(any)
license=(GPL-2.0-or-later)
depends=(perl perl-parallel-forkmanager perl-algorithm-diff perl-regexp-common)
makedepends=(git)
source=("git+https://github.com/AlDanial/cloc.git#tag=v$pkgver"
	"git+https://github.com/AlDanial/cloc_submodule_test.git#commit=$_submodule_test_commit")
sha256sums=('SKIP'
            '9053a62794da054808aa00bffa1db823fc9a6e55235c25bfa9aedb583a2f250d')

prepare() {
	cd "$pkgname"/Unix
	git clone "$srcdir"/cloc_submodule_test
}

check() {
	cd "$pkgname"/Unix
	make test
}

package() {
	cd "$pkgname"/Unix
	make install DESTDIR="$pkgdir"

	find "$pkgdir" -name '.packlist' -delete
	find "$pkgdir" -name '*.pod' -delete
}
