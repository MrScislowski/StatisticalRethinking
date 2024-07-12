items = ["a", "b", "c"]


def propagate(letters: str) -> list[str]:
    return [letters + "a", letters + "b", letters + "c"]


items = map(propagate, items)
items = [x for xs in items for x in xs]


items = map(propagate, items)
items = [x for xs in items for x in xs]


items = map(propagate, items)
items = [x for xs in items for x in xs]


items = map(propagate, items)
items = [x for xs in items for x in xs]

print(len(items))

count = 0
for string in items:
    if "a" not in string or "b" not in string or "c" not in string:
        count += 1

print(count, "of", len(items))
