# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=oksh
pkgver=7.7
pkgrel=1
url='https://github.com/ibara/oksh/'
pkgdesc='Ported version of ksh from OpenBSD'
license=('BSD')
depends=('musl' 'ncurses')
arch=(x86_64 aarch64 riscv64 loongarch64)
source=(https://github.com/ibara/oksh/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('98a758f590bc570e657263f56eb81577a018ff6d2f6e085f8efedf9d68749f95')
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
