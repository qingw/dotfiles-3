;; -*- no-byte-compile: t; -*-
;;; tools/telega/packages.el

(package! telega :recipe
  (:fetcher github
   :repo "zevlg/telega.el"
   :branch "master"
   :files (:defaults "README.md" "etc" "server" "Makefile" "test.el")))
