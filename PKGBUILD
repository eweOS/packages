# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=bottom
pkgver=0.15.0
pkgrel=1
pkgdesc="A graphical process/system monitor"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/ClementTsang/bottom"
license=('MIT')
makedepends=('rust')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('23bdc185143936f01249d1e77639b75ea1915c3c2c27e304f37ebedc432f5de5d8e42c1fea018b41c4083a9216df335d0f2e6d2749998ba1ad8e82f0e23f0967')

prepare()
{
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$RUSTHOST"
}

build()
{
  cd "$pkgname-$pkgver"
  cargo build --frozen --release --all-features
}

check()
{
  cd "$pkgname-$pkgver"
  # The test asserts that at least one physical filesystem is mounted, but build
  # containers expose only virtual mounts (overlayfs root), so no disks exist.
  CARGO_HUSKY_DONT_INSTALL_HOOKS=true cargo test --frozen --all-features -- \
    --skip collection::tests::test_data_collection
}

package()
{
  cd "$pkgname-$pkgver"
  install -vDm755 -t "$pkgdir/usr/bin" target/release/btm
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
