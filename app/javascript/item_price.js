window.addEventListener('load',() => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor(priceInput.value*0.10);
  const addProfit = document.getElementById("profit");
  addProfit.innerHTML = priceInput.value - priceInput.value*0.10 ; //0
  })
});
