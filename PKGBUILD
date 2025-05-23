# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libplacebo
pkgver=7.351.0
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
# 0001: BACKPORT: fix linking with glslang 15
source=("https://code.videolan.org/videolan/libplacebo/-/archive/v${pkgver}/libplacebo-v${pkgver}.tar.gz"
	"0001-meson-add-glslang-lib.patch::https://github.com/haasn/libplacebo/commit/056b852018db04aa2ebc0982e27713afcea8106b.patch")
sha512sums=('325e14b783aafdd0120abc6125d3949d60e2336fba3cd8d9aefececf93005a8333e5e6c53d6e54bb4c19e4a29981c9014f303fb48b5b89383ca948f64e7e6449'
            'ed5693886b0ca8d79f453af3d217e6a881dd418264a2902aa49f750fc4b43a0d6537827f1f31e733c5903ea94717bb0742a83b599e511327940d1795238ff9e0')

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
