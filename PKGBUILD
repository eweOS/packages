# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=libedit
_pkgver=20260512-3.1
pkgver=${_pkgver/-/_}
pkgrel=1
pkgdesc="Command line editor library providing generic line editing, history, and tokenization functions"
url='https://thrysoee.dk/editline/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('BSD-3-Clause')
depends=('musl' 'ncurses')
provides=('libedit.so')
source=(${url}/${pkgname}-${_pkgver}.tar.gz)
sha256sums=('432d5e7ea8b0116dd39f2eca7bc11d0eed77faa6b77ea526ace89907c23ea4a0')

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

  install -Dm 644 "${pkgdir}"/usr/share/man/man3/editline.3 "${pkgdir}"/usr/share/man/man3/el.3

  install -Dm 644 ChangeLog -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
