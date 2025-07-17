# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase='mesa'
pkgname=(
  mesa
  opencl-mesa
  vulkan-gfxstream
  vulkan-intel
  vulkan-radeon
  vulkan-swrast
  vulkan-virtio
  vulkan-mesa-layers
)
pkgdesc="An open-source implementation of the OpenGL specification"
pkgver=25.1.6
pkgrel=1
arch=(x86_64 aarch64 riscv64 loongarch64)
depends=('libglvnd' 'libelf' 'zstd' 'libdrm' 'llvm' 'spirv-tools')
makedepends=(
  'libva'
  'glslang'
  'meson'
  'wayland' 'wayland-protocols'
  'python-packaging'
  'libpng'
  'llvm-devel'
  'linux-headers'
  'directx-headers'
  'libclc' 'rust' 'rust-bindgen' 'spirv-llvm-translator' 'spirv-tools'
  'python-mako' 'python-pycparser' 'python-yaml')
url="https://www.mesa3d.org/"
license=('custom')
# mold may fails with lto enabled
options=(!lto)
source=(
  https://mesa.freedesktop.org/archive/$pkgbase-$pkgver.tar.xz
  gfxstream-lfs64.patch
)
sha512sums=('f6ee07d1a44095106463d0fcef18cf3953b36f86ffda1a1549dcbb8c1a89189f0cbbe66bf556d594140e9a855583972774251f2c0763f73fce77155f18ae6d2b'
            'bcb3389a8382ccec65e2f476f43db5eab45d47b66869644ebb489472281f99a9d0cc24f54803bf1eef2eb03993b3f83fb50d303c36858e6c07600fff3f2aca51')

[ "$CARCH" = x86_64 ] && pkgname+=(vulkan-dzn)
[ "$CARCH" = aarch64 ] && pkgname+=(vulkan-panfrost)

prepare()
{
  _patch_ $pkgbase-$pkgver
}

build()
{
  GALLIUM_DRI_COMMON="r300,r600,radeonsi,nouveau,virgl,svga,softpipe,llvmpipe,zink"
  VULKAN_DRI_COMMON="amd,gfxstream,intel,intel_hasvk,swrast,virtio"
  case "${CARCH}" in
    x86_64)
	    GALLIUM_DRI="${GALLIUM_DRI_COMMON},i915,iris,crocus,d3d12"
	    VULKAN_DRI="${VULKAN_DRI_COMMON},microsoft-experimental"
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
  VULKAN_LAYER=device-select,intel-nullhw,overlay,screenshot,vram-report-limit
  ewe-meson $pkgbase-$pkgver build \
    --libdir=lib \
    -D platforms=wayland \
    -Dglvnd=enabled \
    -Dllvm=enabled \
    -Dshared-glapi=enabled \
    -Dglx=disabled \
    -Dgles1=enabled \
    -Dgles2=enabled \
    -Dopengl=true \
    -Dvulkan-drivers=${VULKAN_DRI} \
    -Dvulkan-layers=${VULKAN_LAYER} \
    -Dgallium-drivers=${GALLIUM_DRI} \
    -Dgallium-extra-hud=true \
    -Dgallium-rusticl=true \
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
    -Dintel-rt=disabled

  meson configure build
  meson compile -C build
}

package_mesa()
{
  provides=(
    libva-mesa-driver mesa-libgl
    libva-driver opengl-driver
  )
  conflicts=(libva-mesa-driver)
  replaces=(libva-mesa-driver)

  DESTDIR="${pkgdir}" meson install -C build

  cd $pkgdir

  # opencl-mesa
  _pick_ opencl-mesa usr/lib/libRusticlOpenCL*
  _pick_ opencl-mesa etc/OpenCL/vendors/rusticl.icd

  # vulkan-dzn
  _pick_ vulkan-dzn usr/share/vulkan/icd.d/dzn_icd.*.json
  _pick_ vulkan-dzn usr/lib/libvulkan_dzn.so
  _pick_ vulkan-dzn usr/lib/libspirv_to_dxil.*
  _pick_ vulkan-dzn usr/bin/spirv2dxil

  # vulkan-gfxstream
  _pick_ vulkan-gfxstream usr/share/vulkan/icd.d/gfxstream_vk_icd.*.json
  _pick_ vulkan-gfxstream usr/lib/libvulkan_gfxstream.so

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

package_opencl-mesa() {
  pkgdesc="Open-source OpenCL drivers"
  depends=(
    clang
    expat
    libdrm
    libelf
    zlib
    zstd
    libclc # For /usr/share/clc/
  )
  optdepends=("opencl-headers: headers necessary for OpenCL development")
  provides=('opencl-driver')
  replaces=("opencl-clover-mesa")
  conflicts=("opencl-clover-mesa")
  mv "$srcdir/pkgs/$pkgname/"{etc,usr} "${pkgdir}/"

  install -Dm644 $srcdir/$pkgbase-$pkgver/docs/license.rst \
    -t "$pkgdir/usr/share/licenses/$pkgname"
}

_vulkan_driver_deps=('expat' 'libdrm' 'llvm' 'vulkan-icd-loader' 'wayland'
		     'zlib' 'zstd' 'spirv-tools')

package_vulkan-dzn()
{
  pkgdesc="Open-source Vulkan driver for D3D12"
  depends=(${_vulkan_driver_deps[*]})
  optdepends=("vulkan-mesa-layers: additional vulkan layers")
  provides=(vulkan-driver)
  mv "$srcdir/pkgs/$pkgname/usr" "${pkgdir}/usr"

  install -Dm644 $srcdir/$pkgbase-$pkgver/docs/license.rst \
    -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_vulkan-gfxstream()
{
  pkgdesc="Open-source Vulkan driver for Graphics Streaming Kit"
  depends=(${_vulkan_driver_deps[*]})
  optdepends=('vulkan-mesa-layers: additional vulkan layers')
  provides=('vulkan-driver')
  mv "$srcdir/pkgs/$pkgname/usr" "${pkgdir}/usr"

  install -Dm644 $srcdir/$pkgbase-$pkgver/docs/license.rst \
    -t "$pkgdir/usr/share/licenses/$pkgname"
}

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
  depends=('libdrm' 'libpng' 'wayland' 'python')

  mv "$srcdir/pkgs/$pkgname/usr" "${pkgdir}/usr"

  install -Dm644 $srcdir/$pkgbase-$pkgver/docs/license.rst \
    -t "$pkgdir/usr/share/licenses/$pkgname"
}

