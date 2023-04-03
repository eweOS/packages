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
sha512sums=('70117f77aa43bbbe0ed28da5ef23834c026780a74076a92ec775e30f851badb423e9a2cb9e8d142c94e4f6f8a794988c1b788fd4bd2271e562071adf0ab16403')

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
