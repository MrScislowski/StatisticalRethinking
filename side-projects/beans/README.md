## Problem

 You make a pot of chili with 11 different beans. Each ladleful has 140 beans. What is the odds of a ladle not containing at least one of all 11 beans?

 ## Solution

 $$
 P = \frac{\text{\# ways to pick 140 beans with } \ge 1 \text{ bean type missing}}{\text{\# ways to pick 140 beans with no restrictions}}
 $$

 $$
 P = \frac{
    C(11, 10) \cdot 10^{140} - 
    C(11, 9) \cdot 9^{140} +  
    C(11, 8) \cdot 8^{140} - 
    C(11, 7) \cdot 7^{140} +  
    C(11, 6) \cdot 6^{140} - 
    C(11, 5) \cdot 5^{140} +  
    C(11, 4) \cdot 4^{140} - 
    C(11, 3) \cdot 3^{140} +  
    C(11, 2) \cdot 2^{140} - 
    C(11, 1) \cdot 1^{140} 
    } { 11^{140} }
$$

where $C(n, k)$ is the number of $k$-combinations of a set of $n$ elements, given by $C(n, k) = \frac{n!}{k! (n - k)!}$

This evaluates to

$$
P \approx 1.763664 \times 10^{-5}
$$

Using an approximate non combinatorical approach,

$$
P = \frac{11 \cdot 10^{140}}{11^{140}} \approx 1.763668 \times 10^{-5}
$$

The combinatorial (exact) answer is 99.9998\% the size of the approximate answer.