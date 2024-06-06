# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase='mesa'
pkgname=(
  mesa
  libva-mesa-driver
  vulkan-swrast
  vulkan-virtio
  vulkan-intel
  vulkan-radeon
  vulkan-mesa-layers
)
pkgdesc="An open-source implementation of the OpenGL specification"
pkgver=24.0.6
pkgrel=2
arch=(x86_64 aarch64 riscv64)
depends=('libglvnd' 'libelf' 'zstd' 'libdrm')
makedepends=('libva' 'glslang' 'meson' 'wayland' 'wayland-protocols' 'python-packaging' 'linux-headers')
url="https://www.mesa3d.org/"
license=('custom')
# mold may fails with lto enabled
options=(!lto)
source=(
  https://mesa.freedesktop.org/archive/$pkgbase-$pkgver.tar.xz
  orcjit.patch
  orcjit-cache.patch
)
sha512sums=('60fcc77132c3cb0c98e650d97d3324bfd18abe7f8f8a3aa5209f71b2fddd94510f939bbf5272b2241749307184d5badde9da4842be57ce13f5760875885ea6fc'
            'cc273e4cc9507e8d7d19e3dca00e8a2cda9e80f9b298341a38028968f2ffc4b6ecb3e71885bf1e9ab8a8ccf5b6b18e8ca0bbd6078e8d41919f8e1acb891be92d'
            'c1a12a660a246424e75e9c8c1c2b39daccf58812e4899652c5ca72553e034259fc451a895cd330c34ef6366f56791fa09e1c3be83cd00896b00c040248e17456')

prepare()
{
  # workaround since python-mako is not available
  pip install mako
  # https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/26018
  # https://gitlab.freedesktop.org/icenowy/mesa/-/tree/orcjit-shader-cache
  _patch_ $pkgbase-$pkgver
}

build()
{
  case "${CARCH}" in
    x86_64)
	    GALLIUM_DRI="r300,r600,radeonsi,nouveau,virgl,svga,swrast,i915,iris,crocus,zink"
	    VULKAN_DRI="amd,intel,intel_hasvk,swrast,virtio"
	    ;;
    aarch64)
	    GALLIUM_DRI="r300,r600,radeonsi,nouveau,virgl,svga,swrast,kmsro,panfrost,zink"
	    VULKAN_DRI="amd,intel,intel_hasvk,swrast,virtio"
	    ;;
    riscv64)
	    GALLIUM_DRI="r300,r600,radeonsi,nouveau,virgl,svga,swrast,zink"
	    VULKAN_DRI="amd,intel,intel_hasvk,swrast,virtio"
	    ;;
  esac
  VULKAN_LAYER=device-select,intel-nullhw,overlay
  ewe-meson $pkgbase-$pkgver build \
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
    -Dvulkan-layers=${VULKAN_LAYER} \
    -Dgallium-drivers=${GALLIUM_DRI} \
    -Dgallium-extra-hud=true \
    -Dgallium-vdpau=disabled \
    -Dvideo-codecs=all \
    -Dmicrosoft-clc=disabled \
    -Dxlib-lease=disabled \
    -Dandroid-libbacktrace=disabled \
    -Dvalgrind=disabled \
    -Dlibunwind=disabled \
    -Dlmsensors=disabled \
    -Ddefault_library=shared \
    -Dllvm-orcjit=true

  meson configure build
  meson compile -C build
}

package_mesa()
{
  DESTDIR="${pkgdir}" meson install -C build

  cd $pkgdir

  # libva-mesa-driver
  _pick_ libva-mesa-driver usr/lib/dri/*_drv_video.so

  # vulkan-swrast
  _pick_ vulkan-swrast usr/share/vulkan/icd.d/lvp_icd*.json
  _pick_ vulkan-swrast usr/lib/libvulkan_lvp.so

  # vulkan-virtio
  _pick_ vulkan-virtio usr/share/vulkan/icd.d/virtio_icd*.json
  _pick_ vulkan-virtio usr/lib/libvulkan_virtio.so

  # vulkan-mesa-layers
  _pick_ vulkan-mesa-layers usr/share/vulkan/explicit_layer.d
  _pick_ vulkan-mesa-layers usr/share/vulkan/implicit_layer.d
  _pick_ vulkan-mesa-layers usr/lib/libVkLayer_*.so
  _pick_ vulkan-mesa-layers usr/bin/mesa-overlay-control.py

  # vulkan-radeon
  _pick_ vulkan-radeon usr/share/drirc.d/00-radv-defaults.conf
  _pick_ vulkan-radeon usr/share/vulkan/icd.d/radeon_icd*.json
  _pick_ vulkan-radeon usr/lib/libvulkan_radeon.so

  # vulkan-intel
  _pick_ vulkan-intel usr/share/vulkan/icd.d/intel_*.json
  _pick_ vulkan-intel usr/lib/libvulkan_intel*.so

  install -Dm644 $srcdir/$pkgbase-$pkgver/docs/license.rst \
    -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_libva-mesa-driver()
{
  pkgdesc="Open-source VA-API drivers"
  depends=(
    'expat'
    'libdrm'
    'libelf'
    'llvm-libs'
    'zlib'
    'zstd'
  )
  provides=('libva-driver')

  mv "$srcdir/pkgs/$pkgname/usr" "${pkgdir}/usr"

  install -Dm644 $srcdir/$pkgbase-$pkgver/docs/license.rst \
    -t "$pkgdir/usr/share/licenses/$pkgname"
}

_vulkan_driver_deps=('expat' 'libdrm' 'vulkan-icd-loader' 'wayland' 'zlib' 'zstd')

package_vulkan-swrast()
{
  pkgdesc="Open-source Vulkan driver for CPUs (Software Rasterizer)"
  depends=(${_vulkan_driver_deps[*]})
  optdepends=('vulkan-mesa-layers: additional vulkan layers')
  provides=('vulkan-driver')
  mv "$srcdir/pkgs/$pkgname/usr" "${pkgdir}/usr"

  install -Dm644 $srcdir/$pkgbase-$pkgver/docs/license.rst \
    -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_vulkan-virtio()
{
  pkgdesc="Open-source Vulkan driver for Virtio-GPU (Venus)"
  depends=(${_vulkan_driver_deps[*]})
  optdepends=('vulkan-mesa-layers: additional vulkan layers')
  provides=('vulkan-driver')
  mv "$srcdir/pkgs/$pkgname/usr" "${pkgdir}/usr"

  install -Dm644 $srcdir/$pkgbase-$pkgver/docs/license.rst \
    -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_vulkan-radeon()
{
  pkgdesc="Open-source Vulkan driver for AMD GPUs"
  depends=(${_vulkan_driver_deps[*]})
  optdepends=('vulkan-mesa-layers: additional vulkan layers')
  provides=('vulkan-driver')
  mv "$srcdir/pkgs/$pkgname/usr" "${pkgdir}/usr"

  install -Dm644 $srcdir/$pkgbase-$pkgver/docs/license.rst \
    -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_vulkan-intel()
{
  pkgdesc="Open-source Vulkan driver for Intel GPUs"
  depends=(${_vulkan_driver_deps[*]})
  optdepends=('vulkan-mesa-layers: additional vulkan layers')
  provides=('vulkan-driver')
  mv "$srcdir/pkgs/$pkgname/usr" "${pkgdir}/usr"

  install -Dm644 $srcdir/$pkgbase-$pkgver/docs/license.rst \
    -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_vulkan-mesa-layers()
{
  pkgdesc="Mesa's Vulkan layers"
  depends=('libdrm' 'wayland' 'python')

  mv "$srcdir/pkgs/$pkgname/usr" "${pkgdir}/usr"  

  install -Dm644 $srcdir/$pkgbase-$pkgver/docs/license.rst \
    -t "$pkgdir/usr/share/licenses/$pkgname"
}
