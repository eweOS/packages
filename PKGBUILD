# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=('boost' 'boost-libs')
pkgver=1.86.0
pkgrel=1
_srcname=boost_${pkgver//./_}
pkgdesc="Free peer-reviewed portable C++ source libraries"
arch=(x86_64 aarch64 riscv64)
url="https://www.boost.org/"
license=('custom')
makedepends=('icu' 'python' 'libbz2' 'zlib' 'zstd')
source=(https://boostorg.jfrog.io/artifactory/main/release/$pkgver/source/$_srcname.tar.bz2
        boost-1.81.0-phoenix-multiple-definitions.patch
)
sha256sums=('1bed88e40401b2cb7a1f76d4bab499e352fa4d0c5f31c0dbae64e24d34d7513b'
            '5c83b5b30a5c53282fc55f7adabcb6b65a0f6291d1f1ebfc556408a3eba0640b')

prepare() {
  cd $_srcname

  # https://github.com/boostorg/phoenix/issues/111
  patch -Np1 -i ../boost-1.81.0-phoenix-multiple-definitions.patch
}

build() {
  local JOBS="$(sed 's/.*\(-j *[0-9]\+\).*/\1/' <<<$MAKEFLAGS)"
  local python_version=$(
    python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  
  # error: res.o: unknown file type
  export B2_DONT_EMBED_MANIFEST=true

  pushd $_srcname/tools/build
  ./bootstrap.sh --cxxflags="$CXXFLAGS $LDFLAGS"
  ./b2 install toolset=clang --prefix="$srcdir"/fakeinstall
  ln -s b2 "$srcdir"/fakeinstall/bin/bjam
  popd

  cd $_srcname
  ./bootstrap.sh --with-icu --with-python=python3

  # boostbook is needed by quickbook
  install -dm755 "$srcdir"/fakeinstall/share/boostbook
  cp -a tools/boostbook/{xsl,dtd} "$srcdir"/fakeinstall/share/boostbook/

  # install to $srcdir/fakeinstall in preparation for split packaging
  ./b2 install \
    variant=release \
    debug-symbols=off \
    threading=multi \
    runtime-link=shared \
    link=shared,static \
    toolset=clang \
    python=$python_version \
    cflags="$CPPFLAGS $CFLAGS -fPIC -O3 -ffat-lto-objects" \
    cxxflags="$CPPFLAGS $CXXFLAGS -fPIC -O3 -ffat-lto-objects" \
    linkflags="$LDFLAGS" \
    --layout=system \
    $JOBS \
    \
    --prefix="$srcdir"/fakeinstall
}

package_boost() {
  local python_version=$(
    python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')

  pkgdesc+=' (development headers)'
  depends=("boost-libs=$pkgver")
  optdepends=('python: for python bindings')
  options=('staticlibs')

  install -d "$pkgdir"/usr/lib
  cp -a fakeinstall/lib/*.{a,so} "$pkgdir"/usr/lib/
  cp -a fakeinstall/lib/cmake "$pkgdir"/usr/lib/
  cp -a fakeinstall/{bin,include,share} "$pkgdir"/usr/

  pushd "$pkgdir/usr/lib/"
  # https://github.com/boostorg/python/issues/203#issuecomment-391477685
  ln -s libboost_python{${python_version/.},${python_version%.*}}.so
  popd

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" $_srcname/LICENSE_1_0.txt
}

package_boost-libs() {
  local python_version=$(
    python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')

  pkgdesc+=' (runtime libraries)'
  depends=('libbz2' 'zlib' 'icu' 'zstd')
  provides=(libboost_atomic.so libboost_chrono.so libboost_container.so
    libboost_context.so libboost_contract.so libboost_coroutine.so
    libboost_date_time.so libboost_fiber.so libboost_filesystem.so
    libboost_graph.so libboost_iostreams.so
    libboost_json.so libboost_locale.so libboost_log.so libboost_log_setup.so
    libboost_math_c99.so libboost_math_c99f.so libboost_math_c99l.so
    libboost_math_tr1.so libboost_math_tr1f.so libboost_math_tr1l.so
    libboost_nowide.so libboost_prg_exec_monitor.so
    libboost_program_options.so libboost_python${python_version/.}.so
    libboost_random.so libboost_regex.so libboost_serialization.so
    libboost_stacktrace_basic.so
    libboost_stacktrace_noop.so libboost_system.so libboost_thread.so
    libboost_timer.so libboost_type_erasure.so libboost_unit_test_framework.so
    libboost_url.so libboost_wave.so libboost_wserialization.so)

  install -dm755 "$pkgdir"/usr/lib
  cp -a fakeinstall/lib/*.so.* "$pkgdir"/usr/lib/

  # https://github.com/boostorg/mpi/issues/112
  local site_packages=$(python -c 'import site; print(site.getsitepackages()[0])')
  install -d "$pkgdir"$site_packages/boost
  touch "$pkgdir"$site_packages/boost/__init__.py
  python -m compileall -o 0 -o 1 -o 2 "$pkgdir"$site_packages/boost

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" $_srcname/LICENSE_1_0.txt
}
