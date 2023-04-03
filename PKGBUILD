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
sha512sums=('37c8fc73c7aea7b490f7850927e2bb91d12137c9e59e22c084146d515696dbc7973b5de92f4c987ba080dd2502ba83127006442c3f019b6447a620c0cae73178'
            '2f0d5e6e4dc3350285cf17009265dddcbe12431c111868eea39bc8cb038ab7c1f2acacbb21735c4e9d4a1fd106a8fc0f8611ea33987d4faba37dde5ce6da0750'
            'c32be6a122e52f73d221150a5070a3a4a3fb713f8362e2c2923dac64d839ed067d8c3ed4367a1efc22664bb89fd3d4c79fd3eb6eeef6661dc674689056cda66b')

package() {
	install -Dm644 ./sys-cdefs.h $pkgdir/usr/include/sys/cdefs.h
	install -Dm644 ./sys-queue.h $pkgdir/usr/include/sys/queue.h
	install -Dm644 ./sys-tree.h $pkgdir/usr/include/sys/tree.h
}

