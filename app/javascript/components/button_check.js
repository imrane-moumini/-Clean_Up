
  function toggleClass() {
    this.classList.toggle('active');
  }

  function addClass() {
    this.classList.add('finished');
  }

const initButton = () => {
  const button = document.querySelector('.button');
  const submit = document.querySelector('.submit');

if (button) {
  button.addEventListener('click', toggleClass);
  button.addEventListener('transitionend', toggleClass);
  button.addEventListener('transitionend', addClass);
  }
}



export{initButton};

