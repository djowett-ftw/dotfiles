(setq e-max-repository (expand-file-name "/Users/jone/projects/e-max/"))

(setq e-max-bundles '(
                      accessibility
                      completion
                      css
                      cucumber
                      ergonomic
                      erlang
                      git
                      html
                      javascript
                      lisp
                      power-edit
                      project
                      python
                      ruby
                      terminal
                      markdown
                      haml-and-sass
                      yaml
                      latex

                      e-max-developer
                      org
                      plone
                      ))

;; see https://github.com/senny/theme-roller.el for a list of available themes
(setq e-max-theme 'color-theme-lazy)

(load (concat e-max-repository "e-max"))
