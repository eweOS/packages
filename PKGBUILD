# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=prismlauncher
pkgver=9.4
pkgrel=1
pkgdesc="Minecraft launcher with ability to manage multiple instances."
arch=('x86_64' 'aarch64' 'riscv64')
url="https://prismlauncher.org"
license=('GPL3')
depends=('java-runtime' 'qt6-base' 'qt6-svg' 'qt6-imageformats' 'qt6-networkauth' 'qt6-5compat' 'zlib' 'hicolor-icon-theme' 'tomlplusplus' 'cmark')
makedepends=('java-environment=23' 'cmake' 'extra-cmake-modules' 'git' 'scdoc' 'linux-headers')
optdepends=('glfw: to use system GLFW libraries'
            'openal: to use system OpenAL libraries'
            'visualvm: Profiling support')
source=("https://github.com/PrismLauncher/PrismLauncher/releases/download/${pkgver}/PrismLauncher-${pkgver}.tar.gz")
sha256sums=('77ab52239c2a2a9f77d7c4607e1d9cf40970f9240d2f5061b116a7b1b8fd0277')

prepare() {
  cd "PrismLauncher-${pkgver}"
  # use java 22
  sed -i 's/CMAKE_JAVA_COMPILE_FLAGS -target 7 -source 7/CMAKE_JAVA_COMPILE_FLAGS -target 8 -source 8/' libraries/launcher/CMakeLists.txt
  sed -i 's/CMAKE_JAVA_COMPILE_FLAGS -target 7 -source 7/CMAKE_JAVA_COMPILE_FLAGS -target 8 -source 8/' libraries/javacheck/CMakeLists.txt
}

build() {
  cd "PrismLauncher-${pkgver}"

  export PATH="/usr/lib/jvm/java-23-openjdk/bin:$PATH"

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
