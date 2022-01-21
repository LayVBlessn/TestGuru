document.addEventListener('turbolinks:load', function(){
  const control = document.querySelector('.passwords')

  if (control) {
    control.addEventListener('input', checkPasswords)
  }
})

function checkPasswords(){
  let password = document.getElementById('user_password')
  let passwordConfirmation = document.getElementById('user_password_confirmation')

  if (passwordConfirmation.value != ""){
    if (password.value != passwordConfirmation.value){
      passwordConfirmation.style.borderColor = 'red'
    }
    else{
      passwordConfirmation.style.borderColor = 'green'
    }
  }
  else{
    passwordConfirmation.style.borderColor = 'grey'
  }
}