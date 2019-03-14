;;; intl/chinese/+fcitx.el -*- lexical-binding: t; -*-

(def-package! fcitx
  :config
  (if IS-LINUX
      (setq fcitx-use-dbus t)))
    ;; Mac's fcitx causes hangup
    ;; (setq fcitx-active-evil-states '(insert emacs hybrid)
    ;; (fcitx-aggressive-setup)
