;;; emacs/vterm/autoload.el -*- lexical-binding: t; -*-

;;;###autoload
(defun +vterm/open (arg)
  "Open a terminal buffer in the current window. If ARG (universal argument) is
non-nil, cd into the current project's root."
  (interactive "P")
  (let ((default-directory
          (if arg
              (or (doom-project-root) default-directory)
            default-directory)))
    (switch-to-buffer (save-window-excursion (vterm)))))

;;;###autoload
(defun +vterm/open-popup (arg)
  "Open a terminal popup window. If ARG (universal argument) is
non-nil, cd into the current project's root."
  (interactive "P")
  (let ((default-directory
          (if arg
              (or (doom-project-root) default-directory)
            default-directory)))
    (pop-to-buffer (save-window-excursion (vterm)))))

;;;###autoload
(defun +vterm/open-popup-in-project ()
  "Open a terminal popup window in the root of the current project."
  (interactive)
  (+vterm/open-popup t))

;;;###autoload
(defun +vterm/vterm-module-compile ()
  "Compile vterm-module.so"
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
          (error "Compilation of emacs-libvterm module failed!"))))))
