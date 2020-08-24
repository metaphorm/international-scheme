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
       (sintaktička-pravila  ()
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

(nek ((predmeti (lista 1 2 3 4 5 6 7)))
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
