n_types = 4
ladle_size = 5

types = [chr(ord("a") + i) for i in range(n_types)]


def propagate(letters: str) -> list[str]:
    return [letters + next for next in types]


items = types.copy()

for _ in range(ladle_size - 1):
    items = map(propagate, items)
    items = [x for xs in items for x in xs]


def is_incomplete(letters):
    for bean_type in types:
        if bean_type not in letters:
            return True
    return False


incomplete_count = 0
for permutation in items:
    if is_incomplete(permutation):
        incomplete_count += 1

print(incomplete_count, "of", len(items))
