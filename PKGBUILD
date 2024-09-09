# Maintainer: Yukari Chiba <i@0x7f.cc>

_name=pyyaml
pkgname=python-yaml
pkgver=6.0.2
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
sha512sums=('c72665131296762521d9ae4fc1c8619946f46ea16ad98b6b8e995828f2cdbd1ed61741fc2d646753f71d95a352b36562a1302f0cb646d5705652cd24b2f10b16'
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
