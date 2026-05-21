# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=oksh
pkgver=7.8
pkgrel=2
url='https://github.com/ibara/oksh/'
pkgdesc='Ported version of ksh from OpenBSD'
license=('BSD')
depends=('musl' 'ncurses')
arch=(x86_64 aarch64 riscv64 loongarch64)
source=(https://github.com/ibara/oksh/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('3b30d5a1183b829590cc020d8ab87f22d288e98dc3fdf12feb7159536beaa950')
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
