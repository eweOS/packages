# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=man-pages
pkgver=6.17
pkgrel=1
pkgdesc='Linux kernel and C library user-space interface documentation.'
url='https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/'
arch=(any)
options=(!strip)
license=(BSD-2-Clause BSD-3-Clause BSD-4-Clause-UC GPL-1.0-or-later
	 GPL-2.0-only GPL-2.0-or-later
	 'LGPL-3.0-or-later WITH LGPL-3.0-linking-exception'
	 Linux-man-pages-1-para
	 Linux-man-pages-copyleft-2-para Linux-man-pages-copyleft-var
	 Linux-man-pages-copyleft MIT)
source=("https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/snapshot/man-pages-$pkgver.tar.gz"
	"install")
sha256sums=('8af0f5be01f60efce1976c7ed3d7c6e9463375c856775754e38955486a51c0a8'
            'd4e0bf360243e64398fc512cdb62ac41f5df7b07ddb50893aff3d1570b08b628')

remove_man=(
man3/crypt.3 man3/crypt_r.3				# libxcrypt
man7/man.7						# mandoc
man5/tzfile.5 man8/tzselect.8 man8/zdump.8 man8/zic.8	# tzdata
)

package() {
	chmod +x $srcdir/install
	export PATH="$srcdir:$PATH"

	cd man-pages-$pkgver
	make -R install prefix=/usr DESTDIR=$pkgdir

	for f in ${remove_man[*]}; do
		rm $pkgdir/usr/share/man/$f
	done

	for f in LICENSES/*; do
		_install_license_ $f $(basename "$f")
	done
}
