use std::env;
use std::path::Path;

// This is a hack. This only affects non-nix builds.
fn main() {
    let ldflag = &env::var("NIX_LDFLAGS");

    match ldflag {
        Ok(_) => (),
        Err(_) => {
            let outvar = &env::var("out").unwrap();
            let outdir = Path::new(outvar);
            let libdir = outdir.join("lib");
            println!("cargo:rustc-link-lib=static=minima");
            println!("cargo:rustc-link-search=native={}", libdir.to_str().unwrap());
        }
    }
}
