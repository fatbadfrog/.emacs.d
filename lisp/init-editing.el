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


;; invoke visual-line-mode
(dolist (hook '(text-mode-hook))
  (add-hook hook
	    '(lambda ()
	       (visual-line-mode 1))))


(global-set-key (kbd "M-/") 'hippie-expand)

(setq hippie-expand-try-functions-list
      '(try-complete-file-name-partially
        try-complete-file-name
        try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill))

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

(global-set-key (kbd "C-=") 'er/expand-region)

(setq make-backup-files nil)
(setq auto-save-default nil)

(provide 'init-editing)
