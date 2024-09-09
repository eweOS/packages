# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-setuptools-rust
pkgver=1.10.1
pkgrel=1
pkgdesc="Compile and distribute Python extensions written in rust as easily as if they were written in C."
arch=('any')
license=('MIT')
url="https://github.com/PyO3/setuptools-rust"
depends=('rust' 'python-setuptools' 'python-semantic-version')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
checkdepends=('python-pytest' 'python-pytest-benchmark' 'python-beautifulsoup4' 'python-lxml' 'python-cffi')
source=("git+https://github.com/PyO3/setuptools-rust.git#tag=v$pkgver")
sha512sums=('2d31c1720117714d5b5fcc4b06410d0738d640459902a882c1655c93296bfa249087a333acdd3f5bd7a7a8147a4d3197124c6dc47fced39ef2927cd51ca37cfa')

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

