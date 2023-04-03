# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgname=chrpath
pkgver=0.16
pkgrel=3
pkgdesc="Change or delete the rpath or runpath in ELF files"
arch=(x86_64 aarch64)
url="https://directory.fsf.org/project/chrpath/"
license=('GPL2')
depends=('musl')
source=("http://http.debian.net/debian/pool/main/c/chrpath/chrpath_$pkgver.orig.tar.gz")
sha256sums=('bb0d4c54bac2990e1bdf8132f2c9477ae752859d523e141e72b3b11a12c26e7b')

build()
{
  cd "${srcdir}"/$pkgname-$pkgver
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package()
{
  cd "${srcdir}"/$pkgname-$pkgver
  make DESTDIR="${pkgdir}" docdir=/usr/share/doc/chrpath install
}
