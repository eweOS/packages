# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=texlive-texmf
pkgname=(texlive-doc texlive-meta)
# generate collections with ./list-collections
_collections=(
  basic
  bibtexextra
  binextra
  context
  fontsextra
  fontsrecommended
  fontutils
  formatsextra
  games
  humanities
  langarabic
  langchinese
  langcjk
  langcyrillic
  langczechslovak
  langenglish
  langeuropean
  langfrench
  langgerman
  langgreek
  langitalian
  langjapanese
  langkorean
  langother
  langpolish
  langportuguese
  langspanish
  latex
  latexextra
  latexrecommended
  luatex
  mathscience
  metapost
  music
  pictures
  plaingeneric
  pstricks
  publishers
  xetex
)
depends=(texlive-bin)
arch=(any)
for _coll in ${_collections[@]}; do
  pkgname+=(texlive-$_coll)
done
pkgver=20260301
_dbver=${pkgver:0:4}.1
pkgrel=1
pkgdesc='TeX Live - '
license=(GPL)
url='https://tug.org/texlive/'
_mirror="https://texlive.info/historic"
source=(texmf-dist.tar.xz::${_mirror}/systems/texlive/${pkgver:0:4}/texlive-$pkgver-texmf.tar.xz
        texlive-bin.tar.xz::${_mirror}/systems/texlive/${pkgver:0:4}/texlive-$pkgver-bin.tar.xz
        tlpkg.tar.gz::${_mirror}/systems/texlive/${pkgver:0:4}/install-tl-unx.tar.gz
        texlive.tlpdb::https://git.texlive.info/texlive/plain/Master/tlpkg/texlive.tlpdb?h=tags/texlive-${_dbver}
        09-texlive-fonts.conf
        texmf.cnf.patch
        70-mktexlsr.hook
        71-texlive-language.hook
        texlive-language.script
        72-texlive-fmtutil.hook
        texlive-fmtutil.script
        73-texlive-updmap.hook
        texlive-updmap.script
        80-mtxrun.hook
        mtxrun.script)
sha256sums=('349eb7c5c2c15333d77490a52934b053c6dcb88834f2224978f7a4edf67940e7'
            'd36f205460e1a9858d0b869914a4ef6bf68ea4036ab7b34157cfbc79ce55bfe0'
            '5cc0703d6fe49f00a2932c4e3bcee37a11cc0a969ae9fcbf9cad6f0d984d6363'
            'ae33f319ba29c515079f5e8ef0a9b33e08ecb41dcc57c1c65e04d7b906acfb90'
            '5e79c40cf3ab93348fc89e97890198601767ea2c8fea89ea76088c17a2b35962'
            'fb5dbba4a2eb7c47c403ae8ac48df897e10316a2f54f3d0b67fbbd06386dfd3a'
            '95f6540c49b11f1ece8010d76b53ca90efd61e1831530562bfcde4350f6c1db1'
            'e6d399faee55ba461cf7e617f2369f5c516de292b28afc6665c9e3fe2b821973'
            'c64c2a6371e94b0f67799c0ac84ea74d8edbc181b26672aa15b8132ec5fbabc3'
            '9b99f197c71149b03355f7c24ee1e07f54a1262bb030756fe660b9aa715a184f'
            'f96e9f815fa0a4b85e677f2a9215d9106b8abe46eceb3f3e36a6c76eda3e4a85'
            '2141c0842668fb937fd21ca2fae39b642c9665656e404a0d4ee7bdc477bf51fe'
            'ee6e76192a5ad880a2152cd7900b86c8465239fb228045a2f8360b0d7a449f4a'
            'f6bb67db32d37ca15eba88bd15d8b9882c61915f98bc8d7c3c21a66c8cf8f019'
            '98b730e917281227e29077ba5689ad78baee0af3859b55966b2604c6a85f1305')
options=(!strip) # Nothing to strip, save packaging time

_grep_til_blank() {
  awk '{if ($0 == "") exit; else print}'
}

_grep_key() {
  sed -ne "s|^${1} ||p"
}

_tlpkg_find_pkg() {
  sed -e "1,/^name ${1}$/d;" tlpkg/texlive.tlpdb | _grep_til_blank
}

_tlpkg_til_nonblank() {
  awk '{if ($0 !~ /^ /) exit; else print}'
}

_tlpkg_find_section() {
  sed -e "1,/^${1}/d;" | _tlpkg_til_nonblank
}

prepare() {
  ln -sf {texlive-$pkgver-texmf/,}texmf-dist
  ln -sf {install-tl-$pkgver/,}tlpkg
  cp {,tlpkg/}texlive.tlpdb
  ln -sf {texlive-$pkgver-bin/,}x86_64-linuxmusl

# Customize configuration
  patch -d texmf-dist/web2c -p0 < texmf.cnf.patch

  # Copy files where format and maps will be extracted from
  cp texmf-dist/web2c/{fmtutil.cnf,updmap.cfg,texmf.cnf} .
  cp texmf-dist/tex/generic/config/language.{dat,dat.lua,def} .
  
  # Split files per package
  for _coll in ${_collections[@]}; do
    echo -ne "splitting collection ${_coll}"
    # extract description
    _desc=`_tlpkg_find_pkg "collection-${_coll}" | _grep_key "shortdesc"`
    echo $_desc > pkgdesc-$_coll
    # extract depends
    _pkgs=`_tlpkg_find_pkg "collection-${_coll}" | _grep_key "depend"`
    _prog=0
    _total=`echo $_pkgs | wc -w`
    for _pkg in $_pkgs; do
      _prog=$(($_prog+1))
      echo -ne "\rsplitting collection ${_coll} ($_prog/$_total)"
      # collection depends are added as dependencies
      if [[ $_pkg == collection-* ]]; then
        echo ${_pkg/collection-/texlive-} >> depends-$_coll
      else
        echo $_pkg >> packages-$_coll
        # move files to the corresponding subdir
        _split=`_tlpkg_find_pkg "${_pkg}"`
        _files=`echo "$_split" | _tlpkg_find_section "runfiles" | grep texmf-dist` || true
        for _file in $_files; do
          # some modules include docs in runfiles
          [[ $_file == texmf-dist/doc/* ]] && continue
          mkdir -p texlive-$_coll/$(dirname $_file)
          mv $_file texlive-$_coll/$(dirname $_file)
        done
        # extract formats
        _fmts=`echo "$_split" | grep "execute AddFormat"` || true
        if [[ ! -z "$_fmts" ]]; then
          echo "$_fmts" | while read -r _fmt; do
            _name=`echo $_fmt | sed 's|.* name=\(\S*\).*|\1|'`
            _engine=`echo $_fmt | sed 's|.* engine=\(\S*\).*|\1|'`
            grep -E "(^| )$_name $_engine" fmtutil.cnf >> $_coll.fmts
          done
        fi
        # extract maps
        _maps=`echo "$_split" | grep -E "execute add(Kanji|Mixed|)Map"` || true
        if [[ ! -z "$_maps" ]]; then
          echo "$_maps" | while read -r _map; do
            grep "${_map/execute add/}" updmap.cfg >> $_coll.maps
          done
        fi
        # extract hyphen rules
        _langs=`echo "$_split" | grep "execute AddHyphen"` || true
        if [[ ! -z "$_langs" ]]; then
          sed -e "1,/from ${_pkg}:/d;" language.dat | awk '{if ($0 ~ /^%/) exit; else print}' >> $_coll.dat
          sed -re "1,/from ${_pkg}:/d;" language.dat.lua | awk '{if ($0 ~ /(^--|^})/) exit; else print}' >> $_coll.dat.lua
          sed -e "1,/from ${_pkg}:/d;" language.def | awk '{if ($0 ~ /^%/) exit; else print}' >> $_coll.def
        fi
        # extract linked scripts
        if [[ ${_pkg} != psutils && "$_split" == *${_pkg}.ARCH* ]]; then
          _links=`_tlpkg_find_pkg "${_pkg}.x86_64-linuxmusl" | grep "bin/x86_64-linuxmusl" | sed -e 's|bin/x86_64-linuxmusl||g'`
          for _link in $_links; do
            if [[ $(readlink x86_64-linuxmusl/$_link) == */scripts/* ]]; then
              mkdir -p ${_coll}-bin
              cp -P x86_64-linuxmusl/$_link ${_coll}-bin
              ln -sfn $(readlink ${_coll}-bin/$_link | sed "s|texlive-$pkgver-bin/../..|../share|") ${_coll}-bin/$_link
            fi
          done
        fi
      fi
    done
    echo
  done
}

_package() {
  pkgdesc+="`cat pkgdesc-$1`"
  [[ -s depends-$1 ]] && depends+=(`cat depends-$1`)
# jadetex depends on ulem and marvosym
  [[ $1 == formatsextra ]] && depends+=(texlive-plaingeneric texlive-fontsrecommended texlive-latexrecommended)
  [[ $1 == xetex ]] && depends+=(texlive-latex)
  [[ $1 == latex || $1 == binextra ]] && depends+=(dvisvgm)
  [[ $1 == context ]] && optdepends+=('luametatex: LuaMetaTeX engine')
  [[ $1 == fontutils ]] && optdepends+=('ghostscript: for epstopdf')
  [[ $1 == pictures ]] && optdepends+=('ghostscript: for epspdf')
  [[ $1 == latexextra ]] && optdepends+=('java-runtime: for pdfannotextractor'
                                         'python-pygments: for pygmentex')
  [[ $1 == music ]] && optdepends+=('fontforge: for scripts from the lilyglyphs package')
  if [[ $1 == basic ]]; then
    depends+=(perl) # needed by fmtutil which runs from install hook
    optdepends+=('perl-tk: for the tlmgr GUI'
                 'biber: for bibliography processing')
    conflicts=(texlive-core)
    provides=(texlive-core)
    replaces=(texlive-core)
  fi
  if [[ $1 == binextra ]]; then
    optdepends+=('ed: for texconfig'
                 'dialog: for texconfig'
                 'java-runtime: for utilities like arara, texplate'
                 'perl-tk: for texdoctk'
                 'perl-yaml-tiny: for latexindent'
                 'perl-file-homedir: for latexindent'
                 'perl-ipc-system-simple: for latex-git-log'
                 'python: for de-macro, dviasm, pythontex'
                 'texlive-latexrecommended: for pdfjam'
                 'wdiff: for texdiff')
  fi
  if [[ $1 == lang* ]]; then
    groups=(texlive-lang)
  else
    groups=(texlive)
  fi
  for _pkg in `cat packages-$1`; do
    [[ ! ${_collections[@]} =~ (^| )$_pkg($| ) ]] && provides+=(texlive-$_pkg)
  done

  mkdir -p "$pkgdir"/usr/share
  mv texlive-$1/texmf-dist "$pkgdir"/usr/share
  
  [[ -d $1-bin ]] && mv $1-bin "$pkgdir"/usr/bin

  [[ -s $1.fmts ]] && install -Dm644 $1.fmts -t "$pkgdir"/var/lib/texmf/arch/installedpkgs
  [[ -s $1.maps ]] && install -Dm644 $1.maps -t "$pkgdir"/var/lib/texmf/arch/installedpkgs
  [[ -s $1.dat ]] && install -Dm644 $1.dat -t "$pkgdir"/var/lib/texmf/arch/installedpkgs
  [[ -s $1.dat.lua ]] && install -Dm644 $1.dat.lua -t "$pkgdir"/var/lib/texmf/arch/installedpkgs
  [[ -s $1.def ]] && install -Dm644 $1.def -t "$pkgdir"/var/lib/texmf/arch/installedpkgs
  
  if [[ $1 == basic ]]; then
    backup=(etc/texmf/dvipdfmx/dvipdfmx.cfg
            etc/texmf/dvips/config/config.ps
            etc/texmf/tex/generic/tex-ini-files/pdftexconfig.tex
            etc/texmf/web2c/fmtutil.cnf
            etc/texmf/web2c/mktex.cnf
            etc/texmf/web2c/texmf.cnf
            etc/texmf/web2c/updmap-hdr.cfg
            etc/texmf/xdvi/XDvi)
    install -Dm644 09-texlive-fonts.conf -t "$pkgdir"/usr/share/fontconfig/conf.avail/
  # install pacman hooks
    install -Dm644 7*.hook -t "$pkgdir"/usr/share/libalpm/hooks/
    install -Dm755 texlive-fmtutil.script "$pkgdir"/usr/share/libalpm/scripts/texlive-fmtutil
    install -Dm755 texlive-language.script "$pkgdir"/usr/share/libalpm/scripts/texlive-language
    install -Dm755 texlive-updmap.script "$pkgdir"/usr/share/libalpm/scripts/texlive-updmap
  # install tlpkg files needed by tlmgr and texconfig
    install -Dm644 "$srcdir"/tlpkg/TeXLive/* -t "$pkgdir"/usr/share/perl5/vendor_perl/TeXLive/
    install -Dm644 "$srcdir"/tlpkg/texlive.tlpdb -t "$pkgdir"/usr/share/tlpkg
    install -Dm644 "$srcdir"/tlpkg/installer/config.guess -t "$pkgdir"/usr/share/tlpkg/installer
  # remove files that will be autogenerated
    rm "$pkgdir"/usr/share/texmf-dist/web2c/updmap.cfg
    rm "$pkgdir"/usr/share/texmf-dist/web2c/fmtutil.cnf
    rm "$pkgdir"/usr/share/texmf-dist/tex/generic/config/language.{dat,dat.lua,def}
  # copy config files to $TEXMFCONFIG tree
    install -Dm644 "$pkgdir"/usr/share/texmf-dist/dvipdfmx/dvipdfmx.cfg -t "$pkgdir"/etc/texmf/dvipdfmx/
    install -Dm644 "$pkgdir"/usr/share/texmf-dist/dvips/config/config.ps -t "$pkgdir"/etc/texmf/dvips/config/
    install -Dm644 "$pkgdir"/usr/share/texmf-dist/tex/generic/config/language.us "$pkgdir"/etc/texmf/tex/generic/config/language.dat
    install -Dm644 "$pkgdir"/usr/share/texmf-dist/tex/generic/config/language.us.lua "$pkgdir"/etc/texmf/tex/generic/config/language.dat.lua
    echo "}" >> "$pkgdir"/etc/texmf/tex/generic/config/language.dat.lua
    install -Dm644 "$pkgdir"/usr/share/texmf-dist/tex/generic/config/language.us.def "$pkgdir"/etc/texmf/tex/generic/config/language.def
    echo "\uselanguage {USenglish} %%% This MUST be the last line of the file." >> "$pkgdir"/etc/texmf/tex/generic/config/language.def
    install -Dm644 "$pkgdir"/usr/share/texmf-dist/tex/generic/tex-ini-files/pdftexconfig.tex -t "$pkgdir"/etc/texmf/tex/generic/tex-ini-files/
    install -Dm644 "$pkgdir"/usr/share/texmf-dist/web2c/fmtutil-hdr.cnf "$pkgdir"/etc/texmf/web2c/fmtutil.cnf
    install -Dm644 "$pkgdir"/usr/share/texmf-dist/web2c/mktex.cnf -t "$pkgdir"/etc/texmf/web2c/
    install -Dm644 "$pkgdir"/usr/share/texmf-dist/web2c/texmf.cnf -t "$pkgdir"/etc/texmf/web2c/
    install -Dm644 "$pkgdir"/usr/share/texmf-dist/web2c/updmap-hdr.cfg -t "$pkgdir"/etc/texmf/web2c/
    install -Dm644 "$pkgdir"/usr/share/texmf-dist/xdvi/XDvi -t "$pkgdir"/etc/texmf/xdvi/
  fi

  if [[ $1 == binextra ]]; then
    backup=(etc/texmf/chktex/chktexrc)
  # copy config files to $TEXMFCONFIG tree
    install -Dm644 "$pkgdir"/usr/share/texmf-dist/chktex/chktexrc -t "$pkgdir"/etc/texmf/chktex/
  # install zsh completions
    mkdir -p "$pkgdir"/usr/share/zsh/site-functions
    TEXMFCNF="$srcdir" \
    "$pkgdir"/usr/bin/texdoc --print-completion zsh > "$pkgdir"/usr/share/zsh/site-functions/_texdoc 2>/dev/null
  fi

  if [[ $1 == context ]]; then
  # install pacman hooks
    install -Dm644 80-mtxrun.hook -t "$pkgdir"/usr/share/libalpm/hooks/
    install -Dm755 mtxrun.script "$pkgdir"/usr/share/libalpm/scripts/mtxrun

  # set executable bit
    chmod +x "$pkgdir"/usr/share/texmf-dist/scripts/context/lua/context.lua
    chmod +x "$pkgdir"/usr/share/texmf-dist/scripts/context/lua/mtxrun.lua
  fi

  if [[ $1 == fontutils ]]; then
    backup=(etc/texmf/ttf2pk/ttf2pk.cfg)
  # copy config files to $TEXMFCONFIG tree
    install -Dm644 "$pkgdir"/usr/share/texmf-dist/ttf2pk/ttf2pk.cfg -t "$pkgdir"/etc/texmf/ttf2pk/
  fi
}
  
for _coll in ${_collections[@]}; do
  eval "package_texlive-$_coll() {
    _package $_coll
  }"
done

package_texlive-doc() {
  pkgdesc+='documentation'

  mkdir -p "$pkgdir"/usr/share/doc
  mv texmf-dist/doc/{info,man} "$pkgdir"/usr/share
  mv texmf-dist/doc "$pkgdir"/usr/share/doc/texlive
# Symlink so texdoc can find it
  mkdir -p "$pkgdir"/usr/share/texmf-dist
  ln -s /usr/share/doc/texlive "$pkgdir"/usr/share/texmf-dist/doc
# Fix conflicts with asymptote, psutils, dvisvgm, t1utils
  rm "$pkgdir"/usr/share/info/asy-faq.info
  rm "$pkgdir"/usr/share/man/man1/{asy,dvisvgm,epsffit,extractres,includeres,psbook,psjoin,psnup,psresize,psselect,pstops,psutils,t1ascii,t1asm,t1binary,t1disasm,t1mac,t1unmac}.1
  rm -f "$pkgdir"/usr/share/man{,/man*}/{Makefile,*.pdf}
# Fix permissions
  find "$pkgdir" -type d -exec chmod 755 {} \;
}
 
package_texlive-meta() {
  pkgdesc='Metapackage to install Tex Live'
  for _coll in ${_collections[@]}; do
    [[ $_coll != lang* ]] && depends+=(texlive-$_coll)
  done
}
