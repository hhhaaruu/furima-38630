const { $ } = require("@rails/ujs");

//金額を入力した数値をpriceInputという変数に格納
window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      const addTax = document.getElementById("add-tax-price");
      const profit = document.getElementById("profit");
      addTax.innerHTML = Math.floor( inputValue * 0.1 );
      profit.innerHTML = Math.floor( inputValue - Math.floor( inputValue * 0.1 ) );
    });
});