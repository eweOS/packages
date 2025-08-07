# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=go-md2man
pkgver=2.0.7
pkgrel=2
pkgdesc='A markdown to manpage generator'
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url='https://github.com/cpuguy83/go-md2man'
license=('MIT')
makedepends=('go')
source=($pkgname-$pkgver.tar.gz::"https://github.com/cpuguy83/go-md2man/archive/v$pkgver.tar.gz")
sha256sums=('ca3a5b57e2c01759f5a00ad2a578d034c5370fae9aa7a6c3af5648b2fc802a92')

build() {
  cd "$pkgname-$pkgver"
  go build -o go-md2man -buildvcs=false .
  ./go-md2man -in=go-md2man.1.md -out=go-md2man.1
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 go-md2man "$pkgdir/usr/bin/go-md2man"
  install -Dm755 go-md2man.1 "$pkgdir/usr/share/man/man1/go-md2man.1"
  install -Dm755 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
