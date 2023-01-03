var inpE = document.getElementById('inp_text_post')
var btn = document.getElementById('btn_post')
var imgE = document.getElementById('inp_img')
var remove = document.getElementById('remove')

inpE.addEventListener('input', function(){
  if((inpE.value === "")){
    btn.disabled = true
    btn.style.cssText = 'cursor: not-allowed !important'
  }else{
    btn.disabled = false
    btn.style.cssText = 'cursor:pointer !important'
  }
})

remove.addEventListener('click', (e) => {
  output.src = ""
  imgE.value = ""
  btn.disabled = true
  btn.style.cssText = 'cursor: not-allowed !important'
})

imgE.addEventListener('input', function(){
  if((imgE.value === "")){
    btn.disabled = true
    btn.style.cssText = 'cursor: not-allowed !important'
  }else{
    btn.disabled = false
    btn.style.cssText = 'cursor:pointer !important'
  }
})