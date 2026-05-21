# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-tqdm
pkgver=4.67.3
pkgrel=2
pkgdesc='Fast, Extensible Progress Meter'
arch=('any')
license=('MIT' 'MPL-2.0')
url='https://github.com/tqdm/tqdm'
depends=('python')
optdepends=('python-requests: telegram')
makedepends=('git' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel' 'python-toml')
source=("git+https://github.com/tqdm/tqdm.git#tag=v${pkgver}")
sha512sums=('7d35ae467a8d0d54cfe9b78f3187fa425b664034a9ee7740e33cf39fd509764a497ab6480c5eb005b41b6cd74f28f4ac2523ed4ac476c2c7925c578adc65dce6')

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
