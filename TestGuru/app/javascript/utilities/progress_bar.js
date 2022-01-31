document.addEventListener('turbolinks:load', function(){
  const control = document.querySelector('.submit-button')

  if (control) {
    const progressBar = document.querySelector('.progressBar')
    const answersNumber = progressBar.dataset.answersNumber

    control.addEventListener('click', moveProgress(answersNumber, progressBar))
  }
})

function moveProgress(number, progressBar){
  let answerNumber = progressBar.dataset.currentAnswerNumber
  
  progressBar.style.width = Math.trunc((answerNumber-1)/number * 100) + "%"
}
