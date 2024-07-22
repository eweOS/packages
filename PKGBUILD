# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=glfw
pkgdesc="A free, open source, portable framework for graphical application development"
pkgver=3.4
pkgrel=1
arch=('x86_64' 'aarch64' 'riscv64')
url="https://www.glfw.org/"
license=('custom:ZLIB')
depends=('libgl' 'libxkbcommon' 'wayland')
makedepends=('mesa' 'cmake' 'vulkan-headers' 'vulkan-icd-loader' 'extra-cmake-modules'
             'wayland-protocols' 'linux-headers')
source=("$pkgname-$pkgver.tar.gz::https://github.com/glfw/glfw/archive/${pkgver}.tar.gz")
sha512sums=('39ad7a4521267fbebc35d2ff0c389a56236ead5fa4bdff33db113bd302f70f5f2869ff4e6db1979512e1542813292dff5a482e94dfce231750f0746c301ae9ed')

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DBUILD_SHARED_LIBS=ON \
    -DGLFW_BUILD_WAYLAND=ON \
    -DGLFW_BUILD_DOCS=OFF \
    -DGLFW_BUILD_X11=OFF \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$pkgname-$pkgver"/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
