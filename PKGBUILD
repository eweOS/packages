# Maintaniner: AtomAlpaca <atal@anche.no>
pkgname=lua54
pkgver=5.4.6
pkgdesc='Powerful lightweight programming language designed for extending applications'
pkgrel=0
url='https://www.lua.org'
arch=(x86_64 aarch64)
depends=(readline)
license=(MIT)
source=(https://www.lua.org/ftp/lua-$pkgver.tar.gz
  liblua.so.patch
  lua.pc)
provides=(lua)

prepare()
{
  cd lua-$pkgver
  patch -p1 -i ../liblua.so.patch
  sed "s/%VER%/$_majorver/g;s/%REL%/$pkgver/g" ../lua.pc > lua.pc
}

build()
{
  cd lua-$pkgver
  make MYCFLAGS="$CFLAGS -fPIC" MYLDFLAGS="$LDFLAGS" linux-readline
}

package()
{
  cd lua-$pkgver
  make \
    TO_LIB="liblua.a liblua.so liblua.so.$pkgver" \
    INSTALL_TOP="$pkgdir"/usr \
    INSTALL_MAN="$pkgdir"/usr/share/man/man1 \
    INSTALL_INC="$pkgdir"/usr/include/lua$pkgver \
    install

  install -d "$pkgdir"/usr/share/doc/$pkgname
  install -m644 doc/*.{gif,png,css,html} "$pkgdir"/usr/share/doc/$pkgname
}
sha256sums=('7d5ea1b9cb6aa0b59ca3dde1c6adcb57ef83a1ba8e5432c0ecd06bf439b3ad88'
            'a8a7f89ab0c03b4bc1d58a935c54df792ad628edb4d1788c5ac66e4fc2d9f800'
            'ca9252633e782b8f85d6a94ea4f6babd4fe30bd759085b373160b1878e36ff78')
