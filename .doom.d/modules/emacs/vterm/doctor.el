;;; emacs/vterm/doctor.el -*- lexical-binding: t; -*-

(unless (executable-find "vterm-ctrl")
  (warn! "Couldn't find libvterm library. Please install it on your system"))

(unless
    (file-executable-p
     (concat doom-packages-dir "/quelpa/build/vterm/vterm-module.so"))
  (warn! "Couldn't find vterm-module.so, you have to compile vterm-module"))
