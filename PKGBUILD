# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=virglrenderer
pkgver=1.3.0
pkgrel=3
pkgdesc='A virtual 3D GPU library, that allows the guest operating system to use the host GPU to accelerate 3D rendering'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://virgil3d.github.io/'
license=(MIT)
depends=(libepoxy mesa libva)
makedepends=(python meson ninja vulkan-icd-loader vulkan-headers linux-headers python-yaml)
checkdepends=(check)
_tag=virglrenderer-$pkgver
source=(virglrenderer-$pkgver.tar.bz2::https://gitlab.freedesktop.org/virgl/virglrenderer/-/archive/$_tag/virglrenderer-$_tag.tar.bz2)
sha256sums=('a3486ff05c01d6a091176128d569138b01a36f173d56fd3195f1f24e4551be87')

build() {
  ewe-meson virglrenderer-$_tag build \
    -Dvideo=true \
    -Dvenus=true \
    -Dtests=true
  ninja -C build
}

check() {
  VRENDTEST_USE_EGL_SURFACELESS=1 LIBGL_ALWAYS_SOFTWARE=1 \
    meson test -C build -t 5
}

package() {
  meson install -C build --destdir="$pkgdir"
  install -D -m644 virglrenderer-$_tag/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
