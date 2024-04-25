# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=darts-clone
_fullhash=e40ce4627526985a7767444b6ed6893ab6ff8983
_commit=${_fullhash:0:7}
pkgver=20181117.$_commit
pkgrel=1
pkgdesc='A clone of Darts (Double-ARray Trie System)'
url='https://github.com/s-yata/darts-clone'
arch=(x86_64 aarch64 riscv64)
license=(BSD)
depends=(musl)
makedepends=(autoconf)
source=("https://github.com/s-yata/darts-clone/archive/$_fullhash.tar.gz")
sha256sums=('4a562824ec2fbb0ef7bd0058d9f73300173d20757b33bb69baa7e50349f65820')

build () {
	cd darts-clone
	autoreconf -i
	export CXXFLAGS="-std=c++11 $CXXFLAGS"
	./configure --prefix=/usr
	make
}

check() {
	cd darts-clone
	make check
}

package() {
	cd darts-clone
	make install DESTDIR=${pkgdir}
	_install_license_ COPYING.md
}
