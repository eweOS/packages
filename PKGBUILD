# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=(opendoas opendoas-pam)
pkgver=6.8.2
pkgrel=1
pkgdesc='Run commands as super user or another user'
url='https://github.com/Duncaen/OpenDoas'
license=(custom:ISC)
arch=(x86_64 aarch64 riscv64)
provides=(doas)
replaces=(doas)
makedepends=(pam)
source=("https://github.com/Duncaen/OpenDoas/releases/download/v$pkgver/opendoas-$pkgver.tar.xz")
backup=(etc/pam.d/doas)
sha512sums=('5f349763dcc56b60f3707af3b3b7557e4721427a093dff725235c54b741670e0606272063527d00442eb7510dfd96482f7c6f38f15ece148bea41c9aa514865c')

prepare()
{
  cp -r opendoas-$pkgver opendoas-pam-$pkgver
}

build()
{
  cd "$srcdir/opendoas-$pkgver"
  ./configure --prefix=/usr \
    --with-timestamp \
    --without-pam
  make

  cd "$srcdir/opendoas-pam-$pkgver"
  ./configure --prefix=/usr \
    --with-timestamp \
    --with-pam
  make
}

package_opendoas()
{
  cd "opendoas-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/opendoas/LICENSE"
}

package_opendoas-pam()
{
  pkgdesc="$pkgdesc, with pam support"
  depends=('pam')
  provides+=('opendoas')
  conflicts+=('opendoas')

  cd "opendoas-pam-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/opendoas/LICENSE"
}
