# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cargo-c
pkgver=0.10.19
pkgrel=1
pkgdesc='A cargo subcommand to build and install C-ABI compatibile dynamic and static libraries'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/lu-zero/cargo-c/'
license=('MIT')
depends=(
  'cargo'
  'curl' 'libcurl.so'
  'openssl'
  'zlib'
)
options=(!lto)
source=("https://github.com/lu-zero/cargo-c/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.Cargo.lock"::"https://github.com/lu-zero/cargo-c/releases/download/v${pkgver}/Cargo.lock")
sha256sums=('4136fbb1c25b1afdf1aaf473d00e532b73bbe02c7c53cb44965aff41ed328d20'
            'f02e3b1fc5e612c41bb75d1af25b0a231e1aae7cb0279a0d71bd216015abc919')

prepare() {
    ln -sf "../${pkgname}-${pkgver}.Cargo.lock" "${pkgname}-${pkgver}/Cargo.lock"
    cargo fetch --locked --target "$RUSTHOST" --manifest-path="${pkgname}-${pkgver}/Cargo.toml"
}

build() {
    export CFLAGS+=' -ffat-lto-objects'
    export RUSTUP_TOOLCHAIN='stable'
    export CARGO_TARGET_DIR="${pkgname}-${pkgver}/target"
    cargo build --release --frozen --manifest-path="${pkgname}-${pkgver}/Cargo.toml"
}

check() {
    export CFLAGS+=' -ffat-lto-objects'
    export RUSTUP_TOOLCHAIN='stable'
    export CARGO_TARGET_DIR="${pkgname}-${pkgver}/target"
    cargo test --frozen --manifest-path="${pkgname}-${pkgver}/Cargo.toml"
}

package() {
    find "${pkgname}-${pkgver}/target/release" -maxdepth 1 -type f -executable -exec install -D -m755 -t "${pkgdir}/usr/bin" {} +
    install -D -m644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
