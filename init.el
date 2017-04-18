;; use cask to manage my package


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; configure path
(setq latexpath (expand-file-name "/Library/TeX/texbin/"))
(setenv "PATH" (concat latexpath ":" (getenv "PATH")))
(add-to-list 'exec-path latexpath)



(require 'cl)
(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)


(add-to-list 'load-path "~/.emacs.d/lisp/")

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)


(require 'init-editing)
(require 'init-ui)
(require 'init-helm)
(require 'init-spelling_grammar)
(require 'init-auctex)
