# Maintainer: Yukari Chiba <i@0x7f.cc>

# TODO:
# - split lldb, openmp, flang, mlir into separate PKGBUILD
# - install manpages
# Also note that currently compiler-rt is bundled in clang.
pkgname=(
  llvm llvm-tools llvm-devel llvm-libs llvm-lto
  clang clang-tools
  lld
  lldb openmp flang mlir
)
_realpkgname=llvm-project
pkgver=21.1.8
pkgrel=1
_binutilsver=2.46.0
_majorver="${pkgver%%.*}"
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://llvm.org'
license=('Apache-2.0 WITH LLVM-exception')
makedepends=(llvm-devel cmake ninja utmps zlib zstd libffi libedit linux-headers git
             spirv-llvm-translator python)
# 0001: Should be upstreamed, ensure clang-config and llvm-config's
#	installation path fits in CMAKE_INSTALL_PREFIX.
# 0002: Under review, link to LLVM libunwind to avoid usage of __register_frame,
#	which leads to error messages like
#	libunwind: __unw_add_dynamic_fde: bad fde: FDE is really a CIE
#	caused by different behavior between libgcc and LLVM libunwind.
#	https://github.com/llvm/llvm-project/pull/112087
# 0003: Workaround, always link libc with -Wl,no-as-needed, to prevent
#	reference to weak symbol __cxa_finalize in compile-rt from being
#	considered dead, resulting in unresovable symbols, calls to which
#	mold used to turn into a dead loop on riscv64.
#
#	This only caused issues on riscv64 (not sure whether loongarch64 is
#	affected), and may already be unnecessary since mold 2.39.0, commit
#	e08e7f6aa447 ("Do not turn a call to a resolved weak undefined symbol into an infinite loop")
#
#	See also https://github.com/rui314/mold/issues/1451
#		 https://github.com/llvm/llvm-project/pull/95848
# 0004: Downstream, see also notes in prepare() function.
#	LLVM vendors a Findzstd.cmake which isn't compatible with newer zstd's
#	CMake configuration file. We decided to remove LLVM's copy, but behavior
#	differences between the two implementations may mess up the zstd-related
#	flags provided by llvm-config --system-libs --link-static.
#	The patch mimics the behavior of the LLVM implementation.
source=("https://github.com/llvm/llvm-project/archive/refs/tags/llvmorg-${pkgver}.tar.gz"
        "https://ftp.gnu.org/gnu/binutils/binutils-${_binutilsver}.tar.xz"
        0001-fix-llvm-clang-config-install-prefix.patch
        0002-try-llvm-libunwind.patch
        0003-clang-force-libc-linked-with-no-as-needed-when-using.patch
        0004-llvm-Support-strip-zstd-library-sover-suffix.patch)
sha256sums=('7ba3f2a8d8fda88be18a31d011e8195d3b7f87f9fa92b20c94cba2d7f65b0e3f'
            'd75a94f4d73e7a4086f7513e67e439e8fcdcbb726ffe63f4661744e6256b2cf2'
            'e2655207dd8a90e8fdc9c7cc7c701738bc8ba932692a0752ace8cd06b45ccf94'
            '13a1c761d41324c7a790df55650a3a98a9ade0348d6e88f1e269b6b77ce5df55'
            '57808d224fd9218a936e6669bf4129eaf4aa04fbd45ab9f7fd5a20efc304e307'
            '2c276c10568b69e1221eb83a848e6b7b828511583960b053eb83845161460d20')

_basedir=llvm-project-llvmorg-$pkgver

# FLIST_* below should follow the order of _pick_

FLIST_llvm_tools_1=(
  "usr/bin/llvm-*"
)

FLIST_clang_tools_1=(
  "usr/share/clang/clang-format*"
)

FLIST_clang=(
  "usr/bin/cc"
  "usr/bin/c++"
  "usr/bin/clang"{,-$_majorver}
  "usr/bin/clang++"{,-$_majorver}
  "usr/bin/clang-cpp"
  "usr/lib/cmake/clang"
  "usr/share/clang"
  "usr/include/clang"
  "usr/include/clang-c"
  "usr/lib/clang"
  "usr/lib/libclang*."{so,a}
  "usr/lib/libclang.so.*"
  "usr/lib/libclang-cpp.so.*"
)

FLIST_clang_tools_2=(
  "usr/bin/clangd"

  "usr/bin/clang-tidy"
  "usr/bin/run-clang-tidy"
  "usr/share/clang/clang-tidy-diff.py"
  "usr/include/clang-tidy"

  "usr/bin/clang-format"
  "usr/bin/git-clang-format"

  "usr/bin/clang-*"
  "usr/bin/"{modularize,c-index-test,find-all-symbols,diagtool,hmaptool,pp-trace,amdgpu-arch,nvptx-arch}
  "usr/bin/"{scan,analyze,intercept}"-*"
  "usr/bin/*-analyzer"
  "usr/share/scan-"{view,build}
  "usr/share/man/man1/scan-build.1"
  "usr/lib/"{libear,libscanbuild}
)

FLIST_flang=(
  "usr/bin/bbc"
  "usr/bin/f18-parse-demo"
  "usr/bin/fir-opt"
  "usr/bin/flang"{,-$_majorver}
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

FLIST_llvm_devel=(
  "usr/include/llvm-c"
  "usr/include/llvm"
  "usr/lib/cmake/llvm"
  "usr/lib/libLLVM*.a"
)

FLIST_llvm_tools_2=(
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
  "usr/include/mach-o"
  "usr/share/libc++"
)

prepare() {
  _patch_ "$_basedir"
  cd "$_basedir"
  sed -i "/dlfcn.h/s@\$@\n#include <sys/types.h>@" \
    compiler-rt/lib/fuzzer/FuzzerInterceptors.cpp
  mkdir -p cmake/Platform && echo "set(WASI 1)" > cmake/Platform/WASI.cmake

  # LLVM ships a Findzstd.cmake which may conflict with zstd-vendored one.
  # Reference: https://github.com/llvm/llvm-project/issues/139666
  rm llvm/cmake/modules/Findzstd.cmake
}

build() {
  # build RTTI but disable rtti in makepkg
  export CFLAGS="${CFLAGS//-fno-rtti/}"
  export CXXFLAGS="${CXXFLAGS//-fno-rtti/}"

  # https://os-wiki.ewe.moe/llvm
  # libxml2 is disabled to simplify dependency group of base-devel. It's used
  # for Microsoft Manifest support, which is unnecessary for eweOS.
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
    -DLLVM_USE_LINKER=mold
    -DLLVM_INSTALL_BINUTILS_SYMLINKS=ON
    -DLLVM_BUILD_LLVM_DYLIB=ON
    -DLLVM_LINK_LLVM_DYLIB=ON
    -DLLVM_INCLUDE_BENCHMARKS=OFF
    -DLLVM_TARGETS_TO_BUILD="X86;AArch64;RISCV;LoongArch;WebAssembly;AMDGPU;BPF;SPIRV"
    -DLLVM_ENABLE_LIBXML2=OFF
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
    -DLLVM_BINUTILS_INCDIR="$srcdir/binutils-${_binutilsver}/include"
    -DCLANG_CONFIG_FILE_SYSTEM_DIR=/etc/clang
  )

  case $CARCH in
    x86_64)
      CMARGS+=("-DCOMPILER_RT_BUILD_SANITIZERS=OFF")
      ;;
    aarch64 | riscv64 | loongarch64)
      CMARGS+=("-DCOMPILER_RT_BUILD_SANITIZERS=OFF")
      ;;
  esac

  cmake -B build -G Ninja \
    "${CMARGS[@]}" \
    -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra;flang;mlir;lld;lldb;openmp" \
    -DLLVM_ENABLE_RUNTIMES="compiler-rt;libunwind;libcxxabi;libcxx" \
    -S $_basedir/llvm

  # Ensure compiler-rt has been available before building other rt libraries
  ninja -C build clang LLVMgold
  ninja -C build compiler-rt
  ninja -C build runtimes

  ninja -C build

  export DESTDIR="$srcdir/PKGDIR"

  ninja -C build install
  ninja -C build install-runtimes

  cd "$srcdir"/PKGDIR
  _pick_ llvm-tools "${FLIST_llvm_tools_1[@]}"
  _pick_ clang-tools "${FLIST_clang_tools_1[@]}"
  _pick_ clang "${FLIST_clang[@]}"
  _pick_ clang-tools "${FLIST_clang_tools_2[@]}"
  _pick_ flang "${FLIST_flang[@]}"
  _pick_ mlir "${FLIST_mlir[@]}"
  _pick_ lldb "${FLIST_lldb[@]}"
  _pick_ openmp "${FLIST_openmp[@]}"
  _pick_ lld "${FLIST_lld[@]}"
  _pick_ llvm-lto "${FLIST_llvm_lto[@]}"
  _pick_ llvm-devel "${FLIST_llvm_devel[@]}"
  _pick_ llvm-tools "${FLIST_llvm_tools_2[@]}" # remaining usr/bin/*
  _pick_ llvm-libs "${FLIST_llvm_libs[@]}"
}

package_llvm-devel() {
  pkgdesc="Development files for LLVM"
  depends=(llvm llvm-libs llvm-tools mlir openmp clang-tools)

  mv "$srcdir/pkgs/llvm-devel/usr" "$pkgdir/usr"

  _install_license_ "$_basedir/llvm/LICENSE.TXT" LICENSE
  _install_license_ "$_basedir/llvm/CREDITS.TXT" CREDITS
}

package_clang() {
  pkgdesc="C language family frontend for LLVM"
  depends=(musl llvm-libs llvm zstd)

  mv "$srcdir/pkgs/clang/usr" "$pkgdir/usr"
  ln -s clang "$pkgdir/usr/bin/cc"
  ln -s clang++ "$pkgdir/usr/bin/c++"
  ln -s clang "$pkgdir/usr/bin/c89"
  ln -s clang "$pkgdir/usr/bin/c99"

  _install_license_ "$_basedir/clang/LICENSE.TXT"
}

package_clang-tools() {
  pkgdesc="clang-based tools"
  depends=(musl llvm-libs llvm clang)
  provides=(clangd clang-tidy clang-format)

  mv "$srcdir/pkgs/clang-tools/usr" "$pkgdir/usr"
  _install_license_ "$_basedir/clang/LICENSE.TXT"
}

package_flang() {
  pkgdesc="ground-up implementation of a Fortran front end written in modern C++"
  depends=(musl llvm-libs clang mlir)
  mv "$srcdir/pkgs/flang/usr" "$pkgdir/usr"

  _install_license_ "$_basedir/flang/LICENSE.TXT"
}

package_mlir() {
  pkgdesc="Multi-Level IR Compiler Framework for LLVM"
  depends=(musl llvm-libs zlib zstd)
  mv "$srcdir/pkgs/mlir/usr" "$pkgdir/usr"

  _install_license_ "$_basedir/mlir/LICENSE.TXT"
}

package_lldb() {
  pkgdesc="Next generation, high-performance debugger from LLVM project"
  depends=(musl llvm-libs clang)

  mv "$srcdir/pkgs/lldb/usr" "$pkgdir/usr"

  _install_license_ "$_basedir/lldb/LICENSE.TXT"
}

package_openmp() {
  pkgdesc="LLVM OpenMP Runtime Library"
  depends=(musl llvm-libs libelf libffi)

  mv "$srcdir/pkgs/openmp/usr" "${pkgdir}/usr"

  _install_license_ "$_basedir/openmp/CREDITS.txt" CREDITS
  _install_license_ "$_basedir/openmp/LICENSE.TXT" LICENSE
}

package_lld() {
  pkgdesc="A drop-in replacement for the GNU linkers by LLVM project"
  provides=(ld)
  depends=(zlib llvm-libs libedit ncurses xz)

  mv "$srcdir/pkgs/lld/usr" "$pkgdir/usr"

  _install_license_ "$_basedir/lld/LICENSE.TXT"
}

package_llvm-lto() {
  pkgdesc="LTO library for LLVM"

  mv "$srcdir/pkgs/llvm-lto/usr" "$pkgdir/usr"

  _install_license_ "$_basedir/llvm/LICENSE.TXT" LICENSE
  _install_license_ "$_basedir/llvm/CREDITS.TXT" CREDITS
}

package_llvm-libs() {
  pkgdesc="LLVM runtime libraries"

  mv "$srcdir/pkgs/llvm-libs/usr" "$pkgdir/usr"

  # libgcc_s replacement
  ln -s libunwind.so.1.0 "$pkgdir/usr/lib/libgcc_s.so.1.0"
  ln -s libgcc_s.so.1.0 "$pkgdir/usr/lib/libgcc_s.so.1"
  ln -s libgcc_s.so.1.0 "$pkgdir/usr/lib/libgcc_s.so"

  for comp_name in llvm libcxx libcxxabi compiler-rt; do
    _install_license_ "$_basedir/$comp_name/CREDITS.TXT" "CREDITS-$comp_name"
    _install_license_ "$_basedir/$comp_name/LICENSE.TXT" "LICENSE-$comp_name"
  done
  _install_license_ "$_basedir/libunwind/LICENSE.TXT" LICENSE-libunwind
}

package_llvm-tools() {
  pkgdesc="LLVM binary and object tools"
  depends=(musl llvm llvm-libs zlib zstd)
  provides=(binutils)
  conflicts=(binutils)
  replaces=(binutils)

  mv "$srcdir/pkgs/llvm-tools/usr" "$pkgdir/usr"

  _install_license_ "$_basedir/llvm/CREDITS.TXT" CREDITS
  _install_license_ "$_basedir/llvm/LICENSE.TXT" LICENSE
}

package_llvm() {
  pkgdesc="Compiler infrastructure"
  depends=(musl llvm-libs zlib zstd libffi libedit ncurses)

  mv "$srcdir/PKGDIR/usr" "$pkgdir/usr"

  _install_license_ "$_basedir/llvm/CREDITS.TXT" CREDITS
  _install_license_ "$_basedir/llvm/LICENSE.TXT" LICENSE
}
