# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=catdoc
pkgver=0.95
pkgrel=1
pkgdesc='A convertor for Microsoft Word, Excel, PowerPoint and RTF Files to text'
arch=('x86_64' 'aarch64' 'riscv64')
url='https://www.wagner.pp.ru/~vitus/software/catdoc/'
license=('GPL')
optdepends=('tk: for using wordview')
# avoid duplicate install
options=('!makeflags')
source=(
  "http://ftp.wagner.pp.ru/pub/catdoc/catdoc-$pkgver.tar.gz"
  "$pkgname-read-boolean-values.patch::https://github.com/albfan/catdoc/commit/101a9775ca3620f4a307a1159a41777115e8a04d.patch"
  "$pkgname-explicit-errors.patch::https://github.com/albfan/catdoc/commit/3613753da4cc47331f0cebd49445da357b8b5f75.patch"
) 
sha512sums=('dd6bded4b6b70749c007256b182b063ff266f86d53024d8582001678821e8096c5b980bc8f43015d9c82bbe022d71d4ba5fe68aff31b2ff6db3688595e651b2c'
            'cf7d4132ef52df9d102c183efa1707aa78ca6bb692e3d48b621eb0f8e509be2789b83507e8975ddc216766aff31d0877d524791755b81c7a8a7ffec568956fda'
            'd85aa9fdb44525573df98f9d2e6b89d69f5f7a3708e5113f1378fbf6d56a7599c49279cd19e52664f276fb730e498bd37ef56d2f96a29f1de16c7001608be991')

prepare() {
  _patch_ "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"

  ./configure \
    --prefix=/usr  \
    --with-wish=/usr/bin/wish

  make
}

package() {
  cd "$pkgname-$pkgver"

  make installroot="$pkgdir" mandir=/usr/share/man/man1 install

  # man pages
  install -vDm644 -t "$pkgdir/usr/share/man/man1" doc/*.1
}
