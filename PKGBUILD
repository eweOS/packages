# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libplacebo
pkgver=7.351.0
pkgrel=2
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
# 0001: Backport, Python introduced breaking change to xml.etree.ElementTree,
#	which is later backported to 3.13 and breaks libpalcebo building.
#	https://github.com/python/cpython/pull/135643
#	libplacebo issue https://github.com/haasn/libplacebo/issues/335
#
#	However, differing from the commit message, Python 3.13.6 and later
#	3.13 releases are also affected.
source=("https://code.videolan.org/videolan/libplacebo/-/archive/v${pkgver}/libplacebo-v${pkgver}.tar.gz"
	0001-vulkan-utils_gen-fix-for-python-3.14.patch)
sha512sums=('325e14b783aafdd0120abc6125d3949d60e2336fba3cd8d9aefececf93005a8333e5e6c53d6e54bb4c19e4a29981c9014f303fb48b5b89383ca948f64e7e6449'
            '3def24ce5707c9851949dab430b82693c34ef1ecc1cd7227fb9723778ef0181a90dff6015602441a1b200904b601e2d6d97ce55750d8f026d03655cc2097c1f5')

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
