# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname='mesa'
pkgdesc="An open-source implementation of the OpenGL specification"
pkgver=23.1.4
pkgrel=3
arch=(x86_64 aarch64 riscv64)
depends=('libglvnd' 'libelf' 'zstd')
makedepends=('meson' 'libdrm' 'wayland' 'wayland-protocols')
url="https://www.mesa3d.org/"
license=('custom')
source=(https://mesa.freedesktop.org/archive/$pkgname-$pkgver.tar.xz)
sha512sums=('4063c7848f507b5e25cfc862394268147254b90c9f3eb19035cce338b0a9cb611b7380c1c73f0e4feeddde68124225df7dee7b9db5f019603dfde2b88ff46a21')

prepare()
{
  # workaround since python-mako is not available
  pip install mako
}

build()
{
  case "${CARCH}" in
    x86_64)  GALLIUM_DRI="nouveau,virgl,svga,swrast,i915,iris,crocus,zink" ;;
    aarch64) GALLIUM_DRI="nouveau,virgl,svga,swrast,kmsro,panfrost,zink" ;;
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
    -Dxlib-lease=disabled \
    -Dgallium-vdpau=disabled \
    -Dgallium-va=disabled \
    -Dandroid-libbacktrace=disabled \
    -Dvalgrind=disabled \
    -Dlibunwind=disabled \
    -Dlmsensors=disabled \
    -Ddefault_library=shared

  meson configure build
  meson compile -C build

}

package()
{
  DESTDIR="${pkgdir}" meson install -C build
}

