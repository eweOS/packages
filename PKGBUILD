# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=brotli
pkgname=('brotli' 'python-brotli' 'brotli-testdata')
_gitcommit=e61745a6b7add50d380cfd7d3883dd6c62fc2c71
pkgver=1.1.0
pkgrel=2
pkgdesc='Generic-purpose lossless compression algorithm'
url='https://github.com/google/brotli'
arch=(x86_64 aarch64 riscv64)
license=('MIT')
makedepends=(
  musl llvm-libs cmake
  python-setuptools
  python-build
  python-installer
  python-wheel
)
source=("https://github.com/google/brotli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e720a6ca29428b803f4ad165371771f5398faba397edf6778837a18599ea13ff')

build()
{
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

package_brotli()
{
  provides=(libbrotlicommon.so libbrotlidec.so libbrotlienc.so)
  cd ${pkgbase}-${pkgver}
  make -C build DESTDIR="$pkgdir" install
  local man
  for man in docs/*.?; do
    install -Dm 644 "$man" "$pkgdir/usr/share/man/man${man##*.}/${man##*/}"
  done
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_python-brotli() {
  pkgdesc+=' - python library'
  depends=('python')

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

