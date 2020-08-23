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

(define-syntax build-expressions
  (syntax-rules ()
    ((_ op ((arg ...) ...))
     (begin (op arg ...) ...))))

(define-syntax (apply-to-groups stx)
  (syntax-case stx ()
    ((_ op a () (b c ...))
     #'(apply-to-groups op a (b) (c ...)))
    ((_ op a (b) (c d ...))
     (unless (identifier? #'b)
       (raise (make-message-condition "non-symbol in found in place of variable")))
     #'(apply-to-groups op a (b c) (d ...)))
    ((_ op (a ...) (b c) ((d ...) e ...))
     #'(apply-to-groups op (a ... (b c (d ...))) () (e ...)))
    ((_ op (a ...) (b c) (d ...))
     #'(apply-to-groups op (a ... (b c)) () (d ...)))
    ((_ op (a ...) (b) ())
     (raise (make-message-condition "incorrect number of arguments")))
    ((_ op a () ())
     #'(build-expressions op a))))

(define-syntax define-grouping-expression
  (syntax-rules ()
    ((_ name op)
     (define-syntax name
       (syntax-rules ()
         ((_ arg (... ...))
          (apply-to-groups op () () (arg (... ...)))))))))

(define-syntax (translate-procedure-name stx)
  (syntax-case stx ()
    ((_ original-name translated-name)
     (not (bound-identifier=? #'original-name #'translated-name))
     #'(define translated-name original-name))
    ((_ original-name translated-name)
     #''())))

(define-grouping-expression translate-procedure-names translate-procedure-name)

(define (replace orig rep input)
  (let rec ((in input) (out '()))
    (if (null? in)
        (reverse out)
        (let ((curr (car in)))
          (if (list? curr)
              (rec (cdr in) (cons (rec curr '()) out))
              (if (eq? curr orig)
                  (rec (cdr in) (cons rep out))
                  (rec (cdr in) (cons curr out))))))))

(define-syntax (replace-aux-keywords stx)
  (syntax-case stx ()
    ((_ op k (a) . in)
     (raise (make-message-condition "missing auxiliary keyword translation")))
    ((_ op k (o0 t0 o1 t1 ...) . in)
     (with-syntax ((tin (datum->syntax #'k (replace
                                            (syntax->datum #'t0)
                                            (syntax->datum #'o0)
                                            (syntax->datum #'in)))))
       #'(replace-aux-keywords op k (o1 t1 ...) . tin)))
    ((_ op k (o t) . in)
     (with-syntax ((form (datum->syntax #'k (cons (syntax->datum #'op)
                                                  (replace
                                                   (syntax->datum #'t)
                                                   (syntax->datum #'o)
                                                   (syntax->datum #'in))))))
       #'form))))

(define-syntax (translate-syntax-name stx)
  (syntax-case stx ()
    ((_ original-name translated-name)
     (not (bound-identifier=? #'original-name #'translated-name))
     #'(define-syntax translated-name
         (syntax-rules ()
           ((_ arg (... ...))
            (original-name arg (... ...))))))
    ((_ original-name translated-name)
     #''())
    ((_ original-name translated-name aux-keyword-translations)
     (not (bound-identifier=? #'original-name #'translated-name))
     #`(define-syntax (translated-name stx)
         (syntax-case stx ()
           ((k arg (... ...))
            #'(replace-aux-keywords original-name
                                    k
                                    (#,@#'aux-keyword-translations)
                                    arg (... ...))))))
    ((_ original-name translated-name aux-keyword-translations)
     #''())))

(define-grouping-expression translate-syntax-names translate-syntax-name)
