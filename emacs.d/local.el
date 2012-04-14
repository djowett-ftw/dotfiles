(setq e-max-mac-use-shell-path t)

(setq e-max-bundles '(
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
                      maximize
                      org
                      plone
                      power-edit
                      project
                      python
                      ruby
                      terminal
                      irc

                      e-max-developer
                      snippets
                      ))


(global-set-key (kbd "<f6>") 'theme-roller-cycle)
(setq theme-roller-active-themes '(color-theme-railscasts color-theme-lazy color-theme-monokai))
(setq e-max-theme 'color-theme-lazy)
