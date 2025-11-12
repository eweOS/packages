# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=hyfetch
pkgname=(hyfetch neowofetch)
pkgver=2.0.4
pkgrel=1
pkgdesc="Neofetch with LGBTQ+ pride flags!"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url='https://github.com/hykilpikonna/hyfetch'
license=('MIT')
makedepends=('cargo')
optdepends=('fastfetch: Alternative fetch backend')
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('8de8908334470f24dfae5693bd9660360ec8c1074b270f36eac659530e0b35ba')

prepare() {
  cd "$pkgbase-$pkgver"
  cargo fetch --locked --target "$RUSTHOST"
}

build() {
  cd "$pkgbase-$pkgver"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgbase-$pkgver"
  cargo test --frozen --all-features
}

package_hyfetch() {
  cd "$pkgbase-$pkgver"
  
  install -Dm 755 "target/release/hyfetch" "$pkgdir/usr/bin/hyfetch"
  
  install -Dm 644 "docs/hyfetch.1" "$pkgdir/usr/share/man/man1/hyfetch.1"

  install -Dm 644 "hyfetch/scripts/autocomplete.bash" "$pkgdir/usr/share/bash-completion/completions/hyfetch"
  install -Dm 644 "hyfetch/scripts/autocomplete.zsh" "$pkgdir/usr/share/zsh/site-functions/_hyfetch"
  
  install -Dm 644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_neowofetch() {
  provides=(neofetch)
  conflicts=(neofetch)
  replaces=(neofetch)
  
  cd "$pkgbase-$pkgver"
  
  install -Dm 755 neofetch $pkgdir/usr/bin/neowofetch
  ln -s neowofetch $pkgdir/usr/bin/neofetch

  install -Dm 644 LICENSE.md "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
