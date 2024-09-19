# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=virglrenderer
pkgver=1.1.0
pkgrel=1
pkgdesc='A virtual 3D GPU library, that allows the guest operating system to use the host GPU to accelerate 3D rendering'
arch=(x86_64 aarch64 riscv64)
url='https://virgil3d.github.io/'
license=(MIT)
depends=(libepoxy mesa libva)
makedepends=(python meson ninja vulkan-icd-loader vulkan-headers)
checkdepends=(check)
_tag=virglrenderer-$pkgver
source=(virglrenderer-$pkgver.tar.bz2::https://gitlab.freedesktop.org/virgl/virglrenderer/-/archive/$_tag/virglrenderer-$_tag.tar.bz2)
sha256sums=('51cfc3f7830f25865c1af93977a280c2bf12400550ccbebae7a7344924693337')

build() {
  cd virglrenderer-$_tag
  meson --prefix=/usr build \
    -Dvideo=true \
    -Dvenus=true \
    -Dtests=true
  ninja -C build
}

check() {
  cd virglrenderer-$_tag
  VRENDTEST_USE_EGL_SURFACELESS=1 LIBGL_ALWAYS_SOFTWARE=1 ninja -C build test
}

package() {
  cd virglrenderer-$_tag
  DESTDIR="$pkgdir" ninja -C build install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
