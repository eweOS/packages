# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libplacebo
pkgver=7.349.0
pkgrel=5
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
# 0001: BACKPORT: fix linking with glslang 15
source=("https://code.videolan.org/videolan/libplacebo/-/archive/v${pkgver}/libplacebo-v${pkgver}.tar.gz"
	"0001-meson-add-glslang-lib.patch::https://github.com/haasn/libplacebo/commit/056b852018db04aa2ebc0982e27713afcea8106b.patch")
sha512sums=('94fb0ad4f6cdafc81a43f06a73e49ef8ed7f81e751ad2a028f6f91295a06d8c12f2959e2595bd654db946fc5aa89758ab9d37f985ebb82badbd517ed02f3ddca'
            '90d2a9e873774e879ac5f3693590a5fee0a40a838f7088643bd28412c2bfc1794c2ec934dca7f152c2ab2fec9c680bce60c6a9e3f98ba41dc9b7e188a5c891dd')

prepare() {
  _patch_ "$pkgname-v$pkgver"
}

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
