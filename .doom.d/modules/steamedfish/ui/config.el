;;; steamedfish/ui/config.el -*- lexical-binding: t; -*-

(when (display-graphic-p)
  (when IS-MAC
    (setq
     ns-use-thin-smoothing t
     mac-system-move-file-to-trash-use-finder t
     mac-command-modifier 'super
     mac-option-modifier  'meta))

  ;; emacs-mac special
  (when (string-equal window-system "mac")
    (mac-auto-operator-composition-mode))

  (setq
   doom-font (font-spec :family "Fira Mono" :size 12.5)
   doom-variable-pitch-font (font-spec :family "Fira Sans")
   doom-unicode-font (font-spec :family "Hiragino Sans GB" :size 14.5)
   doom-big-font (font-spec :family "Fira Mono" :size 21))

  (add-hook 'window-setup-hook #'toggle-frame-maximized)
  (add-hook 'window-setup-hook #'+ui/toggle-transparency))

(map!
 "s-u"                         #'+ui/toggle-transparency
 :leader
 (:prefix ("t" . "toggle")
   :desc "Transparency" :n "t" #'+ui/toggle-transparency))

(after! doom-modeline
  (setq doom-modeline-icon t
        doom-modeline-major-mode-icon t
        doom-modeline-major-mode-color-icon t
        doom-modeline-buffer-state-icon t
        doom-modeline-buffer-modification-icon t
        doom-modeline-enable-word-count t
        doom-modeline-indent-info t))

(after! lsp-ui
  (setq lsp-ui-doc-position 'at-point
        lsp-ui-flycheck-enable t
        lsp-ui-sideline-ignore-duplicate t
        lsp-ui-sideline-update-mode 'point
        lsp-ui-doc-enable t)

  (if (featurep 'xwidget-internal)
      (setq lsp-ui-doc-use-webkit t)))

;; (after! ivy-posframe
;;   (when (display-graphic-p)
;;     (setq ivy-display-function #'ivy-posframe-display-at-frame-bottom-left)))

;; nyan-mode currently has some conflict with doom-modeline
;; (def-package! nyan-mode
;;   :init
;;   (setq
;;    nyan-animate-nyancat t
;;    nyan-wavy-trail t)
;;   (nyan-mode 1))
