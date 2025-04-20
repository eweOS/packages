# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=grass
pkgver=0.13.4
pkgrel=2
pkgdesc='A Sass compiler written purely in Rust'
url='https://docs.rs/grass/latest/grass/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(musl llvm-libs)
makedepends=(rust)
source=("https://github.com/connorskees/grass/archive/refs/tags/$pkgver.tar.gz")
provides=(sass)
sha256sums=('577858cce48440d161c6036d83dbfb3c173058f9df297977b13b8646f88a4906')

# grass makes use of nightly features
export RUSTC_BOOTSTRAP=1

prepare() {
	cd "$pkgname-$pkgver"
	# For loongarch64 support of libc
	cargo update --precise 0.2.172 libc
	cargo fetch --locked --target "$RUSTHOST"
}

build() {
	cd "$pkgname-$pkgver"
	cargo build --frozen --release --all-features
}

check() {
	cd "$pkgname-$pkgver"
	cargo test --frozen --release --all-features
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	_install_license_ LICENSE
}
