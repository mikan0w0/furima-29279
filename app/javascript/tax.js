
if (document.URL.match( /new/) || document.URL.match( /edit/)) {
  function tax(){
    const priceinput = document.getElementById("item-price");
    const taxprice = document.getElementById("add-tax-price");
    const putprofit = document.getElementById("profit");
    
    priceinput.addEventListener("input", function(){
      const price = priceinput.value
      const tax = Math.round(price * 0.10);
      const profit = (price - tax);
      taxprice.innerHTML = tax;
      putprofit.innerHTML = profit;
    });
  };
  window.addEventListener("load", tax);
};