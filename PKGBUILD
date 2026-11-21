# Maintainer: Yukari Chiba <i@0x7f.cc>

_name=pyyaml
pkgname=python-yaml
pkgver=6.0.4
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
sha512sums=('201f0b4dc59293facd9563ae0d9ceed1d8c379c8b82eb5b2e6109376e5804d18dc0e4b98324b37b28c83959816f2e394f4bd17b73bea4f98f8ac26f056881b89')
 
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
