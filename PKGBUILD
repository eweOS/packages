# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fastfetch
pkgver=2.9.2
pkgrel=2
pkgdesc="Like Neofetch, but much faster because written in C"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/fastfetch-cli/fastfetch"
license=('MIT')
makedepends=(
  'cmake'
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
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz" eweos.patch)
sha256sums=('3ca9e48ed30c49fc50d5f64a2ce327a9f00ce4497feac01865c50086cc43e5ce'
            '96d395a80b16819ced3d3e9053fd4fb0773a0bcffbf46ada0347f111b466bf5e')

prepare() {
  _patch_ $pkgname-$pkgver
}

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
