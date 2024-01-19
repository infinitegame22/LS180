let trevorsBeauty = [1, 2, 6, 3, 9, 11, 15];

function prettySplice (array, start, deleteCount, ...elements) {
    let endingIndex = start + deleteCount;
    let newMiddle = elements;
    let newEnd = array.slice(start, endingIndex);
    let oldMiddle = array.slice(start, end);

    array.length = start;
    array.push(...newMiddle);
    array.push(...newEnd);
    console.log(array);

    return oldMiddle;
}

console.log(prettySplice(trevorsBeauty, 2, 4, 17, 90, 91, 94));
// implement splice method:
// arguments: array, start index, { end index, ...elements to insert}
// - mutate the original array
// - return new array of moved elements
// - remove from start to end
// - insert additional elements at the start index

