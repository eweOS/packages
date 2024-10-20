# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-tqdm
pkgver=4.66.5
pkgrel=2
pkgdesc='Fast, Extensible Progress Meter'
arch=('any')
license=('MIT' 'MPL-2.0')
url='https://github.com/tqdm/tqdm'
depends=('python')
optdepends=('python-requests: telegram')
makedepends=('git' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel' 'python-toml')
source=("git+https://github.com/tqdm/tqdm.git#tag=v${pkgver}")
sha512sums=('62e5e5ee12de4ed6f04fca1947ea839da3539fb8f763d1dcd0853d37915881fbe12f7e65f157dc240e48d3827d1bf1f2adb84f48ad093d5f14038c6bf393359e')

build() {
  cd tqdm
  python -m build --wheel --no-isolation
}

package() {
  cd tqdm
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
  install -Dm 644 tqdm/completion.sh "${pkgdir}/usr/share/bash-completion/completions/tqdm"
}
