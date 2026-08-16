# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-cffi
pkgver=2.1.1
pkgrel=1
pkgdesc="Foreign Function Interface for Python calling C code"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://cffi.readthedocs.org/"
license=('MIT')
depends=('python-pycparser')
optdepends=('python-setuptools: "limited api" version checking in cffi.setuptools_ext')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("https://github.com/python-cffi/cffi/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('86af9771c4f8f0bfb129e63cb263dbaf2f32bb755e056fa04bc4cdd32eee4392634a866dd930263e6eeb011f81ee2bd90f9e6602adf016c80e124bdbfbb62c38')

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
