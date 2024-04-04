use core::panic;
use num_bigint::BigUint;
use num_traits::{One, Zero};
use std::collections::VecDeque;

pub fn get_hexonacci_num(n: usize) -> BigUint {
    let mut deq: VecDeque<BigUint> = VecDeque::from([Zero::zero(), One::one()]);

    for _ in 1..n {
        let front = match deq.front() {
            Some(num) => num,
            None => {
                panic!("The front of the deque should never be empty")
            }
        };

        let back = match deq.back() {
            Some(num) => num,
            None => {
                panic!("The back of the deque should never be empty")
            }
        };

        let new_sum = back + back - front;
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

#[cfg(test)]
mod tests {
    use crate::hex::get_hexonacci_num;

    #[test]
    fn it_gets_the_0th_hex_num() {
        assert_eq!(get_hexonacci_num(0), 1_usize.into());
    }

    #[test]
    fn it_gets_the_1st_hex_num() {
        assert_eq!(get_hexonacci_num(1), 1_usize.into());
    }

    #[test]
    fn it_gets_the_2nd_hex_num() {
        assert_eq!(get_hexonacci_num(2), 2_usize.into());
    }

    #[test]
    fn it_gets_the_3rd_hex_num() {
        assert_eq!(get_hexonacci_num(3), 4_usize.into());
    }

    #[test]
    fn it_gets_the_4th_hex_num() {
        assert_eq!(get_hexonacci_num(4), 8_usize.into());
    }

    #[test]
    fn it_gets_the_5th_hex_num() {
        assert_eq!(get_hexonacci_num(5), 16_usize.into());
    }

    #[test]
    fn it_gets_the_6th_hex_num() {
        assert_eq!(get_hexonacci_num(6), 32_usize.into());
    }

    #[test]
    fn it_gets_the_7th_hex_num() {
        assert_eq!(get_hexonacci_num(7), 63_usize.into());
    }

    #[test]
    fn it_gets_the_8th_hex_num() {
        assert_eq!(get_hexonacci_num(8), 124_usize.into());
    }

    #[test]
    fn it_gets_the_10th_hex_num() {
        assert_eq!(get_hexonacci_num(10), 480_usize.into());
    }

    #[test]
    fn it_gets_the_100th_hex_num() {
        assert_eq!(
            get_hexonacci_num(100),
            "126758369693771928078845296200"
                .parse()
                .expect("Failed to parse the input")
        )
    }

    #[test]
    fn it_gets_the_1000th_hex_num() {
        assert_eq!(
            get_hexonacci_num(1000),
            concat!(
                "20789663644764535034637253405400601613556270803020454793400",
                "80624652850606462712603967075427780542262867319185609725620",
                "48999809850259046052679931677486878705357155341831009025427",
                "58683686913165977306067175479990006442371414466256188363986",
                "4646180164701990902831409124386962202040527852464240124704"
            )
            .parse()
            .expect("Failed to parse the input")
        )
    }
}
