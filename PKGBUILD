# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=nginx
pkgver=1.25.2
pkgrel=1
pkgdesc='Lightweight HTTP server and IMAP/POP3 proxy server'
arch=(x86_64 aarch64 riscv64)
url='https://nginx.org'
license=(custom)
depends=(pcre2 zlib openssl libxcrypt)
source=(
  $url/download/nginx-$pkgver.tar.gz
  nginx.service
  nginx.sysusers
)
backup=(etc/nginx/nginx.conf)
sha256sums=('05dd6d9356d66a74e61035f2a42162f8c754c97cf1ba64e7a801ba158d6c0711'
            '5c46b43935c68d16a179521cbbf61625c2276f54641c8e130adb4d5e396ee20c'
            'f1634ba56d49c9e4ddd3f98cbcff594178b39efa068ad43894c4347a04272518')

_activated_modules=(
  --with-threads
  --with-file-aio
  --with-http_ssl_module
  --with-http_v2_module
  --with-http_realip_module
  --with-http_addition_module
  --with-http_sub_module
  --with-http_dav_module
  --with-http_flv_module
  --with-http_mp4_module
  --with-http_gunzip_module
  --with-http_gzip_static_module
  --with-http_auth_request_module
  --with-http_random_index_module
  --with-http_secure_link_module
  --with-http_degradation_module
  --with-http_slice_module
  --with-http_stub_status_module
  --with-http_perl_module=dynamic
  --with-stream=dynamic
  --with-stream_ssl_module
  --with-stream_realip_module
  --with-stream_ssl_preread_module
)

build()
{
  cd $pkgbase-$pkgver
  ./configure \
    --with-cc-opt="-D_LARGEFILE64_SOURCE" \
    --prefix=/etc/nginx \
    --sbin-path=/usr/bin/nginx \
    --conf-path=/etc/nginx/nginx.conf \
    --error-log-path=stderr \
    --pid-path=/run/nginx.pid \
    --lock-path=/run/lock/nginx.lock \
    --user=www-data \
    --group=www-data \
    --http-log-path=/var/log/nginx/access.log \
    ${_activated_modules[@]}
  make
}

package()
{
  depends+=(dinit catnest)
  cd $pkgbase-$pkgver
  make DESTDIR="$pkgdir" install
  install -d $pkgdir/etc/dinit.d
  install -m 0754 "${srcdir}/nginx.service" $pkgdir/etc/dinit.d/nginx
  install -d $pkgdir/usr/lib/sysusers.d
  install -m 0644 "${srcdir}/nginx.sysusers" $pkgdir/usr/lib/sysusers.d/nginx.conf
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
