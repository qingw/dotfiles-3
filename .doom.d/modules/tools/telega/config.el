;;; tools/telega/config.el -*- lexical-binding: t; -*-


(def-package! telega
  :commands (telega)
  :defer t
  :config)
  ;; (setq telega-debug t))
  ;; (setq telega-use-notifications t)
  ;; (add-hook telega-chat-mode-hook
  ;;           (lambda ()
  ;;             (setq company-backends '(telega-company-emoji))
  ;;             (company-mode 1))))
