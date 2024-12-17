# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=oksh
pkgver=7.6
pkgrel=1
url='https://github.com/ibara/oksh/'
pkgdesc='Ported version of ksh from OpenBSD'
license=('BSD')
depends=('musl' 'ncurses')
arch=(x86_64 aarch64 riscv64 loongarch64)
source=(https://github.com/ibara/oksh/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('26b45fc3dcaab786db6b87dcd741ac572a7ef539dbb88ea22c43ed8b54405c74')
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
