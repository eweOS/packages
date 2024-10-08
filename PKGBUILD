# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=poppler-data
pkgver=0.4.12
pkgrel=1
_POPPLER_DATA_EXTRA_VERSION="0.4.11-2"
pkgdesc="Encoding data for the poppler PDF rendering library"
arch=('any')
license=('GPL-2.0-only OR GPL-3.0-only' 'BSD-3-Clause')
url="https://poppler.freedesktop.org/"
source=(https://poppler.freedesktop.org/${pkgname}-${pkgver}.tar.gz
        https://dev.gentoo.org/~sam/distfiles/app-text/${pkgname}/${pkgname}-$_POPPLER_DATA_EXTRA_VERSION-extra.tar.xz)
sha256sums=('c835b640a40ce357e1b83666aabd95edffa24ddddd49b8daff63adb851cdab74'
            '2f62dc1d20e1646e9c92e6fc35ba26f7d12b7cacee3577e5fd4a85511bfc6603')

package() {
  cd ${pkgname}-${pkgver}

  make prefix=/usr DESTDIR="${pkgdir}" install

  # additional cMaps for ghostscript - FS#76416
  cp ../${pkgname}-${_POPPLER_DATA_EXTRA_VERSION}-extra/Identity-* "${pkgdir}"/usr/share/poppler/cMap

  # add symlinks to cMaps - FS#76565
  pushd "${pkgdir}"/usr/share/poppler/cMap
    find ../cMap -type f -exec ln -s {} . \;
  popd

  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING COPYING.adobe \
    "${pkgdir}/usr/share/licenses/${pkgname}/"
}
