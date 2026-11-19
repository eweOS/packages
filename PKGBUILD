# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=tzdata
pkgver=2026f
pkgrel=1
pkgdesc="Sources for time zone and daylight saving time data"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.iana.org/time-zones"
license=('LicenseRef-tz')
optdepends=('bash: for tzselect')
options=('!emptydirs')
source=(https://www.iana.org/time-zones/repository/releases/tzcode${pkgver}.tar.gz
        https://www.iana.org/time-zones/repository/releases/${pkgname}${pkgver}.tar.gz)
sha512sums=('eefcea60c37857214e1eba768d1bbd096de2a8f5afc9a776555552922cc174b32892d7442097b699b77efcba4d85649ed7d13e752ffdbcaad1050749c6c7b5aa'
            '26189803c8b3e903dcc467404e2feefb7d190cb1870249a23577ce31e9dcbf187e4704e0b45c8d1366d1c501bb5b53a2e80f8e2828b2163be15e532f6acab52d')

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
