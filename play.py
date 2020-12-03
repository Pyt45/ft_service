doc_list = ["The Learn Python Challenge Casino.", "They bought a car and a casino","Casinoville"]
keywords = ['casino', 'they']
def word_search(doc_list, keyword):
  index = []
  for i, doc in enumerate(doc_list):
    tokens = doc.split()
    rsl = [token.rstrip(',.').lower() for token in tokens]
    if keyword.lower() in rsl:
      index.append(i)
  return index

def multi_word_search(doc_list, keywords):
  dic = {}
  for keyword in keywords:
    dic[keyword] = word_search(doc_list, keyword)
  return dic

print(multi_word_search(doc_list, keywords))