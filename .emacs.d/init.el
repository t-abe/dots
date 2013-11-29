(add-to-list 'load-path "~/.emacs.d/site-lisp/")
(add-to-list 'load-path "~/.emacs.d/elpa/")
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/")
(add-to-list 'load-path "~/.emacs.d/settings")

(if window-system (load "display-setting"))
(if window-system (load "import-env"))
(load "default-setting")
(load "flymake-setting")
(load "auto-complete-setting")
(load "langs-setting")
(load "helm-setting")
(load "keybind-setting")

;; elpha
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; encoding
(set-default-coding-systems 'utf-8)
