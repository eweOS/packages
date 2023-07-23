# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=libassuan
pkgver=2.5.6
pkgrel=1
pkgdesc='IPC library used by some GnuPG related software'
url="https://www.gnupg.org/related_software/libassuan/"
arch=(x86_64 aarch64)
license=('GPL3')
depends=('musl' 'libgpg-error')
provides=('libassuan.so')
source=("https://gnupg.org/ftp/gcrypt/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('dcca942d222a2c226a7e34ba7988ee0c3c55bd6032166eb472caf2053db89aeeea7a40e93d8c2887c7ee73c5f838e8b0725e8cfb595accc1606646559362f7ee')

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
