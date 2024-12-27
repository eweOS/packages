# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=maturin
pkgname=(
  maturin
  python-maturin
)
pkgver=1.8.0
pkgrel=1
pkgdesc="Build and publish crates with pyo3, rust-cpython and cffi bindings"
url="https://github.com/PyO3/maturin"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('Apache-2.0 OR MIT')
makedepends=(
  bzip2
  git
  python-build
  python-installer
  python-setuptools
  python-setuptools-rust
  python-wheel
  rust
)
# disable LTO until ring can be built with it: https://github.com/briansmith/ring/issues/1444
options=(!lto)
source=($url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha512sums=('35756bb850204d4d2451d6a88e56d9519a359b00c3984c43bdde5013e2c4bd2598ed8fea234ecd99e84f4f5dcaf042d6783f11541403e6c41de15cd30930e3ab')

prepare() {
  cd $pkgbase-$pkgver
  cargo fetch --locked --target "$RUSTHOST"
}

build() {
  cd $pkgbase-$pkgver
  MATURIN_SETUP_ARGS="--all-features" python -m build --wheel --no-isolation
}

package_maturin() {
  depends=(
    bzip2
    openssl
    rust
  )

  cd $pkgbase-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {Changelog,README}.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 license-mit -t "$pkgdir/usr/share/licenses/$pkgname/"

  (
    cd "$pkgdir"
    _pick_ python-$pkgbase usr/lib
  )
}

package_python-maturin() {
  pkgdesc+=" - Python bindings"
  groups=(python-build-backend)
  depends=(
    maturin=$pkgver
    python
  )

  mv -v pkgs/$pkgname/* "$pkgdir"

  install -vDm 644 $pkgbase-$pkgver/license-mit -t "$pkgdir/usr/share/licenses/$pkgname/"
}
