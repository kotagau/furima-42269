window.addEventListener('turbo:load', () => {console.log("OK");});

const priceInput = document.getElementById("item-price");
console.log(priceInput);
priceInput.addEventListener("input", () => {
const inputValue = priceInput.value;
console.log(inputValue);
})

const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = "item-price/10"