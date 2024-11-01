# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=binwalk
pkgver=3.1.0
pkgrel=1
pkgdesc='Tool to identify, and optionally extract, files and data that have been embedded inside of other files'
url='https://github.com/ReFirmLabs/binwalk'
arch=(x86_64 aarch64 riscv64)
license=(MIT)
depends=(libbz2 freetype2 fontconfig xz)
makedepends=(rust)
source=("https://github.com/ReFirmLabs/binwalk/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('06f595719417b70a592580258ed980237892eadc198e02363201abe6ca59e49a')

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$RUSTHOST"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTFLAGS="$RUSTFLAGS -Clinker-plugin-lto=yes -Clink-arg=-flto"
	cargo build --frozen --release --all-features
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	_install_license_ LICENSE
}
