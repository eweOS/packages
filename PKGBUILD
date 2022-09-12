# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=(llvm llvm-lto lldb openmp lld clang)
_realpkgname=llvm-project
pkgver=15.0.0
_binutilsver=2.39
pkgrel=1
arch=('x86_64')
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
)
options=()

source=(
    "https://github.com/llvm/llvm-project/releases/download/llvmorg-${pkgver}/llvm-project-${pkgver}.src.tar.xz"
    "https://ftp.gnu.org/gnu/binutils/binutils-${_binutilsver}.tar.xz"
)

sha256sums=(
    'SKIP'
    'SKIP'
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

_fetchpkg() {
    PKGBASE="$srcdir/pkgs/$1" && shift
    mkdir -p $PKGBASE
    for FILEPATH in $@; do
        (cd "${srcdir}/PKGDIR" && find $FILEPATH | cpio -pdvmu $PKGBASE) || true
        (cd "${srcdir}/PKGDIR" && find $FILEPATH -delete) || true
    done
}

build() {
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
        -DLLVM_DEFAULT_TARGET_TRIPLE="$CHOST"
        -DLLVM_HOST_TRIPLE="$CHOST"
        -DCLANG_DEFAULT_CXX_STDLIB='libc++'
        -DCLANG_DEFAULT_RTLIB='compiler-rt'
        -DLLVM_INSTALL_UTILS=ON
        -DLLVM_ENABLE_LIBCXX=ON
        -DLLVM_ENABLE_FFI=ON
        -DLLVM_INSTALL_BINUTILS_SYMLINKS=ON
        -DLLVM_BUILD_LLVM_DYLIB=ON
        -DLLVM_LINK_LLVM_DYLIB=ON
        -DLLVM_INCLUDE_BENCHMARKS=OFF
        -DLLVM_TARGETS_TO_BUILD=Native
        -DLIBCXX_HAS_MUSL_LIBC=ON
        -DLIBCXX_USE_COMPILER_RT=ON
        -DLIBCXX_INCLUDE_TESTS=OFF
        -DLIBCXX_INCLUDE_BENCHMARKS=OFF
        -DLIBCXXABI_USE_LLVM_UNWINDER=ON
        -DLIBCXX_USE_COMPILER_RT=ON
        -DLIBCXXABI_USE_COMPILER_RT=ON
        -DLIBUNWIND_USE_COMPILER_RT=ON
        -DCOMPILER_RT_BUILD_SANITIZERS=OFF
        -DCOMPILER_RT_BUILD_XRAY=OFF
        -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=OFF
        -DLLVM_LIBGCC_EXPLICIT_OPT_IN=ON
        -DLLVM_BINUTILS_INCDIR=$srcdir/binutils-${_binutilsver}/include
    )

    cmake "${CMARGS[@]}" \
        -DLLVM_ENABLE_PROJECTS="clang;compiler-rt;lld;lldb;openmp" \
        ../llvm
    cmake --build .
    export DESTDIR="${srcdir}/PKGDIR"
    cmake --build . --target install

    _fetchpkg clang "${FLIST_clang[@]}"
    _fetchpkg lldb "${FLIST_lldb[@]}"
    _fetchpkg openmp "${FLIST_openmp[@]}"
    _fetchpkg lld "${FLIST_lld[@]}"
    _fetchpkg llvm-lto "${FLIST_llvm_lto[@]}"
}

package_clang() {
    pkgdesc="C language family frontend for LLVM."
    depends=("llvm")

    mv "$srcdir/pkgs/clang/usr" "${pkgdir}/usr"
    ln -s clang "${pkgdir}/usr/bin/cc"
    ln -s clang++ "${pkgdir}/usr/bin/c++"
    rm ${pkgdir}/usr/lib/*.a || true
}

package_lldb() {
    pkgdesc="Next generation, high-performance debugger from LLVM project."
    depends=('llvm-libs' 'clang')

    mv "$srcdir/pkgs/lldb/usr" "${pkgdir}/usr"
    find ${pkgdir}/usr/lib -name *.a -delete || true
}

package_openmp() {
    pkgdesc="LLVM OpenMP Runtime Library."
    depends=('llvm-libs' 'libelf' 'libffi')

    mv "$srcdir/pkgs/openmp/usr" "${pkgdir}/usr"
    find ${pkgdir}/usr/lib -name *.a -delete || true
}

package_lld() {
    pkgdesc="a drop-in replacement for the GNU linkers by LLVM project."
    provides=("ld")
    depends=('zlib' 'llvm-libs' 'libedit' 'ncurses' 'libxml2' 'xz')

    mv "$srcdir/pkgs/lld/usr" "${pkgdir}/usr"
    find ${pkgdir}/usr/lib -name *.a -delete || true
}

package_llvm-lto() {
    pkgdesc="lto library for LLVM."

    mv "$srcdir/pkgs/llvm-lto/usr" "${pkgdir}/usr"
    find ${pkgdir}/usr/lib -name *.a -delete || true
}

package_llvm() {
    pkgdesc="LLVM Compiler infrastructure and runtime library."
    depends=('llvm-libs' 'zlib' 'libffi' 'libedit' 'ncurses' 'libxml2')

    mv "${srcdir}/PKGDIR/usr" "${pkgdir}/usr"
}
