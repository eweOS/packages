# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-pytest-xdist
pkgver=3.8.0
pkgrel=3
pkgdesc='py.test xdist plugin for distributed testing and loop-on-failing modes'
arch=('any')
license=('MIT')
url='https://github.com/pytest-dev/pytest-xdist'
depends=('python-execnet' 'python-pytest')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-filelock' 'python-psutil')
source=(
    "git+https://github.com/pytest-dev/pytest-xdist.git#tag=v$pkgver"
    "fix-pytest9.patch::https://github.com/pytest-dev/pytest-xdist/commit/44f4bea2652e06e7cd5d4a063aa2673b5ef701ee.patch"
    "fix-test-handlecrashitem.patch::https://github.com/pytest-dev/pytest-xdist/commit/0c984478f39d7a01aa24c061f2581bdfd071cb6a.patch"
)
sha512sums=('e1b0041f0b45f75a9665f89f745a2f5947553e5e676ade61480b7ea5fa952e52945f825061665aa73713eca23a9ff720844c1f944b9517d4a0058334a513787e'
            '09c5dd8468e10f291aca890879ba1b7c1711ffca4e58831b4b3fb69ba74172b348d9132d35e308525570110b8d55f741cf7403609626242c6db38f213e59f98a'
            'e8ec10b8a6045534dabc8dcf7a31fbe324769138e11e2408577972f1e242e669a37c2221993592f5e97991286ab8c0f19bf9071188cf9258b60ab4ca5e251c46')

prepare() {
  _patch_ pytest-xdist
}

build() {
  cd pytest-xdist
  python -m build -nw
}

check() {
  # Hack entry points by installing it

  cd pytest-xdist
  python -m installer -d "$PWD/tmp_install" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$PWD/tmp_install$site_packages:$PYTHONPATH" pytest
}

package() {
  cd pytest-xdist
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
