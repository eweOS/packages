# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cargo-c
pkgver=0.10.23
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
sha256sums=('17679af6c00a70ce1d70668023e993045539afdc7ab0ca1a081aa8ef6993a595'
            '08728c618b2d721d6c6166402051828fd920f6c4578b052f57864c1c3920f7f4')

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
