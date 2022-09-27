# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=oksh
pkgver=7.1
pkgrel=1
url='https://github.com/ibara/oksh/'
pkgdesc='Ported version of ksh from OpenBSD'
license=('custom: Public Domain' 'ISC' 'BSD')
depends=('glibc' 'ncurses')
arch=('i686' 'x86_64')
source=(https://github.com/ibara/oksh/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('SKIP')
backup=(etc/ksh.kshrc)
install=oksh.install

build() {
       cd "${pkgname}-${pkgver}"

       ./configure --prefix=/usr
       make
}

package() {
       cd "${pkgname}-${pkgver}"

       make DESTDIR="${pkgdir}/" install
}
