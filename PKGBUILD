# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=kirc
pkgver=0.3.1
pkgrel=1
pkgdesc="A tiny IRC client written in POSIX C99"
arch=('x86_64')
url="https://github.com/mcpcpc/kirc"
license=('MIT')
depends=('musl')
source=("https://github.com/mcpcpc/kirc/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('SKIP')


build() {
  cd ${pkgname}-${pkgver}

  make
}

package() {
  cd ${pkgname}-${pkgver}

  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

