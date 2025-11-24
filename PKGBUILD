# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-pytest-xdist
pkgver=3.8.0
pkgrel=1
pkgdesc='py.test xdist plugin for distributed testing and loop-on-failing modes'
arch=('any')
license=('MIT')
url='https://github.com/pytest-dev/pytest-xdist'
depends=('python-execnet' 'python-pytest')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-filelock' 'python-psutil')
source=("git+https://github.com/pytest-dev/pytest-xdist.git#tag=v$pkgver")
sha512sums=('e1b0041f0b45f75a9665f89f745a2f5947553e5e676ade61480b7ea5fa952e52945f825061665aa73713eca23a9ff720844c1f944b9517d4a0058334a513787e')

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
