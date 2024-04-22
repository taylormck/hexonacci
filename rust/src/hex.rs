/**
* @file Module to implement the hexonacci sequence
*/
use num_bigint::BigInt;
use num_traits::{One, Zero};
use std::collections::VecDeque;

pub fn get_hexonacci_num(n: i32) -> BigInt {
    let mut deq: VecDeque<BigInt> = VecDeque::from([
        Zero::zero(),
        Zero::zero(),
        Zero::zero(),
        Zero::zero(),
        Zero::zero(),
        One::one(),
        One::one(),
    ]);

    for _ in 1..n {
        let front = &deq.pop_front().unwrap();
        let back = deq.back().unwrap();

        // Normally, the hexonacci sequence is defined as:
        // hex(n) = hex(n-1) + hex(n-2) + hex(n-3) + hex(n-4) + hex(n-5) + hex(n-6)
        // However, if you work through the math, you can see that
        // hex(n) = 2 * (hex(n-1) - hex(n-7)) + hex(n-7)
        // This saves us a few calculations
        let new_sum = front + ((back - front) << 1);

        deq.push_back(new_sum);
    }

    deq.pop_back().unwrap()
}

#[cfg(test)]
mod tests {
    use crate::hex::get_hexonacci_num;

    #[test]
    fn it_gets_the_0th_hex_num() {
        assert_eq!(get_hexonacci_num(0), 1.into());
    }

    #[test]
    fn it_gets_the_1st_hex_num() {
        assert_eq!(get_hexonacci_num(1), 1.into());
    }

    #[test]
    fn it_gets_the_2nd_hex_num() {
        assert_eq!(get_hexonacci_num(2), 2.into());
    }

    #[test]
    fn it_gets_the_3rd_hex_num() {
        assert_eq!(get_hexonacci_num(3), 4.into());
    }

    #[test]
    fn it_gets_the_4th_hex_num() {
        assert_eq!(get_hexonacci_num(4), 8.into());
    }

    #[test]
    fn it_gets_the_5th_hex_num() {
        assert_eq!(get_hexonacci_num(5), 16.into());
    }

    #[test]
    fn it_gets_the_6th_hex_num() {
        assert_eq!(get_hexonacci_num(6), 32.into());
    }

    #[test]
    fn it_gets_the_7th_hex_num() {
        assert_eq!(get_hexonacci_num(7), 63.into());
    }

    #[test]
    fn it_gets_the_8th_hex_num() {
        assert_eq!(get_hexonacci_num(8), 125.into());
    }

    #[test]
    fn it_gets_the_9th_hex_num() {
        assert_eq!(get_hexonacci_num(9), 248.into());
    }
}
