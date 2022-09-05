# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=(llvm llvm-libs)
_realpkgname=llvm-project
pkgver=14.0.6
pkgrel=1
pkgdesc='A collection of modular and reusable compiler and toolchain technologies.'
arch=('x86_64')
url='htps://llvm.org'
license=(Apache)
groups=()
depends=()
makedepends=(
    llvm
    cmake
    ninja
    utmps
    zlib
)
options=()

source=(
    "https://github.com/llvm/llvm-project/releases/download/llvmorg-${pkgver}/llvm-project-${pkgver}.src.tar.xz"
)

sha256sums=(
    'SKIP'
)


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
    cmake -G Ninja -Wno-dev \
        -DCMAKE_BUILD_TYPE=Release \
        -DCLANG_BUILD_EXAMPLES=OFF \
        -DLLVM_BUILD_EXAMPLES=OFF \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DLLVM_INSTALL_UTILS=ON \
        -DCLANG_DEFAULT_CXX_STDLIB='libc++' \
        -DCLANG_DEFAULT_RTLIB='compiler-rt' \
        -DLIBCXX_HAS_MUSL_LIBC=ON \
        -DLIBCXX_USE_COMPILER_RT=ON \
        -DLIBCXXABI_USE_COMPILER_RT=ON \
        -DLIBCXXABI_USE_LLVM_UNWINDER=ON \
        -DCOMPILER_RT_BUILD_SANITIZERS=OFF \
        -DCOMPILER_RT_BUILD_XRAY=OFF \
        -DLLVM_DEFAULT_TARGET_TRIPLE="$CHOST" \
        -DLLVM_HOST_TRIPLE="$CHOST" \
        -DLLVM_DISTRIBUTION_COMPONENTS='clang;clang-resource-headers;lld;LTO;compiler-rt;cxx;cxxabi;addr2line;ar;nm;objcopy;objdump;ranlib;readelf;size;strings;strip;unwind' \
        -DLLVM_ENABLE_PROJECTS='lld;clang;compiler-rt;libcxx;libcxxabi;libunwind' \
        -DLLVM_ENABLE_LIBCXX=ON \
        -DLLVM_ENABLE_RTTI=ON \
        -DLLVM_ENABLE_TERMINFO=OFF \
        -DLLVM_ENABLE_FFI=ON \
        -DLLVM_INSTALL_BINUTILS_SYMLINKS=ON \
        -DLLVM_INSTALL_TOOLCHAIN_ONLY=ON \
        -DLLVM_TARGETS_TO_BUILD=Native \
        ../llvm
    cmake --build .
}

package_llvm() {
    depends=(
        musl
        llvm-libs
    )
    groups=(base-devel)
    cd $_realpkgname-$pkgver.src
    cd build || return 1
    export DESTDIR="${pkgdir}/"
    cmake --build . --target install-distribution
    ln -s libunwind.a "${pkgdir}/usr/lib/libgcc_s.a"
    ln -s lld "${pkgdir}/usr/bin/ld"
    ln -s clang "${pkgdir}/usr/bin/cc"
    ln -s clang++ "${pkgdir}/usr/bin/c++"
    ln -s llvm-objcopy "${pkgdir}/usr/bin/llvm-strip"
    mv -f "$pkgdir"/usr/lib/libc++.so.* "$srcdir"
    mv -f "$pkgdir"/usr/lib/libc++abi.so.* "$srcdir"
    mv -f "$pkgdir"/usr/lib/libunwind.so.* "$srcdir"
}

package_llvm-libs() {
    depends=(musl)
    install -d "$pkgdir/usr/lib"
    cp -P \
        "$srcdir"/libc++.so.* \
        "$srcdir"/libc++abi.so.* \
        "$srcdir"/libunwind.so.* \
        "$pkgdir/usr/lib/"
}

