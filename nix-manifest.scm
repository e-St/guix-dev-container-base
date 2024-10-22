(use-modules (gnu) (guix utils))

(operating-system
  ;; Other configurations...
  (services
   (list
    ;; Any other services...
    (service nxd-service-type
             (nxd-configuration
               (nix-store "/var/guix/profiles/per-user/root/guix-profile")
               (nix-config "/etc/nix/nix.conf"))))))

(let ((nix-shell "path/to/your/shell.nix")) ; Update with the path to your shell.nix
  (specifications
   (list
    (package
      (name "nix-shell-with-packages")
      (version "1.0")
      (arguments
       (list
        #:native-inputs
        (list (package
                (name "nix")
                (version "2.13.3") ; Replace with the desired version
                (source (origin
                          (method url-fetch)
                          (uri (string-append "https://nixos.org/releases/nix/nix-" version "/nix-" version "-x86_64-linux.tar.gz"))
                          (sha256
                           (base32 "0v9ayxk2c5kmb9y5q0qplm2b8f7k8pbzq5h4d4fh0q7pxq2i5r5b"))))))
        ;; You might want to include the Nix shell as an executable or script
        #:outputs '("out")))))))
