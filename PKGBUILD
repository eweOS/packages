# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ
# Contributor: Christian Hesse <mail@eworm.de>

pkgbase=libxcrypt
pkgname=(libxcrypt libxcrypt-compat)
pkgver=4.4.37
pkgrel=1
pkgdesc='Modern library for one-way hashing of passwords'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/besser82/libxcrypt/'
license=('GPL')
depends=('musl' 'libucontext')
makedepends=('linux-headers')
provides=('libcrypt.so')
source=("${url}/releases/download/v${pkgver}/${pkgbase}-${pkgver}.tar.xz")
sha512sums=('e144259e5a91bd203853e9c2a0d6aa9229df220f5f039f950cdf5403e952523ee848fcc3a78b73ead291e87537f2f8667a15e2f44038e8f30a486f615e650246')

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
