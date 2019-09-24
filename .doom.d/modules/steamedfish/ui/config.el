;;; steamedfish/ui/config.el -*- lexical-binding: t; -*-

(when (display-graphic-p)
  (when IS-MAC
    (setq
     mac-system-move-file-to-trash-use-finder t))

  ;; emacs-mac special
  (when (eq window-system 'mac)
    (mac-auto-operator-composition-mode))
  (when (eq window-system 'ns)
    (setq ns-use-thin-smoothing t))

  ;; fonts
  (if (member "OperatorMono Nerd Font" (font-family-list))
      (setq doom-font (font-spec :family "OperatorMono Nerd Font" :size 12.5)
            doom-big-font (font-spec :family "OperatorMono Nerd Font" :size 21))
    (when (member "Fira Mono" (font-family-list))
      (setq doom-font (font-spec :family "Fira Mono" :size 12.5)
            doom-big-font (font-spec :family "Fira Mono" :size 21))))
  (if (member "Operator SSm" (font-family-list))
      (setq doom-variable-pitch-font (font-spec :family "Operator SSm"))
    (when (member "Fira Sans" (font-family-list))
      (setq doom-variable-pitch-font (font-spec :family "Fira Sans"))))
  (when (member "Hiragino Sans GB" (font-family-list))
    (setq doom-unicode-font (font-spec :family "Hiragino Sans GB" :size 14.5)))

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

(use-package! nyan-mode
  :after doom-modeline
  :init
  (setq
   nyan-animate-nyancat t
   nyan-wavy-trail t)
  (nyan-mode 1))

(use-package! flucui-themes
  :config
  (setq doom-theme 'flucui-dark))
