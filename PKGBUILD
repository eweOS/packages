# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libffi
pkgver=3.4.3
pkgrel=3
pkgdesc='A portable Foregin Function Interface library.'
arch=(x86_64 aarch64 riscv64)
url='http://sourceware.org/libffi/'
license=(BSD)
source=(
  "ftp://sourceware.org/pub/libffi/libffi-${pkgver}.tar.gz"
  "declare-open_temp_exec_file.patch::https://github.com/libffi/libffi/pull/764.patch"
)
sha256sums=(
  '4416dd92b6ae8fcb5b10421e711c4d3cb31203d77521a77d85d0102311e6c3b8'
  '20570753cecbf39d73889a9be3cff1f56e9053a06049dee8ea9e7b0292b4f724'
)

prepare()
{
  cd ${pkgname}-${pkgver}
  # https://github.com/libffi/libffi/issues/760
  patch -p1 < ../declare-open_temp_exec_file.patch
}

build()
{
  cd ${pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --enable-shared
  make
}

package()
{
  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
}
