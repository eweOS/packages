# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=lact
pkgver=0.10.1
pkgrel=1
pkgdesc='Linux GPU Configuration And Monitoring Tool '
url='https://github.com/ilya-zlobintsev/LACT'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(musl llvm-libs libadwaita cairo glib graphene gtk4 pango clang)
makedepends=(rust linux-uapi-headers)
# 0001: Mention dinitctl instead of systemctl in the help text about
#	(re)starting the daemon.
source=("https://github.com/ilya-zlobintsev/LACT/archive/refs/tags/v$pkgver.tar.gz"
	lactd.service
	0001-Dinitize-help-text.patch)
sha256sums=('cbbbd0336fb65ce539ea29d99fe2e38f7c82de08c07d26dfab355735a88d853c'
            '84548b2cbea5316e6661fdfbea0e501362ffa26c378ec0d23223c3064c99853d'
            'a64ae6d0467f716444acdf67476e615466a2aa311b0c0b396c822cca0326882b')

prepare() {
	_patch_ "LACT-$pkgver"

	cd "LACT-$pkgver"
	cargo fetch --locked --target "$RUSTHOST"
}

build() {
	cd "LACT-$pkgver"
	cargo build --frozen --release --all-features
}

# easy_fuser, required by tests, fails to compile at least on musl libc
#	error[E0425]: cannot find function `renameat2` in crate `libc`
# https://github.com/Alogani/easy_fuser/issues/98
# check() {
#	cd "LACT-$pkgver"
#	cargo test --frozen --release --all-features
# }

package() {
	_dinit_install_services_ lactd.service

	cd "LACT-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	_install_license_ LICENSE
}
