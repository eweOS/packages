# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=netavark
pkgver=1.14.1
pkgrel=2
pkgdesc="Container network stack"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/containers/netavark"
license=(Apache-2.0)
makedepends=(
  cargo
  git
  protobuf
  go-md2man
)
provides=(container-network-stack=2)
source=(git+$url#tag=v$pkgver)
sha256sums=('5130f3f8a3a1582e68625c4034a1d83997359c6d5e7cb40c11099365439c04bc')

prepare() {
  cd $pkgname
  cargo fetch --locked --target "$RUSTHOST"
}

build() {
  cd $pkgname
  # generate man page directly as docs target is broken: https://github.com/containers/netavark/issues/524
  #mandown docs/$pkgname.1.md > $pkgname.1
  go-md2man -in=docs/$pkgname.1.md -out=$pkgname.1
  export NETAVARK_DEFAULT_FW=nftables
  cargo build --frozen --release --all-features
}

check() {
  cd $pkgname
  cargo test --frozen --all-features
}

package() {
  depends+=(nftables)
  cd $pkgname
  install -vDm 755 target/release/$pkgname -t "$pkgdir/usr/lib/podman/"
  install -vDm 644 $pkgname.1 -t "$pkgdir/usr/share/man/man1/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
