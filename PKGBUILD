# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-cffi
pkgver=1.17.1
pkgrel=1
pkgdesc="Foreign Function Interface for Python calling C code"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://cffi.readthedocs.org/"
license=('MIT')
depends=('python-pycparser')
optdepends=('python-setuptools: "limited api" version checking in cffi.setuptools_ext')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=(
  "https://github.com/python-cffi/cffi/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
  clang-test-errors.patch
)
sha512sums=('bb22f2f21f4d9e097bdacaad24b883936304e794d0e319f24db794de37e47de690b3c352487d670e3b9e2322d5144cd3d3582fb847c4f6806be5eb549e63d9de'
            'e311758c2859070da21b4bdd6a0907e4653c10872d7790679d75390fd6ef3f8768541196187774df11ab9dc71f668af4ca69c0cb340209617967086175427e59')

prepare() {
  _patch_ cffi-$pkgver
}

build() {
  cd cffi-$pkgver
  python -m build -nw
}

check() {
  cd cffi-$pkgver
  python -m installer --destdir=tmpinstall dist/*.whl
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/tmpinstall/usr/lib/python${python_version}/site-packages" pytest
}

package() {
  cd cffi-$pkgver

  # remove files created during check() for reproducible SOURCES.txt
  rm -r testing/cffi{0,1}/__pycache__/

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
