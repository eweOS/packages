# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=man-pages-posix
_commit=3032a293a74969989e3ed4921b690cf9442ac674
pkgver=20210214.${_commit:0:7}
pkgrel=1
pkgdesc='POSIX man pages.'
url='https://www.kernel.org/doc/man-pages/index.html'
arch=(any)
license=(custom)
source=("git+https://git.kernel.org/pub/scm/docs/man-pages/man-pages-posix.git#commit=$_commit")
sha256sums=('SKIP')

package() {
	cd man-pages-posix/man-pages-posix-2013
	make install DESTDIR=$pkgdir
	_install_license_ POSIX-COPYRIGHT
}
