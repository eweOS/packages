# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname='mesa'
pkgdesc="An open-source implementation of the OpenGL specification"
pkgver=24.0.3
pkgrel=1
arch=(x86_64 aarch64 riscv64)
depends=('libglvnd' 'libelf' 'zstd' 'libdrm')
makedepends=('meson' 'wayland' 'wayland-protocols')
url="https://www.mesa3d.org/"
license=('custom')
# mold may fails with lto enabled
options=(!lto)
source=(
  https://mesa.freedesktop.org/archive/$pkgname-$pkgver.tar.xz
  orcjit.patch
)
sha512sums=('76b3b479877c40f729d7f530af4e3577fa74363edcd3d9474350d498a51dbb761fc034b39bee8547e97c30fd3a520cbc50c742d5a187746e83ddab1df44f37e9'
            'e56dcacfb601c85cc683cba218d3be35cb27f15f48988aecc29f38d04fb14151d80b3cffaaacdf76c5be41c7eff596a39ea1ba83926684495bd239f56a7df798')

prepare()
{
  # workaround since python-mako is not available
  pip install mako
  # https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/26018
  _patch_ $pkgname-$pkgver
}

build()
{
  case "${CARCH}" in
    x86_64)
	    GALLIUM_DRI="r300,r600,radeonsi,nouveau,virgl,svga,swrast,i915,iris,crocus,zink"
	    VULKAN_DRI="swrast,virtio"
	    ;;
    aarch64)
	    GALLIUM_DRI="r300,r600,radeonsi,nouveau,virgl,svga,swrast,kmsro,panfrost,zink"
	    VULKAN_DRI="swrast,virtio"
	    ;;
    riscv64)
	    GALLIUM_DRI="r300,r600,radeonsi,nouveau,virgl,svga,swrast,zink"
	    VULKAN_DRI="swrast,virtio"
	    ;;
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
    -Dvulkan-drivers=${VULKAN_DRI} \
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
    -Ddefault_library=shared \
    -Dllvm-orcjit=true

  meson configure build
  meson compile -C build
}

package()
{
  DESTDIR="${pkgdir}" meson install -C build
}
