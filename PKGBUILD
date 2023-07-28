# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=signify
pkgver=31
pkgrel=1
pkgdesc='OpenBSD tool to signs and verify signatures on files'
url='https://github.com/aperezdc/signify'
arch=(x86_64 aarch64 riscv64)
license=('ISC')
depends=('musl' 'libbsd')
makedepends=('bsd-compat-headers')
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz"
  signify-b64.patch)
sha512sums=('f39597ea278a7eb10b786909752fde59e16405f0bc76c9906f8014e9e7f6801b4733479eec765fb960b6062359954caf54a3460ff67258a9cff93fa978951962'
            '12915dc635e66847324bcb48082b99d98368d8528b0f7bfc84e67ce27c3cf88af3374d31ff6438e4f566a9e5f6bbc1c7447b3b3f69fbc34fff18831f95a71d4b')

prepare()
{
  cd ${pkgname}-${pkgver}
  # check if still needed in next version
  patch signify.c $srcdir/signify-b64.patch
}

build()
{
  cd ${pkgname}-${pkgver}
  make -j1 EXTRA_CFLAGS="${CFLAGS}" EXTRA_LDFLAGS="${LDFLAGS}"
}

check()
{
  cd ${pkgname}-${pkgver}
  # need coreutils sha256sum
  #make check
}

package()
{
  cd ${pkgname}-${pkgver}
  make PREFIX=/usr \
    DESTDIR="${pkgdir}" \
    GIT_TAG='' install

  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
