# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=font-urw-base35
_name=urw-base35-fonts
pkgname=otf-urw-base35
provides=(gsfonts)
pkgver=20200910
pkgrel=1
pkgdesc="(URW)++ base 35 font set"
url="https://github.com/ArtifexSoftware/urw-base35-fonts"
arch=(any)
license=(AGPL3)
source=($url/archive/$pkgver/$_name-$pkgver.tar.gz)
sha512sums=('71fb27baadf5abc4ff624cdede02038681acd5fffdc728a5b2e7808713b80cb2f2174f90a1862e69d390c4434c49d5167ab095100032fa3ba80b586eb8ae51d1')

package() {
  local _config _config_path
  cd $_name-$pkgver

  install -vDm 644 fonts/*.otf -t "$pkgdir/usr/share/fonts/gsfonts/"
  install -vDm 644 appstream/*.xml -t "$pkgdir/usr/share/metainfo"

  install -vdm 755 "$pkgdir/usr/share/fontconfig/conf.default/"
  for _config in fontconfig/*.conf; do
    _config_path="$pkgdir/usr/share/fontconfig/conf.avail/69-${_config##*/}"
    install -vDm 644 "$_config" "$_config_path"
    ln -sv "../conf.avail/69-${_config##*/}" "$pkgdir/usr/share/fontconfig/conf.default/69-${_config##*/}"
  done
}
