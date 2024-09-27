pkgname=fake-alpine-release
pkgdesc="a fake alpine release data for some build tools that detects alpine (like go)"
url="https://alpinelinux.org"
license=("MIT")
pkgver=3.21.0
pkgrel=1
arch=('any')
source=(APKBUILD::"https://git.alpinelinux.org/aports/plain/main/alpine-base/APKBUILD")
sha256sums=('ce133d0e51004dc918d642123ce9773a3dd61e59320b6cfd76815e0acfdf6cd9')

pkgver()
{
  sed -n -e '/^pkgver/ s/.*\= *//p' APKBUILD | xargs
}

package()
{
  mkdir $pkgdir/etc
  echo $pkgver > $pkgdir/etc/alpine-release
}
