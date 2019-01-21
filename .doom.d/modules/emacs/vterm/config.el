;;; emacs/vterm/config.el -*- lexical-binding: t; -*-

(def-package! vterm
  :load-path (lambda () (list (concat doom-packages-dir "/quelpa/build/vterm")))
  :init
  (unless
      (file-executable-p
       (concat
        (file-name-directory (locate-library "vterm"))
        "vterm-module.so"))
    (let ((default-directory (file-name-directory (locate-library "vterm"))))
      (let* ((buffer (get-buffer-create "Install Vterm"))
             (status
              (call-process
               "sh" nil buffer t "-c"
               (concat
                "mkdir -p build;"
                "cd build;"
                "cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo ..;"
                "make"))))
        (if (eq status 0)
            (message "Compilation of emacs-libvterm module succeeded")
          (pop-to-buffer "Install Vterm")
          (error "Compilation of emacs-libvterm module failed!")))))
  :when (string-match-p "MODULES" system-configuration-features)
  :config
  (set-env! "SHELL")
  (add-hook 'vterm-mode-hook #'doom|mark-buffer-as-real)
  ;; Automatically kill buffer when vterm exits.
  (setq-default vterm-exit-functions #'kill-buffer)
  (when (featurep! :feature evil)
    (evil-set-initial-state 'vterm-mode 'insert)
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
