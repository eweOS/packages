# Maintainer: Yukari Chiba <i@0x7f.cc>

_name=pyyaml
pkgname=python-yaml
pkgver=6.0.1
pkgrel=1
pkgdesc='Python bindings for YAML, using fast libYAML library'
arch=(x86_64 aarch64 riscv64)
url='https://github.com/yaml/pyyaml'
license=(MIT)
depends=(
  libyaml
  python
)
makedepends=(
  cython
  python-build
  python-installer
  python-setuptools
  python-wheel
)
provides=(python-pyyaml)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz
        a2d19c02.patch)
sha512sums=('1c74a92a4ad7d47854dc7bcb2e89b3c8e0b14fa815c7dbfbc22b24480dbba6c81e971c77ee384c494a960914b95f06edf943d7431925a5ed674a0ba830d258e0'
            '9b9bae688ab64ba4a51f962f84ff2980be643b9316448df58e57954cac6aa5fd5d6411db50ed9b5392fdc6bcae0b2889643dab3ea85769b31490aa10045983d2')
 
prepare() {
  cd $_name-$pkgver
  patch -p1 -i ../a2d19c02.patch # Fix build with cython 3
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation --config-setting=--with-libyaml
}

check() {
  local _py_ver="$(python3 -c "import sys; print(str(sys.version_info.major)+str(sys.version_info.minor))")"

  cd $_name-$pkgver
  export PYTHONPATH="tests/lib:build/lib.linux-$CARCH-cpython-$_py_ver:$PYTHONPATH"
  python -m tests.lib.test_all
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -Dm 644 CHANGES README.md -t "$pkgdir"/usr/share/doc/$pkgname/
}
