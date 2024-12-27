# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-atomicwrites
pkgver=1.4.1
pkgrel=1
pkgdesc="Atomic file writes on POSIX"
arch=('any')
url="https://github.com/untitaker/python-atomicwrites"
license=('MIT')
depends=('python')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
source=("git+$url.git#tag=$pkgver")
sha256sums=('a18aa873a36697426f9179bb5bc4757924a280b1c984a554ad220e25e5915b61')

build() {
  cd "${pkgname}"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "${pkgname}"
  export PYTHONPATH="build:${PYTHONPATH}"
  pytest -v
}

package() {
  cd "${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -vDm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${site_packages}/${pkgname#python-}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
