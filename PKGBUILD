# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=oksh
pkgver=7.5
pkgrel=1
url='https://github.com/ibara/oksh/'
pkgdesc='Ported version of ksh from OpenBSD'
license=('BSD')
depends=('musl' 'ncurses')
arch=(x86_64 aarch64 riscv64)
source=(https://github.com/ibara/oksh/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('40b895c3f8e9311bfe2b230e9b3786712550ef488ced33bfd7cd3f89fceeed5d')
backup=(etc/ksh.kshrc)
install=oksh.install

build()
{
  cd "${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package()
{
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
}
