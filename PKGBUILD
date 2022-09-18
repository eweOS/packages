# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=bsd-compat-headers
pkgver=0.7.2
pkgrel=1
pkgdesc="BSD compatibility headers (cdefs, queue, tree)"
arch=(any)
url="https://pkgs.alpinelinux.org/package/edge/main/x86_64/bsd-compat-headers"
license=("BSD")
provides=(sys-cdefs.h sys-queue.h sys-tree.h)
source=('https://git.alpinelinux.org/aports/plain/main/libc-dev/sys-cdefs.h'
	'https://git.alpinelinux.org/aports/plain/main/libc-dev/sys-queue.h'
	'https://git.alpinelinux.org/aports/tree/main/libc-dev/sys-tree.h')
sha512sums=('SKIP' 'SKIP' 'SKIP')

package() {
	install -Dm644 ./sys-cdefs.h $pkgdir/usr/include/sys/cdefs.h
	install -Dm644 ./sys-queue.h $pkgdir/usr/include/sys/queue.h
	install -Dm644 ./sys-tree.h $pkgdir/usr/include/sys/tree.h
}

