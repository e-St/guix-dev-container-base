(use-modules (gnu) (guix packages))

;; Define variables at the top for easy management
(define shell-file "./shell.nix") ; Path to the shell.nix file

;; Specify the Nix package
(define nix-package (specification->package "nix"))

;; Define the manifest for the container
(specifications
 (list nix-package))

;; Note: The command will be executed in the context of the container
(define container-command
  (string-append "bash -c \"nix-shell " shell-file "\""))

;; Use this command when running the container
