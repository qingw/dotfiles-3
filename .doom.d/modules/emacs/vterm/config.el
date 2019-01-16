;;; emacs/vterm/config.el -*- lexical-binding: t; -*-

(add-to-list 'load-path (concat doom-packages-dir "/quelpa/build/vterm"))

(def-package! vterm
  :config
  (set-env! "SHELL")
  (setq-default
   vterm-max-scrollback 10000)
  (unless (featurep! :emacs term)
    (map!
     :leader
     :prefix ("o" . "open")
     :desc "Terminal"          "t" #'+vterm/open
     :desc "Terminal in popup" "T" #'+vterm/open-popup-in-project)))
