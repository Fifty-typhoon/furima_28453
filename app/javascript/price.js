window.addEventListener('load' , function() {
  const priceInput = document.getElementById("item-price")
  let addTaxPrice = document.getElementById("add-tax-price")
  let profit = document.getElementById("profit")

  priceInput.addEventListener('keyup', function() { 
    console.log("ok");
    const primeValue = priceInput.value;

    if (primeValue >= 300 && primeValue <= 9999999) {
      let fee = primeValue / 10
      let benefit = primeValue - fee
      addTaxPrice.textContent = fee;
      profit.textContent = benefit;
    } else {
      let fee = '-'
      let benefit = '-'
      addTaxPrice.textContent = fee;
      profit.textContent = benefit;
    }
  })
})