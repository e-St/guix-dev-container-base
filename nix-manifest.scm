(use-modules (gnu) (guix utils) (guix packages))  ; Include (guix packages) for package definitions


;; Define variables at the top for easy management
(define nix-version "2.13.3") ; Nix version
(define nix-sha256 "0v9ayxk2c5kmb9y5q0qplm2b8f7k8pbzq5h4d4fh0q7pxq2i5r5b") ; Nix SHA256
(define shell-file "./shell.nix") ; Path to the shell.nix file

(define nix-package (specification->package "nix")) ; Get the Nix package
               
(operating-system
  ;; Other configurations...
  (services
   (list
    ;; Any other services...
    (service nxd-service-type
             (nxd-configuration
               (nix-store "/var/guix/profiles/per-user/root/guix-profile")
               (nix-config "/etc/nix/nix.conf"))))))

(specifications
 (list nix-package))

;; Custom command to run nix-shell automatically
(operating-system
   (name "my-container")
   (services %base-services)
   (command (string-append "bash -c \"nix-shell " shell-file "\"")))
