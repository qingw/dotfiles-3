;;; emacs/vterm/doctor.el -*- lexical-binding: t; -*-

(unless (executable-find "vterm-ctrl")
  (warn! "Couldn't find libvterm library. Please install it on your system"))
