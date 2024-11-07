# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=java-common
pkgname=('java-runtime-common' 'java-environment-common')
pkgver=1
pkgrel=1
pkgdesc='Common files for Java Runtime Environments'
url='https://os.ewe.moe'
arch=('any')
license=('GPL')
makedepends=('bash')
source=(profile_jre.sh
        bin_eweos-java)
sha256sums=('cc59ae3426e27b234b3ef109906a464574520002bde409329dc6f24fd7713d9d'
            '2c16e05f819c7069f9282c77ceeb49e5484cc070a5f3d7543ca1e228619ff95d')

package_java-runtime-common() {
  pkgdesc='Common files for Java Runtime Environments'
  backup=(etc/profile.d/jre.sh)
  depends=('bash')
  install=install_java-runtime-common.sh

  install -d -m 755 "$pkgdir/usr/lib/jvm/"
  ln -s /dev/null "$pkgdir/usr/lib/jvm/default"
  ln -s /dev/null "$pkgdir/usr/lib/jvm/default-runtime"

  install -D -m 644 profile_jre.sh  "$pkgdir/etc/profile.d/jre.sh"
  install -D -m 755 bin_eweos-java "$pkgdir/usr/bin/eweos-java"

  install -d -m 755 "$pkgdir/usr/bin/"
  # Official list of binaries that Java headless runtime packages MUST provide
  # This list is based on default Java implementation: "OpenJDK 7 Icedtea"
  for b in \
    java keytool orbd pack200 rmid rmiregistry servertool tnameserv unpack200;
  do
    ln -s /usr/lib/jvm/default-runtime/bin/$b "$pkgdir/usr/bin/$b"
  done
}

package_java-environment-common() {
  pkgdesc='Common files for Java Development Kits'

  install -d "$pkgdir/usr/bin"
  # Official list of supplementary binaries that Java environment packages MUST provide
  # This list is based on default Java implementation: "OpenJDK 7 Icedtea"
  for b in \
    jar jarsigner javac javadoc javah javap jcmd \
    jconsole jdb jinfo jmap jps jstack jstat \
    jstatd rmic schemagen serialver wsgen wsimport xjc;
  do
    ln -s /usr/lib/jvm/default/bin/$b "$pkgdir/usr/bin/$b"
  done
}
