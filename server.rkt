#lang racket

(require web-server/servlet
         web-server/servlet-env)

(define (start req)
  (response/xexpr
    '(html (head (title "racket")
           (body (h1 "working?"))))))

(define (port 
          (if (getenv "PORT")
            (string->number (getenv "PORT"))
            8080)))

(serve/servlet start 
               #:servlet-path "/"
               #:listen-ip #f
               #:port port
               #:command-line? #t)