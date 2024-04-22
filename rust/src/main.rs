mod hex;

fn main() {
    let args: Vec<String> = std::env::args().collect();

    if args.len() != 2 {
        println!("You must pass a non-negative integer as the only parameter");
        std::process::exit(1);
    }

    let n = &args[1];

    let n = match n.parse() {
        Ok(num) => num,
        Err(_) => {
            println!("You must pass a non-negative integer as the only parameter");
            std::process::exit(1);
        }
    };

    if n < 0 {
        println!("You must pass a non-negative integer as the only parameter");
        std::process::exit(1);
    }

    let result = hex::get_hexonacci_num(n);

    println!("{}", result);
}
