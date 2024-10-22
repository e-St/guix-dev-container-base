(use-modules (gnu) (guix utils) (guix packages))

;; Define variables at the top for easy management
(define shell-file "./shell.nix") ; Path to the shell.nix file

;; Specify the Nix package
(define nix-package (specification->package "nix"))

;; Define the manifest
(specifications
 (list nix-package))

;; Custom command to run nix-shell automatically
(define container-command
  (string-append "bash -c \"nix-shell " shell-file "\""))

;; Use the container command
(operating-system
  (name "my-container")
  (services %base-services)
  (command container-command))
