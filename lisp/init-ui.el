;; UI configurations
(tool-bar-mode -1)
(scroll-bar-mode -1)
(electric-indent-mode t)
(global-linum-mode t)

(global-hl-line-mode t)
(global-auto-revert-mode t)


(add-to-list 'default-frame-alist
             '(font . "Source Code Pro-14"))

(setq inhibit-splash-screen t)
(setq-default cursor-type 'bar)


(require 'powerline)
(powerline-vim-theme)



(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\(") (funcall fn))
        (t (save-excursion
             (ignore-errors (backward-up-list))
             (funcall fn)))))

(defun wanghui/fonts-setup-program ()
  (set-face-attribute
   'default nil
   :font (font-spec :name "-*-Source Code Pro-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1"
		    :weight 'normal
		    :slant 'normal
		    :size 14.0))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font
     (frame-parameter nil 'font)
     charset
     (font-spec :name "-*-STFangsong-normal-normal-normal-*-*-*-*-*-p-0-iso10646-1"
		:weight 'normal
		:slant 'normal
		:size 16.5)))
  (let ((current-theme (first custom-enabled-themes)))
    (disable-theme current-theme)
    (load-theme 'monokai t)))

(defun wanghui/fonts-setup-text()
  (set-face-attribute
   'default nil
   :font (font-spec :name "-*-Courier-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1"
		    :weight 'normal
		    :slant 'normal
		    :size 14.0))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font
     (frame-parameter nil 'font)
     charset
     (font-spec :name "-*-KaiTi_GB2312-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1"
		:weight 'normal
		:slant 'normal
		:size 16.5)))
  (let ((current-theme (first custom-enabled-themes)))
    (disable-theme current-theme)
    (load-theme 'leuven t)))

(setq wanghui/text-mode '(org-mode latex-mode))
(setq wanghui/prog-mode '(c-mode c++-mode python-mode emacs-lisp-mode))

(defun wanghui/check-current-major-mode-and-set-fonts (&optional buffer-or-name)
  (setq wanghui/major-mode (buffer-local-value 'major-mode
					      (if buffer-or-name (get-buffer buffer-or-name) (current-buffer))))
  (when (memq wanghui/major-mode wanghui/text-mode)
    (wanghui/fonts-setup-text))
  (when (memq wanghui/major-mode wanghui/prog-mode)
    (wanghui/fonts-setup-program)))

(defcustom after-buffer-change-hook nil
  "Hooks that are run after helm-mini"
  :type 'hook)

(define-advice helm-mini (:around(fn) helm-mini-after)
  (funcall fn)
  (run-hooks 'after-buffer-change-hook)
  )


(add-hook 'text-mode-hook 'wanghui/fonts-setup-text)
(add-hook 'prog-mode-hook 'wanghui/fonts-setup-program)
(add-hook 'after-buffer-change-hook 'wanghui/check-current-major-mode-and-set-fonts)


(toggle-frame-maximized)
(provide 'init-ui)
