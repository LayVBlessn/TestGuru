document.addEventListener('turbolinks:load', function(){
  let control = document.querySelector('.timer')
  
  if (control){
    control.addEventListener('click', setTimer)
  }
})

function setTimer(){
  let timerValue = document.querySelector('.timer_value')

  if (timerValue.classList.contains('hide')){
    timerValue.classList.remove('hide')
  }else{
    timerValue.classList.add('hide')
  }
}
