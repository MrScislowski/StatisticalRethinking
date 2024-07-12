## Original problem

3/31/2024

I'm at my friend's and he's made a chili with 11 different beans; each ladle has 140 beans; what is the odds of a ladle not containing at least one of all 11 beans?

I suggested calculating the odds of not getting bean A, and then add that probability 10 more times... But my friend says that can't work

So do you mean supposing bean A is the forbidden bean, then you have to pick 140 non-A beans in a row, with probability (10/11)^140 = 1.6e-6. But then that's favoring a particular bean A, so the probability is about 11 times higher?

## Toy problem 1a: 3 types, sample of 5

Suppose we have 3 bean types (A, B, C), and our ladle is smaller - it picks up just 5 beans.

The number of ways of picking up beans with no restrictions is: $3 \times 3 \times 3 \times 3 \times 3 = 243$

I thought that confining yourself to 2 types of beans or less would be $3 \times 2 \times 2 \times 2 \times 2 = 48$. But I see the second number in the product needn't be 2. Because the second bean type isn't chosen yet.

So instead I figured out the number of ways of choosing beans out of just A and B.

| \# A beans | \# B beans | \# ways of doing this |
| ---------- | ---------- | --------------------- |
| 5          | 0          | 1                     |
| 4          | 1          | 5                     |
| 3          | 2          | 10                    |
| 2          | 3          | 10                    |
| 1          | 4          | 5                     |
| 0          | 5          | 1                     |

That yields 32 total ways. I suppose I could've calculated that by just saying $2 \times 2 \times 2 \times 2 \times 2$

But then you can have only A & B, or only A & C, or only B & C.

So that's $32 + 32 + 32 = 96$

But then you've overcounted the ways of getting only A, only B, and only C. So $96 - 3 = 93$

And 93/243 is 38.271%.

Doing the trials with 1e8, I get 38.276%.

## Toy problem 1b: 3 types, sample of 6

$$
P = \frac{\text{num ways of picking from 2 types}}{\text{num ways of picking from 3 types}}
$$

$$
P =   \frac{_3C_2 \times 2^6 - _3C_1 }{3^6}
$$

$$
P = \frac{189}{729}
$$

## Toy problem 1c: 3 types, sample of $n$

$$
P = \frac{_3C_2 \times 2^n - _3C_1}{3^n}
$$

## Toy problem 2a: 4 types, sample of 5

Naively assuming the formula from before works...

$$
P = \frac{_4C_3 \times 3^5 - _3C_2}{4^5}
$$

$$
P = \frac{4 \times 243 - 3}{1024}
$$

$$
P = \frac{969}{1024}
$$

... nope...
the simulation gives 784.

How about:

$$
P = \frac{_4C_3 \times 3^5 - _3C_2 \times 2^5}{4^5}
$$

... that gives a numerator of 876

## Commands

Unix:

```
java Beans 1e9 | Out-File -FilePath .\3bean5data.csv -Append -Encoding utf8
```

Windows:

```
java Beans 1e9 | Out-File -FilePath .\3bean5data.csv -Append -Encoding utf8
```

$$
$$
