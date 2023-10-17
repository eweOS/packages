# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname='mesa'
pkgdesc="An open-source implementation of the OpenGL specification"
pkgver=23.2.1
pkgrel=1
arch=(x86_64 aarch64 riscv64)
depends=('libglvnd' 'libelf' 'zstd' 'libdrm')
makedepends=('meson' 'wayland' 'wayland-protocols')
url="https://www.mesa3d.org/"
license=('custom')
source=(https://mesa.freedesktop.org/archive/$pkgname-$pkgver.tar.xz)
sha512sums=('927af0885a4815d330de384232deadf3dce7e2e2024738f138a344cbc4adce22888a9e335317f1d75965a5e691c9638949105f18c9b6ef43839fb594c6b474b5')

prepare()
{
  # workaround since python-mako is not available
  pip install mako
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
    -Ddefault_library=shared

  meson configure build
  meson compile -C build
}

package()
{
  DESTDIR="${pkgdir}" meson install -C build
}

