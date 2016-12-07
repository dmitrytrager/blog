$ ->
  $('a.title-link').on "click", (event) ->
    event.preventDefault()
    alert("Hello")