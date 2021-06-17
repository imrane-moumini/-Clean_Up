const initButton = () => {
  const button = document.querySelector('.button');
  const submit = document.querySelector('.submit');
  const check = document.querySelector('#check-button')

if (button) {
  button.addEventListener('click', toggleClass);
  button.addEventListener('transitionend', toggleClass);
  button.addEventListener('transitionend', addClass);
  }

  function toggleClass() {
    this.classList.toggle('active');
  }

  function addClass() {
    this.classList.add('finished');
    check.click()

  }

}

export{initButton};

