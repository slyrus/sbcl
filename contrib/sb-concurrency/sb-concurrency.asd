;;;; -*-  Lisp -*-
;;;;
;;;; This software is part of the SBCL system. See the README file for
;;;; more information.
;;;;
;;;; This software is derived from the CMU CL system, which was
;;;; written at Carnegie Mellon University and released into the
;;;; public domain. The software is in the public domain and is
;;;; provided with absolutely no warranty. See the COPYING and CREDITS
;;;; files for more information.

#-(or sb-testing-contrib sb-building-contrib)
(error "Can't build contribs with ASDF")

(defsystem "sb-concurrency"
  :components ((:file "package")
               (:file "frlock"   :depends-on ("package"))
               (:file "queue"    :depends-on ("package"))
               (:file "mailbox"  :depends-on ("package" "queue"))
               (:file "gate"     :depends-on ("package")))
  :perform (load-op :after (o c) (provide 'sb-concurrency)))
