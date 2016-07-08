;; Package management
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)

;; Rust mode and cargo minor mode
(package-install 'rust-mode)
(setq rust-format-on-save t)

;; Racer for Rust autocompletion
(package-install 'racer)
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)

;; Company (complete-anything) mode with Racer backend
(package-install 'company)
(add-hook 'racer-mode-hook #'company-mode)

(global-set-key (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)

;; Flycheck for instant visual feedback
(package-install 'flycheck)
(package-install 'flycheck-rust)
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
(global-flycheck-mode)

;; Cargo minor mode
(package-install 'cargo)
(global-set-key (kbd "C-c C-t") #'cargo-process-test)

;; Install magic
(package-install 'magit)

;; Load a sane color theme
(load-theme 'wombat)
