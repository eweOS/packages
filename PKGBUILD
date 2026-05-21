# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ
# Contributor: Christian Hesse <mail@eworm.de>

pkgbase=libxcrypt
pkgname=(libxcrypt libxcrypt-compat)
pkgver=4.5.2
pkgrel=2
pkgdesc='Modern library for one-way hashing of passwords'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/besser82/libxcrypt/'
license=('LGPL-2.1-or-later')
depends=('musl' 'libucontext')
makedepends=('linux-headers')
provides=('libcrypt.so')
source=("${url}/releases/download/v${pkgver}/${pkgbase}-${pkgver}.tar.xz")
sha512sums=('87b363e2bdc03ea993a9d154eb59a75ef77edd0490a9b58d443de4e1b4eec5196408a1eb9b739718fd92f565fe5157469c1ea3d336a4a54ac0947750b16c44c1')

build() {
  mkdir build-libxcrypt build-libxcrypt-compat

  cd "${srcdir}/build-libxcrypt/"
  "${srcdir}/${pkgbase}-${pkgver}"/configure \
    --prefix=/usr \
    --disable-static \
    --enable-hashes=strong,glibc \
    --enable-obsolete-api=no \
    --disable-failure-tokens \
    LIBS='-lucontext_posix'

  make

  cd "${srcdir}/build-libxcrypt-compat/"
  "${srcdir}/${pkgbase}-${pkgver}"/configure \
    --prefix=/usr \
    --disable-static \
    --enable-hashes=strong \
    --enable-obsolete-api=glibc \
    --disable-failure-tokens \
    LIBS='-lucontext_posix'

  make
}

check() {
  cd $srcdir/build-libxcrypt && make check
  cd $srcdir/build-libxcrypt-compat && make check
}

package_libxcrypt() {
  cd build-libxcrypt/
  make DESTDIR="${pkgdir}" install
}

package_libxcrypt-compat() {
  pkgdesc='Modern library for one-way hashing of passwords - legacy API functions'
  depends=('libxcrypt')

  cd build-libxcrypt-compat/
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,lib/{lib*.so,pkgconfig},share}
}
