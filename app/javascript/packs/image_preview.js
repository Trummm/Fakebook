const input = document.getElementById('inp_img')
const output = document.getElementById('output')
const remove = document.getElementById('remove')
const imgE = document.getElementById('inp_img')

input.addEventListener('change', (e) => {
  if (e.target.files.length){
    const src = URL.createObjectURL(e.target.files[0])
    output.src = src;
  }
})

remove.addEventListener('click', (e) => {
  output.src = ""
  imgE.value = ""
})