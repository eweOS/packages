# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=nginx
pkgver=1.25.4
pkgrel=4
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
options=(!lto)
backup=(etc/nginx/nginx.conf)
sha256sums=('760729901acbaa517996e681ee6ea259032985e37c2768beef80df3a877deed9'
            '0c34877109a40df6ae357c6c7832642ecdcf1bc8f181e9552503a674bc426626'
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
  # with musl: https://trac.nginx.org/nginx/ticket/2534
  ./configure \
    --with-cc-opt="-D_LARGEFILE64_SOURCE -Wno-sign-compare" \
    --prefix=/etc/nginx \
    --sbin-path=/usr/bin/nginx \
    --conf-path=/etc/nginx/nginx.conf \
    --error-log-path=stderr \
    --pid-path=/run/nginx.pid \
    --lock-path=/run/lock/nginx.lock \
    --user=www-data \
    --group=www-data \
    --http-log-path=/var/log/nginx/access.log \
    --http-client-body-temp-path=/var/lib/nginx/client-body \
    --http-proxy-temp-path=/var/lib/nginx/proxy \
    --http-fastcgi-temp-path=/var/lib/nginx/fastcgi \
    --http-scgi-temp-path=/var/lib/nginx/scgi \
    --http-uwsgi-temp-path=/var/lib/nginx/uwsgi \
    ${_activated_modules[@]}
  make
}

package()
{
  depends+=(dinit catnest)
  cd $pkgbase-$pkgver
  make DESTDIR="$pkgdir" install

  sed -e '44s|html|/usr/share/nginx/html|' \
      -e '54s|html|/usr/share/nginx/html|' \
    -i "$pkgdir"/etc/nginx/nginx.conf

  rm "$pkgdir"/etc/nginx/*.default

  install -d "$pkgdir"/var/lib/nginx
  install -dm700 "$pkgdir"/var/lib/nginx/proxy

  chmod 755 "$pkgdir"/var/log/nginx
  chown root:root "$pkgdir"/var/log/nginx

  install -d "$pkgdir"/usr/share/nginx
  mv "$pkgdir"/etc/nginx/html/ "$pkgdir"/usr/share/nginx

  rmdir "$pkgdir"/run

  _dinit_install_services_ ${srcdir}/nginx.service
  install -Dm644 "${srcdir}/nginx.sysusers" $pkgdir/usr/lib/sysusers.d/nginx.conf
  _install_license_ LICENSE LICENSE
}
