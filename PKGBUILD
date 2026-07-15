# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=directx-headers
pkgver=1.619.4
pkgrel=1
pkgdesc="DirectX headers for using D3D12"
url="https://github.com/microsoft/DirectX-Headers"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
makedepends=(git meson)
options=(!lto)
source=("directx-headers::git+$url#tag=v$pkgver")
sha256sums=('a9bf4b86bd30e2275041cc37d8971fb729a408b8ab11510d0dcf4bfa7748ed72')

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
