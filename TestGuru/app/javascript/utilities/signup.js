document.addEventListener('turbolinks:load', function(){
  var control = document.querySelector('.signup')

  if (control) {
    document.querySelector('.passwords').addEventListener('input', checkPasswords)
  }
})

function checkPasswords(){
  var password = document.getElementById('user_password')
  var passwordConfirmation = document.getElementById('user_password_confirmation')
  
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
