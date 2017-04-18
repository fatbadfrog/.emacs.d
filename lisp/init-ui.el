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



(load-theme 'zenburn t)

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
		:size 16.5))))

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
		:size 16.5))))



(add-hook 'text-mode-hook 'wanghui/fonts-setup-text)
(add-hook 'prog-mode-hook 'wanghui/fonts-setup-program)

(toggle-frame-maximized)
(provide 'init-ui)
