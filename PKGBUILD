# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=typst
pkgver=0.15.0
pkgrel=1
pkgdesc='A markup-based typesetting system for the sciences'
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://$pkgname.app"
_url="https://github.com/$pkgname/$pkgname"
license=(Apache-2.0)
depends=(openssl)
makedepends=(cargo
             git)
optdepends=('otf-libertinus: additional weights and variants for default font'
            'ttf-linux-libertine: legacy default font prior to v0.12.0')
_archive="$pkgname-$pkgver"
source=("$_url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('5044bd12138491c6e880df0e09056a9ae4607d937c73962d5806402ae6ee96a6')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target "$RUSTHOST"
}

build() {
	local hash=$(gunzip < "$_archive.tar.gz" | git get-tar-commit-id)
	cd "$_archive"
	CFLAGS+=' -ffat-lto-objects'
	export TYPST_VERSION="$pkgver"
	export TYPST_COMMIT_SHA="${hash::8}"
	export GEN_ARTIFACTS=artifacts/
	export OPENSSL_NO_VENDOR=true
	cargo build -p typst-cli --frozen --release
}

check() {
	cd "$_archive"
	cargo test --workspace --frozen
}

package() {
	cd "$_archive"
	local _artifacts='crates/typst-cli/artifacts'
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/man/man1/" "$_artifacts/$pkgname"*.1
	install -Dm0644 -t "$pkgdir/usr/share/zsh/site-functions/" "$_artifacts/_$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/fish/vendor_completions.d/" "$_artifacts/$pkgname.fish"
	install -Dm0644 "$_artifacts/$pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
}
