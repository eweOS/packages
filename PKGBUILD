# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=(wasi-libc++ wasi-libc++abi wasi-compiler-rt)
_realpkgname=llvm-project
pkgver=15.0.6
pkgrel=2
arch=('any')
url='https://llvm.org/'
license=('custom:Apache 2.0 with LLVM Exception')
makedepends=('cmake' 'ninja' 'python' 'wasi-libc' 'openmp' 'llvm-lto')
source=(
  https://github.com/llvm/${_realpkgname}/releases/download/llvmorg-${pkgver}/${_realpkgname}-${pkgver}.src.tar.xz
  wasi-toolchain.cmake::https://raw.githubusercontent.com/WebAssembly/wasi-sdk/main/wasi-sdk.cmake
)
sha256sums=('9d53ad04dc60cb7b30e810faf64c5ab8157dadef46c8766f67f286238256ff92'
            '7ded3468de11201bc58c761ca065bc6f42ed9381a7b13721364befff9876b30a')
_basedir=$_realpkgname-$pkgver.src
options=('staticlibs' '!lto' '!debug')

prepare() {
  mkdir -p $_basedir/cmake/Platform
  echo "set(WASI 1)" > $_basedir/cmake/Platform/WASI.cmake
}

build() {
  # Build options are derived from here https://github.com/WebAssembly/wasi-sdk/blob/main/Makefile
  # remove compiler options not supported by the wasm32-wasi target
  export CFLAGS="$(echo $CFLAGS | sed "s/-mtune=generic//;
  s/-fstack-clash-protection//; s/-fcf-protection//; s/-fexceptions//")"
  export CXXFLAGS="$(echo $CXXFLAGS | sed "s/-mtune=generic//;
  s/-fstack-clash-protection//; s/-fcf-protection//; s/-fexceptions//")"

  export WASI_COMMON_ARGS=(
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_C_COMPILER_WORKS=ON
    -DCMAKE_CXX_COMPILER_WORKS=ON
    -DCMAKE_AR=/usr/bin/ar
    -DCMAKE_MODULE_PATH="${srcdir}"/cmake
    -DCMAKE_TOOLCHAIN_FILE="${srcdir}"/wasi-toolchain.cmake
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
  )

  export WASI_CRT_ARGS=(
    -DCOMPILER_RT_BAREMETAL_BUILD=ON
    -DCOMPILER_RT_INCLUDE_TESTS=OFF
    -DCOMPILER_RT_HAS_FPIC_FLAG=OFF
    -DCOMPILER_RT_DEFAULT_TARGET_ONLY=ON
    -DCOMPILER_RT_OS_DIR=wasi
    -DCMAKE_INSTALL_PREFIX=/usr/lib/clang/$pkgver/
  )

  cmake -B build-runtime -G Ninja \
    "${WASI_COMMON_ARGS[@]}" \
    "${WASI_RUNTIME_ARGS[@]}" \
    $_basedir/runtimes

  ninja -C build-runtime
  
  cmake -B build-crt -G Ninja \
    "${WASI_COMMON_ARGS[@]}" \
    "${WASI_CRT_ARGS[@]}" \
    $_basedir/compiler-rt/lib/builtins

  ninja -C build-crt
}

package_wasi-compiler-rt() {
  pkgdesc='WASI LLVM compiler runtime'

  DESTDIR="${pkgdir}" ninja -C build-crt install

  install -Dm0644 $_basedir/compiler-rt/CREDITS.TXT "${pkgdir}"/usr/share/licenses/${pkgname}/CREDITS
  install -Dm0644 $_basedir/compiler-rt/LICENSE.TXT "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

# Do not remove the space before the () or commitpkg will
# accidentally to run this function on the system (!!!)
package_wasi-libc++ () {
  pkgdesc='WASI LLVM C++ standard library'

  DESTDIR="${pkgdir}" ninja -C build-runtime install-cxx

  install -Dm0644 $_basedir/libcxx/CREDITS.TXT "${pkgdir}"/usr/share/licenses/${pkgname}/CREDITS
  install -Dm0644 $_basedir/libcxx/LICENSE.TXT "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

package_wasi-libc++abi() {
  pkgdesc='WASI Low level support for the LLVM C++ standard library'

  DESTDIR="${pkgdir}" ninja -C build-runtime install-cxxabi

  install -Dm0644 $_basedir/libcxxabi/CREDITS.TXT "${pkgdir}"/usr/share/licenses/${pkgname}/CREDITS
  install -Dm0644 $_basedir/libcxxabi/LICENSE.TXT "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
