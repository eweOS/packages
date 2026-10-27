# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libplacebo
pkgver=7.387.0
pkgrel=1
pkgdesc='Reusable library for GPU-accelerated video/image rendering primitives'
url='https://github.com/haasn/libplacebo'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('LGPL-2.1-or-later')
depends=('vulkan-icd-loader' 'glslang' 'lcms2' 'shaderc' 'xxhash')
makedepends=(
  'meson' 'ninja' 'glad' 'vulkan-headers'
  'python' 'python-setuptools' 'python-markupsafe' 'python-jinja'
  'libglvnd' 'fast_float'
)
provides=('libplacebo.so')
source=("https://code.videolan.org/videolan/libplacebo/-/archive/v${pkgver}/libplacebo-v${pkgver}.tar.gz")
sha512sums=('57db9dd1526345dd95033fb4ae0db0ae8ae311973a3159307b67fd5504dad7810ed406f76c8ab7e952f7556e598cccaeb4abe6d2f5f623a73ed63418442337ae')

build() {
  cd "$pkgname-v$pkgver"
  CXXFLAGS+=" -I/usr/include/glslang"
  ewe-meson build \
    -D tests=true \
    -D vulkan=enabled \
    -D shaderc=enabled \
    -D glslang=enabled \
    -D lcms=enabled \
    -D d3d11=disabled \
    -D libdovi=disabled \
    -D demos=false \
    -D unwind=disabled
  meson compile -C build
}

check() {
  cd "$pkgname-v$pkgver"
  meson test -C build --print-errorlogs
}

package() {
  depends+=(
    'liblcms2.so'
    'libshaderc_shared.so'
    'libvulkan.so'
  )

  cd "$pkgname-v$pkgver"
  meson install -C build --destdir "$pkgdir"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
