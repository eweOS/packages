# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=oksh
pkgver=7.3
pkgrel=1
url='https://github.com/ibara/oksh/'
pkgdesc='Ported version of ksh from OpenBSD'
license=('BSD')
depends=('musl' 'ncurses')
arch=(x86_64 aarch64 riscv64)
source=(https://github.com/ibara/oksh/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('9f176ff6841435a55f27bfd3ebbfc951c8cca6fdf3638f0123f44617e3992f93')
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
