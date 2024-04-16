# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname='mesa'
pkgdesc="An open-source implementation of the OpenGL specification"
pkgver=24.0.5
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
  orcjit-cache.patch
)
sha512sums=('9476af4b9ac8db5dce397084ef169927d10b28adea7e74aa5b3136810b499ac98ddf7ab564e7d1ff81c887208c8ebab3ad2d4e27e7f46136609b5c67527018eb'
            '4da09202e5bde01492cc895efb7aa98ee5fc044a343ab013f8d6940dd091cc469d35c13a43f7043da76c3cad7a810f990894bd0c07e36211b1f90d982194976d'
            'c1a12a660a246424e75e9c8c1c2b39daccf58812e4899652c5ca72553e034259fc451a895cd330c34ef6366f56791fa09e1c3be83cd00896b00c040248e17456')

prepare()
{
  # workaround since python-mako is not available
  pip install mako
  # https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/26018
  # https://gitlab.freedesktop.org/icenowy/mesa/-/tree/orcjit-shader-cache
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
