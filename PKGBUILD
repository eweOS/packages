# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname='mesa'
pkgdesc="An open-source implementation of the OpenGL specification"
pkgver=22.3.4
pkgrel=1
arch=('x86_64' 'aarch64')
depends=('libglvnd' 'libelf')
makedepends=('meson' 'libdrm' 'wayland' 'wayland-protocols')
url="https://www.mesa3d.org/"
license=('custom')
source=(https://mesa.freedesktop.org/archive/$pkgname-$pkgver.tar.xz)
sha512sums=('6af340153244d3e95d0e155a45d6db134335654d62590797ae0ef6ba44c2ccfe91ebf95f70ff82c67cee108ac35536767b1f6848d6d1129f52eb9e8414ee321d')

prepare()
{
  # workaround since python-mako is not available
  pip install mako
}

build()
{
  case "${CARCH}" in
    x86_64)  GALLIUM_DRI="nouveau,virgl,svga,swrast,i915,iris,crocus,zink" ;;
    aarch64) GALLIUM_DRI="nouveau,virgl,svga,swrast,zink" ;;
  esac
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
    -Dgallium-drivers=${GALLIUM_DRI} \
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

