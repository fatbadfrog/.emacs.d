;; configuration of magit
(require 'magit)

;; path exec-path-from-shell for mac
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


;; disable auto backup
(setq make-backup-files nil)
(setq auto-save-defaul t)

;; smart-pararens
(require 'smartparens-config)
(smartparens-global-mode t)
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; invoke visual-line-mode
(dolist (hook '(text-mode-hook))
  (add-hook hook
	    '(lambda ()
	       (visual-line-mode 1))))

(global-set-key (kbd "M-/") 'hippie-expand)

(setq
 hippie-expand-try-functions-list
 '(try-expand-dabbrev ;; Try to expand word "dynamically", searching the current buffer.
   try-expand-dabbrev-all-buffers ;; Try to expand word "dynamically", searching all other buffers.
   try-expand-dabbrev-from-kill ;; Try to expand word "dynamically", searching the kill ring.
   try-complete-file-name-partially ;; Try to complete text as a file name, as many characters as unique.
   try-complete-file-name ;; Try to complete text as a file name.
   try-expand-all-abbrevs ;; Try to expand word before point according to all abbrev tables.
   try-expand-list ;; Try to complete the current line to an entire line in the buffer.
   try-expand-line ;; Try to complete the current line to an entire line in the buffer.
   try-complete-lisp-symbol-partially ;; Try to complete as an Emacs Lisp symbol, as many characters as unique.
   try-complete-lisp-symbol) ;; Try to complete word as an Emacs Lisp symbol.
 )


(require 'popwin)
(popwin-mode t)


(defun wanghui/kill-line ()
  (interactive)
  (progn
    (move-beginning-of-line 1)
    (kill-line)))

(global-set-key (kbd "C-k") 'wanghui/kill-line)
(defun wanghui/beginning-of-line-or-indentation ()
  "move to beginning of line, or indentation"
  (interactive)
  (if (bolp)
      (back-to-indentation)
    (beginning-of-line)))

(global-set-key (kbd "C-a") 'wanghui/beginning-of-line-or-indentation)
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(setq make-backup-files nil)
(setq auto-save-default nil)

(provide 'init-editing)
