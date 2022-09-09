# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mold
pkgver=1.4.1
pkgrel=1
pkgdesc='A Modern Linker'
arch=('x86_64')
url='https://github.com/rui314/mold'
license=('AGPL3')
depends=('musl' 'mimalloc' 'openssl' 'zlib' 'cmake')
makedepends=('python')
options=('debug')
_commit='19d9255d72520678fd5eccca1ee9933b0f2c7e1b'
source=("https://github.com/rui314/mold/archive/${_commit}.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}-${_commit}"
  # use /usr/lib instead of /usr/libexec
  sed -i "s/libexec/lib/" Makefile
}

build() {
  cd "${srcdir}/${pkgname}-${_commit}"
  make \
    PREFIX=/usr \
    LTO=1 \
    SYSTEM_MIMALLOC=1
}

package() {
  cd "${srcdir}/$pkgname-${_commit}"
  make \
    PREFIX=/usr \
    LTO=1 \
    SYSTEM_MIMALLOC=1 \
    DESTDIR="$pkgdir" \
    install
  ln -s mold "${pkgdir}/usr/bin/ld"
}

