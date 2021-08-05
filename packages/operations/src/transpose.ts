import { Pitch } from "@vivace/theory";

type Transposable = Pitch;

export default function transpose(
  transposable: Transposable,
  steps: number
): Transposable {
  return new Pitch(transposable.value);
}
