# Maintainer: Aleksana QwQ
# Contributor: Christian Hesse <mail@eworm.de>

pkgbase=libxcrypt
pkgname=(libxcrypt libxcrypt-compat)
pkgver=4.4.28
pkgrel=2
pkgdesc='Modern library for one-way hashing of passwords'
arch=('x86_64')
url='https://github.com/besser82/libxcrypt/'
license=('GPL')
depends=('musl' 'libucontext')
provides=('libcrypt.so')
source=("${url}/releases/download/v${pkgver}/${pkgbase}-${pkgver}.tar.xz")
sha512sums=("SKIP")

build() {
  mkdir build-libxcrypt build-libxcrypt-compat

  cd "${srcdir}/build-libxcrypt/"
  "${srcdir}/${pkgbase}-${pkgver}"/configure \
    --prefix=/usr \
    --disable-static \
    --enable-hashes=strong,glibc \
    --enable-obsolete-api=no \
    --disable-failure-tokens \
    LIBS='-lucontext'
  make
  
  cd "${srcdir}/build-libxcrypt-compat/"
  "${srcdir}/${pkgbase}-${pkgver}"/configure \
    --prefix=/usr \
    --disable-static \
    --enable-hashes=strong \
    --enable-obsolete-api=glibc \
    --disable-failure-tokens
  make
}

check() {
  cd build-libxcrypt/

  make check 
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

