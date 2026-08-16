# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cargo-c
pkgver=0.10.24
pkgrel=1
pkgdesc='A cargo subcommand to build and install C-ABI compatibile dynamic and static libraries'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/lu-zero/cargo-c/'
license=('MIT')
depends=(
  'cargo'
  'curl' 'libcurl.so'
  'libssh2'
  'openssl'
  'sqlite'
  'zlib'
)
source=("https://github.com/lu-zero/cargo-c/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.Cargo.lock"::"https://github.com/lu-zero/cargo-c/releases/download/v${pkgver}/Cargo.lock")
sha256sums=('91c6e0be34aa0ad26b7ef21ce21a390c95635e4e6e00b7a6ff07323f9af8550b'
            '0cbf346afe2c77fec7b39f8954b9de0639ced04234764240c8290dbec8d45e82')

prepare() {
    ln -sf "../${pkgname}-${pkgver}.Cargo.lock" "${pkgname}-${pkgver}/Cargo.lock"
    cargo fetch --locked --target "$RUSTHOST" --manifest-path="${pkgname}-${pkgver}/Cargo.toml"
}

build() {
    export RUSTUP_TOOLCHAIN='stable'
    export CARGO_TARGET_DIR="${pkgname}-${pkgver}/target"
    export LIBSSH2_SYS_USE_PKG_CONFIG=1
    export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
    cargo build --release --frozen --manifest-path="${pkgname}-${pkgver}/Cargo.toml"
}

check() {
    export RUSTUP_TOOLCHAIN='stable'
    export CARGO_TARGET_DIR="${pkgname}-${pkgver}/target"
    export LIBSSH2_SYS_USE_PKG_CONFIG=1
    export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
    cargo test --frozen --manifest-path="${pkgname}-${pkgver}/Cargo.toml"
}

package() {
    find "${pkgname}-${pkgver}/target/release" -maxdepth 1 -type f -executable -exec install -D -m755 -t "${pkgdir}/usr/bin" {} +
    install -D -m644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
