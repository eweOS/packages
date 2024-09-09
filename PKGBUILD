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
checkdepends=(python-pytest)
provides=(python-pyyaml)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('c72665131296762521d9ae4fc1c8619946f46ea16ad98b6b8e995828f2cdbd1ed61741fc2d646753f71d95a352b36562a1302f0cb646d5705652cd24b2f10b16')
 
build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation --config-setting=--with-libyaml
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH" pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -Dm 644 CHANGES README.md -t "$pkgdir"/usr/share/doc/$pkgname/
}
