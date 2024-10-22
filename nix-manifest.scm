(use-modules (gnu) (guix utils))

(define nix-package
  (package
    (name "nix")
    (version "2.13.3") ; Replace with the desired version
    (source (origin
              (method url-fetch)
              (uri (string-append "https://nixos.org/releases/nix/nix-" version "/nix-" version "-x86_64-linux.tar.gz"))
              (sha256
               (base32 "0v9ayxk2c5kmb9y5q0qplm2b8f7k8pbzq5h4d4fh0q7pxq2i5r5b"))))))

(operating-system
  ;; Other configurations...
  (services
   (list
    ;; Any other services...
    (service nxd-service-type
             (nxd-configuration
               (nix-store "/var/guix/profiles/per-user/root/guix-profile")
               (nix-config "/etc/nix/nix.conf"))))))

(let ((nix-shell "path/to/your/shell.nix")) ; Update with the correct path
  (specifications
   (list nix-package)))
