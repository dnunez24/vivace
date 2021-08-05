import { Pitch } from "@vivace/theory";

type Transposable = Pitch;

export default function transpose(
  transposable: Transposable,
  steps: number
): Transposable {
  if (steps === 0) return transposable;
  return new Pitch((12 + (transposable.value + steps)) % 12);
}
