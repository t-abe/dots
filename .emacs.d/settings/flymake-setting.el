;; flymake.el
(require 'flymake)

;; 文法チェックの頻度の設定
(setq flymake-no-changes-timeout nil)
;; 改行時に文法チェックを行うかどうかの設定
(setq flymake-start-syntax-check-on-newline nil)

;; gui error disabled
(setq flymake-gui-warnings-enabled nil)

; flymake-cc
(setenv "LANG" "C")
(defun flymake-cc-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
         (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "g++" (list "-std=c++0x" "-Wall" "-Wextra" "-fsyntax-only" local-file))))
(setq flymake-err-line-patterns
 (cons
  '("\\(.+\\):\\([0-9]+\\):\\([0-9]+\\): \\(.+\\)" 1 2 3 4)
  flymake-err-line-patterns))
(push '("\\.cc$" flymake-cc-init) flymake-allowed-file-name-masks)
(push '("\\.cpp$" flymake-cc-init) flymake-allowed-file-name-masks)
(push '("\\.h$" flymake-cc-init) flymake-allowed-file-name-masks)
(push '("\\.hpp$" flymake-cc-init) flymake-allowed-file-name-masks)

; flymake-python
(defun flymake-python-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
         (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "pyflakes" (list local-file))))
(setq flymake-err-line-patterns
 (cons
  '("\\(.+\\):\\([0-9]+\\):\\([0-9]+\\): \\(.+\\)" 1 2 3 4)
  flymake-err-line-patterns))
(push '("\\.py$" flymake-python-init) flymake-allowed-file-name-masks)

(set-face-background 'flymake-errline "DarkRed")
(set-face-background 'flymake-warnline "DarkBlue")

;; flymake 現在行のエラーをpopup.elのツールチップで表示する
(require 'popup)
(defun flymake-display-err-menu-for-current-line ()
  (interactive)
  (let* ((line-no             (flymake-current-line-no))
         (line-err-info-list  (nth 0 (flymake-find-err-info flymake-err-info line-no))))
    (when line-err-info-list
      (let* ((count           (length line-err-info-list))
             (menu-item-text  nil))
        (while (> count 0)
          (setq menu-item-text (flymake-ler-text (nth (1- count) line-err-info-list)))
          (let* ((file       (flymake-ler-file (nth (1- count) line-err-info-list)))
                 (line       (flymake-ler-line (nth (1- count) line-err-info-list))))
            (if file
                (setq menu-item-text (concat menu-item-text " - " file "(" (format "%d" line) ")"))))
          (setq count (1- count))
          (if (> count 0) (setq menu-item-text (concat menu-item-text "\n")))
          )
        (popup-tip menu-item-text)))))
