(setq cabbage-mac-use-shell-path t)
(setq cabbage-ruby-version-manager 'rbenv)


;; El Capitan workaround
(setq visible-bell nil) ;; The default
(setq ring-bell-function 'ignore)


(add-to-list 'cabbage-bundle-dirs (expand-file-name "~/.emacs.d/bundles/"))
(add-to-list 'cabbage-vendor-dirs (expand-file-name "~/.emacs.d/vendor/"))

(add-to-list 'cabbage-bundle-dirs (expand-file-name "~/projects/cabbage-contrib/bundles/"))
(add-to-list 'cabbage-vendor-dirs (expand-file-name "~/projects/cabbage-contrib/vendor/"))

(setq cabbage-bundles '(
                        accessibility
                        completion
                        css
                        diff
                        ergonomic
                        git
                        html
                        javascript
                        latex
                        lisp
                        markdown
                        org
                        plone
                        power-edit
                        project
                        python
                        ruby
                        rails
                        irc
                        rect-mark
                        robot-mode

                        theme-roller

                        cabbage-developer
                        snippets
                        ))


(global-set-key (kbd "<f6>") 'theme-roller-cycle)
(setq theme-roller-active-themes '(color-theme-railscasts color-theme-lazy color-theme-monokai))
(setq cabbage-theme 'color-theme-lazy)

(setq jabber-account-list
      '(("tschouns@gmail.com"
         (:network-server . "talk.google.com")
         (:connection-type . ssl)))
      jabber-show-offline-contacts nil
      jabber-roster-show-bindings nil)

(add-to-list 'completion-ignored-extensions ".egg-info")

(defun jone-after-loading-cabbage ()
  (setq *textmate-gf-exclude*
        (replace-regexp-in-string "\|\\\\\.app\|" "|" *textmate-gf-exclude*))

  (cabbage-global-set-key (kbd "C-c f S") 'jone--plone-add-security-statement)
  (cabbage-global-set-key (kbd "C-M-o") 'forward-sexp)
  (cabbage-global-set-key (kbd "C-M-u") 'backward-sexp))

(add-hook 'cabbage-initialized-hook 'jone-after-loading-cabbage)


(defun jone--plone-add-security-statement ()
  (interactive)

  (search-forward " def ")
  (when (yes-or-no-p "Add security declaration?")
    (let ((methodname (current-word)))
      (backward-paragraph)
      (newline)
      (insert (concat "    security.declarePrivate('" methodname "')"))
      (search-forward " def ")))

  ;; continue
  (jone--plone-add-security-statement))



;; GPG support
(defun jone-configure-gpg ()
  (let ((path-from-shell
         (replace-regexp-in-string
          "[[:space:]\n]*$" ""
          (shell-command-to-string (concat shell-file-name " -l -c 'echo $GPG_AGENT_INFO'")))))
    (setenv "GPG_AGENT_INFO" path-from-shell)))
(add-hook 'cabbage-initialized-hook 'jone-configure-gpg)
