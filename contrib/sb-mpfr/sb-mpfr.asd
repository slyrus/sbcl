#-(or sb-testing-contrib sb-building-contrib)
(error "Can't build contribs with ASDF")

(defsystem "sb-mpfr"
  :name "SB-MPFR"
  :version "0.1"
  :description "bignum float calculations for SBCL using the MPFR library"
  :serial t
  :depends-on ("sb-gmp")
  :components ((:file "mpfr"))
  :perform (load-op :after (o c) (provide 'sb-mpfr)))

