# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=kirc
pkgver=0.3.1
pkgrel=1
pkgdesc="A tiny IRC client written in POSIX C99"
arch=(x86_64 aarch64)
url="https://github.com/mcpcpc/kirc"
license=('MIT')
depends=('musl')
source=("https://github.com/mcpcpc/kirc/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('19bb058a9845eb5b2febe6e8d658dcd06c194b58669f37837dbdf37627c7d7dd')

build()
{
  cd ${pkgname}-${pkgver}

  make
}

package()
{
  cd ${pkgname}-${pkgver}

  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
