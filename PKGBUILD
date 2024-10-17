# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=tzdata
pkgver=2024a
_tzcode=2024a
_tzdata=2024a
pkgrel=2
pkgdesc="Sources for time zone and daylight saving time data"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.iana.org/time-zones"
license=('LicenseRef-tz')
optdepends=('bash: for tzselect')
options=('!emptydirs')
source=(https://www.iana.org/time-zones/repository/releases/tzcode${_tzcode}.tar.gz
        https://www.iana.org/time-zones/repository/releases/${pkgname}${_tzdata}.tar.gz)
sha512sums=('46da8bfa762c7d109db93e5c060789097fc0e1e38bdad5bb8fec886ef47f138bd03b913a743cd5f7e23dc359a72bfd63e7ffc0de199d2b51e6a174361dbdc43c'
            '1f09f1b2327cc9e1afc7e9045e83ee3377918dafe1bee2f282b6991828d03b3c70a4d3a17f9207dfb1361bb25bc214a8922a756e84fa114e9ba476226db57236')

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
