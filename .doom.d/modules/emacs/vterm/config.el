;;; emacs/vterm/config.el -*- lexical-binding: t; -*-

(def-package! vterm
  :load-path (lambda () (list (concat doom-packages-dir "/quelpa/build/vterm")))
  :init
  (unless
      (file-executable-p
       (concat
        (file-name-directory (locate-library "vterm"))
        "vterm-module.so"))
   (+vterm/vterm-module-compile))
  :when (string-match-p "MODULES" system-configuration-features)
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
