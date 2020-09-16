function tax(){
  const priceinput = document.getElementById("item-price");
  const taxprice = document.getElementById("add-tax-price");
  const putprofit = document.getElementById("profit");
  
  const tax1 = 0.10
  priceinput.addEventListener("input", function(){
    const price = priceinput.value
    const tax = Math.round(price * tax1);
    const profit = (price - tax);
    taxprice.innerHTML = tax;
    putprofit.innerHTML = profit;
  })
}
window.addEventListener("load", tax);
