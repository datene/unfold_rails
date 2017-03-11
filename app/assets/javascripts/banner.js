$(document).ready(function(){
  const items = [
  'love',
  'life',
  'work',
  'mind',
  'style'
  ]
  const app = document.getElementById('unfold-target')
  let count = 0
  let index = 0
  let typingEffect = () => {
    let text = items[index]
    if (count < text.length) {
      setTimeout(() => {
        app.innerHTML += text[count]
        count++
        typingEffect()
      }, Math.floor(Math.random(10) * 150))
    } else {
      count = 0;
      index = (index + 1 < items.length) ? index + 1 : 0
      setTimeout(() => {
        app.innerHTML = ''
        typingEffect()
      }, 1500)
    }
  }

  typingEffect()
})