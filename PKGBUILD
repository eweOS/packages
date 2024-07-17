# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=man-pages
pkgver=6.9.1
pkgrel=2
pkgdesc='Linux kernel and C library user-space interface documentation.'
url='https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/'
arch=(any)
options=(!strip)
license=(BSD-2-Clause BSD-3-Clause BSD-4-Clause-UC GPL-1.0-or-later
	 GPL-2.0-only GPL-2.0-or-later LGPL-3.0-or-later
	 LGPL-3.0-linking-exception Linux-man-pages-1-para
	 Linux-man-pages-copyleft-2-para Linux-man-pages-copyleft-var
	 Linux-man-pages-copyleft MIT)
source=("https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/snapshot/man-pages-$pkgver.tar.gz"
	"install")
sha256sums=('747a4aefde570c60bdce0b4a00615a16657dff099f9db745b24e4a2f7436ba69'
            'd4e0bf360243e64398fc512cdb62ac41f5df7b07ddb50893aff3d1570b08b628')

package() {
	chmod +x $srcdir/install
	export PATH="$srcdir:$PATH"

	cd man-pages-$pkgver
	make install prefix=/usr DESTDIR=$pkgdir

	# libxcrypt
	rm $pkgdir/usr/share/man/man3/{crypt,crypt_r}.3

	# mandoc
	rm $pkgdir/usr/share/man/man7/man.7
}
