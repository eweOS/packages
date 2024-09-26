# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-pytest-enabler
pkgver=3.3.0
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
sha512sums=('d7b81f4bb4f68e5989d2129ae3f21affd7a6e74f6827365550ee911aef6cb20c3c46512092e887e77309eb26a38217b6792ec8c2b7ee82b71b89ad9f8ac340de'
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
