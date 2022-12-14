use itertools::Itertools;

fn find_unique_chunk(input: &str, size: usize) -> usize {
  size + input.as_bytes()
    .windows(size)
    .position(|window| window.iter().tuple_combinations().all(|(a,b)| a != b))
    .unwrap()
}

#[aoc::main(06)]
fn main(input: &str) -> (usize, usize) {
  (find_unique_chunk(input, 4), find_unique_chunk(input, 14))
}
