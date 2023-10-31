# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=mailcap
pkgver=2.1.54
pkgrel=1
pkgdesc="Helper application and MIME type associations for file types"
url="https://pagure.io/mailcap"
arch=(any)
license=(MIT)
makedepends=(git)
checkdepends=(python)
provides=(mime-types)
conflicts=(mime-types)
replaces=(mime-types)
backup=(
  etc/mailcap
  etc/mime.types
  etc/nginx/mime.types
)
_commit=9699055a1b4dfb90f7594ee2e8dda705fa56d3b8  # tags/r2-1-54
source=("git+https://pagure.io/mailcap#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd mailcap
  git describe --tags | sed 's/^r//;s/-/./;s/-/./;s/-/+/g'
}

build() {
  cd mailcap
  make
}

check() {
  cd mailcap
  make check
}

package() {
  cd mailcap
  make DESTDIR="$pkgdir" install
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 COPYING
}
