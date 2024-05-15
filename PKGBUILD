# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=tcl
pkgver=8.6.14
pkgrel=1
pkgdesc="Powerful, easy-to-learn dynamic programming language"
arch=(x86_64 aarch64 riscv64)
url="http://tcl.sourceforge.net/"
license=('custom')
depends=('zlib')
options=('staticlibs' '!lto')
source=(https://downloads.sourceforge.net/sourceforge/tcl/tcl${pkgver}-src.tar.gz)
sha256sums=('5880225babf7954c58d4fb0f5cf6279104ce1cd6aa9b71e9a6322540e1c4de66')

prepare()
{
  cd tcl${pkgver}
  # we build the tcl sqlite interface in sqlite-tcl package
  rm -rf pkgs/sqlite3*
}

build()
{
  cd tcl${pkgver}/unix
  ./configure --prefix=/usr --mandir=/usr/share/man --enable-threads --enable-64bit
  make
}

check()
{
  cd tcl${pkgver}/unix
  make test TESTFLAGS="-skip 'unixInit-3* zlib-8.16 zlib-8.8 zlib-7.8 coroutine* thread*'"
}

package()
{
  cd tcl${pkgver}/unix
  make INSTALL_ROOT="${pkgdir}" install install-private-headers
  ln -sf tclsh${pkgver%.*} "${pkgdir}/usr/bin/tclsh"
  ln -sf libtcl${pkgver%.*}.so "${pkgdir}/usr/lib/libtcl.so"
  install -Dm644 ../license.terms "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 tcl.m4 -t "$pkgdir"/usr/share/aclocal
  chmod 644 "$pkgdir/usr/lib/libtclstub8.6.a"
  mv ${pkgdir}/usr/share/man/man3/Thread.3 ${pkgdir}/usr/share/man/man3/Tcl-Thread.3

  # remove buildroot traces
  _tclver=8.6
  sed -e "s#${srcdir}/tcl${pkgver}/unix#/usr/lib#" \
    -e "s#${srcdir}/tcl${pkgver}#/usr/include#" \
    -e "s#'{/usr/lib} '#'/usr/lib/tcl$_tclver'#" \
    -i "${pkgdir}/usr/lib/tclConfig.sh"

  tdbcver=tdbc1.1.7
  sed -e "s#${srcdir}/tcl${pkgver}/unix/pkgs/$tdbcver#/usr/lib/$tdbcver#" \
    -e "s#${srcdir}/tcl${pkgver}/pkgs/$tdbcver/generic#/usr/include#" \
    -e "s#${srcdir}/tcl${pkgver}/pkgs/$tdbcver/library#/usr/lib/tcl${pkgver%.*}#" \
    -e "s#${srcdir}/tcl${pkgver}/pkgs/$tdbcver#/usr/include#" \
    -i "${pkgdir}/usr/lib/$tdbcver/tdbcConfig.sh"

  itclver=itcl4.2.4
  sed -e "s#${srcdir}/tcl${pkgver}/unix/pkgs/$itclver#/usr/lib/$itclver#" \
    -e "s#${srcdir}/tcl${pkgver}/pkgs/$itclver/generic#/usr/include#" \
    -e "s#${srcdir}/tcl${pkgver}/pkgs/$itclver#/usr/include#" \
    -i "${pkgdir}/usr/lib/$itclver/itclConfig.sh"
}
