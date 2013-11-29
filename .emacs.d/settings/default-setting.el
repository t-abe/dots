;; utf-8
(prefer-coding-system 'utf-8)

;; ack
(defun ack ()
  (interactive)
  (let ((grep-find-command "ack --nocolor --nogroup "))
    (call-interactively 'grep-find)))

;; git-grep
(defun git-grep ()
  (interactive)
  (let ((grep-find-command "git grep -n "))
    (call-interactively 'grep-find)))

;; magit
(require 'magit)

;; mozc
(if (string-match "linux" system-configuration)
    (progn
      (require 'mozc)
      (setq quail-japanese-use-double-n t)
      (set-language-environment "Japanese")
      (setq default-input-method "japanese-mozc")
      (global-set-key [zenkaku-hankaku] 'toggle-input-method)

      (defadvice mozc-handle-event (around intercept-keys (event))
        (if (member event (list 'zenkaku-hankaku))
            (progn
              (mozc-clean-up-session)
              (toggle-input-method))
          (progn ;(message "%s" event) ;debug
            ad-do-it)))
      (ad-activate 'mozc-handle-event)
  ))

;; *small configurations
;; tab width 2 and replace to space
(setq-default tab-width 2 indent-tabs-mode nil)

;; colorize a marked region
(setq transient-mark-mode t)

;; show matched paren
(require 'paren)
(show-paren-mode)

;; incremental buffer
(iswitchb-mode 1)

;; incremental M-x
(icomplete-mode 1)

;; 折り返す
(setq truncate-partial-width-windows nil)

;; no tool-bar etc.
(custom-set-variables
 '(tool-bar-mode nil)
 '(scroll-bar-mode nil)
 '(menu-bar-mode nil)
 )
(custom-set-faces)

(defface hlline-face
  '((((class color)
      (background dark))
     (:background "black"))
    (((class color)
      (background light))
     (:background "white" :))
    (t
     ()))
  "Used face hl-line.")
(setq hl-line-face 'hlline-face)
(global-hl-line-mode)

;; theme
(load-theme 'misterioso t)

;; disable beep
(setq ring-bell-function 'ignore)

(setq inhibit-startup-message t)
