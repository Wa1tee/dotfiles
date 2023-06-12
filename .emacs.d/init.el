;;; Your configuration goes below this line.
;;; use-package is already loaded and ready to go!
;;; use-package docs: https://github.com/jwiegley/use-package

;; Define and initialise package repositories
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             (cons "nongnu" (format "http%s://elpa.nongnu.org/nongnu/"
                                    (if (gnutls-available-p) "s" ""))))
(package-initialize)

;; Use-package to simplify the config file
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure 't)


;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable Evil
(require 'evil)
(evil-mode 1)

;; Visual bell
(setq visible-bell t)

;; Indentation guides
(unless (package-installed-p 'highlight-indent-guides)
  (package-install 'highlight-indent-guides))
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-indent-guides-method 'character)
 '(package-selected-packages '(evil use-package undo-tree)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
(use-package monokai-pro-theme
  :ensure t
  :config
  (load-theme 'monokai-pro t))

;; Line numbering
(global-display-line-numbers-mode)
(global-hl-line-mode 1)

;; (push '(direx:direx-mode :position left :width 25 :dedicated t)
;;       popwin:special-display-config)
;; (global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window)

(right-click-context-mode 1)
