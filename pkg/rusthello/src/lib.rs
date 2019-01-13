#![crate_type = "lib"]
#![crate_name = "rusthello"]

////////////////////////////////////////////////////////////////////////////////
// Imports /////////////////////////////////////////////////////////////////////

extern crate regex;

use regex::Regex;

#[link(name = "minima")]
extern {
    fn min(x: u32, y: u32) -> u32;
}

////////////////////////////////////////////////////////////////////////////////
// Exports /////////////////////////////////////////////////////////////////////

#[no_mangle]
pub fn rust_u32_zero() -> u32 {
    return 0;
}

#[no_mangle]
pub fn hello_from_rust() {
    println!("Hello from Rust!");
}

#[no_mangle]
pub fn rust_dependency_example() {
    let re = Regex::new(r"^\d{4}-\d{2}-\d{2}$").unwrap();
    println!("Did our date match our regex? {}", re.is_match("2014-01-01"));
}

#[no_mangle]
pub fn c99_dependency_example() {
    let x : u32 = 1;
    let y : u32 = 2;
    let z : u32 = unsafe { min(x,y) };
    println!("{} is the smallest out of {} and {}", z, x, y);
}

////////////////////////////////////////////////////////////////////////////////
// Tests ///////////////////////////////////////////////////////////////////////

#[cfg(test)]
mod tests {
    use hello_from_rust;
    use rust_dependency_example;
    use c99_dependency_example;

    #[test]
    fn it_works() {
        hello_from_rust();
        rust_dependency_example();
        c99_dependency_example();
    }
}
