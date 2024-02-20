# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname='mesa'
pkgdesc="An open-source implementation of the OpenGL specification"
pkgver=24.0.1
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
sha512sums=('1eaff5dcff8dd314b2dfe249d25db68d530d3f0fb54e926999768d0a48aa34b67c31ec3587bb2a7d1969845b26e79a4d87aceb7a141fd2e811ae0c47c00b0963'
            '6d7a1745e685d44ec9356bd6ad63466e8c71fa617614de0d14b06274dbc1287fc586e3940819b979e91783633f348405b916eae919047c7c45152611e578c027')

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
