# Maintainer: RMOlive <rmolives@wumoe.org>

pkgname=racket
pkgver=9.1
pkgrel=1
pkgdesc='A full-spectrum language with DrRacket IDE'
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url='https://racket-lang.org/'
license=('Apache-2.0' 'MIT-License' 'LGPL-3.0-or-later' 'BSD-3-Clause')
depends=('musl' 'openssl' 'ncurses' 'gtk3' 'libutil-linux')
makedepends=('gsfonts' 'sqlite')
options=('!strip' '!emptydirs')
# clearcache.patch: Fix undeclared __clear_cache.
#                   This issue is due to the fact that implicit function declarations are not allowed after ISO C99, so I fixed it.
#                   See also https://github.com/cisco/ChezScheme/pull/962
source=(
  "https://download.racket-lang.org/installers/${pkgver}/${pkgname}-${pkgver}-src.tgz"
  "clearcache.patch"
)
sha512sums=('a62ddbef5dadbb2e5ecb88c818f50796bc8595ee658e2c34acbaaf19be489a0d0fae6d06d6217042b867265fab8a56083b523ab41d772ae77b055bd8c26ca3e2'
            '18bf772c5fd2c4a9a643e694197ea515f46659428a516b2fc5c5d0b85fbde37e3190fdb827a21be621157b72b12c00c27e0a4205d492eff3f92b359218f813ed')

prepare() {
  _patch_ "$pkgname-$pkgver"
  cd "$pkgbase-$pkgver"
  echo "Icon=drracket" >> share/pkgs/drracket/drracket/drracket.desktop
}

build() {
  cd "$pkgbase-$pkgver/src"
  ./configure --prefix=/usr --sysconfdir=/etc --enable-shared
  make
}

package() {
  cd "$pkgbase-$pkgver/src"
  make DESTDIR="$pkgdir" install

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE*.txt
  install -Dm644 ../share/pkgs/drracket/drracket/drracket.desktop "$pkgdir/usr/share/applications/drracket.desktop"
  install -d "$pkgdir"/usr/share/icons/hicolor/scalable/apps
  ln -s /usr/share/racket/pkgs/icons/racket-logo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/drracket.svg"
}
