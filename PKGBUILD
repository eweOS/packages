# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=libltdl
_pkgname=libtool
pkgver=2.5.3
pkgrel=1
pkgdesc='A small library aiming at hiding the various difficulties of dlopening libraries'
arch=(x86_64 aarch64 riscv64)
url='https://www.gnu.org/software/libtool/manual/html_node/Using-libltdl.html'
license=(GPL)
depends=(musl)
provides=("libltdl.so")
source=(https://ftpmirror.gnu.org/libtool/libtool-${pkgver}.tar.gz)
sha256sums=('9322bd8f6bc848fda3e385899dd1934957169652acef716d19d19d24053abb95')

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
  # disable gnulib tests
  make check-local TESTSUITEFLAGS="27-39"
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
