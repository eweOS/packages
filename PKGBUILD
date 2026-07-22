# Maintainer: Yukari Chiba <i@0x7f.cc>

_pkgbase=ReGreet
pkgname=greetd-regreet
pkgver=0.5.0
pkgrel=1
pkgdesc='Clean and customizable greeter for greetd'
url="https://github.com/rharish101/$_pkgbase"
license=(GPL3)
arch=(x86_64 aarch64 riscv64 loongarch64)
depends=(
  cairo
  gdk-pixbuf2
  glib2
  greetd
  gtk4
  pango
  libseccomp
)
makedepends=(rust git)
source=("$url/archive/refs/tags/$pkgver.tar.gz" regreet.toml login.defs)
sha256sums=('7e26799dffdede183fc62d12aedbda5fea92d7d9802a180755d8a1d1fd93f2f7'
            '9d9f2cc91d124e1c4a995d0c99dfa67fda7fa98b6b9ab972c18e6c36dd3de7d2'
            '836ee891c94641892de432c4107ffa3e5cafc0c13a1d341638b914de880d2bd3')

prepare() {
  cd $_pkgbase-$pkgver
  cargo fetch --locked --target "$RUSTHOST"
}

build() {
  cd $_pkgbase-$pkgver
  cargo build --frozen --release --all-features
}

check() {
  cd "$_pkgbase-$pkgver"
  cargo test --frozen --all-features
}


package() {
  cd $_pkgbase-$pkgver
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/regreet"
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" "regreet.sample.toml"
  install -Dm0644 -t "$pkgdir/etc/greetd/" $srcdir/regreet.toml
  install -Dm0644 "systemd-tmpfiles.conf" "$pkgdir/etc/tmpfiles.d/$pkgname.conf"
  install -Dm0644 -t "$pkgdir/etc/" $srcdir/login.defs
}
