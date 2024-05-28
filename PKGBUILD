# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=w3m
_pkgver=0.5.3+git20220429
pkgver=${_pkgver/+git/_}
pkgrel=2
pkgdesc='Text-based Web browser & gopher browser, as well as pager'
url='https://github.com/tats/w3m'
license=('MIT')
arch=(x86_64 aarch64 riscv64)
makedepends=('git') # also add imlib2 when available
#optdepends=('imlib2: for graphics support')
depends=('openssl' 'gc' 'ncurses')
source=($pkgname-$pkgver.tar.gz::"https://github.com/tats/w3m/archive/v$_pkgver.tar.gz")
sha256sums=('6d76fcccb7c94658f2753f0777f69283d5cb447004a0d0d3087c1d873edc0af3')

build()
{
  cd $pkgname-${_pkgver/+/-}
  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib \
    --enable-image=fb \
    --with-ssl \
    --disable-dict \
    --disable-help-cgi \
    --with-termlib=ncurses \
    --with-editor="/usr/bin/vi" \
    --with-browser="/usr/bin/xdg-open" \
    --disable-w3mmailer

  #--with-imagelib=imlib2 \ # when imlib2 available add

  make
}

check()
{
  cd $pkgname-${_pkgver/+/-}/tests
  sh run_tests
}

package()
{
  cd $pkgname-${_pkgver/+/-}
  make DESTDIR="${pkgdir}" install

  install -d "${pkgdir}"/usr/share/{doc,licenses}/w3m
  install -m644 doc/* "${pkgdir}/usr/share/doc/w3m"
  ln -s ../../doc/w3m/README "${pkgdir}/usr/share/licenses/w3m"
}
