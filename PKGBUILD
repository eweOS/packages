# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=libassuan
pkgver=2.5.7
pkgrel=1
pkgdesc='IPC library used by some GnuPG related software'
url="https://www.gnupg.org/related_software/libassuan/"
arch=(x86_64 aarch64 riscv64)
license=('GPL3')
depends=('musl' 'libgpg-error')
provides=('libassuan.so')
source=("https://gnupg.org/ftp/gcrypt/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('ca33bd0325bbebccb63b6a84cc0aa5c85b25c6275a68df83aeb3f3729b2cd38220198a941c3479bd461f16b7ddb6b558c0664697ca3153c7fb430544303d773f')

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
