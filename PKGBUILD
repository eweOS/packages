# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=bsd-compat-headers
pkgver=0.7.2
_pkgtag=v3.14.10
pkgrel=2
pkgdesc="BSD compatibility headers (cdefs, queue, tree)"
arch=(any)
url="https://pkgs.alpinelinux.org/package/edge/main/x86_64/bsd-compat-headers"
license=("BSD")
provides=(sys-cdefs.h sys-queue.h sys-tree.h)
source=(sys-cdefs.f::'https://git.alpinelinux.org/aports/plain/main/libc-dev/sys-cdefs.h?h=v3.14.10'
  sys-queue.h::'https://git.alpinelinux.org/aports/plain/main/libc-dev/sys-queue.h?h=v3.14.10'
  sys-tree.h::'https://git.alpinelinux.org/aports/plain/main/libc-dev/sys-tree.h?h=v3.14.10')
sha512sums=('8c3fddd73b696a38e633953715c79c47703739be27ee085fc6c960a57b6746ca05bf6406f7e6126cc1a13204254fd5830afb566624e1f298f4d6b58216013c28'
  '2f0d5e6e4dc3350285cf17009265dddcbe12431c111868eea39bc8cb038ab7c1f2acacbb21735c4e9d4a1fd106a8fc0f8611ea33987d4faba37dde5ce6da0750'
  '07cb70f2f0ddb31e23dd913c6f561fc9885667c5803fdf3a559676c99d08834b4104589bacb5d17b4a0b379c68c81a1cf3173832b3da33a7b936fa7b93706844')

package()
{
  install -Dm644 ./sys-cdefs.h $pkgdir/usr/include/sys/cdefs.h
  install -Dm644 ./sys-queue.h $pkgdir/usr/include/sys/queue.h
  install -Dm644 ./sys-tree.h $pkgdir/usr/include/sys/tree.h
}
