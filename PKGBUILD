# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=tzdata
pkgver=2024b
_tzcode=2024b
_tzdata=2024b
pkgrel=1
pkgdesc="Sources for time zone and daylight saving time data"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.iana.org/time-zones"
license=('LicenseRef-tz')
optdepends=('bash: for tzselect')
options=('!emptydirs')
source=(https://www.iana.org/time-zones/repository/releases/tzcode${_tzcode}.tar.gz
        https://www.iana.org/time-zones/repository/releases/${pkgname}${_tzdata}.tar.gz)
sha512sums=('0e4e872d6c6d9e2ce8c4e567fcbb7658942b8544157d1e48673d9cb989f3af3379fa58e7a71ab98f4a8f2ac6727de1f8c4cd1981053409ebd8989345dc640026'
            '0d86686e215672343debb3471b7e7ccb8a27f063f085c9b532d5e0470377843daa0dfb6aee0db4fb9068dd52810c69aeee914a1a7c7e603fdecda7e855020193')

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
