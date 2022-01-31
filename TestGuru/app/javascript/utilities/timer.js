document.addEventListener('turbolinks:load', function(){
  let control = document.querySelector('.countdown')
  
  if (control) {
    isTrueSet = (control.dataset.timerPresence==='true')
    if (isTrueSet){
      control.classList.remove('hide')

      let seconds = Number(control.dataset.seconds)
      let minutes = Number(control.dataset.minutes)
      let hours = Number(control.dataset.hours)

      timer = setInterval(() => {
    
        if ( seconds > 0 ) {
          control.textContent = `${hours}:${minutes}:${--seconds}`
        } else if ( seconds == 0 && minutes == 0 && hours != 0) {
          seconds = 59
          minutes = 59
          control.textContent = `${--hours}:${minutes}:${seconds}`
        } else if ( seconds == 0 && minutes > 0) {
          seconds = 59
          control.textContent = `${hours}:${--minutes}:${seconds}`
        } else {
          clearInterval(timer)
          control.textContent = 'Time is up!'
          document.querySelector('.submit-button').click()
        }

      }, 1000);
    }
  }
})
