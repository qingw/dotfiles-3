;;; emacs/vterm/config.el -*- lexical-binding: t; -*-

(add-to-list 'load-path (concat doom-packages-dir "/quelpa/build/vterm"))

(def-package! vterm
  :init
  (unless
      (file-executable-p
       (concat
        (file-name-directory (locate-library "vterm"))
        "vterm-module.so"))
   (+vterm/vterm-module-compile))
  :config
  (set-env! "SHELL")
  (setq-default
   vterm-max-scrollback 10000)
  (unless (featurep! :emacs term)
    (map!
     :leader
     :prefix ("o" . "open")
     :desc "Terminal"          "t" #'+vterm/open
     :desc "Terminal in popup" "T" #'+vterm/open-popup-in-project))
  (add-hook 'vterm-mode-hook #'doom|mark-buffer-as-real))
