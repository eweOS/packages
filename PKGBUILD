pkgname=fake-alpine-release
pkgdesc="a fake alpine release data for some build tools that detects alpine (like go)"
url="https://alpinelinux.org"
license=("MIT")
pkgver=3.17_alpha20220809
pkgrel=1
arch=('any')
source=(APKBUILD::"https://git.alpinelinux.org/aports/plain/main/alpine-base/APKBUILD")
sha256sums=('466c1da2c0c470ce295f0f262c1b0cdb75157cf446d30c98af86e6942dc2305f')

pkgver() {
	sed -n -e '/^pkgver/ s/.*\= *//p' APKBUILD | xargs
}

package() {
	mkdir $pkgdir/etc
	echo $pkgver > $pkgdir/etc/alpine-release
}

