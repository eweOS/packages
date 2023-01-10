# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=libassuan
pkgver=2.5.5
pkgrel=1
pkgdesc='IPC library used by some GnuPG related software'
url="https://www.gnupg.org/related_software/libassuan/"
arch=(x86_64 aarch64)
license=('GPL3')
depends=('musl' 'libgpg-error')
provides=('libassuan.so')
source=("https://gnupg.org/ftp/gcrypt/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('SKIP')

build()
{
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

check()
{
  cd "${pkgname}-${pkgver}"
  make check
}

package()
{
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
