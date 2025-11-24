# Maintainer: Yukari Chiba <i@0x7f.cc>

_name=pyyaml
pkgname=python-yaml
pkgver=6.0.3
pkgrel=1
pkgdesc='Python bindings for YAML, using fast libYAML library'
arch=(x86_64 aarch64 riscv64 loongarch64)
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
sha512sums=('a0da43e32d127409ad61b11dc1d733b2e9c743977b3d72c05c81fc2ab183b40bc284452b0874dbeae1a736e1cd4a34f0df641ceefd5e9df38b3e53155fc5f633')
 
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
