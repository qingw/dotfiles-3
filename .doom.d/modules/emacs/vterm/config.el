;;; emacs/vterm/config.el -*- lexical-binding: t; -*-

(add-to-list 'load-path (concat doom-packages-dir "/quelpa/build/vterm"))

(def-package! vterm
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
  :config
  (set-env! "SHELL")
  (setq-default
   vterm-max-scrollback 10000)
  (unless (featurep! :emacs term)
    (map!
     :leader
     :prefix ("o" . "open")
     :desc "Terminal"          "t" #'+vterm/open
     :desc "Terminal in popup" "T" #'+vterm/open-popup-in-project)))
