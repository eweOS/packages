# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=brotli
pkgname=('brotli' 'python-brotli' 'brotli-testdata')
_gitcommit=e61745a6b7add50d380cfd7d3883dd6c62fc2c71
pkgver=1.2.1
pkgrel=1
pkgdesc='Generic-purpose lossless compression algorithm'
url='https://github.com/google/brotli'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('MIT')
makedepends=(
  musl llvm-libs cmake
  python-setuptools
  python-build
  python-installer
  python-wheel
)
# 0001: Backport, e230f474b871 ("disable BROTLI_MODEL macro for some targets")
#	Fix "code model 'small' is not supported on this target" errors.
#	See also https://github.com/google/brotli/pull/1368
source=("https://github.com/google/brotli/archive/refs/tags/v${pkgver}.tar.gz"
	"0001-disable-BROTLI_MODEL-macro-for-some-targets.patch")
sha256sums=('98d35d11a78dc453aebb7d10c3748f3f73ff78c8267c0dc697b8631f67bf7e8f'
            '404465f111c9cfbb45afefa1648630763d7fa203e98c0ac2fa26bc4bf6d6c4a9')

prepare() {
  _patch_ $pkgbase-$pkgver
}

build() {
  cd ${pkgbase}-${pkgver}
  python -m build --wheel --no-isolation
  cmake -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DBUILD_SHARED_LIBS=True
  make -C build VERBOSE=1
}

check() {
  cd ${pkgbase}-${pkgver}
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/bin/lib.linux-$CARCH-cpython-${python_version}" python -m unittest discover python "*_test.py"
  cd build
  ctest --output-on-failure --stop-on-failure -j$(nproc)
}

package_brotli() {
  depends=(musl)
  provides=(libbrotlicommon.so libbrotlidec.so libbrotlienc.so)
  cd ${pkgbase}-${pkgver}
  make -C build DESTDIR="$pkgdir" install
  local man
  for man in docs/*.?; do
    install -Dm 644 "$man" "$pkgdir/usr/share/man/man${man##*.}/${man##*/}"
  done
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# TODO: Split python-brotli into separate PKGBUILD, and build it statically.
package_python-brotli() {
  pkgdesc+=' - python library'
  depends=('musl' 'python')

  cd ${pkgbase}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_brotli-testdata() {
  pkgdesc+=' - test data'
  depends=()

  cd ${pkgbase}-${pkgver}
  install -dm755 "$pkgdir"/usr/share/brotli
  cp -a tests/testdata "$pkgdir"/usr/share/brotli/
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

