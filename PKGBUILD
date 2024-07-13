# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Jakub Klinkovský <j.l.k@gmx.com>
# Contributor: Matheus de Alcantara <matheus.de.alcantara@gmail.com>

pkgname=(mandoc mandoc-apropos mandoc-soelim)
pkgver=1.14.6
pkgrel=2
pkgdesc='A suite of tools compiling mdoc from the OpenBSD project'
arch=(x86_64 aarch64 riscv64)
url='https://mdocml.bsd.lv/'
license=('ISC')
depends=('zlib')
source=("${url}/snapshots/${pkgname}-${pkgver}.tar.gz"
  'configure.local')
sha256sums=('8bf0d570f01e70a6e124884088870cbed7537f36328d512909eb10cd53179d9c'
            '5a60cfa91585e517f5152433f32a66ad519ea8e08c95baff66729631f03f8049')

prepare()
{
  cd "${srcdir}"/${pkgname}-${pkgver}

  cp ../configure.local .
}

build()
{
  cd "${srcdir}"/${pkgname}-${pkgver}

  # apply CFLAGS and LDFLAGS from makepkg.conf
  {
    echo "CFLAGS=${CFLAGS@Q}"
    echo "LDFLAGS=${LDFLAGS@Q}"
  } >> configure.local

  ./configure
  make
}

package_mandoc()
{
  provides=('man')
  conflicts=('man')

  cd "${srcdir}"/${pkgname}-${pkgver}

  DESTDIR="${pkgdir}" make install
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -d $srcdir/others

  mv $pkgdir/usr/bin/{apropos,whatis,makewhatis,soelim} $srcdir/others
  mv $pkgdir/usr/share/man/man1/soelim.1 $srcdir/others

  # conflicts with groff
  rm $pkgdir/usr/share/man/man7/roff.7
}

package_mandoc-apropos()
{
  pkgdesc="mandoc makewhatis/whatis and apropos tools and index"
  depends=('mandoc')
  cd $srcdir/others
  install -d $pkgdir/usr/bin
  install -Dm755 {apropos,whatis,makewhatis} $pkgdir/usr/bin
}

package_mandoc-soelim()
{
  pkgdesc="mandoc so elimination tool"
  provides=('soelim')
  conflicts=('groff')
  cd $srcdir/others
  install -Dm755 soelim $pkgdir/usr/bin/soelim
  install -Dm644 soelim.1 $pkgdir/usr/share/man/man1/soelim.1
}
