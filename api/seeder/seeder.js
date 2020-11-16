let buttonEl = document.querySelector('button');

let path = 'http://localhost/school/project/';
let count = 0;
buttonEl.addEventListener('click', (e) =>{
    e.preventDefault();
    let amount = 100 / 10;
    console.log(`amount: ${amount}`);
    fetch(`${path}api/classes/test.php`)
        .then((response) => response.json())
        .then((data) => console.log(data));
    // seed(amount);
    console.log('done');
});

// async function seed(amount) {
//     for (let i = 0; i < amount; i++) {
//         await
//         count++;
//         console.log(`seeded movie ${count}`)
//     }
//     return "done";
// }