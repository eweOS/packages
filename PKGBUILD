# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=wasi-llvm-libs
pkgver=21.1.8
pkgrel=1
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://llvm.org'
pkgdesc='LLVM runtime libraries for WASI platform'
license=('Apache-2.0 WITH LLVM-exception')
makedepends=(cmake ninja wasi-libc python)
provides=(wasi-compiler-rt wasi-libc++ wasi-libc++abi)
replaces=(wasi-compiler-rt wasi-libc++ wasi-libc++abi)
conflicts=(wasi-compiler-rt wasi-libc++ wasi-libc++abi)
source=("https://github.com/llvm/llvm-project/archive/refs/tags/llvmorg-${pkgver}.tar.gz"
        wasi-toolchain.cmake::https://raw.githubusercontent.com/WebAssembly/wasi-sdk/fef66e3d2319d8360825dcba1cf23061f5313c11/wasi-sdk.cmake
        llvm-install-prefix.patch)
sha256sums=('7ba3f2a8d8fda88be18a31d011e8195d3b7f87f9fa92b20c94cba2d7f65b0e3f'
            '5e58f02fe01ea22ea0406e4250ad89a053d517ef103a1dacfade4ecd98a7f2bc'
            'e2655207dd8a90e8fdc9c7cc7c701738bc8ba932692a0752ace8cd06b45ccf94')

_basedir=llvm-project-llvmorg-$pkgver

prepare() {
  _patch_ "$_basedir"
  cd "$_basedir"
  mkdir -p cmake/Platform && echo "set(WASI 1)" > cmake/Platform/WASI.cmake
}

build() {
  export WASI_COMMON_ARGS=(
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_C_COMPILER_WORKS=ON
    -DCMAKE_CXX_COMPILER_WORKS=ON
    -DCMAKE_AR=/usr/bin/ar
    -DCMAKE_MODULE_PATH="$srcdir"/cmake
    -DCMAKE_TOOLCHAIN_FILE="$srcdir"/wasi-toolchain.cmake
    -DWASI_SDK_PREFIX=/usr
    -DUNIX=ON
  )

  export WASI_RUNTIME_ARGS=(
    -DLLVM_ENABLE_RUNTIMES="libcxx;libcxxabi"
    -DCMAKE_STAGING_PREFIX=/usr/share/wasi-sysroot
    -DCMAKE_SYSROOT=/usr/share/wasi-sysroot
    -DLIBCXX_ABI_VERSION=2
    -DLIBCXX_CXX_ABI=libcxxabi
    -DLIBCXX_ENABLE_THREADS=OFF
    -DLIBCXXABI_ENABLE_THREADS=OFF
    -DLIBCXX_HAS_PTHREAD_API=OFF
    -DLIBCXXABI_HAS_PTHREAD_API=OFF
    -DLIBCXX_ENABLE_EXCEPTIONS=OFF
    -DLIBCXXABI_ENABLE_EXCEPTIONS=OFF
    -DLIBCXX_ENABLE_FILESYSTEM=OFF
    -DLIBCXX_ENABLE_SHARED=OFF
    -DLIBCXXABI_ENABLE_SHARED=OFF
    -DLIBCXX_HAS_WIN32_THREAD_API=OFF
    -DLIBCXXABI_HAS_WIN32_THREAD_API=OFF
    -DLIBCXX_HAS_MUSL_LIBC=ON
    -DLIBCXX_HAS_EXTERNAL_THREAD_API=OFF
    -DLIBCXXABI_HAS_EXTERNAL_THREAD_API=OFF
    -DLIBCXXABI_USE_LLVM_UNWINDER=OFF
  )

  export WASI_CRT_ARGS=(
    -DCOMPILER_RT_BAREMETAL_BUILD=ON
    -DCOMPILER_RT_INCLUDE_TESTS=OFF
    -DCOMPILER_RT_HAS_FPIC_FLAG=OFF
    -DCOMPILER_RT_DEFAULT_TARGET_ONLY=ON
    -DCOMPILER_RT_OS_DIR=wasi
    -DCMAKE_INSTALL_PREFIX=/usr/lib/clang/$pkgver/
  )

  export CFLAGS="$(echo $CFLAGS | sed "s/-march=\S*//")"
  export CXXFLAGS="$(echo $CXXFLAGS | sed "s/-march=\S*//")"

  case $CARCH in
    x86_64)
      export CFLAGS="$(echo $CFLAGS | sed "s/-fstack-clash-protection//; s/-fcf-protection//")"
      export CXXFLAGS="$(echo $CXXFLAGS | sed "s/-fstack-clash-protection//; s/-fcf-protection//")"
      ;;
    loongarch64)
      export CFLAGS="$(echo $CFLAGS | sed "s/-mcmodel=medium//")"
      export CXXFLAGS="$(echo $CXXFLAGS | sed "s/-mcmodel=medium//")"
      ;;
  esac

  cmake -B build-wasi-cxx -G Ninja \
    "${WASI_COMMON_ARGS[@]}" \
    "${WASI_RUNTIME_ARGS[@]}" \
    -S $_basedir/runtimes

  cmake --build build-wasi-cxx -j "$JOBS"

  cmake -B build-wasi-crt -G Ninja \
    "${WASI_COMMON_ARGS[@]}" \
    "${WASI_CRT_ARGS[@]}" \
    -S $_basedir/compiler-rt/lib/builtins

  cmake --build build-wasi-crt -j "$JOBS"
}

package_wasi-llvm-libs() {
  DESTDIR="$pkgdir" cmake --install build-wasi-crt
  DESTDIR="$pkgdir" cmake --install build-wasi-cxx

  _install_license_ "$_basedir/compiler-rt/CREDITS.TXT" CREDITS-compiler-rt
  _install_license_ "$_basedir/compiler-rt/LICENSE.TXT" LICENSE-compiler-rt
  _install_license_ "$_basedir/libcxx/CREDITS.TXT" CREDITS-libcxx
  _install_license_ "$_basedir/libcxx/LICENSE.TXT" LICENSE-libcxx
  _install_license_ "$_basedir/libcxxabi/CREDITS.TXT" CREDITS-libcxxabi
  _install_license_ "$_basedir/libcxxabi/LICENSE.TXT" LICENSE-libcxxab
}
