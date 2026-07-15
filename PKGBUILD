# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fastfetch
pkgver=2.66.0
pkgrel=1
pkgdesc="Like Neofetch, but much faster because written in C"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/fastfetch-cli/fastfetch"
license=('MIT')
makedepends=(
  'cmake'
  'linux-headers'
  'python'
  'directx-headers'
  'vulkan-headers'
  'vulkan-icd-loader'
  'wayland'
  'dconf'
  'imagemagick'
  'dbus'
  'libpulse'
  'xfconf'
  'libdrm'
  'libegl'
  'yyjson'
  'zlib'
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
depends=(yyjson)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('547883c2f0dbc85a4545d4533f5b812fbc4c8ffe1271056de18b51994acbf474')

build() {
  cmake -B build -S "${pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_BUILD_TYPE='RelWithDebInfo' \
    -DBUILD_TESTS='ON' \
    -DENABLE_SYSTEM_YYJSON='ON' \
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
