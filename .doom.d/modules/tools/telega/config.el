;;; tools/telega/config.el -*- lexical-binding: t; -*-


(def-package! telega
  :commands (telega)
  :defer t
  :config
  (add-hook 'telega-root-mode-hook (lambda () (telega-notifications-mode t))))
