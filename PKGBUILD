# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=glfw
pkgdesc="A free, open source, portable framework for graphical application development"
pkgver=3.5.1
pkgrel=1
epoch=1
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.glfw.org/"
license=('custom:ZLIB')
depends=('libgl' 'libxkbcommon' 'wayland')
makedepends=('mesa' 'cmake' 'vulkan-headers' 'vulkan-icd-loader' 'extra-cmake-modules'
             'wayland-protocols' 'linux-headers')
source=("$pkgname-$pkgver.tar.gz::https://github.com/glfw/glfw/archive/${pkgver}.tar.gz")
sha512sums=('42e8b8bdc2ecaab8d33d43cab6cf6e4bfd1f23492a5f13ec4b3762b74661dc3c9625721f436fbf841909b9af3ac6dcb8080201b36592d33c2bb196f768fc307f')

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
