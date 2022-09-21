# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=mesa
pkgname=('mesa')
pkgdesc="An open-source implementation of the OpenGL specification"
pkgver=22.2.0
_pkgver=$pkgver-rc3
pkgrel=1
arch=('x86_64')
makedepends=('meson' 'libdrm' 'wayland' 'wayland-protocols')
url="https://www.mesa3d.org/"
license=('custom')
source=(https://mesa.freedesktop.org/archive/mesa-${_pkgver}.tar.xz)
sha512sums=('SKIP')

prepare() {
  # workaround since python-mako is not available
  pip install mako
}

build() {
  ewe-meson mesa-$_pkgver build \
    -D platforms=wayland \
    -Dglvnd=false \
    -Dllvm=enabled \
    -Dshared-glapi=enabled \
    -Dglx=disabled \
    -Dgles1=enabled \
    -Dgles2=enabled \
    -Dosmesa=true \
    -Dvulkan-drivers=swrast,virtio-experimental \
    -Dgallium-drivers=swrast,virgl,zink \
    -Dcpp_rtti=false \
    -Dmicrosoft-clc=disabled \
    -Ddefault_library=shared
    
  meson configure build
  meson compile -C build

}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}
