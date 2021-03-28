window.addEventListener('load',() => {
  console.log("OK");
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log(inputValue);
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor(priceInput.value*0.10);
  console.log(addTaxDom);
  const addProfit = document.getElementById("profit");
  addProfit.innerHTML = priceInput.value - priceInput.value*0.10 ; //0
  console.log(addProfit);
  })
});
