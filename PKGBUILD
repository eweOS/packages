# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cargo-c
pkgver=0.10.18
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
sha256sums=('0f2b699be7ad5cac05624701065ae521c7f6b8159bdbcb8103445fc2440d1a7e'
            '14e438039df865fbd1d4c68bc4ed61a2ee015c12f41bb47b942d4ee316d49d31')

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
