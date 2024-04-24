# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=lddtree
pkgver=1.27
pkgrel=0
pkgdesc="Fork of pax-utils' lddtree.sh"
url='https://github.com/ncopa/lddtree'
arch=(any)
license=(GPL2)
depends=(llvm)
source=("https://github.com/ncopa/lddtree/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f24b1965f5b353ad93fb2844edcb5ac7c41a7d19faec67694810fa03314ce649')

package() {
	install -Dm 755 $pkgname-$pkgver/lddtree.sh $pkgdir/usr/bin/lddtree
}
