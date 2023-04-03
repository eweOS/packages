# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=mg
pkgver=20220614
pkgrel=2
pkgdesc="Microscopic EMACS style editor"
arch=(x86_64 aarch64)
url="https://github.com/hboetes/mg"
depends=('ncurses' 'libbsd' 'musl')
makedepends=('bsd-compat-headers')
license=('Public-Domain')
source=("mg-$pkgver.tgz::https://github.com/hboetes/mg/archive/$pkgver.tar.gz")
sha512sums=('bed455cda856e54fae28592ac0a520841d5d542880a7405dadf702d7407ac33ae7fb7b63880805a7e166e0e0a87c76b9fca1700c444f1b999a5af66732c69b65')

_makeflags=(
  'prefix=/usr'
  'mandir=/usr/share/man'
)

build()
{
  cd "$srcdir/$pkgname-$pkgver"
  make ${_makeflags[@]}
}

package()
{
  cd "$srcdir/$pkgname-$pkgver"

  make install ${_makeflags[@]} INSTALL=install DESTDIR="$pkgdir" BINDIR=/usr/bin

  install -Dm0644 README "$pkgdir/usr/share/licenses/$pkgname/README"
}
