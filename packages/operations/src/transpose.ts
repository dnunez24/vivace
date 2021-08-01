import { Pitch, PitchClassSet } from "@vivace/theory";

type Transposable = Pitch | PitchClassSet;

export default function transpose(value: Transposable): Transposable {
  return new Pitch();
}
