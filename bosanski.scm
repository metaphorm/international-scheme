;;; Copyright 2020 Metaphorm Solutions, Inc.
;;;
;;; Licensed under the Apache License, Version 2.0 (the "License");
;;; you may not use this file except in compliance with the License.
;;; You may obtain a copy of the License at
;;;
;;; http://www.apache.org/licenses/LICENSE-2.0
;;;
;;; Unless required by applicable law or agreed to in writing, software
;;; distributed under the License is distributed on an "AS IS" BASIS,
;;; WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;;; See the License for the specific language governing permissions and
;;; limitations under the License.

;;; Bosanska Šema (R6RS)

(load "international.scm")

(translate-syntax-names
  and i
  assert trvdi
  begin počni
  buffer-mode bafer-način
  buffer-mode? bafer-način?
  case slučaj (else inače)
  case-lambda slučaj-lambda
  cond uslov (else inače)
  define definiši
  define-condition-type definiši-vrstu-stanja
  define-enumeration definiši-nabrajanje
  define-record-type definiši-vrstu-rekorda (fields polja
                                             mutable promjenljiv
                                             immutable nepromjenljiv
                                             parent roditelj
                                             protocol protokol
                                             sealed zapečaćen
                                             opaque neproziran
                                             nongenerative negenerativan
                                             parent-rtd roditelj-rvd)
  define-syntax definiši-sintaksu
  delay odgodi
  do uradi
  endianness endianstvo
  eol-style stil-kraja-linije
  error-handling-mode način-rukovanja-grešaka
  file-options fajl-opcije
  guard čuvaj (else inače)
  identifier-syntax identifikatorska-sintaksa
  if ako
  lambda lambda
  library biblioteka (and i
                      or ili
                      not ne
                      import uvezi
                      for za
                      run pokretanje
                      expand ekspanziju
                      meta meta
                      only samo
                      except osim
                      prefix prefiks
                      rename preimenuj
                      export izvezi
                      rename preimenuj)
  let nek
  let* nek*
  let*-values nek*-vrijednosti
  let-syntax nek-sintaksa
  let-values nek-vrijednosti
  letrec nekrek
  letrec* nekrek*
  letrec-syntax nekrek-sintaksa
  or ili
  quasiquote kvazicitiraj (unquote odcitiraj
                           unquote-splicing odcitiraj-uplečujući)
  quasisyntax kvazisintaksa
  quote citiraj
  record-constructor-descriptor deskriptor-konstruktora-rekorda
  record-type-descriptor deskriptor-vrste-rekorda
  set! postavi!
  syntax sintaksa
  syntax-case sintaktički-slučaj
  syntax-rules sintaktička-pravila
  unless osim-ako
  unsyntax odsintaksa
  unsyntax-splicing odsintaksa-uplečujući
  when kad
  with-syntax sa-sintaksom)

(translate-procedure-names
  * *
  + +
  - -
  / /
  < <
  <= <=
  = =
  > >
  >= >=
  abs aps
  acos akos
  angle ugao
  append dodaj
  apply apliciraj
  asin asin
  assertion-violation validacija-tvrdnje
  assertion-violation? validacija-tvrdnje?
  assoc assoc
  assp assp
  assq assq
  assv assv
  atan atan
  binary-port? binarni-port?
  bitwise-and bitni-i
  bitwise-arithmetic-shift bitni-aritmetički-pomak
  bitwise-arithmetic-shift-left bitni-aritmetički-pomak-ljevo
  bitwise-arithmetic-shift-right bitni-aritmetički-pomak-desno
  bitwise-bit-count bitni-broj-bitova
  bitwise-bit-field bitni-polje-bitova
  bitwise-bit-set? bitni-skup-bitova?
  bitwise-copy-bit bitni-kopiraj-bit
  bitwise-copy-bit-field bitni-kopiraj-polje-bitova
  bitwise-first-bit-set bitni-prvi-skup-bitova
  bitwise-if bitno-ako
  bitwise-ior bitno-uključivo-ili
  bitwise-length bitna-dužina
  bitwise-not bitno-ne
  bitwise-reverse-bit-field bitno-preokreni-polje-bitova
  bitwise-rotate-bit-field bitno-rotiraj-polje-bitova
  bitwise-xor bitno-isključivo-ili
  boolean=? booleov=?
  boolean? booleov?
  bound-identifier=? vezan-identifikator=?
  bytevector->sint-list bajtvektor->ocij-lista
  bytevector->string bajtvektor->string
  bytevector->u8-list bajtvektor->n8-lista
  bytevector->uint-list bajtvektor->ncij-lista
  bytevector-copy bajtvektor-kopiraj
  bytevector-copy! bajtvektor-kopiraj!
  bytevector-fill! bajtvektor-ispuni!
  bytevector-ieee-double-native-ref bajtvektor-ieee-dupli-domaći-ref
  bytevector-ieee-double-native-set! bajtvektor-ieee-dupli-domaći-postavi!
  bytevector-ieee-double-ref bajtvektor-ieee-dupli-ref
  bytevector-ieee-double-set! bajtvektor-ieee-dupli-postavi!
  bytevector-ieee-single-native-ref bajtvektor-ieee-jednokrevetni-domaći-ref
  bytevector-ieee-single-native-set! bajtvektor-ieee-jednokrevetni-domaći-postavi!
  bytevector-ieee-single-ref bajtvektor-ieee-jednokrevetni-ref
  bytevector-ieee-single-set! bajtvektor-ieee-jednokrevetni-postavi!
  bytevector-length bajtvektor-dužina
  bytevector-s16-native-ref bajtvektor-o16-domaći-ref
  bytevector-s16-native-set! bajtvektor-o16-domaći-postavi!
  bytevector-s16-ref bajtvektor-o16-ref
  bytevector-s16-set! bajtvektor-o16-postavi!
  bytevector-s32-native-ref bajtvektor-o32-domaći-ref
  bytevector-s32-native-set! bajtvektor-o32-domaći-postavi!
  bytevector-s32-ref bajtvektor-o32-ref
  bytevector-s32-set! bajtvektor-o32-postavi!
  bytevector-s64-native-ref bajtvektor-o64-domaći-ref
  bytevector-s64-native-set! bajtvektor-o64-domaći-postavi!
  bytevector-s64-ref bajtvektor-o64-ref
  bytevector-s64-set! bajtvektor-o64-postavi!
  bytevector-s8-ref bajtvektor-o8-ref
  bytevector-s8-set! bajtvektor-o8-postavi!
  bytevector-sint-ref bajtvektor-ocij-ref
  bytevector-sint-set! bajtvektor-ocij-postavi!
  bytevector-u16-native-ref bajtvektor-n16-domaći-ref
  bytevector-u16-native-set! bajtvektor-n16-domaći-postavi!
  bytevector-u16-ref bajtvektor-n16-ref
  bytevector-u16-set! bajtvektor-n16-postavi!
  bytevector-u32-native-ref bajtvektor-n32-domaći-ref
  bytevector-u32-native-set! bajtvektor-n32-domaći-postavi!
  bytevector-u32-ref bajtvektor-n32-ref
  bytevector-u32-set! bajtvektor-n32-postavi!
  bytevector-u64-native-ref bajtvektor-n32-domaći-ref
  bytevector-u64-native-set! bajtvektor-n32-domaći-postavi!
  bytevector-u64-ref bajtvektor-n32-ref
  bytevector-u64-set! bajtvektor-n32-postavi!
  bytevector-u8-ref bajtvektor-n8-ref
  bytevector-u8-set! bajtvektor-n8-postavi!
  bytevector-uint-ref bajtvektor->ncij-ref
  bytevector-uint-set! bajtvektor->ncij-postavi!
  bytevector=? bajtvektor=?
  bytevector? bajtvektor?
  caaaar caaaar
  caaadr caaadr
  caaar caaar
  caadar caadar
  caaddr caaddr
  caadr caadr
  caar caar
  cadaar cadaar
  cadadr cadadr
  cadar cadar
  caddar caddar
  cadddr cadddr
  caddr caddr
  cadr cadr
  call-with-bytevector-output-port zovi-sa-bajtvektor-izlaznim-portom
  call-with-current-continuation zovi-sa-tekućim-nastavkom
  call-with-input-file zovi-sa-ulaznim-fajlom
  call-with-output-file zovi-sa-izlaznim-fajlom
  call-with-port zovi-sa-portom
  call-with-string-output-port zovi-sa-string-izlaznim-portom
  call-with-values zovi-sa-vrijednostima
  call/cc zovi/tn
  car car
  cdaaar cdaaar
  cdaadr cdaadr
  cdaar cdaar
  cdadar cdadar
  cdaddr cdaddr
  cdadr cdadr
  cdar cdar
  cddaar cddaar
  cddadr cddadr
  cddar cddar
  cdddar cdddar
  cddddr cddddr
  cdddr cdddr
  cddr cddr
  cdr cdr
  ceiling plafon
  char->integer kar->cijeli-broj
  char-alphabetic? kar-abecedan?
  char-ci<=? kar-vim<=?
  char-ci<? kar-vim<?
  char-ci=? kar-vim=?
  char-ci>=? kar-vim>=?
  char-ci>? kar-vim>?
  char-downcase kar-smaji-slova
  char-foldcase kar-savij-slova
  char-general-category kar-opšta-kategorija
  char-lower-case? kar-mala-slova?
  char-numeric? kar-numerički?
  char-title-case? kar-veliko-prvo-slovo
  char-titlecase kar-uvećaj-prvo-slovo
  char-upcase kar-uvećaj-slova
  char-upper-case? kar-velika-slova?
  char-whitespace? kar-razmak
  char<=? kar<=?
  char<? kar<?
  char=? kar=?
  char>=? kar>=?
  char>? kar>?
  char? kar?
  close-input-port zatvori-ulazni-port
  close-output-port zatvori-izlazni-port
  close-port zatvori-port
  command-line naredbena-linija
  complex? kompleksan?
  condition stanje
  condition-accessor stanje-pristupac
  condition-irritants stanje-iritanti
  condition-message stanje-sa-porukom
  condition-predicate stanje-predikat
  condition-who stanje-ko
  condition? stanje?
  cons cons
  cons* cons*
  cos kos
  current-error-port tekući-port-greške
  current-input-port tekući-ulazni-port
  current-output-port tekući-izlazni-port
  datum->syntax podatak->sintaksa
  delete-file izbriši-fajl
  denominator nazivnik
  display prikaži
  div dje
  div-and-mod dje-i-mod
  div0 dje0
  div0-and-mod0 dje0-i-mod0
  dynamic-wind dinamički-namotaj
  enum-set->list nabr-skup->lista
  enum-set-complement nabr-skup-komplement
  enum-set-constructor nabr-skup-konstruktor
  enum-set-difference nabr-skup-razlika
  enum-set-indexer nabr-skup-indeksovac
  enum-set-intersection nabr-skup-presjek
  enum-set-member? nabr-skup-član
  enum-set-projection nabr-skup-projekcija
  enum-set-subset? nabr-skup-podskup
  enum-set-union nabr-skup-unija
  enum-set-universe nabr-skup-univerzum
  enum-set=? nabr-skup=?
  environment okruženje
  eof-object kraj-fajla-objekat
  eof-object? kraj-fajla-objekat?
  eq? jnk?
  equal-hash jednak-heš
  equal? jednak?
  eqv? ekv?
  error greška
  error? greška?
  eval eval
  even? paran?
  exact tačan
  exact->inexact tačan->netačan
  exact-integer-sqrt tačan-cijeli-broj-kvkn
  exact? tačan
  exists postoji
  exit izađi
  exp eksp
  expt ekspt
  file-exists? fajl-postoji?
  filter filter
  find nađi
  finite? konačan?
  fixnum->flonum fiksbroj->flobroj
  fixnum-width fiksbroj-širina
  fixnum? fiksbroj?
  fl* fl*
  fl+ fl+
  fl- fl-
  fl/ fl/
  fl<=? fl<=?
  fl<? fl<?
  fl=? fl=?
  fl>=? fl>=?
  fl>? fl>?
  flabs flaps
  flacos flakos
  flasin flasin
  flatan flatan
  flceiling flplafon
  flcos flkos
  fldenominator flnazivnik
  fldiv fldje
  fldiv-and-mod fldje-i-mod
  fldiv0 fldje0
  fldiv0-and-mod0 fldje0-i-mod0
  fleven? flparan?
  flexp flexp
  flexpt flexpt
  flfinite? flkonačan?
  flfloor flpod?
  flinfinite? flbeskonačan?
  flinteger? flcijeli-broj?
  fllog fllog
  flmax flmaks
  flmin flmin
  flmod flmod
  flmod0 flmod0
  flnan? flnijebroj?
  flnegative? flnegativan?
  flnumerator flbrojnik
  flodd? flneparan?
  flonum? flobroj?
  floor pod
  flpositive? flpozitivan?
  flround flzaokruži
  flsin flsin
  flsqrt flkvkn
  fltan fltan
  fltruncate flskrati
  flush-output-port speri-izlazni-port
  flzero? flnula?
  fold-left savij-ljevo
  fold-right savij-desno
  for-all za-sve
  for-each za-svaki
  force prisili
  free-identifier=? slobodan-identifikator=?
  fx* fks*
  fx*/carry fks*/nosi
  fx+ fks+
  fx+/carry fks+/nosi
  fx- fks-
  fx-/carry fks-/nosi
  fx<=? fks<=?
  fx<? fks<?
  fx=? fks=?
  fx>=? fks>=?
  fx>? fks>?
  fxand fksi
  fxarithmetic-shift fksaritmetički-pomak
  fxarithmetic-shift-left fksaritmetički-pomak-ljevo
  fxarithmetic-shift-right fksaritmetički-pomak-desno
  fxbit-count fksbroj-bitova
  fxbit-field fkspolje-bitova
  fxbit-set? fksskup-bitova?
  fxcopy-bit fkskopiraj-bit
  fxcopy-bit-field fks-polje-bitova
  fxdiv fksdje
  fxdiv-and-mod fksdje-i-mod
  fxdiv0 fxdje0
  fxdiv0-and-mod0 fksdje0-i-mod0
  fxeven? fksparan?
  fxfirst-bit-set fksprvi-skup-bitova
  fxif fksako
  fxior fksiili
  fxlength fksdužina
  fxmax fksmaks
  fxmin fksmin
  fxmod fksmod
  fxmod0 fksmod0
  fxnegative? fksnegativan?
  fxnot fksne
  fxodd? fksneparan?
  fxpositive? fkspozitivan?
  fxreverse-bit-field fks-preokreni-polje-bitova
  fxrotate-bit-field fks-rotiraj-polje-bitova
  fxxor fksksili
  fxzero? fksnula?
  gcd nzd
  generate-temporaries generiraj-privremene
  get-bytevector-all dobij-bajtvektor-sve
  get-bytevector-n dobij-bajtvektor-n
  get-bytevector-n! dobij-bajtvektor-n!
  get-bytevector-some dobij-bajtvektor-neki
  get-char dobij-kar
  get-datum dobij-podatak
  get-line dobij-liniju
  get-string-all dobij-string-sve
  get-string-n dobij-string-n
  get-string-n! dobij-string-n!
  get-u8 dobij-n8
  greatest-fixnum najveći-fiksbroj
  hashtable-clear! heštabelu-očisti
  hashtable-contains? heštabela-sadrži?
  hashtable-copy heštabelu-kopiraj
  hashtable-delete! heštabelu-izbriši!
  hashtable-entries heštabele-unosi
  hashtable-equivalence-function heštabele-funkcija-ekvivalencije
  hashtable-hash-function heštabele-heš-funkcija
  hashtable-keys heštabele-ključevi
  hashtable-mutable? heštabela-promjenljiva?
  hashtable-ref heštabeli-ref
  hashtable-set! heštabeli-postavi!
  hashtable-size heštabele-veličina
  hashtable-update! heštabelu-ažuriraj!
  hashtable? heštabela?
  i/o-decoding-error? u/i-greška-dekodiranja?
  i/o-encoding-error-char u/i-greška-kodiranja-kar
  i/o-encoding-error? u/i-greška-kodiranja?
  i/o-error-filename u/i-greška-ime-falja
  i/o-error-port u/i-greška-porta
  i/o-error-position u/i-greška-pozicije
  i/o-error? u/i-greška?
  i/o-file-already-exists-error? u/i-greška-fajl-već-postoji?
  i/o-file-does-not-exist-error? u/i-greška-fajl-ne-postoji?
  i/o-file-is-read-only-error? u/i-greška-fajl-je-samo-za-čitanje?
  i/o-file-protection-error? u/i-greška-zaštite-fajla?
  i/o-filename-error? u/i-greška-ime-falja?
  i/o-invalid-position-error? u/i-greška-nevažeća-pozicija?
  i/o-port-error? u/i-greška-porta?
  i/o-read-error? i/o-greška-u-čitanju?
  i/o-write-error? u/i-greška-u-pisanju?
  identifier? identifikator?
  imag-part imag-dio
  implementation-restriction-violation? kršenje-ograničenja-implementacije?
  inexact netačan
  inexact->exact netačan->tačan
  inexact? netačan?
  infinite? beskonačan?
  input-port? ulazni-port?
  integer->char cijeli-broj->kar
  integer-valued? vrijednost-cijeli-broj?
  integer? cijeli-broj?
  irritants-condition? iritanti-stanje?
  latin-1-codec latinski-1-kodek
  lcm nzm
  least-fixnum najmanji-fiksbroj
  length dužina
  lexical-violation? leksičko-kršenje?
  list lista
  list->string lista->string
  list->vector lista->vektor
  list-ref lista-ref
  list-sort lista-sortiraj
  list-tail lista-rep
  list? lista?
  load učitaj
  log log
  lookahead-char sljedeći-kar
  lookahead-u8 sljedeći-n8
  magnitude veličina
  make-assertion-violation napravi-kršenje-tvrdnje
  make-bytevector napravi-bajtvektor
  make-custom-binary-input-port napravi-binarni-ulazni-port-po-narudžbini
  make-custom-binary-input/output-port napravi-binarni-ulazni/izlazni-port-po-narudžbini
  make-custom-binary-output-port napravi-binarni-izlazni-port-po-narudžbini
  make-custom-textual-input-port napravi-tekstualni-ulazni-port-po-narudžbini
  make-custom-textual-input/output-port napravi-tekstualni-ulazni/izlazni-port-po-narudžbini
  make-custom-textual-output-port napravi-tekstualni-izlazni-port-po-narudžbini
  make-enumeration napravi-nabrajanje
  make-eq-hashtable napravi-jnk-heštabelu
  make-eqv-hashtable napravi-ekv-heštabelu
  make-error napravi-grešku
  make-hashtable napravi-heštabelu
  make-i/o-decoding-error napravi-u/i-grešku-dekodiranja
  make-i/o-encoding-error napravi-u/i-grešku-kodiranja
  make-i/o-error napravi-u/i-grešku
  make-i/o-file-already-exists-error napravi-u/i-fajl-već-postoji-greška
  make-i/o-file-does-not-exist-error napravi-u/i-fajl-ne-postoji-greška
  make-i/o-file-is-read-only-error napravi-u/i-fajl-je-samo-za-čitanje-greška
  make-i/o-file-protection-error napravi-u/i-fajl-zaštićen-greška
  make-i/o-filename-error napravi-u/i-ime-fajla-greška
  make-i/o-invalid-position-error napravi-u/i-nevažeća-pozicija-greška
  make-i/o-port-error napravi-u/i-port-greška
  make-i/o-read-error napravi-u/i-čitanje-greška
  make-i/o-write-error napravi-u/i-pisanje-greška
  make-implementation-restriction-violation napravi-kršenje-ograničenja-implementacije
  make-irritants-condition napravi-stanje-iritanti
  make-lexical-violation napraviti-leksičko-kršenje
  make-message-condition napravi-stanje-sa-porukom
  make-no-infinities-violation napravi-zabranjena-beskonačnost-kršenje
  make-no-nans-violation napravi-zabranjeno-nije-broj-kršenje
  make-non-continuable-violation napravi-ne-nastavljivo-kršenje
  make-polar napravi-polarni
  make-record-constructor-descriptor napravi-rekord-konstruktor-deskriptor
  make-record-type-descriptor napravi-rekord-vrsta-deskriptor
  make-rectangular napravi-pravougaoni
  make-serious-condition napravi-ozbiljno-stanje
  make-string napravi-string
  make-syntax-violation napravi-sintaktičko-kršenje
  make-transcoder napravi-transkoder
  make-undefined-violation napravi-nedefinisan-kršenje
  make-variable-transformer napravi-varijabilni-transformator
  make-vector napravi-vektor
  make-violation navpravi-kršenje
  make-warning napravi-upozorenje
  make-who-condition napravi-ko-stanje
  map mapiraj
  max maks
  member član
  memp člap
  memq člaj
  memv člav
  message-condition? stanje-sa-porukom?
  min min
  mod mod
  mod0 mod0
  modulo modulo
  nan? nijebroj?
  native-endianness domaće-endianstvo
  native-eol-style domaći-stil-kraja-linija
  native-transcoder domaći-transkoder
  negative? negativan?
  newline novalinija
  no-infinities-violation? zabranjena-beskonačnost-kršenje?
  no-nans-violation? zabranjeno-nije-broj-kršenje?
  non-continuable-violation? ne-nastavljivo-kršenje?
  not ne
  null-environment null-okruženje
  null? null?
  number->string broj->string
  number? broj?
  numerator brojnik
  odd? neparan?
  open-bytevector-input-port otvori-bajtvektorni-ulazni-port
  open-bytevector-output-port otvori-bajtvektorni-izlazni-port
  open-file-input-port otvori-ulazni-port-za-fajl
  open-file-input/output-port otvori-ulazni/izlazni-port-za-fajl
  open-file-output-port otvori-izlazni-port-za-fajl
  open-input-file otvori-ulazni-fajl
  open-output-file otvori-izlazni-fajl
  open-string-input-port otvori-ulazni-port-za-string
  open-string-output-port otvori-izlazni-port-za-string
  output-port-buffer-mode bafer-način-izlasnog-porta
  output-port? izlazni-port?
  pair? par?
  partition odjeli
  peek-char viri-kar
  port-eof? port-na-kraju-fajla?
  port-has-port-position? port-ima-port-poziciju?
  port-has-set-port-position!? port-ima-postavi-port-poziciju!?
  port-position port-pozicija
  port-transcoder port-transkoder
  port? port?
  positive? pozitivan?
  procedure? procedura?
  put-bytevector stavi-bajtvektor
  put-char stavi-kar
  put-datum stavi-podatak
  put-string stavi-string
  put-u8 stavi-n8
  quotient kvocijent
  raise podigni
  raise-continuable podigni-nastavljivo
  rational-valued? vrijednost-racionalna?
  rational? racionalan?
  rationalize racionaliziraj
  read čitaj
  read-char učitaj-kar
  real->flonum stvarni->flobroj
  real-part stvarni-dio
  real-valued? vrijednost-stvarna?
  real? stvaran?
  record-accessor rekord-pristupac
  record-constructor rekord-konstruktor
  record-field-mutable? rekord-polje-promjenljivo?
  record-mutator rekord-mjenjač
  record-predicate rekord-predikat
  record-rtd rekord-rvd
  record-type-descriptor? rekord-vrsta-deskriptor?
  record-type-field-names rekord-vrsta-imena-polja
  record-type-generative? rekord-vrsta-generativna?
  record-type-name rekord-vrsta-ime
  record-type-opaque? rekord-vrsta-neproziran?
  record-type-parent rekord-vrsta-roditelj
  record-type-sealed? rekord-vrsta-zapečaćen?
  record-type-uid rekord-vrsta-uid
  record? rekord?
  remainder ostatak
  remove ukloni
  remp uklp
  remq uklj
  remv uklv
  reverse preokreni
  round zaokruži
  scheme-report-environment šemino-izveštajno-okruženje
  serious-condition? ozbiljno-stanje?
  set-car! postavi-car!
  set-cdr! postavi-cdr!
  set-port-position! postavi-poziciju-porta!
  simple-conditions jednostavna-stanja
  sin sin
  sint-list->bytevector ocij-lista->bajtvektor
  sqrt kvkn
  standard-error-port standardni-port-za-greške
  standard-input-port standradni-ulazni-port
  standard-output-port standardni-izlazni-port
  string string
  string->bytevector string->bajtvektor
  string->list string->lista
  string->number string->broj
  string->symbol string->simbol
  string->utf16 string->utf16
  string->utf32 string->utf32
  string->utf8 string->utf8
  string-append string-dodaj
  string-ci-hash string-vim-heš
  string-ci<=? string-vim<=?
  string-ci<? string-vim<?
  string-ci=? string-vim=?
  string-ci>=? string-vim>=?
  string-ci>? string-vim>?
  string-copy string-kopiraj
  string-downcase string-smaji-slova
  string-fill! string-ispuni!
  string-foldcase string-savij-slova
  string-for-each string-za-svaki
  string-hash string-heš
  string-length string-dužina
  string-normalize-nfc string-normaliziraj-nfc
  string-normalize-nfd string-normaliziraj-nfd
  string-normalize-nfkc string-normaliziraj-nfkc
  string-normalize-nfkd string-normaliziraj-nfkd
  string-ref string-ref
  string-set! string-postavi!
  string-titlecase kar-uvećaj-prva-slova
  string-upcase string-uvećaj-slova
  string<=? string<=?
  string<? string<?
  string=? string=?
  string>=? string>=?
  string>? string>?
  string? string?
  substring podstring
  symbol->string simbol->string
  symbol-hash simbol-heš
  symbol=? simbol=?
  symbol? simbol?
  syntax->datum sintaksa->podatak
  syntax-violation sintaktičko-kršenje
  syntax-violation-form sintaktičko-kršenje-forma
  syntax-violation-subform sintaktičko-kršenje-podforma
  syntax-violation? sintaktičko-kršenje?
  tan tan
  textual-port? tekstualni-port?
  transcoded-port transkodirani-port
  transcoder-codec transkoder-kodek
  transcoder-eol-style transkoder-stil-kraja-linije
  transcoder-error-handling-mode način-rukovanja-transkoder-grešaka
  truncate skrati
  u8-list->bytevector n8-lista->bajtvektor
  uint-list->bytevector ncij-lista->bajtvektor
  undefined-violation? nedefinisan-kršenje?
  utf-16-codec utf-16-kodek
  utf-8-codec utf-8-kodek
  utf16->string utf16->string
  utf32->string utf32->string
  utf8->string utf8->string
  values vrijednosti
  vector vektor
  vector->list vektor->lista
  vector-fill! vektor-ispuni!
  vector-for-each vektor-za-svaki
  vector-length vektor-dužina
  vector-map vektor-mapa
  vector-ref vektor-ref
  vector-set! vektor-postavi!
  vector-sort vektor-sortiraj
  vector-sort! vektor-sortiraj!
  vector? vektor?
  violation? prekršaj?
  warning? upozorenje?
  who-condition? ko-stanje?
  with-exception-handler sa-izuzetak-rukovateljom
  with-input-from-file sa-ulazom-od-fajla
  with-output-to-file sa-izlazom-do-fajla
  write piši
  write-char piši-kar
  zero? nula?)
