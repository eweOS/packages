# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fastfetch
pkgver=2.46.0
pkgrel=1
pkgdesc="Like Neofetch, but much faster because written in C"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/fastfetch-cli/fastfetch"
license=('MIT')
makedepends=(
  'cmake'
  'linux-headers'
)
optdepends=(
  'chafa: Image output as ascii art'
  'dbus: Bluetooth, Player & Media detection'
  'dconf: Needed for values that are only stored in DConf + Fallback for GSettings'
  'ddcutil: Brightness detection of external displays'
  'directx-headers: GPU detection in WSL'
  'glib2: Output for values that are only stored in GSettings'
  'imagemagick: Image output using sixel or kitty graphics protocol'
  'libnm: Wifi detection'
  'libpulse: Sound detection'
  'mesa: Needed by the OpenGL module for gl context creation.'
  'libxrandr: Multi monitor support'
  'ocl-icd: OpenCL module'
  'pciutils: GPU output'
  'vulkan-icd-loader: Vulkan module & fallback for GPU output'
  'xfconf: Needed for XFWM theme and XFCE Terminal font'
  'zlib: Faster image output when using kitty graphics protocol'
  'libdrm: Displays detection'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('7e4e4ab8d3e0e2ad896f97effc58df4c8d23bb88273bbdf1221bd8f0a4beb736')

build() {
  cmake -B build -S "${pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_BUILD_TYPE='RelWithDebInfo' \
    -DBUILD_TESTS='ON' \
    -DENABLE_SQLITE3='OFF' \
    -DENABLE_RPM='OFF' \
    -DENABLE_IMAGEMAGICK6='OFF' \
    -DENABLE_DDCUTIL='ON' \
    -Wno-dev
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
