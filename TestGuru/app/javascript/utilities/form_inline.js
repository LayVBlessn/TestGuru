document.addEventListener('turbolinks:load', function(){
  let controls = document.querySelectorAll('.form-inline-link')

  for (let i = 0; i < controls.length; i++){
    controls[i].addEventListener('click', formInLineLinkHandler)
  }
  
  let errors = document.querySelector('.resource-errors')

  if (errors){
    let resourceId = errors.dataset.resourceId
    formInLineHandler(resourceId)
  }
})

function formInLineLinkHandler(event) {
  event.preventDefault()

  let testId = this.dataset.testId
  formInLineHandler(testId)
}

function formInLineHandler(testId) {

  let testTitle = document.querySelector('.test-title[data-test-id="' + testId + '"]')
  let editButton = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')
  let formInline = document.querySelector('.form-inline[data-test-id="' + testId + '"]')

  if (testTitle && editButton && formInline){
    if (formInline.classList.contains('hide')) {
        testTitle.classList.add('hide')
        formInline.classList.remove('hide')
        editButton.textContent = 'Cancel'
    } else {
        testTitle.classList.remove('hide')
        formInline.classList.add('hide')
        editButton.textContent = 'Edit'
    }
  }
}
