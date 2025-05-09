// window.addEventListener('turbo:load' , () => {console.log("OK")})

const price = () => {
    const priceInput = document.getElementById("item-price");
    console.log(priceInput);
    priceInput.addEventListener("input", () => {
        const inputValue = priceInput.value;
        console.log(inputValue);
        const addTaxDom = document.getElementById("add-tax-price");
        addTaxDom.innerHTML = inputValue*0.1
        const addProfitDom = document.getElementById("profit")
        addProfitDom.innerHTML=inputValue-(inputValue*0.1)
    })
}

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);