;;; -*- lisp -*-

#-(or sb-testing-contrib sb-building-contrib)
(error "Can't build contribs with ASDF")

(defsystem "sb-simple-streams"
  :depends-on ("sb-bsd-sockets" "sb-posix")
  #+sb-building-contrib :pathname
  #+sb-building-contrib #p"SYS:CONTRIB;SB-SIMPLE-STREAMS;"
  :components ((:file "package")
               (:file "fndb")
               (:file "iodefs" :depends-on ("package"))
               ;;(:file "pcl")
               ;;(:file "ext-format" :depends-on ("package"))
               (:file "classes" :depends-on ("iodefs"))
               (:file "internal" :depends-on ("classes"))
               (:file "strategy" :depends-on ("string"))
               (:file "impl" :depends-on ("internal" "fndb" "file" "string"))
               (:file "file" :depends-on ("strategy"))
               (:file "direct" :depends-on ("strategy"))
               (:file "null" :depends-on ("strategy"))
               (:file "socket" :depends-on ("strategy"))
               (:file "string" :depends-on ("internal"))
               (:file "terminal" :depends-on ("strategy"))
               ;;(:file "gray-compat" :depends-on ("package"))
               )
  :perform (load-op :after (o c) (provide 'sb-simple-streams)))
