# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname='mesa'
pkgdesc="An open-source implementation of the OpenGL specification"
pkgver=22.3.2
pkgrel=2
arch=('x86_64' 'aarch64')
depends=('libglvnd' 'libelf')
makedepends=('meson' 'libdrm' 'wayland' 'wayland-protocols')
url="https://www.mesa3d.org/"
license=('custom')
source=(https://mesa.freedesktop.org/archive/$pkgname-$pkgver.tar.xz)
sha512sums=('SKIP')

prepare()
{
  # workaround since python-mako is not available
  pip install mako
}

build()
{
  ewe-meson $pkgname-$pkgver build \
    --libdir=lib \
    -D platforms=wayland \
    -Dglvnd=true \
    -Dllvm=enabled \
    -Dshared-glapi=enabled \
    -Dglx=disabled \
    -Dgles1=enabled \
    -Dgles2=enabled \
    -Dosmesa=true \
    -Dvulkan-drivers=swrast,virtio-experimental \
    -Dgallium-drivers=nouveau,virgl,svga,swrast,i915,iris,crocus,zink \
    -Dcpp_rtti=false \
    -Dmicrosoft-clc=disabled \
    -Ddefault_library=shared

  meson configure build
  meson compile -C build

}

package()
{
  DESTDIR="${pkgdir}" meson install -C build
}
