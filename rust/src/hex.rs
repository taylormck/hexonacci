use core::panic;
use num_bigint::BigUint;
use num_traits::{One, Zero};
use std::collections::VecDeque;

pub fn get_hexonacci_num(n: usize) -> BigUint {
    let mut deq: VecDeque<BigUint> = VecDeque::from([
        Zero::zero(),
        Zero::zero(),
        Zero::zero(),
        Zero::zero(),
        Zero::zero(),
        One::one(),
        One::one(),
    ]);

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

        // Normally, the hexonacci sequence is defined as:
        // hex(n) = hex(n-1) + hex(n-2) + hex(n-3) + hex(n-4) + hex(n-5) + hex(n-6)
        // However, if you work through the math, you can see that.
        // This saves us a few calculations
        // hex(n) = 2 * (hex(n-1) - hex(n-7)) + hex(n-7)
        let new_sum = front + ((back - front) << 1);

        // let new_sum = deq.iter().sum();
        deq.push_back(new_sum);

        deq.pop_front();
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
        assert_eq!(get_hexonacci_num(8), 125_usize.into());
    }

    #[test]
    fn it_gets_the_9th_hex_num() {
        assert_eq!(get_hexonacci_num(9), 248_usize.into());
    }
}
