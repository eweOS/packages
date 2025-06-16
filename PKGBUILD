# Maintainer: Eric Long <i@hack3r.moe>

pkgname=blesh
_pkgname=ble.sh
pkgdesc="A replacement for Bash's line editor with enhanced features"
arch=(any)
_commit=14f98dd899cd2d95bc37f09264a1b7ed0b99b901
pkgver=0.4.0devel4.r2277.14f98dd8
pkgrel=1
license=(BSD-3-Clause)
url='https://github.com/akinomyoga/ble.sh'
depends=(bash gawk)
makedepends=(git)
install=blesh.install
source=("git+https://github.com/akinomyoga/ble.sh.git#commit=$_commit"
        "git+https://github.com/akinomyoga/blesh-contrib.git"
        _package.bash)
sha256sums=('1f3d6d66e3050c5b93bc25954ae43969777bad8202a4ccda8b4a7fe7bf01677d'
            'SKIP'
            '4584ea541b72bac09498aa57502e5dd71ba32597f55f8339070d659bd6ba7470')

pkgver() {
  cd $_pkgname
  printf "%s.r%s.%s" \
    "$(sed -n 's/-//g;s/^FULLVER[[:space:]]*:=[[:space:]]*//p' GNUmakefile)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname
  git config submodule.contrib.url "$srcdir"/blesh-contrib
  git -c protocol.file.allow=always submodule update --init --recursive
}

build() {
  cd $_pkgname
  make
  sed -i "s/^_ble_base_repository=.*/_ble_base_repository=release:$pkgver/" "out/ble.sh"
}

package() {
  cd $_pkgname
  make install \
    DESTDIR="$pkgdir" \
    PREFIX=/usr \
    INSDIR_DOC="$pkgdir"/usr/share/doc/$pkgname \
    INSDIR_LICENSE="$pkgdir"/usr/share/licenses/$pkgname
  install -Dm644 "$srcdir"/_package.bash "$pkgdir"/usr/share/blesh/lib
}
