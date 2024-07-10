## Original problem

3/31/2024

I'm at my friend's and he's made a chili with 11 different beans; each ladle has 140 beans; what is the odds of a ladle not containing at least one of all 11 beans?

I suggested calculating the odds of not getting bean A, and then add that probability 10 more times... But my friend says that can't work

So do you mean supposing bean A is the forbidden bean, then you have to pick 140 non-A beans in a row, with probability (10/11)^140 = 1.6e-6. But then that's favoring a particular bean A, so the probability is about 11 times higher?

## Toy problem

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
