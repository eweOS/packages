# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-tqdm
pkgver=4.66.5
pkgrel=1
pkgdesc='Fast, Extensible Progress Meter'
arch=('any')
license=('MIT' 'MPL-2.0')
url='https://github.com/tqdm/tqdm'
depends=('python')
optdepends=('python-requests: telegram')
makedepends=('git' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel' 'python-toml')
source=("git+https://github.com/tqdm/tqdm.git#tag=v${pkgver}")
sha512sums=('10e2481f0a388dd17a6bbaee8891ac2e186e29fddc7fe4fae7e84b5a5ddaaffbb6b0d09ef3d7b835a92b3761788eed98ece5c88883f026b1e2830cd4b257ce57')

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
