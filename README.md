# company-protobuf

Add Protobuf directives keywords to company-mode keywords alist.

# General Emacs Config

``` emacs-lisp
(use-package protobuf-mode
  :ensure t
  :mode "\\.proto\\'")

(use-package company-protobuf
  :ensure t
  :if (featurep 'company)
  :after (protobuf-mode company)
  :config (add-hook 'protobuf-mode-hook (lambda () (add-to-list 'company-backends #'company-protobuf))))
```

# Doom Emacs Config

``` emacs-lisp
(use-package! protobuf-mode
  :mode "\\.proto\\'"
  :defer t)

(use-package! company-protobuf
  :when (modulep! :completion company)
  :after protobuf-mode
  :config (set-company-backend! 'protobuf-mode 'company-protobuf))
```
