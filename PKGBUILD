# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=directx-headers
pkgver=1.619.1
pkgrel=2
pkgdesc="DirectX headers for using D3D12"
url="https://github.com/microsoft/DirectX-Headers"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
makedepends=(git meson)
options=(!lto)
source=("directx-headers::git+$url#tag=v$pkgver")
sha256sums=('2d5862bf257365cf9c21ec75d3bf6fe2dcafbab592988c0c9f66a07b910c4473')

build() {
  local meson_options=(
    -D build-test=false
  )

  ewe-meson directx-headers build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -Dm644 directx-headers/LICENSE \
    -t "$pkgdir/usr/share/licenses/$pkgname"
}
