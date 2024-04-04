use std::collections::VecDeque;

use num_bigint::BigUint;
use num_traits::{One, Zero};

fn main() {
    let args: Vec<String> = std::env::args().collect();

    if args.len() < 2 {
        eprintln!("You must pass an integer as the first parameter");
        std::process::exit(1);
    }

    let n = &args[1];

    let n: usize = match n.parse() {
        Ok(num) => num,
        Err(_) => {
            eprintln!("You must pass an integer as the first parameter");
            std::process::exit(1);
        }
    };

    let result = get_hexonacci_num(n);

    println!("{}", result);
}

fn get_hexonacci_num(n: usize) -> BigUint {
    let mut deq: VecDeque<BigUint> = VecDeque::from([One::one()]);

    for _ in 1..n {
        let new_sum = deq.iter().sum();
        deq.push_back(new_sum);

        while deq.len() > 6 {
            deq.pop_front();
        }
    }

    match deq.pop_back() {
        Some(num) => num,
        None => {
            println!("Error calculating the result");

            BigUint::zero()
        }
    }
}
