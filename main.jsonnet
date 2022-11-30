local switch = true;
local value = if switch then "z" else "x";

local someConfig = {
    val: 2,
};

{
    someKey: value,
    arit: 1 + 1,
    ref: self.arit + 2,
    ref2: someConfig.val,
    arr: [1, 2] + [3, 4],
    sub: {
        a: 1,
        b: 2,
    },
    hidden:: 1,
}
