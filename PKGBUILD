# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=publicsuffix-list
_gitcommit=9b5c814414374aa19a93dc6dd7e47c01909524cc
pkgver=20260715.${_gitcommit:0:8}
pkgrel=1
pkgdesc='Cross-vendor public domain suffix database'
url='https://github.com/publicsuffix/list'
arch=('any')
license=(MPL-2.0)
makedepends=('git')
source=(${pkgname}::"git+https://github.com/publicsuffix/list#commit=${_gitcommit}")
sha512sums=('1da42a7b18a0b04914bc1476f94146a537d9e76cce80fb6789126acf4d88198a33bf4ceff03b6142d1f45d509c9b8af2c730a0bb6702765de46a0779b0b0a846')

package() {
  cd ${pkgname}
  install -Dm 644 public_suffix_list.dat tests/test_psl.txt -t "${pkgdir}/usr/share/publicsuffix"
  ln -s public_suffix_list.dat "${pkgdir}/usr/share/publicsuffix/effective_tld_names.dat"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
