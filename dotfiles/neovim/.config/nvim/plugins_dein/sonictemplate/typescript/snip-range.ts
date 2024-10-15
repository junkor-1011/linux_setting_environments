export const range = (n: number): readonly number[] =>
  [...Array(n).keys()] as const;
