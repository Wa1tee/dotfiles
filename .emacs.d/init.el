;;; Your configuration goes below this line.
;;; use-package is already loaded and ready to go!
;;; use-package docs: https://github.com/jwiegley/use-package

;; Define and initialise package repositories
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(add-to-list 'package-archives
             (cons "nongnu" (format "http%s://elpa.nongnu.org/nongnu/"
                                    (if (gnutls-available-p) "s" ""))))
(package-initialize)

;; Use-package to simplify the config file
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

(unless package-archive-contents
  (package-refresh-contents))

;; Maximize screen on startup
(add-hook 'window-setup-hook 'toggle-frame-maximized t)
;; Disable startup menu
(menu-bar-mode -1)
;; Disable tool bar
(tool-bar-mode -1)
;; Disable scroll bar
(scroll-bar-mode -1)

(setq-default indent-tabs-mode nil)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Package installations here ;;
;; -------------------------- ;;

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Download Ivy
(unless (package-installed-p 'ivy)
  (package-install 'ivy))

(unless (package-installed-p 'monokai-pro-theme)
  (package-install 'monokai-pro-theme))
;; Indentation guides
(unless (package-installed-p 'highlight-indent-guides)
  (package-install 'highlight-indent-guides))

;; Enable Evil
(require 'evil)
(evil-mode 1)

;; Visual bell
(setq visible-bell t)

(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-indent-guides-method 'character)
 '(package-selected-packages '(corfu magit projectile evil use-package undo-tree))
 '(warning-suppress-types '((use-package))))

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
(global-display-line-numbers-mode t)
(global-hl-line-mode 1)

(column-number-mode)

;; Disable line numbering for some modes
(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda() (display-line-numbers-mode 0))))

;; (push '(direx:direx-mode :position left :width 25 :dedicated t)
;;       popwin:special-display-config)
;; (global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window)

(right-click-context-mode 1)

(electric-pair-mode 1)

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (when (file-directory-p "~/Projects/Code")
    (setq projectile-project-search-path '("~/Projects/Code")))
  (setq projectile-switch-project-action #'projectile-dired))

(use-package magit)

;; If icons look bad, run M-x nerd-icons-install-fonts
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 15))

(add-hook 'prog-mode-hook 'highlight-numbers-mode)
(show-paren-mode 1)

(use-package highlight-parentheses
  :ensure t)

(require 'highlight-parentheses)
(add-hook 'prog-mode-hook #'highlight-parentheses-mode)
(add-hook 'prog-mode-hook 'highlight-operators-mode)
;;(set-face-foreground "#ff6188" 'highlight-operators-face )

(use-package command-log-mode)

(use-package ivy
:diminish
:bind (("C-s" . swiper)
       :map ivy-minibuffer-map
       ("TAB" . ivy-alt-done)
       ("C-l" . ivy-alt-done)
       ("C-j" . ivy-next-line)
       ("C-k" . ivy-previous-line)
       :map ivy-switch-buffer-map
       ("C-k" . ivy-previous-line)
       ("C-l" . ivy-done)
       ("C-d" . ivy-switch-buffer-kill)
       :map ivy-reverse-i-search-map
       ("C-k" . ivy-previous-line)
       ("C-d" . ivy-reverse-i-search-kill))
:config
(ivy-mode 1))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

(use-package corfu
  ;; Optional customizations
  ;; :custom
  ;; (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  ;; (corfu-auto t)                 ;; Enable auto completion
  ;; (corfu-separator ?\s)          ;; Orderless field separator
  ;; (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
  ;; (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  ;; (corfu-preselect 'prompt)      ;; Preselect the prompt
  ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches
  ;; (corfu-scroll-margin 5)        ;; Use scroll margin

  ;; Enable Corfu only for certain modes.
  ;; :hook ((prog-mode . corfu-mode)
  ;;        (shell-mode . corfu-mode)
  ;;        (eshell-mode . corfu-mode))

  ;; Recommended: Enable Corfu globally.  This is recommended since Dabbrev can
  ;; be used globally (M-/).  See also the customization variable
  ;; `global-corfu-modes' to exclude certain modes.
  :init
  (global-corfu-mode))

;; A few more useful configurations...
(use-package emacs
  :init
  ;; TAB cycle if there are only few candidates
  (setq completion-cycle-threshold 3)

  ;; Emacs 28: Hide commands in M-x which do not apply to the current mode.
  ;; Corfu commands are hidden, since they are not supposed to be used via M-x.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (setq tab-always-indent 'complete))
