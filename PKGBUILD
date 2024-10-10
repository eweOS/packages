# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=rav1e
pkgver=0.7.1
pkgrel=1
pkgdesc='An AV1 encoder focused on speed and safety'
arch=(x86_64 aarch64 riscv64)
url=https://github.com/xiph/rav1e/
license=(custom:BSD)
makedepends=(
  cargo-c
  git
  nasm
  rust
)
provides=(librav1e.so)
_tag=a8d05d0c43826a465b60dbadd0ab7f1327d75371
source=(
  git+https://github.com/xiph/rav1e.git#tag=${_tag}
  Cargo-rav1e-${pkgver}.lock::https://github.com/xiph/rav1e/releases/download/v${pkgver}/Cargo.lock
)
sha256sums=('0fa45ac1724b024d003e43e6e5c3f0754bc12e2d9ea677e39ea0ed0d3de5b907'
            '4482976bfb7647d707f9a01fa1a3848366988f439924b5c8ac7ab085fba24240')

pkgver() {
  cd rav1e
  git describe --tags | sed 's/^v//'
}

prepare() {
  cp -f Cargo-rav1e-${pkgver}.lock rav1e/Cargo.lock
  cargo fetch \
    --locked \
    --manifest-path rav1e/Cargo.toml
}

build() {
  cargo build \
    --release \
    --frozen \
    --no-default-features \
    --features binaries,asm,threading,signal_support \
    --manifest-path rav1e/Cargo.toml
  cargo cbuild \
    --release \
    --frozen \
    --no-default-features \
    --features binaries,asm,threading,signal_support \
    --prefix=/usr \
    --manifest-path rav1e/Cargo.toml
}

check() {
  cargo test \
    --release \
    --frozen \
    --no-default-features \
    --features binaries,asm,threading,signal_support \
    --manifest-path rav1e/Cargo.toml
}

package() {
  cd rav1e
  cargo install \
    --frozen \
    --no-default-features \
    --features binaries,asm,threading,signal_support \
    --offline \
    --no-track \
    --path . \
    --root "${pkgdir}"/usr
  cargo cinstall \
    --release \
    --frozen \
    --no-default-features \
    --features binaries,asm,threading,signal_support \
    --prefix /usr \
    --destdir "${pkgdir}"
  install -Dm 644 LICENSE PATENTS -t "${pkgdir}"/usr/share/licenses/rav1e/
}
