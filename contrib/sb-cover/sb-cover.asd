;;; -*-  Lisp -*-

#-(or sb-testing-contrib sb-building-contrib)
(error "Can't build contribs with ASDF")

(defsystem "sb-cover"
  #+sb-building-contrib :pathname
  #+sb-building-contrib #p"SYS:CONTRIB;SB-COVER;"
  :depends-on ("sb-md5")
  :components ((:file "cover"))
  :perform (load-op :after (o c) (provide 'sb-cover)))
