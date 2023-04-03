# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=libltdl
_pkgname=libtool
pkgver=2.4.6
pkgrel=5
pkgdesc='A small library aiming at hiding the various difficulties of dlopening libraries'
arch=(x86_64 aarch64)
url='https://www.gnu.org/software/libtool/manual/html_node/Using-libltdl.html'
license=(GPL)
depends=(musl)
provides=("libltdl.so")
source=(https://ftpmirror.gnu.org/libtool/libtool-${pkgver}.tar.gz)
sha256sums=('e3bd4d5d3d025a36c21dd6af7ea818a2afcd4dfc1ea5a17b39d7854bcd0c06e3')

build()
{
  cd ${_pkgname}-${pkgver}
  ./configure --prefix=/usr lt_cv_sys_lib_dlsearch_path_spec="/usr/lib /usr/lib32"
  make
}

check()
{
  cd ${_pkgname}-${pkgver}
  # only test linking and loading.
  make check TESTSUITEFLAGS="27-39"
}

package()
{
  cd ${_pkgname}-${pkgver}
  make DESTDIR="$srcdir/install" install
  install -d $pkgdir/usr
  cp -r $srcdir/install/usr/lib $pkgdir/usr/lib
  cp -r $srcdir/install/usr/include $pkgdir/usr/include
  install -Dm644 $srcdir/install/usr/share/libtool/COPYING.LIB $pkgdir/usr/share/licenses/$pkgname/COPYING.LIB
}
