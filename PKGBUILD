# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=mesa-demos
pkgname=('mesa-demos' 'mesa-utils')
pkgver=9.0.0
pkgrel=1
pkgdesc="Mesa demos"
arch=(x86_64 aarch64 riscv64)
url="https://www.mesa3d.org/"
license=('MIT')
_commit=1c877d390fa85859f5e5663778c1f28eba0d624e
makedepends=('meson' 'libgl' 'glu'
             'glslang' 'vulkan-headers' 'vulkan-icd-loader' 'libdecor'
             'wayland-protocols' 'wayland' 'libdrm' 'libxkbcommon' 'git' 'linux-headers')
source=($pkgbase::git+https://gitlab.freedesktop.org/mesa/demos.git#commit=${_commit})
sha512sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed "s/^$pkgname-//;s/\([^-]*-g\)/r\1/;s/-/./g"
}

build() {
  ewe-meson $pkgname build \
    -D gles1=disabled \
    -D with-system-data-files=true \
    -D x11=disabled \
    -D glut=disabled

  # Print config
  meson configure build

  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package_mesa-demos() {
  depends=('libgl' 'glu')

  DESTDIR="$pkgdir" meson install -C build

  # remove utils
  rm "${pkgdir}"/usr/bin/{eglgears,eglinfo,egltri,eglkms,es2gears,peglgears,vkgears}
}

package_mesa-utils() {
  pkgdesc="Essential Mesa utilities"
  depends=('libgl' 'vulkan-icd-loader'
           'wayland' 'libdrm' 'libxkbcommon' 'libdecor')
  provides=('eglinfo' 'es2gears' 'eglgears')

  install -Dm 0755 build/src/egl/opengl/{eglgears,eglinfo,egltri,eglkms,peglgears} -t "${pkgdir}/usr/bin/"

  install -Dm 0755 build/src/egl/opengles2/es2gears -t "${pkgdir}/usr/bin/"

  install -Dm 0755 build/src/vulkan/vkgears -t "${pkgdir}/usr/bin/"
}
