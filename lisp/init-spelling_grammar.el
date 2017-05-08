(use-package speck
  :ensure
  :defer
  :commands
  (speck-mode)
  :init
  (setq speck-hunspell-program (executable-find "hunspell"))
  (setq speck-hunspell-coding-system (quote utf-8))
  (setq speck-hunspell-dictionary-alist
	(quote (("en" . "en_US")
                ("ru" . "ru_RU"))))
  (setq speck-hunspell-language-options
	(quote (("en" utf-8 nil nil nil)
		("ru" utf-8 nil nil nil))))
  (setq speck-hunspell-default-dictionary-name "en")
  (add-hook 'text-mode-hook 'speck-mode)
  :config)

(global-set-key (kbd "C-c s p") 'speck-popup-menu-at-point)


(require 'flycheck)
(require 'flycheck-tip)
(add-hook 'prog-mode-hook
	  (lambda()
	     (global-flycheck-mode)
	     (define-key prog-mode-map (kbd "C-c C-n") 'flycheck-tip-cycle)))


(provide 'init-spelling_grammar)
