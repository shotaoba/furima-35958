function price(){
  const itemPrice = document.getElementById("item-price")
  const addTaxPrice = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")
  const tax = 0.1
  console.log(itemPrice)
  itemPrice.addEventListener("input", () => {
    console.log("OK")
    const saleFee = itemPrice.value * tax
    addTaxPrice.innerHTML = saleFee
    const saleProfit = itemPrice.value - saleFee
    profit.innerHTML = saleProfit
  })
}
window.addEventListener('load', price)