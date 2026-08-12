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
  vulkan-nouveau
)
pkgdesc="An open-source implementation of the OpenGL specification"
pkgver=26.2.0
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
  'libdisplay-info'
  'libclc' 'rust' 'rust-bindgen' 'spirv-llvm-translator' 'spirv-tools'
  'python-mako' 'python-pycparser' 'python-yaml'
  'cbindgen'
)
url="https://www.mesa3d.org/"
license=('custom')
# mold may fails with lto enabled
options=(!lto)

_syn_pkgver=2.0.87
_quote_pkgver=1.0.35
_proc_macro2_pkgver=1.0.86
_unicode_ident_pkgver=1.0.12
_paste_pkgver=1.0.14
_rustc_hash_pkgver=2.1.1

source=(
  https://mesa.freedesktop.org/archive/$pkgbase-$pkgver.tar.xz
  syn-$_syn_pkgver.tar.gz::https://static.crates.io/crates/syn/syn-$_syn_pkgver.crate
  quote-$_quote_pkgver.tar.gz::https://static.crates.io/crates/quote/quote-$_quote_pkgver.crate
  proc-macro2-$_proc_macro2_pkgver.tar.gz::https://static.crates.io/crates/proc-macro2/proc-macro2-$_proc_macro2_pkgver.crate
  unicode-ident-$_unicode_ident_pkgver.tar.gz::https://static.crates.io/crates/unicode-ident/unicode-ident-$_unicode_ident_pkgver.crate
  paste-$_paste_pkgver.tar.gz::https://static.crates.io/crates/paste/paste-$_paste_pkgver.crate
  rustc-hash-$_rustc_hash_pkgver.tar.gz::https://static.crates.io/crates/rustc-hash/rustc-hash-$_rustc_hash_pkgver.crate
)

sha512sums=('c7c810c6958fa18eb75eea9968d84d0edd29b579d351a7f22d8c2b2b13b6e04e5b0df31dae3aa943672c792d124325bab03ccbd475a16d27267418bddbec4936'
            'bcfff545d6dfefd81e09f8f30a86bdd85759b3a7d4093ef3365ed02718e10dbd604c52b94c9d7fa955d339fdc5b6c079940c6f345b5a48c52b5c8607794ca6f2'
            'f5314fb6af17cf36c228e1970c569c29ec248954a450a5f90ba9e2896d04f74904c9cec5a1f74325f2489295a94491eee4ce8fb461e22cd4b34e53f1f881efd2'
            '1cdb7e22a35ae231d880c9420784c9acf97bda2db258b3d34aae5061dc1858449defe19a49e12c6a4173906aa72a4115059ac2db0fc760205fd2ab8b5b414434'
            'bc1824e1e4452a40732fc69874d7e1a66f7803717a314790dcf48867eba34bc9441331ef031e386912e52c385645c25b6ed39d4f149973b5b97371b1b96b1920'
            '3a793f0e5e773a7f7defc798a4c17ae9a40d715144632ea6cb0a8c785e14c4212046491df016bb9838281f8eaf327a79f01c1e2ac5f26785c028bc880faff9ee'
            '87097d98d47f327d000041ab13acddc366f1500d9c3e5c82169c3358112c7a7c03701c9b3c2c81d9f9da65b7ebac1c479b179dfaf7c059cd0b929b4673e51084')

[ "$CARCH" = x86_64 ] && pkgname+=(vulkan-dzn)
[ "$CARCH" = aarch64 ] && pkgname+=(vulkan-panfrost vulkan-freedreno)

build()
{
  GALLIUM_DRI_COMMON="r300,r600,radeonsi,nouveau,virgl,svga,softpipe,llvmpipe,zink"
  VULKAN_DRI_COMMON="amd,gfxstream,intel,intel_hasvk,swrast,virtio,nouveau"
  case "${CARCH}" in
    x86_64)
	    GALLIUM_DRI="${GALLIUM_DRI_COMMON},i915,iris,crocus,d3d12"
	    VULKAN_DRI="${VULKAN_DRI_COMMON},microsoft-experimental"
	    ;;
    aarch64)
	    GALLIUM_DRI="${GALLIUM_DRI_COMMON},panfrost,freedreno,lima,etnaviv"
	    VULKAN_DRI="${VULKAN_DRI_COMMON},panfrost,freedreno"
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
  
  # Let Meson read rust packages download in source().
  export MESON_PACKAGE_CACHE_DIR="${srcdir}"

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
    -Dvideo-codecs=all \
    -Dmicrosoft-clc=disabled \
    -Dxlib-lease=disabled \
    -Dandroid-libbacktrace=disabled \
    -Dvalgrind=disabled \
    -Dlibunwind=disabled \
    -Dlmsensors=disabled \
    -Ddefault_library=shared \
    -Dllvm-orcjit=true \
    -Dintel-rt=disabled \
    -Dgallium-mediafoundation=disabled

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

  # vulkan-freedreno
  _pick_ vulkan-freedreno usr/share/vulkan/icd.d/freedreno_icd*.json
  _pick_ vulkan-freedreno usr/lib/libvulkan_freedreno.so

  # vulkan-nouveau (NVK)
  _pick_ vulkan-nouveau usr/share/vulkan/icd.d/nouveau_icd*.json
  _pick_ vulkan-nouveau usr/lib/libvulkan_nouveau.so

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
		     'zlib' 'zstd' 'spirv-tools' 'libdisplay-info')

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

package_vulkan-freedreno()
{
  pkgdesc="Open-source Vulkan driver for Adreno GPUs"
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

package_vulkan-nouveau()
{
  pkgdesc="Open-source Vulkan driver for Nvidia Nouveau (NVK)"
  depends=(${_vulkan_driver_deps[*]})
  optdepends=('vulkan-mesa-layers: additional vulkan layers')
  provides=('vulkan-driver')
  mv "$srcdir/pkgs/$pkgname/usr" "${pkgdir}/usr"

  install -Dm644 $srcdir/$pkgbase-$pkgver/docs/license.rst \
    -t "$pkgdir/usr/share/licenses/$pkgname"
}

