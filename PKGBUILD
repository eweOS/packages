# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=openai-codex
pkgver=0.120.0
pkgrel=1
pkgdesc='Lightweight coding agent that runs in your terminal'
url='https://openai.com/codex/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(Apache-2.0)
depends=(musl libcap openssl llvm-libs zlib-ng zstd xz)
optdepends=(
	'git: For Git repository operations'
	'ripgrep: For accelarated searching'
)
makedepends=(rust linux-uapi-headers)
source=("https://github.com/openai/codex/archive/refs/tags/rust-v$pkgver.tar.gz")
sha256sums=('b25b5acb4cd610f0fa4142812d7cdaf1afaa644f5bc5d758ddfe627706cc5fa1')

# TODO:
#	Devendor sqlite from libsqlite3-sys
#	Devendor bzip2 from libbzip2-sys
_featureenv=(
	OPENSSL_NO_VENDOR=1
	ZSTD_SYS_USE_PKG_CONFIG=1
)

prepare() {
	cd codex-rust-v$pkgver/codex-rs
	# --locked isn't possible since during releasing,
	# workspace.package.version is updated, while Cargo.lock is not.
	# https://github.com/openai/codex/issues/14065
	#
	# There are too many crates to update manually, fetch without --locked
	# after this has been resolved in upstream.
	env "${_featureenv[@]}" \
	cargo fetch --target "$RUSTHOST"
}

build() {
	cd codex-rust-v$pkgver/codex-rs
	env "${_featureenv[@]}" \
	cargo build --frozen --release --all-features \
		--bin codex				\
		--bin codex-responses-api-proxy
}

package() {
	cd codex-rust-v$pkgver
	_install_license_ LICENSE

	cd codex-rs
	install -Dm755 target/release/{codex,codex-responses-api-proxy} \
		-t "$pkgdir/usr/bin/"

	install -d \
		"$pkgdir"/usr/share/bash-completion/completions		\
		"$pkgdir"/usr/share/zsh/site-functions			\
		"$pkgdir"/usr/share/fish/vendor_completions.d
	"$pkgdir"/usr/bin/codex completion bash > \
		"$pkgdir"/usr/share/bash-completion/completions/codex
	"$pkgdir"/usr/bin/codex completion zsh > \
		"$pkgdir"/usr/share/zsh/site-functions/_codex
}
