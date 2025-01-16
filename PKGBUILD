# Maintainer: Julian Droske <juliandroske@outlook.com>

pkgname=micro
pkgver=2.0.14
pkgrel=1
pkgdesc='A modern and intuitive terminal-based text editor'
url='https://micro-editor.github.io'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(
  musl
)
makedepends=(
  git
  go
)
optdepends=(
  'wl-clipboard: for copying/pasting text using Wayland'
)
source=(
  "https://github.com/zyedidia/micro/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=(
  '40177579beb3846461036387b649c629395584a4bbe970f61ba7591bd9c0185a'
)

build() {
  cd "$pkgname-$pkgver"

  GOFLAGS='-buildvcs=false' \
    make
}

check() {
  cd "$pkgname-$pkgver"

  make test
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 assets/packaging/micro.1 "$pkgdir/usr/share/man/man1"
  install -Dm644 assets/packaging/micro.desktop "$pkgdir/usr/share/applications"
  install -Dm644 assets/micro-logo-mark.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE LICENSE-THIRD-PARTY
}
