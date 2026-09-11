# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=publicsuffix-list
_gitcommit=3955e3ec29b94c3cca7bd4509c5f14a7c0959e26
pkgver=20260908.${_gitcommit:0:8}
pkgrel=1
pkgdesc='Cross-vendor public domain suffix database'
url='https://github.com/publicsuffix/list'
arch=('any')
license=(MPL-2.0)
makedepends=('git')
source=(${pkgname}::"git+https://github.com/publicsuffix/list#commit=${_gitcommit}")
sha512sums=('892e858272d001a9959b93388b855c6e7357c5f901922c18420f7de4a5eaeffa3b2cb86568f18812a63ee601e1716b6d03538a13dda49a5b66fa4f4673dc635c')

package() {
  cd ${pkgname}
  install -Dm 644 public_suffix_list.dat tests/test_psl.txt -t "${pkgdir}/usr/share/publicsuffix"
  ln -s public_suffix_list.dat "${pkgdir}/usr/share/publicsuffix/effective_tld_names.dat"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
