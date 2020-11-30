window.addEventListener('load', function(){

    const priceInput = document.getElementById("item-price");
    const priceAddInput = document.getElementById("add-tax-price");
    const priceProfitInput = document.getElementById("profit");
    const inputValue = priceInput.value;
  
    priceInput.addEventListener('input', function(){
      const inputValue = priceInput.value;
      priceAddInput.innerHTML = inputValue * 0.1
      priceProfitInput.innerHTML = inputValue * 0.9
    })
  })