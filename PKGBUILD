# Maintainer: RMOlive <rmolives@wumoe.org>

pkgname=racket
pkgver=9.2
pkgrel=1
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
sha512sums=('7bffaab000298b9c70f9e5c7d320dbe809c17e13aeea40070d9dee2819933481cbbe059a02b66d8b6e06a5e0eb60fcf00ba0a674e966c282a3354755eb9ddb19')

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
