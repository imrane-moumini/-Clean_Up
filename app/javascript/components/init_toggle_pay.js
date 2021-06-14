const initToggle = ()=> {
console.log ('coucou')
const btn = document.querySelector('.btn-pay');
console.log (btn)
if (btn) {
  const toggle_pay = document.querySelector('.toggle-pay')
  console.log (toggle_pay)
btn.addEventListener('click',()=> {
console.log("a")
toggle_pay.classList.toggle('is-visible');
 });
  }
}

export {initToggle};
