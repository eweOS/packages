# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=eww
pkgver=0.5.0
#_pkgver=0.4.0
pkgrel=1
pkgdesc="A standalone widget system for wayland made in Rust"
url='https://github.com/elkowar/eww'
arch=(x86_64 aarch64 riscv64)
license=(MIT)
makedepends=(rust-nightly git)
depends=(gtk3 gtk-layer-shell)
source=("git+$url#tag=v$pkgver")
md5sums=('SKIP')

#pkgver() {
#  cd ${pkgname}
#  printf "$_pkgver.%s" "$(git rev-list --count HEAD)"
#}

build() {
  cd $pkgname
  cargo build --release --package eww --no-default-features --features wayland
}

package() {
  cd $pkgname
  install -Dm755 target/release/eww "${pkgdir}/usr/bin/$pkgname"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
