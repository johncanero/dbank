import { dbank2_backend } from "../../declarations/dbank2_backend"

window.addEventListener("load", async function() {
  // console.log("Finished loading"); 
  const currentAmount = await dbank2_backend.checkBalance();
  document.getElementById("value").innerText = Math.round(currentAmount * 100) / 100;

  // Set to two decimal places
});



document.querySelector("form").addEventListener("submit", async function(event) {
  event.preventDefault();
  console.log("submitted.");


  const button = event.target.querySelector("#submit=btn");


  const inputAmount = parseFloat(document.getElementById("input-amount").value);
  const outputAmount = parseFloat(document.getElementById("withdrawal-amount").value);

  button.setAttribute("disabled", true);

  // is not = 0
  if (document.getElementById("input-amount").value.length != 0) {
    await dbank2_backend.topUp(inputAmount);
  }

  const currentAmount = await dbank2_backend.checkBalance();
  document.getElementById("value").innerText = Math.round(currentAmount * 100) / 100;

  document.getElementById("input-amount").value="";
  button.removeAttribute("disabled");
});




