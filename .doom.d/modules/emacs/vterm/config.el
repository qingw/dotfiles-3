;;; emacs/vterm/config.el -*- lexical-binding: t; -*-

(def-package! vterm
  :load-path (lambda () (list (concat doom-packages-dir "/quelpa/build/vterm")))
  :init
  (unless (file-executable-p (concat
                              (file-name-directory (locate-library "vterm"))
                              "vterm-module.so"))
    ;; let vterm compile `vterm-modules.so'
    (setq-default vterm-install t))
  :when (string-match-p "MODULES" system-configuration-features)
  :config
  (set-env! "SHELL")
  (add-hook 'vterm-mode-hook #'doom|mark-buffer-as-real)
  ;; Automatically kill buffer when vterm exits.
  (setq-default vterm-exit-functions #'kill-buffer)
  (when (featurep! :ui popup +defaults)
    (set-popup-rules!
      '(("^vterm"
         :size 0.25 :vslot -4 :select t :quit nil :ttl 0))))
  (when (featurep! :feature evil)
    ;; (evil-set-initial-state 'vterm-mode 'insert)
    (add-to-list 'evil-emacs-state-modes 'vterm-mode)
    ;; Go back to normal state but don't move cursor backwards.
    ;; Moving cursor backwards is the default Vim behavior but
    ;; it is not appropriate in some cases like terminals.
    (add-hook 'vterm-mode-hook #'(lambda ()
                                   (setq-local evil-move-cursor-back nil))))
  (setq-default
   vterm-max-scrollback 10000)
  (unless (featurep! :emacs term)
    (map!
     :leader
     :prefix ("o" . "open")
     :desc "Terminal"          "t" #'+vterm/open
     :desc "Terminal in popup" "T" #'+vterm/open-popup-in-project)))
