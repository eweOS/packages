# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=cloc
pkgver=2.12
_submodule_test_commit=f647093e8be3
pkgrel=1
pkgdesc='Code lines counter for multiple programming languages'
url='https://github.com/AlDanial/cloc'
arch=(any)
license=(GPL-2.0-or-later)
depends=(perl perl-parallel-forkmanager perl-algorithm-diff perl-regexp-common)
makedepends=(git)
checkdepends=(zip)
# 0001: Downstream, use an explicit newc format so the archive test works with
# BusyBox cpio, which cannot create archives without -H newc
# TODO: It should be upstreamed!
source=("git+https://github.com/AlDanial/cloc.git#tag=v$pkgver"
	"git+https://github.com/AlDanial/cloc_submodule_test.git#commit=$_submodule_test_commit"
	"0001-use-explicit-cpio-format-in-archive-test.patch")
sha256sums=('4a86199a5fb45e54e38570ce7e1d81a4c63c759ca8d4f69423634ebd032e19e7'
            '9053a62794da054808aa00bffa1db823fc9a6e55235c25bfa9aedb583a2f250d'
            '9a80b438ab2c1e4e50cd7d0d076fc66490a574ad31e8fed8ec606b4a2be2823a')

prepare() {
	_patch_ "$pkgname"
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
