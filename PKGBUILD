# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-setuptools-rust
pkgver=1.9.0
pkgrel=1
pkgdesc="Compile and distribute Python extensions written in rust as easily as if they were written in C."
arch=('any')
license=('MIT')
url="https://github.com/PyO3/setuptools-rust"
depends=('rust' 'python-setuptools' 'python-semantic-version')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
checkdepends=('python-pytest' 'python-pytest-benchmark' 'python-beautifulsoup4' 'python-lxml' 'python-cffi')
source=("git+https://github.com/PyO3/setuptools-rust.git#tag=v$pkgver")
sha512sums=('SKIP')

build() {
  cd setuptools-rust
  python -m build -nw
}

check() {
  cd setuptools-rust
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  for _dir in examples/*; do
    pushd $_dir
    PYTHONPATH="$PWD/../.." python -m build -nw
    python -m installer -d tmp_install dist/*.whl
    [[ -d tests || -d test ]] && PYTHONPATH="$PWD/tmp_install/usr/lib/python$python_version/site-packages" pytest tests
    popd
  done
  pytest --doctest-modules setuptools_rust
}

package() {
  cd setuptools-rust
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

