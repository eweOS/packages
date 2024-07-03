# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libplacebo
pkgver=7.349.0
pkgrel=1
pkgdesc='Reusable library for GPU-accelerated video/image rendering primitives'
url='https://github.com/haasn/libplacebo'
arch=(x86_64 aarch64 riscv64)
license=('LGPL-2.1-or-later')
depends=('vulkan-icd-loader' 'glslang' 'lcms2' 'shaderc' 'xxhash')
makedepends=(
  'meson' 'ninja' 'glad' 'vulkan-headers'
  'python' 'python-setuptools' 'python-markupsafe' 'python-jinja'
  'libglvnd' 'fast_float'
)
provides=('libplacebo.so')
source=(https://code.videolan.org/videolan/libplacebo/-/archive/v${pkgver}/libplacebo-v${pkgver}.tar.gz)
sha512sums=('94fb0ad4f6cdafc81a43f06a73e49ef8ed7f81e751ad2a028f6f91295a06d8c12f2959e2595bd654db946fc5aa89758ab9d37f985ebb82badbd517ed02f3ddca')

build() {
  cd ${pkgname}-v${pkgver}
  CXXFLAGS+=" -I/usr/include/glslang"
  ewe-meson build \
    -D tests=true \
    -D vulkan=enabled \
    -D glslang=enabled \
    -D shaderc=enabled \
    -D lcms=enabled \
    -D d3d11=disabled \
    -D libdovi=disabled \
    -D demos=false \
    -D unwind=disabled
  meson compile -C build
}

check() {
  cd ${pkgname}-v${pkgver}
  meson test -C build --print-errorlogs
}

package() {
  depends+=(
    'liblcms2.so'
    'libshaderc_shared.so'
    'libvulkan.so'
  )

  cd ${pkgname}-v${pkgver}
  meson install -C build --destdir "${pkgdir}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
