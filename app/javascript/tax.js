function tax (){
  const itemPrice  = document.getElementById("item-price");
  itemPrice.addEventListener("input", () => {
    const fee = Math.floor(itemPrice.value * 0.1);
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = `${Math.floor(fee)}`;
    const SalesProfit = Math.floor(itemPrice.value - fee) ;
    const profit = document.getElementById("profit");
    profit.innerHTML = `${Math.floor(SalesProfit)}`;
  });
}

window.addEventListener('load', tax);