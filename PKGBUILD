# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ
# Contributor: Christian Hesse <mail@eworm.de>

pkgbase=libxcrypt
pkgname=(libxcrypt libxcrypt-compat)
pkgver=4.4.38
pkgrel=1
pkgdesc='Modern library for one-way hashing of passwords'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/besser82/libxcrypt/'
license=('GPL')
depends=('musl' 'libucontext')
makedepends=('linux-headers')
provides=('libcrypt.so')
source=("${url}/releases/download/v${pkgver}/${pkgbase}-${pkgver}.tar.xz")
sha512sums=('66c6f7e69d64ec6d9cca5c240bcd056c4f2802aab84325bef5c3aff189a0f81bc0944f473cbde8fdcb12cad8a9d35599afb045a5bc4be577e1c67066555bc116')

build()
{
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

check()
{
  cd $srcdir/build-libxcrypt && make check
  cd $srcdir/build-libxcrypt-compat && make check
}

package_libxcrypt()
{
  cd build-libxcrypt/
  make DESTDIR="${pkgdir}" install
}

package_libxcrypt-compat()
{
  pkgdesc='Modern library for one-way hashing of passwords - legacy API functions'
  depends=('libxcrypt')

  cd build-libxcrypt-compat/
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,lib/{lib*.so,pkgconfig},share}
}
