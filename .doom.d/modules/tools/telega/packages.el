;; -*- no-byte-compile: t; -*-
;;; tools/telega/packages.el

(package! telega :recipe
  (:fetcher github
   :repo "zevlg/telega.el"
   :files ("*")))