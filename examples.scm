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

(load "bosanski.scm")

(definiši (zdravo-svjete)
  (prikaži "Zdravo, Svjete!"))

(definiši (faktoriel n)
  (ako (= n 1)
       1
       (* n (faktoriel (- n 1)))))

(definiši-sintaksu definiši-sintaktičko-pravilo
  (sintaktička-pravila ()
    ((_ (ime itd ...) šablon)
     (definiši-sintaksu ime
       (sintaktička-pravila ()
         ((_ itd ...) šablon))))))

(definiši-sintaktičko-pravilo (sa (promjenjiva vrijednost) tijelo ...)
  (nek ((promjenjiva vrijednost)) tijelo ...))

(definiši-sintaktičko-pravilo (kad uslov tijelo ...)
  (ako uslov (počni tijelo ...)))

(definiši-sintaktičko-pravilo (dok uslov tijelo ...)
  (nek ponovi ()
    (kad uslov
      tijelo ... (ponovi))))

(sa (x 3)
  (dok (< x 10)
    (postavi! x (+ x 1))
    (prikaži x)))

(definiši-sintaksu za
  (sintaktička-pravila (u)
    ((_ (predmet u predmetima) tijelo ...)
     (za-svaki (lambda (predmet) tijelo ...) predmetima))))

(sa (predmeti (lista 1 2 3 4 5 6 7))
  (za (predmet u predmeti)
    (prikaži (+ predmet 1))))

(definiši-sintaktičko-pravilo (za-petlja ((promjenjiva početno) uslov priraštaj) tijelo ...)
  (nek ponovi ((promjenjiva početno))
    (ako uslov
      (počni tijelo ... (ponovi priraštaj)))))

(definiši-sintaktičko-pravilo (ponovi broj tijelo ...)
  (za-petlja ((promjenjiva 0) (< promjenjiva broj) (+ promjenjiva 1))
    tijelo ...))

(ponovi 10 (prikaži "Radi! "))

(definiši-sintaksu izgradi-izraze
  (sintaktička-pravila ()
    ((_ op ((arg ...) ...))
     (počni (op arg ...) ...))))

(definiši-sintaksu (apliciraj-grupama stks)
  (sintaktički-slučaj stks ()
    ((_ op a () (b c ...))
     #'(apliciraj-grupama op a (b) (c ...)))
    ((_ op a (b) (c d ...))
     (osim-ako (identifikator? #'b)
       (podigni (napravi-stanje-sa-porukom "ne-simbol pronađen umjesto promenljive")))
     #'(apliciraj-grupama op a (b c) (d ...)))
    ((_ op (a ...) (b c) ((d ...) e ...))
     #'(apliciraj-grupama op (a ... (b c (d ...))) () (e ...)))
    ((_ op (a ...) (b c) (d ...))
     #'(apliciraj-grupama op (a ... (b c)) () (d ...)))
    ((_ op (a ...) (b) ())
     (podigni (napravi-stanje-sa-porukom "pogrešan broj argumenata")))
    ((_ op a () ())
     #'(izgradi-izraze op a))))

(definiši-sintaksu definiši-grupiran-izraz
  (sintaktička-pravila ()
    ((_ ime op)
     (definiši-sintaksu ime
       (sintaktička-pravila ()
         ((_ arg (... ...))
          (apliciraj-grupama op () () (arg (... ...)))))))))

(definiši-sintaksu (prevedi-ime-procedure stks)
  (sintaktički-slučaj stks ()
    ((_ originalno-ime prevedeno-ime)
     (ne (vezan-identifikator=? #'originalno-ime #'prevedeno-ime))
     #'(definiši prevedeno-ime originalno-ime))
    ((_ originalno-ime prevedeno-ime)
     #''())))

(definiši-grupiran-izraz prevedi-imena-procedura prevedi-ime-procedure)

(definiši (zamijeni orig zamj ulaz)
  (nek rek ((u ulaz) (iz '()))
    (ako (null? u)
         (preokreni iz)
         (nek ((tren (car u)))
           (ako (lista? tren)
                (rek (cdr u) (cons (rek tren '()) iz))
                (ako (jnk? tren orig)
                     (rek (cdr u) (cons zamj iz))
                     (rek (cdr u) (cons tren iz))))))))

(definiši-sintaksu (zamijeni-sporedne-ključne-riječi stks)
  (sintaktički-slučaj stks ()
    ((_ op k (a) . in)
     (podigni (napravi-stanje-sa-porukom "nedostaje prijevod sporednih ključnih riječi")))
    ((_ op k (o0 p0 o1 p1 ...) . in)
     (sa-sintaksom ((tin (podatak->sintaksa #'k (zamijeni
                                                 (sintaksa->podatak #'p0)
                                                 (sintaksa->podatak #'o0)
                                                 (sintaksa->podatak #'in)))))
       #'(zamijeni-sporedne-ključne-riječi op k (o1 p1 ...) . tin)))
    ((_ op k (o p) . in)
     (sa-sintaksom ((forma (podatak->sintaksa #'k (cons (sintaksa->podatak #'op)
                                                    (zamijeni
                                                     (sintaksa->podatak #'p)
                                                     (sintaksa->podatak #'o)
                                                     (sintaksa->podatak #'in))))))
       #'forma))))

(definiši-sintaksu (prevedi-ime-sintakse stks)
  (sintaktički-slučaj stks ()
    ((_ originalno-ime prevedeno-ime)
     (ne (vezan-identifikator=? #'originalno-ime #'prevedeno-ime))
     #'(definiši-sintaksu prevedeno-ime
         (sintaktička-pravila ()
           ((_ arg (... ...))
            (originalno-ime arg (... ...))))))
    ((_ originalno-ime prevedeno-ime)
     #''())
    ((_ originalno-ime prevedeno-ime prijevodi-sporednih-ključnih-riječi)
     (ne (vezan-identifikator=? #'originalno-ime #'prevedeno-ime))
     #`(definiši-sintaksu (prevedeno-ime stks)
         (sintaktički-slučaj stks ()
           ((k arg (... ...))
            #'(zamijeni-sporedne-ključne-riječi originalno-ime
                                                k
                                                (#,@#'prijevodi-sporednih-ključnih-riječi)
                                                arg (... ...))))))
    ((_ originalno-ime prevedeno-ime prijevodi-sporednih-ključnih-riječi)
     #''())))

(definiši-grupiran-izraz prevedi-imena-sintaksa prevedi-ime-sintakse)
