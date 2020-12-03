dataset = [{'name': 'Peach', 'items': ['green shell', 'banana', 'green shell'], 'finish': 3}, {'name': 'Peach', 'items': ['green shell', 'banana', 'green shell'], 'finish': 1}, {'name': 'Bowser', 'items': ['green shell'], 'finish': 1}, {'name': None, 'items': ['green shell'], 'finish': 2}, {'name': 'Bowser', 'items': ['green shell'], 'finish': 1}, {'name': None, 'items': ['red shell'], 'finish': 1}, {'name': 'Yoshi', 'items': ['banana', 'blue shell', 'banana'], 'finish': 7}, {'name': 'DK', 'items': ['blue shell', 'star'], 'finish': 1}]

def best_items(racers):
  winner_item_counts = {}
  for i in range(len(racers)):
    racer = racers[i]
    if racer['finish'] == 1:
      for item in racer['items']:
        if item not in winner_item_counts:
          winner_item_counts[i] = 0
        winner_item_counts[i] += 1
    if racer['name'] is None:
      print("WARNING: Encountered racer with unknown name on iteration {}/{} (racer = {})".format(
          i+1, len(racers), racer['name'])
            )
  return winner_item_counts
best_items(dataset)