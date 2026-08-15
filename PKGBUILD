# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=directx-headers
pkgver=1.619.5
pkgrel=1
pkgdesc="DirectX headers for using D3D12"
url="https://github.com/microsoft/DirectX-Headers"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
makedepends=(git meson)
options=(!lto)
source=("directx-headers::git+$url#tag=v$pkgver")
sha256sums=('cd18f439d5ab8f2ce527fc9f0e906d8e20d4d6d165e325752fb1616591f806be')

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
