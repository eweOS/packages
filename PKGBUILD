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
pkgver=24.2.5
pkgrel=1
arch=(x86_64 aarch64 riscv64 loongarch64)
depends=('libglvnd' 'libelf' 'zstd' 'libdrm' 'llvm')
makedepends=(
  'libva'
  'glslang'
  'meson'
  'wayland' 'wayland-protocols'
  'python-packaging'
  'llvm-devel'
  'linux-headers'
  'libclc' 'spirv-llvm-translator' 'spirv-tools'
  'python-mako' 'python-pycparser' 'python-yaml')
url="https://www.mesa3d.org/"
license=('custom')
# mold may fails with lto enabled
options=(!lto)
source=(
  https://mesa.freedesktop.org/archive/$pkgbase-$pkgver.tar.xz
  0001-gl-without-glx.patch
  0002-panvk-link-with-build-id.patch::https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/31654.patch
)
sha512sums=('9f202907dc4e7f1063c32882b2c9a3ab34c4d83de1c9ef4dd171043b87b110bfd7e7a3d6e3632ed768e024ef18b97181c4f6bc377cc7d3eb609dd96ebf6a783e'
            '83bf8b305713a22c9732a0a72be5eab3f75abf469a547043e6a78f662c5247dc051971565c9be91b2af85948980e677ccb48ac9ca6b25afe6fd8380510c4310e'
            '581c2fbacc942b2d15a150b93908df3ecd7da0612fd69dbbc47c1e50df860a79de401429d5496c5d2c024a76da8440130ba0d0eeef8933ea565333727e2766ee')

[ "$CARCH" = aarch64 ] && pkgname+=(vulkan-panfrost)

prepare()
{
  _patch_ $pkgbase-$pkgver
}

build()
{
  GALLIUM_DRI_COMMON="r300,r600,radeonsi,nouveau,virgl,svga,swrast,softpipe,llvmpipe,zink"
  VULKAN_DRI_COMMON="amd,intel,intel_hasvk,swrast,virtio"
  case "${CARCH}" in
    x86_64)
	    GALLIUM_DRI="${GALLIUM_DRI_COMMON},i915,iris,crocus"
	    VULKAN_DRI="${VULKAN_DRI_COMMON}"
	    ;;
    aarch64)
	    GALLIUM_DRI="${GALLIUM_DRI_COMMON},panfrost,freedreno,lima,etnaviv"
	    VULKAN_DRI="${VULKAN_DRI_COMMON},panfrost"
	    ;;
    riscv64)
	    GALLIUM_DRI="${GALLIUM_DRI_COMMON},etnaviv"
	    VULKAN_DRI="${VULKAN_DRI_COMMON}"
	    ;;
    loongarch64)
	    GALLIUM_DRI="${GALLIUM_DRI_COMMON}"
	    VULKAN_DRI="${VULKAN_DRI_COMMON}"
	    ;;
  esac
  VULKAN_LAYER=device-select,intel-nullhw,overlay
  ewe-meson $pkgbase-$pkgver build \
    --libdir=lib \
    -D platforms=wayland \
    -Dglvnd=enabled \
    -Dllvm=enabled \
    -Dshared-glapi=enabled \
    -Dglx=null \
    -Dgles1=enabled \
    -Dgles2=enabled \
    -Dopengl=true \
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
    -Dllvm-orcjit=true \
    -Dgallium-opencl=disabled \
    -Dintel-rt=disabled

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

  # vulkan-panfrost
  _pick_ vulkan-panfrost usr/share/vulkan/icd.d/panfrost_*.json
  _pick_ vulkan-panfrost usr/lib/libvulkan_panfrost.so

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
    'llvm'
    'llvm-libs'
    'zlib'
    'zstd'
  )
  provides=('libva-driver')

  mv "$srcdir/pkgs/$pkgname/usr" "${pkgdir}/usr"

  install -Dm644 $srcdir/$pkgbase-$pkgver/docs/license.rst \
    -t "$pkgdir/usr/share/licenses/$pkgname"
}

_vulkan_driver_deps=('expat' 'libdrm' 'llvm' 'vulkan-icd-loader' 'wayland'
		     'zlib' 'zstd')

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

package_vulkan-panfrost()
{
  pkgdesc="Open-source Vulkan driver for Mali-GPUs"
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

