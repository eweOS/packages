# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=libassuan
pkgver=3.0.1
pkgrel=1
pkgdesc='IPC library used by some GnuPG related software'
url="https://www.gnupg.org/related_software/libassuan/"
arch=(x86_64 aarch64 riscv64)
license=('GPL3')
depends=('musl' 'libgpg-error')
provides=('libassuan.so')
source=("https://gnupg.org/ftp/gcrypt/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('6914a02c20053bae0fc4c29c5c40655f1cec711983d57fa85e46df34e90b10e33d31256dd50ae7c7faa8d8d750a529bf9072da0cda3bdd77ebfedbc0e26e5e16')

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
