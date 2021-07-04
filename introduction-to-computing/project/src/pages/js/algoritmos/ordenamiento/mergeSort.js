// Mergesort
export const mergeSort = list => {

  if (list.length < 2) {
      return list; 
  }
  let mid = Math.floor(list.length / 2);
  let left = mergeSort(list.slice(0, mid));
  let right = mergeSort(list.slice(mid));
  return merge(left, right);
}

const merge = (sublist1, sublist2) => {
  let resultList = [];
  while (sublist1.length > 0 && sublist2.length > 0)
      resultList.push(sublist1[0] < sublist2[0] ? sublist1.shift() : sublist2.shift());
  return resultList.concat(sublist1.length ? sublist1 : sublist2);
}
