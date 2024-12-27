# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-cryptography
pkgver=44.0.0
pkgrel=1
pkgdesc="A package designed to expose cryptographic recipes and primitives to Python developers"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
license=('Apache')
url="https://github.com/pyca/cryptography"
depends=('python-cffi')
makedepends=('git' 'python-setuptools-rust' 'python-build' 'python-installer' 'python-wheel' 'python-maturin')
checkdepends=('python-pytest' 'python-pytest-subtests' 'python-iso8601' 'python-pretend'
              'python-hypothesis' 'python-pytz' 'python-certifi')
source=("git+https://github.com/pyca/cryptography.git#tag=$pkgver")
sha256sums=('c5e6a534f1975f2537a95cc3db26c47df9ba0faeb353f12e2d57a82ceefce740')

prepare() {
  cd cryptography
  # Drop all benchmark tests, this means we don't have to checkdepends on pytest-benchmark nor are
  # benchmark tests interesting for a distribution.
  rm -rf tests/bench
}

build() {
  cd cryptography
  if check_option lto y; then
    # https://github.com/pyca/cryptography/issues/9023
    RUSTFLAGS+=" -Clinker-plugin-lto -Clink-arg=-flto=auto"
  fi
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd cryptography
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python -m installer --destdir="tmp_install" dist/*.whl
  PYTHONPATH="$PWD/tmp_install/$site_packages:$PWD/vectors" \
    pytest --override-ini="addopts="
}

package() {
  cd cryptography
  python -m installer --destdir="$pkgdir" dist/*.whl
}
