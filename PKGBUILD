# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=prismlauncher
pkgver=11.0.2
pkgrel=1
pkgdesc="Minecraft launcher with ability to manage multiple instances."
arch=('x86_64' 'aarch64' 'riscv64')
url="https://prismlauncher.org"
license=('GPL-3.0-only AND LGPL-3.0-or-later AND LGPL-2.0-or-later AND Apache-2.0 AND MIT AND LicenseRef-Batch AND OFL-1.1')
depends=('java-runtime' 'qt6-base' 'qt6-svg' 'qt6-imageformats' 'qt6-networkauth' 'qt6-5compat' 'zlib' 'hicolor-icon-theme' 'tomlplusplus' 'cmark' 'qrencode')
makedepends=('java-environment=25' 'cmake' 'extra-cmake-modules' 'git' 'scdoc' 'linux-headers' 'gamemode')
optdepends=('glfw: to use system GLFW libraries'
            'openal: to use system OpenAL libraries'
            'visualvm: Profiling support')
source=("https://github.com/PrismLauncher/PrismLauncher/releases/download/${pkgver}/PrismLauncher-${pkgver}.tar.gz")
sha256sums=('8956e9351bcb0472fc9c2c61ae68aa2960f27f7cabb1cacd86dd2af1c233a064')

prepare() {
  cd "PrismLauncher-${pkgver}"
  # use java 25
  sed -i 's/CMAKE_JAVA_COMPILE_FLAGS -target 7 -source 7/CMAKE_JAVA_COMPILE_FLAGS -target 8 -source 8/' libraries/launcher/CMakeLists.txt
  sed -i 's/CMAKE_JAVA_COMPILE_FLAGS -target 7 -source 7/CMAKE_JAVA_COMPILE_FLAGS -target 8 -source 8/' libraries/javacheck/CMakeLists.txt
}

build() {
  cd "PrismLauncher-${pkgver}"

  export PATH="/usr/lib/jvm/java-25-openjdk/bin:$PATH"

  cmake -DCMAKE_BUILD_TYPE= \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DLauncher_BUILD_PLATFORM="eweos" \
    -DLauncher_QT_VERSION_MAJOR="6" \
    -Bbuild -S.
  cmake --build build
}

check() {
  cd "PrismLauncher-${pkgver}/build"
  ctest .
}

package() {
  cd "PrismLauncher-${pkgver}/build"
  DESTDIR="${pkgdir}" cmake --install .
}
