# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=jade
pkgver=1.3.5
_pkgver=1.3.5
pkgrel=1
pkgdesc="Scriptable backend & TUI Installer for eweOS"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/eweOS/$pkgname"
license=('GPL-3.0-only')
makedepends=('cargo')
_refcommit=284a5a2983600752fa46ea22a048a93c16cd5730
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "$_pkgver.r%s.%s" "$(git rev-list --count $_refcommit..HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd $pkgname
    cargo fetch --locked --target "${CARCH}-unknown-linux-musl"
}

build() {
    cd $pkgname
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    depends+=('parted' 'arch-install-scripts' 'dosfstools' 'btrfs-progs')
    cd $pkgname
    install -Dm 755 "target/release/jade" "${pkgdir}/usr/bin/jade"
}
