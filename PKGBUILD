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
pkgver=24.1.4
pkgrel=2
arch=(x86_64 aarch64 riscv64)
depends=('libglvnd' 'libelf' 'zstd' 'libdrm' 'llvm')
makedepends=(
  'libva'
  'glslang'
  'meson'
  'wayland' 'wayland-protocols'
  'python-packaging'
  'linux-headers'
  'libclc' 'spirv-llvm-translator' 'spirv-tools'
  'python-mako')
url="https://www.mesa3d.org/"
license=('custom')
# mold may fails with lto enabled
options=(!lto)
# use patchset from AOSC OS
source=(
  https://mesa.freedesktop.org/archive/$pkgbase-$pkgver.tar.xz
  0001-meson-set-default-drivers-for-ppc-ppc64.patch
  0002-meson-set-default-Vulkan-drivers-for-ppc-ppc64.patch
  0003-fix-meson.build-more-Gallium-Vulkan-drivers-for-on-a.patch
  0004-gallivm-add-lp_context_ref-for-combine-usage-of-LLVM.patch
  0005-gallivm-move-ppc-denorm-disable-to-inline.patch
  0006-gallivm-split-some-code-out-from-init-module.patch
  0007-gallivm-make-lp_bld_coro.h-c-include-safe.patch
  0008-gallivm-export-target-init-code-for-orc-jit-to-reuse.patch
  0009-gallivm-split-out-generating-LLVM-Mattrs.patch
  0010-gallivm-create-a-pass-manager-wrapper.patch
  0011-llvmpipe-add-gallivm_add_global_mapping.patch
  0012-llvmpipe-make-unnamed-global-have-internal-linkage.patch
  0013-util-detect-RISC-V-architecture.patch
  0014-gallivm-add-riscv-support-to-the-mattrs-setting-code.patch
  0015-llvmpipe-add-function-name-to-gallivm_jit_function.patch
  0016-llvmpipe-tests-add-a-new-test-for-multiple-symbols-f.patch
  0017-llvmpipe-add-an-implementation-with-llvm-orcjit.patch
  0018-llvmpipe-append-partial-mask-to-partial-fs_variant-f.patch
  0019-llvmpipe-add-shader-cache-support-for-ORCJIT-impleme.patch
  0020-util-detect-LoongArch-architecture.patch
  0021-gallivm-add-LoongArch-support-to-the-mattrs-setting-.patch
  0022-llvmpipe-add-LoongArch-support-in-ORCJIT.patch
  0023-LOONGARCH64-fix-iris_bufmgr.c-set-PAGE_SIZE-as-16384.patch.loongarch64
  0024-vulkan-runtime-Rename-vk_meta_object_list-to-vk_obje.patch
  0025-vulkan-runtime-Split-vk_object_list-into-separate-fi.patch
  0100-gl-without-glx.patch
)
sha512sums=('0293f1493685888e5d2f0e616645c937e5a9c348fcb654b050b7c42bfdade1518c508920e456cf8be0033dceab4570a916db87dbb454174e425d91e9c05d0748'
            'fd8801a3affe714aeb17b795b50151f93bd9d7648ba7e5c32fd3d7e2f253bd7f7ca1f2e24d6cca3daa2da36d40228fff7458a2fe68bfd3c1c34c648c0f4bcbf6'
            '6fce93fc3f2036dc30581540279d800c683f5eee14a9afb5d192fa20b192901a07da489cac378e243d10c330985ae13e5b899e0575e9c47a288c396f7cc41faf'
            'f4815f731af3ee5991444269775d5fccba3443d7e7f3b84552f58f2e1c60ae71d629f16ba4fc5cdfbfa2f322b3ee7f5a64ecbc1208dc973b16c7990b80b066ca'
            'd5615d8953e7eab93e031199cce1b8b9b6d0bc8389b5e3bd51457f1218a9596678c0560e7d89bea9df43647993583c2547c177aa8f4522249aada0951de2a09b'
            'a83f853200639384b93055c4384e9936af6c78f4bf48a4786c54f3ec3048de9b3225384d73a9e138056443519ab7a9f2cdf664bf17763f9bd76a25c5e11f6270'
            '2568f3a10f866dde50cbf38103873cf8067b5a40388f289d27bd9207013490da0cc295fb37c82c87ae82bc46fcd3818dc57ae9f08445e798720dabec1bc03eaf'
            '9c350cc6b75c66f54ad9dedd8aa70e657c02e6b506104c7fb85c2a07776f72759c29e0d0b9f85d2daa19e0c3d655ada403055ad8470c86433fd3f8086edb873c'
            '0e48de512d374002888190323acb0ae5b2394fe4481ca953e1638595769467b1c4923d0964ec416a04152ec1be37c248f5e6d94205496589b252fc14dfaaf65b'
            'e899ffb3947761231b0f9acdee8784444f9e5af68c819534b6837599b3ec8c84475f3b76df82c552a77d89ae4171a3c9045d41e932cc63f8325e4a312c5e052b'
            '64128254ec35697c0f0f35af4d4a24ad61fef3f46890c041a10a2efdee69853227efd47a6bd5260d7ba21504c8337a753debf2c47b054f6081a23ede7344335e'
            '38bc1f99c7a9f2058a6fccda13c38012d59d0861ee22133050f1addf77a73c604f1dc4005795b10c8171327897cf29ca4f7c8faf32b381cc32b79ae486356a0d'
            'd99fe7524113caab8a36000d5713ef34773a122599d80e729c1b74d62a68328bbddae49988678193dc905f148ebab0b2c60cac2074ed6f9aa637ff0354081fa9'
            'bcd53526a4a002c1e638fa96ce9faf0ebe904dbef40d2c2e46adf43b39e8e1ca941b3c552821b3a788aa1d55d9e96c2d2887b76bb85f83582154d431b95aade2'
            '54df7a69573af7bb6bdacf5d1121ad2fe61c7bdb2b900329c19758726dc007e6f0ddc26396824084f1c5312456a157ba4bca7a364d5513c79dcc96d957e4a7b7'
            '2f4faa91e87d889c3fe11711230ace84228e18d6449d12f5b3f10e3eecc0fd5c3b7b3e1270921b3b04204a76759bbf7e98fb40c6b46fbe2c50b393d7dcc12033'
            'c1dfd31c959d408425eaede90a5d9f386046acb4f19240492efda2d7a78b4987f0a98dade0948658214822e7de4a9503c811e0e41876b6cb86300d12eb3c15f1'
            'aff705cfbfd46fbe99848e7bb700a9778d9fa74e390515225008685787fa335a1bdb316c1dba2365db9fa589bdc53e3b02acaf0410e388d52d77923a10bac1ab'
            '12c33874abd54a68f73f39f103e40f49afb47f8ac441b5898877b1b243c0b1fa1c812e9222712157411476908eb59ae26c2c74d43ef44b6ae5cf714982b2ffa8'
            'cf73e3baa66feb8df8887e034e5474b8ae2ba996c2a7494e623da14e70a73351966673e5491ee5639dfdd5699dedd4549deb8ad5d3bb1155d79e44cb13e32fa9'
            '5404e39c96cf17b9d5d356f740470604ebd46b825fd7505b68df1a69f9b0b9620dfc0c76389251974ad08d654ef53c43475ba9031fc038679254131967447ac3'
            'efdec8f344d6c7c37d0453596a788b2f05ad8e8953ff72adfb2df79c30ea6b2e2350fd88d1d526dbff8588660731224aa6c905014f0b78395970ff390a0582e3'
            '4e2406c68c96fdd598beade88477fc500b4e2e0e1057cd77f519bc32b204db1f4fd2c45132ab798de765497da170eda19bf2decfb3246cf9cedef895464c1a44'
            'b544a8bfc4cfcc7394a0b19c281b869001745976b0939046f15808e6580778066069b12f3c0584c09b29c451de7d1fdcf43d3799b19ce6eaf2996d506680a9f7'
            'ce8ee4074e16cc731693158e38069391a8c407b7b2c901b890ff5ff106ab0a57b7a2fa775379b87061015b579202d52455f254b17807bd20f6f7422e8381d5b8'
            'e5739fb7bbe165ee46e70c8de37c3abef9b7cd7c43bd747deca52159597fb049cd6a9e5a27d90b67ddb25849960fed00fd33189ba8d6e325451936f3f6281cf3'
            'ccace374540b7e5ccc0f58ea98ef2cdc782c5650e18e7ee8f8a80b2fe215435d70c86a9d79ac27c0d91b6109c83c337b4445058d73cf604e3ef26cad0b111f34')

prepare()
{
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
    -Dglvnd=enabled \
    -Dllvm=enabled \
    -Dshared-glapi=enabled \
    -Dglx=disabled \
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

package_vulkan-mesa-layers()
{
  pkgdesc="Mesa's Vulkan layers"
  depends=('libdrm' 'wayland' 'python')

  mv "$srcdir/pkgs/$pkgname/usr" "${pkgdir}/usr"

  install -Dm644 $srcdir/$pkgbase-$pkgver/docs/license.rst \
    -t "$pkgdir/usr/share/licenses/$pkgname"
}

