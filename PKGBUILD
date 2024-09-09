# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-pytest-enabler
pkgver=3.2.0
pkgrel=1
pkgdesc='Enable installed pytest plugins'
arch=('any')
license=('MIT')
url='https://github.com/jaraco/pytest-enabler'
depends=('python-jaraco.context' 'python-jaraco.functools' 'python-pytest' 'python-toml')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
#checkdepends=('python-pytest-mypy' 'python-pytest-ruff' 'python-pytest-cov')
source=("git+https://github.com/jaraco/pytest-enabler.git#tag=v$pkgver"
        "https://files.pythonhosted.org/packages/source/t/types-toml/types-toml-0.10.1.tar.gz")
sha512sums=('88846aa0808e3fa345ded42c63a9ab78946b0f1b61a6ee770fb77716df061b9906d222cd4f0210484ec66f0f398c220d95d21c40c859a4197296a00a106a5f5c'
            '001757f956dd3af0688a6544b90ba415b26ab3128e0fbb238f4dfaf0bab6b5795d5598bcc9422d854ea235acbc9e78b245c17f9ebc9ad9251ae3c0722b382812')

prepare() {
  cd pytest-enabler
  # mypy needs all type stubs :/
  ln -s ../types-toml-0.10.1/toml-stubs .
}

build() {
  cd pytest-enabler
  python -m build --wheel --no-isolation
}

check() {
  cd pytest-enabler
  # FIXME: pytest
  #PYTHONPATH="$PWD" pytest
}

package() {
  cd pytest-enabler
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
