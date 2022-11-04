window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const fee = Math.floor(inputValue * 0.1);
    addTaxDom.innerHTML = `${fee}`;
    const profitDom = document.getElementById("profit");
    const profit = Math.floor(inputValue * 0.9);
    profitDom.innerHTML = `${profit}`;
  })
})