# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=libedit
_pkgver=20240517-3.1
pkgver=${_pkgver/-/_}
pkgrel=1
pkgdesc="Command line editor library providing generic line editing, history, and tokenization functions"
url='https://thrysoee.dk/editline/'
arch=(x86_64 aarch64 riscv64)
license=('BSD')
depends=('musl' 'ncurses')
provides=('libedit.so')
source=(${url}/${pkgname}-${_pkgver}.tar.gz)
sha256sums=('3a489097bb4115495f3bd85ae782852b7097c556d9500088d74b6fa38dbd12ff')

build()
{
  cd ${pkgname}-${_pkgver}
  # solve musl issue with ISO 10646 declaration
  ./configure --prefix=/usr CFLAGS="${CFLAGS} -D__STDC_ISO_10646__=201103L"
  make V=1
}

package()
{
  cd ${pkgname}-${_pkgver}
  make DESTDIR="${pkgdir}" install

  rm "${pkgdir}"/usr/share/man/man3/history.3 # conflicts with readline
  install -Dm 644 "${pkgdir}"/usr/share/man/man3/editline.3 "${pkgdir}"/usr/share/man/man3/el.3

  install -Dm 644 ChangeLog -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
