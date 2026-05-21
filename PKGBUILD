# Maintainer: RMOlive <rmolives@wumoe.org>

pkgname=racket
pkgver=9.1
pkgrel=2
pkgdesc='A full-spectrum language with DrRacket IDE'
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url='https://racket-lang.org/'
license=('Apache-2.0' 'MIT-License' 'LGPL-3.0-or-later' 'BSD-3-Clause')
depends=('musl' 'openssl' 'ncurses' 'gtk3' 'libutil-linux')
makedepends=('gsfonts' 'sqlite')
options=('!strip' '!emptydirs')
source=(
  "https://download.racket-lang.org/installers/${pkgver}/${pkgname}-${pkgver}-src.tgz"
)
sha512sums=(
  'a62ddbef5dadbb2e5ecb88c818f50796bc8595ee658e2c34acbaaf19be489a0d0fae6d06d6217042b867265fab8a56083b523ab41d772ae77b055bd8c26ca3e2'
)

prepare() {
  cd "$pkgname-$pkgver"
  echo "Icon=drracket" >> share/pkgs/drracket/drracket/drracket.desktop
}

build() {
  cd "$pkgname-$pkgver/src"
  ./configure --prefix=/usr --sysconfdir=/etc --enable-shared
  make
}

package() {
  cd "$pkgname-$pkgver/src"
  make DESTDIR="$pkgdir" install

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE*.txt
  install -Dm644 ../share/pkgs/drracket/drracket/drracket.desktop "$pkgdir/usr/share/applications/drracket.desktop"
  install -d "$pkgdir"/usr/share/icons/hicolor/scalable/apps
  ln -s /usr/share/racket/pkgs/icons/racket-logo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/drracket.svg"
}
