# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

pkgname=lapce
pkgver=0.4.6
pkgrel=1
pkgdesc='Lightning-fast and Powerful Code Editor'
arch=(x86_64 aarch64 riscv64 loongarch64)
url=https://lap.dev/lapce
license=(Apache-2.0)
depends=(
  fontconfig
  libdrm
  libgit2
  libssh2
  llhttp
  llvm-libs
  libxkbcommon
  musl
  openssl
  pcre2
  wayland
  zlib-ng
  zstd
)
makedepends=(cargo desktop-file-utils)
source=($pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=(c6790771ed0af5e242d2410d930197412af4c21c07a5a33ae5d6ac596ca7380a)

prepare() {
  cd $pkgname-$pkgver
  # To support ZSTD_SYS_USE_PKG_CONFIG.
  cargo update --precise 2.0.5+zstd.1.5.2 zstd-sys@2.0.1+zstd.1.5.2
  cargo fetch --target $RUSTHOST --locked
}

build() {
  cd $pkgname-$pkgver
  local cargo_env=(
    OPENSSL_NO_VENDOR=1
    RELEASE_TAG_NAME=v$pkgver
    ZSTD_SYS_USE_PKG_CONFIG=1
  )
  env ${cargo_env[@]} cargo build --no-default-features --release --frozen
}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/$pkgname{,-proxy}

  cd extra
  local _name=dev.$pkgname.$pkgname
  desktop-file-install --dir "$pkgdir"/usr/share/applications linux/$_name.desktop
  install -Dm644 -t "$pkgdir"/usr/share/metainfo linux/$_name.metainfo.xml
  install -Dm644 images/logo.png "$pkgdir"/usr/share/pixmaps/$_name.png
  install -Dm644 images/logo_color.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/$_name.svg
}
