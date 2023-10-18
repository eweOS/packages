# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=(llvm llvm-libs llvm-lto lldb openmp lld clang wasi-libc++ wasi-libc++abi wasi-compiler-rt)
_realpkgname=llvm-project
pkgver=16.0.6
_binutilsver=2.41
pkgrel=2
arch=('x86_64' 'aarch64' 'riscv64')
url='htps://llvm.org'
license=('custom:Apache 2.0 with LLVM Exception')
makedepends=(
  llvm
  cmake
  ninja
  utmps
  zlib
  libffi
  libedit
  git
  libxml2
  lld
  wasi-libc
  openmp
)
source=(
  "https://github.com/llvm/llvm-project/releases/download/llvmorg-${pkgver}/llvm-project-${pkgver}.src.tar.xz"
  "https://mirrors.tuna.tsinghua.edu.cn/gnu/binutils/binutils-${_binutilsver}.tar.xz"
  wasi-toolchain.cmake::https://raw.githubusercontent.com/WebAssembly/wasi-sdk/main/wasi-sdk.cmake
  rv64-disable-lldb-server.patch
)
sha256sums=('ce5e71081d17ce9e86d7cbcfa28c4b04b9300f8fb7e78422b1feb6bc52c3028e'
            'ae9a5789e23459e59606e6714723f2d3ffc31c03174191ef0d015bdf06007450'
            '7ded3468de11201bc58c761ca065bc6f42ed9381a7b13721364befff9876b30a'
            '19ad5d5208e7271e0517de15b8ec652a0445298aa34cb7057d5da254966aa781')

_basedir=$_realpkgname-$pkgver.src

FLIST_clang=(
  "usr/bin/*clang*"
  "usr/bin/c-index-test"
  "usr/bin/cc"
  "usr/bin/c++"
  "usr/lib/cmake/clang"
  "usr/share/clang"
  "usr/include/clang-c"
  "usr/include/clang"
  "usr/lib/libclang*.so"
  "usr/lib/libclang*.a"
  "usr/bin/analyze-build"
  "usr/bin/intercept-build"
  "usr/bin/scan-*"
  "usr/lib/clang"
  "usr/lib/libear"
  "usr/lib/libscanbuild"
  "usr/libexec/analyze-*"
  "usr/libexec/*analyzer"
  "usr/libexec/intercept-*"
  "usr/share/scan-*"
  "usr/share/man/man1/scan-build.1"
  "usr/lib/libclang.so.*"
  "usr/lib/libclang-cpp.so.*"
)

FLIST_lldb=(
  "usr/bin/*lldb*"
  "usr/lib/liblldb*.so.*"
  "usr/include/lldb"
  "usr/lib/liblldb*.so"
)

FLIST_openmp=(
  "usr/include/ompt-multiplex.h"
  "usr/lib/cmake/openmp"
  "usr/lib/libomptarget-*.bc"
  "usr/lib/libomptarget*.so*"
  "usr/lib/libarcher*.so"
  "usr/lib/libomp*.so"
  "usr/lib/libgomp.so"
  "usr/lib/libiomp5.so"
)

FLIST_lld=(
  "usr/bin/ld"
  "usr/bin/lld*"
  "usr/bin/wasm-ld"
  "usr/bin/ld.lld*"
  "usr/bin/ld64.lld*"
  "usr/include/lld"
  "usr/lib/cmake/lld"
  "usr/lib/liblld*.a"
)

FLIST_llvm_lto=(
  "usr/lib/libLTO.so*"
  "usr/lib/LLVMgold.so*"
)

FLIST_llvm_libs=(
  "usr/lib/libc++.so*"
  "usr/lib/libc++abi.so*"
  "usr/lib/libc++.a"
  "usr/lib/libc++abi.a"
  "usr/lib/libc++experimental.a"
  "usr/lib/libunwind.so.*"
  "usr/lib/libunwind.so"
  "usr/lib/libunwind.a"
  "usr/include/*cxxabi*"
  "usr/include/c++"
  "usr/include/*unwind*"
)

_fetchpkg()
{
  PKGBASE="$srcdir/pkgs/$1" && shift
  mkdir -p $PKGBASE
  for FILEPATH in $@; do
    (cd "${srcdir}/PKGDIR" && find $FILEPATH | cpio -pdvmu $PKGBASE) || true
    (cd "${srcdir}/PKGDIR" && find $FILEPATH -delete) || true
  done
}

prepare()
{
  cd $_basedir
  sed -i \
    -e 's@strtoull_l@strtoull@g' \
    -e '/strtoull/s@, _LIBCPP_GET_C_LOCALE@@' \
    -e 's@strtoll_l@strtoll@g' \
    -e '/strtoll/s@, _LIBCPP_GET_C_LOCALE@@' \
    libcxx/include/locale
  sed -i "/dlfcn.h/s@\$@\n#include <sys/types.h>@" \
    compiler-rt/lib/fuzzer/FuzzerInterceptors.cpp
  patch -p1 < $srcdir/rv64-disable-lldb-server.patch
  mkdir -p cmake/Platform && echo "set(WASI 1)" > cmake/Platform/WASI.cmake
}

build()
{
  # https://os-wiki.ewe.moe/llvm
  export CMARGS=(
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_CXX_FLAGS='-D_LARGEFILE64_SOURCE'
    -DLLVM_DEFAULT_TARGET_TRIPLE="$CHOST"
    -DLLVM_HOST_TRIPLE="$CHOST"
    -DCLANG_DEFAULT_CXX_STDLIB='libc++'
    -DCLANG_DEFAULT_RTLIB='compiler-rt'
    -DLLVM_INSTALL_UTILS=ON
    -DLLVM_ENABLE_LIBCXX=ON
    -DLLVM_ENABLE_FFI=ON
    -DLLVM_ENABLE_LLD=ON
    -DLLVM_INSTALL_BINUTILS_SYMLINKS=ON
    -DLLVM_BUILD_LLVM_DYLIB=ON
    -DLLVM_LINK_LLVM_DYLIB=ON
    -DLLVM_INCLUDE_BENCHMARKS=OFF
    -DLLVM_TARGETS_TO_BUILD="X86;AArch64;RISCV;WebAssembly;AMDGPU"
    -DLIBCXX_HAS_MUSL_LIBC=ON
    -DLIBCXX_USE_COMPILER_RT=ON
    -DLIBCXX_INCLUDE_TESTS=OFF
    -DLIBCXX_INCLUDE_BENCHMARKS=OFF
    -DLIBCXX_INSTALL_LIBRARY_DIR=/usr/lib
    -DLIBCXXABI_INSTALL_LIBRARY_DIR=/usr/lib
    -DLIBUNWIND_INSTALL_LIBRARY_DIR=/usr/lib
    -DLIBCXXABI_USE_LLVM_UNWINDER=ON
    -DLIBCXX_USE_COMPILER_RT=ON
    -DLIBCXXABI_USE_COMPILER_RT=ON
    -DLIBUNWIND_USE_COMPILER_RT=ON
    -DLIBUNWIND_INSTALL_HEADERS=ON
    -DCOMPILER_RT_BUILD_GWP_ASAN=OFF
    -DCOMPILER_RT_BUILD_XRAY=OFF
    -DCOMPILER_RT_BUILD_LIBFUZZER=OFF
    -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=OFF
    -DLLVM_LIBGCC_EXPLICIT_OPT_IN=ON
    -DLLVM_BINUTILS_INCDIR=$srcdir/binutils-${_binutilsver}/include
  )

  export WASI_COMMON_ARGS=(
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_C_COMPILER_WORKS=ON
    -DCMAKE_CXX_COMPILER_WORKS=ON
    -DCMAKE_AR=/usr/bin/ar
    -DCMAKE_MODULE_PATH="${srcdir}"/cmake
    -DCMAKE_TOOLCHAIN_FILE="${srcdir}"/wasi-toolchain.cmake
    -DCMAKE_STAGING_PREFIX=/usr/share/wasi-sysroot
    -DCMAKE_SYSROOT=/usr/share/wasi-sysroot
    -DWASI_SDK_PREFIX=/usr
    -DUNIX=ON
  )

  export WASI_RUNTIME_ARGS=(
    -DLLVM_ENABLE_RUNTIMES="libcxx;libcxxabi"
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
  )

  case $CARCH in
    x86_64)
      CMARGS+=("-DCOMPILER_RT_BUILD_SANITIZERS=ON")
      ;;
    aarch64)
      CMARGS+=("-DCOMPILER_RT_BUILD_SANITIZERS=OFF")
      ;;
    riscv64)
      CMARGS+=("-DCOMPILER_RT_BUILD_SANITIZERS=OFF")
      ;;
  esac

  cmake -B build -G Ninja \
    "${CMARGS[@]}" \
    -DLLVM_ENABLE_PROJECTS="clang;compiler-rt;lld;lldb;openmp" \
    -DLLVM_ENABLE_RUNTIMES="libunwind;libcxxabi;libcxx" \
    -S $_basedir/llvm

  ninja -C build

  export DESTDIR="${srcdir}/PKGDIR"

  ninja -C build install
  ninja -C build install-runtimes

  export CFLAGS="$(echo $CFLAGS | sed "s/-mtune=generic//;
  s/-fstack-clash-protection//; s/-fcf-protection//; s/-fexceptions//")"
  export CXXFLAGS="$(echo $CXXFLAGS | sed "s/-mtune=generic//;
  s/-fstack-clash-protection//; s/-fcf-protection//; s/-fexceptions//")"

  cmake -B build-wasi-cxx -G Ninja \
    "${WASI_COMMON_ARGS[@]}" \
    "${WASI_RUNTIME_ARGS[@]}" \
    -S $_basedir/runtimes

  ninja -C build-wasi-cxx

  cmake -B build-wasi-crt -G Ninja \
    "${WASI_COMMON_ARGS[@]}" \
    "${WASI_CRT_ARGS[@]}" \
    -S $_basedir/compiler-rt/lib/builtins

  ninja -C build-wasi-crt

  _fetchpkg clang "${FLIST_clang[@]}"
  _fetchpkg lldb "${FLIST_lldb[@]}"
  _fetchpkg openmp "${FLIST_openmp[@]}"
  _fetchpkg lld "${FLIST_lld[@]}"
  _fetchpkg llvm-lto "${FLIST_llvm_lto[@]}"
  _fetchpkg llvm-libs "${FLIST_llvm_libs[@]}"
}

package_clang()
{
  pkgdesc="C language family frontend for LLVM."
  depends=("llvm")

  mv "$srcdir/pkgs/clang/usr" "${pkgdir}/usr"
  ln -s clang "${pkgdir}/usr/bin/cc"
  ln -s clang++ "${pkgdir}/usr/bin/c++"
}

package_lldb()
{
  pkgdesc="Next generation, high-performance debugger from LLVM project."
  depends=('llvm-libs' 'clang')

  mv "$srcdir/pkgs/lldb/usr" "${pkgdir}/usr"
}

package_openmp()
{
  pkgdesc="LLVM OpenMP Runtime Library."
  depends=('llvm-libs' 'libelf' 'libffi')

  mv "$srcdir/pkgs/openmp/usr" "${pkgdir}/usr"
}

package_lld()
{
  pkgdesc="a drop-in replacement for the GNU linkers by LLVM project."
  provides=("ld")
  depends=('zlib' 'llvm-libs' 'libedit' 'ncurses' 'libxml2' 'xz')

  mv "$srcdir/pkgs/lld/usr" "${pkgdir}/usr"
}

package_llvm-lto()
{
  pkgdesc="lto library for LLVM."

  mv "$srcdir/pkgs/llvm-lto/usr" "${pkgdir}/usr"
}

package_llvm-libs()
{
  pkgdesc="LLVM runtime libraries for c++ and more."

  mv "$srcdir/pkgs/llvm-libs/usr" "${pkgdir}/usr"

  # libgcc_s replacement
  ln -s libunwind.so.1.0 $pkgdir/usr/lib/libgcc_s.so.1.0
  ln -s libgcc_s.so.1.0 $pkgdir/usr/lib/libgcc_s.so.1
  ln -s libgcc_s.so.1.0 $pkgdir/usr/lib/libgcc_s.so
}

package_llvm()
{
  pkgdesc="LLVM Compiler infrastructure and runtime library."
  depends=('llvm-libs' 'zlib' 'libffi' 'libedit' 'ncurses' 'libxml2')

  mv "${srcdir}/PKGDIR/usr" "${pkgdir}/usr"
}

package_wasi-compiler-rt() {
  pkgdesc='WASI LLVM compiler runtime'

  DESTDIR="${pkgdir}" ninja -C build-wasi-crt install

  install -Dm0644 $_basedir/compiler-rt/CREDITS.TXT "${pkgdir}"/usr/share/licenses/${pkgname}/CREDITS
  install -Dm0644 $_basedir/compiler-rt/LICENSE.TXT "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

# Do not remove the space before the () or commitpkg will
# accidentally to run this function on the system (!!!)
package_wasi-libc++ () {
  pkgdesc='WASI LLVM C++ standard library'

  DESTDIR="${pkgdir}" ninja -C build-wasi-cxx install-cxx

  install -Dm0644 $_basedir/libcxx/CREDITS.TXT "${pkgdir}"/usr/share/licenses/${pkgname}/CREDITS
  install -Dm0644 $_basedir/libcxx/LICENSE.TXT "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

package_wasi-libc++abi() {
  pkgdesc='WASI Low level support for the LLVM C++ standard library'

  DESTDIR="${pkgdir}" ninja -C build-wasi-cxx install-cxxabi

  install -Dm0644 $_basedir/libcxxabi/CREDITS.TXT "${pkgdir}"/usr/share/licenses/${pkgname}/CREDITS
  install -Dm0644 $_basedir/libcxxabi/LICENSE.TXT "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
