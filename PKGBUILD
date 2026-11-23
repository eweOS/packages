# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Federico Quagliata (quaqo) <quaqo@despammed.com>

pkgname=cracklib
pkgver=2.10.4
pkgrel=1
pkgdesc="Password Checking Library"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('LGPL-2.1-or-later')
url="https://github.com/cracklib/cracklib"
depends=('musl' 'zlib')
# 0001: Downstream, use cat for uncompressed input; gzip -cdf rejects plain files
# TODO: Upstream the fix, introduced by https://github.com/cracklib/cracklib/commit/eff2a392d962
source=(
  "https://github.com/cracklib/cracklib/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
  "0001-cracklib-format-use-cat-for-uncompressed-input.patch"
)
sha256sums=('69db67211c5aca41bf854974d7e97fcae096d06eeac30de7ddb119570c0277af'
            '23fb5119739c1fa1d5a4a47a8bf89c8112b363942b602d0ccd53d9d71ce45dd9')

prepare()
{
  _patch_ "$pkgname-$pkgver"
}

build()
{
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --without-python
  make
}

check()
{
  cd $pkgname-$pkgver
  make check
}

package()
{
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
  _install_license_ COPYING.LIB

  # symlink cracklib-small #34778
  mkdir -p "$pkgdir"/usr/share/dict
  ln -sf /usr/share/cracklib/cracklib-small "$pkgdir"/usr/share/dict/cracklib-small

  sh ./util/cracklib-format dicts/cracklib-small \
    | sh ./util/cracklib-packer "$pkgdir"/usr/share/cracklib/pw_dict
}
