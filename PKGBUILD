# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=(llvm llvm-libs llvm-lto lldb openmp lld clang)
_realpkgname=llvm-project
pkgver=15.0.6
_binutilsver=2.39
pkgrel=11
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
)
source=(
  "https://github.com/llvm/llvm-project/releases/download/llvmorg-${pkgver}/llvm-project-${pkgver}.src.tar.xz"
  "https://mirrors.tuna.tsinghua.edu.cn/gnu/binutils/binutils-${_binutilsver}.tar.xz"
  rv64-disable-lldb-server.patch
)
sha256sums=('9d53ad04dc60cb7b30e810faf64c5ab8157dadef46c8766f67f286238256ff92'
  '645c25f563b8adc0a81dbd6a41cffbf4d37083a382e02d5d3df4f65c09516d00'
  '19ad5d5208e7271e0517de15b8ec652a0445298aa34cb7057d5da254966aa781')

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
  cd $_realpkgname-$pkgver.src
  patch -p1 < $srcdir/rv64-disable-lldb-server.patch
}

build()
{
  cd $_realpkgname-$pkgver.src
  sed -i \
    -e 's@strtoull_l@strtoull@g' \
    -e '/strtoull/s@, _LIBCPP_GET_C_LOCALE@@' \
    -e 's@strtoll_l@strtoll@g' \
    -e '/strtoll/s@, _LIBCPP_GET_C_LOCALE@@' \
    libcxx/include/locale
  sed -i "/dlfcn.h/s@\$@\n#include <sys/types.h>@" \
    compiler-rt/lib/fuzzer/FuzzerInterceptors.cpp
  install -d build
  cd build || return 1

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
    -DLLVM_TARGETS_TO_BUILD="X86;AArch64;RISCV"
    -DLIBCXX_HAS_MUSL_LIBC=ON
    -DLIBCXX_USE_COMPILER_RT=ON
    -DLIBCXX_INCLUDE_TESTS=OFF
    -DLIBCXX_INCLUDE_BENCHMARKS=OFF
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

  cmake "${CMARGS[@]}" \
    -DLLVM_ENABLE_PROJECTS="clang;compiler-rt;libunwind;lld;lldb;libcxxabi;libcxx;openmp" \
    ../llvm
  cmake --build .
  export DESTDIR="${srcdir}/PKGDIR"
  cmake --build . --target install

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
