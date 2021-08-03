import { Pitch } from "@vivace/theory";
import { transpose } from "../src";

describe("transpose", () => {
  it("with 0 step returns the original Pitch", () => {
    const pitch = new Pitch(0);

    const result = transpose(pitch, 0);

    expect(result).toBe(pitch);
  });

  it("with -n steps returns a new Pitch lowered by n steps", () => {
    const pitch = new Pitch(0);

    const result = transpose(pitch, -1);

    expect(result.value).toStrictEqual(11);
  });

  it("with +n steps returns a new Pitch raised by n steps", () => {
    const pitch = new Pitch(0);

    const result = transpose(pitch, 1);

    expect(result.value).toStrictEqual(1);
  });

  it.todo("wraps around the end of the octave");
});
