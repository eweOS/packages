# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase='mesa'
pkgname=(
  mesa
  opencl-clover-mesa
  vulkan-swrast
  vulkan-virtio
  vulkan-intel
  vulkan-radeon
  vulkan-mesa-layers
)
pkgdesc="An open-source implementation of the OpenGL specification"
pkgver=24.3.0
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
)
sha512sums=('20168ae4c278776a60d5febf53b3367cf08bffffb40ef2054821e68d7a8c37a07871d097ab17555f41a4fe716f0de7df95ad7d452b1ed57db6527838eb839ba4'
            'f0ca2413818667d912a646d2b7d8106a9fda29f43586d913f19bf9ad134b890f9a53d19a1254bed4f2b08a42cc609d9012f44735020ccaaaf39432a9b9dd8b93')

[ "$CARCH" = aarch64 ] && pkgname+=(vulkan-panfrost)

prepare()
{
  _patch_ $pkgbase-$pkgver
}

build()
{
  GALLIUM_DRI_COMMON="r300,r600,radeonsi,nouveau,virgl,svga,softpipe,llvmpipe,zink"
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
    -Dgallium-opencl=icd \
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

  # opencl-clover-mesa
  _pick_ opencl-clover-mesa usr/lib/gallium-pipe
  _pick_ opencl-clover-mesa usr/lib/libMesaOpenCL*
  _pick_ opencl-clover-mesa etc/OpenCL/vendors/mesa.icd

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

package_opencl-clover-mesa() {
  pkgdesc="Open-source OpenCL drivers - Clover variant"
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
  mv "$srcdir/pkgs/$pkgname/"{etc,usr} "${pkgdir}/"

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

