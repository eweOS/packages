# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=tzdata
pkgver=2026b
pkgrel=1
pkgdesc="Sources for time zone and daylight saving time data"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.iana.org/time-zones"
license=('LicenseRef-tz')
optdepends=('bash: for tzselect')
options=('!emptydirs')
source=(https://www.iana.org/time-zones/repository/releases/tzcode${pkgver}.tar.gz
        https://www.iana.org/time-zones/repository/releases/${pkgname}${pkgver}.tar.gz)
sha512sums=('55b44d52a83c9db151be32c3d78376ea7f9d4311ef15ed6fe34b855b08fc546531e51309d178d9c175a6d5d7d0b058440e45a55d200ca8925e3798dac9bc739f'
            'a44882258c0a7fbe587e8b73d6bb3cd5be7d4788976ea742adbbf176eb3b33e5bd7d1714b2fffe2972b1a42e7335eac39ed0bd63e819bb421550f8cae1df4f2f')

_timezones=('africa' 'antarctica' 'asia' 'australasia'
           'europe' 'northamerica' 'southamerica'
           'etcetera' 'backward' 'factory')

prepare() {
  sed -i "s:sbin:bin:g" Makefile
}

build() {
  make LFLAGS="${LDFLAGS} ${LTOFLAGS}"
}

package() {
  cd "${srcdir}"
  # install tzcode stuff
  make DESTDIR="${pkgdir}" install

  # install tzdata stuff
  ./zic -b fat -d "${pkgdir}"/usr/share/zoneinfo ${_timezones[@]}
  ./zic -b fat -d "${pkgdir}"/usr/share/zoneinfo/posix ${_timezones[@]}
  ./zic -b fat -d "${pkgdir}"/usr/share/zoneinfo/right -L leapseconds ${_timezones[@]}
  # This creates the posixrules file. We use New York because POSIX requires the daylight savings time rules to be in accordance with US rules.   
  ./zic -b fat -d "${pkgdir}"/usr/share/zoneinfo -p America/New_York
  install -m644 -t "${pkgdir}"/usr/share/zoneinfo iso3166.tab leap-seconds.list zone1970.tab zone.tab SECURITY # zone.tab is depricated and will go soon

  # cleanup
  rm "${pkgdir}/etc/localtime"

  # install license
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
