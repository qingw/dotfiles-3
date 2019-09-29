;; -*- no-byte-compile: t; -*-
;;; steamedfish/telega/packages.el

(package! telega :recipe
  (:host github
   :repo "zevlg/telega.el"
   :branch "master"
   :fork (:host nil :repo "git@github.com:SteamedFish/telega.el.git")
   :files (:defaults "README.md" "etc" "server" "Makefile" "test.el")))
