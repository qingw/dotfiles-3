;;; steamedfish/ansible/config.el -*- lexical-binding: t; -*-

(use-package! ansible
  :init
  (add-hook! 'yaml-mode-hook #'+ansible/ansible-enable-maybe))
