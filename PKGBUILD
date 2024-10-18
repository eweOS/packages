# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=(llvm llvm-tools llvm-devel llvm-libs llvm-lto lldb openmp lld clang flang mlir wasi-libc++ wasi-libc++abi wasi-compiler-rt)
_realpkgname=llvm-project
pkgver=18.1.8
_binutilsver=2.42
pkgrel=5
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url='htps://llvm.org'
license=('custom:Apache 2.0 with LLVM Exception')
# TODO: combine llvm+mlir+openmp => llvm-devel
makedepends=(
  llvm
  mlir
  openmp
  cmake
  ninja
  utmps
  zlib
  libffi
  libedit
  linux-headers
  git
  libxml2
  lld
  wasi-libc
  spirv-llvm-translator
  python
)
# upstreamed:
#  backport-fix-wayfire-...
#  fix-HandleSDNode
#  fix-loongarch64-sc-...
# under review:
#  try-llvm-libunwind
# downstream:
#  others
source=(
  "https://github.com/llvm/llvm-project/releases/download/llvmorg-${pkgver}/llvm-project-${pkgver}.src.tar.xz"
  "https://mirrors.tuna.tsinghua.edu.cn/gnu/binutils/binutils-${_binutilsver}.tar.xz"
  wasi-toolchain.cmake::https://raw.githubusercontent.com/WebAssembly/wasi-sdk/fef66e3d2319d8360825dcba1cf23061f5313c11/wasi-sdk.cmake
  llvm-install-prefix.patch
  0001-clang-force-libc-linked-with-no-as-needed-when-using.patch
  backport-fix-wayfire-lambda-instantiation.patch
  fix-HandleSDNode.patch
  try-llvm-libunwind.patch
  "fix-loongarch64-sc-addrerr.patch::https://github.com/llvm/llvm-project/commit/1825cf28dc83113200b623ebcf063eea35ade79a.patch"
)
sha256sums=('0b58557a6d32ceee97c8d533a59b9212d87e0fc4d2833924eb6c611247db2f2a'
            'f6e4d41fd5fc778b06b7891457b3620da5ecea1006c6a4a41ae998109f85a800'
            '5e58f02fe01ea22ea0406e4250ad89a053d517ef103a1dacfade4ecd98a7f2bc'
            'e2655207dd8a90e8fdc9c7cc7c701738bc8ba932692a0752ace8cd06b45ccf94'
            '57808d224fd9218a936e6669bf4129eaf4aa04fbd45ab9f7fd5a20efc304e307'
            'a25dacfebddbbc0e07c4b479d7e1e9c4cc2cc12f4689a95721dc773003101460'
            'adf4e3795ccaa74b04e90844e51868f9e526e0ec38972f378d8ab7fa777a82d3'
            '13a1c761d41324c7a790df55650a3a98a9ade0348d6e88f1e269b6b77ce5df55'
            'd49121e00ccd5134bc8b42d1126b6b9bfc8a367ff268cd6dd98086818fae342c')

_basedir=$_realpkgname-$pkgver.src

FLIST_llvm_devel=(
  "usr/include/llvm-c"
  "usr/include/llvm"
  "usr/lib/cmake/llvm"
  "usr/lib/libLLVM*.a"
)

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
  "usr/lib/diagtool"
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
  "usr/bin/llvm-omp-*"
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

FLIST_llvm_tools=(
  "usr/bin/*"
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

FLIST_flang=(
  "usr/bin/bbc"
  "usr/bin/f18-parse-demo"
  "usr/bin/fir-opt"
  "usr/bin/flang-new"
  "usr/bin/flang-to-external-fc"
  "usr/bin/tco"
  "usr/include/flang"
  "usr/lib/cmake/flang"
  "usr/lib/libFIR*"
  "usr/lib/libHLFIR*"
  "usr/lib/libFortran*"
  "usr/lib/libflang*"
)

FLIST_mlir=(
  "usr/bin/mlir-*"
  "usr/bin/tblgen-lsp-server"
  "usr/bin/tblgen-to-irdl"
  "usr/lib/objects-Release/obj.MLIR*"
  "usr/include/mlir"
  "usr/include/mlir-c"
  "usr/lib/cmake/mlir"
  "usr/lib/libMLIR*"
  "usr/lib/libmlir*"
)

prepare()
{
  _patch_ $_basedir
  cd $_basedir
  sed -i \
    -e 's@strtoull_l@strtoull@g' \
    -e '/strtoull/s@, _LIBCPP_GET_C_LOCALE@@' \
    -e 's@strtoll_l@strtoll@g' \
    -e '/strtoll/s@, _LIBCPP_GET_C_LOCALE@@' \
    libcxx/include/locale
  sed -i "/dlfcn.h/s@\$@\n#include <sys/types.h>@" \
    compiler-rt/lib/fuzzer/FuzzerInterceptors.cpp
  mkdir -p cmake/Platform && echo "set(WASI 1)" > cmake/Platform/WASI.cmake
}

build()
{
  # build RTTI but disable rtti in makepkg
  export CFLAGS="${CFLAGS//-fno-rtti/}"
  export CXXFLAGS="${CXXFLAGS//-fno-rtti/}"

  # https://os-wiki.ewe.moe/llvm
  export CMARGS=(
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_LIBEXECDIR=bin
    -DCMAKE_CXX_FLAGS='-D_LARGEFILE64_SOURCE'
    -DLLVM_DEFAULT_TARGET_TRIPLE="$CHOST"
    -DLLVM_HOST_TRIPLE="$CHOST"
    -DCLANG_DEFAULT_CXX_STDLIB='libc++'
    -DCLANG_DEFAULT_RTLIB='compiler-rt'
    -DLLVM_INSTALL_UTILS=ON
    -DLLVM_ENABLE_LIBCXX=ON
    -DLLVM_ENABLE_RTTI=ON
    -DLLVM_ENABLE_FFI=ON
    -DLLVM_ENABLE_LLD=ON
    -DLLVM_INSTALL_BINUTILS_SYMLINKS=ON
    -DLLVM_BUILD_LLVM_DYLIB=ON
    -DLLVM_LINK_LLVM_DYLIB=ON
    -DLLVM_INCLUDE_BENCHMARKS=OFF
    -DLLVM_TARGETS_TO_BUILD="X86;AArch64;RISCV;LoongArch;WebAssembly;AMDGPU"
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
    -DLIBUNWIND_ENABLE_FRAME_APIS=ON
    -DLIBUNWIND_INSTALL_HEADERS=ON
    -DSANITIZER_CXX_ABI=libcxxabi
    -DCOMPILER_RT_BUILD_GWP_ASAN=OFF
    -DCOMPILER_RT_BUILD_XRAY=OFF
    -DCOMPILER_RT_BUILD_LIBFUZZER=OFF
    -DCOMPILER_RT_CRT_USE_EH_FRAME_REGISTRY=OFF
    -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=OFF
    -DLLVM_LIBGCC_EXPLICIT_OPT_IN=ON
    -DLLVM_BINUTILS_INCDIR=$srcdir/binutils-${_binutilsver}/include
    -DCLANG_CONFIG_FILE_SYSTEM_DIR=/etc/clang
  )

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

  case $CARCH in
    x86_64)
      CMARGS+=("-DCOMPILER_RT_BUILD_SANITIZERS=ON")
      ;;
    aarch64 | riscv64 | loongarch64)
      CMARGS+=("-DCOMPILER_RT_BUILD_SANITIZERS=OFF")
      ;;
  esac

  cmake -B build -G Ninja \
    "${CMARGS[@]}" \
    -DLLVM_ENABLE_PROJECTS="clang;compiler-rt;flang;mlir;lld;lldb;openmp;libclc" \
    -DLLVM_ENABLE_RUNTIMES="libunwind;libcxxabi;libcxx" \
    -S $_basedir/llvm

  # Ensure compiler-rt has been available before building other rt libraries
  ninja -C build clang LLVMgold
  ninja -C build compiler-rt
  ninja -C build runtimes

  ninja -C build

  export DESTDIR="${srcdir}/PKGDIR"

  ninja -C build install
  ninja -C build install-runtimes

  export CFLAGS="$(echo $CFLAGS | sed "s/-mtune=generic//; s/-march=\S*//")"
  export CXXFLAGS="$(echo $CXXFLAGS | sed "s/-mtune=generic//; s/-march=\S*//")"

  case $CARCH in
    x86_64)
      export CFLAGS="$(echo $CFLAGS | sed "s/-fstack-clash-protection//; s/-fcf-protection//; s/-fexceptions//")"
      export CXXFLAGS="$(echo $CXXFLAGS | sed "s/-fstack-clash-protection//; s/-fcf-protection//; s/-fexceptions//")"
      ;;
  esac

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

  cd $srcdir/PKGDIR
  _pick_ clang "${FLIST_clang[@]}"
  _pick_ flang "${FLIST_flang[@]}"
  _pick_ mlir "${FLIST_mlir[@]}"
  _pick_ lldb "${FLIST_lldb[@]}"
  _pick_ openmp "${FLIST_openmp[@]}"
  _pick_ lld "${FLIST_lld[@]}"
  _pick_ llvm-lto "${FLIST_llvm_lto[@]}"
  _pick_ llvm-devel "${FLIST_llvm_devel[@]}"
  _pick_ llvm-tools "${FLIST_llvm_tools[@]}" # remaining usr/bin/*
  _pick_ llvm-libs "${FLIST_llvm_libs[@]}"
}

package_llvm-devel()
{
  pkgdesc="Development files for LLVM"
  depends=("llvm" "llvm-libs" "mlir" "openmp")

  mv "$srcdir/pkgs/llvm-devel/usr" "${pkgdir}/usr"

  _install_license_ $_basedir/llvm/LICENSE.TXT LICENSE
  _install_license_ $_basedir/llvm/CREDITS.TXT CREDITS
}

package_clang()
{
  pkgdesc="C language family frontend for LLVM."
  depends=("llvm")

  mv "$srcdir/pkgs/clang/usr" "${pkgdir}/usr"
  ln -s clang "${pkgdir}/usr/bin/cc"
  ln -s clang++ "${pkgdir}/usr/bin/c++"
  ln -s clang "${pkgdir}/usr/bin/c89"
  ln -s clang "${pkgdir}/usr/bin/c99"

  _install_license_ $_basedir/clang/LICENSE.TXT
}

package_flang()
{
  pkgdesc="ground-up implementation of a Fortran front end written in modern C++"
  depends=("clang" "mlir")
  mv "$srcdir/pkgs/flang/usr" "${pkgdir}/usr"

  _install_license_ $_basedir/flang/LICENSE.TXT
}

package_mlir()
{
  pkgdesc="Multi-Level IR Compiler Framework for LLVM"
  depends=("llvm-libs")
  mv "$srcdir/pkgs/mlir/usr" "${pkgdir}/usr"

  _install_license_ $_basedir/mlir/LICENSE.TXT
}

package_lldb()
{
  pkgdesc="Next generation, high-performance debugger from LLVM project."
  depends=('llvm-libs' 'clang')

  mv "$srcdir/pkgs/lldb/usr" "${pkgdir}/usr"

  _install_license_ $_basedir/lldb/LICENSE.TXT
}

package_openmp()
{
  pkgdesc="LLVM OpenMP Runtime Library."
  depends=('llvm-libs' 'libelf' 'libffi')

  mv "$srcdir/pkgs/openmp/usr" "${pkgdir}/usr"

  _install_license_ $_basedir/openmp/CREDITS.txt CREDITS
  _install_license_ $_basedir/openmp/LICENSE.TXT LICENSE
}

package_lld()
{
  pkgdesc="a drop-in replacement for the GNU linkers by LLVM project."
  provides=("ld")
  depends=('zlib' 'llvm-libs' 'libedit' 'ncurses' 'libxml2' 'xz')

  mv "$srcdir/pkgs/lld/usr" "${pkgdir}/usr"

  _install_license_ $_basedir/lld/LICENSE.TXT
}

package_llvm-lto()
{
  pkgdesc="lto library for LLVM."

  mv "$srcdir/pkgs/llvm-lto/usr" "${pkgdir}/usr"

  _install_license_ $_basedir/llvm/LICENSE.TXT LICENSE
  _install_license_ $_basedir/llvm/CREDITS.TXT CREDITS
}

package_llvm-libs()
{
  pkgdesc="LLVM runtime libraries for c++ and more."

  mv "$srcdir/pkgs/llvm-libs/usr" "${pkgdir}/usr"

  # libgcc_s replacement
  ln -s libunwind.so.1.0 $pkgdir/usr/lib/libgcc_s.so.1.0
  ln -s libgcc_s.so.1.0 $pkgdir/usr/lib/libgcc_s.so.1
  ln -s libgcc_s.so.1.0 $pkgdir/usr/lib/libgcc_s.so

  for comp_name in llvm libcxx libcxxabi compiler-rt; do
    _install_license_ $_basedir/$comp_name/CREDITS.TXT CREDITS-$comp_name
    _install_license_ $_basedir/$comp_name/LICENSE.TXT LICENSE-$comp_name
  done
  _install_license_ $_basedir/libunwind/LICENSE.TXT LICENSE-libunwind
}

package_llvm-tools()
{
  pkgdesc="LLVM runtime tools."
  depends=('llvm' 'llvm-libs')
  provides=(binutils)
  conflicts=(binutils)
  replaces=(binutils)

  mv "$srcdir/pkgs/llvm-tools/usr" "${pkgdir}/usr"

  _install_license_ $_basedir/llvm/CREDITS.TXT CREDITS
  _install_license_ $_basedir/llvm/LICENSE.TXT LICENSE
}

package_llvm()
{
  pkgdesc="LLVM Compiler infrastructure and runtime library."
  depends=('llvm-libs' 'zlib' 'libffi' 'libedit' 'ncurses' 'libxml2')

  mv "${srcdir}/PKGDIR/usr" "${pkgdir}/usr"

  _install_license_ $_basedir/llvm/CREDITS.TXT CREDITS
  _install_license_ $_basedir/llvm/LICENSE.TXT LICENSE
}

package_wasi-compiler-rt() {
  pkgdesc='WASI LLVM compiler runtime'

  DESTDIR="${pkgdir}" ninja -C build-wasi-crt install

  _install_license_ $_basedir/compiler-rt/CREDITS.TXT CREDITS
  _install_license_ $_basedir/compiler-rt/LICENSE.TXT LICENSE
}

# Do not remove the space before the () or commitpkg will
# accidentally to run this function on the system (!!!)
package_wasi-libc++ () {
  pkgdesc='WASI LLVM C++ standard library'

  DESTDIR="${pkgdir}" ninja -C build-wasi-cxx install-cxx

  _install_license_ $_basedir/libcxx/CREDITS.TXT CREDITS
  _install_license_ $_basedir/libcxx/LICENSE.TXT LICENSE
}

package_wasi-libc++abi() {
  pkgdesc='WASI Low level support for the LLVM C++ standard library'

  DESTDIR="${pkgdir}" ninja -C build-wasi-cxx install-cxxabi

  _install_license_ $_basedir/libcxxabi/CREDITS.TXT CREDITS
  _install_license_ $_basedir/libcxxabi/LICENSE.TXT LICENSE
}
